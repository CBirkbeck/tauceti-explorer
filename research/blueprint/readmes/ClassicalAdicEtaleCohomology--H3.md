# Proper support, traces and Poincaré duality for curves

This is the H3 continuation of **The classical analytic cohomology inputs to diamonds**. It builds on the accepted [H0 packet](../packets/ClassicalAdicEtaleCohomology--H0.json) and its [reader](ClassicalAdicEtaleCohomology--H0.md). The accepted packet contains 67 H3 declarations, including the six planets of the stage. Their identifiers, definitions, APIs and hypotheses remain in force. The [H3 packet](../packets/ClassicalAdicEtaleCohomology--H3.json) adds 24 declarations, 26 API items and 20 tests. Every implementation status is unchecked.

H3 supplies classical étale cohomology to DiamondSixOperations S4 and S5 and to the later analytic comparison stages H4 and H5. Its immediate consumer is the relative-ball argument in Scholze, *Étale cohomology of diamonds*, Theorem 24.1, together with Proposition 23.10(iii). The job is to construct the classical proper-support and trace maps and state the classical duality input with its actual hypotheses. The proof cannot use the diamond cohomological smoothness that this input is supposed to establish. An exceptional right adjoint also cannot stand in for a proof of classical Poincaré duality.

The stage is **planned**, with twelve explicit gaps. Every target is represented by an inherited or new declaration, and every prerequisite ends at a checked baseline statement, a named blueprint supplier, a precise supplier request or a recorded gap. It is not closed. In particular, the full higher-rank curve-duality proof is still missing even for the ball over a field pair whose plus ring is smaller than the maximal valuation ring. A general trace-existence theorem does not fill that gap.

## Objects and conventions

All adic spaces in the new declarations are locally noetherian and analytic. The geometry of Huber pairs, valuations, rational subsets and Spa belongs to Tau Ceti and AdicSpaces, Part II. The analytic étale site belongs to AdicEtaleGeometry A2. A sheaf, geometric stalk, support subset and ordinary derived category are imported from H0 and EnhancedDerivedSheaves E1. These imports are mathematical objects with their supplier APIs; arbitrary types supplied with proposition fields are not replacements for them.

A field pair is S = Spa(C,C⁺), where C is complete, algebraically closed and nonarchimedean, and C⁺ is an open bounded valuation subring of C. Its maximal rank-one point corresponds to O_C. The space S can also contain higher-rank specializations. The plus ring is part of the base: compact support relative to Spa(C,C⁺) need not agree with compact support relative to Spa(C,O_C). Whenever the latter base is required, it is stated explicitly.

There are three different coefficient ranges. Proper–étale exchange and the proper projection formula below allow Z/n for every positive n. Full arbitrary proper base change and full classical nonproper curve duality require n to be a unit in O⁺, or in C⁺ on a field pair. The public boundary and general smooth-trace constructions require n to be a unit in O, or in C over a field pair. In mixed characteristic, n = p lies in the third range and can fail to lie in the second. Its trace can exist even though compactly supported cohomology is not finite and duality fails. A theorem about an arbitrary pullback must specify whether its base-change map is invertible.

The notation Λ denotes Z/n unless a statement specifies the field F_ℓ. The sheaf μ_n is the Kummer Tate twist Λ(1). Complexes use cohomological indexing: K[2] moves its degree-two cohomology to degree zero. D⁺ means bounded below and D⁻ means bounded above. Rf! is proper-support direct image, Rf_* is ordinary direct image, and RHom denotes the derived internal Hom when its base is displayed as a sheaf category. A derived mapping complex RHom_X has global values. These two uses are related by derived global sections and must not be conflated during the all-complex extension.

Tautness and compactifiability use the inherited declarations H3/taut-spaces-and-morphisms and H3/compactifiable-morphism. The relevant compactification scope is separated, taut and locally +weakly finite type; the quasi-compact hypotheses are imposed where a global quasi-compact factorization is used. For such a factorization, j:X→Xᶜ is an open immersion and fᶜ:Xᶜ→Y is proper. The object Xᶜ is generally not locally of finite type over Y. Relative transcendence dimension must therefore be available for +weakly finite type maps, rather than inferred from a locally-finite-type rank-one fibre formula.

A pseudo-adic support is a pair consisting of an ambient adic space and a locally closed subset, with the corresponding étale support topos. The complement of X in Xᶜ and the fibre over the closed point of Spa(C,C⁺) are treated in this sense. No assertion that these subsets are themselves closed analytic adic subspaces is needed. Inherited H3/pseudo-adic-support-space carries the restriction and open/closed localization APIs. This distinction matters at the rank-two boundary of the compactified disc.

The proper-support functor is inherited from H3/partially-proper-lower-shriek and H3/proper-support-direct-image. For a partially proper map the underived f! imposes properness of support; compactification extends this through extension by zero followed by proper pushforward. Independence of factorization, composition, the proper and étale cases, localization and quasi-compact exhaustion are separate inherited statements. In the proper case f! agrees with f_*; in the étale case it is exact and its counit sums over the étale fibres. This is the cohomological trace for dimension zero, not the trace of a finite algebra in R3.

## Target architecture

The first group supplies the compactification and proper-support infrastructure. Universal compactification, its proper factorization, support direct image and its classical transformations are imported by their H0-packet identifiers. The new compactification dimension theorem states the exact additional geometric input used by the proper amplitude bound. Proper closed-fibre acyclicity is isolated for every positive n. It proves proper exchange for étale pullbacks, from which the proper projection formula follows by étale generators and homotopy colimits. This route does not assume arbitrary residue-p proper base change.

The arbitrary proper-base-change route is different. Its prime-to-residue version still needs H2 invariance for arbitrary sheaves over geometric field pairs. The existing H2 affinoid theorem only gives a particular j!M input, so the packet requests the missing dévissage and identification of the actual comparison map. The non-algebraizable closed-fibre theorem also remains open. A formal-model comparison for algebraizable objects does not prove it for all proper analytic spaces.

Zavyalov's public unbounded-support construction supplies a coherent comparison for Z/n with n invertible in O⁺. It glues the proper pushforward and exact étale support operations, then uses source descent and quasi-compact exhaustion. Only this gluing fragment is requested from E1. The construction does not assume an exceptional right adjoint. The agreement with the classical bounded-below functor is part of its statement; generic coherence is supplied by E1, while the analytic support instance belongs to H3. General coefficient rings in non-quasi-compact support remain a distinct inherited proof obligation.

The curve group gives an alternative public normalization of the trace over Spa(C,O_C). Let X = Spa(A,A°) be a nonempty smooth affinoid curve. Its universal compactification has a finite discrete boundary I of rank-two closed points, meeting every connected component. Each boundary point x has a henselized valued residue field K_x; completion is permitted after henselization. The full closed-point topos equivalence is requested from H1. The existing comparison of constant cohomology alone does not furnish an equivalence of topoi.

Kummer theory identifies boundary degree-one cohomology with K_x×/(K_x×)ⁿ and gives no cohomology in degree at least two. Affinoid curve vanishing and the inherited support triangle then present H²_c(X,μ_n) as the cokernel of the boundary restriction from H¹(Xᶜ,μ_n). This presentation is indispensable: summing boundary valuations does not define a cohomological trace until reciprocity proves that the sum kills the image of that restriction map.

For every boundary field, secondary degree is normalized by assigning degree one to the greatest value smaller than one. In the ordered-group coordinates used by Li–Reinecke–Zavyalov, this degree is the negative of the second projection. Thus the disc parameter has boundary degree −1. Each degree descends modulo n to a Z/n-linear map on its Kummer group. The boundary pretrace is their finite sum. Mathlib supplies this finite assembly and the quotient descent, while R0 supplies the boundary valuation and norm facts and H1 supplies their cohomological identifications.

Reciprocity is proved using finite flat Noether normalization to the closed disc, norm compatibility, and the Kummer description of an affinoid Picard torsion class. The sum vanishes on the boundary restriction of every global Kummer class, including the classes that arise from nonzero Picard torsion. The descended residue trace is surjective. Its identification with the algebraic curve trace additionally uses the disc calculation and a pointed semistable reduction. The public theorem and final reduction have been read; the intermediate calculations are a precise proof-verification gap. They are not asserted to be wrong.

The next group separates full curve duality from trace construction. For a connected smooth geometric curve, top-degree trace must be an isomorphism on the entire base field pair. The inherited verification covers the ball, unit circle, projective line and open discs by exhaustion. Positive-width annuli are outside the smooth-model tube argument. General connected curves need their rank-one trace-isomorphism proof and constancy across higher-rank specializations. The new contract makes both requirements visible.

Full Poincaré duality is the inherited trace-induced equivalence

Rf_* RHom(G,f*F(1)[2]) ≅ RHom(Rf!G,F),

for G in D⁻ and F in D⁺, for a separated taut smooth curve over Spa(C,C⁺), with the torsion order invertible in C⁺. Extending the rank-one proof requires the higher-rank curve fundamental lemma, injective resolutions for arbitrary F, and verification on the generators j!Λ of the source category. The sufficient effacement contract below is explicitly a required input to verify; it does not purport to quote the unread intermediate lemma in Huber's book. It must kill the degree-one support map as a sheaf on all of the field-pair base. Vanishing only at the maximal point is insufficient.

ECD Proposition 23.10(iii) requires an open-coefficient mapping equivalence for every source complex G. The inherited open-extension statement handles objects already extended from the open subspace and does not by itself cover all G. The new application first applies full curve duality with F = j!Λ to bounded-above G. It then writes an arbitrary G as a homotopy colimit of its bounded-above truncations. The support functor preserves that colimit and derived mapping objects turn it into a homotopy limit. This is an argument on derived mapping complexes; taking degree-zero Hom and an ordinary inverse limit would lose possible derived-limit terms. A downstream consumer with independently constructed adjoints can apply Yoneda to identify the exceptional mate.

The same full curve duality, overconvergent pro-open invariance and inherited ordinary-cohomology finiteness give finite perfect pairings for finite-rank F_ℓ-local systems on quasi-compact curves over arbitrary C⁺. The restriction to quasi-compact curves is essential for finite-dimensionality. No such assertion is inserted for arbitrary torsion sheaves or infinite unions of discs.

The final group supplies a public general analytic smooth trace. The analytic first Chern class is the Kummer boundary of the G_m-torsor of a line bundle; R3 owns line bundles and the torsor equivalence, H0 owns Kummer, and E1 supplies the derived interpretation. The projective-line formula with c₁(O(1)) then normalizes the affine-line trace through A¹→P¹. Iterated projections define the trace on analytic affine space. Coordinate permutation invariance is proved using the scheme comparison for A² and the trivial action of GL₂(C) on its one-dimensional top support cohomology. This affine-space argument is not transferred to a residue-p closed polydisc, whose permutation action can be nontrivial.

Smooth étale coordinate charts, mixed-coordinate comparison and support Čech descent define the trace over any locally noetherian analytic base, with n invertible in O. The top support bound makes its maps factor through top degree and permits gluing even for infinite taut covers. Composition, étale normalization, projective-line normalization and compatibility with the canonical pullback transformations characterize the result. This construction widens the inherited rigid-base scope. It does not prove arbitrary-coefficient duality, the top trace isomorphism for every geometric curve or invertibility of residue-p base change.

The inherited higher-dimensional, Berkovich, relative and integral exports remain part of H3. Their declarations are retained without duplicating them. Berkovich support and duality need a cohomological supplier beyond the geometric TB.0 stage, so the packet proposes a Tropical and Berkovich arithmetic, Part II owner. H3 owns the analytic comparison and its actual support-coherence maps. The integral trace map is already constructed in the accepted packet; its relative inverse-limit identification and surjectivity are the unresolved steps, with precise E2 inputs.

