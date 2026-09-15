# Roadmap: Algebraic moduli and representability for arithmetic geometry

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Supply the general algebraic geometry needed by integral modular curves, local lattice moduli, Hilbert–Blumenthal moduli and Faltings' finiteness theorem. Every arithmetic moduli problem later used must be represented or algebraic by an actual construction; an assumed “moduli space” is not an admissible starting point.

## Existing material and ownership

Consume scheme morphisms, descent, line bundles and relative coherent cohomology from the existing geometry portfolio. AlgebraicVectorBundles #297 owns finite locally free sheaves and relative Spec, but expressly leaves projective and Grassmannian bundles to a successor. JacobianChallenge owns field-valued abelian varieties and curve Picard schemes. This roadmap owns general parameter spaces, algebraic spaces and the restricted stack/representability machinery needed by this project. Reassign any item already claimed by a live supplier rather than duplicate it.

## Conventions

A moduli functor is specified on schemes with pullback, morphisms and descent. Distinguish a stack, an fppf sheaf of isomorphism classes, a fine moduli scheme and a coarse moduli space. A coarse object need not commute with arbitrary base change. Quotients by finite group schemes in characteristics dividing their order cannot be treated as tame automatically.


<a id="r09-1"></a>

## R09.1. Projective parameter spaces

**Milestone:** `R09.1`

Construct projective bundles, Grassmannians and flag schemes with their quotient/subbundle universal properties, universal sheaves and base-change laws. Include relative ampleness and very ampleness, Hilbert polynomials and boundedness statements in the exact Noetherian setting later used. Prove the closedness of the equations defining invariant subbundles and Frobenius-stable lattices. R05 consumes this layer, not the later arithmetic moduli.

**Dependencies:** Existing Mathlib and the explicitly listed upstream suppliers; no later campaign theorem is a prerequisite..

<a id="r09-2"></a>

## R09.2. Hilbert and Quot functors

**Milestone:** `R09.2`

