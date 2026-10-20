# FIX-PKG-AdditiveCombinatorics~adv

Issue #11474; Codex, session `codex-ppGTdE`; 2026-10-20.

The package fixes and the source/adversarial audit are submitted for this job's
independent review. The package verdict remains **needs_changes**, for the precise
external prerequisites below. This report does not certify an upstream ordering
or claim that the proposed theorems have been formalised.

The issue's named `REV-PKG-AdditiveCombinatorics~adv.md` was absent from the
checkout and returned 404 from GitHub. I used the existing
`research/blueprint/reviews/REV-PKG-AdditiveCombinatorics.md`, the issue's full
instructions, the accepted packet and the package resulting from merged #11459
(`0e9de714bf6bd2e4cc909af238cd0d84d2255bb9`). That preceding fix already supplied
substantial proof contracts. I checked those contracts, retained its valid
repairs and corrected the further defects described here. This is a fix report,
not an independent review of my own changes.

While this PR was open, the independent round-2 review #11483 merged as
`46c14f000`. I rebased on main and reconciled its corrections as mathematical
data. In particular, the resulting package preserves its composite-modulus
Varnavides bridge, polynomial-recurrence placement and length conditions,
source-ordered Host–Kra factors, current-library ownership, containing ideal
for localisation, arithmetic domain checks and closed Lipschitz-boundary
contract. The additional source-ordered one-cube check is `(a,ba)`, with
`b=g(1)g(0)⁻¹`; it agrees with the chosen derivative orientation.

Only the four issue-authorised deliverables change: the package README,
Suggested.lean, review.json and this handoff. The packet, order file, other
packages and upstream checkouts are unchanged.

## Finding dispositions

| Finding from the review | Disposition in the resulting package |
| --- | --- |
| Supplier ordering, availability and overlapping ownership | Consume the actual open Geometry, AnalyticNumberTheoryPartI, LFunctions and ZerosOfLFunctions contracts by section, rather than treating atlas plans as upstream implementations. Consume maximal divisor order and number-field Mertens instead of replanning them. Separate finite-order Hecke analysis from unitary continuation and bounded archimedean estimates. Record the finite-Fourier package cycle and unresolved tier/bundle. External residue remains; see below. |
| Regular Bohr sets, cyclic lattice and properisation | Retain the preceding fix's public regular-radius proof, the cyclic-coordinate lattice construction and the rank/volume induction, after source and degenerate-case checks. The cyclic coordinate retains injectivity for nonfaithful frequency families; the rank is at most `d+1`. Minkowski's second theorem is consumed from Geometry §1.5.21. |
| Exact Rahman numerical proof | Retain the independent elementary Fourier proof in AC.2.10, which supplies a stronger threshold without needing the unavailable Rahman note. Repair its length recurrence: `log k ≥ 2^T(a+2b)`, not `2b+2^T a`. Add `0<N` to the Lean increment theorem; its earlier `N=0` instance had a meaningless density. |
| Filtered Taylor/BCH/metric, efficient equidistribution and inverse theorem | Correct the Host–Kra normal form to the `2^k` upper faces and Taylor peeling to unit-step derivatives. Pin the derivative orientation by two noncommuting permutations in README and proved Lean example. Correct the refined bracket alternatives, unequal-side bounds, bilinear modulo-one conclusion and progression rank. Add indexed filtration/polynomial, nilcharacter, finite-witness equivalence and correlation-structure definitions with APIs and discriminating Checks. Supply the quadratic base and the actual sunflower, linearisation, rank-reduction and final integration contracts, in the source's order with separate parameter budgets. |
| General selected-subproduct densification and smooth cutoff analysis | Retain the general relative-hypergraph induction and cutoff Fourier/Euler-product/bad-box contracts from the preceding fix. Correct the box-moment root and the arithmetic simplex adapter. Clarify that deleting the small-prime Euler factors yields `(W/φ(W))^m` in the smooth moment. |
| Sharp majorant, repeated shifts and all moments | Retain the explicit nonzero-shift Euler kernel; choose its value at zero to dominate the full `m`-fold coincident moment. Show that the zero point contributes `N^{-1+o(1)}` to every fixed moment. Delete the duplicate local divisor-bound target and Lean declaration; consume AN Part I §3.7. |
| Weighted structure theorem and unbounded tails | Supply a named basic dual with its API/Checks; an arbitrary fixed-degree dual-polynomial bound, all fixed moments and Markov tail bound; continuous orthogonality; weighted level partitions; and the energy increment/quantifier order. Require partitions of dual functions for the conditional-mean conclusion, which would be false for arbitrary partitions. |
| Ideal Type I/twisted Type I/Type II and convex/module counting | Correct the ideal norm scale `X≍N^n`, divisor cuts, divisor moment exponent, prime-model residue and model domains. Specify the selected-sum hypotheses, character sizes/smoothness and common commutator annihilator; retain the original prime-residual correlation for assembly. Replace the false antidiagonal group argument. Supply phase absorption with the common-kernel alternative, discrete boundary error, rank preservation modulo the embedding prime and the small-box alternative. Consume current-library ideal weights/characters and the finite Brun supplier. Retain the concurrent review's containing-ideal construction. Mitsui's bounded-archimedean input and the labelled-ideal sieve adaptation remain explicit external residue. |

