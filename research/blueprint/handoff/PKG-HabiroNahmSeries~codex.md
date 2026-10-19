# PKG-HabiroNahmSeries~codex — completed package

Issue [#10882](https://github.com/CBirkbeck/tauceti-explorer/issues/10882). Worker: Codex, GPT-6; session `codex-PPV1ZT`. The claim bot confirmed this session at 17:07 UTC on 19 October 2026. This is one completed packaging job, not an implementation or a checkpoint. No second job was taken.

## Deliverables and coverage

The [README](../packages/HabiroNahmSeries/README.md) is the definitive seven-layer roadmap. It is written in our own words, with exact formulas, hypotheses, source locators, supplier contracts, definition APIs and discriminating Checks. The [Suggested.lean](../packages/HabiroNahmSeries/Suggested.lean) contains only light definitions on existing carriers, ten theorem targets and proved examples. Heavy constructions remain named README targets and are listed in its closing comment. [metadata.toml](../packages/HabiroNahmSeries/metadata.toml) sets `topic = "math.NT"`.

The inputs were queried by node rather than read as whole JSON files. The base and six refinements contain 183 nodes, 248 API records and 177 test records (176 distinct test names: `m_one` occurs twice). The assembled reader and its six part readers were read alongside the suggested inputs. The new README reorganises their mathematics by construction rather than reproducing their identifiers or source order.

| Input stage | Base nodes | Refinement nodes | Package location and disposition |
| --- | ---: | ---: | --- |
| HB.3 | 12 | 7 | Layer 1: analytic/formal data, equations, cleared Jacobian, coherent fields, signed and unsigned classes, regulators. Integral conventions are kept distinct. |
| HB.4 | 20 | 13 | Layer 2: actual convergence, uniform remainders, saddle and tails, Gaussian/lattice comparison, congruence splitting, coefficient fields and arithmetic descent, Andrews–Gordon acceptance. |
| HB.5a | 8 | 0 | Layer 3: existing cusp objects are consumed; width-normalised scalar growth is the local addition. |
| HB.5 | 11 | 7 | Layer 4: every-root majorants, all-cusp valuations, modularity, fixed fields and bounded multipliers, integral divisibility and torsion. |
| HB.8 | 30 | 15 | Layer 5: plethystic invariants, exact q-systems, integral shifts and independent orbit proof, finite support, corrected level localisation, full Gaussian comparisons and rank-one WKB. |
| HB.9 | 17 | 18 | Layer 6: full coefficient algebra, divisibility transfer, first jet, p-adic potential, finite-Chern orientation, module descent, product gluing and descendant transport. |
| HB.10 | 11 | 14 | Layer 7: residues, cubic and both quartic orbits, exact arithmetic certificates, knot-derived examples, Gauss/Rogers–Ramanujan families and precise cohomological exports. |

The existing assembly handoff's mathematical gap ledger remains controlling. This package does not change packet statements, source-issue verdicts, reviews, coverage metadata, campaign files or other roadmaps.

## What cannot be asserted unconditionally

The roadmap now supplies a target and a domain for each required comparison. Packaging does not prove these targets. In particular the following stronger claims are unsupported by the available arguments and are not asserted as established facts:

1. An unmultiplied signed integral Bloch class or a canonical K₃ lift. Symmetry leaves a 2-primary boundary; retain the owner's convention change and explicit lift.
2. All-order coefficientwise Kummer descent from a constant-term calculation, or descent to a smaller rational-power field without a comparison. Layer 2 names the actual automorphism, field and eigenspace comparisons. The nonzero-unit assertion has its own nonvanishing hypothesis.
3. Global Gaussian identification from the local repair of the Pochhammer remainder. `gaussianGlobalNormalisation` and `gaussianMixedRegularity` are full targets; `formalGaussian_identification` consumes them. The elementary finite-support proof uses integral orbit ratios independently.
4. Printed level admissibility over the smaller cyclotomic localisation. An explicit order-four pole forces the larger ring in §5.5. `levelAdmissibilityCancellation` has the restricted order condition and handles all residue indices.
5. Integral coefficient transfer through a preferred formal branch. The rank-one A=5, p=5 example loses a square-root component. `fullCoefficientDivisibilityTransfer`, or an intrinsic full-algebra congruence proof, is necessary.
6. Membership from a cyclic constant alone. The finite-Chern orientation, first jet, modified-potential specialisation, finite étale module extension on all components, effective global descent and all-order product gluing are separate named inputs of `nondegenerateNahm_habiroMembership`.
7. Unpowered auxiliary products over arbitrary integral coefficients. Their definition divides by γ; the construction is over coefficients with γ inverted. q-system uniqueness requires regular recursion factors, not merely a formal assertion that q is not a root of unity.
8. Cubic all-order integrality at 2 and 3, including independent descendants. These have explicit extension and gluing targets; a few integral coefficients do not establish them.
9. Quartic exact 60-torsion, a compatible K₃ lift, a tame-kernel prime list, or all-order membership from degree-27 data. Exact certificates are requested. Both quartic factors, their normal closures and a nonzero regulator certificate for the S₄ factor are distinguished. The displayed D₄ coefficients belong to a specified shifted, inverted-q analytic normalisation.
10. A knot invariant from its matrix, a global coefficient line from a regulator number, or higher Habiro cohomology from degree-zero scalar membership. The topology and cohomology owners receive exact comparison targets. GW's whole-disc carrier and its positive-radius analytic push-forward are separate; all cohomological degrees remain in the comparison request.

These are mathematical work specified by the roadmap, not unfinished packaging work. The next contributor can start at the named target in the indicated subsection without interpreting a placeholder proposition or an admitted carrier.

## Duplication, current-library audit and direction of dependencies

The reviewed `data/library-coverage.json` audit was read. Statements were checked in pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. A separate object search used current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The current read-only checkouts were never built. Searches included the new roadmaps and Completed roadmaps, mathematical terms and actual operators rather than only proposed declaration names. No existing Nahm-series, Habiro-collection, plethystic-admissibility or Wick-comparison implementation was found there.

| Supplied object or theorem | Owner consumed; duplicate planning avoided |
| --- | --- |
| Positive definite matrices, Hessian determinant algebra | Mathlib `Matrix.PosDef`, `Matrix.PosDef.diagonal`, `Matrix.PosDef.add_posSemidef`, `Matrix.posDef_iff_dotProduct_mulVec`, `Matrix.det`. Only Nahm Hessians and their consequences are local targets. |
| Generated coordinate fields and differential finiteness | `IntermediateField.fg_adjoin_of_finite`, `IntermediateField.essFiniteType_iff`, `KaehlerDifferential.span_range_derivation`, `Algebra.FormallyUnramified.finite_of_free`. The local target proves the Jacobian kills the differentials, then applies the existing finite-type theorem. |
| Formal series, rational functions and rescaling | Mathlib `MvPowerSeries`, `MvPowerSeries.rescale`, `RatFunc`, `PowerSeries`, Laurent series. The multivariate logarithm and plethystic operations required here are additional augmentation operations. |
| Euler product and Fourier summation | `ModularForm.eta`, `ModularForm.multipliableLocallyUniformlyOn_eta`, `ModularForm.eta_ne_zero`, and one-dimensional `SchwartzMap.tsum_eq_tsum_fourier`, iterated only after justified Fubini. No new generic eta or Poisson theorem. |
| Arithmetic subgroups, rational cusps and strict T-periods | Mathlib cusp/subgroup APIs and Tau Ceti `NumberTheory/ModularForms/Norm/Cusps:cuspTranslationOrbitWidth`. Projective and strict widths are explicitly distinguished. |
| Cusp quotient charts, descent, finite principal parts and extension | Current `FuchsianOrbifolds` Layers 3–5 and `ModularForms`. The historical HB.5a foundations are consumed, with only the Nahm scalar estimates kept. |
| Gaussian densities, polynomial integrability, central moments and covariance | Tau Ceti `Probability/Distributions/Gaussian/Density:multivariateGaussianPDFReal,multivariateGaussian_eq_withDensity` and `PolynomialMemLp:integrable_pow_gaussianReal,integrable_eval_mul_gaussianEnvelope`; current `StandardDistributions` Layers 1 and 5. Completed `OrthogonalL2Bases` already owns Hermite/L² theory; it is not rebuilt. |
| General polynomial real-root tests, integral lattices and Galois theory | `RealAlgebraicGeometry`, `IntegralLattices`, `LocalGaloisGroups`, `ProfiniteArithmetic` and the other newer roadmaps were checked. Their general theories are not recreated. Quartic computations are finite explicit certificate targets, not a new computational-number-theory roadmap. |
| Hensel lifting | Mathlib `HenselianRing.is_henselian`, `IsAdicComplete.henselianRing`; `Padic.hensels_lemma` is specifically over ℤ_p. The example requests a certified lift on the actual full étale coefficient algebra, not an unwarranted general-DVR version of that ℤ_p signature. |
| General q-series identities | `QSeriesPartitionsAndMockModularForms` Layer 0. Only their Nahm specialisations and normalisation comparisons are added. |
| Bloch groups, finite Chern classes, cyclic dilogarithms, Habiro rings and modules | `K3BlochGroups`, `Polylogarithms`, `BorelRegulators`, `HabiroNumberFields`, `HabiroRings`, `ColemanIntegration`, `PadicHodgeRegulators`, with exact layer contracts in the README. No second foundations. |
| Topological and higher-cohomology identifications | Downstream `ArithmeticQuantumTopology` and `HabiroCohomologyFoundations`, not prerequisites for scalar Nahm membership. |

`HabiroNahmSeries` is not in the 94-roadmap Caraiani–Newton ordering; no tier number or new bundle was invented. Its dependencies follow the explicit foundational order above. `FoundationsAndLibraryIntegration` and `UPSTREAM:` bookkeeping identifiers do not appear in the package. ComputationalNumberTheory is dropped as instructed: finite arithmetic computations have specified certificates as theorem inputs/targets. No general notion was moved down from a higher tier. The Nahm-specific scalar cusp comparison and Gaussian comparison remain here; their existing generic foundations remain with their owners. The KMS acceptance calculation can use earlier radial estimates without making that calculation a prerequisite of those estimates. The relative/cohomological exports do not feed backwards into formal admissibility or membership.

## Adversarial pass

Every statement family was checked against its domain, supplied construction and denominator conditions; the following table records the instances and the resulting scope or correction. A family includes its definition, APIs, milestone and Checks. Cases outside the mathematical domain are explicitly excluded rather than evaluated using totalised inverses.

| Statement family | Instances tried / witness | Result and change |
| --- | --- | --- |
| §1.1 quadratic exponent and analytic/formal data | Rank 0; A=3/2; singular all-ones 2×2 matrix; two Rogers–Ramanujan B,C choices | Retain C at rank 0; positivity only for analytic data; two proved Lean exponent witnesses and separate datum examples. |
| §1.1 denominators and strong periods | Q=n²/4; Q=n/2; Q=C=1/2 or 3/2; d,D=0 | Positive integers required. Strong period 2 need not be denominator 2. Gauss reduction separately requires a multiple of a denominator. |
| §1.2 unsigned and signed equations | Empty tuple; x=0,1; A=1,2,3; characteristic 5 | Open cube for unsigned equations; arbitrary unit signs for the functorial predicate, formal ± convention specialised explicitly. A=2,z=2 mod 5 solves the equation but has δ=0. |
| §1.2 discriminant and positive solution | Rank 0; A=3; repeated/singular solution; A=3,t=4/27,z=3/2 | δ is the displayed determinant with its monomial factor, not det A. Nondegeneracy is separate; real positive definite existence is broader than rational algebraicity. |
| §1.3 clearing powers and Jacobian | Positive and negative rank-one exponents; d=0; coordinate-hyperplane zeros | Torus restriction and d>0 retained. Jacobian sign is (−1)^N; negative exponents are cleared on the correct side. |
| §1.3 differential bridge and root fields | Empty field extension; repeated root; rational A=1/2; positive root vs its negative | Finite type plus Ω=0 gives finiteness via the pinned theorem. Stacks 00UO is only the Ω/formal-unramified equivalence. Embeddings preserve coherent roots, not newly chosen principal roots. |
| §1.4 Bloch boundary, conventions and integral models | Golden solution; rational root lift; signed cubic; even-diagonal quartic; δ nonunit | Signed boundary retains z∧(−1). Integral classes, their rationalisations and K₃ lifts stay distinct. Evaluation requires all localised units. |
| §1.5 regulators and torsion | Empty class; real embedding; conjugate nonreal cubic embeddings; complementary Rogers value | All complex embeddings required. Real-only vanishing and rational Rogers values are insufficient converses. Λ>0 restricted to positive rank. |
| §2.1 analytic summand and holomorphy | N=0,C≠0; rational powers; q=1 | τ determines rational powers. Upper half-plane gives nonzero finite Euler denominators. Empty sum is exp(2πiCτ), not automatically 1. |
| §2.2 Euler–Maclaurin | Constant, affine and quadratic f; θ=0,1; finite interval endpoints | Explicit C^J regularity, J≥2 and Bernoulli remainder bound. B₁ endpoint signs pinned. |
| §2.2 Pochhammer and Euler radial factors | m=1,2; ν=0; |w| approaching 1; nonuniform ν | Compact |w| bound and ν/ε restriction retained. Actual Dedekind phase and Euler N/24 term kept. Removing the latter gives 1/40 instead of −1/60 in the first analytic RR jet. |
| §2.3 saddle, local expansion and tails | Empty rank; B negative; shift of saddle; truncation-window boundaries | Linear B has the correct minus sign on the radial path; global tail bounds absorb polynomial losses. Gaussian factor is 1/2. |
| §2.4 Wick and lattice comparison | Constant, odd, second and sixth moments; m√ε lattice spacing | Covariance is the inverse specified quadratic matrix; sixth moment is 15C³. Lattice covolume is retained. Generic measure theory is consumed. |
| §2.5 congruence splitting and additive expansion | m=1; CRT with D; cancelling Gauss sum; C≠0 restored | Strong period and denominator are separate inputs. Expansion is additive and can have zero leading sum; no division by that sum. |
| §2.6 fields, Kummer action and nonzero units | Coherent rational root x=1/4; root rotation; cancellation of full constant | Actual generated fields and automorphisms specified. Nonzero-unit result has a separate hypothesis; constant descent does not imply all-order descent. |
| §2.7 Andrews–Gordon | Rank-one Rogers–Ramanujan; root order coprimality | Exact convention and supplier trigonometric identity required; no converse modularity claim. |
| §3.1 widths, orders and leading constants | Strict vs projective width; zero function; constant; changed scaling matrix | Use k/w and allow order +∞ for zero. Representative change multiplies leading coefficient by its stated root of unity. Geometry consumed. |
| §3.2 radial cusp growth | Cusp 0; pole; zero; general rational cusp | Exponential rate includes width and the scaling matrix. Uniform remainder is applied only in its cusp region. |
| §4.1 every-root majorant | m=1,2; B<0; residual shifts and all cusps | ε² scaling gives the m² exponent. Bound depends on min Q, not just C; no special-root shortcut. |
| §4.2 modular expansion and valuation | Rank 0; pole; finite-order character; logarithmic shift | Weight zero, branches, finite multiplier and meromorphic cusps explicit. Scalar cusp theory is imported; only the Nahm comparison is local. |
| §4.3 fixed fields and multipliers | Increasing m; multiplier powers; unipotent stabilisers | One fixed E and bounded exponent retained. Actual Dedekind multiplier, not an arbitrary phase, enters the field comparison. |
| §4.4 divisibility and torsion | Zero group; ℤ; finite torsion; rationalised divisible group | Apply to integral finitely generated groups/classes before tensoring. Never reduce B(F)⊗ℚ modulo n. Modular implication is one-way. |
| §5.1 logarithms, plethystic exponents and products | F=1; reciprocal Pochhammer; wrong sign; mixed indices | Augmentation zero/one conditions stated; support finite in q exponent for each index. Wrong-sign L₂=1/(1+q) is rejected. |
| §5.1 root invariants and recognition | 1/(1−q) at q=1; m=2 Pochhammer; equal V only | U₂=(1+T)^−1/2 fixes the positive (m−1)/(2m) term. V alone does not determine arbitrary F; a full root Laurent expansion does. |
| §5.2 exponent, F_A and q-system | A=0,1,3,−1; singular and mixed 2×2 matrices; rank 0 | Symmetry proves even numerator; negative q exponents permitted. Shift uses the full column. Constant coefficient is 1. |
| §5.2 constant-one solution and δ | A=0,1,3; arbitrary coefficient characteristic | Augmentation recursion uses only constant-one units; signed deformation distinguished from unsigned real equations. |
| §5.3 shifts, orbits, poles and potential | Negative shifts; m=0,1,2; A=0,−1,3; mixed coefficient | Cocycle/telescoping handles negative entries. All-root residue proof independent of Gaussian identification; V₃ starts t+5t²/4. |
| §5.4 finite support and Dwork logarithm | A=0,1,3; mixed L_(1,1); pole at q=1 | Exact L₁=q³,L₂=q⁷,L₃=q¹⁰+q¹¹+q¹³; mixed L=−q³. Dwork permits p/x, not only p-regular terms. |
| §5.5 congruence series and order-m recurrence | k=0 and k≠0; m=1; A=1,m=3; recursion at a root | Constant-one normalisation and support specified; parity is (−1)^(mA_jj). Recursion factors inverted in the Laurent field, not at x=0. |
| §5.5 restricted Adams and level localisation | A=0,m=2 at Φ₄; F=1+t₁t₂; m-smooth indices | Printed smaller localisation fails. Permit m∤d or gcd(d/m,m)>1; restricted residue orders have coprime quotient. |
| §5.6 weighted Gaussian remainder | m=1,2; constant and w²/h terms; w³/h; mixed poles | Correct linear subtraction 1/m and quadratic 1/2. Positive-weight completion contains w³/h. Local repair does not prove global prefactors or mixed regularity. |
| §5.6 global comparisons | Affine shift; mixed 2×2 matrix; A=0 product; A=1,m=3 | Scalar exponential, full columns and negative recurrence sign retained. Every comparison has a named target, with no arbitrary proposition carrier. |
| §5.7 coefficient scheme and étaleness | Rank 0; p=2; split square root; δ=0; t=0 | Base is localised in t and 2; square-root and Kummer extensions are separate. T=1 branch is not the whole algebra. |
| §5.7 WKB | A=0,1,3 and negative A | Explicit rescaling gives unsigned z₀. b₁=3X² at A=3; replacing z₀ by the signed branch fails. No negative-length product or arbitrary-rank polynomial claim. |
| §6.1 Frobenius and p-saturation | Identity; split quadratic branch; A=5,p=5; p-torsion target | Map is a ring homomorphism. Higher-power transfer needs p regular in target; intersection form also needs injectivity. Formal branch loses T−z². |
| §6.1 full-algebra congruences | Rank 0; both square-root factors; p=2,3; p|m | Coefficients and Frobenius defect are full-algebra targets; small primes remain separately specified. |
| §6.2 jet and integral refined coefficient | Pure cubic 5/24; mixed bT 29/24; empty rank; cubic (242) | Mixed contraction and Euler term retained; only individual nonzero refined constants can be divided out. exp(V/h), not exp(V/x), is the normalisation. |
| §6.3 potential and p-adic regulator | z at t=1; reflection; Frobenius ratio; p=2,3 | Modified polylogarithm starts at ℓ=1; specialisation occurs on actual p-completed coefficient ring, not a generic formal series at t=1. |
| §6.4 specialisation, Chern orientation and module | Signed cubic; root rotation; z=0,δ=0; split B; cancelling constants | Finite-presentation evaluation and roots named. Unit conditions exclude bad maps. Generator vs arbitrary section distinguished; orientation is not chosen to fit the module index. |
| §6.5 auxiliary products and uniqueness | γ=1,2,5; negative shifts; F=t; q=(2,1) in a product ring | Division by γ explicit. Recursion needs qⁿ−1 regular. Order of operators contributes γ²; covariance includes every matrix column. |
| §6.5 powered vs unpowered gluing | A=0 and A=3, γ=5, q=1+x | x³ coefficient is 1/5 or 3224/5 respectively. Powered-family recurrences do not imply integral unpowered gluing. |
| §6.6 descendants, torsion powers and converse | ν=0; nonzero ±ν; restricted good orders; zero collection | Curve t^(1/m)=q^ν means t=q^(mν). q-dependent transport separately proved. Converse requires nonzero section. |
| §7.1 residue and symmetrisation | Empty residue; m=1,2; root changes; multiple algebraic solutions | Sum is over roots of one chosen z-branch, not all solutions. Correct m^N and discriminant factors; all-order gluing remains an input. |
| §7.2 cubic, support and small primes | First six coefficients; q-Lucas at m=2; p=2,3; independent shifts | Numerator z⁻¹+T gives 1,1,4,5,21,…; coefficient x² reduces exactly to the source expression. Positive DT support requires its own combinatorial proof. |
| §7.3 quartic arithmetic and orbits | Both quartics; quotient reductions; trace matrix; units; prime 5 overorder | Exact discriminants −475 and 229 distinguished. Index 5 and integral basis maximality checked independently; norm δ=9025. No inferred tame-kernel certificate. |
| §7.3 quartic normalisation and coefficients | Zero-B analytic vs canonical formal t=1; first three coefficients; ε=log(1+x) | Displayed coefficients match u⁴v² times the zero-B analytic sum. Explicit shift (−4,−2), q inversion and ε-to-x conversion added; canonical h jet differs. |
| §7.3 quartic torsion and rank | Regulator zero; 60th power; degree-27 data; eight descendants | Exact relation, K₃ lift and rank certificates requested; finite precision does not prove these or membership. |
| §7.4 knots and cubic pair | Figure-eight two conjugates; first two coefficients; cubic-pair scalar factor | Determinant fourth root retained; symmetrised first coefficient −1/27. Equation (280)'s displayed square factor requires −2, not −3/4. Selected field factors not conflated with full knot data. |
| §7.5 Frobenius calculations | p=2; p=5 index; ramified vs good primes; zero derivative | Actual maximal order and Hensel uniqueness hypotheses required; polynomial discriminant cannot replace field discriminant. |
| §7.5 rational and complex Gauss families | m=1,…,24; all primitive roots; m=1,2,3,4; odd composite multiplier | Norm values 1,0,1,2; family over ℤ[1/2]. Defined complex square gives i,0,−i,−2; source (290)'s polynomial gives +2 at m=4 and is distinguished. |
| §7.5 Rogers–Ramanujan kernel | Two conjugates; residue signs; finite Taylor expansion | Common expression −5F²−5F verified as the comparison target, not a replacement of either individual summand. |
| §7.6 coefficient comparisons and lines | R=ℤ; split étale algebra; restricted orders; zero section | Direction η=d⁻¹κ fixed. ℤ[q]-algebra structure retained; global Picard descent and extension from good orders separately targeted. |
| §7.7 higher cohomology | Degree 0 and general n; whole disc vs positive radius; actual family and form | No degree-zero restriction on general carrier. Analytic push-forward and algebraic comparison require the specified geometric data; scalar membership supplies neither. |

The exact computation pass used rational functions, quotient-field arithmetic and finite coefficient recurrences, independently of Lean's admitted theorem targets. It included 62 checks in the first script, 49 in the second (32 intentionally repeated), and an independent weighted two-variable Wick calculation through order six verifying all three displayed quartic coefficients. Gaussian monomials were contracted by the covariance recursion, then ε was changed to log(1+x). Maximal-order discriminants were independently computed using an exact number-field routine. Finite Gauss evaluations through order 24 used numerical roots as additional diagnostics; the roadmap requests the exact finite-sum theorem rather than treating floating-point checks as proof. None of these scripts or external source files is needed by the next worker: the defining formulas, witnesses and certificate requirements are in the README and this table.

## Source verification

The public primary texts below were read locally after retrieval, with printed locators checked against the formulas. No restricted book was needed and no book file or passage was copied into the repository. The following records identify the versions used; the repository contains only our mathematical statements and locators.

| Source | Locators checked |
| --- | --- |
| CGZ, arXiv:1712.04887v3 | Definition 2.1, Lemma 2.2, pp. 8–9; §7.1 and (41)–(42), pp. 34–36; Theorems 7.1, 7.4 and 7.5, pp. 36–41. Published pagination was checked separately. |
| GZ, arXiv:1812.07690v1 | Lemma 2.1 and (3)–(10), pp. 2–4; Theorem 3.1 and (16)–(19), pp. 5–7; estimates §§4–5; (24)–(25), pp. 9–10; Proposition 7.1, pp. 12–13. Published text checked for matching result numbers. |
| GSWZ, arXiv:2412.04241v2 | Definitions/Theorems in pp. 9–15; (46)–(109), pp. 18–28; (110)–(139), pp. 28–32; (140)–(170), pp. 33–37; (171)–(222), pp. 37–44; (242), pp. 48–49; cubic/quartic (248)–(263), pp. 50–52; knots (264)–(280), pp. 53–55; Gauss (289)–(290), pp. 56–57. |
| Vlasenko–Zwegers, arXiv:1104.4008 | Lemmas 2.1–2.2 and Theorem 2.3, pp. 2–5. |
| Zagier, The Dilogarithm Function | Complementary Rogers convention II.1A, pp. 23–24; coherent Nahm equations II.3A, p. 43; saddle/modularity discussion II.3B–C, pp. 46–56. |
| GSW, arXiv:2305.14884v2 | Lemmas 3.1–3.2, (23)–(25), p. 10: actual affine exponential factor. |
| Århus II, arXiv:math/9801049v4 | Proposition 2.13 and its Gaussian Fubini discussion, pp. 8–9. |
| GW, arXiv:2505.19885v1 | Definition 1.2, p. 5; Theorems 1.13/1.18 and Proposition 1.14, pp. 11–13; (182), p. 31. |
| Wagner, q-Hodge filtrations, Habiro cohomology, and ku | Corollaries 2.13 and 3.13, printed pp. 33 and 41, with map direction and base-ring structure. |
| Stacks Project, tag 00UO | Ω=0 iff formal unramifiedness; not a field-finiteness statement by itself. |

PDF SHA-256 records: GSWZ `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9`; CGZ `024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5`; published CGZ `13d38474d6b7b6e3fc946d50cc2764094c3a25a194d873c17d9cd334c25600cf`; GZ `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66`; published GZ `b03bb6af61747ed1223ee05d031aa7f687929995216020a395956e21bac2b57a`; Vlasenko–Zwegers `27f74223e8d098977420c880f550d8ba5f779d753c04bce6688cb6f8c9ba839f`; Zagier `1cf7df610343bce19f72ae5990f344c0f4ba7004078caf17381cf6645df92d10`; GSW `ebc8e64d901c9e4f397ece6170c92d5d65045ef7fbb15d251a268327acf7e1fb`; Århus II `85d15e9e1b4e4f74af4f23096b37262e17f872a3b38cce3321bf9163a5ca9dfa`; GW `7e4470b2c038f0cc4663d59739570c116e4c9f10aaad9c3c9c1a81bc938de3e0`; Wagner `d074047f202ee7e64298801b15327a9a634b6f7b6e4bcd5be7b2fda959ad876c`.

New local clarifications are the explicit rank-one WKB rescaling, the quartic linear-shift/radial normalisation, the specialisation map on the finite presentation, the regular-factor hypothesis for product-ring uniqueness, and the distinction between the defined Gauss square and the polynomial printed in (290). They do not edit a source verdict or claim to settle an errata job. The exp(V/h) correction in (242), the corrected Gaussian remainder, the enlarged level ring and the cubic root numerator preserve the inherited corrected mathematics.

## Lean signature and validation audit

The ten admitted theorems were checked against their actual variable blocks and README domains: strong periods use symmetric rational A; existence uses real positive definite A; polynomial algebraicity and coordinate-field finiteness require a square rational system and nonzero evaluated Jacobian; convergence/holomorphy use the actual analytic sum on the upper half-plane; divisibility uses a finitely generated integral abelian group; the formal q-system and exponent parity use symmetric integral A without positivity; Gauss-family invariance uses a positive order and an arbitrary odd multiplier. No theorem quantifies over an unrelated arbitrary object, assumes its conclusion, or substitutes a false generic statement for the intended construction.

`regularisationJet` is a polynomial over any characteristic-zero field and any matrix; its Gaussian interpretation separately requires symmetry. `SignedNahmEq` accepts any unit sign vector, while formal assertions specify the diagonal parity sign. `nahmDiscriminant` uses totalised powers on a field; the unit-coordinate ring version and arithmetic nondegeneracy are separate README constructions. The formal-series coefficient definition has a real body and no positivity requirement. These distinctions are stated in both files.

- `lean-check research/blueprint/packages/HabiroNahmSeries/Suggested.lean`: exit 0 at the pins; the only diagnostics are ten declarations using `sorry`. All examples are proved; there are at most two per kept definition. No admitted data, auxiliary theory development, or hidden carrier is used. The only import is `Mathlib`, since no declaration in this compact file directly uses a Tau Ceti constant.
- `python3 scripts/check_blueprint.py` on all seven input packets: each reports zero errors and zero warnings. The packets are unchanged.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: reports `4 file(s), 0 problem(s)`.
- The final scope check allows only the three package files and this handoff. README has 149,568 bytes, seven layers, 38 Checks lists and seven Examples/Dependencies endings. Lean has 326 lines, 14 real-bodied definitions/structures, 20 proved examples and one module docstring. Private-path and scope scans pass.

The package is ready for its independent review. No scratch artifact needs to be retained after the pull request opens.
