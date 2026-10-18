# Roadmap: the arc-topology and descent for étale cohomology

**Summary.** Build the rank-at-most-one valuative topology on schemes and prove that finitary v-sheaves satisfy arc-descent precisely when they satisfy excision. The same valuation calculus gives torsion étale and constructible-complex hyperdescent, formal glueing, henselian comparison and rigid generic-fibre descent. Complete arc-topologies connect these results to the perfectoid inputs of prismatic and flat cohomology. The final analytic application is Artin–Grothendieck vanishing for affinoid algebras, with the coefficient-dependent dimension bounds stated separately.

## Scope and ownership

This roadmap owns the scheme v-to-arc comparison, the arc-excision criterion, the coherent arc-topos argument, the arc upgrade for the cohomological examples, formal and punctured comparison, and the I-complete variants. The ordinary scheme topology is defined by finite affine refinements. The p-complete formal topology and the pseudouniformizer-only arc_p topology have different test classes.

SchemeAndStackFoundations supplies schemes, affine-transition limits, henselian pairs, étale sites, algebraic spaces and proper base change. EnhancedDerivedSheaves supplies coherent infinity-categories, derived enhancements, the forward h-blowup theorem and finite inductive level. Its E1 valuation-decomposition triangle is also an input, including the perfectness hypotheses there. SchemeKTheoryOperations S.4 owns perfect-scheme h/v sites and perfect-complex v-hyperdescent; the new assertion here is arc-hyperdescent. PerfectoidQuotients and PerfectoidSpaces own integral perfectoid algebra, tilting and finite étale approximation. PrismaticCohomology owns perfect prisms and A_inf; no prismatic comparison theorem is proved here.

The current TauCetiRoadmap.AdicSpaces topological-algebra and valuation layers supply Huber rings and adic spectra. AdicSpacesPartII supplies completed tensor products; AdicEtaleGeometry supplies the algebraic/adic comparisons under their analytic hypotheses. The noetherian K-theory formal square belongs to GeneralAlgebraicKTheory K.6: its localization fibres are K-theory of perfect complexes supported on V(I). This roadmap does not restate that K-theoretic target.

## Conventions

Rings are commutative and unital, including the zero ring when a domain is not required. A valuation domain is nonzero. An extension of valuation domains is an injective local homomorphism, equivalently faithfully flat; a homomorphism merely preserving units is insufficient. A field has rank zero. Rank at most one permits nondiscrete valuations. The words pseudouniformizer and rank one require a nonzero nonunit parameter.

Unless a statement explicitly allows arbitrary schemes or opens, schemes and morphisms are qcqs. A ring functor is covariant, corresponding to a contravariant scheme functor. The interval [p,q] means primes ordered by inclusion. Thus V_[0,p]=V_p, V_[p,m]=V/p and V_[p,p]=κ(p). Shrinking an interval gives a map out of the ring of the larger interval. For I=(f₁,…,f_r), the punctured open is the union of the D(f_i).

Derived degrees are cohomological. D(Λ)^{≥0} is the nonnegative cohomological part of the enhanced derived category, not the ordinary category with chosen limits. Cech descent uses the entire augmented cosimplicial diagram; hyperdescent uses hypercovers. Fixed cohomological or Tor-amplitude bounds are imposed before applying truncated-category arguments. A finite coefficient ring need not be regular: Dᵇ_cons means bounded constructible cohomology, with finite Tor dimension imposed only when explicitly named.

A cardinal cutoff κ is an uncountable strong-limit cardinal larger than the base ring. All diagrams and covers are taken in the corresponding universe. A larger cutoff gives the usual geometric comparison; claims about sheafified representables specify which inverse-image functor is used. In perfectoid statements p is prime; integral perfectoids include the zero ring and characteristic-p perfect rings. All uses of derived completion carry the regularity/bounded-torsion hypotheses supplied by the perfectoid or prism theorem.

For the affinoid layer K is complete, algebraically closed and nontrivially nonarchimedean; π is a fixed nonzero topologically nilpotent element. The residue characteristic, rather than only char(K), controls the improved Künneth and vanishing statements. A parameter becoming zero or a unit makes its completed generic fibre empty.

## Exact supplier contracts

### From the pinned libraries

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The current library and current upstream roadmaps are used to determine ownership; the representative signatures use these pins.

- `mathlib:ValuationRing` in `Mathlib/RingTheory/Valuation/ValuationRing.lean`: For a commutative integral domain, the valuation-ring class asserts total divisibility: for a,b, either a divides b or b divides a.
- `mathlib:IsLocalHom` in `Mathlib/Algebra/Group/Units/Hom.lean`: For a monoid homomorphism, reflects units: if the image of a is a unit, a is a unit. Ring-hom locality is this predicate; preservation of units alone is automatic.
- `mathlib:Ring.KrullDimLE` in `Mathlib/RingTheory/KrullDimension/Basic.lean`: The predicate that the prime spectrum of a commutative ring has Krull dimension at most the given natural number. Nontriviality is a separate assumption for valuation domains.
- `mathlib:IsAlgClosed` in `Mathlib/FieldTheory/IsAlgClosed/Basic.lean`: For a field, every polynomial splits. This is a field predicate, whereas the planned aic predicate also permits rings with zero divisors and the zero ring.
- `mathlib:IsAlgClosed.exists_root` in `Mathlib/FieldTheory/IsAlgClosed/Basic.lean`: Over an algebraically closed field, a polynomial of nonzero degree has a root. The positive-degree monic condition in the ring-level aic predicate supplies this nonconstancy.
- `mathlib:SpectralSpace` in `Mathlib/Topology/Spectral/Basic.lean`: The typeclass combines T0, compactness, quasi-sobriety, quasi-separatedness and a basis of compact opens. It does not assert the spectral-submersion lifting condition.
- `mathlib:IsSpectralMap` in `Mathlib/Topology/Spectral/Hom.lean`: A continuous map between topological spaces for which inverse images of compact open sets are compact. Universal submersiveness is additional data planned here.
- `mathlib:CategoryTheory.GrothendieckTopology` in `Mathlib/CategoryTheory/Sites/Grothendieck.lean`: A collection of covering sieves with maximal-sieve, pullback and transitivity axioms on a category. The particular scheme and formal arc-cover conditions are new targets.
- `mathlib:AlgebraicGeometry.Scheme` in `Mathlib/AlgebraicGeometry/Scheme.lean`: A locally ringed space locally isomorphic to spectra of commutative rings. The roadmap uses this existing scheme carrier.
- `mathlib:AlgebraicGeometry.Scheme.etaleTopology` in `Mathlib/AlgebraicGeometry/Sites/Etale.lean`: For a scheme S, the big étale topology on schemes over S. It is not the small étale site, nor an enhanced derived-sections construction; those are requested separately from SF.2.
- `mathlib:IsAdicComplete` in `Mathlib/RingTheory/AdicCompletion/Basic.lean`: For an ideal I and a module M, combines I-adic Hausdorffness and precompleteness. The ideal and module, including the zero-ideal boundary case, remain explicit.
- `mathlib:AdicCompletion` in `Mathlib/RingTheory/AdicCompletion/Basic.lean`: The inverse-limit module of quotients by powers of the ideal. Existence of this carrier does not imply that every such completion is complete without the required ideal hypotheses, nor that ordinary completion equals derived completion.
- `mathlib:DerivedCategory` in `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`: The ordinary localization of the homotopy category of cochain complexes at quasi-isomorphisms. Enhanced categories and coherent totalizations are imported from EnhancedDerivedSheaves.
- `mathlib:PerfectClosure` in `Mathlib/FieldTheory/PerfectClosure.lean`: The direct Frobenius perfection, built from pairs consisting of a natural number and a ring element modulo the Frobenius relation. It is not the inverse-limit tilt of a perfectoid ring.
- `mathlib:FirstOrder.Language.Ultraproduct.sentence_realize` in `Mathlib/ModelTheory/Ultraproducts.lean`: For an ultrafilter and a family of nonempty first-order structures, a sentence holds in the ultraproduct exactly when it holds on an ultrafilter-large set of factors. Valuation axioms and each positive-degree monic-root sentence are applications.
- `tauceti:TauCeti.CommAlgCat.fppfTopology` in `TauCeti/Algebra/Category/CommAlgCat/Fppf.lean`: The fppf Grothendieck topology on the opposite category of commutative R-algebras, induced by the relative spectrum functor; this affine topology is subcanonical. It does not supply scheme v- or arc-descent.
- `mathlib:Module.Flat.flat_iff_torsion_eq_bot_of_isBezout` in `Mathlib/RingTheory/Flat/TorsionFree.lean`: For a module over a commutative Bézout domain, flatness is equivalent to vanishing torsion submodule. Together with the valuation-domain Bézout result, an injective extension is flat.
- `mathlib:ValuationRing.iff_local_bezout_domain` in `Mathlib/RingTheory/Valuation/ValuationRing.lean`: With a commutative integral-domain structure fixed, the valuation-ring property is equivalent to the conjunction of locality and the Bézout property. This supplies the Bézout hypothesis for the flatness citation.
- `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom` in `Mathlib/RingTheory/Flat/FaithfullyFlat/Algebra.lean`: For a ring algebra between local commutative rings, flatness and a local algebra map imply faithful flatness. Flatness must first be obtained from the separate torsion-free/Bézout theorem.

In particular, the existing ordinary DerivedCategory does not supply coherent totalizations, and direct Frobenius PerfectClosure is not the inverse-limit tilt. The Łoś theorem is already in Mathlib; only its valuation and positive-degree monic-root applications occur here.

### From the other roadmaps

The exact node references in each target specify the supplied variant. The following contracts state the inputs for which a stage-level extension is required. They are mathematical requirements for the named owner; they are not assumed to have Lean implementations.

- **AdicEtaleGeometry:A1**: Supply Huber’s algebraic/adic comparison with its exact variants: Corollary 3.2.2 p. 174 is for constant coefficients; Theorem 3.2.9 p. 180 gives the pro-special affinoid sheaf comparison, and Theorem 3.2.10 pp. 180–181 treats finite-type algebraic generic fibres with properness at the relevant generic points. In AT.9 use a proper generic-fibre model. Retain the analytic noetherian/strongly-noetherian conditions and open-restriction/proper-base-change compatibilities. Also supply the affinoid perfectoid Tate comparison in BS22 Theorem 9.1. These do not identify all scheme and adic étale sites.
- **DiamondsAndVStacks:D0**: Stone–Čech spaces, clopen idempotents and ultrafilter spectra of products of rings; spectral-map constructible-topology facts, valuative specialization lifting and universal subtrusiveness for qcqs scheme morphisms. This is the ordinary scheme/spectral interface, not a redefinition of perfectoid v-sites.
- **EnhancedDerivedSheaves:E5:abstract**: Supply the categorical descent form of Barr–Beck, HA Corollary 4.7.5.3 p. 705, beyond E5:abstract/barr-beck-lurie. For an augmented cosimplicial infinity-category, assume the augmentation functor G is conservative, its G-split geometric realizations exist and are preserved, and every d⁰ square, including the augmentation, is left adjointable; then augmentation to the totalization is an equivalence. Apply this left-adjointable form to the opposite fixed-amplitude constructible-complex categories; equivalently, use right-adjointable squares and preserved G-split totalizations in the original categories.
- **EtaleDualityAndPerverseSheaves:EDC.0**: Extend EDC.0/constructible-ctf-complexes from noetherian schemes with coefficient order invertible to all qcqs schemes with an arbitrary finite coefficient ring Λ. D^b_cons means bounded constructible cohomology and does not impose finite Λ-Tor dimension. Supply enhanced pullbacks, finite étale local trivializations and fixed cohomological-amplitude subcategories. The Z/4-module Z/2 in degree zero is allowed even though its Tor dimension is infinite.
- **GeneralAlgebraicKTheory:K.5**: Milnor/excision data A=B×_(B/J)A/I with I→J an isomorphism of ideals, including arbitrary nonnoetherian commutative rings and stability under the pullback constructions used in the arc criterion. This imports the datum, not a K-excision assertion for every Milnor square.
- **PerfectoidSpaces:P3**: Beyond P3/henselian-finite-etale-approximation, extend finite étale approximation to bounded t-power torsion and noetherian finite-ideal punctured spectra, with descent on the finite union of principal opens, as in CS24 Lemma 3.1.2 p. 30. Supply the finite-étale support/localization compatibility needed by its cohomological variant.
- **SchemeAndStackFoundations:SF.0**: Valuation extension to an algebraic closure, integral closures, cardinal-bounded algebraic subrings, localization/quotient prime spectra, finite presentation and affine approximation. Supply formal schemes and continuous affine maps for p-adic formal spectra, including nonnoetherian bases. The already planned perfection, henselian-pair and inverse-limit results are used by exact node id; this request concerns the remaining general scheme/ring interfaces.
- **SchemeAndStackFoundations:SF.1**: Fppf descent for spaces-valued presheaves, effective étale-scheme/algebraic-space descent, and the equivalence between constructible finite-set étale sheaves and qcqs étale algebraic spaces. Supply locally finitely presented étale maps over arbitrary qcqs bases; separated objects are a distinguished subcategory, not all étale algebraic spaces.
- **SchemeAndStackFoundations:SF.2**: Small étale topoi and strict henselization points on arbitrary qcqs schemes; filtered-limit continuity for torsion étale cohomology and constructible étale sheaves; enhanced proper base change without order-invertibility for torsion coefficients; localization/support triangles, enough points, filtered-colimit continuity, field Künneth for residue-invertible coefficients, trace and finite-cover effacement. Extend coherent-topos theory by the coherence/quasicompactness criteria, Deligne enough points and pushouts along coherent monomorphisms used in BM21 Propositions 4.19–4.23. For rational-domain vanishing, also supply affine Artin–Schreier vanishing for characteristic-primary constant coefficients, beyond the imported prime-to-characteristic affine theorem. On finite-type schemes over Spec Z, proper pushforwards preserve constructibility for finite coefficients, and their truncations are right adjoints on each cohomological-amplitude stratum; the proper-base-change maps must remain compatible with these truncations. Supply affine acyclicity for quasi-coherent Zariski sheaves and its finite affine-cover computation for the smooth differential-form comparison.
- **ArcTopologyAndDescent:AT.0/valuation-prime-square**: Rydh refinement and noetherian approximation: a finitely presented v-cover of an affine target admits a qc open/proper-surjective-finitely-presented refinement, and affine v-covers are limits of finitely presented v-covers. Supply proper models by Nagata compactification, Zariski main theorem for quasi-finite maps, alterations/ind-smoothness of characteristic-zero valuations. Supply resolution of singularities over characteristic-zero fields and its abstract-blowup descent refinements for the smooth h-differential comparison.
- **tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras**: Existing TauCetiRoadmap.AdicSpaces Layer 0: Huber and Tate topological rings, rings of definition, completion, pseudouniformizers and continuous maps. Imported as existing work, no extension requested.
- **tauceti:TauCetiRoadmap/AdicSpaces#layer-1-valuation-spectra-and-continuous-valuations**: Existing TauCetiRoadmap.AdicSpaces Layer 1: continuous valuations, equivalence of valuations and adic spectra. Imported as existing work, no extension requested.

The exact existing nodes used repeatedly are EnhancedDerivedSheaves E0/coherent-functors, E0/limits-colimits-universal-properties and E0/accessible-and-presentable; E1/enhanced-derived-category and E1/ringed-pullback-pushforward; E2/space-sheaves-and-postnikov and E2/bounded-below-hypercover-descent; E5:abstract/descendable-algebras and E5:abstract/module-descent-and-functoriality. The perfect-ring Tor vanishing E1/perfect-ring-tor is used only when all three rings are perfect. DerivedDeRhamCohomology DD.1/derived-completion supplies completion by the local-cohomology/Koszul duality construction, not an unqualified ordinary quotient-tower formula.

SchemeAndStackFoundations SF.0/scheme-perfection, /affine-transition-limits, /henselian-pair-characterisations and /henselian-finite-etale-equivalence provide the named scheme and henselian comparisons. PerfectoidQuotients Q0:integral-algebra supplies /semiperfectoid-quasisyntomic-and-qrsp-rings, /perfectoid-bounded-p-torsion, /products-of-perfectoid-rings and /completely-etale-and-henselian-perfectoid. PrismaticCohomology PR.0/ainf-prism gives a distinguished regular generator ξ of ker θ and classical (p,ξ)-completeness; /perfect-prisms-perfectoid-rings gives the integral equivalence. The field tests use PerfectoidSpaces P1/tilt-of-perfectoid-field and /continuous-valuations-under-tilting; the étale-site comparison is P3/etale-site-tilting-equivalence.

**An unregistered input.** The algebraic-space Hom target in Layer 7 uses the verified equivalence Hom(X,Y)≃Fun^⊗_exact(Perf(Y),Perf(X)) of BH16 Theorem 1.5 p. 2, with Y a qcqs algebraic space and X any algebraic space. Its proposed Part II has no registered supplier stage. Register the owner and the exact contract to close this target; SF.1 alone does not supply it. No other theorem below uses this reconstruction input; formal-target representable descent in Layer 12 has a separate proof.

## How to read the build

Layers 0–2 set up valuation rings and the scheme topologies. Layer 3 provides finitary and ultraproduct detection; it also explains why the rank of an ultraproduct component can exceed the rank of its factors. Layer 4 proves the excision criterion, and Layer 5 removes the finitariness restriction from excision using the coherent arc-topos. Layers 6–7 apply these methods to cohomology and enhanced categories. Layers 8–10 pass through formal glueing and rigidity to completed generic fibres and affinoid vanishing. Layers 11–12 give the finite-ideal complete topology and the perfectoid descent interfaces.

## Layer 0: Valuation extensions and rank intervals

Valuation-specific algebra: injective local extensions, absolute integral closedness, bounded aic extensions, finite-rank approximation and prime intervals.

### 0.1 Absolutely integrally closed rings

Define `IsAbsolutelyIntegrallyClosed`. A ring A is absolutely integrally closed (aic) when every monic polynomial of positive degree in A[T] has a root in A. For a domain this is equivalent to being integrally closed with algebraically closed fraction field; no domain hypothesis is built into the ring predicate.

Induct on degree after factoring off a root to obtain splitting of every nonconstant monic polynomial. For domains pass to the fraction field and clear denominators; integral roots return to A.

The interface supports the following uses: Choose valuation tests with algebraically closed fraction field. (BM21 Proposition 3.30). Keep quotient and localization tests inside aic valuation rings. (BM21 Theorem 4.1).

- `IsAbsolutelyIntegrallyClosed.iff_isAlgClosed`: For a field K the predicate is equivalent to Mathlib IsAlgClosed K.
- `IsAbsolutelyIntegrallyClosed.quotient`: Every quotient of an aic ring is aic, by lifting monic coefficients.
- `IsAbsolutelyIntegrallyClosed.localization`: Every localization of an aic ring is aic, by a monic rescaling argument.
- `IsAbsolutelyIntegrallyClosed.iff_normal_fraction`: For a domain A, aic is equivalent to IsIntegrallyClosed A and IsAlgClosed (Frac A).

**Checks.**

