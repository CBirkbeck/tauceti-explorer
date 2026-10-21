# P-adic differential equations, rigid cohomology and p-adic weights — RD.3, continued

## RD.3. Overconvergent isocrystals and frames: proofs of the frame theory, convergent coefficients, unit-root objects and descent

**Summary.** This document completes layer RD.3. The layer's other targets — frames, tubes, strict neighbourhoods, Berthelot's functor j†, overconvergent isocrystals on a frame in stratification and connection form, pullback along morphisms of frames, the Taylor comparison, independence of the frame and of the compactification, Isoc†(X/K), overconvergent F-isocrystals, (σ,∇)-modules over dagger algebras and the Monsky–Washnitzer description, restriction to convergent F-isocrystals, finite étale pushforward, rigid Quillen–Suslin and the acceptance tests — are stated in the RD.3 section of the main document and cited here by their ids (`RD.3/…`). This part adds:

1. **The proofs of the frame theory.** The étale tube isomorphism and the étale strict-neighbourhood theorem, from which the weak and strong fibration theorems follow; the structure of strict neighbourhoods; the calculus of j†, coherent j†O-modules as germs on strict neighbourhoods and their gluing; overconvergence as a property, local on P and on X, with Berthelot's coordinate criterion; the construction of isocrystals without a global frame and the Zariski stack property; and, on these foundations, complete proofs of the independence of the frame and of the compactification. The source is Berthelot's preprint *Cohomologie rigide et cohomologie rigide à supports propres*, première partie (IRMAR 96-03), which is publicly available.
2. **Smooth affines.** The henselian property of Monsky–Washnitzer algebras with Elkik's descent of projective modules and the lifting of étale algebras; the equivalence between overconvergent isocrystals on a smooth affine and modules with convergent connection over the dagger algebra; the realisation of pullbacks by lifts of morphisms; and Berthelot's theorem that a Frobenius structure forces overconvergence. The finite étale pushforward of overconvergent F-isocrystals is constructed from these.
3. **The convergent coefficient model.** Convergent isocrystals and convergent F-isocrystals, Dwork's construction of the convergent F-isocrystal of an F-crystal, the comparison of convergent F-isocrystals with F-crystals up to isogeny and Tate twist (Berthelot, Ogus), and the underlying bundle with connection on a possibly ramified smooth formal scheme (Guo–Reinecke).
4. **Unit-root objects and descent.** Unit-root F-isocrystals and the Katz–Crew correspondence with lisse ℚ_q-sheaves; Étesse's theorems that convergent direct summands of overconvergent F-isocrystals are overconvergent and that overconvergent F-isocrystals on smooth varieties satisfy étale descent.
5. **Without Frobenius.** Kummer isocrystals on G_m and an explicit extension of the unit object by a Kummer isocrystal with a p-adic Liouville-type exponent, which shows that restriction from overconvergent to convergent isocrystals is not full without Frobenius structures.

Landmark: Convergent F-isocrystal.

### Conventions

