# The classical analytic cohomology inputs to diamonds, Part II

This roadmap joins three continuations of classical rigid étale cohomology. The first proves mod-p Poincaré duality for smooth proper rigid spaces, including finite local systems, and then derived duality for constant finite p-power, integral and rational coefficients. Its local proof constructs an integral Faltings trace, computes the pairing on polystable root towers, and descends through proper rig-isomorphisms and finite quotients. Globalization uses almost coherent proper duality and primitive comparison.

The second route proves that higher direct images of finite mod-p local systems under a proper smooth morphism are finite local systems. The extra input is almost finite presentation over a strictly totally disconnected perfectoid base, strong enough to make fibre ranks locally constant. The third route uses that theorem, proper resolution and generic smoothness to prove constructible proper pushforward, then arbitrary proper base change with all torsion coefficients. Heuer’s constant cohomology sheaf is its final application. Relative finiteness is established before all-torsion proper base change, so the proof has no circular base-change appeal.

The parent roadmap supplies the analytic sites, existing traces, the proper torsion projection formula and cohomological bound, weak geometric proper base change and proper algebraic/analytic comparison. This Part II begins with the missing p-torsion duality and relative finiteness inputs. In particular, an analytic trace with coefficients invertible in the characteristic-zero field already exists in the parent; its existence is not replanned here. The work is a mathematical plan, with every implementation status unchecked.

## Conventions and library boundary

Fix a prime p. Unless a target states a different base, C is a complete algebraically closed rank-one extension of Q_p, with valuation ring O_C and maximal ideal 𝔪_C. For Galois-equivariant conclusions, K is a complete rank-one nonarchimedean field of mixed characteristic (0,p) and C is its completed algebraic closure. The formal-duality layer also uses such valuation rings O_K. An admissible model is flat and topologically finitely presented over the valuation ring; use separated models wherever formal dualizing complexes are invoked, separated qcqs models in global comparisons, and restrict locally for the sheaf statements. The canonical generic identification and model-independent coherent trace in PD.1 use algebraically closed C, as in Z §2.7. The adjective “pure-d” records pure relative dimension d, not merely an upper bound.

Write 𝔛₀=𝔛⊗O_C/p and 𝔛̄=𝔛⊗O_C/𝔪_C. These fibres are different: even a nice model need not have reduced 𝔛₀. Almostification uses 𝔪_C; it is compatible with derived tensor because the ideal is flat and idempotent. On a perfectoid base over C, the pseudouniformizer almost convention in SW uses the corresponding ideal of arbitrarily small positive valuation. A sheaf annihilated by the almost ideal is zero in the almost category, whereas a sheaf killed by p need not be.

Complexes use cohomological indexing: a module M[−a] is concentrated in degree a. A pairing is perfect when its two tensor–internal-Hom adjoints are isomorphisms. This does not declare either factor a perfect complex over a singular coefficient ring. Tate twists (a) retain their Galois action. Breuil–Kisin twists {a} come from the completed cotangent line; Fontaine dlog compares the two lines with the factor ζ_p−1. A choice of compatible roots of unity is used for coordinates and is not a canonical trivialization.

The symbols f_* and f^* denote direct and inverse image; R and L indicate their derived versions. The notation RalHom denotes derived internal Hom in the almost category. All finite-stage reductions, inverse limits and scalar changes in the statements are derived unless an underived map is explicitly named. For arbitrary characteristic-zero K in PD.7, split coefficients into the residue-prime-to-p and p-primary cases as appropriate; do not impose the p-primary mixed-characteristic proof on residue characteristic zero.

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`, and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit and exact supplier statements were checked before assigning ownership. The current upstream roadmaps and current Tau Ceti library were also searched, including the nine post-snapshot directions named in WORKERS. Their existing profinite, representation and geometric infrastructure is imported. The formal almost-derived duality and Zariski-constructible proper-base-change APIs used below were not found as existing implementations.

- `mathlib:LinearMap.IsPerfPair` in `Mathlib.LinearAlgebra.PerfectPairing.Basic`: For a bilinear form M→ₗ[R]N→ₗ[R]R, both adjoint linear maps are bijective. Use this exact existing notion for the underived field-valued pairing, not a duplicate structure.
- `mathlib:Representation.invariants` in `Mathlib.RepresentationTheory.Invariants`: The submodule of vectors v fixed by every ρ(g), with membership characterized pointwise. PD.4’s derived almost invariants have this as their ordinary degree-zero specialization.
- `mathlib:IsPGroup.exists_fixed_point_of_prime_dvd_card_of_fixed_point` in `Mathlib.GroupTheory.PGroup`: For an action of a p-group on a finite type whose cardinality is divisible by p, a given fixed point has a distinct second fixed point. Apply to the underlying additive set of a nonzero finite F_p-representation, with the zero fixed point, in the unipotent-filtration proof.

The compact [suggested file](../suggested/ClassicalAdicEtaleCohomologyPartII.lean) contains four algebraic compatibility examples on actual pinned carriers. The geometric carriers remain reader targets. Elaboration verifies these signatures; the two examples with `sorry` remain proof obligations.

**Existing finite algebra input.** For a finite p-group G acting on a nonzero finite F_p-vector space V, the invariant subspace contains a nonzero vector. The suggested file records an unnamed example of this input to `PD.5/local-system-duality` (Z Theorem 5.4.5, pp. 80–81). At the pins it follows from Mathlib’s finite-set fixed-point theorem, since zero is fixed and the cardinality is divisible by p. Current Tau Ceti already supplies the stronger `Representation.exists_common_fixed_vector_of_isPGroup` and `Representation.invariants_ne_bot_of_isPGroup` in `TauCeti.RepresentationTheory.Unipotent.PowerOrder`: the field has exponential characteristic p, V is nonzero finite-dimensional, and G can be infinite. Reuse these declarations when packaging against current upstream; do not allocate a new fixed-vector theorem here. They were checked at Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, separately from the pinned elaboration baseline. The other three examples check invariant membership, both perfect-pairing adjoints and multiplication by a nonunit. All 78 geometric definition tests remain reader specifications below.

## Build order and acceptance

| Layer | Targets | Coverage | Planets |
| --- | --- | --- | --- |
| PD.0 | Almost coherent nearby cycles | planned | 4 |
| PD.1 | Formal canonical sheaves and traces | planned | 4 |
| PD.2 | Integral Faltings traces | planned | 4 |
| PD.3 | Polystable local duality | planned | 6 |
| PD.4 | Descent of local almost duality | planned | 5 |
| PD.5 | Global étale Poincaré duality | planned | 6 |
| PD.6 | Proper smooth relative finiteness | planned | 4 |
| PD.7 | Zariski-constructible proper base change | planned | 4 |

The [independent review](../reviews/REV-DESIGN-ClassicalAdicEtaleCohomologyPartII.md) accepts the packet as a target-level planning pass: every target has a statement, source, acceptance criterion and dependency chain ending in the libraries, an exact supplier node, a requested stage or a named gap. No layer is claimed closed. G1–G5 below identify proof inputs requiring further decomposition; the requested stages are contracts, not implementation claims. The initial 96 Zavyalov, three Berkeley and one Heuer route items are all accounted for in the packet’s `sourceCoverage`, merged into 64 target-level nodes.

The core build path is PD.0 → PD.1 → PD.2 → PD.3 → PD.4 → PD.5. PD.6 uses the existing primitive comparison and quasi-pro-étale base-change inputs and is independent of the proof of duality. PD.7 uses relative finiteness and the proper p-adic cohomology comparison. This continuation is placed after the existing AInfCohomology/PadicHodgeTheory bundle and the needed DiamondEtaleCohomology input. It introduces no upward prerequisite into the parent roadmap.

## PD.0. Almost coherent nearby cycles

Specialize the abstract almost-module formalism to admissible formal O_C-models. Construct almost coherent derived nearby-cycle complexes, their modulo-p reduction and generic fibre, and the almost proper-duality comparison. Retain the finite-dimensional almost amplitude. The universally coherent duality and general nearby-cycle coherence contracts G1 and G3 are explicit.

**Layer inputs:** `AInfCohomology:AI.1`, `AdicSpacesPartII:F0`, `AdicSpacesPartII:R2`, `AdicSpacesPartII:R3`, `EnhancedDerivedSheaves:E1`, `PadicHodgeTheory:P8`, `PerfectoidSpaces:P0`, `PerfectoidSpaces:P3`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:key`.

### Almost coherent sheaves on formal models

**Definition** · `formal-almost-coherence` · Planet: Almost coherent formal sheaves.

For a qcqs admissible formal O_C-scheme 𝔛, with I=(p) and almost ideal 𝔪_C, an almost sheaf Fᵃ is almost adically quasi-coherent when its left-adjoint representative F! is I-adically complete with quasi-coherent reductions on every formal affine. It is almost coherent when locally its module of sections is almost finitely presented. D_acoh(𝔛)ᵃ is the full subcategory of D(O_𝔛ᵃ) whose cohomology sheaves have this property. The same notation on 𝔛₀ denotes almost quasi-coherent almost coherent sheaves on the scheme modulo p.

**Proof/construction.**

1. Apply the abstract Serre quotient of modules and sheaves supplied by P0 to (O_C,𝔪_C).
2. Use completed localization on each formal affine and glue; use AC Lemma 4.5.22 to identify almost finite presentation with almost coherence in this adhesive setup.
3. Define the derived subcategory by cohomology, using the almost coherent weak Serre property; do not define it using all adically quasi-coherent sheaves as an abelian category.

**Uses.** Z §3.1 and Appendix C: places nearby cycles in a category on which affine comparison, proper pushforward and generic fibre work; Z §4.4 and §5.2: supplies the coherent hypotheses for almost duality.

**API.**

- `TauCeti.AdicDuality.formal_almost_coherence.affine_sections` (characterisation): On Spf A, almost coherent sheaves correspond to almost coherent A-modules under completed associated sheaf and sections.
- `TauCeti.AdicDuality.formal_almost_coherence.reduction` (functoriality): For n≥1, reduction modulo pⁿ preserves almost coherence and agrees with the scheme associated-sheaf functor.
- `TauCeti.AdicDuality.formal_almost_coherence.cohomology` (characterisation): A derived object belongs to D_acoh exactly when every cohomology almost sheaf is almost coherent.

**Unit tests.**

- `formal-almost-coherence.unit` (example): O_𝔛ᵃ and its reductions belong to the category.
- `formal-almost-coherence.almost_zero` (example): A sheaf annihilated by 𝔪_C represents the zero object, even if its honest sections are nonzero.
- `formal-almost-coherence.infinite_rank` (non-example): The derived p-completed direct sum of infinitely many copies of O_C is not almost finitely generated: reduction and multiplication by one fixed nonzero ε cannot be generated in finitely many coordinates.

**Acceptance.** The formal and scheme-modulo-p categories agree on sheaves killed by p.

**Direct prerequisites:** `AdicSpacesPartII:R2/admissible-formal-scheme`, `PerfectoidSpaces:P0`, `EnhancedDerivedSheaves:E1`.

**Source:** AC §§4.5, 4.8, Definitions 4.5.3, 4.5.6, Lemma 4.5.22, Definition 4.8.9, pp. 94–100, 109.

### Affine comparison and almost coherent calculus

**Theorem** · `affine-almost-derived-calculus` · Planet: Almost proper mapping theorem.

For 𝔛=Spf A topologically finitely presented over O_C, RΓ identifies D_acoh(𝔛)ᵃ with D_acoh(A)ᵃ, compatibly with completed localization and reduction. For F∈D⁻_acoh and G∈D⁺_acoh, RalHom(F,G) is bounded below almost coherent and is computed by the affine derived Hom. Proper topologically finitely presented maps preserve almost coherent cohomology; boundedness is retained in the almost category. All derived completeness claims are derived p-completeness, not exactness of ordinary completion on arbitrary modules.

**Proof/construction.**

1. Use derived completed localization and the affine equivalence for derived complete complexes; almost coherent cohomology makes the associated-sheaf functor t-exact.
2. Approximate almost finitely presented sheaves to any prescribed finitely generated subideal of 𝔪_C by coherent sheaves, as in AC Theorem 4.7.6.
3. Apply coherent formal proper mapping, then finite Čech descent and these approximations; apply affine Ext comparison to internal Hom. Use the corrected boundedness order in AC Lemma 4.9.7(2).

**Acceptance.** On an affine, Hⁱ(RΓF)=ΓHⁱ(F) in the almost category; proper pushforward need not preserve honest finite presentation.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.0/formal-almost-coherence`, `EnhancedDerivedSheaves:E1`, `AInfCohomology:AI.1`, `AdicSpacesPartII:F0`.

**Source:** AC Theorem 4.8.6, Corollary 4.8.16, Lemma 4.9.7(1), Theorem 5.1.6, pp. 108–118.

### Almost coherent proper duality

**Comparison** · `almost-proper-duality`.

Let R=O_C/pⁿ, n≥1, and f:Y→T be a proper finitely presented morphism between separated finitely presented R-schemes. Assuming the universally coherent coherent f! of request G1, define f!ᵃ(Fᵃ)=(f!(F!))ᵃ. It is right adjoint to R f_* on bounded-below almost quasi-coherent categories. For A∈D⁻_acoh(Y)ᵃ and B∈D⁺_aqc(T)ᵃ, R f_* RalHom_Y(A,f!ᵃB)≅RalHom_T(R f_*A,B), naturally on T. For a smooth relative-d map, f!ᵃB=f^*B⊗Ωᵈ[d].

**Proof/construction.**

1. Use flatness of the almost tensor ideal and preservation of almost-zero objects by the coherent f! to descend to the quotient.
2. Obtain adjunction from coherent proper duality and the almost projection formula.
3. Construct the internal-Hom comparison by cup, evaluation and the counit, then prove it is an isomorphism by testing against quasi-coherent objects. G1 records the non-Noetherian input not supplied by the reserved node.

**Acceptance.** For f=id the counit and comparison are identities; the Hom comparison lives on T, not Y.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.0/formal-almost-coherence`, `SchemeAndStackFoundations:key/coherent-duality`, `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E1`.

**Source:** AC §5.5, Definition 5.5.2, Theorem 5.5.5, Lemmas 5.5.6–5.5.7, pp. 129–131.

### Almost nearby-cycle complexes

**Construction** · `nearby-cycle-complexes` · Planet: Almost nearby cycles.

For an admissible formal O_C-scheme 𝔛 with d-dimensional generic fibre X, write ν:X_proét→𝔛_Zar for the specialization morphism of ringed sites and μ:X_proét→X_an for the analytic one. Set A_𝔛=Rν_*Ô_X^{+a} and K_𝔛=Rν_*(O_X⁺/p)ᵃ on 𝔛₀; K_𝔛≅A_𝔛⊗ᴸ_{O_𝔛}O_𝔛₀. Both have almost coherent cohomology and almost amplitude [0,d]; A_𝔛 is derived p-complete. Their formation commutes with étale maps of formal schemes.

**Proof/construction.**

1. Construct ν by specialization and its structural ring map; use P8’s pro-étale completed structure sheaf.
2. Compute locally on toric perfectoid covers with almost purity and continuous cochains; sheafify the resulting finite-range almost coherent cohomology.
3. Use derived reduction and étale base change; invoke the general almost-coherence theorem with its finite-dimensional generic-fibre bound. The proof input beyond the smooth P8 scope is request G3.

**Uses.** Z Definition 3.5.5 and Definition 4.1.1: provides the algebra object and its mod-p reduction for Faltings’ pairing; Z §5.5; BH Lemma 3.25: controls singular proper spaces as well as smooth ones.

**API.**

- `TauCeti.AdicDuality.nearby_cycle_complexes.derived_reduction` (compatibility): A_𝔛⊗ᴸO_𝔛₀≅K_𝔛, with cup products.
- `TauCeti.AdicDuality.nearby_cycle_complexes.etale_pullback` (functoriality): For étale g:𝔜→𝔛, g^*K_𝔛≅K_𝔜 and g^*A_𝔛≅A_𝔜.
- `TauCeti.AdicDuality.nearby_cycle_complexes.amplitude` (characterisation): In the almost category, Hⁱ(A_𝔛)=Hⁱ(K_𝔛)=0 for i<0 or i>d.

**Unit tests.**

- `nearby-cycle-complexes.point` (example): For Spf O_C, A≅O_Cᵃ and K≅O_Cᵃ/p in degree zero.
- `nearby-cycle-complexes.torus` (example): For the d-dimensional smooth formal torus, the torsion-free part of Hⁱ(A) has rank binomial(d,i).
- `nearby-cycle-complexes.two_sites` (non-example): The target of ν is the formal Zariski site, so replacing it by μ gives O_X-coherent rational Hodge–Tate sheaves rather than integral sheaves on 𝔛₀.

**Acceptance.** The honest integral complex may have almost-zero cohomology outside [0,d]; truncation is made after almostification.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.0/formal-almost-coherence`, `ClassicalAdicEtaleCohomologyPartII:PD.0/affine-almost-derived-calculus`, `PadicHodgeTheory:P8`, `PerfectoidSpaces:P3`, `AdicSpacesPartII:R2`.

**Source:** Z §3.1, p. 30; AC Theorems 6.13.5–6.13.6, pp. 170–172.

### Generic fibres of almost coherent complexes

**Construction** · `generic-fibre-almost-complexes` · Planet: Generic fibres of almost complexes.

For the specialization map sp:X_an→𝔛_Zar, define F_K=Lsp^*F=sp⁻¹F⊗ᴸ_{sp⁻¹O_𝔛}O_X. It kills 𝔪_C-almost-zero objects, hence descends from almost complexes to ordinary O_X-complexes. It sends bounded almost coherent complexes to bounded coherent complexes and commutes with proper pushforward between admissible models. When X is smooth, (Rν_*Ô_X^{+a})_K≅Rμ_*Ô_X.

**Proof/construction.**

1. Invert a nonzero topologically nilpotent scalar on formal affines, then pull back and glue.
2. Use almost coherent approximation and coherent generic-fibre comparison to identify cohomology and proper direct images.
3. Compare the two ringed-site pullbacks and the integral/rational completed structure sheaves for the last identification. Smoothness supplies coherent rational Hodge–Tate cohomology in Z Lemma C.9; it is not needed for the generic-fibre functor itself.

**Uses.** Z Theorem 3.4.12: compares BMS and Scholze after inversion; Z Lemma 3.6.4: checks trace compatibility on the generic fibre.

**API.**

- `TauCeti.AdicDuality.generic_fibre_almost_complexes.exact` (functoriality): Generic fibre is exact on coherent and almost coherent cohomology and preserves derived tensor products.
- `TauCeti.AdicDuality.generic_fibre_almost_complexes.proper_pushforward` (compatibility): For proper f, (R f_*F)_K≅R f_K,*(F_K).
- `TauCeti.AdicDuality.generic_fibre_almost_complexes.nearby` (equivalence): For smooth generic fibre X, the generic fibre of A_𝔛 is Rμ_*Ô_X, compatible with cup and finite étale trace.

**Unit tests.**

- `generic-fibre-almost-complexes.structure` (example): (O_𝔛ᵃ)_K=O_X.
- `generic-fibre-almost-complexes.torsion` (example): (O_𝔛ᵃ/pⁿ)_K=0 for n≥1.
- `generic-fibre-almost-complexes.point_compare` (compatibility): For Spf O_C, generic fibre is ordinary scalar extension O_C→C, so two lattices differing by a nonzero scalar give isomorphic C-lines.

**Acceptance.** A sheaf killed by a power of p has zero generic fibre; this assertion concerns generic fibre, not reduction modulo p.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.0/formal-almost-coherence`, `ClassicalAdicEtaleCohomologyPartII:PD.0/affine-almost-derived-calculus`, `ClassicalAdicEtaleCohomologyPartII:PD.0/nearby-cycle-complexes`, `AdicSpacesPartII:R2/formal-rigid-properness-comparison`, `AdicSpacesPartII:R3`.

**Source:** Z Appendix C, Definitions C.1, C.3, Lemmas C.4–C.9, pp. 92–95.

**Closure checks for PD.0.** G1, G3. Resolve the supplier contracts listed below and verify the tests above before changing this layer from planned to closed.

## PD.1. Formal canonical sheaves and traces

Construct coherent formal dualizing complexes as derived inverse limits, with canonical flat bottom sheaf and finite-level reduction. Prove étale/algebraic comparison and Hartogs gluing for geometrically reduced residue fibres. Construct bottom traces, the generic top-differential identification and model-independent coherent traces on equal-dimensional smooth rigid spaces. G1 and G2 supply the valuation-base geometry. The generic identification and coherent rigid trace construction use algebraically closed C; separatedness is explicit for formal duality.

