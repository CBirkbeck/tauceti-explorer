# Explicit K₂: symbols, residues and reciprocity — T.3

T.3 connects an elementary valuation formula to the residues used in Milnor and
Quillen K-theory. Its basic object is a pairing of nonzero field elements with
values in the units of a residue field. The pairing must be implemented using
actual valuation-ring units. Its comparison with a connecting homomorphism must
preserve the specified sign. These two requirements determine the interfaces
through which rational-function reciprocity and arithmetic tame kernels use it.

This document covers the umbrella `K2SymbolsBrauer:T.3`: its classical-symbol
clause and its localization, higher-residue and transfer clauses. The existing
[T.3 packet](../packets/K2SymbolsBrauer--T.3.json) owns the tame symbol, its
higher-degree extension and the boundary comparisons. Its T.4 nodes own Milnor
norms. The present [packet](../packets/K2SymbolsBrauer--T.3-2.json) adds a native
unit-factor adapter and makes the comparisons between those owners explicit.
The suggested file is an aid to selecting signatures; the mathematical targets
below determine completion.

The order is classical pairing → higher Milnor residues → T.4 transfers →
localization and transfer comparison. In particular, the Milnor residue
construction does not depend on the localization comparison that consumes T.4.
Quillen localization and transfer are supplied by `GeneralAlgebraicKTheory:K.3`,
and products by `GeneralAlgebraicKTheory:K.7`. No second localization sequence,
Milnor presentation or transfer construction belongs here.

## Conventions and existing substrate

Let F be a field and let v be a surjective valuation F→ℤᵐ⁰. Write

\[
 R=v.\mathrm{valuationSubring},\quad
 k=\mathrm{IsLocalRing.ResidueField}(R),\quad
 a(f)=\operatorname{ord}_v(f)=-\log(v(f)).
\]

A uniformizer π has a(π)=1. Field inputs of a symbol belong to Fˣ. In the pinned
library a(0)=0 is a junk value, so an order-zero condition on an arbitrary field
element does not by itself make that element a unit. All uses below exclude zero
through the carrier or an explicit hypothesis. Residue on a unit is the existing
homomorphism r:Rˣ→kˣ induced by `IsLocalRing.residue R`.

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The statements, including surrounding
hypotheses, of the following declarations provide the substrate:

| Existing declaration | Input and contribution |
| --- | --- |
| `Valuation.ord`, `Valuation.ord_mul`, `Valuation.ord_zpow` | Additive order and integral-power arithmetic; multiplication explicitly excludes zero. |
| `Valuation.nontrivial_valueGroup_of_surjective` | Installs the value-group instance required by the uniformizer/decomposition interface. |
| `Valuation.isUniformizer_iff_ord_eq_one_of_surjective` | Identifies the native uniformizer predicate with order one. |
| `Valuation.exists_eq_zpow_mul_unit_of_surjective` | Produces u∈Rˣ with f=π^a(f)u for every f≠0. |
| `Valuation.isUnit_iff_ord_eq_zero` | Identifies nonzero integral elements of order zero with native ring units. |
| `Valuation.ord_add_eq_min_of_ord_ne` | Provides the unequal-order case needed in the Steinberg valuation split. |
| `ValuationSubring.unitGroupMulEquiv` | Identifies the order-zero subgroup of Fˣ with Rˣ. These are distinct carriers. |
| `ValuationSubring.unitGroupToResidueFieldUnits` | Existing residue map on that subgroup; after the preceding equivalence it is r. |
| `ValuationSubring.surjective_unitGroupToResidueFieldUnits` | Lifts every residue-field unit to a valuation-ring unit. |

The order declarations are in `TauCeti/RingTheory/Valuation/Discrete/Order.lean`.
The valuation-subring declarations are in
`Mathlib/RingTheory/Valuation/ValuationSubring.lean`; the quotient field and map are
in `Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean`. The packet records each
baseline reference separately. These objects are imported, never reconstructed.

