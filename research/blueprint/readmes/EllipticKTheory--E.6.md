# Elliptic K-theory, E.6: minimal regular arithmetic models

An elliptic curve over a number field has a minimal regular proper model over its
S-integers, unique with its chosen generic-fibre identification. This model gives
a canonical place to evaluate the integral part of its K-theory. The image in the
generic curve’s K-theory is already independent of the regular proper model; the
minimal-model theorem supplies the canonical geometric representative of that
image.

This part develops the passage from DVR models to arithmetic models over
O_{F,S}. The parent packet’s seven E.6 declarations supply the regular-model and
K-theoretic targets. The additional declarations below concern arithmetic
minimality, existence, the terminal mapping property, uniqueness, and restriction
when primes are inverted. Surface blowups, contraction of exceptional curves and
minimal models over a single DVR are imported from Tau Ceti’s StableReduction
roadmap. These declarations are specifications for a library: none is an
implementation claim.

## The inherited layer and its boundaries

The following node IDs in the parent packet are imports, with their existing
statements and prerequisite chains. They are not duplicated in this packet.

| Parent node ID | Interface supplied |
| --- | --- |
| `EllipticKTheory:E.6/the-regular-proper-model` | A regular proper flat O_{F,S}-scheme with a fixed generic-fibre isomorphism to E; fibre components, multiplicities and the local uniformizer divisor; the precise Weierstrass and Néron comparisons. |
| `EllipticKTheory:E.6/existence-of-a-regular-proper-model` | An arithmetic regular proper model, constructed by resolution of a projective integral model. |
| `EllipticKTheory:E.6/the-integral-part` | The rational image of K₂ of the model in K₂(E), its S-integral variant and the inclusion on inverting primes. |
| `EllipticKTheory:E.6/regular-models-linked-by-blowups` | A common regular arithmetic model dominating two models by finite sequences of closed-point blowups. |
| `EllipticKTheory:E.6/model-independence` | Equality of the images in Kₙ(E) for regular proper models, using pullback, proper G-theory pushforward, regular K/G comparison and flat generic-fibre base change. |
| `EllipticKTheory:E.6/good-reduction-primes-impose-no-condition` | Removing a good-reduction fibre imposes no condition on the rational image, since the relevant finite-field K₁ group is finite. |
| `EllipticKTheory:E.6/vertical-residues` | The rational membership criterion in terms of vertical tame symbols, with the codimension-two torsion obstruction accounted for. |

In particular, there is no new blowup formula for K-theory in this part. General
scheme K-theory, localization and pushforwards remain with
SchemeKTheoryOperations. The accepted parent proof of model independence already
works with any regular proper model; it does not need the minimal-model theorem.
The regulator consumers `EllipticRegulators:ER.6` and `ER.7` receive the same
rational integral part with a canonical choice of model. The atlas’s edge from
`SchemeKTheoryOperations:S.7` into E.6 does not introduce a Riemann–Roch argument
into the minimal-model proof: the parent’s listed inputs determine the
K-theoretic comparison.

## Conventions and the model-morphism API

Fix a number field F, a finite set S of finite places, O = O_{F,S}, and the
elliptic curve E/F of `EllipticKTheory:E.1/geometric-properties-of-the-curve`.
Thus E is a smooth proper geometrically integral curve of genus one. The base
Spec O is an excellent Noetherian Dedekind scheme. Its closed points are the
finite primes outside S. For a closed point v, write O_(v) for the localization,
a DVR with fraction field F, and k(v) for its residue field. Localizations here
are not completions or strict henselizations.

A regular proper model M is the parent object: a scheme M with proper flat
structure map p_M to Spec O, regular local rings at every point, and a specified
isomorphism of its generic fibre with E. Write i_M : E → M for the resulting
projection. Regularity concerns the total arithmetic surface. Its special
fibres can be singular, reducible or nonreduced. Properness is essential: a
smooth Néron model at a bad prime is not a replacement for this object. A
singular Weierstrass model is not a regular model merely because its equation
is minimal.

