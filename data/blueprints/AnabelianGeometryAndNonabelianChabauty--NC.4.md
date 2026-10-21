# NC.4 — Unipotent Albanese maps and Chabauty–Kim loci

This layer associates local points of a curve with finite-depth de Rham periods, compares these periods with local crystalline path classes, and pulls the global Selmer image back to a set of local candidates. Its finiteness theorem has a strict dimension hypothesis. Its depth-one comparison specifies exactly when the Selmer period locus agrees with the classical common-annihilator Chabauty locus.

The layer is **planned**, and the packet is a **complete target-level pass**. Every mathematical target is stated below with prerequisites ending in baseline declarations, other roadmap nodes, requested supplier stages, or an explicit gap. It is not closed: the native geometric interfaces and nonlinear supplier comparisons listed at the end remain inputs. Every node has implementation status **unchecked**. The companion [packet](../packets/AnabelianGeometryAndNonabelianChabauty--NC.4.json) is machine-readable; the [suggested file](../suggested/AnabelianGeometryAndNonabelianChabauty--NC.4.lean) elaborates the available native reductions and marks exact geometric signatures omitted at the library boundary.

## Datum, indexing and path direction

For the local construction fix a finite extension K/ℚ_p and a smooth geometrically connected hyperbolic curve X/K. Choose a smooth proper O_K-model X̄ and a finite étale boundary D, possibly empty; write 𝒳=X̄∖D and choose b∈𝒳(O_K). Hyperbolicity means 2g−2+deg D>0. The domain is the integral tube 𝒳(O_K), rather than all points of an open generic fibre. For global containment take a number field F, R=O_{F,S}, the corresponding good pair over R, and a finite ramification set T containing S and the places above p. A selected good place v∉S has completion K. Every imposed local condition must contain the local classes of the allowed geometric paths.

NC.2 owns the unipotent group, geometric tensor paths, normalized coordinate/Hodge filtrations, Frobenius and nonlinear comparison. Here U_n=U/Γ_(n+1) for n≥1. Our depth n is Kim's U_(n+1): the trivial quotient is depth zero, and the proper Jacobian occurs at depth one. Augmentation-length quotients of universal modules are a different tower and must not be substituted for these group quotients.

P_n(b,x) is a right path torsor from b to x. Its right action is composition with a source automorphism. Write H_n=F⁰U_n and Q_n=U_n/H_n, the represented quotient by right multiplication. H_n need not be normal, so Q_n need not be a group. The path period uses the equation p_φ·u=p_H, where p_φ is the unique Frobenius-fixed path and p_H is a Hodge path. It is [u], not an unexplained inverse or a quotient by left multiplication.

The point prototype uses Mathlib's native Torsor for Uᵐᵒᵖ and its scalar division. Mathlib's left-coset relation identifies g and g′ precisely when g⁻¹g′∈H; its classes are gH. In the NC.2 affine universal connection with differential d−∑T_iω_i, the forward horizontal word element is I. If an algebraic trivialization has coordinate 1 and the Hodge section has coordinate γ, the ordered period representative is I⁻¹γ. This convention is transported explicitly in the depth-one logarithm comparison.

## Ownership and source

This layer imports rather than reconstructs:

- `AnabelianGeometryAndNonabelianChabauty:NC.2`: right geometric paths, finite central quotients, canonical Frobenius paths, full Hadian filtration, the affine word realization and the proper extending quotient, and the nonlinear crystalline and Jacobian bridges.
- `AnabelianGeometryAndNonabelianChabauty:NC.3`: continuous nonabelian torsor/gauge classes, local-condition geometry, global Selmer functors, conditional affine representability, localization and rational Tate-module Kummer comparison. The accepted parent node `NC.3/h1-restriction` supplies H¹ restriction.
- `ColemanIntegration:L1`: actual Coleman functions, word algebra and ordinary residue-disc expansions. NC.4 consumes these functions as period coordinates.
- `EffectiveDiophantineMethods:ED.4`: Strassmann, abelian logarithms, the Coleman/abelian comparison and classical Chabauty. NC.4's contribution is the nonabelian period-image criterion and its exact specialization.
- `SchemeAndStackFoundations:SF.0` and `SF.1`: finite-type scheme dimension, image closures and quotient sheaves; current upstream ReductiveGroups layers 3 and 5 own homogeneous quotients and unipotent torsors. `ReductiveGroupsPartII:RG2.0a/weil-restriction-adjunction` owns Weil restriction and its counit.

