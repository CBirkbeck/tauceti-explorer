# Fundamental groupoids and sections — NC.0

This is the target-level continuation of the accepted [parent packet](../packets/AnabelianGeometryAndNonabelianChabauty.json). It adds arithmetic path classes, their relation to endpoint sections, and the tangential path targets needed for the three-punctured line. Its [packet](../packets/AnabelianGeometryAndNonabelianChabauty--NC.0.json) imports the parent's 26 finite-coefficient K(π,1) targets by their existing identifiers and audits their supplier contracts. Those targets are not defined a second time.

The pass is complete and NC.0 is **planned**, with six explicit gaps and eight supplier requests. “Planned” records that every target and its prerequisite chain has a named owner or an exact gap; it does not claim that the native geometric interfaces exist. The [suggested file](../suggested/AnabelianGeometryAndNonabelianChabauty--NC.0.lean) gives native categorical and continuous-group signatures, APIs and discriminating examples. It elaborates against Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, with admission warnings only. The geometric signatures omitted for lack of supplier carriers are named below.

## Objects, ownership and conventions

For a connected scheme X and a geometric or tame tangential endpoint b, write F_b for the finite-étale fibre functor and E_b = Aut(F_b), with the native Galois-category topology. IG.0 owns the cover category, geometric fibre, Galois-category instance, profinite fundamental group and ordinary paths as natural isomorphisms. IG.1 owns the arithmetic exact sequence, the section induced by a rational point, and the normalized tame tangential fibre functor at a rational boundary point and nonzero tangent vector. The accepted RS-29 ownership decision puts the concrete arithmetic path torsor in NC.0; IG.6 imports it. General equivariant topological torsors, continuous nonabelian cocycles, H¹ and twisting remain in NC.3.

For geometrically connected qcqs finite-type X/k, fix a separable closure and Γ = Γ_k = Gal(k_s/k). The arithmetic restriction map is q_b:E_b→Γ, its kernel N_b is the geometric fundamental group, and a rational endpoint gives s_b:Γ→E_b. For tangential endpoints the same notation requires a k-rational nonzero tangent and the IG.1 tame construction. This document uses full finite-étale covers at tangential endpoints only in characteristic zero. Ordinary finite-cover paths and parameter-independence comparisons are imports; motivic regularization in PS.9 is a different realization and is not a prerequisite for this finite-étale construction.

A path p:b→x means a natural isomorphism F_b≅F_x. Multiplication of automorphisms is functional composition: ab acts by a after b. Native categorical arrow composition is written in the other order, so backward transport p⁻¹gp is represented by p, then g, then p inverse. This convention determines every formula below. An arithmetic geometric path restricts to the **identity** on the constant-cover fibre functor. An unrestricted arithmetic natural isomorphism can restrict to a nonidentity element of Γ and is not in that carrier.

The current upstream ProfiniteArithmetic supplies profinite powers and continuous automorphism/outer-action interfaces. PeripheralActions supplies its free pro-p peripheral automorphism theory. BelyiMaps Layer 12 supplies the geometric three-point group and finite-cover/profinite Riemann existence. None is re-planned here. In particular the Belyi outer action does not give a canonical arithmetic lift, and its ordinary finite-cover comparison does not yet identify normalized tangential fibres with analytic tangent germs.

## Arithmetic paths and endpoint sections

Let K:FEt(k)→FEt(X) be constant-cover pullback and choose the natural restriction identifications r_b:K followed by F_b≅F_k and r_x:K followed by F_x≅F_k. `ArithmeticPath` consists of p:F_b≅F_x whose restriction is r_b followed by r_x inverse. Equivalently it is the space P(b,x) of paths on X over k_s, with the rational descent structures of its endpoints. It carries the closed-fibre profinite topology. The right N_b-action is p·h = ph, and its Galois action is

σ(p) = s_x(σ) p s_b(σ)⁻¹,       α_b(σ)(h) = s_b(σ) h s_b(σ)⁻¹.

The condition on constants makes these expressions land in P and N_b. Nonemptiness follows from ordinary path existence and exactness: correct the constant restriction of an ordinary path by an endpoint lift. For any p the orbit map h↦p·h is a homeomorphism N_b≅P. It is free and transitive by cancellation; continuity and the inverse use the imported fibre-functor topology. Moreover σ(p·h)=σ(p)·α_b(σ)(h). Thus this actual geometric carrier, with its jointly continuous actions, is precisely a torsor in `NC.3/equivariant-topological-torsors`, not an additional abstract torsor definition.

