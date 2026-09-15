# Roadmap: enhanced derived categories of sheaves

This specification uses the shared [diamond conventions](../../campaign-guide/DIAMONDS_CONVENTIONS.md),
[source contracts](../../campaign-guide/DIAMONDS_SOURCE_CONTRACTS.md), and
[65-milestone source graph](../../campaign-guide/DIAMONDS_DEPENDENCY_ORDER.md). The original ECD source
coverage is retained in the 328-item index.
Canonical campaign ownership takes precedence over historical supplier paths in the source index.

ECD does not construct its general `Rf!` by taking an ordinary colimit of triangulated functors.
The homotopy-coherent construction in §22 and the adjoint theorem in §23 are prerequisites of
the advertised generality. This component constructs the required enhancement, rather than
introducing a structure whose fields simply assume all six-operation properties.

Use existing Mathlib complexes, quasi-isomorphisms, derived categories, localizations, shifts,
t-structures, sheafification and adjunctions. Consume the applicable Hom-complex/DG material
from DGAInfinity. The existence of DG categories alone does not supply presentable stable
∞-categories, coherent descent, or relative Kan extensions.

## E0. A concrete enhancement and the necessary higher-category operations

Use a single concrete model: quasicategories, with dg nerves for the derived categories in this
family. Reuse Mathlib's `SSet.Quasicategory`, inner horn-filling, inner fibrations and
categorical-nerve API; construct the additional equivalence, mapping-space, functor and
natural-transformation theory, extending universe support where needed. Construct the dg
nerve using truncation and Dold–Kan of mapping complexes, with coherent composition, and prove
its mapping-space and homotopy-category descriptions. The dg nerve of complexes is not just
the ordinary nerve of their homotopy category.

Construct equivalences, slices, limits and colimits with their mapping-space universal
properties for the categories used below. Develop the stable-category API: zero objects,
fibres/cofibres, suspension, exact functors and triangulated homotopy categories. Build the
comparison of shifts and cone signs with the existing cochain-complex convention. Do not
redefine the underlying triangulated category merely to avoid this comparison.

Construct coCartesian fibrations and coCartesian sections for the diagram shapes used here,
especially `Δ`, products with intervals, and refinement diagrams. Prove their classification by
coherent diagrams in `Cat_∞` in the required size range. The restricted straightening and
unstraightening theorem, fibrewise evaluation and naturality are owned here; calling them
“standard higher category theory” does not discharge them.

## E1. Derived sheaves and presentability

For a small site and a commutative coefficient ring, construct the category of module sheaves
and its unbounded dg category of complexes. Build functorial K-injective and K-flat replacements
in the required Grothendieck abelian categories. Prove existence using the sheaf-module
Grothendieck and generating-family arguments, transfinite constructions, and the requisite
size bounds. A bounded-below injective resolution is insufficient.

Take the dg nerve of the K-injective model, or a proved equivalent dg localization, and prove
that its homotopy category is the already chosen ordinary unbounded derived category. Compute
mapping spaces from derived Hom; prove stability. Construct filtered homotopy colimits and
generating sets, accessible localization at quasi-isomorphisms, and presentability. Construct
the derived tensor product from the K-flat model and transfer it through the comparison;
K-injectives are not silently assumed closed under tensor products.

For morphisms of sites and ringed topoi, construct the enhanced pullback/pushforward adjunction
with the required derived tensor in ringed pullback. At constant coefficients, prove agreement
with the exact sheaf pullback. Construct symmetric monoidal coherence, derived internal Hom,
change of coefficients and compatibility with the ordinary derived-category functors. Provide
identification of equivalences by quasi-isomorphisms and by cohomology sheaves.

## E2. Repleteness, Postnikov completion and cohomological descent

Construct truncation and Postnikov towers, their enhanced inverse limits and the left completion
of a derived category. Prove the universal comparison with the original category and the
criteria giving an equivalence. Do not assume unbounded derived categories of arbitrary
sheaf categories are left-complete.

Prove the replete-topos results used from Bhatt–Scholze, *The pro-étale topology for schemes*,
§3: the needed exactness of inverse limits of surjections, convergence of derived Postnikov
towers, and unbounded cohomological descent. State separately the bounded-below comparison
which needs weaker assumptions. Prove the finite-cohomological-dimension criterion and uniform
truncation estimates used to promote a bounded result to an unbounded one.

