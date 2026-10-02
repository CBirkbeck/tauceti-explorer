# Néron models and semistable abelian varieties, Part II

Genus-one fibrations, Ferrand pinching and rational elliptic surfaces

This continuation supplies the genus-one and rational-Jacobian mathematics routed from Schröer’s paper. It begins with reusable finite pinching, passes through regular models and finite-field fiber descent, constructs global Weierstrass equations, and separates the fourteen explicit characteristic-two candidates from their exhaustiveness theorem. Its general definition of Ferrand pushouts is also needed by Witaszek’s conductor and line-bundle descent. The reserved owner is `NeronModelsAndSemistableAbelianVarietiesPartII:key/ferrand-pushouts`.

**Status: partial design.** The packet contains128 declaration targets in seven stages: nine definitions, one construction,92 lemmas,23 theorems and3 comparisons, with44 API contracts,40 planned unit tests and28 planets. All78 routed items and all21 inherited source findings are preserved. There are17 explicit gaps and20 supplier requests. The finite F₂ coefficient/classification subsection below has complete concrete witnesses and native suggested signatures. No full 2¹⁸/2²¹ polynomial-coefficient surface search or all-place resolution certificate is supplied. No stage or formal implementation is claimed closed.

## Conventions and boundaries

The base of a global fibration is a smooth proper geometrically integral curve B over k; its function field is K=k(B). A genus-one generic curve is regular, geometrically integral and proper, with H⁰=K and dim_K H¹=1. Smoothness over K is an additional condition: K need not be perfect even when k is finite. “Elliptic” means the generic fiber is smooth; “quasielliptic” means it is regular but not smooth. A cusp in the latter case is not an ordinary supersingular elliptic curve. Relative minimality excludes vertical exceptional curves of the first kind. A Jacobian fibration includes its zero-section O.

A schematic fiber D=ΣnᵢCᵢ has gcd multiplicity m, indecomposable divisor D_ind=Σ(nᵢ/m)Cᵢ and reduction D_red=ΣCᵢ. The indecomposable divisor and the reduction can differ even for m=1: the central component of I₀* has coefficient2. Intersection labels over a closed base point use lengths over κ(a); after geometric base change their comparison includes residue degrees. Statements about points over a field use the schematic fiber and its reduction interchangeably only because field-valued points kill nilpotents.

All Weierstrass equations use y²+a₁xy+a₃y=x³+a₂x²+a₄x+a₆, in coefficient order(1,2,3,4,6). On the inverse chart s=1/t, set x′=s²x and y′=s³y; the coefficients are aᵢ′(s)=sⁱaᵢ(1/s). This is polynomial reversal with the specified weight, rather than division of a polynomial in its original variable. The zero tuple is allowed in the bounded coefficient carrier and has Δ=0. Smoothness, local minimality, rationality and Picard constancy require additional proofs.

The first part R11.1–R11.6 owns Néron models, their special fibers and component groups, Raynaud extensions and the semistable comparison. This continuation imports those statements. StableReduction owns nodes, regular/minimal smooth-curve models, duality, arithmetic-surface intersections and numerical types. EllipticCurves owns equations, isogenies, finite-field elliptic theory, equation-side reduction symbols and Tate’s algorithm. The published Layer4→R11.2 link explicitly places the algorithm-to-Néron-special-fiber comparison at R11.2. Here the new work is its genus-one and global surface application, with a requested scheme-realization comparison. No second Kodaira-symbol enum, abstract root lattice, or general smooth minimal-model construction is planned.

SchemeAndStackFoundations owns schemes, algebraic spaces, coherent cohomology, intersections and cycle classes. AlgebraicModuli owns Picard groupoids, representability and effective descent. The general Raynaud criterion and Milnor patching remain there; this continuation owns only the conductor-specific and normal-model adapters. WeilConjectures owns the trace theorem. The existing abstract IntegralLattice API remains imported. The general Lang theorem and Tsen’s C₁/Brauer theorem need foundational ownership and source closure; genus-one applications do not claim ownership of their entire theories. Enriques existence, nonexistence, exceptional configurations and the final eleven-to-fourteen correction’s Enriques consequences remain with their own design jobs.

## Pinned library screen

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474821cf4256814db967cb154e7af3d0c369`. The original fourteen entries retain their inherited pinned-source receipts. This continuation reread the ring pullback, closed/finite morphism and section APIs and adds the actual IsPushout structure after reading its pinned source. It does not claim to have freshly reread the unrelated lattice and Weierstrass entries. The reviewed R11.1–R11.6 library audit was screened before planning. A near match is used only with the qualification stated in the table. The ring pullback already exists; the finite-pinch scheme comparison does not follow merely from its name. Mathlib also constructs pushouts along open immersions, which do not supply Ferrand’s finite closed-immersion theorem.

| Reference | Actual contribution |
| --- | --- |
| mathlib:CategoryTheory.IsPushout | Commutativity and the colimit universal property for a specified square. The affine prototype uses it in Scheme, not an invented algebraic-space carrier. |
| mathlib:CommRingCat.pullbackCone | The existing commutative-ring pullback, the equalizer subring of a product; no new fiber-product carrier. |
| mathlib:CommRingCat.pullbackConeIsLimit | The universal property of that same constructed ring pullback. |
| mathlib:AlgebraicGeometry.IsClosedImmersion | Closed embedding plus surjective maps of stalks, not merely a closed underlying subset. |
| mathlib:AlgebraicGeometry.IsFinite | Affine morphisms with finite induced ring homomorphisms on affine opens. |
| mathlib:AlgebraicGeometry.Scheme.Hom.appLE | Restriction of the structure-sheaf map to a chosen open lying in the inverse image. |
| mathlib:conductor | Near-match used only for comparison: conductor of R[x] inside an R-algebra S. It does not provide arbitrary subring conductors. |
| tauceti:WeierstrassCurve.pointCount | Nat.card of affine equation solutions plus the point at infinity; singular points are included and ellipticity is not assumed. |
| tauceti:TauCeti.Model | DVR model data: flat finite-presentation total space and specified generic-fiber isomorphism. Regularity/minimality are not fields of this carrier. |
| mathlib:WeierstrassCurve.j_eq_zero_iff_of_char_two | For an elliptic characteristic-two equation over a reduced ring, j=0 iff a₁=0. It does not classify bad fibers. |
| tauceti:TauCeti.IntegralLattice | Full integral submodule in a rational vector space with symmetric integral-valued form; geometric Picard realization remains new. |
| tauceti:TauCeti.IntegralLattice.IsUnimodular | Equality of the lattice carrier and dual carrier. |
| tauceti:TauCeti.IntegralLattice.IsEven | Every lattice vector has even integral norm; not a condition on a chosen generating list alone. |
| tauceti:TauCeti.IntegralLattice.checkerboardLattice_form_checkerboardVector_self | The type-D vector representative has rational squared norm1. Reversing the geometric root form gives−1; no isometry of a restriction map is asserted. |
| tauceti:TauCeti.IntegralLattice.discriminant_typeE₆RootLattice | The existing E₆ root lattice has discriminant3; the geometry must identify its root basis separately. |

TauCeti also has the actual scheme Weil-divisor carrier: finite integer sums of codimension-one points. Its file called Scheme/Regular proves no-poles regularity in dimension at most one; it is not a general class asserting that a surface is regular. Those source statements were read during the signature audit. The suggested divisor-data prototype reuses the former carrier and makes no claim that the surface intersection predicate has already been constructed.

## Layer overview

| Stage | Purpose | Planet names |
| --- | --- | --- |
| G.0 | Ferrand pinching and conductor squares | Ferrand pushouts, General conductor, Affine pinching, Global pinching, Conductor squares, Algebraic-space pinching |
| G.1 | Genus-one fibers and finite-field forms | Genus-one fibrations, Fiber multiplicity, Geometric Kodaira fibers, Kodaira classification, Five elliptic curves over F₂ |
| G.2 | Multiple fibers over excellent discrete valuation rings | Transverse divisor, Multiple-fiber isogeny, Torsor fiber comparison |
| G.3 | Rational Jacobians and global Weierstrass equations | Canonical bundle formula, Rational Jacobian invariants, Even complement, Bounded Weierstrass equations, Weierstrass contraction, Quasielliptic fibrations |
| G.4 | Picard constancy and fiber configurations | Picard point-count criterion, Additive graph rigidity, Picard constancy, Large fiber |
| G.5 | Fourteen explicit models over F₂ | Fourteen candidate models |
| G.6 | Completeness and classification certificates | Fourteen-model completeness, Nonzero-j classification, Zero-j classification |

## G.0 — Ferrand pinching and conductor squares

The datum is Z→Y closed and Z→Z′ finite. A geometric square includes the quotient topology and the equality of structure sheaves, expressed as a section-ring pullback on every open. Categorical universality is subsequently proved for the finite pinching or Witaszek hypotheses; it is not substituted for this definition. In Witaszek2.17, the relevant maps are universal homeomorphisms and the immersion is qcqs. Nonsplit nodal pinching is finite but not radicial, so that restriction cannot be silently imposed on the general owner.

For affine rings B→C surjective and A′→C finite, use the existing A=B×_C A′. Its projection to A′ is surjective and the common ideal I identifies the two closed loci. Localization at t∈I identifies A[1/t] with B[1/t]. These identities give the structure sheaf and complement. Global scheme existence requires each finite fiber over Z′ to lie in an affine neighborhood of Y. Ferrand’s (AF) condition is stronger than necessary. Temkin–Tyomkin’s finite-pinching theorem supplies algebraic-space existence without that neighborhood assumption; the twelve declaration-sized consumer steps below replace the earlier source uncertainty. Its exact foundational exports and space signatures remain open. General conductors c(A,B) require neither finite generation nor birationality in their definition; reduced Noetherian finite-inclusion hypotheses enter only their geometric application.

**Stage imports:** `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `NeronModelsAndSemistableAbelianVarieties:R11.2`, `SchemeAndStackFoundations:SF.3`.

### key/ferrand-pushouts — Ferrand geometric pushouts

**Definition contract.** For a commutative square Z→Y, Z→Z′, Y→P, Z′→P, a geometric pushout means the underlying space of P is the quotient pushout of |Y|←|Z|→|Z′| and the canonical sheaf map O_P→a_*O_Y ×_(ai)_*O_Z b_*O_Z′ is an isomorphism. A Ferrand datum requires i:Z→Y to be a closed immersion and g:Z→Z′ finite; a Ferrand pushout is its geometric pushout in schemes, or in algebraic spaces when the relevant existence theorem supplies that category. No scheme existence is built into the datum. Define the general geometric-square predicate first, then this finite-pinching specialization. For algebraic spaces the structure-sheaf equality is on the small étale site; the every-Zariski-open section formulation is its scheme specialization. Finite algebraic-space existence is supplied by G.0/algebraic-space-existence without the scheme affine-neighborhood assumption.

**Hypotheses:** Schemes over a common base, or algebraic spaces over a common scheme base via the SF.1 carrier.

**Construction/proof outline:**

1. Use actual scheme morphisms and their maps on spaces and sections.
2. For every open U⊂P impose the pullback of the three section rings on a⁻¹U, b⁻¹U and (ai)⁻¹U; these natural conditions express the sheaf equality. In the algebraic-space extension use the small étale site and test the sheaf comparison on affine étale charts; Zariski sections alone are insufficient.
3. Restrict to closed i and finite g for Ferrand data; restrict instead to qcqs i and universal-homeomorphism g,a for Witaszek 2.17.

**Prerequisites:** `mathlib:AlgebraicGeometry.IsClosedImmersion`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.Scheme.Hom.appLE`, `SchemeAndStackFoundations:SF.1`.

| Consumer | Required use |
| --- | --- |
| Schröer §3; items170–171 | Construct nonsplit nodal fibers. |
| Witaszek 2.27–2.28 | Recognize conductor squares and glue line bundles. |
| StableReduction Layer3 clutching | Compare with the existing smooth-section pushout without rebuilding it. |

| Proposed API name | Role | Exact contract |
| --- | --- | --- |
| GeometricPushout.of_affine | constructor | For B→C surjective and A′→C finite, Spec(B×_C A′) gives the finite-pinching geometric square. |
| GeometricPushout.lift | universal-property | For a Ferrand square, or a Witaszek2.17 geometric square with its full hypotheses, compatible Y→T and Z′→T induce a unique P→T. |
| GeometricPushout.flat_baseChange | functoriality | For a Ferrand square, or a Witaszek2.17 geometric square with qcqs hypotheses, every flat T→P induces a geometric square on all four base changes. |
| GeometricPushout.witaszek_iff | compatibility | With qcqs i and universal-homeomorphism g,a, the general predicate is equivalent to Witaszek Definition2.17. |
| FerrandPushout.complementIso | equivalence | In a Ferrand pushout a identifies Y∖Z with P∖Z′. |
| FerrandPushout.conductor | characterisation | The conductor square of a finite inclusion of reduced Noetherian rings is this geometric square; no birational hypothesis is necessary. |
| FerrandPushout.exists_algebraicSpace | constructor | For algebraic spaces Y,Z,Z′ over a scheme S, a closed immersion i:Z→Y and a finite morphism g:Z→Z′ have a categorical pushout P=Y⊔Z Z′ in algebraic S-spaces, with affine canonical maps Y→P and Z′→P. No Noetherian, quasi-separated, reduced, radicial or scheme affine-neighborhood hypothesis is imposed. |
| FerrandPushout.isScheme_iff | characterisation | For a finite pinching datum whose three components Y,Z,Z′ are schemes, its algebraic-space pushout P is a scheme if and only if for every point z′∈Z′ the finite set i(g⁻¹(z′)) lies in an affine open of Y. Under this condition the canonical scheme pushout agrees with P, including universality against algebraic-space targets. |

| Unit test name | Kind | Statement that the definition must satisfy |
| --- | --- | --- |
| GeometricPushout.node | computation | For char k≠2, pinching t=±1 of A¹ gives k+(t²−1)k[t]=k[t²−1,t(t²−1)]={f:f(1)=f(−1)}. |
| GeometricPushout.cusp | computation | Pinching V(t²) to Spec k gives k+t²k[t]=k[t²,t³]. |
| GeometricPushout.identity | degenerate | If g is an isomorphism, the square has P≅Y with its actual structure sheaf. |
| GeometricPushout.topological_not_geometric | non-example | The subring k[t²,t⁵] misses t³, so the corresponding universal-homeomorphism square with V(t²)→Spec k is not the geometric pushout. |
| GeometricPushout.nonsplit_node | compatibility | Pinching a separable quadratic closed point on P¹ gives the nonsplit rational node; its normalization has two conjugate geometric branches. |
| FerrandPushout.affine_space_compat | compatibility | For surjective B→C and finite A′→C, the algebraic-space pushout is canonically Spec(B×_C A′), and the Hom comparison is bijective for every algebraic-space target. |
| FerrandPushout.no_affine_neighbourhood | non-example | If a k-scheme Y has two distinct closed k-points with no common affine open, pinching their disjoint union to Spec k produces an algebraic space which is not a scheme. |

**Acceptance:** For char k≠2, pinching t=±1 of A¹ gives k+(t²−1)k[t]=k[t²−1,t(t²−1)]={f:f(1)=f(−1)}. Pinching V(t²) to Spec k gives k+t²k[t]=k[t²,t³]. If g is an isomorphism, the square has P≅Y with its actual structure sheaf. The subring k[t²,t⁵] misses t³, so the corresponding universal-homeomorphism square with V(t²)→Spec k is not the geometric pushout. Pinching a separable quadratic closed point on P¹ gives the nonsplit rational node; its normalization has two conjugate geometric branches. For surjective B→C and finite A′→C, the algebraic-space pushout is canonically Spec(B×_C A′), and the Hom comparison is bijective for every algebraic-space target. If a k-scheme Y has two distinct closed k-points with no common affine open, pinching their disjoint union to Spec k produces an algebraic space which is not a scheme.

**Source:** [Daniel Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §§4.1,5.1,5.4,7.1, pp565,568,570,575–578. Literal anchor: “espace annelé somme amalgamée”. Use the sheaf fiber product and quotient topology; global scheme existence is a separate theorem with affine-neighbourhood hypotheses.

**Source:** [Jakub Witaszek](https://par.nsf.gov/servlets/purl/10429755), Definition 2.17, p669; Lemmas 2.23,2.25, pp672–673. Literal anchor: “a geometric pushout square if, in addition,”. The sheaf equality is essential; Witaszek additionally assumes representable universal homeomorphisms. This is a restriction, not a property of every node pinching.

### G.0/subring-conductor — Conductor of an arbitrary subring

**Definition contract.** For a commutative ring B and subring A⊂B define the B-ideal c(A,B)={b∈B:∀x∈B,bx∈A}. It lies in A and is the largest B-ideal contained in A. It needs no finite, reduced, Noetherian or birational hypotheses.

**Construction/proof outline:**

1. Use the set condition to verify the ideal operations; multiplication by1 shows containment.
2. Compare with the existing monogenic conductor by equality of the underlying subrings.

**Prerequisites:** `mathlib:conductor`.

| Consumer | Required use |
| --- | --- |
| Witaszek Definition2.27 | The map need not be birational. |
| Ferrand §1.1 | Produce the common quotient ideal. |

| Proposed API name | Role | Exact contract |
| --- | --- | --- |
| Subring.conductor_mem | characterisation | b lies in c(A,B) iff every bx lies in A. |
| Subring.conductor_le | projection | The underlying set of c(A,B) is contained in A. |
| Subring.conductor_greatest | universal-property | A B-ideal I is contained in c(A,B) iff its underlying set lies in A. |
| Subring.conductor_mono | functoriality | A⊂A′ implies c(A,B)⊂c(A′,B). |
| Subring.conductor_adjoin | compatibility | For A the underlying subring of R[x]⊂B this is Mathlib conductor R x. |

| Unit test name | Kind | Statement that the definition must satisfy |
| --- | --- | --- |
| Subring.conductor_top | degenerate | c(B,B)=B. |
| Subring.conductor_cusp | computation | The conductor of k[t²,t³]⊂k[t] is t²k[t]. |
| Subring.conductor_node | computation | For char k≠2 the conductor of k+(t²−1)k[t] is (t²−1)k[t]. |
| Subring.conductor_quadratic_field | non-example | For a proper field extension k⊂E, the conductor is zero even when E/k is finite separable. |

**Acceptance:** c(B,B)=B. The conductor of k[t²,t³]⊂k[t] is t²k[t]. For char k≠2 the conductor of k+(t²−1)k[t] is (t²−1)k[t]. For a proper field extension k⊂E, the conductor is zero even when E/k is finite separable.

**Source:** [Jakub Witaszek](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, p674. Literal anchor: “I = {s ∈ S | sS ⊆ R}”. Generalize the ring construction; finiteness and reducedness belong to its geometric application.

### G.0/pullback-projection — Surjective projection and common kernel

**Lemma contract.** For p:B→C surjective and q:A′→C, set A=B×_C A′ using the baseline pullback. The projection A→A′ is surjective and its kernel maps isomorphically onto ker p as an ideal of B.

**Construction/proof outline:**

1. Lift q(a′) along p to establish projection surjectivity.
2. A pair in the projection kernel is exactly (b,0) with p(b)=0; check the ideal action componentwise.

**Prerequisites:** `mathlib:CommRingCat.pullbackCone`, `mathlib:CommRingCat.pullbackConeIsLimit`.

**Acceptance:** If q is the identity of C, A≅B; if ker p=0 and p is surjective, A≅A′.

**Source:** [Daniel Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §§1.1–1.3, pp555–556. Literal anchor: “un carré cartésien”. Algebraic kernel identification underlying the affine square.

### G.0/cartesian-affine — Tensor quotient in an affine pinching

**Lemma contract.** For the preceding A, with I=ker(A→A′)=ker p⊂B, the natural map B⊗_A A′→C is an isomorphism.

**Construction/proof outline:**

1. Use A′≅A/I by the surjective-projection node.
2. Use the tensor quotient B⊗_A(A/I)≅B/IB, with IB=ker p.
3. Use B/ker p≅C.

**Prerequisites:** `G.0/pullback-projection`, `SchemeAndStackFoundations:SF.0`.

**Acceptance:** The fiber square is scheme-theoretic, including nonreduced C.

**Source:** [Daniel Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §1.3, p556. Literal anchor: “B ⊗A A”. The affine square is also cartesian; tensor-quotient input remains at SF.0.

### G.0/localization-complement — Localization away from the pinching locus

**Lemma contract.** For t∈I in the previous square, A[1/t]→B[1/t] is an isomorphism.

**Construction/proof outline:**

1. Since I is a common ideal, t·b∈I⊂A for every b∈B.
2. Represent b/tⁿ by (tb)/tⁿ⁺¹; injectivity follows from the inclusion into B after killing torsion.

**Prerequisites:** `G.0/pullback-projection`, `SchemeAndStackFoundations:SF.0`.

**Acceptance:** The union of these principal opens is the complement of the conductor subscheme.

**Source:** [Daniel Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §1.4, pp556–557. Literal anchor: “un isomorphisme”. Localization argument with the common ideal, not an arbitrary base-change assertion.

### G.0/finite-projection — Finiteness of the normalization-side map

**Lemma contract.** If q:A′→C is finite and p:B→C surjective, then the projection A=B×_C A′→B is finite.

**Construction/proof outline:**

1. Choose finitely many A′-module generators of C and lift them to B.
2. Reduce any b modulo I using these lifts and lift each A′ coefficient to A via the surjective-projection node.
3. The residual term lies in I⊂A, so 1 and the chosen lifts generate B over A.

**Prerequisites:** `G.0/pullback-projection`.

**Acceptance:** For a quadratic point pinching the normalization-side map is finite even though two geometric branches are identified.

**Source:** [Daniel Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Proposition5.6(3), pp572–573. Literal anchor: “f est fini”. Direct module-generation proof; no Noetherian assumption is needed.

### G.0/affine-existence — Affine Ferrand existence

**Theorem contract.** For p:B→C surjective and q:A′→C finite, Spec(B×_C A′) is the geometric and categorical pushout of Spec B←Spec C→Spec A′.

**Construction/proof outline:**

1. The pullback ring supplies compatible morphisms and the affine section identities.
2. Use the localization-complement node and the surjective projection to identify the quotient topology.
3. Given maps to an arbitrary scheme T, cover the image by affine opens and glue the ring lifts, rather than claiming Spec sends every ring limit to a scheme colimit.

**Prerequisites:** `key/ferrand-pushouts`, `mathlib:CommRingCat.pullbackConeIsLimit`, `G.0/localization-complement`, `G.0/pullback-projection`, `SchemeAndStackFoundations:SF.1`.

**Acceptance:** The cusp uses C=k[t]/t²; a reduced-only definition must fail this test.

**Source:** [Daniel Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem5.1 and proof, pp568–569. Literal anchor: “un schéma affine”. Categorical property is proved for arbitrary scheme targets, not only affine targets.

### G.0/compatible-affine-neighbourhoods — Compatible affine neighborhoods

**Lemma contract.** If g:Z→Z′ is finite and each set g⁻¹(z′) lies in an affine open of Y, then around every z′ there are affine U⊂Y and V⊂Z′ with U∩Z=g⁻¹V. These neighborhoods cover the pinching locus.

**Hypotheses:** i:Z→Y closed; g finite.

**Construction/proof outline:**

1. Shrink V using finite closedness of g to remove the image of Z∖U.
2. Use the finite fiber algebra and a principal-open separation argument to obtain a section invertible on the entire fiber.
3. Lift the section through the surjective restriction to Z∩U and refine U,V to matching principal opens.

**Prerequisites:** `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

**Acceptance:** (AF) on Y implies the condition; curves and quasi-projective Y satisfy it.

