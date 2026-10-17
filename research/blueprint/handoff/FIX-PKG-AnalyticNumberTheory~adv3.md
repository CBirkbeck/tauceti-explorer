# FIX-PKG-AnalyticNumberTheory~adv3

Issue #10249. Codex, session `codex-Digyy3`, 17 October 2026. Complete compaction and package split. The fixing verdict requested by the issue is **accepted**; this is not an independent review. No second job was taken.

## Result and authorized scope

The reviewed input README was 986,296 bytes. Conservative compaction retained too much mathematics for one 350 KB document, so this uses the issue's explicit fallback: two complete folders, **AnalyticNumberTheoryPartI** and **AnalyticNumberTheoryPartII**, with Part I lower. Each has a README, representative Suggested.lean, metadata and fixing verdict. Each README is below 350,000 bytes, even interpreting KB as decimal. The unsuffixed folder is now a compatibility index, preserving every old explicit anchor and routing readers to the owner. Its Suggested.lean documents the two replacement files and elaborates independently. The unsuffixed metadata is unchanged.

The issue's enumerated deliverables do not list the two new folders, but its compaction paragraph expressly authorizes this split. Those eight package files are consequently part of this submission. If automatic intake uses only the enumerated paths, the maintainer must recognize the authorized split; no queue, checker or ownership data has been edited to circumvent that restriction.

| Package | Responsibility | README bytes | Suggested.lean |
| --- | --- | ---: | --- |
| AnalyticNumberTheory | Old-link routing index | 87,635 | 14 lines; no mathematical declarations |
| AnalyticNumberTheoryPartI | Layers 0–3: quantitative primes, explicit formulas, Hecke/Artin comparisons, multiplicative estimates, smooth numbers, proved moments | 348,030 | 369 lines; 42 sorry warnings |
| AnalyticNumberTheoryPartII | Layers 4–6: Lerch/Hurwitz/Barnes, cubic and quadratic double series, BC and compact scalar determinants | 347,788 | 226 lines; 17 sorry warnings |

Layer and target numbers remain unchanged. New local anchors use the visible section number, for example `s2-32g`; the old long anchors remain in the unsuffixed index. The Lean namespace becomes `TauCetiRoadmap.AnalyticNumberTheoryPartI` or `TauCetiRoadmap.AnalyticNumberTheoryPartII`. The mathematical bodies of the original representative file are an exact ordered partition, with no theorem, example, definition body or hypothesis removed. Consumers of the suggested namespace should use the owning part.

## Finding-by-finding disposition

The requested `REV-PKG-AnalyticNumberTheory~adv.md` is absent. The available unsuffixed review and `REV-PKG-AnalyticNumberTheory~2.md`, plus the adv2 handoff, specify the inherited findings. Their mathematical fixes are preserved; the new finding is excessive size.

| Finding | Final disposition |
| --- | --- |
| Compaction to upstream scale | Split after removing repeated narrative and shortening proof routes; both complete READMEs meet the decimal 350 KB ceiling. No target was traded for size. |
| Repeated prerequisite catalogues | Four Part I and thirteen Part II list abbreviations factor repeated `Needs` sets. Recursive expansion reproduces all 236 original prerequisite sets exactly; abbreviations introduce no mathematical targets. |
| Repeated proof/narrative material | Removed 142 exact repeated source/compatibility sentences within their numbered topic; shortened 79 proof paragraphs to their decisive arguments. Layers 0–3 consolidate repeated obligation recaps into proof-route checks. Numerical certificates, source-proof boundaries, uniformity and effectivity qualifications remain requirements. |
| Repeated links and citations | Repeated URLs use reference definitions; a full author/title bibliography supplies the numbered source links. Section/page/theorem locators remain with their targets. Long legacy anchors move to the routing index, rather than being deleted. |
| One-way split | No Part I link or prerequisite points to Part II. The conjectural moment-normalization recap belongs to Layer 4; proved second/fourth moments stay in Layer 3. Part II consumes Part I's contracts, never the converse. |
| G1 scalar heat, spectrum, Gaussian trace and Weyl | Part II retains P7/P7a realization, the explicit hyperbolic heat kernel, Gaussian trace with primitive multiplicities, all-order heat remainder, Mellin subtraction, Weyl bound and determinant normalization. General automorphic Hilbert sums are not used as a scalar Gaussian supplier. |
| G2 BC completion, KMS and measured factors | Part II retains OperatorAlgebraDynamics D1/D2/D7, AmenableGroups #821 and VonNeumannAlgebras #889 as exact generic suppliers. Generator boundedness, the BC corner/dilation, arithmetic ratio witnesses and sign comparison remain local. |
| G3 fixed-degree arithmetic, Zaman 35/19 | Part I retains all four numerical parameter cases, integer rounding, normal-closure/conductor budgets, nonnormal residue lower bounds, regularized endpoints and the separate reciprocal estimate needed for logarithmic derivatives. |
| G4 prime/character/Hilbert/Gamma proofs | Generic #253 theory remains imported. The differentiated Gamma remainder, two-character family repulsion, uniform rational dictionary/contours, low-zero-safe half-interval kernel and 6pi Hilbert mean-square constant remain local refinements. |
| G5 multiplicative/Sathe/Shiu/Beurling | Part I retains the exact C(kappa) class, fixed-A coefficient transfer, shifted norm intersection sieve, Shiu remainder, and both directions of the all-logarithmic Beurling equivalence. |
| G6 cubic local distributions, order one, Fourier/Bochner | Part II retains general-base projective cubic arithmetic, all local distributions and measure factors, Datskovsky–Wright/Igusa and Wright-thesis source targets, the fixed-strip Fourier constant, and the explicit connected-tube proof route. |
| G7 complex Lerch/Hurwitz/Barnes | Part II retains complex c, the Gamma–Laplace majorants, Hurwitz subtraction, corrected monodromy/odd sign, canonical Barnes product and full-sector remainder with its nonuniform sector constant. |
| Round 2 duplication with ZerosOfLFunctions | Imported OrderLE, E1, order-one Hadamard, ordinary Gamma asymptotics, divisor/counts, convexity, zero-free/exceptional API, Riemann–von Mangoldt and rational explicit-formula/PNT remain imports. No removed duplicate has been reintroduced. Higher-genus/origin-zero, numerical/degree-uniform, family and nonabelian refinements remain distinct. Mestre retains its Rankin–Selberg consumer beyond degree one. |
| ArithmeticStatistics ordering | It remains downstream only, in Part II's consumer list. Cubic projective parametrization, finite weighted fibres, uniform degree-at-most-three field counting, relative torsion/regulator estimates, quadratic large sieve and primitive-real fourth moment are owned in Part II Layer 5. No ST supplier or dependency was added. |
| Exemplar shape and suggested Lean | Each part has scope, conventions, exact suppliers, build order, numbered layers, APIs, Checks, examples, dependencies, consumers and references. Heavy carriers stay README targets; the representative files have real-bodied light definitions and end statements, no sorry-valued data, no placeholder theory development. |

## Preservation, navigation and dependency audit

After normalizing link destinations and removing only the added subsidiary section labels, all **236 primary first statements and 257 subsidiary first statements** are exact matches to the reviewed input. The 97 complete Check blocks and all 675 target/example bullets match, including all 330 planning-API bullets. The same targets, hypotheses, equations and numerical certificate requirements remain; proof condensation does not promote an implementation obligation to an established theorem.

All 497 old explicit anchors resolve through the routing index. The parts' 1,396 local link uses resolve to existing files/anchors, with no duplicate explicit IDs or missing reference definitions. All 236 `Needs` lists have the same expanded prerequisite sets. Their resolved anchored graph is acyclic and has no edge to a later layer. The boundary audit finds zero Part I → Part II links. The four explicit Part II → Part I target references concern qualitative prime boundaries, the Dedekind comparison and proved zeta moments; Part II also imports the shared supplier contracts through its introductory boundary.

Exact rational calculations independently check the mod-8 character orthogonality, 16-by-16 reciprocity matrix square and entries 1/2 and -1/2, the affine order-six orbit and tube points, the cubic discriminants/covariance witnesses including F2/F3, B4-B4(1/2)=-1/16, the positive theta subtraction margin, G(4)=2, G(5)=12, G(7)=34560 and g(3)=1/8640, and the scalar zero-mode subtraction at genus 2. These are computational witnesses, not proofs of the sorry statements.

## Supplier and source boundaries

The representation-induction, contour/prime-counting, real Dedekind residue, circle-Hurwitz, profinite/adele, positive-functional and compact spectral results remain imports. The nine newer upstream roadmap directions were checked against their available README/Suggested files and the current library; this run introduces no new mathematical target. Relevant Brauer/monomial/transitivity and DifferentialGeometry Stokes/Green signatures were reread. OperatorAlgebraDynamics D1/D2/D7 was read on actual main, so its new generic exports are not rebuilt locally.

The read-only provided roadmap checkout is feature commit `0d144d044dacebca17b654695b6f1ad58f159b27`. Actual TauCetiRoadmap main was rechecked at `350e970ce49f707a327909beac0b7b7c782cc7ee`; current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No build ran in either checkout. The elaboration pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and historical Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The inherited open supplier heads remain LFunctions #248 `e632e3a41fc257fce7b0d9938d48507b962f4fbb` and ZerosOfLFunctions #253 `cce2e04188a559be9a16037d0d65e00a815fcecc`.

