# Handoff: PKG-DirichletPadicLFunctions~codex

Issue #10109. Agent: Codex, session codex-71UQ5y. Package prepared for independent review with the explicit arithmetic limitations below, 2026-10-17. Only the three package files and this handoff are changed. The README is the normative mathematical plan; the Lean file is a compact set of signatures, not a formalisation of the roadmap.

## Deliverables and coverage

The package consolidates all six accepted inputs: L0 (75 statements), L1 (149), L2 (251), L3 (1,668), L3-2 (79) and L4 (190), 2,412 total. The supplemental completed-zeta branch is integrated into Layers 3 and 4 rather than appended as another roadmap. Repeated native-carrier transport and proof-step statements become the corresponding named target's API and proof outline; they are not separate Lean developments. The table below retains an entry for every input statement, including those absorbed as APIs, supplied elsewhere or mathematically corrected. Entries identify the principal destination; its standing hypotheses and supplier contracts also apply. Section families are audit references, not a claim that every original statement survives unchanged.

README: six layers, exact suppliers, conventions, named interfaces, worked examples, ≥3 discriminating Checks for the constructions, printed source locators and references. Suggested.lean: real-bodied light definitions, representative milestones, native carriers, computed examples and one closing block naming the absent constructions. Metadata: math.NT.

## Limits, corrections and what is not claimed

* The general exceptional-zero **nonvanishing** argument is not supplied by an arbitrary Gamma-log adapter. The formula is retained, and simplicity has an explicit nonzero-character-projection hypothesis. Gross–Dasgupta §2, pp.4–5 invokes p-adic Baker theory plus arithmetic independence. The lower-tier transcendence package supplies complex Baker and multiplicative p-adic estimates, not that missing Brumer independence statement. The README does not pretend otherwise. The unconditional version of `rjw2-fg-simple-zero` is not supported by this package's suppliers; its precise conditional replacement is §4.14. A future unconditional implementation must prove/import the specific algebraic p-adic logarithm independence and the Gauss-product divisor independence.
* The common-period Gross–Koblitz logarithm law does not give the unweighted law for sums over varying least periods. §4.6 retains Phi with the period multiplicities and makes Mean=Phi/d the ordinary distribution. No integrality of every Mean or universality/kernel characterization of the scalar logarithm realization is asserted. Those stronger readings are unsupported.
* Kubert Proposition 3.3's smooth-open-interval wording needs endpoint control: the Clausen/imaginary Li2 example is a counterexample without it. §4.10 gives the explicit bounded-derivative/endpoint version and the actual two-parameter L2 classification; it does not claim a one-dimensional complex L2 space or injectivity at k=1.
* The dyadic modulus-four Morita congruence is false. §4.1 excludes that exponent and uses a cofinal n+3 approximation. The dyadic analytic mean uses q=4 and a strictly larger Taylor radius; the exp/log model uses its safe smaller ball.
* RJW Theorem 5.20 must carry the omega inverse when expressed additively. The sign in Proposition 4.4's geometric inverse and the subtraction in Lemma 7.5 are fixed by explicit coefficients/mass. The principal residue uses a=p+1 and the dyadic chart gamma=5, never a generator of all dyadic units.
* Zhao Appendix B's natural interval is 1≤m<n. Its Gamma antidifference is log Gamma(n), not log Gamma(n+1). Appendix A's positive representative and permutation are retained exactly. The bibliography uses printed pages 460–479, Proposition A1 and Examples B1–B2.
* The full Eisenstein constant is Tw_x(zeta)/2, with denominator 2(u delta_u−1). It is not an ordinary pseudomeasure or bounded scalar measure; the inverse-coordinate character detects the pole. Positive coefficients are integral independently of parity, but comparison to a nonzero modular form requires parity. Actual left level >1 has zero arithmetic constant, including a principal character at that level.
* Dyadic all-test half-integrality fails at every actual tame level D>1, including principal and imprimitive characters. §5.7 preserves the full scalar criterion, character variation and nearby quadratic reference. D=1 is the zero tame-kernel adapter with G=2E+, not the principal localized family.
* Arithmetic source results are GL1 results; no unsupported general reductive/automorphic theorem is inferred. Finite Cartan and universal-distribution theorems are stated in all positive dimensions, with degree one as a Check. Algebraic identities are over rings/groups when possible; characteristic zero and analytic hypotheses appear only where needed. No equal-characteristic Gamma or logarithm theorem is claimed. ComputationalNumberTheory is not a dependency: any certified numerical input is explicit data.

The analytic-series, finite-residue and scalar-integrality extensions whose proofs are elementary consequences of the cited sources are identified as such, not misattributed to a printed theorem. None of the roadmap targets is claimed proved merely because Lean accepts `sorry`.

## Ownership and duplication audit

Read current TauCetiRoadmap main at 0d144d044dacebca17b654695b6f1ad58f159b27 and current Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, without running Lake there. Searches covered actual measure/Amice carriers, character conductors and change-level, generalized Bernoulli, primitive Gauss products, p-adic log and series division, Eisenstein forms/q-expansions, free quotients, Witt/unramified models, representations/cohomology and profinite limits. Read the relevant current LocalGaloisGroups and ProfiniteArithmetic contracts and inspected all newer-roadmap directories by object. None supplies the arithmetic Morita, Dirichlet-measure or Cartan-distribution construction retained here.

| Input notion removed as a new construction | Existing owner and exact contract used |
|---|---|
| Bounded functional/Dirac carrier | Mathlib `AbstractMeasure`, `dirac`, `dirac_apply`; native continuous linear maps |
| Integral inverse Mahler/Amice transform | Mathlib `AbstractMeasure.invTransform`, `amiceTransformEquiv`, transform coefficient and injectivity APIs |
| Formal series unit inversion | Mathlib `PowerSeries.invOfUnit`; actual unit certificate, no T inverse |
| Generic clopen restriction, zero extension, measure convolution, finite quotient algebra, charts and pseudomeasure localization | PadicMeasuresIwasawaAlgebras Layers 0–2 and unit-chart/pseudomeasure contracts; arithmetic right-hand sides stay here |
| Generic distribution coefficient evaluation, Taylor-majorant interchanges, differentiation and antidifference | LocallyAnalyticDistributions, exact analytic contracts in README |
| Native conductor/primitive inducing character and level raising | Mathlib `DirichletCharacter` conductor, primitiveCharacter, changeLevel and L-function Euler-factor APIs |
| Generalized Bernoulli definition | Current Tau Ceti `DirichletCharacter.GeneralizedBernoulli`: generalizedBernoulli, generalizedBernoulli_def, map_generalizedBernoulli, generalizedBernoulli_modOne, generalizedBernoulli_zero; endpoint convention audited |
| Composite primitive Gauss product | Current Tau Ceti `DirichletCharacter.GaussSum`: gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive; additive and multiplicative primitivity retained |
| Coset character-separation witness | Pinned Tau Ceti `exists_alt_unit_in_coset_with_char_separation`, actually imported and used in Lean |
| Local logarithm convergence/injectivity | Current Tau Ceti `NumberTheory.LocalField.Logarithm`: hasSum_log_of_mem_unitFiltration_one, continuous_log_unitFiltration, valuation_log, log_unitFiltration_injective with e<(p−1)i |
| Scalar p-adic series division and evaluation | Current Tau Ceti `NumberTheory.Padics.PowerSeries`: X_sub_C_mul_divXSubC_add_C_aeval, X_sub_C_mul_divXSubC, X_sub_C_dvd_iff_aeval_eq_zero |
| Completed algebra character division | Current Tau Ceti completedGroupAlgebra and of_sub_algebraMap_dvd_algebraMap_add_of_mem, only with its commutative pro-p/closed cyclic hypotheses |
| Primitive-pair positive Eisenstein forms and raising level | Current Tau Ceti normalizedCharEisensteinSeriesMF, its qExpansion coefficients, and normalizedCharEisensteinSeriesMFRaise; weight≥3, primitive right character and parity retained |
| General Mellin/Gamma/Zeta analytic carriers | Mathlib mellin, Complex.Gamma, riemannZeta continuation/negative values; only arithmetic normalizations and comparison targets retained |
| Unramified extensions, Witt rings and local Galois structure | Existing Mathlib/Tau Ceti carriers and LocalFieldsRamification/LocalGaloisGroups; no second local-field theory |
| Generic profinite powers and inverse limits | Current ProfiniteArithmetic and native profinite/category/module limits; only actual Cartan maps and cofinal comparisons retained |
| Generic free abelian quotients and C2 cohomology | Mathlib FreeAbelianGroup, subgroup quotients, representation and cohomology; actual distribution relations and representative equivalences retained |
| Complex Baker theorem | Lower-tier DiophantineApproximationAndTranscendence Layer 3 §3.5, linearIndependent_cons_one_of_linearIndependent_rat and transcendental_sum_mul_of_linearIndependent; only finite cyclotomic application here |

Upward references in the old plans were removed. The following notions move down into this package, with their intended downstream owner redirected to this interface:

| Higher direction | Notion now owned here |
|---|---|
| QSeriesPartitionsAndMockModularForms | Arithmetic Eisenstein normalization, p stabilization, full localized constant, finite ordered divisor coefficient measures |
| IntegralIwasawaTheory | This GL1 arithmetic pseudomeasure, its actual character-field descent and Kummer/finite-level arithmetic interfaces; generic Iwasawa algebra remains PMIA |
| StableHomotopyKTheory | Universal weighted division quotients, integral ordinary basis and C2 parity/Tate representative comparisons needed for Kubert's theorem |
| AdicSpacesPartII | Scalar analytic branches on explicit p-adic discs and their localization/evaluation domain; no general adic-space construction |
| PadicDifferentialEquationsAndRigidCohomology | Concrete Dwork splitting scalar series and Robert factorial/telescope comparison needed for Gross–Koblitz |
| PadicHodgeTheory | The finite Gauss/Gamma arithmetic comparison; no period-ring or Hodge comparison input |

FoundationsAndLibraryIntegration and UPSTREAM placeholders are replaced by exact native declarations or named roadmap interfaces. Dependencies are lower tier or the ColemanIntegration bundle, never those higher directions. The source root-of-unity/logarithm interface uses ColemanIntegration; its generic analytic carriers use LAD, so those notions are not moved here a second time.

## Source verification

Read the public sources used, with printed locators: RJW Theorem 2.4/Lemmas 2.6–2.7 and §§4–8, pp.110–112 and 136–161; all 12 scanned pages of Morita, pp.255–266; Gross–Koblitz Theorem 1.7, Lemmas 2.3/2.11 and §3, pp.571–577; Robert Theorems 1–4 and appendices, pp.159–169; Kubert ordinary distribution §§1–4 and Appendix, pp.179–202; Kubert cohomology initial §1, pp.203–207; Zhao §4 and appendices, pp.470–474; Gross–Dasgupta §2, pp.3–5; Stein online §5 Definition 5.1/equation (4)/Theorem 5.8. The scanned mathematical formulas were inspected visually, not inferred from broken OCR. No uncleared book copy was used, and no source passage or PDF is committed. The roadmap reorganizes the mathematics by dependencies in its own words.

## Adversarial pass: cases and outcomes

The following case families apply to **each** statement indexed below, with the statement's hypotheses retained. Characteristic p, zero rings/modules, trivial groups, rank/dimension zero, level/exponent zero, noncompact domains and field-versus-integer-ring cases are tested as admissible instances when they satisfy the hypotheses; otherwise the exclusion is part of the verdict. Finite algebra retains its permitted degenerate cases; analytic arithmetic is not silently extended to them. The full source formula and the explicit special cases are checked independently of `sorry` elaboration.

| Family / README section | Instances tried | Result and change |
|---|---|---|
| §0.1 | exp(−t), t exp(−t), exp(−2t); nondecaying 1; s=0,−1,−3 | Half-line smoothness, endpoint derivatives and decay retained; coherent continuation replaces totalized Gamma quotient. |
| §0.2 | t=0, ±log 2; derivatives 1,2,3; raw 0/0 | Removable value 1, B1=−1/2; exponential bounds use a rate below 1. |
| §0.3 | a=0,1,2; a=2,b=3 third derivative; negative a | Real divided difference includes zero; Mellin decay only a>0; cocycle scale a^(n+1). |
| §0.4 | trivial conductor 1 at k=1; quadratic mod 3; principal mod 3; level 9 | Reuse native generalized Bernoulli; positive-endpoint B1=+1/2 at level one, conductor factors distinguished. |
| §0.5 | F=Q residue 1; trivial/odd infinity sign; first two Euler terms | Actual Tate/Dedekind continuation supplied, positive class-number residue, inverse uniformizer convention. |
| §1.1 | a=0,1,2,3; unit/nonunit a; F2, Z/4; coefficients 0,1,2 | Only unit a permits formal inverse; integral shifted coefficients rather than division by T. |
| §1.2 | a=1; p=2,a=3; masses and moments k=0,1,3; n=0 finite projection | Existing inverse Amice transform reused; coefficient and ordinary moments separated. |
| §1.3 | x=0 and x=1; p=2 sign; zero unit mass; inverse weighting | Restriction is on units, inverse coordinate zero outside; positive k guards k−1 formula. |
| §1.4 | u=1,−1,3; p=2; natural specialization; product 2 by 3 | All-test continuity from uniform bound; dyadic half-mass proved integral, not 2 invertible. |
| §1.5 | q=1; p=2,a=3; least-residue carries; level refinement | Actual PMIA finite recurrence; positive q and canonical inverse residue in explicit mass. |
| §1.6 | u=1,−1,p+1; p=2 nonprocyclic U; trivial/nontrivial characters | Zero denominator never evaluated; regular canonical a suffices without generator of whole dyadic U. |
| §1.7 | p=2; k=1 and higher; denominator with positive valuation | All-test Kummer inequalities and denominator loss; no bounded measure for unbounded zeta moments. |
| §2.1 | level 0 vs level 1 at x=0; trivial twist; weight 0; inverse twists | Native zero extension distinguishes constant 1 from unit indicator; restrictions agree on U. |
| §2.2 | primitive quadratic mod 3; quartic mod 5; zero additive index; composite conductor | Gauss orientation and additive primitivity explicit; no generic finite-field theorem applied to residue rings. |
| §2.3 | D=1; principal/nonprincipal; first coefficients; D nonunit | Finite series adapter defined for principal too; no identification with principal zeta measure. |
| §2.4 | p=2,D=3; principal D=1; residue 0 and unit residue; all-test inclusion | Native additive and integral measure carriers; bounded recurrence, actual characteristic-zero interpolation. |
| §2.5 | kernel at 0; nonprincipal quadratic; principal D=1; a=0,1 | Smooth removable kernel fixed; analytic L comparison requires nonprincipal/conductor hypotheses. |
| §2.6 | principal positive wild level; level zero; inverse twist; primitive inducing product | Intrinsic unit measure and ambient supported measure separated; conductor of product not assumed unchanged. |
| §2.7 | rational quadratic values; quartic field; splitting-field enlargement; composed embeddings | Smallest value field plus all-test descent; Fourier roots do not enlarge final field unnecessarily. |
| §2.8 | add new prime vs repeat prime; D=3 to 9; divisor powers; principal level adapter | Exact finite Euler operators and inverse-weight factor 1/q; actual level retained. |
| §3.1 | s=0,1; zero coefficients; analytic radius boundary; dyadic chart gamma=5 | Scalar series is actual convergent numerator; all derivatives have explicit factorial/log coefficients. |
| §3.2 | cA=1 or not 1; A=0; trivial finite character; s=1 | Branch uses omega inverse and angle^(−s); poles require nonzero derivative, not totalized quotient. |
| §3.3 | negative k; trivial character; valuation-t denominator; inverse twists | Inverse unit tests well-defined; quotient precision loses denominator valuation. |
| §3.4 | quadratic mod 3 phase; quartic inverse character; repeated logs; zero linear form | Principal Log phase fixed; Baker supplied below tier, nonzero actual log sum required. |
| §3.5 | t=0; trace at t=0; t=−2 only dyadic; zero/asymmetric weights; conductor prime | Strict-disc convergence and actual logarithm law; inversion requires w(−a)=e w(a), defect retained. |
| §3.6 | pure wild log(0); mixed conductor; trivial total character; Euler zero | Separate tame/mixed/pure-wild proofs; fiber cancellation precedes omitted zero arguments. |
| §3.7 | p=2,a=3,gamma=5; s=1; coordinate scale; k=1 | Actual numerator mass is nonzero; residue positive, derivative sign and chart scaling explicit. |
| §4.1 | p=2,G(1)=−1,G(5)=−3; p=3,G(4)=2; x=0; r=0 | Signed native Gamma; modulus-four counterexample excluded by admissible congruence exponents. |
| §4.2 | p=2,q=4; f=3 levels 12,48; constant/zero sample; first Taylor block | Common lcm levels, inverse derivative character twist, strict larger radius for mean convergence. |
| §4.3 | z=0; unit/nonunit shifts; p=2 safe exponential ball; first two coefficients | Actual convergent mean/Taylor model, finite reciprocal normalization, no invented analytic carrier. |
| §4.4 | p=2,f=4,a=13; zero orbit; x=0 reflection; a=p^f−1 endpoint | Least positive residue and digit carries distinguished; odd and dyadic reflection signs separated. |
| §4.5 | p=2,f=1,a=0; p=3,a=1; coefficients A0,A1,A2; k=1,3 digit bound | Robert all-prime Gauss convention; q=p^f splitting and explicit telescope, not assumed summability. |
| §4.6 | m=1; x=0; periods d and 2d; unequal preimage periods; class 0 | Mean=Phi/d is ordinary; Phi only period-weighted law. No unsupported scalar universality or integral mean. |
| §4.7 | empty S; m=1; X=0; weight 0 vs positive; m=2 on Z/1 | Full fibers, free abelian native quotient; [0] survives unless explicitly normalized. |
| §4.8 | d=1,N=1,2,3; d=2,N=2; admissible/composite divisor; exceptional primary vector | Integral basis uses admissible lifts, not primitive points alone; internal/global equality is proved. |
| §4.9 | d=1,2; N=1,2,3; zero ring; norm kernel h=2 over F2; phi=1 | Full norm is additive linear with Norm(x)Norm(y)=h Norm(xy); point root law required for descent. |
| §4.11 | N=1,2,3,6; d=1,2; a=0 vs primitive a; empty prime product | Actual C_d carrier; correction PRODUCT with off-prime p inverse; lattice is integral Z-span. |
| §4.12 | j=1 and j=−1 on Z; Q=0; Q=F2; levels N=1,2 | Torsion comparison requires torsion-free Q; ordinary H1 is negative Tate, not degree zero. |
| §4.13 | p=5,N=3,B=25: 17,1,8; n=0,1,3; N=1 | Finite permutation uses positive N and B>1; antidifference is log Gamma(x), not log Gamma(x+1). |
| §4.14 | quadratic mod 3; quartic mod 5; chi(p)=1; zero scalar logarithm | Derivative formula actual; simple zero only with nonzero projection input, no fake independence theorem. |
| §5.1 | p=2,n=6 moment 28; n=p; finite r=0,s=0; u=−1 power sequence | Divisor multiplicities and positive n retained; uniform fixed-component sequence excludes prime-power moments. |
| §5.2 | zero test; q and q^p; constant 0 vs −7/240; ideal 0 and unit ideal | Coefficientwise topology and all-coefficient congruences; no arbitrary power-series sup norm. |
| §5.3 | weights 4,6; p=2 constant −7/240; p=3 coefficients at 2 and 6 | Arithmetic normalization separate from library constant-one form; common rational q-expansion. |
| §5.4 | u=1,−1,3; p=2,e=3 gives 160; inverse character | Coordinate twist in denominator; localization at zero is zero ring, not an evaluable family. |
| §5.5 | p=2,u=3,e=3: constant −14/3; first coefficient 160; inverse test | Full constant localized, integral cleared series actual; quotient loses denominator valuation. |
| §5.6 | left vs right quadratic mod 3 at p=2,n=5; r=0,s=0; level one | Ordered weighted divisor sums, native positive comparisons and coefficient maps; no automatic modularity. |
| §5.7 | p=2,D=3 residue 1 mod4 gives 1/6 after half; D=1 half allowed; D=5,9,15 | All-test scalar criterion; quadratic reference includes principal levels; strict B<1 variation condition. |
| §5.8 | D=1,3,9; empty prime set; u=1 clearing; e=0 | Principal localized family distinct from zero level-one tame kernel; repeated prime factors ignored. |
| §5.9 | left level >1 including principal; opposite parity; weight 2 exceptional; ordered pair | Constant and actual modularity compared only under parity and genuine form/q-expansion hypotheses. |

## Per-input-statement pass table

Every row inherits the explicit instances and outcome of its family above. “API” means a proof/helper statement is absorbed into the named construction and its API at that destination, rather than exported as a new construction. Source/hypothesis corrections in the family table take precedence over the old input wording. The table is an audit index, not a list of formal proofs.

### Input L0: 75 statements

| Statement | Instances / destination | Result / change |
|---|---|---|
| `smoothed-value-complex` — Complex comparison of the smoothed rational value | §0.3 family cases | API under the family hypotheses. |
| `mellin-infinity-boundary` — The Mellin boundary term at infinity | §0.1 family cases | API under the family hypotheses. |
| `mellin-zero-boundary` — The Mellin boundary term at zero | §0.1 family cases | API under the family hypotheses. |
| `mellin-derivative-shift` — The unnormalized Mellin derivative shift | §0.1 family cases | API under the family hypotheses. |
| `normalized-mellin-derivative-shift` — The Gamma-normalized derivative shift | §0.1 family cases | API under the family hypotheses. |
| `mellin-derivative-at-one` — The endpoint integral of an iterated derivative | §0.1 family cases | API under the family hypotheses. |
| `mellin-shift-coherence` — Coherence of translated Mellin formulas | §0.1 family cases | API under the family hypotheses. |
| `normalized-mellin-continuation` — The continued normalized Mellin transform | §0.1 family cases | Target under the family hypotheses. |
| `normalized-mellin-admissible-shift` — Evaluation using any admissible shift | §0.1 family cases | API under the family hypotheses. |
| `normalized-mellin-initial-halfplane` — Agreement on the initial half-plane | §0.1 family cases | API under the family hypotheses. |
| `normalized-mellin-entire` — Entire continuation of the normalized Mellin transform | §0.1 family cases | Target under the family hypotheses. |
| `normalized-mellin-negative-values` — Nonpositive-integer values of the Mellin continuation | §0.1 family cases | Target under the family hypotheses. |
| `weighted-exponential-halfline-bound` — Uniform weighted-exponential bounds | §0.1 family cases | API under the family hypotheses. |
| `weighted-exponential-derivative` — Derivative of the weighted exponential sum | §0.1 family cases | API under the family hypotheses. |
| `reciprocal-exponential-geometric` — Geometric expansion of the reciprocal exponential | §0.1 family cases | API under the family hypotheses. |
| `reciprocal-exponential-iterated-derivative` — Iterated derivatives of the reciprocal exponential | §0.1 family cases | API under the family hypotheses. |
| `bernoulli-positive-derivative-formula` — Positive-half-line Bernoulli derivative formula | §0.2 family cases | API under the family hypotheses. |
| `bernoulli-ordinary-derivative-decay` — Exponential decay of every Bernoulli derivative | §0.2 family cases | Target under the family hypotheses. |
| `bernoulli-within-derivative-decay` — Decay on the actual Mellin half-line | §0.2 family cases | Target under the family hypotheses. |
| `smooth-bernoulli-kernel` — The smooth Bernoulli kernel | §0.2 family cases | Target under the family hypotheses. |
| `smooth-bernoulli-zero` — The Bernoulli kernel at zero | §0.2 family cases | API under the family hypotheses. |
| `smooth-bernoulli-away` — The Bernoulli quotient away from zero | §0.2 family cases | API under the family hypotheses. |
| `smooth-bernoulli-analytic` — Analyticity of the Bernoulli extension | §0.2 family cases | Target under the family hypotheses. |
| `smooth-bernoulli-smooth` — Smoothness of the Bernoulli extension | §0.2 family cases | API under the family hypotheses. |
| `smooth-bernoulli-product` — The Bernoulli exponential product identity | §0.2 family cases | API under the family hypotheses. |
| `smooth-bernoulli-derivative-recurrence` — The Bernoulli derivative recurrence | §0.2 family cases | API under the family hypotheses. |
| `smooth-bernoulli-derivatives` — Bernoulli derivatives at the origin | §0.2 family cases | Target under the family hypotheses. |
| `smooth-bernoulli-complex-smooth` — The complex-valued Bernoulli kernel | §0.2 family cases | API under the family hypotheses. |
| `smooth-bernoulli-within-values` — Bernoulli right derivatives at zero | §0.2 family cases | API under the family hypotheses. |
| `bernoulli-mellin-entire` — Entire Bernoulli Mellin continuation | §0.2 family cases | Target under the family hypotheses. |
| `bernoulli-mellin-values` — Bernoulli Mellin values | §0.2 family cases | Target under the family hypotheses. |
| `bernoulli-mellin-convergent` — Convergence of the Bernoulli Mellin integral | §0.2 family cases | API under the family hypotheses. |
| `bernoulli-mellin-dirichlet-sum` — The Bernoulli Mellin Dirichlet series | §0.2 family cases | API under the family hypotheses. |
| `bernoulli-mellin-gamma-zeta` — The Bernoulli Gamma–zeta integral | §0.2 family cases | Target under the family hypotheses. |
| `bernoulli-mellin-normalized-halfplane` — The normalized Bernoulli Mellin comparison | §0.2 family cases | API under the family hypotheses. |
| `bernoulli-mellin-zeta-comparison` — Bernoulli Mellin continuation and zeta | §0.2 family cases | Target under the family hypotheses. |
| `smoothed-mellin-kernel` — The smooth smoothed Mellin kernel | §0.3 family cases | Target under the family hypotheses. |
| `smoothed-kernel-away` — The smoothed exponential quotient | §0.3 family cases | API under the family hypotheses. |
| `smoothed-kernel-analytic` — Analyticity of the smoothed kernel | §0.3 family cases | Target under the family hypotheses. |
| `smoothed-kernel-smooth` — Smoothness of the smoothed kernel | §0.3 family cases | API under the family hypotheses. |
| `smoothed-kernel-product` — The smoothed kernel product identity | §0.3 family cases | API under the family hypotheses. |
| `smoothed-kernel-origin-derivatives` — Smoothed Bernoulli derivatives | §0.3 family cases | Target under the family hypotheses. |
| `smoothed-kernel-positive-derivatives` — Positive-half-line smoothed derivatives | §0.3 family cases | API under the family hypotheses. |
| `smoothed-kernel-derivative-decay` — Exponential decay of smoothed derivatives | §0.3 family cases | Target under the family hypotheses. |
| `smoothed-kernel-complex-smooth` — The complex smoothed kernel | §0.3 family cases | API under the family hypotheses. |
| `smoothed-kernel-within-values` — Smoothed right derivatives at zero | §0.3 family cases | API under the family hypotheses. |
| `smoothed-kernel-within-decay` — Smoothed decay on the Mellin half-line | §0.3 family cases | API under the family hypotheses. |
| `smoothed-kernel-mellin-entire` — Entire smoothed Mellin continuation | §0.3 family cases | Target under the family hypotheses. |
| `smoothed-kernel-mellin-values` — Smoothed Mellin special values | §0.3 family cases | Target under the family hypotheses. |
| `smoothed-mellin-convergent` — Convergence of the smoothed Mellin integral | §0.3 family cases | API under the family hypotheses. |
| `smoothed-mellin-gamma-zeta` — The smoothed Gamma–zeta integral | §0.3 family cases | Target under the family hypotheses. |
| `smoothed-mellin-normalized-halfplane` — The normalized smoothed half-plane identity | §0.3 family cases | API under the family hypotheses. |
| `smoothed-mellin-zeta-comparison` — The smoothed zeta comparison | §0.3 family cases | API under the family hypotheses. |
| `smoothed-zeta-pole-limit` — The smoothed zeta logarithmic limit | §0.3 family cases | API under the family hypotheses. |
| `smoothed-mellin-value-one` — The smoothed Mellin value at one | §0.3 family cases | Target under the family hypotheses. |
| `smoothed-kernel-zero` — The value of the smoothing kernel at the origin | §0.3 family cases | API under the family hypotheses. |
| `smoothed-kernel-cocycle` — Composition of smoothing kernels | §0.3 family cases | API under the family hypotheses. |
| `smoothed-kernel-commute` — Independence of the order of two smoothing parameters | §0.3 family cases | API under the family hypotheses. |
| `smoothed-origin-derivative-cocycle` — Composition of the origin derivatives | §0.3 family cases | API under the family hypotheses. |
| `smoothed-mellin-cocycle` — Composition of the convergent Mellin integrals | §0.3 family cases | API under the family hypotheses. |
| `smoothed-normalized-cocycle` — Composition of the entire normalized Mellin continuations | §0.3 family cases | API under the family hypotheses. |
| `generalized-bernoulli-nonprincipal` — Generalized Bernoulli comparison | §0.4 family cases | API under the family hypotheses. |
| `generalized-bernoulli-principal` — Principal-character Bernoulli endpoints | §0.4 family cases | API under the family hypotheses. |
| `normalized-value-complex-embedding` — Algebraicity of the complex special value | §0.1 family cases | Target under the family hypotheses. |
| `normalized-value-padic-embedding` — The p-adic image of the algebraic value | §0.1 family cases | API under the family hypotheses. |
| `dedekind-series-comparison` — The Dedekind series and Tate continuation | §0.5 family cases | API under the family hypotheses. |
| `dedekind-pole-clearing` — The analytic pole-clearing germ | §0.5 family cases | API under the family hypotheses. |
| `dedekind-real-residue-limit` — The residue limit of the continued germ | §0.5 family cases | API under the family hypotheses. |
| `dedekind-cleared-value` — The pole-clearing value at one | §0.5 family cases | API under the family hypotheses. |
| `dedekind-simple-pole` — The Dedekind zeta simple pole | §0.5 family cases | Target under the family hypotheses. |
| `dedekind-complex-residue` — The complex Dedekind residue | §0.5 family cases | Target under the family hypotheses. |
| `rational-idele-finite-normalization` — The rational finite-character normalization | §0.5 family cases | API under the family hypotheses. |
| `rational-idele-norm-power` — The complex norm-power normalization | §0.5 family cases | API under the family hypotheses. |
| `rational-idele-parity` — The finite-order infinity sign | §0.5 family cases | API under the family hypotheses. |
| `rational-idele-euler-normalization` — Commutativity of the Dirichlet–idele normalization | §0.5 family cases | API under the family hypotheses. |

### Input L1: 149 statements