**Source:** [Daniel Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Theorem7.1B and proof, pp575–578. Literal anchor: “g −1 (y) est contenu dans un”. Use the exact finite-fiber affine-neighbourhood condition, with finite-algebra separation as an explicit foundation request.

### G.0/global-existence — Global Ferrand existence

**Theorem contract.** For a closed immersion i:Z→Y and finite g:Z→Z′ whose fibers admit affine neighborhoods in Y, the geometric pushout exists as a scheme; Y→P is finite, Z′→P closed, the square cartesian, and Y∖Z≅P∖Z′.

**Construction/proof outline:**

1. Build affine pushouts on the compatible-neighborhood node.
2. Use localization-complement and uniqueness of affine lifts to identify intersections.
3. Glue the schemes and structure sheaves; cartesian, finite and closed properties are local on P.

**Prerequisites:** `G.0/compatible-affine-neighbourhoods`, `G.0/affine-existence`, `G.0/cartesian-affine`, `G.0/finite-projection`, `G.0/localization-complement`, `SchemeAndStackFoundations:SF.1`.

**Acceptance:** The (AF) version of Ferrand5.4 is a corollary, not an unconditional global scheme theorem.

**Source:** [Daniel Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §§4.1,5.1,5.4,7.1, pp565,568,570,575–578. Literal anchor: “espace annelé somme amalgamée”. Use the sheaf fiber product and quotient topology; global scheme existence is a separate theorem with affine-neighbourhood hypotheses.

### G.0/flat-base-change — Flat base change of geometric squares

**Lemma contract.** For a Ferrand scheme pushout P and any flat morphism T→P, its pullback square is a Ferrand geometric pushout. Affinely, tensoring the ring fiber-product exact sequence with a flat A-algebra F gives (B×_C A′)⊗_A F≅(B⊗_A F)×_(C⊗_A F)(A′⊗_A F).

**Hypotheses:** All four maps qcqs; finite pinching satisfies this.

**Construction/proof outline:**

1. Use flat exactness on 0→A→B⊕A′→C→0.
2. Apply flat base change to qcqs direct images and sheafify the ring identity.
3. Finite/closed morphisms and the quotient topology survive the base change; use the common ideal to identify the affine topologies.

**Prerequisites:** `G.0/global-existence`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.3`.

**Acceptance:** Nonflat tensoring may destroy the kernel; no unrestricted base-change API is exported.

**Source:** [Daniel Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), §4.4, p567. Literal anchor: “morphisme plat”. Includes the qcqs/universally-submersive hypotheses.

**Source:** [Jakub Witaszek](https://par.nsf.gov/servlets/purl/10429755), Lemma2.23, p672. Literal anchor: “a flat morphism”. Flatness preserves the exact sequence; arbitrary tensoring is not asserted.

### G.0/common-ideal-comparison — Canonical comparison for a common-ideal square

**Node:** NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-comparison.

For arbitrary commutative rings A,B, a unital ring map f:A→B and an ideal I of A, let J=map_f(I) and q:A/I→B/J be the native induced quotient map. Define the canonical ring homomorphism c_f,I:A→B×_(B/J)(A/I) by a↦(f(a),[a]). No image-ideal, injectivity, finite, reduced or Noetherian assumption is needed to define it.

**Construction/proof outline:**

1. Use the native quotient map q and its representative equation to check that the two coordinates agree in B/J.
2. Use the already constructed commutative-ring pullback and its universal property to form c_f,I; do not construct a second fiber-product carrier.

**Prerequisites:** mathlib:CommRingCat.pullbackCone, mathlib:CommRingCat.pullbackConeIsLimit, mathlib:Ideal.quotientMap, mathlib:Ideal.quotientMap_mk, mathlib:Ideal.le_comap_map.

**Uses:**

- NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-kernel: A named comparison with both coordinate equations permits computing the reconstruction kernel.
- NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-cartesian: A bijective comparison supplies the actual ring pullback square for conductor/pinching consumers.

**API:**

- **commonIdealComparison_fst** (projection): The B-projection of c_f,I(a) is f(a).
- **commonIdealComparison_snd** (projection): The A/I-projection of c_f,I(a) is [a].
- **commonIdealComparison_unique** (universal-property): Any ring map from A to this native pullback with projections f and the quotient map equals c_f,I.

**Unit tests:**

- **commonIdealComparison.test_identity** (compatibility): For f=id_A and any I, the canonical comparison is bijective.
- **commonIdealComparison.test_zero_ideal** (degenerate): For arbitrary f and I=0, the canonical comparison is bijective.
- **commonIdealComparison.test_noninjective_kernel** (non-example): For f:Z→Z/2 and I=ker f, the comparison sends 2 and 0 to the same element, although 2≠0. Thus having an ideal image alone does not make it an isomorphism.

- **commonIdealComparison.test_image_not_ideal** (non-example): For the diagonal map F₂→F₂×F₂ and I=F₂, the kernel intersection is zero but the comparison is not surjective. Its image is the diagonal two-element subring, while the ideal generated by it is all four elements. The image-ideal hypothesis is therefore necessary for the stated lifting criterion.

**Acceptance:** For any f and I=0, c_f,0 is bijective even when f is not injective.

**Source:** [Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Lemma 1.3, converse, printed pp556–557 (plus ring/underlying-set criterion in §1.1). The common-ideal argument uses the explicit compatible-pair correction above.

### G.0/common-ideal-kernel — Kernel of the reconstruction comparison

**Node:** NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-kernel.

With the preceding notation, ker(c_f,I)=ker(f)∩I, without any image-ideal assumption.

**Construction/proof outline:**

1. Use the two comparison projections: c_f,I(a)=0 precisely when f(a)=0 and [a]=0.
2. Use the native quotient-kernel identity; the native pullback lies in B×A/I, so zero in both coordinates is zero in the pullback.

**Prerequisites:** NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-comparison, mathlib:Ideal.mk_ker.

**Acceptance:** For I=ker f the kernel is ker f itself; for I=0 the comparison is injective for every f.

**Source:** [Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Lemma 1.3, converse, printed pp556–557 (plus ring/underlying-set criterion in §1.1). The common-ideal argument uses the explicit compatible-pair correction above.

### G.0/common-ideal-pair-lifting — Lifting compatible pairs across a common ideal

**Node:** NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-pair-lifting.

If the set f(I) equals the underlying set of J=map_f(I), then c_f,I is surjective. This condition says that the image is already an ideal, not merely that the ideal generated by it exists.

**Construction/proof outline:**

1. Take a compatible pair (b,α) in the native pullback and choose a representative a of α.
2. Compatibility says b−f(a)∈J. The image-ideal condition supplies i∈I with f(i)=b−f(a).
3. Then a+i maps to (b,α); replacing a by a+i does not alter its class modulo I. No finiteness or injectivity of f is used.

**Prerequisites:** NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-comparison, mathlib:Ideal.Quotient.mk_surjective, mathlib:Ideal.Quotient.eq, mathlib:Ideal.quotientMap_mk.

**Acceptance:** The correction works for rings with nilpotents and for non-injective maps; uniqueness belongs to the separate kernel condition.

**Source:** [Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Lemma 1.3, converse, printed pp556–557 (plus ring/underlying-set criterion in §1.1). The common-ideal argument uses the explicit compatible-pair correction above.

### G.0/common-ideal-cartesian — Cartesian criterion for common-ideal squares

**Node:** NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-cartesian.

If f(I)=map_f(I) as sets, the square A→B, A→A/I, B→B/map_f(I), A/I→B/map_f(I) is cartesian in commutative rings if and only if ker(f)∩I=0. No finite, reduced or Noetherian hypothesis is imposed.

**Construction/proof outline:**

1. By compatible-pair lifting the canonical comparison is surjective. By its kernel identity and the native injectivity criterion it is injective exactly when ker(f)∩I=0.
2. Convert the resulting bijective ring map into the native ring equivalence and categorical isomorphism; transfer the existing pullback universal property.
3. Conversely, a cartesian square identifies the comparison with the unique isomorphism between two limits; its kernel is zero, giving the required intersection condition.

**Prerequisites:** NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-kernel, NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-pair-lifting, mathlib:CommRingCat.pullbackConeIsLimit, mathlib:RingHom.injective_iff_ker_eq_bot, mathlib:RingEquiv.ofBijective, mathlib:RingEquiv.toCommRingCatIso.

**Acceptance:** The non-injective Z→Z/2 example with I=ker f fails the criterion; I=0 succeeds.

**Source:** [Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Lemma 1.3, converse, printed pp556–557 (plus ring/underlying-set criterion in §1.1). The common-ideal argument uses the explicit compatible-pair correction above.

### G.0/conductor-ring-cartesian — Conductor reconstruction for arbitrary subrings

**Node:** NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-ring-cartesian.

For an arbitrary subring A⊂B of a commutative ring B, let J=c(A,B) be the already planned general conductor and I=J∩A. Then A→B, A→A/I, B→B/J, A/I→B/J is cartesian in commutative rings. Finiteness, birationality, reducedness and Noetherianity are unnecessary for this affine identity.

**Construction/proof outline:**

1. The conductor is an ideal of B contained in A. For the inclusion f:A→B every element of J is the image of its subtype in I; hence f(I)=J and map_f(I)=J. Use the native map/comap inclusion for the reverse ideal bound.
2. The inclusion has zero kernel, so ker(f)∩I=0. Apply the common-ideal cartesian criterion and identify the quotient map with the native induced map to B/J.
3. The existing geometric conductor-square node separately uses finite affine pinching and localization/gluing under its stated hypotheses. This affine identity alone does not supply global algebraic-space existence.

**Prerequisites:** NeronModelsAndSemistableAbelianVarietiesPartII:G.0/subring-conductor, NeronModelsAndSemistableAbelianVarietiesPartII:G.0/common-ideal-cartesian, mathlib:Ideal.map_comap_le, mathlib:Ideal.quotientMap.

**Acceptance:** For a proper field subring the conductor is zero and reconstruction still holds; for A=B it is the whole ring, including a nonreduced B.

**Source:** [Ferrand](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf), Lemma 1.3, converse, printed pp556–557 (plus ring/underlying-set criterion in §1.1). The common-ideal argument uses the explicit compatible-pair correction above.

### G.0/conductor-square — Generalized conductor square

**Theorem contract.** For a finite inclusion A⊂B of reduced Noetherian rings and I=c(A,B), A→B×_(B/I)(A/I) is an isomorphism. Thus the conductor diagram is a Ferrand square, without a birational hypothesis.

**Construction/proof outline:**

1. Use G.0/conductor-ring-cartesian for the affine identity; its common-ideal comparison, kernel and compatible-pair lifting are separate declarations.
2. If b mod I is represented by a∈A, then b−a∈I⊂A, giving the inverse.
3. Localize the conductor to glue these identities for finite reduced Noetherian schemes.

**Prerequisites:** `G.0/conductor-ring-cartesian`, `G.0/subring-conductor`, `G.0/affine-existence`, `SchemeAndStackFoundations:SF.0`.

**Acceptance:** For a proper finite field extension the conductor is zero and the square is still valid.

**Source:** [Jakub Witaszek](https://par.nsf.gov/servlets/purl/10429755), Definition2.27, pp674–675. Literal anchor: “R ≃ S ×S/I R/I”. The generalized conductor includes finite maps of larger generic degree.

### G.0/line-bundle-patching — Line-bundle patching over a conductor square

**Lemma contract.** For a generalized conductor square, invertible sheaves on P form the groupoid fiber product of invertible sheaves on Y and Z′ over Z. The gluing datum includes an isomorphism on Z.

**Construction/proof outline:**

1. Glue the underlying modules by the kernel of the difference map with the specified identification.
2. Use Milnor patching to establish local freeness of rank1.
3. Verify both compositions of restriction and gluing are naturally isomorphic to identity, including morphisms.

**Prerequisites:** `G.0/conductor-square`, `SchemeAndStackFoundations:SF.3`, `AlgebraicModuliForArithmeticGeometry:A0-extension`.

**Acceptance:** Gluing trivial bundles with different units on Z can give different global line bundles.

**Source:** [Jakub Witaszek](https://par.nsf.gov/servlets/purl/10429755), Lemma2.28 and proof, pp675–676. Literal anchor: “Cartesian in the 2-category of groupoids”. A set-level equality of Picard groups omits the identification and automorphism data.

### Algebraic-space continuation: finite pinching, not unconditional scheme pinching

Write D=(Z;Y,Z′), with i:Z→Y closed and g:Z→Z′ finite, over a scheme S. Temkin–Tyomkin writes the two outer components in the opposite order: its datum (T;Y,Z) has closed arrow T→Z and finite arrow T→Y. Thus their T, Z, Y correspond here to Z, Y, Z′. This translation is used consistently in every contract below.

The existence theorem is independent of any Noetherian or quasi-separated hypothesis. It does not make the pushout a scheme: an affine étale cover is not an open affine cover. Nor does it require g to be radicial. This matters for the separable quadratic point pinch already used to construct a nonsplit rational node.

The proof has two kinds of inputs. The G.0-specific lemmas below consume the actual affine ring pullback and existing finite-pinching calculations. The general machinery belongs to SF.1/SF.3: algebraic spaces and their small étale sites, finite cofinality, étale lifting, effective descent, flat-object patching, relation quotients and separated locally quasi-finite representability. No supplier request is counted as a supplied export. Stacks0EDP upgrades an already schematic pushout; it does not construct the general finite-pinching space.

In particular, the overlap proof does not assume the final existence theorem. It first forms a secondary quotient from open-affine data. The affine finite calculation descends there to a finite surjective cover by the two separated components. Stacks05Z2 then gives separatedness over each affine base chart, and the locally quasi-finite comparison makes the overlap schematic. Using only the weaker assertion that flat base change preserves an already existing square would leave the construction circular: the requested patching equivalence must construct flat objects from compatible data, with cartesian unit and counit.

### G.0/pinching-etale-cover — Compatible affine étale charts for finite pinching

**Lemma contract.** For algebraic spaces over a scheme S, with i:Z→Y closed and g:Z→Z′ finite, there are indexed affine schemes Zα,Yα,Z′α, étale covers of Y and Z′, and specified cartesian identifications Zα=Z×Y Yα=Z×Z′ Z′α. Thus the datum has a componentwise cartesian affine étale covering. Neither Noetherian nor quasi-separated hypotheses are required.

**Proposed declaration:** `FerrandPushout.pinching_etale_cover`. This is a mathematical contract; its full algebraic-space Lean signature is in the omission ledger, not claimed to elaborate at the pinned baseline.

**Construction/proof outline:**

1. Choose an affine étale presentation of Y; its restrictions to Z are affine because i is closed.
2. Apply cofinality of pullbacks of étale coverings along the finite map g (TT5.1.2, requested at SF.1) to refine an affine étale cover of Z′ so that each pullback Zα factors through one chosen affine Y-chart. Cofinality concerns an entire cover, not an arbitrary chart meeting only one point of a finite fiber.
3. Lift the resulting affine étale Zα→Z×Y Yβ across the closed immersion into the affine Yβ using the étale lifting theorem (Stacks04D1, requested at SF.1). Set Yα to this affine lift.
4. Add charts (empty;U,empty) from an affine étale covering of Y∖Z so that the Y-components cover the complement as well as the pinching locus. Keep the overlap isomorphisms, not only the three separate covering families.

**Prerequisites:** `key/ferrand-pushouts`, `SchemeAndStackFoundations:SF.1`.

**Acceptance:** The separable quadratic point pinch is allowed: finite is not radicial. A cover of only one of two points in a finite fiber cannot be used as a cover of the whole fiber. Empty-overlap charts are essential to cover Y∖Z.

**Source:** [Michael Temkin and Ilya Tyomkin](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem5.3.1(ii), proof pp15–16; Lemmas5.1.2,5.1.4 p14; Theorem5.2.5 p15. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

### G.0/affine-space-hom-injective — Uniqueness of an affine pinch map to an algebraic space

**Lemma contract.** Let p:B→C be surjective, q:A′→C finite, A=B×C A′, and P=Spec A. For any algebraic S-space T, restriction HomS(P,T)→HomS(Spec B,T)×HomS(Spec C,T)HomS(Spec A′,T) is injective.

**Proposed declaration:** `FerrandPushout.affine_space_hom_injective`. This is a mathematical contract; its full algebraic-space Lean signature is in the omission ledger, not claimed to elaborate at the pinned baseline.

**Construction/proof outline:**

1. Take two maps with the same restrictions. Their pullbacks of an affine étale presentation of a quasi-compact open of T have the same cartesian datum.
2. Use the exact flat/étale patching equivalence at SF.3 to identify those pullbacks over P; refine the resulting scheme by affine étale charts.
3. On every such affine chart, ring pullback universality forces the two maps into the affine target chart to agree.
4. Descend equality of morphisms along the surjective étale cover using SF.1. Work on quasi-compact open target neighborhoods to remove a global quasi-compactness assumption on T.

**Prerequisites:** `G.0/affine-existence`, `mathlib:CommRingCat.pullbackConeIsLimit`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Acceptance:** The target is any algebraic space, not just an affine scheme. No assertion that Spec takes every ring limit to a space colimit is used.

**Source:** [Michael Temkin and Ilya Tyomkin](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.2.1, injectivity argument pp10–11. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

### G.0/affine-space-hom-surjective — Descent of compatible maps from an affine pinch

**Lemma contract.** For the affine datum and P of affine-space-hom-injective and every algebraic S-space T, each compatible pair of maps Spec B→T and Spec A′→T extends to a map P→T.

**Proposed declaration:** `FerrandPushout.affine_space_hom_surjective`. This is a mathematical contract; its full algebraic-space Lean signature is in the omission ledger, not claimed to elaborate at the pinned baseline.

**Construction/proof outline:**

1. Pull back an affine étale presentation T0→T to the datum. It remains a finite pinching datum and therefore admits the compatible affine étale cover of pinching-etale-cover.
2. Use the flat/étale patching equivalence at SF.3 over the original affine P to obtain the induced surjective étale scheme cover P0→P and its genuine cartesian overlap P1=P0×P P0.
3. Maps from the affine charts to T0 factor through their ring pullback pushouts. On P1 the two induced maps to T agree by affine-space-hom-injective, applied on an open affine cover.
4. Effective étale descent of morphisms at SF.1 gives P→T. Pull back to the covering datum to verify that its restrictions are the specified maps.

**Prerequisites:** `G.0/pinching-etale-cover`, `G.0/affine-space-hom-injective`, `mathlib:CommRingCat.pullbackConeIsLimit`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Acceptance:** Together with the preceding injectivity lemma this upgrades the existing affine scheme pushout to universality against all algebraic spaces. Both maps on the closed overlap, and their equality, survive descent.

**Source:** [Michael Temkin and Ilya Tyomkin](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.2.1, surjectivity argument p11. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

### G.0/pinching-etale-relation — Étale equivalence relations after pinching

**Lemma contract.** Suppose D1⇉D0 is an étale equivalence relation of finite pinching data, every componentwise square is cartesian, and D0,D1 admit compatible open affine coverings. Their schematic pushouts P1⇉P0 form an étale equivalence relation.

**Proposed declaration:** `FerrandPushout.etale_relation`. This is a mathematical contract; its full algebraic-space Lean signature is in the omission ledger, not claimed to elaborate at the pinned baseline.

**Construction/proof outline:**

1. Schematic pinching and the requested flat patching equivalence preserve flat fiber products, so identity, inverse and composition descend and satisfy the groupoid equations.
2. The induced source and target maps are étale by the local ring patching comparison at SF.3.
3. Prove the relation map P1→P0×S P0 is a monomorphism: it is locally of finite type, and its pullbacks to the four pairs of closed pinched pieces and open complements are monomorphisms. The mixed pairs have empty inverse image.
4. Use the SF.1 locally-finite-type monomorphism test after a surjective base change (TT2.1.6). A groupoid alone is insufficient: the monomorphism is the load-bearing final step.

**Prerequisites:** `G.0/global-existence`, `G.0/localization-complement`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Acceptance:** The relation has no stabilizers; a general étale groupoid with nontrivial stabilizers is not an algebraic-space equivalence relation.

**Source:** [Michael Temkin and Ilya Tyomkin](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Lemma4.3.1 and proof pp12–13; Lemma4.1.2 pp9–10; Lemma2.1.6 p4. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

### G.0/pinching-overlap-scheme — Schematic overlaps of an affine étale pinching cover

**Lemma contract.** Let D0 be the disjoint union of the compatible affine étale charts of a finite pinching datum D and put D1=D0×D D0 componentwise. Then D1 admits a compatible open affine covering, so its pinching pushout P1 is a scheme. These opens are cartesian in all three components.

**Proposed declaration:** `FerrandPushout.overlap_isScheme`. This is a mathematical contract; its full algebraic-space Lean signature is in the omission ledger, not claimed to elaborate at the pinned baseline.

**Construction/proof outline:**

1. The components of D1 are ind-quasi-affine schemes. On pairs of affine chart components, their maps are base changes of the separated locally quasi-finite diagonals of Y and Z′ (Stacks02X4); SF.1 supplies the locally quasi-finite separated representability and local quasi-affineness comparisons.
2. Use affine lifting on ind-quasi-affine schemes (TT5.2.5) to obtain a secondary affine étale covering Q0→D1. The components of D1 are separated schemes, so Q1=Q0×D1 Q0 has open affine coverings: fiber products of affines over a separated scheme are affine.
3. The schematic pinches of Q0,Q1 are universal against algebraic spaces by the two affine-space Hom lemmas. By pinching-etale-relation their quotient exists as an algebraic space by the SF.1 quotient theorem, and is the pushout of D1.
4. Flat patching identifies D1 with the pullback of D0 along P1→P0 and makes this map étale. The affine finite-projection calculation and the surjective projection show, by étale descent at SF.1, that Y1⊔Z′1→P1 is finite and surjective. Its components are separated over each affine base chart, so Stacks05Z2 makes P1 separated over that chart. This argument uses local finiteness of the already constructed overlap, not the later existence theorem.
5. The separated étale map P1→P0 is representable by schemes: use Stacks67.50.2 (section0417) for locally quasi-finite maps; Stacks082J is the stronger quasi-finite comparison cited by TT6.2.1. Pull back affine opens of the now schematic P1 to obtain the compatible open affine cover of D1.

**Prerequisites:** `G.0/pinching-etale-cover`, `G.0/affine-space-hom-injective`, `G.0/affine-space-hom-surjective`, `G.0/pinching-etale-relation`, `G.0/finite-projection`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Acceptance:** The first compatible cover is étale, not automatically Zariski; its overlaps need their own proof. Separatedness is used on the overlap, not imposed globally on the original algebraic spaces.

**Source:** [Michael Temkin and Ilya Tyomkin](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem6.2.1(i), overlap argument pp17–18; Theorem4.4.1 p13. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

**Source:** [The Stacks Project Authors](https://stacks.math.columbia.edu/tag/02X4), Lemma65.13.1, displayed proof. Diagonal properties are automatic for algebraic spaces; they do not impose separatedness on Y.

**Source:** [The Stacks Project Authors](https://stacks.math.columbia.edu/tag/05Z2), Lemma67.9.8(4), displayed diagonal proof. Use only the finite-surjective specialization after constructing the secondary quotient.

**Source:** [The Stacks Project Authors](https://stacks.math.columbia.edu/tag/0417), Proposition67.50.2, displayed proof. Representability needs only local quasi-finiteness and separatedness, not quasi-compactness of the entire étale overlap.

### G.0/algebraic-space-existence — Finite pinching in algebraic spaces

**Theorem contract.** For algebraic spaces Y,Z,Z′ over a scheme S, a closed immersion i:Z→Y and a finite morphism g:Z→Z′ have a categorical pushout P=Y⊔Z Z′ in algebraic S-spaces, with affine canonical maps Y→P and Z′→P. No Noetherian, quasi-separated, reduced, radicial or scheme affine-neighborhood hypothesis is imposed.

**Proposed declaration:** `FerrandPushout.exists_algebraicSpace`. This is a mathematical contract; its full algebraic-space Lean signature is in the omission ledger, not claimed to elaborate at the pinned baseline.

**Construction/proof outline:**

1. Use pinching-etale-cover to form D0→D and pinching-overlap-scheme for D1=D0×D D0.
2. Form the schematic pushouts P0,P1 on their compatible open affine covers. Their universality in algebraic spaces follows by gluing the two affine-space Hom lemmas.
3. Use pinching-etale-relation to identify P1⇉P0 as an étale equivalence relation and invoke the SF.1 algebraic-space quotient theorem to construct P.
4. Compatible maps out of D descend through P0 and P1, yielding the categorical universal property of P. Effectivity supplies D0=D×P P0 and D1=D×P P1; descend affineness of the canonical maps from the affine local pinches.
5. Finiteness, the closed immersion, cartesianness and the geometric sheaf condition are separate nodes, rather than silently bundled assumptions of this existence theorem.

**Prerequisites:** `G.0/pinching-etale-cover`, `G.0/pinching-overlap-scheme`, `G.0/pinching-etale-relation`, `G.0/affine-space-hom-injective`, `G.0/affine-space-hom-surjective`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Acceptance:** A finite separable quadratic point pinch is included although it is not a universal-homeomorphism pinch. When the datum is affine this P is canonically the existing Spec of the ring pullback. This theorem does not assert P is a scheme.

**Source:** [Michael Temkin and Ilya Tyomkin](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem6.2.1(ii)(b), pp17–18; Theorem4.4.1 p13. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

### G.0/space-cartesian — The schematic overlap of an algebraic-space pinch

**Lemma contract.** For the effective finite pinching pushout P, the canonical square Z→Y, Z→Z′, Y→P, Z′→P is cartesian in algebraic spaces, including nonreduced Z.

**Proposed declaration:** `FerrandPushout.space_isPullback`. This is a mathematical contract; its full algebraic-space Lean signature is in the omission ledger, not claimed to elaborate at the pinned baseline.

**Construction/proof outline:**

1. Pull back along the effective étale presentation P0→P obtained in algebraic-space-existence.
2. On every affine chart apply the existing cartesian-affine tensor-quotient comparison.
3. Descend the canonical comparison Z→Y×P Z′ as an isomorphism using SF.1. Topological equality of the overlap is not substituted for this comparison.

**Prerequisites:** `G.0/algebraic-space-existence`, `G.0/cartesian-affine`, `SchemeAndStackFoundations:SF.1`.

**Acceptance:** The cusp overlap retains the full double point Spec k[t]/(t²), not its reduction.

**Source:** [Michael Temkin and Ilya Tyomkin](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.4.2(ii) and proof p13. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

### G.0/space-geometric — Geometric realization of algebraic-space pinching

**Lemma contract.** The effective finite pinching square satisfies the general GeometricPushout predicate: the underlying topological space is the quotient pushout and, on the small étale site of P, O_P≅a_*O_Y×c_*O_Z b_*O_Z′, where c=ai=bg. In particular every affine étale U→P gives the corresponding pullback of section rings on its three inverse images.

**Proposed declaration:** `FerrandPushout.space_geometric`. This is a mathematical contract; its full algebraic-space Lean signature is in the omission ledger, not claimed to elaborate at the pinned baseline.

**Construction/proof outline:**

1. Use the effective presentation P0→P and the genuine cartesian charts of algebraic-space-existence.
2. On affine charts the structure sheaf is the sheafification of the existing ring pullback; compare on principal opens and transport to the small étale site.
3. Descend the sheaf isomorphism through the étale presentation using SF.1; Zariski sections alone are not a definition of an arbitrary algebraic space.
4. Use TT4.4.2(i) to descend the quotient topology from the same affine pinches. The scheme specialization is exactly the existing every-open section condition.

**Prerequisites:** `key/ferrand-pushouts`, `G.0/algebraic-space-existence`, `G.0/space-cartesian`, `G.0/affine-existence`, `SchemeAndStackFoundations:SF.1`.

**Acceptance:** The existing k[t²,t⁵] square still fails the sheaf pullback despite its underlying universal homeomorphisms. On schemes this statement recovers the original general geometric-square definition.

**Source:** [Michael Temkin and Ilya Tyomkin](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.4.2(i) and proof p13; Theorem4.4.1(ii) p13; §3.3.6 p7. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

### G.0/space-finite — Finiteness after algebraic-space pinching

**Lemma contract.** For the effective finite pinching P of algebraic-space-existence, the canonical map a:Y→P is finite.

**Proposed declaration:** `FerrandPushout.space_isFinite`. This is a mathematical contract; its full algebraic-space Lean signature is in the omission ledger, not claimed to elaborate at the pinned baseline.

**Construction/proof outline:**

1. Pull back to the effective affine étale pinching charts on P.
2. On each chart apply finite-projection to the finite ring homomorphism A′→C.
3. Descend finiteness of a along the étale presentation at SF.1. It does not follow from affineness alone.

**Prerequisites:** `G.0/algebraic-space-existence`, `G.0/finite-projection`, `SchemeAndStackFoundations:SF.1`.

**Acceptance:** Pinching two distinct points gives a finite normalization map which is not a closed immersion and need not be flat.

**Source:** [Michael Temkin and Ilya Tyomkin](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem6.3.5, finiteness case and proof p19. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

### G.0/space-closed — The closed pinched locus in an algebraic space

**Lemma contract.** For the effective finite pinching P, b:Z′→P is a closed immersion and the induced Y∖Z→P∖b(Z′) is an isomorphism of open algebraic spaces.

**Proposed declaration:** `FerrandPushout.space_closed_complement`. This is a mathematical contract; its full algebraic-space Lean signature is in the omission ledger, not claimed to elaborate at the pinned baseline.

**Construction/proof outline:**

1. On each effective affine étale chart, the ring pullback projection to A′ is surjective by pullback-projection, so the pinched locus is the actual closed subscheme defined by its kernel.
2. The existing localization-complement comparison identifies its open complement with Y∖Z.
3. Descend the closed immersion and this canonical complement isomorphism at SF.1. Both describe the one closed/open decomposition of the pushout.

**Prerequisites:** `G.0/algebraic-space-existence`, `G.0/pullback-projection`, `G.0/localization-complement`, `SchemeAndStackFoundations:SF.1`.

**Acceptance:** Closedness does not identify the whole Y→P map with an immersion. For Z empty the complement comparison is the identity and P=Y⊔Z′.

**Source:** [Michael Temkin and Ilya Tyomkin](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.4.2(iii) and proof p13. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

### G.0/space-flat-base-change — Flat compatibility of algebraic-space pinching

**Comparison contract.** For an effective finite pinching P and any flat algebraic-space morphism F→P, the canonical comparison from the pinching pushout of the three pullbacks to F is an isomorphism. In particular these pullbacks realize the same geometric square; no arbitrary nonflat compatibility is asserted.

**Proposed declaration:** `FerrandPushout.space_flat_baseChange`. This is a mathematical contract; its full algebraic-space Lean signature is in the omission ledger, not claimed to elaborate at the pinned baseline.

**Construction/proof outline:**

1. Finite and closed morphisms are stable under base change, so the pullback datum has its own effective pinching by algebraic-space-existence.
2. On the source- and target-étale presentations apply the affine flat ring/space patching equivalence requested at SF.3 and the existing flat-base-change calculation.
3. Descend the unique comparison isomorphism at SF.1. Equivalently apply TT6.3.2(i) to the flat object F over P.
4. The two iterated base-change comparisons agree because they induce the same maps on all three components; the categorical universal property supplies uniqueness.

**Prerequisites:** `G.0/algebraic-space-existence`, `G.0/space-geometric`, `G.0/flat-base-change`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Acceptance:** Étale base changes are included. A nonflat ring quotient can destroy the fiber-product exact sequence; a flatness-free version is not exported.

**Source:** [Michael Temkin and Ilya Tyomkin](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem6.3.2(i), pp18–19, forward equivalence proof. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

### G.0/space-scheme-recognition — When finite pinching is a scheme

**Comparison contract.** For a finite pinching datum whose three components Y,Z,Z′ are schemes, its algebraic-space pushout P is a scheme if and only if for every point z′∈Z′ the finite set i(g⁻¹(z′)) lies in an affine open of Y. Under this condition the canonical scheme pushout agrees with P, including universality against algebraic-space targets.

**Proposed declaration:** `FerrandPushout.isScheme_iff`. This is a mathematical contract; its full algebraic-space Lean signature is in the omission ledger, not claimed to elaborate at the pinned baseline.

**Construction/proof outline:**

1. If the fiber affine-neighborhood condition holds, compatible-affine-neighbourhoods and global-existence construct the schematic pinch. The two affine-space Hom lemmas upgrade its categorical universality to all algebraic spaces; uniqueness identifies it with P.
2. Conversely, if P is a scheme, take an affine open neighborhood of b(z′) in P. Its inverse image under the finite map a is affine by space-finite and contains every i(z) with g(z)=z′.
3. The equivalent compatible-open-affine-cover criterion is TT4.2.4. Do not conflate a compatible étale affine cover, which always exists for finite data, with the stronger open affine cover.

**Prerequisites:** `G.0/algebraic-space-existence`, `G.0/space-finite`, `G.0/global-existence`, `G.0/compatible-affine-neighbourhoods`, `G.0/affine-space-hom-injective`, `G.0/affine-space-hom-surjective`, `SchemeAndStackFoundations:SF.1`.

**Acceptance:** If Y contains two distinct closed k-points with no common affine open, pinching their disjoint union to Spec k gives an algebraic space which is not a scheme. Affine Y and the original quadratic-point-on-P¹ examples satisfy the condition. The scheme recognition condition is necessary as well as sufficient.

**Source:** [Michael Temkin and Ilya Tyomkin](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), Theorem4.2.4 and Example4.2.3, pp11–12; compare Ferrand7.1. Finite-pinching specialization, in this packet's notation Z→Y closed and Z→Z′ finite; the source writes (T;Y,Z) with its closed arrow T→Z.

## G.1 — Genus-one fibers and finite-field forms

Fiber geometry is more than an affine root graph. I₂ has two distinct nodes, III has one tangency of length2; I₃ has three distinct nodes, while IV has one triple meeting. Record incidence schemes and primitive null-root multiplicities together. Nonsplit I₁ pinches a quadratic point on P¹ to one rational node. Nonsplit I₂ has two rational components and a degree-two intersection scheme. Their rational point counts differ from the split formulas.

The component-descent bridge uses numerical Picard constancy, a component-class rigidity argument and effective Galois descent. Fixed numerical classes alone are not an already supplied subscheme theorem. After this bridge and finite-field genus0 forms are proved, normalized rational components are P¹. Counting gives rq for split I_r, q+2 for nonsplit I₁,2q+2 for nonsplit I₂ and rq+1 for additive fibers. The additive IV count subtracts two at the single common point; it is not a tree argument. I₀* would require four distinct rational points on P¹_F₂, which has only three.

The five elliptic curves E₁,…,E₅ have respective counts1,…,5. A finite sanity check enumerated32 tuples, found16 smooth equations and five coordinate-change orbits distinguished by those counts. Weierstrass representability and the genuine group/ordinary-supersingular comparisons are still imported mathematical inputs. Lang’s theorem provides the finite-field genus-one and PGL₂-form arguments, with their general foundational proof gap recorded.

**Stage imports:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.0`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.5`.

### G.1/genus-one-fibration — Genus-one fibration

**Definition contract.** Over a field k, a genus-one fibration is a proper flat contraction f:S→B with S smooth proper geometrically integral of dimension2 and H⁰(S,O)=k, B a smooth proper geometrically integral curve, and generic fiber a regular geometrically integral proper curve over K=k(B) with H⁰=K and dim_K H¹=1. Elliptic means the generic fiber is smooth over K; quasielliptic means it is not smooth. Relative minimality means no vertical exceptional curve of the first kind. The Jacobian fibration carries its distinguished section.

**Construction/proof outline:**

1. Extend the existing DVR model by a global curve base, and impose generic genus using genuine coherent cohomology.
2. Use the imported minimal-model criterion for the smooth generic case; do not infer smoothness from regularity over the imperfect field k(B).

**Prerequisites:** `tauceti:TauCeti.Model`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

| Consumer | Required use |
| --- | --- |
| Schröer §§3,8–10 | The same fibration carrier is used for all fiber and Jacobian comparisons. |
| CDL2024 §4.1 pp361–363 | Regular non-smooth generic curves distinguish quasielliptic fibrations. |

| Proposed API name | Role | Exact contract |
| --- | --- | --- |
| GenusOneFibration.toModel | compatibility | Localization at a closed base point is the existing TauCeti.Model, with the chosen generic-fiber identification. |
| GenusOneFibration.fiber | projection | For a point b return the scheme-theoretic fiber over κ(b), not its reduction. |
| GenusOneFibration.baseChange | functoriality | Field extension gives the base-changed fibration; regularity/minimality must be re-established when not preserved. |
| GenusOneFibration.isElliptic_iff | characterisation | Elliptic iff the generic fiber is smooth over k(B). |

| Unit test name | Kind | Statement that the definition must satisfy |
| --- | --- | --- |
| GenusOneFibration.product | computation | For E/k elliptic, E×P¹→P¹ is elliptic with genus1 generic fiber. |
| GenusOneFibration.quasielliptic | non-example | A regular non-smooth genus-one generic curve in characteristic2 is quasielliptic and must not satisfy the elliptic predicate. |
| GenusOneFibration.localization | compatibility | A localized fibration retains the schematic multiple fiber, even if its reduction is smooth. |

**Acceptance:** For E/k elliptic, E×P¹→P¹ is elliptic with genus1 generic fiber. A regular non-smooth genus-one generic curve in characteristic2 is quasielliptic and must not satisfy the elliptic predicate. A localized fibration retains the schematic multiple fiber, even if its reduction is smooth.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), §3, p. 9; §3, p. 9; §4, pp. 12–13; arXiv v3. Literal anchor: “A genus-one fibration”. The routed statement is narrowed or corrected as specified in this node.

### G.1/fiber-type-divisor — Divisors of fiber and canonical type

**Definition contract.** For a nonzero connected effective divisor D=Σn_iC_i on a smooth proper surface, with distinct integral C_i and n_i>0, fiber type means D·C_i=0 for every i, and canonical type additionally K_S·C_i=0 for every i. Its multiplicity is gcd_i n_i; D_ind=Σ(n_i/m)C_i and D_red=ΣC_i. The latter two need not agree. The definition uses the scheme Weil-divisor/intersection APIs of SF.5 and the geometric numerical-type realization of StableReduction.

**Construction/proof outline:**

1. Use the existing effective divisor, intersection and finite component carriers.
2. Take a positive gcd on the nonempty support; form the quotient coefficients without truncating division.

**Prerequisites:** `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

| Consumer | Required use |
| --- | --- |
| Schröer §§3,9 | Separate the smooth reduced underlying fiber from the multiple Cartier fiber. |
| Bombieri–Mumford II Theorem2 | Correction divisor uses the indecomposable fiber with its null-root multiplicities. |

| Proposed API name | Role | Exact contract |
| --- | --- | --- |
| FiberTypeDivisor.mul | constructor | A positive integral multiple is of fiber type, and of canonical type when the original is. |
| FiberTypeDivisor.ind | projection | The indecomposable divisor has coefficient gcd1 and m·D_ind=D. |
| FiberTypeDivisor.red | projection | The reduced divisor has every coefficient1. |
| FiberTypeDivisor.numericalType | compatibility | For a localized regular model, use the existing numerical type with its residue-degree weights, rather than an unweighted replacement. |

| Unit test name | Kind | Statement that the definition must satisfy |
| --- | --- | --- |
| FiberTypeDivisor.smooth | computation | A smooth genus-one fiber has multiplicity1 and D_ind=D_red. |
| FiberTypeDivisor.double | computation | For a double smooth fiber, m=2, D_ind=D_red, and D differs from both. |
| FiberTypeDivisor.star | non-example | For an I₀* fiber, gcd1 but the central component has coefficient2, so D_ind≠D_red. |
| FiberTypeDivisor.exceptional | non-example | A connected negative-definite exceptional divisor cannot be of fiber type. |

**Acceptance:** A smooth genus-one fiber has multiplicity1 and D_ind=D_red. For a double smooth fiber, m=2, D_ind=D_red, and D differs from both. For an I₀* fiber, gcd1 but the central component has coefficient2, so D_ind≠D_red. A connected negative-definite exceptional divisor cannot be of fiber type.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), §3, p. 9; arXiv v3. Literal anchor: “A curve of canonical type”. The routed statement is narrowed or corrected as specified in this node.

### G.1/geometric-kodaira — Geometric Kodaira realization

**Definition contract.** For the indecomposable geometric fiber of a relatively minimal genus-one fibration, HasGeometricKodairaFiber(f,b,T) asserts the full scheme/divisor realization of the existing equation-side Kodaira symbol T: components, normalization genera, null-root multiplicities, intersection lengths and incidence points. For I₂ record two distinct intersection points, for III one length2 tangency; for I₃ a three-node cycle, for IV three components through one point. I₀ is smooth, multiplicative I_n has n≥1, and the additive list is II,III,IV,I_n*,IV*,III*,II*. A numerical graph alone is insufficient.

**Construction/proof outline:**

1. Import the symbol type from EllipticCurves Layer4 and attach its geometric realization, without creating a second enum.
2. Use scheme-theoretic intersection lengths over κ(b), and transport to geometric fibers.

**Prerequisites:** `G.1/genus-one-fibration`, `G.1/fiber-type-divisor`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

| Consumer | Required use |
| --- | --- |
| Schröer Theorems9.4,10.4–10.5 | Distinguish bad fiber types and splitting used in the point sum. |
| Szydło §2 and Theorem3.1 | The same symbol need not describe all imperfect-residue behavior. |

| Proposed API name | Role | Exact contract |
| --- | --- | --- |
| HasGeometricKodairaFiber.components | projection | The component counts are n for I_n,n+5 for I_n*,7 for IV*,8 for III*,9 for II*. |
| HasGeometricKodairaFiber.multiplicative | characterisation | A singular multiplicative underlying fiber has symbol I_n with n≥1. |
| HasGeometricKodairaFiber.baseChange | functoriality | The geometric symbol is invariant after extending the algebraically closed residue field. |
| HasGeometricKodairaFiber.tate | compatibility | For an elliptic generic fiber over a perfect-residue DVR, the realization agrees with the imported Tate algorithm on a minimal equation. |

| Unit test name | Kind | Statement that the definition must satisfy |
| --- | --- | --- |
| HasGeometricKodairaFiber.two_components | non-example | III and I₂ have different local incidence schemes even though both have two vertices. |
| HasGeometricKodairaFiber.triangle | non-example | IV and I₃ both have triangular pairwise graphs, but IV has one triple intersection and I₃ three nodes. |
| HasGeometricKodairaFiber.smooth | degenerate | I₀ is smooth and is neither singular multiplicative nor additive. |

**Acceptance:** III and I₂ have different local incidence schemes even though both have two vertices. IV and I₃ both have triangular pairwise graphs, but IV has one triple intersection and I₃ three nodes. I₀ is smooth and is neither singular multiplicative nor additive.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), §3, pp. 9–10; arXiv v3. Literal anchor: “semistable”. The routed statement is narrowed or corrected as specified in this node.

