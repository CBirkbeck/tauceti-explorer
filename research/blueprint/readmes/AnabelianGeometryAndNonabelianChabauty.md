# Anabelian geometry and nonabelian Chabauty

This partial continuation retains the reserved étale K(π,1) interface in NC.0 and splits the inherited nonabelian subgroup exactness into continuous lift-form declarations in NC.3. Every declaration is a plan, and no stage is closed.

## Scope, ownership and conventions

The reviewed library audit shows that neither pinned library has nonabelian group cohomology: Mathlib lists it as a TODO in `GroupCohomology/LowDegree.lean`. The only nonabelian H¹ in Mathlib is the Čech one of presheaves of groups on a site. Tau Ceti has explicit continuous cohomology in degrees 0–2 for topological modules (`TauCeti.ContCohomology`). The RP.3 audit row records that NC.3 owns the torsor-valued H¹ and its twists. This component therefore builds nonabelian H¹ for continuous actions of topological groups and compares it with Tau Ceti's abelian version, without duplicating it.

The conventions follow Kim, *The motivic fundamental group of P¹ ∖ {0, 1, ∞} and the theorem of Siegel*, §1:

- The coefficient group U is an arbitrary topological group on which a topological group G acts continuously by automorphisms.
- A 1-cocycle is a continuous map with c(gh) = c(g)·g•c(h). The factor order matters when U is not commutative, and Mathlib's commutative `IsMulCocycle₁` uses the other order.
- U acts on cocycles by (u·c)(g) = u·c(g)·(g•u)⁻¹, and H¹(G, U) is the orbit set, a pointed set.

The algebraic structure Kim puts on H¹ (representability by pro-varieties, from his weight filtrations and inductive-limit topologies) is not part of this component. Neither are local conditions or Selmer varieties. They are listed in the coverage.

The exact sequence for a subgroup A ≤ B that need not be normal, H⁰(G, B/A) → H¹(G, A) → H¹(G, B), is included because Kim uses it for the crystalline condition. It needs no continuous section. The connecting map to H² for a central extension does need one; for unipotent groups an algebraic splitting supplies it.


## NC.0 — the owned étale K(π,1) interface

The owner is the reserved node AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1. The finite-coefficient predicate is meaningful for connected locally noetherian schemes. The raw pro-homotopy comparison has its own geometric-unibranch variety hypotheses. Do not interchange full finite coefficients, p-primary coefficients, constant Fₚ, and maximal-pro-p fundamental groups.

The canonical comparison, its actual source and target, and all degrees are part of the contract. Testing only degrees zero and one falsely accepts the projective line. Conversely nonzero higher étale cohomology does not itself disprove K(π,1): group cohomology may be nonzero too. Only the comparison's being an isomorphism is tested.

### Étale K(π,1) for a specified finite coefficient class

Declaration: TauCeti.EtaleKPiOne.Is. Node: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1.

Let X be a connected locally noetherian scheme with geometric point x. Put π = π₁ᵉᵗ(X,x), the profinite SGA fundamental group. Let C specify an isomorphism-invariant class of finite discrete abelian groups with continuous π-action, transported along pointed fundamental-group isomorphisms. Define Is(X,x;C) to mean that, for every M in C and every integer n ≥ 0, the canonical comparison εⁿ_M : Hⁿ_cont(π,M) → Hⁿ_et(X,L_x(M)) is an isomorphism of abelian groups. L_x(M) is the finite locally constant étale sheaf corresponding to M, not an arbitrary constructible sheaf. The default full property uses all finite continuous π-modules. The p-primary property uses those whose underlying finite group has p-power order, with p prime; the constant-Fₚ comparison is a separately named specialization, not the definition of either full property. None of these coefficient restrictions changes π to its maximal pro-p quotient.

Hypotheses:

- Connected locally noetherian X; an actual geometric point x and profinite finite-étale fibre-functor fundamental group.
- C is invariant under coefficient isomorphisms and transported by fundamental-group isomorphisms. No invertibility assumption on coefficient orders in this definition.

Proof or construction:

1. Import the non-affine finite-étale category, geometric-point fibre functor and profinite π from IG.0, building on the native abstract Galois-category API and affine finite-étale fibres.
2. Import the exact finite continuous π-module / finite locally constant sheaf dictionary and its natural canonical cohomology comparison from SF.2, with the π-action from IG.0. Native continuousCohomology already supplies all cochain degrees; its agreement with derived discrete continuous cohomology for these coefficients is a requested comparison, not a new cohomology definition.
3. Quantify over every allowed coefficient and every nonnegative degree; take isomorphism of the canonical map, not existence of an unrelated group isomorphism. Restriction of C is a logical implication. Geometric/base-point transports are separate lemma nodes.
4. The cohomological predicate makes sense on all connected locally noetherian schemes. Identification with Schmidt–Stix's raw pro-homotopy definition is the separately scoped raw-homotopy-comparison node; no such identification is asserted outside its verified hypotheses.

Required uses:

- PAPER-SCHMIDT-STIX-16/14: State the curve and product K(π,1) contracts and the finite-cover cohomological criterion.
- PAPER-SCHMIDT-STIX-16/31: Compare the full property with the classifying morphism and higher raw étale homotopy, with the profiniteness hypotheses visible.
- PAPER-SCHMIDT-STIX-16/68: Certify characteristic-zero Artin neighbourhoods, without reconstructing moduli schemes.
- PAPER-FARB-KISIN-WOLFSON-24/005; §2.3.1: Supply the actual constant-Fₚ comparison in every degree, while retaining the larger coefficient class.
- PAPER-FARB-KISIN-WOLFSON-24/091 and /146; Lemma 3.2.2: Provide the full K(π,1) interface consumed by torus torsors over abelian varieties; the special pro-p inflation is an additional theorem, not built into the definition.

API:

- TauCeti.EtaleKPiOne.Is.edgeIso (projection): From Is(X,x;C), for M in C and n ≥ 0, obtain the inverse of the canonical εⁿ_M with both inverse identities; it is natural in equivariant coefficient homomorphisms.
- TauCeti.EtaleKPiOne.Is.iff_all_comparisons (characterisation): Is(X,x;C) holds exactly when εⁿ_M is an isomorphism for every M in C and every n ≥ 0; checking only n ≤ 1 is not sufficient.
- TauCeti.EtaleKPiOne.Is.of_subclass (functoriality): If C′ ⊆ C, then Is(X,x;C) implies Is(X,x;C′); in particular full finite coefficients imply p-primary coefficients and constant-Fₚ comparison.
- TauCeti.EtaleKPiOne.Is.pointedIso_iff (functoriality): For a pointed scheme isomorphism f:(X,x) ≅ (Y,y), Is(X,x;f*D) iff Is(Y,y;D), using transported coefficients and the natural comparison square.
- TauCeti.EtaleKPiOne.Is.basePoint_iff (compatibility): For geometric points x,y and an étale path between their finite-étale fibre functors, Is(X,x;C) iff Is(X,y;transport C); full and p-primary classes are invariant under every such transport.
- TauCeti.EtaleKPiOne.Is.zero_coefficients (simp): For the class containing only the zero π-module, every comparison is 0 → 0 and Is(X,x;C) holds; this case is not evidence for the full property.
- TauCeti.EtaleKPiOne.Is.constantFp_edgeIso (compatibility): For p prime, the full or p-primary property supplies Hⁿ_cont(π,Fₚ) ≅ Hⁿ_et(X,Fₚ) via ε in every degree, with trivial π-action; the group in the source is still π.

Discriminating tests:

- TauCeti.EtaleKPiOne.tests.field (degenerate): For every field K and separable geometric point, Is(Spec K,x;all finite coefficients) holds and π identifies with Gal(K_sep/K), with ε equal to the Galois-cohomology comparison.
- TauCeti.EtaleKPiOne.tests.projective_line_degree_two (non-example): For algebraically closed k and prime ℓ invertible in k, π₁ᵉᵗ(P¹_k)=1 and H²_et(P¹_k,Z/ℓ) ≅ Z/ℓ is nonzero, while H²_cont(1,Z/ℓ)=0; hence the full property and the ℓ-primary property both fail although degrees zero and one agree.
- TauCeti.EtaleKPiOne.tests.affine_curve (characterisation): For a geometrically connected smooth affine curve over a characteristic-zero field, including Gₘ and P¹ minus {0,1,∞}, the full finite-coefficient property holds; no claim that every open immersion preserves it is involved.
- TauCeti.EtaleKPiOne.tests.positive_genus (characterisation): For a geometrically connected smooth proper curve of genus at least one over a characteristic-zero field, the full property holds. Nonzero H²_et of an elliptic curve does not contradict it: its profinite fundamental group need not have vanishing H².
- TauCeti.EtaleKPiOne.tests.product_char_zero (compatibility): For two geometrically connected geometrically unibranch characteristic-zero varieties with the full property, their product has it; over a non-algebraically-closed field the arithmetic π₁ of the product is the fibre product over Gal(k_sep/k), not the ordinary product.
- TauCeti.EtaleKPiOne.tests.artin_tower (characterisation): A finite characteristic-zero tower of smooth elementary curve fibrations ending in Spec k has the full property; this includes M₀,n for n ≥ 4 after importing its moduli construction and forgetting-mark fibrations.
- TauCeti.EtaleKPiOne.tests.pro_p_not_coefficient_restriction (non-example): The finite group C₂ acts on F₃ by negation. This is a 3-primary continuous coefficient with invariants 0. Its action does not descend to the trivial maximal pro-3 quotient of C₂; putting F₃ with trivial action on that quotient gives invariants F₃ instead. A p-primary coefficient restriction is not a licence to replace π by π^(p).
- TauCeti.EtaleKPiOne.tests.zero_class (degenerate): The zero-coefficient class passes on P¹, whereas the full and invertible-prime primary classes fail there. The class argument must not be erased.

Acceptance:

- Spec K passes for any field K; P¹ over an algebraically closed field fails full finite coefficients in degree two.
- Farb–Kisin–Wolfson §2.3.1 only consumes the constant-Fₚ edge comparison. Their Lemma 3.2.2 proves an additional pro-p comparison for its particular torus-torsor fundamental groups; it is not a general consequence of the coefficient restriction.

Prerequisites: mathlib:AlgebraicGeometry.Scheme, mathlib:AlgebraicGeometry.IsLocallyNoetherian, mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology, mathlib:continuousCohomology, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2, mathlib:CategoryTheory.PreGaloisCategory.IsFundamentalGroup, mathlib:CommAlgCat.FiniteEtale, mathlib:CommAlgCat.FiniteEtale.fiber.

Sources:

- schmidt-stix-2016, §2.3, pp. 826–827; cohomological criterion in Lemma 2.7(b). Full finite coefficients are related to the raw homotopy definition under the separate comparison hypotheses.
- farb-kisin-wolfson-2024-v2, §2.3.1, p. 16; Lemma 3.2.2, p. 24. The constant-Fₚ edge map and the specially justified maximal-pro-p inflation are different inputs.

### Restriction of the allowed finite coefficients

Declaration: TauCeti.EtaleKPiOne.Is.of_subclass. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/coefficient-restriction.

If C′ ⊆ C, then Is(X,x;C) implies Is(X,x;C′); in particular full finite coefficients imply p-primary coefficients and constant-Fₚ comparison.

Hypotheses:

- The key definition applies; C′ ⊆ C on the same profinite π-module category.

Proof or construction:

1. For M in C′ use the inclusion to view M in C, then apply the same canonical εⁿ_M in each degree. No cohomological theorem or quotient of π is used.

Acceptance:

- Apply to all finite modules → p-primary modules → the trivial-action Fₚ module; do not assert either reverse implication.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1.

Sources:

- farb-kisin-wolfson-2024-v2, §2.3.1, p. 16. The constant-Fₚ comparison is obtained by specializing the full coefficient comparison.

### Invariance under pointed scheme isomorphism

Declaration: TauCeti.EtaleKPiOne.Is.pointedIso_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/pointed-isomorphism.

For a pointed scheme isomorphism f:(X,x) ≅ (Y,y), Is(X,x;f*D) iff Is(Y,y;D), using transported coefficients and the natural comparison square.

Hypotheses:

- A pointed scheme isomorphism; coefficient class transported along the induced π-isomorphism.

Proof or construction:

1. Use IG.0's fibre-functor transport and SF.2's naturality to form the comparison square with vertical cohomology isomorphisms.
2. Conjugate ε across this square. Its being an isomorphism is equivalent on the two schemes, for each coefficient and degree; reverse f for the converse.

Acceptance:

- The identity transport gives the same canonical comparison; composition of two pointed isomorphisms agrees with their composite.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2.

Sources:

- schmidt-stix-2016, §2.3, p. 826; Appendix A.3. The K(π,1) condition is an isomorphism-invariant property; this node uses the cohomological interface.

