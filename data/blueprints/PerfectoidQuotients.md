# Perfectoid quotients and their prismatic prerequisites

This roadmap constructs universal perfectoid quotients. For a derived p-complete quotient S of an integral perfectoid ring, it constructs the universal map η:S→S_perfd and proves that η is surjective. The geometric application says that a Zariski closed immersion into an affinoid perfectoid space is strongly Zariski closed: its ring map is surjective and its plus ring has the required integral-closure description. The intervening algebra supplies integral perfectoid rings, initial prisms, quasisyntomic lifting and André’s flatness lemma as independently usable results.

The packet has **61 nodes: 3 definitions, 4 constructions, 15 lemmas, 31 theorems, 2 comparisons and 6 applications**. It records **42 API items, 34 definition/construction tests, 3 additional theorem tests, 12 planets and 65 baseline declarations**. The suggested file has **26 full and 10 restricted target signatures**, **20 explicit omissions** and **5 supplier applications**. Its 33 examples include 24 named packet tests and 9 further acceptance examples; the 13 untyped tests belong to the three omitted constructions.

This is a completed **planning pass**, with every target of all seven scoped stages represented. Seven precise gaps and nine supplier requests prevent mathematical closure; every stage is **planned**, and none is **closed**. All declarations have implementation status **unchecked**. Compilation of suggested statements checks their types; it supplies no proofs. The twelve source aggregates from the accepted decomposition remain verbatim as historical evidence and now have an explicit reconciliation to target nodes or existing suppliers. Their historical verdict does not extend to this packet.

## Conventions and the pinned libraries

Fix a prime p. Rings are commutative and unital, and the zero ring is allowed. An integral perfectoid ring uses the normalization of BMS2 Definition 4.18: ordinary p-adic completeness and separation, a π satisfying π^p=pu for a unit u, surjective Frobenius modulo p, and principal kernel of Fontaine’s map. The generator is not orientation data in the predicate. Its distinguished-coordinate and nonzerodivisor properties are theorems.

Ordinary completion means the inverse limit of ordinary ideal-power quotients. Derived completion is the DD.1 construction in its derived or animated category. Completeness for a chosen pseudouniformizer is a separate condition. None of these is identified by an unstated torsion assumption. For an ordinary module, the Stacks criterion 091P expresses derived p-completeness as bijectivity of the map on sequences (a_n)↦(a_n−p a_(n+1)). The suggested semiperfectoid predicate uses this concrete specialization, with a fixed universe for presentations. The generic notion and its comparisons remain DD.1-owned.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Mathlib supplies Witt vectors, Frobenius, Teichmüller representatives, inverse perfection, the multiplicative untilt, Fontaine’s map, ordinary adic completion, ideals and quotients, localization and integral closure. The reviewed AUDIT-38 and REV-AUDIT-38 were read directly because the coverage index in this snapshot has no PerfectoidQuotients entries. Every baseline declaration cited here was checked by reading its statement and enclosing hypotheses at the pinned commit. A directory named Perfectoid does not establish that the general predicate or prism correspondence is implemented.

The pinned PreTilt(R,p) is inverse perfection of R/p. Its zeroth coordinate maps toward R/p; PerfectClosure is a different direct construction adjoining roots. The Fontaine map W(PreTilt(R,p))→R requires the actual nonunit-p and p-completeness instances. Its reduction formula, evaluation on Teichmüller representatives and surjectivity under Frobenius surjectivity already exist. They are reused. The zero-ring branch of the integral predicate is explicit because the pinned PreTilt ring instance demands characteristic exactly p. This creates no mathematical restriction: a separated p-complete ring in which p is a unit is subsingleton.

## The integral prefix: Q0 and Q0:integral-algebra

The broad Q0 stage combines the independent integral prefix with its prism applications. The prefix defines the integral predicate and proves its invariance under ring equivalence. A ring map between complete rings preserves p-adic congruences; the sharp formula modulo p^(n+1) gives untilt naturality. To compare Fontaine maps, first reduce to a p-nilpotent target, apply the baseline equality criterion on Teichmüller representatives, and then use separation. Nilpotence is asserted only in the quotient target.

In characteristic exactly p, integral perfectoidness is equivalent to PerfectRing. The proof retains the principal θ-kernel condition. Write p=ξa in the Witt ring, compare its first two coordinates and use the unit criterion for inverse perfection. This makes a a unit and identifies ker θ with (p). The computation occurs in W(R♭); p is zero in R, so cancellation in R would be invalid. The tests distinguish the zero ring and finite products from a domain definition, and distinguish surjective Frobenius from perfectoidness using PerfectClosure(F₂[t],2)/(t).

BMS1 Definition 3.5 allows an initially ϖ-adic complete ring with ϖ^p dividing p. Its normalization to the BMS2 carrier is a comparison theorem, not a rewritten definition. Česnavičius Definition 4.2 is the p-torsion-free specialization with (π^p)=(p) and an isomorphism R/π→R/p. The more general R/ϖ→R/ϖ^p criterion is BMS1 Lemma 3.10. G1 records the exact completion and torsion-removal transports. The finite length-reducing Witt Frobenius maps of Lemma 3.9 require the Davis–Kedlaya interfaces requested from PR.0; infinite Witt Frobenius does not replace them.

For a generator ξ of ker θ, Witt coordinate one is a unit, and ξ is a nonzerodivisor. Three retained elementary Witt-quotient lemmas show that p² dividing ξg forces p to divide g, that p²f∈(ξ) forces pf∈(ξ), and that all p-primary torsion in W(k)/(ξ) is killed by p. They assume k perfect of characteristic p and a unit first coordinate, without a domain hypothesis. The first two Witt coordinates are not the first two Teichmüller digits. These lemmas give the elementary proof of R[p^∞]=R[p], avoiding the v-descent proof of BMS2 Proposition 4.19.

The cotangent theorem has two precise uses. For a map R→S of integral perfectoid rings, the full relative cotangent complex vanishes after derived p-completion. The proof uses the Tor-independent Fontaine square and cotangent base change, not only Kähler differentials. For one integral perfectoid R, the completion of L_R/ℤ_p is rank one in degree −1: transitivity through A_inf(R) and its regular θ-kernel identifies it with (ker θ/(ker θ)²)[1]. A chosen generator gives R[1]. This is the input for DD.5’s quasiregular semiperfectoid theory; those predicates stay with DD.5.

Česnavičius–Scholze supply the ring operations needed before prism applications. Integral perfectoid rings are reduced. Compatible roots have the same annihilator, and power torsion for a compatible-root element is killed by that element. Removing ϖ-power torsion produces a torsion-free integral perfectoid quotient with the prescribed tilt and fibre-product description. The p-integral closure of A inside B is the least intermediate subring closed under taking pth roots in B. The infimum definition uses actual Subring carriers and agrees with successive root adjunction. Its API gives inclusion, root closure, minimality, idempotence, monotonicity and containment in ordinary integral closure. The F₂[T²] and F₂[T³] tests distinguish p-root closure from ordinary integral closure.

The localization criterion retains its nonzerodivisor hypothesis: injectivity of the p-power map A/ϖ→A/ϖ^p is equivalent to p-root closedness of A in A[1/ϖ]. With a compatible root tower and surjective quotient p-power map, the completed p-integral closure is perfectoid. The five ring operations include completed root-polynomial algebras, completed tensor products, suitable completed root-stable quotients, arbitrary products and finite sharp-ideal completions. Their topology, tilt comparison and derived/classical comparisons are stated separately. Étale extensions and henselizations have the independent Anschütz–Le Bras route through unique δ-extensions and complete algebraization.

The Tate/powerbounded adapter is imported from P1 through its exact existing nodes for BMS1 Lemmas 3.20–3.21 and Česnavičius §4.8. No second Tate-perfectoid predicate is constructed here. Bhatt’s fixed-field integral model is a further comparison: K is a specified perfectoid field, t has its compatible roots, and a model is K°-flat, t-complete and saturated. A raw completed colimit can be only almost isomorphic to the saturated model. Saturation cannot be dropped.

## Imported prism algebra: Q0:animated-application and Q1

PR.0 owns δ-rings, distinguished elements, prisms, completed prism perfection and the perfect-prism/perfectoid correspondence. PR.1 owns the prismatic site, smooth prismatic cohomology, the Hodge–Tate comparison and the initiality of a perfect prism over its perfectoid reduction. E5:animation owns animated commutative rings. DD.0 owns the full cotangent complex and derived exterior powers; DD.1 owns derived completion and complete flatness. Q0:animated-application and Q1 are explicit application nodes using the exact supplier identifiers.

The proof of perfect-prism initiality must keep δ-compatible deformation theory in the presence of p-torsion. Arbitrary Frobenius lifts are insufficient. The supplier’s completed perfection can start from an orientation that is a zero divisor before completion. No proof here assumes the stronger uncompleted property. Supplier packets with needs_changes reviews remain planned imports; their existence is not baseline implementation and their unresolved carriers are G2.

## Universal prisms and perfectoidization: Q2

A semiperfectoid ring S is an ordinary derived p-complete ring admitting a surjection R→S from an integral perfectoid ring. The presentation is a witness to the property. A quotient presentation by itself does not establish derived completeness. The bounded-torsion comparison of ordinary and derived completeness is requested in the generality of ordinary modules; the supplier’s complete-flat criterion alone does not supply that general comparison.

For S, Proposition 7.2 constructs an initial object in the category of all prisms receiving a map S→A/I, with no boundedness restriction. Starting from A_inf(R) and its principal θ-kernel, force the presentation kernel to become divisible by the orientation. Kill orientation-power torsion as a δ-stable ideal, take H⁰ of derived completion and repeat along a sufficiently regular ordinal. The fixed-size and stationarity arguments are G3. The structure map, unique lift, functor laws and presentation independence are part of the planned API. The QRSP case uses the existing PR.2 theorem; it is not the definition of the general initial object.

Completed perfection of this initial prism gives S_perfd, the universal integral perfectoid ring under S. Its API consists of the unit, perfectoidness, lift and lift uniqueness, functoriality, the identity on perfectoid rings and presentation independence. The typed prototype chooses an actual ring equipped with the actual integral predicate and its specified universal mapping property; its existence is a theorem with a proof placeholder. The prism formula is explicitly omitted until the PR.0 carrier exists. No unspecified proposition field stands in for that carrier.

The generic derived prismatic construction and conjugate/Hodge–Tate filtration are PR.2 imports. Crucially, the supplier condition is that the Hodge–Tate reduction Δ̄ is concentrated in degree zero. Under this hypothesis Δ is discrete and orientation-torsion-free, acquires a δ-structure and is weakly initial; the initial object is an idempotent retract. Discreteness of Δ alone is not the hypothesis, and weak initiality does not assert initiality. Regular Koszul quotients with bounded p-primary torsion and QRSP rings are the cases where the supplier identifies the initial object.

The base-change contract needed for surjectivity uses the completed derived pushout of perfectoid algebras, PR.0 Tor independence and the universal property. G5 is the cofiber comparison that then permits DD.1 complete-flat descent. It imposes no new bounded-torsion assumption on S. Proposition 8.5 and arc descent use Theorem 7.4 and therefore cannot be inputs to this contract.

For an arbitrary ideal J of integral perfectoid R with derived-complete R/J, finite generated-ideal quotients are derived complete by the weak Serre property. Their completed animated colimit is R/J. Perfectoidization preserves this colimit in the category of perfectoid rings, whose completed carrier must be computed. G6 asks for its identification with the ordinary p-completion of R modulo the union of the compatible finite-stage kernels, with the canonical units. The universal property alone does not identify a raw ring colimit with that completed carrier.

## Quasisyntomic lifting and André extensions: Q3

The lifting theorem of Proposition 7.11 says that a quasisyntomic A/I-algebra R over a bounded prism has a prism lift with R→B/IB p-completely faithfully flat and A→B (p,I)-completely flat. The stated faithful-flatness hypothesis on A/I→R gives faithful flatness on A→B. Completed perfection over a perfect base preserves these assertions. RS-01 assigns this theorem to Q3, but the current PR.2 packet already has its node. This pass imports it through an application and proposes an identifier-preserving relocation, rather than planning a second theorem.

The relative smooth-site cover uses the full completed cotangent vanishing and the Hodge–Tate comparison to produce a relatively perfect discrete δ-algebra. The cover statement is quantified over test prisms: each receives a faithfully flat refinement mapping from the cover. The Frobenius-flat perfection-cover step needs the precise regular-reduction criterion from PR.0, rather than Kunz without its hypotheses.

André’s theorem produces a p-completely faithfully flat perfectoid extension in which every monic polynomial has a root. Root iteration yields adjacent compatible p-power roots. Limits require the completed carrier, finite descent of polynomial coefficients and preservation of faithful flatness; those are G4. The additional assertion that the map is ind-syntomic modulo p is a separate target. Its proof uses characteristic-p divided-power envelopes and nilpotent thickenings, with ordinary syntomic finite stages. The stronger ordinary ind-syntomic extension in Česnavičius–Scholze §2.3.4 remains in the integral-perfectoid Part II.

Bhatt’s earlier method is recorded in its fixed-field setting. Form rational neighborhoods of T−g in a perfectoid root-polynomial algebra, use their powerbounded integral models, and take the properly completed limit followed by saturation. P2 provides rational localization and approximation; P4 provides the universal closed space; P0 supplies the specified root-ideal almost category. The raw completed root extension is only almost isomorphic to the saturated integral model. Its almost faithful flatness does not become ordinary faithful flatness. The functorial almost absolutely integrally closed extension is a further target. The now-acquired lecture-notes Corollary 9.4.7 supplies its polynomial-indexed coproduct and ω₁ construction. The monic-root version uses the same rational approximation and the finite-free algebra of a positive-degree monic polynomial. At ω₁, countable filteredness makes the raw plus-ring colimit already complete, so every finite list of polynomial coefficients comes from a stage whose successor has a root. The P0/P5 and DD.1 interfaces are explicit suppliers.

## Surjectivity and analytic quotients: Q4

In characteristic p, Frobenius on a quotient of a perfect ring is always surjective, and the quotient is perfect exactly when its ideal is radical. Thus the universal perfectoid quotient of R/I is R/√I. This distinguishes universal perfectoidization from declaring every quotient perfectoid. The compatible-root ideal computation recovers the radical of a principal ideal in a perfect characteristic-p ring.

The principal mixed-characteristic calculation is also explicit. Given compatible f_n with f₀=f, the ordinary p-completion B of R/(f_n:n≥0) is perfectoid by the root-stable quotient theorem. Every map R/(f)→T to a perfectoid T kills the f_n because T is reduced and extends through completion. The resulting isomorphism S_perfd≅B identifies the canonical unit.

Surjectivity onto this completed quotient already follows from the pinned library. AdicCompletion.map_surjective preserves every surjective module map, without Noetherian or finite-generation assumptions. AdicCompletion.of_surjective covers the completion of R by R, and map_of identifies the composite with the canonical quotient-completion map. Transporting the image of (p) identifies the module completion with ordinary p-completion of R/(f_n). Consequently R→B, and hence R/(f)→B, is surjective. The root ideal need not be closed or finitely generated. This is no longer an image gap.

For general S=R/J, finite induction reduces one generator at a time after passing through the previous universal quotient. André supplies roots after a p-completely faithfully flat extension; G5 justifies base change and descent. G6 supplies the completed filtered-colimit computation for arbitrary J. These are precise outstanding inputs to Theorem 7.4, whose target is typed without adding those proof obligations as hypotheses.

For a perfectoid Tate pair (R,R⁺) and any ideal I⊂R, choose a compatible-root pseudouniformizer ϖ and form the ordinary ϖ-completion S of R⁺/(I∩R⁺). The pinned completion-surjectivity theorem and completeness of R⁺ make R⁺→S surjective, without assuming I closed or finitely generated. Principal-ideal classical completeness implies derived ϖ-completeness by Stacks 091T. Because ϖ^p divides p, every complex over S[1/p] is a complex over S[1/ϖ]; the orthogonality criterion 091P(2) gives derived p-completeness. Thus S has its semiperfectoid presentation. Form S_perfd and invert ϖ; both algebraic maps are surjective, so R→R_I is surjective. G7 retains the topology, Tate localization and minimal open integrally closed plus-ring comparison on the actual analytic carriers. P4’s almost-surjectivity map is R⁺→R_I⁺. This direction corrects the printed ECD Definition 5.7 through the existing source-issue record.

## Declaration catalogue

The catalogue states every target, its proof route, direct prerequisites and acceptance properties. API and test names are proposed library names. A signature marked **restricted** has the exact omissions stated; **omitted** means a comment in the suggested file, not an elaborated declaration. **Import** nodes preserve their suppliers’ names and ownership. The packet is the machine-readable counterpart of this document.

## Q0 — overview of the integral prefix and prism applications

This overview stage is realized by the integral-perfectoid predicate and the imported prism-and-animation contract of its two sublayers. It creates no additional declaration.

## Q0:animated-application — prism and animation imports

### Perfect-prism and animated algebra interfaces

Identifier: `PerfectoidQuotients:Q0:animated-application/prism-and-animation-import-contract`. Kind: **application**. Suggested coverage: **import**.

Q0 imports δ-rings and their free and universal quotient constructions; prisms with an invertible Cartier ideal, derived (p,I)-completeness and p in I+φ(I); boundedness, orientations and rigidity J=IB; completed perfection and the equivalence (A,I) ↦ A/I with integral perfectoid rings. It also imports regular prismatic envelopes with their boundedness, complete-flatness and Koszul-regularity hypotheses. For integral perfectoid R, (A_inf(R),ker θ) is initial among all prisms under R (BS22 Lemma 4.8), not only bounded prisms. Animated commutative rings, the cotangent complex, derived exterior powers and derived completion are imported on their genuine simplicial/derived carriers.

Conventions and hypotheses: p is prime; the precise hypotheses of every imported supplier node are part of this contract.

Proof or construction route:

1. Use the named supplier nodes, once, on their actual carriers. This node records their application and reexport; it defines no second generic object.
2. Check the supplier hypotheses before instantiation. A blueprint supplier is planned mathematics, never a baseline implementation. Supplier reviews and unavailable Lean carriers remain in the gap register.

Acceptance:

- The perfection ideal need not be Cartier before completion; use the corrected PR.0 node.
- No strict commutative differential graded algebra replaces animated rings in characteristic p.
- The zero integral ring corresponds to the trivial perfect prism.

Direct prerequisites: `PrismaticCohomology:PR.0/delta-frobenius-dictionary`, `PrismaticCohomology:PR.0/free-delta-ring`, `PrismaticCohomology:PR.0/delta-ideal-closure`, `PrismaticCohomology:PR.0/delta-universal-quotient`, `PrismaticCohomology:PR.0/distinguished-element`, `PrismaticCohomology:PR.0/prism`, `PrismaticCohomology:PR.0/prism-category`, `PrismaticCohomology:PR.0/rigidity-prism-ideal`, `PrismaticCohomology:PR.0/prism-perfection`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`, `PrismaticCohomology:PR.0/regular-prismatic-envelopes`, `PrismaticCohomology:PR.0/perfectoid-tor-independence`, `PrismaticCohomology:PR.1/perfect-prism-initial`, `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`, `EnhancedDerivedSheaves:E5:animation/sifted-colimits`, `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `PrismaticCohomology:PR.0/bounded-prism-complete-flatness`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), §§2–4; Lemma 3.9, Theorem 3.10 and Lemma 4.8, pp.31–32,38–39. Source milestones are reexported through their existing owners, not reconstructed here.

Suggested-file boundary: Application/reexport only. All generic declarations retain the exact supplier names listed in prerequisites; this file defines no second generic carrier.

## Q0:integral-algebra — integral perfectoid algebra

### Integral perfectoid rings

Identifier: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`. Kind: **definition**. Suggested coverage: **full**.

Fix a prime p. A commutative ring R is integral perfectoid if it is the zero ring, or p is not a unit, R is classically p-adically complete and separated, there are π∈R and a∈R× with π^p=pa, Frobenius on R/p is surjective, and ker(θ:W(PreTilt(R,p))→R) is generated by one element. θ, PreTilt and W are the existing Mathlib constructions. The nonzero branch is exactly BMS2 Definition 4.18; completeness forces nonunit p for every nonzero R. No chosen generator, δ-structure, prism or desired comparison theorem is a field of the predicate.

Proposed declaration: `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid`.

Conventions and hypotheses: p is prime; all rings are commutative and unital. The zero ring is allowed. The integral predicate is independent of a topology on a Tate localization. Its p-adic completeness includes separation.

Proof or construction route:

1. Use the existing PreTilt, Fontaine map and ideal span in the nonunit-p branch. The zero-ring branch is explicit because the pinned PreTilt ring instance uses a nontrivial characteristic-p quotient.
2. If a p-adically complete ring has p invertible, its p-adic ideal is top and IsAdicComplete.subsingleton makes it the zero ring; thus the branch condition does not exclude an object of BMS2.
3. The original aggregate identifier is retained for this single definition. Quasisyntomic and quasiregular semiperfectoid predicates are transferred to their DD.0/DD.5 supplier contracts; their accepted source statements remain in inheritedWork.

API:

- `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.of_subsingleton` (example): Every zero ring is integral perfectoid.
- `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.complete` (projection): An integral perfectoid R is classically p-adically complete and separated.
- `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.has_p_root` (projection): There exist π in R and a unit a with π^p=pa.
- `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.iff_nontrivial` (characterisation): With the existing nonunit-p and completeness instances, the predicate is exactly the root condition, Frobenius surjectivity on ModP, and a principal kernel of the existing Fontaine map.
- `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.congr` (equivalence): A ring equivalence R≃S preserves and reflects the predicate, with p fixed.
- `TauCeti.PerfectoidQuotients.integralPerfectoid_iff_perfect` (compatibility): For a ring of characteristic exactly p, integral perfectoidness is equivalent to Mathlib PerfectRing R p.

Uses:

- **PrismaticCohomology:PR.0 and AInfCohomology:AI.0**: The integral predicate supplies the ring side of the perfect-prism correspondence and θ-kernel hypotheses without assuming those theorems.
- **BS22 Notation 7.1 and Theorem 7.4**: Semiperfectoid presentations begin with a surjection from a ring satisfying precisely this integral predicate.
- **PerfectoidSpaces:P1/integral-perfectoid-comparison**: Compare the BMS2 normalization with BMS1 and the existing Tate/plus-ring carrier, with boundedness in the converse.

Unit tests:

- `TauCeti.PerfectoidQuotients.zeroRing` (degenerate): ZMod 1 is integral perfectoid for every prime p.
- `TauCeti.PerfectoidQuotients.primeField` (computation): ZMod p is integral perfectoid for every prime p.
- `TauCeti.PerfectoidQuotients.zmodFour` (non-example): ZMod 4 is not integral perfectoid at p=2: no π and odd unit a satisfy π²=2a.
- `TauCeti.PerfectoidQuotients.polynomial` (non-example): F₂[t] is not integral perfectoid at 2: Frobenius misses t.
- `TauCeti.PerfectoidQuotients.dualNumbers` (non-example): TrivSqZeroExt F₂ F₂ is not integral perfectoid: its nonzero square-zero element is not a square.
- `TauCeti.PerfectoidQuotients.semiperfectNotPerfect` (non-example): If A=PerfectClosure(F₂[t],2) and t denotes the image of the polynomial variable, A/(t) is not integral perfectoid although its squaring map is surjective. The class t^(1/2) is nonzero and square-zero.
- `TauCeti.PerfectoidQuotients.semiperfectSquaring` (characterisation): Squaring is surjective on PerfectClosure(F₂[t],2)/(t); this separates the principal-kernel condition from Frobenius surjectivity.
- `TauCeti.PerfectoidQuotients.productField` (computation): F_p × F_p is integral perfectoid, so a domain or valuation-ring condition would be too strong.
- `TauCeti.PerfectoidQuotients.perfectRingAgreement` (compatibility): Every ring of characteristic p with the baseline PerfectRing instance satisfies the predicate.

Acceptance:

- The zero ring, F_p and F_p×F_p pass. Z/4, F₂[t], dual numbers and the semiperfect root quotient fail for distinct stated reasons.

Direct prerequisites: `mathlib:IsAdicComplete`, `mathlib:IsAdicComplete.subsingleton`, `mathlib:PreTilt`, `mathlib:WittVector.fontaineTheta`.

Source: [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2), Definition 4.18, p.22. Exact definition; the zero-ring separation is a library-interface adaptation, not a change of mathematical scope.

Atlas planet: **Integral perfectoid rings**.

### The nonzero integral-perfectoid criterion

Identifier: `PerfectoidQuotients:Q0:integral-algebra/integral-perfectoid-nontrivial-criterion`. Kind: **lemma**. Suggested coverage: **full**.

If p is not a unit in the classically p-complete ring R, integral perfectoidness is equivalent to the three remaining BMS2 conditions: π^p=pa for a unit a, surjective Frobenius on ModP R p, and principal ker θ.

Proposed declaration: `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.iff_nontrivial`.

Conventions and hypotheses: p prime; the actual nonunit-p and IsAdicComplete instances are supplied.

Proof or construction route:

1. The nonunit assumption rules out the subsingleton branch, because every element of a zero ring is a unit.
2. Unpack the existential proof instances and use proof irrelevance; the Fontaine map and its ideal do not depend on which proofs supply the instances.

Acceptance:

- Changing witnesses for completeness or nonunit p does not change the predicate.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

Source: [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2), Definition 4.18, p.22. API promotion used in the characteristic-p equivalence.

### Units in inverse perfection

Identifier: `PerfectoidQuotients:Q0:integral-algebra/inverse-perfection-unit-criterion`. Kind: **lemma**. Suggested coverage: **full**.

For a ring R of characteristic p and x∈Perfection(R,p), x is a unit if and only if its zeroth coordinate is a unit.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfection_isUnit_iff`.