### G.1/degenerate-fiber — Degenerate genus-one fiber

**Definition contract.** A geometric fiber is degenerate when its gcd multiplicity is greater than1, or its indecomposable divisor is singular in the elliptic case, or that divisor is reducible in the quasielliptic case. A simple irreducible cuspidal fiber of a quasielliptic fibration is not degenerate in this convention.

**Construction/proof outline:**

1. Evaluate the multiplicity and the two generic-fiber cases separately.

**Prerequisites:** `G.1/genus-one-fibration`, `G.1/fiber-type-divisor`, `G.1/geometric-kodaira`.

| Consumer | Required use |
| --- | --- |
| Schröer §3 | Avoid counting every generic cusp of a quasielliptic fibration as an exceptional fiber. |

| Proposed API name | Role | Exact contract |
| --- | --- | --- |
| DegenerateFiber.multiple | characterisation | Every multiple fiber is degenerate. |
| DegenerateFiber.elliptic_iff | characterisation | For an elliptic fibration, degenerate iff multiple or singular indecomposable fiber. |
| DegenerateFiber.quasielliptic_iff | characterisation | For a quasielliptic fibration, degenerate iff multiple or reducible indecomposable fiber. |

| Unit test name | Kind | Statement that the definition must satisfy |
| --- | --- | --- |
| DegenerateFiber.simple_smooth | degenerate | A simple smooth elliptic fiber is not degenerate. |
| DegenerateFiber.double_smooth | non-example | A double smooth fiber is degenerate despite smooth reduction. |
| DegenerateFiber.simple_cusp | non-example | A simple irreducible cusp of a quasielliptic fibration is not degenerate. |

**Acceptance:** A simple smooth elliptic fiber is not degenerate. A double smooth fiber is degenerate despite smooth reduction. A simple irreducible cusp of a quasielliptic fibration is not degenerate.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), §3, p. 10; arXiv v3. Literal anchor: “degenerate”. The routed statement is narrowed or corrected as specified in this node.

### G.1/canonical-type-classification — Classification of canonical fibers

**Theorem contract.** The indecomposable geometric fibers have exactly the geometric Kodaira forms specified by PAPER-SCHROER-23/189, with the multiplicity vector the primitive null root; irreducible nodal and cuspidal cases must be separated from the reducible affine-root cases.

**Hypotheses:** Smooth proper surface over an algebraically closed field; regular relatively minimal genus-one fibration.

**Construction/proof outline:**

1. Use the imported Zariski negative-semidefinite intersection lemma and adjunction to get rational (−2)-components in the reducible case.
2. Apply the classification of connected affine root systems to the intersection form.
3. Classify integral genus1 curves by normalization and the length-one delta invariant; retain the incidence distinction between I₂/III and I₃/IV.

**Prerequisites:** `G.1/fiber-type-divisor`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** The affine graph is a constraint, not a substitute for local intersection geometry.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), §3, equation (1), pp. 9–10; arXiv v3. Literal anchor: “Kodaira symbols”. The routed statement is narrowed or corrected as specified in this node.

### G.1/small-conductor-classification — Conductor classification with one or two rational components

**Lemma contract.** Let C be a proper curve of canonical type over a field F whose irreducible components are birational to P¹_F. (r = 1) If C is integral with h⁰(O_C) = h¹(O_C) = 1, its normalization P¹_F → C fits into a cartesian and cocartesian square with a closed subscheme Spec R ⊂ P¹_F of length two, contracted to a rational point Spec F ⊂ C. R ≅ F × F gives I₁; R ≅ F[ε]/(ε²) gives II; R a separable (resp. purely inseparable) quadratic field gives Ĩ₁ (resp. ĨI). (r = 2) If C = C_1 + C_2 with C_i ≅ P¹_F, then P¹ ⊔ P¹ → C fits into a cartesian and cocartesian square over Spec(R × R) → Spec R with R of length two, giving I₂, III, Ĩ₂, ĨII correspondingly. Over a perfect field ĨI and ĨII do not occur.

**Construction/proof outline:**

1. Use the normalization exact sequence and arithmetic genus1 to force a conductor algebra of length2.
2. Apply the Ferrand conductor square and classify length2 algebras: split, dual numbers, separable quadratic and purely inseparable quadratic.
3. For two components use two identical copies of the conductor algebra and its diagonal map; over perfect fields eliminate the inseparable field case.

**Prerequisites:** `G.0/conductor-square`, `G.0/global-existence`, `G.1/canonical-type-classification`, `SchemeAndStackFoundations:SF.0`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** Keep the imperfect-field forms visible; only the perfect-field nodal forms are used for F₂.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), §3, p. 10; arXiv v3. Literal anchor: “conductor square”. The routed statement is narrowed or corrected as specified in this node.

### G.1/nonsplit-i1 — Nonsplit I₁ pinching

**Lemma contract.** Over a perfect field k, a rational nodal curve with nonsplit node is obtained by pinching Spec E⊂P¹_k, for a separable quadratic extension E/k, to Spec k; this is the symbol nonsplit I₁.

**Construction/proof outline:**

1. Apply global Ferrand existence to the quadratic closed point on P¹.
2. The normalization exact sequence gives arithmetic genus1 and the conductor square gives one rational node with two conjugate branches.

**Prerequisites:** `G.0/global-existence`, `G.1/small-conductor-classification`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** After quadratic extension it becomes split I₁; over F_q its rational count is q+2.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), §3, p. 10; arXiv v3. Literal anchor: “non-split”. The routed statement is narrowed or corrected as specified in this node.

### G.1/nonsplit-i2 — Nonsplit I₂ pinching

**Lemma contract.** Over a perfect field k, nonsplit I₂ is the curve with normalization P¹⊔P¹ obtained from the conductor square Spec(E×E)→P¹⊔P¹ and Spec E→C, where E/k is separable quadratic.

**Construction/proof outline:**

1. Pinch the two copies of Spec E in P¹⊔P¹ to Spec E by the identity on each copy.
2. The two components are individually rational; their two geometric intersection points are conjugate, so the node set has no k-point.

**Prerequisites:** `G.0/global-existence`, `G.1/small-conductor-classification`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** Over F_q the rational count is 2q+2; this form has fixed component vertices but conjugate edges.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), §3, p. 10; arXiv v3. Literal anchor: “non-split”. The routed statement is narrowed or corrected as specified in this node.

### G.1/component-descent — Descent of components under constant numerical Picard

**Lemma contract.** Let S be a smooth proper surface over k = F_q with h⁰(O_S) = 1 and Num_{S/k} constant. Let f: S → B be a relatively minimal genus-one fibration, and ā a geometric point over a closed point a ∈ B. Then Γ(S_ā) → Γ(S_a) is a graph isomorphism respecting edge labels. If S_ā is reducible, a is F_q-rational. If every irreducible component of S_a is birational to P¹_{F_q}, a is rational. If a is rational and f⁻¹_ind(ā) is singular, every irreducible component of S_a is birational to P¹_{F_q}, and its normalization is isomorphic to P¹_{F_q}.

**Construction/proof outline:**

1. Use the numerical-Picard Galois argument to fix every component class and then every component as a subscheme.
2. Compare the connected intersection graph with residue-degree orbits to force reducible fibers to lie over rational base points.
3. Normalize rational components, use finite-field forms of P¹, and preserve labels as κ(a)-lengths.

**Prerequisites:** `G.1/genus-one-fibration`, `G.1/canonical-type-classification`, `SchemeAndStackFoundations:SF.5`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `G.1/finite-field-p1-forms`.

**Acceptance:** For nonrational a use intersection label (C_i·C_j)/[κ(a):k], not the absolute intersection number.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 3.1, pp. 10–11; arXiv v3. Literal anchor: “graph”. The routed statement is narrowed or corrected as specified in this node.

### G.1/count-15 — Split multiplicative fiber count

**Lemma contract.** Let S be a smooth proper surface over F_q with h⁰(O_S) = 1 and Num_{S/F_q} constant, f: S → B a relatively minimal genus-one fibration, and C = f⁻¹(a) the schematic fibre over an F_q-rational point a ∈ B, with r ≥ 1 irreducible components and C_red singular. If C_ind has the split Kodaira symbol I_r, then Card C(F_q) = rq.

**Construction/proof outline:**

1. Each normalized P¹ contributes q+1.
2. For n≥2 subtract the n distinct rational nodes; for n=1 identify two rational preimages and add the single node.

**Prerequisites:** `G.1/component-descent`, `G.1/geometric-kodaira`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3. Literal anchor: “Card”. The routed statement is narrowed or corrected as specified in this node.

### G.1/count-16 — Nonsplit I₁ point count

**Lemma contract.** Let S be a smooth proper surface over F_q with h⁰(O_S) = 1 and Num_{S/F_q} constant, f: S → B a relatively minimal genus-one fibration, and C = f⁻¹(a) the schematic fibre over an F_q-rational point a ∈ B, with r ≥ 1 irreducible components and C_red singular. If C_ind has the twisted symbol Ĩ₁ (non-split I₁, so r = 1), then Card C(F_q) = q + 2.

**Construction/proof outline:**

1. The degree2 point contributes no rational normalization preimage.
2. The pinched node is rational, hence replace zero points by one: q+1+1.

**Prerequisites:** `G.1/nonsplit-i1`.

**Acceptance:** The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3. Literal anchor: “q + 2”. The routed statement is narrowed or corrected as specified in this node.

### G.1/count-17 — Nonsplit I₂ point count

**Lemma contract.** Let S be a smooth proper surface over F_q with h⁰(O_S) = 1 and Num_{S/F_q} constant, f: S → B a relatively minimal genus-one fibration, and C = f⁻¹(a) the schematic fibre over an F_q-rational point a ∈ B, with r ≥ 1 irreducible components and C_red singular. If C_ind has the twisted symbol Ĩ₂ (non-split I₂, so r = 2), then Card C(F_q) = 2q + 2.

**Construction/proof outline:**

1. Each rational normalized component contributes q+1.
2. The degree2 conductor and its image have no rational points, so no correction is made.

**Prerequisites:** `G.1/nonsplit-i2`.

**Acceptance:** The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3. Literal anchor: “2q + 2”. The routed statement is narrowed or corrected as specified in this node.

### G.1/count-18 — Additive fiber point count

**Lemma contract.** Let S be a smooth proper surface over F_q with h⁰(O_S) = 1 and Num_{S/F_q} constant, f: S → B a relatively minimal genus-one fibration, and C = f⁻¹(a) the schematic fibre over an F_q-rational point a ∈ B, with r ≥ 1 irreducible components and C_red singular. If C_ind has an unstable (additive) Kodaira symbol, then Card C(F_q) = rq + 1.

**Construction/proof outline:**

1. For a cuspidal integral fiber normalization is bijective on rational points.
2. For III subtract one shared point; for IV subtract two at the common triple point.
3. For the star types use their rational tree of components and subtract r−1 distinct rational intersections.

**Prerequisites:** `G.1/component-descent`, `G.1/canonical-type-classification`, `G.1/small-conductor-classification`.

**Acceptance:** The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3. Literal anchor: “r q + 1”. The routed statement is narrowed or corrected as specified in this node.

### G.1/count-19 — Exclusion of I₀* over F₂

**Lemma contract.** Let S be a smooth proper surface over F₂ with h⁰(O_S) = 1 and Num_{S/F₂} constant, and f: S → B a relatively minimal genus-one fibration. Then no geometric fibre of f has Kodaira symbol I₀*. A reducible geometric fibre lies over an F₂-rational point (/12). There all five components are isomorphic to P¹_{F₂} (/14), and the four terminal components would meet the central one in four distinct rational points, but Card P¹(F₂) = 3.

**Construction/proof outline:**

1. The four distinct rational intersections on the central normalized P¹ would require four points.
2. P¹(F₂) has only three points.

**Prerequisites:** `G.1/component-descent`, `G.1/canonical-type-classification`.

**Acceptance:** The count is of the whole schematic fiber; nilpotents do not change its rational-point set.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 3.2, p. 11; arXiv v3. Literal anchor: “three”. The routed statement is narrowed or corrected as specified in this node.

### G.1/lang-genus-one — Finite-field genus-one torsors have points

**Lemma contract.** Every smooth proper geometrically connected genus-one curve over F_q has an F_q-point: it is a torsor under its smooth connected Jacobian, and Lang’s theorem kills that torsor.

**Construction/proof outline:**

1. Use the genuine Jacobian torsor structure.
2. Apply surjectivity of x↦x⁻¹Frob_q(x) and the Frobenius descent argument of Lang Theorem2 to obtain a fixed point.

**Prerequisites:** `AlgebraicModuliForArithmeticGeometry:A0-extension`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** For a disconnected finite constant group the general torsor conclusion can fail.

