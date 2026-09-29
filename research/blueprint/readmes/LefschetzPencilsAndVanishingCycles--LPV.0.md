# Lefschetz pencils, nearby cycles and vanishing cycles — part LPV.0

## Purpose

This roadmap builds the geometric inputs of Deligne's proof of the Weil conjectures and of the campaign's degeneration arguments. It starts with nearby and vanishing cycles over a henselian trait (LPV.0), their inertia actions (LPV.1) and their computation at an ordinary quadratic singularity, which is the Picard–Lefschetz formula (LPV.2). It then treats Lefschetz pencils and their existence (LPV.3), the vanishing part of the middle cohomology of a pencil (LPV.4), and the irreducibility and open-image theorems for its monodromy (LPV.5). Perverse nearby cycles (LPV.6) are the last layer of this part. The invariant-cycle and semistable-curve exports (LPV.7) are part LPV.7.

Checkpoint 1 carries the reviewed decomposition of SGA 7 XIII and XV (nearby cycles, variation, the local computations at an ordinary quadratic point), keeping its node identifiers, which other packets already cite. It adds Deligne's *La conjecture de Weil. I* §§4–5, the source the stages cite for LPV.2–LPV.5.

## Scope and boundaries

RS-17 is accepted. It keeps LPV.0, LPV.2, LPV.3 and LPV.5 and narrows three layers:

- **LPV.1** keeps the geometric variation, quasi-unipotence and monodromy filtration. It imports the tame character and the arithmetic Weil–Deligne carrier from ArithmeticGaloisRepresentations R01.2, which this packet requests.
- **LPV.4** keeps the pencil's own local systems, vanishing cycles, E and E^⊥, and the radical quotient. It imports the general blow-up and projective-bundle formulas from EtaleDualityAndPerverseSheaves EDC.4.
- **LPV.6** keeps nearby-cycle t-exactness and the IG.4 support criterion. It imports the perverse category from EDC.5 and EDC.6.

Other suppliers:

- Étale sheaves, derived direct images and the base-change theorems come from SchemeAndStackFoundations SF.2.
- Poincaré duality and the trace come from EDC.2.
- Étale fundamental groups, inertia, the tame quotient and Abhyankar's lemma come from InverseGaloisAndArithmeticFundamentalGroups IG.0–IG.1.
- DeligneWeightsAndPurity (DWP.3) consumes LPV.3–LPV.5 over 𝔽_q; ClassicalAdicEtaleCohomology H1 consumes LPV.0.

## Conventions

- S is a henselian trait with closed point s, generic point η, geometric generic point η̄ and inertia group I. ℓ is a prime invertible on S.
- RΨ and RΦ are the nearby- and vanishing-cycle functors of SGA 7 XIII. The vanishing triangle is sp^* i^*K → RΨ_η(K_η) → RΦ(K) →.
- A Lefschetz degeneration of relative dimension n has n = 2m or 2m + 1, and its vanishing cycle is δ ∈ H^n(X_η̄, ℚ_ℓ)(m). The pairing (x, y) is Tr(x ∪ y).
- t_ℓ : I → ℤ_ℓ(1) is the tame character. For p ≠ 2, ε is the character of order 2 of I.
- In a pencil, U = D − S is the smooth locus, u ∈ U is a base point, and E ⊂ H^n(X_u, ℚ_ℓ) is the vanishing subspace.

## LPV.0 Nearby and vanishing cycles on actual sites

### Objects

#### Definition. Conventions on henselian traits and geometric points (XIII 0.2) and Galois sheaves on schemes over a field (XIII 1.1)

*Module* `TauCeti/AlgebraicGeometry/VanishingCycles/Trait.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`.

0.2: a trait is the spectrum of a discrete valuation ring; henselian/strictly henselian as usual; for S = Spec V a henselian trait, s is the closed point, η the generic point, η̄ a geometric generic point (localized at η) and s̄ the corresponding geometric closed point (I 0.0.3); S̄ is the spectrum of the normalization of V in k(η̄), with residue field an inseparable extension of k(s̄); Gal(η̄/η) and the exact sequence 1 -> I -> Gal(η̄/η) -> Gal(s̄/s) -> 1 with I the inertia group (display lost in OCR); 'sheaf' means sheaf on the étale site; a torsion sheaf is prime to the residue characteristics if multiplication by the characteristic exponent of each k(s) is an automorphism. 1.1: for Y over a field k with separable closure k̄ and Ȳ = Y ⊗ k̄, a continuous homomorphism u: G -> Gal(k̄/k) of a profinite group, an action of G on a sheaf of sets S on Ȳ compatible with the action on Ȳ is continuous (1.1.2) if for every quasi-compact étale U -> Y, G acts continuously on the discrete set S(Ū); Rappel 1.1.3: the functor F ↦ F̄ with its Gal(k̄/k)-action is an equivalence between sheaves of sets on Y and sheaves on Ȳ with continuous compatible Galois action (proof by writing k̄ as a colimit of finite Galois extensions and Galois descent).

*Hypotheses.*

- S a henselian trait; k(s̄) residue field of S̄ may be an inseparable extension of k(s̄)
- Torsion coefficients prime to the residue characteristic for the abelian theory (2.1.1)

*API.*

- `HenselianTrait` (*structure*) — A henselian trait S = Spec V with closed point s, generic point η, a geometric generic point η̄, the geometric closed point s̄ and S̄ = Spec of the normalisation of V in k(η̄).
- `HenselianTrait.inertia` (*constructor*) — I = ker(Gal(η̄/η) → Gal(s̄/s)), a closed normal subgroup.
- `HenselianTrait.inertia_exact` (*characterisation*) — 1 → I → Gal(η̄/η) → Gal(s̄/s) → 1 is exact; surjectivity uses that V is henselian.
- `galoisSheafEquiv` (*equivalence*) — For Y over a field k, sheaves of sets on Y_ét ≌ sheaves on Ȳ = Y ⊗ k̄ with a continuous Gal(k̄/k)-action compatible with the action on Ȳ (XIII 1.1.3).
- `galoisSheafEquiv_spec` (*simp*) — For Y = Spec k the equivalence is the classical one with discrete continuous Gal(k̄/k)-sets.

*Used by.*

- `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S` — the galoisian triples describing sheaves on Y ×_s S
- `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities` — Ψ_η takes values in continuous Gal(η̄/η)-sheaves on X_s̄
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula` — the inertia group I through which monodromy acts
- `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree` — the trait conventions the analytic comparison matches

*Unit tests.* A wrong definition fails one of these.

- `inertia_eq_top_of_strictlyHenselian` (degenerate) — If V is strictly henselian then Gal(s̄/s) = 1 and I = Gal(η̄/η).
- `inertia_puiseux` (value) — For V the henselisation of k[t] at (t), k algebraically closed of characteristic 0, I = Gal(η̄/η) ≅ Ẑ(1), acting on t^{1/n} through μ_n.
- `inertia_eq_valuation_inertia` (comparison) — I coincides with Mathlib's ValuationSubring.inertiaSubgroup for the valuation subring of k(η̄) over V, as a subgroup of the decomposition group, which here is all of Gal(η̄/η).
- `wild_inertia_ne_bot` (non-example) — For V = the henselisation of 𝔽̄_p[t] at (t), I is not procyclic: the Artin–Schreier extensions x^p − x = t^{-a} (p ∤ a) give infinitely many independent ℤ/p quotients.

*Construction.*

1. Galois descent for the equivalence 1.1.3 (full faithfulness via invariants, essential surjectivity via finite Galois levels).

*Acceptance.*

- For Y = Spec k the equivalence recovers Gal(k̄/k)-sets.

*Uses.* `SchemeAndStackFoundations:SF.2`.

*Sources.*

- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XIII, Rappel 1.1.3, p. 7: “Le foncteur F ↦ F̄ muni de l'action de Gal(k̄/k) est une équivalence de la catégorie des faisceaux d'ensembles sur Y avec la catégorie des faisceaux d'ensembles sur Ȳ munis d'une action continue de Gal(k̄/k) compatible à l'action de Gal(k̄/k) sur Ȳ.” The galoisian description used throughout (OCR cleaned).
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XIII, 0.2.5, p. 5: “On note S̄ le spectre du normalisé de V dans k(η̄), de corps résiduel une extension inséparable de k(s̄).” Conventions on S̄ and geometric points.

#### Construction. The specialization morphism sp: S -> s and the 2-fibre-product topos Y ×_s S with its galoisian description (XIII 1.2)

*Module* `TauCeti/AlgebraicGeometry/VanishingCycles/OrientedTopos.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`.

1.2.1: for S local henselian with closed point i: s -> S, S' ↦ S' ×_S s is an equivalence between finite étale S-schemes and finite étale s-schemes; the inverse defines a morphism of sites sp: S -> s (SGA 4 VIII 7) with sp_*F = i^*F (1.2.1.1) and, for F on an open U (or on η), sp_*F = i^*j_*F (1.2.1.2). 1.2.2: for a henselian trait S, sheaves on S are triples (F_s, F_η, φ: F_s -> i^*j_*F_η) (SGA 4 IV 9.5.4); via 1.1, i^*j_* is the functor of I-invariants, so sheaves on S are triples (a Gal(s̄/s)-set F_s̄, a Gal(η̄/η)-set F_η̄, an equivariant φ: F_s̄ -> F_η̄^I); the functors sp^*, sp_*, j^*, j_*, i^*, i_* are written out in these terms (1.2.2(c)). 1.2.3-1.2.4: for Y a scheme over s, the 2-fibre product Y ×_s S of the étale topoi of Y and S over that of s exists (Giraud) and is described by triples (F_s a sheaf on Y, i.e. a sheaf on Ȳ with continuous Gal(s̄/s)-action; F_η a sheaf on Ȳ with continuous Gal(η̄/η)-action compatible via 1.1.1; φ: F_s -> F_η equivariant); Y ×_s S is the union of the open Y ×_s η and the closed complement Y, with the same formulas for sp = pr_1, j, i; 1.2.4.2 independence of the choice of k(η̄); 1.2.5-1.2.6: points of Y ×_s η and Y ×_s S, conservative families, Point(Y ×_s S) ≅ Point(Y) ×_{Point(s)} Point(S); 1.2.7: functoriality in Y (f_*, f^* formulas 1.2.7.1-2 for quasi-compact f) and in S (surjective morphisms of henselian traits, f^* formula 1.2.7.3, f_* as induced representation for finite f); 1.2.8-1.2.9: f_! (extension by zero for locally closed immersions; direct image with proper support formula 1.2.8.1 for f locally of finite type and separated) and its right adjoint f^! for locally closed immersions, extended to quasi-finite f for abelian sheaves (SGA 4 XVIII 3.1.8), with f^! = f^* for étale f.

*Hypotheses.*

- S a henselian trait; Y a scheme over s; the 2-fibre product is taken for the étale topoi (Giraud); readers may take the galoisian description 1.2.4 as the definition
- For non-separably-closed residue field the 2-product must be fibred over Spec(k)_et (introduction, item c))

*API.*

- `OrientedFibreTopos` (*constructor*) — For Y over s, the category of triples (F_s, F_η, φ): F_s a sheaf on Y (a Gal(s̄/s)-sheaf on Ȳ), F_η a continuous Gal(η̄/η)-sheaf on Ȳ, φ : F_s → F_η equivariant (XIII 1.2.4).
- `OrientedFibreTopos.sp_pullback` (*constructor*) — sp^* : sheaves on Y → sheaves on Y ×_s S, F ↦ (F, F, id).
- `OrientedFibreTopos.etaPart` (*constructor*) — The restriction to Y ×_s η, (F_s, F_η, φ) ↦ F_η.
- `OrientedFibreTopos.equivSheavesOnTrait` (*equivalence*) — For Y = s, sheaves on S ≌ triples (F_s̄, F_η̄, φ : F_s̄ → F_η̄^I) (XIII 1.2.2).

*Used by.*

- `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities` — Ψ(F) is a triple (F_s, Ψ_η(F_η), φ)
- `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism` — complexes written as triples with φ injective
- `LefschetzPencilsAndVanishingCycles:LPV.2/direct-images-at-a-lefschetz-degeneration` — R^i f_*ℚ_ℓ on a trait read as the triple (H^i(X_s), H^i(X_η̄), sp)

*Unit tests.* A wrong definition fails one of these.

- `equivSheavesOnTrait_constant` (value) — The constant sheaf Λ on S is the triple (Λ, Λ, id) with I acting trivially.
- `equivSheavesOnTrait_jPushforward` (value) — j_*G for a Gal(η̄/η)-module G is the triple (G^I, G, inclusion).
- `equivSheavesOnTrait_degenerate` (degenerate) — For Y = ∅ the category is the terminal one.
- `not_triple_of_noninvariant` (non-example) — For Y = s, a pair (F_s̄, F_η̄) with an equivariant map φ whose image is not in F_η̄^I is not a sheaf on S: the description 1.2.2 forces φ to land in the inertia invariants.

*Construction.*

1. Equivalence of finite étale covers of S and s (henselian), giving sp.
2. Description of sheaves on S by triples (SGA 4 IV 9.5.4) and identification of i^*j_* with I-invariants.
3. Galoisian description of Y ×_s S; verification of independence (1.2.4.2) by functoriality in the separable closure.

*Acceptance.*

- A sheaf on Y ×_s S restricted to the closed Y is F_s and to the open Y ×_s η is F_η; sp^*(F_s) = (F_s, F_s, id).
- Points (x, s̄) and (x, η̄) form conservative families (1.2.5).

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`.

*Sources.*

- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XIII, Construction 1.2.4, p. 10: “Les faisceaux F sur Y ×_s S s'identifient aux triples (a) F_s est un faisceau sur Y, soit encore un faisceau F_s̄ sur Ȳ = Y ⊗_s s̄, muni d'une action continue de Gal(s̄/s) compatible à l'action de Gal(s̄/s) sur Ȳ (b) F_η est un faisceau F_η̄ sur Ȳ, muni d'une action continue de Gal(η̄/η), compatible à l'action (via 1.1.1) de Gal(η̄/η) sur Ȳ (c) φ est un morphisme équivariant de F_s dans F_η” The galoisian description of the topos (OCR cleaned).
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XIII, 1.2.2(b), p. 9: “Via l'équivalence (a), le foncteur i^*j_* s'identifie au foncteur 'invariants sous I'.” Identification of i^*j_* with inertia invariants.

#### Construction. The left exact functor Ψ: (sheaves on X) -> (sheaves on X_s ×_s S), its η-part Ψ_η = ī^* j̄_*, and its functorialities (XIII 1.3)

*Module* `TauCeti/AlgebraicGeometry/VanishingCycles/Psi.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`.

1.3.1-1.3.2: for p: X -> S over a henselian trait, with X̄ = X ×_S S̄, the cartesian diagram X_s̄ -> X̄ <- X_η̄ over s̄ -> S̄ <- η̄; for F a sheaf on X_η with pullback F_η̄ on X_η̄ put Ψ_η(F) = ī^* j̄_* F_η̄ (1.3.2.2), a sheaf on X_s̄ with continuous Gal(η̄/η)-action compatible with the action on X_s̄, i.e. a sheaf on X_s ×_s η; Ψ_η is left exact (1.3.2.3). 1.3.3: for F on X with restrictions F_η, F_s, put Ψ(F)_η = Ψ_η(F_η), Ψ(F)_s = F_s, and φ induced by the adjunction F -> j_*j^*F; Ψ(F) = (F_s, Ψ_η(F_η), φ) is a sheaf on X_s ×_s S and Ψ is left exact (1.3.3.3); 1.3.4 notations. 1.3.5-1.3.10 (functorialities, useful mainly in derived form): for f: X -> X' over S, base change gives Ψ f_* -> f_* Ψ (1.3.6.1), an isomorphism for f proper (SGA 4 XII 5.1(i)), whose essential case X' = S is Γ(X_η̄, F) -> Γ(X_s̄ ×_s η̄, Ψ_η F) (1.3.6.3); f^*Ψ -> Ψ f^* (1.3.7.1); for f quasi-finite, f_!Ψ -> Ψ f_! (1.3.8.1), inverse of 1.3.6.1 for f finite; Ψ f^! -> f^! Ψ (1.3.9.1), inverse of 1.3.7.1 for f étale; base change of traits S' -> S: f^*Ψ -> Ψ f^* (1.3.10.1).

