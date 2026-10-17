# Independent review: AnalyticNumberTheoryPartII

Job `REV-PKG-AnalyticNumberTheoryPartII~adv`, issue #10272. Reviewer: Codex, session `codex-sTUfCC`. Date: 2026-10-17.

## Verdict and remaining defect

**Needs changes: the package/plan identity must be reconciled.** The mathematical review and the permitted package fixes are complete. The issue explicitly defines this new Part II as Layers 4–6 of the compacted AnalyticNumberTheory roadmap. However, `research/blueprint/packets/AnalyticNumberTheoryPartII.json`, the plan named by the issue's review instructions, contains 39 effective-class-number targets in ECN.0–ECN.5. Its Gross–Zagier/Oesterlé project is different mathematics. The package cannot be matched to that named plan, and its name is already used there. Packet edits and renaming other packages are outside this review's permitted files.

The maintainer must assign distinct identities to the effective-class-number project and this Layers 4–6 package, update their packet/queue associations and incoming references, and identify the packet set against which this split is promoted. Preserve both projects. This is the only outstanding defect found in this review; the verdict does not request a repeat of the mathematical work below. In particular, this is a completed review with an unresolved cross-file defect, not an unfinished checkpoint.

## Scope, preservation and shape

I read WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL.md, the expansion protocol and UPSTREAM_GUIDE.md. The upstream shape comparison used the complete PolarDecomposition and ProfiniteArithmetic READMEs and their relevant suggested signatures. OperatorTheory, OperatorAlgebraDynamics D1/D2/D7, DifferentialGeometry Layer 12, PseudodifferentialOperators P7/P7a and VonNeumannAlgebras V0/V4/V8/V11 supplied the more specific boundary checks.

The pre-compaction original is commit `6064e2704`; the split is `34883ce8b`, present at review base `f88b3563d`. Comparing the original and the two split packages recovers all **236 primary and 257 subsidiary targets**, 493 total: Part I has 201 and Part II has 292. All primary first statements and subsidiary first statements survive, allowing the added subsection labels and the six changed descriptive link labels. No statement was lost at the Layer 3/4 boundary. A separate declaration-body comparison recovers all **94 original Lean declarations and examples** across the two parts; this review adds five proved examples.

Part I contains no Part II, ArithmeticStatistics or ModularityAndLanglandsExtensions dependency. ArithmeticStatistics appears in Part II only as a downstream consumer; ModularityAndLanglandsExtensions is not an input. Expanding B1–B13 and resolving the explicit `Needs` links gives **292 nodes, 800 local prerequisite edges, no cycle and no later-layer edge**. All local anchors resolve, and Part I links resolve to its retained targets. Subsidiary targets do not inherit a dependency on their parent theorem merely because they occur beneath it. There are no `UPSTREAM:` or FoundationsAndLibraryIntegration suppliers.

The README is **349,107 bytes**, below the issue's 350,000-byte ceiling. It retains all hypotheses, source locators, worked examples and the existing 72 `Checks` markers. The 255 pre-review Check bullets are all preserved; four discriminating bullets were added. Suggested.lean is 270 lines, with five real-bodied definitions, ten named theorem signatures, examples, and a closing map of README-only constructions. No data construction is sorry-bodied. Metadata remains `topic = "math.NT"`.

## Fixes applied

1. **Tube-growth proof, §§5.18 and 5.30ab.** A finite affine dihedral orbit of a bounded ball cannot cover every real rectangle. Both generators fix (1/2,1/2) and preserve the centered quadratic form Q. On x²+y²<5, Q<13; at (10,10), Q=1083/4. The corrected proof covers a compact rectangle using the filled ball together with the unbounded R6 base, whose omitted polygon is already inside the ball. Added the counterexample in prose and three proved Lean calculations.
2. **Current suppliers.** Replaced the prospective profinite-ring description by the implemented zHat ring/product/unit API. Recorded the existing homogeneous-polynomial substitution representation; the local cubic action adds row transposition and the determinant-inverse twist. Clarified the characteristic-space measure and additive positive-definite GNS boundaries.
3. **Duplicate general targets.** Removed the proposed generic ratio-set constructor and its general membership/closedness/orbit-invariance API from §6.5, replacing them by the BC pushforward-density/witness comparison. Replaced §6.36a's generic KMS-limit theorem by its BC compatibility application. Replaced §6.42g's generic center/factor criterion and §6.42h's generic ratio-set/type criterion by the BC hypotheses and their V8/V11 applications. The general definitions and theorems are imported in the boundaries; their old independent formulations are not retained as targets. Every pre-existing Check remains.
4. **Signs and completions.** Made §6.12a's positive hyperbolic operator explicitly the negative of DifferentialGeometry's `laplaceBeltrami`, with the x² witness. Clarified §6.29: all positive BC core states do extend, but by the generator bounds and norm comparison, rather than by the definition of algebraic positivity alone. Added the q=2, β=1 mass/density control to §6.5 and repaired §6.41's stale prerequisite description.
5. **Weak topology, §6.48c.** Replaced the unsupported assertion that restriction to the unit locus preserves weak convergence. The Gibbs series gives continuity of the forward map by uniform summable tails and norm density; compactness of probabilities on W and the Hausdorff weak state topology then give continuity of the inverse. W is closed and nonopen, so automatic continuity of restriction is unavailable. Changed §6.48a's temperature label to inverse temperature.
6. **Source, rendering and negative controls.** Replaced §4.16's indirect Lerch discussion locator by DLMF §25.11(v), (25.11.13)–(25.11.14), for the complex-parameter Bernoulli identity. Changed §5.30g's grouping brackets to prevent the fourth-moment bound rendering as an accidental Markdown link. Added even-input vanishing to the modulo-eight character Checks. Added the divergent constant spectral sequence Check and proved totalized Hurwitz/spectral-series zero controls. Updated the inherited Lean module description and its closing README-only definition map.

