/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/DiamondsAndVStacks.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

BP-DiamondsAndVStacks: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No Lean toolchain at those commits was available in this session, so elaboration
has not been established and the file was not compiled.

This roadmap has NO reviewed library audit and no integrated decomposition, so the
boundary with the pinned libraries was drawn by reading the declaration index and
the Lean sources directly. What is already there is imported below and is never
redefined:

* Mathlib `SpectralSpace`, `IsSpectralMap`, `WithConstructibleTopology` with
  `compactSpace_withConstructibleTopology`, `Topology.IsConstructible`,
  `IsRetrocompact`, `GeneralizingMap`, `StableUnderGeneralization` and the
  `SpectralSpace` instance on `PrimeSpectrum`. D0 prototypes only what is missing:
  locally spectral spaces, the relative spectral-map condition, profiniteness of
  the constructible topology, the quotient criteria, the pro-category and Hochster
  realization.
* Mathlib `CategoryTheory.Pseudofunctor.DescentData`, `IsPrestack`, `IsStack`,
  `toDescentData` and `sheafHom`. That is ECD Definition 9.1 and the stack
  condition, so only stackification, 2-fibre products and groupoid quotients are
  prototyped.
* Mathlib `CategoryTheory.Sheaf.cohomologyPresheaf`, `sheafIsAbelian`,
  `presheafToSheaf`, `GrothendieckTopology.Subcanonical` and
  `AlgebraicGeometry.Scheme.qcPrecoverage`, whose covering condition is literally
  the one of ECD Definition 8.1. Derived global sections are therefore imported,
  and only the Cech-to-derived, Leray and acyclic-basis comparisons are prototyped.
* Tau Ceti `TauCeti.Huber.Pair`, `TauCeti.ValuationSpectrum.spa`, its patch
  topology and `spectralSpace_spa_of_pairOfDefinition`. This is the anchor RS-05
  names as the supplier of D0's spectral foundations.

Perfectoid spaces themselves, pro-etale morphisms of perfectoid spaces and the
kappa-small calculus belong to PerfectoidSpaces:P0-P6 and analytic adic spaces to
AdicEtaleGeometry; they are requested, not prototyped here. Where a statement
quantifies over them the prototype uses `True` as a placeholder, in the style of
the other suggested files of this programme.
-/
import Mathlib.Algebra.Homology.SpectralObject.Basic
import Mathlib.Algebra.Homology.SpectralSequence.Basic
import Mathlib.AlgebraicGeometry.Sites.Proetale
import Mathlib.AlgebraicGeometry.Sites.QuasiCompact
import Mathlib.CategoryTheory.Abelian.GrothendieckCategory.Basic
import Mathlib.CategoryTheory.Bicategory.Basic
import Mathlib.CategoryTheory.Bicategory.Functor.Pseudofunctor
import Mathlib.CategoryTheory.Category.Cat.Limit
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.CategoryTheory.EffectiveEpi.Basic
import Mathlib.CategoryTheory.Filtered.Basic
import Mathlib.CategoryTheory.Functor.FullyFaithful
import Mathlib.CategoryTheory.Groupoid
import Mathlib.CategoryTheory.Limits.Filtered
import Mathlib.CategoryTheory.Limits.HasLimits
import Mathlib.CategoryTheory.Limits.Indization.Category
import Mathlib.CategoryTheory.MorphismProperty.Basic
import Mathlib.CategoryTheory.Preadditive.Injective.Basic
import Mathlib.CategoryTheory.Sites.Abelian
import Mathlib.CategoryTheory.Sites.Canonical
import Mathlib.CategoryTheory.Sites.Coherent.Basic
import Mathlib.CategoryTheory.Sites.Continuous
import Mathlib.CategoryTheory.Sites.Descent.DescentData
import Mathlib.CategoryTheory.Sites.Descent.IsPrestack
import Mathlib.CategoryTheory.Sites.Descent.IsStack
import Mathlib.CategoryTheory.Sites.Grothendieck
import Mathlib.CategoryTheory.Sites.Precoverage
import Mathlib.CategoryTheory.Sites.Pretopology
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Sites.SheafCohomology.Basic
import Mathlib.CategoryTheory.Sites.SheafCohomology.Cech
import Mathlib.CategoryTheory.Sites.Sheafification
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Flat.FaithfullyFlat.Algebra
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.Spectrum.Prime.Defs
import Mathlib.RingTheory.Spectrum.Prime.RingHom
import Mathlib.RingTheory.Spectrum.Prime.Topology
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.RingTheory.WittVector.Defs
import Mathlib.SetTheory.Cardinal.Aleph
import Mathlib.SetTheory.Cardinal.Defs
import Mathlib.SetTheory.Cardinal.Order
import Mathlib.SetTheory.Ordinal.Basic
import Mathlib.Topology.Algebra.Category.ProfiniteGrp.Basic
import Mathlib.Topology.Bases
import Mathlib.Topology.Category.CompHaus.Basic
import Mathlib.Topology.Category.CompHaus.Projective
import Mathlib.Topology.Category.Profinite.AsLimit
import Mathlib.Topology.Category.Profinite.Basic
import Mathlib.Topology.Category.Stonean.Adjunctions
import Mathlib.Topology.Category.Stonean.Basic
import Mathlib.Topology.Compactification.StoneCech
import Mathlib.Topology.Compactness.Compact
import Mathlib.Topology.Connected.Clopen
import Mathlib.Topology.Connected.TotallyDisconnected
import Mathlib.Topology.Constructible
import Mathlib.Topology.ContinuousMap.Defs
import Mathlib.Topology.Defs.Basic
import Mathlib.Topology.Defs.Induced
import Mathlib.Topology.Inseparable
import Mathlib.Topology.QuasiSeparated
import Mathlib.Topology.Separation.Basic
import Mathlib.Topology.Spectral.Basic
import Mathlib.Topology.Spectral.ConstructibleTopology
import Mathlib.Topology.Spectral.Hom
import Mathlib.Topology.UniformSpace.Completion
import TauCeti.AlgebraicGeometry.AdicSpace.Cont.Spectral
import TauCeti.AlgebraicGeometry.AdicSpace.PatchPresentation
import TauCeti.AlgebraicGeometry.AdicSpace.ResidueField
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Analytic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.HuberPair
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Spectral
import TauCeti.RingTheory.Huber.Pair

noncomputable section

namespace TauCeti.Diamonds

universe u

/-! ## D0 Spectral topology, ordinary sites, and size -/

/-- locally-spectral-space: A spectral space is a quasicompact topological space
with a basis of quasicompact open subsets stable under finite intersection
in which every irreducible closed subset has a unique generic point. A
locally spectral space is a space admitting an open cover by spectral
subspaces. A map f : X -> Y of spectral spaces is spectral if it is
continuous and the preimage of every quasicompact open is quasicompact open;
a map of locally spectral spaces is spectral if for every spectral open U of
X mapping into a spectral open V of Y the restriction U -> V is spectral.
Mathlib's SpectralSpace is exactly the first notion; the locally spectral
notion and the relative spectrality condition for locally spectral spaces
are absent at the pinned commit and are what this node adds. -/
-- The predicate on a topological space: it admits an open cover by subspaces that are spectral.
def IsLocallySpectralSpace : True := by sorry

-- Every spectral space is locally spectral.
theorem IsLocallySpectralSpace.of_spectralSpace : True := by sorry

-- A locally spectral space has a basis of quasicompact opens and is sober and locally quasiseparated.
theorem IsLocallySpectralSpace.isOpen_isCompact_basis : True := by sorry

-- The predicate that a continuous map of locally spectral spaces is spectral, in the sense of ECD 2.1.
def IsSpectralMap.locally : True := by sorry

-- It is enough to check the condition for the members of one cover of the source by spectral opens mapping into spectral opens of the target.
theorem IsSpectralMap.locally_iff_of_cover : True := by sorry

-- For a map of spectral spaces the relative notion agrees with Mathlib's IsSpectralMap.
theorem IsSpectralMap.locally_iff_isSpectralMap : True := by sorry

-- Composites of spectral maps of locally spectral spaces are spectral.
theorem IsSpectralMap.locally_comp : True := by sorry

-- An open subspace of a locally spectral space is locally spectral.
def IsLocallySpectralSpace.isOpen : True := by sorry

example : True := by sorry -- unit test `qcqs_affinoid_is_spectral`: Spa(A, A^+) of a Huber pair with a pair of definition is spectral, hence locally spectral; a definition that does not accept it is wrong.
example : True := by sorry -- unit test `disjoint_union_of_spectral_is_locally_spectral_not_spectral`: An infinite disjoint union of nonempty spectral spaces is locally spectral and not quasicompact, so it is locally spectral but not spectral: the two predicates must not coincide.
example : True := by sorry -- unit test `open_immersion_is_spectral`: The inclusion of a quasicompact open subspace of a spectral space is a spectral map; the inclusion of a non-quasicompact open subspace of a spectral space is continuous but not spectral (a non-example).
example : True := by sorry -- unit test `agrees_with_mathlib_on_spectral_spaces`: For X, Y spectral, IsSpectralMap.locally f is equivalent to IsSpectralMap f.

/-- constructible-topology-profinite: Let X be a spectral space. Recall that T
subset X is constructible if it lies in the boolean algebra generated by the
quasicompact open subsets, and that the constructible topology is generated
by the constructible subsets. Then X with its constructible topology is a
profinite set, that is, compact Hausdorff and totally disconnected; and if X
= lim X_i is an inverse limit of finite T0 spaces along spectral maps then X
with the constructible topology is the inverse limit of the X_i with the
discrete topology. Mathlib has the constructible topology and its
quasicompactness but not its Hausdorffness, total disconnectedness, or the
identification of the limit presentation. -/
theorem ConstructibleTopologyProfinite : True := by sorry

/-- pro-constructible-subsets: Let X be a spectral space. A subset S of X is
pro-constructible, that is, an intersection of constructible subsets, if and
only if S is closed in the constructible topology. If f : X -> Y is a
spectral map of spectral spaces then the image of a pro-constructible subset
of X is pro-constructible in Y. More generally a subset of a locally
spectral space is constructible (respectively pro-constructible) if its
intersection with every spectral open subspace is. -/
theorem ProConstructibleSubsets : True := by sorry

/-- closure-of-pro-constructible: Let X be a spectral space and S a pro-
constructible subset. Then the closure of S in X is exactly the set of
specializations of points of S. In particular a pro-constructible subset
that is stable under specialization is closed, and a pro-constructible
generalizing subset of a spectral space is an intersection of quasicompact
open subsets. -/
theorem ClosureOfProConstructible : True := by sorry

/-- generalizing-surjection-is-quotient: Let f : Y -> X be a surjective,
generalizing spectral map of spectral spaces. Then f is a quotient map. Here
generalizing means that every generalization of a point in the image lifts,
which Mathlib records as GeneralizingMap. Separately, a continuous
surjection from a quasicompact space onto a compact Hausdorff space is a
quotient map. -/
theorem GeneralizingSurjectionIsQuotient : True := by sorry

/-- pro-constructible-equivalence-relation: Let X be a quasiseparated locally
spectral space and R inside X x X a pro-constructible equivalence relation
whose two projections s, t : R -> X are quasicompact and generalizing. Then
the quotient space X/R is T0. Moreover for every quasicompact open W inside
X there is an open R-invariant subset U containing W with U contained in E',
where E' is an R-invariant intersection of a nonempty family of quasicompact
open subsets. -/
theorem ProConstructibleEquivalenceRelation : True := by sorry

