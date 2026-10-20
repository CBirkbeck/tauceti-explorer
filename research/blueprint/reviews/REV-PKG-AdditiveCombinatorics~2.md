# Independent package review: AdditiveCombinatorics, round 2

Issue #10889; reviewer Codex, session `codex-vQDkmD`; 2026-10-20.

**Verdict: needs_changes.** This is a completed fixing review. The corrections below are applied to the package. Acceptance still requires an authorised supplier order and the arithmetic proof chains identified under R1 and R2. The packet is unchanged. Neither successful elaboration nor the numerical checks below proves the admitted theorem targets.

## Scope and coverage

I read the previous review, the revision handoff, the full revised README and Suggested.lean, and the accepted packet's 100 nodes: 27 definitions, 56 theorems, 13 lemmas and four constructions. The README retains the mathematical targets, all 286 packet API names, their hypotheses and the definition checks; its 103 numbered subsections also expose the additional proof contracts. Coverage of a name is checked separately from whether its prerequisites close. The unresolved arithmetic contracts are not counted as established merely because they now have names.

For upstream form I compared the current AlgebraicCodingTheory and RepresentationTheory/LieGroups README/Suggested pairs and the upstream guide. The package uses prose layers, exact contracts and worked checks. Its build order AC.0, AC.1, AC.3, AC.2, AC.4, AC.5 reflects its dependencies. The representative Lean file is 1,091 lines, with light real-bodied definitions and milestone statements; the remaining definitions are accounted for in its closing comment. The single-line metadata remains `topic = "math.NT"`. No packet, atlas data, supplier package or upstream checkout was changed.

The revision supplies substantive contracts for the earlier review's regular-Bohr/lattice, Taylor/BCH/metric, efficient inverse, densification, smooth/sharp majorant, and ideal Type I/II/module-counting concerns. I checked those contracts rather than automatically carrying forward the old seven-group rejection. The remaining defects below concern specific missing inputs and placement, not a demand to formalise every proof in Suggested.lean.

## Corrections applied

1. **Roth iteration and its zero-length case, AC.2.10.** For `u_{i+1} ≥ u_i/2 − c`, the iterated lower bound is `2^(−i)(u_0 + 2c) − 2c`. The former sufficient threshold left `2c` outside the exponential. I replaced it by `2^ceil(66/δ)(log(9700/δ²) + 2log(100/δ))`, which still lies below the advertised Rahman bound. A two-step numerical control distinguishes them. The Lean density-increment statement now requires `N > 0`: its previous `9700*N ≤ card(A)²` allowed `N=0`, `A=∅` and the vacuous choice `L=0`, outside the stated positive-density argument. The independent Fourier/density-increment argument in the README supplies the numerical route; the unavailable Rahman note is not treated as read.
2. **Varnavides at composite moduli, AC.2.9.** AC.4.10 consumes cyclic groups whose order need only be coprime to `(k−1)!`, while the prior bridge supplied only primes. I supplied the bounded-length progression argument for all sufficiently large nonzero moduli: discard the bounded number of low-order differences, and bound solutions of `tr=d` by `gcd(t,N) ≤ M`. The Lean signature now uses `[NeZero p]`, without primality.
3. **Polynomial recurrence dependencies, AC.3.14 and AC.5.2.** Scalar Weyl and small-oscillation targets move before their first use in AC.3, with exact locators. Small oscillation requires the source's minimum interval length; `P(n)=n(n−1)/4` on a singleton disproves its omission. The strong recurrence contract retains a length bound polynomial in reciprocal density. The Type I argument uses that contract only on long intervals and uses one good multiplier directly for short intervals. This repairs the backward AC.3-to-AC.2 dependency without invoking AC.5.1's Waring input.
4. **Host–Kra cube normal form, AC.3.9.** The unique factorisation is over the `2^k` upper faces, with coefficients in the corresponding filtration levels. It is not a factorisation with one independent coefficient for all `3^k` faces. The ordering now agrees with the polynomial-orbits source.
5. **Cut/box powers, AC.4.9.** Repeated Cauchy–Schwarz bounds the `2^r`-th power of the cut norm by the cube moment. Expanding the latter gives at most `(2^(2^r)−1)η`; take the root once. The previous prose confused the box norm with its powered moment.
6. **Number-field normalisation, AC.5.8.** The Cramér weight divides by `r_K = res ζ_K`, and its counting main term is `vol(Ω)/r_K^t`. Previously both used multiplication. The Gaussian-field control at `Q=2` gives `4/π`, not `π/4`. I specified the common ideal-independent norm-length constant using the archimedean maximum, its basis-change API, the asymptotic range of `Q`, the Lipschitz-boundary/remainder contract and nonzero ideal domains.
7. **Ideal divisor moments and Vaughan data, AC.5.8.** The logarithmic exponent is `2^m−1`, not `2m−1`; the first disagreement is the third moment (`7`, not `5`). The Type sums retain their inclusive/strict cutoffs, their ordered factorizations, conductor-zero extension and negligible-sum mass estimate. The Siegel formula is never evaluated as a negative power of the zero ideal. Each new arithmetic definition now has at least three discriminating checks, independently of checks for its neighbours.
8. **Hecke-family scope, AC.5.8–AC.5.10.** The finite-order primitive family dichotomy is distinguished from the general unitary zero-free input for sectors. The latter still needs its archimedean analytic-conductor and norm-twist conventions; it is explicitly an open obligation, not silently dropped. AC.5.9 specifies the finite residue-component function and zero extension, rather than the full principal-ideal character with its archimedean component. The Siegel model's cutoff in AC.5.10 is `Q`, not the congruence ideal `𝔮`.
9. **A containing ideal for localisation, AC.5.11 and AC.5.14.** Clearing the finitely many denominators at primes in `S` gives `𝔞₀ = 𝔞∏_{𝔭∈S}𝔭^(−m_𝔭)`, containing every affine coefficient and with the required localisation. The ideal generated by the images need not work: `ψ(x)=2x`, `S=∅`, `𝔞=ℤ` generates `2ℤ`. This correction works without a local-admissibility hypothesis and does not restrict the endpoint theorem.
10. **Existing-library ownership.** Removed the new ideal-von-Mangoldt construction from AC.5.8 and cited the current Tau Ceti ideal weight, evaluation and bounds. The retained target is explicitly its fractional-ideal element pullback. The current ideal Hecke-character construction is also consumed. The finite Brun theorem is deferred to its existing SieveMethods owner; only the required ideal adaptation remains an obligation here.
11. **Checks and locators.** Added explicit box/point/properness controls for generalised progressions, factor-average constants and cell values, AP index boundary cases and omitted-coordinate values, negative discrepancy tolerance, and separate arithmetic-definition controls. Corrected Milićević's version-dependent proposition numbers, the quadratic-Möbius Type I/II pages, the small-oscillation page, and Kai's local-count and Lipschitz-extension locators. Replaced the unsupported assertion of a new AC/finite-fields bundle by the actual open order gap.