**Layer inputs:** `AInfCohomology:AI.1`, `AdicSpacesPartII:F0`, `AdicSpacesPartII:R2`, `AdicSpacesPartII:R3`, `ClassicalAdicEtaleCohomologyPartII:PD.0`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:key`.

### Formal dualizing complexes and canonical sheaves

**Construction** · `formal-dualizing-complex` · Planet: Formal dualizing complexes.

For a separated flat admissible formal O_K-scheme 𝔛 with pure relative dimension d, put 𝔛_n=𝔛×Spec(O_K/pⁿ), n≥1. Choose compatible scheme dualizing complexes ω•_{𝔛_n}=f_n!O_K/pⁿ and define ω•_𝔛=Rlim_n ω•_{𝔛_n}. Its isomorphism class is independent of choices, but no canonical identification of these complexes is asserted. The bottom sheaf ω_𝔛=H⁻ᵈ(ω•_𝔛) is canonical and O_K-flat. The complex is coherent of amplitude [−d,0], reduces derivedly to ω•_{𝔛_n}, and for smooth 𝔛 is Ω̂ᵈ_{𝔛/O_K}[d].

**Proof/construction.**

1. Apply coherent f! over O_K/pⁿ, using its flat-finite-presentation amplitude theorem, and choose compatible reductions.
2. Take the derived inverse limit; use coherence and derived completeness to identify derived reductions.
3. Extract the bottom sheaf from the compatible system; use torsion-freeness over the valuation ring for its flatness. Universally coherent f! is G1.

**Uses.** Z §§2.5–2.7: supplies the sheaf for Hartogs extension and the bottom trace; Z Definition 3.5.5: supplies the derived mod-p target of Faltings’ trace.

**API.**

- `TauCeti.AdicDuality.formal_dualizing_complex.bottom` (projection): ω_𝔛=lim_n H⁻ᵈ(ω•_{𝔛_n}) and is O_K-flat.
- `TauCeti.AdicDuality.formal_dualizing_complex.reduction` (compatibility): ω•_𝔛⊗ᴸO_K/pⁿ≅ω•_{𝔛_n} for n≥1.
- `TauCeti.AdicDuality.formal_dualizing_complex.smooth` (equivalence): For smooth pure-d 𝔛, ω•_𝔛≅Ω̂ᵈ[d], and the bottom identification is canonical.

**Unit tests.**

- `formal-dualizing-complex.point` (example): For Spf O_K, ω•=O_K and ω=O_K.
- `formal-dualizing-complex.disc` (example): For Spf O_K⟨T₁,…,T_d⟩, ω is generated by dT₁∧⋯∧dT_d and sits in degree −d.
- `formal-dualizing-complex.singular_special` (non-example): A smooth generic fibre with non-Cohen–Macaulay reduction need not have ω• concentrated in one degree; the construction retains its higher cohomology.

**Acceptance.** The modulo-p dualizing complex is a derived reduction of ω•_𝔛, not generally the sheaf ω_𝔛/p in degree −d alone.

**Direct prerequisites:** `SchemeAndStackFoundations:key/coherent-duality`, `SchemeAndStackFoundations:SF.2`, `AdicSpacesPartII:R2/admissible-formal-scheme`, `AInfCohomology:AI.1`.

**Source:** Z Definition 2.4.1, Warning 2.4.2, Theorem 2.4.4, Corollary 2.4.5, pp. 19–20.

### Étale and algebraic comparison of formal duality

**Theorem** · `formal-dualizing-comparison`.

Bounded coherent complexes on an admissible formal model are derived p-complete. For an étale g:𝔜→𝔛 of separated pure-d models, g^*ω_𝔛≅ω_𝔜 canonically and g^*ω•_𝔛≅ω•_𝔜 as isomorphism classes. If 𝔛 is the p-adic completion of a separated flat finitely presented O_K-scheme with pure-d generic fibre, its formal dualizing complex is the derived completion of the scheme one, and their bottom sheaves agree under completion.

**Proof/construction.**

1. Use coherent completeness and reduction to each finite thickening.
2. Apply étale f! comparison and flatness to the bottom sheaves.
3. Compare completion with the inverse system of algebraic dualizing complexes; avoid claiming canonical identifications not furnished by the inverse limit.

**Acceptance.** Étale coordinate changes give the determinant Jacobian transition on the bottom sheaf.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-dualizing-complex`, `AdicSpacesPartII:F0`, `SchemeAndStackFoundations:key/coherent-duality`.

**Source:** Z Lemmas 2.4.6–2.4.8 and Corollary 2.4.9, pp. 20–22.

### Gluing generic and smooth-open sections

**Definition** · `hartogs-gluing`.

Let 𝔘⊂𝔛 be a formal open and F a sheaf. Define Glue_𝔘(F) as the kernel of j_K,*F_K⊕j_𝔘,*(F|𝔘)→j_{𝔘_K},*(F_K|𝔘_K), with the difference of the two restriction maps. There is a natural map F→Glue_𝔘(F). The notation as an intersection of lattices is used only after proving both restriction maps injective.

**Proof/construction.**

1. Form the kernel of the restriction difference in the sheaf category.
2. Construct the natural map by the two restrictions; identify it with an intersection only inside a common ambient sheaf when injectivity has been proved.

**Uses.** Z Theorem 2.5.5: characterizes ω by generic and smooth-open sections; Z Theorem 3.5.2: glues the smooth and generic Faltings maps.

**API.**

- `TauCeti.AdicDuality.hartogs_gluing.sections` (characterisation): Sections are pairs of a generic section and an integral section on 𝔘 with equal restrictions on 𝔘_K.
- `TauCeti.AdicDuality.hartogs_gluing.lift` (universal-property): A compatible pair determines a unique section of Glue_𝔘(F).
- `TauCeti.AdicDuality.hartogs_gluing.intersection` (compatibility): When both maps into the common generic restriction are monomorphisms, Glue equals the usual intersection of their images.

**Unit tests.**

- `hartogs-gluing.whole_open` (example): For 𝔘=𝔛 the gluing sheaf is F.
- `hartogs-gluing.empty_open` (example): For 𝔘 empty the gluing sheaf is j_K,*F_K, so it need not equal F.
- `hartogs-gluing.point_lattice` (example): For 𝔛=Spf O_K and 𝔘=𝔛, the compatible pairs in K⊕O_K are exactly (a,a) with a∈O_K, not all of K⊕O_K.

**Acceptance.** Compatible pairs, rather than arbitrary pairs, are the sections.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.0/generic-fibre-almost-complexes`, `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-dualizing-comparison`, `AdicSpacesPartII:R3`.

**Source:** Z Definition 2.5.1 and Warning 2.5.2, p. 22.

### Hartogs extension for the canonical sheaf

**Theorem** · `formal-hartogs` · Planet: Hartogs extension for canonical sheaves.

Suppose 𝔛 is separated admissible, has smooth pure-d generic fibre and geometrically reduced residue special fibre 𝔛̄=𝔛⊗k. Then ω_𝔛 is reflexive. For an open 𝔘 containing a dense open of 𝔛̄ and on which 𝔛 is smooth, ω_𝔛→Glue_𝔘(ω_𝔛) is an isomorphism. More generally, on an admissible formal model with reduced residue special fibre, every coherent reflexive F satisfies F≅Glue_𝔘(F) for every dense formal open 𝔘; this last assertion needs neither smooth generic fibre nor smoothness of 𝔘.

**Proof/construction.**

1. Reduce on formal affines to an algebraic model using the refined algebraization input G2.
2. Use reflexivity of the scheme canonical sheaf over a valuation ring with geometrically reduced special fibre; its extension beyond Noetherian bases is G1.
3. Recover sections from the generic and dense smooth open using the reflexive extension criterion, then complete and glue.

**Acceptance.** Reduced residue special fibre is an explicit hypothesis; smooth generic fibre alone does not establish this statement.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.1/hartogs-gluing`, `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-dualizing-complex`, `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-dualizing-comparison`, `SchemeAndStackFoundations:SF.2`, `AdicSpacesPartII:R2`.

**Source:** Z Lemmas 2.5.3–2.5.4 and Theorem 2.5.5, pp. 22–24.

### Traces between formal canonical sheaves

**Construction** · `formal-bottom-trace` · Planet: Formal canonical traces.

For proper f:𝔜→𝔛 between separated flat admissible pure-d models, the proper duality counits on all reductions give compatible bottom traces f_*ω_𝔜→ω_𝔛. Here f_* denotes underived direct image. These traces compose and agree with the scheme trace under algebraization/completion. This construction does not assert a general formal-scheme exceptional inverse image.

**Proof/construction.**

1. Apply H⁻ᵈ to Rf_n*ω•_{𝔜_n}→ω•_{𝔛_n}, using the lower amplitude bound.
2. Take the compatible inverse limit to obtain an honest map of bottom sheaves.
3. Use composition of counits at finite level for transitivity.

**Uses.** Z Lemma 2.7.5: transports canonical traces to the generic fibre; Z Lemma 3.6.4: is the lower horizontal map in the Faltings trace square.

**API.**

- `TauCeti.AdicDuality.formal_bottom_trace.finite_level` (compatibility): Reduction agrees with the bottom of the scheme trace for f_n, through the canonical bottom reduction maps.
- `TauCeti.AdicDuality.formal_bottom_trace.identity` (simp): The trace of id is id.
- `TauCeti.AdicDuality.formal_bottom_trace.composition` (functoriality): For proper g and f of this scope, Tr_{f∘g}=Tr_f∘f_*Tr_g.

**Unit tests.**

- `formal-bottom-trace.identity` (example): For the identity model, every finite-level and limiting trace is the identity.
- `formal-bottom-trace.disjoint_union` (example): For a disjoint union of r copies of 𝔛 mapping to 𝔛, the trace adds the r sections.
- `formal-bottom-trace.degree_p` (example): In dimension zero, for a finite étale degree-p generic map, the trace of the unit canonical section 1 is p; it is not normalized to 1.

**Acceptance.** A rig-isomorphism need not induce an isomorphism on the full underived direct images without additional hypotheses.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-dualizing-complex`, `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-dualizing-comparison`, `SchemeAndStackFoundations:key/coherent-duality`, `SchemeAndStackFoundations:SF.2`.

**Source:** Z Lemmas 2.6.1–2.6.2, pp. 24–25.

### Generic canonical sheaf and top differentials

**Comparison** · `canonical-generic-identification`.

Let K=C be algebraically closed. For a separated qcqs admissible O_K-model 𝔛 with smooth pure-d generic fibre X and geometrically reduced residue special fibre, there is a canonical s_𝔛:Ωᵈ_{X/K}≅(ω_𝔛)_K and an identification Ωᵈ_X[d]≅(ω•_𝔛)_K. The bottom identification is independent of algebraization and compatible with proper rig-isomorphisms between models with these hypotheses. The complex comparison is not asserted to be canonical.

**Additional hypotheses.** The construction in Z §2.7 uses an algebraically closed base field; only the preceding formal duality targets are asserted over general K.

**Proof/construction.**

1. Use refined local algebraization G2 for models with geometrically reduced residue special fibre.
2. Apply smooth algebraic duality after inverting p and compare completions.
3. Check independence using algebraization comparisons and the bottom trace for proper rig-isomorphisms. Reduced-model cofinality G2 supplies models in this class when constructing the rigid trace.

**Acceptance.** On the formal torus, s sends the wedge of dlog coordinates to the generic canonical generator.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.0/generic-fibre-almost-complexes`, `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-dualizing-comparison`, `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-bottom-trace`, `AdicSpacesPartII:R2/raynaud-theorem`, `AdicSpacesPartII:R2`.

**Source:** Z Theorem 2.7.1, Lemmas 2.7.3, 2.7.5 and Remark 2.7.4, pp. 25–27.

### Coherent traces on smooth rigid spaces

**Construction** · `rigid-coherent-trace` · Planet: Coherent rigid traces.

Over the algebraically closed field C, for a proper morphism f:Y→X of smooth separated qcqs rigid C-spaces, both pure of dimension d, define Tr_f:f_*Ωᵈ_Y→Ωᵈ_X by a proper map of admissible models and their bottom trace, transported by s. The map is independent of models, composes, and for finite étale f equals the coefficient trace under Ωᵈ_Y≅f^*Ωᵈ_X. Pullback in this last formula is the usual inverse image of differential bundles.

**Additional hypotheses.** The model-independent construction uses the algebraically closed setting of Z §2.7 and its reduced-model cofinality input G2.

**Proof/construction.**

1. Choose a formal representative after admissible blow-ups and take the generic fibre of its bottom trace.
2. Use cofinal common models and the trace comparison for rig-isomorphisms to show independence.
3. Algebraize finite étale maps on a dense smooth open and compare the multiplication trace; extend using coherent generic-fibre descent.

**Uses.** Z Corollary 3.4.9: compares Hodge–Tate maps with finite étale traces; Z §3.6: normalizes traces of Faltings pairings.

**API.**

- `TauCeti.AdicDuality.rigid_coherent_trace.model_independence` (characterisation): Any proper formal model gives the same trace.
- `TauCeti.AdicDuality.rigid_coherent_trace.composition` (functoriality): Tr_{f∘g}=Tr_f∘f_*Tr_g for proper maps of the same pure dimension.
- `TauCeti.AdicDuality.rigid_coherent_trace.finite_etale` (compatibility): For finite étale f, Tr_f(b·f^*α)=Tr_{O_Y/O_X}(b)·α.

**Unit tests.**

- `rigid-coherent-trace.identity` (example): For the identity on a smooth rigid C-space, the coherent trace is the identity on its top differential bundle.
- `rigid-coherent-trace.split_cover` (example): For r disjoint copies of X the trace is summation.
- `rigid-coherent-trace.power_torus` (example): On T↦Tʳ, Tr(dlog T)=dlog S and Tr(f^*dlog S)=r dlog S, since dlog S=r dlog T.

**Acceptance.** For a finite étale map of degree r, Tr_f(f^*α)=rα, including r divisible by p.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.1/canonical-generic-identification`, `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-bottom-trace`, `AdicSpacesPartII:R2/raynaud-theorem`, `AdicSpacesPartII:R2/formal-rigid-properness-comparison`, `AdicSpacesPartII:R3/analytic-trace-finite-locally-free`.

**Source:** Z Theorem/Definition 2.7.6 and Lemma 2.7.9, pp. 27–29.

**Closure checks for PD.1.** G1, G2, G3. Resolve the supplier contracts listed below and verify the tests above before changing this layer from planned to closed.

## PD.2. Integral Faltings traces

Define scalar-torsion-free nearby cohomology and the completed cotangent BMS maps. On smooth models normalize the inverse by Fontaine dlog; compare its rational generic fibre with the coordinate-character Hodge–Tate map. Define nice models and glue the honest integral top trace by Hartogs. Reduce it to the derived mod-p trace and prove pseudo-finite rig-étale trace compatibility.

**Layer inputs:** `AInfCohomology:AI.0:integral`, `AInfCohomology:AI.1`, `AInfCohomology:AI.4`, `AdicSpacesPartII:R2`, `AdicSpacesPartII:R3`, `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomologyPartII:PD.0`, `ClassicalAdicEtaleCohomologyPartII:PD.1`, `DerivedDeRhamCohomology:DD.0`, `PadicHodgeTheory:P8`.

### Torsion-free nearby cohomology

**Definition** · `torsion-free-nearby-cohomology`.

For n≥0 and any admissible formal O_C-model, define R̃ⁿν_*Ô⁺ as Rⁿν_*Ô⁺ modulo its p-power torsion, equivalently modulo its (ζ_p−1)-power torsion. It is an honest O_𝔛-module with no O_C-scalar torsion. Cup products descend, and cup of n degree-one classes factors through the exterior power, also for p=2.

**Proof/construction.**

1. Quotient by the union of kernels of scalar powers; p and ζ_p−1 generate cofinal power ideals.
2. Descend cup products using their scalar linearity.
3. Graded commutativity gives 2x²=0; for p=2 the quotient is 2-torsion-free, so x²=0.

**Uses.** Z Definition 3.2.5: provides an alternating cup product for Φⁿ; Z §3.3: makes multiplication by ζ_p−1 invertible onto its image.

**API.**

- `TauCeti.AdicDuality.torsion_free_nearby_cohomology.quotient` (constructor): There is a natural surjection Rⁿν_*Ô⁺→R̃ⁿν_*Ô⁺ killing exactly the power torsion.
- `TauCeti.AdicDuality.torsion_free_nearby_cohomology.wedge_cup` (structure): The product of n degree-one classes defines ∧ⁿR̃¹→R̃ⁿ.
- `TauCeti.AdicDuality.torsion_free_nearby_cohomology.generic` (compatibility): Inverting p identifies R̃ⁿ with Rⁿ and hence with Rⁿμ_*Ô_X.

**Unit tests.**

- `torsion-free-nearby-cohomology.bounded_torsion` (example): The quotient of O_C⊕O_C/p² is O_C, not O_C⊕pO_C/p².
- `torsion-free-nearby-cohomology.no_torsion` (example): A torsion-free module is unchanged.
- `torsion-free-nearby-cohomology.two` (example): When p=2, every degree-one square in the torsion-free cup algebra vanishes; anticommutativity alone in the original module is insufficient.

**Acceptance.** The infinite-power torsion quotient cannot be replaced by the kernel of one scalar without a separate theorem.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.0/nearby-cycle-complexes`, `DerivedDeRhamCohomology:DD.0`, `AInfCohomology:AI.0:integral/fontaine-dlog`.

**Source:** Z Definition 3.2.1 and Lemma 3.2.2, p. 31.

### BMS maps on admissible models

**Construction** · `bms-maps-general-model` · Planet: BMS maps on formal models.

For every admissible formal O_C-model and n≥1, construct Φⁿ:Ω̂ⁿ_{𝔛/O_C}{−n}→R̃ⁿν_*Ô⁺. In degree one use the p-completed absolute cotangent map and H⁰(L̂_{O_𝔛/Z_p})=Ω̂¹, H⁰(Rν_*L̂_{Ô⁺/Z_p})=R¹ν_*Ô⁺{1}; then quotient torsion. Higher Φⁿ are exterior cup powers. These maps are functorial under flat morphisms and commute with étale restriction.

**Proof/construction.**

1. Use cotangent transitivity O_C/Z_p and the perfectoid vanishing on the pro-étale basis.
2. Take degree zero, untwist and pass to the torsion quotient.
3. Take exterior powers and cup; obtain flat functoriality from the cotangent transformation and flat base change.

**Uses.** Z §3.3: gives the integral lattice that determines the smooth inverse trace; Z Theorem 3.4.12: compares integral cotangent normalization with the rational Hodge–Tate map.

**API.**

- `TauCeti.AdicDuality.bms_maps_general_model.degree_one` (characterisation): Φ¹ is induced by the completed cotangent comparison before quotienting torsion.
- `TauCeti.AdicDuality.bms_maps_general_model.cup` (structure): Φⁿ(α₁∧⋯∧α_n)=Φ¹(α₁)∪⋯∪Φ¹(α_n).
- `TauCeti.AdicDuality.bms_maps_general_model.flat_pullback` (functoriality): The Φ square commutes for flat maps; for étale maps the vertical comparison maps are isomorphisms.

**Unit tests.**

- `bms-maps-general-model.point` (example): Positive-degree Φ on Spf O_C has zero differential source.
- `bms-maps-general-model.smooth_image` (compatibility): For a smooth model, im Φⁿ=(ζ_p−1)ⁿR̃ⁿ; Φ need not be surjective before inverting this scalar.
- `bms-maps-general-model.torus_coordinates` (example): On the formal torus Φ¹(dlog T) is the cotangent dlog cocycle with the Breuil–Kisin twist, not an arbitrarily chosen Tate generator.

