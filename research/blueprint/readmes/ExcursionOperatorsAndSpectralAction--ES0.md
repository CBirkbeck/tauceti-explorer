# Excursion operators and the spectral action: ES0–ES4

This is a **partial revision 2 checkpoint** for part ES0. All eight stages retain planned target coverage; none is closed. The packet contains 42 unchecked nodes, five explicit gaps and nineteen open supplier requests. The blocking task is PROTOCOL section 13: the full enhanced Lean signatures cannot yet be stated with the current supplier interfaces. The mathematical specifications below remain the targets, with their signature status recorded separately.

The source is Fargues–Scholze, [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), identified by the recorded SHA-256. The original 7 October reading receipt is retained; revision 2 reread the specific ranges recorded below on 9 October 2026. Its exact statements and the additional roadmap obligations are distinguished in each node’s source match. The revision also read the upstream ReductiveGroups and SemisimpleAlgebras roadmaps in full for declaration, proof and API density.

## Conventions and coefficient ranges

E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.

G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

D denotes D_lis(Bun_G,Lambda); D^omega is its compact subcategory. Z^P=[Z^1(W_E/P,H)_Lambda/H]. End and functor categories in mathematical statements are enhanced unless explicitly called ordinary.

The center-order condition |pi_0 Z(G)| invertible is distinct from the DVR integral-action condition ell not dividing |pi_1(H)_tors|. The rational action has no latter restriction; the excursion route and ES5 work at excluded primes.

| Construction | Coefficient requirement |
| --- | --- |
| Excursions, wild cutoff, component idempotents | Z_ell[sqrt(q)]-algebra; ell != p |
| Invariant-coordinate center map | Additionally order of pi_0 Z(G) invertible in Lambda |
| Rational categorical action | Field over Q_ell(sqrt(q)); every ell != p |
| Integral actual-Perf action | DVR integers in a finite extension; ell does not divide order of pi_1(H)_tors |
| Integral approximation action | DVR split-reductive setup; no good-prime restriction at this step |

## Ownership and imported inputs

The reviewed audit already finds the ordinary Mathlib center. It is imported. The verifier’s primary fix for RT-AREA-geomlanglands/6 overrides the older overlapping LP4 action-universality draft: this part owns Chapter X, while LP4 supplies VIII.5.1 generation and module comparison. LP2 retains the full abstract excursion construction; SR.1 owns the ordinary ring-valued smooth center; ES7 owns the general spectral stratum composites. No other packet or atlas data is edited.

A target-level planning pass can contain requested inputs and exact gaps. “Planned” below means every target is specified with its prerequisite chain ending in a library declaration, a precise imported node, a requested stage, or a stated gap. It does not mean proof closure or formalization.

The current LP2 invariant-function-and-independence node supplies commutative reindexing, so its former correction request is resolved. The author-copy misprint remains recorded separately. The independent review object is preserved for the next reviewer.

## ES0

The first construction is the enhanced Bernstein center, the degree-zero endomorphism algebra of the identity exact functor. The ordinary categorical center and its elementary API already exist in Mathlib. The enhancement supplies an E_2 structure and therefore a commutative degree-zero algebra; taking object components only gives a natural map to the center of the homotopy category. There is no general isomorphism assertion.

LP2 owns the abstract excursion datum, its invariant function, coefficient independence and finite-leg relations. Here its inputs are instantiated by the actual HS1/HS4 normalized Hecke kernels on Bun_G. Creation and annihilation are diagonal-invariant maps; an arbitrary pair is not an adjunction unit and counit. Their coherent composite gives the enhanced lift. The completed Weil-variable continuity uses condensed enrichment, rather than treating a dense discrete subgroup as the full topological group.

The comparison of discretizations is qualified: LP’s continuous universal property canonically identifies the ell-torsion-free excursion quotient; the full excursion algebra is identified at good primes or rationally. Nilpotent torsion can still leave the same idempotents and points. No unrestricted integral algebra identification is built into this stage.

Coverage: **planned**. Refinement contract: E5/HS1 enhanced center and coherent relation signatures; preserve the qualified comparison to ordinary CatCenter.

### Enhanced Bernstein center

`ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category` · definition · proposed name `enhancedCenter`

For a Lambda-linear stable infinity-category C, define Z_enh(C) = pi_0 Map_Fun^ex_Lambda(C,C)(id_C,id_C), with addition from stability and multiplication from composition. Its E_2 structure makes pi_0 a commutative Lambda-algebra. When C is condensed enriched, retain the induced condensed endomorphism algebra. For D_lis use its given condensed enhancement and identify the center of compact objects with that of Ind(C) through the colimit-preserving extension.

Hypotheses and interfaces:

- C is small and idempotent complete, or presentable and compactly generated with its specified compact subcategory.
- The functor category and mapping object are enhanced; ordinary CatCenter is only an imported comparison target.

Construction or proof:

1. Form the enhanced exact endofunctor category and the endomorphisms of its monoidal unit.
2. Use composition and the interchange law to obtain the E_2 structure, then take pi_0 and its scalar map.
3. Use the universal property of Ind to extend exact endofunctors and natural transformations; retain condensed enrichment from HS1.

Uses:

- IX.5: Receives the excursion map and its component idempotents.
- ES5: Evaluation at a Schur object supplies an excursion character.

API:

- `enhancedCenter_eval` (projection): Each object X has a Lambda-algebra map Z_enh(C) -> pi_0 End_C(X).
- `enhancedCenter_scalars` (structure): The scalar lambda evaluates to lambda times id_X at every X.
- `enhancedCenter_ind` (equivalence): Restriction from colimit-preserving natural endomorphisms on Ind(C) to C is an equivalence of mapping objects, hence of degree-zero centers.
- `enhancedCenter_naturality` (relation): For u:X->Y, u composed with z_X equals z_Y composed with u, with the coherent enhanced naturality inherited from z.

Unit tests:

- `center_scalar_eval` (computation): For lambda in Lambda, evaluation of its scalar central class on X is lambda id_X.
- `center_zero_category` (degenerate): For the zero stable category the enhanced center is the zero ring.
- `center_module_category` (characterisation): For C = Perf(A), A an ordinary commutative Lambda-algebra, Z_enh(C) identifies with A through multiplication, and evaluation at A is that identification.

Acceptance:

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

Direct prerequisites: `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`, `mathlib:CategoryTheory.CatCenter`, `mathlib:CategoryTheory.CatCenter.app`, `mathlib:CategoryTheory.CatCenter.naturality`, `mathlib:CategoryTheory.Linear.toCatCenter`.

Source: IX.1 pp. 320–321; IX.5 p. 328; VIII.4.1 p. 291. FS specifies the enhanced center pi_0 End(id). The E_2 and Ind mapping-object facts are requested from E5; the Perf(A) test uses Hochschild cohomology in degree zero, not an asserted comparison with all homotopy-category centers.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Enhanced Bernstein center**.

### Comparison with the homotopy-category center

`ExcursionOperatorsAndSpectralAction:ES0/enhanced-to-homotopy-center` · theorem · proposed name `enhanced_to_homotopy_center`

Evaluation of an enhanced central class on objects induces a natural Lambda-algebra map Z_enh(C) -> CatCenter(hC). It commutes with scalar maps and evaluation. No injectivity or surjectivity is asserted for general stable C.

Hypotheses and interfaces:

- C and hC carry the supplied Lambda-linear enhancement.

Construction or proof:

1. Take pi_0 of the coherent natural transformation.
2. Check naturality in hC and the additive/multiplicative identities using the enhanced composition laws.

Acceptance:

- Check the square of scalar maps and the square of evaluation maps.
- Reject the checkpoint’s unsupported claim that this comparison is always an isomorphism.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`, `mathlib:CategoryTheory.CatCenter`, `mathlib:CategoryTheory.CatCenter.app`, `mathlib:CategoryTheory.CatCenter.naturality`, `mathlib:CategoryTheory.Linear.toCatCenter`.

Source: IX.5 p. 328; Mathlib Center/Basic and Center/Linear at the pins. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

### Excursion operators on Bun_G

`ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator` · construction · proposed name `bunExcursionOperator`

Apply the imported LP2 excursion-datum construction to the HS1/HS4 coherent Hecke family. For D=(I,V,alpha,beta,gamma), with alpha:1->V restricted to diagonal H and beta:V restricted to diagonal H->1, define S_D(A)=T_beta(A) composed with gamma acting on T_V(A) composed with T_alpha(A), using fusion and T_1 = id. It is a coherent natural endomorphism of the identity on the relevant finite-wild compact category.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- The matrix-coefficient datum, the invariant function and its abstract relations are imported from LP2. Alpha and beta are arbitrary diagonal-invariant maps, not necessarily adjunction units/counits.

Construction or proof:

1. Insert the actual HS kernels and their unit/fusion identifications into LP2’s abstract construction.
2. Use HS1’s condensed Weil action for the middle arrow.
3. Keep creation and annihilation natural at the enhanced level rather than checking only objectwise endomorphisms.

Uses:

- ES0 enhanced algebra map: Supplies each generator of the excursion map.
- ES4 local shtukas: Naturality makes the operators commute with smooth group actions.

API:

- `bunExcursionOperator_app` (projection): The component on A is T_alpha(A), then gamma, then T_beta(A), with the specified unit identifications.
- `bunExcursionOperator_naturality` (relation): For u:A->B, u followed by S_D(B) equals S_D(A) followed by u.
- `bunExcursionOperator_function` (characterisation): Data with the same invariant function and Weil tuple induce the same operator, by the imported LP2 independence theorem.
- `bunExcursionOperator_fusion` (compatibility): Pulling legs together along a map I->J agrees with HS4 fusion and the LP2 reindexing relation.

Unit tests:

- `excursion_trivial_rep` (degenerate): For V=1 and alpha=beta=id, S_D=id for every Weil tuple.
- `excursion_identity_tuple` (computation): If all gamma_i=1 then S_D=T_(beta alpha); in particular a duality coevaluation/evaluation pair gives dim(V) id, rather than automatically id.
- `excursion_two_leg_trace` (computation): For H=GL_n, V=std external tensor std-dual and its usual creation/annihilation maps, evaluation on a parameter phi gives tr(phi(gamma_1) phi(gamma_2)^(-1)).
- `excursion_nonsplit` (compatibility): On a nonsplit torus, the one-cocycle equation is phi(uv)=phi(u) u(phi(v)); the construction uses twisted, rather than ordinary, conjugation.

Acceptance:

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

Direct prerequisites: `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`, `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`, `EnhancedDerivedSheaves:E5:abstract`, `ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`.

Source: VIII.4.2 pp. 291–292; IX.2 pp. 321–324. VIII.4.2 defines the abstract datum and operator; IX.2 supplies the normalized enhanced Bun_G Hecke family. Only the specialization is owned here.

Lean signature status: Ordinary observation declared; full enhanced signature pending.

Atlas planet: **Excursion operators**.

### Enhanced excursion algebra action

`ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center` · theorem · proposed name `excursion_algebra_to_bernstein_center`

For a finite-wild compact Hecke category D^P, the LP2 algebra Exc(W,H) tensor Lambda maps naturally to Z_enh(D^P) by f_D,gamma |-> [S_D]. Its projection to CatCenter(hD^P) is the imported VIII.4.1 map. Coherent HS4 comparisons between enhanced natural transformations give equal classes in pi_0, where the excursion algebra relations hold; no Perf action or good-prime hypothesis is needed.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- P is open normal in wild inertia, acts trivially on the pinned H action, and D^P consists of compact A whose entire Hecke family descends to W_E/P.
- W is a dense discrete tame discretization of W_E/P.

Construction or proof:

1. Use the LP2 presentation and relations on the coherent HS4 family.
2. Construct the enhanced composites and coherent HS4 comparisons; equality of their classes supplies each relation in the degree-zero center. Strict equality of enhanced morphisms or a map of algebra spectra is not asserted.
3. Take pi_0 to obtain the algebra map and verify its homotopy-center projection.

Acceptance:

- Check additivity, multiplication and unit on the LP2 generators.
- For a noninjective leg map check the same HS4 fusion diagram, not a separately assumed relation.
- At a forbidden integral prime retain this algebra map without asserting an invariant-ring isomorphism.
- Use the current LP2 commutative reindexing square, including for a noninjective leg map. Do not strengthen it to a pullback assertion; see author-copy source issue ExcursionOperatorsAndSpectralAction/E1. The supplier correction request has been resolved in LP2.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`, `ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`, `ExcursionOperatorsAndSpectralAction:ES0/enhanced-to-homotopy-center`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `EnhancedDerivedSheaves:E5:abstract`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/finite-wild-Hecke-category`.

Source: VIII.4.1 pp. 291–293; IX.5 p. 328. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Excursion algebra action**.

### Condensed continuity of excursions

`ExcursionOperatorsAndSpectralAction:ES0/continuity-of-excursion-evaluations` · theorem · proposed name `continuity_of_excursion_evaluations`

For every compact A and each fixed finite-leg invariant coefficient, the map (W_E/P)^I -> pi_0 End(A) given by the creation–Weil–annihilation operator is a map of condensed sets, whenever P is the uniform cutoff of A. Evaluation along a Schur scalar identification is therefore continuous. The full excursion algebra need not be canonically independent of discretization at bad primes.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

Construction or proof:

1. Compose the condensed action on T_V(A) with the condensed natural creation and annihilation morphisms.
2. Use the relatively discrete Hom structure from IX.1.2 and the cutoff theorem.
3. For comparisons of presentations invoke LP2’s continuous universal property with its flatness restriction.

Acceptance:

- Continuity is on the completed Weil quotient, rather than only its dense subgroup.
- Check a nonsplit torus with its prescribed projection to Q.
- Do not infer a canonical representative of a Schur parameter.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`, `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`, `HeckeStacksAndLocalShtukas:HS1`, `LanglandsParameterStacks:LP2:integral-invariants/transition-and-continuity`.