/-- spectral-quotient-criterion: Let X be a spectral space and R inside X x X a
pro-constructible equivalence relation whose projections s, t are
generalizing. Assume X/R has a basis for its topology given by open subsets
whose preimages in X are quasicompact. Then X/R is a spectral space and X ->
X/R is a spectral generalizing map. In the situation of the previous node,
if in addition R -> X is open then X/R is locally spectral and
quasiseparated and X -> X/R is an open spectral qcqs map. Neither statement
can be strengthened to 'every quotient of a spectral space by such a
relation is spectral'. -/
theorem SpectralQuotientCriterion : True := by sorry

/-- cofiltered-limits-of-spectral-spaces: Let X_i, i in I, be a cofiltered
inverse system of spectral spaces along spectral maps, with inverse limit X.
Then X is spectral, the maps X -> X_i are spectral, and a map Y -> X from a
spectral space is spectral if and only if all composites Y -> X_i are. If Y
is a spectral space with a spectral map Y -> X such that all composites Y ->
X_i are generalizing then Y -> X is generalizing; if in addition Y -> X is
surjective then it is a quotient map. -/
theorem CofilteredLimitsOfSpectralSpaces : True := by sorry

/-- pro-category-of-finite-t0-spaces: For a category C, the pro-category Pro(C)
has as objects cofiltered diagrams in C and Hom(lim Y_i, lim Z_j) = lim_j
colim_i Hom(Y_i, Z_j). The construction is needed in the generality of a
small category C, with the variant Pro_kappa(C) of pro-systems whose index
category is bounded by a cutoff cardinal kappa. The category of spectral
spaces with spectral maps is equivalent to Pro(finite T0 spaces);
equivalently every spectral space is an inverse limit of finite T0 spaces.
Mathlib has Ind but no Pro at the pinned commit. -/
-- The pro-category of a category C, with objects cofiltered diagrams and the double-limit Hom formula.
def CategoryTheory.Pro : True := by sorry

-- A cofiltered diagram in C determines an object of Pro(C).
def CategoryTheory.Pro.mk : True := by sorry

-- Hom_{Pro C}(lim Y_i, lim Z_j) is naturally lim_j colim_i Hom_C(Y_i, Z_j).
theorem CategoryTheory.Pro.homEquiv : True := by sorry

-- Pro(C) has all cofiltered limits when C has finite limits, and the limit is computed by concatenating index categories.
def CategoryTheory.Pro.hasCofilteredLimits : True := by sorry

-- The natural functor Pro(Pro C) -> Pro C, for an arbitrary category C.
theorem CategoryTheory.Pro.proProEquiv : True := by sorry

-- Pro(C) is equivalent to the opposite of Ind(C^op), compatibly with Mathlib's Ind.
theorem CategoryTheory.Pro.equivProOp : True := by sorry

-- The category of spectral spaces with spectral maps is equivalent to Pro(finite T0 spaces).
theorem SpectralSpace.equivProFiniteTZero : True := by sorry

-- Every spectral space is canonically the inverse limit of its finite T0 spectral quotients.
theorem SpectralSpace.asProLimit : True := by sorry

example : True := by sorry -- unit test `profinite_case`: Pro(finite sets) is equivalent to the category of profinite sets, compatibly with Mathlib's Profinite.asLimit.
example : True := by sorry -- unit test `constant_diagram`: The functor C -> Pro(C) on constant diagrams is fully faithful; for C a one-object category it is an equivalence (the degenerate case).
example : True := by sorry -- unit test `spec_is_spectral`: Under the equivalence, Spec of a ring goes to the system of its finite T0 quotients; a construction that does not reproduce PrimeSpectrum's spectral structure is wrong.
example : True := by sorry -- unit test `hom_is_not_the_naive_limit`: Hom in Pro(C) is lim_j colim_i and not colim_i lim_j: for the system of finite quotients of the profinite set Z_p the two differ (a non-example).

/-- hochster-realization: Let X be a topological space. The following are
equivalent: X is spectral; there is a ring A with X homeomorphic to Spec A;
X can be written as an inverse limit of finite T0 spaces. Mathlib proves
that Spec A is spectral; the two remaining implications, in particular
Hochster's realization of an arbitrary spectral space as a prime spectrum,
are absent at the pinned commit and are what this node plans, with an actual
ring or inverse-system construction and not an unproved representation
axiom. -/
theorem HochsterRealization : True := by sorry

/-- profinite-presentation-of-compact-hausdorff: For a compact Hausdorff space
T, the Stone-Cech compactification of the underlying discrete set of T is a
profinite (indeed extremally disconnected) space S with a continuous
surjection S -> T, and the induced equivalence relation R inside S x S is a
closed subspace, hence profinite. Consequently every compact Hausdorff space
is a quotient of a profinite set by a profinite equivalence relation.
Mathlib has StoneCech, Stonean, the Stonean adjunction and the projective
presentation of a compact Hausdorff object; what this node adds is the
identification of the induced equivalence relation as profinite and the
resulting presentation used in ECD Remark 2.8 and Example 11.12. -/
-- For T compact Hausdorff, a profinite S with a continuous surjection S -> T.
def CompHaus.profinitePresentation : True := by sorry

-- The structure map of the presentation is surjective.
theorem CompHaus.profinitePresentation_surjective : True := by sorry

-- The induced equivalence relation S x_T S is a closed subspace of S x S, hence profinite.
def CompHaus.profinitePresentation_rel : True := by sorry

-- T carries the quotient topology from S, so T is the coequalizer of the two projections of S x_T S in compact Hausdorff spaces.
theorem CompHaus.profinitePresentation_isQuotientMap : True := by sorry

-- The presentation may be taken with S extremally disconnected, agreeing with Mathlib's CompHaus.projectivePresentation.
theorem CompHaus.profinitePresentation_of_stonean : True := by sorry

-- Conversely, the quotient of a profinite set by a closed equivalence relation is compact Hausdorff.
theorem Profinite.quotient_compHaus : True := by sorry

example : True := by sorry -- unit test `interval`: The unit interval admits a profinite presentation; the induced relation is closed and the quotient recovers the interval.
example : True := by sorry -- unit test `profinite_case`: If T is already profinite the identity is a presentation and the relation is the diagonal (the degenerate case).
example : True := by sorry -- unit test `not_every_quotient_is_profinite`: The quotient of a profinite set by a closed equivalence relation is in general only compact Hausdorff and not profinite (a non-example, which is the whole content of Remark 2.8).
example : True := by sorry -- unit test `agrees_with_mathlib_projective_presentation`: The extremally disconnected presentation agrees with CompHaus.projectivePresentation composed with CompHaus.toProfinite.

/-- quasicompact-objects-in-a-topos: Let T be a topos. An object X of T is
quasicompact if every jointly surjective family of maps X_i -> X has a
finite jointly surjective subfamily; X is quasiseparated if for all
quasicompact Y, Z over X the fibre product is quasicompact; a map f : Y -> X
is quasicompact if for all quasicompact Z over X the fibre product Z x_X Y
is quasicompact, and quasiseparated if its diagonal is quasicompact. T is
algebraic if there is a generating full subcategory C of qcqs objects,
stable under fibre products, such that X -> * is quasiseparated for X in C.
These are SGA 4 VI Definitions 1.1, 1.7, 1.13 and 2.3, recalled in ECD
section 8; Mathlib has no such notions at the pinned commit. -/
-- The predicate that an object of a category of sheaves is quasicompact.
def CategoryTheory.Sheaf.IsQuasicompact : True := by sorry

-- The predicate that an object is quasiseparated.
def CategoryTheory.Sheaf.IsQuasiseparated : True := by sorry

-- The predicate that a morphism is quasicompact, defined by pullback along maps from quasicompact objects.
def CategoryTheory.Sheaf.Hom.IsQuasicompact : True := by sorry

-- A morphism is quasiseparated exactly when its diagonal is quasicompact.
theorem CategoryTheory.Sheaf.Hom.isQuasiseparated_iff_diagonal : True := by sorry

-- The predicate that a category of sheaves is algebraic, packaged with the generating subcategory of qcqs objects.
def CategoryTheory.Sheaf.IsAlgebraic : True := by sorry

-- In an algebraic setting the conditions may be checked after pullback to one cover by objects of the generating subcategory (SGA 4 VI Corollaries 1.17, 2.6 and 2.8).
theorem CategoryTheory.Sheaf.isQuasiseparated_iff_of_cover : True := by sorry

-- If X -> * is quasicompact then X is quasicompact; the converse fails.
theorem CategoryTheory.Sheaf.isQuasicompact_of_isQuasicompact_terminal : True := by sorry

-- Quasicompact and quasiseparated morphisms are stable under composition and base change.
theorem CategoryTheory.Sheaf.Hom.isQuasicompact_comp : True := by sorry

example : True := by sorry -- unit test `perfectoid_space`: A perfectoid space is quasicompact, respectively quasiseparated, as a v-sheaf exactly when its underlying topological space is (ECD Proposition 8.3).
example : True := by sorry -- unit test `final_object_not_quasiseparated`: For sheaves on Perfd the final object is not quasiseparated, so 'X quasicompact' and 'X -> * quasicompact' must not be defined by the same predicate (a non-example).
example : True := by sorry -- unit test `finite_coproduct`: A finite coproduct of quasicompact objects is quasicompact, and an infinite coproduct of nonempty objects is not (the degenerate case).
example : True := by sorry -- unit test `agrees_with_topological_qcqs`: For sheaves on a topological space, the notions agree with quasicompactness and quasiseparatedness of the corresponding open set.

/-- cutoff-cardinal: There is a cofinal class of uncountable cardinals kappa
such that: for all cardinals lambda < kappa one has 2^lambda < kappa, so
kappa is a strong limit; for all countable sequences of cardinals less than
kappa the supremum is less than kappa, so the cofinality of kappa is larger
than omega; and for all lambda < kappa there is a strong limit cardinal
kappa_lambda < kappa whose cofinality is larger than lambda. Such kappa are
automatically cofinal among the kappa_lambda for lambda < kappa. -/
theorem CutoffCardinal : True := by sorry

/-- completion-cardinality-bound: Let kappa be an uncountable strong limit
cardinal. Let A be a complete topological abelian group (in the application,
a complete topological ring) whose topology has a countable basis of
neighbourhoods of zero, and suppose A has a dense subgroup A_0 of
cardinality lambda < kappa. Then the cardinality of A is at most
lambda^omega, which is at most 2^lambda, hence less than kappa. This is the
conditional, non-perfectoid form of the counting argument of ECD Remark 4.3,
which the roadmap text for this layer asks to be supplied in conditional
form. -/
theorem CompletionCardinalityBound : True := by sorry

/-- filtered-colimits-and-cohomology-on-coherent-sites: Let (C, J) be a site
with a generating full subcategory of qcqs objects stable under fibre
products, so that the category of sheaves is algebraic. Then for a filtered
diagram of abelian sheaves F_j the colimit is computed sectionwise on qcqs
objects, and for every qcqs object X and every i the natural map colim_j
H^i(X, F_j) -> H^i(X, colim_j F_j) is an isomorphism. The same holds for
sheaves of sets and of groups in degrees 0, respectively 0 and 1. -/
theorem FilteredColimitsAndCohomologyOnCoherentSites : True := by sorry

/-- cech-to-derived-comparison: For a site (C, J), a cover of an object X and an
abelian sheaf F there is a spectral sequence from the Cech cohomology of the
cover with coefficients in the presheaves H^q(F) converging to H^{p+q}(X,
F). For a morphism of sites f there is a Leray spectral sequence H^p(X, R^q
f_* F) converging to H^{p+q}(Y, F). If B is a basis of the site consisting
of objects on which F is acyclic and on which the covers of the site can be
refined by covers by objects of B, then Cech cohomology computed on B agrees
with sheaf cohomology. Mathlib has the Cech complex functor and Ext-
theoretic sheaf cohomology, but none of these three comparisons. -/
theorem CechToDerivedComparison : True := by sorry