**Acceptance.** The input twist is the Breuil–Kisin twist {−n}, not the Tate twist (−n).

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.2/torsion-free-nearby-cohomology`, `AInfCohomology:AI.0:integral/completed-cotangent-twist`, `DerivedDeRhamCohomology:DD.0`.

**Source:** Z Lemmas 3.2.3–3.2.4, Definition 3.2.5, Remarks 3.2.6–3.2.8, pp. 31–33.

### Smooth integral Hodge–Tate inverse

**Construction** · `smooth-faltings-inverse`.

For a smooth pure-d formal model, Rⁿν_*Ô⁺/Rⁿν_*Ô⁺[ζ_p−1]=R̃ⁿ is finite locally free, and Φⁿ identifies Ω̂ⁿ{−n} with (ζ_p−1)ⁿR̃ⁿ. Divide onto this image and use the dual Fontaine dlog map to obtain the canonical Ψ′ⁿ:R̃ⁿ→Ω̂ⁿ(−n). In degree d, compose the quotient and Ω̂ᵈ≅ω to get Ψᵈ:Rᵈν_*Ô⁺→ω(−d). Here n≥1; set Φ⁰=Ψ′⁰=id on the unit sheaf, which defines the dimension-zero trace.

**Proof/construction.**

1. Apply BMS Hodge–Tate comparison after Lη_{ζ_p−1}; use its cohomology formula to identify the single-scalar and power-torsion quotients.
2. Check the image of Φ¹ using the cotangent truncation and obtain all degrees by the multiplicative comparison.
3. Combine Φ inverse on its scalar image with dlog-dual on twists. Independence of a root-of-unity trivialization follows from the intrinsic dlog map.

**Uses.** Z Theorem 3.5.2: is the smooth-open map glued into the integral trace.

**API.**

- `TauCeti.AdicDuality.smooth_faltings_inverse.image` (characterisation): Φⁿ is injective with image (ζ_p−1)ⁿR̃ⁿ.
- `TauCeti.AdicDuality.smooth_faltings_inverse.inverse_normalization` (compatibility): Put a=ζ_p−1 and let ι_n=id⊗(dlog∨)⊗n. For x∈R̃ⁿ, aⁿΨ′ⁿ(x)=ι_n((Φⁿ)⁻¹(aⁿx)); torsion-freeness determines Ψ′ⁿ uniquely. This uses a, rather than 1−ζ_p, in both occurrences.
- `TauCeti.AdicDuality.smooth_faltings_inverse.etale` (functoriality): Ψᵈ commutes with étale pullback and the canonical identification of ω.

**Unit tests.**

- `smooth-faltings-inverse.dimension_zero` (example): On Spf O_C, Ψ⁰ is the identity on O_C.
- `smooth-faltings-inverse.one_coordinate` (compatibility): On the formal one-torus, after inversion Ψ′¹ takes the coordinate-character class to dlog T in the dual Tate line.
- `smooth-faltings-inverse.rank` (example): For a smooth d-model the rank of R̃ⁿ is binomial(d,n), hence it vanishes for n>d.

**Acceptance.** Do not select an isomorphism O_C{1}≅O_C(1) without its dlog scaling factor.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.2/bms-maps-general-model`, `AInfCohomology:AI.4/hodge-tate`, `AInfCohomology:AI.4/hodge-tate-cotangent`, `AInfCohomology:AI.1/decalage-cohomology`, `AInfCohomology:AI.0:integral/fontaine-dlog`, `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-dualizing-complex`.

**Source:** Z Lemmas 3.3.1–3.3.2, Theorem/Definition 3.3.4 and Definition 3.3.5, pp. 33–37.

### Rational Hodge–Tate normalization and traces

**Comparison** · `generic-hodge-tate-trace-comparison`.

For a nice model, the generic fibre of Φⁿ is Scholze’s canonical Ωⁿ_X(−n)≅Rⁿμ_*Ô_X, after applying the Fontaine dlog change of twists. In torus coordinates dlog T_i corresponds to the i-th coordinate character of Γ=Z_p(1)ᵈ. Consequently the generic Ψ is its inverse, and it commutes with finite étale traces on top differentials and pro-étale cohomology.

**Proof/construction.**

1. Use the existing rational Hodge–Tate comparison of P8; verify its coordinate normalization on G_m and products by the Kummer character.
2. Compare the BMS cotangent cocycle with Fontaine dlog in the one-coordinate case, then exterior powers.
3. Reduce to a dense smooth open with finite étale toric coordinates and extend equality of vector-bundle maps on the connected smooth generic fibre.
4. Correct Z equation (3.7) as recorded in E21: after inversion use Ψ′=j∘Φ⁻¹=Sch⁻¹, with no additional scalar on the source. This agrees with the smooth integral inverse, whose defining square uses inclusion of the image lattice.
5. For finite étale f, compare multiplication trace with the pro-étale counit, using the algebra trace calculation.

**Acceptance.** Coordinate tori suffice for normalization; no splitting of the entire Hodge–Tate complex is asserted. On the one-dimensional torus, Ψ′ sends the normalized coordinate character back to dlog T with its Tate twist; a residual factor (1−ζ_p)⁻¹ would fail this normalization.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.0/generic-fibre-almost-complexes`, `ClassicalAdicEtaleCohomologyPartII:PD.2/bms-maps-general-model`, `ClassicalAdicEtaleCohomologyPartII:PD.2/smooth-faltings-inverse`, `ClassicalAdicEtaleCohomologyPartII:PD.1/rigid-coherent-trace`, `PadicHodgeTheory:P8`, `AdicSpacesPartII:R3`, `ClassicalAdicEtaleCohomologyPartII:PD.2/nice-formal-model`.

**Source:** Z Lemmas 3.4.5, 3.4.7–3.4.8, Corollary 3.4.9, Theorem 3.4.12, Definitions 3.4.13–3.4.14 and Remark 3.4.15, pp. 38–44; equation (3.7) corrected by E21.

### Nice formal models

**Definition** · `nice-formal-model` · Planet: Nice formal models.

A nice model of dimension d is a qcqs separated admissible formal O_C-scheme whose generic fibre is smooth of pure dimension d and whose residue special fibre modulo 𝔪_C is reduced. Its reduction modulo p need not be reduced. A separated qcqs smooth model of pure dimension d is nice; the local theory is extended to non-quasi-compact spaces by restriction to the qcqs opens to which the statements apply.

**Proof/construction.**

1. Conjoin the three geometric conditions with the ambient qcqs convention for this packet.
2. Use perfection of the residue field to pass between reduced and geometrically reduced residue fibres in this O_C setting.

**Uses.** Z Theorems 3.5.2 and 4.1.2: supplies exactly the hypotheses for gluing and local duality.

**API.**

- `TauCeti.AdicDuality.nice_formal_model.etale` (structure): An étale formal scheme over a nice pure-d model is nice when separated and qcqs.
- `TauCeti.AdicDuality.nice_formal_model.smooth_locus` (projection): The formal smooth locus contains a dense open in the residue special fibre.
- `TauCeti.AdicDuality.nice_formal_model.generic` (projection): The generic fibre is a separated qcqs smooth pure-d rigid space.

**Unit tests.**

- `nice-formal-model.smooth` (example): Spf O_C⟨T₁,…,T_d⟩ is nice.
- `nice-formal-model.node` (example): Spf O_C⟨u,v⟩/(uv−ϖ), 0≠ϖ∈𝔪_C, is nice of dimension one but is not a smooth formal model.
- `nice-formal-model.ramified_lattice` (non-example): Spf O_C⟨t⟩/(t²−ϖ) for nonzero ϖ∈𝔪_C and p≠2 has smooth zero-dimensional generic fibre but nonreduced residue fibre, so is not nice.

**Acceptance.** Niceness is stable under étale restriction; it is not a chosen smooth formal model.

**Direct prerequisites:** `AdicSpacesPartII:R2/admissible-formal-scheme`, `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-hartogs`.

**Source:** Z Definition 3.5.1, p. 44; conventions §1.4, pp. 7–10.

### Integral and mod-p Faltings traces

**Construction** · `faltings-traces` · Planet: Faltings traces.

For a nice d-model, there is a unique honest integral map Tr_F^{d,+}:Rᵈν_*Ô⁺→ω_𝔛(−d) agreeing with Ψᵈ on the formal smooth locus and with the generic inverse Hodge–Tate map. Truncate the almost integral complex to obtain A_𝔛→ω_𝔛ᵃ(−d)[−d]. Derived reduction modulo p and the canonical bottom inclusion give Tr_F:K_𝔛→ω•_{𝔛₀}ᵃ(−d)[−2d].

**Proof/construction.**

1. Use the Hartogs kernel to glue the two maps into the canonical sheaf.
2. Use almost amplitude ≤d to project A_𝔛 to Hᵈ(A_𝔛)[−d], then apply the honest map after almostification.
3. Reduce derivedly and compose ω_𝔛/p[−d]→ω•_{𝔛₀}[−2d], obtained from the bottom-cohomology map; this gives the mod-p trace.

**Uses.** Z Definition 4.1.1: defines the local cup trace pairing; Z Definition 5.2.1: defines the global almost trace.

**API.**

- `TauCeti.AdicDuality.faltings_traces.integral_unique` (universal-property): The smooth-open and generic restrictions uniquely characterize Tr_F^{d,+}.
- `TauCeti.AdicDuality.faltings_traces.reduction` (compatibility): Tr_F is derived reduction of the almost integral trace followed by the bottom inclusion.
- `TauCeti.AdicDuality.faltings_traces.generic` (compatibility): The generic integral trace is the inverse of Scholze’s top Hodge–Tate map through s_𝔛.

**Unit tests.**

- `faltings-traces.point` (example): For Spf O_C all three traces are the identity in degree zero.
- `faltings-traces.smooth_shift` (example): For a smooth curve model the mod-p trace has target Ω¹ᵃ(−1)[−1], not Ω¹ᵃ(−1)[1].
- `faltings-traces.singular_target` (non-example): For a singular special fibre retain ω•_{𝔛₀}; replacing it by ω_𝔛/p without its bottom inclusion and shifts changes the pairing.

**Acceptance.** For a smooth model ω•_{𝔛₀}=Ωᵈ[d], so the target becomes Ωᵈᵃ(−d)[−d]. The [−2d] is essential in the singular presentation.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.2/nice-formal-model`, `ClassicalAdicEtaleCohomologyPartII:PD.2/smooth-faltings-inverse`, `ClassicalAdicEtaleCohomologyPartII:PD.2/generic-hodge-tate-trace-comparison`, `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-hartogs`, `ClassicalAdicEtaleCohomologyPartII:PD.0/nearby-cycle-complexes`, `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-dualizing-complex`.

**Source:** Z Theorem 3.5.2, Definitions 3.5.3, 3.5.5 and Lemma 3.5.4, pp. 44–45.

### Pseudo-finite formal morphisms

**Definition** · `pseudo-finite-morphism`.

A proper morphism f:𝔜→𝔛 between nice d-models is pseudo-finite if f_C is finite and R f_* A_𝔜 has almost cohomology only in [0,d]. The amplitude condition is part of the definition, not a consequence of generic finiteness. Finite morphisms and proper rig-isomorphisms are examples.

**Proof/construction.**

1. Impose generic finiteness and the derived integral amplitude condition.
2. For a finite map use exactness of the formal finite pushforward on the relevant quasi-coherent almost sheaves; for a rig-isomorphism identify the pro-étale generic sites.

**Uses.** Z Lemma 3.6.4: gives the truncation bound needed to compare integral traces.

**API.**

- `TauCeti.AdicDuality.pseudo_finite_morphism.generic_finite` (projection): f_C is finite, with its finite étale counit when further rig-étale.
- `TauCeti.AdicDuality.pseudo_finite_morphism.amplitude` (projection): R f_*A_𝔜 is almost bounded above by d.
- `TauCeti.AdicDuality.pseudo_finite_morphism.examples` (characterisation): Proper rig-isomorphisms and finite formal maps satisfy the pseudo-finite condition.

**Unit tests.**

- `pseudo-finite-morphism.identity` (example): Every identity of a nice model is pseudo-finite.
- `pseudo-finite-morphism.blowup` (example): A proper admissible blow-up between nice models is pseudo-finite although its special-fibre map need not be finite.
- `pseudo-finite-morphism.positive_fibres` (non-example): A proper map whose generic fibre has a positive-dimensional fibre cannot be pseudo-finite, even if its pushforward happens to have the stated amplitude.

**Acceptance.** There is no assumed finite flatness of f on integral models.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.0/nearby-cycle-complexes`, `ClassicalAdicEtaleCohomologyPartII:PD.2/nice-formal-model`, `AdicSpacesPartII:R2/formal-rigid-properness-comparison`.

**Source:** Z Definition 3.6.1 and Example 3.6.2, p. 46.

### Finite pro-étale traces and model pushforwards

**Construction** · `finite-proetale-traces`.

For finite étale f:Y→X, the exact pro-étale pushforward has its counit Tr:f_*Ô_Y⁺→Ô_X⁺, defined by summation on a splitting cover. It extends to Ô and O⁺/pⁿ, and to R f₀_*K_𝔜→K_𝔛 for formal representatives. Its generic fibre agrees with the rational trace. On a perfectoid section this is the finite algebra trace, with no division by the degree.

**Proof/construction.**

1. Use the existing finite étale counit, then take the inverse limit over pⁿ before inverting p.
2. Push forward through the specialization diagram to define model traces.
3. Check locally on a split perfectoid cover; identify summation with the algebra trace and descend.

**Uses.** Z Lemma 3.6.4: is the upper trace in the compatibility square; Z §4.4: defines trace and restriction maps for good-quotient descent.

**API.**

- `TauCeti.AdicDuality.finite_proetale_traces.split` (characterisation): On a split r-cover, the trace is the sum of r components.
- `TauCeti.AdicDuality.finite_proetale_traces.coefficients` (compatibility): Tr commutes with derived reduction and inversion of p.
- `TauCeti.AdicDuality.finite_proetale_traces.projection` (compatibility): Tr(b·f^*a)=Tr(b)·a and Tr∘restriction is multiplication by degree.

**Unit tests.**

- `finite-proetale-traces.degree_p` (example): Modulo p a split cover of degree p has Tr(1)=0; its summation trace is still nonzero.
- `finite-proetale-traces.identity` (example): The degree-one trace is the identity.
- `finite-proetale-traces.composition` (compatibility): For split covers of degrees r and s, iterated summation equals the trace of the rs-cover.

**Acceptance.** All mod-p and mod-pⁿ coefficient labels stay consistent through the construction.

**Direct prerequisites:** `ClassicalAdicEtaleCohomology:H0`, `AdicSpacesPartII:R3/analytic-trace-finite-locally-free`, `ClassicalAdicEtaleCohomologyPartII:PD.0/nearby-cycle-complexes`, `ClassicalAdicEtaleCohomologyPartII:PD.0/generic-fibre-almost-complexes`.

**Source:** Z Appendix D, Definitions D.3, D.5–D.9, Lemmas D.4, D.11–D.13, pp. 96–99.

### Trace compatibility and étale locality

**Theorem** · `faltings-trace-compatibility` · Planet: Faltings trace compatibility.

For a rig-étale pseudo-finite f:𝔜→𝔛 between nice d-models, Tr_F,𝔛∘Tr_f=Tr_{f₀,ω}∘R f₀_*Tr_F,𝔜, as maps to ω•_{𝔛₀}ᵃ(−d)[−2d], with the analogous integral top-degree square. For the associated pairings, tracing the first argument and restricting the second agrees with tracing the product. Faltings traces also commute with étale base change on models.

**Proof/construction.**

1. Use Hartogs to compare the honest top-degree maps on the generic fibre and dense smooth opens; reduce to the finite étale algebra trace there.
2. Use the pseudo-finite amplitude to pass through truncation, then reduce modulo p and compare bottom inclusions.
3. Apply the trace projection formula to get the pairing square; for étale locality use étale pullback of canonical sheaves and nearby cycles.

**Acceptance.** The argument uses flatness of ω from Z Corollary 2.4.5, not a scheme-only flatness citation applied to a formal model.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.2/pseudo-finite-morphism`, `ClassicalAdicEtaleCohomologyPartII:PD.2/finite-proetale-traces`, `ClassicalAdicEtaleCohomologyPartII:PD.2/faltings-traces`, `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-bottom-trace`, `ClassicalAdicEtaleCohomologyPartII:PD.2/generic-hodge-tate-trace-comparison`.

**Source:** Z Lemmas 3.6.4, 3.6.6 and Corollary 3.6.5, pp. 46–48.

**Closure checks for PD.2.** G1, G2, G3. Resolve the supplier contracts listed below and verify the tests above before changing this layer from planned to closed.

## PD.3. Polystable local duality

Define standard polystable models and their p-power root towers, with product-one Galois group. Use normalized character lines with their genuine parameter factors. Compute continuous cohomology by Koszul complexes and prove the honest décalage comparison. Construct normalized root projections, prove derived root-algebra self-duality, orient the group trace and deduce the almost local perfect pairing.

**Layer inputs:** `AInfCohomology:AI.0:integral`, `AInfCohomology:AI.1`, `AInfCohomology:AI.3`, `AdicSpacesPartII:R2`, `ClassicalAdicEtaleCohomologyPartII:PD.0`, `ClassicalAdicEtaleCohomologyPartII:PD.1`, `ClassicalAdicEtaleCohomologyPartII:PD.2`, `DerivedDeRhamCohomology:DD.0`, `PerfectoidSpaces:P3`.

### Polystable formal models

**Definition** · `polystable-model` · Planet: Polystable models.

For blocks i=1,…,l with n_i≥0 and 0≠ϖ_i∈O_C, a standard polystable algebra is R⁺=O_C⟨t_{i,j}:0≤j≤n_i⟩/(∏_j t_{i,j}−ϖ_i for every i). Its relative dimension is d=Σ_i n_i. A polystable formal scheme admits an étale cover with étale maps to such models. Unit ϖ_i are allowed; zero ϖ_i are excluded. A separated qcqs polystable model of pure dimension d is nice; on such a model ω is invertible with ω•≅ω[d].

**Proof/construction.**

1. Use the monomial relations to prove O_C-flatness and topological finite presentation.
2. The nonzero parameters give smooth generic fibres; reduction gives a product of normal-crossing monomial hypersurfaces.
3. Apply complete-intersection duality on algebraic charts and formal étale comparison to get the invertible bottom sheaf.

**Uses.** Z §§4.2–4.3: provides the charts on which the integral pairing can be computed.

**API.**

- `TauCeti.AdicDuality.polystable_model.dimension` (projection): The dimension of the chart is Σ n_i, unchanged under étale maps.
- `TauCeti.AdicDuality.polystable_model.canonical_line` (structure): For a separated pure-d polystable model, ω is an invertible sheaf and ω•=ω[d].
- `TauCeti.AdicDuality.polystable_model.etale_local` (characterisation): Polystability is defined by the stated étale charts and is preserved under étale restriction.

**Unit tests.**

- `polystable-model.node` (example): O_C⟨u,v⟩/(uv−ϖ) with nonunit nonzero ϖ has d=1 and is polystable.
- `polystable-model.torus` (example): If all parameters are units, each block is a formal torus after eliminating one coordinate.
- `polystable-model.zero_parameter` (non-example): O_C⟨u,v⟩/(uv) is excluded: its generic fibre is singular, even though its residue fibre is reduced.

**Acceptance.** A polystable chart is a product of blocks, not just a single semistable equation.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.2/nice-formal-model`, `ClassicalAdicEtaleCohomologyPartII:PD.1/formal-dualizing-complex`, `AdicSpacesPartII:R2`.

**Source:** Z Definitions 4.2.1–4.2.2 and Lemmas 4.2.4–4.2.7, pp. 49–50.

### Polystable root towers

**Construction** · `polystable-root-tower` · Planet: Polystable perfectoid towers.

Choose compatible p-power roots of each nonzero ϖ_i. Let R_m⁺ be the same block algebra in t_{i,j}^{1/p^m} with block product ϖ_i^{1/p^m}, and R_∞⁺ the p-completed direct limit. The generic inverse limit is affinoid perfectoid and a pro-étale Γ-torsor over Spa(R⁺[1/p],R⁺), where Γ consists of the root-of-unity actions with product one in each block, hence Γ≅Z_p(1)ᵈ. Each finite stage is finite and finitely presented over R⁺ and O_C-flat; it need not be R⁺-flat.

**Proof/construction.**

1. Adjoin roots subject to the block-product conditions and form the completed colimit.
2. Verify Frobenius surjectivity modulo p and the integral perfectoid criterion on monomials.
3. Invert p to identify finite étale root covers and their inverse-limit torsor; use the product-one constraints to compute Γ.

**Uses.** Z Lemma 4.2.13: computes nearby cycles by Γ-cochains; Z Proposition 4.3.6: gives finite modules with a derived self-duality.

**API.**

- `TauCeti.AdicDuality.polystable_root_tower.finite_stage` (structure): R_m⁺ is finite finitely presented over R⁺ and O_C-flat.
- `TauCeti.AdicDuality.polystable_root_tower.action` (structure): (ε_{i,j}) acts on t_{i,j}^{1/p^m} by its m-th root, subject to ∏_jε_{i,j}=1.
- `TauCeti.AdicDuality.polystable_root_tower.perfectoid` (equivalence): Spa(R_∞⁺[1/p],R_∞⁺) is the perfectoid inverse limit of the generic finite étale stages.

**Unit tests.**

- `polystable-root-tower.dimension_zero` (example): With every n_i=0 the tower is constant and Γ is trivial.
- `polystable-root-tower.torus` (example): For the one-torus, the tower is the familiar tower adjoining all p-power roots of its coordinate.
- `polystable-root-tower.singular_integral` (non-example): For uv=ϖ with nonunit ϖ, the finite stages must not be certified finite locally free over the nodal base merely from their finite étale generic fibres.

**Acceptance.** Keep O_C-flatness distinct from R⁺-flatness at finite level.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.3/polystable-model`, `AInfCohomology:AI.3`, `PerfectoidSpaces:P3`.