Current Tau Ceti and TauCetiRoadmap sources were also checked. In particular,
AlgebraicCurves Layers 2, 5, 9 and 12 own finite normalization, completion and
residue-field compatibility, coefficient expansions, and the scheme/place
dictionary in their respective generality. LocalFieldsRamification supplies
local-field extension arithmetic with its local-field hypotheses. An arbitrary
residue field is not automatically finite. The distinction matters in the norm
proof below; the existing arbitrary-residue completion targets must not be
assigned to a duplicate support roadmap.

## Native unit parts and the classical pairing

For π∈Fˣ of order one, let U_π(f)∈Rˣ be the unique unit with field value

\[
 U_\pi(f)=f\pi^{-a(f)}.
\]

Existence is the pinned decomposition theorem; uniqueness follows by cancelling
π^a(f) in F. Selecting that existing witness is a light native adapter, owned by
`T.3/native-unit-part`. It is not a new discrete valuation or a new unit-group
construction.

The adapter's API is:

| Name | Required statement |
| --- | --- |
| `unitPart` | Takes π∈Fˣ, a proof a(π)=1, and f∈Fˣ, and returns an actual element of Rˣ. |
| `unitPart_coe` | Its field value is fπ^−a(f); equivalently f=π^a(f)U_π(f), and this equation characterizes it uniquely. |
| `unitPart_mul`, `unitPart_zpow` | U_π(fg)=U_π(f)U_π(g) and U_π(f^m)=U_π(f)^m for m∈ℤ. Thus the map is a group homomorphism. |
| `unitPart_unit`, `unitPart_uniformizer_zpow` | U_π(u)=u for u∈Rˣ and U_π(π^m)=1 for every integer m. |
| `unitPart_change_uniformizer` | U_(cπ)(f)=c^−a(f)U_π(f) for c∈Rˣ. |
| `unitPart_residue_bridge` | Under `unitGroupMulEquiv`, reduction of this native unit is the existing `unitGroupToResidueFieldUnits` value. |

These names belong to `TauCeti.T3Native`. Each has a signature in the suggested
file, including separate multiplication and integer-power laws. In the
change-of-parameter signature, π′ is an actual field unit with an order-one
proof and an equality identifying it with cπ. No parameter is represented by
an abstract substitute for a missing theory.

Checks that distinguish the intended adapter:

1. At ord₅ on ℚ, U₅(10)=2 and U₅(1/25)=1. Returning f, or removing only a
   natural power of π, fails these values.
2. At the same valuation, U₁₀(5)=1/2, reducing to 3 in 𝔽₅ˣ, while U₅(5)=1.
   Unit parts depend on the uniformizer.
3. Every native unit u is fixed, and U_π(π^−2)=1. The codomain is the native
   ring-unit type, with its defining inverse equations.

The corresponding suggested examples are `unit_part_at_5`, `unit_part_change`
and `unit_part_existing_unit`. The rational examples use the existing
`Rat.padicValuation` and `Rat.surjective_padicValuation`; order-one proofs for
5 and 10 are explicit constructor inputs. The residue value 3 is stated after
any ring map from the native residue field to `ZMod 5`, avoiding a second
residue-field carrier. These are admitted test statements, not executed proofs
of the numerical values.

The tame pairing retains the owner `T.3/tame-symbol`. For a=a(f), b=a(g), define

\[
 \tau_v(f,g)=(-1)^{ab}r(U_\pi(f))^b r(U_\pi(g))^{-a}.
 \tag{1}
\]

Every reduction in (1) has domain Rˣ. The unit
z=U_π(f)^bU_π(g)^−a has field value f^b g^−a. This proves the native-realization
comparison `T.3/native-tame-formula`:

\[
 \tau_v(f,g)=(-1)^{ab}r(z).
 \tag{2}
\]

It also identifies (1) with the predecessor's implementation using the order-zero
subgroup of Fˣ. The quotient inside (2) is reduced only after its native unit
membership has been established.

