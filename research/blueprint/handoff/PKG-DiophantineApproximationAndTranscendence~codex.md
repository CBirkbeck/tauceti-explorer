# Handoff: Diophantine approximation and transcendence package

Completed by Codex, session `codex-zvr9S8`, for #8075 on 2026-10-09. This is the package author’s audit, not an independent review. The claim was confirmed by the swarm bot after claim comment 6087887826. No second job was taken.

## Delivered and coverage

The package has six ordered layers, a reader in upstream roadmap form, representative Lean signatures and `topic = "math.NT"`. The reader is written in original prose with source locators, prerequisites, APIs and computed Checks. All 398 accepted input nodes were considered, including 47 definition/construction nodes, 346 API items, 203 original definition/construction tests and 40 further target tests. Shared mathematics was imported rather than repeated. The original tests remain, with additional negative controls and the algebraic Cartan API needed in the Ax proof. The input packet, original reader, suggested file, atlas and library audit were not changed.

The file records target signatures and admitted examples; it proves neither the roadmap nor the checks. Compilation only checks their types. Its module documentation, namespace, six layers, declaration docstrings and closing list follow the upstream form. The README is complete at target level; the more detailed signatures below are intentionally representative.

## Full targets beyond the pinned signatures

The reader explicitly separates absolute constructions from K-rational prototypes. The closing comment lists all full absolute-height/minima/filtration, perturbed-unit-equation, absolute Minkowski/gap/Davenport, numerical interval/Subspace and Galois-system transport interfaces which need the algebraic-closure place-extension carrier. In particular the typed `exists_subspaces_unit_equation_algebraic` is the z=1 case; the reader’s `absolutePerturbedUnitEquation` retains the full height-bounded perturbation. The typed system theorem uses D=1; `absoluteSubspaceTheoremForSystems` retains general coefficient degree D and the source’s 1/(3RD) threshold. The interval prototypes quantify existential thresholds; the absolute reader targets retain the specified numerical thresholds. No absolute theorem is represented by an identically named K-rational theorem.

`formalLaplaceOperatorTransfer`, `IsApparentSingularity`, `algebraicCartanDegreeShift` (including the full homogeneous graded product/Cartan rules), and `axSchanuelMultivariateSeries` need the analytic solution-basis, graded-form and multivariate formal-exponential interfaces. They remain precise named reader targets, with the relevant constructions and hypotheses, rather than placeholder Lean propositions. The typeable exterior differential on the whole exterior algebra and the C-linear Lie derivative on one-forms are supplied with APIs and Checks. The arbitrary-constant-field Ax theorem itself is typed; its reader name `axSchanuelGeneralConstants` is represented by `ax_schanuel`.

## Ownership corrections and moved-down mathematics

Current upstream roadmaps and Completed roadmaps were read and searched by objects, operators and hypotheses, including the nine roadmaps newer than the atlas snapshot. The current upstream checkout was at `da9bee11efc4c8167e7c524ad84dd8fe5db2a3b1`; the current Tau Ceti library was at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The elaboration uses the prescribed Mathlib `082e2d3` and Tau Ceti `f790474` environment. No builds, downloads of libraries, or mutations were made in the read-only current checkout.

| Removed as a new target or reconciled | Actual supplier / resulting target |
| --- | --- |
| Hadamard norm-of-determinant target and its suggested declaration | GeometryOfNumbersAndQuadraticArithmetic Layer 0 `orthonormal_coordinate_hadamard`, `hermitian_gram_hadamard`; integral Gram/covolume carriers from IntegralLattices. Delete the target, retain the contract at the boundary. |
| Infinitude of number-field units and its suggested declaration | Mathlib Dirichlet unit rank, torsion/basis decomposition and infinitude criterion; not a target in Layer 2. |
| Second central-binomial bound in Layer 1 | Use the single Layer 0 coefficient estimate; duplicate suggested declaration removed. |
| Unified place carrier, unrooted product formula, place-extension multiplicities | Current `TauCeti.GlobalNumberFields.Place`, `normalizedAbsValue`, finite multiplicative support/product and extension API, and GlobalNumberFields Layer 0. The only new object is the degree-normalization adapter; the local Lean sum carrier is notation via an equivalence. |
| Native Krull-dimension/transcendence-degree, faithful integral-extension and field tensor-product dimension statements | Current Tau Ceti dimension API, cited by declaration in the supplier contracts. Layer 5 retains the nonzero fibre comparison and differential rank. |
| Kähler module and universal derivation; specialized curve differential comparison | Mathlib `KaehlerDifferential` and AlgebraicCurves Layer 9. Retain only the broader finite-generation differential-rank adapter and algebraic Cartan calculus. |
| Exterior contraction by a Kähler dual | Mathlib `CliffordAlgebra.contractLeft` and its generator, scalar, product and square-zero rules; removed the planned contraction declaration. |
| Fixed-field house, polynomial Mahler measure, Finsupp coefficient heights, fixed-field Northcott, ordinary Hasse derivatives | Native supplier contracts; keep only arbitrary-algebraic-element, primitive-polynomial, multivariate or coefficient-vector adapters. |
| Hermite’s generic integral identity | Mathlib `LindemannWeierstrass.integral_exp_mul_eval`; retain the separately normalized `hermiteIntegral` and its API. |

The higher-tier prerequisite **ClassicalArithmeticCompletion Layer 2 recurrence closed form** moved here as `DiophantineApproximation.closedFormRecurrence` in Layer 2, reader §2.4. It covers root multiplicities with polynomial coefficients and the order-zero recurrence. The higher roadmap should import this target; it must not remain a prerequisite pointing upward. `FoundationsAndLibraryIntegration` and `UPSTREAM:` bookkeeping references were all resolved to native declarations or named lower-tier roadmap layers. Dependencies are GlobalNumberFields Layer 0, GeometryOfNumbersAndQuadraticArithmetic Layers 0/1/4, AlgebraicCurves Layer 9 and existing upstream analytic/lattice interfaces, not higher-tier atlas plans.

## Sources and limits of this run’s recheck

Source statements and locators were checked against public primary PDFs for the central height, Roth, Subspace, interpolation, logarithmic, equation and special-function interfaces. The exact formula and hypotheses were read, rather than relying on a name match. The source references preserve edition/version distinctions: Evertse 2019 chapter notes, EF arXiv:1008.2340v1, Evertse’s author-page PDFs, Beukers v3, AF v2, and Kirby’s v3 PDF text dated 9 November 2021. E95’s strict sharp-Roth premise and E96 Lemma 23’s weak ≥ premise are different formulations; the latter is what the suggested theorem uses.

Two inherited primary locators could not be independently re-opened during this run and are flagged for the package reviewer: **Matveev, Corollary 2.3, p. 1219 and §21, p. 1266**, used by `LogarithmicForms.matveev`, and **Yang’s height notes**, chiefly local-place/absolute-height comparisons. The MathNet full-text endpoint timed out repeatedly, including through the browser; its publisher index confirmed the article metadata. Yang’s notes were not retrieved. These are inherited from the accepted input/source review; this author does not claim to have reverified them. Do not replace Matveev’s linear-form constant by the different multiplicative-form constant. BMS06 Theorem 9.4 was read directly for `matveev_prod_sub_one` and confirms that separate formulation.

Wu Lemma 2.2 was read, but its local values are already degree-normalized. Applying another degree root to its displayed product without reconciling the convention would be wrong. The package instead uses the native relative-place extension formulas and one absolute degree root, with the multiplicity and extension weights spelled out. The reviewer should compare Yang under that convention. No unresolved mathematical claim has been silently marked formalised.

A further deterministic sample of 15 primary locators (selection seed 8075) was checked during the final pass:

| Target | Locator actually read | Result |
| --- | --- | --- |
| Norm-form finiteness | E19 ch. 7 Thm. 7.9, pp. 146–148 | Full norm-form hypotheses retained. |
| Formal exponential evaluation | E19 ch. 4 (4.9)–(4.10), p. 69 | Group-algebra evaluation and coefficients agree; Zhao development reference was not separately re-opened in this sample. |
| Weighted-index vanishing | P22 Exercise 2.6.3, p. 69 | Strict coefficient cutoff and zero-polynomial infinity convention retained. |
| Coefficient-length addition | E19 ch. 6 (6.14), p. 116 | ℓ¹ coefficient estimate agrees. |
| Gelfond arithmetic lower estimate | KW26 Step 6, p. 9 | The norm/denominator step agrees; auxiliary Soundararajan reference was not separately re-opened in this sample. |
| Naive-height binomial estimate | Wu §3 Lemma 3.3, p. 6; E19 ch. 6 p. 108 | Primitive-polynomial coefficient bound retained. |
| Partial-specialization jet | E96 Lemma 25, author-PDF p. 67 | Jet variable and remaining degree directions agree. |
| Binary multihomogeneous restoration | E96 Lemma 24 proof, author-PDF pp. 66–67 | Monomial restoration does not erase the chosen nonzero slice. |
| Two-logarithm lower bound | E19 Exercise 5.4, p. 104 | Positivity, nonunit rationals and denominator conventions agree. |
| Finite simplex discretization | ES02 Lemma 21.1, p. 97 | Source range γ∈[1/2,1) is stated; the typed weaker finite-cover API for 0<c<1 follows by a rational mesh and claims no cardinality constant. |
| Absolute system theorem | EF13 Thm. 3.1, pp. 13–14; proof p. 25 | General coefficient-degree threshold is 1/(3RD), kept separate from D=1 Lean. |
| Qualitative Subspace theorem | E19 Thm. 7.4, pp. 140–141 | Field, cardinality, independent-form and nonzero-point hypotheses retained. |
| Taylor interpolation | W00 Lemma 4.13, pp. 134–135 | Reader uses the harmless larger 1+T in place of 1+√T; no stronger estimate is claimed. |
| Infinite-place extension | Wu Lemma 2.2, p. 3 and native place API | Normalization warning above; relative extension formula obtained from the native supplier. |
| Conditional block-grid nonvanishing | E96 Lemma 26, author-PDF p. 68 | Uses actual nonzero restriction and residual-degree hypotheses. |

Kirby §3.3 Lemma 3.2, pp. 30–31, was additionally read for Lie differentiation; Proposition 3.7, pp. 35–37, for constant dependence and its multiplicative-group specialization; and Theorem 3.8/proof, pp. 37–38, for the differential-rank bound. Lemma 3.6 is a semiabelian product statement used in that derivation, not itself a separately stated integer-relation theorem. The reader’s integer-relation target refers to that derivation.

Downloaded public PDFs and extracted text stayed in ephemeral scratch. No source passage is copied into any deliverable. The source-file digests below are receipts, not a claim that every page of every source was read.

## Adversarial mathematics pass

The complete suggested file was manually read, including surrounding `variable` blocks, and compared with the reader; every declaration and example is assigned to one row below and enumerated in the appendix. Reader-only full interfaces are included in the absolute/differential rows. Cases were chosen for the mathematics at hand; field/DVR and characteristic-p distinctions are checked where meaningful, rather than substituting irrelevant local-ring hypotheses into an archimedean theorem. The pass checks proposed truth and generality, not proof completion. Every detected sign, normalization, degree, zero and implication-direction defect was corrected before the final elaboration.

