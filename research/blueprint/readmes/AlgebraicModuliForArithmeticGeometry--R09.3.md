# Algebraic moduli and representability for arithmetic geometry — R09.3

## Purpose and ownership

This layer extends the affine and finite scheme constructions of the Tau Ceti
ModularCurves roadmap to the algebraic-space interfaces needed by arithmetic
moduli. Its principal result is Weil restriction along a finite locally free
map of algebraic spaces, with an arbitrary target and canonical base change.
Two comparison lanes identify its outputs with existing finite quotients and
with existing descent of structured objects. Coherent descent along an étale
presentation supplies the algebraic input for analytic comparison consumers.

SchemeAndStackFoundations **SF.1 owns the common algebraic-space theory**:
the space carrier, representable diagonal, atlases and their independence,
quotient sheaves, étale equivalence relations, fibre products, morphism
properties, the small étale ringed site and general space and module descent.
R09.3 imports those objects. It does not construct them again. Stack foundations
are also SF.1 outputs; their moduli applications belong to R09.4. This is the
ownership direction required by confirmed finding RT-AREA-algebraicgeometry/1.

ModularCurves **0C** owns the effective finite locally free scheme quotients;
**0E** owns affine and finite locally free descent, groups, torsors, level
structures and polarized projective relative curves; **0F** owns affine
finitely presented Weil restriction. ReductiveGroupsPartII **RG2.0a** supplies
the arbitrary-algebra affine representing construction used in the proof below.
StableReduction **Layer 2** owns relative ampleness, relative Proj and effective
étale descent of polarized schemes. R09.3 proves compatibility with these
suppliers on their stated domains. The exact supplier requests appear at the
end of this document.

The accepted A0-extension packet already contains 38 R09.3 module-descent
nodes. Their IDs and plans are retained as imports. The present packet has
13 new target-level nodes. It neither copies their declarations nor reports
their unchecked adapters as proved. Every narrowed target is planned, with
four explicit groups of refinements preventing closure.

## Conventions and existing inputs

Fix a universe of schemes. The common space carrier is SF.1's full subcategory
of set-valued presheaves on schemes satisfying the fppf sheaf condition,
having a scheme-representable diagonal and admitting a scheme étale surjective
atlas. Products and pullbacks are the corresponding sheaf limits. Schemes
enter by the fully faithful Yoneda embedding. Morphisms and module maps are
actual arrows; passing to isomorphism classes would lose the descent information
this layer needs.

A finite locally free map of spaces means a scheme-representable map whose
scheme base changes are finite, flat and locally of finite presentation. Finite
flatness without local finite presentation is insufficient over arbitrary
bases. The map need not be surjective: its rank may be zero on a component.
The restriction construction and the base-change identification below need only
scheme representability of the source map. Finite local freeness enters the
algebraicity theorem.

Chosen pullbacks are compared by canonical isomorphisms. An equality on a
triple overlap includes these associativity identifications. Source and target
projections of a presentation are written s,t, and the module transition is
an isomorphism from t-pullback to s-pullback. Diagonal normalization and the
triple cocycle are separate obligations. A line bundle is an invertible module
in the common module carrier, with its actual transition isomorphisms.

The pinned baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Native relative representability
provides a representing scheme for every pullback against a scheme test, its
two projections and the pullback universal property. Native Yoneda equivalence
identifies natural maps from a scheme representable with presheaf sections.
The suggested file stores base sections this way to avoid increasing the
universe of point sets. Native fppf and étale topologies and the existing
finite, flat and locally finitely presented scheme-map predicates supply the
geometric tests. These are imports, not new definitions.

Mathlib already proves comonadicity of faithfully flat extension of scalars.
It also supplies right-adjoint uniqueness and its unit and counit compatibility
equations. A natural isomorphism between right functors alone does not transport
a comonad: the inherited adapters must also identify comultiplication,
coalgebra structure and the canonical comparison functor. The suggested file
checks the existing adjunction identities as native fixtures without adding
roadmap targets for them.

The current read-only upstream audit supplements the pinned inventory. At
TauCeti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, the module pullback API
already contains quasi-coherent and finite-presentation preservation,
structure-sheaf pullback and restriction comparisons, and affine tensor
comparisons. AlgebraicVectorBundles, absent from the atlas snapshot, owns the
module wrappers and these pullback and relative Spec interfaces. An
implementation must consume that work when it rebases. These APIs supply
pullback operations; they do not establish general fpqc descent.

