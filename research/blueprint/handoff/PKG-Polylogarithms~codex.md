# Handoff: PKG-Polylogarithms~codex

Issue: #10750. Author: Codex (GPT-6), session `codex-ckSqbd`, 2026-10-19.

## Deliverable and scope

Complete package of the accepted six-layer plan and its five follow-up packets: README, compact Suggested.lean and `topic = "math.NT"`. The README has the full mathematical specification, exact supplier contracts, discriminating Checks and worked examples. The Lean file contains real-bodied light definitions, the five-term and weight-three/weight-four existence headlines, layer milestones and proved definition examples. No heavy carrier is admitted. The closing comment names the README-only constructions. No source passages have been copied into the deliverables.

This is a roadmap package, not a claim that the mathematics is formalized or that inherited source/proof gaps have been proved. The following obligations are explicit mathematical targets or conditional boundaries; they must survive the independent package review. No second issue was claimed after #10750.

## What remains mathematically unsupported by a completed proof in the inputs

1. **Exact universal Borel calibration (README §§2.3, 3.7).** The matrix-unit calculation is reproducible, but does not determine the entire Suslin/Hurewicz/van Est scalar. Preserve the Tate conversion `L_n = lambda_n pi^(n-1) r_Bo`, rather than asserting plain rational proportionality in divided coordinates. The recently packaged BorelRegulators §8.5 likewise supplies only real proportionality until its exact coefficient is computed. Do not import its late Bloch–Wigner consumer back into this proof.
2. **Configuration top normalization (§§3.5–3.6).** The lower maps agree with eighteen times Goncharov's maps. The identity `-(1/5) Alt_6[T]_3 = 18 M_3` needs its full skew-symmetrization proof inside the explicit quotient. Exact rational boundary checks below cannot replace that proof. The analytic 22-term identity also needs the derivative, integration constant and continuation argument; its source theorem and cobracket identity alone are not that argument.
3. **All-configuration cycle lifting (§3.8).** G95 §9.2, pp.310–311 asserts the relevant spectral-sequence calculation without displaying higher differentials. Write those differentials, account for degenerate rows, then verify stable GL passage and primitive pairing. Weight-three existence remains a published unconditional theorem; every-family image containment has this explicit proof target, not a presumed full motivic isomorphism.
4. **Rational-curve specialization (§§4.1–4.3).** G95's all-smooth-connected-curve model and GR's rational-curve model are distinguished. Angular components repair multiplicativity at the generator level but do not prove preservation of relation subspaces. The joint two-variable specialization induction, including poles and nonrational residue extensions, remains load-bearing. Finite-base-field extensions of the infinite-field construction are not silently asserted. General single-valued differentiation is now an explicit target in §1.3, so constancy does not rest only on a weight-three formula.
5. **Weight four (§§4.5–4.7).** Polylogarithms Part II must build the motivic correlator, combinatorial Lie coalgebra, decorated-flag map, Chern/regulator comparison, and the cycle-level `L4*` correction. The exact GR interfaces are stated. Surjectivity of symbol presentations does not lift every cycle: the obstruction quotient and a concrete counterexample are retained. Inductive every-family periods need vanishing obstruction or direct period-image containment. The finite-polynomial-place homotopy statement remains a conjecture; the rational-curve/all-curve model comparison is an additional requirement if one uses G95's formulation.
6. **Full complex transfers (§§3.9, 4.7, 5.13, 5.17).** Only top cohomology transfer is unconditional here, via Milnor norms. Derived/chain transfer requires the stated homotopy input, compatible explicit/inductive chain comparisons, primitive-element independence, tower coherence and the infinity residue in the same model. A wedge of norms scales incorrectly, and D96's number-field K4 diagram does not construct a generic-field chain transfer.
7. **Analytic and geometric suppliers (§§5.1–5.3, 5.11).** DifferentialGeometry supplies global smooth forms and integration; this package adds their LF dual topology and currents, positive-current extension, normal-current support and singular logarithmic estimates. Algebraic resolution is not resolution of an arbitrary analytic space. A singular incidence projection is not a submersion: §5.11 requires the family-specific resolved-form construction and independence, not arbitrary current pullback. The good Chow locus and universal incidence are exact Part II contracts, not already available theorems.
8. **Early universal motivic prefix (§§5.5–5.12).** The generic Deligne carrier, universal Chern regulator and supports must precede explicit formulas. The existing unsplit M.8 cannot be used wholesale: its late dependence on these formulas would be circular. The last-two-degree Gersten/higher-Chow graph comparison, including CH^p(X,1), is a named target, not a consequence of divisor lengths alone.
9. **Raw/normalized current dictionary (§§5.4–5.10).** Ordinary degree, current differential, dimension-dependent period, Koszul sign and final Deligne operator all need conversion together. The normalized BFT route is specified and its comparison is supported by BFT §§5–6. Its theorem does not settle the raw G04 chain-map dictionary in every degree. Raw Arakelov cones remain conditional on that dictionary, or use the normalized map from the outset.
10. **Reciprocity (§§5.14–5.17).** The rational proven cases P1, elliptic plane cubics and algebraic-number curves are retained. General strong reciprocity and higher-weight reciprocity are conjectures. The integral rigidity-based carrier and six-torsion convention are not replaced by a false integral theorem. A reciprocity homotopy lands in the pre-Bloch group with nonzero cobracket, not the Bloch kernel. General-field K4 comparison is not inferred from D96's number-field theorem.
11. **Elliptic Fourier limit (§5.18).** Absolute convergence of the stated lattice kernel has a dyadic proof outline. The finite Fourier calculation fixes its scalar in our conventions. One common regularization of logarithmic products at shared divisors, and collation with the published normalization, still need proofs. D96 v2's normalization of the integral of omega wedge conjugate omega as real one cannot be used with ordinary complex integration. No elliptic weight-three special-value theorem is deduced from the kernel formula.
12. **Positivity and numerical replacement (§§1.4, 2.5, 6.2).** The superharmonic minimum principle and exhaustion are explicit analytic targets, avoiding a circular use of volume. The unproved geometrically convergent near-circle expansion in the parent is replaced by the accepted follow-up's uniform Fourier/Kummer certificate; no such expansion is needed for the stated algorithm. Strict differential negativity uses the earlier positivity proof, not only differentiation.