| Statements checked | Instances / witnesses tried | Result and change |
| --- | --- | --- |
| A1: Layer 0, Primitive polynomial (22 declarations; exact list below) | Transcendental junk 1; x=0, integers, −3/2 and conjugate roots; degree zero; denominator 0 for a transcendental element. | Checked against its enclosing variables and the reader; Algebraicity conditions remain on integrality and divisibility; positive leading coefficient fixes the sign. |
| A2: Layer 0, Naive height (16 declarations; exact list below) | 0 and 1; ±3/2; conjugates; zero polynomial versus the primitive polynomial; positive leading coefficient. | Checked against its enclosing variables and the reader; The height is a coefficient maximum, distinct from house and projective coefficient height. |
| A3: Layer 0, Mahler measure (16 declarations; exact list below) | Roots of unity; 0; ±3/2; reciprocal roots; degree zero and transcendental junk. | Checked against its enclosing variables and the reader; Use the primitive polynomial adapter, retaining its leading coefficient and algebraicity where degree occurs. |
| A4: Layer 0, House (20 declarations; exact list below) | 0; rational numbers; conjugates of √2; unit norms; transcendental junk 0; d=0 and d=1. | Checked against its enclosing variables and the reader; The new target concerns arbitrary algebraic elements; fixed-number-field house is a supplier. |
| A5: Layer 0, Height comparisons and finiteness (20 declarations; exact list below) | ℚ inside a degree-two field; real versus complex place multiplicity; scalar/projective zero; denominators; bounded degree 0/1; fixed field versus closure. | Checked against its enclosing variables and the reader; Field comparison is a new API, not an already proved consequence of Mathlib’s absolute-height definition. Fixed-field Northcott is imported. |
| A6: Layer 0, Siegel estimate (2 declarations; exact list below) | M=0 and N=1; full-rank square systems; dM<N; zero row and nonzero solution; positive coefficient bound. | Checked against its enclosing variables and the reader; Retain strict underdetermination and the coefficient bound; a square invertible matrix is a negative control. |
| A7: Layer 0, Dirichlet and Kronecker (7 declarations; exact list below) | Dimension 0/1; rational versus irrational input; Q=1; zero fractional parts; inhomogeneous lattice obstruction. | Checked against its enclosing variables and the reader; Positive Q, nonzero denominator and the required rational-independence/closure conditions remain explicit. |
| A8: Layer 0, Approximation exponents and conjectures (63 declarations; exact list below) | Rational μ=1; rational polynomial exponent 0; simultaneous rational exponent ∞; empty tuple; Liouville input; golden ratio; exponent n=0. | Checked against its enclosing variables and the reader; The exceptional values distinguish the exponents. Bad approximation retains a positive constant; Littlewood and Schanuel remain propositions used as hypotheses. |
| A9: Layer 1, Coefficient length (21 declarations; exact list below) | Zero, constants and X+1; product (X+1)(X−1); generic normed ring versus scalar field; norm submultiplicativity. | Checked against its enclosing variables and the reader; Submultiplicative inequalities are not rewritten as coefficient-norm equalities for arbitrary rings. |
| A10: Layer 1, Univariate divided Wronskian (14 declarations; exact list below) | Empty determinant 1; (1,X,X²) gives 1 for Hasse and 2 for ordinary derivatives; (X,1) gives −1; characteristic 2. | Checked against its enclosing variables and the reader; Row order is derivative order and column order is function order. Added the two-term negative-sign witness. |
| A11: Layer 1, Univariate coefficient height (14 declarations; exact list below) | Zero polynomial; constants; scalar multiples; X+1 versus 2X+2; degree 0; characteristic-zero number fields. | Checked against its enclosing variables and the reader; It is the projective coefficient adapter to Finsupp.logHeight, not a new scalar-height carrier. |
| A12: Layer 1, Multivariate Hasse calculus (18 declarations; exact list below) | Empty variables; derivative order 0; X² at order 2; characteristic 2; additive and multiplicative Taylor expansions; overdegree jets. | Checked against its enclosing variables and the reader; Binomial coefficients fix divided derivatives; ordinary derivatives require the factorial comparison. |
| A13: Layer 1, Weighted index (17 declarations; exact list below) | Zero polynomial gives ∞; constant nonzero gives 0; X and X²; zero weights; empty variables; positive versus zero denominator. | Checked against its enclosing variables and the reader; Finiteness requires positive weights; zero-weight ENNReal division is not replaced by finite real division. |
| A14: Layer 1, Multivariate coefficient height (14 declarations; exact list below) | Constants and 0; nonzero scaling; (X+1)(X−1); degree-zero and empty-variable cases; coefficient embeddings. | Checked against its enclosing variables and the reader; Retain projective height, support/zero-extension comparisons and explicit nonzero factors where needed. |
| A15: Layer 1, Generalized Wronskians and auxiliary polynomials (43 declarations; exact list below) | One and empty families; dependent functions; nonzero polynomial order bound versus D³(X²)=0; degree 0; n=0 auxiliary system; Roth κ>2. | Checked against its enclosing variables and the reader; Nonzero and independence hypotheses remain; derivative order and height budgets are checked separately. Removed the second declaration of the central-binomial bound. |
| A16: Layer 1, Block linear jets (21 declarations; exact list below) | Zero and singleton blocks; γ≥β; overdegree monomials; residual degrees; linear substitution X↦2X; empty variables. | Checked against its enclosing variables and the reader; Coefficient pullback sums only contributing orders. Residual-degree nonnegativity and coordinate degree bounds prevent truncated-subtraction mistakes. |
| A17: Layer 2, General position and qualitative Subspace theorem (25 declarations; exact list below) | r<n vacuity; n=0/1; coordinates and coordinate sum over 𝔽₂; invertible versus singular maps; product thresholds and nonzero points. | Checked against its enclosing variables and the reader; No claim that the predicate automatically enforces r≥n. Theorems impose their own cardinality/independence conditions; corrected map and scalar API prose. |
| A18: Layer 2, p-adic approximation and determinant examples (14 declarations; exact list below) | Prime 2; support empty; zero point excluded; the three displayed real forms give +4√6 and −4√6 after one row swap. | Checked against its enclosing variables and the reader; The two determinant orders now have their actual signs in reader and Lean. |
| A19: Layer 2, Norm forms (8 declarations; exact list below) | Full conjugate norm versus an incomplete subproduct; degree 1/2; repeated factors; integer pair 0; nonzero norm right side. | Checked against its enclosing variables and the reader; Finiteness requires the full norm-form hypotheses; proper subproducts are not silently substituted. |
| A20: Layer 2, Nondegenerate unit solutions (21 declarations; exact list below) | Empty inhomogeneous tuple is false; empty homogeneous tuple true; full subsum 1 versus proper subsums; cancellation (1,−1); zero coefficient; n=1. | Checked against its enclosing variables and the reader; Homogeneous and inhomogeneous degeneracy use different subsum conventions; coefficient-nonzero conditions stay in the finiteness statements. |
| A21: Layer 2, Finite-rank groups and recurrences (25 declarations; exact list below) | Rank 0 torsion; arbitrary finite rank versus finite generation; characteristic p; order 0/1; roots ±i; repeated root 1 with u(n)=n; zero sequence. | Checked against its enclosing variables and the reader; Moved the recurrence closed form down from ClassicalArithmeticCompletion. The simple-root theorem is separate from nondegeneracy, which permits repeated roots. |
| A22: Layer 2, Normalized places and twisted height (19 declarations; exact list below) | Quadratic real place sends (2,4) to (√2,2); complex place to (2,4); zero/one to zero/one; ℚ inside an extension; 0 and scalar 2; weights (1/2,−1/2) at infinity; Q=1. | Checked against its enclosing variables and the reader; Use Tau Ceti’s unrooted place values then one degree root. Absolute and K-rational height targets are separate; projective scaling does not double height. |
| A23: Layer 2, Successive infima and threshold spaces (13 declarations; exact list below) | Index 0; i>n junk; coordinates with no weights; Q=1 and Q>1; weights (1/2,−1/2) give Q^(−1/2),Q^(1/2); first threshold span is e₁ at a strict gap. | Checked against its enclosing variables and the reader; Restrict monotonicity to i≤j≤n. Added three threshold-space checks; absolute descent remains a distinct target. |
| A24: Layer 2, Euclidean, Plücker and subspace heights (28 declarations; exact list below) | 0; vectors (1,1),(2,2),(3,4); empty wedge 1; identity determinant 1 and row swap −1; zero/whole space; (1,2) perpendicular to (−2,1). | Checked against its enclosing variables and the reader; Added direct vector-height, Plücker and orthogonal-complement examples. Whole and zero subspace height are 1, while zero vector height is 0. |
| A25: Layer 2, Weights and exceptional subspace (20 declarations; exact list below) | Zero weights; coordinate weights (−1,1); line (1,1) has weight −1, e₂ weight 1; weights (−1,0,1) select the plane, not e₃; n=0. | Checked against its enclosing variables and the reader; Independence, finite support and n≥1 precede uniqueness. Ratio maximization, supermodularity direction and invalid-data junk are explicit. |
| A26: Layer 2, Filtration and absolute quantitative interfaces (19 declarations; exact list below) | Dimension 0; c=0 gives [⊥,⊤] for n>0; dimension 2 diagonal slopes; equal slopes and incomplete flags; Q≥1; δ in (0,1]; R≥n. | Checked against its enclosing variables and the reader; Zero dimension has a singleton chain; typed results retain K-rational minima and existential thresholds. Reader specifies absolute minima, Davenport basis and the numerical thresholds separately. |
| A27: Layer 2, Sharp Roth, system transport and quantitative systems (7 declarations; exact list below) | m,N≥2; positive degrees; weak ≥ Euclidean-height premise versus the earlier strict version; determinant normalization; D=1 versus coefficient extension D>1. | Checked against its enclosing variables and the reader; The weak E96 formulation remains ≥. Full Galois transport and absolute system constants are named separately from the K-rational signatures. |
| A28: Layer 2, Integer grids and partial specialization (10 declarations; exact list below) | X³−X on a small grid; B=1/2; over 𝔽₂, X²−X at B=3; P=(X₀³−X₀)X₁² with a nonzero higher jet; variables empty. | Checked against its enclosing variables and the reader; Grid values alone cannot suffice. Characteristic zero and weighted jet budgets remain. Partial-specialization differentiation has the stated index direction. |
| A29: Layer 2, Conditional nonzero block extraction (9 declarations; exact list below) | F=X₁ restricted to (Y,0) is zero; constant block; degree-zero block; explicit nonzero restricted polynomial; replacement by a basis vector. | Checked against its enclosing variables and the reader; The result assumes actual nonzero restriction, rather than deriving it from F≠0. Degree-zero replacement preserves all values. |
| A30: Layer 2, Hyperplane heights and slices (28 declarations; exact list below) | Binary normal vector (a,b) versus (b,−a); zero extension; nonzero selected subvector; F=X+U along X=U gives coefficient 2; lowest outer degree. | Checked against its enclosing variables and the reader; The minimal-degree hypothesis is necessary for the coefficient identity. Hyperplane nonvanishing uses the full normal-height and sharp-Roth premises. |
| A31: Layer 2, Block homogenization (32 declarations; exact list below) | Empty blocks; polynomial X at degree 2; overdegree truncation; binary coordinate swap; affine jets; zero polynomial; support injection. | Checked against its enclosing variables and the reader; Bounded input degrees are required for reconstruction and coefficient-height preservation. The total operation filters overdegree monomials; Hasse jet formulas include residual block totals. |
| A32: Layer 3, Algebraic logarithms (16 declarations; exact list below) | 0; log 2; 2πi; conjugation; rational multiples; chosen branches versus principal range. | Checked against its enclosing variables and the reader; The submodule includes all logarithm branches, including nonprincipal logarithms of 1. |
| A33: Layer 3, Hermite integral and formal exponential sums (58 declarations; exact list below) | f=1 gives exp z−1; f=X at z=1 gives e−2; z=0; prime p=2; empty support; zero sum; permutations of conjugates. | Checked against its enclosing variables and the reader; Hermite’s endpoint exponential and both terms are retained. Divisibility uses prime and integrality hypotheses, not an arbitrary polynomial. |
| A34: Layer 3, Lindemann–Weierstrass and Schanuel proposition (11 declarations; exact list below) | Empty family; repeated exponent; algebraic independent arguments; 0; dependent (0) and (1,2); no conjectural axiom. | Checked against its enclosing variables and the reader; Exponential linear and algebraic independence are distinguished. Conditional consequences take the proposition explicitly. |
| A35: Layer 3, Analytic zero estimates and Gelfond–Schneider (19 declarations; exact list below) | Entire zero versus nonzero function; positive radii; repeated interpolation nodes; algebraic β∉ℚ; λ=2πi and λ=0 excluded; real versus complex branches. | Checked against its enclosing variables and the reader; Constants depend on fixed algebraic data before free parameters; logarithm and radius denominators have positive premises. |
| A36: Layer 3, Multivariate differential calculus and interpolation (22 declarations; exact list below) | Dimension 0 gives identity mixed derivative; z₀z₁ gives z₁ and 1; polydisc sup versus total order; finite Taylor box; nonpositive radius excluded. | Checked against its enclosing variables and the reader; Factorials, sup norms and ℓ¹ total multi-index orders remain separate; interpolation products retain their multiplicities. |
| A37: Layer 3, Schneider–Lang and Baker independence (10 declarations; exact list below) | Zero functions; multiplicatively dependent exponentials; logarithms log 2/log 4; algebraic coefficient tuple β≠0 but individual zero coordinates; characteristic zero. | Checked against its enclosing variables and the reader; Corrected the overly strong every-coordinate-nonzero hypothesis to β≠0 for the linear form. Function and value independence are separate statements. |
| A38: Layer 3, Archimedean logarithmic bounds (7 declarations; exact list below) | n=1; b=0 incompatible with nonzero form; positive A_j≥0.16; D≥1; fixed branches; real versus complex field; Λ versus exp(Λ)−1. | Checked against its enclosing variables and the reader; Matveev’s linear-form and multiplicative-form constants are not interchanged. The primary linear-form locator is flagged for re-opening below. |
| A39: Layer 3, p-adic logarithmic bounds (4 declarations; exact list below) | Prime 2; (1+4)²−1 has order 3, while (1+2)²−1 has order 3 rather than 2; b≥1; unit α; ramification versus residue degree. | Checked against its enclosing variables and the reader; The p=2 lifting-exponent hypothesis is 4∣a. Yu’s absolute-value base is the ideal norm, preserving the ordinary valuation direction. |
| A40: Layer 4, Rational S-units (14 declarations; exact list below) | 12/5 in U_{2,3,5}; 7 outside U_{2,3}; empty S includes −1; S={2,4} is not a prime-only height product. | Checked against its enclosing variables and the reader; Support is outside S; sign and prime-only hypotheses remain. Existing Mathlib S-units are used for the comparison. |
| A41: Layer 4, Balancing units and bounded divisors (18 declarations; exact list below) | Degree 1 and rank 0; torsion units; α=0 excluded for divisor finiteness; α=1; full-rank log lattice; reciprocal conjugates with d−1 denominator. | Checked against its enclosing variables and the reader; Retain d≥2 when d−1 occurs and maximal-rank units for balancing. Infinitude of units is imported, not planned again. |
| A42: Layer 4, Exponential equations and unit-equation bounds (8 declarations; exact list below) | Bases ≥2; nonzero right side k; x=y and degenerate differences; positive logarithmic parameters; units versus nonunits. | Checked against its enclosing variables and the reader; Nonzero differences are needed for Baker bounds; constants and logarithmic inversion domains remain explicit. |
| A43: Layer 4, Thue and superelliptic reductions (11 declarations; exact list below) | Degree 0/1/2 excluded where needed; repeated roots; nonzero RHS; Siegel three-root identity; y=0,±1 and exponent 0. | Checked against its enclosing variables and the reader; Schinzel–Tijdeman excludes y=0,±1 and uses separable degree≥2. Equation-specific bounds retain the hypotheses in the reduction. |
| A44: Layer 4, S-unit and Thue–Mahler reductions (11 declarations; exact list below) | Empty prime set; p=2; integer valuation versus multiplicative valuation; rank 0; root of unity; zero divisor; primitive pair. | Checked against its enclosing variables and the reader; Multiplicative valuation inequalities have the reverse ordinary-valuation direction. Nonzero integral divisors, coefficient rank and primitive-pair assumptions remain. |
| A45: Layer 5, Analytic systems and holonomic equations (25 declarations; exact list below) | System size 0; disk radius 0 excluded; leading coefficient zero; least order 0 iff f=0; exp has no minimal singularity; artificial equation (z−1)(f′−f)=0. | Checked against its enclosing variables and the reader; Solution carriers restrict to the stated disk; D-finite arithmetic coefficients and minimal-equation singularities are distinct. Apparent singularity uses an entire local basis target. |
| A46: Layer 5, E-functions (16 declarations; exact list below) | Zero; exp with a_n=1; exp(z²) arithmetic growth failure; a_n=n! fails denominator/growth; number-field conjugates and all coefficients. | Checked against its enclosing variables and the reader; E normalization is a_n/n!. Hurwitz multiplication carries the binomial factor; analytic and arithmetic closure both appear. |
| A47: Layer 5, G-functions and scaled system iterates (28 declarations; exact list below) | Zero; geometric series; exp with coefficients 1/n! fails geometric denominator bound; T=1,M=1 gives P₂=1/2; T=1−z,M=1 gives P_m=1; T=0 excluded. | Checked against its enclosing variables and the reader; The scaled recurrence includes −mT′ and division by m+1; factorial-sized least common denominators fail Galochkin’s geometric requirement. |
| A48: Layer 5, Specialisation and E/G differential arithmetic (15 declarations; exact list below) | Order 0; rank 0; coefficient field versus ℚ̄; functional dependence and denominator clearing; α=0 and singular points; exp and the Laplace transform 1/(x−1). | Checked against its enclosing variables and the reader; Corrected Laplace transfer with the initial-value term: x/(x−1)−1=1/(x−1). Full operator transfer is named in the closing list; fibre dimension is new, native dimension facts are suppliers. |
| A49: Layer 5, Mahler functions and values (25 declarations; exact list below) | q=1 excluded; q=2 lacunary series; polynomial constants; exp is not Mahler; empty system; iterate α²=1/2 causes a pole although α itself is ordinary. | Checked against its enclosing variables and the reader; Regularity tests every forward iterate. Unit polynomial determinant is sufficient; scalar-value dichotomy requires an algebraic point and a convergent value. |
| A50: Layer 5, Modular values (3 declarations; exact list below) | τ=i; E₆(i)=0; E₂(i)=3/π; q(i)=exp(−2π); at least three independent elements versus all four. | Checked against its enclosing variables and the reader; Do not strengthen Nesterenko to independence of the entire four-tuple. |
| A51: Layer 5, Algebraic Cartan calculus (18 declarations; exact list below) | d(1)=0; d(t)=dt; d(t du)=−d(u dt); D=0; D(t)=1 gives L_D(tdt)=dt; Euler D(t)=t gives 2tdt; D′(t)=t fixes 1−1=0 bracket evaluation. | Checked against its enclosing variables and the reader; Added exterior differential and Lie derivative APIs with tests after reading Kirby Lemma 3.2. Removed contraction as a new target because Mathlib’s contractLeft already supplies it. |
| A52: Layer 5, Ax–Schanuel (9 declarations; exact list below) | No derivations; constant x; empty tuple; y=0 excluded; dependent arguments; common constants versus an arbitrary subfield; formal series constant terms. | Checked against its enclosing variables and the reader; Common-constant identification, nonzero y and independence modulo constants remain. Multivariate formal exponential and constant-field interface is a separate reader target. |
| A53: Layer 5, Conditional algebraic independence (12 declarations; exact list below) | n=0; z=1; dependent (1,2) gives transcendence degree 1; iπ; log 2/log 4 dependent; log 2/log 3 under conjecture. | Checked against its enclosing variables and the reader; Every conditional theorem takes Schanuel or the logarithms conjecture as a hypothesis; no axiom is introduced. |

