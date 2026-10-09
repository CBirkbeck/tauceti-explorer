# Independent review: inverse Galois theory and arithmetic fundamental groups

Job `REV-InverseGaloisAndArithmeticFundamentalGroups`, [issue #519](https://github.com/CBirkbeck/tauceti-explorer/issues/519). Reviewer: Codex — `codex-vvqpUi`, 2026-10-09. The reviewer did not write the incoming plan or suggested file.

**Verdict: accepted.** This is a finished target-level independent review. Clear errors were corrected in place. The packet has no remaining contradiction found in this review; its original-source proof inputs and unavailable native carriers remain named obligations. Acceptance does not certify those proofs, implementation, or readiness to send a package upstream.

## Counts and status

| Item | Result |
| --- | --- |
| Nodes checked | 137: 101 verified, 36 corrected, 0 added, 0 unverifiable |
| Baseline citations | 67 confirmed at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; 0 removed or replaced |
| Definitions and constructions | 20 definitions and 31 constructions, each with at least three discriminating tests |
| API and tests | 203 API entries; 155 tests, including one new zero-algebra counterexample |
| Planets | 33, retaining central definitions, constructions and named theorems |
| Sources | 39 records: 35 public PDF versions, 3 library records, 1 current upstream proof; downloaded PDF hashes match the recorded versions |
| Requests and gaps | 49 requests; 29 gaps, including the new Property E finite-to-profinite and supplier-adapter obligations |
| Coverage | `complete` finished pass; all seven stages `planned`, none `closed`; every implementation status `unchecked` |
| Suggested file | 25 partial signature entries and 112 whole-target omissions, all individually enumerated |
| Active and omitted interfaces | 44 typed / 159 omitted API items; 37 typed / 118 omitted tests |
| Source mistakes | E1 and E2 confirmed; E3 added and confirmed |

PROTOCOL §0 permits planned prerequisite chains to end in a recorded gap and defines complete as a finished pass. These meanings apply here. PROTOCOL §13's omission rule is used for unavailable conditions and carriers: omitted items have exact IDs, mathematical specifications, supplier interfaces and gap obligations. No opaque proposition replaces a missing mathematical condition. Compilation checks the active signatures and examples; their proofs remain `sorry`.

## Corrections

The table records every corrected node. No target node was added or removed. The new test is `GaloisAlgebra.zero_test`; general descent gained the direct `IG.1/tame-tangential-fiber` prerequisite. Property E gained a named proof gap and a matching signature boundary. The seven `coverage.remaining` lists were reconciled with the gap records.

| Node | Correction |
| --- | --- |
| `IG.0/finite-galois-algebras` | Added nonzero/nonempty to the tensor criterion, with a fourth zero-algebra counterexample; disconnected torsor algebras and surjective field realizations remain distinct. |
| `IG.0/etale-fundamental-group` | Restricted disconnected component reduction to locally connected schemes with open-and-closed components; the connected fiber-functor statement is unchanged. |
| `IG.1/decomposition-inertia` | D stabilizes an underlying point/valuation; a geometric lift has inertia stabilizer under separable-residue hypotheses. Quotient and conjugacy conventions agree. |
| `IG.3/general-cover-moduli-descent` | Specified continuous lifts of comparison cosets in G/Z(G), trivial central action and the basepoint section; added its direct prerequisite and a concrete ordered quadratic branch test. |
| `IG.4/cyclic-ramification-correction` | Corrected the p=2 proof branch to multiplicative/Kummer classes under char(k) unequal to p; the characteristic-p additive argument belongs to Theorem15. |
| `IG.4/property-e` | Corrected Definition2.3, the trivial Cp action and full pro-Δ′ quotient scope; added the finite-to-profinite compatibility/compactness gap. |
| `IG.4/unramified-gamma-groups` | Changed the base-change API to Γ-stable open normal quotients/Galois over the base; this does not imply characteristicity under all automorphisms. |
| `IG.5/hurwitz-analytic-comparison` | Restricted the unramified-infinity arithmetic comparison to the product-one part of the marked topological configuration cover. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/tame-cohomological-specialization` | Removed the unsupported prime-to-residue-characteristic bound on cover degree; EVW7.7 uses proper smooth mixed-characteristic normal-crossings hypotheses and SGA local acyclicity. |
| `IG.5/formal-curve-patching` | Corrected R_empty to the closed-fiber generic local ring. HH4.9–4.11/7.1 patches vector spaces/algebras; formal branched-cover sufficiency still needs its own proof. |
| `IG.3/braid-orbit-monoid` | The full carrier includes empty and nongenerating tuples; the identity-puncture test now requires 1 in c. |
| `IG.3/lifting-invariant` | The universal marked extension records degree as well as reduced multiplier. The degree test now uses a full order block of an element in c. |
| `IG.3/artin-good-neighborhoods` | Corrected the asphericity API to π_i=0 for i at least two; elementary fibration construction is an explicit SGA4 proof input. |
| `IG.0/noohi-groups` | Infinite reconstruction retains categorical tameness; replaced the ambiguous test by the nontrivial transitive two-point Z-action. The set-sized generator proof remains a gap. |
| `IG.4/global-arithmetic-invariant` | Wood19's single outside involution class and epimorphism to C2 are essential; replaced the scope test by an explicit incompatible C3 datum. |
| `IG.2/regular-full-group` | Regular Galois covers have a thin exceptional specialization set; corrected to Serre3.3.1 p.23 and3.4.1 p.25. |
| `IG.2/disjoint-specializations` | Auxiliary finite extensions enforce linear disjointness via regularity and Hilbert irreducibility; corrected Serre3.3.3/3.3.4 p.24. |
| `IG.2/hilbert-local-conditions` | Affine-space approximation and an actual nonempty local open are retained; corrected the unrelated Serre9.2 citation to3.5.3/3.5.7 pp.28–30. |
| `IG.2/integral-thin-count` | Added primary Serre3.4.4/3.6.2 and Appendix10.1–10.4 for the box estimate and large sieve; finite-field density and splitting-prime inputs remain gaps. |
| `IG.4/auxiliary-class-properness` | Corrected DLAN2.4 to p.1018; localization gives weak torsors and the separate finite coset/derangement argument forces full image. |
| `IG.1/punctured-specialization` | Retained the smooth pair/disjoint sections and prime-to-p scope; replaced nonexistent Wood5.3 with 5.2 and the family argument6.1. |
| `IG.1/finite-field-frobenius` | Arithmetic q-power and geometric inverse-q power on the peripheral Tate carrier agree with the supplier conventions; corrected the Wood locator. |
| `IG.3/arithmetic-lift-comparison` | Corrected Wood5.3 to5.2/6.1 throughout. General twisted-set covariance is separate from Wood19's narrower involution-class product with infinity correction. |
| `IG.5/hurwitz-component-invariants` | Stable generating components use the inverse-Tate set action and tame transport; corrected Wood's theorem locator and retained the restricted withdrawn-proof use. |
| `IG.6/faithful-dessin-action-import` | Replaced unrelated Serre8.3 pages by the current Belyi13.5 proof encoding a moved algebraic number; genus-zero and plane-tree scope is retained. |
| `IG.2/norm-pullback-hilbert` | Geometric integrality and shrinking are explicit. All-point inclusion is distinguished from equality on rational points; narrowed HW20's locator to16–17. |
| `IG.4/finite-quotient-approximation` | SLn/F weak approximation is equivalent to H1 localization surjectivity, with nonconstant cocycles retained; corrected the precise DLAN2.5 locator. |
| `IG.1/stack-and-family-exactness` | Landesman–Litt9.1.1/9.1.2 supplies distinct scheme/stack hypotheses; profinite completion exactness is retained as the Anderson proof gap. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/arithmetic-hurwitz-moduli` | Romagny–Wewers4.4–4.12, LWZB11 and Wood4.5 have different marking scopes; scheme representability is not inferred from an arbitrary ramified marking. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/arbitrary-monodromy-marked-moduli` | Seguin permits disconnected covers and inactive punctures; the enlargement of the original Emsalem/Kanev construction remains a representability proof gap. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/admissible-g-covers` | Node charts are balanced with inverse inertia characters, and degree/rank, labels and stability are retained for general genus and markings. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/admissible-stacks-and-stable-curves` | Chen2.4.4–2.4.9 preserves the decomposed marking and quotient; general proper DM construction and the special (1,1) rigidification remain separate. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/ordered-configuration-compactification` | The M0,n+1 and affine-coordinate factorization carries the relative normal-crossings divisor and pure-ordering cover used for fixed-degree comparison. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/double-cover-trace-zero` | With two invertible, trace/2 splits a finite flat rank-two algebra into its unit and trace-zero line. The odd-degree monic hyperelliptic form additionally needs a distinguished branch section and étale frames. Corrected the general stack/descent owner to SF.1; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/labelled-hyperelliptic-family` | Ordered branch roots and the lifted affine action retain the hyperelliptic involution and parity; this is not the unordered moduli family. Corrected the general stack/descent owner to SF.1; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/versal-phi-cover-families` | Landesman–Litt7.3.1's dominant étale multisection and section preserve the chosen cover; the original Wewers construction is still a named proof input. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |

The source repairs include Serre §3.3 Proposition3.3.1 (p.23), Proposition3.3.3 and Corollary3.3.4 (p.24), §3.4 Theorem3.4.1 (p.25), and §3.5 Theorems3.5.3/3.5.7 (pp.28–30). The old §9.2 locator was unrelated. The integral-box target now cites Theorem3.4.4 (p.27), Theorem3.6.2 (pp.32–33), and the proved large-sieve ingredient in Appendix §§10.1–10.4 (pp.103–107). The remaining finite-field density, splitting-prime, local-constancy and compact-analytic Frattini inputs are identified separately.

Wood2021 has Theorem5.2 (p.10), Remark5.3, Remark5.4 (p.11), and Theorem6.1 with its proof (pp.11–12). There is no Theorem5.3. The repaired source record, four locators and arithmetic comparison proof sketch respect that distinction. Wood2019 Theorem3.13 (pp.394–398) remains restricted to its own group/involution data and infinity normalization.

EVW Proposition7.7 (published pp.767–768) permits every finite étale cover under its mixed-characteristic proper smooth normal-crossings hypotheses. Its proof uses characteristic-zero generic tameness and the cited SGA local-acyclicity input. The former additional prime-to-residue-characteristic degree bound was unsupported and would obstruct the fixed-degree Hurwitz application. This correction does not generalize the theorem to arbitrary degenerating families. Harbater–Hartmann Notation4.3 (PDF p.9) fixes the empty-patch ring; Theorems4.9–4.11 (pp.12–13) and7.1 (pp.22–23) provide algebra patching, with formal branched-cover sufficiency still an independent obligation.

## Baseline, suppliers and ownership

Every baseline name and its surrounding statement were read at the two recorded commits, not inferred from a declaration-name search. The reviewed library audit was checked. Native rational-function evaluation is total and evaluates poles to zero; its ring laws require regular denominators. Finite étale algebras and abstract Galois categories are available, but their scheme fiber-functor bridge is not supplied merely by the abstract category instance. `functorToContAction` has the stated full, faithful and equivalence infrastructure. Finite Schur–Zassenhaus gives complement existence; it does not provide finite conjugacy or the profinite inverse-limit theorem. Existing free pro-p, Frattini, solvability, polynomial, field and braid carriers are used directly.

The current upstream was read at `94ff6a17fb5f138baeac6cd961cd5c21e40f6696`, including ProfiniteArithmetic and PeripheralActions and the relevant Belyi, embedding and finite-cover interfaces. The current library was inspected read-only. Its finite embedding problem and generic extension/cohomology dictionary are imported, with the pinned adapter gap retained. Profinite powers, Tate carriers and peripheral conventions belong to the existing upstream owners; no second construction was introduced. BelyiMaps13.5 explicitly supplies genus-zero dessin faithfulness and its plane-tree refinement, using algebraic-number encoding and normalized composition. Serre §8.3 pp.86–87 does not provide this result and was replaced by that exact current supplier proof.

Cross-roadmap chains retain the precise requested stage or node: scheme/stack and moduli carriers, finite analytic comparison, finite-module actions, marked central extensions and their set actions, and the norm-torus interface. The 49 requests specify the needed object, hypotheses or comparison and the consumer IDs. The final supplier audit corrects the general stack owner to SF.1 and stable pointed-curve owner to SF.4. R09.4’s current packet treats elliptic/abelian moduli. C0/C4 do not supply the arbitrary finite-CW/fibration requests, and E1/E2 does not by itself supply finite-coefficient base change/local acyclicity or the chosen tower’s ML theorem. The new Supplier comparison adapters gap records these unfulfilled contracts and their affected nodes; no broad stage title is a proof. General later-tier duality/cohomology results are not used as proof suppliers for the restricted finite arithmetic kernels owned here. Imported target statements and honest gaps are not evidence that the requested supplier has implemented them.

The stronger absolute-Galois normal-subgroup result remains a named `IG.2` continuation with original proof and ownership obligations. Schmidt–Stix Theorem7.1's proof (published p.850) uses the no-nontrivial-finitely-generated-closed-normal-subgroup statement, not ordinary Hilbert irreducibility. The packet does not turn an unaccepted extraction routing into an accepted owner decision.

## Inherited red-team findings and source mistakes

`RT-AREA-arithmeticgeometry-2/1` is handled by the scheme Galois-category bridge and the separate infinite Loc/Cov, Noohi and pro-étale nodes. The reader makes the same distinction and includes the noncompact target motivation. `RT-AREA-arithmeticgeometry-2/2` is handled by the stronger named absolute-Galois target and its original-proof/ownership gap; both packet and reader retain that boundary. Finite specialization statements alone do not close it.

E1 was checked visually at Dèbes's author working text p.136 (physical p.148): the explanatory polynomial index uses the parameter count where the polynomial count is required. E2 was checked visually in both HOPS preprints (§3.2.1, v1 p.9 and v2 p.11): a negative affine-coordinate exponent has a wild pole at the affine origin, contradicting the claimed whole-affine-line étaleness. The report stays confined to the cited preprints. E3 was checked visually at Wewers's arXiv v1 Example1.6 (p.6): the final Hurwitz description repeats the second entry where the third entry is required; the two entries have distinct stated conjugacy classes. No target depends on that example. Each source issue has the required independent verdict, reason, version scope and search record. No source passage was copied into the deliverables.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/InverseGaloisAndArithmeticFundamentalGroups.json` reports zero errors and zero warnings. The initial and final suggested files elaborated through `lean-check` at the shared pinned build. The final run exited zero with only declaration-uses-sorry warnings (110). No other Lean diagnostic occurred. Available memory was checked before elaboration; one compiler was run at a time. The source-version hashes, complete review-ledger coverage, API/test omission counts, and allowed-file scope were checked. `git diff --check` passed.

## Questions and handoff to the manager

1. Resolve the existing ownership proposal for the stronger `IG.2` absolute-Galois continuation; this review accepts its honest target specification, not the pending routing decision.
2. Arrange the recorded original-proof inputs through permitted sources or independent proofs, especially cancellation, profinite complement conjugacy, central global lifting, global duality, geometric comparison and wild sufficiency. Acceptance does not remove these 29 obligations.
3. Synchronize the 36 node corrections, the new zero-algebra test, source repairs and new gap into the reader during packaging. This review issue permits editing only the packet, suggested file and report (plus its handoff); the existing reader was read and left untouched. This is a required packaging synchronization, not a missing second review job.

## Per-node ledger

Each verdict checks the planned statement, hypotheses, proof structure, prerequisites, source support, and, where applicable, API/test discrimination. A gap-bearing node's verified verdict does not certify the missing original proof or native carrier. The packet contains the same ledger, with its individual gap titles.

| Node | Verdict | Finding |
| --- | --- | --- |
| `IG.0/finite-etale-covers` | verified | Native finite-plus-étale morphism carrier and affine finite étale algebra equivalence match the pin; the geometric fiber clauses remain in the named scheme bridge. |
| `IG.0/geometric-fiber` | verified | Finite geometric fibers use a separably closed geometric point; pullback and reflection of isomorphisms require the recorded scheme Galois-category bridge. |
| `IG.0/etale-fundamental-group` | corrected | Restricted disconnected component reduction to locally connected schemes with open-and-closed components; the connected fiber-functor statement is unchanged. |
| `IG.0/basepoint-and-components` | verified | Paths are fiber-functor isomorphisms, so transport is inner up to choice; different components do not acquire paths. |
| `IG.0/field-and-torus-comparisons` | verified | Field absolute Galois and prime-to-characteristic peripheral Tate identifications are imports of ModularCurves0d and Belyi12–13, using current ProfiniteArithmetic powers. |
| `IG.0/finite-galois-algebras` | corrected | Added nonzero/nonempty to the tensor criterion, with a fourth zero-algebra counterexample; disconnected torsor algebras and surjective field realizations remain distinct. |
| `IG.0/finite-etale-idempotents` | verified | Kedlaya–Liu1.2.2/1.2.3 gives the finite étale idempotent/component argument; neither arbitrary disconnected cover nor a chosen nontrivial idempotent is silently treated as connected. |
| `IG.0/integral-monodromy` | verified | A continuous action on a finite-rank discrete integral lattice has finite image; this topology differs from an adic representation. |
| `IG.0/adic-local-systems` | verified | Inverse-limit integral systems, isogeny localization and its stackification are distinguished, retaining the nodal counterexample and geometric bridge. |
| `IG.0/adic-representations` | verified | Continuous adic representations and lattice data retain the actual coefficient topology; incidence and join operations are not replaced by constant rational lattices. |
| `IG.0/noohi-groups` | corrected | Infinite reconstruction retains categorical tameness; replaced the ambiguous test by the nontrivial transitive two-point Z-action. The set-sized generator proof remains a gap. |
| `IG.0/proetale-fundamental-group` | verified | Bhatt–Scholze7.3–7.4 uses Loc/Cov and Noohi reconstruction rather than the finite SGA1 category; Caraiani–Scholze's noncompact J_b torsors require this distinction. |
| `IG.1/arithmetic-exact-sequence` | verified | Geometric connectedness and the selected geometric basepoint are retained; rational sections are additional data, not automatic splitting. |
| `IG.1/decomposition-inertia` | corrected | D stabilizes an underlying point/valuation; a geometric lift has inertia stabilizer under separable-residue hypotheses. Quotient and conjugacy conventions agree. |
| `IG.1/tame-and-prime-to-p` | verified | Tame covers may have p-divisible monodromy order; the maximal prime-to-p quotient and the p=1 convention stay separate. |
| `IG.1/proper-specialization` | verified | Proper smooth specialization keeps the full surjection and prime-to-p isomorphism scopes of SGA1, rather than claiming a full isomorphism in mixed characteristic. |
| `IG.1/punctured-specialization` | corrected | Retained the smooth pair/disjoint sections and prime-to-p scope; replaced nonexistent Wood5.3 with 5.2 and the family argument6.1. |
| `IG.1/finite-field-frobenius` | corrected | Arithmetic q-power and geometric inverse-q power on the peripheral Tate carrier agree with the supplier conventions; corrected the Wood locator. |
| `IG.1/charzero-base-extension` | verified | Proper SGA1 X1.8 is not used to prove unrestricted nonproper invariance. The latter is an explicit target with its own original-proof obligation. |
| `IG.1/arithmetic-representation` | verified | An outer arithmetic action becomes an actual action only after a chosen section; finite and adic coefficient topologies are retained. |
| `IG.1/stack-and-family-exactness` | corrected | Landesman–Litt9.1.1/9.1.2 supplies distinct scheme/stack hypotheses; profinite completion exactness is retained as the Anderson proof gap. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.2/regular-subring` | verified | Uses reduced native rational-function denominators. Removable singularities and a genuine pole distinguish the intended carrier. |
| `IG.2/regular-membership` | verified | Membership is exactly nonvanishing of the reduced denominator, matching RatFunc rather than a chosen unreduced presentation. |
| `IG.2/regular-evaluation` | verified | Native total evaluation restricts to a ring map only on the regular subring; the regularity hypotheses of multiplication are necessary. |
| `IG.2/polynomial-specialization` | verified | Coefficientwise evaluation is total, with conditional ring laws; the pole-multiplication counterexample prevents an unconditional ring homomorphism. |
| `IG.2/specialization-coefficients` | verified | Finite-sum monomial evaluation gives each coefficient directly using the native Polynomial API. |
| `IG.2/specialization-map-regular` | verified | Specialization on coefficients in the regular subring agrees with Polynomial.map of the restricted evaluation homomorphism. |
| `IG.2/specialization-add` | verified | Each input coefficient is regular; native evaluation additivity applies coefficientwise with these hypotheses. |
| `IG.2/specialization-mul` | verified | Regularity of both coefficient families is retained through the finite convolution, using the restricted evaluation map. |
| `IG.2/denominator-product` | verified | The product ranges over polynomial support and uses reduced denominators with repetitions; zero has empty product one. |
| `IG.2/denominator-product-nonzero` | verified | Every reduced denominator is nonzero, so the finite product is nonzero over a field, including empty support. |
| `IG.2/denominator-product-domain` | verified | The guard detects regularity of every coefficient, with the zero-coefficient denominator convention handled separately. |
| `IG.2/specialization-degree` | verified | The leading coefficient must remain nonzero in addition to coefficient regularity; the proposed degree-drop test catches omission of that guard. |
| `IG.2/specialization-guard` | verified | A nonzero parameter polynomial simultaneously protects regularity and degree; it does not by itself enforce irreducibility. |
| `IG.2/finite-bad-specializations` | verified | The exceptional set is bounded by roots of a nonzero polynomial; infinite parameter field and nonzero guard are essential. |
| `IG.2/simultaneous-finite-avoidance` | verified | A finite product of nonzero guards and infinitude gives simultaneous avoidance without an unproved countable-avoidance claim. |
| `IG.2/hilbert-subsets` | verified | Polynomial degree and regularity restrictions are reconciled with the connected finite étale fiber definition at all scheme points. |
| `IG.2/number-field-hilbert` | verified | Hilbert irreducibility uses a number field/Hilbertian base and finite data; the Hilbert–Dörge proof chain is explicit in the source range. |
| `IG.2/thin-sets` | verified | Types I and II use proper closed sets and generically finite degree-greater-than-one maps with the stated geometric irreducibility assumptions. |
| `IG.2/regular-full-group` | corrected | Regular Galois covers have a thin exceptional specialization set; corrected to Serre3.3.1 p.23 and3.4.1 p.25. |
| `IG.2/disjoint-specializations` | corrected | Auxiliary finite extensions enforce linear disjointness via regularity and Hilbert irreducibility; corrected Serre3.3.3/3.3.4 p.24. |
| `IG.2/hilbert-local-conditions` | corrected | Affine-space approximation and an actual nonempty local open are retained; corrected the unrelated Serre9.2 citation to3.5.3/3.5.7 pp.28–30. |
| `IG.2/norm-pullback-hilbert` | corrected | Geometric integrality and shrinking are explicit. All-point inclusion is distinguished from equality on rational points; narrowed HW20's locator to16–17. |
| `IG.2/frattini-full-image` | verified | Full image in a finite Frattini quotient forces full closed image; openness of the compact analytic Frattini subgroup remains a named original-proof input. |
| `IG.2/integral-thin-count` | corrected | Added primary Serre3.4.4/3.6.2 and Appendix10.1–10.4 for the box estimate and large sieve; finite-field density and splitting-prime inputs remain gaps. |
| `IG.2/absolute-galois-normal-subgroups` | verified | The stronger no-nontrivial-finitely-generated-closed-normal-subgroup statement is not replaced by finite-quotient Hilbert irreducibility. Original proof and ownership remain explicit. |
| `IG.2/quadratic-specialization-example` | verified | The nonsquare quadratic specialization realizes C2 away from the degree/discriminant guard; no assertion treats all parameter values as irreducible. |
| `IG.3/general-riemann-existence` | verified | Finite analytic covers of arbitrary finite-type complex schemes require SGA1 XII5.1's nonproper algebraization, beyond proper coherent GAGA. |
| `IG.3/bounded-cover-count` | verified | Degree-bounded covers follow from topological finite generation and finite permutation representations; base extension and finite-CW proof inputs are recorded separately. |
| `IG.3/branch-tuples` | verified | Raw tuples, product-one sphere tuples, generating tuples and inner/absolute quotients remain distinct; disk boundary product is allowed to vary. |
| `IG.3/hurwitz-braid-action` | verified | The left move and its inverse preserve exact product, subgroup and class multiset; ordered classes use the appropriate color-preserving subgroup. |
| `IG.3/braid-orbit-monoid` | corrected | The full carrier includes empty and nongenerating tuples; the identity-puncture test now requires 1 in c. |
| `IG.3/exterior-epimorphisms` | verified | Epi modulo target inner automorphisms is separate from Out(F2) or Aut(G) quotients, preventing confusion between Nielsen classes and T-systems. |
| `IG.3/nielsen-open-statements` | verified | Conjectures and the divisibility question remain open predicates; primary McCullough–Wanderley weak trace and exceptional fields are distinguished from the secondary formulation. |
| `IG.3/branch-cycle-realization` | verified | Product-one plus generation gives a connected sphere G-cover; identity labels and Riemann–Hurwitz are retained with the geometric carrier gap. |
| `IG.3/rational-rigidity` | verified | Rational conjugacy classes, rigidity and the centerless/appropriate descent conditions are retained; rationality alone does not prove a rational model. |
| `IG.3/general-cover-moduli-descent` | corrected | Specified continuous lifts of comparison cosets in G/Z(G), trivial central action and the basepoint section; added its direct prerequisite and a concrete ordered quadratic branch test. |
| `IG.3/real-moduli-counterexample` | verified | Wewers1.10's SL2(F5) obstruction is distinguished from its real field of moduli; the actual group model/path computation remains a proof obligation. |
| `IG.3/rigid-s3-comparison` | verified | The worked S3 comparison retains the specific branch classes, product and rational descent hypotheses rather than importing general rigidity without them. |
| `IG.3/lifting-invariant` | corrected | The universal marked extension records degree as well as reduced multiplier. The degree test now uses a full order block of an element in c. |
| `IG.3/stable-braid-classification` | verified | Wood3.1 applies to generating tuples with every class sufficiently frequent; its Fried–Völklein cancellation input remains a gap. |
| `IG.3/arithmetic-lift-comparison` | corrected | Corrected Wood5.3 to5.2/6.1 throughout. General twisted-set covariance is separate from Wood19's narrower involution-class product with infinity correction. |
| `IG.4/proper-local-embedding-problem` | verified | Weak and proper solutions and kernel-conjugate versus full-group-conjugate local prescriptions are separate, using the current generic supplier. |
| `IG.4/abelian-kernel-obstruction` | verified | The pulled-back H2 class detects weak lifting only; A-conjugacy classes form an H1 torsor after choosing a lift. Arbitrary finite abelian coefficients need the recorded adapter. |
| `IG.4/finite-galois-localization` | verified | Local continuous maps retain decomposition embeddings and conjugacy; torsor algebras do not automatically become fields. |
| `IG.4/restricted-poitou-tate` | verified | Finite-coefficient global duality retains restricted unramified products, Cartier duality and modified real terms; the original reciprocity proof is explicitly missing. |
| `IG.4/solution-twisting` | verified | Twisting weak solutions uses the actual conjugation action on the kernel; the local adjustment and properness criteria remain separate. |
| `IG.4/grunwald-wang-boundary` | verified | The special 2-primary obstruction is retained rather than claiming unrestricted abelian local solvability; restricted duality is a direct proof input. |
| `IG.4/independent-cyclic-eight-lifts` | verified | HW23 Lemma7.6 requires independent quadratic classes and the stated prime congruences; dependent classes need not give the full product image. |
| `IG.4/free-operator-shrinking` | verified | Schmidt–Wingberg's operator filtration and degree-shifting cohomology are arithmetic additions to imported free pro-p carriers, not a duplicate construction of those carriers. |
| `IG.4/induced-proper-solutions` | verified | Induction/Shapiro and the stated local vanishing support the operator embedding argument; a weak lift is not used as a proper solution without the shrinking step. |
| `IG.4/cyclic-ramification-correction` | corrected | Corrected the p=2 proof branch to multiplicative/Kummer classes under char(k) unequal to p; the characteristic-p additive argument belongs to Theorem15. |
| `IG.4/split-nilpotent-proper-solutions` | verified | Schmidt–Wingberg15 retains prescribed local behavior, properness and ramification control; the characteristic-p case and prime-to-characteristic induction are distinct. |
| `IG.4/fitting-supplement` | verified | The supplement construction needs the finite solvable Frattini/Fitting structural theorem, kept as a gap rather than attributed to the Mathlib solvability API. |
| `IG.4/shafarevich-solvable-realization` | verified | Solvable realization follows by the stated nilpotent-kernel induction; it does not entail arbitrary bad-place Grunwald prescriptions. |
| `IG.4/supersolvable-grunwald` | verified | HW20 TheoremB's supersolvable quotient-space argument applies at the stated good places; this is stronger local control in a narrower group range. |
| `IG.4/quaternion-all-place-prescriptions` | verified | The all-place result uses Demarche's unramified Brauer computation for the specified generalized quaternion groups; that proof remains an explicit input. |
| `IG.4/collective-degree-realization` | verified | Collectively coprime field degrees do not provide a single base-field realization; the regular refinement has its own cited proof gap. |
| `IG.4/base-no-unramified-extension` | verified | Minkowski for Q and the genus formula with split infinity for Fq(t) give the two stated base cases, with no general number-field assertion. |
| `IG.4/unramified-gamma-groups` | corrected | Changed the base-change API to Γ-stable open normal quotients/Galois over the base; this does not imply characteristicity under all automorphisms. |
| `IG.4/property-e` | corrected | Corrected Definition2.3, the trivial Cp action and full pro-Δ′ quotient scope; added the finite-to-profinite compatibility/compactness gap. |
| `IG.4/unramified-property-e` | verified | LWZB's root-of-unity-free central criterion and global character adjustment remain explicit inputs; Γ-stable quotient subgroups must be normal. |
| `IG.4/tame-central-lift` | verified | The local tame central lifting result keeps the root-of-unity and prime-to-order range and its reduced-cover input; no universal proper-lifting theorem is asserted. |
| `IG.4/global-arithmetic-invariant` | corrected | Wood19's single outside involution class and epimorphism to C2 are essential; replaced the scope test by an explicit incompatible C3 datum. |
| `IG.4/marked-arithmetic-extensions` | verified | The embedding at infinity is part of the arithmetic datum, affecting conjugacy and the point dictionary; it cannot be discarded without changing the moduli problem. |
| `IG.5/configuration-spaces` | verified | Ordered distinct tuples and their symmetric quotient use the native subtype/quotient; discriminant, empty and one-point tests agree. |
| `IG.5/configuration-braid-group` | verified | The analytic configuration π1 is the braid group; the ordered cover has pure braid π1. The exact analytic comparison carrier is omitted honestly. |
| `IG.5/topological-hurwitz-covers` | verified | Associated configuration covers use all tuples before restricting boundary product or generation; markings identify homomorphisms rather than conjugacy classes. |
| `IG.5/forget-hurwitz-marking` | verified | Simultaneous G-conjugacy models forgetting the mark; centralizers give stabilizers, so the full G-action need not be free on the disconnected locus. |
| `IG.5/tame-g-cover` | verified | Finite flat generically torsor maps, actual target labels and tame boundary conditions are retained. Inactive labels and connectedness are separate. |
| `IG.5/arithmetic-hurwitz-moduli` | corrected | Romagny–Wewers4.4–4.12, LWZB11 and Wood4.5 have different marking scopes; scheme representability is not inferred from an arbitrary ramified marking. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/arbitrary-monodromy-marked-moduli` | corrected | Seguin permits disconnected covers and inactive punctures; the enlargement of the original Emsalem/Kanev construction remains a representability proof gap. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/hurwitz-analytic-comparison` | corrected | Restricted the unramified-infinity arithmetic comparison to the product-one part of the marked topological configuration cover. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/admissible-g-covers` | corrected | Node charts are balanced with inverse inertia characters, and degree/rank, labels and stability are retained for general genus and markings. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/admissible-stacks-and-stable-curves` | corrected | Chen2.4.4–2.4.9 preserves the decomposed marking and quotient; general proper DM construction and the special (1,1) rigidification remain separate. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/ordered-configuration-compactification` | corrected | The M0,n+1 and affine-coordinate factorization carries the relative normal-crossings divisor and pure-ordering cover used for fixed-degree comparison. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/tame-cohomological-specialization` | corrected | Removed the unsupported prime-to-residue-characteristic bound on cover degree; EVW7.7 uses proper smooth mixed-characteristic normal-crossings hypotheses and SGA local acyclicity. |
| `IG.5/fixed-degree-mod-l-comparison` | verified | EVW7.8 uses an auxiliary coefficient prime exceeding n to take Sn invariants; the comparison does not assert arbitrary Frobenius-equivariant singular cohomology. |
| `IG.5/coefficient-tower-comparison` | verified | Coefficient-compatible transition maps, finiteness/ML and invariant descent are required before passing to Ql; these remain explicit proof obligations. |
| `IG.5/restricted-hurwitz-trace-kernel` | verified | Compact support, duality, trace and weights are planned here in the restricted finite Hurwitz range; later general cohomology roadmaps are not treated as proof suppliers. |
| `IG.5/fixed-degree-point-estimate` | verified | For each fixed degree the error depends on its Betti data; no unproved uniform-in-degree estimate or withdrawn homological stability input is used. |
| `IG.5/hurwitz-points-and-extensions` | verified | LWZB10.2 and Wood4.4 retain constants, splitting and the infinity marking; weak torsor maps are distinguished from full-image fields. |
| `IG.5/hurwitz-component-invariants` | corrected | Stable generating components use the inverse-Tate set action and tame transport; corrected Wood's theorem locator and retained the restricted withdrawn-proof use. |
| `IG.5/frobenius-component-count` | verified | LWZB12.7–12.9 keeps root-valued corrections, positive lattice weights and the degree progression; the low-class orbit input remains a gap. |
| `IG.5/semidirect-component-comparison` | verified | LWZB10.4's semidirect admissibility and q−1 restrictions are retained; the component/count comparison is not claimed for arbitrary semidirect products. |
| `IG.5/product-one-component-monoid` | verified | Seguin's arithmetic multiplicativity is restricted to permuting/nested monodromy families; the full product-one monoid is not declared Galois-equivariant without conditions. |
| `IG.5/bounded-core-galois-reduction` | verified | Seguin6.1 removes full order blocks while retaining the generated subgroup; the finite quotient combines bounded-core action with a finite cyclotomic modulus. |
| `IG.5/double-cover-trace-zero` | corrected | With two invertible, trace/2 splits a finite flat rank-two algebra into its unit and trace-zero line. The odd-degree monic hyperelliptic form additionally needs a distinguished branch section and étale frames. Corrected the general stack/descent owner to SF.1; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/lifted-affine-coordinate-group` | verified | The square-root scale lift is a central double cover of the affine-coordinate group; native equations and the deck involution distinguish it from the ordinary affine group. |
| `IG.5/labelled-hyperelliptic-family` | corrected | Ordered branch roots and the lifted affine action retain the hyperelliptic involution and parity; this is not the unordered moduli family. Corrected the general stack/descent owner to SF.1; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/finite-cover-image-lemmas` | verified | Stack fundamental-group surjectivity is tested by connected finite covers. Smooth geometrically connected fibers and normal dense-open restriction preserve connected pullbacks under the stated hypotheses. |
| `IG.5/formal-curve-patching` | corrected | Corrected R_empty to the closed-fiber generic local ring. HH4.9–4.11/7.1 patches vector spaces/algebras; formal branched-cover sufficiency still needs its own proof. |
| `IG.5/abhyankar-affine-curve-realization` | verified | HOPS3.2/3.3 requires an affine curve, algebraically closed positive-characteristic base and the prime-to-p generator bound 2g+r−1; original sufficiency proofs remain gaps. |
| `IG.1/tame-tangential-fiber` | verified | The restricted boundary fiber uses a chosen parameter and prime-to-characteristic Tate roots; it supplies arithmetic sections and convention transport, not general logarithmic geometry. |
| `IG.3/finite-coefficient-comparison` | verified | Finite locally constant coefficients and coefficient-compatible maps are required; the general higher comparison roadmap is a consumer under the tier order. |
| `IG.3/artin-good-neighborhoods` | corrected | Corrected the asphericity API to π_i=0 for i at least two; elementary fibration construction is an explicit SGA4 proof input. |
| `IG.3/curve-topological-density` | verified | Curve completion density and goodness retain residual finiteness/asphericity hypotheses; these are not substituted by an assertion for arbitrary varieties. |
| `IG.5/versal-phi-cover-families` | corrected | Landesman–Litt7.3.1's dominant étale multisection and section preserve the chosen cover; the original Wewers construction is still a named proof input. Corrected the general stack/descent owner to SF.1 and stable pointed-curve owner to SF.4; R09.4’s existing elliptic/abelian moduli plan is not a supplier of these general objects. |
| `IG.5/general-fixed-fiber-equation` | verified | The finite reduced-kernel torsor and its normalized inverse-Tate set action give h^(q−1)=W; nonempty solution sets are torsors under A[q−1]. The general class-union equation is not imported from the involution-only formulas. |
| `IG.6/realization-certificates` | verified | Native splitting-field, degree, Galois and group-isomorphism data certify a realization. A polynomial without the full group is not a certificate. |
| `IG.6/specialization-export` | verified | Polynomial guard and full-group regular specialization supply different parts of the exported certificate; the remaining geometric specialization bridge is omitted in Lean. |
| `IG.6/cyclic-worked-realizations` | verified | The quadratic prime, square-discriminant irreducible cubic and fifth cyclotomic examples give C2,C3,C4 with full field/group data. |
| `IG.6/dihedral-eight-realization` | verified | The degree-eight real/complex tower and root assignments give the group of order eight; the D8/D4 naming convention and exact native adjoin carrier are explicit. |
| `IG.6/symmetric-family-import` | verified | Full Sn polynomial construction is imported from PolynomialGaloisGroups9; no competing symmetric-family proof is planned. |
| `IG.6/belyi-arithmetic-interface` | verified | Belyi12–13 supplies Tate powers, branch cycles and peripheral comparisons; current ProfiniteArithmetic/PeripheralActions ownership is respected. |
| `IG.6/faithful-dessin-action-import` | corrected | Replaced unrelated Serre8.3 pages by the current Belyi13.5 proof encoding a moved algebraic number; genus-zero and plane-tree scope is retained. |
| `IG.6/inverse-galois-frontier` | verified | General inverse Galois and regular realization questions remain open predicates; explicit solvable and imported families do not imply the general conjecture. |
| `IG.6/generic-polynomial-universality` | verified | Universality quantifies over extension fields with the exact coefficient/pole domain and full specialization group; a regular polynomial alone is insufficient. |
| `IG.1/homogeneous-space-fundamental-group` | verified | HW20 §5.1/5.3 uses an algebraically simply connected semisimple group and finite stabilizer; its étale simply-connected comparison is a named proof gap. |
| `IG.3/eventual-class-element-extraction` | verified | EVW3.4's generating tuple and eventual bound permit extraction without losing generation; its finite braid argument is distinct from the stronger stable classification. |
| `IG.5/finite-degree-component-bound` | verified | EVW2.5 bounds cells via a finite configuration cover; it gives fixed-degree Betti control, independent of an unproved stability theorem. |
| `IG.4/identity-root-invariant` | verified | The arithmetic invariant is a homomorphism on roots of unity, so its value at the identity is one; a nonidentity prescribed value gives an empty numerator whenever the denominator is nonzero. |
| `IG.4/auxiliary-class-properness` | corrected | Corrected DLAN2.4 to p.1018; localization gives weak torsors and the separate finite coset/derangement argument forces full image. |
| `IG.4/coprime-profinite-complements` | verified | Mathlib Schur–Zassenhaus provides finite existence only; finite conjugacy and profinite inverse-limit existence/conjugacy remain explicit proof inputs. |
| `IG.2/general-hilbert-local-approximation` | verified | Serre3.5.3/3.5.7's auxiliary-place argument uses weak approximation or the precise weak-weak variant, with its exceptional place set. |
| `IG.4/finite-quotient-approximation` | corrected | SLn/F weak approximation is equivalent to H1 localization surjectivity, with nonconstant cocycles retained; corrected the precise DLAN2.5 locator. |
| `IG.4/wang-cyclic-eight-counterexample` | verified | The independent reciprocity proof uses 16 as an eighth power away from two and the norm-valuation obstruction at two; it rules out the specified unramified C8 local field. |

## Pinned baseline ledger

All 67 entries below were confirmed under their cited names and modules at the recorded pins. Their provided interfaces match the consumers' restrictions; none was removed or replaced.

| Declaration | Module | Provided interface |
| --- | --- | --- |
| `mathlib:Subring` | `Mathlib/Algebra/Ring/Subring/Defs.lean` | Native subring with inherited ring operations; no private ring carrier. |
| `mathlib:Subring.subtype` | `Mathlib/Algebra/Ring/Subring/Defs.lean` | The inclusion ring map from a native subring. |
| `mathlib:RingHom` | `Mathlib/Algebra/Ring/Hom/Defs.lean` | Native bundled ring homomorphisms. |
| `mathlib:RatFunc.eval` | `Mathlib/FieldTheory/RatFunc/AsPolynomial.lean` | Total evaluation of reduced numerator divided by reduced denominator; at a pole its field value is zero. |
| `mathlib:RatFunc.eval_zero` | `Mathlib/FieldTheory/RatFunc/AsPolynomial.lean` | Native evaluation sends zero to zero. |
| `mathlib:RatFunc.eval_one` | `Mathlib/FieldTheory/RatFunc/AsPolynomial.lean` | Native evaluation sends one to one. |
| `mathlib:RatFunc.eval_C` | `Mathlib/FieldTheory/RatFunc/AsPolynomial.lean` | Native evaluation of a constant rational function. |
| `mathlib:RatFunc.eval_X` | `Mathlib/FieldTheory/RatFunc/AsPolynomial.lean` | Native evaluation of the parameter. |
| `mathlib:RatFunc.eval_add` | `Mathlib/FieldTheory/RatFunc/AsPolynomial.lean` | Addition law requires both evaluated denominators nonzero. |
| `mathlib:RatFunc.eval_mul` | `Mathlib/FieldTheory/RatFunc/AsPolynomial.lean` | Multiplication law requires both evaluated denominators nonzero. |
| `mathlib:RatFunc.eval_algebraMap` | `Mathlib/FieldTheory/RatFunc/AsPolynomial.lean` | Evaluation of the image of a polynomial agrees with polynomial evaluation. |
| `mathlib:RatFunc.denom` | `Mathlib/FieldTheory/RatFunc/Basic.lean` | Monic reduced denominator in K[T]. |
| `mathlib:RatFunc.num` | `Mathlib/FieldTheory/RatFunc/Basic.lean` | Corresponding normalized numerator in K[T]. |
| `mathlib:RatFunc.denom_ne_zero` | `Mathlib/FieldTheory/RatFunc/Basic.lean` | Every reduced denominator is nonzero, including the denominator of zero. |
| `mathlib:RatFunc.denom_zero` | `Mathlib/FieldTheory/RatFunc/Basic.lean` | The reduced denominator of zero is one. |
| `mathlib:RatFunc.denom_one` | `Mathlib/FieldTheory/RatFunc/Basic.lean` | The reduced denominator of one is one. |
| `mathlib:RatFunc.denom_algebraMap` | `Mathlib/FieldTheory/RatFunc/Basic.lean` | Every polynomial has reduced denominator one. |
| `mathlib:RatFunc.denom_dvd` | `Mathlib/FieldTheory/RatFunc/Basic.lean` | A nonzero polynomial q is divisible by the reduced denominator exactly when a fraction with denominator q represents the rational function. |
| `mathlib:RatFunc.denom_add_dvd` | `Mathlib/FieldTheory/RatFunc/Basic.lean` | The denominator of a sum divides the product of the input denominators. |
| `mathlib:RatFunc.denom_mul_dvd` | `Mathlib/FieldTheory/RatFunc/Basic.lean` | The denominator of a product divides the product of the input denominators. |
| `mathlib:RatFunc.num_div_denom` | `Mathlib/FieldTheory/RatFunc/Basic.lean` | The normalized fraction represents its rational function. |
| `mathlib:RatFunc.num_ne_zero` | `Mathlib/FieldTheory/RatFunc/Basic.lean` | A nonzero rational function has nonzero numerator. |
| `mathlib:Polynomial.sum` | `Mathlib/Algebra/Polynomial/Basic.lean` | Finite summation over nonzero coefficients. |
| `mathlib:Polynomial.coeff_sum` | `Mathlib/Algebra/Polynomial/Coeff.lean` | Coefficient extraction commutes with polynomial coefficient sums. |
| `mathlib:Polynomial.coeff_monomial` | `Mathlib/Algebra/Polynomial/Basic.lean` | The coefficient formula for a monomial. |
| `mathlib:Polynomial.mem_support_iff` | `Mathlib/Algebra/Polynomial/Basic.lean` | Polynomial support consists exactly of the nonzero coefficient indices. |
| `mathlib:Polynomial.ext` | `Mathlib/Algebra/Polynomial/Basic.lean` | Polynomials are determined by their coefficients. |
| `mathlib:Polynomial.map` | `Mathlib/Algebra/Polynomial/Eval/Defs.lean` | Native polynomial change of coefficients along a ring map. |
| `mathlib:Polynomial.coeff_map` | `Mathlib/Algebra/Polynomial/Eval/Coeff.lean` | Coefficient formula for change of coefficients. |
| `mathlib:Polynomial.map_add` | `Mathlib/Algebra/Polynomial/Eval/Defs.lean` | Change of coefficients preserves addition. |
| `mathlib:Polynomial.map_mul` | `Mathlib/Algebra/Polynomial/Eval/Defs.lean` | Change of coefficients preserves multiplication. |
| `mathlib:Polynomial.evalRingHom` | `Mathlib/Algebra/Polynomial/Eval/Defs.lean` | Polynomial evaluation as a ring homomorphism. |
| `mathlib:Polynomial.toSubring` | `Mathlib/RingTheory/Polynomial/Subring.lean` | A polynomial whose coefficients lie in a native subring is already liftable to a polynomial over that subring. |
| `mathlib:Polynomial.map_toSubring` | `Mathlib/RingTheory/Polynomial/Subring.lean` | Mapping the native subring lift back recovers the original polynomial. |
| `mathlib:Polynomial.eval_prod` | `Mathlib/Algebra/Polynomial/Eval/Defs.lean` | Evaluation of a finite product is the product of evaluations. |
| `mathlib:Polynomial.leadingCoeff_ne_zero` | `Mathlib/Algebra/Polynomial/Degree/Defs.lean` | The leading coefficient is nonzero exactly for nonzero polynomials. |
| `mathlib:Polynomial.coeff_eq_zero_of_natDegree_lt` | `Mathlib/Algebra/Polynomial/Degree/Operations.lean` | Coefficients above natural degree vanish. |
| `mathlib:Polynomial.natDegree_le_iff_coeff_eq_zero` | `Mathlib/Algebra/Polynomial/Degree/Lemmas.lean` | Natural-degree upper bounds characterized by high coefficients. |
| `mathlib:Polynomial.natDegree_eq_of_le_of_coeff_ne_zero` | `Mathlib/Algebra/Polynomial/Degree/Operations.lean` | A degree upper bound is exact if its top coefficient is nonzero. |
| `mathlib:Polynomial.finite_setOfPred_isRoot` | `Mathlib/Algebra/Polynomial/Roots.lean` | A nonzero polynomial over a domain has finitely many roots. |
| `mathlib:Set.Finite.subset` | `Mathlib/Data/Set/Finite/Basic.lean` | A subset of a finite set is finite. |
| `mathlib:Set.Finite.union` | `Mathlib/Data/Set/Finite/Basic.lean` | A union of two finite sets is finite. |
| `mathlib:Set.Finite.exists_notMem` | `Mathlib/Data/Set/Finite/Basic.lean` | An infinite type has an element outside any finite set. |
| `mathlib:Subgroup` | `Mathlib/Algebra/Group/Subgroup/Defs.lean` | Native subgroup carrier and inherited group operations. |
| `mathlib:FreeGroup` | `Mathlib/GroupTheory/FreeGroup/Basic.lean` | Native free group on a generator type, with its universal homomorphism lift. |
| `mathlib:IntermediateField` | `Mathlib/FieldTheory/IntermediateField/Basic.lean` | Native intermediate fields with the inherited algebra structure. |
| `mathlib:IsGalois` | `Mathlib/FieldTheory/Galois/Basic.lean` | Separable and normal field extension, without a finite-degree assumption built into the class. |
| `mathlib:IsGalois.card_aut_eq_finrank` | `Mathlib/FieldTheory/Galois/Basic.lean` | For a finite-dimensional Galois extension, the automorphism group cardinality equals the extension degree. |
| `mathlib:IsGalois.normalAutEquivQuotient` | `Mathlib/FieldTheory/Galois/Basic.lean` | For a normal subgroup of a finite Galois group, the quotient is isomorphic to the Galois group of its fixed field. |
| `mathlib:IsGalois.of_separable_splitting_field` | `Mathlib/FieldTheory/Galois/Basic.lean` | A splitting field of a separable polynomial is a Galois extension. |
| `mathlib:Polynomial.SplittingField` | `Mathlib/FieldTheory/SplittingField/Construction.lean` | Native splitting field of a polynomial, with its canonical algebra structure. |
| `tauceti:TauCeti.BraidGroup` | `TauCeti/GroupTheory/SpecificGroups/Braid.lean` | Artin braid group with generator, far-commutativity and braid relations, and universal homomorphism lift. |
| `mathlib:NumberField.finrank_eq_one_of_unramified` | `Mathlib/NumberTheory/NumberField/ExistsRamified.lean` | An integral closure of Z in a number field which is unramified over Z forces rational degree one. |
| `mathlib:CommAlgCat.FiniteEtale` | `Mathlib/RingTheory/Etale/Finite.lean` | Native full subcategory of commutative R-algebras with finite and etale structure. |
| `mathlib:CategoryTheory.GaloisCategory` | `Mathlib/CategoryTheory/Galois/Basic.lean` | Native Galois-category axioms; scheme instances still have to be established. |
| `mathlib:CategoryTheory.PreGaloisCategory.FiberFunctor` | `Mathlib/CategoryTheory/Galois/Basic.lean` | Native exact finite-set fiber-functor axioms. |
| `mathlib:CategoryTheory.PreGaloisCategory.functorToContAction` | `Mathlib/CategoryTheory/Galois/Equivalence.lean` | The native Galois reconstruction functor is an equivalence for the stated category and fiber functor hypotheses. |
| `mathlib:Subgroup.exists_right_complement'_of_coprime` | `Mathlib/GroupTheory/SchurZassenhaus.lean` | A normal subgroup of coprime cardinality and index has a complement; this declaration does not assert complement conjugacy. |
| `mathlib:AlgebraicTopology.singularChainComplexFunctor` | `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean` | The singular-chain functor with a preadditive coefficient category and coproducts. |
| `mathlib:AlgebraicTopology.singularHomologyFunctor` | `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean` | Singular homology after the additional CategoryWithHomology assumption. |
| `mathlib:MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | The native finitely supported monoid-algebra carrier and convolution product. |
| `mathlib:AlgebraicGeometry.Etale` | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean` | The native etale morphism predicate, with pullback instances and the Scheme.Etale category. |
| `mathlib:AlgebraicGeometry.IsFinite` | `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean` | The native finite scheme morphism predicate, which includes affine morphisms. |
| `mathlib:AlgebraicGeometry.Scheme.Etale` | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean` | The native category of all etale schemes over X; the finite subcategory is the new interface here. |
| `mathlib:frattini` | `Mathlib/GroupTheory/Frattini.lean` | Intersection of maximal subgroups; a finite discrete group specialization is native. |
| `mathlib:Group.IsNilpotent` | `Mathlib/GroupTheory/Nilpotent.lean` | Nilpotence by termination of the upper central series. |
| `mathlib:Group.IsSolvable` | `Mathlib/GroupTheory/Solvable.lean` | Solvability by termination of the derived series, with the current namespaced class. |