| Statement | Instances / destination | Result / change |
|---|---|---|
| `smoothing-denominator` — Binomial smoothing denominator | §1.1 family cases | Target under the family hypotheses. |
| `denominator-coefficients` — Denominator coefficients | §1.1 family cases | API under the family hypotheses. |
| `denominator-constant` — Denominator constant coefficient | §1.1 family cases | API under the family hypotheses. |
| `denominator-factorization` — Binomial denominator factorization | §1.1 family cases | API under the family hypotheses. |
| `denominator-unit` — Unit smoothing denominator | §1.1 family cases | API under the family hypotheses. |
| `denominator-coefficient-map` — Denominator under coefficient change | §1.1 family cases | API under the family hypotheses. |
| `smoothed-series` — Integral smoothed power series | §1.1 family cases | Target under the family hypotheses. |
| `series-cancellation` — Integral cancellation equation | §1.1 family cases | API under the family hypotheses. |
| `series-cleared-equation` — Cancellation after multiplication by T | §1.1 family cases | API under the family hypotheses. |
| `series-uniqueness` — Uniqueness of the smoothed series | §1.1 family cases | Target under the family hypotheses. |
| `series-constant` — Smoothed constant coefficient | §1.1 family cases | API under the family hypotheses. |
| `series-coefficient-recurrence` — Smoothed coefficient recurrence | §1.1 family cases | API under the family hypotheses. |
| `series-coefficient-map` — Smoothed series under coefficient change | §1.1 family cases | API under the family hypotheses. |
| `series-fraction-comparison` — Rational formula for the smoothed series | §1.1 family cases | Target under the family hypotheses. |
| `smoothed-measure` — Arithmetic smoothing measure | §1.2 family cases | Target under the family hypotheses. |
| `measure-amice` — Amice transform of the smoothing measure | §1.2 family cases | API under the family hypotheses. |
| `measure-mahler` — Mahler values of the smoothing measure | §1.2 family cases | API under the family hypotheses. |
| `measure-uniqueness` — Uniqueness of the smoothing measure | §1.2 family cases | API under the family hypotheses. |
| `denominator-exp-factorization` — Exponential denominator factorization | §1.1 family cases | API under the family hypotheses. |
| `bernoulli-denominator-comparison` — Bernoulli denominator comparison | §1.1 family cases | API under the family hypotheses. |
| `series-exp-bernoulli` — Smoothed Bernoulli generating series | §1.1 family cases | Target under the family hypotheses. |
| `series-exp-coefficients` — Factorial-normalized smoothing coefficients | §1.1 family cases | API under the family hypotheses. |
| `measure-ordinary-moment` — Ordinary moments of the smoothing measure | §1.2 family cases | Target under the family hypotheses. |
| `smoothed-value-integral` — Integrality of smoothed Bernoulli values | §1.1 family cases | Target under the family hypotheses. |
| `smoothing-root-average` — Cyclotomic average of the smoothing fractions | §1.1 family cases | API under the family hypotheses. |
| `series-phi-psi-fixed` — Frobenius comparison for the smoothed series | §1.1 family cases | API under the family hypotheses. |
| `series-psi-fixed` — Psi invariance of the smoothing series | §1.1 family cases | Target under the family hypotheses. |
| `measure-psi-fixed` — Psi invariance of the smoothing measure | §1.2 family cases | Target under the family hypotheses. |
| `measure-one` — Trivial smoothing measure | §1.2 family cases | API under the family hypotheses. |
| `unit-smoothed-measure` — Unit restriction of the smoothing measure | §1.3 family cases | Target under the family hypotheses. |
| `unit-smoothed-support` — Unit support of the restricted smoothing measure | §1.3 family cases | API under the family hypotheses. |
| `unit-smoothed-difference` — Euler projector on the arithmetic measure | §1.3 family cases | API under the family hypotheses. |
| `unit-smoothed-euler` — Euler factor for unit moments | §1.3 family cases | API under the family hypotheses. |
| `unit-smoothed-moment` — Smoothed Bernoulli values on units | §1.3 family cases | Target under the family hypotheses. |
| `unit-smoothed-mass` — Zero mass of the unit smoothing measure | §1.3 family cases | API under the family hypotheses. |
| `unit-smoothed-integral` — Integrality of Euler-smoothed Bernoulli values | §1.3 family cases | Target under the family hypotheses. |
| `smoothed-numerator` — Arithmetic numerator measure | §1.3 family cases | Target under the family hypotheses. |
| `numerator-support` — Unit support of the arithmetic numerator | §1.3 family cases | API under the family hypotheses. |
| `numerator-weight` — Primitive equation for the numerator | §1.3 family cases | API under the family hypotheses. |
| `numerator-unique` — Unique unit-supported arithmetic primitive | §1.3 family cases | Target under the family hypotheses. |
| `numerator-moment-shift` — Moment shift under inverse weighting | §1.3 family cases | API under the family hypotheses. |
| `numerator-moment` — Bernoulli moments of the arithmetic numerator | §1.3 family cases | Target under the family hypotheses. |
| `numerator-integral` — Integrality of numerator Bernoulli moments | §1.3 family cases | Target under the family hypotheses. |
| `numerator-amice` — Amice transform of the arithmetic numerator | §1.3 family cases | API under the family hypotheses. |
| `measure-smoothing-cocycle` — Multiplication of smoothing parameters | §1.2 family cases | API under the family hypotheses. |
| `measure-cross-smoothing` — Cross-smoothing before inverse weighting | §1.2 family cases | API under the family hypotheses. |
| `measure-reflection` — Reflection with the zero-atom correction | §1.2 family cases | API under the family hypotheses. |
| `numerator-smoothing-cocycle` — Smoothing cocycle for the unit numerator | §1.3 family cases | API under the family hypotheses. |
| `numerator-cross-smoothing` — Cross-smoothing for the unit numerator | §1.3 family cases | API under the family hypotheses. |
| `numerator-even` — Evenness of the unit numerator | §1.3 family cases | API under the family hypotheses. |
| `smoothed-series-euler-values` — Formal smoothed derivative values | §1.1 family cases | API under the family hypotheses. |
| `smoothed-measure-formal-values` — Arithmetic and formal smoothing moments | §1.2 family cases | API under the family hypotheses. |
| `smoothed-extension-amice` — The extended smoothing Amice series | §1.1 family cases | API under the family hypotheses. |
| `smoothed-extension-unique` — Uniqueness of the extended smoothing measure | §1.1 family cases | API under the family hypotheses. |
| `smoothed-extension-integral-descent` — Integral descent of the extended smoothing measure | §1.1 family cases | Target under the family hypotheses. |
| `smoothed-extension-moments` — Moments of the extended smoothing measure | §1.2 family cases | Target under the family hypotheses. |
| `unit-smoothed-extension-moments` — Moments of the extended unit smoothing measure | §1.3 family cases | Target under the family hypotheses. |
| `smoothed-numerator-extension-moments` — Moments of the extended arithmetic numerator | §1.3 family cases | Target under the family hypotheses. |
| `intrinsic-numerator` — Arithmetic numerator on the unit group | §1.3 family cases | Target under the family hypotheses. |
| `intrinsic-numerator-inclusion` — Inclusion of the intrinsic arithmetic numerator | §1.3 family cases | API under the family hypotheses. |
| `intrinsic-numerator-moment` — Bernoulli moments on the unit group | §1.3 family cases | Target under the family hypotheses. |
| `intrinsic-numerator-dirac` — Dirac action on the arithmetic numerator | §1.3 family cases | API under the family hypotheses. |
| `intrinsic-numerator-cocycle` — Multiplicative smoothing cocycle on units | §1.3 family cases | API under the family hypotheses. |
| `intrinsic-numerator-cross` — Cross-smoothing in the unit measure algebra | §1.3 family cases | API under the family hypotheses. |
| `intrinsic-numerator-even` — Even intrinsic arithmetic numerator | §1.3 family cases | API under the family hypotheses. |
| `intrinsic-numerator-extension-inclusion` — Coefficient extension of the intrinsic numerator | §1.3 family cases | API under the family hypotheses. |
| `intrinsic-numerator-extension-moment` — Coefficient-valued numerator moments on units | §1.3 family cases | Target under the family hypotheses. |
| `intrinsic-numerator-norm` — Integral norm bound for the arithmetic numerator | §1.3 family cases | API under the family hypotheses. |
| `finite-smoothed-moments` — Finite combinations of Bernoulli moments | §1.2 family cases | API under the family hypotheses. |
| `generalized-smoothed-kummer` — Generalized smoothed Kummer bound | §1.7 family cases | Target under the family hypotheses. |
| `weight-period-smoothed-kummer` — Weight-period congruence for smoothed Bernoulli values | §1.7 family cases | Target under the family hypotheses. |
| `unit-denominator-kummer` — Kummer congruence with unit smoothing denominators | §1.7 family cases | Target under the family hypotheses. |
| `padic-smoothing-series` — Smoothing series at a p-adic unit | §1.4 family cases | Target under the family hypotheses. |
| `padic-smoothing-series-natural` — Agreement with natural smoothing series | §1.4 family cases | API under the family hypotheses. |
| `padic-smoothing-coefficients-continuous` — Continuous smoothing coefficients | §1.4 family cases | API under the family hypotheses. |
| `padic-smoothed-measure` — Integral smoothing measures at p-adic units | §1.4 family cases | Target under the family hypotheses. |
| `padic-smoothed-measure-natural` — Agreement with natural smoothing measures | §1.4 family cases | API under the family hypotheses. |
| `padic-smoothed-measure-weak-continuity` — Weak continuity in the smoothing parameter | §1.4 family cases | API under the family hypotheses. |
| `padic-smoothed-ordinary-moments` — Ordinary moments for every smoothing unit | §1.4 family cases | Target under the family hypotheses. |
| `padic-measure-psi-fixed` — Psi invariance at every smoothing unit | §1.4 family cases | Target under the family hypotheses. |
| `padic-smoothed-numerator` — Ambient arithmetic numerator at a p-adic unit | §1.4 family cases | Target under the family hypotheses. |
| `padic-numerator-natural` — Natural compatibility of ambient numerators | §1.4 family cases | API under the family hypotheses. |
| `padic-numerator-moments` — Positive moments of all-unit ambient numerators | §1.4 family cases | Target under the family hypotheses. |
| `padic-intrinsic-numerator` — Integral numerator on units for every smoothing unit | §1.4 family cases | Target under the family hypotheses. |
| `padic-intrinsic-inclusion` — Inclusion of the all-unit intrinsic numerator | §1.4 family cases | API under the family hypotheses. |
| `padic-intrinsic-natural` — Natural compatibility of intrinsic numerators | §1.4 family cases | API under the family hypotheses. |
| `padic-intrinsic-moments` — Positive moments of intrinsic all-unit numerators | §1.4 family cases | Target under the family hypotheses. |
| `padic-intrinsic-continuity` — Weak continuity of intrinsic arithmetic numerators | §1.4 family cases | API under the family hypotheses. |
| `padic-measure-cocycle` — The smoothing cocycle for every unit | §1.4 family cases | API under the family hypotheses. |
| `padic-measure-reflection` — Reflection with its zero-atom correction | §1.4 family cases | API under the family hypotheses. |
| `padic-numerator-cocycle` — The scalar-free numerator cocycle | §1.4 family cases | API under the family hypotheses. |
| `padic-numerator-even` — Evenness of every ambient numerator | §1.4 family cases | API under the family hypotheses. |
| `padic-intrinsic-dirac` — Dirac action on every intrinsic numerator | §1.4 family cases | API under the family hypotheses. |
| `padic-intrinsic-cocycle` — The all-unit intrinsic smoothing cocycle | §1.4 family cases | API under the family hypotheses. |
| `padic-intrinsic-cross` — Cross-numerator identity for every pair of units | §1.4 family cases | API under the family hypotheses. |
| `padic-intrinsic-even` — Evenness of every intrinsic numerator | §1.4 family cases | API under the family hypotheses. |
| `arithmetic-fraction-clearing` — All-unit clearing of the arithmetic fraction | §1.6 family cases | API under the family hypotheses. |
| `arithmetic-pseudomeasure` — The arithmetic Kubota–Leopoldt pseudomeasure | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-pseudomeasure-clearing` — Clearing every unit difference of the arithmetic pseudomeasure | §1.6 family cases | API under the family hypotheses. |
| `arithmetic-pseudomeasure-numerator` — The arithmetic numerator agrees with the supplier numerator | §1.6 family cases | API under the family hypotheses. |
| `arithmetic-pseudomeasure-regular-parameter` — Independence of every regular smoothing parameter | §1.6 family cases | API under the family hypotheses. |
| `arithmetic-pseudomeasure-unique` — Uniqueness from the arithmetic numerators | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-pseudomeasure-even` — Integral evenness of the arithmetic pseudomeasure | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-positive-bernoulli` — Positive Bernoulli moments of the arithmetic pseudomeasure | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-euler-zeta-comparison` — The rational Euler value and complex zeta | §1.6 family cases | API under the family hypotheses. |
| `arithmetic-positive-interpolation` — Interpolation through a shared rational value | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-interpolation-unique` — Uniqueness from every positive interpolation value | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-odd-moments` — Vanishing of every odd positive interpolation value | §1.6 family cases | API under the family hypotheses. |
| `arithmetic-euler-value-norm` — The norm of Euler–Bernoulli interpolation values | §1.6 family cases | API under the family hypotheses. |
| `arithmetic-positive-moment-norm` — Large norms of actual arithmetic pseudomoments | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-not-integral` — The arithmetic pseudomeasure is not integral | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-growing-moments` — An explicit sequence of growing arithmetic moments | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-unbounded-moments` — Positive arithmetic moments are unbounded | §1.7 family cases | Target under the family hypotheses. |
| `arithmetic-no-field-measure` — No bounded field-valued measure has these moments | §1.6 family cases | Target under the family hypotheses. |
| `smoothing-geometric-denominator` — Geometric form of the smoothing denominator | §1.1 family cases | API under the family hypotheses. |
| `smoothing-geometric-cancellation` — Finite geometric cancellation for the smoothing series | §1.1 family cases | API under the family hypotheses. |
| `padic-intrinsic-identity` — Arithmetic numerator at the identity | §1.4 family cases | API under the family hypotheses. |
| `padic-intrinsic-negative-identity` — Arithmetic numerator at negative one | §1.4 family cases | API under the family hypotheses. |
| `smoothed-translation-difference` — The translation difference of the smoothing measure | §1.1 family cases | API under the family hypotheses. |
| `smoothed-residue-recurrence` — The finite recurrence for smoothing masses | §1.5 family cases | API under the family hypotheses. |
| `smoothed-residue-coefficients` — Exact residue masses of the smoothing measure | §1.5 family cases | Target under the family hypotheses. |
| `arithmetic-character-clearing` — Character evaluation of every arithmetic numerator | §1.6 family cases | API under the family hypotheses. |
| `arithmetic-character-ratio` — The arithmetic character ratio | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-character-positive` — Power characters recover the interpolation values | §1.6 family cases | API under the family hypotheses. |
| `arithmetic-character-odd` — Odd characters vanish | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-character-combination` — Finite character combinations through one smoothing measure | §1.6 family cases | API under the family hypotheses. |
| `arithmetic-character-kummer` — Denominator-qualified character Kummer bound | §1.7 family cases | Target under the family hypotheses. |
| `arithmetic-character-difference` — Precision loss from the two smoothing denominators | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-character-unit-denominators` — Integral-unit denominators preserve character precision | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-fixed-character-weight-period` — Weight congruences in a fixed character component | §1.6 family cases | Target under the family hypotheses. |
| `arithmetic-completed-transport` — Completed-algebra form of the arithmetic pseudomeasure | §1.6 family cases | API under the family hypotheses. |
| `arithmetic-plus-corner` — The arithmetic element in the odd-prime plus corner | §1.6 family cases | API under the family hypotheses. |
| `arithmetic-sign-quotient` — Arithmetic descent through the sign quotient | §1.6 family cases | API under the family hypotheses. |
| `arithmetic-coefficient-naturality` — Coefficient extension of the arithmetic pseudomeasure | §1.6 family cases | API under the family hypotheses. |
| `padic-smoothing-series-negative` — F_(−1)=−1. | §1.4 family cases | API under the family hypotheses. |
| `padic-smoothed-measure-negative` — μ_(−1)=−δ_0 as an actual integral measure. | §1.4 family cases | API under the family hypotheses. |
| `padic-smoothed-measure-fixed-test-continuity` — For every fixed continuous integral test f, u↦μ_u(f) is continuous U→Z. | §1.4 family cases | API under the family hypotheses. |
| `padic-unit-restriction-difference` — Eμ_u=μ_u−φμ_u for every smoothing unit. | §1.4 family cases | API under the family hypotheses. |
| `padic-numerator-support` — Eν_u=ν_u. | §1.4 family cases | API under the family hypotheses. |
| `padic-numerator-weight` — Wν_u=Eμ_u. | §1.4 family cases | API under the family hypotheses. |
| `padic-numerator-negative` — ν_(−1)=0. | §1.4 family cases | API under the family hypotheses. |
| `padic-numerator-fixed-test-continuity` — For each fixed integral continuous test f, u↦ν_u(f) is continuous. | §1.4 family cases | API under the family hypotheses. |
| `smoothed-residue-carry` — Carry identities for the arithmetic smoothing residues | §1.5 family cases | API under the family hypotheses. |
| `smoothed-residue-candidate-recurrence` — Recurrence of the proposed smoothing coefficients | §1.5 family cases | API under the family hypotheses. |
| `smoothed-residue-candidate-mass` — Total mass of the proposed smoothing coefficients | §1.5 family cases | API under the family hypotheses. |
| `smoothed-residue-mass` — Total mass of the actual smoothing residues | §1.5 family cases | API under the family hypotheses. |
| `smoothed-kernel-formal-derivatives` — Analytic and formal smoothing derivatives | §1.1 family cases | API under the family hypotheses. |
| `smoothed-mellin-formal-values` — Mellin and formal smoothing values | §1.1 family cases | API under the family hypotheses. |
| `smoothed-translation-sum` — A finite translation identity for the smoothing measure | §1.1 family cases | API under the family hypotheses. |

### Input L2: 251 statements

| Statement | Instances / destination | Result / change |
|---|---|---|
| `prime-power-character` — Continuous p-power Dirichlet character | §2.1 family cases | Target under the family hypotheses. |
| `prime-power-character-support` — Vanishing of character lifts off the units | §2.1 family cases | API under the family hypotheses. |
| `prime-power-character-level` — Independence of a positive p-power level | §2.1 family cases | API under the family hypotheses. |
| `twisted-smoothed-measure` — Dirichlet-character twist of the smoothed measure | §2.1 family cases | Target under the family hypotheses. |
| `twisted-smoothed-support` — Unit support of the actual character twist | §2.1 family cases | API under the family hypotheses. |
| `twisted-smoothed-principal` — The principal twist is the unit projection | §2.1 family cases | API under the family hypotheses. |
| `twisted-smoothed-level` — Positive-level compatibility of arithmetic twists | §2.1 family cases | API under the family hypotheses. |
| `twisted-smoothed-product` — Successive character twists of the arithmetic measure | §2.1 family cases | API under the family hypotheses. |
| `tame-numerator` — Finite numerator for a tame character | §2.3 family cases | Target under the family hypotheses. |
| `tame-numerator-cancellation` — Cancellation of the character pole | §2.3 family cases | API under the family hypotheses. |
| `tame-series` — The tame unit-denominator series | §2.3 family cases | Target under the family hypotheses. |
| `tame-generating-equation` — Finite Dirichlet generating equation | §2.4 family cases | API under the family hypotheses. |
| `tame-coefficient-bound` — Integral bound for tame coefficients | §2.4 family cases | API under the family hypotheses. |
| `tame-coefficient-sequence` — Bounded tame coefficient sequence | §2.4 family cases | Target under the family hypotheses. |
| `tame-measure` — Measure of the finite tame kernel | §2.4 family cases | Target under the family hypotheses. |
| `tame-measure-norm` — Norm bound for the tame kernel measure | §2.4 family cases | API under the family hypotheses. |
| `tame-measure-unique` — Characterization by the arithmetic denominator | §2.4 family cases | API under the family hypotheses. |
| `tame-gauss-generating` — Finite Gauss denominator equation | §2.4 family cases | API under the family hypotheses. |
| `tame-gauss-series` — Gauss formula for the tame series | §2.4 family cases | Target under the family hypotheses. |
| `tame-gauss-coefficients` — Alternating Gauss coefficient formula | §2.4 family cases | API under the family hypotheses. |
| `tame-gauss-measure` — Gauss transform of the tame measure | §2.4 family cases | API under the family hypotheses. |
| `tame-integral-series` — The integral tame series | §2.4 family cases | Target under the family hypotheses. |
| `tame-integral-test-bound` — Integral test bound for the tame measure | §2.4 family cases | API under the family hypotheses. |
| `tame-integral-measure` — The integral tame measure | §2.4 family cases | Target under the family hypotheses. |
| `tame-integral-amice` — Integral Amice coefficient transport | §2.4 family cases | API under the family hypotheses. |
| `tame-integral-measure-unique` — Uniqueness on integral-valued tests | §2.4 family cases | API under the family hypotheses. |
| `tame-translation` — Translation equation for the tame measure | §2.4 family cases | API under the family hypotheses. |
| `tame-residue-coefficients` — Exact finite tame residue masses | §2.4 family cases | API under the family hypotheses. |
| `tame-psi` — The tame psi eigenrelation | §2.4 family cases | Target under the family hypotheses. |
| `tame-integral-psi` — Integral tame psi comparison | §2.4 family cases | API under the family hypotheses. |
| `tame-unit-restriction` — Tame restriction to units | §2.4 family cases | Target under the family hypotheses. |
| `tame-unit-moments` — Euler factor for ordinary tame moments | §2.4 family cases | Target under the family hypotheses. |
| `tame-bernoulli-generating` — Finite Bernoulli generating identity | §2.4 family cases | API under the family hypotheses. |
| `tame-exponential-coefficients` — Exponential coefficients of the tame kernel | §2.4 family cases | API under the family hypotheses. |
| `tame-formal-moments` — Formal ordinary tame moments | §2.4 family cases | Target under the family hypotheses. |
| `tame-algebraic-value-map` — Coefficient transport of tame arithmetic values | §2.4 family cases | API under the family hypotheses. |
| `tame-complex-special-values` — Complex tame special values | §2.5 family cases | Target under the family hypotheses. |
| `tame-ordinary-moments` — Bernoulli moments of the actual tame measure | §2.4 family cases | Target under the family hypotheses. |
| `tame-special-value-comparison` — Common algebraic tame special value | §2.4 family cases | API under the family hypotheses. |
| `tame-unit-special-value-comparison` — Common algebraic unit special value | §2.4 family cases | API under the family hypotheses. |
| `tame-zeta-measure` — The tame zeta measure | §2.6 family cases | Target under the family hypotheses. |
| `tame-zeta-support` — Unit support of the tame zeta measure | §2.6 family cases | API under the family hypotheses. |
| `tame-zeta-weight` — Multiplication by x recovers the unit measure | §2.6 family cases | Target under the family hypotheses. |
| `tame-zeta-moment-shift` — Positive moments of the tame zeta measure | §2.6 family cases | API under the family hypotheses. |
| `tame-zeta-norm` — Boundedness of the tame zeta measure | §2.6 family cases | Target under the family hypotheses. |
| `tame-zeta-common-special-value` — Shifted algebraic tame special values | §2.6 family cases | API under the family hypotheses. |
| `tame-integral-zeta-measure` — The integral tame zeta measure | §2.6 family cases | Target under the family hypotheses. |
| `tame-integral-zeta-inclusion` — Inclusion of integral tame zeta values | §2.6 family cases | API under the family hypotheses. |
| `tame-integral-zeta-support` — Unit support of integral tame zeta | §2.6 family cases | API under the family hypotheses. |
| `tame-integral-zeta-unique` — Uniqueness of the integral tame zeta realization | §2.6 family cases | Target under the family hypotheses. |
| `tame-zeta-value-integral` — Integrality of positive tame zeta values | §2.6 family cases | Target under the family hypotheses. |
| `tame-integral-zeta-amice` — The Amice comparison for integral tame zeta | §2.6 family cases | API under the family hypotheses. |
| `twisted-tame-measure` — Character twists of the actual tame measure | §2.6 family cases | Target under the family hypotheses. |
| `twisted-tame-psi` — Psi and unit restriction for tame twists | §2.6 family cases | API under the family hypotheses. |
| `twisted-tame-translation` — Finite translation equation for a tame twist | §2.6 family cases | API under the family hypotheses. |
| `twisted-tame-amice` — The product-level Amice series of a tame twist | §2.6 family cases | API under the family hypotheses. |
| `twisted-tame-moments` — Bernoulli moments of the actual tame twist | §2.6 family cases | Target under the family hypotheses. |
| `tame-zeta-character-shift` — Character moments of the tame zeta measure | §2.6 family cases | API under the family hypotheses. |
| `tame-zeta-character-common-value` — Common algebraic character-twisted special values | §2.6 family cases | API under the family hypotheses. |
| `integral-tame-character-measure` — Integral character twists of tame zeta | §2.6 family cases | Target under the family hypotheses. |
| `integral-tame-character-inclusion` — Inclusion of integral character values | §2.4 family cases | API under the family hypotheses. |
| `integral-tame-character-inverse` — Cancellation of an inverse character on tame zeta | §3.3 family cases | Target under the family hypotheses. |
| `tame-character-value-integral` — Integrality of character-twisted tame values | §2.4 family cases | Target under the family hypotheses. |
| `integral-tame-character-amice` — Amice compatibility for integral character twists | §2.4 family cases | API under the family hypotheses. |
| `tame-character-finite-values` — Finite linear combinations of tame character values | §2.4 family cases | API under the family hypotheses. |
| `tame-character-kummer` — Finite character congruences for tame values | §2.4 family cases | Target under the family hypotheses. |
| `tame-atoms-reflection` — Reflection of the finite tame source | §2.4 family cases | API under the family hypotheses. |
| `tame-measure-reflection` — Reflection parity of the tame kernel measure | §2.4 family cases | Target under the family hypotheses. |
| `tame-zeta-reflection` — Reflection parity of the tame zeta measure | §2.6 family cases | Target under the family hypotheses. |
| `tame-character-zeta-reflection` — Reflection of a character-weighted tame zeta measure | §2.6 family cases | API under the family hypotheses. |
| `integral-tame-character-reflection` — Integral reflection of tame character values | §2.4 family cases | API under the family hypotheses. |
| `tame-character-parity-test` — Vanishing of tests with incompatible reflection parity | §2.4 family cases | Target under the family hypotheses. |
| `tame-character-value-parity` — Parity vanishing of the Euler–Bernoulli values | §2.4 family cases | Target under the family hypotheses. |
| `tame-complex-kernel` — The smooth complex tame kernel | §2.5 family cases | Target under the family hypotheses. |
| `tame-complex-regularity` — Regularity across the tame removable point | §2.5 family cases | Target under the family hypotheses. |
| `tame-complex-origin-derivatives` — Tame kernel derivatives and Bernoulli values | §2.5 family cases | Target under the family hypotheses. |
| `tame-complex-positive-series` — The decaying tame exponential expansion | §2.5 family cases | API under the family hypotheses. |
| `tame-complex-positive-derivatives` — Termwise derivatives of the tame exponential series | §2.5 family cases | Target under the family hypotheses. |
| `tame-complex-derivative-decay` — Exponential bounds for every tame kernel derivative | §2.5 family cases | Target under the family hypotheses. |
| `tame-complex-mellin-convergent` — Convergence of the tame Mellin integral | §2.5 family cases | API under the family hypotheses. |
| `tame-complex-mellin-gamma-l` — The tame Mellin integral and the native L-series | §2.5 family cases | API under the family hypotheses. |
| `tame-complex-mellin-entire` — Entire continuation of the tame Mellin transform | §2.5 family cases | Target under the family hypotheses. |
| `tame-complex-mellin-comparison` — Global tame Mellin comparison | §2.5 family cases | API under the family hypotheses. |
| `tame-complex-mellin-values` — Negative integral values of the tame Mellin continuation | §2.5 family cases | Target under the family hypotheses. |
| `complex-gauss-denominator` — Nonvanishing of the real-axis Gauss denominators | §2.2 family cases | API under the family hypotheses. |
| `complex-gauss-regularity` — Regularity of the weighted Gauss expression | §2.2 family cases | Target under the family hypotheses. |
| `complex-gauss-generating` — The finite scalar Gauss equation | §2.2 family cases | API under the family hypotheses. |
| `complex-gauss-kernel-comparison` — The actual complex Gauss kernel comparison | §2.2 family cases | API under the family hypotheses. |
| `complex-tame-formal-derivatives` — The formal and analytic tame derivative comparison | §2.5 family cases | API under the family hypotheses. |
| `prime-power-character-gauss` — Finite Gauss expansion of the prime-power lift | §2.1 family cases | API under the family hypotheses. |
| `smoothed-additive-twist` — Additive-character weights of the smoothing measure | §2.2 family cases | Target under the family hypotheses. |
| `twisted-smoothed-gauss` — Gauss decomposition of the arithmetic twist | §2.1 family cases | API under the family hypotheses. |
| `twisted-smoothed-gauss-amice` — Amice series of the finite Gauss decomposition | §2.1 family cases | API under the family hypotheses. |
| `smoothed-additive-translation` — The additive-weighted finite translation identity | §2.2 family cases | API under the family hypotheses. |
| `smoothed-additive-amice-cancellation` — Polynomial cancellation for the additive Amice series | §2.2 family cases | API under the family hypotheses. |
| `smoothed-additive-denominator` — Nonvanishing of the additive smoothing denominator | §2.2 family cases | API under the family hypotheses. |
| `smoothed-additive-rational` — The rational Amice series of an additive twist | §2.2 family cases | API under the family hypotheses. |
| `twisted-smoothed-gauss-rational` — Rational Gauss expression for the arithmetic twist | §2.1 family cases | API under the family hypotheses. |
| `smoothed-additive-root-power` — Nonidentity after a valid smoothing power | §2.2 family cases | API under the family hypotheses. |
| `smoothed-additive-fractions` — The two-fraction form of an additive twist | §2.2 family cases | API under the family hypotheses. |
| `twisted-smoothed-gauss-fractions` — The source two-fraction Gauss formula | §2.1 family cases | API under the family hypotheses. |
| `prime-power-resolvent-reindex` — Reindexing the smoothing resolvent | §2.4 family cases | API under the family hypotheses. |
| `prime-power-resolvent-substitution` — Substitution in the weighted Gauss resolvent | §2.4 family cases | API under the family hypotheses. |
| `prime-power-amice-formal-kernel` — The prime-power twist and the formal finite kernel | §2.4 family cases | API under the family hypotheses. |
| `prime-power-exponential-coefficients` — Exponential coefficients of the prime-power twist | §2.4 family cases | API under the family hypotheses. |
| `prime-power-ordinary-moments` — Ordinary moments of the prime-power smoothed measure | §2.4 family cases | Target under the family hypotheses. |
| `smoothed-complex-character-kernel` — The smoothed complex character kernel | §2.2 family cases | Target under the family hypotheses. |
| `smoothed-complex-regularity` — Regularity of the smoothed character kernel | §2.2 family cases | Target under the family hypotheses. |
| `smoothed-complex-higher-derivatives` — Higher derivatives of the smoothed kernel | §2.2 family cases | API under the family hypotheses. |
| `smoothed-complex-origin-values` — Smoothed origin derivatives and Dirichlet values | §2.2 family cases | Target under the family hypotheses. |
| `smoothed-complex-derivative-decay` — Decay of all smoothed kernel derivatives | §2.2 family cases | API under the family hypotheses. |
| `smoothed-complex-gauss-comparison` — The source complex smoothed Gauss formula | §2.2 family cases | API under the family hypotheses. |
| `smoothed-mellin-convergence` — Convergence of the smoothed Mellin integral | §2.2 family cases | API under the family hypotheses. |
| `smoothed-mellin-gamma-l` — The smoothed Mellin formula on a half-plane | §2.2 family cases | Target under the family hypotheses. |
| `smoothed-mellin-entire` — Entire continuation of the smoothed Mellin transform | §2.2 family cases | Target under the family hypotheses. |
| `smoothed-mellin-comparison` — The global smoothed Dirichlet comparison | §2.2 family cases | Target under the family hypotheses. |
| `smoothed-mellin-negative-values` — Smoothed Mellin values at nonpositive integers | §3.3 family cases | Target under the family hypotheses. |
| `smoothed-gauss-mellin-comparison` — Mellin continuation of the source Gauss kernel | §2.2 family cases | API under the family hypotheses. |
| `prime-power-common-special-value` — Common algebraic prime-power special values | §2.4 family cases | API under the family hypotheses. |
| `prime-power-common-positive-weight` — Prime-power interpolation in positive weight | §2.4 family cases | API under the family hypotheses. |
| `prime-power-quotient-common-value` — Removing a nonzero smoothing factor | §2.4 family cases | API under the family hypotheses. |
| `prime-power-smoothing-independent-quotient` — Independence of the smoothed moment quotient | §2.4 family cases | Target under the family hypotheses. |
| `prime-power-arithmetic-character` — Arithmetic characters on p-adic units | §2.6 family cases | Target under the family hypotheses. |
| `prime-power-arithmetic-character-nontrivial` — Nontriviality in positive arithmetic weight | §2.6 family cases | Target under the family hypotheses. |
| `intrinsic-numerator-character-shift` — Character values of the inverse-weighted numerator | §2.6 family cases | Target under the family hypotheses. |
| `two-dirac-arithmetic-character` — The arithmetic smoothing denominator value | §2.2 family cases | API under the family hypotheses. |
| `intrinsic-numerator-common-character-value` — Algebraic interpolation of the intrinsic numerator | §2.6 family cases | API under the family hypotheses. |
| `pseudomeasure-natural-numerator` — Natural smoothing numerators of the pseudomeasure | §2.4 family cases | API under the family hypotheses. |
| `pseudomeasure-character-numerator` — Arithmetic character values of the cleared numerator | §2.4 family cases | Target under the family hypotheses. |
| `prime-power-principal-unit-value` — Arithmetic characters at a principal unit | §2.4 family cases | API under the family hypotheses. |
| `prime-power-admissible-principal-unit` — An admissible principal unit in positive weight | §2.4 family cases | Target under the family hypotheses. |
| `pseudomeasure-character-evaluation-ratio` — Conditional character specialization of the pseudomeasure | §2.4 family cases | API under the family hypotheses. |
| `pseudomeasure-common-character-value` — Conditional common-field interpolation of the pseudomeasure | §2.4 family cases | API under the family hypotheses. |
| `arithmetic-character-pointwise-value` — The pointwise arithmetic character formula | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-tame-zeta-measure` — The tame zeta measure on p-adic units | §2.6 family cases | Target under the family hypotheses. |
| `intrinsic-tame-zeta-inclusion` — Inclusion of the intrinsic tame zeta measure | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-tame-character-value` — Tame values on the actual arithmetic character | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-tame-zeta-norm` — Norm bound on the intrinsic tame zeta measure | §2.6 family cases | Target under the family hypotheses. |
| `intrinsic-tame-common-character-value` — Common-field interpolation on the unit group | §2.6 family cases | API under the family hypotheses. |
| `arithmetic-character-norm` — Integral bound for arithmetic unit characters | §2.6 family cases | API under the family hypotheses. |
| `integral-arithmetic-character` — Arithmetic unit characters with integral values | §2.6 family cases | Target under the family hypotheses. |
| `integral-arithmetic-character-coefficient` — Coefficient inclusion of the integral arithmetic character | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-integral-tame-zeta-measure` — The integral tame zeta measure on units | §2.6 family cases | Target under the family hypotheses. |
| `intrinsic-integral-tame-inclusion` — Ambient inclusion of the integral unit measure | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-integral-tame-coefficients` — Coefficient inclusion on all integral unit tests | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-integral-tame-character-value` — Integral evaluation of arithmetic unit characters | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-integral-tame-common-value` — Integral common-field interpolation on units | §2.6 family cases | API under the family hypotheses. |
| `arithmetic-character-zero-level` — The level-zero arithmetic character | §2.6 family cases | API under the family hypotheses. |
| `arithmetic-character-natural-value` — Arithmetic characters on natural-cast units | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-integral-tame-one-level` — The modulus-one integral tame boundary | §2.6 family cases | API under the family hypotheses. |
| `integral-arithmetic-character-weight-congruence` — Integral congruences of arithmetic characters | §2.6 family cases | API under the family hypotheses. |
| `tame-residue-cyclic-shift` — A cyclic shift of the actual tame residue masses | §2.4 family cases | API under the family hypotheses. |
| `tame-character-coefficient-variation` — Variation of the tame formal coefficients | §2.4 family cases | API under the family hypotheses. |
| `tame-character-measure-variation` — Variation of the actual tame measure | §2.6 family cases | API under the family hypotheses. |
| `dyadic-tame-quadratic-reference` — A nearby nonprincipal quadratic tame character | §2.4 family cases | API under the family hypotheses. |
| `integral-arithmetic-character-level` — Changing the level of an integral unit character | §2.6 family cases | API under the family hypotheses. |
| `integral-arithmetic-character-product` — Products of integral arithmetic unit characters | §2.6 family cases | API under the family hypotheses. |
| `integral-tame-twist-unit-restriction` — Restriction of an integral tame character twist | §2.4 family cases | API under the family hypotheses. |
| `integral-tame-twist-arithmetic-moment` — Arithmetic moments of the restricted integral twist | §2.4 family cases | API under the family hypotheses. |
| `integral-tame-twist-unit-inverse` — Inverse finite-character weighting on the unit group | §3.3 family cases | Target under the family hypotheses. |
| `intrinsic-integral-tame-norm` — The all-test bound for the integral unit measure | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-integral-tame-test-congruence` — Integral congruences on every unit test | §2.6 family cases | Target under the family hypotheses. |
| `intrinsic-integral-tame-weight-congruence` — Weight congruences of integral tame character values | §2.6 family cases | Target under the family hypotheses. |
| `intrinsic-integral-tame-finite-congruence` — Finite integral relations among tame character values | §2.6 family cases | Target under the family hypotheses. |
| `integral-tame-twist-test-congruence` — Integral congruences after a finite-character twist | §2.4 family cases | Target under the family hypotheses. |
| `tame-numerator-coefficient-map` — Coefficient maps of the finite tame numerator | §2.3 family cases | API under the family hypotheses. |
| `tame-series-coefficient-map` — Coefficient maps of the tame formal series | §2.3 family cases | API under the family hypotheses. |
| `tame-measure-amice` — The Amice coefficients of the actual tame measure | §2.4 family cases | API under the family hypotheses. |
| `tame-measure-field-comparison` — Tame measure values under continuous field extension | §2.4 family cases | API under the family hypotheses. |
| `tame-zeta-unrestricted-weight` — The tame zeta measure as a single inverse weight | §2.6 family cases | API under the family hypotheses. |
| `tame-zeta-field-comparison` — Tame zeta values under continuous field extension | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-tame-zeta-restriction` — The intrinsic tame zeta restriction formula | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-tame-zeta-field-comparison` — Intrinsic tame zeta values under field extension | §2.6 family cases | API under the family hypotheses. |
| `tame-integral-measure-inclusion` — Inclusion of integral tame measure values | §2.4 family cases | API under the family hypotheses. |
| `integral-arithmetic-character-field-comparison` — Integral arithmetic characters under coefficient extension | §2.7 family cases | API under the family hypotheses. |
| `integral-tame-measure-field-comparison` — Integral tame measure values under field extension | §2.4 family cases | API under the family hypotheses. |
| `integral-tame-zeta-field-comparison` — Integral tame zeta values under field extension | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-integral-tame-field-comparison` — Integral unit-group zeta values under field extension | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-integral-tame-field-congruence` — Integral zeta congruences reflected by coefficient extension | §2.6 family cases | Target under the family hypotheses. |
| `tame-character-field` — The field generated by the tame character values | §2.7 family cases | Target under the family hypotheses. |
| `tame-character-field-minimal` — Minimality of the character coefficient field | §2.7 family cases | API under the family hypotheses. |
| `tame-character-values-algebraic` — Algebraicity of finite character values | §2.4 family cases | API under the family hypotheses. |
| `tame-character-field-finite` — Finite degree of the character coefficient field | §2.7 family cases | Target under the family hypotheses. |
| `tame-character-field-complete` — Completeness of the character coefficient field | §2.7 family cases | Target under the family hypotheses. |
| `tame-character-in-field` — The tame character over its generated field | §2.7 family cases | Target under the family hypotheses. |
| `tame-character-field-recovery` — Recovery after inclusion of the character field | §2.7 family cases | API under the family hypotheses. |
| `tame-character-field-integer-tower` — The compatible integer scalar tower on the character field | §2.7 family cases | API under the family hypotheses. |
| `tame-character-field-bounded-action` — The bounded integer action on the character field | §2.7 family cases | API under the family hypotheses. |
| `tame-character-field-valuation-extension` — The norm valuation on the character field | §2.7 family cases | API under the family hypotheses. |
| `tame-measure-character-field-descent` — Descent of the tame measure to its character field | §2.7 family cases | API under the family hypotheses. |
| `tame-zeta-character-field-descent` — Descent of the tame zeta measure to its character field | §2.7 family cases | API under the family hypotheses. |
| `intrinsic-tame-character-field-descent` — Descent of the intrinsic tame zeta measure | §2.7 family cases | API under the family hypotheses. |
| `integral-tame-character-field-descent` — Integral descent of the tame measure | §2.7 family cases | API under the family hypotheses. |
| `integral-tame-zeta-character-field-descent` — Integral descent of the tame zeta measure | §2.7 family cases | API under the family hypotheses. |
| `intrinsic-integral-character-field-descent` — Integral descent of the intrinsic tame zeta measure | §2.7 family cases | API under the family hypotheses. |
| `tame-character-integer-range` — The integer-ring image of the character field | §2.4 family cases | API under the family hypotheses. |
| `tame-measure-character-field-range` — Character-field values of tame test integrals | §2.7 family cases | Target under the family hypotheses. |
| `tame-zeta-character-field-range` — Character-field values of tame zeta test integrals | §2.7 family cases | Target under the family hypotheses. |
| `intrinsic-tame-character-field-range` — Character-field values of intrinsic tame integrals | §2.7 family cases | Target under the family hypotheses. |
| `integral-tame-character-integer-range` — Character-integer values of tame integrals | §2.4 family cases | Target under the family hypotheses. |
| `integral-tame-zeta-character-integer-range` — Character-integer values of tame zeta integrals | §2.6 family cases | Target under the family hypotheses. |
| `intrinsic-integral-character-integer-range` — Character-integer values of intrinsic tame integrals | §2.6 family cases | Target under the family hypotheses. |
| `prime-power-character-pointwise-value` — Pointwise evaluation of a lifted finite character | §2.1 family cases | API under the family hypotheses. |
| `tame-character-field-quadratic` — The character field of a quadratic character | §2.7 family cases | API under the family hypotheses. |
| `tame-character-field-principal` — The character field of a principal character | §2.7 family cases | API under the family hypotheses. |
| `arithmetic-character-values-in-character-field` — Arithmetic-character values in their character field | §2.7 family cases | API under the family hypotheses. |
| `intrinsic-tame-joint-character-comparison` — Tame arithmetic moments over the joint character field | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-integral-joint-character-comparison` — Integral arithmetic moments over the joint character field | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-tame-joint-character-range` — Joint-field values of tame arithmetic moments | §2.6 family cases | Target under the family hypotheses. |
| `intrinsic-integral-joint-character-range` — Joint-integer values of tame arithmetic moments | §2.6 family cases | Target under the family hypotheses. |
| `tame-prime-level-character-value` — Character values after adding one prime level | §2.8 family cases | API under the family hypotheses. |
| `tame-prime-level-finite-sum` — Finite character polynomial at one prime level | §2.8 family cases | API under the family hypotheses. |
| `tame-series-prime-level-comparison` — Tame series after adding one prime level | §2.8 family cases | API under the family hypotheses. |
| `tame-series-repeated-prime-level` — Tame series at repeated prime levels | §2.8 family cases | Target under the family hypotheses. |
| `tame-measure-prime-level-comparison` — Tame measures after adding one prime level | §2.8 family cases | API under the family hypotheses. |
| `tame-measure-repeated-prime-level` — Tame measures at repeated prime levels | §2.8 family cases | Target under the family hypotheses. |
| `tame-measure-prime-level-moments` — Prime level factors of ordinary tame moments | §2.8 family cases | Target under the family hypotheses. |
| `tame-unit-restriction-prime-level` — Prime level changes of unit-restricted tame measures | §2.8 family cases | API under the family hypotheses. |
| `tame-zeta-prime-level-comparison` — Prime level changes of tame zeta measures | §2.8 family cases | API under the family hypotheses. |
| `tame-zeta-repeated-prime-level` — Tame zeta measures at repeated prime levels | §2.8 family cases | Target under the family hypotheses. |
| `intrinsic-tame-zeta-prime-level` — Prime level changes on the native unit group | §2.8 family cases | API under the family hypotheses. |
| `tame-zeta-prime-level-positive-moments` — Prime level factors of positive tame zeta moments | §2.8 family cases | Target under the family hypotheses. |
| `tame-prime-correction-integrality` — Integral prime-level correction coefficients | §2.4 family cases | API under the family hypotheses. |
| `tame-integral-measure-prime-level` — Prime level changes of integral tame measures | §2.8 family cases | API under the family hypotheses. |
| `tame-integral-zeta-prime-level` — Prime level changes of integral tame zeta measures | §2.8 family cases | API under the family hypotheses. |
| `intrinsic-integral-tame-prime-level` — Prime level changes of integral zeta measures on units | §2.8 family cases | API under the family hypotheses. |
| `tame-measure-arbitrary-level` — Tame measure comparison at arbitrary larger levels | §2.8 family cases | API under the family hypotheses. |
| `tame-zeta-arbitrary-level` — Tame zeta comparison at arbitrary larger levels | §2.8 family cases | API under the family hypotheses. |
| `tame-measure-primitive-conductor` — Tame measure comparison with the primitive conductor | §2.4 family cases | API under the family hypotheses. |
| `tame-zeta-primitive-conductor` — Tame zeta comparison with the primitive conductor | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-tame-zeta-arbitrary-level` — Arbitrary tame level changes on the native unit group | §2.8 family cases | API under the family hypotheses. |
| `integral-tame-measure-arbitrary-level` — Arbitrary level changes of integral tame measures | §2.8 family cases | API under the family hypotheses. |
| `integral-tame-zeta-arbitrary-level` — Arbitrary level changes of integral tame zeta measures | §2.8 family cases | API under the family hypotheses. |
| `intrinsic-integral-tame-arbitrary-level` — Arbitrary level changes of integral zeta measures on units | §2.8 family cases | API under the family hypotheses. |
| `intrinsic-tame-zeta-primitive-conductor` — Primitive conductor comparison on the native unit group | §2.6 family cases | API under the family hypotheses. |
| `integral-tame-measure-primitive-conductor` — Primitive conductor comparison for integral tame measures | §2.4 family cases | API under the family hypotheses. |
| `integral-tame-zeta-primitive-conductor` — Primitive conductor comparison for integral tame zeta measures | §2.6 family cases | API under the family hypotheses. |
| `intrinsic-integral-tame-primitive-conductor` — Primitive conductor comparison for integral zeta measures on units | §2.6 family cases | API under the family hypotheses. |
| `tame-arithmetic-moment-level` — Tame level Euler factors for arithmetic-character moments | §2.8 family cases | API under the family hypotheses. |
| `integral-tame-arithmetic-moment-level` — Integral Euler factors for arithmetic-character moments | §2.8 family cases | API under the family hypotheses. |
| `tame-arithmetic-moment-primitive` — Primitive-conductor Euler factors for arithmetic moments | §2.4 family cases | API under the family hypotheses. |
| `integral-tame-arithmetic-moment-primitive` — Primitive-conductor Euler factors for integral arithmetic moments | §2.4 family cases | API under the family hypotheses. |
| `tame-primitive-gauss-norm` — Norm of the tame primitive Gauss normalization | §2.4 family cases | API under the family hypotheses. |
| `tame-primitive-gauss-unit` — The tame Gauss normalization is an integral unit | §2.4 family cases | API under the family hypotheses. |
| `tame-gauss-series-certified` — The tame Gauss formula with its normalization discharged | §2.4 family cases | API under the family hypotheses. |
| `tame-integral-series-map` — Inclusion of the integral tame series | §2.4 family cases | API under the family hypotheses. |
| `tame-integral-gauss-series-certified` — The integral tame series has the certified Gauss expression | §2.4 family cases | API under the family hypotheses. |
| `tame-wild-product-primitive` — Primitivity of the tame and wild product | §2.4 family cases | API under the family hypotheses. |
| `primitive-tame-wild-euler-value` — The primitive Euler value at p | §2.2 family cases | API under the family hypotheses. |
| `primitive-integral-interpolation` — Primitive character interpolation for the integral tame measure | §2.2 family cases | Target under the family hypotheses. |
| `tame-integral-interpolation-unique` — Uniqueness from positive arithmetic moments | §2.4 family cases | Target under the family hypotheses. |

### Input L3-2: 79 statements

| Statement | Instances / destination | Result / change |
|---|---|---|
| `rjw2-rjw-test` — The RJW integral test character | §3.1 family cases | Target under the family hypotheses. |
| `rjw2-rjw-test-apply` — The RJW integral test character: apply | §3.1 family cases | API under the family hypotheses. |
| `rjw2-rjw-test-one` — The RJW integral test character: one | §3.1 family cases | API under the family hypotheses. |
| `rjw2-rjw-test-mul` — The RJW integral test character: mul | §3.1 family cases | API under the family hypotheses. |
| `rjw2-rjw-numerator` — The actual clearing numerator integral | §3.1 family cases | Target under the family hypotheses. |
| `rjw2-rjw-numerator-apply` — The actual clearing numerator integral: apply | §3.1 family cases | API under the family hypotheses. |
| `rjw2-rjw-numerator-one` — The actual clearing numerator integral: one | §3.1 family cases | API under the family hypotheses. |
| `rjw2-rjw-numerator-add` — The actual clearing numerator integral: add | §3.1 family cases | API under the family hypotheses. |
| `rjw2-rjw-cleared` — The arithmetic clearing quotient | §3.2 family cases | Target under the family hypotheses. |
| `rjw2-rjw-cleared-apply` — The arithmetic clearing quotient: apply | §3.2 family cases | API under the family hypotheses. |
| `rjw2-rjw-cleared-one` — The arithmetic clearing quotient: one | §3.2 family cases | API under the family hypotheses. |
| `rjw2-rjw-cleared-cancel` — The arithmetic clearing quotient: cancel | §3.2 family cases | API under the family hypotheses. |
| `rjw2-rjw-analytic-numerator` — The numerator in the RJW s-coordinate | §3.1 family cases | Target under the family hypotheses. |
| `rjw2-rjw-analytic-numerator-apply` — The numerator in the RJW s-coordinate: apply | §3.1 family cases | API under the family hypotheses. |
| `rjw2-rjw-analytic-numerator-one` — The numerator in the RJW s-coordinate: one | §3.1 family cases | API under the family hypotheses. |
| `rjw2-rjw-analytic-numerator-zero` — The numerator in the RJW s-coordinate: zero | §3.1 family cases | API under the family hypotheses. |
| `rjw2-rjw-analytic-denominator` — The finite-character clearing denominator | §3.2 family cases | Target under the family hypotheses. |
| `rjw2-rjw-analytic-denominator-apply` — The finite-character clearing denominator: apply | §3.2 family cases | API under the family hypotheses. |
| `rjw2-rjw-analytic-denominator-one` — The finite-character clearing denominator: one | §3.2 family cases | API under the family hypotheses. |
| `rjw2-rjw-analytic-denominator-zero-log` — The finite-character clearing denominator: zero log | §3.2 family cases | API under the family hypotheses. |
| `rjw2-rjw-analytic-branch` — The actual branch germ in RJW coordinates | §3.2 family cases | Target under the family hypotheses. |
| `rjw2-rjw-analytic-branch-apply` — The actual branch germ in RJW coordinates: apply | §3.2 family cases | API under the family hypotheses. |
| `rjw2-rjw-analytic-branch-one` — The actual branch germ in RJW coordinates: one | §3.2 family cases | API under the family hypotheses. |
| `rjw2-rjw-analytic-branch-cancel` — The actual branch germ in RJW coordinates: cancel | §3.2 family cases | API under the family hypotheses. |
| `rjw2-inverse-teichmuller` — The corrected inverse Teichmüller twist | §3.2 family cases | API under the family hypotheses. |
| `rjw2-integral-character-integers` — Integer points of the actual family | §3.2 family cases | API under the family hypotheses. |
| `rjw2-arithmetic-evaluation` — Identification with actual admissible evaluation | §3.2 family cases | API under the family hypotheses. |
| `rjw2-clearing-independence` — Independence of the arithmetic smoothing choice | §3.2 family cases | API under the family hypotheses. |
| `rjw2-branch-interpolation` — Interpolation in the RJW convention | §3.2 family cases | Target under the family hypotheses. |
| `rjw2-zeta-congruence` — The odd-prime congruence branch | §3.2 family cases | API under the family hypotheses. |
| `rjw2-dyadic-branches` — The two integral dyadic branches | §3.2 family cases | API under the family hypotheses. |
| `rjw2-analytic-coordinate-agreement` — Agreement of native Mahler and analytic coordinates | §3.2 family cases | API under the family hypotheses. |
| `rjw2-analytic-numerator-convergence` — Convergence and analyticity of the actual numerator | §3.1 family cases | API under the family hypotheses. |
| `rjw2-denominator-derivative` — The analytic denominator and its derivative | §3.2 family cases | API under the family hypotheses. |
| `rjw2-principal-denominator-simple-zero` — The principal clearing denominator has a single zero | §3.7 family cases | Conditional replacement: exact nonzero projection input; unconditional independence gap recorded above. |
| `rjw2-nonprincipal-analytic` — Nontrivial components are analytic at one | §3.7 family cases | API under the family hypotheses. |
| `rjw2-principal-numerator-value` — The actual principal numerator at one | §3.7 family cases | API under the family hypotheses. |
| `rjw2-principal-log-nonzero` — The auxiliary logarithm is nonzero | §3.7 family cases | API under the family hypotheses. |
| `rjw2-principal-pole` — The actual simple pole at one | §3.7 family cases | Target under the family hypotheses. |
| `rjw2-principal-residue` — The residue in the RJW s-coordinate | §3.7 family cases | API under the family hypotheses. |
| `rjw2-residue-coordinate-change` — Residue under a change of parameter | §3.7 family cases | API under the family hypotheses. |
| `rjw2-tame-trace-euler` — The finite trace giving the tame Euler factor | §3.5 family cases | API under the family hypotheses. |
| `rjw2-tame-value-one` — The actual tame value at one | §3.6 family cases | API under the family hypotheses. |
| `rjw2-power-smoothed-log-sum` — The smoothed cyclotomic logarithm sum | §3.6 family cases | API under the family hypotheses. |
| `rjw2-power-trace-zero` — Prime-power character cancellation of the unit trace | §3.6 family cases | API under the family hypotheses. |
| `rjw2-power-value-one` — Leopoldt’s formula for pure p-power conductor | §3.6 family cases | API under the family hypotheses. |
| `rjw2-mixed-value-one` — The ramified comparison with nontrivial tame conductor | §3.6 family cases | API under the family hypotheses. |
| `rjw2-leopoldt` — Leopoldt’s actual value-at-one theorem | §3.6 family cases | Target under the family hypotheses. |
| `rjw2-gk-root-ideals` — The two root parameters generate the same ideal | §4.5 family cases | API under the family hypotheses. |
| `rjw2-gk-root-congruence` — The required additive-root congruence modulo pi squared | §4.5 family cases | API under the family hypotheses. |
| `rjw2-gk-dyadic-root` — The dyadic root convention and excluded endpoint | §4.5 family cases | API under the family hypotheses. |
| `rjw2-fg-gamma-sum` — The Ferrero–Greenberg Gamma sum | §4.14 family cases | Target under the family hypotheses. |
| `rjw2-fg-gamma-sum-apply` — The Ferrero–Greenberg Gamma sum: apply | §4.14 family cases | API under the family hypotheses. |
| `rjw2-fg-gamma-sum-zero-log` — The Ferrero–Greenberg Gamma sum: zero log | §4.14 family cases | API under the family hypotheses. |
| `rjw2-fg-gamma-sum-congr` — The Ferrero–Greenberg Gamma sum: congr | §4.14 family cases | API under the family hypotheses. |
| `rjw2-fg-count` — The prime-to-p counting function | §4.13 family cases | Target under the family hypotheses. |
| `rjw2-fg-count-apply` — The prime-to-p counting function: apply | §4.13 family cases | API under the family hypotheses. |
| `rjw2-fg-count-nat` — The prime-to-p counting function: nat | §4.13 family cases | API under the family hypotheses. |
| `rjw2-fg-count-step` — The prime-to-p counting function: step | §4.13 family cases | API under the family hypotheses. |
| `rjw2-fg-permutation` — The Ferrero–Greenberg permutation | §4.13 family cases | Target under the family hypotheses. |
| `rjw2-fg-permutation-apply` — The Ferrero–Greenberg permutation: apply | §4.13 family cases | API under the family hypotheses. |
| `rjw2-fg-permutation-congruence` — The Ferrero–Greenberg permutation: congruence | §4.13 family cases | API under the family hypotheses. |
| `rjw2-fg-permutation-filtration` — The Ferrero–Greenberg permutation: filtration | §4.13 family cases | API under the family hypotheses. |
| `rjw2-fg-permutation-range` — The finite permutation index has the right range | §4.13 family cases | API under the family hypotheses. |
| `rjw2-fg-permutation-injective` — Injectivity before constructing the finite equivalence | §4.13 family cases | API under the family hypotheses. |
| `rjw2-fg-log-antidifference` — The correctly normalized Gamma antidifference | §4.13 family cases | API under the family hypotheses. |
| `rjw2-fg-tame-period` — The finite periods needed by Ferrero–Greenberg | §4.14 family cases | API under the family hypotheses. |
| `rjw2-fg-sum-expression` — The actual L-function as a finite-sum limit | §4.14 family cases | API under the family hypotheses. |
| `rjw2-fg-log-reindex-limit` — The reindexed first logarithmic coefficient | §4.14 family cases | API under the family hypotheses. |
| `rjw2-fg-differentiation` — Justifying differentiation of the sum limit | §4.14 family cases | API under the family hypotheses. |
| `rjw2-fg-count-character-sum` — The carry calculation behind the correction term | §4.13 family cases | API under the family hypotheses. |
| `rjw2-ferrero-greenberg` — The Ferrero–Greenberg derivative formula | §4.14 family cases | Target under the family hypotheses. |
| `rjw2-fg-exceptional-zero` — The exceptional value vanishes under chi of p equals one | §4.14 family cases | API under the family hypotheses. |
| `rjw2-fg-exceptional-derivative` — The exceptional derivative is the Gamma sum | §4.14 family cases | API under the family hypotheses. |
| `rjw2-fg-gauss-log-projection` — The exceptional Gamma sum as an algebraic Gauss logarithm projection | §4.14 family cases | API under the family hypotheses. |
| `rjw2-fg-nonvanishing` — The separate arithmetic nonvanishing of the exceptional projection | §4.14 family cases | API under the family hypotheses. |
| `rjw2-fg-simple-zero` — The simple exceptional zero of the actual analytic branch | §4.14 family cases | Conditional replacement: exact nonzero projection input; unconditional independence gap recorded above. |
| `rjw2-tame-log-realization` — The full tame primitive realizes the actual logarithmic function | §3.5 family cases | API under the family hypotheses. |
| `rjw2-mixed-log-constant` — The actual mixed twisted constant has the joint Gauss normalization | §3.6 family cases | API under the family hypotheses. |

### Input L3: 1668 statements

| Statement | Instances / destination | Result / change |
|---|---|---|
| `tame-character-value` — Tame values at continuous unit characters | §3.2 family cases | Target under the family hypotheses. |
| `tame-character-ambient` — Comparison with ambient arithmetic tests | §3.2 family cases | API under the family hypotheses. |
| `tame-character-bound` — Integral bounds for tame character values | §3.2 family cases | Target under the family hypotheses. |
| `tame-character-distance` — Uniform stability of tame character values | §3.2 family cases | API under the family hypotheses. |
| `tame-character-parity` — Parity of continuous tame specializations | §3.2 family cases | API under the family hypotheses. |
| `tame-character-arithmetic` — Arithmetic specializations of the tame character integral | §3.2 family cases | API under the family hypotheses. |
| `tame-character-analytic-family` — Analyticity along supplied tame character families | §3.2 family cases | Target under the family hypotheses. |
| `complex-log-right-halfplane` — The cyclotomic logarithm stays in the right half-plane | §3.4 family cases | API under the family hypotheses. |
| `complex-log-kernel-bound` — Exponential bound for the logarithmic kernel | §3.4 family cases | API under the family hypotheses. |
| `complex-log-kernel-integrable` — Absolute integrability of the logarithmic kernel | §3.4 family cases | API under the family hypotheses. |
| `complex-log-kernel-derivative` — Derivative of the principal-logarithm primitive | §3.4 family cases | API under the family hypotheses. |
| `complex-log-kernel-limit` — Vanishing of the logarithmic primitive at infinity | §3.4 family cases | API under the family hypotheses. |
| `complex-log-kernel-integral` — The cyclotomic logarithm integral | §3.4 family cases | Target under the family hypotheses. |
| `complex-gauss-log-integral` — Integration of the actual finite Gauss kernel | §3.4 family cases | API under the family hypotheses. |
| `complex-lvalue-one-log` — The complex logarithmic value at one | §3.4 family cases | Target under the family hypotheses. |
| `complex-log-inverse-conjugate` — Conjugation of the cyclotomic logarithm | §3.4 family cases | API under the family hypotheses. |
| `complex-log-inverse-pair` — Pairing inverse roots in the logarithm | §3.4 family cases | API under the family hypotheses. |
| `complex-log-even-weighted-sum` — The even weighted logarithm sum | §3.4 family cases | API under the family hypotheses. |
| `complex-lvalue-one-even-log` — The even-character logarithmic L-value | §3.4 family cases | Target under the family hypotheses. |
| `complex-log-polar-factor` — Polar factorization of the cyclotomic difference | §3.4 family cases | API under the family hypotheses. |
| `complex-log-canonical-phase` — The principal logarithm phase | §3.4 family cases | API under the family hypotheses. |
| `complex-log-canonical-inverse-difference` — Difference of logarithms at inverse roots | §3.4 family cases | API under the family hypotheses. |
| `complex-log-odd-unit-residue` — The logarithm difference at a unit residue | §3.4 family cases | API under the family hypotheses. |
| `complex-log-odd-weighted-sum` — The odd weighted logarithm sum | §3.4 family cases | API under the family hypotheses. |
| `complex-lvalue-one-odd-bernoulli` — The odd-character value at one | §3.4 family cases | Target under the family hypotheses. |
| `normalized-tame-logarithmic-primitive` — The normalized formal Gauss-log primitive | §3.7 family cases | Target under the family hypotheses. |
| `normalized-tame-logarithmic-coefficients` — The positive logarithmic coefficients | §3.7 family cases | API under the family hypotheses. |
| `normalized-tame-logarithmic-derivative` — The Mahler derivative recovers the tame series | §3.7 family cases | Target under the family hypotheses. |
| `normalized-tame-logarithmic-unique` — The zero constant fixes the formal primitive | §3.7 family cases | API under the family hypotheses. |
| `normalized-tame-logarithmic-root-independent` — Independence of the primitive-root choice | §3.7 family cases | API under the family hypotheses. |
| `tame-logarithmic-all-primitives` — Every formal primitive retains one free constant | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-constant` — The finite cyclotomic logarithm constant | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-branch-difference` — The exact branch-change error | §3.5 family cases | API under the family hypotheses. |
| `cyclotomic-logarithmic-branch-independent` — Nontrivial characters remove the branch choice | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-root-transport` — The root and Gauss normalization move together | §3.5 family cases | API under the family hypotheses. |
| `cyclotomic-logarithmic-odd-zero` — Odd characters have zero logarithmic constant | §3.5 family cases | Target under the family hypotheses. |
| `tame-logarithmic-primitive-with-constant` — The formal primitive with its logarithm constant | §3.5 family cases | Target under the family hypotheses. |
| `tame-logarithmic-primitive-with-constant-derivative` — The logarithm constant preserves the Mahler primitive | §3.5 family cases | API under the family hypotheses. |
| `cyclotomic-powered-logarithmic-constant` — The constant after taking powers of cyclotomic roots | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-powered-logarithmic-eigenvalue` — Coleman character transport on the concrete constant | §3.5 family cases | API under the family hypotheses. |
| `cyclotomic-powered-logarithmic-ramified-zero` — Conductor-dividing primes kill the powered constant | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-euler-logarithmic-value` — The finite logarithm value with the Euler term removed | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-euler-logarithmic-formula` — The exact reciprocal Euler factor | §3.5 family cases | API under the family hypotheses. |
| `reciprocal-euler-factor-nonzero` — The reciprocal Euler factor is nonzero | §3.7 family cases | API under the family hypotheses. |
| `tame-cyclotomic-logarithm-argument-norm` — Tame cyclotomic logarithm arguments have norm one | §3.5 family cases | API under the family hypotheses. |
| `tame-logarithmic-coefficient-norm-bound` — The exact inverse-integer coefficient bound | §3.5 family cases | API under the family hypotheses. |
| `tame-logarithmic-polynomial-growth` — Polynomial growth of the concrete logarithm coefficients | §3.5 family cases | API under the family hypotheses. |
| `normalized-tame-logarithmic-restrictedness` — Restrictedness on every smaller closed disc | §3.7 family cases | Target under the family hypotheses. |
| `tame-logarithmic-constant-restrictedness` — The logarithm constant preserves restrictedness | §3.5 family cases | Target under the family hypotheses. |
| `tame-logarithmic-pointwise-summability` — Summability at every point of the open unit disc | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-point-value` — The finite cyclotomic logarithm value at a point | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-point-as-constant` — Point evaluation as a transported constant | §3.5 family cases | API under the family hypotheses. |
| `tame-shifted-logarithm-argument-norm` — Shifted logarithm arguments stay on the unit sphere | §3.5 family cases | API under the family hypotheses. |
| `tame-logarithmic-series-point-evaluation` — The convergent primitive has the finite logarithm value | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-point-root-transport` — Root transport of every finite logarithm value | §3.5 family cases | API under the family hypotheses. |
| `tame-logarithmic-point-branch-compatibility` — Logarithm branches agree throughout the tame disc | §3.5 family cases | API under the family hypotheses. |
| `logarithmic-average-root-domain` — The averaging points lie in the open unit disc | §3.5 family cases | API under the family hypotheses. |
| `cyclotomic-logarithmic-root-average` — The finite average of the evaluated logarithm | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-average-series` — The coefficient series of the finite root average | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-average-complement` — The value remaining after subtracting the root average | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-average-constant-cancellation` — The complementary value only uses the normalized primitive | §3.5 family cases | API under the family hypotheses. |
| `cyclotomic-logarithmic-average-local-law-independence` — The complementary value is independent of the local logarithm choice | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-root-reciprocity` — Inverting the root point multiplies by character parity | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-odd-average` — Odd-character root averages vanish | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-odd-dyadic-point` — The dyadic fixed point has zero odd-character value | §3.5 family cases | API under the family hypotheses. |
| `cyclotomic-logarithmic-odd-complement` — Odd characters have zero complementary value | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-odd-average-series` — The odd averaged coefficient series sums to zero | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-inversion-defect` — The exact correction under inversion of a general point | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-nonprincipal-inversion` — Nonprincipal logarithmic values satisfy inversion reciprocity | §3.5 family cases | Target under the family hypotheses. |
| `logarithmic-inversion-disc-coordinate` — Inversion preserves the logarithmic evaluation disc | §3.5 family cases | API under the family hypotheses. |
| `tame-logarithmic-evaluation-inversion` — The convergent logarithmic primitive respects point inversion | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-trace-unit-domain` — The unit residues avoid the excluded trace locus | §3.5 family cases | API under the family hypotheses. |
| `cyclotomic-powered-logarithmic-coprime-factor` — Coprime powers give the character factor without a primitive hypothesis | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-trace-powered-constant` — The root average is the powered constant divided by p | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-complement-euler-comparison` — The complementary trace value equals the Euler value | §3.5 family cases | API under the family hypotheses. |
| `cyclotomic-logarithmic-complement-reciprocal-factor` — The complementary value has the reciprocal Euler factor | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-coefficient-trace-eigenvalue` — The averaged coefficient series has the character trace value | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-disc-trace` — The finite logarithmic trace at a general point | §3.5 family cases | Target under the family hypotheses. |
| `logarithmic-disc-trace-shifted-domain` — All shifted trace points remain in the open disc | §3.5 family cases | API under the family hypotheses. |
| `logarithmic-frobenius-disc-bound` — The Frobenius coordinate does not enlarge the radius | §3.5 family cases | API under the family hypotheses. |
| `logarithmic-disc-trace-unit-domain` — The trace has no excluded unit argument throughout the disc | §3.5 family cases | API under the family hypotheses. |
| `cyclotomic-logarithmic-disc-trace-frobenius` — The finite trace evaluates at the Frobenius coordinate | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-disc-trace-series` — The coefficient trace converges to the Frobenius value | §3.5 family cases | Target under the family hypotheses. |
| `cyclotomic-logarithmic-disc-complement` — The finite logarithmic complement at a general point | §3.5 family cases | Target under the family hypotheses. |
| `logarithmic-disc-complement-normalized` — The integration constant cancels across the disc | §3.5 family cases | API under the family hypotheses. |
| `logarithmic-disc-complement-local-law-independent` — Independence from the chosen local logarithm | §3.5 family cases | Target under the family hypotheses. |
| `logarithmic-disc-complement-euler` — The Euler expression at the Frobenius coordinate | §3.5 family cases | API under the family hypotheses. |
| `logarithmic-disc-complement-series` — The convergent series for the disc complement | §3.5 family cases | Target under the family hypotheses. |
| `logarithmic-disc-complement-root-kernel` — The finite root average of the complement is zero | §3.5 family cases | Target under the family hypotheses. |
| `logarithmic-disc-trace-inversion-defect` — The trace retains the exact inversion correction | §3.5 family cases | Target under the family hypotheses. |
| `logarithmic-disc-complement-inversion` — The complement has inversion parity for every character | §3.5 family cases | Target under the family hypotheses. |
| `logarithmic-disc-complement-odd-fixed-points` — Odd complements vanish at both inversion fixed points | §3.5 family cases | Target under the family hypotheses. |
| `logarithmic-disc-complement-inversion-series` — The inverted complement series has the parity value | §3.5 family cases | Target under the family hypotheses. |
| `tame-negative-moment-shift` — The inverse-weight shift for actual tame measures | §3.5 family cases | Target under the family hypotheses. |
| `tame-character-negative-moment` — Negative moments as actual continuous-character values | §3.2 family cases | API under the family hypotheses. |
| `tame-negative-moment-parity` — The parity obstruction for negative tame moments | §3.5 family cases | API under the family hypotheses. |
| `tame-positive-integer-branch-comparison` — The corrected branch factor at a positive integer | §3.5 family cases | API under the family hypotheses. |
| `smoothed-intrinsic-negative-moment` — Negative moments of the actual smoothing numerator | §3.3 family cases | API under the family hypotheses. |
| `smoothed-negative-cross-relation` — Cross-smoothing for negative moments | §3.3 family cases | Target under the family hypotheses. |
| `smoothed-negative-quotient-independent` — Independence of admissible negative-moment quotients | §3.3 family cases | Target under the family hypotheses. |
| `negative-principal-unit-admissible` — An admissible parameter in negative weight | §3.7 family cases | API under the family hypotheses. |
| `pseudomeasure-negative-numerator` — The actual pseudomeasure numerator at negative weight | §3.2 family cases | API under the family hypotheses. |
| `pseudomeasure-negative-evaluation` — Conditional pseudomeasure evaluation by a negative moment | §3.2 family cases | API under the family hypotheses. |
| `smoothed-negative-residue-approximation` — Finite approximation of arithmetic inverse moments | §3.3 family cases | Target under the family hypotheses. |
| `smoothed-negative-quotient-precision` — Precision after division by a smoothing factor | §3.3 family cases | API under the family hypotheses. |
| `inverse-arithmetic-character` — Inverse-power arithmetic characters | §3.3 family cases | Target under the family hypotheses. |
| `inverse-arithmetic-character-value` — The inverse-power character value | §3.3 family cases | API under the family hypotheses. |
| `inverse-arithmetic-character-natural-value` — Inverse arithmetic characters at natural units | §3.3 family cases | API under the family hypotheses. |
| `inverse-arithmetic-character-norm` — Uniform norm of inverse arithmetic characters | §3.3 family cases | API under the family hypotheses. |
| `inverse-arithmetic-character-admissible` — Exactly when an inverse arithmetic character is admissible | §3.3 family cases | Target under the family hypotheses. |
| `smoothed-inverse-arithmetic-value` — Actual smoothing moments of inverse arithmetic characters | §3.5 family cases | API under the family hypotheses. |
| `tame-inverse-arithmetic-value` — Actual tame moments of inverse arithmetic characters | §3.5 family cases | API under the family hypotheses. |
| `principal-first-inverse-moment-norm` — The nonzero first inverse moment of canonical smoothing | §3.7 family cases | Target under the family hypotheses. |
| `principal-intrinsic-numerator-mass` — The exact norm of the principal numerator mass | §3.7 family cases | API under the family hypotheses. |
| `principal-pseudomeasure-subalgebra-obstruction` — No augmentation on a subalgebra containing the arithmetic pseudomeasure | §3.7 family cases | Target under the family hypotheses. |
| `principal-numerator-logarithmic-series` — Logarithm series of the actual principal numerator | §3.7 family cases | API under the family hypotheses. |
| `principal-numerator-logarithmic-truncation` — Certified truncation of the principal numerator mass | §3.7 family cases | Target under the family hypotheses. |
| `principal-logarithmic-series-norm` — Exact norm of the canonical logarithmic mass series | §3.7 family cases | Target under the family hypotheses. |
| `principal-family-numerator-continuity` — Continuity of the supplied-family numerator | §3.7 family cases | API under the family hypotheses. |
| `principal-family-eventual-admissibility` — Admissible clearing factors near the principal character | §3.7 family cases | API under the family hypotheses. |
| `principal-family-residue-limit` — The conditional principal residue limit | §3.7 family cases | API under the family hypotheses. |
| `principal-family-residue-coordinate` — Reciprocal coordinate factor for the principal residue | §3.7 family cases | API under the family hypotheses. |
| `integer-principal-numerator-limit` — Integer-weight moments approaching the principal mass | §3.7 family cases | API under the family hypotheses. |
| `integer-principal-denominator-logarithm` — The logarithm of the powered clearing factor | §3.7 family cases | API under the family hypotheses. |
| `integer-principal-denominator-precision` — Precision of the normalized integer clearing factor | §3.7 family cases | API under the family hypotheses. |
| `integer-principal-rescaled-moment` — Bernoulli values of the rescaled integer moments | §3.7 family cases | API under the family hypotheses. |
| `integer-principal-residue-limit` — The principal residue along integer weights | §3.7 family cases | Target under the family hypotheses. |
| `principal-bernoulli-residue-limit` — The Bernoulli residue sequence | §3.7 family cases | Target under the family hypotheses. |
| `principal-euler-bernoulli-residue-error` — Precision of the Euler–Bernoulli residue sequence | §3.7 family cases | API under the family hypotheses. |
| `principal-bernoulli-euler-removal` — Exact error from removing the Euler factor | §3.7 family cases | API under the family hypotheses. |
| `principal-unmodified-bernoulli-residue` — Precision and limit of the Bernoulli sequence | §3.7 family cases | Target under the family hypotheses. |
| `tame-logarithmic-coefficient-bound-certified` — The tame logarithmic bound with normalization discharged | §3.5 family cases | API under the family hypotheses. |
| `tame-logarithmic-weighted-integrality` — The degree clears the logarithmic denominator | §3.5 family cases | API under the family hypotheses. |
| `tame-logarithmic-prime-unit-integrality` — Logarithmic coefficients at degrees prime to p | §3.5 family cases | API under the family hypotheses. |
| `tame-logarithmic-derivative-integral-series` — The ordinary derivative as an included integral series | §3.5 family cases | API under the family hypotheses. |
| `tame-prime-logarithmic-primitive` — The prime-level Euler pullback of the logarithm | §3.5 family cases | Target under the family hypotheses. |
| `tame-prime-logarithmic-zero-constant` — The prime-level logarithm has zero constant | §3.5 family cases | API under the family hypotheses. |
| `tame-prime-logarithmic-mahler` — The prime-level logarithm differentiates to the tame kernel | §3.5 family cases | API under the family hypotheses. |
| `tame-prime-logarithmic-unique` — The changed-level normalized primitive is unique | §3.5 family cases | Target under the family hypotheses. |
| `tame-prime-logarithmic-repeated` — Repeated prime levels preserve the logarithm | §3.5 family cases | API under the family hypotheses. |
| `tame-prime-logarithmic-weighted-integrality` — Degree-weighted integrality after adding a tame prime | §3.5 family cases | API under the family hypotheses. |
| `morita-natural-values` — Signed natural values of Morita Gamma | §4.1 family cases | Target under the family hypotheses. |
| `morita-natural-recurrence` — The two natural Gamma recurrences | §4.1 family cases | API under the family hypotheses. |
| `morita-natural-unit-norm` — Natural Gamma values are p-adic units | §4.1 family cases | API under the family hypotheses. |
| `morita-prime-power-self-inverse` — Self-inverse residues in the Gamma block | §4.2 family cases | API under the family hypotheses. |
| `morita-natural-prime-power` — Gamma values on a prime-power block | §4.1 family cases | API under the family hypotheses. |
| `morita-natural-block` — Translation by a prime-power Gamma block | §4.1 family cases | API under the family hypotheses. |
| `morita-natural-congruence` — Morita’s natural congruence with the dyadic exception | §4.1 family cases | Admissible Gamma exponent; dyadic modulus-four counterexample retained. |
| `morita-natural-buffered-congruence` — An all-prime modulus for Gamma continuity | §4.1 family cases | Admissible Gamma exponent; dyadic modulus-four counterexample retained. |
| `morita-gamma-approximants` — Canonical approximants for Morita Gamma | §4.1 family cases | Target under the family hypotheses. |
| `morita-gamma-approximants-natural` — Gamma approximants at natural arguments | §4.1 family cases | API under the family hypotheses. |
| `morita-gamma-approximants-compatible` — Compatibility of the Gamma approximants | §4.1 family cases | API under the family hypotheses. |
| `morita-gamma-cauchy-step` — The integer Cauchy step for Gamma | §4.2 family cases | API under the family hypotheses. |
| `morita-gamma-value` — The p-adic value of Morita Gamma | §4.1 family cases | Target under the family hypotheses. |
| `morita-gamma-value-reduction` — Finite reductions of the Gamma value | §4.1 family cases | API under the family hypotheses. |
| `morita-gamma-value-natural` — Gamma extends its signed natural values | §4.1 family cases | API under the family hypotheses. |
| `morita-gamma-value-residue` — A finite modulus for the Gamma value | §4.1 family cases | API under the family hypotheses. |
| `morita-gamma-value-continuous` — Continuity of the Gamma value | §4.1 family cases | API under the family hypotheses. |
| `morita-gamma-value-unit-norm` — The Gamma value has norm one | §4.1 family cases | API under the family hypotheses. |
| `morita-gamma` — Morita’s continuous p-adic Gamma function | §4.1 family cases | Target under the family hypotheses. |
| `morita-gamma-value-projection` — The scalar projection of Morita Gamma | §4.1 family cases | API under the family hypotheses. |
| `morita-gamma-natural-values` — The natural values of continuous Morita Gamma | §4.1 family cases | API under the family hypotheses. |
| `morita-gamma-unique` — Uniqueness of continuous Morita Gamma | §4.1 family cases | Target under the family hypotheses. |
| `morita-gamma-functional-equation` — The two functional equations of Morita Gamma | §4.2 family cases | Target under the family hypotheses. |
| `morita-gamma-sharp-reduction` — Exact residue precision for Morita Gamma | §4.2 family cases | Target under the family hypotheses. |
| `morita-gamma-norm-congruence` — The local Gamma norm estimate | §4.2 family cases | Admissible Gamma exponent; dyadic modulus-four counterexample retained. |
| `morita-gamma-odd-distance` — Morita Gamma does not increase odd-prime distances | §4.2 family cases | Target under the family hypotheses. |
| `morita-gamma-disc` — Gamma on a small residue disc | §4.1 family cases | Target under the family hypotheses. |
| `morita-gamma-disc-projection` — The small-disc Gamma projection | §4.1 family cases | API under the family hypotheses. |
| `morita-gamma-disc-principal-unit` — Small-disc Gamma values are principal units | §4.1 family cases | Target under the family hypotheses. |
| `morita-gamma-disc-shift` — The source’s shifted Gamma on the small disc | §4.1 family cases | API under the family hypotheses. |
| `morita-gamma-finite-shift` — The finite-shift product for Morita Gamma | §4.2 family cases | Target under the family hypotheses. |
| `dyadic-omega` — The conductor-four sign on dyadic units | §4.2 family cases | Target under the family hypotheses. |
| `dyadic-omega-reduction` — The sign has the same residue modulo four | §4.2 family cases | API under the family hypotheses. |
| `dyadic-omega-sign` — The two values of the dyadic character | §4.2 family cases | API under the family hypotheses. |
| `dyadic-omega-continuity` — Continuity of the dyadic sign | §4.2 family cases | API under the family hypotheses. |
| `dyadic-angular` — The dyadic principal-unit coordinate | §4.2 family cases | Target under the family hypotheses. |
| `dyadic-angular-reduction` — The angular coordinate lies in the principal subgroup | §4.2 family cases | API under the family hypotheses. |
| `dyadic-angular-norm` — The principal coordinate lies in the radius-one-quarter disc | §4.2 family cases | API under the family hypotheses. |
| `dyadic-angular-continuity` — Continuity of the dyadic principal coordinate | §4.2 family cases | API under the family hypotheses. |
| `dyadic-angular-unique` — Uniqueness of the sign and principal factors | §4.2 family cases | Target under the family hypotheses. |
| `dyadic-omega-translation` — The sign is constant under shifts by four | §4.2 family cases | API under the family hypotheses. |
| `dyadic-angular-translation` — The dyadic angular translation identity | §4.2 family cases | API under the family hypotheses. |
| `padic-teichmuller` — The native Teichmüller lift in p-adic integer units | §4.2 family cases | Target under the family hypotheses. |
| `padic-teichmuller-reduction` — Reduction of the transported Teichmüller lift | §4.2 family cases | API under the family hypotheses. |
| `padic-teichmuller-torsion` — The transported lift has prime-to-p order | §4.2 family cases | API under the family hypotheses. |
| `padic-teichmuller-unique` — Uniqueness of the transported torsion lift | §4.2 family cases | Target under the family hypotheses. |
| `teichmuller-omega` — The Teichmüller coordinate of a p-adic unit | §4.2 family cases | Target under the family hypotheses. |
| `teichmuller-omega-reduction` — The torsion coordinate preserves the residue | §4.2 family cases | API under the family hypotheses. |
| `teichmuller-omega-torsion` — The finite order of the unit coordinate | §4.2 family cases | API under the family hypotheses. |
| `teichmuller-omega-continuity` — Continuity of the Teichmüller coordinate | §4.2 family cases | API under the family hypotheses. |
| `teichmuller-angular` — The principal-unit quotient of the Teichmüller coordinate | §4.2 family cases | Target under the family hypotheses. |
| `teichmuller-angular-reduction` — The quotient is a principal unit | §4.2 family cases | API under the family hypotheses. |
| `teichmuller-angular-norm` — The principal coordinate lies in the radius-one-over-p disc | §4.2 family cases | API under the family hypotheses. |
| `teichmuller-angular-continuity` — Continuity of the principal quotient | §4.2 family cases | API under the family hypotheses. |
| `teichmuller-angular-unique` — Uniqueness of the torsion and principal factors | §4.2 family cases | Target under the family hypotheses. |
| `teichmuller-omega-translation` — The Teichmüller coordinate is constant on residue classes | §4.2 family cases | API under the family hypotheses. |
| `teichmuller-angular-translation` — The odd-prime angular translation identity | §4.2 family cases | API under the family hypotheses. |
| `teichmuller-frobenius-distance` — Frobenius approximation of the native coordinate | §4.2 family cases | Target under the family hypotheses. |
| `teichmuller-frobenius-limit` — The native coordinate is Morita’s p-power limit | §4.2 family cases | API under the family hypotheses. |
| `morita-modulus` — The modulus of the principal analytic disc | §4.2 family cases | Target under the family hypotheses. |
| `morita-mean-level` — The exact character-mean denominator | §4.2 family cases | Target under the family hypotheses. |
| `morita-finite-mean` — Finite character means on sampled values | §4.2 family cases | Target under the family hypotheses. |
| `morita-mean-normalization` — Clearing the finite-mean denominator | §4.2 family cases | API under the family hypotheses. |
| `morita-mean-source-interval` — The source interval for the finite mean | §4.2 family cases | API under the family hypotheses. |
| `morita-mean-character-period` — The character is unchanged across averaging blocks | §4.2 family cases | API under the family hypotheses. |
| `morita-mean-support-period` — The unit restriction is unchanged across blocks | §4.2 family cases | API under the family hypotheses. |
| `morita-mean-blocks` — Reindexing the next finite mean into q blocks | §4.2 family cases | Target under the family hypotheses. |
| `morita-mean-difference` — The exact successive-mean difference | §4.2 family cases | API under the family hypotheses. |
| `morita-mean-trivial-constant` — The p-depleted mass of the trivial character | §4.2 family cases | API under the family hypotheses. |
| `morita-mean-finite-norm` — The finite norm estimate before analytic cancellation | §4.2 family cases | Target under the family hypotheses. |
| `morita-omega` — The source torsion coordinate at every prime | §4.2 family cases | Target under the family hypotheses. |
| `morita-angular` — The source principal coordinate at every prime | §4.2 family cases | Target under the family hypotheses. |
| `morita-omega-order` — The finite order of the source torsion coordinate | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-norm` — The uniform notation for the principal-disc bound | §4.2 family cases | API under the family hypotheses. |
| `morita-omega-translation` — The source torsion coordinate is fixed by q-translations | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-translation` — The source angular increment for a q-translation | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-samples` — Natural samples of the source angular argument | §4.2 family cases | Target under the family hypotheses. |
| `morita-angular-samples-congr` — Samples depend only on the source disc | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-samples-translation` — The exact angular sample in an averaging block | §4.2 family cases | Target under the family hypotheses. |
| `morita-angular-mean` — Finite character means of the actual angular samples | §4.2 family cases | Target under the family hypotheses. |
| `morita-angular-mean-constant` — The exact constant mass after angular sampling | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-mean-norm` — The finite norm bound from the principal disc | §4.2 family cases | Target under the family hypotheses. |
| `morita-angular-translate-norm` — Angular translation preserves the increment norm | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-samples-shift-norm` — The norm of a shifted angular sample | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-shifted-mean-norm` — A shifted mean cancels its level denominator | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-mean-step-norm` — A uniform bound for consecutive finite means | §4.2 family cases | Target under the family hypotheses. |
| `morita-angular-mean-uniform-norm` — The uniform finite-mean bound from disc estimates | §4.2 family cases | Target under the family hypotheses. |
| `morita-angular-mean-gauss-uniform-norm` — The finite bound with the source Gauss scaling | §4.2 family cases | API under the family hypotheses. |
| `morita-torsion-character` — The finite source torsion character | §4.2 family cases | Target under the family hypotheses. |
| `morita-torsion-character-unit` — The finite character equals the source unit coordinate | §4.2 family cases | API under the family hypotheses. |
| `morita-torsion-character-order` — The finite order of the torsion Dirichlet character | §4.2 family cases | API under the family hypotheses. |
| `morita-torsion-character-map` — The torsion character in the coefficient field | §4.2 family cases | Target under the family hypotheses. |
| `morita-torsion-character-map-order` — Finite order survives coefficient change | §4.2 family cases | API under the family hypotheses. |
| `morita-character-twist` — The common-level inverse torsion twists | §4.2 family cases | Target under the family hypotheses. |
| `morita-character-twist-level` — Twisting keeps the same averaging levels | §4.2 family cases | API under the family hypotheses. |
| `morita-character-twist-period` — Only finitely many inverse torsion twists occur | §4.2 family cases | API under the family hypotheses. |
| `morita-character-twist-weight` — The exact twisted weight on the summation support | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-mean-twist` — Twisted angular means equal the original weighted means | §4.2 family cases | API under the family hypotheses. |
| `morita-character-twist-uniform` — A single bound for every twist and every finite level | §4.2 family cases | Target under the family hypotheses. |
| `morita-angular-increment-norm` — The translated angular increment stays inside the Taylor radius | §4.2 family cases | API under the family hypotheses. |
| `morita-finite-mean-has-sum` — Finite character means commute with pointwise convergent sums | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-sample-taylor` — Taylor expansion at an actual angular sample | §4.2 family cases | Target under the family hypotheses. |
| `morita-translated-mean-taylor` — The Taylor series of a translated finite angular mean | §4.3 family cases | API under the family hypotheses. |
| `morita-block-power-sum` — The power sum of one averaging block | §4.2 family cases | Target under the family hypotheses. |
| `morita-block-power-sum-norm` — Integral norm bound for every block power sum | §4.2 family cases | API under the family hypotheses. |
| `morita-next-mean-taylor` — The complete Taylor expansion of the next finite mean | §4.2 family cases | Target under the family hypotheses. |
| `morita-mean-difference-taylor` — The positive-degree Taylor series for consecutive finite means | §4.2 family cases | Target under the family hypotheses. |
| `morita-mean-bound-constant` — The common bound constant for finite angular means | §4.2 family cases | Target under the family hypotheses. |
| `morita-radius-positive` — The principal angular radius is positive | §4.2 family cases | API under the family hypotheses. |
| `morita-radius-contracting` — The principal angular radius is smaller than one | §4.2 family cases | API under the family hypotheses. |
| `morita-level-norm` — The exact norm of an averaging level | §4.2 family cases | API under the family hypotheses. |
| `morita-level-norm-bound` — Every averaging level carries the source-radius factor | §4.2 family cases | API under the family hypotheses. |
| `morita-level-inside-radius` — Every positive averaging depth permits Taylor expansion | §4.2 family cases | API under the family hypotheses. |
| `morita-level-norm-tends-zero` — The averaging levels tend to zero p-adically | §4.2 family cases | API under the family hypotheses. |
| `morita-divided-derivative-mean-norm` — Uniform bounds for the twisted divided-derivative means | §4.2 family cases | API under the family hypotheses. |
| `morita-taylor-coefficient-norm` — Geometric norm bound for each Taylor coefficient | §4.2 family cases | API under the family hypotheses. |
| `morita-mean-difference-norm` — A decaying bound for one consecutive difference | §4.2 family cases | Target under the family hypotheses. |
| `morita-level-ratio-bound` — A uniform geometric bound for the shifted level ratio | §4.2 family cases | API under the family hypotheses. |
| `morita-mean-difference-geometric` — A geometric majorant for every positive-depth difference | §4.2 family cases | Target under the family hypotheses. |
| `morita-angular-mean-cauchy` — The finite angular character means form a Cauchy sequence | §4.2 family cases | Target under the family hypotheses. |
| `morita-angular-mean-exists-limit` — Existence of the complete-field angular mean | §4.2 family cases | Target under the family hypotheses. |
| `morita-angular-mean-limit-norm` — The angular mean limit retains the uniform norm bound | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-limit-unique` — Uniqueness of a convergent angular mean value | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-limit-zero` — The zero angular mean has zero limit | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-limit-add` — Addition of convergent angular mean values | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-limit-sub` — Subtraction of convergent angular mean values | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-limit-scalar` — Scalar multiplication of a convergent angular mean | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-limit-extension` — Limit values ignore extensions outside the principal disc | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-limit-constant` — The exact limit of a constant angular function | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-limit-twist-period` — The finite torsion period persists for limit values | §4.2 family cases | API under the family hypotheses. |
| `morita-finite-mean-coefficient-map` — Finite character means commute with coefficient maps | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-mean-coefficient-map` — Angular sampling commutes with coefficient maps | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-limit-coefficient-map` — Continuous coefficient maps preserve angular mean limits | §4.2 family cases | API under the family hypotheses. |
| `morita-shifted-increment-norm` — A translated angular increment has the norm of its shift | §4.2 family cases | API under the family hypotheses. |
| `morita-shifted-argument-disc` — Boundary shifts preserve the principal disc | §4.2 family cases | API under the family hypotheses. |
| `morita-shifted-samples` — Actual shifted angular samples as a linear map | §4.2 family cases | Target under the family hypotheses. |
| `morita-shifted-mean` — The finite translated angular mean | §4.2 family cases | Target under the family hypotheses. |
| `morita-shifted-samples-taylor` — Taylor expansion at the actual shifted sample | §4.2 family cases | API under the family hypotheses. |
| `morita-shifted-mean-taylor` — Finite translated means have the twisted Taylor expansion | §4.2 family cases | Target under the family hypotheses. |
| `morita-overconvergent-derivative-mean-norm` — Uniform means of derivatives bounded on a larger disc | §4.2 family cases | API under the family hypotheses. |
| `morita-shifted-taylor-term-norm` — A uniform geometric majorant for translated Taylor terms | §4.2 family cases | API under the family hypotheses. |
| `morita-shifted-limit-term-norm` — The majorant survives the actual coefficient limits | §4.2 family cases | API under the family hypotheses. |
| `morita-shifted-limit-summable` — The limiting translated Taylor series really converges | §4.2 family cases | Target under the family hypotheses. |
| `morita-shifted-mean-limit` — Pass the mean limit through the translated Taylor series | §4.3 family cases | Target under the family hypotheses. |
| `morita-coefficient-embedding-isometry` — The norm-preserving coefficient embedding is an isometry | §4.2 family cases | API under the family hypotheses. |
| `morita-derivative-limit-coefficient-norm` — The actual limiting coefficients retain the radius bound | §4.2 family cases | API under the family hypotheses. |
| `morita-shift-series-uniform` — Uniform convergence of the translated coefficient series | §4.2 family cases | Target under the family hypotheses. |
| `morita-shift-series-continuous` — The translated coefficient series is continuous on the closed shift disc | §4.2 family cases | Target under the family hypotheses. |
| `morita-shift-series-tail-bound` — A quantitative ultrametric tail bound | §4.2 family cases | API under the family hypotheses. |
| `morita-translated-difference-function` — The actual translated mean difference function | §4.3 family cases | Target under the family hypotheses. |
| `morita-translated-difference-positive-series` — Remove the constant term from the convergent series | §4.3 family cases | API under the family hypotheses. |
| `morita-translated-difference-continuity` — Continuity of the actual difference function | §4.3 family cases | API under the family hypotheses. |
| `morita-translated-difference-norm` — The difference vanishes at least linearly in the shift | §4.3 family cases | API under the family hypotheses. |
| `morita-translated-difference-limit` — Identify the function with the limit of actual mean differences | §4.3 family cases | API under the family hypotheses. |
| `morita-shifted-samples-natural` — Natural shifts agree with translated angular samples | §4.2 family cases | API under the family hypotheses. |
| `morita-shifted-mean-natural` — The finite mean of a natural translated sample | §4.2 family cases | API under the family hypotheses. |
| `morita-finite-mean-integer-boundary` — Exact boundary telescoping for finite character means | §4.2 family cases | API under the family hypotheses. |
| `morita-shifted-mean-integer-boundary` — The actual shifted mean difference is a finite quotient sum | §4.2 family cases | Target under the family hypotheses. |
| `morita-shifted-mean-boundary-limit` — Pass the limit through the finite integer boundary sum | §4.3 family cases | Target under the family hypotheses. |
| `morita-shifted-mean-boundary-value` — Identify any actual translated difference limit with the boundary value | §4.3 family cases | API under the family hypotheses. |
| `morita-taylor-quadratic-remainder` — The actual Taylor remainder starts at degree two | §4.2 family cases | API under the family hypotheses. |
| `morita-taylor-quadratic-remainder-norm` — A quadratic ultrametric remainder bound | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-quotient-error` — The normalized quotient error is at most linear in N | §4.2 family cases | API under the family hypotheses. |
| `morita-level-inside-closed-radius` — Every averaging level lies in the closed shift radius | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-point-quotient-limit` — The actual point quotient tends to the first Taylor coefficient | §4.2 family cases | Target under the family hypotheses. |
| `morita-angular-sample-quotient-limit` — The actual angular sample quotient has the inverse-twisted derivative limit | §4.2 family cases | Target under the family hypotheses. |
| `morita-natural-shift-disc` — A natural q-multiple lies in the closed shift disc | §4.1 family cases | API under the family hypotheses. |
| `morita-derivative-boundary-value` — The integer boundary value is the finite inverse-twisted derivative sum | §4.2 family cases | API under the family hypotheses. |
| `morita-translated-difference-integer` — Morita’s nonnegative integer formula for the existing difference function | §4.3 family cases | Target under the family hypotheses. |
| `morita-shifted-samples-translation` — Translation of the actual shifted samples | §4.2 family cases | API under the family hypotheses. |
| `morita-shifted-samples-negative-cancel` — The negative shift cancels the natural reindexing | §4.2 family cases | API under the family hypotheses. |
| `morita-shifted-mean-negative-boundary` — The negative finite boundary identity | §4.2 family cases | API under the family hypotheses. |
| `morita-shifted-sample-quotient-limit` — Taylor quotients at the shifted angular center | §4.2 family cases | Target under the family hypotheses. |
| `morita-negative-shift-disc` — Negative q-multiples lie in the shift disc | §4.2 family cases | API under the family hypotheses. |
| `morita-shifted-mean-negative-boundary-limit` — Limits pass through the oriented finite sum | §4.2 family cases | Target under the family hypotheses. |
| `morita-shifted-mean-negative-derivative-value` — The negative boundary value uses shifted derivatives | §4.2 family cases | API under the family hypotheses. |
| `morita-translated-difference-negative-integer` — Morita’s negative integer formula for the existing difference function | §4.3 family cases | Target under the family hypotheses. |
| `morita-negative-unit-transport` — Actual units and angular factors at negative indices | §4.2 family cases | API under the family hypotheses. |
| `morita-negative-character-period` — The character value survives signed reindexing | §4.2 family cases | API under the family hypotheses. |
| `morita-log-omega-zero` — The supplied logarithm vanishes on Morita’s torsion factor | §4.2 family cases | API under the family hypotheses. |
| `morita-log-angular-comparison` — The angular projection preserves the logarithm | §4.2 family cases | API under the family hypotheses. |
| `morita-log-angular-samples` — Actual logarithmic samples are supported on p-units | §4.2 family cases | API under the family hypotheses. |
| `morita-log-torsion-boundary-cancellation` — The source character cancels the inverse torsion twist | §4.2 family cases | API under the family hypotheses. |
| `morita-gamma-natural-log-sum` — The logarithm of the signed natural Gamma product | §4.1 family cases | API under the family hypotheses. |
| `morita-gamma-shifted-natural-log-sum` — The source’s shifted and signed Gamma argument | §4.3 family cases | API under the family hypotheses. |
| `morita-log-primitive-natural-boundary` — The logarithmic primitive has the source’s integer boundary sum | §4.2 family cases | Target under the family hypotheses. |
| `morita-log-primitive-gamma-natural` — The existing difference function agrees with log Gamma at natural q-multiples | §4.2 family cases | API under the family hypotheses. |
| `morita-log-primitive-derivative` — The first derivative of Morita’s logarithmic primitive | §4.2 family cases | API under the family hypotheses. |
| `morita-shift-disc-divisibility` — The closed shift disc is q times the p-adic integers | §4.2 family cases | API under the family hypotheses. |
| `morita-translated-difference-scaled-continuity` — Continuity after parametrizing the shift disc | §4.3 family cases | API under the family hypotheses. |
| `morita-gamma-shifted-log-continuity` — Continuity of the shifted Gamma logarithm | §4.3 family cases | API under the family hypotheses. |
| `morita-log-primitive-gamma-scaled` — The log-Gamma comparison at every scaled p-adic point | §4.2 family cases | Target under the family hypotheses. |
| `morita-log-primitive-gamma-disc` — The log-Gamma comparison on the entire closed shift disc | §4.2 family cases | API under the family hypotheses. |
| `morita-small-disc-radius` — The exact radius of the Gamma exponential disc | §4.3 family cases | API under the family hypotheses. |
| `morita-small-disc-inclusion` — The exponential disc lies inside the logarithmic shift disc | §4.3 family cases | API under the family hypotheses. |
| `morita-gamma-small-disc-principal` — Gamma takes the small disc into principal units | §4.3 family cases | Target under the family hypotheses. |
| `morita-gamma-shifted-small-disc-principal` — The corrected shifted Gamma lies in the coefficient principal disc | §4.3 family cases | API under the family hypotheses. |
| `morita-gamma-shifted-exp-log` — The exp-log inverse recovers the corrected shifted Gamma | §4.3 family cases | API under the family hypotheses. |
| `morita-log-primitive-exponential` — Exponentiating the actual difference function recovers shifted Gamma | §4.3 family cases | Target under the family hypotheses. |
| `morita-gamma-exponential-difference` — The existing Gamma equals the exponential on its small disc | §4.3 family cases | API under the family hypotheses. |
| `morita-difference-field-extension` — The actual difference function over its coefficient field | §4.3 family cases | Target under the family hypotheses. |
| `morita-difference-field-sum` — The scalar sum formula for the coefficient-field extension | §4.3 family cases | API under the family hypotheses. |
| `morita-difference-field-restriction` — The extension restricts to the existing translated difference | §4.3 family cases | API under the family hypotheses. |
| `morita-difference-coefficient-radius` — The actual mean coefficients give a native analytic radius | §4.3 family cases | API under the family hypotheses. |
| `morita-difference-field-analytic` — The coefficient-field difference is analytic inside its radius | §4.3 family cases | Target under the family hypotheses. |
| `morita-difference-exponential-analytic` — The native exponential of the difference is analytic on its certified domain | §4.3 family cases | Target under the family hypotheses. |
| `morita-gamma-model-analytic` — The actual logarithmic mean supplies an analytic Gamma model | §4.2 family cases | Target under the family hypotheses. |
| `morita-gamma-small-disc-analytic-extension` — The existing Gamma admits an analytic extension on the small disc | §4.3 family cases | Target under the family hypotheses. |
| `morita-small-disc-unit-support` — Unit support is constant on each translated small disc | §4.3 family cases | API under the family hypotheses. |
| `morita-gamma-shift-factor` — The finite arithmetic Gamma shift factor | §4.3 family cases | Target under the family hypotheses. |
| `morita-gamma-shift-factor-analytic` — The finite shift factor is analytic everywhere | §4.3 family cases | Target under the family hypotheses. |
| `morita-gamma-shift-factor-comparison` — The small-disc Gamma shift is the finite factor | §4.3 family cases | API under the family hypotheses. |
| `morita-small-disc-residue-representative` — A canonical residue representative reaches the small disc | §4.3 family cases | API under the family hypotheses. |
| `morita-small-disc-residue-ball` — A whole residue ball uses the same small-disc translation | §4.3 family cases | API under the family hypotheses. |
| `morita-gamma-residue-analytic-transport` — Transport a Gamma analytic extension to any residue disc | §4.2 family cases | Target under the family hypotheses. |
| `morita-gamma-all-residue-analytic-extension` — The actual mean model gives Gamma an analytic extension at every point | §4.2 family cases | Target under the family hypotheses. |
| `morita-angular-factorization` — The torsion and angular factors recover the unit | §4.2 family cases | API under the family hypotheses. |
| `morita-angular-samples-unit` — The angular sample at a unit index | §4.2 family cases | API under the family hypotheses. |
| `morita-torsion-character-map-unit` — The coefficient character evaluates to the torsion unit | §4.2 family cases | API under the family hypotheses. |
| `morita-character-twist-omega-weight` — The derivative twist uses the inverse torsion power | §4.2 family cases | API under the family hypotheses. |
| `morita-log-divided-derivatives` — The explicit divided derivatives of the logarithmic primitive | §4.3 family cases | Target under the family hypotheses. |
| `morita-log-divided-higher-formula` — The higher divided coefficients are explicit inverse powers | §4.3 family cases | API under the family hypotheses. |
| `morita-log-divided-derivative-recurrence` — The explicit family satisfies the divided-derivative recurrence | §4.3 family cases | Target under the family hypotheses. |
| `morita-log-divided-factorial` — The divided and ordinary coefficient normalizations agree | §4.3 family cases | API under the family hypotheses. |
| `morita-log-divided-angular-mean` — The higher coefficient scalar factors out of the actual angular mean | §4.3 family cases | API under the family hypotheses. |
| `morita-log-inverse-power-finite-mean` — The derivative twist cancels the angular denominator | §4.2 family cases | API under the family hypotheses. |
| `morita-log-divided-limit-identification` — The actual higher coefficient is the scaled inverse-power limit | §4.3 family cases | API under the family hypotheses. |
| `morita-log-inverse-power-limit` — Actual coefficient convergence supplies the inverse-power limit | §4.2 family cases | Target under the family hypotheses. |
| `morita-difference-first-derivative` — The coefficient-field difference has first derivative v₁ | §4.3 family cases | Target under the family hypotheses. |
| `morita-difference-iterated-derivatives` — Positive-order derivatives recover factorial times the coefficients | §4.3 family cases | Target under the family hypotheses. |
| `morita-difference-higher-series` — Removing the constant and linear terms leaves the higher HasSum | §4.3 family cases | API under the family hypotheses. |
| `morita-log-first-coefficient-mean` — The linear coefficient is the normalized unit logarithm mean | §4.2 family cases | API under the family hypotheses. |
| `morita-gamma-explicit-log-model` — The explicit divided coefficients give the actual logarithmic Gamma model | §4.2 family cases | API under the family hypotheses. |
| `morita-gamma-log-model-first-derivative` — The actual logarithmic Gamma model has derivative v₁ at zero | §4.2 family cases | Target under the family hypotheses. |
| `morita-gamma-log-model-higher-derivatives` — The actual logarithmic model has the source’s factorial coefficients | §4.2 family cases | Target under the family hypotheses. |
| `morita-gamma-log-higher-inverse-series` — The logarithmic Gamma tail is the inverse-power moment series | §4.2 family cases | Target under the family hypotheses. |
| `morita-gamma-log-moment-series-existence` — The actual coefficient limits supply the moments and Gamma series | §4.2 family cases | Target under the family hypotheses. |
| `morita-principal-norm-one` — Every point of the principal disc has norm one | §4.2 family cases | API under the family hypotheses. |
| `morita-inverse-kernel-norm` — Every inverse-power kernel has norm one on the principal disc | §4.2 family cases | API under the family hypotheses. |
| `morita-inverse-kernel-lipschitz` — Inverse-power kernels have a uniform Lipschitz bound | §4.2 family cases | API under the family hypotheses. |
| `morita-inverse-power-mean-bound` — One constant bounds all inverse-power means | §4.2 family cases | Target under the family hypotheses. |
| `morita-natural-inverse-norm-bound` — A natural denominator costs at most its real size | §4.1 family cases | API under the family hypotheses. |
| `morita-log-scalar-norm-bound` — The scalar logarithmic coefficients have quadratic norm growth | §4.2 family cases | API under the family hypotheses. |
| `morita-logarithmic-coefficient-bound` — The actual logarithmic coefficients have quadratic growth | §4.2 family cases | API under the family hypotheses. |
| `morita-quadratic-coefficient-radius` — Quadratic coefficient growth gives radius at least one | §4.2 family cases | Target under the family hypotheses. |
| `morita-logarithmic-unit-radius` — Morita’s logarithmic series has radius at least one | §4.2 family cases | Target under the family hypotheses. |
| `morita-log-model-analytic-unit-disc` — The logarithmic model is analytic throughout the open unit disc | §4.2 family cases | Target under the family hypotheses. |
| `morita-log-higher-series-unit-disc` — The higher logarithmic series sums on the whole open unit disc | §4.2 family cases | Target under the family hypotheses. |
| `morita-scalar-series-derivative` — Differentiate a scalar power series on its actual ball | §4.2 family cases | API under the family hypotheses. |
| `morita-difference-second-series` — The second derivative is the twice-differentiated convergent series | §4.3 family cases | Target under the family hypotheses. |
| `morita-reciprocal-geometric-series` — Expand a reciprocal around a norm-one point | §4.3 family cases | API under the family hypotheses. |
| `morita-finite-reciprocal-series` — A finite reciprocal mean has the inverse-moment expansion | §4.3 family cases | API under the family hypotheses. |
| `morita-second-coefficient-limit` — The differentiated finite coefficients have the required limits | §4.3 family cases | API under the family hypotheses. |
| `morita-second-coefficient-finite-bound` — One bound controls all differentiated finite coefficients | §4.3 family cases | API under the family hypotheses. |
| `morita-reciprocal-second-derivative-limit` — Reciprocal means converge to the second derivative | §4.3 family cases | Target under the family hypotheses. |
| `morita-shifted-reciprocal-finite-comparison` — The source’s shifted inverse kernel is the reciprocal finite sum | §4.3 family cases | API under the family hypotheses. |
| `morita-shifted-mean-second-derivative` — Morita’s second derivative is the translated inverse-power mean | §4.3 family cases | Target under the family hypotheses. |
| `gross-koblitz-positive-residue` — The positive residue in the Gamma reflection formula | §4.4 family cases | Target under the family hypotheses. |
| `gross-koblitz-positive-residue-natural` — Positive residues of natural integers | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-positive-residue-zero` — The residue-zero reflection sign | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-positive-residue-local-constant` — Positive residue is constant on open unit balls | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-positive-residue-continuous` — Continuity of the reflection exponent | §4.4 family cases | API under the family hypotheses. |
| `morita-gamma-reflection-step` — The one-step Gamma reflection recurrence | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-positive-residue-sign-step` — The one-step positive-residue sign | §4.4 family cases | API under the family hypotheses. |
| `morita-gamma-reflection-natural` — Gamma reflection at natural arguments | §4.4 family cases | API under the family hypotheses. |
| `morita-gamma-reflection` — The odd-prime Gamma reflection formula | §4.4 family cases | Target under the family hypotheses. |
| `gross-koblitz-orbit-numerator` — Cyclic numerators for the Frobenius orbit | §4.4 family cases | Target under the family hypotheses. |
| `gross-koblitz-orbit-initial` — The initial cyclic numerator | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-orbit-upper-bound` — The upper bound for cyclic numerators | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-orbit-positive` — Nonzero rational classes stay nonzero | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-orbit-step` — One Frobenius step on the numerator | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-orbit-period` — A full Frobenius cycle returns to the numerator | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-carry` — The actual base-p carry | §4.4 family cases | Target under the family hypotheses. |
| `gross-koblitz-carry-bound` — Carries lie in the base-p digit range | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-carry-step` — The quotient-remainder equation for a Frobenius step | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-fractional-orbit` — The positive fractional part of a Frobenius translate | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-orbit-sum-shift` — Cyclic invariance of the numerator sum | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-carry-sum` — Summing the Frobenius carry equation | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-fractional-sum` — The fractional-part exponent is the digit sum | §4.4 family cases | Target under the family hypotheses. |
| `gross-koblitz-digit-expansion` — Reconstructing the numerator from the carries | §4.4 family cases | Target under the family hypotheses. |
| `gross-koblitz-positive-residue-unique` — Uniqueness of the positive reflection residue | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-denominator-unit` — The rational orbit denominator is a p-adic unit | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-rational-point` — The native p-adic integer representing n divided by p^f−1 | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-fractional-positive-residue` — The positive residue of a rational orbit argument | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-carry-residue` — A carry is the next cyclic numerator’s units digit | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-next-positive-residue` — The positive residue in terms of the preceding carry | §4.4 family cases | API under the family hypotheses. |
| `morita-gamma-to-zmod-congruence` — Gamma congruence for the native residue map | §4.2 family cases | Admissible Gamma exponent; dyadic modulus-four counterexample retained. |
| `morita-gamma-negative-factorial` — Gamma at negative integers below the first nonunit | §4.2 family cases | API under the family hypotheses. |
| `morita-gamma-factorial-residue` — Gamma modulo p is an inverse factorial | §4.2 family cases | API under the family hypotheses. |
| `gross-koblitz-gamma-rational-residue` — The factorial residue at n divided by p^f−1 | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-gamma-next-residue` — The next rational Gamma value and its carry factorial | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-rational-period` — Periodicity of the native rational orbit | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-gamma-product-shift` — Cyclic invariance of the Gamma product | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-gamma-factorial-product` — The Gamma product times the digit factorial product | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-gamma-product-inverse` — The Gamma product is the inverse digit factorial product | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-carry-parity` — Parity of the Gross–Koblitz digit sum | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-carry-sign` — The sign of the Gross–Koblitz digit sum | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-gamma-next-pair` — Reflection at the next rational orbit point | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-gamma-pair-product` — The reflection product over a Frobenius orbit | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-gamma-jacobi-pair` — The Gamma expression for the elementary Jacobi pair | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-gauss-pair-comparison` — The native Gauss product and the elementary Gamma pair | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-inverse-teich-character` — The inverse Teichmuller character | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-inverse-teich-unit-value` — The inverse character on residue units | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-inverse-teich-zero-exponent` — The zero exponent gives the trivial character | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-inverse-teich-period` — The exponent period of the inverse character | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-inverse-teich-card-exponent` — The residue-cardinality exponent is trivial | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-inverse-teich-exponent-addition` — Addition of inverse-character exponents | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-inverse-teich-complement` — The complementary source exponent gives the inverse | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-inverse-teich-nontrivial` — Nontriviality in the source exponent range | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-inverse-teich-negative-one` — The source character at negative one | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-trace-character` — The additive character from a chosen root and trace | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-trace-character-one` — The trace character at one | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-trace-character-primitive` — Primitivity of the chosen-root trace character | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-actual-elementary-gauss-pair` — The elementary Gauss pair with the actual source characters | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-cyclotomic-unit` — The cyclotomic unit product | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-cyclotomic-unit-map-one` — The cyclotomic product at the trivial image | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-cyclotomic-unit-congruence` — The cyclotomic unit modulo the root difference | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-cyclotomic-unit-power` — The cyclotomic product and negative p | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-cyclotomic-unit-invertible` — Invertibility of the cyclotomic unit | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-cyclotomic-unit-normalized-root` — The normalized simple root of the cyclotomic unit | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-pi-existence` — Existence of the integral normalized pi | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-normalized-integral-pi` — The chosen integral Gross–Koblitz pi | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-integral-pi-power` — The defining power of integral pi | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-pi-congruence` — The defining congruence of integral pi | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-pi-uniqueness` — Uniqueness of a normalized integral candidate | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-pi-nonzero` — Nonvanishing of integral pi | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-pi-map` — Compatibility of integral pi with ring maps | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-ternary-pi` — The exact ternary pi | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-field-pi-existence` — Existence of the source pi in the local field | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-normalized-field-pi` — The chosen source pi in the local field | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-field-pi-power` — The defining field power | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-field-pi-congruence` — The integral witness for the field congruence | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-field-pi-uniqueness` — Uniqueness of a field candidate | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-field-integral-pi-comparison` — Agreement of integral and field pi | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-negative-gauss-zero` — The source Gauss sum at exponent zero | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-negative-gauss-card-endpoint` — The excluded residue-cardinality endpoint | §4.5 family cases | API under the family hypotheses. |
| `robert-cubic-binomial-extension-norm` — The cubic binomial at a quadratic unit | §4.5 family cases | API under the family hypotheses. |
| `robert-mahler-domain-counterexample` — The Mahler norm domain boundary | §4.5 family cases | API under the family hypotheses. |
| `morita-gamma-negative-factorial-all` — Gamma at every negative integer | §4.2 family cases | API under the family hypotheses. |
| `morita-gamma-factorial-telescope` — The finite Gamma factorial product | §4.2 family cases | API under the family hypotheses. |
| `robert-factorial-valuation-tail` — The factorial valuation with a finite tail | §4.5 family cases | API under the family hypotheses. |
| `robert-factorial-exponent` — The source factorial exponent | §4.5 family cases | API under the family hypotheses. |
| `robert-affine-path` — Robert’s affine factorial arguments | §4.5 family cases | Target under the family hypotheses. |
| `robert-factorial-quotient` — Robert’s continuous factorial quotient | §4.5 family cases | Target under the family hypotheses. |
| `robert-factorial-quotient-pi-scale` — The digit-sum normalization of the factorial quotient | §4.5 family cases | Target under the family hypotheses. |
| `robert-affine-fixed-relation` — The affine arguments at the source fixed point | §4.5 family cases | API under the family hypotheses. |
| `robert-factorial-fixed-product` — The Gamma product at the fixed point | §4.5 family cases | Target under the family hypotheses. |
| `robert-exponential-coefficient` — The finite exponential coefficient formula | §4.5 family cases | API under the family hypotheses. |
| `robert-exponential-low-coefficient` — The coefficients below the first expanded term | §4.5 family cases | API under the family hypotheses. |
| `robert-factorial-coefficient-cross` — The coefficient and finite-difference identity | §4.5 family cases | API under the family hypotheses. |
| `robert-factorial-mahler-coefficient` — Robert’s actual Mahler coefficients | §4.5 family cases | API under the family hypotheses. |
| `robert-factorial-mahler-has-sum` — Mahler convergence for the factorial quotient | §4.5 family cases | API under the family hypotheses. |
| `robert-factorial-mahler-decay` — Decay of the actual Mahler coefficients | §4.5 family cases | API under the family hypotheses. |
| `robert-factorial-mahler-expansion` — Robert’s convergent Mahler expansion | §4.5 family cases | Target under the family hypotheses. |
| `robert-mahler-root-independence` — Independence of the normalized coefficients from pi | §4.5 family cases | API under the family hypotheses. |
| `robert-exponential-derivative` — The differential equation of the exponential product | §4.5 family cases | API under the family hypotheses. |
| `robert-exponential-recurrence` — The coefficient recurrence | §4.5 family cases | API under the family hypotheses. |
| `robert-finite-coefficient-difference` — The finite falling-factorial difference | §4.5 family cases | API under the family hypotheses. |
| `robert-finite-fixed-difference` — The finite fixed-point cancellation | §4.5 family cases | API under the family hypotheses. |
| `robert-coefficient-series` — Robert’s extended coefficient family | §4.5 family cases | Target under the family hypotheses. |
| `robert-coefficient-series-has-sum` — The summable coefficient family | §4.5 family cases | API under the family hypotheses. |
| `robert-coefficient-series-step` — The convergent fixed-point step | §4.5 family cases | API under the family hypotheses. |
| `robert-coefficient-series-telescope` — Robert’s finite telescope for the extended family | §4.5 family cases | Target under the family hypotheses. |
| `robert-small-index-series-sum` — The small-index coefficient series has the Gamma sum | §4.5 family cases | API under the family hypotheses. |
| `robert-coefficient-gamma-comparison` — The coefficient and Gamma families agree in their common range | §4.5 family cases | API under the family hypotheses. |
| `robert-small-index-series-continuous` — Continuity from the small-index Gamma comparison | §4.5 family cases | API under the family hypotheses. |
| `robert-factorial-ratio-norm` — The normalized factorial norm is controlled by digits | §4.5 family cases | API under the family hypotheses. |
| `robert-coefficient-series-term-bound` — A geometric bound for every falling-factorial term | §4.5 family cases | API under the family hypotheses. |
| `robert-coefficient-series-summable` — Summability of the extended coefficient family | §4.5 family cases | API under the family hypotheses. |
| `robert-coefficient-series-continuous` — Continuity of the extended coefficient family | §4.5 family cases | API under the family hypotheses. |
| `robert-coefficient-series-uniform-bound` — A uniform norm bound at every prime | §4.5 family cases | API under the family hypotheses. |
| `robert-coefficient-series-odd-bound` — The sharper odd-prime norm bound | §4.5 family cases | API under the family hypotheses. |
| `robert-coefficient-series-tail` — The moving-input terminal value vanishes | §4.5 family cases | Target under the family hypotheses. |
| `robert-coefficient-telescope-limit` — The limiting coefficient telescope | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-inverse-teich-order` — The inverse Teichmuller character has exact order | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-inverse-teich-equality` — Equality of inverse Teichmuller exponents | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-inverse-teich-orthogonality` — The Teichmuller coefficient selector | §4.5 family cases | API under the family hypotheses. |
| `robert-weighted-character-sum` — Summing the splitting values with character weights | §4.5 family cases | API under the family hypotheses. |
| `robert-negative-gauss-coefficient-sum` — The residue-class coefficient formula for the negative Gauss sum | §4.5 family cases | API under the family hypotheses. |
| `robert-exponential-unit-disc-summable` — Convergence of the actual splitting series on the unit disc | §4.5 family cases | API under the family hypotheses. |
| `robert-series-gauss-comparison` — The actual coefficient family equals the negative Gauss sum | §4.5 family cases | API under the family hypotheses. |
| `robert-gross-koblitz-comparison` — Robert’s Gross–Koblitz comparison | §4.5 family cases | Target under the family hypotheses. |
| `robert-gauss-endpoint-coefficient-correction` — The omitted constant at the Gauss endpoint | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-pi-power-norm` — The normalized norm of a Gross–Koblitz root | §4.5 family cases | API under the family hypotheses. |
| `morita-gamma-right-rotation-residue` — The Gamma residue for right-cyclic digits | §4.2 family cases | API under the family hypotheses. |
| `robert-gauss-digit-norm` — The Gauss norm from the digit sum | §4.5 family cases | Target under the family hypotheses. |
| `robert-gauss-normalized-norm` — The normalized p-adic Gauss norm | §4.5 family cases | Target under the family hypotheses. |
| `robert-gauss-normalized-unit` — The unique normalized Gauss unit | §4.5 family cases | Target under the family hypotheses. |
| `robert-gauss-power-descent` — The Gauss power descends to Q_p | §4.5 family cases | API under the family hypotheses. |
| `robert-gauss-leading-unit-residue` — The leading residue of the normalized Gauss unit | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-gauss-modular-norm` — The Gauss norm for every character exponent | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-denominator-character-power` — The character power for a rational denominator | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-gauss-cyclotomic-membership` — The Gauss sum belongs to the cyclotomic field | §4.5 family cases | API under the family hypotheses. |
| `robert-rational-gamma-gauss` — The prime-field Gauss formula at a proper rational argument | §4.5 family cases | API under the family hypotheses. |
| `robert-proper-rational-gamma-field` — The exact field for a proper rational Gamma value | §4.5 family cases | Target under the family hypotheses. |
| `morita-gamma-integer-shift-field` — Integer shifts preserve the Gamma value field | §4.2 family cases | API under the family hypotheses. |
| `robert-rational-gamma-field` — The exact field for every rational Gamma value | §4.5 family cases | Target under the family hypotheses. |
| `robert-rational-gamma-algebraicity` — Rational Gamma values are algebraic | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-radical-field-independence` — Independence of the chosen radical field | §4.5 family cases | API under the family hypotheses. |
| `morita-gamma-dyadic-sign-continuity` — Continuity of the dyadic reflection sign | §4.4 family cases | API under the family hypotheses. |
| `morita-gamma-dyadic-reflection-natural` — Dyadic Gamma reflection at natural arguments | §4.4 family cases | Target under the family hypotheses. |
| `morita-gamma-dyadic-reflection` — Dyadic Gamma reflection on Z2 | §4.4 family cases | Target under the family hypotheses. |
| `morita-gamma-dyadic-negative-reflection` — Dyadic reflection at opposite and shifted arguments | §4.4 family cases | Target under the family hypotheses. |
| `morita-gamma-low-digit-reduction` — Compatibility of the two-digit residue with its low digit | §4.2 family cases | API under the family hypotheses. |
| `morita-gamma-all-prime-negative-reflection` — Gamma reflection for every prime | §4.4 family cases | Target under the family hypotheses. |
| `morita-gamma-multiplication-product` — Finite Morita Gamma multiplication product | §4.6 family cases | Target under the family hypotheses. |
| `morita-gamma-multiplication-product-unit` — Unit values of the finite multiplication product | §4.6 family cases | API under the family hypotheses. |
| `morita-gamma-multiplication-product-zero` — The multiplication normalizer | §4.6 family cases | API under the family hypotheses. |
| `morita-gamma-multiplication-product-step` — Shift recurrence for the multiplication product | §4.6 family cases | API under the family hypotheses. |
| `morita-gamma-multiplication-product-negative` — Exact multiplication product at small negative integers | §4.6 family cases | Target under the family hypotheses. |
| `morita-gamma-multiplication-product-congruence` — Reduction compatibility of the multiplication product | §4.6 family cases | Admissible Gamma exponent; dyadic modulus-four counterexample retained. |
| `morita-gamma-multiplication-product-residue` — The elementary multiplication congruence | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-multiplication-single-congruence` — The source units digit in the multiplication congruence | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-carry-power-reduction` — Powers of the cyclic digit sum modulo p | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-multiplication-orbit-congruence` — The cleared cyclic multiplication congruence | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-fractional-preimage` — Positive fractional representatives of affine preimages | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-fractional-preimage-product` — Permutation of the rational preimage product | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-fractional-normalizer-product` — Permutation of the nonzero rational normalizer | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-cyclic-preimage-product` — Cyclic reindexing of rational preimages | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-preimage-sum` — Sum of the rational preimages | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-fractional-weight-zero` — Zero formal weight of the multiplication divisor | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-preimage-existence` — Unique integral lifts of positive rational preimages | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-gamma-preimage-product` — The actual Gamma product over the source preimages | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-gamma-normalizer-product` — The actual Gamma normalizer along the orbit | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-gamma-source-product` — Identification of the literal Gross–Koblitz Gamma source product | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-natural-unit-count-balance` — Balance of unit factors and positive residue | §4.5 family cases | API under the family hypotheses. |
| `morita-gamma-multiplication-natural` — The cleared natural Gamma multiplication product | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-orbit-step` — The integral carry equation on the Gamma orbit | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-orbit-sum` — The integral orbit and carry sums | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-orbit-residue-balance` — Balance of positive residues around the orbit | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-positive-residue-precision-lift` — Positive residue of the natural precision representative | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-orbit-count-divisibility` — Prime-power divisibility of the orbit unit count | §4.5 family cases | API under the family hypotheses. |
| `morita-gamma-multiplication-precision-lift` — The Gamma multiplication product at finite precision | §4.6 family cases | API under the family hypotheses. |
| `morita-gamma-multiplication-orbit-lift` — The finite-precision Gamma orbit product | §4.6 family cases | API under the family hypotheses. |
| `morita-gamma-multiplication-orbit-power` — The exact power identity for the Gamma orbit | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-multiplication-root-unity` — The Gamma multiplication quotient is a root of unity | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-multiplication-teichmuller` — The Teichmuller value of the Gamma multiplication quotient | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-source-multiplication-theorem` — Gross–Koblitz Gamma multiplication formula | §4.6 family cases | Target under the family hypotheses. |
| `morita-gamma-reflection-pair-square` — The square of the Gamma reflection pair | §4.4 family cases | API under the family hypotheses. |
| `morita-gamma-normalizer-reflection` — Reflection of the finite Gamma normalizer | §4.6 family cases | API under the family hypotheses. |
| `morita-gamma-normalizer-fourth-power` — The fourth power of the Gamma normalizer | §4.6 family cases | API under the family hypotheses. |
| `morita-gamma-normalizer-log-sum` — Vanishing of the normalizer logarithm sum | §4.6 family cases | API under the family hypotheses. |
| `morita-gamma-multiplication-log-sum` — The affine Gamma logarithm distribution | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-source-log-sum` — The literal common-length logarithmic distribution | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-period-sum` — Repetition of a finite period sum | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-period-average` — Invariance of a period average | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-minimal-period-existence` — Existence and divisibility of the minimal positive period | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-common-period-existence` — Existence of a common positive orbit period | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-fractional-period-existence` — Existence of positive rational fractional-orbit periods | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-period-existence` — Minimal periods of the actual integral fractional orbit | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-weighted-log-distribution` — The corrected period-weighted logarithmic distribution | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-averaged-log-distribution` — The logarithmic distribution for period averages | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-integral-orbit` — The actual integral rational orbit | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-integral-orbit-coe` — The rational image of the integral orbit | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-orbit-translation` — Integer translation of the integral orbit | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-orbit-frobenius` — Frobenius shift of the integral orbit | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-orbit-periodic` — Transport of rational orbit periods | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-orbit-integer` — The integer-class integral orbit | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-orbit-negation` — Negation of the integral rational orbit | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-log-orbit-sum` — The finite Gamma logarithm orbit sum | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-log-reflection` — The Gamma logarithm reflection law | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-log-orbit-integer` — Vanishing of integer-class logarithm sums | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-log-orbit-negation` — Oddness of finite logarithm orbit sums | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-log-orbit-frobenius` — Frobenius invariance of complete orbit sums | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-log-orbit-repetition` — Repetition of actual Gamma logarithm orbit sums | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-log-orbit-translation` — Integer translation of finite logarithm orbit sums | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-log-orbit-average` — The Gamma logarithm orbit average | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-log-orbit-average-period` — Invariance of an orbit average under period repetition | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-log-orbit-average-independence` — Independence from the chosen positive orbit period | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-orbit-minimal-period` — A minimal positive period of the constructed integral orbit | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-rational-denominator-coprime` — Prime-to-p denominators of integral rationals | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-all-rational-orbit-period` — Positive periods for every integral rational orbit | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-rational-affine-integrality` — Integrality of all rational division preimages | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-rational-preimage-common-period` — A common period for an input and all rational preimages | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-orbit-numerator-equation` — The numerator equation for the constructed orbit | §4.4 family cases | API under the family hypotheses. |
| `gross-koblitz-positive-period-numerator` — A proper numerator from a positive rational orbit period | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-proper-rational-log-distribution` — The logarithmic distribution for proper rational inputs | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-integer-class-log-distribution` — The logarithmic distribution at the integer endpoint | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-rational-integral-translation` — Integer translation preserves rational integrality | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-rational-affine-translation-reindex` — Integer translation of rational division preimages | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-log-preimage-translation` — Translation of the sum over logarithmic preimages | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-rational-log-distribution` — The logarithmic distribution for every integral rational | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-rational-weighted-log-distribution` — The period-weighted distribution on all integral rationals | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-rational-common-log-average` — The common-length distribution for rational orbit averages | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-rational-log-average-distribution` — The intrinsic rational Gamma logarithm distribution | §4.5 family cases | Target under the family hypotheses. |
| `gross-koblitz-circle-eq-iff` — Equality in the rational circle through positive representatives | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-orbit-period-iff-integer` — The exact integer criterion for a Gamma orbit period | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-period-iff` — Native circle periods coincide with integral Gamma orbit periods | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-periodic` — Every integral rational gives a periodic circle point | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-native-period-pos` — Positivity of the native least orbit period | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-native-period-periodic` — The native least period is a Gamma orbit period | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-native-period-dvd` — The native least period divides every Gamma orbit period | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-native-period-le` — Minimality among positive Gamma orbit periods | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-native-period-integer` — The integer class has least period one | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-native-period-translation` — Integer translation preserves the least period | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-native-period-neg` — Negation preserves the least period | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-native-period-frobenius` — Multiplication by p preserves the least period | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-source-phi` — The intrinsic Gross–Koblitz source logarithm | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-intrinsic-mean` — The intrinsic Gamma orbit mean | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-source-phi-period` — Every period sum repeats the intrinsic source value | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-intrinsic-mean-period` — Any positive-period average equals the intrinsic mean | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-intrinsic-mean-div` — The mean is the source value divided by the least period | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-intrinsic-mean-mul` — Recovering the source value from the intrinsic mean | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-source-phi-translation` — Integer translation of the intrinsic source value | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-source-phi-frobenius` — Frobenius invariance of the intrinsic source value | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-source-phi-neg` — Oddness of the intrinsic source value | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-source-phi-integer` — Vanishing of the intrinsic source value at integer classes | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-intrinsic-mean-translation` — Integer translation of the intrinsic mean | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-intrinsic-mean-frobenius` — Frobenius invariance of the intrinsic mean | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-intrinsic-mean-neg` — Oddness of the intrinsic mean | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-intrinsic-mean-integer` — Vanishing of the intrinsic mean at integer classes | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-intrinsic-mean-distribution` — The intrinsic Gamma mean distribution | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-source-phi-distribution` — The intrinsic period-weighted source distribution | §4.6 family cases | Corrected period-weighted Phi / characteristic-zero Mean; no general integral average. |
| `gross-koblitz-circle-period-integer` — A native circle period gives an integer difference | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-periodic-integral` — Periodic rational classes have integral representatives | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-integral-iff-periodic` — The native periodic domain is the integral rational circle | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-representative-integral` — The positive representative of a periodic class is integral | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-source-phi-circle-eq` — Class invariance of the intrinsic Phi | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-intrinsic-mean-circle-eq` — Class invariance of the intrinsic Mean | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-phi` — The quotient source Gamma logarithm | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-circle-phi-eval` — Evaluation of Phi_bar at any rational representative | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-phi-apply` — Evaluation after inclusion of an integral rational | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-phi-unique` — Uniqueness of the quotient descent for Phi_bar | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-mean` — The quotient Gamma orbit mean | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-circle-mean-eval` — Evaluation of Mean_bar at any rational representative | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-mean-apply` — Evaluation after inclusion of an integral rational | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-mean-unique` — Uniqueness of the quotient descent for Mean_bar | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-neg-mem` — Negation preserves the native integral-class domain | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-frobenius-mem` — Multiplication by p preserves the native domain | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-rational-frobenius-integral` — Multiplication by p preserves rational integrality | §4.5 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-phi-neg` — Oddness of Phi_bar | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-phi-zero` — Vanishing of Phi_bar at the zero class | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-phi-frobenius` — Frobenius invariance of Phi_bar | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-mean-neg` — Oddness of Mean_bar | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-mean-zero` — Vanishing of Mean_bar at the zero class | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-mean-frobenius` — Frobenius invariance of Mean_bar | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-mean-div` — The quotient mean divided by its native period | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-mean-mul` — Recovering the quotient source value from its mean | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-circle-mean-distribution` — The quotient Gamma mean distribution | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-circle-phi-distribution` — The period-weighted quotient source distribution | §4.6 family cases | Corrected period-weighted Phi / characteristic-zero Mean; no general integral average. |
| `gross-koblitz-division-point` — The displayed points solve the circle division equation | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-division-surjective` — Every circle division point has a displayed index | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-division-injective` — Distinct displayed indices give distinct division points | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-division-root-periodic` — Every ambient division root lies in the integral domain | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-division-fiber-equiv` — The native finite equivalence for a circle division fiber | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-division-fiber-equiv-coe` — The forward equivalence has the literal division-point formula | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-division-fiber-equiv-symm-coe` — The inverse index recovers the actual fiber point | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-division-fiber-equiv-card` — The circle division fiber has exactly m points | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-division-finite` — The actual circle division fiber is finite | §4.6 family cases | API under the family hypotheses. |
| `gross-koblitz-mean-fiber-sum` — The Gamma mean distribution over the complete native fiber | §4.6 family cases | Target under the family hypotheses. |
| `gross-koblitz-source-fiber-sum` — The weighted source distribution over the complete native fiber | §4.6 family cases | Target under the family hypotheses. |
| `kubert-circle-fiber-finite` — Finite division fibers on the rational circle | §4.7 family cases | API under the family hypotheses. |
| `kubert-torus-fiber-finite` — Finite division fibers on every finite-rank rational torus | §4.7 family cases | API under the family hypotheses. |
| `kubert-relation` — The weighted division relator | §4.7 family cases | Target under the family hypotheses. |
| `kubert-relation-eval` — Evaluation of a weighted division relator | §4.7 family cases | API under the family hypotheses. |
| `kubert-relation-one` — The multiplier-one relator vanishes | §4.7 family cases | API under the family hypotheses. |
| `kubert-relation-weight-zero` — Weight zero gives the ordinary relator | §4.7 family cases | API under the family hypotheses. |
| `kubert-relation-fintype-independent` — A relator is independent of finite enumeration | §4.7 family cases | API under the family hypotheses. |
| `kubert-relations` — The subgroup of weighted distribution relations | §4.7 family cases | Target under the family hypotheses. |
| `kubert-relation-mem` — Every permitted relator lies in the relation subgroup | §4.7 family cases | API under the family hypotheses. |
| `kubert-relations-le-ker-iff` — The kernel criterion for a distribution | §4.7 family cases | API under the family hypotheses. |
| `kubert-quotient-relation` — The canonical generators satisfy distribution | §4.11 family cases | API under the family hypotheses. |
| `kubert-lift` — The homomorphism induced by a distribution | §4.7 family cases | Target under the family hypotheses. |
| `kubert-lift-of` — The induced map evaluates on generators | §4.7 family cases | API under the family hypotheses. |
| `kubert-hom-ext` — Quotient homomorphisms are determined by generators | §4.11 family cases | API under the family hypotheses. |
| `kubert-lift-unique` — Uniqueness of the induced distribution homomorphism | §4.7 family cases | API under the family hypotheses. |
| `kubert-existsUnique-lift` — The universal mapping property of distribution relations | §4.11 family cases | Target under the family hypotheses. |
| `kubert-quotient-function-distribution` — Every quotient homomorphism gives a distribution | §4.11 family cases | API under the family hypotheses. |
| `kubert-postcompose-distribution` — Additive coefficient maps preserve distributions | §4.11 family cases | API under the family hypotheses. |
| `kubert-lift-postcompose` — The induced homomorphism is natural in coefficients | §4.7 family cases | API under the family hypotheses. |
| `kubert-lift-zero` — The zero distribution induces the zero map | §4.7 family cases | API under the family hypotheses. |
| `kubert-add-distribution` — Distributions are closed under addition | §4.11 family cases | API under the family hypotheses. |
| `kubert-lift-add` — The induced homomorphism preserves addition | §4.7 family cases | API under the family hypotheses. |
| `kubert-relations-empty-eq-bot` — No permitted degrees give no relations | §4.7 family cases | API under the family hypotheses. |
| `kubert-relations-one-eq-bot` — The degree-one system gives no relations | §4.7 family cases | API under the family hypotheses. |
| `gamma-distribution-circle-zero-mem` — The zero rational class is periodic | §4.7 family cases | API under the family hypotheses. |
| `gamma-distribution-circle-add-mem` — Periodic rational classes are closed under addition | §4.7 family cases | API under the family hypotheses. |
| `gamma-distribution-integralCircle` — The subgroup of integral rational classes | §4.7 family cases | Target under the family hypotheses. |
| `gamma-distribution-integralCircle-mem-iff` — Membership is rational p-adic integrality | §4.7 family cases | API under the family hypotheses. |
| `gamma-distribution-integralCircle-carrier` — The subgroup retains the periodic-point carrier | §4.7 family cases | API under the family hypotheses. |
| `gamma-distribution-integralCircle-fiber-finite` — Actual integral-class division fibers are finite | §4.7 family cases | API under the family hypotheses. |
| `gamma-distribution-integralCircle-division-surjective` — Prime-to-p division is surjective on integral classes | §4.7 family cases | API under the family hypotheses. |
| `gamma-distribution-integralCircle-fiber-card` — Prime-to-p fibers have the expected cardinality | §4.7 family cases | API under the family hypotheses. |
| `gamma-distribution-mean-distribution` — The Gamma mean is an ordinary distribution on integral classes | §4.7 family cases | API under the family hypotheses. |
| `gamma-distribution-meanLift` — The Gamma mean factors through distribution relations | §4.7 family cases | Target under the family hypotheses. |
| `gamma-distribution-meanLift-of` — The factor map evaluates the canonical generator | §4.7 family cases | API under the family hypotheses. |
| `gamma-distribution-meanLift-unique` — The Gamma factorization is uniquely determined | §4.7 family cases | API under the family hypotheses. |
| `gamma-distribution-meanLift-zero-generator` — The factor map kills the zero-labelled generator | §4.7 family cases | API under the family hypotheses. |
| `gamma-distribution-meanLift-odd-relation` — The factor map kills the oddness relators | §4.7 family cases | API under the family hypotheses. |
| `gamma-distribution-meanLift-frobenius-relation` — The factor map kills the Frobenius relators | §4.7 family cases | API under the family hypotheses. |
| `kubert-parity-relations` — Integer even and odd distribution relations | §4.7 family cases | Target under the family hypotheses. |
| `kubert-parity-mem` — A labelled parity relator belongs to the subgroup | §4.11 family cases | API under the family hypotheses. |
| `kubert-parity-le-ker-iff` — The exact parity kernel criterion | §4.11 family cases | API under the family hypotheses. |
| `kubert-parity-lift` — The homomorphism induced on a parity quotient | §4.7 family cases | Target under the family hypotheses. |
| `kubert-parity-lift-of` — Parity descent evaluates labelled generators | §4.7 family cases | API under the family hypotheses. |
| `kubert-parity-quotient-relation` — Parity holds in the quotient itself | §4.11 family cases | API under the family hypotheses. |
| `kubert-parity-hom-ext` — Parity quotient maps are determined by labelled generators | §4.11 family cases | API under the family hypotheses. |
| `kubert-parity-lift-unique` — Uniqueness of parity descent | §4.7 family cases | API under the family hypotheses. |
| `kubert-odd-fixed-point-two-torsion` — Negation-fixed labels become two-torsion in the odd quotient | §4.11 family cases | API under the family hypotheses. |
| `kubert-zero-indicator-distribution` — The zero indicator is an ordinary mod-two distribution | §4.11 family cases | API under the family hypotheses. |
| `kubert-zero-indicator-odd` — The mod-two zero indicator is odd | §4.11 family cases | API under the family hypotheses. |
| `kubert-odd-zero-generator-ne-zero` — The zero label survives the integral odd quotient | §4.11 family cases | API under the family hypotheses. |
| `kubert-orbit-relations` — Relations identifying endomorphism orbits | §4.7 family cases | Target under the family hypotheses. |
| `kubert-orbit-mem` — An endomorphism relator lies in its subgroup | §4.11 family cases | API under the family hypotheses. |
| `kubert-orbit-le-ker-iff` — The exact orbit kernel criterion | §4.11 family cases | API under the family hypotheses. |
| `kubert-normalized-odd-orbit-relations` — The normalized odd orbit relation subgroup | §4.7 family cases | Target under the family hypotheses. |
| `kubert-normalized-le-ker-iff` — The exact normalized odd orbit kernel criterion | §4.7 family cases | API under the family hypotheses. |
| `kubert-normalized-lift` — The induced normalized odd orbit homomorphism | §4.7 family cases | Target under the family hypotheses. |
| `kubert-normalized-lift-of` — Normalized descent evaluates the canonical generator | §4.7 family cases | API under the family hypotheses. |
| `kubert-normalized-hom-ext` — Normalized quotient maps are determined by generators | §4.7 family cases | API under the family hypotheses. |
| `kubert-normalized-lift-unique` — Uniqueness of normalized odd orbit descent | §4.7 family cases | API under the family hypotheses. |
| `kubert-normalized-quotient-zero` — The zero label vanishes in the normalized quotient | §4.7 family cases | API under the family hypotheses. |
| `kubert-normalized-quotient-odd` — The normalized quotient retains oddness | §4.7 family cases | API under the family hypotheses. |
| `kubert-normalized-quotient-orbit` — The normalized quotient identifies endomorphism orbits | §4.7 family cases | API under the family hypotheses. |
| `kubert-normalized-quotient-distribution` — Distribution relations survive normalization | §4.7 family cases | API under the family hypotheses. |
| `kubert-reduced-mean-lift` — The Gamma mean descends to the normalized odd Frobenius quotient | §4.7 family cases | Target under the family hypotheses. |
| `kubert-reduced-mean-lift-of` — The descended Gamma map evaluates its generator | §4.7 family cases | API under the family hypotheses. |
| `kubert-reduced-mean-lift-comp-quotient` — The Gamma quotient square commutes | §4.7 family cases | API under the family hypotheses. |
| `kubert-reduced-mean-lift-unique` — The normalized Gamma factorization is unique | §4.7 family cases | API under the family hypotheses. |
| `kubert-finite-level-torus-level-finite` — The finite-level rational torus is a finite native subgroup | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-preimage-mem-level` — Allowed image labels have no preimages outside the level | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-level-fiber-equiv` — The equivalence of internal and ambient permitted fibers | §4.8 family cases | Target under the family hypotheses. |
| `kubert-finite-level-level-fiber-equiv-coe` — The fiber equivalence preserves the actual root | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-level-fiber-equiv-symm-coe` — The inverse fiber equivalence preserves the actual root | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-level-fiber-equiv-card` — Permitted level fibers have the ambient cardinality | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-level-relation-map` — The internal weighted relator maps to the full global relator | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-level-map-injective` — The free level group embeds in the global free group | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-level-input-iff` — The permitted label image equals the smaller torsion subgroup | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-internal-relations` — The internal finite-level distribution subgroup | §4.8 family cases | Target under the family hypotheses. |
| `kubert-finite-level-internal-relation-mem` — Every permitted internal relator belongs to the subgroup | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-internal-le-ker-iff` — The exact internal distribution kernel criterion | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-internal-le-global-comap` — Internal relations lie in the global relation intersection | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-comparison` — The finite-level comparison quotient map | §4.8 family cases | Target under the family hypotheses. |
| `kubert-finite-level-comparison-of` — The comparison evaluates a labelled generator | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-comparison-surjective` — The finite-level comparison is surjective | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-level-to-global` — The internal finite-level quotient maps to the global quotient | §4.8 family cases | Target under the family hypotheses. |
| `kubert-finite-level-level-to-global-of` — The global map evaluates the level generator | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-internal-quotient-relation` — The internal quotient satisfies exactly the permitted relations | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-comparison-injective-iff` — Comparison injectivity is precisely equality of relation subgroups | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-level-to-global-injective-iff` — Global-map injectivity has the same exact boundary | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-level-to-global-factors` — The finite-level comparison square commutes | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-level-to-global-range` — The global image is exactly the finite-level image | §4.8 family cases | API under the family hypotheses. |
| `kubert-finite-level-internal-level-one` — Level one imposes no internal relations | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-primitive-points` — Primitive points of an exact level | §4.8 family cases | Target under the family hypotheses. |
| `kubert-generators-primitive-mem-level` — Primitive lower-level points lie in a larger level | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-primitive-one` — The unit primitive stratum is zero | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-primitive-zero-mem-iff` — Zero belongs only to the unit primitive stratum | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-primitive-disjoint` — Distinct exact-order strata are disjoint | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-primitive-finite` — Primitive rational-torus strata are finite | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-level-order-dvd` — A level point has order dividing the level | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-level-order-pos` — Positive levels have positive point orders | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-level-primitive-partition` — Every level point has a unique primitive stratum | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-primitive-nsmul` — Divisor multiplication reduces exact order | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-distinguished-point` — The distinguished primitive point | §4.8 family cases | Target under the family hypotheses. |
| `kubert-generators-distinguished-point-zero` — The first coordinate of the distinguished point | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-distinguished-point-other` — The other distinguished coordinates vanish | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-distinguished-point-order` — The distinguished point has the specified exact order | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-distinguished-point-primitive` — The distinguished point lies in the primitive stratum | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-distinguished-point-eq-zero-iff` — The distinguished point vanishes only at level one | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-distinguished-point-mem-level` — Distinguished lower-level points belong to larger levels | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-admissible-divisors` — Admissible divisors of a level | §4.8 family cases | Target under the family hypotheses. |
| `kubert-generators-admissible-mem-iff` — The exact admissibility criterion | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-admissible-one` — The unit divisor is admissible | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-admissible-self` — The full level is admissible | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-admissible-pos` — Admissible divisors are positive | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-admissible-complement` — Admissibility survives complementation | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-admissible-prime-power` — A prime power has only endpoint admissible divisors | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-admissible-level-one` — The unit level has one admissible divisor | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-admissible-level-zero` — The zero level has no admissible divisors | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-local-choices` — The local primitive replacement set | §4.8 family cases | Target under the family hypotheses. |
| `kubert-generators-local-choices-mem-iff` — The exact local-choice predicate | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-local-choices-zero` — The local set contains zero | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-local-choices-distinguished` — The exceptional point is removed at nontrivial level | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-local-choices-mem-level` — Local choices belong to the actual level kernel | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-local-choices-finite` — Local choice sets at positive levels are finite | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-local-choice-equiv` — The primitive-to-local replacement equivalence | §4.8 family cases | Target under the family hypotheses. |
| `kubert-generators-local-choice-equiv-apply` — The replacement equivalence has the native swap value | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-local-choices-card` — Local replacement preserves primitive cardinality | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-local-choices-one` — The local unit-level set is the zero singleton | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-local-choice-equiv-distinguished` — The local equivalence sends the exceptional point to zero | §4.8 family cases | API under the family hypotheses. |
| `kubert-generators-local-choice-equiv-fixed` — The local equivalence fixes all other primitive points | §4.8 family cases | API under the family hypotheses. |
| `kubert-primary-primary-internal` — Native torsion submodules form the primary internal sum | §4.8 family cases | API under the family hypotheses. |
| `kubert-primary-primary-component-equiv` — Nested torsion is the actual ambient primary kernel | §4.8 family cases | Target under the family hypotheses. |
| `kubert-primary-primary-coordinates` — The actual primary-coordinate equivalence | §4.8 family cases | Target under the family hypotheses. |
| `kubert-primary-primary-component-equiv-coe` — The component transport preserves the point | §4.8 family cases | API under the family hypotheses. |
| `kubert-primary-primary-component-equiv-symm-coe` — The inverse component transport preserves the point | §4.8 family cases | API under the family hypotheses. |
| `kubert-primary-primary-coordinates-symm-coe` — The inverse primary map is the actual component sum | §4.8 family cases | API under the family hypotheses. |
| `kubert-primary-sum-primary-coordinates` — Primary components reconstruct the original point | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-primary-coordinates-same` — A primary point is fixed in its own coordinate | §4.8 family cases | API under the family hypotheses. |
| `kubert-primary-primary-coordinates-other` — A primary point vanishes in every other coordinate | §4.8 family cases | API under the family hypotheses. |
| `kubert-primary-primary-coordinates-order` — Point order is the product of primary component orders | §4.8 family cases | API under the family hypotheses. |
| `kubert-primary-primary-coordinates-primitive-iff` — Primitivity is full order in every primary coordinate | §4.8 family cases | API under the family hypotheses. |
| `kubert-primary-primitive-coordinates` — The primitive-point primary product equivalence | §4.11 family cases | Target under the family hypotheses. |
| `kubert-primary-primitive-coordinates-coe` — The primitive equivalence uses the same actual projections | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-primitive-coordinates-symm-coe` — The primitive inverse is the actual primary-point sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-primitive-torus-card-product` — Primitive rational-torus cardinalities multiply | §4.11 family cases | API under the family hypotheses. |
| `kubert-generator-product-level-mono` — Divisor levels include as native torsion kernels | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-lifted-component-same` — An included primary point keeps its coordinate | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-lifted-component-other` — An included primary point has no other components | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-included-primary-sum` — The included point is the sum of its old components | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-primary-coordinates-inclusion` — Primary values are compatible across divisor levels | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-primary-coordinates-outside` — New prime coordinates of an old-level point vanish | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-admissible-factorization` — Admissible divisors retain full prime exponents | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-admissible-primary-power` — Admissible divisors retain full primary powers | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-primitive-coordinate-inclusion` — Primitive coordinates agree with ambient level inclusion | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-primitive-coordinate-outside` — A primitive old-level point has zero new coordinates | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-exceptional-primitive` — Exceptional primitive points at a primary factor | §4.8 family cases | Target under the family hypotheses. |
| `kubert-generator-product-reduced-primitive` — Reduced primitive points | §4.8 family cases | Target under the family hypotheses. |
| `kubert-generator-product-exceptional-mem-iff` — Exceptional membership tests the actual projection | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-exceptional-subset` — Exceptional points remain primitive | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-reduced-mem-iff` — Reduced primitivity avoids every exceptional coordinate | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-reduced-subset` — Reduced points remain primitive | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-reduced-one` — The unit reduced stratum is the source singleton | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-reduced-zero-iff` — Zero belongs only to the unit reduced stratum | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-reduced-finite` — Reduced primitive strata are finite | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-reduced-disjoint` — Distinct reduced orders give disjoint strata | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-admissible-generators` — Kubert admissible generating set | §4.8 family cases | Target under the family hypotheses. |
| `kubert-generator-product-generators-mem-iff` — Source-union membership has an admissible witness | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-generators-mem-level` — Every source generator lies at its stated level | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-generators-zero` — The source union always contains zero | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-generators-one` — The unit source union is a singleton | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-generators-finite` — The actual admissible source union is finite | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-generators-coordinates` — Source generators have allowed local coordinates | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-primary-subproduct-admissible` — Products of full primary factors are admissible | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-local-order-admissible` — Allowed local choices force an admissible point order | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-primary-power-gt-one` — A present primary factor is nonunit | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-generators-of-coordinates` — Allowed coordinates reconstruct the source union | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-generators-coordinates-iff` — The source union has the local-product criterion | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-generator-coordinates` — The actual admissible-generator product equivalence | §4.8 family cases | Target under the family hypotheses. |
| `kubert-generator-product-generator-coordinates-coe` — The generator map uses the actual primary projection | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-generator-coordinates-symm-coe` — The inverse generator map is the actual component sum | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-generators-card-product` — The source generating-set cardinality is a local product | §4.8 family cases | API under the family hypotheses. |
| `kubert-generator-product-generators-card-primitive` — Kubert generating-set cardinality | §4.8 family cases | Target under the family hypotheses. |
| `kubert-primitive-lifts-root-mem-level` — Roots of primitive points lie at the larger level | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-root-primitive-same-primes` — Same-support primitive roots have full order | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-primitive-fiber-equiv` — Full roots are the actual primitive root fiber | §4.8 family cases | Target under the family hypotheses. |
| `kubert-primitive-lifts-primitive-fiber-equiv-coe` — Primitive fiber transport retains every root | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-primitive-fiber-equiv-symm-coe` — Inverse primitive fiber transport retains every root | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-primitive-lift-exists` — Primitive lifts exist in the native divisible group | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-primitive-fiber-finite` — Primitive rational-torus fibers are finite | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-level-primitive-fiber-equiv` — Internal level fibers equal primitive root fibers | §4.8 family cases | Target under the family hypotheses. |
| `kubert-primitive-lifts-level-primitive-fiber-equiv-coe` — The internal fiber map keeps the ambient point | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-level-primitive-fiber-equiv-symm-coe` — The inverse internal fiber map keeps the ambient point | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-internal-ordinary-relation` — The ordinary relation at a valid internal input | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-support-completion` — Full-primary completion of a divisor | §4.8 family cases | Target under the family hypotheses. |
| `kubert-primitive-lifts-support-completion-admissible` — The full-primary completion is admissible | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-dvd-support-completion` — The original divisor divides its completion | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-support-completion-pos` — The completed divisor is positive | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-support-completion-dvd` — The completion still divides the ambient level | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-support-completion-one` — The empty prime support completes to one | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-support-completion-self` — The ambient level is fixed by completion | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-support-completion-prime-factors` — Completion preserves exactly the prime support | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-support-completion-admissible-fixed` — Admissible divisors are fixed by completion | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-primitive-quotient-relation` — A lower primitive label is the complete primitive-root sum | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-admissible-primitive-span` — Admissible primitive-label subgroup | §4.8 family cases | Target under the family hypotheses. |
| `kubert-primitive-lifts-admissible-label-mem` — Admissible-order labels lie in the source subgroup | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-primitive-label-mem` — Every admissible primitive stratum supplies subgroup generators | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-every-label-mem-admissible-span` — Every point label reduces to admissible primitive labels | §4.8 family cases | API under the family hypotheses. |
| `kubert-primitive-lifts-admissible-primitive-span-eq-top` — Kubert admissible-order spanning lemma | §4.8 family cases | Target under the family hypotheses. |
| `kubert-prime-power-prime-power-primitive-iff` — Primitive prime-power points form the lower-kernel complement | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-power-zero-fiber-relation` — A complete zero fiber has the zero-point label sum | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-power-level-label-sum` — All level labels sum to the zero-point label | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-power-prime-power-primitive-label-sum` — The prime-power primitive-label sum vanishes | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-power-reduced-generator-span` — The source-generator subgroup in the internal quotient | §4.8 family cases | Target under the family hypotheses. |
| `kubert-prime-power-source-label-mem` — Each source point supplies a subgroup generator | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-power-zero-label-mem` — The zero-point label is always available | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-power-primary-power-at-prime-power` — Every primary factor of a prime power is the entire level | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-power-prime-power-reduced` — Every nonexceptional primitive prime-power point is reduced | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-power-prime-power-source` — Nonexceptional primitive points belong to the source union | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-power-prime-power-primitive-label-mem` — Recover the omitted distinguished primitive label | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-power-prime-power-span-eq-top` — Kubert prime-power source generation | §4.8 family cases | Target under the family hypotheses. |
| `kubert-prime-power-unit-level-span-eq-top` — The unit-level source set generates the quotient | §4.8 family cases | Target under the family hypotheses. |
| `kubert-admissible-transport-inclusion-fiber-equiv` — Complete internal fibers are unchanged under level inclusion | §4.8 family cases | Target under the family hypotheses. |
| `kubert-admissible-transport-inclusion-fiber-equiv-coe` — Forward root transport is the native level inclusion | §4.8 family cases | API under the family hypotheses. |
| `kubert-admissible-transport-inclusion-fiber-equiv-symm-coe` — Inverse root transport preserves the ambient point | §4.8 family cases | API under the family hypotheses. |
| `kubert-admissible-transport-inclusion-fiber-equiv-card` — The complete valid fiber has level-independent cardinality | §4.8 family cases | API under the family hypotheses. |
| `kubert-admissible-transport-relation-map-inclusion` — Weighted internal relators survive level inclusion | §4.8 family cases | API under the family hypotheses. |
| `kubert-admissible-transport-internal-le-inclusion-comap` — All smaller-level internal relations descend | §4.8 family cases | API under the family hypotheses. |
| `kubert-admissible-transport-level-map` — The internal quotient map along a level divisor | §4.8 family cases | Target under the family hypotheses. |
| `kubert-admissible-transport-level-map-of` — The internal quotient map preserves actual point labels | §4.8 family cases | API under the family hypotheses. |
| `kubert-admissible-transport-level-map-self` — The same-level quotient map is the identity | §4.8 family cases | API under the family hypotheses. |
| `kubert-admissible-transport-level-map-comp` — Internal quotient maps compose along divisibility | §4.8 family cases | API under the family hypotheses. |
| `kubert-admissible-transport-admissible-trans` — Admissibility is transitive through admissible levels | §4.8 family cases | API under the family hypotheses. |
| `kubert-admissible-transport-generators-admissible-mono` — The source union embeds along admissible levels | §4.8 family cases | API under the family hypotheses. |
| `kubert-admissible-transport-source-span-le-comap` — Source-generated subgroups transport to the larger level | §4.8 family cases | API under the family hypotheses. |
| `kubert-admissible-transport-label-mem-of-lower-span` — Lower admissible generation supplies larger-level labels | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-fiber-coprime-nsmul-injective-on-level` — Coprime scalar multiplication is injective on a level kernel | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-fiber-coprime-nsmul-surjective-on-level` — Coprime scalar multiplication is surjective on a level kernel | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-fiber-coprime-level-root-unique` — A coprime root is unique within its level | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-fiber-coprime-level-root-primitive` — The lower-level root retains the exact point order | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-fiber-prime-root-order-cases` — A prime root has one of two exact orders | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-fiber-prime-root-lower-iff-level` — The lower order is detected by the lower-level kernel | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-fiber-prime-root-partition` — A prime fiber splits at its unique lower-level root | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-fiber-prime-root-partition-disjoint` — The two primitive strata are disjoint at a positive base level | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-fiber-prime-root-complement-equiv` — The full fiber minus its lower root is the primitive root fiber | §4.8 family cases | Target under the family hypotheses. |
| `kubert-prime-fiber-prime-root-complement-equiv-coe` — The complement map retains the actual root | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-fiber-prime-root-complement-equiv-symm-coe` — The inverse complement map retains the actual root | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-fiber-prime-root-sum` — The lower-root value plus the primitive sum is the full root sum | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-fiber-prime-root-quotient-sum` — The split prime-fiber relation in the internal quotient | §4.8 family cases | API under the family hypotheses. |
| `kubert-prime-fiber-prime-root-card` — Exactly one full root lies below the primitive higher stratum | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-prime-layer-dvd` — The primitive prime layer divides the higher level | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-prime-power-quotient-layer` — The lift degree to the higher level is the remaining prime power | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-prime-power-quotient-scalar` — The image level after the higher power is the prime layer | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-prime-power-same-support` — The higher level and prime layer have the same support | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-prime-power-fiber-map` — The actual higher-power map between primitive fibers | §4.8 family cases | Target under the family hypotheses. |
| `kubert-exceptional-prime-power-fiber-map-coe` — The higher-power map evaluates to the actual multiple | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-prime-power-fiber-map-surjective` — Every primitive prime root belongs to the source image | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-higher-root-primitive` — Every full higher-power root has the required exact order | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-higher-power-fiber-equiv` — A reduction-map fiber is the complete ambient root fiber | §4.8 family cases | Target under the family hypotheses. |
| `kubert-exceptional-higher-power-fiber-equiv-coe` — The complete-fiber map retains the source point | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-higher-power-fiber-equiv-symm-coe` — The inverse complete-fiber map retains the ambient root | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-higher-image-label-mem` — Every other higher-power image label is available | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-complementary-level-admissible` — The lower complementary level is admissible | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-lower-image-primitive` — The lower image has the exact complementary order | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-fiber-elimination` — Two complete relations recover the omitted source label | §4.8 family cases | Target under the family hypotheses. |
| `kubert-exceptional-exceptional-label-mem` — Kubert exceptional-fiber elimination lemma | §4.8 family cases | Target under the family hypotheses. |
| `kubert-composite-primary-coordinates-agree-off` — Other primary coordinates are fixed throughout the selected fiber | §4.8 family cases | API under the family hypotheses. |
| `kubert-composite-primary-coordinates-differ-at-selected` — Distinct points in a selected fiber differ at its selected coordinate | §4.8 family cases | API under the family hypotheses. |
| `kubert-composite-exceptional-indices` — The actual finite set of exceptional primary coordinates | §4.8 family cases | Target under the family hypotheses. |
| `kubert-composite-exceptional-indices-mem-iff` — Exceptional membership is equality of the actual primary coordinate | §4.8 family cases | API under the family hypotheses. |
| `kubert-composite-exceptional-indices-empty-iff` — The zero-exception locus is the reduced primitive source | §4.8 family cases | API under the family hypotheses. |
| `kubert-composite-exceptional-indices-unit` — The unit level has no exceptional coordinate | §4.8 family cases | API under the family hypotheses. |
| `kubert-composite-exceptional-indices-fiber-erase` — Every other primitive root loses exactly the chosen exceptional prime | §4.8 family cases | API under the family hypotheses. |
| `kubert-composite-exceptional-indices-fiber-card-lt` — The exceptional-coordinate induction strictly decreases | §4.8 family cases | API under the family hypotheses. |
| `kubert-composite-primary-power-admissible` — Each full primary power is an admissible level | §4.8 family cases | API under the family hypotheses. |
| `kubert-composite-primary-complement-coprime` — The selected prime is coprime to its complementary level | §4.8 family cases | API under the family hypotheses. |
| `kubert-composite-primary-complement-lt` — Removing a full primary power lowers the level | §4.8 family cases | API under the family hypotheses. |
| `kubert-composite-primitive-label-mem-of-lower` — Exceptional-coordinate descent makes every primitive label available | §4.8 family cases | Target under the family hypotheses. |
| `kubert-composite-span-eq-top-of-lower` — Proper-level generation gives the entire current quotient | §4.8 family cases | Target under the family hypotheses. |
| `kubert-composite-source-span-eq-top` — Kubert source generators span every positive internal level | §4.8 family cases | Target under the family hypotheses. |
| `kubert-composite-every-label-mem-source-span` — Every actual point label is available | §4.8 family cases | API under the family hypotheses. |
| `kubert-presentation-source-map` — The actual source presentation of the internal quotient | §4.8 family cases | Target under the family hypotheses. |
| `kubert-presentation-source-map-of` — Internal source presentation evaluates to the same point label | §4.8 family cases | API under the family hypotheses. |
| `kubert-presentation-source-map-range` — The source presentation image is the established source subgroup | §4.8 family cases | API under the family hypotheses. |
| `kubert-presentation-source-map-surjective` — The actual internal source presentation is surjective | §4.8 family cases | Target under the family hypotheses. |
| `kubert-presentation-source-global-map` — The source presentation of the finite global quotient | §4.8 family cases | Target under the family hypotheses. |
| `kubert-presentation-source-global-map-of` — Finite global source evaluation keeps the original label | §4.8 family cases | API under the family hypotheses. |
| `kubert-presentation-source-global-map-surjective` — The finite global source presentation is surjective | §4.8 family cases | Target under the family hypotheses. |
| `kubert-presentation-source-to-global` — The actual source map into the universal quotient | §4.8 family cases | Target under the family hypotheses. |
| `kubert-presentation-source-to-global-of` — Ambient source evaluation retains the actual torus point | §4.8 family cases | API under the family hypotheses. |
| `kubert-presentation-source-to-global-range` — The actual source image equals the existing level image | §4.8 family cases | API under the family hypotheses. |
| `kubert-presentation-source-module-finite` — The actual free source group is a finite integer module | §4.8 family cases | API under the family hypotheses. |
| `kubert-presentation-internal-module-finite` — The internal ordinary quotient is finitely generated | §4.8 family cases | API under the family hypotheses. |
| `kubert-presentation-internal-finrank-le` — The internal rank is at most the primitive-point count | §4.8 family cases | Target under the family hypotheses. |
| `kubert-presentation-global-level-module-finite` — The finite global quotient is finitely generated | §4.8 family cases | API under the family hypotheses. |
| `kubert-presentation-global-level-finrank-le` — The finite global rank has the same primitive-point upper bound | §4.8 family cases | Target under the family hypotheses. |
| `kubert-transfer-primitive-reduction` — Reduction between actual primitive-point levels | §4.9 family cases | Target under the family hypotheses. |
| `kubert-transfer-primitive-reduction-coe` — Primitive reduction has the actual quotient-degree value | §4.9 family cases | API under the family hypotheses. |
| `kubert-transfer-primitive-reduction-eq-iff` — A reduction fiber is exactly the actual root fiber | §4.9 family cases | API under the family hypotheses. |
| `kubert-transfer-primitive-reduction-self` — Primitive reduction at one level is the identity | §4.9 family cases | API under the family hypotheses. |
| `kubert-transfer-primitive-reduction-comp` — Primitive reductions compose along divisibility | §4.9 family cases | API under the family hypotheses. |
| `kubert-transfer-primitive-lift-all-divisors` — Every primitive torus point has a primitive lift at every multiple | §4.9 family cases | Target under the family hypotheses. |
| `kubert-transfer-primitive-reduction-surjective` — Primitive reduction is surjective on the rational torus | §4.9 family cases | Target under the family hypotheses. |
| `kubert-transfer-primitive-transfer` — The actual linear primitive-root transfer | §4.9 family cases | Target under the family hypotheses. |
| `kubert-transfer-primitive-transfer-apply` — Transfer evaluates by actual coefficient pullback | §4.9 family cases | API under the family hypotheses. |
| `kubert-transfer-primitive-transfer-injective` — The actual primitive transfer is injective over every semiring | §4.9 family cases | Target under the family hypotheses. |
| `kubert-transfer-primitive-transfer-self` — Primitive transfer at an unchanged level is the identity | §4.9 family cases | API under the family hypotheses. |
| `kubert-transfer-primitive-transfer-comp` — Primitive transfers compose along divisibility | §4.9 family cases | API under the family hypotheses. |
| `kubert-transfer-primitive-transfer-single` — A transferred basis vector is the complete primitive-root sum | §4.9 family cases | API under the family hypotheses. |
| `kubert-transfer-primitive-transfer-support` — The support of transfer is the exact primitive-root preimage | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-equiv` — Restriction of an actual additive equivalence to primitive points | §4.9 family cases | Target under the family hypotheses. |
| `kubert-equivariance-primitive-equiv-coe` — The restricted primitive image is the original point image | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-equiv-symm-coe` — The restricted primitive inverse is the original inverse | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-equiv-refl` — Primitive restriction preserves the identity | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-equiv-symm` — Primitive restriction commutes with inversion | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-equiv-trans` — Primitive restriction preserves composition | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-reduction-equivariant` — Actual primitive reduction commutes with additive equivalences | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-coefficient-equiv` — Actual coefficient relabelling on primitive points | §4.9 family cases | Target under the family hypotheses. |
| `kubert-equivariance-primitive-coefficient-equiv-apply` — Relabelled coefficients use the actual inverse image | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-coefficient-equiv-single` — Relabelling moves basis points forward | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-coefficient-equiv-refl` — Coefficient relabelling preserves identity | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-coefficient-equiv-symm` — Coefficient relabelling preserves inversion | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-coefficient-equiv-trans` — Coefficient relabelling preserves ordered composition | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-transfer-equivariant` — The actual primitive transfer intertwines additive automorphisms | §4.9 family cases | Target under the family hypotheses. |
| `kubert-equivariance-integer-torus-equiv` — The actual integral general-linear action on the rational torus | §4.9 family cases | Target under the family hypotheses. |
| `kubert-equivariance-integer-torus-equiv-apply` — Integral matrix action has the actual coordinate formula | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-integer-torus-equiv-one` — The identity integer matrix fixes the torus | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-integer-torus-equiv-mul` — Integral matrix multiplication agrees with action composition | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-integer-torus-equiv-inv` — The inverse integer matrix gives the inverse torus map | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-g-l-representation` — The actual integral general-linear representation on primitive coefficients | §4.9 family cases | Target under the family hypotheses. |
| `kubert-equivariance-primitive-g-l-representation-apply` — GL coefficients pull back by the actual inverse matrix | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-g-l-representation-single` — The GL representation moves actual primitive basis labels | §4.9 family cases | API under the family hypotheses. |
| `kubert-equivariance-primitive-transfer--g-l-equivariant` — The primitive transfer is an actual GL-module map | §4.9 family cases | Target under the family hypotheses. |
| `kubert-congruence-level-coordinates` — Actual circle coordinates of a torus level kernel | §4.9 family cases | Target under the family hypotheses. |
| `kubert-congruence-level-coordinates-coe` — Level coordinates retain the original point values | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-level-coordinates-symm-coe` — Inverse level coordinates retain the original values | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-primitive-level-equiv` — The actual primitive points inside the actual level subgroup | §4.9 family cases | Target under the family hypotheses. |
| `kubert-congruence-primitive-level-equiv-coe` — Primitive level embedding retains the ambient point | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-primitive-level-equiv-symm-coe` — Primitive level forgetting retains the ambient point | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-circle-level-module` — The actual modular module on the circle level kernel | §4.9 family cases | Target under the family hypotheses. |
| `kubert-congruence-congruence-level-equiv` — The full finite general-linear action on the actual torus level | §4.9 family cases | Target under the family hypotheses. |
| `kubert-congruence-congruence-level-equiv-coe` — The finite matrix action has the actual coordinate sum | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-congruence-level-equiv-one` — The finite identity matrix acts identically | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-congruence-level-equiv-mul` — Finite matrix multiplication preserves the action order | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-congruence-level-equiv-inv` — Finite matrix inversion gives the inverse level map | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-congruence-level-equiv-int-cast-coe` — Reduced integer matrices agree on the actual torus level | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-primitive-congruence-equiv` — The full finite GL permutation of actual primitive points | §4.9 family cases | Target under the family hypotheses. |
| `kubert-congruence-primitive-congruence-equiv-coe` — Finite primitive action keeps the actual level-action value | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-primitive-congruence-equiv-one` — Finite identity fixes all actual primitive points | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-primitive-congruence-equiv-mul` — Finite primitive permutations preserve multiplication | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-primitive-congruence-equiv-inv` — The inverse finite matrix reverses the primitive permutation | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-primitive-congruence-equiv-int-cast` — Reduced integer matrices agree on actual primitive points | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-congruence-representation` — The full finite GL representation on actual primitive coefficients | §4.9 family cases | Target under the family hypotheses. |
| `kubert-congruence-congruence-representation-apply` — Finite coefficients pull back by the inverse primitive action | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-congruence-representation-single` — Finite GL action moves actual primitive basis labels | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-congruence-representation-int-cast` — Finite and integral coefficient actions agree under reduction | §4.9 family cases | API under the family hypotheses. |
| `kubert-congruence-primitive-g-l-representation-factors` — The actual integral representation factors through full finite GL | §4.9 family cases | Target under the family hypotheses. |
| `kubert-congruence-primitive-g-l-representation-congruent` — Congruent integral matrices give identical primitive coefficient actions | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-cartan-unit-reduction` — Reduction between actual local Cartan unit groups | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-cartan-unit-reduction-coe` — Unit reduction retains the actual truncated value | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-cartan-unit-reduction-self` — Same-exponent unit reduction is identity | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-cartan-unit-reduction-comp` — Actual unit reductions compose | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-cartan-unit-reduction-surjective` — Every actual lower Cartan unit lifts | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-cartan-local-norm` — The local Cartan full-lift linear norm | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-cartan-local-norm-apply` — Each unit lift receives the original coefficient | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-cartan-local-norm-injective` — The local Cartan linear norm is injective | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-cartan-local-norm-self` — Same-exponent local norm is identity | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-cartan-local-norm-comp` — Local Cartan linear norms compose | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-cartan-local-norm-single` — The norm sums all actual unit lifts | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-cartan-local-norm-support` — The norm has the exact full-lift support | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-equivariance-cartan-group-ring-norm` — The local norm on native Cartan group rings | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-equivariance-cartan-group-ring-norm-coeff` — The native group-ring norm has the original coefficients | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-equivariance-cartan-group-ring-norm-coeff-apply` — Native group-ring coefficients pull back through reduction | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-equivariance-cartan-group-ring-norm-injective` — The native group-ring norm is injective | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-equivariance-cartan-group-ring-norm-self` — Same-exponent group-ring norm is identity | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-equivariance-cartan-group-ring-norm-comp` — Native Cartan group-ring norms compose | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-equivariance-cartan-group-ring-norm-single` — The native basis norm includes every actual unit lift | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-equivariance-cartan-group-ring-norm-equivariant` — The actual Cartan regular action commutes with the norm | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-equivariance-cartan-group-ring-norm-kernel-invariant` — The actual reduction kernel fixes the norm image | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-equivariance-cartan-norm-intertwining` — The local Cartan norm as a native intertwining map | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-equivariance-cartan-norm-intertwining-to-linear-map` — Forgetting equivariance retains the actual linear norm | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-equivariance-cartan-norm-intertwining-injective` — The native Cartan intertwiner is injective | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-products-cartan-product-reduction` — Reduction of actual finite Cartan products | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-products-cartan-product-reduction-apply` — Product reduction retains each actual truncated unit value | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-products-cartan-product-reduction-self` — Same-level Cartan product reduction is identity | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-products-cartan-product-reduction-comp` — Actual Cartan product reductions compose | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-products-cartan-product-reduction-surjective` — Every actual lower Cartan tuple lifts | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-products-cartan-product-unit-level` — The unit-level Cartan product is trivial | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-products-cartan-product-norm` — The full-lift norm on actual Cartan product group rings | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-products-cartan-product-norm-coeff-apply` — Product-norm coefficients use actual tuple reduction | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-products-cartan-product-norm-injective` — The full Cartan product norm is injective | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-products-cartan-product-norm-self` — Same-level Cartan product norm is identity | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-products-cartan-product-norm-comp` — Actual Cartan product norms compose | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-products-cartan-product-norm-single` — The product norm sums the entire actual tuple fiber | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-products-cartan-product-norm-equivariant` — The full finite Cartan action commutes with the product norm | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-products-cartan-product-intertwining` — The finite Cartan product transition as a native intertwiner | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-products-cartan-product-intertwining-to-linear-map` — Forgetting product equivariance retains the norm | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-products-cartan-product-intertwining-injective` — The finite Cartan product intertwiner is injective | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-projection` — Projection of actual full-Witt units to a local Cartan level | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-projection-coe` — Full-Witt projection retains the actual truncated value | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-projection-surjective` — Every local Cartan unit has an actual full-Witt unit lift | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-projection-reduction` — Local full-Witt projections commute with actual unit reduction | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-product-projection` — The actual common full-Witt product projection | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-product-projection-coe` — The common projection uses the original prime coordinate | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-product-projection-reduction` — Common projections commute with every finite Cartan reduction | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-product-projection-surjective` — Every finite Cartan tuple lifts to the common full-Witt product | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-representation` — The common full-Witt group action on each finite Cartan group ring | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-representation-coeff` — Common-action coefficients pull back by the inverse projected unit | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-limit-cartan-product-norm--witt-equivariant` — Every finite norm commutes with the same common full-Witt action | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-intertwining` — The finite norm as a native common-group intertwiner | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-intertwining-to-linear-map` — Forgetting the common action retains the original finite norm | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-intertwining-injective` — The common-group norm intertwiner is injective | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-intertwining-self` — Same-level common-group transition is the native identity | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-limit-cartan-witt-intertwining-comp` — Common-group Cartan intertwiners compose | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-ring-reduction` — Reduction between actual finite Cartan product rings | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-ring-reduction-apply` — Actual finite ring reduction at an original prime coordinate | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-ring-reduction-self` — Same-level finite Cartan ring reduction is the identity | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-ring-reduction-comp` — Actual finite Cartan ring reductions compose | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-ring-reduction-surjective` — Every finite Cartan ring tuple lifts along reduction | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-ring-reduction-units` — The ring reduction induces the established Cartan group reduction | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-witt-ring-projection` — Projection from the actual all-prime Witt product ring | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-witt-ring-projection-apply` — Full-Witt ring projection retains the original prime value | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-witt-ring-projection-reduction` — All finite ring projections commute with reduction | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-witt-ring-projection-units` — The ring projection induces the established common Cartan unit projection | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-witt-ring-projection-jointly-injective` — All finite Cartan ring projections determine the full-Witt tuple | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-cone-coeff-compatible` — Compatible finite Cartan cones preserve every shared prime coefficient | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-prime-power-cone` — Extracting native prime-power ring maps from a finite Cartan family | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-prime-power-cone-coeff` — Prime-power extraction preserves original lower coefficients | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-prime-power-cone-compat` — The extracted prime-power maps form a native Witt cone | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-witt-ring-lift` — The actual full-Witt lift of a compatible finite Cartan cone | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-witt-ring-lift-projection` — The constructed Witt lift recovers every actual finite Cartan map | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-witt-ring-lift-unique` — The actual full-Witt lift is uniquely determined | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-inverse-limit-cartan-witt-ring-lift-exists-unique` — The concrete Cartan ring inverse-limit universal property | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-group-limit-cartan-unit-cone-ring` — Extending an actual finite Cartan group map to the integral group ring | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-group-limit-cartan-unit-cone-ring-single` — The finite group-ring extension preserves original basis values | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-group-limit-cartan-unit-cone-ring-compat` — A compatible finite Cartan group cone gives a compatible ring cone | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-group-limit-cartan-witt-product-projection-jointly-injective` — All finite Cartan unit projections determine the common unit tuple | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-group-limit-cartan-witt-group-lift` — The actual common Cartan group lift of a compatible finite cone | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-group-limit-cartan-witt-group-lift-coe` — Each common unit value comes from the original ring lift | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-group-limit-cartan-witt-group-lift-projection` — The actual group lift recovers every prescribed finite Cartan map | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-group-limit-cartan-witt-group-lift-unique` — The actual common Cartan group lift is unique | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-group-limit-cartan-witt-group-lift-exists-unique` — The concrete Cartan group inverse-limit universal property | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-padic-cartan-degree-one-padic-equiv` — The actual degree-one Cartan ring as a product of p-adic integers | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-padic-cartan-degree-one-padic-equiv-apply` — The p-adic comparison uses the same original prime coordinate | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-padic-cartan-degree-one-padic-equiv-residue` — Actual p-adic residues agree with the native Witt residues | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-padic-cartan-degree-one-padic-equiv-finite-eq-iff` — Finite Cartan ring equality is exactly equality of p-adic residues | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-padic-cartan-degree-one-padic-units-equiv` — The actual degree-one Cartan group as a product of p-adic units | §4.9 family cases | Target under the family hypotheses. |
| `kubert-cartan-padic-cartan-degree-one-padic-units-equiv-coe` — The p-adic unit comparison preserves the actual ring value | §4.9 family cases | API under the family hypotheses. |
| `kubert-cartan-padic-cartan-degree-one-padic-units-equiv-finite-eq-iff` — Finite Cartan unit equality is exactly equality of p-adic unit residues | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-finite-group` — The actual finite Cartan group as a native finite group | §4.9 family cases | Target under the family hypotheses. |
| `kubert-profinite-cartan-factorial-diagram` — The cofinal factorial diagram of actual Cartan groups | §4.9 family cases | Target under the family hypotheses. |
| `kubert-profinite-cartan-factorial-diagram-map-apply` — Factorial diagram arrows are the original finite reductions | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-profinite-limit` — The native profinite limit of the actual Cartan diagram | §4.9 family cases | Target under the family hypotheses. |
| `kubert-profinite-cartan-to-profinite-limit` — Original full-Witt tuples give native Cartan limit points | §4.9 family cases | Target under the family hypotheses. |
| `kubert-profinite-cartan-to-profinite-limit-apply` — The forward limit map retains each original factorial projection | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-limit-projection` — Projection of the native limit at every positive modulus | §4.9 family cases | Target under the family hypotheses. |
| `kubert-profinite-cartan-limit-projection-apply` — All-level projection is the specified original reduction | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-limit-projection-reduction` — Every original divisibility transition preserves the limit projections | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-limit-projection-to-profinite-limit` — The native limit comparison preserves every original finite projection | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-limit-projection-factorial` — All-level projection recovers the original factorial coordinate | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-from-profinite-limit` — Reconstruction of the original full-Witt tuple from the native limit | §4.9 family cases | Target under the family hypotheses. |
| `kubert-profinite-cartan-from-profinite-limit-projection` — The reconstructed full-Witt tuple has the original finite projections | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-from-profinite-limit-to-profinite-limit` — Reconstruction recovers every original full-Witt unit tuple | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-to-profinite-limit-from-profinite-limit` — The reconstructed tuple recovers every original compatible family | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-profinite-equiv` — The actual full-Witt Cartan group is the native profinite limit | §4.9 family cases | Target under the family hypotheses. |
| `kubert-profinite-cartan-profinite-equiv-apply` — The limit equivalence has the original factorial coordinates | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-profinite-equiv-projection` — The limit equivalence preserves every positive finite level | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-profinite-equiv-symm-projection` — The inverse equivalence preserves every positive finite level | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-topology` — The profinite topology on the actual full-Witt Cartan group | §4.9 family cases | Target under the family hypotheses. |
| `kubert-profinite-cartan-profinite-continuous-equiv` — The actual Cartan limit comparison is a continuous group equivalence | §4.9 family cases | Target under the family hypotheses. |
| `kubert-profinite-cartan-topology-is-topological-group` — The actual Cartan topology is a topological group | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-topology-compact-space` — The actual Cartan topology is compact | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-topology-totally-disconnected-space` — The actual Cartan topology is totally disconnected | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-limit-projection-continuous` — All original finite projections of the native limit are continuous | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-witt-product-projection-continuous` — Every original full-Witt finite projection is continuous | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-topology-continuous-iff` — Continuity into the actual Cartan group is detected at all finite levels | §4.9 family cases | API under the family hypotheses. |
| `kubert-profinite-cartan-topology-t2-space` — The actual Cartan topology is Hausdorff | §4.9 family cases | API under the family hypotheses. |
| `kubert-padic-topology-cartan-padic-coordinate-norm-bound` — Original finite Cartan equality bounds the p-adic distance | §4.9 family cases | API under the family hypotheses. |
| `kubert-padic-topology-cartan-padic-coordinate-continuous` — Each original p-adic value coordinate is continuous | §4.9 family cases | API under the family hypotheses. |
| `kubert-padic-topology-cartan-degree-one-padic-units-equiv-continuous` — The actual degree-one p-adic unit comparison is continuous | §4.9 family cases | API under the family hypotheses. |
| `kubert-padic-topology-cartan-degree-one-padic-continuous-equiv` — The degree-one Cartan group is the native p-adic unit product topologically | §4.9 family cases | Target under the family hypotheses. |
| `kubert-padic-topology-cartan-degree-one-padic-continuous-equiv-apply` — The continuous comparison keeps each original prime value | §4.9 family cases | API under the family hypotheses. |
| `kubert-padic-topology-cartan-degree-one-padic-continuous-equiv-finite-eq-iff` — The continuous comparison retains the original finite Cartan fibers | §4.9 family cases | API under the family hypotheses. |
| `kubert-padic-topology-cartan-degree-one-topology-eq-induced` — The Cartan topology agrees with the native p-adic product topology | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-finite-cartan-degree-one-residue` — The original full-Witt Cartan residue modulo N | §4.9 family cases | Target under the family hypotheses. |
| `kubert-degree-one-finite-cartan-degree-one-residue-crt` — The residue retains each original CRT coordinate | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-finite-cartan-degree-one-residue-eq-iff` — Residue equality is exactly original Cartan projection equality | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-finite-cartan-degree-one-residue-surjective` — Every residue unit comes from the original full-Witt product | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-finite-cartan-degree-one-residue-ker` — The two actual Cartan residue kernels agree | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-finite-cartan-degree-one-finite-equiv` — The actual finite degree-one Cartan group is the residue unit group | §4.9 family cases | Target under the family hypotheses. |
| `kubert-degree-one-finite-cartan-degree-one-finite-equiv-projection` — Finite comparison agrees with the original full-Witt residue | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-finite-cartan-degree-one-residue-cast` — The ordinary prime-power cast equals the original p-adic residue | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-finite-cartan-degree-one-residue-reduction` — The original Cartan residue commutes with modulus reduction | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-finite-cartan-degree-one-finite-equiv-reduction` — Finite Cartan equivalences preserve all original transitions | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-primitive-cartan-primitive-circle-equiv` — Actual Cartan units correspond to primitive rational-circle points | §4.9 family cases | Target under the family hypotheses. |
| `kubert-degree-one-primitive-cartan-primitive-circle-equiv-coe` — The primitive point has its original residue numerator | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-primitive-cartan-primitive-circle-equiv-int-cast` — Every integer representative gives the same actual primitive point | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-primitive-cartan-primitive-circle-equiv-one` — The Cartan identity gives the source distinguished circle point | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-primitive-cartan-primitive-circle-equiv-reduction` — Actual primitive-point coordinates preserve all Cartan reductions | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-primitive-cartan-primitive-coefficient-equiv` — Actual Cartan group-ring coefficients identify with primitive-point coefficients | §4.9 family cases | Target under the family hypotheses. |
| `kubert-degree-one-primitive-cartan-primitive-coefficient-equiv-apply` — Primitive coefficients retain the original Cartan coefficient | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-primitive-cartan-primitive-coefficient-equiv-single` — Original Cartan basis vectors become the actual primitive-point basis vectors | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-primitive-cartan-primitive-coefficient-equiv-norm` — The actual Cartan norm is primitive full-lift transfer in degree one | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-level-equiv` — The actual degree-one Cartan action on circle torsion | §4.9 family cases | Target under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-level-equiv-int-cast-coe` — Integer representatives give the actual scalar action on level points | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-level-equiv-one` — The Cartan identity acts identically on the entire torsion subgroup | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-level-equiv-mul` — Cartan multiplication composes the actual level actions | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-level-equiv-inv` — The inverse Cartan unit gives the inverse level action | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-primitive-equiv` — The actual Cartan permutation of primitive circle points | §4.9 family cases | Target under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-primitive-equiv-int-cast-coe` — The primitive action retains its original integer scalar | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-primitive-equiv-one` — The Cartan identity fixes every actual primitive point | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-primitive-equiv-mul` — Multiplication composes the actual primitive permutations | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-primitive-equiv-inv` — Inverse units act by inverse primitive permutations | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-primitive-equiv-coordinates` — The actual primitive action is Cartan multiplication in the established coordinates | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-primitive-equiv-exists-unique` — The actual degree-one Cartan action is simply transitive | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-primitive-equiv-reduction` — Primitive reduction commutes with the actual Cartan action | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-action-cartan-circle-level-equiv-restriction` — Cartan actions restrict to the same smaller-level ambient point | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-value-cartan-primitive-coefficient-equiv-left-regular` — The original Cartan coefficient comparison respects the actual primitive action | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-value-cartan-circle-value` — The finite degree-one Cartan-valued map | §4.9 family cases | Target under the family hypotheses. |
| `kubert-degree-one-value-cartan-circle-value-coeff` — Finite Cartan values use the inverse scalar in every coefficient | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-value-cartan-circle-value-restriction` — Finite Cartan values agree under every full-lift norm | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-value-cartan-circle-value-action` — Finite Cartan values intertwine the actual point action and native left regular action | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-value-cartan-circle-value-primitive-coeff` — Values at primitive points retain the original Cartan multiplication coordinates | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-value-cartan-circle-value-zero` — The zero-point value retains phi at zero in every coefficient | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-value-cartan-circle-value-sum` — The actual finite values equal the printed inverse-basis sum | §4.9 family cases | API under the family hypotheses. |
| `kubert-degree-one-value-cartan-circle-value-level-one` — The level-one value is its surviving Cartan identity basis | §4.9 family cases | API under the family hypotheses. |
| `kubert-all-root-root-mem-level` — Every ambient root of a smaller-level point lies in the larger kernel | §4.9 family cases | API under the family hypotheses. |
| `kubert-all-root-level-root-equiv` — Ambient division roots equal the actual larger-kernel roots | §4.9 family cases | Target under the family hypotheses. |
| `kubert-all-root-level-root-equiv-coe` — The root inclusion retains every ambient point | §4.9 family cases | API under the family hypotheses. |
| `kubert-all-root-level-root-equiv-symm-coe` — The inverse root comparison only forgets kernel membership | §4.9 family cases | API under the family hypotheses. |
| `kubert-all-root-cartan-circle-level-equiv-inclusion` — Cartan action commutes with the actual torsion-kernel inclusion | §4.9 family cases | API under the family hypotheses. |
| `kubert-all-root-cartan-circle-root-equiv` — The actual Cartan action bijects entire ambient division fibers | §4.9 family cases | Target under the family hypotheses. |
| `kubert-all-root-cartan-circle-root-equiv-coe` — The all-root bijection uses the original forward point action | §4.9 family cases | API under the family hypotheses. |
| `kubert-all-root-cartan-circle-root-equiv-symm-coe` — The inverse all-root bijection uses the actual inverse automorphism | §4.9 family cases | API under the family hypotheses. |
| `kubert-all-root-cartan-circle-root-equiv-int-cast-coe` — The all-root action retains every integer scalar representative | §4.9 family cases | API under the family hypotheses. |
| `kubert-all-root-cartan-circle-root-equiv-sum` — Finite sums transport across the entire Cartan root bijection | §4.9 family cases | API under the family hypotheses. |
| `kubert-all-root-cartan-circle-value-root-sum` — Finite Cartan values satisfy the degree-one ordinary root law | §4.9 family cases | API under the family hypotheses. |
| `kubert-direct-limit-cartan-factorial-norm` — Original Cartan norms along the factorial tower | §4.9 family cases | Target under the family hypotheses. |
| `kubert-direct-limit-cartan-factorial-system` — The original factorial norms form a native directed system | §4.9 family cases | API under the family hypotheses. |
| `kubert-direct-limit-cartan-limit-module` — The actual Cartan module direct limit | §4.9 family cases | Target under the family hypotheses. |
| `kubert-direct-limit-cartan-factorial-of` — Native insertion of a factorial Cartan level | §4.9 family cases | Target under the family hypotheses. |
| `kubert-direct-limit-cartan-limit-of` — Faithful all-level Cartan maps into the actual limit | §4.9 family cases | Target under the family hypotheses. |
| `kubert-direct-limit-cartan-limit-of-norm` — All-level injections identify original norm transitions | §4.9 family cases | API under the family hypotheses. |
| `kubert-direct-limit-cartan-limit-of-factorial` — The all-level map recovers each native factorial insertion | §4.9 family cases | API under the family hypotheses. |
| `kubert-direct-limit-cartan-limit-of-injective` — Every original finite Cartan level embeds in the actual limit | §4.9 family cases | API under the family hypotheses. |
| `kubert-direct-limit-cartan-limit-exists-of` — Every actual limit element has a finite Cartan representative | §4.9 family cases | API under the family hypotheses. |
| `kubert-direct-limit-cartan-limit-lift` — Extension of a compatible family from all original Cartan levels | §4.9 family cases | Target under the family hypotheses. |
| `kubert-direct-limit-cartan-limit-lift-of` — The lifted map evaluates by the original finite-level map | §4.9 family cases | API under the family hypotheses. |
| `kubert-direct-limit-cartan-limit-hom-ext` — All original Cartan levels determine a map out of the limit | §4.9 family cases | API under the family hypotheses. |
| `kubert-direct-limit-cartan-limit-lift-unique` — A compatible all-level family has at most one extension | §4.9 family cases | API under the family hypotheses. |
| `kubert-direct-limit-cartan-limit-lift-exists-unique` — The actual Cartan limit satisfies the all-level universal property | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-cartan-circle-order-pos` — Every rational-circle point has positive additive order | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-cartan-cartan-global-value` — The actual global degree-one Cartan value | §4.9 family cases | Target under the family hypotheses. |
| `kubert-global-cartan-cartan-global-value-level` — Every containing finite level computes the same global value | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-cartan-cartan-global-value-zero` — The global value retains the scalar value at the zero point | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-cartan-cartan-global-value-root-sum-of-dvd` — The global value satisfies the root law across divisor levels | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-cartan-cartan-global-value-root-sum` — The global Cartan value is ordinary for every allowed multiplier | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-cartan-cartan-distribution` — The actual Cartan-valued universal ordinary distribution map | §4.9 family cases | Target under the family hypotheses. |
| `kubert-global-cartan-cartan-distribution-of` — The quotient map sends each actual generator to its global Cartan value | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-cartan-cartan-distribution-level` — Finite Cartan values compute the actual quotient map | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-cartan-cartan-distribution-unique` — The constructed point values uniquely determine the quotient map | §4.9 family cases | API under the family hypotheses. |
| `kubert-limit-action-cartan-limit-operator` — The actual common Cartan operator on the module limit | §4.9 family cases | Target under the family hypotheses. |
| `kubert-limit-action-cartan-limit-operator-of` — The limit operator retains the original finite action | §4.9 family cases | API under the family hypotheses. |
| `kubert-limit-action-cartan-limit-operator-one` — The identity Cartan operator fixes the whole limit | §4.9 family cases | API under the family hypotheses. |
| `kubert-limit-action-cartan-limit-operator-mul` — Cartan multiplication composes the actual limit operators | §4.9 family cases | API under the family hypotheses. |
| `kubert-limit-action-cartan-limit-representation` — The native Cartan representation on the actual module limit | §4.9 family cases | Target under the family hypotheses. |
| `kubert-limit-action-cartan-limit-representation-of` — The limit representation agrees with every original finite representation | §4.9 family cases | API under the family hypotheses. |
| `kubert-limit-action-cartan-limit-representation-inverse` — Inverse Cartan action recovers every actual limit element | §4.9 family cases | API under the family hypotheses. |
| `kubert-limit-action-cartan-limit-representation-unique` — The original finite actions uniquely determine the limit representation | §4.9 family cases | API under the family hypotheses. |
| `kubert-limit-action-cartan-limit-intertwining` — Faithful finite-level intertwining inclusions into the limit | §4.9 family cases | Target under the family hypotheses. |
| `kubert-limit-action-cartan-limit-intertwining-to-linear-map` — The intertwining inclusion retains its original linear map | §4.9 family cases | API under the family hypotheses. |
| `kubert-limit-action-cartan-limit-intertwining-injective` — Each finite-level intertwining inclusion is injective | §4.9 family cases | API under the family hypotheses. |
| `kubert-limit-action-cartan-limit-intertwining-comp` — Original norm intertwiners compose with the same limit inclusion | §4.9 family cases | API under the family hypotheses. |
| `kubert-limit-action-cartan-limit-representation-level-one` — The embedded level-one module is fixed by the entire Cartan group | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-action-cartan-global-point` — The actual common Cartan action on rational-circle points | §4.9 family cases | Target under the family hypotheses. |
| `kubert-global-action-cartan-global-point-level` — Every containing level computes the same global point action | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-action-cartan-global-point-zero` — Every common Cartan element fixes the actual zero point | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-action-cartan-global-point-add` — The global point action preserves actual circle addition | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-action-cartan-global-point-one` — The identity common Cartan element fixes every circle point | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-action-cartan-global-point-mul` — Common Cartan multiplication composes the global point actions | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-action-cartan-global-point-inverse` — Inverse common Cartan action recovers every original point | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-action-cartan-global-circle-equiv` — The actual global Cartan additive automorphism of the rational circle | §4.9 family cases | Target under the family hypotheses. |
| `kubert-global-action-cartan-global-circle-equiv-apply` — The global additive equivalence retains the original point map | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-action-cartan-global-circle-equiv-symm` — The inverse global equivalence is the inverse-unit action | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-action-cartan-global-circle-equiv-one` — The identity global Cartan equivalence is the actual identity | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-action-cartan-global-circle-equiv-mul` — The global Cartan equivalences satisfy the group action law | §4.9 family cases | API under the family hypotheses. |
| `kubert-global-action-cartan-global-value-equivariant` — The global Cartan value intertwines the actual point and module actions | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-root-equiv` — Additive equivalences transport every actual root fiber | §4.9 family cases | Target under the family hypotheses. |
| `kubert-quotient-action-root-equiv-coe` — Forward root transport is the original additive equivalence | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-root-equiv-symm-coe` — Inverse root transport is the inverse additive equivalence | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-root-equiv-sum` — The complete transported root sum is unchanged by reindexing | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-relation-map-equiv` — Free-group transport preserves the exact weighted relator | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-quotient-hom` — The actual weighted distribution quotient transport homomorphism | §4.9 family cases | Target under the family hypotheses. |
| `kubert-quotient-action-quotient-hom-of` — Quotient transport evaluates on every original point class | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-quotient-hom-refl` — Identity point transport gives the identity quotient homomorphism | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-quotient-hom-trans` — Quotient homomorphism transport respects ordered composition | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-quotient-equiv` — The actual weighted distribution quotient additive equivalence | §4.9 family cases | Target under the family hypotheses. |
| `kubert-quotient-action-quotient-equiv-of` — Quotient additive equivalence retains point-class evaluation | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-quotient-equiv-symm` — Inverse quotient equivalence comes from inverse point transport | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-quotient-equiv-refl` — Identity point equivalence gives the identity quotient equivalence | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-quotient-equiv-trans` — Quotient equivalences respect ordered point composition | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-cartan-quotient-equiv` — The actual common Cartan action on the distribution quotient | §4.9 family cases | Target under the family hypotheses. |
| `kubert-quotient-action-cartan-quotient-equiv-of` — Cartan quotient action carries the original point labels | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-cartan-quotient-equiv-one` — The identity Cartan element fixes the entire quotient | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-cartan-quotient-equiv-mul` — Cartan multiplication composes the actual quotient actions | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-cartan-quotient-equiv-symm` — Inverse Cartan quotient action is the inverse-unit action | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-cartan-distribution-intertwines` — The ordinary Cartan quotient map intertwines the two actual actions | §4.9 family cases | API under the family hypotheses. |
| `kubert-quotient-action-cartan-distribution-equivariant` — Every actual quotient element obeys Cartan equivariance | §4.9 family cases | API under the family hypotheses. |
| `kubert-parity-operators-quotient-negation` — The actual point-negation equivalence of the weighted quotient | §4.12 family cases | Target under the family hypotheses. |
| `kubert-parity-operators-quotient-negation-of` — Point negation changes the original generator label | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-operators-quotient-negation-involutive` — Point negation is an actual involution on every quotient element | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-operators-quotient-negation-zero-point` — The generator labelled zero is fixed by point negation | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-operators-quotient-negation-natural` — Point negation commutes with actual quotient transport | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-operators-parity-operator` — The actual integral parity relation endomorphism | §4.12 family cases | Target under the family hypotheses. |
| `kubert-parity-operators-parity-operator-apply` — The parity endomorphism retains its exact integral formula | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-operators-parity-operator-of` — The parity endomorphism evaluates to the original point relator | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-operators-parity-quotient-action` — The existing parity quotient realizes the prescribed sign action | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-operators-parity-operator-range` — The existing parity subgroup is exactly the actual operator range | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-operators-parity-le-ker-iff-all` — The parity factorization condition holds on every quotient element | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-operators-parity-operator-even-after-odd` — The even operator annihilates the odd operator image | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-operators-parity-operator-odd-after-even` — The odd operator annihilates the even operator image | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-operators-parity-operator-odd-range-le-even-ker` — The actual odd image lies in the actual even kernel | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-operators-parity-operator-even-range-le-odd-ker` — The actual even image lies in the actual odd kernel | §4.12 family cases | API under the family hypotheses. |
| `kubert-sign-representation-sign-representation` — The actual integral order-two point-action representation | §4.12 family cases | Target under the family hypotheses. |
| `kubert-sign-representation-sign-representation-one-apply` — The native identity acts as the actual identity map | §4.12 family cases | API under the family hypotheses. |
| `kubert-sign-representation-sign-representation-generator` — The actual order-two generator acts by point negation | §4.12 family cases | API under the family hypotheses. |
| `kubert-sign-representation-sign-group-cases` — The actual acting group has precisely its two named elements | §4.12 family cases | API under the family hypotheses. |
| `kubert-sign-representation-sign-group-generator` — The named residue1 generates the actual order-two group | §4.12 family cases | API under the family hypotheses. |
| `kubert-sign-representation-sign-representation-generator-of` — The generator action retains the actual point-label formula | §4.12 family cases | API under the family hypotheses. |
| `kubert-sign-representation-sign-representation-norm-apply` — The actual native group norm is the full two-term sum | §4.12 family cases | API under the family hypotheses. |
| `kubert-sign-representation-sign-representation-norm-operator` — The native group norm is the original odd relation operator | §4.12 family cases | API under the family hypotheses. |
| `kubert-sign-representation-sign-representation-difference-operator` — The generator difference is the original even relation operator | §4.12 family cases | API under the family hypotheses. |
| `kubert-sign-representation-sign-representation-unique` — The actual point involution determines the native representation uniquely | §4.12 family cases | API under the family hypotheses. |
| `kubert-sign-representation-sign-intertwining` — The actual natural intertwiner of point-action representations | §4.12 family cases | Target under the family hypotheses. |
| `kubert-sign-representation-sign-intertwining-to-linear-map` — The native intertwiner retains the original quotient map | §4.12 family cases | API under the family hypotheses. |
| `kubert-sign-representation-sign-intertwining-bijective` — Every natural point-action intertwiner is bijective | §4.12 family cases | API under the family hypotheses. |
| `kubert-sign-representation-sign-intertwining-refl` — Identity point transport gives the identity native intertwiner | §4.12 family cases | API under the family hypotheses. |
| `kubert-sign-representation-sign-intertwining-trans` — The natural intertwiners respect ordered point composition | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-low-degree-sign-invariants-iff` — Invariants of the actual point representation are fixed elements | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-low-degree-sign-invariants-eq-even-kernel` — The native invariant submodule is the actual even kernel | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-low-degree-sign-norm-kernel-iff` — The actual norm kernel consists of anti-invariant elements | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-low-degree-sign-coinvariants-eq-even-range` — The native augmentation submodule is the actual even image | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-low-degree-sign-tate-zero-equiv` — The concrete degree-zero Tate comparison | §4.12 family cases | Target under the family hypotheses. |
| `kubert-tate-low-degree-sign-tate-zero-class` — Actual representatives in degree-zero Tate cohomology | §4.12 family cases | Target under the family hypotheses. |
| `kubert-tate-low-degree-sign-tate-zero-equiv-class` — The degree-zero comparison evaluates on representatives | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-low-degree-sign-tate-zero-class-eq-zero-iff` — Zero criterion for degree-zero representatives | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-low-degree-sign-tate-zero-class-eq-iff` — Equality criterion for degree-zero representatives | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-low-degree-sign-tate-zero-class-surjective` — Every degree-zero Tate class has an actual representative | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-low-degree-sign-tate-neg-one-equiv` — The concrete degree-minus-one Tate comparison | §4.12 family cases | Target under the family hypotheses. |
| `kubert-tate-low-degree-sign-tate-neg-one-class` — Actual representatives in degree-minus-one Tate cohomology | §4.12 family cases | Target under the family hypotheses. |
| `kubert-tate-low-degree-sign-tate-neg-one-equiv-class` — The degree-minus-one comparison evaluates on representatives | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-low-degree-sign-tate-neg-one-class-eq-zero-iff` — Zero criterion for degree-minus-one representatives | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-low-degree-sign-tate-neg-one-class-eq-iff` — Equality criterion for degree-minus-one representatives | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-low-degree-sign-tate-neg-one-class-surjective` — Every degree-minus-one Tate class has an actual representative | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-zero-to-parity` — The actual degree-zero Tate embedding into the odd quotient | §4.12 family cases | Target under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-zero-to-parity-class` — The degree-zero embedding retains its representative | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-zero-to-parity-injective` — The degree-zero map into the original quotient is injective | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-zero-to-parity-range` — Exact image criterion for the degree-zero embedding | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-zero-class-two-nsmul` — Every degree-zero representative class is killed by two | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-zero-two-nsmul` — The actual degree-zero Tate group is annihilated by two | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-zero-to-parity-two-nsmul` — The degree-zero image is two-torsion in the original quotient | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-neg-one-to-parity` — The actual degree-minus-one Tate embedding into the even quotient | §4.12 family cases | Target under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-neg-one-to-parity-class` — The degree-minus-one embedding retains its representative | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-neg-one-to-parity-injective` — The degree-minus-one map into the original quotient is injective | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-neg-one-to-parity-range` — Exact image criterion for the degree-minus-one embedding | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-neg-one-class-two-nsmul` — Every degree-minus-one representative class is killed by two | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-neg-one-two-nsmul` — The actual degree-minus-one Tate group is annihilated by two | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-neg-one-to-parity-two-nsmul` — The degree-minus-one image is two-torsion in the original quotient | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-zero-class-ordinary-zero-ne-zero` — The ordinary fixed-generator Tate class is nonzero | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-parity-embedding-sign-tate-zero-ordinary-nontrivial` — The actual ordinary degree-zero Tate group is nontrivial | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-odd-parity-descent` — The actual odd parity descent operator | §4.12 family cases | Target under the family hypotheses. |
| `kubert-parity-descent-odd-parity-descent-of` — The odd descent evaluates on every original representative | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-odd-parity-descent-point` — The odd descent retains the point-label formula | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-odd-parity-descent-tate` — The odd descent kills the actual Tate image | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-odd-parity-descent-kernel` — The odd descent kernel is exactly the native Tate image | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-odd-parity-descent-range` — The odd descent image is the original operator image | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-odd-parity-descent-unique` — The original representative formula determines odd descent | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-odd-parity-descent-torsion-mem-tate-range` — Torsion in the odd quotient lies in the Tate image under the source premise | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-even-parity-descent` — The actual even parity descent operator | §4.12 family cases | Target under the family hypotheses. |
| `kubert-parity-descent-even-parity-descent-of` — The even descent evaluates on every original representative | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-even-parity-descent-point` — The even descent retains the point-label formula | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-even-parity-descent-tate` — The even descent kills the actual Tate image | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-even-parity-descent-kernel` — The even descent kernel is exactly the native Tate image | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-even-parity-descent-range` — The even descent image is the original operator image | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-even-parity-descent-unique` — The original representative formula determines even descent | §4.12 family cases | API under the family hypotheses. |
| `kubert-parity-descent-even-parity-descent-torsion-mem-tate-range` — Torsion in the even quotient lies in the Tate image under the source premise | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-zero-range-eq-torsion` — The actual odd torsion submodule is the Tate image | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-zero-torsion-equiv` — The actual integral degree-zero torsion equivalence | §4.12 family cases | Target under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-zero-torsion-equiv-coe` — The integral degree-zero comparison retains the source map | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-zero-torsion-equiv-class` — The integral degree-zero comparison retains representatives | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-zero-torsion-equiv-symm-coe` — The inverse integral degree-zero comparison recovers the torsion element | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-odd-parity-torsion-two-nsmul` — The actual odd torsion subgroup is annihilated by two | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-zero-torsion-z-mod-equiv` — The actual binary-field degree-zero torsion equivalence | §4.12 family cases | Target under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-zero-torsion-z-mod-equiv-coe` — The binary-field degree-zero comparison retains the source map | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-zero-torsion-z-mod-equiv-class` — The binary-field degree-zero comparison retains representatives | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-zero-torsion-z-mod-equiv-symm-coe` — The inverse binary-field degree-zero comparison recovers torsion | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-neg-one-range-eq-torsion` — The actual even torsion submodule is the Tate image | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-neg-one-torsion-equiv` — The actual integral degree-minus-one torsion equivalence | §4.12 family cases | Target under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-neg-one-torsion-equiv-coe` — The integral degree-minus-one comparison retains the source map | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-neg-one-torsion-equiv-class` — The integral degree-minus-one comparison retains representatives | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-neg-one-torsion-equiv-symm-coe` — The inverse integral degree-minus-one comparison recovers the torsion element | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-even-parity-torsion-two-nsmul` — The actual even torsion subgroup is annihilated by two | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-neg-one-torsion-z-mod-equiv` — The actual binary-field degree-minus-one torsion equivalence | §4.12 family cases | Target under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-neg-one-torsion-z-mod-equiv-coe` — The binary-field degree-minus-one comparison retains the source map | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-neg-one-torsion-z-mod-equiv-class` — The binary-field degree-minus-one comparison retains representatives | §4.12 family cases | API under the family hypotheses. |
| `kubert-torsion-comparison-sign-tate-neg-one-torsion-z-mod-equiv-symm-coe` — The inverse binary-field degree-minus-one comparison recovers torsion | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-neg-one-equiv` — Ordinary degree one and negative Tate for point negation | §4.12 family cases | Target under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-class` — Ordinary degree-one classes of norm-kernel representatives | §4.12 family cases | Target under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-neg-one-equiv-class` — Periodicity preserves the transported representative | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-class-eq-zero-iff` — Vanishing of the ordinary degree-one representative | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-class-eq-iff` — Equality of ordinary degree-one representatives | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-class-surjective` — Every ordinary degree-one class has a norm-kernel representative | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-two-nsmul` — Ordinary degree one is annihilated by two | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-neg-one-equiv-surjective` — Every negative Tate class comes from ordinary degree one | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-torsion-equiv` — The integral ordinary degree-one torsion comparison | §4.12 family cases | Target under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-torsion-equiv-coe` — The ordinary integral comparison retains the original even map | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-torsion-equiv-class` — The ordinary integral comparison preserves original representatives | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-torsion-equiv-symm-coe` — The integral inverse recovers every original even torsion element | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-torsion-z-mod-equiv` — The binary-field ordinary degree-one torsion comparison | §4.12 family cases | Target under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-torsion-z-mod-equiv-coe` — The ordinary field comparison retains the original even map | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-torsion-z-mod-equiv-class` — The ordinary field comparison preserves original representatives | §4.12 family cases | API under the family hypotheses. |
| `kubert-tate-periodicity-sign-group-h1-torsion-z-mod-equiv-symm-coe` — The field inverse recovers original even torsion | §4.12 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-rational-primitive-sum` — The actual rational primitive-fiber sum | §4.11 family cases | Target under the family hypotheses. |
| `kubert-rational-fiber-rational-primitive-sum-apply` — Coefficients of the actual primitive-fiber sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-rational-primitive-sum-nonzero` — The actual primitive-fiber sum is nonzero | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-rational-primitive-sum-zero` — The zero point has every primitive lift | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-rational-primitive-sum-primitive` — A primitive point has a singleton primitive fiber | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-rational-primitive-sum-transition` — Primitive-fiber sums respect actual level transitions | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-rational-primitive-sum-support` — Support is exactly the actual primitive fiber | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-rational-primitive-sum-exists` — Every point has an actual primitive lift at the containing level | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-rational-primitive-sum-sum` — The primitive-fiber element is the full basis sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-rational-primitive-sum-mass` — The primitive-fiber mass is its actual cardinality | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-rational-primitive-sum-equivariant` — Primitive-fiber sums respect actual torus automorphisms | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-cartan-rational-primitive-sum` — The actual Cartan primitive-fiber element | §4.11 family cases | Target under the family hypotheses. |
| `kubert-rational-fiber-cartan-rational-primitive-sum-coordinates` — Cartan coordinates recover the actual primitive sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-cartan-rational-primitive-sum-coeff` — Actual unit coefficients detect the original primitive fiber | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-cartan-rational-primitive-sum-nonzero` — The Cartan primitive-fiber element is nonzero | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-cartan-rational-primitive-sum-zero` — The zero point has coefficient one at every Cartan unit | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-cartan-rational-primitive-sum-primitive` — A primitive Cartan point gives its actual unit basis vector | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-fiber-cartan-rational-primitive-sum-norm` — Actual Cartan norms preserve primitive-fiber elements | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-cartan-primary-unit-equiv` — Primary unit coordinates on the original Cartan carrier | §4.11 family cases | Target under the family hypotheses. |
| `kubert-rational-factors-rational-prime-translation` — The actual prime-local translating unit | §4.11 family cases | Target under the family hypotheses. |
| `kubert-rational-factors-rational-prime-translation-same` — The translating unit is identity at its own prime | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-prime-translation-other` — Off-prime coordinates invert the original prime | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-prime-kernel` — The subgroup supported at one prime | §4.11 family cases | Target under the family hypotheses. |
| `kubert-rational-factors-rational-prime-kernel-mem` — Membership in the prime-supported subgroup | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-prime-coset` — The source local coset on actual Cartan units | §4.11 family cases | Target under the family hypotheses. |
| `kubert-rational-factors-rational-prime-translation-mem` — The constructed translating unit lies in the source coset | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-prime-translation-inv-other` — The inverse translating unit has off-prime value p | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-prime-coset-iff-kernel` — The source coset is a translate of the actual local kernel | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-prime-coset-eq-image` — The source coset is the translated subgroup as a set | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-prime-coset-card-pos` — The actual source coset has positive cardinality | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-prime-coset-sum` — The full rational sum over the actual local coset | §4.11 family cases | Target under the family hypotheses. |
| `kubert-rational-factors-rational-prime-coset-sum-coeff` — Coefficients of the actual local coset sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-prime-coset-sum-nonzero` — The unnormalized local coset sum is nonzero | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-prime-factor` — The normalized local rational correction factor | §4.11 family cases | Target under the family hypotheses. |
| `kubert-rational-factors-rational-prime-factor-complement` — The correction factor and coset average sum to one | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-prime-factor-normalization` — Clearing the genuine coset denominator | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-prime-factor-coeff` — Exact coefficients of the local correction factor | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-cartan-value` — The corrected rational Cartan value | §4.11 family cases | Target under the family hypotheses. |
| `kubert-rational-factors-rational-cartan-value-zero` — The rational value at zero keeps the full primitive sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-cartan-value-primitive` — The rational value at an actual primitive Cartan point | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-factors-rational-cartan-value-level-one` — The corrected rational value has unit-level normalization | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-kernel-sum` — The full rational sum over the actual local kernel | §4.11 family cases | Target under the family hypotheses. |
| `kubert-local-lattice-rational-prime-kernel-sum-coeff` — Coefficients of the local kernel sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-kernel-sum-one` — The kernel sum has identity coefficient one | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-kernel-sum-nonzero` — The actual local kernel sum is nonzero | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-coset-sum-translation` — The coset sum is the constructed translate of the kernel sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-kernel-sum-translation-inverse` — The inverse translation recovers the kernel sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-local-lattice` — The actual local integral Cartan lattice | §4.11 family cases | Target under the family hypotheses. |
| `kubert-local-lattice-rational-prime-local-lattice-kernel-basis` — Every kernel-basis translate belongs to the local lattice | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-local-lattice-factor-basis` — Every correction-factor translate belongs to the local lattice | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-local-lattice-kernel` — The original kernel sum belongs to the local lattice | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-local-lattice-factor` — The correction factor belongs to the integral local lattice | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-local-lattice-coset` — The full source coset sum belongs to the integral local lattice | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-local-lattice-basis-mul` — The integral lattice is stable under every actual unit basis action | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-local-lattice-le-iff` — The universal containment criterion for the local lattice | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-local-basis-decomposition` — An explicit rational decomposition of each Cartan basis vector | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-local-lattice-span-basis` — Every original unit basis vector lies in the rational span | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-local-lattice-rational-span` — Each actual local integral lattice spans the rational Cartan group ring | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-cartan-primitive-point-nsmul` — Original primitive points are the actual residue multiples of the identity point | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-cartan-primitive-point-nsmul-eq-iff` — Primitive-point multiplication is detected in the actual residue ring | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-kernel-smul-iff` — The prime-power primitive fiber condition is actual kernel membership | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-point` — The actual source point for a prime-local lattice | §4.11 family cases | Target under the family hypotheses. |
| `kubert-local-lattice-rational-prime-point-coe` — The local source point keeps the original torus value | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-point-fraction` — The local source point is the specified rational fraction | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-point-order` — The local source point has the complementary additive order | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-point-fiber` — The original primitive fiber at the local source point is the kernel | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-kernel-sum-primitive-fiber` — The kernel sum is the source primitive-fiber sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-local-lattice-integral-mul` — The local lattice is stable under the original integral group ring | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-lattice-rational-prime-local-lattice-source-membership` — The actual local lattice has the source two-generator description | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-projection-single` — The full norm intertwines actual basis multiplication | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-projection` — The actual full-fiber projection formula | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-kernel-card-pos` — The actual Cartan reduction kernel has positive cardinality | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-fiber-card` — Every actual Cartan reduction fiber has kernel cardinality | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-fiber-finset-card` — The full finite lift set has the actual kernel cardinality | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-push-single` — Pushing a full basis norm back counts every lift | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-push` — The actual norm and pushforward compose to kernel multiplicity | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-mul` — Full-fiber norm multiplication carries the actual kernel factor | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-one-coeff` — The full norm of one is the actual kernel indicator | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-one-mul` — The full kernel sum acts by kernel multiplicity on the norm image | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-card-mul` — Actual Cartan group cardinalities satisfy the kernel product formula | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-card-ratio` — The source rational cardinality ratio is the inverse kernel cardinality | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-mul-inverse-card` — The rational full norm obeys the normalized multiplication formula | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-rational-mul` — Kubert’s exact full-fiber norm product formula | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-normalized-one-action` — The normalized kernel sum is identity on the actual norm image | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-normalized-one-idempotent` — The normalized original kernel sum is idempotent | §4.11 family cases | API under the family hypotheses. |
| `kubert-rational-norm-cartan-product-norm-normalized-one-nonzero` — The normalized original kernel sum is nonzero | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-cartan-primary-unit-equiv-cast` — Primary coordinates are the original residue casts | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-cartan-primary-unit-equiv-reduction` — Actual primary coordinates commute with level reduction | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-rational-prime-translation-reduction` — The constructed local translations commute with reduction | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-rational-prime-kernel-reduction-mem` — Actual reduction preserves prime-supported kernel membership | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-rational-prime-kernel-reduction-surjective` — Every original local kernel element has an actual local lift | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-rational-prime-kernel-map` — The native image of the upper local kernel is exactly the lower one | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-rational-prime-coset-reduction-mem` — Original source-coset membership survives reduction | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-rational-prime-coset-reduction-surjective` — Every lower source-coset element has an actual upper coset lift | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-rational-prime-coset-image` — The full upper source coset maps onto the lower one | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-rational-prime-coset-card` — The actual translated source coset has local-kernel cardinality | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-restricted-prime-kernel-reduction` — The original Cartan reduction restricted to local kernels | §4.11 family cases | Target under the family hypotheses. |
| `kubert-factor-transition-restricted-prime-kernel-reduction-apply` — Restricted reduction has the original underlying value | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-restricted-prime-kernel-reduction-surjective` — The actual restricted kernel reduction is surjective | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-restricted-prime-kernel-reduction-mem-ker` — The restricted kernel is the actual intersection condition | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-restricted-prime-kernel-reduction-kernel-card-pos` — The actual restricted reduction kernel has positive cardinality | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-restricted-prime-kernel-reduction-fiber-card` — Every actual restricted-kernel fiber has cardinality d_p | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-restricted-prime-kernel-reduction-card-mul` — Local subgroup cardinalities satisfy the actual kernel product law | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-rational-prime-coset-card-mul` — Source-coset sizes have the restricted multiplicity | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-rational-prime-coset-fiber-card` — Every actual source-coset fiber has the restricted cardinality | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-transition-rational-prime-coset-card-ratio` — The source local cardinality ratio is the inverse restricted multiplicity | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-coset-sum-eq-sum` — The original source-coset indicator is its full basis sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-coset-fiber-finset-card` — The complete finite source-coset lift set has cardinality d_p | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-coset-sum-push-coeff` — Coset-sum pushforward coefficients count the actual local fibers | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-coset-sum-push` — The original coset-sum pushforward has local multiplicity | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-coset-inverse-card-mul` — Normalization cancels the actual local fiber multiplicity | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-factor-push` — The genuine local correction factors push forward exactly | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-coset-sum-norm-inverse-card` — The local coset-sum norm uses the inverse restricted cardinality | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-coset-sum-norm` — Kubert’s exact local source-coset norm formula | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-factor-norm` — A local correction factor gains the full norm of one | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-factor-norm-mul` — The original norm intertwines actual correction-factor multiplication | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-factor-prod-push` — Finite products of genuine local factors push forward exactly | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-factor-prod-norm-mul` — The full norm intertwines the actual finite correction product | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-factor-order-product` — The actual order-prime product is independent of extra level primes | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-prime-factor-order-product-push` — The full actual order correction product pushes to the lower one | §4.11 family cases | API under the family hypotheses. |
| `kubert-factor-norm-rational-cartan-value-norm` — The original corrected rational values commute with full norms | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-root-fiber-cartan-rational-primitive-sum-eq-sum` — The original primitive-fiber sum is its complete Cartan basis sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-root-fiber-rational-cartan-value-primitive-fiber-sum` — Corrected primitive values sum to the raw fiber times all local factors | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-root-fiber-rational-cartan-value-same-prime-support` — Unchanged prime support selects every original correction factor | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-root-fiber-rational-cartan-value-same-support-primitive-sum` — The complete primitive fiber gives the corrected value at unchanged support | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-root-fiber-cartan-same-support-root-equiv` — Actual Cartan labels parametrize the entire root fiber at unchanged support | §4.11 family cases | Target under the family hypotheses. |
| `kubert-prime-root-fiber-cartan-same-support-root-equiv-coe` — The root equivalence preserves the original primitive point | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-root-fiber-cartan-same-support-root-equiv-symm-coe` — The inverse root equivalence recovers the given actual point | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-root-fiber-cartan-same-support-root-equiv-mem-level` — Every root in the unchanged-support comparison is an original level point | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-root-fiber-rational-cartan-value-same-support-root-sum` — The sum over the entire unchanged-support root set is the corrected target | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-root-fiber-rational-cartan-value-same-support-level-sum` — The original level-kernel root sum obeys the unchanged-support relation | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-root-fiber-rational-cartan-value-repeated-prime-support` — Multiplying a primitive point by a repeated prime preserves prime support | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-root-fiber-rational-cartan-value-repeated-prime-root-sum` — Kubert’s complete repeated-prime root relation | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-kernel-sum-eq-sum` — The actual local kernel indicator is its full basis sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-kernel-sum-translate` — Actual local kernel elements preserve the full kernel sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-kernel-sum-mul` — The unnormalized kernel square has its actual cardinality factor | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-kernel-sum-mul-coset` — Kernel/coset convolution counts the actual local coset | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-kernel-sum-mul-factor` — The genuine correction factor subtracts the full coset sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-kernel-sum-translate-mul-factor` — The local cancellation holds at every original unit translate | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-cartan-primitive-point-nsmul-pair-iff` — Scalar equality of actual primitive points is residue equality | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-cartan-primitive-point-nsmul-translate-iff` — Unit translation reduces primitive-point scalar equality to identity | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-kernel-translate-smul-iff` — Translated primary scalar fibers are actual local cosets of the kernel | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-translated-point` — Actual translated local source points | §4.11 family cases | Target under the family hypotheses. |
| `kubert-local-convolution-rational-prime-translated-point-coe` — The translated local point has its actual scalar value | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-translated-point-order` — Every translated local point has complementary order | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-translated-point-fiber` — The original primitive fiber at the translated point is u times the kernel | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-translated-point-raw-sum` — Translated kernel sums are the original raw point fibers | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-translated-point-coset-sum` — Translated coset sums are actual original point fibers | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-translated-point-one` — The identity translate recovers the existing local source point | §4.11 family cases | API under the family hypotheses. |
| `kubert-local-convolution-rational-prime-translated-point-mul-factor` — The genuine correction factor cancels two actual translated point fibers | §4.11 family cases | API under the family hypotheses. |
| `kubert-exceptional-root-rational-prime-translation-scaled-residue` — The actual CRT translation satisfies the scaled root equation | §4.11 family cases | API under the family hypotheses. |
| `kubert-exceptional-root-cartan-primitive-point-two-scalars-iff` — Two scalar multiples of actual primitive points compare in the residue ring | §4.8 family cases | API under the family hypotheses. |
| `kubert-exceptional-root-rational-prime-translated-point-root` — The original translated coset point is an actual p-root | §4.11 family cases | API under the family hypotheses. |
| `kubert-exceptional-root-rational-prime-translated-point-coprime-order` — The complementary point order is coprime to the root prime | §4.11 family cases | API under the family hypotheses. |
| `kubert-exceptional-root-rational-prime-translated-point-root-unique` — The actual exceptional root is unique in the complementary level | §4.11 family cases | API under the family hypotheses. |
| `kubert-exceptional-root-rational-prime-translated-point-root-partition` — Every actual prime root lies in the exceptional or higher-order part | §4.11 family cases | API under the family hypotheses. |
| `kubert-exceptional-root-rational-prime-translated-point-root-not-high` — The exceptional root is disjoint from the higher-order part | §4.11 family cases | API under the family hypotheses. |
| `kubert-exceptional-root-rational-prime-new-factorization` — A prime absent from the quotient occurs exactly once | §4.11 family cases | API under the family hypotheses. |
| `kubert-exceptional-root-rational-prime-new-primary-power` — The actual primary power is p in the new-prime case | §4.11 family cases | API under the family hypotheses. |
| `kubert-exceptional-root-rational-prime-translated-point-new-coe` — The new-prime target is p times the original primitive point | §4.11 family cases | API under the family hypotheses. |
| `kubert-exceptional-root-rational-prime-translated-point-new-root` — The explicit exceptional point is a root of the source target | §4.11 family cases | API under the family hypotheses. |
| `kubert-exceptional-root-rational-prime-translated-point-new-partition` — The new-prime fiber is the exceptional point plus all primitive roots | §4.11 family cases | API under the family hypotheses. |
| `kubert-new-prime-sum-rational-prime-translated-point-order-prime-iff` — The complementary point order omits exactly one prime | §4.11 family cases | API under the family hypotheses. |
| `kubert-new-prime-sum-rational-cartan-value-translated-product` — The actual translated value contains precisely the other correction factors | §4.11 family cases | API under the family hypotheses. |
| `kubert-new-prime-sum-rational-prime-factor-product-split` — The full correction product splits off the chosen prime | §4.11 family cases | API under the family hypotheses. |
| `kubert-new-prime-sum-rational-cartan-value-translated-cancellation` — Correcting the primitive contribution subtracts the actual exceptional value | §4.11 family cases | API under the family hypotheses. |
| `kubert-new-prime-sum-rational-cartan-value-primitive-level-fiber-sum` — Actual primitive point sums reindex by original Cartan labels | §4.11 family cases | API under the family hypotheses. |
| `kubert-new-prime-sum-rational-cartan-value-new-primitive-sum` — The new-prime primitive-root contribution is target minus exceptional value | §4.11 family cases | API under the family hypotheses. |
| `kubert-new-prime-sum-rational-cartan-value-new-level-partition` — The complete actual root sum includes the exceptional corrected value | §4.11 family cases | API under the family hypotheses. |
| `kubert-new-prime-sum-rational-cartan-value-new-translated-root-sum` — All new-prime roots reproduce the corrected target value | §4.11 family cases | API under the family hypotheses. |
| `kubert-new-prime-sum-rational-cartan-value-new-prime-root-sum` — The new-prime distribution identity holds at every primitive point | §4.11 family cases | API under the family hypotheses. |
| `kubert-new-prime-sum-rational-cartan-value-prime-root-sum` — The complete prime-root distribution identity holds at primitive points | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-level-reduction-rational-cartan-value-prime-exact-target-sum` — Every target of complementary order has the prime-root sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-level-reduction-rational-cartan-value-exact-root-norm-sum` — The full coefficient norm transports every exact-order root | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-level-reduction-rational-cartan-value-prime-exact-target-norm-sum` — The complementary-order prime law persists in every larger level | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-level-reduction-rational-cartan-value-prime-target-sum` — The actual target-order criterion gives every prime-root sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-level-reduction-cartan-level-smul-order-mul-dvd` — Every multiple satisfies the exact root-level divisibility | §4.11 family cases | API under the family hypotheses. |
| `kubert-prime-level-reduction-rational-cartan-value-prime-level-sum` — The prime-root distribution law holds at every original level point | §4.11 family cases | API under the family hypotheses. |
| `kubert-full-distribution-cartan-level-root-order-mul-dvd` — Every intermediate root satisfies the required inner level bound | §4.11 family cases | API under the family hypotheses. |
| `kubert-full-distribution-cartan-level-root-sum-mul` — Actual nested root sums are the full product-multiplier sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-full-distribution-rational-cartan-value-prime-mul-root-sum` — The corrected root law extends by one prime factor | §4.11 family cases | API under the family hypotheses. |
| `kubert-full-distribution-rational-cartan-value-target-root-sum` — Every admissible target has the complete corrected root sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-full-distribution-rational-cartan-value-divisor-root-sum` — The original corrected values satisfy ordinary distribution | §4.11 family cases | API under the family hypotheses. |
| `kubert-full-distribution-rational-cartan-value-full-torus-root-sum` — The ordinary distribution identity includes every original torus root | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-quotient-rational-cartan-value-internal-root-sum` — The corrected root sum uses the original internal fiber | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-quotient-rational-cartan-value-relations-le-ker` — Every original internal relation has zero corrected evaluation | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-quotient-rational-cartan-quotient-value` — The actual corrected map on the original internal quotient | §4.11 family cases | Target under the family hypotheses. |
| `kubert-corrected-quotient-rational-cartan-quotient-value-mk` — The quotient map evaluates every original free word | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-quotient-rational-cartan-quotient-value-of` — Original point classes have the original corrected values | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-quotient-rational-cartan-quotient-value-norm` — The actual quotient maps commute with the original full norms | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-quotient-rational-cartan-quotient-value-unique` — The actual point values determine the quotient homomorphism | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-quotient-rational-cartan-quotient-value-zero-point-ne-zero` — The original zero-point class has nonzero image | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-quotient-rational-cartan-quotient-linear` — The corrected quotient map is integer linear | §4.11 family cases | Target under the family hypotheses. |
| `kubert-corrected-quotient-rational-cartan-quotient-linear-apply` — Integer linearity preserves the exact quotient value function | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-quotient-rational-cartan-quotient-linear-of` — The integer-linear map retains every original point value | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-global-rational-torus-order-pos` — Every actual rational torus point has positive order | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-global-rational-cartan-global-value` — The corrected global value in the original norm limit | §4.11 family cases | Target under the family hypotheses. |
| `kubert-corrected-global-rational-cartan-global-value-level` — Every containing level gives the same global corrected value | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-global-rational-cartan-global-value-zero` — The global zero-point value is the original level-one coefficient | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-global-rational-cartan-global-value-level-root-sum` — The actual full root sum agrees in a containing level | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-global-rational-cartan-global-value-root-sum` — The corrected global values satisfy every ordinary root identity | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-global-rational-cartan-global-distribution` — The actual corrected map on the original global quotient | §4.11 family cases | Target under the family hypotheses. |
| `kubert-corrected-global-rational-cartan-global-distribution-of` — Every original global point class has its actual corrected value | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-global-rational-cartan-global-distribution-level` — The original internal and global quotient maps agree | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-global-rational-cartan-global-value-zero-ne-zero` — The corrected global value of the zero point is nonzero | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-global-rational-cartan-global-distribution-unique` — The actual global point values determine the quotient map | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-global-rational-cartan-global-distribution-zero-point-ne-zero` — The original global zero-point class has nonzero image | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-equivariance-cartan-torus-equiv` — The actual Cartan equivalence on the original rational torus | §4.11 family cases | Target under the family hypotheses. |
| `kubert-corrected-equivariance-cartan-torus-equiv-apply` — The torus action is the existing circle action coordinatewise | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-equivariance-cartan-torus-equiv-one` — The original Cartan identity fixes the whole torus | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-equivariance-cartan-torus-equiv-mul` — Actual Cartan multiplication composes the torus actions | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-equivariance-cartan-torus-equiv-symm` — The inverse torus action comes from the inverse Cartan element | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-equivariance-cartan-torus-equiv-primitive` — The original primitive coordinates transform by the projected unit | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-equivariance-cartan-rational-primitive-sum-action` — The actual raw primitive sum transforms by the projected basis element | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-equivariance-rational-cartan-value-action` — The corrected finite values respect the actual Cartan action | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-equivariance-rational-cartan-value--witt-equivariant` — The finite corrected value action is the existing Witt representation | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-equivariance-rational-cartan-global-value-equivariant` — The corrected global value respects the original norm-limit action | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-equivariance-rational-cartan-global-distribution-intertwines` — The actual global quotient map intertwines the existing actions | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-equivariance-rational-cartan-global-distribution-equivariant` — Every original global quotient class has the expected equivariant image | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-image-rational-cartan-image` — The actual corrected integer image | §4.11 family cases | Target under the family hypotheses. |
| `kubert-corrected-image-rational-cartan-image-mem` — Actual image membership has an original quotient preimage | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-image-rational-cartan-image-point` — Every original corrected point value belongs to the actual image | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-image-rational-cartan-image-eq-span` — The actual quotient image is the integer span of point values | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-image-rational-cartan-image-le-iff` — Containment of the image is tested on actual point values | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-image-rational-cartan-image-basis-mul` — Every original Cartan basis element preserves the actual image | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-image-rational-cartan-image-integral-mul` — The original integral group ring acts on the actual image | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-image-rational-cartan-image-ne-bot` — The actual corrected image is nonzero | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-image-rational-cartan-image-norm` — The original full norms preserve actual corrected images | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-image-rational-cartan-image-global-mem` — The actual finite image agrees with the original global comparison | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-image-rational-cartan-image-fg` — The actual corrected integer image is finitely generated | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-admissible-rational-cartan-image-le-iff-admissible` — Containment of the actual image is tested on admissible-order values | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-admissible-rational-cartan-image-eq-admissible-span` — The actual corrected image is the integer span of admissible-order values | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-admissible-cartan-torus-equiv-transitive` — The actual Cartan action connects all points of the same positive order | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-admissible-rational-cartan-value-same-order-orbit` — Equal-order point values lie in the same actual Cartan orbit | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-admissible-rational-cartan-image-le-iff-distinguished` — One distinguished value per admissible divisor generates under Cartan translates | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-admissible-rational-cartan-image-eq-distinguished-span` — The distinguished Cartan translates give the exact integer image | §4.11 family cases | API under the family hypotheses. |
| `kubert-corrected-admissible-rational-cartan-image-le-iff-integral-distinguished` — The distinguished values generate under the original integral group ring | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-kernels-cartan-prime-kernel-equiv` — Primary residue units are the original prime kernel | §4.11 family cases | Target under the family hypotheses. |
| `kubert-primary-kernels-cartan-prime-kernel-equiv-coe` — The underlying original unit is the inverse primary-coordinate image | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-kernels-cartan-prime-kernel-equiv-coordinates` — The kernel inclusion has the prescribed full primary tuple | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-kernels-cartan-prime-kernel-equiv-primary` — The distinguished primary coordinate is recovered | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-kernels-cartan-prime-kernel-equiv-other` — Every other primary coordinate is one | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-kernels-cartan-prime-kernel-equiv-symm-apply` — The inverse kernel equivalence reads the primary coordinate | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-kernels-cartan-prime-kernel-product-coordinates` — Coordinates of a product over selected primary kernels | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-kernels-cartan-prime-kernel-product-injective` — Products of distinct primary factors have unique tuple coordinates | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-kernels-cartan-prime-kernel-product-exists-iff` — The product range is exactly the units with trivial outside coordinates | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-kernels-rational-prime-kernel-sum-subgroup` — The original kernel indicator is its subgroup basis sum | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-kernels-rational-prime-kernel-sum-primary` — The kernel sum is indexed by actual primary residue units | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-kernels-rational-prime-kernel-sum-product-sum` — Products of kernel sums expand over actual primary tuples | §4.11 family cases | API under the family hypotheses. |
| `kubert-primary-kernels-rational-prime-kernel-sum-product-coeff` — A primary-kernel product is the exact indicator of its coordinate range | §4.11 family cases | API under the family hypotheses. |
| `cyclotomic-log-algebraic-inputs` — Algebraic inputs to the cyclotomic logarithms | §3.4 family cases | API under the family hypotheses. |
| `cyclotomic-log-baker-application` — Baker’s theorem for the cyclotomic log sum | §3.4 family cases | API under the family hypotheses. |
| `dirichlet-one-transcendental` — Transcendence of the Dirichlet value at one | §3.7 family cases | Target under the family hypotheses. |
| `eisenstein-inverse-character` — The inverse-coordinate arithmetic character | §3.7 family cases | Target under the family hypotheses. |
| `eisenstein-inverse-character-value` — The exact inverse-unit value | §3.7 family cases | API under the family hypotheses. |