## Validation and next step

- `python3 scripts/check_blueprint.py research/blueprint/packets/DiophantineApproximationAndTranscendence.json`: 0 errors, 0 warnings, 398 nodes; input unchanged. Its 35 inherited proof-granularity gap records remain in the accepted input, not as placeholder declarations in the package.
- `lean-check research/blueprint/packages/DiophantineApproximationAndTranscendence/Suggested.lean`: exit 0; 876 warnings, all `declaration uses sorry`. The final substantive pass includes the quadratic-place normalization, threshold-space, vector-height, Plücker, orthogonal and bracket examples (966 declarations, 271 examples). Available memory exceeded the 20 GB floor; only the prescribed shared build was used. No Lean server or Lake build/update/cache command was started.
- All four deliverables pass `python3 research/blueprint/intake.py check-files` with 0 problems. No private filesystem paths, catalogue/process residue in the reader, packet edits, or other job’s deliverables.
- README size and final file digests are recorded below. The original 203 Check keys are represented, and the file has additional computed negative controls and Cartan checks.

Next is an independent package review, especially the flagged Matveev and Yang locators, the absolute/K-rational boundary, and the moved recurrence owner. Nothing remains for another package-writing worker; there is no checkpoint or second claim. This handoff preserves the facts needed after scratch deletion.

## Declaration inventory for the adversarial pass

Names below omit the outer `TauCetiRoadmap.DiophantineApproximationAndTranscendence` namespace. Unnamed tests are identified by their lines in the submitted file. The inventory is a coverage index for the manually performed pass, not a replacement for reading the statements.

### A1: Primitive polynomial