The native subtype checks the constants condition for arbitrary finite-set functors and a specified K. The section/kernel model in the suggested file records its formulas after choosing a reference path. For a continuous homomorphism q:E→Γ with two continuous sections s₀,s₁, N=ker(q), the coordinate action is σ⋆h=s₁(σ)h s₀(σ)⁻¹. It is jointly continuous and satisfies σ⋆(hℓ)=(σ⋆h)α₀(σ)(ℓ). In the scheme application s₁ is the endpoint section transported along the selected reference path. These coordinates do not by themselves construct a scheme cover category or a geometric path.

For p in P(b,x), define `transportedSection` by t_{x,p}(σ)=p⁻¹s_x(σ)p. Restriction to constants proves q_b t_{x,p}=id. Changing the path to p·h changes this section to h⁻¹t_{x,p}h. Transport along a composite path is iterated transport. The conjugacy class belongs to the fixed endpoint x; a different rational point need not give a conjugate section.

Define `pathCocycle` by c_p(σ)=p⁻¹σ(p), so σ(p)=p c_p(σ). Its actual values lie in N_b, and

c_p(στ)=c_p(σ)α_b(σ)(c_p(τ)),

c_{p·h}(σ)=h⁻¹c_p(σ)α_b(σ)(h).

The orbit-map homeomorphism proves continuity. NC.3/torsor-classification then attaches [P(b,x)] in its existing H¹(Γ,N_b), independently of p. The coordinate signature is c_h(σ)=h⁻¹s₁(σ)h s₀(σ)⁻¹. These formulas specialize the torsor correspondence of Kim, Section 1, Proposition 1 and proof (2005 preprint PDF pp. 5–7), to the finite-étale path torsors used in Kim's unipotent Albanese discussion (2008 expository preprint PDF pp. 4–9). Neither a second H¹ carrier nor a unipotent completion is constructed in NC.0.

### Section comparison and reference change

`path-section-comparison` states t_{x,p}(σ)=c_p(σ)s_b(σ). The following are equivalent: the path class is neutral; there exists a Γ-fixed geometric path b→x; and t_{x,p} is N_b-conjugate to s_b. In coordinates a fixed h satisfies s₁(σ)=h s₀(σ)h⁻¹. Neutrality of c_h means c_h(σ)=ℓα₀(σ)(ℓ)⁻¹ for some ℓ in N, and hℓ is then fixed. This uses NC.3's neutral torsor criterion. It is an existence statement; no uniqueness, section conjecture or rational-point surjectivity is inferred.

`reference-section-change` states α₁(σ)=Int(c₁(σ))∘α₀(σ), where c₁(σ)=s₁(σ)s₀(σ)⁻¹. Changing the reference section therefore changes the coefficient action. The comparison of the resulting H¹ sets uses `NC.3/twisting`; it is not equality of raw classes in differently acted-on coefficient groups. The native declaration is `kernelAction_changeReference`.

`arithmetic-path-functoriality` states that a k-morphism carrying endpoints sends arithmetic geometric paths, sections and cocycles to the corresponding objects on the target. For tangent endpoints it requires the specified compatible tangent-fibre identifications; no map for arbitrary tangent vectors is implicit. For a homomorphism f of arithmetic extensions, with q′f=q and fs_i=t_i, the coordinate theorem `pathCocycle_map` gives f(c_h(σ))=c_{f(h)}(σ). Finite separable base extension restricts the Γ-action after choosing compatible embeddings of separable closures. These are whiskering and section-compatibility calculations, using IG.0 pullback and IG.1's arithmetic sequence, not a higher homotopy fibration theorem.

### Rational and tangential Kummer test

Let U=P¹_k minus {0,1,∞}, char(k)=0, b₀=λ∂/∂z at 0 with λ≠0, and a∈k minus {0,1}. For n≥1, project P(b₀,a) through the finite Kummer covers defined by z and 1−z. The resulting classes in the existing roots-of-unity cohomology are

κ_n(a/λ),       κ_n(1−a).