### Change of geometric base point

Declaration: TauCeti.EtaleKPiOne.Is.basePoint_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/basepoint-transport.

For geometric points x,y and an étale path between their finite-étale fibre functors, Is(X,x;C) iff Is(X,y;transport C); full and p-primary classes are invariant under every such transport.

Hypotheses:

- An étale path, meaning an isomorphism between the two actual finite-étale fibre functors; transport of C along its profinite π-isomorphism.

Proof or construction:

1. Import IG.0's path-induced conjugacy transport of π-actions and SF.2's compatible locally constant sheaf identifications.
2. The induced cohomology isomorphisms commute with ε. Thus one canonical comparison is an isomorphism iff the other is.
3. A different path differs by an inner π-isomorphism. The transported finite module and sheaf are naturally isomorphic, so the all-finite and p-primary assertions do not depend on that path. This does not construct rational-point sections or tangential specializations.

Acceptance:

- Full and p-primary coefficient classes are unchanged by conjugacy; an arbitrary non-invariant class must be transported, not silently identified.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2.

Sources:

- schmidt-stix-2016, §2.3, p. 826, sentence following the definition. The raw version has a separately stated geometric-unibranch base-point assertion; this node is the finite-fibre-functor cohomological transport.

### Finite-cover effacement criterion

Declaration: TauCeti.EtaleKPiOne.iff_finiteCover_effacement. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement.

For a connected geometrically unibranch variety X over a field, the full finite-coefficient property holds iff, for every connected finite étale cover X′ → X, every finite abelian group A regarded as a constant sheaf on X′, every i ≥ 2 and every α ∈ Hⁱ_et(X′,A), there is a further finite étale surjective cover X″ → X′ on which α restricts to zero.

Hypotheses:

- X is a connected geometrically unibranch variety; finite covers are surjective. Coefficients are all finite abelian groups, with no prime discarded.

Proof or construction:

1. Import SF.2's Cartan–Leray comparison for the filtered system of pointed finite étale covers, its low-degree edge identification, filtered-cohomology compatibility and Shapiro/induction comparison with IG.0's finite-cover classification.
2. Every finite continuous module is trivialized after a finite cover. Conversely a constant finite coefficient on any finite cover induces a finite π-module; Shapiro transfers its comparison back to X. These two directions explain why testing only constant coefficients on X is insufficient.
3. The filtered universal-cover cohomology in degrees ≥ 2 vanishes exactly when each class becomes zero at some further finite cover. The requested comparison converts this effacement into the all-degree edge isomorphism. Artin–Mazur Theorem 4.3, cited by Schmidt–Stix, is a source leaf still requiring its full proof audit.
4. Only finite étale covers occur. Arbitrary small-site étale covers would give ordinary local sheaf-cohomology effacement and would not characterize K(π,1).

Acceptance:

- The cover X′ is part of the quantifier; replacing finite covers by arbitrary étale coverings or allowing only X′=X is not this criterion.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2.

Sources:

- schmidt-stix-2016, Lemma 2.7(b), proof, p. 827; finite-cover convention p. 821. The exact finite-cover quantifiers and higher cohomology condition are read; the external Artin–Mazur input is explicitly open.

### Comparison with raw étale K(π,1)

Declaration: TauCeti.EtaleKPiOne.iff_raw_etale_aspherical. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison.

For a connected geometrically unibranch variety X with geometric point x, the full finite-coefficient property agrees with the raw étale K(π,1) condition π⁽raw⁾ₙ(X_et,x_et)=0 for every n ≥ 2, equivalently the canonical classifying morphism X_et → Bπ₁(X_et,x_et) is an isomorphism in Ho(pro-ss_*). Here π₁(X_et,x_et) is profinite in this scope and identified with the SGA finite-étale π used by the cohomological definition. This equivalence is not asserted for an arbitrary non-geometrically-unibranch locally noetherian scheme.

Hypotheses:

- Connected geometrically unibranch variety, not an arbitrary locally noetherian scheme.
- Full finite coefficients; a p-primary coefficient comparison alone is not an assertion about all raw higher homotopy groups.

Proof or construction:

1. Use the finite-cover-effacement node and the cohomological weak-equivalence criterion of Artin–Mazur Theorem 4.3, as invoked for this precise scope by Schmidt–Stix §2.3.
2. Import, rather than rebuild in NC.0, the raw étale pro-space and homotopy groups, their profinite-π identification in the stated scope, and the classifying morphism. These types/theorems are a recorded generic étale-homotopy foundation gap.
3. Schmidt–Stix Proposition A.16 constructs the map corresponding to id_π₁ through the nerve of the fundamental groupoid. Corollary A.18 then tests isomorphism on all homotopy groups: the π₁ map is the identity and Bπ₁ has no higher groups. The model-category and cohomological-detection proof leaves remain explicit, not routine automation.

Acceptance:

- The canonical map is essential, not an arbitrary equivalence. Outside the geometric-unibranch scope raw π₁ may be a non-profinite pro-group, even though its profinite completion is the SGA π₁.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement, InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Sources:

- schmidt-stix-2016, §2.3, pp. 826–827; Proposition A.16, Definition A.17 and Corollary A.18, pp. 864–866. Relates the full coefficient interface to the paper's actual raw definition, without identifying all pro-groups with their profinite completions.

### Fields are étale K(π,1)

Declaration: TauCeti.EtaleKPiOne.field. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/field.

For every field K, with a separable geometric point x of Spec K, Is(Spec K,x;all finite coefficients) holds. Under π ≅ Gal(K_sep/K), its comparison εⁿ_M is the canonical Galois-cohomology isomorphism in every degree and for every finite discrete continuous Galois module M.

Hypotheses:

- K is a field; choose a separable closure inside the geometric-point field.

Proof or construction:

1. IG.0 identifies finite étale K-schemes and their fibre functor with finite continuous Galois sets.
2. SF.2 imports Stacks 03QQ: abelian étale sheaves on Spec K correspond to discrete continuous Galois modules, global sections correspond to invariants, and their derived functors identify in every degree.
3. Restrict that actual derived-functor comparison to finite modules. Its direction agrees with ε, so the quantified definition holds; invoke coefficient-restriction for every subclass.

Acceptance:

- For separably closed K, π=1 and all positive cohomology vanishes. For general K, higher Galois cohomology need not vanish: K(π,1) does not mean Hⁿ_et=0.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/coefficient-restriction, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2.

Sources:

- stacks-etale-tests, 03QQ. The complete selected section gives the sheaf/module equivalence and canonical derived global-sections comparison.

### The degree-two obstruction on the projective line

Declaration: TauCeti.EtaleKPiOne.not_projectiveLine. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/projective-line-obstruction.

For algebraically closed k and prime ℓ invertible in k, P¹_k does not have the full finite-coefficient property, and does not have the ℓ-primary property. For M=Z/ℓ with trivial action, ε²_M has source zero and target isomorphic to Z/ℓ; it is not an isomorphism.

Hypotheses:

- Algebraically closed k; prime ℓ distinct from char k, so ℓ ≥ 2 and its constant coefficient is nonzero.

Proof or construction:

1. Import the geometric finite-étale fundamental-group computation π₁(P¹_k)=1 from IG.0.
2. Import SF.2's canonical smooth projective curve computation H²_et(P¹_k,μ_ℓ) ≅ Z/ℓ (Stacks 03RQ); a choice of primitive ℓth root gives the corresponding noncanonical identification for the constant Z/ℓ sheaf.
3. The continuous cohomology of the trivial group in degree two is zero by the requested native/derived comparison and trivial-group calculation. The target is nonzero, so ε² cannot be an isomorphism; its coefficient belongs to both classes.

Acceptance:

- Degrees zero and one agree in this example. A definition checking only these degrees would falsely accept P¹. Do not use μ_p ≅ constant Z/p in characteristic p.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2.

Sources:

- stacks-etale-tests, 03RQ. The selected statement and proof give the higher cohomology of a smooth projective curve with invertible torsion coefficients.

### Smooth curves of affine or positive-genus type

Declaration: TauCeti.EtaleKPiOne.smooth_curve_charZero. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve.

For a geometrically connected smooth curve C over a characteristic-zero field k, if C is affine or its smooth proper model has genus at least one, then Is(C,x;all finite coefficients) holds for every geometric point x.

Hypotheses:

- Smooth geometrically connected curve over a characteristic-zero field; affineness or positive genus of its smooth proper model.
- The genus-zero proper curve is excluded.

Proof or construction:

1. Schmidt–Stix Lemma 2.7(a) states the stronger any-field raw K(π,1) theorem and delegates its proof to Schmidt 1996 Proposition 15. The restricted characteristic-zero statement here uses that theorem; its proof leaf has not been freshly acquired and is a precise open gap.
2. Use SF.3 for smooth curve/compactification/genus data, not a second curve construction. Smoothness gives the geometric-unibranch scope required by raw-homotopy-comparison.
3. Apply the raw theorem and raw-homotopy-comparison; transport among geometric points using basepoint-transport. A proof audit must expose the referenced curve homotopy/comparison inputs before this node is closed.

Acceptance:

- Gₘ and P¹ minus {0,1,∞} pass. A smooth proper genus-one curve passes; P¹ fails by the separate degree-two obstruction.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison, AnabelianGeometryAndNonabelianChabauty:NC.0/basepoint-transport, SchemeAndStackFoundations:SF.3.

Sources:

- schmidt-stix-2016, Lemma 2.7(a), p. 827, citing Schmidt 1996 Proposition 15. The source asserts all fields; this checkpoint retains the requested characteristic-zero test scope and openly records the delegated proof leaf.

### Characteristic-zero products of étale K(π,1) varieties

Declaration: TauCeti.EtaleKPiOne.product_charZero. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/products.

Over a characteristic-zero field k, a finite product of geometrically connected geometrically unibranch k-varieties having the full finite-coefficient property again has that property.

Hypotheses:

- Each factor is a geometrically connected geometrically unibranch variety; k has characteristic zero; full finite coefficients.

Proof or construction:

1. IG.1 and SF.2 supply the geometric-base-change equivalence of the finite-cover criterion, so reduce to algebraically closed k as in Schmidt–Stix Lemma 2.7(b). This is an explicitly requested theorem, not arbitrary base-change invariance.
2. IG.0 supplies the characteristic-zero product theorem for geometric π₁. It makes product covers cofinal among finite covers: an open subgroup of the profinite product contains a product of open subgroups.
3. SF.2 supplies natural derived finite-torsion étale Künneth, with its Tor contributions, and its filtered finite-cover cohomology compatibility. These identify the vanishing of positive universal-cover cohomology for the product from that of the factors; no unsupported tensor-only formula is used.
4. Apply finite-cover-effacement, then descend via the same requested geometric-base-change equivalence. Iterate for finitely many factors, with Spec k as the empty product.

Acceptance:

- Over nonclosed k the arithmetic product π₁ is a fibre product over G_k, not a direct product. No positive-characteristic product theorem is asserted.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/field, InverseGaloisAndArithmeticFundamentalGroups:IG.0, InverseGaloisAndArithmeticFundamentalGroups:IG.1, SchemeAndStackFoundations:SF.2.

Sources:

- schmidt-stix-2016, Lemma 2.7(b) and proof, p. 827. The proof explicitly uses SGA 1 XIII Proposition 4.6 and étale Künneth; their full proof audits remain requested.

### Elementary curve fibrations preserve étale K(π,1)

Declaration: TauCeti.EtaleKPiOne.elementary_fibration_charZero. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/elementary-fibration.

Let f:X→Y be an elementary fibration of smooth connected varieties over a characteristic-zero field: X is the complement of a divisor D, finite étale over Y, in a smooth proper geometrically connected curve family X̄→Y, and each fibre of X→Y is a nonempty affine curve. If Y has the full finite-coefficient property, then X has it.

Hypotheses:

- Smooth connected varieties and the specified elementary curve fibration; characteristic zero; full finite coefficients on Y.

Proof or construction:

1. Use raw-homotopy-comparison to turn the hypothesis on Y into vanishing of its higher raw étale homotopy. The geometric fibre is a smooth affine curve, hence has the raw property by smooth-curve.
2. Pull f back over the filtered pointed finite étale covers of Y. The missing generic homotopy foundation must supply Friedlander Theorem 11.5's long homotopy exact sequence here, and Schmidt–Stix Lemma 2.1's invariance of higher groups under finite covers.
3. That sequence, together with π₁ of the universal finite-cover system of Y being trivial, identifies the higher homotopy exact sequence for X_y → X → Y. In each degree n ≥ 2 the fibre and base terms vanish, hence so does πₙ(X).
4. Convert back with raw-homotopy-comparison. The higher homotopy sequence is explicitly a gap; the arithmetic π₁ exact sequence of IG.1 alone cannot replace it.