The earlier review's controls remain: positive-order interval transport; the
two-term one-sided interval counterexample; explicit Lie/model hypotheses;
positive endpoint dimensions, periods and smoothness bounds; denominator-cleared
smoothness comparison; convex-only Cramér comparison; common-rational-prime local
factors; and the distinction between qualitative fixed-modulus PNT and
Siegel–Walfisz errors.

## External residue and where to resume

1. **Certify supplier-first delivery.** AdditiveCombinatorics still has no tier
   or bundle in `upstream/CaraianiNewton.md`. The four submitted supplier PRs
   below remain open; a submitted supplier is not already upstream. The
   FiniteFieldsAndCharacterSums and ExponentialSumsAndCircleMethod packages have
   no exact corresponding open package PR in the inspected upstream list.
   AutomorphicLFunctionsAndLocalFactors is also an atlas contract rather than
   a package on the inspected main. The maintainer must establish an allowed
   lower-tier/bundle order, including the requested analytic extension.
2. **Resolve the finite-Fourier cycle.** FF.1 consumes AC.0's `fourier` and
   Parseval, while AC.5.9 consumes FF.2's multiplicative-character Weil bound.
   Move the general finite-Fourier interface to an agreed lower owner, or
   authorise a joint bundle. No such ownership change or bundle is invented
   in this patch. The independent AC.5.1 Waring application can consume ES
   Layers 4–5 once its ordering is certified.
3. **Supply the bounded-archimedean prime estimate.** AC.5.8 names
   `bounded_archimedean_prime_ideal_estimate`: for characters of
   `C_K(𝔮)/ℝ_{>0}` with infinity parameters bounded by `H`, uniform prime sums
   in the range `N(𝔮)H^n≤exp(c_K√log X)`, with trivial and exceptional main
   terms and error `O_K(X exp(−c'_K√log X))`. The analytic conductor includes
   the infinity parameters. Route the quantitative zero/prime-estimate
   extension to **ZerosOfLFunctions, Part II**, consuming unitary rank-one
   continuation from **AutomorphicLFunctionsAndLocalFactors AL.2,
   `global-godement-jacquet`**. This respects the 2026-10-19 Tate rule.
   Neither finite-order LFunctions Layer 5 nor algebraic Layer 6 supplies
   this estimate. Kai's Mitsui note v3, Theorems 2.3.1–2.3.2, p. 9, does not
   state the needed archimedean restriction. The norm twist `N(𝔠)^{iu}` has
   `L(s)=ζ_K(s−iu)` and a pole at `1+iu`, providing a direct counterexample
   to its unrestricted unitary formulation. The radial quotient excludes
   that twist but still needs bounded angular/unit parameters. The README
   records the conditional sector-to-convex reduction, not a supplied proof.
4. **Supply the labelled-ideal sieve adaptation.** SieveMethodsAndPrimePatterns
   §1.2 supplies `SieveBrun.brun_fundamental_estimate`, with
   `β=9κ+1`, `u≥β`, error `exp(β−u)K_s^10` and an actual remainder mass.
   I read its coefficient, support, dimension and remainder contracts. It is
   a partial supplier, not a missing finite Brun theorem. Kai Lemma B.2,
   p. 64, needs distinct prime-ideal labels, their norms as weights, the
   product-dimension estimate and the norm-cutoff sum of lattice errors.
   Two different primes over the same rational prime can have the same
   norm, so replacing labels by norms loses factors; prime-ideal norms
   can also be nonprime. Route this extension to
   **SieveMethodsAndPrimePatterns, Part II**, consuming its existing finite
   combinatorial estimate and number-field Mertens. No second general
   sieve theorem is assigned to AdditiveCombinatorics.
5. **Route a separate incoming request.** SieveMethodsAndPrimePatterns asks
   AC.1 for a squarefree-ring sum-product theorem and a noncommutative BSG
   theorem. Those are not statements of this package. That incoming request
   needs a real owner/extension; it is distinct from the partial sieve
   supply in item 4 and from the divisor majorants owned here.

These changes need other packets or the programme's ordering authority, outside
this issue's four permitted paths. The README's exact supplier contracts and
this handoff contain the concrete requests; review.json retains `needs_changes`
until they are supplied and ordered. Resume from these requests, not from the
old broad list of seven unexplained proof gaps.

## Supplier and library audit

