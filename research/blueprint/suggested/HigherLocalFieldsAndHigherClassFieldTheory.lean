/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HigherLocalFieldsAndHigherClassFieldTheory.md` is
definitive. These statements suggest Lean forms so that contributors and reviewers
can converge on names and signatures. They claim no implementation.

BP-HigherLocalFieldsAndHigherClassFieldTheory: partial prototype,
implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No Lean toolchain at those commits was available in this session, so elaboration
has not been established and the file was not compiled.

The reviewed library audit AUDIT-03 records HL.0 as PARTLY BUILT, HL.1 to HL.6 as
NOT BUILT and HL.7 as PROCESS, and reading the pinned declaration index confirms
it: no residue tower and no higher topology, no Milnor K-theory in either library,
no de Rham-Witt complex, no duality for a local field, no etale fundamental group
of a scheme, no Parshin chain, no higher adele, no global class field theory.

What the pinned libraries do have is imported and never redefined:

* Mathlib `IsNonarchimedeanLocalField`, which is EXACTLY the case n = 1 and the
  last step of every residue tower.
* Mathlib `Valued`, `Valuation`, `ValuationSubring`, `IsDiscreteValuationRing` and
  `IsLocalRing.ResidueField`: one step of a tower with its valuation topology.
* Mathlib `LaurentSeries` and `PowerSeries`, `Padic` and `PadicInt`: each STEP of
  the two standard two-dimensional examples exists; only the tower is missing.
* Mathlib `WittVector` and `WittVector.frobenius`; there is no de Rham-Witt
  complex, which is the boundary HL.2 runs into.
* Mathlib `TensorAlgebra` and `RingQuot`, the carriers of Milnor K-theory, whose
  definition belongs to K2SymbolsBrauer:T.2 and is imported, not rebuilt here.
* Mathlib `groupCohomology`, `ProfiniteGrp` and `CategoryTheory.GaloisCategory`.
* Mathlib `RestrictedProduct`, `IsDedekindDomain.FiniteAdeleRing` and
  `NumberField.AdeleRing`: the dimension-one case the higher adeles must recover.
* Tau Ceti `TauCeti.unitFiltration`, `TauCeti.Place.ramificationGroup` and the
  continuous-cohomology cochain development.

Milnor K-theory, the tame symbol, the higher residues and the transfers are
imported from K2SymbolsBrauer:T.2, T.3 and T.4 by node identifier and are not
prototyped here. HL.7 is a process layer and has no nodes. Where a statement
quantifies over an object requested from another roadmap the prototype uses `True`
as a placeholder, in the style of the other suggested files of this programme.
-/
import Mathlib.Algebra.RingQuot
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.CategoryTheory.Galois.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.LinearAlgebra.TensorAlgebra.Basic
import Mathlib.NumberTheory.LocalField.Basic
import Mathlib.NumberTheory.NumberField.AdeleRing
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.DedekindDomain.Basic
import Mathlib.RingTheory.DedekindDomain.FiniteAdeleRing
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.LocalRing.Defs
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.RingTheory.WittVector.Defs
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.Topology.Algebra.Category.ProfiniteGrp.Basic
import Mathlib.Topology.Algebra.RestrictedProduct.Basic
import Mathlib.Topology.Algebra.Valued.ValuationTopology
import Mathlib.Topology.Algebra.Valued.ValuedField
import Mathlib.Topology.UniformSpace.Completion
import TauCeti.FieldTheory.FunctionField.Place.Extension.RamificationGroup
import TauCeti.NumberTheory.LocalField.UnitFiltration.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.Additive

noncomputable section

namespace TauCeti.HigherLocalFields

universe u

/-! ## HL.0 Higher local fields and their topologies -/

/-- n-dimensional-local-field: A complete discrete valuation field K has the
structure of an n-dimensional local field if there is a chain of fields K =
K_n, K_{n-1}, ..., K_1, K_0 in which each K_{i+1} is a complete discrete
valuation field with residue field K_i and K_0 is a finite field. K_{n-1} is
the first residue field and K_0 the last; finite fields are the
0-dimensional local fields. Most properties are unchanged if K_0 is only
required to be perfect, and one then speaks of an n-dimensional local field
over a perfect field. Mathlib has IsNonarchimedeanLocalField, which is
exactly the case n = 1, and one-step discrete-valuation API; the residue-
tower structure and the n-local predicate are absent from both libraries. -/
-- The structure on a complete discrete valuation field given by a chain of residue fields ending in a finite field.
def HigherLocalField : True := by sorry

-- The i-th field of the chain, with K_n = K and K_0 finite.
theorem HigherLocalField.residue : True := by sorry

-- A system of local parameters t_1, ..., t_n.
def HigherLocalField.localParameters : True := by sorry

-- The rank-n valuation with values in Z^n for the lexicographic order.
def HigherLocalField.rankValuation : True := by sorry

-- O_K, M_K and the group of principal units V_K = 1 + M_K, independent of the choice of parameters.
def HigherLocalField.ring : True := by sorry

-- The nonzero ideals of O_K are exactly the P(i_l, ..., i_n).
theorem HigherLocalField.idealClassification : True := by sorry

-- O_K is not Noetherian for n > 1.
theorem HigherLocalField.not_noetherian : True := by sorry

-- For n = 1 the structure is Mathlib's IsNonarchimedeanLocalField.
theorem HigherLocalField.ofLocalField : True := by sorry

example : True := by sorry -- unit test `iterated_laurent`: F_q((u))((t)) is a two-dimensional local field with residue field F_q((u)) and last residue field F_q; a definition that does not accept it is wrong.
example : True := by sorry -- unit test `one_dimensional`: For n = 1 the predicate is Mathlib's IsNonarchimedeanLocalField (the degenerate case).
example : True := by sorry -- unit test `mixed_characteristic`: Q_p((t)) is a two-dimensional local field; so is Q_p{{T}}, and the two are not isomorphic, so the definition must distinguish them.
example : True := by sorry -- unit test `ideals_not_noetherian`: For n = 2 the chain P(0,1) strictly contains P(-1,1), P(-2,1), ..., so O_K is not Noetherian; a definition that forces Noetherianness is wrong (the required non-example).

/-- classification-and-standard-fields: For a complete discrete valuation field
F set F{{T}} to be the set of doubly infinite series in T with coefficients
in F whose valuations are bounded below and tend to infinity, with the
valuation the minimum of the coefficient valuations; it is a complete
discrete valuation field with residue field k_F((t)). For a local field k
the fields k{{T_1}}...{{T_m}}((T_{m+2}))...((T_n)) for 0 <= m <= n-1 are
n-dimensional local fields, the standard fields, and K((X)){{Y}} is
isomorphic to K((Y))((X)). Let m be maximal with char(K_m) = p. Then there
are n+1 types of n-dimensional local field, and the classification theorem
says: if char(K) = p then K is isomorphic to F_q((X_1))...((X_n)); if
char(K_1) = 0 then K is isomorphic to k((X_1))...((X_{n-1})) for a local
field k; and if char(K_{m+1}) = 0 and char(K_m) = p then K is a finite
extension of a standard field and some finite extension of K is standard. -/
theorem ClassificationAndStandardFields : True := by sorry

/-- higher-topology: The valuation topology of the top discrete valuation
ignores the topologies of the residue fields. The higher topology is built
so that they are taken into account: starting from the discrete topology on
the last residue field, one defines the topology on F((X)) from a topology
on F by taking as a base of neighbourhoods of zero the sets of series whose
i-th coefficient lies in U_i, for sequences of neighbourhoods U_i of zero in
F that are eventually all of F. In mixed characteristic one uses the
canonical lifting h attached to a choice of t_1, ..., t_{n-1}, and in the
case char(K) = char(K_{n-1}) = 0 the construction depends on the choice of a
coefficient subfield. The price is that K is not a topological field: for n
> 1 multiplication is not continuous, indeed UU = K for every open subgroup
U. Multiplication is sequentially continuous, which is what class field
theory actually uses. -/
-- The higher topology on the additive group of an n-dimensional local field.
def HigherLocalField.topology : True := by sorry

-- The canonical lifting h attached to a choice of t_1, ..., t_{n-1}, used in the mixed-characteristic construction.
def HigherLocalField.canonicalLifting : True := by sorry

-- K is a complete separated topological group.
def HigherLocalField.topology_completeSeparated : True := by sorry

-- For n > 1, UU = K for every open subgroup U, so multiplication is not continuous.
theorem HigherLocalField.mul_not_continuous : True := by sorry

-- Multiplication is sequentially continuous.
theorem HigherLocalField.mul_seqContinuous : True := by sorry

-- For a finite extension the topology is the finite-dimensional vector space topology, and the topology of the subfield is the induced one.
theorem HigherLocalField.topology_of_finiteExtension : True := by sorry

-- For n > 1 every base of neighbourhoods of zero is uncountable.
theorem HigherLocalField.topology_uncountable_base : True := by sorry

-- V_F is topologically generated by the 1 + theta t_n^{i_n} ... t_1^{i_1}.
theorem HigherLocalField.principalUnits_topGenerators : True := by sorry

example : True := by sorry -- unit test `equal_characteristic`: For F_q((u))((t)) the construction gives the topology in which a sequence tends to zero when its coefficients do and its supports are bounded below.
example : True := by sorry -- unit test `valuation_topology_is_coarser`: The higher topology is strictly finer than the t-adic valuation topology of the top valuation for n > 1 (the required non-example: Tau Ceti's Huber and Tate structures on Laurent series carry the t-adic topology, not this one).
example : True := by sorry -- unit test `not_topological_field`: For n > 1, UU = K for every open subgroup U; a construction in which multiplication is continuous is wrong.
example : True := by sorry -- unit test `one_dimensional`: For n = 1 the higher topology is the valuation topology and K is a topological field (the degenerate case).

/-- extensions-and-ramification-matrix: Let L/K be a finite extension of
n-dimensional local fields. Choosing systems of local parameters of K and of
L and the corresponding rank-n valuations v and v', the matrix E(L|K) with
entries v'_j(t_i) is lower triangular with diagonal entries e_i(L|K) =
e(L_i/K_i), and the e_i do not depend on the choice of parameters. The
degree formula is |L : K| = f(L|K) times the product of the e_i(L|K), where
f(L|K) = |L_0 : K_0|. The word unramified is used in two senses: e_n(L|K) =
1 with L_{n-1}/K_{n-1} separable, called semiramified, and the product of
all e_i equal to 1, called purely unramified; the two must be kept apart. -/
theorem ExtensionsAndRamificationMatrix : True := by sorry

/-- teichmueller-representatives-and-expansions: Suppose char(k_K) = p, that is
m equals n-1 or n in the notation of the classification. Then the set R of
Teichmueller representatives in O_K is a field isomorphic to K_0.
Consequently every element of K can be expanded as a convergent series in
the local parameters with coefficients in R, and the group of principal
units V_K is topologically generated by the elements 1 + theta t_n^{i_n} ...
t_1^{i_1} with theta in R and the exponent vector not divisible by p. These
expansions are convergent for the higher topology and only sequentially so,
which is exactly what the higher topology was built for. -/
theorem TeichmuellerRepresentativesAndExpansions : True := by sorry

/-- two-dimensional-examples: The two examples the layer's acceptance asks for
are worked out. For K = F_q((u))((t)): the chain is K_2 = K, K_1 = F_q((u)),
K_0 = F_q; a system of local parameters is t_1 = u, t_2 = t; the rank-two
valuation sends a series to the pair (order in u of the leading coefficient,
order in t); char(K) = p, so the field is of the first type of the
classification. For K = Q_p((t)): the chain is K_2 = K, K_1 = Q_p, K_0 =
F_p; a system of local parameters is t_1 = p, t_2 = t; char(K) = char(K_1) =
0, so the field is of the second type and the Teichmueller field R is F_p.
Both are two-dimensional local fields, and Q_p{{T}} is a third, of mixed-
characteristic type, which is not isomorphic to either. -/
theorem TwoDimensionalExamples : True := by sorry

/-- topology-on-the-multiplicative-group: The multiplicative group of an
n-dimensional local field carries a topology built from the higher topology
on the additive group, for which it is a topological group when n = 1 and
only sequentially well behaved for n > 1. Its principal units V_K are
topologically generated by the elements of the previous node. Any map out of
the multiplicative group that is used in class field theory, in particular
the symbol map into the Milnor K-groups, is required to be sequentially
continuous and not continuous; the two conditions are genuinely different
because for n > 1 no base of neighbourhoods of zero is countable. -/
theorem TopologyOnTheMultiplicativeGroup : True := by sorry

/-- perfect-and-quasi-finite-variants: Most properties of n-dimensional local
fields are unchanged if the last residue field K_0 is required only to be
perfect rather than finite, and one then speaks of an n-dimensional local
field over a perfect field; one can also allow an arbitrary K_0. The class
field theory of the following layers is stated for a finite K_0, but the
invariant map and the isomorphism theorem of HL.2 and HL.3 hold whenever K_0
is quasi-finite, and there is a further generalisation to a perfect K_0 that
is not separably p-closed, which describes abelian totally ramified
p-extensions. -/
theorem PerfectAndQuasiFiniteVariants : True := by sorry

/-! ## HL.1 Milnor K-groups, residues and norms -/

/-- milnor-k-groups-imported: The Milnor K-groups of a field, defined as the
tensor algebra of the multiplicative group modulo the homogeneous Steinberg
ideal, together with their alternating property and the standard
computations, are owned by K2SymbolsBrauer:T.2 and are imported here by node
identifier. The tame symbol of a discrete valuation, the higher Milnor
residues with their product signs, the ramification formula for a finite
extension, the transfer and the norm-residue formula are owned by
K2SymbolsBrauer:T.3 and T.4 and are likewise imported. The reviewed audit
AUDIT-03 records exactly these overlaps. What this layer adds is what is
specific to a residue tower: the iterated residue with its sign, the
compatibility of the iterated residue with the norm through the ramification
matrix, and the topological Milnor K-groups. -/
theorem MilnorKGroupsImported : True := by sorry

/-- iterated-residue-with-signs: Let F be an n-dimensional local field with a
system of local parameters t_1, ..., t_n. Composing the discrete-valuation
boundary maps of the successive residue fields gives the iterated residue, a
homomorphism from K_{m}(F) to K_{m-n}(K_0) for m at least n; for m = n it is
the map sending the symbol of the parameters to 1. The composite depends on
the order of the parameters, and permuting them changes the iterated residue
by the sign of the permutation, exactly as the one-step residues of
K2SymbolsBrauer:T.3 are alternating. The roadmap text asks that changing the
order of parameters produce the expected sign rather than an unproved
canonical identification. -/
-- The iterated residue attached to a system of local parameters.
def HigherLocalField.iteratedResidue : True := by sorry

-- Its value on the symbol of the parameters together with a constant-field unit.
theorem HigherLocalField.iteratedResidue_symbol : True := by sorry

-- Permuting the parameters changes the iterated residue by the sign of the permutation.
theorem HigherLocalField.iteratedResidue_sign : True := by sorry

-- It is the composite of the one-step boundary maps of the tower.
theorem HigherLocalField.iteratedResidue_comp : True := by sorry

-- For n = 1 it is the tame symbol of K2SymbolsBrauer:T.3.
theorem HigherLocalField.iteratedResidue_one_dimensional : True := by sorry

-- Its compatibility with the Milnor norm of a finite extension, through the ramification matrix.
theorem HigherLocalField.iteratedResidue_norm : True := by sorry

example : True := by sorry -- unit test `parameters`: The iterated residue of {t_1, ..., t_n} is 1, and of {theta, t_1, ..., t_n} is the residue of theta.
example : True := by sorry -- unit test `sign`: Exchanging t_1 and t_2 changes the iterated residue by minus one; a construction in which it does not is wrong (the required non-example).
example : True := by sorry -- unit test `one_dimensional`: For n = 1 it is the tame symbol (the degenerate case).
example : True := by sorry -- unit test `norm_compatibility`: For a finite extension the iterated residue of a norm is the norm of the iterated residue, corrected by the ramification indices of the tower.

/-- norms-and-projection-formulas: For a finite extension L/F of n-dimensional
local fields the Milnor transfer N_{L/F} from K_m(L) to K_m(F) of
K2SymbolsBrauer:T.4 satisfies the projection formula: N_{L/F}({x_1, ...,
x_r} times the image of y) is N_{L/F}({x_1, ..., x_r}) times y for y in the
Milnor K-groups of F. Its compatibility with the residues of the tower
involves the ramification indices e_i(L|F) and the residue degree f(L|F)
explicitly: the composite of the transfer with the iterated residue of F is
the iterated residue of L followed by the norm of the last residue
extension, multiplied by the appropriate product of ramification indices.
The norm map is not determined by the degree-two symbol presentation alone,
which is why the Bass-Tate construction of the transfer is imported rather
than reproved. -/
theorem NormsAndProjectionFormulas : True := by sorry

/-- topological-milnor-k-groups: Endow the Milnor K-groups of an n-dimensional
local field F with the topology induced from the higher topology on the
multiplicative group through the symbol map, and let Lambda_m(F) be the
intersection of all neighbourhoods of zero in K_m(F). The topological Milnor
K-group K^top_m(F) is the quotient K_m(F)/Lambda_m(F). It coincides with the
quotient of K_m(F) by the intersection of the subgroups l K_m(F) over all l
greater than one. The reciprocity map of a higher local field is not
injective on K_n(F): its kernel contains that intersection, so the Milnor
K-groups are too large from the point of view of class field theory and one
passes to the topological quotient without losing arithmetical information.
The notion was first introduced by Parshin. -/
-- The topological Milnor K-group K^top_m(F).
def HigherLocalField.KTop : True := by sorry

-- The intersection Lambda_m(F) of all neighbourhoods of zero in K_m(F).
def HigherLocalField.Lambda : True := by sorry

-- K^top_m(F) is K_m(F) modulo the intersection of the l K_m(F).
theorem HigherLocalField.KTop_eq_quotient_divisible : True := by sorry

-- K^top_n(F) is the direct sum of Z, Z/(q-1) and the principal-unit part.
def HigherLocalField.KTop_structure : True := by sorry

-- Open subgroups of finite index of K_n(F) correspond bijectively to those of K^top_n(F).
theorem HigherLocalField.KTop_openSubgroups : True := by sorry

-- K^top_m(F) has no nontrivial p-torsion and the intersection of the p^r VK^top_m(F) is zero.
theorem HigherLocalField.KTop_no_p_torsion : True := by sorry

-- In characteristic p, K^top_{n+1}(F) is isomorphic to the multiplicative group of the last residue field.
theorem HigherLocalField.KTop_top_degree : True := by sorry

-- For n = 1 the topological K_1 is the multiplicative group itself.
theorem HigherLocalField.KTop_one_dimensional : True := by sorry

example : True := by sorry -- unit test `one_dimensional`: For n = 1, K^top_1(F) is F^times and the passage to the topological quotient does nothing in degree one (the degenerate case).
example : True := by sorry -- unit test `degree_two_local`: For a one-dimensional local field, K_2(F) is the direct sum of its torsion and an uncountable uniquely divisible group, so K^top_2(F) is the torsion part; a construction that returns K_2(F) itself is wrong.
example : True := by sorry -- unit test `top_degree_characteristic_p`: In characteristic p, K^top_{n+1}(F) is the multiplicative group of the last residue field.
example : True := by sorry -- unit test `not_the_algebraic_group`: K^top_n(F) is a proper quotient of K_n(F) whenever the latter has a nonzero divisible part, so the two must not be identified (the required non-example).

/-- parshin-structure-of-the-topological-k-group: Let F be an n-dimensional
local field of characteristic p. Using the Artin-Schreier-Witt pairing
between K^top_n(F) modulo p^r and the Witt vectors of F modulo the image of
Frobenius minus one, every element of VK^top_n(F) is uniquely representable
as a convergent series of symbols {1 + theta t_n^{i_n} ... t_1^{i_1}, t_1,
..., hat t_l, ..., t_n} with coefficients in the p-adic integers, where
theta runs over a basis of K_0 over F_p, the exponent vector is not
divisible by p and l is the least index with p not dividing i_l; and that
pairing is nondegenerate. Moreover, for J running over the (m-1)-element
subsets of {1, ..., n} and E_J the corresponding subgroups of V_F, the map
from the product of the E_J to VK^top_m(F) sending a family to the sum of
the symbols is a homeomorphism for the sequential product topology. -/
theorem ParshinStructureOfTheTopologicalKGroup : True := by sorry

/-- filtration-on-milnor-k-groups: The Milnor K-groups of a complete discrete
valuation field K with residue field F carry a filtration U_m K_d(K), where
U_0 is generated by the symbols of units and U_m by the symbols in which one
entry lies in 1 + M_K^m. The graded piece gr_0 K_d(K) is the direct sum of
K_d(F) and K_{d-1}(F), and for m > 0 the graded pieces are computed, in the
equal-characteristic and in the mixed-characteristic cases, as quotients of
modules of differential forms of the residue field. These computations are
what the index calculation in the isomorphism theorem rests on, and they are
also the bridge between the Milnor K-groups and the logarithmic de Rham-Witt
coefficients of HL.2. -/
theorem FiltrationOnMilnorKGroups : True := by sorry

/-- acceptance-computation-of-an-iterated-residue: Take F = F_q((u))((t)) with
local parameters t_1 = u, t_2 = t, and let theta be a Teichmueller
representative of an element of F_q^times. Then the iterated residue of the
symbol {theta, u, t} in K_3(F) is the class of theta in F_q^times; the
iterated residue of {theta, t, u} is its inverse; and the symbol {t, u} has
iterated residue 1 in the sense of the two-parameter computation. In the
topological group, K^top_3(F) is isomorphic to F_q^times through theta
mapsto {theta, u, t}, and K^top_2(F) is the direct sum of Z, of Z/(q-1) and
of the principal-unit part described by Parshin's theorem. -/
theorem AcceptanceComputationOfAnIteratedResidue : True := by sorry

/-- topological-versus-algebraic-k-groups: For a one-dimensional local field F
the Milnor K-group K_2(F) is the direct sum of its torsion subgroup, which
is cyclic of order the number of roots of unity in F, and an uncountable
uniquely divisible group; and K_m(F) for m at least three is uniquely
divisible and uncountable. Consequently the map from K_m(F) to K^top_m(F)
has an enormous kernel, the reciprocity map is not injective on K_m(F), and
every statement of class field theory has to be read on the topological
group. In particular a norm subgroup is open of finite index in the
topological group, and the correspondence between finite abelian extensions
and open subgroups of finite index is a correspondence of subgroups of
K^top_n(F); it transports to K_n(F) only because open subgroups of finite
index correspond bijectively. -/
theorem TopologicalVersusAlgebraicKGroups : True := by sorry

/-! ## HL.2 Higher Galois duality and wild coefficients -/

/-- kato-cohomology-groups: For a field k and q at least zero define H^q(k) as
follows. If char(k) = 0, H^q(k) is the Galois cohomology group H^q(k,
Q/Z(q-1)), the (q-1)st Tate twist. If char(k) = p > 0, then following
Illusie one sets H^q(k, Z/p^n(q-1)) = H^1(k, W_n Omega^{q-1}_{k^sep, log}),
which is explicitly the group of Witt vectors of length n tensored with q-1
copies of the multiplicative group, modulo the subgroup generated by the
elements w tensor b_1 ... b_{q-1} with two equal entries, by (0, ..., 0, a,
0, ..., 0) tensor a tensor b_1 ... b_{q-2}, and by (F-1)(w) tensor b_1 ...
b_{q-1} where F is the Frobenius on Witt vectors; one then takes the colimit
over n and the direct sum over all primes of the corresponding groups. For
every field, H^1(k) is the group of continuous characters of the absolute
Galois group and H^2(k) is the Brauer group. -/
-- The group H^q(k), defined by cases on the characteristic.
def Kato.H : True := by sorry

-- In characteristic zero, the Galois cohomology of the (q-1)st Tate twist.
def Kato.H.charZero : True := by sorry

-- In characteristic p, the first cohomology of the logarithmic de Rham-Witt sheaf, with its explicit presentation.
def Kato.H.charP : True := by sorry

-- H^1(k) is the group of continuous characters of the absolute Galois group.
theorem Kato.H_one : True := by sorry

-- H^2(k) is the Brauer group of k.
theorem Kato.H_two : True := by sorry

-- For a finite field H^1 is Q/Z and H^q vanishes for q at least two.
theorem Kato.H_finiteField : True := by sorry

-- H^q is functorial in the field, with corestriction for a finite extension.
theorem Kato.H_functorial : True := by sorry

example : True := by sorry -- unit test `finite_field`: For a finite field, H^1 is Q/Z and H^2 vanishes (the degenerate case that starts the induction).
example : True := by sorry -- unit test `brauer_group`: H^2(k) is the Brauer group; a definition for which this fails in characteristic p is wrong.
example : True := by sorry -- unit test `char_p_not_etale`: In characteristic p the p-part is not the etale cohomology of roots of unity: the required non-example, since mu_p is infinitesimal.
example : True := by sorry -- unit test `tate_twist`: In characteristic zero the twist is by q-1 and not by q; the degree and the twist of the invariant map are what the acceptance case checks.

/-- kato-residue-theorem-and-the-invariant-map: Let K be a henselian discrete
valuation field with residue field F, let pi be a prime element and consider
the homomorphism i from the direct sum of H^q(F) and H^{q-1}(F) to H^q(K)
sending (a, b) to i_{K/F}(a) + i_{K/F}(b) cup pi. Suppose char(F) = p. Then
i is bijective in the prime-to-p component; in the p-component it is
injective and its image is the p-component of the kernel of the restriction
from H^q(K) to H^q of the maximal unramified extension. Consequently, if
char(F) = p, the residue field satisfies |F : F^p| = p^{d-1} and there is an
isomorphism H^d(F) onto Q/Z, then i induces an isomorphism H^{d+1}(K) onto
Q/Z. Applying this by induction down the residue tower of a d-dimensional
local field gives a canonical invariant isomorphism inv from H^{d+1}(K) to
Q/Z. -/
theorem KatoResidueTheoremAndTheInvariantMap : True := by sorry

/-- cohomological-dimension-and-tate-twists: An n-dimensional local field over a
finite field has cohomological dimension n+1, and its residue fields have
cohomological dimension n, n-1, and so on down to the finite last residue
field of cohomological dimension one. The Tate twists Q/Z(r) and their
finite-coefficient versions mu_m^{tensor r} are the coefficients in which
the invariant map and the duality of this layer are stated; the twist in the
invariant map is q-1 and the degree is d+1, and both must be checked
explicitly. The libraries have the continuous cohomology carrier and the
mu_n coefficient module with low-degree cup products, but not the twists
mu_n^{tensor r}, the cohomological dimension or the invariant maps. -/
theorem CohomologicalDimensionAndTateTwists : True := by sorry

/-- norm-residue-and-the-symbol-identification: Bloch-Kato's theorem states that
for a henselian discrete valuation field K of characteristic zero with
residue field of positive characteristic the norm residue homomorphism from
K_q(K)/m to H^q(K, Z/m(q)) is an isomorphism; the general norm residue
theorem identifies Milnor K-theory modulo m with etale cohomology with Tate-
twisted finite coefficients for every field in which m is invertible, and
the characteristic-p statement is the differential symbol of Bloch-Gabber-
Kato. This layer imports these and uses them to identify the cup products of
symbols with the images of Milnor symbols: the pairing K_d(K) times H^1(K)
to H^{d+1}(K) that defines the reciprocity map is computed on symbols
through that identification, and the kernel of multiplication by p on
H^{d+1}(K) is identified with H^{d+1}(K, Z/p(d)) and with K_{d+1}(K)/p. -/
theorem NormResidueAndTheSymbolIdentification : True := by sorry

/-- logarithmic-de-rham-witt-coefficients: In characteristic p the coefficients
of the theory are the logarithmic parts W_n Omega^r_{log} of the de Rham-
Witt complex, and the corresponding arithmetic input is Artin-Schreier-Witt
theory, which identifies H^1(k, Z/p^n) with the Witt vectors of length n
modulo the image of Frobenius minus one. The differential symbol of Bloch-
Gabber-Kato identifies K_r(k)/p with W Omega^r_{log}, which is what makes
the explicit presentation of Kato's groups in characteristic p correct.
Mathlib has Witt vectors; neither library has de Rham-Witt complexes or
their logarithmic parts, and the audit records that the layer's wild
coefficients have to be built from CrystallineCohomology:CR.4. -/
-- The logarithmic part W_n Omega^r_{log} of the de Rham-Witt complex.
def DeRhamWitt.log : True := by sorry

-- H^1(k, Z/p^n) is the Witt vectors of length n modulo the image of Frobenius minus one.
theorem ArtinSchreierWitt.iso : True := by sorry

-- The differential symbol from K_r(k)/p to the logarithmic part.
def DifferentialSymbol : True := by sorry

-- Bloch-Gabber-Kato: the differential symbol is an isomorphism.
theorem DifferentialSymbol.bijective : True := by sorry

-- The pairing between K^top_n(F) modulo p^r and the Witt vectors modulo Frobenius minus one.
def ArtinSchreierWitt.pairing : True := by sorry

-- The pairing is nondegenerate, which is a different statement from topological perfectness.
theorem ArtinSchreierWitt.pairing_nondegenerate : True := by sorry

example : True := by sorry -- unit test `one_dimensional_artin_schreier`: For n = 1 and r = 1 the pairing is the classical Artin-Schreier symbol.
example : True := by sorry -- unit test `logarithmic_is_proper`: The logarithmic part is a proper subsheaf of the de Rham-Witt complex; a construction identifying the two is wrong (the required non-example).
example : True := by sorry -- unit test `differential_symbol_iso`: The differential symbol is bijective, which is what makes the presentation of Kato's groups correct.
example : True := by sorry -- unit test `nondegenerate_not_perfect`: Nondegeneracy of the pairing is not the same as topological perfectness; the two must be stated separately.

/-- finite-coefficient-duality: For an n-dimensional local field K and a prime m
invertible in K there is a perfect pairing between H^i(K, Z/m(r)) and
H^{n+1-i}(K, Z/m(n-r)) into H^{n+1}(K, Z/m(n)), which is Z/m through the
invariant map. For n = 1 this is ordinary local Tate duality. The audit
records that finite-coefficient duality is absent from both libraries and
that even the n = 1 case, local Tate duality, is absent. For the primes not
invertible, that is for p in the wild case, the corresponding statement is
in terms of the logarithmic de Rham-Witt coefficients and is the subject of
the previous node; the roadmap text warns that etale Kummer arguments at an
invertible prime do not prove the characteristic-p case. -/
theorem FiniteCoefficientDuality : True := by sorry

/-- two-dimensional-residue-pairing-acceptance: The two acceptance computations
of the layer are recorded. First, for n = 1 the invariant map is the Brauer
invariant, the pairing K_1(K) times H^1(K) to H^2(K) is the classical one
and the duality is ordinary local Tate duality; the twist is zero and the
degree is two, which is the explicit check the roadmap text asks for.
Second, for K = F_q((u))((t)) of equal characteristic p the residue pairing
is the Artin-Schreier-Witt pairing between K^top_2(K) modulo p^r and the
Witt vectors of K of length r modulo Frobenius minus one, with values in
Z/p^r; its explicit form is the one in subsection 6.4.3 of the source, and
it is nondegenerate by Parshin's theorem. -/
theorem TwoDimensionalResiduePairingAcceptance : True := by sorry

/-! ## HL.3 Higher local reciprocity and existence -/

/-- reciprocity-map: Let K be a d-dimensional local field. The cup product gives
a pairing from K_d(K) times H^1(K) to H^{d+1}(K), which the invariant map
identifies with Q/Z. This pairing induces a homomorphism Psi_K from K_d(K)
to Gal(K^ab/K), identified with the group of homomorphisms from H^1(K) to
Q/Z; it is the reciprocity map. Since the invariant map is natural, for a
finite abelian extension L/K the corestriction makes the square of invariant
maps commute, hence the square relating Psi_L and Psi_K through the norm on
the left and the canonical map on the right commutes, and one obtains an
induced homomorphism Psi_{L/K} from K_d(K)/N K_d(L) to Gal(L/K). The map is
not injective on K_d(K); it becomes injective on the topological quotient
K^top_d(K), and its image is dense. -/
-- The reciprocity homomorphism Psi_K from K_d(K) to Gal(K^ab/K).
def HigherLocalField.reciprocity : True := by sorry

-- The square relating Psi_L and Psi_K through the norm and the canonical map commutes.
theorem HigherLocalField.reciprocity_norm : True := by sorry

-- The induced map Psi_{L/K} on K_d(K)/N K_d(L).
def HigherLocalField.reciprocityQuotient : True := by sorry

-- The image of Psi_K is dense in Gal(K^ab/K).
theorem HigherLocalField.reciprocity_denseImage : True := by sorry

-- The kernel of Psi_K contains the intersection of the l K_d(K), and equals it by the existence theorem.
theorem HigherLocalField.reciprocity_kernel : True := by sorry

-- The square relating Psi_K, the boundary map to K^top_{d-1} of the residue field and the reciprocity map of the residue field commutes.
theorem HigherLocalField.reciprocity_residue_square : True := by sorry

-- For d = 1 it is the classical local reciprocity map with the chosen Frobenius normalisation.
theorem HigherLocalField.reciprocity_one_dimensional : True := by sorry

example : True := by sorry -- unit test `one_dimensional`: For d = 1 the map is the classical local reciprocity map; the Frobenius normalisation must be fixed and checked (the acceptance case).
example : True := by sorry -- unit test `not_injective`: Psi_K is not injective on K_d(K); a construction claiming injectivity on the algebraic group is wrong (the required non-example).
example : True := by sorry -- unit test `unramified_two_dimensional`: For a finite unramified extension of a two-dimensional local field, the image of the constant-field Frobenius and the index of the norm subgroup are the acceptance computation.
example : True := by sorry -- unit test `norm_square`: The norm-compatibility square commutes; a construction for which it does not cannot induce Psi_{L/K}.

/-- isomorphism-theorem: For a finite abelian extension L/K of d-dimensional
local fields the induced map Psi_{L/K} from K_d(K)/N K_d(L) to Gal(L/K) is
an isomorphism. The proof reduces to a cyclic extension of prime degree l
and splits into an index inequality and a surjectivity statement. The index
inequality that the index of the norm subgroup is at most l is proved by the
filtration on the Milnor K-groups: in the unramified case the first
filtration step lies in the norm subgroup and the quotient is identified
with the corresponding quotient one level down the tower, so the induction
on d applies; in the tamely ramified case a similar argument identifies the
quotient with K_d(F)/l; and in the wildly ramified or ferociously ramified
case of degree p there is a surjection from the (d-1)-forms of the residue
field, modulo the images of Frobenius minus one and of d, onto the quotient,
and the source of that surjection has order p. Surjectivity is proved
through the norm residue theorem. -/
theorem IsomorphismTheorem : True := by sorry

/-- parshin-reciprocity-in-characteristic-p: For an n-dimensional local field F
of characteristic p there is a route to all the main theorems of class field
theory that is remarkably simple and uses relatively few ingredients: the
explicit structure of K^top_n(F) as the direct sum of Z, of Z/(q-1) and of
the principal-unit part, the nondegenerate Artin-Schreier-Witt pairing
between K^top_n(F) modulo p^r and the Witt vectors modulo Frobenius minus
one, and the tame symbol. It does not use the cohomological machinery of
HL.2, and the results of subsections 6.6 to 6.8 of the source are not needed
for it. The resulting reciprocity map agrees with the cohomological one of
the previous nodes. -/
theorem ParshinReciprocityInCharacteristicP : True := by sorry

/-- artin-schreier-trees-and-the-explicit-construction: There is a third route,
due to Fesenko, which constructs the reciprocity map explicitly by
generalising the Neukirch and Hazewinkel axiomatic approaches to class field
theory. For a strong Artin-Schreier tree L/F there is an exact sequence
relating Gal(L/F)^ab, the quotient of VK^top_n(L^pur) by the subgroup
generated by the sigma-differences and the norm from L^pur to F^pur, and
VK^top_n(F^pur); from it one defines a homomorphism Y_{L/F} from
VK^top_n(F)/N VK^top_n(L) to Gal(L/F)^ab, proves that the composite of
Y_{L/F} with Psi^ab_{L/F} is the identity, so that Psi^ab_{L/F} is injective
and Y_{L/F} surjective, and then that Psi^ab_{L/F} is an isomorphism.
Passing to the projective limit gives the reciprocity map with dense image.
The construction does not work for trees that are not strong, and the source
gives an example showing it. -/
theorem ArtinSchreierTreesAndTheExplicitConstruction : True := by sorry

/-- existence-theorem: Every open subgroup of finite index in K^top_n(F) is the
norm group of a uniquely determined abelian extension L/F. The proof reduces
to a subgroup N of prime index l and produces an element alpha of the
multiplicative group of F whose orthogonal complement is N, for the tame
symbol if l is prime to p, for the Artin-Schreier-Witt pairing if the
characteristic is p = l, and for Vostokov's pairing if the characteristic is
zero and l = p; in the last case one first passes to F adjoined a primitive
p-th root of unity when necessary and comes back using that the degree is
prime to p. Kummer and Artin-Schreier theory then produce the cyclic
extension, and one induces on the index. Since open subgroups of finite
index of K_n(F) correspond bijectively to open subgroups of K^top_n(F), the
correspondence sending L to N_{L/F} K_n(L) is a bijection between finite
abelian extensions of F and open subgroups of finite index of K_n(F). A
corollary is that the reciprocity map is injective on K^top_n(F). -/
theorem ExistenceTheorem : True := by sorry

/-- kernel-and-completion-statements: Three statements must be kept apart.
First, the reciprocity map Psi_F on K_n(F) has kernel containing the
intersection of the l K_n(F) over l greater than one, and by the corollary
of the existence theorem that containment is an equality; so Psi_F is
injective exactly on the topological quotient K^top_n(F). Second, the image
of Psi_F is dense in Gal(F^ab/F) but is not all of it; a dense image is not
an isomorphism of raw groups. Third, the induced maps Psi_{L/F} on the
quotients by norm subgroups of finite abelian extensions are isomorphisms,
and the profinite completion of K^top_n(F) with respect to the open
subgroups of finite index maps isomorphically onto Gal(F^ab/F). Each of
these is a separate exact statement and the roadmap text says so. -/
theorem KernelAndCompletionStatements : True := by sorry

/-- unramified-acceptance-case: Two acceptance cases are recorded. For n = 1 the
reciprocity map is the classical one and the convention has to be fixed: the
packet takes the arithmetic normalisation, in which a prime element maps to
a lift of the arithmetic Frobenius, which is the convention of the Tau Ceti
ClassFieldTheory layer that the audit names as the duplicate. For a finite
unramified extension L/F of a two-dimensional local field, that is one with
all ramification indices one and separable residue extensions, the norm
subgroup N_{L/F} K^top_2(L) has index equal to the degree, the quotient is
cyclic generated by the class of the symbol of the two local parameters, and
the reciprocity map sends that class to the Frobenius of the constant-field
extension. The commutative square with the boundary map to K^top_1 of the
residue field reduces the computation to the one-dimensional case. -/
theorem UnramifiedAcceptanceCase : True := by sorry

/-! ## HL.4 Explicit symbols and ramification filtrations -/

/-- higher-tame-symbol: For a local field K with finite residue field containing
a primitive p^n-th root of unity, the Hilbert symbol is the pairing sending
a pair (alpha, beta) of classes modulo p^n-th powers to the ratio of a
p^n-th root of beta and its image under the reciprocity map applied to
alpha, with values in the group of p^n-th roots of unity. For an
n-dimensional local field the same definition applies with the reciprocity
map of HL.3 and with K^top_n in place of the multiplicative group, and there
is in addition a tame symbol: the composite of the iterated residue of HL.1
with the (q-1)st power map on the last residue field, which computes the
prime-to-p part of the pairing. The tame symbol and the valuation map split
K^top_n(F) into its free part, its cyclic part of order q-1 and its
principal-unit part. -/
-- The Hilbert symbol of a higher local field containing the relevant roots of unity, defined through the reciprocity map.
def HigherLocalField.hilbertSymbol : True := by sorry

-- The higher tame symbol: the iterated residue followed by the power map on the last residue field.
def HigherLocalField.tameSymbol : True := by sorry

-- The tame symbol computes the prime-to-p part of the Hilbert pairing.
theorem HigherLocalField.tameSymbol_is_prime_to_p_part : True := by sorry

-- The valuation map and the tame symbol split K^top_n(F) into a free part, a cyclic part of order q-1 and the principal-unit part.
def HigherLocalField.KTop_splitting : True := by sorry

-- A subgroup of index prime to p is the orthogonal complement of an element for the tame symbol.
theorem HigherLocalField.tameSymbol_orthogonal : True := by sorry

-- For n = 1 it is the classical Hilbert symbol.
theorem HigherLocalField.hilbertSymbol_one_dimensional : True := by sorry

example : True := by sorry -- unit test `tame_k2_symbol`: The tame K_2 symbol over F_q((u))((t)) evaluated on a pair of parameters is the acceptance computation, and its comparison with the abstract reciprocity map is the check.
example : True := by sorry -- unit test `one_dimensional`: For n = 1 the tame symbol is the classical one (the degenerate case).
example : True := by sorry -- unit test `prime_to_p_only`: The tame symbol does not see the wild part: for a wildly ramified extension its orthogonal complement is not the norm subgroup (the required non-example).
example : True := by sorry -- unit test `splitting`: The valuation map and the tame symbol split off Z and Z/(q-1); a construction that does not is wrong.

/-- explicit-formulas-for-the-hilbert-symbol: There are two branches of explicit
reciprocity formulas for the Hilbert symbol. The first, of Kummer's type,
expresses the symbol through a residue of a differential form: for K =
Q_p(zeta_p) with p odd and principal units epsilon and beta, the symbol is
the residue of log(beta(X)) d log(epsilon(X)) divided by X^p, where
epsilon(X) and beta(X) are power series over the p-adic integers
specialising to epsilon and beta at X = zeta_p - 1. Shafarevich gave a
complete explicit formula for the symbol in a field containing the p^n-th
roots of unity, using a special basis of the group of principal units; it is
hard to use and hard to verify for n > 1, and simpler complete formulas were
found in the seventies, including Vostokov's. The second branch is the one
Vostokov's formula belongs to, and it is the one that extends to higher
dimensional fields and is used in the existence theorem. -/
theorem ExplicitFormulasForTheHilbertSymbol : True := by sorry

/-- vostokov-pairing-and-the-wild-existence-case: Vostokov's explicit formula
defines a pairing V_1 on the topological Milnor K-groups of a higher local
field of characteristic zero whose residue characteristic is p, and it is of
importance both for the study of the topological Milnor K-groups of section
6 and for the existence theorem of section 10.5. In the third case of the
existence theorem, where the characteristic is zero and the index is p, one
produces an element alpha of the multiplicative group such that the given
subgroup is the orthogonal complement of alpha for V_1; if the field does
not contain a primitive p-th root of unity one passes to the extension
obtained by adjoining one and comes back, using that the degree of that
extension is prime to p. -/
theorem VostokovPairingAndTheWildExistenceCase : True := by sorry

/-- ramification-filtrations-and-their-indexing: For a finite Galois extension
of higher local fields one defines the ramification filtration on the Galois
group. The packet fixes the lower-numbering convention as the primitive one
and defines the upper numbering by the Herbrand transform, exactly as in the
one-dimensional case. Tau Ceti has lower-numbering ramification groups for
the places of a function field and the unit filtration of a local field,
which is the K_1 filtration at n = 1; it has no upper numbering and no
filtration on the Milnor K-groups. For a complete discrete valuation field
whose residue field has a p-basis of at most one element there is a further
theory, due to Zhukov, with new lower and upper filtrations in which a
cyclic extension of degree p may have a non-integer ramification break; it
rests on Epp's theorem on elimination of wild ramification and is recorded
here but not developed. -/
-- The lower-numbering ramification groups of a finite Galois extension of higher local fields.
def HigherLocalField.ramificationGroup : True := by sorry

-- The upper numbering, defined by the Herbrand transform.
def HigherLocalField.ramificationGroup_upper : True := by sorry

-- The Herbrand transform relating the two numberings.
def HigherLocalField.herbrand : True := by sorry

-- The upper numbering is compatible with quotients, the lower with subgroups.
theorem HigherLocalField.ramification_quotient : True := by sorry

-- The reciprocity map carries the filtration on the Milnor K-groups into the upper-numbering filtration, in the fixed indexing convention.
theorem HigherLocalField.ramification_vs_K_filtration : True := by sorry

-- For n = 1 the filtrations and the correspondence are the classical ones.
theorem HigherLocalField.ramification_one_dimensional : True := by sorry

example : True := by sorry -- unit test `one_dimensional`: For n = 1 the definitions agree with the classical ramification filtration and with Tau Ceti's unit filtration (the degenerate case).
example : True := by sorry -- unit test `tame_extension`: For a tamely ramified extension the ramification groups vanish from the first step on.
example : True := by sorry -- unit test `non_integer_breaks`: In Zhukov's theory a cyclic extension of degree p may have a non-integer break, so the classical indexing cannot be assumed in that generality (the required non-example).
example : True := by sorry -- unit test `herbrand`: The Herbrand transform converts the lower into the upper numbering and is compatible with quotients; a convention for which it is not is wrong.

/-- kurihara-exponential-and-differential-forms: For a complete discrete
valuation field of characteristic zero there is an exponential homomorphism
relating the differential forms of the field and its Milnor K-groups, which
gives additional information on the structure of the latter and has an
application to explicit formulas. There is also a classification of complete
discrete valuation fields of characteristic zero with residue field of
characteristic p into two types, according to the behaviour of the torsion
part of a differential module; for each type, the quotient filtration on the
Milnor K-groups is characterised, for all sufficiently large members of the
filtration, as a quotient of differential modules. For a higher local field
this, together with higher local class field theory, implies restrictions on
the types of cyclic extension of sufficiently large degree. -/
theorem KuriharaExponentialAndDifferentialForms : True := by sorry

/-- artin-schreier-witt-acceptance-computation: Two computations are recorded
over F = F_q((u))((t)). First, the tame K_2 symbol: for a and b in F^times
the symbol {a, b} has tame image given by the iterated residue of HL.1, and
its comparison with the abstract reciprocity map of HL.3 is the identity,
with the sign fixed by the order of the parameters. Second, an Artin-
Schreier-Witt example: for w a Witt vector over F of length one, that is an
element of F, and a symbol x in K^top_2(F), the pairing (x, w] of subsection
6.4.3 computes the image of x under the reciprocity map applied to the
character of the Artin-Schreier extension defined by w, and evaluating it on
the explicit generators of VK^top_2(F) recovers Parshin's expansion. Every
residue, sign and trace convention used in the two computations is fixed and
tested. -/
theorem ArtinSchreierWittAcceptanceComputation : True := by sorry

/-! ## HL.5 Parshin chains and higher adeles -/

/-- parshin-chains: Let X be a scheme of dimension n and let X_0 inside X_1
inside ... inside X_{n-1} inside X_n = X be a flag of irreducible subschemes
with dim X_i = i. One attaches to the flag a ring K_{X_0, ..., X_{n-1}} by
successive completion and localisation; when everything is regularly
embedded the ring is an n-dimensional local field. For a projective surface
X over a field k, a closed point P and an irreducible curve C through P, the
construction is explicit: complete the local ring of X at P, localise at the
ideal of C, complete again, and take the fraction field; when X and C are
smooth at P the result is k(P)((u))((t)) with t a local equation of C at P
and u a function restricting to a local parameter of C at P. The left-hand
construction is meaningful without any smoothness condition, and the
completed local ring along a flag can have several branches, in which case
the result is a product of fields and not a field. -/
-- A flag of irreducible subschemes of a scheme of dimension n with the expected dimensions.
def Parshin.chain : True := by sorry

-- The ring attached to a flag by successive completion and localisation.
def Parshin.ring : True := by sorry

-- For a regularly embedded flag on a regular scheme the ring is an n-dimensional local field.
theorem Parshin.ring_isHigherLocalField : True := by sorry

-- For a surface, a point P and a curve C smooth at P, the ring is k(P)((u))((t)).
theorem Parshin.surfaceExample : True := by sorry

-- In general the completed local ring along a flag may have several branches and the construction gives a finite product of fields.
theorem Parshin.ring_branches : True := by sorry

-- In dimension one the construction is the completion at a closed point.
theorem Parshin.ring_dimensionOne : True := by sorry

-- Functoriality of the construction in the scheme and in refinements of the flag.
theorem Parshin.functorial : True := by sorry

example : True := by sorry -- unit test `surface_smooth`: For a smooth point on a smooth curve on a surface over a finite field the ring is k(P)((u))((t)), a two-dimensional local field.
example : True := by sorry -- unit test `dimension_one`: For a curve the construction gives the completion at a closed point (the degenerate case).
example : True := by sorry -- unit test `multi_branch`: For a nodal curve through a point the completed local ring along the flag has two branches and the construction gives a product of two fields, not a field (the required non-example).
example : True := by sorry -- unit test `regular_embedding_needed`: Without regular embedding the ring need not be a field; a construction asserting that it always is is wrong.

/-- higher-adeles: For a scheme X of dimension n one forms the adelic object A_X
as the restricted product over all flags of the rings attached to them, the
restriction being a condition on the components in the sense of Parshin,
Beilinson and Huber. The restricted-product condition is part of the
definition and is not to be replaced by the unrestricted product. Mathlib
has a general RestrictedProduct construction and the finite adeles of a
Dedekind domain, which is the one-dimensional case; Tau Ceti has the
repartition space of a function field. Nothing for higher dimensions exists
in either library. -/
-- The restricted product A_X over all flags of a scheme of dimension n.
def Parshin.adeles : True := by sorry

-- The restriction condition on the components, stated explicitly.
theorem Parshin.adeles_restriction : True := by sorry

-- Functoriality in the scheme for the morphisms for which it holds.
theorem Parshin.adeles_functorial : True := by sorry

-- Compatibility with the residue maps of the individual flags.
theorem Parshin.adeles_residue : True := by sorry

-- In dimension one the construction is the ordinary adele ring.
theorem Parshin.adeles_dimensionOne : True := by sorry

-- The subring K_P attached to a point, the minimal subring containing the function field and the completed local ring, which is not a field in general.
def Parshin.subringPoint : True := by sorry

-- The subring K_C attached to a curve, the fraction field of the local ring of the curve.
def Parshin.subringCurve : True := by sorry

example : True := by sorry -- unit test `curve`: For a curve over a finite field the construction is the ordinary adele ring, matching FunctionFieldArithmetic:FA.2 and Tau Ceti's repartition space (the acceptance case).
example : True := by sorry -- unit test `surface_flags`: For a regular surface the flags are the pairs (P, C) with P a closed point on an irreducible curve C, and the components are the K_{P,C}.
example : True := by sorry -- unit test `restricted_not_full`: The unrestricted product over all flags is strictly larger and carries no useful topology; a construction that takes it is wrong (the required non-example).
example : True := by sorry -- unit test `subring_not_field`: K_P is not a field in general, so the components of an adele are not all fields.

/-- residue-maps-along-a-flag: For each flag on a regular scheme the iterated
residue of HL.1, applied to the higher local field attached to the flag,
gives a residue map from the Milnor K-groups of the field to the Milnor
K-groups of the residue field of the closed point of the flag. These maps
are compatible with the inclusions of the intermediate subrings K_P and K_C,
with the functoriality of the adelic construction and with the boundary maps
of the localisation sequences of the successive subschemes. Local residue
compatibility is the condition that makes the sum of the residues over the
flags through a fixed subscheme well defined and is the input to the
reciprocity relations of HL.6. -/
theorem ResidueMapsAlongAFlag : True := by sorry

/-- higher-idelic-and-cycle-complex-input: Two inputs to global reciprocity are
constructed from the adelic object: an idelic one, the restricted product of
the topological Milnor K-groups of the local fields attached to the flags,
modulo the appropriate global subgroup; and a cycle-theoretic one, the
complex whose terms are the direct sums over the points of a fixed dimension
of the Milnor K-groups of their residue fields, with the differentials given
by the residue maps of the previous node. The second is Kato's complex and
its boundary squares to zero. The roadmap text asks for the higher idelic or
cycle-complex input to be defined before the global reciprocity of HL.6 is
attempted. -/
-- The restricted product of the topological Milnor K-groups over the flags.
def Parshin.ideles : True := by sorry

-- The complex whose terms are the direct sums of Milnor K-groups of residue fields of points of a fixed dimension.
def Kato.complex : True := by sorry

-- The boundary of Kato's complex squares to zero.
theorem Kato.complex_d_squared : True := by sorry

-- In dimension one the complex is the divisor sequence of a curve.
theorem Kato.complex_dimensionOne : True := by sorry

-- In dimension one the idelic object is the ordinary idele group.
theorem Parshin.ideles_dimensionOne : True := by sorry

-- The comparison between the idelic and the cycle-theoretic inputs, stated as a theorem to be proved.
theorem Parshin.ideles_vs_complex : True := by sorry

example : True := by sorry -- unit test `curve`: For a curve the complex is the divisor sequence and the idelic object is the idele group (the acceptance case).
example : True := by sorry -- unit test `d_squared`: The boundary squares to zero; with the wrong sign convention for the iterated residue it does not (the required non-example).
example : True := by sorry -- unit test `surface`: For a regular surface the complex has three terms, indexed by the surface, its curves and its closed points.
example : True := by sorry -- unit test `restricted`: The idelic object is a restricted and not a full product, matching the adelic construction.

/-- functoriality-and-direct-images: The adelic construction is functorial for
the morphisms of schemes for which the flags can be transported, and for a
proper morphism there are direct images of differentials and of symbols,
constructed adelically. The direct image of symbols is compatible with the
residue maps and with the norms of the local fields, which is the statement
that makes the reciprocity relations of HL.6 functorial. The general case
requires regularity and properness hypotheses that have to be stated
exactly, and the roadmap text asks that the source route acquire the
original Parshin and Beilinson references with those hypotheses. -/
theorem FunctorialityAndDirectImages : True := by sorry

/-- acceptance-recover-ideles-and-list-surface-flags: Two acceptance cases are
recorded. First, for X a smooth projective curve over a finite field the
flags are the pairs consisting of a closed point and the curve itself, the
attached rings are the completions of the local rings at the closed points,
and the restricted product recovers the ordinary adeles and ideles of the
function field; this is FunctionFieldArithmetic:FA.2's object and Tau Ceti's
repartition space. Second, for X a regular projective surface over a finite
field the flags are the pairs (P, C) with P a closed point lying on an
irreducible curve C, the attached ring is K_{P,C}, which is k(P)((u))((t))
when X and C are regular at P, and the residue maps are the two-step
iterated residues; the intermediate subrings K_P and K_C and the duality
between points and curves are part of the picture. -/
theorem AcceptanceRecoverIdelesAndListSurfaceFlags : True := by sorry

/-! ## HL.6 Higher global reciprocity and local-global principles -/

/-- global-reciprocity-for-arithmetic-schemes: For a regular arithmetic scheme X
of dimension n, assembling the local reciprocity maps of HL.3 along the
flags gives a reciprocity map from the higher idelic object of HL.5, or from
the appropriate cycle-theoretic quotient, to the abelianized etale
fundamental group of X. The theorem to be proved is that this map has the
expected kernel and cokernel and identifies a suitable quotient with the
abelianized fundamental group, in the proper case, or with its tame or wild
variants in the open case. Proper and open, and tame and wild, are different
theorems and are to be stated separately. Neither library has an etale
fundamental group of an arithmetic scheme and none of this exists in either. -/
theorem GlobalReciprocityForArithmeticSchemes : True := by sorry

/-- reciprocity-relations: The relations that make the assembled map well
defined are the vanishing of the sums of the local contributions along the
two kinds of subscheme of codimension one in the flag poset: for a fixed
closed point P, the sum over the curves C through P of the local invariants
at (P, C) vanishes; and for a fixed irreducible curve C, the sum over the
closed points P of C of the local invariants at (P, C) vanishes. Each sum is
finite by the finite-support statement, and each is the higher analogue of
the classical reciprocity law: the second, along a curve, is Weil
reciprocity on that curve, and the first is its dual. -/
theorem ReciprocityRelations : True := by sorry

/-- kato-complexes-and-boundary-square-zero: Kato's complex of an arithmetic
scheme has in degree i the direct sum, over the points x of X of dimension
i, of H^{i+1}(k(x), Z/m(i)) for a coefficient modulus m, with differentials
given by the residue maps of HL.5. The first thing to prove is that the
boundary squares to zero, which is a statement about the signs of the
iterated residues on a flag of length two. Only then can the cohomological
Hasse principles, which are statements about the exactness or the vanishing
of the cohomology of this complex in specified degrees, be attempted; the
roadmap text asks that the complex and the boundary-square-zero statement
come first and that the Hasse principles be sourced. -/
theorem KatoComplexesAndBoundarySquareZero : True := by sorry

/-- tame-and-wild-proper-and-open-variants: Four variants of the global
comparison are stated separately. For X proper and regular over a finite
field or over a number ring, the reciprocity map should identify a quotient
of the idelic object with the whole abelianized etale fundamental group. For
X open, that is the complement of a divisor, the target is the quotient
classifying coverings unramified along the boundary, and there are a tame
version, in which only the prime-to-p part or the tamely ramified quotient
is described, and a wild version, which needs the logarithmic coefficients
of HL.2 and carries restrictions on the wild primes. No general local-global
exactness statement for arbitrary arithmetic schemes is assumed here, and
the packet records the four statements rather than asserting a single one. -/
theorem TameAndWildProperAndOpenVariants : True := by sorry

/-- reduction-of-the-curve-case: For X a smooth projective curve over a finite
field the flags are the pairs consisting of a closed point and the curve,
the idelic object of HL.5 is the ordinary idele group of the function field,
Kato's complex is the divisor sequence, the reciprocity relations are Weil
reciprocity and the product formula, and the assembled reciprocity map is
the global reciprocity map of the function field. The theorem in this case
is therefore global class field theory for a curve over a finite field,
which is owned by FunctionFieldArithmetic:FA.4 and is imported, not
reproved. For a number ring the corresponding statement is global Artin
reciprocity, owned by Tau Ceti's ClassFieldTheory roadmap. -/
theorem ReductionOfTheCurveCase : True := by sorry

/-- what-is-not-proved-globally: The volume that this packet reads is a local
source. Its introduction states that for an introduction to the global
aspects one should see Raskind's review, and Part II contains no proof of a
global reciprocity theorem: its sections treat L-functions, adelic direct
images, buildings, Drinfeld modules, harmonic analysis, Galois cohomology,
recovering fields from Galois groups, skew fields, local reciprocity cycles
and Galois modules. Consequently every statement of this layer is recorded
as an obligation with its hypotheses and none is proved here. A primary
source for the chosen Kato-Saito or later higher-global theorem has to be
acquired, with its exact regularity and properness assumptions, before the
layer can be closed; the roadmap text says so in those words. -/
theorem WhatIsNotProvedGlobally : True := by sorry

/-! ## HL.7 Arithmetic consumers and comparison examples (process layer: no nodes) -/

end TauCeti.HigherLocalFields
