# FIX-PKG-RankZeroOneBSD~adv2

Issue: #10743. Worker: Codex, session codex-rYSlOr. Date: 2026-10-19.
Base: b0edc8817. This changes only this job's four deliverables.

## Disposition and unavailable input

**needs_changes.** The issue's explicit repair directives have been applied and the
package has been audited again. The named input
`research/blueprint/reviews/REV-PKG-RankZeroOneBSD~adv.md` is absent. The only
matching available report is `REV-PKG-RankZeroOneBSD.md`, the 2026-10-13 independent
review. Searches of the checkout, all locally available git history, and GitHub's
commit history for the named path found no adversarial report. The issue's
comments contain the claim exchange, without a findings attachment. Consequently
this report cannot certify a disposition for unseen finding numbers.

There is also mathematical residue: the stronger ramified comparison required by
§10.8 has been exposed, rather than proved by the inapplicable coprime comparison.
The named contract records exactly what must be established. A new name does not
close that proof. The existing source/integrality gaps listed below likewise
remain proof obligations; none is claimed as formalized mathematics. The
maintainer must supply the missing review and assign/close the unresolved
interfaces before changing this verdict to accepted.

## Finding → change

| Finding or explicit issue directive | Change |
|---|---|
| Dropped ComputationalNumberTheory CN.4 | Removed supplier and all dependencies. Replaced old Layer 14's concrete constructions, Mellin computation and descent/saturation targets by conditional applications. Concrete model, modular-form, interval, period, torsion, Tamagawa, saturated-regulator and whole-Sha data are explicit hypotheses. Deleted the concrete 32a2 Lean fixture and its point-order/discriminant targets. |
| Three supplier packages are under revision | Re-read their current package text. Replaced numeric references to GeneralizedHeegnerCycles, GrossZagierAndArithmeticHeights and KatoEulerSystems by current target names. Named stronger requested interfaces separately; did not attribute the stronger claim to a weaker existing target. |
| Mathematical normalization and degenerate-case pass | Added the convention-witness table and Lean scalar/algebra examples. The target table below records all 140 retained subsections. Zero, negative and missing-prime rational controls remain explicit. |
| Rational component order substituted for geometric monodromy | Fixed §4.1 and its downstream explanation. A nonsplit geometric I₅ group has five geometric components but one Frobenius-fixed component. Restricted the cited Pollack–Weston theorem to squarefree level; registered nonsquarefreeMonodromyComparison separately. Corrected exact v1 page locators. |
| Coprime quadratic comparison used in ramified multiplicative application | §2.10 explicitly requires imaginary K and appropriate whole-Sha finiteness. §10.8 no longer invokes it at ramified q or invokes Skinner C with an additive twist at q. Added castellaRamifiedAuxiliaryComparison; its proof remains residue, not an established export. |
| Good-supersingular auxiliary twists overextended beyond BSTW | Restricted §10.6–§10.7's auxiliary-twist route to good ordinary p. Kept the supersingular theorem via the direct §10.4 BSTW endpoint in §10.9. Named the distinct supersingular Gross–Zagier input. |
| Wrong Heegner supplier for upper bound | Named jswShimuraCurveIntegralBound with JSW Theorem 4.4.1's actual hypotheses and defect terms; removed the dyadic-conjugation dependency from the odd-prime argument. |
| Full index confused with saturated rational generator | Strengthened §7.2's generator example with the actual saturation and torsion assumptions. Retained free/full index distinction: free index 2 and torsion 5 give full index 10 but height factor 4. |
| Rank-zero signed Selmer group identified with Sha without hypotheses | §9.5 now explicitly uses finite E(ℚ) and supersingular residual inertia to exclude rational p-torsion. |
| Duplicate pinned-library restriction/conjugation definitions | Cite existing Point.map and fixed-point descent. Remove the Lean conjugation wrapper and proposed restriction alias. Keep trace, twist descent and two-times decomposition as the new content. |
| Catalogue/process form | Removed repetitive declaration-catalogue boilerplate, retaining target hypotheses, source locators, Checks, layer examples and dependencies. Use the required build/consumer headings. The heavy carriers stay in README and the Lean closing comment. |
| Fixture normalization | In §14.6 the supplied full-period quotients are 1/25, 1, 1/8. With torsion 5,1,4 and Tamagawa product 1,1,2, each defect is 1. The incorrect 32a2 quotient 1/2 gives 4 and is only a negative control. |
| Missing-prime regression overstated | §14.7 explains that omission obstructs that certificate assembly only if no independent proof supplies the valuation. Exact d=1 already recovers every valuation. Rational 2 and 1/4 are not asserted to be defects of actual elliptic curves. |

## Ownership and remaining mathematical work

These are contracts in the permitted package files, with maintainer routing notes
here because this job cannot edit other packets or current upstream roadmaps.
The old independent review already retained source gaps; this repair does not
turn them into theorems by renaming them.