`DiophantineApproximation.primitiveMinpoly`, `DiophantineApproximation.aeval_primitiveMinpoly`, `DiophantineApproximation.isPrimitive_primitiveMinpoly`, `DiophantineApproximation.leadingCoeff_primitiveMinpoly_pos`, `DiophantineApproximation.irreducible_primitiveMinpoly`, `DiophantineApproximation.natDegree_primitiveMinpoly`, `DiophantineApproximation.map_primitiveMinpoly`, `DiophantineApproximation.primitiveMinpoly_dvd_iff`, `DiophantineApproximation.primitiveMinpoly_eq_of_isPrimitive`, `DiophantineApproximation.primitiveMinpoly_eq_minpoly_int`, `DiophantineApproximation.primitiveMinpoly_ratCast`, `DiophantineApproximation.primitiveMinpoly_map`, `DiophantineApproximation.primitiveMinpoly_eq_of_minpoly_eq`, `DiophantineApproximation.primitiveMinpoly_of_not_isAlgebraic`, `DiophantineApproximation.isIntegral_leadingCoeff_primitiveMinpoly_smul`, `DiophantineApproximation.natDenominator_dvd_leadingCoeff_primitiveMinpoly`.

Examples at Suggested.lean lines 109, 111, 115, 119, 121, 123.

### A2: Naive height

`DiophantineApproximation.naiveHeight`, `DiophantineApproximation.naiveHeight_eq_iSup`, `DiophantineApproximation.one_le_naiveHeight`, `DiophantineApproximation.naiveHeight_inv`, `DiophantineApproximation.naiveHeight_map`, `DiophantineApproximation.naiveHeight_eq_of_minpoly_eq`, `DiophantineApproximation.inv_naiveHeight_add_one_le_norm`, `DiophantineApproximation.norm_le_naiveHeight_add_one`, `DiophantineApproximation.natDenominator_le_naiveHeight`, `DiophantineApproximation.naiveHeight_intCast`, `DiophantineApproximation.naiveHeight_ratCast`.

Examples at Suggested.lean lines 162, 164, 166, 168, 170.

### A3: Mahler measure

`DiophantineApproximation.mahlerMeasure`, `DiophantineApproximation.mahlerMeasure_eq_leadingCoeff_mul_prod`, `DiophantineApproximation.one_le_mahlerMeasure`, `DiophantineApproximation.leadingCoeff_le_mahlerMeasure`, `DiophantineApproximation.mahlerMeasure_ratCast`, `DiophantineApproximation.mahlerMeasure_inv`, `DiophantineApproximation.mahlerMeasure_map`, `DiophantineApproximation.mahlerMeasure_eq_of_minpoly_eq`, `DiophantineApproximation.mahlerMeasure_eq_one_iff`, `DiophantineApproximation.finite_setOf_mahlerMeasure_le`.

Examples at Suggested.lean lines 219, 221, 223, 225, 227, 229.

### A4: House

`DiophantineApproximation.house`, `DiophantineApproximation.house_eq_numberField_house`, `DiophantineApproximation.house_nonneg`, `DiophantineApproximation.norm_le_house`, `DiophantineApproximation.house_map`, `DiophantineApproximation.house_eq_of_minpoly_eq`, `DiophantineApproximation.house_mul_le`, `DiophantineApproximation.house_add_le`, `DiophantineApproximation.house_pow`, `DiophantineApproximation.house_ratCast`, `DiophantineApproximation.one_le_house`, `DiophantineApproximation.house_eq_one_iff`, `DiophantineApproximation.house_le_mahlerMeasure`, `DiophantineApproximation.mahlerMeasure_le_leadingCoeff_mul_max_one_house_pow`.

Examples at Suggested.lean lines 286, 288, 290, 292, 294, 296.

### A5: Height comparisons and finiteness

`DiophantineApproximation.prod_infinitePlace_comap_pow_mult`, `DiophantineApproximation.mulHeight_algebraMap`, `DiophantineApproximation.mulHeight₁_algebraMap`, `DiophantineApproximation.mulHeight_ringEquiv`, `DiophantineApproximation.absMulHeight₁_eq_rpow`, `DiophantineApproximation.absMulHeight₁_eq_of_minpoly_eq`, `DiophantineApproximation.gaussNorm_map_eq_one_of_isPrimitive`, `DiophantineApproximation.finitePlace_leadingCoeff_mul_prod_max_eq_one`, `DiophantineApproximation.mahlerMeasure_eq_absMulHeight₁_pow`, `DiophantineApproximation.naiveHeight_le_choose_mul_mahlerMeasure`, `DiophantineApproximation.mahlerMeasure_le_sqrt_mul_naiveHeight`, `DiophantineApproximation.naiveHeight_absMulHeight₁_comparison`, `DiophantineApproximation.finite_setOf_naiveHeight_le`, `DiophantineApproximation.finite_setOf_absMulHeight₁_le`, `DiophantineApproximation.choose_half_mul_sqrt_le_two_pow`, `DiophantineApproximation.gelfond_inequality`, `DiophantineApproximation.naiveHeight_le_two_mul_house_pow`, `DiophantineApproximation.finite_setOf_isIntegral_house_le`, `DiophantineApproximation.natDenominator_zpow_mul_house_zpow_le_norm`, `DiophantineApproximation.natDenominator_zpow_mul_house_zpow_le_norm_embedding`.

No unnamed examples in this group.

### A6: Siegel estimate

`DiophantineApproximation.eq_zero_of_forall_abs_re_im_le`, `DiophantineApproximation.exists_ne_zero_int_vec_abs_le_of_house_le`.

No unnamed examples in this group.

### A7: Dirichlet and Kronecker

`DiophantineApproximation.dirichlet_linearForms`, `DiophantineApproximation.dirichlet_linearForms_infinite`, `DiophantineApproximation.simultaneous_dirichlet`, `DiophantineApproximation.simultaneous_dirichlet_infinite`, `DiophantineApproximation.dirichlet_linearForm_infinite`, `DiophantineApproximation.irrational_of_tendsto_abs_sub`, `DiophantineApproximation.kronecker_approximation`.

No unnamed examples in this group.

### A8: Approximation exponents and conjectures

`DiophantineApproximation.irrationalityExponent`, `DiophantineApproximation.one_le_irrationalityExponent`, `DiophantineApproximation.le_irrationalityExponent_of_liouvilleWith`, `DiophantineApproximation.liouvilleWith_of_lt_irrationalityExponent`, `DiophantineApproximation.irrationalityExponent_eq_iSup_infinite`, `DiophantineApproximation.irrationalityExponent_eq_top_iff`, `DiophantineApproximation.irrationalityExponent_ratCast`, `DiophantineApproximation.two_le_irrationalityExponent_iff`, `DiophantineApproximation.irrationalityExponent_add_ratCast`, `DiophantineApproximation.irrationalityExponent_ratCast_mul`, `DiophantineApproximation.irrationalityExponent_neg`, `DiophantineApproximation.ae_irrationalityExponent_eq_two`, `DiophantineApproximation.linearFormExponent`, `DiophantineApproximation.mahlerExponent`, `DiophantineApproximation.linearFormExponent_one_add`, `DiophantineApproximation.le_linearFormExponent_of_infinite`, `DiophantineApproximation.mahlerExponent_mono`, `DiophantineApproximation.simultaneousExponent`, `DiophantineApproximation.simultaneousExponent_one_add`, `DiophantineApproximation.simultaneousExponent_eq_top_of_forall_rat`, `DiophantineApproximation.simultaneousExponent_le_comp`, `DiophantineApproximation.algebraicApproximationExponent`, `DiophantineApproximation.algebraicApproximation_infinite_iff_allow_eq`, `DiophantineApproximation.algebraicApproximationExponent_one_add`, `DiophantineApproximation.algebraicApproximationExponent_mono`, `DiophantineApproximation.inv_le_simultaneousExponent`, `DiophantineApproximation.natCast_le_linearFormExponent`, `DiophantineApproximation.algebraicApproximationExponent_le_mahlerExponent`, `DiophantineApproximation.one_div_den_mul_add_lt_abs_sub_convergent`, `DiophantineApproximation.irrationalityExponent_eq_one_add_limsup`, `DiophantineApproximation.BadlyApproximable`, `DiophantineApproximation.badlyApproximable_of_natDegree_minpoly_eq_two`, `DiophantineApproximation.BadlyApproximable.irrationalityExponent_eq`, `DiophantineApproximation.BadlyApproximable.not_liouville`, `DiophantineApproximation.BadlyApproximable.add_ratCast`, `DiophantineApproximation.BadlyApproximable.ratCast_mul`, `DiophantineApproximation.LittlewoodConjecture`, `DiophantineApproximation.littlewood_of_not_badlyApproximable`, `DiophantineApproximation.infinite_setOf_mul_le_one`.

Examples at Suggested.lean lines 539, 541, 543, 545, 575, 577, 579, 581, 603, 605, 607, 609, 634, 636, 638, 640, 644, 702, 704, 706, 708, 726, 730, 734.

### A9: Coefficient length

`Polynomial.l1Norm`, `Polynomial.l1Norm_zero`, `Polynomial.l1Norm_nonneg`, `Polynomial.l1Norm_eq_sum_range`, `Polynomial.l1Norm_C`, `Polynomial.l1Norm_monomial`, `Polynomial.l1Norm_neg`, `Polynomial.norm_coeff_le_l1Norm`, `Polynomial.supNorm_le_l1Norm`, `Polynomial.l1Norm_le_mul_supNorm`, `Polynomial.l1Norm_eq_zero_iff`, `Polynomial.mahlerMeasure_le_l1Norm`, `Polynomial.l1Norm_add_le`, `Polynomial.l1Norm_mul_le`, `Polynomial.norm_eval_le_l1Norm_mul`, `Polynomial.l1Norm_taylor_le`, `Polynomial.l1Norm_hasseDeriv_le`.

Examples at Suggested.lean lines 820, 822, 825, 828.

### A10: Univariate divided Wronskian

`Polynomial.hasseWronskian`, `Polynomial.hasseWronskian_fin_two`, `Polynomial.hasseWronskian_fin_zero`, `Polynomial.hasseWronskian_fin_one`, `Polynomial.prod_factorial_mul_hasseWronskian`, `Polynomial.hasseWronskian_eq_zero_of_not_linearIndependent`, `Polynomial.hasseWronskian_comp_perm`, `Polynomial.hasseWronskian_map`, `Polynomial.linearIndependent_iff_hasseWronskian_ne_zero`.

Examples at Suggested.lean lines 871, 873, 875, 877, 881.

### A11: Univariate coefficient height

`Polynomial.logHeight`, `Polynomial.logHeight_nonneg`, `Polynomial.logHeight_zero`, `Polynomial.logHeight_C_mul`, `Polynomial.logHeight_X_sub_C`, `Polynomial.logHeight_toMvPolynomial`, `Polynomial.choose_half_mul_choose_half_le`, `Polynomial.supNorm_mul_supNorm_le`, `Polynomial.logHeight_add_logHeight_le`, `Polynomial.rootMultiplicity_mul_logHeight₁_le`.

Examples at Suggested.lean lines 917, 919, 922, 925.

### A12: Multivariate Hasse calculus