*Hypotheses.*

- S a henselian trait; X any S-scheme; sheaves of sets (pointed sets for f_!)
- Ψ is not in general the direct image of a morphism of topoi (1.3.1)

*API.*

- `psiEta` (*constructor*) — Ψ_η(F) = ī^* j̄_* F_η̄, a continuous Gal(η̄/η)-sheaf on X_s̄ (XIII 1.3.2.2).
- `psi` (*constructor*) — Ψ(F) = (F_s, Ψ_η(F_η), φ) on X_s ×_s S, φ from F → j_*j^*F (XIII 1.3.3).
- `psi_leftExact` (*characterisation*) — Ψ and Ψ_η are left exact.
- `psi_pushforward` (*compatibility*) — The base-change map Ψ f_* → f_* Ψ, an isomorphism for f proper (XIII 1.3.6).

*Used by.*

- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle` — RΨ is the right derived functor of Ψ
- `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree` — the underived functor compared with the analytic construction
- `ClassicalAdicEtaleCohomology:H1/nearby-versus-vanishing-cycles` — Ψ versus Φ at the underived level

*Unit tests.* A wrong definition fails one of these.

- `psiEta_trait` (value) — For X = S, Ψ_η(F) is F_η̄ with its Gal(η̄/η)-action.
- `psiEta_ne_invariants` (non-example) — For X = S, Ψ_η(F) = F_η̄ differs from i^*j_*F = F_η̄^I whenever I acts nontrivially: using j_* in place of j̄_* loses the inertia action.
- `psiEta_smooth_constant` (value) — For X smooth over S and Λ constant, Ψ_η(Λ) = Λ, since the strict henselisations of X̄ at points of X_s̄ are normal domains.
- `psi_proper_pushforward_id` (degenerate) — For f = id the base-change map is the identity.

*Construction.*

1. Define Ψ_η by pullback to η̄, direct image to X̄ and restriction to X_s̄; check the Galois action.
2. Assemble the triple with the adjunction map; derive the functorialities from base change maps.

*Acceptance.*

- For X = S, Ψ_η(F) is the Gal(η̄/η)-set F_η̄ viewed over s̄ and Ψ(F)_s = F_s with φ: F_s -> F_η̄^I.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`, `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `SchemeAndStackFoundations:SF.2`.

*Sources.*

- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XIII, 1.3.1, p. 13: “Ce foncteur n'est pas en général le foncteur image directe d'un morphisme de topos.” Nature of Ψ.
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XIII, 1.3.6, p. 15: “Le morphisme de changement de base induit un morphisme de foncteurs Ψ f_* -> f_* Ψ qui est un isomorphisme pour f propre (SGA4 XII 5.1(i)).” Proper compatibility at the underived level (OCR cleaned).

#### Construction. The variation Var(σ): Φ(K)_η -> K_η for a complex K on Y ×_s S and σ in the inertia group (XIII 1.4)

*Module* `TauCeti/AlgebraicGeometry/VanishingCycles/Variation.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`.

1.4.1-1.4.2: for K a complex of A-modules on Y ×_s S, i.e. a triple (K_s, K_η, φ) with K_s̄, K_η̄ complexes on Ȳ with continuous Gal(s̄/s), resp. Gal(η̄/η), actions and φ equivariant, K is homotopic to a triple K' with φ' injective and the sequence 0 -> K'_s -> K'_η -> coker(φ') -> 0 (1.4.2.1) split degreewise (take K'_η the sum of K_η and the cone of sp^*K_s); Φ(K) := coker(φ') gives a distinguished triangle sp^*K_s -> K_η -> Φ(K) -> in K(Y ×_s η, A) depending only on K (1.4.2.2), passing to the derived category and yielding the long exact sequence ... -> H^i(V, K_s) -> H^i(V, K_η) -> H^i(V, Φ(K)_η) -> ...; 1.4.3: the inertia group I acts trivially on K'_s, so for σ ∈ I the endomorphism σ − 1 of K'_η factors through Var(σ): coker(φ') -> K'_η; in the derived category this defines the variation Var(σ): Φ(K)_η -> K_η (1.4.3.1) with σ = 1 + Var(σ)q on K_η (1.4.3.2), σ = 1 + q Var(σ) on Φ(K)_η (1.4.3.3), q: K_η -> Φ(K)_η the natural map, and Var(στ) = Var(σ) q Var(τ) + Var(σ) + Var(τ) (1.4.3.4).

*Hypotheses.*

- A a ring (or a sheaf of rings on Y); K ∈ D(Y ×_s S, A)
- I acts trivially on the s-part

*API.*

- `variation` (*constructor*) — Var(σ) : Φ(K)_η → K_η for σ ∈ I and K a complex on Y ×_s S, defined on a representative with φ' injective (XIII 1.4.3).
- `variation_left` (*characterisation*) — σ = 1 + Var(σ) ∘ q on K_η.
- `variation_right` (*characterisation*) — σ = 1 + q ∘ Var(σ) on Φ(K)_η.
- `variation_mul` (*compatibility*) — Var(στ) = Var(σ) q Var(τ) + Var(σ) + Var(τ).
- `variation_wellDefined` (*compatibility*) — Var(σ) depends only on K in the derived category, not on the representative K'.

*Used by.*

- `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2` — the variation formula at an ordinary quadratic point, n even
- `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3` — the variation formula at an ordinary quadratic point, n odd
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula` — the monodromy on H^n(X_η̄) through σ = 1 + Var(σ) q
- `ClassicalAdicEtaleCohomology:H1/variation-on-analytic-cohomology` — transport of Var to analytic cohomology

*Unit tests.* A wrong definition fails one of these.

- `variation_one` (degenerate) — Var(1) = 0.
- `variation_of_phi_zero` (value) — If Φ(K) = 0 then Var(σ) = 0 and I acts trivially on K_η, by σ = 1 + Var(σ) q.
- `variation_picardLefschetz` (value) — At an ordinary quadratic point in odd relative dimension n = 2m + 1, Var(σ)(a) = (−1)^{m+1} t_ℓ(σ)(a, δ)δ, which is nonzero when t_ℓ(σ) ≠ 0 and δ ≠ 0 (XV 3.3).
- `variation_ne_sub_one` (non-example) — Var(σ) is not σ − 1: it goes from Φ(K)_η to K_η, and σ − 1 on K_η is Var(σ) ∘ q, which vanishes on the image of K_s.

*Construction.*

1. Replace K by a homotopic triple with injective, degreewise split φ'; define Φ as the cokernel; factor σ − 1 through Φ.

*Acceptance.*

- The variation determines the inertia action on K_η through 1.4.3.2; the cocycle rule 1.4.3.4 is the algebraic analogue of the classical variation.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`, `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`.

*Sources.*

- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XIII, 1.4.3, p. 17: “Le groupe d'inertie I agit trivialement sur K'_s. Pour tout σ ∈ I l'endomorphisme σ − 1 de K'_η se factorise donc par un morphisme Var(σ): coker(φ') -> K'_η” Definition of the variation (OCR cleaned).
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XIII, (1.4.3.2)-(1.4.3.4), p. 17: “σ = 1 + Var(σ) q (sur K_η); σ = 1 + q Var(σ) (sur Φ(K)_η); Var(στ) = Var(σ) q Var(τ) + Var(σ) + Var(τ)” The identities satisfied by Var.

#### Construction. RΨ, RΨ_η, RΦ, the vanishing triangle, the stalk formula and local acyclicity (XIII 2.1.1-2.1.5)

*Module* `TauCeti/AlgebraicGeometry/VanishingCycles/NearbyCycles.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`.

2.1.1: S a henselian trait, A a torsion ring prime to the residue characteristic p (more generally a torsion sheaf of rings prime to the residue characteristics; the main case A = Z/ℓ^n, ℓ invertible on S). 2.1.2: RΨ: D^+(X, A) -> D^+(X_s ×_s S, A) and RΨ_η: D^+(X_η, A) -> D^+(X_s ×_s η, A) are the derived functors of Ψ, Ψ_η; since restriction of an injective to the open X_η stays injective and pullback to X_η̄ is acyclic, (2.1.2.1) RΨ(K)_s = i^*K, (2.1.2.2) RΨ(K)_η = RΨ_η(K_η), (2.1.2.3) RΨ_η(K)_η̄ = ī^* R j̄_* K_η̄ (displays partly lost in OCR); with RΨ_η(K) := (RΨ(K))_η, RΦ(K) := Φ(RΨ(K)) the triangle 1.4.2.2 becomes the distinguished triangle sp^* i^*K -> RΨ_η(K_η) -> RΦ(K) -> (2.1.2.4) on X_s ×_s η, with the variation Var(σ): RΦ(K)_η -> RΨ_η(K) (2.1.2.5); the R^iΨ(A) (or R^iΨ(K)) are the sheaves of vanishing cycles (Deligne's terminology for the nearby-cycle sheaves). 2.1.3-2.1.4 (stalk formula): for a geometric point x̄ of X_s̄ and the strict henselization X_(x̄), a scheme over the strict henselization S^nr with geometric generic point η̄^nr, (RΨ(K))_(x̄, η̄) = RΓ(X_(x̄) ×_{S^nr} η̄, K), in particular R^iΨ(K)_(x̄,η̄) = H^i(X_(x̄) ×_{S^nr} η̄, K) — the cohomology of the strict-local geometric Milnor fibre. 2.1.5 (local acyclicity, from SGA 4 XV 2.1): if f is smooth and F locally constant then RΦ(F) = 0; more generally RΦ(K) = 0 where f is smooth and the H^i(K) are locally constant.

*Hypotheses.*

- A torsion, prime to the residue characteristic (0.2.7); K ∈ D^+
- The stalk formula uses the strict henselization at x̄ and the strict henselization S^nr of the trait
- Local acyclicity of smooth morphisms is imported from SGA 4 XV 2.1

*API.*

- `RPsi` (*constructor*) — RΨ : D⁺(X, A) → D⁺(X_s ×_s S, A), the right derived functor of Ψ, with RΨ(K)_s = i^*K and RΨ(K)_η = RΨ_η(K_η) (XIII 2.1.2).
- `RPhi` (*constructor*) — RΦ(K) = Φ(RΨ(K)), in D⁺(X_s ×_s η, A).
- `vanishingTriangle` (*constructor*) — The distinguished triangle sp^* i^*K → RΨ_η(K_η) → RΦ(K) → (XIII 2.1.2.4).
- `RPsi_stalk` (*characterisation*) — R^iΨ(K)_(x̄, η̄) = H^i(X_(x̄) ×_{S^nr} η̄, K), the cohomology of the geometric Milnor fibre (XIII 2.1.4).
- `RPhi_eq_zero_iff_locallyAcyclic` (*characterisation*) — (X, K) is locally acyclic over S if and only if RΦ(K) = 0 (XIII 2.1.5); for f smooth and K constant it holds.

*Used by.*

- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2` — concentration of RΦ at an ordinary quadratic point
- `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence` — the long exact sequence of the triangle on a proper family
- `ClassicalAdicEtaleCohomology:H1/lpv-trait-comparison` — the scheme-side nearby-cycle object
- `AutomorphicGaloisRepresentations:R19.2/carayol-vanishing-cycle-filtration` — the vanishing-cycle sequence of a proper curve

*Unit tests.* A wrong definition fails one of these.

- `RPhi_smooth` (value) — For X → S smooth and K = Λ: RΦ(Λ) = 0 and RΨ_η(Λ) = Λ.
- `RPsi_trait` (degenerate) — For X = S: RΨ_η(K) = K_η̄ with its Gal(η̄/η)-action.
- `RPhi_node` (value) — For X = Spec V[x, y]/(xy − π), π a uniformiser and S strictly henselian: R^iΦ(Λ) = 0 for i ≠ 1, and R^1Φ(Λ) is supported at the origin, free of rank 1 (XV 3.1.2 with n = 1).
- `specialization_direction` (non-example) — For f proper the triangle gives H^i(X_s, K) → H^i(X_η̄, K) → H^i(X_s, RΦ K) → H^{i+1}(X_s, K): specialisation runs from the special to the generic fibre, and the reversed arrow is not a morphism of the triangle.

*Construction.*

1. Derive Ψ using injectives; verify (2.1.2.1)-(2.1.2.3).
2. Apply Φ to obtain the triangle and Var.
3. Stalk: compute (RΨ_η K)_(x̄,η̄) via the strict localization and (2.1.2.3).
4. Local acyclicity: SGA 4 XV 2.1.

*Acceptance.*

- For a smooth family with locally constant coefficients RΦ = 0 and sp^*i^*K ≅ RΨ_η(K_η).
- For a disjoint union, RΨ is computed componentwise (functoriality in X); for a nodal curve over a trait the stalk formula at the node gives the cohomology of the Milnor fibre (an annulus), to be checked against XV §2.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`, `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`, `SchemeAndStackFoundations:SF.2`.

*Planet:* Nearby and vanishing cycles.

*Sources.*

- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XIII, 2.1.1, p. 17: “Soient S un trait hensélien comme en (0.2.5) et A un anneau de torsion premier à la caractéristique résiduelle p de S (0.2.7).” Coefficient hypothesis.
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XIII, Proposition 2.1.4, p. 19: “On a (RΨ(K))_(x̄,η̄) = RΓ(X_(x̄) ×_{S^nr} η̄, K); en particulier, R^iΨ(K)_(x̄,η̄) = H^i(X_(x̄) ×_{S^nr} η̄, K)” Stalk formula (OCR cleaned).
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XIII, Reformulation 2.1.5, p. 19: “Si f est lisse et F un faisceau localement constant, on a RΦ(F) = 0” Local acyclicity.

### Theorems

#### Theorem. Derived functorialities of RΨ (proper and smooth base change, f_!, f^!, change of trait) and the specialization sequence with inertia/variation diagrams (XIII 2.1.6-2.1.8)

*Module* `TauCeti/AlgebraicGeometry/VanishingCycles/Functoriality.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`.

2.1.6: on Y ×_s S, f^* is exact; f_* has a right derived functor with (Rf_*K)_η = Rf_{η*}(K_η), (Rf_*K)_s = Rf_{s*}(K_s) for f quasi-compact (2.1.6.1-2); f_! is exact for f quasi-finite, and in general (f separated of finite type, Y' noetherian) Rf_! := Rf̄_* ∘ j_! for a factorization f = f̄ j (j open immersion, f̄ proper), independent of the factorization by the arguments of SGA 4 XVII; Rf^! is used only for quasi-finite f. 2.1.7 (deriving 1.3.5-1.3.10): RΨ Rf_* -> Rf_* RΨ (2.1.7.1) is an isomorphism for f proper (proper base change, SGA 4 XII 5.1); f^* RΨ -> RΨ f^* (2.1.7.2) is an isomorphism for f smooth (smooth base change, SGA 4 XVI 1.2); Rf_! RΨ -> RΨ Rf_! (2.1.7.3), for f proper the inverse of 2.1.7.1; RΨ Rf^! -> Rf^! RΨ (2.1.7.4) for f quasi-finite, inverse of 2.1.7.2 for f étale; for a surjective change of trait S' -> S, f^*RΨ ≅ RΨ f^* (2.1.7.5); the same for RΨ_η. 2.1.8 (X' = S): for K ∈ D^+(X_η, A), morphisms Rf_* -> Rf_* RΨ (2.1.8.1), Rf_! RΨ -> Rf_! (2.1.8.2), hence RΓ(X_η̄, K) -> RΓ(X_s̄, RΨ_η(K)) (2.1.8.3) and RΓ_c(X_s̄, RΨ_η(K)) -> RΓ_c(X_η̄, K) (2.1.8.4), with commutative diagrams (2.1.8.5-6) relating (R^if_*K)_s̄ -> H^i(X_η̄,K) and the specialization; for σ ∈ I the diagrams (2.1.8.7-8) express σ − 1 on H^i(X_η̄, K) (resp. H^i_c) through H^i(X_s̄, RΨ_η K) -> H^i(X_s̄, RΦ K) -Var(σ)-> H^i(X_s̄, RΨ_η K). For f proper, 2.1.8.1/2.1.8.2 and 2.1.8.3/2.1.8.4 are inverse isomorphisms, and the triangle 2.1.2.4 gives the long exact specialization sequence ... -> H^i(X_s̄, K) -> H^i(X_η̄, K) -> H^i(X_s̄, RΦ(K)) -> ... (2.1.8.9): the vanishing complex RΦ(K) measures the difference between the cohomologies of the geometric fibres, and by 2.1.8.7 the variation determines the inertia action on H^i(X_η̄, K). Properness may be replaced by regularity conditions at infinity on f and K (continuation not read).

*Hypotheses.*

- Rf_! needs f separated of finite type and Y' noetherian; Rf^! only for quasi-finite f
- Proper base change (SGA 4 XII 5.1) and smooth base change (SGA 4 XVI 1.2) are imported
- The specialization sequence 2.1.8.9 as written requires f proper (or the regularity-at-infinity replacement)

*Proof.*

1. Derive the underived functorialities 1.3.5-1.3.10; identify isomorphisms via the base change theorems.
2. Specialize to X' = S and expand the triangle into the long exact sequence; express σ − 1 via Var.

*Acceptance.*

- Direction: specialization goes from H^i(X_s̄, K) to H^i(X_η̄, K) (through RΨ), and RΦ sits in degree shift 0 in the triangle sp^*i^*K -> RΨ_η -> RΦ -> (no shift), so the connecting map raises the degree by one.
- Inertia and Galois equivariance are built into the topos X_s ×_s S (all maps are equivariant).

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.1`.