The pinned baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The current read-only roadmap checkout
is `0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No build was run in either current
checkout. I read the reviewed library-coverage audit and searched mathematical
objects, fields and operators across the current roadmaps/library, including
the nine roadmaps newer than the atlas snapshot and the Completed roadmaps.

The comparison pairs were AlgebraicCodingTheory and
RepresentationTheory/LieGroups: their READMEs, declaration inventories and the
relevant Suggested.lean statements. Coding's weight-enumerator Fourier analysis
does not duplicate the general probability/counting-normalised finite-group
interface. LieGroups supplies general exponentials, BCH and closed subgroups;
AC's nilpotent global specialisation remains distinct. IntegralLattices does
not supply the general successive-minimum body-volume estimate. DenseGraphLimits
does not supply this layered directed removal theorem. Entropic optimal
transport and logarithmic/Kullback inequalities are not the Shannon/Ruzsa API.

The used pinned additive-character, DFT, weighted-inner-product, convolution,
energy and Haar signatures were read. For the new Chang adapter I read
`AddDissociated`, the signed `Finset.addSpan`,
`Finset.exists_subset_addSpan_card_le_of_forall_addDissociated` and
`AddDissociated.randomisation` at the Mathlib pin. The mean-one Riesz product
and maximal-dissociated-subset argument use these existing carriers/results,
rather than a second dissociation development.

**Removal:** `card_divisors_le_exp`, including the Lean declaration, is deleted;
the needed maximal order is owned by AN Part I §3.7. **Supplier retained from
the preceding review:** the current Tau Ceti declaration
`NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`
counts the rational field's prime ideals in unit classes. Identifying rational
primes and partial summation supplies only fixed-modulus `θ∼x/φ(m)` for
AC.4.15. It is newer than the pin and is not imported into Suggested.lean.

**Concurrent ownership correction retained and checked:** I read
`TauCeti.IdealArithmeticFunction.vonMangoldt`, `vonMangoldt_one`,
`vonMangoldt_apply_prime_pow`, its zero-off-prime-powers characterisation,
`vonMangoldt_im`, `vonMangoldt_re_nonneg` and `norm_vonMangoldt_le_log`
in current Tau Ceti's ArithmeticDirichletSeries/VonMangoldt module, lines
84–184. Its carrier is the nonzero integral ideals and its codomain is
complex with real nonnegative values. AC.5.8 now adds only the
fractional-ideal element pullback and zero extension. I also read
`TauCeti.GlobalNumberFields.HeckeCharacter.idealCharacter` and
`idealCharacter_apply_toIdealsAway`, `idealCharacter_apply_prime`,
`idealCharacter_apply_toPrincipalIdeal` in the Global/HeckeCharacter/Ideal
module, lines 117–201: a multiplicative character on fractional ideals
prime to the finite conductor, with the principal-ideal value retaining
the inverse infinity-component product. These later-current declarations
are consumed in the README and are not imported at the older Lean pin.

The following exact PR heads were inspected as mathematical data and their
open states rechecked on 2026-10-20:

| Supplier | Inspected head and consumed contract |
| --- | --- |
| [Geometry #851](https://github.com/TauCetiProject/TauCetiRoadmap/pull/851) | `01c64f0cc5f154a3d190697951ead2fffc2af693`; §1.5.21, `minkowski_second_upper`, with the same Haar measure for volume and covolume. |
| [AN Part I #1126](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1126) | `23d3de1ceddedf160130057c5e7c58a2173a7468`; §§0.32, 0.33, 1.2, 2.31f and 3.7: quantitative rational progression estimates, zeta bounds, regularized order-two Hecke bounds and maximal divisor order. |
| [LFunctions #248](https://github.com/TauCetiProject/TauCetiRoadmap/pull/248) | `affb2d0e03eeba7addf25dc4c72dd20643863fb8`; Layers 5 and 8: finite-order Hecke objects/presentations and number-field Mertens. No unrestricted unitary continuation is inferred from Layer 6. |
| [Zeros #253](https://github.com/TauCetiProject/TauCetiRoadmap/pull/253) | `cce2e04188a559be9a16037d0d65e00a815fcecc`; 6.4 and 6.4a–b give the finite-order per-character zero-free region and common-modulus positivity, not family uniqueness or the bounded-archimedean estimate. |

AC.5.8 now owns the explicit family-level `hecke_landau_page` adapter and
`hecke_siegel_lower_bound`, using those contracts. It does not duplicate the
supplier's continuation. No theorem of Tate's thesis is a target or source.

## Adversarial pass on touched statements

Rows include the listed definitions and their named API identities. Cases
outside a stated domain are negative controls, not asserted instances. The
computations test the planned mathematics; `sorry` elaboration is separate.
Statements retained from the preceding fix are identified as such.

| Statement/API | Instances and computation | Result/change |
| --- | --- | --- |
| Supplier Minkowski upper bound | Dimension zero; lattice rescaling; Haar measure multiplied by `c>0` | Empty product and both measure factors scale consistently; consume, do not redevelop. |
| Rational PNT conversion | Modulus one; unit class; nonunit class | Partial summation turns `π∼Li/φ` into `θ∼x/φ`; no log-power error or growing-modulus uniformity. |
| Zeta and maximal divisor contracts | Pole `s=1`; `n=3`; large prime; equal shifts | Regularized zeta and reciprocal-zero conventions retained; finite small range absorbed before use. |
| Finite-order and unitary Hecke ownership | Principal character; quadratic character; norm twist `N^{iu}` | Distinct domains and poles now explicit. |
| Bohr regularity/shrink/translate (AC.1.22–23, retained) | Rank zero; `ZMod 4` jump radius `1/4`; stable radius `1/24`; zero translation | Rank-zero case separate; jump does not qualify as regular; positive-radius assumptions retained. |
| Cyclic Bohr lattice (AC.1.28, retained) | `N=1`; no frequencies; only trivial frequency on `ZMod 4` | Lattice `ℤ^{d+1}+ℤv` has covolume `1/N`; first coordinate makes the map injective on the chosen body; rank `d+1`. |
| Properisation (AC.1.29, retained) | Rank zero; zero/repeated steps; interval; torsion ambient excluded | Source rank/volume induction applies to torsion-free ambient groups; carrier size and volume stay distinct. |
| `chang_large_spectrum` | Full group, density one; singleton; threshold `ε=1` | Full-group spectrum is `{0}` and empty signed generators suffice; relative threshold `εα` and nonempty `A` are required. |
| Riesz-product Chang proof | One nontrivial character; zero character excluded by dissociation; `|t|≤1/2` | Mean product is one; `E_A log P≥mε²/4`; Jensen gives `m≤4ε^{-2}log(1/α)`. |
| `coset_progression_contains_bohr` | Rank-zero subgroup `{0,2}` in `ZMod 4`; full group; symmetric rank-one progression | Frequency two and radius `1/4` recover that subgroup; `r+1` and `max(R,1)` prevent false zero rank/radius bounds. Even convolution powers have nonnegative selected real parts, not necessarily real individual terms. |
| Degree filtration and `DegreeRankFiltration` APIs | Trivial group; additive line at `(1,1)`; purported `(1,0)` line | Rank zero lowers degree; equality of rank-zero/rank-one levels is essential. |
| `MultidegreeFiltration` APIs | One variable; additive line on downset `{0,1}²`; no positive generators | Associated degree can be two for a step-one group; deleting nontrivial levels is not an allowed restriction. |
| `IsIndexedPolynomial` APIs | `g(h,n)=hn`; `g(h,n)=h²`; linear degree-rank sequence; empty derivative list | Mixed derivative is one, repeated coordinate derivative is zero for `hn`, but two for `h²`; raw domain DR filtration does not satisfy the codomain's extra normalisation. |
| `filteredDerivative` | `g(n)=a^n b`, `a=(0 1)`, `b=(1 2)`, at `h=1,n=0` | Chosen derivative is `(0 1)`; opposite order is `(0 2)`. Both the general identity and finite noncommutative test are proved in Lean. |
| Host–Kra cube normal form | `k=0,1,2`; one-cube values `(a,ba)`; noncommuting transpositions | Use `2^k` upper faces, singleton first and whole cube last; coefficient is `b=g(1)g(0)⁻¹`. All-face generation is not a unique normal form. |
| Filtered Taylor expansion/closure | Constant; linear; `a^{binom(n,2)}` at directions one and two | Low unit-step derivatives at zero vanish; direction two gives `a`. No arbitrary-direction vanishing is inferred. Integer-binomial order and noncommutative multiplication retained. |
| BCH/Mal'cev metric interfaces (retained) | Point group; circle; Heisenberg; first/second-kind coordinates | Global nilpotent exponential is a specialisation; coordinate changes and quotient metric comparisons retain rational-height losses. |
| `refined_bracket_polynomial` | Rank zero or `r=d`; `N` below threshold; `K/N>1/100` | Small-domain/large-error alternatives retained; progression rank is at most `d`. |
| Multiparameter bracket lemma | Unequal sides `N_1=2`, `N_2` large; one parameter | Each conclusion uses its own `N_j`, never the largest side everywhere. |
| Bilinear bracket lemma | Integral nonzero `w·a`; zero bilinear part; one parameter | Conclusion uses distance modulo one, rather than falsely bounding its absolute value. |
| Efficient equidistribution/vertical reduction | Step-one torus; zero observable; zero frequency; smallest box side | Nonzero frequency is additional data; quotient is by the kernel inside the central subgroup, and short-side alternative retained. |
| `Nilcharacter` and norm/vertical/conjugate/tensor APIs | Circle phase; vector `(1,1)/√2`; zero observable | Sphere norm is one, not modulus one in each coordinate; zero vertical functions are excluded. |
| `NilcharacterEquivalent` APIs | Phase against itself; constant phase shift; `e(n/3)` against one; two-torus vector observable | Finite witnesses retain conjugation; nonconstant degree-one phase is not degree-zero equivalent. Vector self-products can have lower-degree variation, so reflexivity requires a sufficient downset. |
| `CorrelatesWithLowerDegree` APIs | `(1,1)` and `(1,−1)` on `[2]`; zero vector; product witnesses | Full-domain bias is respectively one/zero at degree zero; equivalent-factor transfer retains the witness, maximum degree, product dimension and parameter loss. |
| `CorrelationStructure` APIs | `f=1` on `[4]`, `H={1}`; zero `f`; unrelated observables indexed by `h` | Derivative bias is `3/4`, so `ρ=1/4` works; zero fails; common manifold/observable/frequency is actual data. |
| Quadratic inverse base | Constant; linear phase; odd cyclic embedding; even-order ambient excluded | Bounded input implies Leng's `L^{1024}` hypothesis; smoothed phase conversion retains cutoff Lipschitz loss. No arbitrary-even-group inverse is imported. |
| Initial inverse correlation structure | Large `N`; trivial initial common nilcharacter; shared observable | Induction supplies the separate family; it does not already assert the common factor of Theorem 6.4. |
| Additive quadruple correlation | Constant family; `s=2`; translated overlap | Count scale is `N³`; preserve conjugations/shifts and the `O(1/N)` phase correction when `s=2`. |
| Sunflower step | `r*=1`; two dependent inputs; trivial dependent spaces | Two-dependent-input vanishing is vacuous at rank one; rational-space heights and correlation loss remain distinct. |
| Linearisation step | One linear frequency; integral fractional part; zero petal | Keep signed fractional parts, the rational prime denominator and the one-petal/two-linear commutator conditions. |
| Degree-rank reduction | `r*=1→0`; `s=3`; small interval | Strong exponential length threshold retained; rank zero lowers degree and is absorbed only after reduction. |
| Symbol integration and small-interval inverse | `N=1`; point-supported `f`; constant and mean-zero phases | A circle bump supported at one orbit point gives `δ/N` with `O(N)` Lipschitz cost; no nonzero derivative shift is required at `N=1`. Integration follows rank reduction. |
| Interval von Neumann contract | `k=2` counterexample; `k=3`; zero Gowers norm | Keep `k≥3`; no-wrap prime, Fourier rectangle tail and phase absorption give the stated weakened exponent. Zero norm handled before division/optimisation. |
| Roth density increment | `N=0`; positive density near one; `α²N=9700`; affine block | Add positive `N` in Lean. At the threshold, `ηN≥128π` supplies the floor bound for block length; positive increments cannot continue past density one. |
| Rahman iteration | `δ=1/2`; length at step `T−1`; `δ=10^{-5}` | Correct recurrence includes `2b` inside `2^T`; increment count is below `66/δ` and sufficient initial log-length is below `2^{132/δ}`. |
| `basicGowersDual` and pairing/dual-norm/constant/∞ APIs | `r=2,F=2`; sign on `ZMod 2`; point mass | Dual values `8`, sign, and `N^{-r}1_0`; pairings `16`, one, and `N^{-(r+1)}` respectively. Nonzero cube vertices and averaging matter. |
| Dual-polynomial/all-moment tail bound | Polynomial degree 20 with four-shift correlation; repeated moment order; zero row excluded | Moment order is unbounded but fixed; nonzero `±1` rows are uniform. `E T1_{T>R}≤C_qR^{1-q}` does not assume bounded `ν` or `τ`. |
| Continuous dual orthogonality | Constant polynomial; uniform error `a`; compact family of tests | Approximation error is at most `aE(ν+1)`; polynomial pairing uses Gowers closeness. |
| Weighted dual partition | Constant dual; a singleton carrying weight; arbitrary indicator partition | Continuous cell approximants have weighted error. Conditional mean near one requires partitions of duals; arbitrary partitions do not meet that conclusion. |
| Weighted energy increment | Zero residual; refinement; exceptional cells with tiny mass | Energy is at most `1+o(1)` on retained cells; use weighted `L¹` errors and fix iteration count before boundary resolution and `N`. |
| Relative counting/simplex adapter | `k=3`, coordinates `(1,2,4)` mod 11; modulus one; zero index | `(a,r)=(10,4)` gives `(10,3,7)`; determinant-one columns give surjectivity. No inversion of the zero coordinate. |
| Cut-to-box/strong forms/densification | Dense case `ν=1`; empty selected subproduct; missing one subproduct | Moment error `O(η)` gives cut error `O(η^{1/2^{k-1}})`. General induction uses every selected product, not just the full one. |
| Smooth cutoff/Fourier and bad-box contracts (retained) | Divisor one; prime above cutoff; empty product; one window boundary | `χ(0)=1`, rapid decay and `c_χ>0` retained; bad boxes use uniform local moments, not only their volume fraction. |
| Small-prime Euler normalisation | One form; `p|W`; compare `W=6`, `φ(W)=2` | Small-prime factors of the full zeta product are removed, giving `W/φ(W)`, not its reciprocal, in the moment. |
| Sharp repeated-shift kernel | Two equal shifts; all `m` shifts equal; fixed moment `q` | Set `τ(0)≥‖ν‖∞^m`; its moment contribution is `N^{-1+o(1)}`. Consume AN's maximal divisor bound. |
| Module normal form/finite-field VN | Coordinate map; common kernel; distinguished map rank `n` | All input functions one-bounded; complexity forces full rank and hence `n≤d`. |
| Phase absorption | Forms `x,y` on `𝔽_p³`, frequency `z`; `s=1` | Common-kernel averaging gives zero when the frequency cannot be absorbed. Otherwise linear phases preserve `U^{s+1}`. |
| Convex grid boundary | Interval shorter than `1/p` centred at a grid point; point convex body | Grid mass can be `1/p` despite tiny volume; retain `C_d(1/M+1/p)`. |
| Finite-field convex optimisation | `δ_p=0`; `δ_p≥p^{-(2d+2)}`; smaller positive `δ_p` | Large regime absorbs grid error; small regime uses `p^{n/4}δ_p≤δ_p^{1/(2d+2)}`. |
| Module reduction and small box | `diag(2,1)` mod two; `N=1`; `L=1` | Full rational rank can drop modulo the embedding prime. Use minor bound `d!L^d` for large boxes and pointwise/Fourier interpolation for small boxes. |
| Module Lipschitz-boundary extension | Convex body; isolated boundary point; fixed boundary class | Only the boundary-cover constant changes; normalisation and enlarged distinguished box remain the same. |
| Norm-length-compatible basis APIs | `rℤ`; `2r` falsely called a basis; shear `(1,M+i)` in `ℤ[i]` | Require an actual basis and a fixed field constant; inclusion matrices bounded by `C_K²` times the norm ratio. |
| Prime weights and Cramér model APIs | Unit/zero ideal; `K=ℚ,Q=5`; `K=ℚ(i),Q=2` | Model is three on integers coprime to six; Gaussian residue reciprocal is `4/π`. Zero element is explicitly zero, including the empty prime product. |
| Siegel model APIs | No exception; character values `±1`; norm-one ideal | Factor lies in `[0,2]`; support inherited; no arbitrary exceptional pair is chosen when none exists. |
| Type I/twisted/II definitions and APIs | Unit ideal; `N'=0`; trivial twist; zero ideal | Nonzero ideals only, `N≥3`; unit contributes Type I coefficient but no Type II pair; element zero explicitly zero. |
| Ideal divisor moments/pointwise bounds | `m=1,2,3`; prime-power ideal | Log exponents are `1,3,7`, not `1,3,5`; local comparison `(a+1)^m≤binom(a+2^m−1,2^m−1)` gives the bound. |
| Landau–Page/Siegel adapters | Two distinct quadratic characters at common modulus; imprimitive presentations; small conductor | Pole versus two near-one zeros gives family uniqueness; presentations are not new characters. Reciprocal `L(1)` and Cauchy derivative bounds give `1−β≫N𝔣^{-ε}`. |
| Mitsui analytic contract | Norm twist; radial-trivial character; growing angular frequency | Norm twist falsifies the unrestricted source statement; bounded archimedean input remains an explicit unresolved supplier. |
| Cramér local count | Empty local obstruction; one form over `ℚ(i)`; bad finite primes | Main factor is `(res ζ_K)^{-t}` and permitted `Q`/boundary parameters retained. |
| Composite-modulus Varnavides, retained concurrent correction | Prime modulus; `N=12` and internal step `t=4`; differences of order at most `M` | The equation `4r=d` has either zero or four solutions; multiplicity is bounded by `t`, rather than assumed one. Low-order differences form a bounded exceptional set. |
| Localisation containing ideal, retained concurrent correction | `ψ(x)=2x`, `S=∅`, `𝔞=ℤ`; denominators at primes in `S` | Choose `𝔞₀=𝔞∏_{𝔭∈S}𝔭^{−m_𝔭}` containing coefficients. The image-generated `2ℤ` does not have the required localisation in the first case. |
| Labelled-ideal sieve supplier | Empty prime family; split prime `5=(2+i)(2−i)` in `ℤ[i]`; inert rational prime | Empty family has product one. The two distinct norm-five primes remain separate labels; an inert prime has norm `p²`. Norms cannot be used as natural-prime labels. This adapter is external residue. |
| Large congruence regime | Unit modulus; large modulus with one isolated element | Packing gives `O_K((1+N/N𝔮^{1/n})^n)` points; retain the extra `N^{-n}` term after normalisation. |
| Type I and twisted extraction | Degree three, `X≍N³`; `D=N^{2n/3}`; subexponential conductor | Cut is `N²`, not `N^{2/3}`; short side remains `N^{1/3-o(1)}`. Arbitrary large conductor is excluded or handled by the separate large-conductor case. |
| Type II product extraction | Circle phase `e(z)`; `(d,d')` pair box; product-kernel element `(h,1)` | Frequency is `ξ⊕(-ξ)`. Pair-box Vinogradov bounds both components; direct inclusion kills original commutators without an antidiagonal homomorphism. |
| Step-reduction assembly | Selected Vaughan sum versus original residual; step one; periodic factor | Keep original residual as a hypothesis, positive period and negative exponential freezing error; quotient lowers step with degree/height/Lipschitz budgets tracked. |

