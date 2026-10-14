# P-adic differential equations and rigid cohomology: RD.5 follow-up — descent, duality, docility and the open finiteness targets

This document plans the part of layer RD.5 (finiteness, duality and Künneth) of *P-adic differential equations, rigid cohomology and p-adic weights* that its first pass left open. The first pass plans Kedlaya's proof of finiteness of rigid cohomology with coefficients: the relative local monodromy theorem over dagger algebras, finiteness on curves (Monsky, Crew, van der Put), generic pushforwards and dévissage to affine space, alterations and descent, compact supports, Poincaré duality on affine space and in general, and the Künneth formulas; it also carries seven mixed full-faithfulness targets with RD.3-prefixed ids and the finite-étale affine-cover theorem. This part builds on those nodes and cites them by id.

It plans what the first pass recorded as gaps or as open targets: proper cohomological descent, through Le Stum's overconvergent site and Zureick-Brown's proof, in place of the unread Tsuzuki 2003; Berthelot's trace morphism, his lemma on homomorphisms out of overconvergent germs, compact-support Gysin maps, finite étale traces, the duality morphism with its morphism of triangles and the Künneth pairings on product tubes, read from the author's copy of Berthelot's *Dualité* note, in place of the unread Tsuzuki 1999; the dimension 2g + d − 1 of H¹ of an affine curve; Crew's nonarchimedean duality on the Robba ring; unipotent monodromy along a boundary (docility), extension and dense-open full faithfulness, logarithmic extension and Kedlaya's semistable reduction; the log-rigid comparison for curves with Pan's finite-level Igusa finiteness; finiteness for smooth quasi-projective integral models and their boundary strata (the request of AutomorphicGaloisRepresentationsPartII AG2.4); smooth proper direct images of convergent F-isocrystals (Shiho, Xu, Guo–Reinecke); and Kedlaya's finite projections étale off the hyperplane at infinity, the source of the exported affine-cover theorem.

The plan has 35 targets: 3 definitions, 3 constructions, 16 theorems, 11 lemmas and 2 acceptance applications, with 44 API items and 26 unit tests. Every target is a node of the packet `research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology--RD.5.json`, and this document states the same statements, hypotheses, APIs, tests, dependencies and sources. The [suggested Lean file](../suggested/PadicDifferentialEquationsAndRigidCohomology--RD.5.lean) states the parts expressible over carriers at the pins (indices of linear maps, the dimension formula, the formal residue pairing, residues of rank-one log connections, strict maps, graded Künneth dimensions) and lists the other targets by name. Nothing here is claimed to be formalised.

## Conventions

