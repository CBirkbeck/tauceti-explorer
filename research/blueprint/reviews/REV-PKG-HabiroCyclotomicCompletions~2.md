# Independent fixing review: HabiroCyclotomicCompletions, round 2

Reviewer: Codex, session codex-P1qif3, job #7932. Date: 2026-10-09.

**Verdict: accepted with the fixes in this submission.** The reviewer did neither package-writing job. The three input packets remain unchanged. This accepts a roadmap of statements and proof plans, not a formalization of those statements.

## Scope and method

Read WORKERS.md, PACKAGE_REVIEW.md including its 9 October additions, PROTOCOL.md, the expansion protocol and UPSTREAM_GUIDE.md; compared the package with the previous independent report and revision handoff. Checked the parent packet's 48 targets, the HC.4 packet's 59 targets, and the HC.6 imported targets and finite acceptance specifications. Their 107 distinct targets are retained, with necessary hypotheses corrected. Open conjectures remain open. Metadata remains the fitting single line `topic = "math.NT"`.

The upstream models read include ArithmeticDirichletSeries, ProfiniteArithmetic and Completed/OrthogonalL2Bases, together with the upstream guide. The README now has upstream's scope, conventions, supplier contracts, ordered layers, prose topics, explicit Checks, and each layer's Examples and Dependencies. It remains below this issue's 200 KB ceiling. The prototype uses `TauCetiRoadmap.HabiroCyclotomicCompletions`, one introductory module docstring, mathematical declaration docstrings, ordered layer comments and `theorem` declarations. No packet catalogue or untyped proposition placeholders remain.

## Corrections and completed interfaces

1. **Positive order in factorial divisibility.** The assertion `(q^m−1)^k ∣ P_(mk)` was false at m=0,k=1 over ℤ. Added m>0 in both documents and the negative control `¬(0 ∣ 1 : ℤ)`, together with k=0 and m=k=2 checks.
2. **Non-adic scope.** Habiro Proposition 6.1 concerns the completion topology. Replaced the stronger unsupported claim about arbitrary algebraic isomorphisms by the precise impossibility of an ideal-power filtration mutually cofinal with all cyclotomic ideals, for an infinite order set over a subring of the algebraic numbers.
3. **Order-zero component.** A nonempty class alone does not give a nonzero factor: Φ₀=1 and the {0} completion is zero. The factor must contain a positive order. Added that hypothesis, the explicit {0,1} negative control, and the named general class decomposition `comaximalSetoid`, `comaximalComponentOrders`, `comaximalComponentEquiv`, their restriction equation and continuity contract.
4. **Canonical comparison maps.** Added representative equations and discriminating values for finite Laurent quotients, exponential-coordinate Taylor maps, completed root families, universal Taylor coefficient changes, finite quotient coefficient changes, strict-precision transitions, graded comparisons, module product/chain coordinates, and actual localization fractions. Equivalences are tested on q, q² and 1−q, rather than merely by existence or their own inverse equation.
5. **Carrier tests.** Added geometric jet families that belong to the inverse limits, inconsistent constants and first jets that do not belong, and actual nonzero residue controls. In particular, the finite-order carrier must reject constants 0 and 2 at orders one and two even though these agree modulo two; full formal compatibility is stronger than agreement of root values.
6. **Basis and sign tests.** Added finite digit and jet basis vectors, ordered slots, coordinates, graded/remainder matrices and signed adjugates at small precisions. The recurrence divides by monic q^(n+1)−1 and then negates the quotient; q has negative first digit. The universal coordinate is q=z(1−u); the order-one first jet of q is −1.
7. **Elementary ownership.** The elementary q-toolkit is owned here in Layer 1 and exported to the q-series consumers. Added the promised adapted power-series Jackson operator. General lambda-ring theory remains deferred. No consumer is made a prerequisite for the toolkit it consumes.
8. **Public resultant source.** The previously unresolved Apostol publisher access failed with HTTP 403. Replaced that citation by Louboutin's public primary paper: the theorem on p.75 covers m>n>1, and Lemma 1 on p.76 supplies n=1. Its proof and boundary were read. No fresh reading of Apostol is claimed.
9. **Library reuse and form.** Use Tau Ceti's actual descending-list polynomial map and Mathlib's Hahn exponent embedding. Move projector/alternating-unit computations after their prerequisites, remove stage identifiers and catalogue scaffolding, and retain the mathematical hypotheses and locators in prose.

