# H.5 — Rigid loci, arithmetic models and integral variations

This layer of *Hodge structures (pure, mixed, and polarized), Part II* develops the theory of **rigid local systems** on smooth complex varieties: the notions of rigidity and cohomological rigidity with fixed determinant and, on quasi-projective varieties, fixed local monodromy at infinity; the Hodge-theoretic consequences of rigidity (rigid Higgs fields are nilpotent, rigid local systems underlie complex variations of Hodge structure, the rigid locus of the Hodge moduli splits over the affine line); the **arithmetic models** over which the finitely many rigid objects spread; and **integrality**, together with the distinction between integral and strongly integral monodromy and its interaction with unitarity.

The layer starts where layer H.1 stops. H.1 constructs the stable fixed-determinant Betti, de Rham, Dolbeault and Hodge moduli of a smooth projective complex variety, the Riemann–Hilbert analytic isomorphism, the non-abelian Hodge homeomorphism, the Hitchin morphism and Simpson's local product for the Hodge moduli; H.0 supplies Higgs fields, λ-connections, Griffiths filtrations, their graded Higgs fields and the Rees construction. This layer uses those objects and plans what is particular to rigid objects. Polarized complex variations of Hodge structure (their carrier, semisimplicity and uniqueness of the variation on an irreducible local system up to shift) belong to layer H.2; Schmid extension is a separate recorded gap; the Artinian unitary vanishing theorem of Landesman–Litt and the parabolic semistability bounds belong to layer H.4. Both are cited as prerequisites.

The sources are Esnault–Groechenig, *Rigid connections and F-isocrystals* (Acta Math. 2020) §§1–3, 4.2, 5.1, 6 and 8; Esnault–Groechenig, *Cohomologically rigid local systems and integrality* (2018); Klevdal–Patrikis, *G-rigid local systems are integral*; Landesman–Litt, *Canonical representations of surface groups* §§1.10, 4.3, 8 and 9.1, and *Geometric local systems on very general curves and isomonodromy* §§1.2 and 7; Simpson, *Higgs bundles and local systems* §4 and *The Hodge filtration on nonabelian cohomology* §§7, 9, 10; Langer, *Semistable modules over Lie algebroids in positive characteristic* §1; Langer–Simpson, *Rank 3 rigid representations of projective fundamental groups*; Brunebarbe–Klingler–Totaro, *Symmetric differentials and the fundamental group*. The register below gives the precise source locator behind each declaration in the language of this plan.

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

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 22 declarations were independently read at those commits. Baseline statements are reused, including the quasi-finite open subscheme; the roadmap plans the adapters and geometric consequences that are still missing.