`MvPolynomial.hasseDeriv`, `MvPolynomial.hasseDeriv_monomial`, `MvPolynomial.coeff_hasseDeriv`, `MvPolynomial.hasseDeriv_zero`, `MvPolynomial.factorial_smul_hasseDeriv_single`, `MvPolynomial.hasseDeriv_hasseDeriv`, `MvPolynomial.hasseDeriv_mul`, `MvPolynomial.hasseDeriv_eq_zero_of_degreeOf_lt`, `MvPolynomial.degreeOf_hasseDeriv_le`, `MvPolynomial.map_hasseDeriv`, `MvPolynomial.hasseDeriv_single_toMvPolynomial`, `MvPolynomial.eval_add_eq_finsum_hasseDeriv`, `MvPolynomial.abv_coeff_hasseDeriv_le`, `MvPolynomial.abv_coeff_hasseDeriv_le_of_isNonarchimedean`.

Examples at Suggested.lean lines 1030, 1033, 1036, 1040.

### A13: Weighted index

`MvPolynomial.weightedIndex`, `MvPolynomial.weightedIndex_zero`, `MvPolynomial.le_weightedIndex_iff`, `MvPolynomial.weightedIndex_eq_zero_iff`, `MvPolynomial.weightedIndex_ne_top`, `MvPolynomial.weightedIndex_le_sum_degreeOf`, `MvPolynomial.weightedIndex_map`, `MvPolynomial.weightedIndex_mul`, `MvPolynomial.min_weightedIndex_le_weightedIndex_add`, `MvPolynomial.weightedIndex_le_weightedIndex_hasseDeriv_add`, `MvPolynomial.weightedIndex_rename`, `MvPolynomial.weightedIndex_smul_weights`, `MvPolynomial.weightedIndex_toMvPolynomial`.

Examples at Suggested.lean lines 1118, 1120, 1124, 1127.

### A14: Multivariate coefficient height

`MvPolynomial.logHeight`, `MvPolynomial.logHeight_nonneg`, `MvPolynomial.logHeight_zero`, `MvPolynomial.logHeight_C_mul`, `MvPolynomial.logHeight_C`, `MvPolynomial.logHeight_rename`, `MvPolynomial.logHeight_eq_of_numberField`, `MvPolynomial.logHeight_mul_of_disjoint_vars`, `MvPolynomial.logHeight_map_intCast_le`, `MvPolynomial.abv_coeff_prod_le`.

Examples at Suggested.lean lines 1176, 1178, 1181, 1184.

### A15: Generalized Wronskians and auxiliary polynomials

`MvPolynomial.genWronskian`, `MvPolynomial.genWronskian_eq_zero_of_not_linearIndependent`, `MvPolynomial.genWronskian_fin_zero`, `MvPolynomial.genWronskian_fin_one`, `MvPolynomial.degreeOf_genWronskian_le`, `MvPolynomial.map_genWronskian`, `MvPolynomial.genWronskian_single_toMvPolynomial`, `MvPolynomial.linearIndependent_aeval_kronecker_iff`, `MvPolynomial.exists_iterate_derivative_aeval_kronecker`, `MvPolynomial.linearIndependent_iff_exists_genWronskian_ne_zero`, `MvPolynomial.exists_sum_mul_linearIndependent`, `MvPolynomial.genWronskian_mul_genWronskian`, `MvPolynomial.logHeight_det_hasseDeriv_le`, `DiophantineApproximation.sum_max_sub_div_ge`, `DiophantineApproximation.roth_lemma`, `DiophantineApproximation.abs_eval_homogenize_le`, `DiophantineApproximation.liouville_explicit`, `DiophantineApproximation.exists_thue_auxiliary_polynomials`, `DiophantineApproximation.minpoly_pow_dvd_of_X_sub_C_pow_dvd`, `DiophantineApproximation.exists_hasseDeriv_eval_ne`, `DiophantineApproximation.thue_remainder_bounds`, `DiophantineApproximation.thue_gap_principle`, `DiophantineApproximation.thue_approximation`, `DiophantineApproximation.card_filter_sum_div_le`, `DiophantineApproximation.exists_roth_auxiliary_polynomial`, `DiophantineApproximation.exists_rapidly_increasing_heights`, `DiophantineApproximation.roth_weights_spec`, `DiophantineApproximation.exists_hasseDeriv_eval_ne_zero`, `DiophantineApproximation.log_abs_eval_le`, `DiophantineApproximation.neg_sum_log_den_le_log_abs_eval`, `DiophantineApproximation.roth`, `DiophantineApproximation.roth_lower_bound`, `DiophantineApproximation.roth_lower_bound_of_isAlgebraic`, `DiophantineApproximation.not_liouvilleWith_of_isAlgebraic`, `DiophantineApproximation.transcendental_tsum_inv_pow_three_pow`, `DiophantineApproximation.exists_linear_factorisation`, `DiophantineApproximation.binary_form_lower_bound`, `DiophantineApproximation.exists_squarefree_dvd`, `DiophantineApproximation.thue_equation_finite`.

Examples at Suggested.lean lines 1236, 1239, 1242, 1246.

### A16: Block linear jets

`MvPolynomial.block_sum_eq_of_coeff_linear_monomial_ne_zero`, `MvPolynomial.hasseDeriv_eval₂_blockLinear`, `MvPolynomial.exists_nonzero_hasseDeriv_of_blockLinear`, `MvPolynomial.degreeOf_eval₂_blockLinear_le`, `MvPolynomial.hasseDeriv_block_degrees`, `MvPolynomial.block_degree_eq_zero_of_eval_ne_zero`, `MvPolynomial.eval_eq_of_eq_on_nonzero_degree_blocks`.

Examples at Suggested.lean lines 1611, 1614, 1617, 1621, 1625, 1630, 1633, 1637, 1640, 1645, 1647, 1650, 1653, 1658.

### A17: General position and qualitative Subspace theorem

`DiophantineApproximation.InGeneralPosition`, `DiophantineApproximation.InGeneralPosition.linearIndependent`, `DiophantineApproximation.inGeneralPosition_iff_det_ne_zero`, `DiophantineApproximation.inGeneralPosition_iff_linearIndependent`, `DiophantineApproximation.inGeneralPosition_two_iff`, `DiophantineApproximation.InGeneralPosition.comp_injective`, `DiophantineApproximation.InGeneralPosition.smul`, `DiophantineApproximation.InGeneralPosition.map`, `DiophantineApproximation.InGeneralPosition.comp_matrix`, `DiophantineApproximation.inGeneralPosition_coords_add_sum`, `DiophantineApproximation.exists_abv_le_mul_iSup_of_linearIndependent`, `DiophantineApproximation.exists_absoluteValue_eq_padicNorm`, `DiophantineApproximation.exists_absoluteValue_eq_abs`, `DiophantineApproximation.exists_ringHom_padicAlgCl_of_eq_padicNorm`, `DiophantineApproximation.exists_ringHom_complex_of_eq_abs`, `DiophantineApproximation.exists_eq_pm_prod_zpow_iff`, `DiophantineApproximation.subspace_theorem`, `DiophantineApproximation.subspace_theorem_general_position`.

Examples at Suggested.lean lines 1740, 1743, 1746, 1750, 1754, 1759, 1764.

### A18: p-adic approximation and determinant examples

`DiophantineApproximation.padic_subspace_theorem`, `DiophantineApproximation.padic_subspace_theorem_general_position`, `DiophantineApproximation.exists_finite_simplex_discretisation`, `DiophantineApproximation.exists_finite_systems_of_product_inequality`, `DiophantineApproximation.padic_roth`, `DiophantineApproximation.exists_exceptional_subspaces_general_position`, `DiophantineApproximation.infinite_solutions_of_form_vanishes`, `DiophantineApproximation.formsExample75`, `DiophantineApproximation.infinite_solutions_example75`, `DiophantineApproximation.finite_two_forms_strict`, `DiophantineApproximation.roth_of_subspace_theorem`, `DiophantineApproximation.exists_infinite_small_linear_form`, `DiophantineApproximation.finite_small_linear_form`, `DiophantineApproximation.finite_approximation_bounded_degree`.

No unnamed examples in this group.

### A19: Norm forms

`DiophantineApproximation.linearIndependent_embeddingVectors`, `DiophantineApproximation.inGeneralPosition_normFormFactors`, `DiophantineApproximation.finite_normForm_of_symmetric`, `DiophantineApproximation.infinite_normForm_of_containsScaledOrder`, `DiophantineApproximation.schmidt_normForm`, `DiophantineApproximation.exists_linear_factors_of_squarefree`, `DiophantineApproximation.finite_thueMahler`, `DiophantineApproximation.finite_two_term_unit_equation_rat`.

No unnamed examples in this group.

### A20: Nondegenerate unit solutions

`DiophantineApproximation.IsNondegenerateSolution`, `DiophantineApproximation.IsNondegenerateSolution.sum_eq_one`, `DiophantineApproximation.IsNondegenerateSolution.subsum_ne_zero`, `DiophantineApproximation.IsNondegenerateSolution.ne_zero`, `DiophantineApproximation.IsNondegenerateSolution.map`, `DiophantineApproximation.IsNondegenerateSolution.restrict`, `DiophantineApproximation.isNondegenerateSolution_of_subsingleton`, `DiophantineApproximation.IsNondegenerateHomogeneousSolution`, `DiophantineApproximation.IsNondegenerateHomogeneousSolution.sum_eq_zero`, `DiophantineApproximation.IsNondegenerateHomogeneousSolution.smul`, `DiophantineApproximation.isNondegenerateHomogeneousSolution_iff_cons`, `DiophantineApproximation.IsNondegenerateHomogeneousSolution.merge`, `DiophantineApproximation.IsNondegenerateHomogeneousSolution.ne_zero`.

Examples at Suggested.lean lines 2079, 2083, 2087, 2091, 2143, 2147, 2151, 2156.

### A21: Finite-rank groups and recurrences

`DiophantineApproximation.exists_subspaces_homogeneous_unit_equation`, `DiophantineApproximation.exists_ratio_set`, `DiophantineApproximation.exists_ratio_set_of_nondegenerate`, `DiophantineApproximation.finite_nondegenerate_solutions_rat`, `DiophantineApproximation.nonempty_specialization`, `DiophantineApproximation.exists_subspaces_unit_equation_algebraic`, `DiophantineApproximation.card_nondegenerate_solutions_le`, `DiophantineApproximation.finite_nondegenerate_solutions`, `DiophantineApproximation.finite_two_term_unit_equation`, `DiophantineApproximation.LinearRecurrence.IsNondegenerate`, `DiophantineApproximation.LinearRecurrence.IsNondegenerate.root_ne_zero`, `DiophantineApproximation.LinearRecurrence.IsNondegenerate.not_isOfFinOrder_div`, `DiophantineApproximation.LinearRecurrence.IsNondegenerate.of_dvd`, `DiophantineApproximation.LinearRecurrence.isNondegenerate_iff_pow`, `DiophantineApproximation.LinearRecurrence.isNondegenerate_of_order_le_one`, `DiophantineApproximation.finite_zeros_simple_exponential_polynomial`, `DiophantineApproximation.skolem_mahler_lech_simple`, `DiophantineApproximation.zeros_simple_recurrence_eq_union`, `DiophantineApproximation.ncard_zeros_simple_recurrence_le`, `DiophantineApproximation.closedFormRecurrence`.

Examples at Suggested.lean lines 2276, 2279, 2283, 2286, 2330.

