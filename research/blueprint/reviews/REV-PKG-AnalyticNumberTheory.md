# Independent package review: AnalyticNumberTheory

Issue #10116. Reviewer: Codex, session `codex-P07c10`, 17 October 2026. Package author: Codex, session `codex-PVngDz` (PR #10128). I did not author or review that worker's package. This is a completed fixing review with verdict **needs_changes**, not a checkpoint.

The representative Lean file elaborates, and the elementary corrections below are applied. The package is not ready for its TauCetiRoadmap draft: several advertised suppliers do not supply the requested refinements, and several indispensable proof routes still stop at secondary statements or unnamed intermediate estimates. In particular, scalar geometric heat/trace inputs and measured factor classification are not supplied by the cited roadmap layers. Merely retaining their names in a remaining-obligations paragraph does not close those prerequisite chains.

## Scope and inventory

I read the entire package README and Suggested.lean, the accepted packet, its coverage/gap/request material, and the package handoff. The input packet has 239 nodes, 263 proof ingredients, 317 API entries, 261 unit tests, 58 gaps and 52 supplier requests. The package correctly removes the qualitative rational PNT already available upstream and introduces four necessary local foundation sections, giving 242 numbered subsections in seven layers. I retained those subsections. This review adds two unnumbered Aramata proof ingredients and removes one duplicated API bullet; it does not remove mathematical coverage. `metadata.toml` remains `topic = "math.NT"`.

Models read included the atlas ArithmeticDirichletSeries and Chebotarev roadmaps and the current upstream ArithmeticDirichletSeries and ProfiniteArithmetic README/Suggested files. I followed WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE and the source-faithfulness protocol. The 12 October rule governs Suggested.lean: absent heavy carriers belong in the README and closing comment. Their absence from the Lean is not a rejection reason.

The internal graph check found 508 explicit anchors before this review's two new ingredients, 1,196 explicit prerequisite edges, no directed cycles and no edge to a later layer. I also checked the implicit heading links separately. This establishes internal navigation/order, not external mathematical closure. The accepted packet remains unchanged.

## Corrections applied

1. **Quadratic completions.** Distinguished the period normalization `Λ_DIT` in Duke–İmamoğlu–Tóth (5.13), p.964, from the usual parity completion `Λ_std`. For odd characters their ratio is `(abs(d)/π)^(1/2)`. The genus-period sections now use `Λ_DIT`, while the imaginary-quadratic endpoint sections use `Λ_std`. At discriminant −4 their endpoint values are respectively `sqrt(π)/2` and 1; at −3 they are `sqrt(π)/3` and `1/sqrt(3)`. Two new Lean examples pin the −4 comparison at 0 and 1 against Mathlib's completion, which has no conductor power. This prevents a genuine factor error when combining the previously ambiguous notation.
2. **Scaling-measure zero atom.** Made `β>0` explicit in §6.10 and supplied the short proof that the atom at zero vanishes: its mass is finite because zero lies in the normalized integral compact set, and scaling by 2 multiplies it by `2^(-β)`. At `β=0`, the normalized Dirac mass at zero is a counterexample. This is now an explicit negative control.
3. **Existing monomial induction.** Removed the request to develop integral monomial Brauer reduction again. The current library already combines integral elementary-group induction, elementary-group nilpotence, monomiality of nilpotent irreducibles and induction transitivity. The boundary contract now names the actual declarations. It also explains the remaining finite uniformity argument: transport every group of order at most `(2g)!` to a finite carrier, choose expressions for the finitely many irreducibles of the finitely many group laws, and take a maximum. Arithmetic Artin/Hecke comparison is still additional work.
4. **Constant 40: primary source.** Replaced the secondary Bennett–Siksek-only locator in §0.7 by Bennett–Martin–O'Bryant–Rechnitzer Proposition 1.11, p.436, with its proof in §6.1, pp.491–494. Added the exact `12/sqrt(q)` L-value and `0.27356 log²(q)` derivative bounds, the near/far-zero split, conductor reduction and finite-verification boundary. The analytic part is now traceable; finite numerical certificates remain explicitly required.
5. **Aramata quotient.** Read the original four-page paper and added the positive cyclic-character decomposition and the entire-quotient target needed by §2.40. A positive integer multiple of `Reg_G−1_G` is a nonnegative integer combination of induced nontrivial cyclic characters. Its Hecke product proves a positive power of `ζ_K/ζ_E` entire; meromorphic pole orders then prove the quotient entire. This is stronger than signed Brauer meromorphy and uses no general Artin-holomorphy assumption. The original source is now cited with Sätze 4–6, pp.32–34. The remaining finite-character steps in Heilbronn's argument are still identified as work to decompose.
6. **Barnes proof boundary.** Added Adamchik's primary product/integral/remainder locators, especially (20), p.7, and Lemma 5.1, pp.10–11. Its right-half-plane remainder argument does not certify the whole closed-sector formulation; that distinction is explicit.
7. **Locators.** Replaced all seven nonexistent Tao “Second proof” locators by the actual proofs of (3) and (4); corrected Blomer's functional-equation formulas (32)–(33) to p.363 and the spanning (31)–(32) reference to pp.362–363; removed an unrelated Tsimerman URL before the Thorner–Zaman convexity locator. Removed an obsolete claim that integral monomial induction still needed an original supplier after the current-library check.
8. Removed a repeated `mem_axbInt_iff` API entry and repaired a few malformed normalization cross-references/punctuation. The quadratic character table and the already corrected Heath-Brown fourth-moment formula were retained; the latter did not need another change.