- K is a complete discretely valued field of characteristic 0 with ring of integers O, uniformiser π and residue field k of characteristic p; W is a Cohen ring of k when k is imperfect. Frobenius on cohomology over F_q is the linear q-power Frobenius, and K(n) multiplies it by q^{−n}, as in the first pass.
- Varieties are separated k-schemes of finite type unless a source allows more (Zureick-Brown's algebraic varieties are locally of finite type). F-Isoc†(X/K) is the category of overconvergent F-isocrystals of RD.3, Isoc† without Frobenius, F-Isoc the convergent F-isocrystals; H^i_rig, H^i_{c,rig} and H^i_{Z,rig} are the cohomologies of RD.4.
- Le Stum's overconvergent site uses strictly K-analytic Berkovich spaces. Its comparison theorem identifies its cohomology with Berthelot's rigid cohomology, so the Berkovich formalism stays inside the descent block.
- Cohomological descent follows SGA 4 Vbis in the formulation of Zureick-Brown §3: a morphism is of cohomological descent for a class of sheaves when the adjunction id → Rp_*p^* is an isomorphism for them, universally so after every base change.
- The local algebra at a boundary point is the Robba ring A of Laurent series converging on some annulus r < |x| < 1, with A^+ the series converging on the open disc and A^− the strictly negative part; Ω^1_A = A·dx/x, and the residue pairing is ⟨f, g dx/x⟩ = constant term of fg.
- An isocrystal on X overconvergent along Z = Y \\ X has unipotent monodromy along Z in Kedlaya's sense (Semistable reduction I, Definition 4.4.2); for Y smooth proper and Z a strict normal crossings divisor this is D'Addezio's docility.
- Statements are cited by their numbers in the version read: arXiv versions as listed in the sources, Berthelot's *Dualité* by the author's copy (pages 1–6), Le Stum's memoir and Chiarellotto–Tsuzuki by printed page.

## Dependencies

Inside this roadmap: RD.0 (Robba ring, its LF topology), RD.1 (the Dwork exponential module), RD.2 (unipotent modules, nilpotent residues, the local monodromy theorem and its examples), RD.3 (frames, tubes, j†, overconvergent and convergent isocrystals, the full-faithfulness nodes; Étesse's overconvergence of abelian-scheme direct images is an RD.3 target), RD.4 (rigid cohomology with supports and compact supports, excision and localisation, Gysin, finite étale pushforward, the Monsky–Washnitzer comparison; the Grosse-Klönne dagger comparison and the Igusa theta-cokernel identification are RD.4 targets), and the first-pass RD.5 nodes.

Other roadmaps, all of lower upstream tier than this one (tier 12): SchemeAndStackFoundations SF.0 (projective geometry, requested), SF.2 (coherent trace and Serre duality) and SF.4 (deformations, algebraisation, Chow's lemma, Raynaud–Gruson flattening, modifications, de Jong's alterations); AdicSpacesPartII F1 (dagger algebras, weak completion, log de Rham complexes) and R3 (Kiehl's theorems, proper GAGA, quasi-Stein spaces); LocallyAnalyticDistributions L0 (Hahn–Banach, bipolar theorem, Banach–Steinhaus, duals; Mackey's theorem requested); EnhancedDerivedSheaves E2 (hypercovers and cohomological descent in a topos; the calculus of universal cohomological descent requested); CrystallineCohomology CR.1–CR.3 and CR.5 (crystals, crystalline cohomology, proper perfectness, log crystals); ModularCurvesPartII R13.5 (Igusa components). Libraries: Mathlib's sheaves on sites, tensor products and schemes.

## Nonarchimedean duality on the Robba ring (sub-layer RD.5c)

Crew's finiteness and duality theorem on curves, and Kedlaya's duality on affine space, rest on four facts of nonarchimedean functional analysis that the first pass cited at statement level. A space that is both Fréchet and the dual of a reflexive Fréchet space is finite dimensional; strictness of a map is detected on its transpose, and for Fréchet–Montel spaces exactly; the Robba ring is topologically dual to its differentials under the residue pairing; and the plus and minus parts of the Robba ring are dual to the minus and plus parts of its differentials. The Hahn–Banach theorem and the bipolar theorem are imported from LocallyAnalyticDistributions:L0, which owns them; the first pass's own Hahn–Banach node is superseded. Mackey's theorem and the non-reflexivity of infinite-dimensional Banach spaces are requested from L0.

<a id="RD-5-frechet-and-dual-frechet-finite"></a>

### `frechet-and-dual-frechet-finite` — A space that is both Fréchet and the strong dual of a reflexive Fréchet space is finite dimensional

`PadicDifferentialEquationsAndRigidCohomology:RD.5/frechet-and-dual-frechet-finite` · lemma.

Let K be discretely valued. If a locally convex K-space V is Fréchet and is (topologically) the strong dual of a reflexive Fréchet space, then dim_K V < ∞.

Hypotheses and conventions:

- K discretely valued (hence spherically complete), as throughout Crew's paper.

Proof:

1. V has a countable basis of convex neighbourhoods of 0 (Fréchet) and, as the strong dual of a Fréchet space, a countable fundamental family of bounded convex sets B_n (LocallyAnalyticDistributions:L0/bounded-sets-strong-dual).
2. Choose λ_n with λ_n B_n ⊂ U_n; the closed convex hull of ∪ λ_n B_n is a bounded barrel, hence a neighbourhood of 0 since Fréchet spaces are barrelled (LocallyAnalyticDistributions:L0/barrelled-banach-steinhaus); a space with a bounded neighbourhood of 0 is normable, so V is Banach.
3. V is reflexive as the dual of a reflexive space; a reflexive Banach space over a discretely valued field is finite dimensional (Crew 2.2; the unit ball of an infinite-dimensional Banach space over a discretely valued field is not weakly compact).

Acceptance:

- K itself is Fréchet and the dual of K.
- The Tate algebra K⟨t⟩ is Banach but not reflexive, so not a dual of a reflexive Fréchet space; the space of germs of functions at the boundary, R^−, is dual-of-Fréchet but not Fréchet.

Depends on: `LocallyAnalyticDistributions:L0/bounded-sets-strong-dual`, `LocallyAnalyticDistributions:L0/barrelled-banach-steinhaus`, `LocallyAnalyticDistributions:L0/nonarchimedean-locally-convex-spaces`, `LocallyAnalyticDistributions:L0/compact-type-nuclear-duality`, `RD.5/strict-map`, `LocallyAnalyticDistributions:L0`.

Sources:

- Richard Crew, *Finiteness theorems for the cohomology of an overconvergent isocrystal on a curve*, Proposition 2.8, p. 724: A locally convex space that is both Fréchet and dual-of-Fréchet is finite dimensional, by building a bounded barrel and using Kolmogorov's normability criterion and non-reflexivity of infinite-dimensional Banach spaces.

<a id="RD-5-strictness-transpose-criteria"></a>

### `strictness-transpose-criteria` — Strictness of a linear map and of its transpose

`PadicDifferentialEquationsAndRigidCohomology:RD.5/strictness-transpose-criteria` · lemma.

Let K be discretely valued and f: V → W a continuous linear map of separated locally convex K-spaces. (a) f is strict iff the image of its transpose f': W' → V' is closed for the weak topology and every equicontinuous subset of im f' is the image of an equicontinuous subset of W'; then ker f' = (im f)^⊥, im f' = (ker f)^⊥, and coker f' ≅ (ker f)' and ker f' ≅ (coker f)' as vector spaces. (b) The transpose of a strict exact sequence is exact. (c) For semi-complete V, W, f' is strict for the linearly-compact dual topologies iff f(V) is closed and every bounded convex linearly compact subset of W is the image of one of V. (d) If V, W are Fréchet, f is strict iff f' is strict for the linearly-compact dual topology; if moreover V, W are Montel (the case of the local algebras), f is strict iff f': W'_b → V'_b is strict.

Hypotheses and conventions:

- Equicontinuous may be replaced by bounded for LF-spaces (barrelled).
- Spherical completeness of K enters through Hahn–Banach and the bipolar theorem.

Proof:

1. (a) The nonarchimedean form of Bourbaki EVT IV §4 no. 1 Prop. 2: the bipolar theorem (LocallyAnalyticDistributions:L0/pseudo-polar-duality) identifies closures with bipolars, and Hahn–Banach (LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach (b)) extends forms from closed subspaces (Crew 3.8).
2. (b) A strict exact sequence stays strict exact for the weak topologies; its transpose is exact, the injective case being Hahn–Banach (Crew 3.9).
3. (c) Mackey: V = (V'_c)' for semi-complete V, and convex equicontinuous subsets of the dual are the relatively linearly compact convex sets (Crew 3.10).
4. (d) In a Fréchet space every balanced convex closed bounded linearly compact set lies in the closed convex hull of a null sequence (Crew 2.9); lift null sequences along a strict map of metrisable spaces (Crew 3.11); for Montel spaces linearly compact and strong duals agree (Crew 3.12).

Acceptance:

- An isomorphism of Fréchet spaces is strict and so is its transpose.
- The inclusion K⟨t⟩† → K⟨t⟩ of overconvergent into convergent functions is continuous but not strict: the topology induced by the Gauss norm on K⟨t⟩† is strictly coarser than its LF (fringe) topology; its image is dense and not closed.

Depends on: `LocallyAnalyticDistributions:L0/pseudo-polar-duality`, `LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach`, `LocallyAnalyticDistributions:L0/bounded-sets-strong-dual`, `LocallyAnalyticDistributions:L0/barrelled-banach-steinhaus`, `LocallyAnalyticDistributions:L0/locally-convex-limits`, `RD.5/strict-map`, `LocallyAnalyticDistributions:L0`.

Used here by: [RD.5/robba-topological-residue-duality](#RD-5-robba-topological-residue-duality), [RD.5/robba-plus-minus-duality](#RD-5-robba-plus-minus-duality).

Sources:

- Richard Crew, *Finiteness theorems for the cohomology of an overconvergent isocrystal on a curve*, Propositions 2.9, 3.8–3.11 and Corollary 3.12, pp. 724–727: Characterises strict maps through their transposes, proves exactness of transposes of strict exact sequences, and treats the Fréchet and Fréchet–Montel cases using linearly compact sets.
- Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, Proposition 8.3.5, p. 55: Uses the Fréchet–Montel criterion in the duality on affine space.

<a id="RD-5-robba-topological-residue-duality"></a>

### `robba-topological-residue-duality` — Topological local duality: the Robba ring is the strong dual of its differentials under the residue pairing

`PadicDifferentialEquationsAndRigidCohomology:RD.5/robba-topological-residue-duality` · theorem.

Let A be the local algebra (the Robba ring of Laurent series in x over a discretely valued K converging on some annulus r < |x| < 1) with its LF topology A = lim_{r→1} A_{(r,1)}, and Ω^1_A = A·dx/x. The residue pairing A × Ω^1_A → K, (f, ω) ↦ Res_{x=0}(fω) (the coefficient of dx/x), is separately continuous and induces topological isomorphisms A ≅ (Ω^1_A)'_b and Ω^1_A ≅ A'_b. A subset of A is bounded iff it lies and is bounded in some A_{[r,1)}, iff its image in (Ω^1_A)'_b is bounded; A is Montel; and for every finite free A-module M the induced map M → (M^∨ ⊗ Ω^1_A)'_b is a topological isomorphism. The pairing satisfies (f, dg) = −(g, df).

Hypotheses and conventions:

- K discretely valued; the LF topology of the Robba ring is the RD.0 carrier topology.
- This is the topological duality of the coefficient ring itself (Crew 5.4); the perfectness of the cohomological pairing coker ∂ × ker ∂^∨ → L for a module with Frobenius is the distinct RD.1 target RD.1/robba-residue-duality.

Proof:

1. Continuity and injectivity: |(f, g dx/x)| ≤ |fg|_I ≤ |f|_I|g|_I on closed annuli I ⊂ (r, 1), and the coefficient functionals (·, x^{n}dx/x) separate points (Crew 5.1).
2. Surjectivity: a continuous functional ℓ on Ω^1_A is bounded on some U_{ε,[s,t]} for each s < 1; the coefficients a_{−n} = ℓ(x^n dx/x) satisfy the growth conditions (4.1.2)–(4.1.3), hence define f ∈ A with ℓ = (f, ·) (Crew (5.1.5)–(5.1.6)).
3. Bounded sets (Crew Lemma 5.2) by Banach–Steinhaus on the barrelled space Ω^1_A (LocallyAnalyticDistributions:L0/barrelled-banach-steinhaus); Montel from relative linear compactness of bounded sets, via complete continuity of restriction between nested annuli (Crew Lemma 4.3, Corollary 4.4, Corollary 5.3).
4. Strictness of A → (Ω^1_A)'_b: A is reflexive (Montel), so this map is its own transpose, and bounded sets correspond (Crew Theorem 5.4 using RD.5/strictness-transpose-criteria); finite free modules reduce to A^n.

Acceptance:

- (1, x^{n} dx/x) = δ_{n,0} for n ∈ ℤ.
- (f, df) = 0 for every f (Res d = 0).

Depends on: `RD.0/robba-ring`, `RD.0`, [RD.5/strictness-transpose-criteria](#RD-5-strictness-transpose-criteria), `LocallyAnalyticDistributions:L0/barrelled-banach-steinhaus`, `LocallyAnalyticDistributions:L0/locally-convex-limits`, `RD.5/strict-map`.

Used here by: [RD.5/robba-plus-minus-duality](#RD-5-robba-plus-minus-duality).

Sources:

- Richard Crew, *Finiteness theorems for the cohomology of an overconvergent isocrystal on a curve*, 4.1–4.4 and 5.1–5.4, pp. 728–734: Defines the local algebras with their LF topology, the residue pairing, proves its continuity and perfectness, characterises bounded sets, and proves that finite free modules are Montel and topologically dual to their twisted duals.

<a id="RD-5-robba-plus-minus-duality"></a>

### `robba-plus-minus-duality` — The plus and minus parts of the Robba ring and their mutual duality

`PadicDifferentialEquationsAndRigidCohomology:RD.5/robba-plus-minus-duality` · lemma.

With A and Ω^1_A as in RD.5/robba-topological-residue-duality, let A^+ = A_{[0,1)} (power series converging on the open unit disc), A^− the series with only negative powers of x, Ω^{1,±} = A^± dx. Then A = A^+ ⊕ A^− topologically, (A^+)^⊥ = Ω^{1,+} for the residue pairing, A^+ (with its Fréchet topology, which is the induced one) is Fréchet, A^− is dual-of-Fréchet, and the pairing identifies A^− with the strong dual of the reflexive Fréchet space Ω^{1,+} and (A^+)'_b with Ω^{1,−}.

Hypotheses and conventions:

- As in RD.5/robba-topological-residue-duality.

Proof:

1. (A^+)^⊥ = Ω^{1,+}: the product of a power series and an element of A^+dx has no x^{−1}dx term, and conversely by testing against x^n (Crew, before 5.5).
2. Hence A^+ and A^− are closed and A = A^+ ⊕ A^− topologically; A^+ is Fréchet in its own topology, which agrees with the induced one by the open mapping theorem for LF-spaces (Crew 3.5).
3. Dualise the direct sum with RD.5/robba-topological-residue-duality: A'_b = (A^+)'_b ⊕ (A^−)'_b and (A^+)'_b = Ω^1_A/(A^+)^⊥ ≅ Ω^{1,−}; hence A^− is the dual of the reflexive Fréchet space Ω^{1,+} (Crew Proposition 5.5).

Acceptance:

- The pairing of x^{−n} ∈ A^− with x^{n} dx/x = x^{n−1}dx ∈ Ω^{1,+} (n ≥ 1) is 1.
- dA^+ ⊂ Ω^{1,+} and d(A^−) ⊂ Ω^{1,−} with cokernel K·dx/x on the minus side.

Depends on: [RD.5/robba-topological-residue-duality](#RD-5-robba-topological-residue-duality), `RD.5/finite-cokernel-strict`, [RD.5/strictness-transpose-criteria](#RD-5-strictness-transpose-criteria).

Sources:

- Richard Crew, *Finiteness theorems for the cohomology of an overconvergent isocrystal on a curve*, Paragraph before Proposition 5.5 and Proposition 5.5, p. 734: Shows A = A^+ ⊕ A^− topologically, A^+ Fréchet and A^− dual-of-Fréchet, and identifies the duals through the residue pairing.

## The dimension of H¹ of an affine curve (sub-layer RD.5b)

Kedlaya proves finiteness on a curve from the square of principal-part maps (Proposition 6.2.10) and remarks that more care gives dim H¹_rig = 2g + d − 1; the first pass recorded the missing lattice argument as a gap. Here the indices are computed on the generic fibre instead. Lift the compactified curve with its boundary points; the Čech complex of the admissible covering of the analytic curve by a strict neighbourhood of the tube and small discs at the boundary computes coherent cohomology (Crew's argument in the proof of his Theorem 7.5), and in the limit it gives four-term exact sequences for functions and for differentials whose outer terms are H⁰ and H¹ of O and Ω¹ on the algebraic generic fibre. Riemann–Roch and Serre duality then give ind ρ = 1 − g and ind dρ = g − 1, the local derivative has index −d, and index additivity gives the formula. Van der Put's Proposition 6.1 states the same formula.

<a id="RD-5-curve-lift-with-boundary"></a>

### `curve-lift-with-boundary` — Lifting a smooth projective curve with its boundary points, and the algebraic generic fibre

`PadicDifferentialEquationsAndRigidCohomology:RD.5/curve-lift-with-boundary` · lemma.

Let K be complete discretely valued of characteristic 0 with ring of integers O and residue field k, X̄ a smooth projective geometrically irreducible curve over k of genus g, and D = {x_1, …, x_m} ⊂ X̄ a reduced divisor whose points have residue fields k_i separable over k; X = X̄ \ D. Then there are a smooth projective O-curve 𝒳̄ with special fibre X̄ and closed subschemes 𝒟_i ≅ Spec O_{K_i} (K_i/K unramified with residue field k_i) lifting x_i. Moreover: (a) 𝒳 = 𝒳̄ \ ∪𝒟_i is a smooth affine O-scheme lifting X, and its weak completion tensored with K is a dagger algebra A of Monsky–Washnitzer type with special fibre X, unique up to non-canonical isomorphism; (b) the generic fibre C = 𝒳̄_K is a smooth projective geometrically connected K-curve of genus g, so dim_K H^0(C, O) = 1, dim_K H^1(C, O) = g, dim_K H^0(C, Ω^1) = g, dim_K H^1(C, Ω^1) = 1; (c) the analytification C^an is a proper rigid curve containing the tube ]X[ as the complement of the residue discs ]x_i[, each an open disc over K_i.

Hypotheses and conventions:

- Separability of the residue fields of the boundary points (Kedlaya's Hypothesis 6.2.1); otherwise first pass to a finite extension of k, which is harmless for dimensions (RD.4/finite-flat-base-change).
- Characteristic 0 for K; O need not be the Witt vectors when k is imperfect (a Cohen ring suffices).

Proof:

1. Formal lift: obstructions to lifting a smooth curve over O/π^n to O/π^{n+1} lie in H^2(X̄, T_X̄) = 0, and the points lift by smoothness of the curve at x_i (SchemeAndStackFoundations:SF.4/deformations-of-smooth-schemes).
2. Algebraise the formal curve with its sections (SchemeAndStackFoundations:SF.4/effective-formal-deformations-of-curves, SchemeAndStackFoundations:SF.4/grothendieck-algebraization); the lift of an ample divisor makes the formal curve projective.
3. (a) Removing a relatively ample divisor gives an affine smooth lift; its weak completion is of MW type and unique up to isomorphism by the lifting property of weakly complete algebras (AdicSpacesPartII:F1/mw-type-integral-lift, AdicSpacesPartII:F1/weak-completion).
4. (b) The Euler characteristic of O is locally constant in the flat proper family, H^0 is the constants on both fibres (geometric connectedness), hence h^1 = g; Serre duality on C gives the Ω^1 dimensions (SchemeAndStackFoundations:SF.2/serre-proper).
5. (c) Raynaud's generic fibre of the completion of 𝒳̄ is C^an (proper GAGA, AdicSpacesPartII:R3/proper-gaga); the tube of x_i is an open disc in a local parameter lifting a uniformiser at x_i (Crew 7.2).

Acceptance:

- For X = A^1 = P^1 \ {∞}, the lift P^1_O with the section ∞ gives A = K⟨t⟩†, C = P^1_K, g = 0.
- For an elliptic curve minus its origin, the lift is a Weierstrass model with good reduction and the zero section; g = 1.

Depends on: `SchemeAndStackFoundations:SF.4/deformations-of-smooth-schemes`, `SchemeAndStackFoundations:SF.4/effective-formal-deformations-of-curves`, `SchemeAndStackFoundations:SF.4/grothendieck-algebraization`, `AdicSpacesPartII:F1/mw-type-integral-lift`, `AdicSpacesPartII:F1/weak-completion`, `SchemeAndStackFoundations:SF.2/serre-proper`, `AdicSpacesPartII:R3/proper-gaga`, `RD.4/finite-flat-base-change`.

Used here by: [RD.5/dagger-curve-mayer-vietoris](#RD-5-dagger-curve-mayer-vietoris), [RD.5/principal-parts-index-computation](#RD-5-principal-parts-index-computation).

Sources:

- Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, Hypothesis 6.2.1 and Remark 6.2.4, p. 37: Sets the curve, its boundary with geometrically reduced points, and Crew's geometric description of the local algebras through a formally smooth lift.
- Richard Crew, *Finiteness theorems for the cohomology of an overconvergent isocrystal on a curve*, 7.2–7.3, pp. 742–743: Attaches to each boundary point a local algebra through a lifting of the compactified curve and embeds the dagger algebra into the sum of the local algebras.
- Richard Crew, *Finiteness theorems for the cohomology of an overconvergent isocrystal on a curve*, Proof of Lemma 7.4, p. 744: Uses the algebraisation of the analytic proper curve as a smooth projective K-curve.

<a id="RD-5-dagger-curve-mayer-vietoris"></a>

### `dagger-curve-mayer-vietoris` — Mayer–Vietoris sequences for a dagger curve and its boundary discs

`PadicDifferentialEquationsAndRigidCohomology:RD.5/dagger-curve-mayer-vietoris` · lemma.

In the situation of RD.5/curve-lift-with-boundary, let A(x_i) be the local algebra (Robba ring over K_i in a parameter t_i at x_i) and A(x_i)^+ its subring of functions on the open disc ]x_i[. For every locally free coherent sheaf 𝓛 on C, with L† = colim_V Γ(V, 𝓛^an) over strict neighbourhoods V of ]X[, there is an exact sequence 0 → H^0(C, 𝓛) → L† ⊕ ⊕_i Γ(]x_i[, 𝓛^an) → ⊕_i L† ⊗ A(x_i) → H^1(C, 𝓛) → 0. In particular, writing ρ: A → ⊕_i A(x_i)/A(x_i)^+ and dρ: Ω^1_A → ⊕_i Ω^1_{A(x_i)}/Ω^1_{A(x_i)^+} for the principal-part maps, there are exact sequences 0 → H^0(C, O) → A → ⊕_i A(x_i)/A(x_i)^+ → H^1(C, O) → 0 and 0 → H^0(C, Ω^1) → Ω^1_A → ⊕_i Ω^1_{A(x_i)}/Ω^1_{A(x_i)^+} → H^1(C, Ω^1) → 0.

Hypotheses and conventions:

- Locally free coherent 𝓛 on the algebraic curve C (algebraisation via proper GAGA).
- Strict neighbourhoods V_r = C^an \ ∪_i {|t_i| < r} for r → 1^−, r ∈ √|K^×|.

Proof:

1. For r close to 1, {V_r, [D]_r} with [D]_r = ∪_i{|t_i| < r'} (r < r' < 1, closed discs) is an admissible affinoid covering of C^an, so the Čech complex Γ(V_r) ⊕ Γ([D]_r) → Γ(V_r ∩ [D]_r) computes H^*(C^an, 𝓛^an) (Tate acyclicity, AdicSpacesPartII:R3/tate-kiehl-affinoid; Crew, proof of Theorem 7.5).
2. H^*(C^an, 𝓛^an) = H^*(C, 𝓛) by proper GAGA (AdicSpacesPartII:R3/proper-gaga).
3. Pass to the limit r' → 1 (Mittag-Leffler: the transition maps have dense image, AdicSpacesPartII:R3/quasi-stein-dense-restriction) to replace the closed discs by the open discs ]x_i[, then the direct limit over strict neighbourhoods (exact); the intersections become the local algebras (Crew (7.3.3)).
4. For 𝓛 = O and 𝓛 = Ω^1, eliminating the disc terms gives the four-term sequences, the kernel of ρ being A ∩ ⊕A(x_i)^+ = H^0(C, O).

Acceptance:

- For X = A^1 (C = P^1, one boundary point): 0 → K → K⟨t⟩† → A(∞)/A(∞)^+ → 0 → 0, i.e. ρ is surjective with kernel the constants.
- For X = A^1 and Ω^1: H^0(P^1, Ω^1) = 0 and H^1(P^1, Ω^1) = K, so dρ has one-dimensional cokernel, spanned by the class of dt/t at ∞ (the residue).

Depends on: [RD.5/curve-lift-with-boundary](#RD-5-curve-lift-with-boundary), `RD.5/local-algebras-at-missing-points`, `AdicSpacesPartII:R3/tate-kiehl-affinoid`, `AdicSpacesPartII:R3/proper-gaga`, `AdicSpacesPartII:R3/quasi-stein-dense-restriction`, `RD.0/robba-ring`.

Used here by: [RD.5/principal-parts-index-computation](#RD-5-principal-parts-index-computation).

Sources:

- Richard Crew, *Finiteness theorems for the cohomology of an overconvergent isocrystal on a curve*, Proof of Theorem 7.5, pp. 745–746: Computes H^*(X^an, L) by the Čech complex of the admissible affinoid cover by a strict neighbourhood and small closed discs at the boundary, then passes to the limit to the open discs and the local algebras.
- Richard Crew, *Finiteness theorems for the cohomology of an overconvergent isocrystal on a curve*, 7.3, (7.3.1)–(7.3.3), p. 743: Defines the sum of local algebras at the boundary and identifies the tensor products of the global module with it as limits over strict neighbourhoods.
- Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, Remark 6.2.4, p. 37: Crew's geometric description of the local algebras as overconvergent functions on annuli near the boundary discs.

<a id="RD-5-principal-parts-index-computation"></a>

### `principal-parts-index-computation` — The indices of the principal-part maps and the dimension of H^1 of an affine curve

`PadicDifferentialEquationsAndRigidCohomology:RD.5/principal-parts-index-computation` · lemma.

Under Hypothesis 6.2.1 of Kedlaya (X smooth affine geometrically irreducible curve over k, boundary D of degree d = Σ_i [k_i : k], compactification of genus g), the principal-part maps ρ: A → ⊕_i A(x_i)/A(x_i)^+ and dρ: Ω^1_A → ⊕_i Ω^1_{A(x_i)}/Ω^1_{A(x_i)^+} have finite-dimensional kernels and cokernels with ind(ρ) = 1 − g and ind(dρ) = g − 1 (ind = dim ker − dim coker over K), and the local derivative d_loc: ⊕ A(x_i)/A(x_i)^+ → ⊕ Ω^1_{A(x_i)}/Ω^1_{A(x_i)^+} is injective with cokernel ⊕_i K_i · dt_i/t_i, so ind(d_loc) = −d. Consequently ind(d: A → Ω^1_A) = 2 − 2g − d, and since H^0_rig(X/K) = K, dim_K H^1_rig(X/K) = 2g + d − 1.

Hypotheses and conventions:

- Hypothesis 6.2.1 (geometrically reduced boundary points); the general case reduces to it by a finite extension of k.

Proof:

1. Indices of ρ and dρ: read off the exact sequences of RD.5/dagger-curve-mayer-vietoris with the dimensions of RD.5/curve-lift-with-boundary (b): ind(ρ) = h^0(O) − h^1(O) = 1 − g and ind(dρ) = h^0(Ω^1) − h^1(Ω^1) = g − 1. This replaces the lattice argument on the special fibre that Kedlaya leaves to the reader.
2. Local derivative: on A(x_i)/A(x_i)^+, represented by series Σ_{n≥1} a_n t^{−n}, d is injective in characteristic 0 and its image misses exactly the class of t^{−1}dt; the coefficient field of the i-th summand is K_i, of degree [k_i : k] over K.
3. Index additivity for the commutative square d_loc ∘ ρ = dρ ∘ d of maps with finite-dimensional kernels and cokernels (RD.5/near-isomorphism): ind(d) + ind(dρ) = ind(ρ) + ind(d_loc).
4. H^0 = K for geometrically connected X (Kedlaya, proof of Lemma 9.3.2), and H^1_rig = coker d by RD.4/mw-comparison-for-affine-curves.

Acceptance:

- X = A^1: g = 0, d = 1, dim H^1 = 0.
- X = G_m: g = 0, d = 2, dim H^1 = 1.
- X = P^1 minus N rational points: dim H^1 = N − 1, matching RD.5/affine-curve-duality-acceptance (1).
- X = E \ {O}: g = 1, d = 1, dim H^1 = 2.

Depends on: [RD.5/dagger-curve-mayer-vietoris](#RD-5-dagger-curve-mayer-vietoris), [RD.5/curve-lift-with-boundary](#RD-5-curve-lift-with-boundary), `RD.5/near-isomorphism`, `RD.5/finiteness-for-affine-curves-constant-coefficients`, `RD.4/mw-comparison-for-affine-curves`, `RD.4/finite-flat-base-change`.

Sources:

- Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, Proposition 6.2.10 and the sentence after it, p. 39: Proves finiteness from the square of principal-part maps and states, without proof, that more care gives dim H^1 = 2g + deg(boundary) − 1.
- Marius van der Put, *The cohomology of Monsky and Washnitzer*, Proposition 6.1, p. 47: States the dimension formula for H^1 of an affine curve.
- Richard Crew, *Finiteness theorems for the cohomology of an overconvergent isocrystal on a curve*, Proof of Theorem 7.5, pp. 745–746: The Čech computation on the analytic proper curve that yields the exact sequences used here.

## Trace, duality morphism and Künneth pairings (sub-layer RD.5c)

Kedlaya takes the trace, the Poincaré pairing with its compatibility with the excision sequences, and the Künneth morphisms as given, citing Berthelot's *Dualité* note and Tsuzuki 1999; neither was read in the first pass. Berthelot's note, read from his author's copy, constructs all three. The trace on top compact-support cohomology comes from a smooth affine lift, the Grothendieck trace of a compactified generic fibre and GAGA, and it is independent of the lift because the Gysin map of a W-point inverts it. Lemme 2.1 identifies homomorphisms out of overconvergent germs with sections supported on the tube, so pairings of sheaves induce the cup product between cohomology with supports in Z and compactly supported cohomology of Z; composed with the trace this is the duality morphism ψ_{Z,X}, which is a morphism from the localisation triangle to the dual of the excision triangle. The Künneth morphisms come from canonical pairings on product tubes. The same double induction that proves duality and Künneth proves that rigid cohomology commutes with any extension of the base field.

<a id="RD-5-overconvergent-germ-hom-lemma"></a>

### `overconvergent-germ-hom-lemma` — Homomorphisms out of overconvergent germs are sections supported on the tube (Berthelot, Lemme 2.1)

`PadicDifferentialEquationsAndRigidCohomology:RD.5/overconvergent-germ-hom-lemma` · lemma.

Let (X, Y, P) be a frame with X open in Y, Z = Y \ X, j: ]X[ ⊂ ]Y[ and Γ_{]X[} the functor of sections with support in ]X[ (the kernel of restriction to the open tube ]Z[). For sheaves E, F of K-vector spaces on ]Y[ there is a canonical isomorphism of sheaves Hom_K(j†E, F) ≅ Γ_{]X[}(Hom_K(E, F)), natural in E and F. Consequently every K-bilinear pairing of complexes E• ⊗_K F• → G• on ]Y[ induces a pairing j†E• ⊗_K Γ_{]X[}F• → Γ_{]X[}G•, compatible with restriction to smaller open X' ⊂ X.

Hypotheses and conventions:

- Classical rigid (Tate) topology on ]Y[; ]Z[ is an admissible open and {V_λ, ]Z[} is an admissible covering of ]Y[ for every strict neighbourhood V_λ of ]X[ (RD.3/strict-neighbourhood).
- j†E = colim_V j_{V*} j_V^{-1} E over strict neighbourhoods V of ]X[ (RD.3/j-dagger).

Proof:

1. The restriction of j†E to ]Z[ vanishes: a quasi-compact admissible W ⊂ ]Z[ satisfies |f| ≤ η < 1 on W for the defining functions f, hence misses V_λ for λ > η, and (j†E)(W) = colim_λ E(W ∩ V_λ) = 0.
2. Map one way: a homomorphism ψ: j†E → F composed with the adjunction E → j†E is a homomorphism E → F whose restriction to ]Z[ is zero, i.e. a section of Γ_{]X[}Hom(E, F).
3. Map the other way: given φ: E → F vanishing on ]Z[, a germ s ∈ E(W ∩ V) on a quasi-compact W is sent to the section of F(W) obtained by gluing φ(s) on W ∩ V with 0 on W ∩ ]Z[, using the admissible covering {W ∩ V, W ∩ ]Z[} of W; the two agree on the overlap because φ vanishes on ]Z[. The constructions are inverse and natural.
4. For the pairing statement apply the isomorphism to the adjoint E• → Hom(F•, G•) and use Γ_{]X[}Hom(F, G) → Hom(Γ_{]X[}F, Γ_{]X[}G).

Acceptance:

- For X = Y (no boundary) both sides are Hom_K(E, F).
- For E = F = O on the frame A^1 ⊂ P^1, both sides have no nonzero global sections: a function on P^{1,an} vanishing on the open disc ]∞[ vanishes identically, so there is no nonzero map j†O → O (the natural map goes O → j†O).

Depends on: `RD.3/j-dagger`, `RD.3/strict-neighbourhood`, `RD.3/frame`, `RD.3/tube`.

Used here by: [RD.5/supported-duality-morphism](#RD-5-supported-duality-morphism).

Sources:

- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, Lemme 2.1, p. 4: States the canonical isomorphism between homomorphisms out of j† of a sheaf and sections with support in the tube of the internal Hom, and deduces by adjunction the induced pairing of j† with Γ_{]X[}; the proof is said to be a direct verification.
- Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, Section 8.2, p. 54: Uses the induced pairing to construct cup products between rigid cohomology and compact-support cohomology with coefficients.

<a id="RD-5-rigid-trace-morphism"></a>

### `rigid-trace-morphism` — Berthelot's trace morphism on top-degree compact-support rigid cohomology

`PadicDifferentialEquationsAndRigidCohomology:RD.5/rigid-trace-morphism` · construction.

For every separated k-scheme X of finite type and pure dimension n there is a K-linear trace Tr_X: H^{2n}_{c,rig}(X/K) → K, characterised as follows. If X is affine, smooth and geometrically connected, choose a smooth affine W-scheme X' lifting X and a projective compactification X̄' with structure map h: X̄'_K → Spec K; then Tr_X is induced by the composite H^n_{]X[}(X̄'^{an}_K, Ω^n) → H^0_{]X[}(X̄'^{an}_K, ω^{an}) → H^0(X̄'^{an}_K, ω^{an}) ≅ H^0(X̄'_K, ω) → K of the class map for the dualising complex ω = h^!K (equal to Ω^n[n] on the smooth locus X'_K), the forget-supports map, rigid GAGA and Grothendieck's trace; this composite kills the image of H^n_{]X[}(Ω^{n−1}), so it factors through H^{2n}_{c,rig}(X) = H^{2n}_{]X[}(X̄'^{an}_K, Ω^•), the quotient of H^n_{]X[}(Ω^n) by that image. In general Tr_X is obtained after a finite extension of k from an affine smooth geometrically connected open dense U with dim(X \ U) < n, using that H^{2n}_{c,rig}(U) → H^{2n}_{c,rig}(X) is surjective, and descended by the trace of the finite extension of K. Tr_X is independent of all choices, is Frobenius-equivariant as a map H^{2n}_{c,rig}(X/K) → K(−n), and is the trace Tr_X used by RD.5/trace-map.

Hypotheses and conventions:

- Pure dimension n; for n = 0 the trace of a finite étale k-scheme is the sum of the field traces.
- Constant coefficients; traces with coefficients are obtained by composing the cup product with the evaluation E ⊗ E^∨ → O (RD.5/poincare-pairing).
- A Cohen ring W of k with fraction field K (for perfect k the Witt vectors), as in Berthelot's note.

Construction or proof:

1. Vanishing: H^d_{c,rig}(X) = 0 for d > 2n (RD.5/compact-support-vanishing-above-twice-dimension), so excision shows H^{2n}_{c,rig}(U) → H^{2n}_{c,rig}(X) is surjective for U open with dim(X \ U) < n (RD.4/excision-sequence).
2. Affine smooth case: the analytification X'^{an}_K of the affine lift is a strict neighbourhood of the tube of X in X̄'^{an}_K, and the compact-support complex of X is computed by RΓ_{]X[} of the de Rham complex (RD.4/compactly-supported-rigid-cohomology); compose with the class map of Ω^n[n] → ω, the GAGA isomorphism for the coherent complex ω, and Grothendieck's trace for the proper K-scheme X̄'_K.
3. The composite vanishes on the image of H^n_{]X[}(Ω^{n−1}): the trace kills exact top forms (Berthelot 1.2); hence the factorisation through H^{2n}_{c,rig}.
4. Independence of the compactification and invariance under shrinking X with fixed X̄' are immediate from the construction (Berthelot 1.2); independence of the lift X': by RD.5/top-degree-dimension-one the space H^{2n}_{c,rig}(X) is a line, and by RD.5/compact-support-gysin-and-trace the Gysin map of a W-section, which only depends on the formal completion, is inverse to the trace of each lift (Berthelot Proposition 1.6); independence of U follows by comparing two opens with their intersection.
5. Frobenius: the trace of a Frobenius lift multiplies the residue class of the top form by q^n (RD.4/frobenius-on-rigid-cohomology), so Tr is equivariant into K(−n) (RD.4/tate-twist).

API:

| name | role | statement |
|---|---|---|
| `rigidTrace` | data | Tr_X: H^{2n}_{c,rig}(X/K) → K for X of pure dimension n. |
| `rigidTrace_frobenius` | compatibility | Tr_X ∘ Φ = q^n · σ_K ∘ Tr_X, i.e. Tr_X is a morphism of F-spaces H^{2n}_{c,rig}(X/K) → K(−n). |
| `rigidTrace_openImmersion` | functoriality | For U ⊂ X open dense, Tr_U = Tr_X ∘ (extension by zero H^{2n}_{c,rig}(U) → H^{2n}_{c,rig}(X)). |
| `rigidTrace_finiteEtale` | functoriality | For f: Y → X finite étale between smooth affines, Tr_X ∘ Tr_{f,c} = Tr_Y. |
| `rigidTrace_gysin` | compatibility | For a closed immersion Z' → X' of smooth quasi-projective W-schemes of codimension r lifting Z → X, Tr_X ∘ G_{Z'/X',c} = Tr_Z on H^{2(n−r)}_{c,rig}(Z). |
| `rigidTrace_crystalline` | compatibility | For X proper and smooth, under H^{2n}_{c,rig}(X) = H^{2n}_{rig}(X) ≅ H^{2n}_{crys}(X/W) ⊗ K, Tr_X is the crystalline trace. |
| `rigidTrace_baseChange` | functoriality | For a finite extension K'/K with residue field k', Tr_{X_{k'}} is the K'-linear extension of Tr_X. |
| `rigidTrace_isIso_of_geomIrreducible` | characterisation | If X is geometrically irreducible, Tr_X is an isomorphism (RD.5/top-compact-support-cohomology). |

Unit tests:

- `rigidTrace_point` (degenerate): For X = Spec k, Tr_X = id_K.
- `rigidTrace_affineLine` (computation): Tr_{A^1} sends the class of the compactly supported form with residue 1 at ∞ to 1, and Tr_{A^1} ∘ Φ = q · Tr_{A^1}.
- `rigidTrace_twoPoints` (computation): For X = Spec(k × k) (n = 0), Tr_X(a, b) = a + b.
- `rigidTrace_untwisted_nonexample` (non-example): Tr_{A^1} is not Frobenius-equivariant into the untwisted K: Tr ∘ Φ ≠ σ_K ∘ Tr on H^2_{c,rig}(A^1).
- `rigidTrace_proper_crystalline` (compatibility): For X = P^1_k, Tr_X agrees with the crystalline trace H^2_crys(P^1/W) ⊗ K → K under the comparison isomorphism.

Uses:

- Berthelot, Dualité, 2.2, p. 4: composing the cup-product pairing with Tr_X gives the duality morphism ψ_{Z,X}.
- Kedlaya, Finiteness, Section 9.3, p. 64: the trace gives the target K(−n) of the Poincaré pairing with coefficients.
- RD.6 (Kedlaya, Weil II, Section 2.6): the twist K(−n) of the trace fixes the normalisation of Frobenius weights in duality.

Acceptance:

- For X = Spec k, Tr_X is the identity of K.
- For X = A^1, the class in H^2_{c,rig}(A^1) of the compactly supported form whose residue is 1 maps to 1 (RD.4/compactly-supported-cohomology-of-affine-space), so Tr_{A^1} is an isomorphism H^2_{c,rig}(A^1) ≅ K(−1).
- For a finite étale map f: Y → X of degree d between smooth affines, Tr_X ∘ Tr_{f,c} = Tr_Y (Berthelot 1.7 (ii)).

Depends on: `RD.5/compact-support-vanishing-above-twice-dimension`, `RD.4/excision-sequence`, `RD.4/compactly-supported-rigid-cohomology`, `RD.4/frobenius-on-rigid-cohomology`, `RD.4/tate-twist`, `RD.4/finite-flat-base-change`, [RD.5/compact-support-gysin-and-trace](#RD-5-compact-support-gysin-and-trace), [RD.5/top-degree-dimension-one](#RD-5-top-degree-dimension-one), `SchemeAndStackFoundations:SF.2/trace`, `AdicSpacesPartII:R3/proper-gaga`, `AdicSpacesPartII:F1/mw-type-dagger-algebra`.

Used here by: [RD.5/finite-etale-trace-projector](#RD-5-finite-etale-trace-projector), [RD.5/supported-duality-morphism](#RD-5-supported-duality-morphism).

Sources:

- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, 1.2, p. 3: Constructs the trace by lifting a smooth affine geometrically connected X to a smooth affine W-scheme with projective compactification, using the dualising complex, GAGA on the analytic space, Grothendieck's trace (Hartshorne, Residues and Duality VII 3.4) and the vanishing on (n−1)-forms; reduces the general case to such an open after a finite extension of k.
- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, Proposition 1.1, p. 3: Vanishing of compact-support cohomology above twice the dimension, used to pass to a dense open.
- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, Proposition 1.6, p. 4: Independence of the lift.
- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, 1.7, p. 4: Compatibility of the trace with the crystalline trace for proper smooth X and with finite étale traces.

<a id="RD-5-compact-support-gysin-and-trace"></a>

### `compact-support-gysin-and-trace` — Compact-support Gysin maps and their compatibility with the lift-dependent traces

`PadicDifferentialEquationsAndRigidCohomology:RD.5/compact-support-gysin-and-trace` · lemma.

Let i': Z' → X' be a closed immersion of codimension r between smooth quasi-projective W-schemes with reduction i: Z → X, n = dim X. The algebraic Gysin morphism of i', analytified on the generic fibres and followed by RΓ_{]X[}, gives a compact-support Gysin morphism G_{Z'/X',c}: RΓ_{c,rig}(Z) → RΓ_{c,rig}(X)[2r], natural for open restriction. If X and Z are affine, smooth and geometrically connected and Tr_{X'}, Tr_{Z'} denote the traces built from the lifts as in Berthelot 1.2 (before independence of the lift is known), then Tr_{X'} ∘ G_{Z'/X',c} = Tr_{Z'} on H^{2(n−r)}_{c,rig}(Z). For a W-section Y' ⊂ X' this gives Tr_{X'} ∘ G_{Y'/X',c} = id_K, and the Gysin map of a section is computed in local coordinates near the section by the same formula for any two lifts whose formal completions are identified.

Hypotheses and conventions:

- Smooth quasi-projective lifts (affine shrinking as in RD.4/gysin-isomorphism).

Proof:

1. Berthelot 1.3: the algebraic Gysin morphism of a closed immersion of smooth schemes is compatible with Grothendieck's traces (the residue formalism of Hartshorne, Residues and Duality, applied on compactifications); analytify, use GAGA for the coherent dualising complexes, and apply RΓ_{]X[}.
2. Section case: Z' = Y' = Spec W, r = n, Tr_{Y'} is the identity of K.
3. Local formula: near the section, the tube is a polydisc and G_{Y'/X',c}(1) is the class of the form with residue 1 at the origin of the coordinates (Berthelot 1.6), which only depends on the formal completion along the section.

Acceptance:

- For the zero section of A^1 ⊂ P^1_W, G_c(1) is the class of the form with residue 1, and Tr(G_c(1)) = 1.
- For Z = X (r = 0), G is the identity.

Depends on: `RD.4/gysin-isomorphism`, `RD.4/compactly-supported-rigid-cohomology`, `AdicSpacesPartII:F1/mw-type-dagger-algebra`, `SchemeAndStackFoundations:SF.2/trace`, `AdicSpacesPartII:R3/proper-gaga`.

Used here by: [RD.5/rigid-trace-morphism](#RD-5-rigid-trace-morphism), [RD.5/top-degree-dimension-one](#RD-5-top-degree-dimension-one), [RD.5/supported-duality-morphism](#RD-5-supported-duality-morphism), [RD.5/kunneth-pairing-on-tubes](#RD-5-kunneth-pairing-on-tubes).

Sources:

- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, 1.3, p. 3: Defines the compact-support Gysin morphism of a closed immersion of smooth quasi-projective W-schemes and states its compatibility with the traces built from lifts.
- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, Proposition 1.6, p. 4: Uses the Gysin map of a W-point, described explicitly in local coordinates, as the inverse of each lift-dependent trace.

<a id="RD-5-top-degree-dimension-one"></a>

### `top-degree-dimension-one` — Top compact-support cohomology of a geometrically irreducible variety is one-dimensional

`PadicDifferentialEquationsAndRigidCohomology:RD.5/top-degree-dimension-one` · lemma.

Let X be a separated, geometrically irreducible k-scheme of finite type of dimension n. Then dim_K H^{2n}_{c,rig}(X/K) = 1, and for every open dense U ⊂ X the map H^{2n}_{c,rig}(U) → H^{2n}_{c,rig}(X) is an isomorphism.

Hypotheses and conventions:

- Constant coefficients; no Frobenius statement (the Frobenius twist is RD.5/top-compact-support-cohomology, which uses the trace).

Proof:

1. Isomorphism for U ⊂ X: excision (RD.4/excision-sequence) with the vanishing of H^d_{c,rig} above twice the dimension of X \ U (RD.5/compact-support-vanishing-above-twice-dimension).
2. Lower bound: after a finite extension of k (RD.4/finite-flat-base-change) shrink X to a smooth affine with a W-point on a lift; the Gysin map of the point is nonzero since its composite with the lift-dependent trace is the identity (RD.5/compact-support-gysin-and-trace).
3. Upper bound: shrink X to U finite étale over A^n (RD.3/etale-cover-of-affine-space); then H^{2n}_{c,rig}(A^n, f_*O) is dual to H^0_rig(A^n, f_*O^∨) = H^0_rig(U) = K by RD.5/poincare-duality-on-affine-space, after arranging finiteness and separatedness as in Kedlaya's proof of Lemma 9.3.2 (RD.5/generic-pushforward-theorem, RD.5/strictness-of-vertical-connection, RD.5/strictness-from-finite-cohomology).

Acceptance:

- For X = A^n the dimension is 1 (RD.4/compactly-supported-cohomology-of-affine-space).
- For X = Spec(k × k) (not geometrically irreducible, n = 0) the dimension is 2, so geometric irreducibility is needed.

Depends on: `RD.4/excision-sequence`, `RD.5/compact-support-vanishing-above-twice-dimension`, `RD.4/finite-flat-base-change`, [RD.5/compact-support-gysin-and-trace](#RD-5-compact-support-gysin-and-trace), `RD.3/etale-cover-of-affine-space`, `RD.5/poincare-duality-on-affine-space`, `RD.5/generic-pushforward-theorem`, `RD.5/strictness-of-vertical-connection`, `RD.5/strictness-from-finite-cohomology`, `RD.4/finite-etale-pushforward-cohomology`.

Used here by: [RD.5/rigid-trace-morphism](#RD-5-rigid-trace-morphism).

Sources:

- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, Proposition 1.5, p. 4: States that top compact-support cohomology of a geometrically irreducible variety is one-dimensional, with the lower bound from the Gysin map of a section.
- Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, Lemma 9.3.2 and its proof, p. 64: Proves the same dimension statement by finite étale pushforward to affine space and duality on affine space.

<a id="RD-5-finite-etale-trace-projector"></a>

### `finite-etale-trace-projector` — Traces along finite étale maps and the averaging projector

`PadicDifferentialEquationsAndRigidCohomology:RD.5/finite-etale-trace-projector` · lemma.

Let f: Y → X be finite étale of degree d between smooth affine k-schemes. A finite étale lift Ã → B̃ of the dagger algebras (unique up to isomorphism) gives traces Tr_f: RΓ_rig(Y) → RΓ_rig(X) and Tr_{f,c}: RΓ_{c,rig}(Y) → RΓ_{c,rig}(X) (the latter through a finite étale map of strict neighbourhoods of the tubes). Then Tr_f ∘ f^* = d and Tr_{f,c} ∘ f^*_c = d, so (1/d)f^*∘Tr_f and (1/d)f^*_c∘Tr_{f,c} are idempotents exhibiting RΓ_rig(X) and RΓ_{c,rig}(X) as direct summands of RΓ_rig(Y) and RΓ_{c,rig}(Y); and Tr_X ∘ Tr_{f,c} = Tr_Y in top degree.

Hypotheses and conventions:

- Characteristic of K is 0, so division by d is allowed.
- Smooth affine X, Y; the finite étale lift exists by the lifting of étale algebras to weak completions.

Proof:

1. Lift f to a finite étale map of dagger algebras (Berthelot 1.4; van der Put); Tr_f is induced by the de Rham trace RD.4/de-rham-trace through the Monsky–Washnitzer comparison RD.4/monsky-washnitzer-comparison.
2. The finite étale map extends to strict neighbourhoods of the tubes; pushforward of RΓ_{]Y[} gives Tr_{f,c} (Berthelot 1.4).
3. Tr ∘ f^* is multiplication by the degree on functions, hence on de Rham complexes; compatibility with Tr_X by the projection formula for Grothendieck traces (Berthelot 1.7 (ii)).

Acceptance:

- For the Kummer cover t ↦ t^d of G_m with p ∤ d, (1/d)Tr_f is the projection of H^1_rig onto the invariants, and both H^1 are K·dt/t.

Depends on: `RD.4/de-rham-trace`, `RD.4/monsky-washnitzer-comparison`, `RD.4/finite-etale-pushforward-cohomology`, `RD.4/compactly-supported-rigid-cohomology`, [RD.5/rigid-trace-morphism](#RD-5-rigid-trace-morphism).

Used here by: [RD.5/supported-duality-morphism](#RD-5-supported-duality-morphism), [RD.5/kunneth-pairing-on-tubes](#RD-5-kunneth-pairing-on-tubes), [RD.5/rigid-cohomology-base-field-extension](#RD-5-rigid-cohomology-base-field-extension).

Sources:

- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, 1.4, pp. 3–4: Constructs the traces along finite étale maps of smooth affines, with and without compact supports, and the averaging projectors.
- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, 1.7 (ii), p. 4: Compatibility of the finite étale compact-support trace with the top-degree traces.

<a id="RD-5-supported-duality-morphism"></a>

### `supported-duality-morphism` — The duality morphism ψ_{Z,X} and its morphism of distinguished triangles

`PadicDifferentialEquationsAndRigidCohomology:RD.5/supported-duality-morphism` · construction.

Let X be a separated k-scheme of finite type of pure dimension n, Z ⊂ X closed with complement U, and E ∈ F-Isoc†(X/K). The cup product RΓ_{Z,rig}(X, E) ⊗_K RΓ_{c,rig}(Z, E^∨) → RΓ_{c,rig}(X, O), built on a frame from RD.5/overconvergent-germ-hom-lemma and a multiplicative injective resolution of the de Rham complex, composed with the trace RD.5/rigid-trace-morphism, gives the duality morphism ψ_{Z,X}: RΓ_{Z,rig}(X, E) → RHom_K(RΓ_{c,rig}(Z, E^∨), K)[−2n] (ψ_X when Z = X). The triple (ψ_{Z,X}, ψ_X, ψ_U) is a morphism from the localisation triangle RΓ_{Z,rig}(X) → RΓ_rig(X) → RΓ_rig(U) → to the K-dual of the excision triangle RΓ_{c,rig}(U) → RΓ_{c,rig}(X) → RΓ_{c,rig}(Z) →, shifted by −2n. It is independent of the choices and satisfies: (i) for X proper smooth, ψ_X is crystalline Poincaré duality; (ii) for f: Y → X finite étale between smooth affines, ψ_X ∘ Tr_f = (f^*)^∨ ∘ ψ_Y and ψ_Y ∘ f^* = (Tr_{f,c})^∨ ∘ ψ_X; (iii) under the hypotheses of RD.5/compact-support-gysin-and-trace, ψ_{Z,X} ∘ G_{Z'/X'} = ψ_Z.

Hypotheses and conventions:

- Pure dimension n (the shift −2n and the trace need it).
- Coefficients: E ∈ F-Isoc†(X/K) with dual E^∨; Berthelot treats E = O, and the construction is the same for any locally free coefficient since only the pairing E ⊗ E^∨ → O is added (Kedlaya, Section 8.2).

Construction or proof:

1. On a frame (X, X̄, P): RΓ_{Z,rig}(X) is computed by the simple complex of j†_X(Ω) → j†_U(Ω), and RΓ_{c,rig}(Z) by Γ_{]Z[} of an injective resolution; RD.5/overconvergent-germ-hom-lemma turns the multiplication of a multiplicative resolution into the pairing into Γ_{]X[} (Berthelot 2.1–2.2).
2. Compose with Tr_X on H^{2n}_{c,rig}(X) (RD.5/rigid-trace-morphism); vanishing above 2n (RD.5/compact-support-vanishing-above-twice-dimension) makes the composite a map into the shifted dual.
3. The morphism of triangles comes from the compatibility of the pairing with the maps j†_X → j†_U and Γ_{]U[} → Γ_{]X[} at the level of complexes (Berthelot (2.2.2)).
4. (i) via the crystalline comparison for proper smooth X (RD.7 owns that comparison; here only the identification of traces from RD.5/rigid-trace-morphism API rigidTrace_crystalline is used); (ii) from RD.5/finite-etale-trace-projector and the projection formula; (iii) from RD.5/compact-support-gysin-and-trace (a).

API:

| name | role | statement |
|---|---|---|
| `dualityMorphism` | data | ψ_{Z,X}: RΓ_{Z,rig}(X, E) → RHom_K(RΓ_{c,rig}(Z, E^∨), K)[−2n]. |
| `dualityMorphism_triangle` | compatibility | (ψ_{Z,X}, ψ_X, ψ_U) is a morphism of distinguished triangles from the localisation triangle to the shifted dual of the excision triangle. |
| `dualityMorphism_finiteEtale` | functoriality | ψ_X ∘ Tr_f = (f^*)^∨ ∘ ψ_Y and ψ_Y ∘ f^* = (Tr_{f,c})^∨ ∘ ψ_X for f finite étale between smooth affines. |
| `dualityMorphism_gysin` | compatibility | ψ_{Z,X} ∘ G_{Z'/X'} = ψ_Z for a liftable closed immersion of smooth schemes. |
| `gysin_dual_of_restriction` | relation | For X smooth, once ψ is an isomorphism (RD.5/poincare-duality), G_{Z'/X'} and G_{Z'/X',c} are the transposes of the restriction maps RΓ_{c,rig}(X) → RΓ_{c,rig}(Z) and RΓ_rig(X) → RΓ_rig(Z); hence they do not depend on the lifted immersion (Berthelot, Remarque after Théorème 2.4, p. 5). |
| `dualityMorphism_crystalline` | compatibility | For X proper smooth, ψ_X is crystalline Poincaré duality under the rigid–crystalline comparison. |
| `dualityMorphism_frobenius` | compatibility | ψ_{Z,X} is Frobenius-equivariant when the target carries the dual Frobenius twisted by K(−n). |
| `dualityMorphism_cupProduct` | characterisation | On cohomology, ψ_{Z,X}(a)(b) = Tr_X(a ∪ b) with the cup product of RD.5/poincare-pairing. |

Unit tests:

- `dualityMorphism_point` (degenerate): For X = Z = Spec k (n = 0), ψ_X: K → K^∨ is the identity under K^∨ = K.
- `dualityMorphism_affineLine_degree0` (computation): For X = A^1, ψ_X in degree 0 sends 1 ∈ H^0_rig(A^1) = K to Tr_{A^1} on H^2_{c,rig}(A^1), a nonzero functional.
- `dualityMorphism_gm_triangle` (computation): For X = G_m, Z = {1}, U = G_m \ {1}: the triangle morphism identifies the boundary map H^1_rig(U) → H^2_{Z,rig}(X) with the dual of H^0_{c,rig}(Z) → H^1_{c,rig}(U).
- `dualityMorphism_no_shift_nonexample` (non-example): Without the shift −2n the degrees do not match: for X = A^1 the perfect pairing is H^0_rig × H^2_{c,rig} → K, whereas the unshifted pairing H^0_rig × H^0_{c,rig} → K is zero because H^0_{c,rig}(A^1) = 0.

Uses:

- Berthelot, Dualité, Théorème 2.4, p. 5: the double induction proves ψ_{Z,X} is an isomorphism for X smooth.
- RD.5/excision-duality-compatibility: the morphism of triangles is the compatibility of the Poincaré pairings with excision, formerly cited to Tsuzuki 1999 §6.2.
- RD.5/poincare-duality: the perfectness statement is that ψ_{Z,X} is a quasi-isomorphism.

Acceptance:

- For Z = X = A^1 and E = O, ψ_X in degree 1 identifies H^1_rig(A^1) = 0 with the dual of H^1_{c,rig}(A^1) = 0, and in degree 0 K with the dual of H^2_{c,rig}(A^1) via the trace.
- For X = G_m, Z = {1}, U = X \ Z, the triangle morphism matches the localisation sequence 0 → H^1_rig(G_m) → H^1_rig(U) → H^2_{Z,rig}(G_m) ≅ K(−1) → 0 with the dual of the excision sequence 0 → H^0_{c,rig}(Z) → H^1_{c,rig}(U) → H^1_{c,rig}(G_m) → 0.

Depends on: [RD.5/overconvergent-germ-hom-lemma](#RD-5-overconvergent-germ-hom-lemma), [RD.5/rigid-trace-morphism](#RD-5-rigid-trace-morphism), `RD.5/compact-support-vanishing-above-twice-dimension`, [RD.5/finite-etale-trace-projector](#RD-5-finite-etale-trace-projector), [RD.5/compact-support-gysin-and-trace](#RD-5-compact-support-gysin-and-trace), `RD.4/rigid-cohomology-with-supports`, `RD.4/compactly-supported-rigid-cohomology`, `RD.4/localisation-sequence`, `RD.4/excision-sequence`, `RD.4/overconvergent-de-rham-complex`.

Sources:

- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, 2.2, (2.2.1)–(2.2.2), pp. 4–5: Defines the pairing between cohomology with supports in Z and compactly supported cohomology of Z, the duality morphism ψ_{Z,X} after composing with the trace, and the morphism of triangles.
- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, 2.3 (i)–(iii), p. 5: Lists the compatibilities with crystalline duality, finite étale traces and Gysin maps.
- Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, Section 8.2, p. 54; Section 9.3, p. 65: Uses the same construction with coefficients and the compatibility with excision in the proof of Poincaré duality.

<a id="RD-5-kunneth-pairing-on-tubes"></a>

### `kunneth-pairing-on-tubes` — Künneth pairings on product tubes and the Künneth morphisms with supports

`PadicDifferentialEquationsAndRigidCohomology:RD.5/kunneth-pairing-on-tubes` · construction.

For i = 1, 2 let X_i be separated k-schemes of finite type with closed Z_i ⊂ X_i, compactifications X̄_i, closed immersions X̄_i ⊂ P_i into formal W-schemes smooth near X_i, projections p_i: ]X̄_1 × X̄_2[ → ]X̄_i[, and sheaves E_i of K-vector spaces on ]X̄_i[. There are canonical pairings p_1^{-1}Γ†_{]Z_1[}(E_1) ⊗_K p_2^{-1}Γ†_{]Z_2[}(E_2) → Γ†_{]Z_1×Z_2[}(p_1^{-1}E_1 ⊗ p_2^{-1}E_2) and p_1^{-1}Γ_{]X_1[}(E_1) ⊗_K p_2^{-1}Γ_{]X_2[}(E_2) → Γ_{]X_1×X_2[}(p_1^{-1}E_1 ⊗ p_2^{-1}E_2). Applied to the de Rham complexes of E_i ∈ F-Isoc†(X_i/K) and the external wedge product, they induce the Künneth morphisms RΓ_{Z_1,rig}(X_1, E_1) ⊗_K RΓ_{Z_2,rig}(X_2, E_2) → RΓ_{Z_1×Z_2,rig}(X_1 × X_2, E_1 ⊠ E_2) and RΓ_{c,rig}(X_1, E_1) ⊗_K RΓ_{c,rig}(X_2, E_2) → RΓ_{c,rig}(X_1 × X_2, E_1 ⊠ E_2), compatible with functoriality and Frobenius, and for fixed X_2 they are morphisms of triangles from (localisation triangle of (X_1, Z_1)) ⊗ RΓ_rig(X_2) to the localisation triangle of (X_1 × X_2, Z_1 × X_2), and likewise for excision triangles with compact supports. Properties: (i) for proper smooth X_i and Z_i = X_i they are the crystalline Künneth maps; (ii) they commute with Tr_{f_1} ⊗ Tr_{f_2} = Tr_{f_1×f_2} (and the compact-support traces) for finite étale covers of smooth affines; (iii) they commute with Gysin maps G_{Z'_1/X'_1} ⊗ G_{Z'_2/X'_2} = G_{Z'_1×Z'_2/X'_1×X'_2}.

Hypotheses and conventions:

- Products of frames: ]X̄_1 × X̄_2[ = ]X̄_1[ × ]X̄_2[ and products of strict neighbourhoods are cofinal (RD.3/strict-neighbourhood); Γ†_{]Z[} denotes the kernel of j†_X → j†_U.

Construction or proof:

1. The pairings on sheaves: for germs of sections of E_i on strict neighbourhoods, the external product is a germ on the product neighbourhood; supports multiply because ]Z_1 × Z_2[ = ]Z_1[ × ]Z_2[ (Berthelot 3.1).
2. Apply to multiplicative resolutions of the de Rham complexes and take global sections; the Künneth map of tensor products of complexes of K-vector spaces gives the morphisms (Berthelot (3.1.1)–(3.1.2)).
3. Compatibility with triangles (Berthelot (3.1.3)–(3.1.4)) is compatibility at the level of complexes with j†_{X_1} → j†_{U_1} and Γ_{]U_1[} → Γ_{]X_1[}.
4. (i)–(iii): Berthelot 3.3, from RD.5/finite-etale-trace-projector, RD.5/compact-support-gysin-and-trace and the crystalline comparison of traces.

API:

| name | role | statement |
|---|---|---|
| `kunnethPairingTube` | data | The pairing p_1^{-1}Γ†_{]Z_1[}E_1 ⊗ p_2^{-1}Γ†_{]Z_2[}E_2 → Γ†_{]Z_1×Z_2[}(E_1 ⊠ E_2), and its compact-support analogue. |
| `kunnethMorphismSupports` | data | RΓ_{Z_1,rig}(X_1, E_1) ⊗ RΓ_{Z_2,rig}(X_2, E_2) → RΓ_{Z_1×Z_2,rig}(X_1×X_2, E_1 ⊠ E_2). |
| `kunnethMorphismCompact` | data | RΓ_{c,rig}(X_1, E_1) ⊗ RΓ_{c,rig}(X_2, E_2) → RΓ_{c,rig}(X_1×X_2, E_1 ⊠ E_2). |
| `kunnethMorphism_triangle` | compatibility | For fixed X_2 the Künneth morphisms are morphisms of localisation (resp. excision) triangles in the first variable. |
| `kunnethMorphism_trace` | compatibility | For finite étale covers f_i of smooth affines, the Künneth morphisms commute with Tr_{f_1} ⊗ Tr_{f_2} and Tr_{f_1×f_2} (and with the compact-support traces). |
| `kunnethMorphism_gysin` | compatibility | The Künneth morphisms commute with products of Gysin maps of liftable closed immersions. |
| `kunnethMorphism_frobenius` | compatibility | The Künneth morphisms intertwine Φ ⊗ Φ with Φ. |
| `kunnethMorphism_rigidTrace` | compatibility | In top degree, Tr_{X_1×X_2} ∘ kunneth = Tr_{X_1} ⊗ Tr_{X_2}. |

Unit tests:

- `kunnethMorphism_point` (degenerate): For X_2 = Spec k and E_2 = O, both Künneth morphisms are the identity of RΓ(X_1, E_1).
- `kunnethMorphism_affinePlane_top` (computation): For X_1 = X_2 = A^1, the compact-support morphism in degree 4 is an isomorphism K(−1) ⊗ K(−1) ≅ K(−2) compatible with traces.
- `kunnethMorphism_gm_square` (computation): For X_1 = X_2 = G_m, H^2_rig(G_m × G_m) is spanned by the image of (dt_1/t_1) ⊗ (dt_2/t_2) and has Frobenius q^2.
- `kunnethMorphism_supports_nonexample` (non-example): The supported morphism needs supports Z_1 × Z_2: for Z_1 = {0} ⊂ A^1 and Z_2 = A^1 the target is H_{{0}×A^1}, not H_{{0}×{0}}, which has different dimension in degree 2.

Uses:

- Kedlaya, Finiteness, Theorem 1.2.4 and Section 9.4, pp. 4, 66–67: the Künneth isomorphisms with and without supports are statements about these morphisms.
- Berthelot, Dualité, Théorème 3.2, p. 6: the double induction over dim Z_1 + dim Z_2 uses the triangle compatibilities.
- RD.5/kunneth-morphism: supplies the construction formerly cited to Tsuzuki, Hiroshima Math. J. 29, Section 6.3.

Acceptance:

- For X_1 = X_2 = A^1 with E_i = O, the compact-support Künneth map sends Tr-dual generators of H^2_{c,rig}(A^1) ⊗ H^2_{c,rig}(A^1) to the generator of H^4_{c,rig}(A^2).
- For X_2 = Spec k the morphisms are the identity.

Depends on: `RD.3/frame`, `RD.3/tube`, `RD.3/strict-neighbourhood`, `RD.4/overconvergent-de-rham-complex`, `RD.4/rigid-cohomology-with-supports`, `RD.4/compactly-supported-rigid-cohomology`, `RD.4/localisation-sequence`, `RD.4/excision-sequence`, `RD.4/frobenius-on-rigid-cohomology`, [RD.5/finite-etale-trace-projector](#RD-5-finite-etale-trace-projector), [RD.5/compact-support-gysin-and-trace](#RD-5-compact-support-gysin-and-trace), `mathlib:TensorProduct`.

Sources:

- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, 3.1, (3.1.1)–(3.1.4), pp. 5–6: Defines the canonical pairings on product tubes with and without supports and the Künneth morphisms, and states that for fixed X_2 they form morphisms of triangles.
- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, 3.3 (i)–(iii), p. 6: Lists the compatibilities with crystalline Künneth maps, finite étale traces and Gysin maps used in the induction.
- Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, Section 9.4, p. 66: Takes the Künneth morphisms with coefficients as given and proves they are isomorphisms.

<a id="RD-5-rigid-cohomology-base-field-extension"></a>

### `rigid-cohomology-base-field-extension` — Rigid cohomology commutes with arbitrary extension of the base field

`PadicDifferentialEquationsAndRigidCohomology:RD.5/rigid-cohomology-base-field-extension` · theorem.

Let k ⊂ k' be an arbitrary extension of fields of characteristic p, with Cohen rings W → W' and K → K' (complete discretely valued, residue fields k, k'). For a separated k-scheme X of finite type, the natural maps H^i_rig(X/K) ⊗_K K' → H^i_rig(X_{k'}/K') and H^i_{c,rig}(X/K) ⊗_K K' → H^i_{c,rig}(X_{k'}/K') are isomorphisms for all i.

Hypotheses and conventions:

- Constant coefficients, as in Berthelot's remark; for finite extensions and coefficients see RD.4/finite-flat-base-change.
- Both sides are finite dimensional (RD.5/finiteness-of-rigid-cohomology, RD.5/finiteness-of-compactly-supported-rigid-cohomology).

Proof:

1. Double induction on dimension exactly as for duality and Künneth (Berthelot Remarque after 3.4): (a)_n for smooth X of dimension ≤ n, (b)_n for cohomology with supports in Z of dimension ≤ n inside smooth X, using the localisation and excision triangles (RD.4/localisation-sequence, RD.4/excision-sequence), Gysin maps for liftable smooth pairs (RD.4/gysin-isomorphism), the proper smooth case through the crystalline comparison, and de Jong's alterations with the finite étale trace projector to pass from opens of proper smooth schemes to general smooth X (RD.5/finite-etale-trace-projector, SchemeAndStackFoundations:SF.4/de-jong-alteration-theorem).
2. Proper smooth case: crystalline cohomology commutes with flat base change of the Cohen ring.
3. Compact supports from the result for H_rig by Poincaré duality on smooth strata and excision.

Acceptance:

- For X = G_m both sides are K' in degrees 0 and 1.
- For X = P^1 the map identifies the classes of the hyperplane in degree 2.

Depends on: `RD.4/localisation-sequence`, `RD.4/excision-sequence`, `RD.4/gysin-isomorphism`, [RD.5/finite-etale-trace-projector](#RD-5-finite-etale-trace-projector), `RD.5/poincare-duality`, `RD.5/finiteness-of-rigid-cohomology`, `RD.5/finiteness-of-compactly-supported-rigid-cohomology`, `SchemeAndStackFoundations:SF.4/de-jong-alteration-theorem`, `RD.4/finite-flat-base-change`.

Sources:

- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, Remarque after 3.4, p. 6: States that the method of the duality and Künneth inductions proves that rigid cohomology commutes with an arbitrary extension of the base field.
- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, Théorème 2.4 and its proof, p. 5: The double induction (a)_n, (b)_n with de Jong's theorem and the finite étale projector that the remark refers to.

## Dévissage and proper descent (sub-layer RD.5d)

Kedlaya's finiteness proof uses two geometric inputs (RT-AREA-padic-2/33). For smooth varieties it projects an open dense affine finite étale onto affine space; the first pass keeps that theorem under its id RD.3/etale-cover-of-affine-space, and its source, Kedlaya's finite projection to projective space étale off the hyperplane at infinity, is planned here. For singular varieties it uses a proper hypercovering by smooth schemes (de Jong's alterations from SchemeAndStackFoundations:SF.4) and the descent spectral sequence of Chiarellotto–Tsuzuki and Tsuzuki. Tsuzuki's proof of proper descent is not public; Zureick-Brown's is, on Le Stum's overconvergent site, whose finitely presented modules are the overconvergent isocrystals and whose cohomology is rigid cohomology. Descent holds for Zariski and closed coverings and for modifications (via Tsuzuki's blow-up lemmas and Chow's lemma), for finite flat and fppf coverings (via Raynaud–Gruson flattening and monogenic reductions), and hence for proper surjections and proper hypercoverings, which gives the spectral sequence.

<a id="RD-5-projection-etale-off-hyperplane"></a>

### `projection-etale-off-hyperplane` — Kedlaya's finite projections to projective space étale off the hyperplane at infinity

`PadicDifferentialEquationsAndRigidCohomology:RD.5/projection-etale-off-hyperplane` · theorem.

Let k be a field of characteristic p > 0, X a geometrically reduced projective k-scheme of pure dimension n with an ample line bundle L, D ⊂ X a closed subscheme of dimension < n, and S a zero-dimensional subscheme of the smooth locus of X not meeting D. Then there is a finite morphism f: X → P^n_k given by n + 1 sections of some power of L, étale away from the hyperplane H at infinity, with f(D) ⊆ H and f(S) ∩ H = ∅. If moreover D_1, …, D_m are irreducible divisors meeting transversely at a smooth point x, one can take an open dense U ∋ x with a finite étale map U → A^n sending the D_j into coordinate hyperplanes.

Hypotheses and conventions:

- Geometric reducedness is necessary: a scheme with a generically étale map to a smooth scheme has generically smooth components.
- Finite fields are allowed: the sections are produced by powers 'sufficiently divisible' rather than by generic choice.

Proof:

1. Lemma 3: n + 1 sections of an ample bundle without common zero define a finite map to P^n (fibres are both affine and proper).
2. Lemma 4: for l sufficiently divisible there is a section of L^l vanishing on D but not at any point of a given finite subscheme Z (complement of a section is affine).
3. Lemma 5: inductively choose sections s_1, …, s_n vanishing on S (and along D_i) whose zero loci cut D in the expected codimension, so that they have no common zero on D.
4. Lemma 6: with α a section with zero locus D and functions f_i = β_i/α^{j_i} giving a map unramified at S, the sections δ_i = β_i α^{l−2j_i} + γ_i^2, with γ_i vanishing on S, define a finite map unramified at S, since the squares have zero differential along S.
5. Theorem 1: let g be the finite map from s^m, s_1, …, s_n given by Lemma 6, unramified at S, and E the closed locus of X \ D where g ramifies; choose t vanishing on E but not on S (Lemma 4) and t_1, …, t_n without common zero on the zero locus Z of t (Lemma 5), and put u_0 = t^{pl}, u_i = s_i s^{m(pr−1)} t^{p(l−1)} + t_i^p. In characteristic p the p-th powers t_i^p have zero differential, so off Z the differentials of u_i/u_0 are those of s_i/s^m times the unit (s^{rm}/t)^p; hence the finite map f = (u_0 : … : u_n) (Lemma 3) is étale off the hyperplane u_0 = 0, which contains f(D) and misses f(S).
6. Theorem 2: replace X by a projective compactification of an affine neighbourhood of x, blow up away from x so that all intersections of the D_i are irreducible, and run the proof of Theorem 1 with S = {x} and s_i, t_i vanishing along D_i; restrict to the preimage of A^n = P^n \ H.

Acceptance:

- For X = P^1 and D = {∞}, f can be taken to be the identity.
- Non-example of the naive choice: for E: y^2 = x^3 + ax + b over F_q (p odd) and D = {O}, the coordinate x: E → P^1 is finite with f(D) = ∞ but ramified over the three roots of the cubic in A^1, so it is not étale off ∞; the theorem replaces it by sections of a higher power of O(O) modified by p-th powers.

Depends on: `SchemeAndStackFoundations:SF.0`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:AlgebraicGeometry.IsSeparated`.

Sources:

- Kiran S. Kedlaya, *More étale covers of affine spaces in positive characteristic*, Theorem 1 and Theorem 2, pp. 1–2: States the finite projection to projective space étale off the hyperplane at infinity with prescribed behaviour on D and S, and the affine refinement with transverse divisors.
- Kiran S. Kedlaya, *More étale covers of affine spaces in positive characteristic*, Proofs of Theorems 1 and 2, p. 5: Builds the étale-off-the-hyperplane map from the unramified map of Lemma 6 by adding p-th powers, and handles transverse divisors by blowing up away from the point.
- Kiran S. Kedlaya, *More étale covers of affine spaces in positive characteristic*, Lemmas 3–6, pp. 2–4: Noether normalisation lemmas with sections of powers of an ample bundle, valid over finite fields, and the construction of a map unramified at the chosen points.
- Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, Proposition 9.1.2, p. 61: The form used in the finiteness proof: an open dense affine around a smooth point, finite étale over affine space.

<a id="RD-5-overconvergent-site"></a>

### `overconvergent-site` — Le Stum's overconvergent site of a variety ★

`PadicDifferentialEquationsAndRigidCohomology:RD.5/overconvergent-site` · definition · planet: Le Stum's overconvergent site.

Fix a complete discretely valued field K of characteristic 0 with ring of integers V and residue field k. An overconvergent variety over V is a triple (X ⊂ P ← V) of a k-variety X, a locally closed immersion of X into the special fibre of a formal V-scheme P (locally topologically of finite presentation) and a morphism λ: V → P_K of strictly K-analytic varieties; its tube is ]X[_V = λ^{-1}(sp^{-1}(X)). The category An†(V) is the localisation of the category of such triples (with formal morphisms) at strict neighbourhoods, i.e. morphisms are germs of analytic maps defined on a neighbourhood of the tube; it carries the analytic topology induced from coverings of the tubes. For a k-variety X (over an overconvergent base (C, O)), the overconvergent site An†(X/O) is the slice category of overconvergent varieties (Y ⊂ Q ← W) together with a morphism Y → X over C, with the induced topology; its good version An†_g(X/O) uses good analytic varieties. It is ringed by the sheaf O† of overconvergent functions, (Y, W) ↦ Γ(]Y[_W, i^{-1}O_W). An overconvergent crystal is an O†-module whose transition maps along all morphisms are isomorphisms; Mod†_{g,fp}(X/O) denotes the finitely presented O†-modules on the good site.

Hypotheses and conventions:

- K of characteristic 0 (needed for the comparison with connections, Le Stum Theorem 3.5.9).
- Analytic varieties are strictly K-analytic in Berkovich's sense; Le Stum's comparison theorem (RD.5/overconvergent-site-comparison) identifies the cohomology with Berthelot's rigid cohomology of RD.4, so the Berkovich formalism is not exported beyond this layer.

Construction or proof:

1. Formal embeddings and tubes: Le Stum §2.1 (Definition 2.1.2, Proposition 2.1.6: the tube functor is left exact).
2. Overconvergent varieties and the localisation at strict neighbourhoods: Definitions 2.2.1 and 2.3.7; the analytic topology: Definition 2.4.1.
3. The site of X: Definition 2.4.11 (X/O := j_!(X) as an overconvergent sheaf); good sites: Definition 2.5.13; a geometric realisation (X, V) of X over (C, O) is a covering of X/O (Proposition 2.5.14).
4. The ring O†: Definition 3.3.4; crystals: Definition 3.3.7; on a single overconvergent variety crystals are the i^{-1}O_V-modules on the tube (Proposition 3.3.8).

API:

| name | role | statement |
|---|---|---|
| `OverconvergentSite` | data | The ringed site (An†_g(X/O), O†) attached to a k-variety X over an overconvergent base (C, O). |
| `OverconvergentSite.realization` | projection | For an object (Y, W) of the site and a sheaf E, the realisation E_{Y,W} is a sheaf on the tube ]Y[_W; morphisms (f, u) give transition maps ]u[^{-1}E_{Y,W} → E_{Y',W'}. |
| `OverconvergentSite.functorial` | functoriality | A morphism f: X' → X over C induces a morphism of ringed topoi f_{An†}: (X'/O)_{An†} → (X/O)_{An†}, with (g ∘ f)_{An†} = g_{An†} ∘ f_{An†} and id_{An†} = id. |
| `OverconvergentSite.crystal_iff_realisations` | characterisation | An O†-module is a crystal iff its realisations on a covering family are crystals (transition maps isomorphisms). |
| `OverconvergentSite.crystals_on_variety` | equivalence | On a single overconvergent variety (X, V), crystals are equivalent to i_X^{-1}O_V-modules on ]X[_V (Le Stum Proposition 3.3.8). |
| `OverconvergentSite.restriction_closed` | functoriality | For a locally closed immersion α: U → X the restriction α_{An†} is the localisation of the topos at U/O, and α^{-1} preserves crystals. |

Unit tests:

- `overconvergentSite_point_sections` (degenerate): For X = Spec k over Spf V, Γ(An†(X/V), O†) = K.
- `overconvergentSite_affineLine_sections` (computation): For X = A^1_k, the value of O† on the realisation (A^1 ⊂ P̂^1_V ← P^{1,an}_K) is K⟨t⟩† and not the Tate algebra K⟨t⟩ (the tube is the closed disc, but germs are taken on strict neighbourhoods).
- `overconvergentSite_not_etale_site` (non-example): A finite étale surjection Y → X of k-varieties is not in general a covering of An†(X/O) (Zureick-Brown Remark 1.2); descent along it is a theorem (RD.5/fppf-cohomological-descent), not a sheaf axiom.
- `overconvergentSite_realisation_covers` (characterisation): A geometric realisation (X, V) of X (formal embedding smooth near X, V a neighbourhood of the tube) is a covering of the final object X/O of the good site.

Uses:

- Zureick-Brown, Theorem 1.1, p. 2: cohomological descent for proper and fppf hypercovers is proved for finitely presented O†-modules on this site.
- Le Stum, Corollary 4.6.8, p. 91: rigid cohomology with coefficients is the cohomology of the corresponding module on this site.
- RD.5/proper-hypercover-descent-spectral-sequence: gives the descent spectral sequence used in Kedlaya's proof of finiteness for singular X.

Acceptance:

- For X = Spec k and P = Spf V, An†(X/V) has the final object (Spec k ⊂ Spf V ← M(K)) and O† on it is K.
- For X = A^1_k with realisation (A^1 ⊂ P̂^1_V ← P^{1,an}_K), the sections of O† on that object are the overconvergent functions K⟨t⟩†.

Depends on: `RD.3/frame`, `RD.3/tube`, `RD.3/strict-neighbourhood`, `RD.3/j-dagger`, `AdicSpacesPartII:F1/dagger-algebra`, `mathlib:CategoryTheory.Sheaf`.

Used here by: [RD.5/overconvergent-site-comparison](#RD-5-overconvergent-site-comparison), [RD.5/modification-cohomological-descent](#RD-5-modification-cohomological-descent), [RD.5/fppf-cohomological-descent](#RD-5-fppf-cohomological-descent).

Sources:

- Bernard Le Stum, *The overconvergent site*, Definitions 2.2.1, 2.3.7, 2.4.1, pp. 15, 24, 28: Defines overconvergent varieties, their category as a localisation at strict neighbourhoods and its analytic topology.
- Bernard Le Stum, *The overconvergent site*, Definitions 2.4.11 and 2.5.13, Proposition 2.5.14, pp. 33, 41: Defines the overconvergent site of a variety over an overconvergent base, its good version, and shows that a geometric realisation covers the site.
- Bernard Le Stum, *The overconvergent site*, Definitions 3.3.4 and 3.3.7, Proposition 3.3.8, pp. 52–54: Defines the sheaf of overconvergent functions, overconvergent modules and crystals, and identifies crystals on one variety with modules on its tube.
- David Zureick-Brown, *Cohomological descent on the overconvergent site*, Section 4, pp. 10–16: Recalls the overconvergent site and its realisations as the setting for cohomological descent.

<a id="RD-5-overconvergent-site-comparison"></a>

### `overconvergent-site-comparison` — Overconvergent isocrystals are crystals on the overconvergent site, with the same cohomology

`PadicDifferentialEquationsAndRigidCohomology:RD.5/overconvergent-site-comparison` · theorem.

Let K have characteristic 0, S a good formal V-scheme and p: X → S_k a morphism of k-varieties. Then there is a canonical equivalence Mod†_{g,fp}(X/S) ≃ Isoc†(X/S) between finitely presented O†-modules on the good overconvergent site and overconvergent isocrystals, and for E ∈ Isoc†(X/S) one has (Rp_{rig*}E)^{an} = Rp_{X/S*}E. In particular, for S = Spf V and every i, H^i_rig(X/K, E) = H^i((X/V)_{An†_g}, E), compatibly with pullback along morphisms of varieties and with Frobenius pullback.

Hypotheses and conventions:

- Char K = 0; good base (every point of the analytic base has an affinoid neighbourhood).
- Isoc†(X/S) and H^i_rig are those of RD.3/overconvergent-isocrystals-of-a-variety and RD.4/rigid-cohomology (Berthelot's definition through frames and j†).

Proof:

1. On a geometric realisation (X, V) (formal embedding proper and smooth at X), crystals are i^{-1}O_V-modules on ]X[_V with an overconvergent stratification, equivalently (char 0) coherent modules with an overconvergent integrable connection (Le Stum Theorem 3.5.9 via Propositions 3.5.3 and 3.5.6); this matches the frame description of Isoc† (RD.3/overconvergent-isocrystal-connection-form), independently of the realisation (Le Stum Proposition 3.5.11).
2. Cohomology: the push-forward to the realisation is computed by the de Rham complex of the connection on the tube (Le Stum Proposition 4.5.4 and the Poincaré lemma, Proposition 4.5.5); globalise by Zariski localisation for sheaves of Zariski type (Le Stum §4.6, Theorem 4.6.7), which gives Berthelot's j†-de Rham complex (RD.4/overconvergent-de-rham-complex).
3. Functoriality and Frobenius: both sides are functorial in X, and Frobenius pullback acts on crystals by the absolute Frobenius of X.

Acceptance:

- For X = A^1_k and E = O, H^0 = K and H^1 = K⟨t⟩†dt / d(K⟨t⟩†) = 0 (every overconvergent series has an overconvergent antiderivative), as for rigid cohomology (RD.4/cohomology-of-affine-space).
- For X = G_m, H^1 is spanned by dt/t on both sides (RD.4/cohomology-of-multiplicative-group).

Depends on: [RD.5/overconvergent-site](#RD-5-overconvergent-site), `RD.3/overconvergent-isocrystals-of-a-variety`, `RD.3/overconvergent-isocrystal-connection-form`, `RD.4/rigid-cohomology`, `RD.4/overconvergent-de-rham-complex`, `RD.3/strong-fibration-theorem`.

Used here by: [RD.5/modification-cohomological-descent](#RD-5-modification-cohomological-descent), [RD.5/proper-hypercover-descent-spectral-sequence](#RD-5-proper-hypercover-descent-spectral-sequence).

Sources:

- Bernard Le Stum, *The overconvergent site*, Theorem 3.5.9 and Proposition 3.5.11, pp. 67–68: Identifies finitely presented modules on the good site with coherent modules with overconvergent integrable connection on a realisation, hence with overconvergent isocrystals.
- Bernard Le Stum, *The overconvergent site*, Theorem 4.6.7 and Corollary 4.6.8, p. 91: States the equivalence with Isoc† and that rigid cohomology equals the cohomology of the site, also with coefficients.
- David Zureick-Brown, *Cohomological descent on the overconvergent site*, Section 1.4 (1), p. 2: Uses this comparison to turn descent on the site into the descent spectral sequence for rigid cohomology.

<a id="RD-5-modification-cohomological-descent"></a>

### `modification-cohomological-descent` — Modifications are universally of cohomological descent for overconvergent crystals

`PadicDifferentialEquationsAndRigidCohomology:RD.5/modification-cohomological-descent` · theorem.

Let p: X → Y be a modification of k-varieties (proper, and an isomorphism over a dense open of Y). Then p, viewed as a morphism of sheaves on the overconvergent site over any overconvergent base, is universally of cohomological descent with respect to overconvergent crystals: for every base change Y' → Y and every crystal F on Y', F → Rp'_{•*}p'^{*}_•F is an isomorphism for the Čech hypercover of p'. The same holds for a locally finite Zariski covering, a covering by closed subschemes, and the map from the disjoint union of the reduced irreducible components.

Hypotheses and conventions:

- k-varieties in Zureick-Brown's sense (locally of finite type, not necessarily separated or reduced).
- Descent is with respect to crystals, not all abelian sheaves (Zureick-Brown Remark 1.2 explains why the étale template does not apply).

Proof:

1. Zariski and closed coverings (Zureick-Brown Theorem 5.9): the coverings by open or closed pieces induce surjections on tubes; reduce to realisations, where descent holds for coverings of analytic spaces (Lemmas 5.4, 5.6), and conclude with the formal calculus of universal cohomological descent (Zureick-Brown Corollary 3.18, from EnhancedDerivedSheaves:E2 as requested). Irreducible components: Corollary 5.12.
2. Blow-up along an ideal generated by two elements f, g (Zureick-Brown Lemma 5.14, after Tsuzuki 2004, Lemma 3.4.5): cover the tube by U_1 = ]Z[ and U_2 = {|f̂| > λ or |ĝ| > λ}; over U_1 the blow-up tube is P^1 × U_1 (a map with a section, Theorem 3.16 (ii), and Lemma 5.2 since the map of tubes is surjective), over U_2 the blow-up is an isomorphism of tubes; glue with Theorem 3.17 (c), (d).
3. General blow-ups reduce to two-generator ones by a sequence of blow-ups (Lemma 5.15, Tsuzuki's Lemma 3.4.4); a modification is dominated, by Chow's lemma, by a projective one, locally a blow-up (SchemeAndStackFoundations:SF.4/chow-lemma, SchemeAndStackFoundations:SF.4/modification-domination); cancellation (Theorem 3.17 (b)) finishes (Zureick-Brown Proposition 5.16).

Acceptance:

- The normalisation p: Ỹ = P^1 → Y of a nodal cubic is a modification; Ỹ ×_Y Ỹ is Ỹ together with the two points (y_1, y_2), (y_2, y_1) over the node, and the Čech descent spectral sequence of p produces from them the extra class of H^1_rig(Y), of dimension 1 while H^1_rig(Ỹ) = 0.
- Degenerate case: an isomorphism is a modification whose Čech hypercovering is constant, and descent is the identity.

Depends on: [RD.5/overconvergent-site](#RD-5-overconvergent-site), [RD.5/overconvergent-site-comparison](#RD-5-overconvergent-site-comparison), `EnhancedDerivedSheaves:E2`, `EnhancedDerivedSheaves:E2/hypercover`, `SchemeAndStackFoundations:SF.4/chow-lemma`, `SchemeAndStackFoundations:SF.4/modification-domination`, `SchemeAndStackFoundations:SF.4/modification`.

Used here by: [RD.5/fppf-cohomological-descent](#RD-5-fppf-cohomological-descent), [RD.5/proper-surjection-cohomological-descent](#RD-5-proper-surjection-cohomological-descent).

Sources:

- David Zureick-Brown, *Cohomological descent on the overconvergent site*, Theorem 5.9, Corollaries 5.11–5.12, pp. 19–20: Descent for locally finite Zariski coverings, closed coverings and the irreducible components.
- David Zureick-Brown, *Cohomological descent on the overconvergent site*, Lemmas 5.14–5.15 and Proposition 5.16, pp. 20–21: Descent for blow-ups along two-generator ideals, reduction of general blow-ups, and descent for modifications via Chow's lemma.
- David Zureick-Brown, *Cohomological descent on the overconvergent site*, Theorems 3.16–3.17 and Corollary 3.18, pp. 9–10: The formal calculus of universal cohomological descent used to glue.

<a id="RD-5-fppf-cohomological-descent"></a>

### `fppf-cohomological-descent` — Finite flat and fppf coverings are universally of cohomological descent for finitely presented crystals

`PadicDifferentialEquationsAndRigidCohomology:RD.5/fppf-cohomological-descent` · theorem.

(a) Let (f, u): (X', V') → (X, V) be a finite morphism of overconvergent varieties such that, after shrinking V and V', u is universally flat and surjective. Then (f, u) is universally of cohomological descent for finitely presented overconvergent crystals. (b) Every fppf covering p: X → Y of k-varieties (faithfully flat, locally of finite presentation) is universally of cohomological descent for finitely presented crystals on the overconvergent site.

Hypotheses and conventions:

- Finitely presented crystals (realised as i^{-1} of coherent modules on a neighbourhood).

Proof:

1. (a) By the Čech criterion it suffices to show R^q p_{i*}p_i^* F = 0 for q > 0 and exactness of the Čech complex; on realisations these are vanishing of higher direct images of coherent sheaves along finite maps of analytic spaces and fpqc descent for coherent sheaves in the flat quasi-finite topology (Zureick-Brown Proposition 5.19, using Berkovich 1993, Corollary 4.3.2 and Proposition 4.1.2).
2. (b) Step 0: refine an fppf covering by a composite of finite locally free surjections and Zariski coverings (Stacks 05WN) and reduce by Theorem 5.9 and Corollary 3.18. Step 1 (monogenic): embed and homogenise; flatten the projective homogenisation by a modification away from X (Raynaud–Gruson, SchemeAndStackFoundations:SF.4/flattening-by-blowup), obtaining a finite flat map of formal schemes, and apply (a). Step 2: a finite field extension is a tower of monogenic ones. Step 3: over the algebraic closure, finite locally free maps are locally monogenic (Bosch–Lütkebohmert–Raynaud §2.3 Proposition 3), descend to a finite extension of k (Zureick-Brown proof of Theorem 1.1 (i), pp. 22–24).
3. Remark: the modification in Step 1 is needed: a monogenic map can homogenise to a non-flat map (Zureick-Brown Remark 5.20).

Acceptance:

- A purely inseparable extension k ⊂ k^{1/p} gives a monogenic finite flat covering Spec k^{1/p} → Spec k of cohomological descent, compatible with the invariance of rigid cohomology under nilpotent thickenings used in RD.5/smooth-proper-hypercovering.
- The Kummer covering t ↦ t^ℓ of G_m (ℓ prime to p) is finite flat; descent recovers H^*_rig(G_m) from the Čech complex of the covering.

Depends on: [RD.5/overconvergent-site](#RD-5-overconvergent-site), [RD.5/modification-cohomological-descent](#RD-5-modification-cohomological-descent), `EnhancedDerivedSheaves:E2`, `SchemeAndStackFoundations:SF.4/flattening-by-blowup`, `AdicSpacesPartII:R3/tate-kiehl-affinoid`.

Used here by: [RD.5/proper-surjection-cohomological-descent](#RD-5-proper-surjection-cohomological-descent).

Sources:

- David Zureick-Brown, *Cohomological descent on the overconvergent site*, Definition 5.18 and Proposition 5.19, p. 22: Finite universally flat surjective maps of overconvergent varieties are universally of cohomological descent for finitely presented crystals.
- David Zureick-Brown, *Cohomological descent on the overconvergent site*, Proof of Theorem 1.1 (i) and Remark 5.20, pp. 22–24: Reduction of fppf descent to the finite locally free and monogenic cases, with the flattening modification.

<a id="RD-5-proper-surjection-cohomological-descent"></a>

### `proper-surjection-cohomological-descent` — Proper surjections are universally of cohomological descent for finitely presented crystals ★

`PadicDifferentialEquationsAndRigidCohomology:RD.5/proper-surjection-cohomological-descent` · theorem · planet: Proper cohomological descent.

Every proper surjective morphism p: X → Y of k-varieties is universally of cohomological descent for finitely presented crystals on the overconvergent site. Consequently every proper hypercovering Y_• → X (each Y_{n+1} → (cosk_n Y_•)_{n+1} proper surjective) is universally of cohomological descent for finitely presented crystals.

Hypotheses and conventions:

- Finitely presented crystals; proper hypercoverings in the sense of SGA 4 Vbis (for P the class of proper surjections, stable under base change and composition).

Proof:

1. Chow's lemma (SchemeAndStackFoundations:SF.4/chow-lemma) and cancellation reduce to p projective; Zariski-locally on Y (RD.5/modification-cohomological-descent) assume Y affine.
2. Raynaud–Gruson flattening (SchemeAndStackFoundations:SF.4/flattening-by-blowup) gives a modification Y' → Y whose strict transform X' → Y' is flat; X' → Y' is an fppf covering, hence of descent (RD.5/fppf-cohomological-descent (b)), and Y' → Y is a modification (RD.5/modification-cohomological-descent); compose (Zureick-Brown Theorem 3.17 (c)) and cancel to X → Y (3.17 (b)) (Zureick-Brown proof of Theorem 1.1 (ii), p. 24).
3. Hypercoverings: a P-hypercovering with P the class of morphisms universally of cohomological descent is itself universally of cohomological descent (Zureick-Brown Theorem 3.16 (iv), Conrad Theorem 7.10), requested from EnhancedDerivedSheaves:E2.

Acceptance:

- The normalisation of the cuspidal cubic is a proper surjection which is a universal homeomorphism; descent gives H^*_rig(cusp) ≅ H^*_rig(P^1) (rigid cohomology does not see the cusp).
- For the blow-up Bl → A^2 at the origin with exceptional curve E ≅ P^1, descent along the proper surjection Bl ⊔ {0} → A^2 gives the abstract blow-up sequence … → H^i_rig(A^2) → H^i_rig(Bl) ⊕ H^i_rig(pt) → H^i_rig(E) → H^{i+1}_rig(A^2) → …, whence H^2_rig(Bl) ≅ H^2_rig(E) = K(−1).

Depends on: [RD.5/fppf-cohomological-descent](#RD-5-fppf-cohomological-descent), [RD.5/modification-cohomological-descent](#RD-5-modification-cohomological-descent), `SchemeAndStackFoundations:SF.4/chow-lemma`, `SchemeAndStackFoundations:SF.4/flattening-by-blowup`, `EnhancedDerivedSheaves:E2`.

Used here by: [RD.5/proper-hypercover-descent-spectral-sequence](#RD-5-proper-hypercover-descent-spectral-sequence).

Sources:

- David Zureick-Brown, *Cohomological descent on the overconvergent site*, Theorem 1.1 (ii) and its proof, pp. 2, 24: Proper surjections are universally of cohomological descent for finitely presented crystals, by Chow's lemma, Raynaud–Gruson flattening and the flat and modification cases.
- David Zureick-Brown, *Cohomological descent on the overconvergent site*, Theorem 3.16 (iv), p. 9: Hypercoverings built from morphisms universally of cohomological descent are universally of cohomological descent (citing Conrad, Theorem 7.10).
- Bruno Chiarellotto and Nobuo Tsuzuki, *Cohomological descent of rigid cohomology for étale coverings*, Section 1.2, p. 66; Theorem 7.4.1, p. 150: The earlier proof of descent for étale-proper hypercoverings in Berthelot's framework, of which the proper case (Tsuzuki, Invent. Math. 151) is the continuation.

<a id="RD-5-proper-hypercover-descent-spectral-sequence"></a>

### `proper-hypercover-descent-spectral-sequence` — The descent spectral sequence of rigid cohomology for proper hypercoverings (Chiarellotto–Tsuzuki, Tsuzuki)

`PadicDifferentialEquationsAndRigidCohomology:RD.5/proper-hypercover-descent-spectral-sequence` · theorem.

Let X be a separated k-scheme of finite type, E ∈ F-Isoc†(X/K) and f_•: Y_• → X a proper hypercovering by separated k-schemes of finite type. Then there is a spectral sequence E_1^{q,r} = H^r_rig(Y_q/K, f_q^*E) ⇒ H^{q+r}_rig(X/K, E), functorial in E and in the hypercovering, and compatible with Frobenius (the Frobenius of E_1 being that of each H_rig(Y_q, f_q^*E)). For an étale hypercovering it is the spectral sequence of Chiarellotto–Tsuzuki, Theorem 11.7.1; for a proper hypercovering it is Tsuzuki's (Invent. Math. 151, Theorem 4.5.1), here obtained through the overconvergent site.

Hypotheses and conventions:

- Overconvergent isocrystals are finitely presented crystals on the overconvergent site (RD.5/overconvergent-site-comparison).
- No smoothness of the Y_q is required; RD.5/smooth-proper-hypercovering supplies Y_q smooth over purely inseparable extensions for the finiteness application.

Proof:

1. By RD.5/proper-surjection-cohomological-descent, E → Rf_{•*}f_•^*E is an isomorphism on the overconvergent site of X.
2. Apply RΓ and the E_1 spectral sequence of an augmented simplicial topos (Zureick-Brown Remark 3.9, equation (3.9.3); EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent): E_1^{q,r} = H^r(Y_q, f_q^*E) ⇒ H^{q+r}(X, E).
3. Identify site cohomology with rigid cohomology termwise (RD.5/overconvergent-site-comparison, Le Stum Corollary 4.6.8); functoriality and Frobenius follow since Frobenius pullback is a morphism of hypercoverings over the absolute Frobenius of X.

Acceptance:

- For the normalisation Ỹ → Y of a nodal curve with node y and preimages y_1, y_2, the hypercovering Ỹ ⊔ {y} → Y gives the exact sequence 0 → H^0(Y) → H^0(Ỹ) ⊕ K → K^2 → H^1(Y) → H^1(Ỹ) → 0.
- For a Čech hypercovering of a Zariski open cover the spectral sequence is the Mayer–Vietoris spectral sequence.

Depends on: [RD.5/proper-surjection-cohomological-descent](#RD-5-proper-surjection-cohomological-descent), [RD.5/overconvergent-site-comparison](#RD-5-overconvergent-site-comparison), `EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`, `RD.4/rigid-cohomology`, `RD.4/frobenius-on-rigid-cohomology`.

Sources:

- David Zureick-Brown, *Cohomological descent on the overconvergent site*, Section 1.4 (1) and Remark 3.9, pp. 2, 7: Deduces the descent spectral sequence for rigid cohomology from cohomological descent on the overconvergent site and Le Stum's comparison.
- Bruno Chiarellotto and Nobuo Tsuzuki, *Cohomological descent of rigid cohomology for étale coverings*, Theorem 11.7.1 and Proposition 11.7.3, pp. 209–210: The spectral sequence for étale hypercoverings in Berthelot's rigid cohomology, via étale-proper hypercoverings and Nagata compactification.
- Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, Proof of Theorem 1.2.1, pp. 62–63: Uses this spectral sequence for the proper hypercovering of RD.5/smooth-proper-hypercovering, citing Tsuzuki 2003.

## Full faithfulness, docility and semistable reduction (sub-layer RD.5e)

The first pass assigns to RD.5 seven mixed full-faithfulness targets that use both the local slope and monodromy theory of RD.1–RD.2 and the coefficients of RD.3. This block adds the global statements around them. Unipotent monodromy along a boundary divisor is defined by Kedlaya through tubular decompositions on small frames; for a smooth proper compactification with simple normal crossings boundary it is D'Addezio's docility, stable under tensor operations and subquotients. Constant monodromy is exactly the obstruction to extending an overconvergent isocrystal across a divisor, and restriction to a dense open is fully faithful (with subquotient closure for overconvergent F-isocrystals and full faithfulness for convergent ones, as D'Addezio's Theorem 4.1.6 combines). Unipotent monodromy along a strict normal crossings divisor is equivalent to a logarithmic extension with nilpotent residues. Kedlaya's semistable reduction theorem makes every overconvergent F-isocrystal unipotent along the boundary after an alteration; the Kummer and Dwork isocrystals show that tame and wild alterations are both needed.

<a id="RD-5-unipotent-monodromy-along-boundary"></a>

### `unipotent-monodromy-along-boundary` — Constant and unipotent monodromy along a boundary divisor; docile isocrystals ★

`PadicDifferentialEquationsAndRigidCohomology:RD.5/unipotent-monodromy-along-boundary` · definition · planet: Unipotent monodromy along the boundary.

Let X ⊂ Y be an open immersion of smooth k-varieties with Z = Y \ X, and E an isocrystal on X overconvergent along Z. First, under Kedlaya's Hypothesis 4.3.2 (Y, X affine, Z smooth cut out by f with df a local basis direction, and a small frame), the tube of Z decomposes as ]Z[_Q × A^1_K[0, 1) and E restricts to a ∇-module on ]Z[_Q × A^1_K[λ, 1) for some λ < 1; E has constant (resp. unipotent) monodromy along Z if that restriction is constant (resp. admits an exhaustive filtration with constant quotients) as a log-∇-module relative to ]Z[_Q. In general, E has constant/unipotent monodromy along Z if this holds after every complete extension K'/K (residue field k') for every small frame enclosing an open V ⊂ Y in which V \ X is smooth and principal. When Y is smooth and proper and Z is a strict normal crossings divisor, an isocrystal (or F-isocrystal) on X overconvergent along Z with unipotent monodromy along Z is called docile; Isoc†(X)^doc denotes the full subcategory.

Hypotheses and conventions:

- Smooth X and Y; for k perfect it suffices to test on a dense open of each component of Z (Kedlaya Remark 4.4.3).
- Monodromy along a divisor is a codimension-one notion: removing a closed subset of codimension ≥ 2 from Y does not change it (Kedlaya Proposition 4.4.4).

Construction or proof:

1. Local definition: Kedlaya Lemma 4.3.3 (the tubular decomposition ]Z[_P ≅ ]Z[_Q × A^1[0, 1)) and Definition 4.3.4; constancy and unipotence of log-∇-modules on V × A^n_K(I): Kedlaya Definitions 3.2.5–3.2.6 with the structure theorem 3.3.4 (unipotent modules are U_I of a module with commuting nilpotent residues).
2. Global definition by testing on all small frames over all field extensions: Kedlaya Definition 4.4.2; independence of choices and Zariski locality: Kedlaya Remark 4.4.1 and the list before Definition 4.4.2.
3. Docility: D'Addezio Definition 4.4.1 (the same notion for a smooth proper compactification with simple normal crossings boundary).

API:

| name | role | statement |
|---|---|---|
| `HasUnipotentMonodromy` | data | The predicate on E ∈ Isoc†(X, Y/K) of having unipotent monodromy along Z = Y \ X; HasConstantMonodromy likewise. |
| `HasUnipotentMonodromy.subquotient` | structure | Unipotent monodromy is preserved by subobjects, quotients and extensions in Isoc†(X, Y/K). |
| `HasUnipotentMonodromy.tensor_dual` | structure | Unipotent monodromy is preserved by ⊗, internal Hom and duals; docile isocrystals form an abelian tensor subcategory Isoc†(X)^doc closed under subquotients. |
| `HasUnipotentMonodromy.zariski_local` | characterisation | E has unipotent monodromy along Z iff its restrictions to the members of an open cover of Y do. |
| `HasUnipotentMonodromy.of_dense_open_boundary` | characterisation | If U ⊂ Y is open with U ∩ Z dense in Z, unipotence along Z is equivalent to unipotence along U ∩ Z. |
| `HasConstantMonodromy.of_convergent_extension` | relation | If E extends to a convergent isocrystal on Y, it has constant monodromy along Z. |
| `HasUnipotentMonodromy.baseField` | functoriality | Unipotence is invariant under complete extensions K'/K of the coefficient field. |
| `Docile.rankOne_unramified` | example | A docile rank-one overconvergent isocrystal has zero residues along each component of D (D'Addezio, proof of Corollary 4.4.8). |

Unit tests:

- `docile_constant` (degenerate): O_X is docile along every SNC divisor D.
- `docile_kummer_nonexample` (non-example): The Kummer isocrystal ∇ = d + (1/2)dt/t on G_m (p odd) is not docile along {0, ∞} in P^1, though it is quasi-unipotent.
- `docile_kummer_pullback` (computation): The pullback of ∇ = d + (1/2)dt/t along the cover s ↦ t = s^2 is (O, d + ds/s), in which s^{−1} times the basis vector is horizontal; so the pullback is isomorphic to O_{G_m} and docile.
- `docile_dwork_nonexample` (non-example): The Dwork isocrystal on A^1 (∇ = d + π dt) is not docile along ∞ ⊂ P^1: its Swan conductor at ∞ is 1 (RD.1/dwork-exponential-module).
- `docile_tensor` (characterisation): If E and E' are docile along D then so are E ⊗ E', E^∨ and every subquotient of E in Isoc†(X).

Uses:

- Kedlaya, Semistable reduction I, Theorem 5.2.1, p. 45: constant monodromy along X \ U is the criterion for extending an isocrystal from U to X.
- Kedlaya, Semistable reduction I, Theorem 6.4.5, p. 56: unipotent monodromy along an SNC divisor is the criterion for a convergent log extension with nilpotent residues.
- D'Addezio, Theorem 4.4.3 and §4.4.11, pp. 20, 23: docile isocrystals satisfy a Lefschetz theorem; semistable reduction reduces the minimal slope conjecture to the docile case.
- RD.5/log-rigid-comparison-for-curves: unipotent monodromy at the cusps gives the log extension used for Igusa curves.

Acceptance:

- The constant F-isocrystal O_X is docile for every SNC compactification.
- The Kummer isocrystal on G_m given by ∇ = d + a dt/t with a ∈ (q − 1)^{−1}ℤ \ ℤ is not docile along {0, ∞}, but its pullback along t ↦ t^{q−1} is.

Depends on: `RD.3/overconvergent-isocrystals-of-a-variety`, `RD.3/frame`, `RD.3/tube`, `RD.3/strong-fibration-theorem`, `RD.2/unipotent-differential-module`, `RD.2/unipotent-iff-nilpotent-residue`, `AdicSpacesPartII:F1/dagger-snc-divisor`.

Used here by: [RD.5/extension-across-boundary](#RD-5-extension-across-boundary), [RD.5/log-extension-of-unipotent-isocrystal](#RD-5-log-extension-of-unipotent-isocrystal), [RD.5/global-semistable-reduction](#RD-5-global-semistable-reduction), [RD.5/docility-acceptance](#RD-5-docility-acceptance).

Sources:

- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, Hypothesis 4.3.2, Lemma 4.3.3 and Definition 4.3.4, p. 41: Defines constant and unipotent monodromy along a smooth principal divisor through the tubular decomposition of its tube.
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, Definition 4.4.2, Remark 4.4.3 and Proposition 4.4.4, p. 43: Extends the definition to arbitrary boundaries by testing on all small frames after field extension, and shows its codimension-one nature.
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, Definitions 3.2.5–3.2.6 and Proposition 3.2.20, pp. 19–20, 24: Constant and unipotent log-∇-modules on products with polyannuli, and stability of unipotence under subquotients and tensor products.
- Marco D’Addezio, *Parabolicity conjecture of F-isocrystals*, Definition 4.4.1, p. 19: Calls an overconvergent isocrystal on the complement of a simple normal crossings divisor in a smooth proper variety docile when it has unipotent monodromy along the divisor.

<a id="RD-5-extension-across-boundary"></a>

### `extension-across-boundary` — Kedlaya's extension theorem: constant monodromy is the obstruction to extending an overconvergent isocrystal

`PadicDifferentialEquationsAndRigidCohomology:RD.5/extension-across-boundary` · theorem.

Let U ⊂ X ⊂ Y be open immersions of k-varieties with X smooth and U dense in Y, and E an isocrystal on U overconvergent along Y \ U. (a) E extends to an isocrystal on X overconvergent along Y \ X iff E has constant monodromy along X \ U; the restriction functor Isoc†(X, Y/K) → Isoc†(U, Y/K) is fully faithful, so the extension is unique. (b) If E is an isocrystal on X overconvergent along Y \ X and F ⊂ E|_U a sub-isocrystal overconvergent along Y \ U, then F is the restriction of a sub-isocrystal of E over X. (c) If X \ U has codimension ≥ 2 in X, restriction Isoc†(X, Y/K) → Isoc†(U, Y/K) is an equivalence.

Hypotheses and conventions:

- X smooth; for singular X purity fails (Kedlaya Remark 5.3.4: a rank-one connection on the quadric cone).
- No Frobenius structure is needed.

Proof:

1. (a) Kedlaya Theorem 5.2.1: if X \ U is a smooth divisor, reduce by blow-ups centred outside X and Zariski localisation to the situation of Lemma 5.1.1, where constancy on V ∩ ]X \ U[ (via the tubular decomposition and Proposition 3.5.3) lets one extend across the tube of X \ U by Theorem 3.3.4; overconvergence of the extension is checked by η-convergence (Proposition 2.5.6). The general case reduces to the smooth divisor case by removing codimension-two loci (Proposition 4.4.4).
2. (b) Kedlaya Proposition 5.3.1: F has constant monodromy along X \ U as a subobject (Proposition 3.2.20), so extends to G; the inclusion G → E extends by full faithfulness.
3. (c) Kedlaya Proposition 5.3.3: constant monodromy along a codimension-two locus is automatic.

Acceptance:

- For U = G_m ⊂ X = A^1 ⊂ Y = P^1 and E = (O, d + a dt/t): E extends to A^1 overconvergently along ∞ iff a ∈ ℤ.
- Non-example for singular X (Kedlaya Remark 5.3.4): on the cone z^2 = xy minus its vertex, the connection with ∇v = v ⊗ dx/(2x) does not extend across the vertex though the vertex has codimension two.

Depends on: [RD.5/unipotent-monodromy-along-boundary](#RD-5-unipotent-monodromy-along-boundary), `RD.3/overconvergent-isocrystals-of-a-variety`, `RD.3/strong-fibration-theorem`, `RD.2/unipotent-iff-nilpotent-residue`, `SchemeAndStackFoundations:SF.4/modification`.

Used here by: [RD.5/dense-open-restriction-fully-faithful](#RD-5-dense-open-restriction-fully-faithful), [RD.5/log-extension-of-unipotent-isocrystal](#RD-5-log-extension-of-unipotent-isocrystal).

Sources:

- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, Theorem 5.2.1 and its proof, pp. 45–47: Constant monodromy along X \ U is equivalent to extendability; restriction is fully faithful.
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, Proposition 5.3.1, Proposition 5.3.3 and Remark 5.3.4, p. 48: Extension of sub-isocrystals, purity in codimension two, and the smoothness hypothesis.

<a id="RD-5-dense-open-restriction-fully-faithful"></a>

### `dense-open-restriction-fully-faithful` — Restriction of F-isocrystals to a dense open is fully faithful, and closed under subquotients in the overconvergent case

`PadicDifferentialEquationsAndRigidCohomology:RD.5/dense-open-restriction-fully-faithful` · theorem.

Let X be a smooth variety over a perfect field k and U ⊂ X a dense open. (i) The restriction functor F-Isoc(X) → F-Isoc(U) on convergent F-isocrystals is fully faithful. (ii) The restriction functor F-Isoc†(X) → F-Isoc†(U) on overconvergent F-isocrystals is fully faithful, and its essential image is closed under subquotients: every overconvergent sub-F-isocrystal of E|_U is the restriction of a sub-F-isocrystal of E. (iii) More generally, for U smooth dense in X, the restriction F-Isoc†(U, X/K) → F-Isoc(U/K) from isocrystals partially overconvergent along X \ U to convergent ones is fully faithful.

Hypotheses and conventions:

- Frobenius structures are needed in (i) and (iii); (ii) holds already without Frobenius (RD.5/extension-across-boundary).
- Perfect k as in D'Addezio; Kedlaya's statements allow any k for (ii).

Proof:

1. (ii) Full faithfulness and closure under subobjects from RD.5/extension-across-boundary (a), (b), applied to E and to Frobenius pullbacks (Frobenius structures extend by full faithfulness); quotients by duality.
2. (iii) Kedlaya, Semistable reduction II, Theorem 4.2.1: reduce to Hom(O, E), i.e. Frobenius-invariant horizontal sections; for a smooth pair (X, X \ U) this is Kedlaya's full-faithfulness argument made unconditional by the local full faithfulness RD.3/local-full-faithfulness; in general choose a quasi-resolution f: X_1 → X (an alteration making (U_1, X_1) a smooth pair, SchemeAndStackFoundations:SF.4/de-jong-alteration-theorem), lift a section on U_1, descend it over the finite étale locus U' ⊂ U by adjunction for finite étale pushforward (RD.3/finite-etale-pushforward-of-isocrystals), and extend from U' to U by RD.5/extension-across-boundary, checking Frobenius compatibility on U'.
3. (i) Combine (iii) for U ⊂ X with the overconvergent-to-convergent full faithfulness RD.3/full-faithfulness-overconvergent-to-convergent: a morphism of convergent F-isocrystals on U between restrictions from X is a morphism of partially overconvergent objects, which extends (D'Addezio, proof of Theorem 4.1.6, citing Drinfeld–Kedlaya Theorem 2.2.3).

Acceptance:

- For X = A^1, U = G_m and E = O: Hom(O, O) = K on X and on U, in both categories.
- On the ordinary locus U of the Legendre family B, R^1f_*O has a unit-root convergent subcrystal on U that is not overconvergent, so the subquotient closure in (ii) fails for the convergent category (Kedlaya, Semistable reduction I, Remark 5.3.2).

Depends on: [RD.5/extension-across-boundary](#RD-5-extension-across-boundary), `RD.3/full-faithfulness-overconvergent-to-convergent`, `RD.3/local-full-faithfulness`, `RD.3/restriction-to-convergent`, `RD.3/overconvergent-f-isocrystal`, `RD.3/finite-etale-pushforward-of-isocrystals`, `SchemeAndStackFoundations:SF.4/de-jong-alteration-theorem`.

Used here by: [RD.5/docility-acceptance](#RD-5-docility-acceptance).

Sources:

- Marco D’Addezio, *Parabolicity conjecture of F-isocrystals*, Theorem 4.1.6, p. 12: States, after Kedlaya, that restriction to a dense open is fully faithful for convergent F-isocrystals, and fully faithful and closed under subquotients for overconvergent ones.
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, II: A valuation-theoretic approach*, Theorem 4.2.1 and its proof, pp. 14–15: Restriction from isocrystals overconvergent along X \ U to convergent isocrystals on U is fully faithful in the presence of Frobenius, first for smooth pairs and in general by a quasi-resolution and finite étale descent.
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, Proposition 5.3.1 and Remark 5.3.2, p. 48: Sub-isocrystals extend in the overconvergent category; the Legendre unit-root example shows the convergent analogue fails.

<a id="RD-5-convergent-log-isocrystal"></a>

### `convergent-log-isocrystal` — Convergent log-isocrystals on a smooth pair

`PadicDifferentialEquationsAndRigidCohomology:RD.5/convergent-log-isocrystal` · definition.

Let (X, Z) be a smooth pair over k (X smooth, Z a strict normal crossings divisor) with log structure M defined by Z, and suppose given a closed immersion i of X into a formal V-scheme P smooth near X with a log structure L defined by a relative normal crossings divisor lifting Z (Kedlaya's Hypothesis 6.1.6). A convergent log-isocrystal on (X, M) is a coherent module E on the log tube ]X[^log_P with an isomorphism ε: π_2^*E ≅ π_1^*E on the log tube of the diagonal ]X[^log_{P(1)} satisfying Δ^*ε = id and the cocycle condition on ]X[^log_{P(2)}. Equivalently it is a coherent module on the tube with a convergent integrable log connection Ω^1(log) (Kedlaya Theorem 6.4.1); the residues along the components of Z are endomorphisms of the restrictions; a log-F-isocrystal adds a Frobenius isomorphism. The category is independent of i and agrees with Shiho's convergent log-isocrystals.

Hypotheses and conventions:

- Smooth pair (X, Z) with Z strict normal crossings.
- Frobenius structures where stated.

Construction or proof:

1. Log tubes and the log diagonal: Kedlaya Definition 6.1.4 (after Shiho §2.2), with Remark 6.1.5 on existence of the embedding data.
2. Definition 6.1.7 with Shiho's Proposition 2.2.7 for independence of choices.
3. Equivalence with convergent log-∇-modules on the tube: Kedlaya Theorem 6.4.1 (via the log Taylor isomorphism).

API:

| name | role | statement |
|---|---|---|
| `ConvergentLogIsocrystal` | data | The category of convergent log-isocrystals on a smooth pair (X, Z); with Frobenius, ConvergentLogFIsocrystal. |
| `ConvergentLogIsocrystal.toLogNablaModule` | equivalence | Under Hypothesis 6.2.1 the category is equivalent to convergent log-∇-modules on the tube (Kedlaya Theorem 6.4.1). |
| `ConvergentLogIsocrystal.residue` | projection | For each component Z_j of Z, the residue res_j(E) ∈ End(E\|_{]Z_j[}), compatible with restriction and tensor products (res(E ⊗ E') = res E ⊗ 1 + 1 ⊗ res E'). |
| `ConvergentLogIsocrystal.restrict` | functoriality | Restriction to the complement gives an isocrystal on X \ Z overconvergent along Z. |
| `ConvergentLogIsocrystal.noBoundary` | compatibility | For Z = ∅ the category is that of convergent isocrystals on X. |
| `ConvergentLogIsocrystal.nilpotentResidues` | other | The full subcategory with nilpotent residues is an abelian tensor subcategory; a convergent log-F-isocrystal automatically has nilpotent residues. |

Unit tests:

- `convergentLogIsocrystal_empty_boundary` (degenerate): For Z = ∅ a convergent log-isocrystal is a convergent isocrystal (no residues).
- `convergentLogIsocrystal_residue_computation` (computation): On (A^1, {0}) the module (O, d + a dt/t) has residue a at 0; for a = 0 it is O.
- `convergentLogFIsocrystal_nilpotent` (characterisation): A convergent log-F-isocrystal on (A^1, {0}) has nilpotent residue: Frobenius pullback along t ↦ t^q multiplies the residue by q, and the Frobenius isomorphism makes res conjugate to q·res, so all eigenvalues are 0.
- `convergentLogIsocrystal_not_overconvergent_nonexample` (non-example): The restriction of a convergent log-isocrystal to X \ Z need not have unipotent monodromy unless the residues are nilpotent: (O, d + (1/2)dt/t) restricts to a non-docile Kummer isocrystal on G_m.

Uses:

- Kedlaya, Semistable reduction I, Theorem 6.4.5, p. 56: the target category of the log extension of a unipotent isocrystal.
- Kedlaya, Semistable reduction IV, Theorem 2.4.4, p. 17: semistable reduction produces a convergent log-F-isocrystal with nilpotent residues after alteration.
- RD.5/log-rigid-comparison-for-curves: the log de Rham complex of a convergent log-isocrystal computes log-rigid cohomology.

Acceptance:

- For Z = ∅, convergent log-isocrystals are convergent isocrystals.
- For (A^1, {0}), the log-∇-module (O, d + a dt/t) on the closed unit disc with a ∈ K is a convergent log-isocrystal with residue a.

Depends on: `RD.3/tube`, `RD.3/frame`, `RD.3/restriction-to-convergent`, `AdicSpacesPartII:F1/log-de-rham-complex`, `AdicSpacesPartII:F1/dagger-snc-divisor`, `CrystallineCohomology:CR.5/log-crystal`.

Used here by: [RD.5/relative-convergent-crystalline-comparison](#RD-5-relative-convergent-crystalline-comparison), [RD.5/log-extension-of-unipotent-isocrystal](#RD-5-log-extension-of-unipotent-isocrystal), [RD.5/global-semistable-reduction](#RD-5-global-semistable-reduction).

Sources:

- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, Hypothesis 6.1.6, Definitions 6.1.4 and 6.1.7, Remark 6.1.5, p. 51: Defines log tubes and convergent log-isocrystals by a stratification on the log tube of the diagonal, independent of the embedding by Shiho's results.
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, Theorem 6.4.1, p. 55: Equivalence between convergent log-isocrystals and convergent log-∇-modules under Hypothesis 6.2.1.

<a id="RD-5-log-extension-of-unipotent-isocrystal"></a>

### `log-extension-of-unipotent-isocrystal` — Logarithmic extension of isocrystals with unipotent monodromy ★

`PadicDifferentialEquationsAndRigidCohomology:RD.5/log-extension-of-unipotent-isocrystal` · theorem · planet: Logarithmic extension.

Let U ⊂ X be an open immersion of smooth k-varieties with Z = X \ U a strict normal crossings divisor, and E an isocrystal on U overconvergent along Z. Then E has unipotent monodromy along Z iff E extends to a convergent log-isocrystal with nilpotent residues on (X, Z). The restriction functor from convergent log-isocrystals with nilpotent residues on (X, Z) to Isoc†(U, X/K) is fully faithful, so the extension is unique; Frobenius structures extend uniquely, so the same holds for F-isocrystals.

Hypotheses and conventions:

- Strict normal crossings boundary; smooth X.

Proof:

1. Zariski-local on X; under Hypothesis 6.2.1 the claim combines Kedlaya Proposition 6.3.2 (unipotent ∇-modules near Z are unipotent log-∇-modules, extendable across the tube of Z by Theorem 3.3.4) with Theorem 6.4.1 (log-∇-modules versus convergent log-isocrystals) (Kedlaya Theorem 6.4.5).
2. Full faithfulness: a horizontal section of a log-∇-module with nilpotent residues on the punctured tube extends across the tube (Theorem 3.3.4: unipotent objects are U_I of their fibre).
3. Frobenius: the extension of Φ: F^*E ≅ E is the unique extension of a morphism (full faithfulness).

Acceptance:

- For (A^1, {0}) and the unipotent rank-two isocrystal on G_m with ∇ = d + N dt/t, N nilpotent, the extension is the same formula on the disc.
- The Kummer isocrystal (O, d + (1/2)dt/t) on G_m is not unipotent along 0; its natural extension to A^1 has residue 1/2, not nilpotent, matching the 'only if'.

Depends on: [RD.5/unipotent-monodromy-along-boundary](#RD-5-unipotent-monodromy-along-boundary), [RD.5/convergent-log-isocrystal](#RD-5-convergent-log-isocrystal), [RD.5/extension-across-boundary](#RD-5-extension-across-boundary), `RD.2/unipotent-iff-nilpotent-residue`, `RD.3/overconvergent-f-isocrystal`.

Used here by: [RD.5/log-rigid-comparison-for-curves](#RD-5-log-rigid-comparison-for-curves), [RD.5/igusa-theta-cokernel-finite](#RD-5-igusa-theta-cokernel-finite), [RD.5/global-semistable-reduction](#RD-5-global-semistable-reduction), [RD.5/docility-acceptance](#RD-5-docility-acceptance).

Sources:

- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, Theorem 6.4.5 and its proof, p. 56: Unipotent monodromy along an SNC divisor is equivalent to the existence of a convergent log-isocrystal extension with nilpotent residues; restriction is fully faithful.
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, Theorem 3.3.4, p. 27: The functor U_I from modules on the base with commuting nilpotent residues to unipotent log-∇-modules on the base times a polyannulus is an equivalence, which lets a unipotent module extend across the polydisc.
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, IV: Local semistable reduction at nonmonomial valuations*, Remark 2.4.2, p. 16: Uses Theorem 6.4.5 of part I to log-extend near the centre of a valuation, with unique extension of the Frobenius structure.

<a id="RD-5-global-semistable-reduction"></a>

### `global-semistable-reduction` — Kedlaya's semistable reduction theorem for overconvergent F-isocrystals ★

`PadicDifferentialEquationsAndRigidCohomology:RD.5/global-semistable-reduction` · theorem · planet: Semistable reduction for F-isocrystals.

Let Z ⊂ X be a closed immersion of k-varieties with X \ Z smooth, and E an F-isocrystal on X \ Z overconvergent along Z. Then, after replacing k by k^{q^{−n}} for some n ≥ 0, there is an alteration f: X_1 → X (separable when k is perfect) such that, with Z_1 = f^{−1}(Z), (X_1, Z_1) is a smooth pair and f^*E extends to a convergent log-F-isocrystal with nilpotent residues on (X_1, Z_1); equivalently f^*E has unipotent monodromy along Z_1. In particular, for X smooth and E ∈ F-Isoc†(X), there is a generically finite alteration X_1 → X from an open X_1 of a smooth proper variety Ȳ_1 with SNC boundary along which f^*E is docile.

Hypotheses and conventions:

- Frobenius structure on E (as in the p-adic local monodromy theorem, of which this is the higher-dimensional form).
- Alterations in de Jong's sense (proper, surjective, generically finite) from SchemeAndStackFoundations:SF.4; the alteration depends on E.

Proof:

1. Local semistable reduction at every valuation v of k(X) centred on Z (Kedlaya, Semistable reduction IV, Theorem 2.4.3): reduce to k algebraically closed and v minimal (Semistable reduction III); for transcendence defect 0 (monomial valuations) this is Semistable reduction III, Theorem 6.3.1, built on the p-adic local monodromy theorem over polyannuli (RD.2/quasi-unipotence-and-local-monodromy-statement in relative form); induction on transcendence defect is Semistable reduction IV, Theorem 5.0.1.
2. Global from local: the locus of valuations where a given alteration achieves semistable reduction is open in the Riemann–Zariski space, which is quasi-compact; finitely many local alterations are combined into one via de Jong's theorem and Galois closures (Semistable reduction II, Propositions 3.3.4 and 3.4.5; Semistable reduction IV, Definition 2.3.10 and Theorem 2.4.4).
3. Equivalence with unipotent monodromy: RD.5/log-extension-of-unipotent-isocrystal.

Acceptance:

- For X = P^1, Z = {∞} and E the Dwork isocrystal on A^1, the Artin–Schreier alteration P^1 → P^1, t = y^p − y, makes E constant (RD.2/dwork-exponential-artin-schreier-example), hence docile.
- For the Kummer isocrystal (O, d + a dt/t) on G_m with a ∈ (q − 1)^{−1}ℤ, the Kummer alteration t = s^{q−1} makes it docile.

Depends on: [RD.5/log-extension-of-unipotent-isocrystal](#RD-5-log-extension-of-unipotent-isocrystal), [RD.5/unipotent-monodromy-along-boundary](#RD-5-unipotent-monodromy-along-boundary), [RD.5/convergent-log-isocrystal](#RD-5-convergent-log-isocrystal), `RD.2/quasi-unipotence-and-local-monodromy-statement`, `RD.2/local-monodromy-finite-etale-form`, `SchemeAndStackFoundations:SF.4/de-jong-alteration-theorem`, `SchemeAndStackFoundations:SF.4/alteration`.

Used here by: [RD.5/docility-acceptance](#RD-5-docility-acceptance).

Sources:

- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, IV: Local semistable reduction at nonmonomial valuations*, Definition 2.4.1, Theorems 2.4.3–2.4.4, pp. 16–17: Defines local semistable reduction at a valuation and proves local and global semistable reduction for F-isocrystals overconvergent along a closed subscheme.
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, IV: Local semistable reduction at nonmonomial valuations*, Theorem 2.3.9 and Definition 2.3.10, p. 15: De Jong's alteration theorem in the form used, and the Galois closure of an alteration.
- Marco D’Addezio, *Parabolicity conjecture of F-isocrystals*, §4.4.11, p. 23: Uses Kedlaya's semistable reduction to reduce to an F-isocrystal docile along an SNC boundary of a smooth projective compactification.

<a id="RD-5-docility-acceptance"></a>

### `docility-acceptance` — Acceptance: docility of the Kummer and Dwork isocrystals and their semistable reduction

`PadicDifferentialEquationsAndRigidCohomology:RD.5/docility-acceptance` · application.

(1) On G_m ⊂ P^1 over F_q, the Kummer F-isocrystal K_a = (O, d + a dt/t) with a ∈ (q − 1)^{−1}ℤ is docile along {0, ∞} iff a ∈ ℤ; its pullback along the Kummer cover s ↦ s^{q−1} = t is constant, hence docile, and its log extension to (P^1, {0, ∞}) after pullback has zero residues. (2) On A^1 ⊂ P^1, the Dwork F-isocrystal L_π is not docile along ∞ (Swan conductor 1), and no tame (Kummer) alteration makes it docile; its pullback along the Artin–Schreier cover y^p − y = t is constant. (3) The restriction to G_m of any docile F-isocrystal on A^1 ⊂ P^1 (docile along ∞) is docile along {0, ∞}, and restriction is fully faithful (RD.5/dense-open-restriction-fully-faithful).

Hypotheses and conventions:

- Conventions for L_π as in RD.1/dwork-exponential-module (π^{p−1} = −p).
- q = p^f; the Kummer twist uses a ∈ (q − 1)^{−1}ℤ so that a Frobenius structure exists.

Proof:

1. (1) Residues: K_a has residue a at 0 and −a at ∞; unipotent rank one means constant, i.e. residue in ℤ after gauge transformation by t^n (RD.2/unipotent-iff-nilpotent-residue); pullback along s^{q−1} multiplies the residue by q − 1.
2. (2) RD.1/dwork-exponential-module gives highest break 1 at ∞; unipotent modules have break 0; a Kummer pullback multiplies breaks by the tame degree, so they stay positive; the Artin–Schreier trivialisation is RD.2/dwork-exponential-artin-schreier-example.
3. (3) Unipotence along ∞ is unaffected by removing 0 where the isocrystal is overconvergent and regular (constant monodromy), and RD.5/dense-open-restriction-fully-faithful gives full faithfulness.

Acceptance:

- The residues computed in (1) are ±a and change by integers under gauge transformations.
- The break computed in (2) is 1.

Depends on: [RD.5/unipotent-monodromy-along-boundary](#RD-5-unipotent-monodromy-along-boundary), [RD.5/log-extension-of-unipotent-isocrystal](#RD-5-log-extension-of-unipotent-isocrystal), [RD.5/global-semistable-reduction](#RD-5-global-semistable-reduction), [RD.5/dense-open-restriction-fully-faithful](#RD-5-dense-open-restriction-fully-faithful), `RD.1/dwork-exponential-module`, `RD.2/dwork-exponential-artin-schreier-example`, `RD.2/unipotent-iff-nilpotent-residue`.

Sources:

- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, Theorem 6.4.5, p. 56: Docility is equivalent to log extension with nilpotent residues, which the residue computations test.
- Marco D’Addezio, *Parabolicity conjecture of F-isocrystals*, Definition 4.4.1 and the proof of Corollary 4.4.8, pp. 19, 22: Docile rank-one isocrystals have zero residues, hence are unramified.
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, IV: Local semistable reduction at nonmonomial valuations*, Lemma 3.5.1 and Definition 5.1.9, pp. 29, 47: Computes the generic radius of Dwork-type rank-one modules ∇v = πr v ⊗ dx, and lists Artin–Schreier alterations x̃^p − g^{p−1}x̃ = x + ⋯ beside tame m-th power maps among the operations used for local semistable reduction.

## Applications: log-rigid cohomology, Igusa curves, integral models and relative direct images (sub-layers RD.5b and RD.5d)

Four consumers need finiteness in forms that the absolute theorem does not state. Pan's finite-level Igusa spaces are log-rigid cohomology of compactified Igusa curves with Sym^k coefficients; for a curve, log-rigid cohomology of an isocrystal with unipotent monodromy at the marked points equals rigid cohomology of their complement, because on a residue disc and on the boundary annulus the cohomology is the kernel and cokernel of the nilpotent residue. Harris–Lan–Taylor–Thorne need finite rigid cohomology of the special fibres of smooth quasi-projective integral models and of their boundary strata, and AG2.4 requests exactly this; the dagger comparison of Grosse-Klönne that transports it to dagger tubes is an RD.4 target. Guo–Reinecke need that smooth proper direct images of crystals in perfect complexes underlying F-isocrystals are convergent F-isocrystals in perfect complexes, from Shiho's comparison of relative convergent and crystalline cohomology and Xu's theorem on higher direct images; absolute finiteness does not imply this relative statement.

<a id="RD-5-log-rigid-comparison-for-curves"></a>

### `log-rigid-comparison-for-curves` — Log-rigid cohomology of a curve with unipotent monodromy equals rigid cohomology of the complement

`PadicDifferentialEquationsAndRigidCohomology:RD.5/log-rigid-comparison-for-curves` · theorem.

Let Y be a smooth curve over a perfect field k, Z ⊂ Y a finite set of k-rational points, and E ∈ F-Isoc†(Y \ Z/K) with unipotent monodromy along Z, with log extension E^log (a convergent log-F-isocrystal on (Y, Z) with nilpotent residues N_z, RD.5/log-extension-of-unipotent-isocrystal). Define the log-rigid cohomology H^i_{log-rig}((Y, Z)/K, E^log) as the hypercohomology of the overconvergent log de Rham complex E^log ⊗ Ω^•(log Z) on the tube of Y. Then the restriction map H^i_{log-rig}((Y, Z)/K, E^log) → H^i_rig(Y \ Z/K, E) is a Frobenius-compatible isomorphism for every i; in particular the log-rigid cohomology is finite dimensional.

Hypotheses and conventions:

- Unipotent monodromy along Z; without it the log extension with nilpotent residues does not exist, and for residues with nonzero integer eigenvalues the comparison fails.
- Rational points of Z (otherwise pass to a finite extension of k; RD.4/finite-flat-base-change).

Proof:

1. Cover the tube of Y by a strict neighbourhood U_1 of the tube of Y \ Z and the residue discs U_2 = ⊔_z ]z[; U_1 ∩ U_2 is a union of annulus germs at the boundaries of the discs. The Mayer–Vietoris sequence for the log de Rham complex reads … → H^i_{log-rig}(Y) → H^i(U_1, E) ⊕ H^i_log(U_2, E^log) → H^i(U_1 ∩ U_2, E) → …, and H^*(U_1, E) = H^*_rig(Y \ Z, E) (RD.4/overconvergent-de-rham-complex).
2. On a residue disc, E^log is isomorphic to a constant module with log connection d + N_z dt/t (Kedlaya, Semistable reduction I, Theorem 3.3.4, the logarithmic form of RD.2/unipotent-iff-nilpotent-residue); for n ≥ 1 the operator n + N_z is invertible, so H^0_log = ker N_z and H^1_log = coker N_z, coming from the t^0 terms (antiderivatives, RD.2/robba-ring-antiderivative).
3. On an annulus germ (the Robba ring), the same constant form gives H^0 = ker N_z and H^1 = coker N_z, since n + N_z is invertible for every n ≠ 0 (RD.5/unipotent-local-residue-isomorphism); the restriction from the disc is an isomorphism on these t^0 terms.
4. Hence the disc terms cancel the annulus terms in the Mayer–Vietoris sequence, and restriction to U_1 is an isomorphism; finiteness follows from RD.5/finiteness-for-affine-curves (Y \ Z affine) or RD.5/finiteness-of-rigid-cohomology.

Acceptance:

- Y = A^1, Z = {0}, E = O: the log complex K⟨t⟩† → K⟨t⟩† dt/t has H^0 = K and H^1 = K·dt/t, which is H^*_rig(G_m), not H^*_rig(A^1) = (K, 0): log cohomology of (A^1, {0}) is the cohomology of the complement.
- Y = A^1, Z = {0}, E of rank two with ∇ = d + N dt/t, N a nonzero nilpotent 2 × 2 matrix: H^0 = ker N = K and H^1 = coker N = K on both sides.
- Non-example: the rank-one log connection d + dt/t (residue 1, not nilpotent) on (A^1, {0}) has log-rigid cohomology 0 in both degrees (t^n ↦ (n + 1)t^n dt/t is bijective for n ≥ 0), while its restriction to G_m is isomorphic to O via multiplication by t, with cohomology (K, K); residues with integer eigenvalues other than 0 must be excluded.

Depends on: [RD.5/log-extension-of-unipotent-isocrystal](#RD-5-log-extension-of-unipotent-isocrystal), `RD.5/finiteness-for-affine-curves`, `RD.5/finiteness-of-rigid-cohomology`, `RD.5/unipotent-local-residue-isomorphism`, `RD.2/unipotent-iff-nilpotent-residue`, `RD.2/robba-ring-antiderivative`, `RD.4/overconvergent-de-rham-complex`, `RD.4/finite-flat-base-change`, `AdicSpacesPartII:F1/log-de-rham-complex`.

Used here by: [RD.5/igusa-theta-cokernel-finite](#RD-5-igusa-theta-cokernel-finite).

Sources:

- Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*, Proof of Proposition 5.1.7, p. 54: Identifies the Igusa theta-cokernel with log-rigid cohomology of a log F-isocrystal on compactified Igusa curves and deduces finiteness from general finiteness of rigid cohomology.
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, Theorem 3.3.4, p. 27: The functor U_I, which equips the pullback of a module on the base with the connection twisted by commuting nilpotent residues N_i dt_i/t_i, is an equivalence onto unipotent log-∇-modules on the base times a polyannulus or polydisc.
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, Theorem 6.4.5, p. 56: Unipotent monodromy along a strict normal crossings divisor is equivalent to a convergent log-isocrystal extension with nilpotent residues, and the extension is unique.
- Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, Section 6.4, pp. 41–42: Finite dimensionality on curves via the local unipotent computation at the missing points.

<a id="RD-5-igusa-theta-cokernel-finite"></a>

### `igusa-theta-cokernel-finite` — Acceptance: finite-level Igusa rigid cohomology with Sym^k coefficients is finite dimensional

`PadicDifferentialEquationsAndRigidCohomology:RD.5/igusa-theta-cokernel-finite` · application.

For k ≥ 0, n ≥ 0 and tame level K^p, the space H^1_rig(Ig(K^pΓ(p^n)), Sym^k) of Pan, Definition 5.1.6 (the cokernel of θ^{k+1}: M†_{−k} → M†_{k+2} ⊗ D_0^{−k−1} at level K^pΓ(p^n)), once identified at RD.4 with the log-rigid cohomology of the ordinary locus of the compactified Igusa curves at that level, with log poles at the cusps and coefficients Sym^k of the log-F-isocrystal H^1 of the universal generalised elliptic curve, is finite dimensional.

Hypotheses and conventions:

- The identification of the theta-cokernel with log-rigid cohomology is an RD.4 target (Pan Definition 5.1.6, after Coleman); this node only proves finiteness.
- The overconvergence of R^1f_*O of the universal ordinary elliptic curve along the supersingular points and its unipotent (Tate curve) monodromy at the cusps are RD.3 inputs (Étesse's overconvergence of abelian-scheme direct images).
- Igusa curves at level K^pΓ(p^n) in characteristic p are the Igusa components of ModularCurvesPartII:R13.5/igusa-components.

Proof:

1. Sym^k H^1 is an overconvergent F-isocrystal on the ordinary locus minus the cusps with unipotent monodromy at the cusps, hence log-extendable with nilpotent residues (RD.5/log-extension-of-unipotent-isocrystal).
2. By RD.5/log-rigid-comparison-for-curves the log-rigid cohomology is H^1_rig of the ordinary locus minus the cusps, a smooth affine curve, which is finite dimensional (RD.5/finiteness-for-affine-curves).

Acceptance:

- For k = 0 the space is H^1_rig of the ordinary locus minus the cusps; on a geometrically connected component of genus g with s supersingular and c cuspidal geometric points its dimension is 2g + s + c − 1 (RD.5/dimension-of-h1-of-affine-curve).
- The colimit over n is not finite dimensional (Pan Proposition 5.1.8 uses it with a smooth Borel action), so finiteness is a finite-level statement.

Depends on: [RD.5/log-rigid-comparison-for-curves](#RD-5-log-rigid-comparison-for-curves), [RD.5/log-extension-of-unipotent-isocrystal](#RD-5-log-extension-of-unipotent-isocrystal), `RD.5/finiteness-for-affine-curves`, `RD.5/dimension-of-h1-of-affine-curve`, `ModularCurvesPartII:R13.5/igusa-components`, `RD.3`, `RD.4`.

Sources:

- Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*, Definition 5.1.6 and Proposition 5.1.7, pp. 53–54: Defines the theta-cokernel spaces at finite level and in the limit, and proves finite dimensionality at finite level by Coleman's log-rigid interpretation and general finiteness.
- Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*, Proposition 5.1.8, p. 54: Uses the finiteness to get closed images of θ^{k+1} and to describe the cokernel at infinity.

<a id="RD-5-finiteness-for-smooth-quasi-projective-models"></a>

### `finiteness-for-smooth-quasi-projective-models` — Finite rigid and dagger cohomology for smooth quasi-projective integral models and their boundary strata

`PadicDifferentialEquationsAndRigidCohomology:RD.5/finiteness-for-smooth-quasi-projective-models` · theorem.

Let K be a finite extension of Q_p with ring of integers O_K and residue field k, and 𝒴 a smooth quasi-projective O_K-scheme with special fibre Y and dagger tube 𝒴^† (the dagger space structure on the tube ]Y[ inside the analytification of the generic fibre). (a) H^i_rig(Y/K) is finite dimensional for every i, the Frobenius of RD.4 is bijective on it, and, through the comparison H^i_rig(Y/K) ≅ H^i(𝒴^†, Ω^•) of Grosse-Klönne's Theorem 5.1 (an RD.4 target), the dagger de Rham cohomology of the tube is finite dimensional, functorially in morphisms of smooth quasi-projective models. (b) If 𝒳 is smooth quasi-projective over O_K with a relative strict normal crossings divisor 𝒟 whose strata 𝒟^{(j)} (disjoint unions of j-fold intersections) are smooth quasi-projective, then every first-quadrant spectral sequence with E_1^{i,j} = H^i_rig(D^{(j)}/K), Frobenius-compatible with the induced differentials (such as the boundary-stratum sequence of Harris–Lan–Taylor–Thorne, Lemma 6.21), has finite-dimensional abutment on which the abutting Frobenius is bijective.

Hypotheses and conventions:

- Smooth quasi-projective models: the comparison needs the tube of the special fibre inside the generic fibre of the closure in a projective space, not the whole generic fibre (HLTT Lemma 6.8).
- Constant coefficients, as in the source; coefficients would need the comparison with coefficients.

Proof:

1. (a) Finiteness of H_rig of the separated finite-type k-scheme Y: RD.5/finiteness-of-rigid-cohomology; bijectivity of Frobenius: RD.5/frobenius-bijective-on-cohomology.
2. The dagger–rigid comparison (Grosse-Klönne Theorem 5.1 (c), applied to the closure of 𝒴 in a projective space, with functoriality as explained in HLTT Lemma 6.8) is planned at RD.4; the finiteness transfers through it.
3. (b) Each E_1 term is finite dimensional by (a) applied to the strata, only finitely many are nonzero in each total degree (D^{(j)} is empty for j > dim, and H^i_rig vanishes for i > 2 dim), so the abutment is finite dimensional; Frobenius acts compatibly on the filtration with bijective graded pieces, hence bijectively (HLTT Corollary 6.22).

Acceptance:

- 𝒴 = A^n_{O_K}: H^0 = K and the dagger tube is the overconvergent closed polydisc with H^i_dR = 0 for i > 0.
- 𝒳 = P^1_{O_K} with 𝒟 = {0, ∞}: E_1 has H^*_rig(P^1) and K^2 in the row j = 1, abutment the compactly supported (toward 𝒟) cohomology of G_m, of total dimension 2.

Depends on: `RD.5/finiteness-of-rigid-cohomology`, `RD.5/frobenius-bijective-on-cohomology`, `RD.4`, `AdicSpacesPartII:F1/dagger-algebra`, `AdicSpacesPartII:F1/compact-support-log-complex`.

Sources:

- Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, *On the rigid cohomology of certain Shimura varieties*, Lemma 6.8, pp. 189–190: For smooth quasi-projective models identifies rigid cohomology of the special fibre with de Rham cohomology of the dagger tube, functorially, via Grosse-Klönne's Theorem 5.1.
- Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, *On the rigid cohomology of certain Shimura varieties*, Lemma 6.21 and Corollary 6.22, p. 207: Computes the boundary-supported dagger cohomology by a spectral sequence from the rigid cohomology of boundary strata and deduces finite dimensionality from Berthelot's finiteness theorem.
- Elmar Grosse-Klönne, *Rigid analytic spaces with overconvergent structure sheaf*, Theorem 5.1, p. 23: For a proper admissible formal scheme and an immersion of Y into its special fibre, compares coherent and de Rham cohomology of the dagger space on the tube with j†-cohomology, hence with rigid cohomology when the formal scheme is smooth along Y.

<a id="RD-5-relative-convergent-crystalline-comparison"></a>

### `relative-convergent-crystalline-comparison` — Relative convergent cohomology equals rational relative crystalline cohomology, and is perfect

`PadicDifferentialEquationsAndRigidCohomology:RD.5/relative-convergent-crystalline-comparison` · lemma.

Let f: (X, M_X) → (Y, M_Y) be a proper log smooth integral morphism of fine log schemes over k, with (Y, M_Y) → (𝒴, M_𝒴) an exact closed immersion into a p-adic formal log scheme defined by p, and E a locally free isocrystal on the relative log convergent site (X/𝒴)^log_conv with associated crystal Φ(E) on the relative log crystalline site. Then the natural map Rf_{X/𝒴,conv*}E → Rf_{X/𝒴,crys*}Φ(E) ⊗ Q is a quasi-isomorphism, and Rf_{X/𝒴,conv*}E is a perfect complex of Q ⊗ O_𝒴-modules. For trivial log structures and a point base this recovers Ogus's comparison of convergent and rational crystalline cohomology.

Hypotheses and conventions:

- Proper log smooth integral f; locally free coefficients (crystals in perfect complexes reduce to these by a finite filtration, Guo–Reinecke footnote 13).

Proof:

1. Shiho Theorem 2.36: with an embedding into a log smooth formal scheme, both sides are computed by de Rham complexes of the same module, on the log tube and on the p-adically completed log PD envelope; the map is the specialisation map, an isomorphism after reduction to the case where the embedding is an isomorphism; in general use embedding systems.
2. Perfectness: Shiho Corollary 2.37 from Theorem 2.36 and perfectness of log crystalline cohomology of proper log smooth morphisms (CrystallineCohomology:CR.3/proper-perfectness in the non-log case).

Acceptance:

- For f the identity, both sides are E.
- For X → Spec k proper smooth and E = O, this is H^*_conv(X/K) = H^*_crys(X/W)[1/p].

Depends on: `CrystallineCohomology:CR.3/proper-perfectness`, `CrystallineCohomology:CR.2/crystalline-cohomology`, `CrystallineCohomology:CR.5/log-crystal`, [RD.5/convergent-log-isocrystal](#RD-5-convergent-log-isocrystal), `RD.3/restriction-to-convergent`.

Used here by: [RD.5/convergent-direct-image-smooth-proper](#RD-5-convergent-direct-image-smooth-proper), [RD.5/convergent-direct-image-perfect-complexes](#RD-5-convergent-direct-image-perfect-complexes).

Sources:

- Atsushi Shiho, *Relative log convergent cohomology and relative rigid cohomology I*, Theorem 2.36 and Corollary 2.37, p. 31: Relative log convergent cohomology of a locally free isocrystal is quasi-isomorphic to rational relative log crystalline cohomology and is a perfect complex.
- Haoyang Guo and Emanuel Reinecke, *A prismatic approach to crystalline local systems*, Proof of Theorem 6.13, p. 61: Uses Shiho's Theorem 2.36 and Corollary 2.37 (with Ogus's Theorem 0.7.7 over a point) for perfectness and for the comparison on p-torsion-free PD thickenings.

<a id="RD-5-convergent-direct-image-smooth-proper"></a>

### `convergent-direct-image-smooth-proper` — Higher direct images of convergent F-isocrystals under smooth proper morphisms (Xu)

`PadicDifferentialEquationsAndRigidCohomology:RD.5/convergent-direct-image-smooth-proper` · theorem.

Let k be perfect and g: X → Y a smooth proper morphism of k-schemes locally of finite type. For every convergent isocrystal (resp. F-isocrystal) E on X/W, the higher direct images R^ig_{conv*}E are convergent isocrystals (resp. F-isocrystals) on Y/W; the Frobenius structure of R^ig_*E is induced by the natural isomorphism F_Y^*Rg_*E ≅ Rg_*(F_X^*E) composed with the Frobenius of E.

Hypotheses and conventions:

- Perfect k; smooth proper g. Neither a lift of Frobenius nor a lift of g is assumed.

Proof:

1. Xu Theorem 1.9 (§9.3): Frobenius descent for convergent isocrystals via an Oyama-type site-theoretic Cartier transform (Theorem 1.5 (6.6), Corollary 1.6 (6.7)), comparison of de Rham complexes (Corollary 1.8 (6.9)), and Ogus's description of the direct image of the structure sheaf by relative crystalline cohomology to obtain coherence and convergence.
2. Frobenius structure: by base change for the Frobenius of Y and the Frobenius of E (Xu Proposition 5.10 and §9.3).

Acceptance:

- For g = id the direct image is E.
- For g: E → B an elliptic curve over an ordinary-locus base and E = O, R^1g_*O is the rank-two convergent F-isocrystal of the family, with the unit-root subobject of RD.5/dense-open-restriction-fully-faithful's second acceptance test.

Depends on: `RD.3/restriction-to-convergent`, [RD.5/relative-convergent-crystalline-comparison](#RD-5-relative-convergent-crystalline-comparison), `CrystallineCohomology:CR.1/isocrystal`, `CrystallineCohomology:CR.3/proper-perfectness`.

Used here by: [RD.5/convergent-direct-image-perfect-complexes](#RD-5-convergent-direct-image-perfect-complexes).

Sources:

- Daxin Xu, *On higher direct images of convergent isocrystals*, Theorem 1.9, p. 3 (Corollary 9.3, p. 32, in the body): The higher direct image of a convergent isocrystal or F-isocrystal under a smooth proper morphism of k-schemes is a convergent isocrystal or F-isocrystal.
- Daxin Xu, *On higher direct images of convergent isocrystals*, Theorem 1.5, Corollaries 1.6 and 1.8, pp. 2–3: Frobenius descent and the de Rham comparison used in the proof.
- Haoyang Guo and Emanuel Reinecke, *A prismatic approach to crystalline local systems*, Proof of Theorem 6.13 (i), p. 61: Cites Xu's results (published numbering Corollary 8.3, Theorem 3.22) for convergence and the Frobenius structure.

<a id="RD-5-convergent-direct-image-perfect-complexes"></a>

### `convergent-direct-image-perfect-complexes` — Smooth proper direct images of crystals in perfect complexes underlying F-isocrystals (Guo–Reinecke)

`PadicDifferentialEquationsAndRigidCohomology:RD.5/convergent-direct-image-perfect-complexes` · theorem.

Let f: Z_1 → Z_2 be a smooth proper morphism of smooth O_K/p-schemes, f_s: Z_{1,s} → Z_{2,s} the induced map of reduced special fibres, and E' a crystal in perfect complexes on Z_{1,crys} underlying an F-isocrystal (E'[1/p], φ_{E'}) after inverting p. (i) Rf_{s,crys*}E'[1/p] underlies a convergent F-isocrystal in perfect complexes on Z_{2,crys}. (ii) For every p-complete p-torsion-free divided power thickening (A, A/J) in Z_{2,crys} there is a natural isomorphism Rf_{s,crys*}E'[1/p](A, A/J) ≅ RΓ((Z_{1,A/J}/A)_crys, E')[1/p], where the left side is the value of the associated convergent crystal of complexes.

Hypotheses and conventions:

- Smooth proper f; E' a crystal in perfect complexes (not only a vector bundle); integrality is used only to bound the crystalline cohomology.
- Absolute finiteness of rigid cohomology does not imply this relative statement; it is a separate input for consumers working over PD thickenings.

Proof:

1. (i) Perfectness of the restriction to p-torsion-free thickenings: RD.5/relative-convergent-crystalline-comparison (Shiho), after filtering E'[1/p] by its cohomology isocrystals; convergence and Frobenius structure: RD.5/convergent-direct-image-smooth-proper (Xu), with φ given by base change.
2. (ii) On a p-torsion-free PD thickening, the integral crystalline cohomology of the proper smooth Z_{1,A/J} is bounded (CrystallineCohomology:CR.3/proper-perfectness), so rational crystalline equals convergent cohomology there (RD.5/relative-convergent-crystalline-comparison; Ogus over a point).

Acceptance:

- For f = id and E' = O, both sides are A[1/p].
- For f a smooth proper curve over a smooth base and E' = O, the value at a p-torsion-free thickening is relative crystalline H^*(Z_1/A)[1/p], of ranks 1, 2g, 1.

Depends on: [RD.5/convergent-direct-image-smooth-proper](#RD-5-convergent-direct-image-smooth-proper), [RD.5/relative-convergent-crystalline-comparison](#RD-5-relative-convergent-crystalline-comparison), `CrystallineCohomology:CR.3/proper-perfectness`, `CrystallineCohomology:CR.1/crystal`, `RD.3/restriction-to-convergent`.

Sources:

- Haoyang Guo and Emanuel Reinecke, *A prismatic approach to crystalline local systems*, Theorem 6.13 and its proof, pp. 60–61: States and proves that the rational crystalline direct image of a crystal in perfect complexes underlying an F-isocrystal is a convergent F-isocrystal in perfect complexes whose values on p-torsion-free PD thickenings are rational crystalline cohomology.

## Requests to other roadmaps

- **EnhancedDerivedSheaves:E2** (for [RD.5/modification-cohomological-descent](#RD-5-modification-cohomological-descent), [RD.5/fppf-cohomological-descent](#RD-5-fppf-cohomological-descent), [RD.5/proper-surjection-cohomological-descent](#RD-5-proper-surjection-cohomological-descent)): The calculus of universal cohomological descent on an arbitrary site, after SGA 4 Vbis and Conrad's notes (Zureick-Brown Definition 3.12, Theorems 3.16–3.17, Corollary 3.18): a morphism (or augmented simplicial object) X_• → S is of cohomological descent if id → Rp_*p^* is an isomorphism on D^+(S), universally so if this holds after every base change, and relative to a class of sheaves when only those are tested; (i) coverings, and morphisms with local sections, are universally of cohomological descent; (ii) universal cohomological descent is stable under base change, composition and cancellation (if X → Y → Z is, so is Y → Z), also relative to a sheaf and its pullbacks; (iii) for P the class of morphisms universally of cohomological descent, every P-hypercovering is universally of cohomological descent; (iv) disjoint unions of maps of descent relative to F_i are of descent relative to ⊔F_i. E2/hypercover and E2/bounded-below-hypercover-descent supply the topos-level hypercover descent; (i)–(iv) are not among their statements.
- **SchemeAndStackFoundations:SF.0** (for [RD.5/projection-etale-off-hyperplane](#RD-5-projection-etale-off-hyperplane)): For a projective scheme X over a field with an ample line bundle L: (a) the complement of the zero locus of a section of L is affine; (b) for a closed subscheme D and a finite subscheme Z disjoint from D, some section of a power of L vanishes on D and at no point of Z; (c) n + 1 sections of L without common zero define a finite morphism X → P^n (Kedlaya, More étale covers, Lemmas 3–4). These are the projective-geometry inputs of Kedlaya's finite projections étale off the hyperplane at infinity.
- **LocallyAnalyticDistributions:L0** (for [RD.5/frechet-and-dual-frechet-finite](#RD-5-frechet-and-dual-frechet-finite), [RD.5/strictness-transpose-criteria](#RD-5-strictness-transpose-criteria)): Over a discretely valued (spherically complete) K: (a) Mackey's theorem for semi-complete locally convex spaces V = (V'_c)', with the convex equicontinuous subsets of the dual being the relatively linearly compact convex sets; (b) in a Fréchet space every balanced convex closed bounded linearly compact set lies in the closed convex hull of a null sequence (Crew 2.9); (c) an infinite-dimensional K-Banach space is not reflexive; (d) Montel spaces: for Fréchet–Montel spaces the strong and linearly compact duals coincide. These complete L0/nonarchimedean-hahn-banach, L0/pseudo-polar-duality and L0/barrelled-banach-steinhaus for Crew's strictness criteria; the first pass's restructure proposal moves RD.5's strict-map, Fréchet–Montel transpose and finite-cokernel lemmas to L0 as well.

## Gaps

- **Proof interiors of Kedlaya's semistable reduction theorem** ([RD.5/global-semistable-reduction](#RD-5-global-semistable-reduction)). Global semistable reduction (Semistable reduction IV, Theorem 2.4.4) rests on local semistable reduction at monomial valuations (III, Theorem 6.3.1, from the p-adic local monodromy theorem over polyannuli), the induction on transcendence defect (IV, Theorem 5.0.1) and the patching over the Riemann–Zariski space (II, Propositions 3.3.4 and 3.4.5). Only Part I §§3–6, Part II Theorem 4.2.1 and Part IV §2 were read. NEXT ACTION: decompose Parts II–IV at target level; the Riemann–Zariski space of a function field has no planned owner.
- **Berkovich's coherent descent for finite and flat maps of good analytic spaces** ([RD.5/fppf-cohomological-descent](#RD-5-fppf-cohomological-descent)). Zureick-Brown's Proposition 5.19 uses that higher direct images of coherent sheaves along finite maps of good K-analytic spaces vanish (Berkovich 1993, Corollary 4.3.2) and that coherent sheaves are sheaves for the flat quasi-finite topology (Berkovich 1993, Proposition 4.1.2). Berkovich's paper was not read. NEXT ACTION: read Berkovich, Étale cohomology for non-Archimedean analytic spaces, §§1.6, 4.1, 4.3, or derive the two facts in the rigid (adic) setting from AdicSpacesPartII:R3/tate-kiehl-affinoid and fpqc descent for modules.
- **Frobenius descent for convergent isocrystals and Ogus's comparison** ([RD.5/convergent-direct-image-smooth-proper](#RD-5-convergent-direct-image-smooth-proper), [RD.5/relative-convergent-crystalline-comparison](#RD-5-relative-convergent-crystalline-comparison), [RD.5/convergent-direct-image-perfect-complexes](#RD-5-convergent-direct-image-perfect-complexes)). Xu's proof that smooth proper higher direct images of convergent (F-)isocrystals are convergent (arXiv:1802.09060v1, Theorem 1.9) uses his Frobenius descent (Theorem 1.5, §6) and Ogus's description of the direct image of the structure sheaf; Guo–Reinecke use Ogus 1990, Theorem 0.7.7 over a point. Only the statements were read. NEXT ACTION: decompose Xu §§5–9 and read Ogus, The convergent topos in characteristic p (1990).
- **Details of the verifications Berthelot's note leaves to the reader** ([RD.5/compact-support-gysin-and-trace](#RD-5-compact-support-gysin-and-trace), [RD.5/finite-etale-trace-projector](#RD-5-finite-etale-trace-projector), [RD.5/kunneth-pairing-on-tubes](#RD-5-kunneth-pairing-on-tubes)). Berthelot's Dualité note is a four-page announcement: the compatibility of the compact-support Gysin map with traces (1.3) is reduced to the residue formalism of Hartshorne's Residues and Duality, the extension of a finite étale map of dagger algebras to strict neighbourhoods (1.4) and the Künneth compatibilities (3.3) are asserted with indications only. The nodes give the indicated routes. NEXT ACTION: write the residue computation for a smooth pair in local coordinates and the strict-neighbourhood extension (Berthelot, Finitude, §3.6) in detail.

## Coverage

`RD.5`: **planned**. Planned together with the first-pass packet (73 RD.5 nodes there, 35 here). Every target of the stage text — finiteness of H^i and H^i_c for overconvergent F-isocrystals, the relative local monodromy input, curves, dévissage, alterations and descent, the perfect compact-support duality with its twist, and Künneth with the exact smoothness and support conditions — is realised by a node whose prerequisite chains end in the pinned libraries, in other roadmaps' nodes, in requested stages, in same-roadmap stages RD.0, RD.3 and RD.4, or in the recorded gaps. The first pass's RD.5 gaps 4–8 (Tsuzuki 2003 and 1999, Berthelot's trace and Lemme 2.1, the lattice index argument, Crew Part I and Schneider 9.4) are closed by the nodes listed in closesGaps; the docility, semistable-reduction, Igusa, dagger-model and smooth-proper direct-image targets of its remaining list are planned here. The dagger–Berthelot comparison itself (Grosse-Klönne Theorem 5.1) and the Igusa theta-cokernel identification are RD.4 targets, and Étesse's overconvergence of abelian-scheme direct images is an RD.3 target; this packet cites those stages and plans only the finiteness consequences.

Remaining:

- Proof interiors of Kedlaya's semistable reduction (Semistable reduction II, Propositions 3.3.4 and 3.4.5; III, Theorem 6.3.1; IV, Theorem 5.0.1) are cited at statement level in RD.5/global-semistable-reduction (gap).
- Berkovich's coherent descent inputs used by Zureick-Brown (Berkovich 1993, Corollary 4.3.2 and Proposition 4.1.2) are cited, not decomposed (gap).
- Xu's Frobenius descent (arXiv v1, Theorem 1.5 (6.6)) and Ogus's comparison of convergent and rational crystalline cohomology over a point (Ogus 1990, Theorem 0.7.7) are cited at statement level (gap); Shiho's Theorem 2.36 is read with its short proof.
- Berthelot's note sketches the verifications behind 1.3 (Gysin–trace compatibility through residues), 1.4 (finite étale maps of strict neighbourhoods) and 3.3 (Künneth compatibilities); their details are recorded as a gap at the three nodes that use them.
- The nonflat strengthening of unipotent relative local base change (first-pass gap 47, Kedlaya Finiteness Proposition 7.2.1) is not addressed here; RD.5/relative-local-cohomology-base-change keeps its flatness hypothesis.
- Assembly: apply consumerRetargets to the first-pass nodes, drop RD.5/nonarchimedean-hahn-banach in favour of LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach, and adopt the sub-layer proposal in restructure (five sub-layers, so that the joined layer shows at most six planets in each).

## How this part changes the first pass

The first-pass packet is not edited. At assembly, the joined layer takes the first-pass nodes with the prerequisites below added, drops the superseded Hahn–Banach node, and adopts the five sub-layers of the restructuring proposal so that each shows at most six planets (the first pass marks six planets in RD.5 and this part five).

First-pass gaps closed here:

- *Cohomological descent for proper hypercoverings (Tsuzuki, Invent. Math. 151 (2003)) not read*: [RD.5/overconvergent-site](#RD-5-overconvergent-site), [RD.5/overconvergent-site-comparison](#RD-5-overconvergent-site-comparison), [RD.5/modification-cohomological-descent](#RD-5-modification-cohomological-descent), [RD.5/fppf-cohomological-descent](#RD-5-fppf-cohomological-descent), [RD.5/proper-surjection-cohomological-descent](#RD-5-proper-surjection-cohomological-descent), [RD.5/proper-hypercover-descent-spectral-sequence](#RD-5-proper-hypercover-descent-spectral-sequence). Tsuzuki 2003 remains unread; the theorem is planned through Le Stum's site and Zureick-Brown's proof, which are public.
- *Tsuzuki, 'On the Gysin isomorphism of rigid cohomology' (Hiroshima Math. J. 29 (1999)) not accessible*: [RD.5/supported-duality-morphism](#RD-5-supported-duality-morphism), [RD.5/kunneth-pairing-on-tubes](#RD-5-kunneth-pairing-on-tubes). Only its RD.5 uses are closed (functoriality of the Poincaré pairing, Section 6.2, and the Künneth construction, Section 6.3), from Berthelot's Dualité; its RD.4 uses (Gysin isomorphism, compact-support excision, finite étale pushforward) stay with RD.4.
- *Berthelot's Finitude (Invent. Math. 128) and Dualité (C. R. Acad. Sci. 325) not public*: [RD.5/rigid-trace-morphism](#RD-5-rigid-trace-morphism), [RD.5/overconvergent-germ-hom-lemma](#RD-5-overconvergent-germ-hom-lemma), [RD.5/compact-support-gysin-and-trace](#RD-5-compact-support-gysin-and-trace), [RD.5/top-degree-dimension-one](#RD-5-top-degree-dimension-one). The Dualité note is read from the author's copy (Dualité 1.2, Lemme 2.1, Propositions 1.5–1.6); the Finitude parts (Propositions 1.8, 1.10, 2.5) needed at RD.4 are not addressed here.
- *Index transfer from the special fibre in the dimension formula for H^1 of an affine curve*: [RD.5/curve-lift-with-boundary](#RD-5-curve-lift-with-boundary), [RD.5/dagger-curve-mayer-vietoris](#RD-5-dagger-curve-mayer-vietoris), [RD.5/principal-parts-index-computation](#RD-5-principal-parts-index-computation). The index is computed on the lifted generic fibre through Crew's Čech argument and GAGA, not by a lattice argument; van der Put, Proposition 6.1, states the same formula.
- *Crew's p-adic functional analysis (Part I and Section 5) and Schneider's Hahn–Banach read at statement level*: [RD.5/frechet-and-dual-frechet-finite](#RD-5-frechet-and-dual-frechet-finite), [RD.5/strictness-transpose-criteria](#RD-5-strictness-transpose-criteria), [RD.5/robba-topological-residue-duality](#RD-5-robba-topological-residue-duality), [RD.5/robba-plus-minus-duality](#RD-5-robba-plus-minus-duality), `LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach`. Crew 2.8, 2.9, 3.8–3.12 and 5.1–5.5 are read with their proofs; Mackey's theorem and non-reflexivity of Banach spaces are requested from LocallyAnalyticDistributions:L0.
- *Mixed full faithfulness, docility and semistable reduction at RD.5*: [RD.5/unipotent-monodromy-along-boundary](#RD-5-unipotent-monodromy-along-boundary), [RD.5/extension-across-boundary](#RD-5-extension-across-boundary), [RD.5/dense-open-restriction-fully-faithful](#RD-5-dense-open-restriction-fully-faithful), [RD.5/convergent-log-isocrystal](#RD-5-convergent-log-isocrystal), [RD.5/log-extension-of-unipotent-isocrystal](#RD-5-log-extension-of-unipotent-isocrystal), [RD.5/global-semistable-reduction](#RD-5-global-semistable-reduction), [RD.5/docility-acceptance](#RD-5-docility-acceptance). Semistable reduction's proof interiors remain a gap in this packet.
- *Dagger–Berthelot rigid comparison for the ordinary-locus consumer*: [RD.5/finiteness-for-smooth-quasi-projective-models](#RD-5-finiteness-for-smooth-quasi-projective-models). Only the RD.5 part (finiteness for smooth quasi-projective models and boundary strata) is closed; the comparison theorem itself is an RD.4 target.
- *Igusa theta-cokernel construction and separate finiteness*: [RD.5/log-rigid-comparison-for-curves](#RD-5-log-rigid-comparison-for-curves), [RD.5/igusa-theta-cokernel-finite](#RD-5-igusa-theta-cokernel-finite). Only the RD.5 finiteness half; the theta-cokernel identification is an RD.4 target.
- *Smooth proper direct images of convergent Frobenius coefficients*: [RD.5/relative-convergent-crystalline-comparison](#RD-5-relative-convergent-crystalline-comparison), [RD.5/convergent-direct-image-smooth-proper](#RD-5-convergent-direct-image-smooth-proper), [RD.5/convergent-direct-image-perfect-complexes](#RD-5-convergent-direct-image-perfect-complexes). Xu's and Ogus's proofs remain cited at statement level (gap).

Prerequisites to add to first-pass nodes at assembly:

- `RD.5/cohomological-descent-for-proper-hypercoverings`: add [RD.5/proper-hypercover-descent-spectral-sequence](#RD-5-proper-hypercover-descent-spectral-sequence). The first-pass node keeps the exported statement; this node is its proof route, replacing the unread-Tsuzuki step.
- `RD.5/top-compact-support-cohomology`: add [RD.5/top-degree-dimension-one](#RD-5-top-degree-dimension-one). The dimension statement is Berthelot's Proposition 1.5 as planned here; the first-pass node keeps the Frobenius twist.
- `RD.5/trace-map`: add [RD.5/rigid-trace-morphism](#RD-5-rigid-trace-morphism). The trace of the first pass is Berthelot's trace; its residue description on curves and A^n becomes a computation of it.
- `RD.5/poincare-pairing`: add [RD.5/overconvergent-germ-hom-lemma](#RD-5-overconvergent-germ-hom-lemma), [RD.5/supported-duality-morphism](#RD-5-supported-duality-morphism). Remove the hypothesis recording Lemme 2.1 as a gap.
- `RD.5/excision-duality-compatibility`: add [RD.5/supported-duality-morphism](#RD-5-supported-duality-morphism). The ladder is the morphism of triangles (2.2.2); remove the Tsuzuki 1999 gap step.
- `RD.5/kunneth-morphism`: add [RD.5/kunneth-pairing-on-tubes](#RD-5-kunneth-pairing-on-tubes). Remove the hypothesis recording Tsuzuki 1999 Section 6.3 as a gap.
- `RD.5/dimension-of-h1-of-affine-curve`: add [RD.5/principal-parts-index-computation](#RD-5-principal-parts-index-computation). Replace the lattice-argument gap step.
- `RD.5/frechet-montel-transpose-strict`: add [RD.5/strictness-transpose-criteria](#RD-5-strictness-transpose-criteria), `LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach`; remove `RD.5/nonarchimedean-hahn-banach`.
- `RD.5/poincare-duality-on-affine-space`: add `LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach`; remove `RD.5/nonarchimedean-hahn-banach`.
- `RD.5/residue-pairing-perfect`: add [RD.5/robba-topological-residue-duality](#RD-5-robba-topological-residue-duality), [RD.5/robba-plus-minus-duality](#RD-5-robba-plus-minus-duality).
- `RD.5/crew-finiteness-and-duality-on-curves`: add [RD.5/frechet-and-dual-frechet-finite](#RD-5-frechet-and-dual-frechet-finite), [RD.5/robba-topological-residue-duality](#RD-5-robba-topological-residue-duality).
- `RD.3/etale-cover-of-affine-space`: add [RD.5/projection-etale-off-hyperplane](#RD-5-projection-etale-off-hyperplane). Kedlaya's Theorem 1 is now its own node (RT-AREA-padic-2/33).

Superseded first-pass nodes:

- `RD.5/nonarchimedean-hahn-banach` → `LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach`: Same statement (consequence (b) there), owned at tier 4; Protocol §15.

Requests to RD.5 from other roadmaps:

- AutomorphicGaloisRepresentationsPartII → PadicDifferentialEquationsAndRigidCohomology:RD.5 (finite-dimensional rigid cohomology of smooth quasi-projective HLTT boundary strata, compatible with the Čech spectral sequence): [RD.5/finiteness-for-smooth-quasi-projective-models](#RD-5-finiteness-for-smooth-quasi-projective-models), `RD.5/finiteness-of-rigid-cohomology`.
- ColemanIntegration → PadicDifferentialEquationsAndRigidCohomology:RD.5 (finite dimensionality of H^1_rig of a smooth affine curve over F_q): `RD.5/finiteness-for-affine-curves-constant-coefficients`, [RD.5/principal-parts-index-computation](#RD-5-principal-parts-index-computation).
- CrystallineCohomology:CR.6 → PadicDifferentialEquationsAndRigidCohomology:RD.5 (Stein-exhaustion Fréchet interfaces): not served. Not served: an upward citation from tier 9; see restructure.

## Red-team findings handed to this part

- **RT-AREA-padic-2/33**. (a) The finite-étale affine-cover theorem keeps its first-pass id RD.3/etale-cover-of-affine-space (parent and realised stage RD.5, exported to RD.6); its source theorem, Kedlaya's finite projection étale off the hyperplane at infinity (More étale covers, Theorems 1–2 with Lemmas 3–6), is now the node RD.5/projection-etale-off-hyperplane, with a consumer retarget. (b) De Jong's Theorem 4.1 is imported from SchemeAndStackFoundations:SF.4/de-jong-alteration-theorem (see RT-AREA-etale/21). The descent node is the Chiarellotto–Tsuzuki/Tsuzuki descent spectral sequence RD.5/proper-hypercover-descent-spectral-sequence, planned with its hypotheses through the overconvergent site; L5's étale descent is not used.
- **RT-AREA-etale/21**. The proposed prefix L5:alterations was not created: the accepted AdicCoefficientsAndComparisons packet's restructure and the SF.4 packet make SchemeAndStackFoundations:SF.4 (tier 2) the single owner of de Jong 4.1, 5.8 and 6.5, because an L5 prefix (tier 10) would be cited upward by SF.4. RD.5 therefore imports SF.4/de-jong-alteration-theorem (and SF.4/alteration, chow-lemma, flattening-by-blowup, modification-domination) and keeps rigid-cohomology descent; the edge is SF.4 → RD.5 instead of L5:alterations → RD.5.
- **RT-AREA-padic-2/32**. RD.5's part is RD.5/finiteness-for-smooth-quasi-projective-models: finiteness of rigid and dagger-tube cohomology of smooth quasi-projective models and of the abutment of any Frobenius-compatible boundary-stratum spectral sequence, which is the RD.5 request of AG2.4. The functorial Grosse-Klönne comparison is an RD.4 target, cited at stage level.

## Restructuring proposals

- **Sub-layers of RD.5 for the atlas, extending the first pass's proposal** (split). With this follow-up RD.5 has 108 target nodes in five blocks. The first pass proposed RD.5a–RD.5d; the full-faithfulness, docility and semistable-reduction targets form a fifth block, and the new descent and duality nodes join RD.5d and RD.5c. RD.5a Relative local monodromy and generic pushforwards (as in the first pass). RD.5b Curves: the first pass's curve nodes with curve-lift-with-boundary, dagger-curve-mayer-vietoris, principal-parts-index-computation, log-rigid-comparison-for-curves and igusa-theta-cokernel-finite. RD.5c Topology, trace and duality: the first pass's strict-map … poincare-duality with frechet-and-dual-frechet-finite, strictness-transpose-criteria, robba-topological-residue-duality, robba-plus-minus-duality, overconvergent-germ-hom-lemma, rigid-trace-morphism, compact-support-gysin-and-trace, top-degree-dimension-one, finite-etale-trace-projector, supported-duality-morphism, kunneth-pairing-on-tubes and rigid-cohomology-base-field-extension. RD.5d Dévissage, descent and the main theorems: the first pass's main-theorem nodes with RD.3/etale-cover-of-affine-space, projection-etale-off-hyperplane, overconvergent-site, overconvergent-site-comparison, modification-cohomological-descent, fppf-cohomological-descent, proper-surjection-cohomological-descent, proper-hypercover-descent-spectral-sequence, finiteness-for-smooth-quasi-projective-models, relative-convergent-crystalline-comparison, convergent-direct-image-smooth-proper and convergent-direct-image-perfect-complexes. RD.5e Full faithfulness, docility and semistable reduction (new): the seven RD.3-prefixed mixed full-faithfulness nodes with unipotent-monodromy-along-boundary, extension-across-boundary, dense-open-restriction-fully-faithful, convergent-log-isocrystal, log-extension-of-unipotent-isocrystal, global-semistable-reduction and docility-acceptance. Order: RD.5a, RD.5b, RD.5c precede RD.5d; RD.5e uses RD.5a–RD.5b only through the local monodromy theorem and precedes RD.5b's log-rigid comparison.
- **Hahn–Banach is owned by LocallyAnalyticDistributions:L0** (rescope). RD.5/nonarchimedean-hahn-banach (first pass) duplicates LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach (tier 4, accepted), whose consequence (b) is exactly the continuous-extension statement RD.5 uses; the L0 follow-up already replaced its own citation of the RD.5 node. Drop RD.5/nonarchimedean-hahn-banach at assembly and repoint its consumers (RD.5/frechet-montel-transpose-strict, RD.5/poincare-duality-on-affine-space) to LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach, as listed in supersededNodes. The first pass's proposal to move the remaining locally convex lemmas to L0 stands; this packet's two new functional-analysis lemmas are planned here only because L0 lacks Mackey's theorem and the Fréchet–Montel statements (requested).
- **CR.6's request to RD.5 points upward** (rescope). CrystallineCohomology (tier 9) requests from RD.5 (tier 12) strict Fréchet and ind-Fréchet derived cohomology interfaces for semistable Stein exhaustions and finite-dimensional log rigid pieces (CR.6/stein-hk, stein-hk-comparison, tower-hk). Under the upstream tier rule a tier-9 plan cannot cite RD.5; RD.5's finiteness theorems are for k-varieties, not for Stein exhaustions of rigid curves. CR.6 plans the Stein-exhaustion interfaces itself (the notion moves down), importing AdicSpacesPartII:F1 dagger finiteness and duality (tier 3) and LocallyAnalyticDistributions:L0; RD.5 does not serve the request.

## Sources

- Pierre Berthelot, *Dualité de Poincaré et formule de Künneth en cohomologie rigide*, C. R. Acad. Sci. Paris Sér. I Math. 325 (1997), 493–498; author's copy, 6 pages, paginated 1–6. https://wstein.org/people/berthelo/publis/Poincare_Kunneth.pdf (read 2026-10-14; sections: Abridged English version, pp. 1–2; §1 Le morphisme trace, 1.1–1.7, pp. 3–4; §2 Dualité de Poincaré, Lemme 2.1–Théorème 2.4 and Remarque, pp. 4–5; §3 Formule de Künneth, 3.1–3.4 and Remarque, pp. 5–6).
- David Zureick-Brown, *Cohomological descent on the overconvergent site*, arXiv:1204.5246v4 (14 Feb 2014); published Res. Math. Sci. 1 (2014). https://arxiv.org/abs/1204.5246v4 (read 2026-10-14; sections: §1 (Theorem 1.1, Remarks 1.2–1.3, §1.4), pp. 1–2; §3 (Definition 3.12, Theorems 3.16–3.17, Corollary 3.18, Remark 3.9), pp. 4–10; §5 (Theorem 5.9 through the proof of Theorem 1.1 (ii)), pp. 16–24).
- Bernard Le Stum, *The overconvergent site*, Mém. Soc. Math. France 127 (2011); Numdam PDF (printed page = PDF page − 8). https://www.numdam.org/item/MSMF_2011_2_127__1_0/ (read 2026-10-14; sections: Definitions 2.2.1, 2.3.7, 2.4.1, 2.4.11, 2.5.13, Proposition 2.5.14 (pp. 15–41); Definitions 3.3.4, 3.3.7, Proposition 3.3.8 (pp. 52–54); Theorem 3.5.9, Proposition 3.5.11 (pp. 67–68); Theorem 4.6.7, Corollary 4.6.8 (p. 91)).
- Bruno Chiarellotto and Nobuo Tsuzuki, *Cohomological descent of rigid cohomology for étale coverings*, Rend. Sem. Mat. Univ. Padova 109 (2003), 63–215; Numdam (printed page = PDF page + 62). https://www.numdam.org/item/RSMUP_2003__109__63_0/ (read 2026-10-14; sections: §1 introduction (§1.2, p. 66), pp. 63–68; Theorem 7.4.1 and Corollary 7.4.3, pp. 150–152; Theorem 11.7.1 and Proposition 11.7.3, pp. 209–210).
- Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, arXiv:math/0208027v6 (Duke Math. J. 134 (2006)); printed page = PDF page. https://arxiv.org/abs/math/0208027v6 (read 2026-10-14; sections: §6.2 (Hypothesis 6.2.1–Proposition 6.2.10), pp. 37–39; §6.4, pp. 41–42; §8.2–8.3, pp. 54–56; §9.1–9.4, pp. 61–67).
- Richard Crew, *Finiteness theorems for the cohomology of an overconvergent isocrystal on a curve*, Ann. Sci. École Norm. Sup. (4) 31 (1998), 717–763; Numdam. http://www.numdam.org/item/ASENS_1998_4_31_6_717_0/ (read 2026-10-14; sections: Part I §§2–3 (2.8, 2.9, 3.1–3.13), pp. 724–727; §4 (4.1–4.9), pp. 728–731; §5 (5.1–5.6), pp. 731–734; §7 (7.2–7.5 and its proof), pp. 742–746).
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, I: Unipotence and logarithmic extensions*, arXiv:math/0405069v5 (Compositio Math. 143 (2007)); printed page = PDF page. https://arxiv.org/abs/math/0405069v5 (read 2026-10-14; sections: §3.2 (Definitions 3.2.5–3.2.6, Proposition 3.2.20), pp. 19–24; Theorem 3.3.4, p. 27; §4.3–4.4 (Hypothesis 4.3.2–Proposition 4.4.4), pp. 41–43; §5.2–5.3 (Theorem 5.2.1–Remark 5.3.4), pp. 45–48; §6.1 and §6.4 (Definition 6.1.7, Theorems 6.4.1, 6.4.5), pp. 51–56).
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, II: A valuation-theoretic approach*, arXiv:math/0508191v3 (Compositio Math. 144 (2008)). https://arxiv.org/abs/math/0508191v3 (read 2026-10-14; sections: Proposition 4.1.1, Lemma 4.1.2, Theorem 4.2.1 and its proof, pp. 14–15).
- Kiran S. Kedlaya, *Semistable reduction for overconvergent F-isocrystals, IV: Local semistable reduction at nonmonomial valuations*, arXiv:0712.3400v4 (Compositio Math. 147 (2011)). https://arxiv.org/abs/0712.3400v4 (read 2026-10-14; sections: Lemma 2.3.8–Definition 2.3.10, p. 15; §2.4 (Definition 2.4.1–Remark 2.4.5), pp. 15–17; Lemma 3.5.1 (Dwork modules), p. 29; Definition 5.1.9 (Artin–Schreier alterations), p. 47).
- Marco D’Addezio, *Parabolicity conjecture of F-isocrystals*, arXiv:2012.12879v4. https://arxiv.org/abs/2012.12879v4 (read 2026-10-14; sections: §4.1 (Theorem 4.1.3–Lemma 4.1.8), pp. 12–13; §4.2 (4.2.1–4.2.12), pp. 13–16; §4.4 (Definition 4.4.1–§4.4.11), pp. 19–23).
- Kiran S. Kedlaya, *More étale covers of affine spaces in positive characteristic*, arXiv:math/0303382v3 (J. Algebraic Geom. 14 (2005)). https://arxiv.org/abs/math/0303382v3 (read 2026-10-14; sections: Theorems 1–2 and Lemmas 3–6, pp. 1–4).
- Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*, arXiv:2209.06366v1. https://arxiv.org/abs/2209.06366v1 (read 2026-10-14; sections: §5.1 (Lemma 5.1.2–Corollary 5.1.12), pp. 53–55).
- Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, *On the rigid cohomology of certain Shimura varieties*, arXiv:1411.6717v1. https://arxiv.org/abs/1411.6717v1 (read 2026-10-14; sections: Lemma 2.3, p. 46; §6.3 (Lemmas 6.7–6.9), pp. 189–190; §6.5 (Lemmas 6.19–6.21, Corollaries 6.22–6.24), pp. 206–208).
- Elmar Grosse-Klönne, *Rigid analytic spaces with overconvergent structure sheaf*, J. reine angew. Math. 519 (2000); author's arXiv:1408.3329v1. https://arxiv.org/abs/1408.3329v1 (read 2026-10-14; sections: Theorem 5.1 and its proof, p. 23).
- Haoyang Guo and Emanuel Reinecke, *A prismatic approach to crystalline local systems*, arXiv:2203.09490v3 (27 Oct 2023); the first pass cites the NSF-repository version, where Theorem 6.13 is on pp. 97–98. https://arxiv.org/abs/2203.09490v3 (read 2026-10-14; sections: Theorem 6.13 and its proof, Corollary 6.14, pp. 60–61).
- Atsushi Shiho, *Relative log convergent cohomology and relative rigid cohomology I*, arXiv:0707.1742v2. https://arxiv.org/abs/0707.1742v2 (read 2026-10-14; sections: Theorem 2.36 and Corollaries 2.37–2.38, p. 31 (statements and the proof of 2.36)).
- Daxin Xu, *On higher direct images of convergent isocrystals*, arXiv:1802.09060v1 (Compositio Math. 155 (2019), 2180–2213, with different numbering). https://arxiv.org/abs/1802.09060v1 (read 2026-10-14; sections: Introduction: Theorem 1.5, Corollaries 1.6 and 1.8, Theorem 1.9, pp. 2–3; Proposition 5.10, p. 17 (statement); Corollary 9.3, p. 32 (statement)).
- Marius van der Put, *The cohomology of Monsky and Washnitzer*, Mém. Soc. Math. France (N.S.) 23 (1986), 33–59 (Numdam; maintainer-cleared copy read). http://www.numdam.org/item/MSMF_1986_2_23__33_0/ (read 2026-10-14; sections: Proposition 6.1, p. 47).
