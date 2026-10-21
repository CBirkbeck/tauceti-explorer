# Néron models and semistable abelian varieties, Part II

## Genus-one fibrations and rational elliptic surfaces

This roadmap extends R11.2 and R11.4 of `NeronModelsAndSemistableAbelianVarieties`. It builds the conductor and pinching interfaces needed to pass from geometric genus-one fibers to finite-field forms, compares multiple fibers with their good-reduction Jacobians, constructs bounded global Weierstrass equations on rational Jacobians, and specifies the certificates for fourteen surface candidates over F₂. The Enriques nonexistence argument is outside its scope.

A layer is **planned** when its stated targets have exact contracts and their dependency chains end in the pinned libraries, another owner's export or a recorded gap. Every layer here is planned. None is closed: the supplier, source and geometric obligations at the end of this document remain part of the mathematics required for closure. Every implementation status is `unchecked`.

The contracts are organized by target. Coordinate formulas, inverse laws, restriction naturality and projection equations appear in the owning object's API and proof outline. Each API contract states its own additional hypotheses and proof inputs.

[The packet](../packets/NeronModelsAndSemistableAbelianVarietiesPartII.json) gives the machine-readable contracts, baseline declarations, source provenance, supplier requests and route coverage. [The suggested file](../suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean) gives proposed Lean signatures and example statements. Its omission ledger identifies full geometric conditions requiring the supplier types specified below. Those conditions belong to the mathematical targets even where the suggested signature shows only part of the data.

## Conventions and ownership

Schemes, their native ideal-sheaf data and their scheme morphisms are the geometric carriers. Rings are commutative and may be zero or nonreduced wherever the stated hypotheses allow them. No proof replaces a conductor by its radical. For a subring A of B, the conductor is the ideal consisting of b such that bB is contained in A. For a ring map φ:A→B, use the conductor K of its range subring and I=φ⁻¹K; injectivity is imposed only by the result that needs it.

For a finite schematically dominant map f:Y→P, write I_f for the native target conductor ideal, C_f for its closed subscheme and D_f for the closed subscheme of Y defined by I_f pulled back along f. The structure maps determine D_f→C_f. Sections on an open U always mean the actual scheme structure sheaf, with the actual map induced by f and its source restriction. The conductor difference map has sign b−c. Its additive sheaf sequence is short exact; surjectivity on sections is asserted on affine opens, and local surjectivity gives the sheaf epimorphism. Surjectivity of the last section map on an arbitrary open is not asserted.

For the polynomial pinch, k is any field, q(t)=t²+at+b and A_q=k+qk[t]. No perfectness, separability, characteristic or discriminant assumption is added to this algebraic construction. Its chosen generators are x=q and y=tq. They satisfy y²+a xy+b x²−x³=0. The normalization chart is Spec of the actual inclusion A_q→k[t]. The global curve C and source N are glued from the specified finite and infinity charts, and ν:N→C is the actual glued map. A function-field comparison uses generic stalks and the actual ν-induced germs. An arbitrary isomorphism of abstract fields is insufficient.

A genus-one fibration has the properness, flatness, regularity, geometric connectedness and cohomological genus hypotheses stated in its contract. Its regular generic curve need not be smooth: elliptic and quasielliptic cases stay distinct. For a fiber divisor D=Σm_iC_i, its multiplicity is gcd(m_i), its primitive divisor divides each coefficient by that gcd, and its reduction has coefficient one on every component. The primitive divisor and the reduction need not agree. Geometric Kodaira symbols refer to the primitive geometric fiber; a closed degree-two point gives two conjugate geometric fibers over an algebraic closure.

For a rational Jacobian, O denotes the zero-section and F a fiber. Their intersection matrix is [[0,1],[1,−1]]. The orthogonal complement is the negative definite even unimodular rank-eight lattice. Abstract lattice classification is imported; realizing the actual geometric pairing is a target here. Smooth supersingular fibers are distinguished from ordinary fibers and from quasielliptic cusps. In the characteristic-two additive reduction criterion, the fiber is already singular: vanishing of c₄ alone can also occur on a smooth supersingular fiber.

A bounded global equation has coefficients a₁,a₂,a₃,a₄,a₆ of degrees at most 1,2,3,4,6. On the chart s=1/t the coordinates are x′=s²x, y′=s³y and a_i′(s)=s^i a_i(1/s). Degree-bounded coefficient data does not itself imply minimality, rationality or a regular resolved surface.

The complete surface classification concerns relatively minimal geometrically rational Jacobian elliptic surfaces over P¹_F₂ with constant Picard scheme and **at most one rational base point whose fiber is semistable or smooth supersingular**. This condition is retained in the G.4 consequences and G.6 targets. The fourteen equations specify candidates and their required certificates. Completeness and pairwise inequivalence remain conditional on the exhaustive certificate.

## Library and upstream inputs

The elaboration baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The native Spec, section, relative-normalization and generic-stalk interfaces supply the comparison maps used here. Finiteness supplies integrality through the finite-map criterion; the separate integral-map instance makes the map to relative normalization an isomorphism. The packet lists the exact declarations and their operative hypotheses.

A target-specific overlap screen also uses upstream main `070dc2becd74419e76303ede84b465ed4a69461f` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The StableReduction and EllipticCurves contracts supply nodes and dual graphs, coherent smooth-curve theory, surface intersections and regular minimal models, equation-side reduction and Tate's algorithm, variable changes and elliptic point counts. Their smooth generic-curve and equation-side hypotheses are preserved; they do not supply the missing arbitrary genus-one scheme presentation or a quasielliptic regular compactification. The nine post-snapshot roadmap Suggested files and the current library contain no matching Ferrand/conductor or quadratic-pinching target identified by this screen. IntegralLattices supplies abstract lattices, not the geometric Picard realization. Nothing from these existing owners is replanned.

The exact planned `SchemeAndStackFoundations:SF.0/flat-annihilator`, `ideal-comap-top` and `ideal-restrict-top` exports have the generality required here. They are supplier contracts rather than existing implementations. General algebraic-space carriers and descent remain with SF.1; general Weierstrass scheme presentation, flat patching and coherent geometry remain with their named SF.3–SF.6 and moduli owners. General Lang and Tsen inputs require the ownership and proof closure recorded below. This roadmap owns their genus-one consumers, rather than reintroducing generic foundational theories.

## Layers and dependency chain

| Layer | Target | Imports | Planning status |
| --- | --- | --- | --- |
| G.0 | Ferrand pinching and conductor squares | `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `NeronModelsAndSemistableAbelianVarieties:R11.2`, `SchemeAndStackFoundations:SF.3` | planned; proof gaps recorded |
| G.1 | Genus-one fibers and finite-field forms | `G.0`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.5` | planned; proof gaps recorded |
| G.2 | Multiple fibers over excellent discrete valuation rings | `G.1`, `NeronModelsAndSemistableAbelianVarieties:R11.2`, `NeronModelsAndSemistableAbelianVarieties:R11.4`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.3` | planned; proof gaps recorded |
| G.3 | Rational Jacobians and global Weierstrass equations | `G.1`, `G.2`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5`, `AlgebraicModuliForArithmeticGeometry:R09.1` | planned; proof gaps recorded |
| G.4 | Picard constancy and fiber configurations | `G.3`, `SchemeAndStackFoundations:SF.5`, `SchemeAndStackFoundations:SF.6`, `WeilConjectures:WC.7`, `NeronModelsAndSemistableAbelianVarieties:R11.4` | planned; proof gaps recorded |
| G.5 | Fourteen explicit models over F₂ | `G.3`, `G.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv` | planned; proof gaps recorded |
| G.6 | Completeness and classification certificates | `G.5`, `G.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv` | planned; proof gaps recorded |

## G.0 — Ferrand pinching and conductor squares

The shared geometric foundation is a pushout with both topology and structure sheaves specified. The affine construction uses a ring fiber product along a surjective quotient. Scheme existence retains Ferrand's compatible affine-neighborhood criterion; finite algebraic-space pinching uses the broader étale construction. A finite schematically dominant conductor square is constructed from the full native ideals, with arbitrary-open reconstruction, additive sheaf exactness and categorical Scheme descent. Flat comparison recomputes the conductor after scalar extension and relates the actual closed subschemes; two-step tower comparisons are part of the API. Three-step coherence and space-carrier integration remain explicit obligations.

**Planets:** Ferrand pushouts; General conductor; Affine pinching; Global pinching; Conductor squares; Algebraic-space pinching.

### Ferrand geometric pushouts

Target `key/ferrand-pushouts`. Proposed declaration: `GeometricPushout`.

For a commutative square Z→Y, Z→Z′, Y→P, Z′→P, a geometric pushout means the underlying space of P is the quotient pushout of |Y|←|Z|→|Z′| and the canonical sheaf map O_P→a_*O_Y ×_(ai)_*O_Z b_*O_Z′ is an isomorphism. A Ferrand datum requires i:Z→Y to be a closed immersion and g:Z→Z′ finite; a Ferrand pushout is its geometric pushout in schemes, or in algebraic spaces when the relevant existence theorem supplies that category. No scheme existence is built into the datum. Define the general geometric-square predicate first, then this finite-pinching specialization. For algebraic spaces the structure-sheaf equality is on the small étale site; the every-Zariski-open section formulation is its scheme specialization. Finite algebraic-space existence is supplied by G.0/algebraic-space-existence without the scheme affine-neighborhood assumption.

**Hypotheses.** Schemes over a common base, or algebraic spaces over a common scheme base via the SF.1 carrier.

**Inputs.** `mathlib:AlgebraicGeometry.IsClosedImmersion`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.Scheme.Hom.appLE`, `SchemeAndStackFoundations:SF.1`.

**Source and scope.**

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §§4.1,5.1,5.4,7.1, pp565,568,570,575–578. Use the sheaf fiber product and quotient topology; global scheme existence is a separate theorem with affine-neighbourhood hypotheses.

- [Keel’s base point free theorem and quotients in mixed characteristic](https://par.nsf.gov/servlets/purl/10429755), Definition 2.17, p669; Lemmas 2.23,2.25, pp672–673. The sheaf equality is essential; Witaszek additionally assumes representable universal homeomorphisms. This is a restriction, not a property of every node pinching.

**Proof outline.**

1. Use actual scheme morphisms and their maps on spaces and sections.

2. For every open U⊂P impose the pullback of the three section rings on a⁻¹U, b⁻¹U and (ai)⁻¹U; these natural conditions express the sheaf equality. In the algebraic-space extension use the small étale site and test the sheaf comparison on affine étale charts; Zariski sections alone are insufficient.

3. Restrict to closed i and finite g for Ferrand data; restrict instead to qcqs i and universal-homeomorphism g,a for Witaszek 2.17.

**Consumers.** `Schröer §3; items170–171`: Construct nonsplit nodal fibers. `Witaszek 2.27–2.28`: Recognize conductor squares and glue line bundles. `StableReduction Layer3 clutching`: Compare with the existing smooth-section pushout without rebuilding it.

**API.**

- `GeometricPushout.of_affine` (constructor): For B→C surjective and A′→C finite, Spec(B×_C A′) gives the finite-pinching geometric square.

- `GeometricPushout.lift` (universal-property): For a Ferrand square, or a Witaszek2.17 geometric square with its full hypotheses, compatible Y→T and Z′→T induce a unique P→T.

- `GeometricPushout.flat_baseChange` (functoriality): For a Ferrand square, or a Witaszek2.17 geometric square with qcqs hypotheses, every flat T→P induces a geometric square on all four base changes.

- `GeometricPushout.witaszek_iff` (compatibility): With qcqs i and universal-homeomorphism g,a, the general predicate is equivalent to Witaszek Definition2.17.

- `FerrandPushout.complementIso` (equivalence): In a Ferrand pushout a identifies Y∖Z with P∖Z′.

- `FerrandPushout.conductor` (characterisation): The conductor square of a finite inclusion of reduced Noetherian rings is this geometric square; no birational hypothesis is necessary.

- `FerrandPushout.exists_algebraicSpace` (constructor): For algebraic spaces Y,Z,Z′ over a scheme S, a closed immersion i:Z→Y and a finite morphism g:Z→Z′ have a categorical pushout P=Y⊔Z Z′ in algebraic S-spaces, with affine canonical maps Y→P and Z′→P. No Noetherian, quasi-separated, reduced, radicial or scheme affine-neighborhood hypothesis is imposed.

- `FerrandPushout.isScheme_iff` (characterisation): For a finite pinching datum whose three components Y,Z,Z′ are schemes, its algebraic-space pushout P is a scheme if and only if for every point z′∈Z′ the finite set i(g⁻¹(z′)) lies in an affine open of Y. Under this condition the canonical scheme pushout agrees with P, including universality against algebraic-space targets.

- `FerrandPushout.conductor_global` (characterisation): For a finite surjective morphism of reduced Noetherian schemes, the actual globally constructed conductor subschemes and induced map give a geometric and categorical Scheme pushout, with the native cartesian comparison and flat-recomputed conductor compatibility; no birational hypothesis is imposed.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `GeometricPushout.node`: For char k≠2, pinching t=±1 of A¹ gives k+(t²−1)k[t]=k[t²−1,t(t²−1)]={f:f(1)=f(−1)}.

- `GeometricPushout.cusp`: Pinching V(t²) to Spec k gives k+t²k[t]=k[t²,t³].

- `GeometricPushout.identity`: If g is an isomorphism, the square has P≅Y with its actual structure sheaf.

- `GeometricPushout.topological_not_geometric`: The subring k[t²,t⁵] misses t³, so the corresponding universal-homeomorphism square with V(t²)→Spec k is not the geometric pushout.

- `GeometricPushout.nonsplit_node`: Pinching a separable quadratic closed point on P¹ gives the nonsplit rational node; its normalization has two conjugate geometric branches.

- `FerrandPushout.affine_space_compat`: For surjective B→C and finite A′→C, the algebraic-space pushout is canonically Spec(B×_C A′), and the Hom comparison is bijective for every algebraic-space target.

- `FerrandPushout.no_affine_neighbourhood`: If a k-scheme Y has two distinct closed k-points with no common affine open, pinching their disjoint union to Spec k produces an algebraic space which is not a scheme.

**Acceptance beyond the stated contract**

- For char k≠2, pinching t=±1 of A¹ gives k+(t²−1)k[t]=k[t²−1,t(t²−1)]={f:f(1)=f(−1)}.

- Pinching V(t²) to Spec k gives k+t²k[t]=k[t²,t³].

- If g is an isomorphism, the square has P≅Y with its actual structure sheaf.

- The subring k[t²,t⁵] misses t³, so the corresponding universal-homeomorphism square with V(t²)→Spec k is not the geometric pushout.

- Pinching a separable quadratic closed point on P¹ gives the nonsplit rational node; its normalization has two conjugate geometric branches.

- For surjective B→C and finite A′→C, the algebraic-space pushout is canonically Spec(B×_C A′), and the Hom comparison is bijective for every algebraic-space target.

- If a k-scheme Y has two distinct closed k-points with no common affine open, pinching their disjoint union to Spec k produces an algebraic space which is not a scheme.

### Conductor of an arbitrary subring

Target `G.0/subring-conductor`. Proposed declaration: `Subring.conductor`.

For a commutative ring B and subring A⊂B define the B-ideal c(A,B)={b∈B:∀x∈B,bx∈A}. It lies in A and is the largest B-ideal contained in A. It needs no finite, reduced, Noetherian or birational hypotheses.

**Inputs.** `mathlib:conductor`.

**Source and scope.**

- [Keel’s base point free theorem and quotients in mixed characteristic](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, p674. Generalize the ring construction; finiteness and reducedness belong to its geometric application.

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem5.1, printed p568, complete principal-localization paragraph, with Lemma1.3(b) and its converse, pp556–557. Native localization adapter for the common ideal. No injectivity of the original map or domain hypothesis is assumed.

- [Conductor pushouts and authored actual nilpotent-section tests](https://stacks.math.columbia.edu/tag/0ET0), Lemma37.14.1, full displayed statement and proof; authored conductor-specific deduction using native quotient-section comparison. The source motivates full ideal and structure-sheaf data in conductor pushouts. The diagonal calculation and actual nilpotent-section formulas are authored deductions from the retained conductor contracts and native APIs, not claims quoted from the source.

**Proof outline.**

1. Use the set condition to verify the ideal operations; multiplication by1 shows containment.

2. Compare with the existing monogenic conductor by equality of the underlying subrings.

3. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `Witaszek Definition2.27`: The map need not be birational. `Ferrand §1.1`: Produce the common quotient ideal.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: All schemes in a statement share an arbitrary universe. Rings are arbitrary commutative rings, including zero rings; no reducedness, Noetherianity or birationality is imposed. Finiteness, schematic dominance, flatness and affineness are required exactly where stated. The actual full conductor ideals and native closed-subscheme carriers are used. Generic quotient, section and pullback theories remain imported.

- `Subring.conductor_mem` (compatibility; assumptions H1): For any commutative ring B, subring A and b in B, b belongs to the full B-ideal c(A,B) if and only if bx belongs to A for every x in B.

- `Subring.conductor_le` (compatibility): For an arbitrary subring S⊂B, every element of its general ambient conductor c(S,B) belongs to S.

- `Subring.conductor_greatest` (universal-property): A B-ideal I is contained in c(A,B) iff its underlying set lies in A.

- `Subring.conductor_mono` (functoriality): A⊂A′ implies c(A,B)⊂c(A′,B).

- `Subring.conductor_adjoin` (compatibility): For A the underlying subring of R[x]⊂B this is Mathlib conductor R x.

- `AffinePinching.conductor_away_bijective` (compatibility): For any commutative ring B, subring S⊂B and t∈S whose ambient value lies in c(S,B), the native map S_t→B_t induced by the subtype inclusion is bijective, for any native localization carriers.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `Subring.conductor_top`: c(B,B)=B.

- `Subring.conductor_cusp`: The conductor of k[t²,t³]⊂k[t] is t²k[t].

- `Subring.conductor_node`: For char k≠2 the conductor of k+(t²−1)k[t] is (t²−1)k[t].

- `Subring.conductor_quadratic_field`: For a proper field extension k⊂E, the conductor is zero even when E/k is finite separable.

**Acceptance beyond the stated contract**

- c(B,B)=B.

- The conductor of k[t²,t³]⊂k[t] is t²k[t].

- For char k≠2 the conductor of k+(t²−1)k[t] is (t²−1)k[t].

- For a proper field extension k⊂E, the conductor is zero even when E/k is finite separable.

### Affine Ferrand existence

Target `G.0/affine-existence`. Proposed declaration: `ferrand_affine_existence`.

For p:B→C surjective and q:A′→C finite, Spec(B×_C A′) is the geometric and categorical pushout of Spec B←Spec C→Spec A′.

**Inputs.** `mathlib:CommRingCat.pullbackCone`, `mathlib:CommRingCat.pullbackConeIsLimit`, `SchemeAndStackFoundations:SF.0`, `G.0/common-ideal-away-equiv`, `key/ferrand-pushouts`, `SchemeAndStackFoundations:SF.1`.

**Source and scope.**

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §§1.1–1.3, pp555–556. Algebraic kernel identification underlying the affine square.

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §1.3, p556. The affine square is also cartesian; tensor-quotient input remains at SF.0.

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem5.1, printed p568, complete principal-localization paragraph, with Lemma1.3(b) and its converse, pp556–557. Native localization adapter for the common ideal. No injectivity of the original map or domain hypothesis is assumed.

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Proposition5.6(3), pp572–573. Direct module-generation proof; no Noetherian assumption is needed.

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem5.1 and proof, pp568–569. Categorical property is proved for arbitrary scheme targets, not only affine targets.

**Proof outline.**

1. The pullback ring supplies compatible morphisms and the affine section identities.

2. Use the localization-complement node and the surjective projection to identify the quotient topology.

3. Given maps to an arbitrary scheme T, cover the image by affine opens and glue the ring lifts, rather than claiming Spec sends every ring limit to a scheme colimit.

4. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**API.**

- `pullback_projection` (compatibility): For p:B→C surjective and q:A′→C, set A=B×_C A′ using the baseline pullback. The projection A→A′ is surjective and its kernel maps isomorphically onto ker p as an ideal of B.

- `cartesian_affine` (compatibility): For the preceding A, with I=ker(A→A′)=ker p⊂B, the natural map B⊗_A A′→C is an isomorphism.

- `localization_complement` (compatibility): For t∈I in the previous square, A[1/t]→B[1/t] is an isomorphism.

- `finite_projection` (compatibility): If q:A′→C is finite and p:B→C surjective, then the projection A=B×_C A′→B is finite.

The packet attaches the exact source and proof-input list to each API contract.

**Acceptance beyond the stated contract**

- The cusp uses C=k[t]/t²; a reduced-only definition must fail this test.

### Compatible affine neighborhoods

Target `G.0/compatible-affine-neighbourhoods`.

If g:Z→Z′ is finite and each set g⁻¹(z′) lies in an affine open of Y, then around every z′ there are affine U⊂Y and V⊂Z′ with U∩Z=g⁻¹V. These neighborhoods cover the pinching locus.

**Hypotheses.** i:Z→Y closed; g finite.

**Inputs.** `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

**Source and scope.**

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem7.1B and proof, pp575–578. Use the exact finite-fiber affine-neighbourhood condition, with finite-algebra separation as an explicit foundation request.

**Proof outline.**

1. Shrink V using finite closedness of g to remove the image of Z∖U.

2. Use the finite fiber algebra and a principal-open separation argument to obtain a section invertible on the entire fiber.

3. Lift the section through the surjective restriction to Z∩U and refine U,V to matching principal opens.

**Acceptance beyond the stated contract**

- (AF) on Y implies the condition; curves and quasi-projective Y satisfy it.

### Global Ferrand existence

Target `G.0/global-existence`.

For a closed immersion i:Z→Y and finite g:Z→Z′ whose fibers admit affine neighborhoods in Y, the geometric pushout exists as a scheme; Y→P is finite, Z′→P closed, the square cartesian, and Y∖Z≅P∖Z′.

**Inputs.** `G.0/compatible-affine-neighbourhoods`, `G.0/affine-existence`, `SchemeAndStackFoundations:SF.1`.

**Source and scope.**

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §§4.1,5.1,5.4,7.1, pp565,568,570,575–578. Use the sheaf fiber product and quotient topology; global scheme existence is a separate theorem with affine-neighbourhood hypotheses.

**Proof outline.**

1. Build affine pushouts on the compatible-neighborhood node.

2. Use localization-complement and uniqueness of affine lifts to identify intersections.

3. Glue the schemes and structure sheaves; cartesian, finite and closed properties are local on P.

**Acceptance beyond the stated contract**

- The (AF) version of Ferrand5.4 is a corollary, not an unconditional global scheme theorem.

### Flat base change of geometric squares

Target `G.0/flat-base-change`.

For a Ferrand scheme pushout P and any flat morphism T→P, its pullback square is a Ferrand geometric pushout. Affinely, tensoring the ring fiber-product exact sequence with a flat A-algebra F gives (B×_C A′)⊗_A F≅(B⊗_A F)×_(C⊗_A F)(A′⊗_A F).

**Hypotheses.** All four maps qcqs; finite pinching satisfies this.

**Inputs.** `G.0/global-existence`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.3`.

**Source and scope.**

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §4.4, p567. Includes the qcqs/universally-submersive hypotheses.

- [Keel’s base point free theorem and quotients in mixed characteristic](https://par.nsf.gov/servlets/purl/10429755), Lemma2.23, p672. Flatness preserves the exact sequence; arbitrary tensoring is not asserted.

**Proof outline.**

1. Use flat exactness on 0→A→B⊕A′→C→0.

2. Apply flat base change to qcqs direct images and sheafify the ring identity.

3. Finite/closed morphisms and the quotient topology survive the base change; use the common ideal to identify the affine topologies.

**Acceptance beyond the stated contract**

- Nonflat tensoring may destroy the kernel; no unrestricted base-change API is exported.

### Generalized conductor square

Target `G.0/conductor-square`.

For a finite inclusion A⊂B of reduced Noetherian rings and I=c(A,B), A→B×_(B/I)(A/I) is an isomorphism. Thus the conductor diagram is a Ferrand square, without a birational hypothesis.

**Inputs.** `G.0/common-ideal-cartesian`, `G.0/subring-conductor`, `G.0/affine-existence`, `SchemeAndStackFoundations:SF.0`.

**Source and scope.**

- [Keel’s base point free theorem and quotients in mixed characteristic](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, pp674–675. The generalized conductor includes finite maps of larger generic degree.

**Proof outline.**

1. Use the arbitrary-subring conductor reconstruction lemma for the affine ring identity; its common-ideal kernel and compatible-pair lifting are explicit prerequisite nodes.

2. If b mod I is represented by a∈A, then b−a∈I⊂A, giving the inverse.

3. The global Scheme comparison is supplied separately by conductor-scheme-geometric and conductor-scheme-pushout, using the native conductor subschemes; the affine ring identity alone does not establish global gluing.

**Acceptance beyond the stated contract**

- For a proper finite field extension the conductor is zero and the square is still valid.

### Line-bundle patching over a conductor square

Target `G.0/line-bundle-patching`.

For a generalized conductor square, invertible sheaves on P form the groupoid fiber product of invertible sheaves on Y and Z′ over Z. The gluing datum includes an isomorphism on Z.

**Inputs.** `G.0/conductor-square`, `SchemeAndStackFoundations:SF.3`, `AlgebraicModuliForArithmeticGeometry:A0-extension`.

**Source and scope.**

- [Keel’s base point free theorem and quotients in mixed characteristic](https://par.nsf.gov/servlets/purl/10429755), Lemma2.28 and proof, pp675–676. A set-level equality of Picard groups omits the identification and automorphism data.

**Proof outline.**

1. Glue the underlying modules by the kernel of the difference map with the specified identification.

2. Use Milnor patching to establish local freeness of rank1.

3. Verify both compositions of restriction and gluing are naturally isomorphic to identity, including morphisms.

**Acceptance beyond the stated contract**

- Gluing trivial bundles with different units on Z can give different global line bundles.

### Finite pinching in algebraic spaces

Target `G.0/algebraic-space-existence`. Proposed declaration: `FerrandPushout.exists_algebraicSpace`.

For algebraic spaces Y,Z,Z′ over a scheme S, a closed immersion i:Z→Y and a finite morphism g:Z→Z′ have a categorical pushout P=Y⊔Z Z′ in algebraic S-spaces, with affine canonical maps Y→P and Z′→P. No Noetherian, quasi-separated, reduced, radicial or scheme affine-neighborhood hypothesis is imposed.

**Inputs.** `key/ferrand-pushouts`, `SchemeAndStackFoundations:SF.1`, `G.0/affine-existence`, `mathlib:CommRingCat.pullbackConeIsLimit`, `SchemeAndStackFoundations:SF.3`, `G.0/global-existence`.

**Source and scope.**

- [Ferrand pushouts for algebraic spaces](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem5.3.1(ii), proof pp15–16; Lemmas5.1.2,5.1.4 p14; Theorem5.2.5 p15. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

- [Ferrand pushouts for algebraic spaces](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.2.1, injectivity argument pp10–11. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

- [Ferrand pushouts for algebraic spaces](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.2.1, surjectivity argument p11. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

- [Ferrand pushouts for algebraic spaces](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Lemma4.3.1 and proof pp12–13; Lemma4.1.2 pp9–10; Lemma2.1.6 p4. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

- [Ferrand pushouts for algebraic spaces](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem6.2.1(i), overlap argument pp17–18; Theorem4.4.1 p13. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

- [Lemma65.13.1: automatic diagonal properties](https://stacks.math.columbia.edu/tag/02X4), Lemma65.13.1, displayed proof. Diagonal properties are automatic for algebraic spaces; they do not impose separatedness on Y.

- [Lemma67.9.8: separatedness under universally closed surjections](https://stacks.math.columbia.edu/tag/05Z2), Lemma67.9.8(4), displayed diagonal proof. Use only the finite-surjective specialization after constructing the secondary quotient.

- [Section67.50: separated locally quasi-finite representability](https://stacks.math.columbia.edu/tag/0417), Proposition67.50.2, displayed proof. Representability needs only local quasi-finiteness and separatedness, not quasi-compactness of the entire étale overlap.

- [Ferrand pushouts for algebraic spaces](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem6.2.1(ii)(b), pp17–18; Theorem4.4.1 p13. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

- [Ferrand pushouts for algebraic spaces](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.4.2(ii) and proof p13. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

- [Ferrand pushouts for algebraic spaces](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.4.2(i) and proof p13; Theorem4.4.1(ii) p13; §3.3.6 p7. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

- [Ferrand pushouts for algebraic spaces](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem6.3.5, finiteness case and proof p19. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

- [Ferrand pushouts for algebraic spaces](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.4.2(iii) and proof p13. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

**Proof outline.**

1. Use pinching-etale-cover to form D0→D and pinching-overlap-scheme for D1=D0×D D0.

2. Form the schematic pushouts P0,P1 on their compatible open affine covers. Their universality in algebraic spaces follows by gluing the two affine-space Hom lemmas.

3. Use pinching-etale-relation to identify P1⇉P0 as an étale equivalence relation and invoke the SF.1 algebraic-space quotient theorem to construct P.

4. Compatible maps out of D descend through P0 and P1, yielding the categorical universal property of P. Effectivity supplies D0=D×P P0 and D1=D×P P1; descend affineness of the canonical maps from the affine local pinches.

5. Finiteness, the closed immersion, cartesianness and the geometric sheaf condition are separate nodes, rather than silently bundled assumptions of this existence theorem.

6. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**API.**

- `FerrandPushout.pinching_etale_cover` (compatibility): For algebraic spaces over a scheme S, with i:Z→Y closed and g:Z→Z′ finite, there are indexed affine schemes Zα,Yα,Z′α, étale covers of Y and Z′, and specified cartesian identifications Zα=Z×Y Yα=Z×Z′ Z′α. Thus the datum has a componentwise cartesian affine étale covering. Neither Noetherian nor quasi-separated hypotheses are required.

- `FerrandPushout.affine_space_hom_injective` (compatibility): Let p:B→C be surjective, q:A′→C finite, A=B×C A′, and P=Spec A. For any algebraic S-space T, restriction HomS(P,T)→HomS(Spec B,T)×HomS(Spec C,T)HomS(Spec A′,T) is injective.

- `FerrandPushout.affine_space_hom_surjective` (compatibility): For the affine datum and P of affine-space-hom-injective and every algebraic S-space T, each compatible pair of maps Spec B→T and Spec A′→T extends to a map P→T.

- `FerrandPushout.etale_relation` (compatibility): Suppose D1⇉D0 is an étale equivalence relation of finite pinching data, every componentwise square is cartesian, and D0,D1 admit compatible open affine coverings. Their schematic pushouts P1⇉P0 form an étale equivalence relation.

- `FerrandPushout.overlap_isScheme` (compatibility): Let D0 be the disjoint union of the compatible affine étale charts of a finite pinching datum D and put D1=D0×D D0 componentwise. Then D1 admits a compatible open affine covering, so its pinching pushout P1 is a scheme. These opens are cartesian in all three components.

- `FerrandPushout.space_isPullback` (compatibility): For the effective finite pinching pushout P, the canonical square Z→Y, Z→Z′, Y→P, Z′→P is cartesian in algebraic spaces, including nonreduced Z.

- `FerrandPushout.space_geometric` (compatibility): The effective finite pinching square satisfies the general GeometricPushout predicate: the underlying topological space is the quotient pushout and, on the small étale site of P, O_P≅a_*O_Y×c_*O_Z b_*O_Z′, where c=ai=bg. In particular every affine étale U→P gives the corresponding pullback of section rings on its three inverse images.

- `FerrandPushout.space_isFinite` (compatibility): For the effective finite pinching P of algebraic-space-existence, the canonical map a:Y→P is finite.

- `FerrandPushout.space_closed_complement` (compatibility): For the effective finite pinching P, b:Z′→P is a closed immersion and the induced Y∖Z→P∖b(Z′) is an isomorphism of open algebraic spaces.

The packet attaches the exact source and proof-input list to each API contract.

**Acceptance beyond the stated contract**

- A finite separable quadratic point pinch is included although it is not a universal-homeomorphism pinch.

- When the datum is affine this P is canonically the existing Spec of the ring pullback.

- This theorem does not assert P is a scheme.

### Flat compatibility of algebraic-space pinching

Target `G.0/space-flat-base-change`. Proposed declaration: `FerrandPushout.space_flat_baseChange`.

For an effective finite pinching P and any flat algebraic-space morphism F→P, the canonical comparison from the pinching pushout of the three pullbacks to F is an isomorphism. In particular these pullbacks realize the same geometric square; no arbitrary nonflat compatibility is asserted.

**Inputs.** `G.0/algebraic-space-existence`, `G.0/flat-base-change`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Source and scope.**

- [Ferrand pushouts for algebraic spaces](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem6.3.2(i), pp18–19, forward equivalence proof. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

**Proof outline.**

1. Finite and closed morphisms are stable under base change, so the pullback datum has its own effective pinching by algebraic-space-existence.

2. On the source- and target-étale presentations apply the affine flat ring/space patching equivalence requested at SF.3 and the existing flat-base-change calculation.

3. Descend the unique comparison isomorphism at SF.1. Equivalently apply TT6.3.2(i) to the flat object F over P.

4. The two iterated base-change comparisons agree because they induce the same maps on all three components; the categorical universal property supplies uniqueness.

**Acceptance beyond the stated contract**

- Étale base changes are included.

- A nonflat ring quotient can destroy the fiber-product exact sequence; a flatness-free version is not exported.

### When finite pinching is a scheme

Target `G.0/space-scheme-recognition`. Proposed declaration: `FerrandPushout.isScheme_iff`.

For a finite pinching datum whose three components Y,Z,Z′ are schemes, its algebraic-space pushout P is a scheme if and only if for every point z′∈Z′ the finite set i(g⁻¹(z′)) lies in an affine open of Y. Under this condition the canonical scheme pushout agrees with P, including universality against algebraic-space targets.

**Inputs.** `G.0/algebraic-space-existence`, `G.0/global-existence`, `G.0/compatible-affine-neighbourhoods`, `SchemeAndStackFoundations:SF.1`.

**Source and scope.**

- [Ferrand pushouts for algebraic spaces](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.2.4 and Example4.2.3, pp11–12; compare Ferrand7.1. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

**Proof outline.**

1. If the fiber affine-neighborhood condition holds, compatible-affine-neighbourhoods and global-existence construct the schematic pinch. The two affine-space Hom lemmas upgrade its categorical universality to all algebraic spaces; uniqueness identifies it with P.

2. Conversely, if P is a scheme, take an affine open neighborhood of b(z′) in P. Its inverse image under the finite map a is affine by space-finite and contains every i(z) with g(z)=z′.

3. The equivalent compatible-open-affine-cover criterion is TT4.2.4. Do not conflate a compatible étale affine cover, which always exists for finite data, with the stronger open affine cover.

**Acceptance beyond the stated contract**

- If Y contains two distinct closed k-points with no common affine open, pinching their disjoint union to Spec k gives an algebraic space which is not a scheme.

- Affine Y and the original quadratic-point-on-P¹ examples satisfy the condition.

- The scheme recognition condition is necessary as well as sufficient.

### Cartesian criterion for common-ideal squares

Target `G.0/common-ideal-cartesian`.

If f(I)=map_f(I) as sets, the square A→B, A→A/I, B→B/map_f(I), A/I→B/map_f(I) is cartesian in commutative rings if and only if ker(f)∩I=0. No finite, reduced or Noetherian hypothesis is imposed.

**Inputs.** `mathlib:CommRingCat.pullbackCone`, `mathlib:CommRingCat.pullbackConeIsLimit`, `mathlib:Ideal.quotientMap`, `mathlib:Ideal.quotientMap_mk`, `mathlib:Ideal.le_comap_map`, `mathlib:Ideal.mk_ker`, `mathlib:Ideal.Quotient.mk_surjective`, `mathlib:Ideal.Quotient.eq`, `mathlib:RingHom.injective_iff_ker_eq_bot`, `mathlib:RingEquiv.ofBijective`, `mathlib:RingEquiv.toCommRingCatIso`, `mathlib:CategoryTheory.Limits.Types.ext_of_isPullback`, `mathlib:CategoryTheory.IsPullback.map`, `mathlib:CategoryTheory.IsPullback.of_iso'`.

**Source and scope.**

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Lemma 1.3, converse, printed pp556–557 (plus ring/underlying-set criterion in §1.1). The image of I must already be an ideal; the kernel intersection is exactly the obstruction to cartesian reconstruction.

- [Conducteur, descente et pincement — bounded native affine continuation](https://www.numdam.org/item/BSMF_2003__131_4_553_0.pdf), Printed pp554–557, introduction and §§1.1–1.4. Authored native reconstruction and exactness deductions from the common-ideal criterion; the all-open normalization comparison additionally consumes this packet’s actual native normalization isomorphism.

**Proof outline.**

1. By compatible-pair lifting the canonical comparison is surjective. By its kernel identity and the native injectivity criterion it is injective exactly when ker(f)∩I=0.

2. Convert the resulting bijective ring map into the native ring equivalence and categorical isomorphism; transfer the existing pullback universal property.

3. Conversely, a cartesian square identifies the comparison with the unique isomorphism between two limits; its kernel is zero, giving the required intersection condition.

4. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**API.**

- `commonIdealComparison_fst` (projection): The B-projection of c_f,I(a) is f(a).

- `commonIdealComparison_snd` (projection): The A/I-projection of c_f,I(a) is [a].

- `commonIdealComparison_unique` (universal-property): Any ring map from A to this native pullback with projections f and the quotient map equals c_f,I.

- `commonIdealComparison` (constructor): For arbitrary commutative rings A,B, a unital ring map f:A→B and an ideal I of A, let J=map_f(I) and q:A/I→B/J be the native induced quotient map. Define the canonical ring homomorphism c_f,I:A→B×_(B/J)(A/I) by a↦(f(a),[a]). No image-ideal, injectivity, finite, reduced or Noetherian assumption is needed to define it.

- `commonIdealComparison_kernel` (compatibility): With the preceding notation, ker(c_f,I)=ker(f)∩I, without any image-ideal assumption.

- `commonIdealComparison_surjective` (compatibility): If the set f(I) equals the underlying set of J=map_f(I), then c_f,I is surjective. This condition says that the image is already an ideal, not merely that the ideal generated by it exists.

- `conductorRing_isPullback` (compatibility): For an arbitrary subring A⊂B of a commutative ring B, let J=c(A,B) be the already planned general conductor and I=J∩A. Then A→B, A→A/I, B→B/J, A/I→B/J is cartesian in commutative rings. Finiteness, birationality, reducedness and Noetherianity are unnecessary for this affine identity.

- `AffinePinching.commonIdealComparison_bijective_iff` (compatibility): For arbitrary commutative rings A,B, a unital f:A→B and I⊂A with map_f(I)=f(I) as sets, the actual comparison c:A→B×_(B/map_f(I))(A/I) is bijective exactly when ker(f)∩I=0. No finiteness, injectivity of f, reducedness or Noetherian hypothesis is imposed.

- `FerrandPushout.conductor_comap_algEquiv` (compatibility): For arbitrary commutative rings A,B,C and an actual A-algebra equivalence e:B≃ₐ[A]C, the contractions to A of c(im(A→B),B) and c(im(A→C),C) are equal as full A-ideals. The structure maps need not be injective or finite.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `commonIdealComparison.test_identity`: For f=id_A and any I, the canonical comparison is bijective.

- `commonIdealComparison.test_zero_ideal`: For arbitrary f and I=0, the canonical comparison is bijective.

- `commonIdealComparison.test_noninjective_kernel`: For f:Z→Z/2 and I=ker f, the comparison sends 2 and 0 to the same element, although 2≠0. Thus having an ideal image alone does not make it an isomorphism.

- `commonIdealComparison.test_image_not_ideal`: For the diagonal map F₂→F₂×F₂ and I=F₂, the kernel intersection is zero but the comparison is not surjective. Its image is the diagonal two-element subring, while the ideal generated by it is all four elements. The image-ideal hypothesis is therefore necessary for the stated lifting criterion.

**Acceptance beyond the stated contract**

- The non-injective Z→Z/2 example with I=ker f fails the criterion; I=0 succeeds.

### Conductor as the annihilator of the quotient

Target `G.0/conductor-annihilator`. Proposed declaration: `conductor_eq_annihilator`.

For commutative rings A,B and an A-algebra B, let f:A→B be the structure map and let M=B/(A·1) be the native A-module quotient. The A-ideal f⁻¹(c(im f,B)) equals Ann_A(M). This identity requires no injectivity, finiteness, reducedness or Noetherian hypothesis.

**Inputs.** `G.0/subring-conductor`, `mathlib:Module.annihilator`, `mathlib:Module.mem_annihilator`, `mathlib:Submodule.Quotient.mk_eq_zero`, `mathlib:Submodule.mem_span_singleton`.

**Source and scope.**

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Introduction, printed p554, conductor described as the annihilator of A′/A. Extend the stated inclusion formulation to a ring-map image by the same elementwise calculation.

**Proof outline.**

1. The native submodule A·1 is exactly im f, since a·1=f(a).

2. A scalar a annihilates M exactly when f(a)b belongs to im f for every b∈B. Use the native quotient-zero criterion and native module annihilator; this is precisely membership in the preimage of the already planned subring conductor.

**Unit-test contracts.**

- `FerrandPushout.conductor_eq_annihilator.test_noninjective_surjection`: For ℤ→F₂ the quotient-module annihilator is the unit ideal even though the structure map has nonzero kernel. Injectivity is not a hidden hypothesis of the conductor-annihilator identity.

- `FerrandPushout.conductor_eq_annihilator.test_identity_nonreduced`: For the identity algebra of ℤ/4 the contracted conductor is the unit ideal, while2 is a nonzero element with square0; the identity retains the nonreduced case.

**Acceptance beyond the stated contract**

- The identity inclusion gives the unit ideal and a zero quotient module.

- A proper field extension has zero conductor, although it is finite and need not be birational.

### Recomputing a conductor after flat scalar extension

Target `G.0/conductor-finite-flat-base-change`. Proposed declaration: `conductor_flat_baseChange`.

Let A→B be an injective finite homomorphism of commutative rings and let F be a flat A-algebra. Write B_F=B⊗_A F and f_F:F→B_F, x↦1⊗x. If I=f⁻¹(c(im f,B)), then I·F=f_F⁻¹(c(im f_F,B_F)). The map f_F is injective. Neither Noetherianity nor reducedness of F is required; nonflat base change is excluded.

**Inputs.** `G.0/conductor-annihilator`, `mathlib:Module.Finite`, `mathlib:Module.Flat.lTensor_exact`, `mathlib:Module.Flat.lTensor_preserves_injective_linearMap`, `mathlib:Algebra.TensorProduct.includeRight`, `G.0/conductor-cokernel-base-change`, `SchemeAndStackFoundations:SF.0/flat-annihilator`, `G.0/conductor-cokernel-right-base-change`.

**Source and scope.**

- [Finite-module annihilators and flat base change](https://stacks.math.columbia.edu/tag/07T8), Lemma10.40.4, complete displayed statement and proof, accessed 2 October2026. Apply the finite-module annihilator formula to B/A; the generic annihilator theorem is requested at SF.0, not replanned here.

- [Keel’s base point free theorem and quotients in mixed characteristic](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor description and finite-surjective reduced-scheme hypotheses. Use the finite conductor square without imposing birationality. The finite schematically dominant extension below is an explicitly derived generalization.

**Proof outline.**

1. Apply native flat tensor injectivity to A→B, identifying A⊗_A F with F; this gives the actual inclusion f_F.

2. Native flat exactness identifies (B/(A·1))⊗_A F with B_F/(F·1). The quotient is a finite A-module because B is finite.

3. Invoke SchemeAndStackFoundations:SF.0/flat-annihilator for the finite quotient module B/A. Its statement, checked in the supplier packet, allows arbitrary commutative bases and independent scalar-extension universes and requires only finiteness of the module and flatness of the scalar algebra. Transport both annihilators through conductor-annihilator.

4. A native F-linear equivalence now identifies F⊗_A(B/span_A{1}) with the quotient by the actual base-changed unit span, without flatness. Its annihilator is the recomputed conductor for the left-oriented F⊗_A B. To realize this existing theorem, import the already owned SF.0 finite-module flat-annihilator export, then explicitly compare the left-oriented algebraMap with the inherited right-oriented includeRight map by the actual tensor commutativity equivalence. Global conductor ideal-sheaf pullback and restriction maps remain separate. No original statement, hypotheses or acceptance condition changes.

5. The exact existing conductor_flat_baseChange header now has native evidence: specialize native includeRight injectivity to the supplied injective A→B and F-flatness, rewrite the original conductor as the annihilator of B/span_A{1}, and apply the SF.0 finite-module flat-annihilator export followed by the actual right-oriented recomputed-conductor identification. Only B-finiteness and F-flatness are used for the ideal equality; no Noetherian or reduced hypothesis is added. The global ideal-sheaf comparison and actual restriction maps remain separate gaps. Original statement, hypotheses, sources and acceptance conditions are unchanged.

**Acceptance beyond the stated contract**

- A[ε]/(ε²) is free over A, so the recomputed conductor is I⊕εI; nilpotents in a flat target are allowed.

- For A=k[t²,t³]⊂B=k[t] and F=A/(t²), the class of t³ is nonzero in F and maps to zero in B⊗_A F=k[t]/(t²). Thus the native inclusion premise fails for this nonflat quotient.

### Conductor localization with a common denominator

Target `G.0/conductor-finite-localization`. Proposed declaration: `conductor_localization`.

For a finite injective ring map f:A→B, a multiplicative subset S⊂A and the actual localized map f_S:S⁻¹A→f(S)⁻¹B, the ideal S⁻¹(f⁻¹(c(im f,B))) equals f_S⁻¹(c(im f_S,f(S)⁻¹B)). Zero divisors and the zero localization are allowed.

**Inputs.** `G.0/conductor-finite-flat-base-change`, `mathlib:IsLocalization.flat`, `mathlib:IsLocalization.map`, `mathlib:IsLocalization.map_mk'`, `mathlib:IsLocalization.map_injective_of_injective`, `mathlib:Module.Finite.exists_fin`, `G.0/conductor-localization-finite-generators`, `G.0/conductor-localization-recomputed`, `mathlib:IsLocalization.uniqueOfZeroMem`, `mathlib:Ideal.eq_top_iff_one`, `mathlib:IsLocalization.mk'_one`, `mathlib:Submonoid.mem_powers`.

**Source and scope.**

- [Finite-module annihilators and flat base change](https://stacks.math.columbia.edu/tag/07T8), Lemma10.40.4, complete displayed statement and proof, accessed 2 October2026. Apply the finite-module annihilator formula to B/A; the generic annihilator theorem is requested at SF.0, not replanned here.

- [Keel’s base point free theorem and quotients in mixed characteristic](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor description and finite-surjective reduced-scheme hypotheses. Use the finite conductor square without imposing birationality. The finite schematically dominant extension below is an explicitly derived generalization.

**Proof outline.**

1. Localization is a flat scalar extension by the pinned IsLocalization.flat theorem.

2. Alternatively combine conductor-finite-flat-base-change with the canonical tensor/localization comparison. The direct proof below uses conductor-localization-recomputed and its native representative equations, so it does not require a separate unresolved SF.0 stage input.

3. The finite-generation argument is load-bearing: for generators b₁,…,bₙ of B/A, clear the finitely many denominators annihilating the bᵢ and multiply them to obtain one element of S. No domain cancellation or localization-injectivity assumption is used.

4. The conductor-specific finite-generator and common-denominator lemmas now certify the quantifier swap and native membership in the extended conductor. The recomputed localized-B conductor and native sheaf restriction comparison remain separate required identifications.

5. The conductor-specific recomputed localization equality is now supplied directly by conductor-localization-recomputed, including noninjective coefficient maps. The native inherited injective-map signature is checked as a specialization; its localization target submonoid is bound explicitly to avoid inference ambiguity. The earlier generic flat-base-change route remains an alternative supplier-based proof, not a required input to the new direct proof.

6. The global conductor IdealSheafData still needs identification of the actual affine section restriction with this localized map, followed by native chart/restriction coherence. The present ring equality is not a sheaf-restriction theorem.

**Unit-test contracts.**

- `ConductorGenerators.nonspanning`: For F₂→F₂×F₂ diagonally, the single element 1 passes the coefficient-1 multiplication test, but coefficient1 is not in the conductor. The omitted span=top hypothesis would therefore give a false criterion.

- `ConductorGenerators.nilpotent_denominator`: For the diagonal Z/4-algebra Z/4×Z/4, coefficient2 is not in the conductor, but denominator2 lies in its powers monoid and sends coefficient2 to zero in the conductor. Clearing denominators may use nilpotents.

- `ConductorGenerators.empty_zero_algebra`: For the actual ℤ-algebra Z/1 the empty Fin0 family spans the zero module and every integer belongs to the contracted conductor; injectivity of the original coefficient map is not assumed.

- `ConductorGenerators.cusp_fraction`: For every field k and the actual cusp subalgebra A=k+X²k[X], every a∈A gives a native fraction a/1 in the extended conductor after inverting the actual element X²∈A. Use the existing spanning family {1,X} and denominatorX².

- `ConductorLocalization.representative_product`: For arbitrary actual localization carriers, the product f_S(a/t)·b lies in the localized coefficient image exactly when some s∈S satisfies f(sa)b∈im f. This checks the actual numerator and denominator transport.

- `ConductorLocalization.empty_zero_algebra`: For the actual noninjective coefficient map ℤ→Z/1, localizing at powers of2 gives equality of the extended and recomputed contracted conductors using the empty spanning family.

- `ConductorLocalization.nilpotent_recomputed`: For the diagonal Z/4-algebra Z/4×Z/4, coefficient2 is not in the original conductor; after localizing at powers of2 the extended and recomputed conductors agree and the recomputed ideal is the unit ideal of the actual zero localization.

- `ConductorLocalization.cusp_recomputed`: For every field k and the actual cusp subalgebra A=k+X²k[X], invert its actual element X². The extended conductor agrees with the conductor recomputed along the actual localized inclusion, and the recomputed conductor is the unit ideal. The fixture consumes the incoming normalization spanning family{1,X}.

**Acceptance beyond the stated contract**

- Localizing the cusp inclusion at t² kills its quotient B/A and gives the unit conductor.

- Localizing at a nilpotent may give the zero ring; the formula still holds.

- Keep the native localized map, rather than identifying two unrelated ring types.

### The global conductor ideal-sheaf datum

Target `G.0/conductor-ideal-sheaf`. Proposed declaration: `conductorIdealSheaf`.

For a finite schematically dominant scheme morphism f:Y→P, define I_f in the native P.IdealSheafData by assigning to an affine U⊂P the ideal f_U⁻¹(c(im f_U,Γ(Y,f⁻¹U))). Here f_U is the actual section-ring map; finiteness makes f⁻¹U affine and scheme-theoretic dominance makes f_U injective. The finite-localization comparison gives the required basic-open compatibility. Its native closed subscheme C_f is defined by the full ideal, not its radical.

**Inputs.** `G.0/conductor-finite-localization`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.ofIdeals`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.ofIdeals_ideal`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subscheme`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeι`, `mathlib:AlgebraicGeometry.Scheme.Hom.app_injective`, `mathlib:AlgebraicGeometry.IsSchemeTheoreticallyDominant`, `mathlib:AlgebraicGeometry.IsFinite`.

**Source and scope.**

- [Keel’s base point free theorem and quotients in mixed characteristic](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor description and finite-surjective reduced-scheme hypotheses. Use the finite conductor square without imposing birationality. The finite schematically dominant extension below is an explicitly derived generalization.

- [Actual affine conductors and native conductor ideal-sheaf data](https://stacks.math.columbia.edu/tag/0C6L), Stacks Lemma10.40.4 full proof and Lemma53.10.5 conductor paragraph; authored actual affine-restriction and IdealSheafData deductions. The source explains finite annihilators and the conductor subscheme. The statements here are explicit native deductions for arbitrary finite schematically dominant scheme morphisms; the proper-curve assumptions of Lemma53.10.5 are not attributed to these general adapters.

- [Conductor pushouts and authored actual nilpotent-section tests](https://stacks.math.columbia.edu/tag/0ET0), Lemma37.14.1, full displayed statement and proof; authored conductor-specific deduction using native quotient-section comparison. The source motivates full ideal and structure-sheaf data in conductor pushouts. The diagonal calculation and actual nilpotent-section formulas are authored deductions from the retained conductor contracts and native APIs, not claims quoted from the source.

**Proof outline.**

1. Use the pinned IsFinite and Scheme.Hom.app_injective statements to obtain the chartwise finite inclusions.

2. Apply conductor-finite-localization to the section of any principal affine open. The structure-sheaf localization comparisons identify the resulting maps with restrictions.

3. Build the native IdealSheafData with these ideals and restriction identities. Equivalently use its native ofIdeals constructor and prove that its chart ideals equal the displayed family; taking the largest compatible subfamily is not silently assumed to preserve arbitrary input ideals.

4. Use the native subscheme/subschemeι constructors for C_f. They already supply closedness and the section-ring quotient comparisons.

5. The checked continuation proves the actual basic-open conductor identity first and applies native ofIdeals_ideal to the resulting compatible family. It then proves the exact old mem_affine, greatest and affine_compat contracts and the affine section-annihilator comparison. The native quotient subscheme exists; its detailed conductor quotient-square and global exact-sequence comparisons remain separate obligations.

6. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `Witaszek Definition2.27 and Lemma2.28`: Supply the actual conductor subschemes and maps for geometric pinching and line-bundle patching. `G.0/conductor-scheme-flat-comparison`: Compare recomputed conductors, including nilpotents, with the actual flat pullback of the original square.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: All ring carriers are commutative rings, including zero rings and rings with nilpotents. The actual maps and each finiteness or dominance assumption are exactly those stated; no replacement by a radical or underlying support is permitted.

- **H2**: All schemes in a statement share an arbitrary universe. Rings are arbitrary commutative rings, including zero rings; no reducedness, Noetherianity or birationality is imposed. Finiteness, schematic dominance, flatness and affineness are required exactly where stated. The actual full conductor ideals and native closed-subscheme carriers are used. Generic quotient, section and pullback theories remain imported.

- `ConductorIdealSheaf.mem_affine` (characterisation): For an affine U⊂P, a∈I_f(U) exactly when f_U(a)b lies in im f_U for every b∈Γ(Y,f⁻¹U).

- `ConductorIdealSheaf.greatest` (universal-property): For an ideal-sheaf datum K on P, K≤I_f exactly when for every affine U and a∈K(U), f_U(a)Γ(Y,f⁻¹U)⊂im f_U.

- `ConductorIdealSheaf.affine_compat` (compatibility): If P is affine, I_f is the native ofIdealTop of f_top⁻¹(c(im f_top,Γ(Y,⊤))); the quotient subscheme is the existing ideal-sheaf subscheme.

- `TauCeti.GenusOne.FerrandPushout.conductorIdealSheaf_ideal` (compatibility; assumptions H1): For every finite schematically dominant f:Y→P and affine U⊂P, the affine ideal of the existing conductorIdealSheaf f equals the full conductor of im(f.app U) in Γ(Y,f⁻¹U), contracted along the actual f.app U. The ofIdeals construction loses none of the prescribed ideals.

- `TauCeti.GenusOne.FerrandPushout.ConductorIdealSheaf.map_affine` (compatibility; assumptions H1): For finite schematically dominant f and affine opens U⊆V in P, the ideal map along the actual presheaf restriction Γ(P,V)→Γ(P,U) sends the contracted conductor on V to the recomputed contracted conductor on U.

- `TauCeti.GenusOne.FerrandPushout.ConductorIdealSheaf.restrict_mem` (compatibility; assumptions H1): For finite schematically dominant f, affine U⊆V and a∈I_f(V), the actual restriction of a to U belongs to I_f(U).

- `TauCeti.GenusOne.FerrandPushout.ConductorIdealSheaf.map_affine_trans` (compatibility; assumptions H1): For finite schematically dominant f and affine U⊆V⊆W, extending the conductor on W successively along Γ(P,W)→Γ(P,V)→Γ(P,U) equals its extension along the direct Γ(P,W)→Γ(P,U) restriction.

- `TauCeti.GenusOne.FerrandPushout.ConductorIdealSheaf.identity` (compatibility; assumptions H1): For every scheme P, including the empty scheme, the conductor ideal-sheaf datum of id_P is the unit ideal datum. Its native closed subscheme is therefore empty.

- `TauCeti.GenusOne.FerrandPushout.ConductorIdealSheaf.spec_ideal` (compatibility; assumptions H1): For f:A→B between actual CommRingCat objects with finite schematically dominant Spec.map f, the top affine ideal of conductorIdealSheaf (Spec.map f) equals the comap under the actual ΓSpecIso A hom of the conductor of im(f) in B contracted along f.

- `TauCeti.GenusOne.FerrandPushout.ConductorIdealSheaf.affine_annihilator` (compatibility; assumptions H1): For finite schematically dominant f and affine U, set A=Γ(P,U), B=Γ(Y,f⁻¹U) with its actual f.app U algebra structure. Then I_f(U)=Ann_A(B/span_A{1}) as full A-ideals. This is the quotient of affine section modules; no sheaf-cokernel construction or structure-sheaf exact sequence is asserted.

- `TauCeti.GenusOne.FerrandPushout.conductorIdealSheaf_comap_chart` (compatibility): For finite schematically dominant f:Y→P, any q:T→P, affine U⊂P and affine V⊂T with V⊂q⁻¹U, the V-ideal of (conductorIdealSheaf f).comap q equals the extension of the U-conductor ideal along the actual q.appLE U V. Neither q-affineness nor q-flatness is required.

- `TauCeti.GenusOne.FerrandPushout.conductor_flat_chart` (compatibility): For finite schematically dominant f:Y→P and flat q:T→P, on every affine V⊂q⁻¹U with U affine, the recomputed conductor of pullback.snd f q on V equals the extension of the original U-conductor along q.appLE U V. All ideals are full ideals.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceIdeal_flat` (compatibility): For finite schematically dominant f:Y→P and flat q:T→P, the source conductor ideal of the base-changed map equals the pullback along pullback.fst f q of the original source ideal (conductorIdealSheaf f).comap f.

- `TauCeti.GenusOne.FerrandPushout.conductorIdealSheaf_flat_tower` (compatibility): For finite schematically dominant f:Y→P and flat q:T→P and r:Z→T, the conductor of the iterated pullback map to Z equals the pullback of the original conductor along r≫q.

- `TauCeti.GenusOne.FerrandPushout.conductor_comap_postcomp` (compatibility; assumptions H1): For every ring map f:A→B and ring equivalence e:B≃C between commutative rings, the conductor contracted to A along f equals that contracted along e∘f. No injectivity or finiteness assumption is needed.

- `TauCeti.GenusOne.FerrandPushout.conductor_localization_away` (compatibility; assumptions H1): For every finite ring map f:A→B and r∈A, and actual away localizations L=A[1/r], M=B[1/f(r)], extending the contracted conductor along A→L gives the conductor contracted along the actual native Away.map L M f r. No injectivity, reducedness or nonzero-localization assumption is made.

- `TauCeti.GenusOne.FerrandPushout.conductor_basicOpen` (compatibility; assumptions H1): For any finite scheme morphism f:Y→P, affine open U⊂P and section r∈Γ(P,U), extending the contracted conductor of the actual f.app U along the actual restriction Γ(P,U)→Γ(P,D(r)) gives exactly the contracted conductor of f.app D(r). Scheme-theoretic dominance is not needed.

- `TauCeti.GenusOne.FerrandPushout.conductor_comap_precomp` (compatibility; assumptions H1): For commutative rings A,B,C, a ring map f:B→C and a ring equivalence e:A≃B, the conductor contracted along f∘e equals the comap under e of the conductor contracted along f. No finiteness or injectivity assumption on f is used.

- `TauCeti.GenusOne.FerrandPushout.conductor_diagonal_isFinite` (compatibility; assumptions H2): For every commutative ring R in any universe, the actual morphism Spec(R×R)→Spec(R) induced by a↦(a,a) is finite.

- `TauCeti.GenusOne.FerrandPushout.conductor_diagonal_schemeTheoreticallyDominant` (compatibility; assumptions H2): For every commutative ring R, including the zero ring and nonreduced rings, the actual diagonal Spec(R×R)→Spec(R) is schematically dominant.

- `TauCeti.GenusOne.FerrandPushout.conductor_diagonal_comap_eq_bot` (compatibility; assumptions H2): For every commutative ring R and diagonal d:R→R×R, the full conductor of im(d) contracted along d is the zero ideal of R.

- `TauCeti.GenusOne.FerrandPushout.conductor_diagonal_ideal_top` (compatibility; assumptions H2): For R a commutative ring, the global affine ideal of the actual conductorIdealSheaf of the diagonal Spec(R×R)→Spec(R) is zero, for its finite and schematically dominant instances.

- `TauCeti.GenusOne.FerrandPushout.conductor_diagonal_idealSheaf_eq_bot` (compatibility; assumptions H2): For every commutative ring R, the actual full conductor ideal-sheaf datum of Spec(R×R)→Spec(R) is the bottom ideal-sheaf datum.

- `TauCeti.GenusOne.FerrandPushout.conductor_nilpotent_section` (compatibility; assumptions H2): Let f:Y→P be finite and schematically dominant with P affine. If a in Γ(P,top) is outside the full conductor ideal and a^n=0 for a natural number n, the actual conductor closed subscheme has a section z with z≠0 and z^n=0.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorIdealSheaf.test_identity`: For f=id_P the conductor ideal-sheaf datum is the unit ideal, so its closed subscheme is empty.

- `ConductorIdealSheaf.test_cusp`: For Spec k[t]→Spec k[t²,t³], the target conductor is (t²,t³) and its extended ideal in k[t] is (t²); retain the double-point overlap.

- `ConductorIdealSheaf.test_field_extension`: For a nontrivial finite field extension E/k the conductor ideal sheaf on Spec k is zero, so the conductor subschemes are the whole source and target; it is not the normalization-isomorphism case.

- `ConductorIdealSheaf.test_affine_compat`: On an affine scheme the construction agrees with the pinned IdealSheafData.ofIdealTop under its native global-section comparison.

- `ConductorSheafChecked.identity_empty_subscheme`: For every scheme P, the actual identity conductor equals top and its native closed subscheme is empty.

- `ConductorSheafChecked.empty_open`: For finite schematically dominant f, the actual conductor ideal on the empty affine open is the unit ideal of its zero section ring.

- `ConductorSheafChecked.basic_open_zero`: For any finite scheme morphism and affine U, extending its actual contracted conductor to D(0) yields the unit ideal in the zero section ring; no dominance hypothesis is used.

- `ConductorSheafChecked.nested_restrictions`: A section in the actual conductor on W stays in the conductor on U after the actual restrictions W→V→U.

- `ConductorSheafChecked.affine_native_comparison`: For a finite schematically dominant Spec.map f, the section corresponding to a∈A under the actual ΓSpecIso belongs to the conductor exactly when f(a) belongs to the ring conductor.

- `ConductorSheafChecked.nonreduced_diagonal`: For the actual diagonal Z/4→Z/4×Z/4, prove its Spec map finite and schematically dominant, and prove that the section corresponding to2 is not in its conductor. The proof retains the nonreduced rings and does not assume those morphism instances.

- `ConductorSchemeFlatChecked.identity_base`: Base change of any finite schematically dominant f along the identity has exactly the original conductor ideal sheaf.

- `ConductorSchemeFlatChecked.identity_morphism`: After any flat base change of the identity morphism, the conductor ideal sheaf is the whole ideal.

- `ConductorSchemeFlatChecked.empty_chart`: Extension of an affine conductor along the actual section map to the empty open equals the whole ideal of the zero section ring.

- `ConductorSchemeFlatChecked.refinement`: For affine V⊂W⊂q⁻¹U, restricting the extended U-conductor from W to V equals extending it directly along q.appLE U V, using the actual presheaf restriction map.

- `ConductorSchemeFlatChecked.source_identity`: For identity base change the recomputed source conductor equals the pullback of the original source conductor along the actual pullback.fst.

- `ConductorSchemeFlatChecked.tower_restriction`: Following an arbitrary flat base change by restriction to any open V gives the conductor ideal obtained by restricting the first pulled-back ideal to V.

- `ConductorSchemeFlatChecked.zero_ring`: Identity base change of the identity of Spec(Z/1) has the whole conductor ideal sheaf.

- `ConductorSchemeFlatChecked.nonreduced_identity_base`: For the actual finite schematically dominant Spec(Z/4×Z/4)→Spec(Z/4) induced by the diagonal, after identity base change the global section corresponding to the nonzero square-zero element2 is not in the conductor ideal. Thus replacing this full ideal by its radical fails the test.

- `ConductorNilpotentChecked.arbitrary_universe_diagonal`: The full contracted diagonal conductor is zero for a commutative ring in an arbitrary universe, without a nontriviality assumption.

- `ConductorNilpotentChecked.reduced_diagonal`: For R=Z, derive the actual diagonal morphism hypotheses and prove its full conductor ideal-sheaf datum is zero.

- `ConductorNilpotentChecked.diagonal_zero_ring`: For R=Z/1, derive finiteness and schematic dominance of the actual diagonal and prove its full conductor ideal-sheaf datum is zero; no point-existence assumption is made.

**Acceptance beyond the stated contract**

- For f=id_P the conductor ideal-sheaf datum is the unit ideal, so its closed subscheme is empty.

- For Spec k[t]→Spec k[t²,t³], the target conductor is (t²,t³) and its extended ideal in k[t] is (t²); retain the double-point overlap.

- For a nontrivial finite field extension E/k the conductor ideal sheaf on Spec k is zero, so the conductor subschemes are the whole source and target; it is not the normalization-isomorphism case.

- On an affine scheme the construction agrees with the pinned IdealSheafData.ofIdealTop under its native global-section comparison.

### The canonical map between conductor subschemes

Target `G.0/conductor-induced-map`. Proposed declaration: `conductorMap`.

For finite schematically dominant f:Y→P put I=I_f and J=I.comap f. Define g_f:J.subscheme→I.subscheme as the composite of the native comapIso with the second projection of Y×_P I.subscheme. The first projection is the native closed inclusion i_f, and j_f is I.subschemeι. No independent cartesian-square predicate or algebraic-space carrier is introduced.

**Inputs.** `G.0/conductor-ideal-sheaf`, `G.0/common-ideal-cartesian`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comapIso`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeObjIso`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comapIso_hom_snd`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeMap_subschemeι`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comapIso_hom_fst`, `mathlib:CategoryTheory.IsPullback.of_iso_pullback`.

**Source and scope.**

- [Keel’s base point free theorem and quotients in mixed characteristic](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor description and finite-surjective reduced-scheme hypotheses. Use the finite conductor square without imposing birationality. The finite schematically dominant extension below is an explicitly derived generalization.

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Introduction, printed p554; Lemma1.3 pp556–557 and Theorem5.1/proof pp568–569. Specialize the existing arbitrary-subring conductor reconstruction; the global ringed-space comparison is separately proved.

- [Actual conductor subscheme map and canonical quotient-section comparison](https://stacks.math.columbia.edu/tag/0C6L), Stacks Lemma53.10.5 full proof and Example53.10.6; authored native closed-subscheme-map and quotient-chart deductions. The source motivates the conductor ideal and the two quotient ideals. These general actual-map adapters are authored deductions from the pinned library, not claims that the proper-curve source has these general hypotheses.

- [Full conductor source ideals and native quotient chart maps](https://stacks.math.columbia.edu/tag/0C6L), Stacks Lemma53.10.5 full proof and Example53.10.6; authored native ideal-sheaf adjunction and open-restriction deductions. The proper-curve source motivates the full conductor. The stated finite schematically dominant comparisons are authored deductions from pinned native APIs; the source is not claimed to have their more general hypotheses.

- [Conductor section-ring context, Stacks 0ET0](https://stacks.math.columbia.edu/tag/0ET0), Stacks 0ET0 bounded displayed statement/proof; authored deduction from pinned native APIs. Source context motivates the conductor square; the broader finite schematically dominant statements here are authored deductions. Neither source proof defect is used.

- [Conductor section-ring context, Stacks 0C6L](https://stacks.math.columbia.edu/tag/0C6L), Stacks 0C6L bounded displayed statement/proof; authored deduction from pinned native APIs. Source context motivates the conductor square; the broader finite schematically dominant statements here are authored deductions. Neither source proof defect is used.

**Proof outline.**

1. Use the native IdealSheafData.comapIso and its two projection equations to specify g_f.

2. Import the already proved cartesian comparison and stability of finiteness under base change. These general results are baseline citations and API compatibility facts, not new mathematical nodes.

3. Use conductor-affine-quotients to identify g_f on every affine chart with the native quotient map.

4. The native continuation checks the exact existing conductorMap definition and its square, cartesian and finite APIs. It compares the actual map with subschemeMap, proves uniqueness and identifies its actual quotient-ring section maps with the two canonical subschemeObjIso charts. The source ideal J(V) is still the native pullback ideal; identification with the recomputed ambient conductor K, geometric/categorical pushout and the all-open exact sequence remain separate required comparisons.

5. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `Witaszek Definition2.27 and Lemma2.28`: Supply the actual conductor subschemes and maps for geometric pinching and line-bundle patching. `G.0/conductor-scheme-flat-comparison`: Compare recomputed conductors, including nilpotents, with the actual flat pullback of the original square. `G.0/conductor-scheme-geometric`: Supply commuting maps on actual opens and restriction naturality for the required structure-sheaf comparison. Exactness and geometric pushout remain separate required proofs. `G.0/conductor-scheme-geometric`: Supply the exact affine conductor quotient square needed by ring reconstruction before proving the all-open sheaf comparison and quotient topology.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: Exactly the finiteness, schematic dominance, affineness, isomorphism or zero-conductor hypotheses stated above. All scheme and commutative-ring carriers, including empty schemes, zero rings and nilpotents, are native.

- **H2**: Exactly the finiteness, schematic dominance, affine-open and coordinate-isomorphism hypotheses in the statement; retain zero rings, empty opens and nilpotents.

- **H3**: Finite and schematically dominant f; affine U only where expressly stated; preserve the full conductor ideals and actual native section rings.

- `conductor_affine_quotients` (compatibility): Let f:Y→P be finite and schematically dominant, I=I_f, J=I.comap f, C=I.subscheme and D=J.subscheme. For every affine U⊂P set A=Γ(P,U), B=Γ(Y,f⁻¹U), f_U:A→B and K=c(im f_U,B). Then I(U)=f_U⁻¹K, J(f⁻¹U)=K, and the native quotient-chart identifications give Γ(C,C→P⁻¹U)≅A/I(U) and Γ(D,D→Y⁻¹f⁻¹U)≅B/K, compatibly with the actual inclusion and quotient maps.

- `conductorMap_square` (functoriality): The actual induced map g_f:D_f→C_f satisfies i_f∘f=g_f∘j_f in categorical composition order i_f≫f=g_f≫j_f.

- `conductorMap_isPullback` (compatibility): The induced square is the native cartesian square supplied by IdealSheafData.comapIso; all maps agree with its projections.

- `conductorMap_isFinite` (compatibility): The induced map D_f→C_f is finite because it is the base change of the finite morphism f.

- `TauCeti.GenusOne.FerrandPushout.conductorMap_eq_subschemeMap` (compatibility; assumptions H1): For every finite schematically dominant scheme map f:Y→P, the existing conductorMap f equals the native subschemeMap from the pulled-back conductor ideal J=I_f.comap f to I_f, with the actual adjunction inequality I_f≤J.map f.

- `TauCeti.GenusOne.FerrandPushout.conductorMap_unique` (compatibility; assumptions H1): For finite schematically dominant f and any actual g:J.subscheme→I_f.subscheme satisfying g followed by the target closed inclusion equals the source closed inclusion followed by f, g equals conductorMap f.

- `TauCeti.GenusOne.FerrandPushout.conductorMap_preimage` (compatibility; assumptions H1): For finite schematically dominant f and every open U⊂P, the inverse image under conductorMap f of j_f⁻¹U equals i_f⁻¹(f⁻¹U), as native opens of J.subscheme.

- `TauCeti.GenusOne.FerrandPushout.conductorMap_isIso_of_isIso` (compatibility; assumptions H1): For any scheme isomorphism f:Y→P, the actual conductorMap f is an isomorphism. Its finite and schematically dominant instances are the existing native ones.

- `TauCeti.GenusOne.FerrandPushout.conductorMap_isIso_iff_of_zero` (compatibility; assumptions H1): For finite schematically dominant f with I_f=0 as a full native ideal-sheaf datum, conductorMap f is an isomorphism if and only if f is. No reducedness, Noetherian, birationality or field assumption is needed.

- `TauCeti.GenusOne.FerrandPushout.conductorChartMap_comm` (compatibility; assumptions H1): For finite schematically dominant f and every open U⊂P, j_f.app U followed by conductorChartMap f U equals f.app U followed by i_f.app(f⁻¹U). All four maps are the actual native section maps.

- `TauCeti.GenusOne.FerrandPushout.conductorChartMap_restrict` (compatibility; assumptions H1): For finite schematically dominant f and arbitrary opens U⊆V of P, restricting target-conductor sections from j_f⁻¹V to j_f⁻¹U then applying conductorChartMap at U equals applying it at V then restricting source-conductor sections from i_f⁻¹f⁻¹V to i_f⁻¹f⁻¹U. Both restrictions are the actual native presheaf maps.

- `TauCeti.GenusOne.FerrandPushout.conductorChartMap_coordinates` (compatibility; assumptions H1): For finite schematically dominant f, affine U and any actual section x of I_f.subscheme over j_f⁻¹U, the native source-conductor chart coordinate of conductorChartMap f U(x) is conductorQuotientMap f U applied to the native target-conductor chart coordinate of x.

- `TauCeti.GenusOne.FerrandPushout.conductorChartMap` (constructor; assumptions H1): For finite schematically dominant f and every open U⊂P, define the actual CommRingCat map Γ(I_f.subscheme,j_f⁻¹U)→Γ(J.subscheme,i_f⁻¹f⁻¹U) by conductorMap f.appLE, using conductorMap_preimage to identify the source open. Affineness is not required for this construction.

- `TauCeti.GenusOne.FerrandPushout.conductorChart_ideal_le` (compatibility; assumptions H1): For finite schematically dominant f, affine U⊂P and V=f⁻¹U, the actual section map f_U:Γ(P,U)→Γ(Y,V) sends I_f(U) into J(V), where J=I_f.comap f is the native pulled-back ideal datum. This does not yet identify J(V) with the ambient conductor of im(f_U).

- `TauCeti.GenusOne.FerrandPushout.conductorQuotientMap_mk` (compatibility; assumptions H1): For finite schematically dominant f, affine U and a∈Γ(P,U), conductorQuotientMap f U sends the actual quotient class of a modulo I_f(U) to the actual quotient class of f.app U(a) modulo J(f⁻¹U).

- `TauCeti.GenusOne.FerrandPushout.conductorQuotientMap_comp_mk` (compatibility; assumptions H1): For finite schematically dominant f and affine U, conductorQuotientMap f U composed with the actual source quotient map equals the actual target quotient map composed with f.app U, as RingHom maps.

- `TauCeti.GenusOne.FerrandPushout.conductorChartMap_quotient` (compatibility; assumptions H1): For finite schematically dominant f and affine U, conductorChartMap f U followed by the actual source-conductor subschemeObjIso hom equals the actual target-conductor subschemeObjIso hom followed by conductorQuotientMap f U, as CommRingCat maps. The two canonical identifications use the native closed subschemes of I_f and J.

- `TauCeti.GenusOne.FerrandPushout.conductorQuotientMap` (constructor; assumptions H1): For finite schematically dominant f, affine U⊂P and V=f⁻¹U, define the native induced ring map Γ(P,U)/I_f(U)→Γ(Y,V)/J(V) using Ideal.quotientMap and the proved conductorChart_ideal_le inequality, with J=I_f.comap f. Retain the full ideals and nilpotents.

- `TauCeti.GenusOne.FerrandPushout.conductorChart_ambient_le` (compatibility; assumptions H2): For a finite schematically dominant f:Y→P and affine U⊂P, put V=f⁻¹U and K=c(im(f.app U),Γ(Y,V)). Then K is contained in the actual component (I_f.comap f)(V), with its full ideal structure.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceIdeal_affine` (compatibility; assumptions H2): For finite schematically dominant f:Y→P with P and Y affine, the top component of I_f.comap f equals the ambient conductor of f.appTop. The statement keeps the native section rings and actual pullback ideal datum.

- `TauCeti.GenusOne.FerrandPushout.conductorIdealSheaf_restrict` (compatibility; assumptions H2): For finite schematically dominant f:Y→P and any open U⊂P, the conductor ideal datum of the actual restricted morphism f|U equals I_f.comap U.ι on the open subscheme U. This holds for nonaffine and empty U.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceIdeal_restrict` (compatibility; assumptions H2): For finite schematically dominant f and every open U, restrict I_f.comap f along (f⁻¹U).ι. The resulting full ideal datum equals I_(f|U).comap(f|U).

- `TauCeti.GenusOne.FerrandPushout.conductor_range_conjugate` (compatibility; assumptions H2): For arbitrary commutative rings, f:A→B, eA:C≃A and eB:D≃B, the ambient conductor of eB⁻¹∘f∘eA is exactly the inverse image under eB of the conductor of im f in B. Zero rings and nilpotents are retained.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceIdeal_chart_transport` (compatibility; assumptions H2): For finite schematically dominant f and affine U, with V=f⁻¹U and J=I_f.comap f, the top component of J.comap V.ι equals the contraction of J(V) along the actual native topIso hom Γ(V,top)→Γ(Y,V).

- `TauCeti.GenusOne.FerrandPushout.conductorSourceIdeal_chart` (compatibility; assumptions H2): For finite schematically dominant f:Y→P and every affine U⊂P, the exact full ideal (I_f.comap f)(f⁻¹U) equals c(im(f.app U),Γ(Y,f⁻¹U)). Neither P nor Y is assumed globally affine, Noetherian or reduced.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceIdeal_mem` (compatibility; assumptions H2): For finite schematically dominant f, affine U and b∈Γ(Y,f⁻¹U), b belongs to (I_f.comap f)(f⁻¹U) exactly when b·c lies in the image of f.app U for every c in that same section ring.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceObjIso_inclusion` (compatibility; assumptions H2): For finite schematically dominant f and affine U, the actual source-conductor closed inclusion section map followed by conductorSourceObjIso.hom equals the native quotient map b↦[b] modulo the ambient conductor, as CommRingCat maps.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceObjIso_mk` (compatibility; assumptions H2): For finite schematically dominant f, affine U and b in the actual source section ring, the coordinate under conductorSourceObjIso of the restriction of b to the source conductor is exactly its quotient class modulo the ambient conductor.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceObjIso_inv_mk` (compatibility; assumptions H2): For finite schematically dominant f, affine U and a source section b, conductorSourceObjIso.inv sends its ambient-conductor quotient class to the actual restriction of b along the source-conductor inclusion.

- `TauCeti.GenusOne.FerrandPushout.conductorChartMap_ambient_quotient` (compatibility; assumptions H2): For finite schematically dominant f and affine U, the actual conductorChartMap followed by conductorSourceObjIso.hom equals the target subschemeObjIso.hom followed by the native quotient map Γ(P,U)/I_f(U)→Γ(Y,f⁻¹U)/K induced by f.app U, where K is its full ambient conductor. Equality holds for the actual maps.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceObjIso` (constructor; assumptions H2): For finite schematically dominant f and affine U, construct the actual CommRingCat isomorphism from sections of (I_f.comap f).subscheme over the inverse image of f⁻¹U to Γ(Y,f⁻¹U)/c(im(f.app U),Γ(Y,f⁻¹U)). Compose the native subschemeObjIso with quotient transport along the proved equality of full ideals.

- `TauCeti.GenusOne.FerrandPushout.conductorChart_ideal_map` (compatibility; assumptions H3): Let f:Y→P be finite and schematically dominant, U an affine open, A=Γ(P,U), B=Γ(Y,f⁻¹U), I=I_f and J=I.comap f. The ideal extension of I(U) along f.app U is exactly the full conductor c(im(f.app U),B).

- `TauCeti.GenusOne.FerrandPushout.conductorChart_ideal_image` (compatibility; assumptions H3): Under the same hypotheses, the set underlying I(U).map(f.app U) equals the literal image of the set I(U) under f.app U. This is equality of the full ideal and image, not equality of radicals.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `conductorMap.test_identity`: For f=id_P both conductor subschemes are empty and the induced map is an isomorphism.

- `conductorMap.test_cusp`: For the cusp normalization the source conductor D is nonreduced and C is reduced; g:D→C retains the full nilpotent parameter.

- `conductorMap.test_field_extension`: For a proper finite extension E/k both conductor inclusions are isomorphisms while the induced conductor map is not an isomorphism.

- `conductorMap.test_affine_map`: Under the actual affine quotient-chart comparisons, g is the Spec map of the native induced quotient map A/I→B/K.

- `ConductorChartChecked.empty_comm`: On the empty target open, the actual conductor-section map commutes with both inclusion section maps and f.app, retaining the zero section rings.

- `ConductorChartChecked.quotient_representative`: For every affine U and a in its actual section ring, start with the actual target-conductor section obtained by applying its subschemeObjIso inverse to the quotient class of a. After the actual conductorChartMap and the source chart hom, the result is the quotient class of f.app U(a).

- `ConductorChartChecked.empty_restriction`: For every target open U, restriction from the actual conductor open over U to the empty open commutes with conductorChartMap using the actual source-conductor presheaf restriction.

- `ConductorQuotientChecked.zero_class`: For every affine U, the actual conductorQuotientMap sends the quotient class of zero to zero.

- `ConductorQuotientChecked.empty_open`: For the empty affine target open, the actual conductorQuotientMap is bijective between the native quotient rings of the two zero section rings.

- `ConductorQuotientChecked.nonreduced_diagonal`: For the actual diagonal Z/4→Z/4×Z/4, prove the Spec map finite and schematically dominant, its full conductor ideal datum zero, and its conductorMap not an isomorphism. The quotient class of the actual section corresponding to2 is nonzero with square zero, and its image under the actual conductorQuotientMap is also nonzero with square zero.

- `ConductorSourceChartChecked.quotient_representative`: For every affine U and every source section b, the inverse canonical B/K chart sends [b] to its actual restriction along the source-conductor closed inclusion.

- `ConductorSourceChartChecked.empty_open`: On the empty affine target open, every actual source-conductor section has coordinate zero in the quotient of the native zero section ring.

- `ConductorSourceChartChecked.nonreduced_diagonal`: For the actual finite schematically dominant diagonal Z/4→Z/4×Z/4, its ambient section conductor is zero. The source section corresponding to(2,2) is nonzero with square zero, and its actual source-conductor restriction has nonzero square-zero coordinate under conductorSourceObjIso. Replacing the conductor by its radical fails this test.

**Acceptance beyond the stated contract**

- For f=id_P both conductor subschemes are empty and the induced map is an isomorphism.

- For the cusp normalization the source conductor D is nonreduced and C is reduced; g:D→C retains the full nilpotent parameter.

- For a proper finite extension E/k both conductor inclusions are isomorphisms while the induced conductor map is not an isomorphism.

- Under the actual affine quotient-chart comparisons, g is the Spec map of the native induced quotient map A/I→B/K.

### Global geometric conductor reconstruction

Target `G.0/conductor-scheme-geometric`. Proposed declaration: `conductor_global_geometric`.

For a finite schematically dominant scheme morphism f:Y→P, the canonical square D_f→Y, D_f→C_f, Y→P, C_f→P is a geometric Ferrand pushout in Scheme. In particular its every-open structure-sheaf comparison is a pullback and its underlying space is the topological pushout. This derived generalization needs no Noetherian or reduced hypothesis; Witaszek’s finite-surjective reduced Noetherian case follows from native dominance. No birationality is required.

**Inputs.** `G.0/conductor-induced-map`, `G.0/common-ideal-cartesian`, `G.0/affine-existence`, `mathlib:AlgebraicGeometry.IsSchemeTheoreticallyDominant.of_isDominant`, `mathlib:AlgebraicGeometry.Scheme.Cover.hom_ext`.

**Source and scope.**

- [Keel’s base point free theorem and quotients in mixed characteristic](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor description and finite-surjective reduced-scheme hypotheses. Use the finite conductor square without imposing birationality. The finite schematically dominant extension below is an explicitly derived generalization.

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Introduction, printed p554; Lemma1.3 pp556–557 and Theorem5.1/proof pp568–569. Specialize the existing arbitrary-subring conductor reconstruction; the global ringed-space comparison is separately proved.

**Proof outline.**

1. On an affine U⊂P, use conductor-affine-quotients and the already planned arbitrary-subring conductor reconstruction to identify A with B×_(B/K)(A/I).

2. Apply affine-existence to the quotient map B→B/K and finite map A/I→B/K. The latter is finite because it is a quotient of the finite A-module B.

3. The resulting geometric square is the restriction of the one canonical native conductor square, by conductor-induced-map. Thus the topological quotient identifications agree on overlapping affine opens.

4. The sheaf comparison agrees on a basis by localization, hence is an isomorphism of the actual structure sheaves and gives the ring pullback on every open. Glue this sheaf comparison and the local quotient topology; do not infer every-open section equality from global sections alone.

5. For Witaszek’s hypotheses, a finite surjective map is dominant and the reduced target makes it scheme-theoretically dominant by the pinned theorem.

**Acceptance beyond the stated contract**

- The cusp square has a nonreduced overlap and is still geometric.

- A finite field extension of degree greater than one gives the trivial whole-conductor square and is covered without birationality.

- All sheaf maps refer to the canonical constructed subschemes.

### The conductor square as a Scheme pushout

Target `G.0/conductor-scheme-pushout`. Proposed declaration: `conductor_global_isPushout`.

For finite schematically dominant f:Y→P, the same canonical conductor square is a categorical pushout in Scheme: every compatible pair Y→T and C_f→T extends uniquely to P→T for every scheme T. Its native cartesian comparison remains the one supplied by the existing comapIso.

**Inputs.** `G.0/conductor-scheme-geometric`, `G.0/conductor-induced-map`, `key/ferrand-pushouts`, `mathlib:CategoryTheory.IsPushout`, `G.0/conductor-scheme-descent`, `mathlib:CategoryTheory.Limits.PushoutCocone.isColimitAux'`.

**Source and scope.**

- [Keel’s base point free theorem and quotients in mixed characteristic](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor description and finite-surjective reduced-scheme hypotheses. Use the finite conductor square without imposing birationality. The finite schematically dominant extension below is an explicitly derived generalization.

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Introduction, printed p554; Lemma1.3 pp556–557 and Theorem5.1/proof pp568–569. Specialize the existing arbitrary-subring conductor reconstruction; the global ringed-space comparison is separately proved.

**Proof outline.**

1. Apply conductor-scheme-geometric and the existing GeometricPushout.lift contract: the closed inclusion D_f→Y and finite induced conductor map satisfy its finite Ferrand alternative.

2. Express existence and uniqueness as the colimit property of the actual square. Do not restrict T to affine schemes and do not assert an algebraic-space target theorem from a Scheme signature.

3. A direct native counterpart now constructs conductorSchemeDesc from the actual all-open ring pullback, proves locality using surjective point lifts and native stalk composition, and supplies both triangles and uniqueness. Apply the native PushoutCocone colimit constructor to this actual scheme cocone. The original statement, hypotheses and acceptance conditions are unchanged; the broader generic GeometricPushout.lift route remains a separate planned contract.

**Acceptance beyond the stated contract**

- The identity finite map gives the pushout of P←empty→empty.

- The universal property is checked on arbitrary scheme targets.

### The recomputed conductor after flat scheme base change

Target `G.0/conductor-scheme-flat-comparison`. Proposed declaration: `conductor_global_flat_comparison`.

For finite schematically dominant f:Y→P and a flat q:T→P, put f_T:Y×_P T→T. Its native recomputed conductor ideal-sheaf datum equals I_f.comap q. The induced conductor square is therefore canonically the actual pullback of the original square, including its quotient subschemes and maps. No reducedness, Noetherianity or quasi-compactness is required of T, and no nonflat recomputation claim is made.

**Inputs.** `G.0/conductor-finite-flat-base-change`, `G.0/conductor-ideal-sheaf`, `G.0/conductor-induced-map`, `G.0/conductor-scheme-geometric`, `G.0/flat-base-change`, `mathlib:AlgebraicGeometry.IsSchemeTheoreticallyDominant.of_isPullback`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comapIso`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.map_ideal`, `G.0/conductor-cokernel-right-base-change`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.ext_of_iSup_eq_top`, `mathlib:TopologicalSpace.Opens.IsBasis.isOpenCover_mem_and_le`, `mathlib:TopologicalSpace.Opens.IsBasis.isOpenCover`, `mathlib:TopologicalSpace.IsOpenCover.comap`, `mathlib:AlgebraicGeometry.Scheme.isBasis_affineOpens`.

**Source and scope.**

- [Finite-module annihilators and flat base change](https://stacks.math.columbia.edu/tag/07T8), Lemma10.40.4, complete displayed statement and proof, accessed 2 October2026. Apply the finite-module annihilator formula to B/A; the generic annihilator theorem is requested at SF.0, not replanned here.

- [Keel’s base point free theorem and quotients in mixed characteristic](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, printed pp674–675; affine conductor description and finite-surjective reduced-scheme hypotheses. Use the finite conductor square without imposing birationality. The finite schematically dominant extension below is an explicitly derived generalization.

**Proof outline.**

1. The pinned scheme-theoretic-dominance theorem and finite base-change stability supply the hypotheses of conductorIdealSheaf f_T.

2. On an affine T-chart mapping into an affine P-chart, compute the pulled-back rings and use conductor-finite-flat-base-change; flatness retains the inclusion and the finite quotient module. Refine T by such charts rather than assuming q is affine.

3. Native ideal-sheaf extensionality and restriction compatibility give equality of ideal-sheaf data. Its existing comapIso supplies the canonical quotient-subscheme comparison; use the projection equations to identify the induced conductor map.

4. The old flat-base-change geometric-pushout theorem transports the geometric square. The new content is that these pulled-back closed loci are exactly the recomputed conductors, not just that an old geometric square stays geometric.

5. The exact existing conductor_global_flat_comparison header now has native evidence. Pull back the affine-open cover of P, refine it by all affine V in T lying over an affine U, and apply native ideal-sheaf extensionality on that cover. The two refined-chart lemmas identify both full ideals with extension along the same actual q.appLE. This works for arbitrary flat q, without assuming q affine or T quasi-compact. Source-ideal and two-step pullback equalities follow. Explicit conductor subscheme isomorphisms and their conductorMap projection coherence remain the next adapter work; no generic Ferrand existence result is concluded.

**Acceptance beyond the stated contract**

- Flat dual-number thickening is allowed although its rings are nonreduced.

- The cusp quotient by t² loses injectivity, so the nonflat counterexample is excluded by an actual necessary hypothesis.

### Common-ideal localization equivalence

Target `G.0/common-ideal-away-equiv`. Proposed declaration: `AffinePinching.commonIdealAwayEquiv`.

Under the common-ideal image and kernel hypotheses, for t∈I define E:A_t≃B_f(t) as the native ring equivalence obtained from the canonical localization map and its proved bijectivity. Its forward map is that specified localization map; its inverse has the native ring-equivalence laws.

**Hypotheses.** A,B are arbitrary commutative rings with identity, including the zero ring; f:A→B is unital and I is an ideal of A. No injectivity, finiteness, reducedness, Noetherianity or regularity of t is assumed.

**Inputs.** `mathlib:Ideal.mul_mem_right`, `mathlib:IsLocalization.Away.map`, `mathlib:IsLocalization.Away.map_injective_iff`, `mathlib:IsLocalization.Away.map_surjective_iff`, `mathlib:Ideal.mem_map_of_mem`, `mathlib:RingEquiv.ofBijective`, `mathlib:IsLocalization.map_eq`, `mathlib:RingEquiv.ofBijective_apply`.

**Source and scope.**

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem5.1, printed p568, complete principal-localization paragraph, with Lemma1.3(b) and its converse, pp556–557. Native localization adapter for the common ideal. No injectivity of the original map or domain hypothesis is assumed.

**Proof outline.**

1. Apply the existing RingEquiv.ofBijective to Away.map and common-ideal-away-bijective. Use native localization carriers, ring structures and inverse laws.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/affine-existence`: Identify the specified localization map on the complement of the pinching ideal.

**API.**

- `AffinePinching.commonIdeal_kill_kernel` (compatibility): If ker(f)∩I=0, t∈I and f(a)=0, then ta=0. This does not require f(I) to be an ideal.

- `AffinePinching.commonIdeal_away_bijective` (compatibility): Suppose f(I) is already an ideal, expressed by map_f(I)=f(I) as underlying sets, and ker(f)∩I=0. For t∈I and any native localizations A_t,B_f(t), the canonical localization map A_t→B_f(t) is bijective. Zero divisors, nilpotent t and zero localizations are allowed.

- `AffinePinching.commonIdealAwayEquiv_apply` (compatibility): For every x∈A_t, E(x)=Away.map(f,t)(x), under the common-ideal hypotheses.

- `AffinePinching.commonIdealAwayEquiv_algebraMap` (simp): For a∈A, E([a])=[f(a)] in B_f(t).

- `AffinePinching.commonIdealAwayEquiv_symm_algebraMap` (simp): For a∈A, E⁻¹([f(a)])=[a] in A_t.

- `AffinePinching.commonIdealAwayEquiv_symm_of_mul` (compatibility): Under the common-ideal hypotheses, if f(a)=f(t)b, then E⁻¹([b])=a/t in the actual localization A_t. The witness a need not be selected canonically, need not lie in I and is not required to be unique before localization.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `CommonIdealAwayEquiv.identity`: For f=id_Z, I=Z and any t,a, E sends the actual localized image of a to that same image.

- `CommonIdealAwayEquiv.inverse_fraction`: For f=id_Z, I=Z and t=2, E⁻¹([3]) is the actual fraction6/2 in Z[1/2].

- `CommonIdealAwayEquiv.noninjective`: The first projection Z×Z→Z is not injective, but its localization away from (1,0) is bijective for I=Z×0.

- `CommonIdealAwayEquiv.nilpotent`: For f=id_(Z/4), I=Z/4 and t=2, the actual localized map is bijective and its localization carrier is subsingleton because2²=0.

- `CommonIdealAwayEquiv.kernel_condition_necessary`: The first projection Z×Z→Z localized at1 is not injective. With I=Z×Z its image is an ideal, but ker(f)∩I is nonzero.

- `CommonIdealAwayEquiv.image_condition_necessary`: The diagonal Z→Z×Z localized at1 is not surjective. With I=Z its kernel is zero, but the image of I is the diagonal subring and is not an ideal.

**Acceptance beyond the stated contract**

- The equivalence retains the actual section-ring map, rather than an arbitrary chosen isomorphism between the two carriers.

### Reconstruction ring equivalence

Target `G.0/common-ideal-equiv`. Proposed declaration: `AffinePinching.commonIdealEquiv`.

For arbitrary commutative rings A,B, f:A→B and I⊂A, assume map_f(I)=f(I) as sets and ker(f)∩I=0. Construct the native ring equivalence E:A≃B×_(B/map_f(I))(A/I) whose forward hom is the specified comparison c(a)=(f(a),[a]). Its inverse reconstructs an element from a compatible pair and preserves addition, multiplication and the unit.

**Inputs.** `G.0/subring-conductor`, `mathlib:Ideal.map_comap_le`, `mathlib:Ideal.mem_map_of_mem`, `G.0/common-ideal-cartesian`, `mathlib:RingEquiv.ofBijective`.

**Source and scope.**

- [Conducteur, descente et pincement — bounded native affine continuation](https://www.numdam.org/item/BSMF_2003__131_4_553_0.pdf), Printed pp554–557, introduction and §§1.1–1.4. Authored native reconstruction and exactness deductions from the common-ideal criterion; the all-open normalization comparison additionally consumes this packet’s actual native normalization isomorphism.

**Proof outline.**

1. Apply RingEquiv.ofBijective to the actual comparison using common-comparison-bijective.

2. Retain that ring map as the forward map, so the inverse has both actual coordinate identities and uniqueness. No second pullback carrier or chosen unrelated isomorphism is introduced.

3. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `Ferrand §1.3 and NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-affine-quotients`: Supply the actual compatible-pair reconstruction and maps needed by the conductor-square consumer. `G.1/quadratic-pinch-i1-genus`: Supply the affine additive sequence before the separately required conductor sheaf and finite-pushforward cohomology comparisons.

**API.**

- `AffinePinching.conductorRing_map_comap` (compatibility): For every subring S of a commutative ring B, the extension to B of the contraction of its ambient conductor is the original conductor: map_subtype(comap_subtype(c(S,B)))=c(S,B). This is equality of full ideals, with no radicals or reducedness assumption.

- `AffinePinching.conductorRing_image_comap` (compatibility): For every subring S⊂B, subtype_S(comap_subtype(c(S,B))) equals c(S,B) as sets. Thus this image already is an ambient ideal; the assertion is stronger than merely generating that ideal.

- `AffinePinching.commonIdealEquiv_apply` (compatibility): Under the reconstruction hypotheses, E(a)=c(a) for every a∈A; both coordinates are the actual maps f and A→A/I.

- `AffinePinching.commonIdealEquiv_inverse_fst` (compatibility): Under the reconstruction hypotheses, f(E⁻¹(p)) equals the native B-projection of every compatible pair p∈B×_(B/map_f(I))(A/I).

- `AffinePinching.commonIdealEquiv_inverse_snd` (compatibility): Under the reconstruction hypotheses, the class of E⁻¹(p) in A/I is the actual second projection of the compatible pair p. Equality is in the quotient, and makes no assertion that an arbitrary representative is the reconstructed element.

- `AffinePinching.commonIdealEquiv_inverse_unique` (compatibility): Under the reconstruction hypotheses, if a∈A has f(a)=p₁ and [a]=p₂ for a compatible pair p, then E⁻¹(p)=a. The equality uses both coordinates; the second coordinate alone does not choose a representative.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `AffinePinching.commonIdealEquiv.test_noninjective_zero_inverse`: For ℤ→F₂ and I=0, the reconstruction inverse takes c(a) back to a for every integer a, although the original ring map is not injective.

- `AffinePinching.commonIdealEquiv.test_identity_inverse`: For f=id_A and every ideal I, the actual reconstruction inverse of c(a) is a.

- `AffinePinching.commonIdealEquiv.test_distinct_representatives`: For f=id_ℤ and I=(2), the compatible pair (7,[3]) reconstructs7 and does not reconstruct3. This checks both coordinates rather than selecting an arbitrary residue representative.

**Acceptance beyond the stated contract**

- The native counterpart and the corresponding typed acceptance examples are checked separately; the suggested declaration remains admitted and implementationStatus unchecked.

### Difference map of the common-ideal square

Target `G.0/common-ideal-difference`. Proposed declaration: `AffinePinching.commonIdealDifference`.

For arbitrary commutative rings A,B, f:A→B and I⊂A, put J=map_f(I) and q:A/I→B/J. Define the actual additive homomorphism d:B×A/I→B/J by d(b,α)=[b]−q(α). No image-ideal or kernel hypothesis is imposed. This is an additive map; subtraction is essential and no ring-hom claim is made.

**Inputs.** `mathlib:Ideal.quotientMap`, `mathlib:Ideal.Quotient.mk`, `mathlib:MonoidHom.fst`, `mathlib:MonoidHom.snd`.

**Source and scope.**

- [Conducteur, descente et pincement — bounded native affine continuation](https://www.numdam.org/item/BSMF_2003__131_4_553_0.pdf), Printed pp554–557, introduction and §§1.1–1.4. Authored native reconstruction and exactness deductions from the common-ideal criterion; the all-open normalization comparison additionally consumes this packet’s actual native normalization isomorphism.

**Proof outline.**

1. Compose the native additive quotient maps with the two product projections.

2. Subtract the resulting AddMonoidHom maps. The target is the original quotient by the full ideal J.

3. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `Ferrand §1.3 and NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-affine-quotients`: Supply the actual compatible-pair reconstruction and maps needed by the conductor-square consumer. `G.1/quadratic-pinch-i1-genus`: Supply the affine additive sequence before the separately required conductor sheaf and finite-pushforward cohomology comparisons.

**API.**

- `AffinePinching.commonIdealDifference_apply` (compatibility): For every b∈B and α∈A/I, d(b,α)=[b]−q(α) in B/map_f(I), with the quotient map induced by f.

- `AffinePinching.commonIdealDifference_surjective` (compatibility): For every f and I, d:B×A/I→B/map_f(I) is surjective. It does not require map_f(I)=f(I), nor does surjectivity by itself imply exactness at B×A/I.

- `AffinePinching.commonIdeal_exact` (compatibility): For arbitrary commutative rings and f:A→B, I⊂A, assume map_f(I)=f(I) as sets. Then A→B×A/I→B/map_f(I), with maps a↦(f(a),[a]) and d(b,α)=[b]−q(α), is Function.Exact. It is exact at the middle term even when f has a nonzero kernel. It becomes short exact precisely when the diagonal map is injective.

- `AffinePinching.commonIdeal_exact_iff` (compatibility): For every f and I, the actual sequence a↦(f(a),[a]), d(b,α)=[b]−q(α) is Function.Exact if and only if map_f(I)=f(I) as sets. There is no kernel condition in this equivalence; that condition controls the separate initial injection.

- `AffinePinching.commonIdealDiagonal_injective_iff` (compatibility): For every f:A→B and I⊂A, the native diagonal ring hom a↦(f(a),[a]) into B×A/I is injective exactly when ker(f)∩I=0. This equivalence requires no image-ideal hypothesis.

- `AffinePinching.commonIdealComparison_surjective_iff` (compatibility): For every f:A→B and I⊂A, the comparison c:A→B×_(B/map_f(I))(A/I) is surjective if and only if map_f(I)=f(I) as sets. In particular injectivity of f cannot replace the image-ideal condition.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `AffinePinching.commonIdealDifference.test_identity_exact`: For f=id_A and every ideal I the specified diagonal and difference maps form an exact pair.

- `AffinePinching.commonIdealDifference.test_noninjective_exact`: For ℤ→F₂ and I=ker(f), the specified sequence is exact at its middle term while its initial diagonal map is not injective.

- `AffinePinching.commonIdealDifference.test_diagonal_failure`: For the injective diagonal F₂→F₂×F₂ with I=⊤, d is surjective but the specified sequence is not exact; (0,1) lies in the generated ideal and not in the diagonal image.

- `AffinePinching.commonIdealDifference.test_minus_sign`: For f=id_ℤ and I=0, d(0,[1])=−[1] in ℤ/map_id(0), fixing the sign of the exact sequence.

**Acceptance beyond the stated contract**

- The native counterpart and the corresponding typed acceptance examples are checked separately; the suggested declaration remains admitted and implementationStatus unchecked.

### Recomputed conductor for a finite spanning family

Target `G.0/conductor-localization-finite-generators`. Proposed declaration: `FerrandPushout.conductor_localization_finite_generators`.

Let A and B be commutative rings, f:A→B their actual coefficient algebra map, S⊂A a submonoid, L an actual S-localization of A, and M an actual f(S)-localization of B. Let f_S:L→M be the native localized map, determined by f_S(a/t)=f(a)/f(t). No injectivity, reducedness, regularity of denominators or nonzero-localization hypothesis is imposed. Suppose g:Fin n→B spans B as an A-module, including n=0. Then the ideal obtained by extending f⁻¹(conductor(im f,B)) to L equals f_S⁻¹(conductor(im f_S,M)).

**Inputs.** `G.0/subring-conductor`, `mathlib:Submodule.comap`, `mathlib:Submodule.mem_comap`, `mathlib:Submodule.mem_bot`, `mathlib:LinearMap.smul_apply`, `mathlib:Submodule.mkQ`, `mathlib:Submodule.mkQ_apply`, `mathlib:Submodule.Quotient.mk_smul`, `mathlib:Submodule.Quotient.mk_eq_zero`, `mathlib:Submodule.mem_span_singleton`, `mathlib:Submodule.span_le`, `mathlib:RingHom.mem_range`, `mathlib:Ideal.mem_comap`, `mathlib:Finset.prod_erase_mul`, `mathlib:Submonoid.prod_mem`, `mathlib:IsLocalization.mk'_mem_map_algebraMap_iff`, `mathlib:IsLocalization.map`, `mathlib:IsLocalization.map_mk'`, `mathlib:IsLocalization.exists_mk'_eq`, `mathlib:IsLocalization.mk'_eq_iff_eq_mul`, `mathlib:IsLocalization.eq_iff_exists`, `mathlib:Submonoid.mem_map`, `mathlib:Submonoid.le_comap_map`, `mathlib:IsLocalization.map_eq`, `mathlib:IsLocalization.mk'_spec`, `mathlib:IsLocalization.mul_mk'_eq_mk'_of_mul`, `mathlib:Submonoid.mem_map_of_mem`, `mathlib:Subring.mul_mem`, `mathlib:IsLocalization.mk'_eq_mul_mk'_one`.

**Source and scope.**

- [Finite-generator conductor specialization](https://stacks.math.columbia.edu/tag/07T8), Lemma10.40.4 proof finite-generation step; Ferrand introduction p554 conductor=annihilator context; explicit conductor-specific derivation. Specialize the finite-generator argument to the actual conductor and clear denominators by their finite product. Generic flat-annihilator theory remains owned by SF.0.

- [Conductor-specific localization comparison — finite-module context](https://stacks.math.columbia.edu/tag/07T8), Stacks Lemma10.40.4 full proof, finite-generation step; Ferrand printed p554 conductor context and p557 conductor of a possibly noninjective map; explicit conductor-specific localization derivation. The source supplies finite-annihilator context. This node derives its actual localized-map formula directly from the pinned native localization APIs; it does not replan the generic SF.0 flat-annihilator theorem.

**Proof outline.**

1. For r=a/t, native extended-ideal membership is equivalent to existence of s∈S with sa in the original contracted conductor.

2. Use conductor-localized-test-original-elements and conductor-localized-product-criterion. An original conductor multiplier supplies every original-element test.

3. Conversely, apply the product criterion to each of the finitely many g_i. The incoming conductor-common-denominator lemma combines their witnesses, using the complementary products and the spanning-family criterion, to one s with sa in the conductor.

4. Thus both native ideals have the same members. No generic tensor/flat-annihilator comparison, domain cancellation, or injectivity adapter is assumed.

5. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**API.**

- `FerrandPushout.conductor_mem_iff_generators` (compatibility): For every commutative A-algebra B, g:Fin n→B with span_A(range g)=B, and a∈A, a belongs to the contracted arbitrary-image conductor if and only if f(a)g_i belongs to im f for every i. The map f is the actual algebraMap; n=0, noninjective maps and zero rings are allowed.

- `FerrandPushout.conductor_common_denominator` (compatibility): With the same actual algebra and finite spanning family, and any multiplicative subset S⊂A, (for every i there is s_i∈S with f(s_i a)g_i∈im f) is equivalent to (there is s∈S with sa in the contracted conductor). Neither cancellation nor injectivity is assumed; S may contain zero.

- `FerrandPushout.conductor_fraction_mem_iff_generators` (compatibility): Let L be any actual S-localization of A, with its native A-algebra and IsLocalization instance. For every t∈S the native fraction a/t lies in the ideal extended from the contracted conductor if and only if for each generator g_i there exists s_i∈S with f(s_i a)g_i∈im f. The supplied denominator t imposes no regularity condition.

- `FerrandPushout.conductor_localized_image_criterion` (compatibility): Let A and B be commutative rings, f:A→B their actual coefficient algebra map, S⊂A a submonoid, L an actual S-localization of A, and M an actual f(S)-localization of B. Let f_S:L→M be the native localized map, determined by f_S(a/t)=f(a)/f(t). No injectivity, reducedness, regularity of denominators or nonzero-localization hypothesis is imposed. For b∈B, its actual image in M lies in im f_S if and only if some s∈S satisfies f(s)b∈im f.

- `FerrandPushout.conductor_localized_fraction_image` (compatibility): Let A and B be commutative rings, f:A→B their actual coefficient algebra map, S⊂A a submonoid, L an actual S-localization of A, and M an actual f(S)-localization of B. Let f_S:L→M be the native localized map, determined by f_S(a/t)=f(a)/f(t). No injectivity, reducedness, regularity of denominators or nonzero-localization hypothesis is imposed. For b∈B and t∈S, the fraction b/f(t) belongs to im f_S if and only if the actual image of b in M belongs to im f_S.

- `FerrandPushout.conductor_localized_product_criterion` (compatibility): Let A and B be commutative rings, f:A→B their actual coefficient algebra map, S⊂A a submonoid, L an actual S-localization of A, and M an actual f(S)-localization of B. Let f_S:L→M be the native localized map, determined by f_S(a/t)=f(a)/f(t). No injectivity, reducedness, regularity of denominators or nonzero-localization hypothesis is imposed. For a∈A, t∈S and b∈B, f_S(a/t)·b belongs to im f_S if and only if some s∈S satisfies f(sa)b∈im f, where b on the left is its actual image in M.

- `FerrandPushout.conductor_localized_mem_iff_images` (compatibility): Let A and B be commutative rings, f:A→B their actual coefficient algebra map, S⊂A a submonoid, L an actual S-localization of A, and M an actual f(S)-localization of B. Let f_S:L→M be the native localized map, determined by f_S(a/t)=f(a)/f(t). No injectivity, reducedness, regularity of denominators or nonzero-localization hypothesis is imposed. For r∈L, r belongs to f_S⁻¹(conductor(im f_S,M)) if and only if f_S(r)·b lies in im f_S for every original b∈B.

The packet attaches the exact source and proof-input list to each API contract.

**Acceptance beyond the stated contract**

- The empty family is valid for the zero B-module; it does not impose injectivity on A→B.

### Finite-algebra conductor agrees with its recomputation

Target `G.0/conductor-localization-recomputed`. Proposed declaration: `FerrandPushout.conductor_localization_recomputed`.

Let A and B be commutative rings, f:A→B their actual coefficient algebra map, S⊂A a submonoid, L an actual S-localization of A, and M an actual f(S)-localization of B. Let f_S:L→M be the native localized map, determined by f_S(a/t)=f(a)/f(t). No injectivity, reducedness, regularity of denominators or nonzero-localization hypothesis is imposed. If B is finite as an A-module, the extension to L of the original contracted conductor equals the conductor contracted along the actual f_S. This generalizes the existing injective-map conductor-localization target without changing its contract.

**Inputs.** `G.0/conductor-localization-finite-generators`, `mathlib:Module.Finite.exists_fin`.

**Source and scope.**

- [Conductor-specific localization comparison — finite-module context](https://stacks.math.columbia.edu/tag/07T8), Stacks Lemma10.40.4 full proof, finite-generation step; Ferrand printed p554 conductor context and p557 conductor of a possibly noninjective map; explicit conductor-specific localization derivation. The source supplies finite-annihilator context. This node derives its actual localized-map formula directly from the pinned native localization APIs; it does not replan the generic SF.0 flat-annihilator theorem.

**Proof outline.**

1. Obtain an actual finite spanning family using the pinned Module.Finite.exists_fin declaration.

2. Apply conductor-localization-finite-generators. The existing conductor_localization signature is recovered as its injective-map special case; no use of injectivity is needed for equality.

3. Keep the conductor-specific localization conclusion distinct from the requested generic flat-annihilator theorem and from the geometric affine restriction and IdealSheafData assembly.

**Acceptance beyond the stated contract**

- Diagonal Z/4→Z/4×Z/4, its nilpotent denominator2 and its zero localization satisfy the same equality.

- For the actual cusp A=k+X²k[X], localization at the actual element X² gives a recomputed unit conductor.

### Reconstruct target sections from the actual conductor rings

Target `G.0/conductor-sections-isomorphism`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorSectionsIso`.

For finite schematically dominant f and affine U, construct the specified native CommRingCat isomorphism Γ(P,U)≅B×_D C using the actual source inclusion B→D and conductorChartMap C→D. Here the fiber-product object is the native CommRingCat.pullbackCone point, retaining zero rings and nilpotents.

**Hypotheses.** Finite and schematically dominant f; affine U only where expressly stated; preserve the full conductor ideals and actual native section rings.

**Inputs.** `G.0/common-ideal-cartesian`, `G.0/conductor-induced-map`, `mathlib:AlgebraicGeometry.Scheme.Hom.app_injective`, `mathlib:CategoryTheory.IsPullback.of_iso'`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeObjIso`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app_surjective`, `mathlib:Ideal.quotEquivOfEq`, `mathlib:Ideal.quotEquivOfEq_mk`, `mathlib:Ideal.quotientMap_mk`, `mathlib:CommRingCat.pullbackCone`, `mathlib:CommRingCat.pullbackConeIsLimit`, `mathlib:CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso`.

**Source and scope.**

- [Conductor section-ring context, Stacks 0ET0](https://stacks.math.columbia.edu/tag/0ET0), Stacks 0ET0 bounded displayed statement/proof; authored deduction from pinned native APIs. Source context motivates the conductor square; the broader finite schematically dominant statements here are authored deductions. Neither source proof defect is used.

- [Conductor section-ring context, Stacks 0C6L](https://stacks.math.columbia.edu/tag/0C6L), Stacks 0C6L bounded displayed statement/proof; authored deduction from pinned native APIs. Source context motivates the conductor square; the broader finite schematically dominant statements here are authored deductions. Neither source proof defect is used.

**Proof outline.**

1. Use uniqueness of native limit cone points between the actual section pullback and the native ring pullback cone.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/conductor-scheme-geometric`: Provide actual affine section-ring reconstruction and restriction-compatible additive exactness before the separate global sheaf and geometric pushout arguments.

**API.**

- `TauCeti.GenusOne.FerrandPushout.conductor_affine_isPullback` (compatibility): For finite schematically dominant f and affine U, put V=f⁻¹U, C=Γ(I.subscheme,I.ι⁻¹U), D=Γ(J.subscheme,J.ι⁻¹V). The square A→B, A→C, B→D, C→D, whose arrows are the actual f.app U, I.ι.app U, J.ι.app V and conductorChartMap f U, is a pullback in CommRingCat.

- `TauCeti.GenusOne.FerrandPushout.conductorSectionsIso_fst` (compatibility): For every such affine U, conductorSectionsIso.hom followed by the native first projection equals f.app U, as actual CommRingCat morphisms.

- `TauCeti.GenusOne.FerrandPushout.conductorSectionsIso_snd` (compatibility): For every such affine U, conductorSectionsIso.hom followed by the native second projection equals I.ι.app U.

- `TauCeti.GenusOne.FerrandPushout.conductorSectionsIso_inv_fst` (compatibility): For every such affine U, conductorSectionsIso.inv followed by f.app U equals the native first projection from B×_D C.

- `TauCeti.GenusOne.FerrandPushout.conductorSectionsIso_inv_snd` (compatibility): For every such affine U, conductorSectionsIso.inv followed by I.ι.app U equals the native second projection.

- `TauCeti.GenusOne.FerrandPushout.conductorSectionsIso_inv_unique` (compatibility): For every such affine U, a native fiber-product element p and a∈Γ(P,U) with f.app U(a)=p.first, the specified inverse conductorSectionsIso.inv(p) equals a. Its second coordinate is automatically fixed by fiber-product compatibility.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorSectionsChecked.empty_open`: On the empty target open every target section reconstructs to zero in the actual native ring fiber product.

- `ConductorSectionsChecked.reconstruction`: Every target section is recovered exactly after forward and inverse reconstruction through the specified actual conductor section-ring isomorphism.

- `ConductorSectionsChecked.nonreduced_identity`: For the identity of Spec(Z/4) the section corresponding to2 reconstructs to a nonzero element with square zero in the actual fiber product. A reduction that loses nilpotents fails this test.

**Acceptance beyond the stated contract**

- Do not infer global sheaf exactness, quotient topology or a geometric/categorical pushout solely from affine exactness.

### The signed conductor difference on every open

Target `G.0/conductor-section-difference`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorSectionDifference`.

For finite schematically dominant f and every open U, with actual section rings B_U,C_U,D_U as above, define the additive homomorphism δ_U:B_U×C_U→D_U by δ_U(b,c)=J.ι.app(f⁻¹U)(b)−conductorChartMap f U(c). This is an additive homomorphism, with the specified subtraction sign.

**Hypotheses.** Finite and schematically dominant f; affine U only where expressly stated; preserve the full conductor ideals and actual native section rings.

**Inputs.** `G.0/conductor-induced-map`.

**Source and scope.**

- [Conductor section-ring context, Stacks 0ET0](https://stacks.math.columbia.edu/tag/0ET0), Stacks 0ET0 bounded displayed statement/proof; authored deduction from pinned native APIs. Source context motivates the conductor square; the broader finite schematically dominant statements here are authored deductions. Neither source proof defect is used.

- [Conductor section-ring context, Stacks 0C6L](https://stacks.math.columbia.edu/tag/0C6L), Stacks 0C6L bounded displayed statement/proof; authored deduction from pinned native APIs. Source context motivates the conductor square; the broader finite schematically dominant statements here are authored deductions. Neither source proof defect is used.

**Proof outline.**

1. Subtract the two actual ring section maps after converting them to additive homomorphisms and composing with the two product projections.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/conductor-scheme-geometric`: Provide actual affine section-ring reconstruction and restriction-compatible additive exactness before the separate global sheaf and geometric pushout arguments.

**API.**

- `TauCeti.GenusOne.FerrandPushout.conductorSectionDifference_apply` (compatibility): For every open U and actual sections b,c, δ_U(b,c)=J.ι.app(f⁻¹U)(b)−conductorChartMap f U(c).

- `TauCeti.GenusOne.FerrandPushout.conductorSectionDifference_zero` (compatibility): For every open U and a∈Γ(P,U), δ_U(f.app U(a),I.ι.app U(a))=0. Affineness is unnecessary for this statement.

- `TauCeti.GenusOne.FerrandPushout.conductorSectionDifference_surjective` (compatibility): For every affine U, δ_U is surjective onto the actual source-conductor section ring D_U. No claim of surjectivity on arbitrary open section rings is made.

- `TauCeti.GenusOne.FerrandPushout.conductorSectionPair_injective` (compatibility): For every open U the actual ring homomorphism a↦(f.app U(a),I.ι.app U(a)) is injective.

- `TauCeti.GenusOne.FerrandPushout.conductorSectionDifference_exact` (compatibility): For every affine U the sequence A→B_U×C_U→D_U, with a↦(f.app U(a),I.ι.app U(a)) followed by δ_U, is Function.Exact: a pair has difference zero exactly when it comes from a target section. Together with the injectivity and surjectivity lemmas this gives the short exact sequence of underlying additive groups on affine opens.

- `TauCeti.GenusOne.FerrandPushout.conductorSectionDifference_restrict` (compatibility): For any U⊆V, restrict δ_V(b,c) along the actual source-conductor inclusion. The result equals δ_U applied to the restrictions of b along f⁻¹U⊆f⁻¹V and c along I.ι⁻¹U⊆I.ι⁻¹V. This holds for arbitrary, including empty, opens, with the actual native presheaf restriction maps.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorDifferenceChecked.signed_units`: On every open, the pairs(1,0) and(0,1) map respectively to1 and−1, checking the subtraction sign and the actual unital section maps.

- `ConductorDifferenceChecked.exact_lifting`: On every affine open a pair with zero difference has exactly one target section giving both coordinates; this checks existence and uniqueness through the actual maps.

- `ConductorDifferenceChecked.empty_open`: On the empty open the difference of every actual section pair is zero, including the zero section rings of both conductor schemes.

**Acceptance beyond the stated contract**

- Do not infer global sheaf exactness, quotient topology or a geometric/categorical pushout solely from affine exactness.

### The structure-sheaf comparison with the native pullback

Target `G.0/conductor-sheaf-comparison`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorSheafComparison`.

Construct O_P→f_*O_Y ×_(f_*J.ι_*O_J) I.ι_*O_I in the native category of CommRingCat-valued sheaves on P. Its coordinates are the actual f.c and I.ι.c, and its compatibility is the already proved conductor square on every open.

**Hypotheses.** Finite and schematically dominant f:Y→P; all opens arbitrary except the explicitly affine agreement lemma. Native conductor ideal data and actual structure maps throughout.

**Inputs.** `G.0/conductor-ideal-sheaf`, `mathlib:TopCat.Sheaf.pushforward`, `mathlib:CategoryTheory.Functor.whiskerLeft`, `G.0/conductor-induced-map`, `mathlib:CategoryTheory.Sheaf.hom_ext`.

**Source and scope.**

- [Conductor structure-sheaf context, Stacks37.14.1](https://stacks.math.columbia.edu/tag/0ET0), Stacks37.14.1 complete displayed statement/proof; authored finite-conductor deduction. Context for the structure-sheaf comparison. The broader finite schematically dominant result is derived here from the pinned native sheaf APIs and the preceding affine conductor theorem. The recorded pushforward-domain misprint is not used.

**Proof outline.**

1. Apply the native pullback lift to the two actual structure-sheaf morphisms. Prove their composites equal by sheaf-morphism extensionality, natural-transformation extensionality and the actual component square.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/conductor-scheme-geometric`: Supply the actual structure-sheaf pullback and every-open ring comparison before the separately required quotient-topology and geometric/categorical pushout arguments.

**API.**

- `TauCeti.GenusOne.FerrandPushout.conductorSheafInclusion_app` (compatibility): On any open U⊂P, the component of conductorSheafInclusion is the actual native map J.ι.app(f⁻¹U):Γ(Y,f⁻¹U)→Γ(J.subscheme,J.ι⁻¹(f⁻¹U)).

- `TauCeti.GenusOne.FerrandPushout.conductorSheafComparison_fst` (compatibility): The native first projection after conductorSheafComparison is f.c as a morphism O_P→f_*O_Y.

- `TauCeti.GenusOne.FerrandPushout.conductor_sheaf_isPullback` (compatibility): The square with upper-left O_P, the two actual structure maps f.c and I.ι.c, and lower maps conductorSheafInclusion and conductorSheafChart is a native IsPullback in the category of sheaves of commutative rings on P.

- `TauCeti.GenusOne.FerrandPushout.conductorSheafInclusion` (constructor): For finite schematically dominant f:Y→P, let I=I_f and J=I.comap f. Construct the actual CommRingCat-valued sheaf morphism f_*O_Y→f_*J.ι_*O_J by pushing forward the native closed-inclusion structure map. The target is an iterated pushforward on P, with its actual sheaf condition.

- `TauCeti.GenusOne.FerrandPushout.conductorSheafChart_app` (compatibility): On every open U⊂P, the component of conductorSheafChart is exactly conductorChartMap f U, including its prescribed inverse-image identification.

- `TauCeti.GenusOne.FerrandPushout.conductorSheafComparison_snd` (compatibility): The native second projection after conductorSheafComparison is I.ι.c as a morphism O_P→I.ι_*O_I.

- `TauCeti.GenusOne.FerrandPushout.conductorSheafChart` (constructor): Construct I.ι_*O_I→f_*J.ι_*O_J on P whose component on every open U is exactly conductorChartMap f U. Its naturality is the previously checked actual open-restriction equation; there is no affine-open restriction on this morphism.

- `TauCeti.GenusOne.FerrandPushout.conductorSheafComparison_isIso` (compatibility): For every finite schematically dominant f:Y→P, the specified conductorSheafComparison is an isomorphism of native sheaves of commutative rings. No reducedness, Noetherianity, birationality or global affineness is required.

- `TauCeti.GenusOne.FerrandPushout.conductor_open_isPullback` (compatibility): For every open U⊂P, including nonaffine and empty opens, the actual ring square with arrows f.app U, I.ι.app U, J.ι.app(f⁻¹U) and conductorChartMap f U is a pullback in CommRingCat.

- `TauCeti.GenusOne.FerrandPushout.conductorSectionDifference_open_exact` (compatibility): On every open U⊂P, the actual additive sequence Γ(P,U)→Γ(Y,f⁻¹U)×Γ(I.subscheme,I.ι⁻¹U)→Γ(J.subscheme,J.ι⁻¹(f⁻¹U)), with section pair followed by the signed difference, is Function.Exact. Thus every compatible pair has a unique target section by the existing section-pair injectivity. This statement does not assert surjectivity of the last map on nonaffine opens.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorSheafChecked.inclusion_empty`: On the empty target open the pushed-forward source inclusion sends every actual section to zero; the native zero section rings are retained.

- `ConductorSheafChecked.inclusion_restriction`: The actual source-inclusion sheaf morphism commutes with restriction for every U⊆V, with both iterated inverse-image restrictions visible.

- `ConductorSheafChecked.chart_signed_units`: The two actual sheaf components give signed differences1 and−1 on the pairs(1,0) and(0,1), checking the subtraction sign.

- `ConductorSheafChecked.chart_commutes`: For every open and every target section the two actual sheaf morphisms give equal images in the source conductor sections.

- `ConductorSheafChecked.unique_sheaf_lift`: Any native sheaf F with compatible morphisms into the two conductor sheaves has a unique morphism F→O_P with those actual coordinates.

- `ConductorSheafChecked.union_lifting`: A zero-difference section pair on U∪V has a unique target section on U∪V, with no affine hypothesis on U,V or their union.

**Acceptance beyond the stated contract**

- The sheaf pullback does not alone settle quotient topology or the geometric/categorical Scheme pushout. Last-map section surjectivity is asserted only in the inherited affine theorem.

### Reconstruct sections on arbitrary opens

Target `G.0/conductor-open-sections-isomorphism`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorOpenSectionsIso`.

For each arbitrary open U⊂P, construct the native CommRingCat isomorphism Γ(P,U)≅B_U×_(D_U)C_U, where B_U,C_U,D_U and both lower arrows are the actual section rings and maps. The fiber product is the native CommRingCat.pullbackCone point, retaining nilpotents and zero rings.

**Hypotheses.** Finite and schematically dominant f:Y→P; all opens arbitrary except the explicitly affine agreement lemma. Native conductor ideal data and actual structure maps throughout.

**Inputs.** `G.0/conductor-sheaf-comparison`, `G.0/conductor-section-difference`, `G.0/conductor-induced-map`, `mathlib:CategoryTheory.Limits.Types.exists_of_isPullback`, `mathlib:CommRingCat.pullbackCone`, `mathlib:CommRingCat.pullbackConeIsLimit`, `mathlib:CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso`.

**Source and scope.**

- [Conductor structure-sheaf context, Stacks37.14.1](https://stacks.math.columbia.edu/tag/0ET0), Stacks37.14.1 complete displayed statement/proof; authored finite-conductor deduction. Context for the structure-sheaf comparison. The broader finite schematically dominant result is derived here from the pinned native sheaf APIs and the preceding affine conductor theorem. The recorded pushforward-domain misprint is not used.

- [Conductor additive sheaf sequence, context in Stacks37.14.1](https://stacks.math.columbia.edu/tag/0ET0), Stacks37.14.1 complete displayed statement and proof; authored additive finite-conductor deduction. Context for the actual structure-sheaf pullback. This short-exact additive sequence is an authored consequence of the preceding general finite-conductor pullback, actual closed-inclusion surjectivity on affine opens, and pinned native abelian/sheaf APIs. No source claim of arbitrary-open section surjectivity is made.

**Proof outline.**

1. Compare the actual all-open limiting conductor cone with the native explicit ring pullback cone by uniqueness of limit cone points.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/conductor-scheme-geometric`: Supply the actual structure-sheaf pullback and every-open ring comparison before the separately required quotient-topology and geometric/categorical pushout arguments.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: Finite and schematically dominant f:Y→P; I=conductorIdealSheaf f and J=I.comap f. Opens arbitrary except where explicitly affine. Actual native sheaves, maps and biproduct throughout.

- `TauCeti.GenusOne.FerrandPushout.conductorSectionDifference_open_exact` (compatibility): On every open U⊂P, the actual additive sequence Γ(P,U)→Γ(Y,f⁻¹U)×Γ(I.subscheme,I.ι⁻¹U)→Γ(J.subscheme,J.ι⁻¹(f⁻¹U)), with section pair followed by the signed difference, is Function.Exact. Thus every compatible pair has a unique target section by the existing section-pair injectivity. This statement does not assert surjectivity of the last map on nonaffine opens.

- `TauCeti.GenusOne.FerrandPushout.conductorOpenSectionsIso_fst` (compatibility): For every open U, conductorOpenSectionsIso.hom followed by the explicit native first projection equals f.app U.

- `TauCeti.GenusOne.FerrandPushout.conductorOpenSectionsIso_snd` (compatibility): For every open U, conductorOpenSectionsIso.hom followed by the explicit native second projection equals I.ι.app U.

- `TauCeti.GenusOne.FerrandPushout.conductorOpenSectionsIso_inv_fst` (compatibility): For every open U, conductorOpenSectionsIso.inv followed by f.app U equals the native first projection from the explicit ring fiber product.

- `TauCeti.GenusOne.FerrandPushout.conductorOpenSectionsIso_inv_snd` (compatibility): For every open U, conductorOpenSectionsIso.inv followed by I.ι.app U equals the native second projection from the explicit ring fiber product.

- `TauCeti.GenusOne.FerrandPushout.conductorOpenSectionsIso_affine` (compatibility): For every affine U, the all-open conductorOpenSectionsIso f U equals the preceding conductorSectionsIso f U as the entire native CommRingCat isomorphism, with both forward and inverse maps thereby identified.

- `TauCeti.GenusOne.FerrandPushout.conductor_additive_isPullback` (compatibility; assumptions H1): For every finite schematically dominant f:Y→P, apply the existing sheaf-composition functor for CommRingCat→RingCat→AddCommGrpCat to the actual conductor structure-sheaf square. The resulting square of native additive sheaves on P is a pullback, with the two specified structure maps and the actual conductor inclusion and chart maps.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorSheafChecked.open_reconstruction`: Every section on every open is recovered exactly through forward and inverse native ring reconstruction.

- `ConductorSheafChecked.nonreduced_identity`: For the identity of Spec(Z/4), the global section corresponding to2 becomes a nonzero square-zero element in the all-open native fiber product; replacing rings by their reductions fails this test.

- `ConductorSheafChecked.affine_inverse_agreement`: On an affine open, inverse reconstruction of every compatible pair agrees exactly with the preceding affine inverse, retaining both actual section-ring coordinates.

**Acceptance beyond the stated contract**

- The sheaf pullback does not alone settle quotient topology or the geometric/categorical Scheme pushout. Last-map section surjectivity is asserted only in the inherited affine theorem.

### The actual conductor additive sheaf short complex

Target `G.0/conductor-additive-short-complex`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex`.

Construct the native ShortComplex in additive sheaves on P with objects O_P,+, f_*O_Y,+ ⊞ I.ι_*O_I,+, and f_*J.ι_*O_J,+, where I is the actual conductor ideal datum and J=I.comap f. Its first map is the biproduct lift of the actual structure maps; its second map is the biproduct desc of the actual source inclusion and the negative of the actual chart map. The native zero-composite equation uses the actual conductor square.

**Hypotheses.** Finite and schematically dominant f:Y→P; I=conductorIdealSheaf f and J=I.comap f. Opens arbitrary except where explicitly affine. Actual native sheaves, maps and biproduct throughout.

**Inputs.** `G.0/conductor-open-sections-isomorphism`, `mathlib:CategoryTheory.CommSq.shortComplex'`, `mathlib:CategoryTheory.sheafIsAbelian`.

**Source and scope.**

- [Conductor additive sheaf sequence, context in Stacks37.14.1](https://stacks.math.columbia.edu/tag/0ET0), Stacks37.14.1 complete displayed statement and proof; authored additive finite-conductor deduction. Context for the actual structure-sheaf pullback. This short-exact additive sequence is an authored consequence of the preceding general finite-conductor pullback, actual closed-inclusion surjectivity on affine opens, and pinned native abelian/sheaf APIs. No source claim of arbitrary-open section surjectivity is made.

**Proof outline.**

1. Specialize the existing native CommSq.shortComplex′ to the proved additive conductor pullback. All three objects and both arrows are determined by the actual sheaves and maps; do not add an ad hoc complex with assumed exactness.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/conductor-scheme-geometric`: Record the additive kernel and local epimorphism attached to the actual conductor sheaf comparison while the separate quotient-topology and Scheme universal-property arguments remain. `G.1/quadratic-pinch-i1-genus`: Supply the genuine native short exact sheaf sequence for the separately required coherent H0/H1 and genus comparison; the cohomology interfaces remain at their owners.

**API.**

- `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_f_fst` (compatibility): The first map of conductorAdditiveShortComplex followed by the first native biproduct projection is exactly f.c after forgetting multiplication.

- `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_f_snd` (compatibility): The first map followed by the second native biproduct projection is exactly I.ι.c after forgetting multiplication.

- `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_inl_g` (compatibility): The first native biproduct injection followed by the last map equals the actual conductorSheafInclusion after forgetting multiplication.

- `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_inr_g` (compatibility): The second native biproduct injection followed by the last map equals the negative of the actual conductorSheafChart after forgetting multiplication.

- `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_inl_g_app` (compatibility): On every open U⊂P and every b∈Γ(Y,f⁻¹U), applying the actual last sheaf map to the first injected section gives J.ι.app(f⁻¹U)(b).

- `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_inr_g_app` (compatibility): On every open U⊂P and every c∈Γ(I,I.ι⁻¹U), applying the actual last sheaf map to the second injected section gives −conductorChartMap(f,U)(c).

- `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_pair_app` (compatibility): On every open U, the last sheaf map sends inl(b)+inr(c) to the preceding actual conductorSectionDifference(f,U)(b,c). Both rings, restrictions and the subtraction sign are unchanged.

- `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_mono` (compatibility): The first morphism of the actual conductorAdditiveShortComplex is a monomorphism in native additive sheaves on P.

- `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_exact` (compatibility): The actual conductorAdditiveShortComplex is Exact in the native abelian category of additive sheaves on P. The actual structure map is the kernel of the specified signed difference.

- `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_affine_surjective` (compatibility): For every affine open U⊂P, the component on U of the last actual sheaf map is surjective as an additive group homomorphism. A target section lifts along the actual closed inclusion J.ι on the affine inverse image f⁻¹U, and the first native biproduct injection supplies its middle-term lift.

- `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_locally_surjective` (compatibility): The actual last map is locally surjective: for every target section on any open U and each x∈U, choose an affine open V⊆U containing x; the restricted section has an actual middle-term lift on V.

- `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_epi` (compatibility): The last morphism of conductorAdditiveShortComplex is an epimorphism in additive sheaves on P. This is sheaf epimorphy obtained from local lifts, not surjectivity on sections of every nonaffine open.

- `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_shortExact` (compatibility): For every finite schematically dominant f:Y→P, the specified native conductorAdditiveShortComplex is ShortExact: 0→O_P,+→f_*O_Y,+⊞I.ι_*O_I,+→f_*J.ι_*O_J,+→0. No reducedness, Noetherianity, birationality or global affineness is required.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorAdditiveChecked.signed_units`: For every open, the actual last map sends the injected pair (1,0) to 1 and (0,1) to −1 in the actual source-conductor section ring.

- `ConductorAdditiveChecked.empty_open`: On the empty target open the actual last map sends every native middle-term section to zero; the native zero section ring is retained.

- `ConductorAdditiveChecked.actual_section_pair`: For every open and every section a of O_P, the actual last map kills inl(f.app(a))+inr(I.ι.app(a)).

- `ConductorAdditiveChecked.affine_lift`: For every affine open and actual target section, a section of the native sheaf biproduct maps to it under the actual last morphism.

- `ConductorAdditiveChecked.kernel_universal_property`: For any native additive sheaf F on P and any morphism F→the native middle sheaf killed by the actual last map, there is a unique morphism F→O_P,+ whose composite with the actual first map is the given morphism.

- `ConductorAdditiveChecked.nonreduced_identity`: For the identity of Spec(Z/4), the global section corresponding to 2 is nonzero and square-zero, and its image under the actual first additive sheaf map remains nonzero. Reducing the structure ring loses this test.

**Acceptance beyond the stated contract**

- No generic sheaf or short-complex carrier is replanned. Last-map component surjectivity is only asserted on affine opens; all arbitrary opens have local lifts and the inherited middle exactness.

### The conductor additive sheaf sequence is short exact

Target `G.0/conductor-additive-short-exact`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorAdditiveShortComplex_shortExact`.

For every finite schematically dominant f:Y→P, the specified native conductorAdditiveShortComplex is ShortExact: 0→O_P,+→f_*O_Y,+⊞I.ι_*O_I,+→f_*J.ι_*O_J,+→0. No reducedness, Noetherianity, birationality or global affineness is required.

**Hypotheses.** Finite and schematically dominant f:Y→P; I=conductorIdealSheaf f and J=I.comap f. Opens arbitrary except where explicitly affine. Actual native sheaves, maps and biproduct throughout.

**Inputs.** `G.0/conductor-additive-short-complex`, `mathlib:CategoryTheory.ShortComplex.ShortExact.mk'`.

**Source and scope.**

- [Conductor additive sheaf sequence, context in Stacks37.14.1](https://stacks.math.columbia.edu/tag/0ET0), Stacks37.14.1 complete displayed statement and proof; authored additive finite-conductor deduction. Context for the actual structure-sheaf pullback. This short-exact additive sequence is an authored consequence of the preceding general finite-conductor pullback, actual closed-inclusion surjectivity on affine opens, and pinned native abelian/sheaf APIs. No source claim of arbitrary-open section surjectivity is made.

**Proof outline.**

1. Package the independently established native mono, Exact and epi facts using ShortComplex.ShortExact.mk′. This does not prove quotient topology, the Scheme pushout universal property, or coherent cohomology.

**Acceptance beyond the stated contract**

- No generic sheaf or short-complex carrier is replanned. Last-map component surjectivity is only asserted on affine opens; all arbitrary opens have local lifts and the inherited middle exactness.

### Descend continuous maps through the conductor square

Target `G.0/conductor-spectrum-descent`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorSpecDesc`.

For an injective integral ring map φ:A→B, every compatible pair of continuous maps y:Spec B→T and z:Spec(A/I)→T has a specified continuous descent map Spec A→T. The target T is arbitrary and may live in an independent universe.

**Hypotheses.** A and B are arbitrary commutative rings in a common universe; K is the existing range-subring conductor and I=K.comap φ. The first three lemmas require only a ring map. Descent and the pushout require φ injective and integral. No finiteness, Noetherianity, reducedness or nontriviality is imposed. Continuous targets have independent universes and no separation assumptions. Use actual native spectra, quotient rings, continuous maps and TopCat; global scheme gluing remains open.

**Inputs.** `G.0/subring-conductor`, `mathlib:PrimeSpectrum`, `mathlib:range_comap_of_surjective`, `mathlib:PrimeSpectrum.comap_injective_of_surjective`, `mathlib:PrimeSpectrum.comap_comp_apply`, `mathlib:Ideal.quotientMap_comp_mk`, `mathlib:PrimeSpectrum.continuous_comap`, `mathlib:PrimeSpectrum.isClosedMap_comap_of_isIntegral`, `mathlib:RingHom.IsIntegral.comap_surjective`, `mathlib:Topology.IsClosedMap.isQuotientMap`, `mathlib:Topology.IsQuotientMap.lift`.

**Source and scope.**

- [Conductor topology context: Stacks 0B7J](https://stacks.math.columbia.edu/tag/0B7J), Lemma 15.6.2, complete proof and comments; ring hypotheses in Situation 15.6.1. Context for affine pushout topology. The conductor-specific prime-fiber and continuous-descent proofs are authored deductions from the existing conductor and pinned native spectral APIs.

**Proof outline.**

1. The integral spectral map is closed and injectivity gives lying-over surjectivity, hence it is a quotient map. Apply the native continuous quotient lift to y and the proved fiber constancy; retain the actual native ContinuousMap carrier.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/conductor-global-continuous-descent`: Apply the native affine spectral descent on finite inverse-image affine charts to construct global continuous descent.

**API.**

- `TauCeti.GenusOne.FerrandPushout.conductor_comap_le_iff` (compatibility): For any ring map φ:A→B and ideal q⊆B, the contracted conductor I=K.comap φ satisfies I≤q.comap φ if and only if K≤q, where K=φ.range.conductor.

- `TauCeti.GenusOne.FerrandPushout.conductor_prime_eq_of_comap_eq` (compatibility): For any φ and p,q∈Spec B with equal contractions, if K is not contained in p then p=q. No injectivity or integrality assumption is needed.

- `TauCeti.GenusOne.FerrandPushout.conductor_spec_factorsThrough` (compatibility): For any φ and topological space T, let y:Spec B→T and z:Spec(A/I)→T be continuous and agree after the two maps out of Spec(B/K). Then y is constant on every fiber of Spec φ.

- `TauCeti.GenusOne.FerrandPushout.conductorSpecDesc_comap` (compatibility): For every p∈Spec B, conductorSpecDesc evaluated at Spec φ(p) equals y(p).

- `TauCeti.GenusOne.FerrandPushout.conductorSpecDesc_closed` (compatibility): For every q∈Spec(A/I), the descent evaluated at the actual closed inclusion of q equals z(q).

- `TauCeti.GenusOne.FerrandPushout.conductorSpecDesc_unique` (compatibility): Any continuous m:Spec A→T with m∘Spec φ=y equals the specified descent. The source triangle alone suffices; no separation axiom is imposed on T.

- `TauCeti.GenusOne.FerrandPushout.conductorSpecDesc_natural` (compatibility): For any continuous m:T→T′, postcomposing the specified descent equals the specified descent of m∘y and m∘z with the transported compatibility proof.

- `TauCeti.GenusOne.FerrandPushout.conductorSpec_isPushout` (compatibility): For every injective integral φ:A→B, the actual underlying TopCat square Spec(B/K)→Spec B, Spec(B/K)→Spec(A/I), Spec B→Spec A, Spec(A/I)→Spec A is IsPushout. All four arrows are Scheme.forgetToTop applied to the specified native Spec maps.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorTopologyChecked.identity_descent`: The specified continuous descent for id_A equals the given map y for any compatible closed-side map.

- `ConductorTopologyChecked.two_actual_triangles`: The actual descent satisfies the source and closed-side value identities simultaneously for every pair of spectrum points.

- `ConductorTopologyChecked.zero_ring`: Spec(ZMod 1) is empty and the actual identity conductor square still has its native TopCat pushout property.

- `ConductorTopologyChecked.source_triangle_determines_every_target`: Two maps to any topological target that agree after the injective integral spectral map are equal; no separation assumption is added.

- `ConductorTopologyChecked.nonintegral_injection_is_not_surjective_on_points`: Spec Q→Spec Z is not surjective: the prime over 2 has no preimage. Injectivity alone does not give the quotient-map descent used here.

- `ConductorTopologyChecked.topology_does_not_remove_nilpotents`: For ZMod 4, quotienting by the nilradical induces a bijection of spectra, while 2 is nonzero and square-zero. The topological result does not discard ring structure.

**Acceptance beyond the stated contract**

- Keep nilpotents and the zero ring. Do not infer a global Scheme pushout or ringed-space equivalence from the topological universal property.

### Continuous descent through the global conductor

Target `G.0/conductor-global-continuous-descent`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorGlobalDesc`.

Every compatible pair y:Y→T and z:C_f→T has a specified native ContinuousMap P→T for a finite schematically dominant f:Y→P. T may live in an independent universe and has no separation requirement.

**Hypotheses.** Y and P are arbitrary actual schemes in a common universe, f is finite and schematically dominant, I=conductorIdealSheaf f and J=I.comap f. Only the first lemma additionally assumes affine Y and P. Continuous targets may have independent universes, with no separation axioms. Retain nilpotents, empty schemes and the zero ring; use the actual native closed subschemes, conductorMap, ContinuousMap and TopCat.

**Inputs.** `G.0/conductor-spectrum-descent`, `G.0/conductor-induced-map`, `mathlib:AlgebraicGeometry.Scheme.isoSpec_hom_naturality`, `mathlib:AlgebraicGeometry.Scheme.toSpecΓ_preimage_zeroLocus`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.mem_support_iff_of_mem`, `mathlib:CategoryTheory.ConcreteCategory.bijective_of_isIso`, `mathlib:AlgebraicGeometry.exists_isAffineOpen_mem_and_subset`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.support_comap`, `mathlib:AlgebraicGeometry.morphismRestrict_base_coe`, `mathlib:AlgebraicGeometry.IsSchemeTheoreticallyDominant.of_isPullback`, `mathlib:AlgebraicGeometry.isPullback_morphismRestrict`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.range_subschemeι`, `mathlib:AlgebraicGeometry.Scheme.Hom.isClosedMap`, `mathlib:AlgebraicGeometry.surjective_of_isDominant_of_isClosed_range`, `mathlib:Topology.IsClosedMap.isQuotientMap`, `mathlib:Topology.IsQuotientMap.lift`.

**Source and scope.**

- [Global conductor topology context: Stacks37.14.1](https://stacks.math.columbia.edu/tag/0ET0), Lemma37.14.1, complete displayed statement/proof and comments boundary. The topology and structure-sheaf comparison are separate steps in the primary-source proof. This finite schematically dominant global conductor extension and its affine-local fiber argument are authored deductions from the prior actual conductor reconstruction and pinned native APIs.

**Proof outline.**

1. Finiteness gives a closed underlying map; schematic dominance gives dense range, hence surjectivity. Use the native closed-map quotient criterion and continuous quotient lift with the actual proved fiber constancy. No new topology or scheme carrier is introduced.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/conductor-scheme-descent`: Supplies the underlying continuous map; the conductor sheaf pullback and stalk locality supply the descended scheme morphism.

**API.**

- `TauCeti.GenusOne.FerrandPushout.conductor_affine_fiber_eq` (compatibility): For a finite schematically dominant morphism of affine schemes f:Y→P, if x,x′∈Y have f(x)=f(x′) and x lies outside the support of the actual pulled-back conductor ideal J, then x=x′.

- `TauCeti.GenusOne.FerrandPushout.conductor_fiber_eq` (compatibility): For any finite schematically dominant f:Y→P, points x,x′ with equal images are equal if x is outside the support of J=(conductorIdealSheaf f).comap f. Neither scheme is required to be affine.

- `TauCeti.GenusOne.FerrandPushout.conductor_global_factorsThrough` (compatibility): For any topological target T and compatible continuous y:Y→T and z:C_f→T, y is constant on the fibers of f. Compatibility is with the actual inclusion D_f→Y and actual conductorMap f:D_f→C_f.

- `TauCeti.GenusOne.FerrandPushout.conductorGlobalDesc_source` (compatibility): For every p∈Y, conductorGlobalDesc f y z hc(f(p))=y(p).

- `TauCeti.GenusOne.FerrandPushout.conductorGlobalDesc_closed` (compatibility): For every q∈C_f, the global descent at the actual conductor closed inclusion of q equals z(q).

- `TauCeti.GenusOne.FerrandPushout.conductorGlobalDesc_unique` (compatibility): Any continuous m:P→T satisfying m(f(p))=y(p) for every p∈Y equals the specified global descent. The source triangle alone suffices.

- `TauCeti.GenusOne.FerrandPushout.conductorGlobalDesc_natural` (compatibility): For every continuous m:T→T′, m composed with the specified global descent equals the specified descent for m∘y and m∘z and their transported compatibility. T′ also has an independent universe.

- `TauCeti.GenusOne.FerrandPushout.conductor_global_topological` (compatibility): For every finite schematically dominant f:Y→P, Scheme.forgetToTop sends the actual conductor square D_f→Y, D_f→C_f, Y→P and C_f→P to an IsPushout square in TopCat. No affine, Noetherian, reduced, separated, birational or nonempty hypothesis is added.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `GlobalConductorTopologyChecked.identity_descent`: For any scheme P and any compatible closed-side map, descent through id_P is the original continuous map on P, including nonaffine schemes.

- `GlobalConductorTopologyChecked.two_actual_triangles`: For every compatible pair, composition of the actual descent with f and with the actual conductor closed inclusion recovers both continuous maps.

- `GlobalConductorTopologyChecked.cusp_geometric`: The actual globally glued quadratic cusp normalization with a=b=0 over every field gives the existing geometric conductor predicate; its nonreduced conductor is retained.

- `GlobalConductorTopologyChecked.inseparable_geometric`: The actual global quadratic curve with q=t²−s over F₂(s) gives the geometric conductor predicate, without a separability or rational-branch hypothesis.

- `GlobalConductorTopologyChecked.empty_scheme`: The identity of Spec(ZMod1), an empty scheme, has the actual global conductor TopCat pushout.

- `GlobalConductorTopologyChecked.nonreduced_identity`: The identity of Spec(ZMod4) has the global topological conductor pushout while2 remains nonzero and square-zero in its ring.

- `GlobalConductorTopologyChecked.arbitrary_target_unique`: Two continuous maps to an arbitrary topological target that agree after f are equal; no target separation axiom is required.

- `GlobalConductorTopologyChecked.identity_conductor_empty`: For every scheme P, the actual identity conductor subscheme is empty and its square satisfies the existing geometric predicate.

**Acceptance beyond the stated contract**

- Do not infer the categorical Scheme universal property, flat recomputation of conductors or algebraic-space existence from the topological universal property.

### The actual descended scheme morphism

Target `G.0/conductor-scheme-descent`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorSchemeDesc`.

Construct the scheme morphism P→T whose underlying ringed-space morphism is conductorDescRingedSpace and whose locality witness is the proved local-stalk theorem.

**Hypotheses.** Y,P,T are actual schemes in a common universe; f:Y→P is finite and schematically dominant. I=conductorIdealSheaf f, J=I.comap f, C_f=I.subscheme, D_f=J.subscheme, i=J.subschemeι and g=conductorMap f. The supplied y:Y→T and z:C_f→T satisfy i≫y=g≫z as scheme morphisms, not merely as point maps. Every open is allowed. No affine, Noetherian, reduced, separated, birational, nonempty or separability assumption is added.

**Inputs.** `G.0/conductor-global-continuous-descent`, `mathlib:TopCat.ofHom`, `G.0/conductor-induced-map`, `mathlib:AlgebraicGeometry.Scheme.Hom.appLE_comp_appLE`, `mathlib:AlgebraicGeometry.Scheme.Hom.app_eq_appLE`, `G.0/conductor-sheaf-comparison`, `mathlib:CategoryTheory.IsPullback.lift`, `mathlib:CategoryTheory.IsPullback.lift_fst`, `mathlib:CategoryTheory.IsPullback.lift_snd`, `mathlib:CategoryTheory.IsPullback.hom_ext`, `mathlib:AlgebraicGeometry.Scheme.Hom.naturality`, `mathlib:AlgebraicGeometry.Scheme.Hom.appLE_map`, `mathlib:AlgebraicGeometry.Scheme.Hom.map_appLE`, `mathlib:AlgebraicGeometry.PresheafedSpace.Hom`, `mathlib:AlgebraicGeometry.PresheafedSpace.ext`, `mathlib:TopCat.Presheaf.ext`, `mathlib:AlgebraicGeometry.Scheme.Hom.appLE_eq_app`, `mathlib:AlgebraicGeometry.Scheme.Hom.isClosedMap`, `mathlib:AlgebraicGeometry.surjective_of_isDominant_of_isClosed_range`, `mathlib:AlgebraicGeometry.PresheafedSpace.stalkMap.comp`, `mathlib:AlgebraicGeometry.PresheafedSpace.stalkMap.congr_hom`, `mathlib:isLocalHom_of_comp`, `mathlib:AlgebraicGeometry.LocallyRingedSpace.Hom`, `mathlib:AlgebraicGeometry.Scheme.Hom`.

**Source and scope.**

- [Affine pushout universal property and locality](https://stacks.math.columbia.edu/tag/0ET0), Lemma37.14.1, complete displayed statement/proof and zero-page-comment boundary. The affine proof constructs the sheaf map and checks locality using a point lift. The global finite schematically dominant conductor extension is an authored deduction from the earlier actual topology and all-open conductor pullback, with native restriction and stalk APIs.

**Proof outline.**

1. Use the native locally ringed-space and scheme morphism constructors on the already existing schemes. Scheme existence is not an assumption or a new carrier.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/conductor-scheme-pushout`: Supply the actual section, ringed-space or scheme map needed for the existing categorical conductor universal property.

**API.**

- `TauCeti.GenusOne.FerrandPushout.conductorDescBase_source` (compatibility): The composite of the underlying map of f with d equals the underlying map of y.

- `TauCeti.GenusOne.FerrandPushout.conductorDescBase_closed` (compatibility): The composite of the actual inclusion C_f→P with d equals the underlying map of z.

- `TauCeti.GenusOne.FerrandPushout.conductorDescBase_preimage_source` (compatibility): For every open U of T, f⁻¹(d⁻¹U)=y⁻¹U as actual opens of Y.

- `TauCeti.GenusOne.FerrandPushout.conductorDescBase_preimage_closed` (compatibility): For every open U of T, the inverse image of d⁻¹U under C_f→P equals z⁻¹U as actual opens of C_f.

- `TauCeti.GenusOne.FerrandPushout.conductorDescBase` (constructor): Given compatible scheme morphisms y:Y→T and z:C_f→T, define the native TopCat morphism d:P→T by the existing continuous conductor descent applied to their actual underlying maps.

- `TauCeti.GenusOne.FerrandPushout.conductorDescApp_compatible` (compatibility): For every target open U, restrict the actual y and z section maps using the two descent-preimage equalities. Their composites to Γ(D_f,i⁻¹f⁻¹d⁻¹U) agree through i.app and the existing conductorChartMap.

- `TauCeti.GenusOne.FerrandPushout.conductorDescApp_source` (compatibility): Composing the descended section map with f.app on d⁻¹U gives y.appLE on the exact source inverse image.

- `TauCeti.GenusOne.FerrandPushout.conductorDescApp_closed` (compatibility): Composing the descended section map with the actual C_f→P section map gives z.appLE on the exact closed inverse image.

- `TauCeti.GenusOne.FerrandPushout.conductorDescApp_unique` (compatibility): Any ring morphism Γ(T,U)→Γ(P,d⁻¹U) with both specified section projections equals the descended section map.

- `TauCeti.GenusOne.FerrandPushout.conductorDescApp_naturality` (compatibility): For every restriction U→V in the opposite opens of T, restriction followed by the V section map equals the U section map followed by restriction on the actual inverse-image opens of P.

- `TauCeti.GenusOne.FerrandPushout.conductorDescApp` (constructor): For each open U of T, construct the native commutative-ring morphism Γ(T,U)→Γ(P,d⁻¹U) by the actual every-open conductor pullback and the two compatible restricted section maps.

- `TauCeti.GenusOne.FerrandPushout.conductorDescPresheaf` (constructor): Assemble the descended section maps into a native natural transformation O_T→d_*O_P on all opens of T. Its components are exactly conductorDescApp and its naturality is the proved restriction identity.

- `TauCeti.GenusOne.FerrandPushout.conductorDescRingedSpace_source` (compatibility): Composing the underlying PresheafedSpace morphism of f with the descended ringed-space map equals the underlying morphism of y, including the entire sheaf map.

- `TauCeti.GenusOne.FerrandPushout.conductorDescRingedSpace_closed` (compatibility): Composing the underlying actual C_f→P morphism with the descended ringed-space map equals the underlying morphism of z, including the entire sheaf map.

- `TauCeti.GenusOne.FerrandPushout.conductorDescRingedSpace_isLocalHom` (compatibility): At every point p of P, the descended map O_T,d(p)→O_P,p is a local ring homomorphism.

- `TauCeti.GenusOne.FerrandPushout.conductorDescRingedSpace` (constructor): Construct a native PresheafedSpace morphism from the underlying ringed space of P to that of T, with base d and presheaf map conductorDescPresheaf. Both prescribed presheaves are the actual structure sheaves; locality is proved separately.

- `TauCeti.GenusOne.FerrandPushout.conductorSchemeDesc_source` (compatibility): The composite f≫conductorSchemeDesc equals y as an actual scheme morphism.

- `TauCeti.GenusOne.FerrandPushout.conductorSchemeDesc_closed` (compatibility): The actual conductor inclusion C_f→P followed by conductorSchemeDesc equals z as a scheme morphism.

- `TauCeti.GenusOne.FerrandPushout.conductorSchemeDesc_unique` (compatibility): Any scheme morphism m:P→T with f≫m=y and (C_f→P)≫m=z equals conductorSchemeDesc. T is an arbitrary scheme, including nonaffine and nonseparated targets.

- `TauCeti.GenusOne.FerrandPushout.conductorSchemeDesc_natural` (compatibility): For every scheme morphism m:T→T′, conductorSchemeDesc followed by m equals the descent of y≫m and z≫m with their transported compatibility.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorSchemeDescentChecked.base_triangles`: Both actual TopCat triangles hold simultaneously for a compatible pair of scheme morphisms.

- `ConductorSchemeDescentChecked.preimages`: Both source and closed preimages of the intersection of two arbitrary target opens agree with the actual y and z inverse images.

- `ConductorSchemeDescentChecked.identity_arbitrary_target`: For f=id_P and any compatible maps into any scheme T, descent equals y, with no affine restriction on P or T.

- `ConductorSchemeDescentChecked.empty_sections`: The actual descended section map on the empty target open sends every section to zero, using the zero ring on the empty inverse image.

- `ConductorSchemeDescentChecked.restriction`: An arbitrary target-open inclusion commutes with the descended section map and the actual inverse-image restriction.

- `ConductorSchemeDescentChecked.presheaf_triangles`: The components of the actual descended natural transformation satisfy both section triangles on every target open.

- `ConductorSchemeDescentChecked.presheaf_empty`: The actual natural-transformation component on the empty open has its value in the zero ring.

- `ConductorSchemeDescentChecked.presheaf_two_restrictions`: Two successive arbitrary target-open restrictions agree with the single actual inverse-image restriction through the descended natural transformation.

- `ConductorSchemeDescentChecked.ringed_triangles`: Both triangles hold as full native PresheafedSpace morphisms, including their sheaf components and dependent base transports.

- `ConductorSchemeDescentChecked.local_stalks`: At every point of the actual target P the descended ringed-space stalk homomorphism is local.

- `ConductorSchemeDescentChecked.cusp_scheme_pushout`: The actual globally glued quadratic cusp normalization with a=b=0 over every field has its categorical conductor pushout in Scheme.

- `ConductorSchemeDescentChecked.scheme_reconstruction`: Descending the actual f and actual conductor inclusion into P reconstructs the identity scheme morphism of P.

- `ConductorSchemeDescentChecked.empty_scheme`: The identity on Spec(ZMod1), an empty scheme, gives the actual categorical conductor pushout in Scheme.

- `ConductorSchemeDescentChecked.nonreduced_scheme`: The identity on Spec(ZMod4) gives the actual categorical conductor pushout while2 remains nonzero and square-zero in the ring.

- `ConductorSchemeDescentChecked.inseparable_scheme_pushout`: The actual global quadratic normalization for q=t²−s over F₂(s) has its categorical conductor pushout, without separability or rational-branch hypotheses.

**Acceptance beyond the stated contract**

- Use actual all-open structure-sheaf maps and native scheme morphisms; retain nilpotents and the empty scheme.

### Scalar extension of the conductor cokernel

Target `G.0/conductor-cokernel-base-change`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorCokernelBaseChange`.

Construct the actual F-linear equivalence F⊗_A(B/span_A{1}) ≃ (F⊗_A B)/span_F{1} by the existing tensorQuotientEquiv followed by quotient transport through conductorUnitSpan_baseChange. Both carriers are native module quotients.

**Hypotheses.** A,B,F,D,E are commutative rings in independent universes, including zero and nonreduced rings. B,F,D,E carry the indicated A-algebra structures; no finite, flat, faithful, injective, Noetherian or reduced hypothesis is imposed unless stated. Tensor orientation is F⊗_A B, with its native left F-algebra/module structure. This checkpoint does not identify the inherited right-oriented B⊗_A F conductor map or global ideal-sheaf pullbacks.

**Inputs.** `mathlib:Submodule.baseChange_span`, `mathlib:Algebra.TensorProduct.one_def`, `mathlib:TensorProduct.AlgebraTensorModule.tensorQuotientEquiv`, `mathlib:Submodule.quotEquivOfEq`.

**Source and scope.**

- [Tensor right exactness](https://stacks.math.columbia.edu/tag/00DF), Complete Lemma10.12.10 displayed statement/proof; conductor specialization is authored. Right exactness permits comparison without flatness. The unit-image identity and actual algebra-map naturality are conductor-specific deductions using the pinned native tensor quotient APIs.

**Proof outline.**

1. Compose the existing F-linear tensor quotient equivalence with the native quotient equivalence for equal submodules. This is the conductor specialization, not a new generic tensor quotient construction.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/conductor-finite-flat-base-change`: Identify the actual conductor quotient and its natural maps before applying the existing SF.0 generic flat-annihilator export. The right-oriented and global conductor targets remain open.

**API.**

- `TauCeti.GenusOne.FerrandPushout.conductorUnitSpan_baseChange` (compatibility): For any commutative A-algebra B and A-algebra F, (span_A{1_B}).baseChange F equals span_F{1_(F⊗_A B)} as actual F-submodules. No flatness, injectivity or finiteness is required.

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelBaseChange_tmul` (compatibility): The conductor cokernel comparison sends s⊗[b] to [s⊗b] for all s∈F and b∈B.

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelBaseChange_symm_tmul` (compatibility): The inverse comparison sends [s⊗b] to s⊗[b].

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelBaseChange_scalar_zero` (compatibility): The comparison sends s⊗[algebraMap A B(a)] to zero for every s∈F and a∈A.

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelBaseChange_annihilator` (compatibility): Ann_F(F⊗_A(B/span_A{1})) equals the inverse image under algebraMap F (F⊗_A B) of the actual conductor of its image subring. This unconditional equality identifies the recomputed conductor; it does not assert equality with the extension of Ann_A(B/span_A{1}).

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelBaseChange_natural` (compatibility): For every h:B→D and x∈F⊗_A(B/span_A{1}), compare then apply the cokernel map of the actual tensor algebra map id_F⊗h equals extend conductorCokernelMap(h) then compare. The equality is on all tensors, with F-linearity retained.

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelBaseChange_natural_map` (compatibility): The naturality equality is an equality of actual F-linear maps: E_D ∘ (id_F⊗conductorCokernelMap(h)) = conductorCokernelMap(id_F⊗h) ∘ E_B.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorCokernelChecked.pure_tensor_sum`: The comparison sends s⊗[b]+t⊗[c] to the class of s⊗b+t⊗c in the actual quotient.

- `ConductorCokernelChecked.inverse_tensor`: Its inverse sends the actual class of s⊗b to s⊗[b].

- `ConductorCokernelChecked.scalar_image_zero`: The actual algebra image class s⊗[algebraMap(a)] maps to zero for all scalars.

- `ConductorCokernelChecked.nonreduced_diagonal_class`: The class of (2,0) is nonzero in (Z/4×Z/4)/span_(Z/4){(1,1)}; nilpotent elements are retained.

- `ConductorCokernelChecked.nonflat_quotient_tensor`: Under the actual quotient algebra Z/4→Z/2, the comparison sends 1⊗[(2,0)] to zero. Together with the preceding nonzero source class this records a class killed by nonflat scalar extension, while the quotient comparison itself still exists.

- `ConductorCokernelChecked.natural_projection`: For the actual algebra projection B×D→B, the F-linear comparison square commutes on every extended quotient element.

**Acceptance beyond the stated contract**

- Use the actual unit-image submodules, tensor-algebra maps and native module quotients, retaining nilpotents.

### The conductor cokernel map of an algebra morphism

Target `G.0/conductor-cokernel-algebra-map`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorCokernelMap`.

For an actual A-algebra morphism h:B→D, construct the A-linear map B/span_A{1}→D/span_A{1} by native mapQ and the fact that h preserves the unit. No injectivity or surjectivity is assumed.

**Hypotheses.** A,B,F,D,E are commutative rings in independent universes, including zero and nonreduced rings. B,F,D,E carry the indicated A-algebra structures; no finite, flat, faithful, injective, Noetherian or reduced hypothesis is imposed unless stated. Tensor orientation is F⊗_A B, with its native left F-algebra/module structure. This checkpoint does not identify the inherited right-oriented B⊗_A F conductor map or global ideal-sheaf pullbacks.

**Inputs.** `mathlib:Submodule.mapQ`.

**Source and scope.**

- [Tensor right exactness](https://stacks.math.columbia.edu/tag/00DF), Complete Lemma10.12.10 displayed statement/proof; conductor specialization is authored. Right exactness permits comparison without flatness. The unit-image identity and actual algebra-map naturality are conductor-specific deductions using the pinned native tensor quotient APIs.

**Proof outline.**

1. Use the native quotient map after proving that the actual algebra homomorphism carries the unit span into the target unit span. No new quotient carrier is introduced.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/conductor-finite-flat-base-change`: Identify the actual conductor quotient and its natural maps before applying the existing SF.0 generic flat-annihilator export. The right-oriented and global conductor targets remain open.

**API.**

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelMap_mk` (compatibility): The actual cokernel map of h sends [b] to [h(b)].

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelMap_id` (compatibility): For the identity A-algebra morphism on B, conductorCokernelMap equals the native identity linear map on B/span_A{1}.

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelMap_comp` (compatibility): For h:B→D and g:D→E, the conductor cokernel map of g∘h equals conductorCokernelMap(g) composed with conductorCokernelMap(h), as actual A-linear maps.

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelMap_surjective` (compatibility): If an actual A-algebra morphism h:B→D is surjective, its conductor cokernel map is surjective. No claim is made for injective h.

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelBaseChange_natural` (compatibility): For every h:B→D and x∈F⊗_A(B/span_A{1}), compare then apply the cokernel map of the actual tensor algebra map id_F⊗h equals extend conductorCokernelMap(h) then compare. The equality is on all tensors, with F-linearity retained.

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelBaseChange_natural_map` (compatibility): The naturality equality is an equality of actual F-linear maps: E_D ∘ (id_F⊗conductorCokernelMap(h)) = conductorCokernelMap(id_F⊗h) ∘ E_B.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorCokernelChecked.map_representative`: For an actual algebra morphism h, the cokernel map sends [b+c] to [h(b)+h(c)].

- `ConductorCokernelChecked.map_identity`: The cokernel map of the actual identity algebra morphism fixes every actual quotient class.

- `ConductorCokernelChecked.map_composition`: The cokernel map of g∘h equals the composite of the two actual cokernel maps on every quotient class.

- `ConductorCokernelChecked.natural_projection`: For the actual algebra projection B×D→B, the F-linear comparison square commutes on every extended quotient element.

**Acceptance beyond the stated contract**

- Use the actual unit-image submodules, tensor-algebra maps and native module quotients, retaining nilpotents.

### The right-oriented conductor cokernel comparison

Target `G.0/conductor-cokernel-right-base-change`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorCokernelRightBaseChange`.

Construct F⊗_A(B/span_A{1}) ≃_F (B⊗_A F)/span_F{1}, with the actual right F-module structure on the target, by composing the existing left-oriented comparison with conductorUnitQuotientSwap. No flatness or finite-module hypothesis is needed.

**Hypotheses.** A,B,F are commutative rings in a common universe; zero rings and nonreduced rings are allowed. B and F carry the indicated A-algebra structures. The source F⊗_A B uses its native left F-action; B⊗_A F and its unit quotient use native Algebra.TensorProduct.rightAlgebra. No Noetherian, reduced, faithful-flat or finite-presentation condition is assumed. F-flatness and B-finiteness occur only where explicitly stated.

**Inputs.** `mathlib:Submodule.map_span`, `mathlib:Algebra.TensorProduct.commRight`, `mathlib:Submodule.Quotient.equiv`, `mathlib:Algebra.TensorProduct.commRight_tmul`, `mathlib:Submodule.Quotient.equiv_apply`, `mathlib:LinearEquiv.annihilator_eq`, `G.0/conductor-cokernel-base-change`.

**Source and scope.**

- [Flat base change of finite-module annihilators](https://stacks.math.columbia.edu/tag/07T8), Complete displayed Lemma10.40.4 statement/proof; conductor specialization is authored. The finite-module flat annihilator statement supplies context. Its generic export is consumed from SF.0; the exact right-oriented unit-image quotient and conductor identifications are authored specializations using pinned native tensor commutativity.

- [Fibre products of schemes and inverse-image ideals](https://stacks.math.columbia.edu/tag/01JO), Section26.17, Lemmas26.17.2–4 and26.17.6(1); conductor deduction also uses07T8. Native affine fibre-product and ideal-pullback descriptions support this authored conductor specialization. The finite flat annihilator theorem is consumed from SF.0 through the already planned conductor ring formula.

**Proof outline.**

1. Compose the already planned conductor-specific left comparison with native unit-quotient swap. No generic quotient-basechange object is duplicated.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/conductor-finite-flat-base-change`: Realize the exact existing right-oriented conductor theorem by transporting the actual unit-image quotient, then consuming the SF.0 finite-module flat-annihilator export.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: Four commutative rings in a common universe; the specified square is a categorical pushout, its original map is finite and its base-change map is flat. The original map need not be injective.

- **H2**: Schemes and section rings lie in a common universe. Zero rings and nonreduced rings are allowed. Only the finite, schematically dominant and flat hypotheses explicitly stated are assumed. No Noetherian, reduced, separated, faithful-flat, birational or quasi-compactness hypothesis on the base-change target is added.

- `TauCeti.GenusOne.FerrandPushout.conductorUnitSpan_swap` (compatibility): The native F-algebra equivalence commRight from F⊗_A B to B⊗_A F maps the actual F-unit span onto the actual F-unit span; the target uses the native right F-action.

- `TauCeti.GenusOne.FerrandPushout.conductorUnitQuotientSwap_mk` (compatibility): The quotient swap sends [s⊗b] to [b⊗s] for s∈F and b∈B.

- `TauCeti.GenusOne.FerrandPushout.conductorUnitQuotientSwap_symm_mk` (compatibility): The inverse quotient swap sends [b⊗s] to [s⊗b].

- `TauCeti.GenusOne.FerrandPushout.conductorUnitQuotientSwap_annihilator` (compatibility): The full F-annihilator of (F⊗_A B)/span_F{1} equals that of (B⊗_A F)/span_F{1}, with the latter carrying the native right F-action.

- `TauCeti.GenusOne.FerrandPushout.conductorUnitQuotientSwap` (constructor): Construct the actual F-linear equivalence (F⊗_A B)/span_F{1} ≃ (B⊗_A F)/span_F{1} induced by native commRight. Both carriers are the native module quotients.

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelRightBaseChange_tmul` (compatibility): The right-oriented conductor comparison sends s⊗[b] to [b⊗s].

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelRightBaseChange_symm_tmul` (compatibility): The inverse right-oriented comparison sends [b⊗s] to s⊗[b].

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelRightBaseChange_scalar_zero` (compatibility): The right-oriented comparison sends s⊗[algebraMap A B(a)] to zero for every s∈F and a∈A.

- `TauCeti.GenusOne.FerrandPushout.conductorCokernelRightBaseChange_annihilator` (compatibility): Ann_F(F⊗_A(B/span_A{1})) equals the inverse image under the actual includeRight ring map F→B⊗_A F of the conductor of that map’s image subring. This is an equality of full ideals.

- `TauCeti.GenusOne.FerrandPushout.conductorRightMap_injective` (compatibility): If A→B is injective and F is flat as an A-module, then the actual includeRight ring map F→B⊗_A F is injective. No finiteness hypothesis is needed.

- `TauCeti.GenusOne.FerrandPushout.conductorRightAnnihilator_flat` (compatibility): If B is finite as an A-module and F is flat as an A-module, then the extension to F of Ann_A(B/span_A{1}) equals the actual recomputed conductor inverse image for includeRight:F→B⊗_A F. This full-ideal equality does not need A→B injective.

- `TauCeti.GenusOne.FerrandPushout.conductor_comap_pushout` (compatibility; assumptions H1): For an actual CommRingCat pushout A→B, A→F, B→D, F→D, if A→B is finite and A→F is flat, extending the full inverse-image conductor ideal of A→B to F gives the full inverse-image conductor ideal of F→D. Injectivity of A→B is not needed for this ideal equality.

- `TauCeti.GenusOne.FerrandPushout.conductorIdealSheaf_comap_chart` (compatibility; assumptions H2): For finite schematically dominant f:Y→P, any q:T→P, affine U⊂P and affine V⊂T with V⊂q⁻¹U, the V-ideal of (conductorIdealSheaf f).comap q equals the extension of the U-conductor ideal along the actual q.appLE U V. Neither q-affineness nor q-flatness is required.

- `TauCeti.GenusOne.FerrandPushout.conductor_flat_chart` (compatibility; assumptions H2): For finite schematically dominant f:Y→P and flat q:T→P, on every affine V⊂q⁻¹U with U affine, the recomputed conductor of pullback.snd f q on V equals the extension of the original U-conductor along q.appLE U V. All ideals are full ideals.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceIdeal_flat` (compatibility; assumptions H2): For finite schematically dominant f:Y→P and flat q:T→P, the source conductor ideal of the base-changed map equals the pullback along pullback.fst f q of the original source ideal (conductorIdealSheaf f).comap f.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorRightChecked.swap_sum`: The quotient swap sends [s⊗b+t⊗c] to [b⊗s+c⊗t].

- `ConductorRightChecked.swap_inverse_sum`: The inverse quotient swap sends [b⊗s+c⊗t] to [s⊗b+t⊗c].

- `ConductorRightChecked.swap_scalar_action`: The quotient swap sends a•[s⊗b] to a•[b⊗s] using the actual right F-action on the target.

- `ConductorRightChecked.right_sum`: The right comparison sends s⊗[b]+t⊗[c] to [b⊗s+c⊗t].

- `ConductorRightChecked.right_inverse`: The inverse right comparison sends [b⊗s] to s⊗[b].

- `ConductorRightChecked.right_scalar_zero`: The right comparison sends s⊗[algebraMap(a)] to zero.

- `ConductorRightChecked.nonreduced_quotient_class`: The class of (2,0) is nonzero in (Z/4×Z/4)/span_(Z/4){(1,1)}.

- `ConductorRightChecked.nonflat_right_tensor`: For the actual quotient algebra Z/4→Z/2 the right comparison sends 1⊗[(2,0)] to zero, despite the preceding nonzero original quotient class.

- `ConductorRightChecked.flat_nonreduced_diagonal`: For the finite injective diagonal Z/4→Z/4×Z/4 and the flat identity extension F=Z/4, the exact existing conductor_flat_baseChange conjunction holds with the actual includeRight map and full conductor ideals.

- `ConductorRightChecked.nilpotent_right_map`: For that actual finite diagonal algebra and flat identity extension, includeRight sends the nonzero nilpotent 2∈Z/4 to a nonzero element of (Z/4×Z/4)⊗_(Z/4)Z/4.

- `ConductorRightChecked.zero_ring`: The actual right inclusion Z/1→Z/1⊗_(Z/1)Z/1 is injective.

**Acceptance beyond the stated contract**

- Keep the actual right-oriented ring map and full ideals, including nilpotents.

### The actual target conductor subscheme base-change isomorphism

Target `G.0/conductor-target-base-change-iso`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorTargetBaseChangeIso`.

For finite schematically dominant f:Y to P and flat q:T to P, construct an actual scheme isomorphism from the recomputed target conductor closed subscheme of pullback.snd f q to the native pullback of q and the original target conductor inclusion.

**Hypotheses.** Schemes lie in a common universe. The original morphism f is finite and schematically dominant; q is an arbitrary flat morphism. Native instances supply finiteness and schematic dominance of its actual base change. No affine, Noetherian, reduced, separated, birational, faithful-flat or quasi-compactness hypothesis on T is assumed. The full conductor ideals are retained; no radical replacement is used. Generic ideal-sheaf pullbacks, equality transport, scheme pullbacks and isomorphism carriers are imported. These are conductor-specific comparisons; iterated carrier/isomorphism coherence and generic Ferrand existence remain separate open obligations.

**Inputs.** `G.0/conductor-scheme-flat-comparison`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap_comp`, `G.0/conductor-ideal-sheaf`, `mathlib:CategoryTheory.eqToIso`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comapIso`.

**Source and scope.**

- [Fibre products of schemes and inverse-image ideals](https://stacks.math.columbia.edu/tag/01JO), Section26.17, Lemmas26.17.2–4 and26.17.6(1); conductor deduction also uses07T8. Native affine fibre-product and ideal-pullback descriptions support this authored conductor specialization. The finite flat annihilator theorem is consumed from SF.0 through the already planned conductor ring formula.

- [Closed-subscheme fibre products and authored conductor comparisons](https://stacks.math.columbia.edu/tag/01JO), Stacks Section26.17, Definition26.17.1 and Lemma26.17.6(1), current displayed statements/proof; authored conductor specialization. The source supplies the actual fibre-product universal property and full inverse-image ideal construction for closed subschemes. The precise conductor comparisons and map squares are authored deductions from the authenticated prior full-ideal flat comparisons and pinned native comapIso/pullback APIs.

- [Conductor pushouts and authored actual nilpotent-section tests](https://stacks.math.columbia.edu/tag/0ET0), Lemma37.14.1, full displayed statement and proof; authored conductor-specific deduction using native quotient-section comparison. The source motivates full ideal and structure-sheaf data in conductor pushouts. The diagonal calculation and actual nilpotent-section formulas are authored deductions from the retained conductor contracts and native APIs, not claims quoted from the source.

**Proof outline.**

1. Transport the actual closed-subscheme carrier along the proved equality of full conductor ideal-sheaf data, then compose with native comapIso. Use the actual recomputed ideal, including its nilpotents.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/conductor-scheme-flat-comparison`: Identify actual recomputed quotient subschemes and morphisms with the original conductor square after flat base change. `key/ferrand-pushouts`: Supply the actual conductor square comparison needed when transporting geometric conductor pushouts along flat morphisms, preserving full ideals and nilpotents.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: Schemes and section rings lie in a common universe. Zero rings and nonreduced rings are allowed. Only the finite, schematically dominant and flat hypotheses explicitly stated are assumed. No Noetherian, reduced, separated, faithful-flat, birational or quasi-compactness hypothesis on the base-change target is added.

- **H2**: All schemes in a statement share an arbitrary universe. Rings are arbitrary commutative rings, including zero rings; no reducedness, Noetherianity or birationality is imposed. Finiteness, schematic dominance, flatness and affineness are required exactly where stated. The actual full conductor ideals and native closed-subscheme carriers are used. Generic quotient, section and pullback theories remain imported.

- `TauCeti.GenusOne.FerrandPushout.conductorIdealSheaf_flat_tower` (compatibility; assumptions H1): For finite schematically dominant f:Y→P and flat q:T→P and r:Z→T, the conductor of the iterated pullback map to Z equals the pullback of the original conductor along r≫q.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetBaseChangeIso_hom_fst` (compatibility): The forward target conductor comparison followed by the native first pullback projection equals the recomputed conductor closed inclusion into T.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetBaseChangeIso_hom_snd_inclusion` (compatibility): The forward target comparison followed by the native second projection and the old conductor inclusion equals the recomputed conductor inclusion followed by q.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetBaseChangeIso_inv_inclusion` (compatibility): The inverse target comparison followed by the recomputed conductor inclusion equals the native first projection of the old conductor pullback.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetBaseChangeIso_isPullback` (compatibility): The recomputed target inclusion, the forward comparison followed by the second projection, q and the original target inclusion form a native IsPullback square with those exact morphisms.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetBaseChangeIso_nonzero` (compatibility; assumptions H2): Let f:Y→P be finite and schematically dominant and q:T→P flat. Every nonzero global section z of the actual recomputed target conductor subscheme remains nonzero under the section map induced by the inverse of the actual conductorTargetBaseChangeIso(f,q).

- `TauCeti.GenusOne.FerrandPushout.conductorTargetBaseChangeIso_nilpotent_section` (compatibility; assumptions H2): Let f:Y→P be finite and schematically dominant, q:T→P flat and T affine. If a in Γ(T,top) lies outside the top ideal of I_f.comap q and a^n=0, there is a nonzero section z of the actual recomputed conductor subscheme with z^n=0 whose image under the inverse target-comparison section map is nonzero.

- `TauCeti.GenusOne.FerrandPushout.conductor_diagonal_nilpotent_section` (compatibility; assumptions H2): For every commutative ring R, n in the natural numbers and a≠0 in R with a^n=0, the diagonal Spec(R×R)→Spec(R), after identity base change, has an actual target conductor global section z≠0 with z^n=0, and the actual inverse target-comparison section map keeps z nonzero. Finiteness and schematic dominance are supplied by the preceding lemmas.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorSubschemeChecked.target_projection_roundtrip`: For arbitrary finite schematically dominant f and flat q, the actual target isomorphism has its native inverse roundtrip, preserves the recomputed closed inclusion and supplies the exact native cartesian target square.

- `ConductorSubschemeChecked.actual_conductor_map`: The actual recomputed conductorMap and the two actual comparison isomorphisms satisfy the square with native pullback.map on the original conductor morphism and the actual source/target projections.

- `ConductorSubschemeChecked.identity_morphism_empty`: For any flat base change of an identity scheme morphism, both actual recomputed conductor closed subschemes are empty.

- `ConductorSubschemeChecked.identity_base`: For identity base change of arbitrary f, the actual target comparison preserves the original target inclusion after its second projection and the inverse source comparison preserves the actual source inclusion.

- `ConductorSubschemeChecked.open_restriction`: For restriction to any open of P, both actual recomputed conductor inclusion squares are native pullbacks. No affineness of the open is assumed.

- `ConductorSubschemeChecked.zero_ring`: Over Spec(Z/1), the actual target inverse inclusion equation and source comparison roundtrip hold without assuming any scheme point exists.

- `ConductorSubschemeChecked.nonreduced_conductor_section`: For the actual finite schematically dominant diagonal Spec(Z/4 times Z/4) to Spec(Z/4), after identity base change the actual recomputed target conductor closed subscheme has a nonzero square-zero global section. Its actual section map induced by the inverse target comparison remains nonzero. A radical replacement fails this test.

- `ConductorNilpotentChecked.comparison_retains_nilpotence`: For every actual target conductor comparison along a flat map, its inverse section map preserves both nonzeroness and the vanishing nth power of a global conductor section.

- `ConductorNilpotentChecked.cubic_nilpotent`: For the actual diagonal over Z/8, derive its morphism hypotheses and use the nonzero element2 with cube zero to obtain a nonzero actual recomputed conductor section with cube zero and nonzero inverse-comparison image.

**Acceptance beyond the stated contract**

- Use actual recomputed conductor closed subschemes and their actual inclusion/projection morphisms; preserve nilpotent sections and the empty zero-ring case.

### The actual source conductor subscheme base-change isomorphism

Target `G.0/conductor-source-base-change-iso`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorSourceBaseChangeIso`.

Construct an actual scheme isomorphism from the recomputed source conductor closed subscheme of pullback.snd f q to the native pullback of pullback.fst f q and the old source conductor inclusion into Y.

**Hypotheses.** Schemes lie in a common universe. The original morphism f is finite and schematically dominant; q is an arbitrary flat morphism. Native instances supply finiteness and schematic dominance of its actual base change. No affine, Noetherian, reduced, separated, birational, faithful-flat or quasi-compactness hypothesis on T is assumed. The full conductor ideals are retained; no radical replacement is used. Generic ideal-sheaf pullbacks, equality transport, scheme pullbacks and isomorphism carriers are imported. These are conductor-specific comparisons; iterated carrier/isomorphism coherence and generic Ferrand existence remain separate open obligations.

**Inputs.** `G.0/conductor-cokernel-right-base-change`, `G.0/conductor-ideal-sheaf`, `mathlib:CategoryTheory.eqToIso`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comapIso`.

**Source and scope.**

- [Closed-subscheme fibre products and authored conductor comparisons](https://stacks.math.columbia.edu/tag/01JO), Stacks Section26.17, Definition26.17.1 and Lemma26.17.6(1), current displayed statements/proof; authored conductor specialization. The source supplies the actual fibre-product universal property and full inverse-image ideal construction for closed subschemes. The precise conductor comparisons and map squares are authored deductions from the authenticated prior full-ideal flat comparisons and pinned native comapIso/pullback APIs.

- [Closed-subscheme fibre products and authored conductor comparisons](https://stacks.math.columbia.edu/tag/01JO), Authored promotion of the existing conductorMap square API; native comapIso_hom_fst/pullback.condition, with Stacks Section26.17 as context. This promotes an already planned conductor-specific compatibility API to a declaration-sized dependency node. It does not claim a new theorem in the source.

**Proof outline.**

1. Transport the actual source closed-subscheme carrier along the existing full source ideal equality, then compose with native comapIso along pullback.fst f q.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.0/conductor-scheme-flat-comparison`: Identify actual recomputed quotient subschemes and morphisms with the original conductor square after flat base change. `key/ferrand-pushouts`: Supply the actual conductor square comparison needed when transporting geometric conductor pushouts along flat morphisms, preserving full ideals and nilpotents.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: Schemes in a common universe; f is finite and schematically dominant. No base-change morphism or flatness hypothesis is needed.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceBaseChangeIso_hom_fst` (compatibility): The forward source conductor comparison followed by the first native pullback projection equals the recomputed source conductor inclusion into the actual base-changed source scheme.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceBaseChangeIso_hom_snd_inclusion` (compatibility): The forward source comparison followed by the native second projection and the old source conductor inclusion equals the recomputed source inclusion followed by pullback.fst f q.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceBaseChangeIso_inv_inclusion` (compatibility): The inverse source comparison followed by the recomputed source conductor inclusion equals the native first projection of the pullback of the old source conductor.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceBaseChangeIso_isPullback` (compatibility): The recomputed source conductor inclusion, forward comparison followed by second projection, pullback.fst f q and original source conductor inclusion form a native IsPullback square with those exact morphisms.

- `TauCeti.GenusOne.FerrandPushout.conductorMap_baseChange_square` (compatibility): The recomputed conductorMap followed by the target comparison equals the source comparison followed by the native pullback.map induced by the actual base-change source/target projections, original conductorMap and original f. The two defining squares are the actual scheme pullback condition and original conductorMap inclusion square.

- `TauCeti.GenusOne.FerrandPushout.conductorMap_baseChange_inverse_square` (compatibility): The inverse source comparison followed by the recomputed conductorMap equals the native base-changed original conductorMap followed by the inverse target comparison, as actual scheme morphisms.

- `TauCeti.GenusOne.FerrandPushout.conductorMap_square` (compatibility; assumptions H1): For finite schematically dominant f:Y to P, the actual conductorMap f followed by the target conductor closed inclusion equals the source conductor closed inclusion followed by f.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorSubschemeChecked.source_projection_roundtrip`: For arbitrary f and flat q, the actual source isomorphism has its native inverse roundtrip, preserves the actual recomputed source inclusion and supplies the exact native cartesian source square.

- `ConductorSubschemeChecked.actual_conductor_map`: The actual recomputed conductorMap and the two actual comparison isomorphisms satisfy the square with native pullback.map on the original conductor morphism and the actual source/target projections.

- `ConductorSubschemeChecked.identity_morphism_empty`: For any flat base change of an identity scheme morphism, both actual recomputed conductor closed subschemes are empty.

- `ConductorSubschemeChecked.identity_base`: For identity base change of arbitrary f, the actual target comparison preserves the original target inclusion after its second projection and the inverse source comparison preserves the actual source inclusion.

- `ConductorSubschemeChecked.open_restriction`: For restriction to any open of P, both actual recomputed conductor inclusion squares are native pullbacks. No affineness of the open is assumed.

- `ConductorSubschemeChecked.zero_ring`: Over Spec(Z/1), the actual target inverse inclusion equation and source comparison roundtrip hold without assuming any scheme point exists.

**Acceptance beyond the stated contract**

- Use actual recomputed conductor closed subschemes and their actual inclusion/projection morphisms; preserve nilpotent sections and the empty zero-ring case.

### The target conductor carrier comparison for a flat tower

Target `G.0/conductor-target-tower-iso`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorTargetTowerIso`.

For finite schematically dominant f:Y→P and flat q:T→P, r:Z→T, construct the actual scheme isomorphism t from the target conductor subscheme of (f_q)_r to the target conductor subscheme of f_(r∘q), both closed in Z. Here f_q is the native second projection of the pullback of f and q.

**Hypotheses.** Schemes in a common universe; f:Y→P finite and schematically dominant; q:T→P and r:Z→T flat. Native base-change and composition instances supply the required hypotheses. C_g denotes the native closed subscheme of the full conductorIdealSheaf(g); i_g is its actual closed inclusion. e_(g,a) is the existing conductorTargetBaseChangeIso(g,a). Composition is written in traversal order in the declarations. No affine, Noetherian, reduced, separated, birational, faithfully-flat or nonempty assumption is added. These are target-conductor comparisons; source-carrier tower coherence and three-step coherence remain distinct obligations.

**Inputs.** `G.0/conductor-target-base-change-iso`, `G.0/conductor-scheme-flat-comparison`, `mathlib:CategoryTheory.eqToIso`.

**Source and scope.**

- [Scheme fibre products and authored target conductor tower coherence](https://stacks.math.columbia.edu/tag/01JO), Section26.17 Definition26.17.1 and Lemma26.17.6(1); authored conductor-specific two-step comparison. The section supplies the universal-property and closed-subscheme context. The exact tower isomorphisms and coherence identities are authored deductions from the retained conductor ideal/comparison contracts and pinned native pullback-pasting APIs, not statements attributed verbatim to Stacks.

**Proof outline.**

1. Both full conductor ideal-sheaf data equal the pullback of I_f along r∘q. Compose those equalities, apply the native subscheme constructor and use eqToIso. Retain the full ideals, without radicalization.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `key/ferrand-pushouts`: Supply the target-side coherence required for conductor square transport under iterated flat base change; the source side remains a separate obligation.

**API.**

- `TauCeti.GenusOne.FerrandPushout.conductorTargetTowerIso_hom_inclusion` (compatibility): The forward carrier comparison t.hom followed by the direct recomputed target conductor inclusion into Z equals the twice-recomputed target conductor inclusion into Z.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetTowerIso_inv_inclusion` (compatibility): The inverse carrier comparison t.inv followed by the twice-recomputed target conductor inclusion equals the direct recomputed target conductor inclusion.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetTowerIso_unique` (compatibility): Every actual morphism from the twice-recomputed target conductor subscheme to the direct recomputed one whose composite with the direct closed inclusion is the twice-recomputed inclusion equals t.hom.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetBaseChangeIso_tower` (compatibility): As whole native scheme isomorphisms, e_(f_q,r) followed by h equals t followed by e_(f,r∘q), where e is the existing conductorTargetBaseChangeIso. All four corners are the actual recomputed conductor subschemes or native scheme pullbacks.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetBaseChangeIso_tower_inverse` (compatibility): The composite h.inv followed by e_(f_q,r).inv equals e_(f,r∘q).inv followed by t.inv, as actual scheme morphisms between the specified carriers.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetBaseChangeIso_tower_snd` (compatibility): The morphism from C_((f_q)_r) to C_f obtained by e_(f_q,r), the intermediate second projection, e_(f,q) and its second projection equals the route through t, e_(f,r∘q) and the direct second projection.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetPullbackTowerIso_hom_fst` (compatibility): The forward flattening h.hom followed by the direct pullback first projection to Z equals the iterated pullback first projection to Z.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetPullbackTowerIso_hom_snd` (compatibility): The forward flattening h.hom followed by the direct second projection to C_f equals the successive composite: second projection to C_(f_q), forward conductorTargetBaseChangeIso(f,q), and second projection to C_f.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetPullbackTowerIso_inv_fst` (compatibility): The inverse flattening h.inv followed by the iterated first projection to Z equals the direct first projection.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetPullbackTowerIso_inv_snd` (compatibility): The inverse flattening h.inv followed by the successive old-conductor projection through C_(f_q) and conductorTargetBaseChangeIso(f,q) equals the direct second projection to C_f.

- `TauCeti.GenusOne.FerrandPushout.conductorTargetPullbackTowerIso` (constructor): Construct the actual scheme isomorphism h from the native pullback of r and the recomputed conductor inclusion i_(f_q) to the native pullback of r∘q and i_f. First use native pullback.map induced by identities on Z,T and the actual conductorTargetBaseChangeIso(f,q), then the native right pullback-pasting isomorphism.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorTowerChecked.carrier_inclusions`: The actual carrier comparison has its native roundtrip and the inverse preserves the full twice-recomputed closed inclusion.

- `ConductorTowerChecked.uniqueness`: Every scheme isomorphism between the specified recomputed conductor carriers preserving the inclusion equals the constructed tower isomorphism as a whole isomorphism.

- `ConductorTowerChecked.whole_inverse`: The inverses of the successive and direct composite comparison isomorphisms are equal as whole native isomorphisms.

- `ConductorTowerChecked.actual_conductor_map`: After precomposition with the actual conductorMap of the twice-base-changed finite morphism, the successive and direct maps to the old target conductor agree. This does not assert source-carrier tower coherence.

- `ConductorTowerChecked.identity_base`: Two identity base changes satisfy the whole tower comparison on the actual native pullback carriers; no definitional identification of these carriers with the original one is assumed.

- `ConductorTowerChecked.nested_open_restriction`: For any open U of P and any open V of U, without either being affine, the successive restriction comparison equals the direct comparison along V→U→P after the specified carrier isomorphisms.

- `ConductorTowerChecked.zero_ring`: Over Spec(Z/1), both actual conductor carrier and native pullback flattening isomorphisms have the native forward-inverse roundtrip, without a point or nontriviality hypothesis.

- `ConductorTowerChecked.native_pullback_projections`: The inverse native pullback flattening preserves both the last-base projection and the full successive projection to the original conductor.

**Acceptance beyond the stated contract**

- Use actual native recomputed conductor carriers and inclusions; do not replace a whole-isomorphism equality by an ideal equality alone.

### The actual source conductor carrier tower comparison

Target `G.0/conductor-source-tower-iso`. Proposed declaration: `TauCeti.GenusOne.FerrandPushout.conductorSourceTowerIso`.

Construct the actual scheme isomorphism s from the twice-recomputed source conductor carrier to the directly recomputed source conductor carrier. Compose the existing source comparison for (f_q,r), h, and the inverse of the existing direct source comparison for (f,r∘q). Its ambient morphism is the actual a, not an equality identification of the source schemes.

**Hypotheses.** Schemes in one universe. f:Y→P is finite and schematically dominant; q:T→P and r:Z→T are flat. f_q means native pullback.snd f q. Native composition and base-change instances supply the corresponding hypotheses. I_g is the full target conductor ideal, J_g=I_g.comap g the full source ideal. a is native pullbackLeftPullbackSndIso(f,q,r); t is the retained conductorTargetTowerIso. Traversal order is used for composition. No reduced, affine, Noetherian, separated, birational, faithfully-flat or nonempty assumption is added. Generic ideal/pullback carriers remain native or supplied by SF.0; geometric pushout transport and three-step coherence are separate obligations.

**Inputs.** `G.0/conductor-cokernel-right-base-change`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap_comp`, `mathlib:CategoryTheory.Limits.pullbackLeftPullbackSndIso_hom_fst`, `G.0/conductor-source-base-change-iso`, `mathlib:CategoryTheory.Limits.pullback.map`, `mathlib:CategoryTheory.Limits.pullback.map_isIso`, `mathlib:CategoryTheory.asIso`, `mathlib:CategoryTheory.Limits.pullbackRightPullbackFstIso`, `mathlib:CategoryTheory.Limits.pullbackLeftPullbackSndIso`, `mathlib:CategoryTheory.Limits.pullbackRightPullbackFstIso_hom_fst`, `mathlib:CategoryTheory.Limits.pullbackRightPullbackFstIso_hom_snd`.

**Source and scope.**

- [Scheme fibre products and authored source conductor tower comparisons](https://stacks.math.columbia.edu/tag/01JO), Section26.17 Definition26.17.1 and Lemma26.17.6(1); authored source-conductor specialization of native pullback pasting. The source supplies the fibre-product universal property and full inverse-image ideal context. The precise conductor tower comparisons and map-square identities are authored deductions from retained conductor contracts and pinned native APIs, not verbatim claims from Stacks.

**Proof outline.**

1. Compose actual native scheme isomorphisms. The intermediate pullbacks and the two distinct source ambient schemes are retained in the types. The forward inclusion law then determines this comparison uniquely.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `key/ferrand-pushouts`: Supply source-side tower compatibility for transporting actual conductor squares; geometric pushout transport remains a separate obligation.

**API.**

- `TauCeti.GenusOne.FerrandPushout.conductorSourceIdeal_tower` (compatibility): For finite schematically dominant f:Y→P and flat q:T→P, r:Z→T, the full source conductor ideal of (f_q)_r equals the inverse image of the full source conductor ideal of f_(r∘q) along the actual ambient isomorphism a: (Y×_P T)×_T Z ≅ Y×_P Z given by native pullbackLeftPullbackSndIso.

- `TauCeti.GenusOne.FerrandPushout.conductorSourcePullbackTowerIso_hom_fst` (compatibility): The forward flattening h.hom followed by the direct first projection equals the iterated first projection followed by a.hom.

- `TauCeti.GenusOne.FerrandPushout.conductorSourcePullbackTowerIso_hom_snd` (compatibility): The forward flattening h.hom followed by the direct second projection to the original source conductor equals the iterated second projection followed by the intermediate source comparison and its second projection.

- `TauCeti.GenusOne.FerrandPushout.conductorSourcePullbackTowerIso_inv_fst` (compatibility): The inverse h.inv followed by the iterated first projection equals the direct first projection followed by a.inv.

- `TauCeti.GenusOne.FerrandPushout.conductorSourcePullbackTowerIso_inv_snd` (compatibility): The inverse h.inv followed by the iterated second projection, intermediate source comparison and old-source second projection equals the direct second projection.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceBaseChangeIso_tower` (compatibility): As whole native scheme isomorphisms, the source comparison for (f_q,r) followed by h equals s followed by the direct source comparison for (f,r∘q). All corners are actual recomputed conductor carriers and native pullbacks.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceBaseChangeIso_tower_inverse` (compatibility): The inverse h.inv followed by the inverse source comparison for (f_q,r) equals the inverse direct source comparison followed by s.inv.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceBaseChangeIso_tower_snd` (compatibility): The route from the twice-recomputed source conductor through the successive source comparisons and second projections to the original source conductor equals the route through s, the direct source comparison and its second projection.

- `TauCeti.GenusOne.FerrandPushout.conductorSourcePullbackTowerIso` (constructor): Construct the actual scheme isomorphism h from the pullback of the intermediate source conductor inclusion along the second source projection to the pullback of the original source conductor inclusion along the direct source projection. It uses the existing source comparison, right pullback pasting, and the actual ambient a via native pullback.map.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceTowerIso_hom_inclusion` (compatibility): The forward s.hom followed by the direct source conductor inclusion equals the twice-recomputed source inclusion followed by a.hom.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceTowerIso_inv_inclusion` (compatibility): The inverse s.inv followed by the twice-recomputed source inclusion equals the direct source inclusion followed by a.inv.

- `TauCeti.GenusOne.FerrandPushout.conductorSourceTowerIso_unique` (compatibility): Every actual morphism between the specified source conductor carriers whose composite with the direct inclusion is the twice-recomputed inclusion followed by a.hom equals s.hom.

- `TauCeti.GenusOne.FerrandPushout.conductorMap_tower_square` (compatibility): The source carrier comparison s.hom followed by the actual directly recomputed conductorMap equals the actual twice-recomputed conductorMap followed by the retained target carrier comparison t.hom. This is the full source-target conductor-map square.

- `TauCeti.GenusOne.FerrandPushout.conductorMap_tower_inverse_square` (compatibility): The inverse s.inv followed by the actual twice-recomputed conductorMap equals the actual directly recomputed conductorMap followed by t.inv.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `ConductorSourceTowerChecked.native_inverse_projections`: Both inverse flattening projections hold on actual source pullbacks; the first explicitly retains a.inv and the second retains the intermediate conductor comparison.

- `ConductorSourceTowerChecked.whole_inverse`: The inverses of the whole successive and direct source-comparison composite isomorphisms agree.

- `ConductorSourceTowerChecked.identity_base`: Two identity base changes satisfy the whole source tower comparison on the actual native carriers, retaining their ambient pasting maps.

- `ConductorSourceTowerChecked.zero_ring`: Over Spec(Z/1), both source carrier and source pullback flattening isomorphisms have their native forward-inverse roundtrips.

- `ConductorSourceTowerChecked.carrier_roundtrip`: The actual source carrier comparison has its native forward-inverse roundtrip and its inverse inclusion follows the actual inverse ambient pasting isomorphism.

- `ConductorSourceTowerChecked.uniqueness`: Every whole scheme isomorphism between the two specified source conductor carriers preserving the ambient inclusion equals the constructed s.

- `ConductorSourceTowerChecked.actual_conductor_maps`: The forward and inverse squares of the actual twice/direct conductor maps and actual source/target tower carrier comparisons both commute.

- `ConductorSourceTowerChecked.nested_open_restriction`: For every open U of P and every open V of U, without affineness assumptions, the actual conductor maps commute with source and target carrier comparisons along V→U→P.

- `ConductorSourceTowerChecked.nonreduced_diagonal`: For the actual diagonal Spec(Z/4×Z/4)→Spec(Z/4), prove finiteness and schematic dominance from the native maps, exhibit nonzero square-zero2 in the base ring, and prove the actual source-target conductor-map tower square for two identity base changes. This does not certify the retained admitted conductor-section test.

**Acceptance beyond the stated contract**

- Use the actual source ambient isomorphism and full conductor ideals; retain exact forward and inverse morphisms.

**Remaining proof obligations for G.0**

- Exact SF.1 algebraic-space descent, quotient, lifting and representability exports and SF.3 flat patching signatures for the verified finite-pinching theorems.

- Integration of the compatible affine-neighborhood scheme criterion and the general geometric pushout with the actual supplier carriers.

- Three-step closed-subscheme and conductorMap comparison coherence, and transport of the full geometric-pushout predicate through the recomputed conductor comparisons.

## G.1 — Genus-one fibers and finite-field forms

The genus-one definitions carry the hypotheses needed by fiber and cohomology theory. Small conductor algebras distinguish split nodes, nonsplit nodes and cusps, as well as the separate two-component construction. The polynomial specialization supplies a concrete two-chart curve and finite map, native relative and absolute normalization comparisons, and coefficient-sensitive tests. Properness, the projective-line/Proj identifications and conductor cohomology are required targets whose remaining proof inputs are recorded. The five smooth binary equations are a native coefficient classifier; passing from an arbitrary pointed genus-one scheme to such an equation still requires the scheme-presentation adapter.

**Planets:** Genus-one fibrations; Fiber multiplicity; Geometric Kodaira fibers; Kodaira classification; Five elliptic curves over F₂; Quadratic pinching algebras.

### Genus-one fibration

Target `G.1/genus-one-fibration`. Proposed declaration: `GenusOneFibration`.

Over a field k, a genus-one fibration is a proper flat contraction f:S→B with S smooth proper geometrically integral of dimension2 and H⁰(S,O)=k, B a smooth proper geometrically integral curve, and generic fiber a regular geometrically integral proper curve over K=k(B) with H⁰=K and dim_K H¹=1. Elliptic means the generic fiber is smooth over K; quasielliptic means it is not smooth. Relative minimality means no vertical exceptional curve of the first kind. The Jacobian fibration carries its distinguished section.

**Inputs.** `tauceti:TauCeti.Model`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, p. 9; §3, p. 9; §4, pp. 12–13; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Extend the existing DVR model by a global curve base, and impose generic genus using genuine coherent cohomology.

2. Use the imported minimal-model criterion for the smooth generic case; do not infer smoothness from regularity over the imperfect field k(B).

**Consumers.** `Schröer §§3,8–10`: The same fibration carrier is used for all fiber and Jacobian comparisons. `CDL2024 §4.1 pp361–363`: Regular non-smooth generic curves distinguish quasielliptic fibrations.

**API.**

- `GenusOneFibration.toModel` (compatibility): Localization at a closed base point is the existing TauCeti.Model, with the chosen generic-fiber identification.

- `GenusOneFibration.fiber` (projection): For a point b return the scheme-theoretic fiber over κ(b), not its reduction.

- `GenusOneFibration.baseChange` (functoriality): Field extension gives the base-changed fibration; regularity/minimality must be re-established when not preserved.

- `GenusOneFibration.isElliptic_iff` (characterisation): Elliptic iff the generic fiber is smooth over k(B).

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `GenusOneFibration.product`: For E/k elliptic, E×P¹→P¹ is elliptic with genus1 generic fiber.

- `GenusOneFibration.quasielliptic`: A regular non-smooth genus-one generic curve in characteristic2 is quasielliptic and must not satisfy the elliptic predicate.

- `GenusOneFibration.localization`: A localized fibration retains the schematic multiple fiber, even if its reduction is smooth.

**Acceptance beyond the stated contract**

- For E/k elliptic, E×P¹→P¹ is elliptic with genus1 generic fiber.

- A regular non-smooth genus-one generic curve in characteristic2 is quasielliptic and must not satisfy the elliptic predicate.

- A localized fibration retains the schematic multiple fiber, even if its reduction is smooth.

### Divisors of fiber and canonical type

Target `G.1/fiber-type-divisor`. Proposed declaration: `FiberTypeDivisor`.

For a nonzero connected effective divisor D=Σn_iC_i on a smooth proper surface, with distinct integral C_i and n_i>0, fiber type means D·C_i=0 for every i, and canonical type additionally K_S·C_i=0 for every i. Its multiplicity is gcd_i n_i; D_ind=Σ(n_i/m)C_i and D_red=ΣC_i. The latter two need not agree. The definition uses the scheme Weil-divisor/intersection APIs of SF.5 and the geometric numerical-type realization of StableReduction.

**Inputs.** `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, p. 9; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use the existing effective divisor, intersection and finite component carriers.

2. Take a positive gcd on the nonempty support; form the quotient coefficients without truncating division.

**Consumers.** `Schröer §§3,9`: Separate the smooth reduced underlying fiber from the multiple Cartier fiber. `Bombieri–Mumford II Theorem2`: Correction divisor uses the indecomposable fiber with its null-root multiplicities.

**API.**

- `FiberTypeDivisor.mul` (constructor): A positive integral multiple is of fiber type, and of canonical type when the original is.

- `FiberTypeDivisor.ind` (projection): The indecomposable divisor has coefficient gcd1 and m·D_ind=D.

- `FiberTypeDivisor.red` (projection): The reduced divisor has every coefficient1.

- `FiberTypeDivisor.numericalType` (compatibility): For a localized regular model, use the existing numerical type with its residue-degree weights, rather than an unweighted replacement.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `FiberTypeDivisor.smooth`: A smooth genus-one fiber has multiplicity1 and D_ind=D_red.

- `FiberTypeDivisor.double`: For a double smooth fiber, m=2, D_ind=D_red, and D differs from both.

- `FiberTypeDivisor.star`: For an I₀* fiber, gcd1 but the central component has coefficient2, so D_ind≠D_red.

- `FiberTypeDivisor.exceptional`: A connected negative-definite exceptional divisor cannot be of fiber type.

**Acceptance beyond the stated contract**

- A smooth genus-one fiber has multiplicity1 and D_ind=D_red.

- For a double smooth fiber, m=2, D_ind=D_red, and D differs from both.

- For an I₀* fiber, gcd1 but the central component has coefficient2, so D_ind≠D_red.

- A connected negative-definite exceptional divisor cannot be of fiber type.

### Geometric Kodaira realization

Target `G.1/geometric-kodaira`. Proposed declaration: `HasGeometricKodairaFiber`.

For the indecomposable geometric fiber of a relatively minimal genus-one fibration, HasGeometricKodairaFiber(f,b,T) asserts the full scheme/divisor realization of the existing equation-side Kodaira symbol T: components, normalization genera, null-root multiplicities, intersection lengths and incidence points. For I₂ record two distinct intersection points, for III one length2 tangency; for I₃ a three-node cycle, for IV three components through one point. I₀ is smooth, multiplicative I_n has n≥1, and the additive list is II,III,IV,I_n*,IV*,III*,II*. A numerical graph alone is insufficient.

**Inputs.** `G.1/genus-one-fibration`, `G.1/fiber-type-divisor`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, pp. 9–10; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Import the symbol type from EllipticCurves Layer4 and attach its geometric realization, without creating a second enum.

2. Use scheme-theoretic intersection lengths over κ(b), and transport to geometric fibers.

**Consumers.** `Schröer Theorems9.4,10.4–10.5`: Distinguish bad fiber types and splitting used in the point sum. `Szydło §2 and Theorem3.1`: The same symbol need not describe all imperfect-residue behavior.

**API.**

- `HasGeometricKodairaFiber.components` (projection): The component counts are n for I_n,n+5 for I_n*,7 for IV*,8 for III*,9 for II*.

- `HasGeometricKodairaFiber.multiplicative` (characterisation): A singular multiplicative underlying fiber has symbol I_n with n≥1.

- `HasGeometricKodairaFiber.baseChange` (functoriality): The geometric symbol is invariant after extending the algebraically closed residue field.

- `HasGeometricKodairaFiber.tate` (compatibility): For an elliptic generic fiber over a perfect-residue DVR, the realization agrees with the imported Tate algorithm on a minimal equation.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `HasGeometricKodairaFiber.two_components`: III and I₂ have different local incidence schemes even though both have two vertices.

- `HasGeometricKodairaFiber.triangle`: IV and I₃ both have triangular pairwise graphs, but IV has one triple intersection and I₃ three nodes.

- `HasGeometricKodairaFiber.smooth`: I₀ is smooth and is neither singular multiplicative nor additive.

**Acceptance beyond the stated contract**

- III and I₂ have different local incidence schemes even though both have two vertices.

- IV and I₃ both have triangular pairwise graphs, but IV has one triple intersection and I₃ three nodes.

- I₀ is smooth and is neither singular multiplicative nor additive.

### Degenerate genus-one fiber

Target `G.1/degenerate-fiber`. Proposed declaration: `DegenerateFiber`.

A geometric fiber is degenerate when its gcd multiplicity is greater than1, or its indecomposable divisor is singular in the elliptic case, or that divisor is reducible in the quasielliptic case. A simple irreducible cuspidal fiber of a quasielliptic fibration is not degenerate in this convention.

**Inputs.** `G.1/genus-one-fibration`, `G.1/fiber-type-divisor`, `G.1/geometric-kodaira`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, p. 10; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Evaluate the multiplicity and the two generic-fiber cases separately.

**Consumers.** `Schröer §3`: Avoid counting every generic cusp of a quasielliptic fibration as an exceptional fiber.

**API.**

- `DegenerateFiber.multiple` (characterisation): Every multiple fiber is degenerate.

- `DegenerateFiber.elliptic_iff` (characterisation): For an elliptic fibration, degenerate iff multiple or singular indecomposable fiber.

- `DegenerateFiber.quasielliptic_iff` (characterisation): For a quasielliptic fibration, degenerate iff multiple or reducible indecomposable fiber.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `DegenerateFiber.simple_smooth`: A simple smooth elliptic fiber is not degenerate.

- `DegenerateFiber.double_smooth`: A double smooth fiber is degenerate despite smooth reduction.

- `DegenerateFiber.simple_cusp`: A simple irreducible cusp of a quasielliptic fibration is not degenerate.

**Acceptance beyond the stated contract**

- A simple smooth elliptic fiber is not degenerate.

- A double smooth fiber is degenerate despite smooth reduction.

- A simple irreducible cusp of a quasielliptic fibration is not degenerate.

### Classification of canonical fibers

Target `G.1/canonical-type-classification`.

The indecomposable geometric fibers have exactly the geometric Kodaira forms specified by PAPER-SCHROER-23/189, with the multiplicity vector the primitive null root; irreducible nodal and cuspidal cases must be separated from the reducible affine-root cases.

**Hypotheses.** Smooth proper surface over an algebraically closed field; regular relatively minimal genus-one fibration.

**Inputs.** `G.1/fiber-type-divisor`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, equation (1), pp. 9–10; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use the imported Zariski negative-semidefinite intersection lemma and adjunction to get rational (−2)-components in the reducible case.

2. Apply the classification of connected affine root systems to the intersection form.

3. Classify integral genus1 curves by normalization and the length-one delta invariant; retain the incidence distinction between I₂/III and I₃/IV.

**Acceptance beyond the stated contract**

- The affine graph is a constraint, not a substitute for local intersection geometry.

### Conductor classification with one or two rational components

Target `G.1/small-conductor-classification`.

Let C be a proper curve of canonical type over a field F whose irreducible components are birational to P¹_F. (r = 1) If C is integral with h⁰(O_C) = h¹(O_C) = 1, its normalization P¹_F → C fits into a cartesian and cocartesian square with a closed subscheme Spec R ⊂ P¹_F of length two, contracted to a rational point Spec F ⊂ C. R ≅ F × F gives I₁; R ≅ F[ε]/(ε²) gives II; R a separable (resp. purely inseparable) quadratic field gives Ĩ₁ (resp. ĨI). (r = 2) If C = C_1 + C_2 with C_i ≅ P¹_F, then P¹ ⊔ P¹ → C fits into a cartesian and cocartesian square over Spec(R × R) → Spec R with R of length two, giving I₂, III, Ĩ₂, ĨII correspondingly. Over a perfect field ĨI and ĨII do not occur.

**Inputs.** `G.0/conductor-square`, `G.0/global-existence`, `G.1/canonical-type-classification`, `SchemeAndStackFoundations:SF.0`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, p. 10; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use the normalization exact sequence and arithmetic genus1 to force a conductor algebra of length2.

2. Apply the Ferrand conductor square and classify length2 algebras: split, dual numbers, separable quadratic and purely inseparable quadratic.

3. For two components use two identical copies of the conductor algebra and its diagonal map; over perfect fields eliminate the inseparable field case.

**Acceptance beyond the stated contract**

- Keep the imperfect-field forms visible; only the perfect-field nodal forms are used for F₂.

### Nonsplit I₁ pinching

Target `G.1/nonsplit-i1`.

Over a perfect field k, a rational nodal curve with nonsplit node is obtained by pinching Spec E⊂P¹_k, for a separable quadratic extension E/k, to Spec k; this is the symbol nonsplit I₁.

**Inputs.** `G.0/global-existence`, `G.1/small-conductor-classification`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `G.1/quadratic-pinch-i1-genus`, `G.1/quadratic-pinch-splitting`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, p. 10; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Apply global Ferrand existence to the quadratic closed point on P¹.

2. The normalization exact sequence gives arithmetic genus1 and the conductor square gives one rational node with two conjugate branches.

3. Use the explicit quadratic-pinch chart, properness and E/k cohomology quotient in the new consumer leaves; compare its actual conjugate branches after field extension.

**Acceptance beyond the stated contract**

- After quadratic extension it becomes split I₁; over F_q its rational count is q+2.

### Nonsplit I₂ pinching

Target `G.1/nonsplit-i2`.

Over a perfect field k, nonsplit I₂ is the curve with normalization P¹⊔P¹ obtained from the conductor square Spec(E×E)→P¹⊔P¹ and Spec E→C, where E/k is separable quadratic.

**Inputs.** `G.0/global-existence`, `G.1/small-conductor-classification`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `G.1/quadratic-pinch-i2-genus`, `G.1/quadratic-pinch-splitting`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, p. 10; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Pinch the two copies of Spec E in P¹⊔P¹ to Spec E by the identity on each copy.

2. The two components are individually rational; their two geometric intersection points are conjugate, so the node set has no k-point.

3. Use the specified two-component conductor identifications and cohomology map k²→E in the new consumer leaves; keep the component vertices fixed while the two geometric nodes are conjugate.

**Acceptance beyond the stated contract**

- Over F_q the rational count is 2q+2; this form has fixed component vertices but conjugate edges.

### Descent of components under constant numerical Picard

Target `G.1/component-descent`.

Let S be a smooth proper surface over k = F_q with h⁰(O_S) = 1 and Num_{S/k} constant. Let f: S → B be a relatively minimal genus-one fibration, and ā a geometric point over a closed point a ∈ B. Then Γ(S_ā) → Γ(S_a) is a graph isomorphism respecting edge labels. If S_ā is reducible, a is F_q-rational. If every irreducible component of S_a is birational to P¹_{F_q}, a is rational. If a is rational and f⁻¹_ind(ā) is singular, every irreducible component of S_a is birational to P¹_{F_q}, and its normalization is isomorphic to P¹_{F_q}.

**Inputs.** `G.1/genus-one-fibration`, `G.1/canonical-type-classification`, `SchemeAndStackFoundations:SF.5`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `G.1/finite-field-p1-forms`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 3.1, pp. 10–11; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use the numerical-Picard Galois argument to fix every component class and then every component as a subscheme.

2. Compare the connected intersection graph with residue-degree orbits to force reducible fibers to lie over rational base points.

3. Normalize rational components, use finite-field forms of P¹, and preserve labels as κ(a)-lengths.

**Acceptance beyond the stated contract**

- For nonrational a use intersection label (C_i·C_j)/[κ(a):k], not the absolute intersection number.

### Split multiplicative fiber count

Target `G.1/count-15`.

Let S be a smooth proper surface over F_q with h⁰(O_S) = 1 and Num_{S/F_q} constant, f: S → B a relatively minimal genus-one fibration, and C = f⁻¹(a) the schematic fibre over an F_q-rational point a ∈ B, with r ≥ 1 irreducible components and C_red singular. If C_ind has the split Kodaira symbol I_r, then Card C(F_q) = rq.

**Inputs.** `G.1/component-descent`, `G.1/geometric-kodaira`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Each normalized P¹ contributes q+1.

2. For n≥2 subtract the n distinct rational nodes; for n=1 identify two rational preimages and add the single node.

**Acceptance beyond the stated contract**

- The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

### Nonsplit I₁ point count

Target `G.1/count-16`.

Let S be a smooth proper surface over F_q with h⁰(O_S) = 1 and Num_{S/F_q} constant, f: S → B a relatively minimal genus-one fibration, and C = f⁻¹(a) the schematic fibre over an F_q-rational point a ∈ B, with r ≥ 1 irreducible components and C_red singular. If C_ind has the twisted symbol Ĩ₁ (non-split I₁, so r = 1), then Card C(F_q) = q + 2.

**Inputs.** `G.1/nonsplit-i1`, `G.1/quadratic-extension-counts`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. The degree2 point contributes no rational normalization preimage.

2. The pinched node is rational, hence replace zero points by one: q+1+1.

3. Specialize the new odd/even extension formula to n=1; the complement comparison removes no rational quadratic point and adds the rational node.

**Acceptance beyond the stated contract**

- The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

### Nonsplit I₂ point count

Target `G.1/count-17`.

Let S be a smooth proper surface over F_q with h⁰(O_S) = 1 and Num_{S/F_q} constant, f: S → B a relatively minimal genus-one fibration, and C = f⁻¹(a) the schematic fibre over an F_q-rational point a ∈ B, with r ≥ 1 irreducible components and C_red singular. If C_ind has the twisted symbol Ĩ₂ (non-split I₂, so r = 2), then Card C(F_q) = 2q + 2.

**Inputs.** `G.1/nonsplit-i2`, `G.1/quadratic-extension-counts`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Each rational normalized component contributes q+1.

2. The degree2 conductor and its image have no rational points, so no correction is made.

3. Specialize the new fixed-component I₂ extension formula to n=1; neither conductor copy nor its image has an F_q-point.

**Acceptance beyond the stated contract**

- The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

### Additive fiber point count

Target `G.1/count-18`.

Let S be a smooth proper surface over F_q with h⁰(O_S) = 1 and Num_{S/F_q} constant, f: S → B a relatively minimal genus-one fibration, and C = f⁻¹(a) the schematic fibre over an F_q-rational point a ∈ B, with r ≥ 1 irreducible components and C_red singular. If C_ind has an unstable (additive) Kodaira symbol, then Card C(F_q) = rq + 1.

**Inputs.** `G.1/component-descent`, `G.1/canonical-type-classification`, `G.1/small-conductor-classification`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. For a cuspidal integral fiber normalization is bijective on rational points.

2. For III subtract one shared point; for IV subtract two at the common triple point.

3. For the star types use their rational tree of components and subtract r−1 distinct rational intersections.

**Acceptance beyond the stated contract**

- The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

### Exclusion of I₀* over F₂

Target `G.1/count-19`.

Let S be a smooth proper surface over F₂ with h⁰(O_S) = 1 and Num_{S/F₂} constant, and f: S → B a relatively minimal genus-one fibration. Then no geometric fibre of f has Kodaira symbol I₀*. A reducible geometric fibre lies over an F₂-rational point (/12). There all five components are isomorphic to P¹_{F₂} (/14), and the four terminal components would meet the central one in four distinct rational points, but Card P¹(F₂) = 3.

**Inputs.** `G.1/component-descent`, `G.1/canonical-type-classification`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. The four distinct rational intersections on the central normalized P¹ would require four points.

2. P¹(F₂) has only three points.

**Acceptance beyond the stated contract**

- The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

### Finite-field genus-one torsors have points

Target `G.1/lang-genus-one`.

Every smooth proper geometrically connected genus-one curve over F_q has an F_q-point: it is a torsor under its smooth connected Jacobian, and Lang’s theorem kills that torsor.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

**Source and scope.**

- [Algebraic groups over finite fields](https://wstein.org/papers/bib/Lang-Algebraic_Groups_Over_Finite_Fields.pdf), Theorem1, corollary and Theorem2 with proofs, pp556–558. Use a smooth connected algebraic group, not an arbitrary disconnected group.

**Proof outline.**

1. Use the genuine Jacobian torsor structure.

2. Apply surjectivity of x↦x⁻¹Frob_q(x) and the Frobenius descent argument of Lang Theorem2 to obtain a fixed point.

**Acceptance beyond the stated contract**

- For a disconnected finite constant group the general torsor conclusion can fail.

### Finite-field forms of the projective line

Target `G.1/finite-field-p1-forms`.

A smooth proper geometrically genus0 curve over F_q is isomorphic to P¹_Fq. More generally, over any field, such a curve with a line bundle of degree1 is isomorphic to P¹.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:R09.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 3.1, p. 11; proof of Theorem 5.6(iii), p. 17; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use Lang Theorem1/2 for the smooth connected group PGL₂, with the general-group source-proof gap recorded; the genus-one consumer alone does not supply this statement.

2. For the degree1 version use Riemann–Roch to obtain two sections and a degree1 morphism to P¹, then finite degree1 normality gives the isomorphism.

**Acceptance beyond the stated contract**

- Do not apply Tsen over F_q(t) to prove this finite-field statement.

### Elliptic curve E1 over F₂

Target `G.1/E1`.

The smooth projective Weierstrass curve y²+y=x³+x²+1 over F₂ has cyclic rational-point group of order 1, j=0, and is supersingular.

**Inputs.** `G.1/f2-models`, `G.1/f2-point-groups`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Identify this source equation with F2Model at index 0.

2. Use the separate model discriminant, point-count, j and cyclic point-group declarations, including the explicit native point cycles.

3. Use the still-requested geometric ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

**Acceptance beyond the stated contract**

- The affine solution count alone is one less than the stated projective count.

### Elliptic curve E2 over F₂

Target `G.1/E2`.

The smooth projective Weierstrass curve y²+xy=x³+x²+x over F₂ has cyclic rational-point group of order 2, j=1, and is ordinary.

**Inputs.** `G.1/f2-models`, `G.1/f2-point-groups`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Identify this source equation with F2Model at index 1.

2. Use the separate model discriminant, point-count, j and cyclic point-group declarations, including the explicit native point cycles.

3. Use the still-requested geometric ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

**Acceptance beyond the stated contract**

- The affine solution count alone is one less than the stated projective count.

### Elliptic curve E3 over F₂

Target `G.1/E3`.

The smooth projective Weierstrass curve y²+y=x³ over F₂ has cyclic rational-point group of order 3, j=0, and is supersingular.

**Inputs.** `G.1/f2-models`, `G.1/f2-point-groups`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Identify this source equation with F2Model at index 2.

2. Use the separate model discriminant, point-count, j and cyclic point-group declarations, including the explicit native point cycles.

3. Use the still-requested geometric ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

**Acceptance beyond the stated contract**

- The affine solution count alone is one less than the stated projective count.

### Elliptic curve E4 over F₂

Target `G.1/E4`.

The smooth projective Weierstrass curve y²+xy=x³+x over F₂ has cyclic rational-point group of order 4, j=1, and is ordinary.

**Inputs.** `G.1/f2-models`, `G.1/f2-point-groups`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Identify this source equation with F2Model at index 3.

2. Use the separate model discriminant, point-count, j and cyclic point-group declarations, including the explicit native point cycles.

3. Use the still-requested geometric ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

**Acceptance beyond the stated contract**

- The affine solution count alone is one less than the stated projective count.

### Elliptic curve E5 over F₂

Target `G.1/E5`.

The smooth projective Weierstrass curve y²+y=x³+x² over F₂ has cyclic rational-point group of order 5, j=0, and is supersingular.

**Inputs.** `G.1/f2-models`, `G.1/f2-point-groups`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Identify this source equation with F2Model at index 4.

2. Use the separate model discriminant, point-count, j and cyclic point-group declarations, including the explicit native point cycles.

3. Use the still-requested geometric ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

**Acceptance beyond the stated contract**

- The affine solution count alone is one less than the stated projective count.

### Five elliptic classes over F₂

Target `G.1/five-f2-classes`.

Every elliptic curve over F₂ is isomorphic over F₂ to exactly one of the five specified E_i; its point count i determines its class.

**Inputs.** `G.1/E1`, `G.1/E2`, `G.1/E3`, `G.1/E4`, `G.1/E5`, `G.1/f2-count-classifier`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Import from SF.3 the exact Weierstrass presentation of a pointed smooth proper geometrically connected genus-one curve over F₂, with its scheme model and rational-point comparison. A docstring about equations is not this export.

2. Apply the complete native coefficient classifier and its sixteen explicit forward changes.

3. Use the SF.3 curve dictionary and projective realization of admissible changes, preserving infinity, to obtain curve isomorphisms. The five counts prove unique class index. Group isomorphisms of rational points alone are not curve isomorphisms.

**Acceptance beyond the stated contract**

- Isogeny and isomorphism are generally different; the count criterion here is special to F₂.

### The five binary Weierstrass models

Target `G.1/f2-models`. Proposed declaration: `F2Model`.

F2Model:Fin5→WeierstrassCurve(F₂) sends indices 0,…,4 to coefficient tuples (a₁,a₂,a₃,a₄,a₆) equal to (0,1,1,0,1), (1,1,0,1,0), (0,0,1,0,0), (1,0,0,1,0), (0,1,1,0,0). Thus index i names the source E_(i+1). This is an explicit family in the native carrier, not a definition of smoothness, ordinarity or a general elliptic curve.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Inputs.** `mathlib:WeierstrassCurve`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), arXiv:2004.07025v3, p.11, Proposition3.3/table and preceding paragraph. The table states the five models and counts. The finite coefficient and transformation calculations here are independently exhibited deductions using the pinned native formulas; the paragraph cites Knapp for the general geometric classification, whose owner adapter is kept explicit.

**Proof outline.**

1. Read the five equations from the source table and translate them into the native a-coefficient order.

2. Use the native structure constructor and a finite five-entry vector. Keep the source count index instead of the table’s supersingular-first row order.

3. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/E1–G.1/E5`: Fix the actual native equations for invariant, group and count assertions. `G.1/five-f2-classes and G.2/f2-isomorphism`: Supply five explicitly distinguished representatives and their count index.

**API.**

- `F2Model.coefficients` (simp): Evaluation at each Fin5 index gives the displayed native coefficient tuple.

- `F2Model.isElliptic` (instance): Each displayed model is elliptic, from the separately planned discriminant calculation.

- `F2Model.injective` (extensionality): F2Model i=F2Model j iff i=j, by their different point counts.

- `F2Model.pointCount` (compatibility): For every i∈Fin5, the existing projective pointCount(F2Model i)=i+1. The affine solution sets for i=0,…,4 are respectively ∅, {(0,0)}, {(0,0),(0,1)}, {(0,0),(1,0),(1,1)}, {(0,0),(0,1),(1,0),(1,1)}.

- `f2_discriminant` (compatibility): For W over F₂, Δ(W)=a₃ if a₁=0, and Δ(W)=a₆+a₄+a₃(a₄+a₂) if a₁=1. Equivalently, use the if-expression on a₁=0. The identity uses a²=a for elements of F₂ and does not extend unchanged to F₄.

- `f2_smooth_split` (compatibility): For a tuple W over F₂, Δ=1 iff either a₁=0 and a₃=1, or a₁=1 and a₆=1+a₄+a₃(a₄+a₂). In the first branch a₂,a₄,a₆ are free and in the second branch a₂,a₃,a₄ are free. These disjoint branches exhibit all16 smooth tuples among the32 equations.

- `f2_change_formula` (compatibility): Every native VariableChange over F₂ has u=1 and one of eight triples (r,s,t). Its action preserves a₁ and sends (a₂,a₃,a₄,a₆) to (a₂+s a₁+r+s, a₃+r a₁, a₄+s a₃+(t+rs)a₁+r, a₆+r a₄+r a₂+r+t a₃+t+rt a₁). This is C•W; the point map from C•W to W is (x,y)↦(x+r,y+sx+t).

- `F2Model.discriminant` (compatibility): For each i∈Fin5, Δ(F2Model i)=1, so the native IsElliptic instance is justified. No genus-one assertion is inferred from a count on a singular model.

- `F2Model.j` (compatibility): The native j values of F2Model0,…,F2Model4 are0,1,0,1,0. These values do not distinguish all five F₂-isomorphism classes; in particular model0 and model4 have the same j but different point counts.

- `F2Model.orbit_witnesses` (compatibility): For each W over F₂ with Δ(W)=1 there are i∈Fin5 and a native C∈VariableChange(F₂) such that C•W=F2Model i. The durable sixteen-row certificate records every smooth coefficient tuple, its 1-based source class and the triple (r,s,t), with u=1.

- `F2Model.orbits_disjoint` (compatibility): For i,j∈Fin5, (∃C∈VariableChange(F₂), C•F2Model i=F2Model j) iff i=j. The index is unique; the witnessing change generally is not unique because a model can have automorphisms.

- `f2_e4_double` (compatibility): For E₄=F2Model3 and its nonsingular affine points P=(1,0), Q=(0,0), native point addition gives P+P=Q. Since Q≠O and Q+Q=O, P has order4 and the four-point group is cyclic, not the Klein four group.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `F2Model.test_three`: F2Model2 is (0,0,1,0,0), the equation y²+y=x³.

- `F2Model.test_one_point`: F2Model0 has no affine F₂ solutions and has exactly its infinity point.

- `F2Model.test_same_j_distinct`: F2Model0 and F2Model4 both have j=0 but their projective counts are 1 and 5, so they are not identified.

- `F2Model.test_singular_count`: The all-zero tuple has Δ=0 and projective pointCount3, the same count as F2Model2. A count alone cannot classify singular input.

**Acceptance beyond the stated contract**

- The index convention is 0-based in Fin5 and 1-based in the source E_i.

- Model0 and model4 are distinct despite sharing j=0.

### Point counts classify smooth binary equations

Target `G.1/f2-count-classifier`. Proposed declaration: `f2_count_classifier`.

For W,V over F₂ with Δ(W)=Δ(V)=1, pointCount(W)=pointCount(V) iff ∃C∈VariableChange(F₂), C•W=V. This is a statement about native smooth equations and their actual admissible changes. Conversion to arbitrary pointed smooth proper genus-one schemes is an exact SF.3 import, not a consequence of point-group isomorphism alone.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Inputs.** `G.1/f2-models`, `mathlib:WeierstrassCurve.VariableChange`, `mathlib:WeierstrassCurve.variableChange_Δ`, `tauceti:WeierstrassCurve.Affine.variableChange_equation`, `tauceti:WeierstrassCurve.pointCount_def`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), arXiv:2004.07025v3, p.11, Proposition3.3/table and preceding paragraph. The table states the five models and counts. The finite coefficient and transformation calculations here are independently exhibited deductions using the pinned native formulas; the paragraph cites Knapp for the general geometric classification, whose owner adapter is kept explicit.

**Proof outline.**

1. Send W and V to their model representatives with the explicit orbit witnesses.

2. Changes preserve the projective point count: specialize the existing affine equation equivalence and its inverse, or use the additive point equivalence together with ellipticity.

3. Equal counts force equal model indices by the five model counts. Compose the native changes and an inverse to obtain the required C; the reverse implication follows from the same point-count compatibility.

**Acceptance beyond the stated contract**

- Δ=1 is essential: the singular all-zero tuple and smooth model2 both have projective count3 but cannot be related by an invertible admissible change.

- This does not claim that isogeny and isomorphism coincide over arbitrary finite fields.

### Cyclic point groups of the five binary models

Target `G.1/f2-point-groups`. Proposed declaration: `F2Model.point_group`.

For every i∈Fin5, the native rational-point group of F2Model i is additively isomorphic to ZMod(i+1). Generators in source E₁,…,E₅ order are O,(0,0),(0,0),(1,0),(0,0). The explicit cyclic lists include exactly every rational point, not only a subgroup of the right apparent size.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Inputs.** `G.1/f2-models`, `tauceti:WeierstrassCurve.pointCount_eq_card_point`, `mathlib:WeierstrassCurve.Affine.Point.add_some`, `mathlib:WeierstrassCurve.Affine.Point.add_of_Y_eq`, `mathlib:zmodAddEquivOfGenerator`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), arXiv:2004.07025v3, p.11, Proposition3.3/table and preceding paragraph. The table states the five models and counts. The finite coefficient and transformation calculations here are independently exhibited deductions using the pinned native formulas; the paragraph cites Knapp for the general geometric classification, whose owner adapter is kept explicit.

**Proof outline.**

1. Use the model-count lemma and pointCount_eq_card_point under model ellipticity to get the honest group cardinalities1,…,5.

2. The durable point-cycle table lists all multiples of the displayed generator until the first return to infinity; all listed affine points are nonsingular. Verify each addition with add_some or add_of_Y_eq. The order-four case uses f2_e4_double.

3. The affine solution lists plus infinity prove the generator spans the whole native group. Apply the existing zmodAddEquivOfGenerator and invert its equivalence to obtain the displayed orientation.

**Acceptance beyond the stated contract**

- The group of order1 is the trivial ZMod1 group. Orders2,3,5 and especially4 use actual point addition; no group law is replanned.

### Affine polynomial pinching algebra

Target `G.1/quadratic-pinch-algebra`. Proposed declaration: `QuadraticPinch.algebra`.

For a field k and q∈k[t], define A_q as the native k-subalgebra preimage of the constants in AdjoinRoot(q)=k[t]/(q). Thus f∈A_q iff there are c∈k and h∈k[t] with f=c+qh. The construction exists for every q; subsequent quadratic claims require q monic of degree2. It does not assert that q is separable or irreducible.

**Inputs.** `mathlib:Subalgebra.comap`, `mathlib:AdjoinRoot.mkₐ`, `mathlib:AdjoinRoot.mk_eq_mk`, `mathlib:Algebra.mem_bot`, `G.1/quadratic-normal-form-exists`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, printed p10, separable-quadratic conductor squares; Proposition3.2, printed p11. Derived consumer proof of the quadratic pinching case; the paper supplies the conductor diagrams and leaves the count computation to the reader.

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, printed pp10–11, the conductor squares and Proposition 3.2; derived affine polynomial adapter. The actual affine quotient-preimage chart is derived from the source conductor construction. These polynomial remainder lemmas are library-based proof refinements, not separately numbered statements in Schröer.

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §4.1, printed p565, pinching along a closed divisor; library-based coordinate adapter for the already defined polynomial preimage. Promotes the existing library-based membership API used to construct polynomial conductor elements; not a claim that Ferrand prints this polynomial lemma.

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, printed p10, one-component conductor diagram and adjoining normalization discussion; affine algebraic deductions at its already owned quadratic chart. The native finite module, shared fraction field and integral-closure comparisons are authored affine deductions. The source motivates the normalization chart; it does not print these polynomial signatures or certify the projective/cohomological comparison.

- [Conducteur, descente et pincement — bounded native affine continuation](https://www.numdam.org/item/BSMF_2003__131_4_553_0.pdf), Printed pp554–557, introduction and §§1.1–1.4. Authored native reconstruction and exactness deductions from the common-ideal criterion; the all-open normalization comparison additionally consumes this packet’s actual native normalization isomorphism.

**Proof outline.**

1. Take the preimage of the bottom subalgebra under AdjoinRoot.mkₐ. Algebra.mem_bot supplies an actual scalar witness; AdjoinRoot.mk_eq_mk identifies equality modulo q with divisibility by q. Rearranging the multiplicative witness proves mem_algebra for every q, including zero and units.

2. Use native Subalgebra, AdjoinRoot and the existing Ferrand ring pullback rather than introducing a new ring carrier.

3. The pinch_spanning API uses quadratic-normal-form-exists on h in f=c+qh, replacing its first coordinate by C(c)+tP. The added characteristic-two, inseparable and degree-one tests check these actual polynomial functions.

4. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `Schröer §3; G.1/nonsplit-i1 and nonsplit-i2`: Supply the concrete affine chart, residue and branch comparison in the existing Ferrand construction. `G.1/quadratic-extension-counts`: Retain the actual pinching locus and its residue extension when extending the field. `G.1/quadratic-pinch-i1-genus`: Supply the normalization-side finite inclusion before conductor ideal-sheaf and finite-pushforward cohomology comparisons.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: k is a field, q is monic with natural degree exactly two. No separability, irreducibility, perfectness or characteristic restriction is imposed.

- **H2**: k is any field. A_q is the existing scalar-preimage Subalgebra of k[X], with its native subtype inclusion and restricted multiplication action. No separability, irreducibility, perfectness or characteristic restriction is imposed. q is monic with native natural degree exactly two.

- **H3**: k is any field. A_q is the existing scalar-preimage Subalgebra of k[X], with its native subtype inclusion and restricted multiplication action. No separability, irreducibility, perfectness or characteristic restriction is imposed.

- **H4**: k is any field. A_q is the existing scalar-preimage Subalgebra of k[X], with its native subtype inclusion and restricted multiplication action. No separability, irreducibility, perfectness or characteristic restriction is imposed. q≠0. This general fraction-field or module-relation statement is not restricted to quadratics.

- `QuadraticPinch.mem_algebra` (compatibility): For every field k, polynomial q and f∈k[X], f∈A_q if and only if f=C(c)+qh for some c∈k and h∈k[X]. This is the promoted inherited membership API of the native subalgebra A_q, including q=0 and unit q.

- `QuadraticPinch.constants` (simp): Every constant polynomial C(c) belongs to A_q.

- `QuadraticPinch.generation` (compatibility): For q=t²+at+b over any field, A_q=k[q,tq]. As a k-vector space it has basis 1,q^i (i≥1),tq^j (j≥1). These have degrees0,2i,2j+1 respectively, so no degree1 vector occurs.

- `QuadraticPinch.pinch_spanning` (characterisation): For q=t²+at+b and f∈A_q, there exist P,Q∈k[t] with f=P(q)+tqQ(q). This is actual polynomial spanning, not an asserted Basis instance.

- `QuadraticPinch.relation_eval` (relation): Substitution U=q,V=tq sends F_(a,b) to zero.

- `QuadraticPinch.relation_quadratic` (projection): F_(a,b)+U³=V²+aUV+bU².

- `QuadraticPinch.relation_origin` (simp): F_(a,b)(0,0)=0.

- `QuadraticPinch.relation` (constructor): For a,b∈k define F_(a,b)∈k[U,V] by V²+aUV+bU²−U³, using native MvPolynomial(Fin2,k). With q=t²+at+b, the substitution U=q,V=tq kills F. Its quadratic part is V²+aUV+bU². No discriminant test requiring 2 invertible is built into this definition.

- `QuadraticPinch.residue_normal_form` (simp): ρ_q(c+qh)=c for the native subtype element.

- `QuadraticPinch.residue_surjective` (structure): ρ_q is surjective, split by constants.

- `QuadraticPinch.residue_kernel` (characterisation): ker ρ_q=(q).comap(A_q↪k[t]).

- `QuadraticPinch.residue` (constructor): For monic q of degree2, the constant c in f=c+qh is unique. Define the k-algebra map ρ_q:A_q→k by that c, concretely the constant coefficient of the remainder modulo q. It is surjective and its kernel is the contraction of (q)⊂k[t]. The output is an actual AlgHom, not a freely chosen residue identification.

- `QuadraticPinch.presentation` (compatibility): For q=t²+at+b, the substitution ψ:k[U,V]→k[t], U↦q,V↦tq, has image A_q and kernel (F_(a,b)). Consequently its induced map k[U,V]/(F_(a,b))→A_q is the canonical k-algebra isomorphism. This remains true for split, repeated-root and inseparable quadratics.

- `QuadraticPinch.conductor` (compatibility): For monic q of degree2, the conductor of A_q⊂k[t] is exactly the ambient ideal (q). Its contraction m=ker ρ_q satisfies A_q/m≅k, while k[t]/(q)=AdjoinRoot(q). The conductor square is the actual affine chart of the inherited Ferrand square.

- `QuadraticPinch.finite_normalization` (compatibility): For monic quadratic q, k[t] is finite over A_q, with module generators1,t. The inclusion is an isomorphism after inverting q, since t=(tq)/q, and induces the same fraction field. As k[t] is normal, this is the finite normalization of A_q. The statement includes the cusp; normality of the normalization does not imply the target is nodal.

- `QuadraticPinch.tangent_branches` (compatibility): At m=(U,V) on Spec(k[U,V]/F), m/m² has k-dimension2 and the tangent cone is k[U,V]/(V²+aUV+bU²). For separable q=t²+at+b this binary quadratic has two distinct geometric lines; if q is irreducible they are conjugate over its quadratic splitting field. The point is a node by the imported nodal-chart criterion. In characteristic2 a≠0 is the separability condition; a=0 is excluded from this nodal conclusion.

- `QuadraticPinch.remainder_scalar` (compatibility; assumptions H1): For the actual subtype element f∈A_q, f mod q equals C((f mod q).coeff(0)).

- `QuadraticPinch.scalar_unique` (compatibility; assumptions H1): If the same polynomial f is C(c)+qh and C(d)+qj, then c=d.

- `QuadraticPinch.normalization_remainder` (compatibility; assumptions H2): For monic quadratic q and every f∈k[X], f mod q=C((f mod q).coeff0)+C((f mod q).coeff1)X.

- `QuadraticPinch.moduleCoefficients_fst` (compatibility; assumptions H3): The first component of M_q(f), included in k[X], is C((f mod q).coeff0)+q(f div q).

- `QuadraticPinch.moduleCoefficients_snd` (compatibility; assumptions H3): The second component of M_q(f), included in k[X], is C((f mod q).coeff1).

- `QuadraticPinch.moduleCoefficients_reconstruct` (compatibility; assumptions H2): For monic quadratic q, M_q(f).1•1+M_q(f).2•X=f with the native A_q action on k[X].

- `QuadraticPinch.moduleCoefficients` (constructor; assumptions H3): For every q,f∈k[X], define the actual pair M_q(f)∈A_q×A_q with first ambient polynomial C((f mod q).coeff0)+q(f div q) and second C((f mod q).coeff1). The first membership witness is its displayed scalar-plus-q-multiple form; the second is a constant. The pair is a specified coefficient function, not an algebra equivalence or a unique coordinate system over A_q.

- `QuadraticPinch.normalization_span` (compatibility; assumptions H2): For monic quadratic q, the native A_q-submodule span of {1,X} in k[X] is the whole module.

- `QuadraticPinch.normalization_module_finite` (compatibility; assumptions H2): For monic quadratic q, native Module.Finite(A_q,k[X]) holds for the multiplication action restricted from k[X].

- `QuadraticPinch.normalization_spec_finite` (compatibility; assumptions H2): For monic quadratic q, the actual Scheme morphism Spec(k[X])→Spec(A_q) induced by the native subtype inclusion is finite.

- `QuadraticPinch.module_generator_map_not_injective` (compatibility; assumptions H4): For every nonzero q, the native map A_q×A_q→k[X], (a,b)↦a•1+b•X, is not injective: the nonzero coefficient pair (−qX,q) and (0,0) both map to zero.

- `QuadraticPinch.Global.normalization_sections_conductor_annihilator` (compatibility): For every field k, a,b∈k and every open U of the actual glued curve C, put A=Γ(C,U), B=Γ(N,ν⁻¹U) with the actual ν section-algebra structure. The contraction to A of c(im ν_U,B) equals Ann_A(B/(A·1)), using the native module quotient. This is an identity for section rings on each open; it does not identify a sheaf cokernel with those section quotients.

- `QuadraticPinch.Global.absoluteNormalization_sections_conductor` (compatibility): For every field k, a,b∈k and every open U⊂C, the ideals in Γ(C,U) obtained by contracting the conductor of the actual section map for ν:N→C and for η.fromNormalization:η.normalization→C are equal, where η is C’s generic-point morphism. This includes U=∅ and preserves nilpotents. It compares actual section maps, without yet constructing their conductor ideal sheaf.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.test_cusp`: A_(t²)=k[t²,t³].

- `QuadraticPinch.test_split`: For char k≠2, A_(t²−1) is the equal-value subalgebra {f:f(1)=f(−1)}.

- `QuadraticPinch.test_f4`: Over F₂, t∉A_(t²+t+1) although q and tq belong. The pinch is not all of k[t].

- `QuadraticPinch.test_normal_form_char2`: Over F₂, every h∈F₂[t] has h=P(t²+t+1)+tQ(t²+t+1), with no separability restriction on the general existence result.

- `QuadraticPinch.test_normal_form_inseparable`: Over F₂, (P,Q)↦P(t²)+t³Q(t²) is injective, despite the inseparability of t².

- `QuadraticPinch.test_linear_not_injective`: Over any field, (P,Q)↦P(t)+tQ(t) is not injective: (t,0) and (0,1) have the same image.

- `QuadraticPinch.test_relation_cusp`: F_(0,0)=V²−U³.

- `QuadraticPinch.test_relation_char2`: Over F₂, F_(1,1)=V²+UV+U²−U³; the UV term survives.

- `QuadraticPinch.test_relation_cubic`: F_(0,0)(1,0)=−1. Dropping the cubic term changes the affine curve.

- `QuadraticPinch.test_residue_constant`: ρ_q(C(1))=1.

- `QuadraticPinch.test_residue_q`: ρ_q(q)=0.

- `QuadraticPinch.test_residue_tq`: ρ_q(tq)=0, although the residue of t in AdjoinRoot(q) is not a constant.

- `QuadraticPinch.normalization.cusp_finite`: For q=X² over F₂, the actual subtype ring inclusion A_q→F₂[X] is finite.

- `QuadraticPinch.normalization.nonsplit_finite`: For q=X²+X+1 over F₂, the actual subtype ring inclusion A_q→F₂[X] is finite.

- `QuadraticPinch.normalization.repeated_char3`: For q=X²+X+1 over F₃, which has a repeated root, the actual subtype ring inclusion A_q→F₃[X] is still finite.

- `QuadraticPinch.normalization.zero_not_finite`: For q=0 over any field k, the actual subtype ring inclusion A_0→k[X] is not finite: A_0 is the constants and the polynomial module over k is not finite.

- `QuadraticPinch.moduleCoefficients.zero`: For every q, M_q(0)=(0,0) in the actual product A_q×A_q.

- `QuadraticPinch.moduleCoefficients.generator`: For every monic quadratic q, M_q(X)=(0,1) in A_q×A_q.

- `QuadraticPinch.moduleCoefficients.cusp`: For k=F₂ and q=X², M_q(X³) has first ambient component X³ and second component zero; it does not select the equally valid pair (0,q).

- `QuadraticPinch.normalization.not_basis`: For every monic quadratic q, the actual coefficient map A_q×A_q→k[X], (a,b)↦a•1+b•X, is not injective; the spanning pair is not a basis over A_q.

- `QuadraticPinch.Global.conductor.test_cusp_comparison`: For a=b=0, the actual cuspidal two-chart normalization and native absolute normalization have the same contracted section-ring conductor on every open U.

- `QuadraticPinch.Global.conductor.test_empty_comparison`: For a=b=1 over F₂ and U=∅, the two actual normalization section maps still have equal contracted conductors. No nonempty-open condition is smuggled into the comparison.

**Acceptance beyond the stated contract**

- The F₂ polynomial t²+t+1 excludes t from the pinch.

### Proper pinching of one closed field point

Target `G.1/quadratic-point-proper-pushout`. Proposed declaration: `QuadraticPinch.proper_point_pushout`.

Let k⊂E be a finite field extension and i:Spec E→Y a closed immersion into a proper k-scheme Y, commuting with the structure maps. Then pinching i along Spec E→Spec k gives a proper k-scheme C, with finite surjective ν:Y→C, closed j:Spec k→C, and geometric, categorical and cartesian Ferrand squares. No projective-line carrier, reducedness or separability is required for this existence/properness theorem.

**Inputs.** `G.0/global-existence`, `key/ferrand-pushouts`, `mathlib:AlgebraicGeometry.UniversallyClosed.of_comp_surjective`, `mathlib:AlgebraicGeometry.IsProper`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

**Source and scope.**

- [Scheme pinching: separatedness and finite type](https://stacks.math.columbia.edu/tag/0ECH), 37.67.1–5, especially4–5 including proofs. Consumer specialization to a proper scheme over a field; general Ferrand existence remains in G.0.

- [Finite type of a ring fibre product](https://stacks.math.columbia.edu/tag/00IT), 15.5.1, full statement and proof. Noetherian finite-type pinching input, requested from SF.0.

- [Separatedness under a universally closed surjection](https://stacks.math.columbia.edu/tag/09MQ), 29.42.11(4), full statement and proof. Separatedness descends through a surjective universally closed morphism.

**Proof outline.**

1. Spec E has one underlying point, so an affine neighborhood of its image in Y supplies the inherited global Ferrand neighborhood hypothesis.

2. Use the inherited universal property to obtain C→Spec k. Since Spec E→Spec k is onto, Y→C is onto.

3. Descend separatedness through the finite surjection using Stacks09MQ. The inherited finite maps give universally closedness; properness of Y and surjectivity give universally closedness of C→Spec k via the pinned theorem.

4. Obtain local finite type over k on Ferrand affine charts from Stacks37.67.5/00IT, retaining the Noetherian base hypothesis (a field). Combine the three native morphism properties.

**Acceptance beyond the stated contract**

- When E=k and i is a closed rational point, pinching is the identity and C≅Y is proper.

### Cohomology of the one-component pinch

Target `G.1/quadratic-pinch-i1-genus`. Proposed declaration: `QuadraticPinch.i1_genus`.

Let C be obtained by pinching Spec E⊂P¹_k to Spec k, where E/k is separable quadratic. Then C is proper geometrically integral, H⁰(C,O_C)=k and H¹(C,O_C)≅E/k as k-vector spaces, so p_a(C)=1. It has exactly one rational singular point with two conjugate branches. Normalization is P¹_k and the conductor pair is Spec E→Spec k.

**Inputs.** `G.1/quadratic-point-proper-pushout`, `G.1/quadratic-pinch-algebra`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `SchemeAndStackFoundations:SF.3`, `G.1/quadratic-cokernel-equiv-over-k`, `G.1/quadratic-infinity-curve`, `G.1/overlap-chart-equiv`, `G.1/overlap-equiv`, `G.1/global-curve`, `G.1/global-normalization`, `G.1/global-structure-map`, `G.1/global-infinity-transition`, `G.1/normal-curve-integral`, `G.1/normal-source-integral`, `G.1/normal-partial-iso`, `G.1/relative-normalization`, `G.1/relative-normalization-sections-iso`, `G.1/normalization-function-field-map`, `G.1/absolute-normalization-comparison`, `G.1/absolute-sections-closure-equivalence`, `G.1/native-normalization-source-sections-equivalence`, `G.1/absolute-comparison-absolute-normalization-comparison-sections-alg-equiv`, `G.0/common-ideal-difference`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, printed p10, separable-quadratic conductor squares; Proposition3.2, printed p11. Derived consumer proof of the quadratic pinching case; the paper supplies the conductor diagrams and leaves the count computation to the reader.

**Proof outline.**

1. Apply proper-point-pushout and identify the selected affine chart with A_q; the complement is unchanged.

2. The normalization exact sequence is 0→O_C→ν_*O_P¹→j_*(E/k)→0. On global constants the quotient map is zero.

3. Import H⁰(P¹,O)=k and H¹(P¹,O)=0; the long exact sequence gives the stated natural vector-space comparison, not a preferred basis of E/k.

4. After a separable splitting extension the chart has one ordinary node and integral normalization, giving geometric integrality and the branch assertion.

5. Use the specified native affine k-linear B/A_q≃E/k and its one-dimensional quadratic normalization defect. This identifies only the affine quotient: the original projective normalization, actual conductor ideal-sheaf, structure-sheaf exact sequence and finite-pushforward H0/H1 steps remain required.

6. Use the specified infinity quotient chart, its coefficient-compatible localization equivalence and homogeneous coordinates. Import generic relative Proj charts/gluing from SF.0 to identify the actual projective cubic with the two-chart pinch and construct the finite normalization morphism. Then identify its conductor ideal sheaf and the actual O_C→ν_*O_P¹→j_*(E/k) sequence before deriving H0/H1; none of these global comparisons follows from an equation on coordinate tuples alone.

7. Use the specified finite/infinity overlap equivalence and homogeneous coordinate compatibility as inputs to the actual SF.0 projective-chart/gluing comparison; these affine facts do not themselves construct the global normalization morphism.

8. Use the specified native glued scheme C, glued source N and actual finite morphism ν with its two cartesian chart restrictions. The native reciprocal infinity map has u=1/t and z=1/(tq), and the curve structure map preserves coefficients. The identifications C with the specified Proj cubic and N with P¹, the normalization universal property, projectivity, conductor ideal sheaf and finite-pushforward H0/H1 remain required; this global chart morphism is not a substitute for those comparisons.

9. For every field k and q=t²+at+b, the specified finite global map ν:N→C is surjective; both schemes are integral, every source stalk is integrally closed, and an actual dense-open Scheme.PartialIso agrees with ν over Spec k. The projective-line and Proj identifications, normalization universal property, projectivity/properness, conductor ideal sheaf, structure-sheaf exact sequence and finite-pushforward H0/H1 remain separate obligations. The I₂ construction and all other inherited gaps remain open; seven stages stay partial and all implementations unchecked.

10. Use the specified all-open section injection and native relative integral factorization of ν. Its section comparison and the affine nonsurjectivity regression keep the source and pinched curve distinct. These facts do not discharge the absolute generic-point normalization, projective-line/Proj, conductor ideal-sheaf exact sequence, finite-pushforward cohomology or independent I₂ obligations.

11. Use the actual generic-point stalk isomorphism and its Spec triangle to form the integral comparison δ from normalization in K_C to N, with both universal-property triangles and uniqueness. Establish that δ is an isomorphism by genuine affine integral-closure comparisons before identifying N as absolute normalization; then still construct P¹/Proj, projectivity, conductor/sheaf and coherent-cohomology inputs. The current integral comparison alone supplies none of those remaining conclusions.

12. Use the actual affine section equivalences in K_C and both restriction laws. Still compare this family with the native normalizationDiagram and normalizationObjIso, including the empty-open branch, and identify the resulting scheme comparison with δ before claiming absolute normalization or its cohomology sequence.

13. Use the actual native-normalization section equivalence θ_U and its comparison Ψ_U with the existing chart source on every nonempty affine U. Identify these section maps with the existing δ map, prove their restriction compatibility and the empty-open branch, and assemble the global scheme identification before the conductor-sheaf and cohomology steps; none of those global conclusions is supplied by section-ring bijectivity alone.

14. Use the actual absolute normalization scheme isomorphism and its inverse over C, together with the actual all-open section algebra equivalences and their inverse restriction law. Continue with the native P¹ and Proj identifications, properness/projectivity, conductor ideal sheaf and structure-sheaf exact sequence, and finite-pushforward H0/H1; the separate I₂ construction and other inherited obligations are unchanged.

15. Use the actual affine common-ideal exact pair and its separate left-injectivity criterion, together with the all-open normalization section conductor/annihilator identities. These section-ring calculations do not identify a sheaf cokernel with sectionwise quotients. Still prove basic-open compatibility, construct the full conductor IdealSheafData and its quotient subschemes, then the sheaf exact sequence and finite-pushforward cohomology comparisons.

**Acceptance beyond the stated contract**

- Over F₂ the proper I₁ pinch has one rational node, genus1 and four rational points.

### Cohomology of the two-component pinch

Target `G.1/quadratic-pinch-i2-genus`. Proposed declaration: `QuadraticPinch.i2_genus`.

Let C pinch P¹_k⊔P¹_k along Spec(E×E)→Spec E, with the two chosen degree2 closed subschemes identified by specified E-isomorphisms. For separable quadratic E/k, C is proper geometrically connected, reduced, with its two rational components fixed over k and two conjugate geometric nodes. H⁰(C,O_C)=k; H¹(C,O_C)≅E/k, hence p_a=1. The incidence identification is part of the input, not equality of the residue fields by name.

**Inputs.** `G.0/global-existence`, `G.1/quadratic-point-proper-pushout`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `SchemeAndStackFoundations:SF.3`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, printed p10, separable-quadratic conductor squares; Proposition3.2, printed p11. Derived consumer proof of the quadratic pinching case; the paper supplies the conductor diagrams and leaves the count computation to the reader.

**Proof outline.**

1. Use the inherited global Ferrand existence: the two closed points lie in a disjoint union of affine neighborhoods, which is affine. Properness follows by the same finite-surjection argument.

2. The normalization quotient sheaf is j_*E, using (x,y)↦x−y from E⊕E modulo the specified diagonal E.

3. The global map k⊕k→E is (c₁,c₂)↦c₁−c₂; its kernel is the diagonal k and its cokernel is E/k. H¹ of each P¹ vanishes.

4. After splitting E, glue corresponding branches in the two components. Each geometric node has branches in different components; Frobenius exchanges the two edges and fixes the component vertices.

**Acceptance beyond the stated contract**

- Over F₂ the specified I₂ pinch has genus1 and six rational points; its two nodes are defined over F₄.

### Field extension and branch action

Target `G.1/quadratic-pinch-splitting`. Proposed declaration: `QuadraticPinch.splitting`.

For a separable quadratic E/k and a field extension K/k, both pinching constructions commute with K-base change via the existing flat-base-change theorem. The new conductor is E⊗_kK. When this is K×K, the one-component pinch is split I₁ and the two-component pinch is split I₂. Otherwise it remains a quadratic field. In the I₂ construction the components are already P¹_k; extending the field splits the nodes, not the component vertices.

**Inputs.** `G.1/quadratic-pinch-i1-genus`, `G.1/quadratic-pinch-i2-genus`, `G.0/flat-base-change`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `SchemeAndStackFoundations:SF.0`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, printed p10, separable-quadratic conductor squares; Proposition3.2, printed p11. Derived consumer proof of the quadratic pinching case; the paper supplies the conductor diagrams and leaves the count computation to the reader.

**Proof outline.**

1. Field extension is flat, so apply the existing four-arrow base-change comparison.

2. Use the imported separable quadratic tensor/Chinese-remainder comparison and track its two projections.

3. For I₁ the two normalization points are identified with one K-rational point. For I₂ each of the two conductor points glues one branch from each specified component.

4. Compare actual normalization and branch schemes with the imported graph carrier; record edge/half-edge actions without assuming trivial Galois action on all incidence data.

**Acceptance beyond the stated contract**

- Base change to F₄ splits both F₂ branch schemes while keeping the I₂ vertices fixed.

### Point counts over every finite extension

Target `G.1/quadratic-extension-counts`. Proposed declaration: `QuadraticPinch.extension_counts`.

For the specified nonsplit I₁ and I₂ pinches over F_q, write Q=q^n with n≥1. Over F_(q^n), the I₁ count is Q+2 for odd n and Q for even n; the I₂ count is 2Q+2 for odd n and 2Q for even n. Counts of a nonreduced schematic fibre with this reduction are identical. These formulas apply to the fixed-component I₂ construction, and make no assertion for component-permuting forms.

**Inputs.** `G.1/quadratic-pinch-splitting`, `G.0/affine-existence`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.3`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, printed p10, separable-quadratic conductor squares; Proposition3.2, printed p11. Derived consumer proof of the quadratic pinching case; the paper supplies the conductor diagrams and leaves the count computation to the reader.

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3 conductor square, complete Proposition3.1–3.2 proofs and adjacent point-count table in arXiv2004.07025v3 HTML. The explicit equation-solution equivalence and count deductions here are authored algebraic consequences of the quadratic chart, not printed source declarations or a scheme normalization/cohomology theorem.

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3 one/two-component conductor diagrams; complete Proposition3.1–3.2 proofs and point-count table, parsed arXiv2004.07025v3 HTML.. These explicit native-equation root and count formulas are checked authored deductions. The printed geometric hypotheses are not weakened; projective pinching, sheaf/cohomology and the two-component I₂ count are separate obligations.

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, printed p10 conductor diagrams; Proposition3.1–3.2, printed pp10–11 and adjacent count table. Authored specialization of existing finite-field theorems to the previously checked quadratic chart; the source gives the geometric conductor/count context, not these every-extension native signatures.

**Proof outline.**

1. E=F_(q²) has no F_(q^n)-points as an F_q-scheme for odd n, and two for even n. Import the standard finite-field embedding criterion.

2. For I₁ use the complement isomorphism: #(P¹\Spec E)+#Spec F_q. This is Q+1−0+1 or Q+1−2+1.

3. For I₂ remove the two copies of Spec E from P¹⊔P¹ and add one Spec E: 2(Q+1)−2e+e where e is0 or2.

4. A field-valued morphism kills nilpotents; import the reduction comparison. At n=1 recover the two inherited Schröer3.2 counts.

5. The separately checked native pointCount_extension_power now proves the odd/even formula for the one-component equation over every actual finite receiving-field algebra; quadratic_root_iff_even and quadraticRootCount_extension_parity supply the native conductor-polynomial criterion. Identify the actual projective pinch and its conductor field with this chart before transporting the count. These facts do not prove I₂ or schematic reduction; the numerical trace defect is only an auxiliary check.

6. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `NeronModelsAndSemistableAbelianVarieties:R11.6`: Supplies the equation-side numerical invariant for the explicit quadratic chart, after its separate geometric/Kodaira identification. This does not supply the missing general scheme-level comparison.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: k is a field; a,b∈k; W is the actual native WeierstrassCurve with coefficient tuple (a,−b,0,0,0); q(t) abbreviates t²+at+b. No separability, perfectness or characteristic restriction. k is finite.

- **H2**: k is a finite field, a,b∈k, q(t)=t²+at+b, W=(a,−b,0,0,0) in the actual native WeierstrassCurve carrier. Require the native quadratic discriminant discrim(1,a,b)=a²−4b to be nonzero. There is no assumption that 2 is invertible. In characteristic two this condition is a≠0; the repeated-root case is deliberately excluded. This is not the Weierstrass discriminant, which is zero for these singular equations.

- **H3**: k is any field, L is a finite field, f:k→L is any unital ring homomorphism, a,b∈k, and discrim(1,a,b)≠0. Use the actual native W_f with coefficient tuple (f(a),−f(b),0,0,0). No characteristic restriction, odd/even degree criterion or geometric identification is assumed.

- **H4**: k and L are fields, L is finite, with the actual native Algebra k L. No separate Finite k assumption is needed: injectivity into L forces it. a,b∈k and q=X²+C(a)X+C(b) is irreducible over k. Use actual Module.finrank k L, native algebraMap, polynomial quotient and WeierstrassCurve; no assumed parity oracle or count data.

- **H5**: k and L are fields, L is finite, with the actual native Algebra k L. No separate Finite k assumption is needed: injectivity into L forces it. a,b∈k and q=X²+C(a)X+C(b) is irreducible over k. Use actual Module.finrank k L, native algebraMap, polynomial quotient and WeierstrassCurve; no assumed parity oracle or count data. For the distinct-root/count/trace formulas require discrim(1,a,b)=a²−4b≠0 explicitly. No inversion of2 or characteristic restriction; this is the quadratic discriminant, not the vanishing Weierstrass discriminant.

- `QuadraticPinch.affine_card_balance` (compatibility; assumptions H1): For a finite field k of size Q, Nat.card of the native affine equation-solution subtype plus Nat.card{t∈k:q(t)=0} equals Q+1.

- `QuadraticPinch.pointCount_balance` (compatibility; assumptions H1): For a finite field k and W=(a,−b,0,0,0), W.pointCount+Nat.card{t∈k:q(t)=0}=Nat.card k+2.

- `QuadraticPinch.frobeniusTrace_roots` (compatibility; assumptions H1): For a finite field k and W=(a,−b,0,0,0), W.frobeniusTrace=(Nat.card{t∈k:q(t)=0}:ℤ)−1.

- `QuadraticPinch.quadraticRootCount_branch` (compatibility; assumptions H2): Nat.card{t∈k:q(t)=0} is2 if q has a k-root and0 otherwise. Counts are of distinct elements of the native equation subtype, not multiset multiplicity.

- `QuadraticPinch.pointCount_branch` (compatibility; assumptions H2): W.pointCount=Nat.card(k) when q has a k-root, and Nat.card(k)+2 when it has none, with the singular origin and the infinity point both included.

- `QuadraticPinch.frobeniusTrace_branch` (compatibility; assumptions H2): W.frobeniusTrace=1 when q has a k-root and−1 when it has none. This is the existing integer count defect on a singular model, not an elliptic/cohomological trace claim.

- `QuadraticPinch.pointCount_field_map` (compatibility; assumptions H3): For any unital field homomorphism f:k→L with L finite, W_f=(f(a),−f(b),0,0,0) has pointCount=Nat.card(L) if t²+f(a)t+f(b) has a root in L, and Nat.card(L)+2 otherwise. No separate source-finiteness assumption is required in the signature; injectivity and receiving-field finiteness imply source finiteness.

- `QuadraticPinch.quadratic_root_iff_even` (compatibility; assumptions H4): For irreducible q=X²+C(a)X+C(b) over k and finite field L with a k-algebra structure, there exists t∈L with t²+algebraMap(a)t+algebraMap(b)=0 if and only if 2 divides Module.finrank(k,L).

- `QuadraticPinch.quadraticRootCount_extension_parity` (compatibility; assumptions H5): Under irreducibility of q and nonzero quadratic discriminant, the native subtype {t∈L:t²+algebraMap(a)t+algebraMap(b)=0} has Nat.card2 when 2 divides Module.finrank(k,L), and0 otherwise.

- `QuadraticPinch.pointCount_extension_parity` (compatibility; assumptions H5): For W_L=(algebraMap(a),−algebraMap(b),0,0,0), under irreducibility and nonzero quadratic discriminant, W_L.pointCount is Nat.card(L) for even Module.finrank(k,L), and Nat.card(L)+2 for odd degree, including singular origin and infinity.

- `QuadraticPinch.pointCount_extension_power` (compatibility; assumptions H5): For the same actual W_L and hypotheses, W_L.pointCount equals Nat.card(k)^Module.finrank(k,L) when the degree is even, and this power plus2 when it is odd.

- `QuadraticPinch.frobeniusTrace_extension_parity` (compatibility; assumptions H5): For the same actual W_L and hypotheses, W_L.frobeniusTrace is1 for even Module.finrank(k,L) and−1 for odd degree. This is the existing integer count defect on a singular equation, without a cohomological or elliptic trace assertion.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.affine_card_balance.test_distinct_double_root`: Over F₂ the subtype t²=0 has cardinality one, although the conductor algebra k[t]/t² has length two.

- `QuadraticPinch.pointCount_balance.test_three_forms`: Over F₂, the native models with tuples (1,0,0,0,0),(1,1,0,0,0),(0,0,0,0,0) have pointCount2,4,3 respectively, including the origin and infinity.

- `QuadraticPinch.frobeniusTrace_roots.test_three_forms`: The same three native F₂ models have frobeniusTrace1,−1,0 respectively.

- `QuadraticPinch.quadraticRootCount_branch.test_binary_split`: Over F₂, q=t²+t has exactly2 distinct roots; the checked branch proof works without inverting2.

- `QuadraticPinch.quadraticRootCount_branch.test_binary_nonsplit`: Over F₂, q=t²+t+1 has0 roots, despite the same nonzero quadratic discriminant.

- `QuadraticPinch.pointCount_branch.test_odd_split`: Over F₃, W=(0,1,0,0,0), so q=t²−1, has native pointCount3; two roots yield the split value, not the nonsingular-locus count.

- `QuadraticPinch.frobeniusTrace_branch.test_odd_nonsplit`: Over F₃, W=(0,−1,0,0,0) has q=t²+1 with no root and native frobeniusTrace−1.

- `QuadraticPinch.frobeniusTrace_branch.test_repeated_excluded`: Over F₃, q=t²+t+1 has quadratic discriminant0 and one distinct repeated root; W=(1,−1,0,0,0) has frobeniusTrace0, so the nonzero-discriminant hypothesis is necessary.

- `QuadraticPinch.pointCount_field_map.test_identity`: For the identity field homomorphism, the receiving-field count formula is exactly the native source formula, with a and b unchanged.

- `QuadraticPinch.quadratic_root_iff_even.test_binary_odd_no_root`: For the actual native degree-three extension of ZMod2, t²+t+1 has no root.

- `QuadraticPinch.quadraticRootCount_extension_parity.test_binary_even_two_roots`: In the actual native degree-two extension of ZMod2, the distinct-root subtype for t²+t+1 has cardinality2.

- `QuadraticPinch.pointCount_extension_power.test_binary_degree1`: For the actual native degree1 extension of ZMod2, the model (1,−1,0,0,0) has pointCount4.

- `QuadraticPinch.pointCount_extension_power.test_binary_degree2`: For the actual native degree2 extension of ZMod2, the model (1,−1,0,0,0) has pointCount4.

- `QuadraticPinch.pointCount_extension_power.test_binary_degree3`: For the actual native degree3 extension of ZMod2, the model (1,−1,0,0,0) has pointCount10.

- `QuadraticPinch.pointCount_extension_power.test_odd_characteristic_even_degree`: In the actual native degree-two extension of ZMod3, the model (0,−1,0,0,0) has pointCount9.

- `QuadraticPinch.frobeniusTrace_extension_parity.test_binary_even_trace`: In the actual native degree-two extension of ZMod2, the model (1,−1,0,0,0) has native numerical trace defect1.

**Acceptance beyond the stated contract**

- For q=2,n=1 the counts are4 and6; for n=2 they are4 and8.

### Polynomial normal forms over a quadratic

Target `G.1/quadratic-normal-form-exists`. Proposed declaration: `QuadraticPinch.exists_normal_form`.

For every field k, a,b∈k and h∈k[t], put q=t²+at+b. There exist P,Q∈k[t] with h=P(q)+tQ(q). No separability, irreducibility or characteristic restriction is imposed.

**Inputs.** `mathlib:Polynomial.add_modByMonic`, `mathlib:Polynomial.self_mul_modByMonic`, `mathlib:Polynomial.modByMonic_eq_self_iff`, `mathlib:Polynomial.degree_C_le`, `mathlib:Polynomial.degree_eq_natDegree`, `mathlib:Polynomial.degree_C_mul_X`, `mathlib:Polynomial.induction_on`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, printed pp10–11, the conductor squares and Proposition 3.2; derived affine polynomial adapter. The actual affine quotient-preimage chart is derived from the source conductor construction. These polynomial remainder lemmas are library-based proof refinements, not separately numbered statements in Schröer.

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, printed pp9–11, conductor squares and Proposition3.2. Derived coordinate adapters for the already owned quadratic affine pinch. These polynomial normal-form lemmas are not presented as printed statements of Schröer.

**Proof outline.**

1. Use the native Polynomial.induction_on: constants have the pair (C(c),0), and addition adds the two pairs.

2. For multiplication by t, send (P,Q) to ((t−b)Q,P−aQ). Substitution and t²=q−at−b verify the identity in k[t].

3. This is a specialized coordinate decomposition of existing Polynomial, not a replacement polynomial, quotient or power-basis carrier.

4. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-algebra`: Compute the exact residue on a normal-form representative. `G.1/quadratic-pinch-algebra`: Compare the remainder of f*t with a scalar. `G.1/quadratic-pinch-algebra`: A conductor element f=c+qh has f*t in A_q, forcing the surviving linear coefficient c to vanish.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: k is a field, q is monic with natural degree exactly two. No separability, irreducibility, perfectness or characteristic restriction is imposed.

- `QuadraticPinch.constant_remainder` (compatibility; assumptions H1): For c∈k and h∈k[t], the native monic remainder of C(c)+qh modulo q is C(c).

- `QuadraticPinch.linear_remainder` (compatibility; assumptions H1): For every c∈k, the native remainder of C(c)*t modulo q is C(c)*t.

- `QuadraticPinch.normal_form_degrees` (compatibility): For a field k and q,P,Q∈k[t] with natDegree(q)=2 and Q≠0, natDegree(P(q))=2 natDegree(P) and natDegree(tQ(q))=2 natDegree(Q)+1. The first equality includes P=0, where native natDegree(0)=0.

- `QuadraticPinch.normal_form_injective` (compatibility): For a field k and q∈k[t] with natDegree(q)=2, the actual function (P,Q)↦P(q)+tQ(q) from k[t]×k[t] to k[t] is injective.

The packet attaches the exact source and proof-input list to each API contract.

**Acceptance beyond the stated contract**

- The pair update remains valid for q=t² and for q=t²+t+1 over F₂.

### Canonical linear equivalence for a quadratic pinch

Target `G.1/quadratic-pinch-coordinates`. Proposed declaration: `QuadraticPinch.coordinates`.

For every field k and a,b∈k, define e_(a,b):(k[t]×k[t])≃ₗ[k]A_(t²+at+b) as native LinearEquiv.ofBijective of the actual coordinateMap and its bijectivity proof. Its inverse assigns to f the unique polynomial pair (P,Q) with f=P(q)+tqQ(q). This is only a k-linear equivalence; componentwise pair multiplication is not transported unchanged.

**Inputs.** `G.1/quadratic-normal-form-exists`, `G.1/quadratic-pinch-algebra`, `mathlib:Polynomial.aeval`, `mathlib:Polynomial.aeval_subalgebra_coe`, `mathlib:Polynomial.comp_eq_aeval`, `mathlib:LinearEquiv.ofBijective`, `mathlib:LinearEquiv.ofBijective_apply`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, printed pp9–11, conductor squares and Proposition3.2. Derived coordinate adapters for the already owned quadratic affine pinch. These polynomial normal-form lemmas are not presented as printed statements of Schröer.

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, printed p10 conductor squares and Proposition3.2, p11; v3 HTML corresponding conductor paragraphs and full displayed Prop3.1–3.2 proofs freshly read. Derived affine coordinate/Basis adapters for the already owned quadratic pinch. These are not attributed as printed lemmas or as a proof of the global curve comparison.

**Proof outline.**

1. Apply the existing LinearEquiv.ofBijective to M and the previous bijectivity theorem. No separately axiomatized inverse, new module structure or separability predicate is introduced.

2. ofBijective_apply gives the ambient formula e(P,Q)=P(q)+tqQ(q). Apply that formula to e⁻¹(f), then the native inverse law, to reconstruct f.

3. Native left and right inverse laws make the coordinates unique. For q=t², e(0,1)=t³, while e((0,1)²)=t³ differs from e(0,1)²=t⁶; the construction cannot be strengthened to a product AlgEquiv.

4. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-algebra`: Supply the full native vector-space basis and degree-family part of the preserved generation statement. `G.1/quadratic-pinch-algebra`: Give unique affine coefficients of the specialized normal remainder; bivariate division/kernel still require their separate proof.

**API.**

- `QuadraticPinch.pinch_normal_form_injective` (compatibility): For a field k and q∈k[t] with natDegree(q)=2, the actual function (P,Q)↦P(q)+tqQ(q) from k[t]×k[t] to k[t] is injective.

- `QuadraticPinch.quadratic_natDegree` (simp): natDegree(t²+at+b)=2 over every field, including a=b=0 and characteristic2.

- `QuadraticPinch.coordinateMap_coe` (characterisation): The ambient polynomial of M_(a,b)(P,Q) is P(q)+tqQ(q).

- `QuadraticPinch.coordinateMap_bijective` (compatibility): For every field k and a,b∈k, the actual k-linear map M_(a,b):(k[t]×k[t])→A_(t²+at+b) is bijective. There is no separability or characteristic hypothesis.

- `QuadraticPinch.coordinateMap` (constructor): For any field k and a,b∈k, put q=t²+at+b and A_q={f∈k[t]:f mod q is scalar}, the existing native Subalgebra. Define the actual k-linear map M_(a,b):k[t]×k[t]→A_q by (P,Q)↦P(q)+tqQ(q). The product has its ordinary componentwise k-module structure. This is a linear map, not an algebra homomorphism.

- `QuadraticPinch.coordinates_coe` (characterisation): For q=t²+at+b, the ambient value of e(P,Q) is P(q)+tqQ(q).

- `QuadraticPinch.coordinates_symm_normal_form` (characterisation): If (P,Q)=e⁻¹(f), the actual ambient polynomial f is P(q)+tqQ(q). The inverse is the unique normal-form coordinate assignment.

- `QuadraticPinch.coordinates_unique` (characterisation): For any native f∈A_q and pair (P,Q), f=P(q)+tqQ(q) iff e⁻¹(f)=(P,Q).

- `QuadraticPinch.basis_inl` (simp): For all n≥0, the ambient image of b(inl n) is q^n; n=0 gives1.

- `QuadraticPinch.basis_inr` (simp): For all n≥0, the ambient image of b(inr n) is tq^(n+1); n=0 gives tq.

- `QuadraticPinch.basis_repr` (compatibility): For any field k, a,b∈k, f∈A_(t²+at+b) and n≥0, put (P,Q)=e_(a,b)⁻¹(f). The actual native basis representation satisfies b.repr(f)(inl n)=P.coeff(n) and b.repr(f)(inr n)=Q.coeff(n). This is an equality of the existing finitely supported representation coordinates, not a freely chosen coefficient map.

- `QuadraticPinch.basis_reconstruction` (characterisation): Finsupp.linearCombination k b (b.repr f)=f in the actual subalgebra, for every f.

- `QuadraticPinch.basis_degrees` (characterisation): The natural degrees of the ambient basis vectors are2n and2(n+1)+1. All n, including0, are allowed; q is nonzero.

- `QuadraticPinch.basis` (constructor): For every field k and q=t²+at+b, construct an actual native Module.Basis (ℕ⊕ℕ) k A_q by mapping the product of the two native polynomial monomial bases through e_(a,b). The vectors are b(inl n)=q^n and b(inr n)=tq^(n+1). Thus the left index0 is1, the positive left indices have degrees2,4,…, and the right indices have degrees3,5,… . This is a basis of the existing subalgebra as a k-vector space, not a k[q]-module instance or a mere spanning-family assertion.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.test_map_zero`: M_(a,b)(0,0)=0 for arbitrary a,b over any field.

- `QuadraticPinch.test_map_char2_generators`: For k=F₂ and q=t²+t+1, M(t,0)=q and M(0,1)=tq as actual polynomials.

- `QuadraticPinch.test_map_not_identity`: For q=t² over any field, M(t,0)=t²≠t. The first coordinate evaluates at q, not at t.

- `QuadraticPinch.test_coordinates_inseparable`: Over F₂ at q=t², e⁻¹(e(P,Q))=(P,Q) for every pair of actual polynomials.

- `QuadraticPinch.test_basis_unit_zero`: For q=t² over any field, the left index0 basis vector is1 and e⁻¹(0)=(0,0).

- `QuadraticPinch.test_coordinates_not_multiplicative`: For q=t² over any field, e((0,1)·(0,1))=t³ differs from e(0,1)·e(0,1)=t⁶. The equivalence is linear and not multiplicative for the native componentwise product.

- `QuadraticPinch.test_basis_cusp`: For q=t² over any field, b(inl n)=t^(2n) and b(inr n)=t^(2n+3) for every n.

- `QuadraticPinch.test_basis_char2_cross_term`: For k=F₂ and q=t²+t+1, the actual ambient b(inl1) has coefficient1 at t. Absence of a degree1 basis vector does not mean all degree1 coefficients vanish.

- `QuadraticPinch.test_basis_no_degree_one`: For every a,b over any field and every i∈ℕ⊕ℕ, the actual ambient b(i) has natural degree unequal to1.

**Acceptance beyond the stated contract**

- Round-trip arbitrary P,Q over F₂ at q=t²; multiplication of the second unit violates the product algebra formula.

### Canonical hypersurface algebra isomorphism

Target `G.1/quadratic-pinch-quotient-equivalence`. Proposed declaration: `QuadraticPinch.presentationEquiv`.

For every field k and a,b∈k, construct the actual k-algebra equivalence k[U,V]/Ideal.span{F_(a,b)}≅A_q induced by U↦q,V↦tq. It preserves the given inclusion into k[t] and remains valid for split, repeated-root and inseparable quadratics.

**Hypotheses.** k is any field; a,b∈k; q=t²+at+b and A_q is the already owned scalar-preimage Subalgebra of k[t]. No perfectness, separability, irreducibility or characteristic assumption is imposed. Use native MvPolynomial(Fin2,k), Polynomial(k[U]), native ideals/quotients and algebra maps. Coordinate0 is U=q,coordinate1 is V=tq. The transport places V in the outer polynomial variable and U in its coefficient ring. No projective completion or node/cohomology property is asserted.

**Inputs.** `mathlib:MvPolynomial.renameEquiv`, `mathlib:MvPolynomial.finSuccEquiv`, `mathlib:MvPolynomial.uniqueAlgEquiv`, `mathlib:Polynomial.mapAlgEquiv`, `mathlib:MvPolynomial.rename_X`, `mathlib:MvPolynomial.finSuccEquiv_X_succ`, `mathlib:MvPolynomial.finSuccEquiv_X_zero`, `G.1/quadratic-pinch-algebra`, `mathlib:MvPolynomial.aeval`, `mathlib:Polynomial.eval₂AlgHom`, `mathlib:MvPolynomial.algHom_ext`, `mathlib:Polynomial.eval₂_C`, `mathlib:Polynomial.eval₂_X`, `mathlib:Polynomial.natDegree_modByMonic_lt`, `mathlib:Polynomial.eq_X_add_C_of_natDegree_le_one`, `G.1/quadratic-pinch-coordinates`, `mathlib:Polynomial.modByMonic_add_div`, `mathlib:Polynomial.modByMonic_eq_zero_iff_dvd`, `mathlib:Polynomial.eval₂_add`, `mathlib:Polynomial.eval₂_mul`, `mathlib:Polynomial.comp_eq_aeval`, `mathlib:MvPolynomial.aeval_range`, `mathlib:Matrix.range_cons_cons_empty`, `mathlib:RingHom.mem_ker`, `mathlib:Ideal.mem_span_singleton`, `mathlib:AlgHom.codRestrict`, `mathlib:AlgHom.coe_codRestrict`, `mathlib:Ideal.quotientEquivAlgOfEq`, `mathlib:Ideal.quotientEquivAlgOfEq_mk`, `mathlib:Ideal.quotientKerAlgEquivOfSurjective`, `mathlib:Ideal.quotientKerAlgEquivOfSurjective_mk`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3 conductor squares preceding Propositions3.1–3.2; complete displayed proofs of3.1–3.2 in v3 HTML. Source motivation for the quadratic affine pinching chart. The monic-division, kernel and quotient comparisons below are explicit algebraic deductions from the named pinned library and inherited normal-form declarations, not printed source lemmas or a global curve comparison.

**Proof outline.**

1. Identify the source principal ideal with the actual kernel of the restricted map. Transport along native equal-ideal quotient equivalence.

2. Apply the native algebra first-isomorphism theorem to the proved surjective map into A_q, then compose. The resulting map is an algebra equivalence, not merely a vector-space bijection.

3. Its native quotient-class formula sends every class[f] to ψ_A(f); the inverse and generator equations follow from the actual equivalence laws.

4. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-algebra`: Supplies the actual affine full-kernel/range/quotient comparison for the existing quadratic pinching chart; its repeated-root and characteristic-two forms retain the same source ideal. `G.1/quadratic-pinch-algebra`: Makes the hypersurface/normal-form algebra comparison available to the distinct finite normalization and fraction-field interfaces; it does not prove those interfaces.

**API.**

- `QuadraticPinch.inV_U` (compatibility): The V-coordinate chart sends U to C(U), not to the outer variable V.

- `QuadraticPinch.inV_V` (compatibility): The V-coordinate chart sends V to the outer polynomial variable V.

- `QuadraticPinch.inV_relation` (compatibility): For all a,b, e(F_(a,b))=V²+C(aU)V+C(bU²−U³) in the actual polynomial ring k[U][V].

- `QuadraticPinch.inV` (constructor): Use the existing native algebra equivalences to construct e:k[U,V]≅k[U][V] with e(U)=C(U) and e(V)=V. Swap the two Fin2 indices before finSuccEquiv, then map the native one-variable coefficient equivalence. This is a coordinate-convention adapter on existing carriers, not a new general polynomial construction.

- `QuadraticPinch.substitution_relation` (compatibility): For all a,b, ψ_(a,b)(F_(a,b))=0.

- `QuadraticPinch.substitution_inV` (compatibility): For every f∈k[U,V], ψ(f)=eval₂(aeval_q,tq)(e(f)) in k[t]. The coefficient homomorphism evaluates U at q and the outer variable at tq.

- `QuadraticPinch.substitution_range` (compatibility): For all a,b, the actual range Subalgebra of ψ_(a,b) is A_q.

- `QuadraticPinch.substitution_ker` (compatibility): For all a,b, ker(ψ_(a,b))=Ideal.span{F_(a,b)} in k[U,V].

- `QuadraticPinch.substitution` (constructor): Define ψ_(a,b):k[U,V]→k[t] as the native algebra evaluation at U=q and V=tq, where q=t²+at+b. This uses the existing multivariable evaluation homomorphism.

- `QuadraticPinch.inV_relation_monic` (compatibility): For every a,b, the native polynomial e(F_(a,b)) is monic as a polynomial in V over k[U].

- `QuadraticPinch.inV_relation_natDegree` (compatibility): For every a,b, e(F_(a,b)) has native natural V-degree2, including characteristic2 and a=b=0.

- `QuadraticPinch.inV_remainder_normal_form` (compatibility): For every H∈k[U][V], division by e(F) leaves a remainder C(P)+V C(Q) for some actual P,Q∈k[U]. This includes the zero remainder.

- `QuadraticPinch.quadratic_natDegree` (compatibility): For every field k and a,b∈k, t²+at+b has native natural degree2. This promotes the already planned coordinate-map API consumed by the full-kernel proof.

- `QuadraticPinch.substitution_eq_zero_iff_dvd` (compatibility): For every f∈k[U,V], ψ(f)=0 iff F_(a,b) divides f in the actual multivariable polynomial ring. No separability or characteristic restriction is used.

- `QuadraticPinch.substitutionToAlgebra_coe` (compatibility): For every f, the inclusion of ψ_A(f) in k[t] is ψ(f).

- `QuadraticPinch.substitutionToAlgebra_surjective` (compatibility): For all a,b the actual ψ_A:k[U,V]→A_q is surjective.

- `QuadraticPinch.substitutionToAlgebra_ker` (compatibility): The native kernel of ψ_A is the principal ideal generated by F_(a,b).

- `QuadraticPinch.substitutionToAlgebra` (constructor): Restrict ψ_(a,b) to a native k-algebra homomorphism ψ_A:k[U,V]→A_q using the proven exact range. The target is the existing Subalgebra, not an abstract replacement.

- `QuadraticPinch.presentationEquiv_mk` (characterisation): For every representative f, the ambient polynomial of the quotient equivalence on[f] is ψ(f).

- `QuadraticPinch.presentationEquiv_symm_substitution` (characterisation): The inverse sends ψ_A(f) to the exact native quotient class[f].

- `QuadraticPinch.presentationEquiv_generators` (simp): The native classes[U] and[V] map to q and tq, respectively.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.inV.test_cusp`: At a=b=0 the transported equation is V²−C(U³).

- `QuadraticPinch.inV.test_char2_cross_term`: Over F₂ at a=b=1, the coefficient of U in the V coefficient is1; the UV term survives.

- `QuadraticPinch.inV.test_orientation`: The transported U and V are distinct: their outer V coefficients are0 and1. This rejects reversing the chosen variable order.

- `QuadraticPinch.substitution.test_zero`: The actual substitution sends the zero polynomial to0 for all parameters.

- `QuadraticPinch.substitution.test_char2_generators`: Over F₂ at a=b=1, U maps to t²+t+1 and V to t(t²+t+1).

- `QuadraticPinch.substitution.test_cubic_essential`: At a=b=0 the image of V² is nonzero t⁶. Killing V² alone or dropping U³ changes the kernel.

- `QuadraticPinch.substitutionToAlgebra.test_zero`: The restricted substitution sends0 to0 for any parameters.

- `QuadraticPinch.substitutionToAlgebra.test_inseparable_cubic`: Over F₂ at q=t², its actual image of V is t³, including the inseparable/repeated-root case.

- `QuadraticPinch.substitutionToAlgebra.test_scalar`: Every scalar C(c) maps to that same constant in the existing subalgebra.

- `QuadraticPinch.presentationEquiv.test_zero`: The actual quotient algebra equivalence sends0 to0.

- `QuadraticPinch.presentationEquiv.test_cusp_product`: At q=t², the actual image of[V]² is t⁶. This checks multiplicative compatibility in the quotient.

- `QuadraticPinch.presentationEquiv.test_nonzero_unit_coordinate`: At q=t² the class[U] is nonzero. The kernel is not the maximal ideal (U,V).

- `QuadraticPinch.presentationEquiv.test_char2_inseparable`: Over F₂ at q=t², the inverse of ψ_A(V²) is exactly the native class[U³], using the source principal relation ideal.

### Native affine solutions are an optional nonroot parameter

Target `G.1/quadratic-pinch-affine-param-equiv`. Proposed declaration: `QuadraticPinch.affineParamEquiv`.

For every field k and a,b∈k, construct an equivalence between the native subtype of pairs (x,y) satisfying W.toAffine.Equation(x,y) and Option of the subtype of t∈k with q(t)≠0. The origin maps to none; a solution with x≠0 maps to some(y/x); inverse some(t) is (q(t),tq(t)).

**Hypotheses.** k is a field; a,b∈k; W is the actual native WeierstrassCurve with coefficient tuple (a,−b,0,0,0); q(t) abbreviates t²+at+b. No separability, perfectness or characteristic restriction.

**Inputs.** `mathlib:WeierstrassCurve.Affine.equation_iff`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3 conductor square, complete Proposition3.1–3.2 proofs and adjacent point-count table in arXiv2004.07025v3 HTML. The explicit equation-solution equivalence and count deductions here are authored algebraic consequences of the quadratic chart, not printed source declarations or a scheme normalization/cohomology theorem.

**Proof outline.**

1. The parametrized pair is a solution by parameter_equation; the inverse at none is the origin.

2. Split the forward map on x=0. affine_zero_x proves the entire pair is the origin. For x≠0, parameter_recovery proves q(y/x)=x and certifies the recovered parameter is a nonroot.

3. Check both inverse laws using cancellation by x or q(t), respectively. The Option tag replaces an origin/nonroot sum without a new point carrier.

4. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-extension-counts`: Supplies the exact one-component native count calculation. The arbitrary finite-extension adapter, geometric fiber comparison and the separate two-component I₂ case still need their own proofs.

**API.**

- `QuadraticPinch.parameter_equation` (compatibility): For any field k and a,b,t∈k, put q(t)=t²+at+b and W=(a,−b,0,0,0). Then W.toAffine.Equation(q(t),tq(t)).

- `QuadraticPinch.affine_zero_x` (compatibility): For any field k and a,b,y∈k, W.toAffine.Equation(0,y) implies y=0.

- `QuadraticPinch.parameter_recovery` (compatibility): For any field k and a,b,x,y∈k with W.toAffine.Equation(x,y) and x≠0, q(y/x)=x.

- `QuadraticPinch.affineParamEquiv_origin` (simp): The origin maps to none.

- `QuadraticPinch.affineParamEquiv_symm_none` (characterisation): The underlying pair of the inverse at none is (0,0).

- `QuadraticPinch.affineParamEquiv_symm_some` (characterisation): The underlying pair of the inverse at some(t) is exactly (q(t),tq(t)).

- `QuadraticPinch.affineParamEquiv_nonzero` (characterisation): For a solution with x≠0, mapping Subtype.val over the Option output gives some(y/x).

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.affineParamEquiv.test_origin`: For arbitrary rational a,b, the native origin maps to none.

- `QuadraticPinch.affineParamEquiv.test_nonsplit`: Over F₂ for q=t²+t+1, inverse some(0) is the actual pair (1,0).

- `QuadraticPinch.affineParamEquiv.test_cusp`: Over F₂ for q=t², inverse some(1) is (1,1); the repeated-root origin remains a separate none output.

### Polynomial pinch away from its divisor

Target `G.1/quadratic-pinch-localization`. Proposed declaration: `QuadraticPinch.away_bijective`.

For every field k and polynomial q, the actual inclusion A_q→k[X] induces a bijection A_q[1/q]→k[X][1/q], for any native localization carriers. This holds for every q, including zero, units, inseparable, reducible and irreducible polynomials; quadratic normalization consumers retain their separate monic degree-two hypotheses.

**Inputs.** `G.1/quadratic-pinch-algebra`, `G.0/subring-conductor`.

**Source and scope.**

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem5.1, printed p568, complete principal-localization paragraph, with Lemma1.3(b) and its converse, pp556–557. Native localization adapter for the common ideal. No injectivity of the original map or domain hypothesis is assumed.

**Proof outline.**

1. The promoted membership criterion gives q∈A_q and qh∈A_q for every h∈k[X]. Thus q is in the general ambient conductor, without needing to identify the whole conductor with(q).

2. Apply conductor-away-bijective to the actual underlying subring and its subtype inclusion.

**Unit-test contracts.**

- `QuadraticPinch.away_bijective.split`: For q=X²−1 over Q, the actual pinch inclusion induces a bijection on any native localizations at q.

- `QuadraticPinch.away_bijective.irreducible`: For q=X²+X+1 over F₂, the same actual localization map is bijective; no rational conductor root is assumed.

- `QuadraticPinch.away_bijective.cusp`: For q=X² over F₂, the actual localization map is bijective despite the inseparability and cusp.

- `QuadraticPinch.away_bijective.zero`: For q=0 over F₂, the actual localization map is still bijective on any native localization carriers. This does not assert a nonempty open complement.

**Acceptance beyond the stated contract**

- The split quadratic over Q, irreducible quadratic over F₂, inseparable cusp polynomial over F₂ and q=0 all satisfy the same native localization statement.

### Recover the polynomial coordinate

Target `G.1/quadratic-pinch-localization-generator`. Proposed declaration: `QuadraticPinch.away_inverse_generator`.

For every field k and polynomial q, let E_q be the native RingEquiv.ofBijective of the actual localized pinch inclusion using quadratic-pinch-localization. Its inverse sends the ambient localized polynomial coordinate [X] to the actual fraction(qX)/q in A_q[1/q]. Both numerator and denominator are actual elements of A_q with membership witnesses. No monicity, separability, degree or nonzero hypothesis is used.

**Inputs.** `G.1/quadratic-pinch-localization`, `G.1/quadratic-pinch-algebra`, `mathlib:RingEquiv.ofBijective`, `mathlib:RingEquiv.ofBijective_apply`, `mathlib:RingEquiv.apply_symm_apply`, `mathlib:IsLocalization.map_mk'`, `mathlib:IsLocalization.eq_mk'_iff_mul_eq`.

**Source and scope.**

- [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem5.1, printed p568, complete principal-localization paragraph, with Lemma1.3(b) and its converse, pp556–557. Native localization adapter for the common ideal. No injectivity of the original map or domain hypothesis is assumed.

**Proof outline.**

1. Construct the native equivalence directly from the specified localized inclusion and its proved bijectivity. The promoted membership criterion supplies the numerator qX and denominator q as actual subtype elements.

2. Apply the equivalence’s injectivity and inverse law. Native map_mk′ and eq_mk′_iff_mul_eq reduce the asserted inverse formula to Xq=qX in the ambient ring.

**Acceptance beyond the stated contract**

- This recovers the affine coordinate on the complement, including the cusp, without asserting that the original inclusion is surjective.

### Integral closure in the shared fraction field

Target `G.1/quadratic-pinch-integral-closure`. Proposed declaration: `QuadraticPinch.integral_closure`.

For monic quadratic q and a native polynomial fraction field K, k[X] is the actual native IsIntegralClosure of A_q in K, with its given inclusion into K.

**Hypotheses.** k is any field. A_q is the existing scalar-preimage Subalgebra of k[X], with its native subtype inclusion and restricted multiplication action. No separability, irreducibility, perfectness or characteristic restriction is imposed. q is monic with native natural degree exactly two. K is a field with the actual polynomial algebra map and IsFractionRing k[X] K; all A_q actions are canonical restrictions.

**Inputs.** `G.1/quadratic-pinch-algebra`, `mathlib:IsFractionRing.of_field`, `mathlib:IsFractionRing.div_surjective`, `mathlib:Subalgebra.algebraMap_eq`, `mathlib:Algebra.IsIntegral.of_finite`, `mathlib:IsIntegralClosure.of_isIntegrallyClosed`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, printed p10, one-component conductor diagram and adjoining normalization discussion; affine algebraic deductions at its already owned quadratic chart. The native finite module, shared fraction field and integral-closure comparisons are authored affine deductions. The source motivates the normalization chart; it does not print these polynomial signatures or certify the projective/cohomological comparison.

**Proof outline.**

1. The finite normalization module makes k[X] integral over A_q through the existing finite-algebra instance. The polynomial ring over a field is integrally closed by the pinned polynomial normality instance. Apply the existing IsIntegralClosure.of_isIntegrallyClosed for the actual tower. The shared-fraction-field lemma identifies K as the fraction field of the smaller ring as well. This is an affine ring normalization comparison; the projective normalization comparison remains required.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-algebra`: Provide the actual finite affine normalization carrier and its maps, retaining the separate projective-chart and scheme-normalization obligations. `G.1/quadratic-pinch-i1-genus`: Supply the normalization-side finite inclusion before conductor ideal-sheaf and finite-pushforward cohomology comparisons.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: k is any field. A_q is the existing scalar-preimage Subalgebra of k[X], with its native subtype inclusion and restricted multiplication action. No separability, irreducibility, perfectness or characteristic restriction is imposed. q≠0. This general fraction-field or module-relation statement is not restricted to quadratics. K is a field with the given Algebra k[X] K and IsFractionRing k[X] K; the A_q structure is the native restricted one, not an independent Algebra instance.

- **H2**: k is any field. A_q is the existing scalar-preimage Subalgebra of k[X], with its native subtype inclusion and restricted multiplication action. No separability, irreducibility, perfectness or characteristic restriction is imposed. q is monic with native natural degree exactly two. K is a field with the given Algebra k[X] K and IsFractionRing k[X] K.

- **H3**: k is any field. A_q is the existing scalar-preimage Subalgebra of k[X], with its native subtype inclusion and restricted multiplication action. No separability, irreducibility, perfectness or characteristic restriction is imposed. q≠0. This general fraction-field or module-relation statement is not restricted to quadratics.

- `QuadraticPinch.fraction_ring` (compatibility; assumptions H1): For every nonzero polynomial q and every native fraction field K of k[X], K with the canonical restricted A_q algebra structure is also an actual native fraction field of A_q.

- `QuadraticPinch.integral_iff_polynomial` (compatibility; assumptions H2): For monic quadratic q and z in any native polynomial fraction field K, z is integral over A_q if and only if z is the image of an actual polynomial in k[X].

- `QuadraticPinch.fractionEquiv_algebraMap` (compatibility; assumptions H3): For a∈A_q, E_q maps its image in Frac(A_q) to the image of its actual ambient polynomial in Frac(k[X]).

- `QuadraticPinch.fractionEquiv_symm_algebraMap` (compatibility; assumptions H3): For a∈A_q, E_q⁻¹ maps the image of its actual ambient polynomial back to its image in Frac(A_q).

- `QuadraticPinch.fractionEquiv_symm_X` (compatibility; assumptions H3): E_q⁻¹ sends the image of X to the fraction with numerator qX∈A_q and denominator q∈A_q, using their actual scalar-plus-q-multiple membership witnesses.

- `QuadraticPinch.fractionEquiv` (constructor; assumptions H3): For every nonzero q∈k[X], construct the canonical native A_q-algebra equivalence E_q:Frac(A_q)≃Frac(k[X]) using FractionRing.algEquiv and the proved shared-fraction-field instance. The receiving action is the native restriction of the polynomial action, and the maps commute with the actual inclusion.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.normalization.integral_coordinate`: For monic quadratic q, the image of X in the native fraction field of k[X] is integral over the actual A_q.

- `QuadraticPinch.fractionEquiv.cusp`: For q=X² over F₂ and arbitrary a∈A_q, E_q sends the native image of a to the fraction-field image of its actual ambient polynomial.

- `QuadraticPinch.fractionEquiv.unit`: For q=1 and arbitrary a∈A_1, E_1⁻¹ sends the image of its ambient polynomial back to the native image of a.

- `QuadraticPinch.fractionEquiv.fractions`: For every nonzero q and arbitrary a,b∈A_q, E_q sends the native quotient a/b to the quotient of their actual polynomial images; zero b is allowed by the field division convention.

### The comparison B/A_q with E/k

Target `G.1/quadratic-cokernel-equiv-over-k`. Proposed declaration: `QuadraticPinch.residueCokernelEquiv_over_k`.

For every q, construct the specified k-linear equivalence B/A_q≃E/k, with quotients by the actual underlying k-submodules of A_q and the bottom k-subalgebra of E, by restricting ε_q and the two proved denominator equalities.

**Hypotheses.** k is any field; B=k[X], E is the native polynomial quotient AdjoinRoot(q), and A_q is the existing scalar-preimage subalgebra of B. The B-action on E is induced by the actual quotient ring homomorphism; A_q acts by restriction. Both quotient modules use the actual native submodule quotient structures. No separability, irreducibility, perfectness or characteristic assumption is imposed.

**Inputs.** `G.1/quadratic-pinch-algebra`, `mathlib:Submodule.mem_span_singleton`, `mathlib:Subalgebra.smul_def`, `mathlib:Algebra.mem_bot`, `mathlib:AdjoinRoot.mk_C`, `mathlib:AdjoinRoot.algebraMap_eq`, `mathlib:RingHom.toAlgebra`, `mathlib:IsScalarTower.of_algebraMap_eq`, `mathlib:AdjoinRoot.mk`, `mathlib:IsScalarTower.toAlgHom`, `mathlib:Submodule.mkQ`, `mathlib:Submodule.Quotient.mk_eq_zero`, `mathlib:Submodule.mkQ_surjective`, `mathlib:AdjoinRoot.mk_surjective`, `mathlib:Submodule.quotEquivOfEq`, `mathlib:LinearMap.quotKerEquivOfSurjective`, `mathlib:Submodule.quotEquivOfEq_mk`, `mathlib:LinearMap.quotKerEquivOfSurjective_apply_mk`, `mathlib:Submodule.restrictScalars`, `mathlib:Subalgebra.toSubmodule`, `mathlib:Submodule.Quotient.mk_add`, `mathlib:Submodule.Quotient.mk_smul`, `mathlib:Submodule.Quotient.eq`, `G.1/quadratic-normal-form-exists`, `mathlib:Module.mem_annihilator`, `mathlib:Submodule.Quotient.induction_on`, `mathlib:Module.annihilator`, `mathlib:finrank_eq_one_iff_of_nonzero'`, `mathlib:LinearEquiv.annihilator_eq`, `mathlib:LinearMapClass.map_smul_of_tower`, `mathlib:Submodule.Quotient.restrictScalarsEquiv`, `mathlib:LinearEquiv.restrictScalars`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, printed p10, one-component conductor diagram; complete Proposition3.1–3.2 and adjoining proofs/table, pp10–11. Authored affine quotient deductions at the existing quadratic chart.. The source motivates the normalization/conductor comparison. It does not print these polynomial quotient signatures or prove their projective sheaf/cohomology identification.

**Proof outline.**

1. Transport the source denominator, apply the native quotient restriction-of-scalars equivalence, restrict ε_q to k, then invert the target restriction-of-scalars equivalence and transport its denominator.

2. For every q, restriction to k of the A_q-submodule A_q·1⊂E equals the actual underlying k-submodule of the bottom k-subalgebra of E.

3. For monic quadratic q, Ann_Aq(B/(A_q·1)) equals the contraction of the actual polynomial ideal(q) along A_q⊂B.

4. For every q, restriction to k of A_q·1⊂B equals the actual underlying k-submodule of the existing subalgebra A_q⊂B.

5. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Supply the actual affine B/A_q to E/k comparison; projective normalization, conductor ideal-sheaf and finite-pushforward H0/H1 remain required. `G.1/quadratic-pinch-algebra`: Identify the normalization defect module and its actual conductor annihilator at the finite affine chart; not a replacement for global scheme normalization.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: k is any field; B=k[X], E is the native polynomial quotient AdjoinRoot(q), and A_q is the existing scalar-preimage subalgebra of B. The B-action on E is induced by the actual quotient ring homomorphism; A_q acts by restriction. Both quotient modules use the actual native submodule quotient structures. No separability, irreducibility, perfectness or characteristic assumption is imposed. q is monic and its native natural degree is exactly two.

- `QuadraticPinch.normalization_image_span` (compatibility): For every q and f, f lies in the A_q-submodule of B generated by 1 if and only if f∈A_q.

- `QuadraticPinch.conductor_image_span` (compatibility): For every q and z∈E, z lies in the A_q-submodule of E generated by 1 if and only if z belongs to the bottom k-subalgebra of E.

- `QuadraticPinch.residueCokernelMap_apply` (compatibility): For every q and f∈B, η_q(f) is the class of the actual polynomial quotient image of f in E/(A_q·1).

- `QuadraticPinch.residueCokernelMap_ker` (compatibility): For every q, the native A_q-linear kernel of η_q is exactly A_q·1⊂B.

- `QuadraticPinch.residueCokernelMap_surjective` (compatibility): For every q, η_q:B→E/(A_q·1) is surjective.

- `QuadraticPinch.residueCokernelMap` (constructor): For every q, define the specified A_q-linear map η_q:B→E/(A_q·1) as the actual polynomial quotient map followed by the native submodule quotient projection. Its A_q action is restriction of polynomial multiplication through the actual quotient ring homomorphism.

- `QuadraticPinch.residueCokernelEquiv_apply` (compatibility): For every q and f∈B, ε_q([f])=[mk_q(f)] in E/(A_q·1).

- `QuadraticPinch.residueCokernelEquiv_symm_apply` (compatibility): For every q and f∈B, ε_q⁻¹([mk_q(f)])=[f] in B/(A_q·1).

- `QuadraticPinch.residueCokernelEquiv_annihilator` (compatibility; assumptions H1): For monic quadratic q, Ann_Aq(E/(A_q·1)) equals the contraction of(q) along the actual inclusion A_q⊂B.

- `QuadraticPinch.residueCokernelEquiv_scalar_action` (compatibility; assumptions H1): For monic quadratic q, a∈A_q and z∈E, a•[z]=ρ_q(a)•[z] in E/(A_q·1).

- `QuadraticPinch.residueCokernelEquiv` (constructor): For every q, construct the specified A_q-linear equivalence ε_q:B/(A_q·1)≃E/(A_q·1) from η_q by the native first isomorphism theorem and its proved kernel equality.

- `QuadraticPinch.conductor_span_restrictScalars` (compatibility): For every q, restriction to k of the A_q-submodule A_q·1⊂E equals the actual underlying k-submodule of the bottom k-subalgebra of E.

- `QuadraticPinch.normalization_quotient_reconstruction` (compatibility; assumptions H1): For monic quadratic q and every f∈B, [f]=M_q(f).2•[X] in the native A_q-module B/(A_q·1), where M_q is the existing specified normalization coefficient pair.

- `QuadraticPinch.normalization_quotient_scalar_action` (compatibility; assumptions H1): For monic quadratic q, a∈A_q and f∈B, a•[f]=ρ_q(a)•[f] in B/(A_q·1), where ρ_q is the existing native scalar-remainder k-algebra homomorphism.

- `QuadraticPinch.normalization_quotient_generator_ne_zero` (compatibility; assumptions H1): For monic quadratic q, [X]≠0 in B/(A_q·1).

- `QuadraticPinch.normalization_quotient_annihilator_mem` (compatibility; assumptions H1): For monic quadratic q and a∈A_q, a annihilates B/(A_q·1) if and only if ρ_q(a)=0.

- `QuadraticPinch.normalization_quotient_annihilator` (compatibility; assumptions H1): For monic quadratic q, Ann_Aq(B/(A_q·1)) equals the contraction of the actual polynomial ideal(q) along A_q⊂B.

- `QuadraticPinch.normalization_quotient_finrank` (compatibility; assumptions H1): For monic quadratic q, the native k-dimension of B/(A_q·1) is exactly one.

- `QuadraticPinch.normalization_span_restrictScalars` (compatibility): For every q, restriction to k of A_q·1⊂B equals the actual underlying k-submodule of the existing subalgebra A_q⊂B.

- `QuadraticPinch.residueCokernelEquiv_over_k_apply` (compatibility): For every q and f∈B, the specified k-linear B/A_q≃E/k sends [f] to [mk_q(f)].

- `QuadraticPinch.residueCokernelEquiv_over_k_symm_apply` (compatibility): For every q and f∈B, the inverse of the specified k-linear B/A_q≃E/k sends [mk_q(f)] to [f].

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.residueCokernelMap.constant`: For every q and c∈k, η_q(C(c))=0 in the actual residue quotient.

- `QuadraticPinch.residueCokernelMap.multiple`: For every q,h∈B, η_q(qh)=0 in the actual residue quotient.

- `QuadraticPinch.residueCokernelMap.cusp_root`: For k=F₂ and q=X², η_q(X) is nonzero; the cokernel map is not the zero map.

- `QuadraticPinch.residueCokernelEquiv.representatives`: For every q and f∈B, ε_q([f])=[mk_q(f)] using the actual quotient representatives.

- `QuadraticPinch.residueCokernelEquiv.unit`: For q=1 and every f∈B, ε_q([f])=0; the actual source quotient vanishes.

- `QuadraticPinch.residueCokernelEquiv.zero`: For q=0 and every f∈B, ε_q⁻¹([mk_q(f)])=[f]; the comparison still holds without monicity or a quadratic degree.

- `QuadraticPinch.residueCokernelEquiv.repeated_char3`: For k=F₃ and q=X²+X+1=(X−1)², the actual annihilator of E/(A_q·1) equals the contraction of(q); the double root does not invalidate this affine comparison.

- `QuadraticPinch.residueCokernelEquiv.scalar_action`: For every monic quadratic q, a∈A_q and z∈E, the actual A_q action on [z] equals multiplication by its scalar residue ρ_q(a).

- `QuadraticPinch.normalizationCokernel.conductor_action`: For every monic quadratic q and f∈B, the actual subtype element q∈A_q kills [f] in B/(A_q·1).

- `QuadraticPinch.normalizationCokernel.unit_not_annihilator`: For every monic quadratic q, the unit of A_q does not annihilate B/(A_q·1).

- `QuadraticPinch.normalizationCokernel.cusp_dimension`: For k=F₂ and q=X², the actual k-dimension of B/(A_q·1) is one, without a separability hypothesis.

- `QuadraticPinch.normalizationCokernel.nonsplit_dimension`: For k=F₂ and q=X²+X+1, the actual k-dimension of B/(A_q·1) is one, without a rational conductor root.

- `QuadraticPinch.residueCokernelEquiv_over_k.cusp`: For k=F₂, q=X² and every f∈B, the specified k-linear B/A_q≃E/k sends [f] to [mk_q(f)] in the quotient by the actual constant k-submodule.

- `QuadraticPinch.residueCokernelEquiv_over_k.unit`: For q=1 and every f∈B, the specified k-linear B/A_q≃E/k sends [f] to zero.

- `QuadraticPinch.residueCokernelEquiv_over_k.zero`: For q=0 and every f∈B, the inverse of the specified k-linear B/A_q≃E/k sends [mk_q(f)] to [f].

### Quadratic pinching cubic

Target `G.1/quadratic-infinity-curve`. Proposed declaration: `QuadraticPinch.InfinityChart.curve`.

The native WeierstrassCurve W_(a,b) has coefficients (a,−b,0,0,0), hence homogeneous equation Y²Z+aXYZ+bX²Z−X³=0. It is the homogeneous cubic attached to the existing affine quadratic pinching presentation.

**Hypotheses.** R is an arbitrary commutative ring, with its actual polynomial, quotient and localization algebra structures; a,b∈R. No domain, reducedness, nontriviality, separability, perfectness or characteristic assumption is imposed.

**Inputs.** `mathlib:WeierstrassCurve`, `G.1/quadratic-pinch-algebra`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §3, printed pp9–11, especially the one-component conductor diagram p10; authored homogeneous and reciprocal-chart deductions from the existing q=t²+at+b pinching equation.. Schröer motivates the projective normalization/conductor comparison. These polynomial chart formulas, quotient algebra maps and their identities are authored deductions, not source-printed global scheme, sheaf or cohomology theorems.

**Proof outline.**

1. Use the existing native WeierstrassCurve carrier and its projective Equation; no new projective scheme or smoothness predicate is defined.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Supply the explicit infinity affine chart and homogeneous normalization coordinates for the existing projective pinching consumer. Actual chart gluing, scheme comparison, conductor ideal sheaf and H0/H1 sequence remain required.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: k is an arbitrary field and a,b∈k; no separability, perfectness or characteristic assumption. The nonzero-coordinate theorem additionally assumes T≠0 or U≠0. Native Nonsingular is only used over a field, where its derivative criterion has its intended geometric interpretation.

- `QuadraticPinch.InfinityChart.equation_chart` (compatibility): For every u,z∈R, the actual native projective Equation of W_(a,b) at [u:1:z] holds if and only if z(1+au+bu²)=u³.

- `QuadraticPinch.InfinityChart.normalization_equation` (compatibility): For all T,U∈R, the actual native Weierstrass projective Equation of W_(a,b) holds at n_(a,b)(T,U).

- `QuadraticPinch.InfinityChart.infinity_nonsingular` (compatibility; assumptions H1): For every field k and a,b∈k, the native Weierstrass projective Nonsingular condition holds at [0:1:0], because the Z partial derivative equals one. This includes characteristic two and the singular finite cusp.

- `QuadraticPinch.InfinityChart.bezout` (compatibility): Q∞(u)(1−au+(a²−b)u²)=1+u³((a³−2ab)+b(a²−b)u).

- `QuadraticPinch.InfinityChart.denominator_isUnit` (compatibility): The actual R[u]-coefficient image of Q∞ in Chart(a,b) is a unit; no further localization of the chart is required.

- `QuadraticPinch.InfinityChart.localization` (compatibility): For its actual coefficient R[u]-algebra structure, Chart(a,b) satisfies the native IsLocalization.Away(Q∞) property.

- `QuadraticPinch.InfinityChart.denominator` (constructor): Q∞(u)=1+au+bu² is an actual polynomial over R, the reciprocal u²q(1/u) of the existing monic q(t)=t²+at+b.

- `QuadraticPinch.InfinityChart.Chart` (coercion): Chart(a,b) abbreviates the actual native AdjoinRoot of the specified polynomial relation with its native R[u]-algebra structure.

- `QuadraticPinch.InfinityChart.root_relation` (compatibility): In Chart(a,b), the coefficient image of Q∞ times the native quotient root Z equals the coefficient image of u³.

- `QuadraticPinch.InfinityChart.relation` (constructor): The coordinate relation L_(a,b)(Z)=Q∞(u)Z−u³ lies in R[u][Z]. Chart(a,b) is the native AdjoinRoot of this polynomial, an actual quotient of R[u][Z] by (L_(a,b)). Its R[u]-algebra structure is the native quotient coefficient map.

- `QuadraticPinch.InfinityChart.mul_inverse` (compatibility): In the actual quotient Chart(a,b), Q∞·D∞=1.

- `QuadraticPinch.InfinityChart.fromLocalization_inv` (compatibility): The specified inverse algebra homomorphism sends the native localization element Q∞⁻¹ to D∞.

- `QuadraticPinch.InfinityChart.equiv_inverse_inv` (compatibility): The inverse of the specified chart equivalence sends the native localization inverse of Q∞ to D∞.

- `QuadraticPinch.InfinityChart.denominatorInverse` (constructor): In Chart(a,b), define D∞ as the coefficient image of 1−au+(a²−b)u² minus Z times the coefficient image of (a³−2ab)+b(a²−b)u.

- `QuadraticPinch.InfinityChart.toLocalization_root` (compatibility): The specified forward map sends the actual native quotient root Z to the coefficient image of u³ times the native localization inverse of Q∞.

- `QuadraticPinch.InfinityChart.to_from` (compatibility): The specified forward map composed with the specified inverse map is the identity R[u]-algebra homomorphism on Localization.Away(Q∞).

- `QuadraticPinch.InfinityChart.equiv_base` (compatibility): For every f∈R[u], the specified chart equivalence sends its actual quotient coefficient image to f/1 in Localization.Away(Q∞).

- `QuadraticPinch.InfinityChart.toLocalization` (constructor): Construct the specified R[u]-algebra map Chart(a,b)→Localization.Away(Q∞), sending Z to u³/Q∞ and every coefficient polynomial f to f/1.

- `QuadraticPinch.InfinityChart.from_to` (compatibility): The specified inverse map composed with the specified forward map is the identity R[u]-algebra homomorphism on Chart(a,b).

- `QuadraticPinch.InfinityChart.equiv_inverse_base` (compatibility): For every f∈R[u], the inverse of the specified chart equivalence sends f/1 to the actual quotient coefficient image of f.

- `QuadraticPinch.InfinityChart.fromLocalization` (constructor): Construct the specified R[u]-algebra map Localization.Away(Q∞)→Chart(a,b) using the native coefficient map and the proved unit Q∞.

- `QuadraticPinch.InfinityChart.equiv_root` (compatibility): The specified chart equivalence sends the actual root Z to u³/Q∞.

- `QuadraticPinch.InfinityChart.spec_openImmersion` (compatibility): The actual Spec morphism induced by R[u]→Chart(a,b) is an open immersion into Spec R[u]. It identifies this quotient chart with the principal open D(Q∞) through its specified localization equivalence.

- `QuadraticPinch.InfinityChart.equiv` (constructor): The specified inverse homomorphisms give the actual R[u]-algebra equivalence Chart(a,b)≃Localization.Away(Q∞). This equivalence is over the coefficient algebra R[u], not merely an abstract ring equivalence.

- `QuadraticPinch.InfinityChart.normalization_homogeneous` (compatibility): For every r∈R, n_(a,b)(rT,rU)=r³·n_(a,b)(T,U), using the native scalar action on the coordinate tuple.

- `QuadraticPinch.InfinityChart.normalization_nonzero` (compatibility; assumptions H1): Over any field k, if T≠0 or U≠0 then n_(a,b)(T,U) is not the zero tuple. No separability, perfectness or characteristic restriction is used.

- `QuadraticPinch.InfinityChart.normalizationCoordinates` (constructor): For q_h(T,U)=T²+aTU+bU², construct the actual coordinate triple n_(a,b)(T,U)=[Uq_h:Tq_h:U³]. It is a homogeneous cubic triple, with finite-chart coordinates [q(t):tq(t):1] and infinity [0:1:0].

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `InfinityChart.curve.origin`: For all a,b over R, the actual projective equation holds at [0:0:1].

- `InfinityChart.curve.finite_normalization`: For all a,b,t over R, the actual projective equation holds at [t²+at+b:t(t²+at+b):1].

- `InfinityChart.curve.infinity_smooth`: Over Z/2, the native projective Nonsingular condition holds at [0:1:0] for every a,b.

- `InfinityChart.denominator.constant`: For all a,b over R, the coefficient of u⁰ in Q∞ is one.

- `InfinityChart.denominator.cusp`: Over every R, Q∞ for a=b=0 is the constant polynomial one.

- `InfinityChart.denominator.base_change`: For every ring homomorphism f:R→S, map(f,Q∞(a,b))=Q∞(f(a),f(b)).

- `InfinityChart.relation.leading`: For all a,b over R, the coefficient of Z¹ in L_(a,b) is Q∞.

- `InfinityChart.relation.constant`: For all a,b over R, the coefficient of Z⁰ in L_(a,b) is −u³.

- `InfinityChart.relation.cusp`: For a=b=0 over every R, the actual relation is Z−u³.

- `InfinityChart.denominatorInverse.cusp`: For a=b=0 over every R, D∞ in the actual quotient is one.

- `InfinityChart.denominatorInverse.nonreduced`: Over Z/4 with a=2,b=0, the actual chart identity (1+2u)D∞=1 holds.

- `InfinityChart.denominatorInverse.repeated_char2`: Over Z/2 with a=0,b=1, the actual chart identity (1+u²)D∞=1 holds.

- `InfinityChart.toLocalization.base`: For every f∈R[u], the actual forward homomorphism sends its quotient coefficient image to f/1.

- `InfinityChart.toLocalization.root`: For every a,b over R, the actual forward homomorphism sends the native root to u³/Q∞.

- `InfinityChart.toLocalization.cusp`: For a=b=0 over every R, the actual forward homomorphism sends the native root to the coefficient image of u³.

- `InfinityChart.fromLocalization.base`: For every f∈R[u], the actual inverse homomorphism sends f/1 to its quotient coefficient image.

- `InfinityChart.fromLocalization.inverse`: For every a,b over R, the actual inverse homomorphism sends the native Q∞⁻¹ to D∞.

- `InfinityChart.fromLocalization.cusp`: For a=b=0 over every R, the actual inverse homomorphism sends the native Q∞⁻¹ to one.

- `InfinityChart.equiv.actual_forward`: The native forward algebra homomorphism of the specified equivalence equals the specified toLocalization map.

- `InfinityChart.equiv.actual_inverse`: The native inverse algebra homomorphism of the specified equivalence equals the specified fromLocalization map.

- `InfinityChart.equiv.coefficient`: Applying the specified equivalence and its inverse to an actual coefficient image recovers that same coefficient image.

- `InfinityChart.normalizationCoordinates.finite`: n_(a,b)(t,1)=[t²+at+b:t(t²+at+b):1].

- `InfinityChart.normalizationCoordinates.infinity`: n_(a,b)(1,0)=[0:1:0].

- `InfinityChart.normalizationCoordinates.nonzero_char2`: Over Z/2, n_(0,1)(1,0) is not the zero tuple.

### Equiv

Target `G.1/overlap-equiv`. Proposed declaration: `QuadraticPinch.Overlap.equiv`.

The specified reciprocal maps give an R-algebra equivalence between the two coefficient-reversed polynomial overlap localizations.

**Hypotheses.** R is an arbitrary commutative ring. All localizations, quotient charts and algebra maps are the specified native carriers. No domain, reducedness, nontriviality, monicity or characteristic hypothesis; the normalization tuple specializes c=1.

**Inputs.** `mathlib:IsLocalization.Away.mul_invSelf`, `mathlib:IsLocalization.Away.isUnit_of_dvd`, `mathlib:IsLocalization.Away.liftAlgHom`, `mathlib:IsLocalization.Away.lift_eq`, `mathlib:IsLocalization.algHom_ext`, `mathlib:AlgEquiv.ofAlgHom`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), arXiv2004.07025v3, §3, one-component conductor square and Proposition3.2; authored overlap deductions from the incoming quadratic presentation.. The source motivates normalization and pinching. The specified reciprocal localization maps, their identities and chart transition are authored algebraic deductions, not source-printed global Proj or cohomology theorems.

**Proof outline.**

1. Expand the specified native expressions and use the recorded prerequisite identities; the public checked prototype gives each algebraic step on these carriers.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Supply the specified two-chart overlap algebra and coordinate compatibility before the actual Proj/gluing and global normalization comparison. Generic affine gluing remains with SF.0; conductor sheaves and H0/H1 remain required.

**API.**

- `QuadraticPinch.Overlap.quadratic_monic` (compatibility): Specializing c=1 gives the existing monic expression X²+aX+b, with no hypothesis on a or b.

- `QuadraticPinch.Overlap.quadratic_reversed` (compatibility): Specializing the reversed polynomial Q(b,a,1) gives exactly the existing infinity denominator 1+aX+bX².

- `QuadraticPinch.Overlap.quadratic_aeval` (compatibility): Evaluation of the coefficient polynomial at x is exactly cx²+ax+b.

- `QuadraticPinch.Overlap.quadratic` (constructor): The coefficient polynomial Q(c,a,b)=cX²+aX+b over an arbitrary commutative ring.

- `QuadraticPinch.Overlap.coordinate_isUnit` (compatibility): The polynomial coordinate t is a unit in the overlap ring, with the specified inverse v.

- `QuadraticPinch.Overlap.inverse_isUnit` (compatibility): The specified inverse coordinate v is a unit, with inverse t.

- `QuadraticPinch.Overlap.quadratic_isUnit` (compatibility): The image of Q(c,a,b) is a unit in R[X,1/(XQ)].

- `QuadraticPinch.Overlap.Ring` (constructor): The actual native localization R[X,1/(XQ(c,a,b))], with its specified polynomial algebra map.

- `QuadraticPinch.Overlap.coordinate_algebraMap` (compatibility): The overlap coordinate is exactly the native polynomial algebra-map image of X.

- `QuadraticPinch.Overlap.coordinate_mul_inverse` (compatibility): The product t·v equals one in the specified overlap ring, without cancellation or a domain hypothesis.

- `QuadraticPinch.Overlap.coordinate` (constructor): The image t of X under the specified polynomial algebra map into R[X,1/(XQ)].

- `QuadraticPinch.Overlap.inverseVariable_formula` (compatibility): The inverse coordinate is exactly the polynomial image of Q multiplied by the native localization inverse of XQ.

- `QuadraticPinch.Overlap.inverseVariable` (constructor): The specified inverse v=Q/(XQ) of t in the actual overlap localization.

- `QuadraticPinch.Overlap.reciprocal_quadratic` (compatibility): Evaluation of Q(c,a,b) at the inverse coordinate in the coefficient-reversed overlap equals v² times the polynomial image of Q(b,a,c).

- `QuadraticPinch.Overlap.reciprocal_denominator_isUnit` (compatibility): Evaluation of XQ(c,a,b) at the inverse coordinate in the coefficient-reversed overlap is a unit.

- `QuadraticPinch.Overlap.reciprocal_algebraMap` (compatibility): The reciprocal map sends the image of every polynomial f to its evaluation at the target inverse coordinate.

- `QuadraticPinch.Overlap.reciprocal_coordinate` (compatibility): The reciprocal map sends the source polynomial coordinate to the target inverse coordinate.

- `QuadraticPinch.Overlap.reciprocal_inverse` (compatibility): The reciprocal map sends the source inverse coordinate to the target polynomial coordinate.

- `QuadraticPinch.Overlap.reciprocal_comp` (compatibility): Composing the reciprocal map with its coefficient-reversed reciprocal gives the identity R-algebra homomorphism.

- `QuadraticPinch.Overlap.reciprocal` (constructor): The specified R-algebra map from R[X,1/(XQ(c,a,b))] to R[X,1/(XQ(b,a,c))] induced by polynomial evaluation at the inverse coordinate.

- `QuadraticPinch.Overlap.equiv_coordinate` (compatibility): The reciprocal equivalence sends the source polynomial coordinate to the target inverse coordinate.

- `QuadraticPinch.Overlap.equiv_inverse` (compatibility): The reciprocal equivalence sends the source inverse coordinate to the target polynomial coordinate.

- `QuadraticPinch.Overlap.equiv_algebraMap` (compatibility): The reciprocal equivalence sends every polynomial image to evaluation at the target inverse coordinate.

- `QuadraticPinch.Overlap.equiv_symm` (compatibility): The inverse of the reciprocal equivalence is exactly the same construction with leading and constant coefficients exchanged.

- `QuadraticPinch.Overlap.normalization_overlap` (compatibility): In R[t,1/(t(t²+at+b))], the actual homogeneous normalization tuple at (1,v) equals v³ times its tuple at (t,1), with coefficients transported by the actual R-algebra map. All three coordinates agree after this unit scaling.

- `QuadraticPinch.Overlap.specIso_hom` (compatibility): The forward morphism of the affine overlap scheme isomorphism is exactly Spec of the specified reciprocal ring homomorphism.

- `QuadraticPinch.Overlap.specIso_inv` (compatibility): The inverse morphism of the affine overlap scheme isomorphism is exactly Spec of the coefficient-reversed reciprocal ring homomorphism.

- `QuadraticPinch.Overlap.specIso_hom_inv` (compatibility): The composite of the specified forward and inverse affine scheme morphisms is the actual identity morphism.

- `QuadraticPinch.Overlap.specIso` (constructor): Applying the native contravariant Spec functor to the reciprocal ring equivalence gives an actual scheme isomorphism between the two affine overlap spectra.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `Overlap.quadratic.zero`: With all coefficients zero, the specified polynomial is zero.

- `Overlap.quadratic.nonreduced`: Over Z/4, evaluating Q(2,1,1) at 2 gives 3.

- `Overlap.quadratic.reversal_not_equal`: Over the integers, Q(1,0,2) and Q(2,0,1) differ; the reversal is not a coefficientwise identity.

- `Overlap.Ring.zero_polynomial`: When Q=0, the actual overlap localization has zero equal to one.

- `Overlap.Ring.coordinate_unit_nonreduced`: The polynomial coordinate is a unit for coefficients (2,2,1) over Z/4.

- `Overlap.Ring.quadratic_unit_nonsplit`: The actual image of X²+X+1 is a unit in its F₂ overlap localization.

- `Overlap.coordinate.cusp`: For the characteristic-two cusp q=X², the specified coordinate and reciprocal multiply to one.

- `Overlap.coordinate.nonreduced`: For coefficients (2,2,1) over Z/4, the specified coordinate and reciprocal multiply to one.

- `Overlap.coordinate.generator`: Evaluation of X at the specified overlap coordinate agrees with the actual polynomial algebra map.

- `Overlap.inverseVariable.left_inverse`: The specified reciprocal is also a left inverse of the coordinate over every commutative ring.

- `Overlap.inverseVariable.unit_split`: The inverse coordinate is a unit for the split polynomial X²−1 over the rationals.

- `Overlap.inverseVariable.zero_ring`: In the overlap localization over Z/1, the specified inverse coordinate equals one.

- `Overlap.reciprocal.coefficient`: The specified reciprocal homomorphism fixes every actual coefficient-ring image.

- `Overlap.reciprocal.general_quadratic`: The image of Q under the reciprocal map is precisely v²Q with reversed coefficients.

- `Overlap.reciprocal.twice`: Applying the reciprocal map twice, with coefficients reversed for the second map, recovers every element.

- `Overlap.equiv.cusp`: For the characteristic-two cusp, the reciprocal equivalence sends the coordinate to the specified inverse in the reversed overlap.

- `Overlap.equiv.nonsplit`: For X²+X+1 over F₂, the reciprocal equivalence sends the inverse coordinate to the coordinate.

- `Overlap.equiv.nonreduced_roundtrip`: The reciprocal equivalence and its coefficient-reversed map recover each element for (2,2,1) over Z/4.

- `Overlap.normalization_overlap.nonreduced`: For a=b=2 over Z/4, all three homogeneous normalization coordinates agree on the overlap after multiplication by the specified inverse coordinate cubed.

- `Overlap.specIso.cusp`: The actual forward/inverse Spec morphisms compose to the identity for the characteristic-two cusp.

- `Overlap.specIso.nonreduced`: The actual inverse/forward Spec morphisms compose to the identity for coefficients (2,2,1) over Z/4.

- `Overlap.specIso.actual_map`: The forward scheme morphism is exactly native Spec.map of the specified reciprocal homomorphism.

### Chart equiv

Target `G.1/overlap-chart-equiv`. Proposed declaration: `QuadraticPinch.Overlap.chartEquiv`.

For q=t²+at+b over a field, the finite pinch localization A_q[1/(tq)] is identified by the specified composite ring equivalence with the actual infinity-chart localization at u. The latter principal open equals D(z).

**Hypotheses.** k is a field; c,a,b∈k. The chart transition specializes c=1. No separability, perfectness, distinct-root or characteristic restriction; the finite localization comparison allows the zero polynomial.

**Inputs.** `G.1/overlap-equiv`, `G.1/quadratic-pinch-algebra`, `G.0/subring-conductor`, `mathlib:IsLocalization.map_eq`, `G.1/quadratic-infinity-curve`, `mathlib:IsLocalization.Away.mul`, `mathlib:IsLocalization.algEquiv`, `mathlib:isUnit_pow_iff`, `mathlib:PrimeSpectrum.basicOpen_mul`, `mathlib:PrimeSpectrum.basicOpen_pow`, `mathlib:PrimeSpectrum.basicOpen_one`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), arXiv2004.07025v3, §3, one-component conductor square and Proposition3.2; authored overlap deductions from the incoming quadratic presentation.. The source motivates normalization and pinching. The specified reciprocal localization maps, their identities and chart transition are authored algebraic deductions, not source-printed global Proj or cohomology theorems.

**Proof outline.**

1. Compose the specified finite localization equivalence, reciprocal coefficient-reversal equivalence and inverse infinity localization equivalence. Use D(z)=D(u) to identify the intended infinity open.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Supply the specified two-chart overlap algebra and coordinate compatibility before the actual Proj/gluing and global normalization comparison. Generic affine gluing remains with SF.0; conductor sheaves and H0/H1 remain required.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: R is an arbitrary commutative ring. All localizations, quotient charts and algebra maps are the specified native carriers. No domain, reducedness, nontriviality, monicity or characteristic hypothesis; the normalization tuple specializes c=1.

- `QuadraticPinch.Overlap.finiteDenominator_val` (compatibility): The underlying polynomial of the finite overlap denominator is exactly XQ(c,a,b).

- `QuadraticPinch.Overlap.finiteDenominator_conductor` (compatibility): The specified finite overlap denominator belongs to the existing arbitrary-subring conductor of A_Q in k[X].

- `QuadraticPinch.Overlap.finite_localization` (compatibility): The actual normalized polynomial overlap ring has the native Away-localization property at the image of the specified finite denominator under the pinch inclusion.

- `QuadraticPinch.Overlap.finiteDenominator` (constructor): The specified element XQ(c,a,b) of the existing pinch subring A_Q=k+Qk[X], with its actual membership witness.

- `QuadraticPinch.Overlap.finite_away_bijective` (compatibility): The native localization map induced by A_Q⊂k[X], after inverting the specified XQ in both rings, is bijective. This uses the existing G.0 conductor-localization theorem.

- `QuadraticPinch.Overlap.finiteEquiv_apply` (compatibility): The finite overlap equivalence has exactly the native Away.map induced by the existing pinch inclusion as its underlying map.

- `QuadraticPinch.Overlap.finiteEquiv_algebraMap` (compatibility): The finite overlap equivalence sends the canonical image of every actual pinch element f to the canonical image of its underlying polynomial.

- `QuadraticPinch.Overlap.finiteEquiv_symm_algebraMap` (compatibility): The inverse finite overlap equivalence recovers the canonical image of each pinch element from the corresponding polynomial image.

- `QuadraticPinch.Overlap.finiteEquiv` (constructor): The specified localized pinch inclusion gives a ring equivalence A_Q[1/(XQ)]≃k[X,1/(XQ)], for arbitrary coefficients, including Q=0.

- `QuadraticPinch.Overlap.infinity_localization` (compatibility; assumptions H1): The iterated infinity-chart localization is a native R[u]-localization away from uQ(b,a,1), using the existing chart localization away from Q∞ and the pinned iterated-localization theorem.

- `QuadraticPinch.Overlap.infinity_basicOpen_root` (compatibility; assumptions H1): The principal open D(z) equals D(u) in the actual prime spectrum of the existing infinity quotient chart, including nonreduced coefficient rings.

- `QuadraticPinch.Overlap.infinityOpen_coordinate_isUnit` (compatibility; assumptions H1): The image of the infinity chart polynomial coordinate is a unit in its actual coordinate localization.

- `QuadraticPinch.Overlap.InfinityOpen` (constructor; assumptions H1): The actual native localization of the existing infinity quotient chart at its polynomial coordinate u.

- `QuadraticPinch.Overlap.infinityEquiv_algebraMap` (compatibility; assumptions H1): The infinity overlap equivalence preserves the canonical image of every coefficient polynomial in R[u].

- `QuadraticPinch.Overlap.infinityEquiv_symm_algebraMap` (compatibility; assumptions H1): The inverse infinity overlap equivalence preserves the canonical image of every coefficient polynomial in R[u].

- `QuadraticPinch.Overlap.infinityEquiv_roundtrip` (compatibility; assumptions H1): The inverse infinity overlap equivalence recovers every element after application of the forward equivalence.

- `QuadraticPinch.Overlap.infinityEquiv` (constructor; assumptions H1): The native uniqueness equivalence identifies the infinity-chart coordinate localization with R[u,1/(uQ∞)] as R[u]-algebras.

- `QuadraticPinch.Overlap.infinity_root_isUnit_iff` (compatibility; assumptions H1): For every ring homomorphism from the actual infinity quotient chart into any commutative ring S, the image of its root z is a unit if and only if the image of its polynomial coordinate u is a unit.

- `QuadraticPinch.Overlap.chartEquiv_algebraMap` (compatibility): On any finite pinch element f, the actual chart transition is inverse infinity-localization comparison applied to f evaluated at the reciprocal coordinate.

- `QuadraticPinch.Overlap.chartEquiv_roundtrip` (compatibility): The inverse of the specified chart transition recovers every element of the finite pinch overlap.

- `QuadraticPinch.Overlap.chartEquiv_inverse_roundtrip` (compatibility): The specified chart transition recovers every element of the infinity overlap after its inverse.

- `QuadraticPinch.Overlap.quadratic_aeval` (compatibility; assumptions H1): Evaluation of the coefficient polynomial at x is exactly cx²+ax+b.

- `QuadraticPinch.Overlap.coordinate_algebraMap` (compatibility; assumptions H1): The overlap coordinate is exactly the native polynomial algebra-map image of X.

- `QuadraticPinch.Overlap.inverseVariable_formula` (compatibility; assumptions H1): The inverse coordinate is exactly the polynomial image of Q multiplied by the native localization inverse of XQ.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `Overlap.finiteDenominator.cusp`: For q=X² over F₂, the underlying finite overlap denominator is X³.

- `Overlap.finiteDenominator.split`: For q=X²−1 over the rationals, the underlying finite overlap denominator is X³−X.

- `Overlap.finiteDenominator.zero`: For q=0 over the rationals, the underlying finite overlap denominator is zero.

- `Overlap.finiteEquiv.cusp`: For the characteristic-two cusp, the finite overlap equivalence sends its denominator image to the polynomial image of X³.

- `Overlap.finiteEquiv.nonsplit`: For X²+X+1 over F₂, the inverse finite overlap equivalence recovers the actual image of every pinch element.

- `Overlap.finiteEquiv.zero_roundtrip`: The forward/inverse finite overlap maps recover every element even for the zero polynomial over the rationals.

- `Overlap.InfinityOpen.root_cusp`: For the characteristic-two cusp infinity chart, D(z)=D(u) in its actual prime spectrum.

- `Overlap.InfinityOpen.root_nonreduced`: For the infinity chart with a=2,b=1 over Z/4 and every receiving commutative ring, z maps to a unit exactly when u does.

- `Overlap.InfinityOpen.coordinate_nonsplit`: For the infinity chart a=b=1 over F₂, the coordinate becomes a unit in the specified open ring.

- `Overlap.infinityEquiv.polynomial`: The infinity overlap equivalence preserves the actual polynomial image of X²+a.

- `Overlap.infinityEquiv.inverse_coordinate`: The inverse infinity overlap equivalence sends the normalized polynomial coordinate to its actual iterated-localization image.

- `Overlap.infinityEquiv.nonreduced`: The forward/inverse infinity overlap maps recover every element for a=2,b=1 over Z/4.

- `Overlap.chartEquiv.cusp`: The chart transition and its inverse recover every finite overlap element for the characteristic-two cusp.

- `Overlap.chartEquiv.nonsplit`: The chart transition recovers every infinity overlap element after its inverse for q=X²+X+1 over F₂.

- `Overlap.chartEquiv.split_formula`: For q=X²−1 over the rationals, the actual chart transition on each pinch element agrees with reciprocal polynomial evaluation and the inverse infinity comparison.

### Quadratic two-chart scheme

Target `G.1/global-curve`. Proposed declaration: `QuadraticPinch.Global.curve`.

Construct the actual native Scheme C(a,b)=F ⨿_{Spec L} I using the existing scheme pushout of j_F and j_I, both open immersions. Its canonical maps i_F and i_I are part of the output. This is the quadratic two-chart scheme; identification with the specified projective cubic is a separate comparison.

**Hypotheses.** k is a field and a,b∈k; q=t²+at+b. There is no separability, perfectness, characteristic or distinct-root assumption. All charts, overlaps, opens and maps use the specified native carriers. Composition in displayed chart equalities is read from left to right. C is the glued two-chart scheme and N its glued source; their Proj, projective-line and normalization-universal-property comparisons remain separate obligations.

**Inputs.** `G.1/overlap-equiv`, `G.1/quadratic-pinch-algebra`, `G.1/overlap-chart-equiv`, `mathlib:AlgebraicGeometry.IsOpenImmersion.of_isLocalization`, `mathlib:AlgebraicGeometry.Scheme.Hom.opensRange_comp_of_isIso`, `mathlib:AlgebraicGeometry.Scheme.Hom.opensRange_localizationAway`, `G.1/quadratic-infinity-curve`, `mathlib:CategoryTheory.Limits.pushout`, `mathlib:AlgebraicGeometry.Scheme.IsLocallyDirected.openCover`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), arXiv2004.07025v3 §3, the one-component conductor square before Proposition3.1; authored two-chart deductions specialized from the listed pinned Mathlib gluing and localization declarations.. The source motivates the quadratic normalization/pinching comparison. These specified scheme pushouts, chart pullbacks and reciprocal coordinate identities are authored deductions; no source-printed Proj comparison, projectivity, normalization universal property or cohomology theorem is claimed here.

**Proof outline.**

1. Apply the existing native scheme pushout to the two proved open immersions. Its colimit is a genuine scheme with canonical chart maps; specialize its existing universal property rather than re-planning generic gluing.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Supply the actual specialized two-chart scheme, finite global map and coefficient-compatible overlap before the projective-line/Proj, conductor-sheaf and finite-pushforward cohomology comparisons.

**API.**

- `QuadraticPinch.Global.finiteOpen_eq` (compatibility): The specified j_F equals the native Spec isomorphism induced by A_q[1/(tq)]≃L followed by the canonical principal-open immersion Spec A_q[1/(tq)]→F.

- `QuadraticPinch.Global.finiteOpen_isOpenImmersion` (compatibility): The specified map j_F:Spec L→Spec A_q is an actual open immersion.

- `QuadraticPinch.Global.finiteOpen_range` (compatibility): The open image of j_F is exactly D_A_q(tq). The element tq is viewed in A_q; no assertion that this is the whole finite chart is made.

- `QuadraticPinch.Global.finiteOpen_to_base` (compatibility): The composite of j_F with the coefficient structure map F→Spec k is the canonical structure morphism Spec L→Spec k.

- `QuadraticPinch.Global.finiteOpen` (constructor): Let q=t²+at+b over a field k, A_q=k+qk[t], L=k[t,1/(tq)] and F=Spec A_q. Define j_F:Spec L→F by the native inclusion A_q→k[t]→L. This is the specified finite-chart overlap map, not an unspecified open with the same image.

- `QuadraticPinch.Global.infinityOpen_isOpenImmersion` (compatibility): The specified j_I:Spec L→I is an actual open immersion.

- `QuadraticPinch.Global.infinityOpen_range` (compatibility): The open image of j_I is exactly D_I(u), and therefore equals D_I(z) by the inherited principal-open comparison.

- `QuadraticPinch.Global.infinityOpen_spec` (compatibility): The actual infinity overlap map j_I is exactly Spec(θ).

- `QuadraticPinch.Global.infinityOpen_to_base` (compatibility): The composite of j_I with the coefficient structure map I→Spec k is the same canonical structure morphism Spec L→Spec k.

- `QuadraticPinch.Global.infinityOpen` (constructor): Let I=Spec Chart(a,b), where Chart(a,b)=k[u][z]/((1+au+bu²)z−u³). Define j_I:Spec L→I by the Spec maps of the specified coefficient-reversal equivalence L≃k[u,1/(uQ∞)], the inverse infinity-localization comparison, and the canonical localization at u. Thus it uses the specified reciprocal transition.

- `QuadraticPinch.Global.finiteι` (projection): The specified canonical finite-chart inclusion F→C.

- `QuadraticPinch.Global.infinityι` (projection): The specified canonical infinity-chart inclusion I→C.

- `QuadraticPinch.Global.finiteι_isOpenImmersion` (compatibility): The canonical map i_F:F→C(a,b) is an actual open immersion.

- `QuadraticPinch.Global.infinityι_isOpenImmersion` (compatibility): The canonical map i_I:I→C(a,b) is an actual open immersion.

- `QuadraticPinch.Global.chart_condition` (compatibility): The equality j_F∘i_F=j_I∘i_I holds as native Scheme morphisms from Spec L to C, with composition read from left to right.

- `QuadraticPinch.Global.curve_hom_ext` (compatibility): For every scheme Y and morphisms f,g:C→Y, equality after precomposition with i_F and with i_I implies f=g.

- `QuadraticPinch.Global.charts_cover` (compatibility): Every point of the actual scheme C lies in the image of i_F or of i_I. The statement concerns all scheme points, including non-rational points.

- `QuadraticPinch.Global.charts_intersection` (compatibility): For x∈F and y∈I, i_F(x)=i_I(y) if and only if there is z∈Spec L with j_F(z)=x and j_I(z)=y. No extra chart points are identified.

- `QuadraticPinch.Global.chart_isPullback` (compatibility): The native Scheme square with top j_I:Spec L→I, left j_F:Spec L→F, right i_I:I→C and bottom i_F:F→C is a pullback.

- `QuadraticPinch.Global.chart_preimage` (compatibility): As actual scheme opens, i_F⁻¹(im i_I)=im j_F.

- `QuadraticPinch.Global.finiteι_desc` (compatibility): Precomposing desc(f,g) with i_F gives the specified map f.

- `QuadraticPinch.Global.infinityι_desc` (compatibility): Precomposing desc(f,g) with i_I gives the specified map g.

- `QuadraticPinch.Global.desc` (constructor): For any scheme Y, finite-chart map f:F→Y and infinity-chart map g:I→Y satisfying j_F∘f=j_I∘g, construct the unique morphism desc(f,g):C→Y with these specified restrictions.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `Global.finiteOpen.cusp_range`: The finite chart inclusion for the cusp quadratic has exactly the principal-open image D(tq), not the whole finite chart.

- `Global.finiteOpen.nonsplit_range`: The finite chart inclusion for the nonsplit quadratic has exactly the principal-open image D(tq), not the whole finite chart.

- `Global.finiteOpen.split_range`: The finite chart inclusion for the split quadratic has exactly the principal-open image D(tq), not the whole finite chart.

- `Global.infinityOpen.cusp_range`: For the characteristic-two cusp, the infinity overlap is D(u).

- `Global.infinityOpen.nonsplit_root_open`: For the nonsplit F₂ quadratic, the infinity overlap is also D(z), using the actual root of its quotient relation.

- `Global.infinityOpen.split_spec`: For the split rational quadratic, the infinity immersion is induced by the specified reciprocal ring homomorphism.

- `Global.curve.cusp_gluing`: The cusp chart morphisms agree on their actual overlap.

- `Global.curve.nonsplit_cover`: Every point of the nonsplit F₂ two-chart scheme belongs to one of the two charts.

- `Global.curve.split_intersection`: On the split rational model, equality of a finite-chart point and an infinity-chart point is characterized by a point of the specified overlap.

- `Global.desc.finite_restriction`: A descended morphism restricts to the specified finite-chart map.

- `Global.desc.infinity_restriction`: A descended morphism restricts to the specified infinity-chart map.

- `Global.desc.identity`: Descending the two chart inclusions gives the identity of the glued scheme.

### Specified affine normalization chart

Target `G.1/global-normalization-chart`. Proposed declaration: `QuadraticPinch.Global.normalizationChart`.

Name n_F:Spec k[t]→F as the actual Spec map of the inclusion A_q⊂k[t]. This specializes the inherited affine normalization carrier to q=t²+at+b and introduces no new normalization construction.

**Hypotheses.** k is a field and a,b∈k; q=t²+at+b. There is no separability, perfectness, characteristic or distinct-root assumption. All charts, overlaps, opens and maps use the specified native carriers. Composition in displayed chart equalities is read from left to right. C is the glued two-chart scheme and N its glued source; their Proj, projective-line and normalization-universal-property comparisons remain separate obligations.

**Inputs.** `G.1/quadratic-pinch-algebra`, `G.1/overlap-equiv`, `mathlib:AlgebraicGeometry.Scheme.ΓSpecIso_naturality`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), arXiv2004.07025v3 §3, the one-component conductor square before Proposition3.1; authored two-chart deductions specialized from the listed pinned Mathlib gluing and localization declarations.. The source motivates the quadratic normalization/pinching comparison. These specified scheme pushouts, chart pullbacks and reciprocal coordinate identities are authored deductions; no source-printed Proj comparison, projectivity, normalization universal property or cohomology theorem is claimed here.

**Proof outline.**

1. Use the specified native maps and the listed prerequisite equalities. Apply the existing scheme or localization API named among the inputs; the immutable native prototype records the exact specialization and every algebraic step.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

3. Verify the coordinate-sensitive tests using the named native Spec, section, restriction and generic-germ maps. The supplementary finite-map, inverse and ring-homomorphism laws do not replace these tests.

4. Define normalizationChart as Spec of the actual inclusion A_q→k[t]; ΓSpecIso naturality fixes its coefficient pullback. The branch tests use native evaluation Spec maps, and the cusp inverse is tq/q on the actual principal open.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Supply the actual specialized two-chart scheme, finite global map and coefficient-compatible overlap before the projective-line/Proj, conductor-sheaf and finite-pushforward cohomology comparisons.

**API.**

- `QuadraticPinch.Global.normalizationChart_isFinite` (compatibility): The specified affine map n_F is finite for q=t²+at+b over every field. This follows from the inherited monic degree-two finite inclusion.

- `QuadraticPinch.Global.normalizationChart_preimage` (compatibility): The inverse image n_F⁻¹(im j_F) equals im j_N as actual opens of Spec k[t].

- `QuadraticPinch.Global.normalization_chart_condition` (compatibility): The native Scheme composite j_N∘n_F equals j_F.

- `QuadraticPinch.Global.normalizationOpen_isOpenImmersion` (compatibility): The specified map j_N is an actual open immersion.

- `QuadraticPinch.Global.normalizationOpen_range` (compatibility): The image of j_N is exactly D_k[t](tq).

- `QuadraticPinch.Global.normalizationOpen` (constructor): Define j_N:Spec L→Spec k[t] as the actual Spec map of the canonical localization k[t]→L at tq.

- `QuadraticPinch.Global.normalization_finite_chart` (compatibility): The native equality s_F∘ν=n_F∘i_F holds.

- `QuadraticPinch.Global.normalization_infinity_chart` (compatibility): The native equality s_I∘ν=i_I holds; the chart map is the identity on I.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `Global.normalizationChart.cusp_coordinates`: For q=t² over any field, the actual normalizationChart.appTop, transported through the native ΓSpecIso maps, sends the A_q elements q and tq to t² and t³ in k[t].

- `Global.normalizationChart.nonsplit_coordinates`: For q=t²+t+1 over F₂, that same actual Spec pullback sends q and tq to t²+t+1 and t(t²+t+1); this fixes both generators rather than testing finiteness.

- `Global.normalizationChart.split_branches`: For q=t(t−1) over Q, the distinct native evaluation points t=0 and t=1 have equal composites with normalizationChart. Together with the nonsplit coordinate test and the retained overlap comparison tests this fixes the branch identification.

- `Global.normalizationChart.cusp_localized_inverse`: For q=t², let U=D(q) in Spec A_q and V=normalizationChart⁻¹U. Restrict the native q and tq sections to U, then pull them back to V. The pulled-back q is a unit and its inverse times the pulled-back tq equals the restricted native polynomial section t. No hypothesis supplies this coordinate equality.

- `Global.normalizationChart.cusp_finite`: The actual affine normalization map is finite for the cusp quadratic.

- `Global.normalizationChart.nonsplit_finite`: The actual affine normalization map is finite for the nonsplit quadratic.

- `Global.normalizationChart.split_finite`: The actual affine normalization map is finite for the split quadratic.

- `Global.normalizationOpen.cusp_range`: For q=t² over F₂ the normalization overlap is D(t³).

- `Global.normalizationOpen.nonsplit_preimage`: For the nonsplit F₂ model the inverse image of the finite overlap under affine normalization is exactly the normalization overlap.

- `Global.normalizationOpen.split_compatibility`: The split normalization overlap map followed by affine normalization agrees with the finite overlap map.

### Glued quadratic normalization charts

Target `G.1/global-normalization-source`. Proposed declaration: `QuadraticPinch.Global.normalizationSource`.

Construct N(a,b)=Spec k[t] ⨿_{Spec L} I from j_N and j_I by the existing open-immersion scheme pushout, with its canonical inclusions s_F and s_I. N is an actual scheme. Its identification with the native projective line and its normalization universal property are separate required comparisons.

**Hypotheses.** k is a field and a,b∈k; q=t²+at+b. There is no separability, perfectness, characteristic or distinct-root assumption. All charts, overlaps, opens and maps use the specified native carriers. Composition in displayed chart equalities is read from left to right. C is the glued two-chart scheme and N its glued source; their Proj, projective-line and normalization-universal-property comparisons remain separate obligations.

**Inputs.** `G.1/global-normalization-chart`, `G.1/overlap-equiv`, `mathlib:AlgebraicGeometry.IsOpenImmersion.of_isLocalization`, `mathlib:PrimeSpectrum.localization_away_comap_range`, `G.1/global-curve`, `mathlib:AlgebraicGeometry.SpecMap_preimage_basicOpen`, `mathlib:CategoryTheory.Limits.pushout`, `mathlib:AlgebraicGeometry.Scheme.IsLocallyDirected.openCover`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), arXiv2004.07025v3 §3, the one-component conductor square before Proposition3.1; authored two-chart deductions specialized from the listed pinned Mathlib gluing and localization declarations.. The source motivates the quadratic normalization/pinching comparison. These specified scheme pushouts, chart pullbacks and reciprocal coordinate identities are authored deductions; no source-printed Proj comparison, projectivity, normalization universal property or cohomology theorem is claimed here.

**Proof outline.**

1. Use the specified native maps and the listed prerequisite equalities. Apply the existing scheme or localization API named among the inputs; the immutable native prototype records the exact specialization and every algebraic step.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Supply the actual specialized two-chart scheme, finite global map and coefficient-compatible overlap before the projective-line/Proj, conductor-sheaf and finite-pushforward cohomology comparisons.

**API.**

- `QuadraticPinch.Global.normalizationOpen_isOpenImmersion` (compatibility): The specified map j_N is an actual open immersion.

- `QuadraticPinch.Global.normalizationOpen_range` (compatibility): The image of j_N is exactly D_k[t](tq).

- `QuadraticPinch.Global.normalizationChart_preimage` (compatibility): The inverse image n_F⁻¹(im j_F) equals im j_N as actual opens of Spec k[t].

- `QuadraticPinch.Global.normalization_chart_condition` (compatibility): The native Scheme composite j_N∘n_F equals j_F.

- `QuadraticPinch.Global.sourceFiniteι` (projection): The specified canonical affine-line inclusion Spec k[t]→N.

- `QuadraticPinch.Global.sourceInfinityι` (projection): The specified canonical infinity-chart inclusion I→N.

- `QuadraticPinch.Global.sourceFiniteι_isOpenImmersion` (compatibility): The canonical map s_F:Spec k[t]→N is an actual open immersion.

- `QuadraticPinch.Global.sourceInfinityι_isOpenImmersion` (compatibility): The canonical map s_I:I→N is an actual open immersion.

- `QuadraticPinch.Global.source_chart_condition` (compatibility): The equality j_N∘s_F=j_I∘s_I holds as native Scheme morphisms.

- `QuadraticPinch.Global.source_hom_ext` (compatibility): For any scheme Y, two morphisms N→Y are equal if their precompositions with s_F and s_I are equal.

- `QuadraticPinch.Global.source_charts_cover` (compatibility): Every scheme point of N lies in the image of s_F or of s_I.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `Global.normalizationSource.cusp_cover`: Every point of the glued cusp normalization source belongs to its finite or infinity chart.

- `Global.normalizationSource.nonsplit_gluing`: The nonsplit normalization chart inclusions agree after the specified overlap maps.

- `Global.normalizationSource.split_open`: The affine-line chart embeds as an actual open of the split normalization source.

### Global quadratic normalization-chart morphism

Target `G.1/global-normalization`. Proposed declaration: `QuadraticPinch.Global.normalization`.

Construct ν:N(a,b)→C(a,b) by gluing n_F∘i_F on the affine-line chart and i_I on the infinity chart. The overlap compatibility is the specified j_N∘n_F=j_F. This gives an actual global Scheme morphism before the Proj and projective-line identifications.

**Hypotheses.** k is a field and a,b∈k; q=t²+at+b. There is no separability, perfectness, characteristic or distinct-root assumption. All charts, overlaps, opens and maps use the specified native carriers. Composition in displayed chart equalities is read from left to right. C is the glued two-chart scheme and N its glued source; their Proj, projective-line and normalization-universal-property comparisons remain separate obligations.

**Inputs.** `G.1/global-normalization-source`, `G.1/global-curve`, `G.1/global-normalization-chart`, `mathlib:CategoryTheory.Limits.pushout.desc`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), arXiv2004.07025v3 §3, the one-component conductor square before Proposition3.1; authored two-chart deductions specialized from the listed pinned Mathlib gluing and localization declarations.. The source motivates the quadratic normalization/pinching comparison. These specified scheme pushouts, chart pullbacks and reciprocal coordinate identities are authored deductions; no source-printed Proj comparison, projectivity, normalization universal property or cohomology theorem is claimed here.

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3 conductor diagrams and Proposition3.2; authored specialization of existing relative normalization and dominance APIs. Motivates the actual pinched chart and structure-sheaf map. These relative integral-factorization comparisons and regressions are authored deductions; they do not establish absolute normalization, projectivity or coherent cohomology.

**Proof outline.**

1. Use the specified native maps and the listed prerequisite equalities. Apply the existing scheme or localization API named among the inputs; the immutable native prototype records the exact specialization and every algebraic step.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Supply the actual specialized two-chart scheme, finite global map and coefficient-compatible overlap before the projective-line/Proj, conductor-sheaf and finite-pushforward cohomology comparisons.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: k is an arbitrary field; a,b∈k. C,N and ν are the previously specified quadratic pinched scheme, glued source and finite morphism. No perfectness, separability, characteristic or discriminant restriction is added. Affine-open, flatness and integral-factorization hypotheses are retained exactly where stated.

- `QuadraticPinch.Global.normalization_finite_chart` (compatibility): The native equality s_F∘ν=n_F∘i_F holds.

- `QuadraticPinch.Global.normalization_infinity_chart` (compatibility): The native equality s_I∘ν=i_I holds; the chart map is the identity on I.

- `QuadraticPinch.Global.normalization_unique` (compatibility): A morphism f:N→C with restrictions n_F∘i_F and i_I is equal to the specified ν.

- `QuadraticPinch.Global.normalization_preimage_finite` (compatibility): The actual scheme-open equality ν⁻¹(im i_F)=im s_F holds.

- `QuadraticPinch.Global.normalization_preimage_infinity` (compatibility): The actual scheme-open equality ν⁻¹(im i_I)=im s_I holds.

- `QuadraticPinch.Global.normalization_finite_isPullback` (compatibility): The native Scheme square with top n_F, left s_F, right i_F and bottom ν is a pullback.

- `QuadraticPinch.Global.normalization_infinity_isPullback` (compatibility): The native Scheme square with top id_I, left s_I, right i_I and bottom ν is a pullback.

- `QuadraticPinch.Global.normalization_isFinite` (compatibility): The actual global morphism ν:N(a,b)→C(a,b) is finite over every field, including split, inseparable and characteristic-two quadratic cases. Its pullback to F is the finite affine inclusion n_F; its pullback to I is id_I. No projectivity or identification N≃P¹ is assumed.

- `QuadraticPinch.Global.normalization_to_base_finite` (compatibility): The composite s_F∘ν∘(C→Spec k) is the canonical coefficient structure morphism Spec k[t]→Spec k.

- `QuadraticPinch.Global.normalization_to_base_infinity` (compatibility): The composite s_I∘ν∘(C→Spec k) is the canonical coefficient structure morphism I→Spec k.

- `QuadraticPinch.Global.normalization_schemeTheoreticallyDominant` (compatibility; assumptions H1): For every field k and a,b∈k, the specified glued finite morphism ν:N→C is scheme-theoretically dominant.

- `QuadraticPinch.Global.normalization_kernel` (compatibility; assumptions H1): The kernel ideal sheaf of the specified morphism ν is zero.

- `QuadraticPinch.Global.normalization_sections_injective` (compatibility; assumptions H1): For every open U of C, the actual map Γ(C,U)→Γ(N,ν⁻¹U) induced by ν is injective.

- `QuadraticPinch.Global.normalization_flat_pullback_schemeTheoreticallyDominant` (compatibility; assumptions H1): For any scheme T and flat morphism g:T→C, the specified pullback projection N×_C T→T is scheme-theoretically dominant.

- `QuadraticPinch.Global.normalization_flat_pullback_kernel` (compatibility; assumptions H1): For any flat g:T→C, the kernel ideal sheaf of N×_C T→T is zero.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `Global.normalization.cusp_finite`: The global map of the two-chart characteristic-two cusp is finite.

- `Global.normalization.nonsplit_finite`: The global map of the nonsplit F₂ two-chart model is finite.

- `Global.normalization.split_infinity_pullback`: Over the split rational quadratic, the identity on the infinity chart is the actual pullback of the global map.

- `QuadraticPinch.Global.test_sections_cusp_injective`: The map on all-open structure-sheaf sections of the cusp is injective, not just the finite chart ring inclusion.

- `QuadraticPinch.Global.test_flat_pullback_kernel`: For an arbitrary flat g:T→C, the actual pullback projection has zero kernel ideal sheaf.

### Quadratic two-chart structure morphism

Target `G.1/global-structure-map`. Proposed declaration: `QuadraticPinch.Global.structureMap`.

Construct C(a,b)→Spec k by descending the actual coefficient structure morphisms on F and I. Their overlap equality is proved for the specified transition.

**Hypotheses.** k is a field and a,b∈k; q=t²+at+b. There is no separability, perfectness, characteristic or distinct-root assumption. All charts, overlaps, opens and maps use the specified native carriers. Composition in displayed chart equalities is read from left to right. C is the glued two-chart scheme and N its glued source; their Proj, projective-line and normalization-universal-property comparisons remain separate obligations.

**Inputs.** `G.1/global-curve`, `G.1/quadratic-pinch-algebra`, `G.1/overlap-equiv`, `G.1/quadratic-infinity-curve`, `mathlib:AlgebraicGeometry.Scheme.Cover.mkOfCovers`, `G.1/global-normalization`, `G.1/global-normalization-chart`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.IsZariskiLocalAtTarget.of_openCover`, `mathlib:CategoryTheory.IsPullback.isoPullback_inv_snd`, `mathlib:AlgebraicGeometry.HasAffineProperty.affineAnd_iff`, `mathlib:RingHom.finite_respectsIso`, `mathlib:RingHom.finite_localizationPreserves`, `mathlib:RingHom.finite_ofLocalizationSpan`, `G.1/overlap-chart-equiv`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), arXiv2004.07025v3 §3, the one-component conductor square before Proposition3.1; authored two-chart deductions specialized from the listed pinned Mathlib gluing and localization declarations.. The source motivates the quadratic normalization/pinching comparison. These specified scheme pushouts, chart pullbacks and reciprocal coordinate identities are authored deductions; no source-printed Proj comparison, projectivity, normalization universal property or cohomology theorem is claimed here.

**Proof outline.**

1. Use the specified native maps and the listed prerequisite equalities. Apply the existing scheme or localization API named among the inputs; the immutable native prototype records the exact specialization and every algebraic step.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Supply the actual specialized two-chart scheme, finite global map and coefficient-compatible overlap before the projective-line/Proj, conductor-sheaf and finite-pushforward cohomology comparisons.

**API.**

- `QuadraticPinch.Global.openCover_index` (compatibility): The native index type of the specified two-member open cover is Bool.

- `QuadraticPinch.Global.openCover_finite` (compatibility): The false-index cover morphism is exactly i_F.

- `QuadraticPinch.Global.openCover_infinity` (compatibility): The true-index cover morphism is exactly i_I.

- `QuadraticPinch.Global.openCover` (constructor): Construct the native two-member OpenCover of C, indexed by Bool, with false the finite chart and true the infinity chart, and maps i_F and i_I. Both objects are the actual affine schemes F and I.

- `QuadraticPinch.Global.normalization_isFinite` (compatibility): The actual global morphism ν:N(a,b)→C(a,b) is finite over every field, including split, inseparable and characteristic-two quadratic cases. Its pullback to F is the finite affine inclusion n_F; its pullback to I is id_I. No projectivity or identification N≃P¹ is assumed.

- `QuadraticPinch.Global.finiteOpen_to_base` (compatibility): The composite of j_F with the coefficient structure map F→Spec k is the canonical structure morphism Spec L→Spec k.

- `QuadraticPinch.Global.infinityOpen_to_base` (compatibility): The composite of j_I with the coefficient structure map I→Spec k is the same canonical structure morphism Spec L→Spec k.

- `QuadraticPinch.Global.structureMap_finite` (compatibility): The structure morphism C→Spec k precomposed with i_F is the actual coefficient structure morphism F→Spec k.

- `QuadraticPinch.Global.structureMap_infinity` (compatibility): The structure morphism C→Spec k precomposed with i_I is the actual coefficient structure morphism I→Spec k.

- `QuadraticPinch.Global.curve_hom_ext` (compatibility): For every scheme Y and morphisms f,g:C→Y, equality after precomposition with i_F and with i_I implies f=g.

- `QuadraticPinch.Global.normalization_to_base_finite` (compatibility): The composite s_F∘ν∘(C→Spec k) is the canonical coefficient structure morphism Spec k[t]→Spec k.

- `QuadraticPinch.Global.normalization_to_base_infinity` (compatibility): The composite s_I∘ν∘(C→Spec k) is the canonical coefficient structure morphism I→Spec k.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `Global.openCover.finite_index`: Index false of the two-member open cover is the finite chart with its specified inclusion.

- `Global.openCover.infinity_index`: Index true of the two-member open cover is the infinity chart with its specified inclusion.

- `Global.openCover.nonsplit_surjective`: The actual two-member cover is jointly surjective on the nonsplit F₂ model.

- `Global.structureMap.finite_chart`: The glued structure map restricts to the actual coefficient structure morphism on the finite chart.

- `Global.structureMap.infinity_chart`: The glued structure map restricts to the actual coefficient structure morphism on the infinity chart.

- `Global.structureMap.cusp_normalization`: The finite chart of the cusp normalization preserves the specified F₂ coefficient structure map.

### Specified reciprocal infinity ring map

Target `G.1/global-infinity-transition`. Proposed declaration: `QuadraticPinch.Global.infinityTransition`.

Define θ:Chart(a,b)→L as the canonical localization at u followed by the specified infinity equivalence and reciprocal coefficient-reversal equivalence. It is a native ring homomorphism preserving k; θ(u)=t⁻¹ and θ(z)=(tq)⁻¹.

**Hypotheses.** k is a field and a,b∈k; q=t²+at+b. There is no separability, perfectness, characteristic or distinct-root assumption. All charts, overlaps, opens and maps use the specified native carriers. Composition in displayed chart equalities is read from left to right. C is the glued two-chart scheme and N its glued source; their Proj, projective-line and normalization-universal-property comparisons remain separate obligations.

**Inputs.** `G.1/quadratic-infinity-curve`, `G.1/overlap-equiv`, `G.1/overlap-chart-equiv`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), arXiv2004.07025v3 §3, the one-component conductor square before Proposition3.1; authored two-chart deductions specialized from the listed pinned Mathlib gluing and localization declarations.. The source motivates the quadratic normalization/pinching comparison. These specified scheme pushouts, chart pullbacks and reciprocal coordinate identities are authored deductions; no source-printed Proj comparison, projectivity, normalization universal property or cohomology theorem is claimed here.

**Proof outline.**

1. Use the specified native maps and the listed prerequisite equalities. Apply the existing scheme or localization API named among the inputs; the immutable native prototype records the exact specialization and every algebraic step.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Supply the actual specialized two-chart scheme, finite global map and coefficient-compatible overlap before the projective-line/Proj, conductor-sheaf and finite-pushforward cohomology comparisons.

**API.**

- `QuadraticPinch.Global.infinityTransition_coordinate` (compatibility): The specified ring map θ sends the actual polynomial coordinate u of Chart(a,b) to the specified inverse variable t⁻¹ in L.

- `QuadraticPinch.Global.infinityTransition_constants` (compatibility): For every r∈k the specified ring map θ sends the coefficient image of r in Chart(a,b) to its coefficient image in L.

- `QuadraticPinch.Global.infinityTransition_root` (compatibility): The specified ring map θ sends the native quotient root z to the specified localization inverse of tq in L. Thus z=1/(tq) is proved for the actual gluing map, not merely for projective coordinate tuples.

- `QuadraticPinch.Global.infinityOpen_spec` (compatibility): The actual infinity overlap map j_I is exactly Spec(θ).

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `Global.infinityTransition.cusp_reciprocal`: For the cusp, the infinity coordinate maps to the inverse of t, not to t.

- `Global.infinityTransition.nonsplit_root`: For q=t²+t+1 over F₂ the infinity root maps to the specified inverse of tq.

- `Global.infinityTransition.split_constants`: The split rational transition preserves each rational coefficient.

### Integrality of the glued curve

Target `G.1/normal-curve-integral`. Proposed declaration: `QuadraticPinch.Global.curve_isIntegral`.

The specified two-chart native scheme C(a,b) satisfies AlgebraicGeometry.IsIntegral over every field k.

**Hypotheses.** k is any field and a,b∈k; q=t²+at+b. A_q=k+qk[t], I=k[u,z]/((bu²+au+1)z−u³), L=k[t,(tq)⁻¹], C and N are the incoming specified native charts and glued schemes. No separability, perfectness, nonzero discriminant or characteristic restriction is assumed. Composition ≫ is read from left to right. This is a specialization to the actual quadratic charts; general normalization and birational carriers remain imports.

**Inputs.** `G.1/quadratic-infinity-curve`, `mathlib:IsLocalization.isDomain_of_le_nonZeroDivisors`, `G.1/overlap-equiv`, `G.1/global-normalization-chart`, `mathlib:RingHom.IsIntegral.comap_surjective`, `mathlib:AlgebraicGeometry.IsIntegralHom.SpecMap_iff`, `G.1/global-curve`, `G.1/quadratic-pinch-algebra`, `mathlib:IsOpenMap.denseRange_of_isPreirreducibleSpace`, `mathlib:Continuous.range_subset_closure_image_dense`, `mathlib:IrreducibleSpace.isIrreducible_univ`, `mathlib:IsIrreducible.image`, `mathlib:AlgebraicGeometry.IsReduced.of_openCover`, `mathlib:AlgebraicGeometry.IsIntegral`, `mathlib:AlgebraicGeometry.isIntegral_of_irreducibleSpace_of_isReduced`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, one-component conductor square before Proposition3.1; authored deductions from the incoming explicit quadratic charts and the listed pinned library results.. Schröer supplies the geometric motivation. These exact native chart and stalk comparisons are authored deductions; the projective-line identification, normalization universal property and cohomology are not claimed proved by the source passage.

**Proof outline.**

1. The closure of the continuous image of the irreducible infinity chart is all C, proving irreducibility. Both affine chart rings are domains, hence their schemes are reduced. Apply the existing open-cover reducedness theorem and the native reduced-plus-irreducible criterion.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Supply the genuine finite surjective map between integral schemes, its normal source stalks and specified dense-open comparison before the projective normalization and conductor-cohomology identifications.

**API.**

- `QuadraticPinch.Global.infinity_denominator_ne_zero` (compatibility): The actual polynomial Q∞=bu²+au+1 is nonzero for every a,b∈k, including b=0 and characteristic two.

- `QuadraticPinch.Global.infinity_isDomain` (compatibility): The actual native infinity quotient I=k[u,z]/((bu²+au+1)z−u³) is an integral domain.

- `QuadraticPinch.Global.overlap_isDomain` (compatibility): The actual overlap L=k[t,(tq)⁻¹] is an integral domain and its affine spectrum is nonempty.

- `QuadraticPinch.Global.normalizationChart_surjective` (compatibility): The specified map n_F:Spec k[t]→Spec A_q induced by the actual inclusion A_q⊂k[t] is surjective on scheme points.

- `QuadraticPinch.Global.normalization_surjective` (compatibility): The actual global morphism ν:N(a,b)→C(a,b) is surjective on scheme points.

- `QuadraticPinch.Global.finiteOpen_dense` (compatibility): The specified open immersion finiteOpen:Spec L→Spec A_q has dense range.

- `QuadraticPinch.Global.infinityι_dense` (compatibility): The actual inclusion i_I:I→C of the infinity affine chart has dense range.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `Global.normalization.nonsplit_surjective`: For q=t²+t+1 over F₂, the actual global map is surjective on scheme points, including nonrational primes.

- `Global.normalization.cusp_integral`: For the characteristic-two repeated-root cusp q=t², both actual glued schemes C and N are integral.

### Integrality of the glued source

Target `G.1/normal-source-integral`. Proposed declaration: `QuadraticPinch.Global.source_isIntegral`.

The specified source N(a,b), obtained by gluing Spec k[t] and I along the actual overlap, satisfies AlgebraicGeometry.IsIntegral.

**Hypotheses.** k is any field and a,b∈k; q=t²+at+b. A_q=k+qk[t], I=k[u,z]/((bu²+au+1)z−u³), L=k[t,(tq)⁻¹], C and N are the incoming specified native charts and glued schemes. No separability, perfectness, nonzero discriminant or characteristic restriction is assumed. Composition ≫ is read from left to right. This is a specialization to the actual quadratic charts; general normalization and birational carriers remain imports.

**Inputs.** `G.1/global-normalization-chart`, `G.1/global-normalization-source`, `G.1/normal-curve-integral`, `mathlib:IsOpenMap.denseRange_of_isPreirreducibleSpace`, `mathlib:Continuous.range_subset_closure_image_dense`, `mathlib:IrreducibleSpace.isIrreducible_univ`, `mathlib:IsIrreducible.image`, `mathlib:AlgebraicGeometry.IsReduced.of_openCover`, `mathlib:AlgebraicGeometry.IsIntegral`, `mathlib:AlgebraicGeometry.isIntegral_of_irreducibleSpace_of_isReduced`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, one-component conductor square before Proposition3.1; authored deductions from the incoming explicit quadratic charts and the listed pinned library results.. Schröer supplies the geometric motivation. These exact native chart and stalk comparisons are authored deductions; the projective-line identification, normalization universal property and cohomology are not claimed proved by the source passage.

**Proof outline.**

1. The dense irreducible infinity image proves irreducibility. The polynomial chart and infinity chart are reduced; glue reducedness using the literal two-chart open cover and invoke the native integral-scheme criterion.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Supply the genuine finite surjective map between integral schemes, its normal source stalks and specified dense-open comparison before the projective normalization and conductor-cohomology identifications.

**API.**

- `QuadraticPinch.Global.normalizationOpen_dense` (compatibility): The specified open immersion normalizationOpen:Spec L→Spec k[t] has dense range.

- `QuadraticPinch.Global.sourceInfinityι_dense` (compatibility): The actual inclusion s_I:I→N of the source infinity chart has dense range.

- `QuadraticPinch.Global.infinity_isIntegrallyClosed` (compatibility): The actual infinity chart ring I(a,b) satisfies the native IsIntegrallyClosed predicate.

- `QuadraticPinch.Global.source_stalk_isIntegrallyClosed` (compatibility): For every point x of the actual scheme N(a,b), its native structure-sheaf stalk O_(N,x) satisfies IsIntegrallyClosed. Together with source_isIntegral this gives normal local domains without inventing a scheme-normality carrier.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `Global.normalization.inseparable_stalks`: For k=F₂(s) and q=t²−s, every actual source stalk is integrally closed; no separability hypothesis is used. The test instantiates this polynomial and does not assert a new proof of its irreducibility.

### Dense-open comparison of the specified map

Target `G.1/normal-partial-iso`. Proposed declaration: `QuadraticPinch.Global.normalizationPartialIso`.

Construct the actual Scheme.PartialIso from N(a,b) to C(a,b) with source im(s_I), target im(i_I), and isomorphism s_I.isoOpensRange.symm followed by i_I.isoOpensRange. The opens are proved dense and the maps are the specified infinity-chart embeddings.

**Hypotheses.** k is any field and a,b∈k; q=t²+at+b. A_q=k+qk[t], I=k[u,z]/((bu²+au+1)z−u³), L=k[t,(tq)⁻¹], C and N are the incoming specified native charts and glued schemes. No separability, perfectness, nonzero discriminant or characteristic restriction is assumed. Composition ≫ is read from left to right. This is a specialization to the actual quadratic charts; general normalization and birational carriers remain imports.

**Inputs.** `G.1/normal-source-integral`, `G.1/normal-curve-integral`, `G.1/global-normalization-source`, `G.1/global-curve`, `mathlib:AlgebraicGeometry.Scheme.PartialIso`, `mathlib:AlgebraicGeometry.Scheme.Hom.isoOpensRange`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, one-component conductor square before Proposition3.1; authored deductions from the incoming explicit quadratic charts and the listed pinned library results.. Schröer supplies the geometric motivation. These exact native chart and stalk comparisons are authored deductions; the projective-line identification, normalization universal property and cohomology are not claimed proved by the source passage.

**Proof outline.**

1. Use the native open-immersion isomorphisms onto the two actual open ranges. Compose the inverse source comparison with the target comparison and supply the two proved density fields of Scheme.PartialIso.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Supply the genuine finite surjective map between integral schemes, its normal source stalks and specified dense-open comparison before the projective normalization and conductor-cohomology identifications.

**API.**

- `QuadraticPinch.Global.normalizationPartialIso_source` (compatibility): The source open of normalizationPartialIso(a,b) is exactly im(s_I), as an equality of native opens of N.

- `QuadraticPinch.Global.normalizationPartialIso_target` (compatibility): The target open of normalizationPartialIso(a,b) is exactly im(i_I), as an equality of native opens of C.

- `QuadraticPinch.Global.normalizationPartialIso_map` (compatibility): For P=normalizationPartialIso(a,b), the actual morphism equality P.iso.hom ≫ P.target.ι = P.source.ι ≫ ν holds. This identifies the dense-open isomorphism with the restriction of the specified global map.

- `QuadraticPinch.Global.normalizationPartialIso_inverse` (compatibility): For P=normalizationPartialIso(a,b), P.iso.inv ≫ P.source.ι ≫ ν = P.target.ι. Thus the chosen inverse lands in the specified source open and is an inverse to the restricted global map.

- `QuadraticPinch.Global.normalizationPartialIso_over` (compatibility): The specified partial isomorphism is over Spec k for structure maps ν≫structureMap(a,b) on N and structureMap(a,b) on C, using native PartialIso.IsOver.

- `QuadraticPinch.Global.normalization_birationalOver` (compatibility): The native predicate Scheme.BirationalOver (ν≫structureMap(a,b)) (structureMap(a,b)) holds, witnessed by the specified normalizationPartialIso.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `Global.normalizationPartialIso.cusp_source`: For q=t² over F₂ the specified partial isomorphism has source exactly im(s_I), retaining the repeated-root case.

- `Global.normalizationPartialIso.split_target`: For q=t²−1 over ℚ the specified partial isomorphism has target exactly im(i_I).

- `Global.normalizationPartialIso.nonsplit_inverse`: For q=t²+t+1 over F₂, P.iso.inv≫P.source.ι≫ν=P.target.ι on the actual target open; an unrelated partial isomorphism fails this map comparison.

- `Global.normalizationPartialIso.over_coefficients`: For every a,b over every field, the chosen partial isomorphism is over the actual maps N→C→Spec k and C→Spec k.

### Rank two basis of a quadratic pinch

Target `G.1/quadratic-polynomial-basis`. Proposed declaration: `QuadraticPinch.polynomialBasis`.

Construct the actual native Module.Basis (Fin2) S A_q by transporting the standard basis of S×S along the S-linear coordinates. Its ordered vectors are1 and tq. This is a basis over k[q], with θ identifying S and its image.

**Hypotheses.** k is an arbitrary field; a,b∈k; q=t²+at+b; A_q is the existing scalar-remainder subalgebra k+qk[t]. S=k[T] acts by T↦q. No separability, discriminant or characteristic restriction is imposed.

**Inputs.** `G.1/quadratic-pinch-algebra`, `mathlib:Polynomial.aeval`, `mathlib:RingHom.toAlgebra`, `mathlib:Polynomial.aeval_subalgebra_coe`, `mathlib:Polynomial.comp_eq_aeval`, `G.1/quadratic-pinch-coordinates`, `mathlib:Module.Basis.finTwoProd`, `mathlib:Module.Basis.map`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3 conductor diagrams and Proposition3.2; authored polynomial-module deduction from the existing affine coordinate equivalence. The source motivates the quadratic conductor chart. The displayed rank-two basis, scalar formulas and native module properties are authored deductions; they are not attributed as printed source theorems or global normalization results.

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3 conductor diagrams and Proposition3.2; authored algebraic deduction from the incoming quadratic coordinates and parameter action. The source motivates the quadratic pinching chart. The explicit coordinate multiplication and S-algebra mapping property are authored deductions, not printed theorems of Schröer or geometric normalization/cohomology results.

**Proof outline.**

1. Use Module.Basis.finTwoProd and Module.Basis.map. Generic basis theory is imported rather than planned again.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-algebra`: Supply the actual polynomial-module coefficient interface in the quadratic affine chart. `G.1/quadratic-pinch-algebra`: Expose the exact multiplication and coefficient-compatible universal map of the already constructed affine presentation without introducing a second ring carrier. `G.1/quadratic-pinch-i1-genus`: Provide explicit affine coordinate operations and maps for the scheme and structure-sheaf comparisons; these geometric comparisons remain distinct obligations.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: k is an arbitrary field; a,b∈k; q=t²+at+b; A_q is the actual incoming subalgebra k+qk[t]. S=k[T] acts through the existing parameter homomorphism θ(P)=P(q), and e:S×S≃ₗ[S]A_q is the existing polynomialCoordinates equivalence. No characteristic, separability or discriminant restriction is imposed.

- `QuadraticPinch.parameterHom_coe` (compatibility): For every P∈k[T], the ambient value of θ(P) equals P(q) in k[t].

- `QuadraticPinch.parameterHom_coordinates` (compatibility): For every P∈S, θ(P) is exactly the image of (P,0) under the S-linear coordinates.

- `QuadraticPinch.parameterHom_injective` (compatibility): The actual evaluation θ:S→A_q is injective, so S identifies with k[q] inside the existing pinched algebra.

- `QuadraticPinch.parameterHom` (constructor): Construct the actual k-algebra homomorphism θ:k[T]→A_q by θ(P)=P(q), using native polynomial evaluation at q∈A_q. The coefficient variable T and ambient normalization coordinate t have different images.

- `QuadraticPinch.parameter_smul` (compatibility): For P∈k[T] and f∈A_q, the ambient value of P·f is P(q)f.

- `QuadraticPinch.polynomialModule_free` (compatibility): The actual θ-module A_q is native Module.Free S A_q.

- `QuadraticPinch.polynomialModule_finite` (compatibility): The actual θ-module A_q is native Module.Finite S A_q, generated by1 and tq.

- `QuadraticPinch.polynomialModule_flat` (compatibility): The actual θ-module A_q is native Module.Flat S A_q. This concerns k[T]→A_q, and gives no flatness statement for the distinct inclusion A_q→k[t].

- `QuadraticPinch.parameterAlgebra` (constructor): Give the existing commutative ring A_q the native Algebra k[T] structure induced by θ; its algebra map is θ and P·f=P(q)f. This introduces no new ring or module carrier.

- `QuadraticPinch.polynomialCoordinates_coe` (compatibility): For every pair (P,Q), the ambient polynomial of the S-linear equivalence is P(q)+tqQ(q).

- `QuadraticPinch.polynomialCoordinates_inverse` (compatibility): For each actual f∈A_q, the inverse polynomial-module coordinates equal the existing k-linear inverse coordinates as a pair of polynomials.

- `QuadraticPinch.polynomialCoordinates_smul` (compatibility): For H,P,Q∈S, e(HP,HQ)=H·e(P,Q) in the actual pinched algebra.

- `QuadraticPinch.polynomialCoordinates_reconstruction` (compatibility): For every f∈A_q with inverse coordinates (P,Q), P·b0+Q·b1=f for the actual θ-action and the actual finite basis.

- `QuadraticPinch.polynomialCoordinates` (constructor): Upgrade the existing k-linear equivalence e:(k[T]×k[T])≃A_q to a native S-linear equivalence, with ordinary componentwise S-action on its domain and the specified θ-action on its codomain. The forward function is (P,Q)↦P(q)+tqQ(q).

- `QuadraticPinch.polynomialBasis_zero` (compatibility): The ambient polynomial of the index0 polynomial-module basis vector is1.

- `QuadraticPinch.polynomialBasis_one` (compatibility): The ambient polynomial of the index1 polynomial-module basis vector is tq.

- `QuadraticPinch.polynomialBasis_repr` (compatibility): For f∈A_q with existing inverse coordinates (P,Q), the native finite basis representation has index0 coefficient P and index1 coefficient Q in S.

- `QuadraticPinch.polynomialModule_finrank` (compatibility): The native Module.finrank S A_q for the specified θ-action is2.

- `QuadraticPinch.polynomialCoordinates_mul` (compatibility; assumptions H1): For all z,w∈S×S, e(z⋆w)=e(z)e(w) in the actual pinched algebra A_q.

- `QuadraticPinch.polynomialCoordinates_inverse_mul` (compatibility; assumptions H1): For all f,g∈A_q, e⁻¹(fg)=e⁻¹(f)⋆e⁻¹(g).

- `QuadraticPinch.polynomialProduct_unit` (compatibility): For every a,b and z∈S×S, (1,0)⋆z=z.

- `QuadraticPinch.polynomialProduct` (constructor; assumptions H1): Define the coefficient product z⋆w=(z₀w₀+(T³−bT²)z₁w₁, z₀w₁+z₁w₀−aTz₁w₁) on S×S. This is an explicit function furnishing the coordinates of multiplication in the existing ring A_q, not componentwise pair multiplication or a second ring carrier.

- `QuadraticPinch.polynomialBasis_zero_eq_one` (compatibility; assumptions H1): The actual first polynomial-module basis vector b0 equals 1 in A_q, not only after ambient coercion.

- `QuadraticPinch.polynomialBasis_square` (compatibility; assumptions H1): In the actual S-algebra A_q, v²=θ(T³−bT²)−θ(aT)v, with v=b1=tq. Equivalently v²+aT·v+bT²−T³=0. The coefficients are evaluated at q, not at t.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.test_parameter_X`: For all a,b, the actual θ(T) has ambient value t²+at+b.

- `QuadraticPinch.test_parameter_cusp`: For q=t² over any field, the actual θ(T) is t².

- `QuadraticPinch.test_parameter_char2`: For q=t²+t+1 over F₂, the actual θ(T) is t²+t+1.

- `QuadraticPinch.test_parameter_action`: For every P and actual f∈A_q, the ambient scalar action is P(q)f.

- `QuadraticPinch.test_parameter_unit_action`: For every P, the actual scalar P·1 equals θ(P) in A_q.

- `QuadraticPinch.test_parameter_not_identity`: For q=t² over any field, the ambient θ(T) differs from t; the scalar action cannot be evaluation at t.

- `QuadraticPinch.test_polynomial_roundtrip`: For every a,b and polynomial pair z, the actual S-linear coordinates inverse of e(z) is z.

- `QuadraticPinch.test_polynomial_char2_scalar`: For q=t²+t+1 over F₂ and arbitrary P,Q, e(TP,TQ)=θ(T)e(P,Q), the specified scalar action.

- `QuadraticPinch.test_polynomial_not_multiplicative`: For q=t² over any field, e((0,1)²)=t³ differs from e(0,1)²=t⁶ with native componentwise pair multiplication.

- `QuadraticPinch.test_polynomial_basis_vectors`: For all a,b, the ambient ordered polynomial-module basis vectors are1 and tq.

- `QuadraticPinch.test_polynomial_basis_cusp`: For q=t² over any field, the second polynomial-module basis vector is t³ and the native module finrank over k[T] is2.

- `QuadraticPinch.test_polynomial_basis_repr`: For the actual finite basis, repr(b0)(0)=1, repr(b1)(0)=0 and repr(b1)(1)=1.

- `QuadraticPinch.test_product_cusp`: For a=b=0 over any field, the actual coefficient product (0,1)⋆(0,1) is (T³,0); componentwise pair multiplication would instead give (0,1).

- `QuadraticPinch.test_product_char2`: For a=b=1 over F₂, the actual coefficient product (0,1)⋆(0,1) is (T³−T²,−T). Both quadratic coefficients survive in characteristic two.

- `QuadraticPinch.test_product_unit`: For every a,b and z∈S×S, (1,0)⋆z=z.

**Acceptance beyond the stated contract**

- Retain the specified scalar action and the actual incoming carrier; the cusp and characteristic-two specializations obey the same statement.

### Algebra homomorphisms as quadratic roots

Target `G.1/polynomial-hom-roots`. Proposed declaration: `QuadraticPinch.polynomialHomEquivRoots`.

Construct the actual equivalence between S-algebra homomorphisms A_q→B and the subtype of y∈B satisfying y²=ι(T³−bT²)−ι(aT)y. The forward map is F↦F(v), and the inverse is y↦F_y. It describes maps of the specified parameter algebra, not a geometric normalization universal property.

**Hypotheses.** k is an arbitrary field; a,b∈k; q=t²+at+b; A_q is the actual incoming subalgebra k+qk[t]. S=k[T] acts through the existing parameter homomorphism θ(P)=P(q), and e:S×S≃ₗ[S]A_q is the existing polynomialCoordinates equivalence. No characteristic, separability or discriminant restriction is imposed. B is an arbitrary commutative S-algebra, in an independent universe; B need not be a field, reduced or nonzero. Write ι:S→B for its actual algebra map, R=T³−bT² and L=aT. Write v=b1=tq in A_q.

**Inputs.** `G.1/quadratic-polynomial-basis`, `mathlib:AlgHom.commutes`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3 conductor diagrams and Proposition3.2; authored algebraic deduction from the incoming quadratic coordinates and parameter action. The source motivates the quadratic pinching chart. The explicit coordinate multiplication and S-algebra mapping property are authored deductions, not printed theorems of Schröer or geometric normalization/cohomology results.

**Proof outline.**

1. The relation lemma makes the forward map land in the actual root subtype. Lift uniqueness gives the homomorphism-side inverse law, and the second-basis-vector formula gives the root-side inverse law.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-algebra`: Expose the exact multiplication and coefficient-compatible universal map of the already constructed affine presentation without introducing a second ring carrier. `G.1/quadratic-pinch-i1-genus`: Provide explicit affine coordinate operations and maps for the scheme and structure-sheaf comparisons; these geometric comparisons remain distinct obligations.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: k is an arbitrary field; a,b∈k; q=t²+at+b; A_q is the actual incoming subalgebra k+qk[t]. S=k[T] acts through the existing parameter homomorphism θ(P)=P(q), and e:S×S≃ₗ[S]A_q is the existing polynomialCoordinates equivalence. No characteristic, separability or discriminant restriction is imposed.

- `QuadraticPinch.polynomialEvaluation_apply` (compatibility): For every y∈B and z∈S×S, E_y(e(z))=ι(z₀)+ι(z₁)y.

- `QuadraticPinch.polynomialEvaluation_mul` (compatibility): If y∈B satisfies y²=ι(T³−bT²)−ι(aT)y, then E_y(fg)=E_y(f)E_y(g) for all f,g∈A_q.

- `QuadraticPinch.polynomialEvaluation_parameter` (compatibility): For every y∈B and P∈S, E_y(θ(P))=ι(P), without assuming that y satisfies the quadratic relation.

- `QuadraticPinch.polynomialEvaluation` (constructor): For an arbitrary y∈B, construct the actual S-linear map E_y:A_q→B given by E_y(f)=ι(e⁻¹(f)₀)+ι(e⁻¹(f)₁)y. No root equation on y is required to construct this linear map, and multiplicativity is not assumed.

- `QuadraticPinch.polynomialLift_apply` (compatibility): For every relation root y and z∈S×S, F_y(e(z))=ι(z₀)+ι(z₁)y.

- `QuadraticPinch.polynomialLift_basis` (compatibility): For every relation root y, F_y(v)=y for the actual v=b1=tq.

- `QuadraticPinch.polynomialLift_unique` (compatibility): For every relation root y and actual S-algebra homomorphism F:A_q→B with F(v)=y, F=F_y.

- `QuadraticPinch.polynomialLift` (constructor): For every y∈B satisfying y²=ι(T³−bT²)−ι(aT)y, construct the actual S-algebra homomorphism F_y:A_q→B whose underlying function is E_y. Its unit and coefficient images are the actual ring unit and the specified map ι.

- `QuadraticPinch.polynomialHom_relation` (compatibility): For every actual S-algebra homomorphism F:A_q→B, its value F(v) satisfies F(v)²=ι(T³−bT²)−ι(aT)F(v).

- `QuadraticPinch.polynomialHomEquivRoots_apply` (compatibility): For every actual S-algebra homomorphism F, the underlying element of its image under the homomorphism/root equivalence is F(v).

- `QuadraticPinch.polynomialHomEquivRoots_symm_apply` (compatibility): For every element y of the actual root subtype, the inverse homomorphism/root equivalence is exactly F_y, constructed with y’s displayed relation proof.

- `QuadraticPinch.polynomialHomEquivRoots_parameter` (compatibility): For every actual root-subtype element y and every P∈S, the inverse homomorphism/root correspondence sends θ(P) to ι(P).

- `QuadraticPinch.polynomialProduct_unit` (compatibility; assumptions H1): For every a,b and z∈S×S, (1,0)⋆z=z.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.test_evaluation_parameter`: For every y∈B and P∈S, the actual E_y(θ(P)) equals ι(P); no root equation is required.

- `QuadraticPinch.test_evaluation_zero`: For every a,b and y∈B, E_y(0)=0 in the actual target ring.

- `QuadraticPinch.test_evaluation_second`: For every a,b and y∈B, E_y(e(0,1))=y, not the first coefficient or its scalar evaluation.

- `QuadraticPinch.test_lift_self`: For B=A_q with its specified S-algebra structure and y=v with its proved quadratic relation, the actual F_v is the identity S-algebra homomorphism of A_q.

- `QuadraticPinch.test_lift_root`: For every relation root y in every commutative S-algebra B, the actual lift sends the actual second basis vector v to y.

- `QuadraticPinch.test_lift_unique`: Every actual S-algebra homomorphism sending v to a specified relation root y is equal to the constructed F_y.

- `QuadraticPinch.test_hom_roots_forward_inverse`: For every actual root-subtype element y, mapping y to its inverse homomorphism and then taking its forward root recovers y, including its relation subtype.

- `QuadraticPinch.test_hom_roots_inverse_forward`: For every actual S-algebra homomorphism F, constructing the lift of its forward root recovers exactly F.

- `QuadraticPinch.test_hom_roots_parameter`: For every root-subtype element y and P∈S, the actual inverse correspondence sends θ(P) to ι(P), with no change of the parameter action.

**Acceptance beyond the stated contract**

- The cusp, split and repeated-root quadratics, arbitrary characteristic and independent-universe coefficient algebras retain the same specified algebra and scalar action.

### Relative integral factorization of the glued map

Target `G.1/relative-normalization`. Proposed declaration: `QuadraticPinch.Global.relativeNormalization`.

For the specified finite ν:N→C, define Rν to be Mathlib’s relative normalization of C in N. Its affine sections use the integral closure inside the actual ν-pushforward section rings. This is relative to ν, not the absolute normalization of C in a generic-point function field.

**Hypotheses.** k is an arbitrary field; a,b∈k. C,N and ν are the previously specified quadratic pinched scheme, glued source and finite morphism. No perfectness, separability, characteristic or discriminant restriction is added. Affine-open, flatness and integral-factorization hypotheses are retained exactly where stated.

**Inputs.** `G.1/global-normalization`, `G.1/global-structure-map`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3 conductor diagrams and Proposition3.2; authored specialization of existing relative normalization and dominance APIs. Motivates the actual pinched chart and structure-sheaf map. These relative integral-factorization comparisons and regressions are authored deductions; they do not establish absolute normalization, projectivity or coherent cohomology.

**Proof outline.**

1. Instantiate existing relative normalization with the specified ν. Import its qcqs construction; do not plan a second normalization theory.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Provide the specified injective structure-sheaf map and its existing relative integral factorization. This is an intermediate step; generic-point normalization, P¹ and coherent cohomology remain required.

**API.**

- `QuadraticPinch.Global.relativeNormalization_factorization` (compatibility): The specified canonical morphisms satisfy i followed by r equals the previously glued ν.

- `QuadraticPinch.Global.toRelativeNormalization_isIso` (compatibility): The comparison i:N→Rν is an isomorphism, because the already constructed ν is finite and therefore integral. This does not assert that ν:N→C is an isomorphism.

- `QuadraticPinch.Global.relativeNormalizationSectionsIso` (compatibility): For each affine open U⊆C, define an isomorphism of commutative-ring objects Γ(Rν,r⁻¹U)≅integralClosure(Γ(C,U),Γ(N,ν⁻¹U)). The coefficient algebra structure is exactly the one induced by ν on U.

- `QuadraticPinch.Global.toRelativeNormalization_desc` (universal-property): For every specified integral factorization ν=f followed by g, i followed by d equals f.

- `QuadraticPinch.Global.toRelativeNormalization` (constructor): Define the specified comparison i:N→Rν by Mathlib’s canonical map to relative normalization of ν.

- `QuadraticPinch.Global.relativeNormalizationDesc_from` (universal-property): For every specified integral factorization ν=f followed by g, d followed by g equals r.

- `QuadraticPinch.Global.relativeNormalizationIso_inv_from` (compatibility): The inverse of e followed by ν equals the specified r:Rν→C.

- `QuadraticPinch.Global.fromRelativeNormalization` (constructor): Define r:Rν→C to be Mathlib’s canonical integral morphism from the relative normalization of ν.

- `QuadraticPinch.Global.relativeNormalizationIso_hom` (compatibility): The forward map of e:N≅Rν is the specified i:N→Rν.

- `QuadraticPinch.Global.relativeNormalizationDesc_eq` (universal-property): For every integral factorization ν=f followed by g, d equals the inverse of e followed by f.

- `QuadraticPinch.Global.relativeNormalizationIso` (constructor): Define e:N≅Rν using the isomorphism instance for the canonical i; its forward map is exactly i.

- `QuadraticPinch.quadratic_normalization_inclusion_not_surjective` (compatibility): For every field k and a,b∈k, the actual inclusion A_q=k+qk[t]→k[t], q=t²+at+b, is not surjective. In particular the relative comparison N≅Rν cannot be used to identify the pinched affine chart with its source.

- `QuadraticPinch.Global.relativeNormalizationSectionsIso_cancel` (compatibility): For any affine U⊆C and endomorphisms f,g of Γ(Rν,r⁻¹U), postcomposition with the specified section-comparison map gives equal maps if and only if f=g.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.Global.test_relativeNormalization_cusp`: For the cusp a=b=0 over an arbitrary field, the specified two canonical maps compose to the original ν.

- `QuadraticPinch.Global.test_relativeNormalization_char2`: For a=b=1 over F₂, the specified two canonical maps compose to the original ν, with the same coefficient field and target.

- `QuadraticPinch.Global.test_relativeNormalization_iso`: For arbitrary a,b, the actual relative normalization is isomorphic to the already glued source through the specified i.

- `QuadraticPinch.Global.test_toRelativeNormalization_cusp`: For the cusp a=b=0 over an arbitrary field, the specified two canonical maps compose to the original ν.

- `QuadraticPinch.Global.test_toRelativeNormalization_char2`: For a=b=1 over F₂, the specified two canonical maps compose to the original ν, with the same coefficient field and target.

- `QuadraticPinch.Global.test_toRelativeNormalization_descent`: For any specified integral factorization ν=f followed by g, the actual source triangle commutes.

- `QuadraticPinch.Global.test_fromRelativeNormalization_cusp`: For the cusp a=b=0 over an arbitrary field, the specified two canonical maps compose to the original ν.

- `QuadraticPinch.Global.test_fromRelativeNormalization_char2`: For a=b=1 over F₂, the specified two canonical maps compose to the original ν, with the same coefficient field and target.

- `QuadraticPinch.Global.test_fromRelativeNormalization_inverse`: For arbitrary a,b, the specified inverse comparison followed by ν is exactly the canonical map from Rν to C.

- `QuadraticPinch.Global.test_iso_forward`: The specified isomorphism has the actual canonical comparison as its forward map.

- `QuadraticPinch.Global.test_iso_cusp_left`: For the cusp, the specified isomorphism followed by its inverse is the identity of the glued source.

- `QuadraticPinch.Global.test_iso_char2_right`: For a=b=1 over F₂, the specified inverse followed by the forward map is the identity of the actual relative normalization.

- `QuadraticPinch.test_inclusion_cusp`: The actual inclusion A_q→k[t] is not surjective for q=t² over an arbitrary field (the cusp).

- `QuadraticPinch.test_inclusion_char2`: The actual inclusion A_q→k[t] is not surjective for q=t²+t+1 over F₂; the nonsplit quadratic case also retains the missing generator t.

**Acceptance beyond the stated contract**

- Use the actual ν and preimage section rings. Preserve the flatness and integrality hypotheses. The affine inclusion is not surjective, including the cusp and characteristic-two cases. All absolute normalization, Proj/P¹ and cohomology obligations remain separate.

### Affine integral-closure section comparison

Target `G.1/relative-normalization-sections-iso`. Proposed declaration: `QuadraticPinch.Global.relativeNormalizationSectionsIso`.

For each affine open U⊆C, define an isomorphism of commutative-ring objects Γ(Rν,r⁻¹U)≅integralClosure(Γ(C,U),Γ(N,ν⁻¹U)). The coefficient algebra structure is exactly the one induced by ν on U.

**Hypotheses.** k is an arbitrary field; a,b∈k. C,N and ν are the previously specified quadratic pinched scheme, glued source and finite morphism. No perfectness, separability, characteristic or discriminant restriction is added. Affine-open, flatness and integral-factorization hypotheses are retained exactly where stated.

**Inputs.** `G.1/relative-normalization`, `G.1/global-structure-map`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationObjIso`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationObjIso_hom_val`, `mathlib:AlgebraicGeometry.Scheme.Hom.fromNormalization_app`, `mathlib:AlgebraicGeometry.Scheme.Hom.appLE_map`, `mathlib:AlgebraicGeometry.Scheme.Hom.map_appLE`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3 conductor diagrams and Proposition3.2; authored specialization of existing relative normalization and dominance APIs. Motivates the actual pinched chart and structure-sheaf map. These relative integral-factorization comparisons and regressions are authored deductions; they do not establish absolute normalization, projectivity or coherent cohomology.

**Proof outline.**

1. Specialize the existing normalizationObjIso using the actual ν-section scalar algebra. Retain the affine-open hypothesis and the actual preimage rings.

2. Verify the coordinate-sensitive tests using the named native Spec, section, restriction and generic-germ maps. The supplementary finite-map, inverse and ring-homomorphism laws do not replace these tests.

3. Use the native normalizationObjIso_hom_val to identify inclusion after this comparison with the actual toNormalization appLE. Use fromNormalization_app for coefficient action and native appLE restriction laws on D(r).

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Provide the specified injective structure-sheaf map and its existing relative integral factorization. This is an intermediate step; generic-point normalization, P¹ and coherent cohomology remain required.

**API.**

- `QuadraticPinch.Global.relativeNormalizationSectionsIso_hom_inv` (compatibility): For every affine open U⊆C, the specified affine section comparison followed by its inverse is the identity of Γ(Rν,r⁻¹U).

- `QuadraticPinch.Global.relativeNormalizationSectionsIso_inv_hom` (compatibility): For every affine open U⊆C, the inverse section comparison followed by the comparison is the identity of the specified integral closure inside Γ(N,ν⁻¹U).

- `QuadraticPinch.Global.relativeNormalizationSectionsIso_cancel` (compatibility): For any affine U⊆C and endomorphisms f,g of Γ(Rν,r⁻¹U), postcomposition with the specified section-comparison map gives equal maps if and only if f=g.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.Global.test_sections_cusp_actual_pullback`: For every affine open U of the cusp and section s on the actual relative normalization above U, the underlying value of relativeNormalizationSectionsIso(s) is toRelativeNormalization.appLE(s), with the source-open inclusion given by the actual factorization triangle.

- `QuadraticPinch.Global.test_sections_nonsplit_coefficients`: For a=b=1 over F₂, every affine U and coefficient section r on C, inclusion after the comparison applied to fromRelativeNormalization.app(U)(r) equals normalization.app(U)(r). Both algebra structures are the actual coefficient pullbacks.

- `QuadraticPinch.Global.test_sections_principal_restriction`: For any a,b, affine U, r∈Γ(C,U), V=D(r) with V≠U and section s on the relative normalization above U, restrict s above V and compare, then include in Γ(N,ν⁻¹V). This equals restricting the included comparison of s above U. The only extra hypothesis asserts that the principal open is proper; it does not assert the comparison law.

- `QuadraticPinch.Global.test_sections_left`: For any affine U, the actual comparison followed by its inverse is the identity on Γ(Rν,r⁻¹U).

- `QuadraticPinch.Global.test_sections_cusp_right`: For any affine open of the cusp, the inverse comparison followed by the comparison is the identity on the specified integral closure.

- `QuadraticPinch.Global.test_sections_char2_right`: For any affine open when a=b=1 over F₂, the same inverse identity holds in the actual integral-closure ring.

**Acceptance beyond the stated contract**

- Use the actual ν and preimage section rings. Preserve the flatness and integrality hypotheses. The affine inclusion is not surjective, including the cusp and characteristic-two cases. All absolute normalization, Proj/P¹ and cohomology obligations remain separate.

### Descent through an integral factorization

Target `G.1/relative-normalization-desc`. Proposed declaration: `QuadraticPinch.Global.relativeNormalizationDesc`.

For any scheme T and specified factorization ν=f followed by g with g:T→C integral, define d:Rν→T by Mathlib’s normalizationDesc. The factorization equality is an input; it is not a field storing an absolute normalization theorem.

**Hypotheses.** k is an arbitrary field; a,b∈k. C,N and ν are the previously specified quadratic pinched scheme, glued source and finite morphism. No perfectness, separability, characteristic or discriminant restriction is added. Affine-open, flatness and integral-factorization hypotheses are retained exactly where stated.

**Inputs.** `G.1/relative-normalization`, `G.1/global-structure-map`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationDesc`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3 conductor diagrams and Proposition3.2; authored specialization of existing relative normalization and dominance APIs. Motivates the actual pinched chart and structure-sheaf map. These relative integral-factorization comparisons and regressions are authored deductions; they do not establish absolute normalization, projectivity or coherent cohomology.

**Proof outline.**

1. Instantiate the existing relative integral-factorization descent with the actual maps f,g and their equality to ν.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Provide the specified injective structure-sheaf map and its existing relative integral factorization. This is an intermediate step; generic-point normalization, P¹ and coherent cohomology remain required.

**API.**

- `QuadraticPinch.Global.toRelativeNormalization_desc` (compatibility): For every specified integral factorization ν=f followed by g, i followed by d equals f.

- `QuadraticPinch.Global.relativeNormalizationDesc_from` (compatibility): For every specified integral factorization ν=f followed by g, d followed by g equals r.

- `QuadraticPinch.Global.relativeNormalizationDesc_eq` (compatibility): For every integral factorization ν=f followed by g, d equals the inverse of e followed by f.

- `QuadraticPinch.Global.relativeNormalizationDesc_unique` (compatibility): For every specified integral factorization ν=f followed by g, any j:Rν→T with i followed by j equal to f equals d. Here the source triangle alone suffices because this particular i is an isomorphism.

- `QuadraticPinch.Global.relativeNormalizationSectionsIso_hom_inv` (compatibility): For every affine open U⊆C, the specified affine section comparison followed by its inverse is the identity of Γ(Rν,r⁻¹U).

- `QuadraticPinch.Global.relativeNormalizationSectionsIso_inv_hom` (compatibility): For every affine open U⊆C, the inverse section comparison followed by the comparison is the identity of the specified integral closure inside Γ(N,ν⁻¹U).

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.Global.test_desc_source`: In every specified integral factorization, the actual descent agrees with f after precomposition by i.

- `QuadraticPinch.Global.test_desc_target`: In every specified integral factorization, the actual descent is a morphism over C.

- `QuadraticPinch.Global.test_desc_unique`: Any map from Rν to T with the same source triangle equals the specified descent; the comparison is invertible for this particular ν.

**Acceptance beyond the stated contract**

- Use the actual ν and preimage section rings. Preserve the flatness and integrality hypotheses. The affine inclusion is not surjective, including the cusp and characteristic-two cases. All absolute normalization, Proj/P¹ and cohomology obligations remain separate.

### Function-field map of the pinching

Target `G.1/normalization-function-field-map`. Proposed declaration: `QuadraticPinch.Global.normalizationFunctionFieldMap`.

Define σ:K_C→K_N in native CommRingCat, where K_C=C.functionField and K_N=N.functionField, by the inverse stalk isomorphism for ν(η_N)=η_C followed by the actual ν.stalkMap at η_N.

**Hypotheses.** k is any field; a,b∈k; q=t²+at+b. C is the existing glued pinched curve, N its existing two-chart source, ν:N→C the actual finite morphism and H their common infinity chart. No perfectness, separability, characteristic or discriminant assumption is imposed. Nonempty-open and triangle hypotheses are required exactly where stated.

**Inputs.** `G.1/normal-curve-integral`, `G.1/normal-source-integral`, `G.1/global-normalization-source`, `G.1/global-curve`, `G.1/global-normalization-chart`, `mathlib:AlgebraicGeometry.genericPoint_eq_of_isOpenImmersion`, `mathlib:AlgebraicGeometry.Scheme.functionField`, `mathlib:TopCat.Presheaf.stalkCongr`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3 conductor squares and Propositions3.1–3.3; authored generic-point specialization of the existing common infinity chart and pinned stalk/normalization APIs. Motivates the actual finite birational pinching. The stated map, inverse and integral factorization are authored deductions, not a printed assertion of absolute-normalization isomorphism or projectivity.

**Proof outline.**

1. Import the Field instances of the native generic stalks from the two existing integral-scheme proofs.

2. Transport K_C to the stalk at ν(η_N) using the inverse of the existing stalkCongr isomorphism attached to inseparability from the proved equality. Compose with the actual contravariant ν stalk map.

3. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

4. Verify the coordinate-sensitive tests using the named native Spec, section, restriction and generic-germ maps. The supplementary finite-map, inverse and ring-homomorphism laws do not replace these tests.

**Consumers.** `G.1/absolute-normalization-comparison`: The actual inverse determines ζ in the integral factorization. `G.1/absolute-normalization-comparison`: Retain the specified generic-point lift in the universal property.

**API.**

- `QuadraticPinch.Global.normalization_genericPoint` (compatibility): The actual morphism ν maps η_N, the native generic point of N, to η_C, the native generic point of C.

- `QuadraticPinch.Global.normalization_preimage_nonempty` (compatibility): For any nonempty open U⊆C, its actual preimage ν⁻¹U is nonempty.

- `QuadraticPinch.Global.normalizationFunctionFieldMap_stalk` (compatibility): The map σ is exactly the inverse stalkCongr for ν(η_N)=η_C followed by ν.stalkMap(η_N); no arbitrary isomorphism of abstract fields is substituted.

- `QuadraticPinch.Global.normalizationFunctionFieldMap_germ` (compatibility): For any nonempty U⊆C, germ_C,U followed by σ equals ν.app(U) followed by germ_N,ν⁻¹U, as maps Γ(C,U)→K_N, with the actual nonempty-preimage instance.

- `QuadraticPinch.Global.normalizationFunctionFieldMap_isIso` (compatibility): The specified native map σ:K_C→K_N is an isomorphism in CommRingCat.

- `QuadraticPinch.Global.normalizationFunctionFieldIso_hom` (compatibility): The forward map E.hom equals the actual σ.

- `QuadraticPinch.Global.normalizationFunctionFieldIso_inv_hom` (compatibility): E.inv followed by σ equals the identity of K_N.

- `QuadraticPinch.Global.normalizationFunctionFieldIso_hom_inv` (compatibility): σ followed by E.inv equals the identity of K_C.

- `QuadraticPinch.Global.normalizationFunctionFieldIso_spec_triangle` (compatibility): Let η:Spec K_C→C and η_N:Spec K_N→N be the native fromSpecStalk morphisms. Then Spec.map(E.inv) followed by η_N followed by ν equals η.

- `QuadraticPinch.Global.normalizationFunctionFieldIso` (constructor): Define E:K_C≅K_N as the native categorical asIso of the specified σ and its proved IsIso instance; its forward map is the genuine transported ν stalk map.

- `QuadraticPinch.Global.genericPointMorphism_isAffine` (compatibility): The actual η=C.fromSpecStalk(η_C):Spec K_C→C is an affine morphism; its existing affine and separated instances therefore supply quasi-compactness and quasi-separatedness for native relative normalization.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.Global.test_functionFieldMap_cusp_coordinates`: For a=b=0 over any field, take generic germs of q and tq on the actual finite curve chart, using ΓSpecIso and the inverse open-immersion section isomorphism. normalizationFunctionFieldMap sends them to the generic germs of t² and t³ on the actual normalization chart.

- `QuadraticPinch.Global.test_functionFieldMap_nonsplit_coordinates`: For a=b=1 over F₂, the same native chart-germ constructions send q=t²+t+1 and tq to the germs of q and tq in K_N. Nonempty chart-image instances are obligations inside the example, not coordinate-correctness hypotheses.

- `QuadraticPinch.Global.test_functionFieldMap_split_infinity_coordinate`: For a=−1,b=0 over Q, use the common actual infinity chart and its native section u. The function-field map sends the curve germ of u, transported by the inverse infinity-immersion section isomorphism, to the source germ of the same u. No abstract field automorphism is chosen as a test certificate.

- `QuadraticPinch.Global.test_functionFieldMap_cusp_zero`: For the cusp a=b=0 over any field, the actual σ sends zero to zero.

- `QuadraticPinch.Global.test_functionFieldMap_nonsplit_one`: For a=b=1 over F₂, the actual σ sends one to one; the nonsplit polynomial t²+t+1 imposes no separability workaround.

- `QuadraticPinch.Global.test_functionFieldMap_nonzero`: For any a,b and any nonzero x∈K_C, the actual σ(x) is nonzero.

- `QuadraticPinch.Global.test_functionFieldIso_cusp_roundtrip`: For the cusp over any field and every x∈K_C, E.inv(σ(x))=x.

- `QuadraticPinch.Global.test_functionFieldIso_char2_roundtrip`: For a=b=1 over F₂ and every x∈K_N, σ(E.inv(x))=x.

- `QuadraticPinch.Global.test_functionFieldIso_affine_nonexample`: For every a,b, σ is an isomorphism while the actual affine inclusion A_q→k[t] is not surjective. A function-field isomorphism does not identify the pinched affine scheme with its source.

**Acceptance beyond the stated contract**

- Use the actual generic-point stalk fields and the actual ν stalk map. Retain full quadratic/nilpotent and characteristic-two generality. No opaque carrier, proposition certificate, ν-isomorphism or unproved absolute-normalization-isomorphism assumption may replace the construction.

### Integral comparison from absolute normalization

Target `G.1/absolute-normalization-comparison`. Proposed declaration: `QuadraticPinch.Global.absoluteNormalizationComparison`.

With η=C.fromSpecStalk(η_C), use the existing native scheme η.normalization, the normalization of C in its actual function field. Define δ:η.normalization→N by native normalizationDesc of the factorization η=ζ followed by ν, where ζ=Spec.map(E.inv) followed by η_N. The already finite ν is integral. No isomorphism assertion for δ is made.

**Hypotheses.** k is any field; a,b∈k; q=t²+at+b. C is the existing glued pinched curve, N its existing two-chart source, ν:N→C the actual finite morphism and H their common infinity chart. No perfectness, separability, characteristic or discriminant assumption is imposed. Nonempty-open and triangle hypotheses are required exactly where stated.

**Inputs.** `G.1/normalization-function-field-map`, `G.1/global-structure-map`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationDesc`, `mathlib:AlgebraicGeometry.IsFinite.iff_isIntegralHom_and_locallyOfFiniteType`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3 conductor squares and Propositions3.1–3.3; authored generic-point specialization of the existing common infinity chart and pinned stalk/normalization APIs. Motivates the actual finite birational pinching. The stated map, inverse and integral factorization are authored deductions, not a printed assertion of absolute-normalization isomorphism or projectivity.

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, one-component conductor square immediately before Proposition3.1; authored affine deductions from the listed pinned statements.. The paper motivates the normalization and conductor comparison. The exact affine section-ring and generic-stalk equivalences are authored deductions. No global normalization isomorphism, projectivity or cohomology theorem is attributed to this passage.

**Proof outline.**

1. The preceding affinity theorem supplies the native quasi-compact and quasi-separated hypotheses of normalization; use the existing normalization scheme and canonical arrows directly.

2. The Spec triangle supplies the exact factorization equality. Import finite-implies-integral for the existing ν and apply native normalizationDesc to ζ and ν.

3. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Identify source affine sections inside the curve function field before constructing conductor sheaves and the normalization cohomology sequence. `Schröer §3 one-component conductor square`: Provide the normalization comparison for the actual quadratic pinching charts, retaining cuspidal and inseparable cases as well as the separable nonsplit node.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: k is any field, a,b∈k and q=t²+at+b. C(a,b), N(a,b) and ν are the actual incoming two-chart schemes and finite surjective morphism. No characteristic, perfectness, separability or nonzero-discriminant restriction is imposed. K_C and K_N are the native generic-point stalk fields. Every open carrying a generic-germ algebra is nonempty; affineness is additionally required for the integral-closure equivalences. A_U and B_U use their actual section rings and ν.app(U) coefficient map.

- `QuadraticPinch.Global.absoluteNormalizationComparison_point_triangle` (compatibility): The native η.toNormalization followed by δ equals the actual ζ=Spec.map(E.inv) followed by η_N.

- `QuadraticPinch.Global.absoluteNormalizationComparison_from_triangle` (compatibility): The actual δ followed by ν equals the native η.fromNormalization:η.normalization→C.

- `QuadraticPinch.Global.absoluteNormalizationComparison_integral` (compatibility): The specified actual δ:η.normalization→N is an integral morphism.

- `QuadraticPinch.Global.absoluteNormalizationComparison_unique` (compatibility): For any actual d:η.normalization→N, if η.toNormalization followed by d equals ζ and d followed by ν equals η.fromNormalization, then d=δ. Both triangles are hypotheses; neither one alone is discarded.

- `QuadraticPinch.Global.source_affine_sections_integrallyClosed` (compatibility; assumptions H1): For every nonempty affine open V of the actual source N(a,b), its section ring Γ(N,V) is integrally closed.

- `QuadraticPinch.Global.normalization_preimage_sections_integrallyClosed` (compatibility; assumptions H1): For every nonempty affine U⊂C, the actual section ring B_U=Γ(N,ν⁻¹U) is integrally closed.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.Global.test_absoluteComparison_cusp`: For the cusp over any field, δ followed by ν equals the native η.fromNormalization.

- `QuadraticPinch.Global.test_absoluteComparison_char2`: For a=b=1 over F₂, η.toNormalization followed by δ equals Spec.map(E.inv) followed by the actual η_N.

- `QuadraticPinch.Global.test_absoluteComparison_integral`: For all a,b over any field, the actual δ is integral, without asserting it is an isomorphism.

**Acceptance beyond the stated contract**

- Use the actual generic-point stalk fields and the actual ν stalk map. Retain full quadratic/nilpotent and characteristic-two generality. No opaque carrier, proposition certificate, ν-isomorphism or unproved absolute-normalization-isomorphism assumption may replace the construction.

### Affine closure equivalence in the source field

Target `G.1/source-sections-closure-equivalence`. Proposed declaration: `QuadraticPinch.Global.normalizationSectionsClosureEquiv`.

For every nonempty affine U⊂C, construct the specified A_U-algebra equivalence e_U:B_U≃integralClosure(A_U,K_N), with the actual coefficient action c_U and generic-germ embedding of B_U.

**Hypotheses.** k is any field, a,b∈k and q=t²+at+b. C(a,b), N(a,b) and ν are the actual incoming two-chart schemes and finite surjective morphism. No characteristic, perfectness, separability or nonzero-discriminant restriction is imposed. K_C and K_N are the native generic-point stalk fields. Every open carrying a generic-germ algebra is nonempty; affineness is additionally required for the integral-closure equivalences. A_U and B_U use their actual section rings and ν.app(U) coefficient map.

**Inputs.** `G.1/normalization-function-field-map`, `G.1/global-normalization`, `mathlib:AlgebraicGeometry.Scheme.germToFunctionField`, `G.1/normal-curve-integral`, `mathlib:AlgebraicGeometry.Scheme.germToFunctionField_injective`, `mathlib:TopCat.Presheaf.germ_res`, `G.1/absolute-normalization-comparison`, `G.1/global-structure-map`, `mathlib:AlgebraicGeometry.Scheme.Hom.isIntegral_app`, `mathlib:algebraMap_isIntegral_iff`, `mathlib:IsScalarTower.of_algebraMap_eq'`, `mathlib:AlgebraicGeometry.functionField_isFractionRing_of_isAffineOpen`, `mathlib:IsIntegralClosure.of_isIntegrallyClosed`, `mathlib:IsIntegralClosure.equiv`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, one-component conductor square immediately before Proposition3.1; authored affine deductions from the listed pinned statements.. The paper motivates the normalization and conductor comparison. The exact affine section-ring and generic-stalk equivalences are authored deductions. No global normalization isomorphism, projectivity or cohomology theorem is attributed to this passage.

**Proof outline.**

1. Compare B_U and the native integral-closure subalgebra as two integral closures in K_N, using their exact scalar towers.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/absolute-normalization-comparison`: Supply the exact affine ring comparisons and restriction equations needed to identify the integral comparison δ with an isomorphism; the global scheme identification is not yet asserted. `G.1/quadratic-pinch-i1-genus`: Identify source affine sections inside the curve function field before constructing conductor sheaves and the normalization cohomology sequence. `Schröer §3 one-component conductor square`: Provide the normalization comparison for the actual quadratic pinching charts, retaining cuspidal and inseparable cases as well as the separable nonsplit node.

**API.**

- `QuadraticPinch.Global.normalizationSectionsToField_germ` (compatibility): For every nonempty U, c_U equals the generic germ A_U→K_C followed by the specified native function-field isomorphism σ:K_C→K_N.

- `QuadraticPinch.Global.normalizationSectionsToField_injective` (compatibility): For every nonempty U⊂C, the actual coefficient map c_U is injective.

- `QuadraticPinch.Global.normalizationSectionsToField_restrict` (compatibility): For nonempty V⊂U⊂C, restriction A_U→A_V followed by c_V equals c_U as ring homomorphisms.

- `QuadraticPinch.Global.normalizationSectionsToField` (constructor): For any nonempty open U⊂C, define c_U:A_U=Γ(C,U)→K_N by the actual map ν.app(U) followed by the generic germ on ν⁻¹U. The preimage is nonempty by the existing surjectivity theorem.

- `QuadraticPinch.Global.normalization_sections_integralClosure` (compatibility): For every nonempty affine U⊂C, B_U is an IsIntegralClosure of A_U in the actual K_N. Its A_U-algebra is ν.app(U), its map into K_N is the generic germ, and the coefficient map is c_U.

- `QuadraticPinch.Global.normalizationSectionsClosureEquiv_val` (compatibility): The ambient K_N-value of e_U(s) is the actual generic germ of s∈B_U.

- `QuadraticPinch.Global.normalizationSectionsClosureEquiv_coefficient` (simp): For r∈A_U, e_U(ν.app(U)(r)) is the native coefficient image in integralClosure(A_U,K_N).

- `QuadraticPinch.Global.normalizationSectionsClosureEquiv_inverse_val` (characterisation): For z∈integralClosure(A_U,K_N), the actual source generic germ of e_U⁻¹(z) is z itself.

- `QuadraticPinch.Global.normalizationFunctionFieldAlgEquiv_apply` (compatibility): The value of the coefficient-algebra equivalence on x∈K_C is exactly σ(x), the already constructed stalk map.

- `QuadraticPinch.Global.normalizationFunctionFieldAlgEquiv_coefficient` (simp): For r∈A_U, the field algebra equivalence sends the actual curve generic germ of r to c_U(r).

- `QuadraticPinch.Global.normalizationFunctionFieldAlgEquiv_symm` (compatibility): The inverse of the coefficient-algebra equivalence is exactly the incoming σ⁻¹ on every x∈K_N.

- `QuadraticPinch.Global.normalizationFunctionFieldAlgEquiv` (constructor): For every nonempty open U⊂C, upgrade the actual σ:K_C≅K_N to an A_U-algebra equivalence: K_C has its native generic-germ action and K_N has c_U. No affineness is required for this upgrade.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.Global.test_sectionsToField_cusp`: For a=b=0 over any field, c_U(r) equals σ of the actual curve generic germ of r on every nonempty U.

- `QuadraticPinch.Global.test_sectionsToField_char2_nonzero`: For k=F₂ and a=b=1, every nonzero section on a nonempty open has nonzero image under c_U.

- `QuadraticPinch.Global.test_sectionsToField_restrict`: For every inclusion of nonempty opens V⊂U, the two evaluated coefficient maps agree after actual presheaf restriction.

- `QuadraticPinch.Global.test_sourceClosure_cusp_germ`: For a=b=0, the ambient value of every e_U(s) equals the native source generic germ of s.

- `QuadraticPinch.Global.test_sourceClosure_char2_coefficient`: For k=F₂ and a=b=1, every coefficient section maps to the exact native coefficient element of the closure in K_N.

- `QuadraticPinch.Global.test_sourceClosure_integral_element`: Every actual integral element z in K_N is the generic germ of the inverse image e_U⁻¹(z).

- `QuadraticPinch.Global.test_fieldAlgebra_cusp_coefficient`: For a=b=0, the upgraded field isomorphism sends each native curve coefficient germ to c_U of that coefficient.

- `QuadraticPinch.Global.test_fieldAlgebra_char2_inverse`: For k=F₂ and a=b=1, the inverse on every source field element is exactly the specified native σ⁻¹.

- `QuadraticPinch.Global.test_fieldAlgebra_affine_nonexample`: The actual coefficient-algebra field map is bijective while the actual affine pinch inclusion A_q→k[t] is not surjective, for every a,b and every nonempty U.

### Affine closure equivalence in the curve field

Target `G.1/absolute-sections-closure-equivalence`. Proposed declaration: `QuadraticPinch.Global.absoluteSectionsClosureEquiv`.

For every nonempty affine U⊂C, construct an A_U-algebra equivalence E_U:B_U≃integralClosure(A_U,K_C), where the closure is taken inside the actual stalk-defined curve field with its native generic-germ A_U-action.

**Hypotheses.** k is any field, a,b∈k and q=t²+at+b. C(a,b), N(a,b) and ν are the actual incoming two-chart schemes and finite surjective morphism. No characteristic, perfectness, separability or nonzero-discriminant restriction is imposed. K_C and K_N are the native generic-point stalk fields. Every open carrying a generic-germ algebra is nonempty; affineness is additionally required for the integral-closure equivalences. A_U and B_U use their actual section rings and ν.app(U) coefficient map.

**Inputs.** `G.1/source-sections-closure-equivalence`, `mathlib:AlgEquiv.mapIntegralClosure`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, one-component conductor square immediately before Proposition3.1; authored affine deductions from the listed pinned statements.. The paper motivates the normalization and conductor comparison. The exact affine section-ring and generic-stalk equivalences are authored deductions. No global normalization isomorphism, projectivity or cohomology theorem is attributed to this passage.

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, one-component conductor square immediately before Proposition3.1; authored affine specialization of the listed pinned APIs.. Motivates the actual normalization. These affine section comparisons are authored deductions; global scheme isomorphism, P¹/Proj identification, projectivity and cohomology are not attributed to this passage.

**Proof outline.**

1. Compose e_U with the native integral-closure equivalence induced by σ⁻¹ over A_U. The resulting map uses the curve field itself, rather than an independently chosen fraction field.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/absolute-normalization-comparison`: Supply the exact affine ring comparisons and restriction equations needed to identify the integral comparison δ with an isomorphism; the global scheme identification is not yet asserted. `G.1/quadratic-pinch-i1-genus`: Identify source affine sections inside the curve function field before constructing conductor sheaves and the normalization cohomology sequence. `Schröer §3 one-component conductor square`: Provide the normalization comparison for the actual quadratic pinching charts, retaining cuspidal and inseparable cases as well as the separable nonsplit node. `G.1/absolute-normalization-comparison`: Compare the native normalization section rings with the actual source section rings over each affine target open. Identification with δ.app, empty-open handling and global scheme assembly remain required. `G.1/quadratic-pinch-i1-genus`: Supply coefficient-compatible affine normalization coordinates before the conductor ideal sheaf, structure-sheaf exact sequence and finite-pushforward cohomology. `Schröer §3 one-component conductor square`: Retain the actual cusp and nonsplit node as well as the split node; the section comparison is an authored deduction, not a printed global normalization or projectivity theorem.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: k is an arbitrary field; a,b∈k and q=t²+at+b. C(a,b), N(a,b) and ν:N→C are the actual incoming glued schemes and finite surjective map. No characteristic, perfectness, separability or discriminant hypothesis is added. η= C.fromSpecStalk(η_C):Spec K_C→C, where K_C is the actual generic-point stalk field. Write A_U=Γ(C,U), S_U=Γ(Spec K_C,η⁻¹U), D_U=Γ(η.normalization,η.fromNormalization⁻¹U) and B_U=Γ(N,ν⁻¹U). The A_U-actions on S_U,D_U,B_U are exactly η.app(U), η.fromNormalization.app(U), ν.app(U); the action on K_C is its native generic germ. Every U used with K_C is nonempty; the closure and source comparisons additionally require IsAffineOpen U. Empty opens have no nonempty witness and are not covered by these equivalences.

- `QuadraticPinch.Global.absoluteSectionsClosureEquiv_val` (compatibility): For s∈B_U, the ambient K_C-value of E_U(s) is σ⁻¹(germ_N(s)).

- `QuadraticPinch.Global.absoluteSectionsClosureEquiv_coefficient` (compatibility): For r∈A_U, E_U(ν.app(U)(r)) equals the image of r under the native algebra map A_U→integralClosure(A_U,K_C).

- `QuadraticPinch.Global.absoluteSectionsClosureEquiv_restrict` (compatibility): For nonempty affine V⊂U and s∈B_U, the ambient values in K_C of E_V(res(s)) and E_U(s) agree, where res is the actual structure-presheaf restriction Γ(N,ν⁻¹U)→Γ(N,ν⁻¹V).

- `QuadraticPinch.Global.absoluteSectionsClosureEquiv_inverse_val` (compatibility): For z∈integralClosure(A_U,K_C), the generic germ of E_U⁻¹(z) equals σ(z).

- `QuadraticPinch.Global.absoluteSectionsClosureEquiv_inverse_restrict` (compatibility): Let nonempty affine V⊂U and let z_U and z_V lie in the two native closures inside K_C with equal ambient values. Then the actual restriction of E_U⁻¹(z_U) equals E_V⁻¹(z_V).

- `QuadraticPinch.Global.normalizationSectionsClosureEquiv_coefficient` (compatibility): For r∈A_U, e_U(ν.app(U)(r)) is the native coefficient image in integralClosure(A_U,K_N).

- `QuadraticPinch.Global.normalizationSectionsClosureEquiv_inverse_val` (compatibility): For z∈integralClosure(A_U,K_N), the actual source generic germ of e_U⁻¹(z) is z itself.

- `QuadraticPinch.Global.normalizationFunctionFieldAlgEquiv_coefficient` (compatibility): For r∈A_U, the field algebra equivalence sends the actual curve generic germ of r to c_U(r).

- `QuadraticPinch.Global.normalizationFunctionFieldAlgEquiv_symm` (compatibility): The inverse of the coefficient-algebra equivalence is exactly the incoming σ⁻¹ on every x∈K_N.

- `QuadraticPinch.Global.normalizationGenericSectionsAlgEquiv_coefficient` (compatibility; assumptions H1): For r∈A_U, κ_U(η.app(U)(r))=germ_C,U(r) in the actual stalk field K_C.

- `QuadraticPinch.Global.normalizationGenericSectionsAlgEquiv_restrict` (compatibility; assumptions H1): For nonempty V⊂U and s∈S_U, κ_V(res_S(s))=κ_U(s), where res_S is the actual structure-presheaf restriction on Spec K_C along η⁻¹V⊂η⁻¹U. Affineness is not required.

- `QuadraticPinch.Global.normalizationGenericSectionsAlgEquiv_inverse_coefficient` (compatibility; assumptions H1): For r∈A_U, κ_U⁻¹(germ_C,U(r))=η.app(U)(r) in S_U.

- `QuadraticPinch.Global.normalizationGenericSectionsAlgEquiv` (constructor; assumptions H1): For every nonempty open U⊂C, upgrade the pinned rational-function ring equivalence to κ_U:S_U≃ₐ[A_U]K_C, with the exact η.app(U) action. Its underlying ring equivalence is the existing Tau Ceti rationalFunctionsRingEquiv; no new rational-function sheaf or generic-preimage theory is defined.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.Global.test_absoluteClosure_cusp_coefficient`: For a=b=0, E_U sends every pulled-back coefficient to its native image in the closure inside K_C.

- `QuadraticPinch.Global.test_absoluteClosure_char2_integral_element`: For k=F₂ and a=b=1, the source generic germ of E_U⁻¹(z) is the actual σ(z) for every integral element z in K_C.

- `QuadraticPinch.Global.test_absoluteClosure_overlap`: On any nonempty affine inclusion V⊂U, integral elements in K_C with equal ambient values have inverse images agreeing under the actual source restriction.

- `QuadraticPinch.Global.test_absoluteClosure_empty_open_excluded`: The empty open of C has no nonempty instance, so the generic-field section comparison cannot be instantiated there.

- `QuadraticPinch.Global.test_genericSections_cusp_coefficient`: For the cusp a=b=0, κ_U sends every actual pulled-back coefficient η.app(U)(r) to its native curve generic germ.

- `QuadraticPinch.Global.test_genericSections_char2_restriction`: For k=F₂ and a=b=1, the nonsplit quadratic case, κ_V(res_S(s))=κ_U(s) for every nonempty V⊂U and every actual generic section s.

- `QuadraticPinch.Global.test_genericSections_empty_excluded`: The empty open of C has no Nonempty witness, so the generic-field section equivalence cannot be instantiated there.

### Affine sections of native and chart normalizations

Target `G.1/native-normalization-source-sections-equivalence`. Proposed declaration: `QuadraticPinch.Global.absoluteNormalizationSourceSectionsEquiv`.

For every nonempty affine U⊂C, construct Ψ_U:D_U≃ₐ[A_U]B_U as θ_U followed by the inverse of the incoming E_U:B_U≃ₐ[A_U]integralClosure(A_U,K_C). This is a section equivalence; it does not yet identify Ψ_U with δ.app or assert δ is an isomorphism.

**Hypotheses.** k is an arbitrary field; a,b∈k and q=t²+at+b. C(a,b), N(a,b) and ν:N→C are the actual incoming glued schemes and finite surjective map. No characteristic, perfectness, separability or discriminant hypothesis is added. η= C.fromSpecStalk(η_C):Spec K_C→C, where K_C is the actual generic-point stalk field. Write A_U=Γ(C,U), S_U=Γ(Spec K_C,η⁻¹U), D_U=Γ(η.normalization,η.fromNormalization⁻¹U) and B_U=Γ(N,ν⁻¹U). The A_U-actions on S_U,D_U,B_U are exactly η.app(U), η.fromNormalization.app(U), ν.app(U); the action on K_C is its native generic germ. Every U used with K_C is nonempty; the closure and source comparisons additionally require IsAffineOpen U. Empty opens have no nonempty witness and are not covered by these equivalences.

**Inputs.** `G.1/absolute-sections-closure-equivalence`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationObjIso`, `mathlib:AlgebraicGeometry.Scheme.Hom.fromNormalization_app`, `mathlib:AlgEquiv.mapIntegralClosure`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, one-component conductor square immediately before Proposition3.1; authored affine specialization of the listed pinned APIs.. Motivates the actual normalization. These affine section comparisons are authored deductions; global scheme isomorphism, P¹/Proj identification, projectivity and cohomology are not attributed to this passage.

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, terminology and both conductor squares immediately before Proposition 3.1; authored deduction using the specified pinned section and target-local APIs.. Motivation only: the actual δ isomorphism and its all-open section algebra APIs are authored deductions. This passage is not claimed to prove our native chart/Proj identification, projectivity or cohomology.

**Proof outline.**

1. Compose the two actual A_U-algebra equivalences through the same native integral closure in K_C.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/absolute-normalization-comparison`: Compare the native normalization section rings with the actual source section rings over each affine target open. Identification with δ.app, empty-open handling and global scheme assembly remain required. `G.1/quadratic-pinch-i1-genus`: Supply coefficient-compatible affine normalization coordinates before the conductor ideal sheaf, structure-sheaf exact sequence and finite-pushforward cohomology. `Schröer §3 one-component conductor square`: Retain the actual cusp and nonsplit node as well as the split node; the section comparison is an authored deduction, not a printed global normalization or projectivity theorem. `G.1/quadratic-pinch-i1-genus`: Identify the actual absolute normalization before the native projective-line/Proj comparison, conductor ideal sheaf and structure-sheaf exact sequence and finite-pushforward H0/H1. `Schröer §3 one-component conductor square`: Supply actual normalization maps uniformly for the cusp and split and nonsplit nodes; the comparison is an authored deduction from incoming constructions and pinned native APIs. `Native normalization section calculations`: Evaluate the actual forward/inverse maps, commute both directions with restriction on every open, and recover the previously derived affine closure coordinates.

**API.**

API assumptions, grouped to avoid repeating the same hypotheses:

- **H1**: k is an arbitrary field; a,b∈k and q=t²+at+b. C=curve(a,b), N=normalizationSource(a,b) and ν:N→C are the actual incoming glued schemes and finite surjective map. No characteristic, perfectness, separability or discriminant hypothesis is added. η=C.fromSpecStalk(η_C):Spec K_C→C, σ:K_C≅K_N is the incoming native stalk-field isomorphism, ζ=Spec.map(σ.inv)≫N.fromSpecStalk(η_N), and δ:η.normalization→N is the existing actual normalizationDesc comparison satisfying both triangles. A_U=Γ(C,U), B_U=Γ(N,ν⁻¹U), S_U=Γ(Spec K_C,η⁻¹U), D_U=Γ(η.normalization,η.fromNormalization⁻¹U). All A_U-actions are the actual η.app(U), ν.app(U), η.fromNormalization.app(U) and native generic germ. E_U, θ_U, κ_U and Ψ_U refer to the existing actual algebra equivalences, with nonemptiness and affinity exactly where the statement says so. Δ and Λ allow every open; a generic-field value is used only on nonempty opens.

- `QuadraticPinch.Global.absoluteNormalizationSectionsClosureEquiv_coefficient` (compatibility): For r∈A_U, θ_U(η.fromNormalization.app(U)(r)) is the native algebra-map image of r in integralClosure(A_U,K_C).

- `QuadraticPinch.Global.absoluteNormalizationSectionsClosureEquiv_val` (compatibility): For s∈D_U, the ambient K_C-value of θ_U(s) equals κ_U applied to the ambient S_U-value of η.normalizationObjIso(U)(s). Both section maps are the actual native maps.

- `QuadraticPinch.Global.absoluteNormalizationSectionsClosureEquiv_inverse_val` (compatibility): For z∈integralClosure(A_U,K_C), applying η.normalizationObjIso(U), its ambient S_U inclusion and κ_U to θ_U⁻¹(z) gives exactly the ambient K_C-value of z.

- `QuadraticPinch.Global.absoluteNormalizationSectionsClosureEquiv` (constructor): For every nonempty affine U⊂C, construct θ_U:D_U≃ₐ[A_U]integralClosure(A_U,K_C). Use the actual native η.normalization and η.normalizationObjIso, rather than a replacement section carrier or an assumed isomorphism of schemes.

- `QuadraticPinch.Global.absoluteNormalizationSourceSectionsEquiv_coefficient` (compatibility): For r∈A_U, Ψ_U(η.fromNormalization.app(U)(r))=ν.app(U)(r) in B_U.

- `QuadraticPinch.Global.absoluteNormalizationSourceSectionsEquiv_closure` (compatibility): For s∈D_U, E_U(Ψ_U(s))=θ_U(s) as elements of the actual integralClosure(A_U,K_C).

- `QuadraticPinch.Global.absoluteNormalizationSourceSectionsEquiv_inverse_closure` (compatibility): For s∈B_U, θ_U(Ψ_U⁻¹(s))=E_U(s) in the actual integralClosure(A_U,K_C).

- `QuadraticPinch.Global.absoluteNormalizationSectionsClosureEquiv_generic_value` (compatibility; assumptions H1): For each nonempty affine U and s∈D_U, the ambient value of θ_U(s) is κ_U(η.toNormalization.appLE(s)).

- `QuadraticPinch.Global.absoluteNormalizationSectionsClosureEquiv_restrict` (compatibility; assumptions H1): For nonempty affine V⊆U and s∈D_U, θ_V(res_D(s)).val=θ_U(s).val in K_C.

- `QuadraticPinch.Global.absoluteNormalizationSourceSectionsEquiv_restrict` (compatibility; assumptions H1): For nonempty affine V⊆U and s∈D_U, Ψ_V(res_D(s))=res_N(Ψ_U(s)).

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.Global.test_nativeClosure_cusp_coefficient`: For a=b=0, θ_U sends each η.fromNormalization.app(U)(r) to the native coefficient image in integralClosure(A_U,K_C).

- `QuadraticPinch.Global.test_nativeClosure_char2_integral_element`: For k=F₂ and a=b=1, κ_U applied to the ambient value of η.normalizationObjIso(U)(θ_U⁻¹(z)) is the actual ambient K_C-value of every integral element z.

- `QuadraticPinch.Global.test_nativeClosure_affine_inclusion_nonexample`: For every a,b and nonempty affine U, θ_U is bijective while the original quadratic affine inclusion A_q→k[t] is not surjective. The section equivalence does not imply that original inclusion is an isomorphism.

- `QuadraticPinch.Global.test_normalizationSource_cusp_coefficient`: For a=b=0, Ψ_U sends the actual native-normalization pullback of each r∈A_U to the actual ν pullback of r.

- `QuadraticPinch.Global.test_normalizationSource_char2_closure`: For k=F₂ and a=b=1, θ_U(Ψ_U⁻¹(s))=E_U(s) for every actual source section s over a nonempty affine U.

- `QuadraticPinch.Global.test_normalizationSource_affine_inclusion_nonexample`: For every a,b and nonempty affine U, Ψ_U is bijective although the actual original affine pinch inclusion A_q→k[t] is not surjective.

### The actual comparison on all section algebras

Target `G.1/absolute-comparison-absolute-normalization-comparison-sections-alg-equiv`. Proposed declaration: `QuadraticPinch.Global.absoluteNormalizationComparisonSectionsAlgEquiv`.

For every open U⊂C, construct Λ_U:B_U≃ₐ[A_U]D_U from the actual bijective Δ_U and its actual coefficient compatibility. No affinity or nonemptiness assumption is imposed.

**Hypotheses.** k is an arbitrary field; a,b∈k and q=t²+at+b. C=curve(a,b), N=normalizationSource(a,b) and ν:N→C are the actual incoming glued schemes and finite surjective map. No characteristic, perfectness, separability or discriminant hypothesis is added. η=C.fromSpecStalk(η_C):Spec K_C→C, σ:K_C≅K_N is the incoming native stalk-field isomorphism, ζ=Spec.map(σ.inv)≫N.fromSpecStalk(η_N), and δ:η.normalization→N is the existing actual normalizationDesc comparison satisfying both triangles. A_U=Γ(C,U), B_U=Γ(N,ν⁻¹U), S_U=Γ(Spec K_C,η⁻¹U), D_U=Γ(η.normalization,η.fromNormalization⁻¹U). All A_U-actions are the actual η.app(U), ν.app(U), η.fromNormalization.app(U) and native generic germ. E_U, θ_U, κ_U and Ψ_U refer to the existing actual algebra equivalences, with nonemptiness and affinity exactly where the statement says so. Δ and Λ allow every open; a generic-field value is used only on nonempty opens.

**Inputs.** `G.1/absolute-normalization-comparison`, `mathlib:AlgebraicGeometry.Scheme.Hom.appLE_comp_appLE`, `G.1/native-normalization-source-sections-equivalence`, `G.1/absolute-sections-closure-equivalence`, `G.1/normalization-function-field-map`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.genericPoint_mem`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.fromSpecFunctionField_preimage`, `mathlib:AlgebraicGeometry.Scheme.fromSpecStalk_app`, `mathlib:AlgebraicGeometry.Scheme.ΓSpecIso_naturality`, `mathlib:AlgebraicGeometry.Scheme.Hom.comp_appLE`, `mathlib:AlgebraicGeometry.Scheme.Hom.map_appLE`, `mathlib:AlgebraicGeometry.Scheme.Hom.appLE_map`, `mathlib:CategoryTheory.ConcreteCategory.isIso_iff_bijective`, `G.1/global-structure-map`, `mathlib:AlgebraicGeometry.IsZariskiLocalAtTarget.iff_of_iSup_eq_top`, `mathlib:AlgebraicGeometry.iSup_affineOpens_eq_top`, `mathlib:TopologicalSpace.IsOpenCover.comap`, `mathlib:AlgebraicGeometry.isIso_morphismRestrict_iff_isIso_app`, `mathlib:CategoryTheory.asIso`, `mathlib:RingEquiv.ofBijective`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3), §3, terminology and both conductor squares immediately before Proposition 3.1; authored deduction using the specified pinned section and target-local APIs.. Motivation only: the actual δ isomorphism and its all-open section algebra APIs are authored deductions. This passage is not claimed to prove our native chart/Proj identification, projectivity or cohomology.

**Proof outline.**

1. Apply the native ring equivalence of the actual bijective Δ_U; equip it with the A_U commutation law already proved using the two actual section actions.

2. The API below includes the coordinate, restriction, projection and inverse laws used by this target. Establish these within its proof; they are not separate roadmap targets.

**Consumers.** `G.1/quadratic-pinch-i1-genus`: Identify the actual absolute normalization before the native projective-line/Proj comparison, conductor ideal sheaf and structure-sheaf exact sequence and finite-pushforward H0/H1. `Schröer §3 one-component conductor square`: Supply actual normalization maps uniformly for the cusp and split and nonsplit nodes; the comparison is an authored deduction from incoming constructions and pinned native APIs. `Native normalization section calculations`: Evaluate the actual forward/inverse maps, commute both directions with restriction on every open, and recover the previously derived affine closure coordinates.

**API.**

- `QuadraticPinch.Global.absoluteNormalizationComparisonSections_generic_app` (compatibility): For every open U, Δ_U followed by the actual η.toNormalization section map equals the actual ζ section map B_U→S_U.

- `QuadraticPinch.Global.absoluteNormalizationComparisonSections_closure` (compatibility): For nonempty affine U and s∈B_U, θ_U(Δ_U(s))=E_U(s) in integralClosure(A_U,K_C).

- `QuadraticPinch.Global.absoluteNormalizationComparisonSections_eq_inverse` (compatibility): For nonempty affine U and s∈B_U, Δ_U(s)=Ψ_U⁻¹(s) in D_U.

- `QuadraticPinch.Global.absoluteNormalizationComparisonSections_coefficient` (compatibility): For every open U and r∈A_U, Δ_U(ν.app(U)(r))=η.fromNormalization.app(U)(r).

- `QuadraticPinch.Global.absoluteNormalizationComparisonSections_restrict` (compatibility): For every inclusion V⊆U, res_N followed by Δ_V equals Δ_U followed by res_D, as actual ring morphisms B_U→D_V.

- `QuadraticPinch.Global.absoluteNormalizationComparisonSections_bijective` (compatibility): For every affine U, including U=∅, the actual map Δ_U is bijective.

- `QuadraticPinch.Global.absoluteNormalizationComparisonSections_bijective_all` (compatibility): For every open U⊂C, the actual map Δ_U is bijective, with no affinity or nonemptiness assumption.

- `QuadraticPinch.Global.absoluteNormalizationComparisonSections` (constructor): For every open U⊂C, construct Δ_U:B_U→D_U as the actual δ.appLE on ν⁻¹U and η.fromNormalization⁻¹U, using δ≫ν=η.fromNormalization to transport the target open.

- `QuadraticPinch.Global.absoluteNormalizationComparisonSections_generic_value` (compatibility): For nonempty affine U and s∈B_U, θ_U(Δ_U(s)).val=κ_U(ζ.appLE(s)).

- `QuadraticPinch.Global.genericPointLiftSections_value` (compatibility): For every nonempty open U and s∈B_U, κ_U(ζ.appLE(s))=σ.inv(germ_N(s)). Affinity is not required.

- `QuadraticPinch.Global.absoluteNormalizationComparisonSections_bijective_nonempty` (compatibility): For every nonempty affine U, the actual map Δ_U is bijective.

- `QuadraticPinch.Global.absoluteNormalizationComparisonSections_bijective_empty` (compatibility): The actual map Δ_∅ is bijective between the two native empty-open section rings.

- `QuadraticPinch.Global.absoluteNormalizationComparison_affine_app_isIso` (compatibility): For every affine U⊂C, the actual δ.app(ν⁻¹U) is an isomorphism in CommRingCat.

- `QuadraticPinch.Global.absoluteNormalizationComparison_isIso` (compatibility): For every field k and a,b∈k, the actual comparison δ:η.normalization→N is an isomorphism of schemes.

- `QuadraticPinch.Global.absoluteNormalizationIso_hom` (compatibility): I.hom=δ as actual scheme morphisms.

- `QuadraticPinch.Global.absoluteNormalizationIso_hom_inv` (compatibility): I.hom≫I.inv is the identity on η.normalization.

- `QuadraticPinch.Global.absoluteNormalizationIso_inv_hom` (compatibility): I.inv≫I.hom is the identity on N.

- `QuadraticPinch.Global.absoluteNormalizationIso_inv_from` (compatibility): I.inv≫η.fromNormalization=ν as actual scheme morphisms N→C.

- `QuadraticPinch.Global.absoluteNormalizationIso_point_inv` (compatibility): ζ≫I.inv=η.toNormalization as actual scheme morphisms Spec K_C→η.normalization.

- `QuadraticPinch.Global.absoluteNormalizationIso` (constructor): Construct I:η.normalization≅N whose hom is exactly the existing actual comparison δ.

- `QuadraticPinch.Global.absoluteNormalizationComparisonSectionsAlgEquiv_apply` (compatibility): For every open U and s∈B_U, Λ_U(s)=Δ_U(s).

- `QuadraticPinch.Global.absoluteNormalizationComparisonSectionsAlgEquiv_symm_apply` (compatibility): For every open U and s∈B_U, Λ_U⁻¹(Δ_U(s))=s.

- `QuadraticPinch.Global.absoluteNormalizationComparisonSectionsAlgEquiv_apply_symm` (compatibility): For every open U and s∈D_U, Δ_U(Λ_U⁻¹(s))=s.

- `QuadraticPinch.Global.absoluteNormalizationComparisonSectionsAlgEquiv_inverse_coefficient` (compatibility): For every open U and r∈A_U, Λ_U⁻¹(η.fromNormalization.app(U)(r))=ν.app(U)(r).

- `QuadraticPinch.Global.absoluteNormalizationComparisonSectionsAlgEquiv_restrict` (compatibility): For every V⊆U and s∈B_U, Λ_V(res_N(s))=res_D(Λ_U(s)).

- `QuadraticPinch.Global.absoluteNormalizationComparisonSectionsAlgEquiv_inverse_restrict` (compatibility): For every V⊆U and s∈D_U, Λ_V⁻¹(res_D(s))=res_N(Λ_U⁻¹(s)).

- `QuadraticPinch.Global.absoluteNormalizationComparisonSectionsAlgEquiv_eq_source_symm` (compatibility): For every nonempty affine U, Λ_U=Ψ_U⁻¹ as A_U-algebra equivalences.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `QuadraticPinch.Global.test_comparisonSections_cusp_coefficient`: For a=b=0 and every open U, Δ_U sends the actual ν pullback of r∈A_U to the actual η.fromNormalization pullback of r.

- `QuadraticPinch.Global.test_comparisonSections_char2_inverse`: For k=F₂ and a=b=1 and nonempty affine U, the actual Δ_U(s) equals Ψ_U⁻¹(s) for every s∈B_U.

- `QuadraticPinch.Global.test_comparisonSections_empty`: For every a,b, the actual Δ_∅ is bijective between the native empty-open section rings.

- `QuadraticPinch.Global.test_absoluteNormalizationIso_cusp_from`: For a=b=0, I.hom≫ν=η.fromNormalization as actual scheme morphisms.

- `QuadraticPinch.Global.test_absoluteNormalizationIso_char2_point`: For k=F₂ and a=b=1, ζ≫I.inv=η.toNormalization as actual scheme morphisms.

- `QuadraticPinch.Global.test_absoluteNormalizationIso_pinch_nonexample`: For every a,b, the actual δ is a scheme isomorphism while the original affine pinch inclusion A_q→k[t] is not surjective; these are distinct morphisms.

- `QuadraticPinch.Global.test_comparisonAlgEquiv_cusp_inverse_coefficient`: For a=b=0 and every open U, Λ_U⁻¹ sends the actual η.fromNormalization pullback of r∈A_U to the actual ν pullback of r.

- `QuadraticPinch.Global.test_comparisonAlgEquiv_char2_restrict`: For k=F₂ and a=b=1 and every V⊆U, the actual Λ maps commute with native section restriction, without affinity or nonemptiness assumptions.

- `QuadraticPinch.Global.test_comparisonAlgEquiv_empty_nonexample`: For every a,b, Λ_∅ is bijective even though the empty open has no Nonempty witness; it cannot be represented by a generic-field equivalence requiring such a witness.

**Remaining proof obligations for G.1**

- Identify the glued source with the native projective line and the pinched scheme with the specified Proj cubic; prove properness/projectivity and their exact chart comparisons.

- Specialize the general conductor ideal sheaf and ShortExact sequence to the pinching map, identify the E/k defect, and derive finite-pushforward H⁰/H¹ and genus.

- Supply the separate two-component I₂ scheme construction and finite-extension geometric-point/cohomology adapters; affine option-point counts alone do not supply them.

- Close the component/Picard descent, general Lang/genus-zero forms, quasielliptic and SF.3 pointed-curve presentation supplier interfaces recorded in the gaps.

## G.2 — Multiple fibers over excellent discrete valuation rings

The multiple-fiber comparison begins over an excellent henselian DVR with a transverse horizontal divisor. Its intersection with the reduced fiber is Spec k, whereas its schematic special fiber has length m. Normalization after that base change and a lifted section give the cohomological adapter and the reduced-fiber isogeny. Extension counts and the F₂ isomorphism follow through the finite-field classifier. Henselization must preserve the specified model properties before the result applies to an arbitrary excellent DVR. The LLR Kodaira comparison retains an algebraically closed residue field and is not applied directly over F₂.

**Planets:** Transverse divisor; Multiple-fiber isogeny; Torsor fiber comparison.

### Transverse horizontal DVR divisor

Target `G.2/transverse-divisor`.

For the proper regular genus-one model over an excellent henselian DVR R used in Proposition 8.1, whose special fiber is m times a smooth reduced elliptic curve, construct at a rational point d of that reduced fiber a regular horizontal Cartier divisor D finite over R and itself the spectrum of a DVR with residue field k, such that D intersects the reduced fiber in Spec k. The schematic fiber D⊗_R k has length m; only D∩(X_k)_red is Spec k.

**Inputs.** `tauceti:TauCeti.Model`, `G.1/fiber-type-divisor`, `SchemeAndStackFoundations:SF.0`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Schröer Proposition 8.1 proof, pp. 21–22, using EGA IV₄ 18.5.11(c); arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Choose a lift of a parameter transverse to the reduced smooth elliptic fiber at d.

2. The quotient of the regular two-dimensional local ring by that parameter is a DVR; the uniformizer of R has order m there.

3. Choose the henselian finite horizontal component through d using EGAIV4 18.5.11(c); properness plus quasi-finiteness makes it finite over R.

**Acceptance beyond the stated contract**

- For m>1 the special fiber is nonreduced of length m, even though the residue extension has degree1.

### Normal model after transverse base change

Target `G.2/normal-dominating-model`.

After the transverse DVR base change R′/R, normalize the model and take a normal proper model Y dominating it and the elliptic scheme E_R′, with their identified generic fibers. A section of the base-changed model lifts to Y.

**Hypotheses.** R excellent henselian; D=Spec R′ as in the transverse-divisor node.

**Inputs.** `G.2/transverse-divisor`, `tauceti:TauCeti.Model`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Schröer Proposition 8.1 proof, pp. 21–22; Raynaud 6.1.4 and 8.2.1; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Excellence gives finiteness of normalization, so the normalized model remains proper.

2. Take the normalized closure of the graph of the generic isomorphism; use properness to extend the generic section along Spec R′.

3. Use integrality and torsion-freeness over a DVR for flatness; prove generic geometric integrality and f_*O_Y=O_R′ by normality and Stein factorization.

**Acceptance beyond the stated contract**

- The base-changed model may be nonnormal; a claimed section cannot remove normalization.

### Cohomological flatness and genus of the dominating fiber

Target `G.2/cohomology-adapter`.

For that Y→Spec R′ verify Raynaud (N)* and f_*O_Y=O_R′. The lifted section gives cohomological flatness in degree0. Its special fiber C has dim_k H⁰(C,O)=1 and, since χ(O_C)=χ(O_generic)=0, dim_k H¹(C,O)=1.

**Inputs.** `G.2/normal-dominating-model`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Schröer Proposition 8.1 proof, pp. 21–22; Raynaud 6.1.4 and 8.2.1; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Check local Noetherian normality and the generic-fiber condition of Raynaud6.1.4 (N)* on Y; use the preceding node for the Stein condition.

2. Apply the owner’s Raynaud8.2.1 criterion with the lifted section.

3. Use proper flat Euler-characteristic constancy, finite-dimensionality and degree≥2 vanishing; solve h⁰−h¹=0.

**Acceptance beyond the stated contract**

- A section alone is not a proof of every hypothesis of Raynaud’s criterion.

### Genus under domination of an elliptic curve

Target `G.2/domination-genus`.

For any field k, an integral proper k-curve C with a dominant morphism to an elliptic curve E/k satisfies h¹(O_C)≥1.

**Inputs.** `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.5`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Lemma 8.4, pp. 23–24; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. A nonconstant proper map of integral curves is finite of positive degree d.

2. Pullback and the divisor norm compose as multiplication by d on Pic⁰(E).

3. If h¹(O_C)=0 the connected Picard object is trivial, whereas E has geometric points outside E[d]; derive the contradiction.

**Acceptance beyond the stated contract**

- The norm argument covers inseparable maps; do not invoke a separable Hurwitz formula without its hypothesis.

### Regularity in the genus-one equality case

Target `G.2/equality-regular`.

In the preceding situation, h¹(O_C)=1 implies that C is regular.

**Inputs.** `G.2/domination-genus`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Lemma 8.4, pp. 23–24; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Normalize C; its normalization still dominates E and has h¹≥1 by the domination-genus node.

2. Use the normalization exact sequence and compare H¹, including its vector-space structure over the normalization constant field.

3. The equality h¹=1 forces that field to equal k and the delta quotient to vanish, so C is normal and hence regular.

**Acceptance beyond the stated contract**

- Track both constant fields; equality of arithmetic genera without that argument is insufficient.

### Unique component dominating the reduced fiber

Target `G.2/unique-dominating-component`.

In the special fiber C of Y, exactly one reduced strict-transform component dominates X_k,red, and it is the strict transform of E_k. That component is isomorphic to E_k.

**Inputs.** `G.2/normal-dominating-model`, `G.2/cohomology-adapter`, `G.2/domination-genus`, `G.2/equality-regular`, `SchemeAndStackFoundations:SF.3`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 8.1, pp. 21–22; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use the special-fiber map to the reduced curve and the normal birational model to obtain at least one dominating component.

2. Restriction from C onto the union of those reduced components has zero-dimensional cokernel, so its H¹ map onto their direct sum is surjective.

3. Each contributes h¹≥1, while h¹(C)=1. Thus only one exists. Repeat with the strict transform of E_k; the positive-genus component is the same, and birationality to the smooth E_k gives the isomorphism.

**Acceptance beyond the stated contract**

- Contracted rational exceptional components are allowed; only dominating components are counted.

### Multiple-fiber isogeny

Target `G.2/multiple-fiber-isogeny`.

Let R be an excellent DVR with fraction field F and residue field k, let E/R be an elliptic scheme, and let X/R be the relatively minimal regular model of a torsor under E_F whose reduced special fiber is an elliptic curve. The elliptic curves E_k and (X_k)_red are isogenous over k.

**Inputs.** `G.2/unique-dominating-component`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 8.1, pp. 21–22; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use the inverse of the unique-component isomorphism E_k→C₁ and its finite dominant map to X_k,red.

2. Translate the image of the origin to the origin; the resulting pointed map between elliptic curves is an isogeny.

**Acceptance beyond the stated contract**

- No equality of the multiple schematic fiber with E_k is asserted.

### Counts over every finite residue extension

Target `G.2/extension-counts`.

Let R be an excellent DVR with fraction field F and residue field k, let E/R be an elliptic scheme, and let X/R be the relatively minimal regular model of a torsor under E_F whose reduced special fiber is an elliptic curve. If k=F_q, then #E_k(F_{q^r})=#X_k(F_{q^r}) for every r≥1.

**Inputs.** `G.2/multiple-fiber-isogeny`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Corollary 8.2, p. 23; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Apply the imported isogeny⇒all-extension-counts theorem.

2. The schematic fiber and its reduction have the same field-valued points.

**Acceptance beyond the stated contract**

- The F₂ isomorphism conclusion is not asserted over every finite field.

### Multiple-fiber isomorphism over F₂

Target `G.2/f2-isomorphism`.

Let R be an excellent DVR with fraction field F and residue field k, let E/R be an elliptic scheme, and let X/R be the relatively minimal regular model of a torsor under E_F whose reduced special fiber is an elliptic curve. If k=F₂, then E_k≅(X_k)_red over F₂.

**Inputs.** `G.2/multiple-fiber-isogeny`, `G.1/five-f2-classes`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Corollary 8.3, p. 23; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Combine equal F₂ point counts with the five-class count criterion.

**Acceptance beyond the stated contract**

- The F₂ isomorphism conclusion is not asserted over every finite field.

### Diagonal quotient multiple-fiber example

Target `G.2/diagonal-quotient-example`.

Let R contain a residue-field representative k, let A/k be an abelian variety, G⊂A(k) a finite subgroup, and F′/Frac R a G-Galois extension whose integral closure R′ has the same residue field k. The free diagonal action gives X=(A×Spec R′)/G, with generic fiber a form of A and reduced special fiber A/G.

**Hypotheses.** Assume R excellent so integral closure R′ is finite, and use the specified free finite constant action; existence of the quotient and descent are required.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:R09.3`, `NeronModelsAndSemistableAbelianVarieties:R11.2`, `SchemeAndStackFoundations:SF.1`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §8, p. 23; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Translation by a nonzero element of G has no fixed geometric point on A, giving a free diagonal action.

2. Apply effective quotient/descent to A×Spec R′; the reduced special fiber is A/G.

3. Compute the generic descent cocycle and the schematic special-fiber multiplicity from the totally ramified extension.

**Acceptance beyond the stated contract**

- Take an elliptic A and a nontrivial totally ramified extension to obtain a genuine multiple fiber.

### Geometric torsor Kodaira comparison

Target `G.2/llr-kodaira-comparison`.

Let R be a DVR with algebraically closed residue field, C/K a smooth geometrically connected genus-one curve of period m, E/K its Jacobian, and X,E_min their proper regular minimal models. If E_min has Kodaira type T, then X has type mT.

**Inputs.** `NeronModelsAndSemistableAbelianVarieties:R11.2`, `NeronModelsAndSemistableAbelianVarieties:R11.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Source and scope.**

- [Néron models, Lie algebras, and reduction of curves of genus one](https://www.math.u-bordeaux.fr/~qliu/articles/LLR.pdf), Theorem6.6 and Remark6.8, pp495–497. Only algebraically closed residue fields; separably closed imperfect fields and nonclosed perfect fields are explicitly excluded.

- [Corrigendum to Néron models, Lie algebras, and reduction of curves of genus one](https://www.math.u-bordeaux.fr/~qliu/articles/CorrigendumToNeronModelsLieAlg.pdf), Introduction and corrected Thm4.3, pp593–595. Do not identify generic Picard classes with all Jacobian rational points; the correction does not remove the6.6 residue hypothesis.

**Proof outline.**

1. Use the owner’s comparison of discriminants of minimal regular genus-one and Jacobian models over perfect residue fields.

2. Use equality of abelian and toric ranks, geometric component group and component count, then distinguish the Kodaira possibilities as in LLR6.6.

3. Recover the common fiber multiplicity as the torsor period over the strictly henselian algebraically closed residue field.

**Acceptance beyond the stated contract**

- Finite-field nonsplit I₁/I₂ require their own geometric descent nodes.

**Remaining proof obligations for G.2**

- EGA and Raynaud source-level adapter closure

- LLR recursive proof prerequisites

- Henselization adapter for the multiple-fiber isogeny

- Replace unresolved supplier stage requests by exact verified exports.

## G.3 — Rational Jacobians and global Weierstrass equations

Canonical bundle and wild-fiber corrections lead to the global rational-Jacobian cubic. The sheaf O_J(3O) defines the contraction and has degree zero on contracted vertical components; relative very ampleness belongs to the resulting cubic model. The Picard/intersection construction supplies the negative E₈ complement. Generic Picard restriction and Shioda–Tate generation use their actual regularity and section hypotheses. Tsen is used only over an algebraically closed constant field. Quasielliptic models require the regular, non-smooth generic-curve interface that the existing smooth-model supplier does not cover.

**Planets:** Canonical bundle formula; Rational Jacobian invariants; Even complement; Bounded Weierstrass equations; Weierstrass contraction; Quasielliptic fibrations.

### Canonical bundle formula

Target `G.3/canonical-bundle`.

Let f:S→B be a relatively minimal genus-one fibration of a smooth proper surface over an algebraically closed field, with multiple fibers m_iF_i. Write R¹f_*O_S=L⊕T with L invertible and T torsion. Then ω_S≅f*(ω_B⊗L^{−1})⊗O_S(Σa_iF_i) with 0≤a_i≤m_i−1, a_i=m_i−1 for every tame multiple fiber, and deg L^{−1}=χ(O_S)+length(T).

**Inputs.** `G.1/genus-one-fibration`, `G.1/fiber-type-divisor`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [Enriques’ classification of surfaces in char. p, II](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf), §1 Theorem2 and proof, pp27–30. Source-specific canonical bundle formula; do not assume cohomological flatness at wild fibers.

**Proof outline.**

1. Apply relative duality to split R¹f_*O into its rank-one quotient L and torsion T and construct the evaluation f*L⁻¹→ω_relative.

2. Use the vertical intersection radical to write its effective zero divisor as Σa_iF_i.

3. Bound0≤a_i<m_i by the pushforward equality; determine the tame coefficient by normal-bundle adjunction.

**Acceptance beyond the stated contract**

- The relative formula becomes absolute after tensoring by f*ω_B.

### Degree of the genus-one Hodge line

Target `G.3/canonical-degree`.

In the canonical-bundle setting, deg L⁻¹=χ(O_S)+length(T).

**Inputs.** `G.3/canonical-bundle`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Source and scope.**

- [Enriques’ classification of surfaces in char. p, II](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf), Theorem 2(iv), printed p. 27; proof of (iv), printed p. 29. The Euler characteristic on the total space enters the degree formula.

**Proof outline.**

1. Use Leray to write χ(O_S)=χ(O_B)−χ(L)−length(T).

2. Apply Riemann–Roch on B, χ(L)=deg L+χ(O_B), and cancel the base contribution.

**Acceptance beyond the stated contract**

- For a rational surface with T=0, L≅O_P¹(−1).

### Tame and wild multiplicity comparison

Target `G.3/tame-wild`.

For a multiple fiber mF, the finite order ν of O_F(F) divides m and a+1. The fiber is tame iff ν=m iff its point is outside supp T; m/ν is a power of the residue characteristic. If H¹(O_S)=0, then T=0 and all fibers are tame.

**Inputs.** `G.3/canonical-bundle`, `G.3/canonical-degree`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `SchemeAndStackFoundations:SF.3`.

**Source and scope.**

- [Enriques’ classification of surfaces in char. p, II](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf), §1 Proposition4 and following discussion, pp29–30. The general normal-bundle order theorem is not proved by the displayed divisibility alone.

**Proof outline.**

1. Apply the thickening exact sequences in Bombieri–Mumford Proposition4 to compare the first nontrivial H⁰ jump with ν.

2. Use the Raynaud multiplicity/order theorem for the characteristic-power quotient and tame equivalence.

3. Use the Leray injection H⁰(T)⊂H⁰(R¹f_*O) and H¹(O_S)=0 to force T=0.

**Acceptance beyond the stated contract**

- No claim that every fiber with reduced support is tame; multiplicity and torsion must be retained.

### Canonical sheaf and section on a rational Jacobian

Target `G.3/rational-canonical`.

Let J/k be a smooth geometrically rational surface with a relatively minimal Jacobian genus-one fibration φ:J→P¹ and zero-section E. ω_J=φ*O(-1), E²=−1, and ω_{J/P¹}=φ*O(1).

**Inputs.** `G.3/canonical-bundle`, `G.3/canonical-degree`, `G.3/tame-wild`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 6.1 proof, p. 18; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Rationality gives χ(O_J)=1 and H¹(O_J)=0, so T=0.

2. The section gives fiber multiplicity1, hence no correction divisor; canonical-degree gives L=O(−1).

3. Tensor relative/absolute dualizing sheaves and apply adjunction to the section P¹ to get E²=−1.

**Acceptance beyond the stated contract**

- The formula remains geometric under descent over the original field; retain the chosen fibration.

### Geometric Picard lattice of a rational elliptic surface

Target `G.3/rational-picard-lattice`.

Over algebraic closure, Num(J) has rank10, is odd unimodular and has signature(1,9). It is represented by the existing IntegralLattice carrier via the actual geometric intersection pairing.

**Hypotheses.** J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one fibration f:J→P¹_k and its zero-section O; geometric lattice assertions are after extension to an algebraic closure.

**Inputs.** `G.3/rational-canonical`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCeti.IntegralLattice`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 6.1, p. 18; proof of Corollary 7.3, p. 21; proof of Proposition 9.5, p. 27; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use K²=0 and rational-surface blowup classification: a minimal P² model requires nine blowups, or reduce a ruled minimal model to that case.

2. Apply the blowup Picard decomposition with exceptional square−1 to prove rank and unimodularity.

3. Use Hodge index for the signature; do not replace the geometric lattice by a freely assumed rank10 module.

**Acceptance beyond the stated contract**

- For the nine-blowup model the diagonal Gram matrix is(1,−1,…,−1).

### Unimodular fiber–section plane

Target `G.3/fiber-section-plane`.

For F a geometric fiber and O the section, F²=0,F·O=1,O²=−1, so span(F,O) has Gram[[0,1],[1,−1]] and splits integrally as an orthogonal summand of Num(J).

**Hypotheses.** J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one fibration f:J→P¹_k and its zero-section O; geometric lattice assertions are after extension to an algebraic closure.

**Inputs.** `G.3/rational-picard-lattice`, `G.3/rational-canonical`, `tauceti:TauCeti.IntegralLattice.IsUnimodular`, `SchemeAndStackFoundations:SF.5`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5 proof, p. 27; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Compute the three intersections using the section and rational-canonical node.

2. The determinant is−1, so the inverse matrix is integral; use it to project every divisor class onto span(F,O).

**Acceptance beyond the stated contract**

- This plane is odd; it is not the even hyperbolic plane in the basis(F,O).

### Generic Picard restriction with vertical kernel

Target `G.3/generic-picard-restriction`.

Let f:S→B be a proper flat morphism from a regular integral noetherian surface to a regular integral one-dimensional base with f_*O_S=O_B, and K the function field of B. Then restriction Pic(S)→Pic(S_K) is surjective, and its kernel is generated by f*Pic(B) and the classes O_S(C) of the irreducible components C of closed fibres.

**Inputs.** `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 9.3(v), p. 25; proofs of Propositions 12.2 and 12.3, pp. 42–43; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Represent a generic line bundle by a divisor and take its closure in the regular total surface; codimension1 regularity makes it Cartier.

2. If the restriction is principal, extend its rational function and subtract its divisor; the remainder is vertical.

3. Record pullbacks from Pic(B) inside the vertical kernel, including their torsion.

**Acceptance beyond the stated contract**

- For a general base B the kernel cannot be generated by one chosen fiber; Pic(B) may have nontrivial degree-zero classes.

### Geometric Shioda–Tate generation

Target `G.3/shioda-tate`.

Over an algebraically closed field, for a regular relatively minimal Jacobian genus-one fibration over P¹, Pic(S) is generated by O,F, the vertical components disjoint from O, and the section classes. The quotient by O,F and vertical components is the actual generic Pic⁰ group, identified with the section group of the Jacobian.

**Inputs.** `G.3/generic-picard-restriction`, `G.1/genus-one-fibration`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 9.3(v), p. 25; after Theorem 9.4, p. 26; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Apply generic restriction and split the degree by O of degree1.

2. A generic degree-zero line bundle corresponds to a Jacobian rational point because the chosen origin kills the Brauer obstruction.

3. Extend that point to a section by properness/minimal-model theory; use vertical relations to eliminate the component meeting O.

**Acceptance beyond the stated contract**

- The genus-one torsor version uses a horizontal divisor of index d and only actual Pic⁰ classes; it does not identify all Picard-functor rational points without obstruction control.

### Even rank-eight complement

Target `G.3/even-complement`.

Let J/k be a smooth geometrically rational surface with a relatively minimal Jacobian genus-one fibration φ:J→P¹ and zero-section E. Over an algebraic closure, the orthogonal complement W of the fiber F and zero-section O in Num(Jbar) is even unimodular of rank 8; it is generated by vertical components disjoint from O and (P−O)−(1+P·O)F for sections P. The pairing is negative definite, so the abstract comparison is with E₈ with its sign reversed.

**Hypotheses.** J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one fibration f:J→P¹_k and its zero-section O; geometric lattice assertions are after extension to an algebraic closure.

**Inputs.** `G.3/fiber-section-plane`, `G.3/shioda-tate`, `tauceti:TauCeti.IntegralLattice`, `tauceti:TauCeti.IntegralLattice.IsUnimodular`, `tauceti:TauCeti.IntegralLattice.IsEven`, `SchemeAndStackFoundations:SF.5`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5 proof, p. 27; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use the fiber–section splitting and rank10 to get rank8 and unimodularity.

2. Use geometric Shioda–Tate to generate W by vertical classes away from O and (P−O)−(1+P·O)F.

3. Compute their norms as−2 or−2−2(P·O); mixed terms are doubled, hence all norms are even.

4. Hodge index on the complement of a positive vector in the fiber–section plane gives negative definiteness.

**Acceptance beyond the stated contract**

- The restriction W→a fiber root-lattice dual is not an isometry.

### Degree-bounded Weierstrass equations

Target `G.3/bounded-weierstrass`. Proposed declaration: `BoundedWeierstrass`.

A bounded Weierstrass equation over k is an existing WeierstrassCurve k[t] together with natDegree a₁≤1,a₂≤2,a₃≤3,a₄≤4,a₆≤6. No smoothness, global minimality or surface rationality is asserted by this coefficient carrier. The reverse chart coefficient is Σ_{n=0}^i coeff(a_i,n)s^(i−n).

**Inputs.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 6.1, p. 18 (statement and proof both on p. 18); arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Refine the existing coefficient structure by five concrete degree bounds.

2. Define the inverse-chart polynomial by coefficient reversal in its specified weight.

**Consumers.** `Schröer §6 and Theorems10.4–10.5`: All finite searches are performed on this21-bit coefficient carrier. `CDL2024 §4.4`: The weight records the transition of the global relative cubic.

**API.**

- `BoundedWeierstrass.toCurve` (projection): The underlying equation is the existing WeierstrassCurve k[t].

- `BoundedWeierstrass.chart` (data): The chart has coefficients sⁱa_i(1/s), as the finite reversal sum.

- `BoundedWeierstrass.chart_chart` (simp): Applying the same weight reversal twice gives the original coefficient tuple.

- `BoundedWeierstrass.ext` (extensionality): Equality of the five coefficients implies equality of bounded equations.

- `BoundedWeierstrass.discriminant_chart` (compatibility): The chart discriminant equals the weight12 reversal of the original discriminant.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `BoundedWeierstrass.constant_term`: The coefficient a₁=1 becomes s, not1, on the second chart.

- `BoundedWeierstrass.top_degree`: The coefficient a₆=t⁶ becomes1 on the second chart.

- `BoundedWeierstrass.zero`: All five zero coefficients satisfy the bounds but have Δ=0, so this carrier does not certify an elliptic curve.

- `BoundedWeierstrass.involution`: Every coefficient of weight i is recovered by a second reversal.

**Acceptance beyond the stated contract**

- The coefficient a₁=1 becomes s, not1, on the second chart.

- The coefficient a₆=t⁶ becomes1 on the second chart.

- All five zero coefficients satisfy the bounds but have Δ=0, so this carrier does not certify an elliptic curve.

- Every coefficient of weight i is recovered by a second reversal.

### Positive section twist cohomology

Target `G.3/positive-section-cohomology`.

For n>0 on a rational Jacobian, R¹f_*O(nO)=0 and f_*O(nO) has rank n. In particular f_*O(O)=O_P¹.

**Hypotheses.** J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one fibration f:J→P¹_k and its zero-section O; geometric lattice assertions are after extension to an algebraic closure.

**Inputs.** `G.3/rational-canonical`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Source and scope.**

- [Enriques Surfaces I](https://sites.lsa.umich.edu/idolga/wp-content/uploads/sites/1334/2024/08/EnriquesOne.pdf), Lemma4.4.1 and proof, pp394–396. Correct part(2) to n>0; n=0 has rank1.

**Proof outline.**

1. On a fiber, Serre duality reduces H¹(O(nO)) to H⁰(O(−nO)).

2. For n=1 the evaluation at the smooth section point is nonzero on the one-dimensional H⁰(O); for higher n use the section exact sequence.

3. Use cohomology and base change and Riemann–Roch to get rank n; exclude n=0 from that rank formula.

**Acceptance beyond the stated contract**

- At n=0, f_*O=O has rank1, not0.

### Weierstrass rank-three splitting

Target `G.3/pushforward-splitting`.

Let J/k be a smooth geometrically rational surface with a relatively minimal Jacobian genus-one fibration φ:J→P¹ and zero-section E. φ_*O_J(3E)≅O⊕O(-2)⊕O(-3); the relative Proj construction gives the cubic equation of the Weierstrass model.

**Inputs.** `G.3/positive-section-cohomology`, `G.3/rational-canonical`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 6.1, p. 18; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. The section exact sequences give successive quotients O(−2),O(−3), after the initial O.

2. Compute the relevant Ext¹ by H¹ of positive-degree line bundles on P¹, hence both extensions split.

**Acceptance beyond the stated contract**

- For a general higher-genus base those Ext¹ groups need not vanish.

### Relative cubic contraction

Target `G.3/relative-cubic-contraction`.

The complete relative linear series O_J(3O) maps J to a normal cubic Z⊂P(O⊕O(−2)⊕O(−3)), contracting exactly the vertical components disjoint from O. O_Z(3O) is relatively very ample; O_J(3O) is not relatively very ample when such components exist.

**Hypotheses.** J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one fibration f:J→P¹_k and its zero-section O; geometric lattice assertions are after extension to an algebraic closure.

**Inputs.** `G.3/pushforward-splitting`, `G.3/positive-section-cohomology`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `SchemeAndStackFoundations:SF.4`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 6.1, p. 18 (statement and proof both on p. 18); arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use positive-section-cohomology to construct the rank3 evaluation map and the relative morphism.

2. Compute its restriction to each fiber: components of degree0 are contracted; degree3 on the genus-one contraction gives a cubic embedding.

3. Use the source Weierstrass contraction/normality theorem to identify the image with the minimal cubic.

**Acceptance beyond the stated contract**

- A component disjoint from O has degree0 under O_J(3O), obstructing very ampleness on J.

### Global equation and inverse chart

Target `G.3/global-chart-equation`.

The rational Jacobian cubic has an equation in the bounded coefficient carrier; with s=1/t, x′=s²x,y′=s³y, its second chart is a_i′(s)=sⁱa_i(1/s).

**Hypotheses.** J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one fibration f:J→P¹_k and its zero-section O; geometric lattice assertions are after extension to an algebraic closure.

**Inputs.** `G.3/relative-cubic-contraction`, `G.3/pushforward-splitting`, `G.3/bounded-weierstrass`, `SchemeAndStackFoundations:SF.4`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 6.1, p. 18 (statement and proof both on p. 18); arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Choose split generators with pole weights2,3 at O and compare their degree6 relation.

2. Identify each coefficient as a section of O(i); polynomial degree is at most i.

3. Substitute x=s⁻²x′,y=s⁻³y′ and multiply the equation by s⁶ to obtain all five weights.

**Acceptance beyond the stated contract**

- The transition uses s=1/t; no division of a polynomial in the same coordinate is called the second-chart polynomial.

### Coefficient nondegeneracy on two charts

Target `G.3/coefficient-nondegeneracy`.

Let J/k be a smooth geometrically rational surface with a relatively minimal Jacobian genus-one fibration φ:J→P¹ and zero-section E. In such a degree-bounded Weierstrass equation some a_i is nonconstant and some a_i is not divisible by t^i; these conditions survive degree-preserving admissible coordinate changes.

**Inputs.** `G.3/global-chart-equation`, `G.3/bounded-weierstrass`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), remark after Proposition 6.1, pp. 18–19; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. If all coefficients are constant, positive-degree reversal makes every second-chart coefficient divisible by its weight power, contradicting global minimality.

2. If each a_i is divisible by tⁱ, the t-chart is nonminimal at0.

3. Admissible transformations preserving the global line-bundle weights preserve the obstruction.

**Acceptance beyond the stated contract**

- These necessary conditions alone do not establish minimality at every closed point.

### Quasielliptic characteristic and characteristic-two types

Target `G.3/quasielliptic-characteristic`.

Quasi-elliptic fibrations exist only in characteristics 2 and 3. For a quasi-elliptic fibration φ:S→P¹ of a smooth projective surface over an algebraically closed field of characteristic 2, every fiber is irreducible cuspidal (type II) or reducible of type III, I*_{2n}, III* or II* (with 2, 2n+5, 8 and 9 components), and the Mordell–Weil group of the jacobian is killed by 2. Hence ρ(S)=2+Σ_b(r_b−1), r_b the number of components of the fiber over b; for ρ(S)=10 this gives Σ_b(r_b−1)=8.

**Inputs.** `G.1/genus-one-fibration`, `G.1/canonical-type-classification`, `G.3/shioda-tate`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 11.1, p. 33; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use regular genus-one geometric genus change to restrict characteristic to2 or3.

2. For characteristic2 import the additive-group Jacobian compactification and its geometric fiber classification.

3. Use the2-torsion section group and geometric Shioda–Tate to obtain the rank formula.

**Acceptance beyond the stated contract**

- The generic cusp is not a smooth supersingular elliptic curve.

### Global regular minimal Jacobian fibration

Target `G.3/global-minimal-jacobian`.

Let B be a regular curve over a field, or the spectrum of a DVR, with function field K, and C a regular proper curve over K with H⁰(C,O_C)=K and H¹(C,O_C) of dimension one. C has a unique relatively minimal regular proper model S→B. Its jacobian — the elliptic curve Pic⁰_{C/K}, or in the quasi-elliptic case the regular compactification of the twisted form Pic⁰_{C/K} of G_a — has a unique relatively minimal regular model with a section, the jacobian fibration J→B.

**Hypotheses.** C is geometrically integral. For the DVR existence assertion assume excellence; the regular finite-type curve base is excellent. The regular nonsmooth case remains subject to the named quasielliptic source gap.

**Inputs.** `G.1/genus-one-fibration`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §6, p. 19; §8, pp. 21–22; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. For smooth generic curves glue the imported unique local positive-genus minimal models along their common generic curve.

2. For a regular non-smooth generic genus-one curve, construct its regular compactification and relative minimal model with the quasielliptic Jacobian identified from its genuine Picard functor.

3. Extend the generic identity to the distinguished section by properness.

**Acceptance beyond the stated contract**

- Uniqueness here concerns positive arithmetic genus, not arbitrary genus0 minimal models.

### Tsen and Picard obstruction over algebraically closed constants

Target `G.3/tsen-obstruction`.

For an algebraically closed field k, the field k(t) is C₁, so Br(k(t))=0. Consequently, for a proper curve C over k(t) with H⁰(C,O_C)=k(t), every k(t)-point of Pic_{C/k(t)} comes from a line bundle on C.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension`, `SchemeAndStackFoundations:SF.3`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 9.3(v), p. 25; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use the C₁ theorem for the one-variable function field over an algebraically closed constant field.

2. Deduce Brauer-group vanishing and apply the Picard-functor-to-line-bundle obstruction sequence.

3. Restrict all uses to those constants, or use a section to kill the obstruction in the Jacobian application.

**Acceptance beyond the stated contract**

- Br(F₂(t)) is not zero; the original finite-field invocation does not supply Mordell–Weil descent.

**Remaining proof obligations for G.3**

- Canonical bundle and wild-fiber proof closure

- Rational-surface classification proof source

- Quasielliptic generality beyond the smooth model supplier

- Tsen primary proof and foundational ownership

- Replace unresolved supplier stage requests by exact verified exports.

## G.4 — Picard constancy and fiber configurations

The resolved-surface point-count criterion identifies Picard constancy with 25 rational points over F₂ for a geometrically rational surface of geometric Picard rank ten. The graph argument treats IV as a triangle and uses unimodularity and root-lattice duality, rather than treating projection to a dual root lattice as an isometry. Marked multiplicities distinguish all three ends in III* and II*. Mordell–Weil descent is an explicit hypothesis of the Picard criterion. The large-fiber and additive-fiber consequences retain the restriction on rational semistable or smooth supersingular fibers; Lang's configuration exclusions remain source or finite-certificate obligations.

**Planets:** Picard point-count criterion; Additive graph rigidity; Picard constancy; Large fiber.

### Fiber-count data at rational base points

Target `G.4/fiber-count-data`.

For a rational Jacobian elliptic surface over F₂ and a rational base point a, let r_a be its geometric component count. Put n_a=i for smooth E_i, 2r_a for split semistable, 2r_a+2 for nonsplit semistable, and 2r_a+1 for unstable fiber. This is a formal input until splitting is proved.

**Inputs.** `G.1/count-15`, `G.1/count-16`, `G.1/count-17`, `G.1/count-18`, `G.1/count-19`, `G.1/five-f2-classes`, `G.1/component-descent`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §9, after Proposition 9.3, pp. 25–26; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use the verified E_i counts for smooth fibers and the split/nonsplit/additive count nodes after descent and splitting have been proved.

2. Enumerate the three F₂ rational base points and sum the actual fiber counts.

**Acceptance beyond the stated contract**

- The formula2r+2 is used only after establishing nonsplit incidence.

### Picard constancy from resolved-surface point count

Target `G.4/picard-point-count`.

For a smooth projective geometrically rational surface J/F_q with geometric Picard rank10, Pic_{J/F_q} is constant iff #J(F_q)=1+10q+q². In particular a rational Jacobian elliptic surface over F₂ has constant Picard scheme iff #J(F₂)=25.

**Inputs.** `G.3/rational-picard-lattice`, `SchemeAndStackFoundations:SF.5`, `SchemeAndStackFoundations:SF.6`, `WeilConjectures:WC.7`, `AlgebraicModuliForArithmeticGeometry:A0-extension`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), §7 Proposition7.1 and proof, pp20–21. Use the rational-surface cycle-class and Betti inputs, not merely a count of an unresolved cubic.

**Proof outline.**

1. Use rationality to identify H²_et(1) with Num(J)⊗Q_ℓ by the cycle-class isomorphism and H¹=H³=0.

2. Apply the geometric Frobenius trace formula to the smooth proper surface.

3. The Galois action on the finitely generated lattice factors through a finite group; all its eigenvalues are roots of unity. A trace of10 forces each to1, and finite-order semisimplicity makes the action identity.

4. Use the torsion-free étale Picard comparison to descend constancy from the lattice.

**Acceptance beyond the stated contract**

- A singular Weierstrass cubic can have fewer rational points than its smooth resolution.

### Geometric fiber root-basis comparison

Target `G.4/root-basis-comparison`.

The sublattice generated by the geometric components disjoint from O identifies with the negative root lattice A₂ for IV, E₆ for IV*, and D_(m+4) for I_m*. For the vector terminal dual weight in D_(m+4), the squared norm is−1.

**Hypotheses.** J/F₂ is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹; the fiber lies over a rational base point, and all geometric Mordell–Weil sections descend to F₂.

**Inputs.** `G.1/geometric-kodaira`, `G.3/even-complement`, `tauceti:TauCeti.IntegralLattice.checkerboardLattice_form_checkerboardVector_self`, `tauceti:TauCeti.IntegralLattice.discriminant_typeE₆RootLattice`, `tauceti:TauCeti.IntegralLattice`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, p. 26 (statement); proof pp. 26–27; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use the geometric Kodaira intersection matrix to identify the integral root basis with the baseline ADE coordinate model.

2. For A₂ compute determinant3 directly from its2×2 Gram matrix; for E₆ use the baseline discriminant theorem.

3. For the nonspinor D terminal transport the baseline vector representative and its norm1 under the sign reversal.

**Acceptance beyond the stated contract**

- Fix the selected terminal root before using a dual-basis weight; not all D fundamental weights have norm1.

### IV and IV* graph rigidity

Target `G.4/iv-rigidity`.

For IV or IV*, if all geometric Mordell–Weil sections descend to F₂, a section meets a component other than the one met by O, and the marked weighted graph has trivial Galois action.

**Hypotheses.** J/F₂ is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹; the fiber lies over a rational base point, and all geometric Mordell–Weil sections descend to F₂.

**Inputs.** `G.4/root-basis-comparison`, `G.3/even-complement`, `G.3/shioda-tate`, `tauceti:TauCeti.IntegralLattice.IsUnimodular`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, p. 26 (statement); proof pp. 26–27; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. If every section meets the O component, geometric Shioda–Tate makes the corresponding A₂ or E₆ root sublattice an orthogonal direct summand of the even unimodular W.

2. That would make it unimodular, contradicting determinant3.

3. The descending second section fixes a second vertex. For IV this fixes all three vertices of the triangle; for IV* use its marked weighted affine E₆ graph.

**Acceptance beyond the stated contract**

- IV is a triangle with no terminal vertices, so a tree argument cannot be used.

### I_m* graph rigidity by dual parity

Target `G.4/d-star-rigidity`.

For1≤m≤4, geometric Mordell–Weil descent fixes the remaining paired terminal vertices of an I_m* fiber.

**Hypotheses.** J/F₂ is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹; the fiber lies over a rational base point, and all geometric Mordell–Weil sections descend to F₂.

**Inputs.** `G.4/root-basis-comparison`, `G.3/even-complement`, `G.3/shioda-tate`, `tauceti:TauCeti.IntegralLattice.IsUnimodular`, `tauceti:TauCeti.IntegralLattice.IsEven`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, p. 26 (statement); proof pp. 26–27; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. The component met by O and the nonspinor terminal are fixed by distances in the weighted graph.

2. Suppose every section meets one of those two components. Shioda–Tate shows that the restriction image W→R* is R+Zω, where ω is the nonspinor terminal dual weight.

3. ω pairs integrally with that image because it pairs integrally with R and ω²=−1. Since W is unimodular, ω belongs to W.

4. This contradicts the evenness of W; a descending section therefore fixes one of the remaining terminals, and hence both.

**Acceptance beyond the stated contract**

- Restriction to R* is not an isometry; its image’s norm cannot be transferred from the source vector.

### III*, II* and marked multiplicities

Target `G.4/exceptional-affine-rigidity`.

The weighted affine E₇ and E₈ graphs have no nontrivial automorphism fixing the component met by O. The three terminal multiplicities are(1,1,2) and(1,2,3), respectively.

**Hypotheses.** J/F₂ is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹; the fiber lies over a rational base point, and all geometric Mordell–Weil sections descend to F₂.

**Inputs.** `G.1/geometric-kodaira`, `G.1/canonical-type-classification`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, p. 26 (statement); proof pp. 26–27; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Enumerate the finite affine graphs with their source multiplicity vectors.

2. The marked vertex and the remaining terminal multiplicities/distances identify every branch and vertex.

**Acceptance beyond the stated contract**

- Both graphs have three terminal vertices; there are two further terminals after marking O.

### Additive graph rigidity

Target `G.4/additive-graph-rigidity`.

Let J/F₂ be as in Theorem 9.4 and satisfy conditions (ii), (iii) and (v) of Proposition 9.3. Then for every rational a∈P¹ with J_a singular, Γ(J_ā)→Γ(J_a) is a graph isomorphism.

**Inputs.** `G.4/iv-rigidity`, `G.4/d-star-rigidity`, `G.4/exceptional-affine-rigidity`, `G.1/canonical-type-classification`, `G.3/even-complement`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, p. 26 (statement); proof pp. 26–27; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Treat I₁,II and III directly; use condition(iii) for every multiplicative cycle.

2. Use the marked affine graph lemma for III*,II* and the corrected IV/IV*/I_m* arguments.

3. Exclude I₀* by condition(ii); rank8 bounds the remaining star index by4.

**Acceptance beyond the stated contract**

- The conclusion is about component and incidence descent; retain the singularity hypothesis.

### Picard constancy criterion

Target `G.4/picard-constancy-criterion`.

Let J be a smooth geometrically rational surface over F₂ with a relatively minimal jacobian elliptic fibration φ:J→P¹. Assume: (i) J_ā is irreducible for every closed non-rational a; (ii) no J_ā has Kodaira symbol I₀*; (iii) if J_ā is semistable, Γ(J_ā)→Γ(J_a) is a graph isomorphism; (iv) at most one rational b∈P¹ has J_b semistable or smooth supersingular; (v) MW(J/P¹)=MW(J̄/P̄¹); and Σ_{a∈P¹(F₂)} n_a=25. Then Pic_{J/F₂} is constant.

**Inputs.** `G.3/shioda-tate`, `G.4/additive-graph-rigidity`, `G.4/fiber-count-data`, `G.4/picard-point-count`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 9.4, p. 26; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use geometric Shioda–Tate generation by F,vertical components and sections.

2. Condition(v) fixes every section and condition(i) places reducible fibers over rational points.

3. Use condition(iii) and corrected additive graph rigidity to fix the component generators; the torsion-free étale Picard group then has trivial Galois action.

4. The stated point-sum assumption is retained; its relation to actual counts is the fiber-count-data node.

**Acceptance beyond the stated contract**

- Do not omit condition(v) or claim the printed enumeration verifies it for every listed model.

### Large rational fiber

Target `G.4/large-fiber`.

Let J/F₂ be a smooth geometrically rational relatively minimal Jacobian elliptic surface over P¹ with constant Picard scheme and at most one rational base point whose fiber is semistable or smooth supersingular. Some rational fiber has at least six irreducible components.

**Inputs.** `G.4/fiber-count-data`, `G.4/picard-point-count`, `G.1/count-19`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 10.1, p. 28; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. If all component counts are≤5, absence of I₀* bounds every additive fiber by3 components and hence7points.

2. There is at most one multiplicative or supersingular smooth fiber; a split cycle of at most5 components contributes≤10, and a nonsplit small form contributes≤6.

3. The other two fibers contribute≤7 each, contradicting25≤10+7+7=24.

**Acceptance beyond the stated contract**

- The nonsplit point-count exception does not invalidate the upper bound10.

### Lang configuration inputs as used

Target `G.4/lang-configuration-inputs`.

For geometrically rational Jacobian elliptic surfaces in characteristic2, certify separately the required Lang2000 exclusions and normal forms: II+I₉ excluded; III with I_m,6≤m≤9 only III+I₆ or III+I₈; the cases2A,5A,5D,7,13A,14 normal forms; j=0 nonreduced-fiber and number-of-bad-fibers restrictions. Each export must retain source hypotheses.

**Inputs.** `G.3/global-chart-equation`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Section 10, pp. 28–32; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Acquire and read the primary published or author text of Lang2000.

2. Split each exclusion and normal-form assertion into its own declaration-sized node after identifying its proof and all prerequisites.

3. Until then this is an explicit aggregation target with incomplete granularity, never a proved source theorem.

**Acceptance beyond the stated contract**

- Do not silently use Lang1994 on extremal surfaces for this more general claim.

### Reducible additive fiber

Target `G.4/reducible-additive`.

Let J/F₂ be a smooth geometrically rational relatively minimal Jacobian elliptic surface over P¹ with constant Picard scheme and at most one rational base point whose fiber is semistable or smooth supersingular. There is a reducible unstable fiber over a rational base point.

**Inputs.** `G.4/large-fiber`, `G.4/fiber-count-data`, `G.3/rational-picard-lattice`, `G.4/lang-configuration-inputs`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 10.2, pp. 28–29; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. If every reducible fiber is multiplicative, the large-fiber node gives I_r with6≤r≤9.

2. The other rational fibers must be ordinary smooth or II; parity and25points force II+E₄+I₉.

3. Apply the exact Lang exclusion II+I₉; this use remains behind the source-acquisition gap.

**Acceptance beyond the stated contract**

- Without the configuration exclusion the parity count alone does not prove the theorem.

### Unique additive fiber for nonzero j

Target `G.4/unique-additive`.

Let J/F₂ be a smooth geometrically rational relatively minimal Jacobian elliptic surface over P¹ with constant Picard scheme and at most one rational base point whose fiber is semistable or smooth supersingular. If j∈F₂(t) is nonzero, exactly one fiber is unstable.

**Inputs.** `G.4/reducible-additive`, `G.3/global-chart-equation`, `mathlib:WeierstrassCurve.j_eq_zero_iff_of_char_two`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 10.3, p. 29; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Nonzero functional j gives a₁ not identically zero; its global section of O(1) has exactly one geometric zero.

2. At a bad fiber the imported minimal-equation criterion says additive iff Δ=0 and c₄=0; c₄=a₁⁴ in characteristic2.

3. Use the reducible-additive node for existence; the zero-divisor argument gives uniqueness.

**Acceptance beyond the stated contract**

- A smooth supersingular fiber has c₄=0 and Δ≠0 and is not additive.

### Small additive configuration

Target `G.4/small-additive`.

Let J/F₂ be a smooth geometrically rational relatively minimal Jacobian elliptic surface over P¹ with constant Picard scheme and at most one rational base point whose fiber is semistable or smooth supersingular. If j≠0 and the unique unstable fiber has at most five components, the rational-fiber configuration, up to a base automorphism, is III+E₄+I₈.

**Inputs.** `G.4/unique-additive`, `G.4/large-fiber`, `G.4/fiber-count-data`, `G.4/lang-configuration-inputs`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Proposition 10.3, p. 29; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. If the unique additive fiber has≤5 components, I₀* exclusion forces≤3.

2. Large-fiber and rank bounds give a split I_m with6≤m≤9; Lang restricts the combination to III+I₆ or III+I₈.

3. The remaining ordinary E_2n fiber contributes2n, and25=5+2m+2n forces m=8,n=2.

**Acceptance beyond the stated contract**

- The count equation is used only after the geometric fiber configuration is proved.

**Remaining proof obligations for G.4**

- William Lang2000 source acquisition and decomposition

- Replace unresolved supplier stage requests by exact verified exports.

## G.5 — Fourteen explicit models over F₂

Each candidate has a target for global minimality, resolved fibers and splitting, geometric rationality, relative minimality and the surface count. Polynomial invariants and smooth equation point counts provide bounded checks but do not certify these geometric properties. The three additional candidates are separate contracts. For models 2 and 14 the bad degree-two closed point produces two conjugate geometric I₁ fibers, contributing no F₂-rational base point.

**Planets:** Fourteen candidate models.

The equation is y²+a₁xy+a₃y=x³+a₂x²+a₄x+a₆. The following coefficient table is mathematical data for the candidate family, not a resolved-model certificate. Bit j of the packet coefficient mask is the coefficient of t^j.

| Model | a₁ | a₂ | a₃ | a₄ | a₆ |
| --- | --- | --- | --- | --- | --- |
| 1 | t | t | t^2 | t^4 | t^5+t^6 |
| 2 | t | 0 | 0 | t^3 | t^5+t^6 |
| 3 | t | 0 | 0 | t^3 | 0 |
| 4 | t | t^2 | 0 | t^3 | 0 |
| 5 | t | 0 | 0 | 0 | t^5 |
| 6 | t | t^2 | 0 | 0 | t^5 |
| 7 | t | t | 0 | t^4 | 0 |
| 8 | t | t | t | t | 0 |
| 9 | 0 | t | t^2 | 0 | 0 |
| 10 | 0 | 0 | t^2 | t^3 | 0 |
| 11 | 0 | 0 | t^2 | 0 | 0 |
| 12 | t | 1 | t^3 | 0 | 0 |
| 13 | t | t | t^3 | 0 | 0 |
| 14 | t | t^2 | t^2 | 0 | 0 |

### Fourteen candidate equations

Target `G.5/f2-candidate-equation`. Proposed declaration: `CandidateEquation`.

CandidateEquation is the function from Fin14 to bounded F₂ Weierstrass equations given by models1–11 of Schröer10.4–10.5 followed by the three corrected models12–14. The exact five coefficient tuples are recorded in modelData. This definition records equations only; it does not assert their resolution type, Picard constancy or completeness.

**Inputs.** `G.3/bounded-weierstrass`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use the ordered table of five existing polynomial coefficients, with the char2 convention y²+a₁xy+a₃y=x³+a₂x²+a₄x+a₆.

2. Check each coefficient weight bound separately; retain the three missing models as actual table entries.

**Consumers.** `Schröer10.4–10.5 and routed238–240`: The finite classification targets reference one shared candidate family. `G.6 completeness certificate`: The output is membership in this table modulo admissible equivalence, not equality of raw coefficient tuples.

**API.**

- `CandidateEquation.coefficients` (data): Returns the specified five polynomials at each of the fourteen indices.

- `CandidateEquation.bounded` (compatibility): Every equation satisfies the weights1,2,3,4,6 of BoundedWeierstrass.

- `CandidateEquation.ne` (characterisation): The fourteen raw five-tuples are pairwise distinct; this is weaker than nonequivalence of fibrations.

- `CandidateEquation.chart` (functoriality): Its infinity chart is the specified weighted reversal, including zero coefficients.

The packet attaches the exact source and proof-input list to each API contract.

**Unit-test contracts.**

- `CandidateEquation.model12`: Index11 has(a₁,a₂,a₃,a₄,a₆)=(t,1,t³,0,0),Δ=t¹⁰.

- `CandidateEquation.model13`: Index12 has(t,t,t³,0,0),Δ=t¹¹.

- `CandidateEquation.model14`: Index13 has(t,t²,t²,0,0),Δ=t⁸(t²+t+1).

- `CandidateEquation.missing_from_print`: None of the specific printed models1–8 has the raw tuple of models12,13 or14; this is a coefficient-table test, not an equivalence assertion.

**Acceptance beyond the stated contract**

- Index11 has(a₁,a₂,a₃,a₄,a₆)=(t,1,t³,0,0),Δ=t¹⁰.

- Index12 has(t,t,t³,0,0),Δ=t¹¹.

- Index13 has(t,t²,t²,0,0),Δ=t⁸(t²+t+1).

- None of the specific printed models1–8 has the raw tuple of models12,13 or14; this is a coefficient-table test, not an equivalence assertion.

### Model 1 certificate

Target `G.5/model-1`.

Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy+t²y=x³+tx²+t⁴x+t⁵(1+t) has functional j=t⁴, discriminant t⁸ on the t-chart, and fibers at 0, 1,∞ of types I₁*+E₄+I₄.

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Model 2 certificate

Target `G.5/model-2`.

Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy=x³+t³x+t⁵(1+t) has functional j=t²/(t²+t+1), discriminant t¹⁰(t²+t+1) on the t-chart, and fibers at 0, 1,∞ of types III*+E₄+E₄.

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Model 3 certificate

Target `G.5/model-3`.

Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy=x³+t³x has functional j=t², discriminant t¹⁰ on the t-chart, and fibers at 0, 1,∞ of types III*+E₄+I₂.

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Model 4 certificate

Target `G.5/model-4`.

Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy=x³+t²x²+t³x has functional j=t², discriminant t¹⁰ on the t-chart, and fibers at 0, 1,∞ of types III*+E₂+nonsplit I₂.

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Model 5 certificate

Target `G.5/model-5`.

Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy=x³+t⁵ has functional j=t, discriminant t¹¹ on the t-chart, and fibers at 0, 1,∞ of types II*+E₄+I₁.

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Model 6 certificate

Target `G.5/model-6`.

Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy=x³+t²x²+t⁵ has functional j=t, discriminant t¹¹ on the t-chart, and fibers at 0, 1,∞ of types II*+E₂+nonsplit I₁.

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Model 7 certificate

Target `G.5/model-7`.

Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy=x³+tx²+t⁴x has functional j=1, discriminant t¹² on the t-chart, and fibers at 0, 1,∞ of types I₄*+E₂+E₄.

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Model 8 certificate

Target `G.5/model-8`.

Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy+ty=x³+tx²+tx has functional j=t⁸, discriminant t⁴ on the t-chart, and fibers at 0, 1,∞ of types III+E₄+I₈.

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Model 9 certificate

Target `G.5/model-9`.

Over F₂, the relatively minimal resolution of the Weierstrass model y²+t²y=x³+tx² has functional j=0, discriminant t⁸ on the t-chart, and fibers at 0, 1,∞ of types I₁*+E₅+IV.

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.5, p. 31; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Model 10 certificate

Target `G.5/model-10`.

Over F₂, the relatively minimal resolution of the Weierstrass model y²+t²y=x³+t³x has functional j=0, discriminant t⁸ on the t-chart, and fibers at 0, 1,∞ of types IV*+E₅+III.

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.5, p. 31; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Model 11 certificate

Target `G.5/model-11`.

Over F₂, the relatively minimal resolution of the Weierstrass model y²+t²y=x³ has functional j=0, discriminant t⁸ on the t-chart, and fibers at 0, 1,∞ of types IV*+E₃+IV.

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.5, p. 31; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Model 12 certificate

Target `G.5/model-12`.

Over F₂, the relatively minimal resolution of y²+txy+t³y=x³+x² has Δ=t¹⁰, j=t², fibres I₂* at t=0 (all components rational), E₄ at t=1, non-split I₂ at ∞, and no other singular fibre. It has constant Picard scheme (#J(F₂)=15+4+6=25) and satisfies condition (ii) of §10.

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem10.4 and twisted-case proof, pp29–31, arXivv3. The printed omission is repaired by PAPER-SCHROER-23/E34 and items238–240, with review attribution. This design proposes individual proof certificates; it has not rerun the prior exhaustive search.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Model 13 certificate

Target `G.5/model-13`.

Over F₂, the relatively minimal resolution of y²+txy+t³y=x³+tx² has Δ=t¹¹, j=t, fibres I₃* at t=0 (all components rational), E₄ at t=1, non-split I₁ at ∞, and no other singular fibre. It has constant Picard scheme (#J(F₂)=17+4+4=25) and satisfies condition (ii).

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem10.4 and twisted-case proof, pp29–31, arXivv3. The printed omission is repaired by PAPER-SCHROER-23/E34 and items238–240, with review attribution. This design proposes individual proof certificates; it has not rerun the prior exhaustive search.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Model 14 certificate

Target `G.5/model-14`.

Over F₂, the relatively minimal resolution of y²+txy+t²y=x³+t²x² has Δ=t⁸(t²+t+1), j=t⁴/(t²+t+1). Its fibres are IV* at t=0 (all components rational), E₄ at t=1, non-split I₂ at ∞, and I₁ over the point t²+t+1=0. It has constant Picard scheme (#J(F₂)=15+4+6=25) and satisfies condition (ii).

**Inputs.** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem10.4 and twisted-case proof, pp29–31, arXivv3. The printed omission is repaired by PAPER-SCHROER-23/E34 and items238–240, with review attribution. This design proposes individual proof certificates; it has not rerun the prior exhaustive search.

**Proof outline.**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.

2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.

3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.

4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Acceptance beyond the stated contract**

- A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count.

- For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

### Nonrational bad fibers in the eleven nonzero-j models

Target `G.5/nonrational-nonzero-j`.

For the eleven nonzero-j candidates all fibers over nonrational base points are smooth, except models 2 and 14. Each has one closed degree-two bad point t²+t+1=0, with geometric fiber type I₁ at each of its two conjugate geometric points.

**Inputs.** `G.5/model-1`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`, `G.5/f2-candidate-equation`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Factor each explicit polynomial discriminant and inspect the reverse chart.

2. At t²+t+1 the discriminant has simple valuation and c₄ is a unit, yielding I₁ via the imported minimal-equation criterion.

**Acceptance beyond the stated contract**

- The exceptions are models 2 and 14. The closed degree-two point contributes no F₂-rational base point and splits into two geometric points after extending to an algebraic closure.

### Smooth nonrational fibers of zero-j models

Target `G.5/nonrational-zero-j`.

All fibers at nonrational base points in the three models of Theorem 10.5 are smooth.

**Inputs.** `G.5/model-9`, `G.5/model-10`, `G.5/model-11`, `G.5/f2-candidate-equation`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.5, p. 31; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. For each of models9–11, Δ=t⁸ on the finite chart and all finite nonrational points have nonzero discriminant.

2. Inspect the infinity chart separately; it is a rational base point.

**Acceptance beyond the stated contract**

- The three zero-j equations define elliptic generic curves because Δ is not identically zero.

**Remaining proof obligations for G.5**

- Actual resolved model certificates

- Replace unresolved supplier stage requests by exact verified exports.

## G.6 — Completeness and classification certificates

Normalization to a₂=0 leaves 2¹⁸ raw characteristic-two coefficient tuples. Degree-preserving changes have 512 polynomial triples, with the six projective-line automorphisms included in the equivalence relation. Every rejection in an exhaustive certificate must have a justified mathematical witness, and every accepted representative needs all-place minimality and resolved geometry. The eleven nonzero-j and three zero-j classification targets depend on that certificate and on pairwise inequivalence. The source's candidate list alone supplies neither assertion.

**Planets:** Fourteen-model completeness; Nonzero-j classification; Zero-j classification.

### Characteristic-two a₂ normalization

Target `G.6/a2-normalization`.

Every degree-bounded characteristic2 equation can be transformed to one with a₂=0 by the global change x↦x+a₂, with the other coefficients still satisfying their weights. Thus a₂=0 leaves2¹⁸ raw F₂ coefficient tuples.

**Inputs.** `G.3/bounded-weierstrass`, `G.3/global-chart-equation`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorems 10.4–10.5 and the earlier review search; arXiv v3 pp. 28–32; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Expand the cubic after x↦x+r with r=a₂; in characteristic2 the x² coefficient becomes a₂+r=0.

2. The weighted terms a₁r,a₃r,r³,a₄r all retain their required bounds.

3. Count the coefficient dimensions2+4+5+7=18 for weights1,3,4,6.

**Acceptance beyond the stated contract**

- The normalization must preserve the global chart weights.

### Finite admissible equivalence action

Target `G.6/admissible-transformations`.

Degree-preserving coordinate transformations over F₂ have u=1, polynomials s,r,q of degree≤1,≤2,≤3 in y↦y+s x+q,x↦x+r. There are512 triples. Together with the six elements of PGL₂(F₂), they generate the permitted equivalence of the global elliptic fibrations.

**Inputs.** `G.6/a2-normalization`, `G.3/global-chart-equation`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorems 10.4–10.5 and the earlier review search; arXiv v3 pp. 28–32; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Use the global weight bundles to bound all translation parameters; count2²·2³·2⁴=512.

2. Construct the induced two-chart transformations, including the PGL₂ denominator/weight changes.

3. Use the Weierstrass isomorphism theorem to prove that every fibration isomorphism is captured, rather than merely enumerating some transformations.

**Acceptance beyond the stated contract**

- Base inversion must use the second chart and its weights; substitution t↦1/t alone does not give a polynomial model.

### Exhaustive finite rejection certificate

Target `G.6/finite-rejection-certificate`.

For each of the2¹⁸ normalized tuples, certify either Δ=0, failure of global minimality/rationality, failure of Picard constancy or the rational-fiber condition, or equivalence to one of the fourteen candidates. Every rejection names its mathematical criterion and a checkable witness.

**Inputs.** `G.6/a2-normalization`, `G.6/admissible-transformations`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.4/lang-configuration-inputs`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorems 10.4–10.5 and the earlier review search; arXiv v3 pp. 28–32; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Enumerate the finite coefficient space completely after the proved normalization.

2. Factor Δ and its weight12 reversal; run the perfect-residue Tate algorithm at every bad place, including all irreducible factors and infinity.

3. Certify the regular resolved-surface point count and the single-semstable-or-supersingular condition; keep rationality/χ prerequisites explicit.

4. For survivors, produce an admissible transformation and a base automorphism reaching the named candidate.

**Acceptance beyond the stated contract**

- A table of survivors without rejection witnesses is not an exhaustiveness proof.

### Completeness of the fourteen-model list

Target `G.6/completeness`.

Prove that all rational Jacobian elliptic fibrations over F₂ satisfying §10 conditions (i)–(ii) are represented by the fourteen candidate equations (/115 and /117), modulo the permitted coordinate changes and PGL₂(F₂), and verify the hypotheses and equivalences for each representative.

**Hypotheses.** The target is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹_F₂, with constant Picard scheme and at most one rational fiber that is singular semistable or smooth supersingular. Completeness is conditional on the finite rejection and individual model certificates.

**Inputs.** `G.3/global-chart-equation`, `G.6/a2-normalization`, `G.6/admissible-transformations`, `G.6/finite-rejection-certificate`, `G.5/model-1`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorems 10.4–10.5 and the earlier review search; arXiv v3 pp. 28–32; arXiv v3. Correct the count to14. Completeness is the separately named obligation247, not inherited from the printed eleven-model assertion.

**Proof outline.**

1. Use global Weierstrass construction to represent every target surface by a bounded equation.

2. Normalize a₂, apply the finite rejection certificate and transport back through the admissible-equivalence theorem.

3. Use individual model certificates to establish the converse; prove pairwise nonequivalence of surviving orbits.

**Acceptance beyond the stated contract**

- The theorem is conditional on the full rejection and model certificates until all gaps are closed.

### Eleven nonzero-j classes

Target `G.6/nonzero-j-classification`.

Assuming the completeness certificate, every surface satisfying §10(i)–(ii) with nonzero functional j is equivalent to exactly one of models1–8,12–14.

**Inputs.** `G.6/completeness`, `G.5/f2-candidate-equation`, `G.5/model-1`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, pp. 29–31; arXiv v3. Eight printed nonzero-j entries are supplemented by three; keep the completeness hypothesis explicit.

**Proof outline.**

1. Partition the certified fourteen orbits by their verified functional j.

2. The eleven nonzero-j equations form the required subfamily.

**Acceptance beyond the stated contract**

- The three additional candidates cannot be discarded because their infinity fibers are nonsplit.

### Three zero-j classes

Target `G.6/zero-j-classification`.

Assuming the completeness certificate, every surface satisfying §10(i)–(ii) with j=0 is equivalent to exactly one of models9–11.

**Inputs.** `G.6/completeness`, `G.5/f2-candidate-equation`, `G.5/model-9`, `G.5/model-10`, `G.5/model-11`.

**Source and scope.**

- [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3), Theorem 10.5, pp. 31–32; arXiv v3. The routed statement is narrowed or corrected as specified in this node.

**Proof outline.**

1. Partition the certified fourteen orbits by functional j=0.

2. Use the three individual zero-j certificates and pairwise nonequivalence.

**Acceptance beyond the stated contract**

- Completeness does not follow from the three verified examples alone.

**Remaining proof obligations for G.6**

- William Lang2000 source acquisition and decomposition

- Completeness, minimality, resolution and orbit proof

- Replace unresolved supplier stage requests by exact verified exports.

## Native comparison regressions

The normalization-chart tests use the actual Spec inclusion on q and tq in cusp and nonsplit F₂ fixtures. A split fixture checks two distinct evaluation points with the same pinched image. On the cusp principal open D(q), division of the actual pulled-back tq by q recovers the actual polynomial section t. The retained overlap tests require the native overlap maps and opens. A finite map with an incorrect coordinate action can satisfy finiteness while failing these statements.

The affine relative-normalization comparison is tested after inclusion in the actual source-section ring. It must agree with the actual map to relative normalization, preserve the actual base-section coefficient action and commute with restriction to D(r) properly contained in U. A family of unrelated ring isomorphisms may satisfy both inverse identities while failing these requirements.

The function-field tests take generic germs through ΓSpecIso and the inverse section isomorphisms of the actual chart inclusions. They fix the images of q and tq in the cusp and nonsplit fixtures and of the common infinity coordinate u in the split fixture. Preservation of zero, one and nonzero elements remains supplementary API; an incorrect field automorphism can satisfy those generic laws while failing the coordinate tests. Nonempty chart-image instances are obligations inside the examples. No test assumes the coordinate equality that it is intended to check.

## Proof gaps and supplier contracts

These are the boundaries that prevent mathematical closure. Every layer is planned, and every listed obligation is required. The precise neededBy targets and exact supplier-request scopes are retained in the packet. Source access and supplier implementation are separate from mathematical planning.

### Algebraic-space exports and signatures for the verified pinching chain

Temkin–Tyomkin v3 Theorems5.3.1(ii),6.2.1(ii)(b) verify finite-pinching existence without affine-neighborhood, Noetherian or quasi-separated assumptions. The twelve consumer declarations now give the étale construction, universal property and scheme criterion. Their SF.1 algebraic-space carrier, exact descent/quotient/lifting/representability exports and SF.3 flat patching equivalence are requests, not existing declarations. Full algebraic-space Lean signatures remain omitted with exact names and contracts; no fabricated carrier substitutes for them. This is now an export/type/proof integration gap, not uncertainty about a primary existence theorem.

Needed by `key/ferrand-pushouts`, `G.0/algebraic-space-existence`, `G.0/space-flat-base-change`, `G.0/space-scheme-recognition`.

### Numerical-Picard geometric descent bridge

Schröer3.1 imports its Theorem2.1. A full source proof and declaration-sized component-class uniqueness/Galois-descent bridge to SF.5 and the Picard owners are not yet supplied. The finite-field component/count conclusions are conditional on this explicitly requested bridge.

Needed by `G.1/component-descent`.

### Lang general theorem owner and proof closure

Earlier design and independent-review reading covers the original argument; this revision retains that attribution. The general smooth-connected-group theorem needs a foundational owner beyond the reductive-only group roadmap; this packet owns only the genus-one consumer. Decompose the generic-point/separable-extension argument or supply a primary modern proof at that owner, then replace this consumer gap by exact nodes.

Needed by `G.1/lang-genus-one`.

### EGA and Raynaud source-level adapter closure

The design attributes the EGA IV 18.5.11(c), Raynaud 6.1.4 and 8.2.1 statement checks to earlier work; this review does not claim to have reacquired those original public editions. Before marking G.2 closed, read their exact hypotheses and proofs and provide the local horizontal-component and (N)* adapters as target-level proof outlines with exact owner exports. Do not split a target proof into lemma nodes solely because it is long.

Needed by `G.2/transverse-divisor`, `G.2/normal-dominating-model`, `G.2/cohomology-adapter`.

### LLR recursive proof prerequisites

The6.6 proof,5.9 and7.1 statements and the corrigendum are read, but the recursive Lie/Picard comparison, Saito conductor equality and period-index inputs are not fully source-decomposed in the R11 suppliers. This is a proof gap, not a permission to apply6.6 over F₂.

Needed by `G.2/llr-kodaira-comparison`.

### Canonical bundle and wild-fiber proof closure

Bombieri–Mumford Theorem2/Proposition4 are read. The general duality and coherent relative cohomology are supplier requests. Raynaud’s multiplicity/order theorem6.3.5 still needs original-source reading and exact decomposition at its Picard owner before the tame↔ν=m equivalence is closed.

Needed by `G.3/canonical-bundle`, `G.3/tame-wild`.

### Rational-surface classification proof source

The geometric blowup/rationality input is cited by Schröer but not proved in its relevant sections. The1989 Cossec–Dolgachev public file contains only preliminary pages. The2024 author edition supplies a useful consumer account; a source-closed rational-surface minimal-model/blowup proof and the corresponding SF.5 export are still required.

Needed by `G.3/rational-picard-lattice`.

### Quasielliptic generality beyond the smooth model supplier

StableReduction Layer5 supplies smooth proper generic curves. The non-smooth regular genus-one compactification, global gluing over B, characteristic2 allowed fibers and2-torsion Picard group need a complete primary proof. The2024 consumer passages refer to Tate genus change and later Jacobian/group comparisons; those recursive sources were not all read.

Needed by `G.3/quasielliptic-characteristic`, `G.3/global-minimal-jacobian`, `G.1/canonical-type-classification`.

### William Lang2000 source acquisition and decomposition

The exact article Configurations of singular fibers on rational elliptic surfaces in characteristic two, Comm.Algebra28(12),5813–5836, DOI10.1080/00927870008827190, was not obtained from the public searches. The node lists each required input as a worklist, not a closed declaration. Acquire it and split its assertions, or replace them by independently certified complete finite calculations. The route item/247 remains open.

Needed by `G.4/lang-configuration-inputs`, `G.6`.

### Actual resolved model certificates

The fourteen equations, degree bounds and invariant identities are explicit. Their all-place Tate/minimality, splitting, regular resolution, rationality and Picard certificates are not supplied as independently validated proofs. Keep each model as a key target with a sound proof outline covering those obligations and exact supplier imports; attach invariant and coordinate calculations to its API/proof rather than automatically creating proof-step nodes. The equation-algorithm to actual regular-scheme comparison remains a supplier request.

Needed by `G.5/model-1`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`.

### Completeness, minimality, resolution and orbit proof

No2¹⁸ or2²¹ full search was run in this design. The previous independent paper review reports one, but its scripts and rejection witnesses are not supplied here as a proof. Certify the enumeration, all bad places, geometric resolutions, rationality, count criterion and512×PGL₂ action; or obtain and fully decompose Lang2000 with all specializations. Keep both classifications explicitly conditional on247.

Needed by `G.6/a2-normalization`, `G.6/admissible-transformations`, `G.6/finite-rejection-certificate`, `G.6/completeness`, `G.6/nonzero-j-classification`, `G.6/zero-j-classification`.

### Tsen primary proof and foundational ownership

The algebraically closed hypothesis is verified and the false finite-field use is removed. A full primary proof of C₁ and its Brauer/Picard obstruction consequence has not been acquired in this job. Locate the foundational owner and decompose it before using this node; the Jacobian generation argument instead uses its actual section.

Needed by `G.3/tsen-obstruction`.

### General Lang theorem for projective-line forms

Earlier design and independent-review reading covers the original smooth-connected-group argument, but its general group and torsor proof needs a foundational owner and exact declarations. The genus-one consumer is not used as a substitute for PGL₂. Prove the general Lang map theorem, or a source-closed finite-field genus0 rational-point argument, before the form comparison is closed.

Needed by `G.1/finite-field-p1-forms`, `G.1/component-descent`.

### Suggested signatures for unbuilt geometric conditions

The whole suggested file elaborates at the pinned shared build, with only the expected placeholder-proof warnings. Its explicit omission ledger still applies: full genus-one contraction/cohomology/minimality, geometric fiber/Kodaira and degeneracy conditions and the algebraic-space carrier are not supplied by the partial native forms. Omitted owner types must be integrated from the recorded suppliers; elaboration of a partial signature does not establish those full mathematical types. Scheme conductor signatures use the actual native carriers and the exact planned SF.0 flat-annihilator, ideal-comap-top and ideal-restrict-top exports.

Needed by `G.1/genus-one-fibration`, `G.1/fiber-type-divisor`, `G.1/geometric-kodaira`, `G.1/degenerate-fiber`, `key/ferrand-pushouts`.

### Henselization adapter for the multiple-fiber isogeny

The source reduces an excellent DVR to its henselization. Its residue field is unchanged, the good-reduction elliptic scheme base changes, and regular relative minimality plus the multiple-fiber description must be preserved. Supply the exact regular-model base-change statement before applying the henselian transverse-divisor proof to an arbitrary excellent DVR. The isogeny is then already over the original residue field, so no descent of a morphism across a residue-field extension is needed.

Needed by `G.2/multiple-fiber-isogeny`.

### Pointed genus-one scheme to binary-equation classification adapter

The native five-model coefficient classifier is fully decomposed with all finite witnesses. Its conversion to the existing arbitrary elliptic-curve target still needs the exact SF.3 Weierstrass scheme presentation and projective-change/rational-point comparison exports. The borrowed EllipticCurves isogeny stage is function-field based, and its VariableChange docstrings do not supply this scheme-level export. The general construction remains with SF.3 and its AlgebraicCurves/JacobianChallenge inputs.

Needed by `G.1/five-f2-classes`, `G.2/f2-isomorphism`.

### Exact native quadratic-pinching owner interfaces

The affine quadratic algebra, bivariate quotient presentation, polynomial coordinates and mapping property, normalization-localization comparison, actual two-chart schemes and absolute-normalization isomorphism are planned. The remaining owner integration is the native P¹/Proj identification and properness/projectivity, specialized conductor/cohomology and genus, the separate I₂ scheme, and finite-extension geometric packaging. Distinct-root option-point formulas are not geometric normalization/cohomology proofs. All implementations remain unchecked. The whole canonical suggested file elaborates at the pinned build, including the native coordinate and restriction tests; P¹/Proj, properness, projectivity and cohomology are still mathematical obligations.

Needed by `G.1/quadratic-point-proper-pushout`, `G.1/quadratic-pinch-i1-genus`, `G.1/quadratic-pinch-i2-genus`, `G.1/quadratic-extension-counts`.

### Requested exports

- **SchemeAndStackFoundations:SF.0**: Remaining SF.0 inputs: ring quotient/tensor quotient and localization comparisons used in the general Ferrand affine construction; finite-algebra principal-open separation and finite closed-map arguments in Ferrand 7.1B; henselian finite-component and regular-local horizontal-parameter statements, with the excellent-DVR henselization/model-preservation adapter; flat tensor exactness for the affine fiber-product sequence; classification of commutative length-two algebras over a field; and exact generic Proj hypersurface chart and overlap comparisons. The finite-component theorem alone does not construct a Cartier divisor or identify a length-m schematic fiber. Part II owns only the conductor and quadratic-cubic specializations. The supplier already plans SF.0/flat-annihilator, SF.0/ideal-comap-top and SF.0/ideal-restrict-top with the needed generality; conductor consumers import these exact nodes through their direct proof chain. Those exports are planned, not implemented, and this request does not re-plan them.

  Consumers: `G.0/affine-existence`, `G.0/compatible-affine-neighbourhoods`, `G.0/conductor-square`, `G.0/flat-base-change`, `G.1/small-conductor-classification`, `G.2/multiple-fiber-isogeny`, `G.2/normal-dominating-model`, `G.2/transverse-divisor`, `G.1/quadratic-pinch-i1-genus`.

- **SchemeAndStackFoundations:SF.1**: Affine scheme section/localization comparisons, quotient-topology and scheme-gluing theorems needed to prove Ferrand5.1 for arbitrary targets and global7.1. Supply the genuine algebraic-space carrier with its small étale structure sheaf and specified products over a scheme base. Export finite-map cofinality of pullbacks of whole étale covers (TT5.1.2), affine étale lifting across closed immersions (Stacks04D1; its ind-quasi-affine extension TT5.2.5), effective étale descent of morphisms and isomorphisms, and étale-local descent of affine, finite and closed-immersion properties. Export algebraic-space diagonal properties (Stacks02X4), separated locally quasi-finite representability and its local quasi-affine refinement (Stacks67.50.2, section0417; do not add a global quasi-compactness assumption), the locally-finite-type monomorphism test after surjective base change (TT2.1.6), and the quotient of an étale equivalence relation with a monomorphic relation map (Stacks04S6). Supply the universally-closed-surjective separatedness criterion (Stacks05Z2) for the already constructed finite overlap. These exact inputs support the now verified TT finite-pinching consumer chain; Stacks0EDP/81.7 only upgrades an already schematic pushout and is not used as unconditional existence. Existence and effectivity of the free finite constant-group quotient of the projective scheme A×Spec R′, with its generic and special-fiber base-change identifications.

  Consumers: `G.0/affine-existence`, `G.0/compatible-affine-neighbourhoods`, `G.0/global-existence`, `G.2/diagonal-quotient-example`, `key/ferrand-pushouts`, `G.0/algebraic-space-existence`, `G.0/space-flat-base-change`, `G.0/space-scheme-recognition`.

- **SchemeAndStackFoundations:SF.3**: Flat base change of qcqs pushforwards and Milnor patching of finite projective modules on ring fiber products; the rank-one groupoid statement must retain the overlap identification. Relative cohomology/base change and Picard–norm comparison for integral proper curves; positive section twist cohomology; Leray and Euler-characteristic formulas including nonreduced fibers; normalization cohomology exact sequence. Stein factorization and normal-base comparison f_*O=O for the proper normal DVR model, genuine coherent genus and base change; Picard-to-line-bundle obstruction sequence over fields. For the algebraic-space continuation supply the affine flat-object patching equivalence of TT3.4.1 and its scheme-local extension4.1.2, with cartesian unit/counit, flat fiber products, surjectivity and étale-property comparison; preserving an already formed square under flat base change alone is insufficient for constructing the presentation. For G.1/five-f2-classes export a pointed smooth-proper genus-one scheme’s native Weierstrass presentation, equality of its F₂-points with the projective equation count, and realization of an admissible change as an infinity-preserving curve isomorphism. Import the AlgebraicCurves model/dictionary and JacobianChallenge cohomological-genus bridges; a bijection or additive isomorphism of rational point groups is insufficient.

  Consumers: `G.0/flat-base-change`, `G.0/line-bundle-patching`, `G.1/genus-one-fibration`, `G.2/cohomology-adapter`, `G.2/domination-genus`, `G.2/equality-regular`, `G.2/normal-dominating-model`, `G.2/unique-dominating-component`, `G.3/canonical-bundle`, `G.3/canonical-degree`, `G.3/generic-picard-restriction`, `G.3/positive-section-cohomology`, `G.3/pushforward-splitting`, `G.3/tame-wild`, `G.3/tsen-obstruction`, `G.0/algebraic-space-existence`, `G.0/space-flat-base-change`, `G.1/five-f2-classes`.

- **AlgebraicModuliForArithmeticGeometry:A0-extension**: Picard/line-bundle groupoid formalism, effective gluing of morphisms, and the Raynaud cohomological-flatness criterion at its owner; this roadmap supplies only the conductor-specific and regular-model adapters. Raynaud Spécialisation du foncteur de Picard (1970)6.1.4 (N)* and8.2.1: give the exact normal/generic-fiber hypotheses and section⇒degree0-cohomological-flatness statement. Y must satisfy f_*O=O. General criterion stays with this owner. For smooth geometrically rational surfaces, the étale torsion-free Picard group scheme comparison to the geometric lattice and constancy iff trivial geometric Galois action; no identification of Picard-functor points with line bundles without obstruction hypotheses. Norm and tangent-space comparison for Pic⁰ of proper integral curves, generic Jacobian representability including the stated regular nonsmooth genus-one case, Picard obstruction sequence, and Raynaud6.3.5 multiplicity/order theorem with all hypotheses.

  Consumers: `G.0/line-bundle-patching`, `G.1/lang-genus-one`, `G.2/cohomology-adapter`, `G.2/domination-genus`, `G.3/global-minimal-jacobian`, `G.3/shioda-tate`, `G.3/tame-wild`, `G.3/tsen-obstruction`, `G.4/picard-point-count`.

- **tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces**: Zariski fiber-intersection lemma with primitive multiplicity vector generating the radical and every proper component submatrix negative definite; import its geometric realization, not a second abstract numerical type.

  Consumers: `G.1/canonical-type-classification`, `G.1/fiber-type-divisor`, `G.2/normal-dominating-model`, `G.2/transverse-divisor`, `G.3`, `G.3/canonical-bundle`, `G.3/generic-picard-restriction`, `G.3/rational-picard-lattice`, `G.3/relative-cubic-contraction`, `G.5/model-1`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.6/finite-rejection-certificate`.

- **AlgebraicModuliForArithmeticGeometry:R09.3**: Effective Galois descent of component subschemes and of finite-field forms of P¹. Supply the precise constant numerical-Picard implication used in Schröer3.1; source Theorem2.1 proof and a Picard-component rigidity bridge must be decomposed, not inferred from fixed numerical classes alone. Effective descent of genus0 forms and the free diagonal finite constant-group action, including generic torsor identification and reduced special fiber A/G.

  Consumers: `G.1/component-descent`, `G.1/finite-field-p1-forms`, `G.2/diagonal-quotient-example`.

- **tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1**: Import ordinary/supersingular definitions and the characteristic2 equivalence a₁=0 iff j=0 for smooth elliptic curves. The baseline j lemma supplies only the invariant equivalence; no bad-fiber criterion follows without Δ=0. An F_q-isogeny gives equality of all extension-field point counts, via rational Tate-module Frobenius and the point-count formula; do not request the converse of Tate1966.

  Consumers: `G.1`, `G.1/E1`, `G.1/E2`, `G.1/E3`, `G.1/E4`, `G.1/E5`, `G.1/five-f2-classes`, `G.2/extension-counts`, `G.3`.

- **tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs**: Normalization commutes with every field extension when the normalization is smooth over the original field; verify the geometrically reduced target and finite birational comparison. The hypothesis is stronger than reducedness of the target.

  Consumers: `G.1`, `G.1/canonical-type-classification`, `G.1/count-15`, `G.1/nonsplit-i1`, `G.1/nonsplit-i2`, `G.1/small-conductor-classification`, `G.2/equality-regular`.

- **tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity**: Proper-flat genus/Euler-characteristic constancy, finite-dimensional coherent fiber cohomology and vanishing above degree1, also for the nonreduced normal-total-space model used after normalization.

  Consumers: `G.1/finite-field-p1-forms`, `G.1/genus-one-fibration`, `G.2/cohomology-adapter`, `G.3/canonical-degree`, `G.3/positive-section-cohomology`, `G.3/pushforward-splitting`, `G.3/rational-canonical`.

- **NeronModelsAndSemistableAbelianVarieties:R11.2**: LLR2004 discriminant comparison5.9 (perfect residue) with determinant/Lie-lattice corrections, and the generic Picard-versus-Jacobian Brauer obstruction retained. Export exact statements supplying6.6; the2018 corrigendum changes4.3, not6.6.

  Consumers: `G.2/diagonal-quotient-example`, `G.2/llr-kodaira-comparison`.

- **NeronModelsAndSemistableAbelianVarieties:R11.4**: LLR6.1(b),6.5,7.1 comparison of component counts/groups and abelian/toric ranks under algebraically closed residue hypotheses, plus period=gcd fiber multiplicities needed for6.6.

  Consumers: `G.2/llr-kodaira-comparison`.

- **SchemeAndStackFoundations:SF.5**: Define geometrically rational surface using birationality to P² after algebraic closure, with geometric integrality. Export smooth proper rational-surface birational invariance, H¹=H²(O)=0, étale torsion-free Picard=Num, b₁=0 and b₂=ρ. Read a full rational-surface theorem proof; do not infer geometric smoothness from birationality alone. Effective divisor/intersection carriers, adjunction and Hodge index; rational-surface blowup Picard decomposition and torsion-free Picard=Num comparison; connected affine root classification geometric realization. Abstract IntegralLattice objects stay imported from baseline. Regular resolution of the minimal Weierstrass cubic with rational double points and its rationality/coherent and lattice invariants; supply the geometric component-intersection realization of Tate outputs. The model-specific certificate belongs to this Part II.

  Consumers: `G.1/canonical-type-classification`, `G.1/component-descent`, `G.1/fiber-type-divisor`, `G.1/geometric-kodaira`, `G.2/domination-genus`, `G.3`, `G.3/canonical-bundle`, `G.3/even-complement`, `G.3/fiber-section-plane`, `G.3/generic-picard-restriction`, `G.3/rational-canonical`, `G.3/rational-picard-lattice`, `G.4/picard-point-count`, `G.5/model-1`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.6/finite-rejection-certificate`.

- **SchemeAndStackFoundations:SF.4**: Relative dualizing sheaf and evaluation, relative projective-bundle/cubic construction and image normality; import upstream StableReduction’s curve duality where it covers the hypothesis, and extend its non-nodal genus-one use without duplicating its carrier.

  Consumers: `G.3/canonical-bundle`, `G.3/global-chart-equation`, `G.3/relative-cubic-contraction`.

- **tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models**: Smooth positive-genus regular/minimal-model uniqueness and generic section extension; supply local exports for gluing over a regular curve. Non-smooth quasielliptic models are explicitly outside the imported smooth theorem and are owned by the new extension.

  Consumers: `G.1/genus-one-fibration`, `G.2/llr-kodaira-comparison`, `G.3/global-minimal-jacobian`, `G.3/shioda-tate`.

- **tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv**: Minimal-equation Kodaira symbols and Tate algorithm with perfect-residue hypotheses; export the scheme-realization comparison to the normal Weierstrass cubic’s regular resolution rather than equating an equation-side output with a scheme by name.

  Consumers: `G.1/geometric-kodaira`, `G.2/llr-kodaira-comparison`, `G.3/bounded-weierstrass`, `G.3/coefficient-nondegeneracy`, `G.3/relative-cubic-contraction`, `G.4/lang-configuration-inputs`, `G.4/unique-additive`, `G.5/model-1`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.5/nonrational-nonzero-j`, `G.5/nonrational-zero-j`, `G.6/finite-rejection-certificate`.

- **SchemeAndStackFoundations:SF.6**: Rational-surface cycle-class isomorphism Num(J)⊗Q_ℓ≅H²_et(Jbar,Q_ℓ(1)), Galois compatibility and the convention that untwisted geometric Frobenius multiplies divisor eigenvalues by q.

  Consumers: `G.4/picard-point-count`.

- **WeilConjectures:WC.7**: Resolved smooth proper rational-surface trace formula with H⁰,H⁴ contributing1,q² and H¹=H³=0. The integrated WC.6 packet is not an exact rational-surface geometric point-count export; provide the actual realization and sign/twist comparisons.

  Consumers: `G.4/picard-point-count`.

- **tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion**: Import the existing upstream stage as stated; its mathematical construction is not re-planned here. Exact integration exports must be supplied before the consuming nodes are closed.

  Consumers: `G.1/fiber-type-divisor`.

- **tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv**: Import the existing upstream stage as stated; its mathematical construction is not re-planned here. Exact integration exports must be supplied before the consuming nodes are closed.

  Consumers: `G.1/five-f2-classes`, `G.1/lang-genus-one`, `G.2/domination-genus`, `G.2/multiple-fiber-isogeny`, `G.6/admissible-transformations`.

- **AlgebraicModuliForArithmeticGeometry:R09.1**: Relative projective-bundle construction, morphism from a generated invertible sheaf and global Weierstrass isomorphism comparison under degree-preserving changes; distinguish the singular cubic from its regular resolution.

  Consumers: `G.3/relative-cubic-contraction`, `G.6/admissible-transformations`.

- **SchemeAndStackFoundations:SF.0**: Exact native exports for the quadratic pinching consumer: Noetherian finite-type fibre products (Stacks00IT/37.67.5), the canonical first-isomorphism/monic-V division and localization/fraction-field comparison, separable quadratic tensor splitting, finite-field embedding parity and field-valued points through scheme reduction. Existing quotient and polynomial carriers remain imports. The scalar residue map, its laws and its ambient conductor computation are now supplied directly by the pinned polynomial baseline and the local quadratic adapters. No generic remainder/quotient carrier or residue-map theorem is requested for that resolved affine subproblem; the presentation/localization and geometric consumers still need their specific comparison exports.

  Consumers: `G.1/quadratic-pinch-algebra`, `G.1/quadratic-point-proper-pushout`, `G.1/quadratic-pinch-i1-genus`, `G.1/quadratic-pinch-i2-genus`, `G.1/quadratic-pinch-splitting`, `G.1/quadratic-extension-counts`.

- **tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs**: Export the existing normalization, nodal-chart and branch-scheme interfaces for the concrete quadratic hypersurface chart, including compatibility of the finite birational normalization with field extension. No general node, normalization, graph or genus carrier is re-planned here.

  Consumers: `G.1/quadratic-pinch-algebra`, `G.1/quadratic-pinch-i1-genus`, `G.1/quadratic-pinch-i2-genus`, `G.1/quadratic-pinch-splitting`.

- **SchemeAndStackFoundations:SF.3**: Exact scheme P¹/coherent-cohomology integration exports, importing SR.2/JacobianChallenge: H⁰(P¹,O)=k,H¹(P¹,O)=0, the long exact normalization sequence for the displayed conductor quotients, and finite-field P¹ counts. Retain the chosen two-component incidence identifications.

  Consumers: `G.1/quadratic-pinch-i1-genus`, `G.1/quadratic-pinch-i2-genus`, `G.1/quadratic-extension-counts`.

## Source corrections and provenance

The following bounded source corrections give the assertion, correction and reason at each locator. Their provenance is recorded in the packet. They determine the statements used here; they do not supply the geometric or exhaustive-classification certificates required in G.5 and G.6.

### ES4 — Proposition 3.1, p. 10 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen)

**Reported assertion, paraphrased.** Proposition 3.1 identifies the labeled geometric and schematic component graphs, then connects geometric reducibility, rationality of the base point and rationality of every component without a singular-fiber restriction.

**Correction.** Assume in addition that the fiber is singular (f^{−1}_ind(ā) singular) for (ii)⇒(iii).

**Reason.** A smooth elliptic fiber over a rational point, for instance in E × P¹ over F_q, satisfies (ii) but not (iii). The proof of (ii)⇒(iii) uses that the geometric components are rational curves, which holds for singular fibers. Every application in the paper (Propositions 9.2, 9.3 and 11.1) concerns singular fibers. /14 states the corrected proposition.

**Effect:** a stated result. **Provenance:** Collated from PAPER-SCHROER-23/E4 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

### ES7 — proof of Proposition 6.1, p. 18 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen)

**Reported assertion, paraphrased.** The inverse-chart rescaling uses the reciprocal homogeneous-coordinate ratio incorrectly in one expression for the sixth power; its ensuing coefficient transformation has the intended direction.

**Correction.** t^{−6} = (t₁/t₀)^6.

**Reason.** t = t₀/t₁, so t^{−6} = (t₁/t₀)^6. The conclusion a′_i = a_i/t^i is right; /71 uses it.

**Effect:** nothing. **Provenance:** Collated from PAPER-SCHROER-23/E7 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

### ES8 — proof of Proposition 6.1, p. 18 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen)

**Reported assertion, paraphrased.** The argument assigns relative very ampleness directly to the section-twist sheaf on the regular surface, before the vertical contraction.

**Correction.** O_J(3E) is relatively base-point free and defines the contraction J → Z; the sheaf O_Z(3E) on the Weierstrass model is relatively very ample and embeds Z in P(E).

**Reason.** O_J(3E) is trivial on the vertical curves disjoint from E, which Z contracts, so it is not relatively very ample on J. The subscript X also stands for J here.

**Effect:** nothing. **Provenance:** Collated from PAPER-SCHROER-23/E8 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

### ES13 — proof of Proposition 9.3(v), p. 25 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen)

**Reported assertion, paraphrased.** The Mordell–Weil comparison invokes vanishing of the function-field Brauer group over a finite constant field to identify Picard-scheme points with line bundles.

**Correction.** Br(F) ≠ 0 for F = F₂(t). Instead: over F̄₂(t) Tsen's theorem holds, so L ↦ (L − (deg(L|Y_F̄)/2)R)|Y_F̄ is a surjective Galois-equivariant map Pic(Ȳ) → MW(J̄/P̄¹) for an F₂-rational two-section R. Since Pic(Ȳ) has trivial Galois action (constant Picard scheme), so does MW(J̄/P̄¹), and Galois-fixed sections descend: MW(J/P¹) = MW(J̄/P̄¹).

**Reason.** Tsen's theorem concerns k(t) with k algebraically closed. Br(F₂(t)) is non-zero: the cyclic algebra of F₄(t)/F₂(t) and t is non-split, since norms from F₄(t) have even valuation at t = 0. So Pic⁰_{Y_F/F}(F) = Pic⁰(Y_F) is not justified as printed. The statement (v) itself survives by the correction; /94 records it.

**Effect:** the proof. **Provenance:** Collated from PAPER-SCHROER-23/E13 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

### ES14 — proof of Proposition 9.5, p. 27 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen)

**Reported assertion, paraphrased.** The graph-rigidity argument treats the root-lattice dual restriction as preserving norms and transfers evenness across it.

**Correction.** The restriction W → W_ā^* is not an isometry. Argue instead: under the hypothesis, the image of W in W_ā^* is W_ā + ℤΘ₁^*; since W is unimodular, every x ∈ W_ā ⊗ ℚ pairing integrally with W lies in W, and Θ₁^* does. So Θ₁^* ∈ W, and (Θ₁^*)² = −1 contradicts the evenness of W.

**Reason.** Orthogonal projection onto W_ā ⊗ ℚ does not preserve the form, so evenness of W says nothing directly about the norm of the image of an element. The dual-lattice argument gives the stated contradiction; /97 records it.

**Effect:** the proof. **Provenance:** Collated from PAPER-SCHROER-23/E14 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

### ES15 — proof of Proposition 10.3, p. 29 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen)

**Reported assertion, paraphrased.** The reduction test characterizes additive fibers by c₄ vanishing without explicitly restricting the equivalence to singular fibers.

**Correction.** A singular fiber J_x is unstable if and only if c₄ vanishes at x.

**Reason.** In characteristic 2, c₄ = a₁⁴ also vanishes at a smooth supersingular fiber (j = 0). The argument only needs that an unstable fiber lies over a zero of c₄, which the correction gives; /102 and /199 record it.

**Effect:** nothing. **Provenance:** Collated from PAPER-SCHROER-23/E15 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

### ES29 — Introduction, p. 3 (third displayed theorem); the same claim opens §10, p. 27 (arXiv v3 = author version of 19 July 2022)

**Reported assertion, paraphrased.** The introductory classification announces eleven classes under Picard constancy and the restriction on rational semistable or supersingular fibers; both the omitted candidates and the unchecked converse affect that count.

**Correction.** Replace the eleven candidates by the fourteen recorded here. Earlier independent paper review reports an exhaustive search supporting their constant-Picard property and completeness. This revision retains those statements as targets, conditional on the explicit resolved-model and exhaustive-search certificates; the reported search is not itself an implemented proof in this packet.

**Reason.** Theorems 10.4 and 10.5 say that under assumptions (i)–(ii) of §10 the fibration a unique listed presentation the listed equations, and their proofs derive only necessary conditions. The converse would need Theorem 9.4, whose hypotheses include descent of every geometric Mordell–Weil section, and that is never checked. The TeX never cites Theorem 9.4 (its Picard-criterion reference). The main theorem uses only the necessary direction, which /115 and /117 state correctly. Moreover the list itself is incomplete (Theorem 10.4 issue), so the count 'eleven' is wrong, not only unproved.

**Effect:** a stated result. **Provenance:** Collated from PAPER-SCHROER-23/E29 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

### ES34 — Theorem 10.4, p. 29, and its proof, p. 31 (twisted semistable case); the count in the introduction to Section 10, p. 28 (arXiv v3 = author version of 19 July 2022)

**Reported assertion, paraphrased.** The nonzero-j enumeration lists eight equations. Its rejection argument bounds the number of components of a twisted multiplicative fiber by two and consequently excludes twisted configurations that actually occur.

**Correction.** The twisted case also gives I₂*+E₄+Ĩ₂, I₃*+E₄+Ĩ₁ and IV*+E₄+Ĩ₂. Theorem 10.4 has eleven models, not eight, and §10 has fourteen equations in all. The additional models, with fibres over t=0, 1, ∞, are: y²+txy+t³y=x³+x² [I₂*+E₄+Ĩ₂, Δ=t¹⁰, j=t²]; y²+txy+t³y=x³+tx² [I₃*+E₄+Ĩ₁, Δ=t¹¹, j=t]; y²+txy+t²y=x³+t²x² [IV*+E₄+Ĩ₂, Δ=t⁸(t²+t+1), j=t⁴/(t²+t+1), plus I₁ over t²+t+1=0]. Theorem 10.5 is correct. Proposition 11.1 (p. 33) and the key-reduction proposition of §11 take their elliptic column from Theorem 10.4. The proof of Theorem 15.1 reduces every fibration to I₁*+I₄ or I₂*+III+III. All of these must treat the three configurations; I₃* is never mentioned in §§11–15. On an Enriques surface Y, the multiple fibres would lie over the unstable and the E₄ points, because Ĩ₁ and Ĩ₂ are semistable. Until then the proof of the main theorem has a gap at this point. Whether the configurations occur on a non-exceptional Enriques surface over F₂ with constant Picard scheme is not settled here.

**Reason.** Checked by hand for y²+txy+t³y=x³+x². Δ=t¹⁰. At t=0 (Tate's algorithm): the reduction y²=x³+x² is singular at (0,0), and b₂=t², so the fibre is additive; v(a₆)=∞, v(b₈)=6, v(b₆)=6. The change y↦y+x gives a₂=t, a₄=t³ and P(T)=T³+T²=T²(T+1). Then a_{3,2}=a_{6,4}=0, and a_{2,1}X²+a_{4,3}X+a_{6,5}=X²+X has distinct rational roots. So I₂* with c=4, all seven components defined over F₂, 15 points. At ∞: y²+xy+y=x³+s²x², Δ′=s², node at (1,1) with tangent polynomial T²+T+1, so non-split I₂, 6 points. At t=1: y²+xy+y=x³+x² is smooth ordinary with 4 points (E₄). Total 25, so the trace of Frobenius on NS(J̄) is 10 and Pic_{J/F₂} is constant. Condition (ii) holds: only Ĩ₂ is semistable, and E₄ is ordinary. The other two models are checked the same way: I₃* at t=0 after three steps of the I_n* loop, and IV* at t=0 (Y²+Y distinct roots, c=3). Independent checks (scripts S/tate2.py, brute.py, classify.py, lcheck.py): (1) all 2²¹ equations were enumerated through their 2¹⁸ representatives with a₂=0 (every equation becomes one via x↦x+a₂), with Tate's algorithm at every place; this gives exactly 14 isomorphism classes, taken modulo the 512 coordinate changes of degree ≤(2,1,3) and PGL₂(F₂), that satisfy (i) and (ii); these are the 11 printed and the 3 above, one class per configuration; (2) for every class, the L-function of the generic fibre was computed from naive point counts at all places of degree ≤8; it equals (1−2T)^r with r=8−Σ(m_v−1), which confirms the component counts and the Galois-trivial Mordell–Weil action independently of Tate's algorithm; (3) for all 2¹⁸ normalised equations, Ogg's formula (v(Δ)≥e, δ=0 for I_n, IV, IV*) and Σ deg(v)·v(Δ)=12 hold. The proof's other claims were also reproduced: II*+E₂+E₄, I₃*+E₄+E₄ and IV*+E₄+I₃ are excluded, d₁=1 and 1+t are equivalent in the I₄* case, the second I₁* solution is twisted, and α=1 gives E₂. The error is the unexamined twisted case ('the argument is similar'): the tuples (r_a,i,r_c)=(7,2,2) and (8,2,1) yield these configurations.

**Effect:** a stated result. **Provenance:** Collated from PAPER-SCHROER-23/E34 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

### ES36 — proof of Proposition 9.5, p. 26 (arXiv v3 = author version of 19 July 2022)

**Reported assertion, paraphrased.** The component-descent proof uses tree and leaf arguments for IV as well as IV*, although the IV intersection graph is a triangle.

**Correction.** For IV the dual graph (§2: an edge for each pair of meeting components) is a triangle, not a tree, and has no terminal vertices. Argue directly: Θ₀ is fixed, and a section defined over F₂ through a second component fixes it. The third component is then fixed as well.

**Reason.** The three components of IV pass through one point, so they meet pairwise. The lattice argument (A₂ is not unimodular) still gives such a section, so the conclusion stands.

**Effect:** nothing. **Provenance:** Collated from PAPER-SCHROER-23/E36 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

### ES37 — proof of Proposition 9.5, p. 26 (arXiv v3 = author version of 19 July 2022)

**Reported assertion, paraphrased.** The exceptional affine graph argument treats the three terminal vertices in III* and II* as if only one remained after the marked vertex.

**Correction.** For III* (Ẽ₇) and II* (Ẽ₈) there are two further terminal vertices, of multiplicities 1 and 2, resp. 2 and 3. They are fixed because the Galois action preserves multiplicities, or equivalently because these graphs have no non-trivial automorphism fixing v₀. The count 'at most one further' is right for the multiplicity-one vertices only.

**Reason.** Ẽ₇ has three terminal vertices (multiplicities 1, 1, 2) and Ẽ₈ has three (1, 2, 3).

**Effect:** nothing. **Provenance:** Collated from PAPER-SCHROER-23/E37 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

### ES45 — Proof of Theorem 10.4, p. 30 (arXiv v3 = author version of 19 July 2022)

**Reported assertion, paraphrased.** An intermediate inequality in the rank-seven case repeats the wrong component-count symbol.

**Correction.** For r_a = 7 we get r_c ≥ 3.

**Reason.** The bound r_c≥10−r_a yields r_c≥3 when r_a=7; repeating r_a is the wrong variable.

**Effect:** nothing. **Provenance:** Collated from PAPER-SCHROER-23/E45 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

### ESY1 — Author preprint p3 equation(4), image inspected

**Reported assertion, paraphrased.** The invariant formula for c₄ assigns the positive sign to its 24b₄ term.

**Correction.** c₄=b₂²−24b₄

**Reason.** For a₄=1 and the other coefficients0 over Q, b₄=2; the correct c₄ is−48. The baseline c₄ definition uses the minus sign. The error disappears in characteristics2 and3 but not in the general recalled formula.

**Effect:** nothing. **Provenance:** No correction located; exact edition restriction retained.

### ESY2 — Author preprint p3 equation(4), image inspected

**Reported assertion, paraphrased.** The invariant formula for c₆ assigns the positive sign to its leading b₂³ term.

**Correction.** c₆=−b₂³+36b₂b₄−216b₆

**Reason.** For a₁=1 and the other coefficients0, the source formula gives1 but the standard polynomial invariant gives−1. Baseline c₆ was read and fixes the convention.

**Effect:** nothing. **Provenance:** No correction located; exact edition restriction retained.

### ECD1 — April19,2024 author edition p366, proof of4.1.6(1)

**Reported assertion, paraphrased.** The Hodge-line degree formula uses the opposite sign for the Euler-characteristic contribution.

**Correction.** deg L=−χ(O_X)−length(T)

**Reason.** Leray and curve Riemann–Roch give χ(O_X)=−deg L−length(T). For a rational Jacobian over P¹, deg L=−1; substituting the base Euler characteristic fails for other χ(O_X). The stated theorem uses the total-space term correctly.

**Effect:** the proof. **Provenance:** No correction located; exact edition restriction retained.

### ECD2 — April19,2024 author edition p394 Lemma4.4.1(2)

**Reported assertion, paraphrased.** The section-twist pushforward rank is asserted to equal n also when n is zero.

**Correction.** Use n>0; at n=0 the rank is1.

**Reason.** A fibration satisfies f_*O_X=O_B. This contradicts rank0 at n=0. The proof and the application require positive n only.

**Effect:** a stated result. **Provenance:** No correction located; exact edition restriction retained.

### ECD3 — April19,2024 author edition p365, proof of4.1.6

**Reported assertion, paraphrased.** The torsion-sheaf length is identified with the excess fiber h¹ without accounting for a possible higher torsion thickness.

**Correction.** The fiber excess measures the number of torsion generators dimκ(t)(T⊗κ(t)), not the module length in general. Use length(T) only in the global Euler-characteristic formula.

**Reason.** For a DVR module T=R/(π²), its length is2 while dimκ(T⊗κ)=1. Proper-curve top-degree base change gives fiber rank1 plus that fiber dimension; equality with length needs an additional annihilation hypothesis.

**Effect:** the proof. **Provenance:** No correction located; exact edition restriction retained.

### ECD4 — April19,2024 author edition p267 Proposition2.2.5, I₃,IV and I_n rows; images inspected

**Reported assertion, paraphrased.** The affine A diagram indices for I₃, IV and I_n are shifted from the indices determined by their numbers of components.

**Correction.** I₃ and IV use Ã₂; I_n uses Ã_(n−1).

**Reason.** There are3 or n vertices, whereas an affine Ã_r diagram has r+1 vertices. The book’s own comparison table onp268 gives the corrected n−1 convention.

**Effect:** nothing. **Provenance:** No correction located; exact edition restriction retained.

### ECD5 — April19,2024 author edition p267 Proposition2.2.5, star row; image inspected

**Reported assertion, paraphrased.** The I* diagram has an inconsistent symbol and an incorrectly indexed terminal edge in its intersection list.

**Correction.** Use I_n* with n+5 components. At the left end use R₀·R₄=R₁·R₄=1; the right ends are R₂,R₃.

**Reason.** The displayed support has n+5 vertices, so its Kodaira index is n. As printed R₀ is isolated and R₂ meets both ends for n>0; the corrected graph has the affine D_(n+4) shape and null-root multiplicities.

**Effect:** nothing. **Provenance:** No correction located; exact edition restriction retained.

### ECD6 — April19,2024 author edition p268 Proposition2.2.5, IV* row; image inspected

**Reported assertion, paraphrased.** The III* intersection list joins a component to the wrong branch vertex.

**Correction.** Remove R₁·R₂=1; all unlisted pairings remain0.

**Reason.** The extra edge creates a cycle in the seven-vertex graph and violates the displayed primitive null-root equation. Removing it leaves the three length2 arms of affine E₆.

**Effect:** nothing. **Provenance:** No correction located; exact edition restriction retained.

### ECD7 — April19,2024 author edition p268 Proposition2.2.5, II* row; image inspected

**Reported assertion, paraphrased.** The II* multiplicity vector assigns the wrong multiplicity to its first terminal component.

**Correction.** The coefficient of R₀ is3.

**Reason.** R₀ meets only R₃, of multiplicity6. With R₀²=−2, the printed vector gives D·R₀=−4+6=2; coefficient3 gives0 and the affine E₈ null root.

**Effect:** nothing. **Provenance:** No correction located; exact edition restriction retained.

### ECD8 — April19,2024 author edition p366 proof of4.1.6(2); image inspected

**Reported assertion, paraphrased.** The multiple-fiber notation confuses the primitive fiber with its reduction and states a coefficient inequality outside the canonical-formula range.

**Correction.** Use D_t=a_t Xbar_t and rule out a_t≥m_t.

**Reason.** The evaluation divisor was just written with coefficient a_t; its pushforward criterion rules out even equality, establishing the required strict inequality a_t<m_t.

**Effect:** the proof. **Provenance:** No correction located; exact edition restriction retained.

### ErtOQ9t0ET0 — Stacks tag0ET0, Lemma37.14.1 proof, displayed pushforward fiber product; accessed2026-10-03, SHA256 bbbfdcd78318dc3aef0acc1615cef57eb793f430e96986a119ab7808daf558d9

**Reported assertion, paraphrased.** The second sheaf fiber product in the descent proof has structure-sheaf domains inconsistent with its named maps.

**Correction.** Use m′_* O_S′ ×_(m_* O_S) n_* O_T in the formula for n′_* O_T′.

**Reason.** The proof defines m′:S′→X, m:S→X and n:T→X. The printed subscripts do not match those source domains.

**Effect:** the proof. **Provenance:** No correction identified in the bounded surveyed current public version; not an exhaustive erratum search.

### ErtOQ9t0C6L — Stacks tag0C6L, Lemma53.10.5 proof, commutative matrix-algebra dimension justification; accessed2026-10-03, SHA256 e182458b1ea9aa030de14ef59f11a74a88edac0295250efbebbaeedd055e1dc6

**Reported assertion, paraphrased.** The finite curve-lemma proof invokes a bound for arbitrary commutative matrix subalgebras that fails without further restrictions.

**Correction.** Supply an additional property of the actual curve-derived image or an independent argument for its dimension bound. Do not use the asserted general bound.

**Reason.** In End(k⁴), matrices [[λI₂,M],[0,λI₂]] with arbitrary2×2 M form a commutative unital5-dimensional subalgebra. Over F₂ all32 elements and1024 products were independently checked. This refutes the bare general bound, not the curve lemma itself.

**Effect:** the proof. **Provenance:** No correction identified in the bounded surveyed current public version; the specific curve conclusion is not disproved.

### E7e92bd0ECJ — Lemma37.67.2, final sentence of proof; accessed 2026-10-04T04:13:33.437591+00:00, SHA256 f463dad9e8b6d26c33a0648fe580b0353831006054091d44fb47009579b78c14

**Reported assertion, paraphrased.** The two preimage expressions in the displayed comparison use incompatible map domains.

**Correction.** j^{-1}(V′) = i^{-1}(U′)

**Reason.** V′ lies in Y, whereas the codomain of i is X. The construction defines U′=D(f) and V′=D(g) with matching inverse images.

**Effect:** the proof. **Provenance:** Still present on the current source; six section comments include a different corrected statement omission, not this final proof typo. No separate correction identified in the bounded current-page and web search; no exhaustive erratum audit.

### E7e92bd0E25 — Proposition37.67.3 proof, affine reduction paragraph; accessed 2026-10-04T04:13:31.768111+00:00, SHA256 b52f9b9dcecad662b267fd703d489c46e43678d9a777caff570fb31537834ee2

**Reported assertion, paraphrased.** One fiber-product expression places the map domains over the wrong base.

**Correction.** Y \amalg _ Z X

**Reason.** The paragraph proves that the ringed-space pushout is a scheme. The given span has maps Z→Y and Z→X, so the displayed product over Z is not the object being constructed.

**Effect:** the proof. **Provenance:** Still present. Comment10118 and its2025 fix concern a separate swapped-base notation in the following paragraph, not this product symbol. No separate correction identified in the bounded current-page and web search; no exhaustive erratum audit.

### E7e92bd0ECH7 — Lemma37.67.7 proof, base of the comparison morphism and final flatness sentence; accessed 2026-10-04T04:13:33.437591+00:00, SHA256 f463dad9e8b6d26c33a0648fe580b0353831006054091d44fb47009579b78c14

**Reported assertion, paraphrased.** The separatedness discussion uses a coproduct and a fiber product with inconsistent indexing of the common base.

**Correction.** Use Y \amalg _ Z X in both places.

**Reason.** W is a scheme over the pushout of the original span Y←Z→X. The comparison and flatness condition use that same base.

**Effect:** the proof. **Provenance:** Both still present in the current section; no corresponding correction appears among its six comments. No separate correction identified in the bounded current-page and web search; no exhaustive erratum audit.

### ErtOQ9t00DF1 — Historical proof-reference fragment in the complete public correction patch aee70b2c90b64dc043aa7740e0d9c9346aa4323f; current Lemma10.12.10 page comments10136/10607. Patch SHA256 464eb5213ac6a5ed1937db69a06c4dc109f85c6dea0dfe80884ab3342f441d86. Only this patch and the complete current displayed lemma/comments were read, not the whole historical source version.

**Reported assertion, paraphrased.** The older tensor-exactness proof invokes the pullback property in a step that requires a separate exactness argument; the recorded correction replaces that step.

**Correction.** Use the exactness characterization by Hom into every R-module P, citing Lemma10.10.1(1) for both uses; quantify over P explicitly.

**Reason.** The actual current proof transfers the Hom exact sequence through tensor-Hom adjunction and tests it for every P. The authors correction patch explicitly replaces the old proof reference and adds that quantifier.

**Effect:** the proof. **Provenance:** Corrected24July2025 by Stacks authors commit aee70b2c90b64dc043aa7740e0d9c9346aa4323f, acknowledged in current page comment10607; no new error in the current statement is alleged.

### Source catalogue

- **schroer**: [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3). Stefan Schröer. arXiv:2004.07025v3, 9 August 2022; separate from Annals197(2023). Access/provenance and SHA-256 are recorded in the packet.

- **ferrand**: [Conducteur, descente et pincement](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf). Daniel Ferrand. Bulletin de la SMF 131(4) (2003), 553–585. Access/provenance and SHA-256 are recorded in the packet.

- **witaszek**: [Keel’s base point free theorem and quotients in mixed characteristic](https://par.nsf.gov/servlets/purl/10429755). Jakub Witaszek. Annals of Mathematics 195 (2022), 655–705. Access/provenance and SHA-256 are recorded in the packet.

- **llr**: [Néron models, Lie algebras, and reduction of curves of genus one](https://www.math.u-bordeaux.fr/~qliu/articles/LLR.pdf). Qing Liu, Dino Lorenzini, Michel Raynaud. Inventiones Mathematicae 157 (2004), 455–518, author copy. Access/provenance and SHA-256 are recorded in the packet.

- **llr-corrigendum**: [Corrigendum to Néron models, Lie algebras, and reduction of curves of genus one](https://www.math.u-bordeaux.fr/~qliu/articles/CorrigendumToNeronModelsLieAlg.pdf). Qing Liu, Dino Lorenzini, Michel Raynaud. Inventiones Mathematicae 214 (2018), 593–604. Access/provenance and SHA-256 are recorded in the packet.

- **szydlo**: [Elliptic fibers over non-perfect residue fields](http://szydlo.com/imperfect92803.pdf). Michael Szydło. Author preprint September 28, 2003; published JNT 104 (2004), 75–99. Access/provenance and SHA-256 are recorded in the packet.

- **bm**: [Enriques’ classification of surfaces in char. p, II](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf). Enrico Bombieri and David Mumford. Complex Analysis and Algebraic Geometry (1977), 23–42; author scan. Access/provenance and SHA-256 are recorded in the packet.

- **lang56**: [Algebraic groups over finite fields](https://wstein.org/papers/bib/Lang-Algebraic_Groups_Over_Finite_Fields.pdf). Serge Lang. American Journal of Mathematics 78 (1956), 555–563; scan. Access/provenance and SHA-256 are recorded in the packet.

- **cdl**: [Enriques Surfaces I](https://sites.lsa.umich.edu/idolga/wp-content/uploads/sites/1334/2024/08/EnriquesOne.pdf). François Cossec, Igor Dolgachev, Christian Liedtke. Author manuscript dated April 19, 2024; not the 1989 edition. Access/provenance and SHA-256 are recorded in the packet.

- **temkin-tyomkin**: [Ferrand pushouts for algebraic spaces](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf). Michael Temkin and Ilya Tyomkin. Author PDF, arXiv:1305.6014v3, 27 May 2016; distinguished from the Eur. J. Math. 2 (2016) journal pagination. Access/provenance and SHA-256 are recorded in the packet.

- **stacks-04D1**: [Lemma10.143.10: lifting étale ring maps along quotients](https://stacks.math.columbia.edu/tag/04D1). The Stacks Project Authors. Public HTML retrieved 2 October 2026; tag-stable identity, displayed numbering on that date. Access/provenance and SHA-256 are recorded in the packet.

- **stacks-082J**: [Lemma76.34.2: quasi-finite separated algebraic-space comparison](https://stacks.math.columbia.edu/tag/082J). The Stacks Project Authors. Public HTML retrieved 2 October 2026; tag-stable identity, displayed numbering on that date. Access/provenance and SHA-256 are recorded in the packet.

- **stacks-04S6**: [Theorem80.10.1: algebraic-space quotients of flat equivalence relations](https://stacks.math.columbia.edu/tag/04S6). The Stacks Project Authors. Public HTML retrieved 2 October 2026; tag-stable identity, displayed numbering on that date. Access/provenance and SHA-256 are recorded in the packet.

- **stacks-02X4**: [Lemma65.13.1: automatic diagonal properties](https://stacks.math.columbia.edu/tag/02X4). The Stacks Project Authors. Public HTML retrieved 2 October 2026; tag-stable identity, displayed numbering on that date. Access/provenance and SHA-256 are recorded in the packet.

- **stacks-05Z2**: [Lemma67.9.8: separatedness under universally closed surjections](https://stacks.math.columbia.edu/tag/05Z2). The Stacks Project Authors. Public HTML retrieved 2 October 2026; tag-stable identity, displayed numbering on that date. Access/provenance and SHA-256 are recorded in the packet.

- **stacks-0417**: [Section67.50: separated locally quasi-finite representability](https://stacks.math.columbia.edu/tag/0417). The Stacks Project Authors. Public HTML retrieved 2 October 2026; tag-stable identity, displayed numbering on that date. Access/provenance and SHA-256 are recorded in the packet.

- **stacks-07T8**: [Finite-module annihilators and flat base change](https://stacks.math.columbia.edu/tag/07T8). The Stacks Project Authors. Public HTML retrieved 2 October2026; tag-stable identity. Access/provenance and SHA-256 are recorded in the packet.

- **stacks-0BBY**: [Finite intersections after flat scalar extension](https://stacks.math.columbia.edu/tag/0BBY). The Stacks Project Authors. Public HTML retrieved 2 October2026; tag-stable identity. Access/provenance and SHA-256 are recorded in the packet.

- **stacks-0E25**: [Geometric and categorical Scheme pinching](https://stacks.math.columbia.edu/tag/0E25). The Stacks Project Authors. Public HTML retrieved 2 October2026; tag-stable identity. Access/provenance and SHA-256 are recorded in the packet.

- **stacks-0ECH**: [Scheme pinching: separatedness and finite type](https://stacks.math.columbia.edu/tag/0ECH). The Stacks Project Authors. Public tag-stable HTML retrieved2 October2026. Access/provenance and SHA-256 are recorded in the packet.

- **stacks-00IT**: [Finite type of a ring fibre product](https://stacks.math.columbia.edu/tag/00IT). The Stacks Project Authors. Public tag-stable HTML retrieved2 October2026. Access/provenance and SHA-256 are recorded in the packet.

- **stacks-09MQ**: [Separatedness under a universally closed surjection](https://stacks.math.columbia.edu/tag/09MQ). The Stacks Project Authors. Public tag-stable HTML retrieved2 October2026. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-J6LwjP-presentation**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv2004.07025v3,9August2022; HTML accessed2026-10-02,distinct from Annals197(2023). Access/provenance and SHA-256 are recorded in the packet.

- **schroer-J6LwjP-parametrization**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv2004.07025v3, 9 August 2022; HTML read 2 October 2026. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-a71f92-root-branches**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv2004.07025v3; parsed HTML read2026-10-02, distinct from the Annals publication.. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-J6LwjP-extension-parity**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv2004.07025v3; scoped HTML reading 2 October 2026, distinct from the published Annals version.. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-rtOQ9t-normalization**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv2004.07025v3, distinct from the published Annals version. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-a71f92-cokernel**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv2004.07025v3, distinct from the published Annals version. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-5ebb6f-infinity-chart**: [There is no Enriques surface over the integers](https://arxiv.org/pdf/2004.07025v3). Stefan Schröer. arXiv2004.07025v3; Third revised version, July19 2022; PDF arXiv stamp August9 2022. Distinct from the published Annals version.. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-7e92bd-overlap**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv2004.07025v3 HTML; distinct from the published Annals version.. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-J6LwjP-scheme-gluing**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv2004.07025v3 HTML; separate from the Annals197(2023) version of record. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-7e92bd-normal-birational**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv:2004.07025v3 HTML; distinct from the Annals197(2023) version of record. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-rtOQ9t-polynomial-basis**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv:2004.07025v3 HTML; separate from the Annals197(2023) edition. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-a71f92-polynomial-universal-map**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv:2004.07025v3 HTML; distinct from the Annals197(2023) edition. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-5ebb6f-relative-normalization**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv:2004.07025v3 HTML; separate from Annals197(2023). Access/provenance and SHA-256 are recorded in the packet.

- **schroer-J6LwjP-function-field**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv:2004.07025v3 HTML; distinct from Annals197(2023). Access/provenance and SHA-256 are recorded in the packet.

- **schroer-affine-absolute-closure-7e92bd**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv:2004.07025v3, 9 August 2022; fresh section3 reading 3 October 2026. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-native-section-bridge-rtOQ9t**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv:2004.07025v3; official HTML inspected 2026-10-03. Access/provenance and SHA-256 are recorded in the packet.

- **schroer-absolute-normalization-5ebb6f**: [There is no Enriques surface over the integers](https://arxiv.org/html/2004.07025v3). Stefan Schröer. arXiv:2004.07025v3; official HTML inspected 2026-10-03. Access/provenance and SHA-256 are recorded in the packet.

- **ferrand-affine-native-20261003**: [Conducteur, descente et pincement — bounded native affine continuation](https://www.numdam.org/item/BSMF_2003__131_4_553_0.pdf). Daniel Ferrand. Published Bulletin SMF131(4),2003,553–585. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-generators-20261003**: [Finite-generator conductor specialization](https://stacks.math.columbia.edu/tag/07T8). The Stacks Project Authors; conductor-specific derivation by Codex. Lemma10.40.4 displayed statement and proof, fresh read 3 October2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-localization-20261003**: [Conductor-specific localization comparison — finite-module context](https://stacks.math.columbia.edu/tag/07T8). The Stacks Project Authors; conductor context Daniel Ferrand. Stacks tag07T8 and Ferrand BSMF131(4),2003, printed p554. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-sheaf-native-20261003-7e92bd**: [Actual affine conductors and native conductor ideal-sheaf data](https://stacks.math.columbia.edu/tag/0C6L). The Stacks Project authors; explicit adapter deductions by Codex — codex-7e92bd. Online passages read3October2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-map-native-20261003-rtOQ9t**: [Actual conductor subscheme map and canonical quotient-section comparison](https://stacks.math.columbia.edu/tag/0C6L). The Stacks Project authors; explicit adapter deductions by Codex — codex-rtOQ9t. Online passages read3October2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-source-ideal-20261003-7e92bd**: [Full conductor source ideals and native quotient chart maps](https://stacks.math.columbia.edu/tag/0C6L). The Stacks Project authors; adapter deductions by Codex — codex-7e92bd. Online passages read3October2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-section-context-rtOQ9t-0ET0**: [Conductor section-ring context, Stacks 0ET0](https://stacks.math.columbia.edu/tag/0ET0). The Stacks Project authors; deductions by Codex — codex-rtOQ9t. Online version read3October2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-section-context-rtOQ9t-0C6L**: [Conductor section-ring context, Stacks 0C6L](https://stacks.math.columbia.edu/tag/0C6L). The Stacks Project authors; deductions by Codex — codex-rtOQ9t. Online version read3October2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-sheaf-context-7e92bd-0ET0**: [Conductor structure-sheaf context, Stacks37.14.1](https://stacks.math.columbia.edu/tag/0ET0). The Stacks Project authors; finite-conductor deduction by Codex — codex-7e92bd. Online version read4October2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-additive-rtOQ9t-0ET0**: [Conductor additive sheaf sequence, context in Stacks37.14.1](https://stacks.math.columbia.edu/tag/0ET0). The Stacks Project authors; additive finite-conductor deduction by Codex — codex-rtOQ9t. Online version read4October2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-topology-7e92bd-0ET0**: [Conductor topology context: Stacks 0ET0](https://stacks.math.columbia.edu/tag/0ET0). The Stacks Project authors. Current displayed page, 4 October 2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-topology-7e92bd-0E25**: [Conductor topology context: Stacks 0E25](https://stacks.math.columbia.edu/tag/0E25). The Stacks Project authors. Current displayed page, 4 October 2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-topology-7e92bd-0ECI**: [Conductor topology context: Stacks 0ECI](https://stacks.math.columbia.edu/tag/0ECI). The Stacks Project authors. Current displayed page, 4 October 2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-topology-7e92bd-0B7J**: [Conductor topology context: Stacks 0B7J](https://stacks.math.columbia.edu/tag/0B7J). The Stacks Project authors. Current displayed page, 4 October 2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-topology-7e92bd-08KH**: [Conductor topology context: Stacks 08KH](https://stacks.math.columbia.edu/tag/08KH). The Stacks Project authors. Current displayed page, 4 October 2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-topology-7e92bd-0ECH**: [Conductor topology context: Stacks 0ECH](https://stacks.math.columbia.edu/tag/0ECH). The Stacks Project authors. Current displayed page, 4 October 2026. Access/provenance and SHA-256 are recorded in the packet.

- **global-conductor-topology-rtOQ9t-0ET0**: [Global conductor topology context: Stacks37.14.1](https://stacks.math.columbia.edu/tag/0ET0). The Stacks Project authors. Current displayed page, 4 October 2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-scheme-descent-7e92bd-0ET0**: [Affine pushout universal property and locality](https://stacks.math.columbia.edu/tag/0ET0). The Stacks Project authors. Current displayed page, 4 October 2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-scheme-descent-7e92bd-0E25**: [Global pushouts along closed immersions and integral maps](https://stacks.math.columbia.edu/tag/0E25). The Stacks Project authors. Current displayed page, 4 October 2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-cokernel-rtOQ9t-00DF**: [Tensor right exactness](https://stacks.math.columbia.edu/tag/00DF). The Stacks Project authors. Current primary displayed page; read4October2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-cokernel-rtOQ9t-07T8**: [Finite flat annihilator supplier context](https://stacks.math.columbia.edu/tag/07T8). The Stacks Project authors. Current primary displayed page; read4October2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-right-rtOQ9t-07T8**: [Flat base change of finite-module annihilators](https://stacks.math.columbia.edu/tag/07T8). The Stacks Project authors. Current primary displayed lemma; read4October2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-scheme-flat-7e92bd-07T8**: [Finite flat annihilators](https://stacks.math.columbia.edu/tag/07T8). The Stacks Project authors. Current primary displayed source; read4October2026. Access/provenance and SHA-256 are recorded in the packet.

- **conductor-scheme-flat-7e92bd-01JO**: [Fibre products of schemes and inverse-image ideals](https://stacks.math.columbia.edu/tag/01JO). The Stacks Project authors. Current primary displayed source; read4October2026. Access/provenance and SHA-256 are recorded in the packet.

- **ConductorSubschemeBaseChange-codex-rtOQ9t**: [Closed-subscheme fibre products and authored conductor comparisons](https://stacks.math.columbia.edu/tag/01JO). The Stacks Project authors; conductor specialization by Codex — codex-rtOQ9t. Current displayed Section26.17 only, accessed4October2026. Access/provenance and SHA-256 are recorded in the packet.

- **ConductorTargetTower-codex-7e92bd**: [Scheme fibre products and authored target conductor tower coherence](https://stacks.math.columbia.edu/tag/01JO). The Stacks Project authors; conductor specialization by Codex — codex-7e92bd. Current displayed Section26.17, accessed4October2026. Access/provenance and SHA-256 are recorded in the packet.

- **ConductorSourceTower-codex-rtOQ9t**: [Scheme fibre products and authored source conductor tower comparisons](https://stacks.math.columbia.edu/tag/01JO). The Stacks Project authors; conductor specialization by Codex — codex-rtOQ9t. Current displayed Section26.17, accessed4October2026. Access/provenance and SHA-256 are recorded in the packet.

- **ConductorNilpotentSections-codex-7e92bd**: [Conductor pushouts and authored actual nilpotent-section tests](https://stacks.math.columbia.edu/tag/0ET0). The Stacks Project authors; conductor deductions by Codex — codex-7e92bd. Current displayed Lemma37.14.1, accessed4October2026. Access/provenance and SHA-256 are recorded in the packet.

## Acceptance and dependency boundaries

The native comparison tests must establish the actual coordinate, coefficient and restriction equalities stated above. Inverse laws and preservation of zero and one supplement these tests. Every test statement requires a proof; elaborating its type alone does not verify its equality.

The binary coefficient classifier must account for all 32 tuples, all eight admissible changes and the sixteen smooth witness rows. Its five disjoint orbits have sizes 2,4,4,4,2 and point counts 1,2,3,4,5. For the fourteen surface candidates, coefficient calculations must establish the degree bounds, displayed discriminants, weighted reverse-chart identities and smooth equation counts at t=1. Acceptance additionally requires regular resolutions, all-place minimality, rationality, Picard constancy and completeness. Those geometric assertions do not follow from the coefficient calculations.

The owner types in the suggested file's omission ledger are required before its partial signatures represent the full geometric conditions. The source and supplier obligations above remain required: original EGA/Raynaud proof adapters, rational-surface and quasielliptic recursive inputs, the general Lang/Tsen interfaces and the William Lang (2000) configuration inputs or their independently certified replacement. The exhaustive classification certificate includes justified rejection witnesses and pairwise inequivalence of the accepted representatives.

[The handoff](../handoff/DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII~2.md) records validation and the exact owner-integration frontier. No mathematical implementation is claimed by this planning document.