## Supplier order, moves and duplicate removal

Polylogarithms is outside the 94-roadmap Caraiani–Newton tier list; that file names it as an external supplier to ColemanIntegration, rather than giving it an invented tier. The contracts expose the following independent prefixes and avoid returning to a consumer as a premise. These Part II/prefix requests must be integrated by the maintainer; this job edits no supplier files and fabricates no live stage IDs.

| Input or potential duplicate | Resolution in this package |
|---|---|
| FoundationsAndLibraryIntegration / UPSTREAM bookkeeping | Replaced by actual Mathlib, Tau Ceti or roadmap declarations/layers in the supplier section; neither identifier remains. |
| Classical logarithm, Taylor series, Bernoulli coefficients, integration, tensors/exterior powers, matrices and complexes | Imported from Mathlib. New analytic Li continuation, Bernoulli combination and singular regulator identities remain here. |
| Number-field zeta, discriminant, places, signature and selected embedding | Native Mathlib carriers; no private zeta/rank/discriminant stand-ins. Positive special values use the defining Dirichlet series. Functional equation/even-value inputs remain with Borel/L-function owners; no Tate-thesis theorem is restated. |
| Continuous logarithms and function-field places | TauCeti.Analysis.Complex.ContinuousLog.Basic (`HasContinuousLogOn`) and TauCeti.Place (`residueUnit`, `finite_setOf_ord_ne_zero`) are suppliers. Reduction is restricted to valuation units. |
| Forms, exterior derivative, wedge, manifold orientation, integration, compact support and Stokes | Removed as new targets; DifferentialGeometry Layers 0–2, 5–6, 8 supplies them. LF topology, singular currents and logarithmic residue extensions are explicitly different constructions here. |
| Algebraic cycle ring | AlgebraicVectorBundles Layer 2 owns it. The moving, face-admissible Chow parameter locus is a different variant, contracted from AlgebraicModuliForArithmeticGeometry Part II R09.2. |
| Analytification and algebraic resolution | Exact early C0 contract in ComplexComparisonPartII and R09.7 Part II resolution contract, with proper algebraic/SNC hypotheses. Neither is credited with arbitrary analytic resolution or current extension. |
| Torus Fourier interface once requested from C5 | Reading current C5 shows a de Rham–Betti comparison, not this interface. Moved the narrow lattice-specific adapter into §5.18: quotient coordinates, normalized Haar area, character orthogonality/derivative, and distributional coefficient from Poincare–Lelong. Abstract AddCircle/Haar operations stay Mathlib. Regularization remains its own target. |
| Ideal boundary and ideal tetrahedron regions | GeometricTopology Part II early contract must precede the present Lobachevsky/volume proof. The existing metric and volume targets are not re-planned. |
| Pre-Bloch/Bloch distinction, five-term quotient, Suslin and rigidity | K3BlochGroups V.3–V.4 supplies them; V.6 supplies exact certificate infrastructure. Only analytic descent, the explicit weight-three quotient and normalization adapters are new here. The inherited unobtained Suslin primary proof belongs to that supplier. |
| Milnor symbols, signed tame symbols and norms | K2SymbolsBrauer T.2–T.4 supplies them. Exterior residue orientation and its regulator comparison are new. |
| Plus/primitive Hurewicz, localization/Adams, Borel ranks/lattice | GeneralAlgebraicKTheory K.2, SchemeKTheoryOperations S.4/S.6, BorelRegulators R.3–R.5 supplies them. Rank filtration is not identified with Adams filtration without a separate theorem. |
| Higher Chow/Chern/universal Deligne theory | M.4/M.6 and a separated independent universal M.8 prefix. The concrete logarithmic regulator and its comparison remain here. No whole-M.8 dependency is authorized by this request. |
| Formal polylogarithm series, p-adic logarithm and completed units | Early ColemanIntegrationAndChabauty L0 and IntegralIwasawaTheory I.2/L.4 supply them. New complex analytic realization and the full embedding-matrix diagnostic are the retained variants. Coleman's reverse dependence is after its independent prefix. |
| General certified arithmetic / contour integration | Completed EffectiveBounds and ContourIntegration are suppliers; the Gaussian-rational three-shape certificate and its uniform Fourier tail are new applications, not second generic arithmetic/Cauchy theories. |