- An algebraically closed field satisfies the predicate, while the obligation for polynomial 1 is absent.
- Q is not aic, witnessed by T²−2.
- A finite product of algebraically closed fields is aic but need not be a domain.
- The zero ring is aic; no nontriviality assumption is imposed.

The constant polynomial 1 is excluded from the root obligation.

(BM21, Definition 3.26, p. 22.) *Needs:* `mathlib:IsAlgClosed`, `mathlib:IsAlgClosed.exists_root`.

### 0.2 Extensions of valuation rings

Define `IsValuationExtension`. For valuation domains V and W, an extension is an injective ring homomorphism e:V→W that reflects units. Equivalently it is a faithfully flat map of valuation rings. Fields have rank zero; rank at most one means Krull dimension at most one, with no discreteness condition.

Use total divisibility to prove flatness of torsion-free modules over V; locality plus injectivity makes Spec W→Spec V surjective. Express rank through the chain of prime ideals, using the pinned Krull-dimension predicate.

The interface supports the following uses: Reduce arbitrary-rank lifting rings in v-covers to the rank-one tests for arc-covers. (BM21 Proposition 2.1). Specify that extension means faithful flatness, including complete lifting rings. (CS24 §2.2.1).

- `IsValuationExtension.iff_faithfullyFlat`: For maps between valuation domains, extension is equivalent to faithful flatness.
- `IsValuationExtension.comp`: Extensions compose; the identity is an extension.
- `IsValuationExtension.isLocalHom`: The second component is exactly Mathlib IsLocalHom, not preservation of units alone.
- `IsValuationExtension.lift_rankOne`: A lift from a rank-at-most-one valuation domain V into an arbitrary extension W can be passed through a suitable localization and prime quotient of W to a rank-at-most-one valuation domain W′, with V→W′ still an injective local extension.

**Checks.**

- The identity of every valuation ring, including a field, is an extension.
- For a nonfield valuation ring V, V→Frac(V) fails to be an extension.
- For a nonfield valuation ring V, V→κ(m) is local but fails injectivity.

A nontrivial DVR embeds in its fraction field injectively but not locally.

(BM21, §2, Proposition 2.1 and Remark 2.2, p. 9.) *Needs:* `mathlib:ValuationRing`, `mathlib:IsLocalHom`, `mathlib:Ring.KrullDimLE`, `mathlib:Module.Flat.flat_iff_torsion_eq_bot_of_isBezout`, `mathlib:ValuationRing.iff_local_bezout_domain`, `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom`.

### 0.3 Aic extensions and cardinal bounds

Prove `aic_extension_and_size`. Every valuation domain V admits an extension to an aic valuation domain. For each map A→V with V aic, its factorization through an aic valuation subring V₀⊂V can be chosen with cardinality at most max(|A|,ℵ₀); V₀→V is an extension.

Extend a valuation to an algebraic closure of its fraction field and take its valuation ring. Inside V close the image of A under selected roots and quotients in countably many stages; intersect with generated subfields to retain the valuation property.

Do not claim a size bound on V itself or that V₀ has rank one.

(BM21, Lemmas 3.28–3.29, pp. 22–23.) *Needs:* `IsValuationExtension` (Layer 0), `IsAbsolutelyIntegrallyClosed` (Layer 0), `SchemeAndStackFoundations:SF.0`.

### 0.4 Finite-rank approximation of valuations

Prove `finite_rank_approximation`. For a subfield K₀ of Frac(V), V₀=K₀∩V is a valuation ring and V₀→V is faithfully flat. Every valuation ring is a filtered colimit of such finite-rank valuation subrings; when V is aic the subrings can also be chosen aic.

Take fraction fields of finitely generated subalgebras and use finite transcendence degree to bound valuation rank. Take algebraic closures inside the ambient algebraically closed fraction field for the aic version.

Rank is finite at each stage, without a common rank bound for the diagram.

(BM21, Lemmas 2.21–2.22, p. 14.) (BS17, Proof of Lemma 6.4, p. 22.) *Needs:* `IsValuationExtension` (Layer 0), `aic_extension_and_size` (Layer 0), `SchemeAndStackFoundations:SF.0/affine-transition-limits`.

### 0.5 The prime-splitting square

Prove `valuation_prime_square`. For any prime p in a valuation domain V, p→pV_p is an isomorphism of V-modules. The square V→V/p, V_p→κ(p) is cartesian, with V/p and V_p valuation domains.

For x∈p and s∉p total divisibility gives x/s∈p. Identify the kernel and image in V_p→κ(p), then use the pullback universal property.

For p=0 or p=m the square has an identity side; for rank two and the middle prime it is nontrivial.

(BM21, Proposition 2.8, p. 10.) *Needs:* `mathlib:ValuationRing`, `SchemeAndStackFoundations:SF.0`.

### 0.6 Prime intervals of a valuation ring

Construct `ValuationInterval`. For p⊆q in Spec V, put V_[p,q]=(V/p)_q. Its spectrum is the closed interval [p,q], its maximal ideal is the localized ideal (q/p)(V/p)_q, and its fraction field is κ(p). Inclusion of intervals reverses the direction of the associated ring maps. Intersections of nested intervals correspond to filtered colimits of these rings.

Construct quotient and localization with their existing universal properties. Use total order on primes to identify spectra, and check endpoint intersections/unions in filtered diagrams.

The interface supports the following uses: Induct through overlapping intervals to prove universal descent. (BM21 Proposition 4.8).

- `valuationInterval_spec`: Spec(V_[p,q]) identifies order-preservingly with [p,q] in Spec V.
- `valuationInterval_map`: An inclusion J⊂I induces V_I→V_J, with identity and composition laws.
- `valuationInterval_aic`: If V is aic then every V_I is aic.
- `valuationInterval_intersection`: For a filtered shrinking family of intervals the colimit ring is the ring of the intersection interval.

**Checks.**

- [p,p] gives κ(p).
- [0,m] gives V.
- For Spec V={0,p,m}, [0,p] gives V_p and [p,m] gives V/p; their common endpoint gives κ(p).

The singleton [p,p] gives κ(p), not V_p.

(BM21, Definition 4.6, p. 27.) *Needs:* `valuation_prime_square` (Layer 0), `finite_rank_approximation` (Layer 0), `SchemeAndStackFoundations:SF.0/affine-transition-limits`.

### Examples

For a nonfield valuation domain V, V→Frac(V) is injective but sends a nonunit to a unit. The residue map V→κ(m) is local but has nonzero kernel. These two maps distinguish the two conditions in a valuation extension. The polynomial 1 creates no aic root obligation because its degree is zero.

### Dependencies

`SchemeAndStackFoundations:SF.0`.

## Layer 1: The scheme v- and h-topologies

Scheme v-covers, the finitely presented h-site and universal descent; Rydh refinement over affine targets, used Zariski locally; the converse h-descent criterion using the imported finite-inductive-level and forward blowup theorems; comparison on perfect schemes.

### 1.1 Universal descent for a scheme presheaf

Define `UniversalDescent`. For a functor F from qcqs schemes oppositely to an infinity-category with limits, f:Y→X is of universal F-descent when F(X′)→Tot F(Y^•×_X X′) is an equivalence for every qcqs X′→X; the Cech nerve and augmentation are part of the data. The same definition applies on finitely presented schemes with the allowed base changes.

Use coherent Cech and totalization operations from the enhancement supplier. Define the class of universal descent maps without replacing higher totalization by an equalizer.

The interface supports the following uses: Use base change, limits and interval induction on the class of universal descent maps. (BM21 Proposition 4.8). Composition and right cancellation allow refinements of covers. (BS17 Theorem 2.9).

- `UniversalDescent.split`: A map admitting a section is of universal descent for every F.
- `UniversalDescent.baseChange`: Universal descent is preserved by arbitrary allowed base change.
- `UniversalDescent.comp`: Two universal descent maps compose.
- `UniversalDescent.cancel`: If g∘f is of universal descent then g is; if f is universal and g is of descent then g∘f is of descent.

**Checks.**

- Identity maps have a split augmented Cech nerve.
- For sets, compute the matching equalizer and recover ordinary descent data.
- For the identity cover with constant value Z[0] in D(Z), full Cech totalization is Z[0], while the homotopy equalizer of just id,id:Z[0]⇉Z[0] is Z[0]⊕Z[−1], with nonzero H¹. Keeping only those two arrows gives the wrong answer.

For set-valued F this reduces to the usual equalizer condition.

(BM21, Definition 3.2 p. 16 and Lemma 3.4 pp. 16–17.) (BS17, Proof of Theorem 2.9 and Lemma 2.10, pp. 7–8.) *Needs:* `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `SchemeAndStackFoundations:SF.0`.

### 1.2 Scheme v-covers and refinements

Define `VCover`. A qcqs map Y→X is a v-cover if every Spec V→X, V any valuation domain, lifts to Y after a valuation extension V→W. A map Y′→X refines Y→X if it is a v-cover and factors through Y. Families cover when on each affine open of X some finite family of affine source opens has a v-covering disjoint union.

Form the precoverage by finite affine refinements and verify its axioms with extensions composed. Use the affine basis comparison to recover a topology on arbitrary schemes.

The interface supports the following uses: Refine finitely presented covers to prove h- and v-descent. (BS17 §2). The descent criterion begins with a finitary v-sheaf. (BM21 Theorem 4.1).

- `IsVCover.iff_valuation_lift`: A singleton qcqs map covers exactly when it satisfies the stated lifting condition.
- `IsVCover.comp`: Identity, composition, base change and right cancellation hold.
- `vTopology.affine_basis`: Restriction to qcqs schemes and then affine schemes determines sheaves on the full scheme site.
- `VCoverRefinement.trans`: Refinements compose and remain refinements after base change.

**Checks.**

- The empty scheme covers itself; an empty source cannot cover a nonempty scheme.
- Proper surjective and faithfully flat qcqs maps are v-covers.
- For a rank-two valuation domain with middle prime p, Spec(V_p)⊔Spec(V/p)→Spec V is not a v-cover.
- Deleting a closed point from the exceptional divisor of Bl₀(A²_k) gives a surjection to A²_k which is not a v-cover.

All valuation ranks occur in the test.

(BM21, Definition 1.1, p. 2.) (BS17, Definitions 2.1 p. 4 and 2.13 p. 9.) *Needs:* `IsValuationExtension` (Layer 0), `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.GrothendieckTopology`.

### 1.3 The h-site and abstract blowup squares

Define `HSite`. Over a qcqs base S, the h-topology on finitely presented S-schemes is generated by finite families whose disjoint union is a v-cover. An abstract blowup square has Z→X finitely presented closed, Y→X proper surjective finitely presented, E=Y×_X Z, and Y minus E≅X minus Z.

Construct the topology on finitely presented schemes. Use fibre products to build the blowup square; its definition does not require that Y be the actual blowup of an ideal.

The interface supports the following uses: Reduce all h-descent to fppf descent and cartesian images of abstract blowup squares. (BS17 Theorem 2.9).

- `hTopology.generators`: Fppf covers and abstract blowup covers generate the h-topology.
- `abstractBlowup.baseChange`: An abstract blowup square remains such after base change.
- `abstractBlowup.canonicalMaps`: The four arrows, E’s pullback property, and the complement isomorphism are exported.
- `hTopology.perfectComparison`: On perfect schemes use the existing SchemeK S.4 h-site after perfection, with its perfectly finitely presented generators.

**Checks.**

- A finitely presented nilimmersion is an h-cover.
- If Z is empty, Y→X must be an isomorphism.
- Blowing up the origin of A² has E=P¹ and gives an abstract blowup square.
- Delete one closed point of the exceptional divisor of Bl₀(A²_k). The resulting surjection to A²_k is not a v-cover and, being finitely presented, is not an h-cover.

The identity modification with arbitrary Z is included.

(BS17, Definition 2.7 and Proposition 2.8, p. 6.) *Needs:* `VCover` (Layer 1), `SchemeAndStackFoundations:SF.0`, `mathlib:CategoryTheory.GrothendieckTopology`.

### 1.4 Abstract blowup criterion for h-descent

Prove `h_descent_criterion`. A set- or space-valued presheaf on finitely presented S-schemes is an h-sheaf if it is an fppf sheaf and sends abstract blowup squares with affine X to pullbacks. The reverse implication, nilimmersion invariance and blowup pullbacks are imported from EnhancedDerivedSheaves:E2/abstract-blowup-squares. Consequently proper surjections are of universal descent and the corresponding square of sheafified representables is a pushout.

Import finite inductive level and the forward blowup theorem. For the new converse, induct on the level of a proper finitely presented surjection; use fppf descent at level zero and the blowup pullback to pass the induction across its centre. Localize the target on affine opens before applying Rydh refinement. Apply the statement after every base change; Yoneda turns the sheaf pullbacks into the representable pushout.

The pushout uses sheafified representables: neither scheme v nor arc is subcanonical.

(BS17, BS17 Proposition 2.8 and Theorem 2.9, pp. 6–8.) *Needs:* `HSite` (Layer 1), `EnhancedDerivedSheaves:E2/proper-surjection-inductive-level`, `UniversalDescent` (Layer 1), `SchemeAndStackFoundations:SF.1`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`, `EnhancedDerivedSheaves:E2/abstract-blowup-squares`, `rydh_refinement` (Layer 1).

### 1.5 Perfection and restricted subcanonicity

Prove `perfection_v_comparison`. For F on qcqs perfect F_p-schemes, F is a v-sheaf exactly when X↦F(X_perf) is a v-sheaf on all qcqs F_p-schemes. Perfection preserves fibre products and v-covers. The v-topology on perfect schemes is subcanonical but strictly weaker than its canonical topology.

Use the universal property of scheme perfection and replace valuation tests by their perfections. Use faithfully flat descent plus the valuative lifting argument for representables on perfect schemes. Use a perfect rank-two prime split to separate the canonical topology from v.

This subcanonicity does not extend to arbitrary schemes.

(BS17, BS17 Remark 4.2 and Proposition 4.5, pp. 15–16.) *Needs:* `SchemeAndStackFoundations:SF.0/scheme-perfection`, `SchemeKTheoryOperations:S.4/perfect-scheme-h-and-v-sites`, `SchemeAndStackFoundations:SF.1`, `VCover` (Layer 1).

### 1.6 Rydh refinement and approximation

Prove `rydh_refinement`. A finitely presented v-cover of an affine scheme has a refinement factoring as a quasi-compact open cover of a proper surjective finitely presented morphism. An affine v-cover Spec B→Spec A is a cofiltered limit of affine finitely presented v-covers of Spec A. For a general qcqs target, apply the first assertion on affine opens before gluing descent.

Apply the imported Rydh refinement theorem to the affine target. Write B as a filtered colimit of finitely presented A-algebras mapping to B. Each Spec B_i→Spec A is a v-cover by right cancellation against Spec B→Spec A; its affine-target refinement is an h-cover.

Finite presentation belongs to the approximating covers; it is not imposed on B.

(BS17, Theorem 2.4 p. 5 and Lemma 2.12 p. 9.) *Needs:* `VCover` (Layer 1), `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.0/affine-transition-limits`.

### 1.7 Geometry and adic detection of v-covers

Prove `v_cover_geometry`. A qcqs map is a v-cover exactly when it is universally subtrusive in Rydh’s valuative sense; hence every v-cover is universally submersive. Faithfully flat qcqs and proper surjective maps are v-covers. The adic valuation test of BS17 Remark 2.2 agrees with the scheme lifting test, including arbitrary-rank integral valuation subrings.

Apply the valuative criterion to lift specializations after arbitrary base change. Use valuation pairs in the valuative adic space, retaining the locality requirement.

A universally submersive map need not be a v-cover; the rank-two split is a counterexample.

(BS17, Remark 2.2 and Example 2.3, pp. 4–5.) (BM21, Proposition 2.13, p. 11.) *Needs:* `VCover` (Layer 1), `DiamondsAndVStacks:D0`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-1-valuation-spectra-and-continuous-valuations`, `SchemeAndStackFoundations:SF.0`.

### Examples

Blowing up the origin of A²_k is proper and surjective, hence a v-cover. Deleting one closed point of its exceptional P¹ leaves a surjection which loses the lift of the valuation centred in that direction. This separates surjectivity from the valuative cover condition (BS17 discussion after Example 2.3, p. 5).

### Dependencies

`ArcTopologyAndDescent:AT.0`, `DiamondsAndVStacks:D0`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `ArcTopologyAndDescent:AT.0/valuation-prime-square`, `SchemeKTheoryOperations:S.4`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-1-valuation-spectra-and-continuous-valuations`.

## Layer 2: Arc-covers and spectral submersions

Define rank-at-most-one arc-covers and their finite affine covering families. Prove stability, the noetherian-target comparison, the affine universal-injectivity test, universal spectral submersion characterisation, inverse-limit stability and the rank-two splitting example.

### 2.1 Arc-covers of schemes

Define `ArcCover`. A qcqs map Y→X is an arc-cover if every map Spec V→X from a valuation domain of rank at most one lifts to Y after an extension V→W of valuation domains both of rank at most one. Covering families use finite affine refinements on each affine target open, as for v.

Compose extensions and use pullback to verify the precoverage axioms. Pass through the affine basis to the scheme Grothendieck topology.

The interface supports the following uses: The lifting test is converted to excision and then applied to cohomology. (BM21 Theorems 4.1, 5.4). Restrict valuation tests to complete rings along an ideal. (CS24 §2.2).

- `IsArcCover.comp`: Arc-covers are stable under identity, composition and arbitrary qcqs base change.
- `IsArcCover.cancel`: If Y→Z→X is an arc-cover then Z→X is an arc-cover.
- `arcTopology.affine_basis`: The finite-affine-family condition gives the restriction equivalence for arc-sheaves on all schemes, qcqs schemes and affine schemes.
- `IsArcCover.valuation_lift`: The test can require the lifting ring to be aic after enlarging the extension.
- `ArcCover.affine_iff`: On affine schemes the scheme predicate agrees with IsRingArcCover, the real-bodied ring-map predicate in the suggested file, after fixing a universe containing the bounded valuation tests.

**Checks.**

- The empty source covers only the empty target.
- The middle-prime split of a rank-two valuation ring is an arc-cover.
- The monomorphism Spec k→Spec k[ε]/ε² is an arc-cover but the representable affine-line functor fails descent.
- The generic point Spec Frac(V) alone does not arc-cover a nonfield rank-one valuation domain V.

Rank zero fields are included; valuation rings need not be discrete.

(BM21, Definition 1.2 and Remark 1.4, p. 3.) *Needs:* `IsValuationExtension` (Layer 0), `VCover` (Layer 1).

### 2.2 Comparing arc- and v-covers

Prove `arc_v_comparison`. Every v-cover is an arc-cover. A qcqs map with noetherian target is an arc-cover exactly when it is a v-cover. After base change to the spectrum of a rank-at-most-one valuation ring every arc-cover is a v-cover.

Reduce a valuation extension over a rank-one source to its relevant prime interval, treating the field case by fraction fields. For noetherian targets apply Rydh’s valuative criterion.

A nonnoetherian scheme over a noetherian base is not covered by the noetherian-target hypothesis.