| Requested interface | Existing owner/target and precise additional work |
|---|---|
| correctedHigherWeightInput | GeneralizedHeegnerCycles, **Higher-weight input comparison for the corrected multiplicative BSD proof**: retain nonsplit-tame and admissible-weight adapters, actual lattice, unit leading-class comparison and corrected local conditions. |
| complexPeriodLatticeComparison | GrossZagierAndArithmeticHeights, **Full real period, identity-component period and c∞**, **Quadratic-twist real-period comparison**: actual homology integration lattice and covolume dictionary; generic lattice theory is already available. |
| integralParametrizationComparison | Same owner, **Integral Manin constant and p-unit range**, **Manin isogeny and twist transfer**, **Modular period-degree comparison**: exact integral Shimura degree and multiplicative-p period transfer, retaining freeness/local hypotheses. |
| waldspurgerNonnegativity | Same owner, **Waldspurger period formula**: unitary PGL₂ and quadratic-character specialization with positivity normalization. |
| multiplicativeBDPComparison | Same owner, **The weight-two formula at a multiplicative prime**, **Compatibility with isogenies, differentials and characters**: additive-away-from-p range of corrected A′. |
| supersingularGrossZagierComparison | Same owner: separate Kobayashi signed formula used by BSTW; ordinary or multiplicative BDP does not supply it. |
| allPrimeRankZeroSelmer | KatoEulerSystems, **Elliptic points in the cyclotomic tower**, **All-prime rational and lattice module structure**: all coefficient primes, CM branch and exact Bloch–Kato/elliptic Selmer comparison. |
| finiteLevelIntegralUpperBound | KatoEulerSystems, **Rank-zero upper bound for the elliptic p-part**: source-qualified irreducible residual good/supersingular/multiplicative finite-level bound beyond current surjectivity/unit range. |
| ordinaryBSTWComparison | KatoEulerSystems, **The cohomological upper bound**: ordinary two-variable class, laws and main-conjecture comparison, without circular dependency on this package's completed Layer 9. |
| wuthrichIntegralComparison | KatoEulerSystems, **Elliptic ordinary and multiplicative divisibility**: distinguished étale lattice and genuinely integral reducible-prime containment; existing rational containment does not suffice. |
| jswShimuraCurveIntegralBound | HeegnerPointEulerSystems: JSW Theorem 4.4.1, with all local residual hypotheses and defects, not HE.7's dyadic conjugation comparison. |
| nonsquarefreeMonodromyComparison | This package's §4.1 extension using Néron character-group and GL₂ suppliers: prove actual localized freeness/monodromy before exporting nonsquarefree variants. |
| castellaRamifiedAuxiliaryComparison | This package's §10.8 proof obligation: actual differential, local norm, torsion and Sha maps at D_K N; independently establish the auxiliary valuation or sufficient one-sided comparison in the ramified setting. Coprime §2.10 is insufficient. |
| ellipticUnitCharacterComparison | **Owner not yet assigned.** The general elliptic-unit character main-conjecture/integral augmentation interface needed by §11.6 requires maintainer routing; current ClassFieldTheory is not silently expanded. |
| Higher-weight integral Kolyvagin and KY transfer | §9.3 retains actual generalized classes and the augmentation prime; §11.33 retains KY's Λ versus Λ^ac discrepancy; §11.35 retains the actual KY/Wüthrich lattice transfer. None is inferred from rational equality. |

Current-library and current-upstream object searches covered quadratic twists and
point descent, L-functions/continuation, canonical heights/regulators, rational
valuations/support and lattice index/covolume. Checked pinned Mathlib 082e2d37e8,
pinned Tau Ceti f790474 and current Tau Ceti a91d3aaf, together with current
EllipticCurves, ClassFieldTheory and IntegralLattices roadmap ownership. Generic
lattice carriers, index theory and covolumes are reused, not re-planned. No new
connected-reductive or arbitrary-Shimura theorem is asserted by these
elliptic-curve source results. Higher-weight statements already retain their
source-supported rank-two ordinary generality. Signed versus ordinary and
integral versus rationalized ranges remain separate.

## Statement pass table

This is a statement/hypothesis consistency audit, not a claim of formal proofs
for roadmap targets. Each row covers the displayed statement, its API and its
Checks; target titles and full hypotheses are in the numbered README subsection.
The result column identifies fixes and retained restrictions. Named missing
interfaces remain missing mathematics as recorded above.

Across all rows: elliptic curves are nonsingular, not trivial groups or zero
abelian varieties. Rational arithmetic rows permit zero only where expressly
stated. Rank-zero determinants and empty products are 1. Iwasawa coefficient
rings are the actual complete DVR/power-series rings, not fields; rationalizing
loses coefficient-prime information. Uniformizer length one has cardinality
p^f, not p without residue-degree-one hypotheses. Odd-prime results exclude 2;
characteristic-zero representations do not become characteristic-p statements
by substitution. Finite fields have q≥2; F₂ is explicitly tested. No conclusion
here is obtained by replacing a discrete full lattice with a noncompact/nonfull
subgroup, or dropping a finite-order/finite-cardinality hypothesis.