### Input L4: 190 statements

| Statement | Instances / destination | Result / change |
|---|---|---|
| `positive-eisenstein-measure` — Positive Eisenstein coefficient measures | §5.1 family cases | Target under the family hypotheses. |
| `positive-eisenstein-evaluation` — Evaluation of positive Eisenstein coefficients | §5.1 family cases | API under the family hypotheses. |
| `positive-eisenstein-moment` — Positive Eisenstein moment formula | §5.1 family cases | Target under the family hypotheses. |
| `positive-eisenstein-remove-p` — Invariance under multiplying the coefficient index by p | §5.1 family cases | API under the family hypotheses. |
| `divisor-sum-euler-deletion` — Euler-factor deletion for positive divisor sums | §5.1 family cases | API under the family hypotheses. |
| `positive-eisenstein-euler-moment` — Euler-deleted Eisenstein moments | §5.1 family cases | Target under the family hypotheses. |
| `positive-eisenstein-weight-congruence` — Weight congruences for positive Eisenstein coefficients | §5.1 family cases | Target under the family hypotheses. |
| `normalized-eisenstein` — Arithmetic normalization of the classical Eisenstein form | §5.3 family cases | Target under the family hypotheses. |
| `normalized-eisenstein-coeff` — Divisor coefficients of the arithmetic normalization | §5.3 family cases | API under the family hypotheses. |
| `normalized-eisenstein-zeta-constant` — The zeta constant term | §5.3 family cases | API under the family hypotheses. |
| `p-stabilized-eisenstein` — The p-stabilized Eisenstein modular form | §5.3 family cases | Target under the family hypotheses. |
| `p-stabilized-q-expansion` — Degeneracy formula for the full q-expansion | §5.3 family cases | API under the family hypotheses. |
| `p-stabilized-positive-coeff` — Positive Fourier coefficients after stabilization | §5.3 family cases | Target under the family hypotheses. |
| `p-stabilized-zeta-constant` — Euler factor in the stabilized constant term | §5.3 family cases | Target under the family hypotheses. |
| `positive-eisenstein-modular-comparison` — Measure moments and modular Fourier coefficients | §5.1 family cases | Target under the family hypotheses. |
| `positive-eisenstein-finite` — Finite quotient Eisenstein coefficients | §5.1 family cases | Target under the family hypotheses. |
| `positive-eisenstein-finite-coeff` — Finite residue multiplicities | §5.1 family cases | API under the family hypotheses. |
| `positive-eisenstein-finite-transition` — Joint finite-level compatibility | §5.1 family cases | API under the family hypotheses. |
| `positive-eisenstein-finite-evaluation` — Finite coordinate and native integral comparison | §5.1 family cases | API under the family hypotheses. |
| `positive-eisenstein-finite-moment` — Finite precision power moments | §5.1 family cases | API under the family hypotheses. |
| `positive-eisenstein-completed-coordinates` — Completed-algebra coordinates of positive coefficients | §5.1 family cases | API under the family hypotheses. |
| `positive-eisenstein-evaluation-bound` — Uniform bound for positive Eisenstein integrals | §5.1 family cases | API under the family hypotheses. |
| `positive-eisenstein-series` — The positive Eisenstein q-expansion measure | §5.2 family cases | Target under the family hypotheses. |
| `positive-eisenstein-series-coeff` — Coefficients of the positive q-expansion | §5.2 family cases | API under the family hypotheses. |
| `positive-eisenstein-series-bound` — Uniform bound for all q-coefficients | §5.2 family cases | API under the family hypotheses. |
| `positive-eisenstein-series-test-congruence` — Uniform test-function congruences | §5.2 family cases | API under the family hypotheses. |
| `positive-eisenstein-series-weight-congruence` — Weight congruences for the positive series | §5.2 family cases | Target under the family hypotheses. |
| `positive-eisenstein-series-index-invariance` — Invariance of coefficients under multiplication by p | §5.2 family cases | API under the family hypotheses. |
| `positive-eisenstein-series-modular-comparison` — Joint integral series comparison with the modular form | §5.2 family cases | API under the family hypotheses. |
| `twisted-eisenstein-denominator` — The shifted Eisenstein clearing denominator | §5.4 family cases | Target under the family hypotheses. |
| `twisted-eisenstein-denominator-moment` — Moments of the shifted denominator | §5.4 family cases | API under the family hypotheses. |
| `twisted-eisenstein-denominator-regular` — A regular doubled Eisenstein denominator | §5.4 family cases | API under the family hypotheses. |
| `weighted-eisenstein-numerator` — The integral numerator for the Eisenstein constant | §5.4 family cases | Target under the family hypotheses. |
| `weighted-eisenstein-numerator-moment` — Bernoulli moments with the Eisenstein shift | §5.4 family cases | API under the family hypotheses. |
| `localized-eisenstein-constant` — The Eisenstein constant in the total quotient | §5.4 family cases | Target under the family hypotheses. |
| `localized-eisenstein-clearing` — Clearing the localized Eisenstein denominator | §5.5 family cases | API under the family hypotheses. |
| `localized-eisenstein-twist-comparison` — Comparison with an actual character-twist equivalence | §5.5 family cases | API under the family hypotheses. |
| `eisenstein-moment-hom` — The arithmetic moment ring homomorphism | §5.5 family cases | Target under the family hypotheses. |
| `eisenstein-moment-hom-evaluation` — Evaluation of the arithmetic moment map | §5.5 family cases | API under the family hypotheses. |
| `eisenstein-moment-denominator` — Admissibility of every nonnegative moment | §5.4 family cases | API under the family hypotheses. |
| `eisenstein-away-constant` — The constant in its denominator localization | §5.5 family cases | Target under the family hypotheses. |
| `eisenstein-away-inclusion` — Embedding the denominator localization | §5.5 family cases | Target under the family hypotheses. |
| `eisenstein-away-constant-image` — The actual total-quotient image of the constant | §5.5 family cases | API under the family hypotheses. |
| `eisenstein-away-evaluation` — The admissible moment evaluator | §5.5 family cases | Target under the family hypotheses. |
| `eisenstein-away-constant-value` — The admissible Bernoulli constant value | §5.5 family cases | Target under the family hypotheses. |
| `eisenstein-away-classical-constant` — The common classical and arithmetic Eisenstein constant | §5.3 family cases | API under the family hypotheses. |
| `eisenstein-away-integral-evaluation` — Integral coefficients under admissible evaluation | §5.5 family cases | API under the family hypotheses. |
| `full-eisenstein-away-series` — The full Eisenstein series over the denominator localization | §5.5 family cases | Target under the family hypotheses. |
| `full-eisenstein-away-coefficients` — All coefficients of the denominator-localized family | §5.5 family cases | API under the family hypotheses. |
| `full-eisenstein-total-series` — The full Eisenstein series in the total quotient | §5.5 family cases | Target under the family hypotheses. |
| `full-eisenstein-fraction-image` — The full family maps to the source series | §5.5 family cases | API under the family hypotheses. |
| `full-eisenstein-admissible-specialization` — The full admissible specialization | §5.5 family cases | Target under the family hypotheses. |
| `full-eisenstein-common-series` — The common rational Eisenstein q-expansion | §5.5 family cases | API under the family hypotheses. |
| `full-eisenstein-index-invariance` — Index invariance of the full family | §5.5 family cases | API under the family hypotheses. |
| `eisenstein-away-constant-clearing` — Clearing the constant in its denominator localization | §5.4 family cases | API under the family hypotheses. |
| `integral-cleared-eisenstein-series` — The integral numerator series of the full Eisenstein family | §5.5 family cases | Target under the family hypotheses. |
| `integral-cleared-eisenstein-coefficients` — Coefficients of the integral numerator series | §5.5 family cases | API under the family hypotheses. |
| `full-eisenstein-away-clearing` — Uniform denominator clearing in the away localization | §5.5 family cases | Target under the family hypotheses. |
| `full-eisenstein-total-clearing` — Uniform denominator clearing in the total quotient | §5.5 family cases | Target under the family hypotheses. |
| `full-eisenstein-integral-lift-unique` — Uniqueness of the integral numerator series | §5.5 family cases | API under the family hypotheses. |
| `integral-cleared-eisenstein-moment` — Integral moments of the cleared full series | §5.5 family cases | Target under the family hypotheses. |
| `integral-cleared-eisenstein-moment-coefficients` — All integral coefficients of the cleared specialization | §5.5 family cases | API under the family hypotheses. |
| `full-eisenstein-cleared-specialization` — The integral lift of the full admissible specialization | §5.5 family cases | API under the family hypotheses. |
| `cleared-eisenstein-coefficient-test-congruence` — Integral test congruences for every cleared coefficient | §5.5 family cases | API under the family hypotheses. |
| `cleared-eisenstein-evaluation` — The full cleared q-expansion measure | §5.5 family cases | Target under the family hypotheses. |
| `cleared-eisenstein-evaluation-coefficients` — Coefficients of the full cleared q-expansion measure | §5.5 family cases | API under the family hypotheses. |
| `cleared-eisenstein-evaluation-moment` — Agreement of full evaluation with the integral moment series | §5.5 family cases | API under the family hypotheses. |
| `full-cleared-eisenstein-test-congruence` — Uniform integral congruences for the full series | §5.5 family cases | Target under the family hypotheses. |
| `full-cleared-eisenstein-weight-congruence` — Weight congruences for the full integral series | §5.5 family cases | Target under the family hypotheses. |
| `full-eisenstein-cleared-field-congruence` — Qualified weight congruences for the full admissible family | §5.5 family cases | API under the family hypotheses. |
| `full-eisenstein-coefficient-quotient` — The exact quotient of each full coefficient | §5.5 family cases | API under the family hypotheses. |
| `eisenstein-denominator-weight-congruence` — Variation of the explicit arithmetic denominator | §5.4 family cases | API under the family hypotheses. |
| `full-eisenstein-coefficient-bound` — A uniform bound for the full specialized coefficients | §5.5 family cases | API under the family hypotheses. |
| `full-eisenstein-quotient-precision` — Precision after division by the arithmetic denominators | §5.5 family cases | Target under the family hypotheses. |
| `eisenstein-denominator-local-norm` — Constant denominator norm in a strict weight neighborhood | §5.4 family cases | API under the family hypotheses. |
| `full-eisenstein-local-precision` — Precision on a neighborhood with fixed denominator norm | §5.5 family cases | Target under the family hypotheses. |
| `classical-rational-eisenstein-precision` — Precision for the rational classical q-expansions | §5.3 family cases | API under the family hypotheses. |
| `weighted-eisenstein-cross` — The shifted cross-numerator identity | §5.5 family cases | API under the family hypotheses. |
| `localized-eisenstein-all-unit-clearing` — The constant clears at every unit parameter | §5.4 family cases | Target under the family hypotheses. |
| `localized-eisenstein-regular-fraction` — Independence of the regular smoothing representative | §5.5 family cases | API under the family hypotheses. |
| `full-eisenstein-all-unit-clearing` — Uniform full-series clearing at every parameter | §5.4 family cases | Target under the family hypotheses. |
| `regular-eisenstein-away-inclusion` — Embedding a regular smoothing localization | §5.5 family cases | Target under the family hypotheses. |
| `regular-eisenstein-away-constant-image` — The constant image for every regular parameter | §5.5 family cases | API under the family hypotheses. |
| `regular-eisenstein-full-series-image` — The full family is independent of the regular representative | §5.5 family cases | API under the family hypotheses. |
| `eisenstein-all-parameter-denominator` — The character image of every smoothing denominator | §5.4 family cases | API under the family hypotheses. |
| `admissible-eisenstein-away-evaluation` — Evaluation at an arbitrary admissible smoothing parameter | §5.5 family cases | Target under the family hypotheses. |
| `admissible-eisenstein-integral-agreement` — Agreement on every integral coefficient | §5.5 family cases | API under the family hypotheses. |
| `admissible-eisenstein-constant-value` — The constant value is independent of admissible smoothing | §5.5 family cases | Target under the family hypotheses. |
| `admissible-eisenstein-full-canonical` — Every admissible parameter gives the canonical full series | §5.5 family cases | API under the family hypotheses. |
| `admissible-eisenstein-full-independent` — The specialized family is independent of smoothing | §5.5 family cases | API under the family hypotheses. |
| `admissible-eisenstein-common-classical` — The common rational classical series for every admissible parameter | §5.3 family cases | API under the family hypotheses. |
| `eisenstein-double-constant-moment` — The doubled constant is the shifted arithmetic moment | §5.5 family cases | API under the family hypotheses. |
| `eisenstein-ordinary-clearing-candidate` — Moments forced by an ordinary clearing candidate | §5.5 family cases | API under the family hypotheses. |
| `eisenstein-sign-clearing-candidate` — The sign factor forces negative arithmetic moments | §5.5 family cases | API under the family hypotheses. |
| `eisenstein-sign-clearing-not-integral` — The ordinary sign factor does not clear the constant | §5.5 family cases | Target under the family hypotheses. |
| `eisenstein-not-ordinary-pseudomeasure` — The corrected constant is not an ordinary pseudomeasure | §5.5 family cases | Target under the family hypotheses. |
| `eisenstein-constant-not-integral` — The corrected constant is not an integral measure | §5.4 family cases | Target under the family hypotheses. |
| `eisenstein-constant-no-field-measure` — No bounded field measure has all the constant values | §5.5 family cases | Target under the family hypotheses. |
| `eisenstein-inverse-moment-hom` — Integral evaluation at the inverse coordinate | §5.4 family cases | Target under the family hypotheses. |
| `eisenstein-inverse-moment-agreement` — Agreement with the actual inverse-coordinate integral | §5.4 family cases | API under the family hypotheses. |
| `eisenstein-inverse-denominator-zero` — Every shifted denominator has zero inverse-coordinate image | §5.4 family cases | API under the family hypotheses. |
| `eisenstein-inverse-no-away-extension` — No smoothing localization admits this character evaluation | §5.5 family cases | Target under the family hypotheses. |
| `eisenstein-inverse-no-fraction-extension` — No total-quotient extension at the inverse coordinate | §5.5 family cases | Target under the family hypotheses. |
| `twisted-positive-eisenstein-measure` — Character-weighted positive Eisenstein coefficient measures | §5.6 family cases | Target under the family hypotheses. |
| `twisted-positive-eisenstein-evaluation` — Evaluation of character-weighted coefficients | §5.6 family cases | API under the family hypotheses. |
| `twisted-positive-eisenstein-moment` — Finite arithmetic moments with two characters | §5.6 family cases | Target under the family hypotheses. |
| `twisted-positive-eisenstein-p-scaling` — The left-character factor under multiplication by p | §5.6 family cases | Target under the family hypotheses. |
| `twisted-positive-eisenstein-test-bound` — Uniform precision for character-weighted coefficients | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-positive-eisenstein-measure` — Integral character-weighted Eisenstein coefficients | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-positive-eisenstein-evaluation` — Evaluation of integral weighted coefficients | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-positive-eisenstein-coefficient` — Coefficient inclusion on every integral test | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-positive-eisenstein-test-congruence` — Integral test congruences for positive coefficients | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-positive-eisenstein-moment` — Arithmetic moments of integral weighted coefficients | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-positive-eisenstein-weight-congruence` — Weight congruences in the integer coefficient ring | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-eisenstein-finite` — Finite coordinates of integral weighted coefficients | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-eisenstein-finite-divisors` — The weighted divisor formula in finite coordinates | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-eisenstein-finite-coefficients` — Signed residue multiplicities | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-eisenstein-finite-refinement` — Refinement of weighted unit-group coordinates | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-eisenstein-finite-evaluation` — Finite evaluation after coefficient reduction | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-eisenstein-finite-moment-precision` — Arithmetic precision of finite coefficient moments | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-positive-series` — Integral character-weighted positive series | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-positive-series-coeff` — Coefficients of the integral weighted positive series | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-positive-series-coefficient-inclusion` — Coefficient inclusion of the whole positive series | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-positive-series-test-congruence` — Integral ideals control the whole positive series | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-positive-series-weight-congruence` — Weight congruences of integral weighted positive series | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-positive-series-p-scaling` — Left-character scaling of positive-series indices | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-positive-series-finite-moments` — Finite-coordinate moments of the whole reduced series | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-positive-eisenstein-bound` — Uniform bounds for integral weighted coefficients | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-coefficient-character-twist` — Finite-character twisting of integral coefficients | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-coefficient-arithmetic-moment` — Arithmetic moments with a finite character | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-series-character-twist` — Finite-character twisting of the whole positive series | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-series-arithmetic-twist` — Integral arithmetic specialization as a right-character product | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-series-arithmetic-moment` — The finite-character positive q-expansion | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-series-character-weight-congruence` — Weight congruences on a fixed finite-character component | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-series-character-finite-moments` — Finite coordinates after inserting the character | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-coefficient-base-change` — Coefficient-field change for weighted integral measures | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-finite-base-change` — Coefficient-field change in finite unit-group coordinates | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-series-base-change` — Coefficient-field change for the whole positive series | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-series-base-change-equality` — Equality of positive series descends through coefficient extension | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-series-base-change-precision` — Integral congruence precision is reflected by coefficient extension | §5.6 family cases | Target under the family hypotheses. |
| `integral-twisted-arithmetic-coefficient-base-change` — Coefficient-field compatibility of arithmetic moments | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-arithmetic-series-base-change` — Coefficient-field compatibility of arithmetic positive series | §5.6 family cases | API under the family hypotheses. |
| `twisted-divisor-euler-deletion` — Euler deletion for native twisted divisor sums | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-coefficient-native-moment` — Native divisor-sum comparison of integral moments | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-series-native-moment` — Native Euler comparison of the whole positive series | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-series-native-arithmetic-moment` — Native comparison at finite-character arithmetic points | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-series-native-bad-right-level` — Bad right level removes the Euler correction | §5.6 family cases | Target under the family hypotheses. |
| `twisted-divisor-coefficient-map` — Coefficient maps of native twisted divisor sums | §5.6 family cases | API under the family hypotheses. |
| `integral-twisted-classical-positive-comparison` — Common algebraic positive coefficients of classical and p-adic series | §5.9 family cases | API under the family hypotheses. |
| `integral-twisted-classical-full-comparison` — Fixed-weight comparison with a supplied algebraic constant | §5.9 family cases | API under the family hypotheses. |
| `integral-doubled-tame-eisenstein-series` — Integral doubled tame Eisenstein series | §5.7 family cases | Target under the family hypotheses. |
| `integral-doubled-tame-eisenstein-coeff` — Coefficients of the doubled tame series | §5.7 family cases | Target under the family hypotheses. |
| `integral-doubled-tame-eisenstein-bound` — Uniform bounds including the tame constant | §5.7 family cases | API under the family hypotheses. |
| `integral-doubled-tame-eisenstein-normalize` — Field normalization of the tame full series | §5.7 family cases | API under the family hypotheses. |
| `integral-doubled-tame-eisenstein-common-constant` — Common arithmetic constant at the shifted weight | §5.7 family cases | API under the family hypotheses. |
| `integral-tame-constant-restriction` — The tame constant as an actual unit measure | §5.7 family cases | API under the family hypotheses. |
| `integral-tame-constant-residue` — Finite residues of the doubled tame constant | §5.7 family cases | Target under the family hypotheses. |
| `dyadic-tame-normalized-constant-norm` — A dyadic constant of norm two | §5.7 family cases | API under the family hypotheses. |
| `dyadic-tame-no-integral-normalization` — No integral measure for the halved dyadic family | §5.7 family cases | Target under the family hypotheses. |
| `integral-doubled-tame-test-congruence` — Congruences of the full doubled tame series | §5.7 family cases | Target under the family hypotheses. |
| `integral-doubled-tame-weight-congruence` — Weight congruences including the tame constant | §5.7 family cases | Target under the family hypotheses. |
| `integral-doubled-tame-normalized-congruence` — Integral precision after halving the tame family | §5.7 family cases | Target under the family hypotheses. |
| `integral-normalized-tame-series` — The integral normalized tame Eisenstein measure | §5.7 family cases | Target under the family hypotheses. |
| `integral-normalized-tame-map` — The integral lift of the field normalization | §5.7 family cases | API under the family hypotheses. |
| `integral-normalized-tame-bound` — The normalized tame coefficient bound | §5.7 family cases | Target under the family hypotheses. |
| `integral-normalized-tame-test-congruence` — Normalized tame congruences without precision loss | §5.7 family cases | Target under the family hypotheses. |
| `integral-normalized-tame-weight-congruence` — Integral weight congruences for the normalized family | §5.7 family cases | Target under the family hypotheses. |
| `integral-tame-unit-constant-witness` — A unit constant detected by two residue tests | §5.7 family cases | Target under the family hypotheses. |
| `tame-full-series-scalar-integrality` — The exact scalar integrality criterion | §5.7 family cases | Target under the family hypotheses. |
| `dyadic-nonprincipal-tame-no-normalization` — The dyadic obstruction for every nonprincipal tame character | §5.7 family cases | Target under the family hypotheses. |
| `tame-full-series-character-variation` — Character variation of the full doubled tame series | §5.7 family cases | Target under the family hypotheses. |
| `tame-near-character-scalar-integrality` — Scalar integrality near a nonprincipal tame character | §5.7 family cases | Target under the family hypotheses. |
| `dyadic-all-tame-scalar-integrality` — Exact scalar integrality for every dyadic tame character | §5.7 family cases | Target under the family hypotheses. |
| `one-level-tame-scalar-integrality` — The exact scalar criterion at tame modulus one | §5.7 family cases | Target under the family hypotheses. |
| `dyadic-tame-half-classification` — Exactly when a dyadic tame integral half exists | §5.7 family cases | Target under the family hypotheses. |
| `normalized-tame-scalar-integrality` — Exact scalar integrality of the normalized tame family | §5.7 family cases | Target under the family hypotheses. |
| `all-prime-tame-scalar-integrality` — The scalar-integrality criterion at every prime | §5.7 family cases | Target under the family hypotheses. |
| `all-prime-tame-half-classification` — Exactly when the tame family has an integral half | §5.7 family cases | Target under the family hypotheses. |
| `tame-full-arithmetic-common-series` — Full tame arithmetic q-expansion through a common field | §5.9 family cases | API under the family hypotheses. |
| `tame-actual-classical-full-comparison` — Full comparison with a supplied tame classical form | §5.9 family cases | API under the family hypotheses. |
| `unit-power-totient-precision` — Uniform precision of unit powers | §5.1 family cases | API under the family hypotheses. |
| `unit-power-sequence-convergence` — Convergence within a fixed weight component | §5.1 family cases | API under the family hypotheses. |
| `prime-power-moments-impossible` — No unit measure interpolates prime powers | §5.1 family cases | Target under the family hypotheses. |
| `principal-tame-eisenstein-series` — The principal tame Eisenstein family | §5.8 family cases | Target under the family hypotheses. |
| `principal-tame-positive-coefficients` — Tame Euler deletion of positive coefficients | §5.8 family cases | API under the family hypotheses. |
| `principal-tame-constant` — The principal tame localized constant | §5.8 family cases | API under the family hypotheses. |
| `principal-tame-ordinary-constant` — Ordinary arithmetic values of the principal tame constant | §5.8 family cases | API under the family hypotheses. |
| `principal-tame-classical-comparison` — Classical comparison of principal tame Euler deletion | §5.8 family cases | API under the family hypotheses. |
| `principal-tame-cleared-congruence` — Integral precision of the principal tame family | §5.8 family cases | Target under the family hypotheses. |
| `nontrivial-left-full-family` — The full family with nontrivial primitive left character | §5.5 family cases | API under the family hypotheses. |

## Lean signatures and generality pass

All namespace parameters and typeclasses are local to the kept declarations; there is no ambient variable block supplying an unstated arithmetic assumption. Generic ring series definitions require only a unit denominator; their arithmetic interpretation is separately scoped. `analyticNumerator` is a totalized `tsum` adapter, with actual convergence required by its identification theorem, and `analyticBranch` is a totalized quotient adapter whose analytic use excludes zero denominator. The generic cleared-residue theorem requires an actual continuous numerator, the actual differentiable denominator and a nonzero first derivative; no hypothesis merely repeats its conclusion. Morita uniqueness is an existence-and-uniqueness statement for an actual continuous native unit-valued function, not a sorry-defined carrier.

| Kept declaration | Scope / adversarial result |
|---|---|
| `bernoulliKernel` | README §0.1–0.3; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `smoothedMellinKernel` | README §0.1–0.3; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `analyticAt_bernoulliKernel` | README §0.1–0.3; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `iteratedDeriv_bernoulliKernel` | README §0.1–0.3; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `exists_normalizedMellinContinuation` | README §0.1–0.3; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `smoothingDenominator` | README §1.1–1.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `smoothingTail` | README §1.1–1.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `smoothedSeries` | README §1.1–1.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `smoothedMeasure` | README §1.1–1.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `smoothingMoment` | README §1.1–1.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `clearingMoment` | README §1.1–1.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `smoothingResidueCandidate` | README §1.1–1.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `smoothedSeries_spec` | README §1.1–1.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `smoothedMeasure_transform` | README §1.1–1.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `smoothedMeasure_moment` | README §1.1–1.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `tameNumerator` | README §2.3; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `tameSeries` | README §2.3; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `tameSeries_spec` | README §2.3; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `analyticDenominator` | README §3.1–3.2; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `analyticNumerator` | README §3.1–3.2; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `analyticBranch` | README §3.1–3.2; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `analyticDenominator_hasDerivAt` | README §3.1–3.2; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `cleared_branch_residue` | README §3.1–3.2; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `moritaNaturalValue` | README §4.1–4.13; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `moritaModulus` | README §4.1–4.13; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `moritaMeanLevel` | README §4.1–4.13; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `moritaFiniteMean` | README §4.1–4.13; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `grossKoblitzDigitSum` | README §4.1–4.13; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `gammaUnitCount` | README §4.1–4.13; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `ferreroGreenbergPermutationValue` | README §4.1–4.13; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `divisionRelator` | README §4.1–4.13; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `existsUnique_moritaGamma` | README §4.1–4.13; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `moritaNaturalValue_congruence` | README §4.1–4.13; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `grossKoblitz_fraction_sum` | README §4.1–4.13; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `ferreroGreenbergPermutationValue_congruence` | README §4.1–4.13; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `eisensteinPositiveMoment` | README §5.1–5.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `unitPowerTest` | README §5.1–5.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `unitPowerSequence_uniform` | README §5.1–5.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `not_exists_primePower_moments` | README §5.1–5.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `shiftedClearingValue` | README §5.1–5.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `shiftedClearingValue_inverse` | README §5.1–5.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `eisensteinPositiveMoment_mul_p` | README §5.1–5.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |
| `eisensteinPositiveMoment_euler` | README §5.1–5.5; real body or proposition on native carriers; explicit finite/degenerate/sign examples in the same Lean layer. |

## Validation

* `lean-check research/blueprint/packages/DirichletPadicLFunctions/Suggested.lean`: **exit 0**, only `declaration uses sorry` warnings. Memory available before final compilation: 96 GB. Final file has fewer than 600 lines and no sorry-defined data, abbreviations, instances or carriers; no Lean language server or project/build/update/cache command was started.
* Pinned build: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Current-library additions are suppliers in the README, not fictitious pinned imports.
* `python3 scripts/check_blueprint.py research/blueprint/packets/DirichletPadicLFunctions*.json`: **exit 0**, six packets, zero errors. Existing L3 input emits 26 warnings for short one/two-item API outlines; the other five emit zero warnings. These accepted input packets are outside the editable paths. The package gives their combined construction APIs and Checks in prose.
* Intake `check-files` on all four deliverables: **4 files, 0 problems**. README 50–200 KB bound, Lean 495-line size and `scripts/check_sorry_data.py` checks also pass. All 43 kept declaration names occur in the README; 110 Lean examples, 50 README Checks lists, and six Examples/Dependencies pairs.
* Work is submitted as a completed package for independent review, with the specific mathematical limitations above disclosed. No second issue is claimed.