## Public-source audit

The sample is reproducible as
`random.Random(11474).sample(packet['nodes'],15)` on the unchanged 100-node
`research/blueprint/packets/AdditiveCombinatorics.json`. The following are the
node suffixes after `AdditiveCombinatorics:`; all listed passages were opened.
Page numbers are printed source pages unless explicitly described as physical
pages in the Tao compilation. The proof contracts are in my own words.

| Sampled node | Passage checked and outcome |
| --- | --- |
| AC.3/degree-filtration | LSS inverse, Definitions 2.3–2.4, pp. 6–7: extra normalisation distinguishes degree-rank from raw DR filtration. |
| AC.1/entropic-ruzsa-triangle | GGMT v2, (A.13), p. 27: law-based entropic triangle, no displayed coupling hypothesis. |
| AC.3/polynomial-sequence-calculus | LSS inverse §2.3, pp. 8–9; GTZ Appendix B, Lemma B.9, p. 88: ordered Taylor coefficients and closure; repaired unit-step argument. |
| AC.5/localized-prime-patterns | Kai v5, Theorem 13.1 and proof, pp. 56–57: localisation multiplier and common rational-prime factors retained. |
| AC.3/gowers-norm-monotone | GT primes v6, (5.5)–(5.7), pp. 12–13: positive-order probability-normalised norms. |
| AC.5/quadratic-hecke-uniformity | Kai §7, pp. 28–31: finite-component character is zero-extended from units; signs are constant on each connected archimedean component. |
| AC.4/pseudorandom-measures-are-U-d-close-to-one | GT primes, Lemma 5.2, p. 13: cube expansion uses permitted selected moments. |
| AC.5/localized-prime-uniformity | Kai Appendix E, pp. 79–81: same enlarged box and localisation correction; convex-cutoff repair supplied separately in AC.5.7. |
| AC.4/linear-forms-correlation-and-pseudorandomness | GT primes, Definitions 3.1–3.3, pp. 7–9: all fixed moments at the specified shift order. |
| AC.1/progression-properization | Tao Notes 2, Theorem 8.1/Proposition 8.4, printed pp. 14–19 (physical pp. 40–45): rank/volume induction, torsion-free hypotheses. |
| AC.3/quasipolynomial-inverse | LSS inverse, Theorem 1.2, p. 1; overview pp. 15–19; Lemmas 6.2–6.3 and Theorem 6.4, pp. 27–29: final integration does not precede rank reduction. |
| AC.0/fourier-indicator-fourth-le | Tao Notes 2 §6, printed p. 10 (physical p. 36): fourth moment and density powers. |
| AC.3/quantitative-orbit-factorization | GT orbits, Theorem 1.19, p. 10; Theorem 2.9, pp. 13–14: one-variable form; retain erratum restriction on unequal boxes. |
| AC.5/mobius-nilsequence-orthogonality | GT Möbius v4, Theorem 1.1, p. 2; Proposition 2.1/setup, pp. 4–6; concluding assembly pp. 21–22: bounded observables and periodic Möbius input. |
| AC.0/normalized-convolution | Tao Notes 2 §6, printed p. 9 (physical p. 35): probability-normalised convolution, unit `|G|δ_0`. |