Conventions and hypotheses: p prime; R a commutative ring of characteristic p; no surjectivity of its Frobenius is assumed.

Proof or construction route:

1. A ring map preserves units, giving the forward implication.
2. If x₀ is a unit, each x_n is a unit because x_n^(p^n)=x₀. Their inverses form a compatible Frobenius sequence; pointwise multiplication exhibits the inverse of x in the existing Perfection ring.

Acceptance:

- A sequence with zeroth coordinate 1 is a unit. This is inverse-limit perfection, not adjoining roots by a direct limit.

Direct prerequisites: `mathlib:Perfection.coeff_pow_p`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemma 3.10 proof, p.23, unit detection in S♭. The proof uses unit detection in the inverse limit; the general statement is extracted from the coordinate argument.

### Units in Witt vectors over a perfect ring

Identifier: `PerfectoidQuotients:Q0:integral-algebra/perfect-witt-unit-criterion`. Kind: **lemma**. Suggested coverage: **full**.

For a perfect ring k of characteristic p, w∈W(k) is a unit if and only if w₀ is a unit of k.

Proposed declaration: `TauCeti.PerfectoidQuotients.witt_isUnit_iff`.

Conventions and hypotheses: k is an arbitrary perfect commutative ring of characteristic p, not necessarily a field.

Proof or construction route:

1. The constant-coefficient map preserves units. For the converse lift an inverse of w₀ through the surjective constant-coefficient map.
2. The product differs from 1 by an element of (p), by the baseline kernel formula. Witt p-adic completeness puts (p) in the Jacobson radical. The baseline Jacobson unit criterion makes the product a unit, and hence w is a unit.

Acceptance:

- p is not a unit in W(k) when k has characteristic exactly p; 1+p is a unit.

Direct prerequisites: `mathlib:WittVector.ker_constantCoeff`, `mathlib:WittVector.constantCoeff_surjective`, `mathlib:WittVector.isAdicCompleteIdealSpanP`, `mathlib:IsAdicComplete.le_jacobson_bot`, `mathlib:Ideal.isUnit_of_sub_one_mem_jacobson_bot`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemma 3.10 proof, p.23, deduction that a is a unit. Supplies the general-ring unit test used by the kernel-generator argument; the pinned DVR file only has a field-specialized test.

### The first Witt product coordinate in characteristic p

Identifier: `PerfectoidQuotients:Q0:integral-algebra/witt-product-first-coordinate`. Kind: **lemma**. Suggested coverage: **full**.

For x,y∈W(k) with k of characteristic p, (xy)₁=x₀^p y₁+x₁ y₀^p.

Proposed declaration: `TauCeti.PerfectoidQuotients.witt_mul_coeff_one`.

Conventions and hypotheses: p prime; k a commutative characteristic-p ring. Perfection of k is not needed.

Proof or construction route:

1. Compute the first two universal Witt multiplication polynomials over the integer polynomial ring using ghost degrees zero and one. The degree-one expression is x₀^p y₁+x₁ y₀^p+p x₁y₁.
2. Evaluate in k; its characteristic-p hypothesis kills the last term. Cancellation of p is used only in the universal torsion-free polynomial calculation.

Acceptance:

- The formula remains valid over nonreduced characteristic-p rings; it must not be asserted over an arbitrary mixed-characteristic coefficient ring.

Direct prerequisites: `mathlib:WittVector.mul_coeff`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemma 3.10 proof, p.23, first two Witt coordinates of ξ′a. The displayed degree-one coordinate is exactly the formula used here.

### A principal θ-kernel in characteristic p is generated by p

Identifier: `PerfectoidQuotients:Q0:integral-algebra/theta-kernel-characteristic-p`. Kind: **lemma**. Suggested coverage: **full**.

Let R have characteristic p. Assume the pinned completeness and nonunit-p instances and that ker θ is principal. Then ker θ=(p) inside W(PreTilt(R,p)). Frobenius surjectivity on R is not required for this implication.

Proposed declaration: `TauCeti.PerfectoidQuotients.theta_kernel_charP`.

Conventions and hypotheses: p prime; R a commutative characteristic-p ring with the indicated instances.

Proof or construction route:

1. Choose ξ generating ker θ. Since p maps to zero, write p=ξa. The existing θ-mod-p formula gives c₀(ξ₀)=0, where c₀:PreTilt(R,p)→R/p.
2. Apply c₀ to the first Witt product coordinate. Since p₁=1, obtain 1=c₀(ξ₁)c₀(a₀)^p. Thus c₀(a₀) is a unit.
3. The inverse-perfection unit criterion makes a₀ a unit; the perfect-Witt unit criterion makes a a unit. Therefore ξ and p generate the same ideal. This is the characteristic-p specialization of the generator argument, so no general prism correspondence is imported.

Acceptance:

- No p-torsion cancellation is performed in R. The conclusion concerns the kernel in its Witt ring.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/inverse-perfection-unit-criterion`, `PerfectoidQuotients:Q0:integral-algebra/perfect-witt-unit-criterion`, `PerfectoidQuotients:Q0:integral-algebra/witt-product-first-coordinate`, `mathlib:WittVector.mk_fontaineTheta`, `mathlib:WittVector.coeff_p_one`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemma 3.10 proof, p.23, and Example 3.15, p.24. Specializes the primitive-generator proof to π=0; all coefficient steps are recorded separately.

### Injectivity of the characteristic-p tilt projection

Identifier: `PerfectoidQuotients:Q0:integral-algebra/tilt-projection-injective-characteristic-p`. Kind: **lemma**. Suggested coverage: **full**.

Under the hypotheses of the preceding kernel lemma, the zeroth-coordinate map PreTilt(R,p)→R/p is injective.

Proposed declaration: `TauCeti.PerfectoidQuotients.tilt_projection_injective_charP`.

Conventions and hypotheses: R has characteristic exactly p; ker θ principal; existing θ hypotheses.

Proof or construction route:

1. If x has zeroth coordinate zero, θ([x]) is zero because R/p=R and the baseline θ-mod-p formula identifies its reduction.
2. Then [x] belongs to ker θ=(p). The baseline constant-coefficient kernel formula forces x=0. A ring homomorphism with zero kernel is injective.

Acceptance:

- For a semiperfect nonreduced ring the projection is surjective but not injective, so its θ-kernel cannot be principal.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/theta-kernel-characteristic-p`, `mathlib:WittVector.mk_fontaineTheta`, `mathlib:WittVector.ker_constantCoeff`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Example 3.15, p.24. Expands the equality S=A_inf(S)/p=S♭ into the missing injectivity declaration.

### Naturality of the multiplicative untilt

Identifier: `PerfectoidQuotients:Q0:integral-algebra/untilt-naturality`. Kind: **lemma**. Suggested coverage: **full**.

For a ring map f:R→S between classically p-complete rings with p nonunit, let g:R/p→S/p commute with the quotient maps and f. For every x∈PreTilt(R,p), f(x♯)=(Perfection.map(g)(x))♯.

Proposed declaration: `TauCeti.PerfectoidQuotients.untilt_natural`.

Conventions and hypotheses: p prime; the commuting reduction square is a hypothesis and is retained in the suggested signature.

Proof or construction route:

1. Choose lifts of each coordinate of x. Their images under f lift the corresponding coordinates of Perfection.map(g)(x), by the commuting square.
2. The baseline Teichmüller congruence determines each sharp modulo p^(n+1) by the p^n-th power of a lift. Apply f to those congruences.
3. p-adic separation of S identifies the two elements. No topological structure is added: a ring map sends p^nR into p^nS.

Acceptance:

- For identity and composite ring maps the equality agrees with the existing Perfection.map functoriality.

Direct prerequisites: `mathlib:PreTilt.untilt`, `mathlib:Perfection.map`, `mathlib:Perfection.coeff_map`, `mathlib:Perfection.teichmuller_sModEq`, `mathlib:IsHausdorff.eq_iff_smodEq`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Definition 3.1 and Lemma 3.2 statement, p.19; naturality of the construction. Packet-derived functoriality from the baseline congruence formula; no unread proof of Lemma 3.2 is claimed.

### Naturality of Fontaine’s map

Identifier: `PerfectoidQuotients:Q0:integral-algebra/theta-naturality`. Kind: **lemma**. Suggested coverage: **full**.

With f and g as in untilt naturality, f(θ_R(w))=θ_S(W(g♭)(w)) for all w∈W(PreTilt(R,p)).

Proposed declaration: `TauCeti.PerfectoidQuotients.theta_natural`.

Conventions and hypotheses: The two rings are classically p-complete, p is nonunit in each, and g is the map induced by f modulo p.

Proof or construction route:

1. Reduce both ring maps to S/p^n. The prime is nilpotent in that target.
2. Use the baseline equality criterion for maps out of Witt vectors into a p-nilpotent ring: equality on Teichmüller representatives suffices. θ([x])=x♯ and untilt naturality give that equality.
3. Apply p-adic separation of S. The nilpotence hypothesis is used only after reduction, never asserted in S.

Acceptance:

- The reduction square is essential; the prototype explicitly includes it rather than allowing Lean to drop an unused section hypothesis.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/untilt-naturality`, `mathlib:WittVector.map`, `mathlib:WittVector.fontaineTheta_teichmuller`, `mathlib:WittVector.eq_of_apply_teichmuller_eq`, `mathlib:IsHausdorff.eq_iff_smodEq`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), §3.1, Definition 3.1 and Lemma 3.4, pp.19–21. Ring-map naturality is derived from the existing Mathlib construction; Lemma 3.4 supplies the surrounding θ convention, not a verbatim statement of this lemma.

### Invariance under ring equivalence

Identifier: `PerfectoidQuotients:Q0:integral-algebra/integral-perfectoid-ring-equivalence`. Kind: **lemma**. Suggested coverage: **full**.

For every ring equivalence e:R≃S, integral perfectoidness of R at p is equivalent to that of S at p.

Proposed declaration: `TauCeti.PerfectoidQuotients.IsIntegralPerfectoid.congr`.

Conventions and hypotheses: p prime; commutative unital rings; the zero ring is included.

Proof or construction route:

1. Transport the subsingleton case directly. Otherwise transport completeness along the bijection of p-adic congruence systems, and the root/unit and Frobenius-surjectivity conditions along e.
2. The induced maps modulo p, on inverse perfection, and on Witt vectors are equivalences because the inverse ring map gives their inverses. θ naturality identifies the two kernels, so principal generation transfers in both directions.

Acceptance:

- Changing the presentation of F_p or its finite product does not change perfectoidness.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/theta-naturality`, `mathlib:Ideal.quotientMap`, `mathlib:Perfection.map`, `mathlib:WittVector.map`, `mathlib:IsAdicComplete`.

Source: [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2), Definition 4.18, p.22. A presentation-independent predicate on rings; the transport proof uses the named naturality nodes.

### Integral perfectoidness in characteristic p

Identifier: `PerfectoidQuotients:Q0:integral-algebra/characteristic-p-perfectoid-criterion`. Kind: **theorem**. Suggested coverage: **full**.

A commutative ring of characteristic exactly p is integral perfectoid if and only if it satisfies Mathlib PerfectRing R p, namely bijectivity of the p-th-power map.

Proposed declaration: `TauCeti.PerfectoidQuotients.integralPerfectoid_iff_perfect`.

Conventions and hypotheses: p prime; characteristic exactly p gives a nonzero ring. The zero-ring statement is separately part of the definition API.

Proof or construction route:

1. For a perfectoid R, use the nontrivial criterion. Frobenius surjectivity gives surjectivity of the tilt projection by Perfection.coeff_surjective. The principal-kernel lemma gives injectivity. Thus R/p=R is isomorphic to its perfect inverse perfection.
2. Conversely, if R is perfect, the projection from its inverse perfection is bijective: existence uses successive unique roots, and uniqueness follows from injectivity of their powers.
3. Under R/p=R, the existing θ formula is the constant-coefficient map followed by this bijection. Its kernel is (p) by the baseline Witt kernel formula. The p-adic ideal is zero, so R is complete, and π=0 with unit 1 supplies the root condition.

Acceptance:

- F_p×F_p passes; F₂[t] and F₂[ε]/ε² fail. The semiperfect quotient of the perfect closure of F₂[t] also fails.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/integral-perfectoid-nontrivial-criterion`, `PerfectoidQuotients:Q0:integral-algebra/tilt-projection-injective-characteristic-p`, `mathlib:Perfection.coeff_surjective`, `mathlib:PerfectRing`, `mathlib:Perfection.lift`, `mathlib:WittVector.mk_fontaineTheta`, `mathlib:WittVector.ker_constantCoeff`, `mathlib:IsAdicComplete`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Example 3.15, p.24, with Lemma 3.10 proof, p.23. Exact characteristic-p equivalence, expanded to the pinned carriers.

Atlas planet: **Perfect rings of characteristic p**.

### Detecting a factor modulo p from a Witt product

Identifier: `PerfectoidQuotients:Q0:integral-algebra/witt-product-p-square-detection`. Kind: **lemma**. Suggested coverage: **full**.

If p squared divides xi times g in W(k), and Witt coordinate one of xi is a unit, then p divides g. There is no condition on coordinate zero of xi and no assumed nonzerodivisor property of xi.

Proposed declaration: `TauCeti.Perfectoid.witt_p_sq_dvd_mul_detects_p`.

Conventions and hypotheses: p is prime; k is a commutative perfect ring of characteristic p; xi belongs to W(k); its Witt coordinate xi_1 is a unit in k.

Proof or construction route:

1. Apply the pinned Teichmuller expansion theorem at precision p squared to xi and g. Write xi=[a0]+p[a1] modulo p squared and g=[b0]+p[b1] modulo p squared, where a1 is inverse Frobenius applied to xi_1, hence is a unit. These are Teichmuller p-adic digits, not raw Witt coordinates.
2. Multiply these two congruences. Multiplicativity of Teichmuller representatives gives xi*g=[a0*b0]+p*([a0*b1]+[a1*b0]) modulo p squared. Reducing with constantCoeff yields a0*b0=0, so the first displayed Teichmuller term vanishes.
3. Cancel one p using the pinned p-torsionfreeness of W(k), then reduce again with constantCoeff to obtain a0*b1+a1*b0=0. Multiplying by b0 and using the first relation gives a1*(b0^2)=0. Since a1 is a unit, b0 squared=0.
4. As p is at least two, b0 to the pth power vanishes. Injectivity of Frobenius on the perfect ring k gives b0=0. The pinned first-coordinate ideal-membership criterion then gives p divides g.

Uses:

- **Bhatt–Morrow–Scholze Proposition 4.19(3); PerfectoidQuotients:Q0:integral-algebra**: Supplies the elementary bounded p-primary torsion argument once the perfectoid kernel generator has the stated unit coefficient. It does not assume a domain, a valuation cover, a prism, or derived completion.

Unit tests:

- `witt_torsion_prime_detection` (characterisation): For xi=p, the condition reduces to p squared dividing p*g if and only if p divides g; xi_1=1.

Acceptance:

- For xi=p, the condition reduces to p squared dividing p*g if and only if p divides g; xi_1=1.

Direct prerequisites: `mathlib:WittVector.dvd_sub_sum_teichmuller_iterateFrobeniusEquiv_coeff`, `mathlib:WittVector.teichmuller`, `mathlib:WittVector.teichmuller_zero`, `mathlib:WittVector.teichmuller_coeff_zero`, `mathlib:WittVector.constantCoeff`, `mathlib:WittVector.eq_zero_of_p_mul_eq_zero`, `mathlib:WittVector.mem_span_p_iff_coeff_zero_eq_zero`, `mathlib:frobeniusEquiv`, `mathlib:injective_frobenius`, `mathlib:Ideal.mem_span_singleton`, `mathlib:WittVector.coeff_p_one`.

Source: [Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 4.19(3), complete elementary proof, published p.227; arXiv v2 p.23. Refines the elementary proof to a general principal quotient of the existing Witt ring with an explicit unit-coordinate premise. The first Teichmuller p-adic digit is the inverse Frobenius of Witt coordinate one, so the two unit conditions agree.

### One-step p-saturation of a principal Witt ideal

Identifier: `PerfectoidQuotients:Q0:integral-algebra/witt-principal-p-saturation`. Kind: **lemma**. Suggested coverage: **full**.

If p squared times f belongs to the ordinary ideal generated by xi in W(k), then p times f belongs to that ideal, under the unit-coordinate hypothesis on xi.

Proposed declaration: `TauCeti.Perfectoid.witt_principal_p_saturation`.

Conventions and hypotheses: p is prime; k is a commutative perfect ring of characteristic p; xi belongs to W(k); its Witt coordinate xi_1 is a unit in k.

Proof or construction route:

1. Write p squared times f=xi*g using the existing principal-ideal membership theorem.
2. The product-detection lemma gives g=p*h. Rearrange the equality as p*(p*f)=p*(xi*h), and use p-torsionfreeness of the Witt ring to cancel p. The result p*f=xi*h proves membership in the same ideal. No cancellation of xi is used.

Uses:

- **Bhatt–Morrow–Scholze Proposition 4.19(3); PerfectoidQuotients:Q0:integral-algebra**: Supplies the elementary bounded p-primary torsion argument once the perfectoid kernel generator has the stated unit coefficient. It does not assume a domain, a valuation cover, a prism, or derived completion.

Unit tests:

- `witt_torsion_quotient_by_prime` (computation): The quotient W(k)/(p) is killed by p for any perfect k of characteristic p, including a product of fields; no domain hypothesis is needed.

Acceptance:

- The quotient W(k)/(p) is killed by p for any perfect k of characteristic p, including a product of fields; no domain hypothesis is needed.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/witt-product-p-square-detection`, `mathlib:Ideal.mem_span_singleton`, `mathlib:WittVector.eq_zero_of_p_mul_eq_zero`, `mathlib:Ideal.Quotient.eq_zero_iff_mem`.