**Source:** [Serge Lang](https://wstein.org/papers/bib/Lang-Algebraic_Groups_Over_Finite_Fields.pdf), Theorem1, corollary and Theorem2 with proofs, pp556–558. Literal anchor: “Then H has a rational point.”. Use a smooth connected algebraic group, not an arbitrary disconnected group.

### G.1/finite-field-p1-forms — Finite-field forms of the projective line

**Lemma contract.** A smooth proper geometrically genus0 curve over F_q is isomorphic to P¹_Fq. More generally, over any field, such a curve with a line bundle of degree1 is isomorphic to P¹.

**Construction/proof outline:**

1. Use Lang Theorem1/2 for the smooth connected group PGL₂, with the general-group source-proof gap recorded; the genus-one consumer alone does not supply this statement.
2. For the degree1 version use Riemann–Roch to obtain two sections and a degree1 morphism to P¹, then finite degree1 normality gives the isomorphism.

**Prerequisites:** `AlgebraicModuliForArithmeticGeometry:R09.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** Do not apply Tsen over F_q(t) to prove this finite-field statement.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 3.1, p. 11; proof of Theorem 5.6(iii), p. 17; arXiv v3. Literal anchor: “projective line”. The routed statement is narrowed or corrected as specified in this node.

### G.1/E1 — Elliptic curve E1 over F₂

**Lemma contract.** The smooth projective Weierstrass curve y²+y=x³+x²+1 over F₂ has cyclic rational-point group of order 1, j=0, and is supersingular.

**Construction/proof outline:**

1. Identify this source equation with F2Model at index 0.
2. Use the separate model discriminant, point-count, j and cyclic point-group declarations, including the explicit native point cycles.
3. Use the still-requested geometric ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-discriminants`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-counts`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-j`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-point-groups`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

The inherited typed upstream imports remain mathematical dependencies; their checker-encoding gap remains recorded.

**Acceptance:** The affine solution count alone is one less than the stated projective count.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3. Literal anchor: “Proposition 3.3”. The routed statement is narrowed or corrected as specified in this node.

### G.1/E2 — Elliptic curve E2 over F₂

**Lemma contract.** The smooth projective Weierstrass curve y²+xy=x³+x²+x over F₂ has cyclic rational-point group of order 2, j=1, and is ordinary.

**Construction/proof outline:**

1. Identify this source equation with F2Model at index 1.
2. Use the separate model discriminant, point-count, j and cyclic point-group declarations, including the explicit native point cycles.
3. Use the still-requested geometric ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-discriminants`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-counts`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-j`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-point-groups`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

The inherited typed upstream imports remain mathematical dependencies; their checker-encoding gap remains recorded.

**Acceptance:** The affine solution count alone is one less than the stated projective count.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3. Literal anchor: “Proposition 3.3”. The routed statement is narrowed or corrected as specified in this node.

### G.1/E3 — Elliptic curve E3 over F₂

**Lemma contract.** The smooth projective Weierstrass curve y²+y=x³ over F₂ has cyclic rational-point group of order 3, j=0, and is supersingular.

**Construction/proof outline:**

1. Identify this source equation with F2Model at index 2.
2. Use the separate model discriminant, point-count, j and cyclic point-group declarations, including the explicit native point cycles.
3. Use the still-requested geometric ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-discriminants`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-counts`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-j`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-point-groups`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

The inherited typed upstream imports remain mathematical dependencies; their checker-encoding gap remains recorded.

**Acceptance:** The affine solution count alone is one less than the stated projective count.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3. Literal anchor: “Proposition 3.3”. The routed statement is narrowed or corrected as specified in this node.

### G.1/E4 — Elliptic curve E4 over F₂

**Lemma contract.** The smooth projective Weierstrass curve y²+xy=x³+x over F₂ has cyclic rational-point group of order 4, j=1, and is ordinary.

**Construction/proof outline:**

1. Identify this source equation with F2Model at index 3.
2. Use the separate model discriminant, point-count, j and cyclic point-group declarations, including the explicit native point cycles.
3. Use the still-requested geometric ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-discriminants`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-counts`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-j`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-point-groups`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

The inherited typed upstream imports remain mathematical dependencies; their checker-encoding gap remains recorded.

**Acceptance:** The affine solution count alone is one less than the stated projective count.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3. Literal anchor: “Proposition 3.3”. The routed statement is narrowed or corrected as specified in this node.

### G.1/E5 — Elliptic curve E5 over F₂

**Lemma contract.** The smooth projective Weierstrass curve y²+y=x³+x² over F₂ has cyclic rational-point group of order 5, j=0, and is supersingular.

**Construction/proof outline:**

1. Identify this source equation with F2Model at index 4.
2. Use the separate model discriminant, point-count, j and cyclic point-group declarations, including the explicit native point cycles.
3. Use the still-requested geometric ordinary/supersingular comparison from EllipticCurves Layer3; j=0 alone is not defined to mean supersingular.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-discriminants`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-counts`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-j`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-point-groups`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

The inherited typed upstream imports remain mathematical dependencies; their checker-encoding gap remains recorded.

**Acceptance:** The affine solution count alone is one less than the stated projective count.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3. Literal anchor: “Proposition 3.3”. The routed statement is narrowed or corrected as specified in this node.

### G.1/five-f2-classes — Five elliptic classes over F₂

**Theorem contract.** Every elliptic curve over F₂ is isomorphic over F₂ to exactly one of the five specified E_i; its point count i determines its class.

**Construction/proof outline:**

1. Import from SF.3 the exact Weierstrass presentation of a pointed smooth proper geometrically connected genus-one curve over F₂, with its scheme model and rational-point comparison. A docstring about equations is not this export.
2. Apply the complete native coefficient classifier and its sixteen explicit forward changes.
3. Use the SF.3 curve dictionary and projective realization of admissible changes, preserving infinity, to obtain curve isomorphisms. The five counts prove unique class index. Group isomorphisms of rational points alone are not curve isomorphisms.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/E1`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/E2`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/E3`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/E4`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/E5`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-count-classifier`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

The inherited typed upstream imports remain mathematical dependencies; their checker-encoding gap remains recorded.

**Acceptance:** Isogeny and isomorphism are generally different; the count criterion here is special to F₂.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 3.3, p. 11; arXiv v3. Literal anchor: “five”. The routed statement is narrowed or corrected as specified in this node.

## G.2 — Multiple fibers over excellent discrete valuation rings

Over an excellent henselian DVR, the transverse horizontal divisor meets the reduced special fiber in Spec k. Its schematic special fiber has length m when X_k=m(X_k)_red. Confusing those intersections loses ramification. Excellence supplies finite normalization; normality, generic geometric integrality, properness and Stein factorization are checked before applying Raynaud (N)* and the section criterion. The resulting dominating special fiber has H⁰=H¹=k because χ=0.

Every component dominating an elliptic curve contributes at least one dimension of H¹. The one-dimensional total H¹ forces a unique such component, also the strict transform of the smooth good-reduction elliptic fiber. This gives an isogeny over the unchanged residue field. The passage from an arbitrary excellent DVR to its henselization is a separately recorded adapter, not an implicit extension of the henselian theorem. Over finite fields isogeny gives all extension counts, and over F₂ the five-class criterion gives an isomorphism of the reduced fibers.

LLR6.6 compares torsor and Jacobian Kodaira types only under its algebraically closed residue-field hypothesis. Its result is mT for period m, after discriminant and rank/component comparisons. The2018 corrigendum changes other Picard/Lie formulas, not this hypothesis. Finite-field nonsplit descent is handled in G.1 and is not deduced by dropping that hypothesis.

**Stage imports:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1`, `NeronModelsAndSemistableAbelianVarieties:R11.2`, `NeronModelsAndSemistableAbelianVarieties:R11.4`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.3`.

### G.2/transverse-divisor — Transverse horizontal DVR divisor

**Theorem contract.** For the proper regular genus-one model over an excellent henselian DVR R used in Proposition 8.1, whose special fiber is m times a smooth reduced elliptic curve, construct at a rational point d of that reduced fiber a regular horizontal Cartier divisor D finite over R and itself the spectrum of a DVR with residue field k, such that D intersects the reduced fiber in Spec k. The schematic fiber D⊗_R k has length m; only D∩(X_k)_red is Spec k.

**Construction/proof outline:**

1. Choose a lift of a parameter transverse to the reduced smooth elliptic fiber at d.
2. The quotient of the regular two-dimensional local ring by that parameter is a DVR; the uniformizer of R has order m there.
3. Choose the henselian finite horizontal component through d using EGAIV4 18.5.11(c); properness plus quasi-finiteness makes it finite over R.

**Prerequisites:** `tauceti:TauCeti.Model`, `G.1/fiber-type-divisor`, `SchemeAndStackFoundations:SF.0`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** For m>1 the special fiber is nonreduced of length m, even though the residue extension has degree1.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Schröer Proposition 8.1 proof, pp. 21–22, using EGA IV₄ 18.5.11(c); arXiv v3. Literal anchor: “effective Cartier divisor”. The routed statement is narrowed or corrected as specified in this node.

### G.2/normal-dominating-model — Normal model after transverse base change

**Lemma contract.** After the transverse DVR base change R′/R, normalize the model and take a normal proper model Y dominating it and the elliptic scheme E_R′, with their identified generic fibers. A section of the base-changed model lifts to Y.

**Hypotheses:** R excellent henselian; D=Spec R′ as in the transverse-divisor node.

**Construction/proof outline:**

1. Excellence gives finiteness of normalization, so the normalized model remains proper.
2. Take the normalized closure of the graph of the generic isomorphism; use properness to extend the generic section along Spec R′.
3. Use integrality and torsion-freeness over a DVR for flatness; prove generic geometric integrality and f_*O_Y=O_R′ by normality and Stein factorization.

**Prerequisites:** `G.2/transverse-divisor`, `tauceti:TauCeti.Model`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** The base-changed model may be nonnormal; a claimed section cannot remove normalization.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Schröer Proposition 8.1 proof, pp. 21–22; Raynaud 6.1.4 and 8.2.1; arXiv v3. Literal anchor: “normal scheme”. The routed statement is narrowed or corrected as specified in this node.

### G.2/cohomology-adapter — Cohomological flatness and genus of the dominating fiber

**Lemma contract.** For that Y→Spec R′ verify Raynaud (N)* and f_*O_Y=O_R′. The lifted section gives cohomological flatness in degree0. Its special fiber C has dim_k H⁰(C,O)=1 and, since χ(O_C)=χ(O_generic)=0, dim_k H¹(C,O)=1.

**Construction/proof outline:**

1. Check local Noetherian normality and the generic-fiber condition of Raynaud6.1.4 (N)* on Y; use the preceding node for the Stein condition.
2. Apply the owner’s Raynaud8.2.1 criterion with the lifted section.
3. Use proper flat Euler-characteristic constancy, finite-dimensionality and degree≥2 vanishing; solve h⁰−h¹=0.

**Prerequisites:** `G.2/normal-dominating-model`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A section alone is not a proof of every hypothesis of Raynaud’s criterion.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Schröer Proposition 8.1 proof, pp. 21–22; Raynaud 6.1.4 and 8.2.1; arXiv v3. Literal anchor: “cohomologically flat”. The routed statement is narrowed or corrected as specified in this node.

### G.2/domination-genus — Genus under domination of an elliptic curve

**Lemma contract.** For any field k, an integral proper k-curve C with a dominant morphism to an elliptic curve E/k satisfies h¹(O_C)≥1.

**Construction/proof outline:**

1. A nonconstant proper map of integral curves is finite of positive degree d.
2. Pullback and the divisor norm compose as multiplication by d on Pic⁰(E).
3. If h¹(O_C)=0 the connected Picard object is trivial, whereas E has geometric points outside E[d]; derive the contradiction.

**Prerequisites:** `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.5`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** The norm argument covers inseparable maps; do not invoke a separable Hurwitz formula without its hypothesis.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Lemma 8.4, pp. 23–24; arXiv v3. Literal anchor: “h1 (OC ) ≥ 1”. The routed statement is narrowed or corrected as specified in this node.

### G.2/equality-regular — Regularity in the genus-one equality case

**Lemma contract.** In the preceding situation, h¹(O_C)=1 implies that C is regular.

**Construction/proof outline:**

1. Normalize C; its normalization still dominates E and has h¹≥1 by the domination-genus node.
2. Use the normalization exact sequence and compare H¹, including its vector-space structure over the normalization constant field.
3. The equality h¹=1 forces that field to equal k and the delta quotient to vanish, so C is normal and hence regular.

**Prerequisites:** `G.2/domination-genus`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** Track both constant fields; equality of arithmetic genera without that argument is insufficient.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Lemma 8.4, pp. 23–24; arXiv v3. Literal anchor: “C is regular”. The routed statement is narrowed or corrected as specified in this node.

### G.2/unique-dominating-component — Unique component dominating the reduced fiber

**Lemma contract.** In the special fiber C of Y, exactly one reduced strict-transform component dominates X_k,red, and it is the strict transform of E_k. That component is isomorphic to E_k.

**Construction/proof outline:**

1. Use the special-fiber map to the reduced curve and the normal birational model to obtain at least one dominating component.
2. Restriction from C onto the union of those reduced components has zero-dimensional cokernel, so its H¹ map onto their direct sum is surjective.
3. Each contributes h¹≥1, while h¹(C)=1. Thus only one exists. Repeat with the strict transform of E_k; the positive-genus component is the same, and birationality to the smooth E_k gives the isomorphism.

**Prerequisites:** `G.2/normal-dominating-model`, `G.2/cohomology-adapter`, `G.2/domination-genus`, `G.2/equality-regular`, `SchemeAndStackFoundations:SF.3`.

**Acceptance:** Contracted rational exceptional components are allowed; only dominating components are counted.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 8.1, pp. 21–22; arXiv v3. Literal anchor: “r = 1”. The routed statement is narrowed or corrected as specified in this node.

### G.2/multiple-fiber-isogeny — Multiple-fiber isogeny

**Theorem contract.** Let R be an excellent DVR with fraction field F and residue field k, let E/R be an elliptic scheme, and let X/R be the relatively minimal regular model of a torsor under E_F whose reduced special fiber is an elliptic curve. The elliptic curves E_k and (X_k)_red are isogenous over k.

**Construction/proof outline:**

1. Use the inverse of the unique-component isomorphism E_k→C₁ and its finite dominant map to X_k,red.
2. Translate the image of the origin to the origin; the resulting pointed map between elliptic curves is an isogeny.

**Prerequisites:** `G.2/unique-dominating-component`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** No equality of the multiple schematic fiber with E_k is asserted.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 8.1, pp. 21–22; arXiv v3. Literal anchor: “isogeneous”. The routed statement is narrowed or corrected as specified in this node.

### G.2/extension-counts — Counts over every finite residue extension

**Lemma contract.** Let R be an excellent DVR with fraction field F and residue field k, let E/R be an elliptic scheme, and let X/R be the relatively minimal regular model of a torsor under E_F whose reduced special fiber is an elliptic curve. If k=F_q, then #E_k(F_{q^r})=#X_k(F_{q^r}) for every r≥1.

**Construction/proof outline:**

1. Apply the imported isogeny⇒all-extension-counts theorem.
2. The schematic fiber and its reduction have the same field-valued points.

**Prerequisites:** `G.2/multiple-fiber-isogeny`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** The F₂ isomorphism conclusion is not asserted over every finite field.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Corollary 8.2, p. 23; arXiv v3. Literal anchor: “Corollary”. The routed statement is narrowed or corrected as specified in this node.

### G.2/f2-isomorphism — Multiple-fiber isomorphism over F₂

**Lemma contract.** Let R be an excellent DVR with fraction field F and residue field k, let E/R be an elliptic scheme, and let X/R be the relatively minimal regular model of a torsor under E_F whose reduced special fiber is an elliptic curve. If k=F₂, then E_k≅(X_k)_red over F₂.

**Construction/proof outline:**

1. Combine equal F₂ point counts with the five-class count criterion.

**Prerequisites:** `G.2/multiple-fiber-isogeny`, `G.1/five-f2-classes`.

**Acceptance:** The F₂ isomorphism conclusion is not asserted over every finite field.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Corollary 8.3, p. 23; arXiv v3. Literal anchor: “Corollary”. The routed statement is narrowed or corrected as specified in this node.

### G.2/diagonal-quotient-example — Diagonal quotient multiple-fiber example

**Lemma contract.** Let R contain a residue-field representative k, let A/k be an abelian variety, G⊂A(k) a finite subgroup, and F′/Frac R a G-Galois extension whose integral closure R′ has the same residue field k. The free diagonal action gives X=(A×Spec R′)/G, with generic fiber a form of A and reduced special fiber A/G.

**Hypotheses:** Assume R excellent so integral closure R′ is finite, and use the specified free finite constant action; existence of the quotient and descent are required.

**Construction/proof outline:**

1. Translation by a nonzero element of G has no fixed geometric point on A, giving a free diagonal action.
2. Apply effective quotient/descent to A×Spec R′; the reduced special fiber is A/G.
3. Compute the generic descent cocycle and the schematic special-fiber multiplicity from the totally ramified extension.

**Prerequisites:** `AlgebraicModuliForArithmeticGeometry:R09.3`, `NeronModelsAndSemistableAbelianVarieties:R11.2`, `SchemeAndStackFoundations:SF.1`.

**Acceptance:** Take an elliptic A and a nontrivial totally ramified extension to obtain a genuine multiple fiber.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), §8, p. 23; arXiv v3. Literal anchor: “diagonal action”. The routed statement is narrowed or corrected as specified in this node.

### G.2/llr-kodaira-comparison — Geometric torsor Kodaira comparison

**Theorem contract.** Let R be a DVR with algebraically closed residue field, C/K a smooth geometrically connected genus-one curve of period m, E/K its Jacobian, and X,E_min their proper regular minimal models. If E_min has Kodaira type T, then X has type mT.

**Construction/proof outline:**

1. Use the owner’s comparison of discriminants of minimal regular genus-one and Jacobian models over perfect residue fields.
2. Use equality of abelian and toric ranks, geometric component group and component count, then distinguish the Kodaira possibilities as in LLR6.6.
3. Recover the common fiber multiplicity as the torsor period over the strictly henselian algebraically closed residue field.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarieties:R11.2`, `NeronModelsAndSemistableAbelianVarieties:R11.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** Finite-field nonsplit I₁/I₂ require their own geometric descent nodes.

**Source:** [Qing Liu, Dino Lorenzini, Michel Raynaud](https://www.math.u-bordeaux.fr/~qliu/articles/LLR.pdf), Theorem6.6 and Remark6.8, pp495–497. Literal anchor: “Theorem 6.6.”. Only algebraically closed residue fields; separably closed imperfect fields and nonclosed perfect fields are explicitly excluded.

**Source:** [Qing Liu, Dino Lorenzini, Michel Raynaud](https://www.math.u-bordeaux.fr/~qliu/articles/CorrigendumToNeronModelsLieAlg.pdf), Introduction and corrected Thm4.3, pp593–595. Literal anchor: “Pic0”. Do not identify generic Picard classes with all Jacobian rational points; the correction does not remove the6.6 residue hypothesis.

## G.3 — Rational Jacobians and global Weierstrass equations

Write R¹f_*O=L⊕T. The canonical formula uses the Hodge line L⁻¹ and a multiple-fiber correction ΣaᵢFᵢ with0≤aᵢ<mᵢ. Its degree is χ(O_S)+length(T), with the Euler characteristic of the total space. A torsion fiber dimension generally measures the number of generators, not its module length. Raynaud’s multiplicity/order theorem is required for the tame/wild equivalence. In the rational Jacobian case χ=1, T=0 and the section excludes multiple fibers, giving ω_J=f*O(−1) and O²=−1.

The geometric Picard lattice has rank10, odd unimodular form and signature(1,9). The fiber/section plane has Gram matrix[[0,1],[1,−1]], hence is itself odd unimodular. Its orthogonal complement W is even negative definite unimodular of rank8. Geometry identifies these forms with the existing lattice carriers. The generic Picard restriction has vertical kernel, including base Picard classes; Shioda–Tate generation on P¹ uses the actual Jacobian section to avoid the Picard obstruction.

For n>0, positive section twists have R¹f_*O(nO)=0 and rank n. At n=0 the rank is1. The rank-three splitting is O⊕O(−2)⊕O(−3). Its relative cubic contracts vertical components disjoint from O. O_J(3O) has degree0 there and is therefore not relatively very ample on the regular model. Relative very ampleness belongs to the contracted cubic. The inverse chart gives the weight bounds. Necessary coefficient nondegeneracy conditions do not establish all-place minimality. The non-smooth regular generic case needs the explicit quasielliptic extension, beyond the existing smooth-curve model supplier. Tsen’s theorem is restricted to algebraically closed constants; Br(F₂(t)) does not vanish.

**Stage imports:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.2`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

### G.3/canonical-bundle — Canonical bundle formula

**Theorem contract.** Let f:S→B be a relatively minimal genus-one fibration of a smooth proper surface over an algebraically closed field, with multiple fibers m_iF_i. Write R¹f_*O_S=L⊕T with L invertible and T torsion. Then ω_S≅f*(ω_B⊗L^{−1})⊗O_S(Σa_iF_i) with 0≤a_i≤m_i−1, a_i=m_i−1 for every tame multiple fiber, and deg L^{−1}=χ(O_S)+length(T).

**Construction/proof outline:**

1. Apply relative duality to split R¹f_*O into its rank-one quotient L and torsion T and construct the evaluation f*L⁻¹→ω_relative.
2. Use the vertical intersection radical to write its effective zero divisor as Σa_iF_i.
3. Bound0≤a_i<m_i by the pushforward equality; determine the tame coefficient by normal-bundle adjunction.

**Prerequisites:** `G.1/genus-one-fibration`, `G.1/fiber-type-divisor`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** The relative formula becomes absolute after tensoring by f*ω_B.

**Source:** [Enrico Bombieri and David Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf), §1 Theorem2 and proof, pp27–30. Literal anchor: “Theorem 2”. Source-specific canonical bundle formula; do not assume cohomological flatness at wild fibers.

### G.3/canonical-degree — Degree of the genus-one Hodge line

**Lemma contract.** In the canonical-bundle setting, deg L⁻¹=χ(O_S)+length(T).

**Construction/proof outline:**

1. Use Leray to write χ(O_S)=χ(O_B)−χ(L)−length(T).
2. Apply Riemann–Roch on B, χ(L)=deg L+χ(O_B), and cancel the base contribution.

**Prerequisites:** `G.3/canonical-bundle`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** For a rational surface with T=0, L≅O_P¹(−1).

**Source:** [Enrico Bombieri and David Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf), Theorem2(iii), pp27–28. Literal anchor: “deg L”. The Euler characteristic on the total space enters the degree formula.

### G.3/tame-wild — Tame and wild multiplicity comparison

**Lemma contract.** For a multiple fiber mF, the finite order ν of O_F(F) divides m and a+1. The fiber is tame iff ν=m iff its point is outside supp T; m/ν is a power of the residue characteristic. If H¹(O_S)=0, then T=0 and all fibers are tame.

**Construction/proof outline:**

1. Apply the thickening exact sequences in Bombieri–Mumford Proposition4 to compare the first nontrivial H⁰ jump with ν.
2. Use the Raynaud multiplicity/order theorem for the characteristic-power quotient and tame equivalence.
3. Use the Leray injection H⁰(T)⊂H⁰(R¹f_*O) and H¹(O_S)=0 to force T=0.

**Prerequisites:** `G.3/canonical-bundle`, `G.3/canonical-degree`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `SchemeAndStackFoundations:SF.3`.

**Acceptance:** No claim that every fiber with reduced support is tame; multiplicity and torsion must be retained.

**Source:** [Enrico Bombieri and David Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf), §1 Proposition4 and following discussion, pp29–30. Literal anchor: “Proposition 4”. The general normal-bundle order theorem is not proved by the displayed divisibility alone.

### G.3/rational-canonical — Canonical sheaf and section on a rational Jacobian

**Theorem contract.** Let J/k be a smooth geometrically rational surface with a relatively minimal Jacobian genus-one fibration φ:J→P¹ and zero-section E. ω_J=φ*O(-1), E²=−1, and ω_{J/P¹}=φ*O(1).

**Construction/proof outline:**

1. Rationality gives χ(O_J)=1 and H¹(O_J)=0, so T=0.
2. The section gives fiber multiplicity1, hence no correction divisor; canonical-degree gives L=O(−1).
3. Tensor relative/absolute dualizing sheaves and apply adjunction to the section P¹ to get E²=−1.

**Prerequisites:** `G.3/canonical-bundle`, `G.3/canonical-degree`, `G.3/tame-wild`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** The formula remains geometric under descent over the original field; retain the chosen fibration.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 6.1 proof, p. 18; arXiv v3. Literal anchor: “ω”. The routed statement is narrowed or corrected as specified in this node.

### G.3/rational-picard-lattice — Geometric Picard lattice of a rational elliptic surface

**Lemma contract.** Over algebraic closure, Num(J) has rank10, is odd unimodular and has signature(1,9). It is represented by the existing IntegralLattice carrier via the actual geometric intersection pairing.

**Hypotheses:** J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one fibration f:J→P¹_k and its zero-section O; geometric lattice assertions are after extension to an algebraic closure.

**Construction/proof outline:**

1. Use K²=0 and rational-surface blowup classification: a minimal P² model requires nine blowups, or reduce a ruled minimal model to that case.
2. Apply the blowup Picard decomposition with exceptional square−1 to prove rank and unimodularity.
3. Use Hodge index for the signature; do not replace the geometric lattice by a freely assumed rank10 module.

**Prerequisites:** `G.3/rational-canonical`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCeti.IntegralLattice`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** For the nine-blowup model the diagonal Gram matrix is(1,−1,…,−1).

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 6.1, p. 18; proof of Corollary 7.3, p. 21; proof of Proposition 9.5, p. 27; arXiv v3. Literal anchor: “unimodular”. The routed statement is narrowed or corrected as specified in this node.

### G.3/fiber-section-plane — Unimodular fiber–section plane

**Lemma contract.** For F a geometric fiber and O the section, F²=0,F·O=1,O²=−1, so span(F,O) has Gram[[0,1],[1,−1]] and splits integrally as an orthogonal summand of Num(J).

**Hypotheses:** J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one fibration f:J→P¹_k and its zero-section O; geometric lattice assertions are after extension to an algebraic closure.

**Construction/proof outline:**

1. Compute the three intersections using the section and rational-canonical node.
2. The determinant is−1, so the inverse matrix is integral; use it to project every divisor class onto span(F,O).

**Prerequisites:** `G.3/rational-picard-lattice`, `G.3/rational-canonical`, `tauceti:TauCeti.IntegralLattice.IsUnimodular`, `SchemeAndStackFoundations:SF.5`.

**Acceptance:** This plane is odd; it is not the even hyperbolic plane in the basis(F,O).

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5 proof, p. 27; arXiv v3. Literal anchor: “Gram matrix”. The routed statement is narrowed or corrected as specified in this node.

### G.3/generic-picard-restriction — Generic Picard restriction with vertical kernel

**Lemma contract.** Let f:S→B be a proper flat morphism from a regular integral noetherian surface to a regular integral one-dimensional base with f_*O_S=O_B, and K the function field of B. Then restriction Pic(S)→Pic(S_K) is surjective, and its kernel is generated by f*Pic(B) and the classes O_S(C) of the irreducible components C of closed fibres.

**Construction/proof outline:**

1. Represent a generic line bundle by a divisor and take its closure in the regular total surface; codimension1 regularity makes it Cartier.
2. If the restriction is principal, extend its rational function and subtract its divisor; the remainder is vertical.
3. Record pullbacks from Pic(B) inside the vertical kernel, including their torsion.

**Prerequisites:** `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** For a general base B the kernel cannot be generated by one chosen fiber; Pic(B) may have nontrivial degree-zero classes.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 9.3(v), p. 25; proofs of Propositions 12.2 and 12.3, pp. 42–43; arXiv v3. Literal anchor: “Pic”. The routed statement is narrowed or corrected as specified in this node.

### G.3/shioda-tate — Geometric Shioda–Tate generation

**Lemma contract.** Over an algebraically closed field, for a regular relatively minimal Jacobian genus-one fibration over P¹, Pic(S) is generated by O,F, the vertical components disjoint from O, and the section classes. The quotient by O,F and vertical components is the actual generic Pic⁰ group, identified with the section group of the Jacobian.

**Construction/proof outline:**

1. Apply generic restriction and split the degree by O of degree1.
2. A generic degree-zero line bundle corresponds to a Jacobian rational point because the chosen origin kills the Brauer obstruction.
3. Extend that point to a section by properness/minimal-model theory; use vertical relations to eliminate the component meeting O.

**Prerequisites:** `G.3/generic-picard-restriction`, `G.1/genus-one-fibration`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** The genus-one torsor version uses a horizontal divisor of index d and only actual Pic⁰ classes; it does not identify all Picard-functor rational points without obstruction control.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 9.3(v), p. 25; after Theorem 9.4, p. 26; arXiv v3. Literal anchor: “generated”. The routed statement is narrowed or corrected as specified in this node.

### G.3/even-complement — Even rank-eight complement

**Theorem contract.** Let J/k be a smooth geometrically rational surface with a relatively minimal Jacobian genus-one fibration φ:J→P¹ and zero-section E. Over an algebraic closure, the orthogonal complement W of the fiber F and zero-section O in Num(Jbar) is even unimodular of rank 8; it is generated by vertical components disjoint from O and (P−O)−(1+P·O)F for sections P. The pairing is negative definite, so the abstract comparison is with E₈ with its sign reversed.

**Hypotheses:** J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one fibration f:J→P¹_k and its zero-section O; geometric lattice assertions are after extension to an algebraic closure.

**Construction/proof outline:**

1. Use the fiber–section splitting and rank10 to get rank8 and unimodularity.
2. Use geometric Shioda–Tate to generate W by vertical classes away from O and (P−O)−(1+P·O)F.
3. Compute their norms as−2 or−2−2(P·O); mixed terms are doubled, hence all norms are even.
4. Hodge index on the complement of a positive vector in the fiber–section plane gives negative definiteness.

**Prerequisites:** `G.3/fiber-section-plane`, `G.3/shioda-tate`, `tauceti:TauCeti.IntegralLattice`, `tauceti:TauCeti.IntegralLattice.IsUnimodular`, `tauceti:TauCeti.IntegralLattice.IsEven`, `SchemeAndStackFoundations:SF.5`.

**Acceptance:** The restriction W→a fiber root-lattice dual is not an isometry.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5 proof, p. 27; arXiv v3. Literal anchor: “even”. The routed statement is narrowed or corrected as specified in this node.

### G.3/bounded-weierstrass — Degree-bounded Weierstrass equations

**Definition contract.** A bounded Weierstrass equation over k is an existing WeierstrassCurve k[t] together with natDegree a₁≤1,a₂≤2,a₃≤3,a₄≤4,a₆≤6. No smoothness, global minimality or surface rationality is asserted by this coefficient carrier. The reverse chart coefficient is Σ_{n=0}^i coeff(a_i,n)s^(i−n).

**Construction/proof outline:**

1. Refine the existing coefficient structure by five concrete degree bounds.
2. Define the inverse-chart polynomial by coefficient reversal in its specified weight.

**Prerequisites:** `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

| Consumer | Required use |
| --- | --- |
| Schröer §6 and Theorems10.4–10.5 | All finite searches are performed on this21-bit coefficient carrier. |
| CDL2024 §4.4 | The weight records the transition of the global relative cubic. |

| Proposed API name | Role | Exact contract |
| --- | --- | --- |
| BoundedWeierstrass.toCurve | projection | The underlying equation is the existing WeierstrassCurve k[t]. |
| BoundedWeierstrass.chart | data | The chart has coefficients sⁱa_i(1/s), as the finite reversal sum. |
| BoundedWeierstrass.chart_chart | simp | Applying the same weight reversal twice gives the original coefficient tuple. |
| BoundedWeierstrass.ext | extensionality | Equality of the five coefficients implies equality of bounded equations. |
| BoundedWeierstrass.discriminant_chart | compatibility | The chart discriminant equals the weight12 reversal of the original discriminant. |

| Unit test name | Kind | Statement that the definition must satisfy |
| --- | --- | --- |
| BoundedWeierstrass.constant_term | computation | The coefficient a₁=1 becomes s, not1, on the second chart. |
| BoundedWeierstrass.top_degree | computation | The coefficient a₆=t⁶ becomes1 on the second chart. |
| BoundedWeierstrass.zero | degenerate | All five zero coefficients satisfy the bounds but have Δ=0, so this carrier does not certify an elliptic curve. |
| BoundedWeierstrass.involution | characterisation | Every coefficient of weight i is recovered by a second reversal. |

**Acceptance:** The coefficient a₁=1 becomes s, not1, on the second chart. The coefficient a₆=t⁶ becomes1 on the second chart. All five zero coefficients satisfy the bounds but have Δ=0, so this carrier does not certify an elliptic curve. Every coefficient of weight i is recovered by a second reversal.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 6.1, p. 18 (statement and proof both on p. 18); arXiv v3. Literal anchor: “deg”. The routed statement is narrowed or corrected as specified in this node.

### G.3/positive-section-cohomology — Positive section twist cohomology

**Lemma contract.** For n>0 on a rational Jacobian, R¹f_*O(nO)=0 and f_*O(nO) has rank n. In particular f_*O(O)=O_P¹.

**Hypotheses:** J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one fibration f:J→P¹_k and its zero-section O; geometric lattice assertions are after extension to an algebraic closure.

**Construction/proof outline:**

1. On a fiber, Serre duality reduces H¹(O(nO)) to H⁰(O(−nO)).
2. For n=1 the evaluation at the smooth section point is nonzero on the one-dimensional H⁰(O); for higher n use the section exact sequence.
3. Use cohomology and base change and Riemann–Roch to get rank n; exclude n=0 from that rank formula.

**Prerequisites:** `G.3/rational-canonical`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** At n=0, f_*O=O has rank1, not0.

**Source:** [François Cossec, Igor Dolgachev, Christian Liedtke](https://sites.lsa.umich.edu/idolga/wp-content/uploads/sites/1334/2024/08/EnriquesOne.pdf), Lemma4.4.1 and proof, pp394–396. Literal anchor: “If 𝑖 > 0 and 𝑛 > 0”. Correct part(2) to n>0; n=0 has rank1.

### G.3/pushforward-splitting — Weierstrass rank-three splitting

**Lemma contract.** Let J/k be a smooth geometrically rational surface with a relatively minimal Jacobian genus-one fibration φ:J→P¹ and zero-section E. φ_*O_J(3E)≅O⊕O(-2)⊕O(-3); the relative Proj construction gives the cubic equation of the Weierstrass model.

**Construction/proof outline:**

1. The section exact sequences give successive quotients O(−2),O(−3), after the initial O.
2. Compute the relevant Ext¹ by H¹ of positive-degree line bundles on P¹, hence both extensions split.

**Prerequisites:** `G.3/positive-section-cohomology`, `G.3/rational-canonical`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** For a general higher-genus base those Ext¹ groups need not vanish.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 6.1, p. 18; arXiv v3. Literal anchor: “O”. The routed statement is narrowed or corrected as specified in this node.

### G.3/relative-cubic-contraction — Relative cubic contraction

**Theorem contract.** The complete relative linear series O_J(3O) maps J to a normal cubic Z⊂P(O⊕O(−2)⊕O(−3)), contracting exactly the vertical components disjoint from O. O_Z(3O) is relatively very ample; O_J(3O) is not relatively very ample when such components exist.

**Hypotheses:** J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one fibration f:J→P¹_k and its zero-section O; geometric lattice assertions are after extension to an algebraic closure.

**Construction/proof outline:**

1. Use positive-section-cohomology to construct the rank3 evaluation map and the relative morphism.
2. Compute its restriction to each fiber: components of degree0 are contracted; degree3 on the genus-one contraction gives a cubic embedding.
3. Use the source Weierstrass contraction/normality theorem to identify the image with the minimal cubic.

**Prerequisites:** `G.3/pushforward-splitting`, `G.3/positive-section-cohomology`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `SchemeAndStackFoundations:SF.4`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A component disjoint from O has degree0 under O_J(3O), obstructing very ampleness on J.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 6.1, p. 18 (statement and proof both on p. 18); arXiv v3. Literal anchor: “Weierstraß”. The routed statement is narrowed or corrected as specified in this node.

### G.3/global-chart-equation — Global equation and inverse chart

**Lemma contract.** The rational Jacobian cubic has an equation in the bounded coefficient carrier; with s=1/t, x′=s²x,y′=s³y, its second chart is a_i′(s)=sⁱa_i(1/s).

**Hypotheses:** J is a smooth projective geometrically rational surface over k with a relatively minimal Jacobian genus-one fibration f:J→P¹_k and its zero-section O; geometric lattice assertions are after extension to an algebraic closure.

**Construction/proof outline:**

1. Choose split generators with pole weights2,3 at O and compare their degree6 relation.
2. Identify each coefficient as a section of O(i); polynomial degree is at most i.
3. Substitute x=s⁻²x′,y=s⁻³y′ and multiply the equation by s⁶ to obtain all five weights.

**Prerequisites:** `G.3/relative-cubic-contraction`, `G.3/pushforward-splitting`, `G.3/bounded-weierstrass`, `SchemeAndStackFoundations:SF.4`.

**Acceptance:** The transition uses s=1/t; no division of a polynomial in the same coordinate is called the second-chart polynomial.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 6.1, p. 18 (statement and proof both on p. 18); arXiv v3. Literal anchor: “t−1”. The routed statement is narrowed or corrected as specified in this node.

### G.3/coefficient-nondegeneracy — Coefficient nondegeneracy on two charts

**Lemma contract.** Let J/k be a smooth geometrically rational surface with a relatively minimal Jacobian genus-one fibration φ:J→P¹ and zero-section E. In such a degree-bounded Weierstrass equation some a_i is nonconstant and some a_i is not divisible by t^i; these conditions survive degree-preserving admissible coordinate changes.

**Construction/proof outline:**

1. If all coefficients are constant, positive-degree reversal makes every second-chart coefficient divisible by its weight power, contradicting global minimality.
2. If each a_i is divisible by tⁱ, the t-chart is nonminimal at0.
3. Admissible transformations preserving the global line-bundle weights preserve the obstruction.

**Prerequisites:** `G.3/global-chart-equation`, `G.3/bounded-weierstrass`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** These necessary conditions alone do not establish minimality at every closed point.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), remark after Proposition 6.1, pp. 18–19; arXiv v3. Literal anchor: “non-constant”. The routed statement is narrowed or corrected as specified in this node.

### G.3/quasielliptic-characteristic — Quasielliptic characteristic and characteristic-two types

**Theorem contract.** Quasi-elliptic fibrations exist only in characteristics 2 and 3. For a quasi-elliptic fibration φ:S→P¹ of a smooth projective surface over an algebraically closed field of characteristic 2, every fiber is irreducible cuspidal (type II) or reducible of type III, I*_{2n}, III* or II* (with 2, 2n+5, 8 and 9 components), and the Mordell–Weil group of the jacobian is killed by 2. Hence ρ(S)=2+Σ_b(r_b−1), r_b the number of components of the fiber over b; for ρ(S)=10 this gives Σ_b(r_b−1)=8.

**Construction/proof outline:**

1. Use regular genus-one geometric genus change to restrict characteristic to2 or3.
2. For characteristic2 import the additive-group Jacobian compactification and its geometric fiber classification.
3. Use the2-torsion section group and geometric Shioda–Tate to obtain the rank formula.

**Prerequisites:** `G.1/genus-one-fibration`, `G.1/canonical-type-classification`, `G.3/shioda-tate`.

**Acceptance:** The generic cusp is not a smooth supersingular elliptic curve.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 11.1, p. 33; arXiv v3. Literal anchor: “quasielliptic”. The routed statement is narrowed or corrected as specified in this node.

### G.3/global-minimal-jacobian — Global regular minimal Jacobian fibration

**Lemma contract.** Let B be a regular curve over a field, or the spectrum of a DVR, with function field K, and C a regular proper curve over K with H⁰(C,O_C)=K and H¹(C,O_C) of dimension one. C has a unique relatively minimal regular proper model S→B. Its jacobian — the elliptic curve Pic⁰_{C/K}, or in the quasi-elliptic case the regular compactification of the twisted form Pic⁰_{C/K} of G_a — has a unique relatively minimal regular model with a section, the jacobian fibration J→B.

**Hypotheses:** C is geometrically integral. For the DVR existence assertion assume excellence; the regular finite-type curve base is excellent. The regular nonsmooth case remains subject to the named quasielliptic source gap.

**Construction/proof outline:**

1. For smooth generic curves glue the imported unique local positive-genus minimal models along their common generic curve.
2. For a regular non-smooth generic genus-one curve, construct its regular compactification and relative minimal model with the quasielliptic Jacobian identified from its genuine Picard functor.
3. Extend the generic identity to the distinguished section by properness.

**Prerequisites:** `G.1/genus-one-fibration`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** Uniqueness here concerns positive arithmetic genus, not arbitrary genus0 minimal models.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), §6, p. 19; §8, pp. 21–22; arXiv v3. Literal anchor: “relatively minimal”. The routed statement is narrowed or corrected as specified in this node.

### G.3/tsen-obstruction — Tsen and Picard obstruction over algebraically closed constants

**Lemma contract.** For an algebraically closed field k, the field k(t) is C₁, so Br(k(t))=0. Consequently, for a proper curve C over k(t) with H⁰(C,O_C)=k(t), every k(t)-point of Pic_{C/k(t)} comes from a line bundle on C.

**Construction/proof outline:**

1. Use the C₁ theorem for the one-variable function field over an algebraically closed constant field.
2. Deduce Brauer-group vanishing and apply the Picard-functor-to-line-bundle obstruction sequence.
3. Restrict all uses to those constants, or use a section to kill the obstruction in the Jacobian application.

**Prerequisites:** `AlgebraicModuliForArithmeticGeometry:A0-extension`, `SchemeAndStackFoundations:SF.3`.

**Acceptance:** Br(F₂(t)) is not zero; the original finite-field invocation does not supply Mordell–Weil descent.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), proof of Proposition 9.3(v), p. 25; arXiv v3. Literal anchor: “Tsen’s Theorem”. The routed statement is narrowed or corrected as specified in this node.

## G.4 — Picard constancy and fiber configurations

The numerical data n_a record actual fiber counts only after splitting and incidence have been proved. For a smooth geometrically rational surface with geometric Picard rank10, the trace formula gives #J(F_q)=1+q·Tr(Frob|Num)+q². The lattice action has finite order; trace10 forces every root-of-unity eigenvalue to1 and thus trivial action. This yields Picard constancy and #J(F₂)=25. Rank10 is essential: arbitrary rational surfaces do not share this number. Count the regular resolved surface, not the singular Weierstrass cubic.

The sufficient Picard criterion retains all five source assumptions and the point sum. In particular, geometric Mordell–Weil sections must descend. The IV graph is a triangle. For I_m*, the restriction W→R* is not an isometry: the dual weight argument uses its image R+Zω, the norm−1 of the selected vector terminal and unimodularity to force ω∈W, contradicting evenness. The affine E₇/E₈ graphs have three terminal vertices with multiplicities(1,1,2) and(1,2,3).

The large-fiber counting argument assumes at most one rational fiber is singular semistable or smooth supersingular. Reducible-additive and small-additive conclusions additionally use exact William Lang configuration exclusions. The primary article has not been obtained, so its aggregate input is explicitly unfinished and must be decomposed before these claims become source-closed. A c₄=0 test signals additive reduction only at a bad place where Δ=0; a smooth supersingular fiber also has c₄=0.

**Stage imports:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.3`, `SchemeAndStackFoundations:SF.5`, `SchemeAndStackFoundations:SF.6`, `WeilConjectures:WC.7`, `NeronModelsAndSemistableAbelianVarieties:R11.4`.

### G.4/fiber-count-data — Fiber-count data at rational base points

**Lemma contract.** For a rational Jacobian elliptic surface over F₂ and a rational base point a, let r_a be its geometric component count. Put n_a=i for smooth E_i, 2r_a for split semistable, 2r_a+2 for nonsplit semistable, and 2r_a+1 for unstable fiber. This is a formal input until splitting is proved.

**Construction/proof outline:**

1. Use the verified E_i counts for smooth fibers and the split/nonsplit/additive count nodes after descent and splitting have been proved.
2. Enumerate the three F₂ rational base points and sum the actual fiber counts.

**Prerequisites:** `G.1/count-15`, `G.1/count-16`, `G.1/count-17`, `G.1/count-18`, `G.1/count-19`, `G.1/five-f2-classes`, `G.1/component-descent`.

**Acceptance:** The formula2r+2 is used only after establishing nonsplit incidence.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), §9, after Proposition 9.3, pp. 25–26; arXiv v3. Literal anchor: “na”. The routed statement is narrowed or corrected as specified in this node.

### G.4/picard-point-count — Picard constancy from resolved-surface point count

**Theorem contract.** For a smooth projective geometrically rational surface J/F_q with geometric Picard rank10, Pic_{J/F_q} is constant iff #J(F_q)=1+10q+q². In particular a rational Jacobian elliptic surface over F₂ has constant Picard scheme iff #J(F₂)=25.

**Construction/proof outline:**

1. Use rationality to identify H²_et(1) with Num(J)⊗Q_ℓ by the cycle-class isomorphism and H¹=H³=0.
2. Apply the geometric Frobenius trace formula to the smooth proper surface.
3. The Galois action on the finitely generated lattice factors through a finite group; all its eigenvalues are roots of unity. A trace of10 forces each to1, and finite-order semisimplicity makes the action identity.
4. Use the torsion-free étale Picard comparison to descend constancy from the lattice.