## Current-library and supplier audit

The supplied current Tau Ceti library was at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the read-only roadmap checkout was at `0d144d044dacebca17b654695b6f1ad58f159b27`. I also checked the current remote roadmap main `350e970ce49f707a327909beac0b7b7c782cc7ee` for the OperatorAlgebraDynamics contract. The open supplier contracts used by this package were checked at VonNeumannAlgebras `ae202ba66da9846bf5efd5a0a59c83bed7433032` (PR #889) and PseudodifferentialOperators `063cf517a1dcc4d929e0602c6e6f585953aceab8` (PR #952). These are supplier plans, not claims that their targets have been formalized.

| Object searched semantically | Existing supplier consumed; retained local difference |
| --- | --- |
| Profinite integer ring, p-adic components, units, compatible characters | `TauCeti.Topology.Algebra.Group.Profinite.ZHat.{ZMod,Decomposition,Units}`: `toZMod`, `ringEquivPiPadicInt`, its forward/inverse continuity, `isUnit_iff_component`, `unitsEquivPiPadicInt`, `unitsLift`, `unitsLift_unique`, `continuous_unitsLift`. BC scaling measures, division endomorphisms and rational-torsion comparison are local. |
| Positive functional represented by a measure | `LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq` in `TauCeti.Analysis.CStarAlgebra.CharacterSpaceMeasure`: unital commutative complex C⋆-algebra, positivity on star-squares, finite inner-regular measure. Local work is uniqueness, normalization, BC expectation/restriction and topology. |
| Positive-definite translation GNS | `TauCeti.IsPositiveDefiniteSub.gnsSpace`, `gnsVector`, `gnsTranslation`, `gnsRepresentation` in `TauCeti.Analysis.PositiveDefinite.Function.GNS`: additive commutative group, kernel F(a−b), representation of its multiplicative type synonym. BC noncommutative left multiplication and its norm bounds are additional. |
| Linear substitution on forms | `MvPolynomial.linearSubst`, `linearSubstRep`, `coe_linearSubstRep_apply` in `TauCeti.RingTheory.MvPolynomial.LinearSubst`; homogeneous basis/finrank and `TauCeti.binaryFormRep` also exist. The row-variable GL₂ action here is the transposed substitution with det⁻¹ twist over arbitrary commutative rings. |
| Universal covers and normal subgroup quotients | Current `TauCeti.AlgebraicTopology.UniversalCover` modules: based cover, covering projection, inverse-loop action, subgroup quotient and deck identifications. The analytic Lerch lift, its monodromy and descent are additional. |
| Compact scalar realization and spectral theorem | P7/P7a and Mathlib `Analysis.InnerProductSpace.Spectrum`; DG Layer 12 fixes div grad. Local work is the negative-sign hyperbolic comparison, explicit heat kernel, Gaussian orbital terms, heat asymptotics and determinant normalization. |
| Crossed products, expectation, amenable norm comparison, analytic KMS criterion, ground limits | OperatorAlgebraDynamics D1/D2/D7, with AmenableGroups Layers 5–6 for the discrete abelian group Q-positive-units. Local completion, dilation corner, BC spectral core and arithmetic states remain. |
| Nonsingular crossed products, center/factor criterion, modular classification, continuous core | VonNeumannAlgebras V8/V11, with V0/V4 normal GNS. Local work checks the finite-adele action and conventions, proves the arithmetic full ratio set, and identifies the integral projection's GNS/core corner. |
| Lerch, Barnes, multivariable/cubic zeta, BC, scalar Selberg determinant | Current-library searches by series, twists, discriminant distributions, dilation states, ratio witnesses and shifted spectra did not reveal these completed targets. Circle-valued Hurwitz/periodic zeta and general imported theories remain suppliers. Eichler–Selberg trace results are different from the scalar Selberg zeta target. |

The library-coverage entries AN.7–AN.9 agree with these boundaries. General restricted products, finite adeles, Haar normalization, Tate Fourier theory, Eisenstein constructions and generic operator theory are not newly planned. The binary-cubic unbounded-coordinate estimate and general-number-field rank-one Fourier calculation are explicit local targets; compact-uniform Poisson and a level-one classical Eisenstein expansion do not supply them. ArithmeticStatistics and the later Langlands applications do not supply the field-count or large-sieve arguments.

## Adversarial mathematics pass

Every numbered primary target and all 195 subsidiary targets were read. The grouped rows below include their defining conventions, APIs, proof adapters and Checks. “Retained” means the displayed hypotheses and existing controls survived the calculation; it does not claim a Lean proof of the target. Sources remain attached at each target in the README.

### Layer 4

| Statement, including subsidiaries | Instances and conventions tested | Result / change |
| --- | --- | --- |
| 4.1 Lerch series | z=0, s=0, c=1; n=0 term; principal Log on Re c>0 | Retained the n=0 term and geometric value; series outside its convergence domain is not continuation. |
| 4.2 Complex Hurwitz series | c=1,s=2; c=1,s=0; c on the excluded nonpositive lattice | Retained half-plane hypotheses; added proved divergent-series zero control. |
| 4.3 and 4.3a Barnes product/remainder | G(0),G(1),G(4),G(5); z=0 Gamma recurrence; first Bernoulli correction; t=1/2 remainder sign | Retained pole exclusion and product normalization. Gamma-retaining −1/720 and expanded −1/240 differ; the Bernoulli difference is negative at 1/2. |
| 4.4 and 4.4a–c differential relations | z=0 and order zero; derivative of the n=0 term; c-shift | Raising/lowering factors and compact convergence agree; retained. |
| 4.5 and 4.5a–f continuation/Gamma–Laplace | s=1,c=1+i gives (1−i)/2; s=2,c=2 gives 1/4; positive loop about c=−n and inverse-loop deck action | Retained complex scale and logarithm branch; real-part replacement fails. Universal-cover action is imported, not reconstructed. |
| 4.6 and 4.6a nonpositive orders | order 0 gives 1/(1−z); z=0; differentiate once for order −1 | Rational value and excluded z=1 pole agree; retained. |
| 4.7 circle Hurwitz comparison | a=1 versus circle class 0; a=1/2; s=2 | Retained 0<a≤1 and Re s>1, avoiding an illicit arbitrary complex circle parameter. |
| 4.8 periodic zeta comparison | a=0 and a=1/2; first series coefficient | expZeta=zΦ(z,s,1), including its prefactor; retained. |
| 4.9 and 4.9a even functional relation | c=1/2, a=1/2; conjugate terms; Gamma poles as germs | Even sum and Fourier–Mellin normalization retained; no pointwise pole multiplication. |
| 4.10 odd functional relation | a=c=1/2 gives cancellation; sign under a↔1−a | Odd difference and phase retained. |
| 4.11 boundary degeneration | radial z→1 with Re s>1; c=1 and nonreal Re c>0 | Retained dominated-convergence domain; boundary totalization is not a limiting argument. |
| 4.12 and 4.12a complex Hurwitz continuation | c=1; s=1 residue; order 0; shifted c | Subtraction yields residue one and compatible germs; retained. |
| 4.13 moment constants | k=0,1,2,3; local prime factor at the first nonconstant term | Positivity/convergence and Barnes constants retained; general-k moment asymptotics remain conjectural. |
| 4.14 conditional moment comparison | k=1,2 and arbitrary k | No implication from constants alone to higher moment asymptotics; conditional scope retained. |
| 4.15 character specialization | conductor 1; nonprincipal character sum zero; finite n-shift | Factor q⁻ˢ and residue cancellation agree; retained. |
| 4.16 Bernoulli values | n=0,c=1 gives −1/2; n=1,c=1; complex Re c>0 | Formula retained; replaced indirect locator by DLMF (25.11.13)–(25.11.14). |
| 4.17 and 4.17a solvable-cover descent | z-loop, c-loop, commutator and second commutator; nonintegral s | Retained invariance under the second derived subgroup, not unwarranted abelian descent. |

### Layer 5

| Statement, including subsidiaries | Instances and conventions tested | Result / change |
| --- | --- | --- |
| 5.1 four characters | residues 1,3,5,7; input 2; conductor 1 versus 4/8 | Odd table retained; added explicit zero on even nonunits. |
| 5.2 swap | (s,w)=(2,3); applying swap twice; index 1 | ζ₂ denominator and involution retained. |
| 5.3 and 5.3a–e reflection/local analytic adapters | α²=1; conductor-one block; residue characteristics 2 and 3; real versus complex places | Retained finite-place ramified distribution theorem as a target, distinct from five unramified tests; archimedean matrices and unbounded-coordinate bounds remain explicit. |
| 5.4 cubic action/discriminant | u³−v³; diag(2,1); upper unipotent; scalar λI; zero form; F₂,F₃ | P=−27,−108 and characteristic reductions agree with det² covariance. Recorded existing generic substitution and the local transpose/twist difference. |
| 5.5 cubic algebra/form equivalence | split uv(u−v); zero form; V=O⊕I nonprincipal; places over 2/3 | Wood's dual V=(C/O)∨ and multiplication signs agree. No free-module restriction or division by 2/3; retained. |
| 5.6 weighted coefficients | split algebra automorphism group 6; empty discriminant fibre; nonprincipal class | Finite groupoid weights retained; no replacement by an unweighted field count. |
| 5.7 degree ≤3 field count | degree 1; split products; quadratic subextensions | Uniform degree bound includes all étale contributions with separate order counting; retained. |
| 5.8 local zeta/densities | Φ=1_U; general weighted Φ; P=0; q=2,3 | Shell exponent and separate singular mass retained; indicator formula is not applied to arbitrary tests. |
| 5.9 signature-refined Shintani series | F=Q; split and nonsplit real cubic algebras; nonfree lattice class | Archimedean signatures and all projective components retained. |
| 5.10 and 5.10a–b measure/coefficient comparison | split orbit stabilizer 6; unit discriminant; p dividing 3; nontrivial different | Jacobian uses det² and keeps different, discriminant, |3| and stabilizer factors; retained. |
| 5.11 adelic cubic integral | determinant scaling; compact test; dual lattice at 3 | Canonical quotient integral and normalizations retained; arbitrary continuation fields are not data. |
| 5.12 ordinary continuation data | F=Q; s=1,5/6; point value versus germ | Simple poles are allowed, and order-one clearance is a theorem target; retained. |
| 5.13 and 5.13a–f fixed étale order factors | five local splitting/ramification types; index 1; q=2,3 | Constant terms and field discriminant factors agree; no global assumption of a principal basis. |
| 5.14 quadratic double series | d=1; odd versus even summation; large real s,w | Deleted Euler factor and absolute tube retained. |
| 5.15 and 5.15a reciprocity matrix | 1,3,5,7 mod 8; applying matrix twice | Character orthogonality fixes the factor 1/4 and inverse; retained. |
| 5.16 primitive twist | d₀=1,3,5; parity at −1; conductor 8 | Fundamental-discriminant conductor/parity table and root number +1 retained. |
| 5.17 imprimitive twist | d₁=1; shared prime divisors; prime 2 | Missing local factors are restored exactly once; retained. |
| 5.18 continuation tubes | generators at their fixed point; (10,10); ball x²+y²<5 | Added the preserved-quadratic-form obstruction to covering by finitely many bounded-ball images. |
| 5.19 archimedean cubic matrix | n=1; real split/nonsplit signs; complex place | Signature matrix is distinct from quadratic reciprocity; retained. |
| 5.20 coefficient adapter | split term weight 1/6; nonprincipal class; trace-dual condition at 3 | All class components and dual lattice retained. |
| 5.21 and 5.21a–g convergence, unfolding, smoothing | compact core versus unbounded torus; class number >1; height t versus ratio t² | All class components and the explicit general-F Fourier bound retained; no level-one supplier substitution. |
| 5.21h–r zero/singular orbits, residues, Fourier lattice | zero, triple-root, double-root strata; s=1 and 5/6; different and prime 3 | Cancellations precede passage to germs; Fourier dual retains local measure factors. |
| 5.21s–v cubic continuation, order, residues | n=1; completed poles; h₂ contribution | DW Theorem 6.2 supplies simple poles/order-one statement; LOWW normalization agrees; retained. |
| 5.22 continued odd L-function | principal character at 1; nonprincipal real character; conductor 1 | Canonical continued L₂ and its pole are distinguished; retained. |
| 5.23 local reflection ratio | even/odd parity; conductor 1,4,8; negative integer Gamma arguments | Reciprocal Gamma fills removable points; corrected parity/conductor conventions already present are retained. |
| 5.24 and 5.24a global cubic equation | F=Q and complex place; s↔1−s; two real signatures | Gamma and discriminant powers agree with LOWW; archimedean comparison retained. |
| 5.25 cleared quadratic L-function | principal pole s=1; conductor-one case; nonprincipal value | Clearing is holomorphic and does not manufacture a nonzero value; retained. |
| 5.26 reflection matrix | B₁(0); odd conductor block; applying reflection twice | Only the principal block is forced to vanish; retained. |
| 5.27 and 5.27a–d zero at origin | field degree n=1 versus n=2; order n gamma zero times at most simple dual pole | Order ≥n−1 retained; degree one is correctly not forced to vanish. |
| 5.28 and 5.28a–b cubic convexity | s near both poles; fixed degree versus varying discriminant; h₂ factor | Pole distance and uniform parameters retained; no raw bound through poles. |
| 5.29 large sieve/fourth moment | M=N=1; zero coefficient; two coefficients with cancellation; χ of conductor 1 | Odd squarefree sieve retains m=1; moment excludes principal χ and allows any finite primitive-real subfamily. |
| 5.30 and 5.30a–f initial tubes/factorization | d=1; repeated prime square; denominator in Re>1; overlap with principal pole | Unique squarefree decomposition and nonvanishing Euler quotient retained. |
| 5.30g–l moment-to-tube estimates | σ=1/2,1; t=0; principal term; compact substrip | Hölder exponents, conductor ≤8X and compact-uniform estimates retained; principal term is separate. |
| 5.30m–r functional branches/gluing | α²,β²; principal s=0; connected overlap; apparent extra pole | Germ cancellation and B₁(0)=0 retained; totalized 0 times infinity is not used. |
| 5.30s–v Bochner adapters | m=0,1; connected annulus; disconnected intervals; corrected disc center; imaginary translation | Connectedness, entire Gaussian exponent and path-dependent cutoff choice retained; bounded extension follows by extending reciprocals. |
| 5.30w–aa dihedral action/shell filling | six iterates at (2,3); twelve vertices; 4<r²<5; denominator 3+s | Shell normalization has no zero in r²<5; both final transports are required; retained. |
| 5.30ab global polynomial growth | arbitrary rectangle containing (10,10); bounded filled ball | Corrected finite chart cover to include the unbounded R6 exterior; finite group orbit alone fails. |

### Layer 6

| Statement, including subsidiaries | Instances and conventions tested | Result / change |
| --- | --- | --- |
| 6.1 positive rational affine group | identity, inverse, translations, dilation 2; zero/negative dilation | Positive diagonal hypothesis and affine multiplication retained. |
| 6.2 and 6.2a scaling measure | β=1 Haar; a unit; p-valuation k; β=0 excluded | Local annuli sum to one; target density q^β and image mass q^−β remain distinct. |
| 6.3 Eisenstein recurrence polynomials | P₀,P₁,P₂; value at 0; derivative recurrence | Constant −1/4 in P₂ retained; weight-zero convention is algebraic. |
| 6.4 and 6.4a positive spectral series/output | spectrum j+1; λ=0 exclusion; infinite λ=1 | Added divergent constant-spectrum Check and proved totalized zero example. Continuation requires the heat/Mellin targets. |
| 6.5 ratio-witness comparison | identity on one point: 1 yes, 0/2 no; q=2,β=1 | Generic duplicate deleted; BC comparison retained with new image-mass 1/2 versus pushforward-density 2 Check. |
| 6.6 finite determinant | empty spectrum; one zero eigenvalue; {0,2} | Empty product one and u(u+2) agree; zero mode is included. |
| 6.7 integral subgroup | translation 0,±1; dilation other than 1 | It is the integral translation subgroup, not a larger diagonal subgroup; retained. |
| 6.8 translation/dilation maps | dilation 2 followed by translation; translation conjugation; inverses | Composition direction and positive scalar domain retained. |
| 6.9 and 6.9a–e critical ergodicity | β=1 endpoint; nontrivial finite character; empty prime set; β>1 counter-regime | Fixed-progression reciprocal-prime divergence and decreasing projections are explicit; critical range retained. |
| 6.10 scaling-measure classification | β=0 gives δ₀; β=1; β>1 unit mass | Zero-temperature notation does not obscure β=0; atom and high-β cases separated. |
| 6.11 Selberg product | identity geodesic excluded; first primitive and its repetitions; genus 2 | Primitive lengths and Re s>1 convergence retained. |
| 6.12 and 6.12a–e scalar heat/spectrum | x² in a hyperbolic chart; genus 2; zero mode multiplicity 1; small-time area term | Explicitly identified the positive operator with −DG.laplaceBeltrami; chart value −2y². Imported realization remains in P7/P7a. |
| 6.12f–j Mellin/continuation | t→0 subtraction; t→∞ after zero deletion; s=0 | Weyl summability and spectral gap justify both ends; genus-two ζ(0)=−4/3 retained. |
| 6.13 and 6.13a–b shifted determinant | u=0; u=−λ; first canonical-product factor | Entire family includes the zero-mode factor; logarithmic derivative alone does not fix its normalization. |
| 6.14 diagonal homomorphism | identity; translation; positive dilation 2 | Translation maps to one, positive dilation to its exact rational; retained. |
| 6.15 regularized Laplace determinant | deleted zero mode; scaling c>0; finite analogue | exp(−ζ′(0)) sign and prime determinant retained. |
| 6.16 and 6.16a Hecke pair | n=m=1; translation conjugated by 2 and 1/2 | Finite indices distinguish the two sides; retained. |
| 6.17 and 6.17a–h determinant comparison | s=1, s=0; s↔1−s; identity/geodesic heat contributions; Barnes branch | Mellin normalization, full Gaussian transform and branch-independent identity factor retained; equality is not inferred from zeros alone. |
| 6.18 and 6.18a–b Hecke algebra | identity coset; twofold dilation and inverse; convolution adjoint | Degree and modular factors retained; additive and multiplicative coordinates are separate. |
| 6.19 Selberg functional equation | s=1/2; reflection twice; genus 2 | Same determinant branch and area normalization retained. |
| 6.20 and 6.20a–c zero divisor | λ=0; λ=1/4; double root s=1/2; negative integer trivial zeros | Pullback doubles a spectral multiplicity at the branch point; identity-factor trivial zeros are separate. |
| 6.21 and 6.21a–n presentation | n=m=1; n=m=2; coprime 2/3; γ=0,1/2; star | x′ₙxₙ=n, fibre sum without 1/n and isometric μₙ=xₙ/√n remain consistent; normal-form independence and e(0)=1 retained. |
| 6.22 dynamics | z=0, z=iβ; dilation 2; real-time star | Eigenvalue 2^−β at positive imaginary time retained; complex time is only on the algebraic core. |
| 6.23 operator construction contracts | identity generator; star-square; norm-zero vector; finite-support sum | BC bounded multiplication and universal norm are targets; generic C⋆/GNS facts imported. |
| 6.24 and 6.24a–f reduced completion | identity double coset; inverse degree; finite row/column counts; adjoint | Schur bound and coefficient recovery retain faithfulness; no unsupported operator-valued data. |
| 6.25 coefficient state | identity; off-identity basis term; f* f | Normalization and positivity retained; not asserted tracial for unequal coset degrees. |
| 6.26 and 6.26a trigonometric e₁ | a=0; a=1/2; primitive cubic root; finite Fourier constant | cotangent value at zero is separately normalized; finite transform and star sign retained. |
| 6.27 rational forms | e(0); normalized versus unnormalized dilation; rational coefficients | Isometry convention does not silently adjoin √n to Q; retained. |
| 6.28 and 6.28a–b representation/Hamiltonian | ε₁; shift by 2; μ₂* on odd basis vector; μ₂*μ₂ | Hε₁=0 and partial adjoint formulas agree; rational/isometric generators remain distinct. |
| 6.29 algebraic KMS | β=1 coefficient state; f=x′₂,g=x₂; β>1 Gibbs state | Positive imaginary-time identity retained; clarified that bounded extension is proved by BC norm estimates. |
| 6.30 and 6.30a completed KMS | trivial dynamics on M₂; two off-diagonal matrix units; non-star-invariant span of μ₂ | Imported D7 criterion is applied to the dense invariant entire BC core; state boundedness and both strip boundaries retained. |
| 6.31 higher Eisenstein functions | k=0,1,2; character killing a; a=1/2 | P₂(0)=−1/4 retained; degenerate value is not a divergent cotangent sum. |
| 6.32 heat operator | t=0; ε₁; t>0 | Operator is bounded for nonnegative time; trace class only above the critical exponent; retained. |
| 6.33 and 6.33a–i completed state/corner | eγ unitary; μₙ isometry; finite normal form; rational dilation of the unit projection | Generator estimates give universal boundedness; amenability imports full/reduced equality; positive core states extend. |
| 6.34 and 6.34a–h KMS/scaling | β=1; μₙμₙ*; off-diagonal normal form; compact-cylinder restriction | All state/measure directions, norm bounds and dense-core hypotheses retained; point values do not replace correlation strips. |
| 6.35 BC symmetry | v=1,−1; composition v,w; doubling on Q/Z | Automorphism hypothesis is essential: doubling destroys the x₂x′₂ relation. Action and Gibbs parameter multiplication retained. |
| 6.36 and 6.36a–b KMS-infinity/ground | β→∞ Gibbs; e(1/2); trivial M₂ vector state | Generic limit theorem replaced by BC application. Vector state is ground but not a finite-temperature KMS limit; definitions stay distinct. |
| 6.37 and 6.37a–l arithmetic generation | a=0,1/2; prime 2; order-four torsion; reduced projection corner | Möbius, Newton, Bézout and Cayley steps retain the degeneracy projections. π² recovery and Q coefficients are not inferred from an unproved field closure. |
| 6.38 invertible-lattice ground state | ε₁; e(0); e(1/2) | Values 1 and −1 and upper-half-plane boundedness agree; retained. |
| 6.39 partition function | k=1 first term; β=1; β>1 | Trace is ζ(β) exactly in the trace-class range; retained. |
| 6.40 and 6.40a–c critical uniqueness | β=1; β>1 excluded; constant and nonconstant unit translates | Extremality plus compact unit averaging proves uniqueness; ergodicity alone is not substituted for uniqueness. |
| 6.41 measured comparison | finite transitive free action; trivial action on two points; p=0; q=2,β=1 | Existing V8/V11 conventions are matched by the explicit coordinate unitary. Nonzero BC corner and full core support are checked; Tomita time is −βt. Updated prerequisites. |
| 6.42 and 6.42a–f arithmetic ratio set | λ>1 and reciprocal; β=1; finite congruence cylinder; forward/inverse valuation swap | Target derivative and cylinder mass have reciprocal orientation. Disjoint pairs outside fixed congruence data supply all positive ratios; retained. |
| 6.42g–i factor/type/corner applications | fixed point qx=x; null x=0; zero corner; finite matrix-factor control | Replaced generic duplicate factor and classification targets by BC V8/V11 applications; nonzero compression and core fullness remain explicit. |
| 6.43 and 6.43a Gibbs series | identity; off-diagonal normal form; β=1; ε₁ term | Absolute ζ(β) normalization and β>1 retained. |
| 6.44 completed Gibbs state | norm-bounded core approximation; positive square; identity | State norm one and completion via the established norm comparison retained. |
| 6.45 and 6.45a Gibbs KMS | μ₂,μ₂*; real versus imaginary time; finite eigenvector sum | Strip boundaries, sign and uniform core convergence agree; extension uses the imported analytic-core theorem. |
| 6.46 and 6.46a barycentres/torsion | Dirac mass; half-half mixture; zero/single torsion subgroup; compatible finite residues | Affine mass-one normalization and unit action agree; rational torsion comparison is additional to profinite units. |
| 6.47 and 6.47a cyclotomic restrictions | conjugation exponent −1; conductor 1 and 2; divisible conductor transition | Compatible residues define the cyclotomic automorphism and correct unit; retained. |
| 6.48 and 6.48a–d high-β simplex | ζ(β)⁻¹ unit mass; n=1 orbit; Dirac and mixed probabilities; W not open | Reconstruction and extreme points retained. Repaired inverse continuity using compactness after proving continuity of the Gibbs map. |
| 6.49 and 6.49a arithmetic values/limit | e(1/2); ε₁ term and tail; norm bound one | Bound 2‖a‖(ζ(β)−1)/ζ(β) gives the completed weak limit; retained. |
| 6.50 and 6.50a phase transition | β=1 versus β>1; identity/nontrivial unit symmetry | Critical singleton and high-β free transitive extreme boundary agree with the preceding constructions; retained. |

All divisions were checked in their stated domains: Re c>0 for logarithmic series; positive scalars for real powers; nonzero determinant for the twisted action; Euler-product denominators in their zero-free half-plane; ζ(β)>0 for β>1; reduced nonzero corners before inverses; Gamma ratios as filled holomorphic/meromorphic germs rather than pole values. Algebraic cubic identities keep characteristics 2 and 3, whereas number-field and local analytic statements retain characteristic zero. The finite degree/field/discriminant and compact-strip uniformities are explicit.

## Source audit

No locator was explicitly marked unverified in the package. I opened the public sources for the following random sample of 15 primary sections, confirming their locators and the normalization actually used. Page numbers below are printed or author-preprint page numbers, not browser/PDF offsets. The report and package contain paraphrases and formulas, not copied source passages.

| Sampled target | Public primary source actually read | Finding |
| --- | --- | --- |
| 6.10 | [Neshveyev 2000](https://arxiv.org/pdf/math/0002141v1), (1β), p.1 and classification discussion pp.1–2 | β=0 atom, critical regime and high-β orbit decomposition agree. |
| 4.16 | [Lagarias–Li III](https://arxiv.org/pdf/1506.06161v1), §6, p.40; [DLMF §25.11(v)](https://dlmf.nist.gov/25.11#v), (25.11.13)–(25.11.14) | Lerch discussion is indirect for complex c; added the direct shift/Bernoulli locator. |
| 5.27 | [Lemke Oliver–Wang–Wood](https://arxiv.org/pdf/2110.07712), Lemma 3.8, p.13 | Degree n gives order at least n−1; degree one does not imply a zero. |
| 6.43 | [Connes–Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Theorem 3.32, pp.474–476, (3.135), (3.139)–(3.142) | Gibbs weights and ζ normalization agree. |
| 6.34 | [Neshveyev 2000](https://arxiv.org/pdf/math/0002141v1), (1β) and state/measure correspondence, pp.1–2 | Scaling direction and normalization agree. |
| 6.20 | [Zagier](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf), §1, (1)–(2), pp.1–2 | Spectral quadratic relation and trivial zeros agree; the branch point requires double pullback multiplicity. |
| 5.21 | [Datskovsky–Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 6.2, p.71; [Lemke Oliver–Wang–Wood](https://arxiv.org/pdf/2110.07712), Proposition 3.7(2), p.12 | Two simple poles, order-one clearance and residue normalization agree. The scanned DW theorem page was visually inspected. |
| 6.4 | [Sarnak, author mirror](https://web.math.princeton.edu/sarnak/Determinants%20of%20Laplacians.pdf), §1, (1.1)–(1.5), p.603 | Positive-spectrum deletion, heat Mellin transform and −ζ′ determinant sign agree. Scanned page visually inspected. |
| 5.26 | [Blomer](https://doi.org/10.1112/S0010437X10004926), (32)–(35), pp.362–363 | Principal-block zero and the different parity blocks agree with the package's already-corrected conductor conventions. |
| 6.2 | [Neshveyev 2000](https://arxiv.org/pdf/math/0002141v1), local density formula, p.2 | Local mass and β=1 Haar normalization agree. |
| 5.1 | [Blomer](https://doi.org/10.1112/S0010437X10004926), §2.1, (7)–(11), p.358 | Odd character table and conductor/parity agree; added the even-input nonunit control. |
| 6.26 | [Connes–Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Lemma 3.28, (3.100)–(3.101), p.465 | Finite Fourier constant and ζ/(ζ−1) terms agree. |
| 6.35 | [Connes–Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, §4.3, (3.75), p.461 | Symmetry fixes dilation generators and acts on rational torsion in the stated direction. |
| 5.23 | [Blomer](https://doi.org/10.1112/S0010437X10004926), (10)–(11), p.358 and (32)–(34), pp.362–363 | The package correctly uses primitive conductor/parity rather than repeating the source's convention slips. |
| 6.48 | [Connes–Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Theorem 3.32, pp.474–476; [Neshveyev 2000](https://arxiv.org/pdf/math/0002141v1), pp.1–2 | Simplex and orbit reconstruction agree; repaired the package's weak inverse-continuity argument. |

Additional proof-boundary checks included [Wood](https://msp.org/ant/2011/5-8/ant-v5-n8-p05-p.pdf), §2, Theorem 2.1 and (1), pp.1073–1074 (projective dual, arbitrary base and multiplication signs); [Heath-Brown](https://matwbn.icm.edu.pl/ksiazki/aa/aa72/aa7234.pdf), Theorems 1–2 and corollaries, pp.237–238 (odd squarefree sieve and nonprincipal primitive-real fourth moment); [Hounie](https://www.dm.ufscar.br/cursos/pos/preprintsDM/preprints2009/JH7.pdf), Lemmas 1.1–1.2, Theorem 1.1 and §§2.1–2.2, pp.2–6 (disc centers and Gaussian approximation); and [Diaconu–Goldfeld–Hoffstein](https://www.math.columbia.edu/~goldfeld/GoldfeldDiaconuHoffstein.pdf), Propositions 4.6–4.7, pp.37–38 and bounded-shell application pp.43–44. Hounie's real-path bound is retained explicitly before choosing the cutoff radius.

I also checked [Nemes](https://arxiv.org/pdf/1406.2535v2), Theorems 1.1–1.2, pp.2–3; Connes–Marcolli Theorem 3.30, pp.467–470; [Neshveyev 2009](https://arxiv.org/pdf/0907.1456v1), §1 pp.1–2 and Theorem 2.1/Lemma 2.3, pp.3–5; and [Jorgenson–Smajlović–Šabanac](https://arxiv.org/pdf/2512.16681v2), §4 pp.13–15 and §8.1 pp.26–28. The package's corrected Barnes remainder sign and identity-term normalization remain, rather than copying a printed slip.

For the nonarchimedean distribution boundary I visually read Datskovsky–Wright Theorem 3.2, p.47, including its reference to Igusa 1984, Theorem 1. I verified that DW states the arbitrary-Schwartz/quasicharacter functional equation, not just the five standard unramified tests. I did not independently recheck Igusa's original proof or Wright's thesis proof of the order-one bound. They remain explicitly identified proof sources; the corresponding theorems are local formalization targets, not assumed library exports. DW Theorems 3.2 and 6.2 themselves supply the checked public statements.

## Lean generality and validation

All ten named theorem signatures were matched to the README:

| Signature | Hypotheses and scope checked |
| --- | --- |
| `complex_gamma_laplace` | Re s>0 and Re c>0; complex c and principal Log, not merely a positive real scale. |
| `complexHurwitzSeries_one` | Re s>1; canonical convergent series at c=1. |
| `expZeta_eq_lerchSeries` | Real a mapped to UnitAddCircle, Re s>1, and the essential exponential prefactor; the boundary series is absolutely convergent. |
| `complexHurwitzSeries_ofReal` | 0<a≤1 and Re s>1; no claim that arbitrary complex c descends to the circle. |
| `barnesG_add_one` | Excludes all nonpositive integer Gamma poles; product defines G. |
| `barnesG_one` | Product normalization at one; recurrence alone is not the definition. |
| `cubicDiscriminant_diagonal` | Arbitrary field, both diagonal entries nonzero; README separately retains full GL₂ over commutative rings. |
| `quadratic_large_sieve` | Positive integer M,N, ε>0, arbitrary complex coefficients, odd squarefree indices on both sums, m=1 included. |
| `quadratic_fourth_moment` | Fixed σ∈[1/2,1], ε>0, Q≥1, every finite primitive real nonprincipal family with conductor≤Q; constants independent of Q,t,family. |
| `spectralZetaSeries_smul` | Every λ_j>0 and c>0. This is an identity of totalized series, including the nonsummable case, not an assertion of meromorphic continuation. |

The final `lean-check` exited **0**, with exactly **17 warnings, all declaration-uses-sorry**. All five added examples are proved. The pinned build used Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; current-library inspection did not substitute unpinned imports into Suggested.lean. No language server or library build was started.

`scripts/check_sorry_data.py` reports no offenders. `scripts/check_blueprint.py` reports zero errors and zero warnings for AnalyticNumberTheory, AnalyticNumberTheory~AN.0, AnalyticNumberTheory~AN.8 and the existing AnalyticNumberTheoryPartII packet. These are schema/closure checks; their success does not resolve the ECN/package identity mismatch. Intake file checks, whitespace checks, size/shape checks, preservation inventories and link/dependency checks pass. Only this package's README, Suggested.lean and review.json and this review report change.

## Handoff

No mathematical fix is deferred by this review. Reconcile the two Part II identities before promotion; the exact incompatible packet and the required changes are identified above. The source audit, target coverage, supplier removals and compiled examples are recorded here so the next worker does not need this run's temporary source downloads or notes. The original packet files and Part I were not edited.