### A22: Normalized places and twisted height

`DiophantineApproximation.Place`, `DiophantineApproximation.normAbs`, `DiophantineApproximation.twistedHeight`, `DiophantineApproximation.coordForms`, `DiophantineApproximation.twistedHeight_zero`, `DiophantineApproximation.twistedHeight_pos`, `DiophantineApproximation.twistedHeight_smul`, `DiophantineApproximation.twistedHeight_coords_zero`, `DiophantineApproximation.twistedHeight_shift`, `DiophantineApproximation.twistedHeight_comp`, `DiophantineApproximation.twistedHeight_one`, `DiophantineApproximation.cExample`.

Examples at Suggested.lean lines 2346, 2350, 2354, 2422, 2427, 2432, 2437.

### A23: Successive infima and threshold spaces

`DiophantineApproximation.rationalSuccessiveInfimum`, `DiophantineApproximation.rationalInfimumSpace`, `DiophantineApproximation.rationalSuccessiveInfimum_mono`, `DiophantineApproximation.rationalSuccessiveInfimum_nonneg`, `DiophantineApproximation.finrank_rationalInfimumSpace_of_lt`, `DiophantineApproximation.rationalSuccessiveInfimum_coords_zero`.

Examples at Suggested.lean lines 2477, 2481, 2485, 2491, 2497, 2500, 2503.

### A24: Euclidean, Plücker and subspace heights

`DiophantineApproximation.height2`, `DiophantineApproximation.plucker`, `DiophantineApproximation.subspaceHeight`, `DiophantineApproximation.dotOrthogonal`, `DiophantineApproximation.subspaceHeight_bot`, `DiophantineApproximation.subspaceHeight_top`, `DiophantineApproximation.subspaceHeight_span_singleton`, `DiophantineApproximation.subspaceHeight_le_prod`, `DiophantineApproximation.subspaceHeight_orthogonal`, `DiophantineApproximation.subspaceHeight_inf_mul_sup_le`, `DiophantineApproximation.one_le_subspaceHeight`, `DiophantineApproximation.finite_subspaceHeight_le`, `DiophantineApproximation.subspaceHeight_rat_eq_covolume`.

Examples at Suggested.lean lines 2518, 2521, 2524, 2527, 2530, 2533, 2536, 2553, 2556, 2559, 2610, 2614, 2618, 2624, 2628.

### A25: Weights and exceptional subspace

`DiophantineApproximation.localWeight`, `DiophantineApproximation.weight`, `DiophantineApproximation.weightRatio`, `DiophantineApproximation.exists_exceptionalSubspace`, `DiophantineApproximation.exceptionalSubspace`, `DiophantineApproximation.weight_bot`, `DiophantineApproximation.weight_top`, `DiophantineApproximation.weight_inf_add_weight_sup`, `DiophantineApproximation.exceptionalSubspace_ne_top`, `DiophantineApproximation.exceptionalSubspace_spec`, `DiophantineApproximation.exceptionalSubspace_eq_bot_iff`, `DiophantineApproximation.exceptionalSubspace_shift`, `DiophantineApproximation.exceptionalSubspace_comp`, `DiophantineApproximation.exceptionalSubspace_coords_sum`, `DiophantineApproximation.cExample'`, `DiophantineApproximation.cExample3`.

Examples at Suggested.lean lines 2729, 2736, 2740, 2750.

### A26: Filtration and absolute quantitative interfaces

`DiophantineApproximation.twistedFiltration`, `DiophantineApproximation.twistedFiltration_head`, `DiophantineApproximation.twistedFiltration_last`, `DiophantineApproximation.twistedFiltration_chain`, `DiophantineApproximation.twistedFiltration_penultimate`, `DiophantineApproximation.twistedFiltration_vertices`, `DiophantineApproximation.twistedFiltration_slope_antitone`, `DiophantineApproximation.deltaL`, `DiophantineApproximation.IsTwistedData`, `DiophantineApproximation.exists_subspace_gap_principle`, `DiophantineApproximation.parametric_subspace_theorem`, `DiophantineApproximation.interval_result`, `DiophantineApproximation.interval_result_semistable`, `DiophantineApproximation.subspaceHeight_twistedFiltration_le`, `DiophantineApproximation.sharp_roths_lemma`.

Examples at Suggested.lean lines 2809, 2813, 2817, 2821.

### A27: Sharp Roth, system transport and quantitative systems

`DiophantineApproximation.exists_ne_zero_height2_le`, `DiophantineApproximation.nonvanishing_on_grids`, `DiophantineApproximation.systemExponents`, `DiophantineApproximation.systemForms`, `DiophantineApproximation.twistedHeight_le_of_system`, `DiophantineApproximation.subspace_theorem_for_systems`, `DiophantineApproximation.exists_subspace_interval_refinement`.

No unnamed examples in this group.

### A28: Integer grids and partial specialization

`DiophantineApproximation.grid_floor_capacity`, `Polynomial.exists_int_grid_hasseDeriv_ne_zero`, `MvPolynomial.hasseDeriv_partial_specialization`, `MvPolynomial.exists_int_partial_grid_jet`, `MvPolynomial.exists_rectangular_int_grid_jet`.

Examples at Suggested.lean lines 3040, 3046, 3053, 3101, 3108.

### A29: Conditional nonzero block extraction

`DiophantineApproximation.block_jet_weight_budget`, `DiophantineApproximation.exists_nonzero_block_grid_same_eval`, `DiophantineApproximation.exists_nonzero_block_grid_jet_of_restriction`.

Examples at Suggested.lean lines 3183, 3185, 3188, 3193, 3198, 3201.

### A30: Hyperplane heights and slices

`DiophantineApproximation.height2_zero_extension`, `DiophantineApproximation.height2_comp_le`, `DiophantineApproximation.height2_smul`, `DiophantineApproximation.height2_pair_swap_neg`, `DiophantineApproximation.height2_le_prod_pairs`, `DiophantineApproximation.exists_large_height2_pair`, `DiophantineApproximation.height2_coeff_monomial_mul`, `DiophantineApproximation.height2_sumAlgEquiv_coeff_le`, `MvPolynomial.hasseDeriv_sumAlgEquiv_coeff`, `MvPolynomial.coeff_eval₂_affine_of_min_degree`, `MvPolynomial.block_degrees_sumAlgEquiv_coeff`, `MvPolynomial.exists_binary_slice_vanishing`, `MvPolynomial.block_degrees_monomial_mul`, `DiophantineApproximation.nonvanishing_on_hyperplanes`, `DiophantineApproximation.exists_normal_height2`, `DiophantineApproximation.exists_nonzero_hyperplane_jet_restriction`.

Examples at Suggested.lean lines 3376, 3379, 3382, 3385, 3387, 3395, 3400, 3407, 3412, 3419, 3422, 3425.

### A31: Block homogenization

`MvPolynomial.blockHomogenize`, `MvPolynomial.blockHomogenize_zero`, `MvPolynomial.blockHomogenize_add`, `MvPolynomial.blockHomogenize_smul`, `MvPolynomial.blockHomogenize_map`, `MvPolynomial.blockHomogenize_monomial`, `MvPolynomial.blockHomogenize_C`, `MvPolynomial.blockHomogenize_one`, `MvPolynomial.blockHomogenize_degree_zero`, `MvPolynomial.coeff_blockHomogenize`, `MvPolynomial.bijOn_support_blockHomogenize`, `MvPolynomial.aeval_blockHomogenize_one_X`, `MvPolynomial.rename_blockHomogenize_unique`, `MvPolynomial.isWeightedHomogeneous_blockHomogenize`, `MvPolynomial.blockHomogenize_aeval_one_X`, `MvPolynomial.blockHomogenize_centered_taylor`, `MvPolynomial.eval_hasseDeriv_blockHomogenize`, `MvPolynomial.eval_hasseDeriv_blockHomogenize_inr`, `MvPolynomial.blockHomogenize_strict_vanishing_iff`, `MvPolynomial.weightedIndex_blockHomogenize`, `DiophantineApproximation.height2_coeff_blockHomogenize`.

Examples at Suggested.lean lines 3595, 3599, 3602, 3605, 3608, 3611, 3614, 3617, 3622, 3627, 3630.

### A32: Algebraic logarithms

`Transcendence.algebraicLogs`, `Transcendence.mem_algebraicLogs`, `Transcendence.log_mem_algebraicLogs`, `Transcendence.mem_algebraicLogs_iff_exists_int`, `Transcendence.intCast_mul_two_pi_I_mem_algebraicLogs`, `Transcendence.conj_mem_algebraicLogs`, `Transcendence.ofReal_log_mem_algebraicLogs`, `Transcendence.exists_isGalois_superset`, `Transcendence.exists_one_le_norm_algEquiv`, `Transcendence.one_le_pow_mul_norm_mul_house_pow`, `transcendental_e`.

Examples at Suggested.lean lines 3679, 3683, 3688, 3693, 3698.

### A33: Hermite integral and formal exponential sums

`LindemannWeierstrass.hermiteIntegral`, `LindemannWeierstrass.hermiteIntegral_eq_sumIDeriv`, `LindemannWeierstrass.norm_hermiteIntegral_le`, `LindemannWeierstrass.hermiteIntegral_add`, `LindemannWeierstrass.hermiteIntegral_smul`, `LindemannWeierstrass.hermiteIntegral_zero_right`, `LindemannWeierstrass.hermiteIntegral_C`, `LindemannWeierstrass.sum_mul_hermiteIntegral_eq`, `LindemannWeierstrass.expEval`, `LindemannWeierstrass.expEval_single`, `LindemannWeierstrass.expEval_apply`, `LindemannWeierstrass.expEval_mul`, `LindemannWeierstrass.expEval_algebraMap`, `LindemannWeierstrass.galConj`, `LindemannWeierstrass.galConj_single`, `LindemannWeierstrass.coeff_galConj`, `LindemannWeierstrass.galConj_refl`, `LindemannWeierstrass.galConj_trans`, `LindemannWeierstrass.support_galConj`, `LindemannWeierstrass.forall_galConj_eq_iff`, `LindemannWeierstrass.galConj_prod_galConj`, `LindemannWeierstrass.auxPoly`, `LindemannWeierstrass.natDegree_auxPoly`, `LindemannWeierstrass.auxPoly_map`, `LindemannWeierstrass.eval_iterate_derivative_auxPoly`, `LindemannWeierstrass.auxValue`, `LindemannWeierstrass.coe_auxValue_eq_sum_hermiteIntegral`, `LindemannWeierstrass.auxValue_galConj`, `LindemannWeierstrass.isIntegral_auxValue`, `LindemannWeierstrass.auxValue_ne_zero`, `LindemannWeierstrass.norm_auxValue_le`, `LindemannWeierstrass.expEval_ne_zero_of_forall_galConj_eq`, `linearIndependent_exp`, `transcendental_exp`, `transcendental_pi`, `algebraicIndependent_exp`.

Examples at Suggested.lean lines 3753, 3757, 3761, 3765, 3770, 3806, 3810, 3818, 3824, 3833, 3873, 3878, 3885, 3893, 3923, 3928, 3936, 3941, 3981, 3985, 3990, 3997.