## Source audit

The reproducible sample is `random.Random(10889).sample(packet['nodes'], 15)` on the unchanged packet. Each row was checked in the primary public PDF, including its hypotheses and normalisations. Page numbers are printed paper pages unless the physical PDF page is explicitly given. Statements and explanations in the package and this report are in my own words.

| Sampled node suffix | Primary locator checked | Finding |
| --- | --- | --- |
| AC.3/quantitative-orbit-factorization | [Green–Tao polynomial orbits v4](https://arxiv.org/pdf/0709.3562v4), Theorem 1.19, p. 10, Theorem 2.9, pp. 13–14, §§7–10; [erratum v3](https://arxiv.org/pdf/1311.6170v3), §1, pp. 1–3 | One-variable factorisation and the small-side qualification are retained separately. |
| AC.5/linear-equations-in-primes | [Green–Tao linear equations v2](https://arxiv.org/pdf/math/0606088v2), Main Theorem, p. 9, Theorem 1.8, p. 12; [Leng v5](https://arxiv.org/pdf/2312.10772v5), Theorem 5, p. 6, §5 | Finite complexity, quantitative uniformity and positive-region factor match the endpoint. |
| AC.3/vertical-character | Leng v5, Definition 1.2 and Theorem 4, pp. 4–5 | Rational central subgroup, nonzero vertical frequency and kernel quotient agree. |
| AC.1/marton-conjecture | [Gowers–Green–Manners–Tao v2](https://arxiv.org/pdf/2311.05762v2), Conjecture 1.1/Theorem 1.2, pp. 1–2; Appendix B, pp. 30–31 | Characteristic two, nonempty set, `2K^12` and the subgroup-size constraint retained. |
| AC.1/balog-szemeredi-gowers | [Tao compiled notes](https://www.math.cmu.edu/users/af1p/Teaching/AdditiveCombinatorics/Tao.pdf), Notes 3, Theorem 1.1, pp. 3–6, quantitative Theorem 2.2, p. 7 | Nonempty/high-energy input and polynomial losses, rather than a qualitative-only endpoint. |
| AC.3/gowers-inner-product-and-uniformity-norm | [Green–Tao primes v6](https://arxiv.org/pdf/math/0404188v6), §5, Definition 5.1, pp. 11–12; [LSS inverse v3](https://arxiv.org/pdf/2402.17994v3), Definition 1.1, p. 1 | Complex parity conjugation and interval normalisation agree. |
| AC.0/normalized-convolution | Tao, Notes 2, §6, p. 9 (physical PDF p. 35) | Probability normalisation, subtraction and the delta-unit factor agree. |
| AC.2/quantitative-szemeredi | [LSS Szemerédi v2](https://arxiv.org/pdf/2402.17995v2), Theorem 1.1, p. 1; §3, pp. 11–12 | Quantitative theorem is for length at least five; shorter cases are kept separately. |
| AC.1/chord-bohr-set | Tao, Notes 2, §6, (9), p. 11 (physical PDF p. 37) | Strict chord-radius definition, distinguished from phase radius. |
| AC.0/add-energy-le | Tao, Notes 2, §6, (5), p. 10; the README's cancellative two-set injection | The two asymmetric cardinality bounds follow without a finite ambient-group hypothesis. |
| AC.1/entropic-ruzsa-distance | GGMT v2, (1.1), p. 4; Appendix A, (A.10)–(A.15), pp. 26–28 | Independent-law distance, logarithm convention and conditional averaging match. |
| AC.2/szemeredi-set-form-and-functional-form | Green–Tao primes v6, §2, Propositions 2.1/2.3 and remark, pp. 3–5 | Finite/set/functional bridge supported; the README now adds its own composite-modulus multiplicity argument. |
| AC.0/fourier-indicator-l2 | Tao, Notes 2, §6, (1), p. 9 (physical PDF p. 35) | Squared dual mass is the density, not the cardinality. |
| AC.4/prime-progressions-endgame | [Conlon–Fox–Zhao exposition v4](https://arxiv.org/pdf/1403.2957v4), §8, pp. 16–19; Green–Tao primes v6, §9, pp. 35–36 | Majorisation, fixed-W density and conversion to prime progressions use the right weights. |
| AC.5/number-field-local-factors | [Kai v5](https://arxiv.org/pdf/2306.16983v5), Proposition 5.2, pp. 16–17; Theorem 12.1/Remark 12.3, pp. 54–55; Theorem 13.1, pp. 56–57; Appendix E, pp. 78–83 | Common rational-prime residue variable and retained localisation multiplier checked; repaired the containing-ideal construction. |

The author's previously unread/version-sensitive Milićević and quadratic-Möbius locators were also opened. [Milićević v3](https://arxiv.org/pdf/2109.03093v3) has Proposition 28, pp. 22–23, and Corollary 29, p. 23; Proposition 27/Corollary 28 belong to v1. [Quadratic uniformity of Möbius](https://arxiv.org/pdf/math/0606087), §4, Lemma 4.1, pp. 12–13, and Proposition 4.2, pp. 13–14, supplies the Type I/II split for `μ`, not an ideal Vaughan identity for `Λ`.

Additional repair-sensitive reading: polynomial orbits Proposition 4.3/Lemma 4.4, pp. 20–22, Lemma 4.5, pp. 22–23, and cube-group §6, pp. 29–32; LSS Szemerédi Lemma 2.4, p. 5, with its length condition; CFZ Lemma 6.3, (12), p. 13, and the densification proof; Kai Definition 5.1/Proposition 5.2, pp. 16–18, Theorem 6.1/Definition 6.2/Propositions 6.3–6.4, pp. 22–27, §8, pp. 32–34, §9, pp. 37–42, Appendix B, pp. 63–65, and Appendices C–E, pp. 66–83. The proof contracts also use the polynomial-orbits erratum's denominator clearing and the dimension-sensitive lemmas of Leng's Appendix B.

[Bennett–Siksek](https://personal.math.ubc.ca/~bennett/BeSi-Annals-2020.pdf), Theorem 8/(36), printed p. 381, records Rahman's numerical statement, not its proof. I checked the README's separate explicit Fourier increment and length recurrence; the corrected recurrence preserves the final threshold. I did not obtain or claim to read Rahman's unpublished note. No restricted book was accessed; no source passages or source-by-source chapter summaries enter the repository.

## Current-library and roadmap ownership audit

The read-only roadmap checkout was at `0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library was at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I searched definitions and target statements by their mathematical fields and operators, including finite complex coefficients/convolution, entropy and conditional laws, cube moments, filtrations and polynomial differences, nilpotent quotient metrics, layered cycles, divisor weights and affine ideal patterns. The nine newer roadmaps and Completed directory were included. The absence of Regularity from this local checkout is not an absence upstream: I read its README and Suggested.lean on upstream main `c4d22422c3f1aaa3d806c42f432953c26cb91969` (README blob `529e2c11931025d424654bdbd90c1be0d4bb4dbd`).

| Mathematical target family | Existing content inspected; boundary decision |
| --- | --- |
| Finite Fourier coefficients, dual bases, convolution and energy | Mathlib AddChar/DFT/energy APIs, Tau Ceti Haar/Pontryagin modules, AlgebraicCodingTheory and ModularForms. Existing character theory and specialised code/modular-form transforms remain inputs; the finite function-valued coefficient/convolution API is the retained variant. |
| Entropy, Ruzsa distances, PFR, Bohr sets and progressions | Finite probability/entropy and additive-energy/covering APIs; current roadmaps, including IntegralLattices' successive-minima targets. No second PFR or quantitative cyclic-Bohr contract was found. The lattice supplier is still required for Minkowski's second theorem. |
| Gowers cubes, polynomial sequences, Lie/nilpotent geometry | Mathlib subgroup, Lie/manifold and exponential APIs; RepresentationTheory/LieGroups. General local Lie theory stays with that owner; global simply connected nilpotent polynomial coordinates are the kept specialisation. |
| Szemerédi, regular factors, layered removal | DenseGraphLimits and current Regularity. The latter supplies uniform-pair rectangle counting from Layer 4, not the layered-cycle removal endpoint. The arithmetic cut norm is not a duplicate graphon cut norm. |
| Divisor sums, pseudorandom weights and relative counts | Native BoundingSieve and SieveMethods §1.2. Its finite Brun theorem is deferred; smooth/sharp prime majorants and arithmetic relative-counting contracts remain distinct. |
| Möbius, affine complexity, ideal weights and prime patterns | ArithmeticDirichletSeries, finite-character/Hecke modules, current Chebotarev, analytic/sieve/exponential-sum packages. Removed the duplicate ideal von Mangoldt construction; kept the element pullback and model comparisons. Qualitative fixed-modulus PNT remains a consumed library result, not a log-power estimate. |

The concrete removal is `TauCeti.IdealArithmeticFunction.vonMangoldt` and its ideal evaluation/bound API, in `TauCeti/NumberTheory/ArithmeticDirichletSeries/VonMangoldt.lean`. The boundary now names `vonMangoldt_apply_prime_pow`, `vonMangoldt_one`, `vonMangoldt_im`, `vonMangoldt_re_nonneg` and `norm_vonMangoldt_le_log`. AC.5.8's element pullback differs by its fractional-ideal domain and coordinate transport. The ideal character is consumed from `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean`, including `idealCharacter_apply_toIdealsAway` and `idealCharacter_apply_prime`.

No target elsewhere was transferred to a new roadmap owner. I preserved the qualitative PNT deferral to `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`. None of these later-current declarations is imported into the historically pinned representative Lean file. The upstream functional-equation owners are consumed in accordance with the Tate rule; no Tate theorem is planned here.

## Adversarial mathematics pass

This table covers all 103 numbered subsections, including the defining equations, API identities and standing conventions in each. A retained row means these checks found no additional defect; it is not a proof of an admitted theorem. Distinct definitions in one subsection were checked separately; the arithmetic controls added to AC.5.8 are deliberately not pooled into one three-test group.

| Subsection and statements checked | Instances, calculation and result |
| --- | --- |
| AC.0.1 Fourier/transport/inversion | Delta at one in `ZMod 4` has coefficient `−i/4`; the singleton group and constant characters fix sign, conjugation and normalisation. Surjective quotient fibres have equal size; nonsurjective maps are not given the surjective formula. |
| AC.0.2 Normalised convolution/algebra | Deltas at `a,b` give `δ_(a+b)/card(G)`; the unit is `card(G)δ_0`. For `{0,1}` in `ZMod 3`, self-convolution is `(1,2,1)/3`. |
| AC.0.3 Parseval/Plancherel | Constant `2i` has squared mass four on both sides; point masses test the group-order factor and conjugate slot. |
| AC.0.4 Convolution transform | Two deltas test the phase at `a+b`; constant one tests absence of an extra order factor. |
| AC.0.5 Fourier energy | Empty set zero, singleton one, full group `card(G)³`; `{0,1}` in `ZMod 3` has energy six. |
| AC.0.6 Indicator L² | Singleton dual squared mass `1/card(G)`; full set one; empty set zero. |
| AC.0.7 L¹ coefficient bound | Zero, a character and a delta distinguish averaging and absolute value. |
| AC.0.8 Indicator fourth bounds | A subgroup of density `ρ` has fourth mass `ρ³`; full/empty sets check endpoints and the small-doubling lower bound. |
| AC.0.9 Energy upper bounds | Empty factor zero; singleton factors one; `A=G` tests both asymmetric cardinality bounds. Cancellativity suffices. |
| AC.1.1 Entropy/information/conditioning | A biased bit, uniform bit, constant, independent pair and XOR triple distinguish natural-log entropy, conditional averages, joint independence and zero-mass fibres. |
| AC.1.2 Ruzsa/conditional distance | Diracs and translated uniform subgroup laws give zero. A uniform three-point subset of `ZMod 4` gives self-distance `(2/3)log(3/2)>0`; revealing one uniform bit gives half its entropy. |
| AC.1.3 Distance triangle | Constants, subgroup laws and equal laws check independent-law interpretation; no coupling is substituted for convolution. |
| AC.1.4 Madiman | One constant summand and independent uniform subgroup summands check all signs; independence is retained. |
| AC.1.5 Entropic BSG | Independent and identical correlated bits distinguish the mutual-information correction and the averaged fibre laws. |
| AC.1.6 Fibring | Identity and zero quotient maps respectively remove the fibre and quotient contribution. |
| AC.1.7 Four-variable fibring | Four independent bits and constants test the joint-independence assumption; pairwise independence alone is insufficient. |
| AC.1.8 Conditioning cost | Constant condition gives zero information; revealing a bit gives the half-information loss. |
| AC.1.9 Distances to sums/fibres | Adding a constant changes no entropy; independent uniform subgroup laws check opposite entropy-difference signs. |
| AC.1.10 Double-sum fibre | Constant third variable and independent subgroup laws check the independent-copy and conditioning slots. |
| AC.1.11 Zero-distance characterisation | Distinct translates of the same subgroup pass; the three-point non-subgroup law above fails. The subgroup is common, the cosets need not coincide. |
| AC.1.12 Functional/minimiser/setup | Dirac and uniform references distinguish the penalty terms; three independent bits with their XOR distinguish joint from pairwise independence. Finite probability-law compactness, not arbitrary measures, is used. |
| AC.1.13 First estimate | Uniform subgroup minimisers have `k=0` and zero correction; constants check the entropy terms. |
| AC.1.14 Second estimate | At `η=1/9`, the denominator is `8/9`; zero-distance cases give zero. An arbitrary penalty is not substituted. |
| AC.1.15 Endgame | Uniform independent bits with third their sum satisfy the triple relation and zero pairwise information; conditional fibres preserve the relation. |
| AC.1.16 Zero-distance minimiser | Trivial module and uniform subgroup cases pass; the coefficient is `8/9+1/81=73/81<1`. Characteristic two is essential. |
| AC.1.17 Entropic PFR | Point masses and a common uniform subgroup give zero; sum bound eleven and separate bound six are distinguished. |
| AC.1.18 Marton | Singleton and a subgroup have `K=1`; a single coset suffices, while the theorem permits two. Empty sets are excluded before division. |
| AC.1.19 Spectrum | Zero threshold includes the whole dual; a positive threshold for zero gives empty; a character at threshold one is included. Scaling by `2i` uses modulus two. |
| AC.1.20 Chord Bohr | Empty frequency family at radius `−1` is the whole group; nonempty family at zero is empty. In `ZMod 4` the antipode is excluded at radius two. |
| AC.1.21 Spectral Bogolyubov | Singleton, subgroup and full group fix the density powers; `(3/4)(3/4)−1/4=5/16` gives the positive mass used for support. |
| AC.1.22 Phase Bohr/regularity | Rank zero, a stable small radius and a jump radius in `ZMod 4` distinguish phase/chord conventions and regularity. Positive radii and strict endpoints retained. |
| AC.1.23 Shrink/translate | Zero shift, nonfaithful characters and rank zero check support and boundary loss; divisions by rank are restricted to positive rank. |
| AC.1.24 Bohr density increment | Full set has zero balanced function and no positive spectral mass; no unconditional strict increment is asserted. |
| AC.1.25 Generalised progression API | Rank zero: one empty tuple, value the base, proper and volume one. Base three/step two/length two: values `3,5,7`. Zero step of length one: volume two, singleton carrier, improper. Checks strengthened. |
| AC.1.26 BSG | Singleton/subgroup at `K=1` and the excluded empty set test the energy threshold and nonempty subset conclusion. |
| AC.1.27 Modelling | Singleton and an integer interval distinguish an order-eight Freiman model from a group embedding; torsion-free scope retained. |
| AC.1.28 Progression in cyclic Bohr | Trivial/nonfaithful characters and `N=1` require retaining the cyclic coordinate in the lifted lattice; rank bound is `d+1`. |
| AC.1.29 Properisation | Zero/repeated steps and rank zero distinguish volume from image size; torsion-free ambient hypothesis retained. |
| AC.1.30 Torsion-free Freiman | Integer interval with doubling below two and a singleton test proper covering in the original group, not merely the cyclic model. |
| AC.1.31 Bounded-exponent Freiman | Exponent one forces the trivial group; exponent two/subgroup examples pass. No polynomial bound in arbitrary exponent is promised. |
| AC.1.32 Quasipolynomial Bogolyubov | Full set and singleton test nonempty density and cyclic order; the logarithms use `2K` to stay positive at `K=1`. Versioned source numbers corrected. |
| AC.3.1 Cube/parity/norm API | Zero-dimensional helper, complex values and a mean-zero bit fix parity. The bit has `U¹=0`, `U²=1`; norm claims start at positive order. |
| AC.3.2 Gowers–CS | A zero slot gives zero; imaginary/negative mixed products require absolute value. Constant family and trivial group pass. |
| AC.3.3 Triangle | Opposite functions, imaginary constants and order one test seminorm behaviour. |
| AC.3.4 Monotonicity | A nontrivial character has zero U¹ and U² one; constants have equal positive-order norms. |
| AC.3.5 Nondegeneracy | The same bit disproves order-one nondegeneracy; the target requires order at least two. |
| AC.3.6 Interval/box norms | Empty interval gives the specified totalised zero; singleton positive-order ratio one. Order-zero modulus-one failure remains a named negative control. All modulus comparisons retain positive order. |
| AC.3.7 Filtration | Degree zero forces a trivial group; degree one is abelian; the Heisenberg filtration tests the commutator inclusion. |
| AC.3.8 Polynomial derivatives | Constant sequence, `n²` and noncommuting ordered terms fix `g(n+h)g(n)⁻¹`. For `n²`, step two at three gives sixteen and the subsequent step-three difference gives twelve. |
| AC.3.9 Taylor/cube calculus | Abelian quadratic and ordered noncommuting coefficients test integer binomials and multiplication order. Corrected normal form to the `2^k` upper faces. |
| AC.3.10 Global nilpotent exponential | Trivial group and Heisenberg group pass; the circle itself is not simply connected. Local exponential inputs alone do not assert global injectivity. |
| AC.3.11 Nilmanifold | Circle and a nonnormal Heisenberg lattice test a homogeneous-space quotient, not a quotient group. Lean keeps finite-dimensional Hausdorff Lie assumptions. |
| AC.3.12 Mal'cev basis | Torus, rational height `height(2/3)=3`, irrational coefficient, scaled circle basis and the Heisenberg half cross term distinguish lattice and coordinate requirements. |
| AC.3.13 Metrics/nilsequences | Circle representatives differing by three have distance zero; distance to `1/3` is `1/3`. Constant two fails one-boundedness, and bounded discontinuous observables fail the Lipschitz requirement. |
| AC.3.14 Characters/smoothness/recurrence | Half-integral lattice image fails character integrality; constant polynomial has smoothness zero. `binom(n,2)/2` at length one has norm `1/2` despite zero oscillation, prompting the length fix. Total equidistribution is tested on progressions, not only the full orbit. |
| AC.3.15 Vertical frequency | Circle characters and constant one separate zero/nonzero frequency; zero observable satisfies equivariance for any frequency and cannot itself witness an obstruction. |
| AC.3.16 Efficient equidistribution | Torus, excluded zero central frequency and unequal box sides test the kernel quotient and minimum-side alternative. |
| AC.3.17 Interval inverse | Constant and linear phase pass; boundedness, positive length, the permitted correlation threshold and separate dimension/height/Lipschitz losses remain explicit. |
| AC.3.18 Box inverse | One-dimensional box specialises to the interval case; a singleton is outside the large-box hypothesis. Zero-dimensional products use the singleton convention. |
| AC.3.19 Rational/smooth/periodic API | A third has rationality bound three, not two; pointwise rational values need not have a common period. Irrational constants fail rationality, while constant large elements may be smooth if the stated size bound allows them. |
| AC.3.20 Orbit factorisation | Constant and rational periodic orbits test order of smooth/equidistributed/rational factors; the erratum's short-side branch is retained. |
| AC.2.1 Progression averages | Empty product one; empty interval zero; constant one on `[2]` with three terms gives `2/9` with the chosen denominator. Nonnegative difference and diagonal conventions retained. |
| AC.2.2 Dense von Neumann | The two-term interval counterexample has average `1/9` although the distinguished mean is zero. The cyclic prime statement and interval statement have their separate hypotheses. |
| AC.2.3 Progression partition | Constant orbit, `T=1` and short interval test average part length rather than a minimum length for every part. Scalar inputs now occur earlier. |
| AC.2.4 Factor/average/resolution | One cell with values `0,0,1,1` has energy `1/4`; constant-pair refinement gives `1/2`. Two cells on values `0,1,2,3` give `1/2,1/2,5/2,5/2`; constant `3/4` stays constant. Checks strengthened for averaging itself. |
| AC.2.5 Factor approximation | Constant input and zero residual test conditional means in `[0,1]`; real/imaginary correlating components are separated before energy increment. |
| AC.2.6 Density trichotomy | Density one, diagonal-only configurations and short intervals test the progression threshold and tolerances; no large-N conclusion is inferred at a short length. |
| AC.2.7 Quantitative Szemerédi | Small N, lengths three/four and length five distinguish the stated quantitative range from the shorter Roth/restriction routes. |
| AC.2.8 Upper density | Finite set zero, evens one half and alternating very long blocks distinguish anchored limsup from liminf and Banach density. |
| AC.2.9 Varnavides/infinitary bridge | Removing a finite prefix leaves upper density unchanged. Composite N admits the bounded-multiplicity argument added here; δ greater than one gives vacuous weighted input. |
| AC.2.10 Numerical Roth | Vacuous zero-length Lean case excluded. With `c=1`, two recurrence steps from fourteen give `6,2`; from twenty give `9,7/2`. Corrected sufficient length threshold still fits `2^(132/δ)`. |
| AC.2.11 Layered removal | Empty vertex set, empty layers and a single transversal triangle test n²/n^m scaling. Equal V-coordinates in distinct layers are distinct layered vertices. |
| AC.2.12 Ordered-product removal | Two factors are handled separately; a noncommuting tuple tests that the product order matches the layered walk. |
| AC.4.1 Pseudorandom-family definitions | Constants one, two and minus one, mean-one spikes and repeated shifts distinguish nonnegativity, mean, selected linear forms, correlation and joint conditions. |
| AC.4.2 Gowers closeness | Constant one has zero residual; cube expansion cancels the constant selected products. Arbitrary repeated forms are not inserted as though independent. |
| AC.4.3 Weighted von Neumann | Zero slot and ν=1 test the ν+1 domination and uniform error; all other slots remain dominated. |
| AC.4.4 Weighted structure | Zero function, bounded dense input and exceptional tails test structured boundedness and residual uniformity. |
| AC.4.5 Original relative Szemerédi | ν=1 recovers the dense route; positive density and diagonal removal remain necessary. Correlation hypotheses are not dropped from this original route. |
| AC.4.6 AP forms/index/error | k=0 has no index, k=1 one, k=3 twelve. At k=2 modulo eleven, `(2,5)` gives `(5,9)`; changing x₀ leaves form zero unchanged. Constants one/two/minus one test empty products and positivity. |
| AC.4.7 Discrepancy/pair | Constants zero/one have discrepancy one: tolerance one passes, half fails. Self-pair fails negative tolerance. Each test omits its own coordinate. |
| AC.4.8 Dense model | Zero and bounded dense functions test the model's `[0,1]` range; mean control alone does not permit an arbitrary signed model. |
| AC.4.9 Relative counting | f=g gives zero count error. Corrected cut power: a cube-moment O(η) bound gives cut O(η^(1/2^r)), with the explicit number of expanded products. Selected-subproduct hypotheses are retained. |
| AC.4.10 Linear-forms Szemerédi | ν=1, density one and composite modulus coprime to `(k−1)!` test the dense input. The repaired Varnavides bridge now supplies that modulus. |
| AC.4.11 Smooth divisor/majorant API | Empty prime product, W=6, `φ(W)/W=1/3`, Möbius signs and primes above/below R distinguish the normalisations. Outside the active window the majorant is one. |
| AC.4.12 Smooth moments | One form, zero/constant cutoff terms and boundary boxes test Fourier inversion, decay and bad-box errors; those are named proof contracts. |
| AC.4.13 Smooth linear forms | Empty selection has moment one; arbitrary selections of the AP forms are covered. No stronger original correlation condition is inferred. |
| AC.4.14 Sharp route | Divisor one, a prime above/below R, zero input, active-window boundaries and equal shifts test `log R`, `log p`, divisor conventions and repeated-shift kernels. |
| AC.4.15 Prime progressions | k=0, k=1 and arbitrary lower bound on the first term test degeneracies. Fixed W uses qualitative PNT; choosing W slowly is not a uniform quantitative PNT. |
| AC.5.1 Power-sum density | Quadratic/five-variable and higher-power cases test pointwise representation upper bounds; a cumulative asymptotic alone would not supply the density argument. |
| AC.5.2 Equidistributed Möbius | Constant mean-zero observable and an orbit failing equidistribution on a subprogression test the two alternatives. Short Type I ranges now use a bounded good multiplier directly. |
| AC.5.3 Möbius–nilsequence | Constant observable, rational periodic phase and linear phase test the small-modulus μ input; a prime-weight estimate cannot replace it. |
| AC.5.4 Affine system/complexity | Coordinates have complexity zero; `(x,x+r,x+2r)` at `(2,3)` is `(2,5,8)` and has complexity one. Twins, Goldbach and zero slope fail finite complexity; affine offsets are retained. |
| AC.5.5 Integer factors | ψ=x gives local factor one; ψ=2x has β₂=0. On `[−N,N]`, the positivity volume for ψ=x is N; for x and −x it is zero. p is prime, so p−1 is nonzero. |
| AC.5.6 Module complexity/cokernels | Independent coordinate blocks pass; conjugate Gaussian isomorphisms have zero kernels and fail the restricted-rank test. ℤ→ℤ[1/p] has infinite torsion cokernel; ℤ→ℤ² onto one coordinate has nontorsion cokernel. |
| AC.5.7 Module von Neumann | Scaling a nondistinguished input shows why all inputs must be one-bounded. Enlarged box and scalar case test the norm domain and the exponent. |
| AC.5.8 Arithmetic definitions/contracts | Basis `(1/3)` tests ideal scaling; `(1,i)` tests maximum norm versus field norm; sheared basis tests fixed compatibility constant. Cramér at Q=5 over ℚ is three, at Q=2 over ℚ(i) is 4/π. Unit/prime-power/zero element tests the pullback. Siegel unit/sign/bad-prime tests correction and support. Type I at N=8 includes norm-four divisors, twisted Type I uses χ₃(2)=−1 and χ₃(3)=0; Type II at N=64 excludes factors of norm four and counts ordered factors five and seven once. Third divisor moment requires logarithmic power seven. R2 remains. |
| AC.5.9 Quadratic Hecke uniformity | Trivial/nontrivial conductor, nonunits and split residues test the finite residue-component convention. Full principal-ideal evaluation is not substituted. |
| AC.5.10 Prime-model uniformity | Congruence ideal and sieve cutoff are distinct. Extra congruence cutoff is allowed for Siegel residual, not asserted for the full Cramér comparison. Analytic inputs still depend on R2. |
| AC.5.11 Number-field/localised factors | Rational case, parity and split prime five in ℚ(i) test one common residue vector, not independent prime-ideal witnesses. Removing S retains the rational-prime multiplier. ψ=2x disproves the image-generated containing ideal; denominator clearing repairs it. |
| AC.5.12 Number-field patterns | ℚ specialisation, Gaussian conjugate failure and a zero local factor test rank/finite-complexity and the reciprocal-residue main term. |
| AC.5.13 Localised model uniformity | ℚ with S={2} and x=2 tests the negative correction at a removed prime and the full-box normalisation. Empty S specialises to the ordinary setting. |
| AC.5.14 Localised patterns | Empty S, ℤ[1/2] and torsion but infinite cokernel test localisation. The containing-ideal construction no longer assumes local admissibility; Lipschitz-boundary locator corrected. |
| AC.5.15 Integer prime patterns | One form needs the quantitative progression estimate; in dimension one two nonzero independent slopes cannot occur. Positive dimensions, nonpositive affine values (Λ=0), local obstruction and the positive-region volume retained. |

## Lean signature comparisons

I compared these signatures with the full README hypotheses, not just their names:

| Declaration | Comparison |
| --- | --- |
| `fourier_zmod` | Normalisation `1/N`, negative Fourier sign and `[NeZero N]` agree with the pinned DFT. |
| `fourier_energy` | Ambient factor `card(G)³` and two indicator transforms match. |
| `rdist_eq_zero_of_isTauMinimizer` | Finite characteristic-two module and exactly `η=1/9`, not arbitrary penalty. |
| `entropic_pfr` | Same subgroup for both laws, sum bound eleven and separate bounds six. |
| `freiman_torsion_free` | Nonempty finite set, `K≥1`, torsion-free ambient group and proper containing progression. |
| `cyclic_bohr_contains_proper_gap` | Nonzero cyclic order, bounded frequency count, positive small radius and rank at most d+1. |
| `gowers_cauchy_schwarz` | Positive order, complex absolute value and all cube slots. |
| `intervalGowersNorm_independent_modulus` | Positive order/length and same-domain denominator, with admissible nonzero modulus. |
| `DegreeFiltration` / `filteredDerivative` | Degree-zero triviality and derivative direction match; no additive replacement of noncommutative multiplication. |
| `FilteredNilmanifold` | Finite-dimensional real model, Hausdorff Lie group, closed connected levels and cocompact lattice intersections. |
| `dense_generalised_von_neumann` | Prime cyclic group, `2≤k<p`, all slots one-bounded; this is not the one-sided interval theorem. |
| `szemeredi_varnavides` | Now all nonzero sufficiently large cyclic orders, with positive δ and pointwise `[0,1]` input. |
| `roth_density_increment` | Added N>0; `9700*N≤card(A)²`, nonempty progression and increment/length constants match the explicit argument. |
| `relative_progression_counting` | Coprime modulus, selected linear forms, dominated nonnegative inputs, dense comparison inputs and discrepancy in each slot. |
| `linear_equations_in_primes` | Positive d,t,L,A, bounded nonzero pairwise independent slopes, offsets bounded at scale N, convex domain and Λ of nonpositive values zero. |

The closing README-only list accounts for heavy nilsequence, factor, pseudorandomness, model and ideal carriers. There are no admitted examples, sorry-bodied data definitions or extra theory constructions. The later-current ideal-weight declarations remain README supplier contracts because they are absent at the Lean pin.

## Remaining defects required for acceptance

### R1: permitted supplier order and the finite-fields cycle

The package is outside the 94-roadmap Caraiani–Newton tier list. GeometryOfNumbersAndQuadraticArithmetic (tier 3, upstream PR #851), AnalyticNumberTheoryPartI (AnalyticNumberTheory's tier-14 ArithmeticStatistics bundle), ExponentialSumsAndCircleMethod and FiniteFieldsAndCharacterSums supply explicit contracts. That is not yet a certified upstream build order. In particular FF.1 imports AC.0's Fourier API, whereas AC.5.9 imports FF.2's character-sum bound. Their layer graph is acyclic but their separate-package graph has a cycle. The order file does not assign the claimed common bundle.

The necessary next action is an authorised placement/ownership reconciliation, with the precise lower suppliers already available when this package is ported. A reviewer cannot resolve this by inventing a bundle or transferring the Fourier API unilaterally. The README now describes the open mathematical dependency issue instead of presenting those alternatives as established. The SieveMethods finite-to-ideal adapter in R2 also needs a permitted placement once its interface is chosen. Its squarefree-ring sum-product and noncommutative-BSG requests are beyond this package's abelian targets and remain for routing by their owners.

### R2: exact analytic and ideal-sieve chains behind AC.5.8

AC.5.8 names arithmetic endpoints but still leaves the following inputs without full intermediate chains or exact consumed supplier targets:

- A **family** Landau–Page theorem and the ineffective Siegel lower bound for primitive finite-order Hecke characters over general K. AnalyticNumberTheoryPartI's Dirichlet results over ℚ are insufficient. I additionally read [ZerosOfLFunctions at cce2e041](https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md), §§6.3–6.4 and 8.6–8.7: its exception is per character, and it expressly leaves the family theorem and conductor-uniform Siegel bound outside scope.
- The general unitary-character analytic estimates, with archimedean conductor and norm-twist normalisation, used for Mitsui's sector/residue-class estimate uniformly in the growing conductor range. A bound on finite conductor alone does not bound archimedean frequency or distinguish norm twists. [LFunctions at e632e3a4](https://github.com/roed-math/TauCetiRoadmap/blob/e632e3a41fc257fce7b0d9938d48507b962f4fbb/TauCetiRoadmap/LFunctions/README.md), Layers 5–6, supplies finite-order and algebraic-character analytic theory, not arbitrary continuous unitary infinity types. Consume those existing targets; general unitary functional equations belong to AutomorphicSpectralTheory or AutomorphicLFunctionsAndLocalFactors, as the binding ownership rule states. The needed continuation/functional equation does not itself supply the quantitative zero-free and sector theorem. Kai Theorem 6.1, Proposition 6.4 and Appendix B name these analytic inputs but do not turn the package's ideal/norm prerequisites into a proof chain.
- The **ideal-indexed adaptation** of the fundamental sieve lemma, with the product-dimension estimate and norm-cutoff remainder sum actually used in the local model count and Vaughan model decomposition. SieveMethods §1.2 already states `SieveBrun.brun_main_term_bounds` and `brun_fundamental_estimate`, with `β=9κ+1`, `u≥β` and relative error `exp(β−u)K^10`. This is not missing generic Brun theory. Its native natural-prime carrier does not directly encode distinct prime ideals with equal norm. Give the label-preserving ideal/free-monoid adaptation, the exact error and the application parameters of Kai Lemma B.2, p. 64, or map them to an existing eligible owner. Do not duplicate the finite Brun construction.

These missing chains feed the Siegel model, Mitsui estimate, Cramér local count and ideal Vaughan decomposition, then AC.5.9–AC.5.15. The README records them explicitly. The new Type I/II contracts and the fixes above do not supply these earlier analytic and sieve inputs. This is a specific closure defect, not an assertion that the cited number-field theorems are false.

## Validation

- `lean-check` on package Suggested.lean: exit 0; 67 warnings, all `declaration uses sorry`, no other warnings or errors.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/AdditiveCombinatorics/Suggested.lean`: exit 0.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AdditiveCombinatorics.json`: 0 errors and 0 warnings; packet unchanged.
- `python3 research/blueprint/intake.py check-files` on all changed deliverables and the handoff: 0 problems.
- `git diff --check`: exit 0.

The Lean check used the shared pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Nothing was built or edited in the current-library/current-roadmap checkouts. No suspicious instruction in untrusted source material was observed.