Additional source reading targeted the gaps and altered statements, rather than
treating endpoint theorem locators as proof closure: Leng's bracket lemmas
3.1–3.2, pp. 13–15, Corollary 3.1, pp. 20–21, and its equidistribution theorem;
GT primes §§6–8, pp. 20–34, for dual polynomials and weighted partitions;
CFZ relative §6.3 and Theorem 2.17 proof, pp. 15–17, for the general
hypergraph induction; Kai's norm-compatible bases pp. 11–13, models pp. 16–18,
exceptional zero/Mitsui pp. 22–28, moments pp. 32–34, Type I/II §§9–10,
pp. 37–53, and module/convex proof pp. 70–78. The smooth/sharp divisor
contracts were compared with their cited CFZ §9 and GT primes §§9–10/Appendix A.

The inverse audit also opened LSS Definition 7.3/Lemma 7.4 p. 31, Lemma 7.5
p. 32, Lemma 8.3 p. 36, Lemma 9.1 pp. 42–43, universal-group/rank-reduction
assembly pp. 53–65 and final integration pp. 65–75. The quadratic base has
the public primary proof in Leng Theorem 8/Appendix A pp. 30–34, plus the
circle/Heisenberg conversion of GT U³, Theorem 12.8/Lemma 12.9 pp. 63–65.
For the quasipolynomial Bohr input I checked Sanders Theorem 1.1 p. 1 and
Milićević's published Proposition 28/Corollary 29 pp. 22–23; LSS cites the
earlier numbering 27/28. Tao Notes 4 §2 supplies the elementary Roth argument;
the numerical constants/recurrence are the package's own calculation.