(BM21, Proposition 2.1 p. 9, Corollary 2.5 and Proposition 2.6 p. 10.) *Needs:* `ArcCover` (Layer 2), `VCover` (Layer 1), `IsValuationExtension` (Layer 0), `SchemeAndStackFoundations:SF.0`.

### 2.3 Milnor squares give arc-covers

Prove `milnor_arc_cover`. If A→B maps an ideal I isomorphically onto an ideal J, then Spec(A/I)⊔Spec B→Spec A is an arc-cover. For a prime p of a valuation domain V this gives the prime-splitting arc-cover. For a rank-two V with middle prime p, V→V_p×V/p is arc but not v.

Given A→V of rank one, separate I mapping to zero from a nonzero ideal; the latter is cofinal in the maximal ideal and permits extension through B. For the counterexample test the identity map of the rank-two V: one branch kills p, the other makes an element of m outside p invertible.

When I=0 or I=A the resulting split cover is trivial.

(BM21, Lemma 2.7 and Corollary 2.9 p. 10; Example 1.3 p. 3.) *Needs:* `ArcCover` (Layer 2), `valuation_prime_square` (Layer 0), `GeneralAlgebraicKTheory:K.5`.

### 2.4 Specialization lifting over a rank-one valuation

Prove `rank_one_specialization`. For an affine map Spec A→Spec V with V rank one, the map is an arc-cover precisely when there is a specialization x_generic⇝x_closed in Spec A over the generic-to-closed specialization of Spec V. Fields are treated separately by nonempty fibres.

A valuation lift gives a specialization. Conversely realize the chosen specialization by a valuation domain and reduce to rank one.

Separate existence of two points without a specialization relation does not suffice.

(BM21, Lemma 2.4, pp. 9–10.) *Needs:* `ArcCover` (Layer 2), `IsValuationExtension` (Layer 0), `DiamondsAndVStacks:D0`, `SchemeAndStackFoundations:SF.0`.

### 2.5 Affine arc-cover criterion

Prove `arc_affine_purity`. For A→B, Spec B→Spec A is an arc-cover exactly when for every map A→V to a rank-at-most-one valuation domain the map V→B⊗_A V is universally injective as a map of modules, meaning it remains injective after tensoring with every V-module.

Reduce the lifting criterion to two comparable primes over V. Use the valuation-domain purity criterion to pass between this lifting property and universal injectivity.

Plain injectivity of V→B⊗V is weaker and cannot replace universal injectivity.

(BM21, Proposition 2.11, p. 11.) *Needs:* `ArcCover` (Layer 2), `rank_one_specialization` (Layer 2), `SchemeAndStackFoundations:SF.0`.

### 2.6 Spectral submersions

Define `IsSpectralSubmersion`. For a spectral map f of spectral spaces, a spectral submersion means f is surjective and every subset U with compact open inverse image is open. For qcqs scheme maps this uses their underlying spectral maps. Universal spectral submersion means this condition holds after every qcqs scheme base change.

Use the pinned spectral-map predicate, adding only surjectivity and compact-open reflection. A reflected open is automatically compact by surjectivity; the constructible-subset formulation follows from the constructible-topology quotient theorem.

The interface supports the following uses: Give a topological characterization of arc-covers compatible with inverse limits. (BM21 Proposition 2.19).

- `IsSpectralSubmersion.surjective`: Every spectral submersion is surjective.
- `IsSpectralSubmersion.reflect_open`: If f⁻¹(U) is compact open, U is open and compact.
- `IsSpectralSubmersion.comp`: Spectral submersions compose; the identity is one.
- `IsSpectralSubmersion.of_isQuotientMap`: A spectral quotient map is a spectral submersion.
- `UniversalSpectralSubmersion.v_local`: Universal spectral submersion is local for v-covers on both source and target.

**Checks.**

- The identity of an empty or nonempty spectral space is a spectral submersion.
- An inclusion of a proper open spectral subspace fails surjectivity.
- The infinite-rank valuation-chain construction in BM21 Remark 2.18 is universally spectrally submersive without being a topological quotient map.

The universal quantifier is over scheme base changes, not just point fibres.

(BM21, Definition 2.14 and Remark 2.15, p. 12.) *Needs:* `mathlib:IsSpectralMap`, `mathlib:SpectralSpace`, `DiamondsAndVStacks:D0`, `SchemeAndStackFoundations:SF.0`.

### 2.7 Arc-covers are universal spectral submersions

Prove `arc_spectral_characterization`. For a qcqs scheme morphism f, f is an arc-cover if and only if it is universally spectrally submersive. Universal spectral submersions and hence arc-covers are stable under cofiltered limits of diagrams with affine transition maps.

Show the compact-open reflection property after valuation base changes and descend it v-locally. Conversely a failure to lift a rank-one specialization produces a compact open with nonopen image. Descend a compact open and its equality conditions to a finite stage in an affine-transition limit.

Ordinary universal quotient maps are not asserted stable under these limits.

(BM21, Lemma 2.17 pp. 12–13, Proposition 2.19 pp. 14–15 and Corollary 2.20 p. 14.) *Needs:* `ArcCover` (Layer 2), `IsSpectralSubmersion` (Layer 2), `rank_one_specialization` (Layer 2), `arc_v_comparison` (Layer 2), `SchemeAndStackFoundations:SF.0/affine-transition-limits`, `DiamondsAndVStacks:D0`.

### Examples

For Spec V={0,p,m}, the split Spec V_p⊔Spec V/p→Spec V lifts each rank-one interval and is an arc-cover. The identity valuation of V cannot lift faithfully through either factor, so it is not a v-cover. If the target is noetherian the two topologies agree; a scheme merely lying over a noetherian base need not have that property (BM21 Example 1.3, p. 3; Proposition 2.6, p. 10).

### Dependencies

`ArcTopologyAndDescent:AT.0`, `ArcTopologyAndDescent:AT.1`, `DiamondsAndVStacks:D0`, `GeneralAlgebraicKTheory:K.5`, `SchemeAndStackFoundations:SF.0`.

## Layer 3: Finitary descent and valuation detection

Define finitariness and universal descent with coherent totalizations, compact generation by cotruncated objects and descent-detecting families. Impose compact cotruncated generation on the affine finitary criterion and compact generation on Boolean stalk detection. Establish the filtered-totalization interchange and ultraproduct/aic-valuation detection, with the valuation-product component calculation. The continuous v-descent criterion follows here after filtered-totalization interchange. The valuation-product description also proves the infinite-chain non-quotient example and the obstruction to affine covers with only rank-one components.

### 3.1 Compact generation by cotruncated objects

Define `CotruncatedTarget`. An infinity-category C has this property if it is presentable and compactly generated, and each compact K is cotruncated: some finite n(K) makes Map_C(K,−) n(K)-truncated. A uniform n for all K is not required.

Use the supplier’s compact objects and mapping spaces; define the extra cotruncation condition. Check D(Λ)^{≥0}, spaces truncated at a fixed finite n, and the category of n-categories; do not extend the assertion to all spaces or all unbounded derived objects.

The interface supports the following uses: Commute filtered colimits with Cech totalizations by testing compact generators. (BM21 Lemma 3.7). The hypothesis justifies passage from valuation tests to general covers. (BM21 Theorem 4.1).

- `Cotruncated.mappingSpace`: The bound concerns Map(K,X) uniformly in X for each fixed compact K.
- `CompactlyGeneratedByCotruncated.detect`: Equivalences are detected by mapping from all compact objects.
- `CompactlyGeneratedByCotruncated.nonnegativeDerived`: The bounded-below cohomological target used for torsion sections has the required property.
- `CompactlyGeneratedByCotruncated.truncatedSpaces`: The category of n-truncated spaces has the property for finite n.

**Checks.**

- In sets, compact finite sets are 0-cotruncated.
- For D(Λ)^{≥0}, finite cohomological shifts give finite truncation bounds, with the bound depending on the compact generator.
- The point is compact in spaces but Map(*,X)=X has no finite uniform truncation bound; the condition fails for all spaces.

Cohomological degrees are used for D(Λ)^{≥0}.

(BM21, Definition 3.5 and Example 3.6, p. 17.) *Needs:* `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`.

### 3.2 Finitary scheme functors

Define `Finitary`. A functor F:Sch_qcqs,R^op→C is finitary when for each cofiltered inverse system X_i with affine transition maps and limit X, colim_i F(X_i)→F(X) is an equivalence. If C is compactly generated by cotruncated objects and F is a Zariski sheaf, this is equivalent to filtered-colimit continuity on affine R-algebras.

Use the existing affine-transition scheme limit. For the affine criterion, map out of compact cotruncated generators, use finite affine covers of qcqs schemes and their intersections, and commute filtered colimits with the resulting bounded space-valued descent limits.

The interface supports the following uses: Pass from products to ultraproduct stalks. (BM21 Proposition 3.30). Approximate arbitrary arc-covers by finite presentation. (BM21 Theorem 4.1).

- `Finitary.affine_iff`: If C is compactly generated by cotruncated objects and F is a Zariski sheaf, ring filtered-colimit continuity is equivalent to scheme finitariness.
- `Finitary.limitComparison`: Export the canonical comparison and its naturality in diagrams.
- `Finitary.finiteLimits`: Finite limits of finitary functors remain finitary when filtered colimits commute with finite limits in the target.
- `Finitary.etaleCohomology`: The finitary comparison for torsion étale cohomology is the scheme-cohomology continuity map, not a new cohomology construction.

**Checks.**

- The terminal presheaf is finitary.
- For finitely presented affine T over R, Hom_R(Spec A,T) commutes with filtered colimits of A.
- For nonzero R, the representable functor of Spec R[x₁,x₂,…] fails finitariness: the identity over R[x₁,x₂,…] does not factor through any finite-variable subring.

Finite products are a separate property and are not inferred from finitariness.

(BM21, Definition 3.1 p. 16; Definition 3.5 p. 17 for the target hypothesis on the affine criterion.) *Needs:* `SchemeAndStackFoundations:SF.0/affine-transition-limits`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`, `CotruncatedTarget` (Layer 3).

### 3.3 Filtered colimits and totalizations

Prove `filtered_totalization`. In a category compactly generated by cotruncated objects, filtered colimits commute with totalizations of cosimplicial objects. For a finitary F with this target, universal F-descent is stable under affine-transition cofiltered limits of arrows. A finitary F is a v-sheaf exactly when its restriction to finitely presented schemes is a v-sheaf.

Test on each compact K; its n(K)-truncated cosimplicial mapping space has a finite totalization controlling its limit. Commute the finite limit with the filtered colimit and use compactness. Apply scheme approximation and universal descent to obtain the finite-presentation criterion.

The last assertion concerns v-covers; an arc analogue is not inferred.

(BM21, Lemma 3.7, Proposition 3.8 and Corollary 3.9, pp. 17–18.) *Needs:* `CotruncatedTarget` (Layer 3), `Finitary` (Layer 3), `UniversalDescent` (Layer 1), `rydh_refinement` (Layer 1), `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`.

### 3.4 Continuous h-to-v descent

Prove `continuous_v_criterion`. Let F be n-truncated space-valued for a fixed finite n, continuous on affine inverse limits, an fppf sheaf and cartesian on abstract blowup squares with affine base. Then F is a v-sheaf. For an abelian fppf sheaf M whose cohomology is continuous and whose derived sections take such blowup squares to pullbacks, fppf cohomology agrees with v-cohomology.

Apply the h-criterion and affine approximation. Exchange filtered colimits with truncated totalizations; use bounded-below cohomological descent to identify the two cohomologies.

Without truncatedness or a proven completeness argument, continuity alone does not justify totalization interchange.

(BS17, BS17 Corollaries 2.11, 2.14–2.15, pp. 8–10.) *Needs:* `rydh_refinement` (Layer 1), `h_descent_criterion` (Layer 1), `filtered_totalization` (Layer 3), `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`.

### 3.5 Families detecting universal descent

Define `DetectionFamily`. A family X_i→X detects universal F-descent when, for every qcqs Y→X, that map is of universal F-descent exactly when all its pullbacks to X_i are. A universally-F-descent singleton detects; detecting families compose and persist under the affine-transition limit situation of BM21 Lemma 3.24.

Define detection for all maps over X, retaining universality in each pullback. Use cancellation, composition and limit stability of descent.

The interface supports the following uses: Assemble aic valuation test families and their ultraproduct closure. (BM21 Proposition 3.30).

- `DescentDetecting.singleton`: A universal descent map gives a detecting singleton.
- `DescentDetecting.comp`: Composing a detecting family with a detecting family over every member remains detecting.
- `DescentDetecting.affineLimit`: With F finitary and cotruncated-compact target, the same family detecting over each X_j detects over lim X_j.
- `DescentDetecting.product`: An affine detecting family makes its product map universally F-descending.

**Checks.**

- The identity singleton detects.
- For a Zariski sheaf, a finite affine open cover detects universal descent.
- For the functor of sections of A¹ over a nonempty base, the empty test family cannot detect the failure of the empty cover.

For affine detecting A→A_i, the product map A→∏A_i is itself of universal descent because every test pullback splits.

(BM21, Definition 3.20, Examples 3.21–3.23 and Lemma 3.24, p. 21.) *Needs:* `UniversalDescent` (Layer 1), `Finitary` (Layer 3), `filtered_totalization` (Layer 3).

### 3.6 Ultraproduct components of valuation products

Prove `product_components`. For rings A_i the natural map Spec(∏_i A_i)→βI has fibre Spec(∏_U A_i) over an ultrafilter U. For valuation domains these fibres are connected and are exactly the connected components; ultraproducts of aic valuation domains are aic valuation domains, although their rank need not remain at most one.

Use idempotents to identify the clopen subsets from subsets of I. Identify the localization at an ultrafilter with the ring ultraproduct. Apply the pinned Łoś theorem to total divisibility, nontrivial domain axioms, and the monic-root assertion separately for each finite degree.

No assertion of preservation of rank one by arbitrary ultraproducts is made.

(BM21, Remark 3.16 and Construction 3.17 p. 20; Lemma 3.27 p. 22.) (BS17, Lemma 6.2, p. 21.) *Needs:* `DiamondsAndVStacks:D0`, `mathlib:FirstOrder.Language.Ultraproduct.sentence_realize`, `mathlib:ValuationRing`, `IsAbsolutelyIntegrallyClosed` (Layer 0).

### 3.7 Infinite-chain and component counterexamples

Prove `spectral_limit_counterexample`. There is a universally spectral-submersive map obtained from an infinite chain of valuation primes which fails to be a quotient map. Moreover k[x,y] has no affine arc-cover whose every connected component is the spectrum of a rank-at-most-one valuation ring.

Use the displayed inverse system of finite prime splits to construct the first example; a tail of primes detects failure of the quotient topology. For the second, noetherian-target arc=v would lift a rank-two valuation; every component of the proposed source has rank at most one, making such a lift impossible.

Products of rank-one factors can have higher-rank ultraproduct components; they are not counterexamples to this obstruction.

(BM21, Remark 2.18 pp. 13–14 and Remark 3.31 p. 23.) *Needs:* `arc_spectral_characterization` (Layer 2), `finite_rank_approximation` (Layer 0), `arc_v_comparison` (Layer 2), `product_components` (Layer 3).

### 3.8 The Boolean sheaf of a finitary functor

Construct `BooleanSheaf`. Let C be a compactly generated presentable infinity-category. For a filtered-colimit- and finite-product-preserving functor F:Ring_R→C and a family (A_i), the assignment J⊂I↦F(∏_{i∈J}A_i) is a C-valued sheaf on the clopen site of βI, whose stalk at U is F(∏_U A_i). With a fixed ∏A_i-algebra B, replace each product by B⊗_{∏A_i}∏_J A_i and obtain the corresponding base-changed stalk formula. Compact generation also permits detection of equivalences on these stalks.

Finite product preservation supplies descent on finite clopen partitions. Compute the stalk as a filtered colimit over U and use finitariness. Test compact mapping objects to detect equivalences and bounded truncation stalkwise.

The interface supports the following uses: Detect Cech descent after base change to every ultraproduct. (BM21 Lemma 3.25).

- `booleanSheaf_stalk`: The U-stalk is the functor value on the U-ultraproduct, including the B-tensor variant.
- `booleanSheaf_globalSections`: Global sections recover F(∏ A_i).
- `booleanSheaf_naturality`: Natural transformations of F and maps of families induce maps compatible with all stalk identifications.
- `booleanSheaf_detect`: An equivalence on all ultraproduct values implies an equivalence on the whole product value.

**Checks.**

- For I a singleton the unique stalk and global section are both F(A).
- For I empty the ring product is the zero ring, and F(0) is terminal by finite-product preservation.
- For two fields k₁,k₂, βI has two points, global sections are F(k₁)×F(k₂), and there are no additional nonprincipal stalks.

Infinite products in the ring input must not be confused with coproducts of schemes or preservation of infinite products by F.

(BM21, Construction 3.17 and Corollaries 3.18–3.19, pp. 20–21.) *Needs:* `Finitary` (Layer 3), `product_components` (Layer 3), `DiamondsAndVStacks:D0`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`.

### 3.9 Ultraproduct detection of descent

Prove `ultraproduct_descent_detection`. Let F be finitary and preserve finite products, with target compactly generated by cotruncated objects. For A=∏_i A_i, the maps A→∏_U A_i, over all ultrafilters U, detect universal F-descent.

Upgrade the augmented Cech diagram after arbitrary base change B to a diagram of Boolean sheaves. Use the stalk formulas and filtered-totalization interchange, then detection by global sections.

The conclusion tests all ultrafilters, not just principal ones.

(BM21, Lemma 3.25, pp. 21–22.) *Needs:* `BooleanSheaf` (Layer 3), `DetectionFamily` (Layer 3), `CotruncatedTarget` (Layer 3).

### 3.10 Aic valuations detect v-descent

Prove `aic_valuation_detection`. For each A there is a v-cover A→∏_i V_i with aic valuation domains of unrestricted rank. For any finitary v-sheaf F with cotruncated-compact target, a family of such A→V_i can be chosen detecting universal F-descent. Natural transformations between such finitary v-sheaves are equivalences if and only if they are equivalences on all aic valuation domains.

Choose bounded-cardinality representatives of aic valuation tests to get a set-indexed product v-cover. Enlarge the test family by all ultraproducts and invoke Boolean descent detection. Construct valuation-product hypercovers and use compact cotruncated tests to reduce to truncated hyperdescent.

The product map is a positive theorem with arbitrary-rank factors; no rank-one-component conclusion follows.

(BM21, Propositions 3.30 and 3.32, pp. 23–24.) *Needs:* `aic_extension_and_size` (Layer 0), `product_components` (Layer 3), `ultraproduct_descent_detection` (Layer 3), `VCover` (Layer 1), `CotruncatedTarget` (Layer 3), `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`.

### Examples

For two factors A₁,A₂, β{1,2} has two points and F(A₁×A₂)=F(A₁)×F(A₂). For infinitely many rank-one valuations a nonprincipal ultraproduct can have extra prime ideals. Thus the product basis does not give an affine arc-cover all of whose connected components have rank at most one (BM21 Remark 3.31, p. 23).

### Dependencies

