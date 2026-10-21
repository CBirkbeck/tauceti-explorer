# Complete local coefficient categories

This is the lemma-level blueprint for `DeformationAndDerivedPatchingAlgebra:R03.1`, continuing the accepted P7 pass. Its 106 proposed declarations supply the coefficient algebra used by deformation functors, local Galois deformation rings, compatible infinitesimal lifts and patching. The planning pass is complete; the stage has **planned** coverage, with seven explicit proof-interface gaps. No declaration is claimed implemented, and the plan does not claim a closed dependency graph.

The accompanying [packet](../packets/DeformationAndDerivedPatchingAlgebra--R03.1.json) is the machine-readable declaration and dependency catalogue. The [suggested Lean file](../suggested/DeformationAndDerivedPatchingAlgebra--R03.1.lean) gives actual coefficient objects, morphisms, quotients, square-zero extensions, power series and native completion constructions, with unfinished proofs. Its signatures elaborate against the pinned Mathlib. Six theorems requiring unavailable supplier types are identified explicitly below; two other signatures give the underlying linear or ring comparison while the packet retains the stronger coefficient compatibility. The [handoff](../handoff/BP-DeformationAndDerivedPatchingAlgebra--R03.1.md) records these boundaries for review.

## The coefficient convention

Fix a complete Noetherian local commutative ring Λ, a field k and a specified surjective residue map ρ:Λ→k with kernel m_Λ. The complete DVR case is the main arithmetic specialization. The field k is arbitrary: it need not be finite or perfect. Every coefficient object A carries its actual Λ-algebra structure and a specified surjection q_A:A→k with kernel m_A and q_A∘(Λ→A)=ρ. This residue marking is data. An abstract assertion that the two residue fields are isomorphic would not specify which residual representation or tangent vector is being preserved.

A coefficient morphism f:A→B is a Λ-algebra homomorphism satisfying q_B∘f=q_A. It is automatically local: a unit in B has nonzero residue, so its preimage under f has nonzero residue and is a unit in A. Consequently f⁻¹(m_B)=m_A, f(m_Aⁿ)⊆m_Bⁿ, and f is continuous for the maximal-ideal adic topologies. The underlying category and its Artinian and complete full subcategories use the same arrows. Continuity is therefore a theorem of the fixed-residue convention, rather than another independently chosen field.

`Art_Λ(k)` imposes native Artinianity on the underlying local ring. `CNL_Λ(k)` imposes native Noetherianity and maximal-adic completeness, including separatedness. The two conditions have different uses: k[[X]] is a complete coefficient ring and is not Artinian. An Artinian object is Noetherian and maximal-adically complete because its maximal ideal is nilpotent. Neither category imposes flatness over Λ. The objects k and k⊕kⁿ show that the zero-dimensional and infinitesimal cases must be included; the zero ring cannot carry a surjective map to the field k.

Stacks 90.3 allows a more general residue extension over the coefficient base. This plan uses its classical, fixed-residue specialization. In particular the base residue map is surjective. The inseparable residue-extension counterexample in Stacks Example90.3.7 cannot be silently transferred to, or ignored in, a different coefficient convention. The pullbacks below use the explicitly specified common residue and a surjective leg. BCGP25 §1.8.2 defines the arithmetic CNL convention with a finite-p-adic base; the arbitrary-field generality here comes from the Stacks passages and the stated mathematical arguments.

## Infinitesimal extensions and their tests

A nilpotent extension is a surjective coefficient morphism with nilpotent kernel. A square-zero extension is a surjective coefficient morphism whose kernel has square zero. A small extension has a **nonzero principal** kernel annihilated by the maximal ideal of the source. Nonzero excludes identity maps; principal excludes the augmentation k⊕k²→k; annihilation excludes k[X]/(X³)→k. In contrast the dual-number augmentation k⊕k→k is small. Its kernel is a genuine one-dimensional k-vector space, using the specified residue action.

The residue-module construction applies to any A-module killed by m_A. A scalar c∈k acts by any lift a∈A with q_A(a)=c; the annihilation condition makes that action independent of the lift. It must agree with the original A-action, and all later cotangent spaces and kernel dimensions use this construction. A split extension uses Mathlib's native `TrivSqZeroExt`, including its multiplication and first projection; it is not a ring defined only through existence assertions.

Every surjection of Artinian coefficient rings factors into finitely many small extensions. First filter the kernel K by m_AⁱK. Each quotient is annihilated by m_A; then refine the successive finite-dimensional k-spaces by a basis flag. Each nonzero one-dimensional factor is principal and small. A zero kernel produces a chain of length zero and an endpoint isomorphism. The proof separates the socle filtration, its basis refinement and the final factorization. Finite length over Λ follows by restricting a composition series: in the fixed-residue case a simple A-factor is k, and k is also simple over Λ because ρ is surjective.

For A→C←B with a surjective right leg, the pullback is the native algebraic equalizer in A×B. The two component residues coincide on that equalizer, giving its actual residue map. A pair is a unit exactly when its common residue is nonzero, proving locality. As a Λ-submodule of a finite-length module the pullback has finite length, hence is an Artinian ring. This argument does not use the false principle that every subring of an Artinian ring is Artinian. Its maps, lift and residue formula form the API, with identity, dual-number and common-residue tests. Pullback preserves smallness along a surjective leg by identifying the resulting kernel with the original kernel and its residue action.

## Quotient towers and continuous power series

For A∈CNL_Λ(k) and I⊆m_A, `Complete.quotient` packages the actual native ring A/I with the induced residue map. Noetherianity and maximal-adic completeness pass to this quotient. The improper ideal is excluded from this category constructor, since its quotient is the zero ring. The separate finite-ideal completion theorem permits the improper ideal and records its zero-ring case explicitly.

The Artinian truncation indexed by n∈ℕ is A/m_A^(n+1). This positive exponent makes truncation zero equal to the residue object, rather than the zero ring. Quotient maps give the transition arrows, their composition law and the map from A. A is recovered by the inverse limit of these quotients through the native completion construction. Every map to an Artinian coefficient ring factors through a positive truncation because the target maximal ideal is nilpotent. The completion equivalence must agree with the canonical native map on original elements; an unspecified ring isomorphism would not recover the desired functor of points.

For a finite set of variables, `Complete.powerSeries` packages Λ[[X₁,…,X_n]] or A[[X₁,…,X_n]] with residue obtained by taking the constant coefficient and then q_A. Its maximal ideal is (m_A,X₁,…,X_n). The relevant topology is the topology of this whole maximal ideal, not just the variable ideal when A has a nonzero maximal ideal. Its powers are described by the mixed coefficient condition: the coefficient of a monomial of total degree d belongs to m_A^max(r−d,0) in the rth maximal-ideal power. The already planned P7 finite-variable order lemmas are imported for the variable part.

A coefficient morphism A→B and elements b_i∈m_B give a continuous evaluation homomorphism A[[X_i]]→B. The ring is the existing `MvPowerSeries`; the evaluator is native `eval₂Hom`. Finite-variable `HasEval` follows from membership in the target adic ideal, and completeness supplies convergence. Tau Ceti's pinned adic evaluation lemmas give the constant-residue calculation. Sending a variable to one fails the residue condition. Evaluating zero variables gives the original coefficient map, and the variable and constant formulas specify the universal map.

The relative coefficient cotangent space is

`t*_(B/A) = m_B / (f(m_A)B + m_B²)`.

Formally, take the native B-submodule m_B and pull back the denominator along its inclusion. Its k-action is the residue-module action, because multiplication by m_B kills the quotient. This is the relative local cotangent space in the classical residue convention. It is not asserted to be the full algebraic differential module under arbitrary residue-field extension. It is zero for the identity map, is kⁿ for k→k⊕kⁿ with the specified coordinate classes, and discards base uniformizer directions. Native Λ-derivations B→k are its k-linear dual, with the value on each quotient generator specified.

For a complete coefficient map A→B, a finite set of elements whose classes span this relative cotangent space gives a surjective evaluation A[[X_i]]→B. The proof is a maximal-adic Nakayama argument followed by successive corrections and completeness. The resulting finite-variable quotient presentation records the actual coefficient map and residue marking. Cotangent surjectivity detects surjectivity of a coefficient morphism; the dual formulation detects injectivity on maps to the dual-number object. Finiteness of the cotangent space uses Noetherianity, without imposing a finite cardinality on k.

## Local completed tensor products

For A,B∈CNL_Λ(k), let T=A⊗_ΛB and J=m_AT+m_BT. The generic J-adic completed tensor construction is owned by `AdicSpacesPartII:F0/completed-tensor-product-adic`, and is imported unchanged. R03.1 proves its coefficient specialization: T/J=k through multiplication of the two marked residues; J is finitely generated; the completion is Noetherian, local, complete and has the indicated residue. No flatness assumption is needed to construct this coproduct. The exact local and finite-generation hypotheses are recorded rather than hidden under a claim that arbitrary completed tensors are Noetherian.

The generic source completion theorem allows a possibly non-Noetherian ring T: if J is finitely generated and T/J is Noetherian, its J-adic completion is Noetherian. Its proof uses the already planned associated graded ring and its degree-one generation. The unresolved interface is narrower: the initial homogeneous ideal of an arbitrary ideal in the completion, homogeneous finite generators represented by actual elements, and a controlled one-step correction. The plan separates the correction sequence and convergence arguments; it does not introduce a second associated graded-ring construction. This missing supplier input is gap1.

The local coproduct API gives the two coefficient inclusions, the unique map determined by a pair of coefficient maps, and the residue of a simple tensor. Symmetry and associativity follow from that universal property and retain the canonical maps. If A and B have finite-variable presentations over Λ, their coproduct has the presentation using both variable lists and the extended defining ideals. A finite factor A over Λ needs no additional tensor completion: A⊗_ΛB is a finite B-module, and the joint ideal is cofinal with the B-maximal ideal because its closed fibre is Artinian local.

Exactness requires its own hypotheses. For a Λ-flat B and a short exact sequence of finite Λ-modules, native tensoring remains exact and gives finite B-modules. Those modules are already maximal-adically complete. This finite-module result does not assert exactness of arbitrary completed tensor products. The cotangent space of the coefficient coproduct is the direct sum of the two relative coefficient cotangent spaces, with the inclusions fixing the summand maps. This is the KW II tangent calculation used in local-to-global deformation comparisons.

## Flat completion and arbitrary residue extension

André Lemma1.1.1 supplies a completion theorem beyond finite algebras. Let R be Noetherian, S an R-flat algebra, and I an ideal of R. The I-adic completion of S is R-flat even if S is not Noetherian or separated before completion. For a finite R-module M, completion commutes with the canonical tensor comparison. Faithfulness after completion requires I⊆Jac(R) and faithful flatness of S over R. The Jacobson condition concerns the base R. The proof uses Artin–Rees on finite R-modules, flat tensoring, cofinal filtrations and exact countable inverse limits. The last interface is requested from E2, so these statements remain dependent on gap2.

To realize an arbitrary field extension ι:k→K as a residue extension of a local R, first construct monogenic flat local extensions. A transcendental generator uses a polynomial algebra localized at its indicated residue prime; an algebraic generator uses a monic lifted polynomial and the corresponding local factor. A well-ordered generating set and directed colimits then give a flat local R→S with m_S=m_RS and labelled residue K. S is allowed to be non-Noetherian. This transfinite construction is Stacks03C3; it does not use a proper-class Zorn argument.

When R is Noetherian, complete S at m_RS. This ideal is finitely generated and its quotient is the field K, so the preceding Noetherian-completion theorem applies. The flat-completion theorem and its faithfulness criterion give a complete Noetherian local faithfully flat extension R′ with m_R′=m_RR′ and the specified residue K. This construction works when R was not complete initially. For a complete coefficient object, `ResidueExtension` bundles the resulting complete object, actual map, residue equation, coefficient-base compatibility, equality of maximal ideals and faithful flatness. It is chosen data, not a canonical functor on field extensions.

Finite generation ascends and descends along this extension by Mathlib's native faithfully flat descent theorem. No hypothesis that the original module is already finite is allowed in the descent direction. The tests distinguish identity extension, k[[X]]→K[[X]] and a ramified map with extended maximal ideal generated by πᵉ for e>1. The latter fails the maximal-ideal equality even when it is flat.

## Cohen coefficients and compatible choices

A strict Cohen ring for a characteristic-p field k is a characteristic-zero complete DVR with p as uniformizer and labelled residue k. No perfectness condition is imposed. For perfect k, the native Witt vector ring is the example; its completeness, DVR structure and constant coefficient are imported. For imperfect k the Witt vector ring is not asserted to be a Cohen DVR. The plan uses the public Stacks Cohen construction and the published Anscombe–Jahnke account.

The existence proof for arbitrary k, and the coefficient map into a complete local ring of residue k, pass through truncated Cohen rings. Formal smoothness of an arbitrary field over its prime field is the essential input. The native perfect-field smoothness theorem needs essential finite type and cannot replace this arbitrary-field assertion. The p-basis and geometric-reducedness inputs in Stacks0322 remain gap3. Compatible truncation lifts are built before taking the limit, so a coefficient map is supplied with its residue equation. A chosen Cohen coefficient map and generators of the remaining maximal ideal give a finite-variable power-series presentation; a characteristic-zero target makes the Cohen map injective. In equal positive characteristic the map factors through C/p=k, giving a coefficient section even for a complete local ring that is not Noetherian.

For a separable residue extension k→K and a specified local square R→S, André §4.4(1) uses a relative Cohen structure theorem compatible with the prescribed image of C(k). The public Cohen-to-Cohen homomorphism theorem does not by itself produce an embedding into an arbitrary complete target S. The exact arbitrary-target compatibility theorem remains gap4. Its proposed statement retains the prescribed square and separability; no functorial or canonical selection is asserted.

The perfect-hull construction is a different operation. Anscombe–Jahnke's Teichmüller embedding process adjoins compatible p-power roots of representative elements through finite free extensions and a directed union, then completes to a Cohen ring with perfect residue. The perfect Cohen comparison identifies that ring with W(k^perf). This yields a chosen injective, local, faithfully flat map C(k)→W(k^perf). It is not an application of a separable-lifting theorem to the purely inseparable extension k→k^perf. The underlying p-basis and pre-Cohen infrastructure is gap6. Given this embedding and C(k)→R, completing R⊗_C W(k^perf) gives the faithfully flat perfect-residue extension. Preservation of reducedness requires additional R03.3 input; flatness alone does not prove it.

## Compatible lifting and the Witt-category boundary

Ring-side continuous formal smoothness means that every square from A→B to a small extension of Artinian coefficient objects has a coefficient lift. Small factorization makes this equivalent to lifting across all surjections of Artinian coefficient objects. Formal power-series morphisms have the property by lifting the variable images in the maximal ideal. Conversely finite relative cotangent generators, chosen successive lifts and separated completeness produce an isomorphism with a finite formal power-series algebra. The first relative truncation fixes the number of variables and the residue compatibility.

For the R03.4 consumer, the complete-target lifting theorem keeps compatible prescribed finite-level lifts. In a square B→E←D with D→E surjective, form the finite-level fibre diagrams, lift successively and take their compatible limit. If a finite-level lift is prescribed, keep its reduction at the starting level. The packet distinguishes constructing a compatible tower from taking the complete lift. Algebraic `RingHom.FormallySmooth` is used only for a separately verified native truncated-Cohen input, not as a substitute for this ring-side infinitesimal predicate.

The generic smooth natural-transformation predicate for Artinian deformation functors is R03.2-owned. Its represented comparison has the contravariant direction h_B→h_A. That comparison is a forward consumer interface; R03.1's definition does not depend on a full R03.2 functor development. RS08 similarly leaves the existing Witt coefficient category and universal elliptic deformation object in ModularCurves7D. R03.1 supplies the general marked category and an identity-on-underlying-data comparison when the upstream marked category type is exposed. It does not replan elliptic moduli or their universal deformation ring.

## Further coefficient applications and corrected sources

The module Chevalley theorem handles a decreasing sequence N_n of submodules of a finite module over a complete Noetherian local base. Stable Artinian images, exact inverse limits and separated quotients imply that intersection zero gives cofinality with the maximal-adic filtration. It does not require mⁿM⊆N_n. It also gives the induced-topology result for a local embedding of complete Noetherian rings.

KW II Proposition2.2 is used in its exact arithmetic scope. For the domain part over an arbitrary complete DVR, assume specified DVR-valued points of the flat domain factors and regularity of their generic local rings. Saturate their point-ideal powers after inverting the uniformizer. Chevalley compares these saturated jets with the maximal-adic topology; each quotient is finite free over the DVR. Integral tensor jets then give the completed tensor an injection into the inverse limit of generic box jets. The independently requested regular-coordinate theorem identifies this target with a power-series domain. Gap5 records this coordinate interface. The original finite-Q_p generic-fibre regularity conclusion belongs to R03.4; it is not inferred for arbitrary DVRs.

Finite algebra completions use the actual primes above a prime of the base. At each positive quotient a finite algebra over an Artinian local base splits by the native localization-product equivalence. The fixed-index product decompositions commute with quotient transitions on original algebra elements. Taking limits and comparing cofinal local filtrations gives completion(R_p)⊗_R S as the finite product of completion(S_q). A finite domain algebra over a complete Noetherian local base has only one factor, so it is local and complete. A general finite algebra can have several factors. André's parameter quotient ideals (p^m,T_i^(p^m)) are cofinal with the maximal-adic powers by an explicit monomial bound; parameter evaluation is finite after the primary quotient and topological Nakayama steps.

Paškūnas–Quast Lemma5.15 has an important non-Noetherian source case: A is local and its maximal-adic completion is Noetherian. Finite quotients A/m_Aⁿ are then Artinian. For a finitely generated ideal I, Artinian stabilization of the finite-level relation kernels gives the Mittag–Leffler condition, and exact limits identify completion(A)/I completion(A) with completion(A/I). Finite generation of m_A is not assumed. This uses the E2 interface in gap2.

BIP23 Lemmas3.35–3.37 give additional coefficient-localization comparisons. The published Lemma3.35 needs the finite extension κ(p)/κ(p₀), where p₀ is the contracted coheight-one prime. Finite type of A over R alone does not give this: R=F_p[[t]], A=R[x], p=p₀=0 gives κ(p)=F_p((t))(x), and its diagonal has two independent cotangent directions rather than the asserted one. The atlas already records this as BIP/E11; the node and Lean signature use the corrected hypothesis. Closed points supply the finite extension in the intended geometric applications.

With this correction the characteristic-p local-field diagonal adds one formal variable. The O-Cohen version has a **relative** Cohen DVR with the O-uniformizer; it need not be an absolute strict Cohen ring when O is ramified. A finite residue extension of k or of Frac(O) instead gives no extra variable. Their proof needs the one-element differential p-basis diagonal computation and pseudocompact Nakayama with separated kernel, not ordinary finite-module Nakayama. These precise comparison inputs are gap7. The field k((t)) is not treated as a finitely generated field extension of k.

## Ownership and stage dependencies

The imported native declarations were read with their binders at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet records 63 baseline declarations, their modules and the exact content used. Existing completion, associated graded rings, trivial square-zero rings, Witt vectors, derivations and finite-generation descent are reused.

The exact imported F0 tensor node has a five-node prerequisite closure; the four imported P7 helper closures have respectively seven, one, two and four nodes. Recursive inspection finds no R03.1 dependency in those closures. Nevertheless the current atlas has the forward paths R03.1→F0 and R03.1→R03.2→R03.3→R03.4. Adding reverse whole-stage supplier edges would cycle. The packet therefore proposes independent supplier prefixes for F0 adic algebra, R03.3 basic commutative algebra and R03.4 coheight-one local algebra, preserving all existing node IDs. Their remaining geometry and depth consumers keep the forward dependencies. This proposal requires maintainer resolution; no foreign file is changed here.

E2 owns generic module towers, exact countable inverse limits, pro-isomorphisms, lim¹ and finite-product limit comparisons. No current R03.1→E2 path was found, so its narrowly requested supplier link has no such stage-cycle obstruction. The packet also distinguishes the forward R03.2 represented-functor comparison and the upstream Witt-category interface. These boundaries are part of the plan's remaining work, not claims that whole-stage dependencies have been closed.