Construct the Hilbert and Quot schemes with fixed Hilbert polynomial in the projective finite-presentation cases used here, stating the base and sheaf hypotheses of the chosen projectivity theorem. Prove representability, properness/projectivity of the parameter morphism H→S or Q→S when that theorem applies, and base-change compatibility. Flatness has a different target: the universal closed subscheme U→H is flat, and the universal quotient sheaf on X×_S Q is Q-flat. Neither statement implies that H→S or Q→S is flat. Any such parameter-space flatness conclusion needs an independent theorem and its hypotheses. Develop relative Hom schemes and Isom schemes where the subsequent moduli proofs invoke them. The functor-level distinction follows [Stacks, Tag 0CZX](https://stacks.math.columbia.edu/tag/0CZX). As a negative acceptance example, take S=Spec(k[ε]/(ε²)) and X=Spec(k) embedded as its closed point: the degree-one Hilbert functor is represented by X, with universal family X→X flat, whereas X→S is not flat. Prove this by the rank-one quotient criterion, so an AI cannot transfer flatness along the wrong arrow. Include the boundedness argument needed to realise the functor inside a Grassmannian; naming a Hilbert polynomial does not prove a parameter scheme exists.

This stage also owns the noetherian Chow-lemma/proper-modification package used by ComplexComparisonPartII C3: construct a proper surjective modification by a scheme quasi-projective over the base, with the dense-open isomorphism and component hypotheses stated. For a proper source over a field deduce a projective dominating scheme, not projectivity of the original source. Prove the coherent descent/dévissage statements used in the selected proper-GAGA proof; R09.3 supplies the subsequent algebraic-space descent extension.

**Dependencies:** R09.1 (preceding layer).

<a id="r09-3"></a>

## R09.3. Algebraic spaces and descent

**Milestone:** `R09.3`

Construct étale equivalence-relation quotients, their morphisms, fibre products and properties needed for coarse modular curves and relative moduli. Compare with the finite étale quotient construction of #81 instead of replacing it. Prove effective descent for the sheaves, finite flat groups, polarisations and projective objects used by the arithmetic applications. Separate descent of a line bundle from descent of an object equipped with that line bundle.

**Dependencies:** R09.2 (preceding layer).

<a id="r09-4"></a>

## R09.4. Algebraic stacks in the required class

**Milestone:** `R09.4`

Define categories fibred in groupoids, stackification, representable diagonals and smooth/étale atlases. Prove the quotient-stack and moduli-stack algebraicity results used for generalised elliptic curves and polarised abelian schemes, by explicit atlases or the precisely selected representability theorem. Deligne–Mumford, separated, proper and tame are distinct properties with distinct proofs. This is a mathematical construction, not a placeholder record containing all desired conclusions.

**Dependencies:** R09.3 (preceding layer).

<a id="r09-5"></a>

## R09.5. Coarse spaces and rigidification

**Milestone:** `R09.5`

Prove existence of coarse spaces for the particular finite-inertia/quotient presentations used in this programme, together with the exact base-change statements available. Construct removal or addition of auxiliary prime-to-characteristic level and show how it rigidifies automorphisms. Include normalisation, schematic closure and descent of finite correspondences. Do not infer fine representability by forgetting automorphisms from a coarse object.

**Dependencies:** R09.4 (preceding layer).

<a id="r09-6"></a>

## R09.6. Formal deformation and representability comparisons

**Milestone:** `R09.6`

Relate the deformation functor at a geometric point to the completed local ring of the constructed scheme or stack, including stabilisers and versality. Prove algebraisation statements needed by R10/R13, using the formal geometry of R05 at the relevant layer. Export named universal properties for every parameter space consumed by the arithmetic roadmaps. Any invocation of Artin representability must include its hypotheses and a proof or an assigned supplier of the theorem itself.

**Dependencies:** [AdicSpacesPartII F0](../AdicSpacesPartII/README.md#f0); [AdicSpacesPartII R3](../AdicSpacesPartII/README.md#r3); [AlgebraicModuliForArithmeticGeometry R09.5](README.md#r09-5).

<a id="r09-7"></a>

## R09.7. Characteristic-zero resolution and normal-crossings compactification

**Dependencies:** R09.1–R09.3; no Borel algebraicity, polarized-variation algebraization, or Shimura comparison theorem.

This is a substantial new construction, not a small consequence of Hilbert schemes. Its exact scope is varieties of finite type over a characteristic-zero field, with smooth ambient embeddings; no mixed-characteristic or unrestricted excellent-scheme resolution theorem is asserted. Use Bierstone–Milman, *Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant*, Inventiones 128 (1997), 207–302, full published article, retaining the hypotheses of the selected algorithm. The earlier arXiv file contains only the first 30 pages/Chapter I despite displaying the full table of contents; it is not the proof source. Theorem 11.14 supplies embedded resolution, Theorem 12.2 the preservation of resolved points, and Theorem 13.2 the local-isomorphism-compatible global construction. A stronger functoriality for every smooth morphism needs an additional proof and is not inferred from 13.2's isomorphism statement. The proof must implement the following intermediate interfaces.

<a id="r09-7a"></a>

### R09.7a. Blowups, transforms and marked ideals

Construct blowups by the Rees algebra with their projective universal property, affine charts, strict/total/controlled transforms and smooth base-change comparison. Define simple normal-crossings boundary divisors and permissible smooth centres transverse to the accumulated boundary. Define marked ideals and their equivalence under the admissible transformations used by the algorithm. Prove the local order and exceptional-multiplicity calculations; the transform of an ideal is not simply its total inverse image.

<a id="r09-7b"></a>

### R09.7b. Local invariant, maximal contact and coefficient ideals

On smooth characteristic-zero charts construct the order/multiplicity invariant, maximal-contact hypersurfaces in the source's allowed situations, coefficient ideals and inductive dimension reduction. Prove independence under equivalent presentations, upper semicontinuity and compatibility with smooth coordinate changes. Track exceptional-divisor history and the monomial case. Do not assume maximal contact in positive characteristic, or replace the algorithm by the false assertion that multiplicity strictly decreases at every blowup.

<a id="r09-7c"></a>

### R09.7c. Global centres and termination

Prove that the maximum loci selected by the full invariant define permissible globally compatible centres, using the local equivalence and descent package. Establish decrease of the complete invariant and termination, including residual monomial clean-up. Produce a finite sequence whose total transformed ideal is invertible with normal-crossings support, and deduce embedded desingularization. Prove the isomorphism over the prescribed regular/SNC locus and the functoriality actually provided by the chosen source.

<a id="r09-7d"></a>

### R09.7d. The compactification interface for Borel extension

For a smooth quasi-projective variety over a characteristic-zero field, take a projective closure using R09.1 and resolve it together with its boundary via R09.7a–R09.7c, preserving the given smooth open. Export a smooth projective compactification with strict normal-crossings complement and its analytic polydisc charts over C. This is the precise input used on quasi-projective source charts in ShimuraVarieties V3 and PELModuli M3; no general Nagata compactification is silently assumed. Deligne's *Théorie de Hodge II* 4.4.3 (and Milne 14.8) explicitly uses Borel for essential surjectivity, so polarized-family algebraization is not an independent shortcut around this stage.

## Required examples and checks

Check projective space as line quotients, a rank-one Grassmannian, a finite constant-group quotient in tame characteristic, and a non-tame example. Show that the coarse j-line and the moduli stack of elliptic curves are not interchangeable objects.



## References

EGA, MODULI_STACKS, ARTIN_MODULI. The bibliography records what was inspected and what remains to be transcribed.

<a id="a0-extension"></a>
<a id="stage-A0-extension"></a>

## A0-extension: higher-dimensional moduli prerequisites

This is the sole owner of Shimura A0. Extend proper-flat coherent cohomology and base change beyond curves, with finite presentation, Tor-amplitude and flatness hypotheses in each statement. Construct the relative degree-zero Picard representability criteria needed by an abelian scheme, using algebraic spaces, deformation/obstruction theory and effectivity. The abelian-specific identification of that Picard space with the dual belongs to AbelianSchemesAndArithmeticModuli A2.

For the selected Artin route prove the criterion itself: limit preservation, representable diagonal, deformation and obstruction functors, openness of versality and algebraization. Verify these inputs in every PEL application. Extend analytification to étale presentations and prove descent of local-isomorphism comparisons; prove finite normalization under excellence. The implication “proper algebraic space implies projective scheme” is never used. Hilbert/Quot parameter spaces precede formal local-model moduli, so R09.1–R09.5 do not import local deformation geometry.


## Implementation handoff: Representing spaces and the morphisms they control

**Stages:** R09.1, R09.2, R09.3, R09.6, A0-extension. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

For each Hilbert/Quot application fix the projective morphism, coherent sheaf, Hilbert polynomial and base category. Construct the Grassmannian chart equations, universal quotient, flattening locus and gluing; extract the actual universal family. R09.3 additionally owns Weil restriction as an algebraic space for finite locally free bases, with the Stacks 05YC base-change map and 05YF representability proof.

**Acceptance and consumer contract.** Every consumer receives separately the parameter morphism, universal-family morphism and flat sheaf. Prove the dual-number degree-one Hilbert example. For formal moduli identify a versal groupoid with stabilizers before identifying any completed local ring; algebraization needs effectivity. R09.7 remains its own characteristic-zero resolution proof and cannot be replaced by a presumed smooth compactification.

## Source anchors and prototype coverage

- AlgebraicModuliForArithmeticGeometry source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.

The `A0-extension` milestone above is the higher-dimensional representability/descent extension, not all later moduli constructions.