**Source:** Z §4.2.2, equations (4.2)–(4.5), Lemmas 4.2.8 and 4.2.11, pp. 50–52.

### Character summands of polystable towers

**Construction** · `character-decomposition` · Planet: Polystable character decomposition.

Let T be the block-product-one torus and L=X*(T)=⊕_i(Z^{n_i+1}/Z·(1,…,1)). Every χ∈L[1/p] has a unique representative with nonnegative rational exponents and minimum zero in each block. Let V_χ be the O_C-line generated by that monomial. Then R_m⁺ is the p-completed sum of V_χ for χ∈p⁻ᵐL. For χ̄∈L[1/p]/L define R⁺_{χ̄} as the completed sum over χ+L. This yields a finite direct sum at level m and a completed direct sum at infinity. Multiplication V_χV_ψ⊂V_{χ+ψ} has a parameter factor and is not generally an isomorphism.

**Proof/construction.**

1. Normalize exponents by subtracting the minimum separately in each block.
2. Prove uniqueness of the resulting monomial expansion in the completed algebra.
3. Regroup by integral-character cosets; the Γ action is scalar on each coset. Retain the scalar factor created when a product requires a new normalization.

**Uses.** Z Corollaries 4.2.25–4.2.26: separates trivial and torsion character cohomology; Z Definition 4.3.3: defines the root-stage trace by projection to the trivial coset.

**API.**

- `TauCeti.AdicDuality.character_decomposition.normalized_monomial` (characterisation): Every weight has exactly one blockwise minimum-zero representative.
- `TauCeti.AdicDuality.character_decomposition.coset_summand` (projection): R⁺_{χ̄} depends only on χ̄ and Γ acts by that character.
- `TauCeti.AdicDuality.character_decomposition.product` (structure): If a,b are normalized lifts, their product is ∏_iϖ_i^{min_j(a_{i,j}+b_{i,j})} times the normalized monomial of χ+ψ, using the chosen roots for rational exponents.

**Unit tests.**

- `character-decomposition.node_product` (example): For uv=ϖ, V_[u]V_[v]=ϖ·V_0; for nonunit ϖ this is a proper submodule of V_0.
- `character-decomposition.trivial_coset` (example): The integral-character coset summand is R⁺ itself, not just the constant line O_C.
- `character-decomposition.unit_case` (compatibility): For unit parameters the multiplication factors are units and the weight-line multiplication maps are isomorphisms.

**Acceptance.** The two false strong-grading assertions in Z are corrected by E13; no later argument uses them.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.3/polystable-root-tower`, `AInfCohomology:AI.1`.

**Source:** Z Remark 4.2.14, Lemma 4.2.15 (corrected), Definitions 4.2.17 and Lemma 4.2.19, pp. 53–55.

### Character cohomology and nearby-cycle comparison

**Theorem** · `polystable-continuous-cohomology`.

For a standard polystable chart, sheafified continuous cochains C_cont(Γ,R_∞⁺)→Rν_*Ô⁺ are an almost isomorphism. Choose a basis of Γ. Koszul cochains compute the completed character summands: the trivial character has exterior cohomology of ranks binomial(d,i); every nontrivial finite-level character cohomology is annihilated by ζ_p−1, and is almost finitely presented with no 𝔪_C-torsion. The annihilator estimates improve with growing p-power denominators, giving the small tails used in completed sums.

**Proof/construction.**

1. Apply almost purity and Cartan–Leray on the generic perfectoid Γ-torsor, then sheafify over formal affines.
2. For a character of order pᵐ, one Koszul scalar generates the ideal (ζ_{pᵐ}−1); compute its exterior residual complex and annihilator.
3. Use uniform torsion bounds and completed-sum cohomology. Distinguish annihilation by ζ_p−1 from almost-zero annihilation by all of 𝔪_C.

**Acceptance.** For a nontrivial character, H⁰ vanishes because the summand is O_C-torsion-free; positive cohomology may be nonzero torsion.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.3/character-decomposition`, `ClassicalAdicEtaleCohomologyPartII:PD.3/polystable-root-tower`, `AInfCohomology:AI.1/continuous-cochains-koszul`, `AInfCohomology:AI.1/completed-sum-cohomology`, `PerfectoidSpaces:P3`, `ClassicalAdicEtaleCohomologyPartII:PD.0/nearby-cycle-complexes`.

**Source:** Z Lemma 4.2.13, Lemma 4.2.23 and Corollaries 4.2.25–4.2.26, pp. 52–53, 55–57.

### Integral décalage and the polystable top map

**Theorem** · `integral-decalage-polystable` · Planet: Polystable Faltings isomorphism.

For a polystable chart, applying Lη_{1−ζ_p} to the almost continuous-cochain comparison gives an honest isomorphism. Rⁱν_*Ô⁺ modulo its (1−ζ_p)-torsion is locally free of rank binomial(d,i). The top integral Faltings map induces an isomorphism Rᵈν_*Ô⁺/[1−ζ_p]≅ω_𝔛(−d), where brackets mean the torsion submodule, not the principal-ideal quotient.

**Proof/construction.**

1. Prove the special décalage criterion using the cone’s almost-zero cohomology and absence of 𝔪_C-torsion in the relevant derived reductions. An arbitrary almost isomorphism does not become an isomorphism under Lη.
2. Use the character computations to verify that criterion, then compute Lη cohomology by the imported formula.
3. On the top trivial-character line identify the trace on the generic fibre and use the torsion-free line to conclude.

**Acceptance.** The quotient removes scalar torsion; reducing a locally free module modulo 1−ζ_p would give a different, torsion module.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.3/polystable-continuous-cohomology`, `AInfCohomology:AI.1/derived-decalage`, `AInfCohomology:AI.1/decalage-cohomology`, `AInfCohomology:AI.1/decalage-products`, `ClassicalAdicEtaleCohomologyPartII:PD.2/faltings-traces`, `ClassicalAdicEtaleCohomologyPartII:PD.3/polystable-model`.

**Source:** Z Lemma 4.2.27 and Corollaries 4.2.28–4.2.29, Theorem 4.2.30, pp. 57–59.

### Root-stage projection traces

**Construction** · `root-stage-trace`.

For a standard polystable chart, define tr_m⁺:R_m⁺→R⁺ by projection onto the integral-character coset summand in the finite decomposition. In characteristic p the analogous map tr_m:A_m→A for A=F_p[t₀,…,t_n]/(t₀⋯t_n) is the monomial projection onto the base-ring summand in the pᵐ-root algebra A_m. These are module maps normalized by tr_m(1)=1; they are not the ordinary algebra trace of a degree-divisible-by-p extension.

**Proof/construction.**

1. Define the characteristic-p monomial projection, retaining exactly the weights integral in L.
2. Use the direct-sum coset projection for the integral tower.
3. Verify compatibility with products by elements of the base ring and with finite-level inclusions.

**Uses.** Z Theorem 4.3.2 and Proposition 4.3.6: normalizes the derived multiplication pairing on root algebras.

**API.**

- `TauCeti.AdicDuality.root_stage_trace.trivial_coset` (characterisation): tr_m is the identity on R⁺ and zero on each other character coset.
- `TauCeti.AdicDuality.root_stage_trace.linear` (structure): tr_m(a·b)=a·tr_m(b) for a∈R⁺.
- `TauCeti.AdicDuality.root_stage_trace.transition` (compatibility): For m≤r the restriction of tr_r to R_m⁺ is tr_m.

**Unit tests.**

- `root-stage-trace.one` (example): tr_m(1)=1 even when m>0.
- `root-stage-trace.fractional_weight` (example): For a one-torus and m>0, tr_m(T^{1/pᵐ})=0.
- `root-stage-trace.integral_weight` (example): For the same torus, tr_m(T)=T; the trace selects integral weights, not only exponent zero.

**Acceptance.** For m=0 the map is identity.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.3/character-decomposition`, `DerivedDeRhamCohomology:DD.0`.

**Source:** Z Definitions 4.3.1 and 4.3.3, pp. 59–60.

### Derived duality of finite root algebras

**Theorem** · `root-algebra-derived-duality` · Planet: Root algebra duality.

For the characteristic-p monomial hypersurface A and every m≥0, multiplication followed by tr_m induces A_m≅RHom_A(A_m,A). For every standard polystable R⁺, the integral projection similarly gives R_m⁺≅RHom_{R⁺}(R_m⁺,R⁺); characterwise R⁺_χ≅RHom_{R⁺}(R⁺_{−χ},R⁺). These modules need not be projective or flat over the singular base.

**Proof/construction.**

1. In characteristic p, use the hypersurface resolution/duality and the explicit monomial projection to identify Hom and prove higher Ext vanishing; retain the singular relation in this computation.
2. For a single nonunit-parameter block choose π with |π|>|ϖ^{1/pᵐ}| and |π|>|p|; reduce to the characteristic-p hypersurface after derived reduction.
3. Use derived completeness, Hom base change and derived Nakayama to lift the isomorphism; for unit parameters use the free torus decomposition.
4. Combine blocks by the completed derived Künneth comparison, whose finite-presentation and O_C-flatness hypotheses hold for the root stages; extract opposite-character pairs.

**Acceptance.** For a nodal chart, duality must be formulated by derived Hom; a declaration requiring all R⁺_χ to be free over R⁺ would reject the required example.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.3/root-stage-trace`, `ClassicalAdicEtaleCohomologyPartII:PD.3/polystable-root-tower`, `ClassicalAdicEtaleCohomologyPartII:PD.0/affine-almost-derived-calculus`, `DerivedDeRhamCohomology:DD.0`, `AInfCohomology:AI.1`.

**Source:** Z Theorem 4.3.2, Lemmas 4.3.4–4.3.5, Proposition 4.3.6 and Corollary 4.3.7, pp. 59–62.

### Oriented continuous-cochain traces

**Construction** · `oriented-group-trace`.

A basis of Γ≅Z_pᵈ identifies the top cohomology of its Koszul complex with its coefficient module. For trivial Γ action on R⁺, projection to Hᵈ defines tr_Γ:C_cont(Γ,R⁺)→R⁺[−d]. Compose C_cont(Γ,R_∞⁺)→C_cont(Γ,R⁺), induced by projection to the integral-character summand, with tr_Γ. A basis change multiplies this scalar trace by its determinant; restoring the Tate orientation line makes the geometric pairing intrinsic.

**Proof/construction.**

1. Use the Koszul top wedge for the ordered basis and the trivial action.
2. Project coefficients to the trivial coset and compose the trace in the derived category.
3. Track the top exterior line under basis change rather than declaring the scalar trace canonical.

**Uses.** Z Lemma 4.3.10 and Theorem 4.3.15: pairs Γ-cochains in complementary degrees; Z Theorem 4.3.16: compares the computed trace with Faltings’ trace.

**API.**

- `TauCeti.AdicDuality.oriented_group_trace.top` (characterisation): The induced map on Hᵈ for trivial coefficients is the top-wedge identification.
- `TauCeti.AdicDuality.oriented_group_trace.change_basis` (compatibility): Changing the oriented basis changes the scalar trace by the corresponding determinant unit, according to the chosen orientation identification.
- `TauCeti.AdicDuality.oriented_group_trace.cup` (structure): Cup, multiplication and this trace define the continuous-cochain pairing with target R⁺[−d].

**Unit tests.**

- `oriented-group-trace.rank_one` (example): For Γ=Z_p, trivial coefficients give the complex [R⁺→⁰R⁺] in degrees 0,1; trace projects to its degree-one term.
- `oriented-group-trace.rank_zero` (example): For Γ trivial the complex and its trace are R⁺ in degree zero.
- `oriented-group-trace.permutation` (example): Swapping two basis vectors reverses the top exterior orientation; the untwisted scalar trace changes by −1.

**Acceptance.** For d=0 the trace is the identity on the trivial coefficient ring.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.3/character-decomposition`, `ClassicalAdicEtaleCohomologyPartII:PD.3/root-stage-trace`, `AInfCohomology:AI.1/continuous-cochains-koszul`, `AInfCohomology:AI.0:integral/fontaine-dlog`.

**Source:** Z Definitions 4.3.9, 4.3.13 and Remark 4.3.14, pp. 62–63.

### Almost duality of polystable continuous cochains

**Theorem** · `continuous-local-duality`.

Let B=C_cont(Γ,R_∞⁺). The oriented cup trace pairing B⊗ᴸ_{R⁺}B→R⁺[−d] is perfect after almostification: Bᵃ≅RalHom_{R⁺ᵃ}(Bᵃ,R⁺ᵃ)[−d]. Before passing to all characters, the Koszul pairing for each opposite pair R⁺_χ,R⁺_{−χ} is a derived duality. The comparison of the completed character sum with its dual product is an almost isomorphism.

**Proof/construction.**

1. Use Koszul self-duality and opposite-character root-module duality for each finite character.
2. Show the internal Homs are derived p-complete before passing to the completed sum.
3. Estimate the cokernel of the sum-to-product map using the improving high-denominator annihilators; it is killed by every small ideal, hence almost zero.

**Acceptance.** Ordinary direct sums cannot simply be interchanged with dual products; the almost tail estimate is part of the proof.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.3/root-algebra-derived-duality`, `ClassicalAdicEtaleCohomologyPartII:PD.3/oriented-group-trace`, `ClassicalAdicEtaleCohomologyPartII:PD.3/polystable-continuous-cohomology`, `ClassicalAdicEtaleCohomologyPartII:PD.0/affine-almost-derived-calculus`, `AInfCohomology:AI.1/completed-sum-cohomology`.

**Source:** Z Lemmas 4.3.10–4.3.12 and Theorem 4.3.15, pp. 62–64.

### Local almost duality on polystable models

**Theorem** · `polystable-local-duality` · Planet: Polystable local duality.

For every separated qcqs polystable pure-d model, the cup Faltings trace induces A_𝔛≅RalHom(A_𝔛,ω_𝔛ᵃ(−d))[−d]. Reducing derivedly modulo p yields K_𝔛≅RalHom(K_𝔛,ω•_{𝔛₀}ᵃ(−d))[−2d]. These are perfect pairings in the sense of isomorphic adjoints; no finite-projective claim for K_𝔛 is made.

**Proof/construction.**

1. Compare the cochain trace and Faltings trace on the top torsion-free line; their generic normalizations agree, and the top Faltings isomorphism identifies the integral lattices.
2. Use the sheafified almost cochain comparison to transport the duality on charts.
3. Glue by étale locality and reduce using derived Hom base change and ω•_{𝔛₀}≅(ω_𝔛/p)[d] on polystable models.

**Acceptance.** For d=1 the integral target is ω(−1)[−1] and the mod-p target is ω•₀(−1)[−2].

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.3/continuous-local-duality`, `ClassicalAdicEtaleCohomologyPartII:PD.3/integral-decalage-polystable`, `ClassicalAdicEtaleCohomologyPartII:PD.2/faltings-traces`, `ClassicalAdicEtaleCohomologyPartII:PD.3/polystable-model`, `ClassicalAdicEtaleCohomologyPartII:PD.0/affine-almost-derived-calculus`.

**Source:** Z Theorem 4.3.16 and Corollary 4.3.17, pp. 64–66.

**Closure checks for PD.3.** G1, G2, G3. Resolve the supplier contracts listed below and verify the tests above before changing this layer from planned to closed.

## PD.4. Descent of local almost duality

Define the Faltings cup pairing relative to the shifted mod-p dualizing complex. Prove descent under proper rig-isomorphisms. Construct derived almost invariants and orbits retaining the finite group action, prove torsor Shapiro identifications, and descend duality along finite good quotients even when their order is divisible by p. Apply local altered uniformization G2 to all nice models.

**Layer inputs:** `AdicSpacesPartII:R2`, `ArithmeticGaloisDuality:D7`, `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomologyPartII:PD.0`, `ClassicalAdicEtaleCohomologyPartII:PD.2`, `ClassicalAdicEtaleCohomologyPartII:PD.3`, `EnhancedDerivedSheaves:E1`.

### Faltings pairings and adjoints

**Construction** · `faltings-pairing` · Planet: Faltings pairings.

For a nice d-model set D_𝔛=ω•_{𝔛₀}ᵃ(−d)[−2d]. Define β_𝔛:K_𝔛⊗ᴸK_𝔛→D_𝔛 as cup followed by Tr_F, and its adjoint 𝒟_𝔛:K_𝔛→RalHom(K_𝔛,D_𝔛). Say β is perfect when both tensor–Hom adjoints are isomorphisms. This means derived self-duality relative to D_𝔛; it does not assert that K_𝔛 is a perfect complex over O_𝔛₀.

**Proof/construction.**

1. Use the cup algebra structure of K and the mod-p trace.
2. Curry using derived tensor–Hom adjunction; graded commutativity relates the two adjoints.
3. Compare on degree-zero finite free modules with the existing LinearMap.IsPerfPair convention, without identifying general derived duality with finite projectivity.

**Uses.** Z §§4.3–4.4: is the property descended from polystable charts; Z Theorem 5.2.4: globalizes by proper coherent duality.

**API.**

- `TauCeti.AdicDuality.faltings_pairing.adjoint` (characterisation): The adjoint sends a to the functional b↦Tr_F(a∪b), with derived symmetry signs.
- `TauCeti.AdicDuality.faltings_pairing.perfect` (characterisation): Perfection is the isomorphism of both adjoints; by graded symmetry one suffices here.
- `TauCeti.AdicDuality.faltings_pairing.etale` (compatibility): The pairing and its adjoint restrict to the pairing on every étale model chart.

**Unit tests.**

- `faltings-pairing.point` (example): For Spf O_C, β is multiplication O_Cᵃ/p⊗ᴸO_Cᵃ/p→O_Cᵃ/p and is perfect over that coefficient ring.
- `faltings-pairing.shift` (example): For a smooth d-model, D_𝔛=Ω̂ᵈ_𝔛ᵃ/p(−d)[−d], so degrees i and d−i pair locally.
- `faltings-pairing.module_comparison` (compatibility): For finite free modules in degree zero over a field and target the field in degree zero, perfection is exactly Mathlib LinearMap.IsPerfPair.

**Acceptance.** Degree-zero ordinary pairings recover bijectivity of both maps to the module dual.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.2/faltings-traces`, `ClassicalAdicEtaleCohomologyPartII:PD.0/almost-proper-duality`, `EnhancedDerivedSheaves:E1`, `mathlib:LinearMap.IsPerfPair`.

**Source:** Z §1.4, p. 9 and Definition 4.1.1, pp. 48–49.

### Local duality descends along rig-isomorphisms

**Theorem** · `rig-isomorphism-descent`.

For a proper rig-isomorphism f:𝔜→𝔛 between nice d-models, perfection of β_𝔜 implies perfection of β_𝔛. The nearby-cycle comparison R f₀_*K_𝔜≅K_𝔛, trace compatibility and almost proper duality identify the pushed-forward adjoint with 𝒟_𝔛.

**Proof/construction.**

1. Identify generic fibres and their pro-étale complexes.
2. Push forward the local adjoint and use the almost internal-Hom proper-duality comparison.
3. Use the Faltings trace square to identify the resulting map with the target adjoint.

**Acceptance.** No averaging or special-fibre isomorphism is used for an admissible blow-up.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.4/faltings-pairing`, `ClassicalAdicEtaleCohomologyPartII:PD.2/faltings-trace-compatibility`, `ClassicalAdicEtaleCohomologyPartII:PD.0/almost-proper-duality`, `ClassicalAdicEtaleCohomologyPartII:PD.2/pseudo-finite-morphism`.