Current Tau Ceti also contains the invariant-ring spectrum quotient and its
universal property for affine targets. That is useful existing work, but it
does not imply that a nonfree action's invariant quotient is the fppf orbit
sheaf. The finite-quotient comparison below uses the stronger effective-relation
contract of MC0C.

## Relative morphisms and the restriction functor

All declaration names in this document have prefix
`TauCeti.AlgebraicGeometry.ModuliDescent`. All new node IDs have prefix
`AlgebraicModuliForArithmeticGeometry:R09.3/r093-`. The shorter names below
identify those declarations and IDs without introducing another namespace.

### Relative morphisms — node relative-hom

For a scheme-representable map f:Z→B and x:X→B, define
Mor_B(Z,X)(T) to be pairs (a,b). Here a is a point of B(T), and b is a map
from Z_T=T×_B Z to X for which x composed with b equals the map from Z_T
to B. The projection remembers a. Restriction along T′→T precomposes b
with the canonical map Z_T′→Z_T. The definition retains b itself, including
its value on every component of the source.

This is `relativeHom`. Its source need not be finite to define the functor.
Changing the chosen representing scheme for Z_T changes the description by
the unique isomorphism preserving its two projections. The universal property
then gives a natural comparison of the entire functors. This relative Hom is
used both to build the étale atlas in the finite-source algebraicity proof
and to express restriction as the identity fibre of postcomposition.

The definition and evaluation are from Stacks, *Criteria for Representability*,
§10, formulas (10.0.1)–(10.0.2) and Lemma 10.1, tags 05Y1–05Y3,
pp.14–15. This is a specification of the target, expressed in our own terms.

Its API is:

| Declaration | Required behaviour |
| --- | --- |
| relativeHomToBase | Project (a,b) to a, naturally on scheme tests. |
| relativeHom_points | Identify points with exactly the pairs above. |
| relativeHom_map_points | Restrict b by the unique fibre map commuting with both the map to Z and the map to the test scheme. |
| relativeHom_ext | Equality of the base points and of the transported maps b determines equality of points. |
| relativeHomHomEquiv | For any presheaf V→B, maps V→Mor_B(Z,X) over B are naturally equivalent to maps V×_B Z→X over B. |
| relativeHomMap | A target map over B induces postcomposition. |
| relativeHomMap_points | Postcomposition sends (a,b) to (a,m composed with b). |
| relativeHomMap_id | The identity target map induces the identity. |
| relativeHomMap_comp | Successive target maps induce the composite of their induced maps. |

Three tests distinguish the intended definition:

- **relativeHom_identity:** for Z=B and the identity map, the result is X
  over B.
- **relativeHom_empty:** an empty source gives B, even with empty target X.
  There is a unique empty-domain map for every base point.
- **relativeHom_split_two:** for Z=B disjoint union B over a scheme B, the
  result is X×_B X. The two source components contribute independent maps.

The point and target-map laws serve finite-source parameter comparisons and
moduli morphism tests. An interface that keeps only the existence of b would
fail the split-source test and could not construct the cartesian comparison.

### Weil restriction — node weil-restriction

For X→Z→B, with f:Z→B scheme-representable, define Res_{Z/B}(X)(T) to be
pairs (a,b), with a in B(T) and b:Z_T→X satisfying the equality of maps to
Z: z composed with b is the projection Z_T→Z. The functor is called
`weilRestriction`, and its projection to B remembers a. This equality to Z
is essential. Requiring only equality after composing to B would give the
relative morphism functor of the preceding target instead.

The definition is used by the representability theorem, the base-change
comparison and the comparison with the two affine suppliers. Its source
is Stacks, *Criteria for Representability*, §11, formulas (11.0.1)–(11.0.2),
tags 05Y9–05YA, pp.16–17, with the evaluation statement in Lemma 11.1
(05YB), p.17.

Its API is:

| Declaration | Required behaviour |
| --- | --- |
| weilRestrictionToBase | Project (a,b) to a. |
| weilRestriction_points | Describe points by the actual section equation over Z. |
| weilRestriction_map_points | Restrict a and precompose b with the canonical source-fibre map. |
| weilRestriction_ext | Base point and section map determine the point after the required fibre transport. |
| weilRestrictionHomEquiv | Maps V→Res_{Z/B}(X) over B are naturally equivalent to maps V×_B Z→X over Z. |
| weilRestrictionMap | A target map over Z induces postcomposition. |
| weilRestrictionMap_points | The induced point is exactly (a,m composed with b). |
| weilRestrictionMap_id | Identity postcomposition induces the identity. |
| weilRestrictionMap_comp | Postcomposition respects composition of target maps. |

