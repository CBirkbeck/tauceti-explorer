# Roadmap: Abelian Schemes And Arithmetic Moduli

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

## Purpose and scope

Build the dimension-general abelian-scheme library required by Siegel, PEL, and Hilbert modular varieties. The starting definition is a proper smooth group scheme with geometrically connected fibres; commutativity and the usual structural results must be established with their actual hypotheses. A polarization is additional data. Do not define an abelian scheme to be a family of Weierstrass equations, or assume a globally chosen ample line bundle on every base.

The reusable foundations include relative Picard theory, duality, polarizations, finite flat quotients, deformation theory, and degree-one realizations. This is a substantial prerequisite, not a short wrapper around equation-level elliptic curves.

References are Mumford's *Abelian Varieties*, Faltings–Chai Chapter I, Lan's *Arithmetic Compactifications of PEL-Type Shimura Varieties* Chapters 1–2 and Appendix B, and the abelian-scheme portions of Hida's author-hosted lectures. Milne §§6–8 and 14 fix the complex comparisons.

## Inputs and ownership

Use schemes and group objects in `Over S`. Consume the group-scheme, descent, divisor, and finite locally free infrastructure already owned by ReductiveGroups and ModularCurves #81. Consume the exact line-bundle and relative coherent-cohomology statements supplied by JacobianChallenge, but do not treat its curve-valued Picard construction as a Picard scheme in arbitrary dimension.

The elementary topology and holomorphic variation of full complex lattices are owned by ComplexTori and ComplexManifolds. This roadmap owns their polarization, algebraicity, and abelian-scheme comparisons. AlgebraicModuliForArithmeticGeometry owns general algebraic spaces, representability and higher-dimensional coherent base change; A0 below names that import boundary.

Suggested home: `TauCeti/AlgebraicGeometry/AbelianScheme/`, with generic representability and cohomology material in their general directories.

## Milestones

### A0. Relative algebraic geometry for polarized moduli

**Dependency:** [AlgebraicModuliForArithmeticGeometry](../AlgebraicModuliForArithmeticGeometry/README.md), R09.1–R09.6 and A0-extension. That owner constructs algebraic spaces, Hilbert/Picard representability, higher-dimensional coherent base change and Artin criteria. This milestone is an import boundary, not a second construction.

Its producer row imports exactly those general stages and reexports their hypotheses and universal properties for A1–A2. It neither assumes the dual abelian scheme constructed in A2 nor imports the later characteristic-zero resolution stage R09.7. The abelian-specific verification of each representability criterion remains in its consuming milestone.

<a id="a1"></a>

### A1. Abelian schemes and rigidity

**Dependencies:** A0 and the group-object API.

Define relative dimension as locally constant, allowing the base to be disconnected. Prove rigidity for pointed maps, commutativity, translation invariance of differentials, the theorem of the square and cube, and compatibility with base change. Include the nonreduced-base argument: equality on geometric fibres alone does not imply equality of scheme morphisms.

Define homomorphisms as group-scheme homomorphisms, not arbitrary scheme maps. Prove the decomposition of a map into a homomorphism and a translation under the standard hypotheses. Construct products and change of base. Prove that the one-dimensional pointed objects coincide with the scheme-theoretic elliptic curves of #81, using its Weierstrass-presentation theorem. The comparison is an equivalence compatible with the group laws.

<a id="a2"></a>

### A2. Duals, Picard functors, and polarizations

**Dependencies:** A0–A1.

Construct the relative degree-zero Picard functor first as an algebraic space through A0. Prove the abelian-algebraic-space-to-scheme theorem of Raynaud (Faltings–Chai I.1.9) with its actual base hypotheses, and apply it to obtain the dual abelian scheme. This passage is an explicit A2 target: it is not the false claim that every proper algebraic space is a scheme, nor an assumption that every abelian scheme admits a polarization étale-locally. Construct the rigidified Poincaré bundle and biduality isomorphism. In the polarized/projective cases additionally give the line-bundle construction and prove independence of the auxiliary ample bundle. Define the morphism `φ_L : A→A∨`, its behavior under tensor product, translation, and pullback, and the positivity condition making it a polarization. Establish symmetric homomorphisms, Rosati involutions, and polarization types.

Prove functoriality of dualization and the formula for the dual of a composite. Recover the elliptic relative Picard/Poincaré construction of #81, rather than leaving two incompatible duals. The comparison must identify the evaluation pairings, not just the underlying schemes.

<a id="a3"></a>

### A3. Finite flat quotients, torsion, and pairings

**Dependencies:** A2 and the generic finite-group-scheme supplier.

For a finite locally free subgroup, construct the fppf quotient abelian scheme and prove its universal property, flatness, and base-change compatibility. Construct isogenies and their duals. Prove that `[n]` is finite locally free of rank `n^(2g)` for `n≠0` on a relative-dimension-`g` component, and is étale precisely under the appropriate invertibility condition.

Import Cartier duality from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 and construct the Weil pairing between `A[n]` and `A∨[n]`. Given a polarization, construct its induced alternating pairing and identify precisely when it is perfect. Build the corresponding Tate-module pairings and keep the Tate twist in their targets. The p-primary torsion in characteristic p is never replaced by its group of geometric points.

<a id="a4"></a>

### A4. Degree-one realizations and deformation theory