/-- stackification: Let (C, J) be a site and F a prestack on C, that is, a
functor from C^op to groupoids, equivalently a pseudofunctor into Cat with
groupoid values. There is a stack F^+ with a map F -> F^+ that is universal
among maps to stacks: composition with it is an equivalence between the
category of maps F^+ -> G and the category of maps F -> G, for every stack
G. Mathlib at the pinned commit has DescentData, IsPrestack, IsStack and the
comparison functor to descent data, but no stackification; this node plans
only the stackification and its universal property and reuses the pinned
descent API for everything else. -/
-- The associated stack of a prestack for a Grothendieck topology.
def CategoryTheory.Functor.stackification : True := by sorry

-- The canonical map from a prestack to its stackification.
def CategoryTheory.Functor.toStackification : True := by sorry

-- The stackification is a stack, in the sense of the pinned IsStack class.
theorem CategoryTheory.Functor.isStack_stackification : True := by sorry

-- For every stack G, composition with the canonical map is an equivalence of categories of morphisms from the stackification to G and from the prestack to G.
theorem CategoryTheory.Functor.stackificationUniversal : True := by sorry

-- The canonical map is locally essentially surjective and locally fully faithful.
theorem CategoryTheory.Functor.stackification_isLocallyBijective : True := by sorry

-- If the prestack is already a stack the canonical map is an equivalence.
theorem CategoryTheory.Functor.stackification_of_isStack : True := by sorry

-- On a discrete prestack coming from a presheaf of sets, stackification is Mathlib's sheafification.
theorem CategoryTheory.Functor.stackification_discrete : True := by sorry

example : True := by sorry -- unit test `sheafification_agreement`: For a prestack with discrete fibres the stackification is the sheafification of the corresponding presheaf of sets.
example : True := by sorry -- unit test `already_a_stack`: If F is a stack the unit is an equivalence (the degenerate case).
example : True := by sorry -- unit test `classifying_stack_has_automorphisms`: For G a sheaf of groups the stackification of the trivial prestack is the classifying stack BG, whose objects have automorphism group G; a construction that returns the sheaf of isomorphism classes instead is wrong (this is the required separation of stack from sheaf).
example : True := by sorry -- unit test `torsor_isomorphism_classes`: For the prestack of G-torsors the sheaf of isomorphism classes of the stackification is the sheafification of the presheaf of isomorphism classes; equality before sheafification is a non-example.

/-- groupoid-quotients-and-two-fibre-products: For maps of stacks G_1 -> G_3 and
G_2 -> G_3 the 2-fibre product is the stack sending X to the groupoid of
triples (a, b, iso) with a in G_1(X), b in G_2(X) and an isomorphism of
their images; it is a stack and has the expected 2-universal property. For a
groupoid object (X, R) in sheaves, with source and target maps s, t : R ->
X, the quotient stack is the stackification of the prestack of X-torsors
under R; it comes with a map X -> [X/R] and an equivalence R = X x_{[X/R]}
X, and its sheaf of isomorphism classes is the sheafification of X/R. The
isomorphism-class sheaf and the quotient stack must be kept apart until the
absence of automorphisms has been proved. -/
-- The 2-fibre product of two maps of stacks over a common target.
def CategoryTheory.Stack.twoFibreProduct : True := by sorry

-- The 2-fibre product of stacks is a stack.
theorem CategoryTheory.Stack.twoFibreProduct_isStack : True := by sorry

-- Its 2-universal property: maps into it are triples consisting of two maps and a 2-isomorphism between their composites.
theorem CategoryTheory.Stack.twoFibreProductUniversal : True := by sorry

-- The quotient stack of a groupoid object in sheaves, as the stackification of the prestack of torsors.
def CategoryTheory.Stack.quotient : True := by sorry

-- R is the 2-fibre product of X with itself over the quotient stack.
theorem CategoryTheory.Stack.quotient_pullback : True := by sorry

-- The sheaf of isomorphism classes of the quotient stack is the sheafification of the naive quotient presheaf.
theorem CategoryTheory.Stack.quotient_isoClasses : True := by sorry

-- The quotient stack is a sheaf exactly when all stabilizers are trivial.
theorem CategoryTheory.Stack.quotient_isSheaf_iff : True := by sorry

-- Objects and morphisms over the quotient stack are objects and morphisms over X with descent data along R.
theorem CategoryTheory.Stack.quotient_descent : True := by sorry

example : True := by sorry -- unit test `free_discrete_quotient`: For a free action of a discrete group the quotient stack is the sheaf quotient.
example : True := by sorry -- unit test `classifying_stack`: For X the final object and R a sheaf of groups G, the quotient is BG, which is not a sheaf and has automorphism sheaf G.
example : True := by sorry -- unit test `strict_pullback_is_wrong`: The strict fibre product of categories differs from the 2-fibre product already for two points mapping to the same object of a groupoid with a nontrivial automorphism (a non-example).
example : True := by sorry -- unit test `iso_classes_needs_sheafification`: For a nontrivial torsor the naive quotient presheaf is not a sheaf, so the isomorphism-class sheaf is strictly bigger than the naive quotient.

/-! ## D1 Totally disconnected perfectoid spaces -/

/-- totally-disconnected-perfectoid-space: A perfectoid space X is totally
disconnected if X is qcqs and every open cover of X splits, that is, for
every open cover {U_i} of X the map from the disjoint union of the U_i to X
admits a section. These are the analogues of profinite sets in the
perfectoid setting. The name refers to the connected components of |X|,
which are the fibres of the projection to the profinite set pi_0(X) and are
of the form Spa(K, K^+); it does not say that |X| is a totally disconnected
topological space. -/
-- The predicate on a perfectoid space: qcqs, and every open cover splits.
def IsTotallyDisconnectedPerfectoid : True := by sorry

-- A totally disconnected perfectoid space is quasicompact and quasiseparated.
theorem IsTotallyDisconnectedPerfectoid.qcqs : True := by sorry

-- A chosen splitting of any given open cover.
theorem IsTotallyDisconnectedPerfectoid.splitting : True := by sorry

-- The condition passes to closed subspaces.
def IsTotallyDisconnectedPerfectoid.isClosed : True := by sorry

-- A totally disconnected perfectoid space is affinoid (ECD 7.5).
def IsTotallyDisconnectedPerfectoid.isAffinoid : True := by sorry

-- The projection to the profinite set of connected components.
def IsTotallyDisconnectedPerfectoid.pi0 : True := by sorry

-- Each fibre of that projection is Spa(K, K^+) for a perfectoid field K and an open bounded valuation subring.
theorem IsTotallyDisconnectedPerfectoid.fibre_eq_spa : True := by sorry

-- Conversely a qcqs perfectoid space all of whose connected components have that form is totally disconnected.
def IsTotallyDisconnectedPerfectoid.of_components : True := by sorry

example : True := by sorry -- unit test `point`: Spa(K, K^+) with K perfectoid and K^+ an open bounded valuation subring is totally disconnected.
example : True := by sorry -- unit test `finite_disjoint_union`: A finite disjoint union of totally disconnected perfectoid spaces is totally disconnected; an infinite one is not (the degenerate case and a non-example).
example : True := by sorry -- unit test `perfectoid_ball_is_not`: The perfectoid closed unit disc over an algebraically closed C is qcqs but not totally disconnected, since it is connected with more than one closed point.
example : True := by sorry -- unit test `agrees_with_profinite`: For X = S x Spa(C, O_C) with S profinite, X is totally disconnected and pi_0(X) = S; a definition that does not recover S is wrong.

/-- split-cover-characterisation: Let X be a spectral space. The following are
equivalent: every open cover of X splits; every connected component of X has
a unique closed point; the global sections functor on sheaves on X is exact,
that is, commutes with all finite colimits; the global sections functor on
sheaves of abelian groups is exact; H^i(X, F) = 0 for all abelian sheaves F
and all i > 0; H^1(X, F) = 0 for all abelian sheaves F. The result is due to
L. Fargues. -/
theorem SplitCoverCharacterisation : True := by sorry

/-- components-of-totally-disconnected: Let X be a totally disconnected
perfectoid space. There is a continuous projection to the profinite set
pi_0(X) of connected components, and every fibre is of the form Spa(K, K^+)
for a perfectoid field K with an open and bounded valuation subring K^+.
Conversely a qcqs perfectoid space all of whose connected components have
this form is totally disconnected. Moreover X is affinoid. -/
theorem ComponentsOfTotallyDisconnected : True := by sorry

/-- w-local-and-w-strictly-local: A perfectoid space X is w-local if its
underlying topological space is a w-local spectral space, equivalently if X
is qcqs, every open cover splits, and the subset X^c of closed points is
closed. A w-local perfectoid space is in particular totally disconnected. A
perfectoid space is w-strictly local if it is w-local and for every x the
completed residue field K(x) is algebraically closed; a w-strictly local
space is in particular strictly totally disconnected. These strengthenings
have little further relevance in ECD, which works with the totally
disconnected and strictly totally disconnected notions. -/
-- A spectral space in which every open cover splits and the set of closed points is closed.
def IsWLocalSpectralSpace : True := by sorry

-- A perfectoid space whose underlying space is w-local.
def IsWLocalPerfectoid : True := by sorry

-- A w-local perfectoid space is totally disconnected.
theorem IsWLocalPerfectoid.isTotallyDisconnected : True := by sorry

-- The set of closed points is closed.
theorem IsWLocalPerfectoid.isClosed_closedPoints : True := by sorry

-- A w-local perfectoid space all of whose completed residue fields are algebraically closed.
def IsWStrictlyLocalPerfectoid : True := by sorry

-- A w-strictly local space is strictly totally disconnected.
theorem IsWStrictlyLocalPerfectoid.isStrictlyTotallyDisconnected : True := by sorry

example : True := by sorry -- unit test `w_local_implies_totally_disconnected`: Every w-local perfectoid space is totally disconnected.
example : True := by sorry -- unit test `totally_disconnected_not_w_local`: A totally disconnected perfectoid space whose set of closed points is not closed is a non-example, so the two predicates must not be defeq.
example : True := by sorry -- unit test `w_localization_is_w_local`: X^wl is w-local for every qcqs perfectoid X (the construction test).
example : True := by sorry -- unit test `w_strictly_local_of_algebraically_closed`: For C algebraically closed, Spa(C, C^+) is w-strictly local (the degenerate one-component case).

/-- pro-constructible-generalizing-subsets-are-affinoid: Let X be a totally
disconnected perfectoid space and U a pro-constructible generalizing subset
of |X|. Then U is an intersection of subsets of the form {|f| at most 1} for
f in H^0(X, O_X). In particular U carries a natural structure of affinoid
perfectoid space, which is again totally disconnected. In particular every
quasicompact open subset of X is affinoid. -/
theorem ProConstructibleGeneralizingSubsetsAreAffinoid : True := by sorry

/-- w-localization: The inclusion of the category of w-local perfectoid spaces
with w-local maps into the category of qcqs perfectoid spaces admits a left
adjoint X maps to X^wl, and the adjunction map X^wl -> X is pro-etale. If X
is affinoid then X^wl -> X is an inverse limit of surjective maps of the
form a finite disjoint union of rational subsets U_i -> X, and in particular
affinoid pro-etale. The underlying space is the w-localization of the
spectral space |X|, with pi_0(X^wl) = |X|_cons and the component over x the
localization X_x, and O^+ on X^wl is the varpi-adic completion of the
pullback of O^+_X. -/
-- The w-localization X^wl of a qcqs perfectoid space.
def Perfectoid.wLocalization : True := by sorry

-- The adjunction map X^wl -> X.
def Perfectoid.wLocalization.toBase : True := by sorry

-- X^wl is w-local.
theorem Perfectoid.wLocalization.isWLocal : True := by sorry

-- It is left adjoint to the inclusion of w-local perfectoid spaces with w-local maps.
theorem Perfectoid.wLocalization.adjunction : True := by sorry