Acceptance:

- An iterated tower must retain the smooth/proper compactification and finite étale boundary data; a general smooth morphism is not covered.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison, AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve.

Sources:

- schmidt-stix-2016, Proposition 2.8 and proof, pp. 827–828; Lemma 2.1, pp. 821–822. The full selected proof uses a generic homotopy fibration theorem, not just arithmetic π₁ exactness.

### Artin towers give étale K(π,1) examples

Declaration: TauCeti.EtaleKPiOne.artin_tower_charZero. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/artin-neighbourhood.

For a finite tower X=X_r→⋯→X₀=Spec k of smooth connected characteristic-zero varieties with each arrow an elementary curve fibration as specified in elementary-fibration, X has the full finite-coefficient property. In particular this applies to strongly hyperbolic Artin neighbourhoods of Schmidt–Stix Definition 6.1, whose additional product-embedding condition must not be omitted when naming that stronger notion.

Hypotheses:

- Characteristic-zero field; finite tower with actual elementary-fibration data at every arrow.

Proof or construction:

1. The initial field is K(π,1) by the field node.
2. Induct on the length, applying elementary-fibration at each arrow. The stronger hyperbolicity and product embeddings are not required for this induction but are required to call the object strongly hyperbolic.
3. For M₀,n with n ≥ 4, import the moduli scheme and its forgetting-mark elementary fibrations from the reserved StableReductionPartII moduli-curves owner. That supplier is not yet a typed input, so the instance remains an acceptance obligation rather than a fabricated local moduli construction.

Acceptance:

- M₀,4=P¹ minus {0,1,∞}; the n-to-n−1 forgetting-mark tower gives the higher-n example once its supplier is available. This does not prove the anabelian reconstruction theorem of Schmidt–Stix §6.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.0/field, AnabelianGeometryAndNonabelianChabauty:NC.0/elementary-fibration.

Sources:

- schmidt-stix-2016, Definition 6.1 and following M₀,n example, p. 845. Separates the elementary-fibration K(π,1) induction from the additional product-embedding hypothesis of strongly hyperbolic Artin neighbourhoods.

### Why the proof leaves stay visible

The finite-cover criterion is not ordinary étale-local effacement. Schmidt–Stix explicitly uses finite covers, permits a finite cover X′ before choosing the class, and requires a further finite surjective cover. Finite module actions can be killed by finite covers; induced modules and Shapiro are needed for the converse. All of these are exact SF.2/IG.0 inputs, not hidden routine steps.

The product proof uses the derived torsion Künneth comparison, including Tor contributions; a tensor-only formula for arbitrary finite coefficients is not asserted. Its arithmetic fundamental group over a nonclosed field is a fibre product over G_k. The elementary-fibration proof needs a higher étale homotopy exact sequence on universal-cover pullbacks. IG.1's arithmetic π₁ sequence does not supply that result.

The selected Schmidt–Stix proofs explicitly delegate important leaves. Schmidt 1996 Proposition 15, Artin–Mazur 4.3/11.1, Friedlander 11.5 and the SGA inputs were not separately read here, so their exact statements and roles are requests/gaps. No new node is advertised as closed.

## The nonabelian cohomology component

### Continuous 1-cocycles and invariants with nonabelian coefficients

Declaration: TauCeti.NonabelianCohomology.Z1. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles.

Let G be a topological group and U a topological group on which G acts by group automorphisms, continuously (G × U → U continuous). The invariants are H⁰(G, U) := U^G = {u ∈ U : g•u = u for all g}, a subgroup of U (Mathlib FixedPoints.subgroup). The continuous 1-cocycles are Z¹(G, U) := {c : G → U continuous : c(gh) = c(g)·(g•c(h)) for all g, h ∈ G}, with the trivial cocycle 1 (the constant map to the identity) as base point.

Hypotheses: G is a topological group and U a topological group with an action of G by group automorphisms (MulDistribMulAction G U) such that the action map G × U → U is continuous (ContinuousSMul G U). No commutativity of U; for U commutative written additively the definitions agree with Tau Ceti's explicit continuous cohomology (NC.3/abelian-comparison).

Proof or construction:

1. Definition as stated; H⁰ is FixedPoints.subgroup for the MulDistribMulAction.
2. Elementary identities: c(1) = 1 (put g = h = 1), c(g⁻¹) = g⁻¹•(c(g)⁻¹) (put h = g⁻¹), and the coboundaries g ↦ u·(g•u)⁻¹ are cocycles: u·(gh•u)⁻¹ = u(g•u)⁻¹·g•(u(h•u)⁻¹) because g acts by automorphisms. The coboundary of u is continuous since g ↦ g•u is continuous.
3. Trivial action: then the cocycle condition says c is a homomorphism, so Z¹(G, U) is the set of continuous homomorphisms G → U (ContinuousMonoidHom).

The required uses are:

- AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1: H¹ is the orbit set of Z¹ under twisted conjugation.
- AnabelianGeometryAndNonabelianChabauty:NC.3/torsor-classification: A point of a torsor gives a cocycle.
- AnabelianGeometryAndNonabelianChabauty:NC.4: The global and local Selmer maps take a rational point to the class of the cocycle of its path torsor.

The API supplies:

- TauCeti.NonabelianCohomology.H0: H⁰(G, U) = FixedPoints.subgroup G U, the subgroup of G-invariant elements.
- TauCeti.NonabelianCohomology.Z1: The type of continuous maps c : G → U with c(gh) = c(g)·g•c(h).
- TauCeti.NonabelianCohomology.Z1.mem_iff: c ∈ Z¹ iff c is continuous and satisfies the cocycle identity.
- TauCeti.NonabelianCohomology.Z1.one: The trivial cocycle g ↦ 1, the base point.
- TauCeti.NonabelianCohomology.Z1.map_one: c(1) = 1 for every cocycle.
- TauCeti.NonabelianCohomology.Z1.map_inv: c(g⁻¹) = g⁻¹•(c(g)⁻¹).
- TauCeti.NonabelianCohomology.Z1.coboundary: For u ∈ U, the cocycle g ↦ u·(g•u)⁻¹.
- TauCeti.NonabelianCohomology.Z1.equivContinuousMonoidHomOfTrivial: If G acts trivially, Z¹(G, U) ≃ (G →ₜ* U), continuous homomorphisms.
- TauCeti.NonabelianCohomology.Z1.ext: Two cocycles are equal iff they agree at every g.

Discriminating tests:

- TauCeti.NonabelianCohomology.tests.trivial_group (degenerate): If G is the trivial group, Z¹(G, U) = {1}.
- TauCeti.NonabelianCohomology.tests.trivial_action_hom (computation): For G = ℤ/2 (discrete) acting trivially on the symmetric group S₃ (discrete), Z¹(G, S₃) has exactly 4 elements: the trivial map and the three maps sending the generator to a transposition.
- TauCeti.NonabelianCohomology.tests.factor_order (non-example): For G = U = S₃ with the trivial action, the identity map satisfies c(gh) = c(g)·(g•c(h)) but not c(gh) = (g•c(h))·c(g) (it is a homomorphism, not an anti-homomorphism): the factor order of the cocycle condition matters for nonabelian U.
- TauCeti.NonabelianCohomology.tests.invariants (computation): For G = ℤ/2 acting on U = ℤ by negation, H⁰(G, U) = {0}; for the trivial action H⁰ = U.
- TauCeti.NonabelianCohomology.tests.continuity (non-example): For G = ∏_{n ∈ ℕ} ℤ/2 (profinite) acting trivially on U = ℤ/2 (discrete), Z¹(G, U) is countable (continuous characters factor through finitely many coordinates), whereas the abstract homomorphisms G → ℤ/2 are uncountable: dropping continuity changes Z¹.

Acceptance cases:

- The order of the factors matters when U is not commutative: the condition c(gh) = (g•c(h))·c(g) of Mathlib's commutative IsMulCocycle₁ defines a different set for nonabelian U (test below).
- Continuity is part of the definition; for a profinite G and discrete U every cocycle factors through a finite quotient of G.

Prerequisites: mathlib:MulDistribMulAction, mathlib:FixedPoints.subgroup, mathlib:ContinuousSMul, mathlib:IsTopologicalGroup, mathlib:ContinuousMap, mathlib:ContinuousMonoidHom, mathlib:groupCohomology.IsMulCocycle₁.

Sources:

- Kim 2005, §1, p. 6. The continuous 1-cocycle condition with nonabelian coefficients, in the factor order used here.
- Kim 2005, §1, p. 6. The base point.
- Poonen, §1.3.5, Definition 1.3.14, p. 11. Nonabelian cohomology exists in degrees 0 and 1 only.

### Nonabelian first cohomology as a pointed set

Declaration: TauCeti.NonabelianCohomology.H1. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1.

In the situation of NC.3/continuous-cocycles, U acts on Z¹(G, U) by (u·c)(g) := u·c(g)·(g•u)⁻¹. The first cohomology H¹(G, U) is the orbit set of this action (Mathlib MulAction.orbitRel.Quotient U (Z¹ G U)), pointed by the class of the trivial cocycle; two cocycles in one orbit are called cohomologous. The class of c is trivial iff c is a coboundary g ↦ u·(g•u)⁻¹.

Hypotheses: G is a topological group and U a topological group with an action of G by group automorphisms (MulDistribMulAction G U) such that the action map G × U → U is continuous (ContinuousSMul G U).

Proof or construction:

1. The formula defines a group action: (u·(v·c))(g) = u v c(g) (g•v)⁻¹ (g•u)⁻¹ = (uv) c(g) (g•(uv))⁻¹, since g acts by automorphisms; 1·c = c.
2. u·c is again a cocycle: (u·c)(gh) = u c(g) g•c(h) (gh•u)⁻¹, and (u·c)(g)·g•((u·c)(h)) = u c(g) (g•u)⁻¹ g•u g•c(h) g•(h•u)⁻¹, which agree. Continuity: u·c is a product of continuous maps (g ↦ g•u is continuous).
3. The orbit of the trivial cocycle is the set of coboundaries g ↦ u·(g•u)⁻¹, by definition of the action.
4. H¹ is a pointed set, not a group: there is no natural composition law when U is not commutative.

The required uses are:

- AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence: The exact sequences are sequences of these pointed sets.
- AnabelianGeometryAndNonabelianChabauty:NC.3/central-extension: The abelian group H¹(G, Z) acts on H¹(G, B) for central Z.
- AnabelianGeometryAndNonabelianChabauty:NC.3/torsor-classification: Torsors are classified by H¹.
- AnabelianGeometryAndNonabelianChabauty:NC.4: Selmer varieties are subsets of H¹(G_T, U_n) cut out by local conditions.

The API supplies:

- TauCeti.NonabelianCohomology.Z1.instMulAction: The action (u·c)(g) = u·c(g)·(g•u)⁻¹ of U on Z¹(G, U).
- TauCeti.NonabelianCohomology.H1: H¹(G, U) = MulAction.orbitRel.Quotient U (Z¹ G U).
- TauCeti.NonabelianCohomology.H1.mk: The class map Z¹(G, U) → H¹(G, U).
- TauCeti.NonabelianCohomology.H1.mk_surjective: Every class has a representing cocycle.
- TauCeti.NonabelianCohomology.H1.mk_eq_mk_iff: mk c = mk c′ iff c′ = u·c for some u ∈ U.
- TauCeti.NonabelianCohomology.H1.instOne: The base point, the class of the trivial cocycle.
- TauCeti.NonabelianCohomology.H1.mk_eq_one_iff: mk c = 1 iff there is u ∈ U with c(g) = u·(g•u)⁻¹ for all g.
- TauCeti.NonabelianCohomology.H1.equivOfTrivial: For trivial action, H¹(G, U) ≃ (G →ₜ* U) modulo conjugation by U.

Discriminating tests:

- TauCeti.NonabelianCohomology.tests.h1_trivial_group (degenerate): If G is the trivial group, H¹(G, U) is a single point.
- TauCeti.NonabelianCohomology.tests.h1_S3 (computation): For G = ℤ/2 acting trivially on S₃ (both discrete), H¹(G, S₃) has exactly 2 elements: the base point and the class of the transpositions.
- TauCeti.NonabelianCohomology.tests.not_coboundary_quotient (non-example): In the same example, identifying cocycles c, c′ when c′(g) = c(g)·u(g•u)⁻¹ for some u gives 4 classes (the action is trivial, so every such b is trivial), not 2: the correct relation is twisted conjugation.
- TauCeti.NonabelianCohomology.tests.h1_abelian (compatibility): For G = ℤ/2 acting on U = ℤ/3 (additive, discrete) by negation, H¹ is a single point, agreeing with Tau Ceti's ContCohomology.H1 (the orders are coprime).