## Inherited coverage and planets

The packet's target-coverage register includes all 67 inherited H3 identifiers and all 24 additions. It groups eligible geometry; support operations; base change, amplitude and tensor formulas; curve normalization and transfer; full curve duality and its relative-ball use; finite perfect pairings; and general-dimensional, Berkovich, relative and integral exports. The source of the inherited definitions and their full APIs is the accepted H0 packet and reader linked above. Continuations supplement their proof evidence or describe alternative routes. An alternative route is not a prerequisite of the unchanged imported declaration, so an application of an inherited theorem cannot become its own proof input.

No new planet is added. The combined stage retains its six accepted planets:

- **Universal compactification** — `ClassicalAdicEtaleCohomology:H3/universal-compactification`.
- **Proper-support direct image** — `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`.
- **Proper base change** — `ClassicalAdicEtaleCohomology:H3/proper-base-change-extension-by-zero`.
- **Trace map for smooth curves** — `ClassicalAdicEtaleCohomology:H3/curve-trace`.
- **Poincaré duality for curves** — `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`.
- **Smooth relative trace** — `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`.

The accepted proposed suffix H3:smooth-duality separates the general-dimensional, relative and integral exports from the curve core. The public affine-space and general-smooth-trace additions join that suffix. IDs and scope remain H3 until the maintainer applies the proposal. Geometry extensions stay in AdicSpaces, Part II. The explicit H2→H3 edge is requested only for arbitrary-sheaf prime-to-residue proper base change; it does not import downstream diamond duality.

## Declaration plan

Each entry gives a mathematical statement, its direct prerequisites and a proof plan. A statement whose proof ends in a gap is a target contract rather than an established theorem. A definition's API is the interface its consumers require; the named tests distinguish plausible incorrect definitions. All source descriptions below are paraphrases with locators.

### 1. Dimension bound survives universal compactification

`ClassicalAdicEtaleCohomology:H3/compactification-transcendence-dimension` · theorem · proposed name `AdicSpace.compactification_dimTr`.

For a quasi-compact separated taut +weakly finite type morphism f:X→Y of locally noetherian analytic adic spaces, let j:X→Xᶜ and fᶜ:Xᶜ→Y be its universal compactification. The morphism fᶜ is proper and dim.tr fᶜ = dim.tr f, with the relative transcendence-dimension convention of Huber §1.8. In particular a finite upper bound remains valid at the added higher-rank points. This statement does not assert that fᶜ is locally of finite type.

f is in the inherited universal-compactification scope; dim.tr is supplied by A2 for +weakly finite type maps, including maps not locally of finite type.

**Proof or construction.**

1. Use the inherited universal compactification and its quasi-compact proper factorization.
2. Use Huber 5.1.14 for transcendence dimension at new points. Zavyalov Lemma 9.1 reproduces its application but not its proof; retain the proof gap.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/universal-compactification`, `ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation`, `AdicEtaleGeometry:A2`.

**Acceptance.**

- The boundary of the compactified disc contains a rank-two point while its relative transcendence dimension stays one.
- Do not apply A2’s locally-finite-type rank-one fibre criterion to fᶜ without proving its hypotheses.

**Sources.** Zavyalov-Foundations-v2, Lemma 9.1, proof of (1), p. 24. The affinoid reduction preserves relative transcendence dimension under compactification by Huber 5.1.14.

### 2. Finite amplitude of proper torsion pushforward

`ClassicalAdicEtaleCohomology:H3/proper-torsion-cohomological-amplitude` · theorem · proposed name `AdicSpace.proper_torsion_amplitude`.

Let f:X→Y be a proper +weakly finite type morphism of locally noetherian analytic adic spaces, with a uniform bound dim.tr f≤d. For every étale Z/n-module sheaf F, n>0, Rᑫf_*F=0 for q>2d. Locally on quasi-compact Y this gives a finite cohomological amplitude for Rf_* on unbounded complexes. In particular Rf_* preserves all small homotopy colimits. No invertibility of n in O_Y⁺ is imposed in this proper amplitude statement.

A uniform d for the displayed 2d estimate; finite bounds may vary between quasi-compact opens of Y.

**Proof or construction.**

1. The geometric stalk formula reduces the cohomology to proper pseudo-adic fibres.
2. Apply Huber 5.3.11 with its transcendence-dimension bound, including higher-rank closed fibres; its proof is not supplied by an absolute rank-one affinoid bound.
3. For unbounded complexes use bounded amplitude, truncation comparison and exact direct sums; this is the argument of Zavyalov Lemma 9.1(2).

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/compactification-transcendence-dimension`, `ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Acceptance.**

- For finite maps d=0 and higher direct images vanish.
- For a non-quasi-compact base do not claim one global d from local finiteness alone.

**Sources.** Zavyalov-Foundations-v2, Lemma 9.1(1)–(2), pp. 23–25. The proof obtains a finite proper cohomological bound from Huber 5.3.11 and extends colimit preservation to unbounded complexes; the full 2d proper-fibre input remains an explicit book-proof obligation.

### 3. Vanishing away from the proper closed fibre for all torsion

`ClassicalAdicEtaleCohomology:H3/closed-pseudo-fibre-torsion-acyclicity` · theorem · proposed name `AdicSpace.closedPseudoFibre_acyclic`.

Let S=Spa(C,C⁺), where C is complete algebraically closed nonarchimedean and C⁺ is an open bounded valuation subring; write s for its unique closed point. Let f:X→S be proper, with X locally noetherian, and let F be an étale Z/n-module sheaf, n>0. If F restricts to zero on the pseudo-adic fibre (X,f⁻¹(s)), then RΓ(X,F)=0. The same vanishing holds for K∈D⁺ with all cohomology sheaves restricting to zero. This includes extension by zero from f⁻¹(S∖{s}) and does not require n to be a unit in C⁺.

The closed fibre is a pseudo-adic support subset, not a presumed closed analytic adic subspace.

**Proof or construction.**

1. Use Huber 4.4.3 in the form employed for arbitrary n in Zavyalov Proposition 9.3.
2. Pass from sheaves to D⁺ by the hypercohomology spectral sequence; finite proper amplitude gives the unbounded extension used by the next node.
3. The non-algebraizable proper-space proof of 4.4.3 remains a gap. H1’s henselian comparison of algebraizable models alone does not prove it.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space`, `ClassicalAdicEtaleCohomology:H3/proper-closed-fibre-vanishing`, `ClassicalAdicEtaleCohomology:H3/proper-torsion-cohomological-amplitude`, `ClassicalAdicEtaleCohomology:H0/leray-spectral-sequence`.

**Acceptance.**

- For F=j′!L from the inverse image of S∖{s}, every cohomology group is zero.
- Residue-p proper base change along an arbitrary field extension is a different assertion and is not a consequence.

**Sources.** Zavyalov-Foundations-v2, Proposition 9.3(1), proof, pp. 26–27 and footnote 6. The proper–open exchange proof invokes closed-fibre vanishing for arbitrary Z/n-coefficients and explicitly treats the fibre as pseudo-adic.

### 4. Proper–étale extension-by-zero exchange for all torsion

`ClassicalAdicEtaleCohomology:H3/proper-etale-exchange-all-torsion` · theorem · proposed name `AdicSpace.proper_etale_exchange`.

For a Cartesian square X′→X over an étale j:Y′→Y and proper f:X→Y of locally noetherian analytic adic spaces, the canonical map j! Rf′_* → Rf_* j′! is an equivalence on unbounded D(X′_ét,Z/n), for every n>0. Both ! functors here are the exact étale extension-by-zero functors, and the transformation uses the usual slice-site base-change map and its counit.

f is proper; j is étale, with no invertibility hypothesis on n.

**Proof or construction.**

1. Factor j locally into an open immersion followed by a finite étale map using R0’s étale factorization.
2. For the finite étale part check the finite direct-sum description after étale localization.
3. For an open immersion reduce stalkwise to S=Spa(C,C⁺); if the open misses the closed point, apply closed-pseudo-fibre-torsion-acyclicity.
4. Bounded proper amplitude and homotopy-colimit preservation extend the sheaf argument to unbounded complexes.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/closed-pseudo-fibre-torsion-acyclicity`, `ClassicalAdicEtaleCohomology:H3/proper-torsion-cohomological-amplitude`, `AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Acceptance.**

- Identity j yields the identity transformation.
- A finite étale split cover gives the sum of the proper pushforwards on its components.
- This does not strengthen arbitrary proper base change to residue-p coefficients.

**Sources.** Zavyalov-Foundations-v2, Proposition 9.3(1), pp. 26–27. The exchange statement is for every positive n and all complexes, with a finite-étale/open factorization proof.

### 5. Proper projection formula for all torsion

`ClassicalAdicEtaleCohomology:H3/proper-projection-formula-all-torsion` · theorem · proposed name `AdicSpace.proper_projectionFormula`.

For a proper +weakly finite type f:X→Y of locally noetherian analytic adic spaces and any F∈D(X_ét,Z/n), G∈D(Y_ét,Z/n), n>0, the canonical morphism Rf_*F ⊗ᴸ G → Rf_*(F⊗ᴸ f*G) is an equivalence. It is natural in both complexes and compatible with the proper–étale exchange transformation.

Unbounded derived tensor and the ordinary/enhanced comparison come from E1.

**Proof or construction.**