-- The adjunction map is pro-etale, and affinoid pro-etale when X is affinoid.
theorem Perfectoid.wLocalization.isProEtale : True := by sorry

-- pi_0(X^wl) is |X| with the constructible topology, and the component over x is the localization of |X| at x.
theorem Perfectoid.wLocalization.pi0 : True := by sorry

-- For U a quasicompact open subset of X, U^wl -> X^wl is a quasicompact open embedding, and quasicompact open covers induce open covers.
theorem Perfectoid.wLocalization.isOpenEmbedding : True := by sorry

-- The adjunction map is surjective, hence a v-cover.
theorem Perfectoid.wLocalization.surjective : True := by sorry

example : True := by sorry -- unit test `already_w_local`: If X is w-local the adjunction map is an isomorphism (the degenerate case).
example : True := by sorry -- unit test `point_with_valuation_ring`: For X = Spa(K, K^+) with K^+ a valuation subring, X^wl = X.
example : True := by sorry -- unit test `pi0_is_constructible_topology`: pi_0(X^wl) is |X| with its constructible topology; a construction that returns |X| with its own topology is wrong.
example : True := by sorry -- unit test `not_universally_open`: X^wl -> X is not universally open in general, so it must not be confused with the cover of ECD 7.18 (a non-example).

/-- strictly-totally-disconnected: A perfectoid space X is strictly totally
disconnected if it is qcqs and every etale cover of X splits. A qcqs
perfectoid space is strictly totally disconnected if and only if every
connected component is of the form Spa(C, C^+) with C algebraically closed
and C^+ an open and bounded valuation subring. -/
-- The predicate on a perfectoid space: qcqs, and every etale cover splits.
def IsStrictlyTotallyDisconnected : True := by sorry

-- A strictly totally disconnected space is totally disconnected.
theorem IsStrictlyTotallyDisconnected.isTotallyDisconnected : True := by sorry

-- Every connected component is Spa(C, C^+) with C algebraically closed.
theorem IsStrictlyTotallyDisconnected.component_eq : True := by sorry

-- Conversely this condition on components implies strict total disconnectedness.
def IsStrictlyTotallyDisconnected.of_components : True := by sorry

-- The condition passes to closed subspaces, and to pro-constructible generalizing subsets.
def IsStrictlyTotallyDisconnected.isClosed : True := by sorry

-- A chosen splitting of any given etale cover.
theorem IsStrictlyTotallyDisconnected.splitting_etale : True := by sorry

example : True := by sorry -- unit test `algebraically_closed_point`: Spa(C, C^+) with C algebraically closed is strictly totally disconnected.
example : True := by sorry -- unit test `cyclotomic_field_is_not`: Spa(K, K^+) with K perfectoid but not algebraically closed is totally disconnected and not strictly totally disconnected (a non-example separating the two classes).
example : True := by sorry -- unit test `finite_disjoint_union`: A finite disjoint union of strictly totally disconnected spaces is strictly totally disconnected (the degenerate case).
example : True := by sorry -- unit test `profinite_times_point`: S x Spa(C, O_C) for S profinite is strictly totally disconnected, which is the shape produced by Lemma 7.19.

/-- universally-open-std-cover: Let X be an affinoid perfectoid space. Then
there is an affinoid perfectoid space X tilde with an affinoid pro-etale,
surjective and universally open map X tilde -> X such that X tilde is
strictly totally disconnected. If kappa is a cutoff cardinal and X is kappa-
small then X tilde may be taken kappa-small. The construction differs from
the w-localization precisely in that it is universally open, which the
w-localization is not. -/
-- For an affinoid perfectoid X, a strictly totally disconnected affinoid perfectoid X tilde over X.
def Perfectoid.stdCover : True := by sorry

-- The structure map is affinoid pro-etale.
theorem Perfectoid.stdCover.isProEtale : True := by sorry

-- The structure map is surjective, hence a v-cover.
theorem Perfectoid.stdCover.surjective : True := by sorry

-- The structure map is universally open.
theorem Perfectoid.stdCover.universallyOpen : True := by sorry

-- X tilde is strictly totally disconnected.
theorem Perfectoid.stdCover.isStrictlyTotallyDisconnected : True := by sorry

-- If X is kappa-small then X tilde may be chosen kappa-small, for kappa a cutoff cardinal.
theorem Perfectoid.stdCover.small : True := by sorry

-- The single step X_infinity, the limit over finite products of all affinoid etale surjections, which is already universally open.
def Perfectoid.stdCover.oneStep : True := by sorry

example : True := by sorry -- unit test `already_std`: If X is already strictly totally disconnected the identity is such a cover (the degenerate case).
example : True := by sorry -- unit test `universally_open`: The cover is universally open, unlike the w-localization; a construction that produces X^wl is wrong.
example : True := by sorry -- unit test `point`: For X = Spa(C, C^+) with C algebraically closed the construction returns X itself.
example : True := by sorry -- unit test `smallness`: For X kappa-small the cover is kappa-small, so the construction stays inside the kappa-small site.

/-- pro-etale-maps-over-std-base: Let X be a strictly totally disconnected
perfectoid space and f : Y -> X a quasicompact separated map of perfectoid
spaces. Then f is pro-etale if and only if for every rank-one point x =
Spa(C, O_C) of X the fibre Y_x is isomorphic to x x S_x for a profinite set
S_x. In that case Y is strictly totally disconnected and Y -> X is affinoid
pro-etale. The hypothesis holds in particular when Y is affinoid, since any
map of affinoid perfectoid spaces is separated. -/
theorem ProEtaleMapsOverStdBase : True := by sorry

/-- topological-classification-of-pro-etale-maps: Let T be a spectral space each
of whose connected components is a totally ordered chain of specializations.
Call a spectral map S -> T affinoid pro-etale if the induced map S -> T
x_{pi_0 T} pi_0(S) is a pro-constructible generalizing embedding, and pro-
etale if S is covered by spectral subsets whose restrictions are affinoid
pro-etale. For X a strictly totally disconnected perfectoid space, sending f
: Y -> X to |f| : |Y| -> |X| gives equivalences between the category of
(kappa-small) affinoid pro-etale perfectoid spaces over X and the category
of affinoid pro-etale spectral maps to |X| (of cardinality less than kappa),
and likewise in the pro-etale case. The inverse sends S -> |X| to the space
with O^+_S the varpi-adic completion of the pullback of O^+_X. -/
theorem TopologicalClassificationOfProEtaleMaps : True := by sorry

/-- automatic-flatness: Let X = Spa(R, R^+) be a totally disconnected perfectoid
space and f : Y = Spa(S, S^+) -> X any map from an affinoid perfectoid
space. Then S^+/varpi is flat over R^+/varpi for every pseudouniformizer
varpi of R. If moreover |f| is surjective then S^+/varpi is faithfully flat
over R^+/varpi. This is the algebraic descent input of the theory; it is not
the assertion that arbitrary maps of perfectoid rings are flat. -/
theorem AutomaticFlatness : True := by sorry

/-! ## D2 Pro-etale and v-topologies -/

/-- big-pro-etale-site: Let Perfd be the category of perfectoid spaces and
Perfd_kappa the full subcategory of kappa-small ones. The big pro-etale site
is the Grothendieck topology on Perfd, respectively Perfd_kappa, in which a
family {f_i : Y_i -> X} is a covering if all f_i are pro-etale and for every
quasicompact open U of X there is a finite subset J of the index set and
quasicompact opens V_i of Y_i for i in J with U the union of the images
f_i(V_i). The quasicompactness condition is the same one that appears in the
definition of the fpqc topology for schemes; point-surjectivity of an
unrestricted family is not the definition. -/
-- The precoverage on Perfd whose members are pro-etale families satisfying the finite quasicompact image condition.
def Perfd.proEtalePrecoverage : True := by sorry

-- The Grothendieck topology it generates.
def Perfd.proEtaleTopology : True := by sorry

-- Coverings are stable under base change.
def Perfd.proEtalePrecoverage.isStableUnderBaseChange : True := by sorry

-- Coverings are stable under composition.
def Perfd.proEtalePrecoverage.isStableUnderComposition : True := by sorry

-- Analytic and etale covers are pro-etale covers, so the analytic and etale topologies are coarser.
theorem Perfd.proEtaleTopology_le_of_analytic : True := by sorry

-- Every pro-etale covering is refined by one all of whose members are affinoid perfectoid.
theorem Perfd.proEtaleCover.refineAffinoid : True := by sorry

-- The topology restricts to Perfd_kappa and the inclusion is a continuous functor of sites.
theorem Perfd.proEtaleTopology.small : True := by sorry

-- Membership is the conjunction of pro-etaleness and the quasicompact image condition.
theorem Perfd.mem_proEtaleCover_iff : True := by sorry

example : True := by sorry -- unit test `single_surjective_pro_etale`: A surjective pro-etale map of qcqs perfectoid spaces is a covering.
example : True := by sorry -- unit test `analytic_cover`: A jointly surjective family of open immersions is a covering (the degenerate case).
example : True := by sorry -- unit test `point_surjective_is_not_enough`: A pro-etale family that is surjective on points but where no finite subfamily covers a given quasicompact open by images of quasicompact opens is not a covering (the required non-example).
example : True := by sorry -- unit test `matches_scheme_condition`: The image condition is literally Mathlib's quasi-compact cover condition for schemes, transported along the analogy; a definition that is not equivalent to it is wrong.

/-- small-pro-etale-site-and-v-site: For a perfectoid space X, the pro-etale
site X_proet is the Grothendieck topology on the category of perfectoid
spaces pro-etale over X, with the same coverings as in the big site; there
is a kappa-small variant. The v-site is the Grothendieck topology on Perfd,
respectively Perfd_kappa, in which a family {f_i : Y_i -> X} is a covering
if for every quasicompact open U of X there is a finite subset J and
quasicompact opens V_i of Y_i for i in J with U the union of the images; no
condition at all is placed on the maps themselves. There is no small v-site
of a perfectoid space, since by design it would contain all perfectoid
spaces over X. -/
-- The precoverage on Perfd defined by the finite quasicompact image condition alone.
def Perfd.vPrecoverage : True := by sorry

-- The v-topology it generates.
def Perfd.vTopology : True := by sorry

-- The small pro-etale site of a perfectoid space X.
def Perfectoid.proEtaleSite : True := by sorry

-- Every pro-etale cover is a v-cover.
theorem Perfd.proEtaleTopology_le_vTopology : True := by sorry

-- A map of qcqs perfectoid spaces is a v-cover exactly when it is surjective on points.
theorem Perfd.isVCover_iff_surjective : True := by sorry

-- v-coverings are stable under base change and composition.
def Perfd.vPrecoverage.isStableUnderBaseChange : True := by sorry

-- The small pro-etale site has fibre products, supplied by the stability of pro-etale maps.
def Perfectoid.proEtaleSite.hasFiniteLimits : True := by sorry

-- The v-topology restricts to Perfd_kappa compatibly with the inclusion.
theorem Perfd.vTopology.small : True := by sorry

example : True := by sorry -- unit test `surjection_is_v_cover`: A surjective map of affinoid perfectoid spaces is a v-cover.
example : True := by sorry -- unit test `pro_etale_is_v`: Every pro-etale cover is a v-cover; the converse fails, for instance for the disjoint union of all Spa(K(x), K(x)^+) over the points of X (a non-example).
example : True := by sorry -- unit test `no_small_v_site`: The category of perfectoid spaces over X with v-covers is not essentially small, so no small v-site is constructed (the degenerate case that must be refused).
example : True := by sorry -- unit test `empty_cover`: The empty family covers the empty perfectoid space and nothing else.