Four tests are required:

- **weilRestriction_identity:** restriction along the identity of B gives X
  over B.
- **weilRestriction_terminal:** for X=Z and the identity map X→Z, the result
  is B. The unique section is the projection from Z_T.
- **weilRestriction_empty:** Z=X empty gives B, including for nonempty B.
  The result is not an empty functor.
- **weilRestriction_split_two:** take Z=B disjoint union B and
  X=X1 disjoint union X2 with its componentwise map to Z. Restriction is
  X1×_B X2, not the disjoint union of the two targets.

Both definitions have native small-presheaf signatures, all nine API items
and all their tests in the suggested file. The empty and split-source relative
Hom tests include the target sheaf condition; a general presheaf need not send
an empty scheme to a singleton or a disjoint union to a product. All seven
test isomorphisms preserve the projection to the base. Their functor laws, constructions
and proofs remain unchecked mathematical work.

## The finite-source representability route

### Étale spaces of sections — node etale-sections

`finiteSourceEtaleSections` has the following statement. Let Z→U be finite
locally free between schemes, and W→Z an étale map of algebraic spaces.
The sections of W_T→Z_T form an algebraic space étale over U. If W→Z is
surjective, this space is surjective over U in the étale topology. The conclusion
requires neither separatedness of W→Z nor a scheme target W.

For the separated case a section has an open and closed image in W_T. The
finite-part sheaf parametrizes open subspaces of W_T finite over T. The
section locus is the open part where the map of this subspace to Z_T is an
isomorphism. The two exact missing common interfaces are recorded as an SF.1
request: representability of this finite-part sheaf, and the open-isomorphism
locus with its complete flatness, finite-presentation, closure and separation
hypotheses.

To remove separatedness, choose a separated scheme atlas W′→W. Section
spaces for W′ give a cover of the desired section space. The fibre over a
section of W is the section space for W′_T×_{W_T}Z_T→Z_T, which is the
separated case. Finite source fibres allow simultaneous lifts after an étale
neighbourhood of U. SF.1 Artin bootstrap then gives the result. This cover is
representable **by algebraic spaces** and étale; claiming representability by
schemes at this step would strengthen the source theorem.

The proof is Stacks, *Criteria for Representability*, §9, Lemmas 9.1–9.2
(05XQ, 05XR), pp.12–14. Its common inputs are *More on Groupoids in Spaces*,
§12, Proposition 12.11 (04QH), p.19, and *More on Morphisms of Spaces*,
§49, Lemma 49.6 (05XD), p.122. The native signature expresses étaleness of
the resulting space using a scheme atlas whose composite to U is étale;
it does not require the entire space map to be scheme-representable.

Acceptance includes the identity source, the empty source and a split source
of rank two with a constant two-element étale fibre. The last case has four
sections. The source's nonseparated reduction is read with W′→Z separated;
it does not assume the arbitrary map W→Z is separated.

### Algebraicity of relative morphisms — node relative-hom-algebraicity

`relativeHom_algebraicity` states that Mor_B(Z,X) is an algebraic space when
B, Z and X are algebraic spaces and Z→B is finite locally free. There is
no affineness, finite-presentation, separatedness or quasi-compactness condition
on X.

Glue the base maps and the relative morphisms to establish the fppf sheaf
property. Work étale locally on B so that B is affine and Z finite free.
Choose a disjoint union of affine schemes X′ forming an étale atlas of X.
A fibre of Mor_B(Z,X′)→Mor_B(Z,X) is the section space for the pulled-back
atlas over Z_T. The preceding theorem gives étale representability by spaces
and surjectivity.

Finite unions of the affine atlas components are affine. Maps into each such
union are represented using RG2.0a's **arbitrary-algebra** affine restriction.
They form open subfunctors: the part of the finite source mapped outside the
union has closed image in the test base. On affine scheme tests the finite source is quasi-compact,
so these open subfunctors cover as sheaves. Glue the representers and apply Artin bootstrap
for the resulting étale cover. Evaluation uniqueness supplies agreement on
base charts and the unit and composition equations of their comparisons.