**Prerequisites:** `G.3/rational-picard-lattice`, `SchemeAndStackFoundations:SF.5`, `SchemeAndStackFoundations:SF.6`, `WeilConjectures:WC.7`, `AlgebraicModuliForArithmeticGeometry:A0-extension`.

**Acceptance:** A singular Weierstrass cubic can have fewer rational points than its smooth resolution.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), §7 Proposition7.1 and proof, pp20–21. Literal anchor: “Trace Formula”. Use the rational-surface cycle-class and Betti inputs, not merely a count of an unresolved cubic.

### G.4/root-basis-comparison — Geometric fiber root-basis comparison

**Lemma contract.** The sublattice generated by the geometric components disjoint from O identifies with the negative root lattice A₂ for IV, E₆ for IV*, and D_(m+4) for I_m*. For the vector terminal dual weight in D_(m+4), the squared norm is−1.

**Hypotheses:** J/F₂ is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹; the fiber lies over a rational base point, and all geometric Mordell–Weil sections descend to F₂.

**Construction/proof outline:**

1. Use the geometric Kodaira intersection matrix to identify the integral root basis with the baseline ADE coordinate model.
2. For A₂ compute determinant3 directly from its2×2 Gram matrix; for E₆ use the baseline discriminant theorem.
3. For the nonspinor D terminal transport the baseline vector representative and its norm1 under the sign reversal.

**Prerequisites:** `G.1/geometric-kodaira`, `G.3/even-complement`, `tauceti:TauCeti.IntegralLattice.checkerboardLattice_form_checkerboardVector_self`, `tauceti:TauCeti.IntegralLattice.discriminant_typeE₆RootLattice`, `tauceti:TauCeti.IntegralLattice`.

**Acceptance:** Fix the selected terminal root before using a dual-basis weight; not all D fundamental weights have norm1.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, p. 26 (statement); proof pp. 26–27; arXiv v3. Literal anchor: “root lattice”. The routed statement is narrowed or corrected as specified in this node.

### G.4/iv-rigidity — IV and IV* graph rigidity

**Lemma contract.** For IV or IV*, if all geometric Mordell–Weil sections descend to F₂, a section meets a component other than the one met by O, and the marked weighted graph has trivial Galois action.

**Hypotheses:** J/F₂ is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹; the fiber lies over a rational base point, and all geometric Mordell–Weil sections descend to F₂.

**Construction/proof outline:**

1. If every section meets the O component, geometric Shioda–Tate makes the corresponding A₂ or E₆ root sublattice an orthogonal direct summand of the even unimodular W.
2. That would make it unimodular, contradicting determinant3.
3. The descending second section fixes a second vertex. For IV this fixes all three vertices of the triangle; for IV* use its marked weighted affine E₆ graph.

**Prerequisites:** `G.4/root-basis-comparison`, `G.3/even-complement`, `G.3/shioda-tate`, `tauceti:TauCeti.IntegralLattice.IsUnimodular`.

**Acceptance:** IV is a triangle with no terminal vertices, so a tree argument cannot be used.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, p. 26 (statement); proof pp. 26–27; arXiv v3. Literal anchor: “IV”. The routed statement is narrowed or corrected as specified in this node.

### G.4/d-star-rigidity — I_m* graph rigidity by dual parity

**Lemma contract.** For1≤m≤4, geometric Mordell–Weil descent fixes the remaining paired terminal vertices of an I_m* fiber.

**Hypotheses:** J/F₂ is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹; the fiber lies over a rational base point, and all geometric Mordell–Weil sections descend to F₂.

**Construction/proof outline:**

1. The component met by O and the nonspinor terminal are fixed by distances in the weighted graph.
2. Suppose every section meets one of those two components. Shioda–Tate shows that the restriction image W→R* is R+Zω, where ω is the nonspinor terminal dual weight.
3. ω pairs integrally with that image because it pairs integrally with R and ω²=−1. Since W is unimodular, ω belongs to W.
4. This contradicts the evenness of W; a descending section therefore fixes one of the remaining terminals, and hence both.

**Prerequisites:** `G.4/root-basis-comparison`, `G.3/even-complement`, `G.3/shioda-tate`, `tauceti:TauCeti.IntegralLattice.IsUnimodular`, `tauceti:TauCeti.IntegralLattice.IsEven`.

**Acceptance:** Restriction to R* is not an isometry; its image’s norm cannot be transferred from the source vector.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, p. 26 (statement); proof pp. 26–27; arXiv v3. Literal anchor: “dual basis vector”. The routed statement is narrowed or corrected as specified in this node.

### G.4/exceptional-affine-rigidity — III*, II* and marked multiplicities

**Lemma contract.** The weighted affine E₇ and E₈ graphs have no nontrivial automorphism fixing the component met by O. The three terminal multiplicities are(1,1,2) and(1,2,3), respectively.

**Hypotheses:** J/F₂ is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹; the fiber lies over a rational base point, and all geometric Mordell–Weil sections descend to F₂.

**Construction/proof outline:**

1. Enumerate the finite affine graphs with their source multiplicity vectors.
2. The marked vertex and the remaining terminal multiplicities/distances identify every branch and vertex.

**Prerequisites:** `G.1/geometric-kodaira`, `G.1/canonical-type-classification`.

**Acceptance:** Both graphs have three terminal vertices; there are two further terminals after marking O.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, p. 26 (statement); proof pp. 26–27; arXiv v3. Literal anchor: “III∗”. The routed statement is narrowed or corrected as specified in this node.

### G.4/additive-graph-rigidity — Additive graph rigidity

**Theorem contract.** Let J/F₂ be as in Theorem 9.4 and satisfy conditions (ii), (iii) and (v) of Proposition 9.3. Then for every rational a∈P¹ with J_a singular, Γ(J_ā)→Γ(J_a) is a graph isomorphism.

**Construction/proof outline:**

1. Treat I₁,II and III directly; use condition(iii) for every multiplicative cycle.
2. Use the marked affine graph lemma for III*,II* and the corrected IV/IV*/I_m* arguments.
3. Exclude I₀* by condition(ii); rank8 bounds the remaining star index by4.

**Prerequisites:** `G.4/iv-rigidity`, `G.4/d-star-rigidity`, `G.4/exceptional-affine-rigidity`, `G.1/canonical-type-classification`, `G.3/even-complement`.

**Acceptance:** The conclusion is about component and incidence descent; retain the singularity hypothesis.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 9.5, p. 26 (statement); proof pp. 26–27; arXiv v3. Literal anchor: “Proposition 9.5”. The routed statement is narrowed or corrected as specified in this node.

### G.4/picard-constancy-criterion — Picard constancy criterion

**Theorem contract.** Let J be a smooth geometrically rational surface over F₂ with a relatively minimal jacobian elliptic fibration φ:J→P¹. Assume: (i) J_ā is irreducible for every closed non-rational a; (ii) no J_ā has Kodaira symbol I₀*; (iii) if J_ā is semistable, Γ(J_ā)→Γ(J_a) is a graph isomorphism; (iv) at most one rational b∈P¹ has J_b semistable or smooth supersingular; (v) MW(J/P¹)=MW(J̄/P̄¹); and Σ_{a∈P¹(F₂)} n_a=25. Then Pic_{J/F₂} is constant.

**Construction/proof outline:**

1. Use geometric Shioda–Tate generation by F,vertical components and sections.
2. Condition(v) fixes every section and condition(i) places reducible fibers over rational points.
3. Use condition(iii) and corrected additive graph rigidity to fix the component generators; the torsion-free étale Picard group then has trivial Galois action.
4. The stated point-sum assumption is retained; its relation to actual counts is the fiber-count-data node.

**Prerequisites:** `G.3/shioda-tate`, `G.4/additive-graph-rigidity`, `G.4/fiber-count-data`, `G.4/picard-point-count`.

**Acceptance:** Do not omit condition(v) or claim the printed enumeration verifies it for every listed model.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 9.4, p. 26; arXiv v3. Literal anchor: “Theorem 9.4”. The routed statement is narrowed or corrected as specified in this node.

### G.4/large-fiber — Large rational fiber

**Theorem contract.** Let J/F₂ be a smooth geometrically rational relatively minimal Jacobian elliptic surface over P¹ with constant Picard scheme and at most one rational base point whose fiber is semistable or smooth supersingular. Some rational fiber has at least six irreducible components.

**Construction/proof outline:**

1. If all component counts are≤5, absence of I₀* bounds every additive fiber by3 components and hence7points.
2. There is at most one multiplicative or supersingular smooth fiber; a split cycle of at most5 components contributes≤10, and a nonsplit small form contributes≤6.
3. The other two fibers contribute≤7 each, contradicting25≤10+7+7=24.

**Prerequisites:** `G.4/fiber-count-data`, `G.4/picard-point-count`, `G.1/count-19`.

**Acceptance:** The nonsplit point-count exception does not invalidate the upper bound10.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 10.1, p. 28; arXiv v3. Literal anchor: “at least six”. The routed statement is narrowed or corrected as specified in this node.

### G.4/lang-configuration-inputs — Lang configuration inputs as used

**Lemma contract.** For geometrically rational Jacobian elliptic surfaces in characteristic2, certify separately the required Lang2000 exclusions and normal forms: II+I₉ excluded; III with I_m,6≤m≤9 only III+I₆ or III+I₈; the cases2A,5A,5D,7,13A,14 normal forms; j=0 nonreduced-fiber and number-of-bad-fibers restrictions. Each export must retain source hypotheses.

**Construction/proof outline:**

1. Acquire and read the primary published or author text of Lang2000.
2. Split each exclusion and normal-form assertion into its own declaration-sized node after identifying its proof and all prerequisites.
3. Until then this is an explicit aggregation target with incomplete granularity, never a proved source theorem.

**Prerequisites:** `G.3/global-chart-equation`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** Do not silently use Lang1994 on extremal surfaces for this more general claim.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Section 10, pp. 28–32; arXiv v3. Literal anchor: “Lang’s Classification”. The routed statement is narrowed or corrected as specified in this node.

### G.4/reducible-additive — Reducible additive fiber

**Lemma contract.** Let J/F₂ be a smooth geometrically rational relatively minimal Jacobian elliptic surface over P¹ with constant Picard scheme and at most one rational base point whose fiber is semistable or smooth supersingular. There is a reducible unstable fiber over a rational base point.

**Construction/proof outline:**

1. If every reducible fiber is multiplicative, the large-fiber node gives I_r with6≤r≤9.
2. The other rational fibers must be ordinary smooth or II; parity and25points force II+E₄+I₉.
3. Apply the exact Lang exclusion II+I₉; this use remains behind the source-acquisition gap.

**Prerequisites:** `G.4/large-fiber`, `G.4/fiber-count-data`, `G.3/rational-picard-lattice`, `G.4/lang-configuration-inputs`.

**Acceptance:** Without the configuration exclusion the parity count alone does not prove the theorem.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 10.2, pp. 28–29; arXiv v3. Literal anchor: “reducible and”. The routed statement is narrowed or corrected as specified in this node.

### G.4/unique-additive — Unique additive fiber for nonzero j

**Lemma contract.** Let J/F₂ be a smooth geometrically rational relatively minimal Jacobian elliptic surface over P¹ with constant Picard scheme and at most one rational base point whose fiber is semistable or smooth supersingular. If j∈F₂(t) is nonzero, exactly one fiber is unstable.

**Construction/proof outline:**

1. Nonzero functional j gives a₁ not identically zero; its global section of O(1) has exactly one geometric zero.
2. At a bad fiber the imported minimal-equation criterion says additive iff Δ=0 and c₄=0; c₄=a₁⁴ in characteristic2.
3. Use the reducible-additive node for existence; the zero-divisor argument gives uniqueness.

**Prerequisites:** `G.4/reducible-additive`, `G.3/global-chart-equation`, `mathlib:WeierstrassCurve.j_eq_zero_iff_of_char_two`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A smooth supersingular fiber has c₄=0 and Δ≠0 and is not additive.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 10.3, p. 29; arXiv v3. Literal anchor: “exactly one”. The routed statement is narrowed or corrected as specified in this node.

### G.4/small-additive — Small additive configuration

**Lemma contract.** Let J/F₂ be a smooth geometrically rational relatively minimal Jacobian elliptic surface over P¹ with constant Picard scheme and at most one rational base point whose fiber is semistable or smooth supersingular. If j≠0 and the unique unstable fiber has at most five components, the rational-fiber configuration, up to a base automorphism, is III+E₄+I₈.

**Construction/proof outline:**

1. If the unique additive fiber has≤5 components, I₀* exclusion forces≤3.
2. Large-fiber and rank bounds give a split I_m with6≤m≤9; Lang restricts the combination to III+I₆ or III+I₈.
3. The remaining ordinary E_2n fiber contributes2n, and25=5+2m+2n forces m=8,n=2.

**Prerequisites:** `G.4/unique-additive`, `G.4/large-fiber`, `G.4/fiber-count-data`, `G.4/lang-configuration-inputs`.

**Acceptance:** The count equation is used only after the geometric fiber configuration is proved.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 10.3, p. 29; arXiv v3. Literal anchor: “III + E4 + I8”. The routed statement is narrowed or corrected as specified in this node.

## G.5 — Fourteen explicit models over F₂

The table records equations, not completed surface certificates. Models1–8 and12–14 have nonzero functional j; models9–11 have j=0 but nonzero discriminant, so their generic curves are elliptic. Every individual certificate must verify local minimality, the geometric regular resolution, splitting, rationality and Picard constancy. The polynomial and reverse-chart calculations below have been independently checked, while the Tate/resolution proofs remain open. Models2 and14 have a degree-two bad point t²+t+1=0 with geometric type I₁. It contributes no rational base point to the F₂ count. Model8 has no such nonrational exception.

The three additional equations have rational-fiber sums15+4+6,17+4+4 and15+4+6. Those sums are the required geometric outcomes, conditional on the fiber certificates; naive cubic point counts alone do not establish them. A source proof exceeding one page must split its model certificate into invariant, minimality, resolution/splitting, rationality and Picard assertions. The present aggregate model nodes retain that granularity gap explicitly.

**Stage imports:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.3`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

| Model | a₁ | a₂ | a₃ | a₄ | a₆ | Δ |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | t | t | t^2 | t^4 | t^5+t^6 | t^8 |
| 2 | t | 0 | 0 | t^3 | t^5+t^6 | t^10+t^11+t^12 |
| 3 | t | 0 | 0 | t^3 | 0 | t^10 |
| 4 | t | t^2 | 0 | t^3 | 0 | t^10 |
| 5 | t | 0 | 0 | 0 | t^5 | t^11 |
| 6 | t | t^2 | 0 | 0 | t^5 | t^11 |
| 7 | t | t | 0 | t^4 | 0 | t^12 |
| 8 | t | t | t | t | 0 | t^4 |
| 9 | 0 | t | t^2 | 0 | 0 | t^8 |
| 10 | 0 | 0 | t^2 | t^3 | 0 | t^8 |
| 11 | 0 | 0 | t^2 | 0 | 0 | t^8 |
| 12 | t | 1 | t^3 | 0 | 0 | t^10 |
| 13 | t | t | t^3 | 0 | 0 | t^11 |
| 14 | t | t^2 | t^2 | 0 | 0 | t^8+t^9+t^10 |

For reproducibility, in characteristic2 set b₂=a₁²,b₄=a₁a₃,b₆=a₃²,b₈=a₁²a₆+a₁a₃a₄+a₂a₃²+a₄²; then Δ=b₂²b₈+b₆²+b₂b₄b₆. The coefficient check uses finite polynomial arithmetic over F₂, verifies all fourteen identities, all five degree bounds per row, each reversal involution, and Δ(chart)=reverse₁₂(Δ). Bit n of each packet coefficientBits integer is the coefficient of tⁿ. Thus the arithmetic is fully determined by the published table without an external scratch file.

### G.5/f2-candidate-equation — Fourteen candidate equations

**Definition contract.** CandidateEquation is the function from Fin14 to bounded F₂ Weierstrass equations given by models1–11 of Schröer10.4–10.5 followed by the three corrected models12–14. The exact five coefficient tuples are recorded in modelData. This definition records equations only; it does not assert their resolution type, Picard constancy or completeness.

**Construction/proof outline:**

1. Use the ordered table of five existing polynomial coefficients, with the char2 convention y²+a₁xy+a₃y=x³+a₂x²+a₄x+a₆.
2. Check each coefficient weight bound separately; retain the three missing models as actual table entries.

**Prerequisites:** `G.3/bounded-weierstrass`.

| Consumer | Required use |
| --- | --- |
| Schröer10.4–10.5 and routed238–240 | The finite classification targets reference one shared candidate family. |
| G.6 completeness certificate | The output is membership in this table modulo admissible equivalence, not equality of raw coefficient tuples. |

| Proposed API name | Role | Exact contract |
| --- | --- | --- |
| CandidateEquation.coefficients | data | Returns the specified five polynomials at each of the fourteen indices. |
| CandidateEquation.bounded | compatibility | Every equation satisfies the weights1,2,3,4,6 of BoundedWeierstrass. |
| CandidateEquation.ne | characterisation | The fourteen raw five-tuples are pairwise distinct; this is weaker than nonequivalence of fibrations. |
| CandidateEquation.chart | functoriality | Its infinity chart is the specified weighted reversal, including zero coefficients. |

| Unit test name | Kind | Statement that the definition must satisfy |
| --- | --- | --- |
| CandidateEquation.model12 | computation | Index11 has(a₁,a₂,a₃,a₄,a₆)=(t,1,t³,0,0),Δ=t¹⁰. |
| CandidateEquation.model13 | computation | Index12 has(t,t,t³,0,0),Δ=t¹¹. |
| CandidateEquation.model14 | computation | Index13 has(t,t²,t²,0,0),Δ=t⁸(t²+t+1). |
| CandidateEquation.missing_from_print | non-example | None of the specific printed models1–8 has the raw tuple of models12,13 or14; this is a coefficient-table test, not an equivalence assertion. |

**Acceptance:** Index11 has(a₁,a₂,a₃,a₄,a₆)=(t,1,t³,0,0),Δ=t¹⁰. Index12 has(t,t,t³,0,0),Δ=t¹¹. Index13 has(t,t²,t²,0,0),Δ=t⁸(t²+t+1). None of the specific printed models1–8 has the raw tuple of models12,13 or14; this is a coefficient-table test, not an equivalence assertion.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. Literal anchor: “Weierstraß equation”. The routed statement is narrowed or corrected as specified in this node.

### G.5/model-1 — Model 1 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy+t²y=x³+tx²+t⁴x+t⁵(1+t) has functional j=t⁴, discriminant t⁸ on the t-chart, and fibers at 0, 1,∞ of types I₁*+E₄+I₄.

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. Literal anchor: “Theorem 10.4”. The routed statement is narrowed or corrected as specified in this node.

### G.5/model-2 — Model 2 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy=x³+t³x+t⁵(1+t) has functional j=t²/(t²+t+1), discriminant t¹⁰(t²+t+1) on the t-chart, and fibers at 0, 1,∞ of types III*+E₄+E₄.

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. Literal anchor: “Theorem 10.4”. The routed statement is narrowed or corrected as specified in this node.

### G.5/model-3 — Model 3 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy=x³+t³x has functional j=t², discriminant t¹⁰ on the t-chart, and fibers at 0, 1,∞ of types III*+E₄+I₂.

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. Literal anchor: “Theorem 10.4”. The routed statement is narrowed or corrected as specified in this node.

### G.5/model-4 — Model 4 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy=x³+t²x²+t³x has functional j=t², discriminant t¹⁰ on the t-chart, and fibers at 0, 1,∞ of types III*+E₂+nonsplit I₂.

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. Literal anchor: “Theorem 10.4”. The routed statement is narrowed or corrected as specified in this node.

### G.5/model-5 — Model 5 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy=x³+t⁵ has functional j=t, discriminant t¹¹ on the t-chart, and fibers at 0, 1,∞ of types II*+E₄+I₁.

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. Literal anchor: “Theorem 10.4”. The routed statement is narrowed or corrected as specified in this node.

### G.5/model-6 — Model 6 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy=x³+t²x²+t⁵ has functional j=t, discriminant t¹¹ on the t-chart, and fibers at 0, 1,∞ of types II*+E₂+nonsplit I₁.

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. Literal anchor: “Theorem 10.4”. The routed statement is narrowed or corrected as specified in this node.

### G.5/model-7 — Model 7 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy=x³+tx²+t⁴x has functional j=1, discriminant t¹² on the t-chart, and fibers at 0, 1,∞ of types I₄*+E₂+E₄.

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. Literal anchor: “Theorem 10.4”. The routed statement is narrowed or corrected as specified in this node.

### G.5/model-8 — Model 8 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of the Weierstrass model y²+txy+ty=x³+tx²+tx has functional j=t⁸, discriminant t⁴ on the t-chart, and fibers at 0, 1,∞ of types III+E₄+I₈.

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. Literal anchor: “Theorem 10.4”. The routed statement is narrowed or corrected as specified in this node.

### G.5/model-9 — Model 9 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of the Weierstrass model y²+t²y=x³+tx² has functional j=0, discriminant t⁸ on the t-chart, and fibers at 0, 1,∞ of types I₁*+E₅+IV.

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.5, p. 31; arXiv v3. Literal anchor: “Theorem 10.5”. The routed statement is narrowed or corrected as specified in this node.

### G.5/model-10 — Model 10 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of the Weierstrass model y²+t²y=x³+t³x has functional j=0, discriminant t⁸ on the t-chart, and fibers at 0, 1,∞ of types IV*+E₅+III.

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.5, p. 31; arXiv v3. Literal anchor: “Theorem 10.5”. The routed statement is narrowed or corrected as specified in this node.

### G.5/model-11 — Model 11 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of the Weierstrass model y²+t²y=x³ has functional j=0, discriminant t⁸ on the t-chart, and fibers at 0, 1,∞ of types IV*+E₃+IV.

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.5, p. 31; arXiv v3. Literal anchor: “Theorem 10.5”. The routed statement is narrowed or corrected as specified in this node.

### G.5/model-12 — Model 12 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of y²+txy+t³y=x³+x² has Δ=t¹⁰, j=t², fibres I₂* at t=0 (all components rational), E₄ at t=1, non-split I₂ at ∞, and no other singular fibre. It has constant Picard scheme (#J(F₂)=15+4+6=25) and satisfies condition (ii) of §10.

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem10.4 and twisted-case proof, pp29–31, arXivv3. Literal anchor: “the argument is similar”. The printed omission is repaired by PAPER-SCHROER-23/E34 and items238–240, with review attribution. This design proposes individual proof certificates; it has not rerun the prior exhaustive search.

### G.5/model-13 — Model 13 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of y²+txy+t³y=x³+tx² has Δ=t¹¹, j=t, fibres I₃* at t=0 (all components rational), E₄ at t=1, non-split I₁ at ∞, and no other singular fibre. It has constant Picard scheme (#J(F₂)=17+4+4=25) and satisfies condition (ii).

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem10.4 and twisted-case proof, pp29–31, arXivv3. Literal anchor: “the argument is similar”. The printed omission is repaired by PAPER-SCHROER-23/E34 and items238–240, with review attribution. This design proposes individual proof certificates; it has not rerun the prior exhaustive search.

### G.5/model-14 — Model 14 certificate

**Lemma contract.** Over F₂, the relatively minimal resolution of y²+txy+t²y=x³+t²x² has Δ=t⁸(t²+t+1), j=t⁴/(t²+t+1). Its fibres are IV* at t=0 (all components rational), E₄ at t=1, non-split I₂ at ∞, and I₁ over the point t²+t+1=0. It has constant Picard scheme (#J(F₂)=15+4+6=25) and satisfies condition (ii).

**Construction/proof outline:**

1. Evaluate the baseline discriminant and c₄ formulas on this specific coefficient tuple; reduce the resulting rational j=c₄³/Δ.
2. Compute the weighted reverse chart. Factor the two discriminants to identify every rational and nonrational bad place.
3. At each bad place prove minimality, run the imported perfect-residue Tate algorithm, and transport its result to the actual regular resolution using the scheme-realization comparison; check splitting of the displayed residue polynomials.
4. Verify smoothness/rationality and relative minimality of that resolution, then sum the resolved fiber counts at0,1,∞. Use the geometric trace criterion to certify Picard constancy, without assuming Mordell–Weil descent from the printed list.

**Prerequisites:** `G.5/f2-candidate-equation`, `G.3/global-chart-equation`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.1/geometric-kodaira`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A complete certificate includes all-place minimality and the resolved fiber geometry, not merely a polynomial discriminant or naive singular-cubic point count. For models12,13,14 the rational-fiber sums are15+4+6,17+4+4 and15+4+6 respectively.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem10.4 and twisted-case proof, pp29–31, arXivv3. Literal anchor: “the argument is similar”. The printed omission is repaired by PAPER-SCHROER-23/E34 and items238–240, with review attribution. This design proposes individual proof certificates; it has not rerun the prior exhaustive search.

### G.5/nonrational-nonzero-j — Nonrational bad fibers in the eleven nonzero-j models

**Lemma contract.** For the eleven nonzero-j candidates all fibers over nonrational base points are smooth, except model2 and model14, each with one geometric I₁ fiber over the degree2 point t²+t+1=0.

**Construction/proof outline:**

1. Factor each explicit polynomial discriminant and inspect the reverse chart.
2. At t²+t+1 the discriminant has simple valuation and c₄ is a unit, yielding I₁ via the imported minimal-equation criterion.

**Prerequisites:** `G.5/model-1`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`, `G.5/f2-candidate-equation`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** The exception is model2, not model8. The degree2 point contributes no F₂ rational base point.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, p. 29; arXiv v3. Literal anchor: “an additional singular fiber”. The routed statement is narrowed or corrected as specified in this node.

### G.5/nonrational-zero-j — Smooth nonrational fibers of zero-j models

**Lemma contract.** All fibers at nonrational base points in the three models of Theorem 10.5 are smooth.

**Construction/proof outline:**

1. For each of models9–11, Δ=t⁸ on the finite chart and all finite nonrational points have nonzero discriminant.
2. Inspect the infinity chart separately; it is a rational base point.

**Prerequisites:** `G.5/model-9`, `G.5/model-10`, `G.5/model-11`, `G.5/f2-candidate-equation`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** The three zero-j equations define elliptic generic curves because Δ is not identically zero.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.5, p. 31; arXiv v3. Literal anchor: “smooth”. The routed statement is narrowed or corrected as specified in this node.

## G.6 — Completeness and classification certificates

There are2²¹ raw bounded F₂ coefficient tuples. The global characteristic-two x-translation r=a₂ removes a₂ and leaves2¹⁸ tuples, preserving all weights. Coordinate translations have degree bounds1,2,3 for s,r,q and give512 triples; the six elements of PGL₂(F₂) act with the corresponding chart/line-bundle transformations. Enumeration of a subset of those changes does not prove that every fibration isomorphism is captured.

An exhaustiveness certificate must attach a mathematical rejection witness or an equivalence witness to every normalized tuple. It must examine every irreducible bad place and infinity, certify regular resolutions and geometric rationality, and apply the resolved-surface count and rational-fiber conditions. A list of survivors is insufficient. No such full search was run in this job, and a prior review’s report is not adopted as a proof certificate. The eleven nonzero-j and three zero-j classification statements are therefore explicitly conditional on the completeness target, its individual model certificates and pairwise nonequivalence.

**Stage imports:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.5`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

### G.6/a2-normalization — Characteristic-two a₂ normalization

**Lemma contract.** Every degree-bounded characteristic2 equation can be transformed to one with a₂=0 by the global change x↦x+a₂, with the other coefficients still satisfying their weights. Thus a₂=0 leaves2¹⁸ raw F₂ coefficient tuples.

**Construction/proof outline:**

1. Expand the cubic after x↦x+r with r=a₂; in characteristic2 the x² coefficient becomes a₂+r=0.
2. The weighted terms a₁r,a₃r,r³,a₄r all retain their required bounds.
3. Count the coefficient dimensions2+4+5+7=18 for weights1,3,4,6.

**Prerequisites:** `G.3/bounded-weierstrass`, `G.3/global-chart-equation`.

**Acceptance:** The normalization must preserve the global chart weights.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorems 10.4–10.5 and the earlier review search; arXiv v3 pp. 28–32; arXiv v3. Literal anchor: “221”. The routed statement is narrowed or corrected as specified in this node.

### G.6/admissible-transformations — Finite admissible equivalence action

**Lemma contract.** Degree-preserving coordinate transformations over F₂ have u=1, polynomials s,r,q of degree≤1,≤2,≤3 in y↦y+s x+q,x↦x+r. There are512 triples. Together with the six elements of PGL₂(F₂), they generate the permitted equivalence of the global elliptic fibrations.

**Construction/proof outline:**

1. Use the global weight bundles to bound all translation parameters; count2²·2³·2⁴=512.
2. Construct the induced two-chart transformations, including the PGL₂ denominator/weight changes.
3. Use the Weierstrass isomorphism theorem to prove that every fibration isomorphism is captured, rather than merely enumerating some transformations.

**Prerequisites:** `G.6/a2-normalization`, `G.3/global-chart-equation`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** Base inversion must use the second chart and its weights; substitution t↦1/t alone does not give a polynomial model.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorems 10.4–10.5 and the earlier review search; arXiv v3 pp. 28–32; arXiv v3. Literal anchor: “coordinate changes”. The routed statement is narrowed or corrected as specified in this node.

### G.6/finite-rejection-certificate — Exhaustive finite rejection certificate

**Lemma contract.** For each of the2¹⁸ normalized tuples, certify either Δ=0, failure of global minimality/rationality, failure of Picard constancy or the rational-fiber condition, or equivalence to one of the fourteen candidates. Every rejection names its mathematical criterion and a checkable witness.

**Construction/proof outline:**

1. Enumerate the finite coefficient space completely after the proved normalization.
2. Factor Δ and its weight12 reversal; run the perfect-residue Tate algorithm at every bad place, including all irreducible factors and infinity.
3. Certify the regular resolved-surface point count and the single-semstable-or-supersingular condition; keep rationality/χ prerequisites explicit.
4. For survivors, produce an admissible transformation and a base automorphism reaching the named candidate.

**Prerequisites:** `G.6/a2-normalization`, `G.6/admissible-transformations`, `G.4/picard-point-count`, `G.4/fiber-count-data`, `G.4/lang-configuration-inputs`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

The canonical upstream stage IDs in this list are retained as typed imports in the packet; the encoding gap below records the checker limitation. They remain mathematical dependencies.

**Acceptance:** A table of survivors without rejection witnesses is not an exhaustiveness proof.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorems 10.4–10.5 and the earlier review search; arXiv v3 pp. 28–32; arXiv v3. Literal anchor: “possible Weierstraß equations”. The routed statement is narrowed or corrected as specified in this node.

### G.6/completeness — Completeness of the fourteen-model list

**Theorem contract.** Prove that all rational Jacobian elliptic fibrations over F₂ satisfying §10 conditions (i)–(ii) are represented by the fourteen candidate equations (/115 and /117), modulo the permitted coordinate changes and PGL₂(F₂), and verify the hypotheses and equivalences for each representative.

**Hypotheses:** The target is a smooth projective geometrically rational relatively minimal Jacobian elliptic surface over P¹_F₂, with constant Picard scheme and at most one rational fiber that is singular semistable or smooth supersingular. Completeness is conditional on the finite rejection and individual model certificates.

**Construction/proof outline:**