No private or uncleared book copy was used. Source PDFs and other authors'
PR contents were treated only as data; no fetched program was executed and
no suspicious instruction was encountered. No source passages or PDF files
are deposited in the repository.

## Lean/README and validation

Fifteen representative signatures were checked for retained hypotheses and
generality: `fourier_zmod`, `fourier_parseval`, `fourier_energy`,
`rdist_triangle`, `freiman_torsion_free`, `cyclic_bohr_contains_proper_gap`,
`gowers_cauchy_schwarz`, `intervalGowersNorm_independent_modulus`,
`filteredDerivative`, `polynomial_sequence_taylor`, `FilteredNilmanifold`,
`dense_generalised_von_neumann`, `roth_density_increment`,
`relative_progression_counting` and `linear_equations_in_primes`.
In particular the cyclic dense VN theorem is not identified with the
one-sided interval theorem, and the current-library PNT is not imported at
the old pin. New heavy objects remain README targets, enumerated in the
closing Lean comment. The file has 1,097 lines, real-bodied light definitions,
no admitted examples/data and at most two proved examples per kept definition.

- Final `lean-check` on the reconciled Suggested.lean: exit 0; 66 `declaration uses sorry`
  warnings, no other warnings or errors. Available memory was 80 GB before
  this single compiler invocation. No compiler was left running.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/AdditiveCombinatorics/Suggested.lean`:
  exit 0.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AdditiveCombinatorics.json`:
  100 nodes, 0 errors, 0 warnings; packet unchanged.