/-- cutoff-independence: For cutoff cardinals kappa and kappa' as in ECD 4.1 and
a kappa-small perfectoid space X, the pullback functor from sheaves on
X_proet,kappa to sheaves on X_proet,kappa' is fully faithful and preserves
cohomology: for every sheaf of sets, respectively of groups, respectively of
abelian groups F, the unit is an isomorphism and the higher direct images
vanish in the relevant degrees. The same holds for pro-etale or v-cohomology
on Perfd_kappa and their slices. Consequently one defines the category of
small sheaves as the filtered colimit over all kappa, and a sheaf commuting
with omega_1-filtered colimits of affinoid perfectoid rings is small. -/
theorem CutoffIndependence : True := by sorry

/-- perfectoid-sheaf-topoi-are-algebraic: The categories of small sheaves on
Perfd for either the big pro-etale or the v-topology, and the category of
small sheaves on X_proet for a perfectoid space X, are algebraic in the
sense of SGA 4 VI: a basis of qcqs objects stable under fibre products is
given in all cases by the affinoid perfectoid spaces. Moreover a perfectoid
space X is quasicompact, respectively quasiseparated, in any of these
settings if and only if |X| is quasicompact, respectively quasiseparated.
For a map of stacks on such a site, quasiseparatedness is required to mean
that the diagonal is quasicompact and quasiseparated, which for stacks is
not automatic since the diagonal need not be injective. -/
theorem PerfectoidSheafTopoiAreAlgebraic : True := by sorry

/-- pro-etale-etale-comparison-and-structure-sheaves: Let X be a perfectoid
space and nu : X_proet -> X_et the natural map of sites. For every sheaf F
on X_et the adjunction F -> nu_* nu^* F is an equivalence, and for F abelian
R^i nu_* nu^* F = 0 for i at least 1. For an affinoid pro-etale Y = lim Y_i
over an affinoid open X_0 of X the natural map colim_i F(Y_i) -> (nu^* F)(Y)
is an isomorphism. The presheaves O and O^+ on X_proet are small sheaves,
and for X affinoid perfectoid H^i(X_proet, O) = 0 for i > 0 and H^i(X_proet,
O^+) is almost zero for i > 0. -/
theorem ProEtaleEtaleComparisonAndStructureSheaves : True := by sorry

/-- subcanonicity-of-the-pro-etale-topology: The presheaves O sending X to
O_X(X) and O^+ sending X to O^+_X(X) on the big pro-etale site are small
sheaves. Moreover the big pro-etale site is subcanonical: for every
perfectoid space X the functor Y mapsto Hom(Y, X) is a small sheaf for the
big pro-etale topology. -/
theorem SubcanonicityOfTheProEtaleTopology : True := by sorry

/-- v-descent-of-functions: The presheaves O and O^+ on the v-site are small
sheaves, and the v-site is subcanonical: for every perfectoid space X the
functor Y mapsto Hom(Y, X) is a small v-sheaf. -/
theorem VDescentOfFunctions : True := by sorry

/-- higher-v-acyclicity: Let X be an affinoid perfectoid space. Then H^i_v(X, O)
= 0 for i > 0, and H^i_v(X, O^+) is almost zero for i > 0. Together with the
v-sheaf property this is Theorem 1.2 of the introduction: v-cohomology of O
on an affinoid perfectoid space is concentrated in degree zero, where it is
R, and v-cohomology of O^+ is almost concentrated in degree zero, where it
is R^+. -/
theorem HigherVAcyclicity : True := by sorry

/-! ## D3 Effective descent and morphisms of stacks -/

/-- descent-prestacks-of-perfectoid-spaces: Let F be the prestack on the
category of perfectoid spaces sending X to the groupoid of perfectoid spaces
over X, and let Y -> X be a v-cover. Then F(X) -> F(Y/X) is fully faithful,
where F(Y/X) is the category of descent data of ECD 9.1. Equivalently,
morphisms of perfectoid spaces glue along v-covers. The same holds for the
prestacks of affinoid perfectoid spaces, of separated pro-etale perfectoid
spaces, of separated etale perfectoid spaces and of finite etale perfectoid
spaces, which are the four prestacks whose effectivity is studied in this
layer. -/
theorem DescentPrestacksOfPerfectoidSpaces : True := by sorry

/-- effective-descent-affinoid-over-totally-disconnected: Let F be the prestack
on affinoid perfectoid spaces sending X to the groupoid of affinoid
perfectoid spaces over X. Let X be a totally disconnected perfectoid space
and Y -> X a v-cover with Y affinoid perfectoid. Then F(X) -> F(Y/X) is an
equivalence of categories. Both the ring and the ring of integral elements
must be descended: descent of functions alone does not give effective
descent. -/
theorem EffectiveDescentAffinoidOverTotallyDisconnected : True := by sorry

/-- descended-subsets-are-cut-out-by-functions: Let X = Spa(R, R^+) be a totally
disconnected affinoid perfectoid space, X tilde = Spa(R tilde, R tilde^+) an
affinoid perfectoid space over X, and A a subset of |X tilde|. Assume there
is a surjective map Y = Spa(S, S^+) -> X such that the preimage B of A in |Y
tilde|, where Y tilde = X tilde x_X Y, is an intersection of subsets of the
form |g| at most 1 for g in S tilde. Then A is an intersection of subsets of
the form |f| at most 1 for f in R tilde. A separate input is that a rational
subset of a perfectoid ball over (C, C^+) which surjects onto Spa(C, C^+)
admits a (C, C^+)-point. -/
theorem DescendedSubsetsAreCutOutByFunctions : True := by sorry

/-- effective-descent-separated-pro-etale: Let F be the prestack sending a
perfectoid space X to the groupoid of separated pro-etale perfectoid spaces
over X. Let X be a strictly totally disconnected perfectoid space and Y -> X
a v-cover. Then F(X) -> F(Y/X) is an equivalence of categories. -/
theorem EffectiveDescentSeparatedProEtale : True := by sorry

/-- etale-and-finite-etale-are-v-stacks: The prestack sending a perfectoid space
X to the groupoid of separated etale perfectoid spaces over X is a stack for
the v-topology, and so is the prestack of finite etale perfectoid spaces
over X. Consequently, for f : Y -> X a map of perfectoid spaces and X tilde
-> X a v-cover with pullback f tilde: if f tilde is pro-etale and X is
strictly totally disconnected then f is pro-etale; if f tilde is etale then
f is etale; if f tilde is finite etale then f is finite etale. -/
theorem EtaleAndFiniteEtaleAreVStacks : True := by sorry

/-- etale-and-quasi-pro-etale-morphisms-of-stacks: Let f : Y' -> Y be a map of
pro-etale stacks on Perfd. Assume f is locally separated, that is, there is
an open cover of Y' on which f becomes separated. Then f is quasi-pro-etale
if for every strictly totally disconnected perfectoid space X with a map X
-> Y the pullback Y' x_Y X is representable and Y' x_Y X -> X is pro-etale;
f is etale if for every perfectoid space X with a map X -> Y the pullback is
representable and etale over X; f is finite etale if for every perfectoid
space X with a map X -> Y the pullback is representable and finite etale
over X. Local separatedness is part of the definition of etale and quasi-
pro-etale, by ECD Convention 10.2; it is not imposed on finite etale maps,
which are automatically separated. -/
-- The predicate on a locally separated map of pro-etale stacks defined by pullback to strictly totally disconnected perfectoid spaces.
def Perfd.Stack.IsQuasiProEtale : True := by sorry

-- The corresponding predicate defined by pullback to arbitrary perfectoid spaces.
def Perfd.Stack.IsEtale : True := by sorry

-- The predicate defined by representable finite etale pullbacks; local separatedness is automatic.
def Perfd.Stack.IsFiniteEtale : True := by sorry

-- The standing hypothesis of Convention 10.2, that f becomes separated on an open cover of the source.
def Perfd.Stack.IsLocallySeparated : True := by sorry

-- Composites of quasi-pro-etale maps are quasi-pro-etale, and likewise in the etale and finite etale cases.
theorem Perfd.Stack.isQuasiProEtale_comp : True := by sorry

-- If g and g composed with f are in the class then so is f.
theorem Perfd.Stack.isQuasiProEtale_of_comp : True := by sorry

-- The classes are stable under base change.
theorem Perfd.Stack.isQuasiProEtale_pullback : True := by sorry

-- For a map of perfectoid spaces over a strictly totally disconnected base, quasi-pro-etale is equivalent to pro-etale.
theorem Perfd.Stack.isQuasiProEtale_iff_isProEtale : True := by sorry

-- For a map of perfectoid spaces the etale and finite etale predicates agree with the absolute ones.
theorem Perfd.Stack.isEtale_iff_of_perfectoid : True := by sorry

example : True := by sorry -- unit test `pro_etale_of_perfectoid_spaces`: A pro-etale map of perfectoid spaces is quasi-pro-etale; the converse fails for a general base (a non-example).
example : True := by sorry -- unit test `open_immersion`: An open immersion is etale, and a finite disjoint union of isomorphisms is finite etale (the degenerate cases).
example : True := by sorry -- unit test `locally_separated_is_needed`: Without local separatedness the quotient of a perfectoid space by a free discrete group action would be counted as etale over a point in a way ECD's convention excludes.
example : True := by sorry -- unit test `agrees_with_absolute_notion`: For a map of perfectoid spaces the predicates agree with the usual etale and finite etale notions of ECD section 6.

/-- sub-v-sheaves-of-totally-disconnected-spaces: Let X be a totally
disconnected perfectoid space and Y a sub-v-sheaf of X. Then Y is ind-
representable: it is the filtered colimit of the Y_i inside Y inside X that
are pro-constructible generalizing subsets of X, each of which is affinoid
pro-etale over X. Consequently a quasicompact injection f : Y' -> Y of
v-stacks is quasi-pro-etale, and for every totally disconnected perfectoid
space X over Y the fibre product Y' x_Y X is represented by a pro-
constructible generalizing subset of X. -/
theorem SubVSheavesOfTotallyDisconnectedSpaces : True := by sorry

/-- immersions-separatedness-and-truncatedness: Let f : Y' -> Y be a map of pro-
etale stacks. It is an open immersion if for every perfectoid space X over Y
the pullback Y' x_Y X -> X is representable by an open immersion; a closed
immersion if for every totally disconnected perfectoid space X over Y the
pullback is representable by a closed immersion; separated if the diagonal
is a closed immersion; 0-truncated if for all perfectoid X the functor of
groupoids Y'(X) -> Y(X) is faithful. A pro-etale stack Y is separated if Y
-> the final object is separated; this last notion needs care, since Y
separated does not imply Y quasiseparated. -/
-- The predicate defined by representable open-immersion pullbacks.
def Perfd.Stack.IsOpenImmersion : True := by sorry

-- The predicate defined by representable closed-immersion pullbacks over totally disconnected bases.
def Perfd.Stack.IsClosedImmersion : True := by sorry

-- The predicate that the diagonal is a closed immersion.
def Perfd.Stack.IsSeparated : True := by sorry

-- The predicate that the map is faithful on groupoids of points.
def Perfd.Stack.IsZeroTruncated : True := by sorry

-- 0-truncatedness is equivalent to the diagonal being an injection, and to the fibres being sheaves.
theorem Perfd.Stack.isZeroTruncated_iff_diagonal_injection : True := by sorry

-- The valuative criterion for separatedness of ECD 10.9.
theorem Perfd.Stack.isSeparated_iff_valuative : True := by sorry

-- The variant for a general perfectoid Tate pair, ECD 10.10.
theorem Perfd.Stack.isSeparated_uniqueness_general_pair : True := by sorry

-- The four classes are stable under composition and base change.
theorem Perfd.Stack.isSeparated_comp : True := by sorry

-- For a map of perfectoid spaces the notions agree with those of PerfectoidSpaces:P4.
theorem Perfd.Stack.isSeparated_of_perfectoid : True := by sorry

