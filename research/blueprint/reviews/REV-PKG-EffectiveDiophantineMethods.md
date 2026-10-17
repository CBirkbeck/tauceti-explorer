# Independent package review: effective Diophantine methods and certified rational points

**Verdict: accepted after corrections.** Reviewer: Codex, session `codex-cDevhG`, job `REV-PKG-EffectiveDiophantineMethods`, issue #10087, 17 October 2026. The package was written by another session, `codex-n7dGml`, in #10095. This review changes the package, its verdict and this report; the accepted packet is unchanged.

## Coverage and acceptance checks

| Requirement | Result and evidence |
| --- | --- |
| Upstream form | Read the EllipticCurves and Multiquadratic models, UPSTREAM_GUIDE, and current RealAlgebraicGeometry and IntegralLattices interfaces. The README has a summary, ownership, conventions, supplier contracts, seven layers, prose targets, named APIs, discriminating Checks and source locators. It retains the detailed roadmap rather than substituting a catalogue. |
| Accepted-plan fidelity | All 178 packet targets occur once, in the same order and with the same titles. All 507 API entries have their names in their corresponding README subsections, after namespace normalization. The added clauses repair the mathematical contracts; they do not delete targets to improve counts. |
| Dependencies | Read all seven library-audit entries, the tier order and each target's prerequisites. All internal Needs references resolve and the resulting directed graph is acyclic after the CM repair. Exact supplier contracts distinguish available objects from conditional application data. See the ownership audit below. |
| Definition tests | All 58 definition/construction targets have at least five Checks bullets. Counts supplement the mathematical pass below: each defining interface was inspected for a positive case, a degenerate case and a plausible wrong definition. Added missing separate checks of light predicates and partial sums. |
| Sources | Read the public passages for a seeded sample of 15 targets, plus the Matveev formula and the Thue–Mahler corrigendum. The sample and locator details are below. The inherited unverified Prickett attribution is unused; the relevant active statement uses the public Siksek preprint. |
| Lean shape | 428 lines, eight light definitions, one structure, twenty theorem signatures and thirty examples. Data bodies are real expressions over pinned carriers. Heavy constructions stay in the README and are inventoried in the closing comment. No theory development, sorry'd carrier, True placeholder or circular proof hypothesis was introduced. |
| Lean elaboration | Independent initial and revised whole-file `lean-check` runs exited 0. The final run has 50 warnings, all `declaration uses sorry`, with no errors or other warning category. Signatures and examples remain proposals, not proved mathematics. |
| Metadata | Unchanged single line `topic = "math.NT"`; appropriate for the subject. |
| Own words and repository hygiene | Read the prose and changes for quotations and source-by-source summaries. A normalized 24-word comparison with the downloaded public source texts found no common passage; this supplements reading. No source files, source passages or machine-specific paths are submitted. |

The packet checker exits 0 with zero errors and one existing naming warning: `mathlib:Finset.mem_filter` has the index spelling `Finset.Finset.mem_filter`. That warning belongs to the unchanged packet and is not a Lean diagnostic. The checker reports 480 API records and 337 tests in its normalized inventory; the direct packet inventory contains 507 API entries and 346 tests, including revision additions. The fidelity check used the full inventory.

## Corrections applied

1. **Affine lattice witness, §1.10.** Nonsingularity does not force a nonintegral coordinate of an affine target. `DistanceWitness.ofLLL` now returns an option: the homogeneous branch and an affine target outside the lattice can produce a witness; a nonzero target in the lattice returns none. For A=[2], y=2 the affine distance is zero. Added the corresponding README negative control and a Lean example; y=0 and y=1 distinguish the other branches.
2. **Signed p-adic congruences, §2.7.** The rational valuation adapter now requires nonzero units and a sign killed by e. At p=2, e=1, t=2, g=3, M=1, γ₀=3, the negative signed form is −4, of valuation 2, although ℓ₀=1 is nonzero modulo 2. An arbitrary exponent cannot silently kill −1. An even exponent permits both signs. Added this example in the README and Lean.
3. **Trivial group and exact zero, §2.7.** Allow M=0; omit the predecessor-power order test in that branch. Then g=1, all ℓᵢ=0 and the lattice is the whole group. The rational adapter tests z=0 before using totalized `padicValRat`; z=0 satisfies every congruence although that Lean valuation returns 0. Added both controls. Standard nontrivial constructors retain their M≥1 hypothesis.
4. **Geometric multiplicities, §6.16.** The perturbation budget d bounds roots over completed C_p with multiplicity, not distinct Q_p roots. Added `geometricRootCount_eq_weierstrassDegree` and `roots_determined_of_truncation`, including the unit-factor evaluation and cluster comparison needed beyond existing preparation. X² has multiplicity two; for odd p, X²−p³ has two geometric roots in the disc and no Q_p root. The README now explicitly separates these facts from §4.26. Added the repeated-root multiset example in Lean.
5. **Local degree, §0.8.** Replace ambiguous “degree-one prime” by local degree one, e=f=1. A prime of Q(√3) above 3 has f=1 and e=2 and supplies no Q_3 embedding: a square root of 3 would have half-integral valuation. Added the negative control and Lean statement.
6. **Complex box norm, §0.10.** Corner values give the upper bound for squared norm. Its lower bound uses distances of the coordinate intervals from zero. On [−1,1]², the correct range is [0,2], while all corners have squared norm 2. Added the witness and Lean example.
7. **CM prerequisites and dependency cycle, §§6.29–6.33.** Remove the upward CM.3 integrality citation and the chain through §6.33 back into its own input. Shared application hypotheses now explicitly provide CM integrality, rationality/realization for class number one, residual Cartan containment, and the independent identification of the seven modular j-fibres and orders. They do not assume the rational-point completeness conclusion or the desired classification. These are conditional applications, not a new CM roadmap. Baran's coordinate isomorphism is still not asserted to preserve the j-map.
8. **Finite torsion cutoff, §§3.15 and 3.20.** Remove the unsupplied appeal to Mazur and the heuristic stopping rule “until a non-integral multiple”. A good odd reduction prime q supplies M=#E(F_q); rational torsion injects, so [M]P=O is an exact finite torsion test. An accepted order is computed among divisors of M. The height search now names §3.20 as its dependency. On y²=x³−4x+1 the good reduction orders 7 and 9 force trivial torsion, while the integral Lutz candidate (0,1) fails the M=7 test modulo 5.
9. **Separate light-definition checks.** Add the complex-coordinate order, arctangent empty/zero/second-term, p-adic-log empty/identity/first-term, support, triple positivity/coprimality/order and S-unit exponent-height tests. The arctangent value at t=1,N=2 is 2/3; the wrong alternating sign gives 4/3. These checks address the actual definitions rather than relying on unrelated field examples.
10. **Lean definition inventory.** Correct `quarticLocallySoluble` and list omitted local-solubility, two-isogeny, height, normalized-ball and explicit-quartic definitions in the closing comment. No heavy carrier was added just to make a name occur in Lean.

## Source checks

The seed was `codex-cDevhG`; the 15 sampled targets below were selected before opening their passages. Locations distinguish published pagination from author/arXiv versions. All conclusions here are paraphrases; no source passage is reproduced. A source match supports the cited target, not a claim that its complete application transcript has been recomputed.