This route follows Stacks, *Criteria for Representability*, §10, Lemma 10.3
and Proposition 10.4 (05Y5, 05Y7), pp.15–16. The affine input is *More on
Morphisms*, §68, Lemmas 68.1–68.2 (05Y6, 0BL3), pp.208–209. The arbitrary
generators and relations in this input matter: MC0F's finitely presented
version alone would not prove the unrestricted target statement. No new
coordinate algebra is planned in R09.3.

### Sheaf property, base change and the identity fibre

`weilRestriction_isSheaf` — node **restriction-sheaf** — requires only fppf
sheaves X,Z,B and scheme-representable f. Glue a first, then b over the
pulled-back cover. Its equality with the source projection is checked after
that cover. This uses separatedness as a sheaf condition, not separatedness
of a geometric morphism. Evaluation on algebraic-space tests follows by a
scheme atlas and its quotient-sheaf universal property. The source is Stacks
Lemma 11.1 (05YB), p.17.

`weilRestriction_baseChange` — node **restriction-base-change** — states a
canonical isomorphism over B′:

Res_{Z′/B′}(X′) ≅ B′×_B Res_{Z/B}(X),

where Z′=B′×_B Z and X′=Z′×_Z X. For a test T→B′ both sides retain the
same map Z_T→X. The inverse maps, target naturality, identity base change
and two-step base-change coherence are fixed by this evaluation. B′→B is
arbitrary, including nonflat changes; no finite local freeness is needed to
identify the functors. This is Stacks Lemma 11.2 (05YC), p.17. Acceptance
includes a residue-field change from a nonreduced base.

`weilRestriction_cartesian` — node **restriction-cartesian** — identifies
restriction as the fibre of

Mor_B(Z,X) → Mor_B(Z,Z)

at the identity section B→Mor_B(Z,Z). The upper map is postcomposition
with X→Z; the inclusion of restriction keeps the same section b. The square
is cartesian as presheaves and as fppf sheaves. Evaluating a point of the
fibre product gives exactly the section equation, so the inverse comparison
is forced. Stacks Lemma 11.4 (05YE), p.18, is the source. An arbitrary
endomorphism of Z is not a substitute for its identity in this target.

### Algebraic-space Weil restriction — node restriction-algebraicity

`weilRestriction_algebraicity` now follows: for X→Z→B algebraic spaces with
Z→B finite locally free, Res_{Z/B}(X) is an algebraic space. Apply
relative-Hom algebraicity to both functors in the cartesian square and use
SF.1 closure under fibre products. The pointwise identification preserves
the structural map, evaluation and base-change isomorphism.

This is Stacks, *Criteria for Representability*, §11, Proposition 11.5
(05YF), p.18. It imposes no affineness, finite presentation, separatedness
or quasi-compactness on X. The result promises an algebraic space. It does
not assert that the result is a scheme or inherits arbitrary properties of X.
Rank zero, rank one and the split rank-two construction are acceptance cases.
The restriction of an étale target map is étale as a map of spaces, and is
surjective when that target map is surjective, by the same section-space
argument (Lemma 11.3, 05YD, p.18).

## Comparisons with existing scheme constructions

### Affine restriction — node affine-restriction-comparison

`affineRestrictionComparison` identifies the space restriction with MC0F's
scheme restriction when X/Z is affine finitely presented and Z/B is finite
locally free. On an affine base and arbitrary affine target it identifies
restriction with RG2.0a's representing algebra. The two comparisons agree
on their overlap. They preserve target maps and commute with the supplied
arbitrary-base-change maps, including the identity and composition equations.

Give each supplier's representing property as the same natural set of section
maps Z_T→X. Yoneda gives the unique isomorphism preserving the universal
section. This characterization proves overlap and base-change agreement.
On rings, retain Spec contravariance: restriction is right adjoint on schemes,
and the associated representing-algebra construction has the reversed
adjunction direction.

The suggested theorem uses a concrete scheme Q, its structural map and an
actual universal evaluation map. Its uniqueness hypothesis is tested on all
scheme tests and actual sections, so it is an implementable comparison theorem
without a placeholder name for either supplier's construction. Instantiate it
with the MC0F and RG2.0a representers. The empty and split source tests must
commute with those instantiations. Sources are MC0F and Stacks §11,
05Y9–05YC, pp.16–17, together with the affine construction of §68,
05Y6/0BL3, pp.208–209.

