# Roadmap: modularity of elliptic curves over imaginary quadratic fields

**Summary.** Every elliptic curve over every imaginary quadratic field has an automorphic
realization. This roadmap builds the geometric prime switch that makes the
modularity lifting theorems apply without a restriction on the original curve's
small residual images. A family of cyclic covers connects its quadratic twist
to a second elliptic curve through three integral congruences. Two degenerations
supply, respectively, the required local reduction types and enough monodromy
to choose one specialization satisfying all the residual conditions.

The endpoint is **`imaginary_quadratic_modularity`**: for an imaginary quadratic
number field K and an elliptic curve E/K, there is an isobaric automorphic
representation π_E of GL₂(𝔸_K), of weight zero and trivial central character,
whose realizations are H¹_ét(E_K̄, Q̄_ℓ) for every ℓ and coefficient isomorphism.
Its finite local parameters agree with the full Frobenius-semisimple
Weil–Deligne parameters, including monodromy, at v∤ℓ. The coefficient-prime
local factors also agree. Its complex parameter is
`z ↦ diag(z/|z|, conjugate(z)/|z|)`, and
`L(E/K,s) = L(π_E,s−1/2)` in unitary normalization. The representation is
cuspidal if E is geometrically non-CM. For CM curves it is quadratic automorphic
induction, or an isobaric sum when the CM field is K. These are the conclusions
of [OpenAI, Theorem 1.1, p.1](#references), with the local assertions separated
in §8.5 below.

## Scope and ownership

This roadmap owns the specific covers of quadratic twists of E, their two
semistable degenerations, the integral regular-module calculation, the four
rank-two character systems and their congruences, and the simultaneous
specialization and automorphy propagation arguments. The geometry, integral
congruences and local specialization results are stated over arbitrary number
fields wherever their proofs permit. Imaginary quadraticity enters the final
choice of a CM cyclotomic extension and its descent, not the definition of the
covers.

The modularity lifting and residual modularity theorems are inputs from their
existing owners. Jacobians, semistable abelian varieties, vanishing cycles,
Hilbert irreducibility, Galois representations, local Langlands and automorphic
transfer also retain their existing owners. A generic cyclic-cover theorem or
a general potential-modularity theorem is not rebuilt here. The mathematical
work here proves the hypotheses of those interfaces for this family and
transports the resulting realization to the next coefficient prime.

The proof does not pass through a classification of quadratic points on small
modular curves. No rank condition on X₀(15), arithmetic point-list data,
algorithm, database comparison or certificate is an input to the endpoint.
The starting theorem for an auxiliary elliptic curve is the residual criterion
of Caraiani–Newton §6.1; their exceptional modular-curve analysis in §7 is not
used. In particular the auxiliary curve's modularity is proved before the
three new lifts, independently of the desired modularity of E.

The definitions of smooth proper curves, relative Jacobians, continuous
compatible systems and automorphic representations use the supplier carriers
below. Their source-specific constructions are README targets until those
carriers are available at the pinned baseline. `Suggested.lean` records the
light formulas on existing carriers, with representative milestones and at
least three distinguishing examples for each retained definition. It does not
encode the endpoint by an arbitrary proposition or by postulating its witness
as data.

## Conventions

- Number fields have fixed algebraic closures; G_L denotes the absolute Galois
  group. E is a smooth proper genus-one curve with its specified origin O.
  In characteristic zero write E as `y²=h(x)` for a separable cubic h. A
  coordinate model does not replace its smooth projective completion.
- H¹ means cohomological étale H¹. The homological Tate module V_ℓ(E) has
  determinant ε_ℓ; its dual H¹ has determinant ε_ℓ⁻¹. Use
  `HT(ε_ℓ)=−1`, so H¹(E) has labelled weights {0,1}. Changing the numerical
  Hodge convention is separate from dualizing a representation.
- Frobenius in the compatible systems and local Langlands is geometric.
  `rec^T(π_v)=rec(π_v⊗|det|_v^(−1/2))`. A good-place H¹ Frobenius polynomial
  is `T²−a_vT+q_v`, whereas its Euler polynomial is `1−a_vT+q_vT²`.
  Frobenius semisimplification of WD retains N; semisimplifying just the Weil
  representation loses information needed at multiplicative places.
- The full covariant Tate-module polynomial in §6.2 instead uses arithmetic
  Frobenius. This is an explicit local device, with its torus, abelian and
  lattice graded pieces. It is not the polynomial on inertia invariants and
  is not obtained by forgetting N in an Euler factor.
- A character θ:μ_n→Q̄_ℓ× acts through the deck action on H¹. Fix an abstract
  coefficient field M=Q(μ_n), an embedding into ℂ and compatible embeddings
  into Q̄_ℓ. A change of prime uses these embeddings, not an independently
  chosen permutation of the character labels. Residual equivalence means
  equality up to isomorphism of semisimplified reductions of stable lattices
  over a common finite coefficient extension.
- Matrices act on columns. In the integral symplectic basis `(a_i,b_i)`,
  `⟨a_i,b_j⟩=δ_ij`. The two Picard–Lefschetz signs are independent
  σ_a,σ_b∈{1,−1}. All existence arguments work for all four choices.
  The scalar operator is `c(u)=2−u−u⁻¹`, with `c(2)=−1/2` and `c(−1)=4`
  over Q; these computed signs are also Lean examples.
- Local ordinary, supersingular and multiplicative assertions are potential
  assertions unless an extension giving the stated reduction is specified.
  A supersingular elliptic curve has both normalized Newton slopes 1/2;
  “nonordinary” for an arbitrary higher-dimensional abelian variety does
  not imply that slope condition.

These conventions follow OpenAI §2, p.4, §§4–5, pp.8–14, and §7.2,
pp.16–19. At a split Tate place the covariant arithmetic Frobenius has roots
1,q and H¹ geometric Frobenius has roots 1,q, with nonzero N. At the complex
argument i the unitary diagonal entries are i and −i, determinant one and
trace zero. Explicitly, the arithmetic Frobenius matrices diag(1,4) on a
split Tate module and diag(1,1/4) on its dual have determinants 4 and 1/4;
geometric Frobenius inverts the second matrix. This Lean example pins the
duality direction. The complex witness excludes replacing the conjugate
entry by a second copy of z.

## Exact supplier contracts

The named outputs below are consumed with their hypotheses. A proposed
upstream interface is a prerequisite to formalization, not a declaration
claimed to exist in Mathlib or Tau Ceti. The current upstream roadmaps and
library have been checked as well as the atlas baseline. In particular the
quadratic-twist layer and relative Picard interfaces already have owners.

| Supplier and exact location | Contract consumed; use in this roadmap |
|---|---|
| `EllipticCurves`, main, Layers 1–4 and Layer 5 “twists” | `quadraticTwistOf`, `quadraticTwist`, `quadraticTwistPointEquiv` and Galois compatibility; torsion, Weil pairing, Tate duality, local reduction and the integral-j criterion for potential good reduction. Use the existing twist in §1.1 and its quadratic character in §8.4. The main CM theorem is not supplied by its CM-action vocabulary. |
| `JacobianChallenge`, main, Layers A–D and F | Divisors, Abel's criterion, Riemann–Roch, Pic⁰ and pullback/norm. Pic⁰ exists for a smooth proper geometrically connected curve without a rational point; its identification with the curve requires a point. Used in §§1.2, 4.2. |
| `AbelianSchemesAndArithmeticModuli`, [upstream #849](https://github.com/CBirkbeck/TauCetiRoadmap/pull/849), A0.3, A3 and A6 | `abelianPicardInputs`, finite-flat torsion and pairings, rational endomorphisms, isogeny factors and realization functoriality. The relative Jacobian and the action of deck correspondences remain actual schemes and maps. |
| `NeronModelsAndSemistableAbelianVarieties`, [upstream #852](https://github.com/CBirkbeck/TauCetiRoadmap/pull/852), §§3.5, 3.10, 3.14; §§4.1–4.4, 4.13; §§5.3, 5.6; §6.10 `StrictCompatibleSystemExport` | Raynaud uniformization and valuation pairing; Pic⁰ of a nodal curve and its graph lattice; compact-type Jacobians; potentially semistable comparison including the residue prime; compatible H¹. The local constancy deduction and the characterwise rank argument in Layer 6 are owned here. |
| `LefschetzPencilsAndVanishingCycles`, [upstream #873](https://github.com/CBirkbeck/TauCetiRoadmap/pull/873), LPV.2 §2.8 and LPV.7a nodal-curve monodromy | Picard–Lefschetz and the local smoothing-order-one transvection. Layer 3 supplies this family's actual cycles, integral marking and common transport, rather than assuming its monodromy is that of a Lefschetz pencil. |
| `SmallRamificationAndAbelianVarietyBaseCases`, [upstream #970, §5.0d](https://github.com/CBirkbeck/TauCetiRoadmap/blob/2687dda174737b65c65d3abe257f848bfc77c444/TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md#50d-minimal-lifts-and-their-compatible-families) | Shared `AutomorphicSystemData` for an arbitrary number field and rank, with coefficient field, good polynomials, finite realization fields and labelled Hodge data. Its operations are separate from compatibility predicates. Populate this carrier in §4.1; do not create a competing rank-two carrier. |
| `PotentialModularityAndCompatibleSystems`, R24.1–R24.5, together with `AutomorphicGaloisRepresentations` §7.1 | Compatibility predicates, coefficient extension, finite restriction, residual semisimplification and common-polynomial recognition, adapted to the single shared raw carrier above. Potential modularity R23.4 is a transitive input to the residual-modularity supplier, not a hypothesis on E. |
| `ArithmeticGaloisRepresentations`, [upstream #856](https://github.com/CBirkbeck/TauCetiRoadmap/pull/856), R01.2, R01.4–R01.6 | Full WD carrier and conventions; Serre large image over a fixed number field, commutators, Goursat, Chebotarev and Brauer–Nesbitt recognition; dual Tate modules and determinant. Layer 7 owns the simultaneous all-character specialization. |
| `FaltingsFinitenessAndIsogenyTheorems`, [upstream #1004](https://github.com/CBirkbeck/TauCetiRoadmap/pull/1004), R28.4 | Semisimplicity of the rational Tate representation of an abelian variety, preserved on deck-character summands. |
| `AutomorphicGaloisRepresentations` §3.13, `geometricCharacter_isHeckeAvatar`, and `AutomorphicGaloisRepresentationsPartII` AG2.0, `AlgHeckeChar.galoisChar` | A continuous rank-one character over a finite extension of Q_ℓ, finitely ramified and de Rham above ℓ, is an algebraic Hecke-character avatar; conversely such avatars have the prescribed labelled Hodge degrees and local class-field parameters. Together with CM endomorphism eigenspaces and common Frobenius polynomials, this supplies the CM comparison in §8.6. No higher-rank Fontaine–Mazur assertion is consumed. |
| `ModularityAndLanglandsExtensions` §2.6 `TauCeti.PotentialAutomorphy.potentiallySemistableCM` | Full Caraiani–Newton Theorem 5.2, with inverse-cyclotomic determinant and its potentially crystalline / noncrystalline local alternatives. We apply only at ℓ=3 or p>100, so its exceptional ℓ=5 projective-field condition does not occur. No adequacy or polarization is added. Exact applied statement is §5.2. |
| `ModularityAndLanglandsExtensions` §2.29 `CMResidual.modular_curve_with_types` and its CN Theorem 6.1 consequence | For a CM field without ζ₅, cyclotomically absolutely irreducible, decomposed-generic mod-5 elliptic cohomology is automorphic. Its independently modular prescribed-type auxiliary curves come from AKT; §5.3 uses that established residual criterion once. |
| `OrdinaryAutomorphicFormsAndModularityLifting` R21.1, R21.4 | Quadratic Steinberg-twist ordinarity at sufficiently deep level, allowing ramified quadratic characters; independent CM ordinary/dihedral inputs to the preceding seed supplier. |
| `AutomorphicGaloisRepresentationsPartII`, [upstream #1006](https://github.com/CBirkbeck/TauCetiRoadmap/pull/1006), AG2.4–AG2.7 | Attached semisimple Galois representations, common good-place polynomials and Varma's underlying semisimplified Weil comparison at v∤ℓ. Full ramified nonselfdual N equality is not an input for an arbitrary intermediate π. Layer 8 derives precisely what it needs. |
| `CrystallineLocalGlobalCompatibilityCM` CL.9 | Its qualified version of CN Theorem 5.2 has an additional cyclotomic-degree-three / A₄ qualification. This is not the full theorem used at the large prime. The full owner is §2.6 above; CL supplies the local comparison infrastructure through that owner. |
| `InverseGaloisAndArithmeticFundamentalGroups`, [upstream #850](https://github.com/CBirkbeck/TauCetiRoadmap/pull/850), IG.0 arithmetic fundamental groups and IG.2 “Hilbert specialization with local conditions” | Hilbert subsets are dense in finite products of local opens on affine space. Apply also to connected finite covers with a constant field. Layer 7 identifies the finite quotient and its constant-field kernel. No Hilbert theorem for an arbitrary variety is assumed. |
| `GL2AutomorphicRepresentationsAndTransfer`, [upstream #931](https://github.com/CBirkbeck/TauCetiRoadmap/pull/931), R16.3–R16.6, R17.4 | `cyclicBaseChange_local`, `cyclicBaseChange_galois`, cyclic-descent fibers, soluble towers and `quadraticInduction` with local compatibility, central character and twists; strong multiplicity one. Used in §§8.4–8.6. |
| `EllipticCurveModularity` R29.6, [upstream #1018](https://github.com/CBirkbeck/TauCetiRoadmap/pull/1018), and `ClassicalSerreModularity` R32 | Rational modularity and classical residual modularity are transitive inputs of the independently proved seed route, not replacement CM lifting theorems. `GL2ModularityLifting` supplies the rational/totally real parts of that closure; it does not by itself give the CM theorem of §5.2. |

The live shared-carrier contract deliberately supersedes older references to a
separate compatible-system record in the atlas snapshots. Its good polynomials
do not force descent of a λ-adic representation to M_λ: the specified finite
realization extension is retained. No comparison is asserted by raw data alone.

The pinned ingredients in `Suggested.lean` are Mathlib
`Finsupp.single`, `Finsupp.sum`, `RatFunc.mk`, `RatFunc.eval`, `Polynomial.C`,
`Polynomial.X`, `ZMod`, `Matrix.circulant`, `Matrix.mulVec`, `Matrix.det`,
`Matrix.trace`, `Units`, `orderOf`, and the norm and conjugation of `Complex`.
The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Matrix transvections, circulants,
root-of-unity groups and generic character orthogonality already belong to
the libraries; only the source-specific combination `2−u−u⁻¹` and its word
are named here. Current Tau Ceti has the elliptic Tate Galois representation
`WeierstrassCurve.tateModuleGaloisRepresentation`; it is consumed through
ArithmeticGaloisRepresentations, not redeclared with a new carrier. No unused
Tau Ceti module is imported by the light signature file.

## How to read the build

| Layer | Output used next |
|---|---|
| 1 | Normalized cyclic covers of the twist, with compatible quotient maps and reflection. |
| 2 | Compact-type fiber E^m and the second nodal fiber with m smoothing-order-one nodes. |
| 3 | Integral regular-module marking and two opposite monodromies in a common basis. |
| 4 | Rank-two character systems, elliptic endpoints and integral congruence chain. |
| 5 | Applied automorphy contracts and the auxiliary-prime choice; no new lifting theory. |
| 6 | Nonempty local parameter opens preserving the required three potential reduction types. |
| 7 | One Hilbert specialization giving every residual and local condition simultaneously. |
| 8 | Initial seed, three lifts, descent, all-place comparison and the CM alternatives. |

Each named target below has its hypotheses, proof route and prerequisites in
its subsection. “API” names the usable outputs of a definition or construction;
“Checks” distinguishes it from plausible incorrect versions. Page numbers are
printed pages of the fixed sources in References. Layer 3 is integral even at
coefficient primes dividing the cover degree. That integrality is the reason
the route can change primes at Layer 4.

## Layer 1: Cyclic covers of a family of quadratic twists

### 1.1 The parameter open and its marked points

For an arbitrary number field k, an elliptic E/k in the form `y²=h(x)`, and
an odd n≥3, set `B_t: h(t)y²=h(x)`, with origin O and marked point
`R_t=(t,1)`. Put `S_t=[n]R_t`. Define **`switchParameterOpen`** as the
nonempty Zariski open U⊂A¹_k where h(t)≠0 and the five points
`O,R_t,−R_t,S_t,−S_t` are pairwise distinct. The B_t are the existing
quadratic twists from EllipticCurves; the displayed equation is their
coordinate presentation. Define **`markedTwistFamily`** as this elliptic
scheme with its two sections over U. (OpenAI §3, before Lemma 3.1, p.5.)

To prove nonemptiness, pull back along `E→A¹`, `(t,s)↦t`. The equation
identifies B_t with the constant E by `(x,y)↦(x,sy)`, sending R_t to the
parameter R=(t,s). Coincidences among the five sections force R into the
kernels of [2], [n], [2n], [n−1] or [n+1]; all are finite in characteristic
zero, with n−1 nonzero. Thus removing these points and the branch points
leaves a nonempty open. This also proves **`parameter_open_nonempty`**.

**API.** `switchParameterOpen.mem` gives exactly the two guards above;
`markedTwistFamily.sections` supplies R,S and S=[n]R;
`markedTwistFamily.constant_pullback` gives the displayed isomorphism over
the double cover, with the origin, R and all multiplication maps respected.
These identifications commute with finite extensions of k.

**Checks.**

- A root t of h has h(t)=0 and is excluded even if the equation has points;
  it is not an elliptic twist in this family.
- At n=1 one has S=R identically and this open would be empty. The hypothesis
  n≥3 is necessary. For n=3 the excluded torsion includes [2]R=0 and [4]R=0.
- Changing s to −s changes the constant-family isomorphism by [−1]. The
  twist and its origin remain defined over k; no global square root of h(t)
  is assumed in U(k).

### 1.2 The normalized principal function

For an abelian group G write **`coverDivisor n R S`** for the formal divisor
`(S)−(−S)−n(R)+n(−R)` in `G→₀Z`. This is a light definition on point
divisors; the geometric comparison uses divisors on B_t. Its degree is zero
and its Abel sum is `2S−2nR`. In the family S=[n]R, Abel's criterion on a
genus-one curve makes it principal. There is a unique function **`coverFunction`**
on B_t with this divisor and value 1 at O. Since all the data and O are
k-rational, uniqueness descends the function to k, and works relatively after
shrinking U. (OpenAI Lemma 3.1 and proof, p.5.)

**API.** `coverDivisor_degree`, `coverDivisor_abel` and
`coverDivisor_abel_mul` give degree, Abel sum and its vanishing for S=[n]R.
`coverFunction.divisor` and `coverFunction.at_origin` specify f and its scalar;
`coverFunction.negation` proves `f(−Z)=f(Z)⁻¹` by comparing divisors and
values at O. `coverFunction.baseChange` identifies the normalized functions
under field extension and the constant-family pullback of §1.1. This is
principality of this divisor, not the assertion that all degree-zero divisors
are principal.

**Checks.**

- On the test group Z, n=3,R=1,S=3 gives coefficients 1,−1,−3,3 at
  3,−3,1,−1 respectively, and Abel sum zero. All four values occur in Lean.
- For n=3,R=1,S=4 the degree is still zero but the Abel sum is 2. This
  negative control rules out omitting S=[n]R from principality.
- For n=1,S=R the formal divisor vanishes. The algebraic definition is
  meaningful there but gives no two-branch cover. Collision guards are
  attached to the geometric construction, not silently built into Finsupp.
- Multiplying f by a constant a with a²≠1 preserves its divisor but destroys
  the normalized relation `f(−Z)=f(Z)⁻¹`. Value 1 at O fixes this ambiguity.

### 1.3 The covers and their dihedral symmetry

For m>1 dividing n construct **`cyclicCover m`**, the normalization of the
smooth proper B_t in `k(B_t)[Y]/(Y^m−f)`, and its map to B_t. The ±S
valuations of f are ±1, while the ±R valuations are multiples of m. Thus
there are exactly two totally ramified branch sections, the cover is
geometrically connected and Riemann–Hurwitz gives genus m. Spread this
construction to a smooth proper family C_m→U, shrinking the common U for
the finitely many m if necessary. The construction and the reflection
`w(Z,Y)=(−Z,Y⁻¹)` are over k. The rotations `u_ζ(Z,Y)=(Z,ζY)` are defined
over k(μ_m). They satisfy `w²=1` and `wu_ζw=u_ζ⁻¹`.
(OpenAI Lemma 3.1, pp.5–6.)

**API.** `cyclicCover.branch` identifies the two branch divisors and their
ramification indices; `cyclicCover.genus` gives genus m;
`cyclicCover.dihedral` gives the displayed maps and relations on the proper
normalization, including the charts where Y=0 or ∞. For d|m,
`cyclicCover.quotient` is `(Z,Y)↦(Z,Y^(m/d))` to C_d, compatible with
composition, rotations and w. The d=1 output is B_t, denoted C₁ for this
quotient statement; it is not another branched cover of genus m.

**Checks.**

- For m=3 the two ramification contributions total 4, so `2g−2=4` and
  g=3. Taking an unramified cover instead would give genus one.
- With n=3p and m=3p, the quotient to C₃ uses Y↦Y^p and the quotient to
  C_p uses Y↦Y³. Interchanging these exponents gives the wrong equations.
  The Lean witness uses p=101: 303/3=101 and 303/101=3.
- Reflection conjugates a rotation to its inverse, and is defined before
  adjoining μ_m. Commutation would be false for a primitive cubic rotation.
  The integral matrix witness `R=[[0,−1],[1,−1]]`, `W=[[0,1],[1,0]]`
  gives `WRW=[[−1,1],[−1,0]]` and `R(WRW)=I`; both equalities occur in
  Lean. It tests the dihedral convention, without replacing the curve maps.
- At m=1 the map is the identity of B_t; at m=2 the odd-degree geometry
  below is not asserted. Positive residue characteristic dividing m is not
  included in this characteristic-zero smooth-family statement.

### Examples

For n=3p, the tower contains C₃p, C₃, C_p and B. Pullback after choosing
s²=h(t) turns the base twist into E but keeps the normalization f(O)=1.
This common normalization supplies compatible covers in the tower rather
than separately chosen μ_m-twists. The m=3 branch calculation already
explains why a genus-one reflection quotient can appear later.

### Dependencies

EllipticCurves Layer 5 supplies twists and their Galois action; JacobianChallenge
A–B supplies divisors, Abel's criterion and Riemann–Hurwitz. Normalization,
finite covers and relative smoothness come from the scheme and curve suppliers
in the closure. No modularity theorem is used in Layer 1.

## Layer 2: Two degenerations with different Jacobian behavior

### 2.1 The regular local models

Work on the constant-E parameter cover from §1.1. Over a finite extension of
k containing the chosen boundary point and μ_m, complete the parameter curve
at R=O, or at `R_*=a/(2n)` in a complex uniformization
`E(C)=C/(Za+Zb)` with a,b an oriented lattice basis. Here `[n]R_*=a/2` is
nonzero two-torsion, and the remaining marked points stay distinct. These
complex labels select algebraic torsion points; the local model descends to
a number field containing them. **`boundary_regular_model`** constructs one
blow-up of the colliding branch sections followed by normalization and proves
regular semistability with m nodes, each of smoothing order one.
(OpenAI Lemma 3.2, p.6, and Lemma 3.5, p.7.)

At O the four tangent positions on the exceptional line are 1,−1,n,−n;
characteristic zero and n≥3 make them distinct. At the second boundary the
local equation at each node has the form `XU=−2nt`, with t=R−R_* a local
parameter. The unit −2n makes the exponent of t equal to one. A ramified
change t=s^e would multiply the exponent by e; no such base change is hidden
in the monodromy calculation.

**Checks.** The four tangent positions at n=3 are ±1,±3; they collide at
n=1. The coefficient −2n is a unit in these characteristic-zero local rings,
including when a later coefficient prime divides n. A model over the local
ring of the parameter in characteristic zero says nothing about smoothness
of an integral arithmetic model modulo a prime dividing m.

### 2.2 The compact-type fiber and its exceptional function

Define **`compactTypeModel`** to be this regular model at O with its deck
action and marking of the components. Its special fiber consists of a
rational spine meeting m disjoint elliptic leaves, each isomorphic to E;
the deck rotation cyclically permutes the leaves. The dual graph is a tree.
Therefore the relative Pic⁰ is an abelian scheme near O and its fiber is
E^m, with the factors marked by the deck action. This yields
**`compact_type_jacobian`**. (OpenAI Proposition 3.3, pp.6–7.)

The function on the exceptional line with coordinate v is the light
**`exceptionalFunction K n`**:
`((v−n)/(v+n)) ((v+1)/(v−1))^n` in RatFunc K. For m|n, the substitution
`Y'=Y((v−1)/(v+1))^(n/m)` reduces the equation to
`Y'^m=(v−n)/(v+n)`, a rational component. For odd n, the attaching values
at v=0 and v=∞ are both 1. On the other component the normalized function
is 1, which gives m copies of E, each attached at one point. This describes
the components and the actual gluing, not just their arithmetic genus.

**API.** `compactTypeModel.components` returns the leaves, spine and nodes;
`compactTypeModel.rotation` identifies the regular permutation action;
`compactTypeModel.picard` identifies Pic⁰ with the product of the leaf
Jacobians. `exceptionalFunction_eval` is the displayed formula where
v+n and v−1 are nonzero; `exceptionalFunction_cancel` is the substitution
identity for m>0,m|n; `exceptionalFunction_at_zero` gives the odd-n value.
At infinity the reduced numerator and denominator have the same leading
coefficient, giving value 1. These rational identities hold on RatFunc over
any field where stated; the geometric semistability conclusion retains the
number-field and odd-n hypotheses.

**Checks.**

- At n=m=3 the graph has four vertices and three edges: its first Betti
  number is zero and Pic⁰ is E³, an abelian variety of dimension three.
- Over Q, the function at v=0 is 1 for n=3, but −1 for n=2. Its value
  at v=2 for n=3 is −27/5, fixing both reciprocal choices. All are Lean examples.
- At n=1 the rational function cancels to 1. This algebraic boundary does
  not create a genus-one branched family with four distinct tangent positions.
  The n=0 function is also 1. At n=1,v=1, RatFunc evaluation after
  cancellation is 1; the displayed quotient formula requires v−1≠0.
  In characteristic three, n=3 gives value −1 at zero after cancellation,
  so the odd-n attaching-value theorem retains characteristic zero. These
  cancellation and characteristic controls also occur in Lean.
- For n=3p,m=3 the exponent n/m is p. Replacing it by m/n does not cancel
  the n-th power, and misses the rational spine.

### 2.3 The nodal fiber and its graph lattice

Define **`nodalModel`** at R_* with the two components and all nodes marked.
One component is a connected unramified degree-m elliptic cover E'→E;
the other is rational. The class determining E' has exact order m,
represented in the chosen uniformization by −a/m. They meet in m nodes,
cyclically permuted by the deck group. Its graph has two vertices and m
parallel edges, hence first Betti number m−1 and arithmetic genus
`1+(m−1)=m`. Its generalized Jacobian has abelian part E' and toric rank
m−1. (OpenAI Lemma 3.5, p.7.)

**API.** `nodalModel.elliptic_cover` records connectedness, exact degree and
the order-m class; `nodalModel.graph` identifies the edge permutation module
and its augmentation kernel; `nodalModel.smoothing` gives the order-one
node charts from §2.1. The marked edge differences become the vanishing
cycles in §3.2. A disconnected trivial μ_m-torsor over E would change the
component graph and fails this interface.

**Checks.**

- At m=3 there are two vertices and three edges, giving toric rank two
  and total genus three, rather than the toric rank zero of §2.2.
- At m=1 the graph Betti number is zero. The formula is meaningful for a
  graph but the constructed branched family is only for odd m>1.
- Dividing a by m gives an exact-order-m class because a is primitive.
  A class of smaller order would split the unramified cover and is excluded.
- The exponent in `XU=−2nt` is one. Replacing it by t^m would multiply
  every node transvection by m and invalidate reduction modulo m.

### Examples

The two degenerations have equal genus and sharply different integral
monodromy. The O fiber is compact type and marks H₁ as m elliptic factors.
The R_* fiber contributes m node cycles with one relation. Keeping the
first marking while moving to the second degeneration is what allows two
transverse monodromies to be compared in one lattice in Layer 3.

### Dependencies

Layer 1 supplies normalized functions and the common covers. The Néron-model
supplier §§4.1–4.4 and 4.13 supplies Pic⁰ of nodal curves, its graph character
lattice and the compact-type criterion. Local normalization and blow-ups are
used here for these equations; arithmetic semistable reduction is not inferred
from this parameter degeneration.

## Layer 3: Integral homology and a common monodromy basis

### 3.1 A unimodular regular-module marking

Over C, take the parameter R=sa close to O and slit E along the short arc
from −sa to sa. **`slit_marking`** identifies the cover outside this slit
with m sheets and describes cyclic gluing along the slit. Choose the a and
b loops on each sheet away from it. Their lifts a_i,b_i, indexed by Z/m,
have intersection `⟨a_i,b_j⟩=δ_ij`, and zero pairings within the a's or
within the b's. They form an integral basis, not just a rational basis.
(OpenAI Lemma 4.1, p.8, Proposition 4.2, p.9.)

The target **`integral_regular_module`** identifies H₁(C_m,Z), and then
H¹(C_m,Z), with `Z[μ_m]^2`, the direct sum of two copies of the **group
ring of the finite cyclic group**. The deck generator shifts each index
by one. To prove integrality, the intersection matrix of the displayed
2m classes has determinant one. A full-rank sublattice of index d in the
unimodular H₁ lattice would have determinant d², hence d=1. Taking the
integral dual uses the perfect coefficient-of-identity pairing on the
regular group ring. It uses no averaging by 1/m.

**API.** `slit_marking.basis` returns the integral symplectic basis and its
orientation; `slit_marking.deck` gives the cyclic shift. The étale comparison
**`integral_regular_module_etale`** gives a free rank-two
`Z_ℓ[μ_m]`-module H¹_ét(C_m,Q̄ base,Z_ℓ) for every ℓ, including ℓ|m.
Its marking and the quotient maps of §1.3 are retained for the character
specializations in Layer 4. (OpenAI Proposition 4.2 and Remark 4.3, p.9,
with integral singular–étale comparison.)

**Checks.**

- For m=3 the integral lattice has Z-rank six. The cyclotomic integer ring
  Z[ζ₃]² has rank four and cannot be substituted for Z[μ₃]².
- A sublattice generated by 2a₀ and the other basis vectors has index two
  and intersection determinant four. Rational spanning alone does not pass
  the integral test.
- For ℓ=3,m=3 the group ring is not semisimple modulo 3; freeness still
  holds. An idempotent formula requiring 1/3 would not prove this statement.
- Rank zero or a single regular summand fails the rank 2m requirement.
  The genus-one quotient will be obtained by invariants, not by replacing
  the whole H¹ lattice by one elliptic factor.

### 3.2 Vanishing cycles as adjacent differences

Keep the marking of §3.1 and move R along a chosen path to a/(2n).
The m vanishing cycles are
`δ_i=±(a_i−a_(i+1))`, after a possible reversal of the cyclic indexing;
the signs of individual cycles do not affect their transvections.
**`vanishing_cycles_adjacent`** proves this formula by following the short
slit to the collapsing nodes. The sum of the adjacent differences is zero
and their span has rank m−1. Transporting the compact marking along the
b-direction instead gives the corresponding b differences, in the same
near-O fiber. (OpenAI Lemma 4.4, p.9, proof of Theorem 4.5, pp.10–11.)

The graph-cycle description from §2.3 and the topological cycles are compared
integrally, before tensoring with Q_ℓ. Each node has smoothing order one,
so Picard–Lefschetz contributes one transvection per adjacent difference.
No assertion about all possible monodromy generators of an arbitrary family
is needed.

**Checks.** At m=3 the differences a₀−a₁, a₁−a₂, a₂−a₀ sum to zero
and any two are independent. Reversing a vanishing cycle changes both
factors in the transvection and leaves its contribution unchanged. Replacing
the adjacent differences by a_i would give rank m and the wrong invariant
trivial-character subspace.

### 3.3 The two transformations in one basis

Define the light **`cyclicLaplacian m`** as the circulant integral matrix
for `2−u−u⁻¹` on Z[Z/m]. Its `(i,j)` entry is
`2 δ_ij − δ_(i,j+1) − δ_(i,j−1)`, with multiplicities even when the two
neighbors coincide. **`common_basis_monodromy`** gives two transformations
T_a,T_b on the marked H₁:

```text
T_a(a_j)=a_j,  T_a(b_j)=b_j+σ_a(2a_j−a_(j−1)−a_(j+1)),
T_b(b_j)=b_j,  T_b(a_j)=a_j+σ_b(2b_j−b_(j−1)−b_(j+1)).
```

Both formulas use this single basis; σ_a and σ_b are independent signs.
They follow by summing the node transvections of §3.2 and transporting both
paths through the compact-type neighborhood. Two independent choices of
bases would not show that the two unipotents have different fixed lines.
(OpenAI Theorem 4.5, pp.10–11.)

**API.** `cyclicLaplacian_symmetric` identifies the transpose;
`cyclicLaplacian_row_sum` gives row sum zero for m>0;
`cyclicLaplacian_pairing` gives
`Σ_i x_i(Ly)_i=Σ_i(x_i−x_(i+1))(y_i−y_(i+1))` over Z.
The target `common_basis_monodromy.character` evaluates u at a character
value λ to give the two opposite-root unipotents with entries
σ_a c(λ),σ_b c(λ), up to the common dual convention. Contragredience
interchanges/inverts the two matrices and preserves all later irreducibility
and trace tests. Its sign is retained rather than guessed.

**Checks.**

- For m=1 the matrix is zero. For m=2 its first row is (2,−2); for m=3
  it is (2,−1,−1). All three are Lean examples and rule out losing the
  repeated edge at m=2 or either minus sign.
- On a vector with x₀=1 and all other x_i=0 at m=3, the quadratic value
  is 2, the sum of the two adjacent squared differences. Constants have
  value zero and are fixed by both transformations.
- At a primitive cubic root λ, `c(λ)=3`; the trivial character gives c=0.
  Irreducibility below excludes the trivial character and coefficient
  characteristic dividing the character order.
- The two rank-one shear matrices with nonzero upper and lower entries
  fix the lines y=0 and x=0 respectively. A common upper-triangular pair
  would leave y=0 invariant and fails the required conclusion.

### Examples

The integral calculation survives at ℓ|m, where character projectors cannot
be used. At the later geometric-monodromy step ℓ∤m, the same lattice can
be evaluated on characters. At m=3 and ℓ=5 this gives c=3, an invertible
coefficient, so the two local monodromies have opposite fixed lines modulo 5.

### Dependencies

Layer 2 marks the compact-type lattice and supplies the node charts. The
Picard–Lefschetz supplier LPV.2 §2.8 supplies transvections; comparison of
singular and étale cohomology transports the integral marking. Mathlib's
circulant, finite cyclic groups and matrix pairing operations are consumed
as they stand.

## Layer 4: Character systems, elliptic endpoints and integral congruences

### 4.1 The rank-two realizations on the shared carrier

For any number field k, odd n≥3, t∈U(k) and F=k(μ_n), define
**`characterSystem θ`** by the actual θ-eigenspaces
`V_(θ,ℓ)={x∈H¹_ét(C_n(t)_F̄,Q̄_ℓ) : u*x=j_ℓ(θ(u))x for all u∈μ_n}`.
Populate the shared `AutomorphicSystemData` with coefficient field M=Q(μ_n),
finite realization fields containing the character values and the given
Galois action. The target **`character_system_properties`** proves that these
are semisimple two-dimensional representations with determinant ε_ℓ⁻¹,
unramified away from one finite set and the coefficient prime, potentially
semistable with weights {0,1} at every labelled embedding. Away from the
finite set they have M-valued common Frobenius polynomials, independent of
ℓ with the fixed coefficient embeddings. They are pure of weight one at
good places. No CM hypothesis on k or E is used here.
(OpenAI Proposition 5.1, pp.12–13; its proof uses only number-field geometry.)

Rank two follows from §3.1, not from an assumed decomposition into elliptic
curves. For determinant, the reflection exchanges θ and θ⁻¹; define
`[x,y]_θ=⟨x,w*y⟩`, using the cup-product pairing on H¹. It is alternating,
perfect and valued in Q̄_ℓ(−1). On a two-dimensional space it identifies the
determinant with ε_ℓ⁻¹. Hodge comparison gives two Hodge types; reflection
identifies the holomorphic θ and θ⁻¹ multiplicities, so each contributes
one, giving the labelled weights. Faltings semisimplicity is applied to
the Jacobian H¹ before taking the character summand. Common polynomials
come from the action of the deck correspondences over F on the compatible
cohomology of the curve; retain the chosen character labels under every
coefficient embedding.

**API.** `characterSystem.realization` identifies the stored member with the
θ-eigenspace; `characterSystem.rank_det_weights` gives rank, determinant and
all labelled weights; `characterSystem.good_polynomials` proves weak
compatibility with its finite bad set. `characterSystem.pairing` is the
reflection pairing just described. `characterSystem.restrict` identifies
finite base change with restriction on the same shared carrier, transporting
the coefficient choices. No field of definition for a member smaller than
its specified finite realization extension is inferred.

**Checks.**

- θ=1 gives the H¹ of the elliptic quotient B_t, still rank two and
  determinant ε⁻¹, not a trivial representation of dimension one.
- Ordinary cup product pairs θ with θ⁻¹ and need not restrict perfectly
  to θ itself. Inserting w is essential when θ has order three or p.
- A putative rank-two member with weights {0,2} or determinant ε is
  excluded. In the fixed Hodge convention the cup-product value Q̄_ℓ(−1)
  has weight 1, agreeing with the sum 0+1.
- Finite coefficient extensions and changes of ℓ preserve the abstract θ
  through j_ℓ. Replacing θ by an unrelated conjugate at one prime would
  not meet the common-polynomial comparison used in Layer 8.

### 4.2 Quotient realizations and the second elliptic curve

The target **`character_order_quotient`** identifies the θ-part for an
order-m character of μ_n with the corresponding primitive part of H¹(C_m).
Pullback along C_n→C_m is an isomorphism onto the invariants of its kernel
over Q̄_ℓ. Its inverse is the normalized norm over the characteristic-zero
coefficient field. This is a rational statement, even at ℓ|n/m.
For θ=1, the quotient gives **`trivial_character_twist`**:
`V₁=H¹(B_t)`. (OpenAI Proposition 5.2, p.13.)

For n divisible by three let η have order three. Form the actual smooth
proper reflection quotient `D_t=C₃(t)/⟨w⟩` and define the elliptic curve
**`auxiliaryEllipticCurve`** to be `A_t=Pic⁰(D_t)`. The target
**`cubic_character_elliptic`** proves D_t has genus one and
`V_η≅H¹(A_t)` as systems over F, with the fixed embeddings. On the
trivial deck summand H¹(B_t), w is [−1]. On the two nontrivial summands it
exchanges V_η,V_η⁻¹. Hence the w-invariants have dimension two, and projection
`x+w*x↦x` identifies them with V_η. This computes the quotient's genus
and its realization. (OpenAI Proposition 5.2, p.13.)

**API.** `auxiliaryEllipticCurve.picard` identifies A_t with the Jacobian
of the actual quotient; A_t is defined over k before base change to F.
`auxiliaryEllipticCurve.realization` gives the
system isomorphism through pullback and projection;
`auxiliaryEllipticCurve.baseChange` makes it compatible with finite field
extension and all coefficient realizations. It supplies an origin on A_t,
not a point on D_t. The quotient construction is functorial in the marked
cover and reflection from Layer 1.

**Checks.**

- H¹(C₃) has dimension six: the trivial two-dimensional part contributes
  no w-invariants and the exchanged four-dimensional part contributes two.
  Taking all of that four-dimensional part would give the wrong genus.
- A genus-one quotient without a rational point still has an elliptic
  Pic⁰. Identifying D_t itself with A_t without choosing a point is not
  part of the construction.
- At the trivial character the curve is B_t; at an order-three character
  it is A_t. Both are elliptic endpoints but they are not asserted to be
  isogenous, since their residual representations need agree at only one prime.
- Pullback/norm composition is multiplication by the degree. It gives a
  rational isomorphism of the required subspaces, but is not asserted to be
  an integral isomorphism at primes dividing that degree.

### 4.3 Integral character evaluation

For t,F as above, fix ℓ and a finite coefficient extension L/Q_ℓ containing
j_ℓ(M), with valuation ring O and maximal ideal 𝔪. Use the actual deck action
to define **`characterLattice θ`**:

```text
T_θ = H¹_ét(C_n(t)_F̄,Z_ℓ) ⊗_(Z_ℓ[μ_n], θ) O.
```

It is an O-free rank-two G_F-stable lattice. After inverting ℓ it realizes
V_(θ,ℓ), with the character convention of §4.1. If θ and θ' have equal
reductions as evaluation homomorphisms `Z_ℓ[μ_n]→O/𝔪`, then
`T_θ/𝔪T_θ≅T_θ'/𝔪T_θ'` Galois-equivariantly. The proof tensors the single
free rank-two regular-module lattice of §3.1 and compares the two residual
base changes. This works when ℓ|n. (OpenAI Lemma 5.3, pp.13–14.)

**API.** `characterLattice.free_rank_two` is the freeness statement;
`characterLattice.generic_fiber` identifies the rationalization with the
θ-eigenspace; `characterLattice.same_reduction` gives the residual comparison
for equal evaluation maps. `characterLattice.coefficientExtension` commutes
with extension of O and its residue field. The G_F-action commutes with the
deck action because μ_n⊂F, so it descends through the tensor quotient.

**Checks.**

- For an order-p root ψ and residue characteristic p, ψ reduces to 1.
  Thus the evaluations for ηψ and η coincide modulo p; the lattice still
  has rank two rather than becoming an eigenspace of a nonsemisimple ring.
- At residue characteristic three, η reduces to 1, so ηψ and ψ have the
  same evaluation. An arbitrary pair of characters need not have equal
  reductions; equal dimensions alone gives no congruence.
- The characteristic-zero projector `(1/n)Σ θ(u)⁻¹u` does not define an
  integral projector at ℓ|n. The tensor quotient does not use it.
- If μ_n is not in the base field, Galois permutes the character labels.
  The asserted rank-two G_F-stable lattice is over F=k(μ_n), not over k
  without a descent argument.

### 4.4 The three congruences with their exact coefficient primes

Now let n=3p with p>3 prime, choose η of order three and ψ of order p, and
put χ=ηψ, of order 3p. The target **`prime_switch_congruences`** is

```text
V_η ≡_p V_χ,       V_χ ≡_3 V_ψ,       V_ψ ≡_p V₁.
```

It holds over F=k(μ₃p) for every number field k and every t∈U(k), with no
local, residual-image or automorphy hypothesis. The evaluation identities
in §4.3 prove the chain. At the ends use
`V_η≅H¹(A_t)` and `V₁≅H¹(B_t)` from §4.2. Rational comparison with a
smaller cover preserves the semisimplified residual representation even
if a natural integral pullback has nonunit index. Lattice independence
is invoked only after semisimplification. (OpenAI Corollary 5.4, p.14.)

The formulation deliberately distinguishes the lattice congruence supplied
on C_n from the resulting semisimple congruence on an elliptic endpoint.
It neither upgrades an arbitrary lattice quotient to a direct summand nor
claims an isomorphism of elliptic p-divisible groups.

**Checks.** Modulo p the order-p character disappears while the cubic one
remains; modulo three it is the cubic character that disappears. Reversing
these primes is false. The final link is at p, so the route needs the
mod-p residual conditions for both the cubic endpoint and the trivial
endpoint, while the middle lift needs the order-p piece at three. There
is no congruence at five in this chain; five is reserved for the seed.

### Examples

For a prime p>100 the chain has four rank-two systems, congruence primes
p,3,p, and only two elliptic realizations. None of the middle primitive
character systems is claimed to be an elliptic curve. Their ordinary or
toric local behavior will instead come from the Jacobian and the reflection
pairing. This prevents importing an elliptic local theorem at a middle link
without proving its hypotheses.

### Dependencies

Layers 1–3 provide quotient maps, reflection and integral freeness. The
shared compatible-system carrier comes from SmallRamification §5.0d, with
compatibility predicates from the compatible-system owners. Faltings,
Hodge comparison and Néron-model §6.10 give semisimplicity, Hodge types and
geometric compatibility. JacobianChallenge supplies the unpointed genus-one
Pic⁰ used for A_t.

## Layer 5: Automorphy inputs and the auxiliary-prime choice

### 5.1 Decomposed genericity and a large original image

Use the supplier predicate **decomposed generic** for a residual rank-two
representation over a number field L: there is a rational prime q≠ℓ,
split completely in L, such that it is unramified at every v|q and the
ratio of its two Frobenius eigenvalues is neither q nor q⁻¹ in F̄_ℓ.
The unordered pair of eigenvalues is used, so this excludes both ratios.
Distinct eigenvalues alone suffice only when q≡1 mod ℓ.
(OpenAI Definition 6.1, pp.14–15.)

For a non-CM E over an imaginary quadratic K choose p>100 with
`im(E[p]|G_K)⊇SL₂(F_p)`, possible by the large-image supplier. Put
n=3p and F=K(μ_n). The target **`cyclotomic_switch_field`** proves F/K
is abelian, F/Q is abelian and F is CM. It also proves ζ₅∉F: Q(μ₃p)
is unramified at five, so the ramification index at five in its compositum
with the quadratic K is at most two; Q(ζ₅) would require index four.
(OpenAI §5, p.11.)

**Checks.**

- q≡1 mod ℓ reduces the forbidden ratios to 1. For q≠1 mod ℓ, distinct
  eigenvalues can still have forbidden ratio q, so the full definition is kept.
- p>100 excludes 3 and 5; n is odd and Q(μ₃p) is unramified at five.
  Including p=5 would invalidate the ζ₅ exclusion and the stated lifting route.
- K may itself ramify at five; the ramification index bound is still two.
  Unramifiedness of K at five is not imposed.
- The commutator of SL₂(F_p) is SL₂(F_p) for p>3. Thus restricting to
  the abelian extension F/K preserves this subgroup. A statement for p=3
  using perfectness would fail.

### 5.2 The exact lifting theorem applied at three and p

Import **`TauCeti.PotentialAutomorphy.potentiallySemistableCM`** from
ModularityAndLanglandsExtensions §2.6. Its sufficient specialization here is:
L is CM, ℓ is odd and ℓ≠5, and
`r:G_L→GL₂(Q̄_ℓ)` is continuous, finitely ramified, determinant ε_ℓ⁻¹,
and potentially semistable at every v|ℓ with all labelled weights {0,1}.
Its residual semisimplification is decomposed generic and absolutely
irreducible on G_(L(ζ_ℓ)). There is a cuspidal weight-zero regular algebraic
π of PGL₂(𝔸_L) whose residual representation is isomorphic to that of r.
At each v|ℓ require one of:

1. Both local Galois representations are potentially crystalline, with
   potential ordinarity equivalent in the two representations, and the
   automorphic parameter rec(π_v) has N=0.
2. Neither local Galois representation is potentially crystalline, and π_v
   is ι-ordinary of weight zero.

Then r is realized by a cuspidal weight-zero regular algebraic Π of
PGL₂(𝔸_L). (OpenAI Theorem 6.2, p.15; CN Theorem 5.2 and Remarks
5.2.1–5.2.3, pp.73–74.) This is an application contract, not a new proof of
patching in this roadmap. The full supplier allows ℓ=5 with its additional
projective-kernel field condition; no lift below occurs at five. ℓ=3 is
included, even with residual SL₂(F₃); no additional adequacy, enormousness,
polarization or scalar-outside-cyclotomic condition is inserted.

The target **`switch_lifting_hypotheses`** is the application interface:
for two systems in one adjacent row of §4.4, suppose the residual conditions
of Layer 7 and the local type conclusions of Layer 6, and suppose the first
system is realized by a cuspidal weight-zero PGL₂ representation. After the
coefficient and automorphic-local comparisons of §8.1, the second meets
every condition above. Its proof is supplied row by row in §8.3 rather than
by an unconnected bundle of arbitrary propositions.

**Checks.** A supersingular potentially crystalline target cannot use an
ordinary crystalline seed. A toric target cannot use a potentially crystalline
seed, even if their semisimplified residual representations agree. N=0 on
the seed's automorphic parameter is a separate condition from potential
crystallinity of its Galois realization, and is proved in §8.1. Places with
ramified finite-order quadratic characters remain allowed in the ordinary
Steinberg alternative.

### 5.3 The independently modular elliptic starting point

Import the consequence of **`CMResidual.modular_curve_with_types`** and the
lifting theorem from ModularityAndLanglandsExtensions §2.29: if L is CM
with ζ₅∉L and A/L is a non-CM elliptic curve whose mod-5 representation
is decomposed generic and absolutely irreducible on G_(L(ζ₅)), then H¹(A)
is realized by a cuspidal weight-zero PGL₂ representation. Duality translates
the covariant elliptic residual convention to H¹ and preserves these two
residual properties. (OpenAI Theorem 6.3, p.15; CN Theorem 6.1 and
Lemma 6.1.3, pp.87–88.)

The imported proof has independently modular auxiliary curves from the
AKT ordinary/dihedral route, prescribed local types and soluble descent.
Its potential-modularity, residual-modularity and ordinary lifting inputs
retain the contracts in the supplier table. It does not use unconditional
imaginary quadratic modularity, nor a geometric prime switch, as a premise.
The target **`auxiliary_seed_automorphic`** applies it to A_t over F, using
§5.1 for ζ₅∉F and §7.4 for the actual residual conditions and non-CM.

**Checks.** The seed is used at five exactly once. The three later lifts
are at p,3,p. If A_t were CM, the stated non-CM cuspidal seed contract
would not apply; non-CM is proved by two noncommuting odd-order unipotents.
For a general CM base K, ζ₅∉K alone would not imply ζ₅∉K(μ₃p); the
imaginary quadratic ramification proof is essential here.

### 5.4 What elliptic modularity supplies after it is known

Retain the elliptic comparison **`modular_elliptic_all_coefficients`** as an
application of the automorphic Galois, purity and transfer suppliers:
for a non-CM elliptic D over a CM number field, if a weight-zero cuspidal π
realizes H¹(D) at one prime, the same π has trivial central character,
realizes H¹(D) at every prime and coefficient isomorphism, and satisfies
full `WD^(F-ss)=rec^T(π_v)` for v∤ℓ, with N retained. At a potentially
multiplicative v|ℓ it is ι-ordinary of weight zero. Uniqueness is up to
isomorphism by strong multiplicity one. (OpenAI Theorem 6.4, pp.15–16;
CN Lemma 6.1.3(1)–(4), p.88.)

This target assembles existing comparisons for elliptic D. It is not used
as a full local–global theorem for arbitrary intermediate character systems.
Those systems use §8.1, where only good polynomials and Varma's underlying
Weil comparison are initially imported.

**Checks.** The all-coefficient conclusion is for the same π, not a new
choice at each prime. At a Tate place N has rank one, so Weil
semisimplification alone would omit a necessary part of the conclusion.
At v|ℓ the ordinary conclusion uses an auxiliary coefficient prime to
recognize the local Steinberg twist; it does not apply away-prime comparison
with the coefficient and residue primes equal.

### Examples

The chain needs lifting at ℓ=3, where residual adequacy is particularly
unhelpful as an extra hypothesis. Its two geometric unipotents supply the
required absolute irreducibility directly. The initial mod-5 elliptic
criterion supplies a cuspidal seed; its proof and the full lifting theorem
have already been assigned to earlier roadmaps.

### Dependencies

Layer 4 supplies the systems and congruences. The modularity-lifting,
residual-modularity and local–global owners in the exact supplier table
supply all theorems invoked in this layer. Large image and the perfectness
of SL₂(F_p) come from ArithmeticGaloisRepresentations R01.4. No small
modular-curve point computation is a prerequisite.

## Layer 6: Prescribing reduction in local parameter opens

### 6.1 Local constancy of finite torsion, including residue-prime torsion

For a finite extension L/Q_r, a smooth L-variety X, an abelian scheme
A→X, a point x₀∈X(L), and an integer N≥1, prove
**`finite_torsion_locally_constant`**: some analytic neighborhood Ω of x₀
has G_L-equivariant isomorphisms `A_x[N]≅A_x₀[N]` for every x∈Ω.
The order N may be divisible by r. These are finite étale group schemes
over the characteristic-zero parameter variety, not over its residue field.
The level-isomorphism torsor is finite étale and the L-adic inverse function
theorem at the identity-level point supplies a local section.
(OpenAI Lemma 7.1, p.16.)

Retain the group structure and the action of G_L in the level torsor;
constancy of the abstract number of torsion points would say nothing about
the local representation. Shrink to a neighborhood on which the section is
defined. No global trivialization of A[N] over all of X is asserted.

**Checks.** At N=1 this is the unique zero torsion group and imposes no
useful reduction constraint. At N=r the statement still holds because L
has characteristic zero. It does not say that a group scheme over a
characteristic-r special fiber is étale: ordinary and supersingular
r-divisible groups remain different. An empty local open would give no
specialization; the construction contains x₀.

### 6.2 A finite set of full Tate-module Frobenius polynomials

Fix g≥1 and a local field L with residue cardinality Q>1. For a semistable
g-dimensional abelian variety A/L and an auxiliary odd prime d≠r, choose
an arithmetic Frobenius lift on the full covariant V_d(A). The target
**`full_tate_polynomial_finite`** proves its polynomial is an integral
monic degree-2g polynomial from a finite set depending only on g,Q,
independent of d and the Frobenius lift. If the toric rank is s, its graded
roots consist of s roots of absolute value Q from the torus, s roots of
absolute value 1 from the lattice, and 2(g−s) roots of absolute value √Q
from the abelian quotient. Thus the polynomial determines s and, if s=0,
the Newton polygon of the good special fiber.
(OpenAI Lemma 7.2, pp.16–17.)

Write the polynomial `T^(2g)+Σ_(j=1)^(2g) a_jT^(2g−j)`. Every root has
absolute value ≤Q, so `|a_j|≤binom(2g,j)Q^j`; bounded integral coefficients
give finiteness. The finite torus/lattice action and the good abelian
Frobenius give integral, d-independent graded polynomials. Unipotent
inertia changes the extension but not these diagonal blocks, proving
independence of the Frobenius lift. This argument uses all 2g dimensions,
not just the inertia invariants.

**Checks.**

- For a split Tate elliptic curve the full polynomial is `(T−1)(T−Q)`.
  The invariant local Euler factor has degree one and loses a graded root;
  substituting it would not satisfy this construction.
- For a good ordinary elliptic curve over residue size r, the slopes are
  0,1; for a supersingular elliptic curve they are 1/2,1/2. At s=0 the
  same polynomial distinguishes these Newton polygons.
- Q=1 would merge the absolute-value ranges 1,√Q,Q and cannot detect
  toric rank. It is excluded by the local-field residue hypothesis.
- At g=0 the polynomial is 1 and the rank is zero, but it supplies no
  ordinary/supersingular distinction; later type conclusions use g≥1.

### 6.3 Local constancy of toric rank and Newton polygon

Let A→X,x₀,L be as in §6.1, with relative dimension g≥1. Prove
**`local_reduction_constancy`**: there is a finite extension L'/L and a
nonempty neighborhood of x₀ such that all nearby fibers over L' are
semistable with the same toric rank as A_x₀ over L'; if that rank is zero,
they have the same Newton polygon. Choose first one L' making A_x₀
semistable and rationalizing its d-torsion for an odd d≠r. Local constancy
of d-torsion makes inertia act on all nearby Tate modules through
`1+dM_(2g)(Z_d)`. The semistable criterion and odd d force its finite
semisimple inertia eigenvalues to be 1, giving semistability. Then choose
j sufficiently large so reduction modulo d^j separates the finite set of
polynomials in §6.2. Apply §6.1 again to A[d^j]; nearby Frobenius
polynomials coincide, fixing the toric rank and good Newton polygon.
(OpenAI Proposition 7.3, pp.17–18.)

**Checks.**

- Rational two-torsion would not suffice for this semistability step:
  −1≡1 mod 2 is a nontrivial finite-order inertia eigenvalue. The
  auxiliary d is odd.
- At potentially good ordinary A_x₀≅E₀^g, all nearby good fibers have
  exactly g slopes 0 and g slopes 1, hence are ordinary. At a supersingular
  E₀^g all 2g slopes are 1/2, a stronger conclusion than “nonordinary”.
- At a totally toric A_x₀ the nearby toric rank is g. Preserving only
  “bad reduction” would be insufficient for the rank calculation below.
- The fixed extension L' works on a whole neighborhood; an extension
  chosen separately for each point would not be the stated local family result.

### 6.4 Full monodromy rank in the totally toric case

For any g-dimensional abelian A over a local field L/Q_r which becomes
semistable of toric rank g, prove **`totally_toric_monodromy_rank`**: N on
WD(H¹(A,Q_d)) has rank g for every coefficient prime d, including d=r.
Rank is unchanged by a finite field extension, so split the torus and its
period lattice. The periods q_ij have nonsingular valuation matrix
`(v_L(q_ij))`. For d≠r this is the standard toric monodromy pairing.
(OpenAI Lemma 7.4, pp.18–19.)

For d=r use the semistable extension
`0→Q_r(1)^g→V_r(A)→Q_r^g→0` whose classes are the Kummer classes of q_ij.
The induced monodromy map between the two graded D_st spaces has a kernel
stable under unramified Frobenius, by `Nφ=rφN`. If its rank were smaller
than g, finite unramified Galois descent gives a nonzero vector in Q_r^g
in that kernel. Pulling back along its line gives a crystalline Kummer
extension. Coordinatewise the crystalline Kummer classes have valuation
zero, contradicting nonsingularity of the valuation matrix. Duality
preserves rank and proves the H¹ statement. This argument uses Q_r-linear
descent, not an assertion that the kernel already contains a rational
Q-vector. The residue-prime monodromy is indispensable at the middle lift.

**Checks.** For a split Tate elliptic curve the valuation matrix is the
one-by-one matrix `[v(q)]` with v(q)>0, so N has rank one at every prime.
For its g-fold product it is a nonsingular diagonal matrix and N has rank g.
Good reduction has N=0 and cannot enter the totally toric conclusion for
g>0. In all cases N²=0 for an abelian H¹, so rank g is the maximum in
dimension 2g; higher nilpotency is not inferred.

### 6.5 Pulling the neighborhood back to the original parameter line

Set n=3p and F=k(μ_n). Given any finite set S of finite places of k
containing all those above 3p, construct **`local_type_opens`**: for every
v₀∈S a nonempty analytic open Ω_v₀⊂U(k_v₀) such that any t in all these
opens has the following property at **every** v of F above v₀. The
Jacobian J_t=Pic⁰(C_n(t)) has, after a fixed extension of F_v independent
of t, the same one of these potential types as E:

- good ordinary, with slopes 0 and 1, each of multiplicity n;
- good supersingular, with all 2n slopes 1/2;
- semistable totally toric, of toric rank n.

Here the original E is elliptic, so these exhaust its potential reduction
possibilities. (OpenAI Proposition 7.5, p.19, with Proposition 7.3.)

Use the constant-E parameter cover and the compact-type abelian scheme
near O with fiber E^n from §2.2. Apply §6.3 at each completion of F;
intersect the finitely many resulting neighborhoods after restriction from
k_v₀. Choose a nonzero R₀=(t₀,s₀) in E(k_v₀) sufficiently near O and
away from the finitely many forbidden points and the branch of x. The
inverse function theorem provides s(t) with s(t)²=h(t), so
`(x,y)↦(x,s(t)y)` identifies B_t with E throughout a local open in the
t-line. Normalization f(O)=1 makes the pulled-back covers coincide,
without an uncontrolled scalar Kummer twist. This descends the local
condition to t∈k_v₀ rather than leaving it on E(F_v).

**API.** `local_type_opens.nonempty` gives Ω_v₀ and a witness in U(k_v₀);
`local_type_opens.all_extensions` gives the asserted condition at every
v|v₀ with its fixed semistabilizing extension;
`local_type_opens.twist_split` gives the local isomorphism B_t≅E and its
compatibility with the normalized cover. The opens may be shrunk and
additional finitely many local constraints intersected when nonempty.

**Checks.**

- O itself lies outside the original affine U, so the witness is a
  nonzero nearby R₀, not the degenerate boundary point.
- An open found only in U(F_v) need not contain a k_v₀-point. Choosing
  R₀∈E(k_v₀) and applying the local x-chart supplies the required witness.
- The n leaves of the compact-type fiber give toric rank n when E is
  potentially multiplicative, not the rank n−1 of the other degeneration.
- Every v above v₀ is included before selecting t. One chosen embedding
  into a completion of F would not suffice for the global lifting theorem.

### 6.6 Characterwise local types

For t in the opens of §6.5 prove **`character_local_types`** at every v|3p
for each of the n characters θ. Let ℓ be the residue characteristic of v.
If E is potentially good ordinary, V_(θ,ℓ) is
potentially crystalline ordinary of weight zero; if E is potentially
supersingular, it is potentially crystalline and nonordinary, with both
slopes 1/2 after good reduction; if E is potentially multiplicative, it
is not potentially crystalline and its two-dimensional WD monodromy has
rank one. The rank-one monodromy assertion holds at every coefficient
prime, including ℓ. Potential crystallinity and the ordinary filtration
here refer to the member at the residue coefficient prime ℓ; at other
coefficient primes the potentially good cases instead give N=0 and
potentially unramified representations. (OpenAI Corollary 7.6, p.20.)

In the ordinary case the weight-zero slope filtration cuts out a line in
each character summand and is compatible with descent, giving potential
ordinarity. The all-slope-1/2 case cannot have that ordinary line. In the
toric case §6.4 gives total rank n for N on a direct sum of n spaces of
dimension two. N commutes with the deck action and each summand has N²=0,
so its rank is at most one. Their ranks sum to n; every summand therefore
has rank one. The argument does not assume the character summands are
elliptic curves.

**Checks.** The trivial and cubic character endpoints recover the same
potential type for B_t and A_t at these places. If only positive toric
rank were known for J_t, some character summand could have N=0; the total
rank n hypothesis is what excludes it. Nonordinary potentially crystalline
and noncrystalline are different alternatives: the supersingular case has
N=0, whereas the toric case has N of rank one.

### Examples

Prescribe potentially supersingular reduction at a place above three and
potentially multiplicative reduction at a place above p. The local opens
are chosen independently at those finitely many completions; one later
Hilbert point lies in their product. All four systems then have the same
appropriate local alternative at each place, including the residue-prime
N comparison at three. No global ordinary hypothesis on E is imposed.

### Dependencies

Layer 2 supplies the abelian extension of the Jacobian near O. The
abelian-scheme torsion supplier, local inverse function theorem and Néron
semistability criterion give local constancy. Néron-model §§3.10, 3.14 and
5.3 supply toric uniformization and semistable comparison; its §6.10 supplies
the coefficient-independent graded Frobenius polynomials. The finite-set
argument, local parameter pullback and characterwise rank deduction are
source-specific targets here.

## Layer 7: One specialization with all residual conditions

### 7.1 Geometric irreducibility and a regular word

For the pairs `(m,ℓ)=(3,p),(3,5),(p,3)`, evaluate the two common-basis
monodromies of §3.3 at every primitive order-m character. Since ℓ∤m,
its root λ stays nontrivial after reduction, and
`c(λ)=2−λ−λ⁻¹=−(λ−1)²/λ` is nonzero. The two matrices have distinct
unique fixed lines and no common invariant line after any coefficient
extension. The target **`character_geometric_irreducibility`** is absolute
irreducibility of each of these residual geometric representations.
(OpenAI Lemma 8.1, p.21.)

The light **`switchCoefficient`** is this scalar on a unit λ in any field.
The light **`switchMonodromyWord c σ τ k`** is
`[[1,σc],[0,1]] [[1,0],[τc,1]]^k` over any commutative ring. Its determinant
is one and its trace is `2+στkc²`. For determinant-one matrices in odd
characteristic, distinct eigenvalues are equivalent to trace different
from ±2. The target **`character_regular_word`** gives one common word
regular for every character in each pair and for every conjugate parameter
factor. For m=3 take k=2: c=3 and the two sign products give traces 20
and −16, regular modulo 5 and modulo p>100. For m=p,ℓ=3 take k=1.
A failure would imply c²=0 or ±4. The first is excluded; either remaining
equation makes λ a root of a nonzero polynomial of degree at most four
over F₃. It would lie in F_(3^e), e≤4, so its order p divides 3^e−1≤80,
contrary to p>100. Signs are allowed to vary; the word length still works.

**API.** `switchCoefficient_factor`, `switchCoefficient_inv` and
`switchCoefficient_ne_zero` give the factorization, inversion symmetry
and nonvanishing criterion. `switchMonodromyWord_det` and
`switchMonodromyWord_trace` give the exact determinant and trace;
`prime_order_switch_regular` gives `c²≠4,−4` in characteristic three for
an order-p unit, p>100 prime. `opposite_unipotents_fixed` identifies the
fixed lines, and `opposite_unipotents_noncommute` gives the noncommutation
used for the auxiliary elliptic curve. The geometric identification of these
matrices with this family's image is `common_basis_monodromy.character`;
the formula on arbitrary matrices alone does not assert geometric image.

**Checks.**

- For λ=1, c=0 and both matrices are the identity. This character is
  excluded from the geometric irreducibility statement. For λ=2 over Q,
  c=−1/2; for λ=−1, c=4; a cubic root gives c=3. These are Lean examples.
- The two k=2 traces at c=3 are 20 and −16. Modulo five these are 0 and
  4, neither 2 nor −2. All four comparisons occur in Lean.
- k=0 leaves a single unipotent with trace 2, so it is not a regular word.
  In characteristic two, 2=−2 and the odd-characteristic reasoning cannot
  be reused; a Lean example gives trace 0 for c=1,k=2.
- With upper and lower entries both 1, the products have diagonals (2,1)
  and (1,2). They do not commute, including in characteristic three.
  Nonzero entries on just one root would fail both the fixed-line and
  non-CM arguments.

### 7.2 Genericity of the original elliptic endpoint

For K imaginary quadratic and p,F as in §5.1, prove
**`original_endpoint_generic`**: for every t∈U(K), the mod-p representation
of V₁=H¹(B_t) is absolutely irreducible on G_(F(ζ_p)) and decomposed
generic. Since μ_p⊂F, this cyclotomic subgroup is G_F. Restriction of
E[p] to G_F has image SL₂(F_p), by perfectness and the abelian extension
F/K, and B_t is its quadratic twist. Twisting preserves absolute
irreducibility and eigenvalue ratios. (OpenAI Lemma 8.2, p.22.)

For the rational split prime in decomposed genericity, do not assume that E
and its K-conjugate are independent. Their joint image is a subdirect
product of two SL₂(F_p)'s. In SL₂(F_p), each of trace 2 and trace −2
has p² elements, while the group has size p(p²−1). In any subdirect
product, projection to either factor has uniform fibers. The fraction of
elements bad in one of the two factors is at most
`4p/(p²−1)<1`. Hence one element avoids both bad traces. Realize its
conjugacy class by a rational prime split in the constant cyclotomic
field; every prime over it has distinct eigenvalues. Since q≡1 mod p,
this is exactly decomposed genericity, simultaneously for the conjugates.
A quadratic twist only changes both eigenvalues by the same sign.

The geometric specialization below can be stated for a general number
field k of degree d. Choose p sufficiently large that E[p] over its fixed
normal closure has SL₂(F_p) in its image, and p>max{100,2d+1}. Adjoining
the required cyclotomic constants is abelian over that normal closure,
so perfectness preserves SL₂. Apply the same subdirect-product argument
to the d conjugate curves; independence is still unnecessary. The fraction
bound is `2dp/(p²−1)<1`, recorded as the Lean milestone
**`conjugate_trace_union_bound`**. This is the generality of the residual
image step used in §7.4, not a modularity theorem over arbitrary k.
(Le Hung §4.4, p.8, extending OpenAI Lemma 8.2.)

**Checks.** A diagonal subdirect product, as for isomorphic conjugate
representations, still has a good element. A product-independence hypothesis
would wrongly exclude this example. At d=2,p=101 the bound is 404/10200<1;
at d=1 it is smaller. p=3 cannot be used for the perfectness argument.
A rational prime merely splitting in K but not in the relevant cyclotomic
constants need not satisfy q≡1 mod p and is not the witness chosen here.

### 7.3 Hilbert specialization with the constant-field quotient retained

Let W⊂A^d_Q be nonempty open, D/Q finite Galois and
`π₁(W)↠H↠Gal(D/Q)` a finite quotient compatible with the arithmetic
map. For a finite set of places v of Q and one nonempty local open in
W(Q_v) at each of them, prove
**`hilbert_full_quotient`**: some x∈W(Q) satisfies every open condition
and its specialization homomorphism `s_x:G_Q→H` is surjective. Moreover
`s_x(G_D)=ker(H→Gal(D/Q))`. Apply the IG.2 Hilbert-with-local-conditions
contract to the connected finite cover belonging to the quotient; the
connected fiber gives surjectivity. For the kernel identity, surjectivity
lifts any kernel element to G_Q and compatibility with D forces that lift
into G_D. (OpenAI Lemma 8.3, p.23.)

Connectedness of the cover is sufficient. Requiring geometric connectedness
would discard the constant-field quotient that is essential to make the
Chebotarev prime split in D. Conversely, applying Hilbert only after
discarding the constants would not prove the claimed G_D image. Normal
cores of the finite covers may be taken to put all conjugate character
representations into one finite Galois quotient.

**Checks.** For a constant connected cover D×W the specialization map is
the actual quotient G_Q↠Gal(D/Q), despite failure of geometric
connectedness. When D=Q the kernel identity reduces to surjectivity onto H.
For the cover Y²=T and a positive-real and 2-adic square neighborhood,
Hilbert specialization can still choose a rational nonsquare such as 17;
local splitting does not force a disconnected global fiber. These are
applications of the imported Hilbert theorem, not new definitions in Lean.

### 7.4 Weil restriction and simultaneous specialization

Return first to an arbitrary number field k, non-CM E/k and sufficiently
large p as in §7.2. Let F=k(μ₃p), and let S contain all places above 3p.
The target **`simultaneous_specialization`** produces one t∈U(k) in all
the prescribed nonempty Ω_v₀, such that:

1. For each of `(m,ℓ)=(3,p),(3,5),(p,3)` and **every** order-m
   character, its residual V_θ is absolutely irreducible on G_(F(ζ_ℓ))
   and decomposed generic over F.
2. The residual V₁,p is absolutely irreducible on G_(F(ζ_p)) and
   decomposed generic.
3. A_t is non-CM.

The residual assertions remain valid after the coefficient extensions used
to contain all character values. The proof is OpenAI Proposition 8.4,
pp.23–25 for imaginary quadratic k; the same finite-quotient proof on d
factors, with the large-image hypothesis specified in §7.2, works for
arbitrary number fields, as in Le Hung §§2.3 and 4.4–4.5, pp.5,8–9.
This general statement retains the stronger prime choice over the normal
closure; choosing p from the image over k alone is not substituted for it.

Use `W=Res_(k/Q) U`, a nonempty open in A^d_Q. Its rational points are
U(k), and its Q_v-points are the products of U(k_w) over w|v. Over a
finite Galois D equal to the compositum of the normal closure of k with
Q(μ₃p,ζ₅), it splits
into d conjugate factors. Form a finite quotient H of π₁(W) containing
all the residual local systems in the three pairs, their conjugates and
this constant-field quotient. Separate geometric loops in the d factors
supply the two monodromies in each factor. Their common word from §7.1
is regular for all the characters being considered. Take normal cores
so conjugation permutes the full collection of factors and character
labels. Apply §7.3 to this one quotient and the product local opens.

The specialized G_D image contains the geometric monodromy, so it gives
absolute irreducibility after adjoining ζ_ℓ. The same kernel contains
the common regular element. Chebotarev applied to its conjugacy class
in the finite quotient of G_Q gives a rational prime q split in D,
away from all the ramification and coefficient primes. Every conjugate
Frobenius image is regular on every relevant factor and character, so
**all** places of F over q have distinct eigenvalues. Since ζ_ℓ∈D,
q≡1 mod ℓ; this proves decomposed genericity. Different pairs may use
different witness primes. The endpoint V₁,p is supplied by §7.2.

Finally the pair (3,p) puts two opposite nonidentity p-unipotents in the
residual H¹(A_t) image. They do not commute. If A_t had CM, its image
would have an abelian normal subgroup of index at most two, from the
field of definition of the CM endomorphisms. Both odd-order unipotents
would belong to that subgroup, a contradiction. This proves non-CM
without any assumption that the family has nonconstant j.

**API.** The output t has its actual memberships in U and all Ω_v₀;
`simultaneous_specialization.images` gives the specified geometric image
inside the specialized G_D image;
`simultaneous_specialization.generic_primes` supplies a rational split
prime with the all-places eigenvalue condition for each pair;
`simultaneous_specialization.auxiliary_nonCM` gives the CM exclusion.
The images and witness primes refer to this same t. These outputs are a
single construction, not separately quantified existence assertions that
could choose incompatible parameters.

**Checks.**

- For k imaginary quadratic d=2, W has two conjugate factors. Controlling
  one of them would not prove the all-places condition for a rational
  split prime; both enter H before applying Hilbert.
- For d=1 there is one factor, and the same argument and the smaller
  trace union bound work. No imaginary or CM condition is needed for
  this specialization construction.
- Including ζ₅ in D does not assert ζ₅∈F. The former is needed for the
  (3,5) residual restriction; the latter must fail for the CM seed in
  the imaginary quadratic application.
- The two unipotents have order p>2. An element of order two could map
  nontrivially to the CM index-two quotient; this is why oddness matters.
- Local opens are imposed in W(Q_v), including every k-place over v;
  selecting independent t's at three and p would not produce this output.

### Examples

When K=Q(i), no special property of the original mod-three or mod-five
image is assumed. Choose a sufficiently large p and one t. The cubic
character at five supplies the seed's residual conditions, the cubic
character at p supplies the first lift's conditions, and the p-th
character at three supplies the middle lift's conditions. The endpoint
at p already has the original curve's large image. This explains why
small residual exceptions of E disappear from the endpoint's hypotheses.

### Dependencies

Layers 3–4 supply integral monodromy and residual systems; Layer 6 supplies
nonempty local opens. ArithmeticGaloisRepresentations R01.4 supplies large
image, subdirect-product reasoning and Chebotarev. IG.0 and IG.2 supply
finite arithmetic fundamental-group quotients and Hilbert irreducibility
with local conditions. The Weil restriction, the joint quotient and the
all-character/all-conjugate deduction are the new application here.

## Layer 8: Three lifts, descent and the full modularity theorem

### 8.1 Changing coefficient prime and recovering automorphic local types

Prove **`character_automorphy_change_prime`**: if a weight-zero regular
algebraic cuspidal π realizes one member of V_θ, it realizes every member,
using the coefficient embeddings fixed in §4.1. Outside one finite set,
the good-place Frobenius polynomials of V_θ and of π agree at the original
prime and hence as algebraic polynomials. They then agree after every
coefficient embedding. Semisimplicity of both representations and
Chebotarev–Brauer–Nesbitt give the isomorphism at the next prime.
(OpenAI Lemma 9.1, p.25.) This does not yet identify all bad-place monodromy.

Prove **`character_automorphic_local_type`** for such a cuspidal PGL₂ π
and a place v|ℓ, ℓ∈{3,p}, at a specialization of §7.4. In the potentially
good case `N(rec(π_v))=0`. In the totally toric case π_v is a trivial or
quadratic twist of Steinberg and is ι_ℓ-ordinary of weight zero. For the
proof choose an auxiliary coefficient prime a different from the residue
characteristic of v. Use the preceding theorem to identify r_(π,a) with
V_(θ,a), then Varma's semisimplified **Weil** comparison. In the good
case the two eigenvalues have equal complex absolute value after potential
good reduction; nonzero N in rank two would force a norm ratio, so is
impossible. In the toric case §6.6 gives rank-one N and Weil roots with
norm ratio. With that Weil semisimplification the local Langlands
possibilities are the special parameter or the zero-N parameter of a
one-dimensional, nongeneric GL₂ representation. Cuspidality makes every
π_v generic and excludes the latter. Trivial central character makes
the Steinberg twist quadratic. The supplier's local ordinary calculation
works also for ramified quadratic twists at sufficiently deep level.
(OpenAI Lemma 9.2, pp.25–26; CN Lemma 6.1.3(4), p.88.)

**Checks.** A semisimplified Weil comparison alone permits both the
Steinberg and nongeneric alternatives, so it cannot be called full WD
compatibility. Equal good-reduction root sizes exclude N because Q>1;
this argument would fail with the fictional value Q=1. In the toric
case genericity, rather than an assumed monodromy equality for arbitrary
nonselfdual π, selects Steinberg. A ramified quadratic twist need not
be spherical and remains permitted in the ordinary alternative.

### 8.2 The starting elliptic curve

Now specialize to imaginary quadratic K and F=K(μ₃p). Choose t from
§7.4 inside the opens from §6.5. By §4.2, V_η=H¹(A_t), and by §7.4
A_t is non-CM, its mod-5 residual representation is decomposed generic
and absolutely irreducible on G_(F(ζ₅)). Since ζ₅∉F by §5.1, apply the
imported elliptic starting criterion §5.3. This proves
**`auxiliary_seed_automorphic`**, a cuspidal weight-zero representation
π_η of PGL₂(𝔸_F) realizing V_η. (OpenAI Proposition 9.3, first paragraph,
p.26, using Theorem 6.3.)

The seed theorem supplies all-coefficient elliptic compatibility through
§5.4. In particular it supplies the member at p needed for the first
congruence. This is the only invocation of a modularity criterion at
five. Its local five-adic proof remains in the supplier; the new local
opens here were imposed at three and p.

### 8.3 The lifting table with every hypothesis attached

The target **`three_lift_automorphy`** constructs cuspidal weight-zero
PGL₂ representations realizing V_χ,V_ψ,V₁ in that order. The common
specialization and coefficient conventions are fixed throughout.
(OpenAI Proposition 9.3, p.26.)

| Lift | Residual isomorphism | Cyclotomic irreducibility and decomposed genericity | Local input at every place over the lifting prime |
|---|---|---|---|
| V_η → V_χ at p | §4.4, reduction of ψ to 1 | §7.4 for the order-three piece at p; the isomorphism gives the same residual for χ | §6.6 gives both local Galois types; §§5.4, 8.1 give the seed's N=0 or ordinary Steinberg type. |
| V_χ → V_ψ at 3 | §4.4, reduction of η to 1 | §7.4 for every order-p piece at three | Change π_χ to coefficient three by §8.1; both local Galois types come from §6.6, and the automorphic N/ordinary condition from §8.1. |
| V_ψ → V₁ at p | §4.4, reduction of ψ to 1 | §7.2 for V₁,p, and the residual isomorphism for ψ | Change π_ψ to coefficient p by §8.1; §6.6 and the automorphic-local comparison give the same crystalline/noncrystalline alternative. |

Every target member has determinant ε⁻¹, finite ramification, labelled
weights {0,1} and potential semistability by §4.1. At a potentially good
ordinary place the seed and target are both potentially ordinary and
crystalline. At a potentially supersingular place both are crystalline
nonordinary. At a potentially multiplicative place both are noncrystalline,
and the seed is automorphically ordinary. Thus the exact alternatives of
§5.2 hold at **every** place above the relevant prime in each row. All
residual comparisons are semisimplified and absolutely irreducible, so
they give the residual isomorphism required by the lifting theorem.
At no point is the original E[3] or E[5] required to be irreducible.

**Checks.** The middle lift uses three, not the seed prime five; the last
lift returns to p. A proof omitting the change of coefficient prime after
the first row would have no residual matching at three. A local
supersingular place is handled by the nonordinary crystalline alternative,
so assuming ordinarity everywhere would weaken the endpoint. The large
prime is p>100 and the remaining lifting prime is three; the exceptional
five-adic projective-field clause of the full lifting theorem is never
needed in these three rows.

### 8.4 Descent of the same representation, then removal of the twist

Prove **`cyclic_representation_descent`** for a prime-cyclic CM extension
L'/L: if a continuous semisimple rank-two representation r of G_L has
absolutely irreducible restriction to G_L' realized by a weight-zero
cuspidal Π over L', then r itself is realized by a weight-zero cuspidal
representation over L. Conjugation invariance of r|G_L' and strong
multiplicity one make Π Galois invariant. Cyclic descent supplies π₀.
After coefficient extension, the attached r_(π₀) and r restrict to the
same irreducible representation, so `r_(π₀)≅r⊗δ` for a character δ of
Gal(L'/L). Twist π₀ by the Hecke character corresponding to δ⁻¹ under
the fixed reciprocity convention, fixing
the equality over G_L. (OpenAI Lemma 9.4, p.27.)

The target **`switch_descent_to_original_curve`** applies this through
a prime-cyclic tower of the abelian extension F/K. Every intermediate
field contains imaginary quadratic K and is CM. The non-CM elliptic
B_t has absolutely irreducible H¹ after finite extensions, by its large
image/Faltings comparison, so the restriction hypothesis is satisfied at
every step. Start with the realization of V₁=H¹(B_t) from §8.3. The
result over K realizes H¹(B_t), not merely its restriction to F.
Finally use `B_t⊗χ_(h(t))≅E` in H¹ and twist the automorphic
representation by that same quadratic character. This gives the
non-CM automorphic realization for E. (OpenAI §9.3, p.27.)

**Checks.** At a quadratic descent step there can be two descents differing
by its nontrivial quadratic character; equality after restriction alone
cannot distinguish them. The δ⁻¹ correction is therefore part of the
theorem. Twisting twice by χ_(h(t)) is the identity, as h(t)≠0. For the
split example h(t) a square the twist character is trivial. Without
absolute irreducibility after restriction, the difference between two
extensions need not be a single character; that hypothesis is retained.
The cubic scalar witness modulo seven has δ=2 and δ⁻¹=4:
`2·4=1`, whereas `2·2=4≠1`. This Lean example pins the correction's
inverse direction; the Hecke-character comparison itself uses the
supplier's reciprocity convention.

### 8.5 All coefficient primes, finite places and the complex parameter

Apply §5.4 to the now modular non-CM E/K to obtain one π_E with trivial
central character realizing H¹(E) for every prime ℓ and every coefficient
isomorphism. Prove **`elliptic_full_local_comparison`**:

```text
ι WD(H¹_ét(E_K̄,Q̄_ℓ)|G_Kv)^(F-ss)
       ≅ rec_Kv(π_E,v ⊗ |det|_v^(−1/2))      (v finite, v∤ℓ).
```

The equality retains N, by the elliptic pure-parameter comparison, rather
than being asserted for every intermediate nonselfdual representation.
The local factor at v|ℓ is the same elliptic factor as well: at good
reduction compare crystalline Frobenius; at potentially good bad reduction
the nontrivial finite inertia action in the determinant-one rank-two WD
parameter has no invariants, so its factor is 1; at potentially
multiplicative reduction the quadratic Tate uniformization gives the
same rank-one-invariant factor, or factor 1 when the quadratic character
is ramified. These cases compare local factors at the residue coefficient
prime without misapplying an away-prime theorem there.
(OpenAI §9.4, pp.27–28; CN Lemma 6.1.3, p.88.)

Define the light **`complexInfinityParameter z`** to be the diagonal matrix
`diag(z/|z|,conjugate(z)/|z|)` on C, used as a group parameter on C×.
The target **`elliptic_complex_parameter`** identifies the complex local
Langlands parameter of π_E with its restriction to C×. Genericity and
weight zero specify the Hodge types (1,0),(0,1) in unitary normalization.
It follows that **`elliptic_L_function_identity`** is
`L(E/K,s)=L(π_E,s−1/2)`, with the finite factors and the corresponding
archimedean normalization. At a good finite place q,a, the eigenvalues
α,β of H¹ satisfy α+β=a,αβ=q; unitary Satake roots are
α/√q,β/√q, so evaluation at s−1/2 gives exactly
`(1−a q^(−s)+q^(1−2s))⁻¹`. This two-root computation fixes the shift's
direction. (OpenAI Theorem 1.1, p.1, §2, p.4, §9.4, p.27.)

**API.** `complexInfinityParameter_det` gives determinant one for z≠0;
`complexInfinityParameter_mul` gives multiplicativity of the matrix formula;
`complexInfinityParameter_conj` exchanges the two entries under conjugation.
The normalization witness **`unitary_euler_shift_witness`** in Lean uses
q=4,α=β=2: its two geometric Euler factors have product
`(1−2T)²=1−4T+4T²`, and the unitary roots are both 1, so the variable
change T_unitary=2T_cohomological recovers them. The equality is a
polynomial witness; local Satake and Hodge comparisons remain on their
actual supplier carriers.

**Checks.**

- At z=i the diagonal is (i,−i), trace zero and determinant one. Using
  (i,i) would give determinant −1 and the wrong central character.
- At z=2 the parameter is the identity; at z=−1 it is minus the identity.
  Its totalized matrix at z=0 is zero and has determinant zero, so the
  group domain must be C×. All three controls are Lean examples.
- At a split Tate place N has rank one and its Euler factor has degree
  one. A potentially good bad place with nontrivial inertia has degree
  zero, whereas a good place has degree two. Equal Weil semisimplifications
  alone would not recover these three Euler factors without N.
- For the q=4,α=β=2 witness, the cohomological polynomial has middle
  coefficient −4 and quadratic coefficient 4. Reversing the variable
  scaling or the sign of the half-shift would fail this two-term check.

### 8.6 CM curves and the unconditional endpoint

For a geometrically CM elliptic E/K let M be its imaginary quadratic
endomorphism field. The endomorphisms are defined over KM. The target
**`cm_elliptic_realization`** writes H¹(E)|G_KM as the two corresponding
algebraic Hecke-character realizations, with the cohomological infinity
type and the fixed Tate normalization. More precisely, CM endomorphisms
split H¹ over Q̄_ℓ into two rank-one eigenspaces. They are finitely
ramified and de Rham by the abelian H¹ comparison and stability under
direct summands. Apply `geometricCharacter_isHeckeAvatar` of
AutomorphicGaloisRepresentations §3.13 to these characters. Its converse
and AG2.0's `AlgHeckeChar.galoisChar` realize the same algebraic
characters at every coefficient prime: the M-linear good Frobenius
polynomials from AbelianSchemesAndArithmeticModuli A6 identify those
realizations with the two CM eigenspaces by Chebotarev. This is an
application of the rank-one supplier, not a new general CM reciprocity
theorem. Local class field theory gives the character parameters,
including their inertia and coefficient-prime de Rham comparison.
For the rank-one bridge see the second Lemma 1 of the algebraic
Hecke-character notes, pp.9–10, with the geometricity input supplied by
the named owner. If M is not contained in K, induce the character
from KM to K and use the
supplier `quadraticInduction`, including every local parameter. If M=K,
use the isobaric sum of the two characters over K. The induced case is
cuspidal when the character is not Galois invariant; the sum case is
not. The determinant ε⁻¹, together with the algebraic-to-unitary norm
twist, gives trivial central character. (OpenAI §9.4, pp.27–28.)

**Checks.** For K=Q(i), a curve with CM by Q(i), such as y²=x³−x,
uses the isobaric sum. For the same K, a curve with CM by Q(√−3),
such as y²=x³+1, uses induction from KQ(√−3), not a sum over K.
Thus “all CM curves are noncuspidal over K” is false. Geometric non-CM
is a condition on endomorphisms over K̄, not only on K-rational
endomorphisms. Both CM alternatives have the same determinant, complex
parameter and L-function normalization as the non-CM construction.

The endpoint **`imaginary_quadratic_modularity`** states: for **every**
imaginary quadratic number field K and **every** elliptic E/K, construct
an isobaric automorphic π_E of GL₂(𝔸_K), trivial central character and
weight zero, realizing H¹(E_K̄,Q̄_ℓ) for every ℓ and ι. For v∤ℓ its full
Frobenius-semisimple WD parameter agrees with rec^T(π_E,v), including
inertia and N. Every finite local factor, including the factor obtained
at the residue coefficient prime, agrees. Its complex parameter and
L-function identity are exactly those in §8.5. If E is non-CM π_E is
cuspidal; if E is CM it is the induction or isobaric sum just described.
This combines §§8.2–8.5 with the CM branch and is OpenAI Theorem 1.1,
p.1. There is no hypothesis about X₀(15), its rank or point sets, and no
arithmetic data hypothesis attached to this quantifier.

### Examples

A curve over Q(√−10) is included regardless of the Mordell–Weil rank
of any auxiliary modular curve. A non-CM curve with reducible original
mod-three and mod-five images is included: the auxiliary curve, rather
than E, supplies the seed at five. A CM curve whose CM field is already
K is included through the sum branch and is not forced into a cuspidal
existence statement.

### Dependencies

Layers 4–7 supply all systems, congruences, local types and simultaneous
residual conditions. The full CM lifting supplier supplies the three
lifts; the residual-modularity supplier supplies the initial elliptic
seed. The automorphic Galois and local Langlands suppliers give
coefficient changes and the local comparisons. R17.4 supplies cyclic
descent, twisting and quadratic induction. CM eigenspaces use the
endomorphism/realization interface A6, the geometric-character theorem
of AutomorphicGaloisRepresentations §3.13 and the all-prime avatar/local
dictionary of AG2.0; general CM reciprocity is not redeveloped here.

## Downstream consumers and boundaries

The endpoint supplies unrestricted elliptic modularity over every imaginary
quadratic field, in an all-prime, all-local-factor normalization suitable
for arithmetic applications. Consumers needing a cuspidal representation
must retain the geometric non-CM hypothesis; a CM sum has different
analytic and representation-theoretic behavior. The geometric outputs are
also reusable independently: the integral group-ring marking and its
residue-prime character evaluation supply congruences even where rational
character projectors are not integral.

The natural larger modularity target is over totally real fields and CM
fields not containing ζ₅. Le Hung's discussion draft, Theorem 1.1, p.2,
conditional on the OpenAI geometric inputs, explains this extension.
The covers and local geometry here already have number-field generality,
and §7.4 gives the d-conjugate specialization with its explicit large-image
prime choice. The totally real route additionally needs the draft's
reflection descent to the real cyclotomic subfield and total oddness;
these are downstream work, not extra conclusions of this endpoint.
(Le Hung §§2–3, pp.4–7.)

For the CM extension it is essential to place the seed correctly.
ζ₅∉K does **not** imply ζ₅∉F=K(μ₃p). The draft's example
`K=Q(ζ₁₅+ζ₁₅⁻¹,i)` has no ζ₅ but `K(ζ₃)=Q(ζ₆₀)` does.
Its repair proves modularity of A_t over K at five **before** base
change to F, using the same simultaneous residual selection over K;
then the three lifts at p,3,p take place over F. The imaginary quadratic
proof here instead proves ζ₅∉F by ramification and starts over F.
This distinction is retained in the downstream contract rather than
silently reusing §8.2 over arbitrary CM K. (Le Hung §4.6 and
Remark 4.2, p.9.) Neither draft nor this roadmap establishes the ζ₅∈K
case by deleting the seed hypothesis.

There is no quantitative height bound for the chosen parameter, no
algorithm for constructing the automorphic form, and no finite arithmetic
certificate required by the proof route. Those are separate questions.
The roadmap is a plan of proofs and interfaces; its signature file's
`sorry` statements do not constitute an implementation of the theorem.

## References

All results above are stated in our own words. Page locators are the printed
pagination of the indicated fixed versions; the OpenAI PDF has printed
pages 1–30. The Le Hung document is a discussion draft and its wider
modularity conclusion is conditional on the geometric inputs specified
there. It is used for the generality boundary and the d-conjugate argument,
not as a replacement proof of the imaginary quadratic endpoint.

- **OpenAI.** [Modularity of elliptic curves over imaginary quadratic fields](https://github.com/openai/math/blob/adc7f1241b42e322a6451854ab7e4b4c146bf78a/preprints/Modularity-of-elliptic-curves-over-imaginary-quadratic-fields-October-4-2026/paper.pdf), dated 4 October 2026, fixed repository revision `adc7f1241b42e322a6451854ab7e4b4c146bf78a`. Theorem 1.1 p.1; conventions §2 p.4; covers and degenerations §3 pp.5–7; integral monodromy §4 pp.8–11; character systems §5 pp.11–14; imported automorphy inputs §6 pp.14–16; local prescription §7 pp.16–20; specialization §8 pp.20–25; propagation and descent §9 pp.25–28. PDF SHA-256 `c74cc37755f500be0c22ccb4d08ce81df309404a7175a7fb6cf7321330b5187c`.
- **Le Hung.** Bao V. Le Hung, *A geometric prime switch for elliptic curves over totally real and CM fields*, discussion draft dated 7 October 2026, `hexagon:2610.00156v1`. Theorem 1.1 p.2; geometric inputs §2 pp.4–5; totally real reflection construction §3 pp.6–7; simultaneous conjugate genericity §4.4 p.8; CM seed-before-base-change argument §4.6 and Remark 4.2 p.9. Attribution follows the supplied discussion draft; no claim of a refereed publication is made.
- **CN.** Ana Caraiani and James Newton, [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3), arXiv:2301.10509v3, 27 March 2025. Theorem 5.2 and Remarks 5.2.1–5.2.3 pp.73–74; Theorem 6.1 pp.87,90; Lemma 6.1.3 p.88; residual constructions Lemmas 6.1.4, 6.1.7 and Propositions 6.1.5–6.1.6 pp.88–90. The exceptional modular-curve analysis of §7 is outside the proof route here.
- **AKT.** Patrick B. Allen, Chandrashekhar Khare and Jack A. Thorne, [Modularity of GL₂(F_p)-representations over CM fields](https://arxiv.org/pdf/1910.12986v2), arXiv:1910.12986v2, 2 September 2022. Theorems 7.1 and 8.1 pp.67,71–72; independent elliptic seed Proposition 9.12 p.79 and prescribed-type constructions in §9 pp.73–81. These are inputs through the named residual-modularity owner.
- **Varma.** Ila Varma, [Local-global compatibility for regular algebraic cuspidal automorphic representations when ℓ is different from p](https://arxiv.org/pdf/1411.2520v1), arXiv:1411.2520v1. Theorem (1ss), p.1, gives the underlying semisimplified Weil compatibility; Theorem (1), on the same page, bounds monodromy. Its application in OpenAI Lemma 9.2 is the local comparison used here, without an unproved general monodromy equality.
- **ACC+.** P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor and J. A. Thorne, [Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999v2), arXiv:1812.09999v2, 16 June 2022; published in Annals of Mathematics 197 (2023), 897–1113. The cited PDF's §7.1 pp.189–190 specifies compatible-system data and predicates. The shared carrier's single owner is the live SmallRamification §5.0d supplier above.
- **Algebraic Hecke-character notes.** [Algebraic Hecke Characters](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/algebraicHeckecharacters.pdf), seminar notes hosted by Brian Conrad; second Lemma 1 and proof, pp.9–10. Used through AutomorphicGaloisRepresentations §3.13, with its local algebraicity and coefficient-field hypotheses discharged there.