At the first tangent endpoint the normalized leading term is λ; at the second the value is the constant 1. Choosing roots αⁿ=a and βⁿ=λ makes the first representative σ(α/β)/(α/β). The pinned `TauCeti.kummerMap_eq_kummerCocycleClass` identifies it with κ_n(a/λ). Changing roots changes a representative by gauge, and `kummerMap_eq_one_iff` tests neutrality. This derives the comparison from the IG.1 power-cover tangent fibre and the native Kummer API; no separate Kummer map is planned.

With λ=1 and a=2 over Q the square-class projections include 2 and −1 and are nonneutral, so the neutral-path/section criterion fails. The suggested finite tests are κ₂(2)≠1, κ₂(4)=1, and κ₁(2)=1. Rescaling the tangent gives a/λ, not aλ. These projections do not assert that the full nonabelian Albanese map is injective or that every neutral pair of projections gives a fixed path.

## Tangential specialization

Let k be algebraically closed of characteristic zero, C a smooth connected separated finite-type curve, x a closed point and t a nonzero tangent vector at x. Put U=C minus {x}. For a finite-étale cover V→U, normalize C in V to obtain a finite map Y→C. Normalize component by component; every component dominates C. SF.0/nagata-normalization-finite supplies finiteness, and SF.3 supplies regular-curve/DVR geometry. The desired source is the IG.1 normalized tangent fibre F_t(V). The target is the underlying finite **point set** Y_x, rather than its potentially nonreduced scheme structure.

At y over x use the grading from ord_y/e_y, where e_y>0 is the ramification index. For a local parameter z at x choose s at y so that the initial form of z is s^{e_y}; algebraic closedness and characteristic zero give the required leading coefficient root. The graded map is a power map of tangent lines. Projection to the branch label defines a canonical specialization sp_t:F_t(V)→Y_x, independent of those local choices, and a morphism of covers preserves this construction.

A compatible primitive-root system selects γ_t in Aut(F_t). `tangential-inertia-specialization` asserts that sp_t induces a canonical finite-set bijection

⟨γ_t⟩ \ F_t(V) ≅ Y_x,

natural in V. The orbit over y has cardinality e_y. Closed inertia gives the same orbits because each finite fibre action factors through a finite quotient. This is Chen, Proposition 4.2.3(b), printed pp. 364–365, with the graded construction in Section 4.2, pp. 362–364.

The typed local construction `local-inertia-orbit-model` uses BranchFiber = disjoint union of Z/e_y, the actual permutation (y,i)↦(y,i+1), and Mathlib's orbit quotient for its cyclic subgroup. `specializeLocal` is the induced branch projection. Integer translations reach every residue on a branch and never change its label, giving the bijection and native `ZMod.card` computation. This is a proof model for the global theorem, not a replacement definition of its normalized scheme fibre.

### Source corrections and boundaries

The published Definition 4.2.1, p. 364, asserts injectivity of local inertia into the global fundamental group in the unrestricted curve setting. For C=P¹_C with only ∞ removed, U=A¹_C has trivial finite-étale fundamental group, while the punctured tangent has nontrivial procyclic group. The induced map is therefore not injective. Use its image, not a universal embedding. The orbit theorem does not use injectivity and needs no change in conclusion. The same definition's affine presentation of the punctured tangent removes 1; it must remove 0, with the chosen nonzero tangent normalized to 1. Both findings are recorded against the author-hosted published Annals copy, after checking the author page, journal page and latest arXiv copy for corrections.

The arXiv:0804.1008v1 expository preprint, p. 9, also reverses the gauge factors relative to its stated right-torsor cocycle law. The correct value after p is replaced by p·l is l⁻¹c(σ)σ(l). A finite check with C₃ acting on S₄ by conjugation by a=(123), c(g^j)=a^(−j) and l=(234) makes the printed candidate fail the cocycle law: d(g²)=(243), while d(g)g(d(g))=(123). This finding is scoped to that preprint. The publisher page and author-linked published text could not be retrieved, so no error in the version of record is asserted. The sourceVersions record preserves that limitation.

The published Proposition 4.2.3(a), pp. 364–365, identifies the cotangent of the graded tangent line at zero with the original cotangent. A superseded preprint clause about an inertia action on the original cotangent is absent there. The plan follows the published statement. No source passage is reproduced here.

Acceptance includes one branch z=s³ producing three tangent lifts and one specialization point; two degree-two branches producing two points; and an unramified branch being fixed. Covers may be disconnected, and branches of equal degree are still distinct. Natural squares must commute for all cover morphisms. No wild positive-characteristic extension follows from this characteristic-zero construction.