## Current-library and roadmap duplication

The current upstream check used TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27`, including its companion `Completed` directory, and Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The representative Lean pin remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` with the historical Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`. No build or mutation was performed in the current upstream/library checkouts.

I searched mathematical carriers and operations as well as target names across the current library and all current roadmap README/Suggested files, including AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry, and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. Relevant intersections were read, rather than treating a search hit as a theorem.

| Existing item inspected | Consequence for this package |
| --- | --- |
| Chebotarev prime-counting/AP exports; ArithmeticDirichletSeries summation and qualitative transfer | The author's removal of qualitative rational PNT is correct. These do not give a uniform every-log-power progression error. |
| Native contour residue theorem and argument principle | Import them; finite rectangle/cycle identification, zero avoidance, phase bounds and infinite limits remain local adapters. |
| ProfiniteArithmetic and RestrictedProducts | Import the profinite ring, units, integral compact-open and restricted-product topology. Scaling densities and KMS reconstruction are new content. |
| Positive-functional measure representation and existing Hilbert/C*-carriers | Do not reconstruct their generic objects. They do not supply the full BC crossed-product or nonsingular factor theorem. |
| Current operator/spectral/differential-geometric plans | Generic operators and discrete automorphic spectrum do not identify the scalar geometric Laplacian, heat coefficients or Gaussian trace formula. |
| Completed EffectiveBounds | Brauer–Siegel appears as a longer-term aspiration, not the fixed-degree two-sided `hR` result exported here. The target is retained. |
| Current representation-theory declarations below | Replace the redundant monomial-induction extension request. |

The representation-theory statements and their surrounding proofs were read directly:

| Module | Declaration consumed and scope |
| --- | --- |
| `TauCeti.RepresentationTheory.Induction.Brauer.Induction` | `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary`: finite group, algebraically closed characteristic-zero field; integral span of induced elementary-group characters. |
| `TauCeti.GroupTheory.Elementary` | `TauCeti.IsElementary.isNilpotent` for finite groups. |
| `TauCeti.RepresentationTheory.Induction.Monomial` | `FDRep.exists_character_eq_indClassFun_of_isNilpotent`: simple finite-dimensional representations of a finite nilpotent group are induced from one-dimensional subgroup characters, over the stated algebraically closed characteristic-zero field. |
| `TauCeti.RepresentationTheory.Induction.ClassFunction` | `TauCeti.indClassFun_indClassFun_subgroupOf`: the subgroup/finite-index transitivity needed to combine the expressions. |
| `TauCeti.RepresentationTheory.Induction.Cyclotomic.SplittingField` | The proof of `TauCeti.virtualCharacters_eq_map_of_isPrimitiveRoot` already performs this combination; it confirms the relevant compatibility rather than merely suggesting it by names. |

**Own numbered target removals in this review: none.** One planned supplier refinement was removed/replaced by existing library mathematics. The package author's earlier removals remain recorded in its handoff. No other roadmap was edited and no ownership transfer was silently imposed.

AnalyticNumberTheory and ArithmeticStatistics form the tier-14 bundle in CaraianiNewton.md. The automorphic and adelic suppliers are earlier in that ordering, but a permitted tier does not mean a requested refinement exists. The following are unresolved supplier content, even where the original general layer is available:

| Requested content | Inspected supplier | Missing contract |
| --- | --- | --- |
| Scalar compact-surface Laplacian, simple zero, multiplicities and Weyl law | AutomorphicSpectralTheory AS.4 | Its discrete automorphic decomposition is not this geometric identification and quantitative spectral theorem. |
| Full heat expansion and Gaussian Selberg trace, with primitive orientation and exact constants | AS.6 | Compactly supported smooth trace tests do not include the Gaussian; a limiting/decay theorem and geometric comparison are needed. |
| GL2 normalized spherical constant term and uniform nonconstant Fourier estimate | AS.2 | General Eisenstein continuation is not Wright's explicitly normalized quantitative bounds. |
| Tate's full Z1–Z3 admissible class | AutomorphicLFunctionsAndLocalFactors AL.0–AL.1 | Schwartz–Bruhat Poisson alone does not prove uniform translated lattice sums and weighted integrability for this larger class. |
| Ordinary/narrow quadratic quotient, full norm-one stabilizer and oriented Nielsen boundary comparison | GeometryOfNumbersAndQuadraticArithmetic GN.3 | The package itself describes this as a requested refinement, rather than an existing export. |
| GL2 quotient measures and compact-times-Siegel majorant | AdelicAlgebraicGroups AA.2 | Inversion transport and Wright's precise majorant still require the advertised extra interfaces. |

Resolve these through exact existing exports or named local/Part II targets with proof contracts and reconciled ownership. Citing an earlier layer's title cannot stand in for its missing theorem.

## Independent source audit

Sources were public papers, author manuscripts and the authorized public book PDFs named in the README. The maintainer's library index was inspected; no uncleared copy of a restricted book was used. Downloads are not proof verification. I retained explicit gaps whenever only a theorem statement or secondary attribution could be confirmed. In particular, the original Davenport/Iwaniec–Kowalski, Montgomery–Vaughan, Ingham and Hörmander proof boundaries are not certified by this review.

The independent random sample is reproducible: split the submitted README at headings matching `^### [0-9]+\.[0-9]+ ` in document order, and apply Python `random.Random(10116).sample(sections, 15)`. There were 242 sections; additions below do not change that sample. Printed pages are used except where stated otherwise.

