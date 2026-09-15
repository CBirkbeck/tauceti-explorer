# Roadmap: Shimura data, Hermitian domains, and adelic level structures

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

## Purpose and scope

Construct Deligne's category of pure Shimura data without restricting it to PEL, Hodge, or abelian type. The output is the common input to the complex, algebraic, integral, and p-adic constructions in this family. A moduli interpretation is a theorem about particular data, not part of this definition.

The main references are Deligne, *Variétés de Shimura* (1979), §2.1, and Milne, *Introduction to Shimura Varieties*, §§1–5 and 12. Deligne's *Travaux de Shimura* supplies an earlier formulation; its Hodge-sign convention must not be silently identified with the 1979 convention. Lan, §§2–3, supplies concrete descriptions against which to check the definitions.

Suggested homes are `TauCeti/NumberTheory/Shimura/Datum/`, `TauCeti/Geometry/HermitianSymmetric/`, and the general algebraic-group and adelic directories for reusable prerequisites.

## Existing suppliers and ownership

Consume `ReductiveGroups` for affine group schemes, representations, the adjoint representation, derived and adjoint quotients, central isogenies, algebraic tori, parabolics, and Levi quotients. ReductiveGroupsPartII supplies Weil restriction and the group-scheme extensions; AutomorphicFormsOnReductiveGroups AF.1 supplies local/adelic topological points and the real analytic group interfaces. Consume the existing `TauCeti.Hodge.HodgeStructureOn` and its conjugation/base-change API, rather than introducing another Hodge structure. Consume `ComplexManifolds` for atlas transport, holomorphic bundles, and properly discontinuous quotients.

This roadmap owns the equivalence with representations of the Deligne torus, homogeneous period domains, their integrable complex structures, and the Shimura-specific consequences. A general variation of Hodge structure must use the common local-system and filtered-bundle definition coordinated with issue #167. The required version is explicitly constructed in D3; this is not an assumption that general geometric Hodge theory is already available.

## Conventions

The algebraic group is connected and reductive over `ℚ`. The Deligne torus is the actual Weil restriction `Res_{ℂ/ℝ} Gₘ`, not merely the abstract group `ℂˣ`. A datum consists of a nonempty conjugacy class of **algebraic** homomorphisms `h : S → G_ℝ`. Do not retain a distinguished representative after constructing the conjugacy class.

Use the 1979 convention

\[
h(z)v=z^{-p}\overline z^{-q}v\quad(v\in V^{p,q}),\qquad
\mu_h(z)=h_{\mathbf C}(z,1).
\]

Call `h` restricted to the diagonal real multiplicative group the central restriction. Its inverse is the weight cocharacter acting by `t^n` on weight `n`. This distinguishes the two common meanings of “weight homomorphism”. With the existing Hodge-theory operator `C(v)=i^{p-q}v`, prove `h(i)=C⁻¹`. Do not change the Hodge library's convention.

The three defining axioms are: the adjoint Hodge types are contained in `{(-1,1),(0,0),(1,-1)}`; conjugation by `h(i)` is a Cartan involution of the **adjoint real group**; and no nontrivial `ℚ`-simple factor of `Gᵃᵈ` has trivial projected `h`. Rationality of the weight, splitting conditions on the centre, a symplectic embedding, and good reduction at a prime are separate predicates or additional data.

## Milestones

<a id="d0"></a>

### D0. Restriction of scalars and topological points

**Dependencies:** [ReductiveGroupsPartII RG2.0a](../ReductiveGroupsPartII/README.md) constructs finite-separable Weil restriction by its functor-of-points universal property, with products, group operations, base change and representations. [AdelicAlgebraicGroups AA.0–AA.1](../AdelicAlgebraicGroups/README.md) supplies local/adelic topological points and restriction-of-scalars point comparisons; [AutomorphicFormsOnReductiveGroups AF.1](../AutomorphicFormsOnReductiveGroups/README.md) supplies the real analytic group interface. Apply these constructions to the Deligne torus, the Hilbert groups and datum morphisms. General Weil restriction of non-affine abelian schemes remains AbelianSchemesAndArithmeticModuli A6; it is not silently imported from the finite-separable affine theorem.

<a id="d1"></a>

### D1. The Deligne torus and Hodge structures

**Dependencies:** D0 and the HodgeStructures linear-algebraic API.

Construct `S`, the diagonal and norm maps, its complex splitting with the specified conjugation, and its character lattice. Prove the equivalence between finite-dimensional algebraic real representations of `S` and finite direct sums of pure real Hodge structures. A general representation is not forced to have one weight. Establish the rational-weight criterion for a representation defined over `ℚ`, the tensor/dual/Tate-twist compatibilities, and the comparison with the existing opposed-filtration construction.