The current upstream nine newer roadmaps and four Completed roadmaps, as well as current Tau Ceti a91d3aaf, were searched by mathematical object (form fields and differential, distribution/test-function duality, logarithmic currents/residues, analytic cycle integration, Deligne/support complexes, Bloch/trilog symbols, regulator matrices, lattice Fourier characters). DifferentialGeometry and AlgebraicVectorBundles gave the actual overlaps above. OperatorTheory's distribution/Fourier interfaces and Completed OrthogonalL2Bases do not supply the complex-lattice logarithmic-product/current construction. No Li of weight at least two, Bloch–Wigner function or the singular-current/Deligne constructions was found in the library. Pin-time statements were read at Mathlib 082e2d3 and Tau Ceti f790474 before using them. No lake command was run in the read-only current-upstream checkout.

## Adversarial mathematics pass

The rows cover the complete statement families, including the 169 accepted nodes mapped below. Formal elaboration is not evidence of their truth. Numerical checks are diagnostics only; exact algebraic computations and source hypotheses are distinguished.

| Statements checked | Instances and witnesses | Result / change |
|---|---|---|
| Classical Li, direct integral, nonpositive indices | n=0,1,2; z=0,1,1/2,-1 and x>1; removable zero vs branch cut | Kept rational nonpositive formulas only off their pole; n>=2 integral and endpoint integrability are targets. Principal lower boundary specified. |
| Distribution/inversion/monodromy | m=1,2; n=1,2; z=-1; upper-minus-lower Li1 jump +2pi i | Stated connected common branch domain; corrected positive cut jump and negative counterclockwise continuation; no global principal holomorphy. |
| Bernoulli projection | B1=-1/2; L2 conjugate negative, L3 conjugate positive; z=1 and unit circle | Odd endpoint retained; L1 regulator distinguished from the formal Bernoulli expression. General derivative added explicitly. |
| D differential, positivity and five-term | z=i with v=1,i; z=2; zero/one endpoints; distinct rational and complex arguments | Correct derivative log2/2 and zero at i; cut derivative uses real calculus. Minimum principle and local branch argument are targets. Five-term numeric residual about 2.4e-61. |
| Descent and archimedean embeddings | F=Q, imaginary quadratic; conjugation of selected place; repeated arbitrary embedding | Descent to pre-Bloch first, restrict to kernel for K3. Native equivalences select all required rows in headlines. |
| Borel trace normalization | Elementary 2x2 matrix units, input swap | Alternating trace =-3, C2=-3/2, epsilon2=+3/2 in the stated convention. Does not settle full K-theory scalar; exact adapter retained. |
| Lobachevsky and ideal volumes | theta=0,pi/2,pi; z=i and exp(i pi/3); swap first two vertices | Factor 2 in log sine and signed cross-ratio ordering fixed; absolute volume distinct from oriented volume. |
| Fourier/Kummer rational certificate | N=1,3,6; z=i, real rational,0,1; all norms at each denominator | S3(i)=8/9, S6(i)=209/225; shapes (-1,i,i); error <=3/(2N). Exceptional shapes explicitly one. Numerical Kummer residual <=1.6e-61. |
| Explicit R22 and B3 endpoint | (1,1,1), (2,2,2), (1,1,c); b(x)=x at2 | Raw coefficients retained, including negative [1/4] term; endpoint [1] not killed. Two analytic R22 residuals <=1.9e-60. |
| Universal cycle predicates | zero, single [1], valuations of2,3,5, a scalar regulator test alone | Real relation-respecting universal module test used, not a numeric zero. Single endpoint cycles proved in Lean. |
| Exterior residue and signed tame | pi wedge u, u wedge pi, two units, residue F2; f=pi and pi^-1 | Angular component multiplicative on all nonzero elements; zero reduction not a homomorphism. Integral tame sign separated before rationalization. |
| Generic configurations and truncation | q=1; zero vector/dependent triple; simultaneous vs separate scaling; BC3=0 | Correct vector coinvariants; projective invariance not applied to middle determinant map. Quotient truncation used, not false subcomplex. |
| Three configuration maps | Rational four-vector exterior witness; five moment vectors; generic nonconic six tuple | Exact prime-coordinate calculations: r4 coefficient18, delta r5 coefficient36, delta2 delta3 raw Alt6 coefficient300 and middle boundary -60. All wedge coordinates match factor -1/5. |
| Projected ratio / triple ratio | Five moments r=6/5, inverse5/6; six moments T=10/9; nonconic T=1 | Native definitions have nonzero denominators only in geometric API; T=1 allowed. Both specific ratios proved as Lean examples. |
| Geometric presentation, duality and normalization | T1(z)=-T(z)-2T(1-z)+T1; double dual; top Milnor norm | Duality negative; top quotient Milnor not full Quillen. Eighteen-fold geometric normalization exposed as proof target. Wedge norm would scale by degree cubed. |
| K-theory and cycle-lifting | Rank-two row vanishing; primitive pairing; zero family and full-rank family | Maps/covolume enough for existence; every-family containment separated; no conjectural H1=K5 inverse. |
| Inductive relations and specialization | 1/t at0, constant family, arbitrary [t] not a kernel cycle; irreducible t2+1 | Infinite-field rational model explicit; all-curve comparison and nonrational residue descent not assumed. |
| Higher period constancy | Constant cycle, poles, n=2 five term, arbitrary raw [t] | Whole-kernel constancy target, with general derivative and algebraic relation specialization prerequisites. |
| Zagier determinant/exponents | Q,n3 with [1]; Q(i),n4; totally real n4, empty family | Embeddings rows/columns fixed; q nonzero for existence, zero allowed every-family. Empty determinant1, Q weight4 pi4=90 zeta4. |
| Weight-four explicit complex and L4* | repeated wedge, [1] boundary, unit circle vs nonunit nonreal z | No extra Lambda2 B2 in complex (44); L4*=(5L4+L2 log²/3)/16, correction needs cycle proof. |
| Obstruction square | C=D=E=Q,J=0,p=a=id,b=q=0; injective q sufficient case | Surjective presentation does not lift y=1 to cycle. Native cycleLift_iff matches kernel criterion. Existence pushes forward; all-family needs more. |
| Finite polynomial residue/homotopy | t-a, t2+1, constants, omitted infinity | Direct sum includes nonrational residue fields, excludes infinity; homotopy is conjectural and transfers conditional. |
| Test forms/current differential | q=0,1,top; zero current, exact d²; compact chart supports | LF dual degree m-q, d sign(-1)^(q+1). No unsupported product of currents or arbitrary pullback. |
| Analytic cycles/Poincare–Lelong | empty cycle, point on curve, f=z^m, poles and higher codimension | Analytic finite mass and closed extension separately targeted; support theorem uses normal/order-zero currents, not arbitrary distributions. |
| Chow loci/log Green forms/incidence | empty good locus, nonproper face, distinguished hyperplane component, singular projection | Fixed degree/codimension and good incidence; SNC log convergence and resolved pull–push independent of generic submersion claim. |
| Raw r/current residue | m=1,2,3; uniformizer-first; codimension0/1 | Ordinary degree m-1+2c and darg coefficient2pi retained. Raw sign in all degrees left a precise dictionary target. |
| Raw Deligne/simplex regulator | n=1, i=0/1, transposition, non-real embedding alone | Final2 barpartial partial, top current separately defined; Tate power and real restriction-of-scalars fixed. |
| BFT dictionary and Wang forms | complex dimension0/1; ordinary q even/odd; m=1/2; cubical faces | Dimension twist and Koszul(-1)^q transported; Tm(-log f)=(-1)^m r; cube signs(-1)^(i+j), simplex(-1)^i. |
| Cubical regulator/unit normalization | empty divisor, [a] in CH1(point,1), degenerate cube | Pc[a]=-log|a|, so positive universal unit convention requires -[a]. Does not force opposite raw cycle convention. |
| Support complex, integration and homotopy | m=0/1, r top boundary, degree r-m; mixed n=0/m=0 | Kept total differential dD+(-1)^r delta; Green/Wang product corrects boundary; psi includes Pc(z)-pi[g W]+phi(alpha). |
| Mixed and universal comparison | swap cube and simplex factors; cube-first total boundary | Total sign delta+(-1)^n partial; no unqualified equality of raw maps from normalized homology theorem. |
| Arakelov Green quotient | principal pair, SpecC codim1, point onP1, shifted vs unshifted cone | SpecC complex-variety group is zero; point degree1 survives. Modified top Deligne quotient before cone[-1]. |
| Curve residue/eta/Chern | f=t,g=t-a onP1; pi,u; Steinberg; proper vs nonproper | Exterior residues -a,a^-1,1 have product-1; signed tame infinity -1 restores product1. d eta=2pi sum log tame delta; ch22=-c22. |
| P2/homotopy target | Steinberg (1-t),t,t-a; a=3 nonzero3 wedge(-2); constant first factor | Real P2=-1/(2pi) integral r2; Steinberg gives D(a). h must land in pre-Bloch, not ker delta; two triangles needed. |
| P1/family/Qbar reciprocity | auxiliary point change, collision, cover degree and all embeddings | Rational six-torsion caveat retained; cover descent uses inverse degree; full Borel injectivity, not one component. |
| Elliptic lines/plane curves | four lines, point multiplicities, scaling and twelve initial terms | Required equation normalization and external alternating signs specified. No unjustified term cancellation or generic line triple assumption. |
| Weight-three curve/K4 | number field vs arbitrary characteristic-zero field; Steinberg relation | D96 comparison restricted to number fields, compatible map not general isomorphism; higher reciprocity remains conjecture. |
| Elliptic torus adapter/kernel | zero frequency excluded, area0 rejected, basis change, translation, exchange last two | Own lattice adapter replaces false C5 supply. Kernel alternating sign and dyadic absolute-convergence proof stated; lattice has positive minimum norm. |
| Elliptic pairing | finite triads, dz wedge dbarz=-2iA mu, zero modes and shared divisors | Finite algebra fixes iA³/(4pi²) and rho factor -4/3. Common regularization and source collation explicitly required. |
| Leopoldt/completed units | rank0Q/imaginary quadratic; p2 torsion -1; embedding columns vs places | Full completion may have p-torsion; tensor Qp before rational rank. Leopoldt concerns completed map, not ordinary unit inclusion. |
| p-adic matrix/minors | totally real row(a,-a), unimodular change, local degree>1 | Full r by N matrix; minors alternate; empty minor1. Qsqrt2 at7 root10 mod49, epsilon6=15 proves nonzero log from tail. |
| L3 differential/diagnostics | 1/2,2,-1,i; angular vs radial; exact relation vs tiny residual | Radial coefficients4/3 log²2 and -1/3 log²2, zero at-1, angular-D(i). Numerical derivatives agree to ~60 digits; strict sign uses positivity. Floating zero never exact relation or vanishing p-adic minor. |