- `mathlib:AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite` (lemma, `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean`): A proper, locally quasi-finite morphism (separated, finite type) is finite.
- `mathlib:AlgebraicGeometry.LocallyQuasiFinite` (class, `Mathlib/AlgebraicGeometry/Morphisms/QuasiFinite.lean`): Morphisms whose affine-local ring maps are quasi-finite; discrete finite fibres for quasi-compact morphisms.
- `mathlib:AlgebraicGeometry.Scheme.Hom.isOpen_quasiFiniteAt` (lemma, `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean`): If f is locally of finite type, {x | f.QuasiFiniteAt x} is open (consequence of Zariski's main theorem).
- `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteAt_iff_isOpen_singleton_asFiber` (lemma, `Mathlib/AlgebraicGeometry/Morphisms/QuasiFinite.lean`): For f locally of finite type, f is quasi-finite at x iff {x} is open in its fibre.
- `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteLocus` (def, `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean`): For f: X ⟶ Y locally of finite type, the open subscheme of points at which f is quasi-finite: Esnault–Groechenig's X^rig.
- `mathlib:AlgebraicGeometry.Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType` (lemma, `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean`): Equality descends to a later stage for two already given maps from one object of a cofiltered diagram of quasi-compact schemes with affine transition maps into a scheme locally of finite type over the base, when their composites with the limit projection agree. This declaration supplies equality only, not existence of a descended map or spreading of a family.
- `mathlib:LieAlgebra.SpecialLinear.sl` (def, `Mathlib/Algebra/Lie/Classical.lean`): The special linear Lie subalgebra of Matrix n n R: the kernel of the trace.
- `mathlib:LinearMap.isNilpotent_iff_charpoly` (lemma, `Mathlib/LinearAlgebra/Eigenspace/Zero.lean`): For a finite free module over a commutative integral domain, an endomorphism is nilpotent iff its characteristic polynomial is X^(finrank). The domain hypothesis is essential; the complex-field consumers satisfy it.
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

This is an accepted target-level planning pass with 73 nodes, 141 API items, 86 unit-test specifications and six planets. H.5 is planned, with thirteen explicit gaps and sixteen supplier requests. Every implementation status is unchecked. The six planets single out the main rigidity definitions, the variation theorem, the rigid Hodge splitting, nice models and integrality with its cohomological hypothesis.

The main chain runs from fixed-determinant deformation theory to rigid Higgs fields and variations, then to arithmetic models of the finite rigid loci. The integrality chain uses the prescribed-boundary tangent calculation and arithmetic companions. Geometric origin, low-rank unitary variations and versal rigidity are stated with their independent inputs. The API facts consumed along these chains have separate lemma nodes below; multi-part target theorems retain target granularity.

## H.5a. Rigidity and rigid loci

### Trace-free adjoint coefficients

`HodgeStructuresPartII:H.5/trace-free-adjoint` · definition · implementation unchecked

Let K be a field, Γ a group and G a split connected reductive group over K with derived group G^der and Lie algebra g^der. For a homomorphism ρ: Γ → G(K), the trace-free adjoint representation ad⁰ρ is the K-vector space g^der(K) on which γ ∈ Γ acts by Ad(ρ(γ)). For G = GL_r, g^der = sl_r(K) = {A ∈ M_r(K) : tr A = 0} and γ·A = ρ(γ) A ρ(γ)⁻¹; for G = PGL_r, ad⁰ρ is pgl_r(K) = M_r(K)/K·1 with the induced conjugation action, and sl_r(K) → pgl_r(K) is a Γ-equivariant isomorphism when r is invertible in K. For a flat bundle (E,∇) on a complex manifold the trace-free endomorphism bundle End⁰(E,∇) = ker(tr: End(E) → O) carries the induced flat connection; its local system of horizontal sections End⁰(V) has monodromy ad⁰ρ, where ρ is the monodromy of V = E^∇. For a Higgs bundle (E,θ) the trace-free endomorphisms carry the induced Higgs field [θ, −]. This is the coefficient object of every tangent space and every rigidity condition in this layer (the convention 'ad ρ' of Landesman–Litt and 'g^der' of Klevdal–Patrikis).

**Hypotheses.**

- K is a field; Γ is any group; ρ is a group homomorphism into G(K).
- The splitting End = End⁰ ⊕ (scalars) and the identification sl_r ≅ pgl_r require r to be invertible in K; neither is part of the definition.
- For the flat-bundle and Higgs versions, E is a vector bundle on a complex manifold (or smooth variety) X and the trace is the fibrewise matrix trace.

**Proof plan.**

- Define the action on sl_r(K) by conjugation through ρ; trace is conjugation invariant, so tr(ρ(γ)Aρ(γ)⁻¹) = tr A and sl_r(K) is Γ-stable.
- For general split reductive G use Ad: G → GL(g^der) composed with ρ (Klevdal–Patrikis Definition 1.1, Landesman–Litt Notation 1.10.2).
- For the flat bundle, the trace End(E) → O_X is horizontal for the induced connection on End(E) and the trivial connection d on O_X, so its kernel is a flat subbundle; at the base point x its fibre with monodromy is sl(E_x) with conjugation by ρ.

**Acceptance.**

- For r = 1 the representation is zero.
- Over a field where r is invertible, M_r(K) = sl_r(K) ⊕ K·1 as Γ-representations, so H¹(Γ, M_r(K)) = H¹(Γ, ad⁰ρ) ⊕ H¹(Γ, K).
- Matches Landesman–Litt's ad ρ for GL_r and PGL_r and Klevdal–Patrikis' g^der.

**Uses that determine the API.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, §7 p.148: H¹(X, End⁰(E,∇)) = 0 defines cohomological rigidity and is the Zariski tangent space of M_dR(X/C,L,r).
- Esnault–Groechenig, Cohomologically rigid local systems and integrality, §1 and Proposition 2.3: H¹(U, a_* End⁰(V)) is the tangent space of the moduli stack with prescribed determinant and local monodromies.
- Landesman–Litt, Canonical representations of surface groups, Notation 1.10.2 and Definition 8.1.1: ad ρ := Ad ∘ ρ on g^der is the coefficient system of (strong) cohomological rigidity for GL_r- and PGL_r-local systems.
- Klevdal–Patrikis, G-rigid local systems are integral, Definition 1.1 and Proposition 4.6: g^der with the adjoint action is the coefficient module of G-cohomological rigidity and of the tangent space.
- HodgeStructuresPartII:H.5/betti-tangent, HodgeStructuresPartII:H.5/cohomological-rigidity, HodgeStructuresPartII:H.5/versal-unitary-rigidity: Tangent spaces, rigidity predicates and the Leray vanishing argument are all stated with these coefficients.

**API.**

- `TraceFreeAdjoint.rep` (constructor): For ρ: Γ → GL_r(K), the K-linear representation of Γ on sl_r(K), γ ↦ (A ↦ ρ(γ)Aρ(γ)⁻¹).
- `TraceFreeAdjoint.rep_apply` (simp): rep ρ γ A = ρ(γ) * A * ρ(γ)⁻¹ as matrices.
- `TraceFreeAdjoint.endSplitting` (equivalence): If (r : K) ≠ 0, the Γ-representation M_r(K) by conjugation is isomorphic to rep ρ ⊕ (trivial K), via A ↦ (A − (tr A / r)·1, tr A / r). Supplied by `HodgeStructuresPartII:H.5/trace-splitting`.
- `TraceFreeAdjoint.conjEquiv` (functoriality): If σ = P ρ P⁻¹ for P ∈ GL_r(K), then A ↦ PAP⁻¹ is an isomorphism rep ρ ≅ rep σ.
- `TraceFreeAdjoint.twist` (relation): For a character χ: Γ → K^×, rep (χ·ρ) = rep ρ (scalars commute with all matrices).
- `TraceFreeAdjoint.projectivization` (compatibility): rep ρ depends only on the composite Γ → PGL_r(K) and, when r ∈ K^×, agrees with the adjoint representation on Lie(PGL_r) = pgl_r(K). Supplied by `HodgeStructuresPartII:H.5/adjoint-projectivization`.
- `TraceFreeAdjoint.invariants_eq_bot` (characterisation): If ρ is absolutely irreducible and r ∈ K^×, then the Γ-invariants of rep ρ are zero (Schur's lemma: commuting matrices are scalars, and the only trace-zero scalar is 0). Supplied by `HodgeStructuresPartII:H.5/adjoint-no-invariants`.
- `TraceFreeAdjoint.baseChange` (compatibility): For a field embedding σ: K → L, rep (σ ∘ ρ) ≅ (rep ρ) ⊗_{K,σ} L, compatibly with the matrix entries. Supplied by `HodgeStructuresPartII:H.5/adjoint-base-change`.
- `TraceFreeAdjoint.baseChange_H1` (compatibility): For finitely generated Γ and a field embedding σ: K → L, H¹(Γ, rep(σ∘ρ)) ≅ H¹(Γ, rep ρ) ⊗_{K,σ} L, in particular the dimensions agree (the cocycle space is cut out by K-linear equations in finitely many generator values). Supplied by `HodgeStructuresPartII:H.5/adjoint-h1-base-change`.
- `TraceFreeAdjoint.flatBundle` (compatibility): For a flat bundle (E,∇) on a connected complex manifold with monodromy ρ at x, the local system of horizontal sections of End⁰(E,∇) has monodromy representation rep ρ, under TauCeti.LocalCoefficientSystem.monodromyRepresentation.

**Unit tests.**

- `TraceFreeAdjoint.test_rank_one` (degenerate): For r = 1 and any character ρ: Γ → GL_1(K), ad⁰ρ = 0, hence H¹(Γ, ad⁰ρ) = 0.
- `TraceFreeAdjoint.test_trivial_free_abelian` (computation): For Γ = ℤ², K = ℂ and ρ trivial of rank r, H¹(Γ, ad⁰ρ) = Hom(ℤ², sl_r(ℂ)) has dimension 2(r² − 1).
- `TraceFreeAdjoint.test_full_adjoint_differs` (non-example): For Γ = ℤ and ρ the trivial character of rank 1, H¹(Γ, M_1(ℂ)) = ℂ ≠ 0 while H¹(Γ, ad⁰ρ) = 0: using End in place of End⁰ would make every rank-one local system on a circle non-rigid.
- `TraceFreeAdjoint.test_char_two_no_splitting` (non-example): Over K = 𝔽₂ and r = 2, the identity matrix has trace 0, so 1 ∈ sl_2(𝔽₂) and M_2(𝔽₂) ≠ sl_2(𝔽₂) ⊕ 𝔽₂·1: the trace splitting is not unconditional.
- `TraceFreeAdjoint.test_irreducible_no_invariants` (characterisation): For the irreducible two-dimensional complex representation ρ of the symmetric group S₃, the invariants (ad⁰ρ)^{S₃} are zero.

**Direct prerequisites.**

- `mathlib:LieAlgebra.SpecialLinear.sl`
- `mathlib:Matrix.trace`
- `mathlib:Representation`
- `mathlib:Representation.IsIrreducible`
- `mathlib:groupCohomology.H1`
- `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`
- `HodgeStructuresPartII:H.0/twisted-higgs`

**Sources.**

- LL24, §1.10, Notation 1.10.2, p.11: Pins ad ρ as Ad∘ρ on g^der, which for GL_r and PGL_r is the trace-free (pgl_r) coefficient system.
- EG20, §7, p.148: The trace-free endomorphisms End⁰(E,∇) are the coefficients of cohomological rigidity on the fixed-determinant moduli.
- KP20, §1, Definition 1.1, p.2: General reductive G: the coefficient module is g^der with Ad∘ρ.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/TraceFreeAdjoint`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `TraceFreeAdjoint.rep`, `TraceFreeAdjoint.rep_apply`, `TraceFreeAdjoint.endSplitting`, `TraceFreeAdjoint.conjEquiv`, `TraceFreeAdjoint.twist`, `TraceFreeAdjoint.projectivization`, `TraceFreeAdjoint.invariants_eq_bot`, `TraceFreeAdjoint.baseChange_apply`, `TraceFreeAdjoint.baseChange_H1`, `TraceFreeAdjoint.test_rank_one`, `TraceFreeAdjoint.test_trivial_free_abelian`, `TraceFreeAdjoint.test_full_adjoint_differs`, `TraceFreeAdjoint.test_char_two_no_splitting`, `TraceFreeAdjoint.test_irreducible_no_invariants`. Omitted: `TraceFreeAdjoint.flatBundle`, `TraceFreeAdjoint.baseChange`.

### Tangent spaces of representation moduli with fixed boundary data

`HodgeStructuresPartII:H.5/betti-tangent` · theorem · implementation unchecked

Let K be a field of characteristic zero, Γ a finitely generated group, G a split connected reductive group over K with maximal abelian quotient A, θ: Γ → A(K) a homomorphism, γ_1,…,γ_N ∈ Γ and K_1,…,K_N ⊂ G locally closed conjugacy classes defined over K. Let M = M(Γ, θ, (γ_i, K_i)) be the finite-type stack of G-irreducible representations with abelianization θ and ρ(γ_i) ∈ K_i (HodgeStructuresPartII:H.5/prescribed-monodromy-moduli). For a G-irreducible ρ₀: Γ → G(K) in M(K), the Zariski tangent space of M at [ρ₀] is the kernel of the restriction map H¹(Γ, g^der) → ⊕_{i=1}^{N} H¹(γ_i^ℤ, g^der), with coefficients ad⁰ρ₀. In particular, for G = GL_r, θ = δ the determinant and N = 0: the representation scheme R_B(Γ, r, δ) has tangent space Z¹(Γ, ad⁰ρ) at ρ, and for absolutely irreducible ρ the stable fixed-determinant Betti moduli has Zariski tangent space H¹(Γ, ad⁰ρ) at [ρ]; for K = ℂ and Γ finitely presented this is the coarse space M_B^s(Γ, r, δ) of HodgeStructuresPartII:H.1/betti-coarse, and for other K (a number field in the integrality applications) the moduli is the K-form constructed in HodgeStructuresPartII:H.5/prescribed-monodromy-moduli. Since the automorphism group of a stable fixed-determinant object is the finite étale group μ_r in characteristic zero, the stack and its coarse space have the same tangent spaces at stable points.

**Hypotheses.**

- Γ is finitely generated (the representation scheme is then of finite type; finite presentation is not needed for the tangent-space computation).
- K has characteristic zero, so μ_r is étale and the trace splitting holds.
- ρ₀ is G-irreducible (for GL_r: absolutely irreducible); at reducible points the coarse tangent space is not H¹.

**Proof plan.**

- A K[ε]-point of R_B(Γ, r, δ) lifting ρ is γ ↦ (1 + εc(γ))ρ(γ); the homomorphism property is the cocycle identity c(γγ′) = c(γ) + ρ(γ)c(γ′)ρ(γ)⁻¹, and det = δ forces tr c(γ) = 0 (Klevdal–Patrikis Proposition 4.6 proof).
- Conjugation by 1 + εX changes c by the coboundary γ ↦ X − ρ(γ)Xρ(γ)⁻¹, so the tangent space to the orbit is B¹(Γ, ad⁰ρ); scalars act trivially, so the trace part of X is irrelevant.
- At an absolutely irreducible ρ the projective linear group acts freely on R_B^s and R_B^s → M_B^s is a principal PGL_r-bundle for the étale topology (HodgeStructuresPartII:H.1/betti-coarse, HodgeStructuresPartII:H.1/stable-automorphisms; Luna's étale slice, requested from AlgebraicModuliForArithmeticGeometry:R09.5); hence T_[ρ] M_B^s = Z¹/B¹ = H¹(Γ, ad⁰ρ).
- The condition ρ(γ_i) ∈ K_i: the tangent space of K_i at ρ(γ_i) is {[X, ρ(γ_i)]}, so a first-order deformation stays in K_i exactly when the restricted cocycle c|_{γ_i^ℤ} is a coboundary; this gives the kernel of restriction (Klevdal–Patrikis Proposition 4.6).

**Acceptance.**

- For Γ free of rank 2, r = 2 and δ = 1, dim H¹(Γ, ad⁰ρ) = 2·3 − 3 = 3 at every absolutely irreducible ρ, matching dim M_B^s(F_2, 2, 1) = 3.
- For finite Γ the tangent space is zero at every irreducible ρ, since H¹ of a finite group with coefficients in a characteristic-zero vector space vanishes.
- For N = 0 the statement reduces to H¹(Γ, ad⁰ρ) computed by Mathlib's groupCohomology.H1 of the trace-free adjoint representation.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/trace-free-adjoint`
- `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`
- `HodgeStructuresPartII:H.1/betti-framed`
- `HodgeStructuresPartII:H.1/betti-coarse`
- `HodgeStructuresPartII:H.1/stable-automorphisms`
- `mathlib:groupCohomology.H1`
- `AlgebraicModuliForArithmeticGeometry:R09.5`

**Sources.**

- KP20, §4, Proposition 4.6, pp.8–9: Tangent space of the moduli of G-irreducible representations with prescribed classes is the kernel of restriction on H¹(Γ, g^der).
- EG18, §2, Proposition 2.3, p.5: The GL_r case with prescribed local monodromy, in topological form.
- EG20, §7, p.148: Projective case: the trace-free H¹ is the tangent space of the fixed-determinant moduli.

**Suggested signature coverage.** omitted. Omitted: `tangentSpace_eq_H1`.

### Rigid representations with fixed determinant

`HodgeStructuresPartII:H.5/rigid-representation` · definition · implementation unchecked

Let Γ be a finitely generated group, r ≥ 1 and δ: Γ → ℂ^× a character. An absolutely irreducible representation ρ: Γ → GL_r(ℂ) with det ρ = δ is rigid if its class [ρ] is an isolated point of the stable fixed-determinant Betti moduli M_B^s(Γ, r, δ) (HodgeStructuresPartII:H.1/betti-coarse); for a finite-type complex scheme, isolation in the Zariski and in the analytic topology agree. Equivalently, the GL_r(ℂ)-conjugation orbit of ρ is open in R_B(Γ, r, δ)(ℂ) for the analytic topology: this is the fixed-determinant analogue of Simpson's orbit condition, which Simpson states in Hom(π₁, G) and which for G = SL_r and δ = 1 is literally this one. With boundary data (Γ = π₁(X) for a smooth quasi-projective X and local monodromy classes K_i, HodgeStructuresPartII:H.5/boundary-monodromy-data) rigid means isolated in the moduli M(Γ, r, δ, (γ_i, K_i)) of HodgeStructuresPartII:H.5/prescribed-monodromy-moduli; for a split reductive G, a G-irreducible ρ with fixed abelianization is rigid if it is isolated in the corresponding G-moduli. An isolated point is not assumed to be reduced. Isolation in the moduli M_B(Γ, GL_r) without fixed determinant is a different, stronger condition and is never what 'rigid' means here.

**Hypotheses.**

- Γ finitely generated; r ≥ 1; δ is the fixed determinant character (finite order in every application of this layer).
- ρ absolutely irreducible (for G: G-irreducible, image in no proper parabolic subgroup).
- The ambient moduli is the fixed-determinant (fixed-abelianization) one; prescribed boundary classes are part of the data when present.

**Proof plan.**

- Define IsRigid ρ as isolation of the point [ρ] in M_B^s(Γ, r, δ)(ℂ); the analytic and Zariski notions agree because a finite-type ℂ-scheme has finitely many irreducible components, and a point is isolated in either topology exactly when it is an irreducible component.
- Simpson's orbit formulation: R_B^s → M_B^s is a geometric quotient whose fibres are the conjugation orbits and which is open (a principal PGL_r-bundle); so [ρ] is isolated iff the orbit, the preimage of [ρ], is open in R_B^s(ℂ), which is open in R_B(ℂ).
- The boundary and G-versions use the stacks of HodgeStructuresPartII:H.5/prescribed-monodromy-moduli and their coarse spaces in the same way.

**Acceptance.**

- Every character (r = 1) is rigid in the fixed-determinant sense.
- No absolutely irreducible ρ: F_2 → GL_2(ℂ) with δ = 1 is rigid.
- Rigidity is invariant under conjugation and under replacing ρ by an isomorphic representation.

**Uses that determine the API.**

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
- `IsRigidRepresentation.test_reducible_excluded` (non-example): The trivial rank-two representation of the trivial group over ℂ is reducible and is excluded from rigidity, although its point in the semistable quotient is isolated. This tests the stable/irreducible condition rather than isolation alone.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.1/betti-stable-representation`
- `HodgeStructuresPartII:H.1/betti-framed`
- `HodgeStructuresPartII:H.1/betti-coarse`
- `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`

**Sources.**

- S92, §4, Rigid representations, p.51: Simpson's orbit condition, of which the fixed-determinant condition here is the analogue.
- EG20, §1, Definition 1.1, p.104: Rigidity is isolation in the fixed-determinant moduli.
- EG18, §2, Remark 2.2, p.5: Rigid local systems with prescribed boundary data are isolated points of the prescribed-monodromy moduli.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Representation`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `IsRigidRepresentation`, `IsRigidRepresentation.conj`, `IsRigidRepresentation.twist`, `IsRigidRepresentation.of_cohomologicallyRigid`, `IsRigidRepresentation.rankOne`, `IsRigidRepresentation.test_rank_one`, `IsRigidRepresentation.test_free_group`, `IsRigidRepresentation.test_unfixed_determinant`, `IsRigidRepresentation.test_finite_group`, `IsRigidRepresentation.test_reducible_excluded`. Omitted: `IsRigidRepresentation.iff_orbit_open`, `IsRigidRepresentation.finite`.

### Absolute irreducibility and rigidity of projective representations

`HodgeStructuresPartII:H.5/projective-rigidity` · definition · implementation unchecked

Let A be a field and Γ a group. A representation Γ → GL_r(A) is absolutely irreducible if Γ → GL_r(A) → GL_r(Ω) is irreducible for an algebraically closed field Ω ⊃ A (equivalently for every such Ω). A projective representation ρ̄: Γ → PGL_r(A) is absolutely irreducible if for every embedding of A into an algebraically closed field Ω the composite Γ → PGL_r(Ω) leaves no proper nonzero linear subspace of Ω^r invariant (no invariant proper projective linear subspace). For Γ finitely generated, M_B(Γ, PGL_r) is the affine GIT quotient of the finite-type ℤ-scheme Hom(Γ, PGL_r) by conjugation, a coarse moduli scheme of finite type over ℤ; an absolutely irreducible ρ̄: Γ → PGL_r(Ω) is rigid if its point is isolated in the fibre M_B(Γ, PGL_r)_Ω.

**Hypotheses.**

- Γ finitely generated for the moduli statement; A any field.
- The GIT quotient over ℤ is the reductive-group quotient of an affine scheme of finite type (Seshadri's theorem over a universally Japanese base), requested from AlgebraicModuliForArithmeticGeometry:R09.5.

**Proof plan.**

- Absolute irreducibility is independent of the algebraically closed Ω because invariant subspaces are cut out by a constructible condition defined over A (irreducibility over Ω is irreducibility of the module over Ω[Γ]).
- Hom(Γ, PGL_r) is a closed subscheme of PGL_r^n for n generators, hence affine of finite type over ℤ; PGL_r acts by conjugation and the GIT quotient exists over ℤ.
- For algebraically closed K of characteristic zero and finitely generated Γ, fixed-determinant lifts of one projective representation differ by characters Γ → μ_r(K). There are finitely many such characters. Thus the induced map on irreducible conjugacy classes has finite fibres. A connected family whose projective class is constant cannot move between these finitely many fixed-determinant classes; isolation of the projective class implies isolation of a lift.
- For the reverse direction, test a nonconstant projective deformation on a complete discrete valuation ring with residue field K, after a finite ramified base change if necessary. Lift each generator matrix from PGL_r(R) to GL_r(R), using Pic(R)=0, and correct its determinant to the fixed value using an r-th root of a unit congruent to 1. These roots exist by Hensel lifting because r is invertible and R is complete. Each relation then evaluates in μ_r(R); this group reduces isomorphically to μ_r(K), and the residual relation is the identity. The lifted matrices therefore satisfy every relation and give a fixed-determinant GL_r deformation. If the lift were constant up to conjugacy, so would be its projectivization.
- The trace calculation in EG20 Lemma 5.5 does not force a scalar twisting character to be trivial: traces can vanish. Finiteness of the twisting characters is sufficient for the comparison. See source issue HodgeStructuresPartII/E-H5-7.

**Acceptance.**

- For r = 1, M_B(Γ, PGL_1) is a point and every projective representation is rigid.
- ρ and χ·ρ have the same projectivization for every character χ.
- The comparison with fixed-determinant rigidity holds for every irreducible ρ over an algebraically closed field of characteristic zero; no finiteness of the determinant is needed.

**Uses that determine the API.**

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
- `ProjectiveRepresentation.test_nontrivial_self_twist` (non-example): For Q₈, let A=diag(i,−i), B=[[0,1],[−1,0]] in SL₂(ℂ), and let χ(A)=1, χ(B)=−1. The irreducible representation generated by A and B is conjugate by A to χ·ρ, while χ is nontrivial and χ²=1. All traces agree, so trace equality cannot imply χ=1.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.1/betti-framed`
- `HodgeStructuresPartII:H.1/betti-coarse`
- `mathlib:Representation.IsIrreducible`
- `AlgebraicModuliForArithmeticGeometry:R09.5`
- `HodgeStructuresPartII:H.5/rigid-representation`
- `HodgeStructuresPartII:H.5/adjoint-projectivization`

**Sources.**

- EG20, §5, Definition 5.1, p.138: Definition of absolute irreducibility.
- EG20, §5, Definition 5.1(c), p.138: The PGL_r character scheme over ℤ and rigidity as isolation.
- EG20, §5, proof of Lemma 5.5, p.140: Lifting projective deformations with fixed determinant: rigidity of ρ and of ρ_proj agree.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Projective`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `IsAbsolutelyIrreducible`, `IsAbsolutelyIrreducible.iff_algebraicClosure`, `ProjectiveRepresentation.test_rotation_not_absolutely_irreducible`. Omitted: `ProjectiveRepresentation.IsAbsolutelyIrreducible`, `ProjectiveBettiModuli`, `ProjectiveRepresentation.IsRigid`, `ProjectiveRepresentation.isRigid_iff_fixedDet`, `ProjectiveRepresentation.liftObstruction`, `ProjectiveRepresentation.test_rank_one`, `ProjectiveRepresentation.test_twist_same_class`, `ProjectiveRepresentation.test_fixedDet_comparison`, `ProjectiveRepresentation.test_nontrivial_self_twist`.

### Cohomological rigidity

`HodgeStructuresPartII:H.5/cohomological-rigidity` · definition · implementation unchecked

Let X be a smooth connected quasi-projective complex variety, j: X → X̄ a good compactification with strict normal crossings boundary D = D_1 ∪ … ∪ D_N, U = X̄ ∖ D_sing and a: X → U the inclusion (HodgeStructuresPartII:H.5/boundary-monodromy-data). Let G be a split connected reductive group over ℂ and ρ: π₁(X, x) → G(ℂ) a representation. ρ is cohomologically rigid if H¹(U, a_* g^der) = 0, where g^der is the local system of ad⁰ρ (HodgeStructuresPartII:H.5/trace-free-adjoint); equivalently the kernel of H¹(π₁(X,x), ad⁰ρ) → ⊕_i H¹(⟨T_i⟩, ad⁰ρ) vanishes, where T_i are local monodromy loops; equivalently H¹(X̄, j_{!*} g^der) = 0 (HodgeStructuresPartII:H.5/intermediate-extension-h1). A local system or flat bundle is cohomologically rigid if its monodromy is. When X is projective (D = ∅) the condition is H¹(X, End⁰(V)) = H¹(π₁(X,x), ad⁰ρ) = 0 and, for the corresponding algebraic flat connection, H¹_dR(X, End⁰(E,∇)) = 0. The predicate is relative to the chosen good compactification; strong cohomological rigidity implies it for every good compactification (HodgeStructuresPartII:H.5/strong-implies-cohomological), and for X projective there is no choice.

**Hypotheses.**

- X smooth connected quasi-projective over ℂ with a chosen good compactification; G split connected reductive (GL_r in Esnault–Groechenig, general in Klevdal–Patrikis and Landesman–Litt).
- The predicate is purely cohomological. Quasi-unipotent local monodromy is a separate hypothesis of the consumers, as in Klevdal–Patrikis (Definition 1.1 lists it separately; Theorem 1.2 assumes it) and Esnault–Groechenig's Theorem 1.1; Landesman–Litt build it into their Definition 8.1.1.
- Coefficients are trace-free (g^der), never the full adjoint: with End(V) the condition would include H¹(X, ℂ) = 0.

**Proof plan.**

- Define the predicate by vanishing of H¹(U, a_* ad⁰ρ), the tangent space of the prescribed-monodromy moduli (HodgeStructuresPartII:H.5/prescribed-monodromy-tangent).
- Group-theoretic form: the tangent-space theorem identifies H¹(U, a_* ad⁰ρ) with ker(H¹(π₁, ad⁰ρ) → ⊕ H¹(⟨T_i⟩, ad⁰ρ)), which uses Mathlib's group cohomology and makes sense for any finitely generated group with chosen elements.
- The loops T_i and hence the predicate are attached to the chosen good compactification; the sources state every result for a given good compactification, and no independence of the compactification is asserted here.
- Projective case: U = X̄ = X and a = id.

**Acceptance.**

- Every rank-one local system is cohomologically rigid.
- On a compact curve of genus g ≥ 2 no irreducible local system of rank r ≥ 2 is cohomologically rigid: dim H¹(X, End⁰V) = (2g − 2)(r² − 1).
- On ℙ¹ ∖ {0, 1, ∞}, an irreducible rank-two local system whose three local monodromies are non-scalar is cohomologically rigid.

**Uses that determine the API.**

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
- `IsCohomologicallyRigid.test_hypergeometric` (computation): On X = ℙ¹ ∖ {0, 1, ∞} with X̄ = ℙ¹, let V be irreducible of rank 2 with non-scalar local monodromies at 0, 1, ∞; then dim H¹(ℙ¹, j_* End⁰V) = −χ(X)·3 − Σ_i dim (sl_2)^{T_i} = 3 − 3 = 0.
- `IsCohomologicallyRigid.test_not_strong` (non-example): For the same hypergeometric V, H¹(X, End⁰V) has dimension −χ(X)·3 = 3, so V is cohomologically rigid but not strongly cohomologically rigid.
- `IsCohomologicallyRigid.test_projective_groupCohomology` (compatibility): If X is projective, IsCohomologicallyRigid ρ ↔ H¹(π₁(X,x), ad⁰ρ) = 0, the latter computed by Mathlib's groupCohomology.H1 of the trace-free adjoint representation.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/trace-free-adjoint`
- `HodgeStructuresPartII:H.5/boundary-monodromy-data`
- `HodgeStructuresPartII:H.5/prescribed-monodromy-tangent`
- `HodgeStructuresPartII:H.5/intermediate-extension-h1`
- `mathlib:groupCohomology.H1`
- `HodgeStructuresPartII:H.5/trace-splitting`
- `HodgeStructuresPartII:H.5/adjoint-h1-base-change`

**Sources.**

- EG18, §1, p.1: Definition in the quasi-projective case with trace-free coefficients.
- LL24, §8.1, Definition 8.1.1, p.38: Landesman–Litt's definition with ad ρ for reductive G and quasi-unipotent monodromy at infinity.
- EG20, §7, p.148: Projective case for flat connections; the trace-free form is the correct one (see source issue HodgeStructuresPartII/E-H5-3).

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Cohomological`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `IsCohomologicallyRigid`, `IsCohomologicallyRigid.of_strong`, `IsCohomologicallyRigid.projective_iff`, `IsCohomologicallyRigid.conj_aut`, `IsCohomologicallyRigid.test_rank_one`, `IsCohomologicallyRigid.test_hypergeometric`, `IsCohomologicallyRigid.test_not_strong`, `IsCohomologicallyRigid.test_projective_groupCohomology`. Omitted: `IsCohomologicallyRigid.iff_tangent_eq_bot`, `IsCohomologicallyRigid.isRigid`, `IsCohomologicallyRigid.deRham_iff`, `IsCohomologicallyRigid.intermediateExtension_iff`, `IsCohomologicallyRigid.test_compact_curve_genus_two`.

### Strong cohomological rigidity

`HodgeStructuresPartII:H.5/strong-cohomological-rigidity` · definition · implementation unchecked

In the setting of HodgeStructuresPartII:H.5/cohomological-rigidity, ρ: π₁(X, x) → G(ℂ) is strongly cohomologically rigid if H¹(X, g^der) = 0 for the local system g^der of ad⁰ρ on X itself, equivalently H¹(π₁(X, x), ad⁰ρ) = 0. No boundary condition and no compactification enter. On a projective X it coincides with cohomological rigidity; in general it is stronger, and strictly stronger for instance for the hypergeometric local systems on ℙ¹ ∖ {0,1,∞}.

**Hypotheses.**

- X smooth connected complex variety; ρ any representation into a split connected reductive G (quasi-unipotence is not needed for the definition).
- Coefficients are trace-free.

**Proof plan.**

- Define the predicate as vanishing of H¹(π₁(X,x), ad⁰ρ) = H¹(X, ad⁰ρ) (degree-one cohomology of a local system on a path-connected, locally simply connected space is group cohomology of π₁).
- Comparison with cohomological rigidity is HodgeStructuresPartII:H.5/strong-implies-cohomological.

**Acceptance.**

- Equal to cohomological rigidity when X is projective.
- Hypergeometric local systems on ℙ¹ ∖ {0,1,∞} are cohomologically but not strongly cohomologically rigid.
- Landesman–Litt's versal-family local systems of low rank with irreducible unitary fibres are strongly cohomologically rigid (HodgeStructuresPartII:H.5/versal-unitary-rigidity).

**Uses that determine the API.**

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

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/trace-free-adjoint`
- `mathlib:groupCohomology.H1`
- `HodgeStructuresPartII:H.5/trace-splitting`

**Sources.**

- LL24, §8.1, Definition 8.1.4, p.39: Definition of strong cohomological rigidity.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Cohomological`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** native. Native: `IsStronglyCohomologicallyRigid`, `IsStronglyCohomologicallyRigid.isCohomologicallyRigid`, `IsStronglyCohomologicallyRigid.of_finiteCover`, `IsStronglyCohomologicallyRigid.conj_aut`, `IsStronglyCohomologicallyRigid.of_groupCohomology`, `IsStronglyCohomologicallyRigid.test_projective`, `IsStronglyCohomologicallyRigid.test_rank_one`, `IsStronglyCohomologicallyRigid.test_hypergeometric`, `IsStronglyCohomologicallyRigid.test_free_group`.

### Cohomologically rigid points are reduced isolated points

`HodgeStructuresPartII:H.5/coh-rigid-reduced-isolated` · theorem · implementation unchecked

In the setting of HodgeStructuresPartII:H.5/prescribed-monodromy-moduli with G = GL_r and fixed determinant (in particular for the fixed-determinant moduli of a smooth projective X), an irreducible ρ is cohomologically rigid if and only if its point is an isolated reduced point of the coarse moduli, i.e. the local ring of the coarse moduli at [ρ] is the residue field. For a general split reductive G and G-irreducible ρ, cohomological rigidity implies that [ρ] is a reduced isolated point of the coarse moduli; the converse is asserted only for the stack, since a nontrivial finite stabiliser Z_G(ρ)/Z(G) can make the coarse local ring reduced while H¹ ≠ 0. In particular cohomological rigidity implies rigidity. Rigidity alone allows a non-reduced isolated point.

**Hypotheses.**

- Characteristic zero coefficients; ρ G-irreducible with the prescribed boundary data.
- The moduli is of finite type, so its local rings are Noetherian.

**Proof plan.**

- Use the prescribed-boundary tangent calculation on the moduli stack. For GL_r, irreducibility makes the stabilizer the scalar μ_r with trivial adjoint action, so this calculation also identifies the tangent space of the stable coarse space. For a general reductive group use the stack tangent statement, retaining any additional hypothesis on its centralizer.
- For a Noetherian local ring (O, m) with residue field K: m/m² = 0 implies m = 0 by Nakayama's lemma, so O = K is reduced of dimension zero; conversely O = K has zero tangent space. For GL_r with fixed determinant the coarse space is the μ_r-rigidification and μ_r acts trivially on deformations, so stack and coarse tangent spaces agree.
- General G: the coarse space is étale locally Spec(R^S) for the local ring R of the stack and the finite stabiliser S; R = K forces R^S = K, which gives the forward implication only.
- Hence vanishing of H¹ is equivalent to [ρ] being an isolated reduced point. The reduced-isolated coarse-space equivalence is used only in the GL_r/scalar-stabilizer setting; the general G implication is the stack statement with its stated hypotheses.

**Acceptance.**

- For r = 1 every point is reduced and isolated.
- A rigid point whose local ring is ℂ[ε]/(ε²) has one-dimensional tangent space and is not cohomologically rigid; the definitions of this layer keep such points in the rigid locus.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/cohomological-rigidity`
- `HodgeStructuresPartII:H.5/rigid-representation`
- `HodgeStructuresPartII:H.5/prescribed-monodromy-tangent`
- `HodgeStructuresPartII:H.5/betti-tangent`

**Sources.**

- EG18, §1, p.1: Cohomological rigidity is rigidity plus smoothness (reducedness) of the isolated point.
- EG20, §1, p.106: Equivalent formulation as reduced isolated point.

**Suggested signature coverage.** omitted. Omitted: `isCohomologicallyRigid_iff_reduced_isolated`.

### Strong cohomological rigidity implies cohomological rigidity

`HodgeStructuresPartII:H.5/strong-implies-cohomological` · theorem · implementation unchecked

In the setting of HodgeStructuresPartII:H.5/cohomological-rigidity, if H¹(X, ad⁰ρ) = 0 then H¹(U, a_* ad⁰ρ) = 0 (= H¹(X̄, j_{!*} ad⁰ρ)), i.e. strongly cohomologically rigid representations with quasi-unipotent local monodromy are cohomologically rigid.

**Hypotheses.**

- X smooth connected quasi-projective with good compactification; ρ with quasi-unipotent local monodromy (so that cohomological rigidity is defined).

**Proof plan.**

- Group-theoretic proof: by HodgeStructuresPartII:H.5/prescribed-monodromy-tangent, H¹(U, a_* ad⁰ρ) is the kernel of restriction H¹(π₁, ad⁰ρ) → ⊕ H¹(⟨T_i⟩, ad⁰ρ), a subspace of H¹(π₁, ad⁰ρ) = 0.
- Topological proof (Landesman–Litt Lemma 8.1.3): the Leray spectral sequence for a gives the injection H¹(U, a_* ad⁰ρ) ↪ H¹(X, ad⁰ρ); combined with H¹(X̄, j_{!*}) ≅ H¹(U, a_*) (HodgeStructuresPartII:H.5/intermediate-extension-h1).

**Acceptance.**

- Applies to every strongly cohomologically rigid local system on a versal family (Landesman–Litt Proposition 8.2.1).
- The converse fails for the hypergeometric local systems on ℙ¹ ∖ {0,1,∞}.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/cohomological-rigidity`
- `HodgeStructuresPartII:H.5/strong-cohomological-rigidity`
- `HodgeStructuresPartII:H.5/prescribed-monodromy-tangent`
- `HodgeStructuresPartII:H.5/intermediate-extension-h1`

**Sources.**

- LL24, §8.1, Lemma 8.1.3, p.39: The Leray injection proves the implication.

**Suggested signature coverage.** native. Native: `IsStronglyCohomologicallyRigid.isCohomologicallyRigid`.

### Rigid flat connections and rigid Higgs bundles

`HodgeStructuresPartII:H.5/rigid-connection` · definition · implementation unchecked

Let X be a smooth connected projective complex variety with a polarization, L a torsion line bundle of order d with its canonical flat connection ∇_L and Higgs field 0 (HodgeStructuresPartII:H.1/torsion-determinant-dictionary), and r ≥ 1. (a) A stable (equivalently irreducible) algebraic flat connection (E,∇) of rank r with det(E,∇) ≅ (L,∇_L) is rigid if [(E,∇)] is an isolated point of M_dR^s(X, r, L) (HodgeStructuresPartII:H.1/derham-coarse); the isolated point need not be reduced. (b) A slope-stable Higgs bundle (V,θ) of rank r with all rational Chern classes zero, det V ≅ L and tr θ = 0 is a rigid stable Higgs bundle if [(V,θ)] is an isolated point of M_Dol^s(X, (L,0), r) (HodgeStructuresPartII:H.1/dolbeault-coarse). (c) Both are cohomologically rigid if the point is moreover reduced; for (a) this is H¹_dR(X, End⁰(E,∇)) = 0, for (b) the vanishing of the first hypercohomology of the trace-free Higgs complex End⁰(V) → End⁰(V) ⊗ Ω¹ → ⋯ with differential [θ, −]. The determinant is fixed as a flat (respectively Higgs) line bundle, not only as a line bundle.

**Hypotheses.**

- X smooth connected projective over ℂ with an ample class; L torsion with its canonical flat structure.
- Stability: for flat connections in characteristic zero stability is irreducibility; for Higgs bundles slope stability on the vanishing-Chern-class component.
- Rigidity is isolation in the fixed-determinant moduli, possibly at a non-reduced point (Esnault–Groechenig §3.1).

**Proof plan.**

- The moduli spaces are the stable fixed-determinant fibres of HodgeStructuresPartII:H.1/derham-coarse and HodgeStructuresPartII:H.1/dolbeault-coarse; define the predicates as isolation of the moduli point there.
- The tangent-space description of (c) is HodgeStructuresPartII:H.5/derham-betti-tangent.

**Acceptance.**

- Every rank-one object (L,∇_L) or (L,0) is rigid.
- On a compact curve of genus g ≥ 2 there is no rigid object of rank r ≥ 2: the stable moduli are smooth of dimension 2(g − 1)(r² − 1) > 0.
- Fixing only the underlying line bundle of the determinant gives a different moduli problem.

**Uses that determine the API.**

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

**Direct prerequisites.**

- `HodgeStructuresPartII:H.1/derham-coarse`
- `HodgeStructuresPartII:H.1/dolbeault-coarse`
- `HodgeStructuresPartII:H.1/torsion-determinant-dictionary`
- `HodgeStructuresPartII:H.1/stability`
- `HodgeStructuresPartII:H.5/trace-free-adjoint`
- `HodgeStructuresPartII:H.5/rigid-representation`

**Sources.**

- EG20, §1, Remark 1.2, p.104: Rigid connections are stable flat connections isolated in the fixed-determinant moduli.
- EG20, §2.1, p.109: Definition of rigid stable Higgs bundles.
- EG20, §3.1, p.121: Rigidity allows non-reduced isolated points.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Connection`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `IsRigidConnection`, `IsRigidHiggs`, `IsRigidConnection.iff_monodromy`, `IsRigidConnection.iff_higgs`, `IsRigidConnection.dual`, `IsRigidConnection.tensor_torsion`, `IsRigidHiggs.scale`, `IsCohomologicallyRigidConnection.iff_tangent`, `IsRigidConnection.test_rank_one`, `IsRigidConnection.test_genus_two_curve`, `IsRigidConnection.test_flat_determinant_needed`, `IsRigidHiggs.test_trace_condition`, `IsRigidHiggs.test_projective_space`.

### Trace-free tangent spaces on the three sides

`HodgeStructuresPartII:H.5/derham-betti-tangent` · comparison · implementation unchecked

Let X be smooth connected projective over ℂ, (E,∇) a stable flat connection with determinant (L,∇_L), monodromy ρ at x, and (V,θ) the corresponding stable Higgs bundle under HodgeStructuresPartII:H.1/harmonic-correspondence. Then there are natural isomorphisms H¹_dR(X, End⁰(E,∇)) ≅ H¹(X^an, End⁰(E^∇)) ≅ H¹(π₁(X^an, x), ad⁰ρ) and an isomorphism of the latter with the first hypercohomology of the trace-free Higgs complex (End⁰(V), [θ,−]). These are the Zariski tangent spaces of M_dR^s(X,r,L), M_B^s(π₁, r, δ) and M_Dol^s(X,(L,0),r) at the corresponding points. More precisely (Simpson, Moduli II, Proposition 10.5 and Theorem 10.6), the formal completions of the three moduli at points corresponding to the same harmonic bundle are canonically isomorphic, each being the completion at 0 of a quadratic cone in this H¹ (modulo the scalar stabilizer, which acts trivially at stable points); the analytic Riemann–Hilbert isomorphism of HodgeStructuresPartII:H.1/riemann-hilbert-coarse induces an isomorphism of the de Rham and Betti tangent spaces. In particular the three cohomological rigidity conditions coincide.

**Hypotheses.**

- X smooth connected projective over ℂ; stable objects with fixed torsion determinant.
- The algebraic de Rham comparison with coefficients in an algebraic flat bundle (GAGA plus the holomorphic Poincaré lemma with coefficients) is requested from ComplexComparisonPartII:C5, whose stated scope is constant coefficients.

**Proof plan.**

- Algebraic to analytic: GAGA for the coherent terms of the de Rham complex of End⁰(E,∇) gives H¹_dR(X, End⁰(E,∇)) ≅ H¹(X^an, Ω^•(End⁰ E^an)); the holomorphic Poincaré lemma with coefficients makes the analytic de Rham complex a resolution of the local system End⁰(E^∇) (request ComplexComparisonPartII:C5).
- Degree-one cohomology of a local system on a connected manifold is group cohomology of π₁ with coefficients in the monodromy representation (HodgeStructuresPartII:H.5/trace-free-adjoint API flatBundle).
- Riemann–Hilbert is an isomorphism of complex analytic spaces, so completed local rings and tangent spaces of M_dR^s and M_B^s agree (HodgeStructuresPartII:H.1/riemann-hilbert-coarse); the tangent space of M_B^s is H¹(π₁, ad⁰ρ) (HodgeStructuresPartII:H.5/betti-tangent).
- Dolbeault side: the deformations of (V,θ) with fixed determinant are controlled by the trace-free Higgs dg Lie algebra; by the principle of two types (HodgeStructuresPartII:H.1/two-types-formality) the de Rham and Higgs dg Lie algebras of a harmonic object are quasi-isomorphic to the same formal one. Goldman–Millson theory and Luna's étale slice (Simpson, Moduli II, Theorem 10.4 and Proposition 10.5, with the formal local product of HodgeStructuresPartII:H.1/hodge-formal-product) identify the completed local ring of M_Dol^s at a stable point with the completion of the quadratic cone in H¹ of the Higgs complex, whose Zariski tangent space is that H¹; the isosingularity theorem (Simpson, Moduli II, Theorem 10.6) identifies it with the de Rham completed local ring.

**Acceptance.**

- For r = 1 all three groups vanish.
- For a stable rank-two connection on a compact curve of genus g ≥ 2 each group has dimension 6g − 6.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/betti-tangent`
- `HodgeStructuresPartII:H.5/trace-free-adjoint`
- `HodgeStructuresPartII:H.1/riemann-hilbert-coarse`
- `HodgeStructuresPartII:H.1/harmonic-correspondence`
- `HodgeStructuresPartII:H.1/two-types-formality`
- `HodgeStructuresPartII:H.1/hodge-formal-product`
- `ComplexComparisonPartII:C5`
- `AlgebraicModuliForArithmeticGeometry:R09.5`

**Sources.**

- EG20, §7, p.148: Tangent space of the de Rham moduli is trace-free H¹.
- EG18, §2, Proposition 2.3, p.5: Betti side (with no boundary, U = X).
- S94II, §10, Proposition 10.5, p.68: Formal completion of the moduli at a harmonic point is the quotient of the quadratic cone in H¹.
- S94II, Introduction, p.8: Same deformation theory on the de Rham and Dolbeault sides.

**Suggested signature coverage.** omitted. Omitted: `deRham_betti_tangent_iso`.

### Rigid objects correspond across Betti, de Rham and Dolbeault moduli

`HodgeStructuresPartII:H.5/rigid-correspondence` · theorem · implementation unchecked

Let X be smooth connected projective over ℂ, L torsion and r ≥ 1. The Riemann–Hilbert analytic isomorphism M_dR^s(X,r,L)^an ≅ M_B^s(π₁(X,x), r, δ_L)^an (HodgeStructuresPartII:H.1/riemann-hilbert-coarse) and the non-abelian Hodge homeomorphism M_dR^s(X,r,L) ≅ M_Dol^s(X,(L,0),r) (HodgeStructuresPartII:H.1/nonabelian-hodge-topology) restrict to bijections M^rig_B(ℂ) ≅ M^rig_dR(ℂ) ≅ M^rig_Dol(ℂ) between the finite sets of rigid points (HodgeStructuresPartII:H.5/rigid-locus). The Riemann–Hilbert bijection preserves the local rings; by Simpson's isosingularity theorem the formal completions of M_dR^s and M_Dol^s at corresponding points are isomorphic, so the non-abelian Hodge bijection of rigid points also preserves the (Artinian) local rings, hence lengths and cohomological rigidity (HodgeStructuresPartII:H.5/derham-betti-tangent). Consequently the numbers of rigid connections, rigid representations and rigid stable Higgs bundles of rank r and determinant L are equal.

**Hypotheses.**

- X smooth connected projective; stable loci with fixed torsion determinant; isolated points in the analytic topology (equal to Zariski isolation on finite-type schemes).

**Proof plan.**

- A homeomorphism of topological spaces maps isolated points to isolated points; apply it to the stable non-abelian Hodge homeomorphism and to the analytic Riemann–Hilbert isomorphism (HodgeStructuresPartII:H.1/nonabelian-hodge-topology states that it preserves isolated points).
- An isomorphism of analytic spaces identifies the analytic local rings, which for finite-type schemes are faithfully flat over the algebraic local rings with the same completion; hence lengths at isolated points agree between M_dR and M_B.
- Tangent spaces and formal completions correspond on all three sides (HodgeStructuresPartII:H.5/derham-betti-tangent; Simpson, Moduli II, Proposition 10.5 and Theorem 10.6); an Artinian local ring is its own completion, so the local rings of corresponding rigid points are isomorphic and reduced isolated points correspond.

**Acceptance.**

- In rank one each side is a single reduced point.
- For X a compact curve of genus ≥ 2 and r ≥ 2 all three rigid loci are empty.
- Corresponding rigid points have isomorphic Artinian local rings (the non-reduced structure is not lost under non-abelian Hodge).

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/rigid-connection`
- `HodgeStructuresPartII:H.5/rigid-representation`
- `HodgeStructuresPartII:H.5/rigid-locus`
- `HodgeStructuresPartII:H.5/derham-betti-tangent`
- `HodgeStructuresPartII:H.1/riemann-hilbert-coarse`
- `HodgeStructuresPartII:H.1/nonabelian-hodge-topology`

**Sources.**

- EG20, §2.1, p.108: The comparison of the three moduli spaces used to transport rigidity.
- S94II, §10, after Proposition 10.5, p.68: Formal completions of M_Dol and M_dR at points corresponding to the same harmonic bundle are isomorphic.
- EG20, §4.2, p.133: The finite counts of rigid objects are compared across the moduli spaces (corrected indices: source issue HodgeStructuresPartII/E-H5-1).

**Suggested signature coverage.** omitted. Omitted: `rigid_correspondence`.

### Rigid loci of moduli schemes

`HodgeStructuresPartII:H.5/rigid-locus` · construction · implementation unchecked

For a morphism of schemes f: M → S locally of finite type, the rigid locus M^rig ⊂ M is the open subscheme f.quasiFiniteLocus of Mathlib: the points x at which f is quasi-finite, equivalently the points isolated in their fibre f⁻¹(f(x)) (Esnault–Groechenig Definition 3.2). Applied to the stable fixed-determinant moduli over S = Spec ℂ it gives M^rig_B, M^rig_dR and M^rig_Dol, the closed and open finite subschemes of isolated points with their possibly non-reduced structure; applied to the relative moduli over an arithmetic base it gives M^rig(X_S/S, L_S, r) (HodgeStructuresPartII:H.5/relative-moduli); applied to q: M_Hod^s → 𝔸¹ it gives M^rig_Hod (HodgeStructuresPartII:H.5/hodge-rigid-locus).

**Hypotheses.**

- f locally of finite type (Mathlib's openness theorem needs only this).
- Over a field, M of finite type, so that the rigid locus is finite and closed as well as open.

**Proof plan.**

- Openness is Mathlib's AlgebraicGeometry.Scheme.Hom.isOpen_quasiFiniteAt (a consequence of Zariski's main theorem); the open subscheme is AlgebraicGeometry.Scheme.Hom.quasiFiniteLocus.
- Fibrewise characterization: Scheme.Hom.quasiFiniteAt_iff_isOpen_singleton_asFiber says x is in the locus iff {x} is open in its fibre.
- Over a field and for M of finite type: the isolated points are the irreducible components of dimension zero; there are finitely many, the union is closed, and M = M^rig ⊔ (M ∖ M^rig) with the complement containing no isolated point (Esnault–Groechenig (3.1)).
- Equivariance: an automorphism of M over an automorphism of S preserves fibres and isolation, so group actions compatible with f preserve M^rig.

**Acceptance.**

- Retains non-reduced isolated points with their structure.
- Is open but in families need not be closed.

**Uses that determine the API.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, §3.1 (3.1) and Definition 3.2: M^rig_dR(X/ℂ,L,r) and M^rig_Dol, and the relative loci M^rig_dR(X_S/S, L_S, r), M^rig_Dol(X_S/S, L_S, r) over arithmetic bases.
- Esnault–Groechenig, Rigid connections and F-isocrystals, Proposition 3.3(d),(e) and §4.2: Sections of the moduli through rigid points factor through the open relative rigid locus; M^rig_Hod is the quasi-finite locus of the Hodge moduli over 𝔸¹.
- HodgeStructuresPartII:H.5/rigid-finite, HodgeStructuresPartII:H.5/nilpotent-rigid-models, HodgeStructuresPartII:H.5/hodge-rigid-locus: Finiteness, spreading and the Hodge splitting are statements about these loci.

**API.**

- `RigidLocus` (constructor): RigidLocus f := f.quasiFiniteLocus, an open subscheme of M, for f locally of finite type.
- `RigidLocus.mem_iff_isolated` (characterisation): x ∈ RigidLocus f ↔ x is isolated in its fibre (Mathlib quasiFiniteAt_iff_isOpen_singleton_asFiber).
- `RigidLocus.locallyQuasiFinite` (instance): The restriction of f to RigidLocus f is locally quasi-finite (Mathlib instance on quasiFiniteLocus.ι ≫ f).
- `RigidLocus.field_isClopen` (characterisation): If S = Spec K for a field K and M is of finite type, RigidLocus f is closed and open, finite over K, and its complement has no isolated points. Supplied by `HodgeStructuresPartII:H.5/rigid-locus-field-clopen`.
- `RigidLocus.comp_openImmersion` (functoriality): For an open immersion j: M′ → M, RigidLocus (j ≫ f) = j⁻¹(RigidLocus f) (Mathlib quasiFiniteLocus_comp).
- `RigidLocus.isFinite_of_isProper` (relation): If the restriction of f to RigidLocus f is proper then it is finite (Mathlib IsFinite.of_isProper_of_locallyQuasiFinite).
- `RigidLocus.equivariant` (functoriality): If a group acts on M and S compatibly with f, the action preserves RigidLocus f. Supplied by `HodgeStructuresPartII:H.5/rigid-locus-equivariant`.
- `RigidLocus.fibre` (projection): For s ∈ S, the fibre of RigidLocus f over s is the rigid locus of the fibre M_s → Spec κ(s), i.e. the isolated points of M_s. Supplied by `HodgeStructuresPartII:H.5/rigid-locus-fibre`.

**Unit tests.**

- `RigidLocus.test_fat_point` (computation): For f: Spec ℂ[x]/(x²) → Spec ℂ, the rigid locus is all of Spec ℂ[x]/(x²), including its nilpotent structure.
- `RigidLocus.test_affine_line` (non-example): For f: 𝔸¹_ℂ → Spec ℂ the rigid locus is empty.
- `RigidLocus.test_line_and_point` (computation): For M = Spec ℂ[x,y]/(y(y − 1), xy) → Spec ℂ (the line y = 0 and the point (0,1)), the rigid locus is the point (0,1).
- `RigidLocus.test_relative_open_not_closed` (characterisation): For f: Spec ℤ[x]/(px) → Spec ℤ, the rigid locus is the open subscheme Spec ℤ[1/p] (x = 0 away from p); it does not meet the fibre 𝔸¹_{𝔽_p}.
- `RigidLocus.test_compat_mathlib` (compatibility): RigidLocus f is definitionally Mathlib's f.quasiFiniteLocus, and x ∈ RigidLocus f ↔ IsOpen {f.asFiber x}.

**Direct prerequisites.**

- `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteLocus`
- `mathlib:AlgebraicGeometry.Scheme.Hom.isOpen_quasiFiniteAt`
- `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteAt_iff_isOpen_singleton_asFiber`
- `mathlib:AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`
- `mathlib:AlgebraicGeometry.LocallyQuasiFinite`

**Sources.**

- EG20, §3.1, Definition 3.2, p.123: The rigid locus is the quasi-finite locus.
- EG20, §3.1, p.121: Over ℂ the rigid locus is the closed (and open) subscheme of isolated points.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Locus`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `RigidLocus`, `RigidLocus.mem_iff_isolated`, `RigidLocus.locallyQuasiFinite`, `RigidLocus.field_isClopen`, `RigidLocus.comp_openImmersion`, `RigidLocus.isFinite_of_isProper`, `RigidLocus.equivariant`, `RigidLocus.test_fat_point`, `RigidLocus.test_affine_line`, `RigidLocus.test_compat_mathlib`. Omitted: `RigidLocus.fibre`, `RigidLocus.test_line_and_point`, `RigidLocus.test_relative_open_not_closed`.

### Finiteness of rigid objects

`HodgeStructuresPartII:H.5/rigid-finite` · theorem · implementation unchecked

Let X be smooth connected projective over ℂ, L torsion and r ≥ 1. The rigid loci M^rig_B(π₁(X), r, δ_L), M^rig_dR(X, r, L) and M^rig_Dol(X, (L,0), r) are finite ℂ-schemes; there are finitely many isomorphism classes of rigid flat connections, rigid representations and rigid stable Higgs bundles of rank ≤ r with determinant L. More generally, for a finitely generated Γ and prescribed data as in HodgeStructuresPartII:H.5/prescribed-monodromy-moduli, the moduli has finitely many isolated points, and for r, d, h fixed the set S(r, d, h) of irreducible cohomologically rigid local systems on a smooth quasi-projective X of rank r, determinant of order dividing d and quasi-unipotent local monodromies whose eigenvalues have order dividing h is finite.

**Hypotheses.**

- The moduli are of finite type over ℂ (respectively over a number field).
- For S(r,d,h): finitely many determinant characters of order dividing d and finitely many quasi-unipotent conjugacy classes with eigenvalue orders dividing h and fixed Jordan type.

**Proof plan.**

- A scheme of finite type over a field is Noetherian and has finitely many irreducible components; isolated points are zero-dimensional components; apply HodgeStructuresPartII:H.5/rigid-locus over Spec ℂ.
- The fixed-determinant moduli HodgeStructuresPartII:H.1/betti-coarse, HodgeStructuresPartII:H.1/derham-coarse and HodgeStructuresPartII:H.1/dolbeault-coarse are of finite type.
- For S(r, d, h): Hom(π₁, μ_d) is finite, and for each Jordan type there are finitely many quasi-unipotent classes with eigenvalue orders dividing h; each of the finitely many stacks M_m has finitely many isolated points (Esnault–Groechenig 2018 §3, first paragraph).

**Acceptance.**

- In rank one each rigid locus is one point.
- S(r, d, h) is empty for r ≥ 2 on a compact curve of genus ≥ 2.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/rigid-locus`
- `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`
- `HodgeStructuresPartII:H.5/boundary-monodromy-data`
- `HodgeStructuresPartII:H.1/betti-coarse`
- `HodgeStructuresPartII:H.1/derham-coarse`
- `HodgeStructuresPartII:H.1/dolbeault-coarse`
- `HodgeStructuresPartII:H.5/rigid-locus-field-clopen`

**Sources.**

- EG18, §3, p.6: Finiteness of cohomologically rigid local systems with bounded data.
- EG20, §3.1, p.121: The rigid locus over ℂ is finite.

**Suggested signature coverage.** omitted. Omitted: `rigidLocus_finite`.

### Rigidity is preserved by automorphisms of the coefficients

`HodgeStructuresPartII:H.5/rigidity-conjugate` · theorem · implementation unchecked

Let Γ be finitely generated, ρ: Γ → GL_r(ℂ) and σ ∈ Aut(ℂ). Then σ∘ρ is absolutely irreducible, has determinant σ∘det ρ, has quasi-unipotent image at the elements γ_i (with the same eigenvalue orders), is rigid, cohomologically rigid or strongly cohomologically rigid if and only if ρ is. The same holds for G-valued ρ with G split reductive over ℚ (σ acting on G(ℂ)). Unitarity is not preserved (HodgeStructuresPartII:H.5/infinite-image-unitary-example).

**Hypotheses.**

- Γ finitely generated; σ an arbitrary field automorphism of ℂ (not continuous in general).

**Proof plan.**

- H¹(Γ, ad⁰(σ∘ρ)) ≅ H¹(Γ, ad⁰ρ) ⊗_{ℂ,σ} ℂ (HodgeStructuresPartII:H.5/trace-free-adjoint API baseChange), and the same for the restriction maps to ⟨γ_i⟩; vanishing is preserved.
- The moduli M_B^s(Γ, r, δ) and the prescribed-monodromy moduli are schemes (stacks) of finite type defined over ℚ(δ, eigenvalues); σ induces an isomorphism of the ℂ-points of M and of its σ-conjugate which is an isomorphism of schemes over σ, hence preserves Zariski isolation and local rings.
- Eigenvalues of ρ(γ_i) are roots of unity iff those of σρ(γ_i) are, with the same orders; irreducibility is preserved because invariant subspaces are transported by σ.

**Acceptance.**

- σ = complex conjugation takes a rigid ρ to the rigid ρ̄.
- Galois conjugates of a unitary character with values in a Salem-type unit need not be unitary, although they remain rigid.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/trace-free-adjoint`
- `HodgeStructuresPartII:H.5/rigid-representation`
- `HodgeStructuresPartII:H.5/cohomological-rigidity`
- `HodgeStructuresPartII:H.5/strong-cohomological-rigidity`
- `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`
- `HodgeStructuresPartII:H.5/adjoint-h1-base-change`

**Sources.**

- LL24, §8.4, proof of Proposition 8.4.1, p.41: Aut(ℂ)-invariance of (strong) cohomological rigidity.
- EG18, §3, p.6: Vanishing of trace-free H¹ is insensitive to extension of the coefficient field, the base-change step of the proof.

**Suggested signature coverage.** native. Native: `rigidity_conj_aut`.

### Rigid local systems are defined over number fields

`HodgeStructuresPartII:H.5/rigid-number-field` · theorem · implementation unchecked

Let Γ be finitely generated and ρ: Γ → GL_r(ℂ) absolutely irreducible and rigid with finite-order determinant δ (with prescribed quasi-unipotent local data as in HodgeStructuresPartII:H.5/prescribed-monodromy-moduli when present). Then there are a number field K ⊂ ℂ and a finite set Σ of finite places of K such that ρ is GL_r(ℂ)-conjugate to a representation Γ → GL_r(𝒪_{K,Σ}), where 𝒪_{K,Σ} is the ring of Σ-integers. For Γ = π₁ of a smooth projective X, every Galois conjugate of ρ is rigid and ρ is a complex direct factor of a ℚ-local system (Simpson Theorem 5).

**Hypotheses.**

- Γ finitely generated; ρ absolutely irreducible and rigid in the fixed-determinant (prescribed-boundary) moduli; δ of finite order and boundary classes quasi-unipotent, so that the moduli is defined over a number field K₀.

**Proof plan.**

- The moduli M (HodgeStructuresPartII:H.5/prescribed-monodromy-moduli) is of finite type over a number field K₀ ⊃ ℚ(μ_d, μ_h); its finitely many isolated ℂ-points (HodgeStructuresPartII:H.5/rigid-finite) are permuted by Aut(ℂ/K₀) (HodgeStructuresPartII:H.5/rigidity-conjugate).
- A ℂ-point of a finite-type K₀-scheme with finite Aut(ℂ/K₀)-orbit is defined over a finite extension of K₀; so [ρ] is a K₁-point for a number field K₁.
- On the stable locus the representation scheme is a PGL_r-torsor over the coarse space (HodgeStructuresPartII:H.5/betti-tangent proof); a K₁-point lifts to a representation over a finite extension K (torsor trivial over a finite extension; the Brauer obstruction of an absolutely irreducible representation with traces in K₁ splits over a finite extension).
- Γ is finitely generated, so the finitely many entries of ρ(generators)^{±1} lie in 𝒪_{K,Σ} for a finite Σ (Esnault–Groechenig 2018 §3).
- Simpson's Theorem 5 assumes proper rigidity (openness of the orbit in Hom(π₁, H), H the Zariski closure of the image). Fixed-determinant rigidity with finite-order δ implies it: det is locally constant on Hom(π₁, H) since det(H) is finite, so nearby ρ_t in Hom(π₁, H) are g_tρg_t⁻¹ with g_t → 1; g_t normalizes H, and for irreducible ρ the identity component of the normalizer is H°·ℂ^×, so ρ_t is H-conjugate to ρ.

**Acceptance.**

- For r = 1 with δ of order d, K = ℚ(μ_d) and Σ = ∅.
- For Γ finite, every irreducible representation is defined over a number field (classical), consistent with rigidity.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/rigid-representation`
- `HodgeStructuresPartII:H.5/rigid-finite`
- `HodgeStructuresPartII:H.5/rigidity-conjugate`
- `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`
- `HodgeStructuresPartII:H.5/betti-tangent`

**Sources.**

- EG18, §3, p.6: Rigid local systems with the prescribed data are defined over a number field.
- S92, §4, proof of Theorem 5, p.56: Simpson's argument for rigid representations of projective varieties.

**Suggested signature coverage.** native. Native: `exists_numberField_of_rigid`.

### Good compactifications and local monodromy at infinity

`HodgeStructuresPartII:H.5/boundary-monodromy-data` · definition · implementation unchecked

Let X be a smooth connected quasi-projective complex variety with base point x. A good compactification is an open immersion j: X → X̄ into a smooth projective X̄ such that D = X̄ ∖ X is a strict normal crossings divisor with irreducible components D_1, …, D_N. Put U = X̄ ∖ D_sing and a: X → U. For each i choose y_i ∈ D_i ∩ U, a small ball Δ_i ∋ y_i in X̄ and x_i ∈ Δ_i^× = Δ_i ∖ D; then π₁(Δ_i^×, x_i) = ℤ·T_i with T_i the positively oriented generator (counter-clockwise for the complex orientation of a normal disc), and a path from x to x_i transports T_i to an element of π₁(X, x) (the local monodromy loop around D_i), well defined up to conjugation and independent of y_i because D_i ∩ U is connected. For a representation ρ: π₁(X,x) → GL_r(ℂ) (or G(ℂ)), the local monodromy along D_i is the conjugacy class of ρ(T_i). ρ has quasi-unipotent local monodromy if every ρ(T_i) is quasi-unipotent: some positive power is unipotent, equivalently all eigenvalues are roots of unity. Boundary data are conjugacy classes K_1, …, K_N ⊂ GL_r (locally closed subvarieties); V is defined by K_i along D_i if ρ(T_i) ∈ K_i.

**Hypotheses.**

- X smooth connected quasi-projective over ℂ; existence of a good compactification is Hironaka's resolution in characteristic zero, requested from AlgebraicModuliForArithmeticGeometry:R09.7d.
- When X is projective, D = ∅, N = 0 and every condition is vacuous.

**Proof plan.**

- Construct T_i from the local product structure of an SNC divisor at a smooth point y_i of D: Δ_i ≅ disc × polydisc with D ∩ Δ_i the first coordinate hyperplane, so Δ_i^× ≃ punctured disc × polydisc and π₁ = ℤ.
- Independence of y_i: D_i ∩ U is irreducible, hence connected, and the local systems V|Δ_i^× for nearby y_i are identified by parallel transport along a path in D_i ∩ U (Esnault–Groechenig 2018 §2).
- Quasi-unipotence is a property of the conjugacy class, hence of the data.

**Acceptance.**

- For X projective there is no boundary condition.
- For X = 𝔾_m ⊂ ℙ¹ the local monodromy at 0 is ρ(1) for ρ: ℤ → GL_r(ℂ).

**Uses that determine the API.**

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

**Direct prerequisites.**

- `AlgebraicModuliForArithmeticGeometry:R09.7d`
- `LefschetzPencilsAndVanishingCycles:LPV.1`
- `tauceti:TauCeti.LocalCoefficientSystem`

**Sources.**

- EG18, §2, p.3: Local monodromy along a boundary component and the prescribed class K_i.
- KP20, §1, Definition 1.1, p.2: Quasi-unipotent local monodromy.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Boundary`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `IsQuasiUnipotentAtInfinity`, `IsQuasiUnipotentAtInfinity.iff_eigenvalues`, `IsQuasiUnipotentAtInfinity.conj_aut`, `BoundaryMonodromyData.test_projective_vacuous`, `BoundaryMonodromyData.test_Gm_root_of_unity`, `BoundaryMonodromyData.test_Gm_not_quasiUnipotent`, `BoundaryMonodromyData.test_unipotent_infinite_order`. Omitted: `GoodCompactification`, `GoodCompactification.localMonodromy`, `GoodCompactification.localMonodromy_conj`, `IsQuasiUnipotentAtInfinity.of_geometricOrigin`, `GoodCompactification.exists`.

### Moduli of irreducible local systems with prescribed determinant and local monodromy

`HodgeStructuresPartII:H.5/prescribed-monodromy-moduli` · construction · implementation unchecked

Let Γ be a finitely presented group, r ≥ 1, χ_L: Γ → μ_d ⊂ K^× a finite-order character, γ_1, …, γ_N ∈ Γ and K_1, …, K_N ⊂ GL_r locally closed conjugacy classes, all defined over a number field K. The stack M = M(Γ, r, L, (γ_i, K_i)) over K sends an affine K-variety T to the groupoid of geometrically irreducible T-families of rank-r representations W with an isomorphism ∧^r W ≅ L ⊗ O_T and with ρ(γ_i) a section of K_i. It is a locally closed substack of [R(Γ, L)/SL_r], where R(Γ, L) is the affine K-variety of tuples of matrices satisfying the relations of a presentation and the determinant conditions; it is an algebraic stack of finite type over K with automorphism group scheme μ_r at every object, its μ_r-rigidification is an algebraic space which is its coarse moduli space, and it has finitely many zero-dimensional irreducible components. For Γ = π₁(X, x) with X smooth quasi-projective and γ_i = T_i the local monodromy loops (HodgeStructuresPartII:H.5/boundary-monodromy-data), this is the moduli of irreducible local systems with determinant L and local monodromies in K_i; when the K_i are quasi-unipotent classes it is defined over a number field. For a split connected reductive G with abelianization θ the analogous stack of G-irreducible representations (Klevdal–Patrikis Proposition 4.4) is of finite type. With N = 0 and G = GL_r its coarse space contains the stable fixed-determinant Betti moduli M_B^s(Γ, r, δ) of HodgeStructuresPartII:H.1/betti-coarse as the coarse space of its ℂ-fibre.

**Hypotheses.**

- Γ finitely presented (π₁ of a smooth quasi-projective complex variety is finitely presented).
- K_i locally closed in GL_r, e.g. conjugacy classes of quasi-unipotent matrices; the condition ρ(γ_i) ∈ K_i is locally closed, not closed, when K_i is not closed.
- The quotient-stack and rigidification formalism (Abramovich–Corti–Vistoli) is requested from AlgebraicModuliForArithmeticGeometry:R09.4 and R09.5.

**Proof plan.**

- Choose a presentation ⟨r_1, …, r_e | s_1, …, s_f⟩ and L_j ∈ μ_d(K) with r_j ↦ L_j defining χ_L; R(Γ, L) = {(A_j) ∈ GL_r^e : det A_j = L_j, s_i(A) = 1} is affine of finite type, and [R(Γ,L)/SL_r] ≅ Rep(Γ, L) (Esnault–Groechenig 2018 Proposition 2.1 proof, with the misprints of source issue HodgeStructuresPartII/E-H5-5 corrected).
- Geometric irreducibility is open: for a family W over T, the locus where some k-plane with 0 < k < r is Γ-invariant is the image of the closed fixed locus in the proper Grassmann bundle ⊔_{0<k<r} Gr(W, k), hence closed.
- The local monodromy conditions are pullbacks of the locally closed K_i under the evaluations at γ_i, hence locally closed.
- Automorphisms of a geometrically irreducible family with fixed determinant are μ_r (Schur's lemma and det(u·Id) = u^r); rigidify to obtain an algebraic space, which is a coarse moduli space (Esnault–Groechenig 2018 Remark 2.2).
- A finite-type stack has finitely many irreducible components; isolated points are zero-dimensional components.

**Acceptance.**

- For N = 0 and G = GL_r the ℂ-points of the coarse space are the isomorphism classes of irreducible representations with determinant δ, as for M_B^s(Γ, r, δ).
- For r = 1 and N = 0 (or χ_L(γ_i) ∈ K_i for all i) the stack is the single object L with trivial automorphism group.

**Uses that determine the API.**

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

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/boundary-monodromy-data`
- `HodgeStructuresPartII:H.1/betti-framed`
- `HodgeStructuresPartII:H.1/betti-coarse`
- `HodgeStructuresPartII:H.1/stable-automorphisms`
- `AlgebraicModuliForArithmeticGeometry:R09.4`
- `AlgebraicModuliForArithmeticGeometry:R09.5`
- `AlgebraicModuliForArithmeticGeometry:R09.1`

**Sources.**

- EG18, §2, Proposition 2.1, p.4: Finite type and finitely many isolated points.
- EG18, §2, Remark 2.2, p.5: Coarse moduli by rigidification.
- KP20, §4, Proposition 4.4, p.8: The G-version.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Moduli`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `PrescribedMonodromyModuli`, `PrescribedMonodromyModuli.coarse`, `PrescribedMonodromyModuli.points`, `PrescribedMonodromyModuli.automorphisms`, `PrescribedMonodromyModuli.irreducible_open`, `PrescribedMonodromyModuli.finite_isolated`, `PrescribedMonodromyModuli.baseChange`, `PrescribedMonodromyModuli.reductive`, `PrescribedMonodromyModuli.test_no_boundary`, `PrescribedMonodromyModuli.test_rank_one`, `PrescribedMonodromyModuli.test_free_group_dimension`, `PrescribedMonodromyModuli.test_locally_closed`.

### Tangent space with prescribed local monodromy

`HodgeStructuresPartII:H.5/prescribed-monodromy-tangent` · theorem · implementation unchecked

In the setting of HodgeStructuresPartII:H.5/prescribed-monodromy-moduli with Γ = π₁(X, x), X smooth connected quasi-projective with good compactification and γ_i = T_i, let V be a geometrically irreducible K-local system in M(K) with monodromy ρ. The Zariski tangent space of M at [V] is H¹(U, a_* End⁰(V)), where a: X → U = X̄ ∖ D_sing; equivalently it is the kernel of the restriction map H¹(π₁(X, x), ad⁰ρ) → ⊕_{i=1}^{N} H¹(⟨T_i⟩, ad⁰ρ) (HodgeStructuresPartII:H.5/betti-tangent). In particular, if H¹(U, a_* End⁰(V)) = 0, then [V] is a reduced isolated point. The same holds with g^der in place of End⁰ for split reductive G (Klevdal–Patrikis Proposition 4.7).

**Hypotheses.**

- Characteristic-zero coefficient field K; V geometrically irreducible with fixed determinant and local monodromy classes.
- Degree-one sheaf cohomology of local systems on X and on punctured balls agrees with group cohomology of their fundamental groups.

**Proof plan.**

- Deformations over K[ε] with fixed determinant and local classes form a torsor under the group of cocycles in End⁰(V) that are trivial on every punctured ball Δ_i^×; Čech cocycles on a cover of X by balls give a class in H¹(X, End⁰(V)) (Esnault–Groechenig 2018 Proposition 2.3).
- In characteristic zero the orbit map G → K_i is smooth (stabilizers are smooth), so every K[ε]-point of K_i lifting ρ(T_i) is a conjugate (1 + εξ)ρ(T_i)(1 − εξ); hence the local condition says the class restricts to zero in H¹(Δ_{ij}^×, End⁰(V)) for a cover of each D_i ∩ U; the kernel of H¹(X, End⁰V) → ⊕ H¹(Δ_{ij}^×, End⁰V) is H¹(U, a_* End⁰V) by the Leray spectral sequence for a.
- Change of trivialization changes the cocycle by a coboundary, so the tangent space is that kernel; the group-theoretic form follows from H¹(X, ·) = H¹(π₁(X), ·) and H¹(Δ_i^×, ·) = H¹(ℤ·T_i, ·) (Klevdal–Patrikis Proposition 4.7 diagram).
- Degree-one comparison between local-system cohomology and group cohomology is supplied by the singular cohomology with local coefficients of tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality and the Tau Ceti local coefficient systems.

**Acceptance.**

- When X is projective this is H¹(π₁(X,x), ad⁰ρ).
- For the rank-two hypergeometric local systems on ℙ¹ ∖ {0,1,∞} with non-scalar local monodromies the tangent space is zero, while H¹(π₁, ad⁰ρ) is three-dimensional (n² − 1-dimensional in rank n).

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`
- `HodgeStructuresPartII:H.5/boundary-monodromy-data`
- `HodgeStructuresPartII:H.5/trace-free-adjoint`
- `HodgeStructuresPartII:H.5/betti-tangent`
- `mathlib:groupCohomology.H1`
- `tauceti:TauCeti.LocalCoefficientSystem`
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`

**Sources.**

- EG18, §2, Proposition 2.3, p.5: Tangent space and the rigidity consequence.
- KP20, §4, Proposition 4.7, p.10: G-version.

**Suggested signature coverage.** omitted. Omitted: `PrescribedMonodromyModuli.tangent_eq`.

### First cohomology of the intermediate extension

`HodgeStructuresPartII:H.5/intermediate-extension-h1` · comparison · implementation unchecked

Let X ⊂ X̄ be a good compactification with U = X̄ ∖ D_sing, X →a U →b X̄ and j = b∘a, and let F be a local system of finite-dimensional vector spaces on X over a field of characteristic zero. Then H¹(X̄, j_{!*}F) ≅ H¹(U, a_* F), where j_{!*} is the intermediate extension of F (placed in the appropriate perverse degree and shifted back): there is an exact triangle j_{!*}F → Rb_* a_* F → C with C supported on D_sing and concentrated in degrees ≥ 2. If the local monodromies of F are finite, j_{!*}F = j_*F; if X is a curve, j_{!*} = j_*. The same identity holds for lisse ℚ̄_ℓ-sheaves on X_s ⊂ X̄_s for a good compactification over a finite field with ℓ invertible (for instance the fibre of a model as in HodgeStructuresPartII:H.5/smooth-arithmetic-model; Esnault–Groechenig 2018 Lemma 3.4). Thus the j_{!*}-definitions of cohomological rigidity of Esnault–Groechenig, Klevdal–Patrikis and Landesman–Litt agree with the a_*-definition of HodgeStructuresPartII:H.5/cohomological-rigidity.

**Hypotheses.**

- Good compactification as in HodgeStructuresPartII:H.5/boundary-monodromy-data; coefficient field of characteristic zero.
- The étale intermediate extension and its recollement are requested from EtaleDualityAndPerverseSheaves:EDC.5; the analytic constructible version is recorded as a gap.

**Proof plan.**

- From BBD Proposition 2.1.11, j_{!*} is computed by successive truncated pushforwards along a stratification; along U it agrees with a_* (no truncation is needed in codimension one), giving the triangle with C supported on D_sing in degrees ≥ 2 (Esnault–Groechenig 2018 Remark 2.4).
- Taking hypercohomology, H¹(C) = H⁰(C) = 0 gives H¹(X̄, j_{!*}F) ≅ H¹(X̄, Rb_* a_* F) ≅ H¹(U, a_* F).
- Finite local monodromy: on a finite cover the local system extends, so j_{!*} = j_*; on curves D_sing = ∅ and U = X̄.

**Acceptance.**

- On ℙ¹ ∖ {0,1,∞}, H¹(ℙ¹, j_{!*}F) = H¹(ℙ¹, j_*F).
- For X projective both sides are H¹(X, F).

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/boundary-monodromy-data`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources.**

- EG18, §2, Remark 2.4, p.6: The intermediate-extension H¹ equals the a_* H¹.
- KP20, §4, Remark 4.8, p.10: Same identity for g^der.
- LL24, §8.1, Remark 8.1.2, p.38: Curve case.

**Suggested signature coverage.** omitted. Omitted: `h1_intermediateExtension_eq`.

## H.5b. Hodge theory of rigid objects

### Rigid Higgs bundles are fixed by scaling

`HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed` · theorem · implementation unchecked

Let X be smooth connected projective over ℂ and (V,θ) a rigid stable Higgs bundle with determinant (L,0) (HodgeStructuresPartII:H.5/rigid-connection). Then (V, tθ) ≅ (V, θ) for every t ∈ ℂ^×; equivalently [(V,θ)] is a fixed point of the 𝔾_m-action on M_Dol^s(X, (L,0), r).

**Hypotheses.**

- X smooth connected projective; (V,θ) slope stable, trace-free, with vanishing rational Chern classes and determinant (L,0); rigidity is isolation in M_Dol^s(X,(L,0),r).

**Proof plan.**

- Scaling θ ↦ tθ preserves stability, the vanishing-Chern-class component, the determinant (L,0) and tr θ = 0, and defines an algebraic 𝔾_m-action on M_Dol^s(X,(L,0),r) (HodgeStructuresPartII:H.1/hodge-scaling at λ = 0).
- The orbit map 𝔾_m → M_Dol^s, t ↦ [(V,tθ)], is a morphism from a connected variety; its image is connected and contains the isolated point [(V,θ)], which is open in the image, so the image is that point.
- Points of the stable locus are isomorphism classes of stable objects (HodgeStructuresPartII:H.1/dolbeault-coarse), hence (V,tθ) ≅ (V,θ).

**Acceptance.**

- For r = 1, (L, 0) is fixed by every t.
- The fixed points of 𝔾_m need not be rigid: on a compact curve of genus ≥ 2 the uniformizing system of Hodge bundles is fixed and lies on a positive-dimensional moduli.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/rigid-connection`
- `HodgeStructuresPartII:H.1/hodge-scaling`
- `HodgeStructuresPartII:H.1/dolbeault-coarse`
- `HodgeStructuresPartII:H.5/rigid-locus-equivariant`

**Sources.**

- EG20, §2.1, Lemma 2.1 proof, p.109: Scaling gives a 𝔾_m-family through a rigid point, which must be constant.
- S92, §4, proof of Lemma 4.5, p.51: Rigidity forces (E, tθ) ≅ (E, θ).

**Suggested signature coverage.** omitted. Omitted: `IsRigidHiggs.gm_fixed`.

### Rigid Higgs fields are nilpotent

`HodgeStructuresPartII:H.5/rigid-higgs-nilpotent` · theorem · implementation unchecked

Let X be smooth connected projective over ℂ and (V,θ) a rigid stable Higgs bundle of rank r with determinant (L,0). Then the Hitchin image h(V,θ) ∈ A_r = ⊕_{i=2}^{r} H⁰(X, Sym^i Ω¹_X) is zero, the characteristic polynomial of θ is T^r, and θ is nilpotent: every composite θ_{v_1} ∘ ⋯ ∘ θ_{v_r} of r components of θ vanishes, i.e. the joint nilpotence bound r holds (HodgeStructuresPartII:H.0/joint-nilpotence).

**Hypotheses.**

- X smooth connected projective over ℂ; (V,θ) rigid stable, trace-free, determinant (L,0).
- Characteristic zero (the Hitchin coefficients determine nilpotence via Cayley–Hamilton).

**Proof plan.**

- By HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed, (V,tθ) ≅ (V,θ) for all t ∈ ℂ^×, so h(V,θ) = h(V,tθ).
- The Hitchin morphism is 𝔾_m-equivariant with weight i on H⁰(Sym^i Ω¹) (HodgeStructuresPartII:H.1/hitchin-map API scale), so a_i(θ) = t^i a_i(θ) for all t and i ≥ 2, forcing a_i(θ) = 0 (Esnault–Groechenig Lemma 2.1: positive weights).
- At each point x and tangent vector v ∈ T_xX the endomorphism θ(v) ∈ End(V_x) has characteristic polynomial T^r, hence is nilpotent (Mathlib LinearMap.isNilpotent_iff_charpoly); the θ(v) commute because θ ∧ θ = 0, so they are simultaneously strictly triangularizable and any product of r of them vanishes.

**Acceptance.**

- For r = 1 the Higgs field of a rigid object is zero.
- On X with H⁰(X, Sym^i Ω¹) = 0 for all i > 0 every Higgs bundle on M_Dol has nilpotent field (the Hitchin base is a point).

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed`
- `HodgeStructuresPartII:H.1/hitchin-map`
- `HodgeStructuresPartII:H.0/joint-nilpotence`
- `mathlib:LinearMap.isNilpotent_iff_charpoly`

**Sources.**

- EG20, §2.1, Lemma 2.1, p.109: Statement.
- EG20, §2.1, Lemma 2.1 proof, p.109: Positive weights of the Hitchin base.

**Suggested signature coverage.** omitted. Omitted: `IsRigidHiggs.nilpotent`.

### Systems of Hodge bundles

`HodgeStructuresPartII:H.5/system-of-hodge-bundles` · definition · implementation unchecked

Let X be a complex manifold (or smooth variety over a field). A system of Hodge bundles is a Higgs bundle (E,θ) together with a decomposition E = ⊕_{p∈ℤ} E^p into locally free subsheaves, finitely many nonzero, such that θ(E^p) ⊂ E^{p−1} ⊗ Ω¹_X. Morphisms preserve the decomposition and commute with θ; the shift E[k]^p = E^{p+k} is an isomorphism of underlying Higgs bundles. Every system of Hodge bundles is a fixed point of scaling: multiplication by t^p on E^p is an isomorphism (E,tθ) → (E,θ) (equivalently t^{−p} on E^p is an isomorphism (E,θ) → (E,tθ)). The associated graded (⊕_p Gr^p_F E, gr ∇) of a Griffiths-transverse filtration F of a flat bundle (HodgeStructuresPartII:H.0/graded-higgs) is a system of Hodge bundles with E^p = Gr^p_F E.

**Hypotheses.**

- θ is an integrable Higgs field (θ ∧ θ = 0), as in HodgeStructuresPartII:H.0/twisted-higgs with trivial twist.
- The grading is by subbundles (locally free summands), not merely subsheaves.

**Proof plan.**

- Define the structure as a Higgs bundle with a finite ℤ-grading for which θ has degree −1.
- Scaling isomorphism: φ_t = ⊕ t^p·id_{E^p} satisfies φ_t ∘ (tθ) = θ ∘ φ_t, since for e ∈ E^p both sides are t^p θ(e) (θ maps E^p to E^{p−1}, where φ_t is t^{p−1}); so φ_t: (E,tθ) → (E,θ) is a Higgs isomorphism.
- Nilpotence: θ lowers degree by one, so θ^N = 0 when the nonzero degrees lie in an interval of length N − 1; trace zero because θ is off the block diagonal.
- Griffiths transversality ∇F^p ⊂ F^{p−1} ⊗ Ω¹ gives gr ∇: Gr^p_F → Gr^{p−1}_F ⊗ Ω¹, which is O-linear and integrable (HodgeStructuresPartII:H.0/graded-higgs-integrable).

**Acceptance.**

- A Higgs bundle with zero field is a system of Hodge bundles in a single degree.
- The Higgs bundle K^{1/2} ⊕ K^{−1/2} with θ the identity K^{1/2} → K^{−1/2} ⊗ K on a curve of genus ≥ 2 is a system of Hodge bundles with two pieces.
- In the native module chart Ω is finite free. Under this hypothesis commuting contractions detect θ∧θ=0. Without it, over ℤ with Ω=(ℤ/2)², all dual contractions vanish: a degree-lowering field on ℤ³ with θ(e₂)=e₁⊗u, θ(e₁)=e₀⊗v has θ∧θ(e₂)=e₀⊗(v∧u)≠0. The sheaf definition always requires actual exterior-square integrability.

**Uses that determine the API.**

- Simpson, Higgs bundles and local systems, §4 pp.44–45 and Lemma 4.1: Higgs bundles corresponding to complex variations of Hodge structure are exactly the systems of Hodge bundles, and the fixed points of scaling.
- Esnault–Groechenig, Rigid connections and F-isocrystals, Lemma 4.9 and §4.2: The rigid Higgs bundle at λ = 0 of a rigid Hodge family is the graded Higgs bundle (gr_F E, gr_F ∇) of the variation at λ = 1.
- Simpson, The Hodge filtration on nonabelian cohomology, Lemma 7.2: 𝔾_m-equivariant sections of the Hodge moduli correspond to filtered flat bundles satisfying Griffiths transversality.
- HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles, HodgeStructuresPartII:H.5/cvhs-hodge-bundles, HodgeStructuresPartII:H.5/rigid-hodge-splitting: Characterization of scaling-fixed Higgs bundles and the variation correspondence.

**API.**

- `SystemOfHodgeBundles` (structure): A Higgs bundle (E,θ) with a finite decomposition E = ⊕_p E^p into subbundles with θ(E^p) ⊂ E^{p−1} ⊗ Ω¹.
- `SystemOfHodgeBundles.contract` (projection): For a tangent vector v (a covector on Ω¹ in a chart), the component θ_v: E → E of the Higgs field; θ_v maps E^p to E^{p−1}.
- `SystemOfHodgeBundles.scaleIso` (constructor): For t ∈ ℂ^×, the isomorphism (E,tθ) → (E,θ) acting by t^p on E^p, i.e. (φ ⊗ id)(tθ(e)) = θ(φ(e)). Supplied by `HodgeStructuresPartII:H.5/hodge-system-scaling`.
- `SystemOfHodgeBundles.shift` (constructor): The shift E[k], with the same underlying Higgs bundle.
- `SystemOfHodgeBundles.nilpotent` (relation): θ is nilpotent with joint bound the number of nonzero degrees (HodgeStructuresPartII:H.0/joint-nilpotence). Supplied by `HodgeStructuresPartII:H.5/hodge-system-nilpotent`.
- `SystemOfHodgeBundles.trace_eq_zero` (simp): tr θ = 0.
- `SystemOfHodgeBundles.ofGriffiths` (compatibility): The associated graded Higgs bundle of a Griffiths-transverse filtration (HodgeStructuresPartII:H.0/graded-higgs) with E^p = Gr^p_F.
- `SystemOfHodgeBundles.determinant` (projection): det E = ⊗_p det E^p, with determinant Higgs field 0.
- `SystemOfHodgeBundles.hom_graded` (other): Morphisms of systems of Hodge bundles are degree-preserving morphisms of Higgs bundles; for stable underlying Higgs bundles every Higgs isomorphism between systems is graded up to shift (HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles).

**Unit tests.**

- `SystemOfHodgeBundles.test_single_degree` (degenerate): For any vector bundle E, (E, 0) with E = E^0 is a system of Hodge bundles, and every system with a single nonzero degree has θ = 0.
- `SystemOfHodgeBundles.test_uniformizing` (computation): On a compact curve C of genus ≥ 2 with a theta characteristic K^{1/2}, E^1 = K^{1/2}, E^0 = K^{−1/2} and θ: E^1 → E^0 ⊗ K the identity of K^{1/2} form a system of Hodge bundles with θ ≠ 0 and θ² = 0.
- `SystemOfHodgeBundles.test_trace_zero` (characterisation): For every system of Hodge bundles, tr θ = 0 and θ^N = 0 where N is the number of nonzero degrees.
- `SystemOfHodgeBundles.test_nonnilpotent_not_hodge` (non-example): For a nonzero holomorphic 1-form ω on X, (O ⊕ O, diag(ω, −ω)) is a trace-free Higgs bundle whose field is not nilpotent, so it admits no structure of system of Hodge bundles.
- `SystemOfHodgeBundles.test_scale_iso` (characterisation): For a system with degrees {0, 1} and t ∈ ℂ^×, the map t·id on E^1 and id on E^0 is an isomorphism (E,tθ) → (E,θ) (and t⁻¹·id on E^1 an isomorphism (E,θ) → (E,tθ)).

**Direct prerequisites.**

- `HodgeStructuresPartII:H.0/twisted-higgs`
- `HodgeStructuresPartII:H.0/graded-higgs`
- `HodgeStructuresPartII:H.0/graded-higgs-integrable`
- `HodgeStructuresPartII:H.0/joint-nilpotence`
- `HodgeStructuresPartII:H.0/griffiths-filtration`

**Sources.**

- S92, §4, p.44: Definition (θ printed as 6 in the scan).
- S92, §4, p.45: Systems of Hodge bundles are scaling-fixed.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/HodgeBundles`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `SystemOfHodgeBundles`, `SystemOfHodgeBundles.contract`, `SystemOfHodgeBundles.scaleIso`, `SystemOfHodgeBundles.shift`, `SystemOfHodgeBundles.nilpotent`, `SystemOfHodgeBundles.trace_eq_zero`, `SystemOfHodgeBundles.test_single_degree`, `SystemOfHodgeBundles.test_trace_zero`, `SystemOfHodgeBundles.test_nonnilpotent_not_hodge`, `SystemOfHodgeBundles.test_scale_iso`. Omitted: `SystemOfHodgeBundles.ofGriffiths`, `SystemOfHodgeBundles.determinant`, `SystemOfHodgeBundles.hom_graded`, `SystemOfHodgeBundles.test_uniformizing`.

### Scaling-fixed Higgs bundles are systems of Hodge bundles

`HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles` · theorem · implementation unchecked

Let X be a compact connected complex manifold and (E,θ) a Higgs bundle with (E,θ) ≅ (E,tθ) for some t ∈ ℂ^× that is not a root of unity. Then E has a structure of system of Hodge bundles; if (E,θ) is stable, this structure is unique up to shift of indices.

**Hypotheses.**

- X compact and connected, so global holomorphic functions are constant.
- t is not a root of unity.

**Proof plan.**

- Let f: E → E be a holomorphic automorphism with fθ = tθf. The coefficients of its characteristic polynomial are holomorphic functions on X, hence constant, so f has constant eigenvalues and E = ⊕_λ E_λ with E_λ = ker(f − λ)^n (Simpson Lemma 4.1).
- From (f − tλ)^n θ = t^n θ (f − λ)^n, θ maps E_λ into E_{tλ} ⊗ Ω¹.
- Since t is not a root of unity, the eigenvalues split into strings λ₀, tλ₀, …, t^k λ₀ with t⁻¹λ₀ and t^{k+1}λ₀ not eigenvalues; put E^p := ⊕ E_{t^{−p}λ₀} over the strings (index by minus the exponent), so that θ(E^p) ⊂ E^{p−1} ⊗ Ω¹ and f acts by t^{−p}λ₀ on the string through λ₀.
- If (E,θ) is stable, its endomorphisms are scalars, so f is determined up to a scalar and the grading up to a shift.

**Acceptance.**

- A system of Hodge bundles satisfies the hypothesis for every t (HodgeStructuresPartII:H.5/system-of-hodge-bundles).
- The non-nilpotent Higgs bundle (O ⊕ O, diag(ω, −ω)) satisfies the hypothesis for no t that is not a root of unity.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/system-of-hodge-bundles`
- `HodgeStructuresPartII:H.5/hodge-system-scaling`

**Sources.**

- S92, §4, Lemma 4.1, p.45: Statement (OCR of t ∈ ℂ^*).
- S92, §4, proof of Lemma 4.1, p.45: Constant eigenvalues on a compact base.

**Suggested signature coverage.** omitted. Omitted: `SystemOfHodgeBundles.of_scale_iso`.

### Variations of Hodge structure and systems of Hodge bundles

`HodgeStructuresPartII:H.5/cvhs-hodge-bundles` · comparison · implementation unchecked

Let X be a compact Kähler manifold (in this layer, smooth connected projective over ℂ). (a) A polarized complex variation of Hodge structure (V = ⊕_{p+q=w} V^{p,q}, flat D satisfying Griffiths transversality, flat Hermitian form ψ making the decomposition orthogonal, definite of sign (−1)^p on V^{p,q}) supplied by HodgeStructuresPartII:H.2 determines, with the sign-alternated polarization K, a harmonic bundle (HodgeStructuresPartII:H.1/harmonic-bundle) with D = ∂ + ∂̄ + θ + θ̄, whose Higgs bundle is the system of Hodge bundles (⊕_p Gr^p_F, gr_F D) with Gr^p_F = V^{p,w−p} (HodgeStructuresPartII:H.0/graded-higgs). (b) Conversely, under the projective harmonic correspondence (HodgeStructuresPartII:H.1/harmonic-correspondence), the semisimple flat bundle corresponding to a polystable system of Hodge bundles with vanishing rational Chern classes carries a polarized complex variation of Hodge structure whose associated graded is the given system; the structures of polarized complex variation on a semisimple local system correspond bijectively to the structures of system of Hodge bundles on its Higgs bundle. (c) Consequently the semisimple representations of π₁(X) underlying complex variations of Hodge structure are exactly the semisimple ones fixed by the 𝔾_m-action (Simpson Corollary 4.2).

**Hypotheses.**

- X compact Kähler (smooth projective in all uses here).
- Polarized complex variations in the sense of Deligne and Simpson (no real or integral lattice); their carrier, Griffiths transversality and semisimplicity are supplied by HodgeStructuresPartII:H.2 (from ShimuraData:D3).

**Proof plan.**

- (a) Decompose D by type and Hodge degree: Griffiths transversality gives D = ∂ + ∂̄ + θ + θ̄ with θ: V^{p,q} → V^{p−1,q+1} ⊗ A^{1,0}; changing the sign of ψ on alternate V^{p,q} gives a positive metric K, and D″ = ∂̄ + θ is the operator of the harmonic metric K (Simpson 1992 §4 p.44).
- Identify the holomorphic bundle (V, ∂̄) with ⊕_p F^p/F^{p+1} using the C^∞ splitting by the V^{p,q}; then θ is the graded symbol gr_F D (HodgeStructuresPartII:H.0/graded-higgs).
- (b) A system of Hodge bundles is fixed by the U(1) ⊂ ℂ^× action preserving the harmonic metric; the automorphisms t^p on E^p are then unitary for the harmonic metric, so the metric makes the grading orthogonal and D preserves the induced C^∞ decomposition up to θ, θ̄, which is a polarized complex variation (Simpson 1992 §4 and [47] = Simpson 1988 §8). Bijectivity follows from (a) and the uniqueness of the harmonic correspondence.
- (c) Combine (b) with HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles (fixed points are systems of Hodge bundles) and the equivariance of the correspondence for the U(1)-action.

**Acceptance.**

- A unitary local system with a single Hodge degree corresponds to (E, 0).
- The uniformizing variation of a compact curve of genus ≥ 2 corresponds to K^{1/2} ⊕ K^{−1/2} with θ = id.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/system-of-hodge-bundles`
- `HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles`
- `HodgeStructuresPartII:H.0/graded-higgs`
- `HodgeStructuresPartII:H.1/harmonic-bundle`
- `HodgeStructuresPartII:H.1/harmonic-correspondence`
- `HodgeStructuresPartII:H.2/complex-pvhs`
- `HodgeStructuresPartII:H.5/hodge-system-scaling`
- `HodgeStructuresPartII:H.5/hodge-system-nilpotent`

**Sources.**

- S92, §4, p.44: The sign-alternated polarization is a harmonic metric.
- S92, §4, p.44: Bijection of structures.
- S92, §4, Corollary 4.2, p.45: Fixed points of the scaling action.

**Suggested signature coverage.** omitted. Omitted: `cvhs_equiv_hodgeBundles`.

### Rigid local systems underlie complex variations of Hodge structure

`HodgeStructuresPartII:H.5/rigid-underlies-cvhs` · theorem · implementation unchecked

Let X be smooth connected projective over ℂ and (E,∇) a rigid stable flat connection with torsion determinant (L,∇_L) (HodgeStructuresPartII:H.5/rigid-connection). Then (E,∇) underlies a polarized complex variation of Hodge structure: there is a Griffiths-transverse filtration F^• of E (∇F^i ⊂ F^{i−1} ⊗ Ω¹) with polarization, unique up to shift of indices, and the associated graded Higgs bundle (Gr_F E, gr_F ∇) is the rigid stable Higgs bundle corresponding to (E,∇) under HodgeStructuresPartII:H.5/rigid-correspondence. The complex variation need not have a real or integral structure. More generally (Simpson Lemma 4.5) every properly rigid reductive representation of π₁(X) into a reductive group comes from a complex variation of Hodge structure.

**Hypotheses.**

- X smooth connected projective; (E,∇) stable (irreducible) and isolated in M_dR^s(X, r, L).

**Proof plan.**

- The corresponding Higgs bundle (V,θ) is rigid stable (HodgeStructuresPartII:H.5/rigid-correspondence), hence fixed by scaling (HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed).
- By HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles, (V,θ) is a system of Hodge bundles, unique up to shift since it is stable.
- By HodgeStructuresPartII:H.5/cvhs-hodge-bundles (b), the corresponding flat bundle (E,∇) carries a polarized complex variation of Hodge structure with associated graded (V,θ); its Hodge filtration F is Griffiths transverse.
- Uniqueness up to shift: two variation structures give two system-of-Hodge-bundles structures on the stable (V,θ), which differ by a shift.

**Acceptance.**

- In rank one the variation is the unitary character placed in a single degree.
- Every rigid connection has nilpotent graded Higgs field (HodgeStructuresPartII:H.5/rigid-higgs-nilpotent).

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/rigid-connection`
- `HodgeStructuresPartII:H.5/rigid-correspondence`
- `HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed`
- `HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles`
- `HodgeStructuresPartII:H.5/cvhs-hodge-bundles`
- `HodgeStructuresPartII:H.0/griffiths-filtration`

**Sources.**

- S92, §4, Lemma 4.5, p.51: Simpson's theorem.
- EG20, §4.2, Lemma 4.9, p.132: Rigid connections are moduli points of complex variations with Griffiths-transverse filtration and associated graded Higgs bundle.
- EG20, §1, p.104: Context and attribution to Simpson.

**Suggested signature coverage.** omitted. Omitted: `IsRigidConnection.underlies_cvhs`.

### Deformation of representations to complex variations

`HodgeStructuresPartII:H.5/deformation-to-cvhs` · theorem · implementation unchecked

(a) Let X be smooth connected projective over ℂ and G a reductive complex group. Every representation ρ: π₁(X) → G(ℂ) can be deformed, inside Hom(π₁(X), G), to a representation underlying a complex variation of Hodge structure; for G = GL_r and ρ with finite determinant the deformation can be taken with constant determinant. (b) (Mochizuki, as stated by Landesman–Litt Theorem 4.3.1) Let X̄ be smooth projective, D ⊂ X̄ a strict normal crossings divisor and X = X̄ ∖ D. Every ρ: π₁(X) → GL_r(ℂ) with finite determinant admits a deformation with constant determinant to a representation underlying a polarizable complex variation of Hodge structure; the G-version for a reductive Zariski closure (Mochizuki Lemma 10.13) deforms within G.

**Hypotheses.**

- (a) X smooth projective. (b) X quasi-projective with strict normal crossings compactification and finite determinant.
- Part (b) rests on Mochizuki's tame harmonic bundle theory, which no layer of the atlas plans; it is recorded with its hypotheses and a gap.

**Proof plan.**

- (a) Deform ρ to a semisimple representation: put it in block upper triangular form and conjugate by diagonal matrices so the off-diagonal blocks tend to zero (Simpson 1992 Theorem 3 proof; Morozov's one-parameter subgroups for general reductive G).
- For semisimple ρ with corresponding polystable Higgs bundle (V,θ), the points (V, tθ) have Hitchin images t^i a_i → 0 as t → 0; by properness of the semistable Hitchin morphism (HodgeStructuresPartII:H.1/hitchin-properness) a limit point (V₀,θ₀) exists in the same connected component; it is fixed by 𝔾_m.
- By HodgeStructuresPartII:H.5/cvhs-hodge-bundles (c), the corresponding semisimple representation underlies a complex variation; the path t ↦ (V, tθ) and the limit lie in one connected component of the moduli, so ρ deforms to it. Fixed determinant: scaling preserves the determinant (L,0).
- (b) Quasi-projective case: replace the projective harmonic theory by Mochizuki's Kobayashi–Hitchin correspondence for tame harmonic bundles and its Theorem 10.5 / Lemma 10.13; the determinant statement is obtained by examining the proof (Landesman–Litt Theorem 4.3.1 proof). Recorded as a source-gated input.

**Acceptance.**

- A rigid representation, which admits no nontrivial deformation, underlies a complex variation (consistent with HodgeStructuresPartII:H.5/rigid-underlies-cvhs).
- In rank one with finite determinant the deformation is constant.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/cvhs-hodge-bundles`
- `HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed`
- `HodgeStructuresPartII:H.1/hitchin-map`
- `HodgeStructuresPartII:H.1/hitchin-properness`
- `HodgeStructuresPartII:H.1/harmonic-correspondence`
- `HodgeStructuresPartII:H.5/boundary-monodromy-data`

**Sources.**

- S92, §4, Theorem 3, p.52: Projective case.
- LL24, §4.3, Theorem 4.3.1, p.27: Quasi-projective case after Mochizuki.

**Suggested signature coverage.** omitted. Omitted: `deformation_to_cvhs`.

### Strongly cohomologically rigid semisimple representations underlie variations

`HodgeStructuresPartII:H.5/coh-rigid-semisimple-cvhs` · theorem · implementation unchecked

Let X̄ be smooth projective, D ⊂ X̄ a strict normal crossings divisor and X = X̄ ∖ D. Let ρ: π₁(X) → GL_r(ℂ) be semisimple with finite determinant and H¹(X, ad ρ) = 0 (strongly cohomologically rigid, HodgeStructuresPartII:H.5/strong-cohomological-rigidity). Then ρ underlies a polarizable complex variation of Hodge structure on X.

**Hypotheses.**

- ρ semisimple with finite determinant; H¹(X, ad⁰ρ) = 0 on X itself (no boundary condition).
- Uses the G-version of HodgeStructuresPartII:H.5/deformation-to-cvhs (b) for G the Zariski closure of the image.

**Proof plan.**

- Let G be the Zariski closure of ρ(π₁(X)); it is reductive since ρ is semisimple, and g = Lie G ⊂ sl_r because det ρ is finite.
- ad⁰ρ is semisimple, so g is a π₁-stable direct summand of ad⁰ρ and H¹(X, g) ⊂ H¹(X, ad⁰ρ) = 0: ρ is cohomologically rigid as a G-representation.
- Mochizuki's Lemma 10.13 (HodgeStructuresPartII:H.5/deformation-to-cvhs (b), G-version) deforms ρ within Hom(π₁(X), G) to ρ₀ underlying a polarizable complex variation.
- H¹(X, g) = 0 means the G-conjugation orbit of ρ is open in Hom(π₁(X), G); since ρ is semisimple with reductive Zariski closure G, its orbit is also closed (Richardson), so it is a union of connected components of Hom and contains the whole deformation path: ρ₀ is conjugate to ρ and ρ underlies a variation (Landesman–Litt Lemma 4.3.2).

**Acceptance.**

- For X projective this specializes to HodgeStructuresPartII:H.5/rigid-underlies-cvhs for cohomologically rigid irreducible ρ.
- Rank one: finite-order characters underlie variations of a single Hodge type.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/strong-cohomological-rigidity`
- `HodgeStructuresPartII:H.5/deformation-to-cvhs`
- `HodgeStructuresPartII:H.5/trace-free-adjoint`
- `HodgeStructuresPartII:H.2/complex-pvhs`

**Sources.**

- LL24, §4.3, Lemma 4.3.2, p.27: Statement.
- LL24, §4.3, proof of Lemma 4.3.2, p.27: Rigidity kills the deformation.

**Suggested signature coverage.** omitted. Omitted: `IsStronglyCohomologicallyRigid.underlies_pvhs`.

### Unitary representations and local systems

`HodgeStructuresPartII:H.5/unitary-representation` · definition · implementation unchecked

A representation ρ: Γ → GL_r(ℂ) is unitary if its image has compact closure in GL_r(ℂ). Equivalently ρ preserves a positive-definite Hermitian form on ℂ^r, equivalently ρ is GL_r(ℂ)-conjugate to a representation with values in the unitary group U(r) = Matrix.unitaryGroup (Fin r) ℂ. A complex local system (flat bundle) is unitary if its monodromy representation is. Unitarity is a property of a representation into GL_r(ℂ) with its analytic topology, attached to the given embedding of the coefficients in ℂ; it is not preserved by field automorphisms of ℂ.

**Hypotheses.**

- Γ any group; ℂ with its usual topology; the compact-closure and invariant-form definitions agree by averaging over the compact closure with Haar measure.

**Proof plan.**

- For compact closure H, import unitarizability by Haar averaging from Tau Ceti CompactGroups layer 1. Applied to the defining continuous representation of H, it gives an invariant positive-definite Hermitian form; an orthonormal basis conjugates the original representation into U(r). The Haar theorem is supplied by its owner, rather than planned again in this layer.
- Conversely U(r) is compact (TauCeti.Matrix.isCompact_unitaryGroup, from Mathlib's entry bound entry_norm_bound_of_unitary), and conjugation is a homeomorphism, so the closure of the image of a conjugate of a U(r)-valued representation is compact.

**Acceptance.**

- Finite-image representations are unitary.
- A nontrivial unipotent representation is not unitary.

**Uses that determine the API.**

- Landesman–Litt, Canonical representations of surface groups, Notation 1.10.2: Unitary means compact closure; unitary local systems are those preserving a positive-definite Hermitian form.
- Esnault–Groechenig, Rigid connections and F-isocrystals, Theorem 1.8, §6 and Remark 6.2: Rigid connections with vanishing p-curvature have unitary monodromy; unitarity plus strong integrality gives finite monodromy.
- Landesman–Litt, Geometric local systems on very general curves and isomonodromy, Lemma 7.2.1 and Theorem 1.2.12: Unitarity at every embedding of an integral representation gives finiteness; low-rank variations on general curves are unitary.
- HodgeStructuresPartII:H.5/zero-higgs-unitary, HodgeStructuresPartII:H.5/unitary-embeddings-finite, HodgeStructuresPartII:H.5/infinite-image-unitary-example: Consumers.

**API.**

- `IsUnitaryRepresentation` (constructor): IsCompact (closure (Set.range ρ)) for ρ: Γ →* GL (Fin r) ℂ with the topology of matrices.
- `IsUnitaryRepresentation.iff_conj_unitaryGroup` (characterisation): IsUnitaryRepresentation ρ ↔ ∃ P ∈ GL_r(ℂ), ∀ γ, P ρ(γ) P⁻¹ ∈ Matrix.unitaryGroup (Fin r) ℂ. Supplied by `HodgeStructuresPartII:H.5/unitary-conjugation`.
- `IsUnitaryRepresentation.iff_invariant_form` (characterisation): IsUnitaryRepresentation ρ ↔ ρ preserves a positive-definite Hermitian form on ℂ^r. Supplied by `HodgeStructuresPartII:H.5/unitary-invariant-form`.
- `IsUnitaryRepresentation.semisimple` (relation): A unitary representation is semisimple (orthogonal complements of subrepresentations are subrepresentations). Supplied by `HodgeStructuresPartII:H.5/unitary-semisimple`.
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

**Direct prerequisites.**

- `mathlib:Matrix.unitaryGroup`
- `mathlib:entry_norm_bound_of_unitary`
- `tauceti:TauCeti.Matrix.isCompact_unitaryGroup`
- `mathlib:Matrix.GeneralLinearGroup`
- `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-1-unitarizability-weyls-unitarian-trick`

**Sources.**

- LL24, §1.10, Notation 1.10.2, p.11: Definition.
- LL24, §1.10, Notation 1.10.2, p.11: Equivalent characterizations.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Unitary`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `IsUnitaryRepresentation`, `IsUnitaryRepresentation.iff_conj_unitaryGroup`, `IsUnitaryRepresentation.iff_invariant_form`, `IsUnitaryRepresentation.semisimple`, `IsUnitaryRepresentation.of_finite`, `IsUnitaryRepresentation.comp`, `IsUnitaryRepresentation.not_aut_invariant`, `IsUnitaryRepresentation.test_rank_one`, `IsUnitaryRepresentation.test_unipotent`, `IsUnitaryRepresentation.test_finite_image`, `IsUnitaryRepresentation.test_unitaryGroup_valued`, `IsUnitaryRepresentation.test_galois_nonexample`. Omitted: `IsUnitaryRepresentation.dual_iff_conj`.

### Vanishing graded Higgs field characterizes unitary variations

`HodgeStructuresPartII:H.5/zero-higgs-unitary` · theorem · implementation unchecked

Let X be a compact connected Kähler manifold (smooth projective in this layer) and (V, F, ∇, ψ) a polarized complex variation of Hodge structure with associated graded Higgs field θ = gr_F ∇: Gr_F V → Gr_F V ⊗ Ω¹ (its Kodaira–Spencer class). Then θ = 0 if and only if the monodromy of ∇ is unitary. When the underlying local system is irreducible, θ = 0 forces the Hodge filtration to have a single nonzero graded piece. No integral or real structure is assumed.

**Hypotheses.**

- X compact connected Kähler.
- The variation is polarized (Simpson's complex variations carry a flat Hermitian polarization).

**Proof plan.**

- (θ = 0 ⇒ unitary) Write D = ∂ + ∂̄ + θ + θ̄ for the sign-alternated polarization K (HodgeStructuresPartII:H.5/cvhs-hodge-bundles (a)). If θ = 0 then D = ∂ + ∂̄ is the K-unitary connection, so K is a flat positive-definite Hermitian metric and the monodromy is unitary (HodgeStructuresPartII:H.5/unitary-representation).
- (unitary ⇒ θ = 0) A unitary local system is semisimple and its flat invariant metric is harmonic with Higgs field 0. The Hodge metric K is also harmonic, with Higgs field θ. The harmonic Higgs bundle of a semisimple flat bundle is independent of the harmonic metric up to isomorphism (HodgeStructuresPartII:H.1/flat-metric-existence), so (Gr_F V, θ) ≅ (V_hol, 0) and θ = 0.
- Irreducible case: if θ = 0, each F^p is a flat subbundle (Griffiths transversality with zero symbol), so irreducibility leaves a single nonzero Gr^p.

**Acceptance.**

- Rank one: every polarized complex variation of rank one has θ = 0 and is unitary.
- The uniformizing variation of a compact curve of genus ≥ 2 has θ ≠ 0 and its monodromy, a discrete cocompact subgroup of SL_2(ℝ), is not unitary.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/cvhs-hodge-bundles`
- `HodgeStructuresPartII:H.5/unitary-representation`
- `HodgeStructuresPartII:H.1/flat-metric-existence`
- `HodgeStructuresPartII:H.0/graded-higgs`
- `HodgeStructuresPartII:H.2/complex-pvhs`
- `HodgeStructuresPartII:H.5/hodge-system-nilpotent`
- `HodgeStructuresPartII:H.5/unitary-invariant-form`
- `HodgeStructuresPartII:H.5/unitary-semisimple`

**Sources.**

- EG20, §6, p.145: Statement used in the proof of Theorem 6.1.
- EG20, §6, proof of Theorem 6.1, p.146: Direction used by Esnault–Groechenig.

**Suggested signature coverage.** omitted. Omitted: `gradedHiggs_eq_zero_iff_unitary`.

### The rigid locus of the Hodge moduli

`HodgeStructuresPartII:H.5/hodge-rigid-locus` · construction · implementation unchecked

Let X be smooth connected projective over ℂ, L torsion and r ≥ 1, and let q: M_Hod^s(X, r, L) → 𝔸¹ be the stable fixed-determinant Hodge moduli of HodgeStructuresPartII:H.1/hodge-coarse, with fibres M_Dol^s(X,(L,0),r) over 0 and M_dR^s(X,r,L) over 1. The rigid Hodge locus is M^rig_Hod(X, L, r) := RigidLocus q (HodgeStructuresPartII:H.5/rigid-locus), the open subscheme of points isolated in their q-fibre. Its fibre over 0 is M^rig_Dol(X, (L,0), r), its fibre over 1 is M^rig_dR(X, r, L), it is stable under the 𝔾_m-action t·(λ, E, D) = (tλ, E, tD) of HodgeStructuresPartII:H.1/hodge-scaling, and over 𝔾_m ⊂ 𝔸¹ division by λ identifies it with M^rig_dR(X, r, L) × 𝔾_m.

**Hypotheses.**

- X smooth connected projective; stable fixed-determinant moduli on the vanishing-Chern-class component.
- q is of finite type, so the quasi-finite locus is open (Mathlib).

**Proof plan.**

- Apply HodgeStructuresPartII:H.5/rigid-locus to q; points of the locus are the points isolated in their fibre q⁻¹(λ).
- The fibre of an open subscheme is the open subscheme of the fibre on the same points; isolated points of q⁻¹(0) = M_Dol^s and q⁻¹(1) = M_dR^s are their rigid loci.
- q is 𝔾_m-equivariant for the weight-one action on 𝔸¹, and the action maps fibres isomorphically to fibres, so it preserves isolation (RigidLocus.equivariant).
- Over 𝔾_m the isomorphism M_Hod ×_{𝔸¹} 𝔾_m ≅ M_dR × 𝔾_m of HodgeStructuresPartII:H.1/hodge-scaling commutes with the projections to 𝔾_m and hence identifies the quasi-finite loci.

**Acceptance.**

- For r = 1 the locus is 𝔸¹: the only object over λ is (L, λ∇_L).
- For X a compact curve of genus ≥ 2 and r ≥ 2 the locus is empty.

**Uses that determine the API.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, §4.2 and Lemma 4.9: M^rig_Hod is the object that splits as M^rig_Dol × 𝔸¹ and carries the rigid Hodge families.
- Esnault–Groechenig, Rigid connections and F-isocrystals, Proposition 4.10: Arithmetic models of the rigid Hodge locus over S × 𝔸¹ index the Higgs–de Rham flows of §4.
- HodgeStructuresPartII:H.5/rigid-hodge-splitting, HodgeStructuresPartII:H.5/nice-hodge-models: Consumers.

**API.**

- `HodgeRigidLocus` (constructor): RigidLocus of q: M_Hod^s(X, r, L) → 𝔸¹.
- `HodgeRigidLocus.zeroFibre` (projection): Its fibre over 0 is M^rig_Dol(X,(L,0),r).
- `HodgeRigidLocus.oneFibre` (projection): Its fibre over 1 is M^rig_dR(X,r,L).
- `HodgeRigidLocus.gmStable` (instance): The 𝔾_m-action of HodgeStructuresPartII:H.1/hodge-scaling restricts to M^rig_Hod, compatibly with weight one on 𝔸¹.
- `HodgeRigidLocus.nonzeroTrivialization` (equivalence): M^rig_Hod ×_{𝔸¹} 𝔾_m ≅ M^rig_dR × 𝔾_m over 𝔾_m, (λ, E, D) ↦ ((E, λ⁻¹D), λ). Supplied by `HodgeStructuresPartII:H.5/rigid-hodge-nonzero`.
- `HodgeRigidLocus.mem_iff` (characterisation): A point over λ lies in M^rig_Hod iff it is isolated in q⁻¹(λ).

**Unit tests.**

- `HodgeRigidLocus.test_rank_one` (degenerate): For r = 1, M^rig_Hod(X, L, 1) → 𝔸¹ is an isomorphism.
- `HodgeRigidLocus.test_genus_two_empty` (non-example): For X a compact curve of genus g ≥ 2 and r = 2, M^rig_Hod(X, O, 2) is empty, although M_Hod^s(X, 2, O) is nonempty.
- `HodgeRigidLocus.test_fibres` (characterisation): The fibre of M^rig_Hod over 0 is M^rig_Dol(X,(L,0),r) and over 1 is M^rig_dR(X,r,L), as subschemes of the fibres of M_Hod^s.
- `HodgeRigidLocus.test_gm_stable` (characterisation): For t ∈ ℂ^× and a point m of M^rig_Hod over λ, t·m is a point of M^rig_Hod over tλ.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/rigid-locus`
- `HodgeStructuresPartII:H.5/rigid-connection`
- `HodgeStructuresPartII:H.1/hodge-coarse`
- `HodgeStructuresPartII:H.1/hodge-scaling`
- `HodgeStructuresPartII:H.5/rigid-locus-fibre`
- `HodgeStructuresPartII:H.5/rigid-locus-equivariant`

**Sources.**

- EG20, §4.2, p.132: Definition.
- EG20, §4.2, proof of Lemma 4.9, p.132: Nonzero trivialization of the Hodge moduli.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/HodgeLocus`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `HodgeRigidLocus`, `HodgeRigidLocus.zeroFibre`, `HodgeRigidLocus.oneFibre`, `HodgeRigidLocus.gmStable`, `HodgeRigidLocus.nonzeroTrivialization`, `HodgeRigidLocus.mem_iff`, `HodgeRigidLocus.test_rank_one`, `HodgeRigidLocus.test_genus_two_empty`, `HodgeRigidLocus.test_fibres`, `HodgeRigidLocus.test_gm_stable`.

### The rigid Hodge locus splits over the affine line

`HodgeStructuresPartII:H.5/rigid-hodge-splitting` · theorem · implementation unchecked

Let X be smooth connected projective over ℂ, L torsion, r ≥ 1. Then: (i) for every rigid stable flat connection (E,∇) with determinant (L,∇_L), with Hodge filtration F of HodgeStructuresPartII:H.5/rigid-underlies-cvhs, the Rees λ-connection ξ(E, F) = Σ_p λ^{−p} F^p ⊗ ℂ[λ] (HodgeStructuresPartII:H.0/rees-parameter) defines a 𝔾_m-equivariant section σ_E: 𝔸¹ → M^rig_Hod(X, L, r) with σ_E(1) = [(E,∇)] and σ_E(0) = [(Gr_F E, gr_F ∇)]; (ii) M^rig_Hod(X, L, r) → 𝔸¹ is finite and flat, and its reduced subscheme is the disjoint union of the images of the sections σ_E, so (M^rig_Hod)_red ≅ (M^rig_Dol)_red × 𝔸¹ 𝔾_m-equivariantly; (iii) each connected component is finite flat over 𝔸¹ with all fibres isomorphic to the local Artinian ring of M_Dol^s at the corresponding rigid Higgs point; (iv) (Esnault–Groechenig Lemma 4.9) M^rig_Hod(X, L, r) ≅ M^rig_Dol(X, (L,0), r) × 𝔸¹ 𝔾_m-equivariantly over 𝔸¹, the action on the right being scaling of θ times weight one on 𝔸¹, including non-reduced structure (proved here from (iii) by the classification of torsors on [𝔸¹/𝔾_m]); (v) every 𝔾_m-equivariant section of M^rig_Hod over 𝔸¹ is a Rees section of a complex variation of Hodge structure as in (i) (Simpson's Lemma 7.2).

**Hypotheses.**

- X smooth connected projective; stable fixed-determinant moduli on the vanishing-Chern-class component.
- Part (iv) uses, beyond (iii), the description of torsors on [𝔸¹/𝔾_m] by filtered fibre functors and Ziegler's splitting theorem in characteristic 0; these Tannakian inputs are not planned in the atlas (gap G5). Esnault–Groechenig's printed proof omits this step (source issue E-H5-2).

**Proof plan.**

- (i) By HodgeStructuresPartII:H.5/rigid-underlies-cvhs, (E,∇) carries a Griffiths-transverse filtration F with associated graded the rigid Higgs bundle; the Rees construction of HodgeStructuresPartII:H.0/rees-parameter is a λ-connection on X × 𝔸¹ with 𝔾_m-action, fibres (E,∇) at 1 and (Gr_F E, gr_F ∇) at 0, stable at every λ, and fixed determinant (Simpson 1996 Lemma 7.2). Its values over λ ≠ 0 are λ·[(E,∇)], isolated by HodgeStructuresPartII:H.5/hodge-rigid-locus; its value at 0 is rigid by HodgeStructuresPartII:H.5/rigid-correspondence.
- (ii) Over 𝔾_m every point of M^rig_Hod is λ·m with m ∈ M^rig_dR (HodgeStructuresPartII:H.5/hodge-rigid-locus nonzeroTrivialization), hence lies on a section σ_E; at 0 the points are those of M^rig_Dol, which are the values σ_E(0) by the bijection of HodgeStructuresPartII:H.5/rigid-correspondence. Distinct sections are disjoint since their values differ over every λ. So (M^rig_Hod)_red is a finite disjoint union of sections ≅ 𝔸¹, closed in M_Hod^s; M^rig_Hod → 𝔸¹ is therefore finite (finiteness is detected on the reduced subscheme). Flatness is the restriction of HodgeStructuresPartII:H.1/hodge-flatness to the open M^rig_Hod.
- (iii) By HodgeStructuresPartII:H.1/hodge-etale-product, near σ_E(0) the morphism q is étale locally M_Dol^s × 𝔸¹ → 𝔸¹; restricting to quasi-finite loci, the component through σ_E is étale locally Spec(A) × 𝔸¹ with A the local Artinian ring of M_Dol^s at σ_E(0); étale maps between Artinian local schemes with the same residue field are isomorphisms, so all fibres near 0 are ≅ Spec A, and by 𝔾_m-translation all fibres over 𝔾_m.
- (iv) For a component Z with zero fibre Spec A, P = Isom_{𝔸¹}(Spec A × 𝔸¹, Z) is a torsor under the affine algebraic group Aut(A) ⊂ GL(A), étale locally trivial by (iii) and 𝔾_m-equivariant, i.e. an Aut(A)-torsor on Θ = [𝔸¹/𝔾_m]. Vector bundles on Θ are finite filtered vector spaces (Rees), so such a torsor is a filtered fibre functor on Rep(Aut A) over ℂ; Aut(A) is smooth in characteristic 0, so by Ziegler's Theorem 1.3 the filtration is split by a cocharacter μ: 𝔾_m → Aut(A). Hence P ≅ Aut(A) × 𝔸¹ with t·(g, λ) = (μ(t)g, tλ) and Z = P ×^{Aut A} Spec A ≅ Spec A × 𝔸¹ with the diagonal action, μ being the scaling action on the zero fibre. This is the equivariant splitting with its non-reduced structure; Esnault–Groechenig's printed proof goes directly from Simpson's Theorem 9.1 to the conclusion.
- (v) A 𝔾_m-equivariant section s of the coarse space M^rig_Hod agrees with the Rees section σ_{s(1)} of (i) on 𝔾_m(ℂ), since s(t) = t·s(1); 𝔸¹ is reduced and the target is separated, so s = σ_{s(1)}. By (i) and Simpson 1996 Lemma 7.2 (𝔾_m-equivariant λ-connections on X × 𝔸¹ are filtered flat bundles with Griffiths transversality), s comes from a complex variation (HodgeStructuresPartII:H.5/cvhs-hodge-bundles).

**Acceptance.**

- For r = 1, M^rig_Hod = 𝔸¹ = M^rig_Dol × 𝔸¹.
- The number of sections equals the number of rigid connections of rank r with determinant L, which equals the number of rigid stable Higgs bundles.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/hodge-rigid-locus`
- `HodgeStructuresPartII:H.5/rigid-underlies-cvhs`
- `HodgeStructuresPartII:H.5/rigid-correspondence`
- `HodgeStructuresPartII:H.5/cvhs-hodge-bundles`
- `HodgeStructuresPartII:H.5/rigid-finite`
- `HodgeStructuresPartII:H.0/rees-parameter`
- `HodgeStructuresPartII:H.0/rees-specialization`
- `HodgeStructuresPartII:H.1/hodge-etale-product`
- `HodgeStructuresPartII:H.1/hodge-flatness`
- `HodgeStructuresPartII:H.1/hodge-scaling`
- `HodgeStructuresPartII:H.5/rigid-hodge-nonzero`

**Sources.**

- EG20, §4.2, Lemma 4.9, p.132: Statement of the splitting (𝔾_m and 𝔸¹ superscripts displaced in the text layer).
- EG20, §4.2, proof of Lemma 4.9, p.132: The printed proof rests on Simpson's étale local product.
- S96, §7, Lemma 7.2, preprint p.33: Equivariant sections are filtered flat bundles.
- S96, §9, Theorem 9.1, preprint p.39: Simpson's étale local product.
- Z15, §1, Theorem 1.3, p.2: Splitting of filtered fibre functors, used for the equivariant product in (iv).

**Suggested signature coverage.** omitted. Omitted: `HodgeRigidLocus.splitting`.

## H.5c. Arithmetic models of rigid loci

### Smooth arithmetic models of a pointed projective variety with torsion line bundle

`HodgeStructuresPartII:H.5/smooth-arithmetic-model` · construction · implementation unchecked

Let X be a smooth connected projective complex variety, x ∈ X(ℂ) and L a line bundle of finite order d with a chosen isomorphism ι: L^{⊗d} ≅ O_X. An arithmetic model of (X, x, L, ι) consists of a finitely generated subring R̃ ⊂ ℂ with S = Spec R̃ smooth over Spec ℤ (so S is integral with generic point η and an embedding κ(η) ⊂ ℂ), a smooth projective morphism X_S → S with geometrically connected fibres, a section x_S, a line bundle L_S on X_S, an isomorphism ι_S: L_S^{⊗d} ≅ O_{X_S}, and an isomorphism Spec ℂ ×_S X_S ≅ X carrying x_S, L_S and ι_S to x, L and ι; moreover d is invertible on S. Every (X, x, L, ι) has an arithmetic model, any two are dominated by a common one (the finitely generated subrings of ℂ form a directed system with colimit ℂ), and the restriction of a model to a nonempty principal open S′ = Spec R̃[1/f], f ≠ 0 is again a model. The model carries the canonical flat structure ∇_{L_S} on L_S determined by ι_S (relative connection whose d-th power is d), spreading the flat determinant (L, ∇_L) used in HodgeStructuresPartII:H.5/rigid-connection. When X is only quasi-projective with good compactification X̄ ⊃ D, the model also spreads X̄ and D to a smooth projective X̄_S with relative strict normal crossings divisor D_S.

**Hypotheses.**

- X smooth connected projective over ℂ (or quasi-projective with a good compactification for the boundary version).
- The limit theorems of EGA IV §8 for finitely presented schemes, morphisms, quasi-coherent modules and the properties smooth, projective, geometrically connected, and openness of the smooth locus (EGA IV 17.7.8), are requested from SchemeAndStackFoundations:SF.0; Mathlib supplies the morphism part (Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType).

**Proof plan.**

- Choose a projective embedding X ⊂ ℙ^N_ℂ and the subring R ⊂ ℂ generated by the coefficients of finitely many defining equations; X_R ⊂ ℙ^N_R satisfies X_R ×_R ℂ ≅ X (Esnault–Groechenig Lemma 3.1 proof).
- ℂ is the filtered colimit of finitely generated subrings R ⊂ ℂ; by EGA IV 8.8.2(ii), 8.10.5(xiii) (projectivity) and 17.7.8(ii) (smoothness) the model can be taken smooth and projective, and by 8.5.2(i), 8.5.5 the line bundle L, the isomorphism ι and the point x spread out (request SchemeAndStackFoundations:SF.0).
- Invert finitely many elements so that R̃ is smooth over ℤ (generic smoothness of finite-type ℤ-algebras in characteristic zero) and d ∈ R̃^×; the d-th-root connection on L_S is the unique relative connection whose d-th tensor power corresponds to d under ι_S (HodgeStructuresPartII:H.1/torsion-determinant-dictionary).
- Directedness and shrinking: two finitely generated subrings are contained in a third; inverting a nonzero element keeps the generic point and the embedding into ℂ.

**Acceptance.**

- ℙⁿ_ℂ with L = O has the model ℙⁿ_ℤ over S = Spec ℤ.
- The model can always be shrunk to avoid finitely many primes.

**Uses that determine the API.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, Lemma 3.1 and §3.1: Arithmetic models (X_S, L_S) over which the relative moduli and rigid loci are spread; closed points of S give reductions modulo p.
- Esnault–Groechenig, Cohomologically rigid local systems and integrality, §3: A model over a connected regular S of finite type over ℤ with smooth projective X̄_S, relative normal crossings D_S and a section x_S is used to specialize local systems to characteristic p.
- HodgeStructuresPartII:H.5/relative-moduli, HodgeStructuresPartII:H.5/simultaneous-spreading, HodgeStructuresPartII:H.5/nice-hodge-models, HodgeStructuresPartII:H.5/integrality-EG18: Consumers.
- Crystalline Cartier-flow and rigid-companion successors of Esnault–Groechenig (CrystallineCohomologyPartIICartierFlows, PadicDifferentialEquationsPartIIRigidCompanions; not yet designed): Reductions of rigid connections modulo closed points of S, W₂-lifts from smoothness of S over ℤ, and Frobenius structures are taken on these models.

**API.**

- `ArithmeticModel` (structure): The data (R̃ ⊂ ℂ, S, X_S → S, x_S, L_S, ι_S, generic-fibre isomorphism) with S smooth over ℤ, X_S smooth projective with geometrically connected fibres and d ∈ R̃^×.
- `ArithmeticModel.exists` (constructor): Every (X, x, L, ι) has an arithmetic model.
- `ArithmeticModel.restrict` (functoriality): Restriction to a nonempty principal open Spec R̃[1/f], f ≠ 0, is again an arithmetic model with the same complex fibre. In any nonempty open one may choose such a principal open for subsequent shrinking; arbitrary opens of an affine scheme need not be affine.
- `ArithmeticModel.dominate` (relation): Any two arithmetic models of (X, x, L, ι) become isomorphic after base change to a common finitely generated subring R̃₃ ⊂ ℂ containing both coefficient rings, followed by inverting finitely many nonzero elements.
- `ArithmeticModel.spread_hom` (universal-property): Morphisms, sections and isomorphisms of finitely presented objects over X extend over some restriction of S, uniquely after further shrinking (EGA IV 8.8.2(i), Mathlib Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType). Supplied by `HodgeStructuresPartII:H.5/arithmetic-spread-morphisms`.
- `ArithmeticModel.genericFibreIso` (projection): Spec ℂ ×_S X_S ≅ X.
- `ArithmeticModel.closedPoint_finite_residue` (other): Closed points s ∈ S have finite residue fields κ(s) of characteristic p, and smoothness of S over ℤ lifts s to W₂(κ(s)).
- `ArithmeticModel.flatDeterminant` (data): The relative flat connection ∇_{L_S} on L_S determined by ι_S, restricting to ∇_L on X.

**Unit tests.**

- `ArithmeticModel.test_projective_space` (computation): For X = ℙⁿ_ℂ, x = [1:0:⋯:0], L = O and ι = id, (S = Spec ℤ, X_S = ℙⁿ_ℤ) is an arithmetic model.
- `ArithmeticModel.test_legendre` (computation): For the elliptic curve y² = x(x − 1)(x − λ) with λ ∈ ℂ transcendental, R̃ = ℤ[λ, 1/(2λ(1 − λ))] gives an arithmetic model with X_S the Legendre family.
- `ArithmeticModel.test_must_invert` (non-example): For the curve y² = x³ − x over ℂ, the integral model Proj ℤ[x,y,z]/(y²z − x³ + xz²) is not smooth over Spec ℤ at the prime 2, so 2 must be inverted: the model over Spec ℤ itself is not an arithmetic model.
- `ArithmeticModel.test_shrink` (characterisation): If (S, X_S, …) is an arithmetic model and 0 ≠ f ∈ R̃, then the restriction to Spec R̃[1/f] is an arithmetic model.
- `ArithmeticModel.test_generic_fibre` (compatibility): The base change of X_S along Spec ℂ → S is isomorphic to X as a ℂ-scheme, compatibly with x, L and ι.

**Direct prerequisites.**

- `SchemeAndStackFoundations:SF.0`
- `mathlib:AlgebraicGeometry.Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType`
- `HodgeStructuresPartII:H.1/torsion-determinant-dictionary`
- `HodgeStructuresPartII:H.5/boundary-monodromy-data`

**Sources.**

- EG20, §3.1, Lemma 3.1, p.122: Smoothness of the base.
- EG20, §3.1, proof of Lemma 3.1, p.122: Spreading smoothness and projectivity (EGA IV 8.8.2, 8.10.5).
- EG18, §3, p.6: Models with compactification, boundary and base point.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/ArithmeticModel`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `ArithmeticModel`, `ArithmeticModel.exists`, `ArithmeticModel.restrict`, `ArithmeticModel.genericFibreIso`, `ArithmeticModel.test_generic_fibre`. Omitted: `ArithmeticModel.dominate`, `ArithmeticModel.spread_hom`, `ArithmeticModel.closedPoint_finite_residue`, `ArithmeticModel.flatDeterminant`, `ArithmeticModel.test_projective_space`, `ArithmeticModel.test_legendre`, `ArithmeticModel.test_must_invert`, `ArithmeticModel.test_shrink`.
Native arithmetic model has smooth proper geometric data only. Projectivity, the torsion determinant and its flat connection remain in the omission inventory; this row is partial.

### Relative moduli of connections, Higgs bundles and λ-connections over arithmetic bases

`HodgeStructuresPartII:H.5/relative-moduli` · construction · implementation unchecked

Let (S, X_S, L_S) be an arithmetic model (HodgeStructuresPartII:H.5/smooth-arithmetic-model) and r ≥ 1. For Λ the split almost-polynomial sheaf of rings of differential operators on X_S/S of integrable connections (the full filtered algebra of crystalline differential operators, generated by its order-zero and order-one pieces), of Higgs fields (Sym T_{X_S/S}), or of λ-connections on X_S × 𝔸¹/S × 𝔸¹, there are quasi-projective S-schemes (respectively S × 𝔸¹-schemes) of finite type M_dR(X_S/S, r), M_Dol(X_S/S, r) and M_Hod(X_S/S, r) which uniformly corepresent the functors of families of Gieseker semistable Λ-modules with Hilbert polynomial r·P_O, with open subschemes M^s universally corepresenting the geometrically stable families (Langer Theorem 1.1). The fixed-determinant schemes M(X_S/S, L_S, r) are the fibres of the determinant morphism over the section (L_S, λ∇_{L_S}); on the stable opens they universally corepresent the geometrically stable families with that determinant, and in general their geometric points biject with S-equivalence classes on the geometric fibres. For every locally Noetherian S-scheme T there is a morphism φ_T: M(X_S/S) ×_S T → M(X_T/T), a bijection on points when T is a geometric point, and an isomorphism on the stable opens; in particular the base change of M^s along Spec ℂ → S is the stable fixed-determinant moduli of HodgeStructuresPartII:H.1/derham-coarse, HodgeStructuresPartII:H.1/dolbeault-coarse and HodgeStructuresPartII:H.1/hodge-coarse. The relative rigid loci are taken inside the stable opens: M^rig(X_S/S, L_S, r) := RigidLocus of M^s(X_S/S, L_S, r) → S (HodgeStructuresPartII:H.5/rigid-locus), and M^rig_Hod(X_S/S, L_S, r) := RigidLocus of M_Hod^s(X_S/S, L_S, r) → S × 𝔸¹. Isolated strictly polystable points of the semistable moduli (such as [O², d] on ℙ¹) are excluded. Notation M(X_S/S, L_S, ≤ r) = ⊔_{r′ ≤ r} M(X_S/S, L_S, r′).

**Hypotheses.**

- S of finite type over ℤ (a universally Japanese ring), X_S → S projective with geometrically connected fibres and a relatively very ample O(1).
- Boundedness of semistable Λ-modules in positive and mixed characteristic (Langer) and GIT over a universally Japanese base (Seshadri) are the inputs; the GIT part is requested from AlgebraicModuliForArithmeticGeometry:R09.5 and R09.2, and Langer's boundedness is recorded as a gap.
- Over geometric points of positive characteristic, M_dR is a moduli of Λ-modules for crystalline differential operators; it is not asserted to be related to M_Dol by a homeomorphism.

**Proof plan.**

- Langer Theorem 1.1, combining Simpson Moduli I Theorem 4.7 with Langer's boundedness theorems: bound the family of semistable Λ-modules, rigidify by framed global sections in a Quot scheme, and take the GIT quotient by GL_N over S (Seshadri's GIT over universally Japanese bases).
- Determinant: the determinant map to the relative Picard scheme (with its relative connection) is a morphism; its fibre over the section (L_S, λ∇_{L_S}) is the fixed-determinant moduli. Over bases with points of positive characteristic GL_N is not linearly reductive, so this fibre is claimed to corepresent the fixed-determinant functor only on the stable open (where the parameter scheme is a PGL_N-torsor over M^s); on the semistable locus only the bijection on geometric points is used.
- Generic fibre: the stable opens universally corepresent the stable functors, so their base change along Spec ℂ → S corepresents the stable functor over ℂ and is therefore the stable moduli of H.1.
- Rigid loci: apply HodgeStructuresPartII:H.5/rigid-locus to the structure maps of the stable opens to S (and S × 𝔸¹). Fibres: by universal corepresentability, M^s ×_S T ≅ M^s(X_T/T) for every T, and isolation of a point in a fibre is invariant under field extension, so the rigid points of M^s over the generic point η correspond to the rigid objects over ℂ.

**Acceptance.**

- For r = 1 each fixed-determinant moduli is the base (one object).
- Over a geometric point s the points of M(X_S/S) are the S-equivalence classes of semistable objects on X_s.

**Uses that determine the API.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, §3.1 and §4.2: Quasi-projective moduli S-schemes M_dR(X_S/S, L_S, r), M_Dol(X_S/S, L_S, r) and an S-model of Simpson's Hodge moduli over S × 𝔸¹ via Langer's construction.
- Langer, Semistable modules over Lie algebroids in positive characteristic, Theorem 1.1: Existence of relative moduli of Λ-modules over bases of finite type over a universally Japanese ring.
- HodgeStructuresPartII:H.5/simultaneous-spreading, HodgeStructuresPartII:H.5/rigid-locus-exhaustion, HodgeStructuresPartII:H.5/nice-hodge-models: The sections and rigid loci of the nice models live here.
- Crystalline Cartier-flow successor of Esnault–Groechenig (CrystallineCohomologyPartIICartierFlows, not yet designed): Higgs–de Rham flows and the Ogus–Vologodsky correspondence act on the closed fibres of these relative moduli.

**API.**

- `RelativeModuli.deRham` (constructor): The quasi-projective S-scheme M_dR(X_S/S, L_S, r) of finite type.
- `RelativeModuli.dolbeault` (constructor): The quasi-projective S-scheme M_Dol(X_S/S, L_S, r) of finite type.
- `RelativeModuli.hodge` (constructor): The quasi-projective S × 𝔸¹-scheme M_Hod(X_S/S, L_S, r): over S × 𝔾_m it is M_dR × 𝔾_m by rescaling, and the λ = 0 fibre maps to M_Dol(X_S/S, L_S, r) by a morphism that is bijective on geometric points (an isomorphism over ℚ, HodgeStructuresPartII:H.1/hodge-coarse).
- `RelativeModuli.corepresents` (universal-property): Uniform corepresentation of the family functor; universal corepresentation on the stable open.
- `RelativeModuli.baseChange` (functoriality): For locally Noetherian T → S the morphism φ_T: M(X_S/S) ×_S T → M(X_T/T), bijective on points for geometric T.
- `RelativeModuli.stableGenericIso` (compatibility): The stable open base-changes to the stable moduli of HodgeStructuresPartII:H.1/derham-coarse, HodgeStructuresPartII:H.1/dolbeault-coarse, HodgeStructuresPartII:H.1/hodge-coarse over ℂ. Supplied by `HodgeStructuresPartII:H.5/relative-stable-complex-fibre`.
- `RelativeModuli.rigidLocus` (projection): M^rig(X_S/S, L_S, r) := RigidLocus of the structure morphism of the stable open M^s(X_S/S, L_S, r).
- `RelativeModuli.leRank` (other): M(X_S/S, L_S, ≤ r) := ⊔_{r′ ≤ r} M(X_S/S, L_S, r′).

**Unit tests.**

- `RelativeModuli.test_rank_one` (degenerate): For r = 1, M_dR(X_S/S, L_S, 1) → S and M_Dol(X_S/S, L_S, 1) → S are isomorphisms (the single object (L_S, ∇_{L_S}), respectively (L_S, 0)).
- `RelativeModuli.test_geometric_points` (characterisation): For a geometric point s̄ of S, φ_{s̄} is a bijection between the s̄-points of M_dR(X_S/S, L_S, r) and the S-equivalence classes of semistable flat connections of rank r with determinant (L_s̄, ∇) on X_s̄.
- `RelativeModuli.test_generic_stable` (compatibility): The base change of the stable open M^s_dR(X_S/S, L_S, r) along Spec ℂ → S is isomorphic to M^s_dR(X, r, L) of HodgeStructuresPartII:H.1/derham-coarse.
- `RelativeModuli.test_unfixed_determinant` (non-example): For an elliptic curve E_S → S and r = 1, fixing only the underlying line bundle O of the determinant gives the positive-dimensional family of relative connections d + a·ω (ω a relative invariant differential, a ∈ O_S), while the fixed-determinant moduli M_dR(E_S/S, O, 1) is S itself.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/smooth-arithmetic-model`
- `HodgeStructuresPartII:H.5/rigid-locus`
- `HodgeStructuresPartII:H.1/operator-git`
- `HodgeStructuresPartII:H.1/operator-boundedness`
- `HodgeStructuresPartII:H.1/derham-coarse`
- `HodgeStructuresPartII:H.1/dolbeault-coarse`
- `HodgeStructuresPartII:H.1/hodge-coarse`
- `AlgebraicModuliForArithmeticGeometry:R09.5`
- `AlgebraicModuliForArithmeticGeometry:R09.2`
- `HodgeStructuresPartII:H.5/rigid-locus-fibre`

**Sources.**

- Langer14, §1, Theorem 1.1, p.4: Existence of relative moduli of Λ-modules.
- Langer14, §1, Theorem 1.1, p.4: Geometric points.
- EG20, §3.1, p.122: Use of Langer's moduli over arithmetic bases with geometric-point base change only.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/RelativeModuli`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `RelativeModuli.deRham`, `RelativeModuli.dolbeault`, `RelativeModuli.hodge`, `RelativeModuli.corepresents`, `RelativeModuli.baseChange`, `RelativeModuli.stableGenericIso`, `RelativeModuli.rigidLocus`, `RelativeModuli.leRank`, `RelativeModuli.test_rank_one`, `RelativeModuli.test_geometric_points`, `RelativeModuli.test_generic_stable`, `RelativeModuli.test_unfixed_determinant`.

### Simultaneous spreading of rigid objects

`HodgeStructuresPartII:H.5/simultaneous-spreading` · theorem · implementation unchecked

Let X be smooth connected projective over ℂ, L torsion and r ≥ 1. There is an affine arithmetic model (S, X_S, L_S) (HodgeStructuresPartII:H.5/smooth-arithmetic-model) such that (a) every rigid flat connection (E,∇) on X with determinant L and rank ≤ r spreads to a relative flat connection (E_S, ∇_S) on X_S/S with determinant (L_S, ∇_{L_S}) which is P-stable over every geometric point of S; (b) every rigid stable Higgs bundle (V,θ) on X with determinant (L,0) and rank ≤ r spreads to a relative Higgs bundle (V_S, θ_S) on X_S/S, P-stable over every geometric point.

**Hypotheses.**

- Finitely many rigid objects of rank ≤ r with determinant L (HodgeStructuresPartII:H.5/rigid-finite) — finiteness comes from the isolated components of finite-type moduli, not from finiteness of all stable objects.
- EGA IV §8 spreading of finitely presented modules and morphisms (request SchemeAndStackFoundations:SF.0) and openness of geometric stability in families (HodgeStructuresPartII:H.5/relative-moduli: the stable locus is open).

**Proof plan.**

- X is the limit of the models X_R over finitely generated subrings R̃ ⊂ R ⊂ ℂ; each of the finitely many rigid objects is a finitely presented module with a differential operator (connection) or O-linear map (Higgs field) and spreads to some X_R with its integrability and determinant identities (EGA IV 8.5.2(i), 8.5.5).
- Take R containing all the finitely many coefficient rings (directedness of the system).
- Geometric P-stability is an open condition on the base for an S-flat family of Λ-modules (openness of semistability and of geometric stability in flat families, a consequence of boundedness and properness of the relative Quot scheme of destabilizing quotients, Simpson Moduli I §3 and Langer; inputs of HodgeStructuresPartII:H.5/relative-moduli, gap G3), and holds at the generic point, so it holds after shrinking S.

**Acceptance.**

- In rank one the spreading is (L_S, ∇_{L_S}) and (L_S, 0).
- The same S works for all ranks r′ ≤ r.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/smooth-arithmetic-model`
- `HodgeStructuresPartII:H.5/relative-moduli`
- `HodgeStructuresPartII:H.5/rigid-finite`
- `HodgeStructuresPartII:H.5/rigid-connection`
- `SchemeAndStackFoundations:SF.0`
- `HodgeStructuresPartII:H.5/arithmetic-spread-morphisms`
- `HodgeStructuresPartII:H.5/relative-stable-complex-fibre`

**Sources.**

- EG20, §3.1, Proposition 3.3(a), p.123: Statement (a).
- EG20, §3.1, proof of Proposition 3.3, p.124: Finiteness input.
- EG20, §3.1, proof of Proposition 3.3, p.124: Openness of stability.

**Suggested signature coverage.** omitted. Omitted: `ArithmeticModel.exists_spreading`.

### Nilpotent and relatively rigid models

`HodgeStructuresPartII:H.5/nilpotent-rigid-models` · theorem · implementation unchecked

In HodgeStructuresPartII:H.5/simultaneous-spreading, after shrinking S: (c) every spread Higgs field is nilpotent, θ_S^{r} = 0 (all products of r components of θ_S vanish); (d) the sections [E_S, ∇_S]: S → M_dR(X_S/S, L_S, ≤ r) and [V_S, θ_S]: S → M_Dol(X_S/S, L_S, ≤ r) factor through the relative rigid loci M^rig_dR(X_S/S, L_S, ≤ r) and M^rig_Dol(X_S/S, L_S, ≤ r).

**Hypotheses.**

- As in HodgeStructuresPartII:H.5/simultaneous-spreading; S integral with generic point η, κ(η) ⊂ ℂ.

**Proof plan.**

- (c) θ^r = 0 over ℂ by HodgeStructuresPartII:H.5/rigid-higgs-nilpotent; an identity between morphisms of finitely presented modules that holds on the limit holds over some R (EGA IV 8.5.2(i)), so θ_R^r = 0 after enlarging R.
- (d) The rigid loci are open (HodgeStructuresPartII:H.5/rigid-locus). The section s_i associated with a spread rigid object lands in the stable open and sends η to a point whose base change to ℂ is the rigid point [(E_i,∇_i)]; isolation in a fibre is invariant under the field extension κ(η) ⊂ ℂ and M^s ×_S Spec ℂ ≅ M^s(X/ℂ), so s_i(η) is isolated in its fibre and s_i(η) ∈ M^rig. The preimage U = ∩ s_i⁻¹(M^rig) is open and contains η, so nonempty; replace S by U (Esnault–Groechenig Proposition 3.3 proof).

**Acceptance.**

- The relative rigid locus is open and in general not closed, so shrinking is necessary.
- After (c), every closed fibre (V_s, θ_s) has nilpotent Higgs field, the input to the Ogus–Vologodsky transform in characteristic p ≥ r + 2.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/simultaneous-spreading`
- `HodgeStructuresPartII:H.5/rigid-higgs-nilpotent`
- `HodgeStructuresPartII:H.5/rigid-locus`
- `HodgeStructuresPartII:H.5/relative-moduli`
- `SchemeAndStackFoundations:SF.0`
- `HodgeStructuresPartII:H.5/arithmetic-spread-morphisms`

**Sources.**

- EG20, §3.1, Proposition 3.3(c), p.123: Statement (c).
- EG20, §3.1, proof of Proposition 3.3, p.124: Shrinking to factor through the open rigid locus.

**Suggested signature coverage.** omitted. Omitted: `ArithmeticModel.exists_nilpotent_rigid`.

### Rigid loci are exhausted by the spread sections

`HodgeStructuresPartII:H.5/rigid-locus-exhaustion` · theorem · implementation unchecked

In HodgeStructuresPartII:H.5/nilpotent-rigid-models, after further shrinking S: the finitely many sections s_1, …, s_N: S → M^rig_dR(X_S/S, L_S, ≤ r) of the spread rigid connections are pairwise disjoint and |M^rig_dR(X_S/S, L_S, ≤ r)| = ∪_i s_i(|S|); the same holds for M^rig_Dol(X_S/S, L_S, ≤ r). Thus every geometric fibre M^rig_dR(X_s̄/s̄, L_s̄, ≤ r) has exactly N points, one on each section, and over the generic point these are the N rigid connections over ℂ. Local multiplicities (lengths of local rings) are part of the rigid locus and are retained.

**Hypotheses.**

- As in HodgeStructuresPartII:H.5/nilpotent-rigid-models; S of finite type over ℤ, hence excellent, so relative normalization is finite.
- Zariski's main theorem in the form of EGA IV 8.12.6 (a quasi-finite, separated, finitely presented morphism factors as an open immersion into a finite S-scheme), requested from SchemeAndStackFoundations:SF.0; equivalently Mathlib's Zariski main theorem applied to the reduction (M^rig)_red, whose relative normalization over the Nagata base S is finite. The conclusion is set-theoretic, so the reduction suffices; the integral normalization of the non-reduced M^rig itself need not be finite.
- M^rig is the rigid locus of the stable open (HodgeStructuresPartII:H.5/relative-moduli); isolated strictly polystable points are not part of it.

**Proof plan.**

- By construction ∪_i {s_i(η)} = M^rig_dR(X_S/S, L_S, ≤ r) ×_S η (the generic fibre's rigid points are exactly the N rigid connections, by the bijection on geometric points of HodgeStructuresPartII:H.5/relative-moduli).
- Zariski's main theorem factors (M^rig)_red → S as an open immersion into a scheme M̃ finite over S, with M^rig dense in M̃ (Esnault–Groechenig cite EGA IV 8.12.6; Mathlib's ZariskisMainTheorem).
- In the finite reduced compactification M̃ → S, the generic-fibre points are generic points of the horizontal irreducible components. Density of M^rig puts every such point in M^rig, so each is s_i(η). The corresponding horizontal component is the closure of this point and is exactly the closed image s_i(S). Thus the complement Z of the section images is contained in the finite union of the remaining, vertical components. Its closure Z̄ misses the generic fibre. The image h(Z̄) is closed by finiteness and misses η. Choose a nonempty principal open of S outside it; the sections then exhaust the rigid locus. Finiteness does not imply h(Z) closed when Z is open. See source issue HodgeStructuresPartII/E-H5-6.
- Disjointness: for i ≠ j the equalizer of s_i and s_j is closed in S (sections of a separated morphism) and does not contain η, since s_i(η) ≠ s_j(η); remove the finitely many equalizers.

**Acceptance.**

- For r = 1 there is one section, an isomorphism S ≅ M^rig.
- After the shrinking, the number of rigid objects on each geometric fibre is the complex count N.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/nilpotent-rigid-models`
- `HodgeStructuresPartII:H.5/relative-moduli`
- `HodgeStructuresPartII:H.5/rigid-locus`
- `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteLocus`
- `SchemeAndStackFoundations:SF.0`
- `HodgeStructuresPartII:H.5/relative-stable-complex-fibre`

**Sources.**

- EG20, §3.1, Proposition 3.3(e), p.123: Statement (e); the superscript rig is displaced in the text layer.
- EG20, §3.1, proof of Proposition 3.3, p.124: Zariski's main theorem.
- EG20, §3.1, proof of Proposition 3.3, p.125: Removing the image of the boundary.

**Suggested signature coverage.** omitted. Omitted: `ArithmeticModel.exists_exhaustion`.

### Nice models of the rigid Hodge loci for all determinant powers

`HodgeStructuresPartII:H.5/nice-hodge-models` · theorem · implementation unchecked

Let X be smooth connected projective over ℂ, L torsion of exact order d and r ≥ 1. There are an affine arithmetic model (S, X_S, L_S) and finitely many λ-connections (N_S^i, D_S^i), i = 1, …, M, on X_S × 𝔸¹_S relative to λ = pr₂, geometrically P-stable, with determinants (L_S^{a(i)}, λ∇) for some 0 ≤ a(i) < d, such that (a) all conclusions of HodgeStructuresPartII:H.5/simultaneous-spreading, HodgeStructuresPartII:H.5/nilpotent-rigid-models and HodgeStructuresPartII:H.5/rigid-locus-exhaustion hold for every determinant L^a, 0 ≤ a ≤ d − 1; (b) each (N_S^i, D_S^i) can moreover be chosen 𝔾_m-equivariant, the spread Rees λ-connection of a rigid variation, with fibre at λ = 1 a spread rigid connection and at λ = 0 its associated graded rigid Higgs bundle (Esnault–Groechenig state (b) without the equivariance; this plan chooses the Rees families of HodgeStructuresPartII:H.5/rigid-hodge-splitting (i)); (c) the sections give a bijection ⊔_{i=1}^{M} [(N_S^i, D_S^i)](|S × 𝔸¹|) = ⊔_{a=0}^{d−1} |M^rig_Hod(X_S/S, L_S^a, ≤ r)|, the rigid Hodge loci being taken in the stable opens (HodgeStructuresPartII:H.5/relative-moduli). In particular the number n_L of rank-r rigid connections with determinant among L^0, …, L^{d−1} equals the number of rank-r rigid stable Higgs bundles with those determinants and indexes the sections at λ = 0 and λ = 1. (Indices as corrected in source issue E-H5-1.)

**Hypotheses.**

- As in HodgeStructuresPartII:H.5/rigid-locus-exhaustion, applied simultaneously to the d determinants L^a.
- The Hodge-moduli statements use HodgeStructuresPartII:H.5/rigid-hodge-splitting over ℂ and the relative Hodge moduli of HodgeStructuresPartII:H.5/relative-moduli.

**Proof plan.**

- Over ℂ, each rigid connection carries the Rees λ-connection of its Hodge filtration (HodgeStructuresPartII:H.5/rigid-hodge-splitting (i)); there are finitely many: M = Σ_{r′ ≤ r} n_L(r′), the rank-r sections being indexed by the n_L rank-r rigid connections.
- Spread the finitely many λ-connections with their 𝔾_m-structures to X_S × 𝔸¹_S and shrink S to keep geometric stability, as in HodgeStructuresPartII:H.5/simultaneous-spreading.
- Shrinking must be done in S, not in S × 𝔸¹, whose projection to S is not closed. By HodgeStructuresPartII:H.5/rigid-hodge-splitting (ii) over all of {η} × 𝔸¹, the rigid Hodge locus over {η} × 𝔸¹ is the union of the σ_i(η × 𝔸¹). The loci where a section leaves the rigid locus, where two sections meet, and the closure Z̄ of the complement of the sections in the finite completion M̃ of (M^rig_Hod)_red over S × 𝔸¹ all have images in S × 𝔸¹ that miss {η} × 𝔸¹; their projections to S are constructible and miss η, so removing their closures from S gives the model, as in HodgeStructuresPartII:H.5/rigid-locus-exhaustion.
- The count: by HodgeStructuresPartII:H.5/rigid-correspondence the rigid connections and rigid Higgs bundles of each determinant L^a are in bijection; the zero fibres of the sections are the Higgs bundles.

**Acceptance.**

- For r = 1, M = d and the sections are (L_S^a, λ∇); in general M = Σ_{r′ ≤ r} n_L(r′).
- The corrected index set runs over a = 0, …, d − 1 with L^a in each term.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/simultaneous-spreading`
- `HodgeStructuresPartII:H.5/nilpotent-rigid-models`
- `HodgeStructuresPartII:H.5/rigid-locus-exhaustion`
- `HodgeStructuresPartII:H.5/rigid-hodge-splitting`
- `HodgeStructuresPartII:H.5/relative-moduli`
- `HodgeStructuresPartII:H.5/rigid-correspondence`
- `HodgeStructuresPartII:H.0/rees-parameter`
- `HodgeStructuresPartII:H.5/arithmetic-spread-morphisms`

**Sources.**

- EG20, §4.2, Proposition 4.10, p.133: Statement (b).
- EG20, §4.2, Proposition 4.10 proof, p.133: Proof by the same spreading technique.
- EG20, §4.2, p.133: The count n_L over the determinant orbit.

**Suggested signature coverage.** omitted. Omitted: `ArithmeticModel.exists_nice_hodge`.

## H.5d. Integrality and integral variations

### Integral representations and local systems

`HodgeStructuresPartII:H.5/integral-representation` · definition · implementation unchecked

Let Γ be a group and G an affine group scheme of finite type over ℤ (GL_r, PGL_r or a split reductive group). A representation ρ: Γ → G(ℂ) is integral if there are a number field K ⊂ ℂ, with ring of integers 𝒪_K, and g ∈ G(ℂ) such that gρg⁻¹ factors through G(𝒪_K) ⊂ G(ℂ). An integral realization records the data (K, the fixed base change G_{𝒪_K} = G ×_ℤ Spec 𝒪_K, the conjugator g, the 𝒪_K-valued representation); for G = GL_r it is equivalently a local system of projective 𝒪_K-modules W with W ⊗_{𝒪_K} ℂ ≅ V. A local system on a connected space is integral if its monodromy representation is. For finitely generated Γ and G = GL_r, ρ is integral iff it is conjugate to a representation into GL_r(ℤ̄), ℤ̄ the ring of algebraic integers in ℂ (Esnault–Groechenig's formulation). Integrality over the full ring 𝒪_K is required: integrality over a ring of S-integers 𝒪_{K,Σ} is a weaker, different notion. Integral is not strongly integral (HodgeStructuresPartII:H.5/strongly-integral).

**Hypotheses.**

- Γ any group (finitely generated for the GL_r(ℤ̄) reformulation and for the local criterion); G an affine group scheme over ℤ.
- The conjugator is in G(ℂ), not G(K); integrality is a property of the conjugacy class.

**Proof plan.**

- Define the predicate as existence of the number field and conjugator.
- For finitely generated Γ: if gρg⁻¹ has entries in ℤ̄ on finitely many generators and their inverses, these finitely many algebraic integers lie in 𝒪_K for the number field K they generate; conversely 𝒪_K ⊂ ℤ̄.
- Projective-module formulation (Esnault–Groechenig 2018 §1): a projective 𝒪_K-module of rank r becomes free over 𝒪_L for a finite extension L (e.g. one capitulating the Steinitz class), so a local system of projective 𝒪_K-modules gives an 𝒪_L-valued representation after enlarging K.

**Acceptance.**

- Finite-image representations into GL_r are integral.
- Rank-one ρ: ℤ → GL_1(ℂ), 1 ↦ 1/2, is not integral.
- An 𝒪_{K,Σ}-valued representation need not be integral.

**Uses that determine the API.**

- Landesman–Litt, Canonical representations of surface groups, Definition 8.3.1 and Lemmas 8.3.3–8.3.4: Integrality of PGL_r- and GL_r-local systems from Klevdal–Patrikis; lifting integrality from PGL_r to GL_r with finite determinant.
- Esnault–Groechenig, Rigid connections and F-isocrystals, Remark 6.2 and Proposition 8.2: Integral means conjugate into GL_n(ℤ̄); integrality with unitarity at all embeddings gives finiteness.
- Esnault–Groechenig, Cohomologically rigid local systems and integrality, §1: Integral local systems come from local systems of projective 𝒪_L-modules; integrality is checked place by place.
- Klevdal–Patrikis, Compatibility of canonical ℓ-adic local systems on adjoint Shimura varieties (catalogue item PAPER-KLEVDAL-PATRIKIS-25/031, routed to this roadmap): An integral realization of a group-valued representation with number field, integral group model and conjugator as data, compatible with completions at every finite place.
- HodgeStructuresPartII:H.5/integrality-EG18, HodgeStructuresPartII:H.5/integrality-KP, HodgeStructuresPartII:H.5/unitary-embeddings-finite, HodgeStructuresPartII:H.5/integral-pvhs: Conclusion of the integrality theorems and hypothesis of the finiteness theorems.

**API.**

- `IsIntegralRepresentation` (constructor): ∃ K number field ⊂ ℂ, ∃ g ∈ G(ℂ), ∀ γ, gρ(γ)g⁻¹ ∈ G(𝒪_K).
- `IntegralRealization` (structure): The data (K, G ×_ℤ Spec 𝒪_K, g, ρ_{𝒪_K}) with ρ_{𝒪_K} ⊗_{𝒪_K} ℂ = gρg⁻¹. The integral group model is fixed by the definition; compatible finite extensions K ⊂ K′ transport realizations by base change.
- `IsIntegralRepresentation.iff_algebraicIntegers` (characterisation): For Γ finitely generated and G = GL_r, integral ↔ ∃ g, ∀ γ, all entries of gρ(γ)g⁻¹ are algebraic integers (IsIntegral ℤ).
- `IsIntegralRepresentation.iff_projectiveLattice` (equivalence): For G = GL_r, integral ↔ the local system comes by extension of scalars from a local system of finitely generated projective 𝒪_K-modules. Supplied by `HodgeStructuresPartII:H.5/integral-projective-lattice`.
- `IsIntegralRepresentation.of_finite` (relation): For G = GL_r (and PGL_r, by lifting to SL_r after a finite extension), finite image implies integral: average an 𝒪_K-lattice over the finite image and make it free over a finite extension. For a general affine group scheme over ℤ this fails (a congruence dilatation of GL_2 at 3 has torsion-free 𝒪_K-points while its ℂ-points contain −1).
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

**Direct prerequisites.**

- `mathlib:Matrix.GeneralLinearGroup`
- `HodgeStructuresPartII:H.5/projective-rigidity`

**Sources.**

- LL24, §8.3, Definition 8.3.1, p.39: Definition.
- EG18, §1, p.1: Projective-lattice formulation.
- EG20, §6, Remark 6.2, p.146: Formulation with the ring of all algebraic integers (bar lost in the text layer).

**Library location.** `TauCeti/Geometry/NonabelianHodge/Integral/Basic`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `IsIntegralRepresentation`, `IntegralRealization`, `IsIntegralRepresentation.iff_algebraicIntegers`, `IsIntegralRepresentation.of_finite`, `IsIntegralRepresentation.charpoly`, `IsIntegralRepresentation.conj_aut`, `IsIntegralRepresentation.of_realization`, `IsIntegralRepresentation.test_trivial`, `IsIntegralRepresentation.test_half_not_integral`, `IsIntegralRepresentation.test_S_integral_not_integral`, `IsIntegralRepresentation.test_unipotent`, `IsIntegralRepresentation.test_compat_ringOfIntegers`. Omitted: `IsIntegralRepresentation.iff_projectiveLattice`, `IsIntegralRepresentation.of_projectivization`, `IsIntegralRepresentation.restrictScalars`.

### Strongly integral representations

`HodgeStructuresPartII:H.5/strongly-integral` · definition · implementation unchecked

A representation ρ: Γ → GL_n(ℂ) is strongly integral if it is GL_n(ℂ)-conjugate to a representation with values in GL_n(ℤ); equivalently Γ preserves a ℤ-lattice Λ ⊂ ℂ^n of rank n spanning ℂ^n over ℂ (Λ ⊗_ℤ ℂ ≅ ℂ^n). Strong integrality implies integrality; the converse fails. Restriction of scalars converts integrality into strong integrality: if ρ has values in GL_r(𝒪_K), then ⊕_{τ: K → ℂ} τ∘ρ is strongly integral of rank r[K : ℚ].

**Hypotheses.**

- Γ any group; n ≥ 0.

**Proof plan.**

- Lattice formulation: a ℤ-basis of Λ that is also a ℂ-basis of ℂ^n conjugates ρ into GL_n(ℤ), and conversely ℤ^n is preserved by GL_n(ℤ).
- Restriction of scalars: 𝒪_K^r is a free ℤ-module of rank r[K:ℚ] preserved by ρ, and 𝒪_K ⊗_ℤ ℂ ≅ ℂ^{Hom(K,ℂ)} identifies 𝒪_K^r ⊗ ℂ with ⊕_τ τ∘ρ (Esnault–Groechenig Proposition 8.2 proof).

**Acceptance.**

- Every GL_n(ℤ)-valued representation is strongly integral.
- The rank-one character with value a Salem-type unit is integral but not strongly integral.

**Uses that determine the API.**

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

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/integral-representation`
- `mathlib:Matrix.GeneralLinearGroup`

**Sources.**

- EG20, §6, Remark 6.2, p.146: Strong integrality is distinct from integrality.
- EG20, §8.4, proof of Proposition 8.2, p.153: Restriction of scalars gives strong integrality.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Integral/Basic`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `IsStronglyIntegral`, `IsStronglyIntegral.iff_lattice`, `IsStronglyIntegral.isIntegral`, `IsStronglyIntegral.unitary_finite`, `IsStronglyIntegral.test_gl_n_Z`, `IsStronglyIntegral.test_salem_not_strong`, `IsStronglyIntegral.test_implies_integral`. Omitted: `IsStronglyIntegral.restrictScalars`, `IsStronglyIntegral.sum`, `IsStronglyIntegral.test_restriction_of_scalars`.

### Strongly integral unitary representations are finite

`HodgeStructuresPartII:H.5/strong-integral-unitary-finite` · theorem · implementation unchecked

If ρ: Γ → GL_n(ℂ) is strongly integral and unitary (HodgeStructuresPartII:H.5/unitary-representation), then ρ(Γ) is finite.

**Hypotheses.**

- Γ any group.

**Proof plan.**

- Conjugate so that ρ(Γ) ⊂ GL_n(ℤ) (strong integrality); conjugation preserves compactness of the closure, so the closure of ρ(Γ) is compact.
- GL_n(ℤ) is closed and discrete in GL_n(ℂ), so its intersection with a compact set is finite (equivalently: integer matrices with bounded entries form a finite set); hence ρ(Γ) is finite (Esnault–Groechenig Remark 6.2, citing Katz Proposition 4.2.1.3).

**Acceptance.**

- Applies to ⊕_τ τ∘ρ for an integral ρ all of whose Galois conjugates are unitary (with HodgeStructuresPartII:H.5/unitary-embeddings-finite).
- Fails for merely integral unitary representations (HodgeStructuresPartII:H.5/infinite-image-unitary-example).

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/strongly-integral`
- `HodgeStructuresPartII:H.5/unitary-representation`
- `HodgeStructuresPartII:H.5/unitary-conjugation`

**Sources.**

- EG20, §6, Remark 6.2, p.146: Statement and its limitation.

**Suggested signature coverage.** native. Native: `IsStronglyIntegral.unitary_finite`.

### Integral representations unitary at every embedding are finite

`HodgeStructuresPartII:H.5/unitary-embeddings-finite` · theorem · implementation unchecked

Let K be a number field, Γ a group and ρ: Γ → GL_m(𝒪_K). If for every embedding ι: K → ℂ the representation ρ ⊗_{𝒪_K, ι} ℂ is unitary, then ρ has finite image.

**Hypotheses.**

- Every embedding, not one: a single unitary embedding does not suffice (HodgeStructuresPartII:H.5/infinite-image-unitary-example).

**Proof plan.**

- The product ∏_ι ρ_ι: Γ → ∏_ι GL_m(ℂ) has image with compact closure, by unitarity at each ι.
- 𝒪_K embeds discretely in ∏_ι ℂ (a nonzero algebraic integer has |norm| ≥ 1); hence GL_m(𝒪_K) is discrete in ∏_ι GL_m(ℂ). Concretely, for each ι choose h_ι with h_ι ρ_ι h_ι⁻¹ unitary; unitary matrices have entries of absolute value ≤ 1 (Mathlib entry_norm_bound_of_unitary), so every entry a of the unconjugated 𝒪_K-valued ρ(γ) satisfies |ι(a)| ≤ m‖h_ι‖‖h_ι⁻¹‖ ≤ C with C the maximum over the finitely many ι, and NumberField.Embeddings.finite_of_norm_le shows there are finitely many such algebraic integers.
- The image is discrete and has compact closure, hence finite (Landesman–Litt 2022 Lemma 7.2.1).

**Acceptance.**

- Finite-image ρ satisfy the hypothesis.
- The Salem-type character satisfies unitarity at two of its four embeddings only.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/unitary-representation`
- `HodgeStructuresPartII:H.5/integral-representation`
- `mathlib:NumberField.Embeddings.finite_of_norm_le`
- `mathlib:entry_norm_bound_of_unitary`
- `tauceti:TauCeti.Matrix.isCompact_unitaryGroup`
- `HodgeStructuresPartII:H.5/unitary-conjugation`

**Sources.**

- LL22, §7.2, Lemma 7.2.1, p.51: Statement.
- LL22, §7.2, proof of Lemma 7.2.1, p.51: Discrete and compact.

**Suggested signature coverage.** native. Native: `unitary_embeddings_finite`.

### Integral unitary rank-one local systems of infinite image

`HodgeStructuresPartII:H.5/infinite-image-unitary-example` · construction · implementation unchecked

Let α ∈ ℂ be an algebraic integer with |α| = 1 that is not a root of unity, for example a root of the Salem polynomial x⁴ − x³ − x² − x + 1 on the unit circle (the other roots are real, ≈ 1.722 and ≈ 0.581). Then ᾱ = α⁻¹ is a conjugate of α (a root of the same monic integral polynomial), so α is a unit of ℤ̄. For a compact orientable surface Σ of genus g ≥ 1 with standard generators a_1, …, a_{2g} of π₁(Σ, x), define χ_α(a_1) = α and χ_α(a_i) = 1 for i > 1; this is a well-defined character π₁(Σ, x) → GL_1(ℤ̄) because GL_1 is abelian. χ_α is integral and unitary, has infinite image, and is not unitary at every embedding: some field automorphism σ of ℂ sends α to the real conjugate of modulus > 1. It is not of finite monodromy. Its determinant (the character itself) has infinite order, so it lies outside the finite-determinant hypothesis of the integrality theorems, and it is not rigid in M_B(π₁(Σ), GL_1) = (ℂ^×)^{2g}.

**Hypotheses.**

- g ≥ 1 (so that a_1 exists with abelianization ℤ^{2g}); α an algebraic integer of absolute value 1, not a root of unity.

**Proof plan.**

- Existence of α: the polynomial x⁴ − x³ − x² − x + 1 is irreducible and palindromic with exactly two real roots τ ≈ 1.722, τ⁻¹ and two complex conjugate roots on the unit circle; it is not cyclotomic (it has a root of modulus > 1), so its unit-circle roots are not roots of unity (Esnault–Groechenig cite Daileda for existence in general).
- ᾱ is a root of the same real polynomial, and |α| = 1 gives ᾱ = α⁻¹; hence α⁻¹ is an algebraic integer and χ_α has values in GL_1(ℤ̄): integral.
- |χ_α(γ)| = 1 for all γ: unitary (HodgeStructuresPartII:H.5/unitary-representation, rank one test).
- If χ_α had finite image then α^n = 1 for some n; contradiction. Kronecker's theorem (Mathlib NumberField.Embeddings.pow_eq_one_of_norm_eq_one) shows that some conjugate of α has modulus ≠ 1, matching HodgeStructuresPartII:H.5/unitary-embeddings-finite.

**Acceptance.**

- Integral, unitary, infinite image.
- Some Galois conjugate is not unitary.

**Uses that determine the API.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, Remark 6.2 and Example 6.3: Counterexample showing that integrality and unitarity do not imply finite monodromy, while strong integrality and unitarity do.
- HodgeStructuresPartII:H.5/strong-integral-unitary-finite, HodgeStructuresPartII:H.5/unitary-embeddings-finite, HodgeStructuresPartII:H.5/rigidity-conjugate: Sharpness of the finiteness criteria; unitarity is not Galois-invariant.

**API.**

- `SalemCharacter` (constructor): For an algebraic integer α with ‖α‖ = 1 and a surjection Γ → ℤ (for surfaces of genus ≥ 1, the first coordinate of the abelianization), the character γ ↦ α^{n(γ)}.
- `SalemCharacter.isUnitary` (relation): SalemCharacter α is unitary.
- `SalemCharacter.isIntegral` (relation): SalemCharacter α is integral, since α and α⁻¹ = ᾱ are algebraic integers.
- `SalemCharacter.infinite_range` (relation): If α is not a root of unity and Γ → ℤ is surjective, the image is infinite.
- `SalemCharacter.not_strongly_integral` (relation): If α is not a root of unity, SalemCharacter α is not strongly integral (GL_1(ℤ) = {±1}).
- `SalemCharacter.exists_nonunitary_conjugate` (relation): If α is not a root of unity, some σ ∈ Aut(ℂ) makes σ ∘ SalemCharacter α non-unitary (Kronecker).

**Unit tests.**

- `SalemCharacter.test_unitary` (computation): For Γ = Multiplicative ℤ and α a unit-circle root of x⁴ − x³ − x² − x + 1, the character n ↦ α^n is unitary and integral.
- `SalemCharacter.test_infinite_image` (characterisation): The character n ↦ α^n is injective, hence has infinite image, because α is not a root of unity.
- `SalemCharacter.test_kronecker` (compatibility): There is a ring homomorphism φ: ℚ(α) → ℂ with ‖φ(α)‖ ≠ 1 (contrapositive of NumberField.Embeddings.pow_eq_one_of_norm_eq_one).
- `SalemCharacter.test_gaussian_not_integral` (non-example): β = (3 + 4i)/5 has |β| = 1 and is not a root of unity, but it is not an algebraic integer (minimal polynomial 5x² − 6x + 5), so n ↦ β^n is unitary of infinite image but not integral.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/integral-representation`
- `HodgeStructuresPartII:H.5/strongly-integral`
- `HodgeStructuresPartII:H.5/unitary-representation`
- `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one`
- `ClassicalArithmeticCompletion:CA.6`

**Sources.**

- EG20, §6, Example 6.3, p.146: Hypotheses on α.
- EG20, §6, Example 6.3, p.146: Conclusion.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Integral/Examples`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** native. Native: `SalemCharacter`, `SalemCharacter.isUnitary`, `SalemCharacter.isIntegral`, `SalemCharacter.infinite_range`, `SalemCharacter.not_strongly_integral`, `SalemCharacter.exists_nonunitary_conjugate`, `SalemCharacter.test_unitary`, `SalemCharacter.test_infinite_image`, `SalemCharacter.test_kronecker`, `SalemCharacter.test_gaussian_not_integral`.

### Local criterion for integrality

`HodgeStructuresPartII:H.5/integrality-local-criterion` · theorem · implementation unchecked

Let Γ be finitely generated, G a connected reductive group over ℤ (GL_r in Esnault–Groechenig), K a number field, Σ a finite set of finite places of K and ρ: Γ → G(𝒪_{K,Σ}). If for every λ ∈ Σ the completion ρ_λ: Γ → G(K_λ) is G(K̄_λ)-conjugate to a representation into G(𝒪_{K̄_λ}) (for G reductive: G(K_λ)-conjugate into G(𝒪_{K_λ}) after a finite extension), then there is a finite extension L/K such that ρ is G(L)-conjugate to a representation Γ → G(𝒪_L); in particular ρ is integral.

**Hypotheses.**

- Γ finitely generated; places outside Σ already integral because ρ is 𝒪_{K,Σ}-valued.
- Finite extensions of K are allowed.

**Proof plan.**

- GL_r: the 𝒪_{K,Σ}-lattice and the local integral lattices at λ ∈ Σ glue (inverse image of ∏_{λ∈Σ} Ō_{K_λ}-lattices under the localization map) to a Γ-stable lattice of projective 𝒪_K-modules after a finite extension (Esnault–Groechenig 2018 §1; Bass Cor. 2.3, 2.5).
- A projective 𝒪_K-module becomes free over 𝒪_L for a finite extension L (HodgeStructuresPartII:H.5/integral-representation API iff_projectiveLattice).
- Reductive G: choose g_λ ∈ G^ad(K_λ) conjugating ρ_λ into G(𝒪_{K_λ}), lift to G^sc after a finite extension, approximate by strong approximation and glue (Klevdal–Patrikis Proposition 3.1).

**Acceptance.**

- If Σ = ∅ the conclusion is immediate.
- Fails if some λ ∈ Σ is not integral: ρ: ℤ → GL_1(ℤ[1/2]), 1 ↦ 2, at λ = 2.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/integral-representation`
- `HodgeStructuresPartII:H.5/integral-projective-lattice`

**Sources.**

- EG18, §1, p.2: GL_r criterion (subscripts λ displaced in the text layer).
- KP20, §3, Proposition 3.1, p.5: Reductive version.

**Suggested signature coverage.** omitted. Omitted: `isIntegral_of_local`.

### Integrality of cohomologically rigid local systems

`HodgeStructuresPartII:H.5/integrality-EG18` · theorem · implementation unchecked

Let X be a smooth connected quasi-projective complex variety with a good compactification. Every irreducible complex local system V on X that is cohomologically rigid (HodgeStructuresPartII:H.5/cohomological-rigidity), has finite-order determinant, and has quasi-unipotent local monodromy along every boundary component, is integral (HodgeStructuresPartII:H.5/integral-representation): its monodromy is conjugate into GL_r(𝒪_L) for a number field L. Integral is not strongly integral; the conclusion is over the full ring 𝒪_L.

**Hypotheses.**

- X smooth connected quasi-projective over ℂ; V irreducible of rank r; H¹(U, a_* End⁰V) = 0; det V of finite order d; local monodromies quasi-unipotent with eigenvalue orders dividing h.
- External inputs (recorded with their hypotheses, not re-proved here): Lafforgue's Langlands correspondence for GL_r over function fields (GlobalShtukasAndFunctionFieldLanglands:GS.6), Drinfeld's existence of ℓ′-companions on smooth varieties over finite fields, Deligne's purity and weight theory (DeligneWeightsAndPurity:DWP.7), tame specialization of fundamental groups (InverseGaloisAndArithmeticFundamentalGroups:IG.1), Saito's local acyclicity, Deligne's theorem on local monodromy of compatible systems on curves, and étale–Betti comparison.

**Proof plan.**

- Finiteness and number field: the set S(r, d, h) of such local systems is finite (HodgeStructuresPartII:H.5/rigid-finite); each is defined over 𝒪_{K,Σ} for a number field K and finite Σ (HodgeStructuresPartII:H.5/rigid-number-field).
- By HodgeStructuresPartII:H.5/integrality-local-criterion it suffices to show integrality at each λ ∈ Σ. Fix λ, choose λ′ ∉ Σ dividing ℓ′, complete at λ′ to get λ′-adic lisse sheaves V_{i,λ′} on X, and choose a model X_S (HodgeStructuresPartII:H.5/smooth-arithmetic-model) and a closed point s of characteristic p prime to ℓ, ℓ′, d, h, Σ and the residual monodromy orders.
- Tame specialization π₁^ét(X) → π₁^{ét,p′}(X_s̄) (IG.1) descends the V_{i,λ′} to tame lisse sheaves on X_s̄; isolatedness of [V_{i,λ′}] in the prescribed-monodromy moduli over K_{λ′} and continuity of the Frobenius action make them descend to arithmetic sheaves on X_{s′} with finite determinant after a finite extension s′/s (Esnault–Groechenig 2018 Proposition 3.1, a variant of Simpson's Theorem 4).
- Drinfeld's theorem gives λ-companions V^σ_{i,λ′,s} (ℓ-adic for λ | ℓ, ℓ ≠ p), which are integral (come from Ō_{K_λ}-lattices). Purity and equality of L-functions of End⁰ show H¹(X̄_s̄, j_{!*}End⁰V^σ) = 0 (weight argument of Esnault–Groechenig 2018 Lemma 3.4, with HodgeStructuresPartII:H.5/intermediate-extension-h1); local acyclicity and Betti–étale comparison transport back to X: the companions give N(r, d, h) pairwise non-isomorphic cohomologically rigid irreducible local systems on X with the same data, all integral at λ.
- Counting: these exhaust S(r, d, h), so each V_i is integral at λ. Vary λ over Σ (changing p as needed) and conclude with the local criterion.

**Acceptance.**

- Rank one: finite-order characters are integral.
- Hypergeometric local systems on ℙ¹ ∖ {0,1,∞} with quasi-unipotent local monodromies are integral.
- The conclusion cannot be strengthened to strong integrality in general.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/cohomological-rigidity`
- `HodgeStructuresPartII:H.5/rigid-finite`
- `HodgeStructuresPartII:H.5/rigid-number-field`
- `HodgeStructuresPartII:H.5/integrality-local-criterion`
- `HodgeStructuresPartII:H.5/smooth-arithmetic-model`
- `HodgeStructuresPartII:H.5/intermediate-extension-h1`
- `HodgeStructuresPartII:H.5/boundary-monodromy-data`
- `HodgeStructuresPartII:H.5/prescribed-monodromy-tangent`
- `GlobalShtukasAndFunctionFieldLanglands:GS.6`
- `DeligneWeightsAndPurity:DWP.7`
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1`

**Sources.**

- EG18, §1, Theorem 1.1, p.1: Statement.
- EG18, §1, p.2: Proof route through Drinfeld's companions.
- EG20, §8.1, p.151: Use in Rigid connections and F-isocrystals.

**Suggested signature coverage.** omitted. Omitted: `isIntegral_of_cohomologicallyRigid`.

### Integrality of G-cohomologically rigid local systems

`HodgeStructuresPartII:H.5/integrality-KP` · theorem · implementation unchecked

Let X be a connected smooth quasi-projective complex variety with base point x, G a split connected reductive group over ℤ with maximal abelian quotient A, and ρ: π₁(X, x) → G(ℂ) G-irreducible (image in no proper parabolic subgroup) and G-cohomologically rigid (H¹(X̄, j_{!*} g^der) = 0 for a good compactification), with quasi-unipotent local monodromy and with π₁(X, x) → G(ℂ) → A(ℂ) of finite image. Then the identity component of the Zariski closure of ρ(π₁(X,x)) is semisimple, and ρ is G(ℂ)-conjugate to a homomorphism π₁(X, x) → G(𝒪_L) for a number field L. For G = PGL_r (A trivial) this applies to the projectivizations used by Landesman–Litt; with HodgeStructuresPartII:H.5/integral-representation API of_projectivization it gives integrality of GL_r-local systems with finite determinant.

**Hypotheses.**

- G split connected reductive over ℤ; ρ G-irreducible and G-cohomologically rigid with quasi-unipotent local monodromy and finite abelianized image.
- External inputs: those of HodgeStructuresPartII:H.5/integrality-EG18, with Drinfeld's G-valued companions (connected monodromy) in place of GL_r companions; recorded with hypotheses, not re-proved.

**Proof plan.**

- Moduli: the stack of G-irreducible representations with fixed abelianization and local classes is of finite type (HodgeStructuresPartII:H.5/prescribed-monodromy-moduli, G-version), with tangent space H¹(U, a_* g^der) (HodgeStructuresPartII:H.5/prescribed-monodromy-tangent); hence finitely many such ρ, each defined over 𝒪_{K,Σ}.
- Reduce to G simple adjoint (Klevdal–Patrikis Lemma 5.1); specialize to a finite field, descend to arithmetic G-local systems and show the connected monodromy is semisimple (Klevdal–Patrikis Proposition 5.6, Corollary 5.7).
- Produce λ-companions with full G-monodromy by Drinfeld, transport them back by tame specialization, and count as in HodgeStructuresPartII:H.5/integrality-EG18; conclude with the reductive local criterion (HodgeStructuresPartII:H.5/integrality-local-criterion).

**Acceptance.**

- For G = GL_n it recovers HodgeStructuresPartII:H.5/integrality-EG18 (apart from the semisimplicity conclusion).
- Local systems of geometric origin satisfy the quasi-unipotence and finite-abelianization hypotheses (Klevdal–Patrikis Remark 1.3).

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/integrality-EG18`
- `HodgeStructuresPartII:H.5/integrality-local-criterion`
- `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`
- `HodgeStructuresPartII:H.5/prescribed-monodromy-tangent`
- `HodgeStructuresPartII:H.5/cohomological-rigidity`
- `HodgeStructuresPartII:H.5/projective-rigidity`
- `GlobalShtukasAndFunctionFieldLanglands:GS.6`
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1`

**Sources.**

- KP20, §1, Theorem 1.2, p.2: Conclusion.
- KP20, §1, Definition 1.1, p.2: Hypothesis.
- LL24, §8.3, proof of Lemma 8.3.3, p.40: Application to PGL_r.

**Suggested signature coverage.** omitted. Omitted: `isIntegral_of_G_cohomologicallyRigid`.

### Local systems of geometric origin

`HodgeStructuresPartII:H.5/geometric-origin` · definition · implementation unchecked

A complex local system V on a smooth complex variety X is of geometric origin if there are a dense Zariski open U ⊂ X, a smooth projective morphism f: Y → U and an integer i ≥ 0 such that V|_U is a subquotient of R^i f_* ℂ_Y. Since R^i f_* ℂ is semisimple (Deligne), subquotient and direct summand give the same notion; the variant with smooth proper f contains this one. A flat algebraic connection is of geometric origin if its local system is; when the connection has regular singularities (automatic for X projective), this is equivalent to being, on U, a subquotient of a Gauss–Manin connection R^i f_*(Ω^•_{Y/U}, d). The irregular connection (O_{𝔸¹}, d + dx) has the trivial, geometric local system but is not a subquotient of a Gauss–Manin connection on any dense open. The definition asserts nothing about existence of such families for rigid objects (Simpson's motivicity conjecture).

**Hypotheses.**

- X smooth connected over ℂ; f smooth projective (Esnault–Groechenig, Langer–Simpson) — Landesman–Litt allow smooth proper f; record which variant a consumer uses.

**Proof plan.**

- Define the predicate by existence of (U, f, i) and a subquotient embedding.
- Semisimplicity of R^i f_* ℂ for smooth projective f (Deligne's theorem, via the polarized ℤ-variation of Hodge structure on R^i f_* ℤ, HodgeStructuresPartII:H.2) turns subquotients into direct summands.
- Gauss–Manin version: the algebraic de Rham comparison for smooth projective families (ComplexComparisonPartII:C5) identifies R^i f_* ℂ ⊗ O_U with the Gauss–Manin connection, which has regular singularities; by Deligne's Riemann–Hilbert correspondence for regular singular connections the comparison of subquotients needs the connection to be regular singular.

**Acceptance.**

- Constant local systems ℂ^r are of geometric origin (f the disjoint union of r copies of U, i = 0).
- Finite-monodromy local systems are of geometric origin (disjoint unions of copies of a finite étale cover).

**Uses that determine the API.**

- Esnault–Groechenig, Rigid connections and F-isocrystals, Conjecture 1.3 and §8.1: Simpson's motivicity conjecture for rigid connections; cohomologically rigid SL_3 connections are of geometric origin.
- Landesman–Litt, Canonical representations of surface groups, §9.1 and Corollary 9.1.4: Relative Fontaine–Mazur: arithmetic local systems of low rank on generic curves; geometric origin implies underlying an integral PVHS.
- Langer–Simpson, Rank 3 rigid representations, §1 and Theorem 1.3: Definition and the rank-3 theorem.
- HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs, HodgeStructuresPartII:H.5/rigid-sl3-geometric, HodgeStructuresPartII:H.5/very-general-rank-bound: Consumers.

**API.**

- `IsOfGeometricOrigin` (constructor): ∃ U dense open, f: Y → U smooth projective, i, with V|_U a subquotient of R^i f_* ℂ.
- `IsOfGeometricOrigin.iff_summand` (characterisation): Equivalent with 'direct summand' in place of 'subquotient' (semisimplicity). Supplied by `HodgeStructuresPartII:H.5/geometric-origin-summand`.
- `IsOfGeometricOrigin.restrict` (functoriality): Restriction to a dense open preserves geometric origin. For a morphism h: X′ → X, pullback preserves the given geometric-origin witness when h⁻¹(U) is dense in X′ (in particular for a dominant morphism between irreducible varieties): pull back its smooth projective family to h⁻¹(U).
- `IsOfGeometricOrigin.sum_tensor_dual` (functoriality): Direct sums, tensor products, duals and subquotients of local systems of geometric origin are of geometric origin (fibre products and Künneth).
- `IsOfGeometricOrigin.quasiUnipotent` (relation): Local systems of geometric origin have quasi-unipotent local monodromy at infinity (local monodromy theorem, LefschetzPencilsAndVanishingCycles:LPV.1). Supplied by `HodgeStructuresPartII:H.5/geometric-origin-boundary`.
- `IsOfGeometricOrigin.integralPVHS` (relation): Geometric origin implies underlying an integral PVHS (HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs).

**Unit tests.**

- `IsOfGeometricOrigin.test_constant` (degenerate): The constant local system ℂ_X is of geometric origin (U = X, f = id_X, i = 0).
- `IsOfGeometricOrigin.test_finite_monodromy` (computation): A local system V of rank r with finite monodromy is of geometric origin: if f₀: Y → X is the finite étale Galois cover trivializing it, V is a summand of f_* ℂ for f: ⊔^r Y → X the disjoint union of r copies (i = 0), since the regular representation contains each irreducible representation of the Galois group.
- `IsOfGeometricOrigin.test_salem_not` (non-example): The Salem-type character χ_α on a genus-one curve is not of geometric origin: geometric origin implies that every Galois conjugate underlies a polarizable variation (HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs), and a rank-one polarizable variation is unitary, while some conjugate of χ_α is not unitary.
- `IsOfGeometricOrigin.test_legendre` (computation): On X = ℙ¹ ∖ {0, 1, ∞}, R¹f_*ℂ for the Legendre family y² = x(x − 1)(x − λ) is of geometric origin (rank 2, infinite monodromy).

**Direct prerequisites.**

- `ComplexComparisonPartII:C5`
- `LefschetzPencilsAndVanishingCycles:LPV.1`
- `HodgeStructuresPartII:H.5/boundary-monodromy-data`
- `HodgeStructuresPartII:H.2/geometric-pure`
- `HodgeStructuresPartII:H.2/complex-semisimple`
- `HodgeStructuresPartII:H.2/isotypic-hodge`

**Sources.**

- LL24, §9.1, p.45: Landesman–Litt's definition (smooth proper).
- LS18, §1, p.1: Langer–Simpson's definition (smooth projective, direct factor).
- EG20, §1, p.104: Esnault–Groechenig's Gauss–Manin formulation.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Integral/GeometricOrigin`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `IsOfGeometricOrigin`, `IsOfGeometricOrigin.iff_summand`, `IsOfGeometricOrigin.restrict`, `IsOfGeometricOrigin.sum_tensor_dual`, `IsOfGeometricOrigin.quasiUnipotent`, `IsOfGeometricOrigin.integralPVHS`, `IsOfGeometricOrigin.test_constant`, `IsOfGeometricOrigin.test_finite_monodromy`, `IsOfGeometricOrigin.test_salem_not`, `IsOfGeometricOrigin.test_legendre`.

### Integral polarizable variations of Hodge structure

`HodgeStructuresPartII:H.5/integral-pvhs` · definition · implementation unchecked

A complex local system V on a smooth complex variety X underlies an integral PVHS if there are a number field K, a local system W of finitely generated projective 𝒪_K-modules with V ≅ W ⊗_{𝒪_K, ι₀} ℂ for an embedding ι₀, such that for every embedding ι: 𝒪_K → ℂ the local system W ⊗_{𝒪_K, ι} ℂ underlies a polarizable complex variation of Hodge structure on X (HodgeStructuresPartII:H.2). This is the hypothesis of Landesman–Litt 2022 Theorem 1.2.5 and condition (4) of Landesman–Litt 2024 Corollary 9.1.4. It requires variations at all embeddings; a single complex variation with integral monodromy is a weaker condition.

**Hypotheses.**

- X smooth connected over ℂ; K a number field; W an 𝒪_K-local system; every Galois conjugate polarizable as a complex variation.

**Proof plan.**

- Define the predicate as existence of (K, W, ι₀) with the variation condition at every ι.
- Integral PVHS implies integral (HodgeStructuresPartII:H.5/integral-representation): W gives the projective 𝒪_K-lattice.

**Acceptance.**

- Finite-monodromy local systems underlie integral PVHS (single Hodge type, unitary at every embedding).
- Local systems of geometric origin underlie integral PVHS.

**Uses that determine the API.**

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

- `IsIntegralPVHS.test_finite_monodromy` (degenerate): A local system with finite monodromy underlies an integral PVHS: it is defined over 𝒪_K for K a splitting field of its finite monodromy group (e.g. ℚ(ζ_N), N the exponent, by Brauer; the character field need not suffice because of Schur indices, as for the quaternion group), and every conjugate is unitary, hence a variation of a single Hodge type.
- `IsIntegralPVHS.test_salem_not` (non-example): The Salem-type character χ_α is integral and unitary but does not underlie an integral PVHS: some conjugate σ∘χ_α is not unitary, and a rank-one polarizable complex variation is unitary (HodgeStructuresPartII:H.5/zero-higgs-unitary).
- `IsIntegralPVHS.test_isIntegral` (compatibility): IsIntegralPVHS V → IsIntegralRepresentation of the monodromy of V.
- `IsIntegralPVHS.test_unitary_everywhere_finite` (characterisation): If V underlies an integral PVHS through W and every W ⊗_ι ℂ is unitary, then the monodromy of V is finite (HodgeStructuresPartII:H.5/unitary-embeddings-finite).

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/integral-representation`
- `HodgeStructuresPartII:H.2/complex-pvhs`
- `HodgeStructuresPartII:H.5/integral-projective-lattice`

**Sources.**

- LL22, §1.2, Theorem 1.2.5, p.3: The integral PVHS hypothesis.
- LL24, §9.1, Corollary 9.1.4(4), p.46: Condition (4).

**Library location.** `TauCeti/Geometry/NonabelianHodge/Integral/GeometricOrigin`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `IsIntegralPVHS`, `IsIntegralPVHS.isIntegral`, `IsIntegralPVHS.conj_aut`, `IsIntegralPVHS.of_geometricOrigin`, `IsIntegralPVHS.unitary_all_finite`, `IsIntegralPVHS.test_finite_monodromy`, `IsIntegralPVHS.test_salem_not`, `IsIntegralPVHS.test_isIntegral`, `IsIntegralPVHS.test_unitary_everywhere_finite`.

### Local systems of geometric origin underlie integral variations

`HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs` · theorem · implementation unchecked

Let V be a complex local system of geometric origin on a smooth complex variety X (V|_U a subquotient of R^i f_* ℂ for a smooth projective f: Y → U over a dense open U ⊂ X). Then V is defined over 𝒪_L for a number field L and every Galois conjugate V ⊗_{𝒪_L, ι} ℂ underlies a polarizable complex variation of Hodge structure on X: V underlies an integral PVHS (HodgeStructuresPartII:H.5/integral-pvhs).

**Hypotheses.**

- f smooth projective (for smooth proper f, use the polarizable ℤ-variation on R^i f_*ℤ modulo torsion supplied by Hodge theory of smooth proper families).
- Semisimplicity and isotypic decomposition of polarizable variations, and extension of variations across a codimension subset where the local system extends (Schmid's Corollary 4.11), are supplied by HodgeStructuresPartII:H.2.

**Proof plan.**

- The torsion-free integral cohomology of the smooth projective family is a polarized integral variation. Its complex local system is semisimple by H.2/complex-semisimple. H.2/isotypic-hodge gives a variation on each irreducible support and a constant Hodge structure on its multiplicity space; a chosen local-system summand need not be a sub-variation of the originally chosen filtration.
- Choose an isomorphic summand over a number field using the decomposition of the finite-dimensional rational algebra generated by the monodromy. Intersect its invariant subspace with the integral cohomology lattice after coefficient extension; this is a full, finite projective invariant lattice. Since the complex local system extends from U to X, the kernel of π₁(U) → π₁(X) acts trivially on this model and lattice as well.
- Each field embedding gives another summand of the same integral geometric local system. Use H.2/isotypic-hodge to choose a polarizable complex variation on that summand over U.
- Extend these variations to X using the separate Schmid-extension input recorded as a gap (Schmid Corollary 4.11, as used by LL22 Lemma 7.2.1). H.2 itself does not supply that extension theorem.

**Acceptance.**

- Implies (3) ⇒ (4) of Landesman–Litt 2024 Corollary 9.1.4.
- Constant and finite-monodromy local systems are covered.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/geometric-origin`
- `HodgeStructuresPartII:H.5/integral-pvhs`
- `HodgeStructuresPartII:H.5/integral-representation`
- `ComplexComparisonPartII:C5`
- `HodgeStructuresPartII:H.2/geometric-pure`
- `HodgeStructuresPartII:H.2/complex-semisimple`
- `HodgeStructuresPartII:H.2/isotypic-hodge`
- `HodgeStructuresPartII:H.5/geometric-origin-summand`
- `HodgeStructuresPartII:H.5/geometric-origin-boundary`

**Sources.**

- LL22, §7.3, proof of Corollary 1.2.7, p.52: Integral structure.
- LL22, §7.3, proof of Corollary 1.2.7, p.52: Variation at every embedding.
- LL24, §9.1, proof of Corollary 9.1.4, p.46: Use in Landesman–Litt 2024.

**Suggested signature coverage.** omitted. Omitted: `IsOfGeometricOrigin.integralPVHS`.

### Low-rank variations on analytically general curves are unitary

`HodgeStructuresPartII:H.5/low-rank-pvhs-unitary` · theorem · implementation unchecked

(Landesman–Litt 2022 Theorem 1.2.12, Theorem 1.2.13 in v3.) Let (C, x_1, …, x_n) be a hyperbolic n-pointed curve of genus g and (E,∇) a flat vector bundle on C with regular singularities at the x_i and rank E < 2√(g+1). If an isomonodromic deformation of (E,∇) to an analytically general nearby n-pointed curve underlies a polarizable complex variation of Hodge structure, then (E,∇) has unitary monodromy. In the form used by Landesman–Litt 2024: a local system of rank < 2√(g+1) on the total space of a punctured versal family of hyperbolic genus-g curves that underlies a complex PVHS restricts to a unitary local system on every fibre.

**Hypotheses.**

- (C, x_i) hyperbolic: 2g − 2 + n > 0; rank < 2√(g+1).
- Isomonodromic deformation over a neighbourhood in Teichmüller space and analytically general points (Landesman–Litt 2022 Definition 1.2.3); these carriers are not planned in any layer of the atlas and are recorded as a gap.
- Parabolic semistability and Clifford-type bounds for isomonodromic deformations come from HodgeStructuresPartII:H.4.

**Proof plan.**

- By Landesman–Litt 2022 Corollary 6.1.2, after an isomonodromic deformation to an analytically general nearby curve the parabolic bundle E_⋆ is semistable when the rank bound holds (parabolic Clifford-type bounds, HodgeStructuresPartII:H.4).
- Landesman–Litt 2022 Lemma 7.1.1: if the underlying parabolic bundle E_⋆ of the Deligne canonical extension is semistable, a polarizable complex variation on it is unitary: after reducing to irreducible summands (semisimplicity, HodgeStructuresPartII:H.2), the top Hodge piece F^i E_⋆ is ∇-stable by semistability, so F^i = E_⋆, the variation has one Hodge type and its polarization is definite (compare HodgeStructuresPartII:H.5/zero-higgs-unitary).

**Acceptance.**

- Rank one: every polarizable complex variation of rank one is unitary.
- Sharpness discussion: the bound 2√(g+1) is where the Clifford-type estimate fails.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/zero-higgs-unitary`
- `HodgeStructuresPartII:H.5/unitary-representation`
- `HodgeStructuresPartII:H.2/complex-pvhs`
- `HodgeStructuresPartII:H.2/complex-semisimple`
- `HodgeStructuresPartII:H.4/parabolic-semistability`
- `HodgeStructuresPartII:H.4/parabolic-clifford-rank`

**Sources.**

- LL22, §1.2, Theorem 1.2.12, pp.4–5: Statement (continued across the page break: 'general nearby n-pointed curve underlies a polarizable complex variation of Hodge structure, then (E, ∇) has unitary monodromy').
- LL24, §8.4, proof of Proposition 8.4.1, p.41: Form used in Landesman–Litt 2024.

**Suggested signature coverage.** omitted. Omitted: `unitary_of_lowRank_pvhs`.

### Integral variations of low rank on very general curves have finite monodromy

`HodgeStructuresPartII:H.5/very-general-rank-bound` · theorem · implementation unchecked

(Landesman–Litt 2022 Theorem 1.2.5.) Let K be a number field, (C, x_1, …, x_n) an analytically very general hyperbolic n-pointed curve of genus g, and V an 𝒪_K-local system on C ∖ {x_1, …, x_n} with infinite monodromy such that V ⊗_{𝒪_K, ι} ℂ underlies a polarizable complex variation of Hodge structure for every embedding ι (V underlies an integral PVHS, HodgeStructuresPartII:H.5/integral-pvhs). Then rk_{𝒪_K} V ≥ 2√(g+1). Equivalently, integral PVHS of rank < 2√(g+1) on such curves have finite monodromy; in particular (Corollary 1.2.7) local systems of geometric origin with infinite monodromy have rank ≥ 2√(g+1).

**Hypotheses.**

- Analytically very general point of M_{g,n} (complement of countably many nowhere dense closed analytic subsets, locally).
- Integral PVHS at every embedding; infinite monodromy.

**Proof plan.**

- For a fixed 𝒪_K-representation ρ of rank < 2√(g+1) with infinite image, the set T_ρ of points of Teichmüller space where every conjugate underlies a polarizable variation is contained in a closed analytic subset; otherwise the variations extend to analytically general nearby curves, so every conjugate is unitary (HodgeStructuresPartII:H.5/low-rank-pvhs-unitary) and ρ has finite image (HodgeStructuresPartII:H.5/unitary-embeddings-finite), a contradiction.
- There are countably many such ρ, so an analytically very general point avoids all the images M_ρ (Landesman–Litt 2022 §7.2).
- Geometric origin: apply HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs (Corollary 1.2.7).

**Acceptance.**

- Finite-monodromy local systems are allowed in every rank.
- The uniformizing variation (rank 2, infinite monodromy, not integral in general) shows the integral hypothesis is essential (Landesman–Litt 2022 Remark 1.2.6).

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/low-rank-pvhs-unitary`
- `HodgeStructuresPartII:H.5/unitary-embeddings-finite`
- `HodgeStructuresPartII:H.5/integral-pvhs`
- `HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs`

**Sources.**

- LL22, §1.2, Theorem 1.2.5, p.3: Hypotheses.
- LL22, §7.2, proof of Theorem 1.2.5, p.52: Proof route.

**Suggested signature coverage.** omitted. Omitted: `rank_bound_veryGeneral`.

### Cohomologically rigid SL₃ local systems are of geometric origin

`HodgeStructuresPartII:H.5/rigid-sl3-geometric` · theorem · implementation unchecked

Let X be a smooth connected projective complex variety with base point x. (a) (Langer–Simpson Theorem 1.3) Every rigid, integral, irreducible representation ρ: π₁(X, x) → SL_3(ℂ) is of geometric origin. (b) (Esnault–Groechenig §8.1) Every cohomologically rigid irreducible flat connection of rank 3 with trivial determinant on X is of geometric origin.

**Hypotheses.**

- X smooth projective; rank 3; determinant trivial (SL_3).
- (a) is Langer–Simpson's theorem, recorded with its hypotheses (rigid, integral, irreducible) and not re-proved; its proof constructs weight-one integral variations and uses the moduli of abelian varieties (AbelianSchemesAndArithmeticModuli roadmaps).

**Proof plan.**

- (b) A cohomologically rigid irreducible connection with trivial determinant is rigid (HodgeStructuresPartII:H.5/coh-rigid-reduced-isolated) and integral (HodgeStructuresPartII:H.5/integrality-EG18 with X projective, so the quasi-unipotence condition is vacuous).
- Apply (a) to its monodromy (Esnault–Groechenig §8.1).
- (a) Langer–Simpson distinguish three cases. If ρ projectively factors through an orbicurve, geometric origin follows from Katz's classification of rigid local systems on punctured projective lines. If the monodromy is small (finite, or not Zariski dense), it follows from the rank-one and rank-two cases (Corlette–Simpson). Otherwise their Theorem 1.6 excludes complex variations of type (1,1,1) for every Galois conjugate L^σ (each underlies a variation by HodgeStructuresPartII:H.5/rigid-underlies-cvhs), so all L^σ underlie weight-one variations, which assemble into a polarized weight-one ℤ-variation, i.e. a family of abelian varieties, of whose Gauss–Manin local system L is a summand. Only this last case produces abelian varieties.

**Acceptance.**

- Finite-monodromy SL_3 local systems are covered trivially.
- No integrality hypothesis is needed in (b) because integrality is proved by HodgeStructuresPartII:H.5/integrality-EG18.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/integrality-EG18`
- `HodgeStructuresPartII:H.5/coh-rigid-reduced-isolated`
- `HodgeStructuresPartII:H.5/geometric-origin`
- `HodgeStructuresPartII:H.5/rigid-underlies-cvhs`
- `HodgeStructuresPartII:H.5/integral-representation`

**Sources.**

- LS18, §1, Theorem 1.3, p.2: Langer–Simpson.
- EG20, §8.1, p.151: Esnault–Groechenig's combination.
- LS18, §1, p.4: The case division of the proof: only the non-orbicurve case yields weight-one variations and abelian varieties.

**Suggested signature coverage.** omitted. Omitted: `isOfGeometricOrigin_of_sl3`.

### No symmetric differentials forces finite rigid monodromy

`HodgeStructuresPartII:H.5/no-symmetric-differentials` · application · implementation unchecked

Let X be a compact Kähler manifold (smooth projective in the uses here) with H⁰(X, Sym^i Ω¹_X) = 0 for every i ≥ 1. Then: (a) (Arapura; Brunebarbe–Klingler–Totaro Theorem 4.1) every finite-dimensional complex representation of π₁(X) is rigid, in the sense that its point of M_B(X, GL(n)) is isolated (no determinant fixed); (b) (Brunebarbe–Klingler–Totaro Theorem 0.1) every finite-dimensional representation of π₁(X) over any field has finite image; (c) every Higgs bundle in M_Dol(X, (L,0), r) has nilpotent Higgs field, the Hitchin base A_r being a point.

**Hypotheses.**

- X smooth projective (the atlas's moduli are algebraic); all symmetric differentials vanish (for (a) in rank n, those of degree 1 ≤ i ≤ n suffice).
- (a) and (c) are proved from H.1; (b) is recorded from Brunebarbe–Klingler–Totaro with its hypotheses: it uses positivity of variations of Hodge structure and Katzarkov–Zuo's p-adic harmonic maps, which no layer of the atlas plans (gap).

**Proof plan.**

- (c) The Hitchin base ⊕_{i≥2} H⁰(X, Sym^i Ω¹) is zero, so h ≡ 0 and every Higgs field is nilpotent (HodgeStructuresPartII:H.1/hitchin-map API nilpotent_iff).
- (a) Arapura's argument: the GL_n Hitchin base ⊕_{i=1}^{n} H⁰(X, Sym^i Ω¹) is zero, so the Hitchin morphism of the semistable Higgs moduli is constant; it is proper (HodgeStructuresPartII:H.1/hitchin-properness), so M_Dol(X, GL_n) is proper over ℂ, hence compact. By the non-abelian Hodge homeomorphism of the semisimple coarse spaces (HodgeStructuresPartII:H.1/nonabelian-hodge-topology) M_B(X, GL_n) is compact; it is affine (HodgeStructuresPartII:H.1/betti-coarse), hence finite, and every point is isolated.
- (b) Brunebarbe–Klingler–Totaro, characteristic zero: by (a) the representation is rigid, so its semisimplification σ is a direct factor of a ℚ-variation of Hodge structure τ (Simpson Theorem 5; HodgeStructuresPartII:H.5/rigid-underlies-cvhs); τ is bounded at every finite place (Katzarkov–Zuo), hence conjugate into GL(m, ℤ) (Bass), so its monodromy is discrete; bigness of the cotangent bundle on the image of the period map (their Corollary 3.2) then produces symmetric differentials unless the monodromy is finite. The non-semisimple case reduces to H¹ of a finite cover. Positive characteristic: the moduli of representations over 𝔽_p is zero-dimensional (Katzarkov–Zuo over 𝔽_q((t))), and unipotent parts are finite.

**Acceptance.**

- ℙⁿ and simply connected varieties satisfy the conclusion trivially.
- Consistent with Esnault–Groechenig §8.2: on such X all integrable connections are rigid and have finite monodromy.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/rigid-representation`
- `HodgeStructuresPartII:H.5/rigid-underlies-cvhs`
- `HodgeStructuresPartII:H.5/rigid-higgs-nilpotent`
- `HodgeStructuresPartII:H.1/hitchin-map`
- `HodgeStructuresPartII:H.1/hitchin-properness`
- `HodgeStructuresPartII:H.1/nonabelian-hodge-topology`
- `HodgeStructuresPartII:H.1/betti-coarse`

**Sources.**

- BKT13, Introduction, Theorem 0.1, p.1: Theorem 0.1.
- BKT13, §4, Theorem 4.1, p.9: Arapura's theorem (≠ rendered as 6= in the text layer).
- EG20, §8.2, p.152: Use in Esnault–Groechenig.

**Suggested signature coverage.** omitted. Omitted: `finite_of_no_symmetric_differentials`.

### First cohomology vanishing from fibrewise data

`HodgeStructuresPartII:H.5/fibrewise-h1-vanishing` · lemma · implementation unchecked

Let G be a group, N ⊴ G a normal subgroup and A a representation of G over a field. If A^N = 0 and the G/N-invariants of H¹(N, A) vanish, then H¹(G, A) = 0. Topologically: for a fibration π: E → B of path-connected spaces with fibre F and a local system W on E with H⁰(F, W|_F) = 0 and H⁰(B, R¹π_* W) = H¹(F, W|_F)^{π₁(B)} = 0, one has H¹(E, W) = 0. If N is the image of π₁(F) → π₁(E), the second condition follows from H¹(π₁(F), W)^{π₁(B)} = 0 since H¹(N, W) → H¹(π₁(F), W) is injective (inflation along a surjection whose kernel acts trivially).

**Hypotheses.**

- Group-theoretic form: any group G, normal N, representation A.
- Topological form: Serre fibration of path-connected, locally simply connected spaces; degree-one local-system cohomology equals group cohomology.

**Proof plan.**

- Inflation–restriction (Mathlib groupCohomology.H1InfRes and H1InfRes_exact): 0 → H¹(G/N, A^N) → H¹(G, A) → H¹(N, A) is exact; with A^N = 0 the restriction is injective.
- The image of restriction consists of G/N-invariant classes (conjugation action), which vanish by hypothesis, so H¹(G, A) = 0.
- Topological translation: the homotopy exact sequence π₁(F) → π₁(E) → π₁(B) → 1 identifies G/N with π₁(B); R¹π_*W is the local system on B with fibre H¹(F, W|_F) and monodromy the conjugation action; this is the Leray five-term sequence used by Landesman–Litt.

**Acceptance.**

- Recovers the vanishing H¹(𝒞°, ad V) = 0 of Landesman–Litt Proposition 8.2.1 from π°_* ad V = 0 and H⁰(M, R¹π°_* ad V) = 0.
- For G = N the statement reduces to H¹(G, A) = 0 being one of the hypotheses.

**Direct prerequisites.**

- `mathlib:groupCohomology.H1InfRes`
- `mathlib:groupCohomology.H1InfRes_exact`
- `mathlib:groupCohomology.H1`
- `HodgeStructuresPartII:H.5/trace-free-adjoint`
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`
- `HodgeStructuresPartII:H.5/adjoint-no-invariants`

**Sources.**

- LL24, §8.2, proof of Proposition 8.2.1, p.39: Leray reduction to H⁰(M, R¹π°_*) and H¹(M, π°_*).

**Suggested signature coverage.** native. Native: `fibrewise_h1_vanishing`.

### Low-rank local systems with irreducible unitary fibres are strongly cohomologically rigid

`HodgeStructuresPartII:H.5/versal-unitary-rigidity` · theorem · implementation unchecked

Let π°: 𝒞° → M be a punctured versal family of n-pointed genus-g curves (as in HodgeStructuresPartII:H.4 and Landesman–Litt Notation 1.10.1), m ∈ M and C° = 𝒞°_m. Let V be a GL_r-local system (respectively a PGL_r-local system) on the total space 𝒞° with r < √(g+1), such that V|_{C°} is (respectively is the projectivization of) an irreducible unitary local system. Then H¹(𝒞°, ad V) = 0: V is strongly cohomologically rigid (HodgeStructuresPartII:H.5/strong-cohomological-rigidity), hence cohomologically rigid for every good compactification of 𝒞° (HodgeStructuresPartII:H.5/strong-implies-cohomological).

**Hypotheses.**

- r < √(g+1), i.e. rk ad V = r² − 1 < g, as needed for the Artinian unitary vanishing theorem of HodgeStructuresPartII:H.4 (Landesman–Litt Theorem 6.2.1 with A = ℂ).
- V lives on the total space 𝒞°; the unitarity and irreducibility hypotheses concern the restriction to one fibre (corrected statement of the routed item).
- Versal families of pointed curves are supplied through HodgeStructuresPartII:H.4 and the mapping-class-group roadmap proposed with the Landesman–Litt route.

**Proof plan.**

- By HodgeStructuresPartII:H.5/fibrewise-h1-vanishing it suffices that π°_* ad V = 0 and H⁰(M, R¹π°_* ad V) = 0.
- π°_* ad V = 0: ad V|_{C°} = ad⁰ of an irreducible local system has no invariants by Schur's lemma (HodgeStructuresPartII:H.5/trace-free-adjoint API invariants_eq_bot).
- H⁰(M, R¹π°_* ad V) = 0 by Landesman–Litt Theorem 6.2.1 with A = ℂ, since ad V|_{C°} is unitary of rank r² − 1 < g (HodgeStructuresPartII:H.4).

**Acceptance.**

- r = 1: ad V = 0 and the statement is trivial.
- The bound r < √(g+1) enters through rk ad V = r² − 1 < g.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/fibrewise-h1-vanishing`
- `HodgeStructuresPartII:H.5/strong-cohomological-rigidity`
- `HodgeStructuresPartII:H.5/strong-implies-cohomological`
- `HodgeStructuresPartII:H.5/trace-free-adjoint`
- `HodgeStructuresPartII:H.5/unitary-representation`
- `HodgeStructuresPartII:H.4/artinian-vanishing`
- `HodgeStructuresPartII:H.5/adjoint-projectivization`
- `HodgeStructuresPartII:H.5/adjoint-no-invariants`

**Sources.**

- LL24, §8.2, Proposition 8.2.1, p.39: Statement.
- LL24, §8.2, proof of Proposition 8.2.1, p.39: Use of the Artinian vanishing theorem.

**Suggested signature coverage.** omitted. Omitted: `versal_unitary_strongly_rigid`.

## Consumed API lemmas

### TraceFreeAdjoint.endSplitting

`HodgeStructuresPartII:H.5/trace-splitting` · lemma · implementation unchecked

If (r : K) ≠ 0, the Γ-representation M_r(K) by conjugation is isomorphic to rep ρ ⊕ (trivial K), via A ↦ (A − (tr A / r)·1, tr A / r).

**Hypotheses.**

- r is invertible in K.

**Proof plan.**

- Split the trace by A ↦ (A − (tr A/r)1, tr A/r); trace invariance proves equivariance.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/trace-free-adjoint`

**Sources.**

- LL24, §1.10, Notation 1.10.2, p.11: Derived API consequence supporting TraceFreeAdjoint.endSplitting. Pins ad ρ as Ad∘ρ on g^der, which for GL_r and PGL_r is the trace-free (pgl_r) coefficient system.
- EG20, §7, p.148: Derived API consequence supporting TraceFreeAdjoint.endSplitting. The trace-free endomorphisms End⁰(E,∇) are the coefficients of cohomological rigidity on the fixed-determinant moduli.
- KP20, §1, Definition 1.1, p.2: Derived API consequence supporting TraceFreeAdjoint.endSplitting. General reductive G: the coefficient module is g^der with Ad∘ρ.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/TraceFreeAdjoint`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** native. Native: `TraceFreeAdjoint.endSplitting`.

### TraceFreeAdjoint.projectivization

`HodgeStructuresPartII:H.5/adjoint-projectivization` · lemma · implementation unchecked

rep ρ depends only on the composite Γ → PGL_r(K) and, when r ∈ K^×, agrees with the adjoint representation on Lie(PGL_r) = pgl_r(K).

**Hypotheses.**

- K is a field; Γ is any group; ρ is a group homomorphism into G(K).
- The splitting End = End⁰ ⊕ (scalars) and the identification sl_r ≅ pgl_r require r to be invertible in K; neither is part of the definition.
- For the flat-bundle and Higgs versions, E is a vector bundle on a complex manifold (or smooth variety) X and the trace is the fibrewise matrix trace.

**Proof plan.**

- Scalar matrices act trivially by conjugation; identify sl_r with pgl_r when r is invertible.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/trace-free-adjoint`

**Sources.**

- LL24, §1.10, Notation 1.10.2, p.11: Derived API consequence supporting TraceFreeAdjoint.projectivization. Pins ad ρ as Ad∘ρ on g^der, which for GL_r and PGL_r is the trace-free (pgl_r) coefficient system.
- EG20, §7, p.148: Derived API consequence supporting TraceFreeAdjoint.projectivization. The trace-free endomorphisms End⁰(E,∇) are the coefficients of cohomological rigidity on the fixed-determinant moduli.
- KP20, §1, Definition 1.1, p.2: Derived API consequence supporting TraceFreeAdjoint.projectivization. General reductive G: the coefficient module is g^der with Ad∘ρ.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/TraceFreeAdjoint`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `TraceFreeAdjoint.projectivization`.
Native projectivization states invariance under pointwise scalar twists. The full Lie(PGL_r) comparison in this specification has no native PGL carrier and remains omitted.

### TraceFreeAdjoint.invariants_eq_bot

`HodgeStructuresPartII:H.5/adjoint-no-invariants` · lemma · implementation unchecked

If ρ is absolutely irreducible and r ∈ K^×, then the Γ-invariants of rep ρ are zero (Schur's lemma: commuting matrices are scalars, and the only trace-zero scalar is 0).

**Hypotheses.**

- ρ is absolutely irreducible; r is invertible in K.

**Proof plan.**

- Schur identifies the centralizer with scalars; invertibility of r kills a trace-zero scalar.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/trace-free-adjoint`

**Sources.**

- LL24, §1.10, Notation 1.10.2, p.11: Derived API consequence supporting TraceFreeAdjoint.invariants_eq_bot. Pins ad ρ as Ad∘ρ on g^der, which for GL_r and PGL_r is the trace-free (pgl_r) coefficient system.
- EG20, §7, p.148: Derived API consequence supporting TraceFreeAdjoint.invariants_eq_bot. The trace-free endomorphisms End⁰(E,∇) are the coefficients of cohomological rigidity on the fixed-determinant moduli.
- KP20, §1, Definition 1.1, p.2: Derived API consequence supporting TraceFreeAdjoint.invariants_eq_bot. General reductive G: the coefficient module is g^der with Ad∘ρ.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/TraceFreeAdjoint`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `TraceFreeAdjoint.invariants_eq_bot`.
Native no-invariants has an algebraically closed coefficient field and irreducibility. The packet states the general absolutely irreducible version; that generality remains omitted.

### TraceFreeAdjoint.baseChange

`HodgeStructuresPartII:H.5/adjoint-base-change` · lemma · implementation unchecked

For a field embedding σ: K → L, rep (σ ∘ ρ) ≅ (rep ρ) ⊗_{K,σ} L, compatibly with the matrix entries.

**Hypotheses.**

- K → L is an embedding of fields; ρ: Γ → GL_r(K).

**Proof plan.**

- The trace kernel commutes with flat extension of fields, and the matrix conjugation action commutes with applying the embedding entry by entry.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/trace-free-adjoint`

**Sources.**

- LL24, §1.10, Notation 1.10.2, p.11: Derived API consequence supporting TraceFreeAdjoint.baseChange. Pins ad ρ as Ad∘ρ on g^der, which for GL_r and PGL_r is the trace-free (pgl_r) coefficient system.
- EG20, §7, p.148: Derived API consequence supporting TraceFreeAdjoint.baseChange. The trace-free endomorphisms End⁰(E,∇) are the coefficients of cohomological rigidity on the fixed-determinant moduli.
- KP20, §1, Definition 1.1, p.2: Derived API consequence supporting TraceFreeAdjoint.baseChange. General reductive G: the coefficient module is g^der with Ad∘ρ.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/TraceFreeAdjoint`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `TraceFreeAdjoint.baseChange`.

### TraceFreeAdjoint.baseChange_H1

`HodgeStructuresPartII:H.5/adjoint-h1-base-change` · lemma · implementation unchecked

For finitely generated Γ and a field embedding σ: K → L, H¹(Γ, rep(σ∘ρ)) ≅ H¹(Γ, rep ρ) ⊗_{K,σ} L, in particular the dimensions agree (the cocycle space is cut out by K-linear equations in finitely many generator values).

**Hypotheses.**

- K → L is an embedding of fields; ρ: Γ → GL_r(K).
- Γ is finitely generated; no finite-presentation hypothesis is required.

**Proof plan.**

- Choose finitely many generators. Cocycle values lie in a finite-dimensional vector space and the relations impose linear equations. Their span has a finite basis even if the list of relations is infinite. Flat field extension preserves this kernel and the coboundary image; quotienting gives the tensor-product isomorphism.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/trace-free-adjoint`
- `HodgeStructuresPartII:H.5/adjoint-base-change`

**Sources.**

- LL24, §1.10, Notation 1.10.2, p.11: Derived API consequence supporting TraceFreeAdjoint.baseChange_H1. Pins ad ρ as Ad∘ρ on g^der, which for GL_r and PGL_r is the trace-free (pgl_r) coefficient system.
- EG20, §7, p.148: Derived API consequence supporting TraceFreeAdjoint.baseChange_H1. The trace-free endomorphisms End⁰(E,∇) are the coefficients of cohomological rigidity on the fixed-determinant moduli.
- KP20, §1, Definition 1.1, p.2: Derived API consequence supporting TraceFreeAdjoint.baseChange_H1. General reductive G: the coefficient module is g^der with Ad∘ρ.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/TraceFreeAdjoint`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** native. Native: `TraceFreeAdjoint.baseChange_H1`.

### RigidLocus.field_isClopen

`HodgeStructuresPartII:H.5/rigid-locus-field-clopen` · lemma · implementation unchecked

If S = Spec K for a field K and M is of finite type, RigidLocus f is closed and open, finite over K, and its complement has no isolated points.

**Hypotheses.**

- The scheme is of finite type over a field.

**Proof plan.**

- For a finite-type scheme over a field, isolated points form its finitely many zero-dimensional irreducible components; each is open and closed, with its local scheme structure.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/rigid-locus`

**Sources.**

- EG20, §3.1, Definition 3.2, p.123: Derived API consequence supporting RigidLocus.field_isClopen. The rigid locus is the quasi-finite locus.
- EG20, §3.1, p.121: Derived API consequence supporting RigidLocus.field_isClopen. Over ℂ the rigid locus is the closed (and open) subscheme of isolated points.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Locus`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** native. Native: `RigidLocus.field_isClopen`.

### RigidLocus.fibre

`HodgeStructuresPartII:H.5/rigid-locus-fibre` · lemma · implementation unchecked

For s ∈ S, the fibre of RigidLocus f over s is the rigid locus of the fibre M_s → Spec κ(s), i.e. the isolated points of M_s.

**Hypotheses.**

- f locally of finite type (Mathlib's openness theorem needs only this).
- Over a field, M of finite type, so that the rigid locus is finite and closed as well as open.

**Proof plan.**

- Use the baseline characterization by an open singleton in a fibre; over a geometric field quasi-finiteness is exactly isolation. Retain the open subscheme structure.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/rigid-locus`

**Sources.**

- EG20, §3.1, Definition 3.2, p.123: Derived API consequence supporting RigidLocus.fibre. The rigid locus is the quasi-finite locus.
- EG20, §3.1, p.121: Derived API consequence supporting RigidLocus.fibre. Over ℂ the rigid locus is the closed (and open) subscheme of isolated points.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Locus`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `RigidLocus.fibre`.

### RigidLocus.equivariant

`HodgeStructuresPartII:H.5/rigid-locus-equivariant` · lemma · implementation unchecked

If a group acts on M and S compatibly with f, the action preserves RigidLocus f.

**Hypotheses.**

- f locally of finite type (Mathlib's openness theorem needs only this).
- Over a field, M of finite type, so that the rigid locus is finite and closed as well as open.

**Proof plan.**

- An equivariant automorphism identifies the relevant fibres and preserves isolation, hence preserves the quasi-finite open subscheme.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/rigid-locus`

**Sources.**

- EG20, §3.1, Definition 3.2, p.123: Derived API consequence supporting RigidLocus.equivariant. The rigid locus is the quasi-finite locus.
- EG20, §3.1, p.121: Derived API consequence supporting RigidLocus.equivariant. Over ℂ the rigid locus is the closed (and open) subscheme of isolated points.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Locus`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** native. Native: `RigidLocus.equivariant`.

### SystemOfHodgeBundles.scaleIso

`HodgeStructuresPartII:H.5/hodge-system-scaling` · lemma · implementation unchecked

For t ∈ ℂ^×, the isomorphism (E,tθ) → (E,θ) acting by t^p on E^p, i.e. (φ ⊗ id)(tθ(e)) = θ(φ(e)).

**Hypotheses.**

- θ is an integrable Higgs field (θ ∧ θ = 0), as in HodgeStructuresPartII:H.0/twisted-higgs with trivial twist.
- The grading is by subbundles (locally free summands), not merely subsheaves.

**Proof plan.**

- On degree p multiply by t^p. Since θ lowers degree by one, this intertwines tθ with θ; inverse multiplication gives an isomorphism.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/system-of-hodge-bundles`

**Sources.**

- S92, §4, p.44: Derived API consequence supporting SystemOfHodgeBundles.scaleIso. Definition (θ printed as 6 in the scan).
- S92, §4, p.45: Derived API consequence supporting SystemOfHodgeBundles.scaleIso. Systems of Hodge bundles are scaling-fixed.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/HodgeBundles`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `SystemOfHodgeBundles.scaleIso`.
Native scaling is for the finite-free cotangent module chart. The sheaf-valued system and its Higgs isomorphism remain omitted.

### SystemOfHodgeBundles.nilpotent

`HodgeStructuresPartII:H.5/hodge-system-nilpotent` · lemma · implementation unchecked

θ is nilpotent with joint bound the number of nonzero degrees (HodgeStructuresPartII:H.0/joint-nilpotence).

**Hypotheses.**

- θ is an integrable Higgs field (θ ∧ θ = 0), as in HodgeStructuresPartII:H.0/twisted-higgs with trivial twist.
- The grading is by subbundles (locally free summands), not merely subsheaves.

**Proof plan.**

- Each application lowers the degree. Beyond the finite support interval every iterated component vanishes.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/system-of-hodge-bundles`

**Sources.**

- S92, §4, p.44: Derived API consequence supporting SystemOfHodgeBundles.nilpotent. Definition (θ printed as 6 in the scan).
- S92, §4, p.45: Derived API consequence supporting SystemOfHodgeBundles.nilpotent. Systems of Hodge bundles are scaling-fixed.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/HodgeBundles`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** partial. Native: `SystemOfHodgeBundles.nilpotent`.
Native nilpotence is for contractions in the finite-free cotangent module chart. The full sheaf-valued joint-nilpotence statement remains omitted.

### IsUnitaryRepresentation.iff_conj_unitaryGroup

`HodgeStructuresPartII:H.5/unitary-conjugation` · lemma · implementation unchecked

IsUnitaryRepresentation ρ ↔ ∃ P ∈ GL_r(ℂ), ∀ γ, P ρ(γ) P⁻¹ ∈ Matrix.unitaryGroup (Fin r) ℂ.

**Hypotheses.**

- Γ any group; ℂ with its usual topology; the compact-closure and invariant-form definitions agree by averaging over the compact closure with Haar measure.

**Proof plan.**

- Import compact-group unitarizability from CompactGroups layer 1 and choose an orthonormal basis; conversely use compactness of U(r) and conjugation as a homeomorphism.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/unitary-representation`
- `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-1-unitarizability-weyls-unitarian-trick`

**Sources.**

- LL24, §1.10, Notation 1.10.2, p.11: Derived API consequence supporting IsUnitaryRepresentation.iff_conj_unitaryGroup. Definition.
- LL24, §1.10, Notation 1.10.2, p.11: Derived API consequence supporting IsUnitaryRepresentation.iff_conj_unitaryGroup. Equivalent characterizations.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Unitary`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** native. Native: `IsUnitaryRepresentation.iff_conj_unitaryGroup`.

### IsUnitaryRepresentation.iff_invariant_form

`HodgeStructuresPartII:H.5/unitary-invariant-form` · lemma · implementation unchecked

IsUnitaryRepresentation ρ ↔ ρ preserves a positive-definite Hermitian form on ℂ^r.

**Hypotheses.**

- Γ any group; ℂ with its usual topology; the compact-closure and invariant-form definitions agree by averaging over the compact closure with Haar measure.

**Proof plan.**

- The compact-group owner supplies an invariant positive form. Conversely a preserved positive form gives conjugacy into U(r), hence compact closure.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/unitary-representation`
- `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-1-unitarizability-weyls-unitarian-trick`

**Sources.**

- LL24, §1.10, Notation 1.10.2, p.11: Derived API consequence supporting IsUnitaryRepresentation.iff_invariant_form. Definition.
- LL24, §1.10, Notation 1.10.2, p.11: Derived API consequence supporting IsUnitaryRepresentation.iff_invariant_form. Equivalent characterizations.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Unitary`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** native. Native: `IsUnitaryRepresentation.iff_invariant_form`.

### IsUnitaryRepresentation.semisimple

`HodgeStructuresPartII:H.5/unitary-semisimple` · lemma · implementation unchecked

A unitary representation is semisimple (orthogonal complements of subrepresentations are subrepresentations).

**Hypotheses.**

- Γ any group; ℂ with its usual topology; the compact-closure and invariant-form definitions agree by averaging over the compact closure with Haar measure.

**Proof plan.**

- The orthogonal complement of every invariant subspace for an invariant positive form is invariant, yielding complete reducibility.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/unitary-representation`
- `HodgeStructuresPartII:H.5/unitary-invariant-form`

**Sources.**

- LL24, §1.10, Notation 1.10.2, p.11: Derived API consequence supporting IsUnitaryRepresentation.semisimple. Definition.
- LL24, §1.10, Notation 1.10.2, p.11: Derived API consequence supporting IsUnitaryRepresentation.semisimple. Equivalent characterizations.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/Unitary`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** native. Native: `IsUnitaryRepresentation.semisimple`.

### HodgeRigidLocus.nonzeroTrivialization

`HodgeStructuresPartII:H.5/rigid-hodge-nonzero` · lemma · implementation unchecked

M^rig_Hod ×_{𝔸¹} 𝔾_m ≅ M^rig_dR × 𝔾_m over 𝔾_m, (λ, E, D) ↦ ((E, λ⁻¹D), λ).

**Hypotheses.**

- X smooth connected projective; stable fixed-determinant moduli on the vanishing-Chern-class component.
- q is of finite type, so the quasi-finite locus is open (Mathlib).

**Proof plan.**

- Restrict the H.1 scaling trivialization of the Hodge moduli over 𝔾_m to the quasi-finite locus; equivariance identifies the rigid fibres.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/hodge-rigid-locus`
- `HodgeStructuresPartII:H.5/rigid-locus-equivariant`

**Sources.**

- EG20, §4.2, p.132: Derived API consequence supporting HodgeRigidLocus.nonzeroTrivialization. Definition.
- EG20, §4.2, proof of Lemma 4.9, p.132: Derived API consequence supporting HodgeRigidLocus.nonzeroTrivialization. Nonzero trivialization of the Hodge moduli.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/HodgeLocus`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `HodgeRigidLocus.nonzeroTrivialization`.

### ArithmeticModel.spread_hom

`HodgeStructuresPartII:H.5/arithmetic-spread-morphisms` · lemma · implementation unchecked

Morphisms, sections and isomorphisms of finitely presented objects over X extend over some restriction of S, uniquely after further shrinking (EGA IV 8.8.2(i), Mathlib Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType).

**Hypotheses.**

- X smooth connected projective over ℂ (or quasi-projective with a good compactification for the boundary version).
- The limit theorems of EGA IV §8 for finitely presented schemes, morphisms, quasi-coherent modules and the properties smooth, projective, geometrically connected, and openness of the smooth locus (EGA IV 17.7.8), are requested from SchemeAndStackFoundations:SF.0; Mathlib supplies the morphism part (Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType).

**Proof plan.**

- Import finite-presentation existence of descent from SF.0. For equalities between already descended maps use the pinned affine-transition equality theorem, verifying quasi-compactness; invert one nonzero element to make finitely many data and equalities hold simultaneously.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/smooth-arithmetic-model`

**Sources.**

- EG20, §3.1, Lemma 3.1, p.122: Derived API consequence supporting ArithmeticModel.spread_hom. Smoothness of the base.
- EG20, §3.1, proof of Lemma 3.1, p.122: Derived API consequence supporting ArithmeticModel.spread_hom. Spreading smoothness and projectivity (EGA IV 8.8.2, 8.10.5).
- EG18, §3, p.6: Derived API consequence supporting ArithmeticModel.spread_hom. Models with compactification, boundary and base point.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/ArithmeticModel`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `ArithmeticModel.spread_hom`.

### RelativeModuli.stableGenericIso

`HodgeStructuresPartII:H.5/relative-stable-complex-fibre` · lemma · implementation unchecked

The stable open base-changes to the stable moduli of HodgeStructuresPartII:H.1/derham-coarse, HodgeStructuresPartII:H.1/dolbeault-coarse, HodgeStructuresPartII:H.1/hodge-coarse over ℂ.

**Hypotheses.**

- S of finite type over ℤ (a universally Japanese ring), X_S → S projective with geometrically connected fibres and a relatively very ample O(1).
- Boundedness of semistable Λ-modules in positive and mixed characteristic (Langer) and GIT over a universally Japanese base (Seshadri) are the inputs; the GIT part is requested from AlgebraicModuliForArithmeticGeometry:R09.5 and R09.2, and Langer's boundedness is recorded as a gap.
- Over geometric points of positive characteristic, M_dR is a moduli of Λ-modules for crystalline differential operators; it is not asserted to be related to M_Dol by a homeomorphism.

**Proof plan.**

- Universal corepresentation of the geometrically stable family functor is compatible with base change; identify the complex fibre with the H.1 stable coarse moduli using uniqueness of corepresenting objects.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/relative-moduli`

**Sources.**

- Langer14, §1, Theorem 1.1, p.4: Derived API consequence supporting RelativeModuli.stableGenericIso. Existence of relative moduli of Λ-modules.
- Langer14, §1, Theorem 1.1, p.4: Derived API consequence supporting RelativeModuli.stableGenericIso. Geometric points.
- EG20, §3.1, p.122: Derived API consequence supporting RelativeModuli.stableGenericIso. Use of Langer's moduli over arithmetic bases with geometric-point base change only.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Rigid/RelativeModuli`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `RelativeModuli.stableGenericIso`.

### IsIntegralRepresentation.iff_projectiveLattice

`HodgeStructuresPartII:H.5/integral-projective-lattice` · lemma · implementation unchecked

For G = GL_r, integral ↔ the local system comes by extension of scalars from a local system of finitely generated projective 𝒪_K-modules.

**Hypotheses.**

- Γ any group (finitely generated for the GL_r(ℤ̄) reformulation and for the local criterion); G an affine group scheme over ℤ.
- The conjugator is in G(ℂ), not G(K); integrality is a property of the conjugacy class.

**Proof plan.**

- An integral matrix realization gives a free lattice. Conversely a finite projective lattice over 𝒪_K becomes free after a finite extension that principalizes its Steinitz class; its stable action then gives an integral matrix realization.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/integral-representation`

**Sources.**

- LL24, §8.3, Definition 8.3.1, p.39: Derived API consequence supporting IsIntegralRepresentation.iff_projectiveLattice. Definition.
- EG18, §1, p.1: Derived API consequence supporting IsIntegralRepresentation.iff_projectiveLattice. Projective-lattice formulation.
- EG20, §6, Remark 6.2, p.146: Derived API consequence supporting IsIntegralRepresentation.iff_projectiveLattice. Formulation with the ring of all algebraic integers (bar lost in the text layer).

**Library location.** `TauCeti/Geometry/NonabelianHodge/Integral/Basic`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `IsIntegralRepresentation.iff_projectiveLattice`.

### IsOfGeometricOrigin.iff_summand

`HodgeStructuresPartII:H.5/geometric-origin-summand` · lemma · implementation unchecked

Equivalent with 'direct summand' in place of 'subquotient' (semisimplicity).

**Hypotheses.**

- X smooth connected over ℂ; f smooth projective (Esnault–Groechenig, Langer–Simpson) — Landesman–Litt allow smooth proper f; record which variant a consumer uses.

**Proof plan.**

- The smooth projective cohomology variation from H.2 is semisimple. Its subquotients are therefore direct summands as local systems.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/geometric-origin`
- `HodgeStructuresPartII:H.2/complex-semisimple`

**Sources.**

- LL24, §9.1, p.45: Derived API consequence supporting IsOfGeometricOrigin.iff_summand. Landesman–Litt's definition (smooth proper).
- LS18, §1, p.1: Derived API consequence supporting IsOfGeometricOrigin.iff_summand. Langer–Simpson's definition (smooth projective, direct factor).
- EG20, §1, p.104: Derived API consequence supporting IsOfGeometricOrigin.iff_summand. Esnault–Groechenig's Gauss–Manin formulation.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Integral/GeometricOrigin`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `IsOfGeometricOrigin.iff_summand`.

### IsOfGeometricOrigin.quasiUnipotent

`HodgeStructuresPartII:H.5/geometric-origin-boundary` · lemma · implementation unchecked

Local systems of geometric origin have quasi-unipotent local monodromy at infinity (local monodromy theorem, LefschetzPencilsAndVanishingCycles:LPV.1).

**Hypotheses.**

- X smooth connected over ℂ; f smooth projective (Esnault–Groechenig, Langer–Simpson) — Landesman–Litt allow smooth proper f; record which variant a consumer uses.

**Proof plan.**

- Apply the local monodromy theorem from LPV.1 to the smooth projective family over the witness open, then pass to the subquotient. At divisors where the given local system extends, the monodromy is trivial.

**Acceptance.**

- Provides the named API fact for the consuming nodes without unfolding the parent definition.

**Direct prerequisites.**

- `HodgeStructuresPartII:H.5/geometric-origin`
- `LefschetzPencilsAndVanishingCycles:LPV.1`

**Sources.**

- LL24, §9.1, p.45: Derived API consequence supporting IsOfGeometricOrigin.quasiUnipotent. Landesman–Litt's definition (smooth proper).
- LS18, §1, p.1: Derived API consequence supporting IsOfGeometricOrigin.quasiUnipotent. Langer–Simpson's definition (smooth projective, direct factor).
- EG20, §1, p.104: Derived API consequence supporting IsOfGeometricOrigin.quasiUnipotent. Esnault–Groechenig's Gauss–Manin formulation.

**Library location.** `TauCeti/Geometry/NonabelianHodge/Integral/GeometricOrigin`; namespace `TauCeti.NonabelianHodge`.

**Suggested signature coverage.** omitted. Omitted: `IsOfGeometricOrigin.quasiUnipotent`.

## Boundaries and suppliers

H.0, H.1, H.2 and H.4 supply their own objects and theorems by node reference. H.2 has no lattice in the complex PVHS definition. H.4 supplies the precise parabolic and Artinian inputs; it does not settle the recorded isomonodromy gap. Compact-group averaging belongs to the existing Tau Ceti CompactGroups layer. Cartier-flow and rigid-companion successors consume this layer and are never imported into it.

**`AlgebraicModuliForArithmeticGeometry:R09.5`.** Reductive GIT quotients of affine (and projective, relatively ample linearized) schemes of finite type by GL_N, PGL_r and SL_r over a universally Japanese base (Seshadri), with good/geometric quotient properties; Luna's étale slice for a free action of PGL_r on the absolutely irreducible locus of the representation scheme, making R_B^s → M_B^s a principal PGL_r-bundle for the étale topology, and at closed orbits of the representation spaces of H.1 (used with Goldman–Millson theory for completed local rings); μ_r-rigidification of stacks whose automorphism groups are μ_r.

Consumers: `HodgeStructuresPartII:H.5/betti-tangent`, `HodgeStructuresPartII:H.5/projective-rigidity`, `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`, `HodgeStructuresPartII:H.5/relative-moduli`, `HodgeStructuresPartII:H.5/derham-betti-tangent`.

**`AlgebraicModuliForArithmeticGeometry:R09.4`.** Quotient stacks [R/SL_r] of affine schemes of finite type, locally closed and open substacks, and the coarse moduli space of a finite-type algebraic stack with finite (μ_r) inertia, as used for the moduli of irreducible representations with prescribed local monodromy.

Consumers: `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`.

**`AlgebraicModuliForArithmeticGeometry:R09.1`.** Grassmann bundles Gr(W, k) of a locally free sheaf with their properness over the base, used to show that geometric irreducibility of a family of representations is an open condition.

Consumers: `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`.

**`AlgebraicModuliForArithmeticGeometry:R09.2`.** Quot schemes of a projective morphism over a base of finite type over a universally Japanese ring, with the framed-section parameter schemes used to construct relative moduli of Λ-modules.

Consumers: `HodgeStructuresPartII:H.5/relative-moduli`.

**`AlgebraicModuliForArithmeticGeometry:R09.7d`.** Existence of a good compactification: every smooth quasi-projective complex variety X embeds as the complement of a strict normal crossings divisor in a smooth projective variety, and any two good compactifications are dominated by a third.

Consumers: `HodgeStructuresPartII:H.5/boundary-monodromy-data`.

**`ComplexComparisonPartII:C5`.** The algebraic de Rham–Betti comparison with coefficients in an algebraic flat bundle on a smooth projective complex variety: H^i_dR(X, (E,∇)) ≅ H^i(X^an, E^∇), natural in (E,∇) and compatible with End⁰; and for smooth projective families the Gauss–Manin identification R^i f_* ℂ ⊗ O ≅ R^i f_*(Ω^•_{Y/U}, d). The stage's stated scope covers constant coefficients.

Consumers: `HodgeStructuresPartII:H.5/derham-betti-tangent`, `HodgeStructuresPartII:H.5/geometric-origin`, `HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs`.

**`EtaleDualityAndPerverseSheaves:EDC.5`.** The intermediate extension j_{!*} for an open immersion with strict normal crossings complement and the triangle j_{!*}F → Rb_* a_* F → C with C supported on the singular locus of the boundary in degrees ≥ 2 (BBD Proposition 2.1.11), giving H¹(X̄, j_{!*}F) ≅ H¹(U, a_* F) for lisse sheaves.

Consumers: `HodgeStructuresPartII:H.5/intermediate-extension-h1`.

**`LefschetzPencilsAndVanishingCycles:LPV.1`.** The local monodromy theorem: local systems of geometric origin (subquotients of R^i f_* for smooth proper f) have quasi-unipotent local monodromy around the components of a normal crossings boundary.

Consumers: `HodgeStructuresPartII:H.5/boundary-monodromy-data`, `HodgeStructuresPartII:H.5/geometric-origin`.

**`SchemeAndStackFoundations:SF.0`.** EGA IV §8 limit theorems for a cofiltered limit of affine schemes (ℂ as the colimit of its finitely generated subrings): descent of finitely presented schemes, morphisms, sections, finitely presented quasi-coherent modules and their morphisms (8.5.2, 8.5.5, 8.8.2), of the properties smooth, projective, geometrically connected (8.10.5), openness of the smooth locus (17.7.8); Zariski's main theorem in the form EGA IV 8.12.6 (quasi-finite, separated, finitely presented morphisms factor through open immersions into finite schemes), or finiteness of the relative normalization of a reduced scheme over an excellent (Nagata) base for Mathlib's form.

Consumers: `HodgeStructuresPartII:H.5/smooth-arithmetic-model`, `HodgeStructuresPartII:H.5/simultaneous-spreading`, `HodgeStructuresPartII:H.5/nilpotent-rigid-models`, `HodgeStructuresPartII:H.5/rigid-locus-exhaustion`.

**`GlobalShtukasAndFunctionFieldLanglands:GS.6`.** L. Lafforgue's correspondence for GL_r over function fields with its consequences for irreducible lisse ℚ̄_ℓ-sheaves with finite-order determinant on curves over finite fields (purity, integrality of Frobenius eigenvalues, existence of ℓ′-companions), and Drinfeld's extension of companions to smooth varieties of any dimension (Drinfeld 2012 Theorem 1.1; G-valued version Drinfeld 2018), as used by Esnault–Groechenig 2018 and Klevdal–Patrikis.

Consumers: `HodgeStructuresPartII:H.5/integrality-EG18`, `HodgeStructuresPartII:H.5/integrality-KP`.

**`DeligneWeightsAndPurity:DWP.7`.** Weights of H^j(X_s̄, A) ≥ j for pure lisse sheaves on smooth varieties over finite fields (Weil II 3.3.1), and the resulting identification of H¹(X̄_s̄, j_{!*}A) with the weight-one part of ⊕_j H^j(X_s̄, A) for pure tame A of weight 0 (Esnault–Groechenig 2018 Lemma 3.4).

Consumers: `HodgeStructuresPartII:H.5/integrality-EG18`.

**`InverseGaloisAndArithmeticFundamentalGroups:IG.1`.** Grothendieck's tame specialization homomorphism π₁^ét(X) → π₁^{ét,p′}(X_s̄) for a smooth model with relative normal crossings boundary over a strictly henselian trait, surjective and an isomorphism on prime-to-p quotients (SGA1 X 2.4, XIII 4.7), and the prime-to-p homotopy exact sequence.

Consumers: `HodgeStructuresPartII:H.5/integrality-EG18`, `HodgeStructuresPartII:H.5/integrality-KP`.

**`ClassicalArithmeticCompletion:CA.6`.** Salem numbers: certification that x⁴ − x³ − x² − x + 1 is irreducible with exactly two roots on the unit circle that are not roots of unity (conjugate moduli certificate), supplying an algebraic integer of absolute value one that is not a root of unity.

Consumers: `HodgeStructuresPartII:H.5/infinite-image-unitary-example`.

**`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.** For a Serre fibration F → E → B of path-connected spaces: the homotopy exact sequence π₁(F) → π₁(E) → π₁(B) → 1 and the identification of the local system R¹π_*W on B with fibre H¹(F, W|_F) and monodromy the conjugation action (low-degree Leray–Serre five-term sequence for local coefficients).

Consumers: `HodgeStructuresPartII:H.5/fibrewise-h1-vanishing`.

**`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.** Singular cohomology with local coefficients and its degree-one identification H¹(X, W) ≅ H¹(π₁(X, x), W_x) for path-connected, locally simply connected X, functorial in X and W.

Consumers: `HodgeStructuresPartII:H.5/prescribed-monodromy-tangent`.

**`tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-1-unitarizability-weyls-unitarian-trick`.** Unitarizability of a finite-dimensional continuous complex representation of a compact group: an invariant positive-definite Hermitian form, obtained from normalized Haar measure, with change to an orthonormal basis conjugating the action into U(r).

Consumers: `HodgeStructuresPartII:H.5/unitary-representation`.

## Gaps

**Quasi-projective non-abelian Hodge theory (Mochizuki).** Mochizuki's Kobayashi–Hitchin correspondence for tame harmonic bundles (Memoirs AMS 2007, Theorem 10.5 and Lemma 10.13), with the determinant refinement stated by Landesman–Litt Theorem 4.3.1, is not planned by any layer: HodgeStructuresPartII:H.1 is projective only. Needed for deformation to variations on quasi-projective X and for Landesman–Litt Lemma 4.3.2. Proposed owner: a further stage of this roadmap after H.4, or a Part II of H.1.

Needed by `HodgeStructuresPartII:H.5/deformation-to-cvhs`, `HodgeStructuresPartII:H.5/coh-rigid-semisimple-cvhs`, `HodgeStructuresPartII:H.5/low-rank-pvhs-unitary`.

**ℓ-adic companions on smooth varieties over finite fields.** Drinfeld 2012 Theorem 1.1 (and Drinfeld 2018 for connected G-monodromy), Deligne's theorem on local monodromy of compatible systems on curves [Deligne 1973, 9.8], Saito's local acyclicity [Saito 2017, Lemma 3.14] and the Kerz–Schmidt tameness criterion are used by Esnault–Groechenig 2018 and Klevdal–Patrikis but are not stated by GS.6, which plans Lafforgue's curve correspondence. The Klevdal–Patrikis 2025 route proposes 'Global shtukas and Langlands over function fields, Part II: group-valued companions and monodromy' and 'Inverse Galois theory and arithmetic fundamental groups, Part II: tame specialization over arithmetic traits' as owners; neither has a design yet.

Needed by `HodgeStructuresPartII:H.5/integrality-EG18`, `HodgeStructuresPartII:H.5/integrality-KP`.

**Boundedness of semistable Λ-modules in positive and mixed characteristic.** Langer's Theorem 1.1 rests on Langer, Semistable sheaves in positive characteristic (Annals 2004) and Moduli spaces of sheaves in mixed characteristic (Duke 2004). HodgeStructuresPartII:H.1/operator-boundedness covers characteristic zero only. Proposed owner: AlgebraicModuliForArithmeticGeometry (R09.2/R09.5) or a Part II of H.1 over arithmetic bases.

Needed by `HodgeStructuresPartII:H.5/relative-moduli`.

**Analytic intermediate extension of local systems.** EDC.5 constructs j_{!*} for étale sheaves; the complex-analytic constructible version on X̄(ℂ) used by Esnault–Groechenig 2018 Remark 2.4 and Klevdal–Patrikis Remark 4.8 is not planned. The a_*-definition of HodgeStructuresPartII:H.5/cohomological-rigidity avoids it; only the comparison with the j_{!*} formulation needs it.

Needed by `HodgeStructuresPartII:H.5/intermediate-extension-h1`.

**Tannakian inputs for the equivariant splitting of the rigid Hodge locus.** Part (iv) of HodgeStructuresPartII:H.5/rigid-hodge-splitting (the 𝔾_m-equivariant isomorphism M^rig_Hod ≅ M^rig_Dol × 𝔸¹ with non-reduced structure, Esnault–Groechenig Lemma 4.9) has a planned proof from the étale-local triviality of (iii) by viewing the Isom-scheme as an Aut(A)-torsor on [𝔸¹/𝔾_m], i.e. a filtered fibre functor on Rep(Aut A), and splitting it by Ziegler's Theorem 1.3 (Aut(A) is smooth in characteristic 0). The Tannakian dictionary (torsors on [𝔸¹/𝔾_m] as filtered fibre functors; vector bundles on [𝔸¹/𝔾_m] as filtered vector spaces) and Ziegler's theorem are missing inputs that no layer of the atlas plans. Recorded also as source issue HodgeStructuresPartII/E-H5-2 for the printed proof.

Needed by `HodgeStructuresPartII:H.5/rigid-hodge-splitting`.

**Isomonodromic deformations and analytically general curves.** Landesman–Litt 2022 work on the universal cover T_{g,n} of M_{g,n}: isomonodromic deformations of flat bundles with regular singularities, analytically (very) general points, and the semistability of isomonodromic deformations (their Theorem 1.3.4 and Corollary 6.1.2). No layer plans these carriers; the parabolic semistability and Clifford bounds come from HodgeStructuresPartII:H.4, and mapping class groups and versal families from the proposed roadmap Mapping class groups and canonical representations of surface groups (DESIGN-MappingClassGroupsAndCanonicalRepresentations, pending). The low-rank deduction also uses LL22 Lemma 7.1.1, pp.49–50, and its Lemma 4.1.5 input: the parabolic Deligne extension of a polarized variation, with the top Hodge piece forced to be horizontal by semistability. H.4 parabolic-semistability defines the predicate but does not supply this Hodge-theoretic implication; retain that input in this gap.

Needed by `HodgeStructuresPartII:H.5/low-rank-pvhs-unitary`, `HodgeStructuresPartII:H.5/very-general-rank-bound`.

**Symmetric differentials, positivity and p-adic harmonic maps.** Brunebarbe–Klingler–Totaro Theorem 0.1 uses bigness of the cotangent bundle on images of period maps and Katzarkov–Zuo's p-adic harmonic maps; Arapura's Proposition 2.4 (their Theorem 4.1) is proved inside the atlas from H.1 (Hitchin properness and the non-abelian Hodge homeomorphism), as is part (c); part (b) is recorded with its hypotheses.

Needed by `HodgeStructuresPartII:H.5/no-symmetric-differentials`.

**Langer–Simpson's construction of geometric origin in rank three.** Langer–Simpson Theorem 1.3 (rigid integral irreducible SL_3 ⇒ geometric origin) constructs weight-one integral variations and families of abelian varieties; the theorem is recorded with its hypotheses. Its inputs (weight-one ℤ-variations are families of abelian varieties; Corlette–Simpson rank-two classification) are not planned.

Needed by `HodgeStructuresPartII:H.5/rigid-sl3-geometric`.

**Finite presentation of fundamental groups of smooth quasi-projective varieties.** The construction of R(Γ, L) uses a finite presentation of π₁(X^an, x) for smooth quasi-projective X (a finite CW structure from a triangulation of a compactification minus a normal crossings divisor). HodgeStructuresPartII:H.1 records the projective case in its gap G6; the quasi-projective case is the same topological input.

Needed by `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`.

**Native Lean carriers for the moduli statements.** The suggested file prototypes the group-theoretic, number-theoretic and scheme-theoretic (quasi-finite locus) parts natively; signatures that need the moduli spaces of H.1, line bundles with connections or polarized variations are listed in its omission inventory with their statements. They are to be replaced by native signatures once those carriers exist.

Needed by `HodgeStructuresPartII:H.5/rigid-connection`, `HodgeStructuresPartII:H.5/hodge-rigid-locus`, `HodgeStructuresPartII:H.5/relative-moduli`, `HodgeStructuresPartII:H.5/smooth-arithmetic-model`, `HodgeStructuresPartII:H.5/prescribed-monodromy-moduli`, `HodgeStructuresPartII:H.5/system-of-hodge-bundles`.

**Extension of a polarized variation from a dense open.** The geometric-origin proof also needs Schmid, Variation of Hodge structure (1973), Corollary 4.11: a polarized variation on a dense open extends when its underlying local system extends across the complement, with the applicable regularity hypotheses. H.2/geometric-pure, complex-semisimple and isotypic-hodge do not supply this extension theorem. Record the extension input separately, rather than attributing it to the entire H.2 stage. LL22 Lemma 7.2.1, pp.51–52, uses it explicitly.

Needed by `HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs`.

**Promoted Hitchin API at its existing H.1 owner.** H.1/hitchin-map already specifies HitchinMorph.scale and HitchinMorph.nilpotent_iff. These consumed API facts should become lemma nodes in the H.1 packet under PROTOCOL §4. This review cannot edit that packet. H.5 continues to cite the existing owner and does not duplicate its mathematics.

Needed by `HodgeStructuresPartII:H.5/rigid-higgs-nilpotent`, `HodgeStructuresPartII:H.5/no-symmetric-differentials`.

**Arithmetic lattice principalization and reductive strong approximation.** The GL_r route uses gluing integral lattices over number-field completions, the Steinitz description of finite projective modules over a Dedekind ring, and principalization after a finite extension. The reductive route uses lifting to the simply connected derived group after a finite extension and strong approximation to combine the local conjugators (KP20 Proposition 3.1, p.5). EG18 §1, pp.1–2, and KP20 §3 explain these inputs, but they are not supplied by a recorded baseline declaration or fine node here. Their arithmetic owner must provide these statements; no inaccessible Bass or Platonov–Rapinchuk book was read or reproduced.

Needed by `HodgeStructuresPartII:H.5/integral-projective-lattice`, `HodgeStructuresPartII:H.5/integrality-local-criterion`, `HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs`.

## Mistakes in the sources

These findings concern the specified versions and locators. Every account is in the reviewer’s own words. A confirmed proof gap does not by itself refute the theorem. The full reproducibility register is in the packet.

**HodgeStructuresPartII/E-H5-1 — misprint.** EG20, Proposition 4.10(c) and the two displays after it, published p.133; proof of Proposition 3.3, p.124.

Printed claim: Proposition 4.10(c) asserts that the λ-connections of part (b) give a bijection ⨆_{i=1}^{M}[(N^i_S,D^i_S)](|S|) = ⨆_{a=0}^{d−1}|M^rig_Hod(X,L,⩽r)|; the second display has ⨆_{a=0}^{d} M^rig_dR(X/C,L^a,R)(C), and the proof of Proposition 3.3 refers to a model (X_S,L_S) satisfying conditions (a)–(f).

Correction: Read ⨆_i [(N^i_S,D^i_S)](|S × 𝔸¹|) = ⨆_{a=0}^{d−1} |M^rig_Hod(X_S/S, L_S^a, ⩽ r)|; in the second display a runs to d − 1 and R is r; in the proof of Proposition 3.3 read (a)–(d). Node HodgeStructuresPartII:H.5/nice-hodge-models states the corrected version.

Reason: L has order d, so the determinants are L^0, …, L^{d−1}; a term without a has no dependence on the index; the sections are defined on S × 𝔸¹ (they are λ-connections relative to λ = pr₂); Proposition 3.3 has parts (a)–(e), (e) being proved at that point.

Independent review: confirmed. Confirmed the missing determinant powers, affine-line parameter in the section domain, duplicate determinant endpoint and part-label mismatch at published p.133 and p.124. These are transcription errors; the corrected mathematical statements are retained.

Previous record: Recorded in the atlas as PAPER-ESNAULT-GROECHENIG-20/E9 (confirmed by REV-PAPER-ESNAULT-GROECHENIG-20); the S × 𝔸¹ domain is added here. No published correction found.

**HodgeStructuresPartII/E-H5-2 — gap.** EG20, Lemma 4.9 and its proof, published p.132.

Printed claim: Lemma 4.9 claims that M^rig_Hod(X/C, L, r) → A¹ is finite and flat and splits G_m-equivariantly as M^rig_Dol(X/C, L, r) ×_C A¹; its proof concludes from [Si4, Theorem 9.1], which makes M_Hod(X/C, L, r) étale-locally a product of M_Dol(X/C, L, r) with A¹ near a complex point of the λ = 0 fibre.

Correction: Finiteness needs the observation that every point of the rigid locus lies on the Rees section of a rigid variation (so the reduced locus is a finite disjoint union of sections); the global 𝔾_m-equivariant isomorphism including non-reduced structure needs, beyond étale-local triviality, the classification of 𝔾_m-equivariant étale-locally trivial finite flat families over 𝔸¹: the Isom-scheme is an Aut(A)-torsor on [𝔸¹/𝔾_m], a filtered fibre functor, split by a cocharacter in characteristic 0 (Ziegler, Theorem 1.3). Node HodgeStructuresPartII:H.5/rigid-hodge-splitting records this conditional repair and its missing Tannakian input; no contradiction to the lemma statement was found.

Reason: Simpson's Theorem 9.1 gives étale neighbourhoods U → M_Hod,0 × 𝔸¹ that are étale, not 𝔾_m-equivariant isomorphisms; combined with the trivialization over 𝔾_m it shows that each component of the rigid locus is étale locally Spec(A) × 𝔸¹, which does not by itself give a global equivariant product (an equivariant finite flat family can be étale locally trivial without the trivialization being equivariant), and the printed proof does not address finiteness at all. The isomorphism is used again on p.135 (before Claim 4.14) for W_i(k(s))-points of the arithmetic rigid loci, which also needs it to spread to the model of Proposition 4.10, whose part (c) is a bijection of underlying sets.

Independent review: confirmed. Confirmed a proof gap at published p.132: Simpson §9 gives an étale local product, which does not alone provide the global equivariant trivialization including nilpotents. The packet explicitly retains the filtered-fibre-functor/Ziegler input as a gap; this verdict does not claim a counterexample to the lemma.

Previous record: new

**HodgeStructuresPartII/E-H5-3 — misprint.** EG20, §1, last display of the introduction, published p.106; compare §7 p.148.

Printed claim: The introduction calls [(E, ∇)] cohomologically rigid when it is a reduced isolated point of M_dR(X, L, r), and equates this with H¹_dR(X, (End(E), ∇)) = 0, using End rather than the trace-free End⁰.

Correction: H¹_dR(X, End⁰(E,∇)) = 0 with trace-free endomorphisms, as on p.148; node HodgeStructuresPartII:H.5/cohomological-rigidity uses trace-free coefficients throughout.

Reason: End(E,∇) = End⁰(E,∇) ⊕ (O_X, d) in characteristic zero, so the printed group contains H¹(X, ℂ), nonzero whenever b₁(X) > 0, and the printed condition would never hold on such X.

Independent review: confirmed. Confirmed at published p.106 by comparison with §7 p.148. The scalar summand contributes H¹(X,ℂ); fixed-determinant tangent coefficients must be End⁰.

Previous record: Recorded in the atlas as PAPER-ESNAULT-GROECHENIG-20/E1 (confirmed by REV-PAPER-ESNAULT-GROECHENIG-20). No published correction found.

**HodgeStructuresPartII/E-H5-4 — misprint.** EG18, §3, proof of Theorem 1.1, arXiv v3 p.12; published p.4291.

Printed claim: In the proof of Theorem 1.1, the Betti–étale comparison is used to conclude H¹(U, a_* End(V_i^{σ top})) = 0, with End in place of the trace-free End⁰.

Correction: H¹(U, a_* End⁰(V_i^{σ top})) = 0, the trace-free endomorphisms, as in the preceding sentences (H¹(U, a_* A^σ_i) = 0 with A^σ_i = End⁰(V^σ_{i,λ,s})).

Reason: The vanishing is transported from A^σ_i = End⁰(·), defined on p.11; with End the group contains H¹(U, a_* ℂ), which need not vanish, and only the trace-free statement is cohomological rigidity.

Independent review: confirmed. Confirmed in arXiv v3 p.12 and in the author-hosted published Selecta text p.4291. The preceding transport is for End⁰, while the final displayed comparison drops the superscript.

Previous record: new

**HodgeStructuresPartII/E-H5-6 — gap.** EG20, Proof of Proposition 3.3(e), published pp.124–125.

Printed claim: The proof of Proposition 3.3(e) sets Z = |M̃| ∖ ⋃_{i=1}^{N} s_i(|S|) and argues that, M̃ being finite over S, h(Z) ⊂ S is closed and, by (3.2), avoids η.

Correction: In the finite reduced compactification M̃ → S, the generic-fibre points are generic points of the horizontal irreducible components. Density of M^rig puts every such point in M^rig, so each is s_i(η). The corresponding horizontal component is the closure of this point and is exactly the closed image s_i(S). Thus the complement Z of the section images is contained in the finite union of the remaining, vertical components. Its closure Z̄ misses the generic fibre. The image h(Z̄) is closed by finiteness and misses η. Choose a nonempty principal open of S outside it; the sections then exhaust the rigid locus. Finiteness does not imply h(Z) closed when Z is open. See source issue HodgeStructuresPartII/E-H5-6.

Reason: A finite morphism maps closed sets to closed sets; Z is the complement of a closed set, so the printed inference needs the closure, and the closure must be shown to avoid the generic fibre.

Independent review: confirmed. Confirmed at published pp.124–125 and arXiv v4 pp.18–19. A finite map is closed on closed subsets, not arbitrary open subsets. For example Spec k[u,v,x]/(ux,x(x−v)) → Spec k[u,v] is finite, and the complement of the x=0 section has image {u=0,v≠0}, which is not closed. The horizontal/vertical component argument proves the closure avoids the generic fibre.

Previous record: new

**HodgeStructuresPartII/E-H5-5 — misprint.** EG18, §2, proof of Proposition 2.1, arXiv v3 pp.4–5; published pp.4282–4283.

Printed claim: The proof of Proposition 2.1 lets ρ act on the bundle π : ⊔_{k=0}^{r} Gr(W, k) → T, takes a presentation Γ ≃ ⟨r_1, …, r_e | s_1, …, s_f⟩ with L_1, …, L_e ∈ μ_r(K) so that r_i ↦ L_i gives the character χ_L, and imposes det(A_j) = L_i for j = 1, …, e.

Correction: The Grassmannian union runs over 0 < k < r (for k = 0 and k = r every subspace is invariant, so T_0 as printed would be empty); the values L_j lie in μ_d(K), d the order of χ_L (μ_r only when d divides r); the relation is det(A_j) = L_j. Node HodgeStructuresPartII:H.5/prescribed-monodromy-moduli states the corrected construction.

Reason: The zero subspace and the whole representation are always invariant. The determinant character in §2 has order d, so its generator values lie in μ_d. Each generator matrix must have the matching determinant value.

Independent review: confirmed. Confirmed all three slips in arXiv v3 pp.4–5 and published Selecta pp.4282–4283. Zero and full Grassmannian fibres are invariant; determinant values have order dividing d rather than r; generator j must use its own determinant value L_j.

Previous record: new

**HodgeStructuresPartII/E-H5-7 — gap.** EG20, Lemma 5.5, proof, published p.140; arXiv:1707.00752v4 p.30.

Printed claim: The final trace comparison is used to conclude that a twisting character χ with χ^r=1 is the trivial character.

Correction: Retain only finiteness of the group of μ_r-valued twists for finitely generated Γ. A deformation with constant projective class has fixed-determinant classes in a finite set; it need not have χ=1. Use a complete DVR and determinant-root lifting for the converse, as in projective-rigidity.

Reason: An irreducible representation can have a nontrivial self-twist with identical traces. The Q₈ matrices A=diag(i,−i), B=[[0,1],[−1,0]] and character χ(A)=1, χ(B)=−1 give an explicit example: conjugation by A intertwines ρ and χρ. Their traces are zero off the center.

Independent review: confirmed. The printed inference fails on the explicit irreducible Q₈ self-twist above. This is a gap in the given argument; the fixed-determinant/projective rigidity equivalence is retained with a repaired proof sketch.

Previous record: Already recorded as PAPER-ESNAULT-GROECHENIG-20/E12; added to this layer because it relies on Lemma 5.5.

## Planets

- **Rigid local system** — `HodgeStructuresPartII:H.5/rigid-representation`.
- **Cohomological rigidity** — `HodgeStructuresPartII:H.5/cohomological-rigidity`.
- **Rigid local systems are variations** — `HodgeStructuresPartII:H.5/rigid-underlies-cvhs`.
- **Splitting of the rigid Hodge locus** — `HodgeStructuresPartII:H.5/rigid-hodge-splitting`.
- **Nice arithmetic models** — `HodgeStructuresPartII:H.5/nice-hodge-models`.
- **Integrality of cohomologically rigid local systems** — `HodgeStructuresPartII:H.5/integrality-EG18`.

## The suggested Lean file

The actual suggested file elaborates against Mathlib at the recorded pin with admitted proofs as its only warnings. It imports no Tau Ceti modules. This check validates native signature elaboration, not their proofs. The module-chart Higgs carrier assumes a finite free cotangent module; the native arithmetic carrier gives smooth proper data and omits projectivity and determinant data. General reductive groups, projective representations, geometric moduli, variations and the other missing carriers retain explicit omission entries. Comments in that inventory are mathematical plans, not elaborated signatures.

The entry-by-entry signature coverage above and the inventory at the end of the suggested file agree with the packet. Promoted API lemmas point to existing native signatures when available; omitted promoted facts remain in the inventory. The coefficient base-change action formula is named `TraceFreeAdjoint.baseChange_apply`; the full coefficient tensor isomorphism `TraceFreeAdjoint.baseChange` remains omitted, while `TraceFreeAdjoint.baseChange_H1` has an actual tensor-product equivalence signature.

## Coverage and remaining work

**HodgeStructuresPartII:H.5: planned.**

- Refine the multi-part target theorems only at lemma level: rigid-hodge-splitting (i)–(v), nice-hodge-models (a)–(c), no-symmetric-differentials (a)–(c), and rigid-sl3-geometric (a)–(b). The consumed H.5 API facts already have lemma nodes; H.1 should promote its consumed Hitchin scaling and nilpotent-fibre API at its owner.
- Resolve the thirteen recorded gaps: tame non-abelian Hodge theory, higher-dimensional ℓ-adic companions and tame specialization, mixed-characteristic boundedness, analytic intermediate extension, Tannakian splitting, isomonodromy, symmetric-differential and rank-three geometric-origin inputs, quasi-projective finite presentation, native moduli carriers, Schmid extension, and API promotion at the Hitchin owner, and arithmetic lattice/strong-approximation inputs.
- Discharge the precise supplier requests at the existing owners. H.2 and H.4 dependencies use matching fine nodes; they do not supply Schmid extension or the missing isomonodromy inputs.
- Replace omission-inventory entries by native signatures when their carriers exist. Elaborated prototypes verify only the represented special cases; they provide no proofs or completed formalisation.

## Sources and reading receipts

The source register retains the planner’s source versions and reading receipts. The independent review checked the node locators and statements, all seven source findings, and the supplier statements; its report records the limits of that reading. The additional published EG18 passages and latest EG20 preprint comparisons are listed separately. No source files or passages are stored in the repository.

**EG20.** Hélène Esnault and Michael Groechenig, *Rigid connections and F-isocrystals*. Acta Mathematica 225 (2020), 103–158; published version.

[EG20 source](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf). SHA-256 `0d81a6d3e9be477c58a725096c41f06a8a9262422fe596363c3f04c26ab1cfab`.

- §1 pp.104–107: Definition 1.1, Remark 1.2, Conjecture 1.3, Theorems 1.4–1.8 and the cohomological rigidity paragraph
- §2.1 pp.108–109: moduli, Hitchin map, rigid Higgs bundles and Lemma 2.1 with proof
- §3.1 pp.121–125: (3.1), Lemma 3.1 with proof, Langer's moduli, Definition 3.2, Proposition 3.3 with complete proof
- §4.2 pp.131–134: λ-connections, Hodge moduli, Lemma 4.9 with proof, Proposition 4.10 and the displays defining n_L and σ
- §5 pp.138–139: Definitions 5.1–5.3
- §6 pp.145–146: Theorem 6.1 with proof, Remark 6.2, Example 6.3
- §7 pp.146–148: companions summary and the cohomological rigidity paragraph
- §8 pp.151–153: §§8.1–8.4 including Proposition 8.2 with proof

**EG18.** Hélène Esnault and Michael Groechenig, *Cohomologically rigid local systems and integrality*. arXiv:1711.06436v3; published in Selecta Mathematica 24 (2018), 4279–4292. Selected published proof passages independently checked in the author offprint; see sourceVersions..

[EG18 source](https://arxiv.org/pdf/1711.06436v3). SHA-256 `622fb7b327b30b522b23c6d50f23e24b5e252d44f61c3684594a78362d5a64dc`.

- Complete preprint, pp.1–13: §1 with the integrality criterion and proof outline, §2 Propositions 2.1, 2.3, Remarks 2.2, 2.4, §3 Proposition 3.1, Lemmas 3.2–3.4, proof of Theorem 1.1, Remark 3.5

**LL24.** Aaron Landesman and Daniel Litt, *Canonical representations of surface groups*. arXiv:2205.15352v4 (23 February 2025); published in Annals of Mathematics 199 (2024) (published version not read).

[LL24 source](https://arxiv.org/pdf/2205.15352v4). SHA-256 `4cb511ba40675aa6899b351f2ee27eb9487b4a21f65ec8000c1f2cc1a5107ceb`.

- §1.10 Notation 1.10.2
- §4.3 Theorem 4.3.1 and Lemma 4.3.2 with proofs
- §8.1–8.4: Definitions 8.1.1, 8.1.4, Remark 8.1.2, Lemma 8.1.3, Proposition 8.2.1, Definition 8.3.1, Lemmas 8.3.3–8.3.4, Proposition 8.4.1 with proofs
- §9.1 definition of geometric origin and Corollary 9.1.4 with proof

**KP20.** Christian Klevdal and Stefan Patrikis, *G-rigid local systems are integral*. arXiv:2009.07350v2 (21 September 2020); published in Algebra & Number Theory (published version not read).

[KP20 source](https://arxiv.org/pdf/2009.07350v2). SHA-256 `c759728f34fa45936cabdc5a86b349c4e9bbaa3215a55f109a5ccce9b99e8858`.

- §1 Definition 1.1, Theorem 1.2, Remarks 1.3–1.4, §1.1 proof overview
- §3 Proposition 3.1
- §4 Definition 4.1, Propositions 4.4, 4.6, 4.7 and Remark 4.8

**LS18.** Adrian Langer and Carlos Simpson, *Rank 3 rigid representations of projective fundamental groups*. arXiv:1604.03252v3 (3 February 2018); published in Compositio Mathematica 154 (2018) (published version not read).

[LS18 source](https://arxiv.org/pdf/1604.03252v3). SHA-256 `c52818b5474b74bcb6f952c079bbf22a71247d68d3a74e6d9bd79a358975eef6`.

- §1 pp.1–4: definition of geometric origin, Conjectures 1.1–1.2, Theorem 1.3, Corollary 1.4 and the outline of the proof

**BKT13.** Yohan Brunebarbe, Bruno Klingler and Burt Totaro, *Symmetric differentials and the fundamental group*. arXiv:1204.6443v3 (24 April 2013); published in Duke Mathematical Journal 162 (2013) (published version not read).

[BKT13 source](https://arxiv.org/pdf/1204.6443v3). SHA-256 `ddd1ef68c568bd85e4dc1d180c655d97c23599b03a8932e07ce18f14a908ef20`.

- Introduction pp.1–3: Theorem 0.1 and Remark 0.2
- §4 p.9: Theorem 4.1 (Arapura) and the definition of rigidity in M_B(X, GL(n)); start of the proof of Theorem 0.1

**LL22.** Aaron Landesman and Daniel Litt, *Geometric local systems on very general curves and isomonodromy*. arXiv:2202.00039v2.

[LL22 source](https://arxiv.org/pdf/2202.00039v2). SHA-256 `37380b99082b5fc287c4c025247fc8926a18d9f951604bd6e27e467687ddc597`.

- §1.2 Definitions 1.2.1, 1.2.3, Theorem 1.2.5, Remark 1.2.6, Corollaries 1.2.7, 1.2.10, Theorem 1.2.12
- §7.2 Lemma 7.2.1 with proof and the proof of Theorem 1.2.5
- §7.3 proof of Corollary 1.2.7

**Langer14.** Adrian Langer, *Semistable modules over Lie algebroids in positive characteristic*. arXiv:1311.2794v2 (26 March 2014); published in Documenta Mathematica 19 (2014) (published version not read).

[Langer14 source](https://arxiv.org/pdf/1311.2794v2). SHA-256 `010d546cb54dc59b59e4eaa3a7a2c1955284de76db61292970263a8103c92373`.

- §1 pp.3–4: sheaves of rings of differential operators, Gieseker semistability, the moduli functor and Theorem 1.1

**S92.** Carlos T. Simpson, *Higgs bundles and local systems*. Publications Mathématiques de l’IHÉS 75 (1992), 5–95.

[S92 source](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf). SHA-256 `74651fcdbcd66b5fdf19724b74e0ecbfcad09033dbff2f14c3b7ed2994f76029`.

- Introduction pp.8–9 (rigidity, motivicity and integrality conjectures)
- §4 pp.44–57: variations of Hodge structure, systems of Hodge bundles, Lemma 4.1, Corollaries 4.2–4.3, Lemma 4.5, Theorem 3, rigid ℓ-adic representations (Theorem 4), ℚ-structure (Theorem 5 proof opening)

**S94II.** Carlos T. Simpson, *Moduli of representations of the fundamental group of a smooth projective variety II*. Publications Mathématiques de l’IHÉS 80 (1994), 5–79.

[S94II source](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf). SHA-256 `5dc0ef646f59819f717b75a90a6a2952af7e29065c34e517e65b2844f90fedbe`.

- Introduction pp.8–9 (local structure and isosingularity)
- §10 pp.64–69: Goldman–Millson deformation diagrams, Theorem 10.4, Proposition 10.5, Theorem 10.6 (isosingularity) and the remarks between them

**Z15.** Paul Ziegler, *Graded and filtered fiber functors on Tannakian categories*. arXiv:1111.1981v4 (5 August 2015); published in Journal of the Institute of Mathematics of Jussieu 14 (2015), 87–130 (published version not read).

[Z15 source](https://arxiv.org/pdf/1111.1981v4). SHA-256 `742e6ecb5be56cb3fc7c1b48a944ae0fdba91a0e8546f3ff61f6b6f57054ea9f`.

- §1 pp.1–3: definitions of graded, filtered and splittable fibre functors; Theorems 1.2 and 1.3

**S96.** Carlos T. Simpson, *The Hodge filtration on nonabelian cohomology*. arXiv alg-geom/9604005v1, preprint pagination.

[S96 source](https://arxiv.org/pdf/alg-geom/9604005). SHA-256 `2b2096f89734c40995f7a1f20ae2f4568cfed4dd00a5c0ca5df507dfe6ca88c8`.

- §7 pp.32–33 Lemma 7.2 with proof
- §9 pp.38–39 Theorem 9.1, Corollary 9.2, Conjecture 9.3
- §10 pp.41–43 Corollaries 10.2–10.3

- published version, accessed 2026-10-07: Esnault–Groechenig, Acta 2020: sections listed under source EG20, read in the published text layer. [Source](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), SHA-256 `0d81a6d3e9be477c58a725096c41f06a8a9262422fe596363c3f04c26ab1cfab`.
- preprint version, accessed 2026-10-07: Planner reading receipt for EG18 arXiv v3, 2026-10-07. The independent review also checked the cited preprint locators and the published proof passages registered separately below. [Source](https://arxiv.org/pdf/1711.06436v3), SHA-256 `622fb7b327b30b522b23c6d50f23e24b5e252d44f61c3684594a78362d5a64dc`.
- preprint version, accessed 2026-10-07: Landesman–Litt, Canonical representations, arXiv v4: §§1.10, 4.3, 8.1–8.4, 9.1. [Source](https://arxiv.org/pdf/2205.15352v4), SHA-256 `4cb511ba40675aa6899b351f2ee27eb9487b4a21f65ec8000c1f2cc1a5107ceb`.
- preprint version, accessed 2026-10-07: Klevdal–Patrikis, arXiv v2: §§1, 3, 4. [Source](https://arxiv.org/pdf/2009.07350v2), SHA-256 `c759728f34fa45936cabdc5a86b349c4e9bbaa3215a55f109a5ccce9b99e8858`.
- preprint version, accessed 2026-10-07: Langer–Simpson, arXiv v3: introduction. [Source](https://arxiv.org/pdf/1604.03252v3), SHA-256 `c52818b5474b74bcb6f952c079bbf22a71247d68d3a74e6d9bd79a358975eef6`.
- preprint version, accessed 2026-10-07: Brunebarbe–Klingler–Totaro, arXiv v3: introduction and §4. [Source](https://arxiv.org/pdf/1204.6443v3), SHA-256 `ddd1ef68c568bd85e4dc1d180c655d97c23599b03a8932e07ce18f14a908ef20`.
- preprint version, accessed 2026-10-07: Landesman–Litt 2022, arXiv v2: §1.2 and §§7.2–7.3. [Source](https://arxiv.org/pdf/2202.00039v2), SHA-256 `37380b99082b5fc287c4c025247fc8926a18d9f951604bd6e27e467687ddc597`.
- preprint version, accessed 2026-10-07: Langer, arXiv v2: §1. [Source](https://arxiv.org/pdf/1311.2794v2), SHA-256 `010d546cb54dc59b59e4eaa3a7a2c1955284de76db61292970263a8103c92373`.
- published version, accessed 2026-10-07: Simpson 1992: introduction and §4 (scanned text layer). [Source](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), SHA-256 `74651fcdbcd66b5fdf19724b74e0ecbfcad09033dbff2f14c3b7ed2994f76029`.
- published version, accessed 2026-10-07: Simpson, Moduli II: introduction and §10 (scanned text layer). [Source](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), SHA-256 `5dc0ef646f59819f717b75a90a6a2952af7e29065c34e517e65b2844f90fedbe`.
- preprint version, accessed 2026-10-07: Ziegler, arXiv v4: §1 statements. [Source](https://arxiv.org/pdf/1111.1981v4), SHA-256 `742e6ecb5be56cb3fc7c1b48a944ae0fdba91a0e8546f3ff61f6b6f57054ea9f`.
- preprint version, accessed 2026-10-07: Simpson 1996, arXiv v1: Lemma 7.2, Theorem 9.1, Corollaries 9.2, 10.2–10.3. [Source](https://arxiv.org/pdf/alg-geom/9604005), SHA-256 `2b2096f89734c40995f7a1f20ae2f4568cfed4dd00a5c0ca5df507dfe6ca88c8`.
- published version, accessed 2026-10-08: Esnault–Groechenig 2018 Selecta offprint: Proposition 2.1 proof pp.4282–4283 and end of Theorem 1.1 proof p.4291 independently checked; not a full reading of the published paper. [Source](https://page.mi.fu-berlin.de/esnault/preprints/helene/128_esn_gro.pdf), SHA-256 `19f8cea47acd6c6762e1a53e67ac58fa2be3fa70a768ec3dd547cc77826ba129`.
- preprint version, accessed 2026-10-08: EG20 latest arXiv v4, selected proof passages pp.18–19, 24, 29–30 compared with the published locators for E-H5-2, E-H5-6 and E-H5-7. [Source](https://arxiv.org/pdf/1707.00752v4), SHA-256 `bcc435b58bb2b1c06869413c1cd96018676d15da8003d21e5b507b114a63c4eb`.