1. Both sides preserve homotopy colimits in G by proper finite amplitude and derived tensor.
2. Resolve G by colimits of shifts of étale generators j!Z/n.
3. Apply proper-etale-exchange-all-torsion, the étale projection formula, and étale pullback/pushforward base change. The latter is unconditional slice-topos base change, not arbitrary proper base change.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/proper-etale-exchange-all-torsion`, `ClassicalAdicEtaleCohomology:H3/proper-torsion-cohomological-amplitude`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Acceptance.**

- G=Z/n gives the unit comparison.
- For finite split f this becomes the finite-sum tensor identity.
- The proof must not call Lemma 9.1(3) for arbitrary residue-p base change.

**Sources.** Zavyalov-Foundations-v2, Lemma 9.2 and Proposition 9.3(2), pp. 25–27. The proof uses étale generators and exchange, and its coefficient statement is all positive n.

### 6. Unbounded extension agrees with classical proper support

`ClassicalAdicEtaleCohomology:H3/unbounded-classical-support-comparison` · comparison · proposed name `AdicSpace.unboundedSupport_comparison`.

Fix n>0 invertible in O_S⁺. On locally noetherian analytic S-spaces and locally +weakly finite type maps, there is a coherent colimit-preserving proper-support functor on the enhanced unbounded derived categories. For a separated taut f it restricts on D⁺ to the inherited Huber R⁺f!, including non-quasi-compact f. For proper f it is Rf_*; for étale f it is the exact f! with its usual counit. Composition, base change and projection formula agree with the inherited classical transformations wherever those are defined. No global dimension bound for all of S is required.

Only the proper/étale gluing fragment is used; no right adjoint Rf^! or diamond duality is assumed. The coefficient hypothesis is n invertible in O_S⁺.

**Proof or construction.**

1. On quasi-compact separated taut maps factor through the inherited universal compactification and apply the coherent proper/étale gluing supplied by E1.
2. Use proper–étale exchange, proper projection formula and prime-to-residue arbitrary base change to verify the gluing hypotheses.
3. Use analytic Čech descent to pass to maps and spaces without quasi-compactness.
4. For partially proper f compare the filtered colimit over quasi-compact opens of X with the inherited sheaf f! and its right derived functor. Zavyalov Theorem 9.4, Step 5 proves this comparison for Z/n; general rings Λ remain an inherited proof obligation.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/proper-etale-exchange-all-torsion`, `ClassicalAdicEtaleCohomology:H3/proper-projection-formula-all-torsion`, `ClassicalAdicEtaleCohomology:H3/proper-pushforward-base-change`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-composition`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Acceptance.**

- For étale f the comparison preserves the summation counit, not just the underlying functor.
- An exhaustion has the same result after passage to a cofinal family of quasi-compact opens.
- Do not infer this general comparison for arbitrary Λ from the Z/n statement.

**Sources.** Zavyalov-Foundations-v2, Theorem 9.4, pp. 27–30, especially Steps 2–5. Gluing constructs the unbounded operations, and the final step compares them with Huber’s bounded-below support functor by quasi-compact exhaustion.

### 7. Kummer cohomology at the finite pseudo-adic boundary

`ClassicalAdicEtaleCohomology:H3/henselian-boundary-kummer-comparison` · comparison · proposed name `AdicSpace.boundary_kummer_comparison`.

Let X=Spa(A,A°) be a nonempty smooth affinoid curve over a complete algebraically closed nonarchimedean field C, and let j:X→Xᶜ be the universal compactification over Spa(C,O_C). Its boundary I is finite and discrete, consisting of rank-two closed points, with at least one point on every connected component. For x∈I set K_x=k(x)ʰ, or its completion after henselization, and use the corresponding henselian valuation pair. The boundary étale topos is the finite product of the topoi (Spec K_x)_ét. For n>0 invertible in C, H⁰({x},μ_n)=μ_n(C), H¹({x},μ_n)=K_x×/(K_x×)ⁿ, and Hⁱ({x},μ_n)=0 for i≥2. These identifications carry finite-flat cohomological trace on H¹ to the field norm.

X uses the maximal plus ring A° and the base plus ring is O_C. The henselian field, not the raw residue field or its unhenseled completion, is essential.

**Proof or construction.**

1. Import finite boundary and the curve-like boundary-field geometry from R0.
2. Apply H1’s requested closed-point topos equivalence and the finite closed-subset decomposition of the pseudo-adic topos. Correct the valuation-ring target misprint in LRZ Appendix B.2 to Spec K_x.
3. Use Kummer, Hilbert 90 and the cohomological dimension ≤1 of the henselian boundary fields.
4. Apply the finite-flat norm comparison under these equivalences.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space`, `ClassicalAdicEtaleCohomology:H3/universal-compactification`, `ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace`, `AdicSpacesPartII:R0`, `ClassicalAdicEtaleCohomology:H1:henselian`, `ClassicalAdicEtaleCohomology:H0/kummer-sequence`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- The closed disc has one boundary point and one Kummer field summand.
- Replacing K_x by k(x) is disallowed by the source’s explicit henselian warning.
- A boundary point is handled through its pseudo-adic topos, rather than by inventing an analytic adic point space.

**Sources.** Li-Reinecke-Zavyalov-v1, Lemmas 4.2.2, 4.2.4–4.2.5, pp. 32–33; Lemma 5.1.4, p. 43; Corollary 5.2.5, pp. 47–48; Appendix B.1–B.2, pp. 123–124. The paper identifies the finite rank-two boundary, computes its Kummer cohomology through henselized fields, and identifies trace with norm. Several geometry and topos proofs still refer to Huber.

### 8. Compact support as the boundary Kummer cokernel

`ClassicalAdicEtaleCohomology:H3/boundary-localization-presentation` · theorem · proposed name `AdicSpace.boundary_localization`.

In the preceding affinoid-curve setting, let r=#I and s=#π₀(X). For n invertible in C, H⁰_c(X,μ_n)=0 and Hⁱ_c(X,μ_n)=0 for i≥3, and localization gives the exact sequence 0→μ_n(C)^(r−s)→H¹_c(X,μ_n)→H¹(Xᶜ,μ_n)→⊕_{x∈I}K_x×/(K_x×)ⁿ→H²_c(X,μ_n)→0. Moreover H¹(Xᶜ,μ_n)≅H¹(X,μ_n), with 0→A×/(A×)ⁿ→H¹(X,μ_n)→Pic(X)[n]→0. Thus H²_c is canonically the cokernel of the boundary restriction β, as a Z/n-module.

The compact support is relative to Spa(C,O_C); all Kummer groups are written additively when treated as modules.

**Proof or construction.**

1. Use invariance under the dense quasi-compact pro-open j for the overconvergent sheaf μ_n.
2. Import affinoid-curve Hⁱ(X,μ_n)=0 for i≥2 via H1’s henselian comparison, finite-type algebraization and Artin vanishing from the supplier.
3. Apply the inherited open/closed support triangle to X⊂Xᶜ and the boundary Kummer computation.
4. The map H⁰(Xᶜ,μ_n)→H⁰(I,μ_n) is injective because each component meets the boundary; its cokernel has rank r−s.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/henselian-boundary-kummer-comparison`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle`, `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H1:henselian`, `SchemeAndStackFoundations:SF.2`, `AdicSpacesPartII:R0`.

**Acceptance.**

- For a connected disc r=s=1, the initial μ_n(C)^(r−s) term is zero.
- For a connected positive-width annulus with two boundary branches, the initial term is one μ_n(C).
- Do not replace H¹(X,μ_n) by units alone when Pic(X)[n] is nonzero.

**Sources.** Li-Reinecke-Zavyalov-v1, Proposition 5.1.2 and Proposition 5.1.5, pp. 42–43. The two propositions give affinoid cohomology and the complete boundary localization sequence; the proof uses algebraization and henselian comparison. Zavyalov-Foundations-v2, Lemma 10.3, pp. 31–32. Overconvergent complexes are unchanged by dense quasi-compact pro-open restriction; the plus-ring inclusion in its proof requires correction.

### 9. Boundary pretrace

`ClassicalAdicEtaleCohomology:H3/boundary-pretrace` · construction · proposed name `AdicSpace.boundaryPretrace`.

In the affinoid boundary setting define q_x:K_x×/(K_x×)ⁿ→Z/n by the secondary degree #v_x modulo n, and define pretrace P_X:⊕_{x∈I}K_x×/(K_x×)ⁿ→Z/n as the sum of the q_x. The degree is normalized by #(γ₀)=1 for the greatest value γ₀<1. Under the ordered-group decomposition Γ_x≅Γ_C×Z used by LRZ, # is the negative of the second-coordinate projection. In particular the disc boundary has #v(T)=−1. Its finite linear assembly is an instance of Mathlib LinearMap.lsum; geometry and Kummer identifications are additional inputs, not arbitrary parameters replacing cohomology.

n>0 invertible in C; finite boundary I and the secondary degrees are supplied by R0.

**Proof or construction.**

1. Secondary degree is an additive homomorphism on multiplicatively written K_x× and kills n-th powers modulo n.
2. Use the Kummer comparison to regard q_x as a Z/n-linear map.
3. Apply LinearMap.lsum to the finite family q_x. Finite direct sum and finite product agree here.
4. Descent along a quotient uses Submodule.liftQ only after a separately proved image-in-kernel condition; reciprocity is not assumed by the definition.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/henselian-boundary-kummer-comparison`, `AdicSpacesPartII:R0`, `mathlib:LinearMap.lsum`, `mathlib:LinearMap.lsum_piSingle`, `mathlib:Submodule.liftQ`, `mathlib:Submodule.liftQ_mkQ`, `mathlib:Submodule.mkQ`, `mathlib:Submodule.mkQ_surjective`.

**Uses.**

- `boundary-pretrace-reciprocity`: The sum must vanish on the boundary restriction of every global Kummer class.
- `boundary-residue-trace`: The map descends along the boundary localization quotient.
- `LRZ Theorem 5.2.7, p. 48`: Norm compatibility makes boundary traces compatible with finite flat maps.

**API.**

- `BoundaryPretrace.sumDegree` (data): The value on (a_x) is Σ_x q_x(a_x).
- `BoundaryPretrace.single` (simp): The value on a class supported at x is q_x of that class.
- `BoundaryPretrace.reindex` (functoriality): A bijection of the finite boundary set leaves the sum unchanged after transporting its degree maps.
- `BoundaryPretrace.descend` (universal-property): For a submodule N contained in ker P_X there is a unique linear map from B/N whose composite with N.mkQ is P_X; it is N.liftQ P_X.
- `BoundaryPretrace.norm` (compatibility): For a finite flat map and its boundary norm map N, P_Y∘N=P_X whenever each secondary degree satisfies the field norm identity.

**Unit tests.**

- `BoundaryPretrace.test_empty` (degenerate): For the empty finite index set the assembly is zero; this is an algebraic test, not a claim that a nonempty affinoid curve has empty boundary.
- `BoundaryPretrace.test_single` (computation): A vector with one supported component a has value q_x(a).
- `BoundaryPretrace.test_cancel` (computation): Two components of degrees a and −a give zero; neither a maximum nor an unsigned count passes this test.
- `BoundaryPretrace.test_disc_parameter` (computation): At the closed-disc boundary, the Kummer class of T has pretrace −1 modulo n. For n>2 this distinguishes the two possible signs.

**Acceptance.**

- Actual degrees use the value group of henselized boundary fields.
- A positive projection onto the displayed Z factor gives the wrong value on T.

**Sources.** Li-Reinecke-Zavyalov-v1, Definition 2.2.8 and Warning 2.2.9, pp. 11–12; Definition 5.1.8 and Example 5.1.15, pp. 43–45. The secondary degree and its sign determine the sum used to define pretrace; the disc example checks normalization.

### 10. Boundary degree reciprocity

`ClassicalAdicEtaleCohomology:H3/boundary-pretrace-reciprocity` · theorem · proposed name `AdicSpace.boundary_reciprocity`.

For every smooth affinoid curve X in the boundary setting, the composite H¹(Xᶜ,μ_n)→⊕_x K_x×/(K_x×)ⁿ→ᴾ_X Z/n is zero. Equivalently im β⊆ker P_X. The statement applies when n is invertible in C, even if it is divisible by the residue characteristic.

The secondary degrees have the normalization of boundary-pretrace.

**Proof or construction.**

1. Import a finite flat Noether normalization X→D¹_C and the equality of inverse-image boundary sets under its compactification.
2. Under the Kummer comparison finite-flat trace is the norm. Lemma 2.2.10 says #v(Nu)=#v(u) for the corresponding curve-like field extension, so sums commute with that norm map.
3. Reduce to the closed disc using Corollary 5.2.5. Analytic units on the disc have degree zero at its boundary; Proposition 5.1.2 identifies the needed disc Kummer classes with units.
4. This is the first proof of LRZ Theorem 5.1.9; no duality or general smooth trace enters it.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/boundary-pretrace`, `ClassicalAdicEtaleCohomology:H3/boundary-localization-presentation`, `ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace`, `AdicSpacesPartII:R0`, `AdicSpacesPartII:R0/affinoid-noether-normalisation`.

**Acceptance.**

- Vanishing is required on all H¹(Xᶜ,μ_n), including line-bundle Kummer classes.
- Norm compatibility must use henselized field extensions and their defectless curve-like valuation normalization.

**Sources.** Li-Reinecke-Zavyalov-v1, Theorem 5.1.9, p. 44; §5.2, Lemmas 5.2.1–5.2.4 and Corollary 5.2.5, pp. 45–48; Lemma 2.2.10, p. 12. The first proof reduces to the disc by finite flat trace and the secondary norm identity.

### 11. Trace from the boundary residue quotient

`ClassicalAdicEtaleCohomology:H3/boundary-residue-trace` · construction · proposed name `AdicSpace.BoundaryResidueTrace`.