Replacing π by cπ multiplies the two unit factors in (1) by c^−ab and c^ab, so
the value is unchanged. The formula is bimultiplicative. The defining Steinberg
condition is τ_v(f,1−f)=1 for f≠0,1. Its proof has four exhaustive valuation
cases. If a(f)>0, the other entry is a unit reducing to 1. If a(1−f)>0, use the
symmetric case. If both orders are zero, (1) is 1. Finally, if a(f)<0, the
ultrametric inequality gives a(1−f)=a(f)=a and f/(1−f) reduces to −1. The total
sign is then (−1)^(a²+a)=1. The last case is essential: neither input need be
integral.

The reusable tame-pairing API, imported from the original owner, consists of:

| Operation | Required statement |
| --- | --- |
| Normalizations | τ(u,π)=ū, τ(π,u)=ū⁻¹, and τ(u,u′)=1 for u,u′∈Rˣ. |
| Multiplication | τ(ff′,g)=τ(f,g)τ(f′,g), and likewise in the second variable. |
| Integral powers | τ(f^m,g^n)=τ(f,g)^(mn) for m,n∈ℤ. |
| Relations | τ(f,1−f)=1; τ(g,f)=τ(f,g)⁻¹; τ(f,−f)=1; τ(f,f)=(−1)^a(f). |
| Universal property | Descend the Steinberg pairing to the actual Milnor K₂ presentation and characterize the induced homomorphism on every symbol. |
| Classical comparison | Transport that homomorphism through the specified Matsumoto equivalence, preserving each ordered symbol. |
| Surjectivity | Lift t∈kˣ to u∈Rˣ and use τ(u,π)=t. |
| Valued embedding | For ord_w(ιf)=e·ord_v(f), e≥1, and induced residue embedding κ, τ_w(ιf,ιg)=κ(τ_v(f,g))^e. |

The last formula applies to any field embedding with that valuation compatibility;
it has no finite-extension hypothesis. The local map R→R_w induces κ. The sign
comparison uses e²≡e modulo 2, and the order-zero quotient in (2) is carried to
its e-th power. An e=0 restriction does not satisfy this contract: the image of π
would be a unit, so the map of valuation rings would not carry the maximal ideal
into the target maximal ideal and would not induce the asserted residue map.

At ord₅ on ℚ the following values are required, using k≃𝔽₅:

| Inputs | τ value | What the check detects |
| --- | --- | --- |
| (2,5) | 2 | The chosen orientation. |
| (5,2) | 3 | Inversion when the arguments are exchanged. |
| (5,5) | 4 | The sign; the pairing is not alternating over the integers. |
| (2,3) | 1 | The all-unit case. |
| (10,5) | 3 | A nontrivial unit factor and sign; the answer is unchanged with π′=10. |
| (1/5,4/5) | 1 | The negative-order Steinberg case: the unsigned quotient reduces to 4 and the sign changes it to 1. |

These tests include nontrivial values and a false alternating-law counterexample;
a constant pairing or an inverted pairing cannot pass them all. At residue
characteristic two the sign is 1, as it should be, so tests solely in that
characteristic cannot detect omission of the sign.

Sources: Weibel, [Chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf),
§6, Lemma 6.3 and Example 6.3.1, chapter/PDF p. 51. That source chooses the
inverse of (1); the conversion is part of the comparison, not a change to (1).

## Higher residues and specialization

Import the graded Milnor ring from `T.2/milnor-k-theory`. Symbols are written
additively here, so K^M₁(k)=kˣ is written additively when it occurs as a graded
piece. Set K^M_−1(k)=0. The targets in this section retain the owners
`T.3/serre-residue-algebra`, `T.3/serre-map-steinberg` and
`T.3/higher-milnor-residues`.

The Serre algebra has homogeneous pieces

\[
 L(k)_n=K^M_n(k)\oplus K^M_{n-1}(k)\Pi,
 \quad |\Pi|=1,\quad
 \Pi^2=\{-1\}\Pi,\quad
 \Pi y=(-1)^{|y|}y\Pi.
\]