A model morphism f : M → N is a scheme morphism with
p_N ∘ f = p_M and f ∘ i_M = i_N. It induces the identity on the fixed generic
curve. Forgetting this marking loses the uniqueness assertion: elliptic
involutions and translations can be nontrivial automorphisms of underlying
models. Conversely the marking does not choose a minimal Weierstrass equation
or a global invariant differential.

The node `EllipticKTheory:E.6/minimal-arithmetic-model` defines M to be minimal
when every outgoing model morphism M → N to a regular proper model is an
isomorphism. This is the outgoing domination condition of Conrad’s Definition
3.8, applied to the arithmetic base. It is a relative-minimality condition; its
equivalence with an incoming terminal property is a theorem using positive
genus. The local condition is the existing StableReduction predicate: M_(v)
contains no exceptional curve of the first kind. Such a curve is an effective
Cartier divisor isomorphic to a projective line over its field of constants
whose normal sheaf is O(−1). Bare rationality of a component is insufficient.

The definition exports the following API, derived from the comparisons and
mapping property in this layer.

| Declaration | Contract |
| --- | --- |
| `RegularProperModel.Hom` | Constructor from a scheme map and the over-base and identity-generic-fibre equalities. |
| `RegularProperModel.Hom.hom` | Underlying scheme map, with those two compatibility equalities. |
| `RegularProperModel.Hom.id` | Identity marked model morphism. |
| `RegularProperModel.Hom.comp` | Composition with the underlying composite; identity and associativity inherit the scheme-category laws. |
| `RegularProperModel.category` | Category structure with the stated identity/composition maps and the scheme-category laws. |
| `RegularProperModel.Hom.ext` | Equality of underlying scheme maps implies equality of model morphisms. |
| `RegularProperModel.Hom.subsingleton` | At most one marked model morphism between any fixed pair of regular proper models. |
| `RegularProperModel.isMinimal_iff` | The outgoing-isomorphism characterization of the minimality predicate. |
| `RegularProperModel.IsMinimal.of_iso` | Transport of minimality along an identity-marked model isomorphism. |
| `RegularProperModel.toLocalModel` | Localization at v followed by forgetting properness and regularity to the actual pinned TauCeti.Model over O_(v). |
| `RegularProperModel.toLocalModel_totalIso` | The canonical comparison of its total scheme with M ×_O O_(v), over the local base and with the inherited generic marking. |

The local forgetful API uses `TauCeti.Model` rather than inventing another DVR
carrier. That baseline object already records flatness, finite presentation and
the generic-fibre isomorphism, and its morphisms respect that isomorphism. The
properness and regularity of M_(v) are separate properties of the imported
arithmetic model. Properness supplies finite type, and over the Noetherian local
base this is finite presentation. The local morphism comparison is precisely
with `TauCeti.Model.Hom`, not with arbitrary unmarked scheme maps.

For the subsingleton result, a regular scheme is reduced. Flatness over the
integral Dedekind base makes the generic fibre dense in every affine open of M.
The target is separated over O because it is proper. Apply the pinned Mathlib
result `AlgebraicGeometry.ext_of_isDominant_of_isSeparated` to i_M and to the
common structure map p_N. This is already a library equality theorem, so E.6
only applies it to its marked morphisms. It does not plan the general theorem
again. The arithmetic generic fibre need not be an open subscheme of the
arithmetic model; dominance is the condition needed here.

## Existence by finitely many contractions

`EllipticKTheory:E.6/exists-locally-minimal-arithmetic-model` states that E has a
projective regular proper flat O-model M for which every M_(v) is relatively
minimal. The output is obtained by finitely many vertical exceptional-curve
contractions, preserving the generic marking at every step.

Start with the parent existence construction. Its projective closure, finite
normalization and projective resolution morphisms provide a projective regular
model X. This is stronger data from that construction than a bare existential
assertion of properness. It requires no global minimal Weierstrass equation:
clearing denominators and taking projective closure is enough. Resolution over
the excellent arithmetic base is the parent’s target, not an additional local
resolution theorem in this part.