The five defects in the first review are resolved: general cofinal/reconstruction signatures; individual-root evaluation with irreducibility over Frac(A); all localized valuation components with the Galois bridge; actual Localization.Away and shared FractionRing statements; and elementary q-toolkit ownership. The revision supplied the central interfaces; this review independently checked them and completed their canonical equations and test coverage.

## Sources reopened

Read the public primary texts H, H₀, G, W and O, and the replacement L. No source files or passages are included in the repository. The downloaded versions are identified by their bibliography URLs and these SHA-256 fingerprints:

| Source | Fingerprint |
| --- | --- |
| H, published Habiro | f56094672ada5ba71bbce69785be8c9d1377807c937b1011b1004f51dbf3071f |
| H₀, arXiv v1 | ae2ea5024a0a45e8eaf16b1bcaaf1c139cd7437aaa5a6ea9ff596e98b47e69d0 |
| G, arXiv 2412.04241v2 | 308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9 |
| O, 50-page author's course notes | 6e1757b177f62808ef6ce3241dfe90de3831eb19d93a39c5afb7b41a43615955 |
| W, arXiv 2410.23078v5 | c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01 |
| L, publisher's public PDF | dd47d31757c7097a03a64b26814db6795a70cdb7cfd6a767145eb16ff1b254d6 |

All previously flagged locators were revisited. A reproducible random sample of 15 distinct source clauses, seeded with `codex-P1qif3`, was taken from the package's 55 source clauses before adding further checks. Each sampled assertion was checked against its locator and hypotheses:

| Sample | Locator reopened | Result |
| --- | --- | --- |
| 1 | H §3.1 p.1131; proof of Theorem 6.1, (6.1), p.1139 | Monic representatives and evaluation division agree. |
| 2 | O Proposition 1.5 proof p.3; Propositions 2.2, 2.5, Corollary 2.6 p.8; Proposition 2.7 p.9; G (46) p.18 | Toolkit identities and coefficient-recursion derivation agree with the stated normalizations. |
| 3 | H Lemma 4.1(2) p.1134; §7.5 pp.1145–1146 | Comaximal CRT decomposition supported; arbitrary classes use the finite-subset argument described in the package. |
| 4 | H Theorem 7.1 and proof p.1144 | Polynomial-coefficient module exactness supported. |
| 5 | G (299)–(300) pp.59–60; (303) p.60; discussion after (309) p.61 | Filtrations, shifted digits and universal coefficient algebras agree. |
| 6 | H Theorem 4.1 pp.1135–1136; Theorem 5.1 p.1137; Theorem 6.1 p.1139; G Remark 1.2 p.7 | Restriction/Taylor detection supports the explicitly described classical Galois-domain argument; no arithmetic twist is substituted. |
| 7 | G §1.3 p.5; H §1 p.1129 | Full classical completion and arithmetic boundary correctly distinguished. |
| 8 | G Example 5.7, (338)–(341), p.66 | Odd and exponent-one projector digits agree. |
| 9 | H §4 pp.1134–1136 | Order-chain restrictions require chains inside S. |
| 10 | H Proposition 7.1 and proof pp.1141–1142 | q is a unit and the Laurent comparison is supported. |
| 11 | H §1 p.1128 and §4 p.1136; H₀ §1 p.3 | Integral single-root rigidity and quantum-topology use supported. |
| 12 | G (298)–(300) p.59 and §1.4 p.7 | Universal quotient is necessary for coefficient change, including split factors. |
| 13 | O Table 1, Proposition 2.1 p.7; Proposition 2.2 p.8 | Finite toolkit and q-binomial identities agree. |
| 14 | H proof of Proposition 3.1 p.1132; G (9) p.5 | Factorial/monic reconstruction supported. |
| 15 | H §3.2 and Proposition 3.1 p.1132; Theorem 3.1 p.1133; Corollary 3.1 and Lemma 4.1 p.1134; Theorem 4.1/Corollary 4.1 pp.1135–1136 | Adjacency, separation and completion prerequisites agree. |