example : True := by sorry -- unit test `open_immersion_of_perfectoid_spaces`: An open immersion of perfectoid spaces is an open immersion of v-sheaves and conversely.
example : True := by sorry -- unit test `separated_not_quasiseparated`: X/phi^Z for X a characteristic p perfectoid space and phi its absolute Frobenius is separated and not quasiseparated (the required non-example).
example : True := by sorry -- unit test `classifying_stack_not_zero_truncated`: The classifying stack of a nontrivial locally profinite group is not 0-truncated (the degenerate stack case).
example : True := by sorry -- unit test `valuative_criterion`: A map of perfectoid spaces is separated exactly when the valuative criterion holds, matching PerfectoidSpaces:P4.

/-- v-local-nature-of-morphism-classes: Let f : Y' -> Y be a map of v-stacks, g
: Y tilde -> Y a surjective map of v-stacks and f tilde the pullback of f.
If f tilde is quasicompact, respectively quasiseparated, then so is f; if f
tilde is an open, respectively closed, immersion then so is f; if f tilde is
separated then so is f; if f tilde is finite etale then so is f; if f tilde
is separated and etale then f is separated and etale; if f tilde is
separated and quasi-pro-etale then f is separated and quasi-pro-etale. -/
theorem VLocalNatureOfMorphismClasses : True := by sorry

/-- locally-profinite-torsors: For a topological space T let T underline be the
v-sheaf sending X to the continuous maps from |X| to T. Let G be a locally
profinite group. A G underline-torsor is a map f : X tilde -> X of v-stacks
with an action of G underline over X such that v-locally on X there is a G
underline-equivariant isomorphism between X tilde and G underline times X.
If X is a perfectoid space, then X tilde is representable by a perfectoid
space, X tilde -> X is pro-etale, universally open and a v-cover; for every
open subgroup K of G the pushout X tilde_K along the discrete G-set G/K is
separated etale over X, the transition map X tilde_{K'} -> X tilde_K is
finite etale when K' inside K has finite index, and X tilde is the inverse
limit of the X tilde_K. -/
-- The v-sheaf T underline attached to a topological space T, sending X to the continuous maps from |X| to T.
def Perfd.underlineSheaf : True := by sorry

-- T underline is a v-sheaf.
theorem Perfd.underlineSheaf.isVSheaf : True := by sorry

-- T mapsto T underline is functorial and sends profinite sets to affinoid perfectoid spaces after multiplying by a base point.
theorem Perfd.underlineSheaf.functorial : True := by sorry

-- The predicate that f is a G underline-torsor, defined by v-local triviality.
def Perfd.IsTorsor : True := by sorry

-- A G underline-torsor over a perfectoid space is representable by a perfectoid space.
theorem Perfd.Torsor.representable : True := by sorry

-- It is pro-etale, universally open and a v-cover.
theorem Perfd.Torsor.isProEtale : True := by sorry

-- For K an open subgroup, the pushout X tilde_K along G/K, which is separated etale over X.
def Perfd.Torsor.levelSpace : True := by sorry

-- For K' of finite index in K the transition map is finite etale.
def Perfd.Torsor.levelSpace_finiteEtale : True := by sorry

-- X tilde is the inverse limit of the X tilde_K over open subgroups K.
theorem Perfd.Torsor.asLimit : True := by sorry

example : True := by sorry -- unit test `split_torsor`: G underline times X is a G underline-torsor over X and its level spaces are disjoint unions of copies of X (the degenerate case).
example : True := by sorry -- unit test `finite_group`: For G finite, a G underline-torsor is a finite etale Galois cover with group G; a definition that does not recover this is wrong.
example : True := by sorry -- unit test `profinite_over_geometric_point`: For X = Spa(C, O_C) and G profinite, a torsor is X times S for S a profinite set with a free transitive G-action.
example : True := by sorry -- unit test `not_etale`: For G infinite profinite the torsor X tilde -> X is pro-etale and not etale (a non-example separating the two classes).

/-! ## D4 Diamonds and small v-stacks -/

/-- diamond: From here on one works with the full subcategory Perf of perfectoid
spaces of characteristic p. A diamond is a sheaf Y for the pro-etale
topology on Perf that can be written as a quotient X/R, where X is
representable by a perfectoid space and R inside X x X is a representable
equivalence relation whose two projections s, t : R -> X are pro-etale. Such
an R is called a pro-etale equivalence relation on X. No assumption such as
representability of the diagonal is made, because there is no good notion of
relatively representable morphisms of perfectoid spaces. -/
-- The full subcategory of perfectoid spaces of characteristic p, with its pro-etale and v-topologies.
def Perf : True := by sorry

-- The predicate that a representable equivalence relation on a perfectoid space has pro-etale projections.
def Perf.IsProEtaleEquivRel : True := by sorry

-- The predicate on a pro-etale sheaf on Perf that it admits a presentation as such a quotient.
def Perf.Diamond : True := by sorry

-- Every characteristic p perfectoid space is a diamond.
def Perf.Diamond.ofPerfectoid : True := by sorry

-- A chosen presentation Y = X/R, together with the maps X -> Y and R -> X x X.
theorem Perf.Diamond.presentation : True := by sorry

-- Every diamond is a small sheaf.
def Perf.Diamond.isSmall : True := by sorry

-- For a presentation, the natural map R -> X x_Y X is an isomorphism.
theorem Perf.Diamond.relation_eq : True := by sorry

-- The map X -> Y from a presentation is surjective and quasi-pro-etale.
def Perf.Diamond.quasiProEtale_atlas : True := by sorry

example : True := by sorry -- unit test `representable`: A characteristic p perfectoid space is a diamond, with R the diagonal (the degenerate case).
example : True := by sorry -- unit test `profinite_quotient`: For S profinite with a free action of a finite group G, S underline times Spa(C, O_C) modulo G is a diamond which is a perfectoid space.
example : True := by sorry -- unit test `compact_hausdorff`: For T compact Hausdorff, T underline times Spa(K, O_K) is a diamond whose underlying space is T, which is not spectral in general (a required test of this layer).
example : True := by sorry -- unit test `not_every_v_sheaf`: Not every v-sheaf is a diamond; the definition must not be weakened to 'v-sheaf with a surjection from a perfectoid space' (a non-example, since that is the definition of a small v-sheaf).

/-- quotient-presentations-of-diamonds: Let X be in Perf and R inside X x X a
pro-etale equivalence relation. Then the quotient sheaf Y = X/R is a
diamond; the natural map R -> X x_Y X of sheaves on Perf is an isomorphism;
for any pro-etale cover X tilde -> X by a perfectoid space the induced R
tilde on X tilde is again a pro-etale equivalence relation and X tilde/R
tilde -> Y is an isomorphism; and the map X -> Y is quasi-pro-etale. -/
theorem QuotientPresentationsOfDiamonds : True := by sorry

/-- atlas-characterisation-of-diamonds: Let Y be a pro-etale sheaf on Perf. Then
Y is a diamond if and only if there is a surjective quasi-pro-etale morphism
X -> Y from a perfectoid space X. If X is a disjoint union of strictly
totally disconnected spaces then R = X x_Y X inside X x X is a pro-etale
equivalence relation with Y = X/R. Consequently: if there is a surjective
quasi-pro-etale map Y' -> Y with Y' a diamond then Y is a diamond; if f : Y'
-> Y is quasi-pro-etale and Y is a diamond then Y' is a diamond; and if X is
a diamond with an equivalence relation R whose projections are quasi-pro-
etale then X/R is a diamond. -/
theorem AtlasCharacterisationOfDiamonds : True := by sorry

/-- diamonds-are-v-sheaves: Let Y be a diamond. Then Y is a sheaf for the
v-topology. Moreover, if f : Y' -> Y is an injection of v-sheaves and Y is a
diamond, then Y' is a diamond; and a qcqs map f : Y -> X of diamonds is an
isomorphism if and only if f(K, K^+) is a bijection for every algebraically
closed perfectoid field K with an open and bounded valuation subring K^+. -/
theorem DiamondsAreVSheaves : True := by sorry

/-- compact-hausdorff-diamonds: Fix a perfectoid field K of characteristic p.
The functor sending a compact Hausdorff space T to T underline times Spa(K,
O_K) is a fully faithful functor from compact Hausdorff spaces to diamonds
over Spa(K, O_K). For S profinite, S underline times Spa(K, O_K) is the
affinoid perfectoid space Spa(C^0(S, K), C^0(S, O_K)). The underlying
topological space of T underline times Spa(K, O_K) is T, so it can be far
from spectral. -/
theorem CompactHausdorffDiamonds : True := by sorry

/-- underlying-topological-space: Let Y be a diamond with a presentation Y =
X/R. There is a canonical bijection between |X|/|R| and the set of
equivalence classes of maps Spa(K, K^+) -> Y, where K runs over perfectoid
fields with an open and bounded valuation subring K^+, two maps being
equivalent if they are dominated by a third through surjective maps. The
quotient topology induced on this set by the surjection |X| -> |Y| is
independent of the presentation, and |Y| with that topology is the
underlying topological space of Y. Any open subfunctor of Y is a diamond,
and U mapsto |U| is a bijection between open immersions into Y and open
subsets of |Y|; a surjection of diamonds induces a quotient map on
underlying spaces. -/
-- The underlying topological space |Y| of a diamond Y.
def Perf.Diamond.space : True := by sorry

-- For any presentation Y = X/R, |Y| is the quotient |X|/|R| with the quotient topology.
theorem Perf.Diamond.space_eq_quotient : True := by sorry

-- |Y| is in canonical bijection with the equivalence classes of maps Spa(K, K^+) -> Y.
theorem Perf.Diamond.space_eq_points : True := by sorry

-- Y mapsto |Y| is a functor to topological spaces.
theorem Perf.Diamond.space_functorial : True := by sorry

-- Open immersions into Y correspond bijectively to open subsets of |Y|.
theorem Perf.Diamond.openSubfunctorEquiv : True := by sorry

-- A surjection of diamonds induces a quotient map of underlying spaces.
def Perf.Diamond.isQuotientMap_of_surjective : True := by sorry

-- For a perfectoid space the construction returns the usual underlying topological space.
theorem Perf.Diamond.space_of_perfectoid : True := by sorry

-- A map of diamonds is an open immersion exactly when it is an isomorphism onto the open subfunctor attached to an open subset of |Y|.
theorem Perf.Diamond.isOpenImmersion_iff : True := by sorry

example : True := by sorry -- unit test `perfectoid_space`: For Y a perfectoid space, |Y| is the underlying space of Y.
example : True := by sorry -- unit test `compact_hausdorff`: For Y = T underline times Spa(K, O_K), |Y| = T; in particular |Y| need not be spectral (the required non-example).
example : True := by sorry -- unit test `independent_of_presentation`: Two presentations of the same diamond give the same topology; a construction depending on the atlas is wrong.
example : True := by sorry -- unit test `open_subfunctors`: Open subfunctors of a perfectoid space correspond to open subsets, matching the classical statement (the degenerate case).

/-- small-v-sheaves-and-small-v-stacks: A small v-sheaf is a v-sheaf Y on Perf
such that there is a surjective map of v-sheaves X -> Y from a perfectoid
space X. A small v-stack is a v-stack Y on Perf such that there is a
surjective map of v-stacks X -> Y from a perfectoid space X for which R = X
x_Y X is a small v-sheaf. Every diamond is a small v-sheaf; a v-sheaf
admitting a surjection from a diamond is a small v-sheaf; and every
quasicompact v-sheaf, and more generally every qcqs v-stack, is small. -/
-- The predicate that a v-sheaf admits a surjection from a perfectoid space.
def Perf.IsSmallVSheaf : True := by sorry

-- The predicate that a v-stack admits a surjection from a perfectoid space with small diagonal fibre product.
def Perf.IsSmallVStack : True := by sorry

-- Every diamond is a small v-sheaf.
def Perf.IsSmallVSheaf.ofDiamond : True := by sorry

-- A v-sheaf with a surjection from a diamond is small.
def Perf.IsSmallVSheaf.ofSurjectionFromDiamond : True := by sorry

-- Every quasicompact v-sheaf, and every qcqs v-stack, is small.
theorem Perf.IsSmallVStack.ofQuasicompact : True := by sorry

-- For a surjection from a diamond, the relation is a diamond and the quotient is the given sheaf.
theorem Perf.IsSmallVSheaf.relation_isDiamond : True := by sorry

-- If the sheaf is quasiseparated and the atlas locally spatial then the relation is locally spatial; if the sheaf is qcqs and the atlas spatial then the relation is spatial.
def Perf.IsSmallVSheaf.relation_locallySpatial : True := by sorry

-- Small v-stacks are stable under 2-fibre products.
def Perf.IsSmallVStack.fibreProduct : True := by sorry

example : True := by sorry -- unit test `diamond`: Every diamond is a small v-sheaf (the degenerate case).
example : True := by sorry -- unit test `classifying_stack`: The classifying stack of a locally profinite group G over a geometric point is a small v-stack that is not a v-sheaf.
example : True := by sorry -- unit test `quasicompact_is_small`: A quasicompact v-sheaf is small without any further hypothesis.
example : True := by sorry -- unit test `not_all_v_sheaves`: The v-sheaf sending X to the set of all subsets of |X| is not small (a non-example showing the condition has content).

/-- spaces-and-surjectivity-for-small-v-stacks: Let Y be a small v-stack with a
presentation Y = X/R, X a diamond, R a small v-sheaf and R tilde -> R a
surjection from a diamond. There is a canonical bijection between |X|/|R
tilde| and the set of maps Spa(K, K^+) -> Y modulo the domination relation,
and the quotient topology is independent of the presentation; this defines
|Y|. Open sub-v-stacks of Y correspond bijectively to open subsets of |Y|,
and a surjection of small v-stacks induces a quotient map of spaces. Fibre
products of small v-stacks are small v-stacks and the map from the space of
the fibre product to the fibre product of the spaces is surjective. Finally,
if f is a surjection of v-stacks then |f| is surjective; conversely if f is
quasicompact and |f| is surjective then f is a surjection of v-stacks.
Without the quasicompactness hypothesis the converse fails. -/
theorem SpacesAndSurjectivityForSmallVStacks : True := by sorry

/-- isomorphism-criteria-for-v-sheaves-and-stacks: Let f : Y' -> Y be a qcqs map
of v-stacks. Then f is an isomorphism if and only if for every algebraically
closed perfectoid field K with an open and bounded valuation subring K^+ the
map f(K, K^+) : Y'(K, K^+) -> Y(K, K^+) is an equivalence of groupoids.
Separately, for f a map of small v-sheaves that is either qcqs or between
locally spatial objects, the following are equivalent: f is an injective map
of v-sheaves; f(K, K^+) is injective for all perfectoid fields K with an
open and bounded valuation subring; |f| is injective and f is final among
maps from small v-sheaves whose spaces factor continuously through |Y'|,
equivalently Y' is the fibre product of Y with |Y'| underline over |Y|
underline. -/
theorem IsomorphismCriteriaForVSheavesAndStacks : True := by sorry

/-! ## D5 Spatial geometry and relative representability -/

/-- spatial-diamond: A diamond Y is spatial if Y is quasicompact and
quasiseparated and |Y| admits a basis of open subsets given by |U| for
quasicompact open immersions U inside Y; Y is locally spatial if it admits
an open cover by spatial diamonds. The same definition with 'diamond'
replaced by 'v-sheaf' gives spatial and locally spatial v-sheaves, where in
the locally spatial case smallness is also required. The condition is sheaf-
theoretic: it is not the requirement that |Y| be a spectral space. Any
perfectoid space is locally spatial, and it is spatial exactly when it is
qcqs. -/
-- The predicate on a diamond: qcqs, with a basis of quasicompact open subfunctors.
def Perf.Diamond.IsSpatial : True := by sorry

-- The predicate that Y has an open cover by spatial diamonds.
def Perf.Diamond.IsLocallySpatial : True := by sorry

-- The same condition for a v-sheaf.
def Perf.VSheaf.IsSpatial : True := by sorry

-- |Y| is a spectral space, and locally spectral in the locally spatial case.
theorem Perf.Diamond.IsSpatial.spectralSpace : True := by sorry

-- A quasicompact open subfunctor of a spatial diamond is spatial.
def Perf.Diamond.IsSpatial.quasicompactOpen : True := by sorry

-- For Y' locally spatial over Y, the induced map |Y'| -> |Y| is spectral and generalizing.
theorem Perf.Diamond.IsLocallySpatial.isSpectralMap : True := by sorry

-- Y is quasicompact, respectively quasiseparated, exactly when |Y| is.
theorem Perf.Diamond.IsLocallySpatial.qcqs_iff : True := by sorry

-- A perfectoid space is locally spatial, and spatial exactly when qcqs.
theorem Perf.Diamond.isSpatial_of_perfectoid : True := by sorry

-- The set of generalizations of a point of |Y| is totally ordered.
theorem Perf.Diamond.IsLocallySpatial.generalizations_totallyOrdered : True := by sorry

example : True := by sorry -- unit test `qcqs_perfectoid`: A qcqs perfectoid space is a spatial diamond; a non-quasicompact one is locally spatial and not spatial (the degenerate cases).
example : True := by sorry -- unit test `compact_hausdorff_not_spatial`: T underline times Spa(K, O_K) for T compact Hausdorff and not profinite is qcqs and not spatial (the required non-example).
example : True := by sorry -- unit test `space_is_spectral`: For Y spatial, |Y| is spectral; a definition that only demands spectrality of |Y| would also accept the compact Hausdorff example when T is profinite but the atlas is wrong, so the sheaf-theoretic form is required.
example : True := by sorry -- unit test `open_subfunctor`: Quasicompact open subfunctors of a spatial diamond are spatial, and the |U| form a basis.

/-- injection-and-finite-etale-permanence: Let Y be a locally spatial diamond
and f : Y' -> Y a quasicompact injection of v-sheaves. Then Y' is a locally
spatial diamond, |Y'| inside |Y| is pro-constructible and generalizing with
the subspace topology, and Y' is the fibre product of Y with |Y'| underline
over |Y| underline. If instead Y is a (locally) spatial diamond and Y' -> Y
is a finite etale map of pro-etale sheaves then Y' is a (locally) spatial
diamond; the same holds with 'diamond' replaced by 'v-sheaf' and Y spatial. -/
theorem InjectionAndFiniteEtalePermanence : True := by sorry

/-- quasi-pro-etale-and-fibre-product-permanence: Let Y be a locally spatial
diamond and Y' -> Y a quasi-pro-etale map of pro-etale sheaves, which by
Convention 10.2 is locally separated. Then Y' is a locally spatial diamond.
A fibre product of (locally) spatial diamonds is (locally) spatial. More
generally, if Y is a qcqs diamond admitting a surjective universally open
quasi-pro-etale map from a (locally) spatial diamond, then Y is spatial. -/
theorem QuasiProEtaleAndFibreProductPermanence : True := by sorry

/-- limits-and-finite-stage-comparisons: Let Y_i be a cofiltered inverse system
of diamonds with qcqs transition maps and Y its limit. Then Y is a diamond,
|Y| -> lim |Y_i| is a continuous bijection, and the maps Y -> Y_i are qcqs;
if all Y_i are (locally) spatial then so is Y and |Y| -> lim |Y_i| is a
homeomorphism. If kappa is a cutoff cardinal, the index category is kappa-
small and all Y_i are kappa'-small for some kappa' < kappa, then Y is kappa-
small. For a cofiltered system of qcqs diamonds, base change gives
equivalences from the 2-colimit of the categories of finite etale, of qcqs
etale, and of quasicompact separated etale objects over the Y_i to the
corresponding categories over Y. The same statements hold for small
v-sheaves. -/
theorem LimitsAndFiniteStageComparisons : True := by sorry

/-- universally-open-presentation: Let Y be a spatial diamond. Then there is a
strictly totally disconnected perfectoid space X with a surjective and
universally open quasi-pro-etale map X -> Y that can be written as a
cofiltered inverse limit of etale maps which are composites of quasicompact
open immersions and finite etale maps; if kappa is a cutoff cardinal and Y
is kappa-small, X may be taken kappa-small. Conversely, if Y is a qcqs
diamond admitting a surjective and universally open quasi-pro-etale map from
a perfectoid space, then Y is spatial. More generally the converse holds
with the source a (locally) spatial diamond. The construction rests on the
fact that a spatial diamond, all of whose surjective etale covers that are
composites of quasicompact open immersions and finite etale maps split, is a
strictly totally disconnected perfectoid space. -/
theorem UniversallyOpenPresentation : True := by sorry

/-- two-out-of-three-for-quasi-pro-etale: Let f : Y_1 -> Y_2 and g : Y_2 -> Y_3
be maps of locally spatial diamonds with composite h. Assume f is quasi-pro-
etale and surjective, h is quasi-pro-etale, and g is separated. Then g is
quasi-pro-etale. If moreover f and h are etale, respectively finite etale,
then so is g. -/
theorem TwoOutOfThreeForQuasiProEtale : True := by sorry

/-- local-structure-of-etale-maps: Let f : Y' -> Y be an etale map of locally
spatial diamonds. Then for every point y' of |Y'| with image y, there are
open neighbourhoods V' of y' in Y' and V of y in Y containing f(V') such
that the restriction of f to V' factors as a quasicompact open immersion of
V' into some W followed by a finite etale map W -> V. This generalizes the
corresponding local structure theorem for etale maps of perfectoid spaces,
and by Convention 10.2 f is required to be locally separated, which is
necessary since the restriction is separated. -/
theorem LocalStructureOfEtaleMaps : True := by sorry