This is a compaction of the source-backed adv2 package, not a new source-extraction job or a proof of all planned theorems. All primary locators and attribution remain with the mathematics. The earlier fixing handoff records the primary-source evidence for the mathematical repairs. Publicly stated results whose original proof input is not freely available retain that boundary, especially Igusa 1984 Theorem 1 and Wright's 1982 thesis behind Datskovsky–Wright Theorem 6.2(ii). No restricted book or source passage has been copied into this submission. Results and shortened proof routes are in our own words.

## Validation

- `lean-check` on the unsuffixed routing file and both parts: all exit 0. The routing file has no warnings; Part I has 42 and Part II 17 `declaration uses sorry` warnings, with no other diagnostics. Available memory exceeded 20 GB before each sequential run; no Lean process remains running.
- `python3 scripts/check_sorry_data.py` on all three suggested files: exit 0.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticNumberTheory.json`: 0 errors, 0 warnings. The historical packet is unchanged and still has its 239-node inventory; package splitting does not rewrite its atlas identifiers.
- Exact statement, Check, bullet, expanded-prerequisite, namespace-body-partition and local-navigation comparisons: pass with the counts above. Numeric/rational witness calculations: pass.
- `python3 research/blueprint/intake.py check-files` on all twelve changed deliverables: pass, 0 problems.
- `git diff --check`: pass.

Nothing remains for this fix. For upstream packaging, submit Part I before Part II (or in one explicitly ordered submission), update package discovery to the two owner names, and retain the unsuffixed routing index while old atlas/packet links are in use. Packet/queue/discovery edits are maintainer follow-up, outside this issue's package-only scope. The mathematics remains a roadmap to formalization.

## Adversarial pass table

Every primary statement was reread with its hypotheses and retained Checks; the table records the boundary instances. The same carriers and theorem bodies remain in Suggested.lean: no `variable`/`include` block was changed. Representation tests include rank 0/1, trivial groups and wild primes; cubic tests include fields, DVRs, nonprincipal modules and characteristics 2/3. Spectral claims keep compactness, connectedness and genus >=2; the empty/finite spectra are benchmarks rather than assertions that a compact hyperbolic surface has a finite spectrum. General reductive supplier statements and general-base cubic targets remain general. Neither conjectures nor conditional hypotheses are asserted as theorems.

“Retained” in the change column means that the mathematical statement is unchanged; only placement, linking, repeated prose or the proof route changed. All rows pass these instance checks under the printed hypotheses. This table does not claim a full proof of the planned analytic theorems.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §0.1 Exceptional real zero | c=0; N=1; beta at either strict endpoint | Both endpoints and the principal conductor are excluded. | Retained; placement/navigation compacted. |
| §0.2 Chebyshev sum in a residue class | q=1; residue 0 mod 2; x below 2 | Inclusive sums give the empty sum below 2; a nonunit class has only bad-prime powers. | Retained; placement/navigation compacted. |
| §0.3 Schoenfeld explicit Chebyshev bound | 0<x<2; x=2 | Empty theta is 0; the strict inequality excludes x=0. | Retained; placement/navigation compacted. |
| §0.4 Prime powers do not erase the character-sum margin | k=2e10; coefficients 1 and -1; higher prime powers | The positive subtraction margin exceeds .1239; coefficient absolute values are used. | Retained; placement/navigation compacted. |
| §0.5 Rosser–Schoenfeld explicit prime-count bounds | x=59; x below the asserted threshold | Only the first is in the numerical range. | Retained; placement/navigation compacted. |
| §0.6 Bounded-height Landau–Page theorem | T=2; equal/distinct characters; principal conductor 1 | One common smaller width is chosen; per-character uniqueness does not imply family uniqueness. | Retained; proof route shortened. |
| §0.7 Quadratic real-zero separation from one | q=3; q=400000; beta far/near 1 | The finite range and near/far split are retained; 12/.27356>40. | Retained; proof route shortened. |
| §0.8 Weighted-prime sum input to the factorial estimate | x=319; common error parameter | The common threshold and sign of both inequalities survive. | Retained; placement/navigation compacted. |
| §0.9 Siegel's theorem | epsilon>0; fundamental D=-3,5; D=1 | D=1 is excluded; the constant may be ineffective. | Retained; placement/navigation compacted. |
| §0.10 Prime-number input | x=2; eventual x; interval endpoints | The assertion is eventual; the strict lower endpoint and inclusive upper endpoint survive. | Retained; placement/navigation compacted. |
| §0.11 Mertens's first theorem and Σ_{p &#124; N} log p/p = O(log log N) | x=2; cutoff at a prime; N a prime power | Changing strict to inclusive costs at most log(x)/x. | Retained; proof route shortened. |
| §0.12 Effective distance of a quadratic real zero from one | d=-1,2; beta=1/2; epsilon>0 | Conductors are 4 and 8; the strict beta hypothesis and effective constants remain. | Retained; proof route shortened. |
| §0.13 Exceptional quadratic squareclasses | empty finite set; d=-1,2; beta at cutoff | Empty selection is allowed; the character is canonical and the interval is closed as stated. | Retained; proof route shortened. |
| §0.14 Pole-cancelled Riemann xi | s=0,1,2,-1 | Xi gives 1/2,1/2,pi/6,pi/6 with analytic pole cancellation. | Retained; proof route shortened. |
| §0.15 Elementary canonical factors of every genus | genus n=0,1; w=0,1; paired w,-w | E0=1-w; E1(w)E1(-w)=1-w^2. | Retained; placement/navigation compacted. |
| §0.16 Mod-eight prime mass | a=3,5 mod 8; threshold k | Both classes and the eventual numerical threshold are retained. | Retained; placement/navigation compacted. |
| §0.17 Two-real-zero inequality | same/distinct primitive characters; two real zeros | Distinctness is required; the nonnegative four-function product has only one principal pole. | Retained; placement/navigation compacted. |
| §0.18 Effective character prime-number estimate | primitive nonprincipal chi; exceptional beta present/absent | The exceptional term has negative sign and remains explicit. | Retained; placement/navigation compacted. |
| §0.19 Explicit reciprocal-prime estimate | x=286; common Mertens constant | The numerical threshold and exact definition of B survive. | Retained; placement/navigation compacted. |
| §0.20 Weighted prime sum on an interval | x=y; endpoints at primes | An empty interval gives 0 above the negative lower bound. | Retained; placement/navigation compacted. |
| §0.21 Mertens's second theorem: the reciprocal-prime sum | x=2; prime cutoff; integral tail | The reciprocal-prime constant is shared and the Abel tail converges absolutely. | Retained; proof route shortened. |
| §0.22 Origin-zero adapter for Hadamard factorization | f=1; z^2 exp(z); 1-z^2; f=0 | Origin orders 0,2,0 are allowed; the zero function is excluded. | Retained; placement/navigation compacted. |
| §0.23 Finite-order Hadamard factorization | rho=0,1,3/2; finite or empty zero divisor | floor(rho)+1>rho; the zero function is excluded. | Retained; placement/navigation compacted. |
| §0.24 Repulsion of exceptional conductors | equal conductors; N2=N1^2 | Strict repulsion conclusion retains its distinctness and common-width hypotheses. | Retained; placement/navigation compacted. |
| §0.25 Explicit prime Euler-product bound | x=1e8; finite Euler subproduct | The numerical range and retained-subset inequality survive. | Retained; placement/navigation compacted. |
| §0.26 Mertens's third theorem: the Euler product | x=2; expansion -log(1-u); constant integral | The positive integral defining gamma has the retained sign. | Retained; proof route shortened. |
| §0.27 Landau repulsion for exceptional squareclasses | d=-e with equal absolute value; d=e; conductor factors at 2 | Distinct squareclasses, not absolute values, determine distinct characters; Q<=4 abs(d). | Retained; proof route shortened. |
| §0.28 Quadratic prime-character interval estimate | u=v; strict prime endpoints; d=-1 | Only u<v is asserted; the v-envelope and conductor 4 correction survive. | Retained; proof route shortened. |
| §0.29 Strict derivative positivity requires nonpolynomiality | f=1; polynomial 1+z^2; nonpolynomial cosh z; zero function | Strict derivative positivity needs nonpolynomiality; paired coefficients are nonnegative. | Retained; placement/navigation compacted. |
| §0.30 Rational Dirichlet-to-ray-class dictionary | q=1; chi_-4; principal level 6; quartic mod 5 | Deleted 2,3 factors survive; chi(2)=i distinguishes chi from its inverse by 2i. | Retained; placement/navigation compacted. |
| §0.31 Mertens product input | y=2; q=3; sigma=1-1/log(q) | The near-one interval has sigma>0 and a uniform derivative constant. | Retained; placement/navigation compacted. |
| §0.32 Siegel–Walfisz theorem | q=1; q at log-power cutoff; nonunit residue | Only unit classes have the asymptotic; constants precede q,a,x and may be ineffective. | Retained; proof route shortened. |
| §0.33 Zero-free zeta strip and logarithmic bounds | s=1; bounded/high height; beta approaching 0 | Pole-subtracted and reciprocal functions use analytic extensions at 1. | Retained; proof route shortened. |
| §1.1 Reciprocal zeta on the line one | t=0; small nonzero t; large height | The reciprocal is filled by 0 at the pole; the logarithmic bound is quantitative. | Retained; placement/navigation compacted. |
| §1.2 Davenport uniform Möbius exponential cancellation | alpha=0; rational major arc; irrational minor arc; nonunit residue | The estimate is uniform in alpha, retaining both arc arguments and the narrow rectangle. | Retained; placement/navigation compacted. |
| §1.3 Admissible Weil test function | F=0; exp(-abs(x)); Gaussian; one-tail-only test | Both weighted tails and one-sided regularity are required. | Retained; placement/navigation compacted. |
| §1.4 Half-interval explicit formula and low-zero-safe bound | k=4,T=2; rho approaching 0; endpoint prime powers | The subtracted kernel tends to log 2 and multiplicity/half weights survive. | Retained; placement/navigation compacted. |
| §1.5 Mean square of a Dirichlet polynomial | N=0,1,2; T=1; coefficients 1,i | The main term is 2T and the Hilbert error is 6pi times the n-weighted diagonal. | Retained; placement/navigation compacted. |
| §1.6 Riemann and generalized Riemann hypotheses as statements | q=1; principal pole; deleted-factor zero on Re=0 | RH comparison excludes the pole and all Re=0 zeros. | Retained; placement/navigation compacted. |
| §1.7 Selberg zero-density input | sigma=1/2,1; Q=T=2; repeated/exceptional zeros | Counts have multiplicity; the possible exceptional zero is retained. | Retained; placement/navigation compacted. |
| §1.8 Weil's explicit formula (Mestre's formalism) | F=0; even compact support; one-tail F; zero Gamma slope | Both reflected tails and nonzero constant Gamma factors are required. | Retained; placement/navigation compacted. |
| §1.9 Prime error terms under RH and GRH | q=1; fixed q>1; nonunit class | RH/GRH remain hypotheses; fixed-q error does not assert growing-q uniformity. | Retained; placement/navigation compacted. |
| §2.1 Nielsen cores and their oriented boundary maps | D=28 two periods; log y on a rectangle; reversed orientation | Areas 2pi,5pi and Stokes value 1/4 retain multiplicity and orientation. | Retained; placement/navigation compacted. |
| §2.2 Artin conductors from lower ramification | zero/trivial representation; tame character; Q(i) at 2 | Exponents 0,1,2 distinguish wild from tame ramification. | Retained; placement/navigation compacted. |
| §2.3 Hecke series and Tate integral comparison | K=Q; trivial character; unramified local factor | The different and Haar factors remain; the series is only compared on Re>1. | Retained; proof route shortened. |
| §2.4 Hecke boundary adapter for Landau positivity | principal simple pole; regular boundary point; finite class quotient | Meromorphic order <=0 permits a pole; it is not a finite nonzero value. | Retained; proof route shortened. |
| §2.5 Dedekind continuation and real-side comparison | K=Q; s=1; Re(s)>1 | The residue is 1 over Q; pole germs are distinct from totalized series values. | Retained; placement/navigation compacted. |
| §2.6 Sufficient conductor-discriminant estimate | g=1; trivial representation separated; unrelated Galois overfield | The normal closure and actual Artin conductor are required; no arbitrary parameter replaces them. | Retained; proof route shortened. |
| §2.7 Quadratic zeta factorization and the residue quotient | E=Q(i), F=Q; ramified prime 2 | The full Euler factorization retains ramified factors and a positive residue quotient. | Retained; placement/navigation compacted. |
| §2.8 Partial ideal zeta series | K=Q; unit/zero ideal; principal/nonprincipal class | The unit is counted once, the zero ideal never; norm-zero powers are avoided. | Retained; proof route shortened. |
| §2.9 Lemma 4.4 (Zaman's effective lower bound for prime ideals) | B=35; D=1; secondary zero 1-beta | The large-D threshold, integer ceiling and every parameter row survive. | Retained; placement/navigation compacted. |
| §2.10 Imaginary quadratic genus-character classification | D=-3,-4; trivial genus character; factor 1 | Ordinary/narrow transport needs total complexity and unordered factor pairs. | Retained; proof route shortened. |
| §2.11 Artin local polynomial | zero/trivial representation; ramified one-dimensional character | Local polynomials are 1,1-T,1 respectively; inertia invariants are essential. | Retained; proof route shortened. |
| §2.12 Primitive Hecke functional-equation normalization | primitive principal/nonprincipal; odd/even real local type | The completed principal poles and primitive conductor remain. | Retained; placement/navigation compacted. |
| §2.13 Ideal-character Hecke L-function | trivial class character; nontrivial prime value | The Euler denominator retains chi(p), correcting the printed omission. | Retained; placement/navigation compacted. |
| §2.14 Siegel lower bound for real quadratic class number times regulator | D=5; norm-minus-one unit present/absent | Narrow class number and least norm-one regulator are related before applying Siegel. | Retained; placement/navigation compacted. |
| §2.15 Siegel lower bound for imaginary quadratic class numbers | D=-3,-4; epsilon>0 | The exceptional unit weights and possible ineffectivity remain. | Retained; placement/navigation compacted. |
| §2.16 Explicit residue bound for Dedekind zeta functions (Louboutin) | degree 1 versus 2; Q(i); positive Mellin kernel | Degree 1 is excluded from the sharp denominator; Q(i) gives a valid upper bound. | Retained; placement/navigation compacted. |
| §2.17 Imaginary quadratic completion and root number | D=-4,-3; s=0,1; odd character | Root number is +1; standard completion values are 1 and 1/sqrt(3). | Retained; proof route shortened. |
| §2.18 Imaginary quadratic class-number value at one | D=-4,-3; h=1; u=2,3 | L(1)=pi/4 and pi/(3sqrt(3)), fixing the half-unit convention. | Retained; proof route shortened. |
| §2.19 Artin Euler series | zero/trivial representation; ramified character; dimension 2 | The series is 1 or Dedekind as appropriate; general coefficients are not completely multiplicative. | Retained; proof route shortened. |
| §2.20 Negative even zeros of the continuation | K=Q; n=1; real/complex quadratic field | Orders at -2 are 1,2,1 respectively; the continuation is evaluated. | Retained; proof route shortened. |
| §2.21 Canonical ray-character comparison and the quadratic endpoint | trivial ray quotient; nonreal character; quadratic character at 1 | The principal pole and positive auxiliary constant coefficient are retained. | Retained; placement/navigation compacted. |
| §2.22 Explicit degree-uniform Hecke convexity | K=Q; r=1/2; r decreasing to 0; principal pole | All degree and strip dependence is displayed; the implied constant is absolute. | Retained; placement/navigation compacted. |
| §2.23 Logarithmic functional equation at zero and one | CM over Q; g=1; real quadratic non-CM extension | Only odd infinity type has this finite endpoint logarithmic formula. | Retained; proof route shortened. |
| §2.24 Hecke CM partial-zeta identity | D=-4,-3; ordinary principal class | Weights omega=2,3 and the completed Eisenstein half-sum survive. | Retained; placement/navigation compacted. |
| §2.25 Hecke positive-sign real quadratic formula | D=5; norm-minus-one unit; C reversed | Arc-length integral is unchanged by reversal; full norm-one length is 2 log epsilon_D. | Retained; placement/navigation compacted. |
| §2.26 Genus Hecke factorization | factor 1; opposite/same discriminant signs | The DIT odd-completion scalar is retained; D=1 is excluded. | Retained; placement/navigation compacted. |
| §2.27 Hecke negative-sign real quadratic formula | real quadratic negative genus sign; reversed C | The differential integral changes sign; arc length cannot replace it. | Retained; placement/navigation compacted. |
| §2.28 Imaginary quadratic class-number value at zero | D=-4,-3; u=2,3 | Continued values at 0 are 1/2 and 1/3. | Retained; placement/navigation compacted. |
| §2.29 Global meromorphic Artin continuation | trivial group; zero representation; negative Brauer coefficient | Products are 1 or zeta as appropriate; meromorphy does not assert holomorphy. | Retained; proof route shortened. |
| §2.30 Imprimitive Hecke deleted factors | m=f0; repeated bad prime exponent; real-place modulus | Empty deletion product is 1; each finite prime occurs once. | Retained; proof route shortened. |
| §2.31 Sign of the quadratic Gauss sum from the Dedekind functional equation | D=-4,5; r nonunit; conductor 1 comparison | Odd Gauss phase is i; nonunits give 0; the quadratic sum needs odd discriminant. | Retained; proof route shortened. |
| §2.32 Artin continuation near the line one | trivial group; m=1; overlapping boundary discs; nonnormal cubic | The trivial pole is separated and the residue bound has no normality premise. | Retained; proof route shortened. |
| §2.33 Bounded-degree Brauer-Siegel | K=Q; fixed degree; D tending to infinity | The assertion is eventual; bounded-D exceptions are handled separately. | Retained; placement/navigation compacted. |
| §2.34 Two-sided subpolynomial values at one | g=1; negative Brauer powers; trivial Hecke factors | Principal orders cancel before values; reciprocal bounds are separate from Cauchy. | Retained; proof route shortened. |
| §2.35 A fixed small circle gives a subpolynomial derivative | epsilon small; radius min(epsilon,1/4); a zero inside disk | A full fixed circle suffices for L-prime; no zero-free disk is needed. | Retained; placement/navigation compacted. |
| §2.36 Theorem3 negative factors | two negative factors; Re(s)=1/2; cusp constant term | Stokes is used on the critical line; the Re>1 raw area integral is divergent. | Retained; placement/navigation compacted. |
| §2.37 Theorem3 positive factors | factor 1; positive factors; narrow class J | Meromorphic identity retains the full norm-one geodesic and DIT completion. | Retained; placement/navigation compacted. |
| §2.38 Theorem3 CM factors | D=-3,-4; opposite signs; omega=3,2 | The 2sqrt(pi)/omega factor survives unchanged. | Retained; placement/navigation compacted. |
| §2.39 Ray-class L-function zero-density estimate | sigma=1/2; sigma tending to 1; repeated zero | The open right edge and multiplicity count remain; constants depend on degree and epsilon. | Retained; proof route shortened. |
| §2.40 Heilbronn's theorem on real zeros of Dedekind zeta functions | trivial group; quadratic Galois field; simple beta | The trivial group has no asserted real zero; Aramata handles negative virtual orders. | Retained; placement/navigation compacted. |
| §2.41 Eisenstein series at a CM point equals a partial zeta function | D=-4,-3; inverse class; Re>1 | Primitive half-sum and u=#units/2 are retained; inverse classes have equal partial zeta. | Retained; proof route shortened. |
| §2.42 Artin holomorphy as a hypothesis | zero/trivial/regular representation; deleted ramified factor | Artin holomorphy remains a hypothesis with the exact pole multiplicity. | Retained; proof route shortened. |
| §2.43 Extended Riemann hypothesis for Dedekind and Hecke L-functions | K=Q,Q(i); zero at 0 in a real quadratic field | The open critical strip excludes trivial endpoint zeros. | Retained; placement/navigation compacted. |
| §2.44 Explicit exceptional-zero region for an abelian character product | trivial extension; K=Q; product with many characters | The simultaneous numerical region is additional to per-character uniqueness. | Retained; proof route shortened. |
| §2.45 Logarithmic functional equation | g=1; conjugate nonreal factor; even infinity type | The conjugate endpoint and odd gamma shift remain; even factors need regularization. | Retained; proof route shortened. |
| §2.46 Factorwise logarithmic derivative at one | negative Brauer powers; trivial factors; epsilon/2 split | Endpoint germs and reciprocal bounds are required before taking the logarithmic derivative. | Retained; placement/navigation compacted. |
| §2.47 Uniform subpolynomial Dedekind residues | degree 1,D=1; nonnormal cubic; finite small-D range | No division by log D; constants may be ineffective and degree-uniform. | Retained; placement/navigation compacted. |
| §2.48 Eisenstein Weyl sums bounded by Dirichlet L-values | opposite/same factor signs; s=1/2 | The same completed factors and half-unit/geodesic normalizations are consumed. | Retained; placement/navigation compacted. |
| §2.49 Many split primes outside a small quadratic exception set | X=2; Y=4; empty Y-range; exceptional family | An empty admissible range is harmless; the exceptional family and uniform error remain. | Retained; proof route shortened. |
| §2.50 Effective Chebotarev density theorem | L=F=Q; quadratic extension; exceptional beta present | D=1 is separate; the Li exceptional term is not absorbed at the displayed threshold. | Retained; proof route shortened. |
| §2.51 Two-sided quadratic Hecke value bound | g=1; F=Q; residue ratio | Positive L(1)=kappa_E/kappa_F and the two residue exponent losses are retained. | Retained; placement/navigation compacted. |
| §2.52 Subpolynomial logarithmic derivative at one | small L(1); bounded derivative; epsilon/2 twice | A derivative bound alone cannot bound its logarithmic quotient. | Retained; placement/navigation compacted. |
| §3.1 Explicit divisor subpower bound | n=1; epsilon large/small; a=0,1 | The explicit constant is at least 1; local factors include exponent 0. | Retained; placement/navigation compacted. |
| §3.2 Largest prime factor of a quadratic conductor | conductor 4,8,24; N=1 | The nontrivial-conductor hypothesis excludes log 1. | Retained; placement/navigation compacted. |
| §3.3 Uniform coefficient bound by a divisor function | degree n=1; m=1; split/ramified primes | The unit ideal gives 1; the coefficient injection uses all residue degrees. | Retained; placement/navigation compacted. |
| §3.4 Subpolynomial fixed-order divisor function | n=1; m=1; prime exponent a=0 | d1(m)=1 and the binomial local factor is 1 at a=0. | Retained; placement/navigation compacted. |
| §3.5 Products of distinct medium primes | m=0,1,2,3; x=4,10 | Sets are {1},{5,7},{35},empty at x=10; the lower prime endpoint is included. | Retained; placement/navigation compacted. |
| §3.6 Inverse-totient counting input | x=1; d=1,2 | Both totients are 1; the asymptotic allows one absolute constant. | Retained; placement/navigation compacted. |
| §3.7 Maximal-order divisor upper bound | n=1,2; eventual n; prime powers | Only n above K>e enters log log denominators. | Retained; placement/navigation compacted. |
| §3.8 Even von Mangoldt function | n=0,-2,-8,-6 | Values are 0,log 2,log 2,0. | Retained; placement/navigation compacted. |
| §3.9 Coprime Möbius sums weighted by log t/t | q=1; q at T^4; t=1 | The main term is -q/phi(q); t=1 contributes 0. | Retained; placement/navigation compacted. |
| §3.10 Gamma Euler-product truncation | n=0,1; empty retained prime subset | Gamma0=1; the empty product is 1 and all subset constants are uniform. | Retained; placement/navigation compacted. |
| §3.11 Size of 1/φ(n) and of the divisor function (3.7) | n=1,2,3 | Only n>=3 is asserted, avoiding log log 1. | Retained; placement/navigation compacted. |
| §3.12 Coprime Möbius sums weighted by 1/t | q=1; q at T^4 | The prime-exclusion argument retains uniformity in the growing modulus. | Retained; placement/navigation compacted. |
| §3.13 Landau–Ramanujan count of sums of two squares | k=1,2; eventual K | Counts positive represented integers once, including repeated representations only once. | Retained; placement/navigation compacted. |
| §3.14 Landau upper bound for shifted Eisenstein norms | k=1; p=2 Eisenstein norm condition | The norm-zero shift is counted once and the criterion includes prime 2. | Retained; placement/navigation compacted. |
| §3.15 Elementary shifted-square count | K=1,4,5 | Counts are 0,1,2 and satisfy 1+sqrt(max(K-4,0)). | Retained; placement/navigation compacted. |
| §3.16 Counts supported on half the reduced prime classes | empty subgroup complement; a outside H; nu=1 | Only H is supported; unrestricted prime powers and the identity empty factorization remain. | Retained; proof route shortened. |
| §3.17 Logarithmic weight of prime divisors | N=2; N=p^k | Each prime is counted once; higher valuation does not duplicate log p/p. | Retained; placement/navigation compacted. |
| §3.18 Pretentious distance | f=g=1; f=1,g=-1; f=g=0; x=1 | Distance squares are 0,2 sum 1/p,1/2 at x=2,0 respectively. | Retained; placement/navigation compacted. |
| §3.19 Logarithmic-derivative coefficient class | f=1,mu,n^(it),n; n=0,1 | The first three have bounded logarithmic coefficients; f(n)=n does not belong to a fixed class. | Retained; placement/navigation compacted. |
| §3.20 Smooth-number counting function | x=0,6,8; y=2,3 | Counts 0,5,4 as appropriate; the library cutoff is floor(y)+1. | Retained; placement/navigation compacted. |
| §3.21 Dickman function | u=-1,0,1,2 | Values 0,1,1,1-log 2; no differentiability at 1 is asserted. | Retained; proof route shortened. |
| §3.22 Dirichlet divisor average | x=1,4; perfect-square hyperbola | The exact hyperbola identity retains the subtracted square and harmonic constant 2gamma-1. | Retained; placement/navigation compacted. |
| §3.23 Second moment of zeta | bounded T; k=1 normalization | Only eventual asymptotics are used; the leading coefficient is 1. | Retained; placement/navigation compacted. |
| §3.24 Fourth moment of zeta | bounded T; k=2 normalization | Only eventual asymptotics are used; the leading coefficient is 1/(2pi^2). | Retained; placement/navigation compacted. |
| §3.25 Beurling prime system | repeated prime 2; x=0,1,2; p1=1 | Repeated indices give N(2)=3; p1=1 is rejected. | Retained; placement/navigation compacted. |
| §3.26 Uniform divisor subpower bound | n=1; epsilon>0 | The constant is >=1 and independent of n. | Retained; placement/navigation compacted. |
| §3.27 Uniform bounded-norm ideal count | n=1; X=1; field degree 2g | The unit ideal contributes once and the constant precedes the field. | Retained; placement/navigation compacted. |
| §3.28 Cardinality of medium-prime products | m=0; m larger than available prime count | The binomial is 1 or 0 respectively; the asymptotic is for fixed m. | Retained; placement/navigation compacted. |
| §3.29 Truncated von Mangoldt function | z=1,2; n=0; prime p beyond cutoff | Lambda1=0; Lambda2(0)=log 2; a prime beyond z has truncated value 0. | Retained; placement/navigation compacted. |
| §3.30 Shifted coprime Möbius sum | q=1; q=floor(sqrt T); t=1 | The shifted log(qt) and shortened cutoff are both retained. | Retained; placement/navigation compacted. |
| §3.31 Asymptotic count of the three exceptional families | k=1,4; pairwise intersections | Intersection errors are smaller than K/sqrt(log K), so the two norm constants add. | Retained; placement/navigation compacted. |
| §3.32 Restricted squarefree Landau asymptotic | n=1,2,3,5; strict cutoff at n | 1,2,5 satisfy the prime restrictions; 3 does not; cutoff is strict. | Retained; placement/navigation compacted. |
| §3.33 Pretentious Halász mean bound | f=1; x=2; T=1 | M=0 for f=1 and the bound allows the normalized mean 1. | Retained; placement/navigation compacted. |
| §3.34 Dickman fixed-u asymptotic | u=1,2; fixed versus growing u | Only fixed-u convergence is asserted; rho(1)=1 and rho(2)=1-log 2. | Retained; placement/navigation compacted. |
| §3.35 Rankin smooth-number upper bound | x=1; y=2; sigma tending to 0 | The unit is counted; sigma>0 keeps every geometric factor finite. | Retained; placement/navigation compacted. |
| §3.36 Zeta function of an indexed Beurling system | ordinary primes; doubled prime indices; empty exponent vector | The zeta values are zeta,zeta squared,1 respectively; convergence is additional. | Retained; placement/navigation compacted. |
| §3.37 Shiu bound for the Halász coefficient class | q=1; z=x^epsilon; q at z^(1-epsilon) | The same coefficient class and uniform constants apply at the permitted endpoints. | Retained; placement/navigation compacted. |
| §3.38 Eventual unit-constant divisor bound | C=1; n at absorption threshold | The explicit exponent delta/2 and threshold absorb the constant. | Retained; placement/navigation compacted. |
| §3.39 Von Mangoldt truncation error | n=0; prime p>z; z>=abs(n)>0 | Errors are -log 2 at (0,2), log p,0 respectively. | Retained; placement/navigation compacted. |
| §3.40 Wintner-type mean over prime divisors | n=0; f=0; complex f | a=C=1 in the first two cases; absolute convergence controls complex signs. | Retained; proof route shortened. |
| §3.41 Restricted squarefree Sathe–Selberg bounds | r=0,1; r near A log log N; A>1 | r=0 is excluded; every fixed A is supported and constants depend on A. | Retained; placement/navigation compacted. |
| §3.42 Beurling PNT with all logarithmic remainders | ordinary primes; repeated primes; one remainder order versus all orders | Both implications require the full sequence of logarithmic remainder orders and true boundary extensions. | Retained; placement/navigation compacted. |
| §3.43 Mangoldt weight in a Fourier window | T=1; m=T^2; endpoints of Fourier window | All prime powers and inclusive endpoints are retained; the constant depends on c0. | Retained; proof route shortened. |
| §3.44 Uniform cancellation of the truncation error E_z (Corollary 3.3) | r=0; z=2; alpha=0 | The separate two-sided zero term has value -log 2 and is not discarded. | Retained; placement/navigation compacted. |
| §3.45 Halász integral mean bound | f=1; kappa>0; sufficiently large x | F is the canonical series, not an unrelated function; all constants are uniform in f. | Retained; placement/navigation compacted. |
| §4.1 Lerch transcendent | z=0,1/2; s=0,-1 | Phi(0,2,1)=1; Phi(1/2,0,c)=2; the n=0 term is retained. | Retained; proof route shortened. |
| §4.2 Complex-parameter Hurwitz series | c=1,1/2,1+i,0 | Complex shift difference at 1+i is -i/2; c=0 is excluded. | Retained; proof route shortened. |
| §4.3 Barnes G-function | G(0),G(-1),G(1),G(4),G(5); N=1; sector edge | Zeros have orders 1,2; values 1,2,12 and remainder -1/(720r^2)<R1<0 survive. | Retained; proof route shortened. |
| §4.4 Lerch differential equation | s=0,-1; z=0 | Differentiation gives -s with the retained minus sign; compact convergence justifies it. | Retained; placement/navigation compacted. |
| §4.5 Lerch continuation on a covering | s=1,c=1+i; c=0; loops about z=1,c=0 | Scale gives (1-i)/2; excluded boundary and monodromy signs survive. | Retained; proof route shortened. |
| §4.6 Nonpositive Lerch special values | m=0,1; z=0; c an integer | Rational special values have zero monodromy and extend in c. | Retained; placement/navigation compacted. |
| §4.7 Comparison with the circle-valued Hurwitz function | c=1,1/2; c=0 | The permitted circle representative is in (0,1]; c=1 maps to the Riemann case. | Retained; placement/navigation compacted. |
| §4.8 Periodic zeta and Lerch normalization | a=0,1/2; s=2 | The exponential-zeta identity has the z prefactor; integer a gives zeta. | Retained; placement/navigation compacted. |
| §4.9 Even Lerch functional relation | a=c=1/2; Gaussian even test | Even combination vanishes and multiplier is -i; integral endpoints are excluded. | Retained; proof route shortened. |
| §4.10 Odd Lerch functional relation | a=c=1/2; odd Gaussian test | Odd combination adds and multiplier is +1; Fourier eigenvalue is -i. | Retained; proof route shortened. |
| §4.11 Lerch boundary degeneration | s=2; s=0; radial r tending to 1 | Hurwitz limit is stated only for Re s>1; at s=0 the radial series diverges. | Retained; proof route shortened. |
| §4.12 Complex Hurwitz continuation | c=1,1/2,1+i; s=0,1,-1; strict remainder edge | Values -1/2,0,-1/2-i and R(1,c)=1 survive; the remainder half-plane is strict. | Retained; proof route shortened. |
| §4.13 Arithmetic and Barnes factors in the zeta moment conjecture | k=1,2,3; prime p=2 | a1g1=1; a2g2=1/(2pi^2); g3=1/8640; the k=2 local factor is 3/4. | Retained; proof route shortened. |
| §4.14 Moment model as a conditional comparison | k=1,2; general positive k | The first two match proved moments; general-k asymptotics remain conjectural. | Retained; proof route shortened. |
| §4.15 Dirichlet character Hurwitz specialization | q=1; principal imprimitive character; nonunit residue | The finite Hurwitz sum uses actual character values and retains the principal pole. | Retained; proof route shortened. |
| §4.16 Hurwitz Bernoulli values | m=0,1; c=1,1/2,1+i | Bernoulli convention gives 1/2-c at order 0 and -1/12 at (-1,1). | Retained; placement/navigation compacted. |
| §4.17 Lerch solvable-cover descent | s=0,-1; principal/nonprincipal sheet; second commutator | Nonpositive orders have zero monodromy; solvable descent follows analytic invariance. | Retained; proof route shortened. |
| §5.1 The four real characters modulo eight | all four unit residues; even input; row inner products | Conductors 1,4,8,8; the table gives H H-transpose=4I. | Retained; placement/navigation compacted. |
| §5.2 Swap of double-series variables | (0,0),(2,3); diagonal point | Swap fixes the diagonal and squares to the identity. | Retained; placement/navigation compacted. |
| §5.3 Quadratic reflection of double-series variables | (0,0),(2,3); s=1/2 | Reflection squares to the identity and fixes s=1/2. | Retained; placement/navigation compacted. |
| §5.4 Binary-cubic action, discriminant and local orbit data | zero form; uv(u-v); u^3-v^3; F2,F3; diagonal/unipotent | Discriminants 0,1,-27 and diagonal value -108 retain the determinant-square sign. | Retained; placement/navigation compacted. |
| §5.5 Cubic algebras and projective forms | free/nonprincipal rank-two module; zero form; characteristic 2,3 | All locally free cubic algebras are included; zero form gives a square-zero algebra. | Retained; placement/navigation compacted. |
| §5.6 Discriminant fibres and weighted cubic coefficients | split O^3; zero discriminant; nonmaximal order; place over 3 | Split weight is 1/6; zero discriminant is excluded and trace dual is a genuine restriction. | Retained; placement/navigation compacted. |
| §5.7 Uniform small-degree field-discriminant count | E=F; n=0,1; cyclic/non-Galois cubic; ell=1 | The identity extension and trivial torsion are included; constants precede F and n. | Retained; placement/navigation compacted. |
| §5.8 Binary-cubic local zeta integrals | Phi=0; unit-discriminant support; linear invariant over Qp | The shell benchmark is (1-p^-1)/(1-p^(-s-1)); cubic integrability is a separate assertion. | Retained; placement/navigation compacted. |
| §5.9 Signature-refined cubic Shintani zeta functions | split ring; square-zero ring; trace condition | Weight 1/6, exclusion and dual selector agree with the arithmetic coefficients. | Retained; proof route shortened. |
| §5.10 Local density and coefficient conventions agree | split stabilizer 6; residue characteristic 3; measure rescaling | The &#124;3&#124; and different factors cancel only after integral-normalization conversion. | Retained; proof route shortened. |
| §5.11 The selected adelic binary-cubic zeta integral | Phi=0; one-point quotient; rational right translate | Benchmark is 3*2^(2s); quotient inversion changes both action and determinant exponent. | Retained; proof route shortened. |
| §5.12 Ordinary cubic continuation data | xi=R/(s-1)+T/(s-5/6) | Clearance values R/6,-T/6 give residues 6C(1),-6C(5/6). | Retained; proof route shortened. |
| §5.13 Orders in a fixed étale cubic algebra | split/quadratic/cubic local types; p=2,3 | Index exponent 2s and all five distinct local factors are retained. | Retained; placement/navigation compacted. |
| §5.14 The selected quadratic double Dirichlet series | d=1,9; principal twist; odd coefficients | chi9(3)=0; the outer zeta2 correction is not absorbed into a coefficient. | Retained; placement/navigation compacted. |
| §5.15 Quadratic reciprocity matrix | A00; A05; A squared | Entries are 1/2,-1/2 and the square is I16 using exact rational arithmetic. | Retained; placement/navigation compacted. |
| §5.16 Primitive quadratic twist data | eta=1,3,5,7; twists 0,1,2,3 | The primitive conductor and parity table retains all 2-adic cases. | Retained; placement/navigation compacted. |
| §5.17 Imprimitive odd quadratic twist | d=1,9; input 2,3 | Even values vanish; the square factor at 3 is not erased. | Retained; placement/navigation compacted. |
| §5.18 Iterated continuation tubes | (2,2),(-2,-2),(0,0) | They lie in B0, B4 minus B3, and outside B5 respectively. | Retained; placement/navigation compacted. |
| §5.19 The binary-cubic archimedean functional-equation matrix | one real/complex place; s=1 | Real entries vanish at least once and the complex factor twice; global order is degree n. | Retained; proof route shortened. |
| §5.20 From arithmetic cubic orbits to analytic coefficients | free/nonprincipal lattice; split ring; zero discriminant | All class components and automorphism stabilizers are included in the coefficient comparison. | Retained; proof route shortened. |
| §5.21 The two cubic poles and their residues | Phi=0; u=0,1/3,5/3,2; fixed Fourier strip; all class components | Adelic/arithmetic residues differ by the factor 1/2; no all-half-plane Fourier constant is asserted. | Retained; placement/navigation compacted. |
| §5.22 Continued odd quadratic L-function | twists (1,1),(1,9); s=-1,1 | Continuation gives 1/12 at -1 in the first case; the principal pole is retained. | Retained; placement/navigation compacted. |
| §5.23 Local quadratic reflection ratio | even ratio at s=0; odd twist; conductor factor 8 | Even ratios vanish; odd Gamma shifts remain and the Euler denominator is nonzero for Re<1. | Retained; placement/navigation compacted. |
| §5.24 The cubic global matrix functional equation | one real/complex place; s=1; dual versus ordinary | The sine matrix and degree/discriminant factors remain distinct from quadratic reciprocity. | Retained; proof route shortened. |
| §5.25 Pole-cleared quadratic L-function | principal d=1,9; nonprincipal twist; s=1 | Filled pole-clearance values are 1/2,1/3,0. | Retained; placement/navigation compacted. |
| §5.26 Quadratic reflection matrix | s=0; principal/even/odd blocks | Principal block vanishes, while the odd entry is 4/(3pi). | Retained; placement/navigation compacted. |
| §5.27 The degree-dependent zero at the origin | degree 1,2; s=0 | Only n>=2 forces a zero; the lower vanishing order is n-1. | Retained; placement/navigation compacted. |
| §5.28 Pole-aware cubic convexity bound | t=0,1,-1; poles 1,5/6 | The stated bound requires abs(t)>=1; pole-clearance precedes strip interpolation. | Retained; placement/navigation compacted. |
| §5.29 Quadratic large sieve and primitive real-character moment | M=1,N=3; coefficients (1,1),(1,-1); common prime 3 | Squared sums are 4,0; common-factor symbol is 0; nonsquarefree data require the square-pair correction. | Retained; placement/navigation compacted. |
| §5.30 Meromorphic continuation and the three polar hyperplanes | connected/disconnected tube; m=0,1,2; annular base; shell denominators | Connectedness is required; exact center correction and polynomial growth survive pole clearance/gluing. | Retained; placement/navigation compacted. |
| §6.1 The positive rational ax+b subgroup | identity; negative dilation; translation 1 conjugated by dilation 2 | Positive diagonals are required; conjugation gives translation 1/2. | Retained; proof route shortened. |
| §6.2 The finite-adele scaling measure | beta=1; valuation k=0,1; prime p=2 | Local masses are geometric; beta=1 recovers additive Haar. | Retained; placement/navigation compacted. |
| §6.3 Eisenstein recurrence polynomials | k=0,1,2,3,4 | Polynomials 0,X,X^2-1/4,X^3-X/4,X^4-X^2/3+1/48 fix the recurrence. | Retained; placement/navigation compacted. |
| §6.4 Positive-spectrum zeta and heat series | one positive eigenvalue; zero mode; scale c>0 | Zero contributes only to heat; spectral scaling gives c^(-s). | Retained; placement/navigation compacted. |
| §6.5 Ratio set of a nonsingular action | identity on one point; lambda=0,1,2 | Ratio set is {1}; pushforward derivative is evaluated at the target. | Retained; proof route shortened. |
| §6.6 Finite spectral determinant benchmark | empty/single spectrum; lambda=1/4 | Determinants are 1,lambda+u; quadratic pullback has a double zero. | Retained; placement/navigation compacted. |
| §6.7 Integral translation subgroup | translations 2,1/2; conjugation by dilation 2 | Only 2 is integral; conjugation sends 1 to 1/2 outside the integral subgroup. | Retained; placement/navigation compacted. |
| §6.8 Translations and positive dilations | translation 0; dilation 1; translations 1/2 and 1/3 | Identity and sum 5/6 fix matrix conventions. | Retained; placement/navigation compacted. |
| §6.9 Ergodicity of positive rationals on finite adeles | empty finite prime set; trivial/nontrivial unit character; beta=1 | Empty projection is identity; reciprocal-prime divergence kills nontrivial characters. | Retained; placement/navigation compacted. |
| §6.10 All normalized scaling measures | zero measure; atom at 0; beta=0,1 | Normalization rejects zero; beta>0 excludes the atom; beta=0 is a negative control. | Retained; proof route shortened. |
| §6.11 The scalar Selberg primitive-geodesic product | one primitive class; two copies; inverse class | Duplicating the class list squares Z and changes its trace multiplicities. | Retained; placement/navigation compacted. |
| §6.12 Spectral zeta is regular at zero | one scalar zero mode; genus 2; small t; finite positive spectrum | Heat subtraction gives zeta_plus(0)=a1-1=-4/3 for genus 2. | Retained; placement/navigation compacted. |
| §6.13 Entire shifted determinant | u=0,1,-lambda; repeated eigenvalue | D has a simple zero-mode factor and exact spectral multiplicities; genus-one product is normally convergent. | Retained; proof route shortened. |
| §6.14 Positive diagonal homomorphism | identity; dilation 2; product of dilations 2,3 | Diagonal values 1,2,6 fix multiplicativity. | Retained; placement/navigation compacted. |
| §6.15 The regularized scalar Laplace determinant | empty positive spectrum; one/two positive eigenvalues | Primed determinants are 1,lambda,lambda1*lambda2; unprimed shifts retain the zero mode. | Retained; placement/navigation compacted. |
| §6.16 (P⁺_ℚ, P⁺_ℤ) is a Hecke pair | diag a=2,1/2; translation conjugation | Intersections have the stated denominator/numerator indices m,n. | Retained; proof route shortened. |
| §6.17 The compact Selberg determinant comparison | genus 2; s=1; real s>1; transform outside convergence | The constant sign and det-prime comparison remain; continuation replaces a divergent integral. | Retained; placement/navigation compacted. |
| §6.18 The Bost–Connes Hecke algebra | n=1,2; gamma=1/2 | x2-prime*x2=2 and x2*x2-prime=1+e(1/2), distinguishing the order. | Retained; proof route shortened. |
| §6.19 The compact Selberg functional equation | s=1-s; branches on the right half-plane | Integer powers give a branch-independent meromorphic identity factor. | Retained; placement/navigation compacted. |
| §6.20 Selberg zeros and scalar spectral parameters | lambda below/equal/above 1/4; zero mode | Orders are m,2m,m at the spectral roots; endpoint orders are 2g-1 and 1. | Retained; placement/navigation compacted. |
| §6.21 The presentation of the rational Bost–Connes algebra | n=m=1,2; coprime pair 2,3; gamma=0,1/2 | Common-factor reduction has scalar gcd; translation fibres have exactly n elements. | Retained; placement/navigation compacted. |
| §6.22 The Bost–Connes time evolution | z=0; z=-i/2; n=2; degree-1 product | Time factor is a^(iz); imaginary time sends mu_n to x_n and fixes x2*x2-prime. | Retained; proof route shortened. |
| §6.23 Operator constructions for the Bost–Connes completion | scalar 1; isometry mu2; e(1/2); M2 vector state | Generator bounds precede positive-functional extension; ground and KMS differ. | Retained; placement/navigation compacted. |
| §6.24 The reduced Bost–Connes C*-algebra | identity coset; x2; delta at identity | Row/column bounds give the norm; coefficient recovery proves faithfulness before closure. | Retained; proof route shortened. |
| §6.25 Coefficient state on the Hecke core | 1; e(1/2); x2*x2-prime | Coefficient state values are 1,0,1 in rational normalization. | Retained; placement/navigation compacted. |
| §6.26 First trigonometric Eisenstein function | N=1,2,3; trivial/nontrivial torsion character | First values at 0,1/2 are 0; level 3 coefficients are -1/6,+1/6. | Retained; proof route shortened. |
| §6.27 The two rational forms of the Bost–Connes algebra | n=m=1; mu2; z=-i/2 | mu2 is not rational-valued; the imaginary-time map is not a star map. | Retained; proof route shortened. |
| §6.28 The representation on ℓ²(ℕ≥1) and its Hamiltonian | k=1,2; n=2; translations | x2-prime kills epsilon1; mu2 is an isometry with the specified adjoint. | Retained; proof route shortened. |
| §6.29 KMS_β states on the Bost–Connes algebra | f=x2-prime,g=x2; beta>0; opposite imaginary-time sign | The positive sign gives phi(mu2*mu2-star)=2^(-beta); the opposite sign fails. | Retained; proof route shortened. |
| §6.30 Completed KMS states and the bounded strip condition | trivial dynamics on M2; dense entire core; beta=1 | Completed KMS means the bounded strip; a vector state need not be tracial. | Retained; placement/navigation compacted. |
| §6.31 Higher trigonometric Eisenstein functions | k=0,2,3; a=0,1/2,1/3 | Degenerate values -1/4 and 0 retain the corner-unit convention. | Retained; placement/navigation compacted. |
| §6.32 BC diagonal heat operator | epsilon1,epsilon2; beta=1; beta<=1 trace | The heat operator is positive of norm 1; trace finiteness needs beta>1. | Retained; placement/navigation compacted. |
| §6.33 Completed coefficient state | mu2; e(1/2); trivial semigroup; nontrivial group | The range projection is proper; the general crossed product is supplied by D1/D2. | Retained; placement/navigation compacted. |
| §6.34 KMS states and scaling measures | q=1,2; diagonal function; nonidentity rational coefficient | Expectation kills q!=1; scaling mass and weak topology match the KMS sign. | Retained; proof route shortened. |
| §6.35 The symmetry group Ẑ^× = Aut(ℚ/ℤ) | v=1,-1; doubling on Q/Z | Units give automorphisms; doubling is not bijective and violates the relation at n=2. | Retained; proof route shortened. |
| §6.36 KMS∞ states and upper-half-plane ground states | beta tending to infinity; trivial dynamics on M2 | The epsilon1 state is a KMS limit; a nontracial vector state is only ground in the matrix control. | Retained; proof route shortened. |
| §6.37 The trigonometric arithmetic algebra equals the BC rational form | N=2,4; zero cotangent root; p=2; corner e | Zero roots are retained; Newton/Cayley calculations use the corner unit e and the special p=2 relation. | Retained; placement/navigation compacted. |
| §6.38 Ground state at an invertible lattice | 1; e(1/2); mu2 | Vector-state values are 1,-1,0. | Retained; placement/navigation compacted. |
| §6.39 The partition function is the Riemann zeta function | beta=1,2; first basis vector | The scalar trace diverges at 1 and equals zeta(2) at 2. | Retained; placement/navigation compacted. |
| §6.40 Critical-regime KMS uniqueness | beta=1; convex t in (0,1); unit identity | Extreme averaging and normalization give uniqueness without a general Choquet premise. | Retained; proof route shortened. |
| §6.41 The measured operator algebra and factor classification | trivial action on two points; free finite action; q=2,beta=1 | Ergodicity and nonsingularity matter; Tomita imaginary factor 2 is reciprocal to BC factor 1/2. | Retained; placement/navigation compacted. |
| §6.42 The critical KMS factors have type III₁ | finite matrix factor; zero/nonzero corner; ratio lambda=1,2 | A nonzero corner alone does not imply III1; full ratio set and all hypotheses are required. | Retained; placement/navigation compacted. |
| §6.43 The Gibbs states φ_{β,u} | beta=2; e(1/2); x2; x2*x2-prime | Values are -1/2,0,1/2 on the last three; the state is not multiplicative. | Retained; proof route shortened. |
| §6.44 Completed Gibbs state | 1; e(1/2); mu2*mu2-star | Values 1,2^(1-beta)-1,2^(-beta) retain the completed normalization. | Retained; placement/navigation compacted. |
| §6.45 The Gibbs states are KMS_β states | two normal-form monomials; beta>1 | Positive-integer reindexing proves the KMS sign without cyclically commuting an unbounded exponential. | Retained; proof route shortened. |
| §6.46 Gibbs barycentre of a probability measure | Dirac measure; convex mixture; mu2*mu2-star | Barycentre recovers a Gibbs state or its mixture and keeps mass 2^(-beta). | Retained; proof route shortened. |
| §6.47 Cyclotomic values and Galois action on extremal KMS∞ states | translation 1/2; conjugation; nontranslation basis monomial | Values -1 and 0 fix the cyclotomic character; no continuity of field automorphisms is used. | Retained; proof route shortened. |
| §6.48 High-β extremal states and unique barycentres | Dirac/mixed measure; beta tending to 1 from above | Unit restriction has mass 1/zeta(beta); unique probability barycentres and their extremes are retained. | Retained; placement/navigation compacted. |
| §6.49 Arithmetic values and symmetry intertwining | gamma=0,1/2; beta tending to infinity | Roots of unity generate Qcycl; the uniform Gibbs tail tends to 0. | Retained; placement/navigation compacted. |
| §6.50 The Bost–Connes phase transition | beta=1; beta>1; unit identity/inverse | The phase boundary and free transitive high-beta unit action remain explicit. | Retained; proof route shortened. |

### Subsidiary statements

All 257 named subsidiary first statements also match exactly. The following rows enumerate them by parent; each listed ingredient was checked under the parent controls, with its local domain/normalization restriction retained. The entries include empty and singleton local factors, both signs of complex height, Gamma poles and branches, finite-group triviality, inertia at wild primes, every class-group component, connectedness of tubes, finite-prime empty sets, nonzero corners, and weak rather than norm topology for measures. No subsidiary statement or premise was deleted during proof condensation.

| Statements (local labels) | Instances / controls | Result and change |
| --- | --- | --- |
| §0.23a | rho=0,1,3/2; finite or empty zero divisor | floor(rho)+1>rho; the zero function is excluded. All statements retained. |
| §0.29a, §0.29b | f=1; polynomial 1+z^2; nonpolynomial cosh z; zero function | Strict derivative positivity needs nonpolynomiality; paired coefficients are nonnegative. All statements retained. |
| §0.30a | q=1; chi_-4; principal level 6; quartic mod 5 | Deleted 2,3 factors survive; chi(2)=i distinguishes chi from its inverse by 2i. All statements retained. |
| §0.31a, §0.31b | y=2; q=3; sigma=1-1/log(q) | The near-one interval has sigma>0 and a uniform derivative constant. All statements retained. |
| §1.2a | alpha=0; rational major arc; irrational minor arc; nonunit residue | The estimate is uniform in alpha, retaining both arc arguments and the narrow rectangle. All statements retained. |
| §1.4a, §1.4b, §1.4c, §1.4d | k=4,T=2; rho approaching 0; endpoint prime powers | The subtracted kernel tends to log 2 and multiplicity/half weights survive. All statements retained. |
| §1.5a | N=0,1,2; T=1; coefficients 1,i | The main term is 2T and the Hilbert error is 6pi times the n-weighted diagonal. All statements retained. |
| §2.9a | B=35; D=1; secondary zero 1-beta | The large-D threshold, integer ceiling and every parameter row survive. All statements retained. |
| §2.16a | degree 1 versus 2; Q(i); positive Mellin kernel | Degree 1 is excluded from the sharp denominator; Q(i) gives a valid upper bound. All statements retained. |
| §2.17a | D=-4,-3; s=0,1; odd character | Root number is +1; standard completion values are 1 and 1/sqrt(3). All statements retained. |
| §2.18a | D=-4,-3; h=1; u=2,3 | L(1)=pi/4 and pi/(3sqrt(3)), fixing the half-unit convention. All statements retained. |
| §2.21a, §2.21b, §2.21c, §2.21d, §2.21e, §2.21f | trivial ray quotient; nonreal character; quadratic character at 1 | The principal pole and positive auxiliary constant coefficient are retained. All statements retained. |
| §2.29a, §2.29b, §2.29c, §2.29d, §2.29e | trivial group; zero representation; negative Brauer coefficient | Products are 1 or zeta as appropriate; meromorphy does not assert holomorphy. All statements retained. |
| §2.32a, §2.32b, §2.32c, §2.32d, §2.32e, §2.32f, §2.32g | trivial group; m=1; overlapping boundary discs; nonnormal cubic | The trivial pole is separated and the residue bound has no normality premise. All statements retained. |
| §2.40a, §2.40b | trivial group; quadratic Galois field; simple beta | The trivial group has no asserted real zero; Aramata handles negative virtual orders. All statements retained. |
| §3.1a, §3.1b, §3.1c | n=1; epsilon large/small; a=0,1 | The explicit constant is at least 1; local factors include exponent 0. All statements retained. |
| §3.7a, §3.7b, §3.7c | n=1,2; eventual n; prime powers | Only n above K>e enters log log denominators. All statements retained. |
| §3.12a, §3.12b | q=1; q at T^4 | The prime-exclusion argument retains uniformity in the growing modulus. All statements retained. |
| §3.18a, §3.18b, §3.18c | f=g=1; f=1,g=-1; f=g=0; x=1 | Distance squares are 0,2 sum 1/p,1/2 at x=2,0 respectively. All statements retained. |
| §3.22a, §3.22b | x=1,4; perfect-square hyperbola | The exact hyperbola identity retains the subtracted square and harmonic constant 2gamma-1. All statements retained. |
| §3.28a | m=0; m larger than available prime count | The binomial is 1 or 0 respectively; the asymptotic is for fixed m. All statements retained. |
| §3.31a | k=1,4; pairwise intersections | Intersection errors are smaller than K/sqrt(log K), so the two norm constants add. All statements retained. |
| §3.34a | u=1,2; fixed versus growing u | Only fixed-u convergence is asserted; rho(1)=1 and rho(2)=1-log 2. All statements retained. |
| §3.35a | x=1; y=2; sigma tending to 0 | The unit is counted; sigma>0 keeps every geometric factor finite. All statements retained. |
| §3.36a, §3.36b | ordinary primes; doubled prime indices; empty exponent vector | The zeta values are zeta,zeta squared,1 respectively; convergence is additional. All statements retained. |
| §3.38a | C=1; n at absorption threshold | The explicit exponent delta/2 and threshold absorb the constant. All statements retained. |
| §3.40a | n=0; f=0; complex f | a=C=1 in the first two cases; absolute convergence controls complex signs. All statements retained. |
| §3.42a, §3.42b, §3.42c | ordinary primes; repeated primes; one remainder order versus all orders | Both implications require the full sequence of logarithmic remainder orders and true boundary extensions. All statements retained. |
| §3.44a | r=0; z=2; alpha=0 | The separate two-sided zero term has value -log 2 and is not discarded. All statements retained. |
| §3.45a | f=1; kappa>0; sufficiently large x | F is the canonical series, not an unrelated function; all constants are uniform in f. All statements retained. |
| §4.3a | G(0),G(-1),G(1),G(4),G(5); N=1; sector edge | Zeros have orders 1,2; values 1,2,12 and remainder -1/(720r^2)<R1<0 survive. All statements retained. |
| §4.4a, §4.4b, §4.4c | s=0,-1; z=0 | Differentiation gives -s with the retained minus sign; compact convergence justifies it. All statements retained. |
| §4.5a, §4.5b, §4.5c, §4.5d, §4.5e, §4.5f | s=1,c=1+i; c=0; loops about z=1,c=0 | Scale gives (1-i)/2; excluded boundary and monodromy signs survive. All statements retained. |
| §4.6a | m=0,1; z=0; c an integer | Rational special values have zero monodromy and extend in c. All statements retained. |
| §4.9a | a=c=1/2; Gaussian even test | Even combination vanishes and multiplier is -i; integral endpoints are excluded. All statements retained. |
| §4.12a | c=1,1/2,1+i; s=0,1,-1; strict remainder edge | Values -1/2,0,-1/2-i and R(1,c)=1 survive; the remainder half-plane is strict. All statements retained. |
| §4.17a | s=0,-1; principal/nonprincipal sheet; second commutator | Nonpositive orders have zero monodromy; solvable descent follows analytic invariance. All statements retained. |
| §5.3a, §5.3b, §5.3c, §5.3d, §5.3e | (0,0),(2,3); s=1/2 | Reflection squares to the identity and fixes s=1/2. All statements retained. |
| §5.10a, §5.10b | split stabilizer 6; residue characteristic 3; measure rescaling | The &#124;3&#124; and different factors cancel only after integral-normalization conversion. All statements retained. |
| §5.13a, §5.13b, §5.13c, §5.13d, §5.13e, §5.13f | split/quadratic/cubic local types; p=2,3 | Index exponent 2s and all five distinct local factors are retained. All statements retained. |
| §5.15a | A00; A05; A squared | Entries are 1/2,-1/2 and the square is I16 using exact rational arithmetic. All statements retained. |
| §5.21a, §5.21b, §5.21c, §5.21d, §5.21e, §5.21f, §5.21g, §5.21h, §5.21i, §5.21j, §5.21k, §5.21l, §5.21m, §5.21n, §5.21o, §5.21p, §5.21q, §5.21r, §5.21s, §5.21t, §5.21u, §5.21v | Phi=0; u=0,1/3,5/3,2; fixed Fourier strip; all class components | Adelic/arithmetic residues differ by the factor 1/2; no all-half-plane Fourier constant is asserted. All statements retained. |
| §5.24a | one real/complex place; s=1; dual versus ordinary | The sine matrix and degree/discriminant factors remain distinct from quadratic reciprocity. All statements retained. |
| §5.27a, §5.27b, §5.27c, §5.27d | degree 1,2; s=0 | Only n>=2 forces a zero; the lower vanishing order is n-1. All statements retained. |
| §5.28a, §5.28b | t=0,1,-1; poles 1,5/6 | The stated bound requires abs(t)>=1; pole-clearance precedes strip interpolation. All statements retained. |
| §5.30a, §5.30b, §5.30c, §5.30d, §5.30e, §5.30f, §5.30g, §5.30h, §5.30i, §5.30j, §5.30k, §5.30l, §5.30m, §5.30n, §5.30o, §5.30p, §5.30q, §5.30r, §5.30s, §5.30t, §5.30u, §5.30v, §5.30w, §5.30x, §5.30y, §5.30z, §5.30aa, §5.30ab | connected/disconnected tube; m=0,1,2; annular base; shell denominators | Connectedness is required; exact center correction and polynomial growth survive pole clearance/gluing. All statements retained. |
| §6.2a | beta=1; valuation k=0,1; prime p=2 | Local masses are geometric; beta=1 recovers additive Haar. All statements retained. |
| §6.4a | one positive eigenvalue; zero mode; scale c>0 | Zero contributes only to heat; spectral scaling gives c^(-s). All statements retained. |
| §6.9a, §6.9b, §6.9c, §6.9d, §6.9e | empty finite prime set; trivial/nontrivial unit character; beta=1 | Empty projection is identity; reciprocal-prime divergence kills nontrivial characters. All statements retained. |
| §6.12a, §6.12b, §6.12c, §6.12d, §6.12e, §6.12f, §6.12g, §6.12h, §6.12i, §6.12j | one scalar zero mode; genus 2; small t; finite positive spectrum | Heat subtraction gives zeta_plus(0)=a1-1=-4/3 for genus 2. All statements retained. |
| §6.13a, §6.13b | u=0,1,-lambda; repeated eigenvalue | D has a simple zero-mode factor and exact spectral multiplicities; genus-one product is normally convergent. All statements retained. |
| §6.16a | diag a=2,1/2; translation conjugation | Intersections have the stated denominator/numerator indices m,n. All statements retained. |
| §6.17a, §6.17b, §6.17c, §6.17d, §6.17e, §6.17f, §6.17g, §6.17h | genus 2; s=1; real s>1; transform outside convergence | The constant sign and det-prime comparison remain; continuation replaces a divergent integral. All statements retained. |
| §6.18a, §6.18b | n=1,2; gamma=1/2 | x2-prime*x2=2 and x2*x2-prime=1+e(1/2), distinguishing the order. All statements retained. |
| §6.20a, §6.20b, §6.20c | lambda below/equal/above 1/4; zero mode | Orders are m,2m,m at the spectral roots; endpoint orders are 2g-1 and 1. All statements retained. |
| §6.21a, §6.21b, §6.21c, §6.21d, §6.21e, §6.21f, §6.21g, §6.21h, §6.21i, §6.21j, §6.21k, §6.21l, §6.21m, §6.21n | n=m=1,2; coprime pair 2,3; gamma=0,1/2 | Common-factor reduction has scalar gcd; translation fibres have exactly n elements. All statements retained. |
| §6.24a, §6.24b, §6.24c, §6.24d, §6.24e, §6.24f | identity coset; x2; delta at identity | Row/column bounds give the norm; coefficient recovery proves faithfulness before closure. All statements retained. |
| §6.26a | N=1,2,3; trivial/nontrivial torsion character | First values at 0,1/2 are 0; level 3 coefficients are -1/6,+1/6. All statements retained. |
| §6.28a, §6.28b | k=1,2; n=2; translations | x2-prime kills epsilon1; mu2 is an isometry with the specified adjoint. All statements retained. |
| §6.30a | trivial dynamics on M2; dense entire core; beta=1 | Completed KMS means the bounded strip; a vector state need not be tracial. All statements retained. |
| §6.33a, §6.33b, §6.33c, §6.33d, §6.33e, §6.33f, §6.33g, §6.33h, §6.33i | mu2; e(1/2); trivial semigroup; nontrivial group | The range projection is proper; the general crossed product is supplied by D1/D2. All statements retained. |
| §6.34a, §6.34b, §6.34c, §6.34d, §6.34e, §6.34f, §6.34g, §6.34h | q=1,2; diagonal function; nonidentity rational coefficient | Expectation kills q!=1; scaling mass and weak topology match the KMS sign. All statements retained. |
| §6.36a, §6.36b | beta tending to infinity; trivial dynamics on M2 | The epsilon1 state is a KMS limit; a nontracial vector state is only ground in the matrix control. All statements retained. |
| §6.37a, §6.37b, §6.37c, §6.37d, §6.37e, §6.37f, §6.37g, §6.37h, §6.37i, §6.37j, §6.37k, §6.37l | N=2,4; zero cotangent root; p=2; corner e | Zero roots are retained; Newton/Cayley calculations use the corner unit e and the special p=2 relation. All statements retained. |
| §6.40a, §6.40b, §6.40c | beta=1; convex t in (0,1); unit identity | Extreme averaging and normalization give uniqueness without a general Choquet premise. All statements retained. |
| §6.42a, §6.42b, §6.42c, §6.42d, §6.42e, §6.42f, §6.42g, §6.42h, §6.42i | finite matrix factor; zero/nonzero corner; ratio lambda=1,2 | A nonzero corner alone does not imply III1; full ratio set and all hypotheses are required. All statements retained. |
| §6.43a | beta=2; e(1/2); x2; x2*x2-prime | Values are -1/2,0,1/2 on the last three; the state is not multiplicative. All statements retained. |
| §6.45a | two normal-form monomials; beta>1 | Positive-integer reindexing proves the KMS sign without cyclically commuting an unbounded exponential. All statements retained. |
| §6.46a | Dirac measure; convex mixture; mu2*mu2-star | Barycentre recovers a Gibbs state or its mixture and keeps mass 2^(-beta). All statements retained. |
| §6.47a | translation 1/2; conjugation; nontranslation basis monomial | Values -1 and 0 fix the cyclotomic character; no continuity of field automorphisms is used. All statements retained. |
| §6.48a, §6.48b, §6.48c, §6.48d | Dirac/mixed measure; beta tending to 1 from above | Unit restriction has mass 1/zeta(beta); unique probability barycentres and their extremes are retained. All statements retained. |
| §6.49a | gamma=0,1/2; beta tending to infinity | Roots of unity generate Qcycl; the uniform Gibbs tail tends to 0. All statements retained. |
| §6.50a | beta=1; beta>1; unit identity/inverse | The phase boundary and free transitive high-beta unit action remain explicit. All statements retained. |
