# Finite flat groups and integral p-adic Hodge theory

This is the second blueprint checkpoint. Stage R07.1, finite flat groups and p-divisible groups, is closed; R07.2–R07.6 are not yet read. Every declaration is a plan.

The accepted restructuring RS-02 makes this roadmap an extension of Tau Ceti's ModularCurves roadmap ('Modular curves, following Katz–Mazur, Part II: finite flat groups and integral p-adic Hodge theory') and narrows R07.1. It owns what goes beyond the anchor:

- p-divisible groups of arbitrary height, with duality, Tate modules and the tower-level connected–étale sequence;
- closures, models and Raynaud's mixed-characteristic theory: uniqueness for e < p − 1, full faithfulness with flat kernel and cokernel, Ext injectivity;
- the (p, …, p)-type (F-vector scheme) classification and its tame inertia characters;
- the required tests: multiplicative, constant, ordinary nonsplit, supersingular, and distinct integral models.

R07.1 also plans what other roadmaps have requested of it:

- formal Lie groups, the dimension of a p-divisible group, Tate's Hodge–Tate decomposition and Tate's generic-fibre theorem, with the closure-after-a-shift lemma (FaltingsFinitenessAndIsogenyTheorems R28.2–R28.3, and the Breuil–Kisin stage R07.4);
- the finite part of a quasi-finite group over a henselian base (FaltingsFinitenessAndIsogenyTheorems);
- finite étale groups over ℤ[1/N] as Galois modules, the gluing equivalence with its Mayer–Vietoris sequence, and the Katz–Mazur groups (SmallRamificationAndAbelianVarietyBaseCases R25.3–R25.4).

## Scope, ownership and conventions

Imported from Tau Ceti's ModularCurves roadmap, as RS-02 requires, and never planned again here:

- **Layer 0B:** the general finite locally free commutative group-scheme carrier and Cartier duality. Over an affine base Tau Ceti already has the category `FiniteLocallyFreeCommAffineGroupSchemeCat` with Cartier duality and its base change.
- **Layer 0C:** fppf quotients by finite locally free subgroups, with the Lagrange rank formula.
- **Layer 0E:** effective fpqc descent.
- **Layer 7E:** PD-2, the finite-level connected–étale sequence over a henselian local ring, with the special-fibre splitting over a perfect residue field; PD-1, the elliptic tower E[p^∞]; PD-4 and PD-5 for the supersingular tests. 7E schedules no Oort–Tate classification, so that classification is planned here.
- **Elsewhere in the atlas:** Tate–Sen, the Galois cohomology of C (PadicHodgeTheory R06.1), and SGA 1's Galois theory of finite étale covers of a connected scheme (InverseGaloisAndArithmeticFundamentalGroups IG.0).

Conventions pinned here:

- 'Finite locally free' means finite, flat and of finite presentation, as in ModularCurves 0B. A p-divisible group of height h has levels G_v of rank p^{hv}, with G_v the kernel of p^v on G_{v+1}.
- Raynaud's absolute ramification index is e = v(p) for the normalised valuation of the DVR R. The uniqueness theorem needs mixed characteristic and e < p − 1. There is no such case at p = 2, and the boundary e = p − 1 genuinely has two models (étale and multiplicative). No dyadic uniqueness statement is planned.
- F-vector schemes follow Raynaud: F has q = p^r elements, the base lies over Raynaud's Dedekind ring D ⊂ ℚ(μ_{q−1}), and condition (**) requires the eigen-sheaves of the augmentation ideal for the fundamental characters to be invertible.
- Oort–Tate pairs (a, b) satisfy ab = w_p over the ring Λ = ℤ[ζ_{p−1}, 1/(p(p−1))] ∩ ℤ_p, and G_{a,b} = Spec R[X]/(X^p − aX). Duality swaps a and b.
- Tate modules are inverse limits of generic points, T_p(G) = lim G_v(K̄). The duality is T_p(G^D) ≅ Hom(T_p(G), ℤ_p(1)).
- The dimension of a p-divisible group is that of the formal Lie group of its connected part (Tate), so dim μ_{p^∞} = 1 and dim ℚ_p/ℤ_p = 0. Hodge–Tate weight 1 has multiplicity dim G.
- An extension of G by H is an exact sequence 0 → H → X → G → 0; Ext¹(G, H) classifies them.

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