## Source verification and locators

Public author PDFs/preprints were read, not copied into the repository. Printed-page pagination is used throughout. The G95 and Z90 scans were inspected as images. The following primary locators were checked directly; several inherited citations mixed publication and preprint pages and were corrected.

| Source | Checked locators and use |
|---|---|
| G95 (1995) | Theorem1.1 p203; Theorem1.8 p214; paragraph8/Theorem1.14 pp217–220; paragraph9/Lemma1.16/Proposition1.18/Corollary1.19 pp220–224; residues and curve complexes paragraphs14–15 pp236–241; TheoremA p293; §§6–9 pp295–311, including asserted cycle lifting §9.2 pp310–311. G95 §2 citations previously incorrectly placed in pp226–236 were removed. |
| G94 | §3 configuration complex/maps, manuscript pp15–27; Theorem5.11 pp42–44. Lower-map convention comparison distinguished from top quotient proof. |
| G00 v1 | Bernoulli coefficient (15) p3; Proposition4.1/(28), pp17–20; printed pagination0–28. |
| G04 v3 | Theorem1.1 p8; raw Deligne §§2.2–3 pp10–13; logarithmic forms §§2.4–5 pp14–16; Definition2.11/Theorem2.12 pp22–24; Proposition2.14 pp24–25; Theorem3.4 p28; Theorem5.7 pp45–47, Corollary5.10/Theorem5.11 p49; §§6.1–3 pp52–57; Theorem6.10 p58, 6.12 pp59–60, 6.14/Lemma6.15 p62, Proposition6.17 p63,6.18 p64. Version is70 pages, not publication's60. |
| GR v5 | Infinite-field conventions; Theorems1.2–1.3 pp5–7, comparison p9; Theorems1.13–1.14 pp15–16; explicit complex(44) p16; §§7.1–3 pp61–68; Theorem7.6 pp70–71; L4* §§8.2 pp76–78; Theorem9.1 p87 and §9.3 pp90–94. Full Part II proof is a supplier contract, not claimed decomposed here. |
| Z90 / Z07 | Z90 §2 pp397–401 single-valued convention and §§2–3 determinant statements. Z07 §3 pp10–12 circle/Kummer identities and §4 pp13–16 volume. The unverified Milnor URL was a different paper and is not cited; the volume target uses Zagier and the explicit geometric proof contract. |
| BFT v1 | §2 pp3–4 current normalization; Definition5.2/Proposition5.3 pp8–9; Proposition5.7 p10, Proposition5.16/Theorem5.23 p14, Proposition5.24/Theorem5.26 p15; Theorem6.5 p17,6.10 pp18–19,6.11 p19,6.18 p21;22 pages. |
| D96 v2 | Intro(1) pp0–1 elliptic kernel; Theorem2.1 p7 and §3.7 pp22–23 number-field K4; Theorems3.3–3.4 pp20–22 pairing. Printed pp0–36. Distinct from its unavailable journal normalization. |
| Demailly | I2A pp13–14 LF test forms, I2BC pp14–18 currents; Theorem2.24 pp19–20 and Lemma3.29 pp28–29 resolutions; III2A/B Theorem2.3, Lemma2.6/Theorem2.7 pp139–140; support Theorem2.10/Corollary2.11 p141 and Poincare–Lelong Theorem2.15 pp143–144. |
| Burgos thesis | ChapterII Proposition3.1/Corollary3.8 pp73–78, Definition4.2/Lemma4.5 pp79–81, Theorem4.3 pp79–83; support and Green models. |
| Nekovar / Schneider | Nekovar §§7.3–7.5 pp23–24 symbol/Chern convention; Schneider §4 p28 eta regulator. |
| NSW official electronic edition | Definitions10.3.3–4 pp626–627, Conjecture10.3.5 p627 and Theorem10.3.6 p628 read directly. Initial URL redirect served HTML; a subsequent fetch from the authors' official site obtained the PDF. No unofficial mirror or uncleared book was used. |