`ArcTopologyAndDescent:AT.0`, `ArcTopologyAndDescent:AT.1`, `ArcTopologyAndDescent:AT.2`, `DiamondsAndVStacks:D0`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E2`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`.

## Layer 4: The arc-descent criterion

Define excisiveness and aic-v-excision using the imported Milnor-square interface. Prove universal aic splitting with the corrected prime-extension lemma, interval induction, the equivalence of arc-descent and excision for finitary v-sheaves, and rank-at-most-one detection of equivalences. The space-valued contractibility test carries a fixed global finite truncation bound.

### 4.1 Prime extension in the nondegenerate case

Prove `corrected_prime_extension`. Let f:V→W be a map of aic valuation domains and p a prime of V. If ker f⊆p and pW≠W, then pW is prime and contracts to p. There is a largest prime q of W contracting to p, and W⊗_V V_p≃W_q, W⊗_V V/p≃W/pW, W⊗_V κ(p)≃W_q/pW_q. The primes pW and q need not coincide.

Replace V by V/ker f, which retains p under the kernel-containment hypothesis. Divisibility of the valuation groups makes pW radical; use total divisibility and properness of pW to prove contraction. The union of all primes contracting to p is the largest such q. Compare prime spectra of localizations to identify W⊗V_p with W_q; then quotient by p.

The second localization uses the largest prime over p, not automatically pW. For a field V embedded in a positive-rank aic W and p=0, pW=0 while q is the maximal ideal of W.

(BM21, Lemma 4.3, pp. 25–26, with the kernel-containment repair in the reviewed BM21 fixes.) *Needs:* `IsAbsolutelyIntegrallyClosed` (Layer 0), `valuation_prime_square` (Layer 0), `SchemeAndStackFoundations:SF.0`.

### 4.2 Finite-presentation persistence of a v-cover

Prove `eventual_v_cover`. Let A=colim A_i and B_i a compatible finitely presented A_i-algebra with cartesian transition maps. If Spec(B_i⊗A)→Spec A is a v-cover, some Spec B_j→Spec A_j is a v-cover.

Descend the proper-surjective/open refinement and its factorization to a finite stage. Use finite presentation and eventual surjectivity for the proper and open factors.

A general noncartesian diagram of maps does not meet the hypothesis.

(BM21, Lemma 4.5, p. 27.) *Needs:* `rydh_refinement` (Layer 1), `SchemeAndStackFoundations:SF.0/affine-transition-limits`, `SchemeAndStackFoundations:SF.0`.

### 4.3 Excisive functors and aic-v-excision

Define `Excision`. Use the imported Milnor datum A→B, I≅J⊂B, so A=B×_{B/J}A/I. A ring functor F is excisive if F(A)→F(B)×_{F(B/J)}F(A/I) is an equivalence for every such datum. It has aic-v-excision if it sends V→V/p, V_p→κ(p) to a pullback for every aic valuation domain V and prime p.

Define the predicates using the imported pullback-square and coherent-limit interfaces. Keep the common residue field κ(p) and arrow directions fixed.

The interface supports the following uses: Convert aic valuation splitting into arc-descent. (BM21 Theorem 4.1). Check splitting for concrete cohomological functors. (BM21 §5).

- `IsExcisive.comparison`: Export the canonical Milnor-square comparison map.
- `IsExcisive.aicVExcision`: Excision implies aic-v-excision by the valuation prime square.
- `AicVExcision.zero_maximal`: For p=0 or p=m the required pullback has an identity edge.
- `IsExcisive.limits`: Pointwise limits of excisive functors remain excisive, with the analogous aic assertion.

**Checks.**

- For a rank-two aic V and middle p the test is exactly F(V)=F(V_p)×_{F(κ(p))}F(V/p).
- The terminal functor satisfies both predicates.
- Take a perfect aic rank-two V with middle p. In the v-topos of perfect schemes, the sheaf image H of h_(Spec V_p)⊔h_(Spec V/p)→h_(Spec V) is proper because this split is not a v-cover. Its prime-square sections at the identity of V fail the excision comparison, although H is a v-sheaf.

No Tor-independence is imposed on a general Milnor datum.

(BM21, Theorem 4.1 and Proposition 4.2, p. 25.) *Needs:* `GeneralAlgebraicKTheory:K.5`, `valuation_prime_square` (Layer 0), `UniversalDescent` (Layer 1), `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`.

### 4.4 Induction on prime intervals

Prove `interval_induction`. Let P be a class of closed intervals in Spec V containing intervals of length at most one, closed under subintervals and unions of overlapping intervals. Suppose each nonmaximal p extends upward to some [p,q]∈P and each nonzero q extends downward to some [p,q]∈P. Then every interval belongs to P.

For a chain of intervals take the infimum of lower endpoints and supremum of upper endpoints. The two extension properties and overlap closure place the limiting interval in P. Apply Zorn and rule out either endpoint of a maximal interval being internal.

The outward-extension assumptions cannot be replaced just by closure under finite unions.

(BM21, Lemma 4.7, pp. 27–28.) *Needs:* `ValuationInterval` (Layer 0), `mathlib:ValuationRing`.

### 4.5 Universal descent of the valuation split

Prove `universal_aic_splitting`. If a finitary v-sheaf F has aic-v-excision and cotruncated-compact target, then Spec(V/p)⊔Spec(V_p)→Spec V is of universal F-descent for every aic V.

Reduce an arbitrary base change to a map V→W of aic valuation rings. If pW=W the square is trivial. If p⊊ker(V→W), choose s∈ker minus p: then pW=0, W⊗V_p=0 and W⊗κ(p)=0, leaving the identity square. When ker f⊆p and pW≠W, use the largest prime q over p to write the base-change square with W_q. Paste the prime-splitting squares for W at pW and for W_q at pW_q; their common localization is W_(pW).

All three cases, including p strictly below the kernel, must appear in the proof.

(BM21, Lemma 4.4, pp. 26–27.) *Needs:* `Excision` (Layer 4), `corrected_prime_extension` (Layer 4), `aic_valuation_detection` (Layer 3), `milnor_arc_cover` (Layer 2).

### 4.6 The arc-descent criterion

Prove `arc_descent_criterion`. Let C be compactly generated by cotruncated objects and F:Sch_qcqs,R^op→C a finitary v-sheaf. The following are equivalent: F is an arc-sheaf; F is excisive for all Milnor squares; F satisfies aic-v-excision.

Arc-descent gives splitting descent; unwind the valuation-split Cech nerve to obtain aic-v-excision. For the converse reduce to affine finitely presented covers over aic V. Use interval induction: rank-one intervals give v-descent, outward extension uses finite-presentation persistence, overlap uses universal aic splitting. For all Milnor squares reduce by v-descent to domains; the domain base-change square remains Milnor. Surjective Milnor squares are already handled by v-descent.

Neither finitariness nor the target condition can be discarded in this proof; the unrestricted result comes from the coherent arc-topos.

(BM21, Theorem 4.1 and Proposition 4.2 p. 25; Proposition 4.8 pp. 28–29; Proposition 4.15 p. 32.) *Needs:* `Excision` (Layer 4), `universal_aic_splitting` (Layer 4), `eventual_v_cover` (Layer 4), `interval_induction` (Layer 4), `aic_valuation_detection` (Layer 3), `filtered_totalization` (Layer 3), `arc_v_comparison` (Layer 2).

### 4.7 Rank-one detection of equivalences

Prove `rank_one_detection`. For finitary arc-sheaves F,G with target compactly generated by cotruncated objects, a natural transformation is an equivalence if and only if it is an equivalence on aic valuation domains of rank at most one. It suffices that each such test admits an aic rank-at-most-one extension on which the map is an equivalence. For a finitary space-valued arc-sheaf whose values are all n-truncated for one fixed finite n, contractibility can be tested on these valuation domains; arbitrary unbounded spaces are not covered by this last assertion.

For a space-valued sheaf with a fixed finite truncation bound, use descending induction on that bound: its diagonal fibres have a smaller bound, and the discrete case follows by interval induction as in Lemmas 4.9–4.10. For C-valued equivalences, map out of compact cotruncated generators and apply the bounded space-valued result to fibres, followed by aic-valuation detection. For the extension variant, first descend the diagonal and its lower-truncated fibres; then use the resulting Cech descent along the faithful rank-one extension, as in Corollary 4.12.

This is a statement about sheaves, not a cover by a scheme all of whose components have rank one.

(BM21, Lemmas 4.9–4.10 and Corollaries 4.11–4.12, pp. 29–31.) *Needs:* `arc_descent_criterion` (Layer 4), `interval_induction` (Layer 4), `aic_valuation_detection` (Layer 3), `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`.

### Examples

For a field V inside an aic valuation ring W, take p=0. The extended prime pW is zero, whereas the largest prime contracting to p is m_W. Thus W⊗_V V=W localizes at m_W, not at zero. If p lies strictly below ker(V→W), both localized tensor terms vanish; this is the extra case in the corrected splitting proof (BM21 Lemmas 4.3–4.4, pp. 25–27).

### Dependencies

`ArcTopologyAndDescent:AT.0`, `ArcTopologyAndDescent:AT.1`, `ArcTopologyAndDescent:AT.2`, `ArcTopologyAndDescent:AT.3`, `EnhancedDerivedSheaves:E0`, `GeneralAlgebraicKTheory:K.5`, `SchemeAndStackFoundations:SF.0`.

## Layer 5: The coherent arc-topos and unrestricted excision

Construct the bounded-cardinal arc-site, its comparison across cutoffs and its coherent topos. Prove valuation tests for coherent sheaves, the sheafified Milnor pushout and excision for every small-limit-valued arc-sheaf. Exhibit failure of subcanonicity.

### 5.1 A cardinal-bounded arc-site

Construct `BoundedArcSite`. Fix an uncountable strong-limit cardinal κ>|R|. On a skeleton of qcqs R-schemes admitting a finite affine cover by rings of cardinality <κ, a family covers if a finite subfamily has arc-covering disjoint union. This defines a Grothendieck topology; the test valuation extensions can be taken of size <κ.

Use strong-limit cardinal arithmetic to bound products of small valuation tests. Check identities, composition and base change using the arc-cover calculus.

The interface supports the following uses: Make coherent-topos arguments on a genuinely small site. (BM21 §4.3). Interpret formal glueing as a pushout after arc-sheafification. (AT.8).

- `arcSite.cover_iff`: Covering families have a finite arc-covering subfamily.
- `arcSite.affineBasis`: Finite affine covers give a basis for the scheme arc-site.
- `arcSite.smallValuationTest`: The bounded valuation lifting criterion agrees with the unrestricted one on objects of the site.
- `arcSite.changeCutoff`: A larger uncountable strong-limit cutoff induces the comparison geometric morphism.

**Checks.**

- The empty family covers precisely the empty scheme.
- Spec k→Spec k[ε]/ε² is a cover.
- Spec Q together with all Spec Z_(p) has the valuation lifting property over Spec Z but has no finite covering subfamily, so is not a cover.

The chosen skeleton is small relative to the next universe; arbitrary families are not treated as finite covers.

(BM21, Definition 4.16 and Remark 4.17, pp. 32–33.) *Needs:* `ArcCover` (Layer 2), `aic_extension_and_size` (Layer 0), `mathlib:CategoryTheory.GrothendieckTopology`, `SchemeAndStackFoundations:SF.0`.

### 5.2 Coherence and enough points

Prove `coherent_arc_topos`. The set-valued arc-topos on the bounded site is coherent and has enough points. Each sheafified representable h_X^# is coherent. A sheaf G is coherent exactly when some h_X^# surjects onto G and its relation h_X^#×_G h_X^# is quasi-compact. Pushouts B⊔_A C of coherent objects with A→B monic are coherent.

Apply the coherent-site theorem and Deligne completeness from the topos supplier. For the pushout compute its three relation terms on points; the B×_D B relation is covered by B and A×_C A.

Representables are sheafified before invoking coherence.

(BM21, Lemma 4.19 and Lemma 4.23, pp. 33–35.) *Needs:* `BoundedArcSite` (Layer 5), `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`.

### 5.3 Valuation tests for coherent sheaves

Prove `coherent_valuation_test`. For F→G of arc-sheaves of sets, with F quasi-compact and G coherent, surjectivity is equivalent to lifting sections after bounded rank-at-most-one valuation extensions. Between coherent objects, equivalence can be tested on a cofinal class of such valuation rings. For presheaves with coherent sheafifications it suffices to obtain surjectivity or bijectivity after such extensions on presheaf values.

Cover the target and the pulled-back source by sheafified representables and reduce to the definition of arc-cover. Apply the surjectivity test also to the diagonal. Lift a sheaf section locally to a presheaf section before using the assumed test.

The infinite Q and Z_(p) family from the site tests disproves the assertion without source quasi-compactness.

(BM21, Lemmas 4.21–4.22, pp. 33–34.) *Needs:* `coherent_arc_topos` (Layer 5), `ArcCover` (Layer 2), `aic_extension_and_size` (Layer 0).

### 5.4 Comparison of cardinal cutoffs

Prove `cutoff_comparison`. For κ<κ′ uncountable strong limits greater than |R|, inclusion of bounded scheme categories preserves finite limits and covers and induces Sh_arc(κ′)→Sh_arc(κ). Its inverse-image functor takes the arc-sheafification of h_X on the smaller site to the arc-sheafification of h_X on the larger site, for every X of size <κ.

Use the common finite-limit and cover calculus. Compare the plus construction through bounded cover refinements.

No equivalence of the entire two topoi, or unrestricted size independence, is claimed.

(BM21, Remark 4.18, p. 33.) *Needs:* `BoundedArcSite` (Layer 5), `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`.

### 5.5 Milnor squares as arc-sheaf pushouts

Prove `milnor_sheafified_pushout`. For any Milnor datum A=B×_{B/J}A/I, the scheme square Spec(B/J)→Spec B, Spec(A/I)→Spec A becomes a pushout after arc-sheafification, both in sets and in spaces. Consequently every arc-sheaf with values in any infinity-category admitting small limits is excisive.

The closed immersion is monic, so the space pushout is set-valued after sheafification and coherent. Test its map to h_SpecA^# on rank-one valuations, where the Milnor square is locally degenerate. Use the sheafified Yoneda universal property and pointwise mapping-space tests to obtain the arbitrary small-limit-valued assertion.

This assertion needs neither finitariness nor cotruncated compact generation.

(BM21, Proposition 4.24 and Corollary 4.25, pp. 35–36.) *Needs:* `Excision` (Layer 4), `coherent_arc_topos` (Layer 5), `coherent_valuation_test` (Layer 5), `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `GeneralAlgebraicKTheory:K.5`, `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`.

### 5.6 Failure of subcanonicity

Prove `non_subcanonical`. For a field k the monomorphism Spec k→Spec k[ε]/ε² is a v-cover and an arc-cover. The representable functor h_A¹ fails descent along it, since its Cech nerve is constant at Spec k while k[ε]/ε²→k is not injective. Thus neither full scheme topology is subcanonical; the perfect-scheme restriction is a different assertion.

Compute all iterated fibre products of the quotient closed immersion. Evaluate h_A¹ to see the nonzero nilpotent disappears.

This counterexample accompanies all uses of sheafified representables.

(BM21, Warning 4.20, p. 33; the nilpotent affine-line counterexample is the direct sheaf-condition check below.) *Needs:* `arc_v_comparison` (Layer 2), `v_cover_geometry` (Layer 1), `SchemeKTheoryOperations:S.4/perfect-scheme-h-and-v-sites`.

### Examples

For k[ε]/ε²→k, the associated monomorphism of schemes is already a v-cover. Its Cech nerve is constant at Spec k. Sections of the affine-line representable would require k[ε]/ε²≃k, which fails because ε is nonzero. The full scheme v- and arc-sites are therefore not subcanonical (BM21 Warning 4.20, p. 33).

### Dependencies

`ArcTopologyAndDescent:AT.0`, `ArcTopologyAndDescent:AT.1`, `ArcTopologyAndDescent:AT.2`, `ArcTopologyAndDescent:AT.4`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`, `GeneralAlgebraicKTheory:K.5`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `SchemeKTheoryOperations:S.4`.

## Layer 6: Étale cohomology and étale objects

Apply the criterion to torsion étale cohomology and separated qcqs étale objects, finite étale schemes and constructible finite-set sheaves. Identify separated étale objects over aic valuation rings and the finite-chain category, without restricting its morphisms to injections.

### 6.1 Strictly henselian valuation calculations

Prove `strict_henselian_tests`. An aic valuation domain, every quotient by a prime and every localization at a prime are strictly henselian. For any torsion étale sheaf F on such a spectrum V, RΓ(V,F) identifies with its closed-point stalk. Finite étale V-schemes form FinSet.

Use splitting of monic polynomials and lifting of coprime factors to obtain henselianity and separably closed residue fields. Apply exactness of sections on a strictly henselian local scheme.

The stalk at the closed point, not at an arbitrary point, computes sections.

(BM21, Lemma 5.1 p. 37, Proposition 5.2 pp. 37–38 and Lemma 5.3 p. 38.) *Needs:* `IsAbsolutelyIntegrallyClosed` (Layer 0), `SchemeAndStackFoundations:SF.0/henselian-pair-characterisations`, `SchemeAndStackFoundations:SF.0/henselian-finite-etale-equivalence`, `SchemeAndStackFoundations:SF.2`.

### 6.2 Strict-henselization detection of descent

Prove `strict_henselization_descent`. Let Λ be a ring and F:Sch_qcqs,R^op→D(Λ)^{≥0} a finitary étale sheaf. If all base changes of f:Y→X to strict henselizations of X are of F-descent, then f is of F-descent. Applying this criterion after every base change detects universal F-descent.

Regard the two sides of the Cech comparison as sheaves on the small étale site of X. Filtered-totalization interchange makes their stalks equal to values on strict henselizations. The enough-points theorem for the étale topos makes the comparison an equivalence.

Ordinary F-descent alone is not asserted to be preserved by arbitrary base change.

(BM21, Lemma 5.1, p. 37.) *Needs:* `UniversalDescent` (Layer 1), `filtered_totalization` (Layer 3), `SchemeAndStackFoundations:SF.2`.

### 6.3 Torsion étale cohomology is a finitary v-sheaf

Prove `torsion_v_descent`. Fix a torsion abelian sheaf F on S_et with S qcqs. The functor X↦RΓ(X_et,F|X) on Sch_qcqs,S^op takes values in D(Z)^{≥0}, is finitary and satisfies v-descent. It satisfies hyperdescent because the complexes are uniformly bounded below.

Use scheme étale continuity to prove finitariness. Use proper base change and étale descent in the h-criterion, then approximate v-covers. Apply bounded-below hypercover descent in the enhanced category.

No invertibility condition on the torsion orders is needed for this algebraic assertion.

(BM21, Proposition 5.2, pp. 37–38.) *Needs:* `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`, `Finitary` (Layer 3), `continuous_v_criterion` (Layer 3), `h_descent_criterion` (Layer 1), `CotruncatedTarget` (Layer 3), `strict_henselization_descent` (Layer 6).

### 6.4 Arc-hyperdescent of torsion étale cohomology