For a+bΠ of degree i and c+dΠ of degree j its multiplication is

\[
 (a+b\Pi)(c+d\Pi)
 =ac+\bigl(ad+(-1)^jbc+(-1)^{j-1}bd\{-1\}\bigr)\Pi.
 \tag{3}
\]

The base ring, its graded commutativity and the relation 2{−1}=0 make (3)
associative and graded commutative. The summand on the right is an actual
coefficient module, not a free variable with no relations. The maps
λ_L(a+bΠ)=a and ρ_L(a+bΠ)=a+b{−1} are graded ring homomorphisms. A change of
uniformizer is represented by the algebra automorphism Π↦Π−{c̄}.

The field-unit map d_π(f)={r(U_π(f))}+a(f)Π satisfies the Steinberg relation, by
the valuation cases above and Π²={−1}Π. The Milnor presentation therefore extends
it uniquely to a graded ring homomorphism. Reading the coefficient on the right
in d_π(x)=λ_π(x)+∂_v(x)Π gives

\[
 \partial_v:K^M_n(F)\longrightarrow K^M_{n-1}(k),\qquad
 \lambda_\pi:K^M_n(F)\longrightarrow K^M_n(k).
\]

The residue is normalized with the uniformizer **last**:

\[
 \partial_v\{u_1,\ldots,u_{n-1},\pi\}
 =\{\bar u_1,\ldots,\bar u_{n-1}\},\qquad
 \partial_v\{u_1,\ldots,u_n\}=0.
 \tag{4}
\]

Both maps are surjective: lift residue units and, for the residue, append π. The
specialization λ_π is a graded ring map. The residue is a degree −1 additive map,
with product rule determined by (3), rather than an unqualified derivation:

\[
 \partial_v(xy)=\lambda_\pi(x)\partial_v(y)
       +(-1)^j\partial_v(x)\rho_\pi(y),
 \quad x\in K^M_i(F),\ y\in K^M_j(F),
 \quad \rho_\pi\{u\pi^m\}=\{(-1)^m\bar u\}.
 \tag{5}
\]

The additional API and tests of these imported constructions are explicit:

| Construction | Required API |
| --- | --- |
| Serre algebra L(k) | Direct-sum extensionality; base inclusion; formula (3); associative and graded ring structure; projections λ_L and ρ_L; functoriality under residue-field embeddings; Π↦Π−{c̄} with inverse Π↦Π+{c̄}. |
| The map d_π | Evaluation on field units; multiplicativity into degree one additively; Steinberg annihilation; extension from the tensor algebra and uniqueness after the homogeneous quotient; compatibility with maps of valued fields. |
| Higher residue | Additivity; the all-unit and uniformizer-last rules (4); surjectivity; degree-one order; degree-two equality with τ; uniformizer independence; product law (5); restriction with factor e. |
| Specialization | Evaluation λ_π{u₁π^a₁,…,u_nπ^a_n}={ū₁,…,ū_n}; graded ring laws; surjectivity; the actual change-of-parameter formula below; principal-unit vanishing. |

Checks for L(k): Π²={−1}Π, which is nonzero for k=𝔽₅ because {−1}=4∈kˣ;
Π{2}=−{2}Π; and Π↦Π−{3} followed by Π↦Π+{3} is the identity. Treating Π as
square-zero or as commuting without its graded sign fails these checks.

Checks for d_π: d_π(π)=Π; d_π(u)={ū} with zero Π coefficient; and at ord₅,
d₅(1/5)=−Π while d₅(4/5)={4}−Π and their product is zero. The last identity uses
2{−1}=0 and the nonzero value of Π², so it checks the negative-order case rather
than only the defining positive-order generators.