## Good and symmetric paths

Work on U=P¹_k minus {0,1,∞}, with algebraically closed k of characteristic zero, nonzero tangents t₀,t₁, and t_∞=ι(t₀) for ι(z)=1/z. Choose a compatible primitive-root system and the corresponding three inertia generators. A path δ:t₀→t_∞ is `IsGoodPath` when γ₀ and δ⁻¹γ_∞δ topologically generate Aut(F_{t₀}), and there exists ε:t₀→t₁ satisfying

(δ⁻¹γ_∞δ)(ε⁻¹γ₁ε)γ₀=1.

The order is infinity, one, zero. The generation condition is the topological closure of the subgroup generated by the two named automorphisms, not abstract generation. Both conjuncts belong to the definition. This is Chen, Definition 4.3.1, printed p. 366.

Let J be actual pullback on covers by ι, with the specified natural endpoint identifications e₀:J followed by F_{t₀}≅F_{t∞} and e_∞:J followed by F_{t∞}≅F_{t₀}. Whiskering δ by J and composing with these identifications gives `invertPath`, a path in the reverse direction. Define `IsSymmetricPath` by existence of r,s in **Z** such that

ι_*(δ)=γ₀^r δ⁻¹ γ_∞^s.

In native arrow order the right side applies γ_∞^s, then δ inverse, then γ₀^r. The type records the functor and endpoint identifications, rather than postulating an abstract path involution. Integer witnesses are part of Chen's definition, not arbitrary profinite exponents. Goodness and symmetry are distinct predicates.

`symmetric-good-path-existence` states existence of a path satisfying both predicates, under these exact geometric hypotheses and paired tangent choices. Chen's argument following Definition 4.3.1 (p. 366) uses a real-direction path with a small counterclockwise detour around 1. Over C, choose tangent-germ connectors compatibly at the inversion-paired endpoints. The punctured-sphere presentation gives generation and the ordered peripheral relation; inversion reverses the detour up to integer peripheral turns. Profinite Riemann existence then transfers the witness to finite-cover fibre functors, provided IG.1 exports the normalized tangent-germ comparison requested here.

For general k, include the tangent coefficients in a finitely generated subfield and take its algebraic closure in k. Embed this countable algebraically closed field into C, carrying the entire primitive-root system to the standard analytic one: the prescribed embedding of the cyclotomic extension extends to an algebraic closure and across a transcendence basis. Compare the resulting algebraically closed extensions by IG.1/charzero-base-extension, preserving fibres, inertia, inversion and the equations. Merely spreading finitely many roots would not pin the profinite generator. The result is a geometric existence theorem, with no canonical or Galois-fixed path over a nonclosed field.

The native predicate signatures and all their APIs/examples elaborate. The geometric existence signature cannot yet be instantiated: ordinary Riemann existence in BelyiMaps Layer 12 does not by itself identify IG.1 normalized tangent fibres with analytic germs. That exact missing comparison is a supplier request and a gap, not an assumed proposition in the signature.

## Definition APIs and discriminating unit tests

The names below are the proposed declarations in the suggested namespace. Test names label its anonymous examples. The geometry-free models test actual carriers and equations; they do not certify the absent scheme instantiations.

### Arithmetic path torsor — `ArithmeticPath`

Node: `AnabelianGeometryAndNonabelianChabauty:NC.0/arithmetic-geometric-paths`. Uses: NC.2 and NC.4: Supply the finite-étale arithmetic path torsor before applying the unipotent realization and Albanese map.; Kim 2008, PDF pp. 4–8; NC.3/torsor-classification: Use the existing classification for the actual path carrier and its Galois action..

| API name | Contract |
| --- | --- |
| `ArithmeticPath.restrict_id` | Restriction to constants, transported by r_b and r_x, is the identity. |
| `ArithmeticPath.identity` | The identity natural isomorphism is the path from an endpoint to itself. |
| `ArithmeticPath.rightMul` | Translate a path by a source automorphism restricting to identity. |
| `ArithmeticPath.galoisAction` | Compatible source/target lifts induce the action a inverse, then p, then b. |
| `ArithmeticPath.rightMul_val` | Underlying natural isomorphism of p·h is h followed by p. |
| `ArithmeticPath.galoisAction_val` | Underlying natural isomorphism is a inverse followed by p followed by b. |
| `pathAction_mul` | In kernel coordinates, pathAction(s0,s1,sigma*tau,h)=pathAction(s0,s1,sigma,pathAction(s0,s1,tau,h)). |
| `pathAction_continuous` | The action on Gamma times ker(q) is jointly continuous. |
| `pathAction_rightMul` | sigma(h*k)=sigma(h)*alpha_b(sigma)(k) in kernel coordinates. |