Prove `torsion_arc_hyperdescent`. For every torsion abelian étale sheaf F on a qcqs base S, X↦RΓ(X_et,F|X) is a finitary hypercomplete arc-sheaf. In particular it carries every Milnor square to a homotopy pullback.

Identify all four terms on the aic prime square with appropriate closed-point stalks; the required square has a matching identity edge. Apply the criterion and then the uniformly bounded-below hyperdescent theorem.

Coefficients may have residue-characteristic torsion; this is distinct from the stronger analytic d-dimensional vanishing bound.

(BM21, Theorem 5.4 p. 38 and Remark 5.5 p. 39.) *Needs:* `torsion_v_descent` (Layer 6), `strict_henselian_tests` (Layer 6), `arc_descent_criterion` (Layer 4), `milnor_sheafified_pushout` (Layer 5), `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`.

### 6.5 Étale objects over aic valuations

Prove `valuation_etale_objects`. Every qcqs separated étale scheme over an aic valuation domain V is a finite disjoint union of principal open subschemes Spec V[1/t]. For rank n, write the specialization chain as 0→1→⋯→n. The category is the full subcategory of Fun(chain^op,FinSet) whose transition maps are injective. Morphisms are all natural transformations. Constructible finite-set sheaves form the full Fun(chain^op,FinSet).

Apply Zariski main theorem and strict henselianity, remove the closed-point components, and induct over the remaining open interval. For arbitrary rank descend to finite-rank subrings by continuity. Classify objects by their stalks and generization maps; retain all sheaf morphisms.

A rank-n valuation has n+1 points; the fold map V⊔V→V is allowed.

(BM21, Proposition 5.7 and proof of Theorem 5.6, pp. 39–40, with reviewed indexing and morphism repairs.) *Needs:* `finite_rank_approximation` (Layer 0), `strict_henselian_tests` (Layer 6), `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.4`.

### 6.6 Rydh arc-descent for étale objects

Prove `etale_objects_arc_descent`. The following Cat₁-valued functors are finitary arc-sheaves: separated qcqs étale X-schemes; finite étale X-schemes; and constructible finite-set étale sheaves on X. The last category is equivalently qcqs étale algebraic spaces over X, without a separatedness assumption.

Import effective étale-object descent for universal submersions, giving v-descent by finite-presentation approximation. Use the finite-chain descriptions and glue functors across the shared prime. Apply the criterion in Cat₁.

Object transitions are injections in the separated case, but maps between objects are unrestricted.

(BM21, Theorem 5.6, pp. 39–40.) *Needs:* `valuation_etale_objects` (Layer 6), `arc_descent_criterion` (Layer 4), `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.0/affine-transition-limits`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`.

### Examples

At an algebraically closed field, separated qcqs étale schemes form FinSet, including the fold {1,2}→{*}. For a rank-n aic valuation ring there are n+1 chain vertices; injectivity constrains transition maps of objects, not all morphisms of their category (BM21 Theorem 5.6 and Proposition 5.7, pp. 39–40).

### Dependencies

`ArcTopologyAndDescent:AT.0`, `ArcTopologyAndDescent:AT.1`, `ArcTopologyAndDescent:AT.3`, `ArcTopologyAndDescent:AT.4`, `ArcTopologyAndDescent:AT.5`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E2`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`, `ArcTopologyAndDescent:AT.0/valuation-prime-square`.

## Layer 7: Constructible complexes, differentials and perfect schemes

Prove continuity and arc-hyperdescent of bounded constructible complexes over a finite coefficient ring; compute their finite-rank valuation model. State the smooth h/Zariski differential-form comparison, then establish characteristic-zero h-differential and h-de Rham arc-descent, and upgrade imported perfect-complex v-hyperdescent to arc-hyperdescent on perfect schemes, with the universally-effective-epimorphism criterion.

### 7.1 Continuity of bounded constructible complexes

Prove `constructible_continuity`. For finite Λ, import Dᵇ_cons(X_et,Λ) with bounded constructible cohomology, without imposing finite Λ-Tor dimension. This category and each fixed cohomological-amplitude subcategory commute with affine-transition filtered inverse limits of qcqs schemes.

Descend constructible sheaves and extensions from finite-presentation stages. For full faithfulness reduce the source to j!M and apply torsion-cohomology continuity to RHom(M,RΓ(U,−)). Use bounded truncations to descend complexes with a prescribed amplitude.

Λ=Z/4 and the constant Λ-module Z/2 in degree zero is included, although it has infinite projective dimension.

(BM21, Notation 5.8, Remark 5.9 and Proposition 5.10, p. 41.) *Needs:* `EtaleDualityAndPerverseSheaves:EDC.0`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.0/affine-transition-limits`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`.

### 7.2 v-hyperdescent of constructible complexes

Prove `constructible_v_hyperdescent`. For finite Λ, Dᵇ_cons(−,Λ) and every subcategory of amplitude [−n,n] are hypercomplete v-sheaves. The fixed-amplitude category lies in Cat_(2n+1); a uniform bound is recovered from level zero of a descent datum.

For a proper surjection of finite-type schemes over Spec Z, pullback is conservative and t-exact. On amplitude [−n,n], its right adjoint is the truncated derived pushforward; proper base change gives the right-adjointable Cech squares. Use the requested dual of HA Corollary 4.7.5.3. Finite limits in the fixed-amplitude category are computed by truncating derived limits, and exact pullback commutes with them; totalizations are finite for this (2n+1)-category. Then apply the h-descent criterion and finitary v-approximation. For the bounded union, any hyperdescent datum has a common cohomological-amplitude bound detected by pullback to level zero. This reduces it to one fixed-amplitude stratum.

Do not commute an arbitrary filtered union with an arbitrary infinite limit; the uniform bound is essential.

(BM21, Proposition 5.11, pp. 41–42.) (HA, Corollary 4.7.5.3 and its proof, p. 705.) *Needs:* `constructible_continuity` (Layer 7), `h_descent_criterion` (Layer 1), `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`, `EnhancedDerivedSheaves:E5:abstract/barr-beck-lurie`, `EnhancedDerivedSheaves:E5:abstract`.

### 7.3 Arc-hyperdescent of constructible complexes

Prove `constructible_arc_hyperdescent`. For an aic valuation domain V of rank n, Dᵇ_cons(V_et,Λ)≃Fun((0→⋯→n)^op,Dᵇ_fg(Λ)). These finite-chain descriptions split at each prime. Consequently Dᵇ_cons(−,Λ) is a finitary hypercomplete arc-sheaf; the same holds with fixed amplitude or with the additional finite-Tor-dimension restriction.

Identify the étale topos with the sheaves on the valuation chain, then impose finite constructible stalks. Glue functors on the two intervals at their common point to obtain aic-v-excision. Apply the criterion on bounded strata and the level-zero amplitude argument.

Dᵇ_fg(Λ) concerns finitely generated cohomology, not solely perfect Λ-complexes.

(BM21, Proposition 5.12 and Theorem 5.13, pp. 42–43.) *Needs:* `constructible_v_hyperdescent` (Layer 7), `valuation_etale_objects` (Layer 6), `arc_descent_criterion` (Layer 4), `EtaleDualityAndPerverseSheaves:EDC.0`.

### 7.4 Finitary h-differentials

Construct `HDifferentialFunctor`. Fix a characteristic-zero field k and i≥0. On finite-type k-schemes take RΓ_h(X,Ω^i_h), the h-cohomology of the h-sheafification of ordinary Kähler i-forms; extend to qcqs schemes by the finitary left Kan extension along finite-type approximations. The analogous extension of h-sheafified de Rham cohomology is denoted F_dR.

Form sheafification and derived sections using the supplier interfaces. Use affine-transition approximation and cofinality of approximation categories to define the extension independently of the presentation.

The interface supports the following uses: Verify prime-square splitting by flat differential modules on aic valuations. (BM21 Theorem 5.14). Deduce the filtered de Rham arc-sheaf assertion. (BM21 Corollary 5.15).

- `hForms.approximation`: Its value on lim X_j is colim RΓ_h(X_j,Ω^i_h).
- `hForms.smoothComparison`: For smooth finite-type X, recover RΓ_Zar(X,Ω^i_X/k).
- `hForms.indSmooth`: For ind-smooth affine A, recover Ω^i_A/k concentrated in degree zero.
- `hDeRham.hodgeGraded`: The Hodge associated graded is the corresponding h-form functor shifted by −i, with the finite-dimensional approximations controlling the filtration.

**Checks.**

- F₀(Spec k)=k and F_i(Spec k)=0 for i>0.
- F₁(Spec k[t])=k[t]dt in degree zero.
- The reduction Spec k→Spec k[ε]/ε² is an h-cover, so F₀ is k, rather than the naive dual-number ring.

The construction is cohomological h-sheafification, not the naive module Ω^i_A on every singular affine.

(BM21, §5.3, Theorem 5.14 and Corollary 5.15, pp. 43–44.) (HJ14, Corollary 6.5 p. 465 and Proposition 6.10 p. 466.) *Needs:* `Finitary` (Layer 3), `HSite` (Layer 1), `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `DerivedDeRhamCohomology:DD.0/cotangent-naive-comparison`, `DerivedDeRhamCohomology:DD.0/smooth-cotangent`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`.

### 7.5 Smooth h/Zariski comparison for differential forms

Prove `smooth_h_differential_comparison`. Let k have characteristic zero, i≥0 and X be a smooth separated finite-type k-scheme. The natural comparison RΓ_Zar(X,Ω^i_X/k)→RΓ_h(X,Ω^i_h) is an equivalence. By Zariski descent the same comparison holds for smooth finite-type qcqs k-schemes. Consequently the finitary h-form functor on an ind-smooth affine k-algebra A is Ω^i_A/k in degree zero.

Use characteristic-zero resolution to refine h-covers by smooth covers and abstract blowup diagrams. Rational coefficients permit finite Galois descent, so comparison with the étale/abstract-blowup (eh) topology preserves cohomology, as in HJ14 Proposition 6.1. For smooth schemes, ordinary differential forms satisfy the eh comparison with Zariski cohomology; the resolution/blowup and étale descent argument gives HJ14 Corollary 6.5. Apply it to the natural comparison, then glue affine opens by Zariski descent. On smooth affines, quasi-coherence kills positive Zariski cohomology. Pass to filtered colimits using the defined finitary extension and the cotangent/exterior-power colimit interfaces.

For A=k[t], degree-one h-form cohomology is k[t]dt in degree zero. The smoothness hypothesis cannot be replaced by an assertion identifying naive Kähler forms on all singular rings.

(HJ14, Setting and Notation p. 452; Proposition 6.1 pp. 464–465 and Corollary 6.5 p. 465.) (BM21, §5.3 and proof of Theorem 5.14, p. 43.) *Needs:* `HDifferentialFunctor` (Layer 7), `SchemeAndStackFoundations:SF.4`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `DerivedDeRhamCohomology:DD.0/cotangent-localization-colimits`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `SchemeAndStackFoundations:SF.2`.

### 7.6 Arc-descent of characteristic-zero differential cohomology

Prove `h_differential_arc_descent`. The functors F_i and F_dR above are arc-sheaves on qcqs k-schemes. On an aic valuation k-algebra V, Ω^i_V/k is flat, p=p² for each prime p and Ω^i_(V/p)/k=Ω^i_V/k⊗V/p, so the differential prime square is a homotopy pullback.

Apply AT.7/smooth-h-differential-comparison and the imported characteristic-zero local uniformization to identify valuation values with ordinary forms. Tensor the valuation square with the flat exterior-power module; use idempotence of p for quotient compatibility. For de Rham use the Hodge filtration on each finite-dimensional approximation; extend the resulting h-sheaf functor finitarily as in the forms construction.

Characteristic zero is retained; no assertion of naive Kähler arc-descent on arbitrary rings is made.

(BM21, Theorem 5.14 and Corollary 5.15, pp. 43–44.) *Needs:* `HDifferentialFunctor` (Layer 7), `smooth_h_differential_comparison` (Layer 7), `arc_descent_criterion` (Layer 4), `valuation_prime_square` (Layer 0), `SchemeAndStackFoundations:SF.4`, `DerivedDeRhamCohomology:DD.0/cotangent-naive-comparison`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `DerivedDeRhamCohomology:DD.0/cotangent-localization-colimits`, `DerivedDeRhamCohomology:DD.0/smooth-cotangent`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`.

### 7.7 Perfect complexes on perfections satisfy arc-hyperdescent

Prove `perfect_arc_hyperdescent`. For p prime, X↦Perf(X^perf) on qcqs F_p-schemes is a hypercomplete arc-sheaf of symmetric monoidal stable infinity-categories. The same holds for every fixed Tor-amplitude stratum.

Reuse, rather than reprove, perfect-scheme v-hyperdescent and its bounded-stratum continuity. The prime-splitting map V→V_p×V/p is descendable because V is a finite homotopy limit of modules over this product. Use Tor-independence of tensor products of perfect F_p-algebras to identify the derived and ordinary Cech nerves; apply descendability and split the nerve. Recover the full category with a uniform Tor bound from level zero.

D_qc hyperdescent is not inferred; Tor-amplitude replaces cohomological amplitude here.

(BM21, Theorem 5.16, pp. 44–45.) (BS17, Lemma 3.16 p. 14; Theorem 11.2 p. 40 and Theorem 11.15 p. 43, with proof pp. 46–47.) *Needs:* `SchemeKTheoryOperations:S.4/perfect-v-hyperdescent`, `SchemeAndStackFoundations:SF.0/scheme-perfection`, `arc_descent_criterion` (Layer 4), `valuation_prime_square` (Layer 0), `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `EnhancedDerivedSheaves:E1/perfect-ring-tor`, `EnhancedDerivedSheaves:E5:abstract/descendable-algebras`, `EnhancedDerivedSheaves:E5:abstract/module-descent-and-functoriality`.

### 7.8 Canonical covers of perfect schemes

Prove `perfect_effective_epimorphisms`. For a qcqs algebraic space Y/F_p, the set-valued functor X↦Hom(X^perf,Y) is an arc-sheaf. A morphism of qcqs perfect F_p-schemes is an arc-cover if and only if it is a universally effective epimorphism in that category. The Hom functor is finitary when Y is finite type.

Use the algebraic-space Tannaka equivalence Hom(T,Y)=Fun^⊗_ex(Perf(Y),Perf(T)); its missing registered owner is recorded as a gap. Symmetric monoidal limits are computed on the underlying categories, yielding representable descent. For the converse reduce to an aic rank-one target and a product of valuation sources; failure of the necessary endpoint lift contradicts the equalizer condition for maps to perfect affine schemes.

The canonical-topology characterization concerns singleton qcqs maps, not a claim that its arbitrary families admit finite subcovers.

(BM21, Theorem 5.17 and Remark 5.18, pp. 45–46.) (BH16, Theorem 1.5, p. 2; conventions pp. 4–5.) *Needs:* `perfect_arc_hyperdescent` (Layer 7), `coherent_valuation_test` (Layer 5), `aic_valuation_detection` (Layer 3), `SchemeAndStackFoundations:SF.1`.

### Examples

With Λ=Z/4, the constant constructible sheaf Z/2 in degree zero belongs to Dᵇ_cons but has infinite Λ-Tor dimension. The alternating Z/4 resolution with maps multiplication by 2 witnesses its nonzero Tor in arbitrarily high degrees. For differentials, h-sheafification on k[ε]/ε² gives F₀=k, and on k[t] gives F₁=k[t]dt (BM21 §§5.2–5.3, pp. 40–44).

### Dependencies

`ArcTopologyAndDescent:AT.0`, `ArcTopologyAndDescent:AT.1`, `ArcTopologyAndDescent:AT.3`, `ArcTopologyAndDescent:AT.4`, `ArcTopologyAndDescent:AT.5`, `ArcTopologyAndDescent:AT.6`, `DerivedDeRhamCohomology:DD.0`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`, `EnhancedDerivedSheaves:E5:abstract`, `EtaleDualityAndPerverseSheaves:EDC.0`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`, `ArcTopologyAndDescent:AT.0/valuation-prime-square`, `SchemeKTheoryOperations:S.4`.

## Layer 8: Formal glueing and henselian rigidity

Formal glueing along finite ideals, its sheafified pushout and small-limit-valued form; full Gabber affine proper base change, rigidity and punctured completion comparison; open and support cohomology with bounded torsion and noetherian multi-ideal variants.

### 8.1 Formal glueing data

Define `FormalGlueingDatum`. A formal glueing datum is a ring map A→B and a finitely generated ideal I⊂A such that A/I^n→B/I^nB is an isomorphism for every n≥1. Its open pieces are U=Spec A minus V(I) and U_B=U×_A B. The completion map A→Â_I gives such a datum.

Package the ideal, quotient equivalences and their compatibility as a single datum. Use the finitely generated ideal completion theorem to identify all quotient rings.

The interface supports the following uses: State the sheaf-theoretic formal glueing square. (BM21 Theorems 6.4, 6.6). Use BM21 Theorem 6.4 inside the proof of the punctured tilting comparison; the formal-glueing statement is not CS24 Theorem 2.2.7 itself. (CS24 proof of Theorem 2.2.7).

- `FormalGlueingDatum.modPow`: Export each quotient isomorphism and compatibility with n→m.
- `FormalGlueingDatum.completion`: The I-adic completion map supplies the datum without a noetherian assumption.
- `FormalGlueingDatum.baseChange`: A→B base-changed along any A→C remains a formal datum for IC.
- `FormalGlueingDatum.openPullback`: U_B is the pullback of U and is qcqs because I is finitely generated.
- `FormalGlueingDatum.zero_iff`: For I=0 the datum is equivalent to A→B being a ring isomorphism.
- `FormalGlueingDatum.unit`: For I=A every map A→B is a datum, since every required quotient is the zero ring.

**Checks.**

- The identity map gives a datum for every finitely generated I.
- Z→Z_p with I=(p) has quotient Z/p^n on both sides; the open pieces are Spec Z[1/p] and Spec Q_p.
- A rank-two valuation completion may kill a nonzero height-one prime; being a datum does not imply that A→B is injective.
- For k[x,y], I=(x,y) gives D(x)∪D(y), which strictly contains D(x).

For I=(f₁,…,f_r), U is the union of D(f_i), not the intersection and not one chosen principal open.

(BM21, Definition 1.14 p. 6 and §6.1 pp. 47–48.) *Needs:* `mathlib:AdicCompletion`, `mathlib:IsAdicComplete`, `SchemeAndStackFoundations:SF.0`.

### 8.2 Degree-zero comparison for arbitrary henselian pairs

Prove `gabber_degree_zero`. For a henselian pair (A,I) and any étale sheaf of sets F on Spec A, F(A)→F(A/I) is bijective. For abelian sheaves this is the degree-zero part of affine proper base change.

For each point of Spec A, henselianity makes the intersection of its closure with Spec(A/I) connected and nonempty. Stacks Lemmas 59.82.3–4 then identify global sections for every Zariski sheaf. The same argument applies to every finite A-algebra because its induced pair is henselian. Lemma 59.82.2 passes these finite-level Zariski comparisons to arbitrary étale sheaves of sets, giving Lemma 59.82.6.

This is the global henselian-pair theorem; it is stronger than checking only a henselian-local base.

(STACKS, Stacks §59.82, Lemma 59.82.6 (09ZH), using Lemmas 59.82.2–4; HTML, no pages.) *Needs:* `SchemeAndStackFoundations:SF.0/henselian-pair-characterisations`, `SchemeAndStackFoundations:SF.0/henselian-finite-etale-equivalence`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`.

