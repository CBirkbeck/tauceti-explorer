# Finite flat groups and integral p-adic Hodge theory

This is the first blueprint checkpoint. It plans stage R07.1, finite flat groups and p-divisible groups, and leaves it partial. R07.2–R07.6 are not yet read. Every declaration is a plan.

The accepted restructuring RS-02 makes this roadmap an extension of Tau Ceti's ModularCurves roadmap ('Modular curves, following Katz–Mazur, Part II: finite flat groups and integral p-adic Hodge theory') and narrows R07.1. It owns what goes beyond the anchor:

- p-divisible groups of arbitrary height, with duality, Tate modules and the tower-level connected–étale sequence;
- closures, models and Raynaud's mixed-characteristic theory: uniqueness for e < p − 1, full faithfulness with flat kernel and cokernel, Ext injectivity;
- the (p, …, p)-type (F-vector scheme) classification and its tame inertia characters;
- the required tests: multiplicative, constant, ordinary nonsplit, supersingular, and distinct integral models.

## Scope, ownership and conventions

Imported from Tau Ceti's ModularCurves roadmap, as RS-02 requires, and never planned again here:

- **Layer 0B:** the general finite locally free commutative group-scheme carrier and Cartier duality. Over an affine base Tau Ceti already has the category `FiniteLocallyFreeCommAffineGroupSchemeCat` with Cartier duality and its base change.
- **Layer 0C:** fppf quotients by finite locally free subgroups, with the Lagrange rank formula.
- **Layer 0E:** effective fpqc descent.
- **Layer 7E:** PD-2, the finite-level connected–étale sequence over a henselian local ring, with the special-fibre splitting over a perfect residue field; PD-1, the elliptic tower E[p^∞]; PD-4 and PD-5 for the supersingular tests. 7E schedules no Oort–Tate classification, so that classification is planned here.

Conventions pinned here:

- 'Finite locally free' means finite, flat and of finite presentation, as in ModularCurves 0B. A p-divisible group of height h has levels G_v of rank p^{hv}, with G_v the kernel of p^v on G_{v+1}.
- Raynaud's absolute ramification index is e = v(p) for the normalised valuation of the DVR R. The uniqueness theorem needs mixed characteristic and e < p − 1. There is no such case at p = 2, and the boundary e = p − 1 genuinely has two models (étale and multiplicative). No dyadic uniqueness statement is planned.
- F-vector schemes follow Raynaud: F has q = p^r elements, the base lies over Raynaud's Dedekind ring D ⊂ ℚ(μ_{q−1}), and condition (**) requires the eigen-sheaves of the augmentation ideal for the fundamental characters to be invertible.
- Oort–Tate pairs (a, b) satisfy ab = w_p over the ring Λ = ℤ[ζ_{p−1}, 1/(p(p−1))] ∩ ℤ_p, and G_{a,b} = Spec R[X]/(X^p − aX). Duality swaps a and b.
- Tate modules are inverse limits of generic points, T_p(G) = lim G_v(K̄). The duality is T_p(G^D) ≅ Hom(T_p(G), ℤ_p(1)).

In the suggested Lean file the imported objects are placeholders named after their owners' planned declarations, so that the statements have their final signatures.

## R07.1: finite flat groups and p-divisible groups

### p-divisible groups

#### p-divisible (Barsotti–Tate) groups of height h

Declaration: TauCeti.FiniteFlat.PDivisibleGroup (definition). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group. Planet: p-divisible groups.

Let S be a scheme and p a prime. A p-divisible group of height h over S is an inductive system G = (G_v, i_v)_{v≥0} of finite locally free (finite, flat and of finite presentation) commutative group schemes over S such that G_v has rank p^{hv} and 0 → G_v → G_{v+1} → G_{v+1} is exact, the first map being i_v and the second multiplication by p^v. A homomorphism is a compatible system of homomorphisms of the levels; equivalently Hom(G, H) = lim_v Hom(G_v, H_v).

Hypotheses: S any scheme (over an affine base Spec R the levels are objects of TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat R); p prime; h ≥ 0.

Proof or construction:

1. Definition as displayed (Tate; Stix §9.1). The levels are the finite locally free groups of ModularCurves Layer 0B (requested), in Tau Ceti's FiniteLocallyFreeCommAffineGroupSchemeCat over an affine base.
2. Homomorphisms: because the levels are the p^v-torsion (R07.1/p-divisible-level-exactness), a compatible system f_v : G_v → H_{v+t_v} lands in H_v, so Hom is the inverse limit of level homomorphisms (Stix §9.1.2).
3. Base change along S′ → S is levelwise; ranks and exactness are preserved because the levels are finite locally free.
4. The elliptic tower E[p^∞] of ModularCurves 7E PD-1 is the height-two instance; the definition here allows arbitrary height, as RS-02 requires.

The required uses are:

- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual: Dualised levelwise.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-tate-module: Its Tate module is the inverse limit of the points of its levels.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale: Split into connected and étale p-divisible groups over a henselian base.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2: Dieudonné theory classifies p-divisible groups over perfect fields.
- HodgeTateAndCanonicalSubgroups:T0: General-height p-divisible towers (RS-02 link from R07.1).
- AbelianSchemesAndArithmeticModuli:A3: The p-divisible group A[p^∞] of an abelian scheme (RS-02 link from R07.1).
- FaltingsFinitenessAndIsogenyTheorems:R28.3/closure-tower-becomes-l-divisible-only-after-a-shift: l-divisible groups over the valuation ring of a finite extension of ℚ_l (requested from R07.1).

The API supplies:

- TauCeti.FiniteFlat.PDivisibleGroup (structure): structure PDivisibleGroup (R) (p h : ℕ): levels : ℕ → FiniteLocallyFreeCommAffineGroupSchemeCat R, incl : levels v ⟶ levels (v+1), rank (levels v) = p^(h*v), exactness of 0 → G_v → G_{v+1} →[p^v] G_{v+1}.
- TauCeti.FiniteFlat.PDivisibleGroup.height (projection): The height h.
- TauCeti.FiniteFlat.PDivisibleGroup.Hom (structure): Hom G H := compatible families (f_v : G.levels v ⟶ H.levels v); ext lemma: two homomorphisms agree iff all level maps agree.
- TauCeti.FiniteFlat.PDivisibleGroup.baseChange (functoriality): Base change along R → R′, levelwise, with height preserved.
- TauCeti.FiniteFlat.PDivisibleGroup.muPInfty (constructor): μ_{p^∞} = (μ_{p^v})_v, height 1.
- TauCeti.FiniteFlat.PDivisibleGroup.constQpZp (constructor): ℚ_p/ℤ_p = ((1/p^v)ℤ/ℤ)_v constant, height 1.

Discriminating tests:

- TauCeti.FiniteFlat.PDivisibleGroup.height_muPInfty (value): μ_{p^∞} has height 1: μ_{p^v} has rank p^v.
- TauCeti.FiniteFlat.PDivisibleGroup.height_zero (degenerate): A p-divisible group of height 0 has all levels trivial.
- TauCeti.FiniteFlat.PDivisibleGroup.not_of_constant_ZpZ (non-example): The constant system G_v = ℤ/pℤ with identity transitions is not a p-divisible group: every level has rank p, which is not p^{hv} for a fixed h.
- TauCeti.FiniteFlat.PDivisibleGroup.height_constQpZp (value): The constant tower ℚ_p/ℤ_p has height 1 and is étale.
- TauCeti.FiniteFlat.PDivisibleGroup.ordinary_nonsplit (compatibility): For the Serre–Tate lift E of an ordinary elliptic curve over 𝔽̄_p with parameter q ≠ 1, the connected–étale sequence of E[p^∞] over W(𝔽̄_p) does not split (R07.1/p-divisible-connected-etale).
- TauCeti.FiniteFlat.PDivisibleGroup.supersingular_connected (value): For E over W(𝔽̄_p) with supersingular reduction, E[p^∞] is connected of height 2: its special fibre is connected (ModularCurves 7E PD-5), and over a henselian local ring a finite flat group with connected special fibre is connected.
- TauCeti.FiniteFlat.PDivisibleGroup.height_abelianScheme (compatibility): For an elliptic curve E/S, E[p^∞] (ModularCurves 7E PD-1) is a p-divisible group of height 2.