The tests are the trivial representation, `ℚ(1)`, the standard homology representation of an elliptic curve, and the adjoint representation of `GL₂`. All four must use the same sign dictionary.

<a id="d2"></a>

### D2. Real reductive groups and Hermitian domains

**Dependencies:** D1 and the real-group extensions to ReductiveGroups.

Define a Cartan involution using the compact real form of the complexified group. Prove the equivalent Lie-algebra positivity criterion where it applies, and compatibility with the adjoint quotient. Construct the stabilizer of `h`, the tangent quotient, and the invariant complex structure induced by the adjoint Hodge decomposition. Prove integrability by the bracket relations between Hodge types. Establish the homogeneous-space charts, Hausdorffness, second countability, and the Hermitian symmetric-domain structure of each connected component.

This proof must work in the presence of compact **real** factors of a `ℚ`-simple group. The axiom excludes compact `ℚ`-factors, not every compact factor after extension to `ℝ`. Full classification of real forms is not a prerequisite for constructing a domain from a datum.

<a id="d3"></a>

### D3. Homogeneous variations and compact duals

**Dependencies:** D2; the common local-system/holomorphic-bundle interface.

Define a variation as a local system with a holomorphic filtration of its associated bundle, fibrewise opposedness, and Griffiths transversality. Construct the homogeneous variation from each algebraic representation of `G`, prove transversality using the adjoint Hodge types, and prove functoriality under tensor operations and change of datum. Rationality/polarizability hypotheses remain explicit.

Construct the parabolic stabilizing the Hodge filtration and the compact dual as a flag variety. Prove the Borel embedding and its tangent description. Define the complex conjugacy class `{µ}` over `ℚ̄`, its Galois action, and the reflex field as the fixed field of its stabilizer. Prove this field is finite over `ℚ`. Descend the flag variety of the appropriate parabolic type to the reflex field; do **not** assume that a representative `µ` or a parabolic of that type is defined over that field. When a representative exists over a larger coefficient field, provide the explicit `G/P` description there.

<a id="d4"></a>

### D4. Data, morphisms, and distinguished classes

**Dependencies:** D3.

Construct the category of Shimura data and the operations of products, adjoint passage, and change by a central isogeny when the homomorphisms lift. Define a special pair as a torus subdatum over ℚ and a special point as a point whose homomorphism factors through such a torus; prove compatibility with datum morphisms. Define Hodge type by existence of a morphism of data into a Siegel datum with injective group map. Define abelian type by a central isogeny of derived groups from a Hodge-type datum inducing an isomorphism of adjoint data. Define pre-abelian type using only the isomorphism of adjoint data with a Hodge-type datum, as in Hansen–Johansson. Prove the implications without identifying the predicates.

<a id="d5"></a>

### D5. Levels and explicit examples

**Dependencies:** D0 and D4.

Define neatness with representation independence and the arithmetic subgroup attached to a compact open level and a connected component. Construct the *effective* arithmetic action after removing its kernel. Neatness must not be used to conclude that central rational units act faithfully.

Construct the torus/CM examples, the `GL₂` datum with `X=ℍ±`, all Siegel data, and the two Hilbert data from a totally real field. Identify their complex dimensions, reflex fields, compact duals, and morphisms, including the Hilbert trace-pairing symplectic embedding for `G*`. Treat the general `G=Res GL₂` separately. Unit tests must include a product datum and a torus datum, so that neither connectedness of `X` nor positive dimension is accidentally built into the definition.

## Completion conditions

The generic constructions accept any datum satisfying the three axioms. Example constructions prove those axioms, rather than passing them as assumptions. Every topological or analytic structure agrees with its inherited standard structure. Every use of rational weight or a split coefficient field is visible in the theorem statement. No canonical algebraic model is presumed in this roadmap; that is the next construction.


## Implementation handoff: Hodge signs and reflex-field descent

**Stages:** D1, D2, D3, D4, D5. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Construct the Deligne torus as the supplied Weil restriction of the affine group G_m over C/R, and prove the equivalence with sums of pure real Hodge structures with the chosen signs. This finite étale field restriction is distinct from the abelian A6 construction. D3 exports a conjugacy class of cocharacters and its reflex field, not a chosen representative over that field.

**Acceptance and consumer contract.** Evaluate the trivial representation, Q(1), elliptic homology and the adjoint GL₂ representation against the same sign dictionary. Check a datum with compact real factors, a zero-dimensional torus datum and a nonfaithful central action. Prove the factor-through-Gᶜ condition before downstream associated bundles descend.

## Source anchors and prototype coverage

- ShimuraData source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