### Effective finite quotients — node finite-quotient-comparison

`finiteQuotientComparison` works on MC0C's effective finite locally free
relation domain: an affine U or the stated invariant affine cover, a relation
R⇉U, and the supplied fppf quotient q:U→Q with R identified with
U×_Q U. The quotient sheaf supplied by SF.1 is canonically the scheme
representable h_Q, with the same projection from U.

The projection is locally surjective in the fppf topology and has the given
kernel pair. Thus h_Q is the coequalizer sheaf of h_R⇉h_U. The common
quotient universal property supplies the unique comparison preserving q;
uniqueness also proves compatibility with relation maps and permitted base
changes. If the relation projections are étale, this is the comparison with
SF.1's étale-relation quotient. For general finite locally free relations, compare the fppf quotient sheaf
with MC0C's supplied scheme; that comparison establishes its algebraicity.
The relation projections need not be étale. The free
finite constant-group action with invariant affine cover is a torsor instance.

MC0C owns the quotient construction. The general comparison uses Stacks,
*Groupoid Schemes*, §20, Definition 20.1 and Lemma 20.3 (02VG, 03C5),
pp.39–40, for quotient sheaf representability. Its étale specialization uses
*Algebraic Spaces*, §9, Lemma 9.1 (0262), p.12, for the
presentation/coequalizer identification. The suggested signature takes the actual kernel-pair square,
fppf local-surjectivity and the sheaf quotient universal property. It therefore
uses the concrete common conditions instead of a second relation carrier.

Acceptance has three parts. The full effective relation on two copies of B
gives B with its fold map. The free C2 translation action on its split torsor
gives the same B. For a nonfree sign action on the affine line over a
characteristic-zero field, the invariant map x↦x² fails to give the fppf
orbit quotient: over dual numbers, x=0 and x=ε have identical square but
cannot become translates of one another after a faithfully flat extension.
The nonzero ε remains nonzero under such an extension. This comparison is
therefore not asserted for that action. Geometric orbit information and
affine-target universality of an invariant-ring spectrum do not supply the
kernel-pair and covering hypotheses used above.

## Coherent and structured descent

### Coherent presentation descent — node coherent-presentation-descent

`coherentPresentationDescent` assumes X locally Noetherian, a scheme étale
surjective atlas U→X and R=U×_X U. It gives an exact equivalence between
coherent modules on X and coherent modules M on U equipped with a transition
t* M≅s* M obeying diagonal normalization and the triple-overlap cocycle.
Arrows are all module maps commuting with that transition, including zero and
noninvertible maps.

Import SF.1's quasi-coherent presentation equivalence and the accepted
predecessor's space-fpqc-quasicoherent-descent and
finite-presentation-module-descent nodes. On locally Noetherian spaces,
coherence is equivalent to quasi-coherent finite presentation; restrict the
existing equivalence to those objects. Étale pullback is exact, and coherent
modules form an abelian category, so kernels and cokernels are preserved.
The rank-one restriction imports finite-locally-free-descent and yields
invertible-module descent in the common carrier.

A common refinement compares presentations. Full faithfulness fixes its
comparison and the triple-refinement equation. Base change to a locally
Noetherian space preserves the statement. For a non-Noetherian target,
finite presentation is the invariant statement; the word coherent is not
silently carried to that larger class. The sources are Stacks,
*Descent and Algebraic Spaces*, Proposition 4.1 (04W8), pp.3–4 and
Lemmas 6.2–6.4 (060V–060X), pp.5–6, and *Cohomology of Algebraic Spaces*,
Lemmas 12.2–12.3 (07UB, 07UC), p.19.

Acceptance checks the identity atlas, its refinement by two identical copies,
and a noninvertible module map such as multiplication by a parameter on a
Noetherian affine chart. This last test rejects a descent equivalence only for
isomorphisms. On a scheme the result must agree with the Zariski module carrier.
The full small-étale-space signature still needs SF.1's site and module
implementation and is explicitly recorded in the suggested-file comments.

Proper GAGA is owned by downstream ComplexComparisonPartII C3. This theorem
is its algebraic descent input, not a plan of GAGA and not a dependency on
that higher tier. R09.2 retains proper modifications, Chow arguments and
coherent dévissage.

### Polarized object comparison — node polarized-descent-comparison