For a smooth affinoid curve X over Spa(C,O_C) and n>0 invertible in C, define t_X:H²_c(X,μ_n)→Z/n as the unique linear map satisfying t_X∘∂=P_X, where ∂ is the surjective boundary connecting map of boundary-localization-presentation. It is surjective. Under a finite flat map of such curves f:X→Y, t_Y∘H²_c(tr_f(1))=t_X. This boundary construction gives the inherited prime-to-residue curve trace once its algebraic normalization comparison is proved; residue-p surjectivity does not imply injectivity.

All compact supports are relative to Spa(C,O_C); no extension of this boundary construction to arbitrary C⁺ is asserted.

**Proof or construction.**

1. Identify H²_c with B/im β by boundary localization.
2. Use boundary-pretrace-reciprocity and Submodule.liftQ to descend P_X; quotient surjectivity proves uniqueness.
3. Each boundary degree is onto, and every nonempty component has a boundary point, so P_X and t_X are onto.
4. Use trace/norm compatibility and the surjectivity of ∂ to obtain finite-flat compatibility.
5. Identify the trace with the classical normalization via boundary-algebraic-trace-comparison, not by assuming duality.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/boundary-localization-presentation`, `ClassicalAdicEtaleCohomology:H3/boundary-pretrace`, `ClassicalAdicEtaleCohomology:H3/boundary-pretrace-reciprocity`, `mathlib:Submodule.liftQ`, `mathlib:Submodule.liftQ_mkQ`, `mathlib:Submodule.mkQ_surjective`.

**Uses.**

- `boundary-algebraic-trace-comparison`: The quotient normalization is compared to scheme traces.
- `etale-coordinate-trace-independence`: A common affinoid-curve trace makes coordinate changes agree.

**API.**

- `BoundaryResidueTrace.comp_boundary` (characterisation): t_X∘∂=P_X.
- `BoundaryResidueTrace.unique` (extensionality): Any linear map from H²_c with this composite equals t_X.
- `BoundaryResidueTrace.surjective` (structure): For nonempty X the map t_X is onto.
- `BoundaryResidueTrace.finiteFlat` (functoriality): t_Y∘H²_c(tr_f(1))=t_X for a finite flat morphism.
- `BoundaryResidueTrace.classical` (compatibility): For n invertible in O_C it agrees with the inherited normalized curve trace, after the algebraic comparison theorem.

**Unit tests.**

- `BoundaryResidueTrace.test_disc` (computation): For the disc, t_X(∂[T])=−1 modulo n; equivalently the class ∂[T⁻¹] has trace 1.
- `BoundaryResidueTrace.test_annulus_relation` (characterisation): The boundary restriction of any global annulus Kummer class has trace zero after applying ∂, by reciprocity on both branches.
- `BoundaryResidueTrace.test_finite_split` (compatibility): For a disjoint union of two copies mapping finitely to X, trace is the sum of the two component traces.
- `BoundaryResidueTrace.test_residue_p` (non-example): For a mixed-characteristic closed disc and n=p, surjectivity cannot be strengthened to an isomorphism: LRZ Lemma 5.5.21 and Remark 5.1.14 describe extra compactly supported classes.

**Acceptance.**

- The quotient relation is im β, not the subgroup of n-th powers already killed in each component.
- Do not equate the finite locally free algebra trace with this degree-two cohomological trace.

**Sources.** Li-Reinecke-Zavyalov-v1, Definition 5.1.10 and Remark 5.1.11, p. 44; Theorem 5.2.7, p. 48. Reciprocity gives a unique boundary-quotient trace; the proof gives surjectivity and compatibility with finite-flat cohomological trace.

### 12. Boundary trace agrees with the algebraic curve trace

`ClassicalAdicEtaleCohomology:H3/boundary-algebraic-trace-comparison` · comparison · proposed name `AdicSpace.boundary_algebraic_trace`.

Let X be a smooth affinoid curve over Spa(C,O_C), n invertible in C, and j:X→X̄ an open immersion into the analytification of a smooth proper algebraic C-curve. Let t_alg be the scheme curve trace transported by proper algebraic–analytic comparison. Then t_X = t_alg∘H²_c(tr_j(1)):H²_c(X,μ_n)→Z/n. Consequently affinoid-curve boundary traces commute with étale maps wherever their source and target are smooth affinoid curves. For n invertible in O_C this identifies t_X with the inherited classical curve trace.

Scheme traces and their open and finite-flat compatibilities belong to EDC.2. The claimed comparison is a statement of the public paper; its full intermediate proof remains to be inspected.

**Proof or construction.**

1. Embed affinoid curves into proper algebraic curves and import semistable formal models from R2.
2. Use the complete disc calculation LRZ Theorem 5.5.19, then the semistable pointed-curve reduction of Theorem 5.6.13.
3. The reduction uses finite flat maps to P¹, compatibility with algebraic finite-flat trace, and the first reciprocity proof.
4. The final proof of Theorem 5.4.2 reduces an arbitrary inclusion to this semistable calculation. Record the uninspected proofs of §§5.5–5.6 as a specific verification gap.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/boundary-residue-trace`, `ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison`, `ClassicalAdicEtaleCohomology:H3/curve-trace`, `ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace`, `AdicSpacesPartII:R2`.

**Acceptance.**

- Comparison is with the scheme cohomological trace, including its Tate twist.
- Different embeddings in proper curves give the same boundary trace.

**Sources.** Li-Reinecke-Zavyalov-v1, Theorem 5.4.2 and Corollary 5.4.3, p. 53; Theorem 5.6.13 and final proof, pp. 65–66. The theorem identifies the boundary normalization with the algebraic trace and derives étale compatibility. The disc and formal-model subproofs are explicitly retained as unread proof inputs.

### 13. Weak base change at geometric field pairs

`ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change` · theorem · proposed name `AdicSpace.support_weak_baseChange`.

Let f:X→Y be a compactifiable locally +weakly finite type morphism of locally noetherian analytic adic spaces and K a bounded-below torsion complex. Formation of R⁺f! has a base-change transformation for every analytic pullback. This transformation is an isomorphism for pullbacks of transcendence dimension zero, in particular the canonical completed algebraic-closure field-pair maps used to compute geometric stalks. This weak assertion does not require torsion orders to be units in O_Y⁺. If torsion orders are units there, the inherited full base-change theorem applies to arbitrary pullbacks.

The dimension-zero condition is on the base-change morphism, not on f. Only the bounded-below version and constant shifted complexes are needed for the public trace proof.

**Proof or construction.**

1. Construct the transformation by the inherited support factorization, with generic mate coherence supplied by E1.
2. Use Huber Theorem 5.4.6 and Corollary 5.4.8 for the dimension-zero criterion; the public LRZ proof states this application but does not reproduce its book proof.
3. Use this weak comparison at geometric points, rather than assuming arbitrary residue-p proper base change.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence`, `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`, `AdicEtaleGeometry:A2`, `EnhancedDerivedSheaves:E1`.

**Acceptance.**

- At residue-p coefficients the transformation remains a map for arbitrary pullbacks; LRZ Example 6.3.3 gives failures of invertibility.
- A completed algebraic-closure stalk map has the stated zero transcendence dimension; an arbitrary extension of algebraically closed fields need not.

**Sources.** Li-Reinecke-Zavyalov-v1, Theorem 6.1.1(2) and footnote 23, pp. 66–67; proof of Lemma 6.1.10, pp. 72–73; proof of Lemma 6.2.3, pp. 75–76. These passages distinguish the general transformation from an isomorphism and use the transcendence-dimension-zero isomorphism at geometric field pairs.

### 14. Top-degree support bound for smooth constant coefficients

`ClassicalAdicEtaleCohomology:H3/smooth-constant-support-top-degree` · theorem · proposed name `AdicSpace.smoothSupport_topDegree`.

For a separated taut smooth f:X→Y of equidimension d between locally noetherian analytic adic spaces, and n>0 invertible in O_Y, put Λ=Z/n. Then Rf!Λ_X(d)[2d] belongs to D≤0(Y_ét,Λ). Every morphism from this complex to Λ_Y factors uniquely through R²ᵈf!Λ_X(d). The source’s use of Huber 5.5.8 covers this constant-coefficient statement without requiring n to be invertible in O_Y⁺.

Smoothness implies dim.tr f=d; the needed transcendence-dimension geometry is imported from A2.

**Proof or construction.**

1. Use the smooth relative dimension comparison of A2.
2. Apply Huber 5.5.8 in the exact form restated in LRZ Lemma 6.1.2; its higher-rank/compactifiable proof is still a recorded gap.
3. Apply ordinary t-structure orthogonality: maps from D≤−1 to degree-zero Λ vanish.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `AdicEtaleGeometry:A2/smooth-pure-relative-dimension`, `AdicEtaleGeometry:A2`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

**Acceptance.**

- For d=0 this agrees with exact étale f!.
- For a residue-p disc, the top cohomology need not have rank one despite vanishing above degree two.

**Sources.** Li-Reinecke-Zavyalov-v1, Lemma 6.1.2, p. 67. The lemma gives the nonpositive shift and unique factorization of smooth trace through top degree using Huber 5.5.8.

### 15. Source descent for top-degree smooth traces

`ClassicalAdicEtaleCohomology:H3/smooth-trace-source-descent` · theorem · proposed name `AdicSpace.smoothTrace_sourceDescent`.

For f as in smooth-constant-support-top-degree and a cover X=⋃_i U_i by taut open immersions, write f_i=f|U_i and f_ii′=f|U_i∩U_i′. The alternating sum of the two extension-by-zero maps gives an exact sequence ⊕_{i,i′}R²ᵈf_ii′!Λ(d)→⊕_i R²ᵈf_i!Λ(d)→R²ᵈf!Λ(d)→0. Consequently trace maps Rf_i!Λ(d)[2d]→Λ that agree on overlaps descend to one unique trace on X. The result allows infinite covers.

All restricted maps remain separated, taut, smooth and equidimensional d.

**Proof or construction.**

1. Apply the augmented support Čech spectral sequence for the open cover.
2. The uniform smooth bound 2d kills all terms above the top row; its degree-2d abutment is the displayed cokernel.
3. Use exact direct sums and support exhaustion to pass from finite subcovers to arbitrary index sets.
4. Apply the unique top-degree factorization to convert this cokernel into descent of trace morphisms.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/smooth-constant-support-top-degree`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-direct-sums`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle`, `ClassicalAdicEtaleCohomology:H0`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Acceptance.**

- One-member covers give the original trace.
- For a disjoint union the descended trace is the sum.
- The overlap arrow has the difference of its two faces; an unsigned sum would give the wrong quotient.

**Sources.** Li-Reinecke-Zavyalov-v1, Lemma 6.1.3 and proof, pp. 67–68. The source-local gluing proof identifies top compact-support cohomology with a Čech cokernel and then descends the maps.

### 16. Normalized trace on analytic affine space

`ClassicalAdicEtaleCohomology:H3/affine-space-trace-model` · construction · proposed name `AdicSpace.AffineSpaceTrace`.

Let Y be locally noetherian analytic, n>0 invertible in O_Y, and Λ=Z/n. The trace for π:A¹,an_Y→Y is the composite Rπ!Λ(1)[2]→Rπ̄_*Λ(1)[2]→R²π̄_*Λ(1)≅Λ, where π̄:P¹,an_Y→Y and the last map is the inverse of the first-Chern-class projective-bundle isomorphism. Define the trace for Aᵈ,an_Y by successive projections and the support composition comparison, with twists and shifts added. For d=0 it is the identity. This trace is independent of a permutation of the affine coordinates and commutes with base-change transformations.

Projective bundle geometry is imported from R3; its cohomological normalization is analytic-projective-line-chern-normalization. The model is the analytic affine space, not the closed polydisc.

**Proof or construction.**