Construct simplicial sites, cartesian complexes, hypercovers, totalizations and the enhanced
equivalence between sheaves on a site and cartesian objects on a suitable hypercover. Prove
cofinality/refinement compatibility and independence of the hypercover. The diamond component
C0 proves that its actual v- and quasi-pro-étale sites meet these hypotheses. Generic descent
lemmas here do not assume that every site is replete.

## E3. Coherent diagrams, Kan extensions and adjoints

Construct the enhanced category associated with a diagram of ringed topoi, with the coherent
pullback functors needed for ECD 17.3 and 22.16–22.18. Follow the diagrammatic construction
cited from Liu–Zheng, *Enhanced six operations and base change theorem for Artin stacks*, §2,
without assuming their Artin-stack six-operation theorem for diamonds.

Prove the left Kan extension theorem along a full inclusion, its pointwise formula using slice
categories, its uniqueness, and its compatibility with a coCartesian diagram. Prove the
cofinality result used when restricting from a total diagram to a fibre, and the criterion that
a fibrewise transformation preserves coCartesian edges. These are the precise pieces of HTT
§4.3.2 used in ECD's non-qc proper-support construction.

Construct accessible localizations and reflective/coreflective full subcategories in the
applicable presentable categories. Prove the adjoint functor theorem for colimit-preserving
functors between these presentable categories, including the enhanced adjunction and its
uniqueness. The proof must produce the right adjoint, not store it as an unproved structure
field. For large sites construct adjoints at adequate cutoffs and prove compatibility before
passing to the category of small objects. Prove that an exact functor between the relevant stable cocomplete categories preserves
all small colimits when it preserves coproducts. Supply mates, Beck–Chevalley transformations,
and identity/composition/pasting coherence for adjunctions.

For the full subcategory defining `D_ét`, C2 must exhibit the accessibility and colimit-closure
hypotheses, not merely invoke this component's abstract adjoint theorem. In particular, the
inclusion in the v-derived category has a **right** adjoint when it preserves colimits; distinguish
this coreflection from left-completion.

## E4. Derived adic completion