**Source:** Z Lemma 4.4.3, p. 67.

### Good formal quotients

**Definition** · `good-quotient` · Planet: Good quotients.

A good quotient is a finite quotient morphism f:𝔛′→𝔛=𝔛′/G between nice d-models, for a finite group G acting over O_C, with 𝔛′ having quasiprojective residue special fibre and f_C a finite étale G-torsor. The group order may be divisible by p. Quasiprojectivity of that fibre and the formal quotient theorem are the geometric existence hypotheses, supplied through G2; this node names the proof-specific class of quotient diagrams.

**Proof/construction.**

1. Use a finite formal quotient of the specified quasiprojective model, then require niceness and the generic torsor condition.
2. Equip the quotient with the given finite map; do not infer an integral étale torsor from the generic condition.

**Uses.** Z Lemmas 4.4.19 and 4.4.23: allows descent without inverting the group order.

**API.**

- `TauCeti.AdicDuality.good_quotient.finite` (projection): The formal morphism f is finite.
- `TauCeti.AdicDuality.good_quotient.torsor` (projection): The generic fibre is a finite étale G-torsor.
- `TauCeti.AdicDuality.good_quotient.quotient` (universal-property): The quotient map is universal for G-invariant formal maps, with the stated geometric existence hypotheses.

**Unit tests.**

- `good-quotient.trivial_group` (example): For G=1 a nice model with quasiprojective residue special fibre maps identically to itself.
- `good-quotient.split_torsor` (example): G×𝔛→𝔛 is a good quotient for any finite G and nice 𝔛 with quasiprojective residue special fibre, including |G|=p.
- `good-quotient.fixed_generic_point` (non-example): An action with a nontrivial generic stabilizer does not give a good quotient even if a finite formal quotient exists.

**Acceptance.** The special fibre may have fixed points and wild ramification.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.2/nice-formal-model`, `AdicSpacesPartII:R2`.

**Source:** Z Definition 4.4.2, p. 67.

### Almost homotopy invariants and orbits

**Construction** · `equivariant-almost-descent` · Planet: Almost homotopy invariants.

On a ringed O_C-site (T,O) with trivial action on the base, equivariant almost modules mean modules over Oᵃ[G], with O_C central even if G is nonabelian. For F∈D(O[G])ᵃ define F^{hG}=RalHom_{Oᵃ[G]}(Oᵃ,F) and F_{hG}=F⊗ᴸ_{Oᵃ[G]}Oᵃ, using the trivial action on Oᵃ. Use the usual inversion anti-involution to convert left and right actions where necessary. In geometric pushforwards the action is retained in the derived equivariant category, not only on cohomology.

**Proof/construction.**

1. Import ordinary representations, invariants and bar-derived group cohomology; extend the ringed-site almost quotient using the central O_C action.
2. Use K-injective/K-flat or finite-free bar resolutions to form derived invariants and orbits.
3. For an invariant geometric map, derive the equivariant pushforward before forgetting the action.

**Uses.** Z Lemmas 4.4.11 and 4.4.15: commutes pushforward and duality with group descent; Z Lemma 4.4.19: expresses generic torsor descent over a possibly wild special fibre.

**API.**

- `TauCeti.AdicDuality.equivariant_almost_descent.trivial_group` (simp): For G=1 both functors are naturally the identity.
- `TauCeti.AdicDuality.equivariant_almost_descent.bar` (characterisation): The standard bar resolution of the trivial O[G]-module computes both functors, with finite free terms for finite G.
- `TauCeti.AdicDuality.equivariant_almost_descent.degree_zero` (compatibility): H⁰ of derived invariants of a module agrees with ordinary invariants, and with Mathlib Representation.invariants in the ordinary module setting.

**Unit tests.**

- `equivariant-almost-descent.wild` (example): For C_p acting trivially on O_Cᵃ/p, H¹(C_p,O_Cᵃ/p)≅O_Cᵃ/p, so derived invariants have nonzero positive cohomology.
- `equivariant-almost-descent.regular` (example): For the regular induced module O[G]⊗_O M, homotopy invariants and orbits are each M with the usual Shapiro identifications.
- `equivariant-almost-descent.unit_order` (compatibility): If |G| is a unit in the coefficient ring, higher group cohomology vanishes and the norm divided by |G| gives the familiar averaging identification.

**Acceptance.** When p divides |G|, invariants and orbits are derived and cannot be replaced by a Reynolds operator.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.0/formal-almost-coherence`, `EnhancedDerivedSheaves:E1`, `ArithmeticGaloisDuality:D7`, `mathlib:Representation.invariants`.

**Source:** Z Definitions 4.4.4, 4.4.10, 4.4.12, 4.4.14 and Remarks 4.4.5–4.4.9, 4.4.13, pp. 67–69.

### Pushforward and duality for equivariant nearby cycles

**Theorem** · `equivariant-derived-calculus`.

For t:(X_ét,O_X⁺/p)→(𝔛₀,O_𝔛₀) and finite G acting trivially on the base site, R t_* commutes with homotopy invariants and homotopy orbits. For equivariant F and a nonequivariant target D, there is RalHom_O(F,D)^{hG}≅RalHom_O(F_{hG},D), with the contragredient action on Hom. No order-of-G invertibility is assumed.

**Proof/construction.**

1. Use coherence of the site map and its finite cohomological dimension to commute R t_* with sequential homotopy colimits, including unbounded bar complexes.
2. Use preservation of homotopy limits for invariants and finite-free bar terms for both comparisons.
3. Apply tensor–Hom adjunction to the bar resolution and almostify; central scalar flatness gives the almost comparison.

**Acceptance.** The orbit comparison needs the finite-cohomological-dimension input, not just the existence of a right derived pushforward.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.4/equivariant-almost-descent`, `ClassicalAdicEtaleCohomologyPartII:PD.0/nearby-cycle-complexes`, `EnhancedDerivedSheaves:E1`, `ClassicalAdicEtaleCohomology:H0`.

**Source:** Z Lemmas 4.4.11 and 4.4.15, pp. 68–69.

### Almost local duality descends along good quotients

**Theorem** · `good-quotient-descent` · Planet: Good quotient descent.

For a good quotient f:𝔛′→𝔛 put B=R f₀_*K_𝔛′ with its derived G-action. Restriction gives K_𝔛≅B^{hG}, while trace gives B_{hG}≅K_𝔛. If β_𝔛′ is perfect, then β_𝔛 is perfect. These two isomorphisms come from torsor Shapiro descent, not a norm isomorphism for arbitrary G-modules.

**Proof/construction.**

1. On a split generic torsor the coefficient pushforward is induced; apply Shapiro and commute t* with derived invariants/orbits to identify restriction and trace.
2. Use the cup trace square and truncation bounds to lift the comparison needed for the duality morphism into the equivariant category, as in Lemmas 4.4.21–4.4.22.
3. Apply almost proper duality and the Hom/invariants–orbits adjunction; substitute the two torsor isomorphisms to obtain 𝒟_𝔛. Do not assume a G-equivariant action on the entire pushed-forward dualizing complex.

**Acceptance.** For a split torsor with |G|=p, the trace and restriction descent still work despite Tr(1)=0.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.4/good-quotient`, `ClassicalAdicEtaleCohomologyPartII:PD.4/equivariant-derived-calculus`, `ClassicalAdicEtaleCohomologyPartII:PD.4/faltings-pairing`, `ClassicalAdicEtaleCohomologyPartII:PD.2/finite-proetale-traces`, `ClassicalAdicEtaleCohomologyPartII:PD.2/faltings-trace-compatibility`, `ClassicalAdicEtaleCohomologyPartII:PD.0/almost-proper-duality`.

**Source:** Z Constructions 4.4.16–4.4.18 and Lemmas 4.4.19, 4.4.21–4.4.23, pp. 70–74.

### Local almost Poincaré duality

**Theorem** · `local-almost-duality` · Planet: Local almost Poincaré duality.

For every nice admissible formal O_C-model of pure dimension d, the Faltings pairing β_𝔛 is perfect: K_𝔛≅RalHom_{O_𝔛₀ᵃ}(K_𝔛,ω•_{𝔛₀}ᵃ(−d))[−2d]. Niceness, including reduced residue special fibre, is retained from Theorem 4.1.2 in the final Theorem 4.4.24.

**Proof/construction.**

1. Use local altered uniformization G2: after a finite zigzag of Zariski covers and rig-isomorphisms, obtain finite good quotients 𝔛′_i/G_i=𝔛_i and rig-isomorphisms from polystable models to 𝔛′_i. Over algebraically closed C the finite field-extension part is unnecessary.
2. Apply polystable duality and descend through rig-isomorphisms and good quotients.
3. Reverse the zigzag, using étale/Zariski locality and rig-isomorphism descent; conclude on 𝔛. G2 remains an explicit proof-closure gap.

**Acceptance.** The theorem is not claimed for arbitrary smooth-generic models with nonreduced residue special fibre.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.4/faltings-pairing`, `ClassicalAdicEtaleCohomologyPartII:PD.3/polystable-local-duality`, `ClassicalAdicEtaleCohomologyPartII:PD.4/rig-isomorphism-descent`, `ClassicalAdicEtaleCohomologyPartII:PD.4/good-quotient-descent`, `AdicSpacesPartII:R2`, `ClassicalAdicEtaleCohomologyPartII:PD.2/faltings-trace-compatibility`.

**Source:** Z Theorem 4.4.1, Theorem 4.4.24 = Theorem 4.1.2, pp. 49, 66–67, 74–75.

**Closure checks for PD.4.** G1, G2, G3. Resolve the supplier contracts listed below and verify the tests above before changing this layer from planned to closed.

## PD.5. Global étale Poincaré duality

Construct the model-independent global almost trace, prove derived and degreewise almost duality, and detect finite F_p isomorphisms after almost scalar extension. Normalize the analytic top trace and deduce Galois-equivariant mod-p Poincaré duality, including finite local systems. Prove proper p-adic perfectness and pass to constant Z/pⁿ, Z_p and Q_p coefficients with the derived shift −2d and possible integral torsion.

**Layer inputs:** `AInfCohomology:AI.1`, `AdicSpacesPartII:R2`, `AdicSpacesPartIIPartII:RZ.5`, `ArithmeticGaloisDuality:D7`, `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H3`, `ClassicalAdicEtaleCohomologyPartII:PD.0`, `ClassicalAdicEtaleCohomologyPartII:PD.2`, `ClassicalAdicEtaleCohomologyPartII:PD.4`, `PadicHodgeTheory:P8`.

### Global almost trace

**Construction** · `global-almost-trace` · Planet: Global almost trace.

For X/C smooth proper pure of dimension d, choose a proper nice formal model 𝔛 and let q₀:𝔛₀→Spec O_C/p. Define Tr_X:RΓ(X,O_X^{+a}/p)→O_Cᵃ/p(−d)[−2d] by RΓ of Tr_F followed by the almost coherent proper-duality counit R q₀_*ω•_{𝔛₀}ᵃ→O_Cᵃ/p. The result is independent of the proper nice model.

**Proof/construction.**

1. Use G2’s reduced-model theorem and properness comparison to choose a proper nice model.
2. Compose the two counits with the corrected degree shift.
3. Compare any two choices on a common dominating nice model; use the rig-isomorphism trace square and transitivity of coherent proper traces.

**Uses.** Z Theorems 5.2.4–5.2.5: gives global almost derived and degreewise duality; Z Theorems 5.4.2–5.4.4: shows that top étale cohomology is one-dimensional and cup products are nondegenerate.

**API.**

- `TauCeti.AdicDuality.global_almost_trace.model_independent` (characterisation): Every proper nice model computes the same Tr_X.
- `TauCeti.AdicDuality.global_almost_trace.components` (compatibility): For finitely many disjoint proper pure-d components, Tr_X is the sum of the component traces.
- `TauCeti.AdicDuality.global_almost_trace.pairing` (structure): Cup followed by Tr_X gives a derived O_Cᵃ/p pairing of RΓ(X,O_X^{+a}/p) with itself into O_Cᵃ/p(−d)[−2d].

**Unit tests.**

- `global-almost-trace.point` (example): For X=Spa C the trace is the identity on O_Cᵃ/p.
- `global-almost-trace.two_points` (example): For two points it is (a,b)↦a+b, not the average.
- `global-almost-trace.top_degree` (example): For a proper smooth curve it induces H²(X,O_X^{+a}/p)→O_Cᵃ/p(−1); a target shift +2 cannot induce this map.

**Acceptance.** The target is shifted by −2d; Z Definition 5.2.1 has the opposite sign in one displayed target.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.4/local-almost-duality`, `ClassicalAdicEtaleCohomologyPartII:PD.0/almost-proper-duality`, `ClassicalAdicEtaleCohomologyPartII:PD.2/faltings-trace-compatibility`, `AdicSpacesPartII:R2/raynaud-theorem`, `AdicSpacesPartII:R2/formal-rigid-properness-comparison`, `AdicSpacesPartII:R2`.

**Source:** Z Definitions 5.2.1, 5.2.3 and Lemma 5.2.2, pp. 75–76.

### Global almost Poincaré duality

**Theorem** · `global-almost-duality` · Planet: Global almost Poincaré duality.

For smooth proper pure-d X/C let C_X=RΓ(X,O_X^{+a}/p). The global cup trace pairing induces C_X≅RalHom_{O_Cᵃ/p}(C_X,O_Cᵃ/p)(−d)[−2d]. For every i, Hⁱ(C_X) and H^{2d−i}(C_X) are almost finite free and their pairing into O_Cᵃ/p(−d) is almost perfect.

**Proof/construction.**

1. Push the local adjoint along q₀ and apply almost proper duality to identify the resulting Hom with the global dual.
2. Identify the map using the definition of the global trace and cup/evaluation.
3. For degreewise perfection first apply primitive comparison to obtain almost finite free cohomology; only then split or use the universal-coefficient comparison to extract the cohomological adjoints.

**Acceptance.** Degreewise perfection is justified by almost finite freeness, not by derived perfection alone over O_C/p.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.5/global-almost-trace`, `ClassicalAdicEtaleCohomologyPartII:PD.4/local-almost-duality`, `ClassicalAdicEtaleCohomologyPartII:PD.0/almost-proper-duality`, `PadicHodgeTheory:P8/early-primitive-comparison-and-finiteness`.

**Source:** Z Theorem 5.2.4 = Theorem 5.1.1 and Theorem 5.2.5, pp. 74, 76–77.

### Top étale trace and almost detection

**Theorem** · `almost-detection-and-top-trace`.

A map between finite-dimensional F_p-vector spaces is an isomorphism exactly when its scalar extension to O_Cᵃ/p is an almost isomorphism. If X/C is connected smooth proper pure-d, the analytic torsion trace t_X:H²ᵈ_ét(X,F_p(d))→F_p imported from H3 is an isomorphism. For disconnected X its trace is the sum over its finitely many components.

**Proof/construction.**

1. A nonzero finite F_p-vector space becomes a nonzero almost O_C/p-module: multiplication by a sufficiently small nonzero ε∈𝔪_C does not kill O_C/p. Apply this to kernel and cokernel.
2. Use H⁰(X,F_p)=F_p and global almost duality to prove dim H²ᵈ(X,F_p)=1.
3. Use the nonzero/surjective geometric-fibre normalization of the existing analytic trace to identify the one-dimensional top trace as an isomorphism. The geometric-fibre nonvanishing beyond H3’s supplied trace is request R3.
4. For disconnected X use the finite component decomposition and trace composition.

**Acceptance.** The Faltings trace need not be identified with the analytic trace by an equality of maps in this proof: one-dimensional top cohomology and a nonzero normalized analytic trace suffice.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.5/global-almost-duality`, `PadicHodgeTheory:P8/early-primitive-comparison-and-finiteness`, `ClassicalAdicEtaleCohomology:H3/general-analytic-smooth-trace`, `ClassicalAdicEtaleCohomology:H3/proper-torsion-cohomological-amplitude`, `ClassicalAdicEtaleCohomology:H3`.

**Source:** Z Theorem 5.4.2 and Lemma 5.4.3, pp. 78–79; Theorem 5.3.3, pp. 77–78.

### Mod-p Poincaré duality

**Theorem** · `mod-p-poincare-duality` · Planet: Mod-p Poincaré duality.

Let K be complete rank one of mixed characteristic (0,p), C its completed algebraic closure, and X/K smooth proper pure of dimension d. For every i≥0 the cup product and analytic trace give a perfect Gal(C/K)-equivariant pairing Hⁱ_ét(X_C,F_p)⊗H^{2d−i}_ét(X_C,F_p(d))→F_p. All groups outside [0,2d] vanish. The trace on the top twisted group is an isomorphism when X is geometrically connected.

**Proof/construction.**

1. Reduce to C and a connected component; use the top trace isomorphism.
2. Compare the cup adjoint to its almost scalar extension via primitive comparison and finite-dimensional Hom base change.
3. Use degreewise almost duality and almost detection to prove bijectivity.
4. Recover the Galois action from the canonical étale trace and functorial cup products; do not choose a Galois-trivialization of the Tate twist.

**Acceptance.** For P¹ the trace sends c₁(O(1)) to 1; in characteristic p the analogous p-torsion theorem is not asserted. The residue-characteristic equality ℓ=p is allowed because char K=0. In characteristic p and positive dimension the Artin–Schreier sequence instead forces H²ᵈ(X_C,F_p)=0; Z Remark 1.1.5 is a scope test, not an extension of this theorem.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.5/almost-detection-and-top-trace`, `ClassicalAdicEtaleCohomologyPartII:PD.5/global-almost-duality`, `PadicHodgeTheory:P8/early-primitive-comparison-and-finiteness`, `ClassicalAdicEtaleCohomology:H3/general-analytic-smooth-trace`, `mathlib:LinearMap.IsPerfPair`.

**Source:** Z Theorem 5.4.4 = Theorems 1.1.4, 5.1.2, pp. 3, 75, 79–80.

### Poincaré duality for finite mod-p local systems

**Theorem** · `local-system-duality` · Planet: Local system Poincaré duality.

Under the preceding hypotheses, for every finite-rank étale F_p-local system L on X, cup, evaluation L⊗L∨→F_p and t_X give perfect Galois-equivariant pairings Hⁱ(X_C,L)⊗H^{2d−i}(X_C,L∨(d))→F_p. Duals, twists and evaluation use the existing local-system operations.

**Proof/construction.**

1. Trivialize monodromy on a finite Galois étale cover and pass to its Sylow-p intermediate cover, of degree prime to p.
2. The remaining p-group representation over F_p has a filtration with trivial one-dimensional quotients: its finite underlying set has a nonzero invariant by the existing p-group fixed-point congruence; repeat on the quotient.
3. Apply the constant theorem and the five lemma along that filtration, with evaluation and connecting-map signs.
4. Use restriction and finite étale trace to split L off the pushed-forward pullback: their composite is the prime-to-p degree, a unit.
5. Reuse the existing finite-dimensional p-group fixed-vector theorem in current Tau Ceti, Representation.exists_common_fixed_vector_of_isPGroup (RepresentationTheory.Unipotent.PowerOrder); the pinned Mathlib fixed-point theorem also supplies the finite F_p case. This algebraic input is not a new target owned here.

**Acceptance.** The mod-p filtration argument includes p=2. A degree-p trace alone would not split the local system.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.5/mod-p-poincare-duality`, `PadicHodgeTheory:P8/early-primitive-comparison-and-finiteness`, `ClassicalAdicEtaleCohomology:H3/general-analytic-smooth-trace`, `ClassicalAdicEtaleCohomology:H0`, `mathlib:IsPGroup.exists_fixed_point_of_prime_dvd_card_of_fixed_point`, `mathlib:Representation.invariants`.

**Source:** Z Theorem 5.4.5 and proof, pp. 80–81.

### Perfect proper cohomology complexes

**Theorem** · `proper-p-adic-perfectness`.

For a proper rigid C-space of pure dimension d, not necessarily smooth, RΓ_ét(X,Z/pⁿ) is a perfect complex of Tor-amplitude [0,2d] for n≥1. RΓ_proét(X,Z_p)=Rlim_n RΓ_ét(X,Z/pⁿ) is perfect over Z_p with the same Tor-amplitude, and Hⁱ(X,Z_p)=lim_n Hⁱ(X,Z/pⁿ). Finite generation does not imply that these integral cohomology modules are torsion-free.