`polarizedDescentComparison` takes an fppf cover S′→S of schemes, a proper
finitely presented Y′/S′ and a relatively ample invertible sheaf L′. Its data
include an object isomorphism over the double overlap and a specified
compatible lift to the two pullbacks of L′. Both have identity and triple
cocycles. These are two pieces of descent data. Invariance of a Picard class
does not provide the lifted line-bundle cocycle.

The requested common SF.1 extension supplies descent of this pair. Its
underlying algebraic space and invertible module descend separately, and
fpqc locality of relative ampleness recovers a scheme over S. Properness and
finite presentation descend independently. The projectivity conclusion uses
the supplier's local-on-base convention for a proper relatively polarized
scheme; a global projective-space embedding is not asserted without its
additional hypotheses.

On MC0E's relative curve domain, and on SR Layer 2's étale polarized scheme
domain, compare the two descended pairs by the unique isomorphism with the
specified local identity. It preserves the lift of the polarization, all
polarized morphisms and compatible sections. After refinement or arbitrary
base change the same local identity determines the comparison, proving unit
and composition coherence. This compatibility is the new R09.3 target; the
existing effective descent constructions retain their owners.

The missing general fppf theorem is requested from SF.1. Its
finite-locally-free-cover quasi-projective descent node has a narrower
cover class. The source route is Stacks, *Descent and Algebraic Spaces*,
Lemma 13.1 (0D3C), pp.21–22. That proof descends the graded section algebra
and identifies the space with an open subscheme of its relative Proj.
Lemma 23.1 (0ADT), pp.35–36, first identifies the datum with a sheaf;
SF.1's separate algebraicity theorem supplies effectivity. MC0E and SR Layer 2
are the existing special-case sources.

Acceptance checks the identity cover and a split two-sheet cover. Changing a
transition isomorphism by a unit can change the descended bundle, so the
comparison must retain the specified lift rather than an invariant class.
Descent of a line bundle alone cannot construct Y. The full polarized-pair
signature requires the common relative-ampleness and pair interfaces and is
recorded explicitly as a suggested-file signature gap.

### Finite moduli data — node finite-moduli-descent-comparison

`finiteModuliDescentComparison` begins with a finite locally free group G′
over an fppf base cover and a descent cocycle by group isomorphisms. It permits
a compatible finite locally free closed subgroup, a compatible torsor, and
finite lists of sections and structure morphisms satisfying specified
equations. MC0E supplies their simultaneous effective descent.

View those descended schemes through SF.1's fully faithful scheme embedding.
Full faithfulness of space and module descent gives the unique comparison
with the common construction. Preserve multiplication, identity, inverse,
the subgroup immersion, the torsor action, every section and every specified
equation. Each equation is checked after the cover and reflected globally by
faithfulness. Forgetting some data and arbitrary base change commute with the
comparison because they preserve its specified local identity.

The source is MC0E, with Stacks fpqc module descent (04W8), pp.3–4,
finite local freeness (060X), p.6, and the descent-data/sheaf comparison
(0ADT), pp.35–36. Acceptance includes the trivial group, identity subgroup,
trivial torsor and a split-cover example with nontrivial marked sections.
An incompatible local section must not be descended. The actual subgroup
immersion and its maps must survive; an underlying finite scheme comparison
alone is insufficient.

This is a compatibility theorem, not another finite-group construction or
parameter space for levels. It introduces no abelian dual or polarizing
isogeny; those interfaces belong to their abelian-scheme and moduli owners.
Its concrete supplier specialization is recorded as a third signature gap.

## Dependencies, planets and acceptance

The prerequisites form three lanes:

| Lane | Inputs and result |
| --- | --- |
| Finite-source restriction | Native relative representability + SF.1 spaces/products + requested étale-space tools + RG2.0a affine algebra → relative-Hom algebraicity → identity fibre → space restriction and base change. |
| Existing finite constructions | MC0F/RG2.0a restriction and MC0C effective relation quotient + SF.1 sheaf universal properties → canonical scheme/space comparisons. |
| Moduli descent | SF.1 space/module descent + inherited module adapters and finite presentation + MC0E and SR special cases + requested general polarized descent → coherent descent and structured compatibility. |

There is no edge from these targets back to SF.1's space carrier or to RG2.0a's
affine construction. The general space supplier's prerequisites do not include
R09.3. The exact SF.1 request for finite-part/open-isomorphism tools and the
request for general fppf polarized-object descent must be implemented on that
same common foundation without a reverse dependency on the restriction
algebraicity theorem.