1. Use analytic-projective-line-chern-normalization and the first Chern class, importing only projective-bundle geometry from R3.
2. Use the open extension-by-zero map A¹→P¹ and the top-degree bound.
3. Iterate this one-dimensional model via support composition.
4. For coordinate permutations reduce equality to rank-one stalks using the overconvergent codomain Λ. Use H1’s requested algebraic–analytic support comparison for A² to identify H⁴_c(A²,an_C,Λ(2)) with the scheme value Λ; the GL₂(C) action is trivial because its abelianization is divisible and Λ× is finite.
5. This argument is deliberately not transferred to the residue-p closed polydisc, whose permutation action can be nontrivial.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/smooth-constant-support-top-degree`, `ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-composition`, `ClassicalAdicEtaleCohomology:H3/analytic-projective-line-chern-normalization`, `AdicSpacesPartII:R3`, `ClassicalAdicEtaleCohomology:H1`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace`, `ClassicalAdicEtaleCohomology:H0`.

**Uses.**

- `etale-coordinate-trace-independence`: Provides the target trace for each smooth étale coordinate chart.
- `general-analytic-smooth-trace`: Each chart trace is its composite with an étale counit.

**API.**

- `AffineSpaceTrace.projectiveLine` (characterisation): For d=1 the trace is restriction to P¹ followed by the inverse Chern-class isomorphism in degree two.
- `AffineSpaceTrace.projection` (functoriality): Successive projections compose the traces with the corresponding Tate twists and cohomological shifts.
- `AffineSpaceTrace.permutation` (compatibility): Any permutation of affine coordinates leaves the trace unchanged.
- `AffineSpaceTrace.baseChange` (functoriality): Pullback of the trace equals the trace on the pullback after the canonical support base-change transformation.
- `AffineSpaceTrace.algebraic` (compatibility): Over Spa(C,O_C) it agrees with the scheme affine-space trace under algebraic–analytic support comparison.

**Unit tests.**

- `AffineSpaceTrace.test_zero` (degenerate): Dimension zero gives the identity Λ→Λ.
- `AffineSpaceTrace.test_line_class` (computation): The zero-section class in H²_c(A¹,an_C,Λ(1)) has trace 1.
- `AffineSpaceTrace.test_swap` (compatibility): Interchanging the two coordinates of A²,an_C preserves its trace.
- `AffineSpaceTrace.test_closed_polydisc` (non-example): At residue-p coefficients the same permutation-triviality assertion for H⁴_c(D²_C,μ_p⊗²) is false; LRZ Remark 6.1.8 gives two distinct point classes.

**Acceptance.**

- Every base-change square commutes with its canonical support transformation; this need not be invertible.

**Sources.** Li-Reinecke-Zavyalov-v1, Lemma 6.1.6 and formula (6.1.7), pp. 69–70; Remark 6.1.8, pp. 70–71. The trace is constructed by the projective line and iterated affine projections; the proof establishes permutation invariance and explains why closed polydiscs cannot replace affine space.

### 17. Analytic first Chern class

`ClassicalAdicEtaleCohomology:H3/analytic-first-chern-class` · construction · proposed name `AdicSpace.AnalyticFirstChernClass`.

For a locally noetherian analytic adic space X, n>0 invertible in O_X, and a line bundle L, define c₁(L)∈H²(X_ét,μ_n) as the Kummer connecting image of its class in Pic(X)≅H¹(X_ét,G_m). It is additive under tensor product, commutes with analytic pullback, and agrees with the scheme first Chern class under relative analytification. This is a cohomological construction in H3; the line bundles themselves and their pullbacks are supplied by R3.

No choice of a root of unity is part of the definition; the target is μ_n, not an untwisted coefficient group.

**Proof or construction.**

1. Use the line-bundle/G_m-torsor equivalence from R3 and H0.
2. Apply the Kummer connecting homomorphism.
3. Exactness and naturality give additivity, trivial-bundle vanishing and pullback compatibility.
4. Compare scheme and analytic Kummer sequences and the pullback of line bundles to obtain the analytification comparison.

**Direct prerequisites.** `AdicSpacesPartII:R3`, `ClassicalAdicEtaleCohomology:H0/kummer-sequence`, `ClassicalAdicEtaleCohomology:H0`, `EnhancedDerivedSheaves:E1`, `EtaleDualityAndPerverseSheaves:EDC.2`, `AdicSpacesPartII:R3/locally-free-sheaf`.

**Uses.**

- `analytic-projective-line-chern-normalization`: The class of O(1) supplies the projective-line cohomology generator.
- `affine-space-trace-model`: Fixes the affine trace normalization and therefore the general smooth trace.

**API.**

- `AnalyticFirstChernClass.kummer` (characterisation): c₁(L)=δ_Kummer([L]) in H²(X,μ_n).
- `AnalyticFirstChernClass.tensor` (functoriality): c₁(L⊗M)=c₁(L)+c₁(M).
- `AnalyticFirstChernClass.pullback` (functoriality): g*c₁(L)=c₁(g*L).
- `AnalyticFirstChernClass.analytification` (compatibility): The scheme-to-analytic étale comparison sends the scheme c₁(L) to c₁(L_an).

**Unit tests.**

- `AnalyticFirstChernClass.test_trivial` (degenerate): The trivial line bundle has first Chern class zero.
- `AnalyticFirstChernClass.test_power` (computation): c₁(L⊗n)=n·c₁(L)=0 in H²(X,μ_n).
- `AnalyticFirstChernClass.test_projective_line` (compatibility): On P¹,an_C the class of O(1) agrees with the scheme degree-one generator and has algebraic trace 1.

**Acceptance.**

- The line-bundle class lies in H¹(G_m), correcting the degree slip in Remark 3.1.10.

**Sources.** Li-Reinecke-Zavyalov-v1, Variant 3.1.8, Remarks 3.1.9–3.1.10 and Lemma 3.1.11, pp. 22–23. The first Chern class is the Kummer boundary of the line-bundle class and respects pullback and scheme comparison.

### 18. Projective-line cohomology with its Chern normalization

`ClassicalAdicEtaleCohomology:H3/analytic-projective-line-chern-normalization` · theorem · proposed name `AdicSpace.projectiveLine_chern_normalization`.

For Y locally noetherian analytic and n>0 invertible in O_Y, write Λ=Z/n and π̄:P¹,an_Y→Y. The unit and c₁(O(1)) give an equivalence Λ_Y ⊕ Λ_Y(−1)[−2]→Rπ̄_*Λ. In particular c₁(O(1)) induces Λ_Y≅R²π̄_*Λ(1). These identifications commute with the canonical base-change transformations.

This special projective-bundle formula suffices for affine trace normalization; no analytic lci cycle-class or blow-up theory is reconstructed here.

**Proof or construction.**

1. Use analytic-first-chern-class and the projective-line geometry from R3.
2. Import from H0 overconvergence of the proper pushforward of the overconvergent constant sheaf.
3. Use the rank-one stalk criterion and weak geometric base change to reduce to P¹,an_C.
4. Use the algebraic–analytic proper comparison and the scheme projective-line formula with its Chern generator.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/analytic-first-chern-class`, `ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change`, `ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison`, `AdicSpacesPartII:R3`, `ClassicalAdicEtaleCohomology:H0`, `EtaleDualityAndPerverseSheaves:EDC.2`.

**Acceptance.**

- R⁰π̄_*Λ=Λ and R²π̄_*Λ(1)=Λ, with all other positive degrees zero.
- The generator is c₁(O(1)); changing it by a sign would change the trace normalization.

**Sources.** Li-Reinecke-Zavyalov-v1, Construction 3.2.1 and Proposition 3.2.2, p. 23. The projective-bundle formula reduces to rank-one points by overconvergence and identifies the summands using first Chern classes; the displayed construction’s degree-zero target is corrected to Λ_P.

### 19. Top curve trace constancy across the plus ring

`ClassicalAdicEtaleCohomology:H3/plus-ring-top-trace-constancy` · theorem · proposed name `AdicSpace.curveTrace_plusRing_constancy`.

Let C be complete algebraically closed nonarchimedean, C⁺ an open bounded valuation subring, S=Spa(C,C⁺), and n>0 invertible in C⁺. For a separated taut smooth curve f:X→S with all geometric fibres nonempty and connected, the specialization maps of R²f!μ_n between geometric points of S are isomorphisms. Consequently its normalized trace R²f!μ_n→(Z/n)_S is an isomorphism, by the rank-one connected-curve trace theorem. This contract covers arbitrary curves, including positive-width annuli and curves without smooth-model tube presentations.

Connectedness is required for every geometric fibre, rather than merely nonemptiness of X. The constancy and plus-ring scope are required inputs, not established by the public trace-existence theorem.

**Proof or construction.**

1. Use weak base change and the required general connected rank-one curve trace theorem to identify the generic stalk. Its proof beyond the inherited ball, unit-circle, projective-line and open-disc cases is part of the trace-isomorphism gap.
2. The missing step is constancy at all higher-rank specializations for an arbitrary smooth curve; it cannot be obtained merely from equality detection with overconvergent codomain.
3. Once this constancy is proved, the inherited conditional plus-ring curve-trace-isomorphism applies.
4. Huber 7.2.2 must be verified at this full scope; ECD Theorem 24.1 directly confirms the relative-ball use only.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected`, `ClassicalAdicEtaleCohomology:H3/general-analytic-smooth-trace`, `ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change`, `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`.

**Acceptance.**

- A positive-width annulus is covered by the contract; an argument restricted to tubes of smooth models does not pass.
- Nonempty disconnected fibres have componentwise trace and do not satisfy a rank-one top-trace isomorphism.

**Sources.** Scholze-ECD-v4, Theorem 24.1, proof, pp. 152–153. The proof requires the trace isomorphism for the ball over arbitrary Spa(C,C⁺) and cites Huber 7.2.2. It is a consumer, not an independent proof of general curve constancy.

### 20. Higher-rank curve effacement input

`ClassicalAdicEtaleCohomology:H3/plus-ring-curve-effacement` · theorem · proposed name `AdicSpace.curveEffacement_plusRing`.

Required proof input for the higher-rank extension of the inherited curve fundamental lemma: for S=Spa(C,C⁺), n invertible in C⁺, a separated taut smooth curve f:Y→S, and a point y∈Y, construct a separated taut étale g:Y′→Y whose image contains y and whose relevant curve components are nonempty, connected and nonproper, such that the trace-induced map R¹(fg)!μ_n→R¹f!μ_n is zero. Construct iterated such neighborhoods so that the resulting support map factors through the top-degree trace term (Z/n)(−1)[−2]. The statement is the sufficient effacement contract to verify, not a claimed transcription of the unread book theorem.

The inherited curve-fundamental-lemma proves the rank-one base case only. The higher-rank proof must state which connectedness and neighborhood hypotheses are needed; that exact source-scope verification is an explicit gap.

**Proof or construction.**