Acceptance cases:

- For trivial action, H¹(G, U) is the set of continuous homomorphisms G → U modulo conjugation by U.
- Cohomologous means related by the action; for nonabelian U this is not 'c′ = c·b for a coboundary b' (test below).

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, mathlib:MulAction.orbitRel, mathlib:MulAction.orbitRel.Quotient.

Sources:

- Kim 2005, §1, p. 6. The twisted-conjugation action and H¹ as its orbit set.
- Kim 2009, Introduction, p. 4. The role of the nonabelian H¹ in Chabauty–Kim.

### Functoriality of nonabelian H⁰ and H¹

Declaration: TauCeti.NonabelianCohomology.H1.map. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/functoriality.

(a) A continuous G-equivariant group homomorphism f : U → U′ induces a homomorphism H⁰(G, U) → H⁰(G, U′) and maps Z¹(G, U) → Z¹(G, U′), c ↦ f ∘ c, and H¹(G, U) → H¹(G, U′), preserving base points, compatible with identities and composition, and with f(u·c) = f(u)·(f ∘ c). (b) A continuous group homomorphism φ : G′ → G, with G′ acting on U through φ, induces the restriction maps H⁰(G, U) → H⁰(G′, U) (inclusion) and Z¹(G, U) → Z¹(G′, U), c ↦ c ∘ φ, and H¹(G, U) → H¹(G′, U), base point preserving and functorial; in particular for a closed subgroup H ≤ G there is restriction H¹(G, U) → H¹(H, U). Maps of pointed sets that are compatible in this way are what the exact sequences (NC.3/exact-sequence) are built from.

Hypotheses: G is a topological group and U a topological group with an action of G by group automorphisms (MulDistribMulAction G U) such that the action map G × U → U is continuous (ContinuousSMul G U). In (a) U′ satisfies the same hypotheses and f is continuous with f(g•u) = g•f(u); in (b) φ is continuous and G′ acts on U by g′•u = φ(g′)•u.

Proof or construction:

1. (a) f ∘ c is continuous and f(c(gh)) = f(c(g))·f(g•c(h)) = f(c(g))·g•f(c(h)); f(u·c) = f(u)·(f∘c) because f(u c(g) (g•u)⁻¹) = f(u) f(c(g)) (g•f(u))⁻¹. So the map descends to orbits and sends the trivial cocycle to the trivial cocycle.
2. (b) c ∘ φ is continuous and (c∘φ)(g′h′) = c(φg′)·φ(g′)•c(φh′); the U-actions correspond, so the map descends.
3. Identities and composition hold on cocycles, hence on classes.

The API supplies:

- TauCeti.NonabelianCohomology.H1.map: The map H¹(G, U) → H¹(G, U′) induced by a continuous equivariant homomorphism.
- TauCeti.NonabelianCohomology.H1.map_one: H1.map f sends the base point to the base point.
- TauCeti.NonabelianCohomology.H1.map_id: H1.map id = id.
- TauCeti.NonabelianCohomology.H1.map_comp: H1.map (f′ ∘ f) = H1.map f′ ∘ H1.map f.
- TauCeti.NonabelianCohomology.H1.res: The restriction H¹(G, U) → H¹(G′, U) along a continuous homomorphism G′ → G.
- TauCeti.NonabelianCohomology.H1.res_comp: Restriction along a composite is the composite of restrictions.
- TauCeti.NonabelianCohomology.H0.map: The homomorphism of invariants induced by an equivariant homomorphism.

Acceptance cases:

- Restriction to the decomposition group at a place v, H¹(G_T, U) → H¹(G_v, U), is the case (b) of the inclusion G_v → G_T used for Selmer conditions.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, mathlib:ContinuousMonoidHom.

Sources:

- Kim 2009, §3, p. 25. Restriction maps and their functoriality, as used for local conditions.
- Kim 2005, §1, p. 7. Functoriality in the coefficients.

### Comparison with abelian continuous cohomology

Declaration: TauCeti.NonabelianCohomology.H1.equivContCohomology. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/abelian-comparison.

Let M be a commutative topological group written additively, with a continuous action of G by additive automorphisms, and U = Multiplicative M. With the induced action on U (Mathlib has no instance for it, so one is supplied), Z¹(G, U) is Tau Ceti's group of explicit continuous 1-cocycles ContCohomology.Z1 G M (cocycles c(gh) = c(g) + g•c(h), in Mathlib's IsCocycle₁ convention), the action of U on Z¹ is translation by the coboundaries d⁰(m)(g) = g•m − m up to sign, and the class map induces a bijection of pointed sets H¹(G, U) ≅ ContCohomology.H1 G M, sending the base point to 0. Consequently H¹(G, U) inherits a commutative group structure, H⁰(G, U) = ContCohomology.H0 G M, and for discrete G the cocycles are Mathlib's groupCohomology.IsMulCocycle₁ maps (the factor order being immaterial for commutative M).

Hypotheses: M a commutative topological additive group with a continuous DistribMulAction of G; G a topological group.

Proof or construction:

1. The multiplicative cocycle identity for Multiplicative M is additive: c(gh) = c(g) + g•c(h); continuity is the same condition. This is Tau Ceti's d¹-kernel description (ContCohomology.d1_apply: d¹f(g,h) = g•f(h) − f(gh) + f(g)).
2. The action: (m·c)(g) = m + c(g) − g•m = c(g) − (d⁰m)(g), so orbits are cosets of B¹ = range d⁰ (Tau Ceti ContCohomology.B1) inside Z¹, and the orbit set is Z¹/B¹ = ContCohomology.H1 G M.
3. Invariants: FixedPoints.subgroup of the multiplicative action is FixedPoints.addSubgroup of the additive one (Tau Ceti ContCohomology.H0).
4. For discrete G and commutative M, c(gh) = c(g)·g•c(h) and Mathlib's IsMulCocycle₁ c(gh) = g•c(h)·c(g) coincide.

The API supplies:

- TauCeti.NonabelianCohomology.instMulDistribMulActionMultiplicative: A DistribMulAction of G on the additive group M induces a MulDistribMulAction of G on Multiplicative M (not an instance in Mathlib at the pin), and continuity of the action transfers.
- TauCeti.NonabelianCohomology.Z1.equivContCohomology: Z¹(G, Multiplicative M) ≃ ContCohomology.Z1 G M, the identity on underlying functions.
- TauCeti.NonabelianCohomology.H1.equivContCohomology: H¹(G, Multiplicative M) ≃ ContCohomology.H1 G M, compatible with the class maps.
- TauCeti.NonabelianCohomology.H1.equivContCohomology_one: The base point goes to 0.
- TauCeti.NonabelianCohomology.H0.equivContCohomology: H⁰(G, Multiplicative M) corresponds to ContCohomology.H0 G M.

Acceptance cases:

- For trivial action, both sides are the continuous homomorphisms G → M (Tau Ceti ContCohomology.H1EquivOfSmulEqSelf).

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, tauceti:TauCeti.ContCohomology.Z1, tauceti:TauCeti.ContCohomology.B1, tauceti:TauCeti.ContCohomology.H1, tauceti:TauCeti.ContCohomology.H1pi, tauceti:TauCeti.ContCohomology.H0, tauceti:TauCeti.ContCohomology.d0, tauceti:TauCeti.ContCohomology.d1, tauceti:TauCeti.ContCohomology.H1EquivOfSmulEqSelf, mathlib:groupCohomology.IsMulCocycle₁, mathlib:Multiplicative.

Sources:

- Kim 2005, §1, p. 6. For commutative (vector-group) coefficients the nonabelian definitions agree with the conventional abelian ones.

### Connecting cocycle of an invariant coset lift

Declaration: TauCeti.NonabelianCohomology.connectingCocycle. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-cocycle.

For b ∈ B with b⁻¹(g•b) ∈ i(A) for every g ∈ G, construct the continuous A-valued cocycle c_b uniquely specified by i(c_b(g)) = b⁻¹(g•b). The membership condition expresses that the left coset b i(A) is G-invariant. No normality of i(A), quotient group structure or continuous quotient section is assumed.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.

Proof or construction:

1. For each g choose the unique preimage in A of b⁻¹(g•b), using membership and injectivity of i.
2. The composite with i is continuous by continuity of the action at the fixed b and multiplication by b⁻¹. Apply Topology.IsEmbedding.continuous_iff to the embedding underlying i, obtaining continuity into A; pointwise choices need no continuous section.
3. Apply i to c_b(gh) and c_b(g)(g•c_b(h)); equivariance and cancellation give the same element b⁻¹((gh)•b). Injectivity proves the cocycle identity. Package the function and both properties in the existing continuous Z¹ carrier.

Required uses:

- Kim 2005 §1, printed p. 9; Kim 2009 §3 crystalline kernel: Construct the class mapping invariant cosets to H¹ without a continuous quotient section.
- AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-change-lift: Its image identity determines the change-of-lift gauge element and supplies representative independence.
- AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence: Produce a canonical continuous preimage cocycle for each class killed in H¹(G,B).


API:

- TauCeti.NonabelianCohomology.connectingCocycle_apply (projection): For every g, i(c_b(g)) = b⁻¹(g•b). This item is promoted to connecting-cocycle-image for downstream proofs.
- TauCeti.NonabelianCohomology.connectingCocycle_unique (universal-property): Every A-valued continuous cocycle c with i(c(g)) = b⁻¹(g•b) for all g equals c_b, independent of the proof of membership or pointwise preimage choices.
- TauCeti.NonabelianCohomology.connectingCocycle_eq_one_of_fixed (simp): If b is G-fixed, c_b is the constant identity cocycle.


Tests:

- TauCeti.NonabelianCohomology.tests.connecting_fixed_lift (base-case): A G-fixed lift b gives c_b = 1 for every equivariant closed embedding i.
- TauCeti.NonabelianCohomology.tests.connecting_identity_embedding (comparison): For i the identity embedding of B and arbitrary b, c_b = coboundary(b⁻¹), with coboundary(u)(g)=u(g•u)⁻¹.
- TauCeti.NonabelianCohomology.tests.connecting_proof_independence (compatibility): Two proofs that b⁻¹(g•b) lies in i(A) yield equal cocycles for the same b.
- TauCeti.NonabelianCohomology.tests.connecting_right_lift (compatibility): Whenever b and b i(a) satisfy membership, their connecting H¹ classes agree, although their cocycles differ by the gauge a⁻¹.


Acceptance:

- Works for nonnormal closed G-stable subgroups and arbitrary continuous automorphism actions.
- The formula uses b⁻¹(g•b); reversing the factors is invalid for noncommutative B.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, mathlib:Topology.IsEmbedding.continuous_iff.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Image of the connecting cocycle

Declaration: TauCeti.NonabelianCohomology.connectingCocycle_apply. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-cocycle-image.

Under the connecting-cocycle hypotheses, i(c_b(g)) = b⁻¹(g•b) for every g.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.

Proof or construction:

1. Unfold the pointwise preimage construction and its membership witness. The defining equation survives the packaging as a continuous cocycle.

Acceptance:

- The identity is in B and retains the displayed factor order.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-cocycle.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Change of lift for a connecting cocycle

Declaration: TauCeti.NonabelianCohomology.connectingCocycle_change_lift. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-change-lift.

For a ∈ A and an admissible b, b i(a) is also admissible and c_{b i(a)} = a⁻¹•c_b under the cocycle action (u•c)(g)=u c(g)(g•u)⁻¹. Consequently the H¹ class depends only on the left coset b i(A).

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.

Proof or construction:

1. Expand (b i(a))⁻¹(g•(b i(a))) as i(a⁻¹) b⁻¹(g•b) i(g•a); subgroup closure proves membership.
2. Apply connecting-cocycle-image to both lifts, expand the gauge action and use injectivity pointwise. This proves the cocycle equality.
3. The inherited H¹ orbit quotient identifies cocycles in the same A-orbit. No normality is used.

Acceptance:

- The gauge is a⁻¹, not a; a nonabelian finite test distinguishes them.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-cocycle-image, AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Trivial connecting class and fixed lifts

Declaration: TauCeti.NonabelianCohomology.connecting_eq_one_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-class-zero.

For an admissible b and any c ∈ Z¹(G,A) with i(c(g))=b⁻¹(g•b), [c]=1 if and only if there is a ∈ A for which b i(a) is G-fixed.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.

Proof or construction:

1. Use the inherited orbit-quotient characterisation: [c]=1 iff c(g)=a(g•a)⁻¹ for one a and all g.
2. After applying i, rearrange b⁻¹(g•b)=i(a)(g•i(a))⁻¹ into g•(b i(a))=b i(a). Reverse the calculation for the converse.

Acceptance:

- This is exactness at invariant cosets expressed entirely in actual group carriers.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Fibres of the connecting class