| Sample | Public source location opened and assessed | Result |
| --- | --- | --- |
| §6.22 Time evolution | [Connes–Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 Lemma3.24 (3.60), p.459; (3.71)–(3.72), p.461 | `a^(it)` agrees with `(L/R)^(-it)` because `L/R=a^(-1)`; rational/isometric generators remain distinct. |
| §0.7 Constant-40 separation | [Bennett–Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §12 p.387; [BMOR](https://personal.math.ubc.ca/~gerg/papers/downloads/EBPAP.pdf), Proposition1.11 p.436 and complete §6.1 proof pp.491–494 | Primary proof added. Small-conductor and class-number/regulator computations still need formal certificates. |
| §2.15 Imaginary class-number lower bound | [Duke–İmamoğlu–Tóth](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §6 pp.967–968 | Regulator/class-number conversion located. Original ineffective Siegel proof remains a source obligation. |
| §3.42 Beurling logarithmic remainders | [Debruyne–Vindas](https://arxiv.org/pdf/1601.05324), Theorem1 p.2, associated analytic/Tauberian statements in §§3–4 | Correct endpoint with one density before all error orders. Quantitative smoothing/derivative interfaces are not supplied merely by the endpoint locator. |
| §3.1 Divisor bound | [Tao](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), proofs of (3) and (4) | Corrected nonexistent heading. Large-prime split and finite small-prime product give the required constant dependence. |
| §3.20 Smooth-number carrier | [Hildebrand–Tenenbaum](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf), pp.411–414, (1.3), (1.5)–(1.6) | Inclusive prime cutoff and Dickman delay convention checked, including printed page images. |
| §4.13 Moment constants | [Keating–Snaith](https://web.williams.edu/Mathematics/sjmiller/public_html/RH/KeatingSnaith_RandomMatrixThAndZeta%28s%2Bit%29.pdf), pp.59–61 and 73–74, (19), (80)–(87) | Arithmetic/Barnes normalization located; general moment asymptotic stays conjectural. |
| §3.37 Shiu | [Shiu](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0313/LOG_0015.pdf), Theorem1 pp.162–163; [GHS v1](https://arxiv.org/pdf/1706.03749v1), Lemma2.3 p.9 and applications pp.9–11 | Class-Cκ growth reduction and range match. The Selberg-sieve proof behind Shiu Lemma2 is still missing from the local chain. |
| §2.37 Positive genus periods | DIT, (5.13) p.964, Theorem3 p.964, (7.8) p.972 | Period completion isolated from the standard odd completion; narrow/ordinary and norm-one conventions retained. |
| §0.33 Quadratic prime interval | [Koymans–Pagano v1](https://arxiv.org/pdf/2201.13424v1), Proposition7.6 p.61, proof and (7.7) p.62 | Exceptional character term and conductor/radicand conversion checked; no zero-free assertion substituted. |
| §5.2 Variable swap | [Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma2, (31)–(35), pp.362–363 | Swap involution and reciprocity matrix checked; neighboring primitive-functional-equation page locator corrected. |
| §0.17 Weak convexity | [Green–Tao](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n2-p03.pdf), AppendixA, (A.5), p.544 | Closed strip and nonzero lower height retained. Strip interpolation remains a named analytic input. |
| §5.13 Imprimitive twist | Blomer §2.1 pp.358–359 | Deleted factors, conductor and parity cases checked against the corrected character table. |
| §0.9 Siegel | DIT §6 p.968 | Secondary application located; ineffective constant kept. This does not verify the original proof. |
| §6.24 Reduced BC algebra | [Bost–Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition18 and proof pp.431–433, viewed as page images | Algebraic presentation/normalization located. It does not prove the whole full=reduced amenability or analytic-strip framework. |

Additional primary checks included the following material, specifically to investigate flagged or incomplete sources:

| Material | Location inspected | What is and is not established |
| --- | --- | --- |
| Meromorphic Artin boundary | [Milne CFT v4.03](https://www.jmilne.org/math/CourseNotes/CFT.pdf), VIII §10 pp.261–262 | Artin local series and Brauer-meromorphy discussion are present. No Aramata quotient theorem is exported there. Current Tau Ceti supplies the representation-theory part. |
| Simple real Dedekind zero | [Heilbronn](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C5957B0EA95C11C03686CE62D407E1DC/S0008414X00050926a.pdf/on-real-zeros-of-dedekind-z-functions.pdf), all pp.870–873; [Aramata](https://www.jstage.jst.go.jp/article/pjab1912/9/2/9_2_31/_pdf), pp.31–34, including formula images pp.33–34 | The stronger entire quotient is essential. Added its exact positive-character route; Heilbronn's finite-character decomposition still needs named intermediate contracts. |
| Barnes | [Adamchik v1](https://arxiv.org/pdf/math/0308086v1), p.2, (20) and Proposition3.1 pp.7–8, Lemma5.1 pp.10–11; [DLMF §5.17](https://dlmf.nist.gov/5.17) | Product, right-half-plane integral and finite Taylor remainder located. Whole-sector uniform remainder is not inferred from them. |
| Quadratic fourth moment | [Heath-Brown](https://matwbn.icm.edu.pl/ksiazki/aa/aa72/aa7234.pdf), Theorem2 p.238 and final bootstrap §10, pp.267–269 | The package's sum shape is correct; no regrouping correction is needed. The bundled supplier must still expose the exact uniform theorem. |
| Double-series extension | [Diaconu–Goldfeld–Hoffstein](https://www.math.columbia.edu/~goldfeld/GoldfeldDiaconuHoffstein.pdf), Proposition4.6 p.37; Blomer Lemma2 pp.361–364 | Tube geometry is checked. DGH states Bochner's theorem with an external proof reference, leaving the primary proof boundary open. |
| Local/global cubic matrices | [Datskovsky–Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorems4.1–4.2; Wright global theorem; LOWW Proposition3.7 | These are exact sources for the advertised matrices/order. Original real distribution/Fourier and quantitative entire-order proofs remain explicitly unverified; no tame-only replacement is justified. |
| Spectral determinant | [Jorgenson–Smajlovic–Spilioti v2](https://arxiv.org/pdf/2512.16681v2), heat/Mellin portions pp.13–15 and scalar specialization pp.20–23 | Source version and zero-mode caution retained. Generic heat subtraction does not provide the missing scalar geometric heat expansion or Gaussian trace theorem. |
| BC completion and factor type | [Laca](https://arxiv.org/pdf/math/9911135), dilation/corner theorems pp.5–10; [Neshveyev](https://arxiv.org/pdf/math/0002141v1), Propositions2–3 pp.2–3; [Neshveyev](https://arxiv.org/pdf/0907.1456v1), ratio-set discussion | Dilation and arithmetic ergodicity/ratio witnesses do not supply the general amenability, von Neumann center, ratio-set classification or corner-type theorems. |

All 57 non-identifier inherited obligation groups remain visibly identified in the package, including those with a more detailed route after this review. Gap 57 of the packet is the historical identifier-index mismatch, already resolved by the package's current-upstream mappings; it is not a mathematical blocker. Gap 56's absence of heavy native carriers from Suggested.lean is likewise not itself a defect under the newer shape rule. The following ledger states the limits of source certification rather than pretending that opening 52 source URLs independently verifies their proofs:

| Packet gap groups | Independent disposition |
| --- | --- |
| 1–7, 17, 25, 35 | Read the canonical-factor/explicit-formula chains and source locators. Good-circle and affine-log routes are substantially decomposed, but pin-level analytic adapters, uniform Stirling remainder, Hilbert inequality and contour/phase estimates are still identified boundaries. |
| 8, 10–11, 21–22, 26, 28, 34, 36, 43 | Endpoint character/PNT/Mertens/GT locators do not certify the full conductor-height and effective-constant chains. BMOR §6.1 substantially improves gap22; its finite certificates and original Siegel/zero-repulsion proofs remain. |
| 9, 23–24, 27, 32–33, 37–40, 42, 44, 58 | Representation induction is now existing-library input; ramified Artin determinant identities, arithmetic conductor bounds, fixed-degree regularized Hecke log derivatives, period geometry and quantitative Hecke zero estimates remain additional contracts. Aramata now has a primary positive-character route. |
| 12–16, 29–31, 41 | Halász, original moments, inverse-totient, Selberg–Delange/Sathe–Selberg, two-family intersections and Beurling Tauberian proofs retain explicit source/interface boundaries. Shiu's statement and coefficient-class adapter were checked; its sieve proof is not thereby verified. |
| 18–20 | The Lerch branches, zero-order correction and complex Hurwitz series controls were assessed. The original real-parameter endpoint cannot silently provide all complex-parameter Taylor-subtraction/holomorphy bounds. |
| 45–51 | Finite characters, twist factors, reciprocity and tube tests checked. Bochner's primary proof, nonprincipal cubic parametrization, local distribution matrices, quantitative order-one estimate and exact measure/majorant refinements remain open. |
| 52–55 | Completion/strip-KMS, nonsingular factor classification and scalar Gaussian heat/trace inputs remain substantial. Barnes now has a primary half-plane proof; the advertised full sector is still a separate obligation. |
| 56–57 | Native-carrier omission is permitted by the shape rule; current identifiers are mapped. These are not reasons to reject the Lean file. Canonical choices and weak state topology still have to satisfy the README's stated mathematical interfaces. |

No original source is quoted or copied into a repository artifact. These tables report mathematical conclusions and locations in my own words, not section-by-section source summaries.

## Adversarial mathematical pass

I assessed every numbered subsection and its proof ingredients, including definitions, conventions, comparisons and construction interfaces. The grouped table covers all 242 subsection numbers; a group records the shared boundary tests, not a claim that one numerical example proves its theorems. All definition/construction subsections retain at least three discriminating Checks and an API. The additional ingredients were checked against their containing target and dependency direction. Exact-source and proof-closure limitations above remain limitations of this pass.

| Statements | Instances and failure modes assessed | Result/change |
| --- | --- | --- |
| 0.1–0.2 Exceptional zeros and progression sums | q=1; nonunit class 0 mod2; cutoff below2; β=1; conductor versus modulus | Inclusive sums are defined without coprimality; asymptotics require it. No existence of an exceptional zero is asserted. |
| 0.3–0.8 Explicit prime estimates | x=59; higher powers at 4; interval k versus k/2; q=3 and the primitive cutoff 400000 | Strict ranges and higher-power subtraction retained; primary constant-40 route added, finite certificates remain. |
| 0.9–0.13 Siegel/Mertens/exceptional squareclasses | d=1,−1,2; conductors1,4,8; possibly empty exception set; ineffective constant | Principal pole excluded, factor4 retained, no infinite exceptional enumeration assumed. |
| 0.14–0.18 Entire order, xi and factors | f=0,1,z,exp(z),exp(z²); z=0; xi endpoints; nonzero height near the pole | Factorization excludes f=0; upper order is not exact order; xi uses the entire pole-subtracted function. |
| 0.19–0.25 Prime mass and zero repulsion | Even conductor24; primitive/trivial character; conjugate complex zeros; interval endpoints | Simplicity/multiplicity and exceptional term retained. Numerical and common-width proofs remain explicit. |
| 0.26–0.28 Hadamard/zero-free proof | Empty/finite zero multiset; repeated zeros; origin multiplicity; zeros near a good circle; t below large-height threshold | Three annuli and bounded-gap radii avoid division by zero. Affine-log route uses derivative Cauchy estimates. Effective gamma bounds remain required. |
| 0.29–0.33 Repulsion and interval deduction | Equal absolute radicands with different signs; conductor up to4abs(d); short intervals; exceptional character | Distinct primitive characters and conductor-log inequalities retained; no removal of the exceptional case. |
| 0.34 Strict derivative claim | Constant/polynomial versus nonpolynomial entire function | Nonpolynomial hypothesis is indispensable and present. |
| 0.35–0.38 Uniform regions and SW | Conductor1; t=0 and large t; q at log-power cutoff; ineffective zero separation | Stronger logarithmic-height denominator is not supplied by the misprinted weaker source. Missing derivative/zero-separation adapter is explicit. |
| 1.1–1.2 Reciprocal zeta and Möbius | t=0 pole; small nonzero heights; arbitrary real additive phase | Pole and eventual-range conventions retained; original uniform Möbius proof is not supplied by qualitative PNT. |
| 1.3–1.5 Weil tests and zero multisets | Non-smooth exponential test at0; empty zero set; repeated/low zeros; half-weight endpoint | Admissibility permits the stated one-sided behavior; multiplicities and low-zero-safe terms retained. |
| 1.6 Mean square | N=0,1; T=1; off-diagonal pair | Main term is2T, error weighted by n; uniform Hilbert inequality remains a source contract. |
| 1.7 RH/GRH | Principal pole; trivial zero at−2; hypothetical zero at3/4+it | Predicates exclude pole/trivial zeros and reject the off-line zero; no hypothesis is asserted true. |
| 1.8 Stirling | Empty compact interval; bounded x, both signs of y; small y and Gamma poles | Eventual height keeps the denominator positive and excludes poles. |
| 1.9 Truncated Mangoldt | x=4; x near but not at prime power; finite T; T/c kernel | Endpoint half-weight and actual nearest-prime-power distance remain; finite kernel is not exactly1/2. |
| 1.10–1.11 Density/Gamma quotient | Exceptional zero included; α=β=0 and1; negative height | Counts retain multiplicity and exceptional contribution; exponential Gamma rates cancel only in the specified quotient. |
| 1.12–1.13 Weil/counting formulas | Trivial-zero residue−1; ζ(0)=−1/2; zero-avoiding contour; low height | Signs and reflected-contour requirements retained; no signed reciprocal-ordinate majorant used. |
| 1.14–1.15 PNT errors | Positive cutoff; fixed q versus growing q; q=1; nonunit residue | Conditional and unconditional statements remain separate; uniformity is not enlarged by a fixed-modulus consequence. |
| 2.1–2.8 Arithmetic carriers | Full surface versus Nielsen core; lower ramification at0; trivial representation; zero ideal; K=Q; quadratic unit weights | Oriented core boundary, genuine Artin conductor and ordinary class fibres retained. General higher-dimensional Artin coefficients do not use degree-one completely multiplicative weights. |
| 2.9 Zaman explicit ideal bound | Trivial extension; possible exceptional zero; degree/discriminant thresholds | Printed exponent35/19 and the cited different intermediate constant cannot be reconciled by an untracked estimate; exact proof remains open. |
| 2.10–2.18 Genus/Hecke/quadratic values | Discriminants−3,−4,5; trivial conductor; narrow versus ordinary class; norm−1 unit; root number | Distinguished DIT and standard odd completions, with explicit endpoint values. No ordinary/narrow swap without the unit dichotomy. |
| 2.19–2.23 Artin/Hecke comparisons | Ramified prime; trivial representation; removed Euler factor; endpoint0/1; odd/even parity | All-prime factors and conductor are retained; deleted factors change residues. Ramified induction remains a proof contract. |
| 2.24–2.28 Periods and endpoint values | Positive/negative genus factors; stabilizer weights2,3; norm-one length2logε | Completion symbols corrected; geometric boundary/Stokes and class dictionary remain required. |
| 2.29–2.35 Meromorphy and fixed-degree bounds | Negative Brauer coefficients; trivial factor pole; n=1; D=1; shrinking radius versus fixed radius | Existing monomial reduction consumed. Meromorphy is not holomorphy; a fixed-radius Cauchy bound for L′ is not a bound for L′/L. |
| 2.36–2.38 Genus comparisons | Both discriminant signs; conjugate class; odd completion scalar | DIT normalization pinned; local geometric comparison not replaced by a bare period identity. |
| 2.39–2.44 Density, Heilbronn and hypotheses | K=Q; quadratic K; negative virtual orders; trivial Artin representation; possible real exceptional zero | Aramata quotient added. Artin holomorphy/ERH remain hypotheses; no conclusion erases the exceptional zero. |
| 2.45–2.52 CM and effective applications | Odd versus even infinity type; trivial factor separated; pole cancellation in signed products; discarded ramified primes | Nonzero endpoint germs and zero total principal order required. Fixed-family Hecke log-derivative and explicit Chebotarev proof chains remain unresolved. |
| 3.1–3.7 Divisor/conductor bounds | n=1; square versus squarefree n; prime powers; ε small; finite exceptions | Explicit constants depend on ε; inverse-totient and maximal-order sources remain distinct from elementary divisor subpower. |
| 3.8–3.12 Möbius/Gamma/totient | n=0,1; divisor of the fixed modulus; empty Euler product; cutoff at a prime | Zero/one and coprimality conventions retained; growing-modulus uniformity is not inferred. |
| 3.13–3.17 Norm-family counts | Sums of two squares versus Eisenstein norms; shifted square; overlapping families; prime divisor exponent | Three separate asymptotics do not establish the union constant without intersection bounds. |
| 3.18–3.19 Pretentious/coefficient class | f=g=1; g=−1; values outside unit disc; prime powers; κ=0 | Unit-disc hypotheses and prime-power logarithmic coefficients retained; divisor growth adapter assessed. |
| 3.20–3.22 Smooth/Dickman/divisor average | Ψ(8,2)=4; Ψ(6,3)=5; y<1; u=0,1,2; empty hyperbola | Inclusive/strict library cutoff conversion is correct; DDE uses negative extension and initial interval. |
| 3.23–3.24 Moments | Small T; second/fourth leading constants; general k | Eventual asymptotics retained; no higher moment theorem inferred from conjectural normalization. |
| 3.25–3.28 Beurling/divisor/ideal counts | Duplicate generalized primes; coincident generalized integers; n=1; K=Q | Indexed multiplicities retained; bounded-norm ideal estimate is not a new ideal carrier. |
| 3.29–3.32 Truncations and exceptional counts | Input0; input1; x at cutoff; common divisor with shift; pairwise intersections | Nonzero zero-input truncation and error sign retained; union/intersection estimate remains a gap. |
| 3.33–3.38 Halász/Dickman/Shiu/Beurling | Constant function; κ=0; q=1; endpoint progression modulus; repeated ordinary primes | Scope and eventual constants retained; Shiu's two growth assumptions verified from Cκ, sieve proof still needed. |
| 3.39–3.45 Means/Sathe–Selberg/remainders | Empty prime divisors; residue positivity; r≈AloglogN with A>1; one density before all m; Fourier-window endpoints | Full fixed-A range needs the actual coefficient-transfer theorem, not the quoted r<loglogN formula. Beurling boundary values are genuine extensions. |
| 4.1–4.3 Lerch/Hurwitz/Barnes | z=0,1/2; s=0,−1; c=1,1/2,1+i; G(0),G(−1),G(4),G(5); Gamma(0) | Lerch n=0 term and z-factor retained. Barnes product fixes more than its recurrence; new half-plane source does not close the full sector. |
| 4.4–4.6 Lerch differential/cover/special values | Loop around c=0; positive integer c; m=0; z→1 | Branch factors and order-zero term retained; rational nonpositive-order values do not justify a radial boundary limit. |
| 4.7–4.12 Circle/periodic/functional/boundary comparisons | Real c endpoint representative; exp(2πia); even/odd relation; complex c; excluded z=1 stratum | Circle carrier and complex parameter are distinguished; parameter-uniform Taylor subtraction is still needed. |
| 4.13–4.17 Moment/Hurwitz/descent | k=1,2,3; trivial Dirichlet character; Bernoulli B0; second commutator | Constants/conditional status and nonpositive-order checks retained. Analytic invariance precedes cover descent. |
| 5.1–5.3 Mod8 characters and affine maps | Residues1,3,5,7 and even n; conductors1,4,8,8; α²=β²=1 | Character signs and affine involutions independently checked. |
| 5.4–5.9 Cubic data | Reducible/nonmaximal ring; nonprincipal projective module; residue characteristics2,3; quotient inversion | Twisted action, different and bad-prime factors retained. General locally free parametrization and local distribution proofs remain open. |
| 5.10–5.14 Double series, reciprocity, twists, tubes | Principal/primitive twists; conductor1; deleted prime; A00=1/2,A05=−1/2; points(2,2),(−2,−2),(0,0) | Exact finite calculation gives symmetric A and A²=I. Rational tube tests agree; origin belongs to none of the open tubes. Corrected page locators. |
| 5.15–5.20 Cubic matrix/residues/reflection | Real versus complex place; poles1,5/6; degree1; scalar versus matrix gamma factors | Source-normalized matrix and pole clearance retained; original Fourier/Poisson proof and quantitative entire order are not automatic. |
| 5.21–5.25 Pole-cleared continuation/convexity | Trivial twist at1; three polar hyperplanes; origin; absolute height; empty safe strip | Pole clearance and height absolute values retained. Bochner applies to a connected real tube base, not arbitrary punctured complex domains. |
| 6.1–6.10 Ax+b/scaling/spectral basics | Identity/inverse matrix; b=1/2 and a=2; β=0; null zero atom; one-point positive spectrum; derivative direction | Added β>0 and Dirac negative control. Pushforward-at-target derivative remains inverse to cylinder-mass convention. |
| 6.11–6.17 Selberg/heat/determinants | Connected scalar zero mode; genus2; finite positive spectrum; scaling λ↦cλ; shift0 | Primed/unprimed determinant and simple zero distinguished. Exact geometric heat/Gaussian inputs remain missing. |
| 6.18–6.24 Hecke/time/completion | Identity coset; inverse coset; x2x′2; isometry normalization; finite-support kernel; coefficient recovery | Kernel composition, Schur row/column counts and adjoint direction assessed. Reduced faithfulness does not prove universal norm equality. |
| 6.25–6.30 States/representations/KMS | Unit coefficient; positivity on a*a; S2 on odd/even basis index; β=0 versus β>0; dense core versus completion | Bounded extension and closed-strip estimates remain separate proof targets; finite exponential sums alone do not settle general strip-KMS. |
| 6.31–6.37 Eisenstein/arithmetic algebra | k=1; odd weight; torsion orders2,4; zero root at j=N/2; matrix algebra with trivial dynamics | Rational arithmetic and rational Hecke forms distinguished. Ground need not imply KMS∞; corner units and p=2 recovery are retained. |
| 6.38–6.42 Ground/critical/factor type | β=1; zero adele; essential freeness; forward versus inverse ratio; nonzero corner | Arithmetic ratio witnesses are not the von Neumann classification theorem. Full-measure/null-point and corner identifications required. |
| 6.43–6.50 High-β Gibbs/phase transition | β=1 divergence; β=2; β→∞; Dirac versus mixed unit measure; identity symmetry; cyclotomic inversion | Absolute diagonal summability and uniform tail bound assessed; high-β barycentres use weak topology and normalized unit restriction. General completion/classification dependencies remain. |

The reciprocity-matrix computation used the displayed 4-by-4 character table and the package's 16-by-16 block formula. The tube computation used rational arithmetic on the displayed inequalities. These are checks of concrete values; no Lean sorry theorem is counted as a proof of them.

## Lean/README comparisons

I independently ran `lean-check` on the original and corrected Suggested.lean. Both exited 0; every warning is `declaration uses sorry`. The corrected file has 467 lines and 56 sorry warnings, no sorry-valued data definitions and no auxiliary theory development. The two new completion witnesses use only the pinned Mathlib carrier. The current representation-induction results are README imports, not falsely imported from the older pin.

| Signature compared | Hypotheses, convention and generality checked |
| --- | --- |
| `thetaAP`, `psiAP`, `primeCountAP` | Inclusive floor cutoff, positive-integer index and arbitrary residue; asymptotic unit condition is imposed by the theorem. |
| `IsExceptionalRealZero` | Positive width, conductor>1, primitive nonprincipal quadratic character, strict upper endpoint β<1. |
| `riemannXi_eq`, `riemannXi_one_sub` | Entire pole-subtracted definition; displayed completed formula only off0,1; functional symmetry includes endpoints. |
| `EntireOrderAtMost` | Nonnegative order, complex differentiability, every larger exponent and its own positive constant. |
| `siegel_walfisz` | A,B>0 before uniform q,a; positive modulus, unit residue, eventual x, log-power modulus range. |
| `DirichletGRH`, `GRH`, `dirichletGRH_one_iff_riemannHypothesis` | Positive real part excludes trivial/deleted-factor zeros; principal pole excluded; universal version has all nonzero moduli. |
| `psiAP_isBigO_of_dirichletGRH` | Fixed positive modulus, all its character hypotheses, unit class, positive power loss. Does not assert growing-modulus uniformity. |
| `uniform_complex_stirling` | Fixed compact real interval, both signs of height, positive relative tolerance and eventual positive threshold. |
| `dirichlet_polynomial_mean_square` | Integral on[−T,T], T≥1, main term2T and n-weighted square error; N=0 allowed. |
| `partialIdealZeta`, `sum_partialIdealZeta` | Actual nonzero integral ideals in an ordinary ideal class, norm-indexed finite cardinal; equality to the Dedekind series on Re s>1. |
| `bounded_degree_brauer_siegel` | Fixed degree, any ε>0, two-sided hR estimate with one positive constant; no normality hypothesis inserted. |
| `rootNumber_eq_one_of_isPrimitive_of_sq_eq_one` and new examples | Primitive quadratic including conductor1; the −4 witnesses distinguish standard and DIT completions at both endpoints. |
| `pretentiousDist_mul_le` | All four functions are pointwise disk-bounded; otherwise the square-root expression need not support the stated distance inequality. |
| `smoothCount_eq` | Inclusive real y versus Mathlib strict cutoff floor(y)+1 for y≥0; tests(8,2) and(6,3). |
| `complexHurwitzSeries_one`, `expZeta_eq_lerchSeries`, `complexHurwitzSeries_ofReal` | Actual absolute-convergence domain, principal powers, positive real-circle representative, exponential-zeta z factor. |
| `barnesG_add_one` | Real-bodied canonical product and pointwise Gamma recurrence excluding nonpositive integers; G(1)≠Gamma(0)G(0). |
| `spectralZetaSeries_smul` | Pointwise positive spectrum and positive scaling factor; equality also respects totalized summation, without asserting convergence everywhere. |

README-only heavy definitions are explicitly listed in the closing comment, including covers, continuation data, native arithmetic/spectral/operator carriers and comparisons. They are not replaced by vacuous predicates, arbitrary instances or a hypothesis containing the desired conclusion.

## Work needed for acceptance

These are concrete unresolved routes, not a request to implement all future mathematics in Lean:

1. **Close the scalar geometric supplier contracts** in §§6.11–6.20: identify the actual scalar Laplacian, zero multiplicity, spectral counting/Weyl input, full uniform heat expansion and Gaussian trace limiting theorem. AS.4/AS.6 as inspected do not export them. State the local or Part II theorem chain, with source proof locations and parameter/measure constants.
2. **Close operator completion and classification**, §§6.23, 6.30, 6.33–6.34, 6.41–6.42: general amenability/full=reduced norm, bounded analytic-core-to-strip KMS, measured group-algebra center, ratio-set-to-III1 and GNS corner/type invariance need actual source-backed intermediate contracts. Laca and Neshveyev's arithmetic arguments do not prove all of these general inputs.
3. **Supply the exact fixed-family arithmetic estimates**, especially §§2.9, 2.33–2.35, 2.45–2.52: source the exponent35/19 route, discriminant/conductor comparisons, and regularized Hecke logarithmic derivatives uniformly in the stated conductor family. A Cauchy estimate for L′ without a nonzero uniform lower bound cannot bound L′/L. Existing monomial induction and the new Aramata ingredient close only parts of this chain.
4. **Close primary analytic-source boundaries** behind the conductor-height zero-free region/Siegel–Walfisz, quantitative explicit formulas and Hilbert inequality. Keep effectivity separate from ineffective Siegel constants. Supply the finite certificates now precisely isolated by BMOR, and a uniform Gamma remainder rather than only an asymptotic slogan.
5. **Complete multiplicative-counting contracts**, especially §3.31 pairwise-intersection errors at scale `K/sqrt(log K)`, §3.41 full fixed-A Sathe–Selberg coefficient transfer, Shiu's sieve input, and the quantitative Beurling smoothing/derivative route. Merely citing three individual family asymptotics does not determine the union constant.
6. **Close the cubic/double-series analytic chain**, §§5.4–5.25: original local real/complex distribution matrices, nonprincipal locally free cubic parametrization, exact normalized measures/majorants, quantitative order-one bounds, and a primary proof of Bochner on the stated tube domain. Preserve residue characteristics2,3 and all poles.
7. **Finish complex-parameter and normalization adapters**, especially §§4.5, 4.12, 4.16 and the full-sector Barnes remainder. Do not use the erroneous published order-zero Lerch identity or an unproved complex-parameter extension of a real endpoint source.

The README's remaining-obligation paragraphs retain precise affected targets and all the finer inherited requirements. The seven groups above are priorities for resolving the actual closure failures; they are not permission to drop the other named obligations. Missing implementation of an already fully specified theorem is expected in a roadmap. Missing prerequisite content or a source-backed route for the advertised theorem is the reason for this verdict.

## Validation

- Corrected `Suggested.lean`: `lean-check` exits 0, sorry warnings only.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/AnalyticNumberTheory/Suggested.lean`: exit0.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticNumberTheory.json`: 0 errors, 0 warnings; packet unchanged.
- Final inventory: 242 numbered subsections, 510 unique explicit anchors, 1,202 prerequisite edges, no cycles, no later-layer edges and no unresolved internal links. All 80 definition/construction sections have at least three Checks; the adversarial table covers all 242 numbers. Exact finite matrix and rational tube controls passed.
- `python3 research/blueprint/intake.py check-files` on the package README, Suggested.lean, metadata, review.json, this report and the handoff: 6 files, 0 problems.
- `git diff --check`: exit0.

Only this package's allowed files, its independent report/verdict and this job's handoff change. This review makes no claim that the roadmap's new mathematical results have been formalized or that its unresolved primary proofs have been verified.