*Sources.*

- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XIII, 2.1.7.1-2, p. 20: “D'après le théorème de changement de base pour un morphisme propre (SGA4 XII 5.1), ce morphisme est un isomorphisme si f est propre. ... D'après le théorème de changement de base pour un morphisme lisse (SGA4 XVI 1.2), ce morphisme est un isomorphisme si f est lisse.” Proper and smooth compatibilities (OCR cleaned).
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XIII, 2.1.8.9, p. 22: “Le complexe évanescent RΦ(K) exprime donc la différence entre les cohomologies des fibres géométriques X_η̄ et X_s̄ (à valeurs dans l'image réciproque de K). D'après (2.1.8.7), la variation Var(σ) détermine l'action du groupe d'inertie I sur H^i(X_η̄, K). Ces faits sont à la base de toutes les applications de la méthode des cycles évanescents.” The specialization sequence and its use (OCR cleaned).

### What is missing

- XIII §2.2 (trace compatibilities), §2.3 (finiteness in equal characteristic zero) and §2.4 (isolated singularities, including 2.4.6.2 used by XV) are not read; constructibility of RΨ in the excellent finite-type trait setting (SGA 4½ [Th. finitude]) is not read.
- The oriented-product-topos construction is given only in galoisian form; its comparison with Grothendieck's Exposé I §2 formalism and with the local-acyclicity definition named in the stage is not planned.
- Displays of XIII 2.1.2.3 and 2.1.8.3–8 are partly lost in the OCR and are reconstructed from the surrounding text.

## LPV.1 Inertia, variation and the monodromy operator

No nodes in this checkpoint.

### What is missing

- The canonical and variation morphisms on cohomology, the monodromy operator N as a finite logarithm with its independence of the tame generator (N : V → V(−1)), geometric quasi-unipotence (SGA 7 I) and the monodromy filtration (Weil II 1.6–1.7) are not planned. The variation morphism itself is in LPV.0, and the tame character is requested from ArithmeticGaloisRepresentations:R01.2, as RS-17 directs.

## LPV.2 Ordinary quadratic singularities and Picard–Lefschetz

### Theorems

#### Theorem. Concentration and rank of the nearby cycles at ordinary quadratic singular points (XV 3.1.1-3.1.2)

*Module* `TauCeti/AlgebraicGeometry/VanishingCycles/QuadraticPoint.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`.

3.1.1: S a henselian trait, f: X -> S flat of finite type, purely of relative dimension n, with special fibre X_s smooth except at a finite set of points where X_s has an ordinary quadratic singularity (the source calls this set Sigma'); Sigma (source) = E (this packet) is the subset of those points near which the GENERIC fibre X_eta is smooth; Lambda a torsion ring prime to the residue characteristic of S. NOTATION MAP: the source's Sigma' is this packet's Sigma, and the source's Sigma is this packet's E. Proposition 3.1.2: (i) the sheaves R^i Phi(Lambda) are zero for i != n; (ii) the sheaf R^n Phi(Lambda) is ZERO OUTSIDE E (source: 'nul en dehors de Sigma'), and its restriction to E is a sheaf of Lambda-modules of rank 1; (iii) for every geometric point xbar of E, the form (a,b) of 2.2.5(C) puts the Lambda-modules (R^n PSI(Lambda))_xbar and H^n_{xbar}(R^n PSI_eta(Lambda)) in duality - note that part (iii) is stated with PSI, not Phi - and these are free of rank one for n != 0, of rank 2 for n = 0. Proof: the assertions are local for the etale topology, so one may assume S strictly henselian and X the hypersurface of the relative affine space A^{n+1}_S defined by a quadratic equation satisfying 2.2.1 (a)(b) (apply 1.3.2); f is smooth at every point of X_s - Sigma'(source), so R Phi = 0 outside Sigma'(source); by 2.2.4 R Phi is even zero outside Sigma(source) = E; one may then assume 2.2.5 (*), and (ii),(iii) follow from 2.2.5 (A)(B)(C).

*Hypotheses.*

- f flat of finite type of pure relative dimension n; X_s smooth outside finitely many ordinary quadratic points; A torsion prime to the residue characteristic
- The local computation 2.2.5 (§2 of XV, not read) is the real content; 1.3.2 (local form of ordinary quadratic singularities) not read
- NOTATION: the source writes Sigma' for the set of quadratic singular points of X_s and Sigma for the subset where X_eta is smooth nearby; this packet writes Sigma and E respectively. Every occurrence of 'Sigma' inside a quoted excerpt is the source's Sigma, i.e. this packet's E.

*Proof.*

1. Reduce étale-locally to the standard quadratic hypersurface (1.3.2).
2. Apply local acyclicity off Σ and the computation of §2.2.

*Acceptance.*

- Outside E (points where the generic fibre is not smooth nearby) the vanishing cycles vanish (2.2.4).
- For n = 0 the rank is 2 (two points degenerating to one).

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`.

*Sources.*

- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XV, Proposition 3.1.2, p. 24: “Proposition 3.1.2. (i) Les faisceaux R^i Phi(Lambda) sont nuls pour i != n. (ii) Le faisceau R^n Phi(Lambda) est nul en dehors de Sigma. Sa restriction a Sigma est un faisceau de Lambda-modules de rang 1. (iii) Pour tout point geometrique xbar de Sigma, la forme (a,b) (2.2.5 (C)) met en dualite les Lambda-modules (R^n psi(Lambda))_xbar et H^n_{xbar}(R^n psi_eta(Lambda)).” The full printed statement, read from a 300 dpi rendering of the page image (the OCR of this scan renders 'nul' as 'seul' and loses the Phi/psi distinction). Note that the source's Sigma is this packet's E, and that part (iii) is about psi, not Phi. (part 1 of 2 of the passage)
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XV, Proposition 3.1.2, p. 24: “Ceux-ci sont libres de rang un pour n != 0, de rang 2 pour n = 0.” The full printed statement, read from a 300 dpi rendering of the page image (the OCR of this scan renders 'nul' as 'seul' and loses the Phi/psi distinction). Note that the source's Sigma is this packet's E, and that part (iii) is about psi, not Phi. (part 2 of 2 of the passage)
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XV, proof of 3.1.2, p. 24: “Les assertions de 3.1.2 sont de nature locale pour la topologie étale. Ceci permet de ne traiter que le cas où S est strictement hensélien, et où X est l'hypersurface de l'espace affine relatif A^{n+1}_S défini par une équation quadratique vérifiant 2.2.1 (a) (b) (appliquer 1.3.2).” Reduction to the standard model.

#### Theorem. Even relative dimension n = 2m: the natural generator ±δ of H^n_{x}(R^nΦ(A(m))), the quadratic character ε_x of inertia and Var(σ)(a) = (−1)^m (ε_x(σ) − 1)/2 · (a,δ)δ (XV 3.2.1-3.2.3)

*Module* `TauCeti/AlgebraicGeometry/VanishingCycles/QuadraticPoint.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`.

Notation of 3.1 with n = 2m, S strictly henselian (general case by descent). Proposition 3.2.1: (i) for x ∈ E the group H^n_{x}(R^n Psi_eta(A(m))) (the source writes psi_eta here, not Phi) has a natural generator δ, well defined up to sign, characterised by naturality in A and (δ,δ) = (−1)^m·2 (for n = 0 add Tr(δ) = 0); (ii) for a suitable character ε_x: I -> {±1} of the inertia group (independent of A), Var(σ)(a) = (−1)^m ((ε_x(σ) − 1)/2)(a δ) δ for a ∈ R^n Φ_η(A(m)), whence σ(δ) = ε_x(σ) δ. Proof: pass to the universal case A = Z_ℓ; up to sign only one δ satisfies (i); reduce as in 3.1.2 to 2.2.5 and apply 2.2.5 (D). Complément 3.2.2: if the henselization of X at x is that of the projective quadric Σ a_ij X_i X_j = 0 at x_0, ε_x is defined by the separable quadratic extension of the fraction field given by the centre of the even Clifford algebra Z(C^+(Q)). 3.2.3: in residue characteristic ≠ 2, I has a unique nontrivial character ε of order 2 (σ(√t) = ε(σ)√t for a uniformizer t); X_(x) is the henselization at 0 of Σ a_ij x_i x_j = b with b in the maximal ideal and Q nondegenerate; the centre of the Clifford algebra is k(η)(√((−1)^{m+1}·2b·det(a_ij))) (Bourbaki Alg. ch. 9 §9 no. 4), so ε_x = ε^{v(b)}: the variation vanishes if v(b) is even and ε_x = ε otherwise.

*Hypotheses.*

- n = 2m even; S strictly henselian; x ∈ E
- 3.2.3 requires residue characteristic ≠ 2 and uses the Clifford-algebra description; the characteristic-2 case is only covered by 3.2.2's Clifford-centre description
- The proof depends on 2.2.5(D) (not read)
- NOTATION as in the 3.1.2 node: the source's Sigma is this packet's E. Part (i) of 3.2.1 is about R^n psi_eta and part (ii) about R^n Phi_eta; the two are genuinely different functors and the source uses both on the same page.

*Proof.*

1. Universal case A = Z_ℓ and uniqueness of δ up to sign.
2. Reduction to the standard quadric and 2.2.5(D).
3. Clifford-algebra computation of ε_x.

*Acceptance.*

- For v(b) even the local monodromy is trivial in even relative dimension; for v(b) odd it is the reflection σ(δ) = −δ (when ε_x(σ) = −1).
- Sign convention: (δ,δ) = (−1)^m·2 fixes δ up to sign; the n mod 4 sign table of the stage must be checked against this normalisation.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`, `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`.

*Sources.*

- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XV, Proposition 3.2.1, pp. 24-25: “Proposition 3.2.1. (i) Pour x in Sigma, le groupe H^n_{x}(R^n psi_eta(Lambda(m))) a un generateur naturel delta, bien defini au signe pres, caracterise par les conditions d'etre naturel en Lambda et de verifier (delta,delta) = (-1)^m 2 (pour n = 0, ajouter la condition Tr(delta) = 0).” The full printed statement, read from 300 dpi and 200 dpi renderings of printed pages 24-25. Part (i) uses psi_eta and part (ii) uses Phi_eta; the source's 'x in Sigma' is this packet's 'x in E'. (part 1 of 2 of the passage)
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XV, Proposition 3.2.1, pp. 24-25: “(ii) Pour un caractere epsilon_x : I -> {+-1} convenable (independant de Lambda) du groupe d'inertie I, la variation s'ecrit Var(sigma)(a) = (-1)^m ((epsilon_x(sigma) - 1)/2)(a delta) delta (pour a in R^n Phi_eta(Lambda(m))). Il resulte que sigma(delta) = epsilon_x(sigma) . delta.” The full printed statement, read from 300 dpi and 200 dpi renderings of printed pages 24-25. Part (i) uses psi_eta and part (ii) uses Phi_eta; the source's 'x in Sigma' is this packet's 'x in E'. (part 2 of 2 of the passage)
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XV, 3.2.3, pp. 25-26: “La variation est nulle si b est de valuation paire, et sinon ε_x = ε” Explicit character in residue characteristic ≠ 2.

#### Theorem. Odd relative dimension n = 2m+1: the character c_b, the vanishing cycle ±δ_x from the primitive quotient of the tangent quadric, and the Picard-Lefschetz formulas Var(σ)(a) = (−1)^{m+1} c_{b(x)}(σ)(aδ)δ and σ(a) = a + (−1)^{m+1} c_{b(x)}(σ)(aδ_x)δ_x (XV 3.3.1-3.3.6)

*Module* `TauCeti/AlgebraicGeometry/VanishingCycles/QuadraticPoint.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`.

3.3.1: S = Spec A strictly local noetherian, f: X -> S flat of finite type of pure relative dimension n whose special fibre has only nondegenerate quadratic singular points; near a singular x_0, X/S is locally isomorphic to Q − b = 0 in A^{n+1}_S with b in the maximal ideal and Q a nondegenerate quadratic form; the ideal (b) ⊆ A depends only on (X/S, x_0) (near x there is a section over Spec A/(b) along which the relative Jacobian ideal is trivial); b(x) denotes a generator. 3.3.2: for S normal, n invertible in A and b ≠ 0, ε_b^{(n)} (the source's notation; this packet previously wrote c_b) is the homomorphism from the Galois group of the fraction field of A to Z/(n)(1) given by ε_b^{(n)}(σ) = (σ ⁿ√b)/ⁿ√b — NOTE: ⁿ√b, not ⁿ√(−b) — satisfying (ε_b^{(nm)})^m = ε_b^{(n)}; for Λ a Z/n-algebra one writes ε_b again for the composite Gal -> Z/(n)(1) -> Λ(1), independent of n; the character ε_b factors through π_1(S − (sous-schéma b = 0)). 3.3.3: for S a strictly henselian trait, n = 2m+1, x a singular point near which X is smooth, and X_1/S the local model Q − b = 0 (b ≠ 0 in the maximal ideal): with X_s(x) the henselization, X̃_s(x) its blow-up at x, Y the exceptional quadric, the composite H^{n−1}(Y, A(m)) <- H^{n−1}(X̃_s(x), A(m)) -> H^{n−1}(X_s(x) − {x}, A(m)) -> H^n_{x}(X_s, A(m)) -> H^n_{x}(X_s, RΨ(A(m))) identifies the last group with the primitive quotient (XII 3.5) of the cohomology of the quadric Y (by 2.2.7 in a locally isomorphic situation); the images of the two natural generators of that quotient (classes of the generatrices of Y) are the basis vectors ±δ of H^n_{x}(X_s, RΨ(A(m))). 3.3.4: in the general setting of 3.3.1 with n = 2m+1, ±δ_x ∈ H^0(S, R^n f_! A(m)) are the images of the primitive generators via H^{n−1}(Y, A(m)) <- ... -> H^n_c(X_s, A(m)) -> H^0(S, R^n f_! A(m)); ±δ_x is the vanishing cycle at x; for S a trait, ±δ ∈ H^n_c(X_η̄, A(m)) is the image under XIII 2.1.8.4 of the class ±δ of 3.3.3. Proposition 3.3.5: for S a henselian trait and X/S as in 3.3.3, the variation is Var(σ)(a) = (−1)^{m+1} ε_{b(x)}(σ)(aδ)δ. Proposition 3.3.6: for S strictly local regular and f: X -> S proper and flat of relative dimension n = 2m+1 with exactly one non-smooth point x of X_s, quadratic nondegenerate, and b(x) a parameter, Galois acts on the cohomology of the geometric generic fibre by σ(a) = a + (−1)^{m+1} ε_{b(x)}(σ)(aδ_x)δ_x. Proof (read up to step (B)): the odd case is reduced to the transcendental case of XIV 3.2.11 by a specialization argument over a base of dimension > 1, handled ad hoc; (A) for k algebraically closed of characteristic 0 and S the henselization of Spec k[T] at 0 with b(x) a uniformizer, by the Lefschetz principle assume k = C, reduce to the base change of Σ z_i^2: C^{n+1} -> C, identify ±δ with the transcendental vanishing cycle via XIV 2.1, and deduce 3.3.5 from XIV 3.2.11 (modulo a compatibility of XIV 2.1 with cup products and traces, noted by the source as not fully verified); (B) 3.3.6 in the situation of (A) with X proper follows from XIII 2.4.6.2; (C) mixed-characteristic case via the strict henselization of Spec Z[T] — not read.

*Hypotheses.*

- n = 2m+1 odd; S strictly local noetherian (3.3.1), strictly henselian trait (3.3.3, 3.3.5), strictly local regular with b(x) a parameter and f proper (3.3.6)
- A torsion prime to the residue characteristic; the character c_b needs n invertible
- Imports not read: XV §2 (2.2.5-2.2.7), XII 3.5 (primitive cohomology of quadrics), XIV 2.1 and 3.2.11 (transcendental vanishing cycles and Picard-Lefschetz), XIII 2.4.6.2 (isolated singularities), and steps (C) onward of the proof
- CORRECTED BY INDEPENDENT REVIEW from the page image: the character is the source's epsilon_b, its target is Z/(n)(1) (then Lambda(1)), and its formula is (sigma n-sqrt(b))/n-sqrt(b) with no sign change on b.

*Proof.*

1. Local model and the invariant (b) (3.3.1); the Kummer character c_b (3.3.2).
2. Construction of δ from the primitive quotient of the quadric (3.3.3-3.3.4).
3. Reduction to the transcendental case (A), then (B), (C)... (not read).

*Acceptance.*

- The formula has the sign (−1)^{m+1} and the twist A(m); the quadratic character is replaced by the Kummer character c_b of −b.
- The 'δ = 0' case of the stage (exceptional skyscraper in degree n+1) is not in the read part; 3.1.2(ii) shows R^nΦ vanishes outside E.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`, `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`, `ArithmeticGaloisRepresentations:R01.2`.

*Sources.*

- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XV, 3.3.2, p. 27: “Supposons S normal, et soit b in A. Pour n invertible dans A et b != 0, nous noterons epsilon_b^{(n)} l'homomorphisme suivant du groupe de Galois du corps des fractions de A dans Z/(n)(1) : epsilon_b^{(n)}(sigma) = (sigma n-racine-de-b)/(n-racine-de-b). On a (epsilon_b^{(nm)})^m = epsilon_b^{(n)}. Si Lambda est une Z/n-algebre, on note encore epsilon_b le compose Gal -> Z/(n)(1) -> Lambda(1).” The definition of the character used in Propositions 3.3.5 and 3.3.6, read from a 170 dpi rendering of printed page 27. It fixes the name (epsilon, not c), the target (Z/(n)(1), then Lambda(1)) and the formula (n-th root of b, with no minus sign). (part 1 of 2 of the passage)
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XV, 3.3.2, p. 27: “Il est independant de n. Le caractere epsilon_b se factorise par pi_1(S - (sous-schema b = 0)).” The definition of the character used in Propositions 3.3.5 and 3.3.6, read from a 170 dpi rendering of printed page 27. It fixes the name (epsilon, not c), the target (Z/(n)(1), then Lambda(1)) and the formula (n-th root of b, with no minus sign). (part 2 of 2 of the passage)
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XV, Proposition 3.3.5, p. 28: “Pour S un trait hensélien et X/S comme en 3.3.3, la variation est donnée par Var(σ)(a) = (−1)^{m+1} ε_{b(x)}(σ)(aδ)δ” Read from a 170 dpi rendering of printed page 28. The character is the source's epsilon_{b(x)}, defined in 3.3.2 on printed page 27.
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XV, Proposition 3.3.6, p. 28: “Alors, Galois agit sur la cohomologie de la fibre générale géométrique par σ(a) = a + (−1)^{m+1} ε_{b(x)}(σ)(aδ_x)δ_x” Read from the same rendering; the full hypotheses (S strictly local regular, f proper and flat of relative dimension n = 2m+1, exactly one non-smooth point x of X_s, quadratic nondegenerate, b(x) a parameter) are as the node states.
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XV, 3.3, p. 26: “Pour démontrer la formule de Picard-Lefschetz en dimension relative impaire, nous devrons nous ramener au cas transcendant, traité en XIV 3.2.11.” The proof route through the transcendental case.
- Groupes de monodromie en géométrie algébrique (SGA 7 II), Exposé XV, (A), p. 29: “(en toute rigueur, il faudrait avoir vérifié une compatibilité entre l'isomorphisme XIV 2.1 et les cup-produits et traces)” The source's own caveat.

#### Theorem. The specialisation sequence of a proper family with one ordinary quadratic point

*Module* `TauCeti/AlgebraicGeometry/VanishingCycles/LocalLefschetz.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`.

Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Then: (i) there is a vanishing cycle δ ∈ H^n(X_η̄, ℚ_ℓ)(m), well defined up to sign; (ii) sp : H^i(X_s, ℚ_ℓ) ≅ H^i(X, ℚ_ℓ) → H^i(X_η̄, ℚ_ℓ) is an isomorphism for i ≠ n, n + 1; (iii) there is an exact sequence 0 → H^n(X_s, ℚ_ℓ) → H^n(X_η̄, ℚ_ℓ) → ℚ_ℓ(m − n) → H^{n+1}(X_s, ℚ_ℓ) → H^{n+1}(X_η̄, ℚ_ℓ) → 0 whose middle map is x ↦ Tr(x ∪ δ) and whose other maps are sp.

*Hypotheses.*

- The residue field is algebraically closed; the general case is reached by passing to the strict henselisation.
- ℓ is different from the residue characteristic p.
- X is regular and x is the only point where f fails to be smooth; the generic fibre X_η is then smooth and proper.

*Proof.*

1. Proper base change: H^i(X_s, ℚ_ℓ) = H^i(X, ℚ_ℓ) because S is henselian and f proper, and H^i(X_η̄, ℚ_ℓ) = H^i(X_s̄, RΨ_η ℚ_ℓ) by XIII 2.1.7.1 (finite coefficients ℤ/ℓ^k, then the limit).
2. The vanishing triangle sp^* i^*ℚ_ℓ → RΨ_η ℚ_ℓ → RΦ ℚ_ℓ → gives the long exact sequence … → H^i(X_s) → H^i(X_η̄) → H^i(X_s, RΦ) → H^{i+1}(X_s) → ….
3. By XV 3.1.2, applied with E = {x} (the generic fibre is smooth near x), RΦ(ℚ_ℓ) is concentrated in degree n and supported at x, of rank 1. So H^i(X_s, RΦ) = 0 for i ≠ n, which gives (ii), and H^n(X_s, RΦ) = R^nΦ(ℚ_ℓ)_x is a line.
4. The generator δ of XV 3.2.1 (n even) or of XV 3.3 (n odd) and the duality (a, b) of XV 3.1.2(iii) identify R^nΦ(ℚ_ℓ)_x with ℚ_ℓ(m − n) and the map H^n(X_η̄) → R^nΦ_x with x ↦ Tr(x ∪ δ), δ being the image of the local generator in H^n(X_η̄)(m). This uses XV 2.2.5 and 3.3.4 (see the gap on XV §2).
5. The sequence of step 2 in degrees n − 1, …, n + 2, with the vanishing of step 3, is (iii); δ is determined up to sign because the local generator is.

*Acceptance.*

- n = 1, a curve of genus g acquiring one node: if the node is nonseparating, δ ≠ 0, the middle map is onto, dim H^1(X_s) = 2g − 1 and H^2(X_s) ≅ H^2(X_η̄); if it separates, δ = 0, H^1(X_s) ≅ H^1(X_η̄) and dim H^2(X_s) = 2.
- n = 0, X = Spec A[y]/(y² − π) with p ≠ 2: X_η̄ is two points, δ = e₁ − e₂ and the sequence is 0 → ℚ_ℓ → ℚ_ℓ² → ℚ_ℓ → 0.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`, `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`, `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`, `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.2`.

*Sources.*

- La conjecture de Weil. I, §4, (4.2), p. 288: “Voici l'analogue de (4.1) en géométrie algébrique abstraite” The algebraic setting: a proper family over a henselian trait with one ordinary quadratic point.
- La conjecture de Weil. I, §4, (4.3), (4.3.1)–(4.3.3), p. 288: “Ce cycle est bien défini au signe près” The vanishing cycle δ ∈ H^n(X_η̄, ℚ_ℓ)(m), the isomorphisms (4.3.2) and the exact sequence (4.3.3), whose middle map x ↦ Tr(x ∪ δ) was read on the page image.
- La conjecture de Weil. I, §5, (5.13) B), p. 294: “Les résultats du § 4 sont démontrés dans les exposés XIII, XIV et XV de SGA 7” The proofs are in SGA 7 XIII–XV.

#### Theorem. The Picard–Lefschetz formula for a proper family

*Module* `TauCeti/AlgebraicGeometry/VanishingCycles/LocalLefschetz.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`.

Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Let I = Gal(η̄/η) (the inertia group, as the residue field is algebraically closed) act on H^i(X_η̄, ℚ_ℓ) by transport of structure, and write (x, δ) = Tr(x ∪ δ). Then I acts trivially on H^i(X_η̄, ℚ_ℓ) for i ≠ n. On H^n: (A) if n = 2m + 1 is odd, σx = x + (−1)^{m+1} t_ℓ(σ)(x, δ)δ, where t_ℓ : I → ℤ_ℓ(1) is the tame character; (B) if n = 2m is even and p ≠ 2, let ε : I → {±1} be the unique character of order 2; then σx = x when ε(σ) = 1 and σx = x + (−1)^{m+1}(x, δ)δ when ε(σ) = −1, and (δ, δ) = (−1)^m·2. Equivalently, in Deligne's table (4.1), the sign in σx = x ± … is − for n ≡ 0, 1 and + for n ≡ 2, 3 mod 4, and (δ, δ) = 2, 0, −2, 0.

*Hypotheses.*

- p ≠ 2 in case (B).
- ℓ ≠ p.
- The twists are as in the specialisation sequence: δ ∈ H^n(X_η̄)(m), (x, δ) ∈ ℚ_ℓ(m − n), so t_ℓ(σ)(x, δ)δ lies in H^n(X_η̄)(2m + 1 − n) = H^n(X_η̄) for n odd.

*Proof.*

1. Proper base change identifies the I-module H^n(X_η̄) with H^n(X_s̄, RΨ_η ℚ_ℓ), and σ = 1 + Var(σ) ∘ q on it (XIII 1.4.3), q being the map to H^n(X_s̄, RΦ) = R^nΦ_x.
2. For i ≠ n, R^iΦ = 0, so q = 0 in degree i and σ acts trivially.
3. Case n odd: XV 3.3 gives Var(σ)(a) = (−1)^{m+1} ε_b(σ)(a, δ)δ with b a generator of the ideal (b) of 3.3.1. As X is regular, b is a uniformiser, and ε_b is the Kummer character, whose ℓ-adic limit is t_ℓ.
4. Case n even, p ≠ 2: XV 3.2.1 gives Var(σ)(a) = (−1)^m((ε_x(σ) − 1)/2)(a, δ)δ and (δ, δ) = (−1)^m·2. Regularity of X makes ε_x nontrivial, and the tame quotient of I has a unique character of order 2 when p ≠ 2.
5. Substituting into σ = 1 + Var(σ) q gives (A) and (B). Evaluating at n = 0, 1, 2, 3 gives Deligne's table, which is checked against the complex Picard–Lefschetz table of (4.1).

*Acceptance.*

- n = 0, X = Spec A[y]/(y² − π), p ≠ 2: σ with ε(σ) = −1 swaps the two points, and x − (x, δ)δ with δ = e₁ − e₂ sends e₁ to e₂.
- Sign table for n = 0, 1, 2, 3: signs −, −, +, +; (δ, δ) = 2, 0, −2, 0; σδ = −δ for n even when ε(σ) = −1 and σδ = δ for n odd.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`, `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`, `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`, `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `ArithmeticGaloisRepresentations:R01.2`.

*Planet:* Picard–Lefschetz formula.

*Sources.*

- La conjecture de Weil. I, §4, (4.3) A), p. 288: “On dispose d'un homomorphisme canonique” t_ℓ : I → ℤ_ℓ(1) and σx = x ± t_ℓ(σ)(x, δ)δ for n odd.
- La conjecture de Weil. I, §4, (4.3) B), p. 289: “il existe un unique caractère d'ordre deux” The even case with the quadratic character ε, p ≠ 2.
- La conjecture de Weil. I, §4, (4.3), p. 289: “sont les mêmes qu'en (4.1)” The signs are those of the complex table (4.1).
- La conjecture de Weil. I, §4, (4.1), p. 287: “Sur C, les résultats locaux de Lefschetz sont les suivants” The complex table of signs, (δ, δ) and Tδ by n mod 4, read on the page image.