Checks for the residue: ∂{π}=1∈ℤ; ∂{2,5}=2 and ∂{5,2}=3 at ord₅; and
∂{u₁,u₂,π}={ū₁,ū₂} in degree three, with all-unit triples having residue zero.
For a nonzero degree-three test take residue field ℝ and u₁=u₂=−1: the output
{−1,−1} is nonzero, detected by the real sign symbol. Thus a degree-two-only
implementation does not satisfy the contract.

Checks for specialization: λ₅{2}=2; λ₅{5}=1 but λ₁₀{5}=3 in 𝔽₅ˣ; and
λ_π{uπ^a,u′π^b}={ū,ū′} for arbitrary integers a,b. The identity

\[
 \lambda_{c\pi}(x)=\lambda_\pi(x)-\partial_v(x)\{\bar c\}
 \tag{6}
\]

fixes both the dependence and the side of multiplication. Residue is independent
of π. Requiring specialization to be independent would contradict the second
check.

For completeness of the supporting API, `T.3/serre-map-kernel` identifies
ker(d_π) with the homogeneous ideal generated by degree-one principal-unit
classes {1+m}, m∈maximalIdeal R. It also gives
ker(λ_π)=ker(d_π)+{π}K^M_*(F). For complete F and a positive integer q whose image
is a unit in k, `T.3/rigidity` gives

\[
 (\lambda_\pi,\partial_v):K^M_n(F)/q
 \ \simeq\ K^M_n(k)/q\oplus K^M_{n-1}(k)/q.
\]

The kernel calculation and Hensel lifting supply the proof: principal units are
q-divisible, and the joint surjectivity of d_π supplies the mod-q bijection.
Completeness and invertibility of q are hypotheses, not consequences of the
symbol formula. This is a Milnor K-theory statement.

Sources: Weibel III, Theorem 7.3 and its proof, chapter/PDF p. 62; Corollary 7.3.1,
pp. 62–63; Exercises 7.1–7.2, p. 72, and 7.10, p. 73. The theorem uses a
uniformizer-first convention. The exact conversion, owned by
`T.3/residue-convention-dictionary`, is

\[
 \partial^{\mathrm{first}}_n=(-1)^{n-1}\partial_n.
 \tag{7}
\]

Thus the two conventions agree in degrees one and three and are inverse in
degree two. For the first convention, (5) becomes
∂^first(xy)=(−1)^iλ_π(x)∂^first(y)+∂^first(x)ρ_π(y). At ord₅ with x={5}, y={2},
the last convention gives 3, and the first gives 2. The inherited source findings
E9 and E11 record the specialization and product-rule corrections; the packet
scopes these to the author chapter actually read.

## Finite support and the actual localization boundary

Let V be a family of normalized valuations such that for every f∈Fˣ the set
{v∈V : ord_v(f)≠0} is finite. For a symbol {f,g}, τ_v(f,g)=1 outside the union of
those two finite sets. For a finite sum of symbols, take the union over all
entries. The same argument using (4) gives finite support of every higher Milnor
residue. The existing owner is `T.3/finite-support`.

This hypothesis holds for the places of a one-variable function field and for
height-one primes of a Dedekind domain with fraction field F. The predecessor
cites the pinned `TauCeti.Place.finite_setOf_ord_ne_zero` and
`IsDedekindDomain.HeightOneSpectrum.Support.finite` for those two cases. It is
not a statement about every arbitrarily indexed family of valuations. For
example, infinitely many indexed copies of ord₅ give infinitely many nontrivial
residues of {2,5}; they fail the stated finite-support hypothesis.

For the Dedekind application import the actual localization sequence from K.3,
with dévissage and resolution. Its degree-two segment is

\[
 \bigoplus_{\mathfrak p}K^Q_2(k(\mathfrak p))\longrightarrow K^Q_2(R)
 \longrightarrow K^Q_2(F)\xrightarrow{B^R_2}
 \bigoplus_{\mathfrak p}K^Q_1(k(\mathfrak p))
 \longrightarrow K^Q_1(R)\longrightarrow K^Q_1(F).
 \tag{8}
\]