**Proof/construction.**

1. Use the general proper singular primitive comparison/finiteness contract G3 to obtain finite mod-p cohomology in [0,2d]. The existing smooth P8 node alone does not give this scope.
2. Use the proper all-torsion projection formula to identify derived reduction of the constant-coefficient complex with mod-p cohomology. Apply pseudo-coherent/derived Nakayama perfectness and its Tor-amplitude criterion.
3. Pass through the derived p-complete inverse system to Z_p, retaining the same amplitude.
4. Finite finite-level cohomology gives the Mittag–Leffler condition, so the Milnor lim¹ term vanishes.

**Acceptance.** A complex of projectives of amplitude [0,2d] can have torsion cohomology; the assertion does not give degreewise integral perfect pairings.

**Direct prerequisites:** `ClassicalAdicEtaleCohomology:H3/proper-torsion-cohomological-amplitude`, `ClassicalAdicEtaleCohomology:H3/proper-projection-formula-all-torsion`, `ClassicalAdicEtaleCohomologyPartII:PD.0/nearby-cycle-complexes`, `PadicHodgeTheory:P8`, `ArithmeticGaloisDuality:D7`, `AInfCohomology:AI.1`, `AdicSpacesPartIIPartII:RZ.5/rigid-resolution`.

**Source:** Z Lemma 5.5.1, p. 81; PS Theorem 3.17 and proof, pp. 19–20.

### Finite p-power derived Poincaré duality

**Theorem** · `finite-p-power-duality` · Planet: Finite coefficient derived duality.

For X/K smooth proper pure-d as above and Λ_n=Z/pⁿ, n≥1, the canonical analytic trace induces a perfect Galois-equivariant derived pairing RΓ_ét(X_C,Λ_n)⊗ᴸ_{Λ_n}RΓ_ét(X_C,Λ_n(d))→Λ_n[−2d]. Equivalently the adjoint is RΓ(X_C,Λ_n)≅RHom_{Λ_n}(RΓ(X_C,Λ_n(d)),Λ_n)[−2d].

**Proof/construction.**

1. Form the derived trace using amplitude ≤2d and the normalized top trace.
2. Use perfectness to commute duality with Λ_n→F_p base change; both cup and traces reduce compatibly.
3. The reduced adjoint is the mod-p isomorphism, so derived Nakayama proves the Λ_n adjoint is an isomorphism. Base change is over Λ_n, not an accidental tensor over Z_p.

**Acceptance.** For P¹ the two nonzero cohomology degrees are 0 and 2; a trace target Λ_n in degree zero cannot give this derived duality.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.5/proper-p-adic-perfectness`, `ClassicalAdicEtaleCohomologyPartII:PD.5/mod-p-poincare-duality`, `ClassicalAdicEtaleCohomology:H3/general-analytic-smooth-trace`, `ClassicalAdicEtaleCohomology:H3/proper-projection-formula-all-torsion`, `AInfCohomology:AI.1`.

**Source:** Z Theorem 5.5.2, pp. 81–82 (corrected degree shift and coefficient base change).

### Integral and rational p-adic traces

**Construction** · `p-adic-traces`.

For smooth proper pure-d X/K, compatible finite torsion traces define t_{X,Z_p}:H²ᵈ(X_C,Z_p(d))→Z_p by inverse limit, using the cohomology-limit identification. Define t_{X,Q_p}=t_{X,Z_p}[1/p]. Their derived trace maps have targets Z_p[−2d] and Q_p[−2d], respectively. Q_p cohomology here is pro-étale cohomology of Ẑ_p[1/p], and agrees with RΓ(X_C,Z_p)[1/p] for qcqs X.

**Proof/construction.**

1. Take inverse limits of the coefficient-compatible analytic top traces; use Mittag–Leffler to identify the source with the integral top group.
2. Construct the derived trace by the top truncation and the cohomological bound.
3. Invert p using coherence of the qcqs pro-étale topos and commutation with the relevant filtered colimit.

**Uses.** Z Theorems 5.5.4 and 5.5.6: defines the pairings at the final two coefficient levels.

**API.**

- `TauCeti.AdicDuality.p_adic_traces.reduction` (compatibility): The integral derived trace reduces to the finite coefficient trace after derived scalar extension.
- `TauCeti.AdicDuality.p_adic_traces.rationalization` (compatibility): The Q_p derived trace is obtained by inverting p in the Z_p trace.
- `TauCeti.AdicDuality.p_adic_traces.components` (functoriality): For a finite disjoint union of pure-d components, the trace is summation of component traces.

**Unit tests.**

- `p-adic-traces.point` (example): For Spa C the Z_p and Q_p traces are identities.
- `p-adic-traces.projective_line` (example): For P¹, t(c₁(O(1)))=1 for both coefficient rings.
- `p-adic-traces.no_torsion_free_claim` (non-example): Torsion in Hⁱ(X_C,Z_p) is permitted; passing to Q_p kills it, so the integral construction cannot be specified by choosing bases of all integral cohomology groups.

**Acceptance.** The construction keeps the continuous Galois action and the Tate line.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.5/proper-p-adic-perfectness`, `ClassicalAdicEtaleCohomologyPartII:PD.5/finite-p-power-duality`, `ClassicalAdicEtaleCohomology:H0`, `ArithmeticGaloisDuality:D7`.

**Source:** Z Definitions 5.5.3, 5.5.5 and the paragraph between Theorems 5.5.4 and 5.5.6, p. 82.

### Integral derived Poincaré duality

**Theorem** · `integral-derived-duality` · Planet: Integral Poincaré duality.

For smooth proper pure-d X/K, cup and t_{X,Z_p} induce a perfect Galois-equivariant pairing RΓ(X_C,Z_p)⊗ᴸ_{Z_p}RΓ(X_C,Z_p(d))→Z_p[−2d]. Both factors are perfect; the statement retains the integral derived dual and its possible Ext contributions.

**Proof/construction.**

1. Form the integral adjoint on perfect derived p-complete complexes.
2. Reduce modulo p and identify it with the mod-p adjoint through coefficient-compatible traces.
3. Apply derived p-complete Nakayama; the two-sided pairing follows by symmetry.

**Acceptance.** The result is not a degreewise perfect pairing into Z_p on arbitrary torsion cohomology modules.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.5/p-adic-traces`, `ClassicalAdicEtaleCohomologyPartII:PD.5/finite-p-power-duality`, `ClassicalAdicEtaleCohomologyPartII:PD.5/proper-p-adic-perfectness`, `AInfCohomology:AI.1`.

**Source:** Z Theorem 5.5.4, p. 82 (corrected shift).

### Rational p-adic Poincaré duality

**Theorem** · `rational-derived-duality`.

For smooth proper pure-d X/K, cup and t_{X,Q_p} give a perfect Galois-equivariant derived pairing RΓ(X_C,Q_p)⊗ᴸRΓ(X_C,Q_p(d))→Q_p[−2d]. Consequently every degreewise pairing Hⁱ(X_C,Q_p)⊗H^{2d−i}(X_C,Q_p(d))→Q_p is perfect.

**Proof/construction.**

1. Invert p in the integral perfect-complex adjoint.
2. Identify the rational trace and cohomology with the previously constructed rationalizations.
3. Use finite-dimensional field duality to extract the degreewise perfect pairings.

**Acceptance.** Degrees i<0 and i>2d vanish; local coefficients beyond the finite F_p case are not asserted here.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.5/integral-derived-duality`, `ClassicalAdicEtaleCohomologyPartII:PD.5/p-adic-traces`, `mathlib:LinearMap.IsPerfPair`.

**Source:** Z Theorem 5.5.6, pp. 82–83 (corrected shift).

**Closure checks for PD.5.** G1, G2, G3. Resolve the supplier contracts listed below and verify the tests above before changing this layer from planned to closed.

## PD.6. Proper smooth relative finiteness

Over strictly totally disconnected perfectoid bases prove coherence, relative strict-containment finite-presentation factorization and the spectral-sequence factorization lemma. Deduce almost finite presentation of relative O⁺/p cohomology. Combine continuous elementary divisors, primitive comparison and all-p quasi-pro-étale base change to obtain finite local systems Rⁱf_*L for proper smooth f. Include finite p-power coefficients and finitely generated lisse Z_p higher direct images with their limit comparisons.

**Layer inputs:** `AInfCohomology:AI.1`, `AdicSpacesPartII:R1`, `AdicSpacesPartII:R2`, `ArithmeticGaloisDuality:D7`, `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H3`, `DiamondEtaleCohomology:C1`, `DiamondsAndVStacks:D1`, `EnhancedDerivedSheaves:E2`, `PadicHodgeTheory:P8`, `PerfectoidSpaces:P0`, `PerfectoidSpaces:P3`, `SchemeAndStackFoundations:SF.0`, `PerfectoidSpaces:P5`, `PerfectoidSpaces:P6`.

### Coherent integral reductions of disconnected bases

**Theorem** · `disconnected-coherent-reduction` · Planet: Coherent disconnected reductions.

For a totally disconnected perfectoid S=Spa(R,R⁺) over C and a pseudouniformizer ϖ∈R⁺, R⁺/ϖ is coherent. Thus an almost finitely generated submodule of an almost finitely presented R⁺/ϖ-module is almost finitely presented. For the strictly totally disconnected bases used below, O_S⁺/p is flat over R⁺/p on the étale site, and étale sheaves identify with sheaves on |S|.

**Proof/construction.**

1. Use the imported component description by affinoid fields and profinite component space.
2. Near any component a finitely generated ideal reduces to a principal ideal in a valuation-ring quotient with principal annihilator; extend the generators and relations over a clopen neighborhood and use compactness.
3. Approximate almost modules by finite presentations to obtain almost coherence. Flatness and the strictly disconnected site identification are imported from D1, not claimed for arbitrary perfectoid bases.

**Acceptance.** Adic constructibility and Zariski constructibility differ: the complement of a classical point of a closed disc need not be quasi-compact.

**Direct prerequisites:** `DiamondsAndVStacks:D1`, `PerfectoidSpaces:P0`, `PerfectoidSpaces:P3`.

**Source:** SW Proposition 10.5.2, Remarks 10.5.4–10.5.5, pp. 84–85; flatness input cited there as ECD Proposition 7.23.

### Relative strict containment

**Definition** · `relative-strict-containment`.

For affinoid U⊂V over an affinoid base S, U is strictly contained in V relative to S when every map Spa(K,O_K)→U over S whose projection extends to Spa(K,K⁺)→S, with K⁺ an open valuation subring, extends to a map Spa(K,K⁺)→V over S. The extended map is not required to land in U. In this layer U is a rational subset of V, and V maps to a relative ball through rational embeddings and finite étale maps.

**Proof/construction.**

1. Express the lifting condition over valuation field pairs using the existing adic morphisms.
2. Use the relative valuative description to compare with compact containment on the smooth affinoid charts used in nested proper covers.

**Uses.** SW Lemma 10.5.8: forces the image algebra in the valuation-ring reduction to be finite; SW Proposition 10.5.10: provides the successive affinoid covers for the spectral-sequence argument.

**API.**

- `TauCeti.AdicDuality.relative_strict_containment.transitive` (relation): If U is strictly contained in V over S and V is strictly contained in W over S, then U is strictly contained in W over S.
- `TauCeti.AdicDuality.relative_strict_containment.base_change` (functoriality): The valuative extension property is preserved by base change when the affinoid fibre products in question exist.
- `TauCeti.AdicDuality.relative_strict_containment.proper_cover` (compatibility): Proper smooth X/S admits the finite sequences of affinoid chart covers with this containment used in the relative Cartan–Serre argument.

**Unit tests.**

- `relative-strict-containment.smaller_disc` (example): Over Spa C, the closed disc |T|≤|a| for 0<|a|<1 is strictly contained in the closed unit disc.
- `relative-strict-containment.empty` (example): The empty subdomain satisfies the extension condition vacuously.
- `relative-strict-containment.boundary` (non-example): The closed unit disc is not strictly contained in itself over Spa C: a rank-two boundary refinement can specialize outside that same rational domain in its ambient line.

**Acceptance.** The larger target V in the extension is essential.

**Direct prerequisites:** `AdicSpacesPartII:R1`, `DiamondsAndVStacks:D1`.

**Source:** SW Lemma 10.5.8, p. 88.

### Finite presentation on relative smooth charts

**Theorem** · `relative-finite-presentation`.

Let S=Spa(R,R⁺) be a strictly totally disconnected perfectoid over C and let U=Spa(A,A⁺) map to the relative closed ball Bⁿ_S by a composite of rational embeddings and finite étale maps, with the integral structures used in SW. Then A⁺/p is a finitely presented R⁺/p-algebra.

**Proof/construction.**

1. Approximate the chart and finite étale/rational maps by finite-presentation rigid spaces over C, using the perfectoid limit theorem.
2. Apply the Reduced Fibre input G2 after a rig-étale cover at finite level; it splits over the strictly disconnected S.
3. Geometrically reduced model fibres ensure that the power-bounded rings commute with these base changes; pass to the filtered colimit modulo p.

**Acceptance.** Finitely presented as an algebra does not mean finitely presented as a module; the next containment theorem adds that stronger conclusion only for a factorization.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.6/disconnected-coherent-reduction`, `AdicSpacesPartII:R2`, `DiamondsAndVStacks:D1`, `PerfectoidSpaces:P5`, `PerfectoidSpaces:P6`.

**Source:** SW Lemma 10.5.9 and proof, p. 89.

### Finite presentation of restriction factorizations

**Theorem** · `relative-restriction-factorization`.

In the preceding chart setting let U=Spa(A,A⁺)⊂V=Spa(B,B⁺) be rational and strictly contained relative to S. Then B⁺/p→A⁺/p factors through a finitely presented R⁺/p-module. No claim that the image itself is finitely presented is made.

**Proof/construction.**

1. Work over a component valuation field and reduce to its residual valuation ring V=K⁺/K°°.
2. The image algebra of B in A is flat finitely generated over V, hence finitely presented; strict containment supplies its valuative properness and therefore finiteness.
3. Lift finitely many kernel generators, take powers killing their nilpotent images modulo p, and factor through a finite presented module algebra. Glue over clopens of the disconnected base. The valuation-ring finite-presentation and properness criterion are G5.

**Acceptance.** The factorization has a module-finite middle object although source and target chart algebras are usually not module-finite.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.6/relative-strict-containment`, `ClassicalAdicEtaleCohomologyPartII:PD.6/relative-finite-presentation`, `SchemeAndStackFoundations:SF.0`, `AdicSpacesPartII:R2`.

**Source:** SW Lemma 10.5.8 and proof, pp. 88–89.

### Almost finite-presentation spectral-sequence factorization

**Theorem** · `spectral-factorization` · Planet: Spectral sequence factorization.

Let (E_i^{a,b}⇒M_i^{a+b})_{0≤i≤(N+1)3^{N+1}} be upper-right-quadrant spectral sequences over R⁺/p with compatible transition maps. If for some fixed page r every successive page-r map factors through an almost finitely presented module, then M_0^k→M_{(N+1)3^{N+1}}^k factors through such a module for k≤N. If the endpoint map is the identity of M, this proves M almost finitely presented.

**Proof/construction.**

1. A three-step transition at page r gives a factorization on kernels and then cokernels through almost finitely presented modules; use almost coherence for both.
2. Iterate the three-step loss to reach the stable page in total degrees ≤N.
3. Pass through the N+1 filtration steps by pullback–pushout extensions to factor the abutment map.
4. An identity factorization makes M a retract of an almost finitely presented module; do not replace factorization by a claim about arbitrary images.

**Acceptance.** For N=0 the specified chain length is 3; a single arbitrary page-r image statement is a different and stronger assertion.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.6/disconnected-coherent-reduction`, `EnhancedDerivedSheaves:E2`, `PerfectoidSpaces:P0`.

**Source:** SW Lemma 10.5.6, Remark 10.5.7 and proof, pp. 86–88.

### Relative almost finite presentation of proper cohomology

**Theorem** · `relative-almost-finite-presentation` · Planet: Relative almost finite presentation.

Let f:X→Y be proper smooth between rigid spaces over C, L a finite F_p-local system, and S=Spa(R,R⁺)→Y a strictly totally disconnected quasi-pro-étale perfectoid. For every i≥0, Hⁱ(X_S,L⊗O⁺_{X_S}/p) is almost finitely presented over R⁺/p, for the pseudouniformizer almost convention of SW Proposition 10.5.2.

**Proof/construction.**

1. Choose enough nested affinoid covers with relative strict containment and good smooth coordinates; trivialize L on the finite étale charts.
2. Compute local almost cohomology by toric perfectoid covers and Koszul complexes. The local restriction maps factor through almost finite presentations by the preceding chart theorem and the explicit toric cohomology estimates.
3. Use the (i+1)3^{i+1} chain of spectral-sequence maps to factor the identity on Hⁱ through an almost finitely presented module. Retract closure proves the claim.
4. The local estimate is an extension of the absolute almost finite-generation proof; G5 records the explicit relative chain-level factorization verification still required.

**Acceptance.** Almost finite generation alone would not supply the continuity criterion needed for a local system.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.6/relative-restriction-factorization`, `ClassicalAdicEtaleCohomologyPartII:PD.6/spectral-factorization`, `ClassicalAdicEtaleCohomologyPartII:PD.6/disconnected-coherent-reduction`, `AInfCohomology:AI.1/continuous-cochains-koszul`, `PerfectoidSpaces:P3`, `PadicHodgeTheory:P8/early-relative-primitive-comparison`.

**Source:** SW Proposition 10.5.10 and the argument preceding it, p. 89; proof strategy pp. 82–83.

### Local constancy from almost finite presentation

**Theorem** · `relative-local-constancy-criterion`.

In the preceding setting, suppose M=Hⁱ(X_S,L⊗O⁺/p) is almost finitely presented. Then (Rⁱf_ét,*L)|S is a finite F_p-local system. This criterion uses the all-p quasi-pro-étale base-change branch, the relative primitive comparison, and the topology of the strictly disconnected base; it makes no arbitrary proper-base-change assertion in advance.

**Proof/construction.**

1. Use quasi-pro-étale base change to identify the pulled-back étale direct image, and flatness of O_S⁺/p to associate the underived module sheaf M.
2. The elementary-divisor sequence of the fibre of M varies continuously in the sup norm, by almost finite presentation and valuation-ring elementary divisors. Primitive comparison makes each sequence consist of finitely many 1’s and then zeros; its rank is therefore locally constant.
3. Extend a stalk basis to sections. Kernels and cokernels of the resulting map are almost finitely presented by almost coherence; their discrete elementary-divisor sequences vanish on a neighborhood.
4. Detect the resulting F_p sheaf isomorphism by its field fibres, and descend along quasi-pro-étale covers. The elementary-divisor continuity proof is explicitly included in G5.

**Acceptance.** Use C1’s quasi-pro-étale branch for p-torsion, not C3’s prime-to-p qcqs base-change theorem.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.6/disconnected-coherent-reduction`, `PadicHodgeTheory:P8/early-relative-primitive-comparison`, `PadicHodgeTheory:P8/early-primitive-comparison-and-finiteness`, `DiamondEtaleCohomology:C1`, `DiamondsAndVStacks:D1`, `PerfectoidSpaces:P0`.

**Source:** SW Lemma 10.5.3 and proof, pp. 84–86; ECD Corollary 16.10(ii) cited on p. 83.

### Proper smooth relative mod-p finiteness

**Theorem** · `relative-mod-p-finiteness` · Planet: Relative mod-p finiteness.

Let C be complete algebraically closed over Q_p and f:X→Y proper smooth between rigid C-spaces. For every finite-rank étale F_p-local system L and every i≥0, Rⁱf_ét,*L is a finite-rank étale F_p-local system. Its stalks are the cohomology of the geometric fibres. The ranks are locally constant; they may differ on connected components of Y.

**Proof/construction.**

1. Pull back to the basis of strictly totally disconnected quasi-pro-étale covers.
2. Apply relative almost finite presentation and the local-constancy criterion there.
3. Descend the finite local system along the site comparison; identify geometric stalks by the weak geometric proper-base-change theorem.

**Acceptance.** No arbitrary p-adic local system is asserted to have finite free higher Z_p direct images.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.6/relative-almost-finite-presentation`, `ClassicalAdicEtaleCohomologyPartII:PD.6/relative-local-constancy-criterion`, `DiamondsAndVStacks:D1`, `DiamondEtaleCohomology:C1`, `ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change`.