Additional source pitfalls were checked explicitly. The package retains connectedness omitted in H's printed Corollary 5.1 specialization; fraction-field irreducibility in the individual-root result; strict n<N in G's determinant product despite printed (313); constant term one for O's raw Proposition 1.5 series; the correct direction of O's q-shift identities; and the distinct-order hypothesis for W Lemma 2.1. Equal orders give an integral cyclotomic quotient, rather than an asserted characteristic-p quotient.

## Current-library duplication and dependency audit

Read the baseline declarations used at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, and the library-coverage audit. Also searched the current TauCetiRoadmap checkout `70b6231c2117a2e759c9891a4230573d816168ed` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` by mathematical shapes: compatible polynomial quotients, monic transition systems, factorial digit products, q-shift products, Jackson operators, Hahn dilations, rootwise Taylor maps, module products, cyclotomic resultants and localization projectors.

The search included every current roadmap and Completed directory, including all nine newer roadmaps and the four Completed roadmaps named in WORKERS.md. Followed relevant matches in ProfiniteArithmetic, IntegralLattices, ArithmeticDirichletSeries and Completed/OrthogonalL2Bases. These use different integer residue systems, lattices, Dirichlet-series multiplication or function-space bases; they do not own the cyclotomic completion or its q-toolkit. No additional owned target duplicate was found. No Lake command ran in the current upstream environment.

Reuses/removals:

- The descending coefficient-list polynomial object and generic synthetic division are Tau Ceti inputs, not new targets. `factorialDigitList` and its correctness statement refer directly to `TauCeti.Polynomial.ofCoeffList`. At the baseline import `TauCeti.Algebra.Polynomial.CoeffList`; the current module is `TauCeti.Algebra.Polynomial.Coeff.List`.
- Positive Laurent dilation specializes the existing `HahnSeries.embDomainRingHom`; `adamsLaurent` is an abbreviation, not a parallel Hahn-series implementation.
- Generic complete separated topological rings remain existing Tau Ceti inputs. The new targets specialize them to the cyclotomic compatible-family subobject.
- Mathlib's additive `descPochhammer`/`ascPochhammer` and Tau Ceti's falling-product extension are deferred in the ownership section. The multiplicative q-shift products are a different construction.

Classical prerequisite chains end in pinned library material or earlier layers. Other roadmaps in the ownership table consume these results. The sole imported derived comparison explicitly consumes HabiroRings Layer 2; its concrete derived API is named in the closing comment rather than replaced by a private carrier. It contributes no prerequisite to the ordinary classical results. The Habiro family is outside the Caraiani–Newton tier list. Opening an upstream draft remains subject to the maintainer's supplier/bundle scheduling.

## Adversarial mathematics pass

Every definition, theorem, identity and convention was checked; the table groups related declarations rather than omitting helper APIs. Checks cover all 167 definitions/abbreviations and all 374 theorem signatures, including naturality, topology, reconstruction, scalar and compatibility statements. Alias carriers are checked through their actual quotients and canonical maps, not by a type-inhabitation test. The final prototype has 509 `example` declarations; several compute multiple separate values.

| Statements / definitions checked | Instances and failure modes tried | Result / change |
| --- | --- | --- |
| Finite q-integers, factorials, Gaussian and multinomial polynomials; finite Pochhammer API | n=0, k>n, q=1, q=0, characteristic two, empty/all-zero list, inverse-parameter denominator | Integral recursions avoid 0/0. Inverse identities require q≠0; scalar specializations agree. |
| Polynomial and series Jackson operators, ordinary/adapted normalization | Constants, t² and t³; q=0,1,2; characteristic two | Ordinary q=1 derivative versus vanishing adapted derivative retained. Added adapted series and −3t at q=2. |
| Euler, reciprocal, q-binomial series and Jackson exponential | q=0, roots of unity, constant/linear/quadratic coefficients, q=1 exponential over ℚ | Product/quotient identities retain the non-root-of-unity or unit assumptions. No unlicensed cancellation. |
| Integral infinite products and raw Nahm/distinct-odd series | Constant term, degrees 1,2,3,8; q-adic coefficient stabilization | Raw constant term one; no analytic prefactor or invalid t-adic product limit. |
| Adams, plethystic sum/exponential, integrality | Negative q exponents; positive t exponent; zero input; ±t; composition; odd coefficient killed by dilation two | q and t exponents dilate in the same positive direction. Constant-input restrictions and coefficientwise integrality retained. |
| Actual cyclotomic index monoid and coefficient change | Empty S, Φ₁=Φ₂ in characteristic two, monic product, negative associate | Labels are not a free monoid. Actual-polynomial equality and monicity retained. |
| Compatible subalgebra, monic completion, transitions and finite quotient kernels | Zero/unit quotient; geometric jets; inconsistent constants/first jets; q,q²,1−q restrictions | Added positive and negative carrier controls; map direction is g→f when f divides g. |
| Topology, completeness, density, extension, uniqueness | Discrete quotient topology, zero ring, closed compatibility equations; non-Hausdorff uniqueness obstruction | Additive uniformity and Hausdorff target hypotheses agree. No topological-ring input redeveloped. |
| Polynomial-family limit, cofinal equivalences and coefficient maps | Even subsequence of powers of q−1; missing Φ₂; characteristic-two affine sign | Both cofinality directions and directedness required; canonical values tested. |
| Finite-order indexing/carrier and reconstruction | Empty subset, included {1}, excluded {3}; root constants 0 versus 1 and 0 versus 2 | Rejects out-of-set indices and merely pointwise root-compatible families. |
| Factorial polynomials, full completion, three presentations and transitions | P₀=1; odd leading sign; m=0; k=0; m=k=2; order one/two/six | Fixed positive-order divisibility. Non-adic theorem scoped to ideal-filtration topology. |
| Coefficient/order functoriality and all presentation squares | Identity/composition; q,q²,1−q; reduction kills 2q; divisible/equal orders | Canonical polynomial equations agree with the displayed map direction. |
| Factorial residuals, digits, series, reconstruction and multiplication | q,2−q,q²,zero; unrestricted cancellation; F² and upward carries | Residual quotient negation and bounded-degree uniqueness retained. |
| Executable digit list algorithm | Empty list; descending lists [−1,2] and [1,0] | Existing Tau polynomial convention used directly; first q digit is negative. |
| q inverse, Laurent extension and finite Laurent quotient | Order-two inverse; geometric series at one; q⁻²; residues q²=−1−q modulo Φ₃ | Added actual finite-map tests, not existence of an equivalence. |
| Evaluation family and Hasse/Taylor maps | F at 1,−1,i,ζ₃; q^p in characteristic p; additive/multiplicative/exponential coordinate signs | F(i)=8−3i; Hasse coefficient survives characteristic p; exponential coefficients pin the substitution. |
| Root/coefficient/order/power naturality | Galois square; a=1,2,3; a=0 excluded; square substitution at an unsuitable target order | Precise order condition m/gcd(m,a)∈S retained; maps fixed by polynomial values. |
| Root closeness and p-adic re-expansion | c=0, c and −c, two translations; prime-power ratio; difference one | Convergent evaluation, not algebraic non-nilpotent substitution. No general DVR claim substituted for a ℤ_p statement. |
| Order adjacency/connectivity and module adjacency | Equal orders; ∅; {1,2}; {1,6}; field ℚ; ℤ; zero module; ratio-six | Inside-S paths and separatedness are essential; zero-module adjacency behaves separately. |
| Cyclotomic ideals, pair quotient and resultant | Equal/distinct orders; n=1; p=2; non-prime-power ratio; Φ₁/Φ₆; Φ₃/Φ₁₂ | Distinctness and positive-order hypotheses retained; resultant uses absolute sign. |
| Monic implication/precedes and completion restriction | Divisibility; radical-unit obstruction; chain inside/outside prescribed set; empty start | Direction is correct; an outside shortcut cannot establish injectivity. |
| Finite-domain separation transfer and primitive-root rigidity | Non-Noetherian coefficient domain; finite fraction-space basis and cleared denominators; fourth-root 2-adic condition | Finite torsion-free embedding argument supplies transfer without a Noetherian assumption. |
| Selected-root uniqueness, domains and proper embeddings | Empty roots; disconnected S; a coefficient field containing i; integral positive roots | Retains connectedness and irreducibility over Frac(A); q−i is the failure witness. |
| Universal cyclotomic coefficients and finite Taylor product | Split Φ₄ over a field containing i; characteristic-two coefficients; constant and quadratic classes | Chosen root map is separate; universal algebra retains rank two and the kernel of one root selection. |
| h/p filtrations, finite quotients, slots and bases | N=1,2,3; ml=N; constant 7; q−1 zero/nonzero at successive precisions | Strict ml<N, shifted P_(N−1), ordered basis vectors and nonzero quotient controls fixed. |
| Graded aliases/comparisons, simultaneous remainders and leading factor | N=1,2,3,4; divisor one; m=l=2; constant −3 and linear 5 jets | Representative equations supplied; D_(1,4)=6 and D_(2,2)=8. No division in the integral graded formula. |
| Finite/global Taylor injectivity, reconstruction and rational equivalence | Zero ring; torsion-free ℤ; ℚ-algebra; characteristic two | Torsion-free condition is distinct from domain; universal product makes rational equivalence valid. |
| Taylor/remainder/graded matrices, determinant products and adjugates | Empty matrix; N=2,3,4,5 and through 7; both product orders; altered integral jet | Determinant bound n<N; δ₃=4, δ₄=216; signed adjugate times either side is δI. |
| Congruence/image and local-integrality detection | Zero numerator; D=±1; negative D; inverted/uninverted primes; a nonintegral recovered digit | D≠0 and positive divisor d retained; actual Localization.Away-to-ℤ_p fractions tested. |
| Polynomial-module quotient and compatible carrier | q−1 modulo its first/squared power; geometric jet family; conflicting constants/first jets | Genuine quotient and compatibility tests added, including a non-polynomial completed family. |
| Completed-module scalar/topology/functor API | Zero module; M=R; scalar q and 1−q; multiplication by two; identity/composition/exactness | Varies coefficient modules M, not arbitrary q-modules. Projection and scalar equations have actual vectors. |
| Products, tensor comparison and cofinal-chain module coordinates | Signed two-coordinate vectors; constant/linear/quadratic degree; ℚ with unbounded denominators; infinite direct sum | Product naturality and finite-presentation hypothesis retained; tensor is not falsely asserted for arbitrary M. |
| Comaximal decomposition and class setoid | ℤ orders 1/6, 1/2, 0/1; ℤ×ℚ; arbitrary classes; zero ring | Named general decomposition; fixed positive-order nonzero-factor condition and added order-zero control. |
| Rational decomposition, kernels and root values | Empty/all/singleton S; removed positive order; (q−1)e₁; q,q²,1−q | Complete jets, not root values alone, detect the rational product. |
| Localized integers, inverted primes, valuations and component projectors | Δ=1,3,6,12; primes 2,3,5; zero/positive valuations; distinct projector classes | Powers in Δ do not change the prime set. Components and projector coordinates have discriminating values. |
| Root algebra, Galois descent, domain components and detection | Δ=3 cubic split extension; conjugate roots; base coefficient image; uninverted prime separation | Split root extension need not be a domain. Galois invariance supplies base-image detection and domains. |
| Restriction projector and its localization | T=∅, T=S, proper rational T, non-comaximal Φ₂ at order one | Support is on retained orders; actual away localization and no-map obstruction retained. |
| Fraction fields, denominator systems, localized sum/intersection | q; q⁻¹; 1/(q−1); Φ₁ and Φ₂Φ₃; excluded q and 2; q/Φ₁, F/Φ₂, q⁻¹/Φ₃ | Both actual localizations live in the same FractionRing; nonzero monic denominators follow from polynomial embedding. |
| Ordinary/derived boundary and q-torsion counterexample | Zero polynomial module; monic injectivity; surjective transitions; direct sum with t^k maps | Derived supplier explicit; no claim that arbitrary q-module completion is exact. |
| Reference units, F and projectors | m odd≥3; order one/two/six; geometric series; odd and exponent-one projectors; characteristic-two idempotent | Restricted unit hypotheses, finite truncation bounds, signs and denominators retained. |

The characteristic-p and arbitrary-commutative-ring statements use universal cyclotomic quotients and Hasse coefficients. The local integrality criterion is explicitly about ℤ_p and integer localizations. It does not promise Teichmüller, uniformizer or ramified-DVR formulas. Such group/character/DVR-specific formulas do not occur in this package.

## Ten signature comparisons

| Signature | README contract confirmed |
| --- | --- |
| `X_pow_sub_one_pow_dvd_factorialPoly` | m>0; k arbitrary, including zero; P_(mk). |
| `PolynomialLimit.equivOfCofinal` | Both systems nonempty and directed; both divisibility cofinality directions. |
| `HabiroRing.orderAdicEquiv` | Full completion versus compatible positive-order adic families, with reconstruction. |
| `taylorAt` / `taylorAt_coeff_fromPoly` | Arbitrary commutative coefficient/root algebra, actual Φ_n root equation, Hasse coefficients. |
| `selectedRootEvaluation_injective` | Connected positive S, primitive selected roots, root equations, irreducibility over FractionRing A, infinite adjacent family. |
| `graded_taylor_map` | N>0; positive divisors; multiplier D_(m,N/m) with no integral denominator. |
| `finite_taylor_injective` | Integer torsion-freeness, not a hidden domain assumption. |
| `rational_taylor_isomorphism` | ℚ-algebra R and universal product, not H_ℤ tensor R. |
| `LocalizedIntegers.component_isDomain` | All positive Δ and every inverted-valuation tuple; uses the stated Galois bridge. |
| `restrictionLocalizationEquiv` / `localizedHabiro_eq_sum` | Actual away localization or cyclotomic submonoid localization; fraction identities share the same ambient field. |

## Validation and remaining work

Final validation is recorded below after the exact computation and elaboration checks. There is no outstanding review defect. Open conjectures and the explicit derived supplier boundary remain as scoped mathematical boundaries, not accepted theorems. An upstream port must use the current Tau coefficient-list module path and preserve the Layer 1 q-toolkit ownership.

- Final `lean-check`: exit 0, zero errors, 924 warnings, all exactly `declaration uses sorry`. It uses the shared build at the pinned Mathlib/Tau commits, serially; available memory exceeded 20 GB. No language server or library build was started.
- Independent exact integer/rational polynomial computations: **351 assertions passed**. These include 90 cyclotomic resultants (including n=1), 20 leading-factor identities and 20 lower-jet vanishings, determinant products through precision seven, both adjugate products, the ten-coordinate F vector and nonintegral perturbation, normalized digits/carries, new quotient/graded/module coordinates, and rational/characteristic-two projectors. These numerical checks supplement the mathematical pass; they are not Lean proofs.
- All three unchanged packet checks: zero errors and zero warnings.
- Intake `check-files` over the five changed deliverables: zero problems. `git diff --check`: clean.
- The 167 objects, 374 theorems and 509 examples are an inventory, not a substitute for the per-object audit. For example, each compatibility subalgebra's tests jointly exercise its subtype alias; HGr/PGr/DivisorCoeff are exercised by nonzero graded comparison values. Constants and nonzero first-jet tests prevent a zero-ring finite quotient from passing mere polynomial-map equations.