- **`arithmeticPath_identity`** (degenerate): The constructed identity path has underlying Iso.refl.
- **`arithmeticPath_translation_ne`** (non-example): For h≠1 in the geometric kernel, p·h≠p.
- **`arithmeticPath_constants_excluded`** (non-example): An ordinary natural isomorphism with nonidentity restriction to constants is not represented by ArithmeticPath.

### Path transport of an endpoint section — `transportedSection`

Node: `AnabelianGeometryAndNonabelianChabauty:NC.0/transferred-endpoint-section`. Uses: NC.0/path-section-comparison: Relate path torsor neutrality to geometric conjugacy of endpoint sections.; NC.6 rational-point handoff: Export a section class with its path-choice independence, without the section conjecture..

| API name | Contract |
| --- | --- |
| `transportedSection_apply` | t_x,p(sigma)=p inverse s_x(sigma) p. |
| `transportedSection_changePath` | t_x,p·h(sigma)=h inverse t_x,p(sigma) h. |
| `transportedSection_comp` | Transport along a composite is iterated transport. |

- **`transportedSection_identity`** (degenerate): Identity transport leaves the continuous section unchanged.
- **`transportedSection_translation`** (compatibility): Conjugating the changed-path section by h recovers the original.
- **`transportedSection_inverse_order`** (non-example): When h inverse g h differs from h g h inverse, backward transport uses the former.

### Cocycle of a geometric arithmetic path — `pathCocycle`

Node: `AnabelianGeometryAndNonabelianChabauty:NC.0/arithmetic-path-cocycle`. Uses: NC.2, NC.3 and NC.4: Apply unipotent quotients and the existing nonabelian H1 to the concrete arithmetic torsor.; NC.0/rational-tangential-kummer: Compute finite abelian projections of the class..

| API name | Contract |
| --- | --- |
| `pathCocycle_apply` | Coordinate value equals h inverse s1(sigma) h s0(sigma) inverse. |
| `pathCocycle_mul` | c(sigma*tau)=c(sigma) alpha_b(sigma)(c(tau)). |
| `pathCocycle_changePoint` | At h*k the cocycle is k inverse c_h(sigma) alpha_b(sigma)(k). |

- **`pathCocycle_same_sections`** (degenerate): At h=1 and s0=s1 the cocycle is 1 at every sigma.
- **`pathCocycle_changed_representative`** (non-example): For equal sections, alpha_b(sigma)(h)≠h forces c_h(sigma)≠1.
- **`pathCocycle_distinct_sections`** (value): If s1(sigma)≠s0(sigma), c_1(sigma)≠1.

### Local inertia orbits on branches — `specializeLocal`

Node: `AnabelianGeometryAndNonabelianChabauty:NC.0/local-inertia-orbit-model`. Uses: NC.0/tangential-inertia-specialization: Identify the quotient of the tangential fibre with the reduced branch fibre.; Chen Sections 4.4–4.5, gluing consumers: Supply the finite branch labels used by boundary identifications, without planning the subsequent nodal-cover construction..

| API name | Contract |
| --- | --- |
| `branchRotation_apply` | The permutation sends (y,i) to (y,i+1). |
| `specializeLocal_mk` | The class of (y,i) maps to y. |
| `inertiaOrbit_iff` | Orbit equivalence is equivalent to equality of branch labels. |
| `specializeLocal_bijective` | The induced branch map is bijective. |
| `branch_card` | The y-branch fibre has cardinality e_y. |

- **`inertiaOrbit_degree_three`** (value): One branch of degree 3 has a singleton orbit quotient.
- **`inertiaOrbit_distinct_branches`** (non-example): Two degree-2 branches give distinct quotient points despite equal indices.
- **`inertiaOrbit_unramified`** (degenerate): For e_y=1 the branch rotation fixes every point.