| Statement | Instances tried | Result / change |
|---|---|---|
| 0.1 | constant/linear Taylor terms; N=1; Fricke ±1 | Keep nonzero analytic continuation and w=-Fricke; no conductor-one curve invented. |
| 0.2 | orders 0,1,2; zero analytic function | Keep finite-order hypothesis and derivative divided by r!; order-two witness separates conventions. |
| 0.3 | split primes, inert primes, ramified primes; D=-3,-4 | Keep quadratic field/fundamental discriminant; conductor and zero character values retained. |
| 0.4 | F₂ ordinary curve and its Artin–Schreier twist, counts 4 and 2; q=1 | Add explicit characteristic-two witness; exclude one-element field; keep separate odd-characteristic twist. |
| 0.5 | constant even germ, linear odd germ, quadratic even germ | Parity agrees with functional equation; identically zero germ excluded. |
| 0.6 | good, split/nonsplit multiplicative, additive; ramified character | Retain local cases rather than extrapolating the unramified formula. |
| 0.7 | D coprime to N versus D sharing a bad prime | Keep coprimality; ramified additive twist is outside conductor formula. |
| 0.8 | rank pairs (0,0),(1,0),(0,1) | Products have orders 0,1,1; no derivative-product formula without central vanishing. |
| 0.9 | positive/negative squarefree twist; residues modulo 8 | Keep nonzero squarefree parameter and local dyadic sign data. |
| 0.10 | coprime versus shared bad prime; signs ±1 | Keep actual conductor/discriminant restrictions on character evaluation. |
| 0.11 | two constant terms; linear times constant; two linear terms | Rank and sign add; leading terms multiply with factorial normalization. |
| 1.1 | rank zero; zero central value; full versus identity period | Rationality includes zero; positivity is a later theorem; full-period factor retained. |
| 2.1 | identity point; rational point; twisted point; nonzero two-torsion | Reuse Point.map and fixed-point descent; retain only trace/twist constructions and 2P decomposition. |
| 2.2 | trivial extension; quadratic extension; finite versus infinite Sha | Restriction kernel controlled by finite Galois cohomology; finiteness assumption remains essential. |
| 2.3 | ranks (0,0),(1,0),(0,1); two-torsion | Rational eigenspaces split; integral direct-sum claim is not made. |
| 2.4 | odd-primary torsion; two-torsion with identical ± signs | Only kernel/cokernel killed by two; no integral dyadic eigenspace splitting. |
| 2.5 | covolume 3; rectangular area 6; indices 1,2 | Named complexPeriodLatticeComparison; factor 4 for complex integral and full real period distinguished. |
| 2.6 | rank zero determinant 1; rank one height 3; index two | Regulator changes by degree power and inverse square of gluing index; computed factors 2 and 1/2. |
| 2.7 | p=3; p=2; zero p-primary groups | Odd-prime decomposition retained; dyadic case sent to separate comparison. |
| 2.8 | zero groups; nonzero Z/2; restriction followed by corestriction | Multiplication by two retained; no division by two on integral groups. |
| 2.9 | split/inert/ramified primes; nonsplit I₅ | Retain local formulas and rational versus geometric distinction. |
| 2.10 | imaginary versus real K; rank pairs (1,0),(0,0); finite whole versus p-Sha | Add imaginary K and whole-Sha finiteness for whole-order quotient; coprimality excludes ramified application. |
| 3.1 | empty local set; incompatible local signs; p=2; ramified prime | Admissibility records actual local constraints; no arbitrary prescription guaranteed realizable. |
| 3.2 | root sign ±1; vanishing residue | Keep source's nonzero polar coefficient and parity branch, not a formal arbitrary Dirichlet series. |
| 3.3 | value versus derivative; rank zero versus rank one | Retain distinct BFH branches and prescribed splitting range. |
| 3.4 | split/inert/ramified conditions; forced negative sign | Keep FH value branch and compatibility hypothesis; no nonzero value with forced odd sign. |
| 3.5 | analytic ranks 0 and 1; D=-3,-4 exclusions | Choose complementary twist branch; keep Heegner and local conditions. |
| 3.6 | good ordinary proof fields; ramified multiplicative proof field | Separate field choices; ramified choice cannot enter coprime quadratic comparison. |
| 4.1 | definite parity; nonsplit I₅ at p=5; squarefree/non-squarefree N | Fix geometric monodromy term; restrict cited PW theorem to squarefree N; name stronger extension separately. |
| 5.1 | zero versus nonzero derivative; height zero point | Positive Gross–Zagier factors turn nonzero derivative into nontorsion point. |
| 5.2 | rational rank-one versus twist rank-one; two-torsion | Correct eigensign determined after rationalization; torsion ambiguity retained. |
| 5.3 | analytic order 1 versus 0 or 2 | Rank-one GZ/Kolyvagin theorem only; no full leading-term conclusion. |
| 6.1 | analytic order 0 versus 1; CM/non-CM | Heegner route gives rank and whole-Sha finiteness, not an exact prime part. |
| 6.2 | coefficient primes good, bad, dyadic; CM curve | Named allPrimeRankZeroSelmer extension; current restricted Kato divisibility is insufficient. |
| 6.3 | good ordinary, supersingular, multiplicative; reducible residual representation | Named finiteLevelIntegralUpperBound extension; no main-conjecture equality used to prove a one-sided bound. |
| 6.4 | analytic ranks 0,1,2 | Combine only first two cases; rank-two result is absent. |
| 6.5 | one-sided bound strict/equal; auxiliary twist factors nonunits | Keep comparison of routes separate from equality; inherit explicit Kato extension. |
| 7.1 | nonzero rank-zero value; nonzero rank-one derivative | Nonnegativity plus nonvanishing gives positivity; modular-symbol rationality alone does not. |
| 7.2 | free index 2, torsion 5; multiple m=1,2 | Full index 10 versus free index 2; strengthen rational-generator example by saturation and torsion hypotheses. |
| 7.3 | nonsplit I₅; indefinite parity; nonfree localized Hecke module | Use geometric multiplicity and exact freeness hypotheses, not rational Tamagawa number. |
| 7.4 | generator height 3; free index 2; torsion order 5 | Height factor 4, not 100; pinned half-height and relative degree corrections retained. |
| 7.5 | pinned height 3/2 versus BSD height 3; quadratic relative height 6 | Rational quotient changes by the stated factor two; named height dictionary. |
| 7.6 | u_K=1 versus 2 or 3; torsion; odd prime dividing D | Keep unit, Manin and component terms, and p not dividing D; do not state index conjecture as proved BSD. |
| 7.7 | index a p-unit versus divisible by p; inequality strict | One-sided Kolyvagin bound only; source surjectivity and nonexceptional K retained. |
| 7.8 | rank zero empty regulator; rank one; torsion 1 and 5 | Positive rational actual defect, not arbitrary real data; whole-Sha finiteness precedes definition. |
| 7.9 | identity isogeny; p-isogeny changing torsion and period | Compose existing Cassels/arithmetic and analytic invariance; no new isogeny theory. |
| 7.10 | defect p,1,1/p; rational p-torsion | Valuation signs give upper ≥0 and lower ≤0; exclude rational p-torsion or retain its square. |
| 8.1 | ordinary versus supersingular; zero class; p=2 | Own signed construction only; ordinaryBSTWComparison named as extension; actual cohomology lattice required. |
| 8.2 | two conjugate places; zero/nonzero local image | Two maps with distinct local conditions; do not identify one-variable BDP with two-variable function. |
| 8.3 | zero image; p-power ambiguity; unit characteristic ideal | Nonzero and vanishing hypotheses retained; rationalized statement cannot imply integral equality. |
| 9.1 | rank 0 versus 1; logarithm zero; finite/infinite p-Sha | Rank-one exact control retains full index and all local terms. |
| 9.2 | p=2,3,5; a₃=-3 versus 0; twist supported at supersingular prime | Retain BSTW's signed range; withdrawn Wan result does not extend it. |
| 9.3 | zero Kolyvagin class; weight 2 versus higher even weight; O versus Z_p | Actual generalized class, rank-one hypotheses and integral augmentation bound remain explicit extension obligations. |
| 9.4 | ideals (pT),(T); rational versus integral coefficients | Keep μ/height-one inputs; containment direction tested by divisibility. |
| 9.5 | rank-zero finite E; rational p-torsion; supersingular residual inertia | Make Selmer-to-Sha step use finite E and vanishing p-torsion; anomalous interpolation units not discarded at 2. |
| 9.6 | weight 2; nonsplit tame prime; exceptional H⁰ | Retain corrected erratum local type, weight-admissibility and Selmer hypotheses; named higher-weight adapter. |
| 9.7 | p=3 versus >3; split versus nonsplit q; local p-torsion | Use corrected Theorem 1.1, including all new local exclusions; additive-away-from-p interface is separate. |
| 10.1 | ordinary nonanomalous/anomalous; split multiplicative zero | Cancel matching factors only; split case uses derivative and nonzero L-invariant. |
| 10.2 | rank zero versus one; allowed versus disallowed twist support | Use BSTW endpoint in its actual twist range. |
| 10.3 | N=1; good p versus p dividing N; nonsplit I₅ | Keep N>1, good odd p, irreducibility and geometric residual ramification criterion. |
| 10.4 | p=3,a₃=-3 versus 0; rank zero versus one | Direct supersingular endpoint; name supersingularGrossZagierComparison rather than ordinary BDP. |
| 10.5 | ordinary/multiplicative p; reducible E[p]; ramification prime absent | Keep Skinner's residual ramification condition and exact period/control inputs. |
| 10.6 | good ordinary versus supersingular; inert auxiliary q | Narrow auxiliary-twist lower-bound proof to ordinary; retain exact μ and Shimura comparisons. |
| 10.7 | good ordinary versus supersingular; clean bound versus defect terms | Narrow to ordinary; name jswShimuraCurveIntegralBound, not dyadic conjugation descent. |
| 10.8 | q ramified in K, twist additive at q; p=3; local torsion | Remove invalid coprime/Skinner deduction; named castellaRamifiedAuxiliaryComparison remains an unresolved proof obligation. |
| 10.9 | ordinary and supersingular; p=3 with a₃ condition | Ordinary bounds plus direct BSTW supersingular endpoint; no unsupported auxiliary-twist generalization. |
| 11.1 | characters 1,ω versus neither; p=2; supersingular inertia | Ordinarity holds in both branches; local torsion vanishing only in CGS branch. |
| 11.2 | primitive/imprimitive; local H⁰ nonzero; zero torsion module | Keep finite errors and height-one equivalence rather than equality of actual modules. |
| 11.3 | BDP square root T versus squared T²; unit rescaling | Squared normalization; analytic μ=0 is not an arbitrary cyclotomic assertion. |
| 11.4 | index two; zero class; augmentation prime | Index ideal is squared and nonzero; no equality manufactured by defining a class. |
| 11.5 | character trivial/nontrivial globally and locally; O residue degree two | Retain exceptional local/global terms; O-length one means p^f cardinality. |
| 11.6 | trivial character; T(1+T); nontrivial character | Extra augmentation zero retained; ellipticUnitCharacterComparison has no assigned owner yet. |
| 11.7 | rational versus integral lattice; nonfree cohomology | Named wuthrichIntegralComparison; distinguished isogenous lattice is not KY's lattice by definition. |
| 11.8 | Euler factor 1-γ/2; empty removed set | Inverse norm and positive Frobenius exponent; empty product 1. |
| 11.9 | near-trivial nontrivial α versus α=1; zero system | Uniform error constant retained; no unsupported trivial-character substitution. |
| 11.10 | split versus nonsplit residual extension; characters 1,ω | Chosen actual isogenous lattice, not an arbitrary extension with desired invariants. |
| 11.11 | unit rescaling; distinct CM degree/period choices | Keep actual integral analytic construction and specialization normalization. |
| 11.12 | characters allowed versus CGS-excluded; finite local errors | CGS residual hypotheses not silently removed; algebraic μ/λ calculated with Euler terms. |
| 11.13 | augmentation (T); coefficient prime (p); zero κ | Integral bound includes both primes and a nonzero actual Heegner system. |
| 11.14 | empty Σ; nontrivial H⁰; local characters 1,ω | KY's invariant-free lattice and finite exact errors retained. |
| 11.15 | zero BF; ordinary/Greenberg places; distinct coefficient extensions | Actual two-variable class and two reciprocity maps; no artificial class defined by its images. |
| 11.16 | congruent twists with distinct μ; unit versus nonunit quotient | Integral congruence plus μ control needed; rational equality alone insufficient. |
| 11.17 | approaching characters; α=1; fixed p-power errors | Uniformity independent of approaching character, not vanishing of error exponent. |
| 11.18 | μ=0 with equal λ; one-sided divisibility absent | Equality follows only with proved divisibility; matched invariants alone do not identify power series. |
| 11.19 | empty S; factor 1-γ/2; trivial-character term | Product direction and Euler signs retained on KY's chosen lattice. |
| 11.20 | κ scaled by p^t; fixed p^N; augmentation | Retain both transfer powers; clean primitive bound is not asserted for every lattice. |
| 11.21 | nontrivial crystalline α versus trivial; characteristic-zero irreducibility | Rational BF bound only; no residual irreducibility imposed at an Eisenstein prime. |
| 11.22 | conjugate place; zero class; weight r=1 | PR map uses actual distinguished lattice and normalized projection, with weight-two specialization admissible. |
| 11.23 | opposite place; unit rescaling; weight r=1 | Greenberg map retains its distinct local condition and normalization. |
| 11.24 | corank-zero versus one; ideals (pT),(T) | CGS equality is integral without prototype's extra (Sel) assumption; all CGS local exclusions retained. |
| 11.25 | globally trivial φ=ω,ψ=1; nontrivial case | Keep algebraic +1 in primitive and imprimitive λ relations. |
| 11.26 | rational versus integral containment; pseudo-null errors | Direction-by-direction PT comparison preserves coefficient ring and primitive convention. |
| 11.27 | corank-one versus other coranks; Λ versus Λ[1/p] | Prototype retains (Sel); published rationalized index equality not promoted integrally. |
| 11.28 | free rank one; zero κ; unit torsion characteristic | Actual geometric class and full integral squared ideal retained. |
| 11.29 | globally trivial character; two +1 corrections | Algebraic and character corrections cancel; no CGS local exclusion imported into KY. |
| 11.30 | unit/nonunit augmentation; vanishing specialization | Nonzero specialization and exact finite torsion/control factors retained. |
| 11.31 | local rational p-torsion; chosen versus original lattice | KY equality integral only after source lattice transfer; no general finite-submodule vanishing assumed. |
| 11.32 | positive μ; quotient unit versus p-power; trivial α | Rational BF bound made integral with Wüthrich/congruence; cyclotomic μ need not vanish. |
| 11.33 | Λ versus Λ^ac; p-power discrepancy | Keep source's internal coefficient-ring discrepancy and rational consequence; stronger integral export conditional on comparison. |
| 11.34 | cyclotomic μ positive; Néron period versus canonical period | Integral equality, no μ=0 assertion; actual CGS exclusion retained. |
| 11.35 | KY versus Wüthrich lattice; local 1/ω | Integral transfer is a named proof task, not rational isogeny comparison. |
| 11.36 | rational p-torsion; odd good Eisenstein p; bad p | Use KY's weight-two theorem in its actual good-prime range. |
| 12.1 | free index 2,torsion 5; local torsion absent/present | Use full index; local vanishing needed for p-unit torsion simplification. |
| 12.2 | rational p-torsion; nonsurjective localization; O versus Z_p | Keep localization image and all H⁰ factors; general O-length cardinalities use residue degree. |
| 12.3 | opposite parity/ramification; torsion 5 | Keep Greenberg–Vatsal character conditions and torsion denominator. |
| 12.4 | rank zero; anomalous ordinary factor; c∞=2 | Interpolation and control cancel same factor; c∞ a unit only at odd p. |
| 12.5 | defect valuations 3 and -3; free/full index | Opposite signs; height uses free index, control full index; rank-zero twist is not automatically BSD. |
| 12.6 | rank-one parity versus rank-zero parity | Quadratic twist reverses parity as required; prototype keeps its stricter conditions. |
| 12.7 | characters neither 1 nor ω; rank 0/1/2 | CGS local exclusion and analytic-rank range retained; torsion formula stated before simplification. |
| 12.8 | trivial kernel character; rational five-torsion; p=2 | KY permits rational torsion at odd good primes; no dyadic or bad-prime claim. |
| 13.1 | 0,1,-1,6/35,12/70,inverse | Support uses reduced numerator and denominator; zero support convention explicit. |
| 13.2 | q=0; negative numerator; denominator prime | Keep q≠0 for valuation/divisibility equivalence; sign handled by absolute numerator. |
| 13.3 | torsion 1,5; q=1/25 | Torsion exponent is +2; supplied nonzero factors required. |
| 13.4 | trivial Sha; E rational p-torsion; rank one | Finite descent and exact Kummer terms, not raw Selmer order identified with Sha. |
| 13.5 | rank zero empty basis; rank one index two; unsaturated generator | Regulator scales by square index; certification ties supplied lattice to actual E. |
| 13.6 | good prime c=1; nonsplit multiplicative; dyadic additive | Actual local Néron component certificate, not arbitrary positive integers. |
| 13.7 | identity isogeny; degree p; nonunit differential | Keep kernel/cokernel/differential terms; rational comparison cannot erase local indices. |
| 13.8 | numerator prime 2; denominator prime 5; unit rational | Support membership includes both signs of nonzero valuation. |
| 13.9 | 0,1,-1 | Nonzero hypothesis excludes 0; empty support means ±1, not 1 without positivity. |
| 13.10 | q=0,-1,1,1/4; padded finite prime cover | Certificate does not contain positivity/conclusion; cannot certify 1/4. |
| 13.11 | trivial Sha; finite group without explicit exponent; rank-one descent | Actual annihilator and arithmetic descent data required; finiteness alone not a numerical certificate. |
| 13.12 | q=0 versus nonzero; p=2 versus composite p | Prime and nonzero hypotheses retained for exact support equivalence. |
| 13.13 | q=0,-1,1; all prime valuations zero | Constructor allowed for zero/negative units; positivity remains separate. |
| 13.14 | ordinary allowed prime; dyadic additive prime; missing source hypothesis | Named leading-term theorem for actual E required; no default exceptional-prime equality. |
| 13.15 | q=0,-1,1,2,1/4 | Strict positivity indispensable; all primes includes two. |
| 13.16 | prime inside/outside cover; empty cover; q=0 | Cover controls valuations, not positivity or equality by itself. |
| 13.17 | empty exception set; overlap; omitted 2 | Inside/outside proofs cover every prime; omission blocks construction unless another argument supplies it. |
| 13.18 | irreducible/reducible residual; good/bad; p=2 | Dispatch checks actual theorem hypotheses; no automatic fallback from size of p. |
| 13.19 | empty certificate for 0,-1,1 | Positive certificate reconstructs only 1; negative/zero countermodels retained. |
| 13.20 | B=0 versus nonzero; q=1; real cast | B≠0 required; rational identification and certificate produce real equality. |
| 13.21 | rank zero/one; positive actual defect; arbitrary q | Certificate must be for actual bsdDefect E; no unrelated witness suffices. |
| 13.22 | exception set empty; omitted dyadic prime | Combines only complete inside/outside data; no unconditional individual BSD claim. |
| 13.23 | empty/singleton family; member lacking certificate | Universal conclusion requires actual certificates for every member. |
| 14.1 | p=2,3; test prime equal/different | Prime defect invisible only at distinct primes; genuine rational obstruction. |
| 14.2 | p=2,3; p=1 composite | Prime hypothesis gives p>1; no complete certificate. |
| 14.3 | q=0,-1,1,2,1/4 | Strict positivity; all odd primes leave precisely the dyadic check. |
| 14.4 | three supplied central-value/derivative intervals; endpoint 0 | Conditional analytic data give ranks 0,1,0 and finite whole Sha; no computation targets. |
| 14.5 | supplied rational order-five point; trivial kernel character | KY branch applies, narrower CGS branch fails; all curve/isogeny data are hypotheses. |
| 14.6 | quotients 1/25,1,1/8; wrong 32 quotient 1/2 | Correct defects all 1; wrong quotient gives 4; exact data and complete certificate are separate sufficient forms. |
| 14.7 | missing 2; rational defects 2 and 1/4; independent exact equality | No obstruction if another proof gives d=1; countermodels not asserted to occur as actual curve defects. |