### A34: Lindemann–Weierstrass and Schanuel proposition

`Transcendence.transcendental_of_mem_algebraicLogs`, `Transcendence.SchanuelConjecture`, `Transcendence.SchanuelConjecture.le_trdeg`, `Transcendence.schanuel_ineq_one`, `Transcendence.schanuel_ineq_of_isAlgebraic`, `Transcendence.SchanuelConjecture.algebraicIndependent_exp_one_pi`, `Transcendence.SchanuelConjecture.algebraicIndependent_of_mem_algebraicLogs`.

Examples at Suggested.lean lines 4060, 4066, 4072, 4079.

### A35: Analytic zero estimates and Gelfond–Schneider

`Transcendence.exists_finset_card_deriv_zeros`, `Transcendence.card_zeros_expPoly_le`, `Transcendence.exists_differentiable_eq_mul_prod_pow`, `Transcendence.norm_le_of_zeros`, `Transcendence.sum_mul_exp_ne_zero`, `GelfondSchneider.exists_schneider_auxiliary`, `GelfondSchneider.norm_schneider_auxiliary_le`, `GelfondSchneider.norm_embedding_schneider_value_le`, `GelfondSchneider.isIntegral_pow_mul_schneider_value`, `GelfondSchneider.transcendental_rpow`, `GelfondSchneider.iteratedDeriv_gelfond`, `GelfondSchneider.exists_gelfond_auxiliary`, `GelfondSchneider.exists_first_nonvanishing_derivative`, `GelfondSchneider.norm_gelfond_value_ge`, `GelfondSchneider.norm_gelfond_value_le`, `Transcendence.transcendental_exp_mul_of_mem_algebraicLogs`, `Transcendence.transcendental_exp_pi_mul`, `Transcendence.linearIndependent_integralClosure_of_two`, `transcendental_cpow_of_isAlgebraic_of_irrational`.

No unnamed examples in this group.

### A36: Multivariate differential calculus and interpolation

`Baker.mDeriv`, `Baker.mDeriv_zero`, `Baker.mDeriv_add_single`, `Baker.mDeriv_add`, `Baker.differentiable_mDeriv`, `Baker.mDeriv_exp_dotProduct`, `Baker.exists_div_sub_single`, `Baker.exists_div_polynomial`, `Baker.exists_div_cartesian`, `Baker.norm_le_of_vanishing_cartesian`, `Baker.mDeriv_monomial_mul_exp`, `Baker.exists_int_vec_small_real`, `Baker.exists_int_vec_small_complex`, `Baker.norm_mDeriv_le`, `Baker.norm_le_truncatedTaylor`, `Baker.exists_auxiliary_small`, `Baker.eq_zero_of_sum_polynomial_mul_exp`, `Baker.linearIndependent_monomial_exp`.

Examples at Suggested.lean lines 4305, 4309, 4313, 4319.

### A37: Schneider–Lang and Baker independence

`Baker.schneiderLang_liouville_bound`, `Baker.schneiderLang_exists_vanishing`, `Baker.schneiderLang_upper_bound`, `Baker.schneiderLang_cartesian`, `Baker.schneiderLang_homogeneous`, `Baker.schneiderLang_inhomogeneous`, `Baker.eq_zero_of_isAlgebraic_sum_basis_mul`, `Transcendence.linearIndependent_cons_one_of_linearIndependent_rat`, `Transcendence.transcendental_sum_mul_of_linearIndependent`, `Transcendence.transcendental_exp_sum_mul`.

No unnamed examples in this group.

### A38: Archimedean logarithmic bounds

`LogarithmicForms.waldschmidt_measure`, `LogarithmicForms.baker_lower_bound`, `LogarithmicForms.baker_lower_bound_prod_sub_one`, `LogarithmicForms.matveev`, `LogarithmicForms.matveev_rat`, `LogarithmicForms.matveev_prod_sub_one`, `LogarithmicForms.laurent_mignotte_nesterenko`.

No unnamed examples in this group.

### A39: p-adic logarithmic bounds

`LogarithmicForms.yu`, `LogarithmicForms.padicNorm_one_add_pow_sub_one`, `LogarithmicForms.padicNorm_pow_sub_one_ge`, `LogarithmicForms.yu_rat`.

No unnamed examples in this group.

### A40: Rational S-units

`DiophantineApproximation.ratSUnits`, `DiophantineApproximation.mem_ratSUnits_iff`, `DiophantineApproximation.mem_ratSUnits_iff_num_den`, `DiophantineApproximation.mem_ratSUnits_iff_eq_sign_mul_prod`, `DiophantineApproximation.ratSUnits_mono`, `DiophantineApproximation.ratSUnits_empty`, `DiophantineApproximation.ratSUnits_mulEquiv`, `DiophantineApproximation.ratSUnits_eq_setUnit`, `DiophantineApproximation.mulHeight₁_ratSUnits`.

Examples at Suggested.lean lines 4755, 4759, 4763, 4767, 4775.

### A41: Balancing units and bounded divisors

`DiophantineApproximation.le_two_mul_add_of_le_add_mul_log`, `DiophantineApproximation.minpoly_embedding_eq`, `DiophantineApproximation.abs_log_norm_embedding_unit_le`, `DiophantineApproximation.exists_norm_embedding_le_house_rpow`, `DiophantineApproximation.abs_exponent_le_log_house`, `DiophantineApproximation.exists_zpow_prod_near_logEmbedding`, `DiophantineApproximation.exists_unit_mul_balanced`, `DiophantineApproximation.boundedDivisors`, `DiophantineApproximation.mem_boundedDivisors`, `DiophantineApproximation.boundedDivisors_finite`, `DiophantineApproximation.exists_mem_boundedDivisors_of_dvd`, `DiophantineApproximation.boundedDivisors_subset_dvd`, `DiophantineApproximation.one_mem_boundedDivisors`, `DiophantineApproximation.boundedDivisors_mul_unit`.

Examples at Suggested.lean lines 4864, 4868, 4872, 4877.

### A42: Exponential equations and unit-equation bounds

`DiophantineApproximation.padicValNat_mul_log_le_log`, `DiophantineApproximation.max_pow_mul_le_abs_pow_sub_pow`, `DiophantineApproximation.max_le_of_pow_sub_pow_eq`, `DiophantineApproximation.pow_sub_pow_eq_finite`, `DiophantineApproximation.sub_ge_of_mem_factoredNumbers`, `DiophantineApproximation.tijdeman_gap`, `DiophantineApproximation.unitEquation_exponent_bound`, `DiophantineApproximation.unitEquation_finite`.

No unnamed examples in this group.

### A43: Thue and superelliptic reductions

`DiophantineApproximation.siegel_identity`, `DiophantineApproximation.thue_integralNormalization_iff`, `DiophantineApproximation.thue_form_eq_prod`, `DiophantineApproximation.thue_reduction_to_unitEquation`, `DiophantineApproximation.mulHeight₁_ratCast`, `DiophantineApproximation.logHeight₁_le_finrank_mul_log_house`, `DiophantineApproximation.thueEquation_finite`, `DiophantineApproximation.superelliptic_example_reduction`, `DiophantineApproximation.baker_superelliptic`, `DiophantineApproximation.schinzel_tijdeman`, `DiophantineApproximation.tijdeman_catalan`.

No unnamed examples in this group.

### A44: S-unit and Thue–Mahler reductions

`DiophantineApproximation.padicValInt_one_add_pow_sub_one`, `DiophantineApproximation.sUnitEquation_coprime_reduction`, `DiophantineApproximation.sUnitEquation_exponent_bound`, `DiophantineApproximation.sUnitEquation_finite`, `DiophantineApproximation.sum_log_place_eq_zero_of_sUnit`, `DiophantineApproximation.exists_small_place_of_sUnit`, `DiophantineApproximation.exists_exponent_le_logHeight`, `DiophantineApproximation.gyoryEquation_exponent_bound`, `DiophantineApproximation.gyoryEquation_finite`, `DiophantineApproximation.exists_mem_smul_of_dvd_sUnit`, `DiophantineApproximation.thueMahler_finite`.

No unnamed examples in this group.

### A45: Analytic systems and holonomic equations

`DiophantineApproximation.Qbar`, `DiophantineApproximation.existsUnique_analytic_solution_linearSystem`, `DiophantineApproximation.rank_kaehlerDifferential_eq_trdeg`, `DiophantineApproximation.ringKrullDim_quotient_add_one_eq`, `DiophantineApproximation.IsDFinite`, `DiophantineApproximation.IsDFinite.add`, `DiophantineApproximation.IsDFinite.mul`, `DiophantineApproximation.IsDFinite.derivative`, `DiophantineApproximation.IsDFinite.mono`, `DiophantineApproximation.isDFinite_polynomial`, `DiophantineApproximation.isDFinite_iff_pRecursive`, `DiophantineApproximation.dfiniteOrder`, `DiophantineApproximation.IsMinimalSingularPoint`, `DiophantineApproximation.exists_minimal_equation`, `DiophantineApproximation.dfiniteOrder_le`, `DiophantineApproximation.minimal_equation_unique`, `DiophantineApproximation.dfiniteOrder_eq_zero_iff`.

Examples at Suggested.lean lines 5214, 5218, 5222, 5227, 5267, 5271, 5275, 5280.

### A46: E-functions

`DiophantineApproximation.ePowerSeries`, `DiophantineApproximation.eFun`, `DiophantineApproximation.IsEFunction`, `DiophantineApproximation.hurwitzMul`, `DiophantineApproximation.ePowerSeries_hurwitzMul`, `DiophantineApproximation.IsEFunction.add`, `DiophantineApproximation.IsEFunction.hurwitzMul`, `DiophantineApproximation.IsEFunction.shift`, `DiophantineApproximation.IsEFunction.differentiable`, `DiophantineApproximation.IsEFunction.hasSum`, `DiophantineApproximation.IsEFunction.map_ringEquiv`, `DiophantineApproximation.IsEFunction.exists_numberField`.

Examples at Suggested.lean lines 5342, 5345, 5350, 5355.

### A47: G-functions and scaled system iterates

`DiophantineApproximation.IsGFunction`, `DiophantineApproximation.isGFunction_iff_isEFunction`, `DiophantineApproximation.IsGFunction.add`, `DiophantineApproximation.IsGFunction.mul`, `DiophantineApproximation.IsGFunction.hasRadius`, `DiophantineApproximation.algebraicIndependent_ratFunc_iff_of_isAlgebraic_coeff`, `DiophantineApproximation.SolvesSystem`, `DiophantineApproximation.scaledDividedSystemIterates`, `DiophantineApproximation.scaledDividedSystemIterates_zero`, `DiophantineApproximation.scaledDividedSystemIterates_succ`, `DiophantineApproximation.scaledDividedSystemIterates_congr`, `DiophantineApproximation.scaledDividedSystemIterates_geometric`, `DiophantineApproximation.GalochkinCondition`, `DiophantineApproximation.GalochkinCondition.ne_zero`, `DiophantineApproximation.GalochkinCondition.exists_integral_multiplier`, `DiophantineApproximation.galochkinCondition_congr`, `DiophantineApproximation.galochkinCondition_geometric`.