#### Theorem. The sheaves R^i f_*ℚ_ℓ at a Lefschetz degeneration, including the case δ = 0

*Module* `TauCeti/AlgebraicGeometry/VanishingCycles/LocalLefschetz.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.2/direct-images-at-a-lefschetz-degeneration`.

Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Let j : η → S be the inclusion. (a) If δ ≠ 0: R^i f_*ℚ_ℓ is constant for i ≠ n, and R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ. (b) If δ = 0, which can happen only for n odd since (δ, δ) = ±2 for n even: R^i f_*ℚ_ℓ is constant for i ≠ n + 1, and there is an exact sequence 0 → ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → j_*j^*R^{n+1} f_*ℚ_ℓ → 0 with j_*j^*R^{n+1} f_*ℚ_ℓ constant, where ℚ_ℓ(m − n)_s is ℚ_ℓ(m − n) on {s} extended by zero.

*Hypotheses.*

- As in the specialisation sequence, with p ≠ 2 when n is even.

*Proof.*

1. A sheaf on S is a triple (G_s̄, G_η̄, φ : G_s̄ → G_η̄^I) (XIII 1.2.2); for R^i f_*ℚ_ℓ it is (H^i(X_s), H^i(X_η̄), sp) by proper base change. It is constant if and only if I acts trivially and sp is an isomorphism, and it equals j_*j^* of itself if and only if sp is an isomorphism onto the invariants.
2. For i ∉ {n, n + 1} both hold by the specialisation sequence and the Picard–Lefschetz formula.
3. δ ≠ 0: by Poincaré duality on X_η̄ some x has (x, δ) ≠ 0, so the middle map of (4.3.3) is onto; hence H^{n+1}(X_s) ≅ H^{n+1}(X_η̄), and I acts trivially there. In degree n, sp is injective with image δ^⊥, and δ^⊥ = H^n(X_η̄)^I because the fixed space of x ↦ x + c(x, δ)δ with c ≠ 0 is δ^⊥ (Mathlib's LinearEquiv.mem_fixedSubmodule_transvection_iff, with t_ℓ onto ℤ_ℓ(1), or ε nontrivial).
4. δ = 0: I acts trivially in every degree, sp is an isomorphism in degree n, and (4.3.3) becomes 0 → ℚ_ℓ(m − n) → H^{n+1}(X_s) → H^{n+1}(X_η̄) → 0, which is the stalk at s̄ of the stated sequence of sheaves.
5. (δ, δ) = (−1)^m·2 ≠ 0 for n even, so δ ≠ 0 there.

*Acceptance.*

- δ = 0 is realised by a genus-g curve acquiring a separating node (n = 1): R² f_*ℚ_ℓ has stalk ℚ_ℓ(−1)² at s and ℚ_ℓ(−1) at η̄.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`, `mathlib:LinearEquiv.mem_fixedSubmodule_transvection_iff`, `EtaleDualityAndPerverseSheaves:EDC.2`.

*Sources.*

- La conjecture de Weil. I, §4, (4.4) a), p. 289: “Ces résultats apportent les informations suivantes” Case δ ≠ 0: constancy for i ≠ n and R^n f_* = j_*j^*R^n f_*.
- La conjecture de Weil. I, §4, (4.4) b), p. 289: “C'est là un cas exceptionnel” Case δ = 0, only for n odd, with the skyscraper sequence in degree n + 1 (read on the page image).

### What is missing

- SGA 7 XV §1 (ordinary quadratic singularities, canonical forms) and §2 (cohomology of the cone, 2.2.1–2.2.7) are not read; they carry the local computation behind XV 3.1.2, 3.2.1 and 3.3, and the identification of the middle map of Weil I (4.3.3).
- The proof of XV 3.3.5–3.3.6 is read only through steps (A)–(B); the mixed-characteristic step (C) and XIV 2.1/3.2.11 are not read.
- The characteristic-2 case with n even is excluded by Weil I and is not planned; compatibility with a finite extension of the trait is not planned.
- Planned in this checkpoint: the proper-family form of the local theory (Weil I 4.2–4.4), including δ = 0; the n mod 4 sign table of Weil I (4.1) was checked against XV 3.2.1 and 3.3.

## LPV.3 Existence of sufficiently ample Lefschetz pencils

### Objects

#### Definition. Lefschetz pencil of hyperplane sections

*Module* `TauCeti/AlgebraicGeometry/LefschetzPencil/Basic.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`.

Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. For a linear subspace A ⊂ P of codimension 2 (the axis), let D ⊂ P̌ be the dual line of hyperplanes containing A, X_t = X ∩ H_t for t ∈ D, X̃ = {(x, t) ∈ X × D : x ∈ H_t} with projections π : X̃ → X and f : X̃ → D, so that f^{-1}(t) = X_t. The family (X_t)_{t∈D} is a Lefschetz pencil if: (A) A is transverse to X, so that π : X̃ → X is the blow-up of X along A ∩ X and X̃ is smooth; (B) there are a finite subset S ⊂ D and points x_s ∈ X_s (s ∈ S) such that f is smooth outside {x_s : s ∈ S}; (C) each x_s is an ordinary quadratic singular point of X_s. Then, for each s ∈ S, the local theory applies to the henselisation D_s of D at s and X̃ ×_D D_s.

*Hypotheses.*

- Transversality of A means A ∩ X is smooth of codimension 2 in X, or empty.
- Ordinary quadratic singular points are LPV.2's notion (SGA 7 XV §1).

*API.*

- `IsLefschetzPencil` (*data*) — IsLefschetzPencil X A : Prop, conditions (A)–(C) for the axis A.
- `totalSpace` (*constructor*) — X̃ ⊂ X × D with π and f, and f^{-1}(t) = X ∩ H_t.
- `totalSpace_iso_blowup` (*characterisation*) — Under (A), π : X̃ ≅ Bl_{A∩X} X and X̃ is smooth over k.
- `singularSet` (*constructor*) — The finite set S ⊂ D with its points x_s, and f smooth on X̃ − {x_s}.
- `localModel` (*compatibility*) — X̃ ×_D D_s → D_s is proper, X̃ ×_D D_s is regular of dimension n + 1, and it is smooth except at the ordinary quadratic point x_s.

*Used by.*

- `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils` — the existence theorem after a Veronese re-embedding
- `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil` — the cohomology sheaves R^i f_*ℚ_ℓ of the pencil
- `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace` — the vanishing cycles δ_s, s ∈ S
- `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system` — the pencil over 𝔽_q in Deligne's proof
- `WeightsInEtaleCohomology:R34.4` — geometric reduction to a pencil

*Unit tests.* A wrong definition fails one of these.

- `line_in_plane` (degenerate) — X a line in P², A a point not on X: every line through A meets X transversally in one point, so S = ∅ and f : X̃ = X → D is an isomorphism. This is a Lefschetz pencil with no singular fibre.
- `quadric_surface` (value) — X a smooth quadric surface in P³, p ≠ 2, A a general line: S has two points, each X_s is a pair of lines meeting in one point, and X̃ is X blown up in the two points of A ∩ X; χ(X̃) = 6 = 2·2 + 2·1.
- `cubic_surface` (value) — X a smooth cubic surface in P³, p = 0, A a general line: |S| = 12, the degree 3·2² of the dual surface, each X_s a plane cubic with one node; χ(X̃) = 9 + 3 = 12 = 2·0 + 12·1.
- `hermitian_curve_not_lefschetz` (non-example) — p odd, q = p^e, X = {x^{q+1} + y^{q+1} + z^{q+1} = 0} ⊂ P²: along the tangent direction (u, v) at an affine point (a, b), with a^q u + b^q v = 0, one has F(a + tu, b + tv) = t^q(a u^q + b v^q) + t^{q+1}(u^{q+1} + v^{q+1}). So every tangent line meets X with multiplicity ≥ q ≥ 3 at its point of tangency, condition (C) fails, and no pencil of lines is Lefschetz in this embedding.

*Construction.*

1. Define X̃ as the closed subscheme of X × D cut out by the incidence x ∈ H_t, a bilinear equation in the coordinates of P and D.
2. Under (A), identify X̃ with the blow-up of X along A ∩ X: A ∩ X is cut out by the two linear forms defining D, and X̃ is their graph closure (EDC.4's blow-up along a smooth centre of codimension 2).
3. Condition (B) makes S finite with f smooth elsewhere; condition (C) is LPV.2's local condition at x_s.

*Acceptance.*

- A line in P² (no singular fibre), the quadric surface (two nodal fibres, δ = 0), the cubic surface (twelve nodal fibres), and the Hermitian curve, where condition (C) fails in the original embedding.

*Uses.* `EtaleDualityAndPerverseSheaves:EDC.4`, `LefschetzPencilsAndVanishingCycles:LPV.2`.

*Planet:* Lefschetz pencil.

*Sources.*

- La conjecture de Weil. I, §5, (5.1), p. 289: “forment le pinceau d'axe A” The pencil of hyperplanes containing the axis A and the diagram X ← X̃ → D (5.1.1).
- La conjecture de Weil. I, §5, (5.6), p. 291: “forment un pinceau de Lefschetz de sections hyperplanes si les conditions suivantes sont vérifiées” The definition, with conditions A)–C) over an algebraically closed field.
- La conjecture de Weil. I, §5, (5.6), p. 292: “la théorie de Lefschetz locale du § 4 s'applique au spectre” The local theory of §4 applies at each s ∈ S.

#### Definition. The dual variety and the incidence family

*Module* `TauCeti/AlgebraicGeometry/LefschetzPencil/DualVariety.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`.

Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. Let Y = {(x, t) ∈ X × P̌ : x ∈ H_t} with g : Y → P̌, whose fibre over t is X_t = X ∩ H_t. The dual variety X̌ ⊂ P̌ is the set of t such that H_t is tangent to X, that is, X_t is singular or X ⊂ H_t. It is closed and irreducible, and g is smooth outside g^{-1}(X̌). For a Lefschetz pencil with parameter line D, S = D ∩ X̌.

*Hypotheses.*

- X smooth, connected and projective; irreducibility of X̌ comes from its description as the image of the conormal variety, a projective bundle over X.

*API.*

- `dualVariety` (*constructor*) — X̌ ⊂ P̌, the reduced closed image of the conormal variety {(x, t) : T_xX ⊂ H_t}.
- `mem_dualVariety_iff` (*characterisation*) — t ∈ X̌ if and only if X ∩ H_t is singular or X ⊂ H_t.
- `dualVariety_isIrreducible` (*characterisation*) — X̌ is irreducible.
- `incidence_smooth_off_dual` (*characterisation*) — g : Y → P̌ is smooth over P̌ − X̌.
- `singularSet_eq_inter_dual` (*compatibility*) — For a Lefschetz pencil, S = D ∩ X̌.

*Used by.*

- `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups` — π₁ of the complement P̌ − X̌
- `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate` — irreducibility of X̌ and connectedness of its smooth locus
- `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils` — general lines D meet X̌ transversally in its good locus

*Unit tests.* A wrong definition fails one of these.

- `dualVariety_projectiveSpace` (degenerate) — X = P: every H_t ∩ P = H_t is smooth and P ⊄ H_t, so X̌ = ∅.
- `dualVariety_linear` (value) — X a linear subspace of dimension d, 1 ≤ d < N: X ∩ H_t is always smooth, so X̌ = {t : X ⊂ H_t}, a linear subspace of codimension d + 1 ≥ 2, not a hypersurface.
- `dualVariety_conic` (value) — X the conic xz = y² in P², p ≠ 2: X̌ is the conic of lines (a : b : c) with b² = 4ac.
- `dualVariety_conic_char_two` (non-example) — p = 2, X the conic xz = y²: the tangent line at (s² : st : t²) is t²x + s²z = 0, which passes through the nucleus (0 : 1 : 0). So X̌ is a line in P̌² and X → X̌ is purely inseparable of degree 2, not the dual conic.

*Construction.*

1. The conormal variety C = {(x, t) : x ∈ X, T_xX ⊂ H_t}, T_xX the projective tangent space, is a projective bundle over X with fibres P^{N−n−2} (empty when N = n + 1), hence irreducible; X̌ is its image in P̌, closed and irreducible.
2. t ∉ X̌ exactly when X ∩ H_t is smooth of dimension n (the Jacobian criterion at each x ∈ X ∩ H_t), which is the smoothness of g at the points of g^{-1}(t).
3. For a pencil, t ∈ D lies in S exactly when X_t is singular, that is, t ∈ X̌ (X ⊂ H_t cannot happen for t ∈ D: A ∩ X has codimension 2 in X).

*Acceptance.*

- X = P gives X̌ = ∅; a smooth plane conic has the dual conic for p ≠ 2 and a line for p = 2.

*Uses.* `SchemeAndStackFoundations:SF.0`.

*Sources.*

- La conjecture de Weil. I, §5, proof of (5.4), p. 290: “la variété duale de X : c'est l'ensemble des” The dual variety X̌: the t such that H_t is tangent to X (X_t singular or X ⊂ H_t); it is irreducible (p. 291).

### Theorems

#### Theorem. Existence of Lefschetz pencils after a Veronese re-embedding

*Module* `TauCeti/AlgebraicGeometry/LefschetzPencil/Existence.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`.

Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. For r ≥ 1 let i_r : P → P^{C(N+r, N) − 1} be the Veronese embedding by the monomials of degree r, whose hyperplane sections are the degree-r hypersurfaces of P. If r ≥ 2 and X is embedded by i_r ∘ i_1, then every sufficiently general pencil of hyperplane sections is a Lefschetz pencil: the axes A for which (X_t)_{t∈D} is a Lefschetz pencil contain a nonempty open subset of the Grassmannian of codimension-2 linear subspaces. Equivalently, a sufficiently general pencil of degree-r hypersurface sections of X is Lefschetz. For r = 1 and p ≠ 0 there may be no Lefschetz pencil of hyperplane sections at all.

*Hypotheses.*

- k algebraically closed.
- r ≥ 2 in the positive statement; the r = 1 failure needs p ≠ 0.

*Proof.*

1. For r ≥ 2 the embedding i_r ∘ i_1 separates 2-jets, so at a general point of the dual variety of i_r(X) the tangent hyperplane section has exactly one singular point, and it is ordinary quadratic (SGA 7 XVII).
2. The locus of the dual variety where this fails, and the locus where the axis is not transverse to X, have codimension ≥ 2 in the relevant parameter spaces; a general line D avoids the first and meets the dual variety transversally, and a general axis is transverse to X.
3. These are open conditions on the axis, and the Grassmannian is irreducible, so the Lefschetz axes form a dense open subset.
4. The r = 1 failure: the Hermitian curve of the Lefschetz-pencil node, whose tangent lines all have contact of order ≥ 3.

*Acceptance.*

- The Hermitian curve of degree q + 1 in characteristic p odd has no Lefschetz pencil of lines, while a general pencil of conics (r = 2) is Lefschetz.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `LefschetzPencilsAndVanishingCycles:LPV.2`, `SchemeAndStackFoundations:SF.0`.

*Planet:* Existence of Lefschetz pencils.

*Sources.*

- La conjecture de Weil. I, §5, (5.7), p. 292: “il se peut qu'aucun pinceau de sections hyperplanes de X ne soit de Lefschetz” For p ≠ 0 the given embedding may admit no Lefschetz pencil.
- La conjecture de Weil. I, §5, (5.7), p. 292: “un pinceau assez général de sections hypersurfaces” For r ≥ 2 a sufficiently general pencil of degree-r hypersurface sections is Lefschetz; the dimension of the Veronese space, C(N+r, N) − 1, was read on the page image.
- La conjecture de Weil. I, §5, (5.13) C), p. 294: “est démontré dans SGA 7, XVII” The proof is SGA 7 XVII.

### What is missing

- SGA 7 XVII is not read: the jet-separation proof of existence, the openness of the transversality, smooth-axis and ordinary-singularity conditions, and the low-dimensional and empty-axis cases.
- The descent over 𝔽_q (a nonempty admissible open has a point over a finite extension) and the base-extension interface for DWP.4 (Weil I 7.1) are not planned.

## LPV.4 Global vanishing cycles and middle-degree reduction

### Objects

#### Construction. The vanishing subspace E of the middle cohomology

*Module* `TauCeti/AlgebraicGeometry/LefschetzPencil/VanishingSubspace.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. For s ∈ S, an étale path from u to a geometric generic point of D_s transports the local vanishing cycle to δ_s ∈ H^n(X_u, ℚ_ℓ)(m), well defined up to sign once the path is fixed; changing the path changes δ_s by an element of π₁(U, u). Identify ℚ_ℓ(m) with ℚ_ℓ by a generator of ℤ_ℓ(1) (k is algebraically closed). The vanishing subspace E ⊂ H^n(X_u, ℚ_ℓ) is the span of all transports gδ_s (g ∈ π₁(U, u), s ∈ S). It does not depend on the paths and is π₁(U, u)-stable. For suitable paths (tame generators), E is already spanned by the δ_s, s ∈ S (monodromy-generation theorem).

*Hypotheses.*

- Only E is independent of the paths, not the individual oriented vectors δ_s.

*API.*

- `vanishingCycle` (*constructor*) — vanishingCycle (s : S) (γ : path u ⇝ η̄_s) : H^n(X_u, ℚ_ℓ)(m), up to sign.
- `vanishingCycle_changePath` (*compatibility*) — vanishingCycle s (g · γ) = ± g • vanishingCycle s γ for g ∈ π₁(U, u).
- `vanishingSubspace` (*constructor*) — E : Submodule ℚ_ℓ (H^n(X_u, ℚ_ℓ)), the span of all vanishing cycles for all paths.
- `vanishingSubspace_stable` (*characterisation*) — g • E = E for every g ∈ π₁(U, u).
- `localMonodromy_vanishingCycle` (*characterisation*) — σ in the inertia at s acts on H^n(X_u) by x ↦ x + (−1)^{m+1} t_ℓ(σ)(x, δ_s)δ_s (n odd), and by the reflection in δ_s when ε(σ) = −1 (n even).

*Used by.*

- `LefschetzPencilsAndVanishingCycles:LPV.4/fixed-space-of-the-local-transvections` — E^⊥ as the common fixed space of the local transvections
- `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing` — the radical quotient E/(E ∩ E^⊥) and its form
- `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient` — absolute irreducibility of E/(E ∩ E^⊥)
- `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system` — the lisse subsheaf ℰ₀ with fibre E over 𝔽_q

*Unit tests.* A wrong definition fails one of these.

- `vanishingSubspace_eq_bot_of_no_singular_fibre` (degenerate) — If S = ∅ (a line in P²) then E = 0.
- `vanishingSubspace_quadric_surface` (value) — Quadric-surface pencil: |S| = 2 but each δ_s lies in H^1 of a conic, which is 0, so E = 0 (case (b)).
- `vanishingSubspace_conic` (value) — n = 0, X a smooth conic in P², p ≠ 2, A a general point: X_u is two points, |S| = 2 (the tangents from A), δ_s = ±(e₁ − e₂) for both s, E = ℚ_ℓ(e₁ − e₂) and E^⊥ = ℚ_ℓ(e₁ + e₂).
- `vanishingCycle_depends_on_path` (non-example) — n odd, s ≠ s′ with (δ_s, δ_{s′}) ≠ 0: transporting δ_s around s′ gives δ_s ± t(δ_s, δ_{s′})δ_{s′} ≠ ±δ_s, so the individual vanishing cycles depend on the path while E does not.

*Construction.*

1. Transport: the local vanishing cycle lives in H^n of the geometric generic fibre of X̃ ×_D D_s; a path identifies that fibre functor with the one at u.
2. Path independence and stability: a change of path is an element of π₁(U, u), so the set of all transports is π₁-stable and its span E is π₁-stable and path-free.
3. Local monodromy: the Picard–Lefschetz formula, transported along the path.

*Acceptance.*

- E = 0 for the quadric-surface pencil and E = ℚ_ℓ(e₁ − e₂) for the conic pencil.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`.

*Planet:* Vanishing subspace.

*Sources.*

- La conjecture de Weil. I, §5, (5.2), p. 290: “partie évanescente de la cohomologie” E is the span of the vanishing cycles (the complex case).
- La conjecture de Weil. I, §5, (5.8) a) 3), p. 292: “le sous-espace de la cohomologie engendré par les cycles évanescents” E ⊂ H^n(X_u, ℚ_ℓ) in the ℓ-adic setting, stable under π₁(U, u).

#### Construction. The radical quotient E/(E ∩ E^⊥) and its nondegenerate pairing

*Module* `TauCeti/AlgebraicGeometry/LefschetzPencil/VanishingSubspace.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. With ( , ) = Tr(x ∪ y) the cup-product pairing H^n(X_u) ⊗ H^n(X_u) → ℚ_ℓ(−n), the subspace E ∩ E^⊥ is the kernel of the restriction of ( , ) to E, so ( , ) induces a nondegenerate form ψ : E/(E ∩ E^⊥) ⊗ E/(E ∩ E^⊥) → ℚ_ℓ(−n), alternating for n odd and symmetric for n even. Monodromy respects ψ; for n odd it gives ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ).