## Disposition of the old concrete targets

The old package contained 153 numbered targets. All 133 targets before Layer 14
remain, with the corrections above. Old Layer 14's 20 targets become seven
subsections; this is consolidation and removal of computation ownership, not a
claim that numerical tables prove BSD.

| Old target | Disposition |
|---|---|
| 14.1 away from prime | Retained as new 14.1. |
| 14.2 prime obstruction | Retained as new 14.2. |
| 14.3 dyadic gate | Retained as new 14.3. |
| 14.4 concrete 32a2 model | Removed as a construction target; actual model hypothesis in new 14.4. |
| 14.5 Mellin tails | Removed computation target; intervals are supplied hypotheses in new 14.4. |
| 14.6 five-isogeny/torsion comparison | Actual point and cyclic isogeny supplied in new 14.5; torsion-square arithmetic in 14.6. |
| 14.7 discriminant computation | Removed; supplied conductor/reduction/model data, not a new calculation. |
| 14.8 central-value certificates | Removed construction/replay target; supplied strict analytic intervals in new 14.4. |
| 14.9 affine point domain | Removed concrete construction; existing nonsingular point carrier reused. |
| 14.10 five-torsion range test | New 14.5 conditional on actual order-five point/isogeny. |
| 14.11 periods/heights/regulators | Supplied full-period and saturated-regulator hypotheses in new 14.6. |
| 14.12 rank equality | Combined into new 14.4. |
| 14.13 whole-Sha finiteness | Combined into new 14.4. |
| 14.14 actual 32 point | Removed point-construction target. |
| 14.15 fixed prime BSD | New 14.5, with KY hypotheses checked explicitly. |
| 14.16 32 point order | Removed point-order computation target. |
| 14.17 CM/additive dyadic calculation | Removed classification/calculation target; reduction data supplied, dyadic limitations retained. |
| 14.18 descent/saturation | Removed concrete computation target; whole-Sha cardinality and saturated regulator supplied in new 14.6. |
| 14.19 complete formulas | New 14.6 with exact sufficient inputs; no full formula from rank/finiteness alone. |
| 14.20 missing prime | New 14.7 with independent-proof qualification and rational countermodels. |