The packet's `targetInventory` accounts for all 135 touching items from the existing paper extractions. Forty-two are mapped to this stage's exact nodes; others are imported supplier or baseline interfaces, or belong to regularity/depth, geometry, automorphic, patching and homological owners. The patched ring expression consumes this stage's tensor and series constructors, but the patched ring and its formal spectrum are application objects. Completed chart-product domain applications retain their separate regularity and point hypotheses. Only the source passages listed in the bibliography were freshly read; earlier extraction items are ownership leads, not evidence that their whole papers were reread.

## Declaration catalogue

All proposed declarations lie in namespace `TauCeti.Coeff`, in a prospective coefficient-algebra module. A catalogue entry is one proposed declaration. Unqualified prerequisite slugs below mean nodes of this packet; qualified supplier IDs name existing external nodes or requests. The common base convention is the first section; an entry's additional hypotheses override it for genuinely more general or more specialized statements. Proof outlines are plans. Every definition and construction has its uses, API and at least three discriminating tests. Six planets mark the Artinian and complete categories, coefficient power series, power-series presentation, local completed tensor and formally smooth presentation.

### Marked coefficient objects and arrows

#### Local algebras with a labelled residue field

`TauCeti.Coeff.Local` — definition. Packet ID: `labelled-local-algebra`.

Local_Λ(k) consists of local commutative Λ-algebras A with a surjective ring map q_A:A→k, ker q_A=m_A and q_A∘Λ→A=ρ. The map q_A is actual quotient data, equivalently an isomorphism A/m_A≃k.

Proof/construction: Bundle the existing local ring, algebra and ring homomorphism structures and the three residue compatibilities. For the residue object use k with Λ-action through ρ; for unit lifting apply surjectivity and the local nonunit ideal characterization.

Direct prerequisites: `mathlib:IsLocalRing.maximalIdeal`.