*Hypotheses.*

- The pairing on H^n(X_u) is perfect by Poincaré duality, but its restriction to E can be degenerate: E ∩ E^⊥ may be nonzero, and irreducibility and open image concern the quotient, not E.

*API.*

- `vanishingQuotient` (*constructor*) — E ⧸ (E ⊓ E^⊥), a finite-dimensional ℚ_ℓ-space with a π₁(U, u)-action.
- `vanishingForm` (*constructor*) — ψ, the form induced by Tr(x ∪ y), with values in ℚ_ℓ(−n).
- `vanishingForm_nondegenerate` (*characterisation*) — ψ is nondegenerate.
- `vanishingForm_isAlt` (*characterisation*) — ψ is alternating for n odd (LinearMap.BilinForm.IsAlt) and symmetric for n even.
- `monodromyRep` (*constructor*) — ρ : π₁(U, u) →* Sp(vanishingQuotient, ψ) for n odd, continuous.

*Used by.*

- `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient` — the representation whose absolute irreducibility is proved
- `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image` — the target Sp(E/(E ∩ E^⊥), ψ) of the open-image theorem
- `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system` — ℱ₀ = ℰ₀/(ℰ₀ ∩ ℰ₀^⊥) with its perfect alternating pairing
- `DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group` — the symplectic target of the geometric monodromy