1. Use global Weierstrass construction to represent every target surface by a bounded equation.
2. Normalize a₂, apply the finite rejection certificate and transport back through the admissible-equivalence theorem.
3. Use individual model certificates to establish the converse; prove pairwise nonequivalence of surviving orbits.

**Prerequisites:** `G.3/global-chart-equation`, `G.6/a2-normalization`, `G.6/admissible-transformations`, `G.6/finite-rejection-certificate`, `G.5/model-1`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`.

**Acceptance:** The theorem is conditional on the full rejection and model certificates until all gaps are closed.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorems 10.4–10.5 and the earlier review search; arXiv v3 pp. 28–32; arXiv v3. Literal anchor: “exactly eleven”. Correct the count to14. Completeness is the separately named obligation247, not inherited from the printed eleven-model assertion.

### G.6/nonzero-j-classification — Eleven nonzero-j classes

**Theorem contract.** Assuming the completeness certificate, every surface satisfying §10(i)–(ii) with nonzero functional j is equivalent to exactly one of models1–8,12–14.

**Construction/proof outline:**

1. Partition the certified fourteen orbits by their verified functional j.
2. The eleven nonzero-j equations form the required subfamily.

**Prerequisites:** `G.6/completeness`, `G.5/f2-candidate-equation`, `G.5/model-1`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`.

**Acceptance:** The three additional candidates cannot be discarded because their infinity fibers are nonsplit.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.4, pp. 29–31; arXiv v3. Literal anchor: “eight Weierstraß”. Eight printed nonzero-j entries are supplemented by three; keep the completeness hypothesis explicit.

### G.6/zero-j-classification — Three zero-j classes

**Theorem contract.** Assuming the completeness certificate, every surface satisfying §10(i)–(ii) with j=0 is equivalent to exactly one of models9–11.

**Construction/proof outline:**

1. Partition the certified fourteen orbits by functional j=0.
2. Use the three individual zero-j certificates and pairwise nonequivalence.

**Prerequisites:** `G.6/completeness`, `G.5/f2-candidate-equation`, `G.5/model-9`, `G.5/model-10`, `G.5/model-11`.

**Acceptance:** Completeness does not follow from the three verified examples alone.