The six planets are **Relative morphisms**, **Étale spaces of sections**,
**Algebraicity of relative morphisms**, **Weil restriction**, **Base change of
Weil restriction**, and **Algebraic-space Weil restriction**. Comparison and
bookkeeping nodes remain readable targets but are not additional planets.

The request records import these existing supplier stages unchanged:

- `tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors`:
  effective relation quotient, fppf projection and kernel pair.
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`:
  full finite-object and polarized relative curve descent and its coherence.
- `tauceti:TauCetiRoadmap/ModularCurves#0f-hom-schemes-and-closed-loci`:
  affine finitely presented restriction, universal evaluation and base change.
- `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`:
  étale polarized scheme descent and its relative Proj/ampleness interfaces.

Two additional requests to `SchemeAndStackFoundations:SF.1` specify outputs
without an exact existing node: the finite-part/open-isomorphism tools used
by 05XR, and fppf descent of proper finitely presented polarized schemes with
all maps, sections and coherence. Their precise statements and consuming
nodes are in the packet. These requests are mathematical interfaces, not
implementation tickets.

R09.3 is **planned**, not closed. The four refinement groups are:

1. The finite-part and open-isomorphism supplier interfaces.
2. The general fppf polarized-object supplier interface.
3. The inherited module adapter proofs and their reconciliation with the
   common SF.1 and current AlgebraicVectorBundles interfaces.
4. Three concrete suggested signatures: coherent presentation descent,
   polarized-pair comparison and finite-moduli-data comparison.

The Lean file directly states the remaining native targets, including the
common sheaf/diagonal/atlas conditions and the actual evaluation and quotient
universal properties. All definition APIs and tests are present. A successful
elaboration checks those signatures; it certifies neither the proofs nor the
three supplier-dependent signatures described in comments. Independent review
must check that those comments, gaps and supplier requests remain visible.

Acceptance of this plan requires a single space/module carrier throughout,
no repeated affine restriction or finite descent construction, the seven
definition tests and the concrete comparison instances above, all maps in
coherent descent, correct hypotheses at every base change and preservation of
the actual local identities. Completing implementation requires discharging
the supplier requests and inherited adapter proofs as well as the new targets.

## Sources and reading corrections

The principal freely readable sources are the Stacks Project chapters
[Criteria for Representability](https://stacks.math.columbia.edu/download/criteria.pdf),
[More on Morphisms](https://stacks.math.columbia.edu/download/more-morphisms.pdf),
[Algebraic Spaces](https://stacks.math.columbia.edu/download/spaces.pdf),
[Groupoid Schemes](https://stacks.math.columbia.edu/download/groupoids.pdf),
[Descent and Algebraic Spaces](https://stacks.math.columbia.edu/download/spaces-descent.pdf),
[Cohomology of Algebraic Spaces](https://stacks.math.columbia.edu/download/spaces-cohomology.pdf),
[More on Groupoids in Spaces](https://stacks.math.columbia.edu/download/spaces-more-groupoids.pdf)
and [More on Morphisms of Spaces](https://stacks.math.columbia.edu/download/spaces-more-morphisms.pdf).
The packet records the retrieved chapter hashes and the exact sections read;
page numbers throughout are printed chapter-local pages. Stable tags identify
the same results when the website's global chapter numbering differs.

Three source slips relevant to the section-space proof are recorded in
`sourceIssues` in authored descriptions. In 05XQ, p.12, the composite W→U
must follow W→Z by Z→U. In 05XR, pp.13–14, the separatedness argument uses
W′→W and W′→Z, not separatedness of the arbitrary W→Z. Its reference to
the finite locally free base map uses Z→U, not an undefined B. The current
web pages and their comments retain these slips; the mathematical statements
are used with these corrections. No source passage is reproduced here.

The current ModularCurves, StableReduction and AlgebraicVectorBundles roadmaps
are read as existing contracts, not as new plans. StableReduction and
AlgebraicVectorBundles were read in full. Their current upstream checkout is
`3b51bbf9a925f23bca922570bea8d641b6ec712d`. R09.1 remains responsible for
importing MC0G Grassmannians and SR relative Proj/ampleness, as confirmed
finding /12 requires; this issue changes none of its deliverables.