/-- spatial-v-sheaf-criterion: Let Y be a spatial v-sheaf such that there exists
a perfectoid space X with a quasi-pro-etale map f : X -> Y for which |f| :
|X| -> |Y| is surjective. Then Y is a spatial diamond. The hypothesis is
much weaker than asking f to be surjective as a map of v-sheaves: an
equivalent formulation is that for every point y of |Y| there is a quasi-
pro-etale map Spa(C, C^+) -> Y having y in its image, with C algebraically
closed. In particular the condition is only a condition on the points of Y. -/
theorem SpatialVSheafCriterion : True := by sorry

/-- relative-representability: A map f : Y' -> Y of v-stacks is representable in
diamonds if for every diamond X with a map X -> Y the fibre product Y' x_Y X
is a diamond; it is representable in (locally) spatial diamonds if for every
(locally) spatial diamond X over Y the fibre product is a (locally) spatial
diamond. For a map of diamonds that is representable in (locally) spatial
diamonds one says simply that it is a (locally) spatial map. A map is
representable in spatial diamonds exactly when it is representable in
locally spatial diamonds and qcqs. All these notions are examples of
0-truncated maps. -/
-- The predicate that all fibre products over diamonds are diamonds.
def Perf.Stack.RepresentableInDiamonds : True := by sorry

-- The corresponding predicate for locally spatial diamonds.
def Perf.Stack.RepresentableInLocallySpatialDiamonds : True := by sorry

-- The corresponding predicate for spatial diamonds.
def Perf.Stack.RepresentableInSpatialDiamonds : True := by sorry

-- Representability in spatial diamonds is representability in locally spatial diamonds together with qcqs.
theorem Perf.Stack.representableInSpatial_iff : True := by sorry