### 8.3 Gabber–Huber affine proper base change

Prove `gabber_affine_proper_base_change`. For every henselian pair (A,I) and every torsion abelian sheaf F on (Spec A)_et, RΓ(Spec A,F)→RΓ(Spec A/I,F|A/I) is an equivalence. No noetherian or local hypothesis on A is imposed, and I need not be finitely generated.

Use the finite-cover class-effacement and finite pushforward lemmas to efface positive-degree classes near the closed fibre. Apply the comparison/effacement argument for cohomological delta functors, with the degree-zero comparison as the base. Pass from bounded torsion pieces and finite presentations by étale continuity; the resulting derived map is an equivalence in all degrees.

BM21 §5.1 alone gives its special henselian-local-base situation; the full pair result used here is supplied by the Stacks proof.

(STACKS, Stacks Theorem 59.82.7 (09ZI), using Lemmas 59.82.4–6; HTML, no pages.) *Needs:* `gabber_degree_zero` (Layer 8), `SchemeAndStackFoundations:SF.0/henselian-pair-characterisations`, `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`.

### 8.4 Completion of rank-one valuation domains

Prove `rank_one_completion`. For a rank-one valuation domain V and nonzero nonunit t, the t-adic completion V̂ is again rank one and V→V̂ is a valuation extension. Completeness is independent of the chosen nonzero nonunit. If V is aic, V̂ is aic.

Realize rank one by a real-valued nonarchimedean absolute value and complete its fraction field. Identify the completion of the unit ball with V̂ and check locality and injectivity. Use preservation of algebraic closedness under completion for the aic assertion.

The statement excludes t=0 and units; the rank-two completion counterexample below prevents extrapolation.

(BM21, Proposition 6.2 p. 47; BS22 Remark 8.9 p. 68; CS24 proof of Lemma 2.2.3 p. 19.) *Needs:* `IsValuationExtension` (Layer 0), `IsAbsolutelyIntegrallyClosed` (Layer 0), `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`.

### 8.5 Completion and the open complement form an arc-cover

Prove `formal_cover`. For finitely generated I⊂A, Spec Â_I⊔(Spec A minus V(I))→Spec A is an arc-cover. There is a rank-two valuation domain V and principal I for which it is not a v-cover: choosing nonzero f in m minus the middle prime p makes p lie in every f^nV and hence in the completion kernel.

After faithfully flat completion of a rank-one test, its image ideal is either the unit ideal or is contained in the maximal ideal and the map extends to Â_I. For the negative example a faithful valuation extension cannot factor through the open or through a quotient killing p.

Finite generation is used to choose one pseudouniformizer controlling the image of all generators.

(BM21, Proposition 6.3 p. 47 and Example 6.8 pp. 49–50.) *Needs:* `FormalGlueingDatum` (Layer 8), `rank_one_completion` (Layer 8), `ArcCover` (Layer 2), `valuation_prime_square` (Layer 0).

### 8.6 Formal glueing for arc-sheaves

Prove `formal_glueing`. For a formal datum (A→B,I), every arc-sheaf F valued in an infinity-category with small limits satisfies F(A)≃F(B)×_{F(U_B)}F(U). Equivalently the square of sheafified representables is a pushout in both the ordinary and space-valued arc-topoi. The finitary cotruncated-compact version also follows directly from rank-one detection.

The pushout along U_B→Spec B is coherent because this is a quasi-compact open immersion. Test the map to h_SpecA^# on complete rank-one valuations. Outside V(I) it is already an isomorphism; in the remaining case the quotient identifications and completeness give a unique extension. Apply mapping-space Yoneda to obtain the small-limit-valued assertion.

The sheafified-pushout proof removes finitariness and target truncation conditions.

(BM21, Theorems 6.4, 6.6 and Corollary 6.7, pp. 48–49.) *Needs:* `FormalGlueingDatum` (Layer 8), `formal_cover` (Layer 8), `coherent_arc_topos` (Layer 5), `coherent_valuation_test` (Layer 5), `rank_one_detection` (Layer 4), `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`.

### 8.7 Rigidity on henselian pairs

Define `RigidFunctor`. A ring functor F on R-algebras is rigid if F(A)→F(A/J) is an equivalence for every henselian pair (A,J). Henselian pair is the imported global pair notion, not merely a henselian local ring.

Define rigidity with the supplier’s henselian-pair predicate and functorial quotient map. Keep the quantification over all R-algebras and all henselian ideals.

The interface supports the following uses: Compare punctured henselian spectra with their completions. (BM21 Corollary 6.10). Combine affine rigidity with proper base change. (CMM21 proof of Theorem 6.3).

- `IsRigid.quotientEquivalence`: Supply the specified equivalence for each henselian pair.
- `IsRigid.limits`: Pointwise limits of rigid functors are rigid.
- `IsRigid.natural`: The equivalence is natural for maps of henselian pairs.
- `IsRigid.iteratedQuotient`: Successive henselian quotients yield compatible composite equivalences.

**Checks.**

- Every constant functor is rigid.
- The finite étale category is rigid by SF.0/henselian-finite-etale-equivalence.
- The underlying ring functor is not rigid: Z_p→F_p is a henselian quotient and not a ring isomorphism.

There is no finite-generation assumption in the rigidity predicate.

(BM21, Definition 6.9, p. 50.) *Needs:* `SchemeAndStackFoundations:SF.0/henselian-pair-characterisations`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`.

### 8.8 Punctured completion for rigid arc-sheaves

Prove `punctured_rigidity`. Let (A,I) be henselian with I finitely generated and F:Sch_qcqs,A^op→D(Λ)^{≥0} a finitary arc-sheaf rigid on A-algebras. Then F(Spec A minus V(I))→F(Spec Â_I minus V(IÂ_I)) is an equivalence. In particular this holds for every torsion étale sheaf G on the punctured spectrum, after pullback to the completion.

Use the formal pullback and rigidity to compare the two whole affine terms through A/I. Equivalences in D(Λ) are local under pullback, which yields the punctured conclusion. Extend G by zero to Spec A and apply torsion arc-descent and full Gabber rigidity.

This argument does not establish the analogous category-valued finite étale comparison; use its separate approximation input.

(BM21, Corollary 6.10 and Theorem 6.11, p. 50.) *Needs:* `RigidFunctor` (Layer 8), `formal_glueing` (Layer 8), `gabber_affine_proper_base_change` (Layer 8), `torsion_arc_hyperdescent` (Layer 6), `SchemeAndStackFoundations:SF.2`.

### 8.9 Bounded-torsion and support refinements

Prove `open_henselian_completion`. If A is a-henselian with bounded a-power torsion, U is an open with D(a)⊂U⊂Spec A, and F is a torsion abelian étale sheaf on U, then RΓ(U,F)≃RΓ(U×_A Â_a,F). For every closed Z⊂Spec A/a and torsion F on Spec A, the analogous support complexes agree. For noetherian I-henselian A and arbitrary ideal I, the I-adic support comparison also holds.

Import the bounded-torsion henselian approximation for the open U, including the idempotent/finite étale comparison. Use the localization triangle with the whole affine Gabber comparison to obtain cohomology with supports. For noetherian A use finite generation of I and the multi-ideal approximation.

U need not equal D(a); the support Z can be any closed subset of the special fibre.

(CS24, Lemma 3.1.2 p. 30.) (BC22, Theorem 2.3.4 and Corollary 2.3.5(e), pp. 29–31.) *Needs:* `punctured_rigidity` (Layer 8), `gabber_affine_proper_base_change` (Layer 8), `SchemeAndStackFoundations:SF.2`, `PerfectoidSpaces:P3/henselian-finite-etale-approximation`, `PerfectoidSpaces:P3/etale-site-tilting-equivalence`, `PerfectoidSpaces:P3`.

### Examples

For I=(x,y) in k[x,y], the punctured spectrum is D(x)∪D(y). A formal glueing datum must keep this whole union. For Z→Z_p along (p), the generic open is Spec Z[1/p], and its pullback is Spec Q_p. Taking I=0 gives B=A; taking I=A makes both open pieces the whole spectrum, so the glueing square has identity horizontal maps (BM21 Definition 1.14, p. 6; Theorem 6.4, p. 48).

### Dependencies

`ArcTopologyAndDescent:AT.0`, `ArcTopologyAndDescent:AT.2`, `ArcTopologyAndDescent:AT.4`, `ArcTopologyAndDescent:AT.5`, `ArcTopologyAndDescent:AT.6`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`, `PerfectoidSpaces:P3`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`.

## Layer 9: The arc_t-topology and rigid generic fibres

Define arc_t-covers and arc_t-equivalences, prove finitary hyperdescent and invariance for torsion étale cohomology of completed generic fibres, compare covers with generic points of adic spectra, and prove proper rigid GAGA and total-integral-closure excision.

### 9.1 The arc_t-topology

Define `ArcTCover`. Fix t∈A. A map R→S of A-algebras is an arc_t-cover if every map R→V to a rank-one valuation domain where t is nonzero and noninvertible admits a lifting R→S→W after a valuation extension V→W of rank one. Finite families are tested by their product. It suffices to test complete aic V and permit complete aic W.

Use the same lifting and finite-family topology calculus as for arc-covers, restricting to pseudouniformizer tests. Complete and take aic extensions without losing rank one or the pseudouniformizer.

The interface supports the following uses: Prove completed-generic-fibre cohomological descent. (BM21 Corollary 6.17). Construct the prismatic étale comparison on arc_p-local objects. (BS22 Theorem 9.1).

- `ArcTCover.comp`: Arc_t-covers compose and are stable under base change of A-algebras.
- `ArcTCover.of_arcCover`: Every arc-cover is an arc_t-cover.
- `ArcTCover.completeAicTest`: Complete aic rank-one pseudouniformizer tests suffice.
- `ArcTCover.addBoundary`: If R→S is an arc_t-cover, then R→S×R/t×R[1/t] is an arc-cover.

**Checks.**

- The identity is a cover, including when the testing class is empty.
- R→R̂_t is an arc_t-cover.
- For R a rank-one valuation domain and t a nonzero nonunit, R→R[1/t] is not an arc_t-cover.
- If t is a unit in A, every map is an arc_t-cover, because there are no tests.

Tests where t=0 or t is a unit are excluded.

(BM21, Definition 6.14 p. 51 and Definition 6.19 p. 53.) *Needs:* `ArcCover` (Layer 2), `rank_one_completion` (Layer 8), `aic_extension_and_size` (Layer 0), `mathlib:CategoryTheory.GrothendieckTopology`.

### 9.2 Arc_t-covers on Tate pairs

Prove `adic_generic_point_cover`. For a morphism of Tate (Z((t)),Z[[t]])-algebras (A,A⁺)→(B,B⁺), A⁺→B⁺ is an arc_t-cover exactly when Spa(B,B⁺)→Spa(A,A⁺) is surjective on generic rank-one points, equivalently on the associated Berkovich spectra.

Identify generic points with rank-one t-continuous valuation maps on the plus ring up to faithful refinement. Translate lifts and refinements into the definition of arc_t-cover.

Surjectivity on all higher-rank adic points is a stronger assertion and is not substituted for generic-point surjectivity.

(BM21, Example 6.15, p. 51.) *Needs:* `ArcTCover` (Layer 9), `tauceti:TauCetiRoadmap/AdicSpaces#layer-1-valuation-spectra-and-continuous-valuations`, `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/completed-tensor-product-universal-property`, `AdicSpacesPartII:R0/completed-tensor-noetherian-stability`.

### 9.3 Arc_t-equivalences

Define `ArcTEquivalence`. A map f:R→R′ of A-algebras is an arc_t-equivalence when precomposition Hom_A(R′,V)→Hom_A(R,V) is bijective for every complete aic rank-one valuation domain V with t a pseudouniformizer.

Define the predicate using actual ring hom sets and the specified complete test class. Closure under composition follows from bijectivity; tensor-product base change follows from the universal property of the tensor product.

The interface supports the following uses: Prove invariance of E_t under transformations of models. (BM21 Proposition 6.21). Identify the shrinking-tube colimit with a closed fibre. (BM21 Proposition 7.7).

- `ArcTEquivalence.comp`: These equivalences compose and are stable under base change.
- `ArcTEquivalence.arcTCover`: An arc_t-equivalence is an arc_t-cover and its diagonal is also a cover.
- `ArcTEquivalence.killTorsion`: R→R/(t-power torsion) is an arc_t-equivalence.
- `ArcTEquivalence.completion`: R→R̂_t is an arc_t-equivalence.
- `ArcTEquivalence.integralClosure`: R→the integral closure of its image in R[1/t] is an arc_t-equivalence.

**Checks.**

- Every identity is an equivalence.
- Z_p[x]/(px)→Z_p kills p-power torsion and is an arc_p-equivalence.
- An algebraically closed field admitting t as nonzero scalar is not itself a test object: t must be a nonunit.
- V→V[1/t] fails the test on V for a complete aic rank-one V with pseudouniformizer t.

The direction of precomposition is from R′-maps to R-maps.

(BM21, Definition 6.19 and Example 6.20, p. 53.) *Needs:* `ArcTCover` (Layer 9), `IsAbsolutelyIntegrallyClosed` (Layer 0), `rank_one_completion` (Layer 8).

### 9.4 Cohomology of the completed generic fibre

Construct `GenericFibreCohomology`. Fix a torsion abelian sheaf G on Spec A and t∈A. Define E_t(R)=RΓ((Spec R̂_t[1/t])_et,G) in D(Z)^{≥0} for A-algebras R. Punctured henselian comparison identifies this with the same expression using t-henselization, hence E_t commutes with filtered colimits.

Pull G back from A to the completed localized algebra. Use Fujiwara–Gabber and filtered-colimit compatibility of henselization and étale cohomology.

The interface supports the following uses: Supply the algebraic functor in the generic-fibre Künneth formula. (BM21 Proposition 6.22). Use descent for RΓ(Spec S[1/p],Z/p^n) on p-complete S. (GR24 Theorem 6.1).

- `genericEtale.henselianComparison`: Replace R̂_t[1/t] by R^h_t[1/t] for this cohomology functor.
- `genericEtale.filteredColimit`: The canonical colimit comparison is an equivalence.
- `genericEtale.killBoundary`: E_t(R/t)=0 and E_t(R[1/t])=0.
- `genericEtale.naturality`: A-algebra maps induce pullback maps compatible with the henselian comparison.

**Checks.**

- For complete aic rank-one V with t pseudouniformizer and constant Λ, E_t(V)=Λ in degree zero.
- If t=0 in R, E_t(R)=0.
- If t is invertible in R, the t-adic completion is zero and E_t(R)=0.
- For an A-field K with t invertible, E_t(K)=0, even though RΓ(Spec K,Λ) may be nonzero.

Finitariness is not justified by commuting naive completion with filtered colimits.

(BM21, Construction 6.16 and Corollary 6.17, pp. 51–52.) *Needs:* `punctured_rigidity` (Layer 8), `SchemeAndStackFoundations:SF.2`, `mathlib:AdicCompletion`, `Finitary` (Layer 3).

### 9.5 Arc_t-hyperdescent of the completed generic fibre

Prove `generic_fibre_arc_t_hyperdescent`. The functor E_t is a finitary hypercomplete arc_t-sheaf. In particular, for a hypercover by t-complete A-algebras R→S•, RΓ(Spec R[1/t],G)≃lim RΓ(Spec S•[1/t],G).

Use the formal square and Gabber to express E_t through three functors already known to satisfy arc-descent. Adjoin R/t and R[1/t] to an arc_t-cover to make an arc-cover; E_t kills both added terms. Use uniform cohomological boundedness below for hyperdescent.

The rings in a formal hypercover are completed where required; the first assertion itself is on all A-algebras.

(BM21, Corollary 6.17, pp. 51–52.) *Needs:* `GenericFibreCohomology` (Layer 9), `ArcTCover` (Layer 9), `torsion_arc_hyperdescent` (Layer 6), `formal_glueing` (Layer 8), `gabber_affine_proper_base_change` (Layer 8), `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`.

### 9.6 Proper rigid GAGA for torsion étale cohomology

Prove `proper_rigid_gaga`. Let (A,(t)) be henselian. Assume A is noetherian or Â_t[1/t] is strongly noetherian Tate. For X proper over A[1/t] and torsion étale F on X, the comparison RΓ(X,F)→RΓ(X^ad,F^ad) is an equivalence, with analytification over the completed Tate generic fibre.

Extend X to a proper A-model by Nagata compactification and extend the torsion sheaf. Use affine algebraic/analytic comparison on a finite open cover to identify the formal-glueing square of étale topoi. Proper base change identifies whole-model cohomology with completed-model cohomology and yields the generic-fibre comparison.

The analytic comparison is an explicit supplier input under the stated noetherian/strong-noetherian assumptions.

