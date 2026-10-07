# H.5 — Rigid loci, arithmetic models and integral variations

This layer of *Hodge structures (pure, mixed, and polarized), Part II* develops the theory of **rigid local systems** on smooth complex varieties: the notions of rigidity and cohomological rigidity with fixed determinant and, on quasi-projective varieties, fixed local monodromy at infinity; the Hodge-theoretic consequences of rigidity (rigid Higgs fields are nilpotent, rigid local systems underlie complex variations of Hodge structure, the rigid locus of the Hodge moduli splits over the affine line); the **arithmetic models** over which the finitely many rigid objects spread; and **integrality**, together with the distinction between integral and strongly integral monodromy and its interaction with unitarity.

The layer starts where layer H.1 stops. H.1 constructs the stable fixed-determinant Betti, de Rham, Dolbeault and Hodge moduli of a smooth projective complex variety, the Riemann–Hilbert analytic isomorphism, the non-abelian Hodge homeomorphism, the Hitchin morphism and Simpson's local product for the Hodge moduli; H.0 supplies Higgs fields, λ-connections, Griffiths filtrations, their graded Higgs fields and the Rees construction. This layer uses those objects and plans what is particular to rigid objects. Polarized complex variations of Hodge structure (their carrier, semisimplicity, uniqueness of the variation on an irreducible local system up to shift, and Schmid's extension theorem) belong to layer H.2; the Artinian unitary vanishing theorem of Landesman–Litt and the parabolic semistability bounds belong to layer H.4. Both are cited as prerequisites.

The sources are Esnault–Groechenig, *Rigid connections and F-isocrystals* (Acta Math. 2020) §§1–3, 4.2, 5.1, 6 and 8; Esnault–Groechenig, *Cohomologically rigid local systems and integrality* (2018); Klevdal–Patrikis, *G-rigid local systems are integral*; Landesman–Litt, *Canonical representations of surface groups* §§1.10, 4.3, 8 and 9.1, and *Geometric local systems on very general curves and isomonodromy* §§1.2 and 7; Simpson, *Higgs bundles and local systems* §4 and *The Hodge filtration on nonabelian cohomology* §§7, 9, 10; Langer, *Semistable modules over Lie algebroids in positive characteristic* §1; Langer–Simpson, *Rank 3 rigid representations of projective fundamental groups*; Brunebarbe–Klingler–Totaro, *Symmetric differentials and the fundamental group*. The register below cites the passage behind each declaration.

The layer exports to the successors that Esnault–Groechenig's paper also feeds: the Cartier-transform and Higgs–de Rham-flow theory of rigid connections modulo p (*Crystalline cohomology, Part II: Cartier transforms and periodic rigid connections*) consumes the nice arithmetic models, the nilpotence of spread Higgs fields and the rigid Hodge families; the rigid-companion theory (*P-adic differential equations, Part II: rigid connections and companions*) consumes the criterion that a polarized variation is unitary exactly when its graded Higgs field vanishes, together with the integral-versus-strongly-integral finiteness criteria; the mapping-class-group roadmap of Landesman–Litt consumes rigidity on versal families and integrality. None of these consumers is imported here.

## Conventions (pinned)