### Good path between tangential basepoints — `IsGoodPath`

Node: `AnabelianGeometryAndNonabelianChabauty:NC.0/chen-good-path`. Uses: Chen Section 4.3, p. 366: Pin the geometric generating system and peripheral product relation.; Chen Sections 4.4–4.5 boundary gluing: Use this choice in comparing the two ends of the normalization, importing subsequent gluing targets from their owner..

| API name | Contract |
| --- | --- |
| `IsGoodPath.generates` | A good path exports topological generation by gamma0 and transported gammaInfinity. |
| `IsGoodPath.relation` | A good path exports a path epsilon and the infinity, one, zero relation. |
| `isGoodPath_iff` | The predicate is equivalent to exactly these two conditions. |

- **`goodPath_trivial_group`** (degenerate): All identity inertia and the identity path are good when Aut F is trivial.
- **`goodPath_identity_nonexample`** (non-example): All identity inertia are not good when Aut F is nontrivial.
- **`goodPath_ordered_relation`** (value): If a,b topologically generate, identity paths with gamma0=a, gammaInfinity=b and gamma1=b inverse a inverse are good.
- **`goodPath_reversed_order`** (non-example): For noncommuting a,b the reverse product a*(b inverse a inverse)*b is not 1.

### Symmetric tangential path — `IsSymmetricPath`

Node: `AnabelianGeometryAndNonabelianChabauty:NC.0/chen-symmetric-path`. Uses: Chen Section 4.3, p. 366: Choose a path compatible with inversion up to integral peripheral powers.; NC.0/symmetric-good-path-existence: Form the simultaneous predicate with goodness for the geometric existence theorem..

| API name | Contract |
| --- | --- |
| `IsSymmetricPath.witnesses` | Export integers r,s witnessing the inversion equation. |
| `isSymmetricPath_of_eq` | An integer-power equality constructs the predicate. |
| `isSymmetricPath_iff` | The predicate is equivalent to existence of exactly those integer witnesses. |

- **`symmetricPath_identity`** (degenerate): For identity pullback/unitor, identity inertia and identity path are symmetric.
- **`symmetricPath_zero_inertia`** (characterisation): For identity pullback/unitor and identity inertia, a loop delta is symmetric iff delta squared is 1.
- **`symmetricPath_square_nonexample`** (non-example): In that model a loop with delta squared≠1 is not symmetric.

## Inherited K(π,1) targets and supplier closure

The parent key definition `AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1` remains authoritative: for its specified finite coefficient class, the canonical ε maps from continuous π₁ cohomology to étale cohomology must be isomorphisms in every degree. Its 25 NC.0 nodes remain unchanged. The continuation imports each by id; the registry in the packet lists all 26 references, including the key definition. The grouped table below is a dependency audit, not a replacement statement or a new decomposition of those targets.