**Source:** SW Theorem 10.5.1 and its reduction, pp. 82–83, completed on p. 89.

### Relative finite p-power and integral local systems

**Theorem** · `relative-integral-finiteness`.

For f as above and a finite free lisse Z_p-sheaf T, each Rⁱf_ét,*(T/pⁿ) is a locally constant finite Z/pⁿ-module sheaf. With the pro-étale inverse-limit interpretation, Rⁱf_proét,*T is a lisse finitely generated Z_p-module sheaf, with possible torsion. The required inverse-limit and stalk comparisons are part of this assertion; it does not declare every direct image finite free.

**Proof/construction.**

1. Induct on n using 0→T/p→T/pⁿ⁺¹→T/pⁿ→0 and the exact-sequence category of finite local systems.
2. Use finite stalk cohomology for the Mittag–Leffler argument and retain the derived inverse-limit sequence until lim¹ vanishes.
3. Import P8’s étale/pro-étale lattice equivalence and its lisse direct-image comparison. Extend from finite free lattices to finitely generated modules by their finite torsion submodule and free quotient, using H0’s finite local systems. D7 supplies the derived-limit/Mittag–Leffler algebra; no assertion about arbitrary inverse limits of sheaves is used.

**Acceptance.** An extension in finite coefficient local systems need not be free over Z/pⁿ; torsion in integral fibre cohomology is permitted.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.6/relative-mod-p-finiteness`, `ArithmeticGaloisDuality:D7`, `ClassicalAdicEtaleCohomology:H0`, `PadicHodgeTheory:P8/plan/lisse-sheaves-etale-proetale-equivalence`.

**Source:** SW paragraph following Theorem 10.5.1, p. 82; relative comparison motivation on p. 83.

**Closure checks for PD.6.** G2, G5. Resolve the supplier contracts listed below and verify the tests above before changing this layer from planned to closed.

## PD.7. Zariski-constructible proper base change

Define the locally bounded Zariski-constructible derived category, distinct from Huber constructibility. Prove affinoid constructible algebraization, étale locality and finite-cover generation. Combine proper resolution descent, generic smoothness and relative finiteness to prove proper constructible pushforward. Prove invariance under arbitrary algebraically closed field extension, then all-torsion proper base change. Apply it to Heuer’s constant cohomology sheaf on smooth rigid bases over algebraically closed K.

**Layer inputs:** `AInfCohomology:AI.1`, `AdicCoefficientsAndComparisons:L2`, `AdicSpacesPartII:R3`, `AdicSpacesPartIIPartII:RZ.0`, `AdicSpacesPartIIPartII:RZ.1`, `AdicSpacesPartIIPartII:RZ.2`, `AdicSpacesPartIIPartII:RZ.5`, `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H3`, `ClassicalAdicEtaleCohomology:H5`, `ClassicalAdicEtaleCohomologyPartII:PD.0`, `ClassicalAdicEtaleCohomologyPartII:PD.5`, `ClassicalAdicEtaleCohomologyPartII:PD.6`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`, `PadicHodgeTheory:P8`, `PerfectoidSpaces:P3`.

### Zariski-constructible torsion complexes

**Definition** · `zariski-constructible-complex` · Planet: Zariski-constructible complexes.

For a rigid K-space in characteristic zero and Λ=Z/n, n>0, an étale Λ-sheaf is Zariski-constructible when on every affinoid open it is finite locally constant on each stratum of some finite stratification by Zariski-locally closed rigid subspaces. D_zc^{(b)}(X,Λ) consists of complexes whose cohomology is Zariski-constructible and which are bounded on every qcqs open. On qcqs X this is D_zcᵇ. This is distinct from Huber’s adic constructibility on Boolean combinations of qc opens.

**Proof/construction.**

1. Use the existing rigid Zariski closed/locally closed subspace operations.
2. Define finite local constancy on strata using the existing étale local-system category.
3. Take the cohomological full derived subcategory and the locally bounded convention.

**Uses.** BH Theorems 3.10 and 3.15: specifies the correct coefficient category for all-torsion proper base change; Heuer Proposition 2.18: uses the constant sheaf instance.

**API.**

- `TauCeti.AdicDuality.zariski_constructible_complex.qcqs` (characterisation): On qcqs X, locally bounded Zariski-constructible complexes are globally bounded.
- `TauCeti.AdicDuality.zariski_constructible_complex.pullback` (functoriality): Rigid pullback preserves Zariski-constructible cohomology and local boundedness.
- `TauCeti.AdicDuality.zariski_constructible_complex.stratum_extension` (constructor): For a Zariski-locally closed stratum, extension by zero of a finite local system is Zariski-constructible.

**Unit tests.**

- `zariski-constructible-complex.closed_point` (example): A skyscraper finite sheaf at a classical point of a closed disc is Zariski-constructible; it need not be Huber-constructible because the complement is not qc.
- `zariski-constructible-complex.constant` (example): Every finite constant sheaf is Zariski-constructible.
- `zariski-constructible-complex.unbounded_components` (example): On a disjoint union of points, place Λ in degree −j on the j-th component: the object is locally bounded and Zariski-constructible but not globally bounded.

**Acceptance.** Global boundedness cannot be imposed on every non-quasi-compact proper-map problem.

**Direct prerequisites:** `ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves`, `AdicSpacesPartIIPartII:RZ.0`, `EnhancedDerivedSheaves:E1`.

**Source:** BH Definition 3.1 and Warning 3.2, pp. 14–15.

### Affinoid constructible algebraization

**Theorem** · `affinoid-constructible-algebraization` · Planet: Affinoid constructible algebraization.

Let K have characteristic zero, A be a K-affinoid algebra, S_alg=Spec A and S=Spa(A,A°). For a finite-type S_alg-scheme Z and n≥1, analytification induces a fully faithful t-exact functor D_cᵇ(Z,Z/n)→D_zcᵇ(Z_an,Z/n); it is an equivalence when Z is proper over S_alg, in particular for Z=S_alg. For every finite-type map h:Z→W of finite-type S_alg-schemes, (Rh_*F)_an≅Rh_an,*F_an for F∈D_cᵇ(Z,Z/n), without a properness hypothesis on h. It also identifies the lisse subcategories for every such Z.

**Proof/construction.**

1. Extend the existing H5 proper algebraic/analytic comparison to finite-type schemes over an affinoid algebra; the nonproper direct-image comparison and full faithfulness are G4, not consequences of proper comparison.
2. For proper Z, use induction over a normal lisse stratum. Extend its finite étale covers across the normalization as finite branched covers, algebraize by relative rigid GAGA, and restrict back.
3. Use finite descent and normal compactification to identify lisse subcategories on nonproper Z. G4 records the required branched-cover and comparison inputs.

**Acceptance.** For Z=Spec A the equivalence identifies scheme constructibility with rigid Zariski-constructibility. It does not identify it with Huber constructibility.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.7/zariski-constructible-complex`, `ClassicalAdicEtaleCohomology:H5`, `AdicSpacesPartII:R3`, `AdicSpacesPartIIPartII:RZ.1`, `AdicCoefficientsAndComparisons:L2`.

**Source:** BH Proposition 3.7 and proof, pp. 15–16.

### Locality and finite-cover generators

**Theorem** · `constructible-locality-and-generators`.

Zariski-constructibility of finite torsion étale sheaves in characteristic-zero rigid geometry is étale local. On a qcqs X, D_zcᵇ(X,Z/n) is the thick triangulated subcategory generated by finite direct images f_*M of finite constant sheaves on finite Y→X. The affinoid algebraization input identifies these categories with constructible sheaves on Spec A when X=Spa A.

**Proof/construction.**

1. Use the affine constructible comparison G4 and the maximal lisse open; flat restriction maps preserve it, so the complement glues to a coherent closed subset.
2. Induct on dimension to prove locality, using descent of coherent ideals.
3. For generators, pass to a prime-to-ℓ finite étale cover on a dense lisse stratum, with unipotent residual monodromy, and extend it to a finite branched cover; use localization and direct summands. G4 includes the branched-cover extension theorem. The unipotent filtration is a finite-group representation argument; reuse current Tau Ceti’s fixed-vector results, or the pinned Mathlib fixed-point baseline, without invoking geometric Poincaré duality.

**Acceptance.** Use the affinoid comparison owned by this Part II; its nonproper comparison and branched-cover input remain G4.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.7/affinoid-constructible-algebraization`, `ClassicalAdicEtaleCohomologyPartII:PD.7/zariski-constructible-complex`, `AdicSpacesPartIIPartII:RZ.1`, `AdicSpacesPartII:R3`, `mathlib:Representation.invariants`, `mathlib:IsPGroup.exists_fixed_point_of_prime_dvd_card_of_fixed_point`.

**Source:** BH Theorem 3.5, Proposition 3.6, Proposition 3.7 and proof of Theorem 3.5, pp. 15–17.

### Zariski-constructible proper pushforward

**Theorem** · `proper-constructible-pushforward` · Planet: Constructible proper pushforward.

For any proper morphism f:X→Y of rigid spaces over a characteristic-zero complete nonarchimedean field K, and any n>0, R f_* carries D_zc^{(b)}(X,Z/n) into D_zc^{(b)}(Y,Z/n). If source and target are qcqs, it carries bounded objects to bounded objects. The theorem allows residue characteristic dividing n.

**Proof/construction.**

1. Work over an affinoid target, use finite-cover generators, and reduce to the constant sheaf on a proper space.
2. Use rigid resolution and proper cohomological descent to replace a fixed cohomological degree by finitely many smooth hypercover terms.
3. Use proper generic smoothness G5 to find a dense Zariski open of the reduced target over which those proper maps are smooth.
4. For ℓ=p apply relative finiteness; for ℓ≠p use H3’s smooth proper prime-to-p local constancy. Induct over the closed complement and use weak geometric base change plus the uniform local cohomological bound. This proof does not use the arbitrary base change theorem it precedes.

**Acceptance.** Over a non-qc target, neither global fibre dimension bounds nor one global cohomological interval are assumed.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.7/constructible-locality-and-generators`, `ClassicalAdicEtaleCohomologyPartII:PD.6/relative-mod-p-finiteness`, `AdicSpacesPartIIPartII:RZ.5/rigid-resolution`, `ClassicalAdicEtaleCohomology:H3/proper-torsion-cohomological-amplitude`, `ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change`, `EnhancedDerivedSheaves:E2`, `AdicSpacesPartIIPartII:RZ.2`, `ClassicalAdicEtaleCohomology:H3`.

**Source:** BH Theorem 3.10 and proof, pp. 17–18.

### Proper cohomology under algebraically closed field extension

**Theorem** · `proper-field-extension`.

For C′/C/Q_p an extension of complete algebraically closed nonarchimedean fields, proper rigid X/C and F∈D_zcᵇ(X,Z/pᵃ), the canonical map RΓ(X,F)→RΓ(X_{C′},F_{C′}) is an isomorphism. The field extension need not have transcendence dimension zero.

**Proof/construction.**

1. Use finite generators and coefficient induction to reduce to F_p on a proper finite cover.
2. Use the singular proper primitive comparison G3 on both fields.
3. On a local toric perfectoid cover, compute O⁺/p cohomology by a finite Koszul complex; the scalar-extended integral perfectoid ring and the power-bounded base-change ring are almost isomorphic.
4. Glue the almost local comparison, then detect the finite F_p cohomology map by almost scalar extension. The local toric covering and singular comparison beyond the smooth case are part of G3.

**Acceptance.** This field-extension step supplies the missing all-p comparison at rank-one geometric points in arbitrary proper base change.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.7/constructible-locality-and-generators`, `PadicHodgeTheory:P8`, `PerfectoidSpaces:P3`, `AInfCohomology:AI.1/continuous-cochains-koszul`, `ClassicalAdicEtaleCohomologyPartII:PD.0/nearby-cycle-complexes`, `ClassicalAdicEtaleCohomologyPartII:PD.5/proper-p-adic-perfectness`.

**Source:** BH Lemma 3.25 and proof, p. 25.

### Proper base change with all torsion coefficients

**Theorem** · `proper-base-change-all-torsion` · Planet: All-torsion proper base change.

In a cartesian square of rigid spaces over a complete characteristic-zero nonarchimedean field, with f:X→Y proper and arbitrary g:Y′→Y, let f′:X′→Y′ and g′:X′→X be the base changes. For every n>0 and F∈D_zc^{(b)}(X,Z/n), the canonical exchange map g^*R f_*F→R f′_*g′^*F is an isomorphism. No prime-to-residue-characteristic restriction is imposed.

**Proof/construction.**

1. Construct the exchange natural transformation from the site adjunctions, respecting composition.
2. Both sides are Zariski-constructible by proper pushforward and hence overconvergent; use enough rank-one geometric points and weak geometric proper base change to reduce the map to field-valued proper cohomology.
3. For residue-prime-to-n coefficients apply the inherited Huber theorem; for p-power coefficients use the algebraically closed field-extension comparison.
4. Use coefficient decomposition and local boundedness to conclude for all n and the stated derived range.