The nonsmooth locus of the proper finite-presentation morphism X → Spec O is
closed in X. Its image is closed by properness and misses the generic point,
since E is smooth. A proper closed subset of this Dedekind base is a finite set
B of closed points. The union of the irreducible components of the fibres over
B is finite, because each fibre is Noetherian. At a smooth fibre its components
are disjoint; locally a component is the whole uniformizer divisor, whose
normal sheaf is trivial. It cannot have normal sheaf O(−1). Thus every vertical
exceptional curve occurs over B.

An exceptional component in X_(v) gives the same closed curve on X. The local
rings along the fibre, and the normal sheaf of that curve, do not change on
localizing the base at v. This justifies applying the surface contraction
result globally, rather than trying to glue infinitely many independently
chosen local minimal models. Import the projective contraction theorem in
Stacks 54.16.9(1), tag 0C2N, through StableReduction layer 4. It applies to a
vertical exceptional curve on a scheme projective over a Noetherian base. The
target X′ remains projective. The contracted point has regular local ring of
dimension two, and away from that point the contraction is an isomorphism.
Consequently X′ is regular and integral, its generic fibre is still the marked
E, and it is flat over O: its local rings are torsion-free O-modules, which are
flat over a Dedekind domain by the pinned
`IsDedekindDomain.flat_iff_torsion_eq_bot`.

The number of irreducible components over B falls by exactly one. Contractions
leave all other fibres unchanged, so B can remain the fixed finite set used by
the termination measure. Repeating terminates, even when the contraction
creates a new exceptional component among those remaining. The resulting
model has no exceptional curve in any localization and therefore is locally
relatively minimal by StableReduction layer 5. This is the arithmetic version
of the component-count proof in Stacks 55.8.5; the general surface contraction
and the local criterion remain imports.

## From the local mapping property to the arithmetic one

`EllipticKTheory:E.6/locally-minimal-terminal-model` states that a locally
relatively minimal M is terminal among regular proper O-models of this marked
elliptic curve: for every X there is exactly one model morphism X → M. The
source is allowed to have singular fibres and to be a nonminimal blowup. The
statement uses E’s positive genus; it does not assert terminality for genus-zero
minimal models.

Use the parent common-resolution node to choose Z with marked maps to both X
and M, where Z → X is a finite sequence of blowups at closed points. The
arithmetic models are integral regular surfaces, so the hypotheses of the
parent’s global common-resolution result apply. Every blowup centre lies over a
closed base point because the structure morphism is proper.

For the last blowup Z = X_n → X_{n−1}, let D be its exceptional curve and v its
base point. The localized M_(v) is a minimal regular proper model. The imported
DVR mapping theorem, Stacks 55.10.2, provides a marked map
X_{n−1,(v)} → M_(v). The composite with the localized blowup is the same map as
the localization of Z → M, by uniqueness of local marked model morphisms.
Hence Z → M maps D to a point. Notice that this supplies a global geometric
fact about D; it is not an assertion that a morphism over an inverse limit
already exists over an arbitrary open neighbourhood.

The contraction universal property in Stacks 54.16.1, tag 0C5J, now factors
Z → M through the global blowdown X_n → X_{n−1}. The factorization remains over
O and identity-marked: the blowdown is surjective and is an isomorphism on the
generic fibre. Repeat the argument through the finite sequence. This constructs
X → M. Its uniqueness is the reduced-source/dominant-generic-fibre/separated-
target argument described in the API, using the existing Mathlib theorem.

Terminality also gives outgoing minimality. For any model morphism f : M → N,
terminality gives g : N → M. Both composites are identity-marked endomorphisms,
so morphism uniqueness identifies them with the identities. Thus f is an
isomorphism. The distinction between outgoing minimality and incoming
terminality is resolved by a proof, rather than incorporated into a definition
that assumes the desired theorem.

## The criterion and uniqueness theorem