Unverified in the sense of not settled by source inspection: the missing calculations in items1–12 above, the inaccessible journal collation for D96, and the Suslin primary proof owned by K3BlochGroups. There are no knowingly unverified printed-page locators left disguised as verified source statements. A direct derivation in the README is labeled as such rather than given a fabricated theorem number.

### Public source file fingerprints

These hashes identify the versions read; source files are scratch only and are deleted after submission.

| Reference | SHA-256 |
|---|---|
| G94 | `e664e340573fcadd339e46c8d4a105a00f4cae0700622884455c4c9c60c55225` |
| G95 | `434fd9093d2e27e96fae240f8f591ca532baa2f9cc7cdfeb8bc087f5235f5344` |
| G00 | `47a616bada4abeaee1672679593e5b69e6d293b2cf98e08de6b726072f9a69ea` |
| G04 | `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db` |
| GR5 | `d7694f411ff344af087768a951a871aef6ebd4bbed571af6d6c045560d6ed8df` |
| Z90 | `96bbb5f616dfac26e28c1da4657b2c5ae9cefa462213279797ccd44b71e1bb19` |
| Z07 | `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0` |
| BFT | `63155506c01244497f732d6d57cf78b979a18cbbe24cbca8fade1da99f359cd5` |
| D96 | `8e0798f9d67fbbd4ca14a2da386e130e8efb5785a5f01304ac3c268a6e0d3712` |
| DEM | `d7c7654a7417e8322e5dcf8fe8ec818b4c1a18cf280b41f2df5a871b776d89a1` |
| BUR | `65a531b4ed7cc8d0f1318645aaa7003a0d685e65ae7706fc01249fdb3fe8457c` |
| NEK | `3b6ba59cb8338b59fd8206318b2a91c3588ca09545522d6fb33717287924eacd` |
| SCH | `9693e4a34e8aa8d6c92899b2ba2ce9735615de4758d536d8dc25d9b20f9ea88b` |
| NSW | `abbb7cdefc9ecb3350286c3cba36fe36a90c103257ff8f64173e09a50afdcb91` |

