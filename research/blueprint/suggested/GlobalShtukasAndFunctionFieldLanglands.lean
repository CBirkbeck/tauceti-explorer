/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/GlobalShtukasAndFunctionFieldLanglands.md` is definitive.
These statements suggest Lean forms so that contributors and reviewers can converge
on names and signatures. They claim no implementation.

BP-GlobalShtukasAndFunctionFieldLanglands: partial prototype,
implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No Lean toolchain at those commits was available in this session, so elaboration
has not been established and the file was not compiled.

The reviewed library audit AUDIT-20 records every layer of this roadmap as NOT
BUILT and every target but one as absent, and reading the pinned declaration index
confirms it. There is no moduli stack of bundles and no algebraic-stack formalism;
no loop group, no affine Grassmannian, nothing over powers of a curve; no perverse
sheaf, no six-functor formalism, no intersection complex; no dual group and no
L-group; no adele ring of a function field and no automorphic form over one; no
etale fundamental group of a scheme; no trace formula and no nearby cycles; no
Harder-Narasimhan filtration. Everything below is therefore new.

What the pinned libraries do have is imported and never redefined:

* Mathlib `Module.Grassmannian`, the finite-dimensional Grassmannian, which the
  audit names as the nearest notion to the affine and Beilinson-Drinfeld ones.
* Mathlib `RootPairing` and `RootPairing.flip`, the pinned root datum and its
  duality, from which the dual group has to be built.
* Mathlib `CategoryTheory.GaloisCategory` and `PreGaloisCategory`, the abstract
  Galois categories against which Drinfeld's lemma is stated.
* Mathlib `CategoryTheory.Pseudofunctor.DescentData`, `IsStack` and
  `toDescentData`, which is the descent condition and no more.
* Mathlib `AlgebraicGeometry.Scheme.ellAdicSheaf` and `Scheme.ProEt.topology`:
  ell-adic cohomology is defined and nothing is proved about it.
* Mathlib `NumberField.AdeleRing`, the adele ring of a NUMBER field.
* Tau Ceti `AlgebraicGeometry.Scheme.CartierDivisor` and
  `ReductiveCommHopfAlgCat`, reductive group schemes over a FIELD.

The Satake category, the fusion product and the dual group are imported from
GeometricSatakeAndFusion, the local shtuka moduli from HeckeStacksAndLocalShtukas,
and the Bernstein centre and the abstract semisimple parameter from
ExcursionOperatorsAndSpectralAction; they are not prototyped here. Where a
statement quantifies over an object that is requested from another roadmap the
prototype uses `True` as a placeholder, in the style of the other suggested files
of this programme.
-/
import Mathlib.Algebra.CharP.Lemmas
import Mathlib.Algebra.Lie.Semisimple.Defs
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Sites.ElladicCohomology
import Mathlib.AlgebraicGeometry.Sites.Proetale
import Mathlib.CategoryTheory.Galois.Basic
import Mathlib.CategoryTheory.Groupoid
import Mathlib.CategoryTheory.Limits.HasLimits
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.HasPullback
import Mathlib.CategoryTheory.Sites.Descent.DescentData
import Mathlib.CategoryTheory.Sites.Descent.IsStack
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Sites.SheafCohomology.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.LinearAlgebra.RootSystem.Defs
import Mathlib.NumberTheory.NumberField.AdeleRing
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.RingTheory.Grassmannian
import Mathlib.Topology.Algebra.Category.ProfiniteGrp.Basic
import Mathlib.Topology.Category.Profinite.Basic
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.AlgebraicGeometry.CartierDivisor.Basic

noncomputable section

namespace TauCeti.GlobalShtukas

universe u

/-! ## GS.0 Global G-bundles and level structures -/

/-- bun-g-of-the-global-curve: Let X be a smooth projective geometrically
irreducible curve over a finite field F_q with function field F, and let G
be a connected reductive group over F together with a chosen smooth affine
group scheme model over X. Bun_G is the Artin stack over F_q whose groupoid
of S-points, for S a scheme over F_q, classifies G-bundles over X x S. It is
locally the quotient of a smooth algebraic variety by a smooth algebraic
group, by Grothendieck's Quot construction, and the automorphism groups of
its points are algebraic groups of finite type; the automorphism groups of
the F_q-points are finite. Neither library has a moduli stack of G-bundles,
and neither has an algebraic-stack formalism in which to define one:
Mathlib's stack notion is the descent condition for a pseudofunctor on a
site, with no representability or atlas theory. -/
-- The stack of G-bundles on X, as a stack over F_q.
def FunctionField.BunG : True := by sorry

-- A G-bundle over X x S determines an S-point.
def FunctionField.BunG.ofBundle : True := by sorry

-- Bun_G satisfies fppf descent.
theorem FunctionField.BunG.isStack : True := by sorry

-- A smooth surjective map from a scheme, exhibiting Bun_G as an Artin stack.
def FunctionField.BunG.atlas : True := by sorry

-- Automorphism groups of points are affine algebraic groups of finite type.
theorem FunctionField.BunG.aut_finiteType : True := by sorry

-- Automorphism groups of F_q-points are finite.
theorem FunctionField.BunG.aut_finite_of_fqPoint : True := by sorry

-- For G = GL_1 the stack is Pic quotiented by the trivial G_m-action.
theorem FunctionField.BunG.glOne : True := by sorry

-- A morphism of group schemes over X induces a morphism of stacks.
theorem FunctionField.BunG.functorial : True := by sorry

example : True := by sorry -- unit test `gl_one`: For G = GL_1 the isomorphism classes of F_q-points are Pic(F_q); a construction that does not reproduce the Picard group is wrong.
example : True := by sorry -- unit test `trivial_bundle`: The trivial G-bundle is an F_q-point with automorphism group G(F_q), which is finite (the degenerate case).
example : True := by sorry -- unit test `not_quasicompact`: Bun_G is not quasicompact and Bun_G(F_q) is infinite unless G is a torus, so no finiteness may be built into the definition (a non-example).
example : True := by sorry -- unit test `descent`: A G-bundle given by descent data along an fppf cover of X x S is an S-point, matching the pinned DescentData API.

/-- level-structures: Let N be a finite closed subscheme of X, called a level.
Bun_{G,N} is the stack whose S-points classify a G-bundle G over X x S
together with a trivialisation psi of its restriction to N x S. The
forgetful map Bun_{G,N} -> Bun_G is a G(O_N)-torsor, where O_N is the ring
of functions on N. On F_q-points, Bun_{G,N}(F_q) is the double quotient
G(F)\G(A)/K_N with K_N the kernel of G(O) -> G(O_N), when G is split. -/
-- The stack Bun_{G,N} of G-bundles with a trivialisation along N.
def FunctionField.BunG.level : True := by sorry

-- The forgetful morphism to Bun_G.
def FunctionField.BunG.level.forget : True := by sorry

-- The forgetful morphism is a torsor under the Weil restriction of G along N.
theorem FunctionField.BunG.level_isTorsor : True := by sorry

-- The forgetful morphism is representable, smooth and surjective.
def FunctionField.BunG.level_smooth : True := by sorry

-- For N empty the two stacks agree.
theorem FunctionField.BunG.level_empty : True := by sorry

-- For N' containing N there is a smooth surjective morphism Bun_{G,N'} -> Bun_{G,N}.
theorem FunctionField.BunG.level_mono : True := by sorry

-- On F_q-points, Bun_{G,N}(F_q) = G(F)\G(A)/K_N for split G.
theorem FunctionField.BunG.level_adelic : True := by sorry

example : True := by sorry -- unit test `empty_level`: For N empty, Bun_{G,N} = Bun_G (the degenerate case).
example : True := by sorry -- unit test `torsor`: The fibre of Bun_{G,N} -> Bun_G over a point is a G(O_N)-torsor; a definition giving a different group is wrong.
example : True := by sorry -- unit test `gl_r_congruence`: For G = GL_r and N a point of degree one, K_N is the standard principal congruence subgroup, and Bun_{G,N}(F_q) is the corresponding adelic double quotient.
example : True := by sorry -- unit test `nonreduced_level`: A nonreduced N gives a strictly finer level than its reduction, so the definition must not silently replace N by its reduction (a non-example).

/-- deformation-complex-and-smoothness: For a G-bundle G on X, the adjoint
bundle ad(G) is the vector bundle associated with the adjoint representation
of G. The deformation theory of G is governed by the cohomology of ad(G) on
X: the tangent space is H^1(X, ad(G)), the obstruction space is H^2(X,
ad(G)), which vanishes since X is a curve, and the automorphisms are H^0(X,
ad(G)). Consequently Bun_G is smooth, of dimension minus the Euler
characteristic of ad(G), that is (g - 1) dim G for G semisimple over a curve
of genus g. Neither library has a cotangent complex for stacks and neither
has Lie-algebra-valued cohomology of a bundle on a curve. -/
-- The adjoint vector bundle ad(G) of a G-bundle on X.
def FunctionField.adjointBundle : True := by sorry

-- The two-term complex computing the deformations of a G-bundle.
def FunctionField.deformationComplex : True := by sorry

-- The tangent space of Bun_G at G is H^1(X, ad(G)).
theorem FunctionField.deformation_tangent : True := by sorry

-- H^2(X, ad(G)) = 0 because X is a curve.
theorem FunctionField.deformation_obstruction_vanishes : True := by sorry

-- Bun_G is smooth.
def FunctionField.BunG.smooth : True := by sorry

-- Its dimension is minus the Euler characteristic of ad(G).
theorem FunctionField.BunG.dim : True := by sorry

-- With a level N the complex is the one for ad(G) twisted by minus N.
theorem FunctionField.deformation_level : True := by sorry

-- The derivative of the Frobenius morphism of Bun_G vanishes.
theorem FunctionField.frobenius_derivative_zero : True := by sorry

example : True := by sorry -- unit test `gl_r_dimension`: For G = GL_r the dimension of Bun_G is r^2(g-1), which is negative for g = 0 and matches the stacky count.
example : True := by sorry -- unit test `torus`: For G a torus the adjoint bundle is trivial of rank dim G and Bun_G is smooth of dimension (g-1) dim G (the degenerate case).
example : True := by sorry -- unit test `frobenius_derivative`: The derivative of the Frobenius morphism of Bun_G is zero; a construction in which it is not is wrong.
example : True := by sorry -- unit test `h2_vanishes`: H^2(X, ad(G)) = 0; the same statement for a surface is false, so the curve hypothesis is not decorative (a non-example).

/-- harder-narasimhan-truncations: For a G-bundle G on X one attaches the
Harder-Narasimhan polygon of the associated G^ad-bundle, a concave polygon
with values in the coweight lattice of G^ad. For a dominant coweight mu of
G^ad the condition that the polygon is at most mu defines an open substack
Bun_G^{<= mu}, and these exhaust Bun_G. Modulo the action of a chosen
lattice Xi inside Z(F)\Z(A) of finite index, the quotient Bun_G^{<= mu}/Xi
is an algebraic stack of finite type. A grep of both pinned libraries for
Harder-Narasimhan and for semistability finds nothing relevant, so slopes
and HN filtrations of bundles do not exist there. -/
theorem HarderNarasimhanTruncations : True := by sorry

/-- automorphisms-and-the-central-lattice: The automorphism group of an F_q-
point of Bun_G is finite. Let Z be the centre of G. One fixes a subgroup Xi
of finite index in Bun_Z(F_q), equivalently a lattice Xi inside Z(F)\Z(A);
when Z is finite one may take Xi trivial. Then Xi acts on Bun_G and on the
shtuka stacks by twisting, preserves the Harder-Narasimhan truncations, and
the quotient Bun_G(F_q)/Xi is still infinite unless G is a torus. Finite
dimensionality is obtained only after restricting to cuspidal functions. -/
theorem AutomorphismsAndTheCentralLattice : True := by sorry

/-- weil-uniformization: Let G be split. Then the set of isomorphism classes of
G-bundles on X trivialised along N is the double quotient G(F)\G(A)/K_N,
where A is the ring of adeles of F, O the ring of integral adeles, O_N the
ring of functions on N and K_N the kernel of G(O) -> G(O_N). For G not
necessarily split the right-hand side must be replaced by a direct sum,
indexed by the finite pointed set ker^1(F, G) of everywhere-locally-trivial
torsor classes, of adelic double quotients for the inner forms of G. There
is no adele ring of a function field in either library. -/
theorem WeilUniformization : True := by sorry

/-- cuspidal-automorphic-forms: For a field E containing Q,
C_c(Bun_{G,N}(F_q)/Xi, E) is the E-vector space of finitely supported
functions. For a proper parabolic subgroup P of G with Levi quotient M and
unipotent radical U, the constant term along P is the map to functions on
Bun_M(F_q)/Xi given by the correspondence Bun_G <- Bun_P -> Bun_M, which
involves only finite sums; adelically it is the integral of f(ug) over
U(F)\U(A). The cuspidal subspace C^cusp_c is the intersection of the kernels
of all constant terms, and it is finite dimensional. It carries an action of
the Hecke algebra C_c(K_N\G(A)/K_N, E). There are no automorphic forms over
a function field in either library. -/
-- The space C_c(Bun_{G,N}(F_q)/Xi, E) of finitely supported functions.
def FunctionField.automorphicForms : True := by sorry

-- The constant term along a parabolic subgroup, as a map to functions on Bun_M.
def FunctionField.constantTerm : True := by sorry

-- The constant term is a finite sum, so it is defined without any convergence hypothesis.
theorem FunctionField.constantTerm_finiteSum : True := by sorry

-- The cuspidal subspace, the intersection of the kernels of the constant terms for proper parabolics.
def FunctionField.cuspidal : True := by sorry

-- The cuspidal subspace is finite dimensional.
def FunctionField.cuspidal_finiteDimensional : True := by sorry

-- It is a module over the Hecke algebra C_c(K_N\G(A)/K_N, E).
theorem FunctionField.cuspidal_heckeModule : True := by sorry

-- For a torus every function is cuspidal.
theorem FunctionField.cuspidal_torus : True := by sorry

-- The construction is compatible with extension of the coefficient field E.
theorem FunctionField.cuspidal_coefficients : True := by sorry

example : True := by sorry -- unit test `torus`: For a torus the cuspidal subspace is the whole space, which is finite dimensional (the degenerate case).
example : True := by sorry -- unit test `gl_two_constant_term`: For GL_2 there is one proper parabolic up to conjugacy and cuspidality is the vanishing of a single constant term.
example : True := by sorry -- unit test `finite_dimensional`: The cuspidal subspace is finite dimensional while the ambient space is not, unless G is a torus (the non-example that makes the restriction necessary).
example : True := by sorry -- unit test `hecke_stable`: The cuspidal subspace is stable under all Hecke operators; a definition that is not is wrong.

/-- nonsplit-descent-and-inner-forms: Let G be a connected reductive group over
F, not assumed split. The G-bundle theory above is developed by Galois
descent from a splitting field, retaining the finitely many ramified places
where the chosen smooth model is not reductive. The set of G-bundles on X
that are everywhere locally trivial is the finite pointed set ker^1(F, G),
and the adelic description becomes a direct sum over ker^1(F, G) of double
quotients for the corresponding inner forms of G. General faithfully flat
descent for modules and the fpqc and etale topologies are available in the
pinned libraries, and Tau Ceti has faithfully flat descent for points of
affine group schemes and builds nonsplit tori from Galois lattices by Galois
descent; what is absent is the descent of bundles and of the Satake data
through the L-group. -/
theorem NonsplitDescentAndInnerForms : True := by sorry

/-- picard-and-the-gl1-case: For G = GL_1 the stack Bun_{GL_1} is the quotient
of the relative Picard scheme Pic of X over F_q by the trivial action of
G_m, and Pic^0, the kernel of the degree map, is the Jacobian of X, an
abelian variety over F_q. Unramified class field theory states that there is
a canonical isomorphism from the fibre product of the abelianized
fundamental group of X with Z over the profinite completion of Z to
Pic(F_q), characterised by sending Frob_v to the class of O(v). The Lang
isogeny L from Pic to Pic^0, sending the class of a line bundle E to the
class of E^{-1} tensor the Frobenius pullback of E, is surjective with
kernel Pic(F_q); this is the geometric construction behind the isomorphism
and the rank-one case of the whole theory. -/
theorem PicardAndTheGl1Case : True := by sorry

/-! ## GS.1 Global Hecke stacks and classical geometric Satake -/

/-- beilinson-drinfeld-grassmannian: For a finite set I and an ordered partition
(I_1, ..., I_k) of I, the Beilinson-Drinfeld Grassmannian
Gr^{(I_1,...,I_k)}_I is the ind-scheme over X^I whose S-points classify legs
(x_i), a chain of G-torsors G_0 -> G_1 -> ... -> G_k over X x S with the
j-th modification an isomorphism away from the graphs of the x_i for i in
I_j, and a trivialisation theta of G_k. Equivalently the torsors may be
taken on the formal neighbourhood of the union of the graphs, and then the
Weil restriction G_{sum infinity x_i} of G along that neighbourhood acts by
changing theta. Mathlib's Module.Grassmannian is the functor of rank-n
quotients of a module, the finite-dimensional Grassmannian; there is no loop
group, no affine Grassmannian and nothing over powers of a curve. -/
-- The ind-scheme Gr^{(I_1,...,I_k)}_I over X^I.
def FunctionField.BDGrassmannian : True := by sorry

-- A chain of torsors with a trivialisation determines an S-point.
def FunctionField.BDGrassmannian.ofChain : True := by sorry

-- The comparison with the description by torsors on the formal neighbourhood of the legs.
theorem FunctionField.BDGrassmannian.formalDescription : True := by sorry

-- The smooth group scheme G_{sum n_i x_i} over S, of dimension (sum n_i) dim G.
def FunctionField.BDGrassmannian.weilRestriction : True := by sorry

-- The action of the Weil restriction by change of trivialisation, factoring through a finite level on bounded strata.
def FunctionField.BDGrassmannian.action : True := by sorry

-- Over the locus where the legs are pairwise distinct, Gr is the product of the Grassmannians of the individual legs.
theorem FunctionField.BDGrassmannian.factorisation : True := by sorry

-- The map to the coarse partition that composes the modifications.
theorem FunctionField.BDGrassmannian.forget : True := by sorry

-- For a map of finite sets, the restriction along the diagonal X^J -> X^I.
theorem FunctionField.BDGrassmannian.diagonal : True := by sorry

example : True := by sorry -- unit test `affine_grassmannian`: For I a singleton and the leg fixed at a point, the fibre is the usual affine Grassmannian G(k((z)))/G(k[[z]]).
example : True := by sorry -- unit test `factorisation`: Over the locus of pairwise distinct legs the Grassmannian for I is the product over i of the Grassmannians for singletons; a construction without this factorisation cannot produce the fusion product.
example : True := by sorry -- unit test `diagonal_restriction`: The restriction along the diagonal X -> X^I is the convolution Grassmannian for the corresponding partition (the degenerate case).
example : True := by sorry -- unit test `not_finite_dimensional`: The Beilinson-Drinfeld Grassmannian is an ind-scheme and not a scheme; Mathlib's finite-dimensional Module.Grassmannian is a different object (the required non-example).

/-- bounded-strata-and-schubert-bounds: Let W = box-product of W_i be an
irreducible representation of the I-fold product of the dual group, with
highest weights omega_i. The closed stratum Gr^{(I_1,...,I_k)}_{I,W} is the
reduced closed subscheme of Gr^{(I_1,...,I_k)}_I defined by the condition
that the relative position of G_{j-1} with respect to G_j at x_i, for i in
I_j, is bounded by the dominant coweight of G corresponding to omega_i. Over
the open locus of pairwise distinct legs this is the product of the usual
closed Schubert strata; in general the stratum is defined as the Zariski
closure of that restriction. For a reducible W, Gr_{I,W} is the union of the
strata of the irreducible constituents. -/
-- The closed stratum Gr_{I,W} attached to a representation W of the I-fold product of the dual group.
def FunctionField.BDGrassmannian.stratum : True := by sorry

-- The stratum is reduced by definition.
def FunctionField.BDGrassmannian.stratum_reduced : True := by sorry

-- It is the Zariski closure of the product of the usual closed strata over the locus of pairwise distinct legs.
theorem FunctionField.BDGrassmannian.stratum_closure : True := by sorry

-- The stratum is ind-proper, indeed proper, over X^I.
def FunctionField.BDGrassmannian.stratum_proper : True := by sorry

-- For reducible W the stratum is the union over the irreducible constituents.
def FunctionField.BDGrassmannian.stratum_union : True := by sorry

-- For n_i large the action of the Weil restriction on the stratum factors through G_{sum n_i x_i}.
theorem FunctionField.BDGrassmannian.stratum_action_level : True := by sorry

-- For W minuscule the stratum is smooth and the corresponding orbit is closed.
theorem FunctionField.BDGrassmannian.stratum_minuscule_smooth : True := by sorry

example : True := by sorry -- unit test `minuscule`: For W minuscule the stratum is smooth and the intersection complex is the shifted constant sheaf (the degenerate case).
example : True := by sorry -- unit test `gl_r_standard`: For GL_r and the standard representation, the stratum classifies modifications with elementary divisors bounded by the first fundamental coweight.
example : True := by sorry -- unit test `closure_is_needed`: The naive relative-position condition is not closed as two legs collide, so a definition that omits the Zariski closure gives a nonflat family (the required non-example).
example : True := by sorry -- unit test `reducible`: For W the sum of two irreducibles, the stratum is the union of the two strata, matching the definition on the open locus.

/-- forgetting-intermediate-modifications-is-small: The morphism from
Gr^{(I_1,...,I_k)}_{I,W} to Gr^{(I)}_{I,W} that composes the successive
modifications is proper and small. Consequently the direct image of the
intersection complex of the source is the intersection complex of the
target, and the corresponding statement for the shtuka stacks follows, so
that the cohomology sheaves defined using any ordered partition of I agree
with those defined using the coarse partition. -/
theorem ForgettingIntermediateModificationsIsSmall : True := by sorry

/-- global-hecke-stacks-and-convolution: The global Hecke stack Hecke_I
classifies a point of X^I and a modification of G-bundles at the legs; it is
a correspondence between Bun_G and Bun_G times X^I, with the two maps
remembering the source and the target bundle. Its factorised version
Hecke^{(I_1,...,I_k)}_I records a chain of modifications, and composing them
is the convolution map. There is a natural formally smooth morphism from
Hecke_I to the quotient of the Beilinson-Drinfeld Grassmannian by the Weil
restriction group scheme, which is the local model map; for shtukas it
becomes the map (0.12), which is smooth of dimension (sum n_i) dim G.
Bounded Hecke stacks are the inverse images of the bounded strata. -/
-- The stack Hecke^{(I_1,...,I_k)}_I of chains of modifications of G-bundles at the legs.
def FunctionField.HeckeStack : True := by sorry

-- The projection remembering the source bundle.
def FunctionField.HeckeStack.source : True := by sorry

-- The projection remembering the target bundle and the legs.
def FunctionField.HeckeStack.target : True := by sorry

-- The formally smooth morphism to the quotient of the Beilinson-Drinfeld Grassmannian by the Weil restriction group scheme.
def FunctionField.HeckeStack.localModel : True := by sorry

-- The bounded Hecke stack, the inverse image of the bounded stratum.
def FunctionField.HeckeStack.bounded : True := by sorry

-- The convolution map composing the modifications, compatible with the forgetful map of Grassmannians.
def FunctionField.HeckeStack.convolution : True := by sorry

-- Over the locus of pairwise distinct legs the Hecke stack is the product of the one-leg Hecke stacks.
theorem FunctionField.HeckeStack.factorisation : True := by sorry

-- Over the diagonal the Hecke stack is the convolution of the one-leg Hecke stacks.
theorem FunctionField.HeckeStack.collision : True := by sorry

-- The local model map does not factor through the quotient by the central lattice, only its composition with the quotient by the centre does.
theorem FunctionField.HeckeStack.notFactoringThroughXi : True := by sorry

example : True := by sorry -- unit test `classical_hecke`: For I a singleton, a place v and a minuscule coweight, the bounded Hecke stack is the classical correspondence of modifications at v of relative position lambda.
example : True := by sorry -- unit test `identity`: For W trivial the Hecke stack is Bun_G times X^I and both projections are the identity on the bundle (the degenerate case).
example : True := by sorry -- unit test `frobenius_graph`: Intersecting with the graph of the Frobenius morphism of Bun_{G,N} gives the shtuka stack; a construction for which this fails is wrong.
example : True := by sorry -- unit test `no_xi_factorisation`: The local model map does not descend to the quotient by the central lattice Xi, so a construction that assumes it does is wrong (the required non-example).

/-- geometric-satake-functor: For every finite set I and every ordered partition
(I_1, ..., I_k) there is an E-linear functor W mapsto
S^{(I_1,...,I_k)}_{I,W,E} from finite dimensional E-linear representations
of the I-fold product of the dual group to G-equivariant perverse E-sheaves
on Gr^{(I_1,...,I_k)}_I, for the perverse normalisation relative to X^I.
Each S_{I,W,E} is supported on the bounded stratum Gr_{I,W} and is
universally locally acyclic relative to X^I. The functor satisfies: a)
compatibility with the forgetful maps, so the sheaf for the coarse partition
is the direct image of the one for a finer partition; b) compatibility with
convolution; c) compatibility with fusion, that is, a canonical isomorphism
between the restriction along a diagonal and the sheaf for the composed
representation, functorial in W and compatible with composition; d) for
irreducible W the sheaf is the intersection complex of the bounded stratum. -/
theorem GeometricSatakeFunctor : True := by sorry

/-- modified-commutativity-and-tate-twist: The tensor structure on the Satake
category is given by the fusion product, and the fibre functor by total
cohomology. With the naive commutativity constraint the fibre functor takes
values in super vector spaces; one therefore modifies the sign rule, so that
the constraint is the one obtained if every intersection complex for
irreducible W were normalised to sit in even cohomological degree at the
generic point of its stratum. To be canonical one also twists by E(i/2) in
cohomological degree i, which requires a square root of q in the coefficient
field. With these conventions the fibre functor is tensor with values in
vector spaces and the category is equivalent to finite dimensional
representations of the dual group with its canonical pinning. -/
theorem ModifiedCommutativityAndTateTwist : True := by sorry

/-- centre-acts-trivially-on-satake-sheaves: The Weil restriction of the centre
Z of G along the formal neighbourhood of the legs acts trivially on the
Beilinson-Drinfeld Grassmannian, and therefore, by the identification of the
Satake sheaves with intersection complexes, on all the sheaves
S^{(I_1,...,I_k)}_{I,W}. Consequently these sheaves may be considered, up to
a shift, as perverse sheaves equivariant for the Weil restriction of the
adjoint group G^ad, or equivalently as perverse sheaves on the quotient of
the bounded stratum by the Weil restriction of G^ad at a finite level. -/
theorem CentreActsTriviallyOnSatakeSheaves : True := by sorry

/-- unramified-hecke-algebra-and-satake-isomorphism: For a place v of X the
spherical, or unramified, Hecke algebra H_v is the convolution algebra
C_c(G(O_v)\G(F_v)/G(O_v), E), and it acts on the cuspidal automorphic forms.
The Hecke operator T_{lambda,v} attached to a dominant coweight lambda is
pullback and pushforward along the Hecke correspondence of modifications at
v of relative position lambda. The classical Satake isomorphism is a
canonical isomorphism from the Grothendieck ring of finite dimensional
representations of the dual group to H_v, sending a class V to an element
h_{V,v} with h_{V + V'} = h_V + h_{V'} and h_{V tensor V'} = h_V h_{V'}; for
irreducible V, h_{V,v} is a combination of the T_{lambda,v} for lambda a
weight of V. The algebras H_v for distinct v commute. -/
theorem UnramifiedHeckeAlgebraAndSatakeIsomorphism : True := by sorry

/-- nonsplit-satake-descent-via-the-l-group: For G connected reductive but not
split, the dual group carries an action of the Galois group of a splitting
extension, and the relevant object is the L-group, the semidirect product of
the dual group with that Galois group. The Satake category and the sheaves
S_{I,W} are obtained by Galois descent from a splitting extension, the
representations W being representations of the I-fold product of the
L-group; the Satake isomorphism at an unramified place is then an
isomorphism onto the unramified Hecke algebra of the quasisplit inner form.
There is no dual group and no L-group in either library. -/
theorem NonsplitSatakeDescentViaTheLGroup : True := by sorry

/-! ## GS.2 Shtuka stacks, modifications and truncations -/

/-- global-shtuka-stack: Fix a level N, a finite set I, an irreducible
representation W = box-product of W_i of the I-fold product of the dual
group, and an ordered partition (I_1, ..., I_k) of I. The stack
Cht^{(I_1,...,I_k)}_{N,I,W} is the reduced Deligne-Mumford stack whose
S-points classify legs x_i in (X minus N)(S), bundles with level structure
(G_0, psi_0), ..., (G_{k-1}, psi_{k-1}) in Bun_{G,N}(S), with (G_k, psi_k)
set to be the Frobenius twist (tau G_0, tau psi_0) where tau G denotes the
pullback along Id_X times Frob_S, and isomorphisms phi_j from G_{j-1} to G_j
away from the graphs of the x_i for i in I_j, bounded at x_i by the dominant
coweight corresponding to the dominant weight of W_i, and compatible with
the level structures. The direction of the modification is from G_0 to its
Frobenius twist and not the other way. Neither library has a notion of
bundle modification or of shtuka. -/
-- The reduced Deligne-Mumford stack Cht^{(I_1,...,I_k)}_{N,I,W} of global shtukas.
def FunctionField.Shtuka : True := by sorry

-- Legs, a chain of bundles with level structure and bounded modifications to the Frobenius twist determine an S-point.
def FunctionField.Shtuka.ofData : True := by sorry

-- The morphism to (X minus N)^I remembering the legs.
theorem FunctionField.Shtuka.legs : True := by sorry

-- The ind-stack with no condition on relative positions.
def FunctionField.Shtuka.unbounded : True := by sorry

-- The bounded stack is the inverse image of the bounded stratum under the local model map.
theorem FunctionField.Shtuka.bounded_eq_preimage : True := by sorry

-- The automorphism groups of geometric points are finite.
def FunctionField.Shtuka.isDeligneMumford : True := by sorry

-- Cht_{N,I,W} is a G(O_N)-torsor over the restriction of Cht_{I,W}.
theorem FunctionField.Shtuka.levelTorsor : True := by sorry

-- For I empty and W trivial the stack is the discrete stack Bun_{G,N}(F_q).
theorem FunctionField.Shtuka.emptyLegs : True := by sorry

-- Cht is the intersection of the Hecke stack with the graph of the Frobenius morphism of Bun_{G,N}.
theorem FunctionField.Shtuka.heckeGraph : True := by sorry

example : True := by sorry -- unit test `empty_legs`: For I empty and W trivial, Cht is the discrete stack Bun_{G,N}(F_q) (the degenerate case that identifies the cohomology with automorphic forms).
example : True := by sorry -- unit test `drinfeld_gl_r`: For GL_r, I of size two and W = St box St^*, the two partitions give Drinfeld's left and right shtukas.
example : True := by sorry -- unit test `direction_matters`: Reversing the direction of phi gives a different stack; a definition that does not fix the direction is wrong (the required non-example).
example : True := by sorry -- unit test `trivial_bound`: For W trivial the stack Cht_{N,I,1}/Xi is the constant stack G(F)\G(A)/K_N over (X minus N)^I.

/-- truncations-and-finite-type: For a dominant coweight mu of G^ad,
Cht^{(I_1,...,I_k), <= mu}_{N,I,W} is the open substack where the Harder-
Narasimhan polygon of G_0 is at most mu. The central lattice Xi acts by
twisting and preserves these open substacks, and the quotient
Cht^{(I_1,...,I_k), <= mu}_{N,I,W}/Xi is a Deligne-Mumford stack of finite
type over (X minus N)^I; as soon as the degree of N is large enough as a
function of mu it is even a scheme of finite type, so that only the etale
cohomology of schemes is needed. The action of a partial Frobenius morphism
or of a Hecke operator increases mu by a bounded amount. -/
theorem TruncationsAndFiniteType : True := by sorry

/-- local-model-map-and-smoothness: The morphism from
Cht^{(I_1,...,I_k)}_{N,I,W} to the quotient of the bounded Beilinson-
Drinfeld stratum by the Weil restriction group scheme G_{sum n_i x_i}, for
integers n_i large enough as a function of W, is smooth of dimension (sum_{i
in I} n_i) dim G. Consequently, composing with the forgetful map to the
quotient by the adjoint Weil restriction, the map factors through the
quotient by the central lattice Xi. This local model is not smooth as a map
to a smooth target unless all the I_j are singletons and all the coweights
are minuscule. -/
theorem LocalModelMapAndSmoothness : True := by sorry

/-- cohomology-sheaves-of-shtuka-stacks: For a partition (I_1, ..., I_k) of I
one defines the perverse sheaf F^{(I_1,...,I_k)}_{N,I,W,Xi,E} on
Cht^{(I_1,...,I_k)}_{N,I,W}/Xi, with the perverse normalisation relative to
(X minus N)^I, as the inverse image of the Satake sheaf
S^{(I_1,...,I_k)}_{I,W,E} under the local model map to the quotient by the
adjoint Weil restriction. One then defines H^{0, <= mu, E}_{N,I,W} as the
degree-zero part of the derived pushforward with compact supports of the
restriction of that perverse sheaf to the truncation. The definition does
not depend on the choice of partition, and for W irreducible the perverse
sheaf is the intersection complex of the truncated quotient, so the
construction refines and makes canonical the naive definition by
intersection complexes. -/
-- The perverse sheaf F_{N,I,W,Xi,E} on the quotient of the shtuka stack by Xi, pulled back from the Satake sheaf.
def FunctionField.Shtuka.satakeSheaf : True := by sorry

-- The constructible sheaf H^{0, <= mu, E}_{N,I,W} on (X minus N)^I.
def FunctionField.Shtuka.cohomologySheaf : True := by sorry

-- W mapsto H^{0, <= mu, E}_{N,I,W} is an E-linear functor, with H(u) attached to a morphism u of representations.
theorem FunctionField.Shtuka.cohomologySheaf_functorial : True := by sorry

-- The definition does not depend on the chosen ordered partition of I.
theorem FunctionField.Shtuka.cohomologySheaf_partition_indep : True := by sorry

-- For W irreducible the perverse sheaf is the intersection complex of the truncated quotient.
theorem FunctionField.Shtuka.satakeSheaf_irreducible : True := by sorry

-- For I empty and W trivial the limit over mu is the space of automorphic forms of level N.
theorem FunctionField.Shtuka.cohomologySheaf_empty : True := by sorry

-- Each H^{0, <= mu, E}_{N,I,W} is a constructible E-sheaf on (X minus N)^I.
def FunctionField.Shtuka.cohomologySheaf_constructible : True := by sorry

-- The transition maps of the inductive system in mu.
def FunctionField.Shtuka.transition : True := by sorry

example : True := by sorry -- unit test `empty_case`: For I empty and W trivial the inductive limit is C_c(G(F)\G(A)/K_N, E).
example : True := by sorry -- unit test `partition_independence`: The sheaf computed with the coarse partition and with any finer one is the same; a construction for which this fails cannot carry the partial Frobenius action.
example : True := by sorry -- unit test `irreducible_is_ic`: For W irreducible the pulled back sheaf is the intersection complex; for reducible W it is the direct sum over the constituents (the degenerate case).
example : True := by sorry -- unit test `functoriality_in_W`: A morphism of representations induces a morphism of sheaves; attaching a sheaf only to isomorphism classes is not enough (the required non-example).

/-- partial-frobenius-morphisms: For an ordered partition (I_1, ..., I_k) of I
the partial Frobenius morphism Fr^{(I_1,...,I_k)}_{I_1} from
Cht^{(I_1,...,I_k)}_{N,I,W} to Cht^{(I_2,...,I_k,I_1)}_{N,I,W} sends a chain
(G_0, ..., G_{k-1}) with modifications phi_j to the chain (G_1, ...,
G_{k-1}, tau G_0) with the modifications shifted and tau phi_1 appended, and
moves the legs indexed by I_1 by the Frobenius of X. It lies above the
morphism Frob_{I_1} of (X minus N)^I. It is a totally radicial local
homeomorphism, so it identifies the intersection complexes, and proper base
change gives morphisms F_{I_1} from the Frobenius pullback of H^{0, <= mu,
E}_{N,I,W} to H^{0, <= mu + kappa, E}_{N,I,W}. Taking I_1 a singleton gives
the maps F_{i}; they commute with each other and their product over i in I
is the natural action of the total Frobenius. -/
-- The morphism Fr^{(I_1,...,I_k)}_{I_1} of shtuka stacks.
def FunctionField.Shtuka.partialFrobenius : True := by sorry

-- It lies above the partial Frobenius morphism Frob_{I_1} of (X minus N)^I.
theorem FunctionField.Shtuka.partialFrobenius_over : True := by sorry

-- It is a totally radicial local homeomorphism, so it identifies the intersection complexes.
def FunctionField.Shtuka.partialFrobenius_radicial : True := by sorry

-- The induced morphism F_{i} of cohomology sheaves, raising the truncation by kappa.
def FunctionField.Shtuka.F : True := by sorry

-- The F_{i} commute with each other.
theorem FunctionField.Shtuka.F_comm : True := by sorry

-- Their product over i in I is the natural action of the total Frobenius.
theorem FunctionField.Shtuka.F_prod : True := by sorry

-- For I a singleton the partial Frobenius is the total Frobenius.
theorem FunctionField.Shtuka.F_singleton : True := by sorry

-- The coalescence isomorphism intertwines the pullback of F_{zeta^{-1}(j)} with F_{j}.
theorem FunctionField.Shtuka.F_coalescence : True := by sorry

example : True := by sorry -- unit test `singleton`: For I a singleton, F_{i} is the natural Frobenius action (the degenerate case).
example : True := by sorry -- unit test `product`: The product of the F_{i} over i in I is the total Frobenius; a construction for which the product is something else is wrong.
example : True := by sorry -- unit test `commutation`: The F_{i} commute; this is what Drinfeld's lemma needs and is not automatic.
example : True := by sorry -- unit test `needs_finer_partition`: The partial Frobenius does not exist as a morphism of Cht^{(I)}_{N,I,W} to itself, only between stacks for different orderings, so a construction that defines it on the coarse stack is wrong (a non-example).

/-- coalescence-isomorphisms: For a map zeta from I to J let Delta_zeta be the
corresponding diagonal morphism from X^J to X^I and let W_zeta be the
representation of the J-fold product of the dual group obtained by composing
W with the diagonal morphism from the J-fold to the I-fold product of the
dual group. There is a canonical isomorphism chi_zeta from the pullback
along Delta_zeta of H^{0, <= mu, E}_{N,I,W} to H^{0, <= mu, E}_{N,J,W_zeta},
functorial in W and compatible with composition of maps of finite sets. It
is defined, through proper base change, by the canonical isomorphism between
the perverse sheaf for J and the pullback of the one for I along the
inclusion of shtuka stacks, which comes from part c) of the Satake theorem.
Moreover chi_zeta intertwines the pullback of the partial Frobenius indexed
by the fibre of zeta over j with the partial Frobenius indexed by j. -/
theorem CoalescenceIsomorphisms : True := by sorry

/-- hecke-correspondences-on-shtuka-stacks: For a function f in C_c(K_N \ G(A) /
K_N, E), for kappa large enough as a function of W and f, and for every mu,
there is a morphism T(f) from H^{0, <= mu, E}_{N,I,W} restricted to (X minus
P)^I to H^{0, <= mu + kappa, E}_{N,I,W} restricted to (X minus P)^I, where P
is a finite set of places containing the support of N outside which f is
trivial. These are morphisms of constructible sheaves, called Hecke
operators, and they are obtained from Hecke correspondences between shtuka
stacks. For I empty and W trivial they are the usual Hecke operators on
automorphic forms. They are extended to morphisms of sheaves on all of (X
minus N)^I only after the identification of a Hecke operator with a
creation-Frobenius-annihilation composite, which is GS.3's business. -/
-- The correspondence Gamma^{(I)} of pairs of shtukas related by a modification at v of prescribed relative position.
def FunctionField.Shtuka.heckeCorrespondence : True := by sorry

-- Both projections of the correspondence are finite etale.
def FunctionField.Shtuka.heckeCorrespondence_finiteEtale : True := by sorry

-- The Hecke operator T(f) as a morphism of cohomology sheaves over (X minus P)^I.
def FunctionField.Shtuka.T : True := by sorry

-- T is compatible with the product of the Hecke algebra.
theorem FunctionField.Shtuka.T_comp : True := by sorry

-- For I empty and W trivial, T(f) is the classical Hecke operator on automorphic forms.
theorem FunctionField.Shtuka.T_empty : True := by sorry

-- T(f) raises the truncation by an amount bounded in terms of W and f.
def FunctionField.Shtuka.T_truncation : True := by sorry

-- T(f) commutes with the partial Frobenius morphisms.
theorem FunctionField.Shtuka.T_commutes_partialFrobenius : True := by sorry

example : True := by sorry -- unit test `classical`: For I empty and W trivial the operators are the classical Hecke operators.
example : True := by sorry -- unit test `unit`: The characteristic function of K_N acts as the identity (the degenerate case).
example : True := by sorry -- unit test `commutation`: Hecke operators at distinct places commute.
example : True := by sorry -- unit test `restriction_is_needed`: The naive construction only gives a morphism over (X minus P)^I; asserting it on all of (X minus N)^I without Proposition 0.16 is wrong (the required non-example).

/-- elliptic-sheaf-realisation: For G = GL_r and suitable legs and bounds, a
global shtuka is the same datum as a rank-r elliptic sheaf in the sense of
Drinfeld and of Laumon-Rapoport-Stuhler: a chain of vector bundles with
modifications and an isomorphism with the Frobenius pullback, shifted by a
fixed line bundle. This realisation is owned by
DrinfeldModulesAndTModules:DM.7 and is imported here, not planned again. The
accepted restructuring RS-22 records that it is an optional specialised
realisation and not a prerequisite of this layer. -/
theorem EllipticSheafRealisation : True := by sorry

/-! ## GS.3 Cohomology, correspondences and cuspidal sectors -/

/-- creation-and-annihilation-morphisms: Let I and J be finite sets, W a
representation of the I-fold product of the dual group, U a representation
of the J-fold product, and x in U and xi in U^* invariant under the diagonal
action of the dual group. Write zeta_J for the map from J to a singleton.
The creation morphism C^sharp_x is the composite of the coalescence
isomorphism for the inclusion of I into the disjoint union of I and a
singleton, the map induced by the morphism of representations Id_W box x,
and the inverse of the coalescence isomorphism for the map from the disjoint
union of I and J to that of I and a singleton. The annihilation morphism
C^flat_xi is the composite in the opposite direction, using Id_W box xi.
Both are morphisms of sheaves on (X minus N)^I times (X minus N): the legs
indexed by I are unchanged and the legs indexed by J are created,
respectively annihilated, at one and the same point of the curve. -/
-- The creation morphism C^sharp_x attached to a diagonally invariant vector x.
def FunctionField.Shtuka.create : True := by sorry

-- The annihilation morphism C^flat_xi attached to a diagonally invariant covector xi.
def FunctionField.Shtuka.annihilate : True := by sorry

-- Both are functorial in W and in U.
theorem FunctionField.Shtuka.create_functorial : True := by sorry

-- For J empty the creation morphism is the identity.
theorem FunctionField.Shtuka.create_empty : True := by sorry

-- The creation and annihilation morphisms intertwine the natural Frobenius action on the created legs with the product of the corresponding partial Frobenius morphisms.
theorem FunctionField.Shtuka.create_frobenius : True := by sorry

-- Composing creation with annihilation for the coevaluation and evaluation of a representation gives the operator attached to that representation.
theorem FunctionField.Shtuka.create_annihilate_comp : True := by sorry

example : True := by sorry -- unit test `empty_creation`: For J empty the creation morphism is the identity (the degenerate case).
example : True := by sorry -- unit test `coevaluation`: For J of size two, U = V tensor V^*, x the coevaluation and xi the evaluation, the composite with a partial Frobenius is the Hecke operator at v.
example : True := by sorry -- unit test `invariance_required`: For x not invariant under the diagonal dual group the composite is not defined, since x is not a morphism of representations (the required non-example).
example : True := by sorry -- unit test `frobenius_intertwining`: The morphisms intertwine the Frobenius action on the created legs with the product of the partial Frobenius morphisms; a construction for which this fails breaks the descent in Definition 0.15.

/-- hecke-operator-as-creation-frobenius-annihilation: Let v be a place outside
N and V an irreducible representation of the dual group. Define S_{V,v} as
the composite of the creation morphism for the coevaluation of V, the
deg(v)-th power of the partial Frobenius at the first created leg, and the
annihilation morphism for the evaluation of V, all restricted to the locus
where the two created legs sit at v; by descent along Z/deg(v)Z it is a
morphism of sheaves on (X minus N)^I. Then the restriction of S_{V,v} to (X
minus (N union v))^I is equal to the Hecke operator T(h_{V,v}). Consequently
every Hecke operator T(f) extends naturally to a morphism of sheaves on all
of (X minus N)^I, compatibly with composition. -/
theorem HeckeOperatorAsCreationFrobeniusAnnihilation : True := by sorry

/-- eichler-shimura-relation: Let I and W be as above and let V be an
irreducible representation of the dual group. Then the deg(v)-th power of
the partial Frobenius at a leg indexed by a singleton, acting on the
inductive limit over mu of the cohomology sheaves for the representation W
box V restricted to (X minus N)^I times v, is annihilated by a polynomial of
degree dim V whose coefficients are the restrictions of the morphisms
S^i_{V,v}. Precisely, the alternating sum over i from 0 to dim V of the i-th
power of that partial Frobenius composed with S^{dim V - i}_{V,v},
restricted to (X minus N)^I times v, vanishes. -/
theorem EichlerShimuraRelation : True := by sorry

/-- hecke-finiteness: Let x bar be a geometric point of (X minus N)^I. An
element of the fibre at x bar of the inductive limit over mu of the
cohomology sheaves is Hecke-finite if it belongs to a finitely generated
O_E-submodule of that fibre stable under T(f) for every f in C_c(K_N \ G(A)
/ K_N, O_E). The Hecke-finite elements form an E-subspace, stable under the
fundamental group of the point and under the Hecke algebra with coefficients
in E. Hecke-finiteness is a technical but crucial condition: it is what
produces a finite-dimensional object out of the infinite-dimensional
cohomology of the truncations. -/
-- The predicate on an element of the fibre of the cohomology at a geometric point.
def FunctionField.Shtuka.HeckeFinite : True := by sorry

-- The E-subspace of Hecke-finite elements.
def FunctionField.Shtuka.heckeFinitePart : True := by sorry

-- It is an E-subspace, not merely an O_E-submodule.
def FunctionField.Shtuka.heckeFinite_subspace : True := by sorry

-- It is stable under the fundamental group of the point.
def FunctionField.Shtuka.heckeFinite_pi1Stable : True := by sorry

-- It is stable under the Hecke algebra with coefficients in E.
def FunctionField.Shtuka.heckeFinite_heckeStable : True := by sorry

-- For I empty and W trivial, a cuspidal function is Hecke-finite.
theorem FunctionField.Shtuka.heckeFinite_of_cuspidal : True := by sorry

-- Conversely a Hecke-finite function on Bun_{G,N}(F_q) is cuspidal.
theorem FunctionField.Shtuka.cuspidal_of_heckeFinite : True := by sorry

example : True := by sorry -- unit test `cuspidal`: For I empty and W trivial, Hecke-finiteness is exactly cuspidality.
example : True := by sorry -- unit test `integral_coefficients`: The definition uses O_E-modules of finite type; replacing O_E by E makes the condition vacuous (the required non-example).
example : True := by sorry -- unit test `stable_under_galois`: The Hecke-finite part is stable under the fundamental group; a definition for which it is not cannot carry a Galois action.
example : True := by sorry -- unit test `zero`: The zero subspace is Hecke-finite, and the whole fibre is not, unless the cohomology is already finite dimensional (the degenerate case).

/-- hecke-finite-part-is-a-union-of-constructible-subsheaves: The Hecke-finite
part of the fibre of the inductive limit of the cohomology sheaves at a
geometric generic point of (X minus N)^I is the union of the fibres of the
O_E-submodules M = G restricted to that point, where G runs over the
constructible O_E-subsheaves of the inductive limit over the generic point
that are stable under the action of the partial Frobenius morphisms. -/
theorem HeckeFinitePartIsAUnionOfConstructibleSubsheaves : True := by sorry

/-- specialisation-is-an-isomorphism-on-hecke-finite-parts: Fix an algebraic
closure of F, a geometric generic point eta bar of X and a geometric point
eta bar^I above the generic point of X^I together with a specialisation
arrow from eta bar^I to the image of eta bar under the diagonal. The
specialisation homomorphism from the fibre of the inductive limit of the
cohomology sheaves at the diagonal geometric point to its fibre at eta bar^I
restricts to an isomorphism on Hecke-finite parts. Consequently one may
define H_{I,W} as the Hecke-finite part of the fibre at the diagonal
geometric point, which is the more canonical of the two and does not depend
on the choice of eta bar^I and of the specialisation arrow. -/
theorem SpecialisationIsAnIsomorphismOnHeckeFiniteParts : True := by sorry

/-- cuspidality-equals-hecke-finiteness: For I empty and W trivial, the Hecke-
finite part of C_c(G(F)\G(A)/K_N, E) is exactly the subspace of cuspidal
automorphic forms. Consequently H_{empty, 1} is the space of cuspidal
automorphic forms of level N with coefficients in E. -/
theorem CuspidalityEqualsHeckeFiniteness : True := by sorry

/-- the-functor-H-I-W: Define H_{I,W} as the Hecke-finite part of the fibre of
the inductive limit of the cohomology sheaves at the image under the
diagonal of a geometric generic point of X. Then: a) for every finite set I,
W mapsto H_{I,W} and u mapsto H(u) is an E-linear functor from finite
dimensional representations of the I-fold product of the dual group to
inductive limits of finite dimensional continuous representations of the
I-fold product of the Galois group of F; b) for every map zeta from I to J
there is an isomorphism chi_zeta from H_{I,W} to H_{J,W_zeta}, functorial in
W, equivariant for the J-fold product of the Galois group acting on the
source through the diagonal, and compatible with composition; c) for I empty
and W trivial, H_{empty, 1} is the space of cuspidal automorphic forms of
level N. All the H_{I,W} are modules over the Hecke algebra compatibly with
a), b) and c). -/
-- The E-vector space H_{I,W}, the Hecke-finite part at the diagonal geometric generic point.
def FunctionField.HIW : True := by sorry

-- W mapsto H_{I,W} is an E-linear functor, with H(u) attached to a morphism of representations.
theorem FunctionField.HIW.functor : True := by sorry

-- The continuous action of the I-fold product of the Galois group of F.
def FunctionField.HIW.galoisAction : True := by sorry

-- The coalescence isomorphism chi_zeta attached to a map of finite sets.
def FunctionField.HIW.chi : True := by sorry

-- chi_zeta is equivariant for the J-fold product of the Galois group acting diagonally on the source.
theorem FunctionField.HIW.chi_equivariant : True := by sorry

-- chi is compatible with composition of maps of finite sets.
theorem FunctionField.HIW.chi_comp : True := by sorry

-- H_{empty, 1} is the space of cuspidal automorphic forms of level N.
theorem FunctionField.HIW.empty : True := by sorry

-- Each H_{I,W} is a module over the Hecke algebra, compatibly with the three properties.
theorem FunctionField.HIW.heckeModule : True := by sorry

example : True := by sorry -- unit test `empty`: H_{empty, 1} is the cuspidal automorphic forms (the degenerate case that anchors the whole theory).
example : True := by sorry -- unit test `trivial_representation`: For W trivial, H_{I,1} is H_{empty,1} with the trivial Galois action, by b) applied to the map from the empty set.
example : True := by sorry -- unit test `functoriality`: A morphism of representations induces a Galois-equivariant morphism; a construction attaching spaces only to isomorphism classes is wrong.
example : True := by sorry -- unit test `not_known_finite_dimensional`: H_{I,W} is only known to be an inductive limit of finite dimensional continuous representations; asserting finite dimensionality in general is not proved (the required non-example).

/-- conjectural-decomposition-and-the-multiplicity-spaces: One conjectures that
there is a finite set of semisimple Langlands parameters, depending on N,
and for each such sigma an E-linear representation A_sigma of the
centraliser S_sigma of the image of sigma in the dual group, trivial on the
centre of the dual group, such that for every I and W one has an isomorphism
of H_{I,W} with the direct sum over sigma of the S_sigma-invariants of
A_sigma tensor the representation of the I-fold product of the Galois group
obtained by composing W with sigma. The isomorphism should be one of Hecke
modules, functorial in W and compatible with the coalescence isomorphisms,
and for I empty and W trivial it should be the decomposition of the main
theorem with H_sigma the S_sigma-invariants of A_sigma. This conjecture is
not proved, and following an idea of Drinfeld one can only show that
properties a) and b) imply a decomposition close to it, expressed by a sheaf
of modules on the stack of Langlands parameters rather than by the finite
family of the A_sigma. -/
theorem ConjecturalDecompositionAndTheMultiplicitySpaces : True := by sorry

/-! ## GS.4 Partial Frobenius and Drinfeld lemma -/

/-- drinfeld-lemma-for-finite-etale-coverings: Let U be a dense open subscheme
of X and I a finite set. For i in I let Frob_i be the partial Frobenius
morphism of U^I which applies the Frobenius of U to the i-th coordinate and
the identity to the others. Then there is an equivalence of categories
between the category of finite sets endowed with a continuous action of the
I-fold product of the etale fundamental group of U at a geometric point, and
the category of finite etale coverings of U^I equipped with partial
Frobenius morphisms, that is, morphisms above each Frob_i, commuting with
each other and whose composite is the total Frobenius of the covering.
Neither library has an etale fundamental group of a scheme; Mathlib has
abstract Galois categories with fibre functors and a recognition theorem for
their fundamental group, and finite etale algebras with a fibre functor at a
geometric point, but no Galois-category structure on finite etale coverings
of a scheme. -/
theorem DrinfeldLemmaForFiniteEtaleCoverings : True := by sorry

/-- drinfeld-lemma-for-lisse-sheaves: Let E be a constructible lisse O_E-sheaf
on a dense open subscheme of (X minus N)^I equipped with an action of the
partial Frobenius morphisms, that is, with isomorphisms from the pullback
along Frob_i of its restriction to the generic point to itself, commuting
with each other and whose composite is the natural isomorphism for the total
Frobenius. Then E extends to a lisse sheaf on U^I for a small enough dense
open U of X minus N, and its fibre at the image of a geometric generic point
of X under the diagonal carries an action of the I-fold product of the etale
fundamental group of U. Moreover, for fixed U, the functor sending such a
sheaf to that fibre is an equivalence from the category of constructible
lisse O_E-sheaves on U^I with an action of the partial Frobenius morphisms
to the category of continuous representations of the I-fold product of the
fundamental group on finitely generated O_E-modules, compatibly with
coalescence. -/
theorem DrinfeldLemmaForLisseSheaves : True := by sorry

/-- galois-action-on-hecke-finite-cohomology: There is an increasing union,
indexed by the natural numbers, of constructible O_E-subsheaves F_lambda of
the inductive limit of the cohomology sheaves over the generic point of (X
minus N)^I, stable under the partial Frobenius morphisms, and a decreasing
sequence of dense opens U_lambda of X minus N such that F_lambda extends to
a lisse sheaf on U_lambda^I, whose union of fibres at a geometric generic
point is the Hecke-finite part. Applying Drinfeld's lemma to each F_lambda
gives H_{I,W} a continuous action of the I-fold product of the Galois group
of F as an inductive limit of finite dimensional continuous representations,
and that action is canonical. -/
theorem GaloisActionOnHeckeFiniteCohomology : True := by sorry

/-- coalescence-is-galois-equivariant: For every map zeta from I to J the
coalescence isomorphism chi_zeta from H_{I,W} to H_{J,W_zeta} is equivariant
for the J-fold product of the Galois group, acting on the source through the
diagonal morphism sending a tuple indexed by J to the tuple indexed by I
obtained by composing with zeta. The reason is that if the sequence F_lambda
realises the Hecke-finite part for I and W, then the sequence of pullbacks
along the diagonal morphism realises it for J and W_zeta, so the two Galois
actions are the two sides of the same instance of Drinfeld's lemma. -/
theorem CoalescenceIsGaloisEquivariant : True := by sorry

/-- compatibility-of-coalescence-with-partial-frobenius: For a map zeta from I
to J and j in J, the pullback along the diagonal morphism of the partial
Frobenius indexed by the fibre of zeta over j corresponds, under the
coalescence isomorphism chi_zeta, to the partial Frobenius indexed by j. The
proof is that the coalescence isomorphism may be computed using any ordered
partition of J, in particular one whose blocks are unions of fibres of zeta. -/
theorem CompatibilityOfCoalescenceWithPartialFrobenius : True := by sorry

/-- creation-annihilation-commute-with-hecke-and-frobenius: As a morphism of
constructible sheaves on the product of (X minus N)^I with a place v, the
operator S_{V,v} commutes with the natural action of the Frobenius morphism
on the constant sheaf at v. Indeed the creation and annihilation morphisms
intertwine that action with the action of the partial Frobenius indexed by
the two created legs, and the deg(v)-th power of the partial Frobenius at
the first created leg commutes with the product of the partial Frobenius
morphisms at both. Consequently S_{V,v} descends along Z/deg(v)Z to a
morphism of sheaves on (X minus N)^I, which is Definition 0.15. Moreover
creation and annihilation commute with the Hecke operators, so the Hecke-
finite part is stable under all of these operations. -/
theorem CreationAnnihilationCommuteWithHeckeAndFrobenius : True := by sorry

/-- specialisation-and-independence-of-legs: The fibre functor at the image
under the diagonal of a geometric generic point of X is related to the fibre
functor at a geometric generic point of (X minus N)^I by a chosen
specialisation arrow, and on Hecke-finite parts the specialisation
homomorphism is an isomorphism. The Galois action obtained from Drinfeld's
lemma is independent of these choices, and the coalescence isomorphisms are
compatible with them. Consequently the legs may be specialised independently
of one another and then brought back together, which is precisely the
operation the excursion operators perform, and the resulting endomorphisms
of H_{{0}, 1} do not depend on any of the auxiliary choices. -/
theorem SpecialisationAndIndependenceOfLegs : True := by sorry

/-! ## GS.5 Excursions and general reductive parameters -/

/-- excursion-operator: Let I be a finite set, W a finite dimensional E-linear
representation of the I-fold product of the dual group, zeta_I the map from
I to a singleton, and x in W and xi in W^* invariant under the diagonal
action of the dual group, regarded as morphisms of representations from the
trivial representation to W_{zeta_I} and back. Let (gamma_i) be a tuple of
elements of the Galois group of F indexed by I. The excursion operator
S_{I,W,x,xi,(gamma_i)} is the endomorphism of H_{{0}, 1} obtained as the
composite of H(x), the inverse of the coalescence isomorphism chi_{zeta_I},
the action of the tuple (gamma_i), the coalescence isomorphism chi_{zeta_I},
and H(xi). It is a creation operator, which creates legs at one and the same
generic point of the curve, followed by a Galois action, which walks the
legs on the curve independently of one another and then brings them back to
the same generic point, followed by an annihilation operator. -/
-- The excursion operator attached to I, W, x, xi and a tuple of Galois elements.
def FunctionField.excursion : True := by sorry

-- It is an endomorphism of H_{{0},1} as a module over the Hecke algebra.
def FunctionField.excursion_isHeckeLinear : True := by sorry

-- It is functorial in W, in the sense that transporting x and xi along a morphism of representations does not change the operator.
theorem FunctionField.excursion_functorial : True := by sorry

-- For I a singleton and gamma the identity, the operator is multiplication by the pairing of xi with x.
theorem FunctionField.excursion_trivial : True := by sorry

-- For I of size two, W = V box V^*, the coevaluation and the evaluation, and the tuple (Frob_v, 1), the operator is the unramified Hecke operator T(h_{V,v}).
theorem FunctionField.excursion_hecke : True := by sorry

-- The operator depends only on I, the tuple of Galois elements and the invariant function attached to W, x and xi.
theorem FunctionField.excursion_depends_on_f : True := by sorry

-- For fixed I and invariant function, the map from the I-fold product of the Galois group to the excursion algebra is continuous for the ell-adic topology.
def FunctionField.excursion_continuous : True := by sorry

example : True := by sorry -- unit test `hecke`: The unramified Hecke operator at v is the excursion operator with two legs and the tuple (Frob_v, 1).
example : True := by sorry -- unit test `one_leg`: For I a singleton and gamma the identity the operator is a scalar (the degenerate case).
example : True := by sorry -- unit test `two_legs_not_enough`: For some groups G there are nonconjugate parameters with the same characters of all H_v, so the excursion operators with two legs do not generate the whole algebra (the required non-example, due to Blasius and Lapid).
example : True := by sorry -- unit test `invariance_required`: For x not diagonally invariant the composite is not defined; the definition must not drop the invariance hypothesis.

/-- excursion-relations: The excursion operators satisfy the following
relations, all of which are formal consequences of properties a) and b) of
the functor H. First, for a morphism u of representations of the I-fold
product of the dual group, the operator for W with x and the transpose of u
applied to xi' equals the operator for W' with u applied to x and xi'.
Second, for a map zeta from I to J, the operator for J and W_zeta with the
tuple indexed by J equals the operator for I and W with the tuple obtained
by composing with zeta. Third, for a disjoint union of index sets the
operator for the box product of representations and of vectors is the
composite of the two operators. Fourth, the operator for the tuple whose
i-th entry is gamma_i times the inverse of gamma'_i times gamma''_i equals
the operator for the threefold disjoint union with the representation W box
W^* box W, the vector given by the coevaluation and x, and the covector
given by xi and the evaluation. -/
theorem ExcursionRelations : True := by sorry

/-- invariant-functions-and-the-index-f: The functions on the I-fold product of
the dual group obtained as the pairing of xi with the action of a tuple on
x, as W, x and xi vary, are exactly the regular functions on the coarse
quotient of the I-fold product of the dual group by left and right
translation by the diagonal dual group. Moreover the excursion operator
depends only on I, on that function f and on the tuple of Galois elements.
One therefore writes S_{I,f,(gamma_i)}. The coarse quotient is a scheme,
unlike the stacky quotients considered elsewhere, so it forgets the
automorphism groups of points. -/
-- The function on the I-fold product of the dual group attached to W, x and xi.
def FunctionField.invariantFunction : True := by sorry

-- It is a regular function on the coarse quotient by left and right diagonal translation.
theorem FunctionField.invariantFunction_mem : True := by sorry

-- Every regular function on that coarse quotient arises this way.
theorem FunctionField.invariantFunction_surjective : True := by sorry

-- The excursion operator S_{I,f,(gamma_i)} indexed by a function rather than by a triple.
def FunctionField.excursionOfFunction : True := by sorry

-- The operator depends only on f, by the first excursion relation.
theorem FunctionField.excursionOfFunction_wellDefined : True := by sorry

-- For I of size n+1 the coarse quotient identifies with the coarse quotient of the n-fold product by diagonal conjugation, through the map inserting the identity in the first coordinate.
theorem FunctionField.coarseQuotient_iso : True := by sorry

example : True := by sorry -- unit test `hecke_function`: The function sending a pair to the character of V at the product of the first with the inverse of the second is a regular function on the coarse quotient, and the corresponding operator is the Hecke operator.
example : True := by sorry -- unit test `constant_function`: A constant function gives a scalar operator (the degenerate case).
example : True := by sorry -- unit test `coarse_not_stacky`: The coarse quotient is a scheme and forgets the automorphism groups; using the stacky quotient would give a different and wrong indexing set (the required non-example).
example : True := by sorry -- unit test `independence_of_W`: Two triples giving the same function give the same operator; a construction depending on W is wrong.

/-- the-excursion-algebra: Let B be the subalgebra of the algebra of Hecke-
linear endomorphisms of H_{{0},1} generated by all the excursion operators.
Then B is commutative, and the operators satisfy: for every I and tuple of
Galois elements, f mapsto S_{I,f,(gamma_i)} is a morphism of commutative
algebras from the regular functions on the coarse quotient to B; for a map
zeta from I to J, the operator for the composed function and the tuple
indexed by J equals the operator for f and the composed tuple; for a
threefold disjoint union, the operator for the function obtained by the rule
sending a triple of tuples to f evaluated at the tuple whose i-th entry is
g_i times the inverse of g'_i times g''_i equals the operator for f at the
corresponding product tuple; and for fixed I and f, the map from the I-fold
product of the Galois group to B is continuous for the ell-adic topology on
B. It is not known whether B is reduced. -/
theorem TheExcursionAlgebra : True := by sorry

/-- reconstruction-of-a-langlands-parameter: For every character nu of B with
values in an algebraic closure of Q_ell there is a morphism sigma from the
Galois group of F to the dual group over that closure such that: sigma takes
its values in the dual group over a finite extension E' of E and is
continuous; sigma is semisimple, that is, if its image is contained in a
parabolic subgroup then it is contained in an associated Levi subgroup,
equivalently the Zariski closure of its image is reductive; and for every I
and every regular function f on the coarse quotient, nu of S_{I,f,(gamma_i)}
equals f evaluated at the tuple of sigma(gamma_i). Moreover sigma is unique
up to conjugation by the dual group. The proof uses only the four properties
of the excursion algebra. -/
theorem ReconstructionOfALanglandsParameter : True := by sorry

/-- the-main-decomposition: There is a canonical decomposition of the space of
cuspidal automorphic forms of level N with coefficients in an algebraic
closure of Q_ell as a direct sum, indexed by global Langlands parameters,
that is by conjugacy classes of continuous semisimple morphisms from the
Galois group of F to the dual group over that closure, defined over a finite
extension of Q_ell and unramified outside N. The decomposition is
characterised by the property that H_sigma is the generalized eigenspace
attached to the character nu of B defined by sending S_{I,f,(gamma_i)} to f
evaluated at the tuple of sigma(gamma_i). It is a decomposition of modules
over the Hecke algebra, it is compatible with the Satake isomorphism at
every place outside N, in the sense that for every irreducible
representation V of the dual group the operator T(h_{V,v}) acts on H_sigma
by multiplication by the character of V evaluated at sigma(Frob_v), and it
is compatible with the limit over N. -/
theorem TheMainDecomposition : True := by sorry

/-- satake-compatibility-and-chebotarev: The unramified Hecke operator
T(h_{V,v}) is the excursion operator with two legs, the function sending a
pair to the character of V at the product of the first with the inverse of
the second, and the tuple (Frob_v, 1). Consequently the decomposition is
compatible with the Satake isomorphism. By Chebotarev, the subalgebra of B
generated by all the unramified Hecke algebras is exactly the subalgebra
generated by the excursion operators with two legs. For G = GL_r that
subalgebra determines the decomposition, since a semisimple linear
representation is determined up to conjugation by its character. For a
general reductive group it does not: there are finite groups and pairs of
nonconjugate morphisms to the dual group whose values are conjugate element
by element, so two nonconjugate parameters can give the same characters of
every H_v, and excursion operators with more than two legs are necessary. -/
theorem SatakeCompatibilityAndChebotarev : True := by sorry

/-- nonsplit-groups-and-the-l-group: For a connected reductive group G over F
that is not necessarily split, the same construction gives a canonical
decomposition in which the left-hand side is replaced by a direct sum,
indexed by the finite set ker^1(F, G), of spaces of cuspidal automorphic
forms for inner forms of G, and the global Langlands parameters are defined
with the help of the L-group: they are conjugacy classes of continuous
semisimple morphisms from the Galois group of F to the L-group whose
composition with the projection to the Galois group is the identity. The
decomposition is again into generalized eigenspaces and is compatible with
the Satake isomorphism at the unramified places of the quasisplit inner
form. -/
theorem NonsplitGroupsAndTheLGroup : True := by sorry

/-! ## GS.6 The full GL_n global correspondence -/

/-- drinfeld-shtuka-varieties-of-rank-r: For every level N, that is every finite
closed subscheme N = Spec O_N of X, there is a Deligne-Mumford stack Cht^r_N
classifying Drinfeld shtukas of rank r with level structure N. It carries a
smooth morphism of dimension 2r - 2 to the product of two copies of X minus
N, two endomorphisms called partial Frobenius morphisms, Frob_infinity and
Frob_0, whose composite is the total Frobenius, and an action by
correspondences of the subalgebra H^r_N of the Hecke algebra consisting of
the functions bi-invariant under K_N, the kernel of the reduction of GL_r of
the integral adeles modulo N. There are infinitely many connected
components; to have only finitely many one considers the substack
Cht^{r,d}_N of shtukas of fixed degree d, or the quotient by a^Z for an
idele a of degree one, which is the disjoint union of the Cht^{r,d}_N for d
between one and r and is still equipped with Frob_infinity, Frob_0 and
H^r_N. -/
-- The Deligne-Mumford stack Cht^r_N of rank-r Drinfeld shtukas with level N.
def FunctionField.DrinfeldShtuka : True := by sorry

-- The structure morphism to the product of two copies of X minus N is smooth of dimension 2r - 2.
def FunctionField.DrinfeldShtuka.smooth : True := by sorry

-- The partial Frobenius morphism at the zero.
def FunctionField.DrinfeldShtuka.frobZero : True := by sorry

-- The partial Frobenius morphism at the pole.
def FunctionField.DrinfeldShtuka.frobInfty : True := by sorry

-- The composite of the two partial Frobenius morphisms is the total Frobenius.
theorem FunctionField.DrinfeldShtuka.frob_comp : True := by sorry

-- The substack of shtukas of fixed degree d.
def FunctionField.DrinfeldShtuka.degreeComponent : True := by sorry

-- The quotient by a^Z for an idele a of degree one, with its decomposition into the components of degrees one to r.
def FunctionField.DrinfeldShtuka.quotientByIdele : True := by sorry

-- The action of H^r_N by correspondences.
def FunctionField.DrinfeldShtuka.heckeAction : True := by sorry

example : True := by sorry -- unit test `rank_one`: For r = 1 the shtuka variety is the Lang covering of the Picard scheme and the correspondence is class field theory (the degenerate case).
example : True := by sorry -- unit test `dimension`: The structure morphism is smooth of dimension 2r - 2; a construction giving another dimension is wrong.
example : True := by sorry -- unit test `infinitely_many_components`: Cht^r_N has infinitely many connected components, so the quotient by a^Z or the fixing of the degree is necessary (the required non-example).
example : True := by sorry -- unit test `partial_frobenius_product`: The composite of Frob_infinity and Frob_0 is the total Frobenius.

/-- truncation-and-the-absence-of-a-stable-open: The connected components of
Cht^r_N are not of finite type: their ell-adic cohomology is of infinite
dimension, and a naive count of the fixed points of Hecke correspondences
gives infinitely many. Moreover there is no open substack of Cht^r_N/a^Z of
finite type that is stable under Frob_infinity, under Frob_0 or under H^r_N.
One defines nevertheless opens of finite type Cht^{r, p-bar <= p}_N/a^Z by
bounding by a truncation polygon p from the interval [0, r] to the
nonnegative reals the canonical Harder-Narasimhan polygon of the shtukas.
This is the rank-r instance of the general truncation by the Harder-
Narasimhan polygon. -/
theorem TruncationAndTheAbsenceOfAStableOpen : True := by sorry

/-- compactification-and-boundary-analysis: The truncated shtuka varieties admit
compactifications, obtained by allowing the shtuka structure to degenerate
in a controlled way, whose boundary strata are described in terms of the
proper parabolic subgroups of GL_r and their Levi quotients. The analysis of
the boundary is what allows the contribution of the noncuspidal spectrum to
be separated from the cuspidal one and is the geometric input of the
induction on the rank. This is the compactification and boundary analysis
that GS.6 owns; the corresponding compactifications in the general reductive
setting, and their relation to the Lefschetz SL_2 acting on the intersection
cohomology, are conjectural and are recorded in GS.5's conjectures rather
than proved. -/
theorem CompactificationAndBoundaryAnalysis : True := by sorry

/-- negligible-cohomology-and-induction-on-the-rank: One argues by induction on
the rank: one fixes r at least two and supposes the automorphic-to-Galois
assertions already known in ranks strictly less than r. Combining the
functional equations of Grothendieck's L-functions, Laumon's product formula
and the converse theorems of Hecke, Weil and Piatetski-Shapiro, one deduces,
by Deligne's recurrence principle, that the Galois-to-automorphic assertions
are also known in ranks at most r. One is thus reduced to constructing the
map from cuspidal automorphic representations of rank r to Galois
representations. The cohomological contributions that do not come from the
cuspidal spectrum of rank r are shown to be negligible, in a sense made
precise by the boundary analysis, and the remaining part of the ell-adic
cohomology above the generic point of the product of two copies of the curve
is identified with the direct sum over the cuspidal representations of rank
r of the tensor product of the representation with the two pullbacks of its
parameter and its dual, twisted by 1 - r. -/
theorem NegligibleCohomologyAndInductionOnTheRank : True := by sorry

/-- trace-formula-and-the-matching-of-terms: Combining the Arthur-Selberg trace
formula with Drinfeld's adelic description of shtukas, one computes the
numbers of fixed points of the composites of powers of the total Frobenius
with Hecke correspondences in the fibre of a truncated shtuka variety modulo
a^Z above a point of the product of two copies of the curve mapping to two
distinct places outside N. The answer has the shape: q to the power (r - 1)s
times the sum over the cuspidal representations with prescribed central
character of the trace of the Hecke function times a product of the s-th
powers, suitably normalised by the degrees of the two places, of the Hecke
eigenvalues at the two places, plus other terms in which the Hecke
eigenvalues of the cuspidal automorphic representations of the strict Levi
subgroups appear. Matching the Hecke terms with the Frobenius terms is what
produces the correspondence. -/
theorem TraceFormulaAndTheMatchingOfTerms : True := by sorry

/-- the-global-correspondence-for-gl-r: For every integer r at least one: to
every irreducible cuspidal automorphic representation pi of GL_r of the
adeles whose central character is of finite order one can associate a unique
ell-adic representation sigma_pi of the Galois group of F, almost everywhere
unramified, irreducible of dimension r and with determinant of finite order,
which is unramified at every place where pi is unramified and whose
Frobenius eigenvalues there are the Hecke eigenvalues of pi; and conversely,
to every such Galois representation sigma one can associate a unique
irreducible cuspidal automorphic representation pi_sigma whose Hecke
eigenvalues are the Frobenius eigenvalues of sigma. Uniqueness in the first
direction follows from the Chebotarev density theorem, and in the second
from the strong multiplicity one theorem of Piatetski-Shapiro. In rank one
the two assertions are equivalent to the reciprocity law of class field
theory over F. -/
theorem TheGlobalCorrespondenceForGlR : True := by sorry

/-- local-factors-purity-and-multiplicity: In the range of the theorem the
correspondence is compatible with the local factors at every place,
including the ramified ones, in the sense that the local L-factors and
epsilon-factors of pi and of sigma_pi agree; the Galois representations
obtained are pure of weight zero after the normalisation fixed by the finite
order of the determinant, which is the Ramanujan-Petersson conjecture for
GL_r over a function field; and the multiplicity of pi in the cuspidal
spectrum is one, by strong multiplicity one. These conclusions are part of
the statement of the correspondence in rank r and are not consequences of
the parametrisation of GS.5. -/
theorem LocalFactorsPurityAndMultiplicity : True := by sorry

/-- rank-one-is-class-field-theory: In rank one the two assertions of the
correspondence are equivalent to the reciprocity law of global class field
theory for the function field F: the canonical isomorphism from the fibre
product of the abelianized fundamental group of X with Z over the profinite
completion of Z to Pic(F_q), characterised by sending Frob_v to the class of
O(v). That statement is owned by FunctionFieldArithmetic:FA.4 and is
imported here as the base case of the induction on the rank and as the
acceptance test of the whole layer. -/
theorem RankOneIsClassFieldTheory : True := by sorry

/-! ## GS.7 Local-global and equal-characteristic comparison -/

/-- bernstein-center-and-local-parameters: Let G be a reductive group over a
local field K of equal characteristic. The Bernstein centre of G(K) is,
equivalently, the centre of the category of smooth representations of G(K)
or the algebra of central distributions on G(K) acting as multipliers on the
algebra of locally constant compactly supported functions; it acts by a
character on every irreducible smooth representation with coefficients in an
algebraic closure of Q_ell. There is a map associating with every character
nu of the Bernstein centre with values in that closure a local Langlands
parameter sigma_K(nu) up to semisimplification, that is, assuming G split to
simplify, a conjugacy class of continuous semisimple morphisms from the Weil
group of K to the dual group over that closure, defined over a finite
extension of Q_ell. This is joint work of Genestier and V. Lafforgue. -/
theorem BernsteinCenterAndLocalParameters : True := by sorry

/-- restricted-shtukas-and-the-local-excursion-element: If all the Galois
elements gamma_i lie in the decomposition group at a place v, the global
excursion operator S_{I,f,(gamma_i)}, as an endomorphism of the cuspidal
automorphic forms of level N, acts by multiplication by an element
z_{I,f,(gamma_i)} of the ell-adic completion of the Bernstein centre of
G(F_v) which depends only on the local data at v. That element is
constructed using stacks of restricted shtukas, which are the analogues of
truncated Barsotti-Tate groups: one truncates the shtuka structure to a
finite level at v rather than imposing a global boundedness condition. -/
-- The stack of shtukas restricted to a finite level at a place v.
def FunctionField.restrictedShtuka : True := by sorry

-- The truncation morphisms between consecutive levels.
def FunctionField.restrictedShtuka.truncation : True := by sorry

-- The element z_{I,f,(gamma_i)} of the ell-adic completion of the Bernstein centre.
def FunctionField.localExcursionElement : True := by sorry

-- When all the Galois elements lie in the decomposition group at v the global excursion operator acts by multiplication by that element.
theorem FunctionField.localExcursionElement_acts : True := by sorry

-- The element depends only on the local data at v.
theorem FunctionField.localExcursionElement_local : True := by sorry

-- The analogy with truncated Barsotti-Tate groups: the level-n restricted shtukas play the role of the n-torsion.
theorem FunctionField.restrictedShtuka.barsottiTate : True := by sorry

example : True := by sorry -- unit test `level_zero`: At level zero the restricted shtuka stack is the unramified Hecke correspondence and the element is the Satake element (the degenerate case).
example : True := by sorry -- unit test `locality`: The element depends only on the local data at v; a construction depending on the global level N away from v is wrong.
example : True := by sorry -- unit test `hecke`: For the two-leg excursion function and the tuple (Frob_v, 1) the element is the image of the spherical Hecke function h_{V,v} in the Bernstein centre.
example : True := by sorry -- unit test `not_global`: The global excursion operator for a tuple whose entries do not all lie in the decomposition group at v is not given by any element of the local Bernstein centre (the required non-example).

/-- local-global-compatibility-up-to-semisimplification: Let X be a smooth
projective geometrically irreducible curve over a finite field and let N be
a level. If sigma is a global Langlands parameter and pi is an irreducible
representation of G of the adeles, a restricted tensor product of local
representations, such that the K_N-invariants of pi are nonzero and appear
in H_sigma in the decomposition with level N, then for every place v of X
there is an equality between the semisimplification of the restriction of
sigma to the decomposition group at v and the semisimple local parameter
sigma_K(nu), where nu is the character of the Bernstein centre by which it
acts on the irreducible smooth representation pi_v. The proof uses nearby
cycles over general bases, defined on oriented products of topoi. -/
theorem LocalGlobalCompatibilityUpToSemisimplification : True := by sorry

/-- nearby-cycles-over-general-bases: Nearby cycles over a general base, in the
sense of Deligne, Laumon, Gabber, Illusie and Orgogozo, are defined on
oriented products of topoi rather than over a trait, and they satisfy the
finiteness and compatibility properties that make them usable for a
comparison between the cohomology of a global object and of its local
models. They are the technical device by which the comparison maps of this
layer are constructed: the legs of a shtuka are allowed to approach the
place v, and the nearby cycles at that degeneration relate the global
cohomology to the cohomology of the restricted shtukas. There are no nearby
cycles in either pinned library. -/
theorem NearbyCyclesOverGeneralBases : True := by sorry

/-- semisimplification-versus-monodromy: In every comparison of this layer the
object on the local side is a semisimple parameter, a conjugacy class of
continuous semisimple morphisms from the Weil group to the dual group, and
not a Weil-Deligne representation: the monodromy operator is not determined
by the construction. Accordingly the local-global compatibility asserts an
equality of semisimplifications and not an equality of Weil-Deligne
parameters. In general one cannot hope for more than compatibility up to
semisimplification. For GL_r the finer statement, with the monodromy, is
known by the work of Laumon-Rapoport-Stuhler and of L. Lafforgue. There is
no Weil-Deligne representation in either library. -/
theorem SemisimplificationVersusMonodromy : True := by sorry

/-- gl-r-local-comparison-and-uniformization: For GL_r the local Langlands
correspondence was constructed by Laumon-Rapoport-Stuhler through the
cohomology of the moduli of D-elliptic sheaves, and local-global
compatibility holds without semisimplification. The comparison of the global
parameter with that local correspondence is made through local shtuka
uniformization: the completion of the global shtuka moduli along a suitable
stratum is described by a moduli of local shtukas, and the induced map on
nearby cycles is the comparison map. The level and boundedness hypotheses
under which that uniformization holds must be preserved; the D-elliptic-
sheaf realisation itself is owned by
ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic and by
HeckeStacksAndLocalShtukas:HS2 and HS3, and is imported here. -/
theorem GlRLocalComparisonAndUniformization : True := by sorry

/-- unramified-satake-as-the-first-case: At a place v outside the level, the
compatibility of the decomposition with the Satake isomorphism is exactly
the local-global compatibility at v for the unramified local parameter: the
operator T(h_{V,v}) acts on H_sigma by the character of V evaluated at
sigma(Frob_v), and the unramified local parameter attached to the character
of the Bernstein centre by which the spherical Hecke algebra acts on the
unramified representation pi_v is the unramified parameter sending Frobenius
to the Satake parameter. This is the first case of local-global
compatibility, and the roadmap text asks that the layer begin with it and
with GL_r. -/
theorem UnramifiedSatakeAsTheFirstCase : True := by sorry

end TauCeti.GlobalShtukas