*Unit tests.* A wrong definition fails one of these.

- `vanishingQuotient_zero` (degenerate) — If E = 0 (the quadric-surface pencil) the quotient is 0 and ρ is trivial.
- `vanishingQuotient_radical` (value) — Linear algebra: in V = ℚ_ℓ⁴ with ω(e₁, f₁) = ω(e₂, f₂) = 1, E = span(e₁, f₁, e₂) has radical E ∩ E^⊥ = ℚ_ℓe₂, and ψ on the 2-dimensional quotient is nondegenerate; for E = span(e₁, e₂), E ∩ E^⊥ = E and the quotient is 0.
- `vanishingQuotient_conic` (value) — n = 0 conic pencil: E = ℚ_ℓ(e₁ − e₂), E ∩ E^⊥ = 0 and ψ(δ, δ) = 2 is a symmetric nondegenerate form on a line.
- `vanishingForm_on_E_degenerate` (non-example) — The restriction of Tr(x ∪ y) to E itself can be degenerate (the radical example), so ρ does not in general land in Sp(E); the target must be the quotient.

*Construction.*

1. The kernel of ( , )|_E is {x ∈ E : (x, y) = 0 ∀ y ∈ E} = E ∩ E^⊥ by definition, so the induced form on the quotient is nondegenerate.
2. Tr(x ∪ y) = (−1)^{n²} Tr(y ∪ x) and x ∪ x = 0 for n odd (graded commutativity), so ψ is alternating for n odd and symmetric for n even.
3. π₁(U, u) acts on H^n(X_u) preserving the cup product and the trace (the trace is π₁-invariant because R^{2n} f_*ℚ_ℓ(n) ≅ ℚ_ℓ on U), and it preserves E, hence E^⊥ and the quotient.

*Acceptance.*

- A nontrivial radical, a zero quotient and a nonzero quotient, as in the unit tests.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `EtaleDualityAndPerverseSheaves:EDC.2`, `mathlib:LinearMap.BilinForm.orthogonal`, `mathlib:LinearMap.BilinForm.IsAlt`.

*Sources.*

- La conjecture de Weil. I, §5, (5.9), p. 293: “est le noyau de la restriction à E de la forme” E ∩ E^⊥ is the kernel of the form restricted to E.
- La conjecture de Weil. I, §5, (5.9), p. 293: “Cette forme induit donc une forme bilinéaire non dégénérée” The induced nondegenerate form ψ with values in ℚ_ℓ(−n).
- La conjecture de Weil. I, §5, (5.9), p. 293: “alternée pour n impair, et symétrique pour n pair” Parity, and ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ) for n odd.

### Theorems

#### Theorem. The cohomology sheaves of a Lefschetz pencil

*Module* `TauCeti/AlgebraicGeometry/LefschetzPencil/Cohomology.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. R^n f_*ℚ_ℓ is lisse on U and tamely ramified at each s ∈ S. (a) If the vanishing cycles are nonzero: R^i f_*ℚ_ℓ is constant on D for i ≠ n, and R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ. (b) If they are zero (possible only for n = 2m + 1 odd): R^i f_*ℚ_ℓ is constant for i ≠ n + 1, there is an exact sequence 0 → ⊕_{s∈S} ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → ℱ → 0 with ℱ constant, and E = 0. If one vanishing cycle is zero, all are.

*Hypotheses.*

- The vanishing cycle δ_s is the one of the local theory at s, transported to X_u; being zero does not depend on the transport.

*Proof.*

1. f is smooth and proper over U, so each R^i f_*ℚ_ℓ is lisse on U (smooth and proper base change).
2. At s ∈ S apply the local theory to X̃ ×_D D_s: the inertia at s acts through t_ℓ (n odd) or ε (n even, p ≠ 2), so R^i f_*ℚ_ℓ is tamely ramified at s, and the local description of the Lefschetz-degeneration node holds at s.
3. If δ_s ≠ 0 for all s: for i ≠ n, R^i f_*ℚ_ℓ is lisse near every s, hence lisse on D = P¹; a lisse sheaf on P¹_k is constant because π₁(P¹_k) = 1. In degree n the local statement R^n = j_*j^*R^n at every s gives it globally.
4. If δ_s = 0 for all s: the same argument in degrees i ≠ n + 1; in degree n + 1 the local sequences at the points of S glue to the stated sequence, with ℱ = j_*j^*R^{n+1} f_*ℚ_ℓ lisse on D, hence constant. E is spanned by the δ_s, so E = 0.
5. All δ_s are conjugate up to sign under π₁(U, u) (conjugacy theorem), so one is zero if and only if all are.

*Acceptance.*

- The quadric-surface pencil (n = 1, |S| = 2) is in case (b): R² f_*ℚ_ℓ has an extra ℚ_ℓ(−1) at each of the two singular fibres.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.2/direct-images-at-a-lefschetz-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`, `SchemeAndStackFoundations:SF.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`.

*Sources.*

- La conjecture de Weil. I, §5, (5.8), p. 292: “en excluant le cas” The exclusion of p = 2 with n even, and tame ramification of R^n f_*ℚ_ℓ at each s ∈ S.
- La conjecture de Weil. I, §5, (5.8) a) 1)–2), p. 292: “Si les cycles évanescents sont non nuls” Constancy for i ≠ n and R^n f_* = j_*j^*R^n f_*.
- La conjecture de Weil. I, §5, (5.8) b), p. 293: “cycles évanescents sont nuls” The exceptional case, with the sequence 0 → ⊕_{s∈S} ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → ℱ → 0, read on the page image.
- La conjecture de Weil. I, §5, (5.13) D), p. 294: “est démontré dans SGA 7, XVIII” The proof of (5.8) is SGA 7 XVIII.

#### Lemma. The common fixed space of the local transvections is E^⊥

*Module* `TauCeti/LinearAlgebra/PicardLefschetz.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.4/fixed-space-of-the-local-transvections`.

Let V be a finite-dimensional vector space over a field K with a symmetric or alternating bilinear form ( , ), (δ_s)_{s∈S} a finite family in V, E = span(δ_s), and T_s(x) = x + c_s(x, δ_s)δ_s with c_s ∈ K^× (Mathlib's LinearMap.transvection; a transvection when (δ_s, δ_s) = 0 and a reflection when c_s(δ_s, δ_s) = −2). Then ⋂_s Fix(T_s) = E^⊥ = {x : (x, δ_s) = 0 for all s}.

*Hypotheses.*

- c_s ≠ 0 for every s. If δ_s = 0 then T_s = id and δ_s contributes nothing to E.

*Proof.*

1. T_s x = x if and only if c_s(x, δ_s)δ_s = 0 (LinearEquiv.mem_fixedSubmodule_transvection_iff when (δ_s, δ_s) = 0; the same computation for a reflection).
2. For δ_s ≠ 0 and c_s ≠ 0 this says (x, δ_s) = 0; for δ_s = 0 it is automatic.
3. Intersecting over s gives {x : (x, δ_s) = 0 ∀ s} = E^⊥ (LinearMap.BilinForm.orthogonal of the span).

*Acceptance.*

- V a symplectic plane and one δ ≠ 0: Fix(T) = ℚ_ℓδ = δ^⊥; for δ = 0, T = id and Fix(T) = V = E^⊥.

*Uses.* `mathlib:LinearEquiv.transvection`, `mathlib:LinearEquiv.mem_fixedSubmodule_transvection_iff`, `mathlib:LinearMap.BilinForm.orthogonal`.

*Sources.*

- La conjecture de Weil. I, §5, Proposition (5.3), p. 290: “c'est clair sur (5.2.1)” E^⊥ is the monodromy invariants: clear from the local formula (5.2.1), since the γ_s generate.
- La conjecture de Weil. I, §5, (5.3), p. 290: “le sous-espace des invariants” The statement E^⊥ = invariants.

### What is missing

- SGA 7 XVIII §§1–4 and §6 are not read.
- The Leray and restriction/Gysin comparisons for the dimension induction, through EDC.4's blow-up and projective-bundle maps, are not planned.

## LPV.5 Irreducibility and open symplectic monodromy

### Theorems

#### Theorem. Bertini: a general line sees the whole monodromy of P̌ − X̌

*Module* `TauCeti/AlgebraicGeometry/LefschetzPencil/Bertini.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`.

Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. Let X̌ ⊂ P̌ be the dual variety, and for a line D ⊂ P̌ put S = D ∩ X̌ and fix a geometric point u of D − S. (i) For every connected finite étale cover Z → P̌ − X̌ there is a dense open set of lines D for which Z ×_{P̌} D is connected. (ii) Consequently, for a lisse ℚ_ℓ-sheaf 𝒢 on P̌ − X̌ (here R^n g_*ℚ_ℓ for the incidence family g) there is a dense open set of lines D for which π₁(D − S, u) and π₁(P̌ − X̌, u) have the same image in GL(𝒢_u). Over ℂ, Lefschetz's theorem gives surjectivity of π₁(D − S, u) → π₁(P̌ − X̌, u) itself for D general.

*Hypotheses.*

- k algebraically closed; the open set in (i) depends on Z, and the one in (ii) on 𝒢.

*Proof.*

1. (i) Z is normal and irreducible (connected and étale over a smooth variety); take its normalisation Z̄ → P̌, a finite morphism from an irreducible variety. Bertini's irreducibility theorem (Jouanolou) makes the preimage of a general line irreducible, so Z ×_{P̌} D is connected for D in a dense open set.
2. (ii) The image H of π₁(P̌ − X̌, u) in GL(𝒢_u) is a compact ℓ-adic group. Choose an open normal pro-ℓ subgroup H₀ ⊂ H that is topologically finitely generated, so that its Frattini subgroup Φ(H₀) is open, and apply (i) to the connected cover with group H/Φ(H₀).
3. For such D the image H_D of π₁(D − S, u) satisfies H_D·Φ(H₀) = H, hence (H_D ∩ H₀)·Φ(H₀) = H₀, hence H_D ∩ H₀ = H₀ (a closed subgroup of a pro-ℓ group that generates it modulo its Frattini subgroup is the whole group), hence H_D = H.
4. Over ℂ this is Lefschetz's theorem on π₁ of the complement; in the algebraic setting Weil I (5.8) replaces it by Bertini's theorem, and (ii) is the form its proof of (5.4) uses.

*Acceptance.*

- Over ℂ, for X a smooth conic in P² the dual X̌ is a conic, π₁(P̌² − X̌) = ℤ/2, and a general line D meets X̌ in two points with π₁(D − S) = ℤ mapping onto ℤ/2.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`.

*Sources.*

- La conjecture de Weil. I, §5, proof of (5.4), p. 291: “D'après un théorème de Lefschetz, pour D assez générale” Over ℂ: π₁(D − S) → π₁(P̌ − X̌) is surjective for D general.
- La conjecture de Weil. I, §5, (5.8), p. 292: “devient le théorème de Bertini” In the algebraic setting Lefschetz's π₁ theorem becomes Bertini's theorem.

#### Theorem. The vanishing cycles are conjugate up to sign

*Module* `TauCeti/AlgebraicGeometry/LefschetzPencil/Monodromy.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. The vanishing cycles ±δ_s (s ∈ S), taken up to sign, are conjugate under π₁(U, u): for s, s′ ∈ S there is g ∈ π₁(U, u) with gδ_s = ±δ_{s′}.

*Hypotheses.*

- The pencil is sufficiently general for the surjectivity onto π₁(P̌ − X̌).

*Proof.*

1. By the Bertini surjectivity it suffices to prove conjugacy under π₁(P̌ − X̌, u), acting on H^n(X_u) through R^n g_*ℚ_ℓ, g : Y → P̌ the incidence family.
2. R^n g_*ℚ_ℓ is tamely ramified along the smooth codimension-one locus X̌_sm of X̌: at a point of X̌_sm a general transverse trait is a Lefschetz degeneration, so its inertia acts through t_ℓ or ε; Abhyankar's lemma then makes the monodromy near X̌_sm factor through a tame local group ℤ̂′(1) generated by the inertia at the generic point of X̌.
3. For x ∈ X̌_sm let γ_x be a loop following a path ch from u to near x, turning once around X̌ and returning; changing ch conjugates γ_x. Two points of X̌_sm are joined inside X̌_sm (X̌ irreducible, X̌_sm connected), so all γ_x are conjugate. Algebraically: the inertia groups at the generic point of the irreducible divisor X̌ are conjugate in π₁(P̌ − X̌), and for a general D each s ∈ S = D ∩ X̌ is a transverse point of X̌_sm, whose inertia is one of them.
4. By the Picard–Lefschetz formula γ_s acts by T_s(x) = x ± (x, δ_s)δ_s. If γ_{s′} = gγ_s g^{-1} then T_{s′} = gT_s g^{-1} = T_{gδ_s}, and a transvection or reflection x ↦ x ± (x, δ)δ with δ ≠ 0 determines δ up to sign (Poincaré duality gives (·, δ) ≠ 0), so δ_{s′} = ±gδ_s.

*Acceptance.*

- The conic pencil (n = 0, p ≠ 2): both vanishing cycles are ±(e₁ − e₂).
- The quadric-surface pencil: both vanishing cycles are 0, consistent with the rule that one zero vanishing cycle forces all to vanish.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `EtaleDualityAndPerverseSheaves:EDC.2`.

*Planet:* Conjugacy of vanishing cycles.

*Sources.*

- La conjecture de Weil. I, §5, Théorème (5.4), p. 290: “(pris au signe près) sont conjugués sous” The statement over ℂ.
- La conjecture de Weil. I, §5, proof of (5.4), p. 291: “deux points du lieu lisse de” Connectedness of the smooth locus of the irreducible X̌ makes the loops γ_x conjugate.
- La conjecture de Weil. I, §5, (5.8), p. 292: “lemme d'Abhyankar pour contrôler la ramification” In the algebraic proof, Abhyankar's lemma controls the ramification of R^•g_*ℚ_ℓ along the smooth codimension-one locus of X̌.

#### Theorem. Monodromy is generated by the local transvections, and E^⊥ is the invariant subspace

*Module* `TauCeti/AlgebraicGeometry/LefschetzPencil/Monodromy.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. For a suitable choice of paths, the image of π₁(U, u) in GL(H^n(X_u, ℚ_ℓ)) is topologically generated by the local monodromies T_s (s ∈ S), with T_s x = x ± (x, δ_s)δ_s for a generator of the inertia at s. Consequently E = span(δ_s : s ∈ S), E^⊥ = H^n(X_u, ℚ_ℓ)^{π₁(U, u)}, and the image of π₁(U, u) in GL(E/(E ∩ E^⊥)) is topologically generated by the maps induced by the T_s.

*Hypotheses.*

- The sign ± is the one fixed by the Picard–Lefschetz formula; for n odd the generator of the inertia is one with t_ℓ(γ_s) a chosen generator of ℤ_ℓ(1).

*Proof.*

1. R^n f_*ℚ_ℓ is lisse on U and tamely ramified at S (cohomology-sheaves node), so π₁(U, u) acts through the tame fundamental group π₁^t(U, u) relative to D = P¹.
2. π₁^t(P¹ − S, u) is a quotient of the profinite completion of the topological fundamental group ⟨γ_s (s ∈ S) | ∏ γ_s = 1⟩, each γ_s generating the image of an inertia group at s (lifting of tame covers to characteristic 0 and the Riemann existence theorem).
3. Hence the image of π₁(U, u) is topologically generated by the images T_s of the γ_s, given by the Picard–Lefschetz formula.
4. span(δ_s) is stable under each T_s (T_s x ∈ x + ℚ_ℓδ_s), hence under the closed group they generate, which is the whole image; it therefore contains every transport gδ_s and equals E.
5. x is invariant if and only if T_s x = x for all s, if and only if x ∈ E^⊥ (fixed-space lemma).

*Acceptance.*

- Conic pencil: the image is ℤ/2, generated by the swap of the two points, and the invariants are ℚ_ℓ(e₁ + e₂) = E^⊥.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `LefschetzPencilsAndVanishingCycles:LPV.4/fixed-space-of-the-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

*Sources.*

- La conjecture de Weil. I, §5, (5.8), p. 292: “Le groupe fondamental modéré de U est un quotient du complété profini du groupe fondamental transcendant analogue” The tame fundamental group of U and the transfer of Lefschetz's arguments.
- La conjecture de Weil. I, §5, (5.8) a) 3), p. 292: “est engendrée (topologiquement)” The image of π₁ in GL(E/(E ∩ E^⊥)) is topologically generated by the x ↦ x ± (x, δ_s)δ_s, and E^⊥ is the invariant subspace (read on the page image).
- La conjecture de Weil. I, §5, Proposition (5.3), p. 290: “c'est clair sur (5.2.1)” Over ℂ: E is stable and E^⊥ is the invariants because the γ_s generate π₁.

