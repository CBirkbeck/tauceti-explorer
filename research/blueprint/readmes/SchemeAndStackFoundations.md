# Natural comparison of the two quotient presentations

For an arbitrary scheme morphism f:X→Y, ideal datum I on Y and affine open U⊆Y, write V=f⁻¹U, E=I(U).map(f.app U), and K=ker((I.comap f).ι.app V). The existing inclusion E≤K gives an actual identity-induced ring map Γ(X,V)/E→Γ(X,V)/K. It is always surjective and sends every representative to the same section's class. It is injective exactly when the existing quotient-to-closed-sections map is injective, because the kernel quotient embeds in those sections.

These maps commute with actual restriction and form a natural transformation on affine opens of Y. Composing it with the reindexed all-open closed-section map gives the earlier quotientToClosedNatTrans exactly. The same natural equality holds after the native sheafification unit and ring-sheaf comparison. If one inverse image is affine its component is bijective; if f is affine the entire natural transformation is an isomorphism. No flatness, quasi-compactness, Noetherianity, reducedness or finiteness assumption is imposed.

Seven typed tests check an affine inverse roundtrip, the unit ideal, empty opens, a strict-kernel witness to noninjectivity and nonaffineness, two-step restriction, the preserved nonzero square-zero class2 on Spec(ZMod4), and the sheaf factorization on every quotient class. The strict-kernel test is a parameterized criterion; it does not instantiate a concrete new nonaffine counterexample. Surjectivity of the quotient comparison does not assert surjectivity of the following closed-section map.

All105 incoming whole nodes, five planets, eight gaps,62 routed sources, twelve confirmed findings, inherited source issueE1 and six reserved-key boundaries remain. Twelve nodes add two constructions with ten consumed API entries and seven tests. Every implementation stays unchecked; all seven stages retain their partial/not_read status. Both the whole Mathlib-only planning file and separate native proof evidence have pinned compilation receipts.

Fresh source reading covers the complete current statements/proofs and page comments for Stacks01IN,01IQ and01JU. The image-ideal pullback convention and closed-immersion kernel supply context; the exact natural comparison formulas are authored deductions from native APIs and the preceding actual constructions. No new finding was identified in this bounded reading. Historical source and review attribution, including E1, is retained. Own6035 reading scopes are reused only at unchanged controls, and peer6040 evidence was independently recovered and replayed without borrowing its reading attribution.

Twelve actual quotient-comparison declarations now connect the earlier affine-indexed image-ideal quotients to the all-open immersion-kernel quotients by a native natural transformation. It is always componentwise surjective and factors the actual closed-section transformation and native ring-sheafification comparison. A single affine inverse image gives component bijectivity; affine f gives a natural isomorphism. No arbitrary nonaffine injectivity, closed-section surjectivity or quotient-presheaf sheaf condition is asserted. Consumer conductor/flat-recomputation, henselization/source leaves, all six reserved-key boundaries,62 source routes and other-stage obligations remain open.

## Compare the image-ideal and section-kernel quotients

**TauCeti.SchemeFoundations.IdealPullback.quotientToKernel** — For arbitrary f:X→Y, native ideal datum I on Y and affine open U⊆Y, put V=f⁻¹U, J=I.comap f, E=I(U).map(f.app U), and K=ker(J.ι.app V). Construct the actual ring map Γ(X,V)/E→Γ(X,V)/K induced by the identity on Γ(X,V). No affineness of V is required.

Hypotheses: X,Y are arbitrary native schemes, f:X→Y is any morphism, I is native IdealSheafData on Y, and U is affine in Y. Only the explicitly stated bijectivity results require an affine inverse image or affine f. No flatness, quasi-compactness, Noetherianity, finite-presentation, reducedness or nontriviality assumption is imposed. The comparison is between the actual extended-ideal and immersion-kernel quotients; it does not assert that arbitrary closed-section maps are surjective.

Prerequisites: SchemeAndStackFoundations:SF.0/extended-ideal-kernel-inclusion, mathlib:Ideal.quotientMap.

Proof: Use the existing unconditional inclusion E≤K and native Ideal.quotientMap for the identity ring map. Keep both actual ideals and quotient carriers.

Consumed API:

- **TauCeti.SchemeFoundations.IdealPullback.quotientToKernel_mk**: The actual comparison sends the E-class of a section a∈Γ(X,f⁻¹U) to its K-class.
- **TauCeti.SchemeFoundations.IdealPullback.quotientToKernel_surjective**: For every arbitrary f and affine base open U, quotientToKernel I f U is surjective, including when f⁻¹U is nonaffine. This concerns the map between quotient rings, not surjectivity onto closed-subscheme sections.
- **TauCeti.SchemeFoundations.IdealPullback.quotientToKernel_factor**: The comparison Γ(X,V)/E→Γ(X,V)/K followed by the actual allOpenToClosed component at V equals quotientToClosed I f U as ring homomorphisms. This holds for arbitrary f and affine U.
- **TauCeti.SchemeFoundations.IdealPullback.quotientToKernel_injective_iff**: For arbitrary f and affine U, quotientToKernel I f U is injective if and only if quotientToClosed I f U is injective.
- **TauCeti.SchemeFoundations.IdealPullback.quotientToKernel_bijective**: If the single inverse image f⁻¹U is affine, quotientToKernel I f U is bijective. No global affineness of f is required.
- **TauCeti.SchemeFoundations.IdealPullback.quotientToKernel_naturality**: For affine U≤W in Y, the image-ideal quotient restriction followed by the comparison at U equals the comparison at W followed by the all-open kernel-quotient restriction along f⁻¹U≤f⁻¹W. Neither inverse image must be affine.

Typed tests:

- **QuotientToKernelChecked.affine_roundtrip**: For any single affine inverse image, the inverse of the actual bijective quotient ring map returns every original quotient class.
- **QuotientToKernelChecked.unit_ideal**: For the unit ideal datum and arbitrary f, every class maps to zero in the actual kernel quotient.
- **QuotientToKernelChecked.empty_open**: For the empty affine base open and arbitrary f, every class maps to zero in the empty-open kernel quotient.
- **QuotientToKernelChecked.strict_kernel_obstruction**: A specified section in the actual immersion kernel but outside the extended ideal gives a nonzero class killed by the comparison; it proves noninjectivity and that the inverse image is nonaffine. This is a typed witness criterion, not a newly instantiated concrete nonaffine scheme.

## The comparison preserves every representative

**TauCeti.SchemeFoundations.IdealPullback.quotientToKernel_mk** — The actual comparison sends the E-class of a section a∈Γ(X,f⁻¹U) to its K-class.

Hypotheses: X,Y are arbitrary native schemes, f:X→Y is any morphism, I is native IdealSheafData on Y, and U is affine in Y. Only the explicitly stated bijectivity results require an affine inverse image or affine f. No flatness, quasi-compactness, Noetherianity, finite-presentation, reducedness or nontriviality assumption is imposed. The comparison is between the actual extended-ideal and immersion-kernel quotients; it does not assert that arbitrary closed-section maps are surjective.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-kernel.

Proof: Definitional reduction of the native identity-induced quotient map.

## The comparison is always surjective

**TauCeti.SchemeFoundations.IdealPullback.quotientToKernel_surjective** — For every arbitrary f and affine base open U, quotientToKernel I f U is surjective, including when f⁻¹U is nonaffine. This concerns the map between quotient rings, not surjectivity onto closed-subscheme sections.

Hypotheses: X,Y are arbitrary native schemes, f:X→Y is any morphism, I is native IdealSheafData on Y, and U is affine in Y. Only the explicitly stated bijectivity results require an affine inverse image or affine f. No flatness, quasi-compactness, Noetherianity, finite-presentation, reducedness or nontriviality assumption is imposed. The comparison is between the actual extended-ideal and immersion-kernel quotients; it does not assert that arbitrary closed-section maps are surjective.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-kernel, mathlib:Ideal.quotientMap_surjective.

Proof: Apply the native quotientMap surjectivity theorem to the identity ring map.

## Factor the canonical closed-section map

**TauCeti.SchemeFoundations.IdealPullback.quotientToKernel_factor** — The comparison Γ(X,V)/E→Γ(X,V)/K followed by the actual allOpenToClosed component at V equals quotientToClosed I f U as ring homomorphisms. This holds for arbitrary f and affine U.

Hypotheses: X,Y are arbitrary native schemes, f:X→Y is any morphism, I is native IdealSheafData on Y, and U is affine in Y. Only the explicitly stated bijectivity results require an affine inverse image or affine f. No flatness, quasi-compactness, Noetherianity, finite-presentation, reducedness or nontriviality assumption is imposed. The comparison is between the actual extended-ideal and immersion-kernel quotients; it does not assert that arbitrary closed-section maps are surjective.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-kernel, SchemeAndStackFoundations:SF.0/all-open-to-closed, SchemeAndStackFoundations:SF.0/quotient-to-closed-sections, mathlib:Ideal.Quotient.ringHom_ext.

Proof: Use native quotient-map extensionality; both composites send a representative to J.ι.app V(a).

## Detect injectivity through the actual section map

**TauCeti.SchemeFoundations.IdealPullback.quotientToKernel_injective_iff** — For arbitrary f and affine U, quotientToKernel I f U is injective if and only if quotientToClosed I f U is injective.

Hypotheses: X,Y are arbitrary native schemes, f:X→Y is any morphism, I is native IdealSheafData on Y, and U is affine in Y. Only the explicitly stated bijectivity results require an affine inverse image or affine f. No flatness, quasi-compactness, Noetherianity, finite-presentation, reducedness or nontriviality assumption is imposed. The comparison is between the actual extended-ideal and immersion-kernel quotients; it does not assert that arbitrary closed-section maps are surjective.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-kernel-factor, SchemeAndStackFoundations:SF.0/all-open-to-closed-injective.

Proof: Use the factorization and the unconditional injectivity of the kernel-quotient map into closed sections. Compose injections in one direction and cancel by evaluating the composite in the other.

## An affine inverse image gives a ring isomorphism

**TauCeti.SchemeFoundations.IdealPullback.quotientToKernel_bijective** — If the single inverse image f⁻¹U is affine, quotientToKernel I f U is bijective. No global affineness of f is required.

Hypotheses: X,Y are arbitrary native schemes, f:X→Y is any morphism, I is native IdealSheafData on Y, and U is affine in Y. Only the explicitly stated bijectivity results require an affine inverse image or affine f. No flatness, quasi-compactness, Noetherianity, finite-presentation, reducedness or nontriviality assumption is imposed. The comparison is between the actual extended-ideal and immersion-kernel quotients; it does not assert that arbitrary closed-section maps are surjective.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-kernel-injective-criterion, SchemeAndStackFoundations:SF.0/quotient-to-closed-injective, SchemeAndStackFoundations:SF.0/quotient-to-kernel-surjective.

Proof: Combine the injectivity criterion with the existing closed-section affine comparison and unconditional quotient-map surjectivity.

## The quotient comparison commutes with restriction

**TauCeti.SchemeFoundations.IdealPullback.quotientToKernel_naturality** — For affine U≤W in Y, the image-ideal quotient restriction followed by the comparison at U equals the comparison at W followed by the all-open kernel-quotient restriction along f⁻¹U≤f⁻¹W. Neither inverse image must be affine.

Hypotheses: X,Y are arbitrary native schemes, f:X→Y is any morphism, I is native IdealSheafData on Y, and U is affine in Y. Only the explicitly stated bijectivity results require an affine inverse image or affine f. No flatness, quasi-compactness, Noetherianity, finite-presentation, reducedness or nontriviality assumption is imposed. The comparison is between the actual extended-ideal and immersion-kernel quotients; it does not assert that arbitrary closed-section maps are surjective.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-kernel-representative, SchemeAndStackFoundations:SF.0/quotient-restriction-representative, SchemeAndStackFoundations:SF.0/all-open-quotient-map, mathlib:Ideal.Quotient.ringHom_ext.

Proof: Compare native ring homomorphisms on quotient representatives; both take the actual section restriction and its K-class.

## Natural comparison of the two quotient presheaves

**TauCeti.SchemeFoundations.IdealPullback.quotientToKernelNatTrans** — For arbitrary f:X→Y and I, construct the actual natural transformation from quotientPresheaf I f on Y.affineOpens opposite to the precomposition of allOpenQuotient(I.comap f) by affine-open inclusion followed by inverse image along f. Its component at U is quotientToKernel I f U.

Hypotheses: X,Y are arbitrary native schemes, f:X→Y is any morphism, I is native IdealSheafData on Y, and U is affine in Y. Only the explicitly stated bijectivity results require an affine inverse image or affine f. No flatness, quasi-compactness, Noetherianity, finite-presentation, reducedness or nontriviality assumption is imposed. The comparison is between the actual extended-ideal and immersion-kernel quotients; it does not assert that arbitrary closed-section maps are surjective.

Prerequisites: SchemeAndStackFoundations:SF.0/affine-quotient-presheaf, SchemeAndStackFoundations:SF.0/all-open-quotient-presheaf, SchemeAndStackFoundations:SF.0/quotient-to-kernel-naturality.

Proof: Use the existing actual functors and specified component ring maps; the preceding restriction equality supplies naturality. No new quotient or presheaf carrier is introduced.

Consumed API:

- **TauCeti.SchemeFoundations.IdealPullback.quotientToKernelNatTrans_app**: At every affine U, the component of quotientToKernelNatTrans I f is CommRingCat.ofHom(quotientToKernel I f U).
- **TauCeti.SchemeFoundations.IdealPullback.quotientToKernelNatTrans_factor**: The quotient-presheaf comparison followed by the whiskered allOpenToClosed(I.comap f) equals quotientToClosedNatTrans I f as actual natural transformations.
- **TauCeti.SchemeFoundations.IdealPullback.quotientToKernelNatTrans_isIso**: For an affine morphism f, quotientToKernelNatTrans I f is an isomorphism in the native CommRingCat-valued functor category.
- **TauCeti.SchemeFoundations.IdealPullback.quotientToKernelNatTrans_sheaf_factor**: For arbitrary f, the new natural comparison followed by the whiskered sheafification unit and allOpenSheafComparison(I.comap f) equals quotientToClosedNatTrans I f. This is equality of actual natural transformations on all affine base opens, without affine inverse-image or flatness assumptions.

Typed tests:

- **QuotientToKernelNatChecked.two_step_restriction**: The actual natural component commutes with two successive affine-base restrictions and the corresponding single all-open restriction, with arbitrary inverse images.
- **QuotientToKernelNatChecked.nonreduced_identity**: On the identity of Spec(ZMod4) with zero ideal datum, the actual natural component preserves the nonzero square-zero class represented by2.
- **QuotientToKernelNatChecked.sheaf_factor_on_every_class**: For arbitrary f and every quotient class, applying the new natural component, native sheafification unit and actual sheaf comparison equals the existing quotientToClosed map.

## The natural component is the canonical quotient map

**TauCeti.SchemeFoundations.IdealPullback.quotientToKernelNatTrans_app** — At every affine U, the component of quotientToKernelNatTrans I f is CommRingCat.ofHom(quotientToKernel I f U).

Hypotheses: X,Y are arbitrary native schemes, f:X→Y is any morphism, I is native IdealSheafData on Y, and U is affine in Y. Only the explicitly stated bijectivity results require an affine inverse image or affine f. No flatness, quasi-compactness, Noetherianity, finite-presentation, reducedness or nontriviality assumption is imposed. The comparison is between the actual extended-ideal and immersion-kernel quotients; it does not assert that arbitrary closed-section maps are surjective.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-kernel-natural-transformation.

Proof: Definitional equality of the specified components.

## Factorization is equality of natural transformations

**TauCeti.SchemeFoundations.IdealPullback.quotientToKernelNatTrans_factor** — The quotient-presheaf comparison followed by the whiskered allOpenToClosed(I.comap f) equals quotientToClosedNatTrans I f as actual natural transformations.

Hypotheses: X,Y are arbitrary native schemes, f:X→Y is any morphism, I is native IdealSheafData on Y, and U is affine in Y. Only the explicitly stated bijectivity results require an affine inverse image or affine f. No flatness, quasi-compactness, Noetherianity, finite-presentation, reducedness or nontriviality assumption is imposed. The comparison is between the actual extended-ideal and immersion-kernel quotients; it does not assert that arbitrary closed-section maps are surjective.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-kernel-natural-transformation, SchemeAndStackFoundations:SF.0/quotient-to-kernel-factor, SchemeAndStackFoundations:SF.0/quotient-to-closed-natural-transformation, mathlib:CategoryTheory.Functor.whiskerLeft.

Proof: Use native natural-transformation extensionality and the component ring factorization. Retain the actual preimage functor and its direction.

## Affine morphisms give a natural isomorphism

**TauCeti.SchemeFoundations.IdealPullback.quotientToKernelNatTrans_isIso** — For an affine morphism f, quotientToKernelNatTrans I f is an isomorphism in the native CommRingCat-valued functor category.

Hypotheses: X,Y are arbitrary native schemes, f:X→Y is any morphism, I is native IdealSheafData on Y, and U is affine in Y. Only the explicitly stated bijectivity results require an affine inverse image or affine f. No flatness, quasi-compactness, Noetherianity, finite-presentation, reducedness or nontriviality assumption is imposed. The comparison is between the actual extended-ideal and immersion-kernel quotients; it does not assert that arbitrary closed-section maps are surjective.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-kernel-natural-component, SchemeAndStackFoundations:SF.0/quotient-to-kernel-affine-bijective, mathlib:CategoryTheory.ConcreteCategory.isIso_iff_bijective, mathlib:CategoryTheory.NatIso.isIso_of_isIso_app.

Proof: Each affine base open has an affine inverse image. Convert the proved component bijectivity to native isomorphisms, then apply the native componentwise isomorphism criterion.

## The two quotients give the same ring-sheaf comparison

**TauCeti.SchemeFoundations.IdealPullback.quotientToKernelNatTrans_sheaf_factor** — For arbitrary f, the new natural comparison followed by the whiskered sheafification unit and allOpenSheafComparison(I.comap f) equals quotientToClosedNatTrans I f. This is equality of actual natural transformations on all affine base opens, without affine inverse-image or flatness assumptions.

Hypotheses: X,Y are arbitrary native schemes, f:X→Y is any morphism, I is native IdealSheafData on Y, and U is affine in Y. Only the explicitly stated bijectivity results require an affine inverse image or affine f. No flatness, quasi-compactness, Noetherianity, finite-presentation, reducedness or nontriviality assumption is imposed. The comparison is between the actual extended-ideal and immersion-kernel quotients; it does not assert that arbitrary closed-section maps are surjective.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-kernel-natural-factor, SchemeAndStackFoundations:SF.0/all-open-sheaf-comparison-factorization, mathlib:CategoryTheory.Functor.whiskerLeft.

Proof: Replace the sheafification-unit/comparison composite by the already proved allOpenToClosed transformation, then apply the new natural factorization.

# Scheme foundations: all-open kernel quotients and ring sheafification

Codex — codex-rtOQ9t · 4 October 2026 · Refs #642 · partial.

For the actual closed immersion ι:Z→X associated to native ideal data, take the full section kernel on every open. Its quotient presheaf injects into the actual direct-image structure sheaf. It is bijective on affine opens, hence locally bijective. Native ring-valued sheafification supplies a canonical isomorphism a(Q_I)≅ι_*O_Z. Its representative formula and uniqueness fix the actual map; no unrestricted section-surjectivity or equality of naive quotient sections with sheafification sections is assumed.