-- The three classes are stable under base change.
theorem Perf.Stack.representable_pullback : True := by sorry

-- The three descent statements, with their different surjectivity and quasiseparatedness hypotheses.
theorem Perf.Stack.representable_of_pullback : True := by sorry

-- A separated map is quasi-pro-etale exactly when it is representable in locally spatial diamonds with pro-etale geometric fibres.
theorem Perf.Stack.isQuasiProEtale_iff_fibres : True := by sorry

-- All three classes consist of 0-truncated maps.
theorem Perf.Stack.representable_isZeroTruncated : True := by sorry

example : True := by sorry -- unit test `diamond_base`: For Y a diamond, f is representable in diamonds exactly when Y' is a diamond (the degenerate case).
example : True := by sorry -- unit test `quasi_pro_etale`: A quasi-pro-etale map of locally spatial diamonds is representable in locally spatial diamonds.
example : True := by sorry -- unit test `not_representable_in_perfectoid_spaces`: A morphism of diamonds need not be representable in perfectoid spaces; the definition must not impose that (the required non-example).
example : True := by sorry -- unit test `classifying_stack`: The map from a geometric point to the classifying stack of a locally profinite group is representable in locally spatial diamonds and quasi-pro-etale.

/-- berkovich-quotient: For X = Spa(R, R^+) affinoid perfectoid and a fixed
topologically nilpotent unit varpi, the Berkovich space |X|_B is the set of
multiplicative bounded nonarchimedean seminorms on R with |varpi| = 1/2,
with the weakest topology making f mapsto |f| continuous. It is compact
Hausdorff, and |X| -> |X|_B is a continuous quotient map exhibiting |X|_B as
the maximal Hausdorff quotient of |X|; the map |X|_B -> |X| is a section but
is not continuous. The construction extends uniquely to a colimit preserving
functor Y mapsto |Y|_B on small v-sheaves, with natural transformations
|Y|_B -> |Y| -> |Y|_B composing to the identity and |Y| -> |Y|_B a
continuous quotient map; for Y qcqs, |Y|_B is compact Hausdorff and is the
maximal Hausdorff quotient of |Y|. -/
-- The functor Y mapsto |Y|_B from small v-sheaves to topological spaces.
def Perf.berkovich : True := by sorry

-- For X affinoid perfectoid, |X|_B is the space of multiplicative bounded seminorms normalised at varpi.
def Perf.berkovich_affinoid : True := by sorry

-- |X|_B is independent of the choice of topologically nilpotent unit.
theorem Perf.berkovich_indep_varpi : True := by sorry

-- For Y qcqs, |Y|_B is compact Hausdorff.
def Perf.berkovich_compactHausdorff : True := by sorry

-- |Y| -> |Y|_B is a continuous quotient map.
theorem Perf.berkovich_isQuotientMap : True := by sorry

-- The set-theoretic section |Y|_B -> |Y|, which is not continuous.
def Perf.berkovich_section : True := by sorry

-- Any continuous map from |Y| to a Hausdorff space factors uniquely through |Y|_B.
theorem Perf.berkovich_universal : True := by sorry

-- The functor preserves colimits, which is how it is extended from affinoids.
theorem Perf.berkovich_preservesColimits : True := by sorry

example : True := by sorry -- unit test `point`: For X = Spa(C, C^+), |X|_B is a point (the degenerate case).
example : True := by sorry -- unit test `disc`: For the perfectoid closed unit disc over C, |X|_B is the Berkovich closed disc; a construction that returns |X| is wrong.
example : True := by sorry -- unit test `section_not_continuous`: The section |X|_B -> |X| is not continuous, already for X = Spa(C, C^+) with C^+ not O_C (a required non-example).
example : True := by sorry -- unit test `compact_hausdorff_diamond`: For Y = T underline times Spa(K, O_K) with T compact Hausdorff, |Y|_B = T.

/-- reduction-to-spatial-and-hausdorff-cohomology: Let Y be a quasicompact
separated diamond. Then the map Y -> |Y|_B underline is representable in
locally spatial diamonds; equivalently a general quasicompact separated
diamond differs from a locally spatial one only through a map to a compact
Hausdorff space. Moreover, for f : |Y| -> |Y|_B the pullback f^* induces a
fully faithful functor from D^+(|Y|_B, Z) to D^+(|Y|, Z), so that H^i(|Y|_B,
F) is isomorphic to H^i(|Y|, f^* F) for every abelian sheaf F on |Y|_B. This
cohomological assertion is proved with ordinary sheaf cohomology, not with
the later diamond coefficient category. -/
theorem ReductionToSpatialAndHausdorffCohomology : True := by sorry

/-! ## D6 Analytic adic spaces as diamonds -/

/-- spd-of-a-tate-pair: Let Spd Z_p be the functor on Perf sending X to the set
of isomorphism classes of pairs (X sharp, iota) where X sharp is a
perfectoid space and iota is an identification of the tilt of X sharp with
X. For a Tate Z_p-algebra A with an open and integrally closed subring A^+
inside A, let Spd(A, A^+) send X to the set of isomorphism classes of pairs
consisting of such an (X sharp, iota) together with a continuous map of
pairs (A, A^+) -> (O(X sharp), O^+(X sharp)). Both are v-sheaves. Marked
untilts have no automorphisms, which is what makes these functors and not
stacks. A Tate pair must be distinguished from an arbitrary formal base such
as (Z_p, Z_p), for which no such construction is made here. -/
-- The functor on Perf of marked untilts.
def Perf.SpdZp : True := by sorry

-- Spd Z_p is a v-sheaf.
theorem Perf.SpdZp.isVSheaf : True := by sorry

-- A marked untilt has no nontrivial automorphisms, so the functor is set-valued.
theorem Perf.SpdZp.noAutomorphisms : True := by sorry

-- Spd(A, A^+) for a Tate Z_p-pair, as marked untilts together with a continuous map of pairs.
def Perf.Spd : True := by sorry

-- Spd(A, A^+) is a v-sheaf.
theorem Perf.Spd.isVSheaf : True := by sorry

-- (A, A^+) mapsto Spd(A, A^+) is a contravariant functor on Tate Z_p-pairs.
theorem Perf.Spd.functorial : True := by sorry

-- For a perfectoid pair, Spd(A, A^+) is represented by Spa of the tilt.
theorem Perf.Spd.ofPerfectoid : True := by sorry

-- For U a rational subset of Spa(A, A^+), Spd(O(U), O^+(U)) -> Spd(A, A^+) is the open subfunctor attached to U.
def Perf.Spd.rationalSubset : True := by sorry

example : True := by sorry -- unit test `perfectoid_pair`: For (A, A^+) perfectoid, Spd(A, A^+) is Spa of the tilt (the degenerate case).
example : True := by sorry -- unit test `spd_qp`: Spd Q_p is a v-sheaf that is not representable by a perfectoid space, which is the required test of this layer.
example : True := by sorry -- unit test `no_automorphisms`: The groupoid of marked untilts of a fixed X is discrete; a construction producing a nontrivial automorphism group is wrong.
example : True := by sorry -- unit test `formal_base_excluded`: (Z_p, Z_p) is not a Tate pair, so Spd(Z_p, Z_p) is not defined by this construction (a required non-example).

/-- spd-is-a-spatial-diamond: Let A be a Tate Z_p-algebra with an open and
integrally closed subring A^+ inside A. Choose a cofiltered inverse system
of finite groups G_i with surjective transition maps and a compatible
filtered direct system of finite etale G_i-torsors A -> A_i such that
A_infinity has no nonsplit finite etale covers, with A_i^+ the integral
closure of A^+ and A_infinity^+ the closure of the colimit inside the
uniform completion. Then Spd(A_i, A_i^+) -> Spd(A, A^+) is a G_i-torsor of
v-sheaves, Spd of the completion of A_infinity is the inverse limit and is a
G underline-torsor over Spd(A, A^+) for G the limit of the G_i, and it is an
affinoid perfectoid space. Hence Spd(A, A^+) is a spatial diamond with
|Spd(A, A^+)| = |Spa(A, A^+)|. -/
theorem SpdIsASpatialDiamond : True := by sorry

/-- gluing-and-the-diamond-functor: If U is a rational open subset of Spa(A,
A^+) then Spd(O(U), O^+(U)) -> Spd(A, A^+) is the open subfunctor
corresponding to U under the identification of the underlying spaces.
Consequently the functor (A, A^+) mapsto Spd(A, A^+) glues: for Y an
analytic adic space over Z_p the diamond associated with Y is the v-sheaf Y
diamond sending X in Perf to the set of isomorphism classes of triples ((X
sharp, iota), f : X sharp -> Y) where X sharp is a perfectoid space with an
identification iota of its tilt with X. The construction is functorial in Y,
compatible with restriction to open subspaces, with the relevant fibre
products, and with the tilt on perfectoid spaces. -/
-- The v-sheaf Y diamond attached to an analytic adic space Y over Z_p.
def Adic.diamond : True := by sorry

-- For Y = Spa(A, A^+) affinoid, Y diamond is Spd(A, A^+).
def Adic.diamond_affinoid : True := by sorry

-- An open immersion of analytic adic spaces induces an open immersion of diamonds, and rational subsets give the corresponding open subfunctors.
def Adic.diamond_openImmersion : True := by sorry

-- Y mapsto Y diamond is a functor from analytic adic spaces over Z_p to locally spatial diamonds.
theorem Adic.diamond_functorial : True := by sorry

-- For Y perfectoid, Y diamond is the tilt of Y; the construction extends the tilting equivalence.
theorem Adic.diamond_perfectoid : True := by sorry

-- The construction is compatible with the fibre products of analytic adic spaces over Z_p that exist.
theorem Adic.diamond_fibreProduct : True := by sorry

-- |Y diamond| = |Y| as topological spaces.
theorem Adic.diamond_space : True := by sorry

-- Y diamond is a locally spatial diamond.
theorem Adic.diamond_isLocallySpatial : True := by sorry

example : True := by sorry -- unit test `spd_qp`: Spd Q_p is the diamond of Spa(Q_p, Z_p).
example : True := by sorry -- unit test `rigid_disc`: The diamond of the rigid analytic closed unit disc over Q_p is a locally spatial diamond with the same underlying space.
example : True := by sorry -- unit test `perfectoid_disc`: For the perfectoid closed unit disc the construction returns its tilt (the degenerate case).
example : True := by sorry -- unit test `finite_etale_cover_and_rational_open`: A finite etale cover and a rational open of an affinoid go to a finite etale map and an open immersion of diamonds; a construction that does not is wrong.

/-- etale-site-comparison: Let Y be an analytic adic space over Z_p. Then Y
diamond is a locally spatial diamond with |Y diamond| = |Y|. Moreover there
are equivalences of sites between the etale site of Y diamond and the etale
site of Y, and between their finite etale sites. Both full faithfulness on
the etale categories and essential surjectivity are separate tasks. This is
an equivalence of etale categories on the already constructed diamond; it is
not full faithfulness of the diamond functor on all analytic adic spaces,
and it is not the later derived left-completion comparison. -/
theorem EtaleSiteComparison : True := by sorry

/-- untilt-descent-along-v-covers: Let X = Spa(R, R^+) be an affinoid perfectoid
space of characteristic p, Y = Spa(S, S^+) -> X a v-cover, and Y sharp =
Spa(S sharp, S sharp+) an untilt of Y such that the two induced untilts of Z
= Y x_X Y = Spa(T, T^+) agree. Then there is a unique untilt X sharp = Spa(R
sharp, R sharp+) of X whose pullback to Y is Y sharp. Concretely R sharp =
W(R^+)/xi with varpi sharp inverted, for a primitive element xi of W(R^+),
and R sharp+ is determined by R^+. -/
theorem UntiltDescentAlongVCovers : True := by sorry

end TauCeti.Diamonds