The generic module/ring completion construction is now canonically
[DerivedDeRhamCohomology DD.1](../DerivedDeRhamCohomology/README.md#dd-1):
localization/Koszul completeness for finitely generated ideals, adjunction, generator
independence, reduction conservativity, completed tensors and the valid inverse-limit
comparisons. This E4 milestone reexports that interface and owns its extension to
sheaves and compatible coefficient systems. DD.1 uses E0/E1 and E5's animation
prefix, not this E4 application, so there is no completion-definition cycle.
For the coefficient-system reconstruction theorem below impose the additional completeness
and regular-sequence hypotheses stated there. Construct the enhanced inverse limit
of the categories with coefficients `Λ/I^n` and prove the reconstruction theorem in the stated
hypotheses. Include nonnoetherian rings allowed by the regular-sequence hypothesis.

Apply DD.1's completed tensor products and completed colimits in this sheaf setting. Prove reduction and finite-level
coefficient change commute with the eligible operations, including the devissage from `I` to
`I^n`. Do not infer that every power `I^n` is generated by a regular sequence. Do not infer
compatibility of an arbitrary right adjoint with reduction without the perfect-complex/regular
sequence argument. L0 applies this to étale objects and performs the six-operation construction
for the entire compatible coefficient system.

## E5. Shared monoidal enhancement, Ind-completion and animated algebra

This is an abstract branch from E0, with E3 supplying presentability assertions when used;
it has no dependency on diamonds or prismatic cohomology. It is the single enhancement
supplier for StableHomotopyKTheory, GeneralAlgebraicKTheory and geometric local Langlands.

<a id="stage-E5:abstract"></a>
### E5:abstract — Monoidal stable categorical baseline

Construct symmetric monoidal infinity categories via coCartesian fibrations over finite
pointed sets, Segal conditions, operadic algebras, modules and monoidal functors with their
coherent universal properties. Build exact/idempotent-complete stable categories, the
Karoubi envelope.

<a id="stage-E5:presentability"></a>
### E5:presentability — Ind-completion and extensions

Using E3 and E5:abstract, construct Ind-completion, compact-object comparison and extension of exact functors
to colimit-preserving functors. Prove the tensor/Ind and module/base-change compatibilities
under the appropriate compact-generation hypotheses. StableHomotopyKTheory supplies the
concrete spectrum objects and spectrum comparison; this stage does not construct them again.

Construct finite and profinite coherent group actions, homotopy fixed points and equivariant
functor categories with explicit continuity through finite quotients where appropriate.
These supply the categorical action data used in the spectral action; ordinary actions on
isomorphism classes do not replace them. Construct algebra/module categories and the
Eilenberg–Mac Lane comparison in a later branch once the concrete spectra are available.

<a id="stage-E5:animation"></a>
### E5:animation — Simplicial commutative algebra

Construct animated commutative algebras from simplicial commutative rings, polynomial
resolutions, sifted left Kan extensions and tensor pushouts.

<a id="stage-E5:cotangent-export"></a>
### E5:cotangent-export — The return from derived de Rham

The cotangent complex,
its derivation characterization, transitivity/base change, derived exterior powers and
Tor-amplitude tests are now constructed by
[DerivedDeRhamCohomology DD.0](../DerivedDeRhamCohomology/README.md#dd-0)
from this animation prefix; E5 reexports that one interface. In positive characteristic,
compare with E-infinity algebras only in proved ranges: strictly commutative dg algebras
are not a general replacement. PrismaticCohomology PR.0–2 owns the generic prismatic
application; PerfectoidQuotients Q0–4 owns its perfectoidization/quotient application.
LanglandsParameterStacks owns derived affine/quotient/mapping stacks and their geometry.

<a id="stage-E5:spectra-comparison"></a>
### E5:spectra-comparison — Late concrete realization

After StableHomotopyKTheory H.5, compare its concrete spectra and spectral module
categories with the abstract stable/monoidal construction. Prove the exact tensor,
Eilenberg–Mac Lane and coherent action comparisons used by E1's spectral realization.
This return is not a prerequisite of E5:abstract or E5:animation.

Tests: a polynomial algebra cotangent module, a regular quotient's two-term cotangent
complex, a nonregular quotient with higher homology, the Ind-envelope of perfect modules,
and a coherent action whose invariants carry higher group cohomology. Sources: HA §§1–4,
HTT §§4–5, BS22 §§2–7, FS VIII.3 and X.1. Every use includes an actual construction and
comparison to the existing Mathlib ordinary category rather than a second private carrier.

## Public interfaces and tests

Export constructions, comparison equivalences to ordinary derived categories, universes,
functoriality and coherence. Names referring to `Cat_∞`, presentability or a homotopy colimit
must denote constructed mathematical objects. No unspecified `Type` carrying assumed six
functors is an implementation of this component.

Tests include modules on a point, a finite discrete space, a Čech nerve, a refinement square,
a countable Postnikov tower, K-flat versus K-injective models, a left Kan extension from
compact-support objects, and derived `ℓ`-completion. A theorem on homotopy categories alone
may be exported for users, but its enhanced antecedent remains required wherever ECD uses it.

## Completion contracts added on 2026-09-15

**Applies to:** `E0`, `E1`, `E2`, `E3`, `E5:abstract`, `E5:animation`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Give mapping spaces from a concrete dg nerve and prove that localization at quasi-isomorphisms matches the existing derived category on its homotopy category. Construct a homotopy-coherent cone for the support diagrams, not just commuting squares after taking isomorphism classes. For each unbounded descent application exhibit the Postnikov convergence or uniform cohomological-dimension criterion. Animation and stable symmetric-monoidal enhancement are separate constructions with a later comparison.

### Producer–consumer contract

Export coherence for mates and pasting, Kan-extension unit/counit and independent refinement maps. The ordinary Hom equivalence in the seed is only a compatibility check: its supplied adjunction cannot be counted as constructing a geometric adjoint.

### Acceptance and source route

Compute modules on a point, a nontrivial Cech nerve, an unbounded tower, and two successive refinements. Compare K-flat tensor with K-injective pushforward without assuming either replacement serves both roles.

**Source route:** HTT 4.3.2 and §§4–5; HA §§1–4; ECD 22.16–23.1 uses these inputs; FS X.0.1 coherence convention. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