#### Theorem. Absolute irreducibility of the vanishing quotient

*Module* `TauCeti/AlgebraicGeometry/LefschetzPencil/Monodromy.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. The representation of π₁(U, u) on E/(E ∩ E^⊥) is absolutely irreducible.

*Hypotheses.*

- E/(E ∩ E^⊥) = 0 is allowed; the statement is then empty.

*Proof.*

1. Let F ⊂ E ⊗ ℚ̄_ℓ be π₁-stable with F ⊄ (E ∩ E^⊥) ⊗ ℚ̄_ℓ. Since E = span(δ_s), E ∩ E^⊥ = {x ∈ E : (x, δ_s) = 0 ∀ s}, so there are x ∈ F and s with (x, δ_s) ≠ 0.
2. Then T_s x − x = ±c(x, δ_s)δ_s ∈ F with c ≠ 0, so δ_s ∈ F.
3. By the conjugacy theorem every δ_{s′} is ±gδ_s for some g, and F is stable, so all δ_{s′} ∈ F and F = E ⊗ ℚ̄_ℓ.
4. A stable subspace of the quotient pulls back to a stable F ⊇ (E ∩ E^⊥) ⊗ ℚ̄_ℓ, which is either that radical or all of E ⊗ ℚ̄_ℓ; so the quotient has no nontrivial stable subspace over ℚ̄_ℓ.

*Acceptance.*

- The quadric-surface pencil has E/(E ∩ E^⊥) = 0; the conic pencil has a one-dimensional quotient.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`, `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`.

*Planet:* Irreducibility of the vanishing quotient.

*Sources.*

- La conjecture de Weil. I, §5, Corollaire (5.5), p. 291: “est absolument irréductible” The action of π₁(U, u) on E/(E ∩ E^⊥) is absolutely irreducible.
- La conjecture de Weil. I, §5, proof of (5.5), p. 291: “Ceci prouve (5.5)” The argument through a vector x with (x, δ_s) ≠ 0 and conjugacy.
- La conjecture de Weil. I, §5, (5.13) D), p. 294: “La démonstration dans le cas général” SGA 7 XVIII proves irreducibility of E only when E ∩ E^⊥ = 0; the radical quotient is the general case.

#### Lemma. A simple symplectic Lie algebra generated by the x ↦ ψ(x, δ)δ is all of sp (Weil I 5.11)

*Module* `TauCeti/Algebra/Lie/SymplecticGeneration.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.5/symplectic-lie-algebra-generated-by-transvections`.

Let V be a finite-dimensional vector space over a field k of characteristic 0, ψ a nondegenerate alternating form on V, and 𝔏 ⊂ sp(V, ψ) a Lie subalgebra. For δ ∈ V let N(δ) : x ↦ ψ(x, δ)δ. If (i) V is a simple 𝔏-module and (ii) 𝔏 is generated as a Lie algebra by a family of endomorphisms N(δ_i), then 𝔏 = sp(V, ψ).

*Hypotheses.*

- sp(V, ψ) is Mathlib's skewAdjointLieSubalgebra ψ.
- Characteristic 0 (char ≠ 2 would suffice for the final spanning step).

*Proof.*

1. N(δ) is skew-adjoint: ψ(N(δ)x, y) = ψ(x, δ)ψ(δ, y) = −ψ(x, N(δ)y); and N(δ)² = 0 since ψ(δ, δ) = 0. Assume V ≠ 0. Then 𝔏 ≠ 0: otherwise simplicity gives dim V = 1, impossible for a nondegenerate alternating form.
2. Let W = {δ ∈ V : N(δ) ∈ 𝔏}. W is stable under scalars (N(λδ) = λ²N(δ)) and Zariski closed (the preimage of the subspace 𝔏 under the quadratic map N).
3. For δ ∈ W, exp(λN(δ)) = 1 + λN(δ) lies in Sp(V, ψ) and normalises 𝔏 (Ad exp = exp ad, with ad N(δ) nilpotent and preserving 𝔏); since gN(δ″)g^{-1} = N(gδ″) for g ∈ Sp, it maps W to W. So δ″ + λψ(δ″, δ′)δ′ ∈ W for δ′, δ″ ∈ W, and if ψ(δ′, δ″) ≠ 0 the span of δ′ and δ″ lies in W.
4. If L ⊂ W is a linear subspace and δ ∈ W with ψ(δ, L) ≠ 0 then L + kδ ⊂ W: the w ∈ L with ψ(w, δ) ≠ 0 form a dense open subset of L on which w + kδ ⊂ W by step 3, and W is closed. Hence W is the union of pairwise orthogonal maximal linear subspaces W_α (the spans of the classes of the relation ψ(δ, δ′) ≠ 0).
5. Each W_α is stable under every N(δ), δ ∈ W: N(δ)w = ψ(w, δ)δ is 0 for δ ∈ W_β, β ≠ α, and lies in W_α for δ ∈ W_α. By (ii) W_α is 𝔏-stable. Some generator δ_i is nonzero, and its W_α is nonzero, so W_α = V by (i): N(δ) ∈ 𝔏 for all δ ∈ V.
6. sp(V, ψ) is spanned by the N(δ): polarisation gives N(δ + δ′) − N(δ) − N(δ′) = x ↦ ψ(x, δ)δ′ + ψ(x, δ′)δ, and these span sp(V, ψ) ≅ Sym²V (char ≠ 2). So 𝔏 = sp(V, ψ).

*Acceptance.*

- dim V = 2 with ψ(e₁, e₂) = 1: N(e₁) = −E₁₂ and N(e₂) = E₂₁ generate sl₂ = sp(V, ψ), since their bracket is −H.
- Hypothesis (i) is needed: the Lie algebra spanned by N(e₁) alone is one-dimensional, and V is not a simple module for it.

*Uses.* `mathlib:skewAdjointLieSubalgebra`, `mathlib:LieModule.IsIrreducible`, `mathlib:LinearMap.BilinForm.IsAlt`, `mathlib:IsNilpotent.exp`.

*Sources.*

- La conjecture de Weil. I, §5, Lemme (5.11), p. 293: “V est une représentation simple de” Hypothesis (i); the statement and hypothesis (ii) read on the page image.
- La conjecture de Weil. I, §5, proof of (5.11), p. 294: “On conclut en notant que l'algèbre de Lie” The final step: sp(V, ψ) is generated by the N(δ), δ ∈ V.

#### Lemma. Compact subgroups of Sp(V)(ℚ_ℓ) with full Lie algebra are open

*Module* `TauCeti/Topology/Algebra/PadicCompactSubgroup.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.5/lie-algebra-of-a-compact-l-adic-subgroup`.

Let V be a finite-dimensional ℚ_ℓ-vector space with a nondegenerate alternating form ψ and H ⊂ Sp(V, ψ)(ℚ_ℓ) a compact subgroup. Let 𝔏 = {X ∈ gl(V) : exp(tX) ∈ H for all t in some neighbourhood of 0 in ℚ_ℓ}. Then 𝔏 is a ℚ_ℓ-Lie subalgebra of sp(V, ψ); if h ∈ H is unipotent, h = exp(N) with N nilpotent, then N ∈ 𝔏; and if 𝔏 = sp(V, ψ) then H is open in Sp(V, ψ)(ℚ_ℓ).

*Hypotheses.*

- H closed (compact) is essential: the group generated by the local monodromies is dense in the image of π₁, and only its closure is compact.

*Proof.*

1. Fix a lattice V_{ℤ_ℓ} and K = 1 + ℓ^r End(V_{ℤ_ℓ}) with r ≥ 2 (r ≥ 1 for ℓ odd); log and exp are inverse homeomorphisms between K and ℓ^r End(V_{ℤ_ℓ}).
2. H is a closed subgroup of GL(V)(ℚ_ℓ), hence an ℓ-adic Lie group, and H ∩ K contains an open uniform pro-ℓ subgroup H₀ (Lazard). log maps H₀ bijectively onto a ℤ_ℓ-Lie lattice Λ, and 𝔏 = ℚ_ℓΛ is a ℚ_ℓ-Lie subalgebra; it lies in sp(V, ψ) because exp(tX) ∈ Sp for all small t forces X ∈ sp.
3. For h = exp(N) ∈ H unipotent, h^a = exp(aN) ∈ H for a ∈ ℤ_ℓ (H is closed), so ℓ^k N ∈ Λ for k large and N ∈ 𝔏.
4. If 𝔏 = sp(V, ψ), Λ is a lattice of full rank in sp(V, ψ), so H₀ = exp Λ contains exp(ℓ^s sp(V_{ℤ_ℓ}, ψ)) for s large, an open neighbourhood of 1 in Sp(V, ψ)(ℚ_ℓ). So H is open.

*Acceptance.*

- H = Sp(V)(ℤ_ℓ) is compact and open with 𝔏 = sp(V, ψ); H = {1} has 𝔏 = 0; the closure of the group generated by one unipotent exp(N), N ≠ 0, is exp(ℤ_ℓN) with 𝔏 = ℚ_ℓN.

*Uses.* `mathlib:skewAdjointLieSubalgebra`.

*Sources.*

- La conjecture de Weil. I, §5, proof of (5.10), p. 293: “est un sous-groupe compact, donc analytique” The image of ρ is compact, hence an ℓ-adic analytic subgroup, and openness reduces to its Lie algebra being sp.

#### Theorem. The Kazhdan–Margulis theorem: the monodromy image is open in Sp

*Module* `TauCeti/AlgebraicGeometry/LefschetzPencil/Monodromy.lean`. *Node* `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. Let n be odd. The image of ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ)(ℚ_ℓ) is open. The statement is for the fixed ℚ_ℓ-model; openness in Sp(V ⊗ E′)(E′) for a larger coefficient field E′ is not asserted.

*Hypotheses.*

- n odd, so ψ is alternating.
- V = E/(E ∩ E^⊥) = 0 is allowed: Sp(0) is trivial and the image is open.

*Proof.*

1. H = ρ(π₁(U, u)) is compact (continuous image of a profinite group) in Sp(V, ψ)(ℚ_ℓ); let 𝔏 be its Lie algebra.
2. For s ∈ S, the inertia at s maps onto {exp(aN_s) : a ∈ ℤ_ℓ}, N_s = ±N(δ_s) (t_ℓ is onto ℤ_ℓ(1)), so N_s ∈ 𝔏. Let 𝔤_S ⊂ 𝔏 be the Lie subalgebra generated by the N_s.
3. V is a simple 𝔤_S-module: a 𝔤_S-stable subspace is stable under each N_s, hence under T_s = exp(±N_s), hence under the closed group they generate, which is H (monodromy generation), and by absolute irreducibility it is 0 or V.
4. By Lemma 5.11 with k = ℚ_ℓ, 𝔤_S = sp(V, ψ). So 𝔏 = sp(V, ψ), and H is open by the compact-subgroup lemma.
5. Weil I states that 𝔏 itself is generated by the N_s; step 3 avoids needing this, and it follows a posteriori from 𝔤_S ⊂ 𝔏 ⊂ sp.

*Acceptance.*

- V = 0 for the quadric-surface pencil, where the statement is trivial.
- A Lefschetz pencil of plane cubics (X = P² with r = 3): X̃ is P² blown up in 9 points, H^1(X̃) = 0 and f has a section, so the monodromy invariants vanish, E = H^1(X_u) is 2-dimensional with E ∩ E^⊥ = 0, and the image is open in Sp₂(ℚ_ℓ) = SL₂(ℚ_ℓ).

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`, `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient`, `LefschetzPencilsAndVanishingCycles:LPV.5/symplectic-lie-algebra-generated-by-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.5/lie-algebra-of-a-compact-l-adic-subgroup`, `ArithmeticGaloisRepresentations:R01.2`.