Declaration: TauCeti.FiniteFlat.PDivisibleGroup.connectedEtale_exact (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale.

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

### Formal Lie groups, dimension and Tate's theorems

#### Commutative formal Lie groups, their dimension and p-divisibility

Declaration: TauCeti.FiniteFlat.FormalLieGroup (definition). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/formal-lie-group.

Let Λ be a complete noetherian local ring. A commutative formal Lie group of dimension n over Λ is Spf Λ⟦X_1, …, X_n⟧ with a group law given by an n-tuple of power series Φ(X, Y) ∈ Λ⟦X, Y⟧^n satisfying Φ(X, Φ(Y, Z)) = Φ(Φ(X, Y), Z), Φ(X, 0) = X = Φ(0, X) and Φ(X, Y) = Φ(Y, X); homomorphisms are n′-tuples of power series without constant term compatible with the laws. It is p-divisible if [p]^* : Λ⟦X⟧ → Λ⟦X⟧ makes Λ⟦X⟧ a free module of finite rank over itself; the rank is then p^h, h the height.

Hypotheses: Λ complete noetherian local; p a prime (p-divisibility is nontrivial only when the residue characteristic is p).

Proof or construction:

1. Definition as displayed (Stix §10.2.2): connected and formally smooth with a unit section is equivalent to the coordinate ring being Λ⟦X_1, …, X_n⟧, and n is the rank of I/I² for the augmentation ideal I, so the dimension is well defined.
2. The inverse exists automatically: the left inverse λ(X) is built degree by degree, λ_{m+1} = λ_m − Φ(λ_m(X), X) modulo degree m + 2 (Stix §10.2.2), and it equals the right inverse.
3. [p]^* is finite flat of degree p^h; its kernel is a connected finite flat group because it is represented by a quotient of Λ⟦X⟧ (Stix §10.3).

The required uses are:

- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/serre-tate-connected-p-divisible: The formal side of the equivalence.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-dimension: The dimension of a p-divisible group is that of the formal Lie group of its connected part.
- FaltingsFinitenessAndIsogenyTheorems:R28.2/inertia-triviality-on-the-quotient-by-the-l-divisible-group-of-the-formal-completion: The formal group Â and its l-divisible part (requested from R07.1).

The API supplies:

- TauCeti.FiniteFlat.FormalLieGroup (structure): structure FormalLieGroup (Λ) (n : ℕ) : law : Fin n → MvPowerSeries (Fin n ⊕ Fin n) Λ with associativity, unit and commutativity axioms.
- TauCeti.FiniteFlat.FormalLieGroup.dim (projection): The dimension n.
- TauCeti.FiniteFlat.FormalLieGroup.inv (constructor): The formal inverse, with Φ(X, inv X) = 0.
- TauCeti.FiniteFlat.FormalLieGroup.mulP (constructor): [p] : the p-fold sum, an endomorphism.
- TauCeti.FiniteFlat.FormalLieGroup.IsPDivisible (characterisation): [p]^* makes Λ⟦X⟧ free of finite rank over itself.
- TauCeti.FiniteFlat.FormalLieGroup.height (projection): log_p of the rank of [p]^*, for a p-divisible formal Lie group.

Discriminating tests:

- TauCeti.FiniteFlat.FormalLieGroup.dim_multiplicative (value): Ĝ_m = (X + Y + XY) has dimension 1, and height 1 over ℤ_p.
- TauCeti.FiniteFlat.FormalLieGroup.not_isPDivisible_additive (non-example): Over 𝔽_p, Ĝ_a (X + Y) is not p-divisible: [p] = 0 is not finite.
- TauCeti.FiniteFlat.FormalLieGroup.dim_zero (degenerate): The zero-dimensional formal Lie group is Spf Λ, of height 0.
- TauCeti.FiniteFlat.FormalLieGroup.height_elliptic (compatibility): For E over W(𝔽̄_p), Ê has dimension 1 and height 1 (ordinary) or 2 (supersingular) (ModularCurves 7E PD-5).

Acceptance:

- Ĝ_m (Φ = X + Y + XY) has dimension 1 and, over a base of residue characteristic p, height 1; the formal group Ê of an elliptic curve has dimension 1 and height 1 (ordinary) or 2 (supersingular).

Library: `MvPowerSeries`, `IsAdicComplete`, `IsNoetherianRing`, `IsLocalRing`.

Source: Stix12-notes, §10.2.2, p. 59; Stix12-notes, §10.3, p. 60.

#### Connected p-divisible groups are p-divisible formal Lie groups

Declaration: TauCeti.FiniteFlat.PDivisibleGroup.equivFormalLieGroup (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/serre-tate-connected-p-divisible.

Let Λ be a complete noetherian local ring with residue field of characteristic p > 0. The functor 𝒢 ↦ 𝒢[p^∞] = (ker [p^v])_v is an equivalence between p-divisible commutative formal Lie groups over Λ and connected p-divisible groups over Λ, preserving height. Its inverse sends G = (Spec A_v) to Spf(lim A_v), whose coordinate ring is Λ⟦X_1, …, X_n⟧.

Hypotheses: Λ complete noetherian local with residue characteristic p.

Proof or construction:

1. For 𝒢 = Spf Λ⟦X⟧ p-divisible of height h: [p]^v is finite flat of degree p^{hv}, so 𝒢[p^v] is connected finite flat of order p^{hv} and 0 → 𝒢[p^v] → 𝒢[p^{v+1}] → 𝒢[p^{v+1}] is exact.
2. Fully faithful: [p](I) ⊆ pI + I² ⊆ MI, so [p]^v(I) → 0 M-adically and Λ⟦X⟧ = lim A_v; hence Hom(𝒢, 𝒢′) = lim Hom(A′_v, A_v) = Hom(𝒢[p^∞], 𝒢′[p^∞]) (Tate Proposition 1, Stix Theorem 70).
3. Essentially surjective: for connected G, A = lim A_v is Λ-flat and its reduction modulo m is lim of the Frobenius kernels H_v = ker F^v; the augmentation ideals satisfy I_v/I_v² ≅ I_1/I_1², so k⟦X_1, …, X_n⟧ → A/mA is surjective, and a count of orders (#H_v = p^{nv}, from the structure of Frobenius height one, Stix Proposition 48) makes it bijective; lift to Λ by Nakayama and flatness.

Acceptance:

- μ_{p^∞} ↔ Ĝ_m: lim Λ[T]/(T^{p^n} − 1) = Λ⟦X⟧ with T = 1 + X.
- For E over W(𝔽̄_p), E[p^∞]^0 ↔ Ê, of height 1 (ordinary) or 2 (supersingular).

Planned prerequisites: R07.1/formal-lie-group.

Library: `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`.

Source: Tate67, (2.2), Proposition 1, p. 162; Stix12-notes, §10.3.1, Theorem 70, pp. 60–62.

#### The dimension of a p-divisible group

Declaration: TauCeti.FiniteFlat.PDivisibleGroup.dim (definition). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-dimension.

Let Λ be a complete noetherian local ring with residue field of characteristic p and G a p-divisible group over Λ. The dimension dim G is the dimension of the p-divisible formal Lie group attached to the connected part G^0 (R07.1/serre-tate-connected-p-divisible). It is unchanged by reduction modulo the maximal ideal, and the tangent space t_G of G is that of this formal Lie group.

Hypotheses: Λ complete noetherian local with residue characteristic p, so that G^0 exists (R07.1/p-divisible-connected-etale) and has a formal Lie group.

Proof or construction:

1. Definition as displayed (Tate (2.2)).
2. Over a field k of characteristic p, dim G = n where ker(F : G^0 → G^{0(p)}) has order p^n (Tate, proof of Proposition 3; Stix Proposition 48), which shows invariance under reduction.
3. t_G(Λ) = Hom(I/I², Λ) for the augmentation ideal I of Λ⟦X_1, …, X_n⟧; it is free of rank n.

The required uses are:

- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/dimension-plus-dual-dimension: dim G + dim G^D = h.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-discriminant: The discriminant exponent n v p^{hv}.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/hodge-tate-p-divisible: The multiplicity of the Hodge–Tate weight 1.
- FaltingsFinitenessAndIsogenyTheorems:R28.2/local-differential-computation-for-the-l-divisible-tower: The height and dimension of the connected part (requested from R07.1).

The API supplies:

- TauCeti.FiniteFlat.PDivisibleGroup.dim (constructor): dim G : ℕ, the dimension of the formal Lie group of G⁰.
- TauCeti.FiniteFlat.PDivisibleGroup.tangentSpace (constructor): t_G, a free Λ-module of rank dim G.
- TauCeti.FiniteFlat.PDivisibleGroup.dim_baseChange (compatibility): The dimension is unchanged by local base change, in particular by reduction to the residue field.
- TauCeti.FiniteFlat.PDivisibleGroup.dim_le_height (other): dim G ≤ height of G⁰ ≤ h.

Discriminating tests:

- TauCeti.FiniteFlat.PDivisibleGroup.dim_muPInfty (value): dim μ_{p^∞} = 1.
- TauCeti.FiniteFlat.PDivisibleGroup.dim_constQpZp (value): dim ℚ_p/ℤ_p = 0.
- TauCeti.FiniteFlat.PDivisibleGroup.dim_supersingular (non-example): For supersingular E over W(𝔽̄_p), E[p^∞] is connected of height 2 but has dimension 1: the dimension is not the height of the connected part.
- TauCeti.FiniteFlat.PDivisibleGroup.dim_height_zero (degenerate): A height-zero p-divisible group has dimension 0.

Acceptance:

- dim μ_{p^∞} = 1, dim ℚ_p/ℤ_p = 0, dim A[p^∞] = dim A for an abelian scheme A.

Planned prerequisites: R07.1/serre-tate-connected-p-divisible, R07.1/p-divisible-connected-etale, R07.1/formal-lie-group.

Source: Tate67, (2.2), before Proposition 2, p. 164.

#### dim G + dim G^D = height

Declaration: TauCeti.FiniteFlat.PDivisibleGroup.dim_add_dim_cartierDual (lemma). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/dimension-plus-dual-dimension.

For a p-divisible group G of height h over a complete noetherian local ring with residue characteristic p, dim G + dim G^D = h.

Hypotheses: As in R07.1/p-divisible-dimension.

Proof or construction:

1. Both dimensions and the height are unchanged by reduction to the residue field k, so assume Λ = k of characteristic p.
2. From V ∘ F = p on G_1 = ker p (Frobenius and Verschiebung, ModularCurves 7E PD-3 in the elliptic case; Stix §8.5 in general) one gets 0 → ker F → ker p → ker V → 0; ker p has order p^h and ker F has order p^n (F is injective on G^{ét}, and on G⁰ its kernel has order p^n).
3. V is dual to F on G^D, so ker V has order p^{n′}; hence h = n + n′.

Acceptance:

- μ_{p^∞}: 1 + 0 = 1; supersingular E[p^∞]: 1 + 1 = 2.

Planned prerequisites: R07.1/p-divisible-dimension, R07.1/p-divisible-cartier-dual.

Source: Tate67, (2.3), Proposition 3, pp. 166–167.

#### The discriminant of the levels of a p-divisible group

Declaration: TauCeti.FiniteFlat.PDivisibleGroup.discr_level (lemma). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-discriminant.

Let R be a complete noetherian local ring with residue characteristic p, and G = (Spec A_v) a p-divisible group of height h and dimension n over R. The discriminant ideal of the finite free R-algebra A_v is generated by p^{n v p^{hv}}. For an exact sequence 0 → H′ → H → H″ → 0 of finite groups of orders m′, m, m″, disc(H) = disc(H′)^{m″} · disc(H″)^{m′}.

Hypotheses: R complete noetherian local with residue characteristic p; G of height h and dimension n.

Proof or construction:

1. Transitivity of discriminants gives the formula for extensions (Tate (2.2)); so reduce to the connected and étale parts, the étale part contributing a unit.
2. For connected G with formal Lie group Spf 𝒜, 𝒜 = R⟦X_1, …, X_n⟧ is free of rank p^{hv} over itself via [p^v]; the discriminant of 𝒜 over 𝒜′ = [p^v]^*(𝒜) is generated by the norm of the Jacobian determinant a of [p^v], which is p^{nv} on invariant differentials (Tate Lemma 1, via the trace map).
3. Base change 𝒜′ → R along the augmentation gives disc(A_v) = (N(a)) = (p^{n v p^{hv}}).

Acceptance:

- μ_{p^v}: A_v = R[T]/(T^{p^v} − 1) has discriminant ±p^{v p^v} (n = h = 1).
- For étale G (n = 0) the discriminant is the unit ideal.

Planned prerequisites: R07.1/p-divisible-dimension, R07.1/serre-tate-connected-p-divisible.

Library: `Algebra.discr`.

Source: Tate67, (2.2), Proposition 2 and Lemma 1, pp. 164–165.

#### Tate's Hodge–Tate decomposition for p-divisible groups

Declaration: TauCeti.FiniteFlat.PDivisibleGroup.hodgeTate (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/hodge-tate-p-divisible. Planet: Hodge–Tate decomposition for p-divisible groups.

Let R be a complete discrete valuation ring with perfect residue field of characteristic p and fraction field K of characteristic 0, C the completion of an algebraic closure of K, and G a p-divisible group over R with Cartier dual G^D. (i) (Tate Theorem 3) The maps G(R) → Hom_{G_K}(T_p(G^D), 𝔘) and t_G(K) → Hom_{G_K}(T_p(G^D), C), where 𝔘 is the group of principal units of the ring of integers of C and α is induced by the Cartier pairing, are bijective. (ii) There is a unique G_K-equivariant decomposition T_p(G) ⊗_{ℤ_p} C ≅ (t_{G^D}(K)^∨ ⊗_K C) ⊕ (t_G(K) ⊗_K C(1)); so V_p(G) is Hodge–Tate with weights 0 and 1, of multiplicities dim G^D and dim G. (iii) T_p(G) determines dim G.

Hypotheses: R complete DVR, perfect residue field of characteristic p, char K = 0.

Proof or construction:

1. Tate–Sen (requested from PadicHodgeTheory R06.1): H^0(G_K, C) = K, H^0(G_K, C(j)) = 0 and H^1(G_K, C(j)) = 0 for j ≠ 0 (Tate Theorems 1–2; Stix Theorem 88).
2. The logarithm of the formal group gives 0 → Φ_p(G) → G(𝒪_C) → t_G(C) → 0, and the Cartier pairing gives α : G(𝒪_C) → Hom(T_p(G^D), 𝔘) with differential dα (Stix §11.3–11.5).
3. Injectivity of α_R and dα_R: reduce to G connected or étale by exactness of G ↦ G(R) on the connected–étale sequence; G(R) contains no K-vector space (Stix Theorem 91, Steps 1–4).
4. Surjectivity by dimensions: d = dim_K W^{G_K}, d′ = dim_K W′^{G_K} for W = Hom(T_p G, C), W′ = Hom(T_p G^D, C); the invariants pair into H^0(G_K, C(−1)) = 0, so d + d′ ≤ h = n + n′ (R07.1/dimension-plus-dual-dimension), forcing equality.
5. (ii) The exact sequence 0 → t_G(C)(1) → T_p(G) ⊗ C → t_{G^D}(C)^∨ → 0 splits uniquely since H^1(G_K, C(1)) = 0 = H^0(G_K, C(1)) (Stix Corollaries 92–93); (iii) follows from (ii).

Acceptance:

- For μ_{p^∞}: T_p ⊗ C = C(1), weight 1 of multiplicity 1 = dim μ_{p^∞}; for ℚ_p/ℤ_p: weight 0.
- det V_p(G) ⊗ C ≅ C(dim G) (Stix Corollary 94).

Planned prerequisites: R07.1/p-divisible-tate-module, R07.1/p-divisible-dimension, R07.1/dimension-plus-dual-dimension, R07.1/p-divisible-cartier-dual, R07.1/serre-tate-connected-p-divisible.

Source: Tate67, (4.1), Theorem 3 and its Corollary 1, pp. 179–180; Stix12-notes, §11.7, Theorem 91 and Corollaries 92–93, pp. 73–75.

#### Closures of generic p-divisible subgroups become p-divisible after a shift

Declaration: TauCeti.FiniteFlat.PDivisibleGroup.exists_of_tateModule_summand (lemma). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/closure-of-generic-p-divisible-subgroups.

Let R be a complete DVR of mixed characteristic (0, p) with perfect residue field, F a p-divisible group over R, and M ⊆ T_p(F) a G_K-stable ℤ_p-direct summand. Let E_* ⊆ F_K be the corresponding p-divisible subgroup of the generic fibre and E_v the schematic closure of E_{*v} in F_v. Then the E_v need not form a p-divisible group, but for some i_0 the system Γ_v = E_{i_0+v}/E_{i_0} is a p-divisible group over R, with a homomorphism φ : Γ → F inducing T_p(Γ) ≅ M. The map φ need not be a closed immersion.

Hypotheses: R complete DVR, mixed characteristic, perfect residue field (Tate's §4 setting).

Proof or construction:

1. The closures E_v ⊆ F_v are closed flat subgroups (R07.1/schematic-closure-of-generic-subgroups) with E_v ⊆ E_{v+1}; generically E_* is p-divisible, so p induces maps E_{i+v+1}/E_{i+1} → E_{i+v}/E_i that are isomorphisms on the generic fibre.
2. The affine algebras D_i of E_{i+1}/E_i form an increasing sequence of R-orders in one finite separable K-algebra, so they stabilise: D_i = D_{i+1} for i ≥ i_0.
3. With Γ_v = E_{i_0+v}/E_{i_0}, multiplication by p^v on Γ_{v+1} factors through an isomorphism, so its kernel is Γ_v: Γ is p-divisible, and p^{i_0} gives Γ → E ⊆ F inducing T_p(Γ) ≅ M (Tate, proof of Proposition 12).
4. Serre's example: for an elliptic curve over R with ordinary reduction and rational p-torsion, the map φ is not injective over R.

The required uses are:

- FaltingsFinitenessAndIsogenyTheorems:R28.3/closure-tower-becomes-l-divisible-only-after-a-shift: The closures of a generic l-divisible subgroup form an l-divisible group after a shift (requested from R07.1).
- FaltingsFinitenessAndIsogenyTheorems:R28.3/intersection-with-the-toric-l-divisible-group-after-a-shift: The same shift for intersections.

Acceptance:

- M = T_p(F) gives Γ = F (i_0 = 0).
- This is the 'closure after a shift' used in Faltings's erratum (FaltingsFinitenessAndIsogenyTheorems R28.3).

Planned prerequisites: R07.1/schematic-closure-of-generic-subgroups, R07.1/p-divisible-tate-module, R07.1/p-divisible-level-exactness.

Source: Tate67, (4.2), Proposition 12, p. 181; Tate67, (4.2), proof of Proposition 12, p. 182.

#### Tate's theorem: p-divisible groups are determined by their generic fibres

Declaration: TauCeti.FiniteFlat.PDivisibleGroup.extend_genericFibre (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/tate-generic-fibre-theorem. Planet: Tate's theorem on p-divisible groups.

Let R be an integrally closed noetherian domain whose fraction field K has characteristic 0, and G, H p-divisible groups over R. (i) Every homomorphism G_K → H_K of generic fibres extends uniquely to a homomorphism G → H. (ii) If R is a complete DVR with perfect residue field, Hom(G, H) → Hom_{G_K}(T_p G, T_p H) is bijective. (iii) A homomorphism G → H that is an isomorphism on generic fibres is an isomorphism.

Hypotheses: R integrally closed noetherian domain, char K = 0; for (ii) R a complete DVR with perfect residue field.

Proof or construction:

1. Reduction: R = ⋂ R_𝔭 over height-one primes and each R_𝔭 is a DVR, so it suffices to treat DVRs; pass to a complete DVR R′ with algebraically closed residue field and R = R′ ∩ K. If the residue characteristic is not p, G is étale and the statement is Galois theory.
2. (iii) first: u_v : B_v → A_v is injective (B_v free, u_v ⊗ K bijective). The discriminants of A_v and B_v are p^{n v p^{hv}} (R07.1/p-divisible-discriminant); the height is read off the generic fibre and the dimension from T_p (R07.1/hodge-tate-p-divisible (iii)), so the discriminants agree and u_v is bijective.
3. (i) Given f : G_K → H_K, apply R07.1/closure-of-generic-p-divisible-subgroups to F = G × H and M the graph of T_p(f): the resulting Γ → G × H composed with pr_1 is an isomorphism on generic fibres, hence an isomorphism by (iii); then pr_2 ∘ φ ∘ (pr_1 ∘ φ)^{−1} extends f. Uniqueness: A_v ⊆ A_v ⊗ K.
4. (ii) is (i) together with the equivalence between p-divisible groups over K and G_K-lattices (R07.1/etale-groups-as-galois-modules over K).

The required uses are:

- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-extension-of-generic-p-divisible: Uniqueness of the extension.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4: Full faithfulness of G ↦ T_p(G) underlies the Breuil–Kisin classification.
- AbelianSchemesAndArithmeticModuli:A3: p-divisible groups of abelian schemes are determined by their generic fibres (RS-02 link from R07.1).

Acceptance:

- Hom(ℚ_p/ℤ_p, μ_{p^∞}) = 0 over ℤ_p although both have T_p ≅ ℤ_p as modules: the Galois actions differ.
- Contrast with finite flat groups: at e = p − 1 (for instance ℤ_2) the generic fibre does not determine the finite flat model (R07.1/raynaud-boundary-case); p-divisibility removes the ambiguity for every e.

Planned prerequisites: R07.1/p-divisible-discriminant, R07.1/hodge-tate-p-divisible, R07.1/closure-of-generic-p-divisible-subgroups, R07.1/p-divisible-tate-module.

Library: `IsIntegrallyClosed`, `IsNoetherianRing`.

Source: Tate67, (4.2), Theorem 4, p. 180; Tate67, (4.2), Corollaries 1 and 2 of Theorem 4, p. 181.

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

#### A generic p-divisible group whose levels extend has a p-divisible extension

Declaration: TauCeti.FiniteFlat.PDivisibleGroup.exists_extension_of_levels (lemma). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-extension-of-generic-p-divisible.

Let R be a DVR of mixed characteristic (0, p) and G = (G_n) a p-divisible group over K. If every G_n extends to a finite flat R-group scheme, then G extends to a p-divisible group over R, unique up to isomorphism.

Hypotheses: R a DVR of mixed characteristic; no bound on the ramification.

Proof or construction:

1. Uniqueness is Tate's theorem (R07.1/tate-generic-fibre-theorem).
2. (a) Choose prolongations 𝒢(n) and modify them inductively so that each inclusion G_n → G_{n+1} extends to 𝒢(n) → 𝒢(n+1): dualise, take the closure of the graph of the dual epimorphism in 𝒢(n+1)′ × 𝒢(n)′, and dualise back (R07.1/schematic-closure-of-generic-subgroups).
3. (b) Close up the filtration G_i ⊆ G_n: the successive quotients 𝒢(n)_i/𝒢(n)_{i−1} are prolongations of G_1, decreasing in n for fixed i and increasing in i for fixed n (via p).
4. (c) By Corollary 2.2.3 (maximal and minimal prolongations, R07.1/finite-flat-prolongations) both sequences stabilise; after dividing by the stable part one may take i_0 = 1, and then the stable values of 𝒢(n) form a p-divisible group extending G (Raynaud Proposition 2.3.1).

Acceptance:

- For G = μ_{p^∞} over K = ℚ_p the extension is μ_{p^∞}; its levels have the unique models μ_{p^n} over ℤ_p when p is odd.
- Over ℤ_2 the level G_1 = μ₂ has two models, but the p-divisible extension is still unique.

Planned prerequisites: R07.1/finite-flat-prolongations, R07.1/schematic-closure-of-generic-subgroups, R07.1/tate-generic-fibre-theorem.

Library: `IsDiscreteValuationRing`.

Source: Raynaud74, §2.3, Proposition 2.3.1, p. 261.

#### The finite part of a quasi-finite group scheme over a henselian base

Declaration: TauCeti.FiniteFlat.finitePart (lemma). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/finite-part-of-quasi-finite-group.

Let R be a henselian local ring and 𝒢 → Spec R a separated, quasi-finite, flat, finitely presented commutative group scheme. Then 𝒢 = 𝒢^f ⊔ 𝒢′ with 𝒢^f open and closed, finite over R and containing the unit section, and 𝒢′ with empty special fibre. 𝒢^f is a finite flat closed subgroup scheme. If R is a henselian DVR with fraction field K, then 𝒢^f(K̄) is the set of points of 𝒢(K̄) that extend to 𝒪_L-points for some finite extension L/K inside K̄.

Hypotheses: R henselian local; 𝒢 separated, quasi-finite, flat and of finite presentation.

Proof or construction:

1. The special fibre is finite, so its points are isolated; by Stacks Lemma 37.41.5 there is an étale neighbourhood over which 𝒢 splits into finite pieces through these points and a part W with no points over the closed point. Since R is henselian the étale neighbourhood may be taken to be Spec R itself (Stacks Lemma 10.153.3; in the affine case this is condition (13): a quasi-finite R-algebra is A × B with A finite and B ⊗ κ = 0).
2. 𝒢^f is finite and flat (open in 𝒢). It is a subgroup: 𝒢^f ×_R 𝒢^f is finite over R, and over a henselian base each connected component of a finite R-scheme meets the special fibre (condition (10)), so its image under multiplication lies in 𝒢^f, which is open and closed. The same argument applies to the inverse and the unit section.
3. Points: an 𝒪_L-point with L/K finite has 𝒪_L local and finite over R, so it lands in 𝒢^f; conversely 𝒢^f is finite, hence proper, and the valuative criterion extends K̄-points of 𝒢^f.

The required uses are:

- FaltingsFinitenessAndIsogenyTheorems:R28.2/local-differential-computation-for-the-l-divisible-tower: The finite part of the quasi-finite group of a semiabelian scheme (requested from R07.1).

Acceptance:

- For a quasi-finite flat group whose generic fibre is ℤ/pℤ but whose special fibre is trivial (the open complement of the nonzero sections of ℤ/pℤ over the closed point), 𝒢^f is the unit section.
- For finite 𝒢, 𝒢^f = 𝒢.

Library: `HenselianLocalRing`, `Algebra.QuasiFinite`.

Source: Stacks, Tag 02LO, Lemma 37.41.5; Stacks, Tag 04GG, Lemma 10.153.3 (13).

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

Declaration: TauCeti.FiniteFlat.FVectorScheme.classification (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-classification.

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

### Groups over rings of S-integers

#### Finite étale group schemes over a connected base are π₁-modules

Declaration: TauCeti.FiniteFlat.etaleGroupEquivContAction (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/etale-groups-as-galois-modules.

Let S = Spec R be connected with a geometric point s̄. The fibre functor G ↦ G(s̄) is an equivalence between finite étale (commutative) group schemes over S and finite (abelian) groups with a continuous action of π₁(S, s̄); constant groups correspond to trivial actions, and every finite étale group is constant over some finite étale cover. The inverse sends ρ : π₁(S, s̄) → Aut(M) to the twisted form V(ρ)(T) = M(T ⊗_R R′)^Γ, for R → R′ finite Galois with group Γ through which ρ factors. For R = ℤ[1/N] and s̄ = Spec ℚ̄, π₁ = Gal(ℚ_S/ℚ) for S the primes dividing N together with ∞, so finite étale commutative group schemes over ℤ[1/N] are the finite G_ℚ-modules unramified outside N∞. A finite flat group scheme whose order is invertible on S is étale.

Hypotheses: S connected (for ℤ[1/N]: Spec ℤ[1/N] is connected and normal).

Proof or construction:

1. SGA 1, Exposé V (requested from InverseGaloisAndArithmeticFundamentalGroups IG.0): finite étale S-schemes form a Galois category with fibre functor F_{s̄}, and F_{s̄} is an equivalence onto finite continuous π₁(S, s̄)-sets (Mathlib's PreGaloisCategory.functorToContAction on CommAlgCat.FiniteEtale R).
2. The equivalence preserves finite products, so group objects correspond to group objects: finite étale group schemes ↔ finite groups with continuous π₁-action (Stix Theorem 33).
3. The inverse is the explicit twist of Stix 7.3.1, representable by fpqc descent (ModularCurves 0E); its fibre at s̄ is M with action ρ.
4. For a normal connected S with generic point η, π₁(S, η̄) is the Galois group of the maximal extension of the function field unramified over S (SGA 1 V.8.2, requested from IG.0); for ℤ[1/N] this is Gal(ℚ_S/ℚ).
5. Order invertible ⇒ étale: Stix Theorem 34 (Oort–Tate Lemma 5).

The required uses are:

- SmallRamificationAndAbelianVarietyBaseCases:R25.3/etale-group-schemes-over-integers-are-constant: Request (e) to R07.1: étale group schemes over ℤ[1/N] as Galois modules.
- SmallRamificationAndAbelianVarietyBaseCases:R25.4/constant-over-cyclotomic: Request (e) and the twisted constant schemes V(ρ) of (f).

Acceptance:

- The constant group ℤ/nℤ ↔ trivial action; μ_n over ℤ[1/n] ↔ (ℤ/n)(1), the cyclotomic character.
- The twisted constant scheme V(ρ) of a representation ρ : G_ℚ → GL_2(𝔽_p) unramified outside l∞ is a finite étale group scheme over ℤ[1/l] (for p = l only over ℤ[1/l], as μ_p is not étale at p).

Requested prerequisites: InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Library: `CommAlgCat.FiniteEtale`, `CategoryTheory.PreGaloisCategory.functorToContAction`, `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`.

Source: Stix12-notes, §7.3, Theorem 33, p. 35; Stix12-notes, §7.3.1, pp. 35–36; Stix12-notes, §7.4, Theorem 34, p. 37.

#### Gluing finite flat group schemes from a completion and a localisation

Declaration: TauCeti.FiniteFlat.gluingEquiv (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/gluing-equivalence.

Let R be a noetherian ring, p ∈ R, R̂ the p-adic completion. The functor G ↦ (G ⊗ R̂, G ⊗ R[1/p], id) is an equivalence between finite flat R-group schemes and triples (G_1, G_2, θ) of a finite flat R̂-group scheme G_1, a finite flat R[1/p]-group scheme G_2 and an isomorphism θ : G_1 ⊗ R̂[1/p] ≅ G_2 ⊗ R̂[1/p]. For R = ℤ[1/N] and p ∤ N the triples are over ℤ_p, ℤ[1/pN] and ℚ_p.

Hypotheses: R noetherian; p ∈ R arbitrary.

Proof or construction:

1. R noetherian, so R → R̂ is flat and (R, p) is a glueing pair (Stacks Remark 15.92.8); every R-module is glueable, and Can : Mod_R → Glue(R → R̂, p) is an equivalence (Stacks Theorem 15.92.16).
2. A module is finite projective iff both of its pieces are (Stacks Lemma 15.92.19), so the equivalence restricts to finite locally free modules.
3. Can is compatible with tensor products, so it carries commutative algebras, Hopf-algebra structures and their morphisms along: finite flat group schemes over R ↔ triples (Schoof Proposition 2.3, which cites Artin's module version).

The required uses are:

- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/mayer-vietoris-hom-ext: The Mayer–Vietoris sequence is its derived form.
- SmallRamificationAndAbelianVarietyBaseCases:R25.4/simple-objects-criterion: Requests (c) and (g) to R07.1: the gluing over ℤ[1/N] and ℤ[1/l].

Acceptance:

- For R = ℤ[1/l] and p ≠ l: a finite flat p-group scheme over ℤ[1/l] is a G_ℚ-module unramified outside pl∞ together with a finite flat model over ℤ_p of its restriction to G_{ℚ_p}.
- With p a unit in R, R̂ = 0 and the triples are just R-groups.

Library: `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`, `IsNoetherianRing`, `IsAdicComplete`, `Localization.Away`.

Source: Schoof03, §2, Proposition 2.3, p. 419; Stacks, Tag 0BNI, Theorem 15.92.16 and Lemma 15.92.19.

#### The Mayer–Vietoris sequence for Hom and Ext¹ of finite flat groups

Declaration: TauCeti.FiniteFlat.mayerVietoris_exact (theorem). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/mayer-vietoris-hom-ext.

For R noetherian, p ∈ R and finite flat R-group schemes G, H there is a natural exact sequence 0 → Hom_R(G, H) → Hom_{R̂}(G, H) × Hom_{R[1/p]}(G, H) → Hom_{R̂[1/p]}(G, H) →^δ Ext¹_R(G, H) → Ext¹_{R̂}(G, H) × Ext¹_{R[1/p]}(G, H) → Ext¹_{R̂[1/p]}(G, H), where Ext¹ is the group of extensions 0 → H → X → G → 0 of finite flat group schemes and δ(φ) is the extension glued from the trivial extensions H × G over R̂ and R[1/p] along θ(h, g) = (h + φ(g), g).

Hypotheses: As in R07.1/gluing-equivalence.

Proof or construction:

1. Injectivity of the first map: R̂ × R[1/p] is faithfully flat over R.
2. Exactness at the second group and the construction of δ: R07.1/gluing-equivalence applied to morphisms and to H × G.
3. At the third group: δ(φ) is split iff φ = ψ − f with ψ over R̂ and f over R[1/p], by comparing isomorphisms with the trivial extension over each piece.
4. At Ext¹_R: an extension trivial over both pieces is δ of the difference of the two trivialisations; at the fifth group: a compatible pair of extensions glues by R07.1/gluing-equivalence (Schoof, proof of Corollary 2.4).

The required uses are:

- SmallRamificationAndAbelianVarietyBaseCases:R25.4/ext-mu-p-by-z-mod-p-over-z-one-over-l: Request (c)/(g): the Hom–Ext¹ sequence over ℤ[1/l].
- SmallRamificationAndAbelianVarietyBaseCases:R25.3/extensions-of-mu-two-by-z-mod-two-over-integers: The Hom–Ext¹ sequence over ℤ.

Acceptance:

- Over ℤ with G = μ_p, H = ℤ/pℤ (R = ℤ, p): the sequence computes Ext¹_ℤ(μ_p, ℤ/pℤ) from Galois cohomology over ℤ[1/p] and the local extensions over ℤ_p (SmallRamification R25.3–R25.4).
- Schoof's proof says 'extensions of H by G' in its last step where extensions of G by H are meant (source issue E1).

Planned prerequisites: R07.1/gluing-equivalence.

Source: Schoof03, §2, Corollary 2.4 and its proof, pp. 419–420.

#### The Katz–Mazur group schemes T_ε

Declaration: TauCeti.FiniteFlat.katzMazur (construction). Node: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/katz-mazur-groups.

Let R be a ring, p a prime and ε ∈ R^×. The Katz–Mazur group scheme is T_ε = Spec ⊕_{i=0}^{p−1} R[X_i]/(X_i^p − ε^i), whose S-points (S with connected spectrum) are pairs (s, i), 0 ≤ i < p, s^p = ε^i, with (t, i)·(s, j) = (ts, i + j) if i + j < p and (ts/ε, i + j − p) otherwise. It is finite flat of order p², killed by p, and sits in 0 → μ_p → T_ε → ℤ/pℤ → 0. T_ε ≅ T_{ε′} when ε/ε′ ∈ (R^×)^p; over a field, the points of T_ε generate R(ζ_p, ε^{1/p}).

Hypotheses: R any ring; ε a unit.

Proof or construction:

1. Construction: the algebra is free of rank p² over R; the displayed law is well defined because (ts)^p = ε^{i+j} and (ts/ε)^p = ε^{i+j−p}.
2. The summand i = 0, R[X_0]/(X_0^p − 1), is μ_p, a closed flat subgroup; the quotient by it is ℤ/pℤ, the index i.
3. Rescaling X_i by u^i identifies T_ε with T_{εu^p}; over a field the points are the p-th roots of ε^i, so they generate R(ζ_p, ε^{1/p}) (Katz–Mazur Interlude 8.7, as recalled by Schoof).
4. Over ℤ[1/l] the extension class of T_ε is the Kummer class of ε, so T_ε ≅ T_{ε′} iff ε/ε′ is a p-th power of a unit (Schoof 2005 §2.4).

The required uses are:

- SmallRamificationAndAbelianVarietyBaseCases:R25.4/ext-mu-p-by-z-mod-p-over-z-one-over-l: Request (f) to R07.1: the Katz–Mazur extensions of ℤ/pℤ by μ_p over ℤ[1/l].
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale: The nonsplit extensions of ℤ/pℤ by μ_p over ℤ_p in its acceptance.

The API supplies:

- TauCeti.FiniteFlat.katzMazur (constructor): katzMazur p ε : FLF R, for ε : Rˣ.
- TauCeti.FiniteFlat.katzMazur_rank (other): rank (katzMazur p ε) = p ^ 2.
- TauCeti.FiniteFlat.katzMazur_extension (other): The exact sequence 0 → μ_p → katzMazur p ε → ℤ/pℤ → 0.
- TauCeti.FiniteFlat.katzMazurIsoOfDiv (equivalence): katzMazur p ε ≅ katzMazur p (ε * u ^ p).

Discriminating tests:

- TauCeti.FiniteFlat.katzMazur_one (degenerate): katzMazur p 1 ≅ μ_p × ℤ/pℤ.
- TauCeti.FiniteFlat.katzMazur_neg_one_two (value): Over ℤ with p = 2, katzMazur 2 (−1) is nonsplit, and its points generate ℚ(i).
- TauCeti.FiniteFlat.katzMazur_not_split (non-example): Over ℤ_p (p odd), katzMazur p (1 + p) is not isomorphic to μ_p × ℤ/pℤ, since 1 + p ∉ ℤ_p^{×p}.

Acceptance:

- ε = 1: T_1 ≅ μ_p × ℤ/pℤ (split).
- R = ℤ, p = 2, ε = −1: T_{−1} is Mazur's nonsplit group of order 4, with points generating ℚ(i).
- Over ℤ_p, T_ε is nonsplit for ε ∉ ℤ_p^{×p}, for instance ε = 1 + p with p odd.

Library: `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`.

Source: Schoof03, §2, p. 418; Schoof05, §2.4, p. 850.

## Requests

- **tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality**: The general finite locally free commutative group-scheme category with constant and diagonalizable groups, kernels with base change, and Cartier duality with evaluation, biduality, rank and base change (RS-02: 'use the unchanged … carrier'); Tau Ceti already has the Hopf-algebra and affine-group-scheme Cartier duality. Needed by: R07.1/p-divisible-group, R07.1/p-divisible-cartier-dual, R07.1/f-vector-scheme.
- **tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors**: The fppf quotient of a finite locally free group scheme by a closed finite locally free subgroup, representable and finite locally free, with the Lagrange rank formula. Needed by: R07.1/p-divisible-level-exactness, R07.1/schematic-closure-of-generic-subgroups.
- **tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out**: Effective fpqc descent for finite locally free group schemes and their homomorphisms, used for base change of p-divisible groups and of F-vector schemes. Needed by: R07.1/p-divisible-group, R07.1/raynaud-classification.
- **tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups**: PD-2: the finite-level connected–étale sequence over a henselian local ring, functorial and compatible with local base change, with the special-fibre splitting over a perfect residue field; and PD-1/PD-4/PD-5 for the elliptic tests (E[p^∞], supersingular connectedness). Needed by: R07.1/p-divisible-connected-etale, R07.1/p-divisible-group.
- **PadicHodgeTheory:R06.1**: Tate–Sen: for K complete discretely valued of characteristic 0 with perfect residue field and C the completion of K̄, H^0(G_K, C) = K, H^0(G_K, C(j)) = 0 for j ≠ 0, H^1(G_K, C) one-dimensional and H^1(G_K, C(j)) = 0 for j ≠ 0 (Tate 1967 §3.3, Theorems 1–2), as part of the Galois properties of the period rings. Needed by: R07.1/hodge-tate-p-divisible.
- **InverseGaloisAndArithmeticFundamentalGroups:IG.0**: SGA 1 Exposé V for a connected affine base Spec R: finite étale R-schemes form a Galois category whose geometric fibre functor induces an equivalence with finite continuous π₁-sets; and for normal connected S with generic point η, π₁(S, η̄) is the Galois group of the maximal extension of the function field unramified over S (so π₁(Spec ℤ[1/N]) = Gal(ℚ_S/ℚ)). Needed by: R07.1/etale-groups-as-galois-modules.

## Coverage

- **R07.1** (closed).
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

## Source issues

- **FiniteFlatGroupsAndIntegralPadicHodgeTheory/E1** (misprint, Schoof03, Proof of Corollary 2.4, last paragraph, p. 420). Printed: "Finally, suppose that X and X′ are extensions of H by G over the rings R̂ and R[1/p] respectively. … Then the R-group scheme that corresponds via Prop.2.3 to the triple (X, X′, θ) is an extension of H by G over R" Correction: extensions of G by H (0 → H → X → G → 0), in both places. The step proves exactness at Ext¹_R̂(G, H) × Ext¹_{R[1/p]}(G, H), whose elements are extensions of G by H, the convention used earlier in the same proof ('let X be an extension of G by H over R') and in the definition of δ. Extensions of H by G would lie in Ext¹(H, G). Affects: nothing. Known: new.

## Sources

- **Raynaud74**: Michel Raynaud, *Schémas en groupes de type (p, …, p)*, Bull. Soc. Math. France 102 (1974), 241–280, Numdam copy (journal page = PDF page + 239); accessed 2026-09-28. <https://www.numdam.org/item/BSMF_1974__102__241_0/>, sha256 `05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe`.
  - Read: §1.2–1.5 (pp. 246–259): F-vector schemes, condition (**), Theorem 1.4.1, Corollaries 1.5.1–1.5.2 and Remarks 1.5.3–1.5.4.
  - Read: §2 (pp. 259–263): schematic closure, the order on prolongations (Proposition 2.2.2, Corollary 2.2.3) and Proposition 2.3.1.
  - Read: §3 (pp. 264–271): Proposition 3.2.1, §3.3 (Propositions 3.3.1–3.3.2, Theorem 3.3.3, Remarks 3.3.4–3.3.5, Corollaries 3.3.6–3.3.7) and §3.4 (Theorems 3.4.1, 3.4.3, Corollary 3.4.4, Remarks 3.4.2, 3.4.5–3.4.7 and the example).
  - Read: §2.3 (pp. 261–263): Proposition 2.3.1 and its proof.
- **OortTate70**: Frans Oort and John Tate, *Group schemes of prime order*, Ann. Sci. École Norm. Sup. (4) 3 (1970), 1–21, Numdam copy; accessed 2026-09-28. <https://www.numdam.org/item/ASENS_1970_4_3_1_1_0/>, sha256 `064cec666ea2082bc23ec5748b7b6db2fe01feb7f83f8afd04736e78bc44fa5a`.
  - Read: §§1–3 (pp. 1–15): the ring Λ, the constants w_p, Theorem 2 and its proof, and the remarks after it.
- **Stix12-notes**: Jakob Stix, *A course on finite flat group schemes and p-divisible groups*, Course notes, Heidelberg 2009, revised 18 September 2012, author-hosted PDF (76 pp.); accessed 2026-09-28. <https://www.math.uni-frankfurt.de/~stix/skripte/STIXfinflatGrpschemes20120918.pdf>, sha256 `6a618eb8c6d9ab59e91b2b3edf2a63e7a637fbabf547c0ba7ad0849e39bae489`.
  - Read: §8.1 (pp. 38–40): Lemma 36, Propositions 37, 39, 40 (connected–étale sequence over a henselian base).
  - Read: §8.4 (pp. 50–53): Theorem 60 (Oort–Tate).
  - Read: §9 (pp. 54–56): the definition of p-divisible groups, Lemma 61, Proposition 62, Corollary 64, examples 9.2(1)–(6), Cartier duality 9.3 and Example 65.
  - Read: §11.3 (p. 70): Corollary 85.
  - Read: §7.2–7.4 (pp. 35–37): Theorems 32–34 and the construction 7.3.1 of the étale group attached to a π₁-action.
  - Read: §10.2–10.3 (pp. 57–62): formal groups, formal Lie groups and their dimension, p-divisible formal Lie groups, Theorem 70 (Serre–Tate) with proof.
  - Read: §11.4–11.7 (pp. 71–75): Theorem 88 (Tate–Sen), Theorem 91 (Tate), Corollaries 92–94.
- **Tate67**: John T. Tate, *p-Divisible groups*, Proceedings of a Conference on Local Fields (Driebergen, 1966), Springer, 1967, pp. 158–183; scanned copy on a Purdue course page (13 two-page PDF sheets); accessed 2026-09-28. <https://www.math.purdue.edu/~tongliu/teaching/598/p-divisible.pdf>, sha256 `720bf7128d4f048853435b083d18d0d863056c1f991942192a7f00daa7e424aa`.
  - Read: §2 (pp. 160–167): p-divisible groups, Proposition 1 (connected p-divisible groups and divisible formal Lie groups), the dimension, Proposition 2 (discriminants) and Proposition 3 (n + n′ = h).
  - Read: §3.3 (pp. 176–177): Theorems 1 and 2 on the Galois cohomology of C.
  - Read: §4 (pp. 177–183): Theorem 3 and its corollaries, Theorem 4 and its Corollaries 1–2, Proposition 12 with its proof and Serre's example.
- **Schoof03**: René Schoof, *Abelian varieties over cyclotomic fields with good reduction everywhere*, Math. Ann. 325 (2003), 413–448, author copy; errata note erratacyc.txt checked; accessed 2026-09-28. <https://www.mat.uniroma2.it/~schoof/abcyc.pdf>, sha256 `e71bf55c305549030022417edb049afb67b83af70fcb93292019f47ce7a02ecc`.
  - Read: §2 (pp. 417–420): the Katz–Mazur group schemes T_ε, Proposition 2.3 (gluing) and Corollary 2.4 (the Mayer–Vietoris sequence) with proofs.
  - Read: The author's errata note erratacyc.txt (pages 426–446; nothing in §2).
- **Schoof05**: René Schoof, *Abelian varieties over Q with bad reduction in one prime only*, Compositio Math. 141 (2005), 847–868, author copy; accessed 2026-09-28. <https://www.mat.uniroma2.it/~schoof/abvar1prime.pdf>, sha256 `0c44f6abd763759aaf0046e14dc054229293f440dca949e141e6adbfd3624691`.
  - Read: §2.4 (p. 850): the Katz–Mazur group schemes G_ε over ℤ[1/l].
- **Stacks**: The Stacks project authors, *The Stacks project*, online, tag pages 02LO, 04GG and 0BNI fetched 2026-09-28 (sha256 of the 0BNI page given; 02LO 14970678…, 04GG 698f3f4e…). <https://stacks.math.columbia.edu/tag/0BNI>, sha256 `0376af0b12014aed2c77da5820d6049b6a00f7ce19fc792cd1be676e7f3ca9c9`.
  - Read: Tag 0BNI, Section 15.92 (the Beauville–Laszlo theorem): glueing pairs, Remark 15.92.8, the remark that every module is glueable when R → R′ is flat, Theorem 15.92.16 and Lemma 15.92.19.
  - Read: Tag 02LO, Lemma 37.41.5 (étale localisation of separated quasi-finite morphisms).
  - Read: Tag 04GG, Lemma 10.153.3 (characterisations of henselian local rings), conditions (9), (10) and (13).