## Lean signatures, definitions and examples

The file has one real-bodied rational support definition, one certificate
structure, six target theorems and 36 examples. Its 22 normalization examples use
existing scalar, matrix, ideal, power-series and finite-field carriers; 21 of
these examples have proofs. The derivative-normalization example and the
arithmetic roadmap target examples remain `sorry` signatures. Heavy arithmetic
objects are README targets, not fabricated Lean structures. No data declaration
has a `sorry` body.

| Lean declaration / example | Instances and result |
|---|---|
| QuadraticPoints variables | Actual E/ℚ with IsElliptic, K a field with Algebra ℚ K, quadratic and separable extension instances, and DecidableEq K. Nonquadratic/trivial extension not admitted. |
| two_smul_decomposition | P=0, rational and twisted points; dyadic torsion. States existence of actual Q,R with 2P decomposition, not integral direct sum. |
| Point.map identity example | Zero point fixed by any automorphism; no nontrivial-automorphism hypothesis needed. |
| Point.map rational example | Actual base-changed Q fixed; not arbitrary K-point. |
| Point.map twisted example | Actual twist equivalence and σ≠1; negative eigensign, including two-torsion where signs coincide. |
| primeSupport definition | Reduced numerator and denominator union; 0,±1 have empty support under Mathlib conventions. |
| PrimeValuationCertificate structure | Prime finite cover and zero valuation on cover; no stored positivity or eq_one conclusion. Empty list allowed exactly when support empty. |
| eq_one_iff_all_prime_valuations_zero | q>0; excludes 0,-1; includes denominator primes and 2. |
| PrimeValuationCertificate.eq_one | Actual certificate for same q, plus strict positivity; no unrelated certificate. |
| real_eq_of_certificate | q=A/B, B≠0 and positive q; yields A=B without hidden zero-division inference. |
| support 6/35 | Exactly {2,3,5,7}, including denominator primes. |
| cancellation/zero support | 2·(1/2), 1, -1 and 0 all empty; totalization explicit. |
| reduced representatives | 12/70 and 6/35 have identical support. |
| negative rational support | -6/35 has same four primes, not positive numerator only. |
| inverse support | Inverse of 6/35 retains support; inverse of zero has empty support. |
| unit certificate | q=1 has certificate with empty prime list. |
| denominator obstruction | q=1/4 has no complete certificate. |
| eq_one_iff_two_valuation_zero | q>0 and all odd-prime zeros; 2 and 1/4 fail precisely at two. |
| prime_defect_obstruction | p=2,3; distinct-prime zeros coexist with no complete certificate; p=1 excluded by primality. |
| zero negative control | All valuations zero and empty certificate, but 0≠1. |
| negative-unit control | All valuations zero and certificate, but -1≠1. |
| numerator dyadic control | 2 passes odd primes, has v₂=1 and no certificate. |
| denominator dyadic control | 1/4 passes odd primes, has v₂=-2. |
| functional-equation scalar witness | Constant/linear terms of 1±t yield sum 2 and difference 2t; proved by ring. |
| derivative normalization | 3(z-1)² has second derivative 6, leading coefficient 3; z-1 has derivative 1; stated with actual analytic operators, proof left sorry. |
| Fricke sign | -(+1)=-1 and -(-1)=+1; norm_num proof. |
| height scaling | Pinned 3/2 becomes BSD 3 and quadratic-relative 6; norm_num proof. |
| one-dimensional Gram determinants | Pairing scaling gives 6; index-two basis change gives 12; actual Matrix.det proof. |
| empty determinant | Fin 0 identity determinant 1; simp proof. |
| gluing | Relative factor 2 divided by index-square 1 or 4 gives 2 or 1/2; norm_num proof. |
| periods | Covolume 3 gives 12; rectangular index two gives 6; real/twist example ratio 2; norm_num proof. |
| residue degree | ZMod 5 × ZMod 5 has 25 elements versus ZMod 5 with 5; norm_num proof. |
| ideal direction | (25)≤(5), reverse false in ℤ; actual principal-ideal/divisibility proof. |
| unit/zero ideals | (1)=top and (0)=bottom; simp proof. |
| BDP square | X² coefficients 0,1 in degrees 1,2; simp proof. |
| Euler polynomial | 1-C(1/2)X coefficients 1,-1/2; norm_num proof. |
| trivial-character correction | X(1+X) coefficients 0,1; simp proof. |
| geometric component group | ZMod 5 has cardinality 5; inversion fixes exactly {0}; finite exhaustive proof. |
| dyadic eigensigns | Nonzero 1 in ZMod 2 equals its negative; decide proof. |
| characteristic-two twist | y²+xy=x³+1 has 4 projective points over F₂; adding x² gives twist with 2 points. Counts include infinity; decide proof. |
| smallest field | ZMod 2 has cardinality 2, distinct from 1; norm_num proof. |
| full/free index | 2·5=10, 2²=4, (2·5)²=100; norm_num proof. |
| twist defect sign | 3+(-3)=0 but 3+3≠0; norm_num proof. |
| torsion-square quotient | (1/25)·5²=1, v₅(1/25)=-2; proved using actual rational valuation, its prime instance and inverse/power rules. |
| 32 quotient control | (1/8)·4²/2=1 versus (1/2)·4²/2=4; norm_num proof; no actual curve data constructed. |

