# Smooth representations of local groups

## Scope, coefficients and owners

Develop smooth representations of locally profinite groups and the general local representation theory of G(E), for a connected reductive group over a nonarchimedean local field E. Start with Mathlib `Representation`, `Rep`, `ContRepresentation`, `TopRep`, induction, intertwining and invariants. The existing ProfiniteCohomology roadmap owns the equivalence between discrete continuous representations and smooth discrete objects on profinite groups. Extend that dictionary to locally profinite groups and reuse it on compact opens.

Basic categorical constructions use commutative coefficient rings A. Averaging uses only compact opens whose relevant finite indices are units in A. Exactness for pro-p invariants requires p invertible in A. Complex Bernstein theory, integral ℓ-adic theory (ℓ≠p) and characteristic-p smooth theory have separate theorem hypotheses. No transfer of admissibility or semisimplicity between them is implicit. Integral co-Whittaker theory below is specifically for GL_n, not arbitrary reductive G.

Dependencies: ReductiveGroupsPartII, ProfiniteCohomology, Mathlib representation and module categories. EnhancedDerivedSheaves supplies enhanced/derived category infrastructure; the algebraic construction of the smooth abelian category is owned here. LanglandsParameterStacks and ExcursionOperatorsAndSpectralAction consume this category and its center.

## Milestones

<a id="stage-SR.0:abelian-category"></a>

### SR.0. Smooth category and complete basic API

The unqualified SR.0 export means the following early SR.0:abelian-category
construction. Its SR.0:derived-extension successor is a separate import, not
an implicit prerequisite of every use of SR.0.

For an algebraic action, smoothness means every vector has open stabilizer. Prove closure under subobjects, quotients, sums and filtered colimits; construct kernels, cokernels and the abelian category. Construct smooth vectors in an arbitrary representation and prove the relevant adjunction. For a discrete topology, prove equivalence with joint continuity of the action. Define U-invariants as a submodule and prove functoriality, restriction and the union description over compact open U. Define admissibility by finite generation of every compact-open invariant module, with stronger finiteness conditions explicitly separated.

<a id="stage-SR.0:derived-extension"></a>

The late SR.0:derived-extension constructs the enhanced derived smooth category on the preceding abelian carrier using EnhancedDerivedSheaves:E1. The abelian category itself does not depend on this enhancement.

### SR.1. Hecke algebras over rings