| Inherited target group | Exact supplier evidence | Still required |
| --- | --- | --- |
| Finite covers and ordinary paths | IG.0 now names the actual finite-cover category, geometric fibre, native profinite Aut, finite continuous sets and natural-isomorphism paths. Nonzero characters give transitive prime-degree translation sets by elementary finite group algebra. | The corresponding coefficient sheaf and H1 character dictionary, not just finite sets, remains SF.2 input. |
| Coefficient dictionary and canonical epsilon | Generic site derived pushforward gives slice-cohomology sheafification; generic Leray identifies its pullback/counit edge; abelian torsor H1 is already planned. | Missing exact X_fet ≃ B(pi), rho:X_et→X_fet, finite continuous module/sheaf equivalence, derived comparison with the pinned continuousCohomology and proof that the induced edge is the same canonical epsilon in all degrees. No typed epsilon interface exists at the pin. |
| Fields | The actual equivalence of discrete Galois modules and field étale sheaves plus derived global-sections/invariants comparison is present. | Its identification with the same epsilon awaits the coefficient dictionary; positive-degree trivial-group calculation remains the ProfiniteCohomology contract. |
| Projective-line obstruction | Canonical H2(P1,mu_n)=Z/n via degree, for invertible n, is an exact supplier statement. | IG.0 has no named geometric pi1(P1)=1 node. Constant coefficients use a chosen root-of-unity identification, not a canonical untwisted Z/n identification. |
| Finite direct image and finite étale invariance | Exact finite pushforward, its stalk products and integral base change, plus natural cohomological pullback, have named suppliers. | Need preservation of finite local constancy and prime support, the precise all-degree pullback/counit mu_f isomorphism, and its cartesian-square base-change identity from the adjunction triangles. Keep sheet permutations; do not divide by cover degree. |
| Coefficient dévissage | Naturality of the cohomological long exact sequence and classification/pullback of abelian torsors are supplied. | Need actual finite-coefficient filtrations, finite-sum compatibility, monodromy trivialization, diagonal killing in H1 and finite common pointed refinements. The parent already owns the two-cover killing argument; no duplicate criterion is added. |
| Smooth-curve geometry | Proper smooth models, the affine/proper dichotomy, genus base extension and unramified Riemann–Hurwitz have exact nodes. The Picard/Jacobian and norm objects are already owned here and by JacobianChallenge. | Require connected finite-étale preservation of smoothness, affine/proper conditions and geometric unibranchness; actual Pic0[n] cardinality n^(2g), and pullback degree multiplication. A norm-of-line-bundles theorem alone does not state the pullback degree formula, nor does the Tate module replace finite Pic0[n]. |
| Curve cohomology and degree-two killing | Kummer H1=Pic0[n], canonical H2 degree identification, finite-map pullback multiplying degree, projective vanishing above degree two and affine vanishing from degree two are all explicitly supplied for invertible n. | Only the canonical H1_et(C,F_p)=Hom_cont(pi,F_p) bridge to the finite-set cover dictionary still needs the coefficient/torsor comparison. Do not assume K(pi,1) to prove this H1 fact. |
| Separable cover and class descent | The exact qcqs affine-transition cohomology colimit and finite-presentation descent contract occurs in the supplier statement. The descended killing cover uses the same continuity formula. | Supplier proof leaves for finite-presentation/property descent and inverse-site cohomology remain its responsibility; no claim to have independently read those leaves to closure. Existence of a representative and eventual vanishing are separate colimit consequences. |
| Products | Arithmetic exact sequence and separable continuity are now named nodes. The six inherited product/finite-family targets remain unchanged. | Projection-compatible geometric product pi1 with cofinal product covers; pullback-natural prime-field external products, including nonproper ordinary étale cohomology and the generic field-complex bridge; no supplier node currently supplies these exact contracts. |
| Raw homotopy and elementary fibrations | The parent target statements preserve the geometrically unibranch/raw-homotopy boundary and elementary-fibration hypotheses. | Native raw étale homotopy, its comparison map and higher-homotopy fibration inputs lack a registered exact supplier. The effacement route does not require or construct these objects. |
| All-degree class killing | Already proved in current Tau Ceti by the two declarations in currentLibraryAudit, exported through ProfiniteCohomology Layer 10. Take an open-normal core when needed. | No missing theorem or new target; compile-pin instantiation awaits an upstream pin advance or the inherited Layer 10 interface. |

The current Tau Ceti library already contains `TauCeti.ContinuousCohomology.exists_openSubgroup_res_eq_zero` in `ClosedSubgroup.lean`: every positive-degree class for a smooth discrete representation of a profinite group restricts to zero on some open subgroup. Taking its finite-index normal core gives the open-normal form needed by the parent. `subsingleton_continuousCohomology_succ_of_subsingleton` in `TrivialGroup.lean` supplies positive-degree trivial-group vanishing. The packet records the current commit and the actual statements read. They postdate `f790474`, so they are imported through the current ProfiniteCohomology Layer 10 interface and are not new NC.0 targets or requests to re-prove them.

The supplier audit distinguishes exact statements from nearby machinery. SF.2's generic site Leray/pushforward nodes do not yet construct X_fet≃Bπ, ρ:X_et→X_fet, the finite-module/sheaf dictionary, or identify the edge with the same canonical ε. Its exact finite-pushforward node does not explicitly provide preservation of finite local constancy/prime support and the required all-degree μ_f/counit base-change formula. SF.3's norm theorem is not itself a pullback-degree formula, and a Tate module rank statement is not the finite cardinality of actual Pic⁰[n]. Those precise contracts remain requested with their original owners.