- **Trace-free coefficients.** Every tangent space and every rigidity condition uses the trace-free adjoint representation ad⁰ρ = g^der with Ad∘ρ; for GL_r and PGL_r this is sl_r ≅ pgl_r (Landesman–Litt's *ad ρ*, Klevdal–Patrikis' *g^der*, Esnault–Groechenig's End⁰). The full adjoint End is never used: on a variety with b₁ > 0 it would add H¹(X, ℂ) and no local system would be cohomologically rigid.
- **Fixed determinant.** The determinant is fixed as a flat line bundle (L, ∇_L), as a character δ, or as a Higgs line bundle (L, 0), with L torsion of order d; fixing only the underlying line bundle is a different moduli problem.
- **Rigid** means isolated in the fixed-determinant moduli (with prescribed local monodromy classes on quasi-projective X); the isolated point need not be reduced. Isolation in M_B(X, GL_n) without fixed determinant (the convention of Brunebarbe–Klingler–Totaro's Theorem 4.1) is stated separately whenever it is used.
- **Cohomologically rigid** means H¹(U, a_* ad⁰ρ) = 0 for a good compactification X ⊂ X̄ with U = X̄ ∖ D_sing; group-theoretically, the restriction H¹(π₁(X), ad⁰ρ) → ⊕_i H¹(⟨T_i⟩, ad⁰ρ) to the boundary loops is injective. It equals H¹(X̄, j_{!*} ad⁰ρ) = 0. **Strongly cohomologically rigid** means H¹(X, ad⁰ρ) = 0. On projective X both are H¹(π₁(X), ad⁰ρ) = 0 = H¹_dR(X, End⁰(E, ∇)).
- **Quasi-unipotent at infinity**: every local monodromy ρ(T_i) has all eigenvalues roots of unity.
- **Unitary** means that the image has compact closure, equivalently that a positive-definite Hermitian form is preserved, equivalently conjugacy into U(r). It depends on the embedding of the coefficients into ℂ and is not preserved by field automorphisms of ℂ.
- **Integral** means GL_r(ℂ)-conjugate (G(ℂ)-conjugate) into G(𝒪_K) for a number field K ⊂ ℂ, over the full ring of integers; for finitely generated groups this is conjugacy into GL_r(ℤ̄). **Strongly integral** means conjugate into GL_r(ℤ). Integral over a ring of S-integers is a different, weaker notion.
- **Complex variations of Hodge structure** are polarized in Simpson's sense: a C^∞ decomposition V = ⊕ V^{p,q}, a flat connection satisfying Griffiths transversality and a flat Hermitian form of sign (−1)^p on V^{p,q}. No real, rational or integral lattice is part of the structure. Their graded Higgs field gr_F ∇ is called the Kodaira–Spencer field.
- **Scaling.** 𝔾_m acts on Higgs moduli by θ ↦ tθ and on the Hodge moduli by (λ, E, D) ↦ (tλ, E, tD), with weight one on 𝔸¹; the Hitchin morphism has weight i on H⁰(X, Sym^i Ω¹).
- **Rigid locus** of a morphism f locally of finite type is Mathlib's quasi-finite locus `f.quasiFiniteLocus`, with its scheme structure.
- **Arithmetic model**: a finitely generated subring R̃ ⊂ ℂ smooth over ℤ with d invertible, a smooth projective model with geometrically connected fibres, a section and the spread torsion line bundle with its trivialization of L^{⊗d}; restrictions to R̃[1/f] are again models.
- **Geometric origin**: a subquotient, on a dense open, of R^i f_* ℂ for a smooth projective f (Landesman–Litt allow smooth proper f; each consumer states which variant it uses).

## Library baseline

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration below was read in its source file at the pinned commit; the layer plans nothing that they already provide. In particular Esnault–Groechenig's relative rigid locus (their Definition 3.2) is Mathlib's quasi-finite locus, with openness from Mathlib's Zariski main theorem, so it is cited rather than planned.

- `mathlib:AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite` (lemma, `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean`): A proper, locally quasi-finite morphism (separated, finite type) is finite.
- `mathlib:AlgebraicGeometry.LocallyQuasiFinite` (class, `Mathlib/AlgebraicGeometry/Morphisms/QuasiFinite.lean`): Morphisms whose affine-local ring maps are quasi-finite; discrete finite fibres for quasi-compact morphisms.
- `mathlib:AlgebraicGeometry.Scheme.Hom.isOpen_quasiFiniteAt` (lemma, `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean`): If f is locally of finite type, {x | f.QuasiFiniteAt x} is open (consequence of Zariski's main theorem).
- `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteAt_iff_isOpen_singleton_asFiber` (lemma, `Mathlib/AlgebraicGeometry/Morphisms/QuasiFinite.lean`): For f locally of finite type, f is quasi-finite at x iff {x} is open in its fibre.
- `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteLocus` (def, `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean`): For f: X ⟶ Y locally of finite type, the open subscheme of points at which f is quasi-finite: Esnault–Groechenig's X^rig.
- `mathlib:AlgebraicGeometry.Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType` (lemma, `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean`): For a cofiltered limit of schemes with affine transition maps and X locally of finite type over S, two morphisms D_i ⟶ X over S that agree on the limit agree at some stage k ⟶ i (EGA IV 8.8.2(i), equality part).
- `mathlib:LieAlgebra.SpecialLinear.sl` (def, `Mathlib/Algebra/Lie/Classical.lean`): The special linear Lie subalgebra of Matrix n n R: the kernel of the trace.
- `mathlib:LinearMap.isNilpotent_iff_charpoly` (lemma, `Mathlib/LinearAlgebra/Eigenspace/Zero.lean`): An endomorphism of a finite free module over a nontrivial commutative ring is nilpotent iff its characteristic polynomial is X^(finrank).
- `mathlib:Matrix.GeneralLinearGroup` (abbrev, `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`): GL n R := (Matrix n n R)ˣ.
- `mathlib:Matrix.trace` (def, `Mathlib/LinearAlgebra/Matrix/Trace.lean`): The trace of a square matrix: the sum of its diagonal entries.
- `mathlib:Matrix.unitaryGroup` (abbrev, `Mathlib/LinearAlgebra/UnitaryGroup.lean`): The submonoid unitary (Matrix n n α) of matrices whose star-transpose is the inverse.
- `mathlib:NumberField.Embeddings.finite_of_norm_le` (theorem, `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean`): For a number field K, the set of algebraic integers x ∈ K with ‖φ x‖ ≤ B for every embedding φ: K →+* A is finite.
- `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one` (theorem, `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean`): Kronecker: an algebraic integer all of whose conjugates have norm one is a root of unity.
- `mathlib:Representation` (abbrev, `Mathlib/RepresentationTheory/Basic.lean`): Representation k G V := G →* V →ₗ[k] V.
- `mathlib:Representation.IsIrreducible` (abbrev, `Mathlib/RepresentationTheory/Irreducible.lean`): A representation is irreducible if its lattice of subrepresentations is a simple order (nontrivial, no proper nonzero subrepresentation).
- `mathlib:entry_norm_bound_of_unitary` (theorem, `Mathlib/Analysis/CStarAlgebra/Matrix.lean`): Every entry of a unitary matrix over an RCLike field has norm at most 1 (root namespace).
- `mathlib:groupCohomology.H1` (abbrev, `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean`): H¹(G, A) := groupCohomology A 1 for A : Rep k G, computed by inhomogeneous cocycles modulo coboundaries.
- `mathlib:groupCohomology.H1InfRes` (def, `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean`): For a normal subgroup S ≤ G, the short complex H¹(G ⧸ S, A^S) ⟶ H¹(G, A) ⟶ H¹(S, A) (inflation and restriction), with the inflation a monomorphism.
- `mathlib:groupCohomology.H1InfRes_exact` (lemma, `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean`): The inflation–restriction short complex for H¹ is exact.
- `tauceti:TauCeti.LocalCoefficientSystem` (abbrev, `TauCeti/AlgebraicTopology/LocalCoefficient.lean`): A module-valued local coefficient system on a topological space: a functor from its fundamental groupoid to ModuleCat R.
- `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation` (def, `TauCeti/AlgebraicTopology/LocalCoefficient.lean`): The monodromy representation of a local coefficient system at a base point, a Representation of the fundamental group on the fibre.
- `tauceti:TauCeti.Matrix.isCompact_unitaryGroup` (theorem, `TauCeti/Topology/Algebra/UnitaryGroup.lean`): The unitary group Matrix.unitaryGroup n 𝕜 over ℝ or ℂ is a compact subset of Matrix n n 𝕜.

## Layer at a glance

The layer has 54 declarations (1 application, 3 comparisons, 6 constructions, 13 definitions, 1 lemma, 30 theorems), 140 API items and 84 unit tests. Its planets are *Rigid local system*, *Cohomological rigidity*, *Rigid local systems are variations*, *Splitting of the rigid Hodge locus*, *Nice arithmetic models*, *Integrality of rigid local systems*.

For the atlas the layer is presented in four sub-layers, H.5a–H.5d, listed with their nodes in the packet's restructuring proposal; every node keeps the parent stage HodgeStructuresPartII:H.5.

## H.5a. Rigidity and rigid loci

The first group fixes the coefficient system and the rigidity notions. The tangent space to the moduli of G-irreducible representations of a finitely generated group with fixed abelianization and prescribed classes at chosen elements is the kernel of restriction on H¹(Γ, g^der) (Klevdal–Patrikis Proposition 4.6); for the fixed-determinant Betti moduli of H.1 it is H¹(Γ, ad⁰ρ). Rigidity is isolation of the moduli point, cohomological rigidity its reduced form. On a quasi-projective variety the boundary enters through a good compactification and the local monodromy loops, and the moduli with prescribed local monodromy (Esnault–Groechenig 2018 §2) has tangent space H¹(U, a_* End⁰V), which equals the first cohomology of the intermediate extension. Rigid objects correspond across the three moduli spaces of H.1, are finite in number, are permuted by field automorphisms of ℂ and are defined over number fields. The rigid locus of a moduli scheme is Mathlib's quasi-finite locus, which the following groups apply over ℂ, over the affine line and over arithmetic bases.

### Trace-free adjoint coefficients

**Definition:** `TraceFreeAdjoint.rep`. Node: `HodgeStructuresPartII:H.5/trace-free-adjoint`.

Let K be a field, Γ a group and G a split connected reductive group over K with derived group G^der and Lie algebra g^der. For a homomorphism ρ: Γ → G(K), the trace-free adjoint representation ad⁰ρ is the K-vector space g^der(K) on which γ ∈ Γ acts by Ad(ρ(γ)). For G = GL_r, g^der = sl_r(K) = {A ∈ M_r(K) : tr A = 0} and γ·A = ρ(γ) A ρ(γ)⁻¹; for G = PGL_r, ad⁰ρ is pgl_r(K) = M_r(K)/K·1 with the induced conjugation action, and sl_r(K) → pgl_r(K) is a Γ-equivariant isomorphism when r is invertible in K. For a flat bundle (E,∇) on a complex manifold the trace-free endomorphism bundle End⁰(E,∇) = ker(tr: End(E) → O) carries the induced flat connection; its local system of horizontal sections End⁰(V) has monodromy ad⁰ρ, where ρ is the monodromy of V = E^∇. For a Higgs bundle (E,θ) the trace-free endomorphisms carry the induced Higgs field [θ, −]. This is the coefficient object of every tangent space and every rigidity condition in this layer (the convention 'ad ρ' of Landesman–Litt and 'g^der' of Klevdal–Patrikis).

**Hypotheses.**

- K is a field; Γ is any group; ρ is a group homomorphism into G(K).
- The splitting End = End⁰ ⊕ (scalars) and the identification sl_r ≅ pgl_r require r to be invertible in K; neither is part of the definition.
- For the flat-bundle and Higgs versions, E is a vector bundle on a complex manifold (or smooth variety) X and the trace is the fibrewise matrix trace.

**Proof or construction.**

1. Define the action on sl_r(K) by conjugation through ρ; trace is conjugation invariant, so tr(ρ(γ)Aρ(γ)⁻¹) = tr A and sl_r(K) is Γ-stable.
2. For general split reductive G use Ad: G → GL(g^der) composed with ρ (Klevdal–Patrikis Definition 1.1, Landesman–Litt Notation 1.10.2).
3. For the flat bundle, the trace End(E) → O_X is horizontal for the induced connection on End(E) and the trivial connection d on O_X, so its kernel is a flat subbundle; at the base point x its fibre with monodromy is sl(E_x) with conjugation by ρ.

**Uses.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, §7 p.148: H¹(X, End⁰(E,∇)) = 0 defines cohomological rigidity and is the Zariski tangent space of M_dR(X/C,L,r).
- Esnault–Groechenig, Cohomologically rigid local systems and integrality, §1 and Proposition 2.3: H¹(U, a_* End⁰(V)) is the tangent space of the moduli stack with prescribed determinant and local monodromies.
- Landesman–Litt, Canonical representations of surface groups, Notation 1.10.2 and Definition 8.1.1: ad ρ := Ad ∘ ρ on g^der is the coefficient system of (strong) cohomological rigidity for GL_r- and PGL_r-local systems.
- Klevdal–Patrikis, G-rigid local systems are integral, Definition 1.1 and Proposition 4.6: g^der with the adjoint action is the coefficient module of G-cohomological rigidity and of the tangent space.
- HodgeStructuresPartII:H.5/betti-tangent, HodgeStructuresPartII:H.5/cohomological-rigidity, HodgeStructuresPartII:H.5/versal-unitary-rigidity: Tangent spaces, rigidity predicates and the Leray vanishing argument are all stated with these coefficients.

**API.**

- `TraceFreeAdjoint.rep` (constructor): For ρ: Γ → GL_r(K), the K-linear representation of Γ on sl_r(K), γ ↦ (A ↦ ρ(γ)Aρ(γ)⁻¹).
- `TraceFreeAdjoint.rep_apply` (simp): rep ρ γ A = ρ(γ) * A * ρ(γ)⁻¹ as matrices.
- `TraceFreeAdjoint.endSplitting` (equivalence): If (r : K) ≠ 0, the Γ-representation M_r(K) by conjugation is isomorphic to rep ρ ⊕ (trivial K), via A ↦ (A − (tr A / r)·1, tr A / r).
- `TraceFreeAdjoint.conjEquiv` (functoriality): If σ = P ρ P⁻¹ for P ∈ GL_r(K), then A ↦ PAP⁻¹ is an isomorphism rep ρ ≅ rep σ.
- `TraceFreeAdjoint.twist` (relation): For a character χ: Γ → K^×, rep (χ·ρ) = rep ρ (scalars commute with all matrices).
- `TraceFreeAdjoint.projectivization` (compatibility): rep ρ depends only on the composite Γ → PGL_r(K) and, when r ∈ K^×, agrees with the adjoint representation on Lie(PGL_r) = pgl_r(K).
- `TraceFreeAdjoint.invariants_eq_bot` (characterisation): If ρ is absolutely irreducible and r ∈ K^×, then the Γ-invariants of rep ρ are zero (Schur's lemma: commuting matrices are scalars, and the only trace-zero scalar is 0).
- `TraceFreeAdjoint.baseChange` (compatibility): For a field embedding σ: K → L, rep (σ ∘ ρ) ≅ (rep ρ) ⊗_{K,σ} L, and for finitely generated Γ, H¹(Γ, rep(σ∘ρ)) ≅ H¹(Γ, rep ρ) ⊗_{K,σ} L (the cocycle space is cut out by K-linear equations in finitely many generator values).
- `TraceFreeAdjoint.flatBundle` (compatibility): For a flat bundle (E,∇) on a connected complex manifold with monodromy ρ at x, the local system of horizontal sections of End⁰(E,∇) has monodromy representation rep ρ, under TauCeti.LocalCoefficientSystem.monodromyRepresentation.

**Unit tests.**

- `TraceFreeAdjoint.test_rank_one` (degenerate): For r = 1 and any character ρ: Γ → GL_1(K), ad⁰ρ = 0, hence H¹(Γ, ad⁰ρ) = 0.
- `TraceFreeAdjoint.test_trivial_free_abelian` (computation): For Γ = ℤ², K = ℂ and ρ trivial of rank r, H¹(Γ, ad⁰ρ) = Hom(ℤ², sl_r(ℂ)) has dimension 2(r² − 1).
- `TraceFreeAdjoint.test_full_adjoint_differs` (non-example): For Γ = ℤ and ρ the trivial character of rank 1, H¹(Γ, M_1(ℂ)) = ℂ ≠ 0 while H¹(Γ, ad⁰ρ) = 0: using End in place of End⁰ would make every rank-one local system on a circle non-rigid.
- `TraceFreeAdjoint.test_char_two_no_splitting` (non-example): Over K = 𝔽₂ and r = 2, the identity matrix has trace 0, so 1 ∈ sl_2(𝔽₂) and M_2(𝔽₂) ≠ sl_2(𝔽₂) ⊕ 𝔽₂·1: the trace splitting is not unconditional.
- `TraceFreeAdjoint.test_irreducible_no_invariants` (characterisation): For the irreducible two-dimensional complex representation ρ of the symmetric group S₃, the invariants (ad⁰ρ)^{S₃} are zero.

**Acceptance.** For r = 1 the representation is zero. Over a field where r is invertible, M_r(K) = sl_r(K) ⊕ K·1 as Γ-representations, so H¹(Γ, M_r(K)) = H¹(Γ, ad⁰ρ) ⊕ H¹(Γ, K). Matches Landesman–Litt's ad ρ for GL_r and PGL_r and Klevdal–Patrikis' g^der.

**Direct dependencies.** `mathlib:LieAlgebra.SpecialLinear.sl`, `mathlib:Matrix.trace`, `mathlib:Representation`, `mathlib:Representation.IsIrreducible`, `mathlib:groupCohomology.H1`, `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`, `HodgeStructuresPartII:H.0/twisted-higgs`.

**Source passages.**

- [LL24](https://arxiv.org/pdf/2205.15352v4), §1.10, Notation 1.10.2, p.10: “For G an algebraic group with derived subgroup Gder and corresponding Lie algebra gder , we use Ad : G → GL(gder ) to denote the natural action of G on gder by conjugation.” — Pins ad ρ as Ad∘ρ on g^der, which for GL_r and PGL_r is the trace-free (pgl_r) coefficient system.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §7, p.148: “that is (E, ∇) is rigid and in addition its moduli point [(E, ∇)]∈MdR (X/C, L, r) is smooth.” — The trace-free endomorphisms End⁰(E,∇) are the coefficients of cohomological rigidity on the fixed-determinant moduli.
- [KP20](https://arxiv.org/pdf/2009.07350v2), §1, Definition 1.1, p.2: “is G-cohomologically rigid if H 1 (X, j!∗ gder ) = 0, where gder is the Lie algebra of the derived group of G, regarded as a local system on X via the composite Ad ◦ ρ.” — General reductive G: the coefficient module is g^der with Ad∘ρ.

**Suggested file.** 13 names declared or stated as examples; 1 listed in the omission inventory (missing carriers: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology).

### Tangent spaces of representation moduli with fixed boundary data

**Theorem:** `tangentSpace_eq_H1`. Node: `HodgeStructuresPartII:H.5/betti-tangent`.

Let K be a field of characteristic zero, Γ a finitely generated group, G a split connected reductive group over K with maximal abelian quotient A, θ: Γ → A(K) a homomorphism, γ_1,…,γ_N ∈ Γ and K_1,…,K_N ⊂ G locally closed conjugacy classes defined over K. Let M = M(Γ, θ, (γ_i, K_i)) be the finite-type stack of G-irreducible representations with abelianization θ and ρ(γ_i) ∈ K_i (HodgeStructuresPartII:H.5/prescribed-monodromy-moduli). For a G-irreducible ρ₀: Γ → G(K) in M(K), the Zariski tangent space of M at [ρ₀] is the kernel of the restriction map H¹(Γ, g^der) → ⊕_{i=1}^{N} H¹(γ_i^ℤ, g^der), with coefficients ad⁰ρ₀. In particular, for G = GL_r, θ = δ the determinant and N = 0: the representation scheme R_B(Γ, r, δ) has tangent space Z¹(Γ, ad⁰ρ) at ρ, and for absolutely irreducible ρ the stable fixed-determinant Betti moduli has Zariski tangent space H¹(Γ, ad⁰ρ) at [ρ]; for K = ℂ and Γ finitely presented this is the coarse space M_B^s(Γ, r, δ) of HodgeStructuresPartII:H.1/betti-coarse, and for other K (a number field in the integrality applications) the moduli is the K-form constructed in HodgeStructuresPartII:H.5/prescribed-monodromy-moduli. Since the automorphism group of a stable fixed-determinant object is the finite étale group μ_r in characteristic zero, the stack and its coarse space have the same tangent spaces at stable points.

**Hypotheses.**

- Γ is finitely generated (the representation scheme is then of finite type; finite presentation is not needed for the tangent-space computation).
- K has characteristic zero, so μ_r is étale and the trace splitting holds.
- ρ₀ is G-irreducible (for GL_r: absolutely irreducible); at reducible points the coarse tangent space is not H¹.

**Proof or construction.**

1. A K[ε]-point of R_B(Γ, r, δ) lifting ρ is γ ↦ (1 + εc(γ))ρ(γ); the homomorphism property is the cocycle identity c(γγ′) = c(γ) + ρ(γ)c(γ′)ρ(γ)⁻¹, and det = δ forces tr c(γ) = 0 (Klevdal–Patrikis Proposition 4.6 proof).
2. Conjugation by 1 + εX changes c by the coboundary γ ↦ X − ρ(γ)Xρ(γ)⁻¹, so the tangent space to the orbit is B¹(Γ, ad⁰ρ); scalars act trivially, so the trace part of X is irrelevant.
3. At an absolutely irreducible ρ the projective linear group acts freely on R_B^s and R_B^s → M_B^s is a principal PGL_r-bundle for the étale topology (HodgeStructuresPartII:H.1/betti-coarse, HodgeStructuresPartII:H.1/stable-automorphisms; Luna's étale slice, requested from AlgebraicModuliForArithmeticGeometry:R09.5); hence T_[ρ] M_B^s = Z¹/B¹ = H¹(Γ, ad⁰ρ).
4. The condition ρ(γ_i) ∈ K_i: the tangent space of K_i at ρ(γ_i) is {[X, ρ(γ_i)]}, so a first-order deformation stays in K_i exactly when the restricted cocycle c|_{γ_i^ℤ} is a coboundary; this gives the kernel of restriction (Klevdal–Patrikis Proposition 4.6).

**Acceptance.** For Γ free of rank 2, r = 2 and δ = 1, dim H¹(Γ, ad⁰ρ) = 2·3 − 3 = 3 at every absolutely irreducible ρ, matching dim M_B^s(F_2, 2, 1) = 3. For finite Γ the tangent space is zero at every irreducible ρ, since H¹ of a finite group with coefficients in a characteristic-zero vector space vanishes. For N = 0 the statement reduces to H¹(Γ, ad⁰ρ) computed by Mathlib's groupCohomology.H1 of the trace-free adjoint representation.

**Direct dependencies.** `HodgeStructuresPartII:H.5/trace-free-adjoint`, `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`, `HodgeStructuresPartII:H.1/betti-framed`, `HodgeStructuresPartII:H.1/betti-coarse`, `HodgeStructuresPartII:H.1/stable-automorphisms`, `mathlib:groupCohomology.H1`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Source passages.**

- [KP20](https://arxiv.org/pdf/2009.07350v2), §4, Proposition 4.6, pp.8–9: “Proposition 4.6. Let gder be the Lie algebra of Gder . Then the Zariski tangent space T[ρ0 ] M is the kernel of” — Tangent space of the moduli of G-irreducible representations with prescribed classes is the kernel of restriction on H¹(Γ, g^der).
- [EG18](https://arxiv.org/pdf/1711.06436v3), §2, Proposition 2.3, p.5: “The Zariski tangent space T[V] at a point [V] ∈ M associated to V defined over K is the finite dimensional K-vector space H 1 (U, a∗ End0 (V)).” — The GL_r case with prescribed local monodromy, in topological form.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §7, p.148: “it is straightforward to see that H 1 (X, End0 (E, ∇))=0 is the Zariski tangent space of MdR (X/C, L, r) at the moduli point.” — Projective case: the trace-free H¹ is the tangent space of the fixed-determinant moduli.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions).

### Rigid representations with fixed determinant

**Definition:** `IsRigidRepresentation`. Node: `HodgeStructuresPartII:H.5/rigid-representation`. Planet: *Rigid local system*.

Let Γ be a finitely generated group, r ≥ 1 and δ: Γ → ℂ^× a character. An absolutely irreducible representation ρ: Γ → GL_r(ℂ) with det ρ = δ is rigid if its class [ρ] is an isolated point of the stable fixed-determinant Betti moduli M_B^s(Γ, r, δ) (HodgeStructuresPartII:H.1/betti-coarse); for a finite-type complex scheme, isolation in the Zariski and in the analytic topology agree. Equivalently, the GL_r(ℂ)-conjugation orbit of ρ is open in R_B(Γ, r, δ)(ℂ) for the analytic topology: this is the fixed-determinant analogue of Simpson's orbit condition, which Simpson states in Hom(π₁, G) and which for G = SL_r and δ = 1 is literally this one. With boundary data (Γ = π₁(X) for a smooth quasi-projective X and local monodromy classes K_i, HodgeStructuresPartII:H.5/boundary-monodromy-data) rigid means isolated in the moduli M(Γ, r, δ, (γ_i, K_i)) of HodgeStructuresPartII:H.5/prescribed-monodromy-moduli; for a split reductive G, a G-irreducible ρ with fixed abelianization is rigid if it is isolated in the corresponding G-moduli. An isolated point is not assumed to be reduced. Isolation in the moduli M_B(Γ, GL_r) without fixed determinant is a different, stronger condition and is never what 'rigid' means here.

**Hypotheses.**

- Γ finitely generated; r ≥ 1; δ is the fixed determinant character (finite order in every application of this layer).
- ρ absolutely irreducible (for G: G-irreducible, image in no proper parabolic subgroup).
- The ambient moduli is the fixed-determinant (fixed-abelianization) one; prescribed boundary classes are part of the data when present.

**Proof or construction.**

1. Define IsRigid ρ as isolation of the point [ρ] in M_B^s(Γ, r, δ)(ℂ); the analytic and Zariski notions agree because a finite-type ℂ-scheme has finitely many irreducible components, and a point is isolated in either topology exactly when it is an irreducible component.
2. Simpson's orbit formulation: R_B^s → M_B^s is a geometric quotient whose fibres are the conjugation orbits and which is open (a principal PGL_r-bundle); so [ρ] is isolated iff the orbit, the preimage of [ρ], is open in R_B^s(ℂ), which is open in R_B(ℂ).
3. The boundary and G-versions use the stacks of HodgeStructuresPartII:H.5/prescribed-monodromy-moduli and their coarse spaces in the same way.

**Uses.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, Definition 1.1 and Remark 1.2: Rigidity of a flat connection is isolation in the fixed-determinant moduli; via Riemann–Hilbert it is rigidity of the monodromy.
- Simpson, Higgs bundles and local systems, §4 p.51 and Lemma 4.5: A rigid reductive representation is one whose orbit is open; such representations come from complex variations of Hodge structure.
- Esnault–Groechenig, Cohomologically rigid local systems and integrality, Remark 2.2: C-points of zero-dimensional components (rigid local systems) are defined over a finite extension of ℚ.
- HodgeStructuresPartII:H.5/rigid-correspondence, HodgeStructuresPartII:H.5/rigid-number-field, HodgeStructuresPartII:H.5/rigid-underlies-cvhs: Consumers transport and use isolation of moduli points.

**API.**

- `IsRigidRepresentation` (constructor): The predicate on an absolutely irreducible ρ with det ρ = δ: the point [ρ] ∈ M_B^s(Γ, r, δ)(ℂ) is isolated.
- `IsRigidRepresentation.iff_orbit_open` (characterisation): IsRigidRepresentation ρ ↔ the conjugation orbit of ρ is open in R_B(Γ, r, δ)(ℂ) with the analytic topology.
- `IsRigidRepresentation.conj` (functoriality): If σ = PρP⁻¹, then IsRigidRepresentation σ ↔ IsRigidRepresentation ρ.
- `IsRigidRepresentation.twist` (relation): For a character χ: Γ → ℂ^×, ρ is rigid with determinant δ iff χ·ρ is rigid with determinant χ^r δ (tensoring by χ is an isomorphism M_B^s(Γ, r, δ) ≅ M_B^s(Γ, r, χ^r δ)).
- `IsRigidRepresentation.of_cohomologicallyRigid` (relation): H¹(Γ, ad⁰ρ) = 0 implies IsRigidRepresentation ρ (proved in node HodgeStructuresPartII:H.5/coh-rigid-reduced-isolated and re-exported here).
- `IsRigidRepresentation.rankOne` (example): Every rank-one representation is rigid.
- `IsRigidRepresentation.finite` (other): For fixed Γ, r and δ there are finitely many rigid classes (proved in node HodgeStructuresPartII:H.5/rigid-finite and re-exported here).

**Unit tests.**

- `IsRigidRepresentation.test_rank_one` (degenerate): For r = 1, every character ρ = δ is rigid: M_B^s(Γ, 1, δ) is a single reduced point.
- `IsRigidRepresentation.test_free_group` (non-example): For Γ = F_2 free on two generators, r = 2 and δ = 1, no absolutely irreducible ρ is rigid, since M_B^s(F_2, 2, 1) is irreducible of dimension 3.
- `IsRigidRepresentation.test_unfixed_determinant` (non-example): For Γ = ℤ² and r = 1, every character is rigid in the fixed-determinant sense, but no point of M_B(ℤ², GL_1) = (ℂ^×)² is isolated.
- `IsRigidRepresentation.test_finite_group` (computation): If Γ is finite, every absolutely irreducible ρ: Γ → GL_r(ℂ) is rigid, because H¹(Γ, ad⁰ρ) = 0 and the tangent space vanishes (by HodgeStructuresPartII:H.5/betti-tangent and HodgeStructuresPartII:H.5/coh-rigid-reduced-isolated, of which this test is a consumer).

**Acceptance.** Every character (r = 1) is rigid in the fixed-determinant sense. No absolutely irreducible ρ: F_2 → GL_2(ℂ) with δ = 1 is rigid. Rigidity is invariant under conjugation and under replacing ρ by an isomorphic representation.

**Direct dependencies.** `HodgeStructuresPartII:H.1/betti-stable-representation`, `HodgeStructuresPartII:H.1/betti-framed`, `HodgeStructuresPartII:H.1/betti-coarse`, `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`.

**Source passages.**

- [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §4, Rigid representations, p.51: “rigid if every nearby representation is conjugate to it.” — Simpson's orbit condition, of which the fixed-determinant condition here is the analogue.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §1, Definition 1.1, p.104: “is rigid if the corresponding point of the moduli space [(E, ∇)]∈MdR (X, L, r) is isolated.” — Rigidity is isolation in the fixed-determinant moduli.
- [EG18](https://arxiv.org/pdf/1711.06436v3), §2, Remark 2.2, p.5: “The C-points corresponding to 0-dimensional components are isolated points of the mod- uli space (so-called rigid local systems).” — Rigid local systems with prescribed boundary data are isolated points of the prescribed-monodromy moduli.

**Suggested file.** 9 names declared or stated as examples; 2 listed in the omission inventory (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions).

### Absolute irreducibility and rigidity of projective representations

**Definition:** `IsAbsolutelyIrreducible`. Node: `HodgeStructuresPartII:H.5/projective-rigidity`.

Let A be a field and Γ a group. A representation Γ → GL_r(A) is absolutely irreducible if Γ → GL_r(A) → GL_r(Ω) is irreducible for an algebraically closed field Ω ⊃ A (equivalently for every such Ω). A projective representation ρ̄: Γ → PGL_r(A) is absolutely irreducible if for every embedding of A into an algebraically closed field Ω the composite Γ → PGL_r(Ω) leaves no proper nonzero linear subspace of Ω^r invariant (no invariant proper projective linear subspace). For Γ finitely generated, M_B(Γ, PGL_r) is the affine GIT quotient of the finite-type ℤ-scheme Hom(Γ, PGL_r) by conjugation, a coarse moduli scheme of finite type over ℤ; an absolutely irreducible ρ̄: Γ → PGL_r(Ω) is rigid if its point is isolated in the fibre M_B(Γ, PGL_r)_Ω.

**Hypotheses.**

- Γ finitely generated for the moduli statement; A any field.
- The GIT quotient over ℤ is the reductive-group quotient of an affine scheme of finite type (Seshadri's theorem over a universally Japanese base), requested from AlgebraicModuliForArithmeticGeometry:R09.5.

**Proof or construction.**

1. Absolute irreducibility is independent of the algebraically closed Ω because invariant subspaces are cut out by a constructible condition defined over A (irreducibility over Ω is irreducibility of the module over Ω[Γ]).
2. Hom(Γ, PGL_r) is a closed subscheme of PGL_r^n for n generators, hence affine of finite type over ℤ; PGL_r acts by conjugation and the GIT quotient exists over ℤ.
3. Rigidity is isolation in the geometric fibre. Comparison with fixed-determinant GL_r rigidity (Esnault–Groechenig Lemma 5.5, K algebraically closed of characteristic zero, Γ finitely generated, ρ irreducible, any determinant χ): the map R_B(Γ, r, χ) → Hom(Γ, PGL_r) has fibres the twists by Hom(Γ, μ_r), so isolation of the projectivization implies isolation of ρ; conversely, a deformation of ρ_proj over a discrete valuation ring R with residue field K lifts to a deformation of ρ with determinant χ, because the lifting obstruction lies in H²(Γ, μ_r(R)) = H²(Γ, μ_r(K)) and vanishes on the residue field; so non-rigidity of ρ_proj gives non-rigidity of ρ.

**Uses.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, Definition 5.1 and §5: Rigid absolutely irreducible projective representations of π₁ are compared with p-adic representations of arithmetic fundamental groups (Theorem 5.4).
- Landesman–Litt, Canonical representations of surface groups, Proposition 8.2.1 and Lemma 8.3.3: PGL_r-local systems whose fibre restriction is the projectivization of an irreducible unitary local system are cohomologically rigid and integral.
- HodgeStructuresPartII:H.5/integrality-KP: PGL_r is the reductive group with trivial abelianization to which Klevdal–Patrikis' theorem is applied.

**API.**

- `IsAbsolutelyIrreducible` (constructor): Predicate on ρ: Γ → GL_r(A): the base change to an algebraic closure is irreducible (Representation.IsIrreducible after scalar extension).
- `IsAbsolutelyIrreducible.iff_algebraicClosure` (characterisation): Absolute irreducibility can be tested over one algebraically closed extension.
- `ProjectiveRepresentation.IsAbsolutelyIrreducible` (constructor): Predicate on ρ̄: Γ → PGL_r(A): no invariant proper nonzero subspace after every embedding into an algebraically closed field.
- `ProjectiveBettiModuli` (data): The affine finite-type ℤ-scheme M_B(Γ, PGL_r) = Hom(Γ, PGL_r) // PGL_r for finitely generated Γ.
- `ProjectiveRepresentation.IsRigid` (other): Isolation of the point of an absolutely irreducible ρ̄ in the geometric fibre of M_B(Γ, PGL_r).
- `ProjectiveRepresentation.isRigid_iff_fixedDet` (compatibility): For irreducible ρ over an algebraically closed field of characteristic zero, ρ is rigid in M_B^s(Γ, r, det ρ) iff its projectivization is rigid (Esnault–Groechenig Lemma 5.5).
- `ProjectiveRepresentation.liftObstruction` (relation): The central extension 1 → μ_r → SL_r → PGL_r → 1 attaches to ρ̄: Γ → PGL_r(Ω) a class o(ρ̄) ∈ H²(Γ, μ_r(Ω)); ρ̄ lifts to SL_r(Ω) iff o(ρ̄) = 0, and then the lifts with determinant 1 form a torsor under Hom(Γ, μ_r). Projective representations need not lift: the Klein four-group image of diag(1,−1) and [[0,1],[1,0]] in PGL_2(ℂ) does not lift to a homomorphism (ℤ/2)² → GL_2(ℂ).

**Unit tests.**

- `ProjectiveRepresentation.test_rank_one` (degenerate): For r = 1, PGL_1 is trivial, so M_B(Γ, PGL_1) is one point and the unique projective representation is rigid.
- `ProjectiveRepresentation.test_twist_same_class` (characterisation): For ρ: Γ → GL_r(ℂ) and any character χ, the projectivizations of ρ and χ·ρ define the same point of M_B(Γ, PGL_r).
- `ProjectiveRepresentation.test_rotation_not_absolutely_irreducible` (non-example): The rotation representation ℤ → GL_2(ℝ), 1 ↦ [[0,−1],[1,0]], is irreducible over ℝ but not absolutely irreducible: over ℂ it fixes the eigenlines of i and −i.
- `ProjectiveRepresentation.test_fixedDet_comparison` (compatibility): For an irreducible ρ: Γ → GL_r(ℂ), IsRigidRepresentation ρ (with δ = det ρ) holds iff the projectivization of ρ is rigid in M_B(Γ, PGL_r) (Esnault–Groechenig Lemma 5.5).

**Acceptance.** For r = 1, M_B(Γ, PGL_1) is a point and every projective representation is rigid. ρ and χ·ρ have the same projectivization for every character χ. The comparison with fixed-determinant rigidity holds for every irreducible ρ over an algebraically closed field of characteristic zero; no finiteness of the determinant is needed.

**Direct dependencies.** `HodgeStructuresPartII:H.1/betti-framed`, `HodgeStructuresPartII:H.1/betti-coarse`, `mathlib:Representation.IsIrreducible`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `HodgeStructuresPartII:H.5/rigid-representation`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §5, Definition 5.1, p.138: “is said to be absolutely irreducible if the representation G GL(r, A) GL(r, Ω) is irre- ducible, where Ω is any algebraically closed field containing A.” — Definition of absolute irreducibility.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §5, Definition 5.1(c), p.138: “PGL(r)-representations of G, which is also a coarse moduli scheme of finite type defined over Z. An isolated point is called rigid.” — The PGL_r character scheme over ℤ and rigidity as isolation.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §5, proof of Lemma 5.5, p.140: “Since μn (R)=μn (K), and the obstruction vanishes over the residue field (indeed, %proj is the projectivization of %), we see that the obstruction vanishes also over R.” — Lifting projective deformations with fixed determinant: rigidity of ρ and of ρ_proj agree.

**Suggested file.** 3 names declared or stated as examples; 8 listed in the omission inventory (missing carriers: projective linear groups PGL_r and projective representations).

### Cohomological rigidity

**Definition:** `IsCohomologicallyRigid`. Node: `HodgeStructuresPartII:H.5/cohomological-rigidity`. Planet: *Cohomological rigidity*.

Let X be a smooth connected quasi-projective complex variety, j: X → X̄ a good compactification with strict normal crossings boundary D = D_1 ∪ … ∪ D_N, U = X̄ ∖ D_sing and a: X → U the inclusion (HodgeStructuresPartII:H.5/boundary-monodromy-data). Let G be a split connected reductive group over ℂ and ρ: π₁(X, x) → G(ℂ) a representation. ρ is cohomologically rigid if H¹(U, a_* g^der) = 0, where g^der is the local system of ad⁰ρ (HodgeStructuresPartII:H.5/trace-free-adjoint); equivalently the kernel of H¹(π₁(X,x), ad⁰ρ) → ⊕_i H¹(⟨T_i⟩, ad⁰ρ) vanishes, where T_i are local monodromy loops; equivalently H¹(X̄, j_{!*} g^der) = 0 (HodgeStructuresPartII:H.5/intermediate-extension-h1). A local system or flat bundle is cohomologically rigid if its monodromy is. When X is projective (D = ∅) the condition is H¹(X, End⁰(V)) = H¹(π₁(X,x), ad⁰ρ) = 0 and, for the corresponding algebraic flat connection, H¹_dR(X, End⁰(E,∇)) = 0. The predicate is relative to the chosen good compactification; strong cohomological rigidity implies it for every good compactification (HodgeStructuresPartII:H.5/strong-implies-cohomological), and for X projective there is no choice.

**Hypotheses.**

- X smooth connected quasi-projective over ℂ with a chosen good compactification; G split connected reductive (GL_r in Esnault–Groechenig, general in Klevdal–Patrikis and Landesman–Litt).
- The predicate is purely cohomological. Quasi-unipotent local monodromy is a separate hypothesis of the consumers, as in Klevdal–Patrikis (Definition 1.1 lists it separately; Theorem 1.2 assumes it) and Esnault–Groechenig's Theorem 1.1; Landesman–Litt build it into their Definition 8.1.1.
- Coefficients are trace-free (g^der), never the full adjoint: with End(V) the condition would include H¹(X, ℂ) = 0.

**Proof or construction.**

1. Define the predicate by vanishing of H¹(U, a_* ad⁰ρ), the tangent space of the prescribed-monodromy moduli (HodgeStructuresPartII:H.5/prescribed-monodromy-tangent).
2. Group-theoretic form: the tangent-space theorem identifies H¹(U, a_* ad⁰ρ) with ker(H¹(π₁, ad⁰ρ) → ⊕ H¹(⟨T_i⟩, ad⁰ρ)), which uses Mathlib's group cohomology and makes sense for any finitely generated group with chosen elements.
3. The loops T_i and hence the predicate are attached to the chosen good compactification; the sources state every result for a given good compactification, and no independence of the compactification is asserted here.
4. Projective case: U = X̄ = X and a = id.

**Uses.**

- Esnault–Groechenig, Cohomologically rigid local systems and integrality, §1 and Theorem 1.1: The hypothesis H¹(X̄, j_{!*}End⁰(V)) = 0 of the integrality theorem.
- Landesman–Litt, Canonical representations of surface groups, Definition 8.1.1 and Lemma 8.3.3: Cohomological rigidity of a PGL_r-local system on a versal family is verified and fed into Klevdal–Patrikis' integrality theorem.
- Klevdal–Patrikis, G-rigid local systems are integral, Definition 1.1 and Theorem 1.2: G-cohomological rigidity is the main hypothesis of G-integrality.
- Esnault–Groechenig, Rigid connections and F-isocrystals, §7 and Proposition 8.2: Cohomologically rigid connections have companions; finiteness of their monodromy under the p-curvature hypothesis.
- HodgeStructuresPartII:H.5/integrality-EG18, HodgeStructuresPartII:H.5/integrality-KP, HodgeStructuresPartII:H.5/coh-rigid-semisimple-cvhs: Hypothesis of the integrality and variation theorems.

**API.**

- `IsCohomologicallyRigid` (constructor): The predicate H¹(U, a_* ad⁰ρ) = 0, in the group-theoretic form: the restriction map H¹(π₁, ad⁰ρ) → ⊕_i H¹(⟨T_i⟩, ad⁰ρ) is injective.
- `IsCohomologicallyRigid.iff_tangent_eq_bot` (characterisation): For irreducible ρ with det ρ = δ and ρ(T_i) ∈ K_i: IsCohomologicallyRigid ρ ↔ the Zariski tangent space of M(π₁, r, δ, (T_i, K_i)) at [ρ] is zero.
- `IsCohomologicallyRigid.isRigid` (relation): For irreducible ρ: cohomologically rigid implies rigid, and the moduli point is reduced (proved in HodgeStructuresPartII:H.5/coh-rigid-reduced-isolated and re-exported here).
- `IsCohomologicallyRigid.of_strong` (relation): Strongly cohomologically rigid implies cohomologically rigid (HodgeStructuresPartII:H.5/strong-implies-cohomological).
- `IsCohomologicallyRigid.projective_iff` (compatibility): If X is projective, the predicate is H¹(π₁(X,x), ad⁰ρ) = 0.
- `IsCohomologicallyRigid.deRham_iff` (compatibility): If X is projective and (E,∇) is the algebraic flat connection of ρ, the predicate is H¹_dR(X, End⁰(E,∇)) = 0 (HodgeStructuresPartII:H.5/derham-betti-tangent).
- `IsCohomologicallyRigid.conj_aut` (relation): For σ ∈ Aut(ℂ), σ∘ρ is cohomologically rigid iff ρ is (HodgeStructuresPartII:H.5/rigidity-conjugate).
- `IsCohomologicallyRigid.intermediateExtension_iff` (equivalence): The predicate is H¹(X̄, j_{!*} ad⁰ρ) = 0 (HodgeStructuresPartII:H.5/intermediate-extension-h1).

**Unit tests.**

- `IsCohomologicallyRigid.test_rank_one` (degenerate): Every ρ: π₁(X) → GL_1(ℂ) is cohomologically rigid, since ad⁰ρ = 0.
- `IsCohomologicallyRigid.test_compact_curve_genus_two` (non-example): If X is a compact curve of genus g ≥ 2 and ρ is irreducible of rank r ≥ 2, then dim H¹(X, End⁰V) = (2g − 2)(r² − 1) > 0, so ρ is not cohomologically rigid.
- `IsCohomologicallyRigid.test_hypergeometric` (computation): On X = ℙ¹ ∖ {0, 1, ∞} with X̄ = ℙ¹, let V be irreducible of rank 2 with non-scalar local monodromies at 0, 1, ∞; then H¹(ℙ¹, j_* End⁰V) = −χ(X)·3 − Σ_i dim (sl_2)^{T_i} = 3 − 3 = 0.
- `IsCohomologicallyRigid.test_not_strong` (non-example): For the same hypergeometric V, H¹(X, End⁰V) has dimension −χ(X)·3 = 3, so V is cohomologically rigid but not strongly cohomologically rigid.
- `IsCohomologicallyRigid.test_projective_groupCohomology` (compatibility): If X is projective, IsCohomologicallyRigid ρ ↔ H¹(π₁(X,x), ad⁰ρ) = 0, the latter computed by Mathlib's groupCohomology.H1 of the trace-free adjoint representation.

**Acceptance.** Every rank-one local system is cohomologically rigid. On a compact curve of genus g ≥ 2 no irreducible local system of rank r ≥ 2 is cohomologically rigid: dim H¹(X, End⁰V) = (2g − 2)(r² − 1). On ℙ¹ ∖ {0, 1, ∞}, an irreducible rank-two local system whose three local monodromies are non-scalar is cohomologically rigid.

**Direct dependencies.** `HodgeStructuresPartII:H.5/trace-free-adjoint`, `HodgeStructuresPartII:H.5/boundary-monodromy-data`, `HodgeStructuresPartII:H.5/prescribed-monodromy-tangent`, `HodgeStructuresPartII:H.5/intermediate-extension-h1`, `mathlib:groupCohomology.H1`.

**Source passages.**

- [EG18](https://arxiv.org/pdf/1711.06436v3), §1, p.1: “An irreducible complex local system V is said to be cohomologically rigid if H1 (X̄, j!∗ End0 (V)) = 0.” — Definition in the quasi-projective case with trace-free coefficients.
- [LL24](https://arxiv.org/pdf/2205.15352v4), §8.1, Definition 8.1.1, p.38: “The representa- tion ρ is said to be cohomologically rigid if” — Landesman–Litt's definition with ad ρ for reductive G and quasi-unipotent monodromy at infinity.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §7, p.148: “Recall that an irreducible connection (E, ∇) with determinant L on X over C is called cohomologically rigid if” — Projective case for flat connections; the trace-free form is the correct one (see source issue HodgeStructuresPartII/E-H5-3).

**Suggested file.** 8 names declared or stated as examples; 5 listed in the omission inventory (missing carriers: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops; moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions; algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology).

### Strong cohomological rigidity

**Definition:** `IsStronglyCohomologicallyRigid`. Node: `HodgeStructuresPartII:H.5/strong-cohomological-rigidity`.

In the setting of HodgeStructuresPartII:H.5/cohomological-rigidity, ρ: π₁(X, x) → G(ℂ) is strongly cohomologically rigid if H¹(X, g^der) = 0 for the local system g^der of ad⁰ρ on X itself, equivalently H¹(π₁(X, x), ad⁰ρ) = 0. No boundary condition and no compactification enter. On a projective X it coincides with cohomological rigidity; in general it is stronger, and strictly stronger for instance for the hypergeometric local systems on ℙ¹ ∖ {0,1,∞}.

**Hypotheses.**

- X smooth connected complex variety; ρ any representation into a split connected reductive G (quasi-unipotence is not needed for the definition).
- Coefficients are trace-free.

**Proof or construction.**

1. Define the predicate as vanishing of H¹(π₁(X,x), ad⁰ρ) = H¹(X, ad⁰ρ) (degree-one cohomology of a local system on a path-connected, locally simply connected space is group cohomology of π₁).
2. Comparison with cohomological rigidity is HodgeStructuresPartII:H.5/strong-implies-cohomological.

**Uses.**

- Landesman–Litt, Canonical representations of surface groups, Definition 8.1.4 and Proposition 8.2.1: The rigidity actually verified on the total space of a punctured versal family.
- Landesman–Litt, Canonical representations of surface groups, Lemma 4.3.2 and Proposition 8.4.1: Strongly cohomologically rigid semisimple representations with finite determinant underlie complex PVHS; the condition is preserved by Aut(ℂ).
- HodgeStructuresPartII:H.5/coh-rigid-semisimple-cvhs, HodgeStructuresPartII:H.5/versal-unitary-rigidity: Hypothesis and conclusion of the consumers.

**API.**

- `IsStronglyCohomologicallyRigid` (constructor): The predicate H¹(π₁(X,x), ad⁰ρ) = 0 (Mathlib groupCohomology.H1 of the trace-free adjoint representation is subsingleton).
- `IsStronglyCohomologicallyRigid.isCohomologicallyRigid` (relation): Strong implies cohomological rigidity (HodgeStructuresPartII:H.5/strong-implies-cohomological).
- `IsStronglyCohomologicallyRigid.of_finiteCover` (relation): If f: X′ → X is finite étale and f^*ρ is strongly cohomologically rigid then so is ρ (restriction H¹(π₁(X), V) → H¹(π₁(X′), V) is injective in characteristic zero by corestriction).
- `IsStronglyCohomologicallyRigid.conj_aut` (relation): Preserved by every σ ∈ Aut(ℂ) (HodgeStructuresPartII:H.5/rigidity-conjugate).
- `IsStronglyCohomologicallyRigid.of_groupCohomology` (equivalence): Equivalent to H¹(Γ, ad⁰ρ) = 0 for Γ = π₁(X, x), independently of base point.

**Unit tests.**

- `IsStronglyCohomologicallyRigid.test_projective` (compatibility): If X is projective then IsStronglyCohomologicallyRigid ρ ↔ IsCohomologicallyRigid ρ.
- `IsStronglyCohomologicallyRigid.test_rank_one` (degenerate): Every rank-one representation is strongly cohomologically rigid.
- `IsStronglyCohomologicallyRigid.test_hypergeometric` (non-example): An irreducible rank-two local system on ℙ¹ ∖ {0,1,∞} has H¹(π₁, ad⁰ρ) of dimension 3, hence is not strongly cohomologically rigid, although it can be cohomologically rigid.
- `IsStronglyCohomologicallyRigid.test_free_group` (computation): For Γ = π₁(ℂ ∖ {0,1}) = F_2 and an irreducible ρ: F_2 → SL_2(ℂ), dim H¹(F_2, ad⁰ρ) = 2·3 − 3 = 3.

**Acceptance.** Equal to cohomological rigidity when X is projective. Hypergeometric local systems on ℙ¹ ∖ {0,1,∞} are cohomologically but not strongly cohomologically rigid. Landesman–Litt's versal-family local systems of low rank with irreducible unitary fibres are strongly cohomologically rigid (HodgeStructuresPartII:H.5/versal-unitary-rigidity).

**Direct dependencies.** `HodgeStructuresPartII:H.5/trace-free-adjoint`, `mathlib:groupCohomology.H1`.

**Source passages.**

- [LL24](https://arxiv.org/pdf/2205.15352v4), §8.1, Definition 8.1.4, p.39: “Definition 8.1.4. If H 1 ( X, ad ρ) = 0, we say that ρ is strongly cohomologically rigid.” — Definition of strong cohomological rigidity.

**Suggested file.** All 9 names are declared or stated as examples.

### Cohomologically rigid points are reduced isolated points

**Theorem:** `isCohomologicallyRigid_iff_reduced_isolated`. Node: `HodgeStructuresPartII:H.5/coh-rigid-reduced-isolated`.

In the setting of HodgeStructuresPartII:H.5/prescribed-monodromy-moduli with G = GL_r and fixed determinant (in particular for the fixed-determinant moduli of a smooth projective X), an irreducible ρ is cohomologically rigid if and only if its point is an isolated reduced point of the coarse moduli, i.e. the local ring of the coarse moduli at [ρ] is the residue field. For a general split reductive G and G-irreducible ρ, cohomological rigidity implies that [ρ] is a reduced isolated point of the coarse moduli; the converse is asserted only for the stack, since a nontrivial finite stabiliser Z_G(ρ)/Z(G) can make the coarse local ring reduced while H¹ ≠ 0. In particular cohomological rigidity implies rigidity. Rigidity alone allows a non-reduced isolated point.

**Hypotheses.**

- Characteristic zero coefficients; ρ G-irreducible with the prescribed boundary data.
- The moduli is of finite type, so its local rings are Noetherian.

**Proof or construction.**

1. The Zariski tangent space at [ρ] is H¹(U, a_* ad⁰ρ) (HodgeStructuresPartII:H.5/prescribed-monodromy-tangent); in the projective case H¹(π₁, ad⁰ρ) (HodgeStructuresPartII:H.5/betti-tangent).
2. For a Noetherian local ring (O, m) with residue field K: m/m² = 0 implies m = 0 by Nakayama's lemma, so O = K is reduced of dimension zero; conversely O = K has zero tangent space. For GL_r with fixed determinant the coarse space is the μ_r-rigidification and μ_r acts trivially on deformations, so stack and coarse tangent spaces agree.
3. General G: the coarse space is étale locally Spec(R^S) for the local ring R of the stack and the finite stabiliser S; R = K forces R^S = K, which gives the forward implication only.
4. Hence vanishing of H¹ is equivalent to [ρ] being an isolated reduced point.

**Acceptance.** For r = 1 every point is reduced and isolated. A rigid point whose local ring is ℂ[ε]/(ε²) has one-dimensional tangent space and is not cohomologically rigid; the definitions of this layer keep such points in the rigid locus.

**Direct dependencies.** `HodgeStructuresPartII:H.5/cohomological-rigidity`, `HodgeStructuresPartII:H.5/rigid-representation`, `HodgeStructuresPartII:H.5/prescribed-monodromy-tangent`, `HodgeStructuresPartII:H.5/betti-tangent`.

**Source passages.**

- [EG18](https://arxiv.org/pdf/1711.06436v3), §1, p.1: “So a cohomologically rigid complex local system is rigid, that is its moduli point is isolated, and in addition it is smooth.” — Cohomological rigidity is rigidity plus smoothness (reducedness) of the isolated point.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §1, p.106: “is called cohomo- logically rigid, if [(E, ∇)] is a reduced isolated point of MdR (X, L, r).” — Equivalent formulation as reduced isolated point.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions).

### Strong cohomological rigidity implies cohomological rigidity

**Theorem:** `IsStronglyCohomologicallyRigid.isCohomologicallyRigid`. Node: `HodgeStructuresPartII:H.5/strong-implies-cohomological`.

In the setting of HodgeStructuresPartII:H.5/cohomological-rigidity, if H¹(X, ad⁰ρ) = 0 then H¹(U, a_* ad⁰ρ) = 0 (= H¹(X̄, j_{!*} ad⁰ρ)), i.e. strongly cohomologically rigid representations with quasi-unipotent local monodromy are cohomologically rigid.

**Hypotheses.**

- X smooth connected quasi-projective with good compactification; ρ with quasi-unipotent local monodromy (so that cohomological rigidity is defined).

**Proof or construction.**

1. Group-theoretic proof: by HodgeStructuresPartII:H.5/prescribed-monodromy-tangent, H¹(U, a_* ad⁰ρ) is the kernel of restriction H¹(π₁, ad⁰ρ) → ⊕ H¹(⟨T_i⟩, ad⁰ρ), a subspace of H¹(π₁, ad⁰ρ) = 0.
2. Topological proof (Landesman–Litt Lemma 8.1.3): the Leray spectral sequence for a gives the injection H¹(U, a_* ad⁰ρ) ↪ H¹(X, ad⁰ρ); combined with H¹(X̄, j_{!*}) ≅ H¹(U, a_*) (HodgeStructuresPartII:H.5/intermediate-extension-h1).

**Acceptance.** Applies to every strongly cohomologically rigid local system on a versal family (Landesman–Litt Proposition 8.2.1). The converse fails for the hypergeometric local systems on ℙ¹ ∖ {0,1,∞}.

**Direct dependencies.** `HodgeStructuresPartII:H.5/cohomological-rigidity`, `HodgeStructuresPartII:H.5/strong-cohomological-rigidity`, `HodgeStructuresPartII:H.5/prescribed-monodromy-tangent`, `HodgeStructuresPartII:H.5/intermediate-extension-h1`.

**Source passages.**

- [LL24](https://arxiv.org/pdf/2205.15352v4), §8.1, Lemma 8.1.3, p.39: “The Leray spectral sequence gives an injection H 1 (U, a∗ ad ρ) ,→ H 1 ( X, ad ρ), implying the claim.” — The Leray injection proves the implication.

**Suggested file.** All 1 names are declared or stated as examples.

### Rigid flat connections and rigid Higgs bundles

**Definition:** `IsRigidConnection`. Node: `HodgeStructuresPartII:H.5/rigid-connection`.

Let X be a smooth connected projective complex variety with a polarization, L a torsion line bundle of order d with its canonical flat connection ∇_L and Higgs field 0 (HodgeStructuresPartII:H.1/torsion-determinant-dictionary), and r ≥ 1. (a) A stable (equivalently irreducible) algebraic flat connection (E,∇) of rank r with det(E,∇) ≅ (L,∇_L) is rigid if [(E,∇)] is an isolated point of M_dR^s(X, r, L) (HodgeStructuresPartII:H.1/derham-coarse); the isolated point need not be reduced. (b) A slope-stable Higgs bundle (V,θ) of rank r with all rational Chern classes zero, det V ≅ L and tr θ = 0 is a rigid stable Higgs bundle if [(V,θ)] is an isolated point of M_Dol^s(X, (L,0), r) (HodgeStructuresPartII:H.1/dolbeault-coarse). (c) Both are cohomologically rigid if the point is moreover reduced; for (a) this is H¹_dR(X, End⁰(E,∇)) = 0, for (b) the vanishing of the first hypercohomology of the trace-free Higgs complex End⁰(V) → End⁰(V) ⊗ Ω¹ → ⋯ with differential [θ, −]. The determinant is fixed as a flat (respectively Higgs) line bundle, not only as a line bundle.

**Hypotheses.**

- X smooth connected projective over ℂ with an ample class; L torsion with its canonical flat structure.
- Stability: for flat connections in characteristic zero stability is irreducibility; for Higgs bundles slope stability on the vanishing-Chern-class component.
- Rigidity is isolation in the fixed-determinant moduli, possibly at a non-reduced point (Esnault–Groechenig §3.1).

**Proof or construction.**

1. The moduli spaces are the stable fixed-determinant fibres of HodgeStructuresPartII:H.1/derham-coarse and HodgeStructuresPartII:H.1/dolbeault-coarse; define the predicates as isolation of the moduli point there.
2. The tangent-space description of (c) is HodgeStructuresPartII:H.5/derham-betti-tangent.

**Uses.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, Definition 1.1, Remark 1.2 and §2.1 p.109: Rigid connections and rigid stable Higgs bundles are the objects whose reductions, Frobenius structures and unitarity the paper studies.
- Esnault–Groechenig, Rigid connections and F-isocrystals, §3.1 (3.1) and Proposition 3.3: The rigid loci M^rig_dR and M^rig_Dol are spread over arithmetic models.
- HodgeStructuresPartII:H.5/rigid-higgs-nilpotent, HodgeStructuresPartII:H.5/rigid-underlies-cvhs, HodgeStructuresPartII:H.5/rigid-correspondence: Consumers of the predicates.

**API.**

- `IsRigidConnection` (constructor): Predicate on a stable flat connection with determinant (L,∇_L): its point of M_dR^s(X, r, L) is isolated.
- `IsRigidHiggs` (constructor): Predicate on a stable trace-free Higgs bundle with determinant (L,0) on the vanishing-Chern-class component: its point of M_Dol^s(X, (L,0), r) is isolated.
- `IsRigidConnection.iff_monodromy` (equivalence): (E,∇) is rigid iff its monodromy representation is rigid in M_B^s(π₁(X,x), r, δ_L) (Riemann–Hilbert, HodgeStructuresPartII:H.5/rigid-correspondence).
- `IsRigidConnection.iff_higgs` (equivalence): (E,∇) is rigid iff the corresponding stable Higgs bundle is rigid (non-abelian Hodge, HodgeStructuresPartII:H.5/rigid-correspondence).
- `IsRigidConnection.dual` (functoriality): The dual of a rigid connection with determinant L is rigid with determinant L⁻¹.
- `IsRigidConnection.tensor_torsion` (functoriality): For a torsion line N with its canonical connection, (E,∇) ⊗ (N,∇_N) is rigid with determinant L ⊗ N^r iff (E,∇) is rigid.
- `IsRigidHiggs.scale` (relation): If (V,θ) is rigid then so is (V, tθ) for every t ∈ ℂ^×.
- `IsCohomologicallyRigidConnection.iff_tangent` (characterisation): Cohomological rigidity of (E,∇) is H¹_dR(X, End⁰(E,∇)) = 0, and of (V,θ) the vanishing of the trace-free Dolbeault H¹.

**Unit tests.**

- `IsRigidConnection.test_rank_one` (degenerate): For r = 1 the fibre M_dR^s(X, 1, L) is the single reduced point (L,∇_L), which is rigid; likewise M_Dol^s(X, (L,0), 1) = {(L,0)}.
- `IsRigidConnection.test_genus_two_curve` (non-example): If X is a compact curve of genus g ≥ 2 and r ≥ 2, no stable flat connection of rank r with determinant (O_X, d) is rigid, since M_dR^s(X, r, O) is smooth of dimension 2(g − 1)(r² − 1).
- `IsRigidConnection.test_flat_determinant_needed` (non-example): On an elliptic curve X, the rank-one connections on the trivial bundle are d + a·dz with a ∈ ℂ; fixing only det E ≅ O leaves this one-parameter family, while fixing (O, d) leaves a point.
- `IsRigidHiggs.test_trace_condition` (non-example): For a nonzero holomorphic 1-form ω, the Higgs bundle (L, ω) has tr θ = ω ≠ 0 and is not a point of M_Dol(X, (L,0), 1).
- `IsRigidHiggs.test_projective_space` (computation): For X = ℙⁿ (simply connected, H⁰(Sym^i Ω¹) = 0), M_dR^s(ℙⁿ, r, O) and M_Dol^s(ℙⁿ, (O,0), r) are empty for r ≥ 2 and a reduced point for r = 1.

**Acceptance.** Every rank-one object (L,∇_L) or (L,0) is rigid. On a compact curve of genus g ≥ 2 there is no rigid object of rank r ≥ 2: the stable moduli are smooth of dimension 2(g − 1)(r² − 1) > 0. Fixing only the underlying line bundle of the determinant gives a different moduli problem.

**Direct dependencies.** `HodgeStructuresPartII:H.1/derham-coarse`, `HodgeStructuresPartII:H.1/dolbeault-coarse`, `HodgeStructuresPartII:H.1/torsion-determinant-dictionary`, `HodgeStructuresPartII:H.1/stability`, `HodgeStructuresPartII:H.5/trace-free-adjoint`, `HodgeStructuresPartII:H.5/rigid-representation`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §1, Remark 1.2, p.104: “Henceforth, the term rigid connection refers to a stable flat connection which satisfies the assumptions of Definition 1.1.” — Rigid connections are stable flat connections isolated in the fixed-determinant moduli.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §2.1, p.109: “A rigid stable Higgs bundle (V, θ) is a Higgs bundle with torsion determinant L=det(V ) and trace(θ)=0, which induces an isolated point of the moduli space” — Definition of rigid stable Higgs bundles.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, p.121: “an isolated point is not assumed to be reduced” — Rigidity allows non-reduced isolated points.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions; algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology).

### Trace-free tangent spaces on the three sides

**Comparison:** `deRham_betti_tangent_iso`. Node: `HodgeStructuresPartII:H.5/derham-betti-tangent`.

Let X be smooth connected projective over ℂ, (E,∇) a stable flat connection with determinant (L,∇_L), monodromy ρ at x, and (V,θ) the corresponding stable Higgs bundle under HodgeStructuresPartII:H.1/harmonic-correspondence. Then there are natural isomorphisms H¹_dR(X, End⁰(E,∇)) ≅ H¹(X^an, End⁰(E^∇)) ≅ H¹(π₁(X^an, x), ad⁰ρ) and an isomorphism of the latter with the first hypercohomology of the trace-free Higgs complex (End⁰(V), [θ,−]). These are the Zariski tangent spaces of M_dR^s(X,r,L), M_B^s(π₁, r, δ) and M_Dol^s(X,(L,0),r) at the corresponding points. More precisely (Simpson, Moduli II, Proposition 10.5 and Theorem 10.6), the formal completions of the three moduli at points corresponding to the same harmonic bundle are canonically isomorphic, each being the completion at 0 of a quadratic cone in this H¹ (modulo the scalar stabilizer, which acts trivially at stable points); the analytic Riemann–Hilbert isomorphism of HodgeStructuresPartII:H.1/riemann-hilbert-coarse induces an isomorphism of the de Rham and Betti tangent spaces. In particular the three cohomological rigidity conditions coincide.

**Hypotheses.**

- X smooth connected projective over ℂ; stable objects with fixed torsion determinant.
- The algebraic de Rham comparison with coefficients in an algebraic flat bundle (GAGA plus the holomorphic Poincaré lemma with coefficients) is requested from ComplexComparisonPartII:C5, whose stated scope is constant coefficients.

**Proof or construction.**

1. Algebraic to analytic: GAGA for the coherent terms of the de Rham complex of End⁰(E,∇) gives H¹_dR(X, End⁰(E,∇)) ≅ H¹(X^an, Ω^•(End⁰ E^an)); the holomorphic Poincaré lemma with coefficients makes the analytic de Rham complex a resolution of the local system End⁰(E^∇) (request ComplexComparisonPartII:C5).
2. Degree-one cohomology of a local system on a connected manifold is group cohomology of π₁ with coefficients in the monodromy representation (HodgeStructuresPartII:H.5/trace-free-adjoint API flatBundle).
3. Riemann–Hilbert is an isomorphism of complex analytic spaces, so completed local rings and tangent spaces of M_dR^s and M_B^s agree (HodgeStructuresPartII:H.1/riemann-hilbert-coarse); the tangent space of M_B^s is H¹(π₁, ad⁰ρ) (HodgeStructuresPartII:H.5/betti-tangent).
4. Dolbeault side: the deformations of (V,θ) with fixed determinant are controlled by the trace-free Higgs dg Lie algebra; by the principle of two types (HodgeStructuresPartII:H.1/two-types-formality) the de Rham and Higgs dg Lie algebras of a harmonic object are quasi-isomorphic to the same formal one. Goldman–Millson theory and Luna's étale slice (Simpson, Moduli II, Theorem 10.4 and Proposition 10.5, with the formal local product of HodgeStructuresPartII:H.1/hodge-formal-product) identify the completed local ring of M_Dol^s at a stable point with the completion of the quadratic cone in H¹ of the Higgs complex, whose Zariski tangent space is that H¹; the isosingularity theorem (Simpson, Moduli II, Theorem 10.6) identifies it with the de Rham completed local ring.

**Acceptance.** For r = 1 all three groups vanish. For a stable rank-two connection on a compact curve of genus g ≥ 2 each group has dimension 6g − 6.

**Direct dependencies.** `HodgeStructuresPartII:H.5/betti-tangent`, `HodgeStructuresPartII:H.5/trace-free-adjoint`, `HodgeStructuresPartII:H.1/riemann-hilbert-coarse`, `HodgeStructuresPartII:H.1/harmonic-correspondence`, `HodgeStructuresPartII:H.1/two-types-formality`, `HodgeStructuresPartII:H.1/hodge-formal-product`, `ComplexComparisonPartII:C5`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §7, p.148: “it is straightforward to see that H 1 (X, End0 (E, ∇))=0 is the Zariski tangent space of MdR (X/C, L, r) at the moduli point.” — Tangent space of the de Rham moduli is trace-free H¹.
- [EG18](https://arxiv.org/pdf/1711.06436v3), §2, Proposition 2.3, p.5: “The Zariski tangent space T[V] at a point [V] ∈ M associated to V defined over K is the finite dimensional K-vector space H 1 (U, a∗ End0 (V)).” — Betti side (with no boundary, U = X).
- [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §10, Proposition 10.5, p.68: “The formal completion of the moduli space M” — Formal completion of the moduli at a harmonic point is the quotient of the quadratic cone in H¹.
- [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), Introduction, p.9: “the differential graded Lie algebras controling the deformation theories of the flat bundle and the corresponding Higgs bundle are the same.” — Same deformation theory on the de Rham and Dolbeault sides.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions; algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology).

### Rigid objects correspond across Betti, de Rham and Dolbeault moduli

**Theorem:** `rigid_correspondence`. Node: `HodgeStructuresPartII:H.5/rigid-correspondence`.

Let X be smooth connected projective over ℂ, L torsion and r ≥ 1. The Riemann–Hilbert analytic isomorphism M_dR^s(X,r,L)^an ≅ M_B^s(π₁(X,x), r, δ_L)^an (HodgeStructuresPartII:H.1/riemann-hilbert-coarse) and the non-abelian Hodge homeomorphism M_dR^s(X,r,L) ≅ M_Dol^s(X,(L,0),r) (HodgeStructuresPartII:H.1/nonabelian-hodge-topology) restrict to bijections M^rig_B(ℂ) ≅ M^rig_dR(ℂ) ≅ M^rig_Dol(ℂ) between the finite sets of rigid points (HodgeStructuresPartII:H.5/rigid-locus). The Riemann–Hilbert bijection preserves the local rings; by Simpson's isosingularity theorem the formal completions of M_dR^s and M_Dol^s at corresponding points are isomorphic, so the non-abelian Hodge bijection of rigid points also preserves the (Artinian) local rings, hence lengths and cohomological rigidity (HodgeStructuresPartII:H.5/derham-betti-tangent). Consequently the numbers of rigid connections, rigid representations and rigid stable Higgs bundles of rank r and determinant L are equal.

**Hypotheses.**

- X smooth connected projective; stable loci with fixed torsion determinant; isolated points in the analytic topology (equal to Zariski isolation on finite-type schemes).

**Proof or construction.**

1. A homeomorphism of topological spaces maps isolated points to isolated points; apply it to the stable non-abelian Hodge homeomorphism and to the analytic Riemann–Hilbert isomorphism (HodgeStructuresPartII:H.1/nonabelian-hodge-topology states that it preserves isolated points).
2. An isomorphism of analytic spaces identifies the analytic local rings, which for finite-type schemes are faithfully flat over the algebraic local rings with the same completion; hence lengths at isolated points agree between M_dR and M_B.
3. Tangent spaces and formal completions correspond on all three sides (HodgeStructuresPartII:H.5/derham-betti-tangent; Simpson, Moduli II, Proposition 10.5 and Theorem 10.6); an Artinian local ring is its own completion, so the local rings of corresponding rigid points are isomorphic and reduced isolated points correspond.

**Acceptance.** In rank one each side is a single reduced point. For X a compact curve of genus ≥ 2 and r ≥ 2 all three rigid loci are empty. Corresponding rigid points have isomorphic Artinian local rings (the non-reduced structure is not lost under non-abelian Hodge).

**Direct dependencies.** `HodgeStructuresPartII:H.5/rigid-connection`, `HodgeStructuresPartII:H.5/rigid-representation`, `HodgeStructuresPartII:H.5/rigid-locus`, `HodgeStructuresPartII:H.5/derham-betti-tangent`, `HodgeStructuresPartII:H.1/riemann-hilbert-coarse`, `HodgeStructuresPartII:H.1/nonabelian-hodge-topology`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §2.1, p.108: “non-abelian Hodge theory [Si4] relates the so-called Betti, de Rham and Dolbeault moduli spaces by real-analytic isomorphisms:” — The comparison of the three moduli spaces used to transport rigidity.
- [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §10, after Proposition 10.5, p.68: “We get canonical isomorphisms between the formal completions” — Formal completions of M_Dol and M_dR at points corresponding to the same harmonic bundle are isomorphic.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §4.2, p.133: “We denote by nL the number of rank-r rigid flat connections on X with determinant isomorphic to La for a=0, ..., d−1,” — The finite counts of rigid objects are compared across the moduli spaces (corrected indices: source issue HodgeStructuresPartII/E-H5-1).

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions; algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology).

### Rigid loci of moduli schemes

**Construction:** `RigidLocus`. Node: `HodgeStructuresPartII:H.5/rigid-locus`.

For a morphism of schemes f: M → S locally of finite type, the rigid locus M^rig ⊂ M is the open subscheme f.quasiFiniteLocus of Mathlib: the points x at which f is quasi-finite, equivalently the points isolated in their fibre f⁻¹(f(x)) (Esnault–Groechenig Definition 3.2). Applied to the stable fixed-determinant moduli over S = Spec ℂ it gives M^rig_B, M^rig_dR and M^rig_Dol, the closed and open finite subschemes of isolated points with their possibly non-reduced structure; applied to the relative moduli over an arithmetic base it gives M^rig(X_S/S, L_S, r) (HodgeStructuresPartII:H.5/relative-moduli); applied to q: M_Hod^s → 𝔸¹ it gives M^rig_Hod (HodgeStructuresPartII:H.5/hodge-rigid-locus).

**Hypotheses.**

- f locally of finite type (Mathlib's openness theorem needs only this).
- Over a field, M of finite type, so that the rigid locus is finite and closed as well as open.

**Proof or construction.**

1. Openness is Mathlib's AlgebraicGeometry.Scheme.Hom.isOpen_quasiFiniteAt (a consequence of Zariski's main theorem); the open subscheme is AlgebraicGeometry.Scheme.Hom.quasiFiniteLocus.
2. Fibrewise characterization: Scheme.Hom.quasiFiniteAt_iff_isOpen_singleton_asFiber says x is in the locus iff {x} is open in its fibre.
3. Over a field and for M of finite type: the isolated points are the irreducible components of dimension zero; there are finitely many, the union is closed, and M = M^rig ⊔ (M ∖ M^rig) with the complement containing no isolated point (Esnault–Groechenig (3.1)).
4. Equivariance: an automorphism of M over an automorphism of S preserves fibres and isolation, so group actions compatible with f preserve M^rig.

**Uses.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, §3.1 (3.1) and Definition 3.2: M^rig_dR(X/ℂ,L,r) and M^rig_Dol, and the relative loci M^rig_dR(X_S/S, L_S, r), M^rig_Dol(X_S/S, L_S, r) over arithmetic bases.
- Esnault–Groechenig, Rigid connections and F-isocrystals, Proposition 3.3(d),(e) and §4.2: Sections of the moduli through rigid points factor through the open relative rigid locus; M^rig_Hod is the quasi-finite locus of the Hodge moduli over 𝔸¹.
- HodgeStructuresPartII:H.5/rigid-finite, HodgeStructuresPartII:H.5/nilpotent-rigid-models, HodgeStructuresPartII:H.5/hodge-rigid-locus: Finiteness, spreading and the Hodge splitting are statements about these loci.

**API.**

- `RigidLocus` (constructor): RigidLocus f := f.quasiFiniteLocus, an open subscheme of M, for f locally of finite type.
- `RigidLocus.mem_iff_isolated` (characterisation): x ∈ RigidLocus f ↔ x is isolated in its fibre (Mathlib quasiFiniteAt_iff_isOpen_singleton_asFiber).
- `RigidLocus.locallyQuasiFinite` (instance): The restriction of f to RigidLocus f is locally quasi-finite (Mathlib instance on quasiFiniteLocus.ι ≫ f).
- `RigidLocus.field_isClopen` (characterisation): If S = Spec K for a field K and M is of finite type, RigidLocus f is closed and open, finite over K, and its complement has no isolated points.
- `RigidLocus.comp_openImmersion` (functoriality): For an open immersion j: M′ → M, RigidLocus (j ≫ f) = j⁻¹(RigidLocus f) (Mathlib quasiFiniteLocus_comp).
- `RigidLocus.isFinite_of_isProper` (relation): If the restriction of f to RigidLocus f is proper then it is finite (Mathlib IsFinite.of_isProper_of_locallyQuasiFinite).
- `RigidLocus.equivariant` (functoriality): If a group acts on M and S compatibly with f, the action preserves RigidLocus f.
- `RigidLocus.fibre` (projection): For s ∈ S, the fibre of RigidLocus f over s is the rigid locus of the fibre M_s → Spec κ(s), i.e. the isolated points of M_s.

**Unit tests.**

- `RigidLocus.test_fat_point` (computation): For f: Spec ℂ[x]/(x²) → Spec ℂ, the rigid locus is all of Spec ℂ[x]/(x²), including its nilpotent structure.
- `RigidLocus.test_affine_line` (non-example): For f: 𝔸¹_ℂ → Spec ℂ the rigid locus is empty.
- `RigidLocus.test_line_and_point` (computation): For M = Spec ℂ[x,y]/(y(y − 1), xy) → Spec ℂ (the line y = 0 and the point (0,1)), the rigid locus is the point (0,1).
- `RigidLocus.test_relative_open_not_closed` (characterisation): For f: Spec ℤ[x]/(px) → Spec ℤ, the rigid locus is the open subscheme Spec ℤ[1/p] (x = 0 away from p); it does not meet the fibre 𝔸¹_{𝔽_p}.
- `RigidLocus.test_compat_mathlib` (compatibility): RigidLocus f is definitionally Mathlib's f.quasiFiniteLocus, and x ∈ RigidLocus f ↔ IsOpen {f.asFiber x}.

**Acceptance.** Retains non-reduced isolated points with their structure. Is open but in families need not be closed.

**Direct dependencies.** `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteLocus`, `mathlib:AlgebraicGeometry.Scheme.Hom.isOpen_quasiFiniteAt`, `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteAt_iff_isOpen_singleton_asFiber`, `mathlib:AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`, `mathlib:AlgebraicGeometry.LocallyQuasiFinite`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, Definition 3.2, p.123: “is quasi-finite at all points of X rig (see [dJ, Lemma 29.54.2, tag 01TI] for a proof of openness).” — The rigid locus is the quasi-finite locus.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, p.121: “to be the closed subscheme of isolated points of the quasi-projective moduli of P - stable integrable connections” — Over ℂ the rigid locus is the closed (and open) subscheme of isolated points.

**Suggested file.** 10 names declared or stated as examples; 3 listed in the omission inventory (missing carriers: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules).

### Finiteness of rigid objects

**Theorem:** `rigidLocus_finite`. Node: `HodgeStructuresPartII:H.5/rigid-finite`.

Let X be smooth connected projective over ℂ, L torsion and r ≥ 1. The rigid loci M^rig_B(π₁(X), r, δ_L), M^rig_dR(X, r, L) and M^rig_Dol(X, (L,0), r) are finite ℂ-schemes; there are finitely many isomorphism classes of rigid flat connections, rigid representations and rigid stable Higgs bundles of rank ≤ r with determinant L. More generally, for a finitely generated Γ and prescribed data as in HodgeStructuresPartII:H.5/prescribed-monodromy-moduli, the moduli has finitely many isolated points, and for r, d, h fixed the set S(r, d, h) of irreducible cohomologically rigid local systems on a smooth quasi-projective X of rank r, determinant of order dividing d and quasi-unipotent local monodromies whose eigenvalues have order dividing h is finite.

**Hypotheses.**

- The moduli are of finite type over ℂ (respectively over a number field).
- For S(r,d,h): finitely many determinant characters of order dividing d and finitely many quasi-unipotent conjugacy classes with eigenvalue orders dividing h and fixed Jordan type.

**Proof or construction.**

1. A scheme of finite type over a field is Noetherian and has finitely many irreducible components; isolated points are zero-dimensional components; apply HodgeStructuresPartII:H.5/rigid-locus over Spec ℂ.
2. The fixed-determinant moduli HodgeStructuresPartII:H.1/betti-coarse, HodgeStructuresPartII:H.1/derham-coarse and HodgeStructuresPartII:H.1/dolbeault-coarse are of finite type.
3. For S(r, d, h): Hom(π₁, μ_d) is finite, and for each Jordan type there are finitely many quasi-unipotent classes with eigenvalue orders dividing h; each of the finitely many stacks M_m has finitely many isolated points (Esnault–Groechenig 2018 §3, first paragraph).

**Acceptance.** In rank one each rigid locus is one point. S(r, d, h) is empty for r ≥ 2 on a compact curve of genus ≥ 2.

**Direct dependencies.** `HodgeStructuresPartII:H.5/rigid-locus`, `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`, `HodgeStructuresPartII:H.5/boundary-monodromy-data`, `HodgeStructuresPartII:H.1/betti-coarse`, `HodgeStructuresPartII:H.1/derham-coarse`, `HodgeStructuresPartII:H.1/dolbeault-coarse`.

**Source passages.**

- [EG18](https://arxiv.org/pdf/1711.06436v3), §3, p.6: “As there are finitely many such Jordan types, Proposition 2.3 implies that S(r, d, h) is finite, of cardinality N = N (r, d, h).” — Finiteness of cohomologically rigid local systems with bounded data.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, p.121: “is a zero-dimensional quasi-projective C-variety, and therefore projective.” — The rigid locus over ℂ is finite.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions).

### Rigidity is preserved by automorphisms of the coefficients

**Theorem:** `rigidity_conj_aut`. Node: `HodgeStructuresPartII:H.5/rigidity-conjugate`.

Let Γ be finitely generated, ρ: Γ → GL_r(ℂ) and σ ∈ Aut(ℂ). Then σ∘ρ is absolutely irreducible, has determinant σ∘det ρ, has quasi-unipotent image at the elements γ_i (with the same eigenvalue orders), is rigid, cohomologically rigid or strongly cohomologically rigid if and only if ρ is. The same holds for G-valued ρ with G split reductive over ℚ (σ acting on G(ℂ)). Unitarity is not preserved (HodgeStructuresPartII:H.5/infinite-image-unitary-example).

**Hypotheses.**

- Γ finitely generated; σ an arbitrary field automorphism of ℂ (not continuous in general).

**Proof or construction.**

1. H¹(Γ, ad⁰(σ∘ρ)) ≅ H¹(Γ, ad⁰ρ) ⊗_{ℂ,σ} ℂ (HodgeStructuresPartII:H.5/trace-free-adjoint API baseChange), and the same for the restriction maps to ⟨γ_i⟩; vanishing is preserved.
2. The moduli M_B^s(Γ, r, δ) and the prescribed-monodromy moduli are schemes (stacks) of finite type defined over ℚ(δ, eigenvalues); σ induces an isomorphism of the ℂ-points of M and of its σ-conjugate which is an isomorphism of schemes over σ, hence preserves Zariski isolation and local rings.
3. Eigenvalues of ρ(γ_i) are roots of unity iff those of σρ(γ_i) are, with the same orders; irreducibility is preserved because invariant subspaces are transported by σ.

**Acceptance.** σ = complex conjugation takes a rigid ρ to the rigid ρ̄. Galois conjugates of a unitary character with values in a Salem-type unit need not be unitary, although they remain rigid.

**Direct dependencies.** `HodgeStructuresPartII:H.5/trace-free-adjoint`, `HodgeStructuresPartII:H.5/rigid-representation`, `HodgeStructuresPartII:H.5/cohomological-rigidity`, `HodgeStructuresPartII:H.5/strong-cohomological-rigidity`, `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`.

**Source passages.**

- [LL24](https://arxiv.org/pdf/2205.15352v4), §8.4, proof of Proposition 8.4.1, p.41: “strong cohomological rigidity (being a cohomological condition) is preserved by automorphisms of C.” — Aut(ℂ)-invariance of (strong) cohomological rigidity.
- [EG18](https://arxiv.org/pdf/1711.06436v3), §3, p.6: “By extension of the ring of coefficients for Betti cohomology, one has” — Vanishing of trace-free H¹ is insensitive to extension of the coefficient field, the base-change step of the proof.

**Suggested file.** All 1 names are declared or stated as examples.

### Rigid local systems are defined over number fields

**Theorem:** `exists_numberField_of_rigid`. Node: `HodgeStructuresPartII:H.5/rigid-number-field`.

Let Γ be finitely generated and ρ: Γ → GL_r(ℂ) absolutely irreducible and rigid with finite-order determinant δ (with prescribed quasi-unipotent local data as in HodgeStructuresPartII:H.5/prescribed-monodromy-moduli when present). Then there are a number field K ⊂ ℂ and a finite set Σ of finite places of K such that ρ is GL_r(ℂ)-conjugate to a representation Γ → GL_r(𝒪_{K,Σ}), where 𝒪_{K,Σ} is the ring of Σ-integers. For Γ = π₁ of a smooth projective X, every Galois conjugate of ρ is rigid and ρ is a complex direct factor of a ℚ-local system (Simpson Theorem 5).

**Hypotheses.**

- Γ finitely generated; ρ absolutely irreducible and rigid in the fixed-determinant (prescribed-boundary) moduli; δ of finite order and boundary classes quasi-unipotent, so that the moduli is defined over a number field K₀.

**Proof or construction.**

1. The moduli M (HodgeStructuresPartII:H.5/prescribed-monodromy-moduli) is of finite type over a number field K₀ ⊃ ℚ(μ_d, μ_h); its finitely many isolated ℂ-points (HodgeStructuresPartII:H.5/rigid-finite) are permuted by Aut(ℂ/K₀) (HodgeStructuresPartII:H.5/rigidity-conjugate).
2. A ℂ-point of a finite-type K₀-scheme with finite Aut(ℂ/K₀)-orbit is defined over a finite extension of K₀; so [ρ] is a K₁-point for a number field K₁.
3. On the stable locus the representation scheme is a PGL_r-torsor over the coarse space (HodgeStructuresPartII:H.5/betti-tangent proof); a K₁-point lifts to a representation over a finite extension K (torsor trivial over a finite extension; the Brauer obstruction of an absolutely irreducible representation with traces in K₁ splits over a finite extension).
4. Γ is finitely generated, so the finitely many entries of ρ(generators)^{±1} lie in 𝒪_{K,Σ} for a finite Σ (Esnault–Groechenig 2018 §3).
5. Simpson's Theorem 5 assumes proper rigidity (openness of the orbit in Hom(π₁, H), H the Zariski closure of the image). Fixed-determinant rigidity with finite-order δ implies it: det is locally constant on Hom(π₁, H) since det(H) is finite, so nearby ρ_t in Hom(π₁, H) are g_tρg_t⁻¹ with g_t → 1; g_t normalizes H, and for irreducible ρ the identity component of the normalizer is H°·ℂ^×, so ρ_t is H-conjugate to ρ.

**Acceptance.** For r = 1 with δ of order d, K = ℚ(μ_d) and Σ = ∅. For Γ finite, every irreducible representation is defined over a number field (classical), consistent with rigidity.

**Direct dependencies.** `HodgeStructuresPartII:H.5/rigid-representation`, `HodgeStructuresPartII:H.5/rigid-finite`, `HodgeStructuresPartII:H.5/rigidity-conjugate`, `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`, `HodgeStructuresPartII:H.5/betti-tangent`.

**Source passages.**

- [EG18](https://arxiv.org/pdf/1711.06436v3), §3, p.6: “there is a number field K ⊂ C containing K0 such that up to conjugacy the underlying complex linear representations factor as” — Rigid local systems with the prescribed data are defined over a number field.
- [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §4, proof of Theorem 5, p.56: “if p is rigid, then it can be defined over a number field and all of its Galois conjugates are rigid.” — Simpson's argument for rigid representations of projective varieties.

**Suggested file.** All 1 names are declared or stated as examples.

### Good compactifications and local monodromy at infinity

**Definition:** `IsQuasiUnipotentAtInfinity`. Node: `HodgeStructuresPartII:H.5/boundary-monodromy-data`.

Let X be a smooth connected quasi-projective complex variety with base point x. A good compactification is an open immersion j: X → X̄ into a smooth projective X̄ such that D = X̄ ∖ X is a strict normal crossings divisor with irreducible components D_1, …, D_N. Put U = X̄ ∖ D_sing and a: X → U. For each i choose y_i ∈ D_i ∩ U, a small ball Δ_i ∋ y_i in X̄ and x_i ∈ Δ_i^× = Δ_i ∖ D; then π₁(Δ_i^×, x_i) = ℤ·T_i with T_i the positively oriented generator (counter-clockwise for the complex orientation of a normal disc), and a path from x to x_i transports T_i to an element of π₁(X, x) (the local monodromy loop around D_i), well defined up to conjugation and independent of y_i because D_i ∩ U is connected. For a representation ρ: π₁(X,x) → GL_r(ℂ) (or G(ℂ)), the local monodromy along D_i is the conjugacy class of ρ(T_i). ρ has quasi-unipotent local monodromy if every ρ(T_i) is quasi-unipotent: some positive power is unipotent, equivalently all eigenvalues are roots of unity. Boundary data are conjugacy classes K_1, …, K_N ⊂ GL_r (locally closed subvarieties); V is defined by K_i along D_i if ρ(T_i) ∈ K_i.

**Hypotheses.**

- X smooth connected quasi-projective over ℂ; existence of a good compactification is Hironaka's resolution in characteristic zero, requested from AlgebraicModuliForArithmeticGeometry:R09.7d.
- When X is projective, D = ∅, N = 0 and every condition is vacuous.

**Proof or construction.**

1. Construct T_i from the local product structure of an SNC divisor at a smooth point y_i of D: Δ_i ≅ disc × polydisc with D ∩ Δ_i the first coordinate hyperplane, so Δ_i^× ≃ punctured disc × polydisc and π₁ = ℤ.
2. Independence of y_i: D_i ∩ U is irreducible, hence connected, and the local systems V|Δ_i^× for nearby y_i are identified by parallel transport along a path in D_i ∩ U (Esnault–Groechenig 2018 §2).
3. Quasi-unipotence is a property of the conjugacy class, hence of the data.

**Uses.**

- Esnault–Groechenig, Cohomologically rigid local systems and integrality, §2: The moduli stack M with prescribed determinant and local monodromy classes K_i, and the quasi-unipotence hypothesis of Theorem 1.1.
- Klevdal–Patrikis, G-rigid local systems are integral, Definition 1.1 and Theorem 1.2: Quasi-unipotent local monodromy is a hypothesis of G-integrality.
- Landesman–Litt, Canonical representations of surface groups, Definition 8.1.1 and proof of Lemma 8.3.3: Cohomological rigidity requires quasi-unipotent monodromy at infinity; on a versal family it is verified by Dehn twists (Aramayona–Souto).
- HodgeStructuresPartII:H.5/cohomological-rigidity, HodgeStructuresPartII:H.5/prescribed-monodromy-moduli, HodgeStructuresPartII:H.5/integrality-EG18: Data of the quasi-projective rigidity and integrality statements.

**API.**

- `GoodCompactification` (structure): Data (X̄, j, D) with X̄ smooth projective, j an open immersion with image X, and D = X̄ ∖ X a strict normal crossings divisor with components D_i.
- `GoodCompactification.localMonodromy` (data): For each component D_i, the conjugacy class in π₁(X, x) of the loop T_i around D_i.
- `GoodCompactification.localMonodromy_conj` (characterisation): Different choices of y_i, Δ_i, x_i and path give conjugate loops; the orientation convention removes the inversion ambiguity (Esnault–Groechenig 2018 leave the sign open).
- `IsQuasiUnipotentAtInfinity` (constructor): ∀ i, ∃ m ≥ 1, ρ(T_i)^m − 1 is nilpotent.
- `IsQuasiUnipotentAtInfinity.iff_eigenvalues` (characterisation): Quasi-unipotence of ρ(T_i) is equivalent to all eigenvalues of ρ(T_i) being roots of unity.
- `IsQuasiUnipotentAtInfinity.conj_aut` (relation): Preserved by σ ∈ Aut(ℂ) and by conjugation.
- `IsQuasiUnipotentAtInfinity.of_geometricOrigin` (relation): Local systems of geometric origin have quasi-unipotent local monodromy (local monodromy theorem, LefschetzPencilsAndVanishingCycles:LPV.1).
- `GoodCompactification.exists` (other): Every smooth quasi-projective complex variety has a good compactification (AlgebraicModuliForArithmeticGeometry:R09.7d).

**Unit tests.**

- `BoundaryMonodromyData.test_projective_vacuous` (degenerate): If X is projective, the list of boundary components is empty and every representation has quasi-unipotent local monodromy.
- `BoundaryMonodromyData.test_Gm_root_of_unity` (computation): For X = 𝔾_m, X̄ = ℙ¹, D = {0, ∞}, and ρ: ℤ → GL_1(ℂ), 1 ↦ λ: ρ has quasi-unipotent local monodromy iff λ is a root of unity.
- `BoundaryMonodromyData.test_Gm_not_quasiUnipotent` (non-example): For X = 𝔾_m and λ = 2, the local monodromy is not quasi-unipotent.
- `BoundaryMonodromyData.test_unipotent_infinite_order` (computation): For X = 𝔾_m and ρ(1) = [[1,1],[0,1]], the local monodromy is unipotent (hence quasi-unipotent) of infinite order.

**Acceptance.** For X projective there is no boundary condition. For X = 𝔾_m ⊂ ℙ¹ the local monodromy at 0 is ρ(1) for ρ: ℤ → GL_r(ℂ).

**Direct dependencies.** `AlgebraicModuliForArithmeticGeometry:R09.7d`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `tauceti:TauCeti.LocalCoefficientSystem`.

**Source passages.**

- [EG18](https://arxiv.org/pdf/1711.06436v3), §2, p.3: “We say that V|∆× is defined by Ki if the image i i of Ti lies in Ki in its monodromy representation.” — Local monodromy along a boundary component and the prescribed class K_i.
- [KP20](https://arxiv.org/pdf/2009.07350v2), §1, Definition 1.1, p.2: “has quasi-unipotent local monodromy if for all points y in the smooth locus of D and any sufficiently small ball ∆ ⊂ X around y, ρ(γ) is quasi-unipotent for a generator γ of π1top (∆ \ D ∩ ∆)” — Quasi-unipotent local monodromy.

**Suggested file.** 7 names declared or stated as examples; 5 listed in the omission inventory (missing carriers: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops).

### Moduli of irreducible local systems with prescribed determinant and local monodromy

**Construction:** `PrescribedMonodromyModuli`. Node: `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`.

Let Γ be a finitely presented group, r ≥ 1, χ_L: Γ → μ_d ⊂ K^× a finite-order character, γ_1, …, γ_N ∈ Γ and K_1, …, K_N ⊂ GL_r locally closed conjugacy classes, all defined over a number field K. The stack M = M(Γ, r, L, (γ_i, K_i)) over K sends an affine K-variety T to the groupoid of geometrically irreducible T-families of rank-r representations W with an isomorphism ∧^r W ≅ L ⊗ O_T and with ρ(γ_i) a section of K_i. It is a locally closed substack of [R(Γ, L)/SL_r], where R(Γ, L) is the affine K-variety of tuples of matrices satisfying the relations of a presentation and the determinant conditions; it is an algebraic stack of finite type over K with automorphism group scheme μ_r at every object, its μ_r-rigidification is an algebraic space which is its coarse moduli space, and it has finitely many zero-dimensional irreducible components. For Γ = π₁(X, x) with X smooth quasi-projective and γ_i = T_i the local monodromy loops (HodgeStructuresPartII:H.5/boundary-monodromy-data), this is the moduli of irreducible local systems with determinant L and local monodromies in K_i; when the K_i are quasi-unipotent classes it is defined over a number field. For a split connected reductive G with abelianization θ the analogous stack of G-irreducible representations (Klevdal–Patrikis Proposition 4.4) is of finite type. With N = 0 and G = GL_r its coarse space contains the stable fixed-determinant Betti moduli M_B^s(Γ, r, δ) of HodgeStructuresPartII:H.1/betti-coarse as the coarse space of its ℂ-fibre.

**Hypotheses.**

- Γ finitely presented (π₁ of a smooth quasi-projective complex variety is finitely presented).
- K_i locally closed in GL_r, e.g. conjugacy classes of quasi-unipotent matrices; the condition ρ(γ_i) ∈ K_i is locally closed, not closed, when K_i is not closed.
- The quotient-stack and rigidification formalism (Abramovich–Corti–Vistoli) is requested from AlgebraicModuliForArithmeticGeometry:R09.4 and R09.5.

**Proof or construction.**

1. Choose a presentation ⟨r_1, …, r_e | s_1, …, s_f⟩ and L_j ∈ μ_d(K) with r_j ↦ L_j defining χ_L; R(Γ, L) = {(A_j) ∈ GL_r^e : det A_j = L_j, s_i(A) = 1} is affine of finite type, and [R(Γ,L)/SL_r] ≅ Rep(Γ, L) (Esnault–Groechenig 2018 Proposition 2.1 proof, with the misprints of source issue HodgeStructuresPartII/E-H5-5 corrected).
2. Geometric irreducibility is open: for a family W over T, the locus where some k-plane with 0 < k < r is Γ-invariant is the image of the closed fixed locus in the proper Grassmann bundle ⊔_{0<k<r} Gr(W, k), hence closed.
3. The local monodromy conditions are pullbacks of the locally closed K_i under the evaluations at γ_i, hence locally closed.
4. Automorphisms of a geometrically irreducible family with fixed determinant are μ_r (Schur's lemma and det(u·Id) = u^r); rigidify to obtain an algebraic space, which is a coarse moduli space (Esnault–Groechenig 2018 Remark 2.2).
5. A finite-type stack has finitely many irreducible components; isolated points are zero-dimensional components.

**Uses.**

- Esnault–Groechenig, Cohomologically rigid local systems and integrality, §2, Proposition 2.1 and Remark 2.2: The finite-type stack whose isolated points are the rigid local systems with prescribed boundary data; finiteness of S(r, d, h).
- Klevdal–Patrikis, G-rigid local systems are integral, §4, Proposition 4.4: The finite-type stack of G-irreducible representations with prescribed abelianization and classes; finiteness of isolated points in §5.
- Landesman–Litt, Canonical representations of surface groups, Remark 8.1.2: Moduli-theoretic interpretation of cohomological rigidity as a smooth isolated point of the character variety with fixed local monodromy.
- HodgeStructuresPartII:H.5/betti-tangent, HodgeStructuresPartII:H.5/prescribed-monodromy-tangent, HodgeStructuresPartII:H.5/rigid-number-field: Tangent spaces, isolated points and fields of definition are taken in this moduli.

**API.**

- `PrescribedMonodromyModuli` (constructor): The algebraic stack of finite type over K attached to (Γ, r, χ_L, (γ_i, K_i)).
- `PrescribedMonodromyModuli.coarse` (projection): Its μ_r-rigidification, an algebraic space of finite type over K that is a coarse moduli space.
- `PrescribedMonodromyModuli.points` (characterisation): For an algebraically closed Ω ⊃ K, the Ω-points of the coarse space are the isomorphism classes of irreducible ρ: Γ → GL_r(Ω) with det ρ = χ_L and ρ(γ_i) ∈ K_i(Ω).
- `PrescribedMonodromyModuli.automorphisms` (characterisation): Every object has automorphism group μ_r.
- `PrescribedMonodromyModuli.irreducible_open` (other): The geometrically irreducible locus is open in the stack of all representations with determinant L.
- `PrescribedMonodromyModuli.finite_isolated` (relation): The coarse space has finitely many isolated points (the rigid local systems with this data).
- `PrescribedMonodromyModuli.baseChange` (functoriality): Formation commutes with field extension; σ ∈ Aut(ℂ/K) acts on its ℂ-points by ρ ↦ σ∘ρ.
- `PrescribedMonodromyModuli.reductive` (other): For split connected reductive G, the stack of G-irreducible representations with abelianization θ and ρ(γ_i) ∈ K_i is algebraic of finite type (Klevdal–Patrikis Proposition 4.4).

**Unit tests.**

- `PrescribedMonodromyModuli.test_no_boundary` (degenerate): With N = 0 and K = ℂ, the coarse space of M(Γ, r, L) is M_B^s(Γ, r, δ_L) of HodgeStructuresPartII:H.1/betti-coarse.
- `PrescribedMonodromyModuli.test_rank_one` (computation): For r = 1, M(Γ, 1, L, ∅) is a single point with trivial automorphism group: the only object is the character χ_L itself.
- `PrescribedMonodromyModuli.test_free_group_dimension` (computation): For Γ = F_2 free, r = 2, L trivial and N = 0, the coarse space is irreducible of dimension 3 and has no isolated point.
- `PrescribedMonodromyModuli.test_locally_closed` (non-example): Prescribing K_1 = the conjugacy class of [[1,1],[0,1]] at γ_1 gives a locally closed but not closed condition: its closure in GL_2 contains the identity, which is not in K_1.

**Acceptance.** For N = 0 and G = GL_r the ℂ-points of the coarse space are the isomorphism classes of irreducible representations with determinant δ, as for M_B^s(Γ, r, δ). For r = 1 and N = 0 (or χ_L(γ_i) ∈ K_i for all i) the stack is the single object L with trivial automorphism group.

**Direct dependencies.** `HodgeStructuresPartII:H.5/boundary-monodromy-data`, `HodgeStructuresPartII:H.1/betti-framed`, `HodgeStructuresPartII:H.1/betti-coarse`, `HodgeStructuresPartII:H.1/stable-automorphisms`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Source passages.**

- [EG18](https://arxiv.org/pdf/1711.06436v3), §2, Proposition 2.1, p.4: “Then M is an algebraic stack of finite type defined over the number field K. In particular, it has finitely many 0-dimensional irreducible components.” — Finite type and finitely many isolated points.
- [EG18](https://arxiv.org/pdf/1711.06436v3), §2, Remark 2.2, p.5: “It follows from general theory that the stack M has a coarse moduli space.” — Coarse moduli by rigidification.
- [KP20](https://arxiv.org/pdf/2009.07350v2), §4, Proposition 4.4, p.8: “is an algebraic stack of finite type over K.” — The G-version.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions; good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops).

### Tangent space with prescribed local monodromy

**Theorem:** `PrescribedMonodromyModuli.tangent_eq`. Node: `HodgeStructuresPartII:H.5/prescribed-monodromy-tangent`.

In the setting of HodgeStructuresPartII:H.5/prescribed-monodromy-moduli with Γ = π₁(X, x), X smooth connected quasi-projective with good compactification and γ_i = T_i, let V be a geometrically irreducible K-local system in M(K) with monodromy ρ. The Zariski tangent space of M at [V] is H¹(U, a_* End⁰(V)), where a: X → U = X̄ ∖ D_sing; equivalently it is the kernel of the restriction map H¹(π₁(X, x), ad⁰ρ) → ⊕_{i=1}^{N} H¹(⟨T_i⟩, ad⁰ρ) (HodgeStructuresPartII:H.5/betti-tangent). In particular, if H¹(U, a_* End⁰(V)) = 0, then [V] is a reduced isolated point. The same holds with g^der in place of End⁰ for split reductive G (Klevdal–Patrikis Proposition 4.7).

**Hypotheses.**

- Characteristic-zero coefficient field K; V geometrically irreducible with fixed determinant and local monodromy classes.
- Degree-one sheaf cohomology of local systems on X and on punctured balls agrees with group cohomology of their fundamental groups.

**Proof or construction.**

1. Deformations over K[ε] with fixed determinant and local classes form a torsor under the group of cocycles in End⁰(V) that are trivial on every punctured ball Δ_i^×; Čech cocycles on a cover of X by balls give a class in H¹(X, End⁰(V)) (Esnault–Groechenig 2018 Proposition 2.3).
2. The local condition says the class restricts to zero in H¹(Δ_{ij}^×, End⁰(V)) for a cover of each D_i ∩ U; the kernel of H¹(X, End⁰V) → ⊕ H¹(Δ_{ij}^×, End⁰V) is H¹(U, a_* End⁰V) by the Leray spectral sequence for a.
3. Change of trivialization changes the cocycle by a coboundary, so the tangent space is that kernel; the group-theoretic form follows from H¹(X, ·) = H¹(π₁(X), ·) and H¹(Δ_i^×, ·) = H¹(ℤ·T_i, ·) (Klevdal–Patrikis Proposition 4.7 diagram).
4. Degree-one comparison between local-system cohomology and group cohomology is supplied by the singular cohomology with local coefficients of tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality and the Tau Ceti local coefficient systems.

**Acceptance.** When X is projective this is H¹(π₁(X,x), ad⁰ρ). For the hypergeometric local systems on ℙ¹ ∖ {0,1,∞} with non-scalar local monodromies the tangent space is zero, while H¹(π₁, ad⁰ρ) is three-dimensional.

**Direct dependencies.** `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`, `HodgeStructuresPartII:H.5/boundary-monodromy-data`, `HodgeStructuresPartII:H.5/trace-free-adjoint`, `HodgeStructuresPartII:H.5/betti-tangent`, `mathlib:groupCohomology.H1`, `tauceti:TauCeti.LocalCoefficientSystem`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source passages.**

- [EG18](https://arxiv.org/pdf/1711.06436v3), §2, Proposition 2.3, p.5: “In particular, if H 1 (U, a∗ End0 (V)) = 0, the geometrically irreducible K-local system is rigid, and there are finitely many such.” — Tangent space and the rigidity consequence.
- [KP20](https://arxiv.org/pdf/2009.07350v2), §4, Proposition 4.7, p.10: “The tangent space of M at the point [ρ0 ] is the finite-dimensional K-vector space H 1 (U, a∗ gder ).” — G-version.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions; good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops).

### First cohomology of the intermediate extension

**Comparison:** `h1_intermediateExtension_eq`. Node: `HodgeStructuresPartII:H.5/intermediate-extension-h1`.

Let X ⊂ X̄ be a good compactification with U = X̄ ∖ D_sing, X →a U →b X̄ and j = b∘a, and let F be a local system of finite-dimensional vector spaces on X over a field of characteristic zero. Then H¹(X̄, j_{!*}F) ≅ H¹(U, a_* F), where j_{!*} is the intermediate extension of F (placed in the appropriate perverse degree and shifted back): there is an exact triangle j_{!*}F → Rb_* a_* F → C with C supported on D_sing and concentrated in degrees ≥ 2. If the local monodromies of F are finite, j_{!*}F = j_*F; if X is a curve, j_{!*} = j_*. The same identity holds for lisse ℚ̄_ℓ-sheaves on varieties over finite fields (Esnault–Groechenig 2018 Lemma 3.4). Thus the j_{!*}-definitions of cohomological rigidity of Esnault–Groechenig, Klevdal–Patrikis and Landesman–Litt agree with the a_*-definition of HodgeStructuresPartII:H.5/cohomological-rigidity.

**Hypotheses.**

- Good compactification as in HodgeStructuresPartII:H.5/boundary-monodromy-data; coefficient field of characteristic zero.
- The étale intermediate extension and its recollement are requested from EtaleDualityAndPerverseSheaves:EDC.5; the analytic constructible version is recorded as a gap.

**Proof or construction.**

1. From BBD Proposition 2.1.11, j_{!*} is computed by successive truncated pushforwards along a stratification; along U it agrees with a_* (no truncation is needed in codimension one), giving the triangle with C supported on D_sing in degrees ≥ 2 (Esnault–Groechenig 2018 Remark 2.4).
2. Taking hypercohomology, H¹(C) = H⁰(C) = 0 gives H¹(X̄, j_{!*}F) ≅ H¹(X̄, Rb_* a_* F) ≅ H¹(U, a_* F).
3. Finite local monodromy: on a finite cover the local system extends, so j_{!*} = j_*; on curves D_sing = ∅ and U = X̄.

**Acceptance.** On ℙ¹ ∖ {0,1,∞}, H¹(ℙ¹, j_{!*}F) = H¹(ℙ¹, j_*F). For X projective both sides are H¹(X, F).

**Direct dependencies.** `HodgeStructuresPartII:H.5/boundary-monodromy-data`, `EtaleDualityAndPerverseSheaves:EDC.5`.

**Source passages.**

- [EG18](https://arxiv.org/pdf/1711.06436v3), §2, Remark 2.4, p.6: “Thus it induces an isomorphism on H1 . So Proposition 2.3 says T[V] = H1 (X̄, j!∗ End0 (V)).” — The intermediate-extension H¹ equals the a_* H¹.
- [KP20](https://arxiv.org/pdf/2009.07350v2), §4, Remark 4.8, p.10: “Remark 4.8. As was noted in [EG18, Remark 2.4], we have H 1 (U, a∗ gder ) = H 1 (X, j!∗ gder ), where j!∗ gder is the intermediate extension.” — Same identity for g^der.
- [LL24](https://arxiv.org/pdf/2205.15352v4), §8.1, Remark 8.1.2, p.38: “Note that if X is a curve, j!∗ = j∗ .” — Curve case.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops).

## H.5b. Hodge theory of rigid objects

The second group draws the Hodge-theoretic consequences. A rigid stable Higgs bundle is fixed by the scaling action, because the 𝔾_m-orbit through an isolated point is that point; since the Hitchin morphism has positive weights, its Hitchin image is zero and the Higgs field is nilpotent (Esnault–Groechenig Lemma 2.1). A Higgs bundle fixed by a scaling t that is not a root of unity is a system of Hodge bundles (Simpson Lemma 4.1), and systems of Hodge bundles correspond to polarized complex variations of Hodge structure under the harmonic correspondence. Hence rigid local systems underlie complex variations (Simpson Lemma 4.5), and every representation deforms to one that does (Simpson Theorem 3; Mochizuki in the quasi-projective case, used by Landesman–Litt Lemma 4.3.2). A polarized variation has vanishing graded Higgs field exactly when its monodromy is unitary. Finally, the rigid locus of the Hodge moduli is finite and flat over 𝔸¹, covered by the Rees sections of the rigid variations, and splits as the rigid Dolbeault locus times 𝔸¹ (Esnault–Groechenig Lemma 4.9; the equivariant splitting with non-reduced structure is recorded as a gap).

### Rigid Higgs bundles are fixed by scaling

**Theorem:** `IsRigidHiggs.gm_fixed`. Node: `HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed`.

Let X be smooth connected projective over ℂ and (V,θ) a rigid stable Higgs bundle with determinant (L,0) (HodgeStructuresPartII:H.5/rigid-connection). Then (V, tθ) ≅ (V, θ) for every t ∈ ℂ^×; equivalently [(V,θ)] is a fixed point of the 𝔾_m-action on M_Dol^s(X, (L,0), r).

**Hypotheses.**

- X smooth connected projective; (V,θ) slope stable, trace-free, with vanishing rational Chern classes and determinant (L,0); rigidity is isolation in M_Dol^s(X,(L,0),r).

**Proof or construction.**

1. Scaling θ ↦ tθ preserves stability, the vanishing-Chern-class component, the determinant (L,0) and tr θ = 0, and defines an algebraic 𝔾_m-action on M_Dol^s(X,(L,0),r) (HodgeStructuresPartII:H.1/hodge-scaling at λ = 0).
2. The orbit map 𝔾_m → M_Dol^s, t ↦ [(V,tθ)], is a morphism from a connected variety; its image is connected and contains the isolated point [(V,θ)], which is open in the image, so the image is that point.
3. Points of the stable locus are isomorphism classes of stable objects (HodgeStructuresPartII:H.1/dolbeault-coarse), hence (V,tθ) ≅ (V,θ).

**Acceptance.** For r = 1, (L, 0) is fixed by every t. The fixed points of 𝔾_m need not be rigid: on a compact curve of genus ≥ 2 the uniformizing system of Hodge bundles is fixed and lies on a positive-dimensional moduli.

**Direct dependencies.** `HodgeStructuresPartII:H.5/rigid-connection`, `HodgeStructuresPartII:H.1/hodge-scaling`, `HodgeStructuresPartII:H.1/dolbeault-coarse`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §2.1, Lemma 2.1 proof, p.109: “Therefore, the Gm -family (V, λθ) is a non-trivial deformation. This contradicts rigidity of (V, θ).” — Scaling gives a 𝔾_m-family through a rigid point, which must be constant.
- [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §4, proof of Lemma 4.5, p.51: “The representation (E, 6) is rigid as a representation in G, so for some i, the representation (E, ^ 6) is conjugate to the representation (E, 6).” — Rigidity forces (E, tθ) ≅ (E, θ).

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions; algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology).

### Rigid Higgs fields are nilpotent

**Theorem:** `IsRigidHiggs.nilpotent`. Node: `HodgeStructuresPartII:H.5/rigid-higgs-nilpotent`.

Let X be smooth connected projective over ℂ and (V,θ) a rigid stable Higgs bundle of rank r with determinant (L,0). Then the Hitchin image h(V,θ) ∈ A_r = ⊕_{i=2}^{r} H⁰(X, Sym^i Ω¹_X) is zero, the characteristic polynomial of θ is T^r, and θ is nilpotent: every composite θ_{v_1} ∘ ⋯ ∘ θ_{v_r} of r components of θ vanishes, i.e. the joint nilpotence bound r holds (HodgeStructuresPartII:H.0/joint-nilpotence).

**Hypotheses.**

- X smooth connected projective over ℂ; (V,θ) rigid stable, trace-free, determinant (L,0).
- Characteristic zero (the Hitchin coefficients determine nilpotence via Cayley–Hamilton).

**Proof or construction.**

1. By HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed, (V,tθ) ≅ (V,θ) for all t ∈ ℂ^×, so h(V,θ) = h(V,tθ).
2. The Hitchin morphism is 𝔾_m-equivariant with weight i on H⁰(Sym^i Ω¹) (HodgeStructuresPartII:H.1/hitchin-map API scale), so a_i(θ) = t^i a_i(θ) for all t and i ≥ 2, forcing a_i(θ) = 0 (Esnault–Groechenig Lemma 2.1: positive weights).
3. At each point x and tangent covector direction the endomorphism θ(v) ∈ End(V_x) has characteristic polynomial T^r, hence is nilpotent (Mathlib LinearMap.isNilpotent_iff_charpoly); the θ(v) commute because θ ∧ θ = 0, so they are simultaneously strictly triangularizable and any product of r of them vanishes.

**Acceptance.** For r = 1 the Higgs field of a rigid object is zero. On X with H⁰(X, Sym^i Ω¹) = 0 for all i > 0 every Higgs bundle on M_Dol has nilpotent field (the Hitchin base is a point).

**Direct dependencies.** `HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed`, `HodgeStructuresPartII:H.1/hitchin-map`, `HodgeStructuresPartII:H.0/joint-nilpotence`, `HodgeStructuresPartII:H.0/nilpotence-filtration`, `mathlib:LinearMap.isNilpotent_iff_charpoly`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §2.1, Lemma 2.1, p.109: “Lemma 2.1. If (V, θ) is a rigid stable Higgs bundle, then θ is nilpotent.” — Statement.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §2.1, Lemma 2.1 proof, p.109: “Since the Gm -action on the space of characteristic polynomials has positive weights, and a=χ(θ) is non-zero, we obtain a non-trivial deformation of characteristic polynomials.” — Positive weights of the Hitchin base.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions; algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology).

### Systems of Hodge bundles

**Definition:** `SystemOfHodgeBundles`. Node: `HodgeStructuresPartII:H.5/system-of-hodge-bundles`.

Let X be a complex manifold (or smooth variety over a field). A system of Hodge bundles is a Higgs bundle (E,θ) together with a decomposition E = ⊕_{p∈ℤ} E^p into locally free subsheaves, finitely many nonzero, such that θ(E^p) ⊂ E^{p−1} ⊗ Ω¹_X. Morphisms preserve the decomposition and commute with θ; the shift E[k]^p = E^{p+k} is an isomorphism of underlying Higgs bundles. Every system of Hodge bundles is a fixed point of scaling: multiplication by t^p on E^p is an isomorphism (E,θ) ≅ (E,tθ). The associated graded (⊕_p Gr^p_F E, gr ∇) of a Griffiths-transverse filtration F of a flat bundle (HodgeStructuresPartII:H.0/graded-higgs) is a system of Hodge bundles with E^p = Gr^p_F E.

**Hypotheses.**

- θ is an integrable Higgs field (θ ∧ θ = 0), as in HodgeStructuresPartII:H.0/twisted-higgs with trivial twist.
- The grading is by subbundles (locally free summands), not merely subsheaves.

**Proof or construction.**

1. Define the structure as a Higgs bundle with a finite ℤ-grading for which θ has degree −1.
2. Scaling isomorphism: φ_t = ⊕ t^p·id_{E^p} satisfies φ_t θ = t θ φ_t on E^p, since θ maps E^p to E^{p−1}.
3. Nilpotence: θ lowers degree by one, so θ^N = 0 when the nonzero degrees lie in an interval of length N − 1; trace zero because θ is off the block diagonal.
4. Griffiths transversality ∇F^p ⊂ F^{p−1} ⊗ Ω¹ gives gr ∇: Gr^p_F → Gr^{p−1}_F ⊗ Ω¹, which is O-linear and integrable (HodgeStructuresPartII:H.0/graded-higgs-integrable).

**Uses.**

- Simpson, Higgs bundles and local systems, §4 pp.44–45 and Lemma 4.1: Higgs bundles corresponding to complex variations of Hodge structure are exactly the systems of Hodge bundles, and the fixed points of scaling.
- Esnault–Groechenig, Rigid connections and F-isocrystals, Lemma 4.9 and §4.2: The rigid Higgs bundle at λ = 0 of a rigid Hodge family is the graded Higgs bundle (gr_F E, gr_F ∇) of the variation at λ = 1.
- Simpson, The Hodge filtration on nonabelian cohomology, Lemma 7.2: 𝔾_m-equivariant sections of the Hodge moduli correspond to filtered flat bundles satisfying Griffiths transversality.
- HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles, HodgeStructuresPartII:H.5/cvhs-hodge-bundles, HodgeStructuresPartII:H.5/rigid-hodge-splitting: Characterization of scaling-fixed Higgs bundles and the variation correspondence.

**API.**

- `SystemOfHodgeBundles` (structure): A Higgs bundle (E,θ) with a finite decomposition E = ⊕_p E^p into subbundles with θ(E^p) ⊂ E^{p−1} ⊗ Ω¹.
- `SystemOfHodgeBundles.contract` (projection): For a tangent vector v (a covector on Ω¹ in a chart), the component θ_v: E → E of the Higgs field; θ_v maps E^p to E^{p−1}.
- `SystemOfHodgeBundles.scaleIso` (constructor): For t ∈ ℂ^×, the isomorphism (E,θ) ≅ (E,tθ) acting by t^p on E^p.
- `SystemOfHodgeBundles.shift` (constructor): The shift E[k], with the same underlying Higgs bundle.
- `SystemOfHodgeBundles.nilpotent` (relation): θ is nilpotent with joint bound the number of nonzero degrees (HodgeStructuresPartII:H.0/joint-nilpotence).
- `SystemOfHodgeBundles.trace_eq_zero` (simp): tr θ = 0.
- `SystemOfHodgeBundles.ofGriffiths` (compatibility): The associated graded Higgs bundle of a Griffiths-transverse filtration (HodgeStructuresPartII:H.0/graded-higgs) with E^p = Gr^p_F.
- `SystemOfHodgeBundles.determinant` (projection): det E = ⊗_p det E^p, with determinant Higgs field 0.
- `SystemOfHodgeBundles.hom_graded` (other): Morphisms of systems of Hodge bundles are degree-preserving morphisms of Higgs bundles; for stable underlying Higgs bundles every Higgs isomorphism between systems is graded up to shift (HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles).

**Unit tests.**

- `SystemOfHodgeBundles.test_single_degree` (degenerate): For any vector bundle E, (E, 0) with E = E^0 is a system of Hodge bundles, and every system with a single nonzero degree has θ = 0.
- `SystemOfHodgeBundles.test_uniformizing` (computation): On a compact curve C of genus ≥ 2 with a theta characteristic K^{1/2}, E^1 = K^{1/2}, E^0 = K^{−1/2} and θ: E^1 → E^0 ⊗ K the identity of K^{1/2} form a system of Hodge bundles with θ ≠ 0 and θ² = 0.
- `SystemOfHodgeBundles.test_trace_zero` (characterisation): For every system of Hodge bundles, tr θ = 0 and θ^N = 0 where N is the number of nonzero degrees.
- `SystemOfHodgeBundles.test_nonnilpotent_not_hodge` (non-example): For a nonzero holomorphic 1-form ω on X, (O ⊕ O, diag(ω, −ω)) is a trace-free Higgs bundle whose field is not nilpotent, so it admits no structure of system of Hodge bundles.
- `SystemOfHodgeBundles.test_scale_iso` (characterisation): For a system with degrees {0, 1} and t ∈ ℂ^×, the map t·id on E^1 and id on E^0 is an isomorphism (E,θ) ≅ (E,tθ).

**Acceptance.** A Higgs bundle with zero field is a system of Hodge bundles in a single degree. The Higgs bundle K^{1/2} ⊕ K^{−1/2} with θ the identity K^{1/2} → K^{−1/2} ⊗ K on a curve of genus ≥ 2 is a system of Hodge bundles with two pieces.

**Direct dependencies.** `HodgeStructuresPartII:H.0/twisted-higgs`, `HodgeStructuresPartII:H.0/graded-higgs`, `HodgeStructuresPartII:H.0/graded-higgs-integrable`, `HodgeStructuresPartII:H.0/joint-nilpotence`, `HodgeStructuresPartII:H.0/griffiths-filtration`.

**Source passages.**

- [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §4, p.44: “A system of Hodge bundles is a Higgs bundle (E, 6) with a decompo- sition of locally free sheaves” — Definition (θ printed as 6 in the scan).
- [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §4, p.45: “If a Higgs bundle E has a structure of system of Hodge bundles, then it is a fixed point of C*.” — Systems of Hodge bundles are scaling-fixed.

**Suggested file.** 10 names declared or stated as examples; 4 listed in the omission inventory (missing carriers: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology; polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles).

### Scaling-fixed Higgs bundles are systems of Hodge bundles

**Theorem:** `SystemOfHodgeBundles.of_scale_iso`. Node: `HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles`.

Let X be a compact connected complex manifold and (E,θ) a Higgs bundle with (E,θ) ≅ (E,tθ) for some t ∈ ℂ^× that is not a root of unity. Then E has a structure of system of Hodge bundles; if (E,θ) is stable, this structure is unique up to shift of indices.

**Hypotheses.**

- X compact and connected, so global holomorphic functions are constant.
- t is not a root of unity.

**Proof or construction.**

1. Let f: E → E be a holomorphic automorphism with fθ = tθf. The coefficients of its characteristic polynomial are holomorphic functions on X, hence constant, so f has constant eigenvalues and E = ⊕_λ E_λ with E_λ = ker(f − λ)^n (Simpson Lemma 4.1).
2. From (f − tλ)^n θ = t^n θ (f − λ)^n, θ maps E_λ into E_{tλ} ⊗ Ω¹.
3. Since t is not a root of unity, the eigenvalues split into strings λ, tλ, …, t^k λ with t⁻¹λ and t^{k+1}λ not eigenvalues; index each string by its exponent to obtain the grading.
4. If (E,θ) is stable, its endomorphisms are scalars, so f is determined up to a scalar and the grading up to a shift.

**Acceptance.** A system of Hodge bundles satisfies the hypothesis for every t (HodgeStructuresPartII:H.5/system-of-hodge-bundles). The non-nilpotent Higgs bundle (O ⊕ O, diag(ω, −ω)) satisfies the hypothesis for no t that is not a root of unity.

**Direct dependencies.** `HodgeStructuresPartII:H.5/system-of-hodge-bundles`.

**Source passages.**

- [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §4, Lemma 4.1, p.45: “for some t e C* which is not a root of unity, then E has a structure of system of Hodge bundles. IfE is stable then this structure is unique up to translation of indices.” — Statement (OCR of t ∈ ℂ^*).
- [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §4, proof of Lemma 4.1, p.45: “The coefficients of the characteristic polynomial off are holomorphic functions on X, hence constant, so the eigenvalues are constant.” — Constant eigenvalues on a compact base.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology).

### Variations of Hodge structure and systems of Hodge bundles

**Comparison:** `cvhs_equiv_hodgeBundles`. Node: `HodgeStructuresPartII:H.5/cvhs-hodge-bundles`.

Let X be a compact Kähler manifold (in this layer, smooth connected projective over ℂ). (a) A polarized complex variation of Hodge structure (V = ⊕_{p+q=w} V^{p,q}, flat D satisfying Griffiths transversality, flat Hermitian form ψ making the decomposition orthogonal, definite of sign (−1)^p on V^{p,q}) supplied by HodgeStructuresPartII:H.2 determines, with the sign-alternated polarization K, a harmonic bundle (HodgeStructuresPartII:H.1/harmonic-bundle) with D = ∂ + ∂̄ + θ + θ̄, whose Higgs bundle is the system of Hodge bundles (⊕_p Gr^p_F, gr_F D) with Gr^p_F = V^{p,w−p} (HodgeStructuresPartII:H.0/graded-higgs). (b) Conversely, under the projective harmonic correspondence (HodgeStructuresPartII:H.1/harmonic-correspondence), the semisimple flat bundle corresponding to a polystable system of Hodge bundles with vanishing rational Chern classes carries a polarized complex variation of Hodge structure whose associated graded is the given system; the structures of polarized complex variation on a semisimple local system correspond bijectively to the structures of system of Hodge bundles on its Higgs bundle. (c) Consequently the semisimple representations of π₁(X) underlying complex variations of Hodge structure are exactly the semisimple ones fixed by the 𝔾_m-action (Simpson Corollary 4.2).

**Hypotheses.**

- X compact Kähler (smooth projective in all uses here).
- Polarized complex variations in the sense of Deligne and Simpson (no real or integral lattice); their carrier, Griffiths transversality and semisimplicity are supplied by HodgeStructuresPartII:H.2 (from ShimuraData:D3).

**Proof or construction.**

1. (a) Decompose D by type and Hodge degree: Griffiths transversality gives D = ∂ + ∂̄ + θ + θ̄ with θ: V^{p,q} → V^{p−1,q+1} ⊗ A^{1,0}; changing the sign of ψ on alternate V^{p,q} gives a positive metric K, and D″ = ∂̄ + θ is the operator of the harmonic metric K (Simpson 1992 §4 p.44).
2. Identify the holomorphic bundle (V, ∂̄) with ⊕_p F^p/F^{p+1} using the C^∞ splitting by the V^{p,q}; then θ is the graded symbol gr_F D (HodgeStructuresPartII:H.0/graded-higgs).
3. (b) A system of Hodge bundles is fixed by the U(1) ⊂ ℂ^× action preserving the harmonic metric; the automorphisms t^p on E^p are then unitary for the harmonic metric, so the metric makes the grading orthogonal and D preserves the induced C^∞ decomposition up to θ, θ̄, which is a polarized complex variation (Simpson 1992 §4 and [47] = Simpson 1988 §8). Bijectivity follows from (a) and the uniqueness of the harmonic correspondence.
4. (c) Combine (b) with HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles (fixed points are systems of Hodge bundles) and the equivariance of the correspondence for the U(1)-action.

**Acceptance.** A unitary local system with a single Hodge degree corresponds to (E, 0). The uniformizing variation of a compact curve of genus ≥ 2 corresponds to K^{1/2} ⊕ K^{−1/2} with θ = id.

**Direct dependencies.** `HodgeStructuresPartII:H.5/system-of-hodge-bundles`, `HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles`, `HodgeStructuresPartII:H.0/graded-higgs`, `HodgeStructuresPartII:H.1/harmonic-bundle`, `HodgeStructuresPartII:H.1/harmonic-correspondence`, `HodgeStructuresPartII:H.2`.

**Source passages.**

- [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §4, p.44: “one obtains a harmonic metric K for the flat connection.” — The sign-alternated polarization is a harmonic metric.
- [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §4, p.44: “Moreover, there is a one-to-one correspondence between the possible variations of Hodge structure on a given local system, and the structures of system of Hodge bundles on the corresponding Higgs bundle.” — Bijection of structures.
- [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §4, Corollary 4.2, p.45: “The representations of T^(X) which come from complex variations of Hodge structure are exactly the semisimple ones which are fixed by the action of C*.” — Fixed points of the scaling action.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles; algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology).

### Rigid local systems underlie complex variations of Hodge structure

**Theorem:** `IsRigidConnection.underlies_cvhs`. Node: `HodgeStructuresPartII:H.5/rigid-underlies-cvhs`. Planet: *Rigid local systems are variations*.

Let X be smooth connected projective over ℂ and (E,∇) a rigid stable flat connection with torsion determinant (L,∇_L) (HodgeStructuresPartII:H.5/rigid-connection). Then (E,∇) underlies a polarized complex variation of Hodge structure: there is a Griffiths-transverse filtration F^• of E (∇F^i ⊂ F^{i−1} ⊗ Ω¹) with polarization, unique up to shift of indices, and the associated graded Higgs bundle (Gr_F E, gr_F ∇) is the rigid stable Higgs bundle corresponding to (E,∇) under HodgeStructuresPartII:H.5/rigid-correspondence. The complex variation need not have a real or integral structure. More generally (Simpson Lemma 4.5) every properly rigid reductive representation of π₁(X) into a reductive group comes from a complex variation of Hodge structure.

**Hypotheses.**

- X smooth connected projective; (E,∇) stable (irreducible) and isolated in M_dR^s(X, r, L).

**Proof or construction.**

1. The corresponding Higgs bundle (V,θ) is rigid stable (HodgeStructuresPartII:H.5/rigid-correspondence), hence fixed by scaling (HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed).
2. By HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles, (V,θ) is a system of Hodge bundles, unique up to shift since it is stable.
3. By HodgeStructuresPartII:H.5/cvhs-hodge-bundles (b), the corresponding flat bundle (E,∇) carries a polarized complex variation of Hodge structure with associated graded (V,θ); its Hodge filtration F is Griffiths transverse.
4. Uniqueness up to shift: two variation structures give two system-of-Hodge-bundles structures on the stable (V,θ), which differ by a shift.

**Acceptance.** In rank one the variation is the unitary character placed in a single degree. Every rigid connection has nilpotent graded Higgs field (HodgeStructuresPartII:H.5/rigid-higgs-nilpotent).

**Direct dependencies.** `HodgeStructuresPartII:H.5/rigid-connection`, `HodgeStructuresPartII:H.5/rigid-correspondence`, `HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed`, `HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles`, `HodgeStructuresPartII:H.5/cvhs-hodge-bundles`, `HodgeStructuresPartII:H.0/griffiths-filtration`.

**Source passages.**

- [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §4, Lemma 4.5, p.51: “Any properly rigid reductive representation comes from a complex variation of Hodge structure.” — Simpson's theorem.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §4.2, Lemma 4.9, p.132: “is the moduli point of a com- plex variation of Hodge structure” — Rigid connections are moduli points of complex variations with Griffiths-transverse filtration and associated graded Higgs bundle.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §1, p.104: “Non-abelian Hodge theory implies that rigid flat connections give rise to complex variations of Hodge structure on X.” — Context and attribution to Simpson.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles; algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology).

### Deformation of representations to complex variations

**Theorem:** `deformation_to_cvhs`. Node: `HodgeStructuresPartII:H.5/deformation-to-cvhs`.

(a) Let X be smooth connected projective over ℂ and G a reductive complex group. Every representation ρ: π₁(X) → G(ℂ) can be deformed, inside Hom(π₁(X), G), to a representation underlying a complex variation of Hodge structure; for G = GL_r and ρ with finite determinant the deformation can be taken with constant determinant. (b) (Mochizuki, as stated by Landesman–Litt Theorem 4.3.1) Let X̄ be smooth projective, D ⊂ X̄ a strict normal crossings divisor and X = X̄ ∖ D. Every ρ: π₁(X) → GL_r(ℂ) with finite determinant admits a deformation with constant determinant to a representation underlying a polarizable complex variation of Hodge structure; the G-version for a reductive Zariski closure (Mochizuki Lemma 10.13) deforms within G.

**Hypotheses.**

- (a) X smooth projective. (b) X quasi-projective with strict normal crossings compactification and finite determinant.
- Part (b) rests on Mochizuki's tame harmonic bundle theory, which no layer of the atlas plans; it is recorded with its hypotheses and a gap.

**Proof or construction.**

1. (a) Deform ρ to a semisimple representation: put it in block upper triangular form and conjugate by diagonal matrices so the off-diagonal blocks tend to zero (Simpson 1992 Theorem 3 proof; Morozov's one-parameter subgroups for general reductive G).
2. For semisimple ρ with corresponding polystable Higgs bundle (V,θ), the points (V, tθ) have Hitchin images t^i a_i → 0 as t → 0; by properness of the semistable Hitchin morphism (HodgeStructuresPartII:H.1/hitchin-properness) a limit point (V₀,θ₀) exists in the same connected component; it is fixed by 𝔾_m.
3. By HodgeStructuresPartII:H.5/cvhs-hodge-bundles (c), the corresponding semisimple representation underlies a complex variation; the path t ↦ (V, tθ) and the limit lie in one connected component of the moduli, so ρ deforms to it. Fixed determinant: scaling preserves the determinant (L,0).
4. (b) Quasi-projective case: replace the projective harmonic theory by Mochizuki's Kobayashi–Hitchin correspondence for tame harmonic bundles and its Theorem 10.5 / Lemma 10.13; the determinant statement is obtained by examining the proof (Landesman–Litt Theorem 4.3.1 proof). Recorded as a source-gated input.

**Acceptance.** A rigid representation, which admits no nontrivial deformation, underlies a complex variation (consistent with HodgeStructuresPartII:H.5/rigid-underlies-cvhs). In rank one with finite determinant the deformation is constant.

**Direct dependencies.** `HodgeStructuresPartII:H.5/cvhs-hodge-bundles`, `HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed`, `HodgeStructuresPartII:H.1/hitchin-map`, `HodgeStructuresPartII:H.1/hitchin-properness`, `HodgeStructuresPartII:H.1/harmonic-correspondence`, `HodgeStructuresPartII:H.5/boundary-monodromy-data`.

**Source passages.**

- [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §4, Theorem 3, p.52: “Any representation p : TTi(X) -> G can be deformed to a representation which comes from a variation of Hodge structure.” — Projective case.
- [LL24](https://arxiv.org/pdf/2205.15352v4), §4.3, Theorem 4.3.1, p.27: “Any representation ρ : π1 ( X ) → GLr (C) with finite determinant admits a deformation with constant determinant to a representation underlying a complex PVHS.” — Quasi-projective case after Mochizuki.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions; polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles; good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops).

### Strongly cohomologically rigid semisimple representations underlie variations

**Theorem:** `IsStronglyCohomologicallyRigid.underlies_pvhs`. Node: `HodgeStructuresPartII:H.5/coh-rigid-semisimple-cvhs`.

Let X̄ be smooth projective, D ⊂ X̄ a strict normal crossings divisor and X = X̄ ∖ D. Let ρ: π₁(X) → GL_r(ℂ) be semisimple with finite determinant and H¹(X, ad ρ) = 0 (strongly cohomologically rigid, HodgeStructuresPartII:H.5/strong-cohomological-rigidity). Then ρ underlies a polarizable complex variation of Hodge structure on X.

**Hypotheses.**

- ρ semisimple with finite determinant; H¹(X, ad⁰ρ) = 0 on X itself (no boundary condition).
- Uses the G-version of HodgeStructuresPartII:H.5/deformation-to-cvhs (b) for G the Zariski closure of the image.

**Proof or construction.**

1. Let G be the Zariski closure of ρ(π₁(X)); it is reductive since ρ is semisimple, and g = Lie G ⊂ sl_r because det ρ is finite.
2. ad⁰ρ is semisimple, so g is a π₁-stable direct summand of ad⁰ρ and H¹(X, g) ⊂ H¹(X, ad⁰ρ) = 0: ρ is cohomologically rigid as a G-representation.
3. Mochizuki's Lemma 10.13 (HodgeStructuresPartII:H.5/deformation-to-cvhs (b), G-version) deforms ρ within Hom(π₁(X), G) to ρ₀ underlying a polarizable complex variation.
4. H¹(X, g) = 0 means the G-conjugation orbit of ρ is open in Hom(π₁(X), G), so the deformation is trivial: ρ₀ is conjugate to ρ and ρ underlies a variation (Landesman–Litt Lemma 4.3.2).

**Acceptance.** For X projective this specializes to HodgeStructuresPartII:H.5/rigid-underlies-cvhs for cohomologically rigid irreducible ρ. Rank one: finite-order characters underlie variations of a single Hodge type.

**Direct dependencies.** `HodgeStructuresPartII:H.5/strong-cohomological-rigidity`, `HodgeStructuresPartII:H.5/deformation-to-cvhs`, `HodgeStructuresPartII:H.5/trace-free-adjoint`, `HodgeStructuresPartII:H.2`.

**Source passages.**

- [LL24](https://arxiv.org/pdf/2205.15352v4), §4.3, Lemma 4.3.2, p.27: “Suppose in addition that ρ is semisimple with finite determinant and H 1 ( X, ad ρ) = 0. Then ρ underlies a complex PVHS.” — Statement.
- [LL24](https://arxiv.org/pdf/2205.15352v4), §4.3, proof of Lemma 4.3.2, p.27: “But ρ is rigid and hence admits no non-trivial deformations. This implies ρ = ρ0 , so ρ underlies a PVHS.” — Rigidity kills the deformation.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles; good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops).

### Unitary representations and local systems

**Definition:** `IsUnitaryRepresentation`. Node: `HodgeStructuresPartII:H.5/unitary-representation`.

A representation ρ: Γ → GL_r(ℂ) is unitary if its image has compact closure in GL_r(ℂ). Equivalently ρ preserves a positive-definite Hermitian form on ℂ^r, equivalently ρ is GL_r(ℂ)-conjugate to a representation with values in the unitary group U(r) = Matrix.unitaryGroup (Fin r) ℂ. A complex local system (flat bundle) is unitary if its monodromy representation is. Unitarity is a property of a representation into GL_r(ℂ) with its analytic topology, attached to the given embedding of the coefficients in ℂ; it is not preserved by field automorphisms of ℂ.

**Hypotheses.**

- Γ any group; ℂ with its usual topology; the compact-closure and invariant-form definitions agree by averaging over the compact closure with Haar measure.

**Proof or construction.**

1. If the closure H of ρ(Γ) is compact, average the standard Hermitian form over H with normalized Haar measure to obtain an invariant positive-definite form; an orthonormal basis for it conjugates ρ into U(r).
2. Conversely U(r) is compact (TauCeti.Matrix.isCompact_unitaryGroup, from Mathlib's entry bound entry_norm_bound_of_unitary), and conjugation is a homeomorphism, so the closure of the image of a conjugate of a U(r)-valued representation is compact.

**Uses.**

- Landesman–Litt, Canonical representations of surface groups, Notation 1.10.2: Unitary means compact closure; unitary local systems are those preserving a positive-definite Hermitian form.
- Esnault–Groechenig, Rigid connections and F-isocrystals, Theorem 1.8, §6 and Remark 6.2: Rigid connections with vanishing p-curvature have unitary monodromy; unitarity plus strong integrality gives finite monodromy.
- Landesman–Litt, Geometric local systems on very general curves and isomonodromy, Lemma 7.2.1 and Theorem 1.2.12: Unitarity at every embedding of an integral representation gives finiteness; low-rank variations on general curves are unitary.
- HodgeStructuresPartII:H.5/zero-higgs-unitary, HodgeStructuresPartII:H.5/unitary-embeddings-finite, HodgeStructuresPartII:H.5/infinite-image-unitary-example: Consumers.

**API.**

- `IsUnitaryRepresentation` (constructor): IsCompact (closure (Set.range ρ)) for ρ: Γ →* GL (Fin r) ℂ with the topology of matrices.
- `IsUnitaryRepresentation.iff_conj_unitaryGroup` (characterisation): IsUnitaryRepresentation ρ ↔ ∃ P ∈ GL_r(ℂ), ∀ γ, P ρ(γ) P⁻¹ ∈ Matrix.unitaryGroup (Fin r) ℂ.
- `IsUnitaryRepresentation.iff_invariant_form` (characterisation): IsUnitaryRepresentation ρ ↔ ρ preserves a positive-definite Hermitian form on ℂ^r.
- `IsUnitaryRepresentation.semisimple` (relation): A unitary representation is semisimple (orthogonal complements of subrepresentations are subrepresentations).
- `IsUnitaryRepresentation.of_finite` (relation): Finite image implies unitary.
- `IsUnitaryRepresentation.dual_iff_conj` (relation): For unitary ρ the dual representation is isomorphic to the complex conjugate ρ̄.
- `IsUnitaryRepresentation.comp` (functoriality): Restriction along a group homomorphism Γ′ → Γ, direct sums, tensor products and subrepresentations of unitary representations are unitary.
- `IsUnitaryRepresentation.not_aut_invariant` (other): For σ ∈ Aut(ℂ) not equal to the identity or complex conjugation, σ∘ρ need not be unitary (HodgeStructuresPartII:H.5/infinite-image-unitary-example).

**Unit tests.**

- `IsUnitaryRepresentation.test_rank_one` (computation): A character χ: Γ → ℂ^× is unitary iff |χ(γ)| = 1 for every γ ∈ Γ.
- `IsUnitaryRepresentation.test_unipotent` (non-example): ρ: ℤ → GL_2(ℂ), 1 ↦ [[1,1],[0,1]], is not unitary: ρ(n) = [[1,n],[0,1]] is unbounded.
- `IsUnitaryRepresentation.test_finite_image` (degenerate): If Γ is finite (or ρ has finite image) then ρ is unitary.
- `IsUnitaryRepresentation.test_unitaryGroup_valued` (compatibility): If ρ(γ) ∈ Matrix.unitaryGroup (Fin r) ℂ for all γ, then ρ is unitary (TauCeti.Matrix.isCompact_unitaryGroup).
- `IsUnitaryRepresentation.test_galois_nonexample` (non-example): For α = a root of x⁴ − x³ − x² − x + 1 on the unit circle and σ ∈ Aut(ℂ) sending α to the real root of modulus > 1, the character n ↦ α^n of ℤ is unitary and its σ-conjugate is not.

**Acceptance.** Finite-image representations are unitary. A nontrivial unipotent representation is not unitary.

**Direct dependencies.** `mathlib:Matrix.unitaryGroup`, `mathlib:entry_norm_bound_of_unitary`, `tauceti:TauCeti.Matrix.isCompact_unitaryGroup`, `mathlib:Matrix.GeneralLinearGroup`.

**Source passages.**

- [LL24](https://arxiv.org/pdf/2205.15352v4), §1.10, Notation 1.10.2, p.10: “A representation π1 ( X, x ) → GLr (C) is unitary if its image has compact closure.” — Definition.
- [LL24](https://arxiv.org/pdf/2205.15352v4), §1.10, Notation 1.10.2, p.10: “unitary representations are exactly those that preserve a positive-definite Hermitian form on Cn , i.e. they are conjugate to a representation that factors through the unitary group U(n).” — Equivalent characterizations.

**Suggested file.** 12 names declared or stated as examples; 1 listed in the omission inventory (missing carriers: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology).

### Vanishing graded Higgs field characterizes unitary variations

**Theorem:** `gradedHiggs_eq_zero_iff_unitary`. Node: `HodgeStructuresPartII:H.5/zero-higgs-unitary`.

Let X be a compact connected Kähler manifold (smooth projective in this layer) and (V, F, ∇, ψ) a polarized complex variation of Hodge structure with associated graded Higgs field θ = gr_F ∇: Gr_F V → Gr_F V ⊗ Ω¹ (its Kodaira–Spencer class). Then θ = 0 if and only if the monodromy of ∇ is unitary. When the underlying local system is irreducible, θ = 0 forces the Hodge filtration to have a single nonzero graded piece. No integral or real structure is assumed.

**Hypotheses.**

- X compact connected Kähler.
- The variation is polarized (Simpson's complex variations carry a flat Hermitian polarization).

**Proof or construction.**

1. (θ = 0 ⇒ unitary) Write D = ∂ + ∂̄ + θ + θ̄ for the sign-alternated polarization K (HodgeStructuresPartII:H.5/cvhs-hodge-bundles (a)). If θ = 0 then D = ∂ + ∂̄ is the K-unitary connection, so K is a flat positive-definite Hermitian metric and the monodromy is unitary (HodgeStructuresPartII:H.5/unitary-representation).
2. (unitary ⇒ θ = 0) A unitary local system is semisimple and its flat invariant metric is harmonic with Higgs field 0. The Hodge metric K is also harmonic, with Higgs field θ. The harmonic Higgs bundle of a semisimple flat bundle is independent of the harmonic metric up to isomorphism (HodgeStructuresPartII:H.1/flat-metric-existence), so (Gr_F V, θ) ≅ (V_hol, 0) and θ = 0.
3. Irreducible case: if θ = 0, each F^p is a flat subbundle (Griffiths transversality with zero symbol), so irreducibility leaves a single nonzero Gr^p.

**Acceptance.** Rank one: every polarized complex variation of rank one has θ = 0 and is unitary. The uniformizing variation of a compact curve of genus ≥ 2 has θ ≠ 0 and its monodromy, a discrete cocompact subgroup of SL_2(ℝ), is not unitary.

**Direct dependencies.** `HodgeStructuresPartII:H.5/cvhs-hodge-bundles`, `HodgeStructuresPartII:H.5/unitary-representation`, `HodgeStructuresPartII:H.1/flat-metric-existence`, `HodgeStructuresPartII:H.0/graded-higgs`, `HodgeStructuresPartII:H.2`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §6, p.145: “A complex variation of Hodge structure has unitary monodromy if and only if its Kodaira–Spencer class” — Statement used in the proof of Theorem 6.1.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §6, proof of Theorem 6.1, p.146: “Vanishing of the Kodaira–Spencer class implies that ∇ is a unitary con- nection.” — Direction used by Esnault–Groechenig.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles).

### The rigid locus of the Hodge moduli

**Construction:** `HodgeRigidLocus`. Node: `HodgeStructuresPartII:H.5/hodge-rigid-locus`.

Let X be smooth connected projective over ℂ, L torsion and r ≥ 1, and let q: M_Hod^s(X, r, L) → 𝔸¹ be the stable fixed-determinant Hodge moduli of HodgeStructuresPartII:H.1/hodge-coarse, with fibres M_Dol^s(X,(L,0),r) over 0 and M_dR^s(X,r,L) over 1. The rigid Hodge locus is M^rig_Hod(X, L, r) := RigidLocus q (HodgeStructuresPartII:H.5/rigid-locus), the open subscheme of points isolated in their q-fibre. Its fibre over 0 is M^rig_Dol(X, (L,0), r), its fibre over 1 is M^rig_dR(X, r, L), it is stable under the 𝔾_m-action t·(λ, E, D) = (tλ, E, tD) of HodgeStructuresPartII:H.1/hodge-scaling, and over 𝔾_m ⊂ 𝔸¹ division by λ identifies it with M^rig_dR(X, r, L) × 𝔾_m.

**Hypotheses.**

- X smooth connected projective; stable fixed-determinant moduli on the vanishing-Chern-class component.
- q is of finite type, so the quasi-finite locus is open (Mathlib).

**Proof or construction.**

1. Apply HodgeStructuresPartII:H.5/rigid-locus to q; points of the locus are the points isolated in their fibre q⁻¹(λ).
2. The fibre of an open subscheme is the open subscheme of the fibre on the same points; isolated points of q⁻¹(0) = M_Dol^s and q⁻¹(1) = M_dR^s are their rigid loci.
3. q is 𝔾_m-equivariant for the weight-one action on 𝔸¹, and the action maps fibres isomorphically to fibres, so it preserves isolation (RigidLocus.equivariant).
4. Over 𝔾_m the isomorphism M_Hod ×_{𝔸¹} 𝔾_m ≅ M_dR × 𝔾_m of HodgeStructuresPartII:H.1/hodge-scaling commutes with the projections to 𝔾_m and hence identifies the quasi-finite loci.

**Uses.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, §4.2 and Lemma 4.9: M^rig_Hod is the object that splits as M^rig_Dol × 𝔸¹ and carries the rigid Hodge families.
- Esnault–Groechenig, Rigid connections and F-isocrystals, Proposition 4.10: Arithmetic models of the rigid Hodge locus over S × 𝔸¹ index the Higgs–de Rham flows of §4.
- HodgeStructuresPartII:H.5/rigid-hodge-splitting, HodgeStructuresPartII:H.5/nice-hodge-models: Consumers.

**API.**

- `HodgeRigidLocus` (constructor): RigidLocus of q: M_Hod^s(X, r, L) → 𝔸¹.
- `HodgeRigidLocus.zeroFibre` (projection): Its fibre over 0 is M^rig_Dol(X,(L,0),r).
- `HodgeRigidLocus.oneFibre` (projection): Its fibre over 1 is M^rig_dR(X,r,L).
- `HodgeRigidLocus.gmStable` (instance): The 𝔾_m-action of HodgeStructuresPartII:H.1/hodge-scaling restricts to M^rig_Hod, compatibly with weight one on 𝔸¹.
- `HodgeRigidLocus.nonzeroTrivialization` (equivalence): M^rig_Hod ×_{𝔸¹} 𝔾_m ≅ M^rig_dR × 𝔾_m over 𝔾_m, (λ, E, D) ↦ ((E, λ⁻¹D), λ).
- `HodgeRigidLocus.mem_iff` (characterisation): A point over λ lies in M^rig_Hod iff it is isolated in q⁻¹(λ).

**Unit tests.**

- `HodgeRigidLocus.test_rank_one` (degenerate): For r = 1, M^rig_Hod(X, L, 1) → 𝔸¹ is an isomorphism.
- `HodgeRigidLocus.test_genus_two_empty` (non-example): For X a compact curve of genus g ≥ 2 and r = 2, M^rig_Hod(X, O, 2) is empty, although M_Hod^s(X, 2, O) is nonempty.
- `HodgeRigidLocus.test_fibres` (characterisation): The fibre of M^rig_Hod over 0 is M^rig_Dol(X,(L,0),r) and over 1 is M^rig_dR(X,r,L), as subschemes of the fibres of M_Hod^s.
- `HodgeRigidLocus.test_gm_stable` (characterisation): For t ∈ ℂ^× and a point m of M^rig_Hod over λ, t·m is a point of M^rig_Hod over tλ.

**Acceptance.** For r = 1 the locus is 𝔸¹: the only object over λ is (L, λ∇_L). For X a compact curve of genus ≥ 2 and r ≥ 2 the locus is empty.

**Direct dependencies.** `HodgeStructuresPartII:H.5/rigid-locus`, `HodgeStructuresPartII:H.5/rigid-connection`, `HodgeStructuresPartII:H.1/hodge-coarse`, `HodgeStructuresPartII:H.1/hodge-scaling`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §4.2, p.132: “We define Mrig Hod (X/C, L, r)⊂MHod (X/C, L, r) to be the maximal open subset where (4.1) is quasi-finite (see Definition 3.2).” — Definition.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §4.2, proof of Lemma 4.9, p.132: “where MdR (X/C, L, r) is the fibre at λ=1.” — Nonzero trivialization of the Hodge moduli.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions).

### The rigid Hodge locus splits over the affine line

**Theorem:** `HodgeRigidLocus.splitting`. Node: `HodgeStructuresPartII:H.5/rigid-hodge-splitting`. Planet: *Splitting of the rigid Hodge locus*.

Let X be smooth connected projective over ℂ, L torsion, r ≥ 1. Then: (i) for every rigid stable flat connection (E,∇) with determinant (L,∇_L), with Hodge filtration F of HodgeStructuresPartII:H.5/rigid-underlies-cvhs, the Rees λ-connection ξ(E, F) = Σ_p λ^{−p} F^p ⊗ ℂ[λ] (HodgeStructuresPartII:H.0/rees-parameter) defines a 𝔾_m-equivariant section σ_E: 𝔸¹ → M^rig_Hod(X, L, r) with σ_E(1) = [(E,∇)] and σ_E(0) = [(Gr_F E, gr_F ∇)]; (ii) M^rig_Hod(X, L, r) → 𝔸¹ is finite and flat, and its reduced subscheme is the disjoint union of the images of the sections σ_E, so (M^rig_Hod)_red ≅ (M^rig_Dol)_red × 𝔸¹ 𝔾_m-equivariantly; (iii) each connected component is finite flat over 𝔸¹ with all fibres isomorphic to the local Artinian ring of M_Dol^s at the corresponding rigid Higgs point; (iv) (Esnault–Groechenig Lemma 4.9) M^rig_Hod(X, L, r) ≅ M^rig_Dol(X, (L,0), r) × 𝔸¹ 𝔾_m-equivariantly over 𝔸¹, the action on the right being scaling of θ times weight one on 𝔸¹, including non-reduced structure; (v) every 𝔾_m-equivariant section of M^rig_Hod over 𝔸¹ is a Rees section of a complex variation of Hodge structure as in (i) (Simpson's Lemma 7.2).

**Hypotheses.**

- X smooth connected projective; stable fixed-determinant moduli on the vanishing-Chern-class component.
- Part (iv) with non-reduced structure is the statement of Esnault–Groechenig; the passage from Simpson's étale local product to a global 𝔾_m-equivariant isomorphism is recorded as a gap (and as source issue E-H5-2).

**Proof or construction.**

1. (i) By HodgeStructuresPartII:H.5/rigid-underlies-cvhs, (E,∇) carries a Griffiths-transverse filtration F with associated graded the rigid Higgs bundle; the Rees construction of HodgeStructuresPartII:H.0/rees-parameter is a λ-connection on X × 𝔸¹ with 𝔾_m-action, fibres (E,∇) at 1 and (Gr_F E, gr_F ∇) at 0, stable at every λ, and fixed determinant (Simpson 1996 Lemma 7.2). Its values over λ ≠ 0 are λ·[(E,∇)], isolated by HodgeStructuresPartII:H.5/hodge-rigid-locus; its value at 0 is rigid by HodgeStructuresPartII:H.5/rigid-correspondence.
2. (ii) Over 𝔾_m every point of M^rig_Hod is λ·m with m ∈ M^rig_dR (HodgeStructuresPartII:H.5/hodge-rigid-locus nonzeroTrivialization), hence lies on a section σ_E; at 0 the points are those of M^rig_Dol, which are the values σ_E(0) by the bijection of HodgeStructuresPartII:H.5/rigid-correspondence. Distinct sections are disjoint since their values differ over every λ. So (M^rig_Hod)_red is a finite disjoint union of sections ≅ 𝔸¹, closed in M_Hod^s; M^rig_Hod → 𝔸¹ is therefore finite (finiteness is detected on the reduced subscheme). Flatness is the restriction of HodgeStructuresPartII:H.1/hodge-flatness to the open M^rig_Hod.
3. (iii) By HodgeStructuresPartII:H.1/hodge-etale-product, near σ_E(0) the morphism q is étale locally M_Dol^s × 𝔸¹ → 𝔸¹; restricting to quasi-finite loci, the component through σ_E is étale locally Spec(A) × 𝔸¹ with A the local Artinian ring of M_Dol^s at σ_E(0); étale maps between Artinian local schemes with the same residue field are isomorphisms, so all fibres near 0 are ≅ Spec A, and by 𝔾_m-translation all fibres over 𝔾_m.
4. (iv) Esnault–Groechenig deduce the equivariant product from the nonzero trivialization and Simpson's Theorem 9.1. Given (ii)–(iii), the remaining input is that a 𝔾_m-equivariant finite flat family over 𝔸¹ which is étale locally trivial with fibre Spec A is 𝔾_m-equivariantly isomorphic to Spec A × 𝔸¹. Non-equivariantly this follows from triviality of Aut(A)-torsors over 𝔸¹_ℂ; the equivariant statement is the recorded gap.
5. (v) A 𝔾_m-equivariant section of the Hodge moduli is a 𝔾_m-equivariant λ-connection on X × 𝔸¹, i.e. a filtered flat bundle with Griffiths transversality (Simpson 1996 Lemma 7.2), which is a complex variation by HodgeStructuresPartII:H.5/cvhs-hodge-bundles.

**Acceptance.** For r = 1, M^rig_Hod = 𝔸¹ = M^rig_Dol × 𝔸¹. The number of sections equals the number of rigid connections of rank r with determinant L, which equals the number of rigid stable Higgs bundles.

**Direct dependencies.** `HodgeStructuresPartII:H.5/hodge-rigid-locus`, `HodgeStructuresPartII:H.5/rigid-underlies-cvhs`, `HodgeStructuresPartII:H.5/rigid-correspondence`, `HodgeStructuresPartII:H.5/cvhs-hodge-bundles`, `HodgeStructuresPartII:H.5/rigid-finite`, `HodgeStructuresPartII:H.0/rees-parameter`, `HodgeStructuresPartII:H.0/rees-specialization`, `HodgeStructuresPartII:H.1/hodge-etale-product`, `HodgeStructuresPartII:H.1/hodge-flatness`, `HodgeStructuresPartII:H.1/hodge-scaling`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §4.2, Lemma 4.9, p.132: “is finite, flat, and splits G - 1 m equivariantly as” — Statement of the splitting (𝔾_m and 𝔸¹ superscripts displaced in the text layer).
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §4.2, proof of Lemma 4.9, p.132: “is étale locally isomorphic to the product of MDol (X/C, L, r) with A1 . This finishes the proof of the first part.” — The printed proof rests on Simpson's étale local product.
- [S96](https://arxiv.org/pdf/alg-geom/9604005), §7, Lemma 7.2, preprint p.33: “preserved by Gm (or more precisely with action of Gm specified) corresponds to a vector bundle with filtration satisfying Griffiths transversality.” — Equivariant sections are filtered flat bundles.
- [S96](https://arxiv.org/pdf/alg-geom/9604005), §9, Theorem 9.1, preprint p.39: “Then etale locally (above) MHod (X, G) is a product” — Simpson's étale local product.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions; polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles).

## H.5c. Arithmetic models of rigid loci

The third group spreads the rigid objects to arithmetic models. A smooth projective complex variety with a torsion line bundle has models over finitely generated subrings of ℂ smooth over ℤ (Esnault–Groechenig Lemma 3.1); Langer's theorem provides relative moduli of connections, Higgs bundles and λ-connections over such bases, with bijections on geometric points and with stable opens compatible with base change. Because there are finitely many rigid objects, one model carries all of them, geometrically stable (Proposition 3.3(a),(b)); after shrinking, the spread Higgs fields are nilpotent and the spread objects are sections of the relative rigid loci (3.3(c),(d)); Zariski's main theorem then shows that these finitely many sections, taken pairwise disjoint, exhaust the relative rigid loci (3.3(e)). The same procedure for the rigid Hodge families of all determinants L^a gives the nice models of Proposition 4.10, whose indices are stated in corrected form.

### Smooth arithmetic models of a pointed projective variety with torsion line bundle

**Construction:** `ArithmeticModel`. Node: `HodgeStructuresPartII:H.5/smooth-arithmetic-model`.

Let X be a smooth connected projective complex variety, x ∈ X(ℂ) and L a line bundle of finite order d with a chosen isomorphism ι: L^{⊗d} ≅ O_X. An arithmetic model of (X, x, L, ι) consists of a finitely generated subring R̃ ⊂ ℂ with S = Spec R̃ smooth over Spec ℤ (so S is integral with generic point η and an embedding κ(η) ⊂ ℂ), a smooth projective morphism X_S → S with geometrically connected fibres, a section x_S, a line bundle L_S on X_S, an isomorphism ι_S: L_S^{⊗d} ≅ O_{X_S}, and an isomorphism Spec ℂ ×_S X_S ≅ X carrying x_S, L_S and ι_S to x, L and ι; moreover d is invertible on S. Every (X, x, L, ι) has an arithmetic model, any two are dominated by a common one (the finitely generated subrings of ℂ form a directed system with colimit ℂ), and the restriction of a model to a nonempty open S′ ⊂ S (inverting finitely many nonzero elements of R̃) is again a model. The model carries the canonical flat structure ∇_{L_S} on L_S determined by ι_S (relative connection whose d-th power is d), spreading the flat determinant (L, ∇_L) used in HodgeStructuresPartII:H.5/rigid-connection. When X is only quasi-projective with good compactification X̄ ⊃ D, the model also spreads X̄ and D to a smooth projective X̄_S with relative strict normal crossings divisor D_S.

**Hypotheses.**

- X smooth connected projective over ℂ (or quasi-projective with a good compactification for the boundary version).
- The limit theorems of EGA IV §8 for finitely presented schemes, morphisms, quasi-coherent modules and the properties smooth, projective, geometrically connected, and openness of the smooth locus (EGA IV 17.7.8), are requested from SchemeAndStackFoundations:SF.0; Mathlib supplies the morphism part (Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType).

**Proof or construction.**

1. Choose a projective embedding X ⊂ ℙ^N_ℂ and the subring R ⊂ ℂ generated by the coefficients of finitely many defining equations; X_R ⊂ ℙ^N_R satisfies X_R ×_R ℂ ≅ X (Esnault–Groechenig Lemma 3.1 proof).
2. ℂ is the filtered colimit of finitely generated subrings R ⊂ ℂ; by EGA IV 8.8.2(ii) and 8.10.5(xiii) the model can be taken smooth and projective, and by 8.5.2(i), 8.5.5 the line bundle L, the isomorphism ι and the point x spread out (request SchemeAndStackFoundations:SF.0).
3. Invert finitely many elements so that R̃ is smooth over ℤ (generic smoothness of finite-type ℤ-algebras in characteristic zero) and d ∈ R̃^×; the d-th-root connection on L_S is the unique relative connection whose d-th tensor power corresponds to d under ι_S (HodgeStructuresPartII:H.1/torsion-determinant-dictionary).
4. Directedness and shrinking: two finitely generated subrings are contained in a third; inverting a nonzero element keeps the generic point and the embedding into ℂ.

**Uses.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, Lemma 3.1 and §3.1: Arithmetic models (X_S, L_S) over which the relative moduli and rigid loci are spread; closed points of S give reductions modulo p.
- Esnault–Groechenig, Cohomologically rigid local systems and integrality, §3: A model over a connected regular S of finite type over ℤ with smooth projective X̄_S, relative normal crossings D_S and a section x_S is used to specialize local systems to characteristic p.
- HodgeStructuresPartII:H.5/relative-moduli, HodgeStructuresPartII:H.5/simultaneous-spreading, HodgeStructuresPartII:H.5/nice-hodge-models, HodgeStructuresPartII:H.5/integrality-EG18: Consumers.
- Crystalline Cartier-flow and rigid-companion successors of Esnault–Groechenig (CrystallineCohomologyPartIICartierFlows, PadicDifferentialEquationsPartIIRigidCompanions; not yet designed): Reductions of rigid connections modulo closed points of S, W₂-lifts from smoothness of S over ℤ, and Frobenius structures are taken on these models.

**API.**

- `ArithmeticModel` (structure): The data (R̃ ⊂ ℂ, S, X_S → S, x_S, L_S, ι_S, generic-fibre isomorphism) with S smooth over ℤ, X_S smooth projective with geometrically connected fibres and d ∈ R̃^×.
- `ArithmeticModel.exists` (constructor): Every (X, x, L, ι) has an arithmetic model.
- `ArithmeticModel.restrict` (functoriality): Restriction to a nonempty open subscheme of S (equivalently to R̃[1/f] ⊂ ℂ) is an arithmetic model.
- `ArithmeticModel.dominate` (relation): Any two arithmetic models of (X, x, L, ι) restrict to isomorphic models over a common finitely generated subring of ℂ containing both coefficient rings.
- `ArithmeticModel.spread_hom` (universal-property): Morphisms, sections and isomorphisms of finitely presented objects over X extend over some restriction of S, uniquely after further shrinking (EGA IV 8.8.2(i), Mathlib Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType).
- `ArithmeticModel.genericFibreIso` (projection): Spec ℂ ×_S X_S ≅ X.
- `ArithmeticModel.closedPoint_finite_residue` (other): Closed points s ∈ S have finite residue fields κ(s) of characteristic p, and smoothness of S over ℤ lifts s to W₂(κ(s)).
- `ArithmeticModel.flatDeterminant` (data): The relative flat connection ∇_{L_S} on L_S determined by ι_S, restricting to ∇_L on X.

**Unit tests.**

- `ArithmeticModel.test_projective_space` (computation): For X = ℙⁿ_ℂ, x = [1:0:⋯:0], L = O and ι = id, (S = Spec ℤ, X_S = ℙⁿ_ℤ) is an arithmetic model.
- `ArithmeticModel.test_legendre` (computation): For the elliptic curve y² = x(x − 1)(x − λ) with λ ∈ ℂ transcendental, R̃ = ℤ[λ, 1/(2λ(1 − λ))] gives an arithmetic model with X_S the Legendre family.
- `ArithmeticModel.test_must_invert` (non-example): For the curve y² = x³ − x over ℂ, the integral model Proj ℤ[x,y,z]/(y²z − x³ + xz²) is not smooth over Spec ℤ at the prime 2, so 2 must be inverted: the model over Spec ℤ itself is not an arithmetic model.
- `ArithmeticModel.test_shrink` (characterisation): If (S, X_S, …) is an arithmetic model and 0 ≠ f ∈ R̃, then the restriction to Spec R̃[1/f] is an arithmetic model.
- `ArithmeticModel.test_generic_fibre` (compatibility): The base change of X_S along Spec ℂ → S is isomorphic to X as a ℂ-scheme, compatibly with x, L and ι.

**Acceptance.** ℙⁿ_ℂ with L = O has the model ℙⁿ_ℤ over S = Spec ℤ. The model can always be shrunk to avoid finitely many primes.

**Direct dependencies.** `SchemeAndStackFoundations:SF.0`, `mathlib:AlgebraicGeometry.Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType`, `HodgeStructuresPartII:H.1/torsion-determinant-dictionary`, `HodgeStructuresPartII:H.5/boundary-monodromy-data`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, Lemma 3.1, p.122: “(a) S is of finite type and smooth over Spec Z;” — Smoothness of the base.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, proof of Lemma 3.1, p.122: “that we can even choose XR Spec R to be a smooth and projective R- scheme.” — Spreading smoothness and projectivity (EGA IV 8.8.2, 8.10.5).
- [EG18](https://arxiv.org/pdf/1711.06436v3), §3, p.6: “There is a connected regular scheme S of finite type over Z with a complex generic point Spec(C) → S such that” — Models with compactification, boundary and base point.

**Suggested file.** 5 names declared or stated as examples; 8 listed in the omission inventory (missing carriers: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules).

### Relative moduli of connections, Higgs bundles and λ-connections over arithmetic bases

**Construction:** `RelativeModuli.deRham`. Node: `HodgeStructuresPartII:H.5/relative-moduli`.

Let (S, X_S, L_S) be an arithmetic model (HodgeStructuresPartII:H.5/smooth-arithmetic-model) and r ≥ 1. For Λ the split almost-polynomial sheaf of rings of differential operators on X_S/S of integrable connections (crystalline differential operators of order ≤ 1 generated in degree one), of Higgs fields (Sym T_{X_S/S}), or of λ-connections on X_S × 𝔸¹/S × 𝔸¹, there are quasi-projective S-schemes (respectively S × 𝔸¹-schemes) of finite type M_dR(X_S/S, L_S, r), M_Dol(X_S/S, L_S, r) and M_Hod(X_S/S, L_S, r) which uniformly corepresent the functors of families of Gieseker semistable Λ-modules with Hilbert polynomial r·P_O and determinant (L_S, λ∇_{L_S}) on the fibres, with open subschemes M^s universally corepresenting the geometrically stable families. For every locally Noetherian S-scheme T there is a morphism φ_T: M(X_S/S) ×_S T → M(X_T/T), a bijection on points when T is a geometric point; on the stable opens the base change to Spec ℂ is isomorphic to the stable fixed-determinant moduli of HodgeStructuresPartII:H.1/derham-coarse, HodgeStructuresPartII:H.1/dolbeault-coarse and HodgeStructuresPartII:H.1/hodge-coarse. Their rigid loci M^rig(X_S/S, L_S, r) are the relative quasi-finite loci (HodgeStructuresPartII:H.5/rigid-locus). Notation M(X_S/S, L_S, ≤ r) = ⊔_{r′ ≤ r} M(X_S/S, L_S, r′).

**Hypotheses.**

- S of finite type over ℤ (a universally Japanese ring), X_S → S projective with geometrically connected fibres and a relatively very ample O(1).
- Boundedness of semistable Λ-modules in positive and mixed characteristic (Langer) and GIT over a universally Japanese base (Seshadri) are the inputs; the GIT part is requested from AlgebraicModuliForArithmeticGeometry:R09.5 and R09.2, and Langer's boundedness is recorded as a gap.
- Over geometric points of positive characteristic, M_dR is a moduli of Λ-modules for crystalline differential operators; it is not asserted to be related to M_Dol by a homeomorphism.

**Proof or construction.**

1. Langer Theorem 1.1, combining Simpson Moduli I Theorem 4.7 with Langer's boundedness theorems: bound the family of semistable Λ-modules, rigidify by framed global sections in a Quot scheme, and take the GIT quotient by GL_N over S (Seshadri's GIT over universally Japanese bases).
2. Determinant: the determinant map to the relative Picard scheme (with its relative connection) is a morphism; its fibre over the section (L_S, λ∇_{L_S}) is the fixed-determinant moduli.
3. Generic fibre: the stable opens universally corepresent the stable functors, so their base change along Spec ℂ → S corepresents the stable functor over ℂ and is therefore the stable moduli of H.1.
4. Rigid loci: apply HodgeStructuresPartII:H.5/rigid-locus to the structure maps to S (and S × 𝔸¹).

**Uses.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, §3.1 and §4.2: Quasi-projective moduli S-schemes M_dR(X_S/S, L_S, r), M_Dol(X_S/S, L_S, r) and an S-model of Simpson's Hodge moduli over S × 𝔸¹ via Langer's construction.
- Langer, Semistable modules over Lie algebroids in positive characteristic, Theorem 1.1: Existence of relative moduli of Λ-modules over bases of finite type over a universally Japanese ring.
- HodgeStructuresPartII:H.5/simultaneous-spreading, HodgeStructuresPartII:H.5/rigid-locus-exhaustion, HodgeStructuresPartII:H.5/nice-hodge-models: The sections and rigid loci of the nice models live here.
- Crystalline Cartier-flow successor of Esnault–Groechenig (CrystallineCohomologyPartIICartierFlows, not yet designed): Higgs–de Rham flows and the Ogus–Vologodsky correspondence act on the closed fibres of these relative moduli.

**API.**

- `RelativeModuli.deRham` (constructor): The quasi-projective S-scheme M_dR(X_S/S, L_S, r) of finite type.
- `RelativeModuli.dolbeault` (constructor): The quasi-projective S-scheme M_Dol(X_S/S, L_S, r) of finite type.
- `RelativeModuli.hodge` (constructor): The quasi-projective S × 𝔸¹-scheme M_Hod(X_S/S, L_S, r), with fibres over λ = 0 and λ = 1 the Dolbeault and de Rham moduli.
- `RelativeModuli.corepresents` (universal-property): Uniform corepresentation of the family functor; universal corepresentation on the stable open.
- `RelativeModuli.baseChange` (functoriality): For locally Noetherian T → S the morphism φ_T: M(X_S/S) ×_S T → M(X_T/T), bijective on points for geometric T.
- `RelativeModuli.stableGenericIso` (compatibility): The stable open base-changes to the stable moduli of HodgeStructuresPartII:H.1/derham-coarse, HodgeStructuresPartII:H.1/dolbeault-coarse, HodgeStructuresPartII:H.1/hodge-coarse over ℂ.
- `RelativeModuli.rigidLocus` (projection): M^rig(X_S/S, L_S, r) := RigidLocus of the structure morphism.
- `RelativeModuli.leRank` (other): M(X_S/S, L_S, ≤ r) := ⊔_{r′ ≤ r} M(X_S/S, L_S, r′).

**Unit tests.**

- `RelativeModuli.test_rank_one` (degenerate): For r = 1, M_dR(X_S/S, L_S, 1) → S and M_Dol(X_S/S, L_S, 1) → S are isomorphisms (the single object (L_S, ∇_{L_S}), respectively (L_S, 0)).
- `RelativeModuli.test_geometric_points` (characterisation): For a geometric point s̄ of S, φ_{s̄} is a bijection between the s̄-points of M_dR(X_S/S, L_S, r) and the S-equivalence classes of semistable flat connections of rank r with determinant (L_s̄, ∇) on X_s̄.
- `RelativeModuli.test_generic_stable` (compatibility): The base change of the stable open M^s_dR(X_S/S, L_S, r) along Spec ℂ → S is isomorphic to M^s_dR(X, r, L) of HodgeStructuresPartII:H.1/derham-coarse.
- `RelativeModuli.test_unfixed_determinant` (non-example): For an elliptic curve E_S → S and r = 1, fixing only the underlying line bundle O of the determinant gives the positive-dimensional family of relative connections d + a·ω (ω a relative invariant differential, a ∈ O_S), while the fixed-determinant moduli M_dR(E_S/S, O, 1) is S itself.

**Acceptance.** For r = 1 each fixed-determinant moduli is the base (one object). Over a geometric point s the points of M(X_S/S) are the S-equivalence classes of semistable objects on X_s.

**Direct dependencies.** `HodgeStructuresPartII:H.5/smooth-arithmetic-model`, `HodgeStructuresPartII:H.5/rigid-locus`, `HodgeStructuresPartII:H.1/operator-git`, `HodgeStructuresPartII:H.1/operator-boundedness`, `HodgeStructuresPartII:H.1/derham-coarse`, `HodgeStructuresPartII:H.1/dolbeault-coarse`, `HodgeStructuresPartII:H.1/hodge-coarse`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `AlgebraicModuliForArithmeticGeometry:R09.2`.

**Source passages.**

- [Langer14](https://arxiv.org/pdf/1311.2794v2), §1, Theorem 1.1, p.4: “Then there exists a quasi-projective S-scheme M Λ (X /S, P) of finite type over S and a natural transformation of functors” — Existence of relative moduli of Λ-modules.
- [Langer14](https://arxiv.org/pdf/1311.2794v2), §1, Theorem 1.1, p.4: “For every geometric point s ∈ S the induced map ϕ (s) is a bijection.” — Geometric points.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, p.122: “If T is a geometric point, ϕT induces an isomorphism on geometric points on both sides, and likewise for MDol (XS /S, LS , r).” — Use of Langer's moduli over arithmetic bases with geometric-point base change only.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules; moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions).

### Simultaneous spreading of rigid objects

**Theorem:** `ArithmeticModel.exists_spreading`. Node: `HodgeStructuresPartII:H.5/simultaneous-spreading`.

Let X be smooth connected projective over ℂ, L torsion and r ≥ 1. There is an affine arithmetic model (S, X_S, L_S) (HodgeStructuresPartII:H.5/smooth-arithmetic-model) such that (a) every rigid flat connection (E,∇) on X with determinant L and rank ≤ r spreads to a relative flat connection (E_S, ∇_S) on X_S/S with determinant (L_S, ∇_{L_S}) which is P-stable over every geometric point of S; (b) every rigid stable Higgs bundle (V,θ) on X with determinant (L,0) and rank ≤ r spreads to a relative Higgs bundle (V_S, θ_S) on X_S/S, P-stable over every geometric point.

**Hypotheses.**

- Finitely many rigid objects of rank ≤ r with determinant L (HodgeStructuresPartII:H.5/rigid-finite) — finiteness comes from the isolated components of finite-type moduli, not from finiteness of all stable objects.
- EGA IV §8 spreading of finitely presented modules and morphisms (request SchemeAndStackFoundations:SF.0) and openness of geometric stability in families (HodgeStructuresPartII:H.5/relative-moduli: the stable locus is open).

**Proof or construction.**

1. X is the limit of the models X_R over finitely generated subrings R̃ ⊂ R ⊂ ℂ; each of the finitely many rigid objects is a finitely presented module with a differential operator (connection) or O-linear map (Higgs field) and spreads to some X_R with its integrability and determinant identities (EGA IV 8.5.2(i), 8.5.5).
2. Take R containing all the finitely many coefficient rings (directedness of the system).
3. Geometric P-stability is open on the base (the stable locus of HodgeStructuresPartII:H.5/relative-moduli is open), and holds at the generic point, so it holds after shrinking S.

**Acceptance.** In rank one the spreading is (L_S, ∇_{L_S}) and (L_S, 0). The same S works for all ranks r′ ≤ r.

**Direct dependencies.** `HodgeStructuresPartII:H.5/smooth-arithmetic-model`, `HodgeStructuresPartII:H.5/relative-moduli`, `HodgeStructuresPartII:H.5/rigid-finite`, `HodgeStructuresPartII:H.5/rigid-connection`, `SchemeAndStackFoundations:SF.0`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, Proposition 3.3(a), p.123: “For every rigid flat connection (EC , ∇C ) over X with determinant L and rank ⩽r there exists a spreading out to a relative flat connection (ES , ∇S ) on XS /S which is P -stable over geometric points.” — Statement (a).
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, proof of Proposition 3.3, p.124: “Here we use that there are only finitely many rigid flat connections and Higgs bundles of rank ⩽r and determinant L.” — Finiteness input.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, proof of Proposition 3.3, p.124: “By openness of P -stability, we may assume that these families are P -stable over geometric points.” — Openness of stability.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules; moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions).

### Nilpotent and relatively rigid models

**Theorem:** `ArithmeticModel.exists_nilpotent_rigid`. Node: `HodgeStructuresPartII:H.5/nilpotent-rigid-models`.

In HodgeStructuresPartII:H.5/simultaneous-spreading, after shrinking S: (c) every spread Higgs field is nilpotent, θ_S^{r} = 0 (all products of r components of θ_S vanish); (d) the sections [E_S, ∇_S]: S → M_dR(X_S/S, L_S, ≤ r) and [V_S, θ_S]: S → M_Dol(X_S/S, L_S, ≤ r) factor through the relative rigid loci M^rig_dR(X_S/S, L_S, ≤ r) and M^rig_Dol(X_S/S, L_S, ≤ r).

**Hypotheses.**

- As in HodgeStructuresPartII:H.5/simultaneous-spreading; S integral with generic point η, κ(η) ⊂ ℂ.

**Proof or construction.**

1. (c) θ^r = 0 over ℂ by HodgeStructuresPartII:H.5/rigid-higgs-nilpotent; an identity between morphisms of finitely presented modules that holds on the limit holds over some R (EGA IV 8.5.2(i)), so θ_R^r = 0 after enlarging R.
2. (d) The rigid loci are open (HodgeStructuresPartII:H.5/rigid-locus). The section s_i associated with a spread rigid object sends η to a point whose base change to ℂ is the rigid point [(E_i,∇_i)], which is isolated in the generic fibre; hence s_i(η) ∈ M^rig. The preimage U = ∩ s_i⁻¹(M^rig) is open and contains η, so nonempty; replace S by U (Esnault–Groechenig Proposition 3.3 proof).

**Acceptance.** The relative rigid locus is open but not closed, so shrinking is necessary. After (c), every closed fibre (V_s, θ_s) has nilpotent Higgs field, the input to the Ogus–Vologodsky transform in characteristic p ≥ r + 2.

**Direct dependencies.** `HodgeStructuresPartII:H.5/simultaneous-spreading`, `HodgeStructuresPartII:H.5/rigid-higgs-nilpotent`, `HodgeStructuresPartII:H.5/rigid-locus`, `HodgeStructuresPartII:H.5/relative-moduli`, `SchemeAndStackFoundations:SF.0`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, Proposition 3.3(c), p.123: “(c) Furthermore, in (b) we may assume the Higgs field θS to be nilpotent.” — Statement (c).
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, proof of Proposition 3.3, p.124: “is therefore non-empty and open, since Mrig dR (XS /S, LS , ⩽r)⊂MdR (XS /S, LS , ⩽r) is open.” — Shrinking to factor through the open rigid locus.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules; moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions).

### Rigid loci are exhausted by the spread sections

**Theorem:** `ArithmeticModel.exists_exhaustion`. Node: `HodgeStructuresPartII:H.5/rigid-locus-exhaustion`.

In HodgeStructuresPartII:H.5/nilpotent-rigid-models, after further shrinking S: the finitely many sections s_1, …, s_N: S → M^rig_dR(X_S/S, L_S, ≤ r) of the spread rigid connections are pairwise disjoint and |M^rig_dR(X_S/S, L_S, ≤ r)| = ∪_i s_i(|S|); the same holds for M^rig_Dol(X_S/S, L_S, ≤ r). Thus every geometric fibre M^rig_dR(X_s̄/s̄, L_s̄, ≤ r) has exactly N points, one on each section, and over the generic point these are the N rigid connections over ℂ. Local multiplicities (lengths of local rings) are part of the rigid locus and are retained.

**Hypotheses.**

- As in HodgeStructuresPartII:H.5/nilpotent-rigid-models; S of finite type over ℤ, hence excellent, so relative normalization is finite.
- Zariski's main theorem for the quasi-finite separated morphism M^rig → S (Mathlib: quasiFiniteLocus.ι ≫ toNormalization is an open immersion); finiteness of the relative normalization over the Nagata base S is requested from SchemeAndStackFoundations:SF.0.

**Proof or construction.**

1. By construction ∪_i {s_i(η)} = M^rig_dR(X_S/S, L_S, ≤ r) ×_S η (the generic fibre's rigid points are exactly the N rigid connections, by the bijection on geometric points of HodgeStructuresPartII:H.5/relative-moduli).
2. Zariski's main theorem factors M^rig → S as an open immersion into a scheme M̃ finite over S, with M^rig dense in M̃ (Esnault–Groechenig cite EGA IV 8.12.6; Mathlib's ZariskisMainTheorem).
3. Z = |M̃| ∖ ∪_i s_i(|S|) has closed image h(Z) ⊂ S (M̃ finite), not containing η; replace S by S ∖ h(Z) to get |M^rig| = ∪ s_i(|S|).
4. Disjointness: for i ≠ j the equalizer of s_i and s_j is closed in S (sections of a separated morphism) and does not contain η, since s_i(η) ≠ s_j(η); remove the finitely many equalizers.

**Acceptance.** For r = 1 there is one section, an isomorphism S ≅ M^rig. After the shrinking, the number of rigid objects on each geometric fibre is the complex count N.

**Direct dependencies.** `HodgeStructuresPartII:H.5/nilpotent-rigid-models`, `HodgeStructuresPartII:H.5/relative-moduli`, `HodgeStructuresPartII:H.5/rigid-locus`, `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteLocus`, `SchemeAndStackFoundations:SF.0`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, Proposition 3.3(e), p.123: “(e) For every point y∈|MdR (XS /S, LS , ⩽r)| there exists a family (ES , ∇S ) as in (a) such that y belongs to the set-theoretic image [ES , ∇S ](|S|).” — Statement (e); the superscript rig is displaced in the text layer.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, proof of Proposition 3.3, p.124: “We now apply Zariski’s main theorem for quasi-finite maps” — Zariski's main theorem.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §3.1, proof of Proposition 3.3, p.125: “the image h(Z)⊂S is closed, and does not contain η by virtue of (3.2).” — Removing the image of the boundary.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules; moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions).

### Nice models of the rigid Hodge loci for all determinant powers

**Theorem:** `ArithmeticModel.exists_nice_hodge`. Node: `HodgeStructuresPartII:H.5/nice-hodge-models`. Planet: *Nice arithmetic models*.

Let X be smooth connected projective over ℂ, L torsion of exact order d and r ≥ 1. There are an affine arithmetic model (S, X_S, L_S) and finitely many λ-connections (N_S^i, D_S^i), i = 1, …, M, on X_S × 𝔸¹_S relative to λ = pr₂, geometrically P-stable, with determinants (L_S^{a(i)}, λ∇) for some 0 ≤ a(i) < d, such that (a) all conclusions of HodgeStructuresPartII:H.5/simultaneous-spreading, HodgeStructuresPartII:H.5/nilpotent-rigid-models and HodgeStructuresPartII:H.5/rigid-locus-exhaustion hold for every determinant L^a, 0 ≤ a ≤ d − 1; (b) each (N_S^i, D_S^i) can moreover be chosen 𝔾_m-equivariant, the spread Rees λ-connection of a rigid variation, with fibre at λ = 1 a spread rigid connection and at λ = 0 its associated graded rigid Higgs bundle (Esnault–Groechenig state (b) without the equivariance; this plan chooses the Rees families of HodgeStructuresPartII:H.5/rigid-hodge-splitting (i)); (c) the sections give a bijection ⊔_{i=1}^{M} [(N_S^i, D_S^i)](|S × 𝔸¹|) = ⊔_{a=0}^{d−1} |M^rig_Hod(X_S/S, L_S^a, ≤ r)|. In particular the number n_L of rank-r rigid connections with determinant among L^0, …, L^{d−1} equals the number of rank-r rigid stable Higgs bundles with those determinants and indexes the sections at λ = 0 and λ = 1. (Indices as corrected in source issue E-H5-1.)

**Hypotheses.**

- As in HodgeStructuresPartII:H.5/rigid-locus-exhaustion, applied simultaneously to the d determinants L^a.
- The Hodge-moduli statements use HodgeStructuresPartII:H.5/rigid-hodge-splitting over ℂ and the relative Hodge moduli of HodgeStructuresPartII:H.5/relative-moduli.

**Proof or construction.**

1. Over ℂ, each rigid connection carries the Rees λ-connection of its Hodge filtration (HodgeStructuresPartII:H.5/rigid-hodge-splitting (i)); there are finitely many (M = n_L when counted over all L^a).
2. Spread the finitely many λ-connections with their 𝔾_m-structures to X_S × 𝔸¹_S and shrink S to keep geometric stability, as in HodgeStructuresPartII:H.5/simultaneous-spreading.
3. The sections factor through the relative rigid Hodge locus after shrinking (open locus containing the generic points), and exhaust it after removing the image of the finite-completion boundary, as in HodgeStructuresPartII:H.5/rigid-locus-exhaustion, now with base S × 𝔸¹ and using HodgeStructuresPartII:H.5/rigid-hodge-splitting (ii) over the generic point.
4. The count: by HodgeStructuresPartII:H.5/rigid-correspondence the rigid connections and rigid Higgs bundles of each determinant L^a are in bijection; the zero fibres of the sections are the Higgs bundles.

**Acceptance.** For r = 1, M = d and the sections are (L_S^a, λ∇). The corrected index set runs over a = 0, …, d − 1 with L^a in each term.

**Direct dependencies.** `HodgeStructuresPartII:H.5/simultaneous-spreading`, `HodgeStructuresPartII:H.5/nilpotent-rigid-models`, `HodgeStructuresPartII:H.5/rigid-locus-exhaustion`, `HodgeStructuresPartII:H.5/rigid-hodge-splitting`, `HodgeStructuresPartII:H.5/relative-moduli`, `HodgeStructuresPartII:H.5/rigid-correspondence`, `HodgeStructuresPartII:H.0/rees-parameter`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §4.2, Proposition 4.10, p.133: “(b) there are finitely many λ-connections (NSi , DSi )i=1,...,M on XS ×S A1S with re- spect to λ=pr2 , and furthermore we assume that (NSi , DSi ) is geometrically P -stable;” — Statement (b).
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §4.2, Proposition 4.10 proof, p.133: “This can be shown using the same techniques as for the proof of Proposi- tion 3.3.” — Proof by the same spreading technique.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §4.2, p.133: “We denote by nL the number of rank-r rigid flat connections on X with determinant isomorphic to La for a=0, ..., d−1,” — The count n_L over the determinant orbit.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules; moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions).

## H.5d. Integrality and integral variations

The fourth group is integrality. Integral and strongly integral representations are defined separately: strong integrality plus unitarity gives finite image, and so does integrality with unitarity at every complex embedding (Landesman–Litt 2022 Lemma 7.2.1), but a character with value a unit-circle root of a Salem polynomial is integral, unitary and of infinite image (Esnault–Groechenig Example 6.3). Integrality is checked place by place. Esnault–Groechenig's theorem says that irreducible cohomologically rigid local systems with finite determinant and quasi-unipotent local monodromy are integral; Klevdal–Patrikis extend it to G-irreducible, G-cohomologically rigid local systems for split reductive G. Local systems of geometric origin underlie integral polarizable variations; on analytically very general curves integral variations of rank below 2√(g+1) have finite monodromy (Landesman–Litt 2022), cohomologically rigid SL₃ local systems are of geometric origin (Langer–Simpson with Esnault–Groechenig), and on a variety without symmetric differentials every representation is rigid with finite image (Arapura; Brunebarbe–Klingler–Totaro). On the total space of a punctured versal family of genus-g curves, local systems of rank r < √(g+1) whose fibre restriction is irreducible and unitary are strongly cohomologically rigid (Landesman–Litt Proposition 8.2.1), by a fibrewise H¹-vanishing lemma and H.4's Artinian vanishing theorem.

### Integral representations and local systems

**Definition:** `IsIntegralRepresentation`. Node: `HodgeStructuresPartII:H.5/integral-representation`.

Let Γ be a group and G an affine group scheme of finite type over ℤ (GL_r, PGL_r or a split reductive group). A representation ρ: Γ → G(ℂ) is integral if there are a number field K ⊂ ℂ, with ring of integers 𝒪_K, and g ∈ G(ℂ) such that gρg⁻¹ factors through G(𝒪_K) ⊂ G(ℂ). An integral realization records the data (K, a flat affine model G_{𝒪_K} of G_K, the conjugator g, the 𝒪_K-valued representation); for G = GL_r it is equivalently a local system of projective 𝒪_K-modules W with W ⊗_{𝒪_K} ℂ ≅ V. A local system on a connected space is integral if its monodromy representation is. For finitely generated Γ and G = GL_r, ρ is integral iff it is conjugate to a representation into GL_r(ℤ̄), ℤ̄ the ring of algebraic integers in ℂ (Esnault–Groechenig's formulation). Integrality over the full ring 𝒪_K is required: integrality over a ring of S-integers 𝒪_{K,Σ} is a weaker, different notion. Integral is not strongly integral (HodgeStructuresPartII:H.5/strongly-integral).

**Hypotheses.**

- Γ any group (finitely generated for the GL_r(ℤ̄) reformulation and for the local criterion); G an affine group scheme over ℤ.
- The conjugator is in G(ℂ), not G(K); integrality is a property of the conjugacy class.

**Proof or construction.**

1. Define the predicate as existence of the number field and conjugator.
2. For finitely generated Γ: if gρg⁻¹ has entries in ℤ̄ on finitely many generators and their inverses, these finitely many algebraic integers lie in 𝒪_K for the number field K they generate; conversely 𝒪_K ⊂ ℤ̄.
3. Projective-module formulation (Esnault–Groechenig 2018 §1): a projective 𝒪_K-module of rank r becomes free over 𝒪_L for a finite extension L (e.g. one capitulating the Steinitz class), so a local system of projective 𝒪_K-modules gives an 𝒪_L-valued representation after enlarging K.

**Uses.**

- Landesman–Litt, Canonical representations of surface groups, Definition 8.3.1 and Lemmas 8.3.3–8.3.4: Integrality of PGL_r- and GL_r-local systems from Klevdal–Patrikis; lifting integrality from PGL_r to GL_r with finite determinant.
- Esnault–Groechenig, Rigid connections and F-isocrystals, Remark 6.2 and Proposition 8.2: Integral means conjugate into GL_n(ℤ̄); integrality with unitarity at all embeddings gives finiteness.
- Esnault–Groechenig, Cohomologically rigid local systems and integrality, §1: Integral local systems come from local systems of projective 𝒪_L-modules; integrality is checked place by place.
- Klevdal–Patrikis, Compatibility of canonical ℓ-adic local systems on adjoint Shimura varieties (catalogue item PAPER-KLEVDAL-PATRIKIS-25/031, routed to this roadmap): An integral realization of a group-valued representation with number field, integral group model and conjugator as data, compatible with completions at every finite place.
- HodgeStructuresPartII:H.5/integrality-EG18, HodgeStructuresPartII:H.5/integrality-KP, HodgeStructuresPartII:H.5/unitary-embeddings-finite, HodgeStructuresPartII:H.5/integral-pvhs: Conclusion of the integrality theorems and hypothesis of the finiteness theorems.

**API.**

- `IsIntegralRepresentation` (constructor): ∃ K number field ⊂ ℂ, ∃ g ∈ G(ℂ), ∀ γ, gρ(γ)g⁻¹ ∈ G(𝒪_K).
- `IntegralRealization` (structure): The data (K, G_{𝒪_K}, g, ρ_{𝒪_K}) with ρ_{𝒪_K} ⊗_{𝒪_K} ℂ = gρg⁻¹; model changes and finite extensions K ⊂ K′ transport realizations.
- `IsIntegralRepresentation.iff_algebraicIntegers` (characterisation): For Γ finitely generated and G = GL_r, integral ↔ ∃ g, ∀ γ, all entries of gρ(γ)g⁻¹ are algebraic integers (IsIntegral ℤ).
- `IsIntegralRepresentation.iff_projectiveLattice` (equivalence): For G = GL_r, integral ↔ the local system comes by extension of scalars from a local system of finitely generated projective 𝒪_K-modules.
- `IsIntegralRepresentation.of_finite` (relation): Finite image implies integral.
- `IsIntegralRepresentation.charpoly` (relation): If ρ is integral then every ρ(γ) has characteristic polynomial with algebraic-integer coefficients; in particular tr ρ(γ) ∈ ℤ̄.
- `IsIntegralRepresentation.conj_aut` (relation): For σ ∈ Aut(ℂ), σ∘ρ is integral iff ρ is.
- `IsIntegralRepresentation.of_projectivization` (relation): For G = GL_r and det ρ of finite order, ρ is integral iff its projectivization Γ → PGL_r(ℂ) is integral (Landesman–Litt Lemma 8.3.4: the obstruction is a torsor under the finite kernel of G → PGL_r, trivial over a finite extension).
- `IsIntegralRepresentation.of_realization` (constructor): An IntegralRealization of ρ (number field K, 𝒪_K-valued representation, complex embedding, conjugator) shows that ρ is integral.
- `IsIntegralRepresentation.restrictScalars` (relation): If ρ is GL_r(𝒪_K)-valued then ⊕_{τ: K → ℂ} τ∘ρ is conjugate into GL_{r[K:ℚ]}(ℤ), hence strongly integral.

**Unit tests.**

- `IsIntegralRepresentation.test_trivial` (degenerate): The trivial representation Γ → GL_r(ℂ) is integral with K = ℚ and g = 1.
- `IsIntegralRepresentation.test_half_not_integral` (non-example): ρ: ℤ → GL_1(ℂ), 1 ↦ 1/2, is not integral: conjugation does not change a 1 × 1 matrix and 1/2 is not an algebraic integer.
- `IsIntegralRepresentation.test_S_integral_not_integral` (non-example): ρ: ℤ → GL_1(ℤ[1/2]), 1 ↦ 2, is 𝒪_{ℚ,{2}}-valued but not integral, since 1/2 = ρ(−1) is not an algebraic integer.
- `IsIntegralRepresentation.test_unipotent` (computation): ρ: ℤ → GL_2(ℂ), 1 ↦ [[1, 1/3],[0, 1]], is integral: conjugation by diag(3, 1) gives [[1, 1],[0, 1]] ∈ GL_2(ℤ).
- `IsIntegralRepresentation.test_compat_ringOfIntegers` (compatibility): For a number field K ⊂ ℂ and ρ with values in GL_r(𝒪_K) (entries satisfying IsIntegral ℤ), ρ is integral.

**Acceptance.** Finite-image representations are integral. Rank-one ρ: ℤ → GL_1(ℂ), 1 ↦ 1/2, is not integral. An 𝒪_{K,Σ}-valued representation need not be integral.

**Direct dependencies.** `mathlib:Matrix.GeneralLinearGroup`, `HodgeStructuresPartII:H.5/projective-rigidity`.

**Source passages.**

- [LL24](https://arxiv.org/pdf/2205.15352v4), §8.3, Definition 8.3.1, p.39: “Definition 8.3.1. Let G be a group scheme over Z. We say a representation π1 ( X, x ) → G (C) is integral if it is conjugate to a representation which factors through G (OK ) for some number field K.” — Definition.
- [EG18](https://arxiv.org/pdf/1711.06436v3), §1, p.1: “a complex local system is said to be integral if it is coming by extension of scalars from a local system of projective OL -modules of finite type, where OL is the ring of integers of a number field L ⊂ C.” — Projective-lattice formulation.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §6, Remark 6.2, p.146: “Here, Z denotes the ring of algebraic integers.” — Formulation with the ring of all algebraic integers (bar lost in the text layer).

**Suggested file.** 12 names declared or stated as examples; 3 listed in the omission inventory (missing carriers: projective linear groups PGL_r and projective representations; completions of number fields at finite places, lattices over rings of integers and companions; general split reductive group schemes over ℤ and their adjoint representations).

### Strongly integral representations

**Definition:** `IsStronglyIntegral`. Node: `HodgeStructuresPartII:H.5/strongly-integral`.

A representation ρ: Γ → GL_n(ℂ) is strongly integral if it is GL_n(ℂ)-conjugate to a representation with values in GL_n(ℤ); equivalently Γ preserves a ℤ-lattice Λ ⊂ ℂ^n of rank n spanning ℂ^n over ℂ (Λ ⊗_ℤ ℂ ≅ ℂ^n). Strong integrality implies integrality; the converse fails. Restriction of scalars converts integrality into strong integrality: if ρ has values in GL_r(𝒪_K), then ⊕_{τ: K → ℂ} τ∘ρ is strongly integral of rank r[K : ℚ].

**Hypotheses.**

- Γ any group; n ≥ 0.

**Proof or construction.**

1. Lattice formulation: a ℤ-basis of Λ that is also a ℂ-basis of ℂ^n conjugates ρ into GL_n(ℤ), and conversely ℤ^n is preserved by GL_n(ℤ).
2. Restriction of scalars: 𝒪_K^r is a free ℤ-module of rank r[K:ℚ] preserved by ρ, and 𝒪_K ⊗_ℤ ℂ ≅ ℂ^{Hom(K,ℂ)} identifies 𝒪_K^r ⊗ ℂ with ⊕_τ τ∘ρ (Esnault–Groechenig Proposition 8.2 proof).

**Uses.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, Remark 6.2 and Proposition 8.2: Strong integrality plus unitarity implies finite monodromy (Katz, Proposition 4.2.1.3); the direct sum of all Galois conjugates of an integral representation is strongly integral.
- Langer–Simpson, Rank 3 rigid representations, §1: A local system of projective 𝒪_K-modules viewed as a ℤ-local system, whose complexification is the sum of the Galois conjugates.
- HodgeStructuresPartII:H.5/strong-integral-unitary-finite: Hypothesis of the finiteness criterion.

**API.**

- `IsStronglyIntegral` (constructor): ∃ g ∈ GL_n(ℂ), ∀ γ, gρ(γ)g⁻¹ has integer entries.
- `IsStronglyIntegral.iff_lattice` (characterisation): IsStronglyIntegral ρ ↔ ∃ Λ ⊂ ℂ^n a Γ-stable ℤ-submodule, free of rank n, spanning ℂ^n.
- `IsStronglyIntegral.isIntegral` (relation): Strongly integral implies integral.
- `IsStronglyIntegral.restrictScalars` (constructor): For ρ with values in GL_r(𝒪_K), the representation ⊕_{τ} τ∘ρ is strongly integral.
- `IsStronglyIntegral.sum` (functoriality): Direct sums, tensor products and duals of strongly integral representations are strongly integral.
- `IsStronglyIntegral.unitary_finite` (relation): Strongly integral and unitary implies finite image (HodgeStructuresPartII:H.5/strong-integral-unitary-finite).

**Unit tests.**

- `IsStronglyIntegral.test_gl_n_Z` (degenerate): Every representation with values in GL_n(ℤ), for instance the trivial one, is strongly integral.
- `IsStronglyIntegral.test_salem_not_strong` (non-example): For α a root of x⁴ − x³ − x² − x + 1 with |α| = 1, the character ℤ → GL_1(ℂ), 1 ↦ α, is integral (α is a unit of ℤ̄) but not strongly integral (GL_1(ℤ) = {±1}).
- `IsStronglyIntegral.test_restriction_of_scalars` (computation): For K = ℚ(i) and ρ: ℤ → GL_1(ℤ[i]), 1 ↦ i, the sum of the two embeddings is conjugate to 1 ↦ [[0,−1],[1,0]] ∈ GL_2(ℤ).
- `IsStronglyIntegral.test_implies_integral` (compatibility): IsStronglyIntegral ρ → IsIntegralRepresentation ρ (take K = ℚ).

**Acceptance.** Every GL_n(ℤ)-valued representation is strongly integral. The rank-one character with value a Salem-type unit is integral but not strongly integral.

**Direct dependencies.** `HodgeStructuresPartII:H.5/integral-representation`, `mathlib:Matrix.GeneralLinearGroup`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §6, Remark 6.2, p.146: “We emphasize that this is not the same as strong integrality, which amounts to” — Strong integrality is distinct from integrality.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §8.4, proof of Proposition 8.2, p.153: “where σ runs through the Galois group G of L has monodromy in GL(r|G|, Z)” — Restriction of scalars gives strong integrality.

**Suggested file.** 7 names declared or stated as examples; 3 listed in the omission inventory (missing carriers: completions of number fields at finite places, lattices over rings of integers and companions).

### Strongly integral unitary representations are finite

**Theorem:** `IsStronglyIntegral.unitary_finite`. Node: `HodgeStructuresPartII:H.5/strong-integral-unitary-finite`.

If ρ: Γ → GL_n(ℂ) is strongly integral and unitary (HodgeStructuresPartII:H.5/unitary-representation), then ρ(Γ) is finite.

**Hypotheses.**

- Γ any group.

**Proof or construction.**

1. Conjugate so that ρ(Γ) ⊂ GL_n(ℤ) (strong integrality); conjugation preserves compactness of the closure, so the closure of ρ(Γ) is compact.
2. GL_n(ℤ) is discrete in GL_n(ℂ); a discrete subset of a compact set is finite, so ρ(Γ) ⊂ GL_n(ℤ) ∩ (compact) is finite (Esnault–Groechenig Remark 6.2, citing Katz Proposition 4.2.1.3).

**Acceptance.** Applies to ⊕_τ τ∘ρ for an integral ρ all of whose Galois conjugates are unitary (with HodgeStructuresPartII:H.5/unitary-embeddings-finite). Fails for merely integral unitary representations (HodgeStructuresPartII:H.5/infinite-image-unitary-example).

**Direct dependencies.** `HodgeStructuresPartII:H.5/strongly-integral`, `HodgeStructuresPartII:H.5/unitary-representation`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §6, Remark 6.2, p.146: “While it is true that “strong integrality and unitary” implies finite monodromy, it does not hold that “integrality and unitary” implies finite monodromy.” — Statement and its limitation.

**Suggested file.** All 1 names are declared or stated as examples.

### Integral representations unitary at every embedding are finite

**Theorem:** `unitary_embeddings_finite`. Node: `HodgeStructuresPartII:H.5/unitary-embeddings-finite`.

Let K be a number field, Γ a group and ρ: Γ → GL_m(𝒪_K). If for every embedding ι: K → ℂ the representation ρ ⊗_{𝒪_K, ι} ℂ is unitary, then ρ has finite image.

**Hypotheses.**

- Every embedding, not one: a single unitary embedding does not suffice (HodgeStructuresPartII:H.5/infinite-image-unitary-example).

**Proof or construction.**

1. The product ∏_ι ρ_ι: Γ → ∏_ι GL_m(ℂ) has image with compact closure, by unitarity at each ι.
2. 𝒪_K embeds discretely in ∏_ι ℂ (a nonzero algebraic integer has |norm| ≥ 1); hence GL_m(𝒪_K) is discrete in ∏_ι GL_m(ℂ). Concretely, unitary matrices have entries of absolute value ≤ 1 (Mathlib entry_norm_bound_of_unitary), so every entry a of a conjugated ρ(γ) satisfies a uniform bound |ι(a)| ≤ C for all ι, and NumberField.Embeddings.finite_of_norm_le shows there are finitely many such algebraic integers.
3. The image is discrete and has compact closure, hence finite (Landesman–Litt 2022 Lemma 7.2.1).

**Acceptance.** Finite-image ρ satisfy the hypothesis. The Salem-type character satisfies unitarity at two of its four embeddings only.

**Direct dependencies.** `HodgeStructuresPartII:H.5/unitary-representation`, `HodgeStructuresPartII:H.5/integral-representation`, `mathlib:NumberField.Embeddings.finite_of_norm_le`, `mathlib:entry_norm_bound_of_unitary`, `tauceti:TauCeti.Matrix.isCompact_unitaryGroup`.

**Source passages.**

- [LL22](https://arxiv.org/pdf/2202.00039v2), §7.2, Lemma 7.2.1, p.51: “If for each embedding ι : K ֒→ C the representation ρ ⊗OK ,ι C is unitary, then ρ has finite image.” — Statement.
- [LL22](https://arxiv.org/pdf/2202.00039v2), §7.2, proof of Lemma 7.2.1, p.51: “Hence the image of ∏ ι ρι is discrete and compact, and therefore finite.” — Discrete and compact.

**Suggested file.** All 1 names are declared or stated as examples.

### Integral unitary rank-one local systems of infinite image

**Construction:** `SalemCharacter`. Node: `HodgeStructuresPartII:H.5/infinite-image-unitary-example`.

Let α ∈ ℂ be an algebraic integer with |α| = 1 that is not a root of unity, for example a root of the Salem polynomial x⁴ − x³ − x² − x + 1 on the unit circle (the other roots are real, ≈ 1.722 and ≈ 0.581). Then ᾱ = α⁻¹ is a conjugate of α (a root of the same monic integral polynomial), so α is a unit of ℤ̄. For a compact orientable surface Σ of genus g ≥ 1 with standard generators a_1, …, a_{2g} of π₁(Σ, x), define χ_α(a_1) = α and χ_α(a_i) = 1 for i > 1; this is a well-defined character π₁(Σ, x) → GL_1(ℤ̄) because GL_1 is abelian. χ_α is integral and unitary, has infinite image, and is not unitary at every embedding: some field automorphism σ of ℂ sends α to the real conjugate of modulus > 1. It is not of finite monodromy. Its determinant (the character itself) has infinite order, so it lies outside the finite-determinant hypothesis of the integrality theorems, and it is not rigid in M_B(π₁(Σ), GL_1) = (ℂ^×)^{2g}.

**Hypotheses.**

- g ≥ 1 (so that a_1 exists with abelianization ℤ^{2g}); α an algebraic integer of absolute value 1, not a root of unity.

**Proof or construction.**

1. Existence of α: the polynomial x⁴ − x³ − x² − x + 1 is irreducible and palindromic with exactly two real roots τ ≈ 1.722, τ⁻¹ and two complex conjugate roots on the unit circle; it is not cyclotomic (it has a root of modulus > 1), so its unit-circle roots are not roots of unity (Esnault–Groechenig cite Daileda for existence in general).
2. ᾱ is a root of the same real polynomial, and |α| = 1 gives ᾱ = α⁻¹; hence α⁻¹ is an algebraic integer and χ_α has values in GL_1(ℤ̄): integral.
3. |χ_α(γ)| = 1 for all γ: unitary (HodgeStructuresPartII:H.5/unitary-representation, rank one test).
4. If χ_α had finite image then α^n = 1 for some n; contradiction. Kronecker's theorem (Mathlib NumberField.Embeddings.pow_eq_one_of_norm_eq_one) shows that some conjugate of α has modulus ≠ 1, matching HodgeStructuresPartII:H.5/unitary-embeddings-finite.

**Uses.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, Remark 6.2 and Example 6.3: Counterexample showing that integrality and unitarity do not imply finite monodromy, while strong integrality and unitarity do.
- HodgeStructuresPartII:H.5/strong-integral-unitary-finite, HodgeStructuresPartII:H.5/unitary-embeddings-finite, HodgeStructuresPartII:H.5/rigidity-conjugate: Sharpness of the finiteness criteria; unitarity is not Galois-invariant.

**API.**

- `SalemCharacter` (constructor): For an algebraic integer α with ‖α‖ = 1 and a surjection Γ → ℤ (for surfaces of genus ≥ 1, the first coordinate of the abelianization), the character γ ↦ α^{n(γ)}.
- `SalemCharacter.isUnitary` (relation): SalemCharacter α is unitary.
- `SalemCharacter.isIntegral` (relation): SalemCharacter α is integral, since α and α⁻¹ = ᾱ are algebraic integers.
- `SalemCharacter.infinite_range` (relation): If α is not a root of unity and Γ → ℤ is surjective, the image is infinite.
- `SalemCharacter.not_strongly_integral` (relation): SalemCharacter α is not strongly integral (GL_1(ℤ) = {±1}).
- `SalemCharacter.exists_nonunitary_conjugate` (relation): Some σ ∈ Aut(ℂ) makes σ ∘ SalemCharacter α non-unitary (Kronecker).

**Unit tests.**

- `SalemCharacter.test_unitary` (computation): For Γ = Multiplicative ℤ and α a unit-circle root of x⁴ − x³ − x² − x + 1, the character n ↦ α^n is unitary and integral.
- `SalemCharacter.test_infinite_image` (characterisation): The character n ↦ α^n is injective, hence has infinite image, because α is not a root of unity.
- `SalemCharacter.test_kronecker` (compatibility): There is a ring homomorphism φ: ℚ(α) → ℂ with ‖φ(α)‖ ≠ 1 (contrapositive of NumberField.Embeddings.pow_eq_one_of_norm_eq_one).
- `SalemCharacter.test_gaussian_not_integral` (non-example): β = (3 + 4i)/5 has |β| = 1 and is not a root of unity, but it is not an algebraic integer (minimal polynomial 5x² − 6x + 5), so n ↦ β^n is unitary of infinite image but not integral.

**Acceptance.** Integral, unitary, infinite image. Some Galois conjugate is not unitary.

**Direct dependencies.** `HodgeStructuresPartII:H.5/integral-representation`, `HodgeStructuresPartII:H.5/strongly-integral`, `HodgeStructuresPartII:H.5/unitary-representation`, `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one`, `ClassicalArithmeticCompletion:CA.6`.

**Source passages.**

- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §6, Example 6.3, p.146: “be an algebraic integer which is not a root of unity such that |α|=1” — Hypotheses on α.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §6, Example 6.3, p.146: “This representation is integral and unitary by construction. However, it cannot be of finite monodromy, since otherwise α would be a root of unity.” — Conclusion.

**Suggested file.** All 10 names are declared or stated as examples.

### Local criterion for integrality

**Theorem:** `isIntegral_of_local`. Node: `HodgeStructuresPartII:H.5/integrality-local-criterion`.

Let Γ be finitely generated, G a connected reductive group over ℤ (GL_r in Esnault–Groechenig), K a number field, Σ a finite set of finite places of K and ρ: Γ → G(𝒪_{K,Σ}). If for every λ ∈ Σ the completion ρ_λ: Γ → G(K_λ) is G(K̄_λ)-conjugate to a representation into G(𝒪_{K̄_λ}) (for G reductive: G(K_λ)-conjugate into G(𝒪_{K_λ}) after a finite extension), then there is a finite extension L/K such that ρ is G(L)-conjugate to a representation Γ → G(𝒪_L); in particular ρ is integral.

**Hypotheses.**

- Γ finitely generated; places outside Σ already integral because ρ is 𝒪_{K,Σ}-valued.
- Finite extensions of K are allowed.

**Proof or construction.**

1. GL_r: the 𝒪_{K,Σ}-lattice and the local integral lattices at λ ∈ Σ glue (inverse image of ∏_{λ∈Σ} Ō_{K_λ}-lattices under the localization map) to a Γ-stable lattice of projective 𝒪_K-modules after a finite extension (Esnault–Groechenig 2018 §1; Bass Cor. 2.3, 2.5).
2. A projective 𝒪_K-module becomes free over 𝒪_L for a finite extension L (HodgeStructuresPartII:H.5/integral-representation API iff_projectiveLattice).
3. Reductive G: choose g_λ ∈ G^ad(K_λ) conjugating ρ_λ into G(𝒪_{K_λ}), lift to G^sc after a finite extension, approximate by strong approximation and glue (Klevdal–Patrikis Proposition 3.1).

**Acceptance.** If Σ = ∅ the conclusion is immediate. Fails if some λ ∈ Σ is not integral: ρ: ℤ → GL_1(ℤ[1/2]), 1 ↦ 2, at λ = 2.

**Direct dependencies.** `HodgeStructuresPartII:H.5/integral-representation`.

**Source passages.**

- [EG18](https://arxiv.org/pdf/1711.06436v3), §1, p.2: “Then V is integral if and only if for any λ in Σ, VK̄λ = VK ⊗K K̄λ comes by extension of scalars from a local system VŌK of free ŌKλ -modules.” — GL_r criterion (subscripts λ displaced in the text layer).
- [KP20](https://arxiv.org/pdf/2009.07350v2), §3, Proposition 3.1, p.5: “Then there exists a finite extension L/K such that ρ is G(L)-conjugate to a representation Γ → G(OL ).” — Reductive version.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: completions of number fields at finite places, lattices over rings of integers and companions).

### Integrality of cohomologically rigid local systems

**Theorem:** `isIntegral_of_cohomologicallyRigid`. Node: `HodgeStructuresPartII:H.5/integrality-EG18`. Planet: *Integrality of rigid local systems*.

Let X be a smooth connected quasi-projective complex variety with a good compactification. Every irreducible complex local system V on X that is cohomologically rigid (HodgeStructuresPartII:H.5/cohomological-rigidity), has finite-order determinant, and has quasi-unipotent local monodromy along every boundary component, is integral (HodgeStructuresPartII:H.5/integral-representation): its monodromy is conjugate into GL_r(𝒪_L) for a number field L. Integral is not strongly integral; the conclusion is over the full ring 𝒪_L.

**Hypotheses.**

- X smooth connected quasi-projective over ℂ; V irreducible of rank r; H¹(U, a_* End⁰V) = 0; det V of finite order d; local monodromies quasi-unipotent with eigenvalue orders dividing h.
- External inputs (recorded with their hypotheses, not re-proved here): Lafforgue's Langlands correspondence for GL_r over function fields (GlobalShtukasAndFunctionFieldLanglands:GS.6), Drinfeld's existence of ℓ′-companions on smooth varieties over finite fields, Deligne's purity and weight theory (DeligneWeightsAndPurity:DWP.7), tame specialization of fundamental groups (InverseGaloisAndArithmeticFundamentalGroups:IG.1), Saito's local acyclicity, Deligne's theorem on local monodromy of compatible systems on curves, and étale–Betti comparison.

**Proof or construction.**

1. Finiteness and number field: the set S(r, d, h) of such local systems is finite (HodgeStructuresPartII:H.5/rigid-finite); each is defined over 𝒪_{K,Σ} for a number field K and finite Σ (HodgeStructuresPartII:H.5/rigid-number-field).
2. By HodgeStructuresPartII:H.5/integrality-local-criterion it suffices to show integrality at each λ ∈ Σ. Fix λ, choose λ′ ∉ Σ dividing ℓ′, complete at λ′ to get λ′-adic lisse sheaves V_{i,λ′} on X, and choose a model X_S (HodgeStructuresPartII:H.5/smooth-arithmetic-model) and a closed point s of characteristic p prime to ℓ, ℓ′, d, h, Σ and the residual monodromy orders.
3. Tame specialization π₁^ét(X) → π₁^{ét,p′}(X_s̄) (IG.1) descends the V_{i,λ′} to tame lisse sheaves on X_s̄; isolatedness of [V_{i,λ′}] in the prescribed-monodromy moduli over K_{λ′} and continuity of the Frobenius action make them descend to arithmetic sheaves on X_{s′} with finite determinant after a finite extension s′/s (Esnault–Groechenig 2018 Proposition 3.1, a variant of Simpson's Theorem 4).
4. Drinfeld's theorem gives λ-companions V^σ_{i,λ′,s} (ℓ-adic for λ | ℓ, ℓ ≠ p), which are integral (come from Ō_{K_λ}-lattices). Purity and equality of L-functions of End⁰ show H¹(X̄_s̄, j_{!*}End⁰V^σ) = 0 (weight argument of Esnault–Groechenig 2018 Lemma 3.4, with HodgeStructuresPartII:H.5/intermediate-extension-h1); local acyclicity and Betti–étale comparison transport back to X: the companions give N(r, d, h) pairwise non-isomorphic cohomologically rigid irreducible local systems on X with the same data, all integral at λ.
5. Counting: these exhaust S(r, d, h), so each V_i is integral at λ. Vary λ over Σ (changing p as needed) and conclude with the local criterion.

**Acceptance.** Rank one: finite-order characters are integral. Hypergeometric local systems on ℙ¹ ∖ {0,1,∞} with quasi-unipotent local monodromies are integral. The conclusion cannot be strengthened to strong integrality in general.

**Direct dependencies.** `HodgeStructuresPartII:H.5/cohomological-rigidity`, `HodgeStructuresPartII:H.5/rigid-finite`, `HodgeStructuresPartII:H.5/rigid-number-field`, `HodgeStructuresPartII:H.5/integrality-local-criterion`, `HodgeStructuresPartII:H.5/smooth-arithmetic-model`, `HodgeStructuresPartII:H.5/intermediate-extension-h1`, `HodgeStructuresPartII:H.5/boundary-monodromy-data`, `HodgeStructuresPartII:H.5/prescribed-monodromy-tangent`, `GlobalShtukasAndFunctionFieldLanglands:GS.6`, `DeligneWeightsAndPurity:DWP.7`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Source passages.**

- [EG18](https://arxiv.org/pdf/1711.06436v3), §1, Theorem 1.1, p.1: “Then ir- reducible cohomologically rigid complex local systems with finite determinant and quasi- unipotent local monodromies around the components at infinity of a good compactification are integral.” — Statement.
- [EG18](https://arxiv.org/pdf/1711.06436v3), §1, p.2: “The short proof presented in this note only uses the ` to `0 companions, the existence of which has been proved by Drinfeld” — Proof route through Drinfeld's companions.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §8.1, p.151: “In [EG] the authors prove Simpson’s integrality conjecture for cohomologically rigid flat connections.” — Use in Rigid connections and F-isocrystals.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops; completions of number fields at finite places, lattices over rings of integers and companions).

### Integrality of G-cohomologically rigid local systems

**Theorem:** `isIntegral_of_G_cohomologicallyRigid`. Node: `HodgeStructuresPartII:H.5/integrality-KP`.

Let X be a connected smooth quasi-projective complex variety with base point x, G a split connected reductive group over ℤ with maximal abelian quotient A, and ρ: π₁(X, x) → G(ℂ) G-irreducible (image in no proper parabolic subgroup) and G-cohomologically rigid (H¹(X̄, j_{!*} g^der) = 0 for a good compactification), with quasi-unipotent local monodromy and with π₁(X, x) → G(ℂ) → A(ℂ) of finite image. Then the identity component of the Zariski closure of ρ(π₁(X,x)) is semisimple, and ρ is G(ℂ)-conjugate to a homomorphism π₁(X, x) → G(𝒪_L) for a number field L. For G = PGL_r (A trivial) this applies to the projectivizations used by Landesman–Litt; with HodgeStructuresPartII:H.5/integral-representation API of_projectivization it gives integrality of GL_r-local systems with finite determinant.

**Hypotheses.**

- G split connected reductive over ℤ; ρ G-irreducible and G-cohomologically rigid with quasi-unipotent local monodromy and finite abelianized image.
- External inputs: those of HodgeStructuresPartII:H.5/integrality-EG18, with Drinfeld's G-valued companions (connected monodromy) in place of GL_r companions; recorded with hypotheses, not re-proved.

**Proof or construction.**

1. Moduli: the stack of G-irreducible representations with fixed abelianization and local classes is of finite type (HodgeStructuresPartII:H.5/prescribed-monodromy-moduli, G-version), with tangent space H¹(U, a_* g^der) (HodgeStructuresPartII:H.5/prescribed-monodromy-tangent); hence finitely many such ρ, each defined over 𝒪_{K,Σ}.
2. Reduce to G simple adjoint (Klevdal–Patrikis Lemma 5.1); specialize to a finite field, descend to arithmetic G-local systems and show the connected monodromy is semisimple (Klevdal–Patrikis Proposition 5.6, Corollary 5.7).
3. Produce λ-companions with full G-monodromy by Drinfeld, transport them back by tame specialization, and count as in HodgeStructuresPartII:H.5/integrality-EG18; conclude with the reductive local criterion (HodgeStructuresPartII:H.5/integrality-local-criterion).

**Acceptance.** For G = GL_n it recovers HodgeStructuresPartII:H.5/integrality-EG18 (apart from the semisimplicity conclusion). Local systems of geometric origin satisfy the quasi-unipotence and finite-abelianization hypotheses (Klevdal–Patrikis Remark 1.3).

**Direct dependencies.** `HodgeStructuresPartII:H.5/integrality-EG18`, `HodgeStructuresPartII:H.5/integrality-local-criterion`, `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`, `HodgeStructuresPartII:H.5/prescribed-monodromy-tangent`, `HodgeStructuresPartII:H.5/cohomological-rigidity`, `HodgeStructuresPartII:H.5/projective-rigidity`, `GlobalShtukasAndFunctionFieldLanglands:GS.6`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Source passages.**

- [KP20](https://arxiv.org/pdf/2009.07350v2), §1, Theorem 1.2, p.2: “ρ is G(C)-conjugate to a homomorphism π1top (X, x) → G(OL ).” — Conclusion.
- [KP20](https://arxiv.org/pdf/2009.07350v2), §1, Definition 1.1, p.2: “is G-cohomologically rigid if H 1 (X, j!∗ gder ) = 0” — Hypothesis.
- [LL24](https://arxiv.org/pdf/2205.15352v4), §8.3, proof of Lemma 8.3.3, p.40: “Because the abelianization of PGLr (C) is trivial, it follows from [KP20b, Theorem 1.2] that ρe is integral once we verify that ρe has quasi-unipotent local monodromy around the boundary components of a good (i.e. strict normal crossing) compactification of C ◦ .” — Application to PGL_r.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops; completions of number fields at finite places, lattices over rings of integers and companions; general split reductive group schemes over ℤ and their adjoint representations).

### Local systems of geometric origin

**Definition:** `IsOfGeometricOrigin`. Node: `HodgeStructuresPartII:H.5/geometric-origin`.

A complex local system V on a smooth complex variety X is of geometric origin if there are a dense Zariski open U ⊂ X, a smooth projective morphism f: Y → U and an integer i ≥ 0 such that V|_U is a subquotient of R^i f_* ℂ_Y. Since R^i f_* ℂ is semisimple (Deligne), subquotient and direct summand give the same notion; the variant with smooth proper f contains this one. A flat algebraic connection is of geometric origin if its local system is (equivalently, on U it is a subquotient of a Gauss–Manin connection R^i f_*(Ω^•_{Y/U}, d)). The definition asserts nothing about existence of such families for rigid objects (Simpson's motivicity conjecture).

**Hypotheses.**

- X smooth connected over ℂ; f smooth projective (Esnault–Groechenig, Langer–Simpson) — Landesman–Litt allow smooth proper f; record which variant a consumer uses.

**Proof or construction.**

1. Define the predicate by existence of (U, f, i) and a subquotient embedding.
2. Semisimplicity of R^i f_* ℂ for smooth projective f (Deligne's theorem, via the polarized ℤ-variation of Hodge structure on R^i f_* ℤ, HodgeStructuresPartII:H.2) turns subquotients into direct summands.
3. Gauss–Manin version: the algebraic de Rham comparison for smooth projective families (ComplexComparisonPartII:C5) identifies R^i f_* ℂ ⊗ O_U with the Gauss–Manin connection.

**Uses.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, Conjecture 1.3 and §8.1: Simpson's motivicity conjecture for rigid connections; cohomologically rigid SL_3 connections are of geometric origin.
- Landesman–Litt, Canonical representations of surface groups, §9.1 and Corollary 9.1.4: Relative Fontaine–Mazur: arithmetic local systems of low rank on generic curves; geometric origin implies underlying an integral PVHS.
- Langer–Simpson, Rank 3 rigid representations, §1 and Theorem 1.3: Definition and the rank-3 theorem.
- HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs, HodgeStructuresPartII:H.5/rigid-sl3-geometric, HodgeStructuresPartII:H.5/very-general-rank-bound: Consumers.

**API.**

- `IsOfGeometricOrigin` (constructor): ∃ U dense open, f: Y → U smooth projective, i, with V|_U a subquotient of R^i f_* ℂ.
- `IsOfGeometricOrigin.iff_summand` (characterisation): Equivalent with 'direct summand' in place of 'subquotient' (semisimplicity).
- `IsOfGeometricOrigin.restrict` (functoriality): Pullback along a morphism X′ → X and restriction to dense opens preserve geometric origin.
- `IsOfGeometricOrigin.sum_tensor_dual` (functoriality): Direct sums, tensor products, duals and subquotients of local systems of geometric origin are of geometric origin (fibre products and Künneth).
- `IsOfGeometricOrigin.quasiUnipotent` (relation): Local systems of geometric origin have quasi-unipotent local monodromy at infinity (local monodromy theorem, LefschetzPencilsAndVanishingCycles:LPV.1).
- `IsOfGeometricOrigin.integralPVHS` (relation): Geometric origin implies underlying an integral PVHS (HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs).

**Unit tests.**

- `IsOfGeometricOrigin.test_constant` (degenerate): The constant local system ℂ_X is of geometric origin (U = X, f = id_X, i = 0).
- `IsOfGeometricOrigin.test_finite_monodromy` (computation): A local system with finite monodromy is of geometric origin: it is a summand of f_* ℂ for the finite étale cover f trivializing it (i = 0).
- `IsOfGeometricOrigin.test_salem_not` (non-example): The Salem-type character χ_α on a genus-one curve is not of geometric origin: geometric origin implies that every Galois conjugate underlies a polarizable variation (HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs), and a rank-one polarizable variation is unitary, while some conjugate of χ_α is not unitary.
- `IsOfGeometricOrigin.test_legendre` (computation): On X = ℙ¹ ∖ {0, 1, ∞}, R¹f_*ℂ for the Legendre family y² = x(x − 1)(x − λ) is of geometric origin (rank 2, infinite monodromy).

**Acceptance.** Constant local systems ℂ^r are of geometric origin (f = id, i = 0). Finite-monodromy local systems are of geometric origin (finite étale covers).

**Direct dependencies.** `HodgeStructuresPartII:H.2`, `ComplexComparisonPartII:C5`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `HodgeStructuresPartII:H.5/boundary-monodromy-data`.

**Source passages.**

- [LL24](https://arxiv.org/pdf/2205.15352v4), §9.1, p.45: “Recall that a local system V on a smooth complex variety X is of geometric origin if there is some Zariski open U ⊂ X and a smooth proper morphism f : Y → U so that V|U is a subquotient of Ri f ∗ C for some i.” — Landesman–Litt's definition (smooth proper).
- [LS18](https://arxiv.org/pdf/1604.03252v3), §1, p.1: “we say that an irreducible C-local system L is of geometric origin if there is a Zariski open dense subset U ⊂ X and a smooth projective family f : Z → U such that L|U is a direct factor of Ri f∗ (CZ ) for some i.” — Langer–Simpson's definition (smooth projective, direct factor).
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §1, p.104: “The latter are precisely subquotients of Gauss–Manin connections, that is, with underlying local” — Esnault–Groechenig's Gauss–Manin formulation.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology).

### Integral polarizable variations of Hodge structure

**Definition:** `IsIntegralPVHS`. Node: `HodgeStructuresPartII:H.5/integral-pvhs`.

A complex local system V on a smooth complex variety X underlies an integral PVHS if there are a number field K, a local system W of finitely generated projective 𝒪_K-modules with V ≅ W ⊗_{𝒪_K, ι₀} ℂ for an embedding ι₀, such that for every embedding ι: 𝒪_K → ℂ the local system W ⊗_{𝒪_K, ι} ℂ underlies a polarizable complex variation of Hodge structure on X (HodgeStructuresPartII:H.2). This is the hypothesis of Landesman–Litt 2022 Theorem 1.2.5 and condition (4) of Landesman–Litt 2024 Corollary 9.1.4. It requires variations at all embeddings; a single complex variation with integral monodromy is a weaker condition.

**Hypotheses.**

- X smooth connected over ℂ; K a number field; W an 𝒪_K-local system; every Galois conjugate polarizable as a complex variation.

**Proof or construction.**

1. Define the predicate as existence of (K, W, ι₀) with the variation condition at every ι.
2. Integral PVHS implies integral (HodgeStructuresPartII:H.5/integral-representation): W gives the projective 𝒪_K-lattice.

**Uses.**

- Landesman–Litt, Geometric local systems on very general curves and isomonodromy, Theorem 1.2.5: Hypothesis of the rank bound on analytically very general curves.
- Landesman–Litt, Canonical representations of surface groups, Corollary 9.1.4: Condition (4), implied by geometric origin and implying finite monodromy in low rank.
- HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs, HodgeStructuresPartII:H.5/very-general-rank-bound: Consumers.

**API.**

- `IsIntegralPVHS` (constructor): ∃ K, W: 𝒪_K-local system, ι₀, V ≅ W ⊗_{ι₀} ℂ ∧ ∀ ι, W ⊗_ι ℂ underlies a polarizable complex variation.
- `IsIntegralPVHS.isIntegral` (relation): Implies integrality of the monodromy.
- `IsIntegralPVHS.conj_aut` (relation): Preserved by σ ∈ Aut(ℂ).
- `IsIntegralPVHS.of_geometricOrigin` (relation): Geometric origin implies IsIntegralPVHS (HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs).
- `IsIntegralPVHS.unitary_all_finite` (relation): If moreover every W ⊗_ι ℂ is unitary, the monodromy is finite (HodgeStructuresPartII:H.5/unitary-embeddings-finite).

**Unit tests.**

- `IsIntegralPVHS.test_finite_monodromy` (degenerate): A local system with finite monodromy underlies an integral PVHS: it is defined over 𝒪_K for K containing its character values and every conjugate is unitary, hence a variation of a single Hodge type.
- `IsIntegralPVHS.test_salem_not` (non-example): The Salem-type character χ_α is integral and unitary but does not underlie an integral PVHS: some conjugate σ∘χ_α is not unitary, and a rank-one polarizable complex variation is unitary (HodgeStructuresPartII:H.5/zero-higgs-unitary).
- `IsIntegralPVHS.test_isIntegral` (compatibility): IsIntegralPVHS V → IsIntegralRepresentation of the monodromy of V.
- `IsIntegralPVHS.test_unitary_everywhere_finite` (characterisation): If V underlies an integral PVHS through W and every W ⊗_ι ℂ is unitary, then the monodromy of V is finite (HodgeStructuresPartII:H.5/unitary-embeddings-finite).

**Acceptance.** Finite-monodromy local systems underlie integral PVHS (single Hodge type, unitary at every embedding). Local systems of geometric origin underlie integral PVHS.

**Direct dependencies.** `HodgeStructuresPartII:H.5/integral-representation`, `HodgeStructuresPartII:H.2`.

**Source passages.**

- [LL22](https://arxiv.org/pdf/2202.00039v2), §1.2, Theorem 1.2.5, p.3: “Suppose addi- tionally that for each embedding ι : OK → C, V ⊗OK ,ι C underlies a polarizable complex variation of Hodge structure.” — The integral PVHS hypothesis.
- [LL24](https://arxiv.org/pdf/2205.15352v4), §9.1, Corollary 9.1.4(4), p.46: “underlies an integral PVHS.” — Condition (4).

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles).

### Local systems of geometric origin underlie integral variations

**Theorem:** `IsOfGeometricOrigin.integralPVHS`. Node: `HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs`.

Let V be a complex local system of geometric origin on a smooth complex variety X (V|_U a subquotient of R^i f_* ℂ for a smooth projective f: Y → U over a dense open U ⊂ X). Then V is defined over 𝒪_L for a number field L and every Galois conjugate V ⊗_{𝒪_L, ι} ℂ underlies a polarizable complex variation of Hodge structure on X: V underlies an integral PVHS (HodgeStructuresPartII:H.5/integral-pvhs).

**Hypotheses.**

- f smooth projective (for smooth proper f, use the polarizable ℤ-variation on R^i f_*ℤ modulo torsion supplied by Hodge theory of smooth proper families).
- Semisimplicity and isotypic decomposition of polarizable variations, and extension of variations across a codimension subset where the local system extends (Schmid's Corollary 4.11), are supplied by HodgeStructuresPartII:H.2.

**Proof or construction.**

1. R^i f_* ℤ modulo torsion underlies a polarized ℤ-variation of Hodge structure, so R^i f_* ℂ is semisimple and its isotypic components carry sub-variations (Deligne; Landesman–Litt 2022 Proposition 4.1.4(2)).
2. A subquotient of R^i f_* ℂ is a direct summand; the summand is defined over a number field L and preserves a lattice, giving an 𝒪_L-local system W (Landesman–Litt 2022 §7.3: the 𝒪_K-structure comes from the ℤ-structure).
3. Each embedding ι gives a Galois-conjugate summand W^ι|_U of R^i f_* ℂ, which underlies a polarizable complex variation on U.
4. W^ι|_U extends as a local system to X, hence so does the variation (Schmid, Corollary 4.11, via HodgeStructuresPartII:H.2).

**Acceptance.** Implies (3) ⇒ (4) of Landesman–Litt 2024 Corollary 9.1.4. Constant and finite-monodromy local systems are covered.

**Direct dependencies.** `HodgeStructuresPartII:H.5/geometric-origin`, `HodgeStructuresPartII:H.5/integral-pvhs`, `HodgeStructuresPartII:H.5/integral-representation`, `HodgeStructuresPartII:H.2`, `ComplexComparisonPartII:C5`.

**Source passages.**

- [LL22](https://arxiv.org/pdf/2202.00039v2), §7.3, proof of Corollary 1.2.7, p.52: “The existence of an OK -structure follows from the fact that Ri f ∗ C has a Z-structure.” — Integral structure.
- [LL22](https://arxiv.org/pdf/2202.00039v2), §7.3, proof of Corollary 1.2.7, p.52: “Any such summand underlies a polarizable complex variation of Hodge structure, by Proposition 4.1.4(2).” — Variation at every embedding.
- [LL24](https://arxiv.org/pdf/2205.15352v4), §9.1, proof of Corollary 9.1.4, p.46: “since any local system of geometric origin underlies an integral PVHS.” — Use in Landesman–Litt 2024.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology; polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles).

### Low-rank variations on analytically general curves are unitary

**Theorem:** `unitary_of_lowRank_pvhs`. Node: `HodgeStructuresPartII:H.5/low-rank-pvhs-unitary`.

(Landesman–Litt 2022 Theorem 1.2.12, Theorem 1.2.13 in v3.) Let (C, x_1, …, x_n) be a hyperbolic n-pointed curve of genus g and (E,∇) a flat vector bundle on C with regular singularities at the x_i and rank E < 2√(g+1). If an isomonodromic deformation of (E,∇) to an analytically general nearby n-pointed curve underlies a polarizable complex variation of Hodge structure, then (E,∇) has unitary monodromy. In the form used by Landesman–Litt 2024: a local system of rank < 2√(g+1) on the total space of a punctured versal family of hyperbolic genus-g curves that underlies a complex PVHS restricts to a unitary local system on every fibre.

**Hypotheses.**

- (C, x_i) hyperbolic: 2g − 2 + n > 0; rank < 2√(g+1).
- Isomonodromic deformation over a neighbourhood in Teichmüller space and analytically general points (Landesman–Litt 2022 Definition 1.2.3); these carriers are not planned in any layer of the atlas and are recorded as a gap.
- Parabolic semistability and Clifford-type bounds for isomonodromic deformations come from HodgeStructuresPartII:H.4.

**Proof or construction.**

1. By Landesman–Litt 2022 Corollary 6.1.2, after an isomonodromic deformation to an analytically general nearby curve the parabolic bundle E_⋆ is semistable when the rank bound holds (parabolic Clifford-type bounds, HodgeStructuresPartII:H.4).
2. A polarizable complex variation whose parabolic Hodge bundle is semistable has zero Kodaira–Spencer (Higgs) field (Landesman–Litt 2022 Lemma 7.1.1), hence unitary monodromy (HodgeStructuresPartII:H.5/zero-higgs-unitary, quasi-projective version via the parabolic correspondence).

**Acceptance.** Rank one: every polarizable complex variation of rank one is unitary. Sharpness discussion: the bound 2√(g+1) is where the Clifford-type estimate fails.

**Direct dependencies.** `HodgeStructuresPartII:H.5/zero-higgs-unitary`, `HodgeStructuresPartII:H.5/unitary-representation`, `HodgeStructuresPartII:H.4`, `HodgeStructuresPartII:H.2`.

**Source passages.**

- [LL22](https://arxiv.org/pdf/2202.00039v2), §1.2, Theorem 1.2.12, pp.4–5: “If an isomonodromic deformation of (E, ∇) to an analytically” — Statement (continued across the page break: 'general nearby n-pointed curve underlies a polarizable complex variation of Hodge structure, then (E, ∇) has unitary monodromy').
- [LL24](https://arxiv.org/pdf/2205.15352v4), §8.4, proof of Proposition 8.4.1, p.41: “By [LL22, Theorem 1.2.12], in order to show ρτ is unitary, it is enough to show ρ′τ underlies a complex PVHS on C ◦ .” — Form used in Landesman–Litt 2024.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: Teichmüller space, versal families of pointed curves and isomonodromic deformations; polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles).

### Integral variations of low rank on very general curves have finite monodromy

**Theorem:** `rank_bound_veryGeneral`. Node: `HodgeStructuresPartII:H.5/very-general-rank-bound`.

(Landesman–Litt 2022 Theorem 1.2.5.) Let K be a number field, (C, x_1, …, x_n) an analytically very general hyperbolic n-pointed curve of genus g, and V an 𝒪_K-local system on C ∖ {x_1, …, x_n} with infinite monodromy such that V ⊗_{𝒪_K, ι} ℂ underlies a polarizable complex variation of Hodge structure for every embedding ι (V underlies an integral PVHS, HodgeStructuresPartII:H.5/integral-pvhs). Then rk_{𝒪_K} V ≥ 2√(g+1). Equivalently, integral PVHS of rank < 2√(g+1) on such curves have finite monodromy; in particular (Corollary 1.2.7) local systems of geometric origin with infinite monodromy have rank ≥ 2√(g+1).

**Hypotheses.**

- Analytically very general point of M_{g,n} (complement of countably many nowhere dense closed analytic subsets, locally).
- Integral PVHS at every embedding; infinite monodromy.

**Proof or construction.**

1. For a fixed 𝒪_K-representation ρ of rank < 2√(g+1) with infinite image, the set T_ρ of points of Teichmüller space where every conjugate underlies a polarizable variation is contained in a closed analytic subset; otherwise the variations extend to analytically general nearby curves, so every conjugate is unitary (HodgeStructuresPartII:H.5/low-rank-pvhs-unitary) and ρ has finite image (HodgeStructuresPartII:H.5/unitary-embeddings-finite), a contradiction.
2. There are countably many such ρ, so an analytically very general point avoids all the images M_ρ (Landesman–Litt 2022 §7.2).
3. Geometric origin: apply HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs (Corollary 1.2.7).

**Acceptance.** Finite-monodromy local systems are allowed in every rank. The uniformizing variation (rank 2, infinite monodromy, not integral in general) shows the integral hypothesis is essential (Landesman–Litt 2022 Remark 1.2.6).

**Direct dependencies.** `HodgeStructuresPartII:H.5/low-rank-pvhs-unitary`, `HodgeStructuresPartII:H.5/unitary-embeddings-finite`, `HodgeStructuresPartII:H.5/integral-pvhs`, `HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs`.

**Source passages.**

- [LL22](https://arxiv.org/pdf/2202.00039v2), §1.2, Theorem 1.2.5, p.3: “is an analytically very general n-pointed hyperbolic curve of genus g, and V is a OK -local system on C \ { x1 , · · · , xn } with infinite monodromy.” — Hypotheses.
- [LL22](https://arxiv.org/pdf/2202.00039v2), §7.2, proof of Theorem 1.2.5, p.52: “Indeed, if it did, Theorem 1.2.12 implies ∏ι:OK →C ρι has unitary monodromy, and Lemma 7.2.1 implies its monodromy is finite.” — Proof route.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: Teichmüller space, versal families of pointed curves and isomonodromic deformations; polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles).

### Cohomologically rigid SL₃ local systems are of geometric origin

**Theorem:** `isOfGeometricOrigin_of_sl3`. Node: `HodgeStructuresPartII:H.5/rigid-sl3-geometric`.

Let X be a smooth connected projective complex variety with base point x. (a) (Langer–Simpson Theorem 1.3) Every rigid, integral, irreducible representation ρ: π₁(X, x) → SL_3(ℂ) is of geometric origin; by Langer–Simpson Theorem 4.1 as read by Esnault–Groechenig, its local system is a subquotient of the Gauss–Manin local system of a family of abelian varieties over a dense open of X. (b) (Esnault–Groechenig §8.1) Every cohomologically rigid irreducible flat connection of rank 3 with trivial determinant on X is of geometric origin.

**Hypotheses.**

- X smooth projective; rank 3; determinant trivial (SL_3).
- (a) is Langer–Simpson's theorem, recorded with its hypotheses (rigid, integral, irreducible) and not re-proved; its proof constructs weight-one integral variations and uses the moduli of abelian varieties (AbelianSchemesAndArithmeticModuli roadmaps).

**Proof or construction.**

1. (b) A cohomologically rigid irreducible connection with trivial determinant is rigid (HodgeStructuresPartII:H.5/coh-rigid-reduced-isolated) and integral (HodgeStructuresPartII:H.5/integrality-EG18 with X projective, so the quasi-unipotence condition is vacuous).
2. Apply (a) to its monodromy (Esnault–Groechenig §8.1).
3. (a) Langer–Simpson: the Galois conjugates L^σ of the integral rigid L carry complex variations (HodgeStructuresPartII:H.5/rigid-underlies-cvhs) of Hodge type weight one after adjusting, which assemble into a polarized weight-one ℤ-variation, i.e. a family of abelian varieties; L is a summand of its Gauss–Manin local system.

**Acceptance.** Finite-monodromy SL_3 local systems are covered trivially. No integrality hypothesis is needed in (b) because integrality is proved by HodgeStructuresPartII:H.5/integrality-EG18.

**Direct dependencies.** `HodgeStructuresPartII:H.5/integrality-EG18`, `HodgeStructuresPartII:H.5/coh-rigid-reduced-isolated`, `HodgeStructuresPartII:H.5/geometric-origin`, `HodgeStructuresPartII:H.5/rigid-underlies-cvhs`, `HodgeStructuresPartII:H.5/integral-representation`.

**Source passages.**

- [LS18](https://arxiv.org/pdf/1604.03252v3), §1, Theorem 1.3, p.2: “Then every rigid integral irreducible representation ρ : π1 (X , x) → SL (3, C) is of geometric origin.” — Langer–Simpson.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §8.1, p.151: “Combining the two aforementioned results, one sees that cohomologically rigid SL(3)-connections on smooth projective varieties are of geometric origin.” — Esnault–Groechenig's combination.
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §8.1, proof of Proposition 8.1, p.152: “together with the remarks above imply that cohomologically rigid SL(3)-connections all are sub- quotients of Gauss–Manin connections coming from families of abelian varieties.” — Families of abelian varieties.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions; algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology).

### No symmetric differentials forces finite rigid monodromy

**Application:** `finite_of_no_symmetric_differentials`. Node: `HodgeStructuresPartII:H.5/no-symmetric-differentials`.

Let X be a compact Kähler manifold (smooth projective in the uses here) with H⁰(X, Sym^i Ω¹_X) = 0 for every i ≥ 1. Then: (a) (Arapura; Brunebarbe–Klingler–Totaro Theorem 4.1) every finite-dimensional complex representation of π₁(X) is rigid, in the sense that its point of M_B(X, GL(n)) is isolated (no determinant fixed); (b) (Brunebarbe–Klingler–Totaro Theorem 0.1) every finite-dimensional representation of π₁(X) over any field has finite image; (c) every Higgs bundle in M_Dol(X, (L,0), r) has nilpotent Higgs field, the Hitchin base A_r being a point.

**Hypotheses.**

- X smooth projective (the atlas's moduli are algebraic); all symmetric differentials vanish (for (a) in rank n, those of degree 1 ≤ i ≤ n suffice).
- (a) and (c) are proved from H.1; (b) is recorded from Brunebarbe–Klingler–Totaro with its hypotheses: it uses positivity of variations of Hodge structure and Katzarkov–Zuo's p-adic harmonic maps, which no layer of the atlas plans (gap).

**Proof or construction.**

1. (c) The Hitchin base ⊕_{i≥2} H⁰(X, Sym^i Ω¹) is zero, so h ≡ 0 and every Higgs field is nilpotent (HodgeStructuresPartII:H.1/hitchin-map API nilpotent_iff).
2. (a) Arapura's argument: the GL_n Hitchin base ⊕_{i=1}^{n} H⁰(X, Sym^i Ω¹) is zero, so the Hitchin morphism of the semistable Higgs moduli is constant; it is proper (HodgeStructuresPartII:H.1/hitchin-properness), so M_Dol(X, GL_n) is proper over ℂ, hence compact. By the non-abelian Hodge homeomorphism of the semisimple coarse spaces (HodgeStructuresPartII:H.1/nonabelian-hodge-topology) M_B(X, GL_n) is compact; it is affine (HodgeStructuresPartII:H.1/betti-coarse), hence finite, and every point is isolated.
3. (b) Brunebarbe–Klingler–Totaro: by (a) the representation is rigid, so its semisimplification underlies a complex variation of Hodge structure (HodgeStructuresPartII:H.5/rigid-underlies-cvhs, Simpson Corollary 4.2); bigness of the cotangent bundle on the period-map image would produce symmetric differentials unless the monodromy is finite; the non-semisimple case reduces to H¹ of a finite cover.

**Acceptance.** ℙⁿ and simply connected varieties satisfy the conclusion trivially. Consistent with Esnault–Groechenig §8.2: on such X all integrable connections are rigid and have finite monodromy.

**Direct dependencies.** `HodgeStructuresPartII:H.5/rigid-representation`, `HodgeStructuresPartII:H.5/rigid-underlies-cvhs`, `HodgeStructuresPartII:H.5/rigid-higgs-nilpotent`, `HodgeStructuresPartII:H.1/hitchin-map`, `HodgeStructuresPartII:H.1/hitchin-properness`, `HodgeStructuresPartII:H.1/nonabelian-hodge-topology`, `HodgeStructuresPartII:H.1/betti-coarse`.

**Source passages.**

- [BKT13](https://arxiv.org/pdf/1204.6443v3), Introduction, Theorem 0.1, p.1: “Suppose that there is a finite- dimensional representation of π1 X over some field with infinite image. Then X has a nonzero symmetric differential.” — Theorem 0.1.
- [BKT13](https://arxiv.org/pdf/1204.6443v3), §4, Theorem 4.1, p.9: “complex representation of dimension n which is not rigid. Then H 0 (X, S i Ω1X ) 6= 0 for some 1 ≤ i ≤ n.” — Arapura's theorem (≠ rendered as 6= in the text layer).
- [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §8.2, p.152: “has the property that all integrable connections are rigid and have finite mon- odromy, see [BKT, Theorem 0.1].” — Use in Esnault–Groechenig.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions).

### First cohomology vanishing from fibrewise data

**Lemma:** `fibrewise_h1_vanishing`. Node: `HodgeStructuresPartII:H.5/fibrewise-h1-vanishing`.

Let G be a group, N ⊴ G a normal subgroup and A a representation of G over a field. If A^N = 0 and the G/N-invariants of H¹(N, A) vanish, then H¹(G, A) = 0. Topologically: for a fibration π: E → B of path-connected spaces with fibre F and a local system W on E with H⁰(F, W|_F) = 0 and H⁰(B, R¹π_* W) = H¹(F, W|_F)^{π₁(B)} = 0, one has H¹(E, W) = 0. If N is the image of π₁(F) → π₁(E), the second condition follows from H¹(π₁(F), W)^{π₁(B)} = 0 since H¹(N, W) → H¹(π₁(F), W) is injective (inflation along a surjection whose kernel acts trivially).

**Hypotheses.**

- Group-theoretic form: any group G, normal N, representation A.
- Topological form: Serre fibration of path-connected, locally simply connected spaces; degree-one local-system cohomology equals group cohomology.

**Proof or construction.**

1. Inflation–restriction (Mathlib groupCohomology.H1InfRes and H1InfRes_exact): 0 → H¹(G/N, A^N) → H¹(G, A) → H¹(N, A) is exact; with A^N = 0 the restriction is injective.
2. The image of restriction consists of G/N-invariant classes (conjugation action), which vanish by hypothesis, so H¹(G, A) = 0.
3. Topological translation: the homotopy exact sequence π₁(F) → π₁(E) → π₁(B) → 1 identifies G/N with π₁(B); R¹π_*W is the local system on B with fibre H¹(F, W|_F) and monodromy the conjugation action; this is the Leray five-term sequence used by Landesman–Litt.

**Acceptance.** Recovers the vanishing H¹(𝒞°, ad V) = 0 of Landesman–Litt Proposition 8.2.1 from π°_* ad V = 0 and H⁰(M, R¹π°_* ad V) = 0. For G = N the statement reduces to H¹(G, A) = 0 being one of the hypotheses.

**Direct dependencies.** `mathlib:groupCohomology.H1InfRes`, `mathlib:groupCohomology.H1InfRes_exact`, `mathlib:groupCohomology.H1`, `HodgeStructuresPartII:H.5/trace-free-adjoint`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Source passages.**

- [LL24](https://arxiv.org/pdf/2205.15352v4), §8.2, proof of Proposition 8.2.1, p.39: “Using the Leray spectral sequence associated to the map π ◦ , it suffices to show that” — Leray reduction to H⁰(M, R¹π°_*) and H¹(M, π°_*).

**Suggested file.** All 1 names are declared or stated as examples.

### Low-rank local systems with irreducible unitary fibres are strongly cohomologically rigid

**Theorem:** `versal_unitary_strongly_rigid`. Node: `HodgeStructuresPartII:H.5/versal-unitary-rigidity`.

Let π°: 𝒞° → M be a punctured versal family of n-pointed genus-g curves (as in HodgeStructuresPartII:H.4 and Landesman–Litt Notation 1.10.1), m ∈ M and C° = 𝒞°_m. Let V be a GL_r-local system (respectively a PGL_r-local system) on the total space 𝒞° with r < √(g+1), such that V|_{C°} is (respectively is the projectivization of) an irreducible unitary local system. Then H¹(𝒞°, ad V) = 0: V is strongly cohomologically rigid (HodgeStructuresPartII:H.5/strong-cohomological-rigidity), hence cohomologically rigid for every good compactification of 𝒞° (HodgeStructuresPartII:H.5/strong-implies-cohomological).

**Hypotheses.**

- r < √(g+1), i.e. rk ad V = r² − 1 < g, as needed for the Artinian unitary vanishing theorem of HodgeStructuresPartII:H.4 (Landesman–Litt Theorem 6.2.1 with A = ℂ).
- V lives on the total space 𝒞°; the unitarity and irreducibility hypotheses concern the restriction to one fibre (corrected statement of the routed item).
- Versal families of pointed curves are supplied through HodgeStructuresPartII:H.4 and the mapping-class-group roadmap proposed with the Landesman–Litt route.

**Proof or construction.**

1. By HodgeStructuresPartII:H.5/fibrewise-h1-vanishing it suffices that π°_* ad V = 0 and H⁰(M, R¹π°_* ad V) = 0.
2. π°_* ad V = 0: ad V|_{C°} = ad⁰ of an irreducible local system has no invariants by Schur's lemma (HodgeStructuresPartII:H.5/trace-free-adjoint API invariants_eq_bot).
3. H⁰(M, R¹π°_* ad V) = 0 by Landesman–Litt Theorem 6.2.1 with A = ℂ, since ad V|_{C°} is unitary of rank r² − 1 < g (HodgeStructuresPartII:H.4).

**Acceptance.** r = 1: ad V = 0 and the statement is trivial. The bound r < √(g+1) enters through rk ad V = r² − 1 < g.

**Direct dependencies.** `HodgeStructuresPartII:H.5/fibrewise-h1-vanishing`, `HodgeStructuresPartII:H.5/strong-cohomological-rigidity`, `HodgeStructuresPartII:H.5/strong-implies-cohomological`, `HodgeStructuresPartII:H.5/trace-free-adjoint`, `HodgeStructuresPartII:H.5/unitary-representation`, `HodgeStructuresPartII:H.4`.

**Source passages.**

- [LL24](https://arxiv.org/pdf/2205.15352v4), §8.2, Proposition 8.2.1, p.39: “Suppose that for m ∈ M , V|C◦ is (respectively, is the projectivization of) an irreducible, unitary local system. Then V is strongly cohomologically rigid.” — Statement.
- [LL24](https://arxiv.org/pdf/2205.15352v4), §8.2, proof of Proposition 8.2.1, p.39: “We have H 0 (M , R1 π∗◦ ad V) = 0 by Theorem 6.2.1 (taking A = C), as rk ad V = r2 − 1 < g” — Use of the Artinian vanishing theorem.

**Suggested file.** Listed in the omission inventory with its statements (missing carriers: Teichmüller space, versal families of pointed curves and isomonodromic deformations).

## Boundaries and suppliers

Inside this roadmap the layer imports, by node id, the H.0 nodes for Higgs fields, joint nilpotence, Griffiths filtrations, graded Higgs fields and the Rees parameter connection, and the H.1 nodes for the stable Betti, de Rham, Dolbeault and Hodge moduli, their scaling, Hitchin morphism, Riemann–Hilbert and non-abelian Hodge comparisons, harmonic metrics, the two-types formality and Simpson's étale local product and flatness. It cites the layers HodgeStructuresPartII:H.2 (polarized complex variations, semisimplicity, uniqueness up to shift, Schmid extension) and HodgeStructuresPartII:H.4 (Landesman–Litt Theorem 6.2.1 and parabolic semistability) as stage prerequisites until their nodes exist.

From other roadmaps it requests: reductive GIT, Luna slices, quotient stacks and coarse spaces, Grassmannians, Quot schemes and good compactifications (AlgebraicModuliForArithmeticGeometry R09.1, R09.2, R09.4, R09.5, R09.7d); the de Rham–Betti comparison with coefficients in a flat bundle and the Gauss–Manin identification (ComplexComparisonPartII:C5); the étale intermediate extension (EtaleDualityAndPerverseSheaves:EDC.5); the local monodromy theorem (LefschetzPencilsAndVanishingCycles:LPV.1); EGA IV §8 spreading and Nagata finiteness of normalization (SchemeAndStackFoundations:SF.0); Lafforgue's correspondence and Drinfeld's companions (GlobalShtukasAndFunctionFieldLanglands:GS.6), weights (DeligneWeightsAndPurity:DWP.7) and tame specialization (InverseGaloisAndArithmeticFundamentalGroups:IG.1); a certified Salem polynomial (ClassicalArithmeticCompletion:CA.6); and low-degree cohomology of local systems with the five-term sequence of a fibration from the Tau Ceti algebraic-topology roadmap (stages 5 and 6). Each request names its consuming nodes in the table below.

| Supplier | Need | Consumers |
| --- | --- | --- |
| `AlgebraicModuliForArithmeticGeometry:R09.5` | Reductive GIT quotients of affine (and projective, relatively ample linearized) schemes of finite type by GL_N, PGL_r and SL_r over a universally Japanese base (Seshadri), with good/geometric quotient properties; Luna's étale slice for a free action of PGL_r on the absolutely irreducible locus of the representation scheme, making R_B^s → M_B^s a principal PGL_r-bundle for the étale topology, and at closed orbits of the representation spaces of H.1 (used with Goldman–Millson theory for completed local rings); μ_r-rigidification of stacks whose automorphism groups are μ_r. | `betti-tangent`, `projective-rigidity`, `prescribed-monodromy-moduli`, `relative-moduli`, `derham-betti-tangent` |
| `AlgebraicModuliForArithmeticGeometry:R09.4` | Quotient stacks [R/SL_r] of affine schemes of finite type, locally closed and open substacks, and the coarse moduli space of a finite-type algebraic stack with finite (μ_r) inertia, as used for the moduli of irreducible representations with prescribed local monodromy. | `prescribed-monodromy-moduli` |
| `AlgebraicModuliForArithmeticGeometry:R09.1` | Grassmann bundles Gr(W, k) of a locally free sheaf with their properness over the base, used to show that geometric irreducibility of a family of representations is an open condition. | `prescribed-monodromy-moduli` |
| `AlgebraicModuliForArithmeticGeometry:R09.2` | Quot schemes of a projective morphism over a base of finite type over a universally Japanese ring, with the framed-section parameter schemes used to construct relative moduli of Λ-modules. | `relative-moduli` |
| `AlgebraicModuliForArithmeticGeometry:R09.7d` | Existence of a good compactification: every smooth quasi-projective complex variety X embeds as the complement of a strict normal crossings divisor in a smooth projective variety, and any two good compactifications are dominated by a third. | `boundary-monodromy-data` |
| `ComplexComparisonPartII:C5` | The algebraic de Rham–Betti comparison with coefficients in an algebraic flat bundle on a smooth projective complex variety: H^i_dR(X, (E,∇)) ≅ H^i(X^an, E^∇), natural in (E,∇) and compatible with End⁰; and for smooth projective families the Gauss–Manin identification R^i f_* ℂ ⊗ O ≅ R^i f_*(Ω^•_{Y/U}, d). The stage's stated scope covers constant coefficients. | `derham-betti-tangent`, `geometric-origin`, `geometric-origin-integral-pvhs` |
| `EtaleDualityAndPerverseSheaves:EDC.5` | The intermediate extension j_{!*} for an open immersion with strict normal crossings complement and the triangle j_{!*}F → Rb_* a_* F → C with C supported on the singular locus of the boundary in degrees ≥ 2 (BBD Proposition 2.1.11), giving H¹(X̄, j_{!*}F) ≅ H¹(U, a_* F) for lisse sheaves. | `intermediate-extension-h1` |
| `LefschetzPencilsAndVanishingCycles:LPV.1` | The local monodromy theorem: local systems of geometric origin (subquotients of R^i f_* for smooth proper f) have quasi-unipotent local monodromy around the components of a normal crossings boundary. | `boundary-monodromy-data`, `geometric-origin` |
| `SchemeAndStackFoundations:SF.0` | EGA IV §8 limit theorems for a cofiltered limit of affine schemes (ℂ as the colimit of its finitely generated subrings): descent of finitely presented schemes, morphisms, sections, finitely presented quasi-coherent modules and their morphisms (8.5.2, 8.5.5, 8.8.2), of the properties smooth, projective, geometrically connected (8.10.5), openness of the smooth locus (17.7.8); finiteness of the relative normalization over an excellent (Nagata) base for Zariski's main theorem. | `smooth-arithmetic-model`, `simultaneous-spreading`, `nilpotent-rigid-models`, `rigid-locus-exhaustion` |
| `GlobalShtukasAndFunctionFieldLanglands:GS.6` | L. Lafforgue's correspondence for GL_r over function fields with its consequences for irreducible lisse ℚ̄_ℓ-sheaves with finite-order determinant on curves over finite fields (purity, integrality of Frobenius eigenvalues, existence of ℓ′-companions), and Drinfeld's extension of companions to smooth varieties of any dimension (Drinfeld 2012 Theorem 1.1; G-valued version Drinfeld 2018), as used by Esnault–Groechenig 2018 and Klevdal–Patrikis. | `integrality-EG18`, `integrality-KP` |
| `DeligneWeightsAndPurity:DWP.7` | Weights of H^j(X_s̄, A) ≥ j for pure lisse sheaves on smooth varieties over finite fields (Weil II 3.3.1), and the resulting identification of H¹(X̄_s̄, j_{!*}A) with the weight-one part of ⊕_j H^j(X_s̄, A) for pure tame A of weight 0 (Esnault–Groechenig 2018 Lemma 3.4). | `integrality-EG18` |
| `InverseGaloisAndArithmeticFundamentalGroups:IG.1` | Grothendieck's tame specialization homomorphism π₁^ét(X) → π₁^{ét,p′}(X_s̄) for a smooth model with relative normal crossings boundary over a strictly henselian trait, surjective and an isomorphism on prime-to-p quotients (SGA1 X 2.4, XIII 4.7), and the prime-to-p homotopy exact sequence. | `integrality-EG18`, `integrality-KP` |
| `ClassicalArithmeticCompletion:CA.6` | Salem numbers: certification that x⁴ − x³ − x² − x + 1 is irreducible with exactly two roots on the unit circle that are not roots of unity (conjugate moduli certificate), supplying an algebraic integer of absolute value one that is not a root of unity. | `infinite-image-unitary-example` |
| `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent` | For a Serre fibration F → E → B of path-connected spaces: the homotopy exact sequence π₁(F) → π₁(E) → π₁(B) → 1 and the identification of the local system R¹π_*W on B with fibre H¹(F, W|_F) and monodromy the conjugation action (low-degree Leray–Serre five-term sequence for local coefficients). | `fibrewise-h1-vanishing` |
| `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality` | Singular cohomology with local coefficients and its degree-one identification H¹(X, W) ≅ H¹(π₁(X, x), W_x) for path-connected, locally simply connected X, functorial in X and W. | `prescribed-monodromy-tangent` |

## Gaps

Each gap names the exact missing input and the nodes that need it; nothing here is assumed.

**G1. Quasi-projective non-abelian Hodge theory (Mochizuki).** Mochizuki's Kobayashi–Hitchin correspondence for tame harmonic bundles (Memoirs AMS 2007, Theorem 10.5 and Lemma 10.13), with the determinant refinement stated by Landesman–Litt Theorem 4.3.1, is not planned by any layer: HodgeStructuresPartII:H.1 is projective only. Needed for deformation to variations on quasi-projective X and for Landesman–Litt Lemma 4.3.2. Proposed owner: a further stage of this roadmap after H.4, or a Part II of H.1. Needed by: `deformation-to-cvhs`, `coh-rigid-semisimple-cvhs`, `low-rank-pvhs-unitary`.

**G2. ℓ-adic companions on smooth varieties over finite fields.** Drinfeld 2012 Theorem 1.1 (and Drinfeld 2018 for connected G-monodromy), Deligne's theorem on local monodromy of compatible systems on curves [Deligne 1973, 9.8], Saito's local acyclicity [Saito 2017, Lemma 3.14] and the Kerz–Schmidt tameness criterion are used by Esnault–Groechenig 2018 and Klevdal–Patrikis but are not stated by GS.6, which plans Lafforgue's curve correspondence. The Klevdal–Patrikis 2025 route proposes 'Global shtukas and Langlands over function fields, Part II: group-valued companions and monodromy' and 'Inverse Galois theory and arithmetic fundamental groups, Part II: tame specialization over arithmetic traits' as owners; neither has a design yet. Needed by: `integrality-EG18`, `integrality-KP`.

**G3. Boundedness of semistable Λ-modules in positive and mixed characteristic.** Langer's Theorem 1.1 rests on Langer, Semistable sheaves in positive characteristic (Annals 2004) and Moduli spaces of sheaves in mixed characteristic (Duke 2004). HodgeStructuresPartII:H.1/operator-boundedness covers characteristic zero only. Proposed owner: AlgebraicModuliForArithmeticGeometry (R09.2/R09.5) or a Part II of H.1 over arithmetic bases. Needed by: `relative-moduli`.

**G4. Analytic intermediate extension of local systems.** EDC.5 constructs j_{!*} for étale sheaves; the complex-analytic constructible version on X̄(ℂ) used by Esnault–Groechenig 2018 Remark 2.4 and Klevdal–Patrikis Remark 4.8 is not planned. The a_*-definition of HodgeStructuresPartII:H.5/cohomological-rigidity avoids it; only the comparison with the j_{!*} formulation needs it. Needed by: `intermediate-extension-h1`.

**G5. Equivariant global splitting of the rigid Hodge locus.** Esnault–Groechenig Lemma 4.9 asserts M^rig_Hod ≅ M^rig_Dol × 𝔸¹ 𝔾_m-equivariantly, including non-reduced structure, and derives it from the nonzero trivialization and Simpson's étale local product (1996 Theorem 9.1). The packet proves finiteness, flatness, the reduced splitting and étale-local triviality with constant Artinian fibres; the passage to a global 𝔾_m-equivariant isomorphism of non-reduced schemes needs a 𝔾_m-equivariant local product at the fixed points of M^rig_Dol (or a classification of 𝔾_m-equivariant étale-locally trivial finite flat families over 𝔸¹). Recorded also as source issue HodgeStructuresPartII/E-H5-2. Needed by: `rigid-hodge-splitting`.

**G6. Isomonodromic deformations and analytically general curves.** Landesman–Litt 2022 work on the universal cover T_{g,n} of M_{g,n}: isomonodromic deformations of flat bundles with regular singularities, analytically (very) general points, and the semistability of isomonodromic deformations (their Theorem 1.3.4 and Corollary 6.1.2). No layer plans these carriers; the parabolic semistability and Clifford bounds come from HodgeStructuresPartII:H.4, and mapping class groups and versal families from the proposed roadmap Mapping class groups and canonical representations of surface groups (DESIGN-MappingClassGroupsAndCanonicalRepresentations, pending). Needed by: `low-rank-pvhs-unitary`, `very-general-rank-bound`.

**G7. Symmetric differentials, positivity and p-adic harmonic maps.** Brunebarbe–Klingler–Totaro Theorem 0.1 uses bigness of the cotangent bundle on images of period maps and Katzarkov–Zuo's p-adic harmonic maps; Arapura's Proposition 2.4 (their Theorem 4.1) is proved inside the atlas from H.1 (Hitchin properness and the non-abelian Hodge homeomorphism), as is part (c); part (b) is recorded with its hypotheses. Needed by: `no-symmetric-differentials`.

**G8. Langer–Simpson's construction of geometric origin in rank three.** Langer–Simpson Theorem 1.3 (rigid integral irreducible SL_3 ⇒ geometric origin) constructs weight-one integral variations and families of abelian varieties; the theorem is recorded with its hypotheses. Its inputs (weight-one ℤ-variations are families of abelian varieties; Corlette–Simpson rank-two classification) are not planned. Needed by: `rigid-sl3-geometric`.

**G9. Finite presentation of fundamental groups of smooth quasi-projective varieties.** The construction of R(Γ, L) uses a finite presentation of π₁(X^an, x) for smooth quasi-projective X (a finite CW structure from a triangulation of a compactification minus a normal crossings divisor). HodgeStructuresPartII:H.1 records the projective case in its gap G6; the quasi-projective case is the same topological input. Needed by: `prescribed-monodromy-moduli`.

**G10. Native Lean carriers for the moduli statements.** The suggested file prototypes the group-theoretic, number-theoretic and scheme-theoretic (quasi-finite locus) parts natively; signatures that need the moduli spaces of H.1, line bundles with connections or polarized variations are listed in its omission inventory with their statements. They are to be replaced by native signatures once those carriers exist. Needed by: `rigid-connection`, `hodge-rigid-locus`, `relative-moduli`, `smooth-arithmetic-model`, `prescribed-monodromy-moduli`, `system-of-hodge-bundles`.

## Mistakes in the sources

The register follows section 18 of the protocol; nodes use the corrected statements.

**HodgeStructuresPartII/E-H5-1** (misprint, EG20, Proposition 4.10(c) and the two displays after it, published p.133; proof of Proposition 3.3, p.124). Printed: “(c) the λ-connections of (b) give rise to a bijection ⨆_{i=1}^{M}[(N^i_S,D^i_S)](|S|) = ⨆_{a=0}^{d−1}|M^rig_Hod(X,L,⩽r)| … {1,…,n_L} ≃ ⨆_{a=0}^{d} M^rig_dR(X/C,L^a,R)(C) … We assume that there is a model (X_S,L_S) satisfying conditions (a)–(f).” Correction: Read ⨆_i [(N^i_S,D^i_S)](|S × 𝔸¹|) = ⨆_{a=0}^{d−1} |M^rig_Hod(X_S/S, L_S^a, ⩽ r)|; in the second display a runs to d − 1 and R is r; in the proof of Proposition 3.3 read (a)–(d). Node HodgeStructuresPartII:H.5/nice-hodge-models states the corrected version. Reason: L has order d, so the determinants are L^0, …, L^{d−1}; a term without a has no dependence on the index; the sections are defined on S × 𝔸¹ (they are λ-connections relative to λ = pr₂); Proposition 3.3 has parts (a)–(e), (e) being proved at that point. Affects: nothing. Known: Recorded in the atlas as PAPER-ESNAULT-GROECHENIG-20/E9 (confirmed by REV-PAPER-ESNAULT-GROECHENIG-20); the S × 𝔸¹ domain is added here. No published correction found.

**HodgeStructuresPartII/E-H5-2** (gap, EG20, Lemma 4.9 and its proof, published p.132). Printed: “The morphism M^rig_Hod(X/C, L, r) → A¹ is finite, flat, and splits G_m-equivariantly as M^rig_Hod(X/C, L, r) ≅ M^rig_Dol(X/C, L, r) ×_C A¹ … On the other hand, by [Si4, Theorem 9.1], at a complex point x∈M_Dol(X/C, L, r), the fibre at λ=0, M_Hod(X/C, L, r) is étale locally isomorphic to the product of M_Dol(X/C, L, r) with A¹. This finishes the proof of the first part.” Correction: Finiteness needs the observation that every point of the rigid locus lies on the Rees section of a rigid variation (so the reduced locus is a finite disjoint union of sections); the global 𝔾_m-equivariant isomorphism including non-reduced structure needs, beyond étale-local triviality, an equivariant local product at the 𝔾_m-fixed points of M^rig_Dol or a classification of 𝔾_m-equivariant étale-locally trivial finite flat families over 𝔸¹. Node HodgeStructuresPartII:H.5/rigid-hodge-splitting supplies (i)–(iii) and (v) and records (iv) as a gap. Reason: Simpson's Theorem 9.1 gives étale neighbourhoods U → M_Hod,0 × 𝔸¹ that are étale, not 𝔾_m-equivariant isomorphisms; combined with the trivialization over 𝔾_m it shows that each component of the rigid locus is étale locally Spec(A) × 𝔸¹, which does not by itself give a global equivariant product (an equivariant finite flat family can be étale locally trivial without the trivialization being equivariant), and the printed proof does not address finiteness at all. The isomorphism is used again on p.135 (before Claim 4.14) for W_i(k(s))-points of the arithmetic rigid loci, which also needs it to spread to the model of Proposition 4.10, whose part (c) is a bijection of underlying sets. Affects: the proof. Known: new

**HodgeStructuresPartII/E-H5-3** (misprint, EG20, §1, last display of the introduction, published p.106; compare §7 p.148). Printed: “is called cohomologically rigid, if [(E, ∇)] is a reduced isolated point of M_dR(X, L, r). This is equivalent to vanishing of H¹_dR(X, (End(E), ∇)) = 0” Correction: H¹_dR(X, End⁰(E,∇)) = 0 with trace-free endomorphisms, as on p.148; node HodgeStructuresPartII:H.5/cohomological-rigidity uses trace-free coefficients throughout. Reason: End(E,∇) = End⁰(E,∇) ⊕ (O_X, d) in characteristic zero, so the printed group contains H¹(X, ℂ), nonzero whenever b₁(X) > 0, and the printed condition would never hold on such X. Affects: a stated result. Known: Recorded in the atlas as PAPER-ESNAULT-GROECHENIG-20/E1 (confirmed by REV-PAPER-ESNAULT-GROECHENIG-20). No published correction found.

**HodgeStructuresPartII/E-H5-4** (misprint, EG18, §3, proof of Theorem 1.1, arXiv v3 p.12). Printed: “By the comparison between Betti and étale cohomology one has H¹(U, a_* End(V_i^{σ top})) = 0.” Correction: H¹(U, a_* End⁰(V_i^{σ top})) = 0, the trace-free endomorphisms, as in the preceding sentences (H¹(U, a_* A^σ_i) = 0 with A^σ_i = End⁰(V^σ_{i,λ,s})). Reason: The vanishing is transported from A^σ_i = End⁰(·), defined on p.11; with End the group contains H¹(U, a_* ℂ), which need not vanish, and only the trace-free statement is cohomological rigidity. Affects: nothing. Known: new

**HodgeStructuresPartII/E-H5-5** (misprint, EG18, §2, proof of Proposition 2.1, arXiv v3 pp.4–5). Printed: “The Γ-representation ρ induces an action of Γ on the fibre bundle π : ⊔_{k=0}^{r} Gr(W, k) → T … choose a presentation Γ ≃ ⟨r_1, …, r_e | s_1, …, s_f⟩ and L_1, …, L_e ∈ μ_r(K) … such that r_i ↦ L_i defines the character χ_L … such that the relations det(A_j) = L_i for j = 1, …, e … hold.” Correction: The Grassmannian union runs over 0 < k < r (for k = 0 and k = r every subspace is invariant, so T_0 as printed would be empty); the values L_j lie in μ_d(K), d the order of χ_L (μ_r only when d divides r); the relation is det(A_j) = L_j. Node HodgeStructuresPartII:H.5/prescribed-monodromy-moduli states the corrected construction. Reason: The zero subspace and W itself are Γ-stable, so their Grassmannians lie in the fixed locus; χ_L takes values in μ_d by the setup of §2 ("a rank 1 local system L of order d"); the index i of L_i is the relation index of s_i, not the generator index j. Affects: nothing. Known: new

## Planets

At most six planets are shown for the layer; each is a key definition or named theorem of the sources:

- *Rigid local system* — `HodgeStructuresPartII:H.5/rigid-representation`
- *Cohomological rigidity* — `HodgeStructuresPartII:H.5/cohomological-rigidity`
- *Rigid local systems are variations* — `HodgeStructuresPartII:H.5/rigid-underlies-cvhs`
- *Splitting of the rigid Hodge locus* — `HodgeStructuresPartII:H.5/rigid-hodge-splitting`
- *Nice arithmetic models* — `HodgeStructuresPartII:H.5/nice-hodge-models`
- *Integrality of rigid local systems* — `HodgeStructuresPartII:H.5/integrality-EG18`

After the proposed division into sub-layers, each sub-layer can show further key definitions: *System of Hodge bundles*, *Unitary local system*, *Arithmetic model*, *Integral local system*, *Local system of geometric origin*.

## The suggested Lean file

`research/blueprint/suggested/HodgeStructuresPartII--H.5.lean` declares, against Mathlib and Tau Ceti at the pinned commits, the trace-free adjoint representation on `LieAlgebra.SpecialLinear.sl`, strong and boundary-relative cohomological rigidity through Mathlib's `groupCohomology` and its restriction maps, Simpson's orbit form of rigidity for the topology of pointwise convergence on representations, quasi-unipotence at boundary loops, unitary, integral and strongly integral representations with integral realizations, the finiteness theorems, the Salem character, the rigid locus as `Scheme.Hom.quasiFiniteLocus`, the part of an arithmetic model that Mathlib's schemes express, a chart model of systems of Hodge bundles and the fibrewise H¹-vanishing lemma, with their API and unit tests. Of the 54 nodes, 8 are fully declared, 11 partly and 35 only through the omission inventory at the end of the file, which reproduces the statement of every omitted declaration, API item and unit test and names the missing carriers. The file elaborates in the shared build at the pinned Mathlib, with the two imported Tau Ceti modules read from the pinned commit.

## Coverage and remaining work

Stage `HodgeStructuresPartII:H.5`: **planned**. Every target the layer description states is a node whose prerequisite chains end in the libraries, in nodes of H.0 and H.1, in requested stages of other roadmaps, in the stages H.2 and H.4 of this roadmap, or in a recorded gap. Remaining refinements:

- Lemma-level decomposition when the roadmap comes near the front of the line: split the multi-part theorems (rigid-hodge-splitting (i)–(v), nice-hodge-models (a)–(c), no-symmetric-differentials (a)–(c), rigid-sl3-geometric (a)–(b)) and promote the API items used as prerequisites (Hitchin scaling, trace splitting, base change of H¹) to lemma nodes.
- Resolve the recorded gaps: Mochizuki's tame theory, ℓ-adic companions and tame specialization (pending Part II roadmaps of GlobalShtukas and InverseGalois), Langer's mixed-characteristic boundedness, the analytic intermediate extension, the equivariant non-reduced Hodge splitting, isomonodromy carriers, the Brunebarbe–Klingler–Totaro and Langer–Simpson inputs, and finite presentation of quasi-projective fundamental groups.
- Replace the stage prerequisites HodgeStructuresPartII:H.2 (polarized complex variations, semisimplicity and uniqueness up to shift, Schmid extension) and HodgeStructuresPartII:H.4 (Landesman–Litt Theorem 6.2.1, parabolic semistability) by node ids once those layers are planned, and check that their statements match the uses recorded here.
- Discharge the supplier requests (R09.1, R09.2, R09.4, R09.5, R09.7d, C5 with coefficients, EDC.5, LPV.1, SF.0, GS.6, DWP.7, IG.1, CA.6, Tau Ceti AlgebraicTopology stages 5–6).
- Elaborate the omission-inventory signatures of the suggested file against native moduli carriers once H.1's carriers exist.

## Sources read

- **EG20**: Hélène Esnault and Michael Groechenig, *Rigid connections and F-isocrystals*, Acta Mathematica 225 (2020), 103–158; published version. <https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf>, SHA-256 `0d81a6d3e9be477c58a725096c41f06a8a9262422fe596363c3f04c26ab1cfab`, read 2026-10-07. Sections: §1 pp.104–107: Definition 1.1, Remark 1.2, Conjecture 1.3, Theorems 1.4–1.8 and the cohomological rigidity paragraph; §2.1 pp.108–109: moduli, Hitchin map, rigid Higgs bundles and Lemma 2.1 with proof; §3.1 pp.121–125: (3.1), Lemma 3.1 with proof, Langer's moduli, Definition 3.2, Proposition 3.3 with complete proof; §4.2 pp.131–134: λ-connections, Hodge moduli, Lemma 4.9 with proof, Proposition 4.10 and the displays defining n_L and σ; §5 pp.138–139: Definitions 5.1–5.3; §6 pp.145–146: Theorem 6.1 with proof, Remark 6.2, Example 6.3; §7 pp.146–148: companions summary and the cohomological rigidity paragraph; §8 pp.151–153: §§8.1–8.4 including Proposition 8.2 with proof. The listed passages were read in full in the published text layer; §§2.2–2.6, 3.2–3.3, 4.1, 4.3–4.4, 5 after Definition 5.3, 7 after p.148 and the appendix were not reread for this layer.
- **EG18**: Hélène Esnault and Michael Groechenig, *Cohomologically rigid local systems and integrality*, arXiv:1711.06436v3 (29 January 2018); published in Selecta Mathematica 24 (2018), 4279–4292 (published version not read). <https://arxiv.org/pdf/1711.06436v3>, SHA-256 `622fb7b327b30b522b23c6d50f23e24b5e252d44f61c3684594a78362d5a64dc`, read 2026-10-07. Sections: Complete preprint, pp.1–13: §1 with the integrality criterion and proof outline, §2 Propositions 2.1, 2.3, Remarks 2.2, 2.4, §3 Proposition 3.1, Lemmas 3.2–3.4, proof of Theorem 1.1, Remark 3.5. Whole preprint read; Drinfeld, Lafforgue, Saito and Deligne inputs are cited, not read.
- **LL24**: Aaron Landesman and Daniel Litt, *Canonical representations of surface groups*, arXiv:2205.15352v4 (23 February 2025); published in Annals of Mathematics 199 (2024) (published version not read). <https://arxiv.org/pdf/2205.15352v4>, SHA-256 `4cb511ba40675aa6899b351f2ee27eb9487b4a21f65ec8000c1f2cc1a5107ceb`, read 2026-10-07. Sections: §1.10 Notation 1.10.2; §4.3 Theorem 4.3.1 and Lemma 4.3.2 with proofs; §8.1–8.4: Definitions 8.1.1, 8.1.4, Remark 8.1.2, Lemma 8.1.3, Proposition 8.2.1, Definition 8.3.1, Lemmas 8.3.3–8.3.4, Proposition 8.4.1 with proofs; §9.1 definition of geometric origin and Corollary 9.1.4 with proof. Selected sections relevant to rigidity and integrality; §§4.1–4.2, 5–7 and the appendix belong to other layers and were not reread.
- **KP20**: Christian Klevdal and Stefan Patrikis, *G-rigid local systems are integral*, arXiv:2009.07350v2 (21 September 2020); published in Algebra & Number Theory (published version not read). <https://arxiv.org/pdf/2009.07350v2>, SHA-256 `c759728f34fa45936cabdc5a86b349c4e9bbaa3215a55f109a5ccce9b99e8858`, read 2026-10-07. Sections: §1 Definition 1.1, Theorem 1.2, Remarks 1.3–1.4, §1.1 proof overview; §3 Proposition 3.1; §4 Definition 4.1, Propositions 4.4, 4.6, 4.7 and Remark 4.8. Statements and the proof overview; §§5–6 (specialization, companions) were not read line by line.
- **LS18**: Adrian Langer and Carlos Simpson, *Rank 3 rigid representations of projective fundamental groups*, arXiv:1604.03252v3 (3 February 2018); published in Compositio Mathematica 154 (2018) (published version not read). <https://arxiv.org/pdf/1604.03252v3>, SHA-256 `c52818b5474b74bcb6f952c079bbf22a71247d68d3a74e6d9bd79a358975eef6`, read 2026-10-07. Sections: §1 pp.1–4: definition of geometric origin, Conjectures 1.1–1.2, Theorem 1.3, Corollary 1.4 and the outline of the proof. Introduction only; the proof of Theorem 1.3 is recorded, not read.
- **BKT13**: Yohan Brunebarbe, Bruno Klingler and Burt Totaro, *Symmetric differentials and the fundamental group*, arXiv:1204.6443v3 (24 April 2013); published in Duke Mathematical Journal 162 (2013) (published version not read). <https://arxiv.org/pdf/1204.6443v3>, SHA-256 `ddd1ef68c568bd85e4dc1d180c655d97c23599b03a8932e07ce18f14a908ef20`, read 2026-10-07. Sections: Introduction pp.1–3: Theorem 0.1 and Remark 0.2; §4 p.9: Theorem 4.1 (Arapura) and the definition of rigidity in M_B(X, GL(n)); start of the proof of Theorem 0.1. Statements and the reduction step; the positivity and p-adic harmonic-map arguments were not read.
- **LL22**: Aaron Landesman and Daniel Litt, *Geometric local systems on very general curves and isomonodromy*, arXiv:2202.00039v2. <https://arxiv.org/pdf/2202.00039v2>, SHA-256 `37380b99082b5fc287c4c025247fc8926a18d9f951604bd6e27e467687ddc597`, read 2026-10-07. Sections: §1.2 Definitions 1.2.1, 1.2.3, Theorem 1.2.5, Remark 1.2.6, Corollaries 1.2.7, 1.2.10, Theorem 1.2.12; §7.2 Lemma 7.2.1 with proof and the proof of Theorem 1.2.5; §7.3 proof of Corollary 1.2.7. Statements and the §7 deductions; the isomonodromy and semistability analysis of §§3–6 belongs to layer H.4 and was not read.
- **Langer14**: Adrian Langer, *Semistable modules over Lie algebroids in positive characteristic*, arXiv:1311.2794v2 (26 March 2014); published in Documenta Mathematica 19 (2014) (published version not read). <https://arxiv.org/pdf/1311.2794v2>, SHA-256 `010d546cb54dc59b59e4eaa3a7a2c1955284de76db61292970263a8103c92373`, read 2026-10-07. Sections: §1 pp.3–4: sheaves of rings of differential operators, Gieseker semistability, the moduli functor and Theorem 1.1. Existence theorem and its setting; the boundedness inputs of Langer 2004 are cited, not read.
- **S92**: Carlos T. Simpson, *Higgs bundles and local systems*, Publications Mathématiques de l’IHÉS 75 (1992), 5–95. <https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf>, SHA-256 `74651fcdbcd66b5fdf19724b74e0ecbfcad09033dbff2f14c3b7ed2994f76029`, read 2026-10-07. Sections: Introduction pp.8–9 (rigidity, motivicity and integrality conjectures); §4 pp.44–57: variations of Hodge structure, systems of Hodge bundles, Lemma 4.1, Corollaries 4.2–4.3, Lemma 4.5, Theorem 3, rigid ℓ-adic representations (Theorem 4), ℚ-structure (Theorem 5 proof opening). §4 read in the scanned text layer (OCR); §§1–3 were read for layer H.1, not reread.
- **S94II**: Carlos T. Simpson, *Moduli of representations of the fundamental group of a smooth projective variety II*, Publications Mathématiques de l’IHÉS 80 (1994), 5–79. <https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf>, SHA-256 `5dc0ef646f59819f717b75a90a6a2952af7e29065c34e517e65b2844f90fedbe`, read 2026-10-07. Sections: Introduction pp.8–9 (local structure and isosingularity); §10 pp.64–69: Goldman–Millson deformation diagrams, Theorem 10.4, Proposition 10.5, Theorem 10.6 (isosingularity) and the remarks between them. §10 read in the scanned text layer (OCR); §§6–7 were read for layer H.1, not reread.
- **S96**: Carlos T. Simpson, *The Hodge filtration on nonabelian cohomology*, arXiv alg-geom/9604005v1, preprint pagination. <https://arxiv.org/pdf/alg-geom/9604005>, SHA-256 `2b2096f89734c40995f7a1f20ae2f4568cfed4dd00a5c0ca5df507dfe6ca88c8`, read 2026-10-07. Sections: §7 pp.32–33 Lemma 7.2 with proof; §9 pp.38–39 Theorem 9.1, Corollary 9.2, Conjecture 9.3; §10 pp.41–43 Corollaries 10.2–10.3. Selected statements; §9's local product argument was read for layer H.1 and not reread.