*Planet:* Kazhdan–Margulis theorem.

*Sources.*

- La conjecture de Weil. I, §5, Théorème (5.10), p. 293: “(Kajdan-Margulis)” The theorem, attributed to Kazhdan and Margulis: the image of ρ is open.
- La conjecture de Weil. I, §5, proof of (5.10), p. 293: “Il suffit de montrer que son algèbre de Lie” Reduction to the Lie algebra being sp(E/(E ∩ E^⊥), ψ), then Lemma 5.11.

### What is missing

- SGA 7 XVIII §6 is not read; the algebraic tame comparison is requested from InverseGaloisAndArithmeticFundamentalGroups:IG.1.
- The ℓ-adic Lie theory behind the compact-subgroup lemma has no source read (see gaps).

## LPV.6 Perverse nearby cycles and comparison interfaces

No nodes in this checkpoint.

### What is missing

- Not read: Illusie's exposition of perverse nearby cycles and BBD's early perversity formalism.

## Requests to other roadmaps

- `ArithmeticGaloisRepresentations:R01.2` — The tame character t_ℓ : I → ℤ_ℓ(1) of the inertia group of a henselian discretely valued field whose residue field is separably closed of characteristic p ≠ ℓ (p = 0 allowed): σ ↦ (σ(π^{1/ℓ^k})/π^{1/ℓ^k})_k for a uniformiser π, independent of π and of the chosen roots, continuous, surjective and trivial on wild inertia; its reductions mod ℓ^k are the Kummer characters ε_π^{(ℓ^k)} of SGA 7 XV 3.3.2, and for p ≠ 2 the tame quotient has a unique character ε of order 2. RS-17 makes R01.2 the owner of this carrier. Needed by `local-picard-lefschetz-formula`, `odd-relative-dimension-picard-lefschetz-3-3`, `kazhdan-margulis-open-image`.
- `EtaleDualityAndPerverseSheaves:EDC.2` — For Y smooth, proper and connected of dimension n over an algebraically closed field, ℓ invertible: the trace Tr : H^{2n}(Y, ℚ_ℓ(n)) ≅ ℚ_ℓ, perfectness of the cup-product pairing H^i(Y) ⊗ H^{2n−i}(Y) → ℚ_ℓ(−n) with its graded symmetry (alternating in the middle degree when that degree is odd), and the relative trace R^{2n} f_*ℚ_ℓ(n) ≅ ℚ_ℓ for f smooth and proper with connected fibres, compatible with base change, so that monodromy preserves the pairing. Needed by `lefschetz-degeneration-specialization-sequence`, `direct-images-at-a-lefschetz-degeneration`, `vanishing-quotient-and-its-pairing`, `vanishing-cycles-are-conjugate`.
- `EtaleDualityAndPerverseSheaves:EDC.4` — The blow-up of a smooth variety along a smooth closed subvariety of codimension 2 is smooth; for X ⊂ P smooth and a codimension-2 linear subspace A transverse to X, the incidence variety {(x, t) ∈ X × D : x ∈ H_t} over the dual line D is Bl_{A∩X} X. Needed by `lefschetz-pencil`.
- `SchemeAndStackFoundations:SF.2` — Étale sheaves and the derived category D⁺(X_ét, A) for a torsion ring A with ℓ invertible, Rf_*, the proper base change theorem (SGA 4 XII 5.1, including H^i(X, F) = H^i(X_s, F) for X proper over a henselian local scheme) and the smooth base change theorem (SGA 4 XVI 1.2); for f smooth and proper, R^i f_*ℚ_ℓ lisse with fibres H^i of the geometric fibres; ℚ_ℓ-coefficients as limits of ℤ/ℓ^k-coefficients. Needed by `henselian-trait-conventions-and-galois-sheaves`, `functor-psi-and-functorialities`, `derived-nearby-cycles-RPsi-and-vanishing-triangle`, `derived-functorialities-and-specialization-sequence`, `lefschetz-degeneration-specialization-sequence`, `cohomology-sheaves-of-a-lefschetz-pencil`.
- `SchemeAndStackFoundations:SF.0` — Projective space P^N_k and its dual as schemes, linear subspaces and the Grassmannian of codimension-2 subspaces, the Veronese embedding of degree r, projective tangent spaces and the Jacobian criterion for smoothness of hyperplane sections, and projective bundles over a variety. Needed by `dual-variety`, `existence-of-lefschetz-pencils`.
- `EtaleDualityAndPerverseSheaves:EDC.1` — Rf^! for quasi-finite (and separated finite-type) morphisms with the adjunction Rf_! ⊣ Rf^!, as used in SGA 7 XIII 2.1.6–2.1.7 for the functorialities of RΨ. Needed by `derived-functorialities-and-specialization-sequence`.
- `InverseGaloisAndArithmeticFundamentalGroups:IG.0` — The étale fundamental group π₁(X, u) of a connected scheme with its fibre functor, étale paths between geometric points (change of base point), the equivalence between lisse ℚ_ℓ-sheaves and continuous representations of π₁, and π₁(P¹_k) = 1 for k algebraically closed, so that a lisse sheaf on P¹_k is constant. Needed by `cohomology-sheaves-of-a-lefschetz-pencil`, `vanishing-subspace`, `bertini-surjectivity-on-fundamental-groups`.
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1` — Inertia subgroups of π₁ at the points of a finite set S ⊂ P¹_k and at the generic point of a prime divisor, all conjugate for a given divisor; the tame quotient π₁^t; Grothendieck's theorem (SGA 1 XIII 2.12) that π₁^t(P¹_k − S) is a quotient of the profinite completion of ⟨γ_s (s ∈ S) | ∏ γ_s = 1⟩ with γ_s generating an inertia group at s; and Abhyankar's lemma (SGA 1 XIII 5.3) for covers tamely ramified along a smooth divisor. Needed by `vanishing-cycles-are-conjugate`, `monodromy-generated-by-local-transvections`.

## Gaps

- **XV §2 local computation (2.2.1-2.2.7) unread.** All three §3 results reduce to 2.2.4-2.2.7 (vanishing off E, the form (a,b), 2.2.5(A)-(D), the primitive quotient identification 2.2.7). Next action: read XV pp. 13-23 (library text lines ~11430-12190) and XII 3.5-3.7. NOTE ADDED BY INDEPENDENT REVIEW: the OCR of this IAS scan is unreliable for Greek letters - it renders 'nul' as 'seul' and does not distinguish Phi from psi - so every statement of Exposé XV §3 quoted in this packet was re-read from 170-300 dpi renderings of printed pages 24, 25, 27 and 28 during review. Exposé XIII pages 17 and 19 were likewise re-read. The remaining XIII pages cited (5, 7, 9, 10, 13, 15, 20, 22) were NOT rendered and their excerpts rest on the OCR plus the numbered cross-references.
- **Transcendental inputs XIV 2.1, XIV 3.2.11 and the compatibility caveat.** The odd-dimensional formula is proved by reduction to the complex-analytic Picard-Lefschetz formula XIV 3.2.11 through the comparison XIV 2.1, and Deligne notes that a compatibility of XIV 2.1 with cup products and traces would have to be verified 'en toute rigueur'. The stage's requirement of an all-characteristic algebraic proof is therefore not met by the source as written; the mixed-characteristic step (C) via the strict henselization of Spec Z[T] must be read (library lines ~12640-12700) to see how the source passes from characteristic 0 to p.
- **XIII 2.2-2.4 and constructibility.** Trace compatibilities (2.2), finiteness in equal characteristic 0 (2.3), isolated singularities (2.4, including 2.4.6.2 used in XV (B)) not read; constructibility over excellent traits is in SGA 4½ [Th. finitude] 3.2 (library Weil_SGA4Half.txt), not read.
- **Identification of Huber's RΨ_η with SGA 7 XIII's RΨ_η and inertia equivariance.** Both are ī^* R j̄_* on the geometric generic fibre over a strictly henselian trait, but Huber's is formulated on X_s̄ with the comparison to d(X̂) ⊗̂ k̄^ (3.5.17) and the inertia action is not discussed there; the equality must be recorded explicitly before ClassicalAdicEtaleCohomology:H1 can consume LPV.0.
- **SGA 7 XVII (existence of Lefschetz pencils) not read.** Weil I (5.7) states the theorem and (5.13) C) refers to SGA 7 XVII (Katz), which is in the IAS scan from PDF page 220. Its jet-separation argument, the codimension estimates and the openness of the Lefschetz conditions were not read; the proof steps of the existence node are an outline.
- **SGA 7 XVIII (global theory of pencils) not read.** Weil I (5.8) gives the ℓ-adic statements and says that the transposition of Lefschetz's results 'se fait par des arguments standards', naming the tame lifting, Bertini and Abhyankar's lemma. The proof steps here follow Weil I's complex proofs (5.3)–(5.5) with those replacements. SGA 7 XVIII, where (5.13) D) places the proofs, was not read.
- **Bertini's irreducibility theorem.** Step (i) of the Bertini node uses the irreducibility of the preimage of a general line under a finite morphism from an irreducible variety (Jouanolou, Théorèmes de Bertini et applications), not read. Step (ii), reducing from all of π₁ to the image in GL(𝒢_u) by a Frattini argument, is this packet's; Weil I states only the complex surjectivity.
- **ℓ-adic Lie theory for compact subgroups.** Weil I (5.10) asserts that a compact subgroup of Sp(ℚ_ℓ) is ℓ-adic analytic, and openness follows once its Lie algebra is sp. The closed-subgroup theorem, uniform open subgroups and the Lie lattice log H₀ (Lazard; Serre, Lie Algebras and Lie Groups, Part II) were not read, and no roadmap stage plans ℓ-adic analytic groups in this generality, so the compact-subgroup lemma is planned here with outlined proof steps.
- **Ordinary quadratic singular points are not yet a node.** The definition (SGA 7 XV §1, with the characteristic-2 distinction between a nonsingular quadric and a nondegenerate polar form) belongs to LPV.2 and was not read. The Lefschetz-pencil node refers to stage LPV.2 for it; Mathlib's QuadraticMap.Nondegenerate covers the quadratic-form half.

## Mistakes found in the sources

None in the passages read for this checkpoint. Several checks were made against the page images:

- The twists in Weil I (4.3) are consistent: t_ℓ(σ)(x, δ)δ ∈ H^n(X_η̄)(2m + 1 − n) = H^n(X_η̄) for n = 2m + 1.
- The sign table of (4.1) agrees with SGA 7 XV 3.2.1 and 3.3.
- The degree-(n + 1) sequences of (4.4) b) and (5.8) b) agree with each other.

Weil I (5.10) says that the Lie algebra 𝔏 of the monodromy group is generated by the N_s. This follows only after the fact, from 𝔤_S ⊂ 𝔏 ⊂ sp. The Kazhdan–Margulis node therefore argues with 𝔤_S, the Lie algebra generated by the N_s, and does not use the claim.

## Library baseline

- `LinearEquiv.transvection` (Mathlib/LinearAlgebra/Transvection/Basic.lean) — For f : Dual R V and v : V with f v = 0, the linear equivalence x ↦ x + f x • v.
- `LinearEquiv.mem_fixedSubmodule_transvection_iff` (Mathlib/LinearAlgebra/Transvection/Basic.lean) — x is fixed by the transvection x ↦ x + f x • v if and only if f x • v = 0.
- `LinearMap.BilinForm.orthogonal` (Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean) — The orthogonal B.orthogonal N of a submodule N for a bilinear form B.
- `LinearMap.BilinForm.IsAlt` (Mathlib/LinearAlgebra/BilinearForm/Properties.lean) — A bilinear form is alternating: B x x = 0 for all x.
- `skewAdjointLieSubalgebra` (Mathlib/Algebra/Lie/SkewAdjoint.lean) — The Lie subalgebra of Module.End R M of endomorphisms skew-adjoint for a bilinear form B; for B alternating and nondegenerate this is sp(M, B).
- `LieModule.IsIrreducible` (Mathlib/Algebra/Lie/Semisimple/Defs.lean) — A nontrivial Lie module whose only Lie submodules are ⊥ and ⊤.
- `IsNilpotent.exp` (Mathlib/RingTheory/Nilpotent/Exp.lean) — The finite exponential ∑ aⁱ/i! of a nilpotent element of a ℚ-algebra; for N² = 0 it is 1 + N.
- `ValuationSubring.inertiaSubgroup` (Mathlib/RingTheory/Valuation/RamificationGroup.lean) — The inertia subgroup of the decomposition group of a valuation subring: the kernel of the action on its residue field.

## Sources

- Pierre Deligne, *La conjecture de Weil. I*. Publ. Math. IHÉS 43 (1974), 273–307; Numdam scan with OCR, 36 PDF pages (printed page = PDF page + 271); locators give printed pages. https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf (SHA-256 `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`). Read: cc-fb70e5, 2026-09-29 (part LPV.0, checkpoint 1): §4 (4.1)–(4.4) and §5 (5.1)–(5.13), pp. 287–294, in full; the displays of (4.1), (4.3.3), (4.4), (5.7), (5.8) and (5.9)–(5.11) were read on page images.
- Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, *Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340*. Springer 1973; IAS author-archive scan with OCR (the OCR is poor: symbols ~, @, 4 replace accents and Greek letters; statements were reconstructed from the surrounding French text and the numbered cross-references). https://publications.ias.edu/sites/default/files/Number12.pdf (SHA-256 `fa679debfc8ada3232d7e752a1837fc6ce474488e20a44d7641cf296876e1297`). Read: Exposé XIII: Introduction (transcendental picture, Construction 0.1), 0.2 conventions, §1.1 (1.1.1-1.1.3), §1.2 (1.2.1-1.2.9), §1.3 (1.3.1-1.3.10), §1.4 (1.4.1-1.4.3), §2.1 (2.1.1-2.1.8); §2.2-2.4 not read; Exposé XV: table of contents; §3.1 (3.1.1-3.1.2 with proof sketch), §3.2 (3.2.1-3.2.3), §3.3 (3.3.1-3.3.4, statements of 3.3.5-3.3.6 and steps (A)-(B) of the proof); §§1-2 and the rest of the proof of 3.3.5-3.3.6 not read; cc-fb70e5, 2026-09-29 (part LPV.0, checkpoint 1): file re-downloaded and its SHA-256 recomputed; the volume contains Exposés XII–XXII (XVII begins at PDF page 220). No new passage was read; the Exposé XIII and XV excerpts are carried from the reviewed decomposition, whose reviewer read them on rendered page images..

## Non-goals

- A second construction of étale cohomology, Poincaré duality or étale fundamental groups. These come from SF.2, EDC.2 and IG.0–IG.1.
- Weights. No Frobenius-weight statement enters LPV.0–LPV.5, and DWP owns the weight estimates.
- The invariant-cycle theorems and semistable-curve exports. These are part LPV.7.