Declaration: TauCeti.NonabelianCohomology.connecting_classes_eq_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-fixed-orbits.

Suppose c,c′ ∈ Z¹(G,A) and b,b′ ∈ B satisfy i(c(g))=b⁻¹(g•b) and i(c′(g))=b′⁻¹(g•b′) for all g. Then [c]=[c′] if and only if there exist a G-fixed t ∈ B and a ∈ A such that b′ = t b i(a). Thus equal connecting classes correspond exactly to the left B^G-orbits of invariant left cosets.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.

Proof or construction:

1. By the orbit quotient [c]=[c′] iff c′=a⁻¹•c for some a ∈ A (invert the gauge variable in the inherited equality characterisation).
2. Apply i and the displayed cocycle formulas. Direct cancellation shows t=b′ i(a)⁻¹ b⁻¹ is G-fixed; rearrange to b′=t b i(a).
3. Conversely fixedness of t and b′=t b i(a) give i(c′(g))=i(a⁻¹ c(g)(g•a)); injectivity and cocycle extensionality give the gauge equality and hence equal classes.

Acceptance:

- No commutativity or normality is assumed. The B^G action is on the left, while lift changes multiply by i(a) on the right.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Exactness for a normal coefficient subgroup

Declaration: TauCeti.NonabelianCohomology.exact_H1_of_normal. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/normal-h1-kernel.

Let π:B → C be a continuous open surjective equivariant homomorphism to a topological G-group C, with ker π=i(A). For y ∈ H¹(G,B), π_*(y)=1 if and only if y lies in the image of i_*:H¹(G,A) → H¹(G,B). No continuous section of π is required.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.
- C is a topological group with continuous G-action by automorphisms; π is equivariant, continuous, open, surjective and has kernel i(A).

Proof or construction:

1. Choose a continuous cocycle d representing y. Triviality of π_*y supplies x ∈ C with π(d(g))=x(g•x)⁻¹.
2. Lift the single element x to b ∈ B by surjectivity; the gauge b⁻¹•d takes values in ker π=i(A). Restrict it to A using unique pointwise preimages, and transfer continuity with the embedding continuous_iff theorem. The cocycle law follows by equivariance and injectivity.
3. Its H¹ class maps to y because it is a gauge transform of d. Conversely π∘i=1, so every class in the image is killed. Openness allows application to the canonical topological-group quotient; it is not used to lift a whole function.

Acceptance:

- Canonical quotient by a closed normal subgroup is an instance; the H⁰ connecting cocycle for a nonnormal subgroup does not require this theorem.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/functoriality, mathlib:Topology.IsEmbedding.continuous_iff, mathlib:QuotientGroup.continuous_mk, mathlib:QuotientGroup.isOpenMap_coe.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Kernel of inclusion in nonabelian cohomology

Declaration: TauCeti.NonabelianCohomology.exact_H1_of_subgroup. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence.

For an equivariant closed embedding i:A → B of topological G-groups and x ∈ H¹(G,A), i_*(x)=1 if and only if there exist b ∈ B and c ∈ Z¹(G,A) such that x=[c] and i(c(g))=b⁻¹(g•b) for every g. Equivalently, the classes killed by inclusion are exactly the connecting classes of invariant left cosets. Normality and a continuous quotient section are not required.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.

Proof or construction:

1. Represent x by c. By the inherited H¹ basepoint characterisation, i_*x=1 iff i(c(g))=u(g•u)⁻¹ for one u ∈ B and all g. Put b=u⁻¹ to obtain the displayed formula.
2. Conversely that formula makes the image cocycle the B-coboundary of b⁻¹, so its class is the basepoint.
3. The formula supplies membership in i(A) for each g and therefore an admissible connecting-cocycle input. Its image identity and injectivity identify it with c. Change of lift and the separate fixed-orbit theorem give the coset interpretation.

Acceptance:

- Kim's crystalline condition: for U_n(R) ≤ U_n(B_cr ⊗ R), the image of H⁰(G_v, U_n(B_cr ⊗ R)/U_n(R)) → H¹(G_v, U_n(R)) is the set of crystalline torsors (Kim 2009, §3); this is (a) for a subgroup that is not normal.
- Exactness is of pointed sets: two elements of H¹(G, A) with the same image in H¹(G, B) need not differ by an element of (B/A)^G unless one of them is the base point; the fibres over other points are described after twisting (NC.3/twisting).

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/functoriality, AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-cocycle-image, AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-change-lift, AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-fixed-orbits.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Central extensions: the action of H¹(G, Z) and the connecting map to H²

Declaration: TauCeti.NonabelianCohomology.H1.map_eq_map_iff_central. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/central-extension.

Let Z ≤ B be a closed G-stable subgroup contained in the centre of B, and C := B/Z. (a) The abelian group H¹(G, Z) (NC.3/abelian-comparison) acts on H¹(G, B) by [z]·[c] := [g ↦ z(g)c(g)], and the fibres of H¹(G, B) → H¹(G, C) are exactly the orbits of this action. (b) Suppose the projection B → C has a continuous (set-theoretic) section s. Then there is a connecting map δ² : H¹(G, C) → H²(G, Z), Tau Ceti's explicit continuous H² (ContCohomology.H2 of Z written additively), sending the class of c̄ to the class of the 2-cocycle (g, h) ↦ c(g)·(g•c(h))·c(gh)⁻¹ for the continuous lift c = s ∘ c̄; and the image of H¹(G, B) → H¹(G, C) is δ²⁻¹(0). (c) If, for every c ∈ Z¹(G, B), the group C twisted by the image of c (NC.3/twisting) has only the trivial G-invariant element, then the action in (a) is free, so each nonempty fibre is a principal homogeneous space of H¹(G, Z).