1. Import the scheme curve-effacement theorem from EDC.2 and the inherited rank-one analytic fundamental lemma.
2. Use H1 henselian comparison on the pseudo-adic support neighborhoods needed at higher-rank points.
3. Prove the zero map on R¹ as a sheaf on all of S, not just at its maximal point.
4. Combine top trace constancy and the degree-two support bound to obtain the derived factorization used by the duality proof. The unrestricted neighborhood construction remains unverified.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/curve-fundamental-lemma`, `ClassicalAdicEtaleCohomology:H3/plus-ring-top-trace-constancy`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension`, `ClassicalAdicEtaleCohomology:H1:henselian`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-effacement-lemma`.

**Acceptance.**

- Vanishing only after restricting to Spa(C,O_C) is insufficient.
- The construction must work for a relative ball over a higher-rank C⁺ even when no smooth formal-model argument is available.

**Sources.** Scholze-ECD-v4, Theorem 24.1, proof, pp. 152–153, citation of Huber 7.5.3. The consumer requires full higher-rank curve duality. This node isolates the effacement extension required by the inherited rank-one proof; the book’s exact intermediate lemma and proof must still be checked.

### 21. Curve duality with an open coefficient for every complex

`ClassicalAdicEtaleCohomology:H3/unbounded-open-coefficient-curve-duality` · application · proposed name `AdicSpace.curveDuality_openCoefficient`.

Let S=Spa(C,C⁺), ℓ invertible in C⁺, Λ=F_ℓ, f:X→S a separated taut smooth curve, j:U→S a quasi-compact open immersion, and j′:X_U→X its pullback. For every G in the unbounded D(X_ét,Λ), the trace gives a natural equivalence of derived mapping complexes RHom_X(G,j′!Λ(1)[2])≅RHom_S(Rf!G,j!Λ). The equivalence respects localization, the projection formula and the support exchange j!Rf_U!≅Rf!j′!. It applies in particular to the relative ball used by ECD 24.1. A consumer that has independently constructed exceptional right adjoints can identify the corresponding open-extension mate by Yoneda; no such adjoint is used to prove this classical equivalence.

Full higher-rank curve duality for D⁻ arguments and D⁺ coefficients is an inherited target whose unresolved proof is tracked in continuations. The assertion is for all G; restricting G to j′!G_U would not supply Proposition 23.10(iii).

**Proof or construction.**

1. Apply full higher-rank curve duality to G∈D⁻ and F=j!Λ; exact open pullback gives f*(j!Λ)≅j′!Λ.
2. The map is the one induced by the normalized trace, so its restriction agrees with the inherited open support exchange.
3. For arbitrary G, use G≅hocolim_m τ≤mG in E1’s enhancement and colimit preservation of Rf!.
4. Derived mapping objects turn this colimit in the first argument into a homotopy limit. Pass the bounded-above equivalences through that limit; degreewise Hom alone would miss possible derived-limit terms.
5. Only the downstream independently defined adjunction and Yoneda turn this into the exceptional mate of ECD 23.10(iii).

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`, `ClassicalAdicEtaleCohomology:H3/duality-open-extension-compatibility`, `ClassicalAdicEtaleCohomology:H3/plus-ring-curve-effacement`, `ClassicalAdicEtaleCohomology:H3/unbounded-classical-support-comparison`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-projection-formula`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Acceptance.**

- Include a test object whose support meets the complement of X_U; the theorem must still be stated for it.
- For U=S this is ordinary unbounded curve duality with constant coefficients.
- For U empty both target coefficients vanish and both derived mapping complexes are zero.

**Sources.** Scholze-ECD-v4, Proposition 23.10(iii) and proof, pp. 145–146; Theorem 24.1 and proof, pp. 152–153. The open-extension mate is the consumer. The displayed classical all-G mapping equivalence is the trace-duality input needed to obtain it; the truncation extension is the formal E1 argument stated here, not a separate theorem claimed in ECD.

### 22. Finite perfect curve pairing over an arbitrary plus ring

`ClassicalAdicEtaleCohomology:H3/plus-ring-finite-local-system-pairing` · application · proposed name `AdicSpace.curvePairing_plusRing`.

Let S=Spa(C,C⁺) as above, ℓ invertible in C⁺, Λ=F_ℓ, and f:X→S a quasi-compact separated taut smooth curve. For a finite-rank Λ-local system L, the trace pairing Hⁱ_c(X/S,L)×H²⁻ⁱ(X,L∨(1))→Λ is perfect, and both groups are finite-dimensional; they vanish outside degrees 0 through 2. Equivalently RΓ_c(X/S,L) and RΓ(X,L∨(1))[2] are finite complexes dual to each other. The pairing agrees with the inherited C⁺=O_C pairing under its comparison maps. Non-quasi-compact curves are not included in the finite-dimensionality assertion.

Λ is a field here so finite local systems are locally finite free and the ordinary linear dual computes their derived dual. The full higher-rank duality target, including its coefficient/sheaf naturality, remains a prerequisite proof obligation.

**Proof or construction.**

1. Use H0’s dense quasi-compact pro-open invariance to compare ordinary cohomology with X_η over Spa(C,O_C); local systems are overconvergent.
2. Apply the inherited quasi-compact curve finiteness theorem to that ordinary cohomology.
3. Apply the full higher-rank curve-duality transformation and the field-pair global-section comparison supplied by H0 to identify compactly supported cohomology with the degree-reversed dual.
4. Finite-dimensional ordinary cohomology yields biduality and compact-support finiteness; no separate uniform finiteness claim for arbitrary torsion sheaves is inserted.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`, `ClassicalAdicEtaleCohomology:H3/curve-cohomology-finiteness`, `ClassicalAdicEtaleCohomology:H3/curve-duality-perfect-pairing`, `ClassicalAdicEtaleCohomology:H3/plus-ring-top-trace-constancy`, `ClassicalAdicEtaleCohomology:H3/plus-ring-curve-effacement`, `ClassicalAdicEtaleCohomology:H0`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`.

**Acceptance.**

- For a connected proper curve this specializes to the usual degree-reversed perfect pairing.
- An infinite disjoint union of discs is excluded from this finite-dimensional conclusion.
- Residue-p coefficients on nonproper discs are excluded by ℓ invertible in C⁺.

**Sources.** Zavyalov-Foundations-v2, Lemma 10.3, pp. 31–32. Overconvergent pro-open invariance supplies the ordinary-cohomology reduction to the maximal plus ring. Scholze-ECD-v4, Theorem 24.1, proof, pp. 152–153, citing Huber 7.5.3. The full arbitrary-plus-ring duality input is required; the finite field-coefficient pairing is its consequence together with the inherited finiteness theorem, not an independently proved claim in ECD.

### 23. Independence of smooth étale coordinates

`ClassicalAdicEtaleCohomology:H3/etale-coordinate-trace-independence` · theorem · proposed name `AdicSpace.smoothTrace_chartIndependence`.

For f:X→Y separated taut smooth of equidimension d and n invertible in O_Y, suppose g₁,g₂:X→Aᵈ,an_Y are étale Y-maps. The maps Rf!Λ(d)[2d]→Rπ!Λ(d)[2d]→Λ obtained from the two étale counits and AffineSpaceTrace are equal.

Trace equality only requires the codomain Λ to be overconvergent; no overconvergence of R²ᵈf!Λ is assumed.

**Proof or construction.**

1. Use top-degree factorization and H0’s requested codomain-only rank-one equality criterion.
2. Pull back to geometric rank-one stalks using weak support base change.
3. Use the smooth differential criterion and basis exchange to connect the two coordinate systems by swaps and one-coordinate changes on a Zariski-open cover.
4. Permutation invariance handles swaps. A one-coordinate change reduces, after another geometric stalk restriction, to a smooth affinoid curve.
5. Use boundary-algebraic-trace-comparison and its étale compatibility for that curve, then source descent to assemble the equality.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/affine-space-trace-model`, `ClassicalAdicEtaleCohomology:H3/boundary-algebraic-trace-comparison`, `ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change`, `ClassicalAdicEtaleCohomology:H3/smooth-trace-source-descent`, `AdicSpacesPartII:R0/smooth-differentials-locally-free`, `AdicSpacesPartII:R0`, `ClassicalAdicEtaleCohomology:H0`.

**Acceptance.**

- The lower chart arrow uses the g₂ counit, correcting the duplicated g₁ label in the source diagram.
- No diamond smoothness or pre-existing exceptional right adjoint is used.

**Sources.** Li-Reinecke-Zavyalov-v1, Lemmas 6.1.5 and 6.1.9–6.1.10, pp. 68, 71–73. The proof reduces coordinate changes to curve traces by basis exchange and checks equality on rank-one points with overconvergent codomain.

### 24. Smooth trace over general analytic bases

`ClassicalAdicEtaleCohomology:H3/general-analytic-smooth-trace` · construction · proposed name `AdicSpace.GeneralSmoothTrace`.

Assign to every separated taut smooth f:X→Y of equidimension d between locally noetherian analytic adic spaces, n>0 invertible in O_Y and Λ=Z/n, a trace tr_f:Rf!Λ_X(d)[2d]→Λ_Y. Choose étale smooth coordinate charts into Aᵈ,an, compose their étale counits with AffineSpaceTrace, and descend from a taut source cover. The resulting assignment is independent of all choices, compatible with compositions and pullback transformations, equals the étale counit in dimension zero, and has the scheme P¹ normalization. These properties characterize the assignment. This expands the inherited rigid-base trace scope to arbitrary analytic bases and plus rings; it does not assert arbitrary-sheaf duality or that top trace is an isomorphism.

n must be a unit in O_Y; it can fail to be a unit in O_Y⁺. Classical Rf! on the displayed shifted constant complex suffices; an exceptional right adjoint is not part of the construction.

**Proof or construction.**