(BM21, Corollary 6.18, p. 52.) (HUB96, Corollary 3.2.2 p. 174; Theorems 3.2.9–3.2.10 pp. 180–181.) *Needs:* `formal_glueing` (Layer 8), `punctured_rigidity` (Layer 8), `AdicEtaleGeometry:A1`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.4`, `adic_generic_point_cover` (Layer 9).

### 9.7 Total integral closure in a principal localization

Construct `TotalIntegralClosure`. For t a nonzerodivisor of A, let A^tic be the subring of A[1/t] consisting of x for which there exists c≥0 with t^c x^n∈A for every n≥0. This contains the integral closure of A; it equals it when A is noetherian. The map A→A^tic is an arc_t-equivalence.

Check closure under sum and product using the uniform denominator bound and binomial expansions. In the noetherian case use finite generation of the module generated by all powers of x. A rank-one valuation with nonzero t admits no negative-valuation element whose powers have a uniform t-denominator bound.

The interface supports the following uses: State excision for two models with the same total integral closure. (BM21 Theorem 6.25).

- `totalIntegralClosure.mem_iff`: Membership is exactly the single uniform denominator condition.
- `totalIntegralClosure.containsIntegralClosure`: An integral element has bounded denominators in all powers.
- `totalIntegralClosure.noetherian`: For noetherian A, total integral closure agrees with ordinary integral closure in A[1/t].
- `totalIntegralClosure.arcTEquivalence`: Restriction on complete aic rank-one t-tests is bijective.

**Checks.**

- A rank-one valuation domain V with t pseudouniformizer is totally integrally closed in Frac V.
- For a domain A and nonzero nonunit t, t^−1 is not totally integral over A: a uniform bound would make some negative power of t integral as an element of A, hence t a unit.
- In Z_p, each p^−n has a denominator bound depending on n, but p^−1 has no uniform bound for all its powers.
- If t is a unit, the localization and total integral closure both equal A.

The bound c is uniform in n; allowing c to depend on n would give the entire localization.

(BM21, Example 6.20(4), p. 53.) *Needs:* `ArcTEquivalence` (Layer 9), `SchemeAndStackFoundations:SF.0`.

### 9.8 Invariance under arc_t-equivalences

Prove `arc_t_invariance`. Every E_t sends an arc_t-equivalence R→R′ to an equivalence. In particular it is invariant under removal of t-power torsion, completion, integral closure and, for t-torsion-free input, total integral closure.

Apply descent to R→R′. Use the uniqueness of maps to test valuations to see that the diagonal R′⊗_R R′→R′ and its iterates are covers and become equivalences after descent. Collapse the Cech nerve.

An arbitrary arc_t-cover need not induce an equivalence.

(BM21, Proposition 6.21, p. 53.) *Needs:* `generic_fibre_arc_t_hyperdescent` (Layer 9), `ArcTEquivalence` (Layer 9), `TotalIntegralClosure` (Layer 9).

### 9.9 Universal homeomorphism invariance

Prove `universal_homeomorphism_invariance`. Every small-limit-valued v-sheaf on qcqs schemes sends universal homeomorphisms to equivalences.

A universal homeomorphism and its diagonal are v-covers. Use descent twice; the diagonal immersion makes the second Cech diagram constant, collapsing the first.

This includes purely inseparable extensions and nilimmersions.

(BM21, Proposition 6.24, p. 54.) *Needs:* `v_cover_geometry` (Layer 1), `UniversalDescent` (Layer 1), `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`.

### 9.10 Excision for models with common total integral closure

Prove `total_integral_closure_excision`. Let A→B carry a nonzerodivisor t of A to a nonzerodivisor of B and induce A^tic≃B^tic. For every small-limit-valued arc-sheaf F, the square F(A)→F(A/t), F(B)→F(B/t) is cartesian. In particular this applies to integral maps of t-torsion-free rings inducing an isomorphism after inverting t.

Factor through A′=B×_(B/t) A/t; the second square is Milnor. Show A→A′ integral using the uniform denominator bound on powers of elements of B. On the generic fibre it is an isomorphism; on the special fibre A′/tA′→A′/tB has nil kernel, sufficient for a universal homeomorphism. Apply v-invariance and Milnor excision.

Only elementwise nilpotence of the special-fibre kernel is needed; do not assert a uniform nilpotence exponent in arbitrary nonnoetherian rings.

(BM21, Theorem 6.25, pp. 54–55.) *Needs:* `TotalIntegralClosure` (Layer 9), `milnor_sheafified_pushout` (Layer 5), `universal_homeomorphism_invariance` (Layer 9), `SchemeAndStackFoundations:SF.0`.

### Examples

For a complete aic rank-one V with t a pseudouniformizer, E_t(V,Λ)=Λ in degree zero. If t=0, localization by t gives the zero ring; if t is a unit, t-adic completion gives the zero ring. Both cases yield E_t=0. This accounts for the two boundary factors R/t and R[1/t] in the cover comparison (BM21 Corollary 6.17 and Example 6.20, pp. 52–53).

### Dependencies

`AdicEtaleGeometry:A1`, `AdicSpacesPartII:R0`, `ArcTopologyAndDescent:AT.0`, `ArcTopologyAndDescent:AT.1`, `ArcTopologyAndDescent:AT.2`, `ArcTopologyAndDescent:AT.3`, `ArcTopologyAndDescent:AT.5`, `ArcTopologyAndDescent:AT.6`, `ArcTopologyAndDescent:AT.8`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `ArcTopologyAndDescent:AT.0/valuation-prime-square`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-1-valuation-spectra-and-continuous-valuations`.

## Layer 10: Künneth and affinoid vanishing

Prove generic-fibre and affinoid Künneth for coefficients of residue-invertible prime order, rational Mayer–Vietoris, shrinking-tube continuity and rational-domain vanishing. Deduce the d+1 bound for arbitrary torsion and the d bound for residue-prime-to-characteristic torsion on a d-dimensional affinoid over a complete algebraically closed nonarchimedean field with nontrivial valuation.

### 10.1 Vanishing on finite étale rational domains

Prove `rational_domain_vanishing`. Fix a complete algebraically closed nonarchimedean field K with nontrivial valuation. Fix a complete algebraically closed nonarchimedean field K with nontrivial valuation. Let f₁,…,f_m,g generate the unit ideal of the n-variable Tate algebra T_n over K. If A is finite étale over T_n⟨f₁/g,…,f_m/g⟩, then for every constant torsion abelian group Λ, H^q(Spec A,Λ)=0 for q>n.

Use a positive uniform lower bound for max(|f₁|,…,|f_m|,|g|), approximate by polynomials, and include a power of π among the numerators. The algebraic model R₀ has generic fibre K[X₁,…,X_n,1/g] and bounded π-power torsion; descend A through henselization using the imported finite étale approximation. Apply Fujiwara–Gabber and express the descended algebra as a filtered colimit of n-dimensional finite-type K-algebras. Use affine Artin–Grothendieck vanishing, including its characteristic-primary Artin–Schreier case.

The regression pair (X,1) at X=0 makes min zero although the ideal is the unit ideal; max is the correct bound.

(BM21, Lemma 7.8, pp. 58–59, with the reviewed max/min repair.) *Needs:* `PerfectoidSpaces:P3/henselian-finite-etale-approximation`, `PerfectoidSpaces:P3`, `punctured_rigidity` (Layer 8), `EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`, `SchemeAndStackFoundations:SF.2`, `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/completed-tensor-product-universal-property`, `AdicSpacesPartII:R0/completed-tensor-noetherian-stability`.

### 10.2 Rational Mayer–Vietoris

Prove `rational_mayer_vietoris`. Fix a complete algebraically closed nonarchimedean field K with nontrivial valuation. Fix a complete algebraically closed nonarchimedean field K with nontrivial valuation. For A topologically finite type over K, f,g∈A generating the unit ideal and any torsion étale sheaf F, the rational localizations A⟨f/g⟩, A⟨g/f⟩ and A⟨f/g,g/f⟩ give the corresponding homotopy-pullback square of algebraic étale cohomology.

Choose a common bounded model A₀ with f,g generating an open ideal. Use the arc_π-cover A₀→A₀[T]/(fT−g)×A₀[U]/(gU−f). The two self-intersection multiplications are arc_π-equivalences, reducing Cech descent to the four-term square.

The unit-ideal condition is on A, while the rescaled model generators need only generate an open ideal.

(BM21, Proposition 7.6, pp. 57–58.) *Needs:* `generic_fibre_arc_t_hyperdescent` (Layer 9), `arc_t_invariance` (Layer 9), `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/completed-tensor-product-universal-property`, `AdicSpacesPartII:R0/completed-tensor-noetherian-stability`.

### 10.3 Cohomology of shrinking rational tubes

Prove `shrinking_tube_continuity`. Fix a complete algebraically closed nonarchimedean field K with nontrivial valuation. Fix a nonzero topologically nilpotent π∈K. Fix a complete algebraically closed nonarchimedean field K with nontrivial valuation. Fix a nonzero topologically nilpotent π∈K. For R topologically finite type over K, f∈R and torsion étale F on Spec R, colim_r RΓ(Spec R⟨f/π^r⟩,F)≃RΓ(Spec R/f,F).

Rescale f into a bounded integral model R₀. Use S_r=R₀[U_r]/(π^rU_r−f), with U_r↦πU_(r+1). Every map colim S_r→a complete rank-one π-test kills f and U_r by π-adic separatedness; thus colim S_r→R₀/f is an arc_π-equivalence. Apply finitariness and invariance of E_π.

The shrinking direction is r increasing, so the bound |f|≤|π|^r tends to zero.

(BM21, Proposition 7.7, p. 58.) *Needs:* `GenericFibreCohomology` (Layer 9), `arc_t_invariance` (Layer 9), `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/completed-tensor-product-universal-property`, `AdicSpacesPartII:R0/completed-tensor-noetherian-stability`.

### 10.4 Prime-to-residue-characteristic valuation base change

Prove `valuation_cohomology_base_change`. Let V→W be a faithfully flat map of valuation domains with separably closed fraction fields. For every V-scheme X and torsion étale sheaf F of orders invertible on X, RΓ(X,F)≃RΓ(X×_V W,F), and the derived unit F→Rp_*p^*F is an equivalence.

Reduce to finite rank by continuity. Induct on valuation rank using the closed/open support triangles and valuation base change with supports; for rank zero use separably closed field base change.

The invertibility hypothesis on torsion is retained. This is a separate input from the ordinary field Künneth theorem.

(HUB96, Corollary 4.2.7, printed pp. 244–245.) *Needs:* `IsValuationExtension` (Layer 0), `SchemeAndStackFoundations:SF.2`.

### 10.5 Künneth over an aic rank-one valuation

Prove `generic_fibre_kunneth`. Let V be aic rank one, π a pseudouniformizer and ℓ a prime invertible in its residue field. The functor E_π(−,F_ℓ) on V-algebras is symmetric monoidal: E_π(R)⊗_(F_ℓ)E_π(R′)≃E_π(R⊗_V R′).

Reduce each variable separately to aic rank-one valuation tests; use finite totalizations in each bounded cohomological range to justify tensor/descent interchange. In the nondegenerate pseudouniformizer case each factor has cohomology F_ℓ. Use the formal square for R⊗_V R′: ordinary field Künneth computes generic and special corners, while valuation base change computes the whole affine corner.

Invertibility only in the fraction field is insufficient in mixed characteristic; residue-characteristic p coefficients are excluded.

(BM21, Proposition 6.22 and Remark 6.23, pp. 53–54.) *Needs:* `generic_fibre_arc_t_hyperdescent` (Layer 9), `rank_one_detection` (Layer 4), `formal_glueing` (Layer 8), `valuation_cohomology_base_change` (Layer 10), `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`.

### 10.6 Künneth for affinoid algebras

Prove `affinoid_kunneth`. Let K be complete algebraically closed nonarchimedean with nontrivial valuation, and ℓ prime to its residue characteristic. For topologically finite-type K-algebras A,B, RΓ(Spec A,F_ℓ)⊗RΓ(Spec B,F_ℓ)≃RΓ(Spec(A completed-tensor_K B),F_ℓ).

Choose open bounded integral models and identify completed tensor products through completion of their ordinary tensor product. Apply the generic-fibre Künneth formula over O_K.

The analytic completed tensor product is owned by the Huber-algebra supplier.

(BM21, Proposition 7.5, p. 57.) *Needs:* `generic_fibre_kunneth` (Layer 10), `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/completed-tensor-product-universal-property`, `AdicSpacesPartII:R0/completed-tensor-noetherian-stability`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`.

### 10.7 Constant-coefficient affinoid vanishing

Prove `constant_affinoid_vanishing`. Fix a complete algebraically closed nonarchimedean field K with nontrivial valuation. Fix a complete algebraically closed nonarchimedean field K with nontrivial valuation. For a d-dimensional topologically finite-type K-algebra A, constant torsion coefficients have no cohomology above d+1. For ℓ-power torsion with ℓ prime to the residue characteristic, they have no cohomology above d.

Induct on d using analytic Noether normalization; after a Frobenius twist and reduction in characteristic p, choose f so that A[1/f] is finite étale over a localized Tate algebra. Apply rational Mayer–Vietoris for the large and small tubes; the finite étale corners have the rational-domain bound and the shrinking-tube colimit reduces dimension. For F_ℓ, a nonzero H^(d+1) yields nonzero H^(2d+2) on A completed-tensor A by Künneth. Apply imported Noether normalisation to both factors: the completed tensor is finite over a Tate algebra in 2d variables, so its dimension is at most 2d by the imported Tate dimension and finite-algebra results. The already proved general bound gives vanishing above 2d+1, a contradiction. Use torsion filtrations to pass from prime-order to arbitrary constant coefficients.

Analytic Noether normalisation and Tate dimension are exact imported nodes. The proof derives the needed upper bound dim(A completed-tensor A)≤2d by finiteness; it does not assume an unrecorded dimension equality.

(BM21, Proposition 7.9, pp. 59–60.) *Needs:* `rational_domain_vanishing` (Layer 10), `rational_mayer_vietoris` (Layer 10), `shrinking_tube_continuity` (Layer 10), `affinoid_kunneth` (Layer 10), `universal_homeomorphism_invariance` (Layer 9), `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/completed-tensor-product-universal-property`, `AdicSpacesPartII:R0/completed-tensor-noetherian-stability`, `SchemeAndStackFoundations:SF.4`, `AdicSpacesPartII:R0/affinoid-noether-normalisation`, `AdicSpacesPartII:R1/affinoid-domain-equidimensional`, `AdicSpacesPartII:R0/finite-algebra-over-affinoid`.

### 10.8 Artin–Grothendieck vanishing for affinoids

Prove `affinoid_artin_grothendieck`. For K complete algebraically closed nonarchimedean with nontrivial valuation and A topologically finite type of dimension d, every torsion abelian étale sheaf F on Spec A has H^q=0 for q>d+1. If F is ℓ-power torsion for a prime ℓ different from the residue characteristic, H^q=0 for q>d.

Reduce by filtered-colimit continuity to constructible prime-torsion sheaves. Choose a dense open where the sheaf is lisse; the complementary support has smaller dimension. Use a finite étale cover of degree prime to ℓ making the local system an iterated extension of constants, apply trace, and compactify the cover by Zariski main theorem. Reduce to constant cohomology on finite A-algebras and the lower-dimensional induction.

The introduction’s stronger all-torsion smooth expectation is not used: the proved mixed-characteristic bound retained here is d+1.

(BM21, Theorem 7.3 and proof, pp. 56–57, 60–61.) *Needs:* `constant_affinoid_vanishing` (Layer 10), `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.4`, `EtaleDualityAndPerverseSheaves:EDC.0`.

### Examples

The unit-ideal generators (X,1) in K⟨X⟩ have max(|X|,1)≥1 everywhere but min(|X|,1)=0 at X=0. The rational-domain proof must use max. In dimension zero an affinoid over algebraically closed K is a finite product of artinian local K-algebras, so its étale cohomology agrees with that of finitely many algebraically closed residue fields; there is no higher cohomology (BM21 Lemma 7.8 and Proposition 7.9, pp. 58–60).

### Dependencies

`AdicSpacesPartII:R0`, `AdicSpacesPartII:R1`, `ArcTopologyAndDescent:AT.0`, `ArcTopologyAndDescent:AT.4`, `ArcTopologyAndDescent:AT.8`, `ArcTopologyAndDescent:AT.9`, `EnhancedDerivedSheaves:E1`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.4`, `PerfectoidSpaces:P3`, `SchemeAndStackFoundations:SF.2`, `ArcTopologyAndDescent:AT.0/valuation-prime-square`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`.

## Layer 11: I-complete arc-covers and formal schemes

Define I-complete arc-covers, their complete aic valuation tests and products-of-valuations basis. Prove étale hyperdescent on completed and punctured spectra for finitely generated ideals, compare with henselizations and construct the p-adic formal arc-site with its affine comparison.

### 11.1 I-complete arc-covers

Define `ICompleteArcCover`. Fix a finitely generated ideal I in A. A map R→S of A-algebras is an I-complete arc-cover if every R→V with V an I-adically complete valuation domain of rank at most one lifts through S after a valuation extension V→W, with W also complete of rank at most one. One can require V,W aic without changing the predicate.

Use the image ideal IV and completeness as properties of the actual test ring. An arbitrary lifting valuation can first be replaced by its rank-one interval and then by an aic completion. Check composition and base change and use finite product maps to define covering families.

The interface supports the following uses: State completed and henselian étale hyperdescent. (CS24 Theorem 2.2.5). Specify the topology for integral perfectoid and A_inf hyperdescent. (CS24 Lemma 4.2.6).

- `CompleteArcCover.zeroIdeal`: The 0-complete predicate is exactly ordinary arc-cover.
- `CompleteArcCover.monoIdeal`: For I⊆J, an I-complete arc-cover is a J-complete arc-cover.
- `CompleteArcCover.modIdeal`: Reduction modulo I of an I-complete arc-cover is an ordinary arc-cover.
- `CompleteArcCover.baseChange`: The predicate is stable under base change and composition.
- `CompleteArcCover.flatModPowers`: Faithful flatness modulo every I^n implies I-complete arc-cover.

**Checks.**

- With I=0, every valuation test is complete and the ordinary arc predicate is recovered.
- With I=A, there are no nontrivial complete valuation tests, so every map satisfies the predicate.
- R→R̂_I satisfies the lifting test by the universal property of completion.
- For R=Z_p and I=(p), R→Q_p fails because the complete test Z_p cannot lift through p-inversion.

Rank restriction remains on V throughout; only the initially chosen W may have unrestricted rank before reduction.

(CS24, CS24 §2.2.1 pp. 18–19.) *Needs:* `ArcCover` (Layer 2), `rank_one_completion` (Layer 8), `aic_extension_and_size` (Layer 0), `mathlib:IsAdicComplete`.

### 11.2 Products of complete aic valuation tests

Prove `complete_valuation_product_basis`. Every A-algebra R admits an I-complete arc-cover R→∏_i V_i with each V_i an I-complete aic valuation domain of rank at most one. The product is I-complete. Any quasi-compact open of the spectrum of a product of aic valuations has no nonsplit étale covers; its connected components are the corresponding ultraproduct valuation spectra, possibly of higher rank.

Choose a set of representatives of all bounded complete valuation tests and take their product. For finite I the image in each valuation is principal; complete the factors for the I-adic topology and use finitely many generators to compare quotient products. Use the ultraproduct component calculation and strict henselianity, then the splitting of finite covers of the resulting spectral space.

Fields with I=0 remain legitimate factors. The factors being rank at most one says nothing of that bound for nonprincipal ultraproduct components.

(CS24, CS24 Lemmas 2.2.3–2.2.4 pp. 19–20 (principal case); §2.2.1 for finite I.) *Needs:* `ICompleteArcCover` (Layer 11), `product_components` (Layer 3), `strict_henselian_tests` (Layer 6), `aic_extension_and_size` (Layer 0).

### 11.3 The arc-site of p-adic formal schemes

Construct `FormalArcSite`. On p-adic formal schemes generate a topology by open covers and maps Y→X of qcqs objects lifting maps Spf V→X after faithful extensions V→W of p-complete rank-one valuation domains. On affines Spf S→Spf R this agrees with the (p)-complete arc topology of rings. The exact-rank-one and rank-at-most-one conventions give the same topology here.

Use the supplier’s p-adic formal scheme and continuous affine-map interfaces. For affine objects translate continuous maps into the complete valuation test. To account for rank-zero tests with p=0, extend the field to an aic rank-one characteristic-p valuation domain; this remains p-complete.

The interface supports the following uses: Construct a perfectoid basis. (BS22 Lemma 8.8). State the restricted structure-sheaf theorem. (BS22 Proposition 8.10).

- `formalArc.affineCover_iff`: For p-complete rings, affine formal covers are precisely p-complete arc-covers.
- `formalArc.openCover`: Zariski open covers are covers.
- `formalArc.rankZeroComparison`: Allowing rank-zero complete valuation tests does not change the generated topology.
- `formalArc.affineBasis`: Quasi-compact affine opens form a basis for the formal site.

**Checks.**

- For p=0 rings the affine predicate agrees with ordinary arc-cover.
- Spf F_p→Spf F_p[ε]/ε² is a cover, so the full structure presheaf is not a sheaf.
- The pseudouniformizer-only tests would see no characteristic-p rings and thus do not define this topology.

This formal arc-site and the arc_p topology of pseudouniformizer tests are distinct definitions; the latter excludes p=0.

(BS22, Definition 8.7, p. 67.) *Needs:* `ICompleteArcCover` (Layer 11), `SchemeAndStackFoundations:SF.0`, `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/completed-tensor-product-universal-property`, `AdicSpacesPartII:R0/completed-tensor-noetherian-stability`, `mathlib:CategoryTheory.GrothendieckTopology`.

### 11.4 From complete covers to punctured arc_I-covers

Prove `ideal_punctured_cover_comparison`. For I=(f₁,…,f_r), test arc_I-covers on rank-at-most-one valuation domains with IV a nonzero proper ideal. A map R→S is an arc_I-cover exactly when R→S×R/I×∏_j R[1/f_j] is an arc-cover. Every I-complete arc-cover is an arc_I-cover, by completing the nonzero proper valuation test.

Separate valuation tests into IV=0, IV=V and the nonzero proper case. Use finite generation to pick one nonzero generator controlling the last case and apply rank-one completion.

This comparison retains every principal open D(f_j); replacing their union by a single open is invalid.

(MAT22, MAT22 Definition 5.17 and Remark 5.18, p. 20; CS24 proof of Theorem 2.2.5 p. 20.) *Needs:* `ICompleteArcCover` (Layer 11), `rank_one_completion` (Layer 8), `ArcCover` (Layer 2).

### 11.5 Completed and punctured étale hyperdescent

Prove `complete_etale_hyperdescent`. For torsion F on Spec A and finite I, each of R↦RΓ(Spec R̂_I,F), R↦RΓ(Spec R^h_I,F), R↦RΓ(Spec R̂_I minus V(I),F) and R↦RΓ(Spec R^h_I minus V(I),F) is a hypercomplete I-complete arc-sheaf. Ordinary R↦RΓ(Spec R,F) is the arc-hypersheaf already supplied by AT.6.

For whole completions and henselizations use Gabber to identify values with R/I and reduction of covers modulo I. For punctured spectra apply the arc_I comparison and formal glueing, extending the principal arc_t proof to the finite union of principal opens. Use punctured henselian comparison and uniform nonnegative cohomological degrees for hyperdescent.

Naive completion need not commute with filtered colimits; no such claim is used.

(CS24, CS24 Theorem 2.2.5 and Remark 2.2.6, pp. 20–21.) *Needs:* `ICompleteArcCover` (Layer 11), `ideal_punctured_cover_comparison` (Layer 11), `punctured_rigidity` (Layer 8), `gabber_affine_proper_base_change` (Layer 8), `torsion_arc_hyperdescent` (Layer 6), `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`.

### Examples

For I=0, every rank-at-most-one valuation is complete and the complete topology is ordinary arc. For I=A, a separated I-complete nonzero valuation ring does not exist, so every map passes the empty test class. For (A,I)=(Z_p,(p)), Z_p→Q_p fails on the complete test Z_p. A characteristic-p valuation remains a genuine p-complete test because p=0 there (CS24 §2.2.1, pp. 18–19).

### Dependencies

`AdicSpacesPartII:R0`, `ArcTopologyAndDescent:AT.0`, `ArcTopologyAndDescent:AT.2`, `ArcTopologyAndDescent:AT.3`, `ArcTopologyAndDescent:AT.6`, `ArcTopologyAndDescent:AT.8`, `EnhancedDerivedSheaves:E2`, `SchemeAndStackFoundations:SF.0`.

## Layer 12: Perfectoid bases and integral hyperdescent

Prove the perfectoid basis for the formal arc-site, structure-sheaf descent and acyclicity on perfectoids, representable formal-scheme descent on that basis, tilting invariance of complete arc-covers and p-complete hyperdescent for A, A-flat and A_inf. Export the precise completed-generic-fibre and proper-henselian comparisons needed by the routed consumers.

### 12.1 A perfectoid basis of the formal arc-site

Prove `perfectoid_formal_basis`. Every p-adic formal scheme has a cover by formal spectra of integral perfectoid rings. For p-complete R one can take R→∏ V_i with V_i p-complete aic valuation domains of rank one; their product is integral perfectoid. Rank-zero factors in the rank-at-most-one convention may instead be retained.

Import the perfectoidness of complete aic valuation rings in mixed characteristic and perfect characteristic-p valuation rings. Use the valuation-product cover and the existing small-product theorem for integral perfectoids. Check the topology induced on Perfd by formal arc-covers and its basis comparison.

The product is perfectoid, but is not asserted to have only rank-one connected components.

(BS22, Lemmas 8.8 and Remark 8.9, pp. 67–68; CS24 Lemma 2.2.3 p. 19.) *Needs:* `FormalArcSite` (Layer 11), `complete_valuation_product_basis` (Layer 11), `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion`, `PerfectoidQuotients:Q0:integral-algebra/products-of-perfectoid-rings`, `PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid`, `PrismaticCohomology:PR.0/ainf-prism`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`.