## Input target coverage

Every node from the75-node parent and94 follow-up nodes is mapped below. Entries use input IDs only in this handoff; no such identifiers appear in the reader. Conditional/proof-boundary qualifications above apply to their mapped targets. The README also preserves the mathematical Checks and worked examples; follow-up corrections supersede inconsistent parent formulas, rather than presenting both as facts.

| Input target | README section |
|---|---|
| `Polylogarithms:P.1/bloch-wigner-differential` | 1.4 |
| `Polylogarithms:P.1/bloch-wigner-dilogarithm` | 1.4 |
| `Polylogarithms:P.1/bloch-wigner-five-term` | 1.5 |
| `Polylogarithms:P.1/bloch-wigner-positivity` | 1.4 |
| `Polylogarithms:P.1/branch-change-and-monodromy` | 1.2 |
| `Polylogarithms:P.1/classical-distribution` | 1.2 |
| `Polylogarithms:P.1/classical-inversion` | 1.2 |
| `Polylogarithms:P.1/classical-polylogarithm` | 1.1 |
| `Polylogarithms:P.1/distribution-and-inversion` | 1.3 |
| `Polylogarithms:P.1/five-cross-ratio-identity` | 1.5 |
| `Polylogarithms:P.1/single-valued-continuity` | 1.3 |
| `Polylogarithms:P.1/single-valued-polylogarithm` | 1.3 |
| `Polylogarithms:P.2/bloch-wigner-cocycle` | 2.2 |
| `Polylogarithms:P.2/bloch-wigner-descent` | 2.1 |
| `Polylogarithms:P.2/borel-comparison` | 2.3 |
| `Polylogarithms:P.2/certified-numerics` | 2.5 |
| `Polylogarithms:P.2/certified-numerics-error` | 2.5 |
| `Polylogarithms:P.2/goncharov-elementary-calibration` | 2.3 |
| `Polylogarithms:P.2/hyperbolic-volume` | 2.4 |
| `Polylogarithms:P.2/kummer-unit-reduction` | 2.5 |
| `Polylogarithms:P.2/lobachevsky-duplication` | 2.4 |
| `Polylogarithms:P.2/lobachevsky-fourier` | 2.4 |
| `Polylogarithms:P.2/lobachevsky-function` | 2.4 |
| `Polylogarithms:P.2/lobachevsky-identity` | 2.4 |
| `Polylogarithms:P.2/milnor-angle-volume` | 2.4 |
| `Polylogarithms:P.2/rational-fourier-approximation` | 2.5 |
| `Polylogarithms:P.2/rational-fourier-compatibility` | 2.5 |
| `Polylogarithms:P.2/rational-fourier-error` | 2.5 |
| `Polylogarithms:P.2/rational-fourier-sum` | 2.5 |
| `Polylogarithms:P.2/rational-unit-shapes` | 2.5 |
| `Polylogarithms:P.2/rational-unit-shapes-correct` | 2.5 |
| `Polylogarithms:P.2/unit-circle-fourier` | 2.4 |
| `Polylogarithms:P.2/unit-circle-fourier-tail` | 2.5 |
| `Polylogarithms:P.2/weight-two-regulator` | 2.1 |
| `Polylogarithms:P.3/cohomology-transfer` | 3.6 |
| `Polylogarithms:P.3/conditional-complex-transfer` | 3.9 |
| `Polylogarithms:P.3/configuration-borel-class` | 3.7 |
| `Polylogarithms:P.3/configuration-chain-comparison` | 3.5 |
| `Polylogarithms:P.3/configuration-duality` | 3.6 |
| `Polylogarithms:P.3/coordinate-relation` | 3.1 |
| `Polylogarithms:P.3/cycle-lifting` | 3.8 |
| `Polylogarithms:P.3/every-family-special-value` | 3.8 |
| `Polylogarithms:P.3/exterior-configuration-map` | 3.5 |
| `Polylogarithms:P.3/exterior-residue` | 3.3 |
| `Polylogarithms:P.3/generic-vector-configurations` | 3.4 |
| `Polylogarithms:P.3/geometric-trilogarithm-comparison` | 3.6 |
| `Polylogarithms:P.3/geometric-trilogarithm-presentation` | 3.6 |
| `Polylogarithms:P.3/k-theory-comparison-weight-three` | 3.7 |
| `Polylogarithms:P.3/middle-configuration-map` | 3.5 |
| `Polylogarithms:P.3/milnor-degree-comparison` | 3.6 |
| `Polylogarithms:P.3/polylogarithmic-complex` | 3.2 |
| `Polylogarithms:P.3/projected-cross-ratio` | 3.5 |
| `Polylogarithms:P.3/rank-two-vanishing` | 3.7 |
| `Polylogarithms:P.3/rational-regulator-calibration` | 3.7 |
| `Polylogarithms:P.3/regulator-image-containment` | 3.8 |
| `Polylogarithms:P.3/relation-cobracket` | 3.1 |
| `Polylogarithms:P.3/residues-and-transfers` | 3.3/3.9 |
| `Polylogarithms:P.3/seven-term-configuration-relation` | 3.5 |
| `Polylogarithms:P.3/stabilized-configuration-comparison` | 3.4/3.7 |
| `Polylogarithms:P.3/steinberg-boundary-image` | 3.6 |
| `Polylogarithms:P.3/suslin-top-comparison` | 3.6 |
| `Polylogarithms:P.3/trilogarithm-descent` | 3.7 |
| `Polylogarithms:P.3/trilogarithm-duality` | 3.6 |
| `Polylogarithms:P.3/trilogarithm-functional-relations` | 3.1 |
| `Polylogarithms:P.3/trilogarithm-group` | 3.1 |
| `Polylogarithms:P.3/trilogarithm-regulator-borel` | 3.7 |
| `Polylogarithms:P.3/triple-ratio-map` | 3.5 |
| `Polylogarithms:P.3/weight-three-bigrassmannian` | 3.4 |
| `Polylogarithms:P.3/weight-three-complex` | 3.2 |
| `Polylogarithms:P.3/weight-three-special-value` | 3.8 |
| `Polylogarithms:P.4/assertion-logic` | 4.4 |
| `Polylogarithms:P.4/complex-specialization` | 4.2 |
| `Polylogarithms:P.4/condition-o-n` | 4.4 |
| `Polylogarithms:P.4/cycle-constancy` | 4.3 |
| `Polylogarithms:P.4/cycle-evaluation` | 4.3 |
| `Polylogarithms:P.4/cycle-obstruction` | 4.6 |
| `Polylogarithms:P.4/delta-map` | 4.1 |
| `Polylogarithms:P.4/explicit-to-inductive-comparison` | 4.2 |
| `Polylogarithms:P.4/explicit-weight-four-complex` | 4.5 |
| `Polylogarithms:P.4/freeness-extension` | 4.5 |
| `Polylogarithms:P.4/general-polylog-complex` | 4.2 |
| `Polylogarithms:P.4/goncharov-comparison-conjecture` | 4.2 |
| `Polylogarithms:P.4/higher-bloch-group` | 4.1 |
| `Polylogarithms:P.4/higher-symbol-inversion` | 4.2 |
| `Polylogarithms:P.4/homotopy-conjecture` | 4.7 |
| `Polylogarithms:P.4/period-calibration` | 4.4 |
| `Polylogarithms:P.4/polylog-on-higher-bloch` | 4.3 |
| `Polylogarithms:P.4/presentation-chain-map` | 4.6 |
| `Polylogarithms:P.4/rational-existence` | 4.4 |
| `Polylogarithms:P.4/regulator-comparison` | 4.4 |
| `Polylogarithms:P.4/relation-specialization-induction` | 4.1 |
| `Polylogarithms:P.4/specialization-and-delta` | 4.1 |
| `Polylogarithms:P.4/suslin-rigidity-adapter` | 4.2 |
| `Polylogarithms:P.4/weight-four-determinant-lifting` | 4.6 |
| `Polylogarithms:P.4/weight-four-regulator-input` | 4.5 |
| `Polylogarithms:P.4/weight-four-residue-map` | 4.7 |
| `Polylogarithms:P.4/weight-four-theorem` | 4.5/4.6 |
| `Polylogarithms:P.4/weight-four-totally-real` | 4.7 |
| `Polylogarithms:P.4/zagier-determinant` | 4.4 |
| `Polylogarithms:P.4/zagier-statement` | 4.4 |
| `Polylogarithms:P.5/admissible-chow-locus` | 5.3 |
| `Polylogarithms:P.5/analytic-cycle-current` | 5.2 |
| `Polylogarithms:P.5/arakelov-motivic-complex` | 5.12 |
| `Polylogarithms:P.5/beilinson-comparison-assembly` | 5.9/5.10 |
| `Polylogarithms:P.5/bft-auxiliary-complex` | 5.9 |
| `Polylogarithms:P.5/bft-current-dictionary` | 5.6 |
| `Polylogarithms:P.5/chow-dilogarithm` | 5.14 |
| `Polylogarithms:P.5/chow-dilogarithm-families` | 5.15 |
| `Polylogarithms:P.5/chow-dilogarithm-on-elliptic-curves` | 5.16 |
| `Polylogarithms:P.5/chow-dilogarithm-plane-curves` | 5.16 |
| `Polylogarithms:P.5/chow-dilogarithm-projective-line` | 5.15 |
| `Polylogarithms:P.5/chow-dilogarithm-steinberg` | 5.14 |
| `Polylogarithms:P.5/chow-polylogarithm-forms` | 5.11 |
| `Polylogarithms:P.5/compact-test-forms` | 5.1 |
| `Polylogarithms:P.5/cubical-beilinson` | 5.9 |
| `Polylogarithms:P.5/cubical-regulator` | 5.8 |
| `Polylogarithms:P.5/current-resolution` | 5.2 |
| `Polylogarithms:P.5/curve-polylogarithmic-complex` | 5.13 |
| `Polylogarithms:P.5/curve-symbol-chern-comparison` | 5.13 |
| `Polylogarithms:P.5/elliptic-fourier-comparison` | 5.18 |
| `Polylogarithms:P.5/elliptic-trilogarithm-summability` | 5.18 |
| `Polylogarithms:P.5/general-weight-reciprocity-conjecture` | 5.17 |
| `Polylogarithms:P.5/generalized-elliptic-trilogarithm` | 5.18 |
| `Polylogarithms:P.5/gersten-green-assembly` | 5.12 |
| `Polylogarithms:P.5/goncharov-deligne-complex` | 5.5 |
| `Polylogarithms:P.5/goncharov-deligne-complex-comparison` | 5.5 |
| `Polylogarithms:P.5/green-current-comparison` | 5.3 |
| `Polylogarithms:P.5/green-presentation` | 5.12 |
| `Polylogarithms:P.5/green-wang-product` | 5.9 |
| `Polylogarithms:P.5/higher-arakelov-chow-degree-zero` | 5.12 |
| `Polylogarithms:P.5/integration-comparison` | 5.9 |
| `Polylogarithms:P.5/logarithmic-current-estimate` | 5.4 |
| `Polylogarithms:P.5/logarithmic-green-forms` | 5.3 |
| `Polylogarithms:P.5/manifold-currents` | 5.1 |
| `Polylogarithms:P.5/mixed-regulator` | 5.10 |
| `Polylogarithms:P.5/mixed-wang-forms` | 5.10 |
| `Polylogarithms:P.5/poincare-lelong` | 5.2 |
| `Polylogarithms:P.5/r-form` | 5.4 |
| `Polylogarithms:P.5/r-form-differential` | 5.4 |
| `Polylogarithms:P.5/r-forms-and-distributions` | 5.4 |
| `Polylogarithms:P.5/r-wang-comparison` | 5.7 |
| `Polylogarithms:P.5/reciprocity-algebraic-numbers` | 5.15 |
| `Polylogarithms:P.5/reciprocity-projective-line` | 5.15 |
| `Polylogarithms:P.5/reciprocity-second-triangle` | 5.14 |
| `Polylogarithms:P.5/regulator-homotopy` | 5.9 |
| `Polylogarithms:P.5/regulator-induces-beilinson` | 5.9/5.10 |
| `Polylogarithms:P.5/regulator-map-chain-map` | 5.5 |
| `Polylogarithms:P.5/regulator-map-on-higher-chow` | 5.5 |
| `Polylogarithms:P.5/regulator-map-real` | 5.5 |
| `Polylogarithms:P.5/residue-map` | 5.4 |
| `Polylogarithms:P.5/simplex-form` | 5.5 |
| `Polylogarithms:P.5/simplicial-cubical-comparison` | 5.10 |
| `Polylogarithms:P.5/strong-reciprocity-conjecture` | 5.14 |
| `Polylogarithms:P.5/strong-reciprocity-implies-suslin` | 5.14 |
| `Polylogarithms:P.5/unramified-weight-two-class` | 5.13 |
| `Polylogarithms:P.5/wang-boundary-currents` | 5.7 |
| `Polylogarithms:P.5/wang-differential` | 5.7 |
| `Polylogarithms:P.5/wang-forms` | 5.7 |
| `Polylogarithms:P.5/weight-three-curve-regulator` | 5.17 |
| `Polylogarithms:P.5/weight-three-motivic-comparison` | 5.17 |
| `Polylogarithms:P.5/weight-three-pairing` | 5.18 |
| `Polylogarithms:P.5/weight-three-relation-descent` | 5.17 |
| `Polylogarithms:P.5/weight-two-regulator-form` | 5.13 |
| `Polylogarithms:P.6/leopoldt-equivalence` | 6.1 |
| `Polylogarithms:P.6/leopoldt-statement` | 6.1 |
| `Polylogarithms:P.6/padic-regulator` | 6.1 |
| `Polylogarithms:P.6/single-valued-trilogarithm-differential` | 6.2 |
| `Polylogarithms:P.6/tests` | 6.3 |
| `Polylogarithms:P.6/trilogarithm-differential-regression-tests` | 6.2 |