Examples at Suggested.lean lines 5386, 5389, 5393, 5397, 5451, 5455, 5459, 5493, 5496, 5499, 5503.

### A48: Specialisation and E/G differential arithmetic

`DiophantineApproximation.chudnovsky_galochkin_condition`, `DiophantineApproximation.isEFunction_monomials_solveSystem`, `DiophantineApproximation.isEFunction_div_one_sub`, `DiophantineApproximation.minimal_equation_regularSingular_of_isGFunction`, `DiophantineApproximation.laplace_eFun_eq`, `DiophantineApproximation.andre_eFunction_equation`, `DiophantineApproximation.exists_relation_basis_full_rank_specialisation`, `DiophantineApproximation.beukers_linear_relation`, `DiophantineApproximation.beukers_refined_siegel_shidlovskii`, `DiophantineApproximation.siegel_shidlovskii`, `DiophantineApproximation.isEFunction_div_linear`, `DiophantineApproximation.beukers_removal_of_singularities`, `DiophantineApproximation.linearIndependent_exp_of_isAlgebraic`, `DiophantineApproximation.galochkin_chudnovsky`.

Examples at Suggested.lean lines 5544.

### A49: Mahler functions and values

`DiophantineApproximation.expandPow`, `DiophantineApproximation.IsMahlerFunction`, `DiophantineApproximation.IsMahlerFunction.add`, `DiophantineApproximation.IsMahlerFunction.mul`, `DiophantineApproximation.IsMahlerFunction.expandPow`, `DiophantineApproximation.isMahlerFunction_of_polynomial`, `DiophantineApproximation.isMahlerFunction_iff_system`, `DiophantineApproximation.IsMahlerRegularPoint`, `DiophantineApproximation.isMahlerRegularPoint_iff`, `DiophantineApproximation.IsMahlerRegularPoint.pow`, `DiophantineApproximation.isMahlerRegularPoint_of_polynomial`, `DiophantineApproximation.nishioka`, `DiophantineApproximation.mahler_homogeneous_lifting`, `DiophantineApproximation.mahler_linear_relation`, `DiophantineApproximation.mahler_value_transcendental_or_mem`, `DiophantineApproximation.lacunary_not_rational`, `DiophantineApproximation.transcendental_fredholm`.

Examples at Suggested.lean lines 5682, 5686, 5691, 5696, 5700, 5724, 5729, 5734.

### A50: Modular values

`DiophantineApproximation.nesterenko`, `DiophantineApproximation.eisenstein_values_at_i`, `DiophantineApproximation.algebraicIndependent_pi_exp_pi`.

No unnamed examples in this group.

### A51: Algebraic Cartan calculus

`DiophantineApproximation.algebraicExteriorDifferential`, `DiophantineApproximation.algebraicExteriorDifferential_algebraMap`, `DiophantineApproximation.algebraicExteriorDifferential_exact`, `DiophantineApproximation.algebraicExteriorDifferential_square`, `DiophantineApproximation.algebraicExteriorDifferential_const_mul`, `DiophantineApproximation.algebraicExteriorDifferential_mul_exact`, `DiophantineApproximation.exists_lieDerivativeOneForm`, `DiophantineApproximation.lieDerivativeOneForm`, `DiophantineApproximation.lieDerivativeOneForm_smul_D`, `DiophantineApproximation.lieDerivativeOneForm_smul`, `DiophantineApproximation.lieDerivativeOneForm_evaluate`.

Examples at Suggested.lean lines 5851, 5854, 5859, 5890, 5893, 5899, 5904.

### A52: Ax–Schanuel

`DiophantineApproximation.ax_constant_coefficients`, `DiophantineApproximation.ax_integer_relation_of_constant_relation`, `DiophantineApproximation.ax_schanuel`, `DiophantineApproximation.ax_schanuel_powerSeries`, `DiophantineApproximation.weak_ax_schanuel_powerSeries`, `DiophantineApproximation.ax_lindemann_weierstrass`, `DiophantineApproximation.SchanuelConjecture`, `DiophantineApproximation.LogarithmsAlgebraicIndependenceConjecture`, `DiophantineApproximation.schanuel_inequality_of_isAlgebraic`.

No unnamed examples in this group.

### A53: Conditional algebraic independence

`DiophantineApproximation.SchanuelConjecture.le_trdeg`, `DiophantineApproximation.LogarithmsAlgebraicIndependenceConjecture.transcendental_div`, `DiophantineApproximation.logarithmsConjecture_one`, `DiophantineApproximation.algebraicIndependent_e_pi_of_schanuel`, `DiophantineApproximation.logarithmsConjecture_of_schanuel`.

Examples at Suggested.lean lines 5988, 5994, 5998, 6004, 6025, 6029, 6033.

## Public source receipts

| Source identifier | SHA-256 of retrieved PDF |
| --- | --- |
| bugeaud-exponents-2015 | `5d98ac74c956da01bc275aefc1d06b41b676df1fcf57511604e93ff66f7518f3` |
| sondow-irrationality-2004 | `537c120ed1ce44e5bf5fd65e7bbc4084707198970dbf95773e229ec920adaf3c` |
| smyth-mahler-survey-2008 | `8adb228e63181516fa09b41b512e4b24ad9db18e49658d3bdfef61e0d0511c28` |
| wu-heights-notes-2018 | `b03c8700cf9fd2c9bbfe012dc740861228c832c30485614fada1388901effa36` |
| pottmeyer-diophantine-approximation-2022 | `f86bb6072e20c5515e29d86fd654b3e37f0c0841d50b69c607f0d6240d7235cf` |
| evertse-ferretti-quantitative-subspace-2013 | `af2dbf4f9d9d286fc7f58b5fd5fec8e32ef93d037fbbef61f6543c504df0793d` |
| evertse-schlickewei-absolute-subspace-2002 | `12b5cb1e324988adcfab1ae94fdc8af6016f9968f72835d06d932bb903eaa7c2` |
| evertse-schlickewei-schmidt-linear-equations-2002 | `3c809fcadaddbc08f57045e4f55562c8a379b5fa33d7e83046b63a9c14766e8f` |
| evertse-improvement-quantitative-subspace-1996 | `ac82a38059a5d0d9fd23a40a3896fb58d8525b14ef44c42199df9582bd9a0fb4` |
| evertse-explicit-product-theorem-1995 | `7e030067f7502778eb7a1982e52e31f133ca18f7de869600f25326116bda71e8` |
| evertse-quantitative-subspace-survey-2010 | `db1b7d64130842f3f79540e6b55d6e0ffbee081bd71404dee350dfe4438e31c9` |
| schmidt-subspace-theorem-1989 | `aeeb61a491c8d7a437fe4b5555d23d80c27e543ff1e22371429c72dab85f8f1d` |
| waldschmidt-dalag-2000 | `e04a822f5b5d61be78c290f508ee7c8a28766e060ef4ec62377d068a942e3d59` |
| karatarakis-wiedijk-gelfond-schneider-2026 | `d12afa71451e5e9470e860c928c8b1de4a479241ad15ad494bbf9096396e115b` |
| soundararajan-transcendence-notes-2010 | `c22df296f0b7978f789d5e5fdca036a89c34b63d38651cbd7a81d5c6beecc1f3` |
| bugeaud-mignotte-siksek-fibonacci-2006 | `95a781491a737c4c1cc7abe1473fa57a90c156341e79618dc4776ef035ee7a76` |
| bugeaud-gyory-unit-equations-1996 | `988ced2aaf34294d7e4caff62e9ca93a125889809b52cf2441336cf4fb870103` |
| berczes-evertse-gyory-superelliptic-2013 | `6f0c3522bec1af5548ddd4fcb3bd7fc3bc02a2e4294276abc6219289ee94334c` |
| tzanakis-deweger-thue-mahler-1992 | `28e5806fea4590b40267c0529a9f867440ee04403e863bc5ec7952e7f0ceffc8` |
| beukers-refined-siegel-shidlovskii-2006 | `d35e6e176508a3c827c36edec822055f487a94be71dcc6e96e06e57214ee91d1` |
| beukers-e-g-functions-aws-2008 | `070b5faec742c86027768173f5000bcde16a61b1b8775d4797c5818678699592` |
| fischler-rivoal-siegel-problem-2020 | `37ce9631650e51081aa075f3d99736b8a766b1ce35dc26b206e86e05b6fb4d6a` |
| adamczewski-faverjon-mahler-2017 | `d44bec7a6c2b016d4a65971e60e583a9d013e8389948c52393911f5b12b7e7dd` |
| kirby-exponential-differential-equations-2009 | `a08ea00b740736a506fedd2361d79d2b040141bc2456b12696ea4f42f7167c42` |
| bakker-tsimerman-ax-schanuel-lectures | `468c791f1cdc84ab7d1e4fbd738c5487eb0ddc247512a99cd405271cacaa8189` |
| waldschmidt-transcendence-periods-2006 | `97428d55ee27acc74280f8d766d9bd3778bbf9f0ed2d7f38feda684052ed3bcc` |
| andre-solution-algebras-2014 | `7e7945bec322812105b5ad216b18ec2e498f87826662a0aaf81085634e6b1713` |
| evertse-ch1 | `299eabc4e88d0e114bc35819531c803699c3beb2873b9b24e11afadd84d82e23` |
| evertse-ch2 | `99194d1c4a670d42219e277d5b9945d5e80ef159c3969ac1e0e467c304586063` |
| evertse-ch3 | `205a3bd4614aff0e4da77c0ff7ecb106cea63fcfd3bba60528f18d841d1e39df` |
| evertse-ch4 | `1d120934e01ca54eb985678211716b7f5dd656dc3ad6882ed8cbfbbff5ddee54` |
| evertse-ch5 | `1f60cf276ff1a995036c7a238f20b9ce98a0ccfb65e1e759e95fd48b2b49e3b5` |
| evertse-ch6 | `07430cdb8be3a56ce39fd6c442f6c153f9b7fadfdcb7ae327a51e21ae63da97a` |
| evertse-ch7 | `8535b816bfc2899719849ab531686f2a7d812d0427ac9042b4ee7c86fe726610` |
| evertse-ch8 | `f2d717adf6adb48802ab3d57e6e1b1a6a8a08d3735247c67f538911023537f5a` |

## Input and package digests

- `research/blueprint/packets/DiophantineApproximationAndTranscendence.json`: 1889517 bytes; SHA-256 `d39c33404d01a9b3090d27928d5fa81c5517ea61acbb9fdc3e132cdfe97f7082`.
- `research/blueprint/packages/DiophantineApproximationAndTranscendence/README.md`: 199560 bytes; SHA-256 `2b320a5af875d06859ff98889051b513a9da96b83d035e241b0861daf1b63973`.
- `research/blueprint/packages/DiophantineApproximationAndTranscendence/Suggested.lean`: 350526 bytes; SHA-256 `406e68bbb8d831e3dabaf635211b2be2bdd2a639521be42cd79fe0f140daa3a0`.
- `research/blueprint/packages/DiophantineApproximationAndTranscendence/metadata.toml`: 18 bytes; SHA-256 `d303572d699e7ef5619039e39ca2cc23feb22354dad61e5014fe05151078b2a7`.