1. Use R0’s smooth étale coordinate charts on affinoid opens of source and target.
2. Compose the affine-space model with the exact étale summation counit.
3. Apply chart independence on intersections and source descent to glue.
4. Check composition by charts compatible with successive affine projections; check pullbacks through their canonical support transformation.
5. Étale normalization is built into the recipe; the P¹ normalization follows from its two affine charts and the Chern-class convention.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H3/affine-space-trace-model`, `ClassicalAdicEtaleCohomology:H3/etale-coordinate-trace-independence`, `ClassicalAdicEtaleCohomology:H3/smooth-trace-source-descent`, `ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change`, `AdicSpacesPartII:R0`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `EnhancedDerivedSheaves:E1`.

**Uses.**

- `ClassicalAdicEtaleCohomology:H3/curve-trace`: Provides a public construction with the normalized curve trace on its prime-to-residue range.
- `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`: Extends the geometric scope beyond partially proper rigid spaces.
- `DiamondSixOperations:S4 and S5; ECD Theorem 24.1`: Provides the classical trace, while the additional plus-ring duality remains a separate prerequisite.

**API.**

- `GeneralSmoothTrace.chart` (characterisation): On an étale coordinate chart, trace is AffineSpaceTrace composed with the étale counit.
- `GeneralSmoothTrace.independent` (extensionality): The trace does not depend on the charts or cover; any normalized compatible assignment has the same maps.
- `GeneralSmoothTrace.comp` (functoriality): tr_(g∘f)=tr_g∘Rg!(tr_f(e)[2e]) for smooth maps of dimensions d and e, using support composition and projection formula.
- `GeneralSmoothTrace.baseChange` (functoriality): For a Cartesian pullback, tr_f′∘BC=g*tr_f. BC is not declared invertible unless its separate hypotheses hold.
- `GeneralSmoothTrace.etale` (compatibility): For étale f the trace is the usual exact f!–f* counit.
- `GeneralSmoothTrace.projectiveLine` (compatibility): For P¹,an_C over Spa(C,O_C), the trace is the transported algebraic curve trace.
- `GeneralSmoothTrace.topDegree` (characterisation): The trace factors uniquely through R²ᵈf!Λ(d).

**Unit tests.**

- `GeneralSmoothTrace.test_identity` (degenerate): The trace for id_Y is id_Λ.
- `GeneralSmoothTrace.test_finite_etale` (computation): For a split finite étale cover with r sheets, the trace sums the r components and its composite with the unit is multiplication by r.
- `GeneralSmoothTrace.test_projective_line` (compatibility): The analytified degree-one point class of P¹_C has trace 1.
- `GeneralSmoothTrace.test_higher_rank` (characterisation): The trace is defined for the relative disc over Spa(C,C⁺) of rank(C⁺)>1 and is compatible with the rank-one generic pullback.
- `GeneralSmoothTrace.test_residue_p_scope` (non-example): For a mixed-characteristic closed disc with Λ=F_p the trace exists, but its existence must not imply a one-dimensional H²_c or nonproper arbitrary-sheaf duality.

**Acceptance.**

- The result includes Spa(C,C⁺) for arbitrary open bounded valuation subrings.
- Residue-p coefficients on a nonproper disc do not satisfy full classical Poincaré duality merely because this trace exists.

**Sources.** Li-Reinecke-Zavyalov-v1, Theorem 6.1.1 and its proof, pp. 66–74; Theorem 1.2.1, pp. 3–4. The public construction gives the stated general analytic trace and its uniqueness and normalization, with pullback compatibility through a possibly noninvertible map.

## Imported supplier contracts

E1/enhanced-derived-category supplies the enhancement and ordinary derived-category comparison. E1/presentability-and-derived-tensor supplies homotopy colimits, derived tensor, internal Hom and the relevant site functors. E1/k-injective-and-k-flat-replacements supplies resolution machinery. EDC.2:trace-purity supplies the scheme curve trace, curve effacement, quasi-finite flat trace and affine-space trace by their exact node IDs in the packet. H0/geometric-stalks-at-field-pairs identifies field-pair global sections with the closed-point stalk and supplies the exactness needed for the global mapping application. Existing suppliers are imported with their stated scope; the following requests identify the additional scope that is not already present.

1. **`AdicEtaleGeometry:A2`.** Extend the relative transcendence-dimension API from locally finite type to +weakly finite type maps and proper universal compactifications; give dim.tr fᶜ=dim.tr f as the H3 application of geometry, dim.tr f=d for smooth equidimensional f, and the zero dimension of canonical completed algebraic-closure field-pair stalk maps. Topological rank-one fibre dimension alone does not cover a non-locally-finite-type compactification. Required by `ClassicalAdicEtaleCohomology:H3/compactification-transcendence-dimension`, `ClassicalAdicEtaleCohomology:H3/proper-torsion-cohomological-amplitude`, `ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change`, `ClassicalAdicEtaleCohomology:H3/smooth-constant-support-top-degree`.

2. **`AdicSpacesPartII:R0`.** Build on R0/affinoid-noether-normalisation: for smooth affinoid C-curves its finite map to D¹ is flat. Supply boundary geometry in LRZ 4.2.1–4.2.5: finite discrete rank-two boundary meeting every component, exact inverse-image boundary and finite compactified map, curve-like henselized boundary fields, their defectlessness and secondary residue field, the greatest value γ₀<1 and #v(T)=−1 for the disc, and #v_K(N_L/K u)=#v_L(u). These geometric/valuation extensions belong to AdicSpaces, Part II, not a duplicate valuation theory in H3. Required by `ClassicalAdicEtaleCohomology:H3/henselian-boundary-kummer-comparison`, `ClassicalAdicEtaleCohomology:H3/boundary-pretrace`, `ClassicalAdicEtaleCohomology:H3/boundary-pretrace-reciprocity`.

3. **`AdicSpacesPartII:R0`.** Supply étale coordinate neighborhoods for smooth maps over arbitrary locally noetherian analytic bases, including higher-rank field pairs, with the differential criterion used for mixed coordinate systems in LRZ 6.1.10. The existing smooth-toric-chart has a rigid rank-one base and does not supply this scope. Also supply projective-line geometry over these bases and its O(1), compatible with relative analytification. Required by `ClassicalAdicEtaleCohomology:H3/etale-coordinate-trace-independence`, `ClassicalAdicEtaleCohomology:H3/general-analytic-smooth-trace`, `ClassicalAdicEtaleCohomology:H3/analytic-projective-line-chern-normalization`.

4. **`AdicSpacesPartII:R2`.** For a smooth affinoid C-curve, supply embedding into a smooth proper algebraizable C-curve and the semistable formal O_C-models and pointed reductions used in LRZ 4.1.6, 5.5–5.6. The existing formal/rigid properness comparison is retained; semistable curve models over nondiscrete O_C are an extension, not the discrete-dagger F1 theorem. Required by `ClassicalAdicEtaleCohomology:H3/boundary-algebraic-trace-comparison`.

5. **`AdicSpacesPartII:R3`.** Use R3/locally-free-sheaf and its coherent tensor/pullback API for line bundles and O(1). Supply the line-bundle/G_m-torsor equivalence, compatible with the analytic étale site. This request concerns the carrier and torsor comparison; H3 owns the Kummer first Chern class and trace normalization, and R3’s finite algebra trace is not a cohomological curve trace. Required by `ClassicalAdicEtaleCohomology:H3/analytic-first-chern-class`, `ClassicalAdicEtaleCohomology:H3/analytic-projective-line-chern-normalization`, `ClassicalAdicEtaleCohomology:H3/affine-space-trace-model`.

6. **`ClassicalAdicEtaleCohomology:H0`.** Supply the additional analytic sheaf lemmas: (a) equality of maps F→G is detected on rank-one stalks if the codomain G alone is overconvergent (LRZ 6.1.5); the existing maximal-stalk node requires both sheaves overconvergent; (b) for a dense quasi-compact pro-open j and overconvergent complex F, F→Rj*j*F is an equivalence (Zavyalov 10.3), with the corrected plus-ring inclusion; (c) Rᑫp_*Λ is overconvergent for the proper projective-line morphism over arbitrary analytic bases, as used in LRZ 3.2.2; (d) exact étale slice base change and the resolution of module sheaves by colimits of j!Λ generators for arbitrary n; (e) the support Čech spectral sequence used in LRZ 6.1.3, compatible with infinite-cover exhaustion. Existing H0/cech-to-derived-comparison is ordinary cohomology, so (e) requires its support extension. Required by `ClassicalAdicEtaleCohomology:H3/boundary-localization-presentation`, `ClassicalAdicEtaleCohomology:H3/etale-coordinate-trace-independence`, `ClassicalAdicEtaleCohomology:H3/affine-space-trace-model`, `ClassicalAdicEtaleCohomology:H3/analytic-projective-line-chern-normalization`, `ClassicalAdicEtaleCohomology:H3/proper-projection-formula-all-torsion`, `ClassicalAdicEtaleCohomology:H3/smooth-trace-source-descent`, `ClassicalAdicEtaleCohomology:H3/plus-ring-finite-local-system-pairing`.

7. **`ClassicalAdicEtaleCohomology:H1:henselian`.** Extend the pro-special constant-cohomology comparison to the closed-point étale-topos equivalence (X,{x})_ét≃(Spec k(x)ʰ)_ét≃(Spec completed k(x)ʰ)_ét used in LRZ B.2.1. Prove functoriality for finite boundary maps, norm comparison on Kummer cohomology, and the affinoid-curve comparison with the algebraized finite-type C-curve needed for vanishing above degree one. Henselization is required before completion. Required by `ClassicalAdicEtaleCohomology:H3/henselian-boundary-kummer-comparison`, `ClassicalAdicEtaleCohomology:H3/boundary-localization-presentation`, `ClassicalAdicEtaleCohomology:H3/plus-ring-curve-effacement`.

8. **`ClassicalAdicEtaleCohomology:H1`.** Supply algebraic–analytic cohomology comparison for P¹_C and compact-support comparison for A²_C with n invertible in C, including residue-p n in mixed characteristic and compatibility with Chern classes and the GL₂(C) action. The inherited H3 algebraic-curve comparison covers curves; the A² comparison used in LRZ 6.1.6 needs the higher-dimensional henselian/proper comparison plus H3 support localization. Required by `ClassicalAdicEtaleCohomology:H3/affine-space-trace-model`, `ClassicalAdicEtaleCohomology:H3/analytic-projective-line-chern-normalization`.

9. **`ClassicalAdicEtaleCohomology:H2`.** For a surjective extension Spa(C′,C′⁺)→Spa(C,C⁺), prove cohomological invariance for arbitrary étale Z/n-module sheaves on proper spaces and their pseudo-adic fibres, n invertible in C⁺. Existing H2/invariance-for-affinoids-of-finite-type supplies j!M on finite-type affinoids; provide the sheaf dévissage and the exact base-change-map identification, as required by Huber 4.3.2 and Zavyalov Lemma 9.1(3). Required by `ClassicalAdicEtaleCohomology:H3/proper-pushforward-base-change`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-base-change`.

10. **`SchemeAndStackFoundations:SF.2`.** Supply Hilbert 90/Kummer over the henselized boundary fields, with cohomological dimension ≤1 for the curve-like fields in LRZ Lemma 5.1.4; give the hypotheses and valuation input rather than applying a bound for an arbitrary field. Also supply Artin vanishing above degree one for torsion étale cohomology on smooth affine curves over algebraically closed C with torsion order invertible in C. The analytic-to-algebraic comparison belongs to H1, and affinoid Noether normalization to R0. Required by `ClassicalAdicEtaleCohomology:H3/henselian-boundary-kummer-comparison`, `ClassicalAdicEtaleCohomology:H3/boundary-localization-presentation`.

11. **`EtaleDualityAndPerverseSheaves:EDC.2`.** Supply the scheme P¹ cohomology decomposition with its c₁(O(1)) generator and Tate convention, and compatibility of the scheme first Chern class and curve trace with analytification through the supplied site comparison. Existing EDC.2 curve/affine trace and effacement nodes are imported directly, not reconstructed. Required by `ClassicalAdicEtaleCohomology:H3/analytic-first-chern-class`, `ClassicalAdicEtaleCohomology:H3/analytic-projective-line-chern-normalization`.

12. **`EnhancedDerivedSheaves:E1`.** Supply the coherent proper/étale gluing fragment used in Zavyalov Theorem 9.4: from proper pushforwards and exact étale ! with exchange, base change, projection formula and descent, construct the corresponding support functors on locally +weakly finite type maps with composition and agreement on D⁺. Do not assume exceptional right adjoints, diamond duality, or the result of the H3 instance. Also give support-mate pasting, tensor/internal-Hom coherence, and mapping-complex conversion of first-argument homotopy colimits to homotopy limits, with the ordinary/enhanced comparison. Required by `ClassicalAdicEtaleCohomology:H3/unbounded-classical-support-comparison`, `ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change`, `ClassicalAdicEtaleCohomology:H3/general-analytic-smooth-trace`, `ClassicalAdicEtaleCohomology:H3/analytic-first-chern-class`, `ClassicalAdicEtaleCohomology:H3/unbounded-open-coefficient-curve-duality`, `ClassicalAdicEtaleCohomology:H3/smooth-proper-relative-local-system-duality`.

13. **`EnhancedDerivedSheaves:E2`.** Retain the accepted integral request: for smooth proper rigid f and the epimorphic top finite-level systems, identify R²ᵈf_proét,*Ẑ_p(d) with lim_r ν*R²ᵈf_*Z/pʳ(d), give the next-degree vanishing and inverse-limit lifting that proves integral trace surjectivity. This is not needed for the finite-coefficient curve input to ECD 24.1. Required by `ClassicalAdicEtaleCohomology:H3/integral-smooth-proper-trace`, `ClassicalAdicEtaleCohomology:H3/guo-reinecke-etale-trace-normalization-export`.

## Proof obligations and completion boundary

1. **Global universal-compactification proof.** Huber 5.1.5–5.1.6 and 5.1.14 are not available in a cleared source. LRZ A.0.3 supplies the affinoid maximal-plus-ring case, and Zavyalov 9.1 states the global application. Prove gluing over compactified intersections using separatedness and tautness, quasi-compact properness, and transcendence-dimension preservation; a diamond compactification theorem cannot close the classical proof.

2. **Non-algebraizable proper closed-fibre vanishing.** The all-torsion vanishing in Huber 4.4.3 is used with the same mathematical content by the public proof of Zavyalov 9.3, but that proof is not reproduced. H1 transfer covers algebraizable formal models and does not establish the theorem for arbitrary proper analytic adic spaces. Verify/prove it without importing diamond proper base change.