Hypotheses: G is a topological group and B a topological group with an action of G by group automorphisms (MulDistribMulAction G U) such that the action map G × U → U is continuous (ContinuousSMul G U). Z closed, G-stable and central in B. For (b), a continuous section of B → C (for unipotent algebraic groups an algebraic splitting of the extension exists, as in Kim's proof). For (c), the stated vanishing of twisted invariants.

Proof or construction:

1. (a) z·c is a continuous cocycle because Z is central: z(gh)c(gh) = z(g)(g•z(h))c(g)(g•c(h)) = (z(g)c(g))·g•(z(h)c(h)). The action is compatible with twisted conjugation by B (central z commutes with u), so it descends to classes; it preserves the image in H¹(G, C). Conversely if [c₁], [c₂] have the same image, replace c₂ by u·c₂ so that the images in Z¹(G, C) agree (lift one element of C); then z := c₁⁻¹c₂ is Z-valued, continuous and, Z being central, a cocycle.
2. (b) For the lift c = s ∘ c̄, the defect (g, h) ↦ c(g)(g•c(h))c(gh)⁻¹ lies in Z (its image in C is 1), is continuous, and satisfies the 2-cocycle identity in Z (a direct computation using centrality). Changing c̄ within its class or changing the lift by a Z-valued continuous 1-cochain changes the defect by a 2-coboundary of a continuous cochain, so δ² is well defined into Z²/B² with Tau Ceti's B² (coboundaries of continuous cochains). δ²[c̄] = 0 iff the lift can be corrected by a continuous Z-valued cochain to a cocycle, i.e. iff [c̄] lifts to H¹(G, B).
3. (c) If z·c = u·c with u ∈ B, then projecting to C gives ū·c̄ = c̄, i.e. ū is invariant for the action twisted by c̄; by hypothesis ū = 1, so u ∈ Z and z(g) = u(g•u)⁻¹ is a coboundary of Z (Kim's argument).

Acceptance cases:

- For the lower central series of a unipotent group U with H⁰(G, U^i/U^{i+1}) = 0, (c) applies at every step, which is how Kim shows H¹(G, U_{n+1}) ≅ H¹(G, U^{n+1}/U^{n+2}) × δ²⁻¹(0) (Kim 2005, Proposition 2).
- Without the section hypothesis, H¹(G, C) → H²(G, Z) need not be definable with continuous cochains; (a) and (c) do not need it.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/abelian-comparison, AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence, AnabelianGeometryAndNonabelianChabauty:NC.3/normal-h1-kernel, AnabelianGeometryAndNonabelianChabauty:NC.3/twisting, tauceti:TauCeti.ContCohomology.H2, tauceti:TauCeti.ContCohomology.H2pi, tauceti:TauCeti.ContCohomology.Z2, tauceti:TauCeti.ContCohomology.B2, mathlib:Subgroup.center.

Sources:

- Kim 2005, §1, proof of Proposition 2, p. 8. The connecting map H¹(G, U_n) → H²(G, U^{n+1}/U^{n+2}) built from an algebraic splitting and the coboundary of a lift.
- Kim 2005, §1, proof of Proposition 2, p. 9. The action of H¹ of the central subgroup, its orbits and its freeness under vanishing invariants.
- Kim 2009, §3, p. 26. The same structure for Selmer varieties.

### Twisting by a cocycle

Declaration: TauCeti.NonabelianCohomology.Twist. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/twisting.

Let c ∈ Z¹(G, U). The twisted group ₍c₎U is U with the action g ⋆ u := c(g)·(g•u)·c(g)⁻¹, again a continuous action by automorphisms. The map τ_c : Z¹(G, ₍c₎U) → Z¹(G, U), c′ ↦ (g ↦ c′(g)·c(g)), is a bijection carrying the trivial cocycle to c and the twisted-conjugation action of U on the left to that on the right; it induces a bijection of underlying sets H¹(G, ₍c₎U) ≅ H¹(G, U) sending the source base point to [c]; it becomes a pointed equivalence only when the target is repointed at [c]. Twisting is compatible with G-stable subgroups (for cocycles with values in them) and with quotients by normal ones, so that fibres of the maps in NC.3/exact-sequence over [c] become fibres over the base point after twisting.

Hypotheses: G is a topological group and U a topological group with an action of G by group automorphisms (MulDistribMulAction G U) such that the action map G × U → U is continuous (ContinuousSMul G U). c a continuous cocycle.

Proof or construction:

1. g ⋆ − is an automorphism of U (conjugation composed with the automorphism g•−), and (gh) ⋆ u = c(gh)(gh•u)c(gh)⁻¹ = c(g) g•c(h) g•(h•u) g•c(h)⁻¹ c(g)⁻¹ = g ⋆ (h ⋆ u) by the cocycle identity; continuity from continuity of c and of the action.
2. τ_c(c′) is a cocycle for U: c′(gh)c(gh) = c′(g)·(g ⋆ c′(h))·c(g)·g•c(h) = c′(g)c(g)·g•(c′(h)c(h)). The inverse is c″ ↦ c″·c⁻¹. For u ∈ U, τ_c(u·c′)(g) = u c′(g)(g ⋆ u)⁻¹ c(g) = u c′(g) c(g) (g•u)⁻¹ = (u·τ_c(c′))(g).
3. Hence the bijection of orbit sets; the trivial cocycle maps to c.
4. Compatibility with subgroups and quotients: twisting by a cocycle with values in a G-stable subgroup A preserves A; if A is normal every twist preserves A, and the quotient map U → U/A is equivariant for the twists by c and by its image.

The required uses are:

- AnabelianGeometryAndNonabelianChabauty:NC.3/central-extension: The freeness hypothesis is stated for twisted invariants.
- AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence: Fibres over non-base points are fibres over base points of twisted sequences.
- AnabelianGeometryAndNonabelianChabauty:NC.4: Local conditions at a point are compared through twisting by the class of that point.

The API supplies:

- TauCeti.NonabelianCohomology.Twist: The type synonym ₍c₎U of U with the twisted action g ⋆ u = c(g)(g•u)c(g)⁻¹.
- TauCeti.NonabelianCohomology.Twist.smul_def: g ⋆ u = c(g)·(g•u)·c(g)⁻¹.
- TauCeti.NonabelianCohomology.Twist.continuousSMul: The twisted action is continuous.
- TauCeti.NonabelianCohomology.Z1.twistEquiv: The bijection Z¹(G, ₍c₎U) ≃ Z¹(G, U), c′ ↦ c′·c.
- TauCeti.NonabelianCohomology.H1.twistEquiv: The induced bijection H¹(G, ₍c₎U) ≃ H¹(G, U).
- TauCeti.NonabelianCohomology.H1.twistEquiv_one: twistEquiv sends the base point to the class of c.
- TauCeti.NonabelianCohomology.Twist.self: Twisting by the trivial cocycle is the original action.

Discriminating tests:

- TauCeti.NonabelianCohomology.tests.twist_trivial (degenerate): Twisting by the trivial cocycle gives back U with its action, and twistEquiv is the identity.
- TauCeti.NonabelianCohomology.tests.twist_abelian (computation): For U commutative, g ⋆ u = g•u for every c, and twistEquiv is translation by c.
- TauCeti.NonabelianCohomology.tests.twist_S3 (computation): For G = ℤ/2 acting trivially on S₃ and c sending the generator to a transposition τ, the twisted action is conjugation by τ, whose invariants form the subgroup {1, τ} of order 2.
- TauCeti.NonabelianCohomology.tests.twist_changes_invariants (non-example): A twist need not be isomorphic to U as a G-group: for G = ℤ/2 acting trivially on S₃ and c(σ) = τ a transposition, H⁰(G, ₍c₎S₃) = {1, τ} has order 2 while H⁰(G, S₃) = S₃ has order 6; and twistEquiv sends the base point to [c], not to the base point.

Acceptance cases:

- For trivial action and U commutative, twisting by any c does not change the action, and τ_c is translation by c.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, mathlib:MulAut.conj, mathlib:MulDistribMulAction.toMulAut.

Sources:

- Kim 2005, §1, proof of Proposition 1, p. 6. Twisting an action by a cocycle.
- Poonen, §4.5, p. 105. Twists are classified by nonabelian H¹.

### Torsors under U with compatible G-action are classified by H¹(G, U)

Declaration: TauCeti.NonabelianCohomology.Torsor.classOf. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/torsor-classification.

A (G, U)-torsor is a topological space P with a continuous right action of U that is free and transitive, such that for one (equivalently every) p ∈ P the orbit map U → P, u ↦ p·u, is a homeomorphism, together with a continuous left action of G satisfying g•(p·u) = (g•p)·(g•u). For p ∈ P let c_p(g) ∈ U be the unique element with g•p = p·c_p(g). Then c_p ∈ Z¹(G, U), c_{p·u} = u⁻¹·c_p under the twisted-conjugation action, so [P] := [c_p] ∈ H¹(G, U) is independent of p and of the isomorphism class of P; P ↦ [P] is a bijection from isomorphism classes of (G, U)-torsors to H¹(G, U), the trivial torsor U corresponds to the base point, and P has a G-fixed point iff [P] is the base point. The inverse sends [c] to U with the twisted G-action g ∗ u := c(g)·(g•u).

Hypotheses: G is a topological group and U a topological group with an action of G by group automorphisms (MulDistribMulAction G U) such that the action map G × U → U is continuous (ContinuousSMul G U). Torsors are topological, with the orbit maps homeomorphisms; isomorphisms of torsors are homeomorphisms compatible with both actions.

Proof or construction:

1. Cocycle: (gh)•p = g•(p·c_p(h)) = (g•p)·(g•c_p(h)) = p·c_p(g)·g•c_p(h), and freeness gives c_p(gh) = c_p(g)·g•c_p(h). Continuity: c_p is the composite of g ↦ g•p with the inverse of the orbit homeomorphism.
2. Change of point: g•(p·u) = p·c_p(g)·(g•u) = (p·u)·u⁻¹c_p(g)(g•u), so c_{pu}(g) = u⁻¹c_p(g)(g•u) = (u⁻¹·c_p)(g). An isomorphism of torsors carries p to a point with the same cocycle.
3. Inverse: for c ∈ Z¹, the formula g ∗ u := c(g)(g•u) is a continuous action (cocycle identity) compatible with right multiplication, and its cocycle at the point 1 is c. Cohomologous cocycles give isomorphic torsors (left multiplication by u), and a torsor is isomorphic to the one built from c_p via the orbit map at p.
4. A G-fixed point p has c_p = 1; conversely, if c_p(g) = u·(g•u)⁻¹ for all g, then g•(p·u) = p·c_p(g)·(g•u) = p·u, so p·u is fixed.

Acceptance cases:

- Path torsors: for a rational point x of a curve and a base point b, the torsor of paths from b to x, with the Galois action, has class [P(x)] ∈ H¹(G_K, U); this is the map from rational points to H¹ used in NC.4 (Kim 2009, introduction).
- Poonen's classification of torsors under a smooth algebraic group G over k by H¹(k, G) (§5.12.4) is the algebraic version with G = Gal(k_s/k) and U = G(k_s) discrete.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, mathlib:MulAction.toPerm, mathlib:Topology.IsQuotientMap.

Sources:

- Kim 2005, §1, Proposition 1, p. 5. The classification of torsors by continuous H¹.
- Kim 2005, §1, proof of Proposition 1, p. 6. The cocycle of a point and its independence of the point.
- Poonen, §5.12.4, Remark 5.12.13, p. 154. The cocycle of a torsor with a chosen point.

## Remaining source and construction work

### AnabelianGeometryAndNonabelianChabauty:NC.0 — partial

Fundamental groupoids and sections: import the finite-étale fibre functor and Galois category from InverseGaloisAndArithmeticFundamentalGroups IG.0 and the arithmetic exact sequence from IG.1; construct path torsors (torsors in the sense of NC.3/torsor-classification) and the section of a rational point, base-point change and conjugacy independence; tangential base points on P¹ ∖ {0, 1, ∞} from PeriodsAndSpecialValues PS.9. Settle the path-torsor ownership overlap with IG.6.

### AnabelianGeometryAndNonabelianChabauty:NC.1 — not_read

Source-qualified anabelian reconstruction: acquire and read Mochizuki's theorem and proof; decompose decomposition-group recovery, covers, linear systems and effectivity; state Isom and Hom versions separately.

### AnabelianGeometryAndNonabelianChabauty:NC.2 — not_read

Unipotent fundamental groups: Tannakian construction of unipotent étale and de Rham fundamental groups, central series and finite quotients, path torsors with filtration, Frobenius and Galois structures (tensor-isomorphism torsors from MotivesAndAlgebraicCycles MC.6; rigid/de Rham input from ColemanIntegration L1), and the depth-one comparison with the Jacobian.

### AnabelianGeometryAndNonabelianChabauty:NC.3 — partial

Representability: Kim 2005 Propositions 2–3 (H¹(G, U) and H⁰(G, U(B)/U) represented by affine pro-varieties under finite-dimensionality and H⁰-vanishing hypotheses), with the topologies on U(B ⊗_K R) of Kim §1 Lemmas 1–5; the unipotent-group inputs (lower central series, algebraic splittings of central extensions).

Local conditions and Selmer varieties: unramified and crystalline conditions (Kim 2009 §3, Lemma 5: the image of H⁰(G_v, U(B_cr ⊗ R)/U(R)) → H¹(G_v, U(R))), bad-place conditions, the global Selmer variety, and dimension calculations; depth-one agreement with the Kummer map and Selmer group of the Jacobian (HeightsRationalPointsAndObstructions RP.1) and a nontrivial depth-two obstruction.

Inflation–restriction for nonabelian H¹ (Serre, Galois Cohomology I §5.8), not in a freely readable source consulted here.

### AnabelianGeometryAndNonabelianChabauty:NC.4 — not_read

Unipotent Albanese maps and Chabauty–Kim loci: iterated integrals (ColemanIntegration L1), the global-to-local Selmer map and the finiteness theorem under its hypotheses; depth one recovers classical Chabauty.

### AnabelianGeometryAndNonabelianChabauty:NC.5 — not_read

Quadratic Chabauty: Balakrishnan–Dogra I and II, depth-two quotients, p-adic heights with all local terms, and a worked curve.

### AnabelianGeometryAndNonabelianChabauty:NC.6 — not_read

Reconstruction and rational-point handoff to EffectiveDiophantineMethods ED.6, keeping the section conjecture and eventual Chabauty–Kim completeness conjectural.

## Gaps

- **Topologies on points of unipotent groups over topological algebras**: Kim's H¹(G, U(B ⊗_K R)) uses the inductive-limit topology on B-vector spaces and the induced topology on points of affine schemes (Kim 2005, §1, Lemmas 1–5). The nodes here take U as an abstract topological group; the construction of these topologies and the continuity of the Galois action on points are not built and are needed before the Selmer varieties.
- **Unipotent algebraic groups: lower central series and splittings**: The continuous-section hypothesis of NC.3/central-extension (b) holds for central extensions of unipotent groups over a field of characteristic 0 by an algebraic splitting (Kim 2005, proof of Proposition 2). Tau Ceti has unipotent-group theory, but this splitting and the lower-central-series quotients as vector groups are not decomposed here.

## Sources and baseline

The inherited component's source receipts, recorded by Claude Code cc-fb70e5 on 2026-09-28, are:

- **Kim, *The motivic fundamental group of P¹ ∖ {0, 1, ∞} and the theorem of Siegel*** (arXiv:math/0409456v1; Invent. Math. 2005). §1 was read in full.
- **Kim, *The unipotent Albanese map and Selmer varieties for curves*** (arXiv:math/0510441v4; Publ. RIMS 2009). The introduction and the local-condition passages of §3 were read.
- **Poonen, *Rational points on varieties*** (author PDF). §1.3.5, Exercise 1.9, §4.5, §5.11 and §5.12.4 were read.

The sha256 of each file is in sourceVersions. Serre's *Galois Cohomology*, the standard reference for nonabelian H¹, is not freely available. Its inflation–restriction sequence is therefore listed as remaining work rather than cited. The other statements here are proved from first principles, and their proof steps say so. The inherited checkpoint recorded no source mistakes. This continuation makes no fresh whole-source errata claim for those texts; no new source mistake was identified in the selected K(π,1) passages.

The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The preceding worker recorded the original 32 baseline declarations in the pinned index and read their heads; those historical checks are preserved, not claimed as fresh primary reads here. Among them are Mathlib's actions, orbit quotients, fixed-point subgroups and quotient groups, and Tau Ceti's explicit continuous cohomology: `ContCohomology.Z1`, `B1`, `H1`, `H2`, `Z2` and `B2`. Mathlib does not provide the `MulDistribMulAction` on `Multiplicative M` that the comparison needs, so the comparison node supplies it.

The planets are:

- Nonabelian cohomology set H¹(G, U);
- Exact sequence of nonabelian cohomology;
- Central extensions and the connecting map to H²;
- Torsors and nonabelian H¹.

The inherited suggested file gives partial native prototypes for nonabelian cohomology, exact sequences, twisting and torsors. It is not compiled. The continuation appends a complete name-by-name signature-or-omission audit: a comment naming an API or test is not a signature, and the inherited multi-declaration nodes are not claimed complete.

## Continuation coverage, ownership and handoff

### AnabelianGeometryAndNonabelianChabauty:NC.0 — partial

- Fundamental groupoids and sections: import the finite-étale fibre functor and Galois category from InverseGaloisAndArithmeticFundamentalGroups IG.0 and the arithmetic exact sequence from IG.1; construct path torsors (torsors in the sense of NC.3/torsor-classification) and the section of a rational point, base-point change and conjugacy independence; tangential base points on P¹ ∖ {0, 1, ∞} from PeriodsAndSpecialValues PS.9. Settle the path-torsor ownership overlap with IG.6.
- Close the coefficient/sheaf/edge-map requests and raw-homotopy/source proof gaps of the twelve new K(π,1) nodes; type their signatures and eight discriminating key tests.
- Read/decompose Chen 2024 /57–58 tangential specialization ⟨γ_t⟩\Y_t ≅ Y_x, functorial in finite covers, and good/symmetric-path consumers, distinct from reconstruction.

### AnabelianGeometryAndNonabelianChabauty:NC.1 — not_read

- Source-qualified anabelian reconstruction: acquire and read Mochizuki's theorem and proof; decompose decomposition-group recovery, covers, linear systems and effectivity; state Isom and Hom versions separately.

### AnabelianGeometryAndNonabelianChabauty:NC.2 — not_read

- Unipotent fundamental groups: Tannakian construction of unipotent étale and de Rham fundamental groups, central series and finite quotients, path torsors with filtration, Frobenius and Galois structures (tensor-isomorphism torsors from MotivesAndAlgebraicCycles MC.6; rigid/de Rham input from ColemanIntegration L1), and the depth-one comparison with the Jacobian.
- Read BDMTV 2019 Appendix A, Theorem 4.2, Lemma 4.3, Corollary 4.4, Hadian Theorem 4.5, Lemma 5.2 and nonabelian Berthelot–Ogus bridge; account individually for 17 routed items and E9/E10. Do not merge local iterated-integral word expansion /58(40) with global comparison /93(41).

### AnabelianGeometryAndNonabelianChabauty:NC.3 — partial

- Representability: Kim 2005 Propositions 2–3 (H¹(G, U) and H⁰(G, U(B)/U) represented by affine pro-varieties under finite-dimensionality and H⁰-vanishing hypotheses), with the topologies on U(B ⊗_K R) of Kim §1 Lemmas 1–5; the unipotent-group inputs (lower central series, algebraic splittings of central extensions).
- Local conditions and Selmer varieties: unramified and crystalline conditions (Kim 2009 §3, Lemma 5: the image of H⁰(G_v, U(B_cr ⊗ R)/U(R)) → H¹(G_v, U(R))), bad-place conditions, the global Selmer variety, and dimension calculations; depth-one agreement with the Kummer map and Selmer group of the Jacobian (HeightsRationalPointsAndObstructions RP.1) and a nontrivial depth-two obstruction.
- Inflation–restriction for nonabelian H¹ (Serre, Galois Cohomology I §5.8), not in a freely readable source consulted here.
- Split inherited multi-declaration nodes and supply all API/test forms explicitly omitted by the appended suggested-file audit; no stage is closed here.

### AnabelianGeometryAndNonabelianChabauty:NC.4 — not_read

- Unipotent Albanese maps and Chabauty–Kim loci: iterated integrals (ColemanIntegration L1), the global-to-local Selmer map and the finiteness theorem under its hypotheses; depth one recovers classical Chabauty.

### AnabelianGeometryAndNonabelianChabauty:NC.5 — not_read

- Quadratic Chabauty: Balakrishnan–Dogra I and II, depth-two quotients, p-adic heights with all local terms, and a worked curve.
- Import NS=Pic/Pic⁰, injection into symmetric Hom and finite-generation/rank data from AbelianSchemesAndArithmeticModuli:A2; logically retarget BDMTV /9 to this owner without locally rebuilding it.
- Read/decompose BDMTV 2019 §3 split-Cartan-level-13 pairs/determinants, nice correspondences and U_Z, A_Z twists/D_cris, specialized height (17), Lemmas 3.2/3.7, Corollary 3.8 and splitting/character independence. Preserve all 19 routed items including four applications; generic heights/mixed extensions/local terms come from the pending Part II owner, with no reverse NC.5 dependency.

### AnabelianGeometryAndNonabelianChabauty:NC.6 — not_read

- Reconstruction and rational-point handoff to EffectiveDiophantineMethods ED.6, keeping the section conjecture and eventual Chabauty–Kim completeness conjectural.
- Process-only handoff: propose removal in restructure, retaining actual reconstruction in NC.1 and rational-point outputs in NC.5/EffectiveDiophantineMethods:ED.6. No process nodes or unaccepted closed coverage.

### Exact cross-roadmap requests

1. InverseGaloisAndArithmeticFundamentalGroups:IG.0: The actual category of finite étale schemes over a connected locally noetherian X, geometric-point fibre functor, its profinite automorphism group and equivalence with finite continuous π-sets; finite-cover subgroups, geometric-point path transport and induced coefficient transport, compatible with native abstract IsFundamentalGroup and the opposite affine FiniteEtale.fiber. Consumers: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/pointed-isomorphism, AnabelianGeometryAndNonabelianChabauty:NC.0/basepoint-transport, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison, AnabelianGeometryAndNonabelianChabauty:NC.0/field.
2. SchemeAndStackFoundations:SF.2: Finite continuous π-module / finite locally constant abelian sheaf dictionary on native smallEtaleTopology, natural in coefficients, pointed scheme isomorphisms and fibre-functor paths; actual canonical εⁿ in every degree. Compare derived continuous cohomology of finite discrete modules to native all-degree TopRep homogeneous continuousCohomology rather than define a second cohomology theory. Consumers: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/pointed-isomorphism, AnabelianGeometryAndNonabelianChabauty:NC.0/basepoint-transport.
3. SchemeAndStackFoundations:SF.2: Spec K: exact stalk equivalence for discrete continuous G_K-modules and derived global-sections/invariants comparison of Stacks 03QQ Lemmas 59.59.1–2, identifying its map with ε. Also positive-degree trivial-group continuous cohomology calculation. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/field, AnabelianGeometryAndNonabelianChabauty:NC.0/projective-line-obstruction.
4. InverseGaloisAndArithmeticFundamentalGroups:IG.0: For algebraically closed k, π₁ᵉᵗ(P¹_k)=1 by classification of connected finite étale covers; retain characteristic and geometric-point hypotheses. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/projective-line-obstruction.
5. SchemeAndStackFoundations:SF.2: For smooth projective curves over algebraically closed k and n invertible in k, canonical H²_et(X,μ_n) ≅ Z/n of Stacks 03RQ, with noncanonical constant Z/n identification after choosing roots of unity. Specialize to P¹ and prime ℓ≥2 without constructing Picard/NS theory here. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/projective-line-obstruction.
6. SchemeAndStackFoundations:SF.2: Filtered pointed finite-cover Cartan–Leray and edge comparisons; étale cohomology compatibility with the filtered pro-cover construction; Shapiro for induced finite modules and finite-cover trivialization of finite locally constant sheaves. Supply all-finite-coefficient ⇔ all-finite-cover higher-class-effacement under the geometrically-unibranch variety hypotheses of Schmidt–Stix Lemma 2.7(b), including its Artin–Mazur Theorem 4.3 input audit. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement.
7. InverseGaloisAndArithmeticFundamentalGroups:IG.0: Characteristic-zero geometric product π₁ theorem for geometrically connected geometrically unibranch varieties over algebraically closed k, SGA 1 XIII Proposition 4.6; cofinality of product finite covers by profinite open subgroups. Arithmetic π₁ over nonclosed k is not an ordinary product. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/products.
8. InverseGaloisAndArithmeticFundamentalGroups:IG.1: Arithmetic π₁ exact sequence for geometrically connected varieties over k, with product/fibre-product compatibility needed in the characteristic-zero geometric-base-change reduction; not a higher homotopy fibration theorem. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/products.
9. SchemeAndStackFoundations:SF.2: For characteristic-zero geometrically connected geometrically unibranch varieties, equivalence of the full finite-cover effacement condition over k and its algebraic closure, including descent of finite covers/classes. Natural derived finite-torsion Künneth with Tor terms and filtered universal-finite-cover cohomology compatibility must yield product effacement; audit SGA 4½ Théorème de finitude Corollary 1.11. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/products.
10. SchemeAndStackFoundations:SF.3: Smooth geometric curves, smooth proper models and genus, and smooth ⇒ geometrically unibranch in the needed scope. Import these scheme-theoretic curve objects, not a second NC.0 construction. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve.

### New open gaps

- Generic raw étale homotopy foundations and fibration theorem: Raw étale pro-spaces, pro-homotopy groups, profinite-π identification in the stated geometrically-unibranch variety scope, classifying morphisms/Bπ₁ and Isaksen's weak-equivalence test are absent at the pins. Elementary fibrations additionally need Friedlander Theorem 11.5 on universal finite-cover pullbacks, finite-cover higher-homotopy invariance (Schmidt–Stix Lemma 2.1) and smooth profiniteness (Artin–Mazur Theorem 11.1). IG.0/IG.1 do not state this higher theory. The reviewed Schmidt–Stix extraction already retains an UNACCEPTED EtaleHomotopyTypes candidate, with no registered stages or design job. Reconcile its foundational core, rather than create a parallel owner: it imports generic pro-categories, ordinary homotopy, sites and IG.0/IG.1; it must not depend on NC.0/NC.1 for the generic inputs consumed here. Keep its source-qualified anabelian orbit results downstream. No unregistered stage is a prerequisite. Needed by AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison, AnabelianGeometryAndNonabelianChabauty:NC.0/elementary-fibration.
- Raw homotopy comparison outside geometric-unibranch varieties: The cohomological predicate is planned on all connected locally noetherian schemes. Its raw equivalence is sourced here only for connected geometrically unibranch varieties. Raw π₁ is not automatically profinite on arbitrary locally noetherian schemes; replacing it with its profinite completion changes the target. Establish broader exact hypotheses or retain distinct cohomological and raw notions; never export this restricted equivalence universally. Needed by AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison.
- Delegated proof leaves of finite-cover and curve criteria: Schmidt–Stix Lemma 2.7(a) delegates to Schmidt 1996 Proposition 15, not personally read in this continuation. The finite-cover criterion uses Artin–Mazur Theorem 4.3; products use SGA 1 XIII 4.6 and SGA 4½ finitude 1.11. The selected printed Schmidt–Stix proofs were read, but these transitive nonroutine inputs have not been decomposed to baseline. Exact supplier requests state the inputs; obtain primary proofs before marking closure. Needed by AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison, AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve, AnabelianGeometryAndNonabelianChabauty:NC.0/products.
- Typed étale comparison carrier and suggested signatures: Native schemes, local noetherianity, small étale topology, abstract Galois categories, affine finite étale fibres and all-degree continuousCohomology exist. Actual non-affine profinite π, finite-coefficient/sheaf dictionary and canonical all-degree ε are not supplied at the pins. Every new declaration/API/test has an explicit mathematical omission entry in the suggested file, not a dummy Prop field, invented carrier or fabricated signature. Native smoke forms test only existing carriers. The key is planned, not formalised. Needed by AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/coefficient-restriction, AnabelianGeometryAndNonabelianChabauty:NC.0/pointed-isomorphism, AnabelianGeometryAndNonabelianChabauty:NC.0/basepoint-transport, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison, AnabelianGeometryAndNonabelianChabauty:NC.0/field, AnabelianGeometryAndNonabelianChabauty:NC.0/projective-line-obstruction, AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve, AnabelianGeometryAndNonabelianChabauty:NC.0/products, AnabelianGeometryAndNonabelianChabauty:NC.0/elementary-fibration, AnabelianGeometryAndNonabelianChabauty:NC.0/artin-neighbourhood.
- M₀,n moduli and forgetting-mark fibrations are imported: StableReductionPartII:key/moduli-curves is a reserved owner with no packet node at this audit tree. Its M₀,n scheme, M₀,4 identification and characteristic-zero forgetting-mark elementary fibrations must be imported/checked before the named instance is typed. No moduli construction is added here; the reserve is not an established theorem. Needed by AnabelianGeometryAndNonabelianChabauty:NC.0/artin-neighbourhood, AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1.
- Routed Chen and BDMTV additions remain source inventory obligations: This continuation reads the K(π,1) sources, not the full Chen 2024 tangential specialization /57–58 or BDMTV 2019 universal-connection/Frobenius and quadratic-height proofs. The issue's 17 NC.2 and 19 NC.5 route items, E9/E10 and four applications still require individual source-to-node/import records. NC.5 imports NS from AbelianSchemesAndArithmeticModuli:A2 and generic mixed extensions/local heights from the pending SelmerComplexesAndPadicHeightsPartII owner, which must not depend on NC.5. No provisional height stage or duplicate is inserted. Needed by AnabelianGeometryAndNonabelianChabauty:NC.0, AnabelianGeometryAndNonabelianChabauty:NC.2, AnabelianGeometryAndNonabelianChabauty:NC.5.
- Inherited NC.3 declaration/API granularity remains open: The eight inherited nodes and their source receipts are retained, not re-audited or closed. continuous-cocycles, functoriality, exact-sequence and central-extension bundle independent declarations and need granular continuation. Several inherited API/test forms are absent or only comment-level in the old suggested file. The appended omission audit accounts for every such name. Twisting's target must be repointed at [c] to make its set bijection pointed. Needed by AnabelianGeometryAndNonabelianChabauty:NC.3.

### Structural proposals

- NC.6 is a process handoff, not a mathematical layer, in the reviewed audit. Remove NC.6 after maintainer acceptance; retain reconstruction in NC.1 and rational-point exports in NC.5, supplying EffectiveDiophantineMethods:ED.6 directly. Keep section and eventual Chabauty–Kim completeness conjectural. Current NC.6 coverage remains pending acceptance.
- The Schmidt–Stix extraction already retains an unaccepted EtaleHomotopyTypes candidate. Its generic foundational targets overlap the raw inputs needed here; its NC.1 centre-free input would create a cycle if used by the NC.0 foundation. Reconcile and narrow the existing unaccepted Étale homotopy types and pro-spaces candidate into a generic foundational core: import existing pro-category/ordinary homotopy/site/IG.0/IG.1 owners, resolve its G1/G3/G7 closure obligations and supply raw étale pro-spaces, classifying pro-spaces, coefficient detection and elementary-fibration homotopy inputs without any dependency on NC.0 or NC.1. Leave source-qualified anabelian monodromy/orbit results to the downstream anabelian component. This packet alone owns the reserved K(π,1) predicate. Do not create a duplicate IG Part II owner or treat this candidate as a registered supplier stage.

### Fresh source and baseline receipts

The selected primary reading used [Schmidt–Stix's publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf), [Farb–Kisin–Wolfson v2](https://arxiv.org/pdf/2110.05534v2), and Stacks [03QQ](https://stacks.math.columbia.edu/tag/03QQ) and [03RQ](https://stacks.math.columbia.edu/tag/03RQ). URLs, dates, hashes and exact selected sections are in the packet. Historical Kim/Poonen receipts are retained unchanged. The continuation does not claim to have read the whole essential-dimension or reconstruction arguments.

- schmidt-stix-2016: Personally read the finite-cover convention and Lemma 2.1 with proof (pp. 821–822); §2.3, definition, Lemma 2.7 and Proposition 2.8 with their printed proofs (pp. 826–828); Appendix A.3, Lemmas A.14–A.15, Proposition A.16 and Definition A.17/Corollary A.18 with proofs (pp. 861–866); Definition 6.1 and M₀,n example (p. 845). Schmidt 1996 Proposition 15, Artin–Mazur Theorems 4.3/11.1, Friedlander Theorem 11.5, Isaksen model-category leaves and cited SGA Künneth proofs were not separately acquired/read; their exact roles are requests/gaps. Reconstruction proofs in §4–§6 were not read.
- farb-kisin-wolfson-2024-v2: Personally read §2.3.1 (p. 16), the constant-Fₚ canonical cohomology map and its finite-quotient use, and Lemma 3.2.2 with proof (p. 24), for torus torsors over abelian varieties and their specific maximal-pro-p inflation comparison. Prismatic and essential-dimension arguments outside these selected passages were not read for this continuation. The paper does not define our p-primary coefficient-class predicate.
- stacks-etale-tests: 03QQ: personally read Lemmas 59.59.1–2 and their proofs identifying abelian étale sheaves with continuous Galois modules and derived cohomology on Spec K. 03RQ: personally read Lemma 59.69.1 and its proof giving H²(X,μ_n) ≅ Z/n for algebraically closed smooth projective curves with n invertible; referenced Picard/Kummer inputs are imported from SF.2. 03N8 was read as supporting motivation for the projective-line test; its introductory sketch is not a substitute for the curve-cohomology theorem.

Seven positive native declarations were personally read at the pinned Mathlib commit: mathlib:AlgebraicGeometry.Scheme, mathlib:AlgebraicGeometry.IsLocallyNoetherian, mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology, mathlib:continuousCohomology, mathlib:CategoryTheory.PreGaloisCategory.IsFundamentalGroup, mathlib:CommAlgCat.FiniteEtale, mathlib:CommAlgCat.FiniteEtale.fiber. All-degree continuous cohomology and the small étale site are native; their mere existence does not supply the geometric π/sheaf/ε bridge. The affine finite-étale fibre functor is contravariant in algebras. A full-tree spelling search at both pins found no K(π,1)/étale-homotopy declaration; negative searches do not replace the exact open supplier contracts.

The JacobianChallenge and StableReduction upstream documents were read during this continuous worker run. The reviewed NC audit, all seven atlas stage descriptions, the seventeen touching stage edges, and the reserved definition contracts were examined. Screening every blueprint link file found no entries mentioning this roadmap at the audit tree; the atlas stage edges were read separately.

### Suggested file boundary

Every new node, API item and test has an exact named omission entry because the actual geometric coefficient and comparison carriers are missing. These are mathematical omissions, not Lean signatures. The appended native smoke examples mention only real smallEtaleTopology, IsLocallyNoetherian, FiniteEtale.fiber and continuousCohomology carriers. They do not test the missing K(π,1) definition. The inherited prototypes and two inherited examples remain; no Lean compilation or implementation is claimed.

## Exact routed source inventory

This is an inventory of catalogue contracts, not a claim to have freshly read the Chen or BDMTV primary proofs. The reserved key assignment takes precedence over historical SF.2 or unaccepted étale-homotopy candidate placements of the K(π,1) predicate; generic cohomology and raw homotopy remain imports. The unaccepted candidate has no registered supplier stage. Its generic foundation must not depend on NC.1, which consumes NC.0.

### PAPER-SCHMIDT-STIX-16 — partial

- PAPER-SCHMIDT-STIX-16/14. Selected primary definition/Lemma 2.7 read; exact delegated proof gaps remain. Planned nodes: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve, AnabelianGeometryAndNonabelianChabauty:NC.0/products.
- PAPER-SCHMIDT-STIX-16/31. Selected Appendix A.3 primary proofs read. General pro-classifying space machinery is imported via the unaccepted foundation candidate, not rebuilt in the key node. Planned nodes: AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison.
- PAPER-SCHMIDT-STIX-16/68. Only the K(π,1) consequence is planned here. Generic strongly hyperbolic Artin neighbourhood construction and reconstruction remain with the downstream candidate route. Planned nodes: AnabelianGeometryAndNonabelianChabauty:NC.0/artin-neighbourhood.

### PAPER-FARB-KISIN-WOLFSON-24 — partial

- PAPER-FARB-KISIN-WOLFSON-24/005. Reserved owner supersedes the historical SF.2 key-definition placement. SF.2 supplies cohomology, not a duplicate K(π,1) predicate. Planned nodes: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1.
- PAPER-FARB-KISIN-WOLFSON-24/091. Selected Lemma 3.2.2 proof read. Torus-torsor-over-abelian-variety full K(π,1) theorem remains to be decomposed into fibre-fibration cohomology/π₁ suppliers and the owned predicate. Its pro-p inflation also needs the separately proved prime-to-p kernel, not just p-primary coefficients. No corresponding node is claimed complete.
- PAPER-FARB-KISIN-WOLFSON-24/146. Abelian varieties and split tori over algebraically closed characteristic-zero fields: full finite-coefficient geometric instances remain to be decomposed, importing A5 uniformization/comparison rather than rebuilding it. The key interface is supplied, not a completed instance. No corresponding node is claimed complete.

### PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19 → AnabelianGeometryAndNonabelianChabauty:NC.5 — not_read

- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/11: Quadratic Chabauty pair (Published §1.4, (5), pp.890–891). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/12: Lemma 1.5: the determinant criterion (Published Lemma 1.5, (6), p.891). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/13: Equivariant heights reduce the number of points (Published Remark 1.6, §1.7, Remark 1.7, Remark 3.9, pp.892, 895, 908). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/22: Lemma 2.4 (Published Lemma 2.4, p.900). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/28: Lemma 3.2 (Published Lemma 3.2, p.903). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/32: The height formula (17) (Published (16)–(17), pp.905–906). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/33: A_Z(b), twisting and the pair (θ, Υ) (Published §3.4, (18)–(19), pp.906–907). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/35: Lemma 3.7 (Published Lemma 3.7, pp.907–908). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/36: Corollary 3.8 (Published Corollary 3.8, p.908). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/37: Independence of the splitting and the character (Published Remarks 3.10, 3.12, (20), pp.908–909). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/38: Chow–Heegner points (Remarks 3.11, 5.6) (Published Remark 3.11, Remark 5.6, (47), pp.908, 925). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/46: Admissible Tate classes Z (Published §4.4, p.913). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/47: Lemma 4.7 (corrected) (Published Lemma 4.7, pp.913–914 (arXiv v1 Lemma 4.5)). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/48: The filtered connection A_Z (Published (25), p.914). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/62: Lemma 5.4: comparison for A_Z (Published Lemma 5.4, (46), pp.923–924). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/20: Theorem 2.3 (Balakrishnan–Dogra) (Published Theorem 2.3, p.899 (arXiv v1 Lemma 2.3)). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/21: Symmetric and nice correspondences (Published §2.3, p.900). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/23: The depth-two quotient U_Z (Published §2.3, Remark 2.5, pp.900–901). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/34: Theorem 3.6 (Kim–Tamagawa) (Published Theorem 3.6, p.907). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.

### PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19 → AnabelianGeometryAndNonabelianChabauty:NC.2 — not_read

- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/40: The universal unipotent connection on Y (Published §4.2, (21), p.910). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/41: Theorem 4.2 (Kim): universality (Published Theorem 4.2, p.910 (arXiv v1 Theorem 4.1)). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/42: Lemma 4.3: the trivialisation respects composition (Published (22)–(24), Lemma 4.3, p.911). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/43: Corollary 4.4 (Published Corollary 4.4, pp.911–912). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/44: Filtered connections (Published §4.3, p.912). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/45: Theorem 4.5 (Hadian) (Published Theorem 4.5, Remark 4.6, pp.912–913 (arXiv v1 Theorem 4.4)). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/54: Unipotent isocrystals and the Frobenius structure (Published §5.1, (37), pp.918–919). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/55: Lemma 5.2 (Published Lemma 5.2, (38), p.919). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/56: Theorem 5.3 (Chiarellotto–Le Stum) (Published Theorem 5.3, p.920 (arXiv v1 Theorem A.7)). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/57: Frobenius operators on de Rham path torsors (Published §5.2, (42), pp.920–921). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/67: Unipotent Tannakian categories and the universal objects A_n(C, ω) (Published §A.1, Definition A.1, pp.934–935). Use correction E10: invariant-vector condition only for nonzero objects; primary proof not freshly read here. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/68: Universal pointed objects (Published Definition A.2, p.935). Use correction E9: unique filtration/point-preserving universal morphism; primary proof not freshly read here. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/69: Lemma A.3 (Published Lemma A.3, p.935). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/70: Path torsors of the universal objects (Lemma A.4) (Published §A.1.2, Lemma A.4, pp.936–937). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/63: Olsson's non-abelian comparison (Published proof of Lemma 5.4, p.923 (arXiv v1 Theorem A.8)). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/58: Local iterated-integral word expansion (40) (Published §5.2.1, (40), p.921 (arXiv v1 §5.1, (20))). Import ColemanIntegration:L1/word-algebra-local-expansion for (40); not the global path-torsor bridge. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/93: Tannakian path transport and Besser’s global Frobenius path (Published §5.2.1, (39),(41), p.921; Lemma 4.3 p.910; Theorem 5.3 pp.919–920; Besser, arXiv:math/0011269, Theorem 3.1 and Corollaries 3.2–3.3, pp.7–9). Own the missing global identification (41)/Besser bridge in NC.2, importing L1 rather than rebuilding integrals. No corresponding node is claimed complete.

### PAPER-CHEN-24 → AnabelianGeometryAndNonabelianChabauty:NC.0 — not_read

- PAPER-CHEN-24/57. Tangential specialization/inertia orbit bijection for finite ramified curves, functorial in covers; catalogue corrected contract read, primary proof not freshly read. Import analytic-to-algebraically-closed-char-zero transfer /129. No corresponding node is claimed complete.
- PAPER-CHEN-24/58. Good symmetric fibre-functor paths on P¹ minus {0,1,∞}, their existence and conjugation conventions; catalogue corrected contract read, primary proof not freshly read. These paths are not reconstructed by the K(π,1) predicate. No corresponding node is claimed complete.

### Néron–Severi ownership request

AbelianSchemesAndArithmeticModuli:A2: For an abelian variety A, define NS(A)=Pic(A)/Pic⁰(A), factor L↦φ_L through NS and prove its injection into symmetric Hom(A,A∨), with finite generation from the A6 Hom finite-rank result and ρ as the rank. The current A6/hom-is-free-of-finite-rank node states the NS conclusion but does not replace this A2 definition/injection. NC.5 imports these data for BDMTV /9 and its rank criterion; never rebuild NS in this packet.

For BDMTV /67 apply E10 (nonzero objects); for /68 apply E9 (unique filtration/point-preserving morphism). These corrections are taken from the catalogue's existing findings, not newly discovered or independently re-reviewed here. The extraction files and their original findings remain unchanged.


## Connecting-map continuation — codex-J6LwjP

Six new nodes separate the connecting cocycle, its image equation, right lift change, trivial-class criterion, fixed-orbit fibres and normal-kernel exactness. The preserved exact-sequence ID is now the single inclusion-kernel theorem. All twenty inherited IDs and the complete NC.0, Chen and BDMTV source inventories remain. Every new declaration, construction API and four tests has a native suggested form.

The actual quotient-set connecting map on invariant left cosets and the initial exactness at A^G and B^G still need native packaging. They remain explicit targets, recorded as an additional gap. A quotient group cannot replace a nonnormal coset space. Representability, topologies on unipotent points, central obstructions, local conditions and Selmer varieties remain open.

Fresh primary reading covers Kim arXiv:math/0409456v1, printed pp. 5–10, including the subgroup exactness passage. The PDF hash agrees with the historical receipt; earlier and later source sections were not freshly read. Topology.IsEmbedding.continuous_iff was read at the pinned Mathlib commit. Twenty-nine current link-map examined entries are negative catalogue screens, with no asserted matching dependency.

The Mathlib-only cocycle/H¹/exactness excerpt of the suggested file elaborated at the pinned Mathlib commit with zero errors, 31 sorry warnings and no other warnings. All new signatures, three construction API forms and four tests are included. The complete file was not compiled because its Tau Ceti dependency has no existing build at the required pin. Reproduction boundaries and hashes are in the handoff. This is signature validation, with admitted bodies.