Source: IX.1.2 pp. 320–321; IX.5.1 pp. 327–328; VIII.3.7 pp. 288–290. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

### Comparison of discretizations

`ExcursionOperatorsAndSpectralAction:ES0/discretisation-of-the-weil-group` · comparison · proposed name `discretisation_of_the_weil_group`

Two choices of tame discretization yield canonically identified cocycle schemes by restriction and unique continuous extension. Their excursion evaluations on flat relatively discrete targets agree through the ell-torsion-free quotient of Exc, which is independent of discretization. At good primes (ell not dividing |pi_1(H)_tors|) or after inverting ell, Exc itself identifies with the invariant algebra, so the corresponding comparison is an isomorphism. At other primes full-algebra independence is not asserted; condensed operator evaluation and component idempotents remain intrinsic.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

Construction or proof:

1. Identify the two cocycle schemes through W_E/P.
2. Use LP2’s continuous universal property only on flat targets.
3. Use the invariant comparison in its exact coefficient range and the universal homeomorphism for idempotents outside it.

Acceptance:

- Retain the ell-torsion-free qualification in the general comparison.
- The change of Frobenius/tame generator composes through the intrinsic cocycle functor.

Direct prerequisites: `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `LanglandsParameterStacks:LP0/change-of-discretization`, `LanglandsParameterStacks:LP2:integral-invariants/transition-and-continuity`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`.

Source: VIII.3.7 pp. 288–290; IX.5 p. 328. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

## ES0:classical-center

Restrict a central enhanced transformation along the fully faithful trivial-stratum embedding. It then acts on the enhanced derived smooth category and on its ordinary heart. SR.1 owns the abelian ring-valued Bernstein center, its pro-p Hecke-corner inverse limit, and its ell-adic separatedness. SR.3 owns the complex block classification. These are distinct exports.

The complex return uses a specified abstract field isomorphism from Qbar_ell to C and transports ordinary smooth representations and their centers. It depends on that choice and carries no condensed Weil topology across the field isomorphism. The characteristic-ell Schur assignment does not use this return. General b-stratum spectral composites belong to ES7:parabolic; they are not reconstructed here.

Coverage: **planned**. Refinement contract: SR.1 abelian ring-valued center/Hecke-corner export and SR.3 field-transport block dictionary.

### Restriction to the smooth Bernstein center

`ExcursionOperatorsAndSpectralAction:ES0:classical-center/map-to-the-classical-bernstein-center` · theorem · proposed name `map_to_the_classical_bernstein_center`

For the fully faithful stratum embedding j_!:D(G(E),Lambda)->D_lis(Bun_G,Lambda), restrict an enhanced central class to its essential image and transport it back to the enhanced derived smooth category. Evaluation on degree-zero smooth representations gives a Lambda-algebra map to the ordinary abelian Bernstein center Z(Sm_Lambda(G(E))). This last step uses t-exactness of the identity transformation and SR.1’s abelian center; no general center-of-homotopy-category isomorphism is used.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use the specified b=1 stratum embedding and its fully faithful enhanced adjunction.
- SR.1 supplies the abelian center over rings with a cofinal family of compact opens of invertible pro-order.

Construction or proof:

1. Restrict along j_! and use full faithfulness on enhanced mapping objects.
2. Take pi_0 and restrict to the heart of the derived smooth category.
3. Compose with the SR.1 abelian center/Hecke-corner dictionary.

Acceptance:

- At G=1 the restriction and heart maps give the ordinary scalar action.
- No complex block decomposition is required for the ring-valued comparison.
- General b-stratum spectral composites Psi_G^b remain ES7:parabolic’s constructions.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`, `ExcursionOperatorsAndSpectralAction:ES0/enhanced-to-homotopy-center`, `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`, `VStackSheavesAndLisseCategories:VS4`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `SmoothRepresentationsOfLocalGroups:SR.1`.

Source: IX.5 p. 329; VII.7.2 pp. 271–273. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Smooth center comparison**.

### Characteristic-zero block comparison

`ExcursionOperatorsAndSpectralAction:ES0:classical-center/complex-block-comparison` · comparison · proposed name `complex_block_comparison`

Choose an abstract field isomorphism iota:Qbar_ell ≃ C and transport smooth algebraic representations by scalar extension along iota. This gives an equivalence of ordinary smooth representation categories and hence an isomorphism of their CatCenter rings. Composing the Qbar_ell excursion/center action with it gives SR.3’s complex blockwise action. The comparison depends on iota; it does not transport the condensed Weil topology or provide an ell-independent block map.

Hypotheses and interfaces:

- Coefficients are Qbar_ell and C as abstract fields, with a specified isomorphism.
- SR.3 supplies the complex Bernstein decomposition and its identification of the block centers.

Construction or proof:

1. Use SR.0’s smooth category and its field-transport equivalence.
2. Transport natural endomorphisms along the equivalence.
3. Apply the SR.3 complex block description to the composite from the preceding node.

Acceptance:

- Check that a scalar lambda maps to iota(lambda) on each block.
- State dependence on iota and keep this comparison out of the characteristic-ell ES5 route.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES0:classical-center/map-to-the-classical-bernstein-center`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

Source: IX.5 p. 329; roadmap ES0:classical-center coefficient dictionary. FS supplies the map to the smooth center, not the complex block theorem. SR.3 and the requested coefficient dictionary supply this roadmap-added comparison.

Lean signature status: Full signature omitted pending actual supplier types.

## ES1

Write the spectral and geometric centers using the already supplied LP global-function algebra and ES0 enhanced center. The Hecke-compatible center imposes the stronger equality between the central action after a Hecke functor and the Hecke functor applied to the original action. A natural transformation on the category need not commute with every endofunctor: switching the factors of Perf(k) × Perf(k) reduces the product center to its diagonal subalgebra.

Finite ramification and the conditional coordinate action are proved in the two sublayers. Their coefficient requirements are carried at those sublayers rather than imposed on every excursion construction.

Coverage: **planned**. Refinement contract: Complete the supplier enhanced center and finite-wild coordinate interfaces.

### Spectral, geometric and Hecke-compatible centers

`ExcursionOperatorsAndSpectralAction:ES1/spectral-and-geometric-centers` · definition · proposed name `heckeCenter`

Write Z_spec = Gamma([Z^1(W_E,H)_Lambda/H],O) and Z_geom = Z_enh(D_lis(Bun_G,Lambda)), using LP’s function ring and ES0’s enhanced center. Define Z_geom,Hecke as the subalgebra of z such that z_(T_V A)=T_V(z_A) for every finite I,V,A. The general geometric center need not satisfy this stronger condition.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use the imported global-function ring; do not identify its infinite parameter union with one finite-type affine scheme.

Construction or proof:

1. Name the two already supplied algebras.
2. Define the Hecke-compatible subalgebra by the displayed equality.
3. Check closure under addition, multiplication and scalars from the exact Lambda-linear functors.

Uses:

- IX.5.2: Specifies the target of the conditional spectral center map.
- ES2 center agreement: Receives degree-zero functions from the categorical action.

API:

- `heckeCenter_mem` (characterisation): z lies in the Hecke-compatible subalgebra iff every T_V carries z_A to z_(T_V A).
- `heckeCenter_inclusion` (coercion): The inclusion Z_geom,Hecke -> Z_geom is an injective Lambda-algebra map.
- `heckeCenter_scalars` (structure): Every Lambda scalar lies in Z_geom,Hecke.
- `heckeCenter_comp` (relation): Compatibility with two functors implies compatibility with their composite.

Unit tests:

- `heckeCenter_identity` (degenerate): For the family consisting only of the identity, the compatible subalgebra is the whole center.
- `heckeCenter_product_switch` (non-example): For C=Perf(k)×Perf(k) and the switching functor, Z_geom=k×k while Z_geom,Hecke is the diagonal copy of k.
- `heckeCenter_scalar` (computation): A scalar lambda has the same lambda id action before and after every Lambda-linear T_V.

Acceptance:

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`, `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`.

Source: IX.5 pp. 328–329. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Ordinary observation declared; full enhanced signature pending.

Atlas planet: **Spectral center**.

## ES1:finite-ramification

For a compact object, choose one open normal wild subgroup that works for every representation and every finite leg set. The tensor-generator reduction is essential: selecting a different subgroup for each representation does not prove the statement. The proof uses relatively discrete condensed endomorphisms, compact inertia image and the incompatibility between an infinite pro-p image and a locally pro-ell automorphism group.

The resulting full subcategory D^P has all its Hecke images in the quotient-equivariant category. A universal homeomorphism of coordinate spectra transports the clopen component idempotents even where the rings are not isomorphic. Split these on compact objects and pass through the finite-wild union. The compact category is a direct sum of component categories; its Ind completion is their product. A compact object has finitely many components, while a noncompact product object can have unbounded wild conductor.

Coverage: **planned**. Refinement contract: HS1 relatively discrete Hom and quotient-equivariant full faithfulness, and E5 Ind sum/product comparison.

### Uniform finite wild ramification

`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup` · theorem · proposed name `uniform_wild_subgroup`

For every compact A in D_lis(Bun_G,Lambda), there is an open normal subgroup P of wild inertia, contained in the kernel of W_E->Q, such that for every finite set I and every V in Rep((H semidirect Q)^I), T_V(A) descends to an object equivariant for (W_E/P)^I. The subgroup depends on A and works simultaneously for all I,V.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

Construction or proof:

1. Use vanishing of the Lambda-homology of pro-p P^I to prove quotient-equivariant pullback fully faithful.
2. Choose a tensor generator; a relatively discrete condensed endomorphism algebra has compact inertia image inside a finite Z_ell-module, whose automorphism group is locally pro-ell. Shrink P to kill its pro-p image.
3. Tensor/fusion identifies independent leg actions; close under duals, subquotients and extensions as justified by exact representations, then exterior tensors and reindexing.
4. Replace P by its normal core and intersect with the finite pinned-action kernel.

Acceptance:

- Quantifiers are for every compact A, there exists P, for all I,V.
- Test a compactly induced representation through its stratum embedding.
- A noncompact sum with unbounded wild conductors need not have any common P.
- The coefficient condition is ell != p, not the integral-action good-prime restriction.

Direct prerequisites: `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`, `HeckeStacksAndLocalShtukas:HS1`, `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`, `LanglandsParameterStacks:LP0`, `EnhancedDerivedSheaves:E5:abstract`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/finite-wild-Hecke-category`.

Source: IX.5.1 pp. 327–328. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Finite wild ramification**.

### Component decomposition

`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition` · theorem · proposed name `component_decomposition`

For D^P consisting of compact A with the uniform P-Hecke cutoff, the enhanced excursion map and LP2’s universal homeomorphism identify component idempotents. Splitting them gives D^P = direct sum_c D^c over pi_0 Z^1(W_E/P,H)_Lambda. Taking the union over P gives the direct sum decomposition of D_lis^omega by parameter components; its Ind-category is the product of the Ind(D^c). Every compact has finitely many nonzero components. A Schur object has exactly one nonzero component.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

Construction or proof:

1. Use the component idempotents of the invariant quotient and transport them uniquely through the universal homeomorphism.
2. Split finitely many idempotents on each compact object in the idempotent-complete category.
3. Glue as P shrinks using the same continuous excursions and LP’s open-and-closed transition maps.
4. Extend to Ind; the Ind of a sum of small compact categories is the product of their Ind-categories.

Acceptance:

- Check finite support of compact objects and the possibility of infinitely supported Ind objects.
- Use ring idempotents for clopen components, not characteristic functions of arbitrary subsets.
- No invariant-algebra isomorphism at bad primes is needed for the idempotents.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`, `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`, `EnhancedDerivedSheaves:E5:presentability`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/finite-wild-Hecke-category`.

Source: IX.5 pp. 328–329. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Component decomposition**.

### Compatibility of finite-wild centers

`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/center-on-finite-wild-pieces` · theorem · proposed name `center_on_finite_wild_pieces`

If P′⊂P are eligible wild subgroups, the inclusion D^P⊂D^P′ intertwines the excursion evaluation maps through restriction of the universal parameter and the dense discretizations. In the coefficient range of the invariant-ring comparison it also intertwines the spectral function actions. The component summands consequently glue independently of choices. Every compact is evaluated on some D^P; no common P for all Ind objects is required.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

Construction or proof:

1. Compare each excursion coefficient and Weil tuple using HS4.
2. Use LP’s intrinsic cocycle transitions; at bad primes use only idempotents or qualified torsion-free comparisons.
3. Use the generator presentation to identify the ring maps.

Acceptance:

- Check the identity transition and composition for P″⊂P′⊂P.
- Retain the qualified comparison at forbidden integral primes.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`, `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`, `LanglandsParameterStacks:LP2:integral-invariants/transition-and-continuity`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`.

Source: IX.5 pp. 328–329; VIII.3.7 pp. 288–290. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

### Finite-wild Hecke subcategory

`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/finite-wild-Hecke-category` · definition · proposed name `finiteWildCategory`

For eligible P, define D^P as the full subcategory of compact D_lis objects A such that every T_V(A), for every finite I and V, belongs to the fully faithful image of quotient-equivariant objects for (W_E/P)^I. The image condition uses the enhanced equivariant functor category, including its homotopies. If P′⊂P then D^P⊂D^P′.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- P is open normal in wild inertia and lies in the pinned action kernel.

Construction or proof:

1. Use quotient-equivariant pullback and its full faithfulness from the IX.5.1 pro-p homology argument.
2. Define the simultaneous full subcategory.
3. Check closure under finite stable operations and retracts because each quotient-equivariant image is stable and idempotent complete.