3. **Higher-rank and compactification cohomological dimension.** Huber 5.3.11 and 5.5.8 remain proof obligations, including the non-locally-finite-type compactification and pseudo-adic boundary. An absolute bound on a rank-one finite-type affinoid is insufficient even for the inherited general rank-one support proof. LRZ 6.1.2 verifies the constant smooth output; Zavyalov 9.1 verifies the proper-amplitude use, but neither re-proves the bound.

4. **Boundary geometry and closed-point topos proofs.** LRZ 4.2.4–4.2.5 refer to Huber’s 2001 curve paper for boundary rank/curve-like field facts, and B.2.1 refers to Huber 2.3.10 for the full topos equivalence. Their statements were read in the public paper, but the cited proofs were not read. Obtain a permitted proof source and close the R0/H1 requests; do not substitute an unhenseled residue field.

5. **Algebraic normalization of the boundary trace.** Theorem 5.4.2 and the final reduction via 5.6.13 were read, but the intermediate disc and pointed-semistable calculations in LRZ §§5.5–5.6 have not all been inspected. Read and verify Theorem 5.5.19, the relevant line-bundle calculations, and Lemmas 5.6.8–5.6.12; match the H1/R2 transfer and finite-flat comparison hypotheses. This is a proof-verification gap, not an asserted flaw in the paper.

6. **Arbitrary-plus-ring top curve trace constancy.** The required contract in plus-ring-top-trace-constancy is not proved by the public sources read. ECD 24.1 confirms the ball input and cites Huber 7.2.2; the general curve scope and proof must be checked. The inherited smooth-model transfer proves balls, unit circles and P¹, with open discs by exhaustion, and does not cover positive-width annuli. This includes proof of the general connected rank-one trace isomorphism before transporting it across higher-rank specializations; it is not already supplied for every curve by the smooth-model cases.

7. **Higher-rank effacement and full curve duality.** Verify the exact intermediate neighborhood hypotheses in Huber’s proof of 7.5.3 and establish the sufficient effacement contract written here. Then extend the inherited injective-resolution/generator proof to arbitrary C⁺, arbitrary G∈D⁻ and F∈D⁺, with naturality of the actual trace-induced transformation. Duality is unproved even for the relative ball at C⁺≠O_C. ECD’s diamond conclusion and a previously assumed exceptional right adjoint are inadmissible proofs.

8. **Arbitrary-sheaf field-pair invariance.** H2’s j!M affinoid invariance and Čech extension do not establish Huber 4.3.2 for arbitrary sheaves needed by proper base change. Close the H2 request with a valid dévissage and comparison-map identification. Keep n invertible in C⁺; LRZ 6.3.3 prevents the residue-p arbitrary-sheaf strengthening.

9. **Non-quasi-compact support with general coefficients.** Zavyalov 9.4 gives the public unbounded comparison and exhaustion route for Z/n with n invertible in O⁺. Huber §§5.3–5.4 are still needed to prove filtered-colimit and composition assertions for arbitrary coefficient rings Λ and non-quasi-compact partially proper sources. The new comparison does not erase that inherited gap.

10. **Berkovich étale supplier and comparison proofs.** Retain the inherited need for Huber 8.3.1, 8.3.5–8.3.6 and preservation of overconvergence in 8.2.3–8.2.4. Public restatements do not contain those proofs. TropicalAndBerkovichArithmetic:TB.0 owns geometric spaces but does not plan the Berkovich étale support, trace and duality theory used by the inherited interfaces; the Part II ownership proposal must be resolved. The new analytic trace supplies an alternative construction, not the inherited Berkovich comparison or its coherences.

11. **Relative integral trace comparison and surjectivity.** The integral map is already constructed in the accepted packet. The relative inverse-limit identification and preservation of surjectivity need the exact E2 inputs and pro-étale repleteness. The absolute rigid result does not by itself prove relative base-change naturality or the Guo–Reinecke normalization export.

12. **Coherent support transport and unbounded gluing.** The E1 generic proper/étale gluing fragment and tensor/internal-Hom transfer remain supplier proof tasks. H3 must prove base-change coherence of its Berkovich support comparison α_f itself; only the generic derived coherence belongs to E1. Check the all-G open-coefficient equivalence on mapping complexes before using any downstream Yoneda mate identification.

The completion test for the planning pass is coverage of every H3 target by the dependency graph, without duplicate ownership or hidden assumptions. Closing H3 additionally requires every listed proof obligation and supplier extension. The independent review must inspect the exact plus-ring scope of the trace and effacement contracts, the all-G mapping argument and the separation between proper–étale exchange and arbitrary proper base change.

## Source versions and corrections

The following freely accessible editions were consulted on 9 October 2026. Packet hashes pin the files used. The current author versions were additionally checked for the local slips listed below. Huber's 1996 book is not cleared in the reference-library index and was not read through any copy. Its theorem numbers here are locators reported by the public papers; where those papers do not reproduce proofs, the gaps say so. No source text is reproduced.

- **Bogdan Zavyalov, Some foundational results in adic geometry.** [arXiv:2409.15516v2, 17 July 2025](https://arxiv.org/pdf/2409.15516v2). Read: §9, pp. 22–30, including all proofs; §10, Lemma 10.3 and proof, pp. 31–32.
- **Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov, Relative Poincaré duality in nonarchimedean geometry.** [arXiv:2410.08200v1, 10 October 2024](https://arxiv.org/pdf/2410.08200v1). Read: Theorem 1.2.1, pp. 3–4; §2.2, Definition 2.2.8, Warning 2.2.9 and Lemma 2.2.10, pp. 11–12; §§4.1–4.2, pp. 29–33; §§5.1–5.2, pp. 42–48, first reciprocity proof; §5.4, Theorem 5.4.2 and Corollary 5.4.3, p. 53; final reduction in §5.6, p. 66; intermediate §§5.5–5.6 proofs not fully inspected; §6.1, pp. 66–74, complete construction proof; §6.2, Lemmas 6.2.1–6.2.3 and proofs, pp. 74–76; §6.3, Example 6.3.3, pp. 79–80; Appendix A, pp. 122–123; Appendix B.1–B.2, pp. 123–124; Variant 3.1.8 through Proposition 3.2.2 and its proof, pp. 22–23; adjacent displayed definitions read for type checking; Remark 5.1.14 and the statement of Lemma 5.5.21, pp. 45, 60–61; counterexamples only, full §5.5 proof not claimed read.
- **Peter Scholze, Étale cohomology of diamonds.** [arXiv:1709.07343v4, 14 April 2026](https://arxiv.org/pdf/1709.07343v4). Read: Lemma 9.5 and proof, pp. 46–47; Proposition 23.10 and proof, pp. 145–146; Theorem 24.1 and proof, pp. 152–153.

The seven local correction candidates are recorded for independent verification. None changes a theorem hypothesis to make it stronger. The checked arXiv and author PDFs did not provide a correction.

- **ClassicalAdicEtaleCohomology/EH31**, Zavyalov-Foundations-v2, arXiv v2, Lemma 10.3 proof, p. 32. The plus subring of the source field pair is described as contained in the target plus subring. For j:Spa(C,C′⁺)→Spa(C,C⁺), use C⁺⊆C′⁺. A morphism of Huber pairs on the identity field requires the target integral elements to map into the source integral elements. Increasing the plus ring restricts the Spa subset, as required for the pro-open j.
- **ClassicalAdicEtaleCohomology/EH32**, Zavyalov-Foundations-v2, arXiv v2, Lemma 9.1(3), proof Step 3, p. 24. The truncation reduction is described as bounded above, while the next displayed proof is for F∈D⁺. Use bounded below in that reduction sentence to match D⁺ and the following spectral-sequence argument. Finite amplitude permits truncation from below; D⁺ denotes bounded-below complexes. The two descriptions in the printed proof have opposite directions.
- **ClassicalAdicEtaleCohomology/EH33**, Li-Reinecke-Zavyalov-v1, arXiv v1, Appendix B.2, definition of a and Theorem B.2.1, p. 124. The preliminary morphism a has target (Spec K_x⁺)_ét, whereas the composite a∘b⁻¹ is displayed with target (Spec K_x)_ét. For the closed-point field comparison used here, define a with target (Spec K_x)_ét and use the canonical field-valued map; remove the plus on the two preliminary target occurrences. The displayed composite is otherwise ill-typed. The subsequent Kummer identification is with K_x×/(K_x×)ⁿ. Finite extensions ramified for the secondary valuation are étale over the field but not over its valuation ring, so these two topoi cannot silently be identified.
- **ClassicalAdicEtaleCohomology/EH34**, Li-Reinecke-Zavyalov-v1, arXiv v1, Lemma 6.1.10, displayed comparison diagram, p. 72. The lower row starts with g₂,! but labels its étale trace arrow using g₁. Use the g₂ étale counit on the lower row. The g₁ counit has the wrong source for that row; the lemma compares the two distinct coordinate factorizations.
- **ClassicalAdicEtaleCohomology/EH35**, Li-Reinecke-Zavyalov-v1, arXiv v1, Remark 3.1.10, p. 23. The pullback equality for the line-bundle classes [L] is placed in H² with μ_n coefficients. Place [L] and its pullback in H¹(G_m), or apply the Kummer boundary and write c₁(L) and c₁(g*L) in H²(μ_n). Variant 3.1.8 defines [L] as the Picard/G_m-torsor class; only its Kummer boundary has degree two and μ_n coefficients.
- **ClassicalAdicEtaleCohomology/EH36**, Li-Reinecke-Zavyalov-v1, arXiv v1, Construction 3.2.1, p. 23. Before adjunction, the twisted Chern-class map has source Λ_P(−1)[−2] and displayed target Λ_X. The target before applying (f*,Rf_*) adjunction is Λ_P. The Chern-class morphism is in D(P_ét); its source is f*Λ_X(−1)[−2]. Adjunction then gives the displayed map Λ_X(−1)[−2]→Rf_*Λ_P.
- **ClassicalAdicEtaleCohomology/EH37**, Li-Reinecke-Zavyalov-v1, arXiv v1, Lemma 6.1.3 proof, support Čech spectral sequence, p. 68. The abutment is displayed as a direct image f! applied to Λ_Y. The coefficient in that abutment is Λ_X. The functor f! has domain D(X_ét); the next displayed top-degree cokernel already uses Λ_X.

## Baseline and suggested forms

The reviewed H3 audit reports that the cohomological targets are not built. At Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, the six checked statements are LinearMap.lsum, LinearMap.lsum_piSingle, Submodule.liftQ, Submodule.liftQ_mkQ, Submodule.mkQ and Submodule.mkQ_surjective. They supply finite linear assembly and descent, not analytic cohomology. Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 supplies the existing Huber-pair and Spa foundations. A tree-wide scope search did not locate analytic étale proper support, trace or Poincaré duality there.

The [suggested file](../suggested/ClassicalAdicEtaleCohomology--H3.lean) prototypes the finite boundary assembly and quotient-descent forms against those actual linear-algebra types. It inventories every analytic declaration, API item and test by the packet name with its intended mathematical signature and missing supplier carriers. It introduces no proposition-valued stand-ins for geometric hypotheses. The linear prototypes illustrate assembly only; they are not definitions of analytic cohomology. The analytic prototypes become executable signatures when their supplier objects are available.

The file was **not compiled**: no existing shared build at both required pins was found. The available shared checkout has the pinned Mathlib source but a different Tau Ceti commit. No build, project creation or library download was attempted. The packet checker and submission file checks are the validation available for this planning pass; they do not certify Lean elaboration or the mathematical proofs.