* K is a complete discretely valued field of characteristic 0 with valuation ring O, uniformiser π and residue field k of characteristic p; k is perfect where stated. Formal O-schemes are separated and of finite type; P_K is the Raynaud generic fibre with specialisation map, from AdicSpacesPartII:R2.
* A frame (X ⊆ Y ⊆ P) is an open immersion X → Y of k-schemes of finite type and a closed immersion of Y into a formal O-scheme P smooth near X (`RD.3/frame`); Z = Y ∖ X. Tubes ]T[_P, closed tubes [T]_{P,λ} and open tubes ]T[_{P,λ} of radius λ ∈ |K^×|^ℚ, λ < 1, are as in `RD.3/tube`. For η < 1, U_η = ]Y[_P ∖ ]Z[_{P,η}; on an affine P with g_1, …, g_s cutting out Z in Y, U′_η = {max_j |g_j| ≥ η}.
* A strict neighbourhood of ]X[_P in ]Y[_P is an admissible open V ⊇ ]X[_P such that (V, ]Z[_P) is an admissible covering of ]Y[_P; equivalently W ∩ U_η ⊆ V for every affinoid W and η close to 1. Standard strict neighbourhoods are V_{λ,η} = ⋃_n ([Y]_{λ_n} ∩ U_{η_n}) for increasing sequences λ_n, η_n → 1.
* j†E is the sheaf of germs of sections of E on strict neighbourhoods (`RD.3/j-dagger`). Connections are relative to S_K for a formal base S (usually Spf O), and the divided-power derivatives are ∂^{[k]} = ∂^k/k! in étale coordinates t_1, …, t_m with τ_i = 1 ⊗ t_i − t_i ⊗ 1 on the double product.
* Frobenius: σ is an automorphism of K lifting the q-power Frobenius of k, q = p^a; F_σ^* is base change along σ followed by pullback along the q-power Frobenius. An F^a-isocrystal is (E, Φ) with Φ: F_σ^*E ≅ E; the Tate twist E(n) multiplies Φ by q^{−n} (by p^{−n} when a = 1).
* The Dwork isocrystal L_π on A^1 over K = ℚ_p(π), π^{p−1} = −p, is taken here with ∇(1) = −π dt and Frobenius exp π(t − t^p) for the lift t ↦ t^p (Berthelot 96-03 (2.2.15), (2.3.8)). The main document's acceptance tests use the dual object, ∇(1) = π dt with Frobenius exp π(t^p − t) (Berthelot, Mém. SMF 23, (4.2.3)).
* Kummer isocrystals K_a on G_m ⊆ P^1 have ∇(e) = a e dt/t, a ∈ ℤ_p. Overconvergent Laurent series are written K⟨t, t^{−1}⟩†, those on the circle |t| = 1 K⟨t, t^{−1}⟩.
* Slopes are read at perfect points; unit-root means pure of slope 0. At a perfect point Ω ⊇ k with K = W(k)[1/p] and a = 1, fibres are Mathlib's `WittVector.Isocrystal` over Ω.

### Suppliers and boundaries

*From Mathlib.* `WittVector.Isocrystal`, `WittVector.StandardOneDimIsocrystal` and `WittVector.isocrystal_classification` (fibres at perfect points and rank-one classification); `PadicInt`, `Padic`; `Algebra.FormallyEtale`, `Algebra.Etale`, `AlgebraicGeometry.Etale`, `AlgebraicGeometry.IsProper`.

*From Tau Ceti.* Nothing beyond Mathlib: the pinned and current libraries contain no rigid tubes, overconvergent sheaves or isocrystal categories, and no current TauCetiRoadmap roadmap plans them.

*From other roadmaps of the atlas (all of lower tier).* AdicSpacesPartII: Raynaud generic fibres and tubes (R2), the maximum modulus principle, the Jacobian criterion and the finiteness of proper quasi-finite morphisms (R0), the comparison of formal and rigid properness (R2), Kiehl's theorem for affinoids (R3), and the dagger-algebra layer F1 (weak completions, Monsky–Washnitzer algebras, lifting of morphisms, finite extensions, differentials, traces). SchemeAndStackFoundations: henselian pairs (SF.0) and the domination of modifications by admissible blow-ups (SF.4). PerfectoidSpaces: Elkik's approximation theorem (P3). CrystallineCohomology: crystals, isocrystals and non-degenerate F-crystals (CR.1/crystal, CR.1/isocrystal), the crystal–connection dictionary (CR.1/taylor-equivalence), completed divided-power envelopes (CR.0) and the slope decomposition of isocrystals over a perfect field (CR.4). InverseGaloisAndArithmeticFundamentalGroups: ℤ_p- and ℚ_p-local systems with finite coefficient extensions and the étale fundamental group (IG.0).

*Within this roadmap.* RD.0 supplies Frobenius lifts on dagger algebras and the change-of-lift Taylor formula; the main RD.3 nodes are cited by id. Relative rigid cohomology and everything built on it (Berthelot–Tsuzuki overconvergence of R^q f_rig* for liftable families, Étesse's overconvergence for abelian schemes, docility and semistable reduction) belong to RD.5; the comparison of convergent and rational crystalline cohomology belongs to RD.7, which uses `RD.3/convergent-f-isocrystals-are-crystalline`. Logarithmic isocrystals are not targets of this layer; partially overconvergent isocrystals are the frame categories Isoc(X, Y, P) with Y not proper.

### How to read this document

The sections follow the order of proof. Section 1 makes the tube and strict-neighbourhood geometry precise and proves the étale isomorphism theorems; section 2 develops j† and coherent j†-modules; section 3 shows that overconvergence is a property of a connection and builds the categories of overconvergent isocrystals without global frames; section 4 treats smooth affines through Monsky–Washnitzer algebras; section 5 builds the convergent coefficient model; sections 6 and 7 treat unit-root objects and Étesse's descent theorems; section 8 gives the examples without Frobenius. The proofs that this material supplies for the main document's targets are collected after section 8. Every target lists its API, its Checks (unit tests that a wrong definition fails), its dependencies and its sources by theorem and page.

## 1. Tubes, strict neighbourhoods and the étale isomorphism theorems

The weak and strong fibration theorems of the main document (`RD.3/weak-fibration-theorem`, `RD.3/strong-fibration-theorem`) reduce, after choosing coordinates t_1, …, t_d of the conormal sheaf, to two statements about étale morphisms of formal schemes: on tubes, and on strict neighbourhoods. The second is the technical heart of the frame theory; its proof needs the maximum principle, the Jacobian criterion and Raynaud's comparison of formal and rigid properness.

### Étale maps induce isomorphisms of tubes

**Theorem.** Node `RD.3/etale-tube-isomorphism`.

Let X be a k-scheme of finite type, i: X → P and i′: X → P′ immersions into formal O-schemes of finite type, and u: P′ → P a morphism with u∘i′ = i which is étale on a neighbourhood of i′(X). Then u_K restricts to an isomorphism of rigid spaces ]X[_{P′} → ]X[_P. Moreover, for every closed tube radius λ ∈ |K^×|^ℚ with λ < 1 sufficiently close to 1, u_K restricts to an isomorphism of the closed tubes [X]_{P′,λ} → [X]_{P,λ}.

**Hypotheses and scope.**

- X need not be smooth; P and P′ need not be smooth; only étaleness of u near X is used.
- The tube depends only on an open formal subscheme containing X, so P and P′ may be shrunk to opens containing X.

**Proof or construction.**

1. Replace P and P′ by opens containing X so that X is closed in both, u is étale and P′ ×_P X → X is an isomorphism (an étale map with a section is an open immersion near the section). Since tubes are local on P (the generic fibres of an affine covering form an admissible covering), assume P = Spf A and P′ = Spf A′ affine (Berthelot 96-03, proof of (1.3.1), p. 39).
2. Let f_1, …, f_r ∈ A lift equations of X modulo the maximal ideal of O and a ∈ m_K nonzero. The closed tube of radius λ = |a|^{1/n} is the affinoid with algebra A{T}/(f_i^n − aT_i) ⊗ K, and the same presentation with A′ describes [X]_{P′,λ} (Berthelot (1.1.9)). It therefore suffices that A[T]/(a^m, f_i^n − aT_i) → A′[T]/(a^m, f_i^n − aT_i) is an isomorphism for all m, n.
3. The ideal generated by the f_i in A[T]/(a^m, f_i^n − aT_i) is nilpotent; A′[T] is étale over A[T] and the two rings agree modulo that nilpotent ideal ((A/I)[T] ≅ (A′/IA′)[T]). An étale algebra which becomes an isomorphism modulo a nilpotent ideal is an isomorphism (formal étaleness), so each map is an isomorphism; passing to the limit over m gives the closed-tube statement, and the open tube is the admissible union of the closed tubes as λ → 1.

**Examples and acceptance.**

- Square root near 1: for p odd, P = P′ = Spf O⟨t, t^{-1}⟩ with u(t) = t² and X = {t = 1}: u is étale and u_K maps the residue disc {|t − 1| < 1} isomorphically onto {|s − 1| < 1}, the inverse being the binomial series of (1 + (s − 1))^{1/2}, whose coefficients are p-integral.
- Non-example: for the projection P × Spf O⟨x⟩ → P with X embedded by the zero section, u is smooth but not étale, and the tube of X upstairs is the product of ]X[_P with an open unit disc, not isomorphic to ]X[_P.
- With P′ = P and u the identity the statement is the identity of ]X[_P (degenerate case).

**Needs.** `RD.3/tube`, `AdicSpacesPartII:R2/tube`, `AdicSpacesPartII:R2/raynaud-generic-fibre`, Mathlib `Algebra.FormallyEtale`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (1.3.1) Proposition and its proof, pp. 39–40. States that an étale map compatible with the immersions induces an isomorphism of open tubes and of closed tubes of radius close to 1, proved by reducing to affine formal schemes and comparing the presentations of the closed tubes modulo powers of a.

### Strict neighbourhoods: admissible-covering definition, criterion and standard systems

**Lemma.** Node `RD.3/standard-strict-neighbourhoods`.

Let P be a formal O-scheme of finite type, Y ⊆ P_k a closed subscheme, X ⊆ Y open and Z = Y ∖ X. For η ∈ |K^×|^ℚ, η < 1, put U_η = ]Y[_P ∖ ]Z[_{P,η}. (a) An admissible open V ⊆ ]Y[_P containing ]X[_P is a strict neighbourhood of ]X[_P (the covering (V, ]Z[_P) of ]Y[_P is admissible) if and only if for every affinoid W ⊆ ]Y[_P there is η_0 < 1 with W ∩ U_η ⊆ V for all η_0 ≤ η < 1; when P is affine and g_1, …, g_s ∈ Γ(P, O_P) cut out Z inside Y, U_η may be replaced by U′_η = {x ∈ ]Y[_P : max_j |g_j(x)| ≥ η}. (b) For increasing sequences λ_n → 1 and η_n → 1 in |K^×|^ℚ the union V_{λ,η} = ⋃_n ([Y]_{λ_n} ∩ U_{η_n}) is a strict neighbourhood, independent of the chosen equations after discarding finitely many terms, and for fixed λ the V_{λ,η} form a fundamental system; they are pseudo-compact in ]Y[_P. (c) Strict neighbourhoods are stable under finite intersection, are local on P, and pull back to strict neighbourhoods along morphisms of triples (X′, Y′, P′) → (X, Y, P); the complement in ]Y[_P of a closed analytic subspace of P_K missing ]X[_P is a strict neighbourhood. (d) If X is open in a larger closed Y′ ⊇ Y, an open V ⊇ ]X[ of ]Y[ is a strict neighbourhood in ]Y[ if and only if it is one in ]Y′[; for opens X_1, X_2 of Y with strict neighbourhoods V_1, V_2, V_1 ∩ V_2 is a strict neighbourhood of ]X_1 ∩ X_2[ and, when V_1, V_2 are pseudo-compact, V_1 ∪ V_2 is one of ]X_1 ∪ X_2[ with (V_1, V_2) an admissible covering.

**Hypotheses and scope.**

- The covering (]X[, ]Z[) of ]Y[ is not admissible in general, which is why strict neighbourhoods are needed (Berthelot's remark after (1.2.1)).
- Radii are taken in |K^×|^ℚ so that the tubes and the sets U_η are finite unions of rational domains.

**Proof or construction.**

1. (a): if V is strict, the admissible covering (V, ]Z[_η)_{η→1} of W has a finite subcovering, so some U_η ∩ W lies in V; conversely, for P affine, for any affinoid h: Spm B → ]Y[ the maximum principle puts the image in some [Y]_λ, and the finitely many special domains [Z]_η and {|g_i| ≥ η} ∩ [Y]_λ refine (V, ]Z[) (Berthelot 96-03 (1.2.2), p. 33). The replacement of U_η by U′_η uses the maximum principle once more on W (1.2.3)(iii).
2. (b): the V_{λ,η} are open with the indicated special covering, and given any strict V′, quasi-compactness of [Y]_{λ_n} and (a) produce η_n with U_{η_n} ∩ [Y]_{λ_n} ⊆ V′ (1.2.4)(i); pseudo-compactness is (1.2.9).
3. (c): intersections and locality are immediate from the admissible-covering definition and (1.2.3)(ii); pullback is (1.2.7), using v^{-1}(Z) ⊆ Z′; complements of closed analytic subspaces are (1.2.4)(ii) by the maximum principle.
4. (d): (1.2.11) uses the admissible covering (]Y[, ]Z′[) of ]Y′[ ((1.1.14)(ii)); the intersection and union statements are (1.2.10).

**Examples and acceptance.**

- Affine space: for P the formal projective space over O and X = A^n_k ⊂ P^n_k = Y, the sets U_η are the closed balls of radius 1/η around 0, so the closed balls of radius > 1 form a fundamental system of strict neighbourhoods of the closed unit polydisc (Berthelot (1.2.4)(iii)).
- Non-example: for P = Spf O⟨t⟩, Y = A^1_k and Z the origin, ]X[ is the annulus |t| = 1 and ]X[ itself is not a strict neighbourhood: the covering (]X[, ]Z[) of the closed disc is not admissible by the maximum principle.
- If Z = ∅ (X = Y) every admissible open containing ]X[ is a strict neighbourhood, in particular ]X[ itself.

**Needs.** `RD.3/strict-neighbourhood`, `RD.3/tube`, `AdicSpacesPartII:R0/affinoid-maximum-modulus`, `AdicSpacesPartII:R2/tube`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (1.2.1)–(1.2.4), (1.2.7), (1.2.9)–(1.2.11), pp. 32–38. Defines strict neighbourhoods by admissibility of the covering (V, ]Z[), proves the affinoid criterion, the standard neighbourhoods V_{λ,η} with their independence of equations, pullback along morphisms of triples, and the behaviour under intersections, unions and enlargement of Y.

### Étale morphisms proper over the closure of X induce isomorphisms of strict neighbourhoods

**Theorem.** Node `RD.3/etale-strict-neighbourhood-isomorphism`.

Let X ⊆ Y be an open immersion of k-schemes of finite type, i: Y → P and i′: Y′ → P′ closed immersions into formal O-schemes of finite type, v: Y′ → Y and u: P′ → P morphisms with u∘i′ = i∘v and v restricting to the identity on X ⊆ Y′ (X open in Y′). Let X̄ be the closure of X in P′ ×_P Y. If u is étale on a neighbourhood of X and the restriction of v to X̄ is proper, then u_K induces an isomorphism from a strict neighbourhood of ]X[_{P′} in ]Y′[_{P′} onto a strict neighbourhood of ]X[_P in ]Y[_P.

**Hypotheses and scope.**

- Properness of v on the closure of X is essential: it is used to show that the closure of the relevant analytic domain is finite over P_K.
- The étaleness of u is required only near X; P and P′ may be singular along Y ∖ X and Y′ ∖ X.

**Proof or construction.**

1. Reduce to v proper with v^{-1}(X) = X by replacing Y′ with X̄ (standard-strict-neighbourhoods (d)); localise on a finite affine covering of P, and on a finite covering of X, so that P = Spf A, X = D(g) ∩ Y, and the standard neighbourhoods are built from U_η = {|g| ≥ η}; after the base change P_1 = Spf A{T}/(f_i^q − aT_i) one may assume [Y]_λ = P_K (Berthelot 96-03, proof of (1.3.5), pp. 42–43).
2. Write P′ ×_P Y = Y′ ⊔ D with X open and closed in P′ ×_P X (u étale with a section over X). Choose μ < 1 with P′_K ∖ ]Y′[ ⊆ [D]_μ and then λ_0 < 1 with P′_K ∖ ]D[_μ ⊆ [Y′]_{λ_0}; by the maximum principle, for each λ ≥ λ_0 there is η < 1 with [Y′]_λ ∩ [D]_μ ∩ U′_η = ∅, so T_K = [Y′]_λ ∩ U′_η is open and closed, hence a closed analytic subspace of U′_η.
3. By the Jacobian criterion the non-smooth and non-étale loci of T_K → P_K are closed analytic subsets missing ]X[_{P′} (where etale-tube-isomorphism applies), so after enlarging η the map T_K → U_η is étale; after one more base change T_K is closed in P′_K, its schematic closure T in P′ has special fibre inside Y′, hence is proper over P because v is proper.
4. By the comparison of formal and rigid properness T_K → P_K is proper, hence finite since it is étale (quasi-finite and proper implies finite), given by a coherent O_{P_K}-algebra 𝓇. The map O_{P_K} → 𝓇 is an isomorphism over ]X[_P, and its kernel and cokernel are supported on closed analytic subsets missing ]X[_P, so it is an isomorphism over U_η for η close to 1; thus T_K ∩ U′_η → U_η is an isomorphism, which gives the required strict neighbourhoods.

**Examples and acceptance.**

- Degenerate case: Y′ = Y and u = id give the identity on any strict neighbourhood.
- Open immersion: if u is the inclusion of an open formal subscheme P′ ⊆ P containing Y and Y′ = Y, the strict neighbourhoods of ]X[ in ]Y[_{P′} and in ]Y[_P coincide.
- Non-example showing properness is needed: P = Spf O⟨t⟩, Y = A^1_k, X = G_m = Y ∖ {0}, P′ = Spf O⟨t, t^{-1}⟩ the open formal subscheme over X, Y′ = X and v the inclusion, which is not proper. Then ]Y′[_{P′} = {|t| = 1} = ]X[_P, which is not a strict neighbourhood of ]X[_P in the closed unit disc ]Y[_P, because the covering of the closed disc by the annulus |t| = 1 and the open disc |t| < 1 is not admissible.

**Needs.** `RD.3/etale-tube-isomorphism`, `RD.3/standard-strict-neighbourhoods`, `RD.3/strict-neighbourhood`, `AdicSpacesPartII:R0/affinoid-maximum-modulus`, `AdicSpacesPartII:R0/jacobian-criterion-closed-subspace`, `AdicSpacesPartII:R2/formal-rigid-properness-comparison`, `AdicSpacesPartII:R0/quasi-finite-and-finiteness-criteria`, Mathlib `AlgebraicGeometry.IsProper`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (1.3.4)–(1.3.5) Théorème and its proof, pp. 41–44. States and proves that an étale morphism of formal schemes, proper on the closure of X, induces an isomorphism between strict neighbourhoods of the tubes of X, by isolating an open and closed analytic domain, proving it étale over P_K by the Jacobian criterion and maximum principle, and finite via Raynaud's properness comparison.
- [Bruno Chiarellotto, Nobuo Tsuzuki, *Cohomological descent of rigid cohomology for étale coverings*](https://www.numdam.org/item/RSMUP_2003__109__63_0/), 2.10.2 Proposition, p. 85. Restates the result in the language of V-triples (étale around Y, proper, isomorphism on X) and deduces that pullback of coherent j†-modules is an equivalence with quasi-inverse the direct image, citing Berthelot's Théorème 1.3.5.

## 2. The functor j† and coherent j†O-modules

Coherent j†O-modules are germs, on strict neighbourhoods, of coherent analytic modules; this is what lets every subsequent construction be made on a single strict neighbourhood and then shrunk. The localisation of j† along open coverings of X gives the gluing on which the stack properties rest.

### j† is exact, commutes with tensor products, is functorial and localises on X

**Lemma.** Node `RD.3/j-dagger-exactness-and-functoriality`.

In the setting of RD.3/j-dagger, let V be a strict neighbourhood of ]X[_P in ]Y[_P and 𝒜 a sheaf of rings on V. (a) For every 𝒜-module E the canonical map E → j†E is an epimorphism, an isomorphism when E is a j†𝒜-module, and E ⊗_𝒜 j†𝒜 → j†E is an isomorphism; j† is exact on 𝒜-modules, its restriction to ]X[ is the identity and its restriction to V ∩ ]Z[ is zero; Γ(]Y[, E) → Γ(V, E) is bijective for j†𝒜-modules E. (b) For a morphism of triples (w, v, u): (X′, Y′, P′) → (X, Y, P) and strict neighbourhoods with u_K(V′) ⊆ V there are canonical maps j†E → u_{K*} j′† u_K^{-1}E and, for modules, j†E → u_{K*} j′† u_K^*E; when X′ = v^{-1}(X) the maps u_K^{-1} j†E → j′† u_K^{-1}E and u_K^* j†E → j′† u_K^* E are isomorphisms. (c) For E coherent on V the map j†E → j_{K*} j_K^* E to the sections on ]X[ is injective. (d) For a finite open covering X = X_1 ∪ … ∪ X_n with inclusions j_{i_0…i_k} of the intersections, the alternating Čech complex 0 → j†E → ⊕ j_{i}†E → ⊕_{i_0<i_1} j_{i_0 i_1}†E → … is exact; equivalently j_1† j_2† ≅ j†_{X_1 ∩ X_2} and the sections supported in ]Z[ satisfy Γ_{]Z_1[} Γ_{]Z_2[} = Γ_{]Z_1 ∩ Z_2[}.

**Hypotheses and scope.**

- No coherence is needed for (a), (b) and (d); (c) needs E coherent on a strict neighbourhood.
- The isomorphism statements in (b) need X′ = v^{-1}(X); without it only the canonical maps exist.

**Proof or construction.**

1. (a): sections of j†E over a quasi-compact W are germs of sections over W ∩ V′, V′ strict; surjectivity of E → j†E is local and follows by covering W by the special domains {|t_i| ≥ η} and [Z]_{η′}, on the latter the germ lifting to zero; injectivity for j†𝒜-modules uses that (U_η, ]Z[) covers V admissibly and that j†-modules vanish on ]Z[; the tensor formula follows from the universal property and exactness from exactness of filtered colimits and the epimorphism (Berthelot 96-03 (2.1.1)–(2.1.3), pp. 47–51).
2. (b): the maps come from pulling back germs of sections along u_K, using that preimages of strict neighbourhoods are strict (standard-strict-neighbourhoods (c)); when X′ = v^{-1}(X) an explicit inverse is constructed on affine charts from the sets U_η and U′_η = u_K^{-1}(U_η) ∩ ]Y′[ ((2.1.4), pp. 51–53).
3. (c): a section killed on ]X[ has support a closed analytic, hence quasi-compact, subset of a quasi-compact W disjoint from ]X[, so it is contained in some [Z]_η and the germ is zero ((2.1.5), p. 53).
4. (d): for two opens, compute the germs over V_1 ∩ V_2 and use that the products g′_i g″_j define Z_1 ∪ Z_2 ((2.1.7)); the general exactness follows by induction on n from the exact sequences 0 → Γ_{]Z[} → id → j† → 0 ((2.1.6), (2.1.8), pp. 53–56).

**Examples and acceptance.**

- Affine space: for P the formal projective n-space and X = A^n_k, Γ(P_K, j†O) is the ring K⟨t_1, …, t_n⟩† of series with radius of convergence > 1 (Berthelot (2.1.2.3)), while Γ(]X[, j†O) = K⟨t_1, …, t_n⟩, so j† genuinely changes global sections.
- Degenerate case: if Z = ∅ then j†E = E.
- Two-open covering of G_m = A^1 ∖ {0} ⊂ P^1 by A^1 ∖ {0} itself and a second copy: the Čech sequence of (d) reduces to j†E ≅ j†E.

**Needs.** `RD.3/j-dagger`, `RD.3/strict-neighbourhood`, `RD.3/standard-strict-neighbourhoods`, `AdicSpacesPartII:R0/affinoid-maximum-modulus`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.1.1)–(2.1.8) with the remark after (2.1.8), pp. 47–56. Defines the sheaf of overconvergent germs, proves exactness, the tensor formula, functoriality for morphisms of triples with the isomorphism criterion X′ = v^{-1}(X), injectivity into sections on the tube for coherent sheaves, and the Čech/Mayer–Vietoris resolution localising j† on X.
- [Bruno Chiarellotto, Nobuo Tsuzuki, *Cohomological descent of rigid cohomology for étale coverings*](https://www.numdam.org/item/RSMUP_2003__109__63_0/), 2.7–2.8 and 2.12.2 Proposition, pp. 80–90. Re-proves these properties of j† for V-triples, with references to Berthelot's numbering.

### Coherent j†O-modules are germs of coherent modules on strict neighbourhoods

**Theorem.** Node `RD.3/coherent-j-dagger-modules`.

In the setting of RD.3/j-dagger: (a) j†O_{]Y[} is a coherent sheaf of rings, and coherent j†O_{]Y[}-modules form an abelian subcategory of all j†O_{]Y[}-modules stable under ⊗ and internal Hom. (b) Every coherent j†O_{]Y[}-module is isomorphic to j†𝓮 for a coherent O_V-module 𝓮 on some strict neighbourhood V, and for coherent 𝓮, 𝓯 on V, Hom(j†𝓮, j†𝓯) = colim_{V′ ⊆ V} Hom_{O_{V′}}(𝓮|_{V′}, 𝓯|_{V′}); thus the category of coherent j†O-modules is the 2-colimit over strict neighbourhoods of the categories of coherent modules, and E is locally free of finite rank if and only if it is j†𝓮 for a locally free 𝓮. (c) The restriction functor from coherent j†O_{]Y[}-modules to coherent O_{]X[}-modules is exact and faithful.

**Hypotheses and scope.**

- The 2-colimit in (b) is over the filtered set of strict neighbourhoods; two coherent modules on strict neighbourhoods define the same germ if they become isomorphic on a smaller strict neighbourhood.

**Proof or construction.**

1. (a): finite generation of kernels of maps (j†O)^n → j†O is checked on an admissible affinoid covering; on W ∩ ]Z[ the kernel vanishes and on W ∩ V it is j† of the kernel of a map of coherent O-modules, by exactness of j† (j-dagger-exactness-and-functoriality (a)) (Berthelot 96-03 (2.1.9), p. 56).
2. (b): first, for each λ < 1, find η and coherent models on V_λ = U_η ∩ [Y]_λ, using that [Y]_λ is quasi-compact and that on affinoids with finite presentations the statement reduces to E = j†O (formula (2.1.1.5)); then build compatible models on ⋃_{n' ≤ n} V_{n'} by induction along sequences λ_n, η_n → 1 and glue on the standard strict neighbourhood V_{λ,η}, which the V_n cover admissibly; the Hom statement is proved the same way ((2.1.10), pp. 56–57, and the remark after it).
3. (c): a morphism f = j†(g) vanishing on ]X[ has image supported on a closed analytic subset missing ]X[, which a smaller strict neighbourhood avoids ((2.1.11), p. 57); exactness is that of restriction to an open.

**Examples and acceptance.**

- Affine space: the coherent j†O-modules on P^n_K for X = A^n_k correspond to finitely generated K⟨t⟩†-modules (Berthelot (2.5.2)(i) with A = O[t]).
- Faithful but not full: on the frame (A^1_k, P^1_k, P̂^1), the injection K⟨t⟩† → K⟨t⟩ is the restriction functor on global sections of the free rank-one module; the element Σ p^{⌊√n⌋} t^n of K⟨t⟩ shows Hom(j†O, j†O) = K⟨t⟩† is a proper subspace of Hom(O_{]X[}, O_{]X[}) = K⟨t⟩.
- Degenerate case: if Z = ∅, coherent j†O-modules are coherent O_{]Y[}-modules.

**Needs.** `RD.3/j-dagger`, `RD.3/j-dagger-exactness-and-functoriality`, `RD.3/standard-strict-neighbourhoods`, `AdicSpacesPartII:R3/tate-kiehl-affinoid`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.1.9)–(2.1.11) with the remark after (2.1.10), pp. 56–57. Proves coherence of j†O, the description of coherent j†O-modules (and of locally free ones) as germs of coherent modules on strict neighbourhoods with the colimit formula for Hom, and faithfulness of restriction to the tube.
- [Bruno Chiarellotto, Nobuo Tsuzuki, *Cohomological descent of rigid cohomology for étale coverings*](https://www.numdam.org/item/RSMUP_2003__109__63_0/), 2.9.1 Lemma, p. 84. Records exactness and faithfulness of restriction to the tube for coherent j†-modules, citing Berthelot (2.1.11).

### Coherent j†O-modules glue along finite open coverings of X

**Theorem.** Node `RD.3/coherent-j-dagger-gluing`.

Let X = X_1 ∪ … ∪ X_n be a finite open covering, j_i: X_i → Y the inclusions and j_i† the corresponding functors on ]Y[_P. (a) Given coherent (respectively locally free of finite rank) j_i†O_{]Y[}-modules E_i and isomorphisms j_{i′}†E_i ≅ j_i†E_{i′} satisfying the cocycle condition, there is a coherent (respectively locally free) j†O_{]Y[}-module E, unique up to unique isomorphism, with isomorphisms j_i†E ≅ E_i compatible with the given ones. (b) Given coherent E, F and maps φ_i: j_i†E → j_i†F with j_{i′}†φ_i = j_i†φ_{i′}, there is a unique φ: E → F with j_i†φ = φ_i. Hence X′ ↦ {coherent j_{X′}†O_{]Y[}-modules} is a stack for the Zariski topology on X (Y and P fixed).

**Hypotheses and scope.**

- The covering is finite; for a general Zariski covering of a quasi-compact X refine to a finite one.

**Proof or construction.**

1. By coherent-j-dagger-modules (b) each E_i is j_i†𝓮_i for a coherent 𝓮_i on a strict neighbourhood V_i of ]X_i[, and the gluing isomorphisms come from isomorphisms of models on strict neighbourhoods of ]X_i ∩ X_{i′}[ (Berthelot 96-03 (2.1.12), p. 58).
2. Shrink the V_i to standard neighbourhoods V^i_{λ,η} for a common pair of sequences; their union is the standard neighbourhood of ]X[ and they form an admissible covering of it (standard-strict-neighbourhoods (b), (d)); after shrinking once more the isomorphisms satisfy the cocycle condition on triple overlaps, so the 𝓮_i glue to a coherent 𝓮 on V and E = j†𝓮 works; uniqueness and (b) follow from the Hom formula and the Čech sequence of j-dagger-exactness-and-functoriality (d).

**Examples and acceptance.**

- Covering G_m ⊂ P^1 by the two opens obtained by removing 1 and −1 (p odd): a locally free module given on each piece and agreeing on the overlap glues to a locally free j†O-module.
- Degenerate case n = 1: the gluing datum is a single module and E = E_1.
- Morphisms: the identity maps on the pieces glue to the identity of E (uniqueness in (b)).

**Needs.** `RD.3/coherent-j-dagger-modules`, `RD.3/j-dagger-exactness-and-functoriality`, `RD.3/standard-strict-neighbourhoods`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.1.12) Proposition, p. 58. Proves that coherent and locally free j†O-modules, and their morphisms, glue along finite open coverings of X, so that they form a stack on Y in the X variable.

## 3. Overconvergent connections, gluing and the Zariski stack

Overconvergence of an integrable connection is a property, not extra data: the global Taylor isomorphism, when it exists, is unique and determined on the tube of X. It can be tested in coordinates by the decay of divided derivatives. With these facts the categories Isoc(X, Y/S) are defined without global frames, their realisations on arbitrary embeddings are canonical, and they form Zariski stacks; the independence theorems of the main document are proved in the corrections section below.

### Overconvergence of a connection is a property, local on P and on X, stable under subquotients

**Theorem.** Node `RD.3/overconvergence-is-a-property`.

Let (X, Y, P) be as in RD.3/j-dagger with a morphism P → S of formal O-schemes smooth on a neighbourhood of X, and let E be a coherent j†O_{]Y[}-module with an integrable connection ∇ relative to S_K. (a) (E, ∇) ≅ j†(𝓮, ∇_0) for a coherent O_V-module 𝓮 with integrable connection on some strict neighbourhood V; if S = Spf O then E is locally free of finite rank. (b) ∇ is overconvergent along Z = Y ∖ X — there is an isomorphism ε: p_2^*E ≅ p_1^*E of j†O_{]Y[_{P×_S P}}-modules inducing the Taylor isomorphisms ε_n modulo the (n+1)-st power of the diagonal ideal for all n — if and only if there is an isomorphism ε′: p_2^*𝓮 ≅ p_1^*𝓮 on a strict neighbourhood of ]X[_{P×P} in ]Y[_{P×P} inducing the Taylor isomorphisms of ∇_0. (c) If ∇ is overconvergent, ε is unique, is determined by its restriction to ]X[_{P×P}, and satisfies the cocycle condition on ]Y[_{P×P×P}; a j†O-linear map h: E → F between overconvergent modules is compatible with the ε if and only if h|_{]X[} is horizontal; a section s satisfies ε(p_2^*s) = p_1^*s if and only if s|_{]X[} is horizontal; coherent sub-j†O-modules stable under ∇ and the corresponding quotients are again overconvergent. (d) Overconvergence can be tested on an open covering of P and on a finite open covering of X. (e) Coherent j†O-modules with integrable overconvergent connection form an abelian category with ⊗ and internal Hom, the forgetful functor to coherent j†O-modules is exact, the category is a full subcategory of coherent j†O-modules with integrable connection, and restriction to ]X[ is an exact faithful functor to coherent O_{]X[}-modules with convergent integrable connection.

**Hypotheses and scope.**

- K has characteristic 0 (needed for (a) and for the description of connections by divided-power Taylor series).
- P → S is smooth only near X; by RD.3/j-dagger and the Jacobian criterion the smooth locus of P_K → S_K is a strict neighbourhood of ]X[.

**Proof or construction.**

1. (a): apply coherent-j-dagger-modules (b) to E and to the Taylor isomorphisms on the first-order neighbourhoods in the double and triple products; local freeness of a coherent module with connection in characteristic 0 is the classical argument (Berthelot 96-03 (2.2.3), p. 60).
2. (b): if ε′ exists, ε = j′†(ε′) using that j† commutes with the projections and the diagonal (j-dagger-exactness-and-functoriality (b)); conversely write ε = j′†(ε′) on a standard strict neighbourhood and show that ε′ induces the Taylor isomorphisms after shrinking: the kernel of restriction to ]X[ of sections of 𝓮 has support a closed analytic subset missing ]X[, avoided by U_η for η near 1 ((2.2.6), pp. 61–62).
3. (c): by faithfulness of restriction to the tube (coherent-j-dagger-modules (c)) reduce to Y = X; cover the closed tubes [X]_{P²,λ} by products W × D(0, λ^+)^m (weak fibration theorem, RD.3/weak-fibration-theorem), and use injectivity of M ⊗_A A{τ} → M ⊗_A A[[τ]] to see that ε is determined by its Taylor expansion; subobjects use flatness of the projections on the smooth locus, a strict neighbourhood ((2.2.1), pp. 58–59; (2.2.7), pp. 62–63).
4. (d): ε's obtained on an open covering of P glue by uniqueness ((2.2.8), p. 63); for a finite covering of X apply coherent-j-dagger-gluing (b) to the maps p_2^*E → p_1^*E ((2.2.11), pp. 63–64). (e) follows from (c), coherent-j-dagger-modules (a) and (c) ((2.2.9), (2.2.10), p. 63).

**Examples and acceptance.**

- Dwork: on (A^1_k, P^1_k, P̂^1_O) with K = ℚ_p(π), π^{p−1} = −p, the module j†O with ∇(1) = −π dt is overconvergent: its Taylor isomorphism is multiplication by exp(−π(t′ − t)), analytic on the strict neighbourhood |t′ − t| < 1 of the diagonal tube (Berthelot (2.2.15)(ii)(a), (1.2.4)(iv)).
- Non-example: j†O with ∇(1) = −dt on the same frame is not overconvergent, not even convergent: its Taylor series exp(−(t′ − t)) converges only for |t′ − t| < p^{−1/(p−1)} < 1.
- Subobjects: the image of a horizontal map between overconvergent modules is overconvergent by (c), so the category is abelian.

**Needs.** `RD.3/overconvergent-isocrystal`, `RD.3/weak-fibration-theorem`, `RD.3/coherent-j-dagger-modules`, `RD.3/coherent-j-dagger-gluing`, `RD.3/j-dagger-exactness-and-functoriality`, `AdicSpacesPartII:R0/affinoid-maximum-modulus`, `AdicSpacesPartII:R0/jacobian-criterion-closed-subspace`, `CrystallineCohomology:CR.1/integrable-connection`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.2.1)–(2.2.11) with the remark after (2.2.11), pp. 58–64. Defines overconvergent connections by the existence of the global Taylor isomorphism on the tube of Y in P×P, shows it is a property (unique, determined on the tube of X), local on P and on X, inherited by sub- and quotient objects, and that the category is abelian with ⊗ and internal Hom and a full subcategory of modules with connection.

### The coordinate criterion for convergence and overconvergence of a connection

**Theorem.** Node `RD.3/taylor-series-convergence-criterion`.

Assume P and S affine, Z = Y ∩ V(g) for one g ∈ Γ(P, O_P), and t_1, …, t_m ∈ Γ(P, O_P) such that dt_1, …, dt_m is a basis of Ω^1_{P/S} near X; on a strict neighbourhood of ]X[ these give a basis of Ω^1_{P_K/S_K} with dual derivations ∂_1, …, ∂_m. Let (𝓮, ∇_0) be a coherent module with integrable connection on a strict neighbourhood V and (E, ∇) = j†(𝓮, ∇_0); write ∂^{[k]} = ∂^k / k! for multi-indices k, and U_η = {x ∈ P_K : |g(x)| ≥ η}. Then ∇ is overconvergent if and only if for every λ < 1 in |K^×|^ℚ there is η < 1 in |K^×|^ℚ with [Y]_λ ∩ U_η ⊆ V such that ‖∂^{[k]} e‖ λ^{|k|} → 0 as |k| → ∞ for every e ∈ Γ([Y]_λ ∩ U_η, 𝓮), for a (any) Banach norm on this finite module over an affinoid algebra. When Z = ∅ (X closed in P), a connection on a coherent O_{]X[}-module is convergent if and only if ‖∂^{[k]} e‖ λ^{|k|} → 0 for every λ < 1 and every e ∈ Γ([X]_λ, 𝓮).

**Hypotheses and scope.**

- Divided powers ∂^k/k! need characteristic 0.
- The criterion is coordinate-dependent in form but the conclusion is not; any other étale coordinates give the same answer (Guo–Reinecke, Remark 2.13).

**Proof or construction.**

1. Necessity: by overconvergence-is-a-property (b), ε = j′†(ε′) on a strict neighbourhood V′ ⊇ V_{λη} := [Y]_{P²,λ} ∩ p_1^{-1}(U_η); on [Y]_{P²,λ} the conditions |1 ⊗ g| ≥ η and |g ⊗ 1| ≥ η agree for η > λ. By Berthelot's remark (1.3.8)(ii) (strong fibration theorem applied to p_1), V_{λη} ≅ ([Y]_λ ∩ U_η) × D(0, λ^+)^m with coordinates τ_i = 1 ⊗ t_i − t_i ⊗ 1 (Berthelot 96-03 (2.2.13), pp. 64–65).
2. Expanding θ(e) = ε′(p_2^*e) = Σ_k θ_k(e) ⊗ τ^k with ‖θ_k(e)‖ λ^{|k|} → 0 (Lemma (2.2.12): finite modules over A{τ} expand uniquely in τ-series), compatibility of ε′ with the Taylor isomorphisms modulo the powers of the diagonal forces θ_k(e) = ∂^{[k]} e ((2.2.4.1)).
3. Sufficiency: for a sequence λ_i → 1 and corresponding η_i, define θ(e) = Σ_k ∂^{[k]} e ⊗ τ^k on V_{λ_i η_i}; it is semilinear, so gives a linear map p_2^*𝓮 → p_1^*𝓮 inducing the Taylor isomorphisms, with inverse Σ_k (−1)^{|k|} τ^k ⊗ ∂^{[k]} e; these glue by the uniqueness argument of overconvergence-is-a-property (c) to an isomorphism on the standard strict neighbourhood V_{λ,η} ((2.2.13)(ii), p. 66). The case Z = ∅ is (2.2.14).

**Examples and acceptance.**

- Dwork: for ∇(1) = −π dt on A^1 ⊂ P^1 (K = ℚ_p(π), π^{p−1} = −p), on the chart Spf O⟨t⟩, where Z is empty, ∂^{[k]}1 = (−π)^k/k! has absolute value p^{−s_p(k)/(p−1)} ≤ 1 (s_p the digit sum), so the connection is convergent there. Overconvergence along ∞ is checked on the chart Spf O⟨s⟩, s = 1/t, with g = s and U_η ∩ [Y]_λ = {η ≤ |s| ≤ 1}: there ∇(1) = π s^{−2} ds, the Taylor series of 1 is exp(π τ/(s(s + τ))) with τ = s′ − s, and expanding π τ/(s(s + τ)) = (π/s²) Σ_{j≥0} (−1)^j τ^{j+1}/s^j and using |π^n/n!| ≤ 1 gives ‖∂_s^{[k]}1‖ ≤ η^{−2k} on that annulus; so ‖∂_s^{[k]}1‖ λ^k → 0 once η² > λ, and the connection is overconvergent. Computing only on the chart at 0, where Z is empty, would test convergence and not overconvergence.
- Kummer: for ∇(1) = a dt/t on G_m ⊂ P^1 with a ∈ ℤ_p, ∂^{[k]}1 = binom(a, k) t^{−k} with |binom(a, k)| ≤ 1, so on {η ≤ |t| ≤ 1/η} the norms are ≤ η^{−k} and λ^k η^{−k} → 0 for η > λ: overconvergent.
- Non-examples: for ∇(1) = −dt, ‖∂^{[k]}1‖ = |1/k!| = p^{v_p(k!)} and λ^k p^{v_p(k!)} → ∞ for λ > p^{−1/(p−1)}; for a = 1/p in the Kummer example |binom(1/p, k)| = p^{k + v_p(k!)} is unbounded, so neither is even convergent.

**Needs.** `RD.3/overconvergence-is-a-property`, `RD.3/strong-fibration-theorem`, `RD.3/standard-strict-neighbourhoods`, `AdicSpacesPartII:R3/tate-kiehl-affinoid`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.2.12)–(2.2.14) and Exemples (2.2.15), pp. 64–67. Proves that, in coordinates, overconvergence is equivalent to the decay of the divided-power derivatives of sections on the sets [Y]_λ ∩ U_η, and convergence to the same decay on the closed tubes [X]_λ; gives the Dwork and Kummer examples.
- [Haoyang Guo, Emanuel Reinecke, *A prismatic approach to crystalline local systems*](https://arxiv.org/abs/2203.09490v3), Definition 2.12 and Remark 2.13, p. 15. Uses the convergent case of the criterion (cited to Berthelot's Corollary 2.2.14) as the definition of a convergent connection on the generic fibre of an affine smooth formal scheme over W(k), and notes its independence of the coordinates.

### Overconvergent isocrystals without a global frame: gluing, realisations and pullback

**Construction.** Node `RD.3/isocrystals-glued-from-local-frames`. Proposed namespace `TauCeti.RigidCohomology`, module `TauCeti/RigidCohomology/Isocrystals/Overconvergent`.

Let X ⊆ Y be an open immersion of k-schemes of finite type over a formal O-scheme S of finite type. Choose a finite open covering (Y_α) of Y and closed immersions Y_α → P_α into formal S-schemes smooth near X_α = X ∩ Y_α; put Y_{αβ} = Y_α ∩ Y_β embedded diagonally in P_{αβ} = P_α ×_S P_β, with projections p_{αβ}, q_{αβ}. The category Isoc(X, Y/S) consists of families (E_α, φ_{αβ}) with E_α a coherent j†O_{]Y_α[}-module with integrable overconvergent connection and φ_{αβ}: p_{αβ,K}^* E_α ≅ q_{αβ,K}^* E_β horizontal isomorphisms on ]Y_{αβ}[_{P_{αβ}} satisfying the cocycle condition on ]Y_{αβγ}[_{P_α×P_β×P_γ}; morphisms are compatible families. (a) Up to canonical equivalence it does not depend on the covering or on the P_α, and equals Isoc(X, Y, P/S) when a global P exists. (b) For any immersion of an open U ⊆ Y into a formal S-scheme T (not necessarily smooth), each E has a realisation E_T on ]U[_T: locally E_T = u_K^* E_P for an S-morphism u: T → P to a smooth embedding of U restricting to the identity on U, independent of P and u up to canonical isomorphism, with canonical horizontal transition isomorphisms u_K^* E_T ≅ E_{T′} for S-morphisms u: T′ → T, satisfying transitivity. (c) For a commutative diagram (X′ ⊆ Y′ over S′) → (X ⊆ Y over S) given by v: Y′ → Y over S′ → S, there is a pullback functor v^*: Isoc(X, Y/S) → Isoc(X′, Y′/S′), realised by u_K^* for any lift u of v between embeddings, independent of u up to canonical isomorphism, with (v ∘ v′)^* ≅ v′^* ∘ v^* canonically.

**Hypotheses and scope.**

- Frames exist locally: every affine open of Y embeds as a closed subscheme of a formal affine space over S, which is smooth.
- In (b) for O a discrete valuation ring, T may be any formal S-scheme in which U is defined by an ideal of definition (Berthelot (2.3.2)(ii), last paragraph): the lift u: T → P is built successively on the thickenings Spec O_T/𝓲^{i+1} by formal smoothness of P.

**API.**

- `IsocDagger.ofGluingData` (constructor): An object of Isoc(X, Y/S) from overconvergent modules E_α on local frames and horizontal transition isomorphisms φ_{αβ} satisfying the cocycle condition.
- `IsocDagger.realisation` (projection): The realisation E_T, a coherent j†O_{]U[_T}-module with integrable connection, for an immersion of an open U ⊆ Y into a formal S-scheme T.
- `IsocDagger.realisation_transition` (relation): For u: T′ → T compatible with the immersions, a horizontal isomorphism u_K^* E_T ≅ E_{T′}, transitive for composable u.
- `IsocDagger.gluing_equivalence` (equivalence): Changing the covering or the local embeddings gives a canonical equivalence of gluing categories, compatible with realisations.
- `IsocDagger.ofFrame_equivalence` (compatibility): When a global frame (X, Y, P) exists, the gluing category is canonically equivalent to Isoc(X, Y, P/S) of RD.3/overconvergent-isocrystal.
- `IsocDagger.pullback` (functoriality): The pullback v^* along v: (X′ ⊆ Y′/S′) → (X ⊆ Y/S), realised by u_K^* for any lift u.
- `IsocDagger.pullback_comp` (functoriality): Canonical isomorphisms (v ∘ v′)^* ≅ v′^* ∘ v^* and id^* ≅ id, satisfying the usual coherence.
- `IsocDagger.horizontalSections` (projection): The module Γ((X, Y)/S, E) of horizontal sections, independent of the realisation used to compute it.

**Checks.**

- `IsocDagger.gluing_globalFrame` (compatibility): For Y = P^1_k with its two standard affine charts and X = G_m, the gluing category is equivalent to Isoc(G_m, P^1_k, P̂^1_O/K).
- `IsocDagger.gluing_single` (degenerate): For the covering of Y by Y itself with one embedding P, the forgetful functor (E, φ) ↦ E is an isomorphism of categories onto Isoc(X, Y, P/S): the cocycle condition forces φ to restrict to the identity on the diagonal, and a horizontal isomorphism with that restriction is the Taylor isomorphism ε (overconvergence-is-a-property (c)); a datum with φ ≠ ε does not exist.
- `IsocDagger.realisation_product` (computation): For T = P ×_O Spf O⟨s⟩ with U = Y embedded by s = 0 and the projection u: T → P, the realisation E_T is u_K^* E_P, the pullback to the product with the open unit disc.
- `IsocDagger.gluing_cocycle_needed` (non-example): On a covering by three opens, constant rank-one transition scalars c_{αβ} with c_{αβ} c_{βγ} c_{γα} ≠ 1 on the triple overlap do not form a gluing datum.

**Uses.**

- RD.3/overconvergent-isocrystals-of-a-variety: defines Isoc†(X ⊂ Y/K) when Y has no global embedding, by gluing along local frames
- Étesse 2002, proof of Théorème 1, pp. 593–595: the étale descent theorem glues local overconvergent F-isocrystals built on charts with no global embedding, citing Berthelot (2.3.2)(iii)
- Kedlaya, Notes on isocrystals, Definitions 2.4 and 2.7, pp. 3–4: extends the affine construction to arbitrary open immersions X → Y using the stack property
- PadicDifferentialEquationsAndRigidCohomology:RD.4: rigid cohomology with coefficients is computed from realisations on local frames and Čech gluing

**Proof or construction.**

1. Independence of P on a fixed covering: two choices P_α, P′_α are compared through the diagonal embedding into P_α ×_S P′_α and the equivalences of RD.3/independence-of-frame along the two projections; the transition data match because the canonical isomorphisms of RD.3/taylor-comparison-of-pullbacks satisfy the transitivity relation (Berthelot 96-03 (2.2.17.3), (2.3.2)(i), pp. 67–70).
2. Independence of the covering (left to the reader by Berthelot, (2.3.2)(iii), p. 71; supplied here): given two coverings with embeddings, pass to the common refinement Y_α ∩ Y′_β embedded in P_α ×_S P′_β; restriction along the two projections gives equivalences from each gluing category to the refined one, because on each piece they are the equivalences of RD.3/independence-of-frame, and the cocycle data correspond since the Taylor isomorphism of an overconvergent module is unique (overconvergence-is-a-property (c)) and the comparison isomorphisms are transitive. Refining twice gives the compatibility needed for a canonical equivalence.
3. Realisations: choose locally a closed immersion of U into a smooth formal S-scheme P and lift U → P to u: T → P by formal smoothness on the nilpotent thickenings; set E_T = u_K^* E_P; two choices (P, u), (P′, u′) are compared through P ×_S P′ and RD.3/taylor-comparison-of-pullbacks, which yields independence and the transition isomorphisms ((2.3.2)(ii), (2.3.2.1), pp. 70–71).
4. Pullback: if v extends to u: P′ → P use u_K^*; otherwise replace P′ by P ×_S P′ with the graph embedding, whose projection to P extends v; canonicity again comes from RD.3/taylor-comparison-of-pullbacks ((2.3.2)(iv), pp. 71–72).

**Examples and acceptance.**

- Global frame: for Y = P^1_k covered by its two standard affine lines embedded in Â^1_O, and X = G_m, the gluing category is canonically equivalent to Isoc(G_m, P^1, P̂^1/K) defined with the global frame.
- Cocycle condition matters: on a covering of Y by three opens, rank-one data with constant transition scalars c_{αβ} ∈ K^× whose product c_{αβ} c_{βγ} c_{γα} on the triple overlap is ≠ 1 do not define an object.

**Needs.** `RD.3/independence-of-frame`, `RD.3/taylor-comparison-of-pullbacks`, `RD.3/frame-pullback-functor`, `RD.3/overconvergence-is-a-property`, `RD.3/coherent-j-dagger-gluing`, `RD.3/frame`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.3.2)(i)–(iv) and (2.2.17), pp. 67–72. Defines Isoc(X, Y/S) via a smooth embedding, the realisations E_T on arbitrary embeddings with transition isomorphisms, the gluing definition when no global embedding exists (independence of choices left to the reader), and the pullback functors with their compatibility with composition.

### Overconvergent and convergent (F-)isocrystals form Zariski stacks

**Theorem.** Node `RD.3/zariski-stack-of-overconvergent-isocrystals`.

(a) For fixed Y over S, the assignment of Isoc(X, Y/S) to each open X ⊆ Y, with restriction given by pullback, is a stack for the Zariski topology: for a finite open covering X = ⋃ X_i, objects of Isoc(X, Y/S) are equivalent to objects of the Isoc(X_i, Y/S) with gluing isomorphisms on the X_i ∩ X_j satisfying the cocycle condition, and morphisms glue uniquely. (b) The assignment X ↦ Isoc(X/S) of convergent isocrystals is a Zariski stack on X. (c) With a Frobenius lift σ on K, the same holds for the categories of overconvergent and convergent F^a-isocrystals. (d) Realisations, ⊗, internal Hom and pullback commute with restriction to opens.

**Hypotheses and scope.**

- Coverings are finite (Y quasi-compact); Zariski, not étale: étale descent is etale-descent-of-overconvergent-f-isocrystals and needs X smooth and Frobenius structures.

**Proof or construction.**

1. (a): overconvergence is local on X (overconvergence-is-a-property (d)) and coherent j†O-modules with their morphisms glue along finite coverings of X (coherent-j-dagger-gluing); apply this to the module and to the maps p_2^*E → p_1^*E (Berthelot 96-03, remark after (2.2.11), p. 64, and (2.3.3)(i), p. 72).
2. (b): for an open covering (X_α) of X the tubes ]X_α[ form an admissible covering of ]X[, so coherent modules with convergent connection glue ((2.3.3)(i)).
3. (c): Frobenius structures are isomorphisms in the stack and glue with the objects; Étesse uses this as the Zariski locality of F^a-Isoc†(X/K), citing Berthelot (2.1.12), (2.2.11), (2.3.7).

**Examples and acceptance.**

- Two opens: an overconvergent isocrystal on G_m ⊂ P^1 is the same as isocrystals on G_m ∖ {1} and G_m ∖ {−1} (p odd) with a gluing isomorphism on G_m ∖ {±1}.
- Degenerate case: the trivial covering gives back Isoc(X, Y/S).
- Boundary: the stack is in the X-variable with Y fixed; changing Y is governed by RD.3/independence-of-compactification.

**Needs.** `RD.3/coherent-j-dagger-gluing`, `RD.3/overconvergence-is-a-property`, `RD.3/isocrystals-glued-from-local-frames`, `RD.3/overconvergent-isocrystal`, `RD.3/overconvergent-f-isocrystal`, `AdicSpacesPartII:R2/tube`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.2.11) with its remark, p. 64; (2.3.3)(i), p. 72. States that coherent j†O-modules with integrable overconvergent connection, and isocrystals overconvergent along Y − X, form a stack on Y in the variable X, and that convergent isocrystals form a stack because the tubes of an open covering form an admissible covering.
- [Jean-Yves Étesse, *Descente étale des F-isocristaux surconvergents et rationalité des fonctions L de schémas abéliens*](http://www.numdam.org/item/ASENS_2002_4_35_4_575_0/), Part II, introductory paragraph, p. 592. Records that F^a-Isoc†(X/K) is local for the Zariski topology on X, citing Berthelot (2.1.12), (2.2.11), (2.3.7).

## 4. Smooth affines: Monsky–Washnitzer algebras and Frobenius

On a smooth affine X with a smooth lift A, the strict neighbourhoods of the tube in the projective closure are the intersections with closed balls of radius > 1, and global sections identify coherent j†O-modules with finite modules over the dagger algebra A†_K. The convergence condition on the Taylor series is extra data in general, but a Frobenius structure forces it: this is the theorem that makes (σ,∇)-modules a model for overconvergent F-isocrystals (`RD.3/affine-smooth-description-of-overconvergent-f-isocrystals`).

### Monsky–Washnitzer algebras are henselian along π; lifting of étale algebras and descent of projective modules

**Lemma.** Node `RD.3/weak-completion-henselian-descent`.

Let A be a finitely generated O-algebra (O a complete discrete valuation ring with uniformiser π) with weak completion A†, π-adic completion Â, and A_0 = A/πA. (1) (Spec A†, Spec A_0) is a henselian pair, and A† → Â is faithfully flat and formally étale for the π-adic topology. (2) Every smooth (respectively étale, finite étale) A_0-algebra B_0 lifts to a smooth (respectively étale, finite étale) A†-algebra B, and sections lift. (3) Every finitely generated projective Â_K-module (Â_K = Â ⊗ K) is isomorphic to M ⊗_{A†_K} Â_K for a finitely generated projective A†_K-module M, and two such M with isomorphic base changes are isomorphic.

**Hypotheses and scope.**

- A† is weakly complete of finite type (always the case for the weak completion of a finitely generated algebra); A is Noetherian.

**Proof or construction.**

1. (1): A† is Noetherian with π in its radical and A† → Â is faithfully flat (Monsky–Washnitzer); A†/π^n = Â/π^n gives formal étaleness; for a finite A†-algebra B, idempotents of B/πB lift to B because they lift to B̂ and B → B̂ is faithfully flat with B weakly complete (Monsky–Washnitzer, Theorem 3.8), which is the henselian property (Étesse, Padova 2002, Proposition 2 and Théorème 3, pp. 113–115).
2. (2): Elkik, Théorème 6, p. 580: over a noetherian henselian pair (A, J) every smooth A/J-algebra lifts to a smooth A-algebra; the proof reduces to relative complete intersections through the symmetric algebra of the conormal module and lifts sections over the henselian pair (SchemeAndStackFoundations:SF.0/henselian-smooth-lifting). Applied to (A†, πA†), which is noetherian and henselian by (1), it gives the smooth case; the étale and finite étale refinements and the lifting of sections are Étesse, Padova 2002, Théorème 4, pp. 116–117, whose proof cites Elkik's Théorème 6 (finite étale algebras also follow from SchemeAndStackFoundations:SF.0/henselian-finite-etale-equivalence).
3. (3): Elkik's Théorème 3 (p. 569): over a henselian pair (A, J), a finitely generated Â-module locally free outside V(J) comes from a finitely generated A-module locally free outside V(J); Corollaire 1 and the following Lemme (p. 573) give the statement for locally free modules on Spec Â ∖ V(J) and uniqueness of isomorphism classes. With J = πA† this is (3) (Étesse 2002, Proposition 6 and Corollaire 1, p. 586).

**Examples and acceptance.**

- A = O[t]: A† = O⟨t⟩†, and a projective K⟨t⟩-module of rank one (necessarily free, K⟨t⟩ being a principal ideal domain) descends to the free module of rank one over K⟨t⟩†.
- Henselian property on a finite étale algebra: for p odd, the idempotents of O⟨t⟩†[s]/(s² − (1 + πt)) modulo π (where the algebra splits as k[t] × k[t]) lift to idempotents, since 1 + πt has a square root in O⟨t⟩† given by the binomial series.
- Non-example: the polynomial ring O[t] itself is not henselian along π: 1 + πt has no square root in O[t].

**Needs.** `AdicSpacesPartII:F1/weak-completion`, `AdicSpacesPartII:F1/weak-completion-universal-property`, `AdicSpacesPartII:F1/dagger-completion-comparison`, `SchemeAndStackFoundations:SF.0/henselian-pair-characterisations`, `SchemeAndStackFoundations:SF.0/henselian-smooth-lifting`, `PerfectoidSpaces:P3/elkik-noetherian-henselian-approximation`.

**Sources.**

- [Jean-Yves Étesse, *Relèvement de schémas et algèbres de Monsky–Washnitzer : théorèmes d'équivalences et de pleine fidélité*](http://www.numdam.org/item/RSMUP_2002__107__111_0/), Proposition 2 and Théorème 3, pp. 113–115; Théorème 4, pp. 116–117. Proves that weakly complete finitely generated algebras form henselian pairs with their reductions, with faithful flatness and formal étaleness of the completion, and lifts smooth, étale and finite étale algebras.
- [Renée Elkik, *Solutions d'équations à coefficients dans un anneau hensélien*](http://www.numdam.org/item/ASENS_1973_4_6_4_553_0/), Théorème 3, p. 569; Corollaire 1 and Lemme, p. 573; Théorème 6, p. 580. Descends finitely generated modules over the completion of a henselian pair, locally free outside the closed subset, to the pair itself, and shows uniqueness of locally free modules on the complement. Théorème 6 lifts smooth algebras over the reduction of a noetherian henselian pair to smooth algebras over the pair.
- [Jean-Yves Étesse, *Descente étale des F-isocristaux surconvergents et rationalité des fonctions L de schémas abéliens*](http://www.numdam.org/item/ASENS_2002_4_35_4_575_0/), Proposition 6 and Corollaires 1–2, p. 586. Applies Elkik's theorem to descend finitely generated projective Â_K-modules and their direct sum decompositions to A†_K.

### On the Monsky–Washnitzer frame of a smooth affine, global sections give an equivalence with A†_K-modules

**Theorem.** Node `RD.3/affine-frame-global-sections-equivalence`.

Let X = Spec A_0 be a smooth affine k-scheme, A a smooth O-algebra lifting A_0 with a presentation A ≅ O[t_1, …, t_n]/I, 𝔛 = Spec A, P the formal completion of the closure of 𝔛 in P^n_O and Y its special fibre. Then ]Y[_P = P_K, the intersections U_η of 𝔛_K^an with the closed balls of radius 1/η > 1 form a fundamental system of affinoid strict neighbourhoods of ]X[_P, and Γ(P_K, j†O) = colim_η Γ(U_η, O) ≅ A† ⊗_O K =: A†_K, the generic fibre of the weak completion. The functor Γ(𝔛_K^an, −) = Γ(P_K, −) induces equivalences (i) from coherent j†O_{P_K}-modules to finitely generated A†_K-modules, locally free ones corresponding to projective ones; (ii) from coherent j†O-modules with integrable connection to finitely generated projective A†_K-modules M with integrable connection M → M ⊗_{A†_K} Ω^1_{A†_K} (Ω^1 in the sense of Monsky–Washnitzer); and (iii) from Isoc†(X/K) to those (M, ∇) whose Taylor series converges on a strict neighbourhood of the tube of the diagonal in 𝔛_K^an × 𝔛_K^an, for instance inside {|t_{2,i} − t_{1,i}| < 1 for all i}.

**Hypotheses and scope.**

- A smooth lift A exists (Elkik) and its weak completion is a dagger algebra of Monsky–Washnitzer type (AdicSpacesPartII:F1/mw-lift-existence-uniqueness).
- Without Frobenius, the convergence condition in (iii) is genuine extra data (see the non-example).

**Proof or construction.**

1. The strict neighbourhoods: Berthelot 96-03 (1.2.4)(iii)–(iv) shows that in projective space the sets U_η = {x ∈ ]Y[ : |t_i(x)| ≤ 1/η} form a fundamental system; the restriction map from Γ(U_η, O) to Γ(]X[, O) = Â ⊗ K lands in A† ⊗ K by the growth description of A† (Berthelot (2.1.2.2)), and the colimit is A†_K ((2.1.2), (2.1.2.4), pp. 49–50).
2. (i): by coherent-j-dagger-modules (b) a coherent j†O-module is j†𝓮 with 𝓮 coherent on an affinoid U_η, i.e. a finite Γ(U_η, O)-module (Kiehl), and passing to the colimit gives a finite A†_K-module M = Γ(P_K, E) = Γ(U_η, E); locally free corresponds to projective ((2.5.2), pp. 82–83).
3. (ii): Γ(P_K, j†Ω^1) = colim Γ(U_η, Ω^1) = Ω^1_{A†} ⊗ K, so connections correspond, using overconvergence-is-a-property (a) for local freeness; (iii): overconvergence-is-a-property (b) with the explicit strict neighbourhood of the diagonal tube from (1.2.4)(iv) (remark after (2.5.2), p. 83).

**Examples and acceptance.**

- Affine space: for A = O[t_1, …, t_n], A†_K = K⟨t_1, …, t_n⟩†; the rank-one module with ∇(1) = −π dt_1 (Dwork) satisfies (iii).
- Non-example: the A†_K-module A†_K with ∇(1) = −dt on A^1 is a projective module with integrable connection, so an object of (ii), but not of (iii): its Taylor series does not converge on |t_2 − t_1| < 1.
- Degenerate case n = 0: X = Spec k, A†_K = K and both sides are finite-dimensional K-vector spaces.

**Needs.** `RD.3/overconvergent-sections-of-affine-frame`, `RD.3/coherent-j-dagger-modules`, `RD.3/overconvergence-is-a-property`, `RD.3/standard-strict-neighbourhoods`, `AdicSpacesPartII:F1/weak-completion`, `AdicSpacesPartII:F1/weak-completion-generic-fibre`, `AdicSpacesPartII:F1/mw-type-dagger-algebra`, `AdicSpacesPartII:F1/mw-lift-existence-uniqueness`, `AdicSpacesPartII:F1/dagger-differentials`, `AdicSpacesPartII:R3/tate-kiehl-affinoid`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.1.2), (2.1.2.4), pp. 49–50; (2.5.1)–(2.5.2) with the remark after it, pp. 81–83. Identifies the overconvergent functions on the Monsky–Washnitzer frame with the weak completion, and proves that global sections give equivalences from coherent j†O-modules, modules with connection and overconvergent isocrystals to finitely generated (projective) A†_K-modules, with connection, whose Taylor series converges on a strict neighbourhood of the diagonal.
- [Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*](https://arxiv.org/abs/math/0208027v6), Remark 4.2.5, p. 26. States the resulting equivalence between overconvergent F-isocrystals on a smooth affine and (σ,∇)-modules over the dagger algebra, attributing the automatic convergence to Berthelot's Théorème 2.5.7 (cited there as [Be4]).

### Pullback along a lift of a morphism of smooth affines realises the pullback of overconvergent isocrystals

**Theorem.** Node `RD.3/mw-pullback-realises-frame-pullback`.

Let w: X′ = Spec A′_0 → X = Spec A_0 be a morphism of smooth affine k-schemes, A, A′ smooth O-algebras lifting A_0, A′_0, and ψ: A† → A′† an O-algebra map between weak completions lifting w (it exists). Under the equivalences of affine-frame-global-sections-equivalence, the base-change functor ψ_K^* from A†_K-modules with integrable connection to A′†_K-modules with integrable connection preserves the convergence condition (iii), and its restriction to Isoc†(X/K) is canonically isomorphic to w^*: Isoc†(X/K) → Isoc†(X′/K). In particular two lifts ψ, ψ′ of w give canonically isomorphic functors, and the identification is compatible with composition. More generally, for immersions X → T, X′ → T′ into separated O-schemes of finite type smooth near X, X′, any morphism u′ from a strict neighbourhood of ]X′[_{T′} to T_K^an extending the map of tubes induced by a formal lift of w realises w^* on overconvergent isocrystals.

**Hypotheses and scope.**

- The lift ψ exists by the lifting property of weak completions (van der Put, Theorem 2.4.4; AdicSpacesPartII:F1/mw-morphism-lifting); it is not unique.

**Proof or construction.**

1. Bounds: for f ∈ A† and ρ > 1 there is η > 1 such that f extends to the affinoid U_η with sup norm ≤ ρ; hence ψ extends to morphisms U′_{η′} → U_η of strict neighbourhoods (Berthelot 96-03 (2.5.3), pp. 83–84).
2. A morphism u′ from a strict neighbourhood extending a map of tubes sends some strict neighbourhood into ]Y[ and pulls strict neighbourhoods back to strict neighbourhoods, by the maximum principle ((2.5.4), pp. 84–85).
3. Compare u′^* with w^* using the graph embedding X′ → P′ × P: u′ gives a section of the projection on a strict neighbourhood, and the projection induces an equivalence by RD.3/independence-of-compactification; composing shows that u′^* preserves overconvergence and is canonically isomorphic to w^* ((2.5.5)–(2.5.6), pp. 85–86).

**Examples and acceptance.**

- Frobenius: for a Frobenius lift F: A† → A† over σ, F_K^* realises the Frobenius pullback F^* on Isoc†(X/K); two Frobenius lifts give canonically isomorphic functors through the Taylor series of RD.0/change-of-frobenius-lift-taylor-formula.
- Identity: ψ = id gives the identity functor (degenerate case).
- Translation on A^1: ψ(t) = t + 1 lifts translation by 1 on A^1_k; it carries the Dwork module (K⟨t⟩†, ∇(1) = −π dt) to itself, because d(t + 1) = dt, so translation preserves the Dwork isocrystal.

**Needs.** `RD.3/affine-frame-global-sections-equivalence`, `RD.3/isocrystals-glued-from-local-frames`, `RD.3/independence-of-compactification`, `RD.3/standard-strict-neighbourhoods`, `AdicSpacesPartII:F1/mw-morphism-lifting`, `AdicSpacesPartII:R0/affinoid-maximum-modulus`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.5.3)–(2.5.6), pp. 83–86. Proves the norm estimates for elements of weak completions, the extension of morphisms to strict neighbourhoods, and that the base change along a lift of a morphism of smooth affines preserves overconvergence and is canonically isomorphic to the pullback of overconvergent isocrystals.

### Dwork–Berthelot: a Frobenius structure forces overconvergence

**Theorem.** Node `RD.3/frobenius-structure-forces-overconvergence`.

In the setting of affine-frame-global-sections-equivalence, let σ be an automorphism of O lifting a power of the Frobenius of k, F: A† → A† a lift of the corresponding Frobenius of A_0 over σ, and (M, ∇) a finitely generated A†_K-module with integrable connection admitting a horizontal isomorphism Φ: (F^*M, F^*∇) ≅ (M, ∇). Then the coherent j†O-module with connection corresponding to (M, ∇) is overconvergent. Consequently (Berthelot's Corollary 2.5.8) the category of overconvergent F-isocrystals on X is equivalent to the category of finitely generated (necessarily projective) A†_K-modules with integrable connection and horizontal Frobenius isomorphism, i.e. (σ, ∇)-modules over A†_K, and the equivalence is functorial in A by mw-pullback-realises-frame-pullback.

**Hypotheses and scope.**

- Frobenius is an isomorphism Φ: F^*M → M; a mere horizontal map would not suffice for the radius-extension argument.
- No condition on ∇ beyond integrability is assumed: convergence near the diagonal and then overconvergence are both consequences.

**Proof or construction.**

1. Localise on X (overconvergence is local, overconvergence-is-a-property (d)) so that Ω^1_{A†} is free on dz_1, …, dz_m; with F(z_i) = z_i^q + π g_i one has dF(dz_i) ∈ π Ω^1. If the connection matrices on generators have entries in π^{−r} A†, the matrices for the generators 1 ⊗ e_i of F^*M have entries in π^{−r+1} A†; transporting by Φ and iterating gives generators whose connection matrices have entries in A† (Berthelot 96-03, proof of (2.5.7), pp. 86–87).
2. With integral connection matrices, for every ρ > 1 there is η_0 > 1 with ‖∂^k e‖_{η_0} ≤ ρ^{|k|} ‖e‖_{η_0} (norm estimates of mw-pullback-realises-frame-pullback); choosing λ_0′ < p^{−1/(p−1)}/ρ gives convergence of the Taylor series on V_{λ_0 η_0} = {|τ_j| ≤ λ_0} ∩ U′_{η_0} (taylor-series-convergence-criterion).
3. Dwork's trick: with |π| < ϱ < 1 set λ_{n+1} = min(λ_n^{1/q}, λ_n/ϱ) → 1; choose η_{n+1} so that F × F maps V_{λ_{n+1} η_{n+1}} into V_{λ_n η_n} (using F(t_j) = t_j^q + π a_j and (F ⊗ F)(τ_j) = τ_j^q + π γ_j with γ_j in the diagonal ideal); extend ε inductively by p_1^*(Φ) ∘ (F×F)^*(ε) ∘ p_2^*(Φ)^{−1}, the extensions agreeing on overlaps because Φ is horizontal. The union of the V_{λ_n η_n} is a strict neighbourhood of the diagonal tube ((2.5.7), pp. 87–89).
4. The corollary combines this with affine-frame-global-sections-equivalence (iii) and the functoriality of mw-pullback-realises-frame-pullback ((2.5.8), p. 89).

**Examples and acceptance.**

- Dwork F-isocrystal: on A^1 with K = ℚ_p(π), σ = id, F(t) = t^p, the module (K⟨t⟩†, ∇(1) = −π dt) with Φ = multiplication by exp π(t − t^p) (a series of radius p^{(p−1)/p²} > 1) is a (σ,∇)-module, hence an overconvergent F-isocrystal (Berthelot (2.3.8)(ii)).
- Kummer: on G_m with F(t) = t^p, the rank-one module with ∇(1) = a dt/t has a Frobenius structure if and only if a = m/(p − 1) with m ∈ ℤ, given by multiplication by t^m (Berthelot (2.3.8)(iii)); it is overconvergent for every a ∈ ℤ_p, so Frobenius is sufficient but not necessary for overconvergence.
- Non-example: (K⟨t⟩†, ∇(1) = −dt) admits no Frobenius structure, consistently with its failure to be even convergent.

**Needs.** `RD.3/affine-frame-global-sections-equivalence`, `RD.3/taylor-series-convergence-criterion`, `RD.3/overconvergence-is-a-property`, `RD.3/mw-pullback-realises-frame-pullback`, `RD.3/standard-strict-neighbourhoods`, `RD.0/frobenius-lift-on-dagger-algebra`, `RD.3/sigma-nabla-module-over-dagger-algebra`, `AdicSpacesPartII:F1/weak-completion`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.5.7) Théorème with its proof and (2.5.8) Corollaire, pp. 86–89. Proves that a horizontal Frobenius isomorphism on a module with connection over the weak completion forces the overconvergence of the connection, by first making the connection matrices integral and then extending the Taylor isomorphism outward with Dwork's Frobenius trick, and deduces the Monsky–Washnitzer description of overconvergent F-isocrystals on a smooth affine.
- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.3.8)(ii)–(iii), pp. 76–77. Gives the Dwork F-isocrystal (Frobenius exp π(t − t^p)) and the criterion a = m/(p−1) for a Frobenius structure on the Kummer isocrystal.
- [Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*](https://arxiv.org/abs/math/0208027v6), Remark 4.2.5, p. 26. Quotes this theorem as the reason the convergence condition is automatic for (σ,∇)-modules over a dagger algebra of MW type.

### Étale maps of smooth affines lift uniquely to weak completions, with Frobenius and differentials

**Lemma.** Node `RD.3/finite-etale-lifting-of-mw-algebras`.

Let A_0 be a smooth k-algebra with a smooth lift A and weak completion A†, and A_0 → B_0 an étale morphism. (a) There is an étale A†-algebra B lifting B_0, unique up to unique isomorphism, whose weak completion B† is flat and formally étale over A† for the π-adic topology, with Ω^1_{A†} ⊗_{A†} B† ≅ Ω^1_{B†} and Ω^1_{A†} ⊗ B̂ ≅ Ω^1_{B̂}. (b) A Frobenius lift F_{A†} over σ extends uniquely to a Frobenius lift F_{B†} compatible with it: the relative Frobenius B_0 ⊗_{A_0, F} A_0 → B_0 is an isomorphism and lifts uniquely to B† ⊗_{A†, F} A† ≅ B†. (c) If A_0 → B_0 is finite étale of constant degree d, then A†_K → B†_K is finite étale, B†_K is a projective A†_K-module of rank d with a trace map Tr: B†_K → A†_K satisfying Tr ∘ (inclusion) = d, and B†_K ⊗ Ω^i_{A†_K} ≅ Ω^i_{B†_K} for all i.

**Hypotheses and scope.**

- Étale lifts are unique by topological invariance of the étale site along the π-adic filtration; the lift of a Frobenius is unique only once F_{A†} is fixed.

**Proof or construction.**

1. (a): lift B_0 to an étale A†-algebra (weak-completion-henselian-descent (2); Étesse 2002, (1.2.2), citing his Padova paper, Théorème 4) and take its weak completion; flatness and the differential isomorphisms are Étesse's Proposition 1 (ii)(1)–(4), pp. 579–580, using formal étaleness and faithful flatness of A† → Â.
2. (b): the relative Frobenius of an étale morphism in characteristic p is an isomorphism; it lifts uniquely along the henselian pair by uniqueness of étale lifts, and F_{B†} is 1_{B†} ⊗ F_{A†} composed with that isomorphism (Étesse (1.2.2), pp. 578–579).
3. (c): for B_0 finite étale over A_0 the lift is finite étale over A†, hence B†_K is finite projective over A†_K with the trace of a finite étale algebra; the differential isomorphism in all degrees is Kedlaya, Finiteness, Proposition 3.4.5.

**Examples and acceptance.**

- Kummer cover: for p ∤ N, A_0 = k[t, t^{−1}] → B_0 = k[s, s^{−1}], t ↦ s^N, lifts to O[t, t^{−1}]† → O[s, s^{−1}]†, of degree N; the Frobenius t ↦ t^p extends to s ↦ s^p.
- Degenerate case: B_0 = A_0 gives B† = A†.
- Artin–Schreier: for the finite étale cover s^p − s = t of A^1_k, O[t]†[s]/(s^p − s − t) is an étale lift (the derivative p s^{p−1} − 1 is a unit), and by uniqueness every étale lift is isomorphic to it over O[t]†.
- Non-example: for p odd the ramified cover t ↦ s² of A^1_k is not étale, and its lift O[t]†[s]/(s² − t) is not étale at s = 0; the lemma needs A_0 → B_0 étale.

**Needs.** `RD.3/weak-completion-henselian-descent`, `AdicSpacesPartII:F1/mw-morphism-lifting`, `AdicSpacesPartII:F1/mw-lift-existence-uniqueness`, `AdicSpacesPartII:F1/dagger-finite-extension`, `AdicSpacesPartII:F1/dagger-differentials`, `AdicSpacesPartII:F1/dagger-finite-etale-trace`, `AdicSpacesPartII:F1/dagger-completion-comparison`, `RD.0/frobenius-lift-on-dagger-algebra`, `SchemeAndStackFoundations:SF.0/henselian-finite-etale-equivalence`, Mathlib `Algebra.Etale`.

**Sources.**

- [Jean-Yves Étesse, *Descente étale des F-isocristaux surconvergents et rationalité des fonctions L de schémas abéliens*](http://www.numdam.org/item/ASENS_2002_4_35_4_575_0/), (1.2.1)–(1.2.2) and Proposition 1, pp. 578–580. Lifts an étale A_0-algebra to an étale A†-algebra, extends the Frobenius lift uniquely through the relative Frobenius isomorphism, and proves the flatness and the isomorphisms of Monsky–Washnitzer differentials.
- [Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*](https://arxiv.org/abs/math/0208027v6), Definition 3.4.2, p. 23, and the proof of Proposition 3.4.5, p. 24. Defines pushforward of (σ,∇)-modules along finite étale maps of dagger algebras as restriction of scalars (Definition 3.4.2), and, in the proof of Proposition 3.4.5, uses the canonical isomorphism S ⊗_R Ω^i_R ≅ Ω^i_S for a finite étale extension of dagger algebras.
- [Jean-Yves Étesse, *Relèvement de schémas et algèbres de Monsky–Washnitzer : théorèmes d'équivalences et de pleine fidélité*](http://www.numdam.org/item/RSMUP_2002__107__111_0/), Théorème 4 (2)–(3), pp. 116–117. Lifts étale and finite étale algebras over the reduction to étale and finite étale algebras over the weak completion.

## 5. Convergent isocrystals and the crystalline comparison

Convergent isocrystals are the case of empty overconvergence locus; they are the target of restriction from overconvergent coefficients (`RD.3/restriction-to-convergent`) and the analytic model of crystalline F-isocrystals. With Frobenius, crystals up to isogeny and Tate twist and convergent F-isocrystals are the same thing on smooth varieties; without Frobenius a crystal gives only an isocrystal convergent on the tube of radius |π|.

### Convergent isocrystals Isoc(X/K)

**Definition.** Node `RD.3/convergent-isocrystal`. Proposed namespace `TauCeti.RigidCohomology`, module `TauCeti/RigidCohomology/Isocrystals/Convergent`.

Let X be a k-scheme of finite type. The category Isoc(X/K) of convergent isocrystals is the case Y = X of Isoc(X, Y/K) (isocrystals-glued-from-local-frames): when X is a closed subscheme of a formal O-scheme P smooth near X, its objects are coherent O_{]X[_P}-modules E with an integrable connection ∇ that is convergent, i.e. the Taylor isomorphisms extend to an isomorphism ε: p_2^*E ≅ p_1^*E on the whole tube ]X[_{P×P}; in general it is obtained by gluing. Equivalently (taylor-series-convergence-criterion with Z = ∅), for P affine with coordinates t_1, …, t_m near X, ‖∂^{[k]} e‖ λ^{|k|} → 0 for every λ < 1 and every section e over the closed tube [X]_λ. For X smooth affine with a smooth formal lift 𝔛 = Spf R over O (so ]X[_𝔛 = 𝔛_K), the objects are vector bundles on 𝔛_K with integrable connection such that lim_{|α|→∞} ‖θ^α(e)/α!‖ η^{|α|} = 0 for all 0 ≤ η < 1 and all sections e, θ_i being the components of ∇ in a framing. The category does not depend on P up to canonical equivalence, its objects are locally free, and for X proper over k it coincides with Isoc†(X/K).

**Hypotheses and scope.**

- K is complete discretely valued of characteristic 0 with residue field k of characteristic p; no Frobenius structure is assumed.
- The convergence condition is on the whole tube ]X[_{P×P}, not on a strict neighbourhood of it; there is no boundary condition.

**API.**

- `ConvIsoc` (constructor): Isoc(X/K): coherent O_{]X[_P}-modules with integrable convergent connection on a frame (X, X, P), glued in general.
- `ConvIsoc.ofFormalLift` (characterisation): On a smooth affine with formal lift 𝔛 = Spf R: vector bundles on 𝔛_K with integrable connection satisfying lim ‖θ^α(e)/α!‖ η^{|α|} = 0 for all η < 1.
- `ConvIsoc.realisation` (projection): The realisation E_P on ]X[_P for any closed immersion of X into a formal O-scheme P, with transition isomorphisms.
- `ConvIsoc.independent_of_frame` (equivalence): Canonical equivalences between the categories defined with two embeddings, compatible with composition.
- `ConvIsoc.isLocallyFree` (other): Every object is locally free of finite rank on ]X[_P.
- `ConvIsoc.monoidal` (instance): Abelian rigid ⊗-category with unit (O_{]X[}, d), internal Hom and exact forgetful functor to coherent modules.
- `ConvIsoc.pullback` (functoriality): Pullback along morphisms X′ → X of k-schemes of finite type, with (w ∘ w′)^* ≅ w′^* ∘ w^*.
- `ConvIsoc.isStack` (other): X ↦ Isoc(X/K) is a Zariski stack.
- `ConvIsoc.ofOverconvergent` (coercion): The restriction functor Isoc†(X/K) → Isoc(X/K), restriction from a strict neighbourhood to the tube, exact and faithful.
- `ConvIsoc.proper_eq` (compatibility): For X proper over k the restriction functor Isoc†(X/K) → Isoc(X/K) is the identity.

**Checks.**

- `ConvIsoc.dwork_convergent` (computation): On A^1_k with P = Spf O⟨t⟩ and K = ℚ_p(π), π^{p−1} = −p: (K⟨t⟩, ∇(1) = −π dt) is convergent, since |π^k/k!| = p^{−s_p(k)/(p−1)} ≤ 1.
- `ConvIsoc.exp_not_convergent` (non-example): (K⟨t⟩, ∇(1) = −dt) is an integrable connection on the closed disc that is not convergent: |1/k!| λ^k → ∞ for λ > p^{−1/(p−1)}.
- `ConvIsoc.point` (degenerate): For X = Spec k, Isoc(X/K) is the category of finite-dimensional K-vector spaces (the tube is a point and connections are zero).
- `ConvIsoc.proper_overconvergent` (compatibility): For X proper over k, Isoc(X/K) = Isoc†(X/K) = Isoc(X, X/K).
- `ConvIsoc.criterion` (characterisation): On an affine frame with coordinates, ∇ is convergent iff ‖∂^{[k]} e‖ λ^{|k|} → 0 for all λ < 1 and e over [X]_λ.

**Uses.**

- PadicDifferentialEquationsAndRigidCohomology:RD.3/restriction-to-convergent: the target category of restriction from overconvergent (F-)isocrystals
- Guo–Reinecke, Theorem 2.14 and Proposition 2.17, pp. 15–16: F-isocrystals are identified with vector bundles with convergent connection and Frobenius, and convergent isocrystals have an underlying bundle with connection
- D’Addezio, §2.2 and footnote 2, p. 6: F^n-isocrystals on the crystalline site are convergent, and the paper works with the convergent category Isoc(X)
- PadicDifferentialEquationsAndRigidCohomology:RD.7/rigid-crystalline-comparison: for X proper the coefficient objects of the crystalline comparison are convergent isocrystals

**Proof or construction.**

1. Independence of P is RD.3/independence-of-frame with Y = X (Berthelot 96-03 (2.3.1)–(2.3.2), pp. 68–70); the gluing and the Zariski stack property are isocrystals-glued-from-local-frames and zariski-stack-of-overconvergent-isocrystals (b).
2. The coordinate description is taylor-series-convergence-criterion with Z = ∅ ((2.2.14), p. 66); it agrees with Guo–Reinecke's Definition 2.12 on affine smooth formal lifts, and with Ogus's convergent isocrystals by Berthelot (2.3.4) (the tubes [X]_{P, p^{1/n}} are the generic fibres of Ogus's formal models T_{P,n}(X)).

**Examples and acceptance.**

- Dwork on A^1: (K⟨t⟩, ∇(1) = −π dt) is convergent (|π^k/k!| ≤ 1); (K⟨t⟩, ∇(1) = −dt) is not.
- For X proper, Isoc(X/K) = Isoc†(X/K) by definition (Berthelot (2.3.9)).

**Needs.** `RD.3/overconvergent-isocrystal`, `RD.3/overconvergence-is-a-property`, `RD.3/taylor-series-convergence-criterion`, `RD.3/isocrystals-glued-from-local-frames`, `RD.3/independence-of-frame`, `RD.3/tube`, `AdicSpacesPartII:R2/tube`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.2.5), (2.2.14), (2.3.2), (2.3.4), (2.3.9), pp. 61, 66, 69–73, 77. Defines convergent connections as those whose Taylor isomorphism extends to the whole tube of the diagonal, gives the coordinate criterion, defines the category of convergent isocrystals as the case of empty overconvergence locus, compares it with Ogus's definition, and notes that it equals the overconvergent category for proper X.
- [Haoyang Guo, Emanuel Reinecke, *A prismatic approach to crystalline local systems*](https://arxiv.org/abs/2203.09490v3), Construction 2.11, Definition 2.12, Remark 2.13, p. 15. Describes isocrystals on an affine smooth formal lift as modules with connection over R[1/p] and defines convergent connections by the decay condition on θ^α(e)/α! for every η < 1.
- [Kiran S. Kedlaya, *Notes on isocrystals*](https://arxiv.org/abs/1606.01321v6), Definition 2.1, Remarks 2.3 and 2.12, pp. 2–5. Defines convergent F-isocrystals on a smooth affine through a smooth formal lift, notes that coherent modules with connection are locally free, and that without Frobenius an extra convergence condition on the Taylor isomorphism must be imposed.

### Convergent F-isocrystals F^a-Isoc(X/K)

**Definition.** Node `RD.3/convergent-f-isocrystal`. Planet: *Convergent F-isocrystal*. Proposed namespace `TauCeti.RigidCohomology`, module `TauCeti/RigidCohomology/Isocrystals/Convergent`.

Fix an automorphism σ of K lifting the p^a-power Frobenius of k (a ≥ 1, q = p^a). For E ∈ Isoc(X/K) let F_σ^*E be the pullback along σ followed by the pullback along the q-power Frobenius of X (Berthelot (2.3.7)). A convergent F^a-isocrystal on X is a pair (E, Φ) with E ∈ Isoc(X/K) and Φ: F_σ^*E ≅ E an isomorphism in Isoc(X/K); morphisms are morphisms of isocrystals commuting with Φ. The category F^a-Isoc(X/K) is abelian with ⊗ and internal Hom (Φ_{Hom}(F^*f) = Φ_F ∘ F^*(f) ∘ Φ_E^{−1}), linear over the fixed field K^{σ}. The Tate twist E(n) multiplies Φ by q^{−n}. For X smooth affine with a smooth formal lift P = Spf R and a Frobenius lift σ_P over σ, F^a-Isoc(X/K) is equivalent to the category of vector bundles E on P_K with integrable connection and a horizontal isomorphism σ_P^*E ≅ E; the convergence of ∇ is then automatic. For a perfect point η: Spec Ω → X, the fibre functor η^* takes values in F^a-isocrystals over Ω: finite-dimensional K(Ω)-vector spaces with a σ^a-semilinear bijection, where K(Ω) = W(Ω)[1/p] ⊗ K over the Witt vectors of the residue field; for a = 1 and K = W(k)[1/p] these are the isocrystals of Mathlib's WittVector.Isocrystal over the perfect field Ω.

**Hypotheses and scope.**

- σ lifts the q-power Frobenius of k; the case a = 1, K = W(k)[1/p] with k perfect and σ the Witt-vector Frobenius is the one compared with Mathlib's point isocrystals.
- For F^a-isocrystals the natural Tate twist uses q^{−1} = p^{−a}; Berthelot's (2.3.8)(i) is the case a = 1, multiplying Φ by p^{−1}.

**API.**

- `ConvFIsoc` (constructor): Pairs (E, Φ) with E ∈ Isoc(X/K) and Φ: F_σ^*E ≅ E.
- `ConvFIsoc.frobeniusPullback` (data): The functor F_σ^* on Isoc(X/K).
- `ConvFIsoc.forget` (projection): The exact faithful forgetful functor to Isoc(X/K).
- `ConvFIsoc.monoidal` (instance): Abelian rigid ⊗-category with internal Hom; Hom-spaces are vector spaces over K^{σ}.
- `ConvFIsoc.tate` (constructor): The Tate objects O(n): the unit with Φ multiplied by q^{−n}; E(n) = E ⊗ O(n).
- `ConvFIsoc.pullback` (functoriality): Pullback along morphisms of k-schemes of finite type, commuting with F_σ^*.
- `ConvFIsoc.fibre` (projection): The fibre functor at a perfect point η: Spec Ω → X, to F^a-isocrystals over K(Ω).
- `ConvFIsoc.fibre_isocrystal` (compatibility): For a = 1, K = W(k)[1/p], the fibre at a perfect point Ω ⊇ k is an object of Mathlib's WittVector.Isocrystal p Ω (with Frobenius the given semilinear bijection).
- `ConvFIsoc.slopes` (data): The slope multiset at each point, defined through the fibre at a perfect point and the Dieudonné–Manin decomposition.
- `ConvFIsoc.ofFrobeniusLift` (characterisation): On a smooth affine with formal lift and Frobenius lift σ_P: vector bundles with integrable connection and horizontal σ_P^*E ≅ E; convergence is automatic.
- `ConvFIsoc.restrictFromOverconvergent` (coercion): Restriction from F^a-Isoc†(X/K), compatible with Φ (RD.3/restriction-to-convergent).

**Checks.**

- `ConvFIsoc.tate_fibre` (computation): Over F_p with K = ℚ_p: the fibre of O(1) at the point is the isocrystal ℚ_p with Φ = p^{−1}·id, i.e. StandardOneDimIsocrystal p 𝔽_p (−1).
- `ConvFIsoc.point_isocrystal` (compatibility): For X = Spec k, k perfect, a = 1, K = W(k)[1/p]: F-Isoc(X/K) is equivalent to the category of Mathlib isocrystals over k (finite-dimensional).
- `ConvFIsoc.unit` (degenerate): The unit (O_{]X[}, d, Φ = id) is an object, and End(unit) = K^{σ}.
- `ConvFIsoc.dwork` (characterisation): On A^1 with σ_P(t) = t^p, K = ℚ_p(π) and σ = id: Φ = exp π(t − t^p) is a horizontal isomorphism from the Frobenius pullback of (K⟨t⟩, ∇(1) = −π dt) to itself.
- `ConvFIsoc.no_frobenius_on_exp` (non-example): (K⟨t⟩, ∇(1) = −dt) admits no Frobenius structure: it is not even convergent, while every module with Frobenius structure is.

**Uses.**

- PadicDifferentialEquationsAndRigidCohomology:RD.3/restriction-to-convergent: target category of the restriction functor with Frobenius
- PadicDifferentialEquationsAndRigidCohomology:RD.3/full-faithfulness-overconvergent-to-convergent: Kedlaya's theorem compares F-Isoc† with this category
- D’Addezio, Proposition 3.3.4 and its proof, p. 11: unit-root F^n-isocrystals are compared with lisse ℚ_{p^n}-sheaves
- Étesse 2002, §5.1, pp. 590–591: the categories F^a-Isoc(X/K) and their unit-root subcategories, used for descent and full faithfulness
- Guo–Reinecke, Theorem 2.14, p. 15: F-isocrystals as vector bundles with convergent connection and Frobenius on an affine smooth formal lift

**Proof or construction.**

1. F_σ^* is the composite of the base change along σ (a functor Isoc(X, Y/K) → Isoc(X^{(σ)}, Y^{(σ)}/K)) and the pullback along the relative Frobenius (X, Y) → (X^{(σ)}, Y^{(σ)}), using isocrystals-glued-from-local-frames (c) (Berthelot 96-03 (2.3.7), pp. 75–76).
2. The local description with a Frobenius lift is Kedlaya, Notes, Definition 2.1, and Guo–Reinecke's Remark 2.16; the convergence of the connection follows from the Frobenius structure by Dwork's trick (the convergent analogue of frobenius-structure-forces-overconvergence; Kedlaya, Notes, Remark 2.12; Guo–Reinecke, Construction 2.11 and the paragraph before Definition 2.12).
3. Fibres at perfect points: pull back along η and use that Isoc(Spec Ω/K(Ω)) is the category of K(Ω)-vector spaces (convergent-isocrystal, test point); the Frobenius becomes a σ^a-semilinear bijection (Kedlaya, Notes, Remark 2.10; D’Addezio §2.2).

**Examples and acceptance.**

- Tate object over F_p (K = ℚ_p, a = 1): O(1) is the unit with Φ = p^{−1}; its fibre at the point is the one-dimensional isocrystal with Φ x = p^{−1} σ(x), Mathlib's StandardOneDimIsocrystal of slope −1.
- Dwork: (K⟨t⟩, ∇(1) = −π dt, Φ = exp π(t − t^p)) on A^1 with σ_P(t) = t^p is a convergent F-isocrystal (it is even overconvergent).

**Needs.** `RD.3/convergent-isocrystal`, `RD.3/isocrystals-glued-from-local-frames`, `RD.3/frobenius-structure-forces-overconvergence`, `RD.3/overconvergent-f-isocrystal`, Mathlib `WittVector.Isocrystal`, Mathlib `WittVector.StandardOneDimIsocrystal`, `CrystallineCohomology:CR.4/isocrystal-slope-decomposition`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.3.7)–(2.3.8), pp. 75–77. Defines the Frobenius pullback on isocrystals overconvergent along Y − X as base change along σ followed by pullback along Frobenius, F-isocrystals (convergent when Y = X) with their internal Hom and Tate twists, and gives the Dwork and Kummer examples.
- [Kiran S. Kedlaya, *Notes on isocrystals*](https://arxiv.org/abs/1606.01321v6), Definition 2.1, Remark 2.10, Remark 2.12, pp. 2–5. Gives the local description of convergent F-isocrystals through a smooth formal lift with Frobenius lift, the fibre functors at points, and the role of Frobenius in forcing convergence.
- [Marco D'Addezio, *Parabolicity conjecture of F-isocrystals*](https://arxiv.org/pdf/2012.12879v4), §2.2, p. 6. Fixes the conventions F^n-Isoc(X), F^n-Isoc†(X) with Frobenius structures (F^n)^*M ≅ M, powers of Frobenius structures, fibre functors at perfect points and slope filtrations.

### Dwork's construction: the convergent F-isocrystal M^an of an F-crystal

**Construction.** Node `RD.3/f-crystal-to-convergent-f-isocrystal`. Proposed namespace `TauCeti.RigidCohomology`, module `TauCeti/RigidCohomology/Isocrystals/Convergent`.

Assume O is a complete discrete valuation ring of mixed characteristic with ramification index e ≤ p − 1 and a Frobenius lift σ. Let X be a k-scheme of finite type and (M, Φ) a non-degenerate F-crystal on X/(O, σ) (a crystal of finite type with Φ: F^*M → M and V: M → F^*M, V∘Φ = p^n, Φ∘V = p^n for some n). Then there is a convergent F-isocrystal M^an on X/(K, σ), functorial in (M, Φ) and in X, constructed in two steps: (i) for a closed immersion X → P = Spf A into a smooth formal scheme, the completed divided-power envelope D̂ of the ideal of X maps to the algebra of the affinoid [X]_{P,|π|} by f^{[q]} ↦ π^{|q|} T^q/q!, which is bounded because e ≤ p − 1; this turns M into a coherent module M_P on [X]_{P,|π|} with a Taylor isomorphism on [X]_{P²,|π|} (an isocrystal convergent of radius |π|); (ii) a Frobenius lift F on P maps [X]_{P,λ_{n+1}} into [X]_{P,λ_n} for λ_n = |π|^{p^{−n}}, and the isomorphisms (F_K^*)^n(Φ ⊗ K) extend M_P and its Taylor isomorphism successively to ]X[_P = ⋃ [X]_{P,λ_n} and ]X[_{P²}.

**Hypotheses and scope.**

- e ≤ p − 1 is needed in step (i): the elements π^{|q|}/q! must be p-adic integers.
- Non-degeneracy (existence of V) makes Φ ⊗ K an isomorphism, which step (ii) needs.

**API.**

- `FCrystal.toConvergent` (constructor): The functor (M, Φ) ↦ M^an from non-degenerate F-crystals on X/(O, σ) to F-Isoc(X/K), for e ≤ p − 1.
- `FCrystal.toConvergent_map` (functoriality): Functoriality in (M, Φ) and compatibility with pullback along morphisms X′ → X.
- `FCrystal.toConvergent_tensor` (compatibility): (M ⊗ N)^an ≅ M^an ⊗ N^an and (unit)^an = unit.
- `FCrystal.toConvergent_isogeny` (other): The functor sends p-isogenies to isomorphisms, hence factors through F-crystals up to isogeny (Hom ⊗ ℚ).
- `FCrystal.toConvergent_twist` (relation): (M, p^m Φ)^an ≅ M^an(−m): multiplying Φ by p^m is the inverse Tate twist.
- `FCrystal.toConvergent_radius` (characterisation): Before Frobenius extension, a crystal gives only an isocrystal convergent on the tube of radius |π| (step (i)).

**Checks.**

- `FCrystal.toConvergent_unit` (degenerate): The unit F-crystal (O_{X/O}, id) goes to the unit convergent F-isocrystal.
- `FCrystal.toConvergent_point_slope` (computation): For X = Spec k, O = W(k) and m ≥ 0: (W(k), p^m σ) goes to the one-dimensional isocrystal with Φ = p^m σ, of slope m (Mathlib StandardOneDimIsocrystal p k m). For m < 0 the map p^m σ does not preserve W(k), so negative slopes arise only as Tate twists M^an(n).
- `FCrystal.toConvergent_degenerate_excluded` (non-example): The F-crystal (W(k), Φ = 0) is degenerate (no V with VΦ = p^n) and has no associated F-isocrystal, since Φ ⊗ K is not an isomorphism.
- `FCrystal.toConvergent_twist_test` (compatibility): (O_{X/W}, pσ)^an ≅ O(−1): its fibre at a point has slope 1.

**Uses.**

- PadicDifferentialEquationsAndRigidCohomology:RD.3/convergent-f-isocrystals-are-crystalline: the comparison theorem is about this functor
- Étesse 2002, proof of Théorème 7, p. 599: R^i f_cris*(O) of an abelian scheme is turned into a convergent F-isocrystal by this construction, using e ≤ p − 1
- Kedlaya, Notes, Theorem 2.2, p. 2: the functor from crystals to convergent F-isocrystals in Ogus's comparison

**Proof or construction.**

1. Glue from affine P (the construction is functorial); identify M with a separated complete D̂-module with stratification (Berthelot 96-03 (2.4.1), pp. 78–79).
2. Step (i): the composite D → A ⊗ K → (A ⊗ K){T}/(f_i − πT_i) is continuous for the π-adic topology since π^{q_1+…+q_r}/q_1!⋯q_r! ∈ ℤ_p when e ≤ p − 1, so it extends to D̂; base change gives M_P and, from the stratification, its Taylor isomorphism ((2.4.1.1)–(2.4.1.2)).
3. Step (ii): F_K maps [X]_{λ_{n+1}} into [X]_{λ_n} because F^*(f_i) = f_i^p + π g_i ((2.4.1.3)); setting M_n = (F_K^*)^n M_0 on [X]_{λ_n}, the maps (F_K^*)^n(Φ) identify M_n with the restriction of M_{n+1}, and the compatibility of Φ with the stratification extends the Taylor isomorphism to ]X[_{P²}.

**Examples and acceptance.**

- The unit crystal O_{X/O} with Φ = id gives the unit object (O_{]X[}, d, id).
- Point: X = Spec k (k perfect, O = W(k)): an F-crystal is a Dieudonné-type module (W(k)^r, Φ) and M^an is (K^r, Φ ⊗ K); for (W(k), p^m σ) with m ≥ 0 one gets Mathlib's StandardOneDimIsocrystal of slope m.

**Needs.** `CrystallineCohomology:CR.1/isocrystal`, `CrystallineCohomology:CR.1/crystal`, `CrystallineCohomology:CR.1/taylor-equivalence`, `CrystallineCohomology:CR.0/completed-envelope`, `RD.3/convergent-f-isocrystal`, `RD.3/convergent-isocrystal`, `RD.3/tube`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.4) introduction and (2.4.1), pp. 78–79. Under e ≤ p − 1, associates with a crystal an isocrystal convergent of radius |π| via the divided-power envelope, and with a non-degenerate F-crystal a convergent F-isocrystal by extending with Frobenius (Dwork's method), functorially.
- [Haoyang Guo, Emanuel Reinecke, *A prismatic approach to crystalline local systems*](https://arxiv.org/abs/2203.09490v3), footnote 3, p. 15. Notes that the boundedness of p^n/n! uses the ramification bound and fails when the ramification index is at least p.

### Convergent F-isocrystals are F-crystals up to isogeny and twist (Berthelot, Ogus)

**Theorem.** Node `RD.3/convergent-f-isocrystals-are-crystalline`.

Let O be a complete discrete valuation ring of mixed characteristic with e ≤ p − 1 and Frobenius lift σ, and X a k-scheme of finite type. (a) The functor M ↦ M^an of f-crystal-to-convergent-f-isocrystal is fully faithful on non-degenerate F-crystals up to isogeny: Hom(M, N) ⊗ ℚ ≅ Hom(M^an, N^an). (b) If X is smooth over k, every convergent F-isocrystal N is isomorphic to M^an(n) for a non-degenerate F-crystal M (which may be taken p-torsion free) and an integer n ≥ 0. (c) Hence, for k perfect, O = W(k) and X smooth, the category F^a-Isoc(X/K) is equivalent to the category of pairs (E, Φ) with E an object of Isoc(X/W) = Crys(X/W) ⊗ ℚ (crystals of finite type up to isogeny) and Φ: (F^a)^*E ≅ E. (d) Locally, for 𝔛 = Spf R affine smooth over W(k) with special fibre 𝔛_s and a Frobenius lift F, the functor E ↦ E(𝔛)[1/p] = lim_r E(𝔛_s, 𝔛 ⊗ W_r)[1/p] is an equivalence from F-isocrystals on 𝔛_s/W(k) (crystalline) to vector bundles on 𝔛_η with flat convergent connection and horizontal Frobenius F^*E ≅ E. (e) The F-isocrystals on 𝔛_s for the crystalline site, on the crystalline site of 𝔛 ⊗ O_K/p, and on Ogus's convergent site of 𝔛 ⊗ O_K/p over W(k) are equivalent for a smooth formal O_K-scheme 𝔛 (any ramification), the inverses being restrictions.

**Hypotheses and scope.**

- (b) needs X smooth; the twist n is needed (the Tate object O(1) is not of the form M^an).
- (c)–(e) use the unramified base W(k); the ramified case is reached through (e) and underlying-bundle-of-convergent-isocrystal.
- Kedlaya states Theorem 2.2 for the absolute Frobenius (a = 1, k perfect, K = W(k)[1/p], X smooth); D’Addezio (§2.2) uses the equivalence for F^n-structures. Berthelot's argument in (2.4.1)–(2.4.2) applies with F replaced by F^a: the radii |π|^{q^{−n}}, q = p^a, still tend to 1, and Ogus's input in (b) does not involve the Frobenius.

**Proof or construction.**

1. (a): by internal Hom, compare Frobenius-invariant horizontal sections; locally with a Frobenius lift, sections of M^an on ]X[ are compatible families over the tubes [X]_{λ_n}, and the map B_1 → D̂ ⊗ ℚ sending T_i to (π^{−1} p!) f_i^{[p]} produces an inverse to the natural map from (M ⊗ ℚ)^{∇=0, Φ=1} (Berthelot 96-03 (2.4.2), first part, pp. 79–81).
2. (b): by (a) the statement is local, so assume X affine with a smooth lift; Ogus's Proposition 7.3 in 'The convergent topos in characteristic p' gives a crystal M, p-torsion free, with N ≅ M ⊗ ℚ compatibly with the Taylor isomorphisms, and p^n Φ is then an F-crystal structure ((2.4.2), second part, p. 81) — Ogus's proposition is an imported, unread input (gap).
3. (c) is (a) and (b) together, as stated by Kedlaya (Notes, Theorem 2.2, attributing full faithfulness to Ogus 1984 and essential surjectivity to Berthelot's (2.4.2)) and used by D’Addezio (§2.2, footnote 2).
4. (d) is the local form (Guo–Reinecke, Theorem 2.14, citing Berthelot's (2.4.2); Construction 2.11 identifies crystals with modules with quasi-nilpotent connection, CrystallineCohomology:CR.1/taylor-equivalence); (e) is Guo–Reinecke's Remark 2.15, citing Ogus 1984 (Example 2.7.3, Proposition 2.18) for the extension along the convergent site by Dwork's trick (imported, unread input).

**Examples and acceptance.**

- Point: for X = Spec k with k perfect, (c) says that F-isocrystals are Dieudonné modules up to isogeny, i.e. Mathlib's isocrystals over k.
- Twist needed: O(1) (Φ = p^{−1}) is not M^an for any F-crystal M, because Φ would have to map a lattice into itself; it is M^an(1) for M the unit F-crystal.
- Without Frobenius a crystal yields only an isocrystal convergent on the tube of radius |π| (Berthelot (2.4.1)(i)); the full convergence in (d) uses Frobenius.

**Needs.** `RD.3/f-crystal-to-convergent-f-isocrystal`, `RD.3/convergent-f-isocrystal`, `RD.3/convergent-isocrystal`, `RD.3/taylor-series-convergence-criterion`, `CrystallineCohomology:CR.1/isocrystal`, `CrystallineCohomology:CR.1/taylor-equivalence`, `CrystallineCohomology:CR.1/crystal`, Mathlib `WittVector.Isocrystal`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.4.2) Théorème and its proof, pp. 79–81. Proves full faithfulness of M ↦ M^an on non-degenerate F-crystals up to isogeny and, for X smooth, that every convergent F-isocrystal is a Tate twist M^an(n), using a result of Ogus for the existence of the crystal.
- [Kiran S. Kedlaya, *Notes on isocrystals*](https://arxiv.org/abs/1606.01321v6), Theorem 2.2 with its proof, p. 2. States that convergent F-isocrystals are the F-objects of the isogeny category of crystals of finite type, with references to Ogus 1984 for full faithfulness and Berthelot's (2.4.2) for essential surjectivity.
- [Haoyang Guo, Emanuel Reinecke, *A prismatic approach to crystalline local systems*](https://arxiv.org/abs/2203.09490v3), Construction 2.11, Theorem 2.14, Remarks 2.15–2.16, pp. 15–16. Gives the local description of F-isocrystals on an affine smooth formal W(k)-scheme with Frobenius lift as vector bundles with convergent connection and Frobenius, and the equivalence of crystalline and convergent-site F-isocrystals (Ogus).
- [Marco D'Addezio, *Parabolicity conjecture of F-isocrystals*](https://arxiv.org/pdf/2012.12879v4), §2.2 and footnote 2, p. 6. Uses the equivalence of F^n-isocrystals on the crystalline site (Isoc(X) = Crys(X)[1/p]) with convergent F^n-isocrystals, citing Kedlaya's Theorem 2.2.

### The underlying vector bundle with connection of a convergent isocrystal on a smooth formal O_K-scheme

**Construction.** Node `RD.3/underlying-bundle-of-convergent-isocrystal`. Proposed namespace `TauCeti.RigidCohomology`, module `TauCeti/RigidCohomology/Isocrystals/Convergent`.

Let 𝔛 be a smooth formal scheme over Spf O_K, O_K possibly ramified over W(k), with special fibre 𝔛_s and rigid generic fibre 𝔛_η, and let E be a convergent isocrystal on 𝔛_s/K_0, K_0 = W(k)[1/p]. (i) E has an underlying vector bundle with flat connection (E, ∇) on 𝔛_η: the realisation of E on the (not necessarily W(k)-smooth) formal scheme 𝔛, in which 𝔛_s is defined by an ideal of definition (isocrystals-glued-from-local-frames (b)); the connection is relative to K_0, equivalently to K. (ii) If E underlies a crystalline F-isocrystal on 𝔛_s/W(k), then for every W(k)-model Ũ of an affine open U ⊆ 𝔛 (Ũ ⊗_{W(k)} O_K ≅ U; such models exist for framed affines), (E, ∇)|_{U_η} ≅ (E(Ũ), ∇_Ũ) ⊗_{K_0} K, the right side being given by convergent-f-isocrystals-are-crystalline (d). The construction is exact, compatible with ⊗, duals and pullback along morphisms of smooth formal O_K-schemes.

**Hypotheses and scope.**

- Over a ramified base 𝔛 has no Frobenius lift compatible with a lift of Frobenius on O_K in general; Frobenius structures are carried by E on the special fibre, not by the bundle.
- Framings (étale maps to Spf O_K⟨x_1^{±1}, …, x_d^{±1}⟩) exist on a basis of affine opens (Guo–Reinecke, Lemma 2.10).
- Guo–Reinecke state (i) for convergent isocrystals on Ogus's convergent site of 𝔛_{p=0}; by Berthelot (2.3.4) these are the convergent isocrystals defined by tubes, and tubes depend only on the reduced subscheme, so a convergent isocrystal on 𝔛_s is the same datum.

**API.**

- `ConvIsoc.underlyingBundle` (constructor): The vector bundle E on 𝔛_η underlying a convergent isocrystal on 𝔛_s, for 𝔛 smooth over Spf O_K.
- `ConvIsoc.underlyingConnection` (data): Its flat connection relative to K.
- `ConvIsoc.underlyingBundle_localModel` (characterisation): For a W(k)-model Ũ of an affine open U: (E, ∇)|_{U_η} ≅ (E(Ũ), ∇_Ũ) ⊗_{K_0} K.
- `ConvIsoc.underlyingBundle_monoidal` (compatibility): Exact, compatible with ⊗, duals and the unit.
- `ConvIsoc.underlyingBundle_pullback` (functoriality): Compatible with pullback along morphisms of smooth formal O_K-schemes.

**Checks.**

- `ConvIsoc.underlyingBundle_unit` (degenerate): The unit isocrystal has underlying bundle (O_{𝔛_η}, d).
- `ConvIsoc.underlyingBundle_unramified` (compatibility): For O_K = W(k) and 𝔛 = Spf R with a Frobenius lift, the underlying bundle of an F-isocrystal is E(𝔛)[1/p], the bundle of convergent-f-isocrystals-are-crystalline (d).
- `ConvIsoc.underlyingBundle_baseChange` (computation): For 𝔛 = Ũ ⊗_{W(k)} O_K, the underlying bundle is the base change (E(Ũ)[1/p], ∇) ⊗_{K_0} K.
- `ConvIsoc.underlyingBundle_forgets_frobenius` (non-example): The unit object O and the Tate object O(1) have the same underlying bundle with connection (O_{𝔛_η}, d) but are not isomorphic as F-isocrystals: the bundle does not determine Φ.

**Uses.**

- Guo–Reinecke, Definition 2.18, p. 16: filtered F-isocrystals are F-isocrystals with a Griffiths-transversal filtration on the underlying bundle
- Guo–Reinecke, proof of Theorem 6.13, pp. 60–61: the comparison of crystalline pushforwards with convergent F-isocrystals uses the underlying bundles
- PadicHodgeTheory (consumer): crystalline local systems on the generic fibre are compared with filtered F-isocrystals through their underlying bundles

**Proof or construction.**

1. Realisation: for an affine open U with a closed immersion of U_s into a smooth formal W(k)-scheme P, lift U_s → P to u: U → P by formal smoothness along the ideal of definition, and put E_U = u_K^* E_P on U_η = ]U_s[_U; independence and gluing are isocrystals-glued-from-local-frames (b) (Berthelot 96-03 (2.3.2)(ii), last paragraph, pp. 70–71).
2. (ii): for a framed affine U, the unique W(k)-model Ũ with lifted framing (Guo–Reinecke, Lemma 2.9) gives u: U = Ũ ⊗ O_K → Ũ, so E_U = (E(Ũ)[1/p]) ⊗_{K_0} K with its connection (Guo–Reinecke, Proposition 2.17, citing Ogus 1984, Remark 2.8.1, Theorem 2.15, Proposition 2.21).

**Examples and acceptance.**

- Unit: the underlying bundle of the unit isocrystal is (O_{𝔛_η}, d).
- Unramified case: O_K = W(k) and 𝔛 = Ũ give E(𝔛)[1/p] itself.

**Needs.** `RD.3/isocrystals-glued-from-local-frames`, `RD.3/convergent-isocrystal`, `RD.3/convergent-f-isocrystals-are-crystalline`, `AdicSpacesPartII:R2/raynaud-generic-fibre`, `AdicSpacesPartII:R2/smooth-lifting-from-level-zero`.

**Sources.**

- [Haoyang Guo, Emanuel Reinecke, *A prismatic approach to crystalline local systems*](https://arxiv.org/abs/2203.09490v3), Lemmas 2.9–2.10 and Proposition 2.17, pp. 14 and 16. Constructs the W(k)-model of a framed affine smooth formal O_K-scheme and states that a convergent isocrystal has an underlying vector bundle with flat connection on the generic fibre, locally given by the bundle of the F-isocrystal on any W(k)-model, citing Ogus.
- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.3.2)(ii), pp. 70–71. Defines the realisation of an isocrystal on an arbitrary formal scheme containing an open of Y, including formal schemes over a discrete valuation ring in which the subscheme is defined by an ideal of definition.

## 6. Unit-root F-isocrystals

Unit-root objects are those pure of slope 0 at every point. Katz and Crew identify them with lisse p-adic sheaves; the overconvergent ones are those with finitely ramified monodromy (Tsuzuki, stated in Kedlaya's Notes, Theorem 3.9), which is why a convergent unit-root subobject of an overconvergent object can fail to be overconvergent (`RD.3/punctured-curve-boundary-acceptance`).

### Unit-root F-isocrystals

**Definition.** Node `RD.3/unit-root-f-isocrystal`. Proposed namespace `TauCeti.RigidCohomology`, module `TauCeti/RigidCohomology/Isocrystals/UnitRoot`.

Let E be a convergent or overconvergent F^a-isocrystal on X. E is unit-root if for every geometric point x̄ of X all Frobenius slopes of the fibre x̄^*E are zero, i.e. the fibre has a basis e_1, …, e_r with Φ(e_i ⊗ 1) = e_i (Étesse §5.1); equivalently the fibre at every perfect point is isoclinic of slope 0. Unit-root objects form a full subcategory F^a-Isoc(X/K)^0 (respectively F^a-Isoc†(X/K)^0) stable under ⊗, duals, subquotients and extensions, with no non-zero morphisms to or from isoclinic objects of non-zero slope. At a perfect point with a = 1 and K = W(k)[1/p], unit-root means that the Mathlib isocrystal has a W-lattice L with Φ(L) = L, equivalently a basis in which the matrix of Φ lies in GL_r(W).

**Hypotheses and scope.**

- Slopes are computed after pulling back to a perfect (or algebraically closed) point, where the Dieudonné–Manin classification applies.
- For overconvergent objects the condition is on the image in the convergent category; it is the same pointwise condition.

**API.**

- `FIsoc.IsUnitRoot` (data): The predicate: every fibre at a geometric point has all Frobenius slopes 0.
- `FIsoc.isUnitRoot_iff_fibre` (characterisation): E is unit-root iff each fibre at a perfect point admits a lattice stable under Φ on which Φ is bijective.
- `FIsoc.IsUnitRoot.tensor` (instance): Unit-root objects are stable under ⊗, duals and internal Hom, and contain the unit.
- `FIsoc.IsUnitRoot.subquotient` (other): Subobjects and quotients of unit-root objects are unit-root.
- `FIsoc.IsUnitRoot.extension` (other): Extensions of unit-root objects are unit-root.
- `FIsoc.IsUnitRoot.pullback` (functoriality): Pullback along any morphism preserves being unit-root.
- `FIsoc.hom_eq_zero_of_slopes_ne` (relation): There are no non-zero morphisms between isoclinic objects of distinct slopes; in particular from unit-root objects to O(n), n ≠ 0.

**Checks.**

- `FIsoc.isUnitRoot_slopeZero_point` (computation): At a perfect point, Mathlib's StandardOneDimIsocrystal p k 0 (Φ = σ) is unit-root: the lattice W(k) is Φ-stable with Φ bijective.
- `FIsoc.not_isUnitRoot_slopeOne` (non-example): StandardOneDimIsocrystal p k 1 (Φ = pσ) is not unit-root: every lattice L satisfies Φ(L) = pL ≠ L.
- `FIsoc.isUnitRoot_unit` (degenerate): The unit object (Φ = id) is unit-root, and so is the zero object.
- `FIsoc.dwork_isUnitRoot` (computation): The Dwork F-isocrystal on A^1 is unit-root: it has rank one and its Frobenius at the point 0 is θ(0) = 1. At the point 1 its Frobenius is θ(1) = ζ_p, a primitive p-th root of unity and so a unit but not 1; a test asserting Φ = 1 at every Teichmüller point would be wrong.
- `FIsoc.tate_not_unitRoot` (non-example): O(1) is isoclinic of slope −1 and not unit-root, although it has rank one.

**Uses.**

- PadicDifferentialEquationsAndRigidCohomology:RD.3/crew-unit-root-correspondence: unit-root objects are the essential image of lisse ℚ_q-sheaves
- Étesse 2002, Théorème 5, p. 597: full faithfulness F^a-Isoc†(X/K)^0 → F^a-Isoc(X/K)^0 for unit-root objects
- D’Addezio, Proposition 3.3.4, p. 11: isoclinic F^∞-isocrystals as twists of unit-root ones, compared with lisse sheaves
- PadicDifferentialEquationsAndRigidCohomology:RD.3/punctured-curve-boundary-acceptance: the unit-root subobject of H^1 of the universal elliptic curve on the ordinary locus is convergent but not overconvergent

**Proof or construction.**

1. Fibres at perfect points are F^a-isocrystals over K(Ω) (convergent-f-isocrystal); over an algebraically closed point Dieudonné–Manin (CrystallineCohomology:CR.4/isocrystal-slope-decomposition; Mathlib's isocrystal_classification in rank one) decomposes them by slope, and slope 0 means a Φ-fixed basis (Étesse 2002 §5.1, p. 590; Kedlaya, Notes, Definition 3.3, p. 6).
2. Stability under subquotients and extensions and the vanishing of Hom between distinct slopes are Kedlaya, Notes, Definition 3.3 and the remark after it (slopes are additive in exact sequences); the lattice characterisation at a point follows from Dieudonné–Manin.

**Examples and acceptance.**

- The Dwork F-isocrystal L_π (∇(1) = −π dt, Φ = θ(t) := exp π(t − t^p), σ = id) is unit-root: it has rank one, hence is isoclinic (Kedlaya, Notes, Remark 3.5), and at the point 0 its Frobenius is θ(0) = 1. At the other F_p-points the Frobenius is not 1: by Dwork's theorem θ(1) = ζ_p is a primitive p-th root of unity (ζ_p ≡ 1 + π mod π²) and θ(x̂) = ζ_p^x for the Teichmüller lift x̂ of x ∈ F_p, a unit, consistently with slope 0. The tempting substitution x̂^p = x̂ inside exp π(t − t^p) is not legitimate: exp(πt) and exp(−πt^p) diverge on |t| = 1, and only their product θ converges there.
- The Tate object O(1) is isoclinic of slope −1, hence not unit-root.

**Needs.** `RD.3/convergent-f-isocrystal`, `RD.3/overconvergent-f-isocrystal`, `CrystallineCohomology:CR.4/isocrystal-slope-decomposition`, Mathlib `WittVector.Isocrystal`, Mathlib `WittVector.isocrystal_classification`.

**Sources.**

- [Jean-Yves Étesse, *Descente étale des F-isocristaux surconvergents et rationalité des fonctions L de schémas abéliens*](http://www.numdam.org/item/ASENS_2002_4_35_4_575_0/), §5.1, p. 590. Defines unit F^a-isocrystals (convergent or overconvergent) as those whose Frobenius has all slopes zero at every geometric point, i.e. has a fixed basis of the fibre.
- [Kiran S. Kedlaya, *Notes on isocrystals*](https://arxiv.org/abs/1606.01321v6), Definition 3.3 and the following paragraph, p. 6. Defines slope multisets at points via perfect closures, isoclinic and unit-root (étale) objects, their stability under subquotients and extensions, and the vanishing of morphisms between isoclinic objects of distinct slopes.
- [Marco D'Addezio, *Parabolicity conjecture of F-isocrystals*](https://arxiv.org/pdf/2012.12879v4), Definition 3.3.3, p. 11. Considers the Tannakian subcategory of isoclinic F^∞-isocrystals and its relation to lisse sheaves.

### Katz–Crew: unit-root F-isocrystals are lisse p-adic sheaves

**Theorem.** Node `RD.3/crew-unit-root-correspondence`.

Let k be a perfect field containing F_q (q = p^a), K = W(k)[1/p] with σ the Witt-vector Frobenius, and X a smooth separated k-scheme of finite type. Let ℚ_q = W(F_q)[1/p] ⊆ K. The functor V ↦ (V ⊗_{ℚ_q} O_{X/K}, 1 ⊗ σ^a) is an exact fully faithful ⊗-functor from the category of étale ℚ_q-local systems on X to F^a-Isoc(X/K), with essential image the unit-root convergent F^a-isocrystals; a quasi-inverse sends E to the étale sheaf of Φ-fixed horizontal sections. If X is connected with a geometric point x̄, unit-root convergent F^a-isocrystals are thus equivalent to continuous representations of π_1^ét(X, x̄) on finite-dimensional ℚ_q-vector spaces. For a = 1 this is the equivalence of Kedlaya, Notes, Theorem 3.7; the version with ℚ_q-coefficients and F^a-structures is the one used in D’Addezio, proof of Proposition 3.3.4.

**Hypotheses and scope.**

- X smooth; the field k perfect and containing F_q so that the F^a-isocrystal category is ℚ_q-linear.
- Local systems are étale ℚ_q-local systems: the étale stackification of the isogeny category of ℤ_q-local systems (InverseGaloisAndArithmeticFundamentalGroups:IG.0/adic-local-systems, with W(F_q)-coefficients).

**Proof or construction.**

1. Lattices: a unit-root convergent F^a-isocrystal is, locally on X, M ⊗ ℚ for a crystal M of finite locally free modules with Φ: (F^a)^*M ≅ M an isomorphism (Kedlaya, Notes, Remark 2.3 records that unit-root objects come from crystals of locally free modules; for the convergent/crystalline translation use convergent-f-isocrystals-are-crystalline (c)).
2. Katz's construction (the proof in Crew 1987, Theorem 2.1, and Katz's Proposition 4.1.1 are not publicly accessible; this outline is supplied here): on M/p^m the equation Φ(v) = v is solved étale-locally, because the Lang map g ↦ g^{−1} σ^a(g) on GL_r(W_m(k′)) is finite étale and surjective; the solutions form a locally constant sheaf T_m of free W_m(F_q)-modules of rank r, and T = lim T_m is a ℤ_q-local system with M ≅ T ⊗ O_crys compatibly with Φ = 1 ⊗ σ^a.
3. Conversely T ↦ T ⊗ O_crys with Φ = 1 ⊗ σ^a is a unit-root F^a-crystal; on Hom-spaces both constructions identify Hom(V, V′) with the Φ-fixed horizontal sections of the internal Hom, which gives full faithfulness; pass to isogeny categories and stackify on both sides (rational local systems are étale-locally of the form T[1/p]), using that convergent F^a-isocrystals on smooth X form an étale stack (Kedlaya, Notes, Definition 2.1 and the remark after it).
4. For X connected, the étale ℚ_q-local systems are continuous ℚ_q-representations of π_1^ét(X, x̄) (IG.0/adic-local-systems with IG.0/etale-fundamental-group).

**Examples and acceptance.**

- Point over F_p: the F-isocrystal (ℚ_p, Φ = u) with u ∈ ℤ_p^× is unit-root and corresponds to the character of Gal(F̄_p/F_p) sending the arithmetic Frobenius to u^{−1}: a Φ-fixed vector v of K̂^{ur} satisfies u σ(v) = v, so σ(v) = u^{−1} v.
- Non-example: (ℚ_p, Φ = p) over F_p has no non-zero Φ-fixed vector over K̂^{ur} (v_p(p σ(v)) = 1 + v_p(v)), consistently with its slope 1.
- Over an algebraically closed point the theorem is Dieudonné–Manin: unit-root F-isocrystals are ℚ_p-vector spaces tensored with K.

**Needs.** `RD.3/unit-root-f-isocrystal`, `RD.3/convergent-f-isocrystal`, `RD.3/convergent-f-isocrystals-are-crystalline`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/adic-local-systems`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`, `CrystallineCohomology:CR.1/isocrystal`, `CrystallineCohomology:CR.4/isocrystal-slope-decomposition`, Mathlib `WittVector.Isocrystal`, Mathlib `AlgebraicGeometry.Etale`.

**Sources.**

- [Kiran S. Kedlaya, *Notes on isocrystals*](https://arxiv.org/abs/1606.01321v6), Theorem 3.7, p. 6, and Remark 3.10, p. 7. States that unit-root objects of F-Isoc(X) are equivalent to étale ℚ_p-local systems, hence to continuous representations of the étale fundamental group for connected X, with the local model over k((t)), citing Crew 1987, Theorem 2.1.
- [Marco D'Addezio, *Parabolicity conjecture of F-isocrystals*](https://arxiv.org/pdf/2012.12879v4), Proposition 3.3.4 and its proof, p. 11. Uses Crew's theorem in the form: for every n, a fully faithful ℚ_{p^n}-linear ⊗-functor from lisse ℚ_{p^n}-sheaves to F^n-isocrystals with essential image the unit-root objects.
- [Kiran S. Kedlaya, *Notes on isocrystals*](https://arxiv.org/abs/1606.01321v6), Remark 2.3, p. 3. Notes that unit-root convergent F-isocrystals, unlike general ones, come from crystals of locally free modules.

## 7. Étesse's descent and direct-summand theorems

On smooth varieties overconvergence descends: a convergent direct summand of an overconvergent F-isocrystal is overconvergent, and overconvergent F-isocrystals glue along étale coverings. Both arguments compare A†_K with its completion through the henselian property of weak completions.

### Étesse: convergent direct summands of overconvergent F-isocrystals are overconvergent

**Theorem.** Node `RD.3/direct-summands-of-overconvergent-f-isocrystals`.

Let X be a smooth separated k-scheme of finite type. (1) If E ∈ F^a-Isoc†(X/K) and its image Ê ∈ F^a-Isoc(X/K) decomposes as Ê ≅ E_1 ⊕ E_2, then there are E_1†, E_2† ∈ F^a-Isoc†(X/K), unique up to isomorphism, with Ê_i† ≅ E_i and E ≅ E_1† ⊕ E_2†. (2) If E ≅ E_1† ⊕ E_2† and E′ ≅ E′_1† ⊕ E′_2† are two such objects and g: E → E′ is a morphism whose image ĝ is diagonal, ĝ = φ ⊕ ψ, then there are unique f_i: E_i† → E′_i† with g = f_1 ⊕ f_2 and ĝ = f̂_1 ⊕ f̂_2.

**Hypotheses and scope.**

- X smooth; Frobenius structures are part of the data (the proof uses the Monsky–Washnitzer description of frobenius-structure-forces-overconvergence).

**Proof or construction.**

1. Localise on X (Zariski stack, zariski-stack-of-overconvergent-isocrystals), so X = Spec A_0 smooth affine with lift A and Frobenius lift F on A†; by frobenius-structure-forces-overconvergence, E is a (σ,∇)-module N over A†_K and Ê corresponds to N ⊗ Â_K (Étesse 2002, §5.2, pp. 591–592).
2. Since (A†, πA†) is a henselian pair and A† is a Zariski ring (weak-completion-henselian-descent), finitely generated projective Â_K-modules descend uniquely to A†_K and summands of N ⊗ Â_K lift to summands M, P of N (Étesse, Proposition 6 and Corollaries 1–2, p. 586, by Elkik's approximation theorem); the decomposition is identified as M = M̂ ∩ N inside N ⊗ Â_K using A†_K = Â_K ∩ B for suitable faithfully flat extensions (Proposition 2 and its corollary, pp. 580–583).
3. The connection and Frobenius of N restrict to M because Ω^1 and the Frobenius pullbacks are compatible with these intersections (Corollary 2 (2)(iii)–(iv) and Propositions 9′ and 10′, pp. 590–592); this gives the affine case of (1) and (2), and the pieces glue by the Zariski stack property (Théorème 6 and its proof, p. 598).

**Examples and acceptance.**

- Degenerate splitting: Ê = Ê ⊕ 0 lifts to E ⊕ 0.
- Kummer pair (p odd, X = G_m): the direct sum of the Kummer F-isocrystals with a = 0 and a = 1/(p−1) is overconvergent, and its convergent decomposition lifts to the overconvergent decomposition.
- Non-example: a convergent subobject that is not a direct summand need not be overconvergent — the unit-root subobject of H^1 of the universal elliptic curve on the ordinary locus (RD.3/punctured-curve-boundary-acceptance; Berthelot (2.3.9)(iii)).

**Needs.** `RD.3/frobenius-structure-forces-overconvergence`, `RD.3/zariski-stack-of-overconvergent-isocrystals`, `RD.3/affine-frame-global-sections-equivalence`, `RD.3/convergent-f-isocrystal`, `RD.3/overconvergent-f-isocrystal`, `RD.3/weak-completion-henselian-descent`, `AdicSpacesPartII:F1/dagger-completion-comparison`.

**Sources.**

- [Jean-Yves Étesse, *Descente étale des F-isocristaux surconvergents et rationalité des fonctions L de schémas abéliens*](http://www.numdam.org/item/ASENS_2002_4_35_4_575_0/), Théorème 6 and its proof, p. 598; Proposition 6 with Corollaries 1–2, p. 586; Propositions 9′ and 10′, pp. 590–592. Proves that a direct summand, in the convergent category, of an overconvergent F^a-isocrystal on a smooth variety is overconvergent, uniquely, with the corresponding statement for morphisms, through the henselian property of Monsky–Washnitzer algebras and descent of projective modules and connections along A†_K ⊂ Â_K.

### Étesse: étale descent for overconvergent F-isocrystals

**Theorem.** Node `RD.3/etale-descent-of-overconvergent-f-isocrystals`.

Let X be a smooth separated k-scheme of finite type. (1) Every étale surjective morphism f: Y → X satisfies descent for overconvergent F^a-isocrystals: f^* induces an equivalence from F^a-Isoc†(X/K) to the category of objects of F^a-Isoc†(Y/K) with descent data relative to f (isomorphisms p_2^*E ≅ p_1^*E on Y ×_X Y satisfying the cocycle condition on Y ×_X Y ×_X Y). (2) If f: Y → X is étale, dominant and separated, F^a-Isoc†(X/K) is the 2-fibre product of F^a-Isoc(X/K) and F^a-Isoc†(Y/K) over F^a-Isoc(Y/K): a convergent F^a-isocrystal on X whose pullback to Y is overconvergent is overconvergent, uniquely, and similarly for morphisms. (3) The analogous fibre-product statements hold for an extension of the base field k ⊆ k′ (with K ⊆ K′ as in Étesse 1.1) and for the combination of both. (4) A proper surjective generically étale morphism f: Y → X also satisfies descent for overconvergent F^a-isocrystals.

**Hypotheses and scope.**

- X smooth and Frobenius structures present; the convergent descent results of Ogus (1984, Theorems 4.5 and 4.6) are used over a perfect closure of k.

**Proof or construction.**

1. Base change to an algebraic closure k′ of k: by Ogus's theorem the convergent F^a-isocrystal descends along f′ (imported, unread input) (Étesse 2002, proof of Théorème 1, p. 593).
2. On a dense affine open U = Spec A_0 ⊆ X with an affine open V = Spec B_0 of Y étale dominant over it, lift to A† → B† (finite-etale-lifting-of-mw-algebras) and use the intersection description A†_K = Â′_{K′} ∩ B†_K: a module over Â′_{K′} with connection and Frobenius whose base change to B̂′ comes from a (σ,∇)-module over B†_K comes from a unique (σ,∇)-module over A†_K (Étesse, Proposition 10, pp. 591–592, built on Propositions 2–9).
3. Glue the affine pieces: with a global frame through the equivalences of RD.3/independence-of-compactification and the gluing of coherent j†-modules (coherent-j-dagger-gluing); without one, along local frames (isocrystals-glued-from-local-frames, Berthelot (2.3.2)(iii)); Frobenius structures glue by the same uniqueness (pp. 593–595).
4. (2), (3) are proved the same way (Théorèmes 2, 2′, 2″, pp. 595–596); (4) combines Ogus's proper descent with (2) over a dense open where f is étale (Théorème 3, p. 596).

**Examples and acceptance.**

- Kummer descent (p odd, K ⊇ μ_{p−1}): along the finite étale Galois cover G_m → G_m, s ↦ s^{p−1} = t, with group μ_{p−1}, descent data on the unit object of G_m correspond to characters of μ_{p−1}, and descend to the Kummer F-isocrystals on G_m with ∇(1) = (m/(p−1)) dt/t and Frobenius t^m.
- Trivial cover: for f = id descent data are the identity and (1) is the identity functor.
- Zariski coverings are a special case, already covered by zariski-stack-of-overconvergent-isocrystals without smoothness or Frobenius.

**Needs.** `RD.3/finite-etale-lifting-of-mw-algebras`, `RD.3/frobenius-structure-forces-overconvergence`, `RD.3/affine-frame-global-sections-equivalence`, `RD.3/zariski-stack-of-overconvergent-isocrystals`, `RD.3/isocrystals-glued-from-local-frames`, `RD.3/coherent-j-dagger-gluing`, `RD.3/convergent-f-isocrystal`, `RD.3/independence-of-compactification`, `RD.3/overconvergent-f-isocrystal`, `AdicSpacesPartII:F1/dagger-completion-comparison`, Mathlib `AlgebraicGeometry.Etale`.

**Sources.**

- [Jean-Yves Étesse, *Descente étale des F-isocristaux surconvergents et rationalité des fonctions L de schémas abéliens*](http://www.numdam.org/item/ASENS_2002_4_35_4_575_0/), Théorèmes 1, 2, 2′, 2″, 3 and their proofs, pp. 592–596; Proposition 10, pp. 591–592. Proves étale descent, the fibre-product description along étale dominant morphisms and base field extensions, and descent along proper surjective generically étale morphisms for overconvergent F^a-isocrystals on smooth separated varieties, from Ogus's convergent descent and a Monsky–Washnitzer intersection argument.

## 8. Without Frobenius: Kummer isocrystals and a Liouville extension

Without Frobenius structures the restriction functor from overconvergent to convergent isocrystals is faithful but not full. The failure comes from exponents that are p-adic integers very well approximated by ordinary integers: the particular solution of an inhomogeneous Kummer equation then converges on the closed annulus but on no larger one.

### Kummer isocrystals K_a on G_m

**Construction.** Node `RD.3/kummer-isocrystal`. Proposed namespace `TauCeti.RigidCohomology`, module `TauCeti/RigidCohomology/Isocrystals/Overconvergent`.

On the frame (G_m, P^1_k, P̂^1_O) with coordinate t, for a ∈ ℤ_p let K_a be the free j†O_{P^1_K}-module of rank one on a generator e with ∇(e) = a e ⊗ dt/t. Global sections of j†O are the Laurent series Σ_{n∈ℤ} c_n t^n converging on some annulus ρ < |t| < 1/ρ, ρ < 1 (written K⟨t, t^{−1}⟩†), and the sections on the tube ]G_m[ = {|t| = 1} form K⟨t, t^{−1}⟩. Then: K_a is an overconvergent isocrystal on G_m; K_a ⊗ K_b ≅ K_{a+b} and K_a^∨ ≅ K_{−a}; K_a ≅ K_b if and only if a − b ∈ ℤ (an isomorphism K_b → K_a is e_b ↦ t^{b−a} e_a); the horizontal sections of K_a, over the tube or over a strict neighbourhood, are K·t^{−a} e if a ∈ ℤ and 0 otherwise; the pullback along t ↦ t^N is K_{Na}; and, for the Frobenius lift t ↦ t^p with σ = id on K, K_a admits a Frobenius structure if and only if (p − 1)a ∈ ℤ, the structure being multiplication by t^{(p−1)a}.

**Hypotheses and scope.**

- a ∈ ℤ_p is needed for convergence: for a ∉ ℤ_p the binomial coefficients binom(a, k) are unbounded and the connection is not even convergent.
- Frobenius structures are taken with σ = id on K (K ⊇ ℚ_p arbitrary) and the lift t ↦ t^p.

**API.**

- `Kummer.isoc` (constructor): For a ∈ ℤ_p, the rank-one overconvergent isocrystal K_a on G_m with ∇(e) = a e dt/t.
- `Kummer.tensor` (relation): K_a ⊗ K_b ≅ K_{a+b}, K_0 ≅ unit, K_a^∨ ≅ K_{−a}.
- `Kummer.iso_iff` (characterisation): K_a ≅ K_b iff a − b ∈ ℤ.
- `Kummer.horizontalSections` (simp): Γ(K_a)^{∇=0} is one-dimensional (spanned by t^{−a} e) if a ∈ ℤ and zero otherwise, over the tube and over strict neighbourhoods.
- `Kummer.pullback_pow` (functoriality): The pullback along t ↦ t^N is K_{Na}.
- `Kummer.frobenius_iff` (other): With the Frobenius lift t ↦ t^p and σ = id, K_a has a Frobenius structure iff (p − 1)a ∈ ℤ, namely multiplication by t^{(p−1)a}.

**Checks.**

- `Kummer.zero_eq_unit` (degenerate): K_0 is the unit object (j†O, d).
- `Kummer.one_iso_unit` (computation): K_1 ≅ K_0 via e ↦ t e, so isomorphism classes depend on a modulo ℤ.
- `Kummer.half_frobenius` (computation): For p odd, K_{1/2} has the Frobenius structure given by multiplication by t^{(p−1)/2}.
- `Kummer.no_sections_nonintegral` (characterisation): For a ∈ ℤ_p ∖ ℤ, K_a has no non-zero horizontal section even on the tube {|t| = 1}.
- `Kummer.not_convergent_outside_Zp` (non-example): For a = 1/p the formula ∇(e) = a e dt/t defines a module with connection on the annulus that is not convergent: |binom(1/p, k)| is unbounded.

**Uses.**

- Berthelot 96-03, (2.2.15)(ii)(b) and (2.3.8)(iii): basic examples of overconvergent isocrystals and of Kummer F-isocrystals, direct factors of the cohomology of Kummer coverings
- PadicDifferentialEquationsAndRigidCohomology:RD.3/liouville-extension-counterexample: K_λ with λ a p-adic Liouville-type exponent is the sub-object of the counterexample to full faithfulness without Frobenius
- PadicDifferentialEquationsAndRigidCohomology:RD.3/etale-descent-of-overconvergent-f-isocrystals: Kummer F-isocrystals arise by descent along the Kummer cover t = s^{p−1}
- PadicDifferentialEquationsAndRigidCohomology:RD.2: constant ∇-modules with exponent a over the Robba ring are the local models at 0 and ∞

**Proof or construction.**

1. Overconvergence: by taylor-series-convergence-criterion on the two affine charts (overconvergence is local on P, overconvergence-is-a-property (d)), ∂^{[k]} e = binom(a, k) t^{−k} e with |binom(a, k)| ≤ 1, so on {η ≤ |t| ≤ 1/η} the decay ‖∂^{[k]}e‖ λ^k ≤ (λ/η)^k → 0 holds for η > λ; the chart at ∞ is the same with −a.
2. Tensor, dual and pullback are computed on generators; an isomorphism K_b → K_a sends e_b to g e_a with t g′ = (b − a) g, so g = c t^{b−a}, a unit of K⟨t, t^{−1}⟩† exactly when a − b ∈ ℤ; horizontal sections are the case b = 0, where the Laurent coefficients satisfy (n + a) g_n = 0.
3. Frobenius: a horizontal Φ: F^*K_a → K_a, F^*K_a having ∇(1) = pa dt/t, is multiplication by some h with t h′ = a(p − 1) h, so h = c t^{a(p−1)}, analytic and invertible on annuli near |t| = 1 iff a(p − 1) ∈ ℤ (Berthelot 96-03 (2.3.8)(iii)).

**Examples and acceptance.**

- K_0 is the unit; K_1 ≅ K_0 through e ↦ t e.
- For p odd, K_{1/2} carries the Frobenius structure t^{(p−1)/2} (Kummer F-isocrystal of the double cover).

**Needs.** `RD.3/taylor-series-convergence-criterion`, `RD.3/overconvergence-is-a-property`, `RD.3/overconvergent-isocrystal`, `RD.3/frame`, Mathlib `PadicInt`.

**Sources.**

- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.2.15)(ii)(b), p. 67; (2.3.8)(iii), p. 76. Introduces the overconvergent module with ∇(1) = a t^{−1} dt on G_m ⊂ P^1 for a ∈ ℤ_p and proves that it carries a Frobenius structure iff a = m/(p − 1), m ∈ ℤ, given by multiplication by t^m.

### A p-adic Liouville-type exponent: p^n/(n + λ) tends to 0 but not geometrically

**Lemma.** Node `RD.3/liouville-exponent-sequence`.

There is λ ∈ ℤ_p ∖ ℤ such that the sequence f_n = p^n/(n + λ), n ≥ 1, satisfies |f_n| → 0 while for no ρ > 1 does |f_n| ρ^n → 0 (equivalently limsup |f_n|^{1/n} = 1). Explicitly one may take λ = −Σ_{k≥1} p^{m_k} with m_1 = 2, N_k = Σ_{j≤k} p^{m_j} and m_{k+1} = N_k − k; this λ is not rational. Consequently the power series Σ_{n≥1} f_n t^n lies in the Tate algebra K⟨t⟩ of the closed unit disc but not in its overconvergent subring K⟨t⟩† (nor in K⟨t, t^{−1}⟩†).

**Hypotheses and scope.**

- Any p ≥ 2; the choice of m_k only needs v_p(N_k + λ) − N_k → −∞ slowly enough that N_k ↦ v_p(N_k + λ)/N_k tends to 1.

**Proof or construction.**

1. The m_k increase strictly (m_2 = p² − 1 ≥ 3 and m_{k+1} ≥ p^{m_k} − k), and −λ has infinitely many non-zero and infinitely many zero p-adic digits, so λ ∉ ℤ and n + λ ≠ 0 for all n; since the gaps m_{k+1} − m_k tend to infinity, the digit expansion of −λ is not eventually periodic, so λ ∉ ℚ.
2. For n = N_k: N_k + λ = −Σ_{j>k} p^{m_j} has valuation m_{k+1} = N_k − k, so |f_{N_k}| = p^{−k} → 0 but |f_{N_k}| ρ^{N_k} = p^{−k} ρ^{N_k} → ∞ for every ρ > 1.
3. For N_k < n < N_{k+1} (with N_0 = 0): n + λ = (n − N_k) + (N_k + λ) with 0 < n − N_k < p^{m_{k+1}} ≤ p^{v_p(N_k+λ)}, so v_p(n + λ) = v_p(n − N_k) ≤ log_p n and |f_n| ≤ n p^{−n} → 0. This construction is supplied here; it realises the p-adic Liouville phenomenon referred to by Kedlaya (Notes, Remark 5.6).

**Examples and acceptance.**

- For p = 2: m_1 = 2, N_1 = 4, m_2 = 3, N_2 = 12, m_3 = 10: |f_4| = 2^{−1}, |f_{12}| = 2^{−2}, while 4 + λ ≡ 0 mod 2^3 and 12 + λ ≡ 0 mod 2^{10}.
- Contrast: for λ = −1/2 (p odd), v_p(n − 1/2) = v_p(2n − 1) ≤ log_p(2n), so |f_n| ≤ 2n p^{−n} and Σ f_n t^n converges for |t| < p: it is overconvergent. The numbers n − 1/2 are not all units (p divides 2n − 1 for n = (p + 1)/2); what matters is that v_p(n + λ) grows only logarithmically. In general Σ f_n t^n is overconvergent if and only if limsup_n v_p(n + λ)/n < 1, and no λ ∈ ℤ_p ∖ ℤ has |n + λ| bounded below, because ℕ is dense in ℤ_p.
- Contrast: for λ ∈ ℤ the sequence is undefined at n = −λ, which is why λ ∉ ℤ is required.

**Needs.** Mathlib `PadicInt`, Mathlib `Padic`, `RD.0/completion-versus-overconvergence`.

**Sources.**

- [Kiran S. Kedlaya, *Notes on isocrystals*](https://arxiv.org/abs/1606.01321v6), Remark 5.6, p. 13. States that without Frobenius structures the restriction functor from overconvergent to convergent isocrystals is not fully faithful, the failure being related to p-adic Liouville numbers (p-adic integers overly well approximated by ordinary integers), citing Abe (IMRN 2011) for a counterexample.
- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.1.2.2), p. 49. Characterises elements of the weak completion (hence of K⟨t⟩†) by coefficients bounded by c r^{|k|} with r < 1, which is the overconvergence condition violated here.

### Acceptance: without Frobenius, restriction from overconvergent to convergent isocrystals is not full

**Acceptance test.** Node `RD.3/liouville-extension-counterexample`.

Let λ ∈ ℤ_p ∖ ℤ be as in liouville-exponent-sequence and h = Σ_{n≥1} p^n t^n ∈ K⟨t⟩†. On (G_m, P^1_k, P̂^1_O) let M be the free j†O-module on e_1, e_2 with ∇e_2 = λ e_2 ⊗ dt/t and ∇e_1 = h e_2 ⊗ dt/t, an extension 0 → K_λ → M → O → 0 of the unit object by the Kummer isocrystal K_λ. Then M is an overconvergent isocrystal on G_m, Hom_{Isoc†(G_m/K)}(O, M) = 0, and Hom_{Isoc(G_m/K)}(O, M) = K·(e_1 + f e_2) with f = −Σ_{n≥1} p^n t^n/(n + λ). Hence the restriction functor Isoc†(G_m/K) → Isoc(G_m/K), which is faithful, is not full, and the extension M splits in Isoc(G_m/K) but not in Isoc†(G_m/K). No Frobenius structure exists on M (Kedlaya's full faithfulness theorem with Frobenius would forbid this behaviour).

**Hypotheses and scope.**

- The exponent λ must be a p-adic integer, so that M is overconvergent, and not an integer, so that the homogeneous equation has no solution; its Liouville property makes the particular solution f convergent but not overconvergent.

**Proof or construction.**

1. Overconvergence of M: on the chart at 0, ∂^{[k]}e_2 = binom(λ, k) t^{−k} e_2 and ∂^{[k]}e_1 = a_k e_2 with a_k = (1/k) Σ_{n≥1} p^n binom(n + λ − 1, k − 1) t^{n−k}, whose sup norm on {η ≤ |t| ≤ 1} is ≤ k η^{−k} because binom(n + λ − 1, k − 1) ∈ ℤ_p; so ‖∂^{[k]}e‖ λ_0^k → 0 for η > λ_0 and taylor-series-convergence-criterion applies; the chart at ∞ (s = 1/t, where h(1/s) = Σ p^n s^{−n} is bounded by 1 on |s| ≥ 1/p) is the same, and overconvergence is local on P (overconvergence-is-a-property (d)). The connection is defined on the strict neighbourhood {1/p < |t| < p}.
2. Horizontal sections: s = c e_1 + g e_2 is horizontal iff c is constant and t g′ + λ g = −c h, i.e. (n + λ) g_n = −c h_n for all n ∈ ℤ; as λ ∉ ℤ this forces g = c f.
3. Over the tube {|t| = 1} sections are Laurent series with coefficients tending to 0, and f qualifies (liouville-exponent-sequence), so Hom_{Isoc}(O, M) = K(e_1 + f e_2); over strict neighbourhoods sections are overconvergent Laurent series and f does not qualify, so c = 0 and Hom_{Isoc†}(O, M) = 0. Faithfulness of restriction is coherent-j-dagger-modules (c).
4. A Frobenius structure on M would induce one on the sub-object K_λ, which needs (p − 1)λ ∈ ℤ (kummer-isocrystal), impossible since λ ∉ ℚ (liouville-exponent-sequence); the counterexample is constructed here, Abe's published counterexample (IMRN 2011) not being publicly accessible.

**Examples and acceptance.**

- The map Hom_{Isoc†}(O, M) = 0 → Hom_{Isoc}(O, M) = K is injective (faithfulness) but not surjective.
- Replacing λ by an exponent with v_p(n + λ) = O(log n) (for instance λ = −1/2 with p odd, or any λ ∈ (ℚ ∩ ℤ_p) ∖ ℤ) makes f overconvergent and the two Hom-spaces agree; here limsup_n v_p(n + λ)/n = 1, so the failure is a Liouville phenomenon. No λ ∈ ℤ_p ∖ ℤ keeps |n + λ| bounded below, so the relevant condition is the growth of v_p(n + λ), not a lower bound.
- In the convergent category M ≅ O ⊕ K_λ, while in the overconvergent category the extension class of M is non-zero.

**Needs.** `RD.3/liouville-exponent-sequence`, `RD.3/kummer-isocrystal`, `RD.3/taylor-series-convergence-criterion`, `RD.3/overconvergence-is-a-property`, `RD.3/coherent-j-dagger-modules`, `RD.3/convergent-isocrystal`, `RD.3/overconvergent-isocrystal`, `RD.3/restriction-to-convergent`.

**Sources.**

- [Kiran S. Kedlaya, *Notes on isocrystals*](https://arxiv.org/abs/1606.01321v6), Remark 5.6, p. 13. Asserts that, without Frobenius structures, full faithfulness of restriction from overconvergent to convergent isocrystals fails, in connection with p-adic Liouville numbers (citing Abe); the explicit extension here is an instance.
- [Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*](https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf), (2.3.9)(i)–(ii), p. 77. Records that the restriction functor Isoc†(X/S) → Isoc(X/S) is faithful, reduces fullness to extending horizontal sections from the tube to a strict neighbourhood, and states that the general case was open (with the rank-one curve case known by Dwork–Robba and Crew).

## Proofs and corrections for the RD.3 targets of the main document

The targets below are stated in the RD.3 section of the main document. This part supplies their missing proofs, corrects a hypothesis where needed, and adds the dependencies these proofs create.

### `RD.3/weak-fibration-theorem`

*Open point.* Proof unpublished (main gap 'Weak and strong fibration theorems: proofs unpublished').

Proved in Berthelot 96-03, Théorème (1.3.2), p. 40 (and the remark after it for closed tubes of radius λ → 1): assume X closed in P and P′, P′ smooth over P, and the conormal sheaf of X in P′ ×_P X free on an affine covering; sections t_1, …, t_d lifting a regular sequence of generators give an étale map from P′ to the relative formal affine space P × Â^d near X, sending X to the zero section; by etale-tube-isomorphism the tube of X in P′ is the tube of the zero section, which is ]X[_P × D(0, 1^−)^d. The Poincaré-lemma consequence stated in the main node follows as there.

*Added dependencies:* `RD.3/etale-tube-isomorphism`.

### `RD.3/strong-fibration-theorem`

*Open point.* Proof unpublished (main gap); hypothesis on v to be made precise.

Proved in Berthelot 96-03, Théorème (1.3.7) with (1.3.4)–(1.3.5), pp. 41–45. The properness hypothesis is that v restricted to the closure X̄ of X in P′ ×_P Y is proper (for instance v proper); the local hypothesis is that sections t_1, …, t_d of the ideal of Y′ in P′ induce a basis, over X, of the conormal sheaf of Y′ in P′ ×_P Y (Berthelot asks for the basis over X only; the properness condition is the one on X̄), which holds locally by (1.3.8)(i) when P, P′ are affine, Z = Y ∩ V(g) and the conormal sheaf is free. Then the P-morphism ψ: P′ → P × Â^d defined by the t_i is étale near X, and etale-strict-neighbourhood-isomorphism applied to ψ gives the isomorphism of strict neighbourhoods; (1.3.8)(ii) identifies a strict neighbourhood upstairs with ⋃_n ([Y]_{λ_n} ∩ U_{η_n}) × D(0, λ_n^+)^d over the standard neighbourhood V_{λ,η} = ⋃_n ([Y]_{λ_n} ∩ U_{η_n}): a union of products whose polydisc radius λ_n tends to 1. Over a point of the tube ]X[_P the fibre is the open polydisc D(0, 1^−)^d, but over a point of V_{λ,η} outside the tube it is a closed polydisc of radius < 1; the main node's isomorphism "V′ ≅ V × D(0,1^−)^n over V" is to be read in this sense, which is what Berthelot proves and what its consequences (sections over strict neighbourhoods, the cohomology and isocrystal comparisons) use.

*Added dependencies:* `RD.3/etale-strict-neighbourhood-isomorphism`, `RD.3/standard-strict-neighbourhoods`.

### `RD.3/strict-neighbourhood`

*Open point.* Primary source for the definition.

Berthelot 96-03 (1.2.1) defines a strict neighbourhood by admissibility of the covering (V, ]Z[) of ]Y[; the affinoid criterion used as the main node's definition is (1.2.2), and the further structure (standard neighbourhoods, intersections, unions, pullbacks) is standard-strict-neighbourhoods.

*Added dependencies:* none.

### `RD.3/j-dagger`

*Open point.* Primary source.

Berthelot 96-03 (2.1.1), pp. 47–48, defines j† as the colimit over strict neighbourhoods and proves its basic formulas; see j-dagger-exactness-and-functoriality.

*Added dependencies:* none.

### `RD.3/j-dagger-properties`

*Open point.* Exactness hypotheses.

Exactness of j† (part (c)) holds on all sheaves of modules on a strict neighbourhood, with no coherence or quasi-Stein hypothesis (Berthelot 96-03 (2.1.3)(iii), p. 50); the tensor formula and the localisation on X are j-dagger-exactness-and-functoriality. Parts (a)–(b) keep their quasi-Stein hypotheses.

*Added dependencies:* `RD.3/j-dagger-exactness-and-functoriality`.

### `RD.3/overconvergent-sections-of-affine-frame`

*Open point.* Theorems A/B gap for modules on affine frames.

The node's identity Γ = A† ⊗ K is Berthelot 96-03 (2.1.2.4), p. 50; the module-level statement (coherent j†O-modules and overconvergent isocrystals on the Monsky–Washnitzer frame are determined by their global sections over A†_K) is affine-frame-global-sections-equivalence, proved in (2.5.2) without Theorem B for the frame.

*Added dependencies:* none.

### `RD.3/overconvergent-isocrystal`

*Open point.* Hypothesis notes: local freeness, and attribution of automatic convergence.

Local freeness of coherent j†O-modules with connection is Berthelot 96-03 (2.2.3)(ii); uniqueness of ε and the cocycle condition are (2.2.7)(i) (overconvergence-is-a-property). The automatic convergence with Frobenius is Théorème (2.5.7) of the 96-03 preprint (circulated since 1991 and publicly available), cited by Kedlaya as [Be4]; it is frobenius-structure-forces-overconvergence (affine case).

*Added dependencies:* none.

### `RD.3/overconvergent-isocrystal-connection-form`

*Open point.* Primary source of the equivalence.

Berthelot 96-03 (2.2.6) (overconvergence via an isomorphism on a strict neighbourhood of the diagonal tube) and (2.2.13) (the coordinate criterion) prove this lemma; see overconvergence-is-a-property (b) and taylor-series-convergence-criterion.

*Added dependencies:* `RD.3/overconvergence-is-a-property`, `RD.3/taylor-series-convergence-criterion`.

### `RD.3/taylor-comparison-of-pullbacks`

*Open point.* Primary source.

Berthelot 96-03 (2.2.17), pp. 67–68: the isomorphism χ is h_K^*(ε) for h = (u, u′): P′ → P ×_S P, horizontal, with the transitivity (2.2.17.3) from the cocycle condition on the triple product; uniqueness of ε (overconvergence-is-a-property (c)) makes it canonical.

*Added dependencies:* `RD.3/overconvergence-is-a-property`.

### `RD.3/frame-pullback-functor`

*Open point.* Morphisms that do not extend to the formal schemes.

When v does not extend to a morphism of the ambient formal schemes, replace P′ by P ×_S P′ with the graph embedding (Berthelot 96-03 (2.3.2)(iv), pp. 71–72); the general pullback is part of isocrystals-glued-from-local-frames (c).

*Added dependencies:* none.

### `RD.3/independence-of-frame`

*Open point.* Proof relied on the unpublished strong fibration theorem and on gluing (main gaps).

Part (a) is Berthelot 96-03 Théorème (2.3.1), pp. 68–69: localise on P and on X (overconvergence-is-a-property (d), coherent-j-dagger-gluing), reduce by the strong fibration theorem (etale-strict-neighbourhood-isomorphism applied to ψ: P′ → P × Â^d) to P′ = P × Â^d with the zero section s; s_K^* is a left quasi-inverse and u_K^* s_K^* ≅ id by RD.3/taylor-comparison-of-pullbacks because s ∘ u and id agree on Y. Part (b) is (2.3.2)(i), p. 69, by the diagonal embedding; the case without a global embedding is isocrystals-glued-from-local-frames.

*Added dependencies:* `RD.3/etale-strict-neighbourhood-isomorphism`, `RD.3/overconvergence-is-a-property`, `RD.3/coherent-j-dagger-gluing`.

### `RD.3/independence-of-compactification`

*Open point.* Proof relied on unpublished gluing (main gap).

Berthelot 96-03 Théorème (2.3.5), pp. 73–74. Reduction to v projective: Berthelot uses Raynaud–Gruson I, Corollaire 5.7.14 (p. 52: an X-admissible blow-up Y″ → Y′ with Y″ → Y quasi-projective, hence projective); equivalently apply SchemeAndStackFoundations:SF.4/modification-domination twice (X-admissible blow-ups Y″ → Y through Y′ and Y‴ → Y′ through Y″) and use that equivalences of categories satisfy the two-out-of-six property. Projective case: the statement is local on Y (gluing, isocrystals-glued-from-local-frames), so Y is affine with a closed immersion into P smooth near X; embed Y′ in P^N_P, localise on X so that X = Y′ ∩ D(s) and the ideal of X in D(s) is generated by a regular sequence lifted to sections t_i of O(md); the zero scheme T of the t_i is étale over P at X and contains the closure of X, and etale-strict-neighbourhood-isomorphism for T → P and T² → P² gives the equivalence.

*Added dependencies:* `RD.3/etale-strict-neighbourhood-isomorphism`, `RD.3/standard-strict-neighbourhoods`, `RD.3/isocrystals-glued-from-local-frames`, `SchemeAndStackFoundations:SF.4/modification-domination`.

### `RD.3/overconvergent-isocrystals-of-a-variety`

*Open point.* Gluing well-definedness and stack property (main gap).

The gluing construction and its independence of choices are isocrystals-glued-from-local-frames (Berthelot 96-03 (2.3.2)(iii), with the step Berthelot leaves to the reader supplied there); the Zariski stack property is zariski-stack-of-overconvergent-isocrystals. Étale descent is established only with Frobenius structures on smooth X (etale-descent-of-overconvergent-f-isocrystals); the API item IsocDagger.isStack is to be read for the Zariski topology, the étale statement holding for F-isocrystals on smooth X.

*Added dependencies:* `RD.3/isocrystals-glued-from-local-frames`.

### `RD.3/overconvergent-f-isocrystal`

*Open point.* Primary source and attribution.

Definition as in Berthelot 96-03 (2.3.7), pp. 75–76: base change along σ followed by pullback along the Frobenius of (X, Y), with internal Hom and Tate twists (2.3.8)(i); the remark that Frobenius forces the convergence condition is Théorème (2.5.7) of the same preprint (frobenius-structure-forces-overconvergence).

*Added dependencies:* `RD.3/isocrystals-glued-from-local-frames`.

### `RD.3/affine-smooth-description-of-overconvergent-f-isocrystals`

*Open point.* Theorems A/B and automatic overconvergence (main gaps).

This is Berthelot 96-03 Corollaire (2.5.8), p. 89: combine affine-frame-global-sections-equivalence ((2.5.2)), the functoriality in the lift mw-pullback-realises-frame-pullback ((2.5.6)) and frobenius-structure-forces-overconvergence ((2.5.7)).

*Added dependencies:* `RD.3/affine-frame-global-sections-equivalence`, `RD.3/mw-pullback-realises-frame-pullback`, `RD.3/frobenius-structure-forces-overconvergence`.

### `RD.3/restriction-to-convergent`

*Open point.* Target category requested from CrystallineCohomology:CR.3; Frobenius-bearing crystalline model.

The target is the RD.3-owned convergent category convergent-f-isocrystal (Berthelot 96-03 (2.3.2), (2.3.7)); restriction is exact and faithful ((2.2.9), (2.3.9)(i)). The comparison with crystals up to isogeny carrying an invertible Frobenius is convergent-f-isocrystals-are-crystalline, which uses the existing CrystallineCohomology:CR.1/isocrystal, CR.1/crystal and CR.1/taylor-equivalence nodes; nothing further is needed from CR.3 for this node.

*Added dependencies:* `RD.3/convergent-isocrystal`, `RD.3/convergent-f-isocrystal`, `RD.3/convergent-f-isocrystals-are-crystalline`.

### `RD.3/finite-etale-pushforward-of-isocrystals`

*Open point.* Global construction relied on Tsuzuki (Duke 2002), not public (main gap).

Construction from public sources: on a smooth affine X with lift A and Frobenius lift, a finite étale X′ → X lifts to a finite étale A† → B† with compatible Frobenius (finite-etale-lifting-of-mw-algebras); for a (σ,∇)-module M over B†_K, f_*M is M viewed over A†_K (Kedlaya, Finiteness, Definition 3.4.2) with the connection through Ω^1_{B†_K} ≅ B†_K ⊗ Ω^1_{A†_K} and the Frobenius of B†; it is a (σ,∇)-module, hence an overconvergent F-isocrystal (frobenius-structure-forces-overconvergence), independent of the lifts up to canonical isomorphism (mw-pullback-realises-frame-pullback), and these local pushforwards glue in the Zariski stack (zariski-stack-of-overconvergent-isocrystals). The convergent version is the same over Â_K with Kedlaya's Definition 2.1 (convergent-f-isocrystal). Restriction of scalars is right adjoint to f^* and, B†_K being finite étale, also left adjoint through the trace; H^0_F(X, f_*E) = Hom(O_X, f_*E) = Hom(f^*O_X, E) = H^0_F(X′, E); ranks multiply by the degree d since B†_K is projective of rank d over A†_K.

*Added dependencies:* `RD.3/finite-etale-lifting-of-mw-algebras`, `RD.3/frobenius-structure-forces-overconvergence`, `RD.3/mw-pullback-realises-frame-pullback`, `RD.3/zariski-stack-of-overconvergent-isocrystals`, `RD.3/convergent-f-isocrystal`.

### `RD.3/full-faithfulness-requires-frobenius`

*Open point.* Abe's counterexample not read (main gap).

An explicit counterexample is now an RD.3 acceptance node: liouville-extension-counterexample gives an overconvergent isocrystal M on G_m (an extension of the unit by a Kummer isocrystal with a p-adic Liouville-type exponent) with Hom_{Isoc†}(O, M) = 0 and Hom_{Isoc}(O, M) = K. Abe's own example (IMRN 2011) remains unread.

*Added dependencies:* `RD.3/liouville-extension-counterexample`.

### `RD.3/punctured-curve-boundary-acceptance`

*Open point.* Source for part (b), ordinary locus.

Berthelot 96-03 (2.3.9)(iii), pp. 77–78, gives the argument that the unit-root sub-F-isocrystal of R^1 of the universal ordinary elliptic curve is not overconvergent, even as an isocrystal: by Crew's characterisation of overconvergent unit-root rank-one objects through finite local monodromy and Igusa's theorem, together with faithfulness of restriction; unit-root objects are unit-root-f-isocrystal and their p-adic representations crew-unit-root-correspondence.

*Added dependencies:* `RD.3/unit-root-f-isocrystal`, `RD.3/crew-unit-root-correspondence`.

## Dependencies

*Inside the roadmap.* Section 1 rests on `RD.3/tube` and `RD.3/strict-neighbourhood`; section 2 on `RD.3/j-dagger`; section 3 on `RD.3/overconvergent-isocrystal`, `RD.3/weak-fibration-theorem`, `RD.3/strong-fibration-theorem`, `RD.3/independence-of-frame`, `RD.3/taylor-comparison-of-pullbacks` and `RD.3/frame-pullback-functor`; section 4 on `RD.3/overconvergent-sections-of-affine-frame`, `RD.3/sigma-nabla-module-over-dagger-algebra`, `RD.3/independence-of-compactification` and RD.0's `RD.0/frobenius-lift-on-dagger-algebra` and `RD.0/change-of-frobenius-lift-taylor-formula`; sections 5–7 on `RD.3/overconvergent-f-isocrystal`; section 8 on `RD.0/completion-versus-overconvergence`. The RD.5 targets `RD.3/full-faithfulness-requires-frobenius` and `RD.3/punctured-curve-boundary-acceptance` now use sections 6 and 8. No target of this document uses RD.4 or any subsequent layer.

*Other roadmaps.* AdicSpacesPartII (R0, R2, R3, F1), SchemeAndStackFoundations (SF.0 henselian pairs, SF.4 domination of modifications), PerfectoidSpaces (P3 Elkik approximation), CrystallineCohomology (CR.0, CR.1, CR.4) and InverseGaloisAndArithmeticFundamentalGroups (IG.0), all of lower tier. No request to another roadmap is needed.

*Consumers.* RD.4 (rigid cohomology is computed on realisations and glued), RD.5 (finiteness, relative cohomology, full faithfulness, and the abelian-scheme and liftable-family overconvergence proposed there), RD.7 (crystalline comparison with coefficients), ColemanIntegration (Monsky–Washnitzer description and Frobenius on dagger algebras), and PadicHodgeTheory (underlying bundles of F-isocrystals and crystalline local systems).

## Gaps

### Ogus's convergent-site theorems are used as stated, not read

Three inputs rest on A. Ogus, 'F-isocrystals and de Rham cohomology II — convergent isocrystals' (Duke 1984) and 'The convergent topos in characteristic p' (Grothendieck Festschrift III, 1990), neither publicly accessible: (i) Proposition 7.3 of the 1990 paper, giving a crystal M with N ≅ M ⊗ ℚ, used in the essential surjectivity part of Berthelot 96-03 (2.4.2); (ii) Example 2.7.3, Proposition 2.18, Remark 2.8.1, Theorem 2.15 and Proposition 2.21 of the 1984 paper, used by Guo–Reinecke (Remark 2.15, Proposition 2.17) for the convergent site and the ramified underlying bundle; (iii) Theorems 4.5 and 4.6 of the 1984 paper (descent of convergent F-isocrystals along étale surjective and proper surjective generically étale maps over a perfect field), used by Étesse's Théorèmes 1 and 3. Full faithfulness in (2.4.2)(a) is proved by Berthelot and is not affected. NEXT ACTION: obtain Ogus's papers, or replace (i) by a public proof that a convergent F-isocrystal on a smooth affine has a Frobenius-stable lattice up to twist, and (iii) by a public descent argument for convergent F-isocrystals.

*Affected targets:* `RD.3/convergent-f-isocrystals-are-crystalline`, `RD.3/underlying-bundle-of-convergent-isocrystal`, `RD.3/etale-descent-of-overconvergent-f-isocrystals`.

### Crew's and Katz's proofs of the unit-root correspondence not read

Kedlaya (Notes, Theorem 3.7) and D'Addezio (proof of Proposition 3.3.4) cite R. Crew, PSPM 46 (1987), Theorem 2.1, which builds on Katz's Proposition 4.1.1 (LNM 350); neither is publicly accessible. The node gives the standard Lang-torsor outline (étale-local solvability of Φ(v) = v modulo p^m, the inverse limit ℤ_q-local system, the quasi-inverse T ↦ T ⊗ O_crys) and identifies the lattice input through Kedlaya's Remark 2.3. NEXT ACTION: read Crew 1987 or Katz 1973, or refine the outline into lemma-level nodes (Lang's theorem for GL_r over W_m, existence of Φ-stable lattices for unit-root objects).

*Affected targets:* `RD.3/crew-unit-root-correspondence`.

### Abe's published counterexample not read

T. Abe, 'Some notes on Tsuzuki's full faithfulness conjecture', IMRN 2011, 4747–4755, cited by Kedlaya (Notes, Remark 5.6), has no public copy. The acceptance node supplies its own explicit counterexample (an extension of the unit object by a Kummer isocrystal with a p-adic Liouville-type exponent), proved completely from Berthelot's coordinate criterion; the relation with Abe's example is not checked. NEXT ACTION: compare with Abe's paper when available.

*Affected targets:* `RD.3/liouville-extension-counterexample`.

## Corrections to the sources

### Pierre Berthelot, Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991): (2.3.2)(iii), p. 71 (IRMAR 96-03, version provisoire 1991) (gap)

*In the source.* When Y has no global embedding, the category of isocrystals overconvergent along Y − X is defined by gluing along a covering with local embeddings, and the reader is left to check that it does not depend on the choices made.

*Correction.* Independence follows by passing to a common refinement embedded in the products P_α ×_S P′_β, using the frame-independence equivalences on each piece and the uniqueness and transitivity of the Taylor comparison isomorphisms; the argument is written out in isocrystals-glued-from-local-frames.

*Why.* The step is needed for the gluing construction to define a category up to canonical equivalence, on which the independence of the compactification (2.3.5) and the definition (2.3.6) rely.

*Reach.* the proof. *Already known:* Kedlaya (Notes on isocrystals, Lemma 2.6) points to Le Stum, Rigid Cohomology (2007), Theorem 7.1.8, for a complete treatment of the related independence statement; that book is not in the cleared library and was not read.

*Verified at the locator.* At (2.3.2)(iii), p. 71, Berthelot leaves to the reader the independence of the glued category from the covering and the local embeddings; the argument written out in isocrystals-glued-from-local-frames (common refinement in the products P_α ×_S P′_β, the frame-independence equivalences and the uniqueness and transitivity of the Taylor comparison isomorphisms) is correct. The step is routine but it is not proved in the source, so "gap" with effect on the proof is the right classification.

### Pierre Berthelot, Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991): Proof of (2.3.5), p. 73 (misprint)

*In the source.* The proof invokes the local nature in X of the category of isocrystals overconvergent along Y − X with the cross-reference (2.2.17).

*Correction.* The locality in X is the remark after (2.2.11) (together with (2.3.3)(i)); (2.2.17) concerns two morphisms with the same restriction to Y′.

*Why.* (2.2.17) constructs the comparison isomorphism between pullbacks along morphisms agreeing on Y′ and says nothing about restriction to opens of X; the stack statement used here is the remark after (2.2.11).

*Reach.* nothing. *Already known:* new.

*Verified at the locator.* The proof of (2.3.5), p. 73, appeals to the local nature in X of overconvergent isocrystals with the cross-reference (cf. (2.2.17)); in the text read, (2.2.17) (pp. 67–68) compares pullbacks along two morphisms agreeing on Y′, while locality in X is the remark after (2.2.11) (p. 64) and (2.3.3)(i) (p. 72). A wrong cross-reference whose intended target is clear: a misprint that affects nothing.

### Pierre Berthelot, Géométrie rigide et cohomologie des variétés algébriques de caractéristique p: (4.3), Théorème 5, p. 30 (gap)

*In the source.* The survey states that the relative rigid cohomology sheaves of a proper smooth family over a smooth base with a suitable proper formal lift are overconvergent F-crystals, without proof or reference.

*Correction.* The statement is proved in Tsuzuki, 'On base change theorem and coherence in rigid cohomology', Documenta Math. Extra Volume Kato (2003), Theorem 4.1.1, pp. 906–908, which attributes it to Berthelot.

*Why.* Mém. SMF 23 is a survey announcing results of the then unwritten preprint; the theorem is used by Étesse (2002, proof of Théorème 7) through this citation.

*Reach.* the proof. *Already known:* Tsuzuki 2003, Theorem 4.1.1 (and Shiho, Relative log convergent cohomology I, Introduction, recording the status).

*Verified at the locator.* Mém. SMF 23, Théorème 5, p. 30, states the overconvergence of R^i f_* for a proper smooth family with a suitable proper formal lift without proof; Tsuzuki 2003 introduces Theorems 4.1.1 and 4.1.4 as due to Berthelot [4, Théorème 5] and proves Theorem 4.1.1 on pp. 906–908, and Shiho (arXiv:0707.1742v2, Introduction) records the liftable case as known. A survey announcement without proof, later proved: the classification as a gap with a known correction is right.

## Atlas structure and placement

Two results listed among RD.3's open items are statements about overconvergent coefficients but their proofs need relative rigid cohomology R^q f_rig*, its coherence and base change (Tsuzuki 2003, §§2–3, Theorem 3.3.1), which is downstream of RD.3: Berthelot's Théorème 5 (Mém. SMF 23, p. 30, stated without proof; proved as Tsuzuki 2003, Theorem 4.1.1, pp. 906–908) and Étesse's Théorème 7 (pp. 599–600). Étesse's proof also uses Zarhin's trick, whose atlas owner ArakelovGeometryAndAbelianHeights:R35.6 is in tier 16 and cannot be cited from tier 12, and Siegel moduli with level structure (AlgebraicModuliForArithmeticGeometry:R09.4, tier 4).

*Proposal.* Plan both at RD.5 (finiteness and relative cohomology): (i) for a proper smooth f: X → S of smooth k-schemes admitting a proper formal lift smooth over a smooth formal lift of S (Tsuzuki's 'liftable' situation), R^q f_rig* E is an overconvergent isocrystal for every overconvergent E, compatible with base change and zero for q > 2 dim(X/S); (ii) for an abelian scheme f: A → S over a smooth separated k-scheme and e ≤ p − 1, the convergent F-isocrystal (R^i f_cris* O)^an extends to an overconvergent F-isocrystal, by polarisation, level structure, Zarhin's trick, (i) on the universal family and descent along the finite étale level cover, consuming RD.3/direct-summands-of-overconvergent-f-isocrystals, RD.3/etale-descent-of-overconvergent-f-isocrystals and RD.3/f-crystal-to-convergent-f-isocrystal. Zarhin's trick moves down: plan it in the tier-6 roadmap AbelianSchemesAndArithmeticModuli (or at RD.5 as a stated input) and point R35.6 at the new owner.

RD.3 has 22 targets in the main document and 27 in this part, falling into three blocks; one star cannot show their structure.

*Proposal.* Sub-layers for the atlas, keeping the stage RD.3: RD.3a 'Tubes, strict neighbourhoods and j†' (frame, tube, strict-neighbourhood, standard-strict-neighbourhoods, etale-tube-isomorphism, etale-strict-neighbourhood-isomorphism, weak- and strong-fibration-theorem, j-dagger, j-dagger-properties, j-dagger-exactness-and-functoriality, coherent-j-dagger-modules, coherent-j-dagger-gluing); RD.3b 'Overconvergent isocrystals' (overconvergent-isocrystal and its connection form, overconvergence-is-a-property, taylor-series-convergence-criterion, frame-pullback-functor, taylor-comparison-of-pullbacks, independence-of-frame and of-compactification, isocrystals-glued-from-local-frames, zariski-stack-of-overconvergent-isocrystals, overconvergent-isocrystals-of-a-variety, overconvergent-f-isocrystal, the Monsky–Washnitzer nodes, weak-completion-henselian-descent, finite étale lifting and pushforward, Étesse's descent and direct summands, kummer-isocrystal, the Liouville nodes, affine-space-two-embeddings-acceptance); RD.3c 'Convergent and unit-root F-isocrystals' (convergent-isocrystal, convergent-f-isocrystal, f-crystal-to-convergent-f-isocrystal, convergent-f-isocrystals-are-crystalline, underlying-bundle-of-convergent-isocrystal, restriction-to-convergent, unit-root-f-isocrystal, crew-unit-root-correspondence). The planets would then be Frame and Tube (RD.3a), Berthelot's j† functor, Independence of the frame and Overconvergent F-isocrystal (RD.3b), Convergent F-isocrystal (RD.3c).

## Sources read

- Pierre Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres. Première partie (version provisoire 1991)*, Prépublication IRMAR 96-03, Université de Rennes 1, January 1996 (author's copy, archived copy of the author's Rennes page); page numbers are the global page numbers printed at the foot of each page, which equal the PDF page numbers (the running heads number pages by chapter, so p. 39 is 1.15). <https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf> Read: Avant-propos (pp. 5–6); §1.2 (1.2.0)–(1.2.12), pp. 32–39; §1.3 (1.3.1)–(1.3.10) with proofs, pp. 39–46; §2.1 (2.1.1)–(2.1.12), pp. 47–58; §2.2 (2.2.1)–(2.2.17), pp. 58–68; §2.3 (2.3.1)–(2.3.9), pp. 68–78; §2.4 (2.4.1)–(2.4.2), pp. 78–81; §2.5 (2.5.1)–(2.5.8), pp. 81–89.
- Pierre Berthelot, *Géométrie rigide et cohomologie des variétés algébriques de caractéristique p*, Mém. Soc. Math. France (N.S.) 23 (1986), 7–32. <https://www.numdam.org/article/MSMF_1986_2_23__R3_0.pdf> Read: (4.2.3)–(4.3) with Théorème 5, pp. 28–30.
- Kiran S. Kedlaya, *Notes on isocrystals*, arXiv:1606.01321v6 (11 January 2022); J. Number Theory 237 (2022). <https://arxiv.org/abs/1606.01321v6> Read: §2 (Definition 2.1 – Remark 2.13), pp. 2–5; §3 (Definition 3.1 – Theorem 3.14), pp. 5–8; §5 (Theorem 5.1 – Remark 5.13), pp. 11–14; §§6–7 headings and Theorem 6.3, pp. 14–16.
- Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, arXiv:math/0208027v6; Duke Math. J. 134 (2006). <https://arxiv.org/abs/math/0208027v6> Read: §3.4 (Definitions 3.4.1–3.4.2, Propositions 3.4.3–3.4.5), pp. 23–24; §4.1–4.3 (Definitions 4.1.1–4.3.1, Remarks 4.2.4–4.3.3), pp. 24–27.
- Jean-Yves Étesse, *Descente étale des F-isocristaux surconvergents et rationalité des fonctions L de schémas abéliens*, Ann. Sci. École Norm. Sup. (4) 35 (2002), 575–603. <http://www.numdam.org/item/ASENS_2002_4_35_4_575_0/> Read: Introduction, pp. 575–577; §1.1–1.3 and Propositions 1–2′, pp. 577–583; §§2–4 (Propositions 3–9′), pp. 583–590; §5 (5.1–5.2, Propositions 10–10′), pp. 590–592; Part II, Théorèmes 1–6, pp. 592–598; Part III, Théorème 7 and its proof, pp. 599–600.
- Haoyang Guo, Emanuel Reinecke, *A prismatic approach to crystalline local systems*, arXiv:2203.09490v3 (published version Invent. Math. 2024; page numbers here are those of the arXiv version). <https://arxiv.org/abs/2203.09490v3> Read: §2.2 (Definitions 2.6–2.7, Definition 2.8 – Proposition 2.17, Definition 2.18), pp. 13–17.
- Marco D'Addezio, *Parabolicity conjecture of F-isocrystals*, arXiv:2012.12879v4 (8 February 2023). <https://arxiv.org/pdf/2012.12879v4> Read: §2.2 with footnote 2, p. 6; §3.1–3.3 (Definition 3.1.2 – Corollary 3.3.6), pp. 7–11.
- Bruno Chiarellotto, Nobuo Tsuzuki, *Cohomological descent of rigid cohomology for étale coverings*, Rend. Sem. Mat. Univ. Padova 109 (2003), 63–215. <https://www.numdam.org/item/RSMUP_2003__109__63_0/> Read: §2.6–2.12 (statements and the proof of 2.10.2), pp. 78–90.
- Nobuo Tsuzuki, *On base change theorem and coherence in rigid cohomology*, Documenta Math. Extra Volume Kato (2003), 891–918 (EMS Press copy). <https://ems.press/books/dms/250/4910> Read: Introduction, pp. 891–893; §4.1, Theorem 4.1.1 with its proof, pp. 906–908.
- Atsushi Shiho, *Relative log convergent cohomology and relative rigid cohomology I*, arXiv:0707.1742v2 (21 May 2008). <https://arxiv.org/abs/0707.1742v2> Read: Introduction, pp. 1–2 (status of Berthelot's conjecture on relative rigid cohomology).
- Michel Raynaud, Laurent Gruson, *Critères de platitude et de projectivité. Techniques de « platification » d'un module*, Invent. Math. 13 (1971), 1–89 (GDZ scan, cleared atlas library copy). Read: §5.7, Corollaire 5.7.14, p. 52 (read from the page image).
- Jean-Yves Étesse, *Relèvement de schémas et algèbres de Monsky–Washnitzer : théorèmes d'équivalences et de pleine fidélité*, Rend. Sem. Mat. Univ. Padova 107 (2002), 111–138. <http://www.numdam.org/item/RSMUP_2002__107__111_0/> Read: Introduction and §I.1–I.2 (Propositions 1–2, Théorèmes 3–4), pp. 111–117.
- Renée Elkik, *Solutions d'équations à coefficients dans un anneau hensélien*, Ann. Sci. École Norm. Sup. (4) 6 (1973), 553–603. <http://www.numdam.org/item/ASENS_1973_4_6_4_553_0/> Read: §III.1, Théorème 3 with its proof, Corollaire 1, Lemme and Corollaire, pp. 568–574; §4, Théorème 6 and the beginning of its proof, p. 580.

Not read (no public copy, or not cleared): T. Abe, Some notes on Tsuzuki's full faithfulness conjecture, IMRN 2011, 4747–4755 (NOT read: no public copy found; replaced by the explicit counterexample of liouville-extension-counterexample); A. Ogus, F-isocrystals and de Rham cohomology II — convergent isocrystals, Duke Math. J. 51 (1984); The convergent topos in characteristic p, Grothendieck Festschrift III (1990) (NOT read: not publicly accessible; used only through the statements quoted by Berthelot, Kedlaya, Guo–Reinecke and Étesse); R. Crew, F-isocrystals and p-adic representations, Proc. Symp. Pure Math. 46 (1987), Theorem 2.1 (NOT read: not publicly accessible; statement taken from Kedlaya, Notes, Theorem 3.7, and D'Addezio, proof of Proposition 3.3.4); N. Tsuzuki, Morphisms of F-isocrystals and the finite monodromy theorem for unit-root F-isocrystals, Duke Math. J. 111 (2002) (NOT read: subscription only; its finite étale pushforward is replaced by the construction given for RD.3/finite-etale-pushforward-of-isocrystals); B. Le Stum, Rigid Cohomology, Cambridge Tracts in Math. 172 (2007) (NOT read: not in the cleared library; Berthelot's 96-03 preprint is used instead).