SF.2's field Galois comparison, curve roots-of-unity cohomology and qcqs affine-transition cohomology limits do have exact named nodes. The curve theorem states H² via degree, finite-map pullback multiplying degree, projective vanishing above degree two and affine vanishing from degree two, all with invertible coefficients. Its H¹/Pic⁰[n] statement is distinct from the degree-one character dictionary. Limit descent must separately establish descent of a representative and eventual vanishing; no injectivity of field restriction is used. This follow-up imports those supplier statements without asserting independent closure of their source proof leaves.

For products the accepted assemblies still require projection-compatible geometric π₁, product-cover cofinality, canonical pullback-natural prime-field external products for ordinary étale cohomology of nonproper characteristic-zero varieties, and the generic field-complex bridge. A bare group isomorphism or an unnamed Künneth assertion is insufficient. Over a nonclosed field arithmetic π₁ is a fibre product over Γ, not an ordinary product. The six parent finite-family/product assemblies preserve the degree-one killing case and the separable descent inputs.

Raw étale homotopy and the parent elementary-fibration/Artin-neighbourhood targets remain separate gaps. There is no registered exact supplier for their native carriers or higher-homotopy fibration map. The effacement proof does not need these objects, and the arithmetic π₁ exact sequence cannot replace a higher-homotopy theorem.

## Remaining supplier work and acceptance

There are eight requests: three distinct SF.2 coefficient/direct-image/dévissage contracts, IG.0's projective-line and geometric-product/pointed-refinement exports, SF.2's nonproper prime-field Künneth comparison, SF.3's curve and branch geometry exports, IG.1's arithmetic/analytic tangent interfaces, and BelyiMaps Layer 12's finite-cover comparison import. Exact suppliers and consuming node ids are recorded in the packet; current generic profinite or H¹ theory is never reassigned to NC.0.

Six gaps describe the signatures and closure still needed: geometric arithmetic-path instantiation; geometric tangent specialization and Kummer projection; analytic tangent-germ comparison for existence; inherited coefficient/ε/μ interfaces at the pin; inherited curve/product inputs; and inherited raw homotopy/elementary fibrations. Theorems about these geometric objects are stated here and in the packet, but their unavailable native signatures are omitted from the suggested file. The typed local orbit calculation and functor equations remain explicit, without proposition-valued replacements for the missing conditions.

Stage acceptance requires every new construction's stated API and discriminating tests, the actual scheme/path/tangent instantiations of those signatures, naturality of the geometric specialization and path class, and closure of all inherited supplier contracts. A numerical square-class test does not prove neutrality of the full path class; a typed local branch quotient does not prove the global normalized scheme theorem; elaboration of admitted signatures does not prove any theorem.

The accepted parent already has five NC.0 planets. This packet adds only **Arithmetic path torsor**, keeping the combined layer at six. Tangential specialization, good/symmetric paths and the inherited K(π,1) assemblies remain visible as target declarations without increasing the planet count.

## Sources and library evidence

Statements are written independently, with locators. Read: Chen's published Annals 199 (2024) author copy, Sections 4.2–4.3, printed pp. 362–366; Kim's 2005 Proposition 1 and proof, Section 1, preprint PDF pp. 5–7; Kim’s 2008 Fundamental groups and Diophantine geometry, preprint PDF pp. 4–9; Stacks Theorem 58.6.2 (0BQ8), Lemma 58.14.1 (0BTV) and Lemma 58.14.3 (0BTX), including the arithmetic/descent proofs. Public versions, access date and available hashes are recorded in the packet. No private book is needed for this pass.

Pinned declaration statements were read for native Aut, whiskering, Galois-category Aut topology, continuous homomorphisms, action orbit quotients, subgroup topological closure, ZMod/cardinality, the absolute Galois group and the existing Kummer map/representative/neutrality APIs. The current library audit is separate from these twelve pinned citations. Current ProfiniteArithmetic, PeripheralActions, BelyiMaps and the relevant ProfiniteCohomology Layer 10 interfaces were checked before assigning new targets.

Public texts: [Chen's published author copy](https://www.williamyunchen.com/s/Chen-Nonabelian-level-structures-Nielsen-equivalence-and-Markoff-triples.pdf), [Kim's Proposition 1 source](https://arxiv.org/pdf/math/0409456v1), [Kim's 2008 exposition](https://arxiv.org/pdf/0804.1008), and [Stacks arithmetic exact sequence, Lemma 58.14.3](https://stacks.math.columbia.edu/tag/0BTX). The source records give the selected proof locators and version limits.