**Acceptance.** The result is scoped to Zariski-constructible locally bounded complexes; it is not an arbitrary-sheaf p-torsion six-functor theorem.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.7/proper-constructible-pushforward`, `ClassicalAdicEtaleCohomologyPartII:PD.7/proper-field-extension`, `ClassicalAdicEtaleCohomologyPartII:PD.7/zariski-constructible-complex`, `ClassicalAdicEtaleCohomology:H3/weak-geometric-support-base-change`, `ClassicalAdicEtaleCohomology:H0`.

**Source:** BH Theorem 3.15 and proof, pp. 19–20.

### Proper constant cohomology sheaves on smooth rigid bases

**Application** · `heuer-constant-cohomology-sheaf`.

Let K be complete algebraically closed over Q_p, g:Z→Spa K proper rigid, n≥1 and m≥0. On the big étale site of smooth rigid K-spaces, Rᵐg_ét,*(Z/n) is canonically the constant sheaf associated to Hᵐ_ét(Z,Z/n). Equivalently for a smooth Y/K the proper base-change sheaf on Y is the pullback of that finite module. This is a statement about sheaves, not equality of Hᵐ(Z×Y,Z/n) with Hᵐ(Z,Z/n) for all Y.

**Proof/construction.**

1. Apply all-torsion proper base change to Z×Y→Y for every smooth rigid Y.
2. Over algebraically closed K the small étale sheaf Rᵐg_*(Z/n) on Spa K is the constant module Hᵐ(Z,Z/n).
3. Pull back to Y and glue naturally in Y on the big étale site. Without algebraic closedness the correct base sheaf carries its Galois action.

**Acceptance.** For Y with its own nonzero higher cohomology, the product cohomology need not be constant; only the higher direct-image sheaf is being identified.

**Direct prerequisites:** `ClassicalAdicEtaleCohomologyPartII:PD.7/proper-base-change-all-torsion`, `ClassicalAdicEtaleCohomologyPartII:PD.7/proper-constructible-pushforward`, `ClassicalAdicEtaleCohomology:H0`.

**Source:** H §2.6, Proposition 2.18 and proof, p. 279.

**Closure checks for PD.7.** G1, G2, G3, G4, G5. Resolve the supplier contracts listed below and verify the tests above before changing this layer from planned to closed.

## Supplier contracts and proof-closure gaps

Exact supplier-node ids in the target prerequisites are imports of their checked mathematical statements. A stage id instead has the following contract. No edits to those suppliers are made by this job. The three continuation proposals preserve their current scope: universally coherent valuation-base duality in the scheme direction, valuation-model uniformization in the adic direction, and singular proper primitive comparison in the p-adic Hodge direction. The new affinoid constructible algebraization stays in this classical Part II.

### `AInfCohomology:AI.1`

Derived p-completion, reduction and inverse-limit Nakayama for bounded coherent/perfect complexes, multiplicative Lη and its torsion criterion. Koszul continuous-cochain and completed-sum results are cited by their exact nodes and retain the uniform annihilator hypotheses.

Used by: `affine-almost-derived-calculus`, `formal-dualizing-complex`, `character-decomposition`, `root-algebra-derived-duality`, `proper-p-adic-perfectness`, `finite-p-power-duality`, `integral-derived-duality`.

### `AInfCohomology:AI.3`

The perfectoid completed-structure-sheaf comparison needed to evaluate the BMS cotangent map on a toric pro-étale cover; no integral splitting of the Hodge–Tate complex is requested.

Used by: `polystable-root-tower`.

### `AdicCoefficientsAndComparisons:L2`

Finite-type scheme compactification and localization for constructible torsion étale complexes over an affinoid algebra. The valuation-base compactification needed by G1 requires its non-Noetherian extension, not just Nagata over a field.

Used by: `affinoid-constructible-algebraization`.

### `AdicSpacesPartII:F0`

Coherent modules and bounded coherent complexes on admissible formal models: affine completeness, reduction, coherent proper mapping, algebraic/formal completion comparison and relative rigid GAGA. G2 singles out the additional non-Noetherian algebraization hypotheses.

Used by: `affine-almost-derived-calculus`, `formal-dualizing-comparison`.

### `AdicSpacesPartII:R1`

Affinoid rings, rational restrictions, their power-bounded integral structures and étale toric coordinate charts; keep O_X and O_X⁺ distinct.

Used by: `relative-strict-containment`.

### `AdicSpacesPartII:R2`

G2: in addition to admissible models, Raynaud localization and properness comparison already planned in R2, supply reduced-model cofinality, refined Elkik algebraization over rank-one valuation rings, dense finite flat models of generically finite maps, finite formal quotients of models with quasiprojective residue special fibre and Zavyalov local altered uniformization (U Theorem 1.4). The relative Reduced Fibre input in SW Lemma 10.5.9 must control power-bounded base change, not just existence of one model.

Used by: `nearby-cycle-complexes`, `formal-hartogs`, `canonical-generic-identification`, `polystable-model`, `good-quotient`, `local-almost-duality`, `global-almost-trace`, `relative-finite-presentation`, `relative-restriction-factorization`.

### `AdicSpacesPartII:R3`

Coherent sheaf descent, relative rigid GAGA and Kiehl proper mapping with support, plus the finite locally free algebra trace and its differential projection formula. The nonproper torsion comparison in G4 is not part of this request.

Used by: `generic-fibre-almost-complexes`, `hartogs-gluing`, `generic-hodge-tate-trace-comparison`, `constructible-locality-and-generators`, `affinoid-constructible-algebraization`.

### `AdicSpacesPartIIPartII:RZ.0`

Rigid Zariski closed and locally closed analytic subspaces, coherent ideal descent, irreducible components and noetherian dimension induction on affinoids.

Used by: `zariski-constructible-complex`.

### `AdicSpacesPartIIPartII:RZ.1`

Finite normalization, its compatibility with étale/rational restriction, and finite branched cover geometry on normal rigid spaces. Extending every finite étale cover across a dense open is the additional G4 contract, not an automatic normalization property.

Used by: `constructible-locality-and-generators`, `affinoid-constructible-algebraization`.

### `AdicSpacesPartIIPartII:RZ.2`

G5 (geometric part): proper generic smoothness BH Theorem 2.29, with smooth source and reduced target, including weakly Shilov generic flatness BH 2.21 and smooth fibres BH 2.25. The existing singular/smooth-locus node does not establish a dense Zariski open of the target.

Used by: `proper-constructible-pushforward`.

### `ArithmeticGaloisDuality:D7`

Continuous and finite-group derived cochains, bar resolutions, Hochschild–Serre, induced-module Shapiro, coefficient reduction and derived inverse limits, compatible with upstream ProfiniteCohomology. Retain finite-generation/Mittag–Leffler hypotheses; the geometric étale/pro-étale lattice equivalence is imported from P8, not assigned to D7.

Used by: `equivariant-almost-descent`, `proper-p-adic-perfectness`, `p-adic-traces`, `relative-integral-finiteness`.

### `ClassicalAdicEtaleCohomology:H0`

The small étale and pro-étale ringed sites of rigid spaces, sheafification, morphisms of sites and their derived pullback/pushforward, finite local systems and coefficient operations; distinguish these from the new Zariski-constructible condition.

Used by: `finite-proetale-traces`, `equivariant-derived-calculus`, `local-system-duality`, `p-adic-traces`, `relative-integral-finiteness`, `proper-base-change-all-torsion`, `heuer-constant-cohomology-sheaf`.

### `ClassicalAdicEtaleCohomology:H3`

Use the all-torsion-invertible-in-K analytic trace, all-torsion proper projection formula and proper cohomological bound already supplied by exact nodes. Add its geometric-fibre nonzero/surjectivity property for connected smooth proper spaces (Berkovich Theorem 7.2.1 as used in Z Lemma 5.3.1). Do not restrict this characteristic-zero trace to coefficients prime to the residue characteristic, and do not import arbitrary p-torsion base change from H3.

Used by: `almost-detection-and-top-trace`, `proper-constructible-pushforward`.

### `ClassicalAdicEtaleCohomology:H5`

The existing proper algebraic/analytic comparison and curve compactification used in PS Theorem 3.17, with their formal-model and coherent GAGA inputs. PD.7 explicitly owns the new BH Proposition 3.7 affinoid/nonproper comparison; it is not silently inferred from H5.

Used by: `affinoid-constructible-algebraization`.

### `DerivedDeRhamCohomology:DD.0`

The full derived cotangent complex, transitivity, completed base change, derived exterior powers and their maps to cohomology; include p-completion over O_C/Z_p, not just the naive two-term cotangent complex.

Used by: `torsion-free-nearby-cohomology`, `bms-maps-general-model`, `root-stage-trace`, `root-algebra-derived-duality`.

### `DiamondEtaleCohomology:C1`

The all-p quasi-pro-étale base-change branch of ECD Corollary 16.10(ii), before v-locality: pullback of the étale derived direct image to a strictly disconnected quasi-pro-étale base. No arbitrary proper p-torsion base change is used here.

Used by: `relative-local-constancy-criterion`, `relative-mod-p-finiteness`.

### `DiamondsAndVStacks:D1`

Strictly totally disconnected perfectoid covers, their topological sheaf description, flatness of O⁺/p on the étale site and affinoid-field decompositions. These supply the bases used in SW §10.5.

Used by: `disconnected-coherent-reduction`, `relative-strict-containment`, `relative-finite-presentation`, `relative-local-constancy-criterion`, `relative-mod-p-finiteness`.

### `PerfectoidSpaces:P5`

Finite-stage approximation and descent of finite étale and qcqs étale charts through completed inverse limits of affinoid perfectoid bases (ECD 6.4(i)–(iii)); retain the henselian approximation hypotheses. G2 separately supplies the reduced integral model and its power-bounded base change.

Used by: `relative-finite-presentation`.

### `PerfectoidSpaces:P6`

The affinoid finite-stage assertion ECD 6.4(iv), rational-chart and pro-étale limit calculus needed to approximate the relative smooth affinoid chart in SW Lemma 10.5.9; P5 alone does not guarantee affinoidness.

Used by: `relative-finite-presentation`.

### `EnhancedDerivedSheaves:E1`

Unbounded derived categories of ringed-site modules, K-injective/K-flat resolutions, derived internal Hom/tensor, projection/adjunction maps and cohomological truncation. These are genuine complexes and derived functors, not formal symbols.

Used by: `formal-almost-coherence`, `affine-almost-derived-calculus`, `almost-proper-duality`, `faltings-pairing`, `equivariant-almost-descent`, `equivariant-derived-calculus`, `zariski-constructible-complex`.

### `EnhancedDerivedSheaves:E2`

Derived limits and colimits, compatible spectral sequences and finite-range proper cohomological hyperdescent. Build resolution hypercovers by iterated proper resolution of their fibre products; prove the degreewise truncation bound used in BH Theorem 3.10.

Used by: `spectral-factorization`, `proper-constructible-pushforward`.

### `PadicHodgeTheory:P8`

Use the exact early smooth-proper primitive comparison and relative primitive comparison where their hypotheses hold. G3 requests the additional singular proper primitive comparison/finiteness of PS Theorem 3.17, the general almost coherent nearby-cycle theorem AC 6.13.5–6.13.6, and the toric integral perfectoid field-extension calculation in BH Lemma 3.25; the existing smooth-proper P8 node does not imply these extensions. Also import its geometric-hodge-tate-direct-images and plan/lisse-sheaves-etale-proetale-equivalence nodes for their exact smoothness and lattice ranges. PD.6 extends the latter comparison to finitely generated direct images by separating their finite torsion part and finite free quotient.

Used by: `nearby-cycle-complexes`, `generic-hodge-tate-trace-comparison`, `proper-p-adic-perfectness`, `proper-field-extension`, `relative-integral-finiteness`.

### `PerfectoidSpaces:P0`

Abstract almost modules and sheaves for the flat idempotent ideal 𝔪_C, the two adjoints to almostification, derived tensor/internal Hom, almost finite generation/presentation and the weak Serre property. The formal almost-coherent specialization is PD.0, not a second abstract almost theory.

Used by: `formal-almost-coherence`, `disconnected-coherent-reduction`, `spectral-factorization`, `relative-local-constancy-criterion`.

### `PerfectoidSpaces:P3`

Almost purity and acyclicity of O⁺/p on affinoid perfectoid pro-étale covers; retain the almost category and finite-dimensional cohomological bounds.

Used by: `nearby-cycle-complexes`, `polystable-root-tower`, `polystable-continuous-cohomology`, `disconnected-coherent-reduction`, `relative-almost-finite-presentation`, `proper-field-extension`.

### `SchemeAndStackFoundations:SF.0`

Affine schemes, finite presentation over a valuation ring, closed subschemes and the finite-presentation valuative criterion used by SW 10.5.8. The non-Noetherian extension of the criterion is included in G5; do not substitute a field-only properness criterion.

Used by: `relative-restriction-factorization`.

### `SchemeAndStackFoundations:SF.2`

G1: extend coherent proper duality beyond the reserved Noetherian finite-type node to separated finitely presented schemes over universally coherent O_K/pⁿ, with compactification, flat base change, coherent amplitude [−d,0], bottom-flat canonical sheaf, and reflexive extension for geometrically reduced residue fibres. This is an explicitly proposed Part II input, not supplied by the present node.

Used by: `almost-proper-duality`, `formal-dualizing-complex`, `formal-hartogs`, `formal-bottom-trace`.

### G1. Universally coherent valuation-base coherent duality

The reserved coherent-duality node is Noetherian finite type. Read Z §§2.1–2.5 and AC §5.5, but did not decompose a proof of the universally coherent extension over O_K/pⁿ, including compactification, flat finite-presentation amplitude and canonical-sheaf reflexivity. Supply these in Scheme and stack foundations, Part II, then check every reduction/completion used in PD.1. Ordinary Noetherian duality cannot close this gap.

Direct consumers: `almost-proper-duality`, `formal-dualizing-complex`, `formal-hartogs`.

### G2. Reduced valuation models and local altered uniformization

Read Z Theorems 2.7.1 and 4.4.1, U Theorems 1.3–1.4 and SW Lemma 10.5.9. U’s proof and the full Reduced Fibre/refined Elkik chain were not independently decomposed. The required contract includes reduced cofinal models, algebraization, finite formal quotients and the exact zigzag of Zariski covers, proper rig-isomorphisms and generic finite torsors with polystable dominating models. The relative input must commute with completed power-bounded base change. Raynaud existence alone supplies none of these refinements.

Direct consumers: `formal-hartogs`, `canonical-generic-identification`, `faltings-trace-compatibility`, `good-quotient`, `local-almost-duality`, `global-almost-trace`, `relative-finite-presentation`.

### G3. Almost coherent nearby cycles and singular proper comparison

P8’s existing early primitive node is smooth proper. PS Theorem 3.17 states the proper singular comparison/finiteness and gives a resolution/compactification proof; AC 6.13.5–6.13.6 gives general nearby-cycle almost coherence. Their full nonsmooth local toric calculation and the integral completed field-extension almost isomorphism in BH Lemma 3.25 need a separate proof-level supplier decomposition. Do not replace them by the smooth proper theorem or by H3’s transcendence-dimension-zero base change.

Direct consumers: `nearby-cycle-complexes`, `proper-p-adic-perfectness`, `proper-field-extension`.

### G4. Affinoid and nonproper constructible comparison proof inputs

BH Proposition 3.7’s proof was read. It invokes Hansen (2020), Theorems 1.6, 1.8 and 1.10(ii), for finite branched-cover extension, nonproper finite-type direct-image comparison and full faithfulness. Those proofs were not read or decomposed in this run. PD.7 owns the new comparison target, building on H5’s proper comparison and relative rigid GAGA; no claim that H5 already provides its nonproper conclusion is made.

Direct consumers: `affinoid-constructible-algebraization`, `constructible-locality-and-generators`.

### G5. Relative finiteness and generic smoothness proof closure

SW’s full §10.5 argument and BH 2.27/2.29 were read and the key targets are nodes. Remaining proof inputs are the valuation-base finite-presentation/properness criterion in SW 10.5.8, continuity of the elementary-divisor sequence for an almost finitely presented module on a strictly disconnected base (SW 10.5.3), and BH’s weakly Shilov generic-flatness/smooth-fibre arguments proving 2.27. Record and prove these contracts in the geometric supplier extension before declaring the relative route closed. The proper generic smoothness conclusion is a dense open of the target Y.

Direct consumers: `relative-restriction-factorization`, `relative-local-constancy-criterion`, `proper-constructible-pushforward`.

## Source corrections and version discipline

All statements above use the corrected forms. The packet records the complete reasons and searches for E1–E21 in the worker’s own words. E1–E12 were already identified by the accepted Zavyalov extraction and were checked again. E19 is the correction explicitly stated in SW Remark 10.5.7. The remaining findings refer only to the versions actually read; the Annals and EMS published texts were not compared. An author-hosted PDF is not certified to be the published edition.

- **E1** (misprint; nothing), Z v3, Theorem 2.2.3, p. 11: Use the finite-presentation category over S in this theorem. The objects and functor in the same statement are S-schemes, so the displayed category is a type error.
- **E2** (misprint; nothing), Z v3, Lemma 2.2.7(2), p. 13: For the source’s f:X→Y, f! takes bounded coherent complexes on Y to bounded coherent complexes on X. Exceptional pullback goes from the target of f to its source.
- **E3** (misprint; nothing), Z v3, proof of Lemma 2.7.3, p. 26: Refer to the isomorphism that actually compares completion, the fourth in that display. Matching the source and target of each displayed arrow determines the intended reference.
- **E4** (misprint; nothing), Z v3, proof of Lemma 2.7.9, p. 29: For Spa B→Spa A, take the algebra trace from B to A consistently. The coefficient trace is A-linear B→A; the interchanged notation reverses its type.
- **E5** (misprint; nothing), Z v3, proof of Lemma 3.4.8, p. 40: Use α(δ(T)) in both occurrences. δ is the Kummer boundary of an invertible function; T is that function, whereas X denotes the space.
- **E6** (misprint; nothing), Z v3, §§3.5–3.6, pp. 46–48; Corollary 2.4.5: Pass through formal completion and Corollary 2.4.5 for flatness, and use the amplitude result Lemma 2.2.13 at the scheme step. The intermediate formal comparison and flatness result are proved earlier, but the cited scheme statement alone has the wrong domain.
- **E7** (misprint; nothing), Z v3, Lemma 4.2.23, p. 55: Use the same generator index for the corresponding character eigenvalue. Evaluating γ_i−1 on its character line gives the eigenvalue of γ_i, not that of an unrelated generator.
- **E8** (misprint; nothing), Z v3, Theorem 4.3.16, p. 65: The integral trace takes values in the formal canonical sheaf; reduce only at the following mod-p step. The displayed source is integral and reduction occurs separately in the argument.
- **E9** (misprint; nothing), Z v3, §4.4 and Appendix D, pp. 70, 95, 97: Keep one chosen modulus throughout each diagram and reduce between diagrams by the explicit coefficient map. The maps in each square must be linear over the same coefficient ring.
- **E10** (misprint; a stated result), Z v3, Theorem 4.4.24, p. 74: Retain the hypotheses of Theorem 4.1.2: admissible nice models, including reduced residue special fibre. The trace and altered-uniformization argument used there were constructed for that class; omission is not a proof of the stronger statement.
- **E11** (misprint; nothing), Z v3, proof of Theorem 4.4.24, p. 74: Use the local good quotient 𝔛′_i/G_i=𝔛_i. These are the spaces produced by the preceding zigzag construction.
- **E12** (misprint; nothing), Z v3, Definition 5.2.1, p. 75: Its target is (O_Cᵃ/p)(−d)[−2d]. The top class is in degree 2d, so its trace to a degree-zero module is a map to that module shifted by −2d.
- **E13** (error; a stated result), Z v3, §4.2.2, p. 53, and Lemma 4.2.15, p. 54; same assertions in the author’s current PDF: Keep the additive completed character decomposition, but multiply the normalized monomials with their block-parameter factors; the line multiplication need not be onto. PD.3 uses derived root-algebra duality rather than strong grading. For R⁺=O_C⟨u,v⟩/(uv−ϖ) with nonzero nonunit ϖ, the opposite weight lines are O_Cu and O_Cv. Their product is ϖO_C inside the weight-zero line O_C, which is a proper submodule.
- **E14** (error; a stated result), Z v3, Theorems 5.5.2, 5.5.4, 5.5.6, pp. 81–83; same targets in the author’s current PDF: Use Λ[−2d] as the target and RHom(−,Λ)[−2d] as the adjoint target, for Λ=Z/pⁿ, Z_p and Q_p, with the indicated Tate twist on the second factor. On P¹ over C the nonzero top cohomology is in degree 2; pairing it with H⁰ must land in Λ[−2]. The finite-level trace is defined on H²ᵈ. An unshifted perfect pairing would identify a complex in degrees [0,2d] with its dual in [−2d,0].
- **E15** (misprint; nothing), Z v3, proof of Proposition 4.3.6, p. 61: Choose the scalar bound with the finite-stage index m in the block parameters ϖ_i^{1/pᵐ}. The finite algebra being reduced in that step is R_m⁺, so its defining parameter valuations determine the bound.
- **E16** (misprint; nothing), AC arXiv:2110.10773v3, Theorem 5.5.5, p. 129; same direction in v5, p. 130: For f:X→Y, Rf_* goes from the derived almost quasi-coherent category on X to that on Y. Direct image and its right adjoint f! have opposite directions. The adjunction and proof determine the intended functors.
- **E17** (misprint; nothing), AC arXiv:2110.10773v3, Lemma 5.5.6, p. 130; same category label in v5, p. 131: The comparison is in the derived almost category on Y. Both Rf_* internal Hom and internal Hom of Rf_* objects are sheaves on Y.
- **E18** (error; a stated result), AC arXiv:2110.10773v3, Lemma 4.9.7(2), pp. 113–114; v5, p. 114: For the bounded-below coherent Hom conclusion, put the first input in D⁻_acoh and the second in D⁺_acoh, as used by the proof and the duality application. Take the first input to be the unit in degree zero and the second to have a nonzero copy of the coefficient module in every negative degree. They satisfy the displayed input bounds, but internal Hom equals the second input and is not bounded below.
- **E19** (error; a stated result), SW Remark 10.5.7, printed pp. 86–87, correcting the assertion cited there as Scholze (2018), Lemma 8.8: Require only factorization through an almost finitely presented module. When the map is an identity, the module is a retract and hence almost finitely presented. SW explicitly records this correction and proves the factorization lemma. The present relative-finiteness proof uses only factorization and the identity retract argument.
- **E20** (misprint; nothing), BH arXiv:2101.09759v2, proof of Theorem 3.10, p. 18: It is a dense Zariski-open subset of the reduced target Y, and the restricted map is X×_Y U→U. Theorem 2.29 is a statement about an open of Y; the same proof then restricts over its closed complement in Y.

- **E21** (misprint; a stated result), Z arXiv:2111.01830v3, Theorem/Definition 3.4.13, equation (3.7), p. 43; compare Theorem 3.4.12, p. 42, and Remark 3.4.15, p. 44: Use the identity on that left vertical arrow, so Ψ′=j∘Φ⁻¹=Sch⁻¹. Equivalently, if the scalar arrow is retained, scale the bottom inverse by the same scalar. Equation (3.6) says Φ=Sch∘j. The displayed (3.7) would therefore give Ψ′=(1−ζ_p)⁻ⁿSch⁻¹, contrary to Remark 3.4.15 and the smooth integral inverse of Theorem/Definition 3.3.4. The latter square uses inclusion of the image lattice; its scalar appears in both inverse and twist and cancels. The discrepancy is already detected in degree one on the smooth torus.

The weight-line multiplication, derived trace shift and rational inverse normalization affect the main proof. E21 removes the extra scalar in the rational inverse square: Φ=Sch∘j forces Ψ′=j∘Φ⁻¹=Sch⁻¹, matching the smooth integral construction. All 21 discrepancies have independent confirmed verdicts in the packet; these verdicts concern the identified versions. In the nodal algebra uv=ϖ, opposite normalized weight lines multiply into ϖO_C, so they do not form a strongly graded integral algebra. The plan instead uses the monomial projection and derived Ext calculation. For a smooth proper curve, a top trace is a map to Λ[−2]; leaving the derived coefficient target unshifted cannot give the stated duality.

## Sources and reading record

- **Z** — Bogdan Zavyalov, [Mod-p Poincaré Duality in p-adic analytic geometry](https://arxiv.org/pdf/2111.01830v3). arXiv:2111.01830v3, 21 February 2024; preprint page and theorem numbers throughout. Published in Annals of Mathematics 201 (2025), 647–773; the published text was not compared. Read: §§1–5, pp. 1–83; Appendices A–D, pp. 84–99; references. Accessed 19 October 2026.
- **AC** — Bogdan Zavyalov, [Almost coherent modules and almost coherent sheaves](https://arxiv.org/pdf/2110.10773v3). arXiv:2110.10773v3, 28 August 2022; numbering used by Z. Latest v5 (16 March 2026) checked at the affected §4.9 and §5.5 statements only. Read: §§4.5–4.9, pp. 94–114 (definitions, affine equivalences and Hom); §5.1, pp. 114–118; §5.5, pp. 129–131; §6.13, pp. 170–172. Accessed 19 October 2026.
- **SW** — Peter Scholze and Jared Weinstein, [Berkeley lectures on p-adic geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf). Authors’ version, 27 March 2020, §10.5, printed pp. 82–89; read in the maintainer’s cleared library. Annals of Mathematics Studies 207, Princeton University Press, 2020. Read: §10.5, Theorem 10.5.1 through the proof of Proposition 10.5.10, pp. 82–89. Accessed 19 October 2026.
- **BH** — Bhargav Bhatt and David Hansen, [The six functors for Zariski-constructible sheaves in rigid geometry](https://arxiv.org/pdf/2101.09759v2). arXiv:2101.09759v2, 22 September 2021; preprint page numbers. Compositio Mathematica 158 (2022), 437–482. Read: Introduction and Definition 3.1; §2.3, Theorems 2.27 and 2.29, pp. 13–14; §§3.1–3.3, pp. 14–20; §3.5, Lemma 3.25 and its proof, p. 25. Accessed 19 October 2026.
- **H** — Ben Heuer, [A p-adic Simpson correspondence for smooth proper rigid varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf). Inventiones Mathematicae 240 (2025), 261–312; published open-access PDF. Read: Conventions on the algebraically closed field, §1; §2.6, Proposition 2.18 and proof, p. 279. Accessed 19 October 2026.
- **U** — Bogdan Zavyalov, [Altered Local Uniformization Of Rigid-Analytic Spaces](https://arxiv.org/pdf/2102.04752). Author’s current arXiv PDF of 2102.04752, accessed 19 October 2026; only the main theorem statements read. Published in Israel Journal of Mathematics 263 (2024). Read: Introduction, Theorems 1.3–1.4, pp. 4–5; proof not independently decomposed here. Accessed 19 October 2026.
- **PS** — Peter Scholze, [Perfectoid spaces: a survey](https://arxiv.org/pdf/1303.5948). Author’s arXiv:1303.5948 version in the cleared library; printed pages. Read: §3.2, Theorem 3.17 and proof, pp. 19–20; surrounding constructible comparison argument, pp. 17–19. Accessed 19 October 2026.

The Berkeley lectures and Scholze survey were read in the maintainer-cleared library in place. Public paper PDFs were used only in scratch space, and their SHA-256 hashes are recorded in the packet. No source passages or source files are included. The proof of U’s altered local uniformization, Hansen’s comparison/branched-cover proofs and the full external proof inputs in G1–G5 were not read or independently decomposed; their precise required conclusions are retained above.