Sources: [STACKS-06GC](https://stacks.math.columbia.edu/tag/06GC), Definition 90.3.1, object and morphism convention.

Uses: Stacks 90.3.1 and BCGP25 §1.8.2 — Fixes the actual residue maps that all coefficient morphisms preserve.; GlobalGaloisDeformations:R04.1 — Carries the residual representation over its specified field.

API:

- `TauCeti.Coeff.Local.residueObject` (constructor): The residue field k itself, with Λ-action ρ and identity residue map.
- `TauCeti.Coeff.Local.residue_ne_zero_iff_isUnit` (characterisation): q_A(a)≠0 if and only if a is a unit.
- `TauCeti.Coeff.Local.residue` (projection): The actual surjective ring map A→k with the stated kernel and base compatibility.

Tests:

- `TauCeti.Coeff.Local.test_zero_excluded` (non-example): Every labelled local algebra is nontrivial, so the zero ring is excluded.
- `TauCeti.Coeff.Local.test_residue_kernel` (characterisation): q_A(a)=0 if and only if a belongs to m_A.
- `TauCeti.Coeff.Local.test_unit_lift` (small-case): Every nonzero c∈k lifts to a unit in A.

#### Coefficient morphisms

`TauCeti.Coeff.Hom` — definition. Packet ID: `residue-preserving-morphism`.

For A,B in Local_Λ(k), Hom(A,B) consists of Λ-algebra homomorphisms f with q_B∘f=q_A. Identity and composition give the category of labelled local algebras and its Artinian and complete full subcategories. Locality and maximal-ideal continuity are consequences, not extra choices.

Proof/construction: Identity and composition preserve the residue equation by substitution. The category laws follow from algebra-homomorphism extensionality.

Direct prerequisites: `labelled-local-algebra`.

Sources: [STACKS-06GC](https://stacks.math.columbia.edu/tag/06GC), Definition 90.3.1, morphisms.

Uses: Stacks 90.3–90.4 — Defines the arrows on which deformation functors and complete representing objects act.; LocalGaloisDeformationRings:R08.1 — Preserves the marked residue representation under coefficient maps.

API:

- `TauCeti.Coeff.Hom.id` (constructor): Identity coefficient morphism.
- `TauCeti.Coeff.Hom.comp` (functoriality): Composition of coefficient morphisms.
- `TauCeti.Coeff.Hom.ext` (extensionality): Equality of underlying algebra homomorphisms implies equality of coefficient morphisms.

Tests:

- `TauCeti.Coeff.Hom.test_id_residue` (degenerate): Identity acts as identity on the labelled residue field.
- `TauCeti.Coeff.Hom.test_comp_residue` (functoriality): Composites preserve the same residue map.
- `TauCeti.Coeff.Hom.test_no_variable_to_one` (non-example): A morphism cannot send an element of the source maximal ideal to 1.

#### Residue preservation forces locality

`TauCeti.Coeff.Hom.isLocalHom` — lemma. Packet ID: `morphism-is-local`.

Every coefficient morphism f:A→B reflects units and is a local ring homomorphism.

Proof/construction: If f(a) is a unit, its residue is nonzero; the residue equation makes q_A(a) nonzero. Use the local nonunit-ideal characterization to conclude a is a unit.

Direct prerequisites: `residue-preserving-morphism`, `mathlib:IsLocalHom`.

Sources: [STACKS-06GW](https://stacks.math.columbia.edu/tag/06GW), Definition 90.4.1, morphisms.

#### Maximal ideals under coefficient morphisms

`TauCeti.Coeff.Hom.comap_maximalIdeal` — lemma. Packet ID: `morphism-maximal-comap`.

For a coefficient morphism f:A→B, f⁻¹(m_B)=m_A.

Proof/construction: Apply the native maximal-ideal comap theorem to the local homomorphism.

Direct prerequisites: `morphism-is-local`, `mathlib:IsLocalRing.maximalIdeal_comap`.

Sources: [STACKS-06GW](https://stacks.math.columbia.edu/tag/06GW), Definition 90.4.1, morphisms.

#### Maximal-ideal continuity

`TauCeti.Coeff.Hom.continuous` — lemma. Packet ID: `morphism-continuous`.

Every coefficient morphism is continuous for the source and target maximal-ideal adic topologies.

Proof/construction: The residue equation gives f(m_A)⊂m_B, hence f(m_A^n)⊂m_B^n for every n. Use the native neighbourhood basis and translation to check continuity.

Direct prerequisites: `morphism-maximal-comap`, `mathlib:Ideal.hasBasis_nhds_zero_adic`.

Sources: [STACKS-06GV](https://stacks.math.columbia.edu/tag/06GV), Section 90.4, topology convention.

#### Artinian coefficient algebras

`TauCeti.Coeff.Artinian` — definition. Packet ID: `artinian-coefficient-category-and-small-extensions`.

Art_Λ(k) is the full subcategory of Local_Λ(k) whose underlying rings are Artinian. The integrated ID is retained only for this one object declaration; small extensions are separate declarations.

Proof/construction: Add the native Artinian-ring condition to the labelled local algebra. Use the existing Artinian⇒Noetherian theorem and native maximal-ideal completeness instance for the inclusion into complete objects.

Direct prerequisites: `labelled-local-algebra`, `mathlib:IsArtinianRing`, `mathlib:IsAdicComplete`.

Sources: [STACKS-06GC](https://stacks.math.columbia.edu/tag/06GC), Definition 90.3.1.

Uses: Stacks 90.3.1; Schlessinger input at R03.2 — Artinian test objects and infinitesimal lifting.; GlobalGaloisDeformations:R04.1 — Finite-level representation and determinant deformations.

API:

- `TauCeti.Coeff.Artinian.toComplete` (coercion): The fully faithful inclusion into complete coefficient algebras uses native Noetherianity and completeness.
- `TauCeti.Coeff.Artinian.toLocal` (projection): Underlying labelled local algebra.
- `TauCeti.Coeff.Artinian.split` (constructor): The native trivial square-zero extension k⊕kⁿ as an Artinian coefficient object.

Tests:

- `TauCeti.Coeff.Artinian.test_field` (degenerate): The residue field object, including zero-dimensional maximal ideal, is Artinian and complete.
- `TauCeti.Coeff.Artinian.test_nilpotent` (characterisation): The maximal ideal of every Artinian coefficient object is nilpotent.
- `TauCeti.Coeff.Artinian.test_noetherian` (compatibility): Its native IsNoetherianRing instance is available.

#### Complete local coefficient algebras

`TauCeti.Coeff.Complete` — definition. Packet ID: `complete-local-coefficient-category`.

CNL_Λ(k) is the full subcategory of Local_Λ(k) with a native Noetherian-ring instance and native m_A-adic completeness, including separatedness. No Artinianity, flatness over Λ, or finite residue-field assumption is imposed.

Proof/construction: Bundle native Noetherianity and maximal-ideal completeness. The completion comparison is the existing native algebra equivalence; prove the field and one-variable field-series examples via the power-series constructor.

Direct prerequisites: `labelled-local-algebra`, `mathlib:IsNoetherianRing`, `mathlib:IsAdicComplete`.

Sources: [STACKS-06GW](https://stacks.math.columbia.edu/tag/06GW), Definition 90.4.1; [BCGP-25](https://arxiv.org/pdf/2502.20645v1), §1.8.2, PDF p.8.

Uses: BCGP25 §1.8.2; KW II §2.1 — Representing rings, power-series frames and tensor products.; R03.4 — Source and target objects for compatible Artinian lifts.

API:

- `TauCeti.Coeff.Complete.completionEquiv` (equivalence): The canonical A-algebra equivalence A≃the m_A-adic completion of A.
- `TauCeti.Coeff.Complete.toLocal` (projection): Underlying labelled local algebra.
- `TauCeti.Coeff.Complete.adicComplete` (compatibility): Native IsAdicComplete m_A A, carrying both completeness and separatedness.

Tests:

- `TauCeti.Coeff.Complete.test_separated` (characterisation): An element belonging to all maximal-ideal powers is zero.
- `TauCeti.Coeff.Complete.test_dvr_allowed` (non-example): k[[X]] is an allowed complete coefficient algebra and is not Artinian.
- `TauCeti.Coeff.Complete.test_completion_comparison` (compatibility): The completion equivalence agrees with the native canonical map on every a∈A.

### Infinitesimal extensions and Artinian pullbacks

#### Split infinitesimal coefficient objects

`TauCeti.Coeff.Local.split` — construction. Packet ID: `split-square-zero-object`.

For n≥0, package the native ring TrivSqZeroExt k (Fin n→k) as a labelled local Λ-algebra with Λ-action through ρ and residue the first projection. It is the underlying object of Artinian.split n.

Proof/construction: Use the native first-projection algebra homomorphism. Its kernel is 0⊕kⁿ, whose products vanish; the unit characterization proves locality. Finite dimensionality over k gives native Artinianity.

Direct prerequisites: `labelled-local-algebra`, `mathlib:TrivSqZeroExt`, `mathlib:TrivSqZeroExt.fstHom`, `mathlib:TrivSqZeroExt.isUnit_iff_isUnit_fst`.

Sources: [STACKS-06GB](https://stacks.math.columbia.edu/tag/06GB), Example 90.3.7, dual-number ring.

Uses: Stacks 90.3.2; KW II §2.1 tangent functor — Dual numbers and higher-dimensional split square-zero kernels.

API:

- `TauCeti.Coeff.Local.split` (constructor): The labelled native split square-zero object.
- `TauCeti.Coeff.Local.splitAugmentation` (projection): The first projection to the residue object as a coefficient morphism.
- `TauCeti.Coeff.Local.split_residue` (simp): Residue of (c,v) is c.

Tests:

- `TauCeti.Coeff.Local.split_test_zero` (degenerate): At n=0 the augmentation is bijective.
- `TauCeti.Coeff.Local.split_test_product` (small-case): The product of any two pure infinitesimal vectors is zero.
- `TauCeti.Coeff.Local.split_test_unit` (compatibility): (c,v) is a unit if and only if c≠0.

#### Nilpotent coefficient extensions

`TauCeti.Coeff.Extension.Nilpotent` — definition. Packet ID: `nilpotent-extension`.

For a coefficient morphism f:A→B, Nilpotent(f) means f is surjective and its kernel is nilpotent.

Proof/construction: Take the displayed conjunction of native surjectivity and ideal conditions. The API implications use the separately promoted lemmas; split test objects use the native multiplication.

Direct prerequisites: `residue-preserving-morphism`.

Sources: [STACKS-06GB](https://stacks.math.columbia.edu/tag/06GB), Definition 90.3.2 and Lemma 90.3.3.

Uses: Stacks 90.3.2–90.3.3 — Separates nilpotent, square-zero and one-dimensional lifting tests.; R03.2; GlobalGaloisDeformations:R04.1 — Hypotheses of the deformation-functor lifting and obstruction APIs.

API:

- `TauCeti.Coeff.Extension.Nilpotent.surjective` (projection): A nilpotent extension is surjective.
- `TauCeti.Coeff.Extension.Nilpotent.ker_nilpotent` (projection): Its kernel has a vanishing power.
- `TauCeti.Coeff.Extension.Nilpotent.comp` (functoriality): A composite of nilpotent extensions is nilpotent.

Tests:

- `TauCeti.Coeff.Extension.Nilpotent.test_identity` (degenerate): Every identity is a nilpotent extension.
- `TauCeti.Coeff.Extension.Nilpotent.test_square_zero` (compatibility): Every square-zero extension is nilpotent.
- `TauCeti.Coeff.Extension.Nilpotent.test_not_surjective` (non-example): A nonsurjective morphism is not a nilpotent extension. The surjective augmentation k[[X]]→k is also not nilpotent: its kernel (X) has no vanishing power.

#### Square-zero coefficient extensions

`TauCeti.Coeff.Extension.SquareZero` — definition. Packet ID: `square-zero-extension`.

For a coefficient morphism f:A→B, SquareZero(f) means f is surjective and (ker f)²=0.

Proof/construction: Take the displayed conjunction of native surjectivity and ideal conditions. The API implications use the separately promoted lemmas; split test objects use the native multiplication.

Direct prerequisites: `residue-preserving-morphism`.

Sources: [STACKS-06GB](https://stacks.math.columbia.edu/tag/06GB), Definition 90.3.2 and Lemma 90.3.3.

Uses: Stacks 90.3.2–90.3.3 — Separates nilpotent, square-zero and one-dimensional lifting tests.; R03.2; GlobalGaloisDeformations:R04.1 — Hypotheses of the deformation-functor lifting and obstruction APIs.

API:

- `TauCeti.Coeff.Extension.SquareZero.surjective` (projection): A square-zero extension is surjective.
- `TauCeti.Coeff.Extension.SquareZero.nilpotent` (compatibility): A square-zero extension is nilpotent.
- `TauCeti.Coeff.Extension.SquareZero.split` (constructor): Every split augmentation k⊕kⁿ→k is square-zero.

Tests:

- `TauCeti.Coeff.Extension.SquareZero.test_identity` (degenerate): Every identity is square-zero.
- `TauCeti.Coeff.Extension.SquareZero.test_small` (compatibility): Every small extension is square-zero.
- `TauCeti.Coeff.Extension.SquareZero.test_cube_not_square` (non-example): The augmentation k[X]/(X³)→k is nilpotent but not square-zero.

#### Small coefficient extensions

`TauCeti.Coeff.Extension.Small` — definition. Packet ID: `small-extension`.

For a coefficient morphism f:A→B, Small(f) means f is surjective, ker f is nonzero principal, and m_A·ker f=0.

Proof/construction: Take the displayed conjunction of native surjectivity and ideal conditions. The API implications use the separately promoted lemmas; split test objects use the native multiplication.

Direct prerequisites: `residue-preserving-morphism`.

Sources: [STACKS-06GD](https://stacks.math.columbia.edu/tag/06GD), Definition 90.3.2 and Lemma 90.3.3.

Uses: Stacks 90.3.2–90.3.3 — Separates nilpotent, square-zero and one-dimensional lifting tests.; R03.2; GlobalGaloisDeformations:R04.1 — Hypotheses of the deformation-functor lifting and obstruction APIs.

API:

- `TauCeti.Coeff.Extension.Small.squareZero` (compatibility): Every small extension is square-zero.
- `TauCeti.Coeff.Extension.Small.ker_le_maximalIdeal` (projection): Its kernel lies in the maximal ideal of its source.
- `TauCeti.Coeff.Extension.Small.ker_finrank_one` (characterisation): Its kernel is a one-dimensional k-vector space via the labelled residue action.

Tests:

- `TauCeti.Coeff.Extension.Small.test_identity` (non-example): An identity is not small: the nonzero-kernel condition is essential.
- `TauCeti.Coeff.Extension.Small.test_principal_required` (non-example): The square-zero augmentation k⊕k²→k is not small.
- `TauCeti.Coeff.Extension.Small.test_annihilator_required` (small-case): The dual-number augmentation k⊕k→k is small; the augmentation k[X]/(X³)→k is not small.

#### A small kernel lies in the maximal ideal

`TauCeti.Coeff.Extension.Small.ker_le_maximalIdeal` — lemma. Packet ID: `small-kernel-in-maximal`.

For a small coefficient extension f:A→B, ker f⊂m_A.

Proof/construction: The target is nonzero and its residue kills zero; use the maximal-ideal comap equality.

Direct prerequisites: `small-extension`, `morphism-maximal-comap`.

Sources: [STACKS-06GD](https://stacks.math.columbia.edu/tag/06GD), Definition 90.3.2.

#### Small extensions are square-zero

`TauCeti.Coeff.Extension.Small.squareZero` — lemma. Packet ID: `small-square-zero`.

For a small coefficient extension f:A→B, (ker f)²=0; hence f is square-zero.

Proof/construction: Multiply ker f⊂m_A by ker f and use the annihilation condition in Small.

Direct prerequisites: `small-kernel-in-maximal`, `square-zero-extension`.

Sources: [STACKS-06GD](https://stacks.math.columbia.edu/tag/06GD), Definition 90.3.2.

#### Square-zero extensions are nilpotent

`TauCeti.Coeff.Extension.SquareZero.nilpotent` — lemma. Packet ID: `square-zero-nilpotent`.

Every square-zero coefficient extension is nilpotent.

Proof/construction: Use exponent two as a witness for nilpotence; retain surjectivity.

Direct prerequisites: `square-zero-extension`, `nilpotent-extension`.

Sources: [STACKS-06GE](https://stacks.math.columbia.edu/tag/06GE), Lemma 90.3.3, maximal-ideal-annihilated kernels.

#### Artinian surjections are nilpotent extensions

`TauCeti.Coeff.Artinian.surjection_nilpotent` — lemma. Packet ID: `artinian-surjection-nilpotent`.

Every surjective coefficient morphism from an Artinian object has nilpotent kernel.

Proof/construction: The kernel is contained in the source maximal ideal. The native Artinian-local nilpotence theorem gives a vanishing maximal-ideal power, and monotonicity gives the same kernel-power bound.

Direct prerequisites: `artinian-coefficient-category-and-small-extensions`, `nilpotent-extension`, `morphism-maximal-comap`, `mathlib:isArtinianRing_iff_isNilpotent_maximalIdeal`.

Sources: [STACKS-06GE](https://stacks.math.columbia.edu/tag/06GE), Lemma 90.3.3, first paragraph.

#### Restriction of simple modules to the coefficient base

`TauCeti.Coeff.Artinian.simple_restrict` — lemma. Packet ID: `artinian-simple-restriction`.

If A∈Art_Λ(k) and M is a simple A-module, then its restricted Λ-module is simple, since A/m_A≃k and Λ→k is surjective.

Proof/construction: Apply the native quotient characterization of a simple module and uniqueness of the local maximal ideal. Identify M with k; every Λ-submodule of k is a k-subspace because Λ→k is surjective.

Direct prerequisites: `artinian-coefficient-category-and-small-extensions`, `mathlib:isSimpleModule_iff_quot_maximal`.

Sources: [STACKS-06GG](https://stacks.math.columbia.edu/tag/06GG), Lemma 90.3.4, simple-module paragraph.

#### Artinian objects have finite coefficient-base length

`TauCeti.Coeff.Artinian.finite_base_length` — lemma. Packet ID: `artinian-finite-base-length`.

For A∈Art_Λ(k), the restricted Λ-module A has finite length. In particular it is Noetherian and Artinian over Λ.

Proof/construction: Take a native A-module composition series for A. Its simple factors remain simple after restriction by the preceding lemma; use the native finite-length induction.

Direct prerequisites: `artinian-simple-restriction`, `mathlib:isFiniteLength_iff_isNoetherian_isArtinian`, `mathlib:exists_compositionSeries_of_isNoetherian_isArtinian`.

Sources: [STACKS-06GG](https://stacks.math.columbia.edu/tag/06GG), Lemma 90.3.4, finite-filtration paragraph.

#### Small kernels have dimension one

`TauCeti.Coeff.Extension.Small.ker_finrank_one` — lemma. Packet ID: `small-kernel-dimension`.

For Small(f), ker f is canonically a k-vector space, via the source residue map, and has dimension one. Conversely a surjective coefficient morphism with maximal-ideal-annihilated nonzero one-dimensional kernel is small.

Proof/construction: Descend the source action along A→k because m_A annihilates the kernel. A nonzero principal kernel is spanned by one nonzero vector; conversely a one-vector k-basis lifts its coefficients to A by residue surjectivity.

Direct prerequisites: `small-extension`, `small-kernel-in-maximal`.

Sources: [STACKS-06GH](https://stacks.math.columbia.edu/tag/06GH), Lemma 90.3.8(2), same-kernel paragraph.

#### Surjections factor through annihilated kernels

`TauCeti.Coeff.Artinian.socle_factorization` — lemma. Packet ID: `surjection-socle-filtration`.

Let f:A→B be a surjective Artinian coefficient morphism with kernel I, and let m_A^r=0. The quotient chain A/(m_A^r I)→A/(m_A^(r−1)I)→…→A/I≃B factors f; every step has kernel annihilated by its source maximal ideal. Zero-kernel steps may be omitted.

Proof/construction: Use the quotient ideals m_A^j I, whose consecutive quotient kernel is m_A^j I/m_A^(j+1)I. The source maximal ideal multiplies this kernel into the next denominator. The endpoints are A and A/I, and the usual first-isomorphism theorem identifies A/I with B.

Direct prerequisites: `artinian-surjection-nilpotent`.

Sources: [STACKS-06GE](https://stacks.math.columbia.edu/tag/06GE), Lemma 90.3.3, first factorization.

#### An annihilated kernel has a small-extension flag

`TauCeti.Coeff.Artinian.socle_small_refinement` — lemma. Packet ID: `socle-basis-small-refinement`.

A surjective Artinian coefficient morphism whose kernel I is annihilated by m_A factors through a flag of quotient ideals obtained from a finite k-basis of I, with each nonzero consecutive step small.

Proof/construction: The annihilator condition descends the action to k. The finite-length input makes this vector space finite dimensional. For a basis v_1,…,v_s, quotient successively by the spans of the first j vectors; each consecutive kernel has dimension one.

Direct prerequisites: `small-kernel-dimension`, `artinian-finite-base-length`.

Sources: [STACKS-06GE](https://stacks.math.columbia.edu/tag/06GE), Lemma 90.3.3, second paragraph.

#### Small-extension factorization

`TauCeti.Coeff.Artinian.small_factorization` — theorem. Packet ID: `surjection-small-factorization`.

Every surjective morphism in Art_Λ(k) is a finite composite of small extensions followed by the canonical endpoint isomorphism; an isomorphism permits a chain of length zero.

Proof/construction: Apply the annihilated-kernel refinement to each step of the maximal-power filtration. Concatenate the finite chains and retain the actual quotient endpoint isomorphism.

Direct prerequisites: `surjection-socle-filtration`, `socle-basis-small-refinement`.

Sources: [STACKS-06GE](https://stacks.math.columbia.edu/tag/06GE), Lemma 90.3.3.

#### Locality of the algebraic pullback

`TauCeti.Coeff.Artinian.pullback_local` — lemma. Packet ID: `artinian-pullback-locality`.

For A→C←B in Art_Λ(k), the native equalizer subalgebra P⊂A×B of pairs with equal images is local; its nonunits are exactly the pairs whose two residues vanish, and its map to k is surjective.

Proof/construction: The residues of a compatible pair agree. If that common residue is nonzero both coordinates are units, and the inverse pair is compatible. If the residue is zero the pair cannot be a unit. For c∈k choose λ∈Λ with ρ(λ)=c; the two coefficient images of λ give a compatible lift.

Direct prerequisites: `residue-preserving-morphism`, `mathlib:AlgHom.equalizer`, `mathlib:AlgHom.fst`, `mathlib:AlgHom.snd`.

Sources: [STACKS-06GH](https://stacks.math.columbia.edu/tag/06GH), Lemma 90.3.8, first paragraph.

#### Artinianity of the algebraic pullback

`TauCeti.Coeff.Artinian.pullback_artinian` — lemma. Packet ID: `artinian-pullback-artinian`.

The equalizer P⊂A×B in the previous lemma is an Artinian ring.

Proof/construction: The product A×B has finite Λ-length, and its equalizer Λ-submodule has finite length. In particular P is Artinian as a Λ-module; apply the native scalar-tower theorem to obtain Artinianity as a ring.

Direct prerequisites: `artinian-finite-base-length`, `artinian-pullback-locality`, `mathlib:isArtinian_of_tower`.

Sources: [STACKS-06GH](https://stacks.math.columbia.edu/tag/06GH), Lemma 90.3.8, length paragraph.

#### Artinian coefficient pullbacks

`TauCeti.Coeff.Artinian.pullback` — construction. Packet ID: `artinian-pullback`.

Package the native algebraic equalizer P={(a,b)∈A×B:f(a)=g(b)} as Art_Λ(k), with residue q_A(a)=q_B(b), its two coefficient projections, and its categorical pullback property.

Proof/construction: Keep the actual equalizer ring and the inherited Λ-algebra structure. Use the preceding two lemmas to fill locality, labelled residue and Artinianity. Projection and pairing maps are the restrictions of the native product maps, with uniqueness by coordinate extensionality.

Direct prerequisites: `artinian-pullback-locality`, `artinian-pullback-artinian`.

Sources: [STACKS-06GH](https://stacks.math.columbia.edu/tag/06GH), Lemma 90.3.8.

Uses: Stacks 90.3.8–90.3.9; R03.2 — The ring-side pullbacks on which Schlessinger conditions are evaluated.; GlobalGaloisDeformations:R04.1 — Base changes of small extensions.

API:

- `TauCeti.Coeff.Artinian.pullbackFst` (projection): The coefficient morphism P→A.
- `TauCeti.Coeff.Artinian.pullbackSnd` (projection): The coefficient morphism P→B.
- `TauCeti.Coeff.Artinian.pullbackLift` (universal-property): Given h:D→A and i:D→B with f∘h=g∘i, their unique paired coefficient morphism D→P.
- `TauCeti.Coeff.Artinian.pullback_ext` (extensionality): Maps to P are equal when both projections agree.

Tests:

- `TauCeti.Coeff.Artinian.pullback_test_identity` (degenerate): The pullback of A→B along id_B is A, via the first projection.
- `TauCeti.Coeff.Artinian.pullback_test_dual` (small-case): (k⊕k)×_k(k⊕k) has a two-dimensional square-zero maximal ideal.
- `TauCeti.Coeff.Artinian.pullback_test_residue` (compatibility): The residue of a compatible pair equals the common coordinate residue and has kernel the maximal ideal.

#### Smallness survives Artinian pullback

`TauCeti.Coeff.Artinian.pullback_small` — lemma. Packet ID: `pullback-small-extension`.

If g:B→C is small and f:A→C is any Artinian coefficient morphism, then P=A×_C B→A is small.

Proof/construction: Surjectivity follows by lifting f(a) along g. The kernel consists of (0,b) with b∈ker g; this is an actual residue-linear identification with ker g. The maximal ideal annihilates it coordinatewise; apply the dimension-one characterization.

Direct prerequisites: `artinian-pullback`, `small-kernel-dimension`.

Sources: [STACKS-06GH](https://stacks.math.columbia.edu/tag/06GH), Lemma 90.3.8(2).

### Complete quotients and Artinian towers

#### Completeness of coefficient quotients

`TauCeti.Coeff.Complete.quotient_complete` — lemma. Packet ID: `complete-quotient-completeness`.

For A∈CNL_Λ(k) and any ideal I⊂m_A, A/I is complete and separated for its maximal ideal m_A/I.

Proof/construction: A/I is a finite A-module. The native finite-module completion equivalence and the complete-base equivalence identify it with its m_A-adic completion. The maximal ideal of the proper local quotient is the image of m_A; use the native image-ideal comparison.

Direct prerequisites: `complete-local-coefficient-category`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`, `mathlib:IsAdicComplete.map_algebraMap_iff`, `mathlib:AdicCompletion.ofAlgEquiv`.

Sources: [STACKS-0BNH](https://stacks.math.columbia.edu/tag/0BNH), Lemma 10.97.1 and Lemma 10.97.4.

#### Quotients in the complete coefficient category

`TauCeti.Coeff.Complete.quotient` — construction. Packet ID: `complete-quotient`.

For A∈CNL_Λ(k) and I⊂m_A, package the native ring A/I in CNL_Λ(k), with residue induced by q_A and the coefficient quotient map. The top ideal is excluded.

Proof/construction: Retain the native ideal quotient as the carrier. Factor the genuine residue map through I, and use its kernel and surjectivity to fix the quotient residue. Use native quotient Noetherianity and locality, and the preceding completeness lemma.

Direct prerequisites: `complete-quotient-completeness`, `morphism-is-local`, `mathlib:Ideal.Quotient.lift`.

Sources: [STACKS-06GV](https://stacks.math.columbia.edu/tag/06GV), Section 90.4, quotient objects and their topology.

Uses: Stacks 90.4; KW II §2.1 — Closed ideals in presentations and quotient representing rings.; LocalGaloisDeformationRings:R08.1 — Imposing deformation conditions by closed coefficient ideals.

API:

- `TauCeti.Coeff.Complete.quotientMk` (projection): The surjective coefficient morphism A→A/I.
- `TauCeti.Coeff.Complete.quotient_residue` (simp): Residue of the quotient class of a is q_A(a).
- `TauCeti.Coeff.Complete.quotientLift` (universal-property): A coefficient morphism killing I factors uniquely through A/I.

Tests:

- `TauCeti.Coeff.Complete.quotient_test_zero` (degenerate): Quotient by zero recovers A through the canonical equivalence.
- `TauCeti.Coeff.Complete.quotient_test_maximal` (small-case): Quotient by m_A is the labelled residue field k.
- `TauCeti.Coeff.Complete.quotient_test_proper` (non-example): There is no labelled k-residue quotient by the top ideal.

#### Positive maximal-ideal quotients are Artinian

`TauCeti.Coeff.Complete.truncation_artinian` — lemma. Packet ID: `positive-truncation-artinian`.

For A∈CNL_Λ(k) and n≥0, A/m_A^(n+1) is Artinian. Its maximal ideal has vanishing (n+1)-st power.

Proof/construction: Use quotient Noetherianity, the image description of its maximal ideal, and the vanishing maximal power. Apply the native Artinian/nilpotent maximal-ideal equivalence.

Direct prerequisites: `complete-quotient`, `artinian-coefficient-category-and-small-extensions`, `mathlib:isArtinianRing_iff_isNilpotent_maximalIdeal`.

Sources: [STACKS-06GW](https://stacks.math.columbia.edu/tag/06GW), Definition 90.4.1, completed category.

#### Artinian truncations of a complete object

`TauCeti.Coeff.Complete.truncation` — construction. Packet ID: `positive-truncation`.

Define A_n=A/m_A^(n+1), n≥0, as an actual Art_Λ(k) object, with the canonical coefficient maps A→A_n and A_j→A_i for i≤j. These form the positive-power Artinian quotient tower.

Proof/construction: Use the actual complete quotient carrier and add the Artinian proof. The inequality m_A^(j+1)⊂m_A^(i+1) supplies the native quotient transition map. The transition identity and composition laws follow by evaluating on quotient classes.

Direct prerequisites: `positive-truncation-artinian`, `complete-quotient`.

Sources: [STACKS-06GV](https://stacks.math.columbia.edu/tag/06GV), Section 90.4, compatible quotient systems.

Uses: Stacks 90.4.1–90.4.2 — Recover complete objects and morphisms from Artinian quotients.; GlobalGaloisDeformations:R04.1; R03.4 — Compatible representation lifts and power-series framing lifts.

API:

- `TauCeti.Coeff.Complete.truncationMk` (projection): The coefficient map A→A_n.
- `TauCeti.Coeff.Complete.truncationTransition` (functoriality): For i≤j the surjective residue-preserving map A_j→A_i.
- `TauCeti.Coeff.Complete.truncationTransition_comp` (simp): Transition maps compose according to the order on indices.

Tests:

- `TauCeti.Coeff.Complete.truncation_test_zero` (degenerate): A_0 is k, rather than the zero ring.
- `TauCeti.Coeff.Complete.truncation_test_artinian` (compatibility): Every A_n has its native Artinian-ring structure.
- `TauCeti.Coeff.Complete.truncation_test_square_zero` (small-case): The kernel of A_(n+1)→A_n is square-zero for all n≥0; it need not be one-dimensional.

#### Complete rings as inverse limits of Artinian quotients

`TauCeti.Coeff.Complete.truncation_limit` — theorem. Packet ID: `artinian-quotient-limit`.

For A∈CNL_Λ(k), the canonical map A→lim_n A/m_A^(n+1) is an isomorphism of labelled Λ-algebras and a homeomorphism for the maximal-ideal topology. The inverse limit is the actual compatible-sequence ring.

Proof/construction: Use the native completion equivalence, whose data are compatible quotient sequences. Adding or removing its initial zero-ring coordinate is uniquely determined and does not affect the limit. The preimages of quotient kernels are exactly m_A^(n+1), so the equivalence identifies the topology bases.

Direct prerequisites: `positive-truncation`, `mathlib:AdicCompletion.of_bijective`, `mathlib:AdicCompletion.ofAlgEquiv`, `mathlib:Ideal.hasBasis_nhds_zero_adic`.

Sources: [STACKS-06GW](https://stacks.math.columbia.edu/tag/06GW), Definition 90.4.1 and complete-ring convention.

#### Maps to Artinian rings factor through a truncation

`TauCeti.Coeff.Complete.factor_artinian` — lemma. Packet ID: `quotient-factor-artinian`.

Every coefficient morphism A→B with A complete and B Artinian factors through some A_n, and this factor is unique once n is fixed and m_A^(n+1) lies in its kernel.

Proof/construction: The target maximal ideal is nilpotent; the coefficient morphism sends each source maximal-ideal power into the matching target power. Choose a vanishing target power and apply the actual quotient universal property.

Direct prerequisites: `morphism-continuous`, `positive-truncation`, `artinian-surjection-nilpotent`.

Sources: [STACKS-06GV](https://stacks.math.columbia.edu/tag/06GV), Section 90.4, finite-level maps.

### Relative cotangent spaces and derivations

#### The labelled residue action on annihilated modules

`TauCeti.Coeff.Local.residueModule` — construction. Packet ID: `labelled-residue-module`.

If A∈Local_Λ(k), M is an A-module and m_A M=0, descend the action along the actual labelled quotient q_A to a k-module: c·v=a·v for any lift a with q_A(a)=c. This agrees with the native A/m_A quotient action transported through A/m_A≃k.

Proof/construction: Use a residue lift to define the scalar action; any two lifts differ by m_A and therefore act equally. The module identities follow by lifting sums, products and one and using the existing A-module identities. The labelled quotient equivalence identifies this construction with the native quotient scalar action.

Direct prerequisites: `labelled-local-algebra`, `mathlib:RingHom.quotientKerEquivOfSurjective`.

Sources: [STACKS-06GE](https://stacks.math.columbia.edu/tag/06GE), Lemma 90.3.3, annihilated kernel.

Uses: Stacks 90.3.3 and KW II §2.1 — Kernel dimensions, relative cotangent duals and derivations.

API:

- `TauCeti.Coeff.Local.residueModule_smul` (simp): If q_A(a)=c then c·v=a·v.
- `TauCeti.Coeff.Local.residueModule_independent` (characterisation): Changing the chosen residue lift does not change the scalar action.
- `TauCeti.Coeff.Local.residueModule_tower` (compatibility): The original A-action and the k-action form a scalar tower through q_A.

Tests:

- `TauCeti.Coeff.Local.residueModule_test_zero` (degenerate): The zero module receives its unique scalar action.
- `TauCeti.Coeff.Local.residueModule_test_residue` (compatibility): For M=k with the q_A action, the descended action is ordinary field multiplication.
- `TauCeti.Coeff.Local.residueModule_test_difference` (characterisation): Two lifts of the same residue act equally on M.

#### Relative coefficient cotangent spaces

`TauCeti.Coeff.RelativeCotangent` — definition. Packet ID: `relative-cotangent`.

For a coefficient morphism f:A→B, define t*_(B/A)=m_B/(f(m_A)B+m_B²), meaning the quotient of the B-submodule m_B by the preimage of the displayed ideal. Its k-action is descended through q_B. This is the relative local cotangent space, not the full algebraic differential module for an arbitrary residue extension.

Proof/construction: Use the actual native submodule quotient of m_B, with denominator pulled back along its inclusion in B. Multiplication by m_B kills this quotient, so the preceding labelled action applies. Map the native absolute cotangent space of B onto the relative quotient.

Direct prerequisites: `morphism-maximal-comap`, `labelled-residue-module`, `mathlib:Ideal.Cotangent`.

Sources: [STACKS-06GB](https://stacks.math.columbia.edu/tag/06GB), Definition 90.3.6, corrected orientation.

Uses: KW II §2.1; Stacks 90.4.2–90.4.5 — Minimal presentations and the tangent-space description of maps to dual numbers.; R03.2 — Finite tangent spaces of represented deformation functors.

API:

- `TauCeti.Coeff.RelativeCotangent.mk` (constructor): The relative class of an element of m_B.
- `TauCeti.Coeff.RelativeCotangent.mk_eq_zero` (characterisation): The class of b vanishes exactly when b lies in f(m_A)B+m_B².
- `TauCeti.Coeff.RelativeCotangent.map` (functoriality): Commuting coefficient morphism squares induce k-linear maps on relative cotangent spaces.

Tests:

- `TauCeti.Coeff.RelativeCotangent.test_identity` (degenerate): t*_(A/A)=0.
- `TauCeti.Coeff.RelativeCotangent.test_split` (small-case): t*_(k⊕kⁿ/k)=kⁿ, with the induced coordinate classes.
- `TauCeti.Coeff.RelativeCotangent.test_base_parameter` (non-example): For the identity Λ→Λ, a base uniformizer contributes no relative tangent direction although the absolute cotangent need not vanish.

#### Relative cotangent finiteness

`TauCeti.Coeff.RelativeCotangent.finite` — lemma. Packet ID: `relative-cotangent-finite`.

For a coefficient morphism with Noetherian local target B, the labelled relative cotangent space is finite dimensional over k.

Proof/construction: The relative space is the quotient of the native absolute cotangent of B by the image of the base maximal ideal. Transport the native residue-field scalar structure along the labelled residue equivalence and use quotient finiteness.

Direct prerequisites: `relative-cotangent`, `mathlib:IsLocalRing.CotangentSpace`.

Sources: [STACKS-06SC](https://stacks.math.columbia.edu/tag/06SC), Lemma 90.4.5, finite basis paragraph.

#### Cotangent criterion for surjectivity

`TauCeti.Coeff.Hom.surjective_iff_relative` — theorem. Packet ID: `relative-cotangent-surjectivity`.

For f:A→B in CNL_Λ(k), f is surjective if and only if its induced map t*_(A/Λ)→t*_(B/Λ) is surjective. Equivalently, m_B=f(m_A)B.

Proof/construction: Relative cotangent surjectivity gives m_B=f(m_A)B+m_B²; finite generation of m_B and Nakayama remove m_B². The residue labels identify B/f(m_A)B with k and make the induced map A→this quotient surjective. Use native adic surjectivity with source ideal m_A: A is precomplete and B is separated for the proper ideal f(m_A)B. The converse follows by lifting representatives of maximal-ideal and cotangent classes.

Direct prerequisites: `relative-cotangent-finite`, `complete-local-coefficient-category`, `mathlib:IsLocalRing.CotangentSpace.span_image_eq_top_iff`, `mathlib:surjective_of_mk_map_comp_surjective`, `mathlib:IsHausdorff.of_isLocalRing`.

Sources: [STACKS-06GZ](https://stacks.math.columbia.edu/tag/06GZ), Lemma 90.4.2.

#### Relative derivations from the labelled cotangent space

`TauCeti.Coeff.RelativeCotangent.dual_derivations` — theorem. Packet ID: `cotangent-dual-derivations`.

For A→B in CNL_Λ(k), restriction to m_B gives a k-linear equivalence Der_A(B,k)≃Hom_k(m_B/(m_AB+m_B²),k). The B-action on k is the labelled residue map. No exact formula a=Σa_ix_i in B is used: only congruence modulo m_AB+m_B² is needed.

Proof/construction: An A-derivation kills m_AB and m_B² because its target has the residue action. For the reverse map, use the surjective base residue map to subtract a coefficient lift from b, and apply the functional to the remaining maximal-ideal class. Independence of the coefficient lift and the Leibniz rule follow modulo the displayed ideal.

Direct prerequisites: `relative-cotangent`, `labelled-residue-module`, `mathlib:Derivation`.

Sources: [STACKS-06SD](https://stacks.math.columbia.edu/tag/06SD), Lemma90.4.6, derivation construction in the proof.

#### Cotangent spaces of a completed tensor product

`TauCeti.Coeff.Complete.tensor_cotangent` — theorem. Packet ID: `tensor-cotangent-direct-sum`.

For B,C in CNL_Λ(k), the inclusions induce a k-linear isomorphism t*_(B/Λ)⊕t*_(C/Λ)≃t*_((B completedTensor_Λ C)/Λ). Its dual identifies relative derivations with pairs of relative derivations.

Proof/construction: A derivation to k is equivalently a lift of the residue map to the native dual-number object over k. Apply the local tensor pushout to identify such lifts with the two factor lifts over Λ. Finite dimensionality of the three cotangent spaces turns the dual comparison into the asserted direct-sum isomorphism.

Direct prerequisites: `tensor-coefficient-pushout`, `cotangent-dual-derivations`, `relative-cotangent`, `relative-cotangent-finite`.

Sources: [KW-II-09](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §2.1, p.6, tensor tangent paragraph.

### Continuous coefficient power series

#### The maximal ideal of a coefficient power-series ring

`TauCeti.Coeff.Complete.powerSeries_maximalIdeal` — lemma. Packet ID: `maximal-series-ideal`.

For A∈CNL_Λ(k) and finite n, m_(A[[X_1,…,X_n]])=m_A·A[[X]]+(X_1,…,X_n), with residue ρ_A∘constantCoeff.

Proof/construction: Use the native power-series unit criterion to identify the nonunit maximal ideal as series with constant coefficient in m_A. Subtract the constant series; a series with constant coefficient zero is in the ideal generated by the finitely many variables. Conversely both displayed summands have residue zero.

Direct prerequisites: `complete-local-coefficient-category`, `mathlib:MvPowerSeries.isUnit_iff_constantCoeff`, `mathlib:MvPowerSeries.mem_map_C_iff_of_fg`.

Sources: [STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF), Lemma 90.8.6, polynomial-series presentation.

#### Coefficientwise and maximal-ideal series topologies

`TauCeti.Coeff.Complete.powerSeries_topology` — lemma. Packet ID: `maximal-series-topology`.

For A∈CNL_Λ(k) and finite n, the maximal-ideal adic topology on A[[X_1,…,X_n]] equals the native coefficientwise product topology with each coefficient carrying the m_A-adic topology. Thus the series ring is complete and separated for its maximal ideal.

Proof/construction: Modulo m_series^r only coefficients of total degree less than r matter, and the coefficient of degree d<r is constrained modulo m_A^(r−d). There are finitely many such monomials for finite n; these constraints give a product-topology neighbourhood. For a finite collection of coefficient congruences choose r larger than their degree-plus-required-exponent bounds to obtain the reverse neighbourhood containment. Native products of complete separated coefficient spaces are complete; translate this into adic completeness.

Direct prerequisites: `maximal-series-ideal`, `mathlib:Ideal.hasBasis_nhds_zero_adic`, `mathlib:MvPowerSeries.WithPiTopology.continuous_coeff`, `mathlib:IsAdicComplete`, `mixed-adic-series-membership`.

Sources: [STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF), Lemma 90.8.6, completion and inverse-limit proof.

#### Coefficient power-series algebras

`TauCeti.Coeff.Complete.powerSeries` — construction. Packet ID: `coefficient-power-series`.

For A∈CNL_Λ(k) and n≥0, package the native finite-variable power-series ring A[[Fin n]] as CNL_Λ(k), with its genuine constant-coefficient residue and inherited Λ-action.

Proof/construction: Keep the native MvPowerSeries carrier, Noetherianity and local ring structure. Compose constantCoeff with the actual residue map; the maximal-ideal formula verifies its kernel. Use the preceding topology/completeness comparison.

Direct prerequisites: `maximal-series-ideal`, `maximal-series-topology`.

Sources: [STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF), Lemma 90.8.6.

Uses: KW II §2.1; LLHLM20 patching rings; BCGP25 §1.8.2 — Finite-variable presentations and framing variables.; R03.4 — Power-series enlargement of a finite unframed ring.

API:

- `TauCeti.Coeff.Complete.powerSeriesC` (constructor): The local coefficient inclusion A→A[[X]].
- `TauCeti.Coeff.Complete.powerSeriesX` (data): The n variable elements, each in the maximal ideal.
- `TauCeti.Coeff.Complete.powerSeries_residue` (simp): Residue is the labelled residue of constantCoeff.

Tests:

- `TauCeti.Coeff.Complete.powerSeries_test_empty` (degenerate): At n=0 the coefficient inclusion is an isomorphism.
- `TauCeti.Coeff.Complete.powerSeries_test_variable` (small-case): Every variable has residue zero; the constant series 1 has residue 1.
- `TauCeti.Coeff.Complete.powerSeries_test_nonartinian` (non-example): For coefficient field k and n=1, the object is complete and Noetherian but not Artinian.

#### Local continuous power-series evaluation

`TauCeti.Coeff.Complete.powerSeriesEval` — construction. Packet ID: `local-series-evaluation`.

For f:A→B in CNL_Λ(k) and x:Fin n→m_B, define the unique continuous coefficient morphism A[[Fin n]]→B restricting to f and sending X_i to x_i. Native evaluation uses the coefficientwise topology just identified with the maximal-ideal topology.

Proof/construction: For x_i∈m_B, the powers x_i^r tend to zero; finite n makes the cofinite-family condition automatic. Apply the native evaluation ring homomorphism to the continuous underlying f; its base compatibility follows on constant series. The residue of each variable is zero, so the evaluation preserves the labelled residue; uniqueness follows from the native density theorem.

Direct prerequisites: `coefficient-power-series`, `morphism-continuous`, `mathlib:MvPowerSeries.eval₂Hom`, `mathlib:MvPowerSeries.aeval_unique`, `tauceti:MvPowerSeries.hasEval_of_mem`, `tauceti:MvPowerSeries.eval₂_sub_constantCoeff_mem`.

Sources: [STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF), Lemma 90.8.6, chosen variables and lift.

Uses: Stacks 90.8.6; KW II §2.1 — Complete presentations and inductively compatible Artinian maps.; R03.4 — Continuous framing maps for characteristic-zero-point constructions.

API:

- `TauCeti.Coeff.Complete.powerSeriesEval_C` (simp): Evaluation of a constant series is f(a).
- `TauCeti.Coeff.Complete.powerSeriesEval_X` (simp): Evaluation of X_i is x_i.
- `TauCeti.Coeff.Complete.powerSeriesEval_unique` (universal-property): A continuous coefficient morphism with the same restriction and variable values equals this evaluation.

Tests:

- `TauCeti.Coeff.Complete.powerSeriesEval_test_empty` (degenerate): Evaluation with no variables is f under the zero-variable coefficient equivalence.
- `TauCeti.Coeff.Complete.powerSeriesEval_test_zero` (small-case): Evaluation of all variables at zero is f composed with constantCoeff.
- `TauCeti.Coeff.Complete.powerSeriesEval_test_one_excluded` (non-example): No local coefficient evaluation can send a variable to 1.

#### Relative cotangent coordinates of a series ring

`TauCeti.Coeff.Complete.powerSeries_cotangent` — lemma. Packet ID: `series-cotangent-basis`.

For A∈CNL_Λ(k), the relative cotangent t*_(A[[Fin n]]/A) has the basis given by the variable classes and is canonically kⁿ.

Proof/construction: The maximal-ideal formula kills the coefficient part in the relative quotient. All monomials of degree at least two vanish in the quotient. The degree-one coefficient maps modulo m_A are inverse to the variable-class coordinate map.

Direct prerequisites: `coefficient-power-series`, `relative-cotangent`, `maximal-series-ideal`.

Sources: [STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF), Lemma 90.8.6, relative cotangent basis.

#### Finite power-series presentations

`TauCeti.Coeff.Complete.powerSeries_presentation` — theorem. Packet ID: `series-presentation`.

For f:A→B in CNL_Λ(k), choose finitely many x_i∈m_B whose classes span t*_(B/A). Then the continuous evaluation A[[X_1,…,X_n]]→B is surjective. In particular every B has a finite Λ-power-series quotient presentation.

Proof/construction: The source relative cotangent basis maps to the chosen spanning classes. Apply the cotangent criterion to the evaluation morphism. For the final assertion use the base coefficient object Λ and finite dimensionality of the relative cotangent.

Direct prerequisites: `local-series-evaluation`, `series-cotangent-basis`, `relative-cotangent-surjectivity`, `relative-cotangent-finite`.

Sources: [STACKS-032A](https://stacks.math.columbia.edu/tag/032A), Theorem 10.160.8, final paragraph.

#### Weighted coefficient membership in maximal powers

`TauCeti.Coeff.Complete.powerSeries_pow_membership` — lemma. Packet ID: `mixed-adic-series-membership`.

For A∈CNL_Λ(k), n,r≥0 and F∈A[[Fin n]], F belongs to m_series^r if and only if each coefficient of total degree d<r belongs to m_A^(r−d). Coefficients of degree at least r are unrestricted.

Proof/construction: Expand (m_A·A[[X]]+(X))^r by the binomial formula for commuting ideals. Use the native finitely-generated coefficient-ideal membership theorem for m_A^j. Use the imported variable-ideal-power/order comparison for the degree cutoff, and group the finitely many low-degree terms.

Direct prerequisites: `maximal-series-ideal`, `mathlib:MvPowerSeries.mem_map_C_iff_of_fg`, `DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order`.

Sources: [STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF), Lemma 90.8.6, finite power-series rings.

### Noetherian completion by graded lifting

#### Noetherianity of the associated graded ring

`TauCeti.Coeff.Completion.graded_noetherian` — lemma. Packet ID: `graded-noetherian-from-finite-ideal`.

Additional setting: R is a commutative ring; I is finitely generated; R/I is Noetherian.

Let R be any commutative ring and I a finitely generated ideal with R/I Noetherian. The imported associated graded ring Gr_I(R) is Noetherian. R itself need not be Noetherian.

Proof/construction: Choose finitely many ideal generators of I. The imported degree-one-generation theorem gives a surjection from a finite-variable polynomial ring over R/I to Gr_I(R). Use native Hilbert basis and quotient Noetherianity.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-ring`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-chosen-degree-one-generation`.

Sources: [STACKS-05GH](https://stacks.math.columbia.edu/tag/05GH), Lemma 10.97.5, associated-graded paragraph.

#### Coefficient correction from finite initial generators

`TauCeti.Coeff.Completion.correction_sequence` — lemma. Packet ID: `completion-correction-sequence`.

Additional setting: T is a commutative ring; J is an ideal; T is J-adically complete and separated; the displayed approximation property is given.

Let T be complete and separated for J, and let g_1,…,g_s∈T with orders d_i≥0. Suppose an ideal K has the following approximation property: for every r≥0 and z∈K∩J^r, there are a_i∈J^max(r−d_i,0) such that z−Σa_i g_i∈K∩J^(r+1). Then each z∈K admits sequences a_i(r) with corrections a_i(r+1)−a_i(r)∈J^max(r−d_i,0) and z−Σa_i(r)g_i∈J^r.

Proof/construction: Start with zero coefficients and residual z at level zero. At each stage apply the stated approximation property to the current residual and add its finite correction to the coefficients. Ideal closure retains the residual in K; the next-power approximation gives the induction invariant.

Direct prerequisites: `mathlib:IsAdicComplete`.

Sources: [STACKS-05GH](https://stacks.math.columbia.edu/tag/05GH), Lemma 10.97.5, successive approximation proof.

#### Convergent corrections generate the ideal

`TauCeti.Coeff.Completion.generated_of_corrections` — lemma. Packet ID: `completion-correction-limit`.

Additional setting: The hypotheses of completion-correction-sequence hold and every chosen generator belongs to K.

Under the preceding approximation property, K is the ideal generated by the g_i, provided g_i∈K.

Proof/construction: For fixed i and exponent e, all sufficiently late coefficient increments lie in J^e, so the coefficients form J-adic Cauchy sequences. Completeness gives their limits b_i. Multiplication by each fixed g_i and the finite sum preserve congruences. The residual lies in every J-power; separatedness gives z=Σb_i g_i. The opposite ideal containment uses g_i∈K.

Direct prerequisites: `completion-correction-sequence`, `mathlib:IsAdicComplete`.

Sources: [STACKS-05GH](https://stacks.math.columbia.edu/tag/05GH), Lemma 10.97.5, coefficient limits.

#### Noetherian completion from a finite ideal

`TauCeti.Coeff.Completion.noetherian` — theorem. Packet ID: `completion-noetherian`.

Additional setting: R is commutative; I is finitely generated; R/I is Noetherian.

For any commutative R and finitely generated I with R/I Noetherian, the native I-adic completion of R is a Noetherian ring. No Noetherianity or separatedness is assumed on R.

Proof/construction: Native completion preserves the finite-power quotients, so its associated graded ring is Gr_I(R). By the requested homogeneous-initial-ideal interface, every ideal of the completed ring has finitely many lifted initial generators with the approximation property. Apply the coefficient-correction limit lemma to prove that every ideal is finitely generated.

Direct prerequisites: `graded-noetherian-from-finite-ideal`, `completion-correction-limit`, `mathlib:AdicCompletion.isAdicComplete`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

Sources: [STACKS-05GH](https://stacks.math.columbia.edu/tag/05GH), Lemma 10.97.5.

### Completed coefficient coproducts

#### The residue quotient of the ordinary tensor product

`TauCeti.Coeff.Complete.tensor_residue` — lemma. Packet ID: `tensor-residue-quotient`.

For A,B∈CNL_Λ(k), let T=A⊗_Λ B and J=m_A·T+m_B·T using the two native inclusions. Then T/J≃k as labelled Λ-algebras, through a⊗b↦q_A(a)q_B(b); J is finitely generated and maximal.

Proof/construction: The two residue algebra maps give the displayed tensor homomorphism to k. Quotient by the two maximal-ideal images identifies T/J with k⊗_Λ k; since Λ→k is surjective the multiplication map is an isomorphism. Transport finitely many generators of each maximal ideal through the two tensor inclusions to prove finite generation of J.

Direct prerequisites: `complete-local-coefficient-category`, `morphism-continuous`, `mathlib:Algebra.TensorProduct.lift`.

Sources: [STACKS-06H1](https://stacks.math.columbia.edu/tag/06H1), Lemma 90.4.4, completed tensor product.

#### Local Noetherianity of the completed coefficient tensor

`TauCeti.Coeff.Complete.tensor_local_noetherian` — lemma. Packet ID: `tensor-local-noetherian`.

The imported adic completed tensor product of A,B∈CNL_Λ(k), completed for J=m_A T+m_B T, is Noetherian, local, and complete for its maximal ideal J times the completed ring, with residue k. No Λ-flatness is required.

Proof/construction: The residue quotient is the field k and J is finitely generated. Apply the generic completion-Noetherian theorem with T/J=k; its hypothesis is weaker than T Noetherian. Use native completion quotient comparison, J-completeness and the complete-maximal-ideal local criterion.

Direct prerequisites: `tensor-residue-quotient`, `completion-noetherian`, `AdicSpacesPartII:F0/completed-tensor-product-adic`, `mathlib:isLocalRing_of_isAdicComplete_maximal`.

Sources: [STACKS-06H1](https://stacks.math.columbia.edu/tag/06H1), Lemma 90.4.4.

#### Completed coefficient tensor products

`TauCeti.Coeff.Complete.tensor` — construction. Packet ID: `complete-coefficient-tensor`.

For A,B∈CNL_Λ(k), package the existing AdicSpacesPartII:F0 completed tensor product for the two maximal ideals as CNL_Λ(k). Its actual underlying ring is the native J-adic completion of A⊗_Λ B; its residue is the extension of q_A(a)q_B(b).

Proof/construction: Use the imported adic construction without changing its ring or topology. Fill the coefficient object fields with the preceding local, Noetherian and residue calculations. The two imported canonical inclusions become coefficient morphisms because their residue maps are the chosen q_A and q_B.

Direct prerequisites: `tensor-local-noetherian`, `AdicSpacesPartII:F0/completed-tensor-product-adic`.

Sources: [STACKS-06H1](https://stacks.math.columbia.edu/tag/06H1), Lemma 90.4.4.

Uses: KW II §2.1; Stacks 90.4.4; LLHLM20/23 and BCGP patching coefficient rings — Fixed-residue local coproducts and finite families of local deformation factors.; LocalGaloisDeformationRings:R08.1; GlobalGaloisDeformations:R04.1 — Local-to-global coefficient constructions.

API:

- `TauCeti.Coeff.Complete.tensorInl` (constructor): The coefficient inclusion A→A⊗̂_Λ B.
- `TauCeti.Coeff.Complete.tensorInr` (constructor): The coefficient inclusion B→A⊗̂_Λ B.
- `TauCeti.Coeff.Complete.tensorLift` (universal-property): A pair of coefficient maps A→D←B gives its unique coefficient map from the completed tensor.
- `TauCeti.Coeff.Complete.tensor_residue_tmul` (simp): Residue of the completed image of a⊗b is q_A(a)q_B(b).

Tests:

- `TauCeti.Coeff.Complete.tensor_test_base` (degenerate): Λ⊗̂_Λ A≃A as labelled complete coefficient objects.
- `TauCeti.Coeff.Complete.tensor_test_series` (small-case): Λ[[X]]⊗̂_Λ Λ[[Y]]≃Λ[[X,Y]], with maximal ideal (m_Λ,X,Y).
- `TauCeti.Coeff.Complete.tensor_test_artinian` (compatibility): For Artinian A,B the completion is the ordinary tensor product, since the sum maximal ideal is nilpotent.

#### The coefficient-category coproduct property

`TauCeti.Coeff.Complete.tensor_pushout` — theorem. Packet ID: `tensor-coefficient-pushout`.

For A,B,D∈CNL_Λ(k), coefficient maps A⊗̂_Λ B→D are in natural bijection with pairs of coefficient maps A→D and B→D. This proves the tensor is their coproduct in CNL_Λ(k).

Proof/construction: Apply the imported continuous universal property. A paired local residue-preserving map sends J into m_D and induces multiplication on the common residue field, so its completed extension is a coefficient morphism. Uniqueness in the imported adic universal property gives uniqueness in the coefficient category.

Direct prerequisites: `complete-coefficient-tensor`, `morphism-continuous`, `AdicSpacesPartII:F0/completed-tensor-product-adic`.

Sources: [STACKS-06H1](https://stacks.math.columbia.edu/tag/06H1), Lemma 90.4.4.

#### Symmetry of completed coefficient tensors

`TauCeti.Coeff.Complete.tensor_symm` — lemma. Packet ID: `tensor-symmetry`.

There is a canonical residue-preserving continuous Λ-algebra equivalence A⊗̂_Λ B≃B⊗̂_Λ A interchanging the two inclusions.

Proof/construction: Construct both maps from the two exchanged pairs of inclusions. Their composites fix both inclusions; coproduct uniqueness makes them identities.

Direct prerequisites: `tensor-coefficient-pushout`.

Sources: [STACKS-06H1](https://stacks.math.columbia.edu/tag/06H1), Lemma 90.4.4, coproduct property.

#### Associativity of completed coefficient tensors

`TauCeti.Coeff.Complete.tensor_assoc` — lemma. Packet ID: `tensor-associativity`.

There is a canonical residue-preserving continuous Λ-algebra equivalence (A⊗̂_Λ B)⊗̂_Λ C≃A⊗̂_Λ(B⊗̂_Λ C), compatible with all three inclusions. Together with the unit Λ it defines unambiguous finite iterated tensor products.

Proof/construction: Apply the coproduct property twice to both parenthesizations: each represents triples of coefficient maps. The two induced maps are inverse by uniqueness on the three inclusions.

Direct prerequisites: `tensor-coefficient-pushout`.

Sources: [STACKS-06H1](https://stacks.math.columbia.edu/tag/06H1), Lemma 90.4.4, coproduct property.

#### Joint-variable presentations of completed tensors

`TauCeti.Coeff.Complete.tensor_presentation` — theorem. Packet ID: `tensor-presentation`.

If A≃Λ[[X_1,…,X_r]]/I and B≃Λ[[Y_1,…,Y_s]]/K as labelled coefficient quotients, then A⊗̂_Λ B≃Λ[[X,Y]]/(I·Λ[[X,Y]]+K·Λ[[X,Y]]) with the joint maximal-ideal topology.

Proof/construction: Use local series evaluation to send the joint variables into the two tensor factors. The two displayed ideals vanish, so the map factors through the actual complete quotient. Conversely the joint-variable quotient receives compatible maps from both factors; apply the tensor universal property. Check the composites on coefficients and every variable, using evaluation uniqueness and the two inclusions.

Direct prerequisites: `series-presentation`, `complete-quotient`, `local-series-evaluation`, `tensor-coefficient-pushout`.

Sources: [STACKS-06SB](https://stacks.math.columbia.edu/tag/06SB), Lemma 90.4.3, pushouts.

#### A finite factor needs no tensor completion

`TauCeti.Coeff.Complete.tensor_finite_factor` — theorem. Packet ID: `finite-factor-tensor-comparison`.

Additional setting: A,B∈CNL_Λ(k); A is finite over Λ.

For A,B∈CNL_Λ(k), if A is finite as a Λ-module, the canonical map A⊗_Λ B→A⊗̂_Λ B is an isomorphism. No Λ-flatness is needed.

Proof/construction: A⊗_Λ B is a finite B-module and therefore complete for m_B. The closed fibre A/m_ΛA is finite-dimensional local over k, so its maximal ideal is nilpotent. Hence J=m_AT+m_BT and m_BT have cofinal powers. Completeness and separatedness identify the imported completion with T.

Direct prerequisites: `complete-coefficient-tensor`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`.

Sources: [STACKS-0BNH](https://stacks.math.columbia.edu/tag/0BNH), Lemmas 10.97.1 and 10.97.4, finite-module completion.

#### Exact tensoring of finite coefficient modules

`TauCeti.Coeff.Complete.tensor_finite_exact` — theorem. Packet ID: `completed-tensor-finite-exactness`.

Additional setting: Λ is complete Noetherian local; B∈CNL_Λ(k) is Λ-flat; all three modules are finite over Λ.

Let B∈CNL_Λ(k) be Λ-flat. For a short exact sequence of finite Λ-modules, tensoring with B remains short exact and produces finite B-modules, already complete for m_B. Thus finite-factor completed tensoring is exact.

Proof/construction: Native tensor right exactness and the flat injectivity theorem give the short exact sequence. Finite generation ascends natively. Finite modules over the complete Noetherian local B are complete; use the preceding finite-factor comparison in ring examples.

Direct prerequisites: `finite-factor-tensor-comparison`, `mathlib:Module.Finite.base_change`, `mathlib:Module.Flat.lTensor_preserves_injective_linearMap`.

Sources: [STACKS-0BNH](https://stacks.math.columbia.edu/tag/0BNH), Lemma 10.97.2, exactness and flatness.

### Completion of flat algebras

#### Artin–Rees after flat tensoring

`TauCeti.Coeff.Completion.flat_artin_rees` — lemma. Packet ID: `flat-tensor-artin-rees-cofinality`.

Additional setting: R is Noetherian; S is an R-flat commutative R-algebra; the displayed finite-module short exact sequence is given.

Let R be Noetherian, I an ideal, S any flat R-algebra and 0→M₁→M₂→M₃→0 an exact sequence of finite R-modules. There is c≥0 such that, for n≥c, the sequence 0→(M₁/I^(n−c)N)⊗_R S→(M₂/I^nM₂)⊗_R S→(M₃/I^nM₃)⊗_R S→0 is exact, where N=M₁∩I^cM₂; I^nM₁⊆I^(n−c)N⊆I^(n−c)M₁.

Proof/construction: Apply the native Artin–Rees theorem to the finite submodule M₁ of M₂ to obtain equality M₁∩I^nM₂=I^(n−c)(M₁∩I^cM₂) for n≥c. The quotient sequence with the induced intersection filtration is exact. Tensor it with flat S. The two power containments follow from N⊆M₁ and I^cM₁⊆N; thus its left-hand filtration is cofinal with the usual I-adic one.

Direct prerequisites: `mathlib:Ideal.exists_pow_inf_eq_pow_smul`, `mathlib:Module.Finite`.

Sources: [ANDRE-18](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), Lemma 1.1.1, printed p.75.

#### Exactness of completion after flat base change

`TauCeti.Coeff.Completion.flat_finite_exact` — lemma. Packet ID: `flat-completion-finite-exact`.

Additional setting: The hypotheses of flat-tensor-artin-rees-cofinality.

Under the preceding hypotheses, I-adic completion of the tensor sequence is short exact: 0→completion(M₁⊗_R S)→completion(M₂⊗_R S)→completion(M₃⊗_R S)→0. S need not be Noetherian or separated.

Proof/construction: The inverse systems from the shifted Artin–Rees sequence have surjective transitions. Apply the requested countable Mittag–Leffler exactness interface. Cofinality identifies the shifted first limit with the native completion of M₁⊗S.

Direct prerequisites: `flat-tensor-artin-rees-cofinality`, `EnhancedDerivedSheaves:E2`.

Sources: [ANDRE-18](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), Lemma 1.1.1, printed pp.75–76.

#### Finite modules commute with flat-algebra completion

`TauCeti.Coeff.Completion.flat_finite_compare` — theorem. Packet ID: `flat-completion-finite-comparison`.

Additional setting: R is Noetherian; S is R-flat; M is finite over R.

Let R be Noetherian, I an ideal and S an arbitrary flat R-algebra. For finite M, the canonical S-linear map M⊗_R completion_I(S)→completion_I(M⊗_R S) is bijective. No finiteness, Noetherianity or separatedness is assumed on S.

Proof/construction: Choose a finite presentation of M over Noetherian R. Finite free tensor modules commute with completion by the native finite-product completion equivalence. Apply the exactness lemma to the presentation and identify both cokernels; the canonical map is the resulting comparison.

Direct prerequisites: `flat-completion-finite-exact`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`.

Sources: [ANDRE-18](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), Lemma 1.1.1, printed p.76.

#### Completion of an arbitrary flat algebra

`TauCeti.Coeff.Completion.flat_algebra` — theorem. Packet ID: `flat-algebra-completion`.

Additional setting: R is Noetherian; I is an ideal; S is any flat R-algebra.

For R Noetherian, I an ideal and S any R-flat R-algebra, the native I-adic completion of the R-module S is R-flat; its ring structure is the completion for I·S. S need not be Noetherian, finite, complete or separated.

Proof/construction: Apply the finite-module comparison to a finite ideal of R and to R. Completed tensor exactness preserves the inclusion of that ideal into R. The native finite-ideal tensor criterion proves flatness. The I-module and I·S-ring quotients are identical.

Direct prerequisites: `flat-completion-finite-exact`, `flat-completion-finite-comparison`, `mathlib:Module.Flat.iff_lTensor_injective'`.

Sources: [ANDRE-18](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), Lemma 1.1.1, printed pp.75–76.

#### Faithful flatness after completion

`TauCeti.Coeff.Completion.faithful_algebra` — theorem. Packet ID: `faithful-flat-algebra-completion`.

Additional setting: R is Noetherian; S is faithfully flat over R; I⊆Jac(R).

Under flat-algebra-completion, if S is faithfully flat and I⊆Jac(R), then completion_I(S) is faithfully flat over R.

Proof/construction: For every maximal ideal m⊇I, completion_I(S)/m completion_I(S)≃S/mS, using finite-module comparison and the completion quotient calculation. S/mS is nonzero by faithfulness. The native proper-ideal criterion, with the established flatness, proves faithfulness.

Direct prerequisites: `flat-algebra-completion`, `mathlib:Module.FaithfullyFlat.iff_flat_and_proper_ideal`, `mathlib:AdicCompletion.isAdicComplete`.

Sources: [ANDRE-18](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), Lemma 1.1.1, printed p.76.

### Arbitrary residue-field extensions

#### Flat local extension for one residue generator

`TauCeti.Coeff.ResidueExtension.monogenic` — lemma. Packet ID: `monogenic-residue-extension`.

Additional setting: R is a local commutative ring with residue k; K/k is a field extension; α∈K.

For any local commutative R with a specified residue field k and any α in an extension K/k, there is a flat local R-algebra S with maximal ideal m_R S and residue k(α). If α is transcendental use R[T] localized at m_R R[T]; if α is algebraic use R[T]/F for a monic lift F of its minimal polynomial. No separability assumption is made.

Proof/construction: In the transcendental case, the prime m_R R[T] has quotient k[T], and its localization has residue k(T); polynomial extension and localization are flat. In the algebraic case, the monic quotient is finite free of positive rank over R. Its residue is the field k[T]/minpoly(α), and finiteness over the local base makes every maximal ideal lie over m_R, so the lifted ideal is its unique maximal ideal. The quotient map is the actual given inclusion of k(α) into K.

Direct prerequisites: `labelled-local-algebra`.

Sources: [STACKS-03C3](https://stacks.math.columbia.edu/tag/03C3), Lemma 10.159.1, first paragraph.

#### Flat local realization of an arbitrary residue extension

`TauCeti.Coeff.ResidueExtension.uncompleted_exists` — theorem. Packet ID: `transfinite-residue-extension`.

Additional setting: R is local with specified residue k; ι:k→K is an arbitrary field embedding.

For any local R with residue k and field extension ι:k→K, there exists a flat local map f:R→S with m_S=m_R S and a specified residue map q_S:S→K extending ι∘q_R. S is not asserted Noetherian.

Proof/construction: Well-order a generating set of K over k; at successor stages apply the monogenic extension lemma. At a limit stage take the native directed colimit: local units are detected at a finite stage, the maximal ideal is the extended m_R, and the residue is the union of the preceding subfields. Flatness is preserved by the directed colimit; this avoids a Zorn argument on a proper class of all rings.

Direct prerequisites: `monogenic-residue-extension`.

Sources: [STACKS-03C3](https://stacks.math.columbia.edu/tag/03C3), Lemma 10.159.1, directed colimit and transfinite proof.

#### Complete Noetherian residue extensions

`TauCeti.Coeff.ResidueExtension.exists` — theorem. Packet ID: `completed-residue-extension-exists`.

Additional setting: R is Noetherian local with residue k; ι:k→K is any field extension.

If R is Noetherian local with residue k and ι:k→K any field extension, there exists a complete Noetherian local R-algebra R′, faithfully flat over R, with m_R′=m_R R′ and labelled residue K. For complete R this is the required coefficient-field extension; it is a choice, not a canonical functor.

Proof/construction: Apply the uncompleted flat local realization S. Since m_R S is proper, the flat local map is faithfully flat. Complete S for m_R. This is the same ring completion as for m_R S; that ideal is finitely generated and S/m_R S=K is Noetherian. Apply completion Noetherianity, faithful flat completion over the Noetherian base R, and the maximal-ideal local criterion.

Direct prerequisites: `transfinite-residue-extension`, `completion-noetherian`, `faithful-flat-algebra-completion`, `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom`.

Sources: [STACKS-03C3](https://stacks.math.columbia.edu/tag/03C3), Lemma 10.159.1 and comment 7831; [STACKS-05GH](https://stacks.math.columbia.edu/tag/05GH), Lemma 10.97.5.

#### Specified residue-extension data

`TauCeti.Coeff.ResidueExtension` — definition. Packet ID: `residue-extension-data`.

Additional setting: R is a complete Noetherian local ring with labelled residue k; ι:k→K is any field embedding.

A residue extension of a labelled complete local R along ι:k→K consists of an actual complete Noetherian local ring R′, a local ring map f:R→R′, a surjective q′:R′→K with kernel m_R′, q′∘f=ι∘q_R, m_R′=m_R R′, and faithful flatness over R via f. No uniqueness is included.

Proof/construction: Bundle the underlying ring and maps and these proven conditions. If R is a Λ-algebra, give R′ the transported Λ-action; its base residue map is ι∘ρ, which need not be surjective onto K. Use identity data for ι=id and the existence theorem for an arbitrary extension.

Direct prerequisites: `completed-residue-extension-exists`.

Sources: [STACKS-03C3](https://stacks.math.columbia.edu/tag/03C3), Lemma 10.159.1, specification of extension isomorphism.

Uses: André §4.4; DeformationAndDerivedPatchingAlgebra:R03.6 — Provides a faithfully flat coefficient change with the closed fibre exactly the new residue field.; GlobalGaloisDeformations:R04.1 and LocalGaloisDeformationRings:R08.1 — Permits enlarging the residual field while retaining the chosen embedding and coefficient maps.

API:

- `TauCeti.Coeff.ResidueExtension.map` (projection): The actual local, faithfully flat ring homomorphism R→R′.
- `TauCeti.Coeff.ResidueExtension.residue_commutes` (compatibility): q′(f(r))=ι(q_R(r)).
- `TauCeti.Coeff.ResidueExtension.maximal_map` (characterisation): m_R′=m_R R′.
- `TauCeti.Coeff.ResidueExtension.identity` (constructor): Identity extension data for ι=id_k.

Tests:

- `TauCeti.Coeff.ResidueExtension.test_identity` (degenerate): The identity extension data have carrier R, map id and the original residue.
- `TauCeti.Coeff.ResidueExtension.test_series` (small-case): Given k⊂K, k[[X]]→K[[X]] with coefficient inclusion satisfies the extension data and maximal ideal (X).
- `TauCeti.Coeff.ResidueExtension.test_ramified` (non-example): A ramified extension of DVRs with π_R=uπ_R′^e, e>1, fails m_R R′=m_R′ and is not residue-extension data of this kind.

#### Finite generation across residue extension

`TauCeti.Coeff.ResidueExtension.finite_iff` — theorem. Packet ID: `residue-extension-finite-generation`.

Additional setting: R→R′ is specified residue-extension data; M is any R-module.

For residue-extension data R→R′ and any R-module M, M is finite over R if and only if R′⊗_R M is finite over R′. This is the native ascent/descent theorem specialized to the actual chosen map; no completeness of M is required.

Proof/construction: Apply native finite-generation ascent to the underlying algebra. Apply native faithfully flat finite-generation descent for the reverse implication.

Direct prerequisites: `residue-extension-data`, `mathlib:Module.Finite.base_change`, `mathlib:Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`.

Sources: [STACKS-06LD](https://stacks.math.columbia.edu/tag/06LD), Completion and flatness, finite-module comparison.

### Cohen coefficients and parameter evaluations

#### Strict Cohen rings with a labelled residue

`TauCeti.Coeff.CohenRing` — definition. Packet ID: `strict-cohen-ring`.

Additional setting: p is prime; k is a field of characteristic p.

For prime p and a field k of characteristic p, a strict Cohen ring C(k) is a characteristic-zero complete DVR C with maximal ideal generated by p and a specified surjective residue map C→k with that kernel. Imperfect k is allowed; no Frobenius lift or canonical representative system is part of the data.

Proof/construction: Bundle the native DVR, characteristic-zero, completeness and residue structures. The displayed ideal (p) is the uniformizer ideal; quotient data retain the prescribed field label. Witt vectors instantiate this structure only for perfect residue fields.

Direct prerequisites: `mathlib:IsDiscreteValuationRing`, `mathlib:IsAdicComplete`, `labelled-local-algebra`, `mathlib:WittVector.p_nonzero`.

Sources: [STACKS-0327](https://stacks.math.columbia.edu/tag/0327), Definition 10.160.5.

Uses: Stacks 10.160.6–8; André §4.4 — Supplies coefficient bases for arbitrary characteristic-p residue fields.; PadicDifferentialEquationsAndRigidCohomology:RD.0 — Separates Cohen coefficient rings from the additional Frobenius lift used by analytic rings.

API:

- `TauCeti.Coeff.CohenRing.maximal_eq_span_p` (characterisation): m_C=(p).
- `TauCeti.Coeff.CohenRing.residueEquiv` (compatibility): The labelled quotient C/(p)≃k.
- `TauCeti.Coeff.CohenRing.toComplete` (constructor): C becomes a complete local coefficient base with residue k.
- `TauCeti.Coeff.CohenRing.witt` (constructor): For perfect k, the native Witt vector ring is a strict Cohen ring with residue its zeroth coefficient.

Tests:

- `TauCeti.Coeff.CohenRing.test_witt` (compatibility): For perfect k, the constructor has underlying ring the existing WittVector p k and maximal ideal (p).
- `TauCeti.Coeff.CohenRing.test_truncated` (non-example): C/(p²) is Artinian with nonzero p-torsion and is not a strict Cohen ring.
- `TauCeti.Coeff.CohenRing.test_ramified` (non-example): A mixed-characteristic complete DVR whose ramification index over p is greater than one is not a Cohen ring: (p)≠m.

#### Existence of Cohen rings

`TauCeti.Coeff.CohenRing.exists` — theorem. Packet ID: `strict-cohen-existence`.

Additional setting: p is prime; k is a field of characteristic p.

For any prime p and any field k of characteristic p, there exists a strict Cohen ring with labelled residue k.

Proof/construction: Apply completed residue extension to the native p-adic integers with residue F_p⊂k. Faithful flatness makes multiplication by p injective, and the maximal ideal is generated by p. Use the native Noetherian local principal-maximal-ideal DVR criterion. Completion gives the required p-adic completeness.

Direct prerequisites: `strict-cohen-ring`, `completed-residue-extension-exists`.

Sources: [STACKS-0328](https://stacks.math.columbia.edu/tag/0328), Lemma 10.160.6, corrected current proof.

#### Formal smoothness of truncated Cohen rings

`TauCeti.Coeff.CohenRing.truncated_formallySmooth` — lemma. Packet ID: `cohen-truncated-smooth`.

Additional setting: C is a strict Cohen ring at prime p; n≥1.

For a strict Cohen ring C with residue k and n≥1, Z/p^nZ→C/p^nC is algebraically formally smooth. No essential finite-type hypothesis is imposed on k.

Proof/construction: The residue field k is formally smooth over F_p, including arbitrary imperfect or infinitely generated k. C/p^nC is flat over Z/p^nZ because C is torsion-free over the DVR Z_p. Induct on n using the square-zero ideal (p^(n−1)) for n≥2 and the native square-zero formal-smoothness lift.

Direct prerequisites: `strict-cohen-ring`, `mathlib:RingHom.FormallySmooth.of_flat_of_ker_eq_map_of_square_zero`.

Sources: [STACKS-0323](https://stacks.math.columbia.edu/tag/0323), Lemma 10.160.7.

#### Compatible coefficient lifts through Artinian quotients

`TauCeti.Coeff.CohenRing.compatible_tower` — lemma. Packet ID: `cohen-compatible-tower`.

Additional setting: R is complete Noetherian local with residue k of characteristic p; C is a strict Cohen ring with the same labelled residue.

Let R be a complete Noetherian local ring with labelled residue k of characteristic p, and C a strict Cohen ring for k. There is a sequence φ_n:C/p^(n+1)C→R/m_R^(n+1), inducing the chosen residue identification, such that reduction∘φ_(n+1)=φ_n∘reduction for every n.

Proof/construction: Start with the specified residue isomorphism at n=0. For each n use algebraic formal smoothness of C/p^(n+2) over Z/p^(n+2) to lift the previous map across R/m^(n+2)→R/m^(n+1), whose kernel is square-zero. Choose the lift within the commuting diagram, so compatibility is part of the induction invariant, not a uniqueness claim.

Direct prerequisites: `cohen-truncated-smooth`, `positive-truncation`, `artinian-quotient-limit`.

Sources: [STACKS-032A](https://stacks.math.columbia.edu/tag/032A), Theorem 10.160.8, positive residue characteristic proof.

#### Coefficient maps into complete local rings

`TauCeti.Coeff.CohenRing.coefficient_map_exists` — theorem. Packet ID: `cohen-coefficient-map`.

Additional setting: R is complete Noetherian local with residue k of characteristic p; C is a strict Cohen ring for k.

For R complete Noetherian local with residue k of characteristic p and a strict Cohen ring C for k, there exists a continuous local ring map C→R inducing the chosen identity on k. It is not asserted injective when R has p-torsion; if R is p-torsion-free it is injective.

Proof/construction: Take the inverse limit of the compatible truncation maps and use completeness of C and R. The residue identity makes the map local and sends p to p, giving continuity. Every nonzero ideal of a DVR contains a power of p; a nonzero kernel would contradict p-torsion-freeness of R.

Direct prerequisites: `cohen-compatible-tower`, `artinian-quotient-limit`.

Sources: [STACKS-032A](https://stacks.math.columbia.edu/tag/032A), Theorem 10.160.8, limit of the coefficient maps.

#### Cohen power-series presentations

`TauCeti.Coeff.CohenRing.presentation` — theorem. Packet ID: `cohen-series-presentation`.

Additional setting: R is a complete Noetherian local commutative ring with residue characteristic p>0.

If R is complete Noetherian local with residue field k of characteristic p, then for a strict Cohen ring C(k) and finitely many lifts of a basis of m_R/(pR+m_R²), local continuous evaluation gives a surjection C(k)[[X₁,…,X_d]]→R inducing the residue identity. Its kernel is an actual finitely generated ideal.

Proof/construction: Regard R as a complete coefficient object over C via the coefficient map. Choose the finite relative cotangent basis and apply the previously planned local power-series presentation theorem. Noetherianity of the power-series source makes its kernel finitely generated.

Direct prerequisites: `strict-cohen-existence`, `cohen-coefficient-map`, `series-presentation`.

Sources: [STACKS-032A](https://stacks.math.columbia.edu/tag/032A), Theorem 10.160.8, final statement.

#### Compatible coefficient rings under separable residue change

`TauCeti.Coeff.CohenRing.compatible_over_separable` — theorem. Packet ID: `cohen-relative-separable-compatibility`.

Additional setting: R,R′ are complete Noetherian local of characteristic (0,p); β is local; its residue extension is separable; a coefficient embedding C(k)→R is specified.

For β:R→R′ a local map of complete Noetherian local rings of characteristic (0,p) inducing a separable residue extension k→k′, and a specified coefficient embedding C(k)→R, there is a coefficient embedding C(k′)→R′ and a continuous Cohen map C(k)→C(k′) making the square with β commute. Choices of representatives of a p-basis must be retained; no canonical map is claimed.

Proof/construction: For maps between Cohen rings, use the source Cohen homomorphism theorem with a specified p-basis and its lifts. To embed the extended Cohen ring into arbitrary R′ while preserving β on the given coefficient ring, a relative Cohen-structure theorem with prescribed representatives is needed. This last exact input is recorded as a gap: the public Cohen homomorphism theorem only has Cohen-ring targets.

Direct prerequisites: `cohen-coefficient-map`, `strict-cohen-ring`, `mathlib:Algebra.IsGeometricallyReduced`.

Sources: [ANDRE-18](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), §4.4(1), printed p.87.

#### Cohen maps to the perfect residue hull

`TauCeti.Coeff.CohenRing.perfect_hull_map` — theorem. Packet ID: `cohen-perfect-hull-map`.

Additional setting: C is a strict Cohen ring for k of characteristic p; k may be imperfect.

For a strict Cohen ring C with residue k of characteristic p, there is a continuous injective local ring map C→W(k^perf) inducing k→k^perf and taking p to p. The map is faithfully flat and the extended maximal ideal is (p). It is not canonical for imperfect k.

Proof/construction: Choose a p-basis and representatives in C; the Teichmüller embedding process adjoins compatible p-power roots through finite free pre-Cohen rings and takes a directed union. Complete that pre-Cohen ring; its residue is the perfect hull, its maximal ideal is generated by p and its characteristic is zero. Identify the resulting perfect-residue Cohen ring with the native Witt ring, using the Cohen-ring isomorphism theorem with the unique empty p-basis representative data. The map is local and torsion-free over the DVR C; DVR flatness and locality give faithful flatness.

Direct prerequisites: `strict-cohen-ring`, `mathlib:WittVector.isDiscreteValuationRing`, `flat-algebra-completion`, `mathlib:PerfectClosure.of`, `mathlib:Module.Flat.flat_iff_torsion_eq_bot_of_isBezout`.

Sources: [ANS-JAHNKE-22](https://www.numdam.org/item/10.5802/cml.84.pdf), Theorem4.1 and Corollary6.5.

#### Faithful completed change to perfect residue

`TauCeti.Coeff.CohenRing.perfect_residue_basechange` — theorem. Packet ID: `perfect-residue-completed-basechange`.

Additional setting: R is complete Noetherian local with residue k of characteristic p; a Cohen coefficient map is chosen.

Let R be complete Noetherian local of residue characteristic p, with a chosen Cohen coefficient map C(k)→R. Along a chosen Cohen embedding C(k)→W(k^perf), the completion R′ of R⊗_C W(k^perf) at m_R is complete Noetherian local, faithfully flat over R, with residue k^perf and m_R′=m_RR′. If R is reduced and p-torsion-free, preservation of reducedness is a separate R03.3 supplier, not a consequence of flatness.

Proof/construction: The ordinary base change is R-flat and faithful; its reduction modulo m_R is k^perf. Apply flat algebra completion and its finite-module comparison, obtaining faithful flatness and the equality of the extended maximal ideal. The completion ideal is finitely generated and its quotient is a field, so the completion-Noetherian and local-ring criteria apply.

Direct prerequisites: `cohen-perfect-hull-map`, `cohen-coefficient-map`, `faithful-flat-algebra-completion`, `completion-noetherian`, `completed-residue-extension-exists`.

Sources: [ANDRE-18](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), §4.2 and §4.4(1), pp.86–88.

#### Coefficient sections in equal positive characteristic

`TauCeti.Coeff.CohenRing.equal_characteristic_section` — theorem. Packet ID: `equal-characteristic-section`.

Additional setting: R is local and maximal-adically complete and separated, of equal characteristic p>0; residue is labelled k.

For a local ring R complete and separated for its maximal ideal, with labelled residue field k and equal characteristic p>0, there exists a ring section k→R of the residue map. No Noetherian hypothesis is required. The section is a choice and need not commute with a previously specified k-algebra structure.

Proof/construction: The chosen Cohen ring maps compatibly to every R/m^n by the same formal-smoothness induction as coefficient-map existence; no finite length is needed in that induction. Since p=0 in R, the limit map factors through C/p≃k. The residue equation makes the factor a section and injective.

Direct prerequisites: `strict-cohen-existence`, `cohen-truncated-smooth`.

Sources: [STACKS-032A](https://stacks.math.columbia.edu/tag/032A), Theorem10.160.8, coefficient construction in positive residue characteristic.

#### Finite quotients over a coefficient field

`TauCeti.Coeff.Complete.primary_quotient_finite` — lemma. Packet ID: `primary-quotient-finite`.

Additional setting: R is Noetherian local; a coefficient-field section k→R is specified; I is maximal-primary.

For a Noetherian local R with a specified coefficient-field section k→R, if I is maximal-primary then R/I is finite dimensional over k. The R-action and k-action use that section.

Proof/construction: Finite generation of m_R and radical I=m_R supply a positive q with m_R^q⊆I. The quotient is a finite R-module killed by that maximal power, so the imported finite-length theorem applies. Every simple factor is the labelled residue field; restricting scalars through the coefficient section gives finite k-dimension.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/finite-length-of-maximal-power-annihilation`.

Sources: [STACKS-032D](https://stacks.math.columbia.edu/tag/032D), Lemma10.160.11, finite parameter quotient.

#### Finite parameter evaluation with a coefficient field

`TauCeti.Coeff.Complete.parameter_evaluation_finite` — lemma. Packet ID: `parameter-evaluation-finite`.

Additional setting: R is complete Noetherian local with coefficient field k; the finite family x_i generates a maximal-primary ideal.

If R is complete Noetherian local with a chosen coefficient field k and I=(x₁,…,x_d) maximal-primary, evaluation k[[X₁,…,X_d]]→R at x_i makes R finite over the power-series source. This is not a surjective presentation unless the chosen x_i generate the maximal ideal.

Proof/construction: Choose a finite k-basis of R/I and lift its elements to R. The associated linear map from a finite free power-series module to R is surjective modulo the variable ideal. I and m_R have cofinal powers, so R is separated for I; native linear topological Nakayama gives the actual module surjection.

Direct prerequisites: `primary-quotient-finite`, `cofinal-ideal-completions`, `local-series-evaluation`, `mathlib:surjective_of_mkQ_comp_surjective`.

Sources: [STACKS-032D](https://stacks.math.columbia.edu/tag/032D), Lemma10.160.11, module finiteness step.

### Continuous infinitesimal lifting

#### Continuous formal smoothness of local maps

`TauCeti.Coeff.Hom.FormallySmooth` — definition. Packet ID: `continuous-formal-smoothness`.

A coefficient map f:A→B between complete Noetherian local objects is continuously formally smooth if for every small extension e:D→E of Artinian coefficient objects and every pair u:A→D, v:B→E with e∘u=v∘f, there exists w:B→D with e∘w=v and w∘f=u. All maps preserve the fixed residue label; continuity is automatic from locality.

Proof/construction: Define the displayed lifting predicate on actual coefficient morphisms. Expose the lift with both equations; do not replace it by surjectivity on cotangent spaces. Use factorization into small extensions for the API equivalence with lifting over every Artinian surjection.

Direct prerequisites: `small-extension`, `residue-preserving-morphism`, `surjection-small-factorization`.

Sources: [STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF), Lemma 90.8.6 and Remark 90.8.4.

Uses: DeformationAndDerivedPatchingAlgebra:R03.4 — Supplies continuous ring lifting for the finite-over-a-subring argument and preserves the previous quotient lift.; DeformationAndDerivedPatchingAlgebra:R03.2; Stacks90.8.6 — Matches smoothness of the contravariantly represented coefficient functor.

API:

- `TauCeti.Coeff.Hom.FormallySmooth.lift` (universal-property): For a small Artinian extension and a commuting coefficient diagram, obtain an actual lift satisfying both equations.
- `TauCeti.Coeff.Hom.formallySmooth_iff_surjections` (characterisation): The same lifting property holds for all Artinian surjections if and only if it holds for small ones.
- `TauCeti.Coeff.Hom.FormallySmooth.comp` (functoriality): Composites of continuously formally smooth coefficient maps are continuously formally smooth.

Tests:

- `TauCeti.Coeff.Hom.formallySmooth_test_identity` (degenerate): The identity map on each complete coefficient object is formally smooth.
- `TauCeti.Coeff.Hom.formallySmooth_test_series` (small-case): A→A[[X₁,…,X_n]] is formally smooth, including n=0.
- `TauCeti.Coeff.Hom.formallySmooth_test_dual` (non-example): For Λ=k, k→k[ε]/ε² is not formally smooth: the identity cannot lift through k[t]/t³→k[t]/t².

#### Power-series variables lift across small extensions

`TauCeti.Coeff.Complete.series_small_lifting` — lemma. Packet ID: `series-small-lifting`.

For complete A and n finite, the coefficient inclusion A→A[[X₁,…,X_n]] has the small Artinian diagram-lifting property.

Proof/construction: Lift each image of a variable through the surjection D→E. Residue compatibility forces every lifted variable into m_D. Native continuous evaluation gives the actual lift; equality on the base and variables yields the two diagram equations.

Direct prerequisites: `continuous-formal-smoothness`, `local-series-evaluation`.

Sources: [STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF), Lemma 90.8.6, forward proof.

#### The first relative truncation from a cotangent basis

`TauCeti.Coeff.Complete.first_relative_truncation` — lemma. Packet ID: `cotangent-truncation-identification`.

For f:A→B complete coefficient objects and a basis x₁,…,x_n of m_B/(m_AB+m_B²), the induced A-algebra map A[[X₁,…,X_n]]/(m_A·A[[X]]+m_(A[[X]])²)→B/(m_AB+m_B²) is an isomorphism sending X_i to x_i.

Proof/construction: Both quotients have residue k and square-zero maximal ideal. The structural A-map factors through k in both quotients. A ring homomorphism with identity residue and a bijection on the square-zero maximal ideals is an isomorphism; the prescribed cotangent basis supplies that bijection.

Direct prerequisites: `relative-cotangent`, `series-cotangent-basis`, `local-series-evaluation`, `complete-quotient`.

Sources: [STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF), Lemma 90.8.6, reverse proof.

#### Compatible lifts along a quotient tower

`TauCeti.Coeff.Hom.compatible_truncation_lifts` — lemma. Packet ID: `compatible-lift-tower`.

Let f:A→B be continuously formally smooth. For a complete coefficient object D, a coefficient map u:A→D and a lift v₀:B→D/m_D^(N+1) compatible with u, there are v_n:B→D/m_D^(N+n+1) extending v₀, compatible with every transition and with the reductions of u.

Proof/construction: Each successive truncation map is surjective, with square-zero kernel; factor it into finitely many small extensions when the kernel has dimension greater than one. Apply the all-surjection lifting API to the preceding lift and the next reduction of u. Choose recursively in the fibre over that preceding map, so compatibility is an invariant of the chosen sequence.

Direct prerequisites: `continuous-formal-smoothness`, `positive-truncation`, `surjection-small-factorization`.

Sources: [STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF), Lemma 90.8.6, reverse proof.

#### Formal smoothness and power-series presentations

`TauCeti.Coeff.Hom.formallySmooth_iff_series` — theorem. Packet ID: `continuous-formally-smooth-series`.

For f:A→B in CNL_Λ(k), continuous formal smoothness is equivalent to the existence of some finite n and a continuous residue-preserving A-algebra isomorphism A[[X₁,…,X_n]]≃B whose restriction to A is f.

Proof/construction: Choose a relative cotangent basis and identify the first relative square-zero quotients. Use compatible lifting into the positive Artinian truncations of T=A[[X]] to construct a coefficient map B→T inducing the inverse cotangent map. Relative cotangent surjectivity makes B→T surjective. Choose preimages of the variables and evaluate T→B. The composite on T is identity on coefficients and variables. The reverse map induces a cotangent isomorphism, so it is surjective as well; the two maps are inverse.

Direct prerequisites: `series-small-lifting`, `cotangent-truncation-identification`, `compatible-lift-tower`, `artinian-quotient-limit`, `relative-cotangent-surjectivity`, `local-series-evaluation`.

Sources: [STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF), Lemma 90.8.6, entire reverse proof.

#### Surjectivity of the compatible quotient fibre map

`TauCeti.Coeff.Complete.quotient_fibre_surjective` — lemma. Packet ID: `quotient-fibre-surjectivity`.

Let e:D→E be a surjective coefficient map between complete objects. For n≥1, the natural map D/m_D^(n+1)→(D/m_D^n)×_(E/m_E^n)(E/m_E^(n+1)) is surjective in the Artinian coefficient category.

Proof/construction: A surjective local map sends m_D onto m_E, and hence every power onto the corresponding power. Lift the first coordinate to D. The difference from the second coordinate lies in m_E^n; lift that difference from m_D^n and add it. The resulting class has both prescribed coordinates; the two maps are genuine coefficient maps.

Direct prerequisites: `artinian-pullback`, `positive-truncation`.

Sources: [STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF), Lemma 90.8.8, compatible lifting diagrams.

#### Lifting over complete local surjections

`TauCeti.Coeff.Hom.lift_complete_surjection` — theorem. Packet ID: `compatible-complete-lifting`.

For continuously formally smooth f:A→B and a commuting coefficient diagram A→D→E←B with D→E surjective and D,E complete Noetherian local, there is a coefficient map B→D making both triangles commute. A prescribed compatible lift B→D/m_D^N, N≥1, can be retained.

Proof/construction: At each exponent combine the previous D-truncation lift with the prescribed B→E map in the Artinian fibre product of the preceding lemma. Its surjective source is the next D-truncation; apply Artinian diagram lifting to obtain the next compatible lift. Take the inverse limit and check both equations at every quotient. The construction begins at the prescribed finite lift when one is provided.

Direct prerequisites: `quotient-fibre-surjectivity`, `compatible-lift-tower`, `artinian-quotient-limit`, `continuous-formal-smoothness`.

Sources: [STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF), Lemma 90.8.8, final proof.

### Witt comparison and quotient-completion comparisons

#### The Witt coefficient-category specialization

`TauCeti.Coeff.Complete.modularCurves_witt_comparison` — theorem. Packet ID: `modular-curves-coefficient-comparison`.

Additional setting: p is prime; k is algebraically closed of characteristic p; the base is native WittVector p k.

For k algebraically closed of characteristic p>0, the complete and Artinian fixed-residue categories with base the native WittVector p k agree with the coefficient categories imported from ModularCurves7D: identity on underlying rings, local maps and labelled residue isomorphisms. Elliptic universal deformation rings and their W(k)[[T]] representation remain entirely ModularCurves-owned.

Proof/construction: Use the algebraically closed field perfectness instance and the native Witt complete-DVR structures. Translate a labelled quotient isomorphism into the equivalent actual residue map q with its kernel equation. The forgetful object and morphism assignments are inverse. This is the RS08 boundary comparison, without redefining an elliptic deformation problem.

Direct prerequisites: `complete-local-coefficient-category`, `artinian-coefficient-category-and-small-extensions`, `strict-cohen-ring`, `tauceti:TauCetiRoadmap/ModularCurves#7d-universal-deformations-of-elliptic-curves`, `mathlib:WittVector.quotientPEquiv`.

Sources: [STACKS-06GC](https://stacks.math.columbia.edu/tag/06GC), Definition90.3.1, classical coefficient category.

#### Cofinality of mixed parameter quotients

`TauCeti.Coeff.Complete.parameter_quotients_cofinal` — lemma. Packet ID: `cofinal-parameter-powers`.

Additional setting: p is prime; k is perfect of characteristic p; n is finite; m≥1.

For A=W(k)[[T₁,…,T_n]], k perfect of characteristic p and m≥1, put I_m=(p^m,T₁^(p^m),…,T_n^(p^m)). Then I_(m+1)⊆I_m and m_A^(m+n(p^m−1))⊆I_m⊆m_A^m. Hence A/I_m is Artinian and A is the inverse limit of these quotients.

Proof/construction: Each generator of I_m has maximal-ideal order at least m; this gives the right inclusion. A monomial of total degree at least m+n(p^m−1) in the generators p,T_i either has p-exponent at least m or some variable exponent at least p^m; otherwise the sum is smaller than the bound. This gives cofinality with maximal powers and the Artinian inverse-limit identification; monotonicity is checked on generators.

Direct prerequisites: `maximal-series-ideal`, `artinian-quotient-limit`.

Sources: [ANDRE-18](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), §3.4, printed p.84.

#### Artinian quotients from a Noetherian completion

`TauCeti.Coeff.Completion.artinian_quotients_of_noetherian` — lemma. Packet ID: `noetherian-completion-artinian-quotients`.

Additional setting: A is local; its maximal-adic completion is Noetherian; n≥1.

Let A be a local ring, not necessarily Noetherian, whose m_A-adic completion is Noetherian. For every n≥1, A/m_A^n is Artinian. No finite generation of m_A is assumed.

Proof/construction: The nth projection of the completion onto A/m_A^n is surjective because every quotient class has a representative in A. Hence A/m_A^n is Noetherian. Its maximal ideal is nilpotent, so all prime ideals are maximal. Apply the native Noetherian dimension-zero Artinian criterion.

Direct prerequisites: `mathlib:IsNoetherianRing`, `mathlib:IsArtinianRing`, `mathlib:AdicCompletion.surjective_evalₐ`.

Sources: [PQ-24](https://arxiv.org/pdf/2404.14622), Lemma5.15, first proof paragraph.

#### Finite-ideal quotient commutes with Noetherian completion

`TauCeti.Coeff.Completion.quotient_finite_ideal` — theorem. Packet ID: `finite-ideal-quotient-after-completion`.

Additional setting: A is local; Â is Noetherian; I is finitely generated.

Let A be a local, possibly non-Noetherian ring with Noetherian m_A-adic completion Â. For every finitely generated ideal I of A, the canonical ring map Â→completion_(m_A/I)(A/I) induces an isomorphism Â/IÂ≃completion(A/I). If I=A both sides are zero; for proper I the quotient is local. No finite generation of m_A is assumed.

Proof/construction: For generators a₁,…,a_s of I, the kernels K_n of (A/m_A^n)^s→(I+m_A^n)/m_A^n are Artinian. Their images in each fixed level stabilize, so the system is Mittag–Leffler. Requested inverse-limit exactness gives surjectivity Â^s→lim_n (I+m_A^n)/m_A^n; its image is precisely IÂ. Completion of the surjection A→A/I is surjective. The quotient limit kernel is the displayed inverse limit, giving the actual induced quotient isomorphism.

Direct prerequisites: `noetherian-completion-artinian-quotients`, `EnhancedDerivedSheaves:E2`, `mathlib:AdicCompletion.map_surjective`.

Sources: [PQ-24](https://arxiv.org/pdf/2404.14622), Lemma5.15, printed pp.38–39.

### Adic topology, Chevalley and finite Hom

#### Chevalley cofinality for finite modules

`TauCeti.Coeff.Module.chevalley` — lemma. Packet ID: `module-chevalley`.

Additional setting: R is complete Noetherian local; M is finite over R; N_n decrease.

For a finite module M over a complete Noetherian local ring R and a decreasing sequence N_n of submodules with intersection zero, for every q there exists n such that N_n⊆m_R^qM. More generally the induced filtration on M/(intersection N_n) is maximal-adically cofinal.

Proof/construction: M and every finite quotient are complete and separated by native finite-module completion comparison. In each Artinian quotient M/m^qM the decreasing images stabilize; the stable images form a surjective inverse system. The requested inverse-limit interface lifts any stable image to an element of every N_n, using separatedness of M/N_n. If their intersection is zero, every stable image is zero.

Direct prerequisites: `flat-completion-finite-comparison`, `EnhancedDerivedSheaves:E2`, `mathlib:IsHausdorff`.

Sources: [STACKS-06SE](https://stacks.math.columbia.edu/tag/06SE), Lemma90.4.7, proof via stable Artinian images.

#### The induced topology on a complete embedded subring

`TauCeti.Coeff.Complete.embedded_topology` — lemma. Packet ID: `embedded-subring-topology`.

Additional setting: S,R are complete Noetherian local; f is injective and local.

If f:S→R is an injective local ring homomorphism between complete Noetherian local rings, then the m_S-adic topology equals the topology induced from the m_R-adic topology: for each q some n has f⁻¹(m_R^n)⊆m_S^q, while m_S^n⊆f⁻¹(m_R^n).

Proof/construction: Apply Chevalley to the decreasing ideals f⁻¹(m_R^n) of S; their intersection is zero by injectivity and separatedness of R. Locality supplies the reverse inclusions.

Direct prerequisites: `module-chevalley`.

Sources: [STACKS-06SE](https://stacks.math.columbia.edu/tag/06SE), Lemma90.4.7, stabilized-image proof.

#### The finite adic Hom comparison

`TauCeti.Coeff.Completion.hom_pro_comparison` — theorem. Packet ID: `adic-hom-pro-comparison`.

Additional setting: R is Noetherian; I is an ideal; M,N are finite R-modules.

For a Noetherian ring R, ideal I, and finite R-modules M,N, the canonical maps Hom_R(M,N)/I^nHom_R(M,N)→Hom_R(M,N/I^nN) form a pro-isomorphism. This is not a claim that each finite-level map is an isomorphism.

Proof/construction: Choose a finite presentation R^a→R^b→M→0 and identify Hom(M,N) with the kernel of N^b→N^a. Artin–Rees compares the intrinsic I-adic filtration on that kernel with its induced filtration in N^b. Apply the requested E2 kernel/cokernel criterion for a pro-isomorphism to the resulting quotient-kernel systems.

Direct prerequisites: `mathlib:Ideal.exists_pow_inf_eq_pow_smul`, `EnhancedDerivedSheaves:E2`.

Sources: [BHATT-18](https://arxiv.org/pdf/1608.08882v2), Lemma5.3, pp.9–10.

#### Derived-limit vanishing for finite adic Hom

`TauCeti.Coeff.Completion.hom_lim_one_zero` — theorem. Packet ID: `adic-hom-lim-one`.

Additional setting: R is Noetherian; I is an ideal; M,N are finite R-modules.

Under the same hypotheses, lim¹_n Hom_R(M,N/I^nN)=0. Transition maps in this Hom tower need not be surjective; vanishing follows from its pro-isomorphism with a surjective quotient tower.

Proof/construction: The transition maps of Hom(M,N)/I^nHom(M,N) are surjective. Use the E2 vanishing of lim¹ for surjective countable module towers and its invariance under pro-isomorphism.

Direct prerequisites: `adic-hom-pro-comparison`, `EnhancedDerivedSheaves:E2`.

Sources: [BHATT-18](https://arxiv.org/pdf/1608.08882v2), Lemma5.3, last sentence.

#### Canonical comparison of cofinal completions

`TauCeti.Coeff.Completion.cofinal_ideals` — theorem. Packet ID: `cofinal-ideal-completions`.

Additional setting: R is commutative; the powers of I and J are mutually cofinal.

For ideals I,J of a commutative ring R whose power filtrations are mutually cofinal, the identity of R induces a canonical ring equivalence between their native completions. It commutes with the canonical maps from R and with quotient maps after passing to cofinal indices.

Proof/construction: At each quotient choose a containing power from the other filtration; compatible refinement makes the induced limit map independent of that choice. Construct maps in both directions and check the composites at every quotient. Use native completion extensionality. No Noetherian hypothesis is needed for this inverse-limit comparison.

Direct prerequisites: `mathlib:IsAdicComplete`.

Sources: [STACKS-0319](https://stacks.math.columbia.edu/tag/0319), Lemma10.96.9.

### Generic point jets and tensor domains

#### Saturated quotients at a coefficient point

`TauCeti.Coeff.Complete.saturated_point_jets` — lemma. Packet ID: `saturated-point-jets`.

Additional setting: O is a complete DVR; R is a CNL O-domain with labelled residue equal to O’s; ε is an O-algebra retraction.

Let O be a complete DVR with uniformizer π, K=Frac(O), R a complete Noetherian local O-domain, and ε:R→O an O-algebra retraction. Put P=ker ε and J_n=R∩(P R[1/π])^n, n≥1. Then R/J_n is finite free over O, its augmentation ideal is nilpotent, the J_n decrease with intersection zero, and they are cofinal downward with m_R powers.

Proof/construction: The localized point ideal is maximal with quotient K; Krull intersection in its local ring and domain injectivity give intersection J_n=0. Chevalley then gives maximal-adic cofinality. P^n⊆J_n and R/P=O; finite generation of P shows R/(P^n,π) is finite dimensional over the residue field. The augmentation ideal in R/J_n is nilpotent. Its maximal topology is cofinal with π-adic topology; finite quotient completeness and topological Nakayama make it finite over O. Saturation gives π-torsion-freeness; a finite torsion-free module over a DVR is free.

Direct prerequisites: `module-chevalley`, `flat-completion-finite-comparison`, `series-presentation`.

Sources: [KW-II-09](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Proposition2.2(ii), proof pp.9–10.

#### Generic saturated jets are point-local jets

`TauCeti.Coeff.Complete.generic_point_jets` — lemma. Packet ID: `generic-point-jets`.

Additional setting: The DVR point and saturated-jet hypotheses of saturated-point-jets hold; n≥1.

In the preceding notation, (R/J_n)⊗_O K≃R[1/π]/q^n≃(R[1/π])_q/q^n, where q=P R[1/π]. The isomorphisms commute with the transition maps and the coefficient K-map.

Proof/construction: Localization is exact, and the defining contraction J_n has localized image q^n. The quotient R[1/π]/q^n is local with nilpotent maximal ideal; elements outside q are units, so localization does not change it.

Direct prerequisites: `saturated-point-jets`.

Sources: [KW-II-09](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Proposition2.2(ii), generic quotient calculation.

#### Finite tensor quotients at coefficient points

`TauCeti.Coeff.Complete.tensor_point_jets` — lemma. Packet ID: `tensor-point-jets`.

Additional setting: There are finitely many complete Noetherian local O-domain factors with O-valued points.

For finitely many rings R_i as above, C=completedTensor_O R_i and H_n=Σ_i J_(i,n)C, one has C/H_n≃tensor_O(R_i/J_(i,n)). These quotients are finite free O-modules and their augmentation ideal has nilpotence bound h(n−1)+1 for h factors. The H_n decrease with zero intersection.

Proof/construction: Use the finite-factor comparison and quotient tensor universal properties for the displayed canonical quotient map. A finite tensor product of finite free O-modules is finite free; a product of h(n−1)+1 augmentation factors contains n from one factor. For each maximal power of C choose n so all J_(i,n) are inside the corresponding powers of R_i; the sum H_n is then inside that maximal power of C. Separatedness gives the zero intersection.

Direct prerequisites: `saturated-point-jets`, `finite-factor-tensor-comparison`, `tensor-presentation`, `completed-tensor-finite-exactness`.

Sources: [KW-II-09](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Proposition2.2(ii), finite free tensor quotients.

#### Tensor domains from a regular coefficient point

`TauCeti.Coeff.Complete.tensor_isDomain_at_regular_point` — theorem. Packet ID: `tensor-domain-point`.

Additional setting: O is a complete DVR; every R_i is a CNL O-domain with an O-valued point; each generic point-local ring is regular.

For finitely many CNL O-domains R_i with O-valued retractions, suppose every (R_i[1/π])_(ker ε_i[1/π]) is regular. Then completedTensor_O R_i is a domain. This statement allows an arbitrary complete DVR O. It asserts no global generic-fibre regularity for that general base.

Proof/construction: A regular point-local K-algebra with residue K has completion K[[X₁,…,X_d]], using the requested independent equal-characteristic regular-coordinate interface. After tensoring the finite jets with K, their inverse limit is the multivariable series ring in all factor variables; box and total-degree filtrations are cofinal. C embeds in the product-compatible inverse limit of its finite free quotients, and each quotient embeds after inverting π. Thus C embeds into that series-domain inverse limit.

Direct prerequisites: `tensor-point-jets`, `generic-point-jets`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

Sources: [KW-II-09](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Proposition2.2(ii), domain assertion.

### Finite local factors and their completions

#### Finite local algebra completion

`TauCeti.Coeff.Completion.finite_local` — lemma. Packet ID: `finite-local-completion`.

Additional setting: R→S is finite and local; R,S are Noetherian local.

For a finite local map R→S of Noetherian local rings, the n_S-adic completion of S is canonically its m_R-adic completion and is finite over the completion of R.

Proof/construction: The finite closed fibre S/m_RS is Artinian local, so n_S is the radical of m_RS; finite generation supplies n_S^c⊆m_RS. Use the cofinal-completion comparison and the native finite-module tensor/completion equivalence.

Direct prerequisites: `cofinal-ideal-completions`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`.

Sources: [STACKS-0394](https://stacks.math.columbia.edu/tag/0394), Lemma10.97.7.

#### Compatible local factors of finite algebra quotients

`TauCeti.Coeff.Completion.finite_algebra_quotient_factors` — lemma. Packet ID: `finite-algebra-artinian-factors`.

Additional setting: R is Noetherian local; S is a finite commutative R-algebra; n≥1.

For a finite algebra S over a Noetherian local ring (R,m), the maximal ideals q_i of S form a fixed finite set, all lie over m, and for n≥1 the canonical quotient algebra S/m^nS is the product of S_(q_i)/m^nS_(q_i). The native localization-product equivalences commute with reduction in n.

Proof/construction: A finite integral map contracts maximal ideals to m and has finitely many primes in the closed fibre. S/m^nS is finite over the Artinian ring R/m^n, hence Artinian; its prime spectrum is discrete. Apply the native localization-product equivalence. Identify its maximal ideals with the q_i and check transition compatibility on the original S-elements, which surject onto each quotient.

Direct prerequisites: `mathlib:IsArtinianRing`, `mathlib:MaximalSpectrum.toPiLocalizationEquiv`.

Sources: [STACKS-07N9](https://stacks.math.columbia.edu/tag/07N9), Lemma10.97.8, Artinian quotient product paragraph.

#### Completion of a finite algebra over a prime

`TauCeti.Coeff.Completion.finite_algebra_product` — theorem. Packet ID: `finite-algebra-completion-product`.

Additional setting: R is Noetherian; S is finite over R; p is prime.

For R Noetherian, S a finite R-algebra and p a prime of R, let q₁,…,q_h be the primes of S over p. There is a canonical R-algebra equivalence completion(R_p)⊗_R S≃∏_i completion(S_(q_i)); each local completion is maximal-adic. For h=1 this is the single-prime local completion comparison.

Proof/construction: Localize R at p and S at R minus p; finite algebra structure and the set of primes over p are preserved. Take the limit of the compatible finite products from the quotient-factor lemma, using the requested fixed-finite-product/limit comparison. Identify each factor’s topology by finite-local completion and the left side by the native finite tensor/completion equivalence.

Direct prerequisites: `finite-algebra-artinian-factors`, `finite-local-completion`, `EnhancedDerivedSheaves:E2`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`.

Sources: [STACKS-07N9](https://stacks.math.columbia.edu/tag/07N9), Lemma10.97.8.

#### Finite domain algebras over complete local bases

`TauCeti.Coeff.Completion.finite_domain_local` — theorem. Packet ID: `finite-domain-algebra-local`.

Additional setting: R is complete Noetherian local; S is a nonzero finite commutative R-algebra and a domain.

If R is complete Noetherian local and S is a nonzero finite R-algebra that is a domain, then S is local and complete for its maximal ideal. The domain hypothesis is essential: a finite algebra can instead be a product of local rings.

Proof/construction: Finite-module completeness identifies S with its m_R-adic completion. The preceding product theorem decomposes S into its nonzero completed local factors at the finitely many primes over m_R. A domain has no nontrivial idempotents, so exactly one factor occurs. This gives locality and maximal-adic completeness.

Direct prerequisites: `finite-algebra-completion-product`, `finite-local-completion`.

Sources: [STACKS-07N9](https://stacks.math.columbia.edu/tag/07N9), Lemma10.97.8, specialization to an already complete base.

### Localized coefficient-change comparisons

#### Completion after characteristic-p local-field base change

`TauCeti.Coeff.Completion.local_field_basechange` — theorem. Packet ID: `local-field-coefficient-completion`.

Additional setting: k is finite; R is CNL_k(k); A is finite type over R; p contracts to a coheight-one prime p₀ of R. The residue field extension κ(p)/κ(p₀) is finite (for example p is a closed point of the indicated finite-type fibre). Finite type alone does not imply this.

Let k be finite, R a complete Noetherian local k-algebra with residue k, A a finite-type R-algebra and p a prime of A whose image p₀ in R satisfies dim(R/p₀)=1. Assume additionally that κ(p)/κ(p₀) is finite. Put κ=κ(p), B=κ⊗_k A and q=ker(B→κ). Then the maximal-adic completion of B_q is isomorphic to completion(A_p)[[T]] as completion(A_p)-algebras. The finite base field and coheight-one condition are retained.

Proof/construction: Use the explicitly assumed finite residue extension. The coheight-one complete-local field theorem makes κ(p₀), hence κ(p), a characteristic-p local field; this independent input belongs to the generic R03.4 prefix. The diagonal completion of κ⊗_k κ at multiplication is κ[[T]], using the one-element differential p-basis of a characteristic-p local field. The comparison of the completed base-change algebra with completion(A_p)[[T]] uses the compatible coefficient lift and pseudocompact module Nakayama argument; the exact missing interfaces are recorded as a gap.

Direct prerequisites: `local-series-evaluation`, `completion-noetherian`, `EnhancedDerivedSheaves:E2`.

Sources: [BIP-23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S2050508623000252), Lemma3.35, printed p.24.

#### Completion after O-Cohen coefficient change

`TauCeti.Coeff.Completion.ocohen_basechange` — theorem. Packet ID: `ocohen-coefficient-completion`.

Additional setting: O is a finite-p-adic integer ring; R is CNL_O(k); A is finite type over R; κ(p) is a characteristic-p local field; Λ is the specified O-Cohen ring.

Let O be the integers of a finite extension of Q_p, R∈CNL_O(k), A finite type over R and p a prime with κ(p) a local field of characteristic p. Let Λ be an O-Cohen complete DVR with uniformizer the image of O’s uniformizer and labelled residue κ(p), as in BIP23 §3.10. For B=Λ⊗_O A and q=ker(B→κ(p)), completion(B_q)≃completion(A_p)[[T]] as completion(A_p)-algebras. Λ need not be an absolute strict Cohen ring when O is ramified.

Proof/construction: O-flatness of Λ, localization flatness and native completion flatness give the relevant flat coefficient map. Reduce modulo the O-uniformizer and apply the preceding characteristic-p comparison. Lift the variable and coefficients; pseudocompact module Nakayama with a verified separated kernel upgrades the reduction isomorphism. This precise comparison step is not supplied by finite-module Nakayama alone.

Direct prerequisites: `local-field-coefficient-completion`, `flat-algebra-completion`, `local-series-evaluation`, `EnhancedDerivedSheaves:E2`.

Sources: [BIP-23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S2050508623000252), Lemma3.36, printed pp.24–25.

#### Completion after finite coefficient-field change

`TauCeti.Coeff.Completion.finite_residue_basechange` — theorem. Packet ID: `finite-residue-coefficient-completion`.

Additional setting: O is a finite-p-adic integer ring; R is CNL_O(k); A is finite type over R; κ(p) is finite over k or L; Λ is chosen as stated.

In the same finite-p-adic setting, suppose κ(p) is a finite extension of k or of L=Frac(O). Take Λ to be the unramified O-extension with residue κ(p) in the former case and Λ=κ(p) in the latter. For B=Λ⊗_O A and the multiplication-residue kernel q, completion(B_q)≃completion(A_p). There is no additional power-series variable.

Proof/construction: The diagonal completion of Λ⊗_O Λ at multiplication is Λ, using the unramified finite extension or the finite separable characteristic-zero field extension. Use the coefficient-completion comparison method with this zero-dimensional diagonal factor. Retain the actual algebra maps in the isomorphism; the comparison interface shared with local-field-basechange remains a recorded gap.

Direct prerequisites: `finite-algebra-completion-product`, `local-series-evaluation`, `EnhancedDerivedSheaves:E2`.

Sources: [BIP-23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S2050508623000252), Lemma3.37, printed p.25.

## Proof-interface work remaining

The planning coverage stays planned until these exact inputs and the supplier-prefix boundaries are independently settled. An implementation must not infer closed coverage from the elaboration of unfinished prototype signatures.

### Gap 1: Homogeneous initial-ideal lifting interface

The associated graded ring and finite homogeneous generators are already planned in P7. The exact initial-ideal construction and filtered lifting of chosen homogeneous generators were not found there. The precise requested R03.3 interface above remains unestablished; Noetherian completion, hence the local tensor and arbitrary residue-extension packings, depend on it.

Affected declarations: `TauCeti.Coeff.Completion.noetherian`.

### Gap 2: Countable Mittag–Leffler exactness interface

The mathematical proof is read in Stacks 0598 and André 1.1.1. No exact usable E2 node or native countable short-exact limit theorem was found; the requested module-level interface is the unresolved supplier input.

Affected declarations: `TauCeti.Coeff.Completion.flat_finite_exact`, `TauCeti.Coeff.Completion.quotient_finite_ideal`, `TauCeti.Coeff.Module.chevalley`, `TauCeti.Coeff.Completion.hom_pro_comparison`, `TauCeti.Coeff.Completion.hom_lim_one_zero`, `TauCeti.Coeff.Completion.finite_algebra_product`.

### Gap 3: Arbitrary fields are formally smooth over their prime field

Stacks 0322 gives arbitrary-field formal smoothness over F_p (and Q); its proof calls the differential p-basis and geometrically-reduced field lemmas. The pinned native perfect-field instance needs EssFiniteType, and the separably-generated theorem does not cover all perfect closures. A complete baseline-to-p-basis proof was not established here. This exact mathematical input is retained, without silently restricting the residue field.

Affected declarations: `TauCeti.Coeff.CohenRing.truncated_formallySmooth`.

### Gap 4: Relative Cohen structure with prescribed representatives in an arbitrary complete target

André §4.4(1) invokes Matsumura Theorems29.5–29.6. The private book is unavailable. Anscombe–Jahnke Theorem6.2 and6.7 give Cohen-to-Cohen maps with p-basis representatives, not embeddings into an arbitrary complete Noetherian local R′ containing the prescribed image of C(k). This precise relative embedding theorem is unestablished; no claim that Cohen-to-Cohen homomorphisms alone supply it.

Affected declarations: `TauCeti.Coeff.CohenRing.compatible_over_separable`.

### Gap 5: Regular point coordinates and tensor generic-fibre interfaces

The complete point-based domain proof reduces to an independent regular-coordinate theorem in R03.3. Its exact node was not found in P7; the request records variables and quotient compatibility. KW Proposition2.2(i) and global regularity of the generic fibre for finite Q_p bases belong to R03.4 and are not supplied by the arbitrary-DVR point argument.

Affected declarations: `TauCeti.Coeff.Complete.tensor_isDomain_at_regular_point`.

### Gap 6: Teichmüller embedding-process algebra and perfect Cohen comparison

Anscombe–Jahnke Theorem4.1 and Corollary6.5 supply the exact mathematical statements, freshly read. Their p-basis, representative and pre-Cohen directed-union infrastructure has no native interface found at the pins and has not been decomposed to lemmas here. This is an explicit refinement gap for the perfect-hull map, not a use of separable lifting across a purely inseparable extension.

Affected declarations: `TauCeti.Coeff.CohenRing.perfect_hull_map`.

### Gap 7: Local-field diagonal completions and pseudocompact coefficient comparison

BIP23 Lemmas3.35–3.37, pp.24–25, are read in the published version. The proof imports [9,Lemmas3.3.4–3.3.5], the one-element differential p-basis diagonal calculation, and topological Nakayama for pseudocompact modules. The finite-type native smooth-field theorem and finite-module Nakayama do not provide these interfaces. Their exact relative coefficient-completion comparison, including separated kernel and actual maps, remains unestablished here.

Affected declarations: `TauCeti.Coeff.Completion.local_field_basechange`, `TauCeti.Coeff.Completion.ocohen_basechange`, `TauCeti.Coeff.Completion.finite_residue_basechange`.

## Source findings

Eight findings are recorded with quoted text, corrections, evidence, the version read and bounded correction searches in the packet. They await this job’s independent review. The BIP finding carries the existing atlas correction; the packet does not supply a review verdict for itself.

| Finding | Source and locator | Correction and reach |
| --- | --- | --- |
| E1 | [STACKS-06GG](https://stacks.math.columbia.edu/tag/06GG), Lemma90.3.4, simple-module paragraph, online version read 5 October 2026 | Replace the degree in the proof by [k:k′], as in the correctly printed statement. Affects the proof. |
| E2 | [STACKS-06GB](https://stacks.math.columbia.edu/tag/06GB), Definition90.3.6, online version read 5 October 2026 | The displayed quotient is the relative local cotangent space of S over R. Affects nothing. |
| E3 | [STACKS-06GB](https://stacks.math.columbia.edu/tag/06GB), Lemma90.3.12, proof of (1), online version read 5 October 2026 | The surjective map at this step is B→A. Affects nothing. |
| E4 | [STACKS-06GB](https://stacks.math.columbia.edu/tag/06GB), Lemma90.3.12, proof of (3), online version read 5 October 2026 | The separable extension is k/k′. Affects nothing. |
| E5 | [STACKS-06SC](https://stacks.math.columbia.edu/tag/06SC), Lemma90.4.5, proof, online version read 5 October 2026 | Use a congruence modulo m_ΛS+m_S², whose two summands are annihilated by every Λ-derivation S→k. Affects the proof. |
| E6 | [KW-II-09](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §2.1, p.6, UCLA author copy, SHA-256 recorded in sourceVersions | Replace surjectivity by injectivity of Sp_C(A)→Sp_B(A) for A=F[ε]. Affects the proof. |
| E7 | [ANS-JAHNKE-22](https://www.numdam.org/item/10.5802/cml.84.pdf), Theorem6.7, proof on printed p.16, published Confluentes Mathematici version | The target residue field is l₂: write (B₂,l₂). Affects nothing. |
| E8 | [BIP-23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S2050508623000252), Lemma3.35, printed p.24, version of record, Forum of Mathematics, Pi 11 (2023), e30 | Add κ(p)/κ(p₀) finite, or restrict p to a closed point of the indicated finite-type fibre. Keep this added condition in the planned theorem. Affects a stated result. |

The current Stacks0328 proof and its historical correction comments were inspected. Its old Noetherian-completion problem is not reported as a new error. Stacks032A explicitly retains the earlier compatible map in the lift diagram; that step is not called an unsupported compatibility claim. The public Cohen relative-homomorphism theorem’s target is another Cohen ring, so its narrower scope is a proof-interface limitation, not an accusation that its statement is false.

## Suggested-file boundary and validation

The file contains the actual 19 definition/construction declarations, 61 API items and 57 named test examples. Both full subcategory instances are explicit. The finite-residue correction in the localized comparison is an actual hypothesis. The file was checked with `lean-check research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--R03.1.lean`; it elaborated without errors and with only the expected unfinished-proof warnings. Mathlib’s compiled pin matches the packet. Tau Ceti’s pinned statements were source-audited; the prototype imports Mathlib only because the available shared Tau Ceti compiled checkout differs from its pin.

The following named theorem signatures are omitted rather than assigned fake supplier predicates:

- `TauCeti.Coeff.Complete.modularCurves_witt_comparison`: The upstream marked Witt coefficient category type is not exposed at the pinned library.
- `TauCeti.Coeff.Complete.tensor_isDomain_at_regular_point`: The R03.3 regular-local predicate and specified rational-point coordinate interface are requested, not replaced with an opaque proposition.
- `TauCeti.Coeff.Completion.hom_pro_comparison`: E2 pro-system and pro-isomorphism types are unavailable as exact supplier interfaces.
- `TauCeti.Coeff.Completion.hom_lim_one_zero`: The E2 lim-one construction and invariance interface are unavailable.
- `TauCeti.Coeff.Completion.ocohen_basechange`: A relative O-Cohen bundle, diagonal completion and pseudocompact comparison interfaces remain unresolved.
- `TauCeti.Coeff.Completion.finite_residue_basechange`: The relative coefficient bundle and its zero-dimensional diagonal comparison are not replaced by a proof-hole predicate.

The flat finite-module comparison is prototyped as an R-linear equivalence with the canonical values on simple tensors; the packet also requires completed coefficient-module compatibility. The corrected local-field comparison is prototyped as the underlying ring equivalence; the packet also requires its canonical completed-local coefficient-algebra structure. Reviewers should assess those stronger interfaces from the definitive statement, not count the weaker signatures as implemented comparisons. All nodes retain unchecked implementation status.

`check_blueprint.py` reports zero errors and warnings. The source-issue and version validators pass. The packet’s internal prerequisite graph is acyclic; the external whole-stage supplier boundary is explicitly unresolved as described above. All changes are confined to this job’s packet, reader, suggested file and handoff.

## Public sources read

The packet records URLs, access dates, SHA-256 hashes and the exact passages read. Mathematical pagination is distinguished from PDF page numbering. Paper-route items beyond these passages were read for ownership, not treated as freshly verified source results. Books cited inside these sources, including Matsumura and EGA, were not obtained from a private library. Where their precise interface is still needed, it appears in the gaps or supplier requests.

- **[STACKS-06GC](https://stacks.math.columbia.edu/tag/06GC)**. The Stacks Project Authors, *Definition 90.3.1 (06GC)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Definition 90.3.1, object and morphism convention; Definition 90.3.1, morphisms; Definition 90.3.1; Definition90.3.1, classical coefficient category
- **[STACKS-06GW](https://stacks.math.columbia.edu/tag/06GW)**. The Stacks Project Authors, *Definition 90.4.1 (06GW)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Definition 90.4.1, morphisms; Definition 90.4.1; Definition 90.4.1, completed category; Definition 90.4.1 and complete-ring convention
- **[STACKS-06GV](https://stacks.math.columbia.edu/tag/06GV)**. The Stacks Project Authors, *Section 90.4 (06GV): The completed base category*. Online mathematical statement and proof, accessed 5 October 2026 Read: Entire mathematical section, including proofs and displayed formulas; comments inspected.; Section 90.4, topology convention; Section 90.4, quotient objects and their topology; Section 90.4, compatible quotient systems; Section 90.4, finite-level maps
- **[STACKS-06GB](https://stacks.math.columbia.edu/tag/06GB)**. The Stacks Project Authors, *Section 90.3 (06GB): The base category*. Online mathematical statement and proof, accessed 5 October 2026 Read: Entire mathematical section, including proofs and displayed formulas; comments inspected.; Example 90.3.7, dual-number ring; Definition 90.3.2 and Lemma 90.3.3; Definition 90.3.6, corrected orientation
- **[STACKS-06GD](https://stacks.math.columbia.edu/tag/06GD)**. The Stacks Project Authors, *Definition 90.3.2 (06GD)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Definition 90.3.2 and Lemma 90.3.3; Definition 90.3.2
- **[STACKS-06GE](https://stacks.math.columbia.edu/tag/06GE)**. The Stacks Project Authors, *Lemma 90.3.3 (06GE)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma 90.3.3, maximal-ideal-annihilated kernels; Lemma 90.3.3, first paragraph; Lemma 90.3.3, first factorization; Lemma 90.3.3, second paragraph; Lemma 90.3.3; Lemma 90.3.3, annihilated kernel
- **[STACKS-06GG](https://stacks.math.columbia.edu/tag/06GG)**. The Stacks Project Authors, *Lemma 90.3.4 (06GG)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma 90.3.4, simple-module paragraph; Lemma 90.3.4, finite-filtration paragraph
- **[STACKS-06GH](https://stacks.math.columbia.edu/tag/06GH)**. The Stacks Project Authors, *Lemma 90.3.8 (06GH)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma 90.3.8(2), same-kernel paragraph; Lemma 90.3.8, first paragraph; Lemma 90.3.8, length paragraph; Lemma 90.3.8; Lemma 90.3.8(2)
- **[STACKS-0BNH](https://stacks.math.columbia.edu/tag/0BNH)**. The Stacks Project Authors, *Section 10.97 (0BNH): Completion for Noetherian rings*. Online mathematical statement and proof, accessed 5 October 2026 Read: Entire mathematical section, including proofs and displayed formulas; comments inspected.; Lemma 10.97.1 and Lemma 10.97.4; Lemmas 10.97.1 and 10.97.4, finite-module completion; Lemma 10.97.2, exactness and flatness
- **[STACKS-06SC](https://stacks.math.columbia.edu/tag/06SC)**. The Stacks Project Authors, *Lemma 90.4.5 (06SC)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma 90.4.5, finite basis paragraph
- **[STACKS-06GZ](https://stacks.math.columbia.edu/tag/06GZ)**. The Stacks Project Authors, *Lemma 90.4.2 (06GZ)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma 90.4.2
- **[STACKS-06HF](https://stacks.math.columbia.edu/tag/06HF)**. The Stacks Project Authors, *Section 90.8 (06HF): Smooth morphisms*. Online mathematical statement and proof, accessed 5 October 2026 Read: Entire mathematical section, including proofs and displayed formulas; comments inspected.; Lemma 90.8.6, polynomial-series presentation; Lemma 90.8.6, completion and inverse-limit proof; Lemma 90.8.6; Lemma 90.8.6, chosen variables and lift; Lemma 90.8.6, relative cotangent basis; Lemma 90.8.6, finite power-series rings; Lemma 90.8.6 and Remark 90.8.4; Lemma 90.8.6, forward proof; Lemma 90.8.6, reverse proof; Lemma 90.8.6, entire reverse proof; Lemma 90.8.8, compatible lifting diagrams; Lemma 90.8.8, final proof
- **[STACKS-032A](https://stacks.math.columbia.edu/tag/032A)**. The Stacks Project Authors, *Theorem 10.160.8 (032A): Cohen structure theorem*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Theorem 10.160.8, final paragraph; Theorem 10.160.8, positive residue characteristic proof; Theorem 10.160.8, limit of the coefficient maps; Theorem 10.160.8, final statement; Theorem10.160.8, coefficient construction in positive residue characteristic
- **[STACKS-05GH](https://stacks.math.columbia.edu/tag/05GH)**. The Stacks Project Authors, *Lemma 10.97.5 (05GH)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma 10.97.5, associated-graded paragraph; Lemma 10.97.5, successive approximation proof; Lemma 10.97.5, coefficient limits; Lemma 10.97.5
- **[STACKS-06H1](https://stacks.math.columbia.edu/tag/06H1)**. The Stacks Project Authors, *Lemma 90.4.4 (06H1)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma 90.4.4, completed tensor product; Lemma 90.4.4; Lemma 90.4.4, coproduct property
- **[STACKS-06SB](https://stacks.math.columbia.edu/tag/06SB)**. The Stacks Project Authors, *Lemma 90.4.3 (06SB)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma 90.4.3, pushouts
- **[ANDRE-18](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf)**. Yves André, *La conjecture du facteur direct*. Version of record, Publications mathématiques de l’IHÉS 127 (2018), pp.71–93, doi:10.1007/s10240-017-0097-9. Read: Lemma 1.1.1, printed pp.75–76, statement and entire proof; §3.4 p.84; §4.2 p.86 and §4.4(1) pp.87–88.
- **[STACKS-03C3](https://stacks.math.columbia.edu/tag/03C3)**. The Stacks Project Authors, *Lemma 10.159.1 (03C3)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma 10.159.1, first paragraph; Lemma 10.159.1, directed colimit and transfinite proof; Lemma 10.159.1 and comment 7831; Lemma 10.159.1, specification of extension isomorphism
- **[STACKS-06LD](https://stacks.math.columbia.edu/tag/06LD)**. The Stacks Project Authors, *Section 15.28 (06LD): Completion and flatness*. Online mathematical statement and proof, accessed 5 October 2026 Read: Entire mathematical section, including proofs and displayed formulas; comments inspected.; Completion and flatness, finite-module comparison
- **[STACKS-0327](https://stacks.math.columbia.edu/tag/0327)**. The Stacks Project Authors, *Definition 10.160.5 (0327)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Definition 10.160.5
- **[STACKS-0328](https://stacks.math.columbia.edu/tag/0328)**. The Stacks Project Authors, *Lemma 10.160.6 (0328)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma 10.160.6, corrected current proof
- **[STACKS-0323](https://stacks.math.columbia.edu/tag/0323)**. The Stacks Project Authors, *Section 10.160 (0323): The Cohen structure theorem*. Online mathematical statement and proof, accessed 5 October 2026 Read: Entire mathematical section, including proofs and displayed formulas; comments inspected.; Lemma 10.160.7
- **[PQ-24](https://arxiv.org/pdf/2404.14622)**. Vytautas Paškūnas and Julian Quast, *On local Galois deformation rings: generalised reductive groups*. arXiv:2404.14622v2, 9 January 2026, 122 PDF pages; downloaded from the then-current arXiv PDF URL. Read: Lemma5.15, printed pp.38–39, entire statement and proof.
- **[STACKS-06SD](https://stacks.math.columbia.edu/tag/06SD)**. The Stacks Project Authors, *Lemma 90.4.6 (06SD)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma90.4.6, derivation construction in the proof
- **[KW-II-09](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf)**. Chandrashekhar Khare and Jean-Pierre Wintenberger, *Serre’s modularity conjecture (II)*. Authors’ publicly hosted 98-page copy of Serre’s modularity conjecture (II); the copy read is identified by its SHA-256. No claim of collation with the journal typesetting. Read: §2.1 pp.5–6 entire section; Proposition2.2 and proof, pp.9–10; §2.6 p.13.
- **[STACKS-06SE](https://stacks.math.columbia.edu/tag/06SE)**. The Stacks Project Authors, *Lemma 90.4.7 (06SE)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma90.4.7, proof via stable Artinian images; Lemma90.4.7, stabilized-image proof
- **[BHATT-18](https://arxiv.org/pdf/1608.08882v2)**. Bhargav Bhatt, *On the direct summand conjecture and its derived variant*. arXiv:1608.08882v2, 11 November 2017; the downloaded preprint, not a collation against the journal version. Read: Proposition5.2 pp.8–9 and Lemma5.3 pp.9–10, statements and complete proofs.
- **[ANS-JAHNKE-22](https://www.numdam.org/item/10.5802/cml.84.pdf)**. Sylvy Anscombe and Franziska Jahnke, *The model theory of Cohen rings*. Version of record, Confluentes Mathematici 14 (2022), no.2, pp.1–28, doi:10.5802/cml.84. Read: §4 Teichmüller embedding process; Theorem5.1; Theorem6.2 entire proof; Theorems6.4–6.7, printed pp.13–16.
- **[STACKS-0319](https://stacks.math.columbia.edu/tag/0319)**. The Stacks Project Authors, *Lemma 10.96.9 (0319)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma10.96.9
- **[STACKS-0394](https://stacks.math.columbia.edu/tag/0394)**. The Stacks Project Authors, *Lemma 10.97.7 (0394)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma10.97.7
- **[STACKS-07N9](https://stacks.math.columbia.edu/tag/07N9)**. The Stacks Project Authors, *Lemma 10.97.8 (07N9)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma10.97.8, Artinian quotient product paragraph; Lemma10.97.8; Lemma10.97.8, specialization to an already complete base
- **[STACKS-032D](https://stacks.math.columbia.edu/tag/032D)**. The Stacks Project Authors, *Lemma 10.160.11 (032D)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.; Lemma10.160.11, finite parameter quotient; Lemma10.160.11, module finiteness step
- **[BIP-23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S2050508623000252)**. Gebhard Böckle, Ashwin Iyengar and Vytautas Paškūnas, *On local Galois deformation rings*. Version of record, Forum of Mathematics, Pi 11 (2023), e30, doi:10.1017/fmp.2023.25, 54 pages. Read: §3.10 coefficient rings pp.22–23; Lemmas3.35–3.37 pp.24–25 entire statements and proofs; Lemma6.3 p.47 entire proof.
- **[BCGP-25](https://arxiv.org/pdf/2502.20645v1)**. George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Modularity theorems for abelian surfaces*. arXiv:2502.20645v1, 28 February 2025. Read: §1.8.2, PDF p.8, complete notation paragraph defining CNL_Λ.
- **[STACKS-0322](https://stacks.math.columbia.edu/tag/0322)**. The Stacks Project Authors, *Proposition 10.158.9 (0322)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.
- **[STACKS-0598](https://stacks.math.columbia.edu/tag/0598)**. The Stacks Project Authors, *Lemma 10.86.4 (0598)*. Online mathematical statement and proof, accessed 5 October 2026 Read: The entire mathematical statement/proof at the downloaded tag, including displayed formulas; comments inspected.