| Sampled target | Passage actually read | Result |
| --- | --- | --- |
| §4.1 Good-reduction datum | [McCallum–Poonen](https://math.mit.edu/~poonen/papers/chabauty.pdf), §5 opening p.5 and §5.2(1) p.6; [Siksek](https://arxiv.org/abs/1010.2603), §3.4 Lemma 3.1(iii), p.6 | Properness, smooth reduction and the maximal-ideal parameter support the datum. The genus-zero example is a check of the reduction interface, not an inhabitant of the genus≥1 record. |
| §2.4 Yu constant | [Yu 1994](https://numdam.org/item/CM_1994__91_3_241_0.pdf), §0.1 theorem, p.242, including the rendered formula | Confirmed 22000, exponent 2(n+1), residue factor p^f−1, modified heights and final logarithm. Local/nonzero hypotheses are retained. |
| §3.22 Mordell–Weil basis | [Cremona, Chapter III](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.5 p.75; [Siksek author preprint](https://samirsiksek.github.io/siksek.github.io/papers/infart2.pdf), §4 opening p.17 | Height/index/saturation strategy agrees. Rank zero is handled by torsion; the rank-one threshold uses an upper height endpoint. |
| §6.24 Frobenius on X_s(13) | [BDMTV 2019](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6.4 p.931 | Confirms first-chart derivative restriction and finite Frobenius inputs. The P₀ disc is excluded from this chart. |
| §6.3 QC disc certificate | BDMTV 2019 §6.4.1 p.933; [BDMTV arXiv v4](https://arxiv.org/abs/2101.01862v4), Lemma 4.7 p.25 | Finite coefficient precision needs a tail bound and isolation; congruence roots alone do not give a valid disc certificate. |
| §4.3 Abelian integrals | McCallum–Poonen §5.1 p.5; Siksek §§3.1 and 3.3 pp.4–5; [Box arXiv v3](https://arxiv.org/abs/1906.05206v3), §2.3.1 p.5 | Supports logarithm pairing and basepoint differences. Constants and direction of integration remain explicit. |
| §6.16 Root precision | BDMTV arXiv v4 Lemma 4.7 and Remark 4.8 p.25 | The inherited stronger tail hypothesis is necessary; this review additionally makes the geometric multiplicity bound and adapter explicit. |
| §5.26 Deep information | [Bruin–Stoll](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/29EFF630FD2859F8C79DFD48E1A33926/S1461157009000187a.pdf/the-mordell-weil-sieve-proving-non-existence-of-rational-points-on-curves.pdf), §6 pp.296–297, Lemma 6.2 p.297 | Confirms necessity of deep local conditions. Passing a local filter is not a converse existence claim. |
| §6.36 Quartic Thue equations | [Tzanakis–de Weger 1989](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), Theorem B p.122 and proof p.126 | Confirms the equation and finite-list endpoint; exact substitution checks soundness independently of completeness. |
| §4.15 Hyperelliptic parameters | McCallum–Poonen §8.2, proof of Proposition 8.2 p.10; [Poonen arXiv v1](https://arxiv.org/abs/math/9512217v1), §4 proof of Proposition 2 pp.16–17 | Confirms the ordinary/Weierstrass/infinity parameter distinctions and orders of vanishing. |
| §1.5 p-adic approximation lattice | [Tzanakis–de Weger 1992](https://numdam.org/item/CM_1992__84_3_223_0.pdf), §15 p.260; [de Weger 1989](https://ir.cwi.nl/pub/13190/13190D.pdf), §3.11 Lemma 3.13 p.64 and §3.12 p.65 | Read the rendered matrices as well as text. The retained target sign is fixed by the mod-3 example; the erroneous sign in the old lemma is not adopted. |
| §6.37 Integral points | Tzanakis–de Weger 1989 Theorem A pp.118–119 and §III.1 p.119 | Confirms y²=x³−4x+1 and the listed large point. Transformation and exact point checks remain separate from finite completeness. |
| §3.28 Poonen's genus-two data | Poonen arXiv v1 §4 Proposition 1 proof p.13 and Proposition 2 proof p.16; [author errata](https://math.mit.edu/~poonen/papers/errata.pdf), version 14 August 2025, §2 first item p.1 | Confirms the corrected rank conditionality and the local-sign erratum. The README does not promote the conditional rank upper bound to an unconditional theorem. |
| §2.19 Thue certificate | Tzanakis–de Weger 1989 §II.3 pp.117–118 and §II.1 p.103 | The small/moderate/large split and exceptional exact filtering support the complete certificate architecture. |
| §5.15 Sieve chain | Bruin–Stoll §3.2 p.277 and §3.3 pp.278–279 | Prepared subgroups are preimages of N_kG_i, not of the zero subgroup; every changed test must be included. The package already contains this correction. |

Additional direct checks: Matveev, *Izvestiya Mathematics* 64 (2000), pp.1217–1220, especially Corollary 2.3 p.1219, uses an additive linear form in chosen logarithms with the required nonzero condition. This was read directly rather than adopting the previous handoff's description as a product-minus-one formula. The package's additive formulation is retained. The [1993 Tzanakis–de Weger correction](https://numdam.org/item/CM_1993__89_2_241_0.pdf), pp.241–242, changes the omitted factor to 7^15 and the corresponding initial thresholds; the package keeps the corrected 1.511·10^50 route separate from the alternative Baker–Wüstholz 9.844·10^49 route. The inherited Prickett reference was not recovered and is not an active source of any retained claim; Siksek's public Theorem 1.2 and §4 supply the corresponding bound. Silverman's public endpoint returned HTTP 403 in this review; that paper was not in the random sample and is not represented here as independently re-read.

## Ownership, tier and library audit

The representative Lean baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The separate current-library overlap audit used Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The current roadmap checkout and its Completed directory were read without building them. Searches covered objects and hypotheses: selected roots, norm/height enumeration, affine lattice distances, logarithms, saturation, descent, abelian logarithms, sieve quotients, restricted series and Weierstrass preparation.

| Potential overlap | Ownership decision after reading the supplier |
| --- | --- |
| RealAlgebraicGeometry Layer 1, Sturm–Tarski and Thom encodings | Imported boundary. §§0.2–0.4 add quantitative refinement of a fixed selected value and labelled embedding; no duplicate real-algebraic field is proposed. |
| IntegralLattices Layer 2, bounded norms/minima; Completed/IntegralLattices | Imported boundary. §§1.7–1.10 add affine closed-interval enumeration and replayable distance/exclusion certificates. |
| Completed/EffectiveBounds | Its growth/analytic effective bounds do not provide the concrete logarithm or Diophantine certificate interfaces here. No duplicate target found. |
| NumberFieldArithmetic's unit/prime-degree bounds | Its existing element and unit machinery is input. It does not give §0.11's general explicit bounded-height coordinate cover. |
| Pinned Mathlib power-basis characteristic polynomial | Read `Algebra.charpoly_leftMulMatrix`; its generator identity does not provide §0.10's arbitrary-element tower/relative-height identity. The latter stays as an explicit new bridge. |
| Pinned elliptic descent and canonical height | Read kernels, Selmer membership, image cardinality/rank bound, finite generation, height quadraticity and comparison statements. §§3.2–3.7 provide finite local/checker adapters, not another abstract Selmer group or rank bound. The half-x-height normalization is preserved. |
| Current local-field logarithm | Read `TauCeti.hasSum_log_of_mem_unitFiltration_one` and `TauCeti.valuation_log_sub_log`, including the deep-unit inequality e<(p−1)i. §2.6 adds finite truncation errors; it does not re-plan convergence or isometry. |
| Pinned Gauss-norm maximum / current distinguished-series interface | Imported by module/declaration in Scope and ownership. §4.26 adds a zero bound, not another maximum-index construction. |
| Current Weierstrass preparation and uniqueness | Imported factorization. §6.16 adds evaluation of the analytic unit, geometric root multiplicities and quantitative perturbation/cluster comparison; no second preparation theorem. |
| Current AdicSpaces and EllipticCurves | Existing analytic and arithmetic foundations stay supplier contracts. Scalar Q_p enclosures are explicitly not geometric charts. |

The nine roadmaps newer than the atlas snapshot were all searched: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory (including its subroadmaps), OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry. Completed/ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts were checked as well, together with the other relevant completed interfaces. No additional target needed deletion: the package already defers the existing mathematical objects, and each close retained variant states its extra content. The review changes no Tau Ceti roadmap.

EffectiveDiophantineMethods is tier 17. Its atlas supplier contracts are downward: AnabelianGeometryAndNonabelianChabauty 16, ColemanIntegration 15, PadicDifferentialEquationsAndRigidCohomology 12, DeligneWeightsAndPurity 11, ModularCurvesPartII 11, FiniteFlatGroupsAndIntegralPadicHodgeTheory 10, HeightsRationalPointsAndObstructions 9, NeronModelsAndSemistableAbelianVarieties 8, GeometryOfNumbersAndQuadraticArithmetic 3, DiophantineApproximationAndTranscendence 4 and SchemeAndStackFoundations 2. The README's exact names/layers fix the individual contracts. There are no remaining FoundationsAndLibraryIntegration, UPSTREAM, ComputationalNumberTheory, GrossZagier, Heegner or CM roadmap prerequisites. Conditional analytic rank and CM inputs are stated as application hypotheses rather than upward imports. No ownership move requiring a higher roadmap to change was made in this review.

## Adversarial mathematics pass

The following inventory covers all 178 target subsections and their 507 associated API entries, read in context. Each row records an instance or failed alternative used to inspect the target's definitions, identities and subsidiary APIs. “Retained” means the stated hypotheses handle the case; it does not mean the target has been formally proved. “Fixed” refers to the corrections above. The table records mathematical checks, not 178 executions of Lean or full numerical replays of the cited applications.

### Layer 0

| Target and associated API | Instance or failed alternative | Result |
| --- | --- | --- |
| §0.1 Certified enclosures and the precision contract | I lies in [0,0]×[1,1], not the coordinate-swapped box; singleton intervals are allowed. | Fixed coordinate checks. |
| §0.2 Exact algebraic values with isolating intervals and discs | X²−2 selects +√2 in [1,3/2], not −√2; a disc must isolate one selected root. | Retained. |
| §0.3 Arbitrarily fine certificates of the same algebraic root | A rational root has width-zero refinements at every precision; [1,3/2] is too wide at precision 3. | Retained. |
| §0.4 Archimedean embeddings pinned by isolating boxes | The positive √2 box sends 1+θ to 1+√2; the conjugate embedding must not pass it. | Retained. |
| §0.5 Hensel's lemma with the exact distance to the root | At p=7, F(3)=7 and F′(3)=6; an exact root gives distance zero without division by zero. | Retained strict Hensel hypotheses. |
| §0.6 p-adic embeddings pinned by Hensel certificates | The two lifts 3 and 4 modulo 7 select different √2 embeddings. | Retained. |
| §0.7 Certified nonvanishing and the exact zero test | The small nonzero Pell conjugate must not become zero because a coarse enclosure contains zero. | Retained exact coordinate zero test. |
| §0.8 Certified valuations from p-adic enclosures | Q(√3) at 3 has f=1 but e=2, preventing a Q_3 embedding; 18 has 3-adic valuation 2. | Fixed local-degree condition. |
| §0.9 Scalar p-adic precision under field operations | B(3,4)B(9,5)⊆B(27,6); inversion of B(9,5) has precision 1, not 5. | Retained valuation-dependent losses. |
| §0.10 Certified enclosures of the height of a number-field element | On [−1,1]², squared norm ranges from 0 to 2 although every corner gives 2; relative height of √2 is 2. | Fixed lower bound. |
| §0.11 Certified enumeration of points of bounded height | Over Q, height<2 gives 0,±1; the boundary includes ±2,±1/2; infinity is separate. | Retained boundary bands. |

### Layer 1

| Target and associated API | Instance or failed alternative | Result |
| --- | --- | --- |
| §1.1 The approximation lattice of a real linear form | Columns (1,3),(0,7) give determinant 7; (0,1) is outside the lattice. | Retained column convention. |
| §1.2 Lower bounds for lattice distances from a reduced basis | For Z² and target (1/2,0), the bound 1/8 is below the true squared distance 1/4; integral targets need another branch. | Retained with §1.10 repair. |
| §1.3 Reduction of a homogeneous real linear form | The log2/log3 rounded lattice has lower squared bound 21478085/2, exceeding the specified box radius 10^7. | Retained nonzero homogeneous vector condition. |
| §1.4 Reduction of an inhomogeneous real linear form | The inhomogeneous example needs the target term and the rounding margin, not the homogeneous radius alone. | Retained explicit margin. |
| §1.5 The approximation lattice of a p-adic linear form | At p=3, target (0,−1) accepts b=(0,1); target (0,+1) tests the wrong congruence. | Retained corrected affine sign. |
| §1.6 Reduction of a p-adic linear form | Distance from −5 to 9Z is 4, excluding \|b\|≤3 in b≡5 mod 9. | Retained strict distance inequality. |
| §1.7 Fincke–Pohst enumeration of lattice points in an ellipsoid | G=I₂,R=1 yields five vectors; the hexagonal form at R=2 yields seven, excluding (1,1). | Retained closed boundaries and positive definiteness. |
| §1.8 Soundness and completeness of the Fincke–Pohst enumeration | The affine lattice Z×10Z at target (0,−1) has no vector of squared distance≤1/2. | Retained soundness and completeness directions. |
| §1.9 Residual enumeration for a real linear form | For θ=(1,√2), the rounded form uses the full sum of rounding errors, including zero coefficients. | Retained bounded residual search. |
| §1.10 Lattice exclusion certificates for linear forms | A=[2], y=2 has zero affine distance; y=0 is homogeneous and y=1 has a nonintegral pivot. | Fixed optional LLL witness. |
| §1.11 Soundness of lattice exclusion certificates | A successful finite distance check excludes only its stated box; the original uncorrected 1992 constants cannot justify it. | Retained corrected arithmetic inputs. |

### Layer 2

| Target and associated API | Instance or failed alternative | Result |
| --- | --- | --- |
| §2.1 Certified enclosures of logarithms and arguments of embedded algebraic numbers | Log at x=1 is zero; x=0 is rejected; arctan(1)'s two-term sum is 2/3, with an endpoint remainder. | Added empty/zero/sign checks. |
| §2.2 Certified evaluation of Matveev's constant | For two rational logs, the admissible upper constant 8·10^8 is accepted while 7·10^8 fails the displayed check. | Retained outward upper bounds. |
| §2.3 Certified lower bound for a linear form in logarithms | For logs of 2 and 3, unique factorization supplies nonvanishing; the all-zero coefficient vector cannot use the theorem. | Retained nonzero additive form. |
| §2.4 Certified evaluation of Yu's p-adic constant | Degree one has residue factor p−1, not p²−1; zero or negative height upper bounds cannot enter the constant. | Retained Yu normalization. |
| §2.5 Certified upper bound for the p-adic valuation of a multiplicative form | At p=7, 2·3²−1=17 has valuation zero; the zero multiplicative form is excluded from the upper-bound theorem. | Retained nonvanishing hypothesis. |
| §2.6 Certified p-adic logarithm values with explicit tails | At p=3, z=4,N=4 gives −51/4; z=1 and N=0 give zero; depth-one z=3 at p=2 fails the strict tail slope. | Added partial-sum boundary checks. |
| §2.7 Discrete-logarithm certificates for p-adic multiplicative forms | Modulo 4, −3−1 vanishes but exponent 1 is nonzero modulo 2; M=0 and exact zero require separate branches. | Fixed sign, trivial group and valuation adapter. |
| §2.8 Exponent reduction chains | An empty reduction chain returns its original bound; exceptional points must survive every later step. | Retained exception union. |
| §2.9 Thue equations and their solution sets | For X³−2Y³=8, (2,0) is a solution despite nonprimitivity; the equation is not silently normalized. | Retained solution definition. |
| §2.10 Factor coverings: units and representatives for X − ξY | The unit representative 1 covers norm 1, but cannot cover (0,−1) of norm 2. | Retained complete representative condition. |
| §2.11 Certified constants of the Tzanakis–de Weger method | A totally complex polynomial has no real-root branch and uses only the small-Y bound. | Retained branchwise constants, avoiding empty minima. |
| §2.12 Lemma 1.1: solutions with large |Y| approximate a real root | For (−1,−1), \|Y\|=1 is below the large-Y threshold, so no approximation conclusion is forced. | Retained strict threshold. |
| §2.13 Lemma 1.2: the unit equation and a small nonzero linear form in logarithms | The cubic field has one unit exponent and a separate 2π argument integer; dropping that integer changes the logarithm branch. | Retained argument convention. |
| §2.14 Lemmas 2.1–2.2: the exponents are logarithmic in |Y| and Λ decays exponentially | In rank one the inverse log matrix is scalar; an uncertified zero determinant cannot be inverted. | Retained nonsingularity and positive constants. |
| §2.15 Lemmas 2.3–2.4 with Matveev's bound: the initial exponent bound | The real quartic route uses four chosen logarithms and an explicit field-degree bound; a zero form is an exceptional branch. | Retained initial-bound hypotheses. |
| §2.16 Reduction of the initial bound and the bound for |Y| | The sample bounds decrease from 3.26·10^40 to 72 then 10; exceptional exponent vectors still require exact filtering. | Retained. |
| §2.17 The continued-fraction search for solutions of moderate size | The rational approximation 63/50 has convergents 1,4/3,5/4 below denominator 12; later convergents are not in that search. | Retained precision and denominator cutoff. |
| §2.18 Exhaustive enumeration of the solutions with small |Y| | For X³−2Y³=1 and \|Y\|≤1 the set is {(1,0),(−1,−1)}; Y bound zero is a distinct finite branch. | Retained exact enumeration. |
| §2.19 Thue solution certificates | In the totally complex branch a finite small-solution list suffices; the real branch cannot omit reduction exceptions. | Retained raw/semantic distinction. |
| §2.20 Certified solution sets of Thue equations | Equality with the listed set needs exact membership as well as a covering bound; a covering list alone may contain false candidates. | Retained final filtering. |
| §2.21 Thue–Mahler equations and their normalised solution sets | (3,1,2) gives 25 for prime 5; (5,0,3) is excluded by gcd although it satisfies the power equation. | Retained normalization preventing infinite scalings. |
| §2.22 The Prime Ideal Removing Lemma | At p not dividing the discriminant, at most one prime above p can divide x−yθ for a primitive pair. | Retained ramification/discriminant branches. |
| §2.23 Thue–Mahler S-unit coverings | With no active degree-one prime, the free prime exponent is zero, not an unspecified bounded integer. | Retained complete finite covering. |
| §2.24 Initial bounds for the Thue–Mahler exponents from Yu's and Matveev's bounds | The corrected 1.511·10^50 and alternative 9.844·10^49 initial bounds are separate derivations. | Retained corrigendum and nonmixed routes. |
| §2.25 p-adic and real reduction of the Thue–Mahler exponent bounds | Every real/p-adic reduction step preserves the exceptional tuples; a failed distance check cannot lower an exponent. | Retained. |
| §2.26 Sieving exponent tuples with auxiliary primes | Failure at one admissible auxiliary prime eliminates a tuple; success at every prime does not establish the equation. | Retained one-sided sieve. |
| §2.27 Thue–Mahler solution certificates | (3,1,2) passes the exact equation; (3,1,1) fails because 25≠5. | Retained finite transcript and exact check. |
| §2.28 Certified solution sets of Thue–Mahler equations | The residual boxes must cover every normalized solution, not merely every listed one. | Retained completeness premise. |
| §2.29 The S-unit equation x + y = 1 over ℚ and its solution set | Support admits 1 and excludes 0 for finite S; (1,2,3) passes, (2,2,4) fails gcd, and (2,1,3) fails order. | Added separate predicates and height checks. |
| §2.30 Initial exponent bound for the S-unit equation from certified Yu constants | The initial Yu-based theorem requires at least two primes; empty and singleton S use their own finite branches. | Retained small-support cases. |
| §2.31 p-adic reduction for the S-unit equation | At p=7, 1+48=49 has valuation 2 and is not forced into the level-3 lattice. | Retained congruence threshold. |
| §2.32 S-unit solution certificates | For S={2}, the signed rational solutions are (2,−1),(−1,2),(1/2,1/2); empty S has no solutions. | Retained exceptional branches. |
| §2.33 Certified solution sets of S-unit equations over ℚ | The six symmetries of a positive coprime triple must be accounted for; a normalized triple is not the whole rational list. | Retained exact solution-set equality. |

### Layer 3

| Target and associated API | Instance or failed alternative | Result |
| --- | --- | --- |
| §3.1 Size of E(ℚ_v)/2E(ℚ_v) at a finite or real place | For y²=x³−x, the quotient sizes are 4 over Q_3 and 8 over Q_2; the real factor differs. | Retained local absolute-value factor. |
| §3.2 Certified local image of the 2-descent map | An empty generator list gives the trivial subgroup, complete only if the independently computed quotient size is one. | Retained size witness. |
| §3.3 The size check completes a local image | A subgroup with the same finite cardinality as the local image is equal to it; a mere lower cardinality bound is insufficient. | Retained inclusion plus size. |
| §3.4 Local images at good odd places are the unramified classes | The unramified shortcut applies at good odd primes; it does not remove the p=2 or bad-prime checks. | Retained. |
| §3.5 Certified 2-Selmer group of an elliptic curve over ℚ | For y²=x³−x the local Selmer set has size 4; dropping local conditions yields size 16. | Retained genuine local filtering. |
| §3.6 Soundness of the certified 2-Selmer group | A finite certificate identifies the existing Selmer group, not an unrelated finite group of equal name. | Retained comparison maps and both inclusions. |
| §3.7 Certified 2-descent rank upper bound | Selmer dimension 2 minus rational 2-torsion dimension 2 gives rank zero. | Retained torsion subtraction. |
| §3.8 Certified local solubility test for y² = g(x) | −x⁴−1 is insoluble over R; its good odd finite-place tests need not be false. | Retained separate infinite place and p=2 branches. |
| §3.9 Correctness of the quartic local solubility test | The Lind–Reichardt quartic is locally soluble at 2,17 and infinity; that does not imply a rational point. | Retained local-only conclusion. |
| §3.10 The descent map for a rational 2-isogeny | The map sends O to 1 and (0,0) to d; the generic x formula cannot be used at either exceptional point. | Retained dual-isogeny direction. |
| §3.11 Rank bounds from descent via 2-isogeny | n₁=n₂=256 and n₁′=n₂′=128 yield rank 13; upper bounds alone do not prove equality. | Retained lower-image witnesses. |
| §3.12 Cremona's rational height difference bound | For y²=x³+B, the half-height constants use log\|432B²\|/12; O has no x-coordinate to evaluate. | Retained normalization and O branch. |
| §3.13 Certified enclosure of the canonical height by doubling | O and a point killed by doubling have height interval [0,0]; general widths shrink by 4^n and include the factor 1/2. | Retained exact-height convention. |
| §3.14 Independence and regulator lower bound from certified heights | A positive determinant lower bound proves independence; a nonpositive interval endpoint does not certify it. | Retained positive-definiteness requirement. |
| §3.15 Lower bound for the canonical height of non-torsion points by a certified search | Rank zero has only torsion fibres; Z×Z/2 at radius zero has two values, not one. | Fixed exact torsion test and dependency. |
| §3.16 Index bound from a height lower bound and Minkowski's theorem | Rank two, R≤9, λ≥1 and γ₂²=4/3 give index²≤12, hence index≤3; rank zero is separate. | Retained Hermite exponent. |
| §3.17 p-saturated subgroups | 6Z is 5-saturated but not 2- or 3-saturated; the whole group is saturated. | Retained quotient-torsion definition. |
| §3.18 p-saturation from jointly injective reductions | A nonzero class modulo 3 at the cited genus-two reduction detects the generator; full joint injectivity is essential. | Retained reduction/quotient domains. |
| §3.19 Rank lower bound from reductions | A quotient (Z/3)^3 proves rank≥3 only after excluding rational 3-torsion. | Retained torsion hypothesis. |
| §3.20 Certified torsion subgroups | Good reduction orders 7 and 9 force trivial torsion; (0,1) on x³−4x+1 is integral but fails [7] modulo 5. | Fixed finite cutoff without Mazur. |
| §3.21 Certified finite-index subgroup of a Mordell–Weil group | At rank zero with G=A_tors the subgroup is the whole group; finite index cannot follow from independent points of smaller rank. | Retained rank equality. |
| §3.22 Certified Mordell–Weil basis | For x³−x, the basis has rank zero and full 2-torsion; a prime-to-3 index alone is not a full basis. | Retained all relevant saturation primes. |
| §3.23 Rank bound for genus-two Jacobians by the x − T descent | The x−T map can have kernel larger than 2J; the cited C₀(5) kernel factor 2 must enter the rank bound. | Retained kernel correction. |
| §3.24 The Lind–Reichardt curve: a nontrivial torsor class | Everywhere local solubility of the Lind–Reichardt class does not put it in the global descent image. | Retained Selmer versus image distinction. |
| §3.25 Descent via 2-isogeny on Fermigier's rank-13 curve | 256·128 gives the rank-13 upper bound; equality still needs thirteen certified independent points. | Retained conditional arithmetic data. |
| §3.26 Rank-zero elliptic curves of small conductor, with their rational points | The E24 point (1,−1) lies on the model; the printed (−1,1) does not. | Retained corrected point and separate E11 certificate. |
| §3.27 Mordell–Weil group of the Jacobian of C₀(5) (Flynn–Poonen–Schaefer) | An index prime to 3 preserves the 3-adic annihilator; it does not prove D is an integral generator. | Retained weaker exact conclusion. |
| §3.28 Mordell–Weil data for the Jacobian of C₁(3₂) (Poonen) | g(2)=73, g(−2)=33 and 73 is a nonsquare modulo 743; the printed local point fails. | Retained erratum and conditional rank. |
| §3.29 The subgroup of known points on X₀^dyn(6), with the conditional rank input labelled | Three independent generators establish rank≥3; finite index additionally needs rank≤3. | Retained conditional label. |

### Layer 4

| Target and associated API | Instance or failed alternative | Result |
| --- | --- | --- |
| §4.1 Good-reduction Chabauty datum: curve, base point, smooth model and residue discs | C₀(5) at 3 has four residue discs; a parameter over a ramified extension takes values in its maximal ideal, not pO. | Retained finite-extension distinction. |
| §4.2 The p-adic abelian logarithm and the integration pairing | Torsion maps to zero and the zero-dimensional abelian variety has zero logarithm. | Retained domain and unique continuous extension. |
| §4.3 Abelian integrals of regular differentials on a curve | Integral from Q to itself and integral of zero vanish; reversing endpoints negates the result. | Retained abelian-log comparison. |
| §4.4 Tiny integrals: abelian integrals on a residue disc are power-series primitives | The coefficient of t^i integrates to t^(i+1)/(i+1); denominators lose p-adic digits even in a good disc. | Retained convergence/precision hypotheses. |
| §4.5 Pairing a point of the kernel of reduction with a differential by tiny integrals | A divisor [Q−P′] in one disc gives the single tiny integral, while a representative of degree g includes all multiplicities. | Retained divisor-class compatibility. |
| §4.6 Coleman integrals of regular differentials are abelian integrals | In genus one the Coleman integral agrees with the formal logarithm extended from the identity neighbourhood. | Retained actual comparison, not a renamed definition. |
| §4.7 Constants of integration on residue discs without a known rational point | A rational base point in the tested subgroup permits constant zero; a disc without one cannot silently make that choice. | Retained independent constant certificate. |
| §4.8 The p-adic closure of a Mordell–Weil group: dimension at most the rank | For a finite subgroup the logarithmic closure dimension is zero; dimension equal to genus does not give Chabauty finiteness. | Retained rank/dimension distinction. |
| §4.9 Annihilating (vanishing) differentials of a Mordell–Weil subgroup | A zero generator matrix has full annihilator; a positive-rank example requires the correct vanishing linear combination. | Retained integral reduced lattice. |
| §4.10 Certified p-adic precision of annihilating differentials | At rank zero no pivot precision is lost; a pivot of valuation one loses one digit, not zero. | Retained nonzero minor and precision budget. |
| §4.11 Zero bounds for integrals on a residue disc, including exceptional discs | At p=3,m=1 the extra t² coefficient condition matters; at m=2 the general Strassmann count can be 3. | Retained exceptional-disc branch. |
| §4.12 Chabauty's theorem: finiteness when the closure of J(ℚ) is small | At closure dimension g the local closure intersection can be infinite; the strict dimension inequality is essential. | Retained. |
| §4.13 Coleman's effective Chabauty bound at a prime of good reduction | At genus two,p=7 and eight residue points the bound is 10; the small-prime examples need disc analysis instead. | Retained p>2g hypothesis. |
| §4.14 Chabauty–Coleman at a prime of bad reduction via the minimal regular model | A smooth model recovers the good-reduction case; a bad model at p=2 cannot use the large-prime bound. | Retained multiplicity-one smooth loci. |
| §4.15 Integral differentials and residue-disc parameters for good-reduction hyperelliptic models | On C₁(3₂), (x−1)dx/y has a double zero at the Weierstrass point, not an ordinary simple zero. | Retained parameter and infinity cases. |
| §4.16 Residue-disc verdicts: certified zero counts accounting for every zero | A disc with two rational zeros plus an irrational zero consumes three zeros, not two. | Retained disjoint rational/irrational witnesses. |
| §4.17 Chabauty–Coleman certificate | Rank zero allows all regular differentials to annihilate; a certificate must still cover every residue disc. | Retained coverage and finite-index conditions. |
| §4.18 A valid Chabauty–Coleman certificate determines X(ℚ) | If each disc's full zero bound is met by listed rational points, their union is complete; surplus roots require decisions. | Retained. |
| §4.19 Siksek's criterion: Chabauty in a single unit ball over a number field | For K=Q the rank-one matrix criterion reduces to nonvanishing of an annihilating differential modulo p. | Retained all embeddings and odd-prime conditions. |
| §4.20 Symmetric-square Chabauty datum: X⁽²⁾, its Abel–Jacobi map and reduced vanishing differentials | The diagonal divisor 2P remains in X^(2); its second coefficient uses 1/2 and therefore the odd-prime hypothesis. | Retained multisets and normalization. |
| §4.21 Symmetric Chabauty: a rational point of X⁽²⁾ alone in its residue class | With fewer than two independent rows the rank-two matrix criterion gives no uniqueness conclusion. | Retained full-rank test. |
| §4.22 Relative symmetric Chabauty (Siksek, Box) and the good-residue-class criterion | Pullback families can be infinite; relative Chabauty separates them from isolated exceptional divisors. | Retained two outcome branches. |
| §4.23 Chabauty–Coleman certificate for the 5-cycle curve C₀(5) at p = 3 | The C₀(5) residue counts 1+1+2+2 give six rational points. | Retained exact list and completeness. |
| §4.24 Chabauty–Coleman certificate for Poonen's curve C₁(3₂) at p = 3 | The counts total nine zeros; the irrational W removes one, leaving eight rational points under the rank hypothesis. | Retained conditional label and irrational accounting. |
| §4.25 Conditional Chabauty–Coleman certificate for Stoll's curve X₀^dyn(6) at p = 5 | Ten points lie in nine classes, with one count-two class; the rank-three input stays explicit. | Retained. |
| §4.26 Strassmann's theorem: zeros of a restricted power series on the closed unit disc | For x−x² the last dominant index is 2; for 1+px it is 0 and the root −1/p is outside the unit disc. | Retained nonzero series and last index. |

### Layer 5

| Target and associated API | Instance or failed alternative | Result |
| --- | --- | --- |
| §5.1 Admissible quotient classes | With no tests every quotient class survives; one empty local set leaves no class. | Retained existential image convention. |
| §5.2 Global elements survive | Any globally compatible element survives all necessary local tests, including the empty family. | Retained one-way implication. |
| §5.3 An empty sieve obstructs global compatibility | Two contradictory local sets on Z/2 can have a nonempty coarse sieve; nonemptiness does not prove existence. | Retained obstruction direction. |
| §5.4 Projection of surviving classes | Fine survivors project into coarse survivors; equality need not hold. | Retained inclusion direction. |
| §5.5 Finite coset lifting and filtering | An empty input stays empty; with K=L the operation is intersection with the admissible classes. | Retained finite sections and complete lifts. |
| §5.6 Correctness of a full lifting step | A length-zero chain is its direct sieve; missing lifts can destroy completeness. | Retained checked sections. |
| §5.7 Correctness with only changed tests | No new tests is valid only if every selected image subgroup is unchanged. | Retained changed-test hypothesis. |
| §5.8 A subgroup covers a coprime sieve quotient | 2Z covers Z/3, but 2Z does not cover Z/2; coprimality cannot be dropped. | Retained finite-index hypothesis. |
| §5.9 Applying the obstruction to commuting maps | Local overapproximations preserve all points; arbitrary point types are allowed when the diagram commutes. | Retained actual commuting maps. |
| §5.10 Completeness from unique residue fibres | A singleton quotient proves completeness only with uniqueness in that fibre. | Retained injectivity requirement. |
| §5.11 Reduction data for a curve and its Jacobian | For local images {1,2} in Z/5, both classes survive; a local superset is allowed, a subset is not. | Retained point/Jacobian square. |
| §5.12 Rational points survive the Mordell–Weil sieve | An elliptic curve mapped to its Jacobian gives full local images and no obstruction. | Retained no-converse warning. |
| §5.13 Local sieve data from finite quotients of J(ℚ_p) | Quotient by the whole group gives one class for nonempty Y and no classes for empty Y. | Retained exact image definition. |
| §5.14 Computing the sieve on a subgroup of index prime to N | 3Z/6Z maps onto Z/2, while 2Z/4Z maps to zero; prime-to-index matters. | Retained intersection identity. |
| §5.15 The sieve along a descending chain of subgroups | With no places every class survives; omitting a changed Z/4 test gives a wrong endpoint. | Retained chain and changed-test data. |
| §5.16 Correctness of the iterated sieve | Prepared groups use preimages of N_kG_i; preimages of zero can shrink too far. | Retained corrected preparation. |
| §5.17 A finite-index subgroup from a membership test (GetSubgroup) | For Γ=Z and K=4Z the output generator is 4; K=Γ preserves the original list. | Retained finite quotient/membership contract. |
| §5.18 Each coset of NΓ has at most one point of small height | In Z, N=3,H′=2,m=1 isolates a small point per coset; unannihilated torsion gives a counterexample. | Retained torsion exponent requirement. |
| §5.19 All points of bounded height from the sieve | An empty sieve excludes bounded-height points; uniqueness also needs N²>4H′/m and torsion annihilation. | Retained. |
| §5.20 Recognising points of a genus-two curve by reduction | An integer divisible by 210 with absolute value≤30 is zero; the printed coefficient bound misses a factor of 3. | Retained corrected absolute-value estimate. |
| §5.21 Refining the subgroup represented by known points (Siksek's step) | For 2Z mapping to Z/4, the excluded coset 2 refines membership to 4Z. | Retained shifted local tests. |
| §5.22 Integral points on hyperelliptic curves from a sieve lower bound | The toy lower bound (10−2)²=64 exceeds 30; uncrossed height bounds yield no conclusion. | Retained strict crossing criterion. |
| §5.23 Combination of Chabauty–Coleman with the Mordell–Weil sieve | A coarse subgroup outside the kernel of the chosen reduction can identify different residue classes and lose uniqueness. | Retained kernel containment. |
| §5.24 The relative symmetric Mordell–Weil sieve | The relative symmetric sieve needs actual finite images and lattice data; a proposed point list is not that transcript. | Retained explicitly conditional applications. |
| §5.25 Reduction at bad primes for genus-two curves | For a square special-fibre polynomial the group has three components; the nonsquare exact sequence is not reused. | Retained bad-reduction case split. |
| §5.26 Deep information for genus-two curves | Deep local conditions are necessary; passing them does not prove a p-adic point on the curve. | Retained one-sided filter. |
| §5.27 Mordell–Weil sieve certificate | With zero steps the candidates are the initial finite sieve, e.g. {1} for the identity Z/4 test. | Retained raw replay boundaries. |
| §5.28 Soundness of a Mordell–Weil sieve certificate | An empty checked candidate set proves nonexistence; a nonempty one needs matching and uniqueness. | Retained soundness direction. |
| §5.29 Non-existence of points on the undecided small genus-two curves | The sieve cases split 521+772+152+2=1447; BSD-dependent rank inputs stay conditional. | Retained catalogue scope. |

### Layer 6

| Target and associated API | Instance or failed alternative | Result |
| --- | --- | --- |
| §6.1 Certified solution sets with completeness labels | For x²=4 the list {2} is incomplete under True but permitted conditionally under False. | Retained unconditional soundness and explicit H. |
| §6.2 Comparison of p-adic candidates with global solutions | One ball containing 0 and p^n matched by 0 is insufficient without uniqueness. | Retained subsingleton hypothesis. |
| §6.3 Residue-disc certificate for quadratic Chabauty functions | s−1 has a singleton centre; 1 has none; s(s−17^6) cannot be isolated at precision 5 by one centre. | Retained cover plus uniqueness. |
| §6.4 Soundness of a quadratic Chabauty certificate | Omitting the P₀ disc leaves only a lower inclusion for X_s(13); rank and height inputs cannot fill the missing disc. | Retained full coverage. |
| §6.5 The explicit set-up: affine chart, basis of differentials and Tate class | Z₁'s relevant trace is 10+1−11=0; the zero matrix satisfies linear equations but fails the nonzero class condition. | Retained geometric and matrix distinction. |
| §6.6 The connection of A_Z on the affine chart and the uniqueness of η | The connection uses ΩᵀZ dΩ, not dΩᵀZΩ; swapping them changes the residue prescription. | Retained corrected differential order. |
| §6.7 Gauge transformations at the points at infinity | At Ω=0,c=0 the gauge matrix is identity; the inverse has negative Ω and c in its lower blocks. | Retained block signs. |
| §6.8 Explicit Hodge filtration of A_Z (BDMTV Theorem 4.11) | For Z=0 the filtration splits with η,β,γ all zero; nonzero X_s(13) classes have the listed nonzero data. | Retained normalization at the base point. |
| §6.9 Algorithm for the Hodge filtration data (η, b_Fil, γ_Fil) | For Z₁ the β entries include 1/2 and γ=5y/6+3x/2; identically zero data fail. | Retained exact coefficient checks. |
| §6.10 Left and right multiplication matrices and parallel transport | With symplectic basis vectors u,v, uv has central term +1 and vu has −1. | Retained left/right multiplication convention. |
| §6.11 The Frobenius structure of A_Z on a chart (BDMTV (45)) | At Z=0 the Frobenius block matrix has middle F and bottom-right p; zeroing those blocks gives the wrong comparison. | Retained connection compatibility. |
| §6.12 The Frobenius-equivariant splitting at Teichmüller and general points | At a common Teichmüller point h=0; reversed transport endpoints negate the desired abelian-log increment. | Retained corrected transport order and inverses. |
| §6.13 The local height at p of A_Z(b, x) (BDMTV Lemma 5.5) | At x=b the local height is zero; all splitting terms must use the specified projection and base-point normalization. | Retained. |
| §6.14 Changing the base point (BDMTV Lemma 5.7) | Setting b′=b reduces to the same-base formula; reversing the path changes the correction terms. | Retained base-point directions. |
| §6.15 Valuation bounds for the coefficients of quadratic Chabauty power series | At p=17,n<17 there is no logarithmic loss; at n=17 the loss is 2; slope −1 does not exclude valuation-1 roots. | Retained strict slope exclusion. |
| §6.16 Provable determination of roots in a residue disc | X² has multiplicity two; X²−p³ can have no Q_p root but two geometric roots; a constant unit has none. | Fixed geometric root budget and adapter. |
| §6.17 Quadratic Chabauty for modular curves: algorithm with termination and failure conditions | No covered patches and an empty candidate list assert nothing globally; failure remains a labelled output. | Retained termination/failure conditions. |
| §6.18 Plane quartic model of X_s(13), its seven known points and the residue discs at 17 | Twenty F_17 points give Frobenius trace 18−20=−2; seven rational points require later completeness. | Retained exact model and trace check. |
| §6.19 The endomorphism algebra and Picard number of J_s(13) | The coefficient-field cubic has no F_17 root; r=g=ρ=3 satisfies 3<3+3−1. | Retained real multiplication and Picard hypotheses. |
| §6.20 Certified analytic rank one for the conjugates of f | All three derivative intervals have positive lower endpoint>0.6; a zero-containing interval would not certify rank one. | Retained analytic nonvanishing data. |
| §6.21 The Mordell–Weil rank of J_s(13) (BDMTV Proposition 6.2) | Rank over the coefficient/CM field alone is insufficient; the precise rank-over-Q implication or alternative GRH descent stays explicit. | Retained conditional routes. |
| §6.22 The Tate classes Z1, Z2 from the Hecke operators T_7 and T_11 | 6A−tr(A)I has trace zero in dimension six; using a scalar without the factor six fails. | Retained Tate matrix checks. |
| §6.23 First chart of X_s(13): differentials and Hodge filtration data | The affine quartic vanishes in its quotient, while γ₁ is nonzero there. | Retained actual coordinate-ring carrier. |
| §6.24 First chart of X_s(13): Frobenius lift and the functions θ_{Z_i} | Q_y(P₂)=−16 is a 17-adic unit; Q_y(P₀)=0 excludes P₀ from the first chart. | Retained chart domain. |
| §6.25 Equivariant heights and the matrices T_1, T_2 for X_s(13) | Repeated determinant rows vanish at the specified points; P₅ replaces the erroneous earlier-version P₄. | Retained published base-point set. |
| §6.26 Rational points of X_s(13) on the first chart ]U_1[ | Every first-chart candidate must match a known point or be excluded using the second class. | Retained finite zero-table hypothesis. |
| §6.27 Rational points of X_s(13) on the second chart ]U_2[ | The two listed infinity points lie in the second chart, but P₀ lies in neither chart. | Retained missing-disc distinction. |
| §6.28 The residue disc of P0 = (1 : 1 : 1) | P₀ is matched and the rest of its disc excluded; a matching alone cannot rule out a second zero. | Retained separate disc certificate. |
| §6.29 The rational points of X_s(13) (BDMTV Theorem 1.1) | Seven verified points are only a lower bound until all chart and exceptional-disc certificates are supplied. | Fixed CM input dependency cycle. |
| §6.30 Existence of non-CM split-Cartan images for ℓ = 2, 3, 5, 7 | A rational j with a negative q-adic valuation is not CM under integrality; the Cartan moduli criterion still needs its own hypothesis. | Fixed upward CM citation. |
| §6.31 The split Cartan case of Serre's uniformity question (BDMTV Theorem 1.2) | The exact exceptional prime set {2,3,5,7} needs both existence and nonexistence directions. | Retained separate Bilu–Parent–Rebolledo input. |
| §6.32 The rational points of X_ns(13) (BDMTV Corollary 1.3) | The six split and seven inert discriminants at 13 are disjoint; Baran transports cardinality, not the j-map. | Fixed shared independent CM assumptions. |
| §6.33 Class number one from X_ns(13) (BDMTV Remark 1.4) | For fundamental \|D\|>52, small prime norms force 13 inert; only −67 and −163 survive the supplied seven fibres. | Fixed acyclic shared CM contract. |
| §6.34 The rational points of the exceptional curve X_S4(13) (BDMTV 2021 Theorem 1.1) | Four model points pass exact substitution; completeness still consumes the QC transcript and rank inputs. | Retained conditional application. |
| §6.35 Rational points on the genus-three curves X_0^+(N), N prime (BDMTV 2021 Theorem 5.6) | The nine lists have sizes 10,9,8,8,7,7,8,6,5; substitution alone proves no completeness or descended j-map. | Retained explicit modular quotient interpretation. |
| §6.36 Two quartic Thue equations solved by Tzanakis–de Weger | The quartic takes value 1 at (1,3) and (3,−1); exact values and the two equation lists remain separate. | Retained finite-certificate hypothesis. |
| §6.37 Integral points on y² = x³ − 4x + 1 (Tzanakis–de Weger Theorem A) | 1274³−4·1274+1=45473²; torsion or a large verified point alone cannot prove the integral list complete. | Retained finite reduction transcript. |
| §6.38 The S-unit equation x + y = z for S = {2, 3, 5, 7, 11, 13} (de Weger Theorem 6.3) | 91+1771470=11^6; 545 bounded-search hits are a list check, not the source of the completeness bound. | Retained coprime normalization and finite certificate. |
| §6.39 The Thue–Mahler equation x³ − 23x²y + 5xy² + 24y³ = ±2^a3^b5^c7^d (Tzanakis–de Weger 1992) | F(48632,−3729)=2^18·5^13 and F(0,−1)=−24; sign and the corrected 1993 constants both matter. | Retained corrected conditional application. |

### Standing conventions and generality

| Convention or domain | Witness / failure tested | Result |
| --- | --- | --- |
| Closed enclosures, coordinates and absolute precision | Width 1/100 meets precision 6 but not 7; I uses real coordinate 0 and imaginary coordinate 1; overlap of √2 and √3 boxes is not equality. | Retained, with coordinate-order checks added. |
| Branch of complex argument | Arg(I)=π/2, the separately fixed logarithm of −1 is iπ, and a box crossing the negative real cut is rejected. | Retained; no global continuous branch is claimed. |
| Zero valuation | `padicValRat p 0=0` differs from ord(0)=∞. Exact zero must succeed at every requested congruence depth. | Fixed §2.7; other divisions already test nonzero. |
| Ramified finite extensions | For e=2, multiplication by p gains two uniformizer digits, not one. Q_p-centred certificates do not represent a general completion or its chart. | Retained general local-ball interface; fixed §0.8 terminology. |
| Characteristic and DVR scope | Characteristic-p k[[π]] is not a finite extension of Q_p; the analytic logarithm/height statements do not claim it. At p=2 odd-prime isogeny or symmetric-square formulas cannot be applied unchanged. | Retained characteristic-zero and odd-prime hypotheses where used. |
| Height scale | A width 1/8 in naive height contributes 1/16 before the 4^n denominator. A torsion point and O have canonical height zero. The pairing of P with itself is ĥ(P). | Retained pinned half-x-height convention and relative/absolute degree conversion. |
| Lattice coordinates and signs | Columns (1,3),(0,7) have determinant 7; weighted b plus target (0,−1) gives the correct mod-3 equation. | Retained. |
| Divisor multiplicities | 2P belongs to the symmetric square and is not collapsed to P. The diagonal second column has coefficient 1/2. | Retained odd-prime normalization. |
| Matrix left/right and transport signs | Symplectic u,v give central terms +1 and −1 in opposite orders; a reversed integration path changes sign. | Retained explicit witnesses and corrected inherited formulas. |
| Trivial group, zero module and rank zero | Empty sieve tests keep every quotient class; zero-rank height searches use torsion fibres; zero-dimensional abelian logarithm is zero. | Retained separate degenerate branches. |
| Denominators and canonical maps | Nonzero derivative/pivot, positive log argument, nonzero linear form, positive definite Gram matrix and inverses of F−1/F−p are explicit conditions. The Q_p residue map has a fixed smooth model; no arbitrary-field map is silently canonical. | Retained; no new denominator gap found. |
| Conditional completeness | With H=False, {2} can be sound for x²=4 without being complete. Empty QC patch coverage has no global conclusion. | Retained labels; finite arithmetic transcripts remain separate from semantic proof records. |

## Suggested Lean signature and definition audit

All twenty theorem signatures were read against the corresponding prose, including their finite-set/set distinctions. The following checks record more than the required ten signatures.

| Signature | README comparison and adversarial check |
| --- | --- |
| `ED0.exists_isolating_box` | §0.3: nonzero polynomial, selected complex root and positive rational ε. Repeated roots are a single selected value; ε=0 is not promised. |
| `ED0.padic_nonzero_of_error_lt` | §§0.7–0.8: strict error<nonzero centre norm; equality is insufficient. |
| `ED0.padic_ball_add` | §0.9: Q_p specialization gives min(N,M), including negative precision integers. |
| `ED0.padic_ball_mul` | §0.9: independent bounds on x and d yield max(A·s,B·r) through x(y−d)+d(x−c). No missing cross term. |
| `ED0.padic_ball_inv` | §0.9: nonzero centre and strict relative error imply equal norms; inverse error divides by norm squared. |
| `ED0.padic_quotient_error` | §0.9: a certified nonzero pivot and norm(x)≤norm(y) give error r/norm(d). The strict denominator check is present. |
| `ED0.exists_padic_ball` | §§0.1 and 0.9: density over Q_p with integer absolute precision. It is not the general finite-extension chart construction. |
| `ED1.linear_form_excluded` | §1.11 representative numerical implication: C>0, nonnegative box/error, rounded-coordinate error and strictly larger squared distance. n=0 makes the distance premises inconsistent rather than producing a false nonzero form. |
| `realLogPartialSum_error` | §2.1: x>0 makes x+1 and 1−r² nonzero; N=0 is allowed. x=1 gives zero on both sides. |
| `arctanPartialSum_error` | §2.1: abs(t)≤1 includes both endpoints; the denominator 2N+1 never vanishes. |
| `exists_scalar_log_precision` | §2.1: positive ε and strict geometric ratio; at x=1 every partial sum is exact. |
| `padicLog_tail_precision` | §2.6: d>1/(p−1), explicit distance and HasSum identify the existing logarithm; HasSum does not assert the tail bound. The scalar statement is intentionally Q_p. |
| `exists_padic_log_truncation` | §2.6: strict positivity of the tail slope permits every integer target precision; equality at the threshold is excluded. |
| `ED2.sUnit_finite_search` | §2.33 representative endpoint: hbound bounds every solution, independently of an answer list. Positivity and u+v=w put all three coordinates in range(B+1); B=0 yields no solutions. |
| `ED3.canonicalHeight_mem_doubling_interval` | §3.13: naiveHeight/2 and division by 4^n match the pin. The supplied local interval/error bounds concern [2^n]P, not the desired conclusion for P. |
| `ED4.strassmann_card_le` | §4.26: nonzero dominant coefficient, last maximum and coefficients tending to zero. Finite Q_p roots are distinct; this is not §6.16's geometric multiplicity input. |
| `ED5.sieve_empty` | §5.3: necessary local conditions plus an empty compatible set imply an empty global image; no converse is asserted. |
| `ED5.sieve_weaken` | §5.9: T⊆U induces the same inclusion on all local preimages. |
| `ED6.CertifiedSolutionSet.coe_eq_setOf` | §6.1: equality requires hH; soundness is unconditional. |
| `ED6.candidates_eq_known` | §6.2: R⊆Z, L⊆R, full cover, uniqueness and matched-or-excluded decisions give both inclusions. No finiteness hypothesis on R is needed for this set identity. |

The light definitions are `realIntervalContains`, `complexBoxContains`, `padicBallContains`, `realLogPartialSum`, `arctanPartialSum`, `padicLogPartialSum`, `supportedOn`, `coprimeSUnitTriple` and the `CertifiedSolutionSet` structure. Their README Checks separately exercise exact/empty/zero or singleton cases, positive examples and negative controls. All thirty Lean examples were checked mathematically, including the height-width identity 81/(16·4^n), the totalized zero valuation and the repeated-root multiset. They elaborate with sorry; they are not proved unit tests.

The remaining definitions are deliberately README constructions, named in the closing inventory by object or explicit family, including raw/semantic transcript types, local-ball records, local solubility, isogenies, heights, sieve records, geometric chart data and QC coefficient/root-cluster records. No field that assumes a complete answer list is sold as a decidable raw checker. Existing-carrier predicates were not replaced by arbitrary opaque propositions.

## Validation and remaining work

Validation performed: full-file `lean-check` (final exit 0, 50 sorry warnings only); the packet checker (exit 0, zero errors, one unchanged naming warning); target/API/Checks and internal graph audit (178 targets, 507 API entries, no missing names or cycles); JSON parsing, metadata shape, whitespace and intake-file validation. No packet or upstream file was modified.

No unresolved package acceptance defect remains. Formalization is still future work: all twenty theorem proofs and thirty examples contain sorry, heavy constructions have not been implemented, and the application transcripts have not been numerically replayed. In particular this review does not certify the actual BDMTV Frobenius/height tables, complete Thue–Mahler or S-unit enumeration, BSD-dependent small-curve catalogue, or class/unit/Hecke/L-value algorithms. The roadmap states the exact inputs and comparison theorems those applications require and preserves every conditional rank/analytic/CM hypothesis. These are deliberate conditional targets, not a claim to have closed the packet's historical formalization gaps.