The existing `T.3/dedekind-localization-boundary` identifies its components with
the DVR boundaries. Exactness gives ker(B^R₂)=image(K₂(R)) and
coker(B^R₂)≃ker(K₁(R)→K₁(F)). It does not by itself give injectivity of
K₂(R)→K₂(F) or surjectivity of B^R₂. The further arithmetic assertions belong to
T.5 and use their additional finite-field and SK₁ inputs.

The critical sign is fixed on an actual product. Write μ_F:K^M₂(F)≃K₂^St(F) for
Matsumoto, c_F:K₂^St(F)≃K₂^Q(F) for `T.1/k2-pi2` followed by
`GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, and η_F=c_Fμ_F. Import the
field determinant det_k:K₁^Q(k)≃kˣ from `KTheoryLowDegrees:U.3/SK1-field` through
`GeneralAlgebraicKTheory:K.2:plus/zero-one-ring-comparison`. Normalize the actual connecting map by
B₁[π]=1∈K₀(k)=ℤ and the right product rule B(x·y)=B(x)·ȳ for y from K_*(R).
Then B₂([π]·[u]) corresponds to ū and B₂([u]·[π]) to ū⁻¹. Therefore
`T.3/degree-two-residue-square` requires equality of homomorphisms

\[
 \partial_2^M
 =\tau_v^{\mathrm{St}}\circ\mu_F
 =\operatorname{inv}\circ\det_k\circ B^R_2\circ\eta_F.
 \tag{9}
\]

Here ∂₂^M is (1) extended to Milnor K₂ and identified with K^M₁(k)=kˣ.
The inversion is indispensable. Setting B^L₂=−B^R₂ instead gives the
uniformizer-last boundary convention, in which det_k B^L₂ η_F=∂₂^M.

To prove (9), use the supplied product-symbol equality on the actual maps,
compute B₁[π] by the index formula, and expand both inputs into uniformizer
powers and units. Boundaries of all-unit products vanish by exactness; the
relation {π,π}={π,−1} handles the remaining diagonal. The two-variable symbol
presentation then gives equality on the whole group. Primewise naturality
extends this to (8), whose residue tuples are in the direct sum by finite
support.

Checks: on {2,5} over ℚ, the roadmap residue is 2 and det_k B^R₂ η_F is 3; on
{5,5}, both conventions give 4 and so that diagonal test alone misses inversion;
on {2,3}, both are trivial at 5. For a finite sum {f₁,g₁}+{f₂,g₂}, the possible
nontrivial support is contained in the union of the four input supports.

Sources: Weibel [Chapter V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf),
§6, Example 6.1.2, chapter/PDF p. 38, and §6.6–6.6.1, p. 41. The former fixes the
positive index boundary; the latter computes the tame boundary. These are
applications of localization rather than a replacement construction of it.

## Transfer, residue degrees and ramification

For every finite field extension E/F, import the Milnor norms from
`T.4/milnor-transfer-transitivity` and Quillen transfers from
`GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`. The Milnor
norm is the Bass–Tate/Kato norm, including inseparable extensions. Its construction
uses the rational-function exact sequence and the valuation at infinity; the
normalization is −∂∞=Σ_p N_p∂_p. Multiplying every degree-(n+1) residue by the same
sign leaves N_p unchanged, so (7) does not change the norm convention.

The norm's API, with existing owners in T.4, is:

| Operation | Exact contract |
| --- | --- |
| Identity, tower, invariance | N_F/F=id, N_E/F=N_L/F N_E/L, and invariance under F-isomorphisms of finite extensions. |
| Degrees zero and one | N on ℤ is multiplication by [E:F]; on Eˣ it is the ordinary field norm. |
| Projection formula | N(res(x)·y)=x·N(y), with the corresponding graded right-hand formula. |
| Restriction then transfer | N(res(x))=[E:F]x in every degree. |
| Arbitrary scalar extension | For A=E⊗_F F′ with Artinian local factors A_i, residue fields E_i and lengths ℓ_i, res N_E/F=Σ_i ℓ_i N_E_i/F′ res_i. F′/F need not be finite. |
| Norm/residue | Under the finite-integral-closure hypothesis below, ∂_v N_E/F=Σ_w N_k_w/k ∂_w. |
| Comparison in degree two | Under μ and c, Milnor norm and Quillen transfer are the same homomorphism for every finite extension. |

The norm/residue statement has a separate finiteness hypothesis. If v has ring R,
require its integral closure S in E to be finite over R. Let w range over its
finitely many extensions, and k_w/k be the residue extensions, including
inseparable residue extensions. Then

\[
 \partial_v N_{E/F}(x)
   =\sum_{w\mid v}N_{k_w/k}\partial_w(x)
   \quad(x\in K^M_n(E)).
 \tag{10}
\]

In degree two, (10) is a product of residue-field norms of tame values. In degree
one it says

\[
 \operatorname{ord}_v N_{E/F}(z)
       =\sum_{w\mid v}[k_w:k]\operatorname{ord}_w(z).
 \tag{11}
\]

There is no extra e_w on the right of (10) or (11). Ramification occurs in the
restriction identity

\[
 \partial_w(\operatorname{res}x)
        =e_w\operatorname{res}_{k_w/k}\partial_v(x).
 \tag{12}
\]

For instance, applying (11) to π∈F gives [E:F]=Σ_w e_w[k_w:k]. Thus a general
claim without the finite-normalization input must establish this equality;
one cannot silently use it for a defective extension. Finite integral closure
holds for complete DVRs and for the function-field normalizations covered by
AlgebraicCurves Layer 2. The latter statement includes inseparable extensions.

The existing Quillen square, `T.3/quillen-transfer-norm-residue`, uses finite
extensions of Dedekind domains and exact restriction of scalars. On residue
K₁ the transfer is the ordinary residue-field norm. The imported
`T.3/milnor-quillen-transfer-comparison` identifies the two finite-field transfers
on K₂, not just on quadratic extensions. Since inversion commutes with every
residue norm, (9) transports the right-boundary square to (10) without changing
its signs or inserting a ramification factor.

Worked checks for the norm and both kinds of functoriality:

1. Put F=𝔽₅((t)), E=𝔽₅((s)), t=s². Then e=2, f=1, N(s)=−t and
   ord_t(N(s))=1, matching (11). For x={2,s}, the projection formula gives
   N(x)={2,−t}; its F-residue is 2, equal to the E-residue followed by the
   identity residue norm. An extra factor e would give 4 and fail. In contrast,
   restricting {2,t} to E has residue 4, as (12) requires.
2. For the unramified extension 𝔽₂₅((t))/𝔽₅((t)), N(t)=t² and the order is 2.
   The residue norm is a↦a⁶. Thus for a residue generator a of order 24, the norm
   has order 4; replacing the norm by the identity or by a ramification factor
   fails. Formula (10) on {u,t} gives exactly this norm for a lift u of a.
3. In characteristic p, 𝔽_p(s)/𝔽_p(t) with t=s^p has N(s)=t. The degree-one
   order formula gives 1 at t=0, with e=p and residue degree 1. Excluding
   inseparable extensions or inserting e in the pushforward gives the wrong
   answer. Separately, N(1)=p in K^M₀ and N(res x)=p x check the degree formula.

The complete-field reduction of the Milnor proof needs more than finite residue
fields. It uses extension valuations and finite integral-closure lattices,
valuation and residue norm identities, arbitrary scalar extension with tensor
component lengths, and the finite-normalization completion product. These are
exact supplier contracts; their unregistered Part II routing remains a gap.
The current AlgebraicCurves completion and coefficient targets are already
owned and are imported. They are not additional work to put into that Part II.

Sources freshly checked for these interfaces: Weibel III, Definition 7.5,
Projection Formula 7.5.2, Corollary 7.5.3 and Theorem 7.6.1, chapter/PDF pp. 64–66;
Corollary 7.6.3, p. 65, is specifically the complete normal prime-degree case;
Exercises 7.7–7.9, pp. 72–73, give base-change and ramification checks. Weibel V,
(6.6.3)–(6.6.4), p. 42, gives the Quillen finite-map square. The general Milnor
norm node additionally cites Gille–Szamuely, Corollary 7.4.3, p. 205 and Appendix
A.6.4. That proof is inherited from its owner, not claimed as a freshly read
source or supplied by Weibel's prime-degree special case.

## Coverage, owners and completion criteria

The umbrella's target inventory is exhaustive:

| T.3 target | Existing owner or added comparison |
| --- | --- |
| Signed classical residue with integral unit parts | `T.3/tame-symbol`, refined by `native-unit-part` and `native-tame-formula`. |
| Parameter independence, bilinearity, Steinberg, surjective symbol homomorphism | `T.3/tame-symbol-uniformizer-independence`, `tame-symbol-steinberg`, `tame-symbol-hom`. |
| Connecting map with fixed sign and primewise localization | `T.3/localization-boundary`, `dedekind-localization-boundary`, reconciled by `degree-two-residue-square`. |
| Finite support on symbols and sums | `T.3/finite-support`. |
| Higher residue, specialization, product signs and parameter change | `T.3/serre-residue-algebra`, `serre-map-steinberg`, `higher-milnor-residues`, `milnor-residue-product-formula`, `specialisation-change-of-uniformiser`, reconciled by `residue-convention-dictionary`. |
| Principal-unit kernel and complete-field mod-q check | `T.3/serre-map-kernel`, `rigidity`. |
| Finite-extension Milnor norms and their tower law | `T.4/milnor-transfer-transitivity`. |
| Ramification and norm/residue | `T.3/ramification-formula`, `higher-ramification-formula`, `transfer-and-norm-residue`; the last two are parented in T.4. |
| Projection formula and degree | `T.4/milnor-projection-formula`, `restriction-transfer-degree`, and K.3's actual transfer functor. |
| Agreement with Quillen transfer | `T.3/quillen-transfer-norm-residue`, `milnor-quillen-transfer-comparison`. |

There are four new nodes and 24 explicit owner imports. This is a complete
planning pass with coverage **planned**. The following exact inputs prevent a
closure claim:

- `G-T3-localization`: K.3's ring application must identify the torsion Serre
  quotient with finite-dimensional fraction-field vector spaces, compatible
  with its actual localization functor.
- `G-T3-product`: the actual ordered Quillen unit product must equal the image
  of the specified Steinberg symbol. K.7 supplies products; T.2 supplies the
  graded symbol map.
- `G-T3-generic-DVR`: the unregistered generic complete-DVR support routing must
  supply the missing extension/lattice/norm/component-length and completion
  product contracts, while respecting AlgebraicCurves' existing completion
  ownership.
- `G-T3-field-comparison`: T.1 and T.2's actual symbol/plus comparisons retain
  their inherited stable-presentation and root-coordinate proof inputs.
  T.1/k2-pi2 also retains `G-cover-Hurewicz`: the explicit BE(F)-plus universal
  cover and natural Hurewicz comparison must be supplied, compatibly with the
  chosen plus/Q comparison, by their existing K.2:plus and homotopy-theory
  owners. The elementary native pairing is independent of those comparison
  gaps.

Completion requires the actual map equalities (1)–(12), the specified APIs and
worked values, the finite-support hypothesis at each family application, and
closure of those supplier chains. All node implementation statuses are
`unchecked`. The suggested file elaborates at the pins with only `sorry`
warnings; its real-bodied definitions are native adapters, and it introduces
no Milnor or Quillen placeholder carriers.

Five umbrella landmarks suffice: the tame symbol, higher Milnor residues,
residue conventions, localization and tame residues, and the norm/residue
formula. Their original mathematical owners are retained.
