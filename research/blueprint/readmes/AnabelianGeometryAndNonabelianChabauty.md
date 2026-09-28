# Anabelian geometry and nonabelian Chabauty

This is the first blueprint checkpoint for NC.0–NC.6. It builds the nonabelian continuous cohomology that the Selmer varieties of NC.3 and the Chabauty–Kim loci of NC.4 are made of. Every declaration is a plan, and no stage is closed.

## Scope, ownership and conventions

The reviewed library audit shows that neither pinned library has nonabelian group cohomology: Mathlib lists it as a TODO in `GroupCohomology/LowDegree.lean`. The only nonabelian H¹ in Mathlib is the Čech one of presheaves of groups on a site. Tau Ceti has explicit continuous cohomology in degrees 0–2 for topological modules (`TauCeti.ContCohomology`). The RP.3 audit row records that NC.3 owns the torsor-valued H¹ and its twists. This component therefore builds nonabelian H¹ for continuous actions of topological groups and compares it with Tau Ceti's abelian version, without duplicating it.

The conventions follow Kim, *The motivic fundamental group of P¹ ∖ {0, 1, ∞} and the theorem of Siegel*, §1:

- The coefficient group U is an arbitrary topological group on which a topological group G acts continuously by automorphisms.
- A 1-cocycle is a continuous map with c(gh) = c(g)·g•c(h). The factor order matters when U is not commutative, and Mathlib's commutative `IsMulCocycle₁` uses the other order.
- U acts on cocycles by (u·c)(g) = u·c(g)·(g•u)⁻¹, and H¹(G, U) is the orbit set, a pointed set.

The algebraic structure Kim puts on H¹ (representability by pro-varieties, from his weight filtrations and inductive-limit topologies) is not part of this component. Neither are local conditions or Selmer varieties. They are listed in the coverage.

The exact sequence for a subgroup A ≤ B that need not be normal, H⁰(G, B/A) → H¹(G, A) → H¹(G, B), is included because Kim uses it for the crystalline condition. It needs no continuous section. The connecting map to H² for a central extension does need one; for unipotent groups an algebraic splitting supplies it.

## The nonabelian cohomology component

### Continuous 1-cocycles and invariants with nonabelian coefficients

Declaration: TauCeti.NonabelianCohomology.Z1. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles.

Let G be a topological group and U a topological group on which G acts by group automorphisms, continuously (G × U → U continuous). The invariants are H⁰(G, U) := U^G = {u ∈ U : g•u = u for all g}, a subgroup of U (Mathlib FixedPoints.subgroup). The continuous 1-cocycles are Z¹(G, U) := {c : G → U continuous : c(gh) = c(g)·(g•c(h)) for all g, h ∈ G}, with the trivial cocycle 1 (the constant map to the identity) as base point. Lean: `TauCeti.NonabelianCohomology.H0 G U`, `TauCeti.NonabelianCohomology.Z1 G U` (a subtype of G → U).

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

In the situation of NC.3/continuous-cocycles, U acts on Z¹(G, U) by (u·c)(g) := u·c(g)·(g•u)⁻¹. The first cohomology H¹(G, U) is the orbit set of this action (Mathlib MulAction.orbitRel.Quotient U (Z¹ G U)), pointed by the class of the trivial cocycle; two cocycles in one orbit are called cohomologous. The class of c is trivial iff c is a coboundary g ↦ u·(g•u)⁻¹. Lean: `TauCeti.NonabelianCohomology.H1 G U` with the class map `H1.mk`.

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

### The exact sequences of pointed sets

Declaration: TauCeti.NonabelianCohomology.exact_H1_of_subgroup. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence.

Let A ≤ B be a closed subgroup of a topological group B stable under a continuous action of G by automorphisms, and B/A the coset space with the induced (continuous) G-action. (a) The sequence of pointed sets 1 → A^G → B^G → (B/A)^G →δ H¹(G, A) → H¹(G, B) is exact (at each term the image of the incoming map is the preimage of the base point), where δ(bA) is the class of the continuous cocycle g ↦ b⁻¹·(g•b); moreover δ(x) = δ(y) iff x and y lie in one B^G-orbit of (B/A)^G. (b) If A is normal, B/A is a topological group with continuous G-action, and the sequence continues exactly with → H¹(G, B/A): a class of H¹(G, B) maps to the base point of H¹(G, B/A) iff it comes from H¹(G, A). No continuous section of B → B/A is needed.

Hypotheses: G is a topological group and B a topological group with an action of G by group automorphisms (MulDistribMulAction G U) such that the action map G × U → U is continuous (ContinuousSMul G U). A a closed G-stable subgroup of B; for (b), A normal.

Proof or construction:

1. δ is well defined: g•(bA) = bA gives b⁻¹(g•b) ∈ A; it is continuous in g (continuity of the action) and a cocycle: b⁻¹((gh)•b) = b⁻¹(g•b)·g•(b⁻¹(h•b)). Replacing b by ba replaces the cocycle by a⁻¹·(cocycle) under the twisted-conjugation action, so the class is unchanged.
2. Exactness at (B/A)^G: δ(bA) is trivial iff b⁻¹(g•b) = a(g•a)⁻¹ for some a ∈ A and all g, iff ba is G-invariant, iff bA comes from B^G. The same computation with two points gives the orbit statement.
3. Exactness at H¹(G, A): the image of [c] in H¹(G, B) is trivial iff c(g) = b⁻¹(g•b) for some b ∈ B, and then bA ∈ (B/A)^G and δ(bA) = [c].
4. Exactness at A^G and B^G is exactness of the underlying sets of invariants.
5. (b) If A is normal, B/A is a topological group (Mathlib's quotient topology, QuotientGroup.continuous_mk, open quotient map), and G × B/A → B/A is continuous since G × B → G × B/A is an open quotient map. If c ∈ Z¹(G, B) maps to a coboundary x(g•x)⁻¹ of B/A, lift x to b ∈ B (one element, so no continuity issue): the cocycle b⁻¹·c takes values in A, is continuous for the subspace topology, and its class maps to [c].

Acceptance cases:

- Kim's crystalline condition: for U_n(R) ≤ U_n(B_cr ⊗ R), the image of H⁰(G_v, U_n(B_cr ⊗ R)/U_n(R)) → H¹(G_v, U_n(R)) is the set of crystalline torsors (Kim 2009, §3); this is (a) for a subgroup that is not normal.
- Exactness is of pointed sets: two elements of H¹(G, A) with the same image in H¹(G, B) need not differ by an element of (B/A)^G unless one of them is the base point; the fibres over other points are described after twisting (NC.3/twisting).

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/functoriality, mathlib:FixedPoints.subgroup, mathlib:Subgroup.Normal, mathlib:QuotientGroup.Quotient.group, mathlib:QuotientGroup.continuous_mk, mathlib:QuotientGroup.isOpenMap_coe, mathlib:MulAction.QuotientAction.

Sources:

- Kim 2005, §1, p. 9. The sequence H⁰(G, B/A) → H¹(G, A) → H¹(G, B) for a subgroup A ≤ B that need not be normal.
- Kim 2009, §3, p. 19. The connecting map from invariants of a coset space, used for the crystalline condition.

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

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/abelian-comparison, AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence, AnabelianGeometryAndNonabelianChabauty:NC.3/twisting, tauceti:TauCeti.ContCohomology.H2, tauceti:TauCeti.ContCohomology.H2pi, tauceti:TauCeti.ContCohomology.Z2, tauceti:TauCeti.ContCohomology.B2, mathlib:Subgroup.center.

Sources:

- Kim 2005, §1, proof of Proposition 2, p. 8. The connecting map H¹(G, U_n) → H²(G, U^{n+1}/U^{n+2}) built from an algebraic splitting and the coboundary of a lift.
- Kim 2005, §1, proof of Proposition 2, p. 9. The action of H¹ of the central subgroup, its orbits and its freeness under vanishing invariants.
- Kim 2009, §3, p. 26. The same structure for Selmer varieties.

### Twisting by a cocycle

Declaration: TauCeti.NonabelianCohomology.Twist. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/twisting.

Let c ∈ Z¹(G, U). The twisted group ₍c₎U is U with the action g ⋆ u := c(g)·(g•u)·c(g)⁻¹, again a continuous action by automorphisms. The map τ_c : Z¹(G, ₍c₎U) → Z¹(G, U), c′ ↦ (g ↦ c′(g)·c(g)), is a bijection carrying the trivial cocycle to c and the twisted-conjugation action of U on the left to that on the right; it induces a bijection of pointed sets H¹(G, ₍c₎U) ≅ H¹(G, U) sending the base point to [c]. Twisting is compatible with G-stable subgroups (for cocycles with values in them) and with quotients by normal ones, so that fibres of the maps in NC.3/exact-sequence over [c] become fibres over the base point after twisting. Lean: `TauCeti.NonabelianCohomology.Twist c` (a type synonym of U) and `TauCeti.NonabelianCohomology.H1.twistEquiv c`.

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

### AnabelianGeometryAndNonabelianChabauty:NC.0 — not_read

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

The sources are:

- **Kim, *The motivic fundamental group of P¹ ∖ {0, 1, ∞} and the theorem of Siegel*** (arXiv:math/0409456v1; Invent. Math. 2005). §1 was read in full.
- **Kim, *The unipotent Albanese map and Selmer varieties for curves*** (arXiv:math/0510441v4; Publ. RIMS 2009). The introduction and the local-condition passages of §3 were read.
- **Poonen, *Rational points on varieties*** (author PDF). §1.3.5, Exercise 1.9, §4.5, §5.11 and §5.12.4 were read.

The sha256 of each file is in sourceVersions. Serre's *Galois Cohomology*, the standard reference for nonabelian H¹, is not freely available. Its inflation–restriction sequence is therefore listed as remaining work rather than cited. The other statements here are proved from first principles, and their proof steps say so. No mistakes in the sources were found.

The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. All 32 baseline declarations are in the pinned declaration index, and their heads were read in the pinned sources. Among them are Mathlib's actions, orbit quotients, fixed-point subgroups and quotient groups, and Tau Ceti's explicit continuous cohomology: `ContCohomology.Z1`, `B1`, `H1`, `H2`, `Z2` and `B2`. Mathlib does not provide the `MulDistribMulAction` on `Multiplicative M` that the comparison needs, so the comparison node supplies it.

The planets are:

- Nonabelian cohomology set H¹(G, U);
- Exact sequence of nonabelian cohomology;
- Central extensions and the connecting map to H²;
- Torsors and nonabelian H¹.

The suggested Lean file states the definitions, functoriality, the comparison, the exact-sequence and central-extension statements (in terms of an embedding A ↪ B), twisting and torsors. It is not compiled.