**Source:** [Stefan Schröer](https://arxiv.org/pdf/2004.07025v3), Theorem 10.5, pp. 31–32; arXiv v3. Literal anchor: “Theorem 10.5”. The routed statement is narrowed or corrected as specified in this node.

## Cross-roadmap export requests

Each request imports the supplier’s object and states the exact additional export needed. All consuming node IDs are recorded, including the original upstream stage dependencies. A finer reviewed packet node replaces a stage request as soon as it supplies the required statement. No request alone establishes the mathematical result.

### SchemeAndStackFoundations:SF.0

Ring quotient/tensor quotient and localization APIs for arbitrary commutative rings; the finite-algebra principal-open separation and finite closed-map arguments in Ferrand7.1B. Monogenic conductor is only a compatibility input. EGAIV4 18.5.11(c) henselian local-component theorem and the regular-local horizontal parameter argument. Its finite-component theorem does not itself construct a Cartier divisor or identify the length-m schematic fiber. Henselization of an excellent DVR remains excellent with unchanged residue field; base change preserves the regular-model and special-fiber hypotheses needed for the multiple-fiber proof. Flat tensor exactness for the affine fiber-product sequence and classification of commutative length-two algebras over a field.

Consumers: `G.0/cartesian-affine`, `G.0/compatible-affine-neighbourhoods`, `G.0/conductor-square`, `G.0/flat-base-change`, `G.0/localization-complement`, `G.1/small-conductor-classification`, `G.2/multiple-fiber-isogeny`, `G.2/normal-dominating-model`, `G.2/transverse-divisor`.

### SchemeAndStackFoundations:SF.1

Affine scheme section/localization comparisons, quotient-topology and scheme-gluing theorems needed to prove Ferrand5.1 for arbitrary targets and global7.1. Supply the genuine algebraic-space carrier with its small étale structure sheaf and specified products over a scheme base. Export finite-map cofinality of pullbacks of whole étale covers (TT5.1.2), affine étale lifting across closed immersions (Stacks04D1; its ind-quasi-affine extension TT5.2.5), effective étale descent of morphisms and isomorphisms, and étale-local descent of affine, finite and closed-immersion properties. Export algebraic-space diagonal properties (Stacks02X4), separated locally quasi-finite representability and its local quasi-affine refinement (Stacks67.50.2, section0417; do not add a global quasi-compactness assumption), the locally-finite-type monomorphism test after surjective base change (TT2.1.6), and the quotient of an étale equivalence relation with a monomorphic relation map (Stacks04S6). Supply the universally-closed-surjective separatedness criterion (Stacks05Z2) for the already constructed finite overlap. These exact inputs support the now verified TT finite-pinching consumer chain; Stacks0EDP/81.7 only upgrades an already schematic pushout and is not used as unconditional existence. Existence and effectivity of the free finite constant-group quotient of the projective scheme A×Spec R′, with its generic and special-fiber base-change identifications.

Consumers: `G.0/affine-existence`, `G.0/compatible-affine-neighbourhoods`, `G.0/global-existence`, `G.2/diagonal-quotient-example`, `key/ferrand-pushouts`, `G.0/pinching-etale-cover`, `G.0/affine-space-hom-injective`, `G.0/affine-space-hom-surjective`, `G.0/pinching-etale-relation`, `G.0/pinching-overlap-scheme`, `G.0/algebraic-space-existence`, `G.0/space-cartesian`, `G.0/space-geometric`, `G.0/space-finite`, `G.0/space-closed`, `G.0/space-flat-base-change`, `G.0/space-scheme-recognition`.

### SchemeAndStackFoundations:SF.3

Flat base change of qcqs pushforwards and Milnor patching of finite projective modules on ring fiber products; the rank-one groupoid statement must retain the overlap identification. Relative cohomology/base change and Picard–norm comparison for integral proper curves; positive section twist cohomology; Leray and Euler-characteristic formulas including nonreduced fibers; normalization cohomology exact sequence. Stein factorization and normal-base comparison f_*O=O for the proper normal DVR model, genuine coherent genus and base change; Picard-to-line-bundle obstruction sequence over fields. For the algebraic-space continuation supply the affine flat-object patching equivalence of TT3.4.1 and its scheme-local extension4.1.2, with cartesian unit/counit, flat fiber products, surjectivity and étale-property comparison; preserving an already formed square under flat base change alone is insufficient for constructing the presentation.

Consumers: `G.0/flat-base-change`, `G.0/line-bundle-patching`, `G.1/genus-one-fibration`, `G.2/cohomology-adapter`, `G.2/domination-genus`, `G.2/equality-regular`, `G.2/normal-dominating-model`, `G.2/unique-dominating-component`, `G.3/canonical-bundle`, `G.3/canonical-degree`, `G.3/generic-picard-restriction`, `G.3/positive-section-cohomology`, `G.3/pushforward-splitting`, `G.3/tame-wild`, `G.3/tsen-obstruction`, `G.0/affine-space-hom-injective`, `G.0/affine-space-hom-surjective`, `G.0/pinching-etale-relation`, `G.0/pinching-overlap-scheme`, `G.0/algebraic-space-existence`, `G.0/space-flat-base-change`.

### AlgebraicModuliForArithmeticGeometry:A0-extension

Picard/line-bundle groupoid formalism, effective gluing of morphisms, and the Raynaud cohomological-flatness criterion at its owner; this roadmap supplies only the conductor-specific and regular-model adapters. Raynaud Spécialisation du foncteur de Picard (1970)6.1.4 (N)* and8.2.1: give the exact normal/generic-fiber hypotheses and section⇒degree0-cohomological-flatness statement. Y must satisfy f_*O=O. General criterion stays with this owner. For smooth geometrically rational surfaces, the étale torsion-free Picard group scheme comparison to the geometric lattice and constancy iff trivial geometric Galois action; no identification of Picard-functor points with line bundles without obstruction hypotheses. Norm and tangent-space comparison for Pic⁰ of proper integral curves, generic Jacobian representability including the stated regular nonsmooth genus-one case, Picard obstruction sequence, and Raynaud6.3.5 multiplicity/order theorem with all hypotheses.

Consumers: `G.0/line-bundle-patching`, `G.1/lang-genus-one`, `G.2/cohomology-adapter`, `G.2/domination-genus`, `G.3/global-minimal-jacobian`, `G.3/shioda-tate`, `G.3/tame-wild`, `G.3/tsen-obstruction`, `G.4/picard-point-count`.

### tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces

Zariski fiber-intersection lemma with primitive multiplicity vector generating the radical and every proper component submatrix negative definite; import its geometric realization, not a second abstract numerical type.

Consumers: `G.1/canonical-type-classification`, `G.1/fiber-type-divisor`, `G.2/normal-dominating-model`, `G.2/transverse-divisor`, `G.3`, `G.3/canonical-bundle`, `G.3/generic-picard-restriction`, `G.3/rational-picard-lattice`, `G.3/relative-cubic-contraction`, `G.5/model-1`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.6/finite-rejection-certificate`.

### AlgebraicModuliForArithmeticGeometry:R09.3

Effective Galois descent of component subschemes and of finite-field forms of P¹. Supply the precise constant numerical-Picard implication used in Schröer3.1; source Theorem2.1 proof and a Picard-component rigidity bridge must be decomposed, not inferred from fixed numerical classes alone. Effective descent of genus0 forms and the free diagonal finite constant-group action, including generic torsor identification and reduced special fiber A/G.

Consumers: `G.1/component-descent`, `G.1/finite-field-p1-forms`, `G.2/diagonal-quotient-example`.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1

Import ordinary/supersingular definitions and the characteristic2 equivalence a₁=0 iff j=0 for smooth elliptic curves. The baseline j lemma supplies only the invariant equivalence; no bad-fiber criterion follows without Δ=0. An F_q-isogeny gives equality of all extension-field point counts, via rational Tate-module Frobenius and the point-count formula; do not request the converse of Tate1966.

Consumers: `G.1`, `G.1/E1`, `G.1/E2`, `G.1/E3`, `G.1/E4`, `G.1/E5`, `G.1/five-f2-classes`, `G.2/extension-counts`, `G.3`.

### tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs

Normalization commutes with every field extension when the normalization is smooth over the original field; verify the geometrically reduced target and finite birational comparison. The hypothesis is stronger than reducedness of the target.

Consumers: `G.1`, `G.1/canonical-type-classification`, `G.1/count-15`, `G.1/nonsplit-i1`, `G.1/nonsplit-i2`, `G.1/small-conductor-classification`, `G.2/equality-regular`.

### tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity

Proper-flat genus/Euler-characteristic constancy, finite-dimensional coherent fiber cohomology and vanishing above degree1, also for the nonreduced normal-total-space model used after normalization.

Consumers: `G.1/finite-field-p1-forms`, `G.1/genus-one-fibration`, `G.2/cohomology-adapter`, `G.3/canonical-degree`, `G.3/positive-section-cohomology`, `G.3/pushforward-splitting`, `G.3/rational-canonical`.

### NeronModelsAndSemistableAbelianVarieties:R11.2

LLR2004 discriminant comparison5.9 (perfect residue) with determinant/Lie-lattice corrections, and the generic Picard-versus-Jacobian Brauer obstruction retained. Export exact statements supplying6.6; the2018 corrigendum changes4.3, not6.6.

Consumers: `G.2/diagonal-quotient-example`, `G.2/llr-kodaira-comparison`.

### NeronModelsAndSemistableAbelianVarieties:R11.4

LLR6.1(b),6.5,7.1 comparison of component counts/groups and abelian/toric ranks under algebraically closed residue hypotheses, plus period=gcd fiber multiplicities needed for6.6.

Consumers: `G.2/llr-kodaira-comparison`.

### SchemeAndStackFoundations:SF.5

Define geometrically rational surface using birationality to P² after algebraic closure, with geometric integrality. Export smooth proper rational-surface birational invariance, H¹=H²(O)=0, étale torsion-free Picard=Num, b₁=0 and b₂=ρ. Read a full rational-surface theorem proof; do not infer geometric smoothness from birationality alone. Effective divisor/intersection carriers, adjunction and Hodge index; rational-surface blowup Picard decomposition and torsion-free Picard=Num comparison; connected affine root classification geometric realization. Abstract IntegralLattice objects stay imported from baseline. Regular resolution of the minimal Weierstrass cubic with rational double points and its rationality/coherent and lattice invariants; supply the geometric component-intersection realization of Tate outputs. The model-specific certificate belongs to this Part II.

Consumers: `G.1/canonical-type-classification`, `G.1/component-descent`, `G.1/fiber-type-divisor`, `G.1/geometric-kodaira`, `G.2/domination-genus`, `G.3`, `G.3/canonical-bundle`, `G.3/even-complement`, `G.3/fiber-section-plane`, `G.3/generic-picard-restriction`, `G.3/rational-canonical`, `G.3/rational-picard-lattice`, `G.4/picard-point-count`, `G.5/model-1`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.6/finite-rejection-certificate`.

### SchemeAndStackFoundations:SF.4

Relative dualizing sheaf and evaluation, relative projective-bundle/cubic construction and image normality; import upstream StableReduction’s curve duality where it covers the hypothesis, and extend its non-nodal genus-one use without duplicating its carrier.

Consumers: `G.3/canonical-bundle`, `G.3/global-chart-equation`, `G.3/relative-cubic-contraction`.

### tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models

Smooth positive-genus regular/minimal-model uniqueness and generic section extension; supply local exports for gluing over a regular curve. Non-smooth quasielliptic models are explicitly outside the imported smooth theorem and are owned by the new extension.

Consumers: `G.1/genus-one-fibration`, `G.2/llr-kodaira-comparison`, `G.3/global-minimal-jacobian`, `G.3/shioda-tate`.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

Minimal-equation Kodaira symbols and Tate algorithm with perfect-residue hypotheses; export the scheme-realization comparison to the normal Weierstrass cubic’s regular resolution rather than equating an equation-side output with a scheme by name.

Consumers: `G.1/geometric-kodaira`, `G.2/llr-kodaira-comparison`, `G.3/bounded-weierstrass`, `G.3/coefficient-nondegeneracy`, `G.3/relative-cubic-contraction`, `G.4/lang-configuration-inputs`, `G.4/unique-additive`, `G.5/model-1`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.5/nonrational-nonzero-j`, `G.5/nonrational-zero-j`, `G.6/finite-rejection-certificate`.

### SchemeAndStackFoundations:SF.6

Rational-surface cycle-class isomorphism Num(J)⊗Q_ℓ≅H²_et(Jbar,Q_ℓ(1)), Galois compatibility and the convention that untwisted geometric Frobenius multiplies divisor eigenvalues by q.

Consumers: `G.4/picard-point-count`.

### WeilConjectures:WC.7

Resolved smooth proper rational-surface trace formula with H⁰,H⁴ contributing1,q² and H¹=H³=0. The integrated WC.6 packet is not an exact rational-surface geometric point-count export; provide the actual realization and sign/twist comparisons.

Consumers: `G.4/picard-point-count`.

### tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion

Import the existing upstream stage as stated; its mathematical construction is not re-planned here. Exact integration exports must be supplied before the consuming nodes are closed.

Consumers: `G.1/fiber-type-divisor`.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv

Import the existing upstream stage as stated; its mathematical construction is not re-planned here. Exact integration exports must be supplied before the consuming nodes are closed.

Consumers: `G.1/five-f2-classes`, `G.1/lang-genus-one`, `G.2/domination-genus`, `G.2/multiple-fiber-isogeny`, `G.6/admissible-transformations`.

### AlgebraicModuliForArithmeticGeometry:R09.1

Relative projective-bundle construction, morphism from a generated invertible sheaf and global Weierstrass isomorphism comparison under degree-preserving changes; distinguish the singular cubic from its regular resolution.

Consumers: `G.3/relative-cubic-contraction`, `G.6/admissible-transformations`.

## Source issues and edition restrictions

The Schröer entries collate already reviewed canonical findings with their attribution; they are not a new independent review. Public-v3 passages were read freshly. Persistence of the two published enumeration errors is attributed only to the maintainer’s selected published-page evidence recorded in the canonical extraction. The complete paywalled published paper was not read in this design. The Szydło and2024-book findings are restricted to the exact author editions read. A correction in another edition is not ruled out.

### ES4 — error

**Locator:** Proposition 3.1, p. 10 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen).

**Printed:** Then Γ(S_ā) → Γ(S_a) is a graph isomorphism respecting edge labels, and the implications (i)⇒(ii)⇔(iii) hold among the following three conditions: (i) The geometric fiber S_ā is reducible. (ii) The closed point a ∈ B is a rational point. (iii) The irreducible components of the schematic fiber S_a are birational to P¹.

**Correction:** Assume in addition that the fiber is singular (f^{−1}_ind(ā) singular) for (ii)⇒(iii).

**Reason:** A smooth elliptic fiber over a rational point, for instance in E × P¹ over F_q, satisfies (ii) but not (iii). The proof of (ii)⇒(iii) uses that the geometric components are rational curves, which holds for singular fibers. Every application in the paper (Propositions 9.2, 9.3 and 11.1) concerns singular fibers. /14 states the corrected proposition.

**Effect:** a stated result. Collated from PAPER-SCHROER-23/E4 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

Canonical finding: `PAPER-SCHROER-23/E4`.

Screen: Annals of Mathematics article page for doi:10.4007/annals.2023.197.1.1 (vol. 197, no. 1, pp. 1–63; no erratum or correction listed) arXiv 2004.07025, abstract page: v3 of 9 August 2022, 'to appear in Ann. of Math'; its comment lists corrections made to the earlier versions only Crossref metadata for 10.4007/annals.2023.197.1.1 (no update or correction relation) the author's publication list at math.uni-duesseldorf.de (entry 62, no erratum) web search for an erratum or corrigendum (none found)

### ES7 — misprint

**Locator:** proof of Proposition 6.1, p. 18 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen).

**Printed:** Multiplying the equation over U with t^{−6} = (t₀/t₁)^6 and comparing coefficients with the equation over U′ we get a′_i = a_i/t^i.

**Correction:** t^{−6} = (t₁/t₀)^6.

**Reason:** t = t₀/t₁, so t^{−6} = (t₁/t₀)^6. The conclusion a′_i = a_i/t^i is right; /71 uses it.

**Effect:** nothing. Collated from PAPER-SCHROER-23/E7 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

Canonical finding: `PAPER-SCHROER-23/E7`.

Screen: Annals of Mathematics article page for doi:10.4007/annals.2023.197.1.1 (vol. 197, no. 1, pp. 1–63; no erratum or correction listed) arXiv 2004.07025, abstract page: v3 of 9 August 2022, 'to appear in Ann. of Math'; its comment lists corrections made to the earlier versions only Crossref metadata for 10.4007/annals.2023.197.1.1 (no update or correction relation) the author's publication list at math.uni-duesseldorf.de (entry 62, no erratum) web search for an erratum or corrigendum (none found)

### ES8 — error

**Locator:** proof of Proposition 6.1, p. 18 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen).

**Printed:** The invertible sheaf L = O_X(3E) is relatively very ample, and yields a closed embedding Z ⊂ P(E).

**Correction:** O_J(3E) is relatively base-point free and defines the contraction J → Z; the sheaf O_Z(3E) on the Weierstrass model is relatively very ample and embeds Z in P(E).

**Reason:** O_J(3E) is trivial on the vertical curves disjoint from E, which Z contracts, so it is not relatively very ample on J. The subscript X also stands for J here.

**Effect:** nothing. Collated from PAPER-SCHROER-23/E8 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

Canonical finding: `PAPER-SCHROER-23/E8`.

Screen: Annals of Mathematics article page for doi:10.4007/annals.2023.197.1.1 (vol. 197, no. 1, pp. 1–63; no erratum or correction listed) arXiv 2004.07025, abstract page: v3 of 9 August 2022, 'to appear in Ann. of Math'; its comment lists corrections made to the earlier versions only Crossref metadata for 10.4007/annals.2023.197.1.1 (no update or correction relation) the author's publication list at math.uni-duesseldorf.de (entry 62, no erratum) web search for an erratum or corrigendum (none found)

### ES13 — error

**Locator:** proof of Proposition 9.3(v), p. 25 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen).

**Printed:** MW(J/P¹) = J(F) = Pic⁰_{Y_F/F}(F) = Pic⁰(Y_F), where F is the function field of the projective line. The latter equality holds because Br(F) = 0, by Tsen's Theorem.

**Correction:** Br(F) ≠ 0 for F = F₂(t). Instead: over F̄₂(t) Tsen's theorem holds, so L ↦ (L − (deg(L|Y_F̄)/2)R)|Y_F̄ is a surjective Galois-equivariant map Pic(Ȳ) → MW(J̄/P̄¹) for an F₂-rational two-section R. Since Pic(Ȳ) has trivial Galois action (constant Picard scheme), so does MW(J̄/P̄¹), and Galois-fixed sections descend: MW(J/P¹) = MW(J̄/P̄¹).

**Reason:** Tsen's theorem concerns k(t) with k algebraically closed. Br(F₂(t)) is non-zero: the cyclic algebra of F₄(t)/F₂(t) and t is non-split, since norms from F₄(t) have even valuation at t = 0. So Pic⁰_{Y_F/F}(F) = Pic⁰(Y_F) is not justified as printed. The statement (v) itself survives by the correction; /94 records it.

**Effect:** the proof. Collated from PAPER-SCHROER-23/E13 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

Canonical finding: `PAPER-SCHROER-23/E13`.

Screen: Annals of Mathematics article page for doi:10.4007/annals.2023.197.1.1 (vol. 197, no. 1, pp. 1–63; no erratum or correction listed) arXiv 2004.07025, abstract page: v3 of 9 August 2022, 'to appear in Ann. of Math'; its comment lists corrections made to the earlier versions only Crossref metadata for 10.4007/annals.2023.197.1.1 (no update or correction relation) the author's publication list at math.uni-duesseldorf.de (entry 62, no erratum) web search for an erratum or corrigendum (none found)

### ES14 — gap

**Locator:** proof of Proposition 9.5, p. 27 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen).

**Printed:** Under the maps in (10), the combination (P − O) − (1 + (P · O))J_ā ∈ W maps to the dual basis vector Θ₁^* ∈ W_ā^*. Since the maps respect the intersection pairing, we conclude that (Θ₁^* · Θ₁^*) ∈ ℚ actually belongs to 2ℤ.

**Correction:** The restriction W → W_ā^* is not an isometry. Argue instead: under the hypothesis, the image of W in W_ā^* is W_ā + ℤΘ₁^*; since W is unimodular, every x ∈ W_ā ⊗ ℚ pairing integrally with W lies in W, and Θ₁^* does. So Θ₁^* ∈ W, and (Θ₁^*)² = −1 contradicts the evenness of W.

**Reason:** Orthogonal projection onto W_ā ⊗ ℚ does not preserve the form, so evenness of W says nothing directly about the norm of the image of an element. The dual-lattice argument gives the stated contradiction; /97 records it.

**Effect:** the proof. Collated from PAPER-SCHROER-23/E14 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

Canonical finding: `PAPER-SCHROER-23/E14`.

Screen: Annals of Mathematics article page for doi:10.4007/annals.2023.197.1.1 (vol. 197, no. 1, pp. 1–63; no erratum or correction listed) arXiv 2004.07025, abstract page: v3 of 9 August 2022, 'to appear in Ann. of Math'; its comment lists corrections made to the earlier versions only Crossref metadata for 10.4007/annals.2023.197.1.1 (no update or correction relation) the author's publication list at math.uni-duesseldorf.de (entry 62, no erratum) web search for an erratum or corrigendum (none found)

### ES15 — error

**Locator:** proof of Proposition 10.3, p. 29 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen).

**Printed:** Indeed, a fiber J_x is unstable if and only if c₄ ∈ F₂[T] vanishes at the point x (Deligne 1975, Proposition 5.1).

**Correction:** A singular fiber J_x is unstable if and only if c₄ vanishes at x.

**Reason:** In characteristic 2, c₄ = a₁⁴ also vanishes at a smooth supersingular fiber (j = 0). The argument only needs that an unstable fiber lies over a zero of c₄, which the correction gives; /102 and /199 record it.

**Effect:** nothing. Collated from PAPER-SCHROER-23/E15 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

Canonical finding: `PAPER-SCHROER-23/E15`.

Screen: Annals of Mathematics article page for doi:10.4007/annals.2023.197.1.1 (vol. 197, no. 1, pp. 1–63; no erratum or correction listed) arXiv 2004.07025, abstract page: v3 of 9 August 2022, 'to appear in Ann. of Math'; its comment lists corrections made to the earlier versions only Crossref metadata for 10.4007/annals.2023.197.1.1 (no update or correction relation) the author's publication list at math.uni-duesseldorf.de (entry 62, no erratum) web search for an erratum or corrigendum (none found)

### ES29 — error

**Locator:** Introduction, p. 3 (third displayed theorem); the same claim opens §10, p. 27 (arXiv v3 = author version of 19 July 2022).

**Printed:** Theorem. (see Thm. 10.4 and Thm. 10.5) Up to isomorphisms, there are exactly eleven Weierstraß equations y²+a₁xy+… = x³+a₂x²+… with coefficients a_i ∈ F₂[t] that define a geometrically rational elliptic surface φ : J → P¹ with constant Picard scheme Pic_{J/F₂} having at most one rational point a ∈ P¹ where J_a is semistable or supersingular.

**Correction:** There are exactly fourteen such Weierstraß equations up to isomorphism: the eleven of Theorems 10.4 and 10.5 and the three recorded in the Theorem 10.4 issue. The paper shows only that every such surface is among its eleven, not that each has constant Picard scheme; the review's exhaustive search confirms that all fourteen do (for geometrically rational J, constant Picard scheme is equivalent to #J(F₂) = 25).

**Reason:** Theorems 10.4 and 10.5 say that under assumptions (i)–(ii) of §10 the fibration 'is given by exactly one of' the listed equations, and their proofs derive only necessary conditions. The converse would need Theorem 9.4, whose hypotheses include descent of every geometric Mordell–Weil section, and that is never checked. The TeX never cites Theorem 9.4 (\ref{constant pic}). The main theorem uses only the necessary direction, which /115 and /117 state correctly. Moreover the list itself is incomplete (Theorem 10.4 issue), so the count 'eleven' is wrong, not only unproved.

**Effect:** a stated result. Collated from PAPER-SCHROER-23/E29 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

Canonical finding: `PAPER-SCHROER-23/E29`.

Screen: arXiv 2004.07025: versions v1–v3 (v3 of 9 August 2022, identical after the first page to the author's version of 19 July 2022) Crossref for doi:10.4007/annals.2023.197.1.1 (Ann. of Math. 197 (2023), 1–63), 23 September 2026: no update-to or relation entries, and no work declaring an update of it the Annals article page (annals.math.princeton.edu/2023/197-1/p01) and a web search for an erratum or corrigendum, 23 September 2026: none found Published pp. 3 and 33: maintainer checked the later version of record on 2026-09-30; the relevant defect persists. Selected-page evidence and PDF hash: https://github.com/CBirkbeck/tauceti-explorer/issues/4976#issuecomment-5915303984. This worker did not read the paywalled PDF; no private PDF or extracts are supplied.

### ES34 — error

**Locator:** Theorem 10.4, p. 29, and its proof, p. 31 (twisted semistable case); the count in the introduction to Section 10, p. 28 (arXiv v3 = author version of 19 July 2022).

**Printed:** Up to coordinate changes and automorphisms of the projective line, the fibration φ:J→P¹ is given by exactly one of the following eight Weierstraß equations … If the semistable fiber is twisted, we have r_c≤2 and n_c=2r_c+2. Now (11) becomes r_a+i+r_c=11 and thus r_c≥11−i−r_a≥7, and the argument is similar. Summing up, we have the following possibilities: I₁*+E₄+I₄, III*+E₄+I₂, III*+E₂+Ĩ₂, II*+E₄+I₁, II*+E₂+Ĩ₁. … (p. 28) It turns out that there are exactly eleven such Weierstraß equations

**Correction:** The twisted case also gives I₂*+E₄+Ĩ₂, I₃*+E₄+Ĩ₁ and IV*+E₄+Ĩ₂. Theorem 10.4 has eleven models, not eight, and §10 has fourteen equations in all. The additional models, with fibres over t=0, 1, ∞, are: y²+txy+t³y=x³+x² [I₂*+E₄+Ĩ₂, Δ=t¹⁰, j=t²]; y²+txy+t³y=x³+tx² [I₃*+E₄+Ĩ₁, Δ=t¹¹, j=t]; y²+txy+t²y=x³+t²x² [IV*+E₄+Ĩ₂, Δ=t⁸(t²+t+1), j=t⁴/(t²+t+1), plus I₁ over t²+t+1=0]. Theorem 10.5 is correct. Proposition 11.1 (p. 33) and the key-reduction proposition of §11 take their elliptic column from Theorem 10.4. The proof of Theorem 15.1 reduces every fibration to I₁*+I₄ or I₂*+III+III. All of these must treat the three configurations; I₃* is never mentioned in §§11–15. On an Enriques surface Y, the multiple fibres would lie over the unstable and the E₄ points, because Ĩ₁ and Ĩ₂ are semistable. Until then the proof of the main theorem has a gap at this point. Whether the configurations occur on a non-exceptional Enriques surface over F₂ with constant Picard scheme is not settled here.

**Reason:** Checked by hand for y²+txy+t³y=x³+x². Δ=t¹⁰. At t=0 (Tate's algorithm): the reduction y²=x³+x² is singular at (0,0), and b₂=t², so the fibre is additive; v(a₆)=∞, v(b₈)=6, v(b₆)=6. The change y↦y+x gives a₂=t, a₄=t³ and P(T)=T³+T²=T²(T+1). Then a_{3,2}=a_{6,4}=0, and a_{2,1}X²+a_{4,3}X+a_{6,5}=X²+X has distinct rational roots. So I₂* with c=4, all seven components defined over F₂, 15 points. At ∞: y²+xy+y=x³+s²x², Δ′=s², node at (1,1) with tangent polynomial T²+T+1, so non-split I₂, 6 points. At t=1: y²+xy+y=x³+x² is smooth ordinary with 4 points (E₄). Total 25, so the trace of Frobenius on NS(J̄) is 10 and Pic_{J/F₂} is constant. Condition (ii) holds: only Ĩ₂ is semistable, and E₄ is ordinary. The other two models are checked the same way: I₃* at t=0 after three steps of the I_n* loop, and IV* at t=0 (Y²+Y distinct roots, c=3). Independent checks (scripts S/tate2.py, brute.py, classify.py, lcheck.py): (1) all 2²¹ equations were enumerated through their 2¹⁸ representatives with a₂=0 (every equation becomes one via x↦x+a₂), with Tate's algorithm at every place; this gives exactly 14 isomorphism classes, taken modulo the 512 coordinate changes of degree ≤(2,1,3) and PGL₂(F₂), that satisfy (i) and (ii); these are the 11 printed and the 3 above, one class per configuration; (2) for every class, the L-function of the generic fibre was computed from naive point counts at all places of degree ≤8; it equals (1−2T)^r with r=8−Σ(m_v−1), which confirms the component counts and the Galois-trivial Mordell–Weil action independently of Tate's algorithm; (3) for all 2¹⁸ normalised equations, Ogg's formula (v(Δ)≥e, δ=0 for I_n, IV, IV*) and Σ deg(v)·v(Δ)=12 hold. The proof's other claims were also reproduced: II*+E₂+E₄, I₃*+E₄+E₄ and IV*+E₄+I₃ are excluded, d₁=1 and 1+t are equivalent in the I₄* case, the second I₁* solution is twisted, and α=1 gives E₂. The error is the unexamined twisted case ('the argument is similar'): the tuples (r_a,i,r_c)=(7,2,2) and (8,2,1) yield these configurations.

**Effect:** a stated result. Collated from PAPER-SCHROER-23/E34 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

Canonical finding: `PAPER-SCHROER-23/E34`.

Screen: arXiv 2004.07025: versions v1–v3 (v3 of 9 August 2022, identical after the first page to the author's version of 19 July 2022) Crossref for doi:10.4007/annals.2023.197.1.1 (Ann. of Math. 197 (2023), 1–63), 23 September 2026: no update-to or relation entries, and no work declaring an update of it the Annals article page (annals.math.princeton.edu/2023/197-1/p01) and a web search for an erratum or corrigendum, 23 September 2026: none found Published pp. 34–36 (Theorem 10.4, Table 1 and proof): maintainer checked the later version of record on 2026-09-30; the relevant defect persists. Selected-page evidence and PDF hash: https://github.com/CBirkbeck/tauceti-explorer/issues/4976#issuecomment-5915303984. This worker did not read the paywalled PDF; no private PDF or extracts are supplied.

### ES36 — error

**Locator:** proof of Proposition 9.5, p. 26 (arXiv v3 = author version of 19 July 2022).

**Printed:** Our task is to verify that the Galois action of G=Gal(F₂^alg/F₂) on the dual graph Γ=Γ(J_ā) is trivial. Since it is a tree, it suffices that check that all terminal vertices are fixed. … For Kodaira symbols IV and IV* there are also two remaining terminal vertices besides v₀∈Γ.

**Correction:** For IV the dual graph (§2: an edge for each pair of meeting components) is a triangle, not a tree, and has no terminal vertices. Argue directly: Θ₀ is fixed, and a section defined over F₂ through a second component fixes it. The third component is then fixed as well.

**Reason:** The three components of IV pass through one point, so they meet pairwise. The lattice argument (A₂ is not unimodular) still gives such a section, so the conclusion stands.

**Effect:** nothing. Collated from PAPER-SCHROER-23/E36 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

Canonical finding: `PAPER-SCHROER-23/E36`.

Screen: arXiv 2004.07025: versions v1–v3 (v3 of 9 August 2022, identical after the first page to the author's version of 19 July 2022) Crossref for doi:10.4007/annals.2023.197.1.1 (Ann. of Math. 197 (2023), 1–63), 23 September 2026: no update-to or relation entries, and no work declaring an update of it the Annals article page (annals.math.princeton.edu/2023/197-1/p01) and a web search for an erratum or corrigendum, 23 September 2026: none found the published version is behind the journal's paywall and could not be read, so whether print differs from the preprint here is not established

### ES37 — error

**Locator:** proof of Proposition 9.5, p. 26 (arXiv v3 = author version of 19 July 2022).

**Printed:** If there is at most one further terminal vertex, it must be fixed as well. This already settles the cases where the Kodaira symbol is III, III* or II*.

**Correction:** For III* (Ẽ₇) and II* (Ẽ₈) there are two further terminal vertices, of multiplicities 1 and 2, resp. 2 and 3. They are fixed because the Galois action preserves multiplicities, or equivalently because these graphs have no non-trivial automorphism fixing v₀. The count 'at most one further' is right for the multiplicity-one vertices only.

**Reason:** Ẽ₇ has three terminal vertices (multiplicities 1, 1, 2) and Ẽ₈ has three (1, 2, 3).

**Effect:** nothing. Collated from PAPER-SCHROER-23/E37 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

Canonical finding: `PAPER-SCHROER-23/E37`.

Screen: arXiv 2004.07025: versions v1–v3 (v3 of 9 August 2022, identical after the first page to the author's version of 19 July 2022) Crossref for doi:10.4007/annals.2023.197.1.1 (Ann. of Math. 197 (2023), 1–63), 23 September 2026: no update-to or relation entries, and no work declaring an update of it the Annals article page (annals.math.princeton.edu/2023/197-1/p01) and a web search for an erratum or corrigendum, 23 September 2026: none found the published version is behind the journal's paywall and could not be read, so whether print differs from the preprint here is not established

### ES45 — misprint

**Locator:** Proof of Theorem 10.4, p. 30 (arXiv v3 = author version of 19 July 2022).

**Printed:** For r_a = 7 we get r_a ≥ 3

**Correction:** For r_a = 7 we get r_c ≥ 3.

**Reason:** The bound r_c≥10−r_a yields r_c≥3 when r_a=7; repeating r_a is the wrong variable.

**Effect:** nothing. Collated from PAPER-SCHROER-23/E45 and its independent REV-PAPER-SCHROER-23 verdict; this design freshly read the relevant public-v3 passages. Published persistence is attributed only to the maintainer evidence where the canonical finding records it.

Canonical finding: `PAPER-SCHROER-23/E45`.

Screen: Annals of Mathematics article page for doi:10.4007/annals.2023.197.1.1 (vol. 197, no. 1, pp. 1–63; no erratum or correction listed) arXiv 2004.07025, abstract page: v3 of 9 August 2022, 'to appear in Ann. of Math'; its comment lists corrections made to the earlier versions only Crossref metadata for 10.4007/annals.2023.197.1.1 (no update or correction relation) the author's publication list at math.uni-duesseldorf.de (entry 62, no erratum) web search for an erratum or corrigendum (none found)

### ESY1 — misprint

**Locator:** Author preprint p3 equation(4), image inspected.

**Printed:** c₄=b₂²+24b₄

**Correction:** c₄=b₂²−24b₄

**Reason:** For a₄=1 and the other coefficients0 over Q, b₄=2; the correct c₄ is−48. The baseline c₄ definition uses the minus sign. The error disappears in characteristics2 and3 but not in the general recalled formula.

**Effect:** nothing. No correction located; exact edition restriction retained.

Screen: The cited public author edition and its relevant source passages, read2026-10-02. Repository canonical extraction/findings and bibliographic links screened2026-10-02; no separate correction identified.

### ESY2 — misprint

**Locator:** Author preprint p3 equation(4), image inspected.

**Printed:** c₆=b₂³+36b₂b₄−216b₆

**Correction:** c₆=−b₂³+36b₂b₄−216b₆

**Reason:** For a₁=1 and the other coefficients0, the source formula gives1 but the standard polynomial invariant gives−1. Baseline c₆ was read and fixes the convention.

**Effect:** nothing. No correction located; exact edition restriction retained.

Screen: The cited public author edition and its relevant source passages, read2026-10-02. Repository canonical extraction/findings and bibliographic links screened2026-10-02; no separate correction identified.

### ECD1 — misprint

**Locator:** April19,2024 author edition p366, proof of4.1.6(1).

**Printed:** deg L=−χ(O_C)−h⁰(T)

**Correction:** deg L=−χ(O_X)−length(T)

**Reason:** Leray and curve Riemann–Roch give χ(O_X)=−deg L−length(T). For a rational Jacobian over P¹, deg L=−1; substituting the base Euler characteristic fails for other χ(O_X). The stated theorem uses the total-space term correctly.

**Effect:** the proof. No correction located; exact edition restriction retained.

Screen: The cited public author edition and its relevant source passages, read2026-10-02. Repository canonical extraction/findings and bibliographic links screened2026-10-02; no separate correction identified.

### ECD2 — error

**Locator:** April19,2024 author edition p394 Lemma4.4.1(2).

**Printed:** If n≥0, then the sheaf f_*O_X(nE) is locally free of rank equal to n.

**Correction:** Use n>0; at n=0 the rank is1.

**Reason:** A fibration satisfies f_*O_X=O_B. This contradicts rank0 at n=0. The proof and the application require positive n only.

**Effect:** a stated result. No correction located; exact edition restriction retained.

Screen: The cited public author edition and its relevant source passages, read2026-10-02. Repository canonical extraction/findings and bibliographic links screened2026-10-02; no separate correction identified.

### ECD3 — error

**Locator:** April19,2024 author edition p365, proof of4.1.6.

**Printed:** The length of T at a point t is equal to h¹(O_Xt)−1.

**Correction:** The fiber excess measures the number of torsion generators dimκ(t)(T⊗κ(t)), not the module length in general. Use length(T) only in the global Euler-characteristic formula.

**Reason:** For a DVR module T=R/(π²), its length is2 while dimκ(T⊗κ)=1. Proper-curve top-degree base change gives fiber rank1 plus that fiber dimension; equality with length needs an additional annihilation hypothesis.

**Effect:** the proof. No correction located; exact edition restriction retained.

Screen: The cited public author edition and its relevant source passages, read2026-10-02. Repository canonical extraction/findings and bibliographic links screened2026-10-02; no separate correction identified.

### ECD4 — misprint

**Locator:** April19,2024 author edition p267 Proposition2.2.5, I₃,IV and I_n rows; images inspected.

**Printed:** I₃ and IV: Ã₃; I_n: Ã_n

**Correction:** I₃ and IV use Ã₂; I_n uses Ã_(n−1).

**Reason:** There are3 or n vertices, whereas an affine Ã_r diagram has r+1 vertices. The book’s own comparison table onp268 gives the corrected n−1 convention.

**Effect:** nothing. No correction located; exact edition restriction retained.

Screen: The cited public author edition and its relevant source passages, read2026-10-02. Repository canonical extraction/findings and bibliographic links screened2026-10-02; no separate correction identified.

### ECD5 — misprint

**Locator:** April19,2024 author edition p267 Proposition2.2.5, star row; image inspected.

**Printed:** I*_(n+4); R₁·R₄=R₂·R₄=…=R_(4+n)·R₂=R_(4+n)·R₃=1

**Correction:** Use I_n* with n+5 components. At the left end use R₀·R₄=R₁·R₄=1; the right ends are R₂,R₃.

**Reason:** The displayed support has n+5 vertices, so its Kodaira index is n. As printed R₀ is isolated and R₂ meets both ends for n>0; the corrected graph has the affine D_(n+4) shape and null-root multiplicities.

**Effect:** nothing. No correction located; exact edition restriction retained.

Screen: The cited public author edition and its relevant source passages, read2026-10-02. Repository canonical extraction/findings and bibliographic links screened2026-10-02; no separate correction identified.

### ECD6 — misprint

**Locator:** April19,2024 author edition p268 Proposition2.2.5, IV* row; image inspected.

**Printed:** R₀·R₁=R₁·R₂=R₁·R₄=R₂·R₃=R₃·R₄=R₄·R₅=R₅·R₆=1

**Correction:** Remove R₁·R₂=1; all unlisted pairings remain0.

**Reason:** The extra edge creates a cycle in the seven-vertex graph and violates the displayed primitive null-root equation. Removing it leaves the three length2 arms of affine E₆.

**Effect:** nothing. No correction located; exact edition restriction retained.

Screen: The cited public author edition and its relevant source passages, read2026-10-02. Repository canonical extraction/findings and bibliographic links screened2026-10-02; no separate correction identified.

### ECD7 — misprint

**Locator:** April19,2024 author edition p268 Proposition2.2.5, II* row; image inspected.

**Printed:** D=2R₀+2R₁+4R₂+6R₃+5R₄+4R₅+3R₆+2R₇+R₈

**Correction:** The coefficient of R₀ is3.

**Reason:** R₀ meets only R₃, of multiplicity6. With R₀²=−2, the printed vector gives D·R₀=−4+6=2; coefficient3 gives0 and the affine E₈ null root.

**Effect:** nothing. No correction located; exact edition restriction retained.

Screen: The cited public author edition and its relevant source passages, read2026-10-02. Repository canonical extraction/findings and bibliographic links screened2026-10-02; no separate correction identified.

### ECD8 — misprint

**Locator:** April19,2024 author edition p366 proof of4.1.6(2); image inspected.

**Printed:** D_t=m_t Xbar_t; if a_t>m_t

**Correction:** Use D_t=a_t Xbar_t and rule out a_t≥m_t.

**Reason:** The evaluation divisor was just written with coefficient a_t; its pushforward criterion rules out even equality, establishing the required strict inequality a_t<m_t.

**Effect:** the proof. No correction located; exact edition restriction retained.

Screen: The cited public author edition and its relevant source passages, read2026-10-02. Repository canonical extraction/findings and bibliographic links screened2026-10-02; no separate correction identified.

## Reading ledger

The first nine receipts below are inherited from the merged checkpoint, not new reading claims by codex-a71f92. This continuation read the specifically listed Temkin–Tyomkin proofs and six Stacks passages, recorded after those receipts. It preserves the existing twenty-one source findings and makes no new erratum claim.

The principal source chain is Schröer’s genus-one analysis, Ferrand’s pinching theorem, Witaszek’s conductor groupoids, LLR’s model comparison with its corrigendum, and Bombieri–Mumford’s canonical bundle formula. Serge Lang1956 supplies the original finite-field group argument; it is distinct from William Lang2000 on characteristic-two elliptic surfaces. Szydło handles imperfect-residue qualifications. The2024 Cossec–Dolgachev–Liedtke author manuscript supplies additional consumer passages and has not been substituted silently for the1989 book.

### schroer — There is no Enriques surface over the integers

Stefan Schröer. arXiv:2004.07025v3, 9 August 2022; separate from Annals197(2023). [Public copy](https://arxiv.org/pdf/2004.07025v3). Accessed 2026-10-02. SHA-256: `ae6481f25627867473ba40db3b08e5f4b861de8aa103204eefc5ad1123a46d61`.

Actually read: §§3,6,7–10 including proofs; relevant introductory qualifications and bibliography.

### ferrand — Conducteur, descente et pincement

Daniel Ferrand. Bulletin de la SMF 131(4) (2003), 553–585. [Public copy](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf). Accessed 2026-10-02. SHA-256: `4f1f2438ad6d757d67d2ecf154b1bc920d210d8abd54c02e6acd020805629d91`.

Actually read: §§1.1–1.4,4.1–4.4,5.1–5.6,7.1–7.2 and proof of 7.1.

### witaszek — Keel’s base point free theorem and quotients in mixed characteristic

Jakub Witaszek. Annals of Mathematics 195 (2022), 655–705. [Public copy](https://par.nsf.gov/servlets/purl/10429755). Accessed 2026-10-02. SHA-256: `d71bd9254d80145a84f13059f18d37d6f777008900ab907b14d195bb61414ea0`.

Actually read: §2.4, Definition 2.17 and Lemmas 2.18–2.26; §2.5 Definition 2.27 and Lemma 2.28.

### llr — Néron models, Lie algebras, and reduction of curves of genus one

Qing Liu, Dino Lorenzini, Michel Raynaud. Inventiones Mathematicae 157 (2004), 455–518, author copy. [Public copy](https://www.math.u-bordeaux.fr/~qliu/articles/LLR.pdf). Accessed 2026-10-02. SHA-256: `8cdd88f941467206ecc2e37049ba832460d5b2cd7102f50d93124d02fc5bff8a`.

Actually read: Theorem5.9 and proof; §6 pp494–497, Facts6.1, Lemma6.3, Corollary6.5, Theorem6.6 and Remark6.8; Proposition7.1 and start of its proof. The full64-page paper was not read..

### llr-corrigendum — Corrigendum to Néron models, Lie algebras, and reduction of curves of genus one

Qing Liu, Dino Lorenzini, Michel Raynaud. Inventiones Mathematicae 214 (2018), 593–604. [Public copy](https://www.math.u-bordeaux.fr/~qliu/articles/CorrigendumToNeronModelsLieAlg.pdf). Accessed 2026-10-02. SHA-256: `d2afb75093c7b97fcc146f326e572ad1c195811182b3eb371e0cccc45106273f`.

Actually read: Introduction and corrected statements §§1–3, pp593–595; distinction Pic⁰(X_K) versus Jacobian K-points.

### szydlo — Elliptic fibers over non-perfect residue fields

Michael Szydło. Author preprint September 28, 2003; published JNT 104 (2004), 75–99. [Public copy](http://szydlo.com/imperfect92803.pdf). Accessed 2026-10-02. SHA-256: `688e075a51d9f9a9e1dae77184e87ffa7d6ec2ca6e592960c698477f0df78c9f`.

Actually read: Introduction; §2, including image inspection of p3 equations (4); §3 Theorem 3.1 and restricted standard-type geometry.

### bm — Enriques’ classification of surfaces in char. p, II

Enrico Bombieri and David Mumford. Complex Analysis and Algebraic Geometry (1977), 23–42; author scan. [Public copy](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf). Accessed 2026-10-02. SHA-256: `89aa220711128c1dc78d12bc37106329790748fa0dba4f67623578c78488c09e`.

Actually read: Introduction pp23–26; §1 pp27–30, canonical bundle formula Theorem 2 and Proposition 4 with proofs.

### lang56 — Algebraic groups over finite fields

Serge Lang. American Journal of Mathematics 78 (1956), 555–563; scan. [Public copy](https://wstein.org/papers/bib/Lang-Algebraic_Groups_Over_Finite_Fields.pdf). Accessed 2026-10-02. SHA-256: `665286caefaa894cf789f3b4ce3027accdf4d583836e8b13aafeab744373b44d`.

Actually read: Images pp555–558: Proposition 1, Proposition 2, Theorem 1 and corollary, Theorem 2 and proof.

### cdl — Enriques Surfaces I

François Cossec, Igor Dolgachev, Christian Liedtke. Author manuscript dated April 19, 2024; not the 1989 edition. [Public copy](https://sites.lsa.umich.edu/idolga/wp-content/uploads/sites/1334/2024/08/EnriquesOne.pdf). Accessed 2026-10-02. SHA-256: `3c6bf1d54954e28728935bbe1f4b1e38435fe469cf2b8543d657087815a2f526`.

Actually read: Front matter, dated April19,2024; §2.2 pp264–268, including image inspection of267–268; §4.1 selected pp359–370, image inspection365–366; §4.4 pp393–398, image inspection394; incidental §4.8 pp462–463. Sections4.2–4.3 and the full book were not read..

The publicly retrieved1989 book file contains eight preliminary pages, not its mathematics; no1989 theorem is claimed read. EGAIV4 and Raynaud passages were checked in the earlier same-session repair work and are attributed as such. Their fresh acquisition and exact adapter decomposition remain open. William Lang2000, DOI10.1080/00927870008827190, has not been obtained. No full source book or full recursive chain is claimed covered by this selected reading.

### temkin-tyomkin — Ferrand pushouts for algebraic spaces

Michael Temkin and Ilya Tyomkin. Author PDF, arXiv:1305.6014v3, 27 May 2016; distinguished from the Eur. J. Math. 2 (2016) journal pagination. [Public copy](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf). Accessed 2026-10-02. SHA-256: `a63ce8b3bcdee4ae616ddf6bee66c9857a1a9f0e55866b813bd1415f9c6f1517`.

Actually read: This continuation: selected definitions §2.1–2.2 and Lemma2.1.6; §3.3.8–3.4.1 flat patching; Lemma4.1.2, Theorem4.2.1 and proof, Example4.2.3, Theorem4.2.4, Lemma4.3.1 and Theorems4.4.1–4.4.2 with proofs; §5.1–5.3 finite cofinality and affine lifting proofs; Theorems6.1.1,6.2.1–6.2.2 and6.3.2 with displayed proofs, Theorem6.3.5 finite case. The complete paper and all recursive sources were not read.

### stacks-04D1 — Lemma10.143.10: lifting étale ring maps along quotients

The Stacks Project Authors. Public HTML retrieved 2 October 2026; tag-stable identity, displayed numbering on that date. [Public copy](https://stacks.math.columbia.edu/tag/04D1). Accessed 2026-10-02. SHA-256: `11a0a6e46f55de460fce17a06dc9202700ba0c0cf36583839f4cc0993f37a85a`.

Actually read: This continuation: full displayed statement and proof; recursively cited foundational facts are requested at SF.1.

### stacks-082J — Lemma76.34.2: quasi-finite separated algebraic-space comparison

The Stacks Project Authors. Public HTML retrieved 2 October 2026; tag-stable identity, displayed numbering on that date. [Public copy](https://stacks.math.columbia.edu/tag/082J). Accessed 2026-10-02. SHA-256: `aa75987e2a2c96b4d2f1aaa782f2c14c6c709c4f27c48d3ee685e6a9fa2a4b73`.

Actually read: This continuation: full displayed statement and proof; recursively cited foundational facts are requested at SF.1.

### stacks-04S6 — Theorem80.10.1: algebraic-space quotients of flat equivalence relations

The Stacks Project Authors. Public HTML retrieved 2 October 2026; tag-stable identity, displayed numbering on that date. [Public copy](https://stacks.math.columbia.edu/tag/04S6). Accessed 2026-10-02. SHA-256: `a901d1ab1b7e4ae5551156a7d1e9f6d9fee3962eb890e488da949e4359972c9a`.

Actually read: This continuation: full displayed statement and proof; recursively cited foundational facts are requested at SF.1.

### stacks-02X4 — Lemma65.13.1: automatic diagonal properties

The Stacks Project Authors. Public HTML retrieved 2 October 2026; tag-stable identity, displayed numbering on that date. [Public copy](https://stacks.math.columbia.edu/tag/02X4). Accessed 2026-10-02. SHA-256: `a1023facab16dd6c3cafd6488790bed502427202ad9e56f6f3e536e8527b59cb`.

Actually read: This continuation: full displayed statement and proof; recursively cited foundational facts are requested at SF.1.

### stacks-05Z2 — Lemma67.9.8: separatedness under universally closed surjections

The Stacks Project Authors. Public HTML retrieved 2 October 2026; tag-stable identity, displayed numbering on that date. [Public copy](https://stacks.math.columbia.edu/tag/05Z2). Accessed 2026-10-02. SHA-256: `109a809bb61c4b847bbc1c77f3e06d46b5b11d4dff17b31624e2381494a339be`.

Actually read: This continuation: full displayed statement and proof; recursively cited foundational facts are requested at SF.1.

### stacks-0417 — Section67.50: separated locally quasi-finite representability

The Stacks Project Authors. Public HTML retrieved 2 October 2026; tag-stable identity, displayed numbering on that date. [Public copy](https://stacks.math.columbia.edu/tag/0417). Accessed 2026-10-02. SHA-256: `1890e69e9da77eb3d6027f1603f3892d3281fd1d404ebdf83c299c80b6e96d68`.

Actually read: This continuation: Lemma67.50.1 and Proposition67.50.2, their statements and complete displayed proofs. Recursive cited prerequisites are SF.1 requests, not silently claimed closed.

## Routed-item ledger

All78 items of the original GenusOneFibrationsAndRationalEllipticSurfaces route are accounted for. An import disposition retains its owner; a node disposition names the local contract. Where an item combines an Enriques application with a genus-one supplier, the qualification preserves that separation.

| Input item | Disposition | Qualification |
| --- | --- | --- |
| PAPER-SCHROER-23/13 | node: G.1/fiber-type-divisor | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/14 | node: G.1/component-descent | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/15 | node: G.1/count-15 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/16 | node: G.1/count-16 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/17 | node: G.1/count-17 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/18 | node: G.1/count-18 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/19 | node: G.1/count-19 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/20 | node: G.1/E1 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/21 | node: G.1/E2 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/22 | node: G.1/E3 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/23 | node: G.1/E4 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/24 | node: G.1/E5 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/25 | node: G.1/five-f2-classes | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/71 | node: G.3/bounded-weierstrass | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/72 | node: G.3/rational-canonical | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/73 | node: G.3/pushforward-splitting | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/74 | node: G.3/coefficient-nondegeneracy | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/81 | node: G.2/multiple-fiber-isogeny | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/82 | node: G.2/extension-counts | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/83 | node: G.2/f2-isomorphism | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/84 | node: G.2/domination-genus | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/85 | node: G.2/equality-regular | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/86 | node: G.2/diagonal-quotient-example | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/95 | node: G.4/fiber-count-data | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/96 | node: G.4/picard-constancy-criterion | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/97 | node: G.4/additive-graph-rigidity | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/98 | node: G.3/even-complement | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/99 | node: G.2/llr-kodaira-comparison | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/100 | node: G.4/large-fiber | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/101 | node: G.4/reducible-additive | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/102 | node: G.4/unique-additive | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/103 | node: G.4/small-additive | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/104 | node: G.5/model-1 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/105 | node: G.5/model-2 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/106 | node: G.5/model-3 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/107 | node: G.5/model-4 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/108 | node: G.5/model-5 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/109 | node: G.5/model-6 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/110 | node: G.5/model-7 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/111 | node: G.5/model-8 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/112 | node: G.5/model-9 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/113 | node: G.5/model-10 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/114 | node: G.5/model-11 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/115 | node: G.6/nonzero-j-classification | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/116 | node: G.5/nonrational-nonzero-j | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/117 | node: G.6/zero-j-classification | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/118 | node: G.5/nonrational-zero-j | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/167 | node: G.1/fiber-type-divisor | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/168 | node: G.1/geometric-kodaira | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/169 | node: G.1/degenerate-fiber | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/170 | node: G.1/nonsplit-i1 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/171 | node: G.1/nonsplit-i2 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/189 | node: G.1/canonical-type-classification | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/190 | node: G.1/component-descent | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/191 | node: G.3/canonical-bundle | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/192 | node: G.3/tame-wild | The Enriques-specific quotient assertion in245 and the H¹=0 application in192 are imported consumer applications, not new Enriques classification targets. |
| PAPER-SCHROER-23/193 | node: G.1/lang-genus-one | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/194 | node: G.1/finite-field-p1-forms | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/195 | supplier: tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1 — An F_q-isogeny gives equality of all extension-field point counts, via rational Tate-module Frobenius and the point-count formula; do not request the converse of Tate1966. | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/196 | node: G.3/rational-picard-lattice | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/197 | node: G.3/quasielliptic-characteristic | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/198 | node: G.4/lang-configuration-inputs | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/206 | node: G.3/tsen-obstruction | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/209 | node: G.3/global-minimal-jacobian | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/222 | supplier: tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces — Zariski fiber-intersection lemma with primitive multiplicity vector generating the radical and every proper component submatrix negative definite; import its geometric realization, not a second abstract numerical type. | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/224 | node: G.1/genus-one-fibration | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/225 | node: G.1/small-conductor-classification | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/226 | supplier: tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1 — Import ordinary/supersingular definitions and the characteristic2 equivalence a₁=0 iff j=0 for smooth elliptic curves. The baseline j lemma supplies only the invariant equivalence; no bad-fiber criterion follows without Δ=0. | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/227 | supplier: tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs — Normalization commutes with every field extension when the normalization is smooth over the original field; verify the geometrically reduced target and finite birational comparison. The hypothesis is stronger than reducedness of the target. | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/234 | supplier: SchemeAndStackFoundations:SF.5 — Define geometrically rational surface using birationality to P² after algebraic closure, with geometric integrality. Export smooth proper rational-surface birational invariance, H¹=H²(O)=0, étale torsion-free Picard=Num, b₁=0 and b₂=ρ. Read a full rational-surface theorem proof; do not infer geometric smoothness from birationality alone. | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/237 | node: G.3/shioda-tate | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/238 | node: G.5/model-12 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/239 | node: G.5/model-13 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/240 | node: G.5/model-14 | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/245 | node: G.3/generic-picard-restriction | The Enriques-specific quotient assertion in245 and the H¹=0 application in192 are imported consumer applications, not new Enriques classification targets. |
| PAPER-SCHROER-23/247 | node: G.6/completeness | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/252 | node: G.2/transverse-divisor | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |
| PAPER-SCHROER-23/253 | node: G.2/cohomology-adapter | Statements retain the corrected source hypotheses; unresolved proof inputs are named in gaps. |

## Closure and continuation

Inherited checkpoint evidence: the previous worker reported zero checker errors/warnings, an acyclic typed-dependency audit, normalized source anchors, coefficient checks and the F₂ five-orbit check. Those unrelated coefficient/orbit computations were not rerun by this continuation. New continuation checks cover the actual repository checker and intake rules, preservation of all old IDs/routes/source findings, added dependency edges (including the new SF.3 stage edge), reader/packet and signature-or-omission parity, source download hashes and whitespace. The inherited source receipt is not a fresh whole-paper verification. Lean was not compiled: no existing build at the pinned commits was available, and no Lake project, cache download or library build was created.

The stock checker currently parses every `tauceti:` prefix as a baseline declaration before testing whether it names an atlas stage. Canonical upstream IDs are therefore kept in the roadmap requires graph, node upstreamPrerequisites and requests. They have not been relabeled as fictional baseline declarations. This workaround explicitly leaves node-level integration open; restore canonical prerequisites when the checker supports them or replace them by genuine finer exports. The mathematical audit includes all76 typed edges, so passing the stock checker does not discard those dependencies.

### Algebraic-space exports and signatures for the verified pinching chain

Temkin–Tyomkin v3 Theorems5.3.1(ii),6.2.1(ii)(b) verify finite-pinching existence without affine-neighborhood, Noetherian or quasi-separated assumptions. The twelve consumer declarations now give the étale construction, universal property and scheme criterion. Their SF.1 algebraic-space carrier, exact descent/quotient/lifting/representability exports and SF.3 flat patching equivalence are requests, not existing declarations. Full algebraic-space Lean signatures remain omitted with exact names and contracts; no fabricated carrier substitutes for them. This is now an export/type/proof integration gap, not uncertainty about a primary existence theorem.

Needed by: `key/ferrand-pushouts`, `G.0/pinching-etale-cover`, `G.0/affine-space-hom-injective`, `G.0/affine-space-hom-surjective`, `G.0/pinching-etale-relation`, `G.0/pinching-overlap-scheme`, `G.0/algebraic-space-existence`, `G.0/space-cartesian`, `G.0/space-geometric`, `G.0/space-finite`, `G.0/space-closed`, `G.0/space-flat-base-change`, `G.0/space-scheme-recognition`.

### Numerical-Picard geometric descent bridge

Schröer3.1 imports its Theorem2.1. A full source proof and declaration-sized component-class uniqueness/Galois-descent bridge to SF.5 and the Picard owners are not yet supplied. The finite-field component/count conclusions are conditional on this explicitly requested bridge.

Needed by: `G.1/component-descent`.

### Lang general theorem owner and proof closure

The four-page original argument is read. The general smooth-connected-group theorem needs a foundational owner beyond the reductive-only group roadmap; this packet owns only the genus-one consumer. Decompose the generic-point/separable-extension argument or supply a primary modern proof at that owner, then replace this consumer gap by exact nodes.

Needed by: `G.1/lang-genus-one`.

### EGA and Raynaud source-level adapter closure

The needed statements were checked in the earlier FIX-RT-PAPER-SCHROER-23 work (18.5.11(c),6.1.4 and8.2.1), not freshly reacquired in this design. Before marking G.2 closed, reread those exact public editions and provide the local horizontal-component and (N)* verification as individual proof nodes with exact owner exports.

Needed by: `G.2/transverse-divisor`, `G.2/normal-dominating-model`, `G.2/cohomology-adapter`.

### LLR recursive proof prerequisites

The6.6 proof,5.9 and7.1 statements and the corrigendum are read, but the recursive Lie/Picard comparison, Saito conductor equality and period-index inputs are not fully source-decomposed in the R11 suppliers. This is a proof gap, not a permission to apply6.6 over F₂.

Needed by: `G.2/llr-kodaira-comparison`.

### Canonical bundle and wild-fiber proof closure

Bombieri–Mumford Theorem2/Proposition4 are read. The general duality and coherent relative cohomology are supplier requests. Raynaud’s multiplicity/order theorem6.3.5 still needs original-source reading and exact decomposition at its Picard owner before the tame↔ν=m equivalence is closed.

Needed by: `G.3/canonical-bundle`, `G.3/tame-wild`.

### Rational-surface classification proof source

The geometric blowup/rationality input is cited by Schröer but not proved in its relevant sections. The1989 Cossec–Dolgachev public file contains only preliminary pages. The2024 author edition supplies a useful consumer account; a source-closed rational-surface minimal-model/blowup proof and the corresponding SF.5 export are still required.

Needed by: `G.3/rational-picard-lattice`.

### Quasielliptic generality beyond the smooth model supplier

StableReduction Layer5 supplies smooth proper generic curves. The non-smooth regular genus-one compactification, global gluing over B, characteristic2 allowed fibers and2-torsion Picard group need a complete primary proof. The2024 consumer passages refer to Tate genus change and later Jacobian/group comparisons; those recursive sources were not all read.

Needed by: `G.3/quasielliptic-characteristic`, `G.3/global-minimal-jacobian`, `G.1/canonical-type-classification`.

### William Lang2000 source acquisition and decomposition

The exact article Configurations of singular fibers on rational elliptic surfaces in characteristic two, Comm.Algebra28(12),5813–5836, DOI10.1080/00927870008827190, was not obtained from the public searches. The node lists each required input as a worklist, not a closed declaration. Acquire it and split its assertions, or replace them by independently certified complete finite calculations. The route item/247 remains open.

Needed by: `G.4/lang-configuration-inputs`, `G.6`.

### Actual resolved model certificates

The14 equations, their degree bounds and invariant identities are explicit. The individual source reports and prior independent review supply leads, but this design has not executed all-place Tate/resolution certificates. Each model node must be split into invariant, minimality, geometric resolution/splitting, rationality and Picard assertions if its source proof exceeds one page. The equation-side algorithm-to-scheme comparison is a supplier request. No complete individual geometry proof is claimed from the coefficient computations.

Needed by: `G.5/model-1`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`.

### Completeness, minimality, resolution and orbit proof

No2¹⁸ or2²¹ full search was run in this design. The previous independent paper review reports one, but its scripts and rejection witnesses are not supplied here as a proof. Certify the enumeration, all bad places, geometric resolutions, rationality, count criterion and512×PGL₂ action; or obtain and fully decompose Lang2000 with all specializations. Keep both classifications explicitly conditional on247.

Needed by: `G.6/a2-normalization`, `G.6/admissible-transformations`, `G.6/finite-rejection-certificate`, `G.6/completeness`, `G.6/nonzero-j-classification`, `G.6/zero-j-classification`.

### Tsen primary proof and foundational ownership

The algebraically closed hypothesis is verified and the false finite-field use is removed. A full primary proof of C₁ and its Brauer/Picard obstruction consequence has not been acquired in this job. Locate the foundational owner and decompose it before using this node; the Jacobian generation argument instead uses its actual section.

Needed by: `G.3/tsen-obstruction`.

### General Lang theorem for projective-line forms

The original smooth-connected-group argument is read, but its general group and torsor proof needs a foundational owner and exact declarations. The genus-one consumer is not used as a substitute for PGL₂. Prove the general Lang map theorem, or a source-closed finite-field genus0 rational-point argument, before the form comparison is closed.

Needed by: `G.1/finite-field-p1-forms`, `G.1/component-descent`.

### Canonical upstream stage imports and checker encoding

All exact upstream IDs and consuming nodes are retained in upstreamPrerequisites and requests, and in the roadmap requires edges. The stock checker parses tauceti: stage IDs as baseline declarations before looking them up as stages. They are not fictional baseline declarations. This partial packet therefore leaves their node-level integration open explicitly, and the independent dependency check includes the typed edges. A continuation must restore canonical prerequisites after the checker supports upstream stage IDs or replace them with exact genuine upstream declaration/node exports.

Needed by: `G.1/genus-one-fibration`, `G.1/finite-field-p1-forms`, `G.2/cohomology-adapter`, `G.3/canonical-degree`, `G.3/rational-canonical`, `G.3/positive-section-cohomology`, `G.3/pushforward-splitting`, `G.2/llr-kodaira-comparison`, `G.3/shioda-tate`, `G.3/global-minimal-jacobian`, `G.1/fiber-type-divisor`, `G.1/canonical-type-classification`, `G.2/transverse-divisor`, `G.2/normal-dominating-model`, `G.3/canonical-bundle`, `G.3/rational-picard-lattice`, `G.3/generic-picard-restriction`, `G.3/relative-cubic-contraction`, `G.5/model-1`, `G.5/model-2`, `G.5/model-3`, `G.5/model-4`, `G.5/model-5`, `G.5/model-6`, `G.5/model-7`, `G.5/model-8`, `G.5/model-9`, `G.5/model-10`, `G.5/model-11`, `G.5/model-12`, `G.5/model-13`, `G.5/model-14`, `G.6/finite-rejection-certificate`, `G.1/geometric-kodaira`, `G.3/bounded-weierstrass`, `G.3/coefficient-nondegeneracy`, `G.4/lang-configuration-inputs`, `G.4/unique-additive`, `G.5/nonrational-nonzero-j`, `G.5/nonrational-zero-j`, `G.1/small-conductor-classification`, `G.1/nonsplit-i1`, `G.1/nonsplit-i2`, `G.1/count-15`, `G.2/equality-regular`, `G.1/lang-genus-one`, `G.1/five-f2-classes`, `G.2/domination-genus`, `G.2/multiple-fiber-isogeny`, `G.6/admissible-transformations`, `G.1/E1`, `G.1/E2`, `G.1/E3`, `G.1/E4`, `G.1/E5`, `G.2/extension-counts`.

### Suggested signatures for unbuilt geometric conditions

The suggested file gives genuine scheme/ring/Weierstrass forms and a name-by-name omission ledger. The full genus-one contraction, fiber-type/intersection predicates, Kodaira realization and degeneracy tests need unbuilt owner exports. Their omitted conditions are not replaced by opaque proposition fields. Every API/test name is listed, but a signature using the completed geometric definition cannot yet be claimed to elaborate. Reconcile this ledger with exact supplier types before closing any such definition.

Needed by: `G.1/genus-one-fibration`, `G.1/fiber-type-divisor`, `G.1/geometric-kodaira`, `G.1/degenerate-fiber`, `key/ferrand-pushouts`.

### Henselization adapter for the multiple-fiber isogeny

The source reduces an excellent DVR to its henselization. Its residue field is unchanged, the good-reduction elliptic scheme base changes, and regular relative minimality plus the multiple-fiber description must be preserved. Supply the exact regular-model base-change statement before applying the henselian transverse-divisor proof to an arbitrary excellent DVR. The isogeny is then already over the original residue field, so no descent of a morphism across a residue-field extension is needed.

Needed by: `G.2/multiple-fiber-isogeny`.

Resume at G.0 by replacing the exact SF.1/SF.3 requests with verified carrier/descent/flat-patching exports and giving all twelve space declarations and the two new tests their genuine full signatures. The actual affine Scheme signature is now supplied; the general space signatures remain precise omissions. The existence source uncertainty is resolved, but neither G.0 nor the reserved Ferrand key is closed. Then close the numerical-Picard descent bridge, the excellent-DVR adapters and canonical/wild-fiber proof chain. Obtain the missing rational-surface and quasielliptic proofs and William Lang inputs before closing the configuration stages. Split and verify each model certificate, then supply the full finite rejection and orbit witnesses. Reconcile every omitted suggested signature with the genuine completed owner types. All seven stages remain partial until those obligations and requests are discharged.


## G.1 finite F₂ coefficient and point-group continuation

This subsection records twelve further declaration-sized targets. All coefficient equations are over the literal prime field F₂=ZMod2. It imports native WeierstrassCurve, VariableChange, point addition, pointCount and cyclic-group equivalences. It does not define another elliptic-curve carrier or change group.

Fresh source receipt: [Schröer, arXiv:2004.07025v3](https://arxiv.org/pdf/2004.07025v3), p.11 in full, Proposition3.3/table and the preceding genus-one paragraph, read 2 October2026 by codex-rtOQ9t. The downloaded PDF SHA-256 is ae6481f25627867473ba40db3b08e5f4b861de8aa103204eefc5ad1123a46d61, matching the inherited edition. The table states the five models but does not supply the finite proof below; the preceding paragraph cites Knapp Chapter3§6. No claim is made that that book or the other inherited reading extents were freshly read in this continuation.

The geometric conversion still needs the precise SF.3 Weierstrass scheme presentation, comparison with rational equation points and realization of admissible changes as infinity-preserving curve isomorphisms. The actual SF.3 description imports AlgebraicCurves and JacobianChallenge. AUDIT-01 distinguishes its built function-field Riemann–Roch from the missing cohomological/scheme dictionary. AUDIT-11 distinguishes native finite point counts from the missing geometric ordinary/supersingular predicate. An additive equivalence of rational point groups alone is not a curve isomorphism.

### NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-models — The five binary Weierstrass models

**Declaration:** `F2Model` (definition).

**Statement.** F2Model:Fin5→WeierstrassCurve(F₂) sends indices 0,…,4 to coefficient tuples (a₁,a₂,a₃,a₄,a₆) equal to (0,1,1,0,1), (1,1,0,1,0), (0,0,1,0,0), (1,0,0,1,0), (0,1,1,0,0). Thus index i names the source E_(i+1). This is an explicit family in the native carrier, not a definition of smoothness, ordinarity or a general elliptic curve.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Proof outline:**

1. Read the five equations from the source table and translate them into the native a-coefficient order.
2. Use the native structure constructor and a finite five-entry vector. Keep the source count index instead of the table’s supersingular-first row order.

**Prerequisites:** `mathlib:WeierstrassCurve`.

**Uses:** NeronModelsAndSemistableAbelianVarietiesPartII:G.1/E1–NeronModelsAndSemistableAbelianVarietiesPartII:G.1/E5: Fix the actual native equations for invariant, group and count assertions. NeronModelsAndSemistableAbelianVarietiesPartII:G.1/five-f2-classes and G.2/f2-isomorphism: Supply five explicitly distinguished representatives and their count index.

**API:**

| Name | Role | Contract |
| --- | --- | --- |
| `F2Model.coefficients` | simp | Evaluation at each Fin5 index gives the displayed native coefficient tuple. |
| `F2Model.isElliptic` | instance | Each displayed model is elliptic, from the separately planned discriminant calculation. |
| `F2Model.injective` | extensionality | F2Model i=F2Model j iff i=j, by their different point counts. |
| `F2Model.pointCount` | compatibility | The existing projective pointCount equals i.val+1; this API is promoted to f2-model-counts. |

**Planned unit tests:**

- `F2Model.test_three` (computation): F2Model2 is (0,0,1,0,0), the equation y²+y=x³.
- `F2Model.test_one_point` (degenerate): F2Model0 has no affine F₂ solutions and has exactly its infinity point.
- `F2Model.test_same_j_distinct` (non-example): F2Model0 and F2Model4 both have j=0 but their projective counts are 1 and 5, so they are not identified.
- `F2Model.test_singular_count` (non-example): The all-zero tuple has Δ=0 and projective pointCount3, the same count as F2Model2. A count alone cannot classify singular input.

**Acceptance:** The index convention is 0-based in Fin5 and 1-based in the source E_i. Model0 and model4 are distinct despite sharing j=0.

**Source:** Schröer v3 p.11 Proposition3.3/table motivates the model list; the displayed arithmetic proof is independently deduced from the stated pinned declarations.

### NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-discriminant — Binary discriminant formula

**Declaration:** `f2_discriminant` (lemma).

**Statement.** For W over F₂, Δ(W)=a₃ if a₁=0, and Δ(W)=a₆+a₄+a₃(a₄+a₂) if a₁=1. Equivalently, use the if-expression on a₁=0. The identity uses a²=a for elements of F₂ and does not extend unchanged to F₄.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Proof outline:**

1. Unfold the pinned b₂,b₄,b₆,b₈ and Δ definitions and reduce integer coefficients modulo2.
2. Use a₁²=a₁, a₃²=a₃ and a₄²=a₄; split a₁=0 or1. The two displayed polynomials remain.

**Prerequisites:** `mathlib:WeierstrassCurve.Δ`.

**Acceptance:** The all-zero tuple has Δ=0, while every listed model has Δ=1. Over an extension field, the unreduced powers must be kept.

**Source:** Schröer v3 p.11 Proposition3.3/table motivates the model list; the displayed arithmetic proof is independently deduced from the stated pinned declarations.

### NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-smooth-split — The sixteen smooth coefficient tuples

**Declaration:** `f2_smooth_split` (lemma).

**Statement.** For a tuple W over F₂, Δ=1 iff either a₁=0 and a₃=1, or a₁=1 and a₆=1+a₄+a₃(a₄+a₂). In the first branch a₂,a₄,a₆ are free and in the second branch a₂,a₃,a₄ are free. These disjoint branches exhibit all16 smooth tuples among the32 equations.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Proof outline:**

1. Apply the binary discriminant formula. Over F₂, subtracting a scalar equals adding it.
2. In each branch precisely three binary choices are free, giving eight tuples. The a₁ values distinguish the branches.
3. The native ellipticity condition is that Δ is a unit; over F₂ this is exactly Δ=1. Do not test smoothness by having some rational solution.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-discriminant`, `mathlib:WeierstrassCurve.IsElliptic`.

**Acceptance:** All-zero y²=x³ has three projective rational points but lies in neither smooth branch.

**Source:** Schröer v3 p.11 Proposition3.3/table motivates the model list; the displayed arithmetic proof is independently deduced from the stated pinned declarations.

### NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-change-formula — The eight binary admissible changes

**Declaration:** `f2_change_formula` (lemma).

**Statement.** Every native VariableChange over F₂ has u=1 and one of eight triples (r,s,t). Its action preserves a₁ and sends (a₂,a₃,a₄,a₆) to (a₂+s a₁+r+s, a₃+r a₁, a₄+s a₃+(t+rs)a₁+r, a₆+r a₄+r a₂+r+t a₃+t+rt a₁). This is C•W; the point map from C•W to W is (x,y)↦(x+r,y+sx+t).

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Proof outline:**

1. The only unit of F₂ is1; the other three coefficients range independently over {0,1}.
2. Specialize the native five action formulas, keeping its action order and reducing r²=r,s²=s,t²=t.
3. The inverse triple is (r,s,t+rs), inherited from the native group. Equation compatibility comes from the existing affine variable-change theorem.

**Prerequisites:** `mathlib:WeierstrassCurve.VariableChange`, `mathlib:WeierstrassCurve.variableChange_def`, `tauceti:WeierstrassCurve.Affine.variableChange_equation`.

**Acceptance:** The shear and x-translation need not commute; no componentwise-additive eight-element group is introduced. The point-map direction is from the changed equation to the original equation.

**Source:** Schröer v3 p.11 Proposition3.3/table motivates the model list; the displayed arithmetic proof is independently deduced from the stated pinned declarations.

### NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-discriminants — Smoothness of the five binary models

**Declaration:** `F2Model.discriminant` (lemma).

**Statement.** For each i∈Fin5, Δ(F2Model i)=1, so the native IsElliptic instance is justified. No genus-one assertion is inferred from a count on a singular model.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Proof outline:**

1. Substitute the five literal coefficient tuples into f2_discriminant.
2. Since1 is a unit, the existing native ellipticity class applies to each model.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-models`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-discriminant`, `mathlib:WeierstrassCurve.IsElliptic`.

**Acceptance:** All five discriminants are1; the all-zero tuple has discriminant0.

**Source:** Schröer v3 p.11 Proposition3.3/table motivates the model list; the displayed arithmetic proof is independently deduced from the stated pinned declarations.

### NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-counts — The five binary projective point counts

**Declaration:** `F2Model.pointCount` (lemma).

**Statement.** For every i∈Fin5, the existing projective pointCount(F2Model i)=i+1. The affine solution sets for i=0,…,4 are respectively ∅, {(0,0)}, {(0,0),(0,1)}, {(0,0),(1,0),(1,1)}, {(0,0),(0,1),(1,0),(1,1)}.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Proof outline:**

1. For each displayed equation substitute all four pairs (x,y)∈{0,1}² and retain exactly the listed affine solutions.
2. Apply the actual pointCount_def and add the single infinity point. This calculation does not confuse affine solution count with projective count.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-models`, `tauceti:WeierstrassCurve.pointCount_def`.

**Acceptance:** The counts are1,2,3,4,5 in the source index order.

**Source:** Schröer v3 p.11 Proposition3.3/table motivates the model list; the displayed arithmetic proof is independently deduced from the stated pinned declarations.

### NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-j — The two binary j values

**Declaration:** `F2Model.j` (lemma).

**Statement.** The native j values of F2Model0,…,F2Model4 are0,1,0,1,0. These values do not distinguish all five F₂-isomorphism classes; in particular model0 and model4 have the same j but different point counts.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Proof outline:**

1. Use the model discriminant1 instance and the existing j_eq_zero_iff_of_char_two to determine precisely which indices have j=0.
2. The other two indices have nonzero j; the only nonzero element of F₂ is1. This establishes the whole displayed vector without a new geometric ordinary/supersingular definition.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-discriminants`, `mathlib:WeierstrassCurve.j_eq_zero_iff_of_char_two`.

**Acceptance:** No geometric supersingularity predicate is defined by this equation; its comparison is still imported from EllipticCurves Layer3.

**Source:** Schröer v3 p.11 Proposition3.3/table motivates the model list; the displayed arithmetic proof is independently deduced from the stated pinned declarations.

### NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-orbit-witnesses — Explicit smooth binary orbit witnesses

**Declaration:** `F2Model.orbit_witnesses` (lemma).

**Statement.** For each W over F₂ with Δ(W)=1 there are i∈Fin5 and a native C∈VariableChange(F₂) such that C•W=F2Model i. The durable sixteen-row certificate records every smooth coefficient tuple, its 1-based source class and the triple (r,s,t), with u=1.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Proof outline:**

1. The smooth-split lemma reduces the32 coefficient choices to the displayed16 rows.
2. For each row substitute its (r,s,t) into the binary change formula and check all five coefficients against the indicated model. Equal native coefficients give equality of WeierstrassCurve objects.
3. This is a complete finite witness table, not an appeal to an unavailable search log or to the size of an orbit alone.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-smooth-split`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-change-formula`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-models`.

**Acceptance:** The certificate covers all16 smooth tuples with a concrete forward change, including the identity triples.

**Source:** Schröer v3 p.11 Proposition3.3/table motivates the model list; the displayed arithmetic proof is independently deduced from the stated pinned declarations.

### NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-orbit-disjoint — Disjointness of the five binary orbits

**Declaration:** `F2Model.orbits_disjoint` (lemma).

**Statement.** For i,j∈Fin5, (∃C∈VariableChange(F₂), C•F2Model i=F2Model j) iff i=j. The index is unique; the witnessing change generally is not unique because a model can have automorphisms.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Proof outline:**

1. Use the native additive point equivalence under C and the elliptic pointCount/card-point comparison to identify the two projective counts.
2. The model-count lemma gives i+1=j+1, hence i=j. Conversely the identity change witnesses equality.
3. Finiteness of affine solutions holds over the finite coefficient field; ellipticity is supplied by model discriminants.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-discriminants`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-counts`, `tauceti:WeierstrassCurve.pointCount_eq_card_point`, `tauceti:WeierstrassCurve.Affine.Point.equivVariableChange`.

**Acceptance:** Model orbit sizes are2,4,4,4,2, with stabilizer sizes4,2,2,2,4 in the eight-element native change group. The theorem claims uniqueness only of the model index.

**Source:** Schröer v3 p.11 Proposition3.3/table motivates the model list; the displayed arithmetic proof is independently deduced from the stated pinned declarations.

### NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-count-classifier — Point counts classify smooth binary equations

**Declaration:** `f2_count_classifier` (comparison).

**Statement.** For W,V over F₂ with Δ(W)=Δ(V)=1, pointCount(W)=pointCount(V) iff ∃C∈VariableChange(F₂), C•W=V. This is a statement about native smooth equations and their actual admissible changes. Conversion to arbitrary pointed smooth proper genus-one schemes is an exact SF.3 import, not a consequence of point-group isomorphism alone.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Proof outline:**

1. Send W and V to their model representatives with the explicit orbit witnesses.
2. Changes preserve the projective point count: specialize the existing affine equation equivalence and its inverse, or use the additive point equivalence together with ellipticity.
3. Equal counts force equal model indices by the five model counts. Compose the native changes and an inverse to obtain the required C; the reverse implication follows from the same point-count compatibility.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-orbit-witnesses`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-orbit-disjoint`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-counts`, `mathlib:WeierstrassCurve.VariableChange`, `mathlib:WeierstrassCurve.variableChange_Δ`, `tauceti:WeierstrassCurve.Affine.variableChange_equation`, `tauceti:WeierstrassCurve.pointCount_def`.

**Acceptance:** Δ=1 is essential: the singular all-zero tuple and smooth model2 both have projective count3 but cannot be related by an invertible admissible change. This does not claim that isogeny and isomorphism coincide over arbitrary finite fields.

**Source:** Schröer v3 p.11 Proposition3.3/table motivates the model list; the displayed arithmetic proof is independently deduced from the stated pinned declarations.

### NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-e4-double — A point of order four on E₄

**Declaration:** `f2_e4_double` (lemma).

**Statement.** For E₄=F2Model3 and its nonsingular affine points P=(1,0), Q=(0,0), native point addition gives P+P=Q. Since Q≠O and Q+Q=O, P has order4 and the four-point group is cyclic, not the Klein four group.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Proof outline:**

1. The equation and partial derivatives verify both displayed points are nonsingular.
2. At P the tangent denominator is1 and numerator3+1=0 in F₂. The native slope is0; native addX/addY give Q=(0,0).
3. Q is its own negative, so the existing add_of_Y_eq gives Q+Q=O. Its affine constructor is different from infinity.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-models`, `mathlib:WeierstrassCurve.Affine.Point.add_some`, `mathlib:WeierstrassCurve.Affine.Point.add_of_Y_eq`.

**Acceptance:** The full cycle is O,(1,0),(0,0),(1,1),O; a cardinality-four statement alone would not prove cyclicity.

**Source:** Schröer v3 p.11 Proposition3.3/table motivates the model list; the displayed arithmetic proof is independently deduced from the stated pinned declarations.

### NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-point-groups — Cyclic point groups of the five binary models

**Declaration:** `F2Model.point_group` (theorem).

**Statement.** For every i∈Fin5, the native rational-point group of F2Model i is additively isomorphic to ZMod(i+1). Generators in source E₁,…,E₅ order are O,(0,0),(0,0),(1,0),(0,0). The explicit cyclic lists include exactly every rational point, not only a subgroup of the right apparent size.

**Hypotheses.** The coefficient field in every finite computation is exactly F₂=ZMod2; it is not an arbitrary field of characteristic two. Existing WeierstrassCurve and VariableChange carriers are used.

**Proof outline:**

1. Use the model-count lemma and pointCount_eq_card_point under model ellipticity to get the honest group cardinalities1,…,5.
2. The durable point-cycle table lists all multiples of the displayed generator until the first return to infinity; all listed affine points are nonsingular. Verify each addition with add_some or add_of_Y_eq. The order-four case uses f2_e4_double.
3. The affine solution lists plus infinity prove the generator spans the whole native group. Apply the existing zmodAddEquivOfGenerator and invert its equivalence to obtain the displayed orientation.

**Prerequisites:** `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-discriminants`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-model-counts`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/f2-e4-double`, `tauceti:WeierstrassCurve.pointCount_eq_card_point`, `mathlib:WeierstrassCurve.Affine.Point.add_some`, `mathlib:WeierstrassCurve.Affine.Point.add_of_Y_eq`, `mathlib:zmodAddEquivOfGenerator`.

**Acceptance:** The group of order1 is the trivial ZMod1 group. Orders2,3,5 and especially4 use actual point addition; no group law is replanned.

**Source:** Schröer v3 p.11 Proposition3.3/table motivates the model list; the displayed arithmetic proof is independently deduced from the stated pinned declarations.

### Complete transformation certificate

A tuple lists (a₁,a₂,a₃,a₄,a₆). A row supplies the forward change C•W=E_i, with u=1 and point map from the changed equation to W given by (x,y)↦(x+r,y+sx+t). The inverse triple is (r,s,t+rs). All sixteen rows are covered by the two smooth branches above; no choice is left implicit.

| Coefficients | Source model | r,s,t |
| --- | --- | --- |

| (0, 0, 1, 0, 0) | E3 | (0, 0, 0) |
| (0, 0, 1, 0, 1) | E3 | (1, 1, 0) |
| (0, 0, 1, 1, 0) | E5 | (0, 1, 0) |
| (0, 0, 1, 1, 1) | E1 | (0, 1, 0) |
| (0, 1, 1, 0, 0) | E5 | (0, 0, 0) |
| (0, 1, 1, 0, 1) | E1 | (0, 0, 0) |
| (0, 1, 1, 1, 0) | E3 | (0, 1, 0) |
| (0, 1, 1, 1, 1) | E3 | (1, 0, 0) |
| (1, 0, 0, 0, 1) | E4 | (0, 0, 1) |
| (1, 0, 0, 1, 0) | E4 | (0, 0, 0) |
| (1, 0, 1, 0, 1) | E2 | (1, 0, 0) |
| (1, 0, 1, 1, 1) | E2 | (1, 0, 1) |
| (1, 1, 0, 0, 1) | E2 | (0, 0, 1) |
| (1, 1, 0, 1, 0) | E2 | (0, 0, 0) |
| (1, 1, 1, 0, 0) | E4 | (1, 0, 0) |
| (1, 1, 1, 1, 0) | E4 | (1, 0, 1) |

### Native point-group cycle certificate

O denotes the infinity identity. Each row is the list of successive multiples starting at O; the next entry returns to O. The affine solution lists show that every point appears. These are native group computations, not a replacement group law.

| Model | Generator | Successive points before returning to O |
| --- | --- | --- |

| E1 | O | O |
| E2 | (0,0) | O, (0, 0) |
| E3 | (0,0) | O, (0, 0), (0, 1) |
| E4 | (1,0) | O, (1, 0), (0, 0), (1, 1) |
| E5 | (0,0) | O, (0, 0), (1, 1), (1, 0), (0, 1) |

The independent concrete check covers32 coefficient tuples,16 smooth tuples,8 changes and1,024 affine equation substitutions, discriminant/count preservation, inverse changes, all16 witness rows, disjoint orbits of sizes2,4,4,4,2 and the five full point cycles. These checks are not Lean elaboration or the scheme-presentation proof. All twelve added targets and four added tests have native suggested forms; the inherited geometric omission ledger remains.

### Newly read pinned declarations

| Reference | Exact contribution |
| --- | --- |
| `mathlib:WeierstrassCurve` | Native five-coefficient carrier; no second elliptic equation carrier. |
| `mathlib:WeierstrassCurve.Δ` | Discriminant polynomial in the b-invariants; binary specialization unfolds this definition. |
| `mathlib:WeierstrassCurve.VariableChange` | Actual unit u and r,s,t carrier, its existing group and action; no second admissible-change group. |
| `mathlib:WeierstrassCurve.variableChange_def` | All five transformed coefficients, with the native action direction. |
| `mathlib:WeierstrassCurve.variableChange_Δ` | Discriminant scales by u^(-12); u=1 in the eight F₂ changes. |
| `tauceti:WeierstrassCurve.pointCount_def` | All affine equation solutions plus one infinity point, including singular solutions. |
| `tauceti:WeierstrassCurve.pointCount_eq_card_point` | With ellipticity and finite affine solutions, the projective count equals the native nonsingular point-group cardinality. |
| `tauceti:WeierstrassCurve.Affine.variableChange_equation` | Equation equivalence under x↦u²x+r,y↦u³y+u²sx+t, valid before ellipticity. |
| `tauceti:WeierstrassCurve.Affine.Point.equivVariableChange` | Native additive point-group equivalence from (C•W).Point to W.Point, with inverse C^(-1). |
| `mathlib:WeierstrassCurve.Affine.Point.add_some` | Addition of non-opposite nonsingular affine points by the native slope/addX/addY formulas. |
| `mathlib:WeierstrassCurve.Affine.Point.add_of_Y_eq` | Opposite affine points sum to the infinity identity. |
| `mathlib:zmodAddEquivOfGenerator` | Given every element in zmultiples g and Nat.card G=n, constructs ZMod n ≃+ G; the finite cyclic carriers are imported, not replanned. |
| `mathlib:WeierstrassCurve.IsElliptic` | The native class asserts IsUnit Δ, as read at lines362–373. Over F₂ this is exactly Δ=1; it is not a new smoothness predicate. |

### Additional remaining input

The seventeenth gap is the exact pointed genus-one scheme-to-equation classification adapter, needed by G.1/five-f2-classes and G.2/f2-isomorphism. It is included in the existing SF.3 request with both the presentation and infinity-preserving geometric comparison. All sixteen inherited gaps remain. The finite-field point cycles supply the previously schematic cyclicity checks; ordinary/supersingular comparison remains a genuine supplier obligation.

### Continuation validation scope

The preceding codex-rtOQ9t continuation reported zero indexed-checker errors and warnings. Its historical actual atlas projection contains every one of the 67 expected stage edges, including the 76 typed upstream prerequisite occurrences, with no pending or skipped link. The stage graph (2612 vertices, 8726 edges) and combined declaration/stage graph (2738 vertices, 9269 edges) are acyclic. Typed upstream imports were included in an in-memory validation copy. All 111 inherited IDs, 78 routes and 21 source findings are retained. All 28 cited baseline declaration statements were read at the pins. The twelve added native forms, four API names and four typed examples match this continuation. Lean was not compiled because no existing build at both pins was available. Earlier geometric signatures retain their explicit omission ledger; all seven layers remain partial.

## Common-ideal reconstruction continuation receipt

Codex codex-J6LwjP read Ferrand printed pp555–557 in full on 2 October 2026. The public PDF SHA-256 is 4f1f2438ad6d757d67d2ecf154b1bc920d210d8abd54c02e6acd020805629d91. The added chain extracts the exact common-ideal and kernel-intersection hypotheses of Lemma1.3; it asserts no new source error. Ten added baseline declarations were read in the pinned Mathlib source. Native ring pullbacks, quotient maps, kernel/injectivity criteria and ring equivalences are imported rather than redefined. The parent R11.1–R11.6 audit/document and SF.0/SF.1/SF.3 audit/stage boundaries were read; the earlier upstream JacobianChallenge and StableReduction reading is reused. All 123 predecessor node ids, 78 routed items, 21 source findings, finite F₂ certificates, geometric gaps and supplier requests remain. The geometric conductor-square proof now explicitly consumes the general affine reconstruction. No stage is closed. The complete suggested file remains uncompiled because its Tau Ceti imports have no existing build at the exact pin; no project/cache setup or library build was made.