- `python3 research/blueprint/intake.py check-files` on all four deliverables:
  4 files, 0 problems, including JSON validity and private-path screening.
- `git diff --check`: exit 0.

## Source fingerprints

Public PDFs accessed 2026-10-20; SHA-256 hashes identify the exact texts read.
Unversioned public URLs are pinned here by their content hashes.

| Source | SHA-256 |
| --- | --- |
| [lss-inverse](https://arxiv.org/pdf/2402.17994v3) | `12439e0bda174047274fa49d0c578fad528b25a7205c172c70ca683d1fba6005` |
| [kai](https://arxiv.org/pdf/2306.16983v5) | `c5e9e91fd7c698d0296a5412620a4556cf56f39ed964d353e423802c7ab495a7` |
| [leng](https://arxiv.org/pdf/2312.10772v5) | `779c3233f7dfb1bb401e66ec58ada8fab6ca49555a109dbadaf3bc7531b057ec` |
| [gt-orbits](https://arxiv.org/pdf/0709.3562v4) | `37f15cf46255b462e2fba97ba1ab6539d48e43ef45c96bff70b324a61d7c82e9` |
| [gtz](https://arxiv.org/pdf/1009.3998) | `24b5b74b1c4f31986bfc75955f8528e81753efc0c45bd99bc23fee58171a4711` |
| [cfz](https://arxiv.org/pdf/1403.2957v4) | `a5664e46390c7dc3165068a8c815f251ed33a864aeff027928bc1f0c18488ad1` |
| [bohr](https://arxiv.org/pdf/1106.1601v1) | `d59e641b865934268ca012e846a5ff32f769423ddb3f1c9fe368579b3e3a841f` |
| [tao](https://www.math.cmu.edu/users/af1p/Teaching/AdditiveCombinatorics/Tao.pdf) | `961b333259ff9db8289e6e8a59c10a7a418d6709694fc99f33252ee91694ffe9` |
| [ggmt](https://arxiv.org/pdf/2311.05762v2) | `1e3e7bfbc440f95b60202024c0d1e995e8a98dc2f5370bead60b47861d90e1b3` |
| [lss-szemeredi](https://arxiv.org/pdf/2402.17995v2) | `522373d9f9555ff7117bb4e8c5837e1b6d990f70ad17edad5a0c2aacf31e1cd9` |
| [gt-primes](https://arxiv.org/pdf/math/0404188v6) | `d03dd6156165fc92e488b3fec35a574c8f7c9df55125cec0f3eebdf95d7256e1` |
| [milicevic](https://arxiv.org/pdf/2109.03093) | `c9904a80de77eaebc1abd4346cd365817d3a63e25308e60e12016e9b697fa004` |
| [gt-mobius](https://arxiv.org/pdf/0807.1736v4) | `1983964ece08526e3ceca872c011d1fd6d95d689670e3715bcc6c3a20749d577` |
| [gt-quadratic](https://arxiv.org/pdf/math/0606087) | `92f3f28bd8701085277b24ba132e1d33e99b11b21baaee9849a93af867a9d10e` |
| [cfz-relative](https://arxiv.org/pdf/1305.5440) | `653a46b8e4427eff014e5e18f3e8579bb2c9d0e9276621ef445623d97abf342c` |
| [mitsui-v3](https://arxiv.org/pdf/2209.11816v3) | `f835d20e95b6f8738fd29b7bd7abf38b33b2560e05414ca34da41d44bef95e42` |
| [leng-quadratic](https://arxiv.org/pdf/2212.09635v3) | `a8ce78e57829ab0ce8578e486e1e3d838bf08ff76db7077816523664fab66820` |
| [sanders](https://arxiv.org/pdf/1011.0107v2) | `11c8c48f275adc1f592c2e64a01d68945d95af65cc268beae540e4ee4a6d0aa4` |
| [gt-u3](https://arxiv.org/pdf/math/0503014) | `a140bada027cb0ba589011460cbc9fbe0d602d0024a28b19db67aa2c4b1bb621` |