`EllipticKTheory:E.6/minimality-local-criterion` proves three equivalent
conditions for a regular proper arithmetic model M of E:

1. Every outgoing model morphism from M is an isomorphism.
2. Every M_(v) contains no exceptional curve of the first kind.
3. Every regular proper model X has exactly one marked model morphism to M.

The preceding theorem gives (2) ⇒ (3) ⇒ (1). For (1) ⇒ (2), choose the locally
minimal L constructed by the existence theorem. Its terminality gives M → L;
condition (1) makes this map an isomorphism. Localizing transports the
no-exceptional-curves condition of L_(v) to M_(v). This also proves existence of
a minimal model in the outgoing formulation. No separate arithmetic
local-to-global gluing theorem is concealed in the equivalence.

`EllipticKTheory:E.6/unique-minimal-arithmetic-model` is the resulting precise
uniqueness statement. For minimal M and N there is a unique O-isomorphism
M ≅ N inducing the identity on the fixed E. The two terminal model morphisms
are inverse, because their composites agree with the identities on E and
marked morphisms are unique. Any other marked isomorphism is the same
underlying model morphism. After localizing at any v, this isomorphism agrees
with the unique identity-marked DVR minimal-model isomorphism.

Different projective closures, resolutions and contraction orders therefore
produce canonically isomorphic marked models. An underlying elliptic
involution does not contradict this theorem: for the equation y² + y = x³ − x,
the involution (x,y) ↦ (x,−y−1) is nontrivial on E, so it is not identity-marked.
The genus-zero counterexample of Stacks 55.10.3 or Conrad Example 3.9 confirms
why positive genus is required. Two copies of the projective line over a DVR,
marked by the identity and by the generic automorphism represented by
diag(π,1), need not be isomorphic as marked models. Outgoing relative minimality
alone does not establish their terminality.

## Restriction and the integral part

`EllipticKTheory:E.6/minimal-model-localisation` concerns S ⊆ S′ in the same
number field. The base map Spec O_{F,S′} → Spec O_{F,S} is an open immersion,
using `ArithmeticKTheory:N.1/S-integers-as-a-localisation`. The base change of a
minimal M is regular, proper and flat with the same marked generic fibre. At
every retained prime its local DVR and localized model are unchanged. The
local criterion proves this restricted model is minimal, and uniqueness
identifies it canonically with any independently constructed minimal model
over O_{F,S′}.

For S ⊆ S′ ⊆ S″, the iterated and direct restrictions have the canonical
iterated-pullback identification. The comparison isomorphisms compose to the
direct comparison, since both maps induce the identity on E. For S = S′ the
comparison is the identity. This is a coherence statement for inversion of
primes. Arbitrary ramified extension of DVRs is a different operation: its base
change can change regularity and introduce new exceptional curves. That
operation is not covered by this theorem.

On the chosen minimal M the integral part remains the parent’s exact image

K₂(E)_{O,ℚ} = image(K₂(M) ⊗ ℚ → K₂(E) ⊗ ℚ).

Regular-model independence says that this is the same image computed on any
regular proper model. Restriction on inverting primes gives the parent
inclusion K₂(E)_{O,ℚ} ⊆ K₂(E)_{O′,ℚ}, and the uniqueness theorem ensures that
choosing an independent minimal model over O′ does not change the image. Full
O_F-integrality and S-integrality remain distinct. The finite-field and
vertical-residue statements are exactly the imported parent nodes; neither
finite-dimensionality nor a lattice in rational K₂ is inferred from the word
“integral”.

## Tests that distinguish the definition

The three tests belong to `minimal-arithmetic-model`. Their geometry checks the
definition independently of the formal shape of its universal property.

- `smooth_37a1_minimal`: the projective equation y²z + yz² = x³ − xz² over
  ℤ[1/37] is smooth proper with discriminant 37 a unit. Its localized fibres
  have no exceptional component, so it is minimal. This excludes a predicate
  that fails on an already smooth model.