Source: [Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 4.19(3), complete elementary proof, published p.227; arXiv v2 p.23. Refines the elementary proof to a general principal quotient of the existing Witt ring with an explicit unit-coordinate premise. The first Teichmuller p-adic digit is the inverse Frobenius of Witt coordinate one, so the two unit conditions agree.

### Bounded torsion in a principal Witt quotient

Identifier: `PerfectoidQuotients:Q0:integral-algebra/witt-principal-quotient-p-torsion`. Kind: **lemma**. Suggested coverage: **full**.

For Q=W(k)/(xi), every x in Q and every nonnegative integer n satisfy: if p to the nth power times x is zero, then p times x is zero. Thus the p-primary torsion of Q is already killed by p. This is a sufficient criterion, not a characterization of all principal ideals with this property.

Proposed declaration: `TauCeti.Perfectoid.witt_principal_quotient_p_torsion`.

Conventions and hypotheses: p is prime; k is a commutative perfect ring of characteristic p; xi belongs to W(k); its Witt coordinate xi_1 is a unit in k.

Proof or construction route:

1. Choose a representative f of x using the existing quotient projection. The relation p squared times x=0 is equivalent to p squared times f lying in (xi), so one-step saturation gives p times x=0.
2. For arbitrary n, n=0 forces x=0 and n=1 is the hypothesis itself. For n at least two, apply the square-step result to p to the (n-2) power times x; this lowers the annihilating exponent by one. Induction finishes.
3. To use the result for a perfectoid ring, separately establish its representation W(R-flat)/(xi) and the unit coefficient of a chosen kernel generator. These source hypotheses are not inferred from principal generation alone.

Uses:

- **Bhatt–Morrow–Scholze Proposition 4.19(3); PerfectoidQuotients:Q0:integral-algebra**: Supplies the elementary bounded p-primary torsion argument once the perfectoid kernel generator has the stated unit coefficient. It does not assume a domain, a valuation cover, a prism, or derived completion.

Unit tests:

- `witt_torsion_hypothesis_required` (non-example): In W(F_2)/(4), the class of one is killed by 4 but not by 2. The generator 4 has Witt coordinate one equal to zero, so it is excluded by the theorem.

Acceptance:

- In W(F_2)/(4), the class of one is killed by 4 but not by 2. The generator 4 has Witt coordinate one equal to zero, so it is excluded by the theorem.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/witt-principal-p-saturation`, `mathlib:Ideal.Quotient.mk_surjective`, `mathlib:Ideal.Quotient.eq_zero_iff_mem`, `mathlib:WittVector.mem_span_p_pow_iff_le_coeff_eq_zero`, `mathlib:WittVector.coeff_p_one`.

Source: [Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 4.19(3), complete elementary proof, published p.227; arXiv v2 p.23. Refines the elementary proof to a general principal quotient of the existing Witt ring with an explicit unit-coordinate premise. The first Teichmuller p-adic digit is the inverse Frobenius of Witt coordinate one, so the two unit conditions agree.

### Frobenius surjectivity equivalences

Identifier: `PerfectoidQuotients:Q0:integral-algebra/frobenius-surjectivity-equivalences`. Kind: **theorem**. Suggested coverage: **omitted**.

Let R be ϖ-adically complete and separated with ϖ^p dividing p. The following are equivalent: every element of R/(pϖ) is a pth power; Frobenius on R/p is surjective; every element of R/ϖ^p is a pth power; F:W_{r+1}(R) → W_r(R) is surjective for every r≥1; and θ_r:A_inf(R) → W_r(R) is surjective for every r≥1. Moreover unit multiples of ϖ and of p admit compatible p-power roots. F is the length-reducing finite Witt Frobenius, not the endomorphism of infinite Witt vectors.

Proposed declaration: `TauCeti.PerfectoidQuotients.frobenius_surjectivity_equivalences`.

Conventions and hypotheses: p prime; ϖ^p | p; ordinary ϖ-adic completeness and separation. A_inf and θ_r have the BMS1 conventions.

Proof or construction route:

1. The quotient implications are immediate except surjectivity modulo pϖ, obtained by the convergent expansion in powers of ϖ.
2. BMS1 Lemma 3.2 compares inverse root systems in R and R/(pϖ); choose a compatible lift of ϖ or p modulo pϖ. Its ratio is 1 plus a topologically nilpotent element, hence a unit.
3. Finite Witt Frobenius surjectivity implies surjectivity of θ_r by the inverse-system presentation; θ_1 surjectivity implies Frobenius surjectivity modulo p.
4. For the last implication use Davis–Kedlaya Theorem 3.2, implication (xiv)′⇒(ii), with I={a:a^p∈pR}, after choosing ϖ′ with (ϖ′^p)=(p). This exact input has its source and supplier request below; it is not the field-only Witt Frobenius in Mathlib.

Acceptance:

- For R=F_p[t], surjectivity fails; for perfect F_p-algebras all conditions hold.
- The root sequences are compatible and their zeroth terms are unit multiples of the specified elements.

Direct prerequisites: `mathlib:PreTilt`, `mathlib:Perfection`, `mathlib:IsAdicComplete`, `DerivedDeRhamCohomology:DD.1`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemma 3.9 with proof, p.22. Exact statement and proof read; notation is normalized in this node.; [On the Witt vector Frobenius](https://arxiv.org/pdf/1409.7530), Theorem 3.2, (xiv)′⇒(ii). Finite length-reducing Witt Frobenius criterion used explicitly by BMS1.

Suggested-file boundary: The finite length-reducing Witt Frobenius maps W_(r+1)(R)→W_r(R) and θ_r are absent from the pinned finite-Witt interface. Infinite Witt Frobenius is not a substitute.

### Integral perfectoid normalization

Identifier: `PerfectoidQuotients:Q0:integral-algebra/bms-perfectoid-normalization`. Kind: **comparison**. Suggested coverage: **omitted**.

The integral predicate defined here agrees with BMS1 Definition 3.5: existence of ϖ with ϖ^p | p, ordinary ϖ-adic completeness, Frobenius surjective on R/p, and principal ker θ. Its p-torsion-free specialization agrees with Česnavičius Definition 4.2: R is p-adically complete, (π^p)=(p), and the p-power map R/π → R/p is an isomorphism. The broader nonzerodivisor ϖ criterion R/ϖ → R/ϖ^p is BMS1 Lemma 3.10, not the literal definition in Česnavičius. No torsion-free condition is imposed on the general predicate.

Proposed declaration: `TauCeti.PerfectoidQuotients.integralPerfectoid_bms_iff`.

Conventions and hypotheses: The general comparison is between complete rings with the stated chosen elements. Zero rings are included.

Proof or construction route:

1. From the p-normalized definition and π^p=p·u, the p- and π-adic ideals are cofinal.
2. For the BMS1 formulation use Lemma 3.9 to choose π^p=p·u. The p-adic completeness of the general BMS1 ring follows from its canonical torsion/free decomposition (ČS24 §2.1.3); this comparison is retained as G1 until the source-level completion transport is proved on the pinned carriers.
3. Use the principal-kernel criterion for the p-torsion-free specialization. The converse requires the nonzerodivisor of ϖ.
4. Import the existing P1 integral/Tate comparison rather than constructing a second perfectoid Tate ring definition.

Acceptance:

- Keep rings with p-torsion, including F_p × O_C.
- For π^p=p·u, π^p and p generate the same ideal, so the completion comparison is cofinal.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/frobenius-surjectivity-equivalences`, `PerfectoidQuotients:Q0:integral-algebra/principal-theta-kernel-criterion`, `PerfectoidSpaces:P1/integral-perfectoid-comparison`, `PerfectoidSpaces:P1/perfectoid-tate-ring-from-integral-perfectoid`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`, `PerfectoidQuotients:Q0:integral-algebra/torsion-free-perfectoid-quotient`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Definition 3.5, Remark 3.8 and Lemma 3.9, pp.21–22. Exact statement and proof read; notation is normalized in this node.; [Purity for the Brauer group](https://arxiv.org/pdf/1711.06456v4), Definition 4.2 and Lemma 4.4, pp.7–8. Exact statement and proof read; notation is normalized in this node.; [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2), Definition 4.18, p.22. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The original ϖ-adic BMS1 condition and its θ/completion transport to the p-adic BMS2 carrier are not yet expressed. Only the BMS2 predicate is typed.

### Principal Fontaine kernel criterion

Identifier: `PerfectoidQuotients:Q0:integral-algebra/principal-theta-kernel-criterion`. Kind: **theorem**. Suggested coverage: **restricted**.

For a ϖ-adically complete ring R with ϖ^p | p and surjective p-power map R/ϖ → R/ϖ^p, a principal ker θ implies that this map is an isomorphism and every generator of ker θ is a nonzerodivisor in A_inf(R). Conversely, if the p-power map is an isomorphism and ϖ is a nonzerodivisor, ker θ is principal. The forward direction imposes no torsion-free condition on R.

Proposed declaration: `TauCeti.PerfectoidQuotients.principal_theta_kernel_criterion`.

Conventions and hypotheses: p prime; R ordinarily ϖ-adically complete and separated; ϖ^p | p; the displayed p-power map is surjective. For the pinned p-complete θ signature first use the normalization transport recorded in G1.

Proof or construction route:

1. After a unit change choose compatible roots of ϖ using the Frobenius equivalences. Form ξ=p+[ϖ♭]^p x with θ(ξ)=0.
2. Compare the Witt coefficient one of ξ and any chosen generator ξ′. The inverse-perfection and Witt unit tests show ξ/ξ′ is a unit.
3. The quotient diagram identifies R/ϖ → R/ϖ^p with Frobenius on the perfect tilt modulo corresponding ideals. For the nonzerodivisor assertion use p^r b∈[ϖ♭]^(pr)A_inf for odd r, Witt coordinates and separation.
4. For the converse, injectivity and the nonzerodivisor give ker(R♭ → R/ϖ)=(ϖ♭). Repeated division by ξ with ϖ-adic convergence generates ker θ.

Acceptance:

- The converse includes the nonzerodivisor; the forward direction covers p-torsion.
- For characteristic p the generator is p and the tilt projection is an isomorphism.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/frobenius-surjectivity-equivalences`, `PerfectoidQuotients:Q0:integral-algebra/inverse-perfection-unit-criterion`, `PerfectoidQuotients:Q0:integral-algebra/perfect-witt-unit-criterion`, `PerfectoidQuotients:Q0:integral-algebra/witt-product-first-coordinate`, `mathlib:WittVector.fontaineTheta`, `mathlib:IsHausdorff.eq_iff_smodEq`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemma 3.10 with proof, pp.22–23. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: Only the nonzerodivisor consequence for a normalized integral perfectoid ring is typed. The criterion for an originally ϖ-adic complete ring with ϖ^p dividing p, and its equivalence to the quotient p-power isomorphism, requires normalization/completion transport (G1).

### Distinguished Fontaine kernel generators

Identifier: `PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate`. Kind: **theorem**. Suggested coverage: **restricted**.

For a nonzero integral perfectoid R, an element ξ∈ker θ generates ker θ if and only if its Witt coordinate ξ₁ is a unit in R♭. Every generator is a nonzerodivisor. There is a generator of the form p+[π♭]^p x, after a compatible-root unit change of π. Along any map of perfectoid rings the induced Witt map sends a generator to a generator; the criterion is preserved because units map to units.

Proposed declaration: `TauCeti.PerfectoidQuotients.theta_generator_iff_unit_coeff_one`.

Conventions and hypotheses: p prime; R integral perfectoid and nonzero so the pinned PreTilt/θ instances are available. ξ∈ker θ.

Proof or construction route:

1. Use BMS1 Lemma 3.10 to compare the constructed primitive ξ with an arbitrary generator using the first two Witt coefficients.
2. If an element of the principal kernel has unit coordinate one, its quotient by a generator has unit coordinate zero and is a unit by the general-ring Witt criterion.
3. The nonzerodivisor follows from the principal-kernel theorem; naturality of θ transports membership and the unit-coordinate criterion.

Acceptance:

- Principal generation alone is not used to assert bounded torsion: the unit-coordinate theorem is applied first.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/principal-theta-kernel-criterion`, `PerfectoidQuotients:Q0:integral-algebra/perfect-witt-unit-criterion`, `PerfectoidQuotients:Q0:integral-algebra/witt-product-first-coordinate`, `PerfectoidQuotients:Q0:integral-algebra/theta-naturality`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Remark 3.11, p.23. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The generator iff unit in Witt coordinate one and the nonzerodivisor assertion are typed. The explicit compatible-root generator, finite θ_r generators and Verschiebung/Frobenius compatibilities are omitted because finite Witt Frobenius/θ_r interfaces are missing (G2).

### Bounded p-primary torsion of perfectoid rings

Identifier: `PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion`. Kind: **theorem**. Suggested coverage: **restricted**.

For any integral perfectoid R, its p-primary torsion is killed by p: if p^n x=0 for any n≥0 then px=0. In particular it has bounded p-primary torsion and ordinary and derived p-adic completeness agree.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoid_p_torsion_killed_by_p`.

Conventions and hypotheses: p prime; no domain, no p-torsion-freeness, and no valuation-cover hypothesis.

Proof or construction route:

1. The zero-ring case is immediate. In the nonzero case θ is surjective by the baseline and R≅W(R♭)/(ξ).
2. The kernel-generator theorem gives the required unit Witt coordinate ξ₁. Apply the retained elementary Witt-quotient torsion criterion.
3. Use DD.1 derived-completeness and the classical-to-derived direction of Stacks 091T. The requested bounded-torsion completeness comparison also applies. This proof does not use v-descent.

Acceptance:

- For W(F₂)/(4), the statement fails and the missing unit coefficient excludes it.
- For F_p × O_C the characteristic-p factor is allowed.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate`, `PerfectoidQuotients:Q0:integral-algebra/witt-principal-quotient-p-torsion`, `mathlib:surjective_fontaineTheta`, `DerivedDeRhamCohomology:DD.1/bounded-torsion-criterion`.

Source: [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2), Proposition 4.19(3), elementary proof, p.23. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The algebraic assertion R[p^∞]=R[p] is typed. The classical-to-derived completeness comparison is a DD.1 import applied in the proof, rather than an additional typed derived-category statement (G2).

### Cotangent complexes of perfectoid rings

Identifier: `PerfectoidQuotients:Q0:integral-algebra/perfectoid-cotangent-vanishing`. Kind: **theorem**. Suggested coverage: **omitted**.

For every map R → S of integral perfectoid rings, L_S/R ⊗^L_ℤ F_p is zero; consequently the derived p-completion of L_S/R is zero. This is about the full cotangent complex, not only ordinary Kähler differentials. For integral perfectoid R, the derived p-completion of L_R/ℤ_p is isomorphic to R[1]; it has p-complete Tor-amplitude concentrated in degree −1. The isomorphism is a choice of generator of ker θ, rather than a canonical un-oriented trivialization.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoid_cotangent_mod_p_vanishes`.

Conventions and hypotheses: p prime; R,S integral perfectoid; arbitrary unital ring map.

Proof or construction route:

1. Use BMS1 Lemma 3.13 to write S=R⊗^L_A_inf(R) A_inf(S); the exact finite Witt Tor-independence input is requested from PR.0 below.
2. Cotangent base change reduces modulo p to L_S♭/R♭.
3. The cotangent complex of a perfect F_p-algebra vanishes because Frobenius acts both invertibly and by zero on it; use DD.0 and the transitivity triangle.
4. Derived Nakayama gives the completed vanishing. The unresolved bibliography token printed by BMS1 is retained as source issue E2, with DD.0 supplying the fact.
5. For the absolute statement use Z_p→A_inf(R)→R. The first map is relatively perfect modulo p, so its completed cotangent complex vanishes. The θ-kernel generator is a nonzerodivisor; the regular-quotient cotangent computation gives (ker θ/(ker θ)²)[1], free of rank one over R. A generator identifies it with R[1].

Acceptance:

- For a perfect F_p-algebra recover the Frobenius-zero proof; do not replace the cotangent complex by Ω¹.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/cotangent-base-change`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `PrismaticCohomology:PR.0`, `PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate`, `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemma 3.14 with proof, p.24. Exact statement and proof read; notation is normalized in this node.; [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2), Proposition 4.19(2) and proof, pp.22–23. The absolute rank-one cotangent computation supplies the QSyn and QRSP supplier contract; it is distinct from relative completed vanishing.

Suggested-file boundary: The full cotangent complex, derived tensor and completed cotangent category are DD.0/DD.1-owned and have no implemented carrier at the pin. Both relative vanishing and the absolute rank-one computation are omitted.

### Reducedness of perfectoid rings

Identifier: `PerfectoidQuotients:Q0:integral-algebra/perfectoid-rings-reduced`. Kind: **theorem**. Suggested coverage: **full**.

Every integral perfectoid ring is reduced. If a∈R admits compatible p-power roots, then Ann(a^(1/p^n))=Ann(a)=R[a^∞] for every n≥0. No p-torsion-free hypothesis is needed.

Proposed declaration: `TauCeti.PerfectoidQuotients.integralPerfectoid_reduced`.

Conventions and hypotheses: R integral perfectoid; for the annihilator assertion a comes with a compatible root system.

Proof or construction route:

1. For π^p=p·u, use ČS24 §2.1.3: R/R[π^∞] is π-torsion-free and perfectoid, and R is its fibre product with (R/π)_red over the reduced special fibre of that quotient. This is the canonical decomposition used here, not the unrelated general fibre-product theorem reserved to Part II.
2. The special fibre is a perfect F_p-algebra, hence reduced. In the torsion-free component the Frobenius isomorphisms force a nilpotent element into every π^nR; separation gives zero.
3. For ax=0, raise a root times x to p^n and use reducedness; for a^m x=0 reducedness gives ax=0 by (ax)^m=0.

Acceptance:

- The semiperfect root quotient A/(t) is excluded although its Frobenius is surjective.
- F_p × O_C is reduced and has nonzero p-torsion.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/principal-theta-kernel-criterion`, `PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate`, `PerfectoidQuotients:Q0:integral-algebra/frobenius-surjectivity-equivalences`, `mathlib:IsHausdorff.eq_iff_smodEq`, `PerfectoidQuotients:Q0:integral-algebra/torsion-free-perfectoid-quotient`.

Source: [Purity for flat cohomology](https://arxiv.org/pdf/1912.10932v3), §2.1.3, equations (2.1.3.1)–(2.1.3.2), pp.11–12. Exact statement and proof read; notation is normalized in this node.; [Purity for the Brauer group](https://arxiv.org/pdf/1711.06456v4), Remark 4.3, p.8. Exact statement and proof read; notation is normalized in this node.

Atlas planet: **Reducedness of perfectoid rings**.

### Torsion-free perfectoid quotient

Identifier: `PerfectoidQuotients:Q0:integral-algebra/torsion-free-perfectoid-quotient`. Kind: **theorem**. Suggested coverage: **restricted**.

If integral perfectoid R is ordinarily ϖ-adically complete with ϖ^p | p, then R̄=R/R[ϖ^∞] is ϖ-torsion-free and integral perfectoid, (R̄)♭=R♭/R♭[(ϖ♭)^∞], and R ≅ R̄ ×_(R̄/ϖ)_red (R/ϖ)_red. The quotient by the ideal generated by all compatible ϖ-roots is (R/ϖ)_red, a perfect F_p-algebra. The tilting statement uses a compatible-root unit replacement of ϖ.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoid_torsion_free_quotient`.

Conventions and hypotheses: R integral perfectoid; R complete for ϖ; ϖ^p | p; choose compatible ϖ♭ after a unit change.

Proof or construction route:

1. Use the BMS kernel description and the torsion-module comparison R♭[ϖ♭]≅R[ϖ] in ČS24 (2.1.2.5); torsion stabilizes under compatible roots.
2. The intersection of the ϖ-power-torsion ideal and the compatible-root ideal is zero. The elementary fibre-product exact sequence decomposes R.
3. Apply A_inf to this finite limit and the θ counits; the snake lemma shows that the same distinguished ξ presents the torsion-free quotient, hence it is perfectoid.
4. Identify the root quotient with its tilt and with the reduced special fibre. Keep the generic perfectoid fibre-product theorem (ČS24 Proposition 2.1.4) with Part II.

Acceptance:

- For R=F_p × O_C and π=0 × π_C, the torsion-free quotient is O_C and the characteristic-p component survives in the reduced-special-fibre factor.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/principal-theta-kernel-criterion`, `PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate`, `PerfectoidQuotients:Q0:integral-algebra/frobenius-surjectivity-equivalences`, `mathlib:Ideal.Quotient.mk_surjective`, `mathlib:Ideal.isRadical_iff_quotient_reduced`, `mathlib:Localization.Away`, `mathlib:RingHom.ker`.

Source: [Purity for flat cohomology](https://arxiv.org/pdf/1912.10932v3), §§2.1.2–2.1.3, pp.11–12. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The perfectoidness and ϖ-torsion-freeness of R/ker(R→R[1/ϖ]) are typed. The tilt quotient R♭/R♭[ϖ♭] and canonical fibre-product decomposition R≅R_tf×_(R_tf/ϖ)R/ϖ require quotient/completion transport and the missing supplier interfaces (G1/G2).

### Compatible roots and iterated Frobenius

Identifier: `PerfectoidQuotients:Q0:integral-algebra/compatible-roots-and-iterated-frobenius`. Kind: **theorem**. Suggested coverage: **restricted**.

For p-torsion-free integral perfectoid R, choose π with (π^p)=(p). The pinned reduction map lim_(x↦x^p) R → R♭=lim_F R/p is an isomorphism of multiplicative monoids. There are compatible π_n, n≥1, with π₁ a unit multiple of π, π_(n+1)^p=π_n and (π_n^(p^n))=(p). Each ideal (π_n) is the inverse image of ker(F^n:R/p → R/p), and x↦x^(p^n) gives R/π_n ≅ R/p. Modulo p² every element is x^p+p y^p, and modulo pπ every element is a pth power.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoid_compatible_roots_iterated_frobenius`.

Conventions and hypotheses: p prime; R p-torsion-free and integral perfectoid; ideals are principal ideals in R.

Proof or construction route:

1. Use the existing Perfection/PreTilt root-system comparison, the Fontaine Frobenius equivalences and the normalization.
2. Iterate the Frobenius isomorphism R/π → R/p along the root tower to identify kernels and quotient maps.
3. The two-term expansion modulo p² follows by lifting modulo p twice; the congruence modulo pπ is BMS1 Lemma 3.9.

Acceptance:

- The nth root ideals are determined by Frobenius kernels even though generators are not canonical.
- A root sequence must satisfy the transition equalities, not merely individual p^n-root equations.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/bms-perfectoid-normalization`, `PerfectoidQuotients:Q0:integral-algebra/frobenius-surjectivity-equivalences`, `PerfectoidQuotients:Q0:integral-algebra/principal-theta-kernel-criterion`, `mathlib:Perfection`, `mathlib:PreTilt`, `mathlib:PreTilt.untilt`, `mathlib:PreTilt.mk_untilt_eq_coeff_zero`.

Source: [Purity for the Brauer group](https://arxiv.org/pdf/1711.06456v4), Remarks 4.4–4.5, p.8. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The monoid isomorphism between actual compatible root sequences and the pinned PreTilt is typed. The chosen π_n, ideal descriptions ker(F^n), R/π_n≅R/p, and the modulo-p² and pπ expansions are omitted pending normalization and finite Frobenius interfaces (G1/G2). The typed comparison admits the stronger normalized torsion-allowing setting; the node’s stated p-torsion-free specialization is included.

### p-integral closure

Identifier: `PerfectoidQuotients:Q0:integral-algebra/p-integral-closure`. Kind: **definition**. Suggested coverage: **full**.

For an inclusion A⊂B, A is p-integrally closed in B if every b∈B with b^p∈A already belongs to A. Its p-integral closure is the union of A₀=A and A_(n+1), the A_n-subalgebra of B generated by all b with b^p∈A_n. It is the smallest p-integrally closed subring of B containing A and lies in the ordinary integral closure. No closure under arbitrary integral equations is imposed.

Proposed declaration: `TauCeti.PerfectoidQuotients.pIntegralClosure`.

Conventions and hypotheses: p prime; an injective unital ring map identifies A with a subring of B.

Proof or construction route:

1. Construct the successive subrings by the baseline subring closure, then take their increasing union.
2. If b^p lies in the union, it lies in some finite stage, so b lies in the next; induction proves minimality.
3. Each adjoined element is integral by X^p−b^p. Integral dependence is transitive, so the union lies in the ordinary integral closure.

API:

- `TauCeti.PerfectoidQuotients.pIntegralClosure.le` (constructor): The source subring lies in its p-integral closure.
- `TauCeti.PerfectoidQuotients.pIntegralClosure.isClosed` (characterisation): If b^p is in the closure then b is in it.
- `TauCeti.PerfectoidQuotients.pIntegralClosure.minimal` (universal-property): The closure is contained in every p-integrally closed intermediate subring containing A.
- `TauCeti.PerfectoidQuotients.pIntegralClosure.idempotent` (simp): Taking p-integral closure twice gives the same subring.
- `TauCeti.PerfectoidQuotients.pIntegralClosure.mono` (functoriality): An inclusion of source subrings induces an inclusion of their closures.
- `TauCeti.PerfectoidQuotients.pIntegralClosure.le_integralClosure` (compatibility): The p-integral closure is contained in the baseline integral closure.

Uses:

- **ČS24 Proposition 2.1.8**: Completing this closure gives a perfectoid ring under explicit Frobenius and compatible-root hypotheses.
- **Česnavičius Lemma 4.7 and §4.8**: The p-primary closedness supplies the Frobenius injectivity and powerbounded adapter.

Unit tests:

- `TauCeti.PerfectoidQuotients.pClosureIdentity` (compatibility): A p-integrally closed subring is its own p-integral closure.
- `TauCeti.PerfectoidQuotients.pClosureZero` (degenerate): In the zero ambient ring the closure is the unique subring.
- `TauCeti.PerfectoidQuotients.pClosureRoot` (computation): In F₂[T], the 2-integral closure of F₂[T²] is all of F₂[T].
- `TauCeti.PerfectoidQuotients.pClosureNotOrdinary` (non-example): In F₂[T], F₂[T³] is 2-integrally closed, whereas its ordinary integral closure in F₂[T] is all of F₂[T]; F₂[T³] is a proper subring.

Acceptance:

- A p-integrally closed subring is its own p-integral closure.
- In the zero ambient ring the closure is the unique subring.
- In F₂[T], the 2-integral closure of F₂[T²] is all of F₂[T].
- In F₂[T], F₂[T³] is 2-integrally closed, whereas its ordinary integral closure in F₂[T] is all of F₂[T]; F₂[T³] is a proper subring.

Direct prerequisites: `mathlib:Subring.closure`, `mathlib:integralClosure`, `mathlib:Polynomial.eval₂RingHom`, `mathlib:RingHom.range`.

Source: [Purity for flat cohomology](https://arxiv.org/pdf/1912.10932v3), §2.1.7, p.13. Exact statement and proof read; notation is normalized in this node.

Atlas planet: **p-integral closure**.

### p-integral closedness criterion

Identifier: `PerfectoidQuotients:Q0:integral-algebra/p-integral-closedness-criterion`. Kind: **theorem**. Suggested coverage: **restricted**.

If ϖ is a nonzerodivisor of A and ϖ^p | p, the p-power map A/ϖ → A/ϖ^p is injective exactly when A is p-integrally closed in A[1/ϖ]. Hence for integral perfectoid A ordinarily ϖ-complete the image of A in A[1/ϖ] is p-integrally closed, including when A has ϖ-torsion. For p-torsion-free A with (ϖ^p)=(p), ordinary integral closedness in A[1/p] and Frobenius surjectivity modulo p imply that the ordinary p-completion is perfectoid.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoid_p_integral_closedness`.

Conventions and hypotheses: The equivalence requires ϖ a nonzerodivisor; the perfectoid image assertion first removes ϖ-power torsion. The final completion assertion requires p-torsion-freeness.

Proof or construction route:

1. Write a potential pth root in the localization as a/ϖ^n. Injectivity of the quotient Frobenius lowers a minimal positive denominator, proving p-integral closedness; the reverse direction divides a^p=ϖ^p b.
2. For a perfectoid ring apply the principal kernel Frobenius criterion to its torsion-free quotient.
3. For the final assertion, integral closedness implies p-integral closedness. Frobenius becomes bijective; finite quotient compatibility of the completion and the nonzerodivisor permit the principal-kernel converse.

Acceptance:

- Keep the nonzerodivisor in the quotient criterion; passing to the image in the localization handles torsion.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/p-integral-closure`, `PerfectoidQuotients:Q0:integral-algebra/principal-theta-kernel-criterion`, `PerfectoidQuotients:Q0:integral-algebra/torsion-free-perfectoid-quotient`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`, `mathlib:Localization.Away`, `mathlib:RingHom.ker`.

Source: [Purity for flat cohomology](https://arxiv.org/pdf/1912.10932v3), §2.1.7, equation (2.1.7.1), p.13. Exact statement and proof read; notation is normalized in this node.; [Purity for the Brauer group](https://arxiv.org/pdf/1711.06456v4), Lemma 4.7 with proof, p.8. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The injectivity criterion for the quotient p-power map and p-root closedness of the actual localization image is typed. The completion criterion for p-torsion-free integrally closed rings and the torsion-removal transport are omitted pending G1.

### Perfectoid completion of p-integral closure

Identifier: `PerfectoidQuotients:Q0:integral-algebra/completed-p-integral-closure-perfectoid`. Kind: **theorem**. Suggested coverage: **full**.

Let A contain a nonzerodivisor ϖ with ϖ^p | p and a compatible p-power root tower. If the p-power map A/ϖ → A/ϖ^p is surjective, the ordinary ϖ-adic completion of the p-integral closure of A in A[1/ϖ] is integral perfectoid.

Proposed declaration: `TauCeti.PerfectoidQuotients.completion_pIntegralClosure_perfectoid`.

Conventions and hypotheses: All the displayed hypotheses are required; no integrally closed or perfectoid assumption on A.

Proof or construction route:

1. Follow ČS24 Proposition 2.1.8: for a^p∈ϖ^pA choose successive lifts a_n under Frobenius. Adjoin the elements a_n/ϖ^(1/p^n) inside the localization; their integrality follows from their p-power equations.
2. Repeat the construction so Frobenius is both surjective and injective on the union modulo ϖ. The p-integral closedness criterion shows this union is exactly the p-integral closure.
3. Pass to ordinary ϖ-completion, retain the nonzerodivisor and the quotient Frobenius isomorphism, and apply the principal-kernel converse. Completion transport is G1 until proved on pinned carriers.

Acceptance:

- Frobenius surjectivity without the nonzerodivisor and root tower is not the claimed sufficient criterion.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/p-integral-closure`, `PerfectoidQuotients:Q0:integral-algebra/p-integral-closedness-criterion`, `PerfectoidQuotients:Q0:integral-algebra/principal-theta-kernel-criterion`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`, `mathlib:Localization.Away`, `mathlib:RingHom.ker`.

Source: [Purity for flat cohomology](https://arxiv.org/pdf/1912.10932v3), Proposition 2.1.8 with proof, pp.13–14. Exact statement and proof read; notation is normalized in this node.

### Completely étale and henselian perfectoid algebras

Identifier: `PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid`. Kind: **theorem**. Suggested coverage: **omitted**.

If R is integral perfectoid and R → R′ is p-completely étale (R′ derived p-complete and R′⊗^L_R R/p discrete étale), then R′ is integral perfectoid. For any ideal J⊂R, the ordinary p-completion of the henselization R_J^h is integral perfectoid. Thus p-completion of ind-étale R-algebras is perfectoid. No finite generation or closedness of J is required.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoid_completely_etale_henselization`.

Conventions and hypotheses: p prime; R integral perfectoid; use derived complete étaleness, not only Ω¹_R′/R=0.

Proof or construction route:

1. ALB23 Corollary 2.1.10 lifts R′ to a derived (p,ker θ)-completely étale A_inf(R)-algebra B. PR.0 unique δ-extension and complete étale algebraization are the supplier inputs.
2. Modulo p, complete étaleness over a perfect algebra gives an invertible Frobenius; B is a perfect δ-ring. Reducing its perfect prism by ker θ gives R′.
3. Henselization is a filtered colimit of étale algebras. Use the bounded p-primary torsion of R and DD.1 completion comparison to identify its p-completion as p-completely étale. The independent source route avoids importing the Part II fibre-product theorem.

Acceptance:

- Take J=0 and J=R as the henselian boundary cases; retain the exact henselization convention.
- A finite étale algebra after p-completion is an included special case.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion`, `PrismaticCohomology:PR.0/delta-etale-extension`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`, `DerivedDeRhamCohomology:DD.1/completely-smooth-algebraization`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`.

Source: [Prismatic Dieudonné theory](https://arxiv.org/pdf/1907.10525v4), Corollary 2.1.10 with proof, p.14. Exact statement and proof read; notation is normalized in this node.; [Purity for flat cohomology](https://arxiv.org/pdf/1912.10932v3), Corollary 2.1.6 with proof, p.13. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The completed étale/faithfully flat and henselization carriers require DD.1 and PR.0’s unique δ-extension/algebraization interfaces.

### Completed perfectoid root polynomials

Identifier: `PerfectoidQuotients:Q0:integral-algebra/completed-root-polynomial-algebras`. Kind: **theorem**. Suggested coverage: **omitted**.

For integral perfectoid A ordinarily ϖ-complete with ϖ^p | p and any set I, the ordinary ϖ-completion of A[X_i^(1/p^∞)]_(i∈I) is perfectoid. Its tilt is the ordinary ϖ♭-completion of A♭[(X_i♭)^(1/p^∞)]_(i∈I), where X_i♭ corresponds to the compatible powers of the variable.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoid_completed_root_polynomial`.

Conventions and hypotheses: A integral perfectoid; I arbitrary small set; ϖ-completeness and divisibility.

Proof or construction route:

1. Use the perfect A♭ root polynomial algebra and its completed Witt untilt by the same distinguished ξ.
2. Compare finite quotients of both candidate rings using p^n∈(ξ,[ϖ♭]^n); pass to inverse limits.
3. For arbitrary I use filtered finite-variable polynomial algebras followed by the stated completion, not an uncompleted polynomial algebra.

Acceptance:

- For I empty recover A; for I singleton the tilt sends the root coordinate to its root sequence.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`.

Source: [Purity for flat cohomology](https://arxiv.org/pdf/1912.10932v3), Proposition 2.1.11(a), statement and proof, pp.15–16. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The canonical completed polynomial algebra on an arbitrary family of compatible p-power root variables and its tilt transport have no pinned supplier construction.

### Completed perfectoid tensor products

Identifier: `PerfectoidQuotients:Q0:integral-algebra/completed-perfectoid-tensor-products`. Kind: **theorem**. Suggested coverage: **omitted**.

For integral perfectoid A ordinarily ϖ-complete with ϖ^p | p and a small family of ϖ-complete perfectoid A-algebras A_i, the ordinary ϖ-completed tensor product of all A_i over A is perfectoid; its tilt is the ϖ♭-completed tensor product of the tilts over A♭. Infinite tensor products are filtered colimits over finite subsets before completion. This is a classical completion statement on these hypotheses.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoid_completed_tensor`.

Conventions and hypotheses: All algebras complete for the image of the same ϖ; family may be empty.

Proof or construction route:

1. Use the finite Witt identity W_n(⊗ A_i♭)≅⊗_(W_n(A♭)) W_n(A_i♭), and the cofinal ideals explicitly compared in ČS24 (2.1.11.1)–(2.1.11.2).
2. Take (p,[ϖ♭])-completion, reduce by the common distinguished ξ and identify finite ϖ-quotients.
3. The empty tensor product is A; an infinite family is the completed filtered colimit of finite tensor products. Import PR.0 Tor-independence only for its stated derived p-completion counterpart, not as an unexplained replacement of this classical ϖ-completion.

Acceptance:

- For an empty family recover A; for A_i=A all maps are the identity.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`, `PrismaticCohomology:PR.0/perfectoid-tor-independence`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`.

Source: [Purity for flat cohomology](https://arxiv.org/pdf/1912.10932v3), Proposition 2.1.11(b) with proof, pp.15–16. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The arbitrary-family completed tensor product of integral perfectoid algebras and its tilt comparison require the supplier completed-colimit carrier. An arbitrary chosen ring is not substituted.

### Completed root-stable perfectoid quotients

Identifier: `PerfectoidQuotients:Q0:integral-algebra/completed-root-stable-quotients`. Kind: **theorem**. Suggested coverage: **restricted**.

For integral perfectoid A ordinarily ϖ-complete with ϖ^p | p and a subset S⊂A, suppose for every n>0 the ideal generated by S modulo ϖ^n is generated by p^n-th powers of its elements. Then the ordinary ϖ-completion of A/(S) is perfectoid. Its tilt is the ordinary ϖ♭-completion of A♭/(S♭), where S♭=lim_(x↦x^p)(S mod ϖ) inside A♭. A sufficient hypothesis is that every s∈S has some positive p-power root in S; in particular take the elements of a compatible root tower. The raw quotient is not asserted complete.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoid_completed_root_quotient`.

Conventions and hypotheses: A integral perfectoid; arbitrary S; the explicit ideal condition in every ϖ^n quotient is required.

Proof or construction route:

1. The ideal condition lets S♭ surject onto the generated ideal modulo ϖ and identifies (S mod ϖ^n) with ((S♭)♯ mod ϖ^n).
2. Replace S by its compatible-root sharp set, preserving the completed quotient. The tilt quotient is perfect.
3. At finite Witt length, quotient by the Teichmüller images of S♭ gives the Witt ring of the tilt quotient. Complete, reduce by ξ and compare finite ϖ-quotients.

Acceptance:

- For S=∅ recover A.
- For S={f^(1/p^n):n≥0}, include all transition roots and complete.
- For a single nonradical ideal in characteristic p, the raw quotient is the retained non-example.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-rings-reduced`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`.

Source: [Purity for flat cohomology](https://arxiv.org/pdf/1912.10932v3), Proposition 2.1.11(c) with proof, pp.15–17. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: Perfectoidness of the ordinary completion for a set admitting compatible p-th roots inside the set is typed. The general modulo-ϖ^n ideal-power condition and the tilt formula are omitted pending the supplier completion and tilt interfaces (G2).

### Products of perfectoid rings

Identifier: `PerfectoidQuotients:Q0:integral-algebra/products-of-perfectoid-rings`. Kind: **theorem**. Suggested coverage: **restricted**.

A small product of Z_p-algebras is integral perfectoid if and only if each factor is integral perfectoid. Its tilt is the product of the tilts. No common bounded cardinality or uniform bound on p-torsion is added; the bound one is supplied by the perfectoid factors.

Proposed declaration: `TauCeti.PerfectoidQuotients.integralPerfectoid_pi_iff`.

Conventions and hypotheses: p prime; the algebra structures and ordinary p-completions are compatible with the product; include the empty product, the zero ring.

Proof or construction route:

1. Products preserve the p-adic inverse-limit description and Frobenius surjectivity modulo p. Choose normalized roots and kernel generators componentwise.
2. A_inf preserves products; the product of the principal kernel generators generates the product kernel and its coordinate one is a unit componentwise.
3. For the converse, projections transport the defining root and kernel data, using the product identity for A_inf rather than arbitrary quotient stability.

Acceptance:

- The empty product is 0; F_p × F_p passes.
- An infinite product of perfect F_p-algebras stays perfect and agrees with the characteristic-p criterion.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion`, `mathlib:PreTilt`, `mathlib:WittVector.fontaineTheta`.

Source: [Purity for flat cohomology](https://arxiv.org/pdf/1912.10932v3), Proposition 2.1.11(d) with proof, pp.16–17. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The if-and-only-if perfectoid criterion on the actual dependent product ring is typed, including the empty product. The product-tilt equivalence is omitted pending the completion-instance/tilt transport (G2).

### Perfectoid completion along a sharp ideal

Identifier: `PerfectoidQuotients:Q0:integral-algebra/completion-along-sharp-ideal`. Kind: **theorem**. Suggested coverage: **restricted**.

For integral perfectoid A, a finite tuple a_i♭∈A♭ and a_i=(a_i♭)♯, ordinary completion of A at (a₁,…,a_r) is perfectoid, agrees with derived completion at that ideal, and has tilt the ordinary completion of A♭ at (a₁♭,…,a_r♭). The ideal need not contain p.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoid_sharp_ideal_completion`.

Conventions and hypotheses: A integral perfectoid; finite tuple from the tilt; use sharp elements, not an arbitrary ideal without a lift.

Proof or construction route:

1. Reduce finite-ideal derived completion to successive single-element completions by DD.1. For a perfect tilt, compatible roots make the derived torsion tower almost zero; its derived completion is classical and perfect.
2. Complete Witt vectors along the Teichmüller lift and reduce by ξ. The unit-coordinate argument keeps ξ a nonzerodivisor, so the derived completed ring is discrete and perfectoid.
3. Reducedness plus Stacks 0G3I makes the derived-complete discrete target separated for the finite ideal; Stacks 091T then identifies it with ordinary completion.
4. The completion carrier and exact separatedness comparison are requested from DD.1; they are not supplied by ordinary p-completeness alone.

Acceptance:

- For r=0 the completion at the zero ideal is A.
- In characteristic p this is completion of a perfect ring, not arbitrary completion of an imperfect algebra.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-rings-reduced`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`, `mathlib:AdicCompletion`.

Source: [Purity for flat cohomology](https://arxiv.org/pdf/1912.10932v3), Proposition 2.1.11(e) with proof, pp.16–17. Exact statement and proof read; notation is normalized in this node.; [Stacks Project: Derived completion and derived completion of rings](https://stacks.math.columbia.edu/tag/091N), Tags 0G3I and 091T. Reduced finite-ideal derived completeness supplies separation and then classical completeness.

Suggested-file boundary: The ordinary finite sharp-ideal completion is typed and asserted perfectoid. The equality with derived completion and the completed tilt identification are omitted pending G1/G2; ϖ^p dividing p alone is not used to assert arbitrary derived/classical equality.

### Powerbounded Tate model interfaces

Identifier: `PerfectoidQuotients:Q0:integral-algebra/tate-powerbounded-model-import-contract`. Kind: **application**. Suggested coverage: **import**.

For a p-torsion-free integral perfectoid A choose π^p=p·u and put T=A[1/p] with A open p-adic. Import the P1 Tate adapter: T is perfectoid and uniform, every compatible π-root annihilates T°/A, T° is the almost-elements saturation of A inside T, A contains T°°, and T° is ordinarily p-adically complete and integral perfectoid. This is the powerbounded-model reduction of Česnavičius §4.8. No integral-closedness assumption on A is added.

Conventions and hypotheses: p is prime; the precise hypotheses of every imported supplier node are part of this contract.

Proof or construction route:

1. Use the named supplier nodes, once, on their actual carriers. This node records their application and reexport; it defines no second generic object.
2. Check the supplier hypotheses before instantiation. A blueprint supplier is planned mathematics, never a baseline implementation. Supplier reviews and unavailable Lean carriers remain in the gap register.

Acceptance:

- For A=O_C, T°=A.
- For an unsaturated model, T°/A is killed by every compatible π-root, not necessarily zero.

Direct prerequisites: `PerfectoidSpaces:P1/perfectoid-tate-ring-from-integral-perfectoid`, `PerfectoidSpaces:P1/almost-integral-dictionary`, `PerfectoidSpaces:P1/topologically-nilpotent-elements-as-root-ideal`, `PerfectoidSpaces:P1/integral-perfectoid-comparison`, `PerfectoidQuotients:Q0:integral-algebra/bms-perfectoid-normalization`, `PerfectoidQuotients:Q0:integral-algebra/compatible-roots-and-iterated-frobenius`.

Source: [Purity for the Brauer group](https://arxiv.org/pdf/1711.06456v4), §4.8 in full, pp.8–9. Exact statement and proof read; notation is normalized in this node.; [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemma 3.21 and proof, p.27. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: Application/reexport only. All generic declarations retain the exact supplier names listed in prerequisites; this file defines no second generic carrier.

### Bhatt’s field integral model

Identifier: `PerfectoidQuotients:Q0:integral-algebra/bhatt-field-integral-model-comparison`. Kind: **comparison**. Suggested coverage: **omitted**.

Fix a perfectoid field K, its valuation ring K° and a nonzero topologically nilpotent t∈K° with compatible p-power roots; in characteristic zero normalize |t|=|p|. Bhatt’s integral perfectoid K°-algebras are flat K°-algebras A, ordinarily t-complete, with A=A_* (every x∈A[1/t] with t^(1/p^n)x∈A for all n lies in A), and with F:A/t^(1/p) → A/t an isomorphism. They are precisely the powerbounded integral models of perfectoid K-algebras. They satisfy the general integral predicate; the converse from the general predicate needs this K°-algebra structure, t-torsion-freeness/flatness and saturation. The field-based model does not replace the general torsion-allowing predicate.

Proposed declaration: `TauCeti.PerfectoidQuotients.bhatt_integral_model_comparison`.

Conventions and hypotheses: K perfectoid field; t as stated; A flat over K° and ordinarily t-complete; use almost mathematics for m=(t^(1/p^n):n≥0).

Proof or construction route:

1. Apply P1/almost-integral-dictionary to identify A_* and its Tate localization; over the valuation ring, torsion-freeness is flatness.
2. Use the normalization and the t-root quotient Frobenius isomorphism to compare with the general integral predicate.
3. When a raw completed model lacks A=A_*, take its almost-elements saturation; this is an almost isomorphism, not a declared equality.

Acceptance:

- A=K° is the base case.
- A ring with p-torsion need not be flat over mixed-characteristic K° and is not automatically a field-based model.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/bms-perfectoid-normalization`, `PerfectoidSpaces:P1/almost-integral-dictionary`, `PerfectoidSpaces:P1/perfectoid-tate-ring-from-integral-perfectoid`, `PerfectoidSpaces:P0/almost-hom-and-adjoints`, `PerfectoidSpaces:P0/root-ideal-basic-setup`.

Source: [On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882v2), Notation 1.4 and footnote 5, p.3. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The fixed perfectoid field K, K°-flat saturated t-adic integral model, (-)_* saturation and Tate normalization are P0/P1-owned carriers, absent at the pin.

## Q1 — smooth cohomology and Hodge–Tate comparison

### Smooth prismatic cohomology and Hodge–Tate comparison

Identifier: `PerfectoidQuotients:Q1/smooth-prismatic-hodge-tate-reexport`. Kind: **application**. Suggested coverage: **import**.

For a bounded prism (A,I) and a p-completely smooth A/I-algebra R, Q1 reexports PR.1: the relative site, (p,I)-completely faithfully flat coverings, structure sheaf, derived cohomology Δ_R/A, Čech–Alexander models independent of polynomial presentation and the semilinear Frobenius. Its Hodge–Tate reduction has the multiplicative comparison Ω^i_R/(A/I){−i} ≅ H^i(Δ_R/A ⊗^L_A A/I), with the Breuil–Kisin twists and Bockstein de Rham differential of Theorem 6.3. The crystalline and de Rham comparisons, polynomial calculations, gluing and the stated completed base-change laws are supplier interfaces. PR.3 owns the étale comparison; Q1 reexports the listed PR.1 constructions.

Conventions and hypotheses: p is prime; the precise hypotheses of every imported supplier node are part of this contract.

Proof or construction route:

1. Use the named supplier nodes, once, on their actual carriers. This node records their application and reexport; it defines no second generic object.
2. Check the supplier hypotheses before instantiation. A blueprint supplier is planned mathematics, never a baseline implementation. Supplier reviews and unavailable Lean carriers remain in the gap register.

Acceptance:

- On R=A/I the comparison sends 1 to 1.
- For a polynomial algebra use the PR.1 polynomial calculation and multiplicativity.
- Change of an oriented generator transports the twist rather than choosing an untwisted isomorphism.

Direct prerequisites: `PrismaticCohomology:PR.1/relative-prismatic-site`, `PrismaticCohomology:PR.1/prismatic-structure-sheaf`, `PrismaticCohomology:PR.1/relative-prismatic-cohomology`, `PrismaticCohomology:PR.1/change-of-topology`, `PrismaticCohomology:PR.1/cech-alexander-complex`, `PrismaticCohomology:PR.1/cech-alexander-computes-cohomology`, `PrismaticCohomology:PR.1/frobenius-on-prismatic-cohomology`, `PrismaticCohomology:PR.1/hodge-tate-cohomology`, `PrismaticCohomology:PR.1/bockstein-differential`, `PrismaticCohomology:PR.1/crystalline-comparison`, `PrismaticCohomology:PR.1/crystalline-comparison-syntomic`, `PrismaticCohomology:PR.1/hodge-tate-comparison-map`, `PrismaticCohomology:PR.1/hodge-tate-comparison`, `PrismaticCohomology:PR.1/prismatic-base-change`, `PrismaticCohomology:PR.1/de-rham-comparison`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Theorem 6.3 and its proof, §§4–6, pp.38–54. Source milestones are reexported through their existing owners, not reconstructed here.

Suggested-file boundary: Application/reexport only. All generic declarations retain the exact supplier names listed in prerequisites; this file defines no second generic carrier.

## Q2 — universal prisms and perfectoidization

### Semiperfectoid rings

Identifier: `PerfectoidQuotients:Q2/semiperfectoid-rings`. Kind: **definition**. Suggested coverage: **full**.

A commutative ring S is semiperfectoid at p if its underlying complex is derived p-complete and there exists a surjective unital ring homomorphism R → S from an integral perfectoid ring R. A presentation is this witness, not part of the property. Ordinary p-adic completeness is not substituted for derived completeness; for an ordinary bounded-p-torsion ring the completeness comparison is requested precisely from DD.1 (091P/091T plus the bounded-torsion separation argument). Quasisyntomic and quasiregular semiperfectoid predicates remain DD.0/DD.5 imports.

Proposed declaration: `TauCeti.PerfectoidQuotients.IsSemiperfectoid`.

Conventions and hypotheses: p is prime; zero rings and arbitrary ideals are allowed.

Proof or construction route:

1. Use the existing integral predicate for the source and DD.1 derived completion for the target.
2. Forget the chosen presentation in the property. Transport along a ring equivalence.
3. A quotient of a perfectoid ring alone does not supply derived completeness; require it explicitly.

API:

- `TauCeti.PerfectoidQuotients.IsSemiperfectoid.presentation` (projection): Obtain an integral perfectoid source and a surjective ring map onto S.
- `TauCeti.PerfectoidQuotients.IsSemiperfectoid.derived_complete` (projection): S is derived p-complete.
- `TauCeti.PerfectoidQuotients.IsSemiperfectoid.of_perfectoid` (constructor): An integral perfectoid ring is semiperfectoid.
- `TauCeti.PerfectoidQuotients.IsSemiperfectoid.congr` (equivalence): Ring equivalences preserve and reflect semiperfectoidness.
- `TauCeti.PerfectoidQuotients.IsSemiperfectoid.classically_complete_of_bounded` (compatibility): If S has bounded p-primary torsion, its derived p-completeness is equivalent to the Mathlib p-adic completeness predicate.

Uses:

- **BS22 Proposition 7.2**: Its presentation supplies A_inf and the ideal that must become divisible by d.
- **BS22 Theorem 7.4**: The universal perfectoidization is required for all such S, with no QRSP restriction.

Unit tests:

- `TauCeti.PerfectoidQuotients.semiperfectoidZero` (degenerate): The zero ring is semiperfectoid.
- `TauCeti.PerfectoidQuotients.semiperfectoidRootQuotient` (computation): PerfectClosure(F₂[t],2)/(t) is semiperfectoid and is not integral perfectoid.
- `TauCeti.PerfectoidQuotients.semiperfectoidIdentity` (compatibility): Every integral perfectoid ring gives the identity presentation.
- `TauCeti.PerfectoidQuotients.semiperfectoidPolynomialFails` (non-example): F_p[t] is not semiperfectoid: a quotient of a perfectoid ring has surjective Frobenius modulo p.

Acceptance:

- The zero ring is semiperfectoid.
- PerfectClosure(F₂[t],2)/(t) is semiperfectoid and is not integral perfectoid.
- Every integral perfectoid ring gives the identity presentation.
- F_p[t] is not semiperfectoid: a quotient of a perfectoid ring has surjective Frobenius modulo p.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `DerivedDeRhamCohomology:DD.1/derived-completeness`, `DerivedDeRhamCohomology:DD.1`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Notation 7.1, p.55. Exact statement and proof read; notation is normalized in this node.; [Stacks Project: Derived completion and derived completion of rings](https://stacks.math.columbia.edu/tag/091N), Lemma 15.93.1 (tag 091P), criterion (7), proof (7)⇒(1). For an ordinary ring/module and I=(p), derived completeness is exactly bijectivity of (a_n) ↦ (a_n−p a_(n+1)) on its countable product. The suggested predicate uses this concrete specialization; DD.1 owns the generic notion.

Atlas planet: **Semiperfectoid rings**.

### Initial prism of a semiperfectoid ring

Identifier: `PerfectoidQuotients:Q2/initial-prism-of-a-semiperfectoid-ring`. Kind: **construction**. Suggested coverage: **omitted**.

For a semiperfectoid S, the category of all prisms (A,I) with a map S → A/I has an initial object (Δ_init(S),I_S). The ideal I_S is principal. There is a structure map S → Δ_init(S)/I_S, and every prism under S receives a unique compatible δ-map. The result makes no boundedness assertion. For a chosen presentation R ↠ S and d generating ker θ_R, the ideal is the image of (d); the resulting initial object is independent of both choices.

Proposed declaration: `TauCeti.PerfectoidQuotients.initialPrism`.

Conventions and hypotheses: S is semiperfectoid in the derived sense of Notation 7.1.

Proof or construction route:

1. Use PR.1 Lemma 4.8 to start from (A_inf(R),(d)); let J=ker(A_inf(R) → S). Rigidity forces the target prism ideal to be dC.
2. Adjoin one δ-variable x_f for every f∈J and impose d x_f=f in the δ-stable universal quotient; maps to every target C are unique because d is a nonzerodivisor there.
3. Kill the δ-stable ideal generated by d-power torsion, take H⁰ of derived (p,d)-completion, and repeat because completion may create new d-torsion.
4. Iterate to a sufficiently large regular ordinal, using the DD.1 requested commutation of completion with ω₁-filtered colimits and a fixed cardinal bound. At stationarity d is a nonzerodivisor, and its distinguishedness gives a prism. The ordinal/size step is G3, not an assumed theorem.
5. The relation d x_f=f makes R → Δ_init/d factor through S. The preserved mapping property proves initiality and independence.

API:

- `TauCeti.PerfectoidQuotients.initialPrism.structureMap` (projection): The canonical ring map S → Δ_init(S)/I_S.
- `TauCeti.PerfectoidQuotients.initialPrism.ideal_principal` (structure): I_S is generated by the image of the chosen d.
- `TauCeti.PerfectoidQuotients.initialPrism.lift` (universal-property): Every prism C under S receives the unique compatible δ-map Δ_init(S) → C.
- `TauCeti.PerfectoidQuotients.initialPrism.lift_unique` (extensionality): Two compatible prism maps out of Δ_init(S) are equal.
- `TauCeti.PerfectoidQuotients.initialPrism.map` (functoriality): A map of semiperfectoid rings gives a map of initial prisms; identity and composition are preserved.
- `TauCeti.PerfectoidQuotients.initialPrism.presentation_independent` (equivalence): Any two quotient presentations give uniquely isomorphic initial prisms over S.

Uses:

- **BS22 Corollary 7.3**: Complete and perfect this initial object to construct the universal ring.
- **PR.2 Lemmas 7.8–7.10**: Compare the initial prism to a retract, a regular envelope, and the QRSP derived model.

Unit tests:

- `TauCeti.PerfectoidQuotients.initialPrismPerfectoid` (compatibility): For integral perfectoid S, recover (A_inf(S),ker θ_S) via PR.1 Lemma 4.8.
- `TauCeti.PerfectoidQuotients.initialPrismZero` (degenerate): For S=0 the initial prism is the trivial prism.
- `TauCeti.PerfectoidQuotients.initialPrismQrsp` (compatibility): For QRSP S use PR.2/qrsp-prism to identify Δ_init(S) with derived prismatic cohomology.
- `TauCeti.PerfectoidQuotients.initialPrismNotBounded` (non-example): The definition does not impose bounded p-primary torsion on Δ_init(S)/I_S; BS22 explicitly warns that boundedness need not hold.

Acceptance:

- For integral perfectoid S, recover (A_inf(S),ker θ_S) via PR.1 Lemma 4.8.
- For S=0 the initial prism is the trivial prism.
- For QRSP S use PR.2/qrsp-prism to identify Δ_init(S) with derived prismatic cohomology.
- The definition does not impose bounded p-primary torsion on Δ_init(S)/I_S; BS22 explicitly warns that boundedness need not hold.

Direct prerequisites: `PerfectoidQuotients:Q2/semiperfectoid-rings`, `PerfectoidQuotients:Q0:animated-application/prism-and-animation-import-contract`, `PrismaticCohomology:PR.0/free-delta-ring`, `PrismaticCohomology:PR.0/delta-universal-quotient`, `PrismaticCohomology:PR.0/delta-ideal-closure`, `PrismaticCohomology:PR.0/rigidity-prism-ideal`, `PrismaticCohomology:PR.1/perfect-prism-initial`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Proposition 7.2 with proof, p.55. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: PR.0 has no implemented prism/δ-map carrier at the pin. The transfinite torsion-killing, H⁰-completion and stationary universal object require the supplier completion/animation interfaces and cardinal argument.

Atlas planet: **Universal prism**.

### Universal perfectoidization

Identifier: `PerfectoidQuotients:Q2/universal-perfectoidization`. Kind: **construction**. Suggested coverage: **restricted**.

For semiperfectoid S there is an integral perfectoid ring S_perfd and a map η_S:S → S_perfd initial among all maps from S to integral perfectoid rings: for every such T, composition with η_S is a bijection Hom(S_perfd,T) ≅ Hom(S,T). It is the reduction modulo I of the completed perfection of Δ_init(S), equivalently the p-completion of the uncompleted perfection modulo I. It depends only on S. This statement does not assert η_S is surjective; that is Q4.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoidization`.

Conventions and hypotheses: S is semiperfectoid. All maps are unital ring maps; between complete rings they respect the p-adic topology.

Proof or construction route:

1. Apply the corrected PR.0/prism-perfection universal property to the initial prism.
2. Under PR.0/perfect-prisms-perfectoid-rings, perfect prisms under S correspond to integral perfectoid rings under S. Reduce the perfected prism by its ideal.
3. The mapping property supplies functoriality, identity, composition and presentation independence; it does not prove arbitrary base change.
4. Use Q4/characteristic-p-perfectoidization-universal for the radical quotient in characteristic p, after deriving the same mapping property.

API:

- `TauCeti.PerfectoidQuotients.perfectoidization.eta` (projection): The unit map η_S:S → S_perfd.
- `TauCeti.PerfectoidQuotients.perfectoidization.isIntegralPerfectoid` (structure): S_perfd satisfies the integral predicate.
- `TauCeti.PerfectoidQuotients.perfectoidization.lift` (universal-property): For perfectoid T, a map f:S → T has a unique lift S_perfd → T.
- `TauCeti.PerfectoidQuotients.perfectoidization.lift_eta` (simp): The lift composed with η_S equals f.
- `TauCeti.PerfectoidQuotients.perfectoidization.lift_unique` (extensionality): A map out of S_perfd is determined by its composite with η_S.
- `TauCeti.PerfectoidQuotients.perfectoidization.map` (functoriality): The unit is natural; the induced maps preserve identities and composition.
- `TauCeti.PerfectoidQuotients.perfectoidization.of_perfectoid` (equivalence): For perfectoid S, η_S is a ring equivalence.
- `TauCeti.PerfectoidQuotients.perfectoidization.presentation_independent` (compatibility): Changing the surjection R ↠ S preserves the universal ring and its unit.

Uses:

- **Q4 Theorem 7.4**: Its unit is the precise map whose surjectivity is proved.
- **BS22 Remark 7.5**: Apply the construction to a completed integral quotient before inverting a pseudouniformizer.

Unit tests:

- `TauCeti.PerfectoidQuotients.perfectoidizationZero` (degenerate): Perfectoidization of 0 is 0 and its unit is the identity.
- `TauCeti.PerfectoidQuotients.perfectoidizationPerfect` (compatibility): For F_p, and every perfectoid S, the unit is an isomorphism.
- `TauCeti.PerfectoidQuotients.perfectoidizationRootQuotient` (computation): For A=PerfectClosure(F₂[t],2), the perfectoidization of A/(t) is A/√(t), with a noninjective unit.
- `TauCeti.PerfectoidQuotients.perfectoidizationTwoPresentations` (compatibility): Two perfectoid quotient presentations of the same S induce the same lifts to every perfectoid target.

Acceptance:

- Perfectoidization of 0 is 0 and its unit is the identity.
- For F_p, and every perfectoid S, the unit is an isomorphism.
- For A=PerfectClosure(F₂[t],2), the perfectoidization of A/(t) is A/√(t), with a noninjective unit.
- Two perfectoid quotient presentations of the same S induce the same lifts to every perfectoid target.

Direct prerequisites: `PerfectoidQuotients:Q2/semiperfectoid-rings`, `PerfectoidQuotients:Q2/initial-prism-of-a-semiperfectoid-ring`, `PrismaticCohomology:PR.0/prism-perfection`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Corollary 7.3, p.56. Use S, not the R printed in the second category in the proof; inherited source issue E1.

Suggested-file boundary: The complete ring-valued universal property, naturality, all eight API items and four tests are typed. The initial-prism formula Δ_init(S)_perf/I and its identification with that chosen universal ring require the unavailable PR.0 prism carrier (G2); they are omitted.

Atlas planet: **Universal perfectoidization**.

### Derived prismatic initiality interfaces

Identifier: `PerfectoidQuotients:Q2/derived-prismatic-initiality-import-contract`. Kind: **application**. Suggested coverage: **import**.

For a perfect prism base (A,I) and derived p-complete animated A/I-algebra S, import PR.2 Construction 7.6, the derived left Kan extension Δ_S/A, conjugate/Hodge–Tate filtration gr^i=(∧^i L_S/(A/I))^∧{−i}[−i], base change and Künneth. If the Hodge–Tate reduction Δ̄_S/A is concentrated in degree zero, PR.2 supplies discreteness and I-torsion-freeness of Δ_S/A, its δ-ring prism structure, weak initiality and an idempotent retraction onto the initial prism. Discreteness of Δ_S/A alone is not the supplier hypothesis, and automatic initiality is not asserted. The idempotent-retract lemma, the bounded-torsion Koszul-regular quotient envelope calculation, and the QRSP theorem identify the initial object in the respective cases. General site/derived agreement and quasisyntomic descent are imported with the exact stated hypotheses.

Conventions and hypotheses: p is prime; the precise hypotheses of every imported supplier node are part of this contract.

Proof or construction route:

1. Use the named supplier nodes, once, on their actual carriers. This node records their application and reexport; it defines no second generic object.
2. Check the supplier hypotheses before instantiation. A blueprint supplier is planned mathematics, never a baseline implementation. Supplier reviews and unavailable Lean carriers remain in the gap register.

Acceptance:

- Retain the degree-zero hypothesis on Δ̄_S/A, not merely Δ_S/A; then distinguish weak initiality, the idempotent retract and actual initiality.
- For a regular sequence retain derived Koszul regularity and bounded p-primary torsion.
- The O_C/p example is QRSP, although it is not perfectoid.

Direct prerequisites: `PrismaticCohomology:PR.2/derived-prismatic-cohomology`, `PrismaticCohomology:PR.2/conjugate-filtration`, `PrismaticCohomology:PR.2/derived-hodge-tate-comparison`, `PrismaticCohomology:PR.2/derived-prismatic-base-change`, `PrismaticCohomology:PR.2/kunneth-formula`, `PrismaticCohomology:PR.2/comparison-to-prisms`, `PrismaticCohomology:PR.2/derived-agrees-with-site`, `PrismaticCohomology:PR.2/idempotent-retract-initial-object`, `PrismaticCohomology:PR.2/regular-quotient-prismatic-envelope`, `PrismaticCohomology:PR.2/qrsp-prism`, `PrismaticCohomology:PR.2/qrsp-char-p-acrys`, `PrismaticCohomology:PR.2/quasisyntomic-descent`, `PerfectoidQuotients:Q1/smooth-prismatic-hodge-tate-reexport`, `PerfectoidQuotients:Q2/initial-prism-of-a-semiperfectoid-ring`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Construction 7.6, Lemmas 7.7–7.8, Example 7.9, Proposition 7.10, pp.56–60. Source milestones are reexported through their existing owners, not reconstructed here.

Suggested-file boundary: Application/reexport only. All generic declarations retain the exact supplier names listed in prerequisites; this file defines no second generic carrier.

### Completed perfectoidization under flat base change

Identifier: `PerfectoidQuotients:Q2/completed-perfectoidization-base-change`. Kind: **theorem**. Suggested coverage: **omitted**.

Let R → R′ be a p-completely faithfully flat map of integral perfectoid rings and R → S a semiperfectoid quotient. Let S′=(S⊗^L_R R′)^∧_p, which is an ordinary derived p-complete semiperfectoid ring by complete flatness. There is a canonical equivalence (S_perfd⊗^L_R R′)^∧_p ≅ S′_perfd compatible with the units. If η_S′ is surjective, η_S is surjective. Only this base-change law along a perfectoid cover is asserted.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoidization_complete_flat_base_change`.

Conventions and hypotheses: R,R′ integral perfectoid; R → R′ p-completely faithfully flat; S derived p-complete and a quotient of R.

Proof or construction route:

1. PR.0/perfectoid-tor-independence identifies the completed derived tensor of the two perfectoid R-algebras S_perfd and R′ with a discrete perfectoid pushout. This actual theorem is the missing premise that a bare universal property would not supply.
2. For a perfectoid target T, maps from this pushout are compatible maps S_perfd → T and R′ → T. Universal perfectoidization replaces the first by S → T. Derived completed tensor represents the resulting compatible maps from S′. This proves the canonical equivalence and its unit square.
3. The underlying unit S → S_perfd is a map of derived p-complete R-modules. Its cofiber is derived p-complete. Under complete flat base change its completed tensor is the cofiber of η_S′.
4. Surjectivity of η_S′ kills degree zero of this base-changed cofiber. The complete-flatness/descent contract over bounded-torsion R and R′ detects this vanishing and hence surjectivity over R. No bounded-torsion assumption on S is introduced.
5. This gives a noncircular route using only PR.0 and DD.1. Formal comparison with DD.1’s precise cofiber/amplitude interface remains G5; BS22 Proposition 8.5 is not a prerequisite.

Acceptance:

- At R′=R the comparison is the identity.
- Only cover base change is needed for Q4; arbitrary base change or arc descent is not inferred.

Direct prerequisites: `PerfectoidQuotients:Q2/universal-perfectoidization`, `PerfectoidQuotients:Q2/semiperfectoid-rings`, `PrismaticCohomology:PR.0/perfectoid-tor-independence`, `DerivedDeRhamCohomology:DD.1/complete-flatness`, `DerivedDeRhamCohomology:DD.1/complete-flat-descent`, `DerivedDeRhamCohomology:DD.1/derived-completion`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Theorem 7.4 proof, p.62. Exact statement and proof read; notation is normalized in this node.; [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemma 3.13, p.24. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The actual derived p-completed pushout and cofiber comparison use DD.1/PR.0 carriers. The mathematical target is stated in the packet; G5 is not added as a hypothesis in a tautological signature.

### Completed filtered colimits of perfectoidization

Identifier: `PerfectoidQuotients:Q2/perfectoidization-completed-colimits`. Kind: **theorem**. Suggested coverage: **omitted**.

Fix integral perfectoid R and an ideal J⊂R such that S=R/J is derived p-complete. For finite subsets F⊂J set S_F=R/(F). The rings S_F are derived p-complete semiperfectoid (cokernels of maps of finite sums of derived-complete R-modules). Their colimit in derived p-complete animated rings is S. Perfectoidization carries this colimit to the colimit in perfectoid R-algebras, computed by the appropriate completed filtered colimit, with compatible units. G6 is the exact identification of that completed perfectoid colimit with the ordinary p-completion of R/K, where K is the union of the compatible finite-stage unit kernels. Once established, the image assertion follows from the baseline completion-surjectivity theorem and completeness of R.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoidization_completed_filtered_colimits`.

Conventions and hypotheses: R integral perfectoid; J arbitrary with derived-complete quotient; F finite, not necessarily a closed ideal.

Proof or construction route:

1. Use the weak-Serre property of derived complete modules to show R/(F) is derived complete, without falsely claiming ordinary separation.
2. The raw filtered colimit is R/J, which is already derived complete by hypothesis, so its derived completed colimit is S.
3. Use the left-adjoint universal property and the perfect-prism presentation to construct the completed colimit of the perfectoid targets. Preservation of colimits is in this category, not an identification with a raw ring colimit.
4. The uniformly bounded p-torsion of perfectoid targets supplies the derived/classical p-completion comparison. The exact perfect-prism filtered-colimit carrier is requested from PR.0/DD.1.
5. For the finite-stage surjective units write their perfectoid targets as R/K_F compatibly. Establish that their perfectoid colimit is the ordinary p-completion of R/(⋃K_F), and that its units are the canonical quotient-completion maps. The root/perfect-prism colimit carrier and this comparison remain G6. Then apply the three named baseline completion theorems to R→R/(⋃K_F); no second image lemma is missing.

Acceptance:

- Distinguish finite-stage derived completeness from ordinary p-adic separation.
- For J finitely generated the system has a terminal finite subset of generators after passing to generated ideals.

Direct prerequisites: `PerfectoidQuotients:Q2/universal-perfectoidization`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`, `PrismaticCohomology:PR.0/prism-perfection`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`, `DerivedDeRhamCohomology:DD.1`, `mathlib:AdicCompletion.map_surjective`, `mathlib:AdicCompletion.of_surjective`, `mathlib:AdicCompletion.map_of`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Theorem 7.4 proof, p.62. Exact statement and proof read; notation is normalized in this node.; [Stacks Project: Derived completion and derived completion of rings](https://stacks.math.columbia.edu/tag/091N), Tags 091P and 091U; weak-Serre property. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The actual completed animated/perfect-prism colimit carrier and its quotient-completion identification remain G6. Completion-surjectivity after that identification is already in the baseline.

## Q3 — flat covers and root extensions

### Lifting quasisyntomic covers to prisms

Identifier: `PerfectoidQuotients:Q3/lifting-quasisyntomic-covers-to-prisms`. Kind: **application**. Suggested coverage: **import**.

For a bounded prism (A,I) and a quasisyntomic A/I-algebra R, there is a prism object (B → B/IB ← R) with R → B/IB p-completely faithfully flat. The map A → B is (p,I)-completely flat and faithfully flat if A/I → R is p-completely faithfully flat. If A is perfect, completed perfection B_perf retains these assertions. Use the existing PR.2/quasisyntomic-covers-lift-to-prisms node as the single planned theorem. This Q3 node records its application to monic-root covers and the ownership correction required by RS-01 and this issue.

Conventions and hypotheses: p is prime; the precise hypotheses of every imported supplier node are part of this contract.

Proof or construction route:

1. Use the named supplier nodes, once, on their actual carriers. This node records their application and reexport; it defines no second generic object.
2. Check the supplier hypotheses before instantiation. A blueprint supplier is planned mathematics, never a baseline implementation. Supplier reviews and unavailable Lean carriers remain in the gap register.

Acceptance:

- The R → B/IB map is faithfully flat even when A/I → R is only flat.
- Faithful flatness over the base is asserted only with the added cover hypothesis.
- Generic lifting theorem must move to Q3; no competing copy is reconstructed here.

Direct prerequisites: `PrismaticCohomology:PR.2/quasisyntomic-covers-lift-to-prisms`, `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`, `DerivedDeRhamCohomology:DD.5/elementary-semiperfectoid-covers`, `PerfectoidQuotients:Q2/derived-prismatic-initiality-import-contract`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Proposition 7.11 with proof, p.60. Source milestones are reexported through their existing owners, not reconstructed here.

Suggested-file boundary: Application/reexport only. All generic declarations retain the exact supplier names listed in prerequisites; this file defines no second generic carrier.

### André’s flatness lemma

Identifier: `PerfectoidQuotients:Q3/andre-flatness-lemma`. Kind: **theorem**. Suggested coverage: **omitted**.

Every integral perfectoid ring R has a p-completely faithfully flat map R → S to an integral perfectoid ring S in which every monic polynomial has a root. Thus S is absolutely integrally closed (in this sense, not required to be a domain). Every element of S admits a compatible system of p-power roots. The map can be chosen ind-syntomic modulo p by Remark 7.15.

Proposed declaration: `TauCeti.PerfectoidQuotients.andre_flatness`.

Conventions and hypotheses: R is any integral perfectoid ring, including rings with p-torsion and zero rings.

Proof or construction route:

1. For a monic polynomial, adjoining one root gives a finite free algebra; adjoining roots of all monic polynomials gives a filtered ind-syntomic cover. Derive p-complete it.
2. Use the perfect prism attached to R and Q3 lifting of quasisyntomic covers. Perfect the lift to obtain a new perfectoid R₁ with a p-completely faithfully flat map from R and roots of all polynomials over R.
3. Repeat at successor ordinals. At limit ordinals take the properly p-completed filtered colimit; use G4 for the fixed-size universe, monic-polynomial descent and preservation of faithful flatness and perfectoidness.
4. Every monic polynomial over the final ring has finitely many coefficients and therefore comes from a prior stage. To choose compatible p-power roots of x, choose x₀=x, then a root xₙ₊₁ of X^p−xₙ; do not choose unrelated roots of X^(p^n)−x.
5. The modulo-p ind-syntomic refinement is the separate named target below. No v-descent or Q4 result is used.

Acceptance:

- The target may be F_p × F_p extended componentwise; absolutely integrally closed does not mean an algebraically closed field.
- The compatible-root tower satisfies xₙ₊₁^p=xₙ for every n.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q3/lifting-quasisyntomic-covers-to-prisms`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`, `PrismaticCohomology:PR.0/prism-perfection`, `DerivedDeRhamCohomology:DD.1/complete-flatness`, `DerivedDeRhamCohomology:DD.1`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Theorem 7.14 with proof, p.61. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The actual p-complete faithfully flat predicate and completed extension colimit are supplier interfaces. Monic polynomial roots are required in the resulting ring; no unspecified root property is introduced.

Atlas planet: **André’s flatness lemma**.

### Relative perfectoid covers of the smooth site

Identifier: `PerfectoidQuotients:Q3/relative-perfectoid-cover-of-smooth-site`. Kind: **theorem**. Suggested coverage: **omitted**.

For bounded (A,I), a p-completely smooth A/I-algebra R and a quasisyntomic cover R → R∞ with (L_R∞/(A/I))^∧_p=0, let B=Δ_R∞/A. Then B is a discrete relatively perfect δ-A-algebra, (p,I)-completely flat over A, B/IB≅R∞, and (B,IB) covers the final object of the relative prismatic site of R. Here “covers” means that every test prism receives a faithfully flat refinement mapping from B.

Proposed declaration: `TauCeti.PerfectoidQuotients.relative_perfectoid_cover_smooth_site`.

Conventions and hypotheses: The cotangent condition is full derived vanishing; do not substitute ordinary formally étale without comparison.

Proof or construction route:

1. Derived Hodge–Tate comparison shows B/IB≅R∞ and complete flatness; PR.2 discreteness gives its prism structure.
2. For a test C under R, base-change R → R∞ to C/IC. Apply the Q3 lifting contract to produce a faithfully flat prism D.
3. Complete étale deformation theory gives the unique δ-map B → D lifting R∞ → D/ID; verify compatibility with R.

Acceptance:

- For a crystalline perfect base use the perfection of R.
- For chosen étale coordinates use the derived p-complete root-adjoining quotient and retain its quasisyntomic-cover proof.

Direct prerequisites: `PerfectoidQuotients:Q2/derived-prismatic-initiality-import-contract`, `PerfectoidQuotients:Q3/lifting-quasisyntomic-covers-to-prisms`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-cotangent-vanishing`, `PrismaticCohomology:PR.0/delta-etale-extension`, `DerivedDeRhamCohomology:DD.1/complete-flatness`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Example 7.12 with proof and footnote 12, p.61. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The actual smooth/prismatic-site, completed cotangent and relatively perfect δ-algebra carriers are missing.

### Frobenius-flat prism perfection covers

Identifier: `PerfectoidQuotients:Q3/frobenius-flat-prism-perfection-cover`. Kind: **theorem**. Suggested coverage: **omitted**.

If (A,I) is a bounded prism whose Frobenius φ:A → A is (p,I)-completely flat, then the completed perfection (B,IB) has B/IB perfectoid and covers the final object of the absolute prismatic site of A/I. For a perfect base A, completed perfection of a flat prism map preserves (p,I)-complete flatness, and faithful flatness when the map was faithful.

Proposed declaration: `TauCeti.PerfectoidQuotients.frobenius_flat_prism_perfection_cover`.

Conventions and hypotheses: Boundedness and complete flatness of φ are required; for the second assertion the base prism is perfect.

Proof or construction route:

1. The completed perfection is the filtered colimit along φ followed by derived (p,I)-completion, on the corrected PR.0 carrier.
2. Flatness is preserved in this system by base change and filtered colimits; DD.1 completeness transports the modulo-ideal flatness tests. For a perfect base the transition twists are harmless.
3. For a test prism use the refinement argument of Example 7.12. The regular-reduction case follows from the prism Frobenius-flatness criterion requested from PR.0.

Acceptance:

- A regular A/I is the stated source example; the Kunz/relative Frobenius input is requested, not assumed for every prism.

Direct prerequisites: `PrismaticCohomology:PR.0/prism-perfection`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`, `PrismaticCohomology:PR.0/bounded-prism-complete-flatness`, `PrismaticCohomology:PR.0`, `PerfectoidQuotients:Q3/lifting-quasisyntomic-covers-to-prisms`, `DerivedDeRhamCohomology:DD.1/complete-flatness`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Proposition 7.11(2), Example 7.13, pp.60–61. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The relatively regular reduction Frobenius-flatness criterion and actual completed prism perfection carrier must be supplied by PR.0/DD.1.

### André extension ind-syntomic modulo p

Identifier: `PerfectoidQuotients:Q3/andre-ind-syntomic-mod-p`. Kind: **theorem**. Suggested coverage: **omitted**.

The map R → S in André’s flatness lemma can be chosen so R/p → S/p is an ind-syntomic faithfully flat cover. This is a modulo-p refinement of the general integral theorem. It is distinct from the ordinary ind-syntomic theorem of ČS24 Proposition 2.3.4, which remains owned by IntegralPerfectoidPartII.

Proposed declaration: `TauCeti.PerfectoidQuotients.andre_ind_syntomic_mod_p`.

Conventions and hypotheses: R integral perfectoid; use the monic-polynomial construction in the André theorem.

Proof or construction route:

1. For one monic f, apply PR.2 regular-envelope computation to R⟨Y^(1/p^∞)⟩/(f(Y)). After the stated base change reduce to p-torsion-free R.
2. Use PR.0 Frobenius twist of the prismatic envelope as the divided-power envelope; import CR.0 for the characteristic-p formula D(f)≅A/f^p[g₁,g₂,…]/(g_i^p).
3. Lift the truncated polynomial presentation across a nilpotent ideal; the finite-stage presentations are syntomic and their filtered colimit is the envelope.
4. Pass through the successive and limit monic-root stages; the required completion and size comparison is part of G4, and the precise CR.0 formula is requested.

Acceptance:

- Retain “modulo p”; do not identify this with the stronger ordinary ind-syntomic Part II route.

Direct prerequisites: `PerfectoidQuotients:Q3/andre-flatness-lemma`, `PrismaticCohomology:PR.2/regular-quotient-prismatic-envelope`, `PrismaticCohomology:PR.0/pd-envelope-as-delta-envelope`, `CrystallineCohomology:CR.0`, `DerivedDeRhamCohomology:DD.1`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Remark 7.15 with proof, p.62. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The ind-syntomic predicate and divided-power envelope/finite stages need the owning suppliers. The stronger ordinary ind-syntomic theorem of ČS24 is not substituted for the modulo-p statement.

### Rational neighborhoods for adjoining roots

Identifier: `PerfectoidQuotients:Q3/bhatt-rational-root-neighborhoods`. Kind: **application**. Suggested coverage: **omitted**.

For a Bhatt integral perfectoid K°-model A and g∈A, set Y=Spa(A⟨T^(1/p^∞)⟩[1/t],A⟨T^(1/p^∞)⟩) using the P1/P2 powerbounded integral model. For ℓ≥0 let U_ℓ={y:|T(y)−g(y)|≤|t(y)|^ℓ} and B_ℓ=O_Y⁺(U_ℓ). These are nested rational neighborhoods of V(T−g), with restriction maps B_ℓ → B_(ℓ+1). B_ℓ is the integral rational-localization model furnished by P2 and is integral perfectoid after the necessary almost-elements saturation.

Proposed declaration: `TauCeti.PerfectoidQuotients.bhatt_root_neighborhoods`.

Conventions and hypotheses: K,t,A as in the field integral model comparison; g arbitrary.

Proof or construction route:

1. Import the completed root polynomial algebra and the P2 rational-subset construction.
2. Since t is a topologically nilpotent unit after localization, the displayed inequality is rational. The denominator is t^ℓ.
3. Use restriction in the correct direction as ℓ increases; the intersection of these neighborhoods is the vanishing locus. The P2 integral-model contract supplies O⁺ and its comparison to the powerbounded ring.

Acceptance:

- The inequalities shrink with ℓ, while the ring maps form a direct system.
- The construction is available before Q4: use the P4 pro-rational intersection construction for the closed locus, without invoking surjectivity.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/bhatt-field-integral-model-comparison`, `PerfectoidQuotients:Q0:integral-algebra/completed-root-polynomial-algebras`, `PerfectoidSpaces:P1/almost-integral-dictionary`, `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `PerfectoidSpaces:P2/almost-integral-model-of-untilted-rational-localization`.

Source: [On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882v2), Notation 2.1 and Definition 2.2, p.4. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The fixed-field rational-localization, powerbounded integral model and saturated inverse limit are P0/P1/P2/P4 carriers. The application imports their actual constructions.

### Bhatt’s perfectoid root extension

Identifier: `PerfectoidQuotients:Q3/bhatt-perfectoid-root-extension`. Kind: **construction**. Suggested coverage: **omitted**.

For a Bhatt integral perfectoid K°-algebra A and g∈A, form the ordinary t-completion C of colim_ℓ B_ℓ from the rational neighborhoods of T−g and set A∞=C_* using the P0 almost-elements saturation. Then A∞ is an integral perfectoid K°-model, has a natural map from A, and has a distinguished compatible root tower of g given by the coordinates T^(1/p^n). The raw completion C is only asserted almost isomorphic to A∞; Bhatt footnote 6 explicitly requires this correction. This geometric construction supplies the field-based alternative, not the strong actual-flatness statement of BS22 Theorem 7.14.

Proposed declaration: `TauCeti.PerfectoidQuotients.bhattRootExtension`.

Conventions and hypotheses: K,t,A,g as in the rational-neighborhood target; almost ideal m=(t^(1/p^n)).

Proof or construction route:

1. Build the direct system using rational restriction, take ordinary t-completion and apply the established almost-elements functor.
2. In the completion T−g lies in t^ℓ for every ℓ and is zero by separation. The root coordinates therefore provide a compatible tower of g.
3. Use the P4 intersection-of-rational-subsets construction and the P1 almost-integral dictionary to obtain the perfectoid integral model after saturation. This construction does not require Q4.
4. Transport the coordinate maps through saturation; the map A → A∞ is functorial for a map of models carrying g to its image.

API:

- `TauCeti.PerfectoidQuotients.bhattRootExtension.map` (projection): The natural K°-algebra map A → A∞.
- `TauCeti.PerfectoidQuotients.bhattRootExtension.root` (data): For each n≥0, a distinguished root g_n∈A∞, with g₀ the image of g.
- `TauCeti.PerfectoidQuotients.bhattRootExtension.root_pow` (simp): g_(n+1)^p=g_n for every n.
- `TauCeti.PerfectoidQuotients.bhattRootExtension.perfectoid` (structure): A∞ is t-complete, flat over K°, saturated, and has the integral-model Frobenius isomorphism.
- `TauCeti.PerfectoidQuotients.bhattRootExtension.raw_almost_iso` (compatibility): C → C_* is an almost isomorphism for the specified root ideal.
- `TauCeti.PerfectoidQuotients.bhattRootExtension.map_comp` (functoriality): Maps of pairs (A,g) induce compatible root-extension maps preserving identities and composition.

Uses:

- **Bhatt Theorem 2.3**: Supplies the root-adjoining extension whose map is almost faithfully flat modulo t.
- **Bhatt Remark 2.7**: Iterate the geometric construction to obtain the functorial absolutely integrally closed extension.

Unit tests:

- `TauCeti.PerfectoidQuotients.bhattRootExtensionZero` (degenerate): For the zero K°-algebra the root extension is zero and every root is zero.
- `TauCeti.PerfectoidQuotients.bhattRootExtensionPower` (characterisation): For every n, the distinguished root satisfies g_n^(p^n)=image(g), and the adjacent roots satisfy the stronger compatibility equality.
- `TauCeti.PerfectoidQuotients.bhattRootExtensionModel` (compatibility): After localization the extension is the P4 universal perfectoid closed subspace V(T−g); its integral ring is the saturated powerbounded model.
- `TauCeti.PerfectoidQuotients.bhattRootExtensionRawFails` (non-example): The definition applies C_*; it never certifies an arbitrary unsaturated raw completed colimit as Bhatt-integral-perfectoid.

Acceptance:

- For the zero K°-algebra the root extension is zero and every root is zero.
- For every n, the distinguished root satisfies g_n^(p^n)=image(g), and the adjacent roots satisfy the stronger compatibility equality.
- After localization the extension is the P4 universal perfectoid closed subspace V(T−g); its integral ring is the saturated powerbounded model.
- The definition applies C_*; it never certifies an arbitrary unsaturated raw completed colimit as Bhatt-integral-perfectoid.

Direct prerequisites: `PerfectoidQuotients:Q3/bhatt-rational-root-neighborhoods`, `PerfectoidQuotients:Q0:integral-algebra/bhatt-field-integral-model-comparison`, `PerfectoidSpaces:P4/intersection-of-rational-subsets`, `PerfectoidSpaces:P1/almost-integral-dictionary`, `PerfectoidSpaces:P0/almost-hom-and-adjoints`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`.

Source: [On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882v2), Definition 2.2 and footnote 6, p.4. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The fixed-field Bhatt integral model and saturation (-)_* carrier are not implemented at the pin. Its raw completed colimit is only almost isomorphic to the saturated object; all six API items and four tests are explicitly omitted.

### Almost faithful flatness of the root extension

Identifier: `PerfectoidQuotients:Q3/bhatt-root-extension-almost-flat`. Kind: **theorem**. Suggested coverage: **omitted**.

For ℓ>0, the map A → B_ℓ is almost faithfully flat modulo t for the root ideal (t^(1/p^n)); consequently A → A∞ is almost faithfully flat modulo t. These are statements in the almost module category. They do not assert ordinary flatness or the p-completely faithfully flat general integral theorem. More generally, for a perfectoid affinoid K-pair (A,A⁺) and any positive-degree monic P(T)∈A⁺[T], let B⁺ be the π-completion of the integral closure of A⁺ in A[T^(1/p^∞)]/(P(T)), and B=B⁺[1/π]. Then (B,B⁺) is perfectoid, universal among complete uniform affinoid A-pairs equipped with a root h₀∈C⁺ of P and adjacent compatible p-power roots of h₀. The map A⁺→B⁺ is almost faithfully flat modulo π. This applies the existing P4 universal closed-space construction to P(T), and is the monic version used in the functorial iteration.

Proposed declaration: `TauCeti.PerfectoidQuotients.bhatt_root_extension_almost_faithfully_flat`.

Conventions and hypotheses: A is a Bhatt integral perfectoid K°-model; g arbitrary; ℓ>0.

Proof or construction route:

1. Use P2’s approximation lemma to choose f in the tilt with f♯≡T−g mod t^(1/p) and the same rational subset after replacing T−g by f♯.
2. Use P2’s explicit almost rational-localization formula to adjoin roots of u·t^ℓ−f♯. At level k reduce modulo t^ε for ε=1/p^(k+1).
3. The denominator term vanishes modulo t^ε; the k-fold Frobenius identifies the result with A/t^(1/p)[T^(1/p^∞),u^(1/p^∞)]/(T−g), which is faithfully flat (free) over A/t^(1/p).
4. Transport almost flatness through filtered colimits, ordinary completion and the almost-elements isomorphism. Use the exact P2 approximation and rational-model nodes above; no Q4 theorem or P3 ownership is asserted.
5. For monic P use the same rational neighborhoods and P2 approximation. Reduction modulo a small root of π gives the algebra (A♭⁺/π♭^(1/p))[T,X]/P(T), finite free faithfully flat in T and polynomial in X. The regular-sequence calculation gives the required torsion-freeness. The P4 universal closed space of P(T) has the root-tower universal property. Use A⁺ as coefficient ring in the free root-polynomial algebra, correcting the existing E53 misprint.
6. P4 provides perfectoidness and its universal property for perfectoid targets. For the stronger complete uniform target in the notes, use the explicit integral-closure carrier: a root and its compatible tower give A[T^(1/p^∞)]/(P)→C; integral closedness of C⁺ carries the integral closure of A⁺ into C⁺. Extend through π-completion and invert π. Density and completeness give uniqueness. This stronger target is not silently imported from P4.

Acceptance:

- Specify the almost ideal every time and retain ℓ>0.
- The theorem does not claim raw completed models satisfy A=A_*.
- For P(T)=T−g recover the element-root extension and its almost flatness.
- For P(T)=T recover the input pair: reducedness kills every root of zero.
- Monic and positive degree are essential in the finite-free faithful-flatness reduction.

Direct prerequisites: `PerfectoidQuotients:Q3/bhatt-perfectoid-root-extension`, `PerfectoidSpaces:P0/almost-flat-projective-finiteness`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`, `PerfectoidSpaces:P2/approximation-lemma`, `PerfectoidSpaces:P2/rational-localization-in-characteristic-p`, `PerfectoidSpaces:P2/almost-integral-model-of-untilted-rational-localization`, `PerfectoidQuotients:Q0:integral-algebra/completed-root-polynomial-algebras`, `PerfectoidSpaces:P4/universal-perfectoid-zariski-closed`.

Source: [On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882v2), Theorem 2.3 and complete proof, pp.4–5. Exact statement and proof read; notation is normalized in this node.; [Lecture notes for a class on perfectoid spaces](https://websites.umich.edu/~bhattb/teaching/mat679w17/lectures.pdf), Theorem 9.4.3(1)–(2) and proof, printed pp.113–115. The general monic-root version and its almost faithful flatness, with the coefficient ring corrected by existing source issue E53; the previous linear element-root construction is its specialization.

Suggested-file boundary: P0’s specified root-ideal almost category and P2’s rational approximation/integral-model carrier are not implemented.

### Functorial almost absolutely integrally closed extension

Identifier: `PerfectoidQuotients:Q3/functorial-almost-absolutely-integrally-closed-extension`. Kind: **theorem**. Suggested coverage: **omitted**.

On the category of Bhatt integral perfectoid K°-models there is a functor B and a natural map A → B(A), almost faithfully flat modulo t, such that B(A) is again an integral model and every monic polynomial over B(A) has a root. This is the functorial almost variant of Remark 2.7, distinct from the arbitrary integral p-complete-cover theorem.

Proposed declaration: `TauCeti.PerfectoidQuotients.functorial_almost_aic_extension`.

Conventions and hypotheses: K,t fixed; A carries the flatness, t-completeness and saturation of the Bhatt model.

Proof or construction route:

1. At a successor step index by the set of all positive-degree monic polynomials over A⁺. For each polynomial apply the monic-root version of the Bhatt almost-flat theorem, using P4’s universal closed construction. Take their coproduct in perfectoid affinoid A-pairs; its plus ring is almost isomorphic to the completed tensor product of the integral models. P0 tensor/flatness imports and finite-subset colimits preserve almost faithful flatness modulo π.
2. Maps of pairs send monic polynomials to monic polynomials, so their universal root covers induce a natural map of these polynomial-indexed coproducts. Define the same successor operation at each ordinal, and at limits use the P5 completed filtered-colimit pair, with the fixed image of π and its roots.
3. At ω₁ the underlying diagram is countably filtered. A Cauchy sequence and all compatibility witnesses come from countably many stages, hence one stage below ω₁. Thus the raw plus-ring colimit is already π-complete by the DD.1 countably-filtered completion criterion; the P5 completion adds no elements. Each monic polynomial has finitely many coefficients from an earlier stage and a root at its successor. This gives absolute integral closedness and preserves the natural maps.
4. Corollary 9.4.7 with its full proof was acquired and read in the dated author notes. It supplies the formerly missing source argument G8. Its completed pair, tensor and almost interfaces are existing suppliers; their unavailable implemented carriers remain G2.

Acceptance:

- Naturality for every map of integral K°-models is required; choosing unrelated extensions for each A does not satisfy this target.

Direct prerequisites: `PerfectoidQuotients:Q0:integral-algebra/bhatt-field-integral-model-comparison`, `PerfectoidQuotients:Q3/bhatt-perfectoid-root-extension`, `PerfectoidQuotients:Q3/bhatt-root-extension-almost-flat`, `PerfectoidSpaces:P0/almost-hom-and-adjoints`, `DerivedDeRhamCohomology:DD.1`, `PerfectoidQuotients:Q0:integral-algebra/completed-perfectoid-tensor-products`, `PerfectoidSpaces:P0/almost-tensor-and-internal-hom`, `PerfectoidSpaces:P0/almost-flat-projective-finiteness`, `PerfectoidSpaces:P0/almost-zero-limits-and-colimits`, `PerfectoidSpaces:P5/completed-colimit-of-perfectoid-pairs`, `PerfectoidSpaces:P5/completed-colimit-is-perfectoid`.

Source: [On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882v2), Remark 2.7, p.5. Remark 2.7 states the fixed-field functorial almost variant and refers its proof to the now-acquired Corollary 9.4.7.; [Lecture notes for a class on perfectoid spaces](https://websites.umich.edu/~bhattb/teaching/mat679w17/lectures.pdf), Corollary 9.4.7 and proof, printed pp.115–117. The polynomial-indexed coproduct, functoriality and ω₁ countably-filtered completeness argument are read in full; this closes the bibliography/iteration gap G8, while the supplier-carrier gap G2 persists.

Suggested-file boundary: The actual almost category and functorial completed construction use P0/P5 carriers, absent at the pin (G2). The cited Corollary 9.4.7 and its transfinite proof have now been acquired and outlined; there is no missing-source gap.

## Q4 — universal perfectoid quotients

### Surjectivity of powers on a quotient

Identifier: `PerfectoidQuotients:Q4/quotient-frobenius-surjective`. Kind: **lemma**. Suggested coverage: **full**.

If the p-th-power function on a commutative ring R is surjective, its p-th-power function on R/I is surjective for every ideal I.

Proposed declaration: `TauCeti.PerfectoidQuotients.quotient_pow_surjective`.

Conventions and hypotheses: p prime in the roadmap specialization. The argument itself needs no characteristic or reducedness assumption.

Proof or construction route:

1. Lift a quotient element to r∈R using the existing surjective quotient map. Choose a p-th root s of r. Its class is a p-th root of the given quotient element.

Acceptance:

- It holds even for the semiperfect nonreduced quotient A/(t), so surjectivity alone cannot be the target perfectoid criterion.

Direct prerequisites: `mathlib:Ideal.Quotient.mk_surjective`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Theorem 7.4 and its proof, pp.56 and 62. Elementary characteristic-p specialization used in the quotient proof; source-derived bookkeeping, not a separately named theorem in BS22.

### Perfect quotients of a perfect characteristic-p ring

Identifier: `PerfectoidQuotients:Q4/perfect-quotient-radical-criterion`. Kind: **lemma**. Suggested coverage: **full**.

For a perfect ring R of characteristic p and any ideal I, PerfectRing(R/I,p) holds if and only if I is radical. This includes I=R and its zero quotient.

Proposed declaration: `TauCeti.PerfectoidQuotients.quotient_perfect_iff_radical`.

Conventions and hypotheses: p prime; R a perfect commutative ring of characteristic exactly p; no properness or finite-generation condition on I.

Proof or construction route:

1. The quotient power map is surjective by quotient-frobenius-surjective. If I is radical then R/I is reduced; split off the zero ring, and in the nonzero case give the quotient characteristic p and apply PerfectRing.ofSurjective.
2. Conversely, bijectivity of the p-th power implies that no nonzero element of the quotient is nilpotent: choose p^n at least the nilpotence exponent and use injectivity repeatedly. The existing radical/reduced-quotient equivalence gives radicality of I.

Acceptance:

- The top ideal gives the zero ring, which still has bijective p-th power. Nonradical ideals fail injectivity.

Direct prerequisites: `PerfectoidQuotients:Q4/quotient-frobenius-surjective`, `mathlib:Ideal.isRadical_iff_quotient_reduced`, `mathlib:PerfectRing.ofSurjective`, `mathlib:CharP.charP_iff_prime_eq_zero`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Example 3.15, p.24. Packet-derived elementary quotient criterion supporting the BS22 characteristic-p application.; [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Theorem 7.4 and its proof, pp.56 and 62. Specialization to quotients of perfect characteristic-p rings.

### The radical quotient is integral perfectoid

Identifier: `PerfectoidQuotients:Q4/radical-quotient-integral-perfectoid`. Kind: **lemma**. Suggested coverage: **full**.

For a perfect characteristic-p ring R and any ideal I, R/√I is integral perfectoid at p, including the zero quotient.

Proposed declaration: `TauCeti.PerfectoidQuotients.radical_quotient_integralPerfectoid`.

Conventions and hypotheses: p prime; R perfect of characteristic p.

Proof or construction route:

1. The radical is radical in the existing ideal API. The perfect-quotient criterion gives PerfectRing(R/√I,p).
2. If the quotient is zero use the explicit zero-ring branch. Otherwise the map from R gives characteristic p, and the characteristic-p perfectoid criterion applies.

Acceptance:

- For I=0 the quotient is R; for I=R it is the zero ring.

Direct prerequisites: `PerfectoidQuotients:Q4/perfect-quotient-radical-criterion`, `PerfectoidQuotients:Q0:integral-algebra/characteristic-p-perfectoid-criterion`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `mathlib:Ideal.radical_isRadical`, `mathlib:CharP.charP_iff_prime_eq_zero`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Theorem 7.4 and its proof, pp.56 and 62. Candidate perfectoidization in characteristic p, combined with BMS1 Example 3.15.

### Perfectoidization of a characteristic-p quotient

Identifier: `PerfectoidQuotients:Q4/characteristic-p-perfectoidization-universal`. Kind: **theorem**. Suggested coverage: **full**.

Let R be a perfect ring of characteristic p and I an arbitrary ideal. For every integral perfectoid ring T and ring map f:R→T killing I, there is a unique ring map g:R/√I→T with g composed with the quotient map equal to f. Together with the preceding perfectoidness lemma and the existing surjective map R/I→R/√I, this identifies R/√I as the universal integral perfectoid ring under R/I.

Proposed declaration: `TauCeti.PerfectoidQuotients.radical_quotient_universal`.

Conventions and hypotheses: No characteristic assumption is imposed on T: the given ring map forces p=0 in T. The zero target is allowed.

Proof or construction route:

1. If T is zero the factorization is unique. Otherwise f(p)=0 gives characteristic p; the integral-perfectoid criterion makes T perfect, hence reduced.
2. Every element of √I maps to a nilpotent and hence to zero in T. Apply the existing Ideal.Quotient.lift to f.
3. The quotient map from R is surjective, so the lift is unique. Apply Ideal.quotientMap_surjective to the identity of R and I≤√I for the surjectivity from R/I. No transfinite prism, completed base change or André theorem enters this specialization.

Acceptance:

- Surjectivity is a statement about the canonical quotient map, not an abstract existence of a perfectoid target. It works for infinitely generated I.

Direct prerequisites: `PerfectoidQuotients:Q4/radical-quotient-integral-perfectoid`, `PerfectoidQuotients:Q0:integral-algebra/characteristic-p-perfectoid-criterion`, `mathlib:CharP.charP_iff_prime_eq_zero`, `mathlib:Ideal.Quotient.lift`, `mathlib:Ideal.Quotient.mk_surjective`, `mathlib:Ideal.quotientMap_surjective`, `mathlib:Ideal.radical`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Theorem 7.4 and its proof, pp.56 and 62. Explicit characteristic-p proof of the universal-property and surjectivity specialization; no claim to close the mixed-characteristic theorem.

Atlas planet: **Perfectoidization in characteristic p**.

### The ideal of all roots of a principal element

Identifier: `PerfectoidQuotients:Q4/compatible-root-ideal-radical`. Kind: **theorem**. Suggested coverage: **full**.

In a perfect ring R of characteristic p, for f∈R the ideal generated by φ^(−n)(f), n≥0, equals √(f). Roots here are supplied by the inverse of the existing Frobenius ring equivalence.

Proposed declaration: `TauCeti.PerfectoidQuotients.root_span_eq_radical`.

Conventions and hypotheses: p prime; R perfect of characteristic p. This is an algebraic ideal with no topology attached.

Proof or construction route:

1. Every listed root has p^n-th power f, so belongs to √(f).
2. If x^m belongs to (f), choose n with p^n≥m, and write x^(p^n)=fc. Apply the inverse n-th Frobenius to obtain x=φ^(−n)(f)φ^(−n)(c), proving membership in the root ideal.
3. Both inclusions hold for arbitrary f, including zero and units. The fixed-root sequence has exact compatibility, not independently chosen roots.

Acceptance:

- For f=0 the ideal is zero; for f=1 it is top; every compatible root maps to zero in the radical quotient.

Direct prerequisites: `mathlib:frobeniusEquiv`, `mathlib:frobeniusEquiv_symm_pow_p`, `mathlib:Ideal.radical`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Theorem 7.4 and its proof, pp.56 and 62. The root-ideal description in the printed principal-case proof, specialized to characteristic p and supplied with an elementary algebraic argument.

### Which algebraic quotients stay integral perfectoid

Identifier: `PerfectoidQuotients:Q4/integral-perfectoid-quotient-radical-criterion`. Kind: **theorem**. Suggested coverage: **full**.

For a perfect characteristic-p ring R and any ideal I, R/I is integral perfectoid at p if and only if I is radical.

Proposed declaration: `TauCeti.PerfectoidQuotients.quotient_perfectoid_iff_radical`.

Conventions and hypotheses: p prime; characteristic-p perfect source; arbitrary ideal, including top.

Proof or construction route:

1. Split the zero quotient. The ideal is then top and radical, and the zero ring is integral perfectoid.
2. For a nonzero quotient, transfer characteristic p along the quotient map. Apply the characteristic-p integral-perfectoid criterion followed by the perfect-quotient radical criterion.

Acceptance:

- For A=F₂[t^(1/2^∞)], the ideal (t) is not radical because t^(1/2) is outside it but has square in it. Its quotient is semiperfect but not integral perfectoid.

Direct prerequisites: `PerfectoidQuotients:Q4/perfect-quotient-radical-criterion`, `PerfectoidQuotients:Q0:integral-algebra/characteristic-p-perfectoid-criterion`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `mathlib:CharP.charP_iff_prime_eq_zero`.

Source: [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Example 3.15, p.24. Exact algebraic quotient application; no Tate or completed-quotient assertion.; [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Theorem 7.4 and its proof, pp.56 and 62. Acceptance criterion for the characteristic-p surjectivity route.

### Surjectivity of perfectoidization

Identifier: `PerfectoidQuotients:Q4/surjectivity-of-perfectoidization`. Kind: **theorem**. Suggested coverage: **full**.

For every semiperfectoid S, the unit η_S:S → S_perfd is surjective. Equivalently its universal perfectoid ring is an ordinary quotient of S. Neither S nor every quotient of a perfectoid ring is thereby declared perfectoid.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoidization_surjective`.

Conventions and hypotheses: S is derived p-complete and has a perfectoid quotient presentation R ↠ S.

Proof or construction route:

1. Write S=R/J. Use the Q2 completed filtered-colimit contract to reduce to finitely generated J and then successively to principal ideals. For the finite induction, after S_n→S_n,perfd is surjective, maps from S_n/(f) to perfectoid targets correspond to maps from S_n,perfd/(η(f)); apply the principal theorem there, then identify its perfectoidization by the universal property. Derived completeness of the finite quotient follows from the weak Serre criterion, not from ordinary completeness of arbitrary quotients.
2. For J=(f), use André to pass to a p-completely faithfully flat perfectoid R′ where f has compatible roots. This passage requires the separately recorded noncircular base-change and surjectivity descent contract G5.
3. Every map R′/(f) to a perfectoid target kills all roots because the target is reduced. The universal ring is the p-completion of R′/(f^(1/p^∞)), which is perfectoid by the Q0 root-stable quotient theorem.
4. Use the principal-root-quotient node: baseline completion preserves surjections, and the perfectoid source is ordinarily p-complete, so the canonical map onto the completed root quotient is surjective.
5. Descend surjectivity using G5. The printed proof abbreviates these reductions; Proposition 8.5 or v/arc descent from §8 or §10 cannot be used to close an earlier argument.

Acceptance:

- The characteristic-p root quotient maps surjectively onto its radical quotient and is not itself perfectoid.
- The theorem includes mixed-characteristic semiperfectoid quotients with p-torsion.
- A presentation change does not change the unit map.

Direct prerequisites: `PerfectoidQuotients:Q2/semiperfectoid-rings`, `PerfectoidQuotients:Q2/universal-perfectoidization`, `PerfectoidQuotients:Q3/andre-flatness-lemma`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-rings-reduced`, `PerfectoidQuotients:Q0:integral-algebra/completed-root-stable-quotients`, `PerfectoidQuotients:Q2/completed-perfectoidization-base-change`, `PerfectoidQuotients:Q2/perfectoidization-completed-colimits`, `PerfectoidQuotients:Q4/principal-root-quotient-perfectoidization`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Theorem 7.4 and proof, pp.56,62. Exact statement and proof read; notation is normalized in this node.

Atlas planet: **Surjectivity of perfectoidization**.

### Completed integral closed quotient

Identifier: `PerfectoidQuotients:Q4/completed-integral-closed-quotient`. Kind: **construction**. Suggested coverage: **omitted**.

Let (R,R⁺) be a perfectoid Tate pair and I any ideal of R. Choose a compatible-root pseudouniformizer ϖ∈R⁺ with ϖ^p dividing p. Set S to the ordinary ϖ-adic completion of R⁺/(I∩R⁺), prove that S is semiperfectoid in the derived sense, and define R_I=S_perfd[1/ϖ]. Let R_I⁺ be the minimal open integrally closed subring of R_I containing the image of R⁺. Then R_I is a perfectoid Tate ring and the canonical continuous map q:R → R_I has the universal property among continuous maps from R to perfectoid Tate rings annihilating I. Different choices of ϖ give canonically isomorphic pairs over (R,R⁺). The ideal I need not be topologically closed or finitely generated.

Proposed declaration: `TauCeti.PerfectoidQuotients.perfectoidClosedQuotient`.

Conventions and hypotheses: R complete Hausdorff perfectoid Tate; R⁺ open, integrally closed in R and contained in R°; I arbitrary.

Proof or construction route:

1. Use the P1 integral/Tate comparison and compatible-root pseudouniformizer: R⁺ is integral perfectoid and ordinarily ϖ-adically complete. Apply the baseline AdicCompletion.map_surjective to R⁺ → R⁺/(I∩R⁺), combine with of_surjective for R⁺ and map_of, and transport the image ideal of (ϖ). This makes the canonical R⁺ → S surjective for arbitrary I, including a nonclosed or infinitely generated ideal.
2. The ordinary principal-ideal completion S is ϖ-adically complete and separated. Stacks 091T implies derived ϖ-completeness, without a bounded-torsion premise. Since p=ϖ^p a, ϖ is invertible in S[1/p]; the complexes over S[1/p] are among those over S[1/ϖ]. Apply the orthogonality characterization 091P(2) to S[1/p] and its shifts to obtain derived p-completeness of S. Together with the preceding surjection this is the semiperfectoid presentation. In characteristic p, S[1/p] is zero, so the same argument applies.
3. Apply the integral universal perfectoidization and localize at ϖ. The surjective maps R⁺ → S and S → S_perfd stay surjective after localization; R⁺[1/ϖ]=R therefore gives the surjective ring map R → S_perfd[1/ϖ]. The remaining P1 Tate adapter, its topology and any ϖ-power-torsion removal before localization are the transport obligations in G7.
4. Construct the minimal plus ring on the P4 carriers by integral closure of the image of R⁺, with the openness and powerbounded assertions furnished by the requested adapter.
5. Extend a continuous map killing I first to the completed integral quotient, then to its universal perfectoidization, and finally to the localization. Uniqueness follows at each step.
6. Use the P4 universal perfectoid Zariski-closed construction to identify this pair by its mapping property, and then compare the spectrum and integral rings.

API:

- `TauCeti.PerfectoidQuotients.perfectoidClosedQuotient.map` (projection): The continuous map q:R → R_I annihilates I.
- `TauCeti.PerfectoidQuotients.perfectoidClosedQuotient.plus` (data): R_I⁺ is the minimal open integrally closed subring containing q(R⁺).
- `TauCeti.PerfectoidQuotients.perfectoidClosedQuotient.lift` (universal-property): A continuous map to a perfectoid Tate ring killing I factors uniquely through q.
- `TauCeti.PerfectoidQuotients.perfectoidClosedQuotient.choices` (equivalence): Choices of pseudouniformizer and integral presentation give canonically isomorphic pairs.
- `TauCeti.PerfectoidQuotients.perfectoidClosedQuotient.spa` (compatibility): The induced Spa map is the P4 universal perfectoid Zariski-closed subspace with image V(I).

Uses:

- **ECD Theorem 5.8**: Realizes a Zariski closed subset by an affinoid perfectoid quotient.
- **PerfectoidSpaces:P8, PerfectoidShimuraVarieties:S2/S4 and PrismaticCohomology:PR.4**: Supplies the early semiperfectoid closed-quotient endpoint; general integral algebras require the separate late Q5 proposal.

Unit tests:

- `TauCeti.PerfectoidQuotients.closedQuotientZeroIdeal` (compatibility): For I=0 recover (R,R⁺).
- `TauCeti.PerfectoidQuotients.closedQuotientUnitIdeal` (degenerate): For I=R obtain the empty affinoid space and zero pair.
- `TauCeti.PerfectoidQuotients.closedQuotientCharacteristicP` (computation): In characteristic p the perfectoid kernel contains the radical of I; the raw nonradical quotient is not the answer.
- `TauCeti.PerfectoidQuotients.closedQuotientNonclosedIdeal` (non-example): Allow a nonclosed ideal I; the universal pair depends on V(I), and its kernel is a closed saturated ideal containing I.
- `TauCeti.PerfectoidQuotients.closedQuotientPlus` (compatibility): The plus ring is integral closure of the image with openness, rather than an arbitrarily chosen powerbounded ring.

Acceptance:

- For I=0 recover (R,R⁺).
- For I=R obtain the empty affinoid space and zero pair.
- In characteristic p the perfectoid kernel contains the radical of I; the raw nonradical quotient is not the answer.
- Allow a nonclosed ideal I; the universal pair depends on V(I), and its kernel is a closed saturated ideal containing I.
- The plus ring is integral closure of the image with openness, rather than an arbitrarily chosen powerbounded ring.

Direct prerequisites: `PerfectoidQuotients:Q2/universal-perfectoidization`, `PerfectoidQuotients:Q4/surjectivity-of-perfectoidization`, `PerfectoidSpaces:P1/integral-perfectoid-comparison`, `PerfectoidSpaces:P1/perfectoid-tate-ring-from-integral-perfectoid`, `PerfectoidSpaces:P1/exists-pseudouniformizer-with-compatible-roots`, `PerfectoidSpaces:P4/universal-perfectoid-zariski-closed`, `PerfectoidSpaces:P4/zariski-closed-immersion`, `PerfectoidSpaces:P4`, `mathlib:AdicCompletion.map_surjective`, `mathlib:AdicCompletion.of_surjective`, `mathlib:AdicCompletion.map_of`, `PerfectoidQuotients:Q2/semiperfectoid-rings`, `DerivedDeRhamCohomology:DD.1`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Remark 7.5, p.56. Exact statement and proof read; notation is normalized in this node.; [Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), Definition 5.7(ii) and Theorem 5.8, pp.24–25. Exact statement and proof read; notation is normalized in this node.; [Stacks Project: Derived completion and derived completion of rings](https://stacks.math.columbia.edu/tag/091N), 091T, Proposition 15.93.5; 091P, Lemma 15.93.1(2), and their proofs. Classical completeness for the principal ideal (ϖ) implies derived completeness; orthogonality to all complexes over S[1/ϖ] implies orthogonality to S[1/p], because ϖ^p divides p. No bounded-torsion hypothesis is added.

Suggested-file boundary: The actual topological perfectoid Tate-pair, plus-ring and Spa carriers come from P1/P4. The completed integral model’s semiperfectoidness is outlined through baseline completion surjectivity and Stacks 091T/091P; its Tate topology, localization and minimal plus-ring comparison remain G7.

Atlas planet: **Closed perfectoid quotient**.

### Zariski closed subsets are strongly Zariski closed

Identifier: `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`. Kind: **theorem**. Suggested coverage: **omitted**.

Every Zariski closed subset Z=V(I) of Spa(R,R⁺), for an affinoid perfectoid Tate pair and any ideal I⊂R, is strongly Zariski closed on the P4 immersion carriers: the universal pair (R_I,R_I⁺) has a surjective map R → R_I, its Spa map is a homeomorphism onto Z, and the integral map R⁺ → R_I⁺ is almost surjective for the root ideal generated by ϖ^(1/p^n). This identifies Z with an affinoid perfectoid space and agrees with the P4 universal construction.

Proposed declaration: `TauCeti.PerfectoidQuotients.zariskiClosed_is_stronglyZariskiClosed`.

Conventions and hypotheses: Same hypotheses as the completed integral closed-quotient construction; I arbitrary.

Proof or construction route:

1. Apply Q4 integral surjectivity, then prove surjectivity of R → S_perfd[1/ϖ] using the precise integral-completion adapter G7 rather than asserting that completion is surjective.
2. Use the universal property to identify the P4 universal closed subspace and its spectrum.
3. Import P4/surjective-perfectoid-map-almost-surjective-on-plus-rings: for every n and every b∈R_I⁺, multiplication by ϖ^(1/p^n) puts b in the image of R⁺.
4. Use the P4 definitions to conclude strongly Zariski closed and the equivalence of notions. This theorem does not supply an input to AdicEtaleGeometry:A3.

Acceptance:

- Check the same morphism on the P4 carriers, not a newly defined immersion predicate.
- For I=0 the quotient and integral map are identities; for I=R the spectrum is empty.

Direct prerequisites: `PerfectoidQuotients:Q4/completed-integral-closed-quotient`, `PerfectoidQuotients:Q4/surjectivity-of-perfectoidization`, `PerfectoidSpaces:P4/universal-perfectoid-zariski-closed`, `PerfectoidSpaces:P4/strongly-zariski-closed-immersion`, `PerfectoidSpaces:P4/surjective-perfectoid-map-almost-surjective-on-plus-rings`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Remark 7.5, p.56. Exact statement and proof read; notation is normalized in this node.; [Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), Theorem 5.8, p.24. Exact statement and proof read; notation is normalized in this node.

Suggested-file boundary: The actual affinoid perfectoid, closed-immersion and plus-ring carriers are unavailable. The integral-model proof obligation is G7.

Atlas planet: **Strongly Zariski closed subsets**.

### Perfectoidization of a principal root quotient

Identifier: `PerfectoidQuotients:Q4/principal-root-quotient-perfectoidization`. Kind: **theorem**. Suggested coverage: **full**.

Let R be integral perfectoid and f=f₀,f₁,… a compatible root tower f_(n+1)^p=f_n. Put S=R/(f), which is derived p-complete, and let B be the ordinary p-completion of R/(f_n:n≥0). Then B is perfectoid. Its canonical map S→B is surjective and has the universal perfectoidization property, hence gives a unit-compatible isomorphism S_perfd≅B.

Proposed declaration: `TauCeti.PerfectoidQuotients.principal_root_quotient_perfectoidization`.

Conventions and hypotheses: R integral perfectoid; the entire compatible root tower lies in R.

Proof or construction route:

1. Use the root-stable quotient theorem with ϖ=π and π^p=p·u, so ordinary p- and π-completion agree.
2. If S→T with T perfectoid, reducedness of T forces every f_n to map to zero. Extend the resulting map R/(f_n)→T through ordinary p-completion using completeness of T; ring maps preserve the p-adic filtration. This identifies B with S_perfd compatibly with the unit.
3. For any ideal K⊂R, apply baseline AdicCompletion.map_surjective to the quotient R-linear map R→R/K. The source completion is covered by R using AdicCompletion.of_surjective. Naturality map_of identifies the composite with the canonical map R→(R/K)^∧_p. Identify the R-module completion with the completion for the image of (p) in R/K. Thus this canonical map is surjective, with no closedness or finite generation hypothesis on K. Since f lies in K=(f_n), its factor S→B is surjective.
4. The finite-generator induction uses one principal step at a time after complete-flat base change. Arbitrary ideals use the completed filtered-colimit calculation G6; that does not affect this principal case.

Acceptance:

- In characteristic p use the retained radical-quotient theorem as the explicit computation.
- The raw root quotient need not be complete; the completed quotient is nevertheless covered by the complete source R. Surjectivity follows from the named baseline completion theorems.
- The comparison identifies the canonical unit, not just an abstract ring isomorphism.

Direct prerequisites: `PerfectoidQuotients:Q2/universal-perfectoidization`, `PerfectoidQuotients:Q0:integral-algebra/completed-root-stable-quotients`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-rings-reduced`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.map_surjective`, `mathlib:AdicCompletion.of_surjective`, `mathlib:AdicCompletion.map_of`, `mathlib:Ideal.Quotient.mk_surjective`.

Source: [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), Theorem 7.4 proof, p.62. The printed universal-property and image argument is expanded using reducedness, the completed root-stable quotient and the pinned baseline surjectivity of completion.

## Coverage and exact follow-up work

| Stage | Status | Remaining closure work |
| --- | --- | --- |
| `PerfectoidQuotients:Q0` | planned | G1: Completion and normalization transport; G2: Supplier carriers and corrected source interfaces |
| `PerfectoidQuotients:Q0:animated-application` | planned | G2: Supplier carriers and corrected source interfaces |
| `PerfectoidQuotients:Q0:integral-algebra` | planned | G1: Completion and normalization transport; G2: Supplier carriers and corrected source interfaces |
| `PerfectoidQuotients:Q1` | planned | G2: Supplier carriers and corrected source interfaces |
| `PerfectoidQuotients:Q2` | planned | G2: Supplier carriers and corrected source interfaces; G3: Stationarity of the initial-prism construction; G5: Unit cofiber comparison for complete-flat descent; G6: Completed filtered-colimit calculation |
| `PerfectoidQuotients:Q3` | planned | G2: Supplier carriers and corrected source interfaces; G4: André limits and the ind-syntomic refinement |
| `PerfectoidQuotients:Q4` | planned | G2: Supplier carriers and corrected source interfaces; G5: Unit cofiber comparison for complete-flat descent; G6: Completed filtered-colimit calculation; G7: Integral model of the analytic closed quotient |

These remaining lists are closure work after a complete target-level pass. They are not unread targets. A follow-up works on the named gap and its consuming nodes; it does not restart the source decomposition or add duplicate generic suppliers.

### G1 — Completion and normalization transport

Prove on pinned adic quotients the BMS1-to-BMS2 normalization, using the canonical torsion/free decomposition when the original ϖ-adic topology need not be p-adic. Prove quotient compatibility of ordinary completion in the nonzerodivisor p-integral closure construction. For finite sharp ideals, apply the reduced/separated Stacks 0G3I criterion and 091T comparison; do not infer arbitrary classical/derived agreement from divisibility alone.

Needed by: `PerfectoidQuotients:Q0:integral-algebra/bms-perfectoid-normalization`, `PerfectoidQuotients:Q0:integral-algebra/principal-theta-kernel-criterion`, `PerfectoidQuotients:Q0:integral-algebra/completed-p-integral-closure-perfectoid`, `PerfectoidQuotients:Q0:integral-algebra/completion-along-sharp-ideal`, `PerfectoidQuotients:Q0:integral-algebra/torsion-free-perfectoid-quotient`, `PerfectoidQuotients:Q0:integral-algebra/compatible-roots-and-iterated-frobenius`, `PerfectoidQuotients:Q0:integral-algebra/p-integral-closedness-criterion`.

### G2 — Supplier carriers and corrected source interfaces

Exact supplier nodes are resolved in the graph, but their mathematical planning is not an implementation. PR.0–2 and P0–4 packets have needs_changes reviews; their unavailable prism, cotangent, animated, complete-flat, almost and analytic carriers prevent the listed typed signatures. Obtain the finite length-reducing Witt Frobenius maps and BMS1 Lemma 3.13 Tor-independent square from PR.0. Quasisyntomic/QRSP notions and O_C/p compatibility are DD.0/DD.5 imports. Corrected PR.0 perfection may have a zero-divisor orientation before completion. No unconstrained proposition field or arbitrary functor replaces these interfaces.

Needed by: `PerfectoidQuotients:Q0:animated-application/prism-and-animation-import-contract`, `PerfectoidQuotients:Q1/smooth-prismatic-hodge-tate-reexport`, `PerfectoidQuotients:Q2/derived-prismatic-initiality-import-contract`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-cotangent-vanishing`, `PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid`, `PerfectoidQuotients:Q0:integral-algebra/bhatt-field-integral-model-comparison`, `PerfectoidQuotients:Q2/initial-prism-of-a-semiperfectoid-ring`, `PerfectoidQuotients:Q2/universal-perfectoidization`, `PerfectoidQuotients:Q3/andre-flatness-lemma`, `PerfectoidQuotients:Q4/completed-integral-closed-quotient`, `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`, `PerfectoidQuotients:Q0:integral-algebra/frobenius-surjectivity-equivalences`, `PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion`, `PerfectoidQuotients:Q0:integral-algebra/torsion-free-perfectoid-quotient`, `PerfectoidQuotients:Q0:integral-algebra/compatible-roots-and-iterated-frobenius`, `PerfectoidQuotients:Q0:integral-algebra/completed-root-polynomial-algebras`, `PerfectoidQuotients:Q0:integral-algebra/completed-perfectoid-tensor-products`, `PerfectoidQuotients:Q0:integral-algebra/completed-root-stable-quotients`, `PerfectoidQuotients:Q0:integral-algebra/products-of-perfectoid-rings`, `PerfectoidQuotients:Q0:integral-algebra/completion-along-sharp-ideal`, `PerfectoidQuotients:Q2/completed-perfectoidization-base-change`, `PerfectoidQuotients:Q2/perfectoidization-completed-colimits`, `PerfectoidQuotients:Q3/relative-perfectoid-cover-of-smooth-site`, `PerfectoidQuotients:Q3/frobenius-flat-prism-perfection-cover`, `PerfectoidQuotients:Q3/andre-ind-syntomic-mod-p`, `PerfectoidQuotients:Q3/bhatt-rational-root-neighborhoods`, `PerfectoidQuotients:Q3/bhatt-perfectoid-root-extension`, `PerfectoidQuotients:Q3/bhatt-root-extension-almost-flat`, `PerfectoidQuotients:Q3/functorial-almost-absolutely-integrally-closed-extension`.

### G3 — Stationarity of the initial-prism construction

Establish the fixed-cardinality bound and sufficiently regular ordinal in Proposition 7.2: kill δ-stable d-power torsion, take H⁰ of derived (p,d)-completion and repeat. Supply the ω₁-filtered-colimit/completion commutation and show a stationary stage is d-torsion-free and preserves maps to all prisms. This category is not restricted to bounded prisms.

Needed by: `PerfectoidQuotients:Q2/initial-prism-of-a-semiperfectoid-ring`.

### G4 — André limits and the ind-syntomic refinement

Supply perfectoidness and p-complete faithful flatness of the correctly completed limit covers, a universe/cardinality bound, and finite descent of monic coefficients. For the perfection-cover step obtain the regular-reduction Frobenius-flatness criterion from PR.0. For Remark 7.15 trace the Frobenius-twisted PD-envelope reductions, nilpotent thickenings and ordinary syntomic stages; do not assume Kunz in the absence of its hypotheses or replace modulo-p ind-syntomicity by the stronger ČS24 ordinary theorem.

Needed by: `PerfectoidQuotients:Q3/andre-flatness-lemma`, `PerfectoidQuotients:Q3/frobenius-flat-prism-perfection-cover`, `PerfectoidQuotients:Q3/andre-ind-syntomic-mod-p`.

### G5 — Unit cofiber comparison for complete-flat descent

The noncircular proposed proof uses perfectoid tensor products/Tor independence, the universal mapping property, then DD.1 complete-flat descent. Verify the actual derived cofiber of S→S_perfd after completed base change identifies with the cofiber over S′, and complete flatness detects the obstructing cokernel. The R and R′ torsion bounds come from Q0; no bounded torsion is imposed on S. BS22 Proposition 8.5 and arc descent cannot justify this step because they already use Theorem 7.4.

Needed by: `PerfectoidQuotients:Q2/completed-perfectoidization-base-change`, `PerfectoidQuotients:Q4/surjectivity-of-perfectoidization`.

### G6 — Completed filtered-colimit calculation

Prove on the actual perfect-prism/derived-completion carriers that the filtered colimit of compatible perfectoid finite quotients R/K_F is the ordinary p-completion of R/(⋃K_F), compatibly with its unit maps. Combine weak-Serre derived completeness of finite quotients with perfectoidization’s universal property to justify the finite-ideal reduction and the principal induction. A raw ordinary colimit is not automatically complete. Once the completed carrier is identified, image surjectivity is already supplied by Mathlib AdicCompletion.map_surjective, of_surjective and map_of; the principal root-quotient image is not an open gap.

Needed by: `PerfectoidQuotients:Q2/perfectoidization-completed-colimits`, `PerfectoidQuotients:Q4/surjectivity-of-perfectoidization`.

### G7 — Integral model of the analytic closed quotient

Identify S_perfd[1/ϖ] with P4’s universal closed Tate quotient on the actual topological carriers, including any ϖ-power-torsion removal and the complete uniform topology. Construct its minimal open integrally closed plus ring and establish integral almost surjectivity in the direction R⁺→R_I⁺. The semiperfectoid presentation of S is now outlined using the baseline completion-surjectivity theorem, ordinary principal-ideal completeness, Stacks 091T and the localization orthogonality criterion 091P(2); the ring-map surjectivity after inversion is ordinary localization of the two surjections. These algebraic steps no longer constitute a missing input. Assess the pending PerfectoidSpaces/E33 lead without treating its proposed fix as established.

Needed by: `PerfectoidQuotients:Q4/completed-integral-closed-quotient`, `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`.

## Supplier requests

Exact existing supplier nodes are prerequisites throughout the catalogue. The following nine stage requests cover needs for which those nodes do not yet state the necessary interface or generality.

### PrismaticCohomology:PR.0

Add/verify finite length-reducing Witt Frobenius interfaces of BMS1 Lemmas 3.2,3.9 and Davis–Kedlaya Theorem 3.2; BMS1 Lemma 3.13 Tor-independent A_inf square; the regular-reduction criterion for complete-flat Frobenius and completed perfect-prism filtered colimits. Existing δ/prism/perfection/correspondence/PD-envelope nodes are imported by exact ids; their corrected carriers need the outstanding review fixes.

Consumers: `PerfectoidQuotients:Q0:integral-algebra/frobenius-surjectivity-equivalences`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-cotangent-vanishing`, `PerfectoidQuotients:Q3/frobenius-flat-prism-perfection-cover`, `PerfectoidQuotients:Q3/andre-ind-syntomic-mod-p`, `PerfectoidQuotients:Q0:animated-application/prism-and-animation-import-contract`.

### PrismaticCohomology:PR.1

Supply corrected typed relative-site, Čech–Alexander and multiplicative twisted Hodge–Tate interfaces at the exact imported ids. Q1 is a reexport. Verify Lemma 4.8 for all target prisms via inverse Frobenius factorization in a p-torsion target.

Consumers: `PerfectoidQuotients:Q1/smooth-prismatic-hodge-tate-reexport`, `PerfectoidQuotients:Q2/initial-prism-of-a-semiperfectoid-ring`.

### PrismaticCohomology:PR.2

Supply corrected carriers for the exact Construction 7.6–Proposition 7.10 imports. Reconcile the existing quasisyntomic-covers-lift-to-prisms node with the Q3 ownership assigned by RS-01; use it as a single supplier until relocation, preserving its id mapping.

Consumers: `PerfectoidQuotients:Q2/derived-prismatic-initiality-import-contract`, `PerfectoidQuotients:Q3/lifting-quasisyntomic-covers-to-prisms`.

### DerivedDeRhamCohomology:DD.0

Supply typed full cotangent/derived exterior-power and quasisyntomic/QRSP amplitude interfaces, with vanishing for perfect F_p-algebras. These are exact imported owners, distinct from the existing naive H1Cotangent.

Consumers: `PerfectoidQuotients:Q0:animated-application/prism-and-animation-import-contract`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-cotangent-vanishing`.

### DerivedDeRhamCohomology:DD.1

Supply the ordinary-module product-difference characterization (Stacks 091P), weak Serre property (091U), classical comparison (091T), the 091P(2) orthogonality criterion under localization (derived ϖ-completeness implies derived p-completeness when ϖ^p divides p), ω₁-filtered-colimit/completion commutation and fixed-size limits. Verify unit-cofiber descent G5 and the completed filtered-colimit carrier comparison G6; image surjectivity after this comparison is in the baseline. Include the bounded-p-primary-torsion comparison between classical and derived completion for arbitrary modules, not just complete-flat modules. Provide ordinary quotient-completion transport and reduced finite sharp-ideal comparison (0G3I). Existing generic completion/complete-flat/algebraization nodes are imported. Include countably-filtered colimits of fixed-π complete plus models for the ω₁ argument in Bhatt Corollary 9.4.7; generic completion remains with DD.1, and the pair construction is the exact P5 import.

Consumers: `PerfectoidQuotients:Q2/semiperfectoid-rings`, `PerfectoidQuotients:Q2/initial-prism-of-a-semiperfectoid-ring`, `PerfectoidQuotients:Q2/completed-perfectoidization-base-change`, `PerfectoidQuotients:Q2/perfectoidization-completed-colimits`, `PerfectoidQuotients:Q3/andre-flatness-lemma`, `PerfectoidQuotients:Q0:integral-algebra/completion-along-sharp-ideal`, `PerfectoidQuotients:Q4/completed-integral-closed-quotient`, `PerfectoidQuotients:Q3/functorial-almost-absolutely-integrally-closed-extension`.

### DerivedDeRhamCohomology:DD.5

Supply actual quasisyntomic and elementary QRSP-cover carriers and O_C/p test, with bounded torsion and exact L[-1] flatness. Import once for the lifting and QRSP comparison applications.

Consumers: `PerfectoidQuotients:Q3/lifting-quasisyntomic-covers-to-prisms`, `PerfectoidQuotients:Q2/derived-prismatic-initiality-import-contract`.

### EnhancedDerivedSheaves:E5:animation

Supply corrected simplicial commutative/animated-ring and sifted left-Kan-extension carriers at the imported nodes. Strict commutative DGAs cannot replace them in characteristic p.

Consumers: `PerfectoidQuotients:Q0:animated-application/prism-and-animation-import-contract`, `PerfectoidQuotients:Q2/derived-prismatic-initiality-import-contract`.

### CrystallineCohomology:CR.0

For BS22 Remark 7.15 supply the mod-p formula for the Frobenius pullback of a PD envelope as filtered syntomic nilpotent thickenings, compatible with PR.0/pd-envelope-as-delta-envelope. No generic PD algebra is reconstructed here.

Consumers: `PerfectoidQuotients:Q3/andre-ind-syntomic-mod-p`.

### PerfectoidSpaces:P4

Supply the exact analytic adapter G7 to universal-perfectoid-zariski-closed: ordinary ϖ-completed integral quotient, semiperfectoidness, topology after inverting ϖ, minimal open integrally closed plus ring and almost surjectivity. P4’s construction itself does not depend on Q4 surjectivity.

Consumers: `PerfectoidQuotients:Q4/completed-integral-closed-quotient`, `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`.

## Ownership and restructuring proposals

The existing seven-stage scope is retained. The maintainer applies the following proposals; no foreign packet, route, atlas data or campaign document is edited.

### RT-AREA-padic-1/1

The accepted REV-PAPER-BHATT-SCHOLZE-22 route 3 already gives the protocol-form Part II for the requested Q5 material. Keep one owner: if the maintainer creates Q5 first, route 3 becomes a source route to that layer; otherwise Q5 names this late-extension proposal, not an additional implementation plan.

Targets:

- BS22 Proposition 8.5: perfect-prism site computes general integral perfectoidization, after Q3 and Q4.
- Corollary 8.11: arc sheaf property of perfectoidization; Corollary 8.12: excision along perfectoid quotients.
- Definition 10.1, Lemmas 10.2–10.5: J-almost category, local-sheaf comparison, completed exterior powers and connectivity.
- Lemma 10.6 and Proposition 10.7: Galois root cover and connective mapping comparison.
- Theorem 10.9: finite finitely presented algebras étale outside V(J) have J-almost purity after perfectoidization.
- Theorem 10.11 and Lemma 10.12: perfectoidization for integral extensions and the algebraic-closure stratification.
- Corollary 10.13: Heitmann–Ma application.

Q5/Part II comes after Q4. Q2/Q3/Q4 never use its 8.5, arc descent or 10.11 theorem. No early arrow to P0 or P3; S2/S4 and PR.4 consume the late theory.

### RT-AREA-padic-1/6

A3 tilts finite étale algebras: P3 tilting and P4 characteristic-p Zariski-closed behavior already supply its reduction. Mixed-characteristic Q4 surjectivity is not an input. Remove Q4→A3 and the corresponding A3 input; keep Q4→P8,S2,S4,PR.4 where the actual closed-quotient/theory contracts are consumed. No foreign file changed.

### RT-AREA-padic-1/7

Basic algebra precedes A_inf/prism use and is now planned in Q0. Part II begins at those results and imports rank-one tilting from P3, not merely P1. No route file or atlas data changed.

Part II retains:

- General perfectoid fibre products (2.1.4), valuation-ring tilting (2.1.9), §2.1.12 and item /020.
- §2.3.1–2.3.2, strong ordinary ind-syntomic André extension (2.3.4), and §2.3.7 covers.

Other routing: PAPER-CESNAVICIUS-SCHOLZE-24/037→PerfectoidSpaces:P7.

### single-owner-reconciliation

RS-01 and this issue assign BS22 Proposition 7.11 to Q3. The current PR.2 packet already plans it. Q3 imports that exact node through an application node; relocation must retain an id mapping, not create a second theorem.

### single-owner-reconciliation

The exact P1 adapter nodes already plan these comparisons. Q0’s application records their normalized use; it does not build another Tate perfectoid definition.

Targets:

- BMS1 Lemmas 3.20–3.21
- Česnavičius §4.8 Tate/powerbounded adapter

### narrow-stage-import-proposal

The existing coarse stage imports must become exact declaration imports to avoid treating Q0’s completed operations as prerequisites of their own prism suppliers. No foreign packet is edited. These bindings state only the source prefix each supplier actually uses.

- `PrismaticCohomology:PR.2/qrsp-prism` imports `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-cotangent-vanishing`, `PerfectoidQuotients:Q0:integral-algebra/completed-root-polynomial-algebras`. Perfectoid predicate, bounded torsion, absolute and relative completed cotangent computations, and the root-polynomial perfectoid extension used in the regular-quotient reduction.
- `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings` imports `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-cotangent-vanishing`, `PerfectoidQuotients:Q0:integral-algebra/completed-perfectoid-tensor-products`. Integral predicate, rank-one absolute cotangent and relative cotangent vanishing, bounded torsion and the completed tensor presentation. QRSP remains DD.5-owned.
- `DerivedDeRhamCohomology:DD.5/elementary-semiperfectoid-covers` imports `PerfectoidQuotients:Q0:integral-algebra/completed-p-integral-closure-perfectoid`, `PerfectoidQuotients:Q0:integral-algebra/completed-root-polynomial-algebras`. The completed compatible-root base obtained from the p-integral-closure criterion, then the perfectoid root-polynomial algebra. No use of Q3 André or Q4 surjectivity.

The local declaration graph is acyclic. Recursively following exact supplier-node edges, with the three proposed narrowed Q0 bindings, gives 405 reachable declarations and 1,426 edges without a cycle. Twenty-two stage or reserved imports remain opaque contracts. This audit does not certify every supplier stage graph; the coarse bindings require the recorded maintainer changes.

## Sources, reading and corrections

Ten public PDFs were acquired afresh on 6 October 2026. Their hashes, access dates and precise reading ranges are in the packet. The published BMS2 PDF and its correction evidence are inherited provenance, not a fresh download. Source excerpts are literal snippets in the packet; this document gives their locators and mathematical matches. No whole-paper reading is claimed.

### Prisms and prismatic cohomology

[arXiv:1905.08229v4, 12 January 2022](https://arxiv.org/pdf/1905.08229v4). Authors: Bhargav Bhatt, Peter Scholze.

SHA-256: `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`.

Reading:

- §7 pp.55–62, all statements and proofs; Lemma 4.8 pp.38–39; Corollary 2.39 pp.24–25 through the supplier contract.
- For the rescope proposal: Corollaries 8.11–8.14 with proofs pp.68–70; Definition 10.1 through Lemma 10.5 pp.78–79; Theorem 10.9 statement p.80; Theorem 10.11 and Lemma 10.12 with proof pp.82–83. Other generic §2–6 inputs are supplier-node readings, not a fresh full reading of those sections.

### Topological Hochschild homology and integral p-adic Hodge theory

[arXiv:1802.03261v2, 9 April 2019](https://arxiv.org/pdf/1802.03261v2). Authors: Bhargav Bhatt, Matthew Morrow, Peter Scholze.

SHA-256: `b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038`.

Reading:

- Definitions 4.18, 4.20; Proposition 4.19 and both bounded-torsion proofs; Remarks 4.21–4.22 and Lemmas 4.15–4.17, pp.21–23.

### Étale cohomology of diamonds

[public author PDF, revision dated 14 April 2026](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf). Authors: Peter Scholze.

SHA-256: `4ce3d1232a6e9e186d1a36da5cc659616569ac8dd2bb263510247c07995a26c1`.

Reading:

- Definitions 5.6–5.7, Theorem 5.8, remark and Proposition 5.9 pp.24–25; integral-map direction checked against existing PerfectoidSpaces/E29.

### Integral p-adic Hodge theory

[arXiv:1602.03148v3](https://arxiv.org/pdf/1602.03148v3). Authors: Bhargav Bhatt, Matthew Morrow, Peter Scholze.

SHA-256: `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a`.

Reading:

- Lemma 3.2 statement and proof pp.19–20; Definition 3.5, Remark 3.8, Lemmas 3.9–3.14 including proofs pp.21–24; Lemmas 3.20–3.21 with proofs pp.26–27.

### Topological Hochschild homology and integral p-adic Hodge theory

[Publications Mathematiques de l IHES 129 (2019), 199–310; compared with arXiv:1802.03261v2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf). Authors: Bhargav Bhatt, Matthew Morrow and Peter Scholze.

SHA-256: `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd`.

Reading:

- Definition 4.18 and Proposition 4.19 with both complete proofs: preprint pp.22–23, published pp.225–227. The complete elementary proof of (3), published p.227, is the chosen route.

### Purity for flat cohomology

[arXiv:1912.10932v3](https://arxiv.org/pdf/1912.10932v3). Authors: Kęstutis Česnavičius, Peter Scholze.

SHA-256: `2f9d3ee868c244a7ddd6579a5dafed10a7ac9eb8b2ffe840db9f2bc115cd6ed4`.

Reading:

- §2.1.1–2.1.11 pp.10–17, including proofs of the decomposition, henselization, p-integral closure and all five operations of Proposition 2.1.11. The first statement of §2.1.12 was read to check the Part II boundary.

### Purity for the Brauer group

[arXiv:1711.06456v4](https://arxiv.org/pdf/1711.06456v4). Authors: Kęstutis Česnavičius.

SHA-256: `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709`.

Reading:

- §4.2–4.8 pp.7–9, definitions, root normalization, expansions, completion lemma and powerbounded-model proof.

### Prismatic Dieudonné theory

[arXiv:1907.10525v4](https://arxiv.org/pdf/1907.10525v4). Authors: Johannes Anschütz, Arthur-César Le Bras.

SHA-256: `6eb02c16c525360141b1c5d118ae04db070f3c0e9cb9fff0f1598fc889b50aec`.

Reading:

- §2.1 pp.12–14 through Remark 2.1.11, including Corollary 2.1.10 and its proof; independent completely étale/henselization route.

### On the direct summand conjecture and its derived variant

[arXiv:1608.08882v2](https://arxiv.org/pdf/1608.08882v2). Authors: Bhargav Bhatt.

SHA-256: `08578ca15b17f51ee12c398ef305af3446057063c015e2bc8beb6012bcc26430`.

Reading:

- Notation 1.4 and §2.1–2.7 pp.3–5, including footnote 6, the rational-neighborhood construction, almost-flatness proof and the functorial remark.

### On the Witt vector Frobenius

[arXiv:1409.7530v1, 26 September 2014](https://arxiv.org/pdf/1409.7530). Authors: Christopher Davis, Kiran S. Kedlaya.

SHA-256: `c54d3cbe035567e4f051c6bb0c2ecd86110a1a103767049c00eed3da80c44b9d`.

Reading:

- §3 pp.6–11: the finite-Witt conditions, Theorem 3.2 and the implication chain (xiv)′⇒(ii) used by BMS1 Lemma 3.9.

### Stacks Project: Derived completion and derived completion of rings

[online, accessed 2026-10-06](https://stacks.math.columbia.edu/tag/091N). Authors: The Stacks Project Authors.

Reading:

- Lemma 15.93.1 (091P), countable-product criterion and proof; definition 091S, weak Serre property 091U and comparison 091T; reduced/separated ring completion criterion 0G3I.

### Lecture notes for a class on perfectoid spaces

[Author notes dated 23 April 2017, University of Michigan Math 679](https://websites.umich.edu/~bhattb/teaching/mat679w17/lectures.pdf). Authors: Bhargav Bhatt.

SHA-256: `47aaf5ddc4ec5d6f5e8efd0ecb80ae2f0ef4999265d861393c4bda6670974048`.

Reading:

- Theorem 9.4.3 and proof, Examples 9.4.4–9.4.5, Remark 9.4.6 and Corollary 9.4.7 with the full transfinite proof, printed pp.113–117. Rendered p.113 inspected to check the coefficient-ring misprint already registered as PerfectoidSpaces/E53. The preceding Warning 9.4.2 was read as context; its failure concerns integral plus-ring surjectivity. No full-notes reading claimed.

The bibliography lead [Bh4, Corollary 9.4.7] was resolved by acquiring the public 23 April 2017 author notes and reading pp.113–117. There is no remaining missing-source entry from this scoped reading; supplier carrier and comparison work remains explicit.

- **PerfectoidQuotients/E1**: Replace R by S, or explicitly require the map from R to factor through the chosen quotient S.
- **PerfectoidQuotients/E2**: Supply a verified bibliographic reference for Frobenius acting by zero on the cotangent complex, or include that argument. No replacement author/title is guessed.
- **PerfectoidQuotients/E3**: so the claim follows
- **PerfectoidQuotients/E4**: One goal in this section is to prove
- **PerfectoidQuotients/E5**: Let us assume for the moment

- **PerfectoidSpaces/E29**: ECD Definition 5.7 integral map reads R⁺→S⁺; historical aggregate already corrected it. Fresh reading confirms the printed reverse direction. Do not create a duplicate source-issue id.
- **PerfectoidSpaces/E33**: Pending lead about BS22 Remark 7.5 completion; retained only in G7, no accepted fix claimed.
- **PerfectoidSpaces/E53**: Theorem 9.4.3 proof p.113 of the 23 April 2017 Bhatt notes prints K° as coefficient ring of the free A-root-polynomial algebra; use A⁺. Fresh rendered reading confirms the existing accepted correction; no duplicate issue created.

The existing source-issue identifiers are retained. E29 is referenced rather than duplicated; E33 is a pending lead, not an accepted repair.

## Suggested-file validation

The suggested file elaborates against the pinned Mathlib. Its warnings are exclusively proof placeholders. Twenty-six full targets and ten restricted targets are typed on actual ring, ideal, Witt, perfection, localization and completion carriers. Twenty targets explicitly omit missing supplier or transport signatures. The five generic application nodes preserve the exact supplier contracts. Of 42 API items, 25 are typed and 17 are explicitly omitted; of 37 packet tests, 24 are typed and 13 are explicitly omitted. Comments listing the omissions do not count as signatures or examples.

The packet checker, source-issue checker, literal-excerpt audit, name/coverage audit and authorized-path intake checks are recorded in the handoff. The mathematical plan remains open at G1–G7. Compilation supplies no implementation verdict.