### 12.2 Completed-generic-fibre consumers

Prove `perfectoid_generic_fibre_consumers`. For p-complete perfectoid A, constant Z/p^n cohomology of Spec A[1/p] agrees with that of Spa(A[1/p],A); under the tilting étale-site equivalence it agrees with the corresponding tilt generic-fibre cohomology. Products of complete aic valuation tests make these cohomologies locally degree zero. The arc_p hyperdescent comparison is the interface used in the BS22 Theorem 9.1 and GR24 Theorem 6.1 proofs.

Import the affinoid algebraic/adic étale-cohomology comparison for the perfectoid Tate generic fibre and the perfectoid étale-site tilting theorem. For a product valuation basis, descend finite presentations of finite covers from the punctured spectrum to the integral product; each such cover splits. This kills higher cohomology. Apply the already established arc_p-hyperdescent; the prismatic Frobenius-fixed comparison itself stays in its prismatic owner.

The coefficient is constant Z/p^n here; no blanket equivalence between the scheme and adic étale sites is claimed.

(BS22, Proof of Theorem 9.1, pp. 71–73.) (GR24, Proof of Theorem 6.1, pp. 55–56.) (HUB96, Corollary 3.2.2, p. 174.) *Needs:* `generic_fibre_arc_t_hyperdescent` (Layer 9), `perfectoid_formal_basis` (Layer 12), `complete_valuation_product_basis` (Layer 11), `PerfectoidSpaces:P3/henselian-finite-etale-approximation`, `PerfectoidSpaces:P3/etale-site-tilting-equivalence`, `AdicEtaleGeometry:A1`, `PerfectoidSpaces:P1/tilt-of-perfectoid-field`, `PerfectoidSpaces:P1/continuous-valuations-under-tilting`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`.

### 12.3 Perfectoid structure-sheaf descent and acyclicity

Prove `perfectoid_structure_descent`. On the full subsite Perfd of p-adic formal spectra locally integral perfectoid, the presheaf O is an arc-sheaf and H^q_arc(Spf R,O)=0 for q>0 and integral perfectoid R. Its Cech comparisons use the completed fibre products appropriate to this subsite.

For perfect F_p-algebras obtain the exact arc Cech complex from endomorphisms of the unit in symmetric monoidal Perf arc-descent. Tilt the cover, adjoin the complement of the distinguished ideal to get an ordinary scheme arc-cover, and apply derived completion to remove that complement. Pass through finite Witt-vector towers and their limit, then quotient by the distinguished nonzerodivisor to recover R; use the perfectoid completeness hypotheses to identify the derived and ordinary terms.

Nilpotent nonperfectoid rings show why this assertion is restricted to Perfd.

(BS22, Proposition 8.10, pp. 67–68.) *Needs:* `perfectoid_formal_basis` (Layer 12), `perfect_arc_hyperdescent` (Layer 7), `PerfectoidSpaces:P1/tilt-of-perfectoid-field`, `PerfectoidSpaces:P1/continuous-valuations-under-tilting`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion`, `PerfectoidQuotients:Q0:integral-algebra/products-of-perfectoid-rings`, `PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid`, `PrismaticCohomology:PR.0/ainf-prism`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`.

### 12.4 Maps to formal schemes descend on perfectoids

Prove `formal_target_representable_descent`. For every p-adic formal scheme T, the set-valued functor X↦Hom(X,T) restricted to Perfd is an arc-sheaf. There is no qcqs assumption on T.

For affine T use structure-sheaf descent and continuity of the ring map. Reduce the topological factorization problem modulo p to perfect schemes. Locally reduce the target to qcqs and approximate it by finite-type F_p-schemes. At finite type arc-covers are h-covers and topological quotient maps; descend the continuous map and glue the affine maps.

This proof is independent of the algebraic-space Perf-Tannaka gap in AT.7.

(BS22, Second assertion of Proposition 8.10 and its proof, pp. 67–68.) *Needs:* `perfectoid_structure_descent` (Layer 12), `FormalArcSite` (Layer 11), `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.0/scheme-perfection`, `arc_v_comparison` (Layer 2).

### 12.5 Proper henselian torsion comparison

Prove `proper_henselian_consumer`. Let (A,I) be a henselian pair, X proper over Spec A and F a torsion abelian étale sheaf on X. Then RΓ(X,F)≃RΓ(X×_A A/I,F|). For I=(p), this is the reduction used in the proof of CMM21 Theorem 6.3.

Apply enhanced proper base change to Rf_*F at the closed fibre. Use the affine henselian-pair theorem on its cohomology sheaves and the bounded-below spectral-sequence or truncation argument.

The output is this cohomological comparison, not the K-theoretic theorem of CMM21, whose owner is GeneralAlgebraicKTheory.

(CMM21, Proof of Theorem 6.3, p. 51.) *Needs:* `gabber_affine_proper_base_change` (Layer 8), `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`.

### 12.6 Tilting preserves complete arc-covers

Prove `tilting_complete_arc_covers`. Let A→B be integral perfectoid rings, let ϖ∈A satisfy ϖ^p|p, assume both rings ϖ-adically complete, and choose ϖ♭∈A♭ whose sharp is a unit multiple of ϖ. Then A→B is a ϖ-complete arc-cover if and only if A♭→B♭ is a ϖ♭-complete arc-cover.

Use complete aic valuation tests, which are themselves perfectoid. Import tilting equivalence for these valuation rings, its rank preservation and its compatibility with the two completion parameters. Translate the lifting square in both directions.

An arbitrary element ϖ without ϖ^p|p or without compatible sharp data is not covered by this statement.

(CS24, Lemma 2.2.2, p. 19.) *Needs:* `ICompleteArcCover` (Layer 11), `PerfectoidSpaces:P1/tilt-of-perfectoid-field`, `PerfectoidSpaces:P1/continuous-valuations-under-tilting`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion`, `PerfectoidQuotients:Q0:integral-algebra/products-of-perfectoid-rings`, `PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid`, `rank_one_completion` (Layer 8).

### 12.7 Integral perfectoid, tilt and A_inf hyperdescent

Prove `integral_perfectoid_hyperdescent`. For a p-complete arc-hypercover A→B• whose augmentation and all terms are perfectoid Z_p-algebras, the canonical maps A→Rlim B•, A♭→Rlim (B•)♭ and A_inf(A)→Rlim A_inf(B•) are equivalences in the derived category of abelian groups, compatibly with their multiplicative structures. Here A_inf(A)=W(A♭).

For the tilt use tilting of complete covers and arc-descent of perfect F_p-algebras; derived distinguished-ideal completion kills the inverted complement. For A_inf pass through the finite p-power Witt filtration and the derived complete inverse limit. Recover A by the distinguished regular quotient A_inf/(ξ), using derived (p,ξ)-completeness and the imported perfect-prism/regularity interface. Degree-zero-valuedness upgrades the sheaf statement to the stated hyperdescent comparisons.

The use of derived completion is justified by the perfectoid/prism hypotheses; ordinary quotient towers are not asserted to compute completion for arbitrary rings.

(CS24, Lemma 4.2.6 and proof, pp. 41–42.) *Needs:* `perfectoid_structure_descent` (Layer 12), `tilting_complete_arc_covers` (Layer 12), `perfect_arc_hyperdescent` (Layer 7), `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion`, `PerfectoidQuotients:Q0:integral-algebra/products-of-perfectoid-rings`, `PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid`, `PrismaticCohomology:PR.0/ainf-prism`, `PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`.

### Examples

For an algebraically closed field k of characteristic p, its integral perfectoid structure has tilt k. The reduction Spf k→Spf k[ε]/ε² is a formal arc-cover, but k[ε]/ε² is not perfectoid. Its structure presheaf detects the nonzero ε, explaining the restriction of the acyclicity theorem to Perfd. The completed generic fibre at p is empty in this characteristic-p case (BS22 Definition 8.7 and Proposition 8.10, pp. 67–68).

### Dependencies

`AdicEtaleGeometry:A1`, `ArcTopologyAndDescent:AT.11`, `ArcTopologyAndDescent:AT.2`, `ArcTopologyAndDescent:AT.7`, `ArcTopologyAndDescent:AT.8`, `ArcTopologyAndDescent:AT.9`, `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`, `PerfectoidQuotients:Q0:integral-algebra`, `PerfectoidSpaces:P1`, `PerfectoidSpaces:P3`, `PrismaticCohomology:PR.0`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`.

## Downstream consumers

PrismaticCohomology uses the formal arc-site, its perfectoid basis, structure-sheaf acyclicity and the arc_p completed-generic-fibre comparison in the proof of BS22 Theorem 9.1. Guo–Reinecke use the same cover and cohomology interfaces in Theorem 6.1; its prismatic Frobenius-fixed conclusion stays with the prismatic owner. Česnavičius–Scholze use complete finite-ideal descent, punctured henselian comparison, open/support comparison and the hyperdescent of A, A♭ and A_inf. GeneralAlgebraicKTheory consumes proper-henselian torsion comparison in the proof of CMM21 Theorem 6.3. These are shared inputs, not six independent plans.

## Source conventions and corrected statements

Numbering and pages refer to the versions listed below. BM21 is read as arXiv v4; findings about that text do not assert that the journal version has identical wording. The corrected prime lemma retains kernel containment and the largest prime over p. The finite-chain étale category keeps all natural transformations. The aic root obligation is explicitly restricted to positive degree (Definition 3.26 omits that qualification). Boolean disjoint unions give products; the natural-transformation detection target is G(S). The rational-domain estimate uses a maximum, and the affinoid theorem keeps the proved d+1 versus residue-invertible d bounds. In the total-integral-closure proof only an elementwise nil kernel is used, with no uniform exponent asserted. These corrections and their checks are recorded with locators in the accompanying packet.

## References

- **BM21.** Bhargav Bhatt and Akhil Mathew, *The arc-topology*. arXiv:1807.04725v4, 14 December 2020; Duke Math. J. 170 (2021). [Source](https://arxiv.org/abs/1807.04725v4). Read: Entire paper, printed pp. 1–64.
- **BS17.** Bhargav Bhatt and Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*. arXiv:1507.06490v3, 27 July 2017; Invent. Math. 209 (2017). [Source](https://arxiv.org/abs/1507.06490v3). Read: §2 pp. 4–10; Lemma 3.16 p. 14; §4 pp. 15–16; §6 pp. 21–22; Theorem 11.2 p. 40, Theorem 11.15 p. 43 and proof pp. 45–47.
- **BS22.** Bhargav Bhatt and Peter Scholze, *Prisms and prismatic cohomology*. arXiv:1905.08229v4, 12 January 2022; Ann. Math. 196 (2022). [Source](https://arxiv.org/abs/1905.08229v4). Read: §8.2 pp. 67–69; proof of Theorem 9.1 pp. 71–73.
- **CS24.** Kęstutis Česnavičius and Peter Scholze, *Purity for flat cohomology*. arXiv:1912.10932v3, 2023; Ann. Math. 199 (2024). [Source](https://arxiv.org/abs/1912.10932v3). Read: §2.2 pp. 18–22; Lemma 3.1.2 p. 30; Lemma 4.2.6 p. 42.
- **GR24.** Haoyang Guo and Emanuel Reinecke, *A prismatic approach to crystalline local systems*. arXiv:2203.09490v3; Invent. Math. (2024). [Source](https://arxiv.org/abs/2203.09490v3). Read: Theorem 6.1 and its proof, pp. 55–56.
- **CMM21.** Dustin Clausen, Akhil Mathew and Matthew Morrow, *K-theory and topological cyclic homology of henselian pairs*. arXiv:1803.10897v2; J. Amer. Math. Soc. 34 (2021). [Source](https://arxiv.org/abs/1803.10897v2). Read: Proof of Theorem 6.3, p. 51.
- **MAT22.** Akhil Mathew, *Faithfully flat descent of almost perfect complexes in rigid geometry*. arXiv:1912.10968v3; J. Pure Appl. Algebra 226 (2022), 106938. [Source](https://arxiv.org/abs/1912.10968v3). Read: Definition 5.17, Remark 5.18 and Theorem 5.19, pp. 19–22.
- **BC22.** Alexis Bouthier and Kęstutis Česnavičius, *Torsors on loop groups and the Hitchin fibration*. arXiv:1908.07480v4, 1 June 2022. [Source](https://arxiv.org/abs/1908.07480v4). Read: Theorem 2.3.4 and Corollary 2.3.5, pp. 29–31.
- **STACKS.** The Stacks Project Authors, *The Stacks Project: affine analogue of proper base change*. Online version read 18 October 2026. [Source](https://stacks.math.columbia.edu/tag/09Z8). Read: §59.82, Lemmas 59.82.1–4 and 59.82.6, Example 59.82.5 and Theorem 59.82.7 (09ZI); HTML has no page numbers.
- **HUB96.** Roland Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*. Aspects of Mathematics E30, Vieweg, 1996; maintainer-cleared copy. [Source](https://doi.org/10.1007/978-3-663-09991-8). Read: Corollary 3.2.2 printed p. 174; §3.2 pp. 178–181 including Theorems 3.2.9–3.2.10; Corollary 4.2.7 printed pp. 244–245.
- **BH16.** Bhargav Bhatt, *Algebraization and Tannaka duality*. arXiv:1404.7483v1, 29 April 2014; published Camb. J. Math. 4 (2016). [Source](https://arxiv.org/abs/1404.7483v1). Read: Theorem 1.5 p. 2; Corollary 1.6 p. 3; conventions pp. 4–5.
- **HJ14.** Annette Huber and Clemens Jörder, *Differential forms in the h-topology*. Algebraic Geometry 1 (4) (2014), 449–478; published open-access version. [Source](https://algebraicgeometry.nl/2014-4/2014-4-020.pdf). Read: Introduction and conventions pp. 451–452; §6.1–6.2 pp. 464–466, especially Corollary 6.5 p. 465.
- **HA.** Jacob Lurie, *Higher Algebra*. Online version dated 18 September 2017. [Source](https://www.math.ias.edu/~lurie/papers/HA.pdf). Read: Corollary 4.7.5.3 and its proof, p. 705; adjacent Theorem 4.7.5.2 pp. 704–706.