- `nodal_37a1_minimal`: the same equation over ℤ is regular and minimal, despite
  its nodal fibre at 37. At (5,18), f = y² + y − x³ + x equals 222 = 6·37;
  the two first derivatives are 37 and −74. The equation is therefore not in
  (37,x−5,y−18)², proving total-space regularity there. Its valuation-one
  discriminant and irreducible I₁ fibre give the local minimal-model test.
  This excludes a definition requiring every fibre to be smooth.
- `point_blowup_not_minimal`: blow up the rational point (0,0) in the fibre at 2
  of the smooth model over ℤ[1/37]. The blowup remains a regular proper flat
  model of the same E, but its outgoing blowdown has exceptional fibre
  ℙ¹_{𝔽₂} and is not an isomorphism. Thus it is not minimal. This excludes a
  predicate that merely asks for a regular total scheme.

Inverting 37 takes the second test to the first. Inverting 2 removes the entire
fibre containing the exceptional curve of the third test, so a nonminimal model
can become minimal on restriction. The existence theorem takes zero steps on
the first model and at least one step on its point blowup. The terminal map
from the point blowup to the first model is its blowdown. These checks also
verify the direction of the universal mapping property.

## Sources, dependencies and suggested signatures

The local input is [Conrad’s *Minimal models for elliptic curves*](https://math.stanford.edu/~conrad/papers/minimalmodel.pdf),
§3, especially Definitions 3.1 and 3.8, Example 3.9, Theorem 3.10 and Remark
3.11. The surface argument uses the Stacks Project’s
[contraction theorem](https://stacks.math.columbia.edu/tag/0C2N),
[contraction universal property](https://stacks.math.columbia.edu/tag/0C5J), and
[common-resolution theorem](https://stacks.math.columbia.edu/tag/0C5S).
The DVR minimality, existence and mapping results are
[55.8.4](https://stacks.math.columbia.edu/tag/0C2V),
[55.8.5](https://stacks.math.columbia.edu/tag/0CD9),
[55.10.1](https://stacks.math.columbia.edu/tag/0C6B) and
[55.10.2](https://stacks.math.columbia.edu/tag/0C9Z). The packet records the exact
PDF versions, hashes, read sections and matches. The arithmetic adaptation is
spelled out above rather than attributed to a local theorem as if that theorem
already had a general Dedekind base.

Two import contracts with StableReduction are explicit. Layer 4 supplies the
curve-on-surface contraction in its projective Noetherian-base form and the
universal factorization through a blowdown. Layer 5 supplies the local
no-exceptional criterion, positive-genus terminality and marked uniqueness.
The first contract belongs to the existing general surface contraction target;
the second is precisely the existing local model target. The new results here
are their arithmetic applications. The seven parent imports keep their own
K-theoretic and arithmetic prerequisites. No existing upstream roadmap is
rewritten.

Two source slips are recorded in `sourceIssues`: Stacks 55.10.2’s first proof
sentence reverses the map from the arbitrary model to the minimal model, and
54.16.9(2) places an image open subscheme in the source compactification instead
of the contracted target compactification. The corrected directions are used
throughout. Neither changes a theorem statement.

The suggested file imports individual Mathlib and Tau Ceti modules. It repeats
the exact unimplemented parent arithmetic-model interface only as prerequisite
scaffolding, then gives the new marked-morphism/minimality API and the parts of
the tests expressible with current types. The full geometric test instances and
theorems needing the elliptic scheme, coherent genus and local minimality
interfaces are identified by name in comments. They are not replaced by empty
predicates or assumed conclusions. Their definitive statements are the packet
and this document. The handoff records the precise extent of signature checking.

The packet’s pass is complete and E.6 is planned: its original targets have the
seven parent imports and its arithmetic uniqueness target has the six new
nodes. There are no new mathematical gaps or remaining refinements in this
scope. The stage is not closed because the supplier stages and inherited
K-theoretic interfaces are plans. Assembly combines these nodes with the parent
layer; implementation and independent review retain their separate roles.