The principal source is Minhyong Kim, *The Unipotent Albanese Map and Selmer Varieties for Curves*, Publications of the Research Institute for Mathematical Sciences **45** (2009), 89–133, DOI [10.2977/PRIMS/1234361156](https://doi.org/10.2977/PRIMS/1234361156), [published PDF](https://content.ems.press/assets/public/full-texts/serials/prims/45/1/2127/online/10.2977-prims-1234361156.pdf). Locators below use the printed page numbers of this published version, read on 2026-10-11. Statements and arguments are given in our own words; no source passages or paper-by-paper summaries are reproduced. The introduction pp.91–96, §1 pp.96–114, §2 pp.114–120 and the conditional argument of §3 pp.120–121 were read for these targets. Motive/dimension conjectures outside that implication are not additional NC.4 targets.

The reviewed NC.4 library audit reports the maps, locus and conditional finiteness as not built, with classical Chabauty and integration assigned to the above suppliers. The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The current upstream roadmap and current Tau Ceti library were also checked: JacobianChallenge and Completed/HodgeStructures retain their work; this plan imports their direction and does not rebuild Jacobians or general linear Hodge theory.

## Targets, APIs and acceptance tests

All node ids in this section have prefix `AnabelianGeometryAndNonabelianChabauty:NC.4/`. Prerequisites are direct mathematical inputs, with smaller proof steps kept inside the proof outline. The six marked planets are the layer's visible targets.


### 1. The period of an admissible path torsor

Node `admissible-period` · construction · Planet **Admissible torsor period**.

Let K be a characteristic-zero p-adic field and U_n the finite-depth de Rham unipotent group of NC.2. Write H_n=F⁰U_n, a closed split unipotent subgroup, not assumed normal, and Q_n=U_n/H_n for the represented quotient by right multiplication. On a commutative K-algebra R, an admissible right U_n-torsor T has the NC.2 finite coordinate filtration, a compatible Frobenius with a unique fixed point p_φ, and a Hodge reduction F⁰T with an R-point p_H. Define admissiblePeriod(T)=[u] in Q_n(R), where p_φ·u=p_H. Changing p_H to p_H·h changes u to uh for h∈H_n(R), hence preserves its class. Quotient representability and triviality of split-unipotent torsors over affine bases are imported inputs. Native point reduction: for a Torsor U_nᵒᵖ T, u is the underlying U_n element of p_H divided by p_φ in the opposite group; the point quotient is Mathlib's left-coset carrier U_n/H_n with relation u⁻¹v∈H_n.

**Hypotheses.** U_n and its filtered/Frobenius path structure come from NC.2; Frobenius Lang invertibility uses the positive-weight hypotheses there, not an arbitrary automorphism of an arbitrary unipotent group. All R are commutative K-algebras, including nonreduced ones; H_n is smooth split unipotent and the Hodge torsor is trivial over Spec R.

**Proof outline.**

1. Use the imported homogeneous quotient sheaf and its affine representation; the affine torsor-vanishing input identifies Q_n(R) with right-multiplication orbits U_n(R)/H_n(R).
2. Use NC.2 canonical Frobenius trivialization to identify T(R) with U_n(R), retaining the right-action order.
3. Hodge points differ by right multiplication by H_n; quotient this difference.

**Planning API.**

- `admissiblePeriod_eq_mk` (characterisation): The period is the coset of the unique u with p_φ·u=p_H.
- `admissiblePeriod_hodge_change` (relation): For h∈H_n(R), replacing p_H by p_H·h leaves the period unchanged.
- `admissiblePeriod_eq_iff` (extensionality): For fixed p_φ, the periods of p_H and p′_H coincide iff u⁻¹u′∈H_n(R).
- `admissiblePeriod_self` (simp): Choosing p_H=p_φ gives [1].
- `admissiblePeriod_transport` (functoriality): A right U_n-equivariant isomorphism of torsor point carriers preserving the two chosen points preserves the period.

**Unit tests.**

- `admissiblePeriod_identity` (computation): On the self-torsor Uᵒᵖ, with p_φ=op(1) and p_H=op(g), the period is [g], not [g⁻¹].
- `admissiblePeriod_right_change` (compatibility): On that self-torsor, for h∈H, the periods of op(g) and op(gh) agree, even for nonnormal H.
- `admissiblePeriod_left_change_fails` (non-example): In S₃ take H generated by h=(01), g=(12). With p_φ=1, the periods of g and hg differ, although those of g and gh agree.

**Uses.** Kim §1 Proposition 1, pp.105–106: Classifies separately trivialized filtered/Frobenius torsors. NC.4 local-albanese and crystalline-period: Provides a common de Rham target for geometric paths and crystalline torsors.

**Acceptance.** No group structure on Q_n is asserted when H_n is nonnormal. For the neutral filtered Frobenius torsor with p_H=p_φ, the period is [1].

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.2/filtered-path`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/canonical-frobenius-path`.
- `SchemeAndStackFoundations:SF.1/quotient-sheaf`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.
- `mathlib:Torsor`.
- `mathlib:QuotientGroup.leftRel`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`.

**Source.** §1, Lemma 1 and the definition preceding Proposition 1, pp.104–105. Kim chooses a Frobenius-fixed and a Hodge trivialization and uses their ordered ratio modulo F⁰; the native reduction fixes the opposite-group convention.

### 2. Admissible torsors and the Hodge quotient

Node `admissible-classification` · comparison.

Under the hypotheses of admissible-period, the period gives a natural bijection, for every commutative K-algebra R, between isomorphism classes of admissible U_n-torsors and Q_n(R). Isomorphisms preserve the right torsor action, coordinate filtration, Frobenius and Hodge filtration. This represents the finite-level admissible-torsor functor, rather than merely classifying K-points. The Hodge structure is the full NC.2 normalized multiplicative filtration; a reduction to H_n without that structure is not silently substituted for it.

**Hypotheses.** Admissibility, split-unipotent affine torsor vanishing and normalized filtered structure as in admissible-period.

**Proof outline.**

1. An isomorphism preserves p_φ by its uniqueness and maps Hodge points to Hodge points, so periods agree.
2. For equal cosets, the unique p_φ-compatible torsor isomorphism differs in Hodge coordinates by an element of H_n, and preserves the normalized filtration.
3. For g∈U_n(R), use the standard filtered torsor U_n,R with Frobenius φ_g(h)=g⁻¹φ(gh); its fixed point is g⁻¹ and its Hodge point 1, giving period [g].
4. Apply the finite central quotient to Kim Proposition 1 and verify scalar-extension naturality.

**Acceptance.** The twisted Frobenius satisfies φ_g(hk)=φ_g(h)φ(k); it is generally not a group homomorphism. The construction works on R=K[ε]/(ε²), not just reduced points.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/admissible-period`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/hadian-filtration`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/central-quotients`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`.

**Source.** §1, Proposition 1 and its proof, pp.105–106. The filtered/Frobenius torsor classification is the ingredient turning periods into algebraic maps.

### 3. The finite-depth de Rham Albanese map

Node `local-albanese` · construction · Planet **Unipotent Albanese map**.

Fix a smooth geometrically connected hyperbolic curve X/K, a smooth proper O_K-model X̄ with finite étale boundary D (possibly empty), the open model 𝒳=X̄∖D and b∈𝒳(O_K). Use U_n=U/Γ_{n+1} for n≥1 and the right path torsor P_n(b,x) from b to x. Define localAlbanese_n:𝒳(O_K)→Q_n(K) by x↦admissiblePeriod(P_n(b,x)). The map is a p-adic analytic map on each residue disc, with local coordinates furnished by iterated Coleman integrals and an algebraic Hodge trivialization. It is not asserted to be a morphism of algebraic K-schemes. At b it equals [1]. Kim's U_{n+1} is this U_n; Kim U_1 is trivial and Kim U_2 is our depth one.

**Hypotheses.** The base point is integral and the compactification and boundary have good reduction at the chosen p-adic place. NC.2 supplies the canonical Frobenius path and normalized Hodge reduction.

**Proof outline.**

1. Push the NC.2 tensor path family to the n-th central quotient.
2. Apply admissible-classification fibrewise, independent of the chosen local Hodge section.
3. Use the word-path comparison of NC.2 and Coleman local expansions for discwise analyticity.

**Planning API.**

- `localAlbanese_apply` (data): At x the map is admissiblePeriod of the two chosen paths in P_n(b,x).
- `localAlbanese_base` (simp): The normalized constant path at b gives localAlbanese_n(b)=[1].
- `localAlbanese_reindex` (functoriality): Reindexing the endpoint family along f:Y→𝒳(O_K) composes localAlbanese_n with f.
- `localAlbanese_hodge_change` (relation): A pointwise change p_H(x)↦p_H(x)h(x), with h(x)∈H_n(K), preserves the function.
- `localAlbanese_tower` (compatibility): For m≤n, the induced quotient q_nm satisfies q_nm∘localAlbanese_n=localAlbanese_m.

**Unit tests.**

- `localAlbanese_self_family` (degenerate): For every endpoint, if the Hodge and fixed paths coincide, the resulting family is constant [1].
- `localAlbanese_trivial_hodge` (computation): For the Uᵒᵖ self-torsor family indexed by g∈U, H={1}, p_φ(g)=1 and p_H(g)=op(g), the value at g is [g].
- `localAlbanese_fibre_change` (compatibility): For arbitrary h(x)∈H, the self-torsor endpoint family op(g(x)h(x)) gives the same map as op(g(x)).

**Uses.** Kim Theorem 1, p.93 and proof pp.111–114: Supplies the transcendental curve image in the period variety. NC.4 kim-loci and NC.5 quadratic height functions: Pulls local Selmer conditions and period equations back to local points.

**Acceptance.** The depth-zero extension is the constant map to a point; depth one is nontrivial. The base point maps to the neutral coset and higher-depth maps project to lower-depth maps.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/admissible-classification`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/tensor-paths`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/central-quotients`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/word-path-bridge`.
- `ColemanIntegration:L1/word-algebra-local-expansion`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2`.

**Source.** §1, definition of the de Rham map after Proposition 1, p.106; introduction p.93. Kim assigns to each endpoint its admissible path class and projects through the finite-level tower.

### 4. Iterated integrals as Albanese coordinates

Node `iterated-coordinates` · comparison.

On an affine open of X_K choose the NC.2 universal connection and its algebraic trivialization g, and choose an algebraic Hodge trivialization p_H=gγ. Let p_φ(x)u(x)=g(x). Then localAlbanese_n(x) is the class of u(x)γ(x) in Q_n. In the NC.2 affine trivialization the Frobenius path has word element I(b,x), while g has coordinate 1; hence u=I(b,x)⁻¹ and the period representative is I(b,x)⁻¹γ(x). The coefficients of I are the imported Coleman iterated integrals; coefficients of I⁻¹ are their antipode combinations. Kim’s variable u in his proof must not be identified with NC.2’s forward path element without transporting the trivialization convention. In the convention dI_{iw}=ω_i I_w, the first letter is the outermost integration, I_∅=1, and the coefficients of uγ are ∑_{w=ab}(I⁻¹)_aγ_b, preserving multiplication order. On proper curves use the imported maximal extending quotient of an affine universal connection; do not treat all affine words as independent coordinates on the proper group. Regular functions on Q_n pull back to Coleman functions, analytic on every ordinary residue disc.

**Hypotheses.** Good-reduction datum of local-albanese; the affine trivializations and word-path identification are the NC.2 imported constructions. Only ordinary discs of 𝒳 are evaluated; logarithmic boundary germs are not added to the integral-point domain.

**Proof outline.**

1. Use the ordered torsor equation p_φuγ=p_H and the existing shuffle/deconcatenation word realization.
2. The Hodge factor γ is algebraic, so finite polynomial coordinate expressions are Coleman functions.
3. Pass from the affine group to the central quotient and to the proper extending quotient when required.

**Acceptance.** A bare list of single integrals cannot encode depth two. The empty coefficient is 1, and reversing factors u and γ changes noncommuting coordinates.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/local-albanese`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/word-path-bridge`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/affine-universal`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/proper-maximal-quotient`.
- `ColemanIntegration:L1/coleman-functions`.
- `ColemanIntegration:L1/word-algebra-local-expansion`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2`.
- `ColemanIntegration:L1`.

**Source.** §1, proof of Theorem 1 and Lemma 4, pp.111–114, with the universal connection pp.106–111. The proof identifies the ordered Hodge correction and the horizontal word coordinates; this node consumes rather than reconstructs the integral algebra.

### 5. Kim density on every residue disc

Node `residue-disc-density` · theorem · Planet **Kim density theorem**.

For local-albanese's smooth hyperbolic good-reduction pair over a finite extension K/ℚ_p, n≥1, and every nonempty integral residue disc B⊆𝒳(O_K), the image localAlbanese_n(B) is Zariski dense in the geometrically integral affine K-variety Q_n. Equivalently any regular f∈O(Q_n) that vanishes on this whole disc is zero. The conclusion is K-Zariski density, not automatic ℚ_p-Zariski density in Res_{K/ℚ_p}Q_n. Density is asserted separately on each disc, so a nonzero regular equation has nonzero analytic pullback on every disc.

**Hypotheses.** All good-reduction and integrality hypotheses of local-albanese. n≥1 in our indexing, corresponding to Kim n+1≥2; hyperbolicity means 2g−2+deg D>0.

**Proof outline.**

1. Kim Lemma 4 proves the affine horizontal word coefficients independent over algebraic functions via complex monodromy and induction on word length.
2. The algebraic Hodge correction is triangular in word length with invertible constant term, so no nonzero regular period function vanishes on the disc.
3. Use the surjective proper extending quotient to pass from an auxiliary affine curve to the proper curve. Choose a finite étale boundary divisor avoiding the chosen disc; it need not be a K-rational point in a different disc.
4. Apply the same argument with an integral lift in each nonempty residue disc and transport the based path data; this is the discwise use explicitly made in Kim §3.

**Acceptance.** At our depth one the image in Lie(J) is dense even if the local curve has analytic dimension one and g>1. The ℚ_p-Weil restriction dimension cannot replace dim_K Q_n in a single-place argument without a stronger density/nonvanishing input.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/iterated-coordinates`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/affine-universality`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/proper-maximal-quotient`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/hadian-filtration`.
- `ColemanIntegration:L1/coleman-uniqueness-principle`.

**Source.** Theorem 1, p.93; §1 proof and Lemma 4, pp.111–114; §3, p.121. Kim proves density already on a residue disc and then applies the nonvanishing consequence on every disc in the finiteness argument.

### 6. The represented crystalline period map

Node `crystalline-period` · construction · Planet **Crystalline period map**.

Let K/ℚ_p be finite and let L_n=H¹_f(G_K,U_n^et) be the represented finite-depth crystalline torsor functor of NC.3. The NC.2 filtered, Frobenius and multiplicative period comparisons send a crystalline torsor T over a ℚ_p-algebra R to an admissible de Rham U_n-torsor over K⊗_{ℚ_p}R. Compose with admissible-classification to obtain a natural transformation D_n(R):L_n(R)→Q_n(K⊗R), and hence a morphism of ℚ_p-schemes crystallinePeriodMap_n:L_n→Res_{K/ℚ_p}Q_n. On ℚ_p-points the target is Q_n(K). The neutral torsor maps to [1]. No inverse of D_n is asserted. Native affine reduction takes the resulting pullback d*:O(Res Q_n)→O(L_n) and sends an R-point c to c∘d*; deriving d* from crystalline torsors remains part of the nonlinear supplier interface.

**Hypotheses.** Representability over all ℚ_p-algebras and coefficient-compatible crystalline conditions, as in NC.3. The nonlinear comparison respects multiplication, both path augmentations, torsor coactions, Hodge filtration and Frobenius; linear H¹ comparison alone is insufficient. For K≠ℚ_p the represented target is the Weil restriction, not Q_n as a ℚ_p-scheme by omission of its field.

**Proof outline.**

1. Apply the nonlinear coordinate-period functor to each crystalline torsor, together with the finite coordinate filtrations.
2. Use admissible-classification over K⊗R.
3. Check naturality on coefficient rings; import the Weil restriction adjunction and apply represented-functor naturality to produce the scheme morphism.

**Planning API.**

- `crystallinePeriodMap_apply` (data): On affine R-points, c is sent to c∘d*, where d* is the crystalline period pullback.
- `crystallinePeriodMap_coeff` (functoriality): For α:R→R′, α∘(c∘d*)=(α∘c)∘d*.
- `crystallinePeriodMap_neutral` (simp): Under compatible augmentations ε_L∘d*=ε_Q, the neutral point maps to the neutral point.
- `crystallinePeriodMap_tower` (compatibility): The represented period morphism commutes with each finite-depth projection.
- `crystallinePeriodMap_ext` (extensionality): Equality of pullbacks is detected by all coefficient points, including the universal point of the affine source.

**Unit tests.**

- `crystallinePeriodMap_identity` (computation): For d*=id_A and any R-point c:A→R, the point reduction sends c to c.
- `crystallinePeriodMap_universal` (characterisation): At R=O(L_n) and c=id, the point reduction returns d* itself.
- `crystallinePeriodMap_dual_numbers` (non-example): For A=ℚ[t], R=ℚ[ε]/(ε²), d*=id and c(t)=ε, the output still sends t to ε≠0. Passing to reduced points would give the wrong output.

**Uses.** Kim §2, p.119 and §3, p.121: Turns global Selmer localization into algebraic period equations. NC.4 fundamental-diagram: Identifies the period of each local geometric path.

**Acceptance.** Nilpotent coefficient maps are retained, and D_n commutes with depth projection. For K=ℚ_p no Weil restriction is needed; invertibility is not a prerequisite of the finiteness argument.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/admissible-classification`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/crystalline-path-coordinates`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-path-comparison`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3/local-condition-geometry`.
- `ReductiveGroupsPartII:RG2.0a/weil-restriction-adjunction`.
- `mathlib:AlgHom.comp`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3`.

**Source.** §2, crystalline torsors and the functor D, pp.118–119; introduction p.95. Kim passes from crystalline coordinate invariants to admissible torsors, retaining Weil restriction and functoriality in coefficient algebras.

### 7. The local étale path-class map

Node `local-etale-albanese` · construction.

For the good-reduction datum of local-albanese, define localEtaleAlbanese_n(x)=[P_n^et(b,x)]∈H¹_f(G_K,U_n^et)(ℚ_p) for x∈𝒳(O_K). The right geometric étale path torsor has continuous G_K-action and its ind-coordinate ring is crystalline by the NC.2 nonlinear good-reduction comparison. The cocycle class is independent of a chosen geometric path used to express it. It is a class in a pointed set, not an element of a group at nonabelian depth. The base point gives the neutral class. The crystalline condition is proved for these geometric path torsors; it is not inferred from unrestricted extension-closure of crystalline representations.

**Hypotheses.** Integral endpoints and good smooth proper compactification with finite étale boundary. NC.2 nonlinear path comparison and NC.3 represented crystalline torsor interpretation.

**Proof outline.**

1. Take the NC.2 finite geometric path torsor with restricted continuous G_K-action.
2. Apply the NC.3 torsor-to-cocycle comparison and quotient the full gauge action.
3. Use NC.2 crystalline path coordinates to place the class in the specified local subfunctor.

**Planning API.**

- `localEtaleAlbanese_path` (characterisation): The class is the class of the actual right G_K-path torsor P_n^et(b,x).
- `localEtaleAlbanese_base` (simp): localEtaleAlbanese_n(b) is neutral.
- `localEtaleAlbanese_path_change` (relation): Expressing the same torsor through another geometric path gives the same gauge-orbit class.
- `localEtaleAlbanese_tower` (functoriality): Projecting U_n→U_m sends the class at x to localEtaleAlbanese_m(x).

**Unit tests.**

- `localEtaleAlbanese_base_test` (degenerate): At x=b the endpoint torsor contains the identity path fixed by G_K and gives the neutral class.
- `localEtaleAlbanese_kummer_test` (compatibility): For a proper curve at depth one, the class at x is the rational Tate-module Kummer class of AJ_b(x).
- `localEtaleAlbanese_gauge_test` (characterisation): If a path representative p is changed to p·a, the resulting cocycle is gauge equivalent and the output class is unchanged for every a, not just G_K-fixed a.

**Uses.** Kim §2, pp.119–120: Gives the local side of the global-to-local path diagram. NC.4 kim-loci: Defines the exact crystalline-image locus before passage through D_n.

**Acceptance.** A change of geometric path changes a cocycle by the gauge action, not by naive addition of a coboundary. At depth one the map agrees with the rational p-adic Kummer class of x−b for a proper curve.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.2/etale-galois`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/central-quotients`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/crystalline-path-coordinates`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3/filtered-affine-torsor-comparison`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3/local-condition-geometry`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3`.

**Source.** §2, local étale Albanese after D, p.119. The source uses the crystalline path torsor to define the local classifying map.

### 8. The global étale path-class map

Node `global-etale-albanese` · construction.

Let F be a number field, R=O_{F,S}, 𝒳/R a smooth hyperbolic curve with smooth proper compactification and finite étale boundary, and b∈𝒳(R). Fix p and T containing S and every p-adic place, and use the actual restricted-ramification Galois action on U_n^et from NC.2. For x∈𝒳(R), define globalEtaleAlbanese_n(x)=[P_n^et(b,x)]∈Sel_T(U_n)(ℚ_p), provided every chosen local condition contains the local path class of each permitted global point. In particular at the selected good place v∉S over p use the crystalline condition. Good places outside T have unramified path classes; additional bad-place conditions must be justified, not discarded. In the proper case take D empty, S containing bad reduction places, and 𝒳(R)=X(F) by properness. At b the map is neutral if all selected conditions contain the neutral path class.

**Hypotheses.** Integral global base point and chosen good place v∉S with completion K. T is finite and permits all ramification of the tower and paths. Every imposed local condition is coefficient-stable and contains the geometric local classes relevant to 𝒳(R); Selmer representability is an additional input when the scheme is used.

**Proof outline.**

1. Use the geometric path with global continuous G_F-action, which factors through G_{F,T} in the good integral model.
2. Use NC.3 torsor comparison to form the nonabelian cohomology class.
3. Verify membership at all imposed local conditions; then factor through the existing Selmer functor.
4. For a proper curve apply the valuative criterion at the places outside S to identify the global domain.

**Planning API.**

- `globalEtaleAlbanese_path` (characterisation): The underlying global cohomology class is the class of P_n^et(b,x).
- `globalEtaleAlbanese_base` (simp): The global base point gives the neutral class when that class obeys every local condition.
- `globalEtaleAlbanese_localize` (compatibility): At v, localization is localEtaleAlbanese_n of the image of x in 𝒳(O_K).
- `globalEtaleAlbanese_tower` (functoriality): Depth projection carries the global class to the corresponding lower-depth path class.
- `globalEtaleAlbanese_conditions` (characterisation): Membership in Sel_T is exactly membership of every localized path class in its imposed local subset.

**Unit tests.**

- `globalEtaleAlbanese_base_test` (degenerate): The identity path at b is globally fixed, so the output is the neutral Selmer point when admitted by the conditions.
- `globalEtaleAlbanese_kummer_test` (compatibility): For a proper curve at depth one, the underlying class is κ(AJ_b(x)) in the rational Tate-module Selmer space.
- `globalEtaleAlbanese_local_test` (characterisation): The selected p-adic localization of the global class of x equals the crystalline local path class of that same point, with the same base point.

**Uses.** Kim diagram at the end of §2, p.120: Supplies the Selmer point witnessing membership of every global point in the local locus. NC.4 rational-integral-containment: Preserves all stated bad-place hypotheses in the containment theorem.

**Acceptance.** Imposing an arbitrary bad-place condition need not preserve global-point containment. The claim concerns S-integral points for an open curve and rational points for a proper curve; it does not replace one by the other.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.2/etale-galois`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3/filtered-affine-torsor-comparison`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3/selmer-functor`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3/selmer-representability`.
- `SchemeAndStackFoundations:SF.0`.
- `mathlib:AlgebraicGeometry.IsProper.eq_valuativeCriterion`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3`.

**Source.** §2, global action and global Albanese, pp.119–120; good integral models pp.91–92. The source factors the path action through the restricted-ramification global group and sends integral points to the global Selmer variety.

### 9. The global Selmer period morphism

Node `selmer-period` · construction.

For the NC.3 represented finite-type global Selmer scheme S_n and local crystalline scheme L_n at the chosen good p-adic place K, let loc_n:S_n→L_n be the supplied localization morphism. Define selmerPeriod_n=crystallinePeriodMap_n∘loc_n:S_n→Res_{K/ℚ_p}Q_n as a morphism of ℚ_p-schemes. At K=ℚ_p its target is Q_n. At ℚ_p-points it evaluates localization followed by the crystalline period; its scheme-theoretic image and Zariski closure are taken using the full morphism, not the set of ℚ_p-rational source points. For K≠ℚ_p its base change followed by the Weil-restriction counit gives an auxiliary K-morphism (S_n)_K→Q_n; this is only used with the corresponding K-dimension bound and geometric image closure.

**Hypotheses.** All NC.3 representability and local-condition hypotheses, and crystalline-period hypotheses. Localization lands in the crystalline scheme at the selected place.

**Proof outline.**

1. Import localization rather than reconstructing continuous cohomology or the Selmer scheme.
2. Compose the represented morphisms; at a test algebra the Yoneda map is composition with the same morphism.
3. Use the imported Weil restriction counit for the auxiliary K-morphism if needed.

**Planning API.**

- `selmerPeriod_def` (characterisation): The morphism is loc_n followed by D_n.
- `selmerPeriod_point` (data): For a coefficient point s, its image is D_n(loc_n(s)).
- `selmerPeriod_precompose` (functoriality): Precomposing a source-point map commutes with evaluation of the composite.
- `selmerPeriod_tower` (compatibility): The period morphisms commute with condition-preserving depth projections.
- `selmerPeriod_neutral` (simp): Compatible neutral points are carried to the neutral period.

**Unit tests.**

- `selmerPeriod_identity_local` (degenerate): If D is the identity morphism, selmerPeriod(loc,D)=loc.
- `selmerPeriod_identity_global` (degenerate): If loc is the identity morphism, selmerPeriod(loc,D)=D.
- `selmerPeriod_point_associativity` (compatibility): For every actual test-object point s:B→S, s followed by selmerPeriod equals (s followed by loc) followed by D.

**Uses.** Kim §3, pp.120–121: Its geometric image supplies the annihilating regular equation. NC.4 kim-loci: Its rational point image defines the de Rham locus.

**Acceptance.** The composite has a source and target over the same coefficient field. The construction retains all global local conditions and does not identify Selmer points with rational curve points.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/crystalline-period`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3/selmer-localization-naturality`.
- `ReductiveGroupsPartII:RG2.0a/weil-restriction-adjunction`.
- `mathlib:CategoryTheory.Over.mk`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3`.

**Source.** Introduction, diagram p.95; §2, finite-level diagram p.120. Kim composes localization with the crystalline period map to obtain the algebraic image governing the local curve.

### 10. Compatibility of global paths, localization and periods

Node `fundamental-diagram` · comparison.

For every x∈𝒳(R) satisfying global-etale-albanese's hypotheses, write ι_v(x)∈𝒳(O_K) for its local image. Then loc_n(globalEtaleAlbanese_n(x))=localEtaleAlbanese_n(ι_v(x)), crystallinePeriodMap_n(localEtaleAlbanese_n(y))=localAlbanese_n(y) for all y∈𝒳(O_K), and consequently selmerPeriod_n(globalEtaleAlbanese_n(x))=localAlbanese_n(ι_v(x)), interpreting Res_{K/ℚ_p}Q_n(ℚ_p)=Q_n(K). These equalities commute with depth projection and coefficient extension wherever defined. No assertion that every local point is global, or that D_n is invertible, is included.

**Hypotheses.** The same curve, base point, central quotient and good place are used in all four maps. The nonlinear comparison respects the two endpoint augmentations, filtrations, torsor structures and Frobenius.

**Proof outline.**

1. Restrict the global path Galois action to G_K to get the local path torsor, and use the naturality of NC.3 H¹ restriction.
2. Identify the period functor of the étale path with its geometric de Rham path by the imported NC.2 multiplicative comparison.
3. Apply admissible-classification, then compose localization and D_n.

**Acceptance.** At depth one it is the Kummer/logarithm diagram for AJ_b. The same nonabelian gauge-orbit class is used before and after restriction.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/local-albanese`.
- `AnabelianGeometryAndNonabelianChabauty:NC.4/local-etale-albanese`.
- `AnabelianGeometryAndNonabelianChabauty:NC.4/global-etale-albanese`.
- `AnabelianGeometryAndNonabelianChabauty:NC.4/selmer-period`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-path-comparison`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3/selmer-localization-naturality`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3/h1-restriction`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2`.

**Source.** §2, concluding diagrams and comparison discussion, p.120. The endpoint-compatible nonlinear comparison is the reason the triangle and global square commute.

### 11. The exact, period-image and closed-image loci

Node `kim-loci` · definition · Planet **Chabauty–Kim locus**.

Put Y=𝒳(O_K), j_n=localAlbanese_n, j_n^et=localEtaleAlbanese_n, and ℓ_n=selmerPeriod_n on ℚ_p-points (interpreted in Q_n(K)). Define crystallineLocus_n={y∈Y:∃s∈S_n(ℚ_p), loc_n(s)=j_n^et(y)} and deRhamLocus_n={y∈Y:∃s∈S_n(ℚ_p), ℓ_n(s)=j_n(y)}. Let Z_n be the reduced Zariski closure of the geometric image of the full scheme morphism ℓ_n in Res_{K/ℚ_p}Q_n; define closedDeRhamLocus_n={y∈Y:j_n(y)∈Z_n(ℚ_p)}. Then crystallineLocus_n⊆deRhamLocus_n⊆closedDeRhamLocus_n. The first inclusion uses the fundamental-diagram; equality requires a separate saturation/injectivity property of D_n. The second inclusion need not be equality: taking the geometric image closure does not promise a ℚ_p-rational Selmer lift. For a K-valued auxiliary morphism use its own geometric image closure and call the resulting enlarged locus by that morphism, not by an unexplained change of scalars. Native set reductions take the supplied maps between actual point carriers, and for the closed locus the supplied point subset Z_n(ℚ_p); computing that subset from the scheme morphism is a separate geometric interface.

**Hypotheses.** The same domains, coefficient points, local conditions and good place are used in all maps. Z_n is the closure of the scheme image, not the p-adic closure and not merely the closure of rational source points.

**Proof outline.**

1. Define the two inverse images of set-theoretic point images.
2. Import the closed reduced subscheme attached to the scheme-image closure for the third definition.
3. Apply the commutative comparison triangle and the inclusion of each source-point image in the geometric image closure.

**Planning API.**

- `crystallineLocus_mem` (characterisation): y belongs iff its actual crystalline class has a ℚ_p-rational global Selmer lift.
- `deRhamLocus_mem` (characterisation): y belongs iff its actual de Rham period has a ℚ_p-rational Selmer preimage under ℓ_n.
- `closedDeRhamLocus_mem` (characterisation): y belongs iff its period lies in the point subset of the geometric image closure.
- `kimLoci_inclusions` (relation): Under D_n∘j_n^et=j_n, the three loci are included in order.
- `deRhamLocus_mono` (functoriality): Enlarging the supplied global period image enlarges its inverse-image locus.
- `kimLoci_ext` (extensionality): Equality of supplied point maps, images and closed-image point subsets gives equality of the corresponding loci.

**Unit tests.**

- `kimLoci_identity` (degenerate): For any point map j:Y→Q and global period map id_Q, deRhamLocus(j,id)=Y.
- `kimLoci_empty_source` (degenerate): For an empty global point carrier, deRhamLocus is empty, regardless of the local point map.
- `kimLoci_square_image` (non-example): On ℚ-points of A¹ let ℓ(u)=u² and j(t)=t. The point −1 is absent from the image locus but belongs to the closed-image locus since the geometric scheme image is dense in A¹. This tests the image/closure distinction, not the p-adic topology.

**Uses.** Kim §3, p.121: These are the local candidate sets to which the analytic finiteness argument applies. NC.5 quadratic Chabauty and ED.6 certified candidates: Height equations cut out a computable enlargement and need the same distinction between containment and equality.

**Acceptance.** These are sets of local points, not sets of de Rham periods; no injectivity of j_n is assumed. A positive-dimensional or all-target closed image alone supplies no finiteness.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/fundamental-diagram`.
- `AnabelianGeometryAndNonabelianChabauty:NC.4/selmer-period`.
- `SchemeAndStackFoundations:SF.0`.
- `mathlib:AlgebraicGeometry.Scheme.zeroLocus`.

**Source.** §3, intersection description p.121; diagram pp.95 and 120. The source traps global periods in the intersection with the Selmer image. The three inverse-image definitions make explicit the two enlargements used in that argument.

### 12. Depth projection and change of conditions for the loci

Node `locus-compatibilities` · theorem.

For m≤n suppose the quotient U_n→U_m induces maps S_n→S_m, L_n→L_m and Q_n→Q_m preserving every chosen local condition and commuting with the local and global period diagrams. Then crystallineLocus_n⊆crystallineLocus_m and deRhamLocus_n⊆deRhamLocus_m; the corresponding closed-image loci are nested because the continuous algebraic quotient maps carry the higher geometric image closure into the lower one. For two systems of conditions on the same global functor, inclusion C_v⊆C′_v at every place gives inclusion of all three loci from the more restrictive to the less restrictive system. At fixed depth, if D_n is injective on local crystalline ℚ_p-points, then crystallineLocus_n=deRhamLocus_n; more generally equality follows if the localization image is saturated under D_n on the local geometric classes. No unconditional equality with the closed-image locus or with the rational point set is asserted.

**Hypotheses.** Represented diagram maps exist and preserve the specified local conditions. For the last assertion, injectivity or the stated saturation is an additional hypothesis.

**Proof outline.**

1. Project a Selmer-point witness and use diagram commutativity for the image loci.
2. For the closed-image locus, continuity sends a point of a closure into the closure of the target image.
3. For equality of crystalline and period loci, pull a D_n equality back using injectivity or saturation.

**Acceptance.** The decreasing tower is an inclusion of local-point sets even though every j_n is generally many-to-one. Dropping a local condition enlarges the locus; it cannot provide a stronger containment bound.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/kim-loci`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3/selmer-localization-naturality`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/central-quotients`.
- `SchemeAndStackFoundations:SF.0`.

**Source.** Finite-depth diagrams pp.93 and 120, and Selmer conditions p.95. The source’s compatible tower and point images imply the stated functorial inclusions; the equality criterion is a direct consequence with its additional hypothesis.

### 13. Global points lie in the Chabauty–Kim loci

Node `rational-integral-containment` · theorem.

In the global good-reduction datum, with all imposed local conditions verified on every allowed geometric path, ι_v(𝒳(R))⊆crystallineLocus_n⊆deRhamLocus_n⊆closedDeRhamLocus_n for every n≥1. In the proper case the first term is the image of X(F). This supplies a global Selmer witness for each integral or rational point. If a locus is finite, so is the global domain, since the field inclusion F→K induces an injective map on points of the F-scheme X. The theorem claims neither the reverse containment nor equality of the intersection with the global set.

**Hypotheses.** All hypotheses of global-etale-albanese and fundamental-diagram, including all bad-place local conditions. For the final implication use the faithful field inclusion; it does not require injectivity of the Albanese map.

**Proof outline.**

1. For x∈𝒳(R), globalEtaleAlbanese_n(x) is the required Selmer witness and its localization equals the local class.
2. Apply kim-loci inclusions.
3. Use injectivity of scalar extension along F→K on rational points to pull back a finite local-point set.

**Acceptance.** For a proper curve the statement bounds every rational point, including those outside an arbitrary chosen affine patch. For an open curve it bounds only the selected S-integral domain.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/global-etale-albanese`.
- `AnabelianGeometryAndNonabelianChabauty:NC.4/fundamental-diagram`.
- `AnabelianGeometryAndNonabelianChabauty:NC.4/kim-loci`.
- `SchemeAndStackFoundations:SF.0`.

**Source.** Introduction p.95 and §3 p.121. The fundamental diagram gives the actual global witness and the local intersection containment.

### 14. Pullback of regular period functions

Node `regular-pullback` · construction.

For A_n=O(Q_n) and Y=𝒳(O_K), define regularAlbanesePullback_n:A_n→(Y→K) by f↦(y↦f(j_n(y))). It is a K-algebra homomorphism, and iterated-coordinates shows its image consists of the corresponding Coleman functions on ordinary integral discs. The algebra-valued refinement targets the imported Coleman function algebra once its native carrier and the geometric evaluation bridge are available; the function-valued map itself is fully expressible on K-points viewed as K-algebra homomorphisms A_n→K. Disc-density implies that restriction of this map to any nonempty residue disc is injective. If f vanishes on the global Selmer geometric image closure, its pullback vanishes on the de Rham and closed-image loci, and hence on allowed global points.

**Hypotheses.** The period variety is affine and geometrically integral over K; use the geometric K-variant of the image closure if K≠ℚ_p. Local point evaluation and Coleman membership follow the NC.2/L1 word-path convention.

**Proof outline.**

1. Compose actual algebra-valued K-points with the coordinate algebra element f, preserving sums, products, constants and one.
2. Apply iterated-coordinates for Coleman membership.
3. Apply residue-disc-density for injectivity and kim-loci definitions for the vanishing claim.

**Planning API.**

- `regularAlbanesePullback_apply` (data): For an actual K-point j(y):A_n→K, the value at y is j(y)(f).
- `regularAlbanesePullback_add` (simp): Pullback of f+g is the sum of the two pullbacks.
- `regularAlbanesePullback_mul` (simp): Pullback of fg is the product of the two pullbacks.
- `regularAlbanesePullback_const` (compatibility): A scalar r∈K pulls back to the constant function r.
- `regularAlbanesePullback_reindex` (functoriality): Reindexing local points along a map composes each pulled-back function with that map.
- `regularAlbanesePullback_injective_disc` (characterisation): If j(B) is K-Zariski dense, pullback to B is injective.

**Unit tests.**

- `regularAlbanesePullback_affine_coordinate` (computation): For A=K[t], Y=K and j(a) evaluation at a, the pullback of t at a is a.
- `regularAlbanesePullback_product_test` (computation): For the same family, the pullback of t(t+1) at a is a(a+1), so an additive-only substitute fails.
- `regularAlbanesePullback_unit_test` (non-example): For that family over a nontrivial field, pullback of 1 is the nonzero constant 1, including at a=0; a derivative or normalized primitive is not this map.

**Uses.** Kim §3, p.121: Creates the nonzero scalar analytic function whose zero set bounds the local locus. NC.5 and ED.6: Provides the evaluation map for explicit period and height equations.

**Acceptance.** A nonzero regular f cannot pull back to the zero function on an entire nonempty residue disc. Individual vanishing values are allowed; injectivity is not injectivity of j_n on points.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/iterated-coordinates`.
- `AnabelianGeometryAndNonabelianChabauty:NC.4/residue-disc-density`.
- `AnabelianGeometryAndNonabelianChabauty:NC.4/kim-loci`.
- `mathlib:AlgHom.comp`.

**Source.** §1, proof of Theorem 1 pp.111–114; §3, p.121. Kim pulls an algebraic equation back to an iterated Coleman function, and density supplies discwise nonvanishing.

### 15. A regular equation from a small Selmer image

Node `selmer-annihilator` · theorem.

Let k be a characteristic-zero field, S a finite-type affine k-scheme, Q a geometrically integral affine finite-type k-scheme, and ℓ:S→Q a k-morphism. Let Z be the reduced closed subscheme whose underlying set is the closure of the geometric image of ℓ. If dim S<dim Q, then dim Z≤dim S, Z≠Q, and there exists a nonzero f∈O(Q) vanishing on Z. The same conclusion holds under the weaker hypothesis dim Z<dim Q. Here dimensions are Krull dimensions of schemes, not vector-space ranks of their coordinate rings. Nilpotents of S are retained in ℓ but do not enlarge the topological image; f need only vanish on the reduced closure, not pull back to zero on a nonreduced S. For S empty take Z empty and f=1. At k=ℚ_p, apply this to selmerPeriod_n. For K≠ℚ_p one may apply it instead to the auxiliary K-morphism (S_n)_K→Q_n under dim_{ℚ_p}S_n<dim_K Q_n; merely having dim S_n<dim Res Q_n does not give this conclusion in Q_n.

**Hypotheses.** Finite type is required for the image dimension bound; Q is integral and affine for a nonzero global regular equation. All dimensions and the image morphism are over the same stated field.

**Proof outline.**

1. For each irreducible component of the reduced source, use the generic fibre dimension formula to bound the dimension of its image closure.
2. Take the finite union of component image closures; strict inequality makes it proper.
3. A proper reduced closed subscheme of an affine integral scheme has a nonzero defining ideal; choose f in that ideal.
4. For the K-variant use the Weil restriction counit and invariance of source dimension under field extension.

**Acceptance.** For ℓ:A¹→A¹ given by u↦u², dimensions are equal and Z=Q, so the theorem supplies no equation even though many k-points have no lift. For a constant map into A², a coordinate vanishing at the image point is a possible nonzero f.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/selmer-period`.
- `SchemeAndStackFoundations:SF.0/fibre-dimension-formula`.
- `SchemeAndStackFoundations:SF.0/algebraic-scheme-dimension`.
- `ReductiveGroupsPartII:RG2.0a/weil-restriction-adjunction`.
- `mathlib:AlgebraicGeometry.Scheme.zeroLocus`.
- `SchemeAndStackFoundations:SF.0`.

**Source.** §3, dimension argument pp.120–121; Conjecture 1 p.96. Kim uses a dimension inequality to obtain a proper geometric period image and then a regular annihilator; the statement isolates all algebraic hypotheses.

### 16. Finiteness under discwise nonvanishing

Node `finite-annihilator-locus` · theorem.

Let K/ℚ_p be finite and let Y=𝒳(O_K) be the integral tube in a smooth proper good-reduction compactification with finite étale boundary removed. Let j:Y→Q(K) have Coleman-analytic regular-function pullbacks on each ordinary residue disc. If Z⊊Q is a closed subset and some f∈O(Q), f≠0, vanishes on Z and f∘j is not identically zero on each nonempty integral residue disc, then {y∈Y:j(y)∈Z(K)} is finite. In particular the image-defined locus contained in that set is finite. Every disc has K-points parametrized by m_K=πO_K; the pullback on the open geometric disc has a convergent power series, and substituting t=πs produces a nonzero restricted series on the compact closed unit disc O_K. Strassmann then gives finitely many zeros in each disc, and there are finitely many residue discs. The statement supplies finiteness, not an effective uniform bound or equality with global points.

**Hypotheses.** Finite extension K is essential for compactness and a finite residue field; the full C_p-disc is not the domain. The local functions are analytic on the whole ordinary open geometric residue disc and nonzero on each integral disc. Only integral discs disjoint from the removed boundary are used; no open punctured-disc compactness assertion is made.

**Proof outline.**

1. Use the existing good-reduction residue-disc parameterization from L1 and the finiteness of 𝒳(k).
2. Rescale t=πs: convergence at a real radius strictly between |π| and 1 implies the rescaled coefficients tend to zero.
3. Use the ED.4 Strassmann theorem on each nonzero rescaled series.
4. Take a finite union of finite zero sets, then its subset cut out by Z.

**Acceptance.** If f∘j vanishes identically on one disc, that disc may remain wholly in the locus and the criterion does not apply. An arbitrary nonzero function analytic only on an open disc need not have finitely many zeros throughout that geometric disc.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/regular-pullback`.
- `ColemanIntegration:L1/residue-disc-parametrisation`.
- `ColemanIntegration:L1/word-algebra-local-expansion`.
- `EffectiveDiophantineMethods:ED.4/strassmann-bound`.
- `ColemanIntegration:L1`.

**Source.** §3, the Coleman-function zero-set argument, p.121. Kim bounds the integral local set by zeros on finitely many residue discs. The rescaling specifies the compact domain needed to apply the imported Strassmann theorem.

### 17. Conditional Chabauty–Kim finiteness

Node `dimension-finiteness` · theorem · Planet **Chabauty–Kim finiteness criterion**.

Let X/ℚ be smooth geometrically connected hyperbolic, with integral global base point b and the good models, ramification set and local conditions of global-etale-albanese. Choose p∉S and depth n≥1. Assume the NC.3 global Selmer functor is represented by a finite-type affine scheme S_n and the crystalline comparison gives the morphism ℓ_n:S_n→Q_n at K=ℚ_p. If dim S_n<dim Q_n, then closedDeRhamLocus_n, deRhamLocus_n and crystallineLocus_n are finite, and consequently 𝒳(ℤ[S⁻¹]) is finite. If X is proper, X(ℚ) is finite. One may replace the inequality by a proper geometric image closure together with a nonzero regular annihilator; Kim discwise density supplies the needed nonvanishing. No assertion that a depth satisfying the inequality exists is included: Kim Conjecture 1 and motivic conjectural dimension inputs remain hypotheses, not theorems of NC.4. For a number field F, use finite-annihilator-locus with its explicit K-nonvanishing hypothesis, or the auxiliary K-morphism bound dim S_n<dim_K Q_n; a bound against dim_{ℚ_p}Res Q_n alone is insufficient without stronger Weil-restriction discwise density.

**Hypotheses.** All local conditions contain the allowed global path classes, including bad places. The nonlinear comparison and representability inputs are supplied; they remain imported plans with their recorded gaps. The strict dimension inequality is a verified or assumed mathematical input, never silently concluded from the theorem.

**Proof outline.**

1. Use selmer-annihilator to choose a nonzero regular equation for the geometric Selmer period image closure.
2. Use residue-disc-density and regular-pullback to obtain a nonzero analytic function on every integral disc.
3. Apply finite-annihilator-locus and the three locus inclusions.
4. Use rational-integral-containment and the injective field embedding to deduce global finiteness.

**Acceptance.** For a proper genus-g curve at depth one the target has dimension g; the source dimension is a Selmer dimension, not automatically the Mordell–Weil rank. The statement applies even when the period map itself is not injective.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/selmer-annihilator`.
- `AnabelianGeometryAndNonabelianChabauty:NC.4/residue-disc-density`.
- `AnabelianGeometryAndNonabelianChabauty:NC.4/finite-annihilator-locus`.
- `AnabelianGeometryAndNonabelianChabauty:NC.4/rational-integral-containment`.

**Source.** Conjecture 1 and following conditional implication, p.96; §3 proof pp.120–121. The source gives an implication from a strict finite-level dimension bound to finiteness, while the existence of such a level is conjectural.

### 18. The depth-one Albanese and abelian logarithm

Node `depth-one-period` · comparison.

For a proper smooth geometrically connected genus-g curve X/ℚ with b∈X(ℚ) and good reduction at p, use NC.2's abelianization U_1^et=V_pJ and the filtered de Rham identification U_1^dR=H¹_dR(X/ℚ_p)^∨, H_1=Ann(H⁰(X,Ω¹)), Q_1≃Lie(J). With the Lie identification normalized to the endpoint Kummer/Abel–Jacobi comparison, the local crystalline path class is κ_p(AJ_b(x)) and the identified de Rham period is log_J(AJ_b(x)). Pairing with ω∈H⁰(X,Ω¹) gives the single Coleman integral ∫_b^xω. Fix the convention explicitly: in NC.2's universal connection d−∑T_iω_i the forward Frobenius path has coefficient +I_i; our torsor ratio has representative I⁻¹γ, so its raw first-level coordinate is γ_i−I_i. The Lie comparison sends the raw quotient coordinate with the compensating sign to the usual logarithm; it does not identify +I_i with that raw torsor ratio. This sign normalization leaves linear-subspace loci unchanged. For an open curve the generalized Jacobian/boundary contribution is a separate input, and is not identified with the proper Jacobian in this node.

**Hypotheses.** Proper curve and NC.2's de Rham H¹/Hodge–Abel–Jacobi bridge; good-reduction rational Tate-module comparison. Use the same path direction b→x and the displayed ratio convention in every realization.

**Proof outline.**

1. Import the NC.2 depth-one group and cohomology bridge; do not reconstruct J, the Tate module or the Hodge exact sequence.
2. Use the NC.3 depth-one comparison for the actual Kummer class.
3. Use ED.4’s abelian logarithm and Coleman/abelian integral comparison, transporting the raw coordinate sign through the normalized Lie identification.

**Acceptance.** Depth one here is Kim U_2, and Q_1 has dimension g; depth zero is trivial. For x=b every pairing is zero; for a differential the derivative of the paired period is ω, with the above sign normalization. The open-curve target includes puncture directions and needs the generalized Jacobian; deleting them would change the definition.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/fundamental-diagram`.
- `AnabelianGeometryAndNonabelianChabauty:NC.4/iterated-coordinates`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2/depth-one-jacobian`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3/depth-one-selmer-comparison`.
- `EffectiveDiophantineMethods:ED.4/abelian-logarithm`.
- `EffectiveDiophantineMethods:ED.4/coleman-abelian-comparison`.
- `AnabelianGeometryAndNonabelianChabauty:NC.2`.

**Source.** Introduction, bottom of the tower p.93 and abelian diagram p.95; §1 word conventions pp.109–112. Kim identifies the first nontrivial level with the usual Albanese logarithm. This comparison records the transport needed for the NC.2 forward-word and NC.4 ordered-ratio conventions.

### 19. The precise classical Chabauty comparison

Node `depth-one-locus` · comparison.

In depth-one-period's proper setting, let W_S⊆Lie(J)(ℚ_p) be the image of the linear global Selmer space under the normalized logarithmic period map, and W_MW=span_{ℚ_p}{log_J(P):P∈J(ℚ)}. The de Rham image locus at depth one is {x∈X(ℚ_p):log_J(AJ_b(x))∈W_S}, equivalently the common zero set of ∫_b^xω for all linear forms ω∈Ann(W_S). The image is already a closed linear subspace, so its period-image and geometric-closed-image loci coincide in this linear setting. For the usual local conditions the Mordell–Weil Kummer map lies in the Selmer space, giving W_MW⊆W_S; if additional conditions are imposed, this containment must be an explicit hypothesis. The classical common-annihilator Chabauty locus is obtained by replacing W_S with W_MW, and is a subset of the Selmer locus under that containment. If W_S=W_MW, the two loci agree. A rank bound rank J(ℚ)<g gives dim W_MW<g and classical finiteness by the imported ED.4 theory, but gives finiteness of the full depth-one Selmer locus only with dim W_S<g (e.g. W_S=W_MW). No vanishing of a Tate–Shafarevich contribution or equality Selmer=Mordell–Weil is assumed without a stated extra input. The common-annihilator locus is logarithmically saturated; it is not asserted equal to AJ_b⁻¹ of the literal topological closure of J(ℚ).

**Hypotheses.** All depth-one-period hypotheses; the represented depth-one Selmer space and period map are linear over ℚ_p. Containment of the whole Mordell–Weil Kummer image is needed when comparing its classical locus with a refined Selmer locus. Equality of the two period subspaces is a separate hypothesis.

**Proof outline.**

1. Import the linear rational Tate-module Selmer and Kummer comparison from NC.3.
2. Identify the first de Rham map with the logarithm by depth-one-period.
3. Use the baseline double-annihilator identity to express membership in W_S by all annihilating linear forms.
4. Use ED.4 annihilating differentials and residue-disc zero bounds for classical finiteness; retain the separate Selmer dimension input.

**Acceptance.** If W_S=Lie(J) and W_MW is proper, the full Selmer locus is X(ℚ_p) while the classical locus can be finite. For W=0 the period-image locus is the zero logarithm fibre; for W=Lie(J) it is the whole local curve. The annihilator formulation preserves constants of integration through the same global base point b.

**Direct prerequisites.**

- `AnabelianGeometryAndNonabelianChabauty:NC.4/kim-loci`.
- `AnabelianGeometryAndNonabelianChabauty:NC.4/depth-one-period`.
- `AnabelianGeometryAndNonabelianChabauty:NC.3/depth-one-selmer-comparison`.
- `EffectiveDiophantineMethods:ED.4/annihilating-differentials`.
- `EffectiveDiophantineMethods:ED.4/padic-closure-dimension`.
- `EffectiveDiophantineMethods:ED.4/residue-disc-zero-bound`.
- `mathlib:Subspace.forall_mem_dualAnnihilator_apply_eq_zero_iff`.
- `mathlib:Subspace.finrank_add_finrank_dualAnnihilator_eq`.

**Source.** Introduction, comparison with classical Chabauty p.95; §3, p.121. Kim identifies the abelian-level diagram while explicitly distinguishing the Selmer replacement of the Mordell–Weil group. Linear algebra gives the exact common-annihilator locus with the additional equality hypothesis spelled out.

## Why the finiteness chain has these hypotheses

The global path square first places every allowed global point in the crystalline-image locus. Passing through D gives the period-image locus; taking the reduced geometric image closure gives a third, potentially larger set. The proof needs an annihilator for that geometric closure. It does not need every point of the closure to admit a rational Selmer lift, and it does not assert equality of these three sets.

At K=ℚ_p a strict bound dim S_n<dim Q_n makes the geometric period image closure proper. Affineness and integrality of Q_n then give a nonzero regular function f vanishing on it. Discwise density makes f∘j_n nonzero on each integral residue disc. Ordinary Coleman analyticity gives a local series converging for |t|<1. For K-points t belongs to πO_K; substitution t=πs gives coefficients tending to zero on compact O_K. Strassmann bounds the zeros of this nonzero restricted series. The finite residue field supplies only finitely many discs, and an injective scalar extension of curve points transfers local finiteness to the global domain.

There are two distinct traps. A function nonzero globally may be identically zero on one disc, so the discwise statement is essential. A nonzero function on a whole open geometric p-adic disc need not have finitely many zeros there; compactness applies to the integral K-points after rescaling. An available generic analytic-zero theorem requiring a preconnected ambient set cannot be applied to a p-adic residue disc, which is totally disconnected. The proof therefore imports the actual restricted-series Strassmann bound from ED.4.

For K≠ℚ_p the represented period target is Res_{K/ℚ_p}Q_n. Density of j_n on a K-disc in Q_n does not imply density in that larger ℚ_p-variety. A bound against dim Res Q_n therefore does not alone give a nonzero K-equation with nonzero disc pullback. The general number-field criterion retains explicit discwise nonvanishing; a sufficient alternative uses the counit morphism (S_n)_K→Q_n and the stronger bound dim S_n<dim_K Q_n. Its image closure and locus belong to that auxiliary morphism. They are not relabelled as the original Weil-restriction closed-image locus.

At depth one the de Rham Selmer period image is linear and hence already Zariski closed. Its locus is described by the annihilator of W_S. The classical common-annihilator locus uses W_MW instead. The usual Kummer containment gives W_MW⊆W_S, and equality of these subspaces gives equality of the loci. The Mordell–Weil rank bound proves classical finiteness through ED.4; the full Selmer locus still needs its own strict dimension bound. Additional local conditions, or a Tate–Shafarevich contribution, cannot be suppressed in this comparison.

## Baseline interfaces actually checked

The following full statements and hypotheses were read at the Mathlib pin. They are used as native reductions, not as claims that the geometric objects are formalized.


- `mathlib:Torsor` (Mathlib/Algebra/Torsor/Defs.lean): Simply transitive left group action with scalar division; the opposite group gives the required right-torsor point interface.
- `mathlib:QuotientGroup.leftRel` (Mathlib/GroupTheory/Coset/Defs.lean): Left cosets gH identified by g⁻¹g′∈H; H need not be normal.
- `mathlib:AlgHom.comp` (Mathlib/Algebra/Algebra/Hom.lean): Composition of actual algebra homomorphisms, including maps from coordinate algebras to coefficient rings.
- `mathlib:CategoryTheory.Over.mk` (Mathlib/CategoryTheory/Comma/Over/Basic.lean): Objects over a fixed base and their native morphisms; represented period maps can be composed there.
- `mathlib:AlgebraicGeometry.Scheme.zeroLocus` (Mathlib/AlgebraicGeometry/Scheme.lean): Closed zero set of a family of genuine global sections of a scheme.
- `mathlib:Subspace.forall_mem_dualAnnihilator_apply_eq_zero_iff` (Mathlib/LinearAlgebra/Dual/Lemmas.lean): Membership of v in a subspace iff every linear form in its dual annihilator vanishes on v.
- `mathlib:Subspace.finrank_add_finrank_dualAnnihilator_eq` (Mathlib/LinearAlgebra/Dual/Lemmas.lean): For a finite-dimensional vector space, the dimension of a subspace plus the dimension of its annihilator is the ambient dimension.
- `mathlib:AlgebraicGeometry.IsProper.eq_valuativeCriterion` (Mathlib/AlgebraicGeometry/ValuativeCriterion.lean): Properness gives the valuative existence/uniqueness criterion, together with the stated quasi-compactness, quasi-separatedness and finite-type conditions.

## Supplier refinements and geometric boundary

The following requests are exact interfaces needed by the targets. Their owner remains unchanged. Requested refinements of a current upstream roadmap are reported to the maintainer; this layer does not edit or re-plan that roadmap.


**`tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.** For a split unipotent affine finite-type group U over a characteristic-zero field and closed split unipotent H, supply the nonnormal right homogeneous fppf quotient U/H as a smooth geometrically integral affine scheme, its coordinate algebra and universal torsor, with functorial maps induced by condition-preserving homomorphisms and field extension. Existing normal group quotients alone do not suffice. This is a requested refinement of an existing upstream roadmap, not a replacement plan.

Consumers: `admissible-period`, `admissible-classification`.

**`tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`.** For split smooth unipotent H over a characteristic-zero field K and every commutative K-algebra R, show every fppf H-torsor over Spec R is trivial, using a split central G_a filtration and affine additive-cohomology vanishing. Consequently the represented homogeneous quotient has Q(R)=U(R)/H(R), including nonreduced R. Record a native torsor interface; a K-point-only assertion is insufficient.

Consumers: `admissible-period`, `admissible-classification`.

**`SchemeAndStackFoundations:SF.0`.** Supply the reduced closed subscheme associated with the closure of the geometric image of a finite-type affine morphism, the inclusion of every coefficient point image, and maps between such closures in a commuting diagram. Supply injectivity of rational-point scalar extension along a field embedding. These are native scheme/point interfaces, not p-adic or rational-image closure substitutes.

Consumers: `kim-loci`, `locus-compatibilities`, `rational-integral-containment`, `selmer-annihilator`.

**`AnabelianGeometryAndNonabelianChabauty:NC.2`.** Supply the native right geometric path-torsor families with full normalized Hodge filtration, Frobenius-fixed sections and condition-preserving finite-depth projections. Complete the already recorded two-augmentation multiplicative crystalline comparison, and explicitly transport the forward affine word element I to the ordered ratio I⁻¹γ and the normalized depth-one Hodge–Abel–Jacobi/Lie identification. No general linear Hodge theory is replanned.

Consumers: `local-albanese`, `iterated-coordinates`, `crystalline-period`, `fundamental-diagram`, `depth-one-period`.

**`AnabelianGeometryAndNonabelianChabauty:NC.3`.** Supply the native coefficient-algebra-valued continuous nonabelian crystalline H¹ and global Selmer functors, with conditional finite-type affine representability under the hypotheses already planned in NC.3. The B_cr-admissible period functor must be natural on all Q_p-algebras, preserve the nonlinear endpoint comparison and chosen local conditions, and respect localization and depth. Neither de Rham-only classes nor a guessed affine coordinate algebra may replace it.

Consumers: `crystalline-period`, `local-etale-albanese`, `global-etale-albanese`, `selmer-period`.

**`ColemanIntegration:L1`.** Supply a finite cover of the integral points of a smooth proper good-reduction curve by ordinary residue charts even when the global boundary is empty; identify local parameters with m_K and analytic word-function expansions on the full geometric disc, compatible with the imported proper extending quotient. The existing affine nonempty-boundary datum must be extended by charts, without adding punctured boundary germs to the integral domain. For a proper curve the auxiliary affine chart may remove a finite étale divisor of higher degree; do not assume a second K-rational residue disc exists.

Consumers: `iterated-coordinates`, `finite-annihilator-locus`.

**Ownership proposal.** Extend Reductive groups, Part II by a foundational split-unipotent homogeneous-space refinement building on current ReductiveGroups layers 3 and 5 and SchemeAndStackFoundations SF.1. It supplies affine representability of U/H and H-torsor vanishing over every affine coefficient algebra, including nonreduced ones. Keep existing reductive-group and Weil-restriction targets unchanged. NC.4 imports that refinement; it owns only admissible periods, Albanese maps, loci and their conditional finiteness. Until the maintainer assigns the refinement, use the current upstream owner stages and the exact requests in this packet.

The suggested file instantiates the right-torsor ratio and endpoint family, affine coefficient-point composition including dual numbers, represented scheme-morphism composition, inverse-image point loci, regular-function evaluation and the linear annihilator comparison. Its chosen maps and point carriers are mathematical arguments to these reductions; supplying them does not prove their geometric existence. A closed-image point subset is an explicit input to the set reduction, not an arbitrary assertion that it equals a Selmer point image.

Full local/global étale path-class signatures are omitted because the native continuous crystalline and Selmer class carriers are missing. Full filtered/Frobenius classification, iterated Coleman coordinate evaluation, disc density, image-dimension annihilator and analytic finiteness signatures also need the listed interfaces. The omitted names, API items and examples are recorded individually in the suggested file. No missing condition is encoded by an opaque proposition or a fabricated structure. The native point square proves only the consequence of the imported geometric comparison equalities.

Three recorded gaps summarize this boundary:


- **Native geometric signatures are unavailable at the pinned baseline.** The suggested file checks genuine torsor-point, coordinate-algebra, scheme-morphism, set and linear-algebra reductions. The full admissible filtered/Frobenius torsor carrier, continuous nonabelian Galois classes, geometric image-closure point bridge, Coleman-function algebra and analytic disc interface are not all native at the pins. Exact geometric signatures and the associated API/test refinements are explicitly omitted in the prototype and requested from their owners; no arbitrary proposition field replaces them.
- **Nonlinear crystalline comparison and depth-one convention bridge remain supplier work.** NC.2 already records the missing endpoint-compatible multiplicative comparison from its cohomological suppliers and the proper Hodge–Abel–Jacobi bridge. NC.4 is conditional on those inputs and makes the forward-word/ordered-ratio sign transport explicit; compilation of point reductions proves neither comparison.
- **Global and local affine representability is conditional.** Use NC.3 finite H⁰/H¹/H² and closed local-condition hypotheses, including all coefficient algebras and bad places. The global Selmer dimension bound and the existence of a level satisfying it are external inputs; Kim Conjecture 1 is not proved by this pass.

## Source corrections awaiting independent review

Two contextual printing slips in the published version are recorded in the packet. Neither changes the intended mathematics, and neither is treated as an independently confirmed erratum here.


**E1 — Published version, introduction p.92, choice of v over p.** The chosen place over the rational prime p is described as archimedean. Use a nonarchimedean finite place v over p. The completion F_v is used as a finite extension of Q_p, with ring of integers, residue field and crystalline Galois theory throughout the subsequent construction.

**E2 — Published version, §3 p.121, regular annihilator in the dimension argument.** The quotient supporting the annihilating regular function is labelled with the étale group and its F⁰ subgroup. The function belongs to the de Rham Hodge quotient U_n^dR/F⁰, the target of the de Rham Albanese map. The Hodge filtration and the map j_n used to pull back that function belong to the de Rham realization; the preceding comparison diagram places the global period image there.

The EMS article/journal record, arXiv record/version history and a search for a correction to this 2009 paper were checked. No existing correction to these slips was located; an erratum concerning a 2011 Massey-product article is a different source. The packet preserves the publication URL, access date and file hash and supplies the evidence for an independent reviewer.

## Layer acceptance and completion criteria

The acceptance checks include the orientation p_φu=p_H against the nonnormal S₃ test, the correspondence between Kim's indexing and our depth one, and the I⁻¹γ coordinate transport. Verify that localization respects all chosen conditions, that the crystalline period is natural on nonreduced coefficient algebras, and that the image closure uses the represented morphism rather than rational source points. Test density disc by disc and verify the compact-domain rescaling before importing Strassmann. At depth one, retain the distinction between W_S and W_MW and the extra equality hypothesis.

This target-level pass is complete when all 19 nodes, 41 API items and 24 definition tests agree across the packet, reader and suggested file; the packet checker has no errors; and the suggested file elaborates on the pinned build with only admitted-proof warnings. Closure additionally requires the six supplier refinements and the three recorded gaps to be resolved. There is no claim of formal implementation or of a proved dimension inequality. The [handoff](../handoff/BP-AnabelianGeometryAndNonabelianChabauty--NC.4.md) records the validation and precise next work.