Construct compactly supported locally constant functions and convolution using finite sums over open cosets when the measure has A-valued volumes. Prove associativity, support bounds, the opposite involution and independence of subdivisions. Give normalized idempotents e_U exactly when the volume/index denominators are units. Under the explicit hypothesis of a cofinal family of compact opens of invertible pro-order in A, prove smooth representations correspond to nondegenerate modules over the locally unital Hecke algebra, and identify e_U corners with U-biinvariant Hecke algebras. For a locally pro-p group, p invertible in A is the principal application. Do not extend this equivalence to characteristic-p smooth representations: use the smooth action category directly there, and construct integral double-coset operators by finite correspondences where averaging is unavailable. Follow the developing Mathlib Hecke API ([PR 43087](https://github.com/leanprover-community/mathlib4/pull/43087), [PR 43286](https://github.com/leanprover-community/mathlib4/pull/43286)); derive the analytic finite-sum comparison rather than introduce a second double-coset multiplication.

### SR.2. Induction, compact induction and Jacquet functors

Construct smooth induction from closed subgroups and compact induction with support compact modulo the subgroup. Prove Frobenius reciprocity with correct adjoint direction and hypotheses, induction in stages and Mackey filtrations. For P=MN define unnormalized induction and N-coinvariants, then normalized induction/Jacquet functors using a specified square root of the modulus character. Prove exactness in the valid coefficient regime, compatibility with duals for admissible representations, and the geometric lemma with double-coset indexing. A characteristic-p analogue of an ℓ≠p exactness theorem is not an automatic target.

### SR.2a. Second adjointness in characteristic zero

For complex smooth representations of a connected reductive group over a nonarchimedean local field, construct the unit and counit of the second adjunction: normalized induction i_P is left adjoint to the normalized Jacquet functor r_opposite(P). Keep this separate from the first adjunction r_P ⊣ i_P. Prove stabilization for sufficiently contracting elements, the canonical pairing and both triangle identities, with the opposite parabolic and square-root normalization explicit. Export the natural Hom isomorphism and compatibility with admissible contragredients, not just equality of dimensions. Use Bernstein's *Second Adjointness Theorem* (1987) and *Representations of p-adic Groups* (1992 lectures), in their archived author versions. This foundational characteristic-zero route does not import geometric local Langlands.

### SR.3. Admissible complex representations

Prove finite-dimensionality of compact-open invariants for irreducible smooth complex representations of reductive G(E), finite length of parabolic induction of finite-length admissibles, smooth contragredient duality, matrix-coefficient criteria for supercuspidality and temperedness, and the subquotient description by supercuspidal support. Construct the Bernstein decomposition and Bernstein center as natural endomorphisms of the identity, with its action on every object. Prove invariance under inner isomorphisms and compatibility with products. Classification is not assumed to prove basic admissibility.

### SR.3a. Early uniform admissibility

For fixed compact open U, prove existence of a bound B(G,U) for dim_C V^U for every irreducible smooth complex V; the bound is uniform in V, not merely individual admissibility. Follow Bernstein's 1992 lectures, printed pp.37–38: construct the Hecke-algebra decomposition and quantitative bounds for finitely generated commutative subalgebras, and apply Burnside's theorem to obtain uniform admissibility. The stronger cuspidal-support conclusion follows afterwards in pp.38–44, not as an input to that proof. An independent second-adjointness proof route must be identified separately. This early branch precedes SR.3's full Bernstein-center construction; do not use finiteness over that center to establish its own prerequisite. In SR.3 subsequently construct finite-type block/corner algebras, the finite collection of inertial supports visible at U, the central algebra action and coefficient specialization. Export the uniform bound to spectral finiteness consumers with fixed group and level. Neither characteristic-p coefficients nor unrestricted integral coefficient rings inherit this assertion by a change of notation. Integral finiteness below is a later, separate theorem.

### SR.4. Spherical representations and Satake

For unramified G and a hyperspecial subgroup K, construct the Satake transform and prove the isomorphism with the appropriate invariant algebra on the dual torus, retaining the relative Weyl group and Frobenius action. Specify coefficients and q-half normalization; record the integral unnormalized form separately. Identify Hecke eigencharacters with unramified semisimple parameters. Verify split tori and GL_n explicitly and provide the normalization dictionary consumed by IntegralHeckeAndGaloisDeterminants. Classical Satake and geometric Satake are separate constructions with a comparison obligation.

### SR.5. Integral local families for GL_n

For ℓ≠p and the coefficient rings of Helm's paper, construct Bernstein–Zelevinsky derivatives, top derivatives and Whittaker functionals, their base change and exactness statements. Define co-Whittaker modules with finite-generation/admissibility and fiberwise genericity hypotheses; establish their uniqueness/dominance relations and integral Bernstein-center action. Build compactly induced generic projectives on blocks and prove the comparison used for interpolation in families. Do not declare an arbitrary family to have a co-Whittaker model. CompletedCohomologyAndLocalGlobalCompatibility supplies the arithmetic realization; AutomorphicCongruences consumes these local functors.

### SR.6. Late integral finiteness and second adjointness

Follow Dat–Helm–Kurinczuk–Moss, *Finiteness for Hecke algebras of p-adic groups* (arXiv:2203.04929v2), separating two coefficient regimes. Theorems 1.1–1.2 prove finite generation over a finitely generated center for the stated Hecke algebras over a **noetherian Z_ell-algebra**, ell≠p. They do not establish this for every noetherian Z[1/p]-algebra. Corollary 1.3 gives second adjointness for every Z[1/p]-algebra: in unnormalized conventions its right adjoint is delta_P times the opposite-parabolic Jacquet functor; normalized conventions require the chosen square root. Neither assertion is a characteristic-p theorem.

This late stage also owns the parameter-finiteness engine used in that proof. For a pinned dual group over Z[1/p] with finite Weil action, choose W_F^0 and the normal wild filtration P_F^e; construct its integral finite-wild cocycle schemes and compare with LP.1's Z_ell models. Prove Theorem 1.7: evaluation at a Frobenius lift induces a finite morphism from the invariant quotient of Z^1(W_F^0/P_F^e,Ghat) to the invariant quotient of Ghat⋊Frbar. Prove Corollary 1.8 for a Weil-stable closed reductive subgroup Hhat: the induced coarse-quotient map is finite, and the corresponding map of **reduced** excursion algebras is finite. Build §2's Frobenius integrality/invariant-quotient arguments, then §3's passage to the center; retain reduction and the embedding of the integral center into its characteristic-zero counterpart. The source's finiteness conclusions are not restricted by LP.3's separate good-prime base-change hypotheses.

Import LanglandsParameterStacks:LP1 and LP2:excursion-presentation for the parameter constructions, and ExcursionOperatorsAndSpectralAction:ES1, ES6:functoriality and ES7:parabolic for the excursion-center action and its torus, central-character and parabolic compatibilities. These are crucial inputs, not merely a named action. SR.6 is **not** an early prerequisite of FS; do not back-propagate this late strengthening into SR.0–4.

## Acceptance and references

Check a finite group over a ring where its order is noninvertible: averaging must not prove exactness. Check a torus, GL_2 principal series, Steinberg and a compact induction. Every functor has its action on morphisms, identity/composition, change of coefficients and compatibility with invariants proved.

[Casselman](https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf), §§2–9; [Helm](https://arxiv.org/abs/1210.1789), especially the co-Whittaker and integral-center constructions. Bernstein–Deligne and Vignéras books are in the acquisition register. Suggested.lean states representative prototypes; this README specifies the full theory.

## Completion contracts added on 2026-09-15

**Applies to:** `SR.0:abelian-category`, `SR.1`, `SR.2`, `SR.2a`, `SR.3a`, `SR.4`, `SR.6`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Construct compact induction on functions with compact support modulo an open subgroup and prove its universal adjunction. Write first and second adjointness as separate natural Hom equivalences with their units/counits and the opposite-parabolic modulus. For uniform admissibility retain the early quantitative Hecke-algebra/Burnside proof before Bernstein-center finiteness. The late integral theorem keeps the coefficient rings of the cited DHKM finiteness statements.

### Producer–consumer contract

Export exactness of pro-p invariants only when p is invertible, and normalized idempotents only when the relevant denominators are units. Characteristic-p smooth representations remain in the action category and acquire no Hecke-averaging equivalence. SR.6 is a return from FS, never an early FS prerequisite.

### Acceptance and source route

A finite p-group over F_p detects failure of exact invariants; GL_2 principal series checks opposite parabolic and modulus; fixed compact level checks one uniform bound over all irreducibles.

**Source route:** Bernstein 1987 second adjointness and 1992 pp.37–44; DHKM Theorems 1.1–1.2/Corollary 1.3; Helm. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