Uses:

- IX.5: Subject of the enhanced excursion map and component decomposition.
- X.0.1: Provides the categorical finite-wild pieces for gluing the action.

API:

- `finiteWild_mem` (characterisation): Membership means simultaneous descent of all I,V Hecke images through (W_E/P)^I.
- `finiteWild_inclusion` (functoriality): For P′⊂P the full inclusion D^P->D^P′ is exact and fully faithful.
- `finiteWild_stable` (structure): D^P is closed under zero, shifts, cofibers and retracts.
- `finiteWild_refine_comp` (relation): The inclusions for P″⊂P′⊂P compose to the inclusion for P″⊂P.

Unit tests:

- `finiteWild_zero` (degenerate): The zero compact object lies in D^P for every eligible P.
- `finiteWild_tensor_generator` (characterisation): Trivial P action on the single-leg tensor generator implies membership in D^P by the IX.5.1 tensor/exterior-tensor argument.
- `finiteWild_regular_action` (non-example): For a nontrivial finite wild quotient F acting on its regular representation over coefficients with p invertible, an element of P with nontrivial image in F does not act trivially; such an equivariant orbit does not descend through W_E/P.

Acceptance:

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

Direct prerequisites: `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`.

Source: IX.5 pp. 327–328. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

## ES1:spectral-center

The invariant-coordinate center map carries the exact hypothesis that |pi_0 Z(G)| be invertible in Lambda. Compare it with the excursion construction on each finite-wild piece and glue by component idempotents. It lands in the Hecke-compatible geometric center.

Coefficient, pinned-quotient and cutoff comparisons are commutative diagrams between the supplied functors, established on the same excursion coefficients. This does not assert that every invariant algebra commutes with every scalar tensor product. At excluded center primes the excursion route and component decomposition remain available. Conjecture I.9.5 on ell-independence is registered below as a statement; it is not an acceptance target.

Coverage: **planned**. Refinement contract: LP and HS coefficient/pinned-quotient comparison interfaces; retain the exact center-order condition.

### Spectral center action

`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map` · theorem · proposed name `spectral_to_geometric_center_map`

Assume |pi_0 Z(G)| is invertible in Lambda. There is a natural Lambda-algebra map Z_spec -> Z_geom,Hecke -> Z_geom, compatible with component decomposition. On each compact A it factors through functions on one sufficiently small finite-wild piece. This is IX.5.2, obtained from the excursion map and the invariant-coordinate comparison. General Psi_G^b composites are imported from ES7:parabolic rather than constructed again here.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use the exact center-order condition from IX.5.2; GS supplies its relation to the dual root datum.

Construction or proof:

1. Apply the invariant comparison on each eligible finite-wild compact category.
2. Glue via the component decomposition and the finite-wild compatibility.
3. Commute the insertion of a Hecke kernel with the creation–Weil–annihilation composite.

Acceptance:

- Check the scalar and component idempotent images.
- Check z_(T_V A)=T_V(z_A).
- The statement stops at the Hecke-compatible center; b-stratum Psi maps are ES7’s.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES1/spectral-and-geometric-centers`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/center-on-finite-wild-pieces`, `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`.

Source: IX.5.2 p. 329. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Spectral center action**.

### Center compatibility under change of data

`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/center-change-of-data` · theorem · proposed name `center_change_of_data`

For an extension Lambda->Lambda′ in the eligible IX.5.2 range, the scalar-extended excursion evaluation agrees with evaluation of the same coefficient after derived scalar extension of A and the HS kernels. Therefore the two Z_spec actions agree via the LP coefficient map. A refinement of the finite quotient Q inducing the same pinned W_E action yields the same diagram. Finite-wild transition squares are those of ES1:finite-ramification. This asserts commutativity, not that tensoring with Lambda′ commutes with all invariant rings.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use supplier coefficient-change functors, their normalized kernel comparisons, and the same square root of q.

Construction or proof:

1. Compare creation, Weil action and annihilation individually under each comparison functor.
2. Use the excursion generating functions and the conditional invariant comparison to identify the composites.
3. Check identity and composition of each change of data.

Acceptance:

- State the necessary supplier comparison functor for derived scalar extension.
- Do not infer base-change isomorphisms of unrestricted invariant rings.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `HeckeStacksAndLocalShtukas:HS1`.

Source: IX.5.2 p. 329; VIII.4.2 pp. 291–293. Roadmap compatibility obligation derived from the shared excursion construction and the imported normalized kernel comparisons, rather than a separately numbered FS theorem.

Lean signature status: Full signature omitted pending actual supplier types.

### Excursions at excluded center primes

`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition` · comparison · proposed name `excursion_algebra_without_the_coefficient_condition`

Without |pi_0 Z(G)| invertible, retain the enhanced excursion action on each D^P and its compatible component idempotents. No Z_spec -> Z_geom map is asserted by this route. These operators suffice for the characteristic-ell Schur parameter theorem of ES5 and for its operator-level compatibility diagrams.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

Construction or proof:

1. Keep the excursion construction and universal homeomorphism unchanged.
2. Use idempotents for components and scalar evaluations for Schur objects.
3. Apply the eligible invariant-coordinate map only when its hypotheses hold.

Acceptance:

- At a forbidden good-prime/center-order prime, the excursion construction and ES5 route remain available.
- Do not turn a universal homeomorphism into an algebra isomorphism.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`.

Source: IX.6 opening p. 330. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

## ES2

Over a characteristic-zero field, universal evaluation on the derived mapping stack recovers the coherent representation-valued Hecke family. The central theorem is an equivalence of anima of actions and coherent finite-set data. Its inverse comparisons include the higher homotopies, not just a bijection of isomorphism classes.

The proof reduces along sifted colimits to finite Q-torsor sets. The colimit theorem also needs its pushout half: for equivariant affine derived schemes and a pro-reductive group, relative tensor product of Perf quotient categories computes the derived fiber-product quotient. It uses characteristic-zero representation generation and exact invariants.

On Bun_G, the uniform wild cutoff and intrinsic cocycle comparison make the action compactly supported object by object. The action and IX.5.2 induce the same degree-zero center map because both evaluate every invariant coefficient by the same excursion composite. The Whittaker sheaf is constructed from SR’s closed-subgroup compact induction and the trivial-stratum extension. It is not assumed compact. The categorical equivalence, packet interpretation and nonvanishing of Aut_phi remain the source statements listed below.

Coverage: **planned**. Refinement contract: E5 action anima/relative tensor constructions and LP derived quotient descent; inspect the full higher inverse comparisons.

### Compactly supported categorical actions

`ExcursionOperatorsAndSpectralAction:ES2/compactly-supported-actions` · definition · proposed name `compactlySupportedAction`

An action of Perf(Z/H) on a small stable category C is compactly supported if for each X in C, its orbit functor M |-> Act_M(X) factors, up to coherent equivalence, through restriction Perf(Z/H)->Perf(Z^1(W_E/P,H)/H) for some eligible P depending on X. This is a property of the action and its orbit functors, not a choice of one subgroup for the entire category.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use the open-and-closed finite-wild exhaustion of the parameter stack.

Construction or proof:

1. Form each orbit functor.
2. Require a factorization and coherent comparison on that object.
3. Use the common refinement of finitely many cutoffs to compare choices.

Uses:

- X.0.1: Necessary support condition for the Weil-group universal theorem.
- X.1.3: Qualifies the Bun_G rational action.

API:

- `compactAction_factor` (characterisation): For each X there exist P, an exact orbit functor from Perf(Z^P/H) and an equivalence of its composite with the original orbit functor.
- `compactAction_refine` (functoriality): A factorization through P induces one through every smaller eligible P′ by restriction to the open-and-closed P piece.
- `compactAction_finite_sum` (compatibility): Finitely many compactly supported orbit functors have a common refined cutoff; in an exact action the direct sum orbit functor has that cutoff.

Unit tests:

- `compactAction_zero` (degenerate): The zero object orbit functor factors through every eligible piece.
- `compactAction_single_piece` (characterisation): An action obtained by restriction from a single finite-wild piece has compactly supported orbit functors for all objects.
- `compactAction_unbounded_family` (non-example): For the direct sum of categories Perf(k), indexed by parameters with unbounded wild conductor, finite-support objects have cutoffs but no one cutoff works for every object; its Ind product also has objects with no cutoff.

Acceptance:

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

Direct prerequisites: `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`.

Source: X opening p. 339. The verifier of RT-AREA-geomlanglands/6 assigns Chapter X universal action mathematics to ES2/ES3. The duplicate LP4 compact-support node is proposed for removal, while LP1 retains the geometric exhaustion.

Lean signature status: Ordinary observation declared; full enhanced signature pending.

Atlas planet: **Compactly supported action**.

### Hecke family from the universal parameter

`ExcursionOperatorsAndSpectralAction:ES2/universal-parameter-hecke-family` · construction · proposed name `universalHeckeFamily`

For H reductive over a characteristic-zero field L with finite Q action, and an anima S->BQ, evaluation S×Map_(BQ)(S,B(H semidirect Q))->B(H semidirect Q) produces, functorially in finite I, an exact Rep_L(Q^I)-linear monoidal functor Rep_L((H semidirect Q)^I)->Perf(Map_(BQ)(S,B(H semidirect Q)))^(S^I). Composition with an action yields its coherent Hecke family.

Hypotheses and interfaces:

- The target mapping stack and its Perf are the derived stacky constructions supplied by LP1; C is small stable idempotent complete L-linear.
- Use coherent total-space functoriality over Fin, not unrelated functors for each I.

Construction or proof:

1. Pull a representation bundle back along universal evaluation.
2. Take the I-fold tensor family and its coCartesian finite-set transport.
3. Compose with the exact monoidal action functor to recover the equivariant endofunctor family.

Uses:

- X.1.1: Defines the forward map from actions to coherent Hecke data.
- ES2/ES3 center agreement: Identifies the same excursion matrix coefficients in both constructions.

API:

- `universalHecke_eval` (projection): At (s,rho), the representation bundle is V evaluated on rho(s).
- `universalHecke_unit` (simp): The trivial representation produces the monoidal unit family.
- `universalHecke_fusion` (compatibility): The universal evaluation families intertwine tensoring legs along every finite-set map.
- `universalHecke_pullback` (functoriality): For S′->S over BQ the families agree under restriction of the universal parameter.

Unit tests:

- `universalHecke_empty` (degenerate): The empty-leg family is the tensor unit.
- `universalHecke_point` (compatibility): For Q=1 and S a point, the family is the tautological representation bundle on BH.
- `universalHecke_free_loop` (computation): For S=BF_1 with generator mapping to sigma in Q, the family on [H/H]_sigma has generator action h sigma on the representation, with twisted conjugation.

Acceptance:

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

Direct prerequisites: `LanglandsParameterStacks:LP1`, `LanglandsParameterStacks:LP4/rep-action-on-perf`, `EnhancedDerivedSheaves:E5:abstract`, `GeometricSatakeAndFusion:GS4:integral-dual-group`.

Source: X.1.1 pp. 341–342. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Ordinary observation declared; full enhanced signature pending.

### Rational universal action theorem

`ExcursionOperatorsAndSpectralAction:ES2/universal-action-theorem` · theorem · proposed name `universal_action_theorem`

For H reductive over a characteristic-zero field L with finite Q action, S any anima over BQ and C small idempotent-complete stable L-linear, the anima of L-linear actions of Perf(Map_(BQ)(S,B(H semidirect Q))) on C is equivalent to the anima of coherent finite-set exact Rep_L(Q^I)-linear monoidal families Rep_L((H semidirect Q)^I)->End_L(C)^(S^I). The forward map is universal evaluation; both composites are equivalent to the identity as maps of anima.

Hypotheses and interfaces:

- Exact representation categories freely generate their perfect-complex extensions as used in the source.
- Coherence is on the total coCartesian fibrations over Fin.

Construction or proof:

1. Both constructions send sifted colimits in S to limits of anima, using the rational colimit lemma.
2. Reduce to finite S and trivialize its Q-torsor to describe Perf(BH^S).
3. Use semisimplicity in characteristic zero and Yoneda to identify monoidal Rep(H^S) functors with the action.
4. Recover unit, tensor, finite-set and higher homotopy coherences by the universal property, then descend the Q-torsor.

Acceptance:

- Check S a point, S=BF_1 and a nontrivial Q-torsor.
- Prove equivalence of full coherent-data anima, rather than only their sets of isomorphism classes.
- No integral conclusion follows by inverting ell.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES2/universal-parameter-hecke-family`, `ExcursionOperatorsAndSpectralAction:ES2/mapping-stack-commutes-with-sifted-colimits`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `LanglandsParameterStacks:LP1`.

Source: X.1.1 pp. 341–342; Lemma X.1.2 pp. 342–343 for the proof. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Universal action theorem**.

### Colimits of rational mapping-stack Perf

`ExcursionOperatorsAndSpectralAction:ES2/mapping-stack-commutes-with-sifted-colimits` · theorem · proposed name `mapping_stack_commutes_with_sifted_colimits`

For the rational H,Q hypotheses, F(S)=Perf(Map_(BQ)(S,B(H semidirect Q))) preserves sifted colimits as a functor to L-linear small idempotent-complete stable infinity-categories, and preserves all colimits as a functor to symmetric monoidal such categories.

Hypotheses and interfaces:

- L has characteristic zero and H is reductive; pro-reductive quotient presentations are used only in the proof’s affine-quotient comparison.

Construction or proof:

1. Reduce to the untwisted Q case by the torsor description.
2. Express the mapping stacks by inverse limits of affine quotients with pro-reductive groups.
3. Use representation generation and vanishing higher cohomology of pro-reductive groups to compare Perf with the filtered colimit.
4. Check finite coproducts and pushouts using the separate affine-quotient pushout theorem.

Acceptance:

- Retain the distinction between the two target categories and their two colimit claims.
- The integral analogue for actual Perf(mapping stack) is not asserted.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES2/pushout-of-affine-quotients`, `LanglandsParameterStacks:LP1`, `EnhancedDerivedSheaves:E5:presentability`, `LanglandsParameterStacks:LP3`.

Source: X.1.2 pp. 342–343. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Rational colimit theorem**.

### Tensor product for affine quotient pushouts

`ExcursionOperatorsAndSpectralAction:ES2/pushout-of-affine-quotients` · theorem · proposed name `pushout_of_affine_quotients`

Let G be a pro-reductive affine group over a characteristic-zero field L acting on affine derived L-schemes X_0,X_1,X_2, with G-equivariant maps X_1->X_0<-X_2. The natural symmetric monoidal comparison Perf(X_1/G) tensor_(Perf(X_0/G)) Perf(X_2/G) -> Perf((X_1 times^derived_(X_0) X_2)/G) is an equivalence. The tensor product is the pushout in L-linear symmetric monoidal small stable idempotent-complete infinity-categories.

Hypotheses and interfaces:

- Use derived fiber products and the relative tensor product in the named target category.
- Pro-reductivity and characteristic zero supply the representation generation and exact invariants used by the proof.

Construction or proof:

1. Pass to Ind module categories over the equivariant coordinate algebras in IndPerf(BG).
2. Compute the relative tensor product by derived tensor product of these algebras.
3. Identify the compact objects using generation by representations; recover the symmetric monoidal equivalence.

Acceptance:

- For G=1 this is Perf(A_1) tensor_Perf(A_0) Perf(A_2) = Perf(A_1 tensor^derived_A0 A_2).
- For X_i=Spec L all maps are identities and the comparison is the unit equivalence.

Direct prerequisites: `EnhancedDerivedSheaves:E5:presentability`, `LanglandsParameterStacks:LP1`, `LanglandsParameterStacks:LP4`, `LanglandsParameterStacks:LP3`.

Source: X.1.2 proof p. 343. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Affine quotient pushout**.

### Rational spectral action on Bun_G

`ExcursionOperatorsAndSpectralAction:ES2/spectral-action-rational` · theorem · proposed name `spectral_action_rational`

For any field L over Q_ell(sqrt(q)), the coherent HS4 Hecke family gives a natural compactly supported L-linear action of Perf([Z^1(W_E,H)_L/H]) on D_lis(Bun_G,L)^omega, uniquely characterized as coherent data by its restriction along the universal representation families being the HS Hecke action.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- No ell restriction involving pi_1(H)_tors is imposed in this rational theorem.

Construction or proof:

1. For each compact A use the uniform wild cutoff, and restrict the family to a dense discrete W.
2. Apply the rational universal theorem and identify its mapping stack with the intrinsic cocycle quotient through LP.
3. Glue the finite-wild action using uniqueness and the open-and-closed transitions.
4. The orbit of each A factors through its cutoff, giving compact support.

Acceptance:

- Test the unit representation and a torus character.
- Test the direct sum of two compacts using a common refined cutoff.
- Do not infer full faithfulness of the action functor or categorical LLC.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES2/universal-action-theorem`, `ExcursionOperatorsAndSpectralAction:ES2/compactly-supported-actions`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `LanglandsParameterStacks:LP1`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`.

Source: X.1.3 p. 343. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Rational spectral action**.

### Agreement of action and excursion centers

`ExcursionOperatorsAndSpectralAction:ES2/degree-zero-center-agreement` · theorem · proposed name `degree_zero_center_agreement`

In the rational coefficient range, the map from degree-zero functions on the parameter stack to Z_enh(D_lis) induced by the spectral action equals the IX.5.2 spectral-center map. Pulling representation bundles along universal evaluation recovers exactly the normalized Satake/Hecke operations, including the chosen square root of q.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.

Construction or proof:

1. On every finite-wild piece compare the action of each universal invariant matrix coefficient with its creation–Weil–annihilation operator.
2. Use the LP invariant presentation to conclude equality of algebra maps.
3. Glue along component and cutoff comparisons and extend to Ind via the enhanced-center restriction equivalence.

Acceptance:

- Check the scalar and component idempotent maps.
- Use the ES1:spectral-center prerequisite explicitly.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES2/spectral-action-rational`, `ExcursionOperatorsAndSpectralAction:ES2/universal-parameter-hecke-family`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`.

Source: X.1.3 p. 343; IX.5.2 p. 329. A roadmap-added comparison deduced from FS’s uniqueness and the two constructions’ shared excursion generators; not a separately numbered assertion in FS.

Lean signature status: Full signature omitted pending actual supplier types.

### Whittaker sheaf

`ExcursionOperatorsAndSpectralAction:ES2/whittaker-sheaf` · construction · proposed name `whittakerSheaf`

For G quasisplit with a specified Whittaker datum (B,U,psi) imported from SR, define W_psi=j_! [c-Ind_(U(E))^(G(E)) psi] in D_lis(Bun_G,Lambda), supported on the open trivial stratum Bun_G^1. Compact induction means support compact modulo the closed unipotent subgroup, not induction from a compact open subgroup. The construction alone does not assert compactness of W_psi or categorical LLC.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use coefficients containing the values of the smooth generic character psi. The rational source uses Qbar_ell; the integral conjectural context uses O_L[1/|pi_0 Z(G)|].

Construction or proof:

1. Use SR.2’s compact induction for the closed subgroup U(E).
2. Apply the VS4 stratum equivalence and its j_! embedding.
3. Record its restriction and supported extension; extend the spectral action to W_psi via Ind in its eligible range.

Uses:

- X.1.4 and X.3.5 statement register: Specifies the object on which the conjectural spectral-to-geometric equivalence is based.
- X.1 pp. 345–346: The source defines Aut_phi as E_phi acting on this sheaf.

API:

- `whittakerSheaf_restrict` (projection): Restriction to Bun_G^1 is c-Ind_U(E)^G(E) psi via the smooth-stratum equivalence.
- `whittakerSheaf_support` (characterisation): Its restriction to the complement of the trivial stratum is zero.
- `whittakerSheaf_datum_iso` (functoriality): An isomorphism of the imported Whittaker data inducing the SR compact-induction intertwiner yields the corresponding sheaf isomorphism.
- `whittakerSheaf_ind_action` (compatibility): The colimit-preserving extension of an eligible compact spectral action acts on W_psi; no compactness assertion is needed.

Unit tests:

- `whittakerSheaf_torus` (computation): For a torus U=1 and psi=1, W_psi is extension by zero of the regular compactly supported smooth function representation c-Ind_1^T(E) Lambda, not the one-dimensional trivial representation.
- `whittakerSheaf_trivial_group` (degenerate): For G=1, W_psi is the constant rank-one Lambda object on its unique stratum.
- `whittakerSheaf_stratum` (compatibility): Applying j^* to W_psi returns exactly the SR compact induction, including its right-translation convention.

Acceptance:

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

Direct prerequisites: `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`, `VStackSheavesAndLisseCategories:VS4`, `EnhancedDerivedSheaves:E5:presentability`.

Source: X.1 pp. 343–344; X.3.5 p. 350. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Ordinary observation declared; full enhanced signature pending.

Atlas planet: **Whittaker sheaf**.

## ES3

Integrally, actual Perf of the mapping stack need not preserve sifted colimits. Animate the finite Q-torsor-set functor to obtain F^natural and its canonical comparison to actual Perf. This categorical approximation already has the universal Hecke-data theorem without the good-prime restriction.

Highest-weight theory over the DVR proves the approximation preserves all colimits. For a free group its comparison is fully faithful with image generated by representations, and the quotient action is twisted by the generator images in Q. The animated free-group resolution computes the discrete-group approximation as compact modules over its equivariant coordinate colimit. Only then does LP4’s integral generation theorem identify this approximation with all Perf in the good-prime range.

Apply the discrete result to each finite-wild quotient and glue to obtain X.0.1, including its Bun_G specialization. The DVR hypothesis ell not dividing |pi_1(H)_tors| stays at this comparison step and at the resulting integral action. Rationalization compares to ES2. Derived reduction has its own explicit Perf and geometric-category comparison hypotheses; an arbitrary coefficient ring is not asserted to satisfy X.0.1. The coefficient, pinned quotient and wild cutoff diagrams compare the same normalized universal kernels.

Coverage: **planned**. Refinement contract: LP3 DVR highest-weight filtration, E5 animated free-group resolution, and qualified LP/VS/HS derived scalar-extension comparisons.

### Sifted-colimit approximation

`ExcursionOperatorsAndSpectralAction:ES3/sifted-colimit-approximation` · definition · proposed name `perfApprox`

Over a discrete valuation ring R and a split reductive H/R with finite Q action, let F^natural be the sifted-colimit-preserving extension to anima/BQ of the restriction S |-> Perf(Map_(BQ)(S,B(H semidirect Q))) on finite sets with Q-torsors. There is a canonical comparison kappa_S:F^natural(S)->F(S). This is a categorical approximation, not an asserted new mapping scheme, and need not equal F(S) integrally.

Hypotheses and interfaces:

- The animation/Lan construction takes values in R-linear symmetric monoidal small stable idempotent-complete infinity-categories.

Construction or proof:

1. Use the free sifted-colimit presentation of anima/BQ by finite Q-torsor sets.
2. Extend the finite-set functor by its sifted left Kan extension.
3. The universal property induces kappa to the actual mapping-stack Perf functor.

Uses:

- X.3.1: The correct universal category for integral coherent Hecke data.
- X.3.3–X.3.4: Computed by equivariant coordinate-algebra modules before the good-prime comparison.

API:

- `perfApprox_finite` (equivalence): For S a finite Q-torsor set, kappa_S is the prescribed identification with F(S).
- `perfApprox_compare` (projection): kappa is a natural symmetric monoidal comparison to actual mapping-stack Perf.
- `perfApprox_lift` (universal-property): For a sifted-colimit-preserving target functor, transformations out of F^natural are uniquely determined as anima by their restriction to finite Q-torsor sets.
- `perfApprox_evaluation` (compatibility): Universal representation evaluation extends by animation and recovers its finite-set version.

Unit tests:

- `perfApprox_empty` (degenerate): At the empty anima, F^natural is Perf(R), the monoidal unit category.
- `perfApprox_point` (compatibility): For Q=1 and S a point, kappa identifies F^natural(S) with Perf(BH).
- `perfApprox_rational` (characterisation): After the valid characteristic-zero scalar extension, the approximation agrees with actual mapping-stack Perf by X.1.2.

Acceptance:

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

Direct prerequisites: `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `LanglandsParameterStacks:LP1`, `EnhancedDerivedSheaves:E5:animation`.

Source: X.3 pp. 348–349. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Sifted-colimit approximation**.

### Integral universal action on the approximation

`ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action` · theorem · proposed name `integral_universal_action`

For the DVR H,Q,S hypotheses of F^natural and C small stable idempotent-complete R-linear, the anima of R-linear F^natural(S)-actions on C is equivalent to the anima of coherent finite-set exact Rep_R(Q^I)-linear monoidal families Rep_R((H semidirect Q)^I)->End_R(C)^(S^I). Evaluation is defined on finite sets and then animated. No good-prime hypothesis is needed for this approximation theorem.

Hypotheses and interfaces:

- Do not replace F^natural by actual Perf(mapping stack) before applying the generation theorem.

Construction or proof:

1. Repeat the rational universal argument on finite Q-torsor sets using the exact representation-category perfect extension.
2. Animate both sides; mapping into C turns sifted colimits into limits.
3. Identify the two coherent-data maps and their higher inverse comparisons.

Acceptance:

- Compare the point and empty-leg cases.
- At an excluded good-prime the approximation still has this universal property.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES3/sifted-colimit-approximation`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `LanglandsParameterStacks:LP3`.

Source: X.3.1 pp. 348–349. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Integral universal action**.

### Colimits of the integral approximation

`ExcursionOperatorsAndSpectralAction:ES3/approximation-commutes-with-colimits` · theorem · proposed name `approximation_commutes_with_colimits`

F^natural preserves all colimits from anima/BQ to R-linear symmetric monoidal small stable idempotent-complete infinity-categories. In addition to its defining sifted-colimit property, the required finite coproduct comparison is Perf(BH^S1) tensor_Perf(R) Perf(BH^S2) ≃ Perf(BH^(S1 disjoint union S2)).

Hypotheses and interfaces:

- R is a DVR and H/R split reductive.
- The highest-weight filtration over the DVR is requested from LP3, not inferred from the rational semisimplicity proof.

Construction or proof:

1. Use the sifted Kan-extension description.
2. For finite sets prove the disjoint-union tensor identity by the highest-weight filtration of Perf(BH) into copies of Perf(R).
3. Use the animation universal property to deduce all colimits in the symmetric monoidal target.

Acceptance:

- The argument uses DVR highest-weight theory without inverting ell.
- At H=1 the functor is constantly Perf(R), the initial symmetric monoidal R-linear category.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES3/sifted-colimit-approximation`, `LanglandsParameterStacks:LP3`, `EnhancedDerivedSheaves:E5:presentability`.

Source: X.3.2 p. 349. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Integral colimit theorem**.

### Free-group comparison

`ExcursionOperatorsAndSpectralAction:ES3/free-group-case` · theorem · proposed name `free_group_case`