## Verification and handoff to review

- All six input packets were checked with `python3 scripts/check_blueprint.py`: each returned exit 0, zero errors and zero warnings. Their inherited mathematical gaps remain recorded above, even where the structural checker says complete.
- Exact scratch arithmetic enumerated all signed permutations using rational determinants and prime-valuation exterior coordinates. The r4/r5 and top-sign witnesses in the table were rerun independently of Lean. The full compared coordinate dictionaries matched, not just one selected coordinate. Rescaling the first moment vector changed the middle map, as expected.
- A 60-digit mpmath diagnostic checked five-term, Kummer, R22, L3 directional derivatives at nonreal and real points, and the D Laplacian. Residuals were at rounding scale; these are diagnostic checks, never proofs. The p7 congruence was exact integer arithmetic.
- The ten signature cross-checks were: zagier_three_exists, zagier_four_exists, blochWigner_fiveTerm, polylog_hasSum, polylog_one, singleValued_inversion, blochWigner_differential, cycleLift_iff, etaJet_steinberg and singleValued_three_differential. Endpoint/domain, universal-cycle and embedding conditions match the README. The empty-period theorem and concrete derivative-half control were also checked.
- `lean-check research/blueprint/packages/Polylogarithms/Suggested.lean` passed (exit 0): 349 lines, 18 admitted theorem targets, and only the expected `declaration uses sorry` warnings. All examples have proofs; all data definitions have real bodies.
- `python3 research/blueprint/intake.py check-files` on the four deliverables passed: 4 files, 0 problems. The staged diff whitespace and deliverable-scope checks also passed. No language server, lake build/update/cache operation or parallel worker-local Lean process was used.

The next action after intake is independent package review. In particular review should preserve the exact cycle-lifting, normalization, current-model and elliptic-limit boundaries, and integrate the named supplier prefixes before treating these contracts as already-live dependencies. No edit to a supplier or current upstream roadmap is included in this job.