[Stacks01HM](https://stacks.math.columbia.edu/tag/01HM), Example26.4.3, supplies the quotient ring-sheaf context; [01IN](https://stacks.math.columbia.edu/tag/01IN), Lemma26.10.1, supplies the affine kernel/ideal context. Complete displayed mathematical blocks were read, with external cited proof leaves left explicit. The twenty contracts below are authored deductions from the pinned native API.

Twenty all-open declarations now construct Q_I(U)=Γ(X,U)/ker(ι.app U), its actual quotient restrictions, the injective natural map to closed-subscheme sections, local bijectivity and the native ring-sheafification isomorphism a(Q_I)≅ι_*O_Z. The comparison agrees with the native affine quotient map and with quotientToClosed on actual pullback representatives. The presheaf itself is not asserted to be a sheaf or globally surjective. All consumer conductor identification, flat recomputation, henselization/source leaves, six reserved-key boundaries, 62 routed sources and other-stage obligations remain open.

All 85 incoming whole nodes,38 API items,49 raw tests,eight gaps,62 routes,twelve confirmed findings,six reserved-key boundaries and five planet objects remain intact. Peer6035 public recovery and actual verifier replay authenticate the 1169-line incoming native prefix. Only the consumed peer extension was freshly read; own6029 reading scopes are reused at unchanged guards. Historical prose below retains its original attribution.

## Restriction preserves the section kernel

**TauCeti.SchemeFoundations.IdealPullback.allOpenKernel_restriction** — For native ideal data I on an arbitrary scheme X, set Z=I.subscheme and let ι:Z→X be its actual closed immersion. For every pair of opens U≤V, restriction Γ(X,V)→Γ(X,U) sends ker(ι.app V) into ker(ι.app U). Opens need not be affine or quasi-compact.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: mathlib:AlgebraicGeometry.Scheme.Hom.naturality.

Proof: Apply the actual naturality square for ι to a section in the kernel; its restricted image is zero.

## All-open quotient restriction

**TauCeti.SchemeFoundations.IdealPullback.allOpenRestriction** — Define K(U)=ker(Γ(X,U)→Γ(Z,ι⁻¹U)) using the actual immersion section map, and Q_I(U)=Γ(X,U)/K(U). For every U≤V construct Q_I(V)→Q_I(U) by the native quotientMap of actual section restriction and the proved kernel inclusion. K(U) is an all-open section kernel, not a radical or an asserted pointwise extension of generators.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-kernel-restriction, mathlib:Ideal.quotientMap.

Proof: Apply the native quotientMap to the actual restriction homomorphism; retain its concrete quotient carrier.

API: TauCeti.SchemeFoundations.IdealPullback.allOpenRestriction_mk, TauCeti.SchemeFoundations.IdealPullback.allOpenRestriction_id, TauCeti.SchemeFoundations.IdealPullback.allOpenRestriction_comp. Use the exact hypotheses of each displayed contract.

## Restriction on quotient representatives

**TauCeti.SchemeFoundations.IdealPullback.allOpenRestriction_mk** — For any section a∈Γ(X,V) and U≤V, allOpenRestriction sends [a] to [a|U] in Q_I(U).

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-quotient-restriction.

Proof: Evaluate the concrete quotientMap on its native quotient projection.

## Identity quotient restriction

**TauCeti.SchemeFoundations.IdealPullback.allOpenRestriction_id** — For every open U, allOpenRestriction I (U≤U) equals the identity ring homomorphism of Q_I(U).

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-quotient-restriction-representative, mathlib:Ideal.Quotient.ringHom_ext.

Proof: Use quotient ring-homomorphism extensionality and the native presheaf identity law.

## Composite quotient restriction

**TauCeti.SchemeFoundations.IdealPullback.allOpenRestriction_comp** — For U≤V≤W, allOpenRestriction for V→U composed with that for W→V equals the restriction for W→U as ring homomorphisms.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-quotient-restriction-representative, mathlib:Ideal.Quotient.ringHom_ext.

Proof: Reduce to quotient representatives and use the actual section-presheaf composition law.

## All-open kernel quotient presheaf

**TauCeti.SchemeFoundations.IdealPullback.allOpenQuotient** — Construct a CommRingCat-valued presheaf Q_I on the opposite of all opens of X, with Q_I(U)=Γ(X,U)/ker(ι.app U) and maps allOpenRestriction. Supply identity and composition proofs. This presheaf is not assumed to satisfy the sheaf axiom.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-quotient-restriction, SchemeAndStackFoundations:SF.0/all-open-quotient-restriction-identity, SchemeAndStackFoundations:SF.0/all-open-quotient-restriction-composition.

Proof: Fill the native functor structure with actual quotient rings and restriction maps; use the two preceding functoriality lemmas.

API: TauCeti.SchemeFoundations.IdealPullback.allOpenQuotient_obj, TauCeti.SchemeFoundations.IdealPullback.allOpenQuotient_map, TauCeti.SchemeFoundations.IdealPullback.allOpenRestriction_comp. Use the exact hypotheses of each displayed contract.

## All-open quotient object formula

**TauCeti.SchemeFoundations.IdealPullback.allOpenQuotient_obj** — The U component of allOpenQuotient I is exactly CommRingCat.of(Γ(X,U)/ker(ι.app U)).

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-quotient-presheaf.

Proof: Unfold its concrete object field.

## All-open quotient map formula

**TauCeti.SchemeFoundations.IdealPullback.allOpenQuotient_map** — The map of allOpenQuotient I at an inclusion U≤V is exactly CommRingCat.ofHom(allOpenRestriction I (U≤V)).

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-quotient-presheaf.

Proof: Unfold its concrete map field.

## All-open map to closed-subscheme sections

**TauCeti.SchemeFoundations.IdealPullback.allOpenToClosed** — Construct the natural transformation q:Q_I→ι_*O_Z on all opens of X. Its U component is the actual ring-homomorphism kerLift of ι.app U. The target is the native preimage-op functor composed with Z.presheaf. Naturality is supplied from the actual immersion section maps; no affineness or global section-surjectivity is assumed.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-quotient-presheaf, SchemeAndStackFoundations:SF.0/all-open-quotient-restriction-representative, mathlib:RingHom.kerLift, mathlib:AlgebraicGeometry.Scheme.Hom.naturality, mathlib:Ideal.Quotient.ringHom_ext.

Proof: Specify native kerLift components. Reduce the naturality square to quotient representatives and apply ι.naturality.

API: TauCeti.SchemeFoundations.IdealPullback.allOpenToClosed_mk, TauCeti.SchemeFoundations.IdealPullback.allOpenToClosed_injective, TauCeti.SchemeFoundations.IdealPullback.allOpenToClosed_affine_bijective, TauCeti.SchemeFoundations.IdealPullback.allOpenToClosed_affine_agreement, TauCeti.SchemeFoundations.IdealPullback.allOpenToClosed_locally_surjective, TauCeti.SchemeFoundations.IdealPullback.allOpenToClosed_locally_injective. Use the exact hypotheses of each displayed contract.

## Closed-section image of a representative

**TauCeti.SchemeFoundations.IdealPullback.allOpenToClosed_mk** — On every open U, q_U([a])=ι.app U(a) for all a∈Γ(X,U).

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-to-closed.

Proof: Evaluate the native kerLift on a quotient representative.

## Injectivity on every open

**TauCeti.SchemeFoundations.IdealPullback.allOpenToClosed_injective** — For every open U of X, the component q_U:Q_I(U)→Γ(Z,ι⁻¹U) is injective, even if U is nonaffine.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-to-closed, mathlib:RingHom.kerLift_injective.

Proof: Use injectivity of the actual ring-homomorphism kerLift. This relies on quotienting by the full actual kernel.

## Bijectivity on affine opens

**TauCeti.SchemeFoundations.IdealPullback.allOpenToClosed_affine_bijective** — For every affine open U of X, the actual component q_U is bijective.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-to-closed-injective, SchemeAndStackFoundations:SF.0/all-open-to-closed-representative, mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app_surjective.

Proof: Use unconditional kernel-quotient injectivity. Lift each target section through the native affine immersion section-surjectivity theorem, and take its quotient class.

## Agreement with the native affine quotient

**TauCeti.SchemeFoundations.IdealPullback.allOpenToClosed_affine_agreement** — For affine U, q_U equals the native identity-induced quotientMap from Γ(X,U)/ker(ι.app U) to Γ(X,U)/I(U), followed by (I.subschemeObjIso U).inv. The quotientMap uses the native equality ker(ι.app U)=I(U); this is equality of actual CommRingCat morphisms.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-to-closed-representative, mathlib:AlgebraicGeometry.Scheme.IdealSheafData.ker_subschemeι_app, mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app, mathlib:Ideal.quotientMap, mathlib:Ideal.Quotient.ringHom_ext.

Proof: Apply quotient homomorphism extensionality and the native subschemeι_app factorization. Preserve the actual kernel-to-ideal comparison, rather than silently identifying carriers.

## Local surjectivity on the Zariski site

**TauCeti.SchemeFoundations.IdealPullback.allOpenToClosed_locally_surjective** — The actual natural transformation q is locally surjective for the native Grothendieck topology of all opens of X. At any x∈U, shrink to an affine V with x∈V⊆U and lift the restricted target section through q_V. This asserts local, not unrestricted componentwise, surjectivity.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-to-closed-affine-bijective, mathlib:AlgebraicGeometry.exists_isAffineOpen_mem_and_subset, mathlib:TopCat.Presheaf.isLocallySurjective_iff.

Proof: Use the native open-neighbourhood criterion. Select an actual affine neighbourhood subordinate to U, then use q_V surjectivity on the restricted section.

## Local injectivity on the Zariski site

**TauCeti.SchemeFoundations.IdealPullback.allOpenToClosed_locally_injective** — The transformation q is locally injective for the native topology of all opens of X.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-to-closed-injective, mathlib:CategoryTheory.Presheaf.isLocallyInjective_of_injective.

Proof: Apply the native componentwise-injectivity-to-local-injectivity theorem to q_U for every open.

## Canonical quotient-sheaf comparison

**TauCeti.SchemeFoundations.IdealPullback.allOpenSheafComparison** — On the native all-open Zariski site of arbitrary X, construct c:a(Q_I)→ι_*O_Z by the actual sheafifyLift of q. Here a is native CommRingCat-valued sheafification, available at the pinned library without additional geometric hypotheses, and the target is a sheaf by native direct image. No pointwise surjectivity of O_X(U)→O_Z(ι⁻¹U) is assumed.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-to-closed, mathlib:CategoryTheory.sheafifyLift, mathlib:TopCat.Sheaf.pushforward_sheaf_of_sheaf.

Proof: Use the existing ring-valued sheafification instance and the native proof that direct image preserves sheaves. Apply sheafifyLift to the actual q and target sheaf proof.

API: TauCeti.SchemeFoundations.IdealPullback.allOpenSheafComparison_factor, TauCeti.SchemeFoundations.IdealPullback.allOpenSheafComparison_mk, TauCeti.SchemeFoundations.IdealPullback.allOpenSheafComparison_unique, TauCeti.SchemeFoundations.IdealPullback.allOpenSheafComparison_isIso. Use the exact hypotheses of each displayed contract.

## Factorization through sheafification

**TauCeti.SchemeFoundations.IdealPullback.allOpenSheafComparison_factor** — The sheafification unit η:Q_I→a(Q_I) followed by c equals q as natural transformations on all opens.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-sheaf-comparison, mathlib:CategoryTheory.toSheafify_sheafifyLift.

Proof: Use the exact native sheafifyLift factorization theorem.

## Sheaf comparison on actual representatives

**TauCeti.SchemeFoundations.IdealPullback.allOpenSheafComparison_mk** — For every open U and actual section a∈Γ(X,U), c_U(η_U([a]))=ι.app U(a).

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-sheaf-comparison-factorization, SchemeAndStackFoundations:SF.0/all-open-to-closed-representative.

Proof: Evaluate the natural-transformation factorization at U and on the actual quotient class of a.

## Unique sheaf comparison

**TauCeti.SchemeFoundations.IdealPullback.allOpenSheafComparison_unique** — Any natural transformation d:a(Q_I)→ι_*O_Z satisfying η≫d=q equals c. This is the native sheafification universal-property uniqueness on the specified all-open site.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-sheaf-comparison, mathlib:CategoryTheory.sheafifyLift_unique.

Proof: Apply sheafifyLift_unique with the native target sheaf proof and the supplied factorization.

## Isomorphism with the closed-subscheme ring sheaf

**TauCeti.SchemeFoundations.IdealPullback.allOpenSheafComparison_isIso** — The actual comparison c:a(Q_I)→ι_*O_Z is an isomorphism of CommRingCat-valued presheaves underlying sheaves on all opens of X. This holds for every native ideal datum on every scheme, without affine, Noetherian, finite, flat or quasi-compact assumptions.

Hypotheses: X is a native scheme; I is its native IdealSheafData. Only explicitly stated affine-open hypotheses are used. Zero rings and nilpotents are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/all-open-sheaf-comparison-factorization, SchemeAndStackFoundations:SF.0/all-open-to-closed-locally-surjective, SchemeAndStackFoundations:SF.0/all-open-to-closed-locally-injective, mathlib:CategoryTheory.GrothendieckTopology.W_of_isLocallyBijective, mathlib:CategoryTheory.GrothendieckTopology.W_iff, mathlib:CategoryTheory.isIso_toSheafify, mathlib:CategoryTheory.sheafify_hom_ext, mathlib:CategoryTheory.toSheafify_naturality, mathlib:CategoryTheory.IsIso.hom_inv_id.

Proof: The actual q is locally bijective, so its image under native sheafification is an isomorphism. The target is already a sheaf, hence its sheafification unit is an isomorphism. Sheafification extensionality and the factorization identify c followed by that unit with sheafifyMap(q). Cancel the target unit by the native isomorphism-of-composite theorem. No geometric axiom or admitted proof is used in the separate native evidence.

## Typed boundary tests

- **AllOpenRestrictionChecked.two_step**: For arbitrary opens U≤V≤W and every actual quotient section over W, two successive presheaf restrictions equal the direct restriction.
- **AllOpenQuotientChecked.affine_ideal**: On an affine open U, the actual q_U kills the class of a section a exactly when a lies in the original ideal I(U), using the native section-kernel equality.
- **AllOpenQuotientChecked.unit_ideal**: For the unit ideal datum and an affine U, every element of the actual kernel quotient is zero; no nontrivial-ring assumption is imposed.
- **AllOpenQuotientChecked.nonreduced**: For the zero ideal on Spec(Z/4), the actual q_U image of the class of the section 2 is nonzero and has square zero. Replacing the full kernel quotient by a reduction would fail this concrete test.
- **AllOpenToClosedChecked.affine_roundtrip**: The native RingEquiv.ofBijective built from q_U on an affine U sends an image back to exactly its original quotient section.
- **AllOpenToClosedChecked.nonaffine_obstruction**: If a supplied all-open component q_U is not surjective, U cannot be affine. This is a parameterized obstruction, not a newly instantiated concrete nonaffine example.
- **AllOpenSheafComparisonChecked.representative_inverse**: For arbitrary U and actual a, the inverse of c_U applied to ι.app U(a) equals η_U([a]), with the actual isomorphism and sheafification maps.
- **AllOpenSheafComparisonChecked.pullback_agreement**: For arbitrary f:X→Y and affine U in Y, the all-open sheaf comparison for I.comap f applied to η([a]) at f⁻¹U equals the existing quotientToClosed I f U([a]). No affine-preimage or flatness hypothesis is used.
- **AllOpenSheafComparisonChecked.arbitrary_section**: For every open U and every section of the actual closed subscheme above U, some section of the actual sheafification maps to it under c_U. The representative need not come from Γ(X,U).

# Scheme foundations: canonical maps to closed-subscheme sections

Codex — codex-7e92bd · 4 October 2026 · Refs #642 · partial.

The quotient presheaf now maps canonically to the actual closed-subscheme sections for every morphism. Its components are native quotient lifts of the actual closed-immersion section maps, and commute with restriction without affine-preimage assumptions. A component agrees with the existing inverse comparison when its preimage is affine; for affine morphisms the entire transformation is the inverse of the existing natural isomorphism.

[Stacks 01JU](https://stacks.math.columbia.edu/tag/01JU) supplies the inverse-image closed-subscheme image-ideal context, and [01IN](https://stacks.math.columbia.edu/tag/01IN) the affine quotient context. Their complete displayed mathematical statements and proofs were read. The twelve contracts below are authored deductions from the pinned native API. No recursive chapter closure is claimed.

Twelve canonical quotient-to-closed-sections declarations now supply the actual quotient lift and its natural transformation for arbitrary morphisms, without affine-preimage or quasi-compactness hypotheses. The map agrees with the existing inverse comparison on an affine preimage, and is an isomorphism of affine-indexed presheaves for affine f. No general nonaffine isomorphism or all-open sheafification/global structure-sheaf comparison is claimed. Both conductor/sheaf and flat-recomputation consumer requests, henselization coherence/source leaves, all six reserved-key boundaries, 62 source routes and the other stages remain open.

All 73 incoming whole nodes, 29 API items, 41 raw tests, eight gaps, 62 routes, twelve confirmed findings and six reserved-key boundaries remain intact. Peer PR6029 and its 930-line native proof prefix were authenticated by public recovery and exact verifier replay. Only the fourteen new peer declarations, nine tests and consumed earlier comparison maps were freshly read; the whole prefix is recompiled, not newly claimed as fully read. Own prior reading scopes are reused only where control hashes match. Historical prose below keeps its original attribution.

## Extended ideals vanish on the actual closed subscheme

**TauCeti.SchemeFoundations.IdealPullback.extendedIdeal_le_ker** — For an arbitrary scheme morphism f:X→Y, native ideal data I on Y and affine U in Y, the full extended ideal I(U).map(f.app U) is contained in the kernel of the actual closed immersion section map Γ(X,f⁻¹U)→Γ(Z,ι⁻¹(f⁻¹U)), where Z is the native subscheme of I.comap f and ι:Z→X. No affineness of f⁻¹U or quasi-compactness of f is assumed.

Hypotheses: X and Y are native schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used; zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: mathlib:AlgebraicGeometry.Scheme.IdealSheafData.le_map_comap, mathlib:AlgebraicGeometry.Scheme.Hom.ideal_ker_le, mathlib:AlgebraicGeometry.Scheme.Hom.comp_app.

Proof: Apply the native Galois unit I≤map f(comap f I). Use the unconditional native ideal_ker_le for ι≫f, then identify its section map with the composite of f.app and ι.app. The map/comap ideal adjunction gives the desired kernel inclusion. Do not substitute ker_apply, whose equality requires quasi-compactness.

## Canonical quotient-to-closed-sections map

**TauCeti.SchemeFoundations.IdealPullback.quotientToClosed** — For arbitrary f:X→Y, I and affine U, construct the ring homomorphism q_U:Q(U)→Γ(Z,ι⁻¹(f⁻¹U)), with Q(U)=Γ(X,f⁻¹U)/I(U).map(f.app U), Z the actual subscheme of I.comap f and ι its native closed immersion. The map is the quotient lift of ι.app(f⁻¹U), without affine-preimage, quasi-compactness, flatness, finiteness or Noetherian assumptions.

Hypotheses: X and Y are native schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used; zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/extended-ideal-kernel-inclusion, mathlib:Ideal.Quotient.lift.

Proof: Retain the native quotient carrier and apply Ideal.Quotient.lift to the actual immersion section map and the preceding kernel inclusion.

API: TauCeti.SchemeFoundations.IdealPullback.quotientToClosed_mk, TauCeti.SchemeFoundations.IdealPullback.quotientToClosed_unique, TauCeti.SchemeFoundations.IdealPullback.quotientToClosed_naturality, TauCeti.SchemeFoundations.IdealPullback.quotientToClosed_eq_inv, TauCeti.SchemeFoundations.IdealPullback.quotientToClosed_injective, TauCeti.SchemeFoundations.IdealPullback.quotientToClosed_surjective. Each uses the exact hypotheses of its displayed contract.

## Image of a quotient representative

**TauCeti.SchemeFoundations.IdealPullback.quotientToClosed_mk** — The canonical map q_U sends the quotient class of any section a of X over f⁻¹U to the actual section ι.app(f⁻¹U)(a) on Z.

Hypotheses: X and Y are native schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used; zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-closed-sections.

Proof: Unfold the native quotient lift on a representative; the equality is reflexive.

## Unique factorization through the quotient

**TauCeti.SchemeFoundations.IdealPullback.quotientToClosed_unique** — Any ring homomorphism Q(U)→Γ(Z,ι⁻¹(f⁻¹U)) whose composite with the quotient projection equals the actual immersion section map is equal to q_U. This applies to arbitrary f and affine U.

Hypotheses: X and Y are native schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used; zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-closed-representative, mathlib:Ideal.Quotient.ringHom_ext.

Proof: Use native quotient ring-homomorphism extensionality; the supplied factorization agrees with the concrete lift on every representative.

## Naturality without affine preimages

**TauCeti.SchemeFoundations.IdealPullback.quotientToClosed_naturality** — For arbitrary f and affine U≤V, quotientRestriction:Q(V)→Q(U) followed by q_U equals q_V followed by the actual restriction Γ(Z,ι⁻¹(f⁻¹V))→Γ(Z,ι⁻¹(f⁻¹U)), as CommRingCat morphisms. Neither inverse image needs to be affine.

Hypotheses: X and Y are native schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used; zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-closed-representative, SchemeAndStackFoundations:SF.0/quotient-restriction-representative, mathlib:AlgebraicGeometry.Scheme.Hom.naturality, mathlib:Ideal.Quotient.ringHom_ext.

Proof: Reduce the two ring maps to quotient representatives and apply the native naturality square for ι at the actual preimage inclusion.

## Agreement with the local affine comparison

**TauCeti.SchemeFoundations.IdealPullback.quotientToClosed_eq_inv** — If the single inverse image f⁻¹U is affine, CommRingCat.ofHom(q_U) equals the inverse of the existing comapObjIso I f U. No global affineness of f is required.

Hypotheses: X and Y are native schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used; zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-closed-representative, SchemeAndStackFoundations:SF.0/ideal-comap-quotient-inverse, mathlib:Ideal.Quotient.ringHom_ext.

Proof: Use quotient extensionality and the previously proved comapObjIso_inv_mk formula for the actual closed-immersion section map.

## Injectivity on an affine preimage

**TauCeti.SchemeFoundations.IdealPullback.quotientToClosed_injective** — If f⁻¹U is affine, the canonical ring homomorphism q_U is injective.

Hypotheses: X and Y are native schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used; zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-closed-affine-comparison, mathlib:CategoryTheory.ConcreteCategory.bijective_of_isIso.

Proof: Identify q_U with the inverse component of the existing isomorphism, then use the native concrete-category bijectivity theorem.

## Surjectivity on an affine preimage

**TauCeti.SchemeFoundations.IdealPullback.quotientToClosed_surjective** — If f⁻¹U is affine, the canonical ring homomorphism q_U is surjective.

Hypotheses: X and Y are native schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used; zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-closed-affine-comparison, mathlib:CategoryTheory.ConcreteCategory.bijective_of_isIso.

Proof: Identify q_U with the inverse component of the existing isomorphism, then use the native concrete-category bijectivity theorem.

## Canonical natural transformation for arbitrary morphisms

**TauCeti.SchemeFoundations.IdealPullback.quotientToClosedNatTrans** — For arbitrary f:X→Y and native I, construct a natural transformation from quotientPresheaf I f to the actual closed-subscheme section presheaf indexed by Y.affineOpens opposite, via the affine-open forgetful functor and the two native preimage functors. Its component at U is CommRingCat.ofHom(q_U). No inverse-image affineness is assumed, and no general isomorphism is asserted.

Hypotheses: X and Y are native schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used; zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/affine-quotient-presheaf, SchemeAndStackFoundations:SF.0/quotient-to-closed-sections, SchemeAndStackFoundations:SF.0/quotient-to-closed-naturality.

Proof: Specify the actual component ring homomorphisms in the existing native NatTrans structure and supply the proved naturality square. Keep the native presheaf carriers and maps.

API: TauCeti.SchemeFoundations.IdealPullback.quotientToClosedNatTrans_app, TauCeti.SchemeFoundations.IdealPullback.quotientToClosedNatTrans_affine, TauCeti.SchemeFoundations.IdealPullback.quotientToClosedNatTrans_isIso. Each uses the exact hypotheses of its displayed contract.

## Canonical natural transformation components

**TauCeti.SchemeFoundations.IdealPullback.quotientToClosedNatTrans_app** — For every affine U and arbitrary f, the U component of quotientToClosedNatTrans is exactly CommRingCat.ofHom(q_U).

Hypotheses: X and Y are native schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used; zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-closed-natural-transformation.

Proof: Unfold the specified component field; the equality is reflexive.

## Agreement with the affine natural isomorphism

**TauCeti.SchemeFoundations.IdealPullback.quotientToClosedNatTrans_affine** — If f is an affine morphism, quotientToClosedNatTrans I f equals the inverse natural transformation of the existing comapObjNatIso I f. This is equality of actual natural transformations.

Hypotheses: X and Y are native schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used; zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-closed-natural-transformation, SchemeAndStackFoundations:SF.0/quotient-to-closed-affine-comparison, SchemeAndStackFoundations:SF.0/closed-subscheme-quotient-natural-isomorphism.

Proof: Use natural-transformation extensionality and the local comparison at each target affine open, with its native affine-preimage witness.

## The canonical transformation is invertible for affine morphisms

**TauCeti.SchemeFoundations.IdealPullback.quotientToClosedNatTrans_isIso** — For affine f, the canonical quotientToClosedNatTrans I f is an isomorphism in the native functor category.

Hypotheses: X and Y are native schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used; zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-to-closed-natural-affine.

Proof: Rewrite as the inverse of the existing comapObjNatIso and use its native IsIso instance.

## Typed boundary tests

- **QuotientToClosedChecked.actual_factorization**: For arbitrary f and affine U, q_U composed with the actual quotient projection equals the actual immersion section map as ring homomorphisms.
- **QuotientToClosedChecked.top_ideal**: For the unit ideal datum, arbitrary f and every quotient class on an affine U, the canonical map sends that class to zero.
- **QuotientToClosedChecked.nonreduced_section**: On Spec(Z/4), for the zero ideal datum and identity morphism, the image under q_U of the class of the actual section 2 is nonzero and has square zero. Full ideals and the actual closed-subscheme sections preserve this nilpotent.
- **QuotientToClosedChecked.nonflat_surviving_unit**: For the nonflat Spec(Z/2)→Spec(Z) and the ideal datum generated by 2, the image of the quotient unit under q_U is nonzero. The full extended ideal is zero; flatness is not required.
- **QuotientToClosedNatTransChecked.basic_open**: For arbitrary f and a native affine basic open D(s)≤V, first restricting a quotient representative and then applying the natural transformation gives the actual immersion section map applied to its restriction.
- **QuotientToClosedNatTransChecked.two_step_overlap**: For arbitrary f and affine U≤V≤W, two successive quotient-presheaf restrictions followed by q_U equal q_W followed by the actual closed-subscheme restriction for U≤W.
- **QuotientToClosedNatTransChecked.affine_roundtrip**: For affine f, the canonical natural transformation followed by the forward existing comapObjNatIso equals the identity natural transformation.
- **QuotientToClosedNatTransChecked.nonaffine_obstruction**: Given a failure of surjectivity of one component of the canonical natural transformation, f cannot be affine. This is a parameterized obstruction test; it does not instantiate a concrete nonaffine counterexample.

# Scheme foundations: actual affine quotient restrictions

Codex — codex-rtOQ9t · 3 October2026 · Refs #642 · partial.

The quotient section rings now carry the actual restriction maps and an affine-indexed presheaf. The existing closed-subscheme quotient comparisons commute with those maps in both directions. For affine morphisms they assemble into a natural isomorphism of the actual presheaves indexed by the target affine opens. Full image ideals are retained; no flatness or finiteness hypothesis is added.

[Stacks01JU](https://stacks.math.columbia.edu/tag/01JU) supplies the inverse-image closed-subscheme image-ideal context. [01IQ](https://stacks.math.columbia.edu/tag/01IQ) and [01IN](https://stacks.math.columbia.edu/tag/01IN) supply the closed-immersion and affine quotient context. Their complete displayed mathematical statements and proofs were read. The named restriction laws, naturality squares and affine-indexed natural isomorphism below are authored deductions from the pinned native API. No whole-chapter closure is claimed.

The quotient restriction and presheaf apply to arbitrary morphisms and do not require affine preimages. The local comparison squares require only the two preimages in the square to be affine. The natural isomorphism requires an affine morphism because it supplies all affine preimages. It compares the affine-indexed presheaves; a global all-open sheaf comparison remains a separate obligation.

Fourteen affine quotient-restriction and naturality declarations now compare the actual closed-subscheme section maps and construct an affine-indexed quotient presheaf and natural isomorphism. Restriction maps require arbitrary f; the natural isomorphism requires affine f to supply all affine preimages. This is not an all-open sheafification or global structure-sheaf comparison. The separately owned conductor/sheaf and flat-recomputation consumer obligations, henselization coherence and source leaves, six reserved-key boundaries,62 routed sources and all other-stage obligations remain open.

All59 incoming whole nodes,20 API items,32 raw tests,8 gaps,62 routes,12 confirmed findings and6 reserved-key boundaries remain intact. The incoming639-line native proof prefix and all four public deliverables were authenticated through predecessor6025; its actual verifier reproduced its recorded report byte-for-byte. Historical prose below retains its original attribution. Fresh reading scopes are bounded as recorded in the handoff.

## Restriction of extended ideals

**TauCeti.SchemeFoundations.IdealPullback.extendedIdeal_restrict** — Let f:X→Y be an arbitrary scheme morphism, I native ideal data on Y, and U≤V affine opens of Y. Extending I(V) along f.app V and then along the actual restriction Γ(X,f⁻¹V)→Γ(X,f⁻¹U) gives I(U).map(f.app U). Neither preimage open is required to be affine; no flatness or finiteness is assumed.

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: mathlib:AlgebraicGeometry.Scheme.Hom.naturality, mathlib:AlgebraicGeometry.Scheme.IdealSheafData.map_ideal.

Proof: Use naturality of the actual scheme section morphism to identify the two composite ring maps. Apply Ideal.map_map twice and transport the native ideal-data restriction equality along f.app U.

## Restriction on the quotient section rings

**TauCeti.SchemeFoundations.IdealPullback.quotientRestriction** — For f:X→Y, native ideal data I and affine U≤V, define the ring homomorphism Q(V)→Q(U), where Q(T)=Γ(X,f⁻¹T)/I(T).map(f.app T), induced by the actual X restriction map. This is defined for every f, even when the inverse images are not affine.

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/extended-ideal-restriction, mathlib:Ideal.quotientMap, mathlib:TopologicalSpace.Opens.map.

Proof: Use the native Ideal.quotientMap with the actual restriction homomorphism. The preceding equality of extended ideals proves the required containment; keep the concrete quotient and map data.

API: TauCeti.SchemeFoundations.IdealPullback.quotientRestriction_mk, TauCeti.SchemeFoundations.IdealPullback.quotientRestriction_id, TauCeti.SchemeFoundations.IdealPullback.quotientRestriction_comp. Each item uses exactly the hypotheses of its displayed contract.

## Restricted quotient representatives

**TauCeti.SchemeFoundations.IdealPullback.quotientRestriction_mk** — For b∈Γ(X,f⁻¹V), quotientRestriction sends the class of b in Q(V) to the class of its actual restriction in Q(U).

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-restriction, mathlib:Ideal.quotientMap_mk.

Proof: Apply the built quotientMap_mk formula with the exact restriction ring homomorphism.

## Identity quotient restriction

**TauCeti.SchemeFoundations.IdealPullback.quotientRestriction_id** — For every affine U, quotientRestriction along U≤U is the identity ring homomorphism on Q(U).

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-restriction-representative, mathlib:Ideal.Quotient.ringHom_ext.

Proof: Use quotient ring-homomorphism extensionality on representatives. The native X presheaf sends the identity inclusion to the identity section map.

## Composition of quotient restrictions

**TauCeti.SchemeFoundations.IdealPullback.quotientRestriction_comp** — For affine U≤V≤W, the restriction Q(W)→Q(U) is quotientRestriction(U≤V) composed with quotientRestriction(V≤W), in this contravariant order.

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-restriction-representative, mathlib:Ideal.Quotient.ringHom_ext.

Proof: Reduce equality to quotient representatives, use the representative formula twice, and apply composition of the actual X presheaf restriction maps.

## Naturality of the closed-subscheme quotient comparison

**TauCeti.SchemeFoundations.IdealPullback.comapObjIso_naturality** — Let U≤V be affine opens of Y whose inverse images under f:X→Y are affine. The actual restriction on the closed subscheme cut out by I.comap f, followed by comapObjIso at U, equals comapObjIso at V followed by quotientRestriction. This is equality of morphisms in CommRingCat, for the actual nested preimage opens. The ambient morphism need not be affine.

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/ideal-comap-quotient-comparison, SchemeAndStackFoundations:SF.0/ideal-comap-quotient-representative, SchemeAndStackFoundations:SF.0/quotient-restriction-representative, mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app_surjective, mathlib:AlgebraicGeometry.Scheme.Hom.naturality.

Proof: Lift an arbitrary closed-subscheme section through the native surjective affine section map of its closed immersion. Apply the actual immersion naturality square to that representative, then the existing comapObjIso_mk and new quotientRestriction_mk formulas.

## Naturality of the inverse quotient comparison

**TauCeti.SchemeFoundations.IdealPullback.comapObjIso_inv_naturality** — Under exactly the preceding two local affineness hypotheses, quotientRestriction followed by comapObjIso at U inverse equals comapObjIso at V inverse followed by the actual closed-subscheme restriction, as morphisms in CommRingCat.

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-comparison-naturality.

Proof: Postcompose both sides with the invertible comapObjIso at U hom, cancel it, and simplify using the forward naturality square and the two inverse identities.

## The affine quotient presheaf

**TauCeti.SchemeFoundations.IdealPullback.quotientPresheaf** — For arbitrary f:X→Y and native ideal data I, construct the functor from Y.affineOpens opposite to CommRingCat with value Q(U)=Γ(X,f⁻¹U)/I(U).map(f.app U) and actual quotientRestriction maps. No affine-morphism, flatness, Noetherian or finite-presentation assumption is required.

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-restriction, SchemeAndStackFoundations:SF.0/quotient-restriction-identity, SchemeAndStackFoundations:SF.0/quotient-restriction-composition.

Proof: Use the already-built affine-open category and CommRingCat functor carrier. Specify quotient ring objects and quotientRestriction morphisms concretely; prove the functor identity and composition fields with the two restriction laws. No new site or presheaf carrier is introduced.

API: TauCeti.SchemeFoundations.IdealPullback.quotientPresheaf_obj, TauCeti.SchemeFoundations.IdealPullback.quotientPresheaf_map, TauCeti.SchemeFoundations.IdealPullback.comapObjNatIso. Each item uses exactly the hypotheses of its displayed contract.

## Affine quotient presheaf objects

**TauCeti.SchemeFoundations.IdealPullback.quotientPresheaf_obj** — The value of quotientPresheaf at an affine open U is exactly the native CommRingCat object Q(U).

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/affine-quotient-presheaf.

Proof: Unfold the concrete object field; the equality is reflexive.

## Affine quotient presheaf maps

**TauCeti.SchemeFoundations.IdealPullback.quotientPresheaf_map** — The map of quotientPresheaf on the opposite of the inclusion U≤V is exactly CommRingCat.ofHom(quotientRestriction I f (U≤V)).

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/affine-quotient-presheaf.

Proof: Unfold the concrete map field and the preorder inclusion; the equality is reflexive.

## The closed-subscheme quotient natural isomorphism

**TauCeti.SchemeFoundations.IdealPullback.comapObjNatIso** — If f:X→Y is an affine morphism, the actual presheaf of the closed subscheme cut out by I.comap f, restricted along affine opens of Y and both native preimage functors, is naturally isomorphic to quotientPresheaf I f. The component at U is the existing comapObjIso with the native affine-preimage witness. Affineness of f is used to provide every component, without flatness or finiteness.

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-comparison-naturality, SchemeAndStackFoundations:SF.0/affine-quotient-presheaf, SchemeAndStackFoundations:SF.0/ideal-comap-quotient-comparison, mathlib:Monotone.functor, mathlib:TopologicalSpace.Opens.map, mathlib:CategoryTheory.NatIso.ofComponents.

Proof: Compose the built affine-open forgetful functor and native preimage functors with the native closed-subscheme presheaf. Apply NatIso.ofComponents to the existing comapObjIso components, using the proved restriction square. Preserve these actual components; this compares affine-indexed presheaves and does not assert a new all-open sheaf comparison.

API: TauCeti.SchemeFoundations.IdealPullback.comapObjNatIso_app, TauCeti.SchemeFoundations.IdealPullback.comapObjNatIso_hom_app, TauCeti.SchemeFoundations.IdealPullback.comapObjNatIso_inv_app. Each item uses exactly the hypotheses of its displayed contract.

## Natural isomorphism components

**TauCeti.SchemeFoundations.IdealPullback.comapObjNatIso_app** — For affine f and affine U, the component of comapObjNatIso at U is precisely comapObjIso I f U with the native preimage-affineness witness.

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/closed-subscheme-quotient-natural-isomorphism.

Proof: Unfold NatIso.ofComponents and the concrete component assignment; the equality is reflexive.

## Forward natural isomorphism components

**TauCeti.SchemeFoundations.IdealPullback.comapObjNatIso_hom_app** — For affine f and affine U, the forward component of comapObjNatIso is exactly the forward native quotient comparison comapObjIso I f U.

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/closed-subscheme-quotient-natural-isomorphism.

Proof: Unfold the concrete forward component; the equality is reflexive.

## Inverse natural isomorphism components

**TauCeti.SchemeFoundations.IdealPullback.comapObjNatIso_inv_app** — For affine f and affine U, the inverse component of comapObjNatIso is exactly the inverse native quotient comparison comapObjIso I f U.

Hypotheses: X and Y are schemes in the same universe; I is native IdealSheafData. Only the affineness hypotheses explicitly stated are used. Zero rings, nilpotents and nonflat maps are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/closed-subscheme-quotient-natural-isomorphism.

Proof: Unfold the concrete inverse component; the equality is reflexive.

## Typed boundary tests

- **QuotientRestrictionChecked.empty_target**: For arbitrary f and every quotient class on V, restricting to the empty target affine open gives zero. The preimage section ring is a subsingleton, without affineness of f.
- **QuotientRestrictionChecked.triple_overlap**: For a chain U≤V≤W≤T and any quotient class on T, the direct restriction equals three successive actual quotient restrictions in the contravariant order.
- **QuotientRestrictionChecked.nonreduced_identity**: On Spec(Z/4), with the zero ideal datum and identity morphism, the identity quotient restriction preserves the class of the actual section2: that class is nonzero and its square is zero. Full ideals retain this coordinate.
- **QuotientPresheafChecked.basic_open_representative**: For an affine V, an actual section s on V and arbitrary f, the presheaf restriction to the native affine basic open D(s) sends every class to the class of its actual restricted section.
- **QuotientPresheafChecked.nonflat_surviving_unit**: For the nonflat Spec(Z/2)→Spec(Z) and the ideal datum generated by2, the unit in the actual top quotient-presheaf value is nonzero, although the pulled-back full ideal is zero.
- **QuotientPresheafChecked.zero_ideal_path**: For the zero ideal datum and a two-step chain of affine opens, the two actual presheaf maps agree with the direct restriction on every representative.
- **ComapObjNatIsoChecked.roundtrip**: For affine f, every actual closed-subscheme section is recovered by applying the forward and inverse natural-isomorphism components at the same affine open.
- **ComapObjNatIsoChecked.forward_overlap**: For affine f and U≤V≤W, the forward components intertwine the actual closed-subscheme restriction with two successive quotient-presheaf restrictions, as CommRingCat morphisms.
- **ComapObjNatIsoChecked.inverse_overlap**: For affine f and U≤V, the inverse components intertwine the actual quotient-presheaf restriction with the closed-subscheme restriction, as CommRingCat morphisms.

# Scheme foundations: affine inverse-image ideals

Codex — codex-7e92bd · 3 October2026 · Refs #642 · partial.

The native ideal pullback now has an explicit affine-chart formula and a quotient comparison for the actual closed-subscheme sections. The proof uses Mathlib ideal data and its extension/contraction adjunction; it introduces no new ideal-sheaf or closed-subscheme carrier. Both opens must be affine, but the ambient morphism need not be affine. The affine-morphism corollary supplies its own inverse-image affineness.

[Stacks01JU](https://stacks.math.columbia.edu/tag/01JU) identifies the inverse-image ideal as the image of the pulled-back inclusion. [Definition01JV](https://stacks.math.columbia.edu/tag/01JV) names the inverse-image closed subscheme as a fiber product; native comapIso already provides that identification. The source reduces the geometric statement to [01HQ](https://stacks.math.columbia.edu/tag/01HQ) and [01IN](https://stacks.math.columbia.edu/tag/01IN). Only these blocks were freshly read, including their displayed proofs. The affine-section adapters below are authored deductions from the pinned native API.

The nonflat Spec(Z/2)→Spec(Z) test sends a nonzero ideal to zero. It asserts an image-ideal formula, with no injectivity claim about pullback of modules. The Spec(Z/4) test retains a nonzero square-zero quotient coordinate, distinguishing full ideals from their radicals. Further tests cover composition, inverse representatives and the empty open.

Nine generic affine ideal-pullback adapters now identify the full extended ideal and the actual quotient section map, without flatness or finiteness. The conductor-specialized consumer comparison in PR6023 remains separately owned. General ideal pullback is the image ideal, not an assertion that pullback preserves injectivity of its module inclusion. The remaining global conductor/sheaf and flat-recomputation consumer obligations, henselization coherence and source leaves, reserved keys,62 routed sources and all other-stage obligations remain open.

All50 incoming whole nodes,17 API items,27 raw tests,8 gaps,62 routes,12 findings and6 reserved-key boundaries remain intact. The previous proof-only evidence and all four public files were authenticated and its verifier replayed exactly. Historical prose below keeps its original attribution; newer frontier notes govern the scope of this continuation.

## Affine pullback of the full ideal

**TauCeti.SchemeFoundations.IdealPullback.ideal_comap_top** — For arbitrary affine schemes X,Y, a morphism f:X→Y and native ideal datum I on Y, the global ideal of I.comap f equals the extension of I(Y) along f.appTop. No flatness, finiteness, reducedness or Noetherian hypothesis is required.

Hypotheses: X and Y are schemes in the same universe; I is Mathlib native IdealSheafData. Affineness is required exactly for the opens explicitly stated. All rings, including zero rings and nonreduced rings, are allowed.

Prerequisites: mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap, mathlib:AlgebraicGeometry.Scheme.IdealSheafData.ofIdealTop, mathlib:AlgebraicGeometry.Scheme.IdealSheafData.le_of_isAffine, mathlib:AlgebraicGeometry.Scheme.IdealSheafData.le_map_iff_comap_le, mathlib:AlgebraicGeometry.Scheme.IdealSheafData.le_map_comap, mathlib:AlgebraicGeometry.Scheme.IdealSheafData.ideal_map_of_isAffineHom.

Proof: Let K be the native ideal datum associated to the extension of I(Y). Affine determination and the ideal-sheaf adjunction reduce I.comap f≤K to the ring-ideal extension/contraction unit. For the reverse inclusion apply the ideal-sheaf unit I≤map(comap I), evaluate at the top open, use the native affine map formula and the ring-ideal adjunction. Every map between the two affine schemes is affine.

## Restriction of the inverse-image ideal

**TauCeti.SchemeFoundations.IdealPullback.comap_restrict** — For arbitrary schemes X,Y, f:X→Y, an ideal datum I on Y and any open U in Y, pulling I.comap f back to f⁻¹U equals pulling I restricted to U back along the actual restricted morphism f|U. This is equality of native ideal data.

Hypotheses: X and Y are schemes in the same universe; I is Mathlib native IdealSheafData. Affineness is required exactly for the opens explicitly stated. All rings, including zero rings and nonreduced rings, are allowed.

Prerequisites: mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap_comp, mathlib:AlgebraicGeometry.morphismRestrict_ι.

Proof: Rewrite both iterated comaps as comap along a composite, then use the actual restriction square. This is an adapter of built functoriality, not another pullback definition.

## Affine open section transport

**TauCeti.SchemeFoundations.IdealPullback.ideal_restrict_top** — For an ideal datum I on X and affine open U, the top-section ideal of I restricted to U is the contraction of I(U) along the canonical U.topIso from top sections of U to sections on U.

Hypotheses: X and Y are schemes in the same universe; I is Mathlib native IdealSheafData. Affineness is required exactly for the opens explicitly stated. All rings, including zero rings and nonreduced rings, are allowed.

Prerequisites: mathlib:AlgebraicGeometry.Scheme.IdealSheafData.ideal_comap_of_isOpenImmersion, mathlib:AlgebraicGeometry.Scheme.Opens.ι_appIso.

Proof: Apply the native open-immersion formula to the top open of U. Transport the ideal along the exact equality that the inclusion image of that top open is U. Equality induction identifies the restriction map with U.topIso; no arbitrary ring isomorphism is substituted.

## Affine chart formula for inverse-image ideals

**TauCeti.SchemeFoundations.IdealPullback.ideal_comap_affineOpen** — For f:X→Y and native ideal datum I, if U is affine and its inverse image f⁻¹U is affine, then (I.comap f)(f⁻¹U)=I(U).map(f.app U). The morphism f itself need not be affine and no flatness is needed.

Hypotheses: X and Y are schemes in the same universe; I is Mathlib native IdealSheafData. Affineness is required exactly for the opens explicitly stated. All rings, including zero rings and nonreduced rings, are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/ideal-comap-top, SchemeAndStackFoundations:SF.0/ideal-comap-restrict, SchemeAndStackFoundations:SF.0/ideal-restrict-top, mathlib:AlgebraicGeometry.Scheme.Hom.resLE_app_top, mathlib:Ideal.map_comap_of_surjective, mathlib:Ideal.map_symm.

Proof: Restrict to the two affine opens and apply the global affine formula. Use the two canonical topIso maps to identify the restricted morphism on top sections with f.app U. Cancel contraction along the source topIso using surjectivity. The remaining extension/contraction transport is the native ideal map calculation for ring isomorphisms.

## Affine-morphism specialization

**TauCeti.SchemeFoundations.IdealPullback.ideal_comap_of_isAffineHom** — For any affine morphism f:X→Y, ideal datum I on Y and affine open U, the ideal of I.comap f on f⁻¹U is I(U).map(f.app U). The preimage-affineness witness is the native IsAffineOpen.preimage instance.

Hypotheses: X and Y are schemes in the same universe; I is Mathlib native IdealSheafData. Affineness is required exactly for the opens explicitly stated. All rings, including zero rings and nonreduced rings, are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/ideal-comap-affine-open.

Proof: Specialize the local chart formula with the native affineness of the inverse image. This includes finite morphisms but does not impose finiteness.

## Sections of the inverse-image closed subscheme

**TauCeti.SchemeFoundations.IdealPullback.comapObjIso** — For an affine U with affine inverse image under f:X→Y, the actual sections of the native closed subscheme cut out by I.comap f over f⁻¹U are canonically isomorphic to Γ(X,f⁻¹U) modulo the extended ideal I(U).map(f.app U).

Hypotheses: X and Y are schemes in the same universe; I is Mathlib native IdealSheafData. Affineness is required exactly for the opens explicitly stated. All rings, including zero rings and nonreduced rings, are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/ideal-comap-affine-open, mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeObjIso.

Proof: Compose the existing subschemeObjIso with the native quotient-ring equivalence induced by the proved equality of full ideals. Retain both concrete components in the suggested constructor. Native comapIso already identifies this closed subscheme with the fiber product; it is imported, not reconstructed.

## The actual quotient projection square

**TauCeti.SchemeFoundations.IdealPullback.comapObjIso_inclusion** — The section map of the actual closed immersion (I.comap f).subschemeι, followed by comapObjIso, is exactly the quotient projection modulo I(U).map(f.app U), as morphisms in CommRingCat.

Hypotheses: X and Y are schemes in the same universe; I is Mathlib native IdealSheafData. Affineness is required exactly for the opens explicitly stated. All rings, including zero rings and nonreduced rings, are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/ideal-comap-quotient-comparison, mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subschemeι_app.

Proof: Rewrite the native closed-immersion section map using subschemeι_app. Cancel the inverse/forward components of subschemeObjIso; on each section, quotEquivOfEq sends its quotient representative to the same representative.

## Forward quotient representatives

**TauCeti.SchemeFoundations.IdealPullback.comapObjIso_mk** — For every actual section b over f⁻¹U, comapObjIso sends its restriction to the inverse-image closed subscheme to its class modulo I(U).map(f.app U).

Hypotheses: X and Y are schemes in the same universe; I is Mathlib native IdealSheafData. Affineness is required exactly for the opens explicitly stated. All rings, including zero rings and nonreduced rings, are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/ideal-comap-quotient-inclusion.

Proof: Evaluate the equality of CommRingCat morphisms from the projection square at b.

## Inverse quotient representatives

**TauCeti.SchemeFoundations.IdealPullback.comapObjIso_inv_mk** — For every b over f⁻¹U, the inverse of comapObjIso sends the class of b modulo the extended ideal to the actual closed-immersion restriction of b.

Hypotheses: X and Y are schemes in the same universe; I is Mathlib native IdealSheafData. Affineness is required exactly for the opens explicitly stated. All rings, including zero rings and nonreduced rings, are allowed.

Prerequisites: SchemeAndStackFoundations:SF.0/ideal-comap-quotient-representative.

Proof: Rewrite the quotient representative using the forward formula, then apply the concrete inverse identity of the canonical isomorphism.

## Typed boundary tests

- **IdealPullbackChecked.composition**: For two arbitrary maps between affine schemes, the full ideal pulled back along their composite equals the two successive ideal extensions in the contravariant order.
- **IdealPullbackChecked.empty_open**: For any morphism and ideal datum, every section over the empty preimage chart has zero coordinate under the actual quotient comparison; global affineness is unnecessary.
- **IdealPullbackChecked.inverse_representative**: The forward and inverse quotient formulas recover the actual restriction of every affine-chart section.
- **IdealPullbackChecked.nonflat_quotient**: For Spec(Z/2)→Spec(Z), the nonzero ideal datum generated by the section2 pulls back to the zero ideal datum. The chart formula allows this nonflat map; it does not assert injectivity of the pulled-back inclusion of modules.
- **IdealPullbackChecked.nonreduced_quotient**: On Spec(Z/4) with the zero ideal and identity map, the actual quotient coordinate of the section2 is nonzero and has square zero. Replacing the ideal by its radical would fail this test.

# Scheme and stack foundations: quotient and cokernel continuation

Codex — codex-rtOQ9t · 3 October 2026 · Refs #642 · partial.

This strand supplies the canonical quotient-module comparison behind the incoming flat-annihilator supplier. It imports Mathlib’s S-linear tensorQuotientEquiv and native quotients. A quotient square and module-map naturality identify the actual maps, while the image adapter identifies range(f.baseChange) with the extension of range(f). The named cokernel comparison is a concrete composition of existing equivalences. There is no new quotient carrier.

The [right-exact tensor theorem](https://stacks.math.columbia.edu/tag/00DF) needs no flatness or finite generation. Combining its native quotient comparison with the incoming [flat-annihilator theorem](https://stacks.math.columbia.edu/tag/07T8) yields full equality of annihilator ideals when S is flat and the quotient or cokernel is finite. The ambient modules and submodule need not be finite. Unconditional inclusion is kept as a separate result.

The tests include identity and zero maps, an actual nonzero modular coordinate, inverse representatives over Z/4, the zero coefficient ring, and nonzero nilpotent annihilator scalars over Z/4 and its flat diagonal product extension. The [multiplication-by-two example](https://stacks.math.columbia.edu/tag/00DI) checks an injective Z-linear map whose extension to Z/2 is zero on a nonzero tensor. This illustrates failure of injectivity preservation, not a claimed counterexample to the finite-whole-module annihilator formula.

The generic native quotient/cokernel comparison now has thirteen declaration-sized adapters and eight typed tests. Its actual quotient square and module-map naturality hold without flatness; full annihilator equality requires flatness and finiteness of the quotient/cokernel alone. The conductor consumer must still identify its particular algebra-image submodule, affine pullback ideals and section/sheaf maps. Existing henselization, reserved-key, all routed-source and other-stage obligations remain open.

All37 incoming node objects,14 API items,19 raw tests,8 gaps,62 routes,12 confirmed findings and6 reserved-key boundaries are preserved. Historical text below remains under its original attribution. The suggested file remains a planning file; separate native proofs are validation evidence, with implementation statuses unchecked.

## Canonical quotient square

**TauCeti.SchemeFoundations.QuotientBaseChange.quotient_baseChange_square** — For a commutative R-algebra S and a submodule Q of an R-module M, the existing S-linear tensor quotient equivalence E_Q satisfies E_Q ∘ (Q.mkQ).baseChange S = (Q.baseChange S).mkQ. The equality compares the actual linear maps on all tensors.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M and N are arbitrary additive commutative groups with R-module structures. Flatness and finite generation are required only where explicitly stated; finite generation applies to the quotient or cokernel.

Prerequisites: mathlib:TensorProduct.AlgebraTensorModule.tensorQuotientEquiv, mathlib:LinearMap.baseChange, mathlib:Submodule.baseChange.

Proof: Apply tensor-linear-map extensionality. Both composites send s⊗m to the class of s⊗m in the quotient by Q.baseChange S. No choice of generators or flatness is involved.

## Annihilator transport through the tensor quotient

**TauCeti.SchemeFoundations.QuotientBaseChange.quotient_baseChange_annihilator** — For every commutative R-algebra S and Q≤M, Ann_S(S⊗_R(M/Q)) equals Ann_S((S⊗_R M)/(Q.baseChange S)). The quotient equivalence is the existing S-linear Mathlib tensorQuotientEquiv, with its image submodule definitionally Q.baseChange S.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M and N are arbitrary additive commutative groups with R-module structures. Flatness and finite generation are required only where explicitly stated; finite generation applies to the quotient or cokernel.

Prerequisites: mathlib:TensorProduct.AlgebraTensorModule.tensorQuotientEquiv, mathlib:LinearEquiv.annihilator_eq, mathlib:Submodule.baseChange.

Proof: Read the complete ambient scalar towers of the existing tensor quotient equivalence. Apply its native annihilator_eq theorem; both scalar rings are S. This imports the equivalence instead of defining a second quotient carrier.

## Flat base change of quotient annihilators

**TauCeti.SchemeFoundations.QuotientBaseChange.quotient_annihilator_flat_baseChange** — If S is a flat commutative R-algebra and M/Q is finitely generated over R, then (Ann_R(M/Q)).map(algebraMap R S)=Ann_S((S⊗_R M)/(Q.baseChange S)). Only the quotient M/Q must be finite; M and Q need not be finite, Noetherian or finitely presented.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M and N are arbitrary additive commutative groups with R-module structures. Flatness and finite generation are required only where explicitly stated; finite generation applies to the quotient or cokernel.

Prerequisites: SchemeAndStackFoundations:SF.0/flat-annihilator, SchemeAndStackFoundations:SF.0/quotient-basechange-annihilator.

Proof: Apply the incoming finite-module flat-annihilator theorem to the actual quotient M/Q. Transport its S-annihilator through the native tensor quotient equivalence. No additional finiteness is introduced.

## Unconditional quotient annihilator inclusion

**TauCeti.SchemeFoundations.QuotientBaseChange.quotient_annihilator_map_le_baseChange** — For every commutative R-algebra S and Q≤M, (Ann_R(M/Q)).map(algebraMap R S)≤Ann_S((S⊗_R M)/(Q.baseChange S)). This inclusion requires neither flatness nor finiteness.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M and N are arbitrary additive commutative groups with R-module structures. Flatness and finite generation are required only where explicitly stated; finite generation applies to the quotient or cokernel.

Prerequisites: SchemeAndStackFoundations:SF.0/annihilator-basechange-inclusion, SchemeAndStackFoundations:SF.0/quotient-basechange-annihilator.

Proof: Use the incoming unconditional annihilator inclusion for M/Q, then the S-linear quotient annihilator comparison. Equality is asserted only in the preceding flat finite-quotient theorem.

## Image under extension of scalars

**TauCeti.SchemeFoundations.QuotientBaseChange.baseChange_range** — For any R-linear f:M→N and commutative R-algebra S, range(f.baseChange S)=(range f).baseChange S. This is an equality of native S-submodules; f need not be injective and S need not be flat.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M and N are arbitrary additive commutative groups with R-module structures. Flatness and finite generation are required only where explicitly stated; finite generation applies to the quotient or cokernel.

Prerequisites: mathlib:LinearMap.lTensor_range, mathlib:Submodule.baseChange, mathlib:LinearMap.baseChange.

Proof: Compare the native S-submodules after restricting scalars to R, using injectivity of restriction of submodules. The resulting ranges are exactly the existing lTensor_range equality. This is a scalar-structure adapter for that built result.

## Submodule image compatibility

**TauCeti.SchemeFoundations.QuotientBaseChange.baseChange_map** — For Q≤M and f:M→N, extending Q.map f to S equals the image of Q.baseChange S under f.baseChange S. This holds for all commutative R-algebras S without flatness.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M and N are arbitrary additive commutative groups with R-module structures. Flatness and finite generation are required only where explicitly stated; finite generation applies to the quotient or cokernel.

Prerequisites: SchemeAndStackFoundations:SF.0/range-basechange, mathlib:LinearMap.range_comp, mathlib:Submodule.range_subtype, mathlib:LinearMap.baseChange_comp.

Proof: Express Q.map f as the range of f composed with the actual subtype of Q. Apply range-basechange, baseChange_comp and range_comp. The remaining source range is definitionally Q.baseChange S.

## Extended containment for quotient maps

**TauCeti.SchemeFoundations.QuotientBaseChange.baseChange_le_comap** — If Q≤P.comap f for f:M→N, then Q.baseChange S≤(P.baseChange S).comap(f.baseChange S). This supplies the actual containment proof needed to induce the map on the extended quotients.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M and N are arbitrary additive commutative groups with R-module structures. Flatness and finite generation are required only where explicitly stated; finite generation applies to the quotient or cokernel.

Prerequisites: SchemeAndStackFoundations:SF.0/submodule-image-basechange, mathlib:Submodule.baseChange_mono, mathlib:Submodule.map_le_iff_le_comap.

Proof: Translate containment to an image inequality. Rewrite the image using submodule-image-basechange and apply the existing monotonicity of extension of submodules.

## Naturality of the quotient comparison

**TauCeti.SchemeFoundations.QuotientBaseChange.quotient_baseChange_naturality** — For f:M→N and Q≤P.comap f, E_P ∘ (Q.mapQ P f).baseChange S equals the induced map (Q.baseChange S).mapQ (P.baseChange S) (f.baseChange S) composed with E_Q. All four maps are the native S-linear maps and equivalences with the preceding extended containment proof.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M and N are arbitrary additive commutative groups with R-module structures. Flatness and finite generation are required only where explicitly stated; finite generation applies to the quotient or cokernel.

Prerequisites: SchemeAndStackFoundations:SF.0/quotient-map-basechange-containment, mathlib:Submodule.mapQ, mathlib:TensorProduct.AlgebraTensorModule.tensorQuotientEquiv.

Proof: Use tensor and quotient extensionality. On s⊗[m], the two composites give [s⊗f(m)]. Retain the actual native containment and mapQ arguments; no arbitrary isomorphism replaces either comparison map.

## Flat base change of finite cokernel annihilators

**TauCeti.SchemeFoundations.QuotientBaseChange.cokernel_annihilator_flat_baseChange** — For an R-linear f:M→N, a flat commutative R-algebra S and finite R-module N/range f, extending Ann_R(N/range f) to S gives Ann_S((S⊗_R N)/range(f.baseChange S)). Finiteness of the cokernel alone suffices, and f need not be injective.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M and N are arbitrary additive commutative groups with R-module structures. Flatness and finite generation are required only where explicitly stated; finite generation applies to the quotient or cokernel.

Prerequisites: SchemeAndStackFoundations:SF.0/flat-quotient-annihilator, SchemeAndStackFoundations:SF.0/range-basechange.

Proof: Apply the quotient theorem with Q=range f, then rewrite its extended submodule using range-basechange. The result computes the full annihilator of the actual quotient by the actual extended map, including nilpotent scalars.

## Canonical cokernel comparison

**TauCeti.SchemeFoundations.QuotientBaseChange.cokernelBaseChangeEquiv** — For any R-linear f:M→N and commutative R-algebra S, construct the S-linear equivalence S⊗_R(N/range f)≃(S⊗_R N)/range(f.baseChange S) by composing the existing tensor quotient equivalence with the native quotient transport along range-basechange. This named adapter introduces no new module or quotient carrier.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M and N are arbitrary additive commutative groups with R-module structures. Flatness and finite generation are required only where explicitly stated; finite generation applies to the quotient or cokernel.

Prerequisites: SchemeAndStackFoundations:SF.0/range-basechange, mathlib:TensorProduct.AlgebraTensorModule.tensorQuotientEquiv, mathlib:Submodule.quotEquivOfEq.

Proof: Compose tensorQuotientEquiv S R S (range f) with quotEquivOfEq using the symmetric range-basechange equality. The concrete Lean constructor is retained in every projection; no flatness, generator choice or finite presentation is needed.

## Cokernel comparison on representatives

**TauCeti.SchemeFoundations.QuotientBaseChange.cokernelBaseChangeEquiv_tmul** — The canonical cokernel comparison sends s⊗[n] to [s⊗n] for every s∈S and n∈N. Brackets denote the respective actual native quotient maps, so elements of range f are respected.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M and N are arbitrary additive commutative groups with R-module structures. Flatness and finite generation are required only where explicitly stated; finite generation applies to the quotient or cokernel.

Prerequisites: SchemeAndStackFoundations:SF.0/cokernel-basechange-comparison, mathlib:Submodule.quotEquivOfEq_mk.

Proof: Unfold the concrete composite on the actual tensor and quotient representatives. Both the existing tensor equivalence and quotient transport have the required defining evaluation.

## Inverse cokernel comparison on representatives

**TauCeti.SchemeFoundations.QuotientBaseChange.cokernelBaseChangeEquiv_symm_mk_tmul** — The inverse canonical cokernel comparison sends [s⊗n] to s⊗[n]. This fixes the inverse map on actual pure-tensor quotient representatives without a flatness hypothesis.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M and N are arbitrary additive commutative groups with R-module structures. Flatness and finite generation are required only where explicitly stated; finite generation applies to the quotient or cokernel.

Prerequisites: SchemeAndStackFoundations:SF.0/cokernel-basechange-comparison, mathlib:Submodule.quotEquivOfEq.

Proof: The inverse of the composite is the inverse native quotient transport followed by the inverse tensor quotient equivalence. Evaluate each on the same representative; both defining computations are exact.

## Canonical cokernel square

**TauCeti.SchemeFoundations.QuotientBaseChange.cokernel_baseChange_square** — As S-linear maps from S⊗_R N, cokernelBaseChangeEquiv S f composed with (range f).mkQ.baseChange S equals (range(f.baseChange S)).mkQ. The named comparison is therefore compatible with the actual quotient projection.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M and N are arbitrary additive commutative groups with R-module structures. Flatness and finite generation are required only where explicitly stated; finite generation applies to the quotient or cokernel.

Prerequisites: SchemeAndStackFoundations:SF.0/cokernel-basechange-comparison, SchemeAndStackFoundations:SF.0/cokernel-basechange-representative.

Proof: Apply tensor-linear-map extensionality. The defining comparison sends the tensor of each quotient representative to the quotient of the same actual tensor.

## Typed boundary tests

- **QuotientBaseChangeChecked.identity_cokernel**: For the identity map of any R-module, the quotient by the image of its scalar extension is a singleton, for every S.
- **QuotientBaseChangeChecked.zero_map_scalar**: For the zero map Z→Z and S=Z/5, the canonical comparison sends 3⊗[7] to a class whose actual quotient-zero and right-unit coordinates equal 1.
- **QuotientBaseChangeChecked.inverse_representative**: For multiplication by 2 on Z and S=Z/4, the actual inverse comparison sends [3⊗7] to 3⊗[7], although this scalar extension is not flat.
- **QuotientBaseChangeChecked.nonflat_injective_map_collapses**: Multiplication by 2 on Z is injective, but its extension to Z/2 is the zero linear map, and 1⊗1 is nonzero. Right-exact quotient comparison does not imply preservation of injectivity.
- **QuotientBaseChangeChecked.nonreduced_quotient_annihilator**: For Q=(2) in Z/4 under identity extension, the nonzero scalar 2 annihilates the actual quotient of the tensor module by Q.baseChange.
- **QuotientBaseChangeChecked.nonreduced_diagonal_quotient**: For Q=(2) in Z/4 under its actual flat diagonal extension to Z/4×Z/4, the nonzero scalar (2,2) annihilates the extended quotient.
- **QuotientBaseChangeChecked.top_quotient_annihilator**: For Q=M and any commutative R-algebra S, the actual extended quotient has unit annihilator, without a flatness or finiteness hypothesis.
- **QuotientBaseChangeChecked.zero_ring_cokernel**: For multiplication by 2 on Z and the zero coefficient ring Z/1, the actual extended cokernel quotient is a singleton.

# Flat base change of annihilators

For a finitely generated module M over a commutative ring R and a flat commutative R-algebra S, the full annihilator ideal extends to the annihilator of S⊗_R M. This is the generic SF.0 supplier requested by the conductor construction in Neron Models Part II. It uses native ideals and modules; it introduces no new carriers. The actual conductor quotient identification and sheaf comparisons remain the consumer’s work.

The proof follows the kernel argument in [Stacks Lemma10.40.4](https://stacks.math.columbia.edu/tag/07T8). First identify ideal extension with the image of S⊗I under the native right-unit equivalence. The pinned flat-kernel theorem then translates membership in an extended kernel into vanishing of a pure tensor. For a finite generating family, the product action map has kernel Ann_R(M); tensor commutes with this finite product, and the base-changed generators span the base-changed module. Choosing a finite generating family gives the desired result. No Noetherian or faithful-flatness assumption appears.

For a single element, the action map has source R and target the arbitrary module M, so no finiteness of M is needed. Without flatness, the forward ideal inclusion still follows from tensor induction. The finite ideal-intersection comparison uses the product of the actual quotient maps R→R/I_i. This is the finite ideal-extension form of the kernel argument in [Stacks Lemma10.39.2](https://stacks.math.columbia.edu/tag/0BBY); the more general arbitrary-flat-module IM formulation is not claimed here.

The seven tests include the empty family, identity extension, zero module and zero element, and nonzero nilpotent annihilators over Z/4 and its flat diagonal product extension. For the quotient Z/4→Z/2, the annihilator of the element2 extends to zero, while its tensor image is zero and hence has unit annihilator. This is an explicit counterexample to dropping flatness in the element formula. It does not assert a counterexample for the whole finite-module formula.

All29 incoming node objects and all14 existing API items are unchanged. The full suggested file is compiled, but its55 admitted signatures are planning evidence only. The separately retained native proof file proves the eight new statements and seven tests with no admissions; five inherited native results are re-audited. The packet remains partial. Historical checkpoint text follows the new strand and keeps its original attribution and boundaries.

The generic flat-annihilator supplier now has eight declaration-sized nodes and seven typed boundary tests. Native proofs establish the finite-module identity, arbitrary-element identity, unconditional inclusion and finite ideal-intersection comparison using the pinned kernel and tensor APIs. The Neron Part II consumer must still identify the actual base-changed quotient algebra/module and conductor/sheaf maps; its multi-part SF.0 request remains open. All existing henselization, reserved-key, source-route and other-stage obligations remain unchanged.

## Ideal extension as a tensor image

**TauCeti.SchemeFoundations.FlatAnnihilator.ideal_map_eq_tensor_range** — For every ideal I of a commutative ring R and every commutative R-algebra S, I.map(algebraMap R S) is the image of S⊗I → S⊗R → S, using the actual subtype base-change map and heterobasic right-unit equivalence. No flatness is assumed.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M is an additive commutative group with its R-module structure. Additional assumptions are exactly those in the statement; the finite-index Lean forms use Fintype and DecidableEq.

Prerequisites: mathlib:Ideal.map, mathlib:LinearMap.baseChange, mathlib:TensorProduct.AlgebraTensorModule.rid_tmul.

Proof: Use Ideal.map_le_iff_le_comap. A generator r∈I is the image of 1⊗r. Conversely, tensor induction reduces membership of the image to closure of the mapped ideal under S-multiplication and addition.

## Membership in an extended kernel

**TauCeti.SchemeFoundations.FlatAnnihilator.mem_map_kernel_iff** — For flat commutative R-algebra S, any R-linear f:R→M and s∈S, s belongs to the extension of ker(f) if and only if s⊗f(1)=0 in S⊗_R M. M is any R-module.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M is an additive commutative group with its R-module structure. Additional assumptions are exactly those in the statement; the finite-index Lean forms use Fintype and DecidableEq.

Prerequisites: SchemeAndStackFoundations:SF.0/ideal-map-tensor-range, mathlib:Module.Flat.ker_lTensor_eq.

Proof: The pinned flat-kernel theorem identifies ker(1⊗f) with the image of S⊗ker(f). The right-unit equivalence identifies s⊗1 with s; apply its injectivity to transport actual preimages.

## Annihilator from a generating family

**TauCeti.SchemeFoundations.FlatAnnihilator.annihilator_eq_generator_kernel** — For any R-module M and any family g:ι→M with span(range g)=top, Ann_R(M) is the kernel of R→Π_i M given by r↦(r•g_i)_i. The index type may be infinite.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M is an additive commutative group with its R-module structure. Additional assumptions are exactly those in the statement; the finite-index Lean forms use Fintype and DecidableEq.

Prerequisites: mathlib:Module.annihilator, mathlib:Submodule.annihilator_top, mathlib:Submodule.mem_annihilator_span.

Proof: Rewrite the annihilator of the whole module as the annihilator of the spanning submodule. Native span membership characterizes it by killing each generator, exactly membership in the kernel of the product action map.

## Flat annihilator comparison on finite generators

**TauCeti.SchemeFoundations.FlatAnnihilator.annihilator_flat_baseChange_generators** — For flat commutative R-algebra S and a finite family g:ι→M spanning M, the extension of Ann_R(M) is exactly Ann_S(S⊗_R M). The full ideals, including their nilpotent elements, are compared.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M is an additive commutative group with its R-module structure. Additional assumptions are exactly those in the statement; the finite-index Lean forms use Fintype and DecidableEq.

Prerequisites: SchemeAndStackFoundations:SF.0/flat-kernel-membership, SchemeAndStackFoundations:SF.0/annihilator-generator-kernel, mathlib:TensorProduct.piRight, mathlib:Submodule.baseChange_span, mathlib:Submodule.baseChange_top.

Proof: The native baseChange_span and baseChange_top laws show that 1⊗g_i span S⊗M. Express both annihilators as kernels. The finite-product tensor equivalence sends s⊗(g_i)_i to (s⊗g_i)_i, so the flat-kernel criterion gives equality. This finite-product step is precisely where finiteness of the generating family is used.

## Flat base change of annihilators

**TauCeti.SchemeFoundations.FlatAnnihilator.annihilator_flat_baseChange** — For commutative rings R,S with an R-algebra structure on S, an R-module M that is finitely generated, and S flat over R, (Ann_R M).map(algebraMap R S)=Ann_S(S⊗_R M). No Noetherian, injectivity, faithful-flatness, reducedness or finite-presentation assumption on S is made.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M is an additive commutative group with its R-module structure. Additional assumptions are exactly those in the statement; the finite-index Lean forms use Fintype and DecidableEq.

Prerequisites: SchemeAndStackFoundations:SF.0/flat-annihilator-generators, mathlib:Module.Finite.exists_fin.

Proof: Choose the finite generating family provided by the pinned Module.Finite.exists_fin theorem and apply the finite-generator comparison. The result is independent of that choice because both sides are the native annihilator ideals.

## Flat base change of an element annihilator

**TauCeti.SchemeFoundations.FlatAnnihilator.element_annihilator_flat_baseChange** — For any R-module M, m∈M and flat commutative R-algebra S, the extension of the annihilator of span_R{m} equals the annihilator of span_S{1⊗m} in S⊗_R M. M need not be finitely generated.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M is an additive commutative group with its R-module structure. Additional assumptions are exactly those in the statement; the finite-index Lean forms use Fintype and DecidableEq.

Prerequisites: SchemeAndStackFoundations:SF.0/flat-kernel-membership, mathlib:Submodule.annihilator_span_singleton.

Proof: The annihilator of span{m} is the kernel of r↦r•m. Apply the flat-kernel membership criterion, then the native singleton-span criterion and scalar multiplication of pure tensors.

## Unconditional annihilator inclusion

**TauCeti.SchemeFoundations.FlatAnnihilator.annihilator_map_le_baseChange** — For every commutative R-algebra S and every R-module M, (Ann_R M).map(algebraMap R S) ≤ Ann_S(S⊗_R M). Neither flatness nor finite generation is needed for this inclusion.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M is an additive commutative group with its R-module structure. Additional assumptions are exactly those in the statement; the finite-index Lean forms use Fintype and DecidableEq.

Prerequisites: mathlib:Ideal.map_le_iff_le_comap, mathlib:Module.annihilator.

Proof: Reduce ideal extension to its R-generators. Tensor induction reduces annihilation to pure tensors. The balanced tensor relation transfers the scalar from S to M, where it acts as zero.

## Flat extension of finite ideal intersections

**TauCeti.SchemeFoundations.FlatAnnihilator.ideal_map_iInf_finite** — For flat commutative R-algebra S and any finite family of ideals I_i of R, extending their intersection to S equals the intersection of their extended ideals. The empty family is included, and the ideals need not be finitely generated.

Hypotheses: R and S are commutative rings, including zero rings, in independent universes. M is an additive commutative group with its R-module structure. Additional assumptions are exactly those in the statement; the finite-index Lean forms use Fintype and DecidableEq.

Prerequisites: SchemeAndStackFoundations:SF.0/flat-kernel-membership, mathlib:TensorProduct.piRight, mathlib:Submodule.ker_mkQ, mathlib:Ideal.Quotient.eq_zero_iff_mem.

Proof: Realize the intersection as the kernel of R→Π_i R/I_i using the actual quotient linear maps. Flat-kernel membership and the native tensor finite-product equivalence identify its vanishing with the coordinate conditions. Apply the same kernel criterion to each quotient map. This finite ideal-extension form is an authored generalization of the binary kernel argument in Stacks 0BBY, not a claim to prove its arbitrary flat-module IM formulation.

## Typed boundary tests

- **FlatAnnihilatorChecked.empty_family**: The intersection over Fin 0 maps to the unit ideal, including zero rings.
- **FlatAnnihilatorChecked.identity_extension**: For every finitely generated R-module M, tensoring with R preserves its annihilator under the actual scalar extension.
- **FlatAnnihilatorChecked.zero_module**: For flat R→S, the annihilator of S⊗_R the zero submodule of R is the unit ideal.
- **FlatAnnihilatorChecked.zero_element**: The annihilator of the span of 1⊗0 is the unit ideal after flat extension.
- **FlatAnnihilatorChecked.nonreduced_element**: Over Z/4, the nonzero element 2 belongs to the annihilator of the span of 1⊗2 under the identity extension.
- **FlatAnnihilatorChecked.nonreduced_diagonal**: Under the actual flat diagonal Z/4→Z/4×Z/4, the nonzero element (2,2) kills the span of 1⊗2. The flat instance is synthesized from the native product module.
- **FlatAnnihilatorChecked.nonflat_element_failure**: For the actual quotient algebra Z/4→Z/2 and the element 2 in the module Z/4, the extended element annihilator is zero, whereas the annihilator of span{1⊗2} is the unit ideal, and these ideals differ. This tests the element formula, not a failure of the finite-whole-module formula.

# Scheme, stack, cohomology and intersection foundations

Partial continuation by Codex — `codex-J6LwjP`, 2 October 2026. Refs #642. Inherits the `codex-a71f92` finite-data checkpoint.


Continuation of the existing SF.0 henselization strand: all twenty-five inherited IDs retained; four declaration-sized actual-section selector, kernel, product and localization adapters are added with native proofs, and the inherited etale-lift uniqueness statement now has a native proof. The generic unramified diagonal and idempotent/localization machinery are already built and imported. Lifted residue-selector localization, finite-data implementation, source criterion/universal cocone, ownership overlap, all other keys/stages/source routes and confirmed findings remain open; every implementation stays unchecked pending review.

This document is definitive. There are 29 nodes, 14 API entries, twelve definition/construction tests, nine additional typed lemma acceptance checks, three SF.0 planets and 57 baseline references. Five declarations now have native proofs without admitted dependencies; the full suggested file still contains admitted declarations, and all implementation statuses remain unchecked. All seven stages remain open; the other five reserved definitions are unfinished.

The construction uses arbitrary commutative ring/ideal pairs. It does not require Noetherianity, locality or completeness. The ideal I may be the unit ideal, in which case its henselization is the zero ring. General faithful flatness therefore cannot be asserted. The local case preserves the specified residue field; strict henselization remains an upstream import.

The library baseline already supplies schemes, morphism properties, the simple-root HenselianRing predicate, etale algebras, standard etale presentations, tensor/quotient operations, full subcategories, small models and colimits. The new construction does not rebuild those carriers. Importing an etale-section criterion for the existing simple-root predicate is mathematical proof work, not a definitional identification.

## Source and ownership evidence

All seven accepted REV-RS-25 SchemeAndStackFoundations layer decisions and their touching exact endpoint links read on 2026-10-02; full RS-25 family report not claimed read.

Inherited codex-rtOQ9t provenance: Full GrothendieckEulerForms and Multiquadratic upstream roadmap documents read during that continuing worker session. Only selected ModularCurves 4D/0E passages and five exact touching AlgebraicCurves/ModularCurves research links were read for this job. Existing upstream mathematics is imported, never re-planned.

All seven applicable AUDIT-01 entries and the complete key/henselization brief were read. Four reviewed paper uses (CMM21/046, BhattMathew23/005, Bresciani24/46 and GroechenigWyssZiegler20-B/127) inform consumer requirements; no fresh primary-paper read or closed application is claimed. All original roadmap references and issue routes remain pending.

- [Henselization of pairs](https://stacks.math.columbia.edu/tag/0EM7): Online tag 0EM7, retrieved 2026-10-02. The complete mathematical statements and proofs of Lemmas 15.12.1-15.12.8; the selected proof of 15.12.1 drives the nodes. Later lemmas are read leads, not fully planned results. SHA-256 `4ba42d62e07f39cd049d2d8f3111e27472daf4060685232ac1ea70a2cc3f0e0e`.

- [Henselian pairs](https://stacks.math.columbia.edu/tag/09XD): Online tag 09XD, retrieved 2026-10-02. Definition 15.11.1 and Lemmas 15.11.2-15.11.12, with their displayed proofs, especially all implications of 15.11.6 and integral closure argument 15.11.5. Only the beginning of 15.11.13 was read; no claim to have read the entire section. SHA-256 `18df4964249ddabef35c00efeba591da700b4b8dfef513eb438111965457a5a8`.

- [Product compatibility of henselization](https://stacks.math.columbia.edu/tag/0H7Q): Online tag 0H7Q, retrieved 2026-10-02. Statement and entire proof as displayed in parent section 0EM7, Lemma 15.12.8; the downloaded standalone page is a version receipt. Product compatibility is not a node in this checkpoint. SHA-256 `cc52e43fa913e1f2105ac07ad603e98576d233c57f151b52958b71c45b8531a5`.

- [More on Algebra source text](https://raw.githubusercontent.com/stacks/stacks-project/master/more-algebra.tex): Current master more-algebra.tex, retrieved 2026-10-02. Only the product-henselization proof paragraph containing the circular B double-prime subscript, collated with 0EM7/0H7Q. Not a whole-file read. SHA-256 `0106554339e8966fe04411b2ae9f9cd856b165849feef0c7bc37634819064708`.


- [The unramified diagonal splits](https://stacks.math.columbia.edu/tag/02FL): Lemma 10.151.4, complete mathematical statement and displayed proof freshly read. Native section adapters below derive the actual selector/projection equations from already-built pinned ideal and localization facts; no generic diagonal or localization construction is re-planned. HTML SHA-256 `330a0f58f2d18f3f2e2d0cbc346aac7a6044b0db68849cbb5a26468375dca90e`.


- [Surjective etale maps are idempotent localizations](https://stacks.math.columbia.edu/tag/00U8): Lemma 10.143.9, complete mathematical statement and displayed proof freshly read. Native section adapters below derive the actual selector/projection equations from already-built pinned ideal and localization facts; no generic diagonal or localization construction is re-planned. HTML SHA-256 `6ab27dae9d6ca9288696aad794e6901382d9224e0e5bbc585cfa6ec8b7d3756c`.


- [Maps between etale algebras are etale](https://stacks.math.columbia.edu/tag/00U7): Lemma 10.143.8, complete mathematical statement and displayed proof freshly read. Native section adapters below derive the actual selector/projection equations from already-built pinned ideal and localization facts; no generic diagonal or localization construction is re-planned. HTML SHA-256 `9cc9e26369df8bae48364b390a3ac85bc49afeb917feea3c2813f14e00d44810`.


The source product proof has a circular subscript: B''_2 = B_2 \otimes_B B''_2; the intended tensor product uses B''_2 = B_2 \otimes_B B'_2. The finding is a proof misprint awaiting independent review. It is scoped to the downloaded online/current-master versions; the product theorem is not planned here. Searches and reasons are in sourceIssues E1.

## Henselization declarations

### Residue-preserving étale neighbourhoods

`SchemeAndStackFoundations:SF.0/etale-neighbourhood` · definition · `TauCeti.Henselization.IsNeighbourhood`

For a commutative R and ideal I, an object is an existing CommAlgCat R algebra B satisfying Algebra.Etale R B and bijectivity of the canonical quotientMap R/I → B/(I.map(algebraMap R B)). Neighbourhood I is the existing full subcategory on this predicate; its morphisms are every actual R-algebra map. An arbitrary abstract isomorphism of quotients is not sufficient.

Proof/construction outline:

1. Instantiate Ideal.quotientMap with Ideal.le_comap_map; this fixes the reduction map, rather than choosing a residue-field equivalence.

2. Use ObjectProperty.FullSubcategory and its inclusion, retaining all algebra maps, including distinct parallel maps with identical reduction.

3. The identity R-algebra is an object. A localization R[1/x] is an object when x becomes a unit in R/I: it is already etale and its quotient localization is R/I.

4. Tensor and parallel-map operations are supplied by the following separate nodes. No scheme, etale, ideal, tensor or full-subcategory carrier is rebuilt.


Acceptance:

- Inverting 2 over (Z,(5)) qualifies; inverting 5 does not.

- The diagonal Z/5 → (Z/5)^2 is not bijective, so the two-sheeted etale product is rejected.


Use-derived API:

- `TauCeti.Henselization.isNeighbourhood_self` (constructor): The identity R-algebra is a neighbourhood of (R,I).

- `TauCeti.Henselization.isNeighbourhood_localization` (constructor): If x is a unit modulo I, the existing Localization.Away x is a neighbourhood.

- `TauCeti.Henselization.isNeighbourhood_tensor` (structure): The tensor product of two neighbourhoods over R is again a neighbourhood.


Discriminating typed tests in the suggested file:

- `TauCeti.Henselization.neighbourhood_identity` (degenerate): For every (R,I), the identity algebra R belongs to Neighbourhood I.

- `TauCeti.Henselization.neighbourhood_invert_two` (computation): For (Z,(5)), Z[1/2] satisfies the neighbourhood predicate.

- `TauCeti.Henselization.neighbourhood_reject_invert_five` (non-example): For (Z,(5)), Z[1/5] does not satisfy the predicate; its quotient is zero.

- `TauCeti.Henselization.neighbourhood_reject_two_sheets` (non-example): For (Z,(5)), the etale Z-algebra Z × Z is not residue-preserving: the canonical reduction is diagonal.


Uses:

- Stacks 15.12.1, category C: Its objects and actual morphisms are the diagram for the initial henselian pair.

- KEYDEF-algebraicgeometry/henselization; reviewed CMM21 item 046, Construction 3.18: The general pair construction, rather than completion or only a chosen local ring, is the shared consumer contract. The original CMM paper has not been freshly read in this checkpoint.


Prerequisites: `mathlib:CommAlgCat`, `mathlib:CommAlgCat.Hom`, `mathlib:Algebra.Etale`, `mathlib:Ideal.quotientMap`, `mathlib:Ideal.le_comap_map`, `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`, `mathlib:CategoryTheory.ObjectProperty.ι`, `mathlib:Algebra.Etale.of_isLocalizationAway`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. Residue-preserving étale neighbourhoods

### Tensor products give common targets

`SchemeAndStackFoundations:SF.0/tensor-neighbourhood` · lemma · `TauCeti.Henselization.isNeighbourhood_tensor`

If B and C are etale R-algebras with canonical quotient R/I, then B tensor_R C is etale over R and its canonical quotient by I is R/I. The standard tensor inclusions give a common target in Neighbourhood I.

Proof/construction outline:

1. Base change Algebra.Etale R C to B, then compose with Algebra.Etale R B.

2. Use the existing quotient/tensor equivalences to identify (B tensor_R C)/I with (B/IB) tensor_(R/I) (C/IC).

3. Use the two canonical reduction isomorphisms to identify this tensor product with R/I. Check the resulting map is the canonical quotientMap, not just some ring equivalence.

4. Lift both existing tensor algebra maps to the full subcategory.


Acceptance:

- For I=top all reductions are zero; the construction still applies.

- For two copies of R[1/2] at (Z,(5)), the common target is again canonically R[1/2].


Prerequisites: `SchemeAndStackFoundations:SF.0/etale-neighbourhood`, `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.Etale.comp`, `mathlib:Algebra.TensorProduct.quotIdealMapEquivTensorQuot`, `mathlib:Algebra.TensorProduct.tensorQuotientEquiv`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. Tensor products give common targets

### Parallel algebra maps can be equalized

`SchemeAndStackFoundations:SF.0/parallel-equalization` · lemma · `TauCeti.Henselization.parallel_equalization`

For every f,g:B→C in Neighbourhood I there exist D in Neighbourhood I and h:C→D with h∘f=h∘g. No assumption that f=g, that maps are inclusions, or that the category is thin is allowed.

Proof/construction outline:

1. Form E=C tensor_(B,f,g) C, and its structure as a quotient of C tensor_R C. Then form D=E tensor_(C tensor_R C) C using multiplication into the last C.

2. Each B→C map is etale by the existing of_restrictScalars theorem. Base change and composition show R→D is etale.

3. Reduce this iterated tensor diagram modulo I. All object reductions are canonically R/I and all reduced morphisms are identities, so D/ID is canonically R/I.

4. The map C→D equalizes f,g by the tensor balancing equations. This is the actual source coequalizer construction; native scalar-tower transport remains a recorded implementation gap.


Acceptance:

- Over R=Z/6,I=(3), C=F3×F2×F2 admits distinct identity and sheet-swap endomorphisms. Projection to F3 equalizes them and remains a neighbourhood.

- The sheet-swap witness rejects a plan that replaces this category by a directed poset of embeddings.


Prerequisites: `SchemeAndStackFoundations:SF.0/etale-neighbourhood`, `SchemeAndStackFoundations:SF.0/tensor-neighbourhood`, `mathlib:Algebra.Etale.of_restrictScalars`, `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.Etale.comp`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. Parallel algebra maps can be equalized

### The neighbourhood category is filtered

`SchemeAndStackFoundations:SF.0/filtered-neighbourhoods` · theorem · `TauCeti.Henselization.neighbourhood_isFiltered`

Neighbourhood I is a nonempty filtered category in the existing CategoryTheory.IsFiltered sense: identity object, common targets, and equalization of every pair of parallel arrows.

Proof/construction outline:

1. Use the identity neighbourhood to give nonemptiness.

2. Use the tensor common-target node for the cocone_objs field.

3. Use parallel_equalization for cocone_maps. These are precisely the existing IsFiltered fields; no new filtered predicate is introduced.


Acceptance:

- The zero-ring boundary I=top still gives a nonempty category.

- The explicit Z/6 sheet-swap case uses the second filtering axiom, which directedness of objects alone cannot supply.


Prerequisites: `SchemeAndStackFoundations:SF.0/etale-neighbourhood`, `SchemeAndStackFoundations:SF.0/tensor-neighbourhood`, `SchemeAndStackFoundations:SF.0/parallel-equalization`, `mathlib:CategoryTheory.IsFiltered`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. The neighbourhood category is filtered

### A small model for neighbourhoods

`SchemeAndStackFoundations:SF.0/small-neighbourhoods` · lemma · `TauCeti.Henselization.neighbourhood_essentiallySmall`

For R:Type u, Neighbourhood I with carriers in Type u is EssentiallySmall at universe u. Thus SmallModel at universe u can index a colimit in CommAlgCat with carriers in Type u.

Proof/construction outline:

1. Etale implies finite presentation and hence finite type; the neighbourhood full subcategory embeds fully faithfully into the existing FGAlgCat R.

2. Use the existing FGAlgCat essential-smallness instance, whose proof represents finite-type algebras by finite-variable polynomial quotients.

3. Apply essentiallySmall_of_fully_faithful and use the existing equivalence equivSmallModel. Reindex the inclusion along its inverse. Generic smallness and skeleton construction remain baseline work, not new nodes.

4. This is a categorical implementation adapter to the source colimit. A universe-enlargement comparison for differently sized target carriers remains future work; common-universe statements below are meaningful.


Acceptance:

- The indexing objects may originally live in Type (u+1), but their SmallModel is in Type u.

- No class of all rings is used as a small colimit shape without a smallness proof.


Prerequisites: `SchemeAndStackFoundations:SF.0/etale-neighbourhood`, `mathlib:CategoryTheory.EssentiallySmall`, `mathlib:CategoryTheory.SmallModel`, `mathlib:CategoryTheory.equivSmallModel`, `mathlib:CategoryTheory.essentiallySmall_of_fully_faithful`, `mathlib:Algebra.FiniteType.exists_fgAlgCatSkeleton`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. A small model for neighbourhoods

### Henselization of a ring and ideal

`SchemeAndStackFoundations:key/henselization` · construction · `TauCeti.Henselization.algebra`

For arbitrary (R,I), define its henselization algebra H to be the actual colimit in CommAlgCat R of the neighbourhood inclusion, reindexed by the inverse of equivSmallModel. The unit η:R→H is its existing algebraMap; IH is I.map η. Desired henselian and universal properties are theorems about this colimit, not fields postulated in a record.

Proof/construction outline:

1. Use the actual neighbourhood full subcategory and its essential-smallness proof.

2. Define diagram I=(equivSmallModel (Neighbourhood I)).inverse followed by the full-subcategory inclusion.

3. Use existing colimits in CommAlgCat, available through its equivalence with Under R. Define H=colimit(diagram I), with the inherited commutative-ring and R-algebra structures.

4. Use the universal cocone to obtain all stage maps. The following nodes establish canonical residue preservation, Jacobson containment, simple-root lifting and the initial property.

5. Treat diagram, extended ideal, reduction map and stage maps as routine instantiations of existing categorical/algebra operations. They do not redefine ind-etaleness or assume H is the completion.


Acceptance:

- At I=0, H is canonically R; at I=top, H is the zero R-algebra.

- Already henselian pairs are fixed. For F5 at its zero maximal ideal the residue field remains F5, not its separable closure.


Use-derived API:

- `TauCeti.Henselization.stage` (constructor): For each object of the small neighbourhood diagram, the colimit cocone gives its R-algebra map to H.

- `TauCeti.Henselization.stage_naturality` (functoriality): For f:B→C in the small diagram, stage(C)∘diagram(f)=stage(B).

- `TauCeti.Henselization.quotient_bijective` (compatibility): The canonical R/I→H/IH is bijective, not merely abstractly isomorphic.

- `TauCeti.Henselization.henselian` (characterisation): The actual H,IH satisfy the existing Mathlib HenselianRing predicate.

- `TauCeti.Henselization.existsUnique_lift` (universal-property): Every pair map to a HenselianRing (S,J) extends uniquely to a ring map H→S.

- `TauCeti.Henselization.fixed_of_henselian` (compatibility): If (R,I) is already henselian, H is canonically isomorphic to R as an R-algebra.


Discriminating typed tests in the suggested file:

- `TauCeti.Henselization.henselization_zero_ideal` (degenerate): For every commutative R, H(R,0) is R as an R-algebra.

- `TauCeti.Henselization.henselization_unit_ideal` (degenerate): For every commutative R, H(R,R) is a subsingleton ring.

- `TauCeti.Henselization.henselization_fixed_pair` (compatibility): For every existing HenselianRing R I, H(R,I) is R as an R-algebra.

- `TauCeti.Henselization.henselization_ordinary_finite_field` (non-example): The ordinary henselization of (F5,0) is F5 as an F5-algebra; it does not enlarge the residue field as strict henselization does.


Uses:

- Stacks 15.12.1, initial henselian pair and colimit construction: The universal pair, residue comparison and explicit filtered etale presentation determine the construction.

- Reviewed KEYDEF-algebraicgeometry/henselization and CMM21 item 046, Construction 3.18 / Remark 3.19: General pair universality is required before the K-theory application. This imports the reviewed extraction as a consumer lead, not a fresh CMM source read.

- Reviewed BhattMathew23 item 005; Bresciani24 item 46; GroechenigWyssZiegler20-B item 127: p-henselian gluing, local Galois specialization and henselized local neighborhoods require later comparisons listed as gaps. None follows merely from naming H.


Prerequisites: `SchemeAndStackFoundations:SF.0/etale-neighbourhood`, `SchemeAndStackFoundations:SF.0/filtered-neighbourhoods`, `SchemeAndStackFoundations:SF.0/small-neighbourhoods`, `mathlib:CategoryTheory.SmallModel`, `mathlib:CategoryTheory.equivSmallModel`, `mathlib:CategoryTheory.Limits.HasColimit`, `mathlib:commAlgCatEquivUnder`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. Henselization of a ring and ideal

### Ideal membership is detected at a later neighbourhood

`SchemeAndStackFoundations:SF.0/extended-ideal-stage` · lemma · `TauCeti.Henselization.mem_extended_iff_exists_stage`

For b in a stage B, stage_B(b) belongs to IH if and only if there are a later stage C and one arrow t:B→C with diagram(t)(b) in IC. The existential is over actual neighbourhood arrows, not an inclusion order or an embedding of carriers.

Hypotheses:

- R is any commutative ring with identity, including the zero ring; I is any ideal, without finite-generation, Noetherian, local or completeness assumptions.

- B and C are objects of the chosen small neighbourhood diagram. All carrier rings lie in a common universe; its transition maps need not be injective.

Proof/construction outline:

1. Transport filteredness to SmallModel by IsFiltered.of_equivalence. To apply Concrete.colimit_exists_rep and colimit_rep_eq_iff_exists to diagram I, compose commAlgCatEquivUnder with Under.forget and the commutative-ring forgetful functor: the equivalence preserves colimits, Under.forget preserves connected colimits by IsFiltered.isConnected, and the latter functor preserves filtered colimits. Identify this composite with the actual CommAlgCat forgetful functor using the natural isomorphism and preservesColimit_of_natIso. These are built generic inputs, not a new colimit construction.

2. Unfold Ideal.map as the span of η(I). Submodule.span_induction proves that each member has a witness built from finitely many generators η(r), r in I, and finitely many coefficients in H. Represent those coefficients using Concrete.colimit_exists_rep and use IsFiltered.sup_exists to move them to one stage C0. Their finite sum lies in IC0 and has the prescribed image in H.

3. For the given b, detect the equality between its stage image and the finite-sum image using Concrete.colimit_rep_eq_iff_exists. Refine C0 and B, retaining a single arrow from B; finite parallel-arrow discrepancies are equalized using sup_exists. This yields diagram(t)(b) in IC.

4. Conversely, stage_C maps IC into IH because its R-algebra map commutes with η. Apply Ideal.map_le_iff_le_comap and the existing cocone naturality. No finite generating set for the whole ideal and no injectivity are used.

Acceptance:

- At I=0, a stage element mapped to zero becomes zero along an actual later arrow, even for non-injective transition maps.

- At I=R, every stage element meets the criterion; no nonzero-ring assumption is added.

Uses:

- SchemeAndStackFoundations:SF.0/residue-comparison: Detect the kernel of the canonical base quotient map without an undecomposed quotient/colimit adjunction.

- SchemeAndStackFoundations:SF.0/jacobson-containment: Bring the extended-ideal element and its multiplier to one neighbourhood before localizing 1+bc.

- SchemeAndStackFoundations:SF.0/simple-root-stage: The polynomial evaluation's membership is an actual finite witness at a later neighbourhood.

Prerequisites: `SchemeAndStackFoundations:key/henselization`, `mathlib:CommRingCat.FilteredColimits.forget_preservesFilteredColimits`, `mathlib:CategoryTheory.Under.preservesColimitsOfShape_forget_of_isConnected`, `mathlib:CategoryTheory.IsFiltered.of_equivalence`, `mathlib:CategoryTheory.IsFiltered.isConnected`, `mathlib:CategoryTheory.IsFiltered.sup_exists`, `mathlib:CategoryTheory.Limits.Concrete.colimit_exists_rep`, `mathlib:CategoryTheory.Limits.Concrete.colimit_rep_eq_iff_exists`, `mathlib:CategoryTheory.Limits.preservesColimit_of_natIso`, `mathlib:commAlgCatEquivUnder`, `mathlib:Ideal.map`, `mathlib:Submodule.span_induction`, `mathlib:Ideal.map_le_iff_le_comap`, `mathlib:Ideal.map_map`.

Source: STACKS-0EM7, Lemma 15.12.1, proof: the neighbourhood colimit and its reduction; finite-data adaptation to the pinned simple-root predicate. Motivates this diagram-specific proof adapter. The finitary span, inverse-witness and coefficient arguments below are derived from the explicitly cited pinned library statements, not asserted to be separately numbered source theorems.

### A monic polynomial descends to a neighbourhood

`SchemeAndStackFoundations:SF.0/monic-polynomial-stage` · lemma · `TauCeti.Henselization.exists_stage_monic_polynomial`

For every monic f in H[T], there are a small stage B and a monic p in B[T] with coefficient map stage_B sending p exactly to f. No injectivity of stage_B, prescribed degree of p, or finite-generation condition on I is asserted.

Hypotheses:

- R is any commutative ring with identity, including the zero ring; I is any ideal, without finite-generation, Noetherian, local or completeness assumptions.

- B and C are objects of the chosen small neighbourhood diagram. All carrier rings lie in a common universe; its transition maps need not be injective.

Proof/construction outline:

1. Use Polynomial.Monic.as_sum to write f=X^n plus the finite sum of its coefficients of exponents below n. The representation also holds for H a subsingleton ring.

2. Represent the finitely many lower coefficients by Concrete.colimit_exists_rep. IsFiltered.sup_exists moves their representatives to a single stage B; for an empty coefficient family use the nonempty neighbourhood category.

3. Define p at B by the same X^n plus lower-coefficient sum. Its leading term gives monicity (or use the subsingleton convention if B is zero). Mapping coefficients returns f term by term.

4. This construction chooses the leading coefficient to be 1 at B, rather than claiming an arbitrary polynomial lift must be monic. Do not infer degree equality through a non-injective or zero-target ring map.

Acceptance:

- The polynomial 1 uses an empty lower-coefficient list and still has a stage representative.

- A monic polynomial over the zero colimit ring is allowed; the statement makes no unjustified degree-preservation claim.

Uses:

- SchemeAndStackFoundations:SF.0/simple-root-stage: Supply a genuinely monic polynomial at a finite stage before constructing the standard-étale root algebra.

Prerequisites: `SchemeAndStackFoundations:key/henselization`, `mathlib:CommRingCat.FilteredColimits.forget_preservesFilteredColimits`, `mathlib:CategoryTheory.Under.preservesColimitsOfShape_forget_of_isConnected`, `mathlib:CategoryTheory.IsFiltered.of_equivalence`, `mathlib:CategoryTheory.IsFiltered.isConnected`, `mathlib:CategoryTheory.IsFiltered.sup_exists`, `mathlib:CategoryTheory.Limits.Concrete.colimit_exists_rep`, `mathlib:CategoryTheory.Limits.Concrete.colimit_rep_eq_iff_exists`, `mathlib:CategoryTheory.Limits.preservesColimit_of_natIso`, `mathlib:Polynomial.Monic.as_sum`.

Source: STACKS-0EM7, Lemma 15.12.1, proof: the neighbourhood colimit and its reduction; finite-data adaptation to the pinned simple-root predicate. Motivates this diagram-specific proof adapter. The finitary span, inverse-witness and coefficient arguments below are derived from the explicitly cited pinned library statements, not asserted to be separately numbered source theorems.

### A quotient unit descends to a later neighbourhood

`SchemeAndStackFoundations:SF.0/quotient-unit-stage` · lemma · `TauCeti.Henselization.exists_stage_quotient_unit`

If b is in a stage B and its image in H/IH is a unit, then there are a later stage C and an arrow t:B→C such that the class of diagram(t)(b) in C/IC is a unit. No lift of that unit is asserted to be a unit in B or in H.

Hypotheses:

- R is any commutative ring with identity, including the zero ring; I is any ideal, without finite-generation, Noetherian, local or completeness assumptions.

- B and C are objects of the chosen small neighbourhood diagram. All carrier rings lie in a common universe; its transition maps need not be injective.

Proof/construction outline:

1. Choose an inverse of the class of stage_B(b) in H/IH and a representative c in H, using quotient surjectivity. The inverse equation says stage_B(b)c−1 belongs to IH.

2. Represent c at a stage and take a common target with B using Concrete.colimit_exists_rep and IsFiltered.sup_exists. Its product-minus-one has the required stage image by the ring-map laws and cocone naturality.

3. Apply mem_extended_iff_exists_stage to that one product-minus-one. At the later target its class is zero, so the transported b and c have product 1 in C/IC.

4. The quotient is commutative, so the same c gives the two-sided inverse and hence a unit. No henselian-pair theorem, residue-comparison result, or base-ring unit hypothesis is used, avoiding a cycle.

Acceptance:

- For Z/30 at I=(5), the element 2 is a unit modulo I but is not a unit in Z/30 itself; replacing quotient invertibility by stage invertibility is false.

- The zero quotient at the unit ideal has 0=1 and its sole element is a unit; the statement remains valid.

Uses:

- SchemeAndStackFoundations:SF.0/simple-root-stage: Transport the actual derivative's inverse modulo I to the same finite stage as the polynomial and approximate root.

Prerequisites: `SchemeAndStackFoundations:key/henselization`, `mathlib:CommRingCat.FilteredColimits.forget_preservesFilteredColimits`, `mathlib:CategoryTheory.Under.preservesColimitsOfShape_forget_of_isConnected`, `mathlib:CategoryTheory.IsFiltered.of_equivalence`, `mathlib:CategoryTheory.IsFiltered.isConnected`, `mathlib:CategoryTheory.IsFiltered.sup_exists`, `mathlib:CategoryTheory.Limits.Concrete.colimit_exists_rep`, `mathlib:CategoryTheory.Limits.Concrete.colimit_rep_eq_iff_exists`, `mathlib:CategoryTheory.Limits.preservesColimit_of_natIso`, `SchemeAndStackFoundations:SF.0/extended-ideal-stage`, `mathlib:Ideal.quotientMap`, `mathlib:Ideal.Quotient.mk_surjective`, `mathlib:Ideal.Quotient.eq_zero_iff_mem`.

Source: STACKS-0EM7, Lemma 15.12.1, proof: the neighbourhood colimit and its reduction; finite-data adaptation to the pinned simple-root predicate. Motivates this diagram-specific proof adapter. The finitary span, inverse-witness and coefficient arguments below are derived from the explicitly cited pinned library statements, not asserted to be separately numbered source theorems.

### Simple-root data descend simultaneously

`SchemeAndStackFoundations:SF.0/simple-root-stage` · lemma · `TauCeti.Henselization.exists_stage_simple_root`

Let f in H[T] be monic and a0 in H satisfy f(a0) in IH and f′(a0) invertible modulo IH. There exist a small neighbourhood B, a monic p in B[T], and b in B such that coefficient mapping sends p to f, stage_B(b)=a0, p(b) belongs to IB, and p′(b) is invertible in B/IB. Every condition holds at the same stage.

Hypotheses:

- R is any commutative ring with identity, including the zero ring; I is any ideal, without finite-generation, Noetherian, local or completeness assumptions.

- B and C are objects of the chosen small neighbourhood diagram. All carrier rings lie in a common universe; its transition maps need not be injective.

Proof/construction outline:

1. First use exists_stage_monic_polynomial for f and Concrete.colimit_exists_rep for a0; pass to a common neighbourhood by sup_exists. Polynomial.Monic.map preserves the monic representative, and cocone naturality preserves its exact coefficient map and the approximate root's image.

2. By Polynomial.eval_map_apply, the stage image of p(b) is f(a0). Apply mem_extended_iff_exists_stage and transport p and b along the resulting arrow to obtain the actual membership p(b) in IB.

3. Use Polynomial.derivative_map together with eval_map_apply to identify the transported derivative's stage image with f′(a0). Apply exists_stage_quotient_unit and transport p and b once more.

4. Polynomial.Monic.map and ordinary ideal-map containment preserve all previously attained conditions under the last refinement. Recheck the two exact image equalities by cocone naturality. Thus the standard-étale presentation uses finite-stage coefficients and its actual residue section, not a new postulated descent field.

Acceptance:

- For f=T²−1 over F5 and a0=1, the root condition holds and the derivative is 2, a quotient unit.

- For the same f and a0 over F2, the derivative is zero in the nonzero residue field, so this lemma's invertibility hypothesis fails.

- Finite ideal-sum witnesses suffice even when the original ideal has infinitely many generators.

Uses:

- SchemeAndStackFoundations:SF.0/simple-root-realization: Replace the former unnamed finite coefficient/equation descent step; étale section splitting remains a separate recorded gap.

Prerequisites: `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/monic-polynomial-stage`, `SchemeAndStackFoundations:SF.0/extended-ideal-stage`, `SchemeAndStackFoundations:SF.0/quotient-unit-stage`, `mathlib:CategoryTheory.Limits.Concrete.colimit_exists_rep`, `mathlib:CategoryTheory.IsFiltered.sup_exists`, `mathlib:Polynomial.Monic.map`, `mathlib:Polynomial.eval_map_apply`, `mathlib:Polynomial.derivative_map`.

Source: STACKS-0EM7, Lemma 15.12.1, proof: the neighbourhood colimit and its reduction; finite-data adaptation to the pinned simple-root predicate. Motivates this diagram-specific proof adapter. The finitary span, inverse-witness and coefficient arguments below are derived from the explicitly cited pinned library statements, not asserted to be separately numbered source theorems.

### The canonical reduction is unchanged

`SchemeAndStackFoundations:SF.0/residue-comparison` · lemma · `TauCeti.Henselization.quotient_bijective`

The canonical quotientMap R/I→H/IH is bijective for the actual colimit H. No Noetherian, local, complete or nonzero hypothesis is imposed.

Hypotheses:

- All rings are commutative with identity, including the zero ring; I is an arbitrary ideal unless a stronger hypothesis is explicitly stated. Ring carriers and target rings may be placed in a common universe.

Proof/construction outline:

1. Surjectivity: represent h in H at a neighbourhood B using Concrete.colimit_exists_rep. Because B is a neighbourhood, its canonical reducedMap R/I→B/IB is surjective, so choose r in R with b−η_B(r) in IB. The stage map sends that difference into IH, proving the class of h is the canonical image of r.

2. Injectivity: if the class of η_H(r) vanishes, choose any nonempty stage B and consider b=η_B(r). Apply mem_extended_iff_exists_stage to b. At the resulting C, R-algebra compatibility identifies its transition image with η_C(r), which lies in IC.

3. Since C is a neighbourhood, its canonical R/I→C/IC is injective; hence r belongs to I. This identifies the kernel of the actual reducedMap and proves its injectivity.

4. Both arguments use the chosen cocone and actual algebra maps. They replace the earlier undecomposed quotient-colimit/scalar-extension argument, not the quotient carrier. At I=R all involved quotients are zero, and the same argument applies.

Acceptance:

- I=top gives an isomorphism of zero rings, not a contradiction.

- The finite-field example preserves its specified residue field.

Prerequisites: `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/extended-ideal-stage`, `mathlib:CategoryTheory.Limits.Concrete.colimit_exists_rep`, `mathlib:Ideal.quotientMap`, `mathlib:Ideal.map_le_iff_le_comap`, `mathlib:Ideal.Quotient.mk_surjective`, `mathlib:Ideal.Quotient.eq_zero_iff_mem`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. The canonical reduction is unchanged

### The extended ideal is Jacobson

`SchemeAndStackFoundations:SF.0/jacobson-containment` · lemma · `TauCeti.Henselization.extended_le_jacobson`

IH is contained in the Jacobson radical of H for every (R,I), even if I is not contained in the Jacobson radical of R.

Hypotheses:

- All rings are commutative with identity, including the zero ring; I is an arbitrary ideal unless a stronger hypothesis is explicitly stated. Ring carriers and target rings may be placed in a common universe.

Proof/construction outline:

1. Represent the element of IH and its multiplier using Concrete.colimit_exists_rep, take a common target by IsFiltered.sup_exists, and use mem_extended_iff_exists_stage to refine until the descended ideal element actually lies in IB. Cocone naturality transports the multiplier along the same arrow.

2. For such b∈IB and c∈B, x=1+bc is 1 modulo IB. Localizing B away from x is etale over R and its canonical reduction is R/I, so it is another neighbourhood.

3. Its stage map to H makes 1+bc a unit. Apply the already existing Ideal.mem_jacobson_bot element criterion in H.

4. All finite ideal-sum and equality detection is supplied by the explicit extended-ideal-stage node and the cited generic baseline facts; no stage map is assumed injective. The localisation/étale and canonical residue adapters remain subject to the separately recorded gaps.

Acceptance:

- For (Z,(5)), 1+5y becomes a unit in H for every y.

- For I=top this forces H to be the zero ring, in agreement with residue preservation.

Prerequisites: `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/etale-neighbourhood`, `mathlib:Ideal.mem_jacobson_bot`, `mathlib:Algebra.Etale.of_isLocalizationAway`, `SchemeAndStackFoundations:SF.0/extended-ideal-stage`, `mathlib:CategoryTheory.Limits.Concrete.colimit_exists_rep`, `mathlib:CategoryTheory.IsFiltered.sup_exists`.

Source: STACKS-0EM7, Lemma 15.12.1 construction, adapted to the unit criterion. This elementary localization argument proves the Jacobson condition required by the pinned simple-root predicate.

### A simple root is realized in a neighbourhood

`SchemeAndStackFoundations:SF.0/simple-root-realization` · lemma · `TauCeti.Henselization.simple_root_lift`

For monic f in H[T] and a0∈H with f(a0)∈IH and derivative at a0 a unit modulo IH, there exists a root a of f in H with a−a0∈IH.

Hypotheses:

- All rings are commutative with identity, including the zero ring; I is an arbitrary ideal unless a stronger hypothesis is explicitly stated. Ring carriers and target rings may be placed in a common universe.

Proof/construction outline:

1. Use StandardEtalePair with g=f prime. Its defining equation has p1=1,p2=0,n=1, and its already-built ring is H[T,Y]/(f,Yf prime−1). The reduction map sends T to a0 modulo IH.

2. Use exists_stage_simple_root to obtain one neighbourhood B, a monic p, and b, with their exact images f,a0 and with p(b) in IB and p′(b) a unit modulo IB. Construct the explicit standard-étale presentation over B using these actual finite-stage data; no undecomposed general étale-algebra descent theorem is assumed.

3. The actual residue section of the etale algebra over B/IB supplies etale_section_product, with the first-projection equation. Lift its selector to any g in the unquotiented algebra; g is not presumed idempotent. The still-missing quotient/localization comparison must show localizing at g has canonical reduction B/IB, thereby making it another neighbourhood.

4. Map that neighbourhood to H. The image of T is the required root; the chosen residue section gives its exact congruence.

5. Finite-data descent and actual section splitting now have named typed adapters, and the four new section adapters have native proofs. Transport of etaleness under quotient base change, localization at a lifted residue selector, and canonical residue/tower coherence remain open, so root-realization/source-proof closure is not asserted.

Acceptance:

- Over an already complete local ring, the result agrees with its existing HenselianRing root-lifting instance.

- A multiple root modulo I supplies no unit derivative and is not covered.

Prerequisites: `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/residue-comparison`, `mathlib:StandardEtalePair`, `mathlib:StandardEtalePair.Ring`, `mathlib:StandardEtalePair.homEquiv`, `mathlib:Algebra.Etale.of_isLocalizationAway`, `SchemeAndStackFoundations:SF.0/simple-root-stage`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. A simple root is realized in a neighbourhood

### The colimit pair is henselian

`SchemeAndStackFoundations:SF.0/henselian-pair` · theorem · `TauCeti.Henselization.henselian`

H and IH satisfy the existing Mathlib HenselianRing H IH: Jacobson containment and the specified monic simple-root lifting property.

Proof/construction outline:

1. Install the existing predicate using extended_le_jacobson and simple_root_lift as its two fields.

2. Do not identify source monic-factorization henselianity with this predicate by reflexivity. The etale-section lifting theorem below supplies the needed source comparison for universality.


Acceptance:

- Works for non-Noetherian rings and the zero ring.

- Ordinary residue preservation remains distinct from strict henselization.


Prerequisites: `SchemeAndStackFoundations:SF.0/jacobson-containment`, `SchemeAndStackFoundations:SF.0/simple-root-realization`, `mathlib:HenselianRing`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. The colimit pair is henselian

### An étale section selects an idempotent component

`SchemeAndStackFoundations:SF.0/etale-section-selector` · lemma · `TauCeti.Henselization.etale_section_selector`

For an etale R-algebra B and actual R-algebra section sigma:B→R, there exists e in B with e²=e, sigma(e)=1 and e*b=e*algebraMap(R,B)(sigma(b)) for every b. This fixes the actual section rather than merely asserting an abstract product.

Proof outline:

1. Equip R with the B-algebra structure sigma.toAlgebra and prove the R/B/R scalar tower from sigma.comp_algebraMap. The section is surjective since sigma(algebraMap r)=r.

2. Use FormallyEtale.of_restrictScalars and iff_of_surjective to make ker(sigma) an idempotent ideal. FinitePresentation.ker_fG_of_surjective supplies finite generation; choose its idempotent generator k using Ideal.isIdempotentElem_iff_of_fg.

3. Set e=1-k. Then sigma(k)=0 gives sigma(e)=1 and k²=k gives e²=e. For each b, b-algebraMap(sigma(b)) belongs to ker(sigma), so it is c*k. Multiplication by 1-k kills it and proves the exact selection equation.

4. The current native proof uses only built pinned declarations; the generic unramified diagonal product is already built and is not a new planned construction.

Acceptance:

- For the first projection F5×F5→F5, e=(1,0) satisfies the equation, whereas (0,1) has section image zero and is rejected.

- For the zero base ring, 0=1 and the proof remains valid without a nontriviality assumption.

Prerequisites: `mathlib:Algebra.FormallyEtale.of_restrictScalars`, `mathlib:Algebra.FormallyEtale.iff_of_surjective`, `mathlib:Algebra.FinitePresentation.ker_fG_of_surjective`, `mathlib:Ideal.isIdempotentElem_iff_of_fg`, `mathlib:Ideal.mem_span_singleton'`.

Source: STACKS-00U8, Lemma 10.143.9; derived section-compatible adapter using STACKS-00U7, Lemma 10.143.8 and the pinned declarations.

### The section kernel is the complementary ideal

`SchemeAndStackFoundations:SF.0/etale-selector-kernel` · lemma · `TauCeti.Henselization.etale_selector_kernel`

For any R-algebra map sigma:B→R and e with sigma(e)=1 and e*b=e*algebraMap(sigma(b)) for all b, ker(sigma)=Ideal.span{1-e}. This adapter needs neither etaleness nor a separate idempotence assumption.

Proof outline:

1. If sigma(b)=0, the selection equation yields e*b=0, so b=b*(1-e) belongs to the complementary principal ideal.

2. Conversely sigma(1-e)=0, hence its generated ideal lies in the kernel. Use Ideal.span_le and antisymmetry.

Acceptance:

- The first projection F5×F5→F5 has kernel generated by (0,1); a typed example proves this using the explicit selector.

Prerequisites: `SchemeAndStackFoundations:SF.0/etale-section-selector`, `mathlib:Ideal.mem_span_singleton'`.

Source: STACKS-00U8, Lemma 10.143.9; derived section-compatible adapter using STACKS-00U7, Lemma 10.143.8 and the pinned declarations.

### The product comparison carries the actual section

`SchemeAndStackFoundations:SF.0/etale-section-product` · lemma · `TauCeti.Henselization.etale_section_product`

For an etale R-algebra B and sigma:B→ₐ[R]R, there exists e with e²=e and sigma(e)=1 and an R-algebra equivalence E:B≃R×(B/Ideal.span{e}) such that (E(b)).1=sigma(b) for every b.

Proof outline:

1. Take the section selector e and its exact complementary kernel equality.

2. Use the built complementary-idempotent quotient product equivalence with 1-e and e. Identify B/(1-e) with B/ker(sigma), then with R by the built surjective kernel-quotient equivalence.

3. Compose with the product of that equivalence and the identity. The canonical quotient formulas reduce the first projection on each b to sigma(b); the native proof verifies this by definitional reduction.

Acceptance:

- The typed acceptance signature requires the actual first-projection equation, so an arbitrary abstract product equivalence is insufficient.

Prerequisites: `SchemeAndStackFoundations:SF.0/etale-section-selector`, `SchemeAndStackFoundations:SF.0/etale-selector-kernel`, `mathlib:AlgEquiv.prodQuotientOfIsIdempotentElem`, `mathlib:Ideal.quotientKerAlgEquivOfSurjective`.

Source: STACKS-00U8, Lemma 10.143.9; derived section-compatible adapter using STACKS-00U7, Lemma 10.143.8 and the pinned declarations.

### Localizing the selected component recovers the section target

`SchemeAndStackFoundations:SF.0/etale-section-localization` · lemma · `TauCeti.Henselization.etale_section_localization`

For an etale R-algebra B and sigma:B→ₐ[R]R, there exists e with e²=e and sigma(e)=1 and an R-algebra equivalence E:Localization.Away(e)≃R satisfying E(algebraMap(B,B_e)(b))=sigma(b) for every b.

Proof outline:

1. Give R the B-algebra structure of sigma and its actual R/B/R scalar tower.

2. Apply the existing IsLocalization.away_of_isIdempotentElem to the selector, its exact kernel and section surjectivity.

3. Compare with the existing Localization.Away using IsLocalization.algEquiv, restrict scalars back to R and use its source-commutation equation. This localizes an actual idempotent in B, not an arbitrary lift of a residue idempotent.

Acceptance:

- The typed acceptance signature fixes the image of every source element under the localization equivalence.

- A lift g of an idempotent only modulo IB need not be idempotent in B; applying this statement directly to g would be invalid and remains a separate adapter gap.

Prerequisites: `SchemeAndStackFoundations:SF.0/etale-section-selector`, `SchemeAndStackFoundations:SF.0/etale-selector-kernel`, `mathlib:IsLocalization.away_of_isIdempotentElem`, `mathlib:IsLocalization.algEquiv`.

Source: STACKS-00U8, Lemma 10.143.9; derived section-compatible adapter using STACKS-00U7, Lemma 10.143.8 and the pinned declarations.

### Étale lifts with the same reduction are unique

`SchemeAndStackFoundations:SF.0/etale-lift-uniqueness` · lemma · `TauCeti.Henselization.etale_lift_unique`

If I⊆Jac(R), B is etale over R and two R-algebra maps B→R have equal reductions modulo I, they are equal. Existence is not asserted by this lemma.

Proof outline:

1. Apply etale_section_selector to f, obtaining e with f(e)=1 and e*b=e*algebraMap(f(b)).

2. Equal quotient reductions give g(e)-1 in I. Jacobson containment makes g(e) a unit by the built isUnit_of_sub_one_mem_jacobson_bot.

3. Applying g to e²=e and cancelling this unit gives g(e)=1. Applying g to the selector multiplication identity now gives g(b)=f(b) for every b; conclude by AlgHom extensionality.

4. The full native proof is supplied and its axiom dependencies are checked without admitted axioms. It asserts uniqueness only, and does not infer root uniqueness or henselian existence. Implementation status remains unchecked pending independent review.

Acceptance:

- For B=R×R, the two projections have distinct reductions when R/I is nonzero.

- Without Jacobson containment take R=F2×F2, I=0×F2 and B=R×R. The maps f(x,y)=x and g(x,y)=(x first,y second) are distinct R-algebra maps and have equal reductions modulo I.

Prerequisites: `SchemeAndStackFoundations:SF.0/etale-section-selector`, `mathlib:Ideal.isUnit_of_sub_one_mem_jacobson_bot`, `mathlib:Ideal.Quotient.eq_zero_iff_mem`.

Source: STACKS-0EM7, Lemma 15.12.1 uniqueness paragraph; the supplied selector/unit-cancellation proof is a derived alternative using STACKS-00U8 and the pinned Jacobson-unit theorem.

### Simple-root henselianity lifts étale sections

`SchemeAndStackFoundations:SF.0/etale-section-comparison` · theorem · `TauCeti.Henselization.exists_etale_lift`

For existing HenselianRing R I and any etale R-algebra B, every ring map sigma:B→R/I extending the quotient map of R lifts to an R-algebra map B→R with that exact reduction. Combined with the preceding lemma, the lift is unique.

Proof/construction outline:

1. First obtain the source Gabber polynomial criterion from the pinned simple-root class: a monic polynomial reducing to T^n(T−1) has simple root 1 modulo I, so its lift belongs to 1+I.

2. Follow the read proof of Stacks 15.11.6, implication (5)⇒(2). The residue section splits B/IB as R/I×C.

3. Use the source integral-closure localization lemma 15.11.5 to replace the selected component by an integral algebra. Enlarge a finite R-subalgebra to include a lift b of the residue idempotent and generators of the selected localization.

4. Source 15.10.4 gives an annihilating polynomial for b reducing to T^n(T−1). Its lifted root in 1+I splits off the selected component; the integral etale residue-preserving component is R by source 15.10.3.

5. The precise Zariski Main/integral-closure localization and annihilating-polynomial leaves must be source-read at their own locators and decomposed against the baseline. They are open gaps, so this is not a closed proof or a silently postulated factorization equivalence.


Acceptance:

- Applied to B=R[1/x] with x a unit modulo I, the lift sends x inverse to its genuine inverse, since I⊆Jac(R).

- The section sigma is part of the input; arbitrary etale algebras need not admit a section.


Prerequisites: `SchemeAndStackFoundations:SF.0/etale-lift-uniqueness`, `mathlib:HenselianRing`, `mathlib:Algebra.Etale`.

Source: STACKS-09XD, Lemma 15.11.6, implication (5)⇒(2), with 15.11.5. Simple-root lifting gives Gabber roots; the displayed finite integral-closure argument gives etale section lifting.

### The initial henselian pair

`SchemeAndStackFoundations:SF.0/initial-henselian-pair` · theorem · `TauCeti.Henselization.existsUnique_lift`

Let S be commutative and (S,J) an existing HenselianRing. Every ring map f:R→S with I⊆f inverse J extends uniquely to a ring map g:H→S satisfying g∘η=f. Its map IH into J follows from generation by η(I). Targets are expressed in a common universe; no faithful-flatness hypothesis is imposed.

Proof/construction outline:

1. Base change each etale neighbourhood B along f to S tensor_R B. Its quotient by J is canonically S/J, using the pair-map condition and canonical B/IB=R/I.

2. Use exists_etale_lift with the inverse reduction section to obtain a map S tensor_R B→S, and restrict it to B.

3. Use etale_lift_unique to prove compatibility with every neighbourhood arrow, including parallel maps. These maps form a genuine cocone in CommAlgCat R, with the R-algebra structure on S determined by f.

4. Use the actual colimit universal property to construct g and its uniqueness. Quotient-map naturality implies the reduction of any candidate agrees with the chosen section at every stage.

5. The conclusion is conditional on the explicitly open section-comparison proof leaves; no axiom or arbitrary initial object record is substituted for the colimit.


Acceptance:

- For f=id on an already henselian pair, the unique extension is the inverse of η.

- For I=top a pair map to (S,J) forces J=top; a henselian target then is zero, matching the zero henselization.


Prerequisites: `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/henselian-pair`, `SchemeAndStackFoundations:SF.0/residue-comparison`, `SchemeAndStackFoundations:SF.0/etale-section-comparison`, `SchemeAndStackFoundations:SF.0/etale-lift-uniqueness`, `mathlib:Algebra.Etale.baseChange`, `mathlib:CategoryTheory.Limits.HasColimit`, `mathlib:Algebra.TensorProduct.quotIdealMapEquivTensorQuot`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. The initial henselian pair

### Already henselian pairs are fixed

`SchemeAndStackFoundations:SF.0/fixed-henselian-pair` · lemma · `TauCeti.Henselization.fixed_of_henselian`

If (R,I) satisfies the existing HenselianRing predicate, the colimit H is canonically R as an R-algebra, with the equivalence inverse to η.

Proof/construction outline:

1. Apply existsUnique_lift to f=id_R to obtain an R-algebra retraction H→R.

2. Apply uniqueness to the two endomorphisms of H extending η: identity and η followed by the retraction. The henselian theorem supplies the target instance.

3. Construct the actual R-algebra equivalence from the mutually inverse maps. This is not a completeness assertion.


Acceptance:

- Every ring at the zero ideal is fixed.

- Any already henselian but noncomplete ring is fixed; being an adic completion is not the definition. The concrete noncomplete example still needs a primary-source and cardinality comparison, listed in the gaps.


Prerequisites: `SchemeAndStackFoundations:SF.0/initial-henselian-pair`, `SchemeAndStackFoundations:SF.0/henselian-pair`, `mathlib:HenselianRing`.

Source: STACKS-0EM7, Lemma 15.12.1, initial property. Idempotence follows from the initial property and the proved henselian target.

### Ordinary local henselization is local

`SchemeAndStackFoundations:SF.0/ordinary-local-henselization` · lemma · `TauCeti.Henselization.local_henselization`

If R is local with maximal ideal m, H(R,m) is local. The canonical quotient H/mH=R/m is a field and mH⊆Jac(H), so mH is its unique maximal ideal. No separable closure of the residue field is chosen.

Proof/construction outline:

1. Use the canonical quotient comparison to show mH is a maximal ideal.

2. Use extended_le_jacobson to show it is contained in every maximal ideal; maximality forces every maximal ideal to equal mH.

3. Instantiate the existing IsLocalRing carrier predicate. The typed residue-field equivalence and HenselianLocalRing adapter remain future API work.


Acceptance:

- For a field K, m=0 and ordinary H=K.

- Strict henselization, which enlarges the residue field to a separable closure, remains with ModularCurves 4D and is not re-planned here.


Prerequisites: `SchemeAndStackFoundations:SF.0/residue-comparison`, `SchemeAndStackFoundations:SF.0/jacobson-containment`, `SchemeAndStackFoundations:SF.0/fixed-henselian-pair`.

Source: STACKS-0EM7, Lemma 15.12.3, whole proof. The ordinary local case follows from the maximal residue quotient and Jacobson containment.

## Finite nonthin neighbourhood witness

Take R=Z/6 and I=(3). Let B=F3×F2×F2 with R→B given by the three residue maps. Its I-image is 0×F2×F2, so B/IB=F3 canonically. The R-algebra is etale: R=F3×F2 and B adds a second disjoint copy of the F2 component. Identity and the swap of the two F2 factors are distinct R-algebra maps, both inducing the identity on B/IB. Projection h:B→F3 equalizes them, and F3 is another neighbourhood. This directly tests the parallel-map axiom. Finite ring/ideal/map checks can verify the arithmetic; they do not prove etaleness or the general source theorem.

## Functoriality of henselization

Write H(R,I) for the actual colimit and η_R for its algebra map. The following construction uses the initial-pair theorem. Its proof gaps therefore remain prerequisite gaps for these consequences. Ideal inclusions always point from the source ideal into the inverse image of the target ideal.

### Map induced by a morphism of pairs

`SchemeAndStackFoundations:SF.0/henselization-map` · construction · `TauCeti.Henselization.map`

For f:(R,I)→(S,J), define H(f):H(R,I)→H(S,J) to be the unique ring map extending η_S∘f. Use the existing initial-pair theorem and the proved henselian target (H(S,J),JH(S,J)); the chosen witness is a ring homomorphism on the actual colimit algebras. No second henselization carrier or category of pairs is defined.

Hypotheses: R, S and T are commutative unital rings in a common universe, with arbitrary ideals I, J and K; zero rings are allowed. A map of pairs f satisfies I ⊆ f⁻¹(J). No flatness, locality, completeness or Noetherian assumption is added.

Proof/construction outline:

1. The pair condition and generation of JH(S,J) show η_S∘f carries I into JH(S,J).

2. Apply initial-henselian-pair to this map, using henselian-pair for the target. Choose its unique witness.

3. The unit and extended-ideal statements are separate lemma nodes; identity and composition follow by comparing extensions of the same base map. Proof irrelevance makes the chosen map independent of the proof of the pair condition.

Acceptance:

- On zero-ideal pairs the maps agree with the original ring homomorphisms under the canonical fixed-pair identifications.

- A pair map may change the ideal and kill nonzero elements; it need not be injective.

Prerequisites: `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/initial-henselian-pair`, `SchemeAndStackFoundations:SF.0/henselian-pair`, `mathlib:Ideal.le_comap_map`.

Source: [Stacks 15.12.1](https://stacks.math.columbia.edu/tag/0EM7), complete final factorization/uniqueness argument; the functor laws and residue square are the algebraic consequences shown above.

Use-derived API:

- `TauCeti.Henselization.map_comp_unit` (functoriality): For every pair map f, H(f)∘η_R = η_S∘f as actual ring homomorphisms.

- `TauCeti.Henselization.map_extended_le` (compatibility): For every f:(R,I)→(S,J), IH(R,I) ⊆ H(f)⁻¹(JH(S,J)). Inclusion, rather than equality of image ideals, is the general assertion.

- `TauCeti.Henselization.map_id` (simp): For any (R,I), H(id_R)=id_H(R,I) as ring homomorphisms, independently of the chosen proof of the pair-map condition.

- `TauCeti.Henselization.map_comp` (functoriality): For pair maps f:(R,I)→(S,J) and g:(S,J)→(T,K), H(g∘f)=H(g)∘H(f). The composite pair condition is f(I)⊆J and g(J)⊆K, with no reverse containment assumed.

- `TauCeti.Henselization.quotient_naturality` (compatibility): For f:(R,I)→(S,J), let q_f:R/I→S/J and q_H:H(R,I)/IH(R,I)→H(S,J)/JH(S,J) be the existing Ideal.quotientMap maps, the latter using map_extended_le. Then q_H∘reducedMap_I = reducedMap_J∘q_f. These are the canonical reduction maps already proved bijective by residue-comparison; naturality does not use an arbitrarily chosen residue-ring isomorphism.

Discriminating typed tests:

- `TauCeti.Henselization.map_field_identity` (degenerate): For (F5,0), the map induced by the identity pair morphism is the identity of its henselization.

- `TauCeti.Henselization.map_scalar_seven` (computation): For f:Z→F5 and zero ideals, H(f)(η_Z(7))=η_F5(2).

- `TauCeti.Henselization.map_quotient_nine` (compatibility): For R=Z/9, I=(3), the quotient map (R,I)→(R/I,0) induces a map carrying η_R(3) to zero.

- `TauCeti.Henselization.map_can_collapse` (non-example): The map induced by id:F5→F5 from (F5,0) to (F5,F5) is not injective: its target henselization is zero and its source is canonically F5.

Uses:

- Stacks 15.12.1; KEYDEF-algebraicgeometry/henselization: The initial construction is a functor on actual maps of pairs; its unit, laws and canonical reductions must be coherent.

- Stacks 15.12.7 and 15.12.8: Their natural integral-base-change and product maps are induced by pair maps. Those comparison theorems remain source leads and are not established by these functor laws.

- PerfectoidSpaces:P3/henselisation-of-pairs and ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization: Existing general-pair and f-adic consumers require one carrier. The separate consolidation proposal records the overlap; topology, continuity and completion remain those consumers’ work.

### The henselization unit is natural

`SchemeAndStackFoundations:SF.0/henselization-map-unit` · lemma · `TauCeti.Henselization.map_comp_unit`

For every pair map f, H(f)∘η_R = η_S∘f as actual ring homomorphisms.

Hypotheses: R, S and T are commutative unital rings in a common universe, with arbitrary ideals I, J and K; zero rings are allowed. A map of pairs f satisfies I ⊆ f⁻¹(J). No flatness, locality, completeness or Noetherian assumption is added.

Proof/construction outline:

1. Use the chosen witness property from initial-henselian-pair. This is exactly the property used to define H(f), so no further source theorem is invoked.

Acceptance:

- For Z→F5, the image of η_Z(7) is η_F5(2).

Prerequisites: `SchemeAndStackFoundations:SF.0/henselization-map`, `SchemeAndStackFoundations:SF.0/initial-henselian-pair`.

Source: [Stacks 15.12.1](https://stacks.math.columbia.edu/tag/0EM7), complete final factorization/uniqueness argument; the functor laws and residue square are the algebraic consequences shown above.

### Induced maps preserve the extended ideals

`SchemeAndStackFoundations:SF.0/henselization-map-ideal` · lemma · `TauCeti.Henselization.map_extended_le`

For every f:(R,I)→(S,J), IH(R,I) ⊆ H(f)⁻¹(JH(S,J)). Inclusion, rather than equality of image ideals, is the general assertion.

Hypotheses: R, S and T are commutative unital rings in a common universe, with arbitrary ideals I, J and K; zero rings are allowed. A map of pairs f satisfies I ⊆ f⁻¹(J). No flatness, locality, completeness or Noetherian assumption is added.

Proof/construction outline:

1. Use Ideal.map_le_iff_le_comap to reduce preservation of the ideal generated by η_R(I) to its generators.

2. Apply map_comp_unit on a generator and use f(I)⊆J and generation of JH(S,J). Equivalently use Ideal.map_map to move the two maps through ideal extension.

Acceptance:

- The identity ring map (F5,0)→(F5,F5) is a pair map although its target henselization is zero.

Prerequisites: `SchemeAndStackFoundations:SF.0/henselization-map`, `SchemeAndStackFoundations:SF.0/henselization-map-unit`, `mathlib:Ideal.map_le_iff_le_comap`, `mathlib:Ideal.map_map`, `mathlib:Ideal.le_comap_map`.

Source: [Stacks 15.12.1](https://stacks.math.columbia.edu/tag/0EM7), complete final factorization/uniqueness argument; the functor laws and residue square are the algebraic consequences shown above.

### Henselization sends identity maps to identities

`SchemeAndStackFoundations:SF.0/henselization-map-identity` · lemma · `TauCeti.Henselization.map_id`

For any (R,I), H(id_R)=id_H(R,I) as ring homomorphisms, independently of the chosen proof of the pair-map condition.

Hypotheses: R, S and T are commutative unital rings in a common universe, with arbitrary ideals I, J and K; zero rings are allowed. A map of pairs f satisfies I ⊆ f⁻¹(J). No flatness, locality, completeness or Noetherian assumption is added.

Proof/construction outline:

1. Both ring maps extend η_R by map_comp_unit and identity composition.

2. Apply the uniqueness clause of initial-henselian-pair with target (H(R,I),IH(R,I)).

Acceptance:

- This holds also at I=top and the zero-ring colimit.

Prerequisites: `SchemeAndStackFoundations:SF.0/henselization-map`, `SchemeAndStackFoundations:SF.0/henselization-map-unit`, `SchemeAndStackFoundations:SF.0/initial-henselian-pair`, `SchemeAndStackFoundations:SF.0/henselian-pair`.

Source: [Stacks 15.12.1](https://stacks.math.columbia.edu/tag/0EM7), complete final factorization/uniqueness argument; the functor laws and residue square are the algebraic consequences shown above.

### Henselization respects composition

`SchemeAndStackFoundations:SF.0/henselization-map-composition` · lemma · `TauCeti.Henselization.map_comp`

For pair maps f:(R,I)→(S,J) and g:(S,J)→(T,K), H(g∘f)=H(g)∘H(f). The composite pair condition is f(I)⊆J and g(J)⊆K, with no reverse containment assumed.

Hypotheses: R, S and T are commutative unital rings in a common universe, with arbitrary ideals I, J and K; zero rings are allowed. A map of pairs f satisfies I ⊆ f⁻¹(J). No flatness, locality, completeness or Noetherian assumption is added.

Proof/construction outline:

1. Compose the two map_comp_unit identities; both sides extend η_T∘g∘f.

2. Apply the uniqueness clause of initial-henselian-pair with target (H(T,K),KH(T,K)). Ring-hom composition associativity is routine.

Acceptance:

- For Z→Z/9→F3 at zero ideals, both composites send η_Z(5) to η_F3(2).

- A projection of finite product rings retains its order in a subsequent component swap.

Prerequisites: `SchemeAndStackFoundations:SF.0/henselization-map`, `SchemeAndStackFoundations:SF.0/henselization-map-unit`, `SchemeAndStackFoundations:SF.0/initial-henselian-pair`, `SchemeAndStackFoundations:SF.0/henselian-pair`.

Source: [Stacks 15.12.1](https://stacks.math.columbia.edu/tag/0EM7), complete final factorization/uniqueness argument; the functor laws and residue square are the algebraic consequences shown above.

### Canonical residue comparisons are natural

`SchemeAndStackFoundations:SF.0/henselization-residue-naturality` · lemma · `TauCeti.Henselization.quotient_naturality`

For f:(R,I)→(S,J), let q_f:R/I→S/J and q_H:H(R,I)/IH(R,I)→H(S,J)/JH(S,J) be the existing Ideal.quotientMap maps, the latter using map_extended_le. Then q_H∘reducedMap_I = reducedMap_J∘q_f. These are the canonical reduction maps already proved bijective by residue-comparison; naturality does not use an arbitrarily chosen residue-ring isomorphism.

Hypotheses: R, S and T are commutative unital rings in a common universe, with arbitrary ideals I, J and K; zero rings are allowed. A map of pairs f satisfies I ⊆ f⁻¹(J). No flatness, locality, completeness or Noetherian assumption is added.

Proof/construction outline:

1. Construct q_H using henselization-map-ideal and the existing quotientMap.

2. Every class in R/I has a representative r. Evaluate both sides on that representative with quotientMap_mk.

3. The two evaluations coincide by map_comp_unit. Thus the ring homomorphisms agree; no quotient, reduction equivalence or new carrier is reconstructed.

Acceptance:

- For (Z/9,(3))→(F3,0), the residue map is the specified reduction, not a field automorphism.

- Naturality is meaningful for different ideals and for zero quotients.

Prerequisites: `SchemeAndStackFoundations:SF.0/henselization-map`, `SchemeAndStackFoundations:SF.0/henselization-map-unit`, `SchemeAndStackFoundations:SF.0/henselization-map-ideal`, `SchemeAndStackFoundations:SF.0/residue-comparison`, `mathlib:Ideal.quotientMap`, `mathlib:Ideal.quotientMap_mk`.

Source: [Stacks 15.12.1](https://stacks.math.columbia.edu/tag/0EM7), complete final factorization/uniqueness argument; the functor laws and residue square are the algebraic consequences shown above.

## General-pair ownership consolidation

PerfectoidSpaces:P3/henselisation-of-pairs in PerfectoidSpaces--P0.json already plans the same general colimit and universal property, with a broad flatness/power-quotient/completion API. Its current review is needs_changes, but it is an existing plan and cannot be duplicated. This issue reserves the general key here. The rescope proposal assigns the general construction to this key, retains the PerfectoidSpaces ID as a compatibility/import node and requires its consumers to use the same carrier. No other packet is edited, no transfer is preclaimed accepted, and no coarse SF.0↔P3 stage edge is added. Native comparison to the other proposed carrier awaits a source-level signature there; do not substitute a Prop stub or rename these plans into two independent constructions.

Keep SchemeAndStackFoundations:key/henselization as the single general carrier and refinement owner required by the key survey; retain the fifteen current refinement IDs. Preserve PerfectoidSpaces:P3/henselisation-of-pairs as a compatibility/import node, using the reserved key and its declaration-sized outputs and keeping the flatness, ideal-power, Noetherian, completion and filtered-colimit requirements as imports or source-decomposed outputs owned once. ClassicalAdicEtaleCohomology retains the f-adic topology/continuity/plus-ring specialization using that carrier. Route dependencies at node granularity to avoid dragging adic/Perfectoid theory into SF.0; validate any needed substage split before applying stage links. This proposal is unaccepted and does not modify either supplier packet.

The complete 15.12.1–15.12.8 mathematical text and proofs were freshly read for this continuation. The downloaded 0EM7 HTML hash matches the earlier receipt. Original 09XD and TeX reads retain their original author’s scope; this continuation does not claim a fresh read of those pages or of the 62 routed primary papers. The complete JacobianChallenge and Multiquadratic roadmap documents and the current audit, RS-25, key, links and confirmed-finding inputs were read.

## Stage worklists and reserved keys

### SchemeAndStackFoundations:SF.0 — partial

- Complete the twenty-nine-node henselization strand. Four finite-data adapters remain admitted. Four actual-section adapters and etale-lift uniqueness now have native proofs; lifted residue-selector quotient/localization coherence and the source criterion/universal cocone remain unfinished. Functorial maps and residue naturality remain conditional on universal-property closure.

- Plan the reserved excellent-schemes key. Reuse existing schemes/morphisms, smooth/etale/proper/flat predicates, QCoh and local algebra. Source-decompose relative Spec, general Proj/canonical comparison without unrestricted O(1) or properness claims.

- Retain all SF.0 routed source obligations listed in sourceWorklist, including perfect geometry, coherent extension, standard coordinates and finite-presentation spreading. Weil restriction uses the confirmed MC0F → RG2.0a → R09.3 import, not a duplicate.

### SchemeAndStackFoundations:SF.1 — not_read

- Construct general algebraic spaces/stacks beyond the upstream abstract stack predicate and the exact MC0E/SR2 descent inputs; do not duplicate those owners.

- Plan reserved galois-gerbs with actual groupoid/Galois actions and crossed-module/torsor comparisons. Source-read quotient/root stacks, perfect-site groupoids and geometric descent routes in sourceWorklist.

### SchemeAndStackFoundations:SF.2 — not_read

- Plan reserved scheme-brauer, coherent-duality and equivariant-sheaf-cohomology, with their canonical comparison and scope-qualified APIs/tests.

- Split early site/coefficients from later comparisons: import EDC/CPC and EtaleDualityAbsolutePurityPartII. Preserve coherent-curve SR2 and general coherent-duality distinction; do not create a second six-operations or absolute-purity theory.

- Retain all site/localization/support/compact support/base-change/Cousin/pro-etale/Nisnevich routes with coefficient distinctions. Henselian points require the still-open affine strand and additional site geometry.

### SchemeAndStackFoundations:SF.3 — not_read

- Import upstream AlgebraicCurves/JacobianChallenge function-field divisors, genus and RR; prove scheme/Picard/line-bundle/coherent-duality comparisons. Do not infer arbitrary-vector-bundle duality from function-field RR.

- Keep NS/Picard-number theory with A2; retain rational-divisor versus rational-class/Brauer-obstruction and family/Jacobian routes.

### SchemeAndStackFoundations:SF.4 — not_read

- Formal geometry, deformation/lifting, algebraization, non-Noetherian modifications, strict transforms and source-qualified alterations remain unread at their primary locators.

- Import NeronModelsAndSemistableAbelianVarieties R11.1/R11.3 and StableReductionLayer7/8/9. Resolve the conflicting confirmed alteration-owner recommendations before adding any alteration dependency.

### SchemeAndStackFoundations:SF.5 — not_read

- Build on the existing AlgebraicCycle carrier; construct rational equivalence/Chow, pushforward, flat/lci pullback, refined Gysin, intersection/Chern/RR in their actual domains.

- Import arithmetic-surface intersections from StableReductionLayer4. Retain SF.3/R09.1/coherent-duality inputs, isolated-intersection Bezout inequalities, DM-stack and positivity/Keel routes without requiring unrelated reduction theorems.

### SchemeAndStackFoundations:SF.6 — not_read

- This is a consumer handoff/process layer according to AUDIT-01: do not invent mathematical nodes for integration itself.

- Record typed imports and coefficient/comparison contracts from the actual suppliers, including ComplexComparison C5, once the mathematical nodes exist. All arithmetic handoffs in sourceWorklist remain unfinished.


Reserved IDs:

- `SchemeAndStackFoundations:key/excellent-schemes`: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.

- `SchemeAndStackFoundations:key/scheme-brauer`: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.

- `SchemeAndStackFoundations:key/coherent-duality`: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.

- `SchemeAndStackFoundations:key/henselization`: planned_with_gaps. Twenty-nine-node focused strand; sample API comparisons and proof leaves remain open.

- `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.

- `SchemeAndStackFoundations:key/galois-gerbs`: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.


## Open proof and ownership gaps

1. Actual scalar towers in the parallel-map coequalizer. Build the source iterated tensor with both B-algebra structures f and g, the map from C tensor_R C and multiplication map, and prove all AlgHom/tower coherences and canonical residue identities. The native existence signature does not constitute that construction. Needed by: `SchemeAndStackFoundations:SF.0/parallel-equalization`.

2. Lifted residue-selector localization and canonical coherence. The unramified diagonal product, idempotent-kernel decomposition and localization criterion are built. Four actual section adapters now have native proofs, and etale_lift_unique is proved from them without admitted dependencies. Still transport the residue quotient etaleness through the actual quotient/tensor equivalence; lift its selector to an arbitrary g and prove the canonical quotient of B[1/g] is the selected residue target. The lift need not be idempotent in B. Supply all section, quotient, localization and scalar-tower equations; neither an abstract product equivalence nor the new idempotent-localization lemma alone closes this gap. Needed by: `SchemeAndStackFoundations:SF.0/simple-root-realization`, `SchemeAndStackFoundations:SF.0/etale-section-comparison`.

3. Simple-root versus source etale-section criterion. Directly read and decompose source 15.10.3, 15.10.4 and all Zariski Main inputs in 15.11.5 against the pinned libraries. The full 15.11.6 proof was read, but these recursively cited leaves have not all been independently read. The forward Gabber-root argument is explicit; no factorization comparison or source proof closure is asserted. Needed by: `SchemeAndStackFoundations:SF.0/etale-section-comparison`, `SchemeAndStackFoundations:SF.0/initial-henselian-pair`, `SchemeAndStackFoundations:SF.0/fixed-henselian-pair`.

4. Remaining henselization sample API and concrete comparisons. Pair-map functoriality/composition and canonical residue naturality now have explicit nodes. Complete ind-etale presentation independence/universe transport, ideal-power quotient comparisons, flatness with an existing generic filtered-flat adapter, local faithful flatness, Noetherianity, completion isomorphism (no Noetherian hypothesis for that isomorphism alone), radical invariance, filtered-pair-colimit preservation and integral base change/quotient compatibility. Read the exact baseline completion and integrality statements first. Include a source-verified noncomplete henselian example, a failed unrestricted base change, and the actual local residue/HenselianLocalRing adapters. General faithful flatness is false: I=top gives the zero ring. Needed by: `SchemeAndStackFoundations:key/henselization`.

5. Five reserved definitions are still unplanned. The exact reserved ids key/excellent-schemes, key/scheme-brauer, key/coherent-duality, key/equivariant-sheaf-cohomology and key/galois-gerbs are not nodes in this partial packet. Freshly read each complete key brief and all relevant primary locators, then supply actual carriers, APIs and discriminating examples. Do not certify this issue complete. Needed by: `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`.

6. Conflicting confirmed alteration ownership directions. RT-AREA-algebraicgeometry/16 recommends SF.4→L5, while RT-AREA-etale/21 recommends L5:alterations→SF.4. Both findings are confirmed in their inputs. This checkpoint imports neither direction; a coherent accepted ownership decision is needed before this strand can be planned. Other confirmed findings remain the explicit unimplemented matrix below. Needed by: `SchemeAndStackFoundations:SF.4`.

7. Seven-stage and all routed-source closure. Only one affine henselization strand is developed. All stage remaining lists, all sourceWorklist paper routes, the original roadmap references and every other reserved key must be retained. SF.6 is process/handoff work. No stage, paper or mathematical implementation is claimed closed. Needed by: `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5`, `SchemeAndStackFoundations:SF.6`.

8. Consolidate the general-pair henselization owner with the PerfectoidSpaces plan. PerfectoidSpaces:P3/henselisation-of-pairs in PerfectoidSpaces--P0.json already plans the same general colimit and universal property, with a broad flatness/power-quotient/completion API. Its current review is needs_changes, but it is an existing plan and cannot be duplicated. This issue reserves the general key here. The rescope proposal assigns the general construction to this key, retains the PerfectoidSpaces ID as a compatibility/import node and requires its consumers to use the same carrier. No other packet is edited, no transfer is preclaimed accepted, and no coarse SF.0↔P3 stage edge is added. Native comparison to the other proposed carrier awaits a source-level signature there; do not substitute a Prop stub or rename these plans into two independent constructions. Needed by: `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/henselization-map`.

## Confirmed red-team findings retained

Every listed finding remains unimplemented in this first checkpoint. These are imported verifier-confirmed inputs, not this worker’s independent review. No integrated link is changed.

| Finding | Stage | Required boundary |
|---|---|---|

| RT-AREA-algebraicgeometry/1 | SchemeAndStackFoundations:SF.1 | General spaces/stacks belong here; R09 receives the exported interface. |

| RT-AREA-algebraicgeometry/8 | SchemeAndStackFoundations:SF.3 | NS and Picard number remain with A2, not duplicate generic SF.3 theory. |

| RT-AREA-algebraicgeometry/11 | SchemeAndStackFoundations:SF.0 | Weil restriction follows MC0F → RG2.0a → R09.3; import that owner. |

| RT-AREA-algebraicgeometry/15 | SchemeAndStackFoundations:SF.5 | Use genuine SF.3/R09.1/coherent-duality prerequisites and remove spurious reduction paths through the eventual reviewed link changes. |

| RT-AREA-algebraicgeometry/16 | SchemeAndStackFoundations:SF.4 | Recommends SF.4 as single alteration supplier to L5; conflicts with etale/21. |

| RT-AREA-algebraicgeometry/17 | SchemeAndStackFoundations:SF.4 | Use pointed-curve moduli R09.4/R09.5 as alteration inputs, not an SR object theorem. |

| RT-AREA-algebraicgeometry/18 | SchemeAndStackFoundations:SF.2 | General coherent duality extends the curve-scoped SR2 contract. |

| RT-AREA-algebraicgeometry/31 | SchemeAndStackFoundations:SF.6 | Import ComplexComparison C5 for the arithmetic cohomology comparison. |

| RT-AREA-etale/2 | SchemeAndStackFoundations:SF.2 | Absolute purity belongs to EtaleDualityAbsolutePurityPartII; split early SF.2 site foundation from late comparison to prevent a cycle. |

| RT-AREA-etale/21 | SchemeAndStackFoundations:SF.4 | Recommends new L5:alterations as supplier to SF.4; conflicts with algebraicgeometry/16. |

| RT-AREA-ktheory-2/38 | SchemeAndStackFoundations:SF.2 | General Nisnevich site and henselian point foundation must be supplied here. |

| RT-AREA-geomlanglands/15 | SchemeAndStackFoundations:SF.5 | Single positivity/Keel supplier here; GS consumes the result. |


## Routed papers still requiring full reading

The exact issue routes below are preserved as a worklist. Each primary paper and its complete extraction require fresh reading; a shortened brief is not proof evidence. None is discharged by the affine construction.

- Kings–Sprang, "Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and p-adic interpolation", Annals of Mathematics 202 (2025), no. 1 (https://annals.math.princeton.edu/2025/202-1/p01), for SchemeAndStackFoundations:SF.2: SF.2 owns sheaf cohomology, localization and compact support. The paper uses the Γ-equivariant version of coherent cohomology (Grothendieck, Tôhoku, Chapter V) with its spectral sequences, cohomology with supports and its localization sequence, l … (shortened)

- Lawrence–Sawin, "The Shafarevich conjecture for hypersurfaces in abelian varieties", Annals of Mathematics 202 (2025), no. 3 (https://annals.math.princeton.edu/2025/202-3/p01), for SchemeAndStackFoundations:SF.0: SF.0 owns schemes and morphisms with their named properties and is the most foundational layer that could own the Weil restriction of scalars along a finite étale extension, with its universal property and the resulting bijection on integral points. Neither library has it and no layer … (shortened)

- Kisin–Zhou, "Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties", Annals of Mathematics 202 (2025), no. 3 (https://annals.math.princeton.edu/2025/202-3/p03), for SchemeAndStackFoundations:SF.0: SF.0 owns smooth and etale scheme morphisms and their local coordinate geometry. Add the precise standard-smooth coordinate and boundary/component lemmas needed by the local curve proof; the reusable curve selection remains in the existing finite-field curve continuation. (f … (shortened)

- Stefan Schröer, "There is no Enriques surface over the integers", Annals of Mathematics 197 (2023), no. 1 (https://annals.math.princeton.edu/2023/197-1/p01), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.2: A concrete henselian section-lifting consequence for smooth separated algebraic spaces using a residue-preserving étale scheme chart. Import smooth algebra Hensel lifting, not the p-adic polynomial lemma as a geometric substitute. SF.2 owns … (shortened)

- Hongjie Yu, "Comptage des systèmes locaux ℓ-adiques sur une courbe", Annals of Mathematics 197 (2023), no. 2 (https://annals.math.princeton.edu/2023/197-2/p01), for SchemeAndStackFoundations:SF.3: Import coherent Serre duality through SF.3 and its upstream JacobianChallenge Layer B supplier. The function-field Riemann–Roch theorem does not establish duality for arbitrary vector bundles on the scheme. No new Serre-duality programme is proposed. (from the extraction of Hongjie Yu, "Comptage des … (shortened)

- Wei Zhang, "Weil representation and Arithmetic Fundamental Lemma", Annals of Mathematics 193 (2021), no. 3 (https://annals.math.princeton.edu/2021/193-3/p05), for SchemeAndStackFoundations:SF.5: Use the shared Chow/intersection owner for actual proper pushforward, lci operations and rational equivalence; neither special-cycle proposal constructs a rival generic Chow theory. (from the extraction of Wei Zhang, "Weil representation and Arithmetic Fundamental Lemma", Annals of Mathematics 193 (202 … (shortened)

- Dimitrov–Gao–Habegger, "Uniformity in Mordell–Lang for curves", Annals of Mathematics 194 (2021), no. 1 (https://annals.math.princeton.edu/2021/194-1/p04), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.5: SF.0 owns general scheme theory and SF.5 intersection theory. The proofs need EGA IV 21.4.13 (line bundles trivial on the generic fibre), Cartier/Weil divisor facts on regular and normal schemes (Görtz–Wedhorn 11.38–11.49), étale quasi-sections (EGA IV 17.16.3), Siu's bigne … (shortened)

- Chao Li–Yifeng Liu, "Chow groups and L-derivatives of automorphic motives for unitary groups", Annals of Mathematics 194 (2021), no. 3 (https://annals.math.princeton.edu/2021/194-3/p06), for SchemeAndStackFoundations:SF.2: SF.2 owns étale cohomology with localization and proper and smooth base change. PAPER-CESNAVICIUS-19 routes its prime-to-residue-characteristic absolute-purity input there, and its accepted review names SF.2 the owner of local and global purity; SF.2's own text does not name … (shortened)

- Jean-Marc Couveignes, "Enumerating number fields", Annals of Mathematics 192 (2020), no. 2 (https://annals.math.princeton.edu/2020/192-2/p04), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.5: SF.0 owns the concrete localized-Jacobian presentation/component comparison, importing its already-built abstract etale APIs. SF.5 owns the isolated-intersection Bezout inequality (not an equality that assumes proper intersection). Both are generic algebraic geometry inputs; the arithme … (shortened)

- Zhiwei Yun–Wei Zhang, "Shtukas and the Taylor expansion of L-functions (II)", Annals of Mathematics 189 (2019), no. 2 (https://annals.math.princeton.edu/2019/189-2/p02), for SchemeAndStackFoundations:SF.3: The paper consumes the scheme/line-bundle, cohomology/base-change and Picard comparison contracts, not merely the existing function-field Riemann–Roch statement. SF.3 integrates the upstream AlgebraicCurves/JacobianChallenge owners. No upstream roadmap is replanned; the tame Hurwitz input is … (shortened)

- Zhiwei Yun–Wei Zhang, "Shtukas and the Taylor expansion of L-functions (II)", Annals of Mathematics 189 (2019), no. 2 (https://annals.math.princeton.edu/2019/189-2/p02), for SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.5: SF.1 owns quotient/root-stack geometry and infinitesimal fibres; use its existing Bresciani24 root-stack source lead rather than rebuilding roots inside geometric class field theory. SF.5 owns rational DM-stack Chow/refined-Gysin, support-filtered coherent K0 … (shortened)

- Gao–Habegger, "Heights in families of abelian varieties and the Geometric Bogomolov Conjecture", Annals of Mathematics 189 (2019), no. 2 (https://annals.math.princeton.edu/2019/189-2/p03), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.5: SF.0 owns general scheme theory and SF.5 intersection theory and degrees. The paper proves a long-intersection Bézout bound independent of the number of intersected varieties (Proposition 6.7, with Faltings' Lemma 6.8), and uses Bertini thro … (shortened)

- Xinwen Zhu, "Affine Grassmannians and the geometric Satake in mixed characteristic", Annals of Mathematics 185 (2017), no. 2 (https://annals.math.princeton.edu/2017/185-2/p02), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.4: General perfect spaces, pfp models, Frobenius approximation and perfect morphism properties belong to the common foundation, already used by BS17 and HE21. GS consumes them. (from the extraction of Xinwen Zhu, "Affine Grassmannians and the geometric Sat … (shortened)

- Xinwen Zhu, "Affine Grassmannians and the geometric Satake in mixed characteristic", Annals of Mathematics 185 (2017), no. 2 (https://annals.math.princeton.edu/2017/185-2/p02), for SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.2: Own perfect-site torsors, groupoids and the revised free-action quotient theorem once, including A.30–A.31 flatness. The fpqc site is not a new h/v site. (from the extraction of Xinwen Zhu, "Affine Grassmannians and the geometric Satake in mixed charact … (shortened)

- Zhiwei Yun–Wei Zhang, "Shtukas and the Taylor expansion of L-functions", Annals of Mathematics 186 (2017), no. 3 (https://annals.math.princeton.edu/2017/186-3/p02), for SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.5: SF.5 constructs Chow groups, proper pushforward, flat/lci pullback, refined Gysin maps, intersection products and source-scoped Grothendieck–Riemann–Roch. Appendix A of this paper is general intersection theory, with no shtukas in it … (shortened)

- Boxer–Pilloni, "Higher Hida theory for Siegel modular forms", Inventiones Mathematicae (2026) (https://link.springer.com/journal/222/volumes-and-issues/244-1), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.2: SF.0 ('Construct schemes, quasi-coherent modules ...'; 'State flat ... hypotheses as properties of named morphisms') receives two statements: every coherent sheaf on an open subscheme of a noetherian scheme extends to a coherent sheaf, an … (shortened)

- Guo–Reinecke, "A prismatic approach to crystalline local systems", Inventiones Mathematicae (2024) (https://link.springer.com/journal/222/volumes-and-issues/236-1), for SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3: Coherent Grothendieck–Serre duality for smooth proper formal schemes extends SF.3's Serre duality, and Bhatt's algebraization for points of qcqs algebraic spaces on products belongs to SF.1's algebraic spaces. (from the extraction of Guo–Reinecke, "A prismatic appr … (shortened)

- Qian, "Potential automorphy for GL_n", Inventiones Mathematicae (2023) (https://link.springer.com/journal/222/volumes-and-issues/231-3), for SchemeAndStackFoundations:SF.4: SF.4 plans 'formal schemes, algebraization, semistable reduction and alterations … a model records its base, generic fiber and allowable base extension'. It owns the general mixed-characteristic toroidal semistable reduction theorem that the companion preprint applies (item 142, Kempf–Knudsen–Mumford–Saint-Donat, Chapters I … (shortened)

- Xie–Yuan, "Geometric Bogomolov conjecture in arbitrary characteristics", Inventiones Mathematicae (2022) (https://link.springer.com/journal/222/volumes-and-issues/229-2), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.4, SchemeAndStackFoundations:SF.5: §2 is intersection theory on smooth projective varieties, consuming the Chow groups and intersection products SF.5 plans: Proposition 2.2 (Bertini-type choice of hypersurfaces through V), Lemma 2.3, the proper part of an inters … (shortened)

- Benoist–Wittenberg, "On the integral Hodge conjecture for real varieties, I", Inventiones Mathematicae (2020) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.2: SF.2 owns scheme sites, cohomology, localization and comparisons. Add real étale comparison and the concrete cohomology-with-supports/Cousin/coniveau package as a named suffix, importing M.5 norm-residue and the shared equivariant topology. S.4 and M.6/M.6a are K-theory spectral sequences, and Dittmann … (shortened)

- Benoist–Wittenberg, "On the integral Hodge conjecture for real varieties, I", Inventiones Mathematicae (2020) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.5: SF.5 owns Chow groups, proper cycle operations and Riemann–Roch. Euler-characteristic intermediate indices and their devissage/degree congruences are reusable consequences inside that direction. Reuse the pinned AlgebraicCycle carrier; do not duplicate intersections in MC.0 or the K-theory roadmap. (fr … (shortened)

- Calegari–Geraghty, "Modularity lifting beyond the Taylor-Wiles method", Inventiones Mathematicae (2018) (https://math.uchicago.edu/~fcale/research.html), for SchemeAndStackFoundations:SF.2: The flat Kummer sequence 0 → O_F^×/O_F^{×p} → H¹_fppf(O_F, μ_p) → Cl(F)[p] → 0, which computes the dual Selmer group of §8.2, belongs to the owner of fppf cohomology on schemes. Review: accepted. (from the extraction of Calegari–Geraghty, "Modularity lifting beyond the Taylor-Wiles method", Inventiones Math … (shortened)

- Bhatt–Scholze, "Projectivity of the Witt vector affine Grassmannian", Inventiones Mathematicae (2017) (https://people.mpim-bonn.mpg.de/scholze/papers.html), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.4: Own general perfection, pfp models, morphism properties, pushouts and formal blowup geometry once. GS0 consumes these common results; it does not create a private theory of perfect schemes. (from the extraction of Bhatt–Scholze, "Projectivity of the Witt vector affine Gras … (shortened)

- Bhatt–Scholze, "Projectivity of the Witt vector affine Grassmannian", Inventiones Mathematicae (2017) (https://people.mpim-bonn.mpg.de/scholze/papers.html), for SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3: Reuse the Picard-groupoid owner found in PAPER-WITASZEK-22. Add the abstract Picard interface needed for coherent determinant descent, retaining the pinned invertible-sheaf category as its carrier. (from the extraction of Bhatt–Scholze, "Projectivity of the Witt vector aff … (shortened)

- Bhatt–Scholze, "Projectivity of the Witt vector affine Grassmannian", Inventiones Mathematicae (2017) (https://people.mpim-bonn.mpg.de/scholze/papers.html), for SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.4, SchemeAndStackFoundations:SF.5: Supply general positivity, finite Frobenius power descent and Keel’s criterion from the existing divisor/intersection/birational foundations. Keep original Artin contraction and gluing as explicit source gates. (from the extraction of Bhatt– … (shortened)

- Harpaz–Wittenberg, "The Massey vanishing conjecture for number fields", Duke Mathematical Journal (2023) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.2: The scheme-theoretic Hochschild–Serre edge sequence and naturality specialize its sites/cohomology scope; group-only Hochschild–Serre is a different supplier. Include the natural comparison of splitting-variety and fundamental-group Hochschild–Serre edge maps, not just an abstract Brauer-group isomorphism. … (shortened)

- Harpaz–Wittenberg, "The Massey vanishing conjecture for number fields", Duke Mathematical Journal (2023) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.4: Characteristic-zero smooth compactification is within the existing birational-geometry stage; preserve its characteristic restriction. (from the extraction of Harpaz–Wittenberg, "The Massey vanishing conjecture for number fields", Duke Mathematical Journal (2023), PAPER-HARPAZ-WITTENBERG-23: research/bluepr … (shortened)

- Pilloni, "Higher coherent cohomology and p-adic modular forms of singular weights", Duke Mathematical Journal (2020) (https://projecteuclid.org/journals/duke-mathematical-journal/volume-169/issue-9/Higher-coherent-cohomology-and-p--adic-modular-forms-of/10.1215/00127094-2019-0075.full), for SchemeAndStackFoundations:SF.2: SF.2 ('construct sheaf cohomology, localization') gets the depth statement of SGA 2, Exposé III, §3, which the proof of Lemma 14.9.2 (p. 103) cites: if F is locally free on a … (shortened)

- Česnavičius, "Purity for the Brauer group", Duke Mathematical Journal (2019) (https://webusers.imj-prg.fr/~kestutis.cesnavicius/), for SchemeAndStackFoundations:SF.1: General scheme-torus descent, represented homogeneous quotient, torsor lifting and finite-type group reductions belong to the existing descent/quotient layer. Import field tori/characters from upstream ReductiveGroups Layer4, affine Weil restriction from RG2.0a, and finite locally free Cartier duality from the pinned Tau Ceti lib … (shortened)

- Česnavičius, "Purity for the Brauer group", Duke Mathematical Journal (2019) (https://webusers.imj-prg.fr/~kestutis.cesnavicius/), for SchemeAndStackFoundations:SF.2: General scheme-cohomology supplier: sites, Kummer and étale/fppf comparison, finite-flat and torus cohomological descent, completion and perfectoid cohomology preparation, supports, support-local-global and strict support stalks, and Appendix A field cohomology. The purity consumer imports these constructions; its vanishing, coni … (shortened)

- Česnavičius, "Purity for the Brauer group", Duke Mathematical Journal (2019) (https://webusers.imj-prg.fr/~kestutis.cesnavicius/), for SchemeAndStackFoundations:SF.4: General Henselian approximation, projective presentation groupoids, iterated completion and formal-algebraization supplier, including SGA 2 VIII finiteness/depth and IX formal comparison/algebraization. Import pinned Artin–Rees/Taylor/naive cotangent foundations and DD.0 low comparison. The exact smooth-algebra lifting theorem is … (shortened)

- van Hoften, "Mod p points on Shimura varieties of parahoric level", Forum of Mathematics, Pi (2024) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/F8892C4B042F5A303D4C4571F67D5E34?pageNum=2), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3: The foundational roadmap owns general perfection, smoothness, descent, quotient stacks and ample-line criteria. GS0 consumes its perfect-space interface and specializes it to Witt f … (shortened)

- Canning–Larson–Payne, "Extensions of tautological rings and motivic structures in the cohomology of the moduli spaces of stable curves", Forum of Mathematics, Pi (2024) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/F8892C4B042F5A303D4C4571F67D5E34?pageNum=2), for SchemeAndStackFoundations:SF.5: SF.5 constructs Chow groups, rational equivalence, proper pushforward, flat and lci pullback, refined Gysin maps, Chern classes and intersection products. Two items of the extr … (shortened)

- Canning–Larson–Payne, "Extensions of tautological rings and motivic structures in the cohomology of the moduli spaces of stable curves", Forum of Mathematics, Pi (2024) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/F8892C4B042F5A303D4C4571F67D5E34?pageNum=2), for SchemeAndStackFoundations:SF.2: SF.2 owns sites and cohomology with compact support and duality, so the Poincaré duality this paper uses belongs there — but in the generality the moduli application requires, … (shortened)

- Bhatt–Mathew, "Syntomic complexes and p-adic étale Tate twists", Forum of Mathematics, Pi (2023) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/90D8AB5A81D5A4AA0B008C3B0CFC8878), for SchemeAndStackFoundations:SF.0: Néron–Popescu desingularization is routed to SF.0 by the Česnavičius extraction; this paper uses the same statement for regular F_p-algebras. (from the extraction of Bhatt–Mathew, "Syntomic complexes and p-adic étale Tate twists", Forum of Mathematics, Pi (2 … (shortened)

- Hacon–Witaszek, "On the relative minimal model program for fourfolds in positive and mixed characteristic", Forum of Mathematics, Pi (2023) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/90D8AB5A81D5A4AA0B008C3B0CFC8878), for SchemeAndStackFoundations:SF.0: Divisorial/reflexive extension and absolute-integral-closure indexing refine the foundational scheme layer. Reuse built ring/scheme carriers; do not put a duplicate general algebra package inside the MMP extension. … (shortened)

- Hacon–Witaszek, "On the relative minimal model program for fourfolds in positive and mixed characteristic", Forum of Mathematics, Pi (2023) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/90D8AB5A81D5A4AA0B008C3B0CFC8878), for SchemeAndStackFoundations:SF.4: Formal lifting, coherent algebraization adapters, obstruction theory and local Q-Cartier deformation lie in the existing deformation/algebraization direction. Import formal existence from Adic F0 rather than rebuild … (shortened)

- Hacon–Witaszek, "On the relative minimal model program for fourfolds in positive and mixed characteristic", Forum of Mathematics, Pi (2023) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/90D8AB5A81D5A4AA0B008C3B0CFC8878), for SchemeAndStackFoundations:SF.5: Constancy of fibre intersection numbers belongs to the general intersection-theory supplier, not to a fourfold-specific duplicate. (from the extraction of Hacon–Witaszek, "On the relative minimal model program for f … (shortened)

- He, "Cordial elements and dimensions of affine Deligne–Lusztig varieties", Forum of Mathematics, Pi (2021) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/A0F34FDF4105CBC68BD961812700E85E), for SchemeAndStackFoundations:SF.0: The finite-type scheme dimension lemma is general scheme-morphism infrastructure. Its application to the ind/perfect correspondences remains G2. (from the extraction of He, "Cordial elements and dimensions of affine Deligne–Lusztig varieties", Foru … (shortened)

- Le–Le Hung–Levin–Morra, "Serre weights and Breuil's lattice conjecture in dimension three", Forum of Mathematics, Pi (2020) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/85BC64C1D182D4DE7F91091602ED00B0), for SchemeAndStackFoundations:SF.0: The same coherent-Hartogs owner already used by PAPER-GILLE-PARIMALA-26/130–135 and PAPER-CESNAVICIUS-19/hartogs supplies arbitrary coherent full-support MCM extension and embedded ideal closure. Import the existing affine module e … (shortened)

- Le–Le Hung–Levin–Morra, "Serre weights and Breuil's lattice conjecture in dimension three", Forum of Mathematics, Pi (2020) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/85BC64C1D182D4DE7F91091602ED00B0), for SchemeAndStackFoundations:SF.2: Own the comparison from existing Ext-colimit local cohomology to the localization exact sequence and canonical flat base change for sections/ideal closures. This extends the coherent direct-image interface already used by PAPER-BEN … (shortened)

- Merkurjev–Scavia, "Galois representations modulo p that do not lift modulo p^2", Journal of the American Mathematical Society (2026) (https://www.math.univ-paris13.fr/~scavia/), for SchemeAndStackFoundations:SF.1: The generic criterion needs the existing quotient/descent owner: a free open of a linear representation has a finite étale constant-group torsor quotient. This is not a new quotient-stack roadmap. (from the extraction of Merkurjev–Scavia, "Galois representations modulo p that do not … (shortened)

- Merkurjev–Scavia, "Galois representations modulo p that do not lift modulo p^2", Journal of the American Mathematical Society (2026) (https://www.math.univ-paris13.fr/~scavia/), for SchemeAndStackFoundations:SF.2: The generic criterion adds a concrete source for étale cohomology continuity and the compatible torsor edge maps within the existing sites/cohomology layer. Import the general Hochschild–Serre construction from ArithmeticGaloisDuality. (from the extraction of Merkurjev–Scavia, "Galoi … (shortened)

- Clausen–Mathew–Morrow, "K-theory and topological cyclic homology of henselian pairs", Journal of the American Mathematical Society (2021) (https://math.uchicago.edu/~amathew/), for SchemeAndStackFoundations:SF.0: The equivalent characterizations of henselian pairs, henselization of pairs, Elkik's theorem and Néron–Popescu are standard Stacks-project commutative algebra; SF.0 already receives Néron–Popescu from the Česnavičius extraction, and these belong with it. (from the extraction of Clause … (shortened)

- Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Journal of the American Mathematical Society (2020) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.2: Étale G_m cohomology, purity, residue comparisons and Leray inputs belong to the shared scheme-cohomology foundation. (from the extraction of Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Journal of the American Mathematical So … (shortened)

- Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Journal of the American Mathematical Society (2020) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.3: Boundary divisors and the Picard localization sequence refine the common divisor/Picard API. (from the extraction of Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Journal of the American Mathematical Society (2020), PAPER-HARPA … (shortened)

- Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Journal of the American Mathematical Society (2020) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.4: Characteristic-zero compatible compactification and resolution are explicit birational-geometry inputs; do not assume positive-characteristic resolution. (from the extraction of Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Jou … (shortened)

- Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Journal of the American Mathematical Society (2020) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.5: Import rational equivalence, CH₀, degree and the Chow push/pull projection formula once. The existing AlgebraicCycle carrier and partial map are reused. (from the extraction of Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Jour … (shortened)

- Kisin, "Mod p points on Shimura varieties of abelian type", Journal of the American Mathematical Society (2017) (https://people.math.harvard.edu/~kisin/preprints.html), for SchemeAndStackFoundations:SF.1: SF.1 owns gerbs, descent and the reusable quotient-category/torsor interfaces. Add strict monoidal crossed modules and invertible two-fiber adapters to its existing categorical foundations; preserve ordinary Mathlib carriers. (from the extraction of Kisin, "Mod p points on Shimura varieties o … (shortened)

- Bhargava–Gross–Wang, "A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension", Journal of the American Mathematical Society (2017) (https://collaborate.princeton.edu/en/publications/a-positive-proportion-of-locally-soluble-hyperelliptic-curves-ove/), for SchemeAndStackFoundations:SF.3: SF.3 owns divisors, line bundles and Picard objects. The comparison of rational divisor classes with rational divisors, via Pic_{C/K}(K)/Pic(C/K) ↪ Br(K′ … (shortened)

- Gao–Ge–Kühne, "The Uniform Mordell–Lang Conjecture", Publications Mathématiques de l'IHÉS (2026) (https://pmihes.centre-mersenne.org/volume/PMIHES_2026__143_/), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.5: SF.0 owns properties of morphisms and SF.5 owns intersection theory and degrees. The paper uses EGA IV facts (openness of the geometrically integral locus in flat proper families, openness of flat morphisms, irreducibility of fibre powers with geometrically irreducible … (shortened)

- Bhatt et al., "Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic", Publications Mathématiques de l'IHÉS (2023) (https://pmihes.centre-mersenne.org/volume/PMIHES_2023__138_/), for SchemeAndStackFoundations:SF.0: Absolute integral closures, reflexive divisor sheaves and base-scope adapters refine the existing scheme foundations. Reuse scheme/module and normality carriers rather than hiding duplicates in the MMP extension. (from the extraction of Bh … (shortened)

- Bhatt et al., "Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic", Publications Mathématiques de l'IHÉS (2023) (https://pmihes.centre-mersenne.org/volume/PMIHES_2023__138_/), for SchemeAndStackFoundations:SF.4: Named three-dimensional pair resolution and Saito's log-smooth extension refine the existing models/alterations direction. Import curve stable reduction and keep the nowhere-dense/projective/ample-exceptional restrictions explicit. (from t … (shortened)

- Bhatt et al., "Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic", Publications Mathématiques de l'IHÉS (2023) (https://pmihes.centre-mersenne.org/volume/PMIHES_2023__138_/), for SchemeAndStackFoundations:SF.5: The discriminant computation is a concrete Chern/intersection/Thom–Porteous application of the single intersection-theory supplier. (from the extraction of Bhatt et al., "Globally +-regular varieties and the minimal model program for three … (shortened)

- Benoist, "The period-index problem for real surfaces", Publications Mathématiques de l'IHÉS (2019) (https://pmihes.centre-mersenne.org/volume/PMIHES_2019__130_/), for SchemeAndStackFoundations:SF.2: Use the early SF.2 site and equivariant-sheaf carriers. PAPER-CESNAVICIUS-19 route 3 already owns cohomological Brauer groups, generic injectivity, purity/residues and étale Kummer; items 09–10 add only finite residue support/maximal unramified open and the residue ramification-index formula. PAPER … (shortened)

- Kisin–Pappas, "Integral models of Shimura varieties with parahoric level structure", Publications Mathématiques de l'IHÉS (2018) (https://www.numdam.org/volume/PMIHES_2018__128_/), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1: Generic Hartogs extension, affine arithmetic descent and module torsor twisting use the existing scheme/descent owner. Import the earlier CESNAVICIUS-22 torsor and patching items before adding statement-specific adapters. (from the extraction of Kis … (shortened)

- Boxer, Calegari, Gee and Pilloni, "Abelian surfaces over totally real fields are potentially modular" (arXiv:1812.09269) (https://arxiv.org/abs/1812.09269), for SchemeAndStackFoundations:SF.2: SF.2 is to 'construct sheaf cohomology, localization, proper/smooth base change and compact support'. It receives Kempf's Cousin complexes, in the cohomology-with-supports package that the Benoist–Wittenberg (2020) extraction asks of this layer, beside local cohomology as a colimit of Ext sheaves (Kings– … (shortened)

- Bhatt, "On the direct summand conjecture and its derived variant", Inventiones Mathematicae 212 (2018) (https://link.springer.com/article/10.1007/s00222-017-0768-7), for SchemeAndStackFoundations:SF.4: Generic multisections and the non-Noetherian algebraic modification theory belong in SF.4: flattening by blowup (Stacks 0815, 081R), the module strict transform, flat generic isomorphisms, proper-modification domination (081T) and its p-adic instance formal-domination. H^0 integrality is a pinne … (shortened)

- Česnavičius, "Macaulayfication of Noetherian schemes", Duke Mathematical Journal (2021) (https://webusers.imj-prg.fr/~kestutis.cesnavicius/), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.4: SF.0 constructs schemes and quasi-coherent modules, and the extension of a coherent submodule (or closed subscheme) across an open immersion of Noetherian schemes, EGA I 9.4.7 (item 71), used in Lemma 2.11 and twice in Proposition 5.2, is a basic statement about them that nothing states. … (shortened)

- Deligne, "La conjecture de Weil. II", Publications mathématiques de l'IHÉS 52 (1980), 137–252 (https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), for SchemeAndStackFoundations:SF.2: The conventions of §0 (geometric points, henselisation and strict henselisation, traits, closed points, finite filtrations, limits in ind- and pro-categories) and the filtered derived category and truncation of (1.1.2) are the site-theoretic background SF.2 owns ('construct sheaf cohomology, localization, … (shortened)

- Scholze, "Étale cohomology of diamonds" (arXiv:1709.07343) (https://arxiv.org/abs/1709.07343), for SchemeAndStackFoundations:SF.2: SF.2 is the layer that is to 'construct sheaf cohomology, localization, proper/smooth base change and compact support' for schemes. The paper uses scheme proper base change in Lemma 19.4 and invariance of étale cohomology under extension of algebraically closed base field in Proposition 27.2, and (in Lemma 9.5) the refinement of fppf covers of strictly henselian lo … (shortened)

- Kedlaya and Liu, "Relative p-adic Hodge theory: foundations", Astérisque 371 (2015) (https://arxiv.org/abs/1301.0792), for SchemeAndStackFoundations:SF.2: SF.2 owns the sites and the cohomology of schemes: it says it will "own Zariski, etale, fppf and pro-etale site comparisons", "construct sheaf cohomology" and "distinguish torsion, l-adic and rational coefficients in every export". The pro-étale site of a scheme (Definition 1.4.10, weakly étale morphisms with fpqc coverings and the sheaves F … (shortened)


## Validation boundary

The full current Mathlib-only file elaborates; precise diagnostics and hashes are in the handoff. The four actual-section adapters and inherited étale-lift uniqueness have complete native proofs. A separate axiom audit verifies that these five declarations have no admitted axiom dependencies. Five new typed examples check the explicit F5 product selector, reject its complement, identify the actual kernel, and demand the product/localization projection equations. The inherited sixteen examples and their admitted proofs are preserved.

The new source reads cover the complete statements and displayed proofs of Stacks 10.151.4, 10.143.9 and 10.143.8 and all mathematical text/proofs of 15.12.1–8. Twelve additional baseline statements were read at the pin. The generic unramified diagonal product already exists; its public existential signature does not specify a projection. The new adapters explicitly carry the given section. A lift of a residue idempotent is not assumed idempotent before reduction.

Eight gap groups, seven open stages, all 62 routed-paper obligations, twelve unimplemented confirmed findings, the other five reserved keys and the unaccepted PerfectoidSpaces consolidation proposal remain. Source issue E1 is inherited unchanged and awaits independent review. Compilation and the local proof audit do not certify the henselization construction or any global roadmap closure.