**Dependencies:** [AbelianSchemesAndArithmeticModuli A3](README.md#a3); [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r07-2); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6 for Grothendieck–Messing deformation theory.

Construct relative `H¹_dR`, its Hodge exact sequence, Gauss–Manin connection, cup-product pairing, and base change. For ℓ invertible on the base construct the étale Tate module and its functorial local system. Prove integral complex homology and de Rham comparisons needed for complex uniformization. These are degree-one statements; invoking the full Hodge or étale comparison theorem as an unnamed dependency is unnecessary.

Import p-divisible groups, Cartier duality and connected–étale sequences from R07.1–R07.2, and Grothendieck–Messing deformation theory from R07.6 of [FiniteFlatGroupsAndIntegralPadicHodgeTheory](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md). Prove the Serre–Tate equivalence for deformations of abelian schemes with endomorphism and polarization structures; identify its tangent map with the Hodge filtration. The group-theoretic deformation category is the imported one.

<a id="a5"></a>

### A5. Complex uniformization with polarization and level

**Dependencies:** [AbelianSchemesAndArithmeticModuli A2](README.md#a2); [AbelianSchemesAndArithmeticModuli A3](README.md#a3); [ComplexComparisonPartII C4](../ComplexComparisonPartII/README.md#c4).

Prove the Riemann bilinear relations and the algebraicity of polarized complex tori. Construct the equivalence with polarizable integral Hodge structures of homological types `(-1,0),(0,-1)`, and prove its relative version for analytic polarized families and variations. For an algebraic abelian scheme prove compatibility with its associated analytic variation. The converse algebraization over an algebraic base is proved only after M3, in V5; this avoids assuming the algebraic moduli comparison in the construction that supplies it. Track homology versus cohomology, lattices versus dual lattices, and the polarization sign.

Construct the Siegel universal analytic family, identify its monodromy, and compare level structures with symplectic lattice trivializations. The family is more than a classification of complex points. For genus one, prove agreement with #81's actual elliptic scheme, differential, and pairing.

## Public API and completion

Required operations include base change, products, duals, homomorphism addition/composition, polarization pullback, torsion, quotient, Tate modules, invariant differentials, and de Rham cohomology. Their naturality squares must be available as reusable lemmas.

A completion test is a diagram comparing elliptic duality, Weil pairing, and complex uniformization through both the existing elliptic API and the new abelian API. Another is a non-principally polarized abelian scheme, to ensure that perfect pairings and unimodular lattices are not being assumed everywhere. The moduli-space construction itself belongs to PELModuli; A0–A5 supply its mathematics.

<a id="a6"></a>

## A6. Arithmetic Hom groups and moduli export

Extend the field Hom/End API of JacobianChallenge with finite generation and torsion freeness, the semisimple endomorphism algebra, Poincaré complete reducibility, Rosati positivity and the degree formulas for polarized isogenies. Prove their compatibility with relative dualization and geometric fibres. Separate two Weil-restriction theorems. For finite locally free S′→S, construct the restriction functor and its representing algebraic space using AlgebraicModuliForArithmeticGeometry R09.3; scheme representability requires its own criterion. For finite étale S′→S and an abelian scheme A/S′, prove that the restriction is an abelian scheme: after an étale splitting cover it is a finite product of abelian schemes; descend properness, smoothness and geometrically connected fibres, and apply the abelian-algebraic-space-to-scheme theorem from A2. State the base hypotheses of that theorem. Finite locally free alone does not preserve properness. For finite separable number-field extensions L/K and ℓ different from the field characteristic, construct the G_K-equivariant comparison T_ℓ(Res_{L/K} A) ≅ Ind_{G_L}^{G_K} T_ℓ(A), including choices of embeddings and their canonical independence. This field-level induction formula does not imply good reduction at ramified integral places.

The representability source is [Stacks, Tags 05YC and 05YF](https://stacks.math.columbia.edu/tag/05Y8). The finite-separable field construction and jet-space distinction are in [Poonen, §4.6, pp. 110–112](https://math.mit.edu/~poonen/papers/Qpoints.pdf); the relative finite-étale preservation argument above is a specified descent proof, not a quotation of a general theorem from that field-level discussion. As a negative acceptance example, for D=k[ε]/(ε²) and an elliptic curve E/k, identify Res_{D/k}(E_D) with the tangent bundle of E and use translation to identify it with E×Lie(E); its additive-group fibre prevents properness.

PELModuli M1–M5 is the sole owner of polarized moduli stacks, fine covers and universal families. HilbertModularVarietiesAndShimuraCurves H1–H6 owns real-multiplication moduli and residual torsion twists. ShimuraCompactifications owns their higher-dimensional degeneration and boundary. Export invariant differentials, polarization comparison and the map from an abelian family to the constructed moduli space to ArakelovGeometryAndAbelianHeights. In particular, source R10.3–R10.6 are discharged by those named constructions, not by a parallel general moduli object here.


## Implementation handoff: Duality, quotients and restriction of scalars

**Stages:** A2, A3, A4, A6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

First construct the rigidified Picard functor and the Poincaré biextension, then prove representability, biduality and the scheme comparison. Quotients must export the quotient morphism and its fppf universal property before torsion pairings use them. A6 separates finite-locally-free representability from finite-étale preservation of abelian schemes; the induced Tate-module theorem is stated over finite separable fields.

**Acceptance and consumer contract.** Accept a nonprincipal polarization by computing the kernel of its torsion pairing, and a disconnected base by retaining componentwise dimensions. For finite étale restriction compute the split-product dimension and Tate-module rank. Reject the dual-number restriction as a proper abelian scheme. Verify Serre–Tate deformation equivalences on morphisms and endomorphism/polarization lift conditions, not only on isomorphism classes.

## Source anchors and prototype coverage

- AbelianSchemes source targets.
- AbelianSchemesAndArithmeticModuli source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