Acceptance:

- μ_{p^∞} and ℚ_p/ℤ_p have height 1 and are Cartier dual (R07.1/p-divisible-cartier-dual); A[p^∞] for an abelian scheme of relative dimension g has height 2g.

Library: `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`.

Source: Stix12-notes, §9.1, p. 54; Raynaud74, §2.3, p. 261.

#### The levels of a p-divisible group are its torsion, and multiplication by p is an epimorphism

Declaration: TauCeti.FiniteFlat.PDivisibleGroup.exact_levels (lemma). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-level-exactness.

For a p-divisible group G = (G_v) of height h over S: (i) G_{v+t}[p^v] = G_v; (ii) the sequence 0 → G_v → G_{v+t} → G_t → 0, with the second map induced by p^v, is exact; (iii) p : G → G is finite locally free and surjective (as fppf sheaves) of degree p^h.

Hypotheses: G a p-divisible group of height h.

Proof or construction:

1. (i) Induction on t from the defining exactness: G_{v+t+1}[p^v] = G_{v+t+1}[p^{v+t}] ∩ G_{v+t+1}[p^v] = G_{v+t} ∩ G_{v+t+1}[p^v] = G_{v+t}[p^v] = G_v.
2. (ii) The image of p^v on G_{v+t} is killed by p^t, so p^v factors through j : G_{v+t} → G_t. Left exactness is (i). The induced G_{v+t}/G_v → G_t is a monomorphism of finite locally free groups of the same rank p^{ht}, hence an isomorphism (a surjective endomorphism of a finitely generated module is bijective; quotients from ModularCurves Layer 0C).
3. (iii) follows from (ii) with t = 1: p is levelwise the map G_{v+1} → G_v with kernel G_1 of rank p^h.

Acceptance:

- For μ_{p^∞}: 0 → μ_{p^v} → μ_{p^{v+t}} → μ_{p^t} → 0 with the second map x ↦ x^{p^v}.

Planned prerequisites: R07.1/p-divisible-group.

Source: Stix12-notes, §9.1.1–9.1.3, Lemma 61, Proposition 62 and Corollary 64, pp. 54–55.

#### The Cartier dual of a p-divisible group

Declaration: TauCeti.FiniteFlat.PDivisibleGroup.cartierDual (construction). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual.

For a p-divisible group G = (G_v) of height h over S, its Cartier dual is G^D = (G_v^D) with transition maps the Cartier duals j_v^D : G_v^D → G_{v+1}^D of the maps j_v : G_{v+1} → G_v induced by p. G^D is a p-divisible group of height h, and G^{DD} ≅ G.

Hypotheses: G a p-divisible group of height h.

Proof or construction:

1. Levelwise Cartier duality (Tau Ceti's FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality; ModularCurves 0B) applied to the exact sequences 0 → G_1 → G_{v+1} → G_v → 0 of R07.1/p-divisible-level-exactness gives exact sequences 0 → G_v^D → G_{v+1}^D → G_1^D → 0; the ranks are p^{hv}, so G^D is p-divisible of height h.
2. Biduality levelwise gives G^{DD} ≅ G; duality commutes with base change (cartierDualBaseChangeIso).

The required uses are:

- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-tate-module: T_p(G^D) = Hom(T_p G, ℤ_p(1)).
- HodgeTateAndCanonicalSubgroups:T0: Duality of Barsotti–Tate groups.
- AbelianSchemesAndArithmeticModuli:A4: Serre–Tate imports the R07.1 p-divisible and duality data (RS-02).

The API supplies:

- TauCeti.FiniteFlat.PDivisibleGroup.cartierDual (constructor): cartierDual G : PDivisibleGroup R p h.
- TauCeti.FiniteFlat.PDivisibleGroup.cartierDual_levels (simp): (cartierDual G).levels v = (G.levels v)^D.
- TauCeti.FiniteFlat.PDivisibleGroup.cartierDualDual (equivalence): cartierDual (cartierDual G) ≅ G, naturally.
- TauCeti.FiniteFlat.PDivisibleGroup.cartierDual_baseChange (compatibility): Duality commutes with base change.

Discriminating tests:

- TauCeti.FiniteFlat.PDivisibleGroup.cartierDual_constQpZp (value): (ℚ_p/ℤ_p)^D ≅ μ_{p^∞}.
- TauCeti.FiniteFlat.PDivisibleGroup.cartierDual_height (value): The dual has the same height.
- TauCeti.FiniteFlat.PDivisibleGroup.cartierDual_transition (non-example): Using the duals of the inclusions i_v as transitions (instead of the duals of j_v) does not give a p-divisible group: for μ_{p^∞} it gives the maps ℤ/p^{v+1} → ℤ/p^v, which go the wrong way.
- TauCeti.FiniteFlat.PDivisibleGroup.cartierDual_zero (degenerate): The dual of the height-zero group is the height-zero group.

Acceptance:

- (ℚ_p/ℤ_p)^D = μ_{p^∞}; A[p^∞]^D = A^t[p^∞] for an abelian scheme A with dual A^t.

Planned prerequisites: R07.1/p-divisible-group, R07.1/p-divisible-level-exactness.

Library: `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`, `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso`.

Source: Stix12-notes, §9.3 and Example 65, p. 56.

#### The Tate module of a p-divisible group over a mixed-characteristic base

Declaration: TauCeti.FiniteFlat.PDivisibleGroup.tateModule (construction). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-tate-module.

Let R be a henselian local domain whose fraction field K has characteristic 0, and G a p-divisible group of height h over R. Its Tate module is T_p(G) = lim_v G_v(K̄), with transition maps induced by p, a free ℤ_p-module of rank h with a continuous action of Gal(K̄/K); V_p(G) = T_p(G) ⊗ ℚ_p. Cartier duality gives a perfect Galois-equivariant pairing T_p(G) × T_p(G^D) → ℤ_p(1).

Hypotheses: R henselian local domain, K = Frac R of characteristic 0 (the permitted generic-fibre regime); G of height h.

Proof or construction:

1. G_v ⊗ K is étale (characteristic 0), so G_v(K̄) ≅ (ℤ/p^vℤ)^h: by R07.1/p-divisible-level-exactness the discrete system satisfies the axioms, hence is free of rank h over ℤ/p^v at level v (Stix 9.2(2)).
2. T_p(G) = lim G_v(K̄) is free of rank h over ℤ_p; Gal(K̄/K) acts through the finite quotients Gal(K(G_v(K̄))/K), so the action is continuous for the p-adic topology.
3. Cartier duality G_v × G_v^D → μ_{p^v} gives compatible perfect pairings of the points and, in the limit, T_p(G) × T_p(G^D) → ℤ_p(1).

The required uses are:

- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6: The Galois representation of abelian torsion compared with the arithmetic carrier.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4: Breuil–Kisin classification is stated for G ↦ T_p(G).
- FaltingsFinitenessAndIsogenyTheorems:R28.2/hodge-tate-determinant-of-the-tate-module-at-a-place-above-l: The Tate module of an l-divisible group at a place above l (requested from R07.1).

The API supplies:

- TauCeti.FiniteFlat.PDivisibleGroup.tateModule (constructor): tateModule G : Type with ModuleCat ℤ_[p] structure and a continuous action of Field.absoluteGaloisGroup K.
- TauCeti.FiniteFlat.PDivisibleGroup.tateModule_free (other): Module.Free ℤ_[p] (tateModule G) and finrank = h.
- TauCeti.FiniteFlat.PDivisibleGroup.continuous_galoisAction (other): The Galois action is continuous.
- TauCeti.FiniteFlat.PDivisibleGroup.tateModule_map (functoriality): A homomorphism G → H induces a Galois-equivariant ℤ_p-linear map.
- TauCeti.FiniteFlat.PDivisibleGroup.tateModulePairing (other): The perfect pairing T_p(G) × T_p(G^D) → ℤ_p(1).

Discriminating tests:

- TauCeti.FiniteFlat.PDivisibleGroup.tateModule_muPInfty (value): T_p(μ_{p^∞}) ≅ ℤ_p(1), with Galois acting through the cyclotomic character.
- TauCeti.FiniteFlat.PDivisibleGroup.tateModule_constQpZp (value): T_p(ℚ_p/ℤ_p) ≅ ℤ_p with trivial action.
- TauCeti.FiniteFlat.PDivisibleGroup.tateModule_height_zero (degenerate): Height 0 gives the zero module.
- TauCeti.FiniteFlat.PDivisibleGroup.tateModule_not_direct_limit (non-example): The direct limit lim→ G_v(K̄) (the 'Tate comodule' ℚ_p/ℤ_p ⊗ T_p) is p-divisible torsion, not a free ℤ_p-module; a definition using it fails the freeness test.

Acceptance:

- T_p(μ_{p^∞}) = ℤ_p(1), T_p(ℚ_p/ℤ_p) = ℤ_p, and for an elliptic curve E over R with good reduction, T_p(E[p^∞]) is the p-adic Tate module of E_K.

Planned prerequisites: R07.1/p-divisible-group, R07.1/p-divisible-level-exactness, R07.1/p-divisible-cartier-dual.

Library: `PadicInt`, `Field.absoluteGaloisGroup`, `Module.Free`, `HenselianLocalRing`.

Source: Stix12-notes, §9.2(2)–(4) and (6), pp. 55–56; Stix12-notes, §11.2.2 and Corollary 85, p. 70.

#### The connected–étale sequence of a p-divisible group over a henselian local base

Declaration: TauCeti.FiniteFlat.PDivisibleGroup.connectedEtale_exact (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale. Planet: Connected–étale sequence.

Let R be a henselian local ring with residue field of characteristic p and G a p-divisible group of height h over R. The connected components G_v^0 and étale quotients G_v^{ét} of the levels form p-divisible groups G^0 and G^{ét}, of heights h^0 and h^{ét} with h^0 + h^{ét} = h, and 0 → G^0 → G → G^{ét} → 0 is exact levelwise, functorial in G and compatible with local base change of henselian local rings. Over a perfect residue field the special fibre of the sequence splits; over R the sequence need not split. In the opposite order an extension does split: for finite flat groups over R, every extension 0 → E → G → C → 0 with E étale and C connected is canonically G ≅ E × C.

Hypotheses: R henselian local with residue characteristic p.

Proof or construction:

1. Finite level: ModularCurves 7E PD-2 (requested) gives, for each finite locally free commutative G_v, the exact functorial sequence 0 → G_v^0 → G_v → G_v^{ét} → 0 with G_v^{ét} finite étale, compatible with local base change (Stix Propositions 37, 40).
2. Exactness of G ↦ G^0 and G ↦ G^{ét} on finite flat groups (Stix Proposition 40(1)) turns 0 → G_v → G_{v+1} → G_{v+1} into the corresponding sequences for G^0 and G^{ét}; the ranks are powers p^{h^0 v} and p^{h^{ét} v} by the Lagrange formula for quotients, so both are p-divisible, with h^0 + h^{ét} = h.
3. Over a perfect field the finite-level sequence splits canonically by the reduced subgroup (Stix Proposition 39); for R henselian with perfect residue field this splits the special fibre only.
4. Opposite order (Stix Proposition 40(4)): if E ⊆ G is étale with connected quotient C, then G^0 ∩ E = E^0 = 0, and G^0 → C is a monomorphism, faithfully flat by exactness of G ↦ G^0 (Proposition 40(1)); so G^0 ≅ C is a complement to E, and G → G^{ét} ≅ E is a retraction. In the connected–étale sequence itself G^0 is the sub and G^{ét} the quotient, so no splitting over R follows.

Acceptance:

- Nonsplit example: for an elliptic curve E over W(𝔽̄_p) with ordinary reduction, 0 → Ê[p^∞] → E[p^∞] → E[p^∞]^{ét} → 0 has heights 1 + 1; it is an extension of ℚ_p/ℤ_p by μ_{p^∞} whose class is the Serre–Tate parameter q(E) ∈ 1 + pW, and it splits exactly when q(E) = 1, that is, when E is the canonical lift.
- Supersingular reduction: E[p^∞] is connected, G^{ét} = 0 and h^0 = 2 (ModularCurves 7E PD-4, PD-5).
- Over ℤ_p, every extension 0 → ℤ/pℤ → G → μ_p → 0 of finite flat groups splits, G ≅ ℤ/pℤ × μ_p, while nonsplit extensions 0 → μ_p → G → ℤ/pℤ → 0 exist (for instance the Katz–Mazur groups G_ε for units ε ∉ ℤ_p^{×p}).

Planned prerequisites: R07.1/p-divisible-group, R07.1/p-divisible-level-exactness.

Library: `HenselianLocalRing`.

Source: Stix12-notes, §8.1.1, Proposition 37, p. 38; Stix12-notes, §9.2(5), p. 56; Stix12-notes, §8.1.1, Proposition 40(4), p. 39.

### Closures and finite flat models

#### Schematic closure of generic subgroups over a Dedekind base

Declaration: TauCeti.FiniteFlat.schematicClosure_flat (lemma). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/schematic-closure-of-generic-subgroups.

Let R be a Dedekind domain (a discrete valuation ring in Raynaud; the argument uses only that torsion-free R-modules are flat) with fraction field K, 𝒢 a finite flat commutative group scheme over R and H ⊆ 𝒢_K a closed subgroup scheme. The schematic closure ℋ of H in 𝒢 is a closed subgroup scheme, finite and flat over R, with ℋ_K = H; the fppf quotient 𝒢/ℋ is a finite flat R-group scheme. H ↦ ℋ is a bijection between closed subgroups of 𝒢_K and closed R-flat subgroup schemes of 𝒢, compatible with inclusions.

Hypotheses: R a Dedekind domain, for instance ℤ, ℤ[1/N] or a DVR; 𝒢 finite locally free over R.

Proof or construction:

1. On an affine open with ring 𝒜 and generic ring A = 𝒜 ⊗ K, the closure is cut out by the preimage 𝒥 of the ideal I of H; 𝒜/𝒥 ⊆ A/I is torsion free, hence flat over the Dedekind domain R; it is finitely presented as a quotient of the finitely presented R-module 𝒜 by a submodule with flat quotient.
2. Closure commutes with fibre products over R (flatness), so it takes the group law of H to one on ℋ: ℋ is a closed flat subgroup scheme, finite since 𝒢 is.
3. The quotient 𝒢/ℋ by a finite flat closed subgroup is representable and finite flat (ModularCurves Layer 0C).
4. Bijection: a closed R-flat subgroup 𝒳 ⊆ 𝒢 is the closure of 𝒳_K, since its ring embeds in its generic ring.

Acceptance:

- Over R = ℤ_p[ζ_p] take 𝒢 = ℤ/pℤ × μ_p and H ⊂ 𝒢_K the graph of the generic isomorphism ℤ/pℤ ≅ μ_p, 1 ↦ ζ_p. Its closure ℋ is a flat subgroup with generic fibre H ≅ ℤ/pℤ, and the two projections ℋ → ℤ/pℤ and ℋ → μ_p extend the identity; this is how suprema of prolongations are formed (R07.1/finite-flat-prolongations).
- The closure of the trivial subgroup is the unit section, and the closure of 𝒢_K is 𝒢, since 𝒢 is flat.

Library: `IsDiscreteValuationRing`, `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`.

Source: Raynaud74, §2.1, pp. 259–260.

#### Simple finite flat groups over a Dedekind base and Deligne's theorem

Declaration: TauCeti.FiniteFlat.isSimple_killed_by_prime (lemma). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/simple-finite-flat-groups.

(i) (Deligne) A finite locally free commutative group scheme of order m over any base is killed by m. (ii) Let R be a Dedekind domain whose fraction field K has characteristic 0 and 𝒢 a nonzero finite flat commutative R-group scheme. If 𝒢 is simple (no closed flat subgroup schemes other than 0 and 𝒢), then 𝒢 is killed by a prime ℓ and its generic Galois module 𝒢(K̄) is a simple 𝔽_ℓ[Gal(K̄/K)]-module. Conversely, closed flat subgroups of 𝒢 correspond to Galois-stable subgroups of 𝒢(K̄).

Hypotheses: (i): any base. (ii): R Dedekind, char K = 0, so 𝒢_K is étale and closed subgroups of 𝒢_K are Galois-stable subgroups of 𝒢(K̄).

Proof or construction:

1. (i) is Deligne's theorem as proved in Oort–Tate §1, by the trace (norm) map along the finite locally free G → S: the norm of the multiplication-by-translation argument for finite abstract groups.
2. (ii) Correspondence: closed subgroups of the étale 𝒢_K are the Galois-stable subgroups of 𝒢(K̄) (ModularCurves Layer 0D, field case), and R07.1/schematic-closure-of-generic-subgroups identifies these with closed flat subgroups of 𝒢.
3. If 𝒢 is simple then 𝒢(K̄) has no proper nonzero Galois-stable subgroup. For a prime ℓ dividing its order, ℓ·𝒢(K̄) is a proper Galois-stable subgroup, hence 0; so 𝒢(K̄) is an 𝔽_ℓ-vector space with a simple Galois action.
4. Multiplication by ℓ on 𝒢 vanishes generically, hence vanishes, since the ring of 𝒢 embeds in that of 𝒢_K (flatness).

The required uses are:

- SmallRamificationAndAbelianVarietyBaseCases:R25.3/simple-two-group-schemes-over-integers: Request (a) to R07.1: simple objects are killed by a prime and have simple generic Galois module.
- SmallRamificationAndAbelianVarietyBaseCases:R25.4/simple-objects-criterion: The same statement over ℤ[1/l].

Acceptance:

- Over ℤ, ℤ/pℤ and μ_p are simple (every finite flat group of prime order is), and ℤ/pℤ × μ_p is not.
- Over ℤ_p[ζ_p], the closure of the graph subgroup in ℤ/pℤ × μ_p is flat of order p, hence simple.

Planned prerequisites: R07.1/schematic-closure-of-generic-subgroups.

Library: `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`.

Source: OortTate70, §1, Theorem (Deligne), p. 4; Raynaud74, §2.1, pp. 259–260.

#### Finite flat models (prolongations) of a generic group scheme and their order

Declaration: TauCeti.FiniteFlat.Prolongation (definition). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/finite-flat-prolongations.

Let R be a DVR with fraction field K and G a finite commutative K-group scheme. A prolongation (finite flat model) of G is a finite flat R-group scheme 𝒢 with an isomorphism 𝒢_K ≅ G. 𝒢 dominates 𝒢′ (𝒢 ≥ 𝒢′) if the identity of G extends to an R-morphism 𝒢 → 𝒢′; the morphism is then unique. This is a partial order on isomorphism classes of prolongations; any two have a supremum and an infimum, and when char K = 0 and a prolongation exists there are a maximal one 𝒢⁺ and a minimal one 𝒢⁻.

Hypotheses: R a DVR; G finite commutative over K.

Proof or construction:

1. Order: identifying the rings 𝒜, 𝒜′ of 𝒢, 𝒢′ with R-subalgebras of the ring A of G, 𝒢 ≥ 𝒢′ iff 𝒜′ ⊆ 𝒜; uniqueness of the extension follows since 𝒜′ → A is injective.
2. Supremum: the schematic closure of the kernel of G × G → G, (g, g′) ↦ g − g′, in 𝒢 × 𝒢′ (R07.1/schematic-closure-of-generic-subgroups) is a prolongation dominating both, and it is the least such. Infimum: by Cartier duality.
3. Maximum when G is étale: every prolongation's ring lies in the integral closure of R in A, which is finite; combined with suprema this gives a maximum. Minimum when G is multiplicative: by duality. When char K = 0, G is étale, so both exist.

The required uses are:

- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-uniqueness: Uniqueness is the statement 𝒢⁺ = 𝒢⁻.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-boundary-case: At e = p − 1 the maximal and minimal prolongations can differ.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5: Finite-flat models of residual local representations.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6: Finite-flat model comparisons under field extension and twisting.

The API supplies:

- TauCeti.FiniteFlat.Prolongation (structure): structure Prolongation (R) (G : finite commutative K-group) : 𝒢 finite flat over R, e : 𝒢_K ≅ G.
- TauCeti.FiniteFlat.Prolongation.Dominates (relation): 𝒢 ≥ 𝒢′ iff ∃ R-morphism extending the identity; the morphism is unique.
- TauCeti.FiniteFlat.Prolongation.sup (constructor): The supremum of two prolongations (closure of the antidiagonal kernel).
- TauCeti.FiniteFlat.Prolongation.inf (constructor): The infimum, by Cartier duality.
- TauCeti.FiniteFlat.Prolongation.exists_max_min (other): If char K = 0 and a prolongation exists, a maximal and a minimal prolongation exist.

Discriminating tests:

- TauCeti.FiniteFlat.Prolongation.two_models_mu_p (value): Over ℤ_p[ζ_p], ℤ/pℤ and μ_p are nonisomorphic prolongations of the same generic group, with ℤ/pℤ ≥ μ_p.
- TauCeti.FiniteFlat.Prolongation.unique_etale_Zp (value): Over ℤ_p with p odd, ℤ/pℤ is the only prolongation of the constant group ℤ/pℤ over ℚ_p (Raynaud, e = 1 < p − 1).
- TauCeti.FiniteFlat.Prolongation.dyadic_two_models (non-example): Over ℤ_2 the constant group ℤ/2ℤ over ℚ_2 has the two prolongations ℤ/2ℤ and μ₂ (e = 1 = p − 1), so a definition asserting uniqueness of models fails at p = 2.
- TauCeti.FiniteFlat.Prolongation.self (degenerate): Every prolongation dominates itself, and the dominating morphism is the identity.

Acceptance:

- For G = ℤ/pℤ over ℚ_p(ζ_p) (so G ≅ μ_p), both ℤ/pℤ and μ_p over ℤ_p[ζ_p] are prolongations, with ℤ/pℤ ≥ μ_p strictly: two nonisomorphic integral models of one generic group.

Planned prerequisites: R07.1/schematic-closure-of-generic-subgroups.

Library: `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`, `IsDiscreteValuationRing`.

Source: Raynaud74, §2.2, Definition 2.2.1, Proposition 2.2.2 and Corollary 2.2.3, pp. 260–261.

#### Raynaud's theorem: uniqueness of finite flat models and full faithfulness when e < p − 1

Declaration: TauCeti.FiniteFlat.prolongation_unique_of_lt (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-uniqueness. Planet: Raynaud's uniqueness theorem.

Let R be a DVR of mixed characteristic (0, p) with absolute ramification index e = v(p) < p − 1, and K = Frac R. (i) Every finite commutative K-group scheme killed by a power of p has at most one finite flat prolongation over R, up to unique isomorphism. (ii) If 𝒢, ℋ are finite flat commutative R-group schemes killed by a power of p, every K-homomorphism 𝒢_K → ℋ_K extends uniquely to u : 𝒢 → ℋ, and Ker(u), Coker(u) are flat over R. (iii) Ext¹_R(𝒢, ℋ) → Ext¹_K(𝒢_K, ℋ_K) is injective.

Hypotheses: R mixed characteristic DVR with e < p − 1; in particular p ≥ 3 and there is no dyadic case.

Proof or construction:

1. By R07.1/finite-flat-prolongations it suffices that a morphism of prolongations u : 𝒢 → 𝒢′ extending the identity is an isomorphism.
2. Dévissage (Raynaud Proposition 3.2.1 and Corollary 3.3.7; R07.1/raynaud-simple-objects) reduces, after strict henselisation, to F-vector schemes of rank q = p^r.
3. For those, Raynaud's classification (R07.1/raynaud-classification) writes 𝒢, 𝒢′ with equations X_i^p = δ_i X_{i+1}, X_i′^p = δ_i′ X_{i+1}′, 0 ≤ v(δ_i), v(δ_i′) ≤ e, related generically by X_i′ = α_i X_i with δ_i′ = α_i^p δ_i α_{i+1}^{−1}. If some α_i is not a unit, taking v(α_i) ≥ 1 maximal gives v(δ_i′) ≥ p − 1 > e, a contradiction. So u is an isomorphism (Proposition 3.3.2, 2°).
4. (ii) and (iii): Corollary 3.3.6 — apply (i) to the graph of a generic homomorphism (the closure of the graph is a prolongation of 𝒢_K, hence 𝒢 itself) and to kernels and cokernels; injectivity on Ext¹ follows since an extension split generically has its generic splitting extend.

Acceptance:

- e = 1 < p − 1 for p ≥ 3: over ℤ_p (p odd), generic-fibre functor is fully faithful on finite flat p-group schemes.
- The strict inequality is essential: at e = p − 1 (for instance ℤ_2, or ℤ_p[ζ_p]) μ_p and ℤ/pℤ are two models of one generic group (R07.1/raynaud-boundary-case).

Planned prerequisites: R07.1/finite-flat-prolongations, R07.1/raynaud-classification, R07.1/raynaud-simple-objects.

Library: `IsDiscreteValuationRing`.

Source: Raynaud74, §3.3, Théorème 3.3.3, p. 268; Raynaud74, §3.3, Corollaire 3.3.6, p. 268.

#### The boundary case e = p − 1: at most two models, étale and multiplicative

Declaration: TauCeti.FiniteFlat.prolongation_boundary (lemma). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-boundary-case.

Let R be a henselian DVR of mixed characteristic with e = p − 1, and G a simple finite commutative K-group scheme killed by p with a finite flat prolongation. Then either G has a unique prolongation, or it has exactly two, one étale and one multiplicative. More generally, for G killed by a power of p the biconnected part of a prolongation does not depend on the prolongation.

Hypotheses: R henselian, mixed characteristic, e = p − 1.

Proof or construction:

1. In the analysis of Proposition 3.3.2: if the maximal and minimal prolongations differ, the case analysis with v(δ_i′) ≥ p − 1 = e forces v(α_i) = 1, v(δ_j) = 0 and v(δ_j′) = p − 1 for all j: 𝒢⁺ is étale and 𝒢⁻ is multiplicative.
2. Any prolongation 𝒢 lies between them; since R is henselian and G simple, the special fibre of 𝒢⁺ is simple, so u : 𝒢⁺ → 𝒢 is an isomorphism or zero on the special fibre, and in the latter case 𝒢 is multiplicative.
3. Remark 3.3.5: the canonical map 𝒢⁺ → 𝒢⁻ induces an isomorphism on biconnected components.

Acceptance:

- Over ℤ_2 (p = 2, e = 1) the generic group ℤ/2ℤ has the two models ℤ/2ℤ and μ₂; over ℤ_p[ζ_p] the generic μ_p has the two models ℤ/pℤ and μ_p.
- This is the reason R07.1's uniqueness row cannot dispatch to p = 2 (every p = 2 base has e ≥ 1 = p − 1).

Planned prerequisites: R07.1/finite-flat-prolongations, R07.1/raynaud-classification.

Library: `HenselianLocalRing`.

Source: Raynaud74, §3.3, Proposition 3.3.2 3°, p. 267; Raynaud74, §3.3, Remarque 3.3.5, p. 268.

### F-vector schemes and tame inertia

#### F-vector schemes of rank one (Raynaud)

Declaration: TauCeti.FiniteFlat.FVectorScheme (definition). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/f-vector-scheme.

Let F be a finite field with q = p^r elements, C = ℚ(μ_{q−1}), and D the Dedekind ring obtained from the ring of integers of C by inverting q − 1 and removing the primes above p other than a chosen prime 𝔭 (Raynaud §1.1); the fundamental characters χ_i : F^× → D^× (i ∈ ℤ/r) are those whose reduction modulo 𝔭 is a field embedding F → D/𝔭, and w ∈ D is Raynaud's constant, p times a unit. An F-vector scheme over a D-scheme S is a finite locally free commutative group scheme G over S with a ring homomorphism F → End_S(G), such that (**) the eigen-sheaves 𝓛_χ of the augmentation ideal of its algebra for the fundamental characters χ_i : F^× → D^× (i ∈ ℤ/r) are invertible O_S-modules. Its rank is then q.

Hypotheses: S a scheme over Raynaud's ring D; F finite of order q = p^r. A henselian local ring whose residue field contains 𝔽_q is a D-scheme (Raynaud §1.2, Exemples (a)).

Proof or construction:

1. Definition as displayed (Raynaud §1.2); the condition (**) holds automatically when S is connected with an étale or multiplicative fibre, in particular when S is integral with fraction field of characteristic 0 (Proposition 1.2.2).
2. Cartier duality preserves F-vector schemes (Remark 1.5.3): the dual of the system (𝓛_i, c_i, d_i) is (𝓛_i^{-1}, d_i^t, c_i^t).

The required uses are:

- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-classification: Classified by invertible sheaves and pairs of maps.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-tame-inertia: Tame inertia acts on its generic points through fundamental characters.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-simple-objects: The simple subquotients over a strictly henselian base are F-vector schemes.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5: The (p, …, p)-type classification and its tame inertia characters.

The API supplies:

- TauCeti.FiniteFlat.FVectorScheme (structure): structure FVectorScheme (F) (S) : G finite locally free commutative, act : F →+* End G, and the eigenline condition (**).
- TauCeti.FiniteFlat.FVectorScheme.rank_eq (other): rank G = card F.
- TauCeti.FiniteFlat.FVectorScheme.cartierDual (compatibility): The Cartier dual carries an F-vector scheme structure (Remark 1.5.3).
- TauCeti.FiniteFlat.FVectorScheme.of_generic_char_zero (other): Over an integral base with fraction field of characteristic 0, an F-action on a finite locally free G of rank q satisfies (**).

Discriminating tests:

- TauCeti.FiniteFlat.FVectorScheme.zModP (value): ℤ/pℤ with its 𝔽_p-action is an 𝔽_p-vector scheme; so is μ_p.
- TauCeti.FiniteFlat.FVectorScheme.supersingular_E_p (value): E[p] of a supersingular elliptic curve over W(𝔽̄_p) is an 𝔽_{p²}-vector scheme (rank p²).
- TauCeti.FiniteFlat.FVectorScheme.not_of_rank (non-example): ℤ/pℤ × ℤ/pℤ with the diagonal 𝔽_p-action is not an 𝔽_p-vector scheme in Raynaud's sense (rank p² ≠ p; its eigen-sheaves have rank 2).
- TauCeti.FiniteFlat.FVectorScheme.cartierDual_zModP (degenerate): The Cartier dual of the 𝔽_p-vector scheme ℤ/pℤ is μ_p.

Acceptance:

- For F = 𝔽_p the F-vector schemes are exactly the group schemes of order p of Oort–Tate (R07.1/oort-tate-classification).
- E[p] for a supersingular elliptic curve over an unramified strictly henselian DVR is an 𝔽_{p²}-vector scheme with equation X^{p²} = pX (Raynaud's example after 3.4.7).

Library: `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`.

Source: Raynaud74, §1.2, condition (**) and Proposition 1.2.2, pp. 246–247.

#### Raynaud's classification of F-vector schemes

Declaration: TauCeti.FiniteFlat.FVectorScheme.classification (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-classification. Planet: Raynaud's classification.

Over a D-scheme S, isomorphism classes of F-vector schemes satisfying (**) correspond to isomorphism classes of systems (𝓛_i, c_i, d_i)_{i∈ℤ/r} of invertible O_S-modules with maps c_i : 𝓛_{i+1} → 𝓛_i^{⊗p} and d_i : 𝓛_i^{⊗p} → 𝓛_{i+1} such that d_i ∘ c_i = w·id. Over a local ring R this is the data of r pairs (γ_i, δ_i) ∈ R² with γ_i δ_i = w, the group having equations X_i^p = δ_i X_{i+1}, with (γ_i, δ_i) ~ (u_i^{−p} u_{i+1} γ_i, u_i^p u_{i+1}^{−1} δ_i) for units u_i. Over a strictly henselian DVR of mixed characteristic with absolute ramification e, the classes are in bijection with families (n_i) of integers with 0 ≤ n_i ≤ e, via n_i = v(δ_i).

Hypotheses: S a D-scheme; for the last assertion, R strictly henselian of mixed characteristic.

Proof or construction:

1. Raynaud Theorem 1.4.1: from G one reads the eigenline sheaves 𝓛_i = 𝓛_{χ_i} and the maps c_i, d_i induced by comultiplication and the p-th power; conversely the universal case over E = D[U_i, V_i]/(U_i V_i − w) is constructed and checked after the faithfully flat extension E′ trivialising it (Lemma 1.4.2).
2. Corollary 1.5.1: over a local ring every 𝓛_i is free, giving the pairs and the equations, with the stated equivalence.
3. Corollary 1.5.2: over a strictly henselian DVR, v(δ_i) ∈ [0, e] because γ_i δ_i = w has valuation e; two families with the same valuations are isomorphic because u_{i+1} can be solved from u_i^{q−1} = (unit) by henselianity.

Acceptance:

- r = 1 recovers the Oort–Tate classification (R07.1/oort-tate-classification).
- Over W(𝔽̄_p) (strictly henselian, e = 1), F-vector schemes of rank q are classified by r-tuples of 0s and 1s: q = p gives the two schemes ℤ/pℤ (n = 0) and μ_p (n = 1), and for q = p² the tuple (1, 0) is the E[p] of Raynaud's supersingular example.

Planned prerequisites: R07.1/f-vector-scheme.

Source: Raynaud74, §1.4, Théorème 1.4.1, p. 255; Raynaud74, §1.5, Corollaires 1.5.1–1.5.2, pp. 257–258.

#### Over a strictly henselian base the Jordan–Hölder factors are F-vector schemes

Declaration: TauCeti.FiniteFlat.exists_fVector_composition (lemma). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-simple-objects.

Let R be a strictly henselian DVR of mixed characteristic with e ≤ p − 1, and 𝒢 a finite flat commutative R-group scheme killed by a power of p. Then 𝒢 has a composition series by closed flat subgroup schemes whose successive quotients carry structures of F_i-vector schemes for suitable finite fields F_i. Generically, every Jordan–Hölder quotient of a finite commutative K-group killed by a power of p that is étale or multiplicative is an F-vector scheme satisfying (**).

Hypotheses: R strictly henselian mixed characteristic DVR, e ≤ p − 1 for the integral statement.

Proof or construction:

1. Generic statement (Proposition 3.2.1): a simple étale Galois module of p-power order is killed by p; since inertia acts through the abelian tame quotient on it (strict henselianity), its commutant is a finite field F over which it has dimension 1, and it is an F-vector scheme satisfying (**) (Proposition 1.2.2); the multiplicative case follows by duality.
2. Integral statement (Corollary 3.3.7): close up a generic Jordan–Hölder filtration (R07.1/schematic-closure-of-generic-subgroups); for e ≤ p − 1 the F-structure extends to the maximal and minimal prolongations (Proposition 3.3.1) and, by the analysis of Proposition 3.3.2, to every prolongation of a simple F-vector scheme.

Acceptance:

- For E[p] with supersingular reduction over W(𝔽̄_p), the only composition series is E[p] itself, an 𝔽_{p²}-vector scheme; with ordinary reduction, μ_p ⊂ E[p] → ℤ/pℤ.

Planned prerequisites: R07.1/f-vector-scheme, R07.1/schematic-closure-of-generic-subgroups, R07.1/finite-flat-prolongations.

Source: Raynaud74, §3.2, Proposition 3.2.1, p. 265; Raynaud74, §3.3, Corollaire 3.3.7, p. 268.

#### Tame inertia on finite flat group schemes: Raynaud's exponent bound

Declaration: TauCeti.FiniteFlat.tameInertia_exponents_le (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-tame-inertia. Planet: Raynaud's tame inertia bound.

Let R be a strictly henselian DVR of mixed characteristic (0, p) with absolute ramification e and K = Frac R. (i) If G is a K-F-vector scheme with equations X_i^p = δ_i X_{i+1} (F of order q = p^r), then Gal(K̄/K) acts on the F-line G(K̄) by homotheties through the tame character ψ = ψ_i^{n_i} ψ_{i+1}^{n_{i+1}} ⋯ ψ_{i+r−1}^{n_{i+r−1}} with n_j = v(δ_j), where ψ_j are the fundamental characters of level r. (ii) Such G extends to a finite flat R-group scheme if and only if ψ can be written this way with 0 ≤ n_j ≤ e for all j. (iii) Consequently, for any finite flat commutative R-group scheme killed by a power of p, every Jordan–Hölder quotient of G(K̄) is an F-line on which tame inertia acts by ψ_1^{n_1} ⋯ ψ_r^{n_r} with 0 ≤ n_j ≤ e.

Hypotheses: R strictly henselian, mixed characteristic, absolute ramification e.

Proof or construction:

1. (i) Eliminating X_j (j ≠ i) from the equations, the points are the solutions of X_i^{q−1} = a_i with a_i = δ_i^{p^{r−1}} δ_{i+1}^{p^{r−2}} ⋯ δ_{i−1}; G is trivialised by the tame extension of degree q − 1, and σ ∈ I acts on a nonzero root x by σ(x) = j(σ)^{v(a_i)} x (Theorem 3.4.1).
2. (ii) If G extends, the F-structure extends (Proposition 3.3.2) and the integral equations force 0 ≤ v(δ_j) ≤ e (R07.1/raynaud-classification); conversely such δ_j define an integral model (Theorem 3.4.3).
3. (iii) Combine (ii) with R07.1/raynaud-simple-objects (Corollary 3.4.4).

Acceptance:

- For μ_p over ℤ_p (e = 1, r = 1, n = 1) inertia acts by ψ = ω, the mod-p cyclotomic character; for ℤ/pℤ, n = 0.
- For e ≥ p − 1 the bound says nothing (Remark 3.4.6): every tame character of level r has such a form, and every F-vector scheme over K extends.

Planned prerequisites: R07.1/f-vector-scheme, R07.1/raynaud-classification, R07.1/raynaud-simple-objects.

Library: `Field.absoluteGaloisGroup`.

Source: Raynaud74, §3.4, Théorème 3.4.1, pp. 269–270; Raynaud74, §3.4, Théorème 3.4.3 and Corollaire 3.4.4, p. 270.

### Groups of prime order

#### The Oort–Tate classification of group schemes of prime order

Declaration: TauCeti.FiniteFlat.oortTate_classification (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/oort-tate-classification. Planet: Oort–Tate classification.

Let Λ = ℤ[ζ_{p−1}, 1/(p(p−1))] ∩ ℤ_p and w_p ∈ Λ Oort–Tate's constant (w_p = p·unit). For a Λ-scheme S, isomorphism classes of finite locally free group schemes of order p over S correspond to isomorphism classes of triples (L, a, b) with L an invertible O_S-module, a ∈ Γ(S, L^{⊗(p−1)}), b ∈ Γ(S, L^{⊗(1−p)}) and a ⊗ b = w_p. Over a Λ-algebra R with Pic R = 0 the group is G_{a,b} = Spec R[X]/(X^p − aX), with G_{a,b} ≅ G_{c,d} iff (c, d) = (u^{p−1}a, u^{1−p}b) for a unit u, and the Cartier dual of G_{a,b} is G_{b,a}.

Hypotheses: S a Λ-scheme. Λ ⊂ ℤ_p, so ℤ_p-schemes are Λ-schemes; for p = 2, Λ = ℤ and every scheme is a Λ-scheme.

Proof or construction:

1. Every group of order p is commutative, and its augmentation ideal decomposes under the action of 𝔽_p^× ⊂ Λ into eigensheaves I_j = I_1^{⊗j} (Oort–Tate Lemma 3); this is the case F = 𝔽_p of R07.1/raynaud-classification.
2. The algebra and coalgebra structures are determined by the triple (L, a, a′) with a ⊗ a′ = w_p (Theorem 2 and its proof), the group law being recovered from the Cartier pairing; every triple arises, by the universal construction over Λ[A, B]/(AB − w_p).
3. Over a local ring (Stix Theorem 60): L is free, giving (a, b) with ab = w_p up to (u^{p−1}a, u^{1−p}b); duality swaps a and b.

Acceptance:

- Over ℤ_p, v(w_p) = 1, so one of a, b is a unit: every group of order p is étale (a a unit) or multiplicative (b a unit), and since ℤ_p^×/(ℤ_p^×)^{p−1} ≅ 𝔽_p^× there are p − 1 of each, the unramified twists of ℤ/pℤ = G_{1,w_p} and of μ_p = G_{w_p,1}. Over W(𝔽̄_p) only ℤ/pℤ and μ_p remain. Over ℤ with p = 2 (Λ = ℤ, u = ±1 acts by (a, b) ↦ (ua, ub)), exactly ℤ/2ℤ and μ₂.
- Over 𝔽_p (a Λ-algebra, where w_p = 0) the pairs (a, b) = (1, 0), (0, 1), (0, 0) give ℤ/pℤ, μ_p and α_p; α_p has no finite flat lift to ℤ_p, since its pair would need ab = w_p with both a and b in the maximal ideal, which forces v(w_p) = v(p) ≥ 2.

Planned prerequisites: R07.1/raynaud-classification, R07.1/f-vector-scheme.

Source: OortTate70, §3, Theorem 2, p. 12; Stix12-notes, §8.4, Theorem 60, p. 53.

#### Group schemes of order p over rings of integers: Oort–Tate Theorem 3

Declaration: TauCeti.FiniteFlat.oortTate_numberRing (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/oort-tate-over-number-rings.

Let K be a number field, R ⊆ K an integrally closed subring with fraction field K (for instance ℤ or ℤ[1/N]), M the set of maximal ideals of R and M_p ⊆ M those above p. (i) (Lemma 4) An R-group of order p is the same as its generic fibre H over K together with, for each 𝔭 ∈ M, an R_𝔭-group of order p (R_𝔭 the completion) with generic fibre H ⊗ K_𝔭: the square of isomorphism-class sets E(R) → ∏ E(R_𝔭) over E(K) → ∏ E(K_𝔭) is cartesian. (ii) (Theorem 3) R-groups of order p correspond to systems (χ, (n_𝔭)_{𝔭∈M_p}) of a continuous character χ : C_K → 𝔽_p^× of the idele class group and integers 0 ≤ n_𝔭 ≤ v_𝔭(p), with χ unramified at every 𝔭 ∈ M − M_p and χ_𝔭(u) = N_{k_𝔭/𝔽_p}(ū)^{−n_𝔭} for u ∈ U_𝔭, 𝔭 ∈ M_p. (iii) (Artin–Mazur) Over ℤ the only group schemes of order p are ℤ/pℤ and μ_p.

Hypotheses: K a number field; R integrally closed with fraction field K.

Proof or construction:

1. (i) Lemma 4: a finite flat R-group is determined by its generic fibre and its completions (fpqc gluing, ModularCurves Layer 0E), and away from p every R_𝔭-group of order p is étale (order invertible; Oort–Tate Lemma 5), so determined by an unramified Galois character.
2. (ii) Lemma 6 identifies E(K), E(K_𝔭) and E(R_𝔭) (𝔭 ∉ M_p) with continuous characters of G_K, K_𝔭^× and K_𝔭^×/U_𝔭 into 𝔽_p^× through the reciprocity maps (global and local class field theory, Tau Ceti ClassFieldTheory); at 𝔭 ∈ M_p, R07.1/oort-tate-classification over the complete local R_𝔭 gives the pair (a, b), and n_𝔭 = v_𝔭(a); Lemma 7 computes the local character of the generic fibre by the tame norm residue symbol, giving condition (ii).
3. (iii) Over ℤ: C_ℚ characters unramified outside p are powers of the mod-p cyclotomic character ω; condition (ii) at p with 0 ≤ n ≤ 1 leaves χ = 1, n = 0 (ℤ/pℤ) and χ = ω, n = 1 (μ_p).

The required uses are:

- SmallRamificationAndAbelianVarietyBaseCases:R25.3/simple-two-group-schemes-over-integers: Request (b) to R07.1: groups of prime order over ℤ and ℤ[1/N].
- SmallRamificationAndAbelianVarietyBaseCases:R25.4/ext-mu-p-by-z-mod-p-over-z-one-over-l: The simple objects of order p over ℤ[1/l].

Acceptance:

- Over ℤ: exactly ℤ/pℤ and μ_p. Over ℤ[1/2] with p = 3 there are exactly eight: χ ∈ {1, χ_{−4}, χ_8, χ_{−8}} with n = 0 and χ ∈ ω·{1, χ_{−4}, χ_8, χ_{−8}} with n = 1, where χ_d is the quadratic character of ℚ(√d) and ω the mod-3 cyclotomic character.
- The integers n_𝔭 recover the local Oort–Tate pairs: G_𝔭 is étale iff n_𝔭 = 0 and multiplicative iff n_𝔭 = v_𝔭(p).

Planned prerequisites: R07.1/oort-tate-classification, R07.1/simple-finite-flat-groups.

Source: OortTate70, §3, Theorem 3, p. 20; OortTate70, §3, Lemma 4, p. 17; OortTate70, Introduction, pp. 1–2.

## Requests

- **tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality**: The general finite locally free commutative group-scheme category with constant and diagonalizable groups, kernels with base change, and Cartier duality with evaluation, biduality, rank and base change (RS-02: 'use the unchanged … carrier'); Tau Ceti already has the Hopf-algebra and affine-group-scheme Cartier duality. Needed by: R07.1/p-divisible-group, R07.1/p-divisible-cartier-dual, R07.1/f-vector-scheme.
- **tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors**: The fppf quotient of a finite locally free group scheme by a closed finite locally free subgroup, representable and finite locally free, with the Lagrange rank formula. Needed by: R07.1/p-divisible-level-exactness, R07.1/schematic-closure-of-generic-subgroups.
- **tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out**: Effective fpqc descent for finite locally free group schemes and their homomorphisms, used for base change of p-divisible groups and of F-vector schemes. Needed by: R07.1/p-divisible-group, R07.1/raynaud-classification.
- **tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups**: PD-2: the finite-level connected–étale sequence over a henselian local ring, functorial and compatible with local base change, with the special-fibre splitting over a perfect residue field; and PD-1/PD-4/PD-5 for the elliptic tests (E[p^∞], supersingular connectedness). Needed by: R07.1/p-divisible-connected-etale, R07.1/p-divisible-group.

## Coverage

- **R07.1** (partial):
  - Tate's theorem (homomorphisms of p-divisible groups over a complete mixed-characteristic DVR are determined by their generic fibres) with its Hodge–Tate inputs, and Raynaud's Proposition 2.3.1 (a generic p-divisible group whose levels all extend has a unique p-divisible extension), which rests on it.
  - SmallRamificationAndAbelianVarietyBaseCases request (c) and (g): the gluing equivalence between finite flat group schemes over ℤ[1/N] and triples over ℤ[1/pN], ℤ_p and ℚ_p, with its Hom–Ext¹ sequence (Schoof, Math. Ann. 325 (2003), Proposition 2.4); this checkpoint plans only the order-p case (Oort–Tate Lemma 4).
  - SmallRamificationAndAbelianVarietyBaseCases request (e): étale group schemes over ℤ[1/N] as π₁(Spec ℤ[1/N])-modules, extending the field case of ModularCurves Layer 0D.
  - SmallRamificationAndAbelianVarietyBaseCases request (f): the Katz–Mazur groups G_ε over ℤ[1/l] (Interlude 8.7) and the twisted constant schemes V(ρ).
  - FaltingsFinitenessAndIsogenyTheorems request: the dimension of the connected part of an l-divisible group, and the finite part of a quasi-finite separated flat commutative group scheme over a henselian valuation ring.
- **R07.2** (not_read):
  - Dieudonné theory (RS-02 narrowing: the actual Dieudonné crystal of finite flat and p-divisible groups over perfect bases, and the consolidated Grothendieck–Messing equivalence).
- **R07.3** (not_read):
  - Fontaine–Laffaille theory with the [0, p − 2] and restricted [0, p − 1] ranges.
- **R07.4** (not_read):
  - Breuil–Kisin modules, including the dyadic theorem.
- **R07.5** (not_read):
  - Local residual types and Serre-weight finite-flat calculations.
- **R07.6** (not_read):
  - Fontaine's ramification bound (Théorème A of Il n'y a pas de variété abélienne sur Z) with the convention translation, the local deformation calculations and the abelian-torsion comparison. Fontaine's paper is behind a login; Yoshida (arXiv:0905.1171) characterises the bound through Fontaine's property (P_m), and a public proof of the (P_m) step for finite flat group schemes is still to be found.

## Sources

- **Raynaud74**: Michel Raynaud, *Schémas en groupes de type (p, …, p)*, Bull. Soc. Math. France 102 (1974), 241–280, Numdam copy (journal page = PDF page + 239); accessed 2026-09-28. <https://www.numdam.org/item/BSMF_1974__102__241_0/>, sha256 `05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe`.
  - Read: §1.2–1.5 (pp. 246–259): F-vector schemes, condition (**), Theorem 1.4.1, Corollaries 1.5.1–1.5.2 and Remarks 1.5.3–1.5.4.
  - Read: §2 (pp. 259–263): schematic closure, the order on prolongations (Proposition 2.2.2, Corollary 2.2.3) and Proposition 2.3.1.
  - Read: §3 (pp. 264–271): Proposition 3.2.1, §3.3 (Propositions 3.3.1–3.3.2, Theorem 3.3.3, Remarks 3.3.4–3.3.5, Corollaries 3.3.6–3.3.7) and §3.4 (Theorems 3.4.1, 3.4.3, Corollary 3.4.4, Remarks 3.4.2, 3.4.5–3.4.7 and the example).
- **OortTate70**: Frans Oort and John Tate, *Group schemes of prime order*, Ann. Sci. École Norm. Sup. (4) 3 (1970), 1–21, Numdam copy; accessed 2026-09-28. <https://www.numdam.org/item/ASENS_1970_4_3_1_1_0/>, sha256 `064cec666ea2082bc23ec5748b7b6db2fe01feb7f83f8afd04736e78bc44fa5a`.
  - Read: §§1–3 (pp. 1–15): the ring Λ, the constants w_p, Theorem 2 and its proof, and the remarks after it.
- **Stix12-notes**: Jakob Stix, *A course on finite flat group schemes and p-divisible groups*, Course notes, Heidelberg 2009, revised 18 September 2012, author-hosted PDF (76 pp.); accessed 2026-09-28. <https://www.math.uni-frankfurt.de/~stix/skripte/STIXfinflatGrpschemes20120918.pdf>, sha256 `6a618eb8c6d9ab59e91b2b3edf2a63e7a637fbabf547c0ba7ad0849e39bae489`.
  - Read: §8.1 (pp. 38–40): Lemma 36, Propositions 37, 39, 40 (connected–étale sequence over a henselian base).
  - Read: §8.4 (pp. 50–53): Theorem 60 (Oort–Tate).
  - Read: §9 (pp. 54–56): the definition of p-divisible groups, Lemma 61, Proposition 62, Corollary 64, examples 9.2(1)–(6), Cartier duality 9.3 and Example 65.
  - Read: §11.3 (p. 70): Corollary 85.