For S=BF_n->BQ with generator images sigma_1,...,sigma_n, kappa_S is fully faithful with image the thick idempotent-complete stable subcategory generated by Rep_R(H). The actual mapping quotient is [H^n/H] with h acting by (g_i |-> h g_i sigma_i(h)^(-1)); F^natural(BF_n) identifies with compact modules over O(H^n) in IndPerf(BH) with that twisted action. No assertion that this image is all actual Perf is made without the generation input named in its prerequisites.

Hypotheses and interfaces:

- Use the DVR and split reductive hypotheses; n can be zero.

Construction or proof:

1. Present BF_n by circles and the all-colimits theorem.
2. For one circle compute the relative tensor of Perf(BH) over Perf(BH^2) along the diagonal and twisted diagonal.
3. Use the supplied module-category/Barr–Beck comparison and extend to n generators.
4. Read off full faithfulness and the representation-generated essential image.

Acceptance:

- At n=0 obtain Perf(BH).
- At n=1 with nontrivial sigma check twisted rather than ordinary conjugation.
- Fully faithful comparison here is not full faithfulness of the Bun_G action functor.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES3/approximation-commutes-with-colimits`, `EnhancedDerivedSheaves:E5:presentability`, `LanglandsParameterStacks:LP3`, `LanglandsParameterStacks:LP1`.

Source: X.3.3 pp. 349–350. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Free-group comparison**.

### Discrete-group module presentation

`ExcursionOperatorsAndSpectralAction:ES3/discrete-group-presentation` · theorem · proposed name `discrete_group_presentation`

For a discrete group Gamma->Q, present BGamma as the sifted colimit of BF_n over homomorphisms F_n->Gamma in anima/BQ. Then F^natural(BGamma) is the category of compact modules over colim_(n,F_n->Gamma) O(H^n) in IndPerf(BH), with the generator twists induced by Gamma->Q.

Hypotheses and interfaces:

- The colimit algebra is computed in the animated equivariant algebra category; a degree-zero invariant-ring colimit does not substitute for it.

Construction or proof:

1. Use the free-group sifted resolution of the group anima.
2. Apply the approximation colimit theorem.
3. Use the free-group module comparison and the compatibility of compact module categories with the filtered/sifted algebra presentation as supplied by E5.

Acceptance:

- For Gamma=F_n recover the free-group case.
- For a nontrivial relation use the animated colimit, retaining derived information.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES3/free-group-case`, `ExcursionOperatorsAndSpectralAction:ES3/approximation-commutes-with-colimits`, `EnhancedDerivedSheaves:E5:presentability`, `EnhancedDerivedSheaves:E5:animation`.

Source: X.3.4 p. 350. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Discrete-group presentation**.

### Integral discrete-group action comparison

`ExcursionOperatorsAndSpectralAction:ES3/discrete-integral-spectral-action` · theorem · proposed name `discrete_integral_spectral_action`

Let Lambda be the integers of a finite extension of Q_ell(sqrt(q)), and ell not divide |pi_1(H)_tors|. For the discrete tame W with its pinned map to Q, kappa_BW identifies F^natural(BW) with Perf([Z^1(W,H)_Lambda/H]). Consequently its action anima is equivalent to the coherent finite-set Hecke-data anima of X.0.2.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- This comparison is the point where the good-prime integral generation input is used.

Construction or proof:

1. Identify the animated coordinate colimit in the discrete-group presentation with LP4’s cocycle module algebra.
2. Use VIII.5.1 generation/module comparison to identify all Perf, not just the representation-generated image.
3. Compose with the approximation universal action theorem.

Acceptance:

- Record ell not dividing the dual fundamental-group torsion in the theorem signature.
- No proof step rationalizes to establish integral generation.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES3/discrete-group-presentation`, `ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`.

Source: X.0.2 p. 340; X.3 closing p. 350; VIII.5.1 p. 293. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

### Integral spectral action on Bun_G

`ExcursionOperatorsAndSpectralAction:ES3/integral-spectral-action` · theorem · proposed name `integral_spectral_action`

Under the X.0.1 coefficient hypotheses (Lambda the integers of a finite extension of Q_ell(sqrt(q)), ell != p and ell not dividing |pi_1(H)_tors|), the anima of compactly supported Perf([Z^1(W_E,H)_Lambda/H])-actions on a small idempotent-complete stable Lambda-linear C is equivalent to its coherent continuous Weil-equivariant finite-set Hecke-data anima. Applied to HS4 on C=D_lis(Bun_G,Lambda)^omega, it constructs the integral spectral action. The rational variant holds for all ell != p.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- For the general C version, use its relatively discrete condensed enrichment as in the reduction via IX.5.1; E5 must supply the finite-wild factorization of its Hecke orbit data.

Construction or proof:

1. Factor each compact Hecke orbit through a uniform finite-wild quotient by the IX.5.1 argument.
2. Choose W and use the discrete integral action comparison.
3. Use intrinsic cocycle restriction/extension and glue over finite-wild pieces with coherent uniqueness.
4. Specialize to the actual HS family and its normalized kernels.

Acceptance:

- Give both the abstract equivalence and its Bun_G specialization.
- Test rationalization against X.1.3 using the same Hecke family.
- At an excluded prime retain the approximation and excursions, without asserting this comparison.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES3/discrete-integral-spectral-action`, `ExcursionOperatorsAndSpectralAction:ES2/compactly-supported-actions`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `EnhancedDerivedSheaves:E5:abstract`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`.

Source: X.0.1 pp. 339–340; X.3 closing p. 350. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Integral spectral action**.

### Compatibility of integral action comparisons

`ExcursionOperatorsAndSpectralAction:ES3/action-change-of-data` · theorem · proposed name `action_change_of_data`

For the integral action, extension of DVR coefficient rings satisfying X.0.1, refinement of the finite pinned quotient, and shrinking finite-wild cutoffs induce the corresponding comparison functors. Whenever the LP stack/Perf base-change and HS kernel comparison functors are supplied, the two actions are coherently equivalent because their universal representation families coincide. These comparisons satisfy identity, composition and pairwise commutation. The induced degree-zero function action agrees with IX.5.2 in its eligible center range.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Both integral endpoints retain ell not dividing |pi_1(H)_tors|.
- This is a comparison of actions through the supplied base-change functors, not an unrestricted assertion Perf commutes with every scalar tensor product.

Construction or proof:

1. Compare the normalized HS kernels and universal evaluation on generators.
2. Apply the equivalence of coherent-data anima to lift that comparison uniquely to the action.
3. Use its functorial inverse to prove coherence of identity and composite comparisons.
4. For degree zero repeat the generator proof of the rational center agreement in the eligible invariant range.

Acceptance:

- Check the identity extension, a tower of extensions and changing Q before/after shrinking P.
- Retain the separate center-order hypothesis when comparing centers.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES3/integral-spectral-action`, `ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action`, `ExcursionOperatorsAndSpectralAction:ES2/universal-parameter-hecke-family`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`.

Source: X.0.1 pp. 339–340; X.3.1 pp. 348–349. The roadmap asks for these coherence diagrams. FS provides their universal action characterization; the precise LP and HS base-change interfaces are requested.

Lean signature status: Full signature omitted pending actual supplier types.

### Derived coefficient reduction and rationalization

`ExcursionOperatorsAndSpectralAction:ES3/derived-reduction-and-rationalization` · theorem · proposed name `derived_reduction_and_rationalization`

Let the integral action be given. For a coefficient map Lambda->B and the supplied relative tensor-product category C_B and pullback functor Perf(Z_Lambda/H)->Perf(Z_B/H), when the stacky Perf scalar-extension comparison is an equivalence, tensoring the action constructs a B-linear action on C_B that induces the scalar-extended HS family. This includes rationalization and, with the supplied derived reduction/Perf comparisons, B=Lambda/ell. It does not assert X.0.1 anew for arbitrary B or identify C_B with the geometric D_lis(Bun_G,B) without its supplier comparison.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use derived tensor products. Identify the scalar-extended geometric category only in the cases established by VS and HS.

Construction or proof:

1. Tensor the exact monoidal action as a module-category action.
2. Use the assumed supplier comparison of parameter-stack Perf and universal representations.
3. For rationalization apply uniqueness in X.1.3; for derived reduction identify the restricted Hecke family via the explicit HS comparison.

Acceptance:

- Do not substitute ordinary reduction for derived reduction.
- Record precisely the required scalar-extension equivalences before identifying either geometric category.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES3/action-change-of-data`, `ExcursionOperatorsAndSpectralAction:ES2/spectral-action-rational`, `EnhancedDerivedSheaves:E5:presentability`, `LanglandsParameterStacks:LP1`, `VStackSheavesAndLisseCategories:VS3`, `HeckeStacksAndLocalShtukas:HS1`.

Source: X.0.1 pp. 339–340; IX.2 pp. 321–322. A conditional roadmap coefficient-comparison target; the supplied higher-category base-change equivalences are open requests rather than unproved theorem fields.

Lean signature status: Full signature omitted pending actual supplier types.

## ES4

The support here is reduced central support V(Ann(A)) in the spectrum of a finite-wild invariant coordinate ring. It is an added infrastructure definition built from the center action and pinned prime-spectrum operations. It is neither support in the full derived stack nor nilpotent singular support.

In an exact triangle, the product of the endpoint annihilator ideals kills the middle object; their intersection alone need not. This gives the support-union bound. A compatible coefficient extension gives a support containment. Equality needs flatness and the actual endomorphism base-change isomorphism. Single-function localization is obtained through the Ind telescope; compactness turns vanishing there into a power of the function killing the identity. Idempotent localization recovers the already constructed component factors.

Duality uses the lisse BZ equivalence and Satake switching/Chevalley comparison, including its inner correction before quotienting. For local shtukas, transport excursions through HS3’s multi-leg Hecke comparison and keep the two smooth group actions in their level and tower domains. Compactness at pro-p level does not give a common wild cutoff on the whole tower.

Ellipticity requires semisimplicity and a finite centralizer modulo the fixed dual center. Its unramified twists form a parameter component, retaining its stabilizer stack. The basic/supercuspidal structural consequence imports ES7’s proved parabolic factorization. The proposed packet bijection and t-exact equivalence are recorded conjectures, not conclusions of the action theorem.

Coverage: **planned**. Refinement contract: Lisse VS5 duality, full multi-leg HS3 comparison, elliptic deformation proof refinement and qualified endomorphism base-change.

### Finite-wild central support

`ExcursionOperatorsAndSpectralAction:ES4/finite-wild-central-support` · definition · proposed name `centralSupport`

For a compact A with eligible cutoff P in the invariant-coordinate range, let R_P=Gamma([Z^1(W_E/P,H)_Lambda/H],O) act through the center. Define Ann_P(A)={f in R_P : f_A=0 in pi_0 End(A)} and Supp_P(A)=V(Ann_P(A)) in Spec R_P. This is reduced support on the affine invariant quotient, not support in the full derived stack and not nilpotent singular support. A smaller cutoff compares these supports by the open-and-closed parameter embedding and the compatible center action.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- The center-order condition is imposed whenever R_P is used. Without it an analogous support can be formed for the excursion algebra, with comparison of underlying points through the universal homeomorphism.

Construction or proof:

1. Evaluate the central ring action on A and take its kernel ideal.
2. Take its zero locus using pinned PrimeSpectrum.
3. Use the LP finite-wild coordinate comparison to transport the underlying closed set between eligible pieces.

Uses:

- ES4 support laws: Defines support for the exact-operation and localization claims.
- ES1 component decomposition: Tests support against the already proved component idempotents.

API:

- `centralAnnihilator_mem` (characterisation): f belongs to Ann_P(A) iff the central endomorphism f_A is zero.
- `centralSupport_mem` (characterisation): x belongs to Supp_P(A) iff Ann_P(A) is contained in the prime ideal x.
- `centralSupport_iso` (functoriality): Isomorphic objects have the same annihilator ideal and support.
- `centralSupport_idempotent` (compatibility): For an idempotent e, support of the e-summand lies in the clopen locus where e=1, and support of the (1-e)-summand lies where e=0.

Unit tests:

- `centralSupport_zero` (degenerate): The zero object has annihilator R_P and empty support.
- `centralSupport_free` (computation): For C=Perf(R_P) with its scalar action, the rank-one module R_P has annihilator zero and support all Spec R_P.
- `centralSupport_nilpotent` (computation): For R=k[epsilon]/(epsilon^2), take C=Perf(k) with its R-linear action through R->k and A=k, which is compact in C. Then Ann_R(A)=(epsilon) but Supp_R(A)=Spec R as an underlying set; the support does not retain the nilpotent thickening. Do not take k to be a perfect R-module.