README definitions whose arithmetic carriers are not at the pins have their API
and at least three Checks in place. The closing Lean comment identifies those
definitions, including the certificate constructors. Their arithmetic Checks
are roadmap tests; representative scalar tests elaborate now. This does not
claim that the missing L-function, Heegner, Selmer or Iwasawa carriers have been
implemented, or that the Lean file proves the entire README.

## Validation

- `lean-check research/blueprint/packages/RankZeroOneBSD/Suggested.lean`: exit 0, exactly 21 `sorry` warnings, no other warnings or errors.
- `python3 scripts/check_blueprint.py` on RankZeroOneBSD--BSD.0.json,
  RankZeroOneBSD--BSD.7.json and RankZeroOneBSDPartII.json: each 0 errors,
  0 warnings. Those packets were checked read-only, not changed.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: passed.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  4 files, 0 problems.
- Target audit inventory: exactly 140 rows, matching every current numbered
  README target in order. Old Layer 14 disposition accounts for all 20 inputs.
- No stale numbered references to the three revising suppliers, no CN.4
  dependency, no concrete 32a2 computation declarations, no `lemma`, `True`
  placeholder, sorry-valued data or local-machine path in deliverables.

## Maintainer action

Supply the absent adversarial report and reconcile its actual finding IDs with
this table. Assign the unowned elliptic-unit character interface and route the
named supplier extensions to their owning packages without treating current
weaker exports as equivalent. Establish the ramified §10.8 comparison before
claiming its present proof chain is closed. This handoff preserves the exact
remaining obligations; it does not authorize work on a second issue.