Acceptance:

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.
- At degree zero, compute the scalar action on the concrete rank-one ModuleCat module. For the dual numbers compose its projection to k with the scalar center of ModuleCat(k), obtaining annihilator (epsilon) and full reduced spectrum. These are observations of the Perf tests, not an identification of ModuleCat with Perf.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/center-on-finite-wild-pieces`, `mathlib:Ideal`, `mathlib:PrimeSpectrum`, `mathlib:PrimeSpectrum.zeroLocus`, `mathlib:PrimeSpectrum.mem_zeroLocus`, `mathlib:RingHom.ker`, `mathlib:RingHom.mem_ker`, `mathlib:ModuleCat.of`, `mathlib:DualNumber`, `mathlib:TrivSqZeroExt.fstHom`.

Source: IX.5 pp. 328–329; Mathlib RingTheory/Spectrum/Prime/Basic.lean at 082e2d3. This is a roadmap-added central annihilator support built from the FS center action and the pinned zero-locus definition. It is not attributed to FS VIII.2’s singular-support formalism. zeroLocus, mem_zeroLocus, zeroLocus_mul, zeroLocus_inf, zeroLocus_radical. Supplies the existing closed-set and radical ideal operations used by this central support, not enhanced sheaf geometry.

Lean signature status: Ordinary observation declared; full enhanced signature pending.

Atlas planet: **Central support**.

### Support under exact operations

`ExcursionOperatorsAndSpectralAction:ES4/support-exact-operations` · theorem · proposed name `support_exact_operations`

For the fixed central R_P action, support is invariant under isomorphism and shifts, support of a finite direct sum is the union, and a retract has support contained in that of its source. For an exact triangle A->B->C->A[1], Supp(B)⊂Supp(A) union Supp(C), and the cyclic variants hold. Algebraically Ann(A) Ann(C)⊂Ann(B), rather than an assertion that Ann(A) intersect Ann(C) annihilates B.

Hypotheses and interfaces:

- The stable action is exact and the central transformations commute coherently with suspension and triangles.
- On the homotopy category use the supplied pretriangulated structure, additive integer shifts and the actual ring map to CatCenter. Require its components to commute with each shift functor; ordinary naturality alone does not supply suspension compatibility.

Construction or proof:

1. Use naturality and retract maps for the annihilator comparison.
2. Use the distinguished-triangle Hom exactness supplied by Pretriangulated.Triangle.yoneda_exact₂: if f kills A, naturality gives A->B followed by f_B equal to zero, so f_B factors as B->C->B. If g kills C, naturality then makes g_B composed with f_B zero. Extend to the product of the endpoint ideals.
3. Pass from the product-ideal containment to zero loci and use the pinned radical/product formulas.
4. Use the biproduct projections/inclusions to identify the direct-sum annihilator intersection.
5. Rotate the distinguished triangle, using the specified shift compatibility for the two other support inclusions. Iterate the binary biproduct law for finite sums; the empty sum uses the zero-object law.

Acceptance:

- For 0->k->k[epsilon]/epsilon^2->k->0 over k[epsilon]/epsilon^2, epsilon kills the endpoints but need not kill the middle; epsilon^2 does.
- Check zero and finite direct sums.
- If both endpoint identities are zero, the distinguished triangle has empty middle support. The Lean example support_triangle_zero_ends states this on an actual triangle without assuming the annihilator-product conclusion.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES4/finite-wild-central-support`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:PrimeSpectrum.zeroLocus_mul`, `mathlib:PrimeSpectrum.zeroLocus_inf`, `mathlib:CategoryTheory.Pretriangulated.Triangle`, `mathlib:CategoryTheory.Pretriangulated`, `mathlib:CategoryTheory.Pretriangulated.Triangle.yoneda_exact₂`, `mathlib:CategoryTheory.shiftFunctor`, `mathlib:CategoryTheory.Limits.biprod`.

Source: IX.5 p. 329; Mathlib Prime/Basic zeroLocus_mul and zeroLocus_inf. Elementary consequences of the defined central action, not a separate source theorem. The triangle product-ideal argument is supplied explicitly. zeroLocus, mem_zeroLocus, zeroLocus_mul, zeroLocus_inf, zeroLocus_radical. Supplies the existing closed-set and radical ideal operations used by this central support, not enhanced sheaf geometry.

Lean signature status: Full generic homotopy-category operation statement; D_lis enhanced instantiation pending.

### Support under coefficient change

`ExcursionOperatorsAndSpectralAction:ES4/support-coefficient-change` · theorem · proposed name `support_coefficient_change`

Given compatible central actions for a ring map R->S and an exact scalar-extension functor A |-> A_S, the ideal Ann_R(A)S annihilates A_S, hence Supp_S(A_S) is contained in the inverse image of Supp_R(A). If S is flat over R and the natural degree-zero endomorphism base-change map End(A) tensor_R S -> End(A_S) is an isomorphism carrying id_A to id_(A_S), then Ann_S(A_S)=Ann_R(A)S and the support containment is equality. In the derived nonflat case only the compatible-action containment is asserted.

Hypotheses and interfaces:

- The End comparison is an explicit supplier hypothesis, not inferred for every lisse object.

Construction or proof:

1. Apply the comparison functor to an annihilating central transformation.
2. For the equality case tensor the kernel sequence R->End(A) with the flat S module.
3. Identify the resulting evaluation map S->End(A_S) and use the inverse-image formula for Spec.

Acceptance:

- Keep the flatness and actual endomorphism comparison hypotheses in the equality statement.
- For reduction modulo ell do not assert equality merely from exactness of the categorical action.
- The suggested compatible-action functor statement centralSupport_map encodes the unconditional containment only. The flat endomorphism-tensor comparison and resulting equality are still absent from Lean.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES4/finite-wild-central-support`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/center-change-of-data`, `ExcursionOperatorsAndSpectralAction:ES3/derived-reduction-and-rationalization`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:PrimeSpectrum.comap`.

Source: IX.5.2 p. 329; X.0.1 pp. 339–340. Roadmap-added elementary support comparison. The stronger equality is deliberately qualified by the exact algebraic kernel hypotheses. zeroLocus, mem_zeroLocus, zeroLocus_mul, zeroLocus_inf, zeroLocus_radical. Supplies the existing closed-set and radical ideal operations used by this central support, not enhanced sheaf geometry.

Lean signature status: Full signature omitted pending actual supplier types.

### Central localization and component summands

`ExcursionOperatorsAndSpectralAction:ES4/central-localization` · theorem · proposed name `central_localization`

For a small idempotent-complete stable R-linear action category C and f in R, localize Ind(C) at the telescope of multiplication by f and take compact objects, with the necessary idempotent completion. A compact A maps to zero iff f^n id_A=0 for some n, equivalently Supp_R(A)⊂V(f). The localized center action sends f to an invertible transformation. For idempotent e the localization is the e-summand already supplied by component decomposition. This does not identify arbitrary closed substacks with a category of sheaves on them.

Hypotheses and interfaces:

- E5 supplies the exact central localization/relative tensor product and telescope mapping formula.

Construction or proof:

1. Extend the action to Ind(C), then form the f-inverting localization.
2. Compactness identifies Hom(A,A[f^-1]) with the f-directed colimit, so the image of id vanishes iff some f^n id does.
3. Use the pinned radical zero-locus criterion to identify support in V(f).
4. For e^2=e compare with the split idempotent projector.

Acceptance:

- For C=Perf(R), localization agrees with Perf(R[f^-1]).
- For f=1 the kernel is zero; for f=0 every object maps to zero.
- For an idempotent recover the two component factors.
- The suggested centralSupport_subset_principal_iff states only the radical/power criterion. A category with an actual telescope localization and its compact-kernel comparison is still required.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES4/finite-wild-central-support`, `ExcursionOperatorsAndSpectralAction:ES4/support-exact-operations`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:PrimeSpectrum.zeroLocus_radical`, `mathlib:PrimeSpectrum.zeroLocus_subset_zeroLocus_iff`.

Source: IX.5 pp. 328–329; X.0 p. 339; Mathlib Prime/Basic zero-locus radical criterion. The source supplies the idempotent case; general single-function localization is the explicit E5-backed roadmap obligation.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Central localization**.

### Duality of the center action

`ExcursionOperatorsAndSpectralAction:ES4/duality-and-the-chevalley-involution` · theorem · proposed name `duality_and_the_chevalley_involution`

In the eligible center range, Bernstein–Zelevinsky duality induces D_geom on the enhanced geometric center. The pinned Chevalley involution induces D_spec on the spectral center. The square D_geom composed with Z_spec->Z_geom equals Z_spec->Z_geom composed with D_spec commutes. The inner correction by rho-hat(-1) in VI.12.1 disappears on the conjugation quotient. This proves the center diagram; general smooth-dual parameter compatibility imports the ES7 parabolic return.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use the lisse compact BZ-duality equivalence, not only the etched-sheaf Verdier statements currently written in the supplier packet.

Construction or proof:

1. Pull creation, annihilation and the Weil action through BZ duality.
2. Use the geometric Satake switching comparison VI.12.1, retaining the inner correction before taking the quotient.
3. Evaluate invariant coefficients and conclude equality on the spectral generators.

Acceptance:

- For GL_n the parameter involution is contragredient.
- Retain the inner correction before quotienting.
- Do not use the unproved general center/homotopy-center isomorphism.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`, `VStackSheavesAndLisseCategories:VS5`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`.

Source: IX.5.3 pp. 329–330; VI.12.1 pp. 239–241. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Duality and Chevalley involution**.

### Excursions on local shtuka cohomology

`ExcursionOperatorsAndSpectralAction:ES4/local-shtuka-excursion-compatibility` · theorem · proposed name `local_shtuka_excursion_compatibility`

For HS3’s local-shtuka complex identified as i_b^* T_V(j_! c-Ind_K^G(E) Lambda), with the stated normalization and K pro-p for compactness, transport the ES0 excursion operators through that comparison. At each level they commute with the smooth G_b(E) action, and under the tower’s Hecke transition correspondences they commute with the G(E) action on the tower colimit. Their products commute with each other by the excursion algebra, and their Weil action retains the HS3 continuity. No assertion of one finite-wild cutoff for the noncompact tower colimit is made.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- HS3 supplies the general multi-leg local-shtuka/Hecke comparison IX.3.2, not only the minuscule E=Q_p compactness theorem IX.3.1.

Construction or proof:

1. Apply the natural central transformations to the HS compact induced Hecke object.
2. Restrict through the stratum comparison; naturality implies equivariance for the smooth G_b(E) action.
3. Use compatibility of the level/tower correspondences with the HS kernels to obtain the G(E) commutation.
4. Use the algebra map and the condensed enrichment for commuting products and continuity.

Acceptance:

- Test the trivial Hecke representation and level transition for a pro-p K.
- State both smooth group actions in their correct level/tower domains.
- No unrestricted compactness or wild cutoff on the whole tower is inferred.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`, `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`, `HeckeStacksAndLocalShtukas:HS3`, `HeckeStacksAndLocalShtukas:HS3/compactness-of-shtuka-cohomology`, `HeckeStacksAndLocalShtukas:HS3/admissibility-duality-and-adjunction`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`.

Source: IX.3.1–IX.3.2 pp. 324–327; I.9 pp. 35–36. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Local shtuka excursions**.

### Elliptic L-parameters

`ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameters-and-components` · definition · proposed name `ellipticParameter`

For an algebraically closed characteristic-zero coefficient field L, a continuous parameter phi with the prescribed pinned Weil projection is elliptic if it is semisimple and S_phi/Z(H)^Gamma is finite, where S_phi is the H-centralizer of the full twisted parameter. The centralizer is a group scheme; quotienting the centralizer by the fixed center removes the central stabilizer from the finiteness test. Unramified central twists still vary the parameter in its connected component. The connected-component assertion is a separate theorem.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use LP2’s semisimplicity/G-complete reducibility notion, not merely that Frobenius is diagonalizable.

Construction or proof:

1. Form the twisted parameter centralizer supplied by LP.
2. Take its quotient by the Weil-fixed center and require finiteness in addition to semisimplicity.

Uses:

- X.2: Defines the unramified-twist component and its basic-stratum consequences.
- X.2.2 statement register: States precisely the conjectural elliptic packet equivalence.

API:

- `ellipticParameter_iff` (characterisation): Ellipticity means semisimplicity and finiteness of the specified centralizer quotient.
- `ellipticParameter_conjugate` (functoriality): Conjugation of phi identifies its centralizer quotient and preserves ellipticity.
- `ellipticParameter_central_twist` (compatibility): An eligible unramified central twist has the same centralizer and preserves ellipticity.

Unit tests:

- `ellipticParameter_torus` (computation): For a torus with its pinned Weil action, S_phi=H^Gamma, so every semisimple parameter has trivial centralizer quotient and is elliptic.
- `ellipticParameter_GL2_trivial` (non-example): For split GL_2 and the trivial two-dimensional parameter, S_phi/Z(H)=PGL_2 is positive dimensional, so the parameter is not elliptic.
- `ellipticParameter_GLn_irreducible` (characterisation): For split GL_n over L, an irreducible Weil representation has scalar centralizer and is elliptic; a semisimple reducible representation has a positive-dimensional centralizer modulo scalars.

Acceptance:

- Verify the full statement, including its coefficient and continuity hypotheses.
- Check the displayed construction on the unit and its compatibility with the cited supplier maps.

Direct prerequisites: `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`, `LanglandsParameterStacks:LP1`, `GeometricSatakeAndFusion:GS4:integral-dual-group`.

Source: X.2.1 p. 346. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Elliptic L-parameters**.

### Component of an elliptic parameter

`ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameter-component` · theorem · proposed name `elliptic_parameter_component`

For elliptic phi over Qbar_ell, its unramified central twists form the connected component C_phi of the parameter stack. The associated clopen idempotent in the excursion/invariant coordinate ring defines the summand D_lis^(C_phi), on which that idempotent acts as identity. If Z(H)^Gamma is finite then C_phi=BS_phi as a stack, not an ordinary point with trivial stabilizer.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Use the LP deformation complex and local Tate duality in its exact Weil-group coefficient range.

Construction or proof:

1. Show H^2(W_E,ad phi)=0 by Tate duality and ellipticity.
2. Use H^0=Lie Z(H)^Gamma and the unramified-twist tangent calculation to identify the full component; quotient by the centralizer retains stack inertia.
3. Apply the component idempotent theorem and its excursion-only variant.

Acceptance:

- For GL_n irreducible phi, retain the scalar unramified-twist direction.
- When the fixed center is finite retain BS_phi, rather than deleting its stabilizer.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameters-and-components`, `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`.

Source: X.2.1 pp. 346–347. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

### Basic decomposition of an elliptic component

`ExcursionOperatorsAndSpectralAction:ES4/basic-decomposition-of-an-elliptic-component` · theorem · proposed name `basic_decomposition_of_an_elliptic_component`

For elliptic phi and A in D_lis^(C_phi), restriction to any nonbasic b is zero. Hence its compact category decomposes over basic b; its smooth representations lie in supercuspidal Bernstein components. If Z(H)^Gamma is finite, the component category is the direct sum of copies of Perf(Qbar_ell), indexed by basic b and supercuspidal pi of G_b(E) with parameter phi. This proved structural description does not establish the conjectural bijection with irreducible S_phi representations.

Hypotheses and interfaces:

- E is a nonarchimedean local field of residue characteristic p and residue cardinality q; ell != p. Fix a square root of q in each coefficient algebra used for the normalized Hecke family.
- G/E is connected reductive, H = dual G is its split pinned dual group over Z_ell, and W_E -> Q is the finite quotient defining the pinned action on H. All nonsplit formulas use H semidirect Q and the prescribed projection to Q.
- Import the proved ES7 parabolic parameter compatibility and SR supercuspidal block structure in characteristic zero.

Construction or proof:

1. A nonbasic stratum forces the parameter through a proper Levi by ES7; that contradicts ellipticity.
2. Use compact generation/stratum restriction to decompose the remaining basic summands.
3. Apply parabolic compatibility to exclude nonsupercuspidal components.
4. When the fixed center is finite, use the discrete supercuspidal-block Ext calculation to split into finite sums of shifted irreducibles.

Acceptance:

- Do not identify the indexing representations with Irr(S_phi) without Conjecture X.2.2.
- The finite-center case retains possible automorphism groups of parameters.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameter-component`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`, `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`, `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`, `SmoothRepresentationsOfLocalGroups:SR.3`.

Source: X.2 pp. 346–348. The stated source result supplies this target with the hypotheses listed here.

Lean signature status: Full signature omitted pending actual supplier types.

Atlas planet: **Basic elliptic decomposition**.

## Source statements outside acceptance

These contextual statements retain their original roles; conjectures are excluded from acceptance and no categorical equivalence follows from existence of an action.

### I.9.5

conjecture; not a target; I.9.5 pp. 35–36.

There is a unique Q(sqrt(q))-algebra map Z_spec(G,Q(sqrt(q)))->Z(G(E),Q(sqrt(q))) whose extension to every Q_ell(sqrt(q)), ell != p, recovers the geometric spectral-center composite. This is not proved here. Haines’ stable-center conjecture is routed to the accepted StableCenter Part II, not to ES acceptance.

### X.1.4

conjecture; not a target; X.1.4 p. 344.

For quasisplit G over Qbar_ell with W_psi, the colimit-preserving functor D_qcoh(Z/H)->D_lis, M |-> M*W_psi, has right adjoint fully faithful on compact objects and induces D_lis^omega ≃ D_coh^(b,qc)(Z/H). Neither full faithfulness nor the equivalence follows from the constructed action.

### X.1.5

source remark; not a target; X.1.5 p. 344.

The compact geometric category decomposes by pi_1(G)_Gamma=pi_0(Bun_G), while coherent spectral sheaves decompose by characters of Z(H)^Gamma. With pi_1(G)_Gamma=X^*(Z(H)^Gamma), the categorical conjecture predicts these gradings match. Bun_G component geometry is requested from BG3, not redefined here.

### X.1.6

conditional consequence; not a target; X.1.6 p. 344.

Under categorical full faithfulness, End(W_psi)=Z_spec. This equality is not obtained merely by evaluation of the center at W_psi.

### X.1.7

conditional consequence; not a target; X.1.7 pp. 344–345.

For an L-morphism f:^L H -> ^L G of quasisplit reductive groups over E, the induced parameter-stack map gives pushforward on Ind(D_coh^(b,qc)). Under the conjectural categorical equivalences this yields D_lis(Bun_H,Qbar_ell)->D_lis(Bun_G,Qbar_ell). BZ self-duality and VII.7.10 express it by a kernel A_f in D_lis(Bun_H times Bun_G,Qbar_ell); up to the source’s stated minor twists, its spectral image should be the structure sheaf of the graph. Restriction to the trivial strata predicts classical functoriality. The singularity-handling qualification and quasisplit Whittaker normalization of X.1.8 are retained; no kernel is constructed here from the action alone.

### Aut_phi

source construction and conditional nonvanishing; not a target; X.1 pp. 345–346.

For i:Spec Qbar_ell->Z/H with parameter phi, set E_phi=i_* Qbar_ell in D_qcoh, with its S_phi action, and Aut_phi=E_phi*W_psi using the Ind extension. The projection formula proves the Hecke eigenvalue phi, but Aut_phi may be zero; nonvanishing and packet conclusions require the categorical conjecture.

### elliptic-action-shift

proved source consequence; recorded, not a target; X.2 pp. 347–348.

Assume phi elliptic and Z(H)^Gamma finite. For basic b, a supercuspidal pi_b with parameter phi, and W in Rep(S_phi) isotypic on Z(H)^Gamma with character chi, Act_W(pi_b) is concentrated on b′=b+b_chi under pi_1(G)_Gamma=X^*(Z(H)^Gamma)=B(G)_basic. It is a sum of perfect multiplicity complexes tensored with supercuspidals of G_b′(E) having parameter phi. This does not prove the conjectural packet bijection.

### elliptic-Hecke-compatibility

proved source consequence; recorded, not a target; X.2 p. 348.

In the finite-fixed-center elliptic setting, restriction V|S_phi carries the commuting Weil action phi. If it decomposes as direct sum_i W_i tensor sigma_i as S_phi times W_E representation, then T_V(pi) is the direct sum_i Act_W_i(pi) tensor sigma_i. This is proved spectral-action compatibility; interpreting the W_i as packet constituents additionally uses X.2.2.

### X.2.2

conjecture; not a target; X.2.2 pp. 347–348.

For quasisplit G, fixed Whittaker datum and finite Z(H)^Gamma, an elliptic phi has a unique generic supercuspidal pi and W |-> Act_W(pi) gives a t-exact equivalence Perf(BS_phi) ≃ D_lis^(C_phi), normalized to send the trivial S_phi representation to the generic member. This is not proved by basic-stratum vanishing.

### I.10.2-and-X.3.5

conjecture; not a target; I.10.2 p. 38; X.3.5 p. 350.

For quasisplit G, integral Whittaker data and Lambda=O_L[1/n], n=|pi_0 Z(G)|, M |-> M*W_psi on IndPerf^qc(Z/H) has a right adjoint fully faithful on compact objects and induces D_lis^omega ≃ D_coh,Nilp^(b,qc)(Z/H). Nilpotent singular support and the bad-prime caveat are retained. This is not ES4’s reduced central support and is not an action-existence theorem.

## Source reading and confirmed issue

The author manuscript has SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`. Printed and PDF page numbers agree. Revision 2 independently read:

- I.9.5 pp. 35–36; I.10.2 p. 38: recorded conjectures.
- VI.12 pp. 239–241: Chevalley comparison and its inner-conjugation correction.
- VII.7 pp. 271–276: stratum adjunction, compact generation, lisse BZ duality and product interfaces.
- VIII.3.5–VIII.3.8 pp. 288–290; VIII.4 pp. 290–293: continuous qualifications and excursion relations, including the p. 292 misprint.
- IX.1–IX.3 pp. 320–327; IX.5 pp. 327–329: normalized Hecke, condensed enrichment, multi-leg comparison and finite-wild proof.
- X.0–X.3 pp. 339–350: universal/action/colimit statements and proofs, Whittaker sheaf, elliptic context and conjectures.

The published edition’s relevant passage was unavailable in the original review; the finding is scoped to the author copy. No comparison with unavailable published bytes is asserted.

### ExcursionOperatorsAndSpectralAction/E1

Author-hosted 356-page manuscript, SHA-256 9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905, printed p. 292, proof of VIII.4.1, reindexing square after VIII.4.2. Published passage unavailable.

The diagram commutes. Do not assert a cartesian square for arbitrary finite-set reindexing.

Take H=Q=1, W=C2, C=Vect_L and the trivial W-equivariant tensor family. End(id_C)=L and every left function ring is L. For I={1,2}, J={1}, g:I->J the fold map, the left vertical arrow is id_L; the right is diagonal restriction Map(W^2,L)->Map(W,L). Both horizontal maps send scalars to constant functions. The pullback consists of (a,f) with f(w,w)=a; off-diagonal values are arbitrary. In particular (0,f) with f(1,t)=1 and f zero elsewhere lies in the pullback but not in the image of L. Thus the square is commutative and not cartesian. Over F2 it has 8 pullback elements versus 2 source elements. The subsequent fusion proof only uses commutativity.

Independent verdict: confirmed. Independently checked the square in the hash-identified author manuscript and the trivial-group fold-map counterexample. Only the accessible author-copy assertion is confirmed false; the published passage was not inspected.

## Pinned library baseline

The packet records 27 baseline declarations. Their statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The TauCeti pin and reviewed audit were searched for missing interfaces; no TauCeti declaration is imported by this suggested file. The following are existing library inputs, not new ES targets.

- `mathlib:CategoryTheory.CatCenter` — The ordinary center consists of natural endomorphisms of the identity functor. This is the ordinary Bernstein center in VIII.4.1, already provided at the pin; ES plans its enhanced degree-zero counterpart and comparison. (Mathlib/CategoryTheory/Center/Basic.lean)
- `mathlib:CategoryTheory.CatCenter.app` — Evaluation of a central element at an object. This is the pinned form of the distinction the roadmap insists on, between a natural endomorphism of the identity and an endomorphism of one object. (Mathlib/CategoryTheory/Center/Basic.lean)
- `mathlib:CategoryTheory.CatCenter.naturality` — Naturality of a central element, from which centrality follows. Already proved at the pins, so this packet does not plan it. (Mathlib/CategoryTheory/Center/Basic.lean)
- `mathlib:CategoryTheory.Linear.toCatCenter` — The scalar ring map into the center of an R-linear preadditive category. ES imports this existing scalar structure. (Mathlib/CategoryTheory/Center/Linear.lean)
- `mathlib:CategoryTheory.Functor` — Functors. The identity functor of C, whose endomorphisms are the Bernstein centre, and the Hecke functors T_V are objects of this type. (Mathlib/CategoryTheory/Functor/Basic.lean)
- `mathlib:CategoryTheory.NatTrans` — Natural transformations. An element of the Bernstein centre is a natural endomorphism of the identity; the pinned definition already carries the naturality that this roadmap insists distinguishes it from an endomorphism of one object. (Mathlib/CategoryTheory/NatTrans.lean)
- `mathlib:CategoryTheory.Preadditive` — Preadditive categories. End(id_C) is a ring because C is preadditive; the pinned class supplies that structure on hom-sets. (Mathlib/CategoryTheory/Preadditive/Basic.lean)
- `mathlib:CategoryTheory.CatCenter.ext` — Equality from all object components; applies to the ordinary homotopy-category comparison only. (Mathlib/CategoryTheory/Center/Basic.lean)
- `mathlib:Ideal` — Left ideals as submodules; in commutative coordinate rings these give annihilator ideals. (Mathlib/RingTheory/Ideal/Defs.lean)
- `mathlib:PrimeSpectrum` — Prime ideals of a commutative ring, used for reduced central support on the invariant quotient. (Mathlib/RingTheory/Spectrum/Prime/Defs.lean)
- `mathlib:PrimeSpectrum.zeroLocus` — V(s) is the set of prime ideals containing s. (Mathlib/RingTheory/Spectrum/Prime/Basic.lean)
- `mathlib:PrimeSpectrum.mem_zeroLocus` — Membership in V(s) iff s is contained in the prime ideal. (Mathlib/RingTheory/Spectrum/Prime/Basic.lean)
- `mathlib:PrimeSpectrum.zeroLocus_radical` — The zero locus of the radical of an ideal equals its zero locus. (Mathlib/RingTheory/Spectrum/Prime/Basic.lean)
- `mathlib:PrimeSpectrum.zeroLocus_inf` — V(I intersect J)=V(I) union V(J), used for finite direct sums. (Mathlib/RingTheory/Spectrum/Prime/Basic.lean)
- `mathlib:PrimeSpectrum.zeroLocus_mul` — V(I J)=V(I) union V(J), used after the exact-triangle product-ideal argument. (Mathlib/RingTheory/Spectrum/Prime/Basic.lean)
- `mathlib:RingHom.ker` — The kernel of an evaluated central ring map is an ideal. (Mathlib/RingTheory/Ideal/Maps.lean)
- `mathlib:RingHom.mem_ker` — Membership in the kernel is equivalent to evaluation being zero. (Mathlib/RingTheory/Ideal/Maps.lean)
- `mathlib:PrimeSpectrum.zeroLocus_subset_zeroLocus_iff` — V(I) subset V(J) iff J is contained in the radical of I, supplying the principal support/localization criterion. (Mathlib/RingTheory/Spectrum/Prime/Basic.lean)
- `mathlib:CategoryTheory.Pretriangulated.Triangle` — Three objects with maps to form a triangle, ending in the integer shift of the first object; no distinguishedness is built into this carrier. (Mathlib/CategoryTheory/Triangulated/Basic.lean)
- `mathlib:CategoryTheory.Pretriangulated` — Distinguished triangles in a preadditive category with a zero object and additive integer shifts; rotation and completion of triangle morphisms supply the support argument. (Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean)
- `mathlib:CategoryTheory.Pretriangulated.Triangle.yoneda_exact₂` — A morphism out of the middle object that vanishes after the first triangle map factors through the second map, for a distinguished triangle. (Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean)
- `mathlib:CategoryTheory.shiftFunctor` — The functor indexed by a shift element, with coherent composition and zero-shift comparisons supplied by HasShift. (Mathlib/CategoryTheory/Shift/Basic.lean)
- `mathlib:CategoryTheory.Limits.biprod` — The chosen binary biproduct with its inclusion and projection maps; used to compute the intersection of annihilators. (Mathlib/CategoryTheory/Limits/Shapes/BinaryBiproducts.lean)
- `mathlib:PrimeSpectrum.comap` — Contravariant map on prime spectra given by inverse image of prime ideals under a commutative ring map. (Mathlib/RingTheory/Spectrum/Prime/RingHom.lean)
- `mathlib:ModuleCat.of` — Bundles an additive commutative group with its module structure as an object of ModuleCat; used for concrete rank-one test objects. (Mathlib/Algebra/Category/ModuleCat/Basic.lean)
- `mathlib:DualNumber` — The trivial square-zero extension of a coefficient ring by itself; its distinguished epsilon has zero first coordinate. (Mathlib/Algebra/DualNumber.lean)
- `mathlib:TrivSqZeroExt.fstHom` — The algebra projection from a trivial square-zero extension to its first coordinate; supplies the central action through the residue field in the nilpotent test. (Mathlib/Algebra/TrivSqZeroExt/Basic.lean)

## Supplier contracts

- `EnhancedDerivedSheaves:E5:abstract`: Enhanced exact endofunctor/mapping categories, Lambda-linear E_2 endomorphisms of the identity and their commutative pi_0, coherent finite-set action anima; no equivalence of underlying types substitutes for a higher equivalence.
- `EnhancedDerivedSheaves:E5:animation`: Animation of finite Q-torsor sets over BQ and the sifted free-group resolution BGamma = colim_(F_n->Gamma) BF_n with its animated algebra compatibility.
- `EnhancedDerivedSheaves:E5:presentability`: Ind mapping-object equivalence for exact functors, relative tensor/base-change module categories, Barr–Beck comparisons, compact objects under coordinate-algebra colimits, and the f-localization telescope Hom formula. For support equality provide the stated endomorphism scalar-extension isomorphism in its valid range.
- `GeometricSatakeAndFusion:GS4:integral-dual-group`: Pinned dual group/semidirect action and normalized representation categories, the center-order/dual torsion relation in its exact scope, and VI.12.1 switching equals Chevalley up to conjugation by rho-hat(-1).
- `HeckeStacksAndLocalShtukas:HS1`: IX.1.2 relatively discrete condensed animated Hom(A,B) for compact A, and the pro-p quotient-equivariant pullback full faithfulness used in IX.5.1. Also derived coefficient-change of the normalized HS kernels and their square-root-q convention.
- `HeckeStacksAndLocalShtukas:HS3`: The full IX.3.2 multi-leg local-shtuka/Hecke identification, with level transitions, two smooth group actions in the appropriate level/tower domains, and condensed Weil actions. Current named nodes cover IX.3.1 and its minuscule adjunction application, not this whole comparison.
- `LanglandsParameterStacks:LP0`: The actual Weil group/wild inertia carriers and eligibility of open normal P, tensor-compatible dense discretizations, and pro-p versus pro-ell image argument used by IX.5.1.
- `LanglandsParameterStacks:LP1`: Derived quotient-stack mapping presentations, universal evaluation and perfect representation bundles, their fpqc descent, and the exact coefficient-extension/derived reduction comparison functors on Perf. Ordinary Scheme does not supply stacky derived Perf.
- `LanglandsParameterStacks:LP3`: DVR highest-weight filtration of Perf(BH) by copies of Perf(R), exact representation-category free stable extension, and characteristic-zero pro-reductive representation generation/exact invariants for X.1.2. Existing good-filtration field nodes do not state the DVR tensor identity of X.3.2.
- `LanglandsParameterStacks:LP4`: The general affine-quotient Ind module-category/compact comparison used by X.1.2, and the algebraic base-change interfaces. Retain VIII.5.1 generation/module comparison, but remove the duplicated Chapter X action universality as resolved by the verifier.
- `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`: Smooth categories over the allowed rings and scalar transport along a chosen abstract Qbar_ell-to-C field isomorphism, with an explicit center transport equivalence.
- `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`: Enhanced derived smooth category and its heart, with the supplied stratum equivalence and ordinary-heart restriction of enhanced central transformations.
- `SmoothRepresentationsOfLocalGroups:SR.1`: Define the abelian Lambda-linear Bernstein center as CatCenter(Sm_Lambda(G(E))). Identify it with the inverse limit of centers of pro-p Hecke corners when pro-orders are units, and prove ell-adic separatedness for Z_ell[sqrt(q)]. SR.1 owns this ordinary abelian target; enhanced restriction/heart comparison is ES0’s (verifier’s correction to RT finding 9).
- `SmoothRepresentationsOfLocalGroups:SR.2`: Whittaker datum (B,U,psi), generic character and compact induction from closed U(E) with support compact modulo U(E), including intertwining under isomorphism of data. This is distinct from compact induction from compact open pro-p levels.
- `SmoothRepresentationsOfLocalGroups:SR.3`: Complex Bernstein block center description and its field-transport dictionary; characteristic-zero supercuspidal block/Ext decomposition used in X.2, with finite fixed-center hypotheses retained.
- `VStackSheavesAndLisseCategories:VS3`: Identify the eligible relative scalar-extension category of D_lis with the geometric coefficient-change category, including the exact derived reduction range. No unrestricted Perf/D_lis tensor identity is assumed.
- `VStackSheavesAndLisseCategories:VS4`: The enhanced fully faithful b-stratum adjunction of VII.7.2, especially j_! at b=1, and the precise restriction functors used for local-shtuka comparison. The named compact-generation and classifying-stack nodes alone do not specify this embedding.
- `VStackSheavesAndLisseCategories:VS5`: The lisse compact Bernstein–Zelevinsky duality of VII.7.6–VII.7.10 needed by IX.5.3; the packet’s currently etched-sheaf duality nodes are insufficient (RT-AREA-geomlanglands/29).
- `BunGAndNewtonStrata:BG3`: For the recorded X.1.5 grading statement, pi_0(Bun_G)=pi_1(G)_Gamma via the Kottwitz map (IV.1.23), and the basic-class grading shift used in X.2. This supports recorded source statements, not a new ES target.

### Resolved LP2 contract

Reread the current LP2 invariant-function-and-independence node on 2026-10-09: its statement and proof use commutativity, its API is Theta.reindex, and no cartesian-square test remains. The LP2 abstract owner is preserved; no supplier file was edited. Source issue ExcursionOperatorsAndSpectralAction/E1 remains confirmed and author-copy scoped.

## Exact gaps and refinement

### Enhanced signatures at the pins

The blocking section 13 deficit is explicit: 35 node names, 16 API names and 18 test labels have no executable declaration/example. The seven named node forms and 22 named APIs that do exist generally express ordinary observations. support_exact_operations now states the genuine generic pretriangulated theorem with real Hom exactness and shift compatibility. Its Bun_G instantiation still needs E5/HS. The E5 packet is partial and exports no Lean declarations for a Lambda-linear stable infinity-category, enhanced exact functor mapping objects, Ind mapping-object comparisons or coherent action anima. LP has no supplied derived stacky Perf interface. Implementing these foundations is supplier work outside this issue’s four authorized paths. Resume with those actual interfaces; conditions that cannot be stated must be omitted under section 13 rather than replaced by arbitrary proposition fields.

### DVR representation filtration

X.3.2 invokes highest-weight theory without spelling out the DVR filtration/tensor statement. Its exact export is requested from LP3; field good-filtration statements alone do not close this input. Inspect the integral highest-weight source and prove the displayed finite-set tensor equivalence there.

### Geometric derived scalar-extension interfaces

Conditional action base-change is stated with the explicit Perf and D_lis comparison equivalences it needs. LP1, VS3, HS1 and E5 must determine the exact derived-reduction range; no unrestricted identification with the geometric coefficient-changed category or equality of supports is asserted.

### Elliptic component deformation argument

LP1 supplies the deformation complex and local Tate duality statement. The proof-interior identification of the unramified twists with the entire connected component in X.2’s footnote needs expansion, including H^0, H^1 and H^2 calculations and the residual stack stabilizer. It is an explicit refinement of the stated target, not a conjectural packet equivalence.

### Supplier lisse duality and multi-leg shtukas

The current VS5 nodes concern etched sheaves, while this target needs VII.7’s lisse BZ duality. HS3’s named nodes give minuscule compactness and adjunction, while the local-shtuka target needs full multi-leg IX.3.2 with tower transition compatibility. Both missing exports are precisely requested.

## Suggested Lean and validation

The generic support theorem now takes actual distinguished triangles, additive shifts with explicit central compatibility, biproducts and retracts; it no longer assumes the desired annihilator-product containment. Separate signatures state the Hom factorization and product containment, compatible-functor support inclusion, and the principal radical/power criterion. Concrete scalar-module examples compute free and dual-number support. These improvements do not supply enhanced categories, derived stacky Perf, coherent action anima, elliptic algebraic centralizers or localization telescopes.

The original needs_changes review is retained. Its signature-coverage finding remains open: all 42 mathematical targets are specified, but the named register is prose and cannot count as Lean declarations. No empty proposition fields or ordinary aliases are introduced to claim higher coverage.

The executable inventory has seven proposed node names, 22 proposed API names and 15 examples carrying 13 of the 31 proposed test labels; three extra examples support the ordinary observations. These are upper bounds on full coverage. The register is prose. The exact missing names are recorded in the packet and revision handoff.

The suggested file elaborated through `lean-check` with exit 0 and only 48 `sorry` warnings. It imports the exact pinned Mathlib; the shared TauCeti checkout differs from the recorded pin but is unused. The packet checker result is recorded in the handoff. No theorem is claimed proved.

## Structural proposals and verification

### Abstract excursions remain in LP2

RT-AREA-geomlanglands/5: LP2 owns VIII.4.1–VIII.4.2, coefficient realization, independence and all abstract relations. ES0 only specializes the HS1/HS4 family and constructs the enhanced lift/continuous evaluation. Remove the old ES0 invariant-function and abstract-relation nodes. Global shtuka applications consume LP2’s same abstract algebra, so no global/local relation owner is newly duplicated.

### Chapter X belongs to ES2 and ES3

RT-AREA-geomlanglands/6 verifier says apply only the primary fix: ES2 owns X.1.1–X.1.3 and X.1.2’s pushout half; ES3 owns X.3.1–X.3.4 and X.0.1–X.0.2. LP4 retains VIII.5.1 generation/module comparison. Remove LP4/compactly-supported-actions and LP4/colimit-theorem-and-monoidal-universal-property as duplicated Chapter X planning, and narrow its prose accordingly. ES imports the genuine LP4 generation node, not these duplicates.

### Conditional center and geometric suppliers

RT-AREA-geomlanglands/7: add ES1:spectral-center to ES2 and ES4’s required inputs, VS5 and HS3 to ES4; the node prerequisites here already record these. The same conditional center input is needed by ES6:functoriality, ES6:duality and ES7:parabolic, outside this part. Preserve the existing excursion-only route at excluded primes. Propose no direct edits to the atlas.

### Ring-valued smooth center in SR1

RT-AREA-geomlanglands/9 verifier correction: SR.1 owns the abelian CatCenter of the smooth Lambda category, its pro-p corner inverse limit and ell-adic separatedness. ES0 owns the enhanced restriction and heart comparison, not a general pi_0-center isomorphism. SR.3 retains the complex block theorem. Remove the checkpoint’s ES0 level-limit theorem and request the exact SR.1 export.

### General stratum center composites in ES7

RT-AREA-geomlanglands/34: ES1:spectral-center stops at Z_geom,Hecke and imports finite ramification; ES7:parabolic owns IX.7.1’s general Psi_G^b composites. ES0:classical-center’s ordinary b=1 restriction is a separate early comparison. The stronger general composite is not replanned here.

### Confirmed red-team handling

- `RT-AREA-geomlanglands/5`: Imported abstract LP2 construction and removed two duplicate ES nodes; enhanced Bun_G specialization remains.
- `RT-AREA-geomlanglands/6`: Verified primary ownership fix followed; Chapter X stays in ES2/ES3 and LP4 keeps VIII.5.1.
- `RT-AREA-geomlanglands/7`: Added precise node prerequisites and supplier requests; atlas link changes recorded as proposals.
- `RT-AREA-geomlanglands/9`: Applied verifier correction to abelian SR1 ownership; removed ES0 corner-limit duplication.
- `RT-AREA-geomlanglands/34`: Kept general Psi composites in ES7 and imported finite ramification.
- `RT-AREA-geomlanglands/35`: Rejection respected: the enhanced center remains an owned construction, with only a natural map to ordinary CatCenter.

### Checkpoint continuity

Preserved 23 correct checkpoint node identifiers. The three removed duplicates are routed as follows:

- `ExcursionOperatorsAndSpectralAction:ES0/invariant-function-attached-to-a-datum` → `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`: Abstract coefficient realization and independence belong to LP2.
- `ExcursionOperatorsAndSpectralAction:ES0/excursion-relations-and-the-algebra-map` → `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`: Abstract relation/algebra-map ownership remains in LP2; ES owns only its enhanced Bun_G lift.
- `ExcursionOperatorsAndSpectralAction:ES0:classical-center/the-classical-center-as-a-limit-over-levels` → `SmoothRepresentationsOfLocalGroups:SR.1`: The verifier assigns the ordinary smooth-center/Hecke-corner theorem to SR.1.

The independently confirmed author-copy source issue E1 is retained above. Its supplier correction is now resolved in LP2; the review’s mathematical and ownership corrections remain in force.
