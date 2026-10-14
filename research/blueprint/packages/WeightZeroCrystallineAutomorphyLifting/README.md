# Roadmap: weight-zero crystalline automorphy lifting with p arbitrarily ramified

**Summary.** This roadmap proves an automorphy lifting theorem for n-dimensional p-adic Galois
representations of a CM or totally real field F that are crystalline of weight zero at every place
above p, for every prime p>n and with no restriction on the ramification of p in F. The residual
representation is only required to be absolutely irreducible, decomposed generic and of adequate
image over F(ζ_p), with a scalar value outside G_{F(ζ_p)}; no polarization, no Fontaine–Laffaille
bound and no enormous-image hypothesis is imposed. It also proves the companion ordinary theorem
with adequate image (Miagkov–Thorne, Theorem 1.3), which the ordinary applications use. The two
inputs that make the crystalline theorem possible are owned by neighbouring roadmaps: crystalline
local–global compatibility for torsion Hecke algebras (Caraiani–Newton) and generic reducedness of
the special fibres of weight-zero crystalline lifting rings (Boxer–Calegari–Gee–Newton–Thorne, §2).
This roadmap owns everything between them: the prepared arithmetic data and their coefficient
systems, the deformation-to-Hecke maps, the commutative algebra of local tensor components, the
adequate-image Taylor–Wiles method with selected-block parahoric levels, the two-system patching
argument, the soluble preparation in which every place above p splits completely, and the descent to
the original field.

The construction runs in six layers. Layer WZ.0 fixes the prepared data, the level, the twisted
coefficient O(χ⁻¹) and the global deformation problem with variable determinant. Layer WZ.1 maps the
deformation ring onto the derived Hecke image modulo a uniformly nilpotent ideal and identifies
characteristic-zero support with cuspidal weight-zero eigensystems. Layer WZ.2 proves the component
statements for completed tensor products of local lifting rings that drive the two-system argument.
Layer WZ.3 builds the adequate selected-block Taylor–Wiles tower, patches the untwisted and twisted
systems together, and propagates automorphic support between two points with the same crystalline
components. Layer WZ.4 reduces the global theorem to the prepared one by soluble base change, with a
separate class-field-theoretic treatment of n=1. Layer WZ.5 records the adequate ordinary companion.

Suggested home: `TauCeti/NumberTheory/AutomorphyLifting/WeightZero/`. The companion
[Suggested.lean](Suggested.lean) records the light definitions and the statements that the pinned
libraries can already express; every other target is specified here.

## Scope and ownership

This roadmap owns the arithmetic assembly of the weight-zero lifting theorem and the adequate-image
Taylor–Wiles method it uses: the selected-block parahoric levels at Taylor–Wiles places, their local
representation theory in characteristic p and in characteristic zero, the level comparison and the
Galois representations at those levels, and the choice of adequate Taylor–Wiles primes (all in
WZ.3). It owns the general commutative algebra that turns generic reducedness of a special fibre
into unique generic generalizations, the component description of completed tensor products, and the
reading of "connects" through components of the crystalline lifting ring of the base field (WZ.2).
The same adequate-image method serves the ordinary companion theorem of WZ.5; it is stated once, in
WZ.3, for both.

**CrystallineLocalGlobalCompatibilityCM** owns crystalline local–global compatibility for torsion
Hecke algebras (Caraiani–Newton, Theorem 4.2.15), crystallinity of the Galois representations of
cuspidal automorphic representations unramified at p (Caraiani–Newton, Theorem 4.3.1), the abstract
two-system patching datum and the support propagation of Caraiani–Newton, Proposition 5.4.2 and
Corollary 5.4.3. **WeightZeroCrystallineLiftingRings** owns the Emerton–Gee stack of étale
(φ,Γ)-modules and the generic reducedness of special fibres of weight-zero crystalline lifting rings
for p>n (Boxer–Calegari–Gee–Newton–Thorne, Theorem 2.5.5); this roadmap consumes that theorem as
stated in the contracts below and does not reprove it.

Arithmetic locally symmetric spaces, their levels, local systems, derived Hecke actions,
finite-level descent and the cuspidal description of rational cohomology belong to
**ArithmeticLocallySymmetricSpaces**; Franke's decomposition to **AutomorphicSpectralTheory**.
Determinants, derived Hecke images, the GL_n Hecke polynomial and the quantified nilpotent
comparison belong to Tau Ceti's **IntegralHeckeAndGaloisDeterminants**. Galois representations of
cuspidal automorphic representations, their local comparisons at ℓ≠p, residual Hecke ideals and
decomposed genericity belong to **AutomorphicGaloisRepresentationsPartII**. Deformation functors,
representability, framing and global presentations belong to **GlobalGaloisDeformations**; local
lifting rings, their tame, unrestricted, crystalline, Taylor–Wiles-block and ordinary quotients to
**LocalGaloisDeformationRings**; adequate and enormous subgroups to
**ArithmeticGaloisRepresentations**. Completed tensor products, abstract derived patching and
support of complexes belong to **DeformationAndDerivedPatchingAlgebra**. Soluble base change and
descent, auxiliary soluble extensions with prescribed local behaviour, split test places, the
ordinary characters and ordinary completed homology belong to **PotentialAutomorphyInfrastructure**;
the connects relation to **PotentialAutomorphyInfrastructurePartII**. Rank-one p-adic Hodge theory
belongs to **PadicHodgeTheory**; reciprocity to Tau Ceti's **ClassFieldTheory** and Hecke characters
to Tau Ceti's **GlobalNumberFields**. Smooth representations, Hecke algebras over rings, Iwahori
decompositions and the Satake isomorphism belong to Tau Ceti's
**SmoothRepresentationsOfLocalGroups**.

These objects enter through the contracts below. Using a contract does not authorize a second
definition: the Hecke-valued Galois representations, the local lifting rings and the patched
complexes of this roadmap are the suppliers' objects, specialized to the data fixed here.

## Conventions

1. F is an imaginary CM field with maximal totally real subfield F⁺ and complex conjugation c,
   except in the final statements of WZ.4 and WZ.5, where F may also be totally real. n≥1 and p>n is
   prime. The prepared data and the patching argument use n≥2; n=1 is treated separately by class
   field theory. Write f=[F⁺:ℚ], s=|S| and d=n²f. In WZ.3, q is the number of Taylor–Wiles primes,
   while q_v is the cardinality of the residue field k(v) of a place v.
2. E/ℚ_p is a finite coefficient field containing the images of all embeddings of F (and, where
   needed, the Galois closure of F, ζ_p and the values of every auxiliary character), with ring of
   integers O, uniformizer ϖ and residue field k. E may be enlarged finitely at any step; after such
   an enlargement the irreducible components of every local lifting ring and of its special fibre
   are geometrically irreducible, and the component labels are unchanged by further enlargement. A
   global theorem stated over ℚ̄_p is proved after choosing an invariant lattice and a large enough
   E; absolute irreducibility of the residual representation makes this independent of the choice.
3. Local Artin maps send uniformizers to geometric Frobenius elements. Tau Ceti's ClassFieldTheory
   uses arithmetic reciprocity, so its maps are composed with inversion. HT(ε_p)=−1: the cyclotomic
   character has Hodge–Tate weight −1, and "weight zero" means labelled Hodge–Tate weights
   {0,1,…,n−1} at every embedding; for r_ι(π) this corresponds to π_∞ having the infinitesimal
   character of the trivial representation.
4. For a place v∉S the spherical Hecke polynomial is P_v(X)=Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2} T_{v,i}
   X^{n−i} with T_{v,0}=1, where T_{v,i} is the double coset of diag(ϖ_v,…,ϖ_v,1,…,1) with i entries
   ϖ_v. Its constant term is (−1)^n q_v^{n(n−1)/2}T_{v,n}. The characteristic polynomial of
   geometric Frobenius on the attached Galois representation is the image of P_v.
5. Deformation problems have variable determinant and no polarization. For a nonempty set T of
   framed places, the T-framed ring is a power series ring in n²|T|−1 variables over the unframed
   ring. A fixed-determinant variant changes both counts and is never substituted.
6. Hecke algebras act on complexes in the derived category; support of cohomology over a deformation
   ring is always defined through a surjection onto a quotient of the derived Hecke image by a
   nilpotent ideal, by transporting it along the homeomorphism of spectra that the nilpotent
   quotient induces. No strict action of a deformation ring on a chain complex is assumed or
   constructed.
7. A component of a Noetherian ring is a minimal prime; a "generic point of the special fibre" is a
   prime minimal over ϖ. A characteristic-zero point is a prime with residue field of characteristic
   zero; a map to O gives one after inverting p.
8. Selected-block convention. At a Taylor–Wiles place v with chosen residual Frobenius eigenvalue
   α_v of multiplicity d_v, all block constructions use the ordered partition n=(n−d_v)+d_v with the
   selected block LAST: the parahoric, its diamond quotient through the determinant of the last
   block, the selected factor of the characteristic polynomial, the eigenvalue projector, the
   boundary Hecke map and the local Galois condition are transported together in this order.

## Exact supplier contracts

### From Mathlib and Tau Ceti

The libraries are Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at
`f790474821cf4256814db967cb154e7af3d0c369`. These declarations are used as they stand:

- [`Representation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean#L49)
  and
  [`Representation.trivial`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean#L62):
  a monoid homomorphism to linear endomorphisms, and the identity action. They carry the twisted
  coefficient O(χ⁻¹) of 0.3; neither imposes continuity or smoothness.
- [`DistribMulAction.toModuleEnd`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/End.lean#L250):
  the units of O acting on O by multiplication, as O-linear endomorphisms.
- [`PrimeSpectrum.comap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/RingHom.lean)
  and `range_comap_of_surjective` (same file): pullback of primes, and the image of Spec of a
  quotient as the zero locus of the kernel. For a nilpotent kernel the image is everything; this is
  the spectral transport of convention 6.
- [`Module.support`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Support.lean#L49):
  the primes at which a localized module is nonzero, applied to cohomology modules over the honest
  Hecke image before transport.
- `minimalPrimes`, `Ideal.minimalPrimes`, `Localization.AtPrime`, `IsReduced`,
  `IsDiscreteValuationRing` and its characterizations in
  `Mathlib/RingTheory/DiscreteValuationRing/TFAE.lean`: the vocabulary of 2.1, which is stated over
  these carriers.

### From neighbouring roadmaps

Each contract states exactly what is consumed; the consuming targets cite it under *Needs*.

- **ArithmeticLocallySymmetricSpaces**, §0.10 (standard level subgroups: Iwahori Iw_v, pro-v Iwahori
  Iw_{v,1} with Iw_v/Iw_{v,1}≅(k(v)^×)^n by diagonal reduction), §0.11 (two pro-v Iwahori factors of
  distinct residue characteristics force neatness), §1.1 (local systems from a finite O-module with
  an action of K_S), §3.3 and §3.11 (the action of the abstract spherical Hecke algebra on RΓ(X_K,V)
  in D(O) and its image T^S(K,V)), §4.10 (Galois-type and non-Eisenstein maximal ideals), §5b.8 with
  §5b.4–§5b.5 (for a non-Eisenstein m, rational cohomology H^\*(X_K,V_λ)_m⊗ℚ̄_p is cuspidal, nonzero
  exactly in the degrees of [q₀,q₀+ℓ₀] with q₀=n(n−1)f/2 and ℓ₀=nf−1 when it is nonzero at all, and
  its eigensystems are those of regular algebraic cuspidal π of weight λ with π^K≠0; ACC, Theorem
  2.4.10), and §6.1, §6.2 and §1.6 (descent along a normal inclusion of levels K′⊲K,
  RΓ(X_K,V)≅RΓ(K/K′,RΓ_{K/K′}(X_{K′},V)) compatibly with Hecke operators, and bounded perfect models
  over O[K/K′] when the larger level is neat). The Franke and Galois hypotheses of §5b.8 are
  discharged by **AutomorphicSpectralTheory**, §5.10 and §5.12, and
  **AutomorphicGaloisRepresentationsPartII**, Layers AG2.0 and AG2.5.
- **IntegralHeckeAndGaloisDeterminants** (Tau Ceti roadmap), Layer 2 (derived Hecke actions and the
  finite O-algebra T(C) for a perfect complex C), Layer 3a, §3a.1 (the GL_n Hecke polynomial and the
  geometric/arithmetic Frobenius dictionary), Layer 4 (interpolation of determinants over integral
  coefficient rings) and Layer 5, §5.1 (descent through an error ideal, with the exponent bounds for
  sums, products and limits).
- **AutomorphicGaloisRepresentationsPartII**: Layer AG2.0 (algebraic weights, the GL₁ dictionary
  between algebraic Hecke characters and p-adic characters, geometric reciprocity), Layer AG2.5
  (local comparison at places not above p: Varma's semisimplified comparison for r_ι(π) and its
  monodromy bound; and, as in the contract of **PotentialAutomorphyInfrastructure** with the same
  supplier, the inertial characteristic-polynomial comparison for Hecke-valued Galois
  representations at places of R and of S^c∖S, ACC Theorem 3.1.1), Layer AG2.7 (maximal Hecke ideals
  of Galois type, their residual representations, decomposed generic residual representations).
- **CrystallineLocalGlobalCompatibilityCM**, §7.5 (case "cr": for good level hyperspecial at the
  chosen p-places, a non-Eisenstein decomposed generic m and the weak complementary degree bound
  Σ_{v̄″≠v̄,v̄′}[F⁺_{v̄″}:ℚ_p]≥½[F⁺:ℚ], there are N depending only on n and [F⁺:ℚ], an ideal J with
  J^N=0 and ρ_m valued in T(RΓ(X_K,V_λ)_m)/J whose restriction to each v|v̄ factors through the
  crystalline lifting ring of weight λ; Caraiani–Newton, Theorem 4.2.15), §7.7 (r_ι(π) is
  crystalline with the expected labelled weights at places where π is unramified, if the residual
  representation is irreducible and decomposed generic; Caraiani–Newton, Theorem 4.3.1). Theorem
  4.2.15 is stated there for the coefficients V_λ; it is consumed here (1.1, 3.7) also for
  V_λ⊗O(χ⁻¹), whose twist factors through the levels at places not above p, and at the Taylor–Wiles
  levels of 3.1, which differ from the hyperspecial level only away from p. The same layer supplies
  §8.2 (the two-system patching datum), §8.3 (automorphic components propagate through the special
  fibre; Caraiani–Newton, Proposition 5.4.2) and §8.5 (support at points of automorphic components;
  Caraiani–Newton, Corollary 5.4.3), together with its Layer 6 (degree shifting for torsion
  coefficients and the unitary Hecke-valued determinants, §6.6–§6.13).
- **WeightZeroCrystallineLiftingRings**: for p>d, K/ℚ_p finite, E containing the Galois closure of K
  and any ρ̄:G_K→GL_d(k), the special fibre R^{crys,0}_{ρ̄}/ϖ of the framed weight-zero crystalline
  lifting ring is generically reduced (BCGNT, Theorem 2.5.5, p. 29), compatibly with finite
  extension of E. It is consumed in 2.5; its owner deduces it from the Emerton–Gee stack of étale
  (φ,Γ)-modules.
- **GlobalGaloisDeformations**: Layers R04.1–R04.3 (lifting functors, representability, local
  deformation problems), Layer G8, §7.1–§7.3 (global deformation problems with variable determinant,
  representability of R_S and R_S^T with n²|T|−1 framing variables, and the presentation
  R^{T,loc}[[X_1,…,X_g]]→R_S^T with g computed from dual Selmer data), and Layer G7, §8.5–§8.7
  (Taylor–Wiles places and primes for enormous image, the pattern that 3.6 adapts).
- **LocalGaloisDeformationRings**: §2.4 and §2.13 (unrestricted lifting rings away from p are O-flat
  local complete intersections of relative dimension n², formally smooth when H²(F_v,ad ρ̄)=0),
  §2.15 (Ihara-avoidance rings: for trivial ρ̄|G_{F_v} and q_v≡1 mod p, the
  inertial-characteristic-polynomial quotients for a tuple χ_v reducing to 1 share their special
  fibre; pairwise distinct χ_v give a geometrically irreducible ring of dimension 1+n²; for trivial
  χ_v every component has that dimension and every special generic point has a unique generic
  generalization), §2.23 (the Taylor–Wiles block condition: scalar inertia on the generalized
  eigenspace of a selected eigenvalue, unramified complement, and the resulting O[Δ_v]-algebra
  structure), §3.4, §3.9 and §3.10 (Kisin's crystalline lifting rings: O-flat, equidimensional of
  dimension 1+n²+[K:ℚ_p]n(n−1)/2 for regular weights, with formally smooth generic fibre), and §1.3,
  §1.7, §1.9, §6.1, §6.24 and §7.6 (ordinary lifting rings over a minimal-prime branch of the weight
  algebra Λ_v, their dimensions and the maximal-dimensional component through a point with distinct
  inertia characters; ACC Lemma 6.2.26).
- **ArithmeticGaloisRepresentations**, §7.9 (adequate subgroups of GL_n(k)), §7.12 (Taylor–Wiles
  image conditions: adequate image of the restriction to F(ζ_p) and a scalar value outside
  G_{F(ζ_p)}).
- **DeformationAndDerivedPatchingAlgebra**: R03.1 (completed tensor products of complete local
  O-algebras, their associativity and change of coefficients), P8 (patching of perfect complexes
  along a fixed ultrafilter: finite-level patching data, compatible choices, patched complexes, the
  patched error ideal, injectivity of the patched Hecke action, surjectivity of the patched
  deformation map, the patched scalar lift, derived augmentation and the residual comparison of two
  patched systems) and P9 (support of complexes, `nilpotent-quotient-support`,
  `action-subalgebra-support`, `support-framing-quotient` and the codimension–amplitude inequality).
- **PotentialAutomorphyInfrastructure**: §2.1 (decomposed genericity survives restriction to fields
  disjoint from the residual normal closure), §2.2 (residual image hypotheses survive linearly
  disjoint restriction), §2.3 (soluble base change and descent with the local Langlands identity at
  every finite place), §2.4 (split test places preserving the residual and cyclotomic residual
  images, the scalar witness and decomposed genericity; its image equalities do not use the
  enormous-image hypothesis), §2.5 (soluble extensions with prescribed completions at finitely many
  places, disjoint from a given field, and cyclic CM extensions split at a given set), §2.7
  (ordinary base-change fields), §2.19 (an unramified Galois parameter forces an unramified local
  factor, from Varma's comparison), §3.6, §3.43, §3.44 and §3.47 (ordinary Galois characters,
  ordinary local–global compatibility, ι-ordinary representations and their soluble base change),
  §4.6–§4.7 and §5.14–§5.16 (normalized dual completed homology over Λ, weight specialization and
  the ordinary diamond-linear maps), and §5.13 (two auxiliary places of distinct residue
  characteristics with H²=0 give neatness).
- **PotentialAutomorphyInfrastructurePartII**, PL.1 `connects-relation`: for potentially crystalline
  ρ₁,ρ₂ with the same residual representation and the same labelled Hodge–Tate weights, ρ₁∼ρ₂ means
  that they define points of a common irreducible component of Spec R^{□,K′-cris}⊗ℚ̄_p for some,
  equivalently every, sufficiently large K′ (BLGGT §1.4).
- **PadicHodgeTheory**, R06.2 `locally-algebraic-coefficient-characters` and
  `rank-one-de-rham-crystalline-classification`: an E-valued character ψ of G_K is de Rham iff it is
  locally algebraic, and it is crystalline iff its algebraic part agrees with it on all of O_K^×.
  That layer uses arithmetic reciprocity and HT(ε_p)=+1; translated to convention 3, ψ∘Art_K agrees
  near 1 with x↦∏_τ τ(x)^{−h_τ}, where h_τ are the labelled Hodge–Tate weights.
- **SmoothRepresentationsOfLocalGroups** (Tau Ceti roadmap): SR.0 and SR.0d (smooth representations
  over coefficient rings, compact-open invariants and their derived functors), SR.1.4–SR.1.5
  (Iwahori decompositions, positive Hecke algebras and the Bernstein presentation of the
  Iwahori–Hecke algebra), SR.2 (parabolic induction and Jacquet functors), SR.3.2 (the Bernstein
  decomposition) and SR.4.3 (the Satake isomorphism for GL_n).
- **ClassFieldTheory** (Tau Ceti roadmap), Layer 7 (the local Artin map, its normalizations and
  conductors) and Layer 11 (global Artin reciprocity and its compatibility with the local maps);
  **GlobalNumberFields** (Tau Ceti roadmap), Layers 9–10 (Hecke characters and infinity types).

## How to read the build

Layer k carries the stage identifier WZ.k. Targets are numbered k.m and cite each other by number.
The short declaration names `WeightZero.X` below are inside the namespace
`TauCetiRoadmap.WeightZeroCrystallineAutomorphyLifting`; the companion file keeps the `WeightZero`
subnamespace.

| Layer | Output |
|---|---|
| WZ.0 | Prepared data, level, twisted coefficient, variable-determinant deformation problem |
| WZ.1 | Deformation-to-Hecke surjections modulo nilpotents; cuspidal recognition of support |
| WZ.2 | Unique generalization, tensor components, connects and the local component statements |
| WZ.3 | Adequate selected-block Taylor–Wiles method, patching and prepared support |
| WZ.4 | Soluble preparation with p split completely, rank one, and the global weight-zero theorem |
| WZ.5 | The adequate ordinary companion theorem |

The proof of the main theorem has the shape of ACC, §6.5, with three substitutions. At the places
above p the Fontaine–Laffaille condition is replaced by the weight-zero crystalline condition, and
the crystalline local–global compatibility of Caraiani–Newton supplies the corresponding
deformation-to-Hecke maps. The special-fibre argument that compares the untwisted and twisted
systems uses generic reducedness of the weight-zero crystalline rings instead of smoothness of
Fontaine–Laffaille rings. The Taylor–Wiles primes have one selected Frobenius eigenvalue each, with
parahoric level of block type (n−d,d), so that adequate image suffices. Soluble preparation never
changes a p-adic completion, so ramification of p is never removed.

## Layer WZ.0: Prepared data, level and the deformation problem

Fix the prepared arithmetic data of BCGNT §3.2 for n≥2, the level they determine, the twisted
coefficient O(χ⁻¹) and the global deformation problem 𝒮_χ with variable determinant. Everything here
is an instance of a supplier object; the definitions of this layer only bundle the hypotheses and
fix the choices that Layers WZ.1–WZ.3 compare.

### 0.1 Prepared weight-zero lifting data

Define `WeightZero.PreparedWeightZeroData`. Fix an imaginary CM field F, n≥2, an odd prime p>n, an
isomorphism ι:ℚ̄_p≅ℂ and a cuspidal automorphic representation π of GL_n(𝔸_F) that is regular
algebraic of weight zero. A term of `PreparedWeightZeroData F n p ι π` consists of a finite set S of
finite places of F containing the set S_p of places above p, a subset R⊆S∖S_p (possibly empty), with
A:=S∖(R∪S_p), and the following eight certificates, each a field with its actual meaning:

1. every rational prime below a place of S, and every rational prime ramified in F, splits in some
   imaginary quadratic subfield of F (so every place of S is split over F⁺ and F/F⁺ is unramified at
   all finite places);
2. for every place v̄ of F⁺ below S_p there is another place v̄′≠v̄ of F⁺ above p with
   Σ_{v̄″≠v̄,v̄′}[F⁺_{v̄″}:ℚ_p] > ½[F⁺:ℚ] (the sum is over the places of F⁺ above p other than v̄,
   v̄′);
3. the residual representation r̄_ι(π) is absolutely irreducible and decomposed generic, and its
   restriction to G_{F(ζ_p)} has adequate image;
4. π_v is unramified for every v∈S_p;
5. for v∈R: π_v has nonzero Iwahori-fixed vectors, q_v≡1 mod p and r̄_ι(π)|G_{F_v} is trivial;
6. for v∈A: π_v is unramified, v^c∉R and H²(F_v, ad r̄_ι(π))=0;
7. A contains two places of different residue characteristics;
8. π_v is unramified for every finite v∉S.

The coefficient field E is then enlarged to contain the Galois closure of F, ζ_p, the residual
values, the values of the auxiliary characters at the places of R and the fields of definition of
the geometric components of all local lifting rings (convention 2). No polarization and no fixed
determinant is part of the data.

Provide the following interface:

- `WeightZero.PreparedWeightZeroData.partition`: S is the disjoint union S_p⊔R⊔A, and S_p is exactly
  the set of places of S above p.
- `WeightZero.PreparedWeightZeroData.split`: every v∈S is split over F⁺, and F/F⁺ is unramified at
  every finite place; both follow from certificate 1.
- `WeightZero.PreparedWeightZeroData.crystallineSeed`: for every v∈S_p, r_ι(π)|G_{F_v} is
  crystalline with labelled Hodge–Tate weights {0,…,n−1} (Caraiani–Newton, Theorem 4.3.1, via the
  supplier's §7.7, using certificates 3 and 4).
- `WeightZero.PreparedWeightZeroData.extendCoefficients`: replacing E by a finite extension E′ gives
  prepared data with the same S, R, A and π, and components of local lifting rings that are
  geometrically irreducible over E stay irreducible over E′.
- `WeightZero.PreparedWeightZeroData.complementaryDegree`: certificate 2 in terms of the multiset of
  local degrees [F⁺_{v̄}:ℚ_p], as the predicate `WeightZero.complementaryDegreeCondition` of the
  companion file.

**Checks.**

- `WeightZero.test_profile_partition`: a place of A is neither above p nor in R; moving it to R
  without trivial residual local representation violates certificate 5.
- `WeightZero.test_profile_degree_boundary`: with four places of F⁺ above p of equal degree,
  removing two leaves exactly half of [F⁺:ℚ] and certificate 2 fails; with five equal places it
  holds.
- `WeightZero.test_profile_ramified_prime`: if p ramifies in F the data are still well formed:
  certificate 4 asks only that π_v be unramified, and no Fontaine–Laffaille bound is imposed.
- `WeightZero.test_profile_no_scalar_at_two`: the data require p odd; for p=2 even a scalar residual
  value outside G_{F(ζ_p)} could not exist, since ζ₂=−1∈F.

Certificate 2 uses the global degree [F⁺:ℚ]; pairwise distinct residual Frobenius eigenvalues are
not substituted for decomposed genericity.

The source is BCGNT, §3.2, conditions (1)–(8), pp. 32–33, with the correction of condition (2)
recorded under *Corrections to the sources*.

*Needs:* **ArithmeticGaloisRepresentations**, §7.9 and §7.12;
**AutomorphicGaloisRepresentationsPartII**, AG2.7 (decomposed generic residual representations);
**CrystallineLocalGlobalCompatibilityCM**, §7.7.

### 0.2 Prepared local level factors

Define `WeightZero.LevelFactors`. Given a set of places with three subsets S, S_p, R and three
families of subgroups K₀(v), K_I(v), K_P(v) of local groups G_v, `LevelFactors S S_p R K₀ K_I K_P v`
is K₀(v) if v∉S or v∈S_p, K_I(v) if v∈S∖S_p and v∈R, and K_P(v) otherwise. The hyperspecial branch
takes precedence, then R, then the remaining places of S. In the arithmetic specialization
G_v=GL_n(F_v), K₀(v)=GL_n(O_{F_v}), K_I(v)=Iw_v (the preimage of the upper triangular Borel under
reduction) and K_P(v)=Iw_{v,1} (the preimage of the upper unipotent subgroup), and the prepared
level is K=∏_v LevelFactors(…)(v)⊂GL_n(𝔸_F^∞).

Provide the following interface:

- `WeightZero.LevelFactors.hyperspecial`: if v∉S or v∈S_p, the factor is K₀(v).
- `WeightZero.LevelFactors.iwahori`: if v∈S, v∉S_p and v∈R, the factor is K_I(v).
- `WeightZero.LevelFactors.proIwahori`: if v∈S, v∉S_p and v∉R, the factor is K_P(v).
- `WeightZero.LevelFactors.neatProduct`: for prepared data (0.1) and the arithmetic factors, the
  product K is a good subgroup (compact, open, factorizable and neat) of GL_n(𝔸_F^∞), neatness
  coming from the two places of certificate 7 through the supplier's §0.11; moreover π^K≠0, using
  Iwahori vectors at R and unramified vectors elsewhere.

**Checks.**

- `WeightZero.test_level_hyperspecial`: with places {0,1,2,3}, S={1,2,3}, S_p={1}, R={2}, the place
  0 outside S and the p-place 1 both select K₀.
- `WeightZero.test_level_iwahori`: in that example, place 2 selects K_I.
- `WeightZero.test_level_auxiliary`: in that example, place 3 selects K_P.
- `WeightZero.test_level_distinguishes_pro`: if K_P(3)≠K_I(3), the factor at place 3 is not K_I(3):
  the auxiliary places carry the pro-v Iwahori, not the full Iwahori.

Neatness is a statement about the product; a single pro-v factor is not asserted to suffice, which
is why certificate 7 asks for two residue characteristics.

The source is BCGNT, §3.2, the definition of K following condition (8), p. 32; neatness follows the
two-prime argument of ACC, Lemma 6.5.2.

*Needs:* 0.1; **ArithmeticLocallySymmetricSpaces**, §0.10 and §0.11;
**PotentialAutomorphyInfrastructure**, §5.13.

### 0.3 Inverse auxiliary character coefficients

Define `WeightZero.AuxiliaryCoefficient`. Let I be a finite index set, (G_i)_{i∈I} groups, H a
group, O a commutative ring, χ_i:G_i→O^× homomorphisms and θ:H→∏_i G_i a homomorphism. Then
`AuxiliaryCoefficient χ θ` is the representation of H on the O-module O in which h acts by
multiplication by (∏_i χ_i(θ(h)_i))⁻¹. In the arithmetic specialization I is the set of pairs (v,i)
with v∈R and 1≤i≤n, G_{(v,i)}=k(v)^×, H=K_S, θ is the projection K_S→K_R=∏_{v∈R}Iw_v followed by
diagonal reduction Iw_v→(k(v)^×)^n, and every χ_{v,i} is trivial modulo ϖ. The tuple χ is
**allowed** if either every χ_{v,i} is trivial, or for every v∈R the characters χ_{v,1},…,χ_{v,n}
are pairwise distinct; choosing one alternative at some places and the other elsewhere is not
allowed. The resulting O[K_S]-module is written O(χ⁻¹), and its local system on X_K is built by the
supplier's §1.1.

The definition reuses `Representation` and the scalar action of O^× on O; it is not a new theory of
one-dimensional representations.

Provide the following interface:

- `WeightZero.AuxiliaryCoefficient.apply`: h·x=(∏_iχ_i(θ(h)_i))⁻¹x for all h and x.
- `WeightZero.AuxiliaryCoefficient.trivial`: if every χ_i is trivial, the representation equals
  `Representation.trivial O H O` on the same module.
- `WeightZero.AuxiliaryCoefficient.ext`: if the aggregate characters h↦∏_iχ_i(θ(h)_i) and
  h↦∏_iχ′_i(θ(h)_i) agree, the two representations are equal; equality of the individual χ_i is
  sufficient but not necessary.
- `WeightZero.AuxiliaryCoefficient.reduce`: for a ring map r:O→k with r(χ_i(g))=1 for all i and g,
  r(h·x)=r(x); so the reduction of O(χ⁻¹) is the trivial module with the identity as comparison map,
  not merely an abstractly isomorphic one.

**Checks.**

- `WeightZero.test_coefficient_inverse`: for one index, H=ℚ^×, χ the identity character and θ the
  diagonal, the unit 2 acts on 1 as 1/2 (not 2).
- `WeightZero.test_coefficient_empty`: for I empty, every h acts trivially.
- `WeightZero.test_coefficient_trivial`: the all-trivial tuple gives exactly
  `Representation.trivial`.
- `WeightZero.test_coefficient_reduction`: if all characters reduce to one under r, then r(h·1)=1.

The source is BCGNT, §3.2, the two alternatives for χ and the module O(χ⁻¹), pp. 32–33.

*Needs:* `Representation`, `Representation.trivial`, `DistribMulAction.toModuleEnd` (Mathlib); 0.2;
**ArithmeticLocallySymmetricSpaces**, §0.10 (diagonal reduction of Iw_v) and §1.1.

### 0.4 The weight-zero variable-determinant deformation problem

Define `WeightZero.CrystallineGlobalProblem`. For prepared data, the non-Eisenstein maximal ideal
m⊂T^S(K,O) with ρ̄_m≅r̄_ι(π) (supplied for the seed π by the supplier's §5b.8 in
**ArithmeticLocallySymmetricSpaces**, after enlarging E so that k(m)=k) and an allowed tuple χ, this
is the global deformation problem with variable determinant

𝒮_χ=(ρ̄_m, S, {O}_{v∈S}, {D_v^{crys,0}}_{v∈S_p}∪{D_v^χ}_{v∈R}∪{D_v^□}_{v∈A}),

where D_v^{crys,0} is the framed weight-zero crystalline quotient (labelled Hodge–Tate weights
{0,…,n−1} at every embedding), D_v^χ classifies lifts whose characteristic polynomial on every
σ∈I_{F_v} is ∏_{i=1}^n(X−χ_{v,i}(Art_{F_v}⁻¹σ)) (with χ_{v,i} inflated from k(v)^× to O_{F_v}^×),
and D_v^□ is the full framed lifting functor. Its unframed ring is R_{𝒮_χ}, its S-framed ring
R^S_{𝒮_χ}, and the local base is R^{S,loc}_χ=⊗̂_{v∈S,O}R_v. Write R_p for the completed tensor
product of the crystalline factors at S_p; it does not depend on χ. Fix universal representatives
ρ_{𝒮_χ} that are identified modulo ϖ through the identifications of `residualComparison`.

Provide the following interface:

- `WeightZero.CrystallineGlobalProblem.localCondition`: restriction to v selects exactly
  D^{crys,0}_v, D^χ_v or D^□_v according as v∈S_p, R or A.
- `WeightZero.CrystallineGlobalProblem.classifies`: continuous local O-algebra maps R_{𝒮_χ}→A
  correspond to strict equivalence classes of lifts of ρ̄_m to A unramified outside S and satisfying
  the three local conditions.
- `WeightZero.CrystallineGlobalProblem.framing`: for S≠∅, R^S_{𝒮_χ} is a power series ring over
  R_{𝒮_χ} in n²|S|−1 variables, after choosing universal representatives.
- `WeightZero.CrystallineGlobalProblem.residualComparison`: there are isomorphisms
  R^{S,loc}_χ/ϖ≅R^{S,loc}_1/ϖ and R_{𝒮_χ}/ϖ≅R_{𝒮_1}/ϖ, compatible with the local-to-global maps and
  with the chosen universal representatives, which are the identity on the p-factor R_p/ϖ.

**Checks.**

- `WeightZero.test_problem_empty_R`: if R=∅ then 𝒮_χ=𝒮_1 and both residual identifications are the
  identity.
- `WeightZero.test_problem_inertia_rank_two`: for n=2 and trivial χ at v∈R, the inertial condition
  is that every inertia element has characteristic polynomial (X−1)², not that inertia acts
  trivially.
- `WeightZero.test_problem_p_factor`: for every allowed χ the crystalline factor R_p is the same
  ring.
- `WeightZero.test_problem_variable_determinant`: the framing count n²|S|−1 is that of the
  variable-determinant problem; imposing a fixed determinant gives a different quotient with a
  different count and is not substituted.

*Construction.* Insert the three local conditions into the variable-determinant problem of the
supplier's §7.1 and apply its representability and framing (§7.2). Away from p the χ and trivial
characteristic-polynomial conditions agree modulo ϖ (the supplier's §2.15), so the special fibres of
the local factors coincide; pass to completed tensor products and to the global rings through the
universal properties. The p-factor is literally the same in both systems.

The source is BCGNT, §3.1.1, the local problems D^{crys,0}_v and D^χ_v, p. 30, and §3.2, the problem
𝒮_χ and the choice of universal representatives, pp. 32–33.

*Needs:* 0.1; 0.3; **ArithmeticLocallySymmetricSpaces**, §4.10 and §5b.8;
**GlobalGaloisDeformations**, §7.1 and §7.2; **LocalGaloisDeformationRings**, §2.4, §2.13, §2.15,
§3.4 and §3.10; **DeformationAndDerivedPatchingAlgebra**, R03.1 (`tensor-associativity`).

### Examples

For n=2 and S={v₁,v₂,v₃} with S_p={v₁}, R={v₂}, A={v₃}, the framed global ring has 4·3−1=11 framing
variables over the unframed ring, the level is GL₂(O_{v₁})×Iw_{v₂}×Iw_{v₃,1} times the hyperspecial
group away from S, and an allowed nontrivial χ is a pair of distinct characters of k(v₂)^×, each ≡1
mod ϖ. If F⁺ has five places above p of equal degree, certificate 2 holds for every choice of v̄;
with four it fails.

### Dependencies

**ArithmeticGaloisRepresentations**, §7.9, §7.12; **ArithmeticLocallySymmetricSpaces**, §0.10,
§0.11, §1.1, §4.10, §5b.8; **AutomorphicGaloisRepresentationsPartII**, AG2.7;
**CrystallineLocalGlobalCompatibilityCM**, §7.7; **DeformationAndDerivedPatchingAlgebra**, R03.1;
**GlobalGaloisDeformations**, §7.1, §7.2; **LocalGaloisDeformationRings**, §2.4, §2.13, §2.15, §3.4,
§3.10; **PotentialAutomorphyInfrastructure**, §5.13.

## Layer WZ.1: Crystalline Hecke maps and cuspidal recognition

Map the deformation ring R_{𝒮_χ} onto the derived Hecke image of RΓ(X_K,O(χ⁻¹)), localized at m,
modulo an ideal whose nilpotence exponent depends only on n and [F:ℚ]. Define support over R_{𝒮_χ}
through that surjection. Identify the characteristic-zero points of the support with cuspidal
weight-zero automorphic representations. Neither a strict action of R_{𝒮_χ} on a chain complex nor
an integral R=T statement is an input or an output of this layer.

### 1.1 The weight-zero deformation-to-Hecke surjection

Prove `WeightZero.CrystallineDeformationHeckeMap`. Assume prepared data (0.1), the level K (0.2), an
allowed χ (0.3) and the problem 𝒮_χ (0.4). Let T_χ=T^S(RΓ(X_K,O(χ⁻¹)))_m be the localized derived
spherical Hecke image. There are an integer δ≥1 depending only on n and [F:ℚ], an ideal J_χ⊂T_χ with
J_χ^δ=0, and a continuous surjection of local O-algebras f_χ:R_{𝒮_χ}→T_χ/J_χ such that for every
finite place v∉S the characteristic polynomial of f_χ∘ρ_{𝒮_χ}(Frob_v) is the image of
P_v(X)=Σ_{i=0}^n(−1)^i q_v^{i(i−1)/2}T_{v,i}X^{n−i}. Consequently the union of the supports of the
cohomology groups H^\*(X_K,O(χ⁻¹))_m over T_χ, transported through Spec(T_χ/J_χ)=Spec T_χ and pulled
back along f_χ, is a well-defined closed subset of Spec R_{𝒮_χ}, its *support*.

*Proof sketch.*

1. Apply the crystalline case of Caraiani–Newton, Theorem 4.2.15
   (CrystallineLocalGlobalCompatibilityCM §7.5) with T=S∪S^c and weight zero, once for each place v̄
   of F⁺ above p, with v̄′ chosen as in certificate 2 of 0.1. The strict inequality of certificate 2
   implies the weak inequality required there, and certificate 1 verifies the condition on T and the
   splitting of p in an imaginary quadratic subfield. The non-vanishing condition on the operators
   [K_{v̄}ν(ϖ)K_{v̄}] is automatic in this case, where they are central and invertible. The
   coefficient O(χ⁻¹) is the trivial weight-zero coefficient at every place above p and differs from
   it only through the factors of K at R; the contract with that roadmap asks for §7.5 for such
   coefficients. This gives ρ_m:G_{F,T}→GL_n(T_χ/J) with the Frobenius polynomials at v∉T (ACC
   Theorem 2.3.7) whose restriction to every v|p factors through the weight-zero crystalline lifting
   ring.
2. At v∈R use the inertial characteristic-polynomial comparison of AG2.5 (ACC Theorem 3.1.1) for the
   twisted coefficient, at v∈A impose nothing, and at v∈S^c∖S obtain unramifiedness from the same
   comparison. Combine the finitely many error ideals with the sum and product bounds of
   IntegralHeckeAndGaloisDeterminants §5.1; the exponent stays bounded in terms of n and [F:ℚ] only.
3. The universal property of R_{𝒮_χ} gives f_χ; it is surjective because T_χ is generated by the
   T_{v,i}, which are the coefficients of the Frobenius characteristic polynomials (§3a.1 of the
   same roadmap). Transport support through the nilpotent quotient as in convention 6
   (DeformationAndDerivedPatchingAlgebra, P9 `nilpotent-quotient-support`).

**Checks.**

- δ depends on neither χ, nor a coefficient exponent, nor any auxiliary Taylor–Wiles level.
- For n=1 the polynomial is X−T_{v,1}; for n=3 its constant coefficient is −q_v³T_{v,3}, with a
  minus sign.
- No lift of f_χ through J_χ and no integral R=T statement is inferred.

The source is BCGNT, Proposition 3.2.3 and its proof, p. 33, following ACC, Proposition 6.5.3, pp.
167–168.

*Needs:* 0.2; 0.3; 0.4; **CrystallineLocalGlobalCompatibilityCM**, §7.5;
**AutomorphicGaloisRepresentationsPartII**, AG2.5; **ArithmeticLocallySymmetricSpaces**, §3.3, §3.11
and §6.1; **IntegralHeckeAndGaloisDeterminants**, Layer 2, §3a.1 and §5.1;
**DeformationAndDerivedPatchingAlgebra**, P9 (`nilpotent-quotient-support`); `PrimeSpectrum.comap`,
`range_comap_of_surjective`, `Module.support` (Mathlib).

### 1.2 Cuspidal recognition of characteristic-zero support

Prove `WeightZero.WeightZeroCohomologicalRecognition`. In the setting of 1.1 with trivial
coefficients (χ=1):

1. every homomorphism T^S(K,O)_m→ℚ̄_p that occurs in H^\*(X_K,E)_m is the Hecke eigensystem of a
   cuspidal automorphic representation Π of GL_n(𝔸_F), regular algebraic of weight zero, with
   (Π^∞)^K≠0 and r̄_ι(Π)≅ρ̄_m;
2. the seed π gives such an eigensystem, so H^\*(X_K,E)_m≠0, and, after a finite extension of E, an
   O-point of R_{𝒮_1} lying in the support of H^\*(X_K,O)_m (its lift r_ι(π) is crystalline of
   weight zero at p by CrystallineLocalGlobalCompatibilityCM §7.7, and unipotently ramified at R by
   AG2.5);
3. if an O-point of R_{𝒮_1} with lift ρ lies in the support, then ρ⊗ℚ̄_p≅r_ι(Π) for the Π attached
   by part 1 to the corresponding eigensystem.

Residual absolute irreducibility is what excludes the noncuspidal summands; an inclusion of cuspidal
cohomology into all cohomology would not suffice.

*Proof sketch.* Part 1 and the nonvanishing in part 2 are ArithmeticLocallySymmetricSpaces §5b.8,
whose Franke and Galois hypotheses are discharged by AutomorphicSpectralTheory §5.10–§5.12 and by
AG2.0, AG2.5 (and AG2.7 for the non-Eisenstein condition). Weight zero is read from the trivial
coefficient; the K-fixed vectors from the finite part. For part 3, compare the characteristic
polynomials of Frobenius at v∉S (1.1 and IntegralHeckeAndGaloisDeterminants §3a.1) with those of
r_ι(Π) (AG2.0) and conclude by Chebotarev and Brauer–Nesbitt, using absolute irreducibility.

**Checks.**

- A seed π with π^K≠0 produces nonzero rational localized cohomology.
- An arbitrary spherical eigensystem, not localized at a non-Eisenstein m, is not asserted to be
  cuspidal.

The source is BCGNT, §3.1.2, pp. 30–31, and §3.2, the choice of m, p. 32; ACC, Theorem 2.4.10 and
its proof, pp. 52–55.

*Needs:* 0.2; 1.1; **ArithmeticLocallySymmetricSpaces**, §4.10, §5b.4, §5b.5, §5b.8;
**CrystallineLocalGlobalCompatibilityCM**, §7.7; **AutomorphicSpectralTheory**, §5.10 and §5.12;
**AutomorphicGaloisRepresentationsPartII**, AG2.0, AG2.5 and AG2.7;
**IntegralHeckeAndGaloisDeterminants**, §3a.1.

### Examples

For n=2 and F imaginary quadratic (f=1), the localized rational cohomology of a weight-zero cuspidal
π lives in degrees [1,2]: q₀=n(n−1)f/2=1 and ℓ₀=nf−1=1. The polynomial P_v for n=2 is
X²−T_{v,1}X+q_vT_{v,2}.

### Dependencies

**ArithmeticLocallySymmetricSpaces**, §3.3, §3.11, §4.10, §5b.4, §5b.5, §5b.8, §6.1;
**AutomorphicGaloisRepresentationsPartII**, AG2.0, AG2.5, AG2.7; **AutomorphicSpectralTheory**,
§5.10, §5.12; **CrystallineLocalGlobalCompatibilityCM**, §7.5, §7.7;
**DeformationAndDerivedPatchingAlgebra**, P9; **IntegralHeckeAndGaloisDeterminants**, Layer 2,
§3a.1, §5.1.

## Layer WZ.2: Local tensor components and their transport

The two-system argument of WZ.3 compares the untwisted and twisted local deformation rings through
their common special fibre. This layer proves what that comparison needs: unique generic
generalizations of special-fibre generic points, the component description of completed tensor
products, the reading of "connects" through components of the crystalline ring of the base field,
and five statements about R^{S,loc}_χ. The outside input is generic reducedness of the special
fibres of the weight-zero crystalline rings, supplied by WeightZeroCrystallineLiftingRings.

### 2.1 Unique generalization from a generically reduced special fibre

Prove `WeightZero.existsUnique_minimalPrime_le_of_isReduced`. Let A be a Noetherian commutative
ring, ϖ∈A a nonzerodivisor and q a prime of A minimal over ϖA. If the localization (A/ϖA)_q is
reduced, then A_q is a discrete valuation ring whose maximal ideal is generated by ϖ, and q contains
exactly one minimal prime of A. Consequently, if A is a complete Noetherian local O-algebra that is
O-flat and A/ϖ is generically reduced, then every generic point of Spec(A/ϖ) is the specialization
of exactly one generic point of Spec A, and that generic point has characteristic zero.

The companion file states the two conclusions at a prime as
`WeightZero.existsUnique_minimalPrime_le_of_isReduced` and
`WeightZero.isDiscreteValuationRing_localization_of_isReduced`.

*Proof sketch.* (A/ϖA)_q is a zero-dimensional reduced local ring, hence a field, so qA_q=ϖA_q is
principal. By Krull's principal ideal theorem and because ϖ is a nonzerodivisor, A_q has dimension
exactly one. A one-dimensional Noetherian local ring whose maximal ideal is generated by a
nonzerodivisor is regular, hence a discrete valuation ring and a domain; its unique minimal prime is
(0), which corresponds to the unique minimal prime of A inside q. A minimal prime of an O-flat ring
does not contain ϖ, which gives characteristic zero.

**Checks.**

- For A=O and q=(ϖ) the unique minimal prime is (0); for A=O[[x]] and q=ϖO[[x]] it is again (0).
- Reducedness is necessary: for p odd, A=O[x]/(x²−ϖ²) and q=(ϖ,x), the special fibre k[x]/(x²) is
  not reduced at q, and q contains the two minimal primes (x−ϖ) and (x+ϖ).
- For A=O[[x]] and q=ϖA, the localization A_q is a discrete valuation ring with uniformizer ϖ and
  residue field the fraction field of k[[x]].

The statement is the general algebra in the proof of Caraiani–Newton, Lemma 5.3.3, pp. 76–77, which
is stated there only for a rank-two Barsotti–Tate ring; the DVR criterion is [Stacks, Tag 00PD].

*Needs:* `minimalPrimes`, `Ideal.minimalPrimes`, `Localization.AtPrime`, `IsReduced`,
`IsDiscreteValuationRing` (Mathlib).

### 2.2 Components of completed tensor products

Prove `WeightZero.completedTensor_components`. Let k be perfect and let A, B be complete Noetherian
local O-algebras with residue field k, and write A⊗̂B for their completed tensor product over O.

1. If A and B are O-flat domains, dim(A⊗̂B)=dim A+dim B−1.
2. If every quotient A/𝔭 and B/𝔮 by a minimal prime is O-flat and geometrically integral, then the
   minimal primes of A⊗̂B are exactly the ideals 𝔭(A⊗̂B)+𝔮(A⊗̂B), distinct for distinct pairs.
3. The same holds for the special fibres A/ϖ and B/ϖ over k, with "geometrically integral" over k.
4. If moreover every prime minimal over ϖ in A (resp. B) has geometrically integral quotient and
   contains a unique minimal prime, then every prime of A⊗̂B minimal over ϖ contains a unique
   minimal prime of A⊗̂B.
5. Taking B=O[[z₁,…,z_g]] gives the same statements for adjoining power-series variables: components
   and special generic points of A[[z₁,…,z_g]] correspond to those of A, dimensions increase by g,
   and unique generalization is preserved.
6. After a finite extension of E, every component and every special-fibre component of a complete
   Noetherian local O-algebra that is the completion of a finite-type flat O-scheme at a k-point has
   geometrically integral quotient.

*Proof sketch.* A⊗̂B is flat over A, so its dimension is dim A plus the dimension of
k⊗_A(A⊗̂B)=k⊗̂B; this gives 1. Geometric integrality of the factors gives integrality of each
A/𝔭⊗̂B/𝔮, and the minimal primes are its kernels, giving 2 and 3. Part 4 combines 2 and 3 with the
fact that a special generic point of a pair-component lies in exactly one generic pair-component.
Parts 5 and 6 are the cases B=O[[z]] and the finiteness of the number of geometric components.

**Checks.**

- dim O[[x]]⊗̂O[[y]]=dim O[[x,y]]=3=2+2−1.
- Geometric integrality is needed in 2: for u∈ℤ_p^× a non-square, A=ℤ_p[[x,y]]/(x²−uy²) is an O-flat
  domain with residue field 𝔽_p that becomes reducible over ℤ_{p²}, and A⊗̂A has two minimal primes
  although A has one.
- For A with two components and B=O[[z]], A⊗̂B has exactly two components, one over each component
  of A.

The source is Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 3.3, parts 2, 3, 5, 6, 7 and 8, pp. 48–49;
it is applied to local deformation rings in ACC, Lemmas 6.2.25–6.2.26, pp. 146–148.

*Needs:* 2.1; **DeformationAndDerivedPatchingAlgebra**, R03.1 (completed tensor products,
`tensor-associativity`, `tensor-domain-point`).

### 2.3 Connects through the crystalline ring of the base field

Prove `WeightZero.connects_iff_sameCrystallineComponent`. Let K/ℚ_p be finite and let
ρ₁,ρ₂:G_K→GL_n(O_{ℚ̄_p}) be crystalline lifts of the same ρ̄ with the same labelled Hodge–Tate
weights {H_τ}, each H_τ consisting of n distinct integers. Then ρ₁ connects to ρ₂ in the sense of
PotentialAutomorphyInfrastructurePartII PL.1 if and only if ρ₁ and ρ₂ define points of the same
irreducible component of Spec R^{□,crys,{H_τ}}_{ρ̄}⊗ℚ̄_p. Each such point lies on exactly one
component; the component does not depend on the choice of framing or on enlarging E.

*Proof sketch.* For every finite extension K′/K the ring R^{□,K′-cris} is equidimensional of
dimension 1+n²+[K:ℚ_p]n(n−1)/2 for regular weights (LocalGaloisDeformationRings §3.9), and
R^{□,crys}=R^{□,K-cris} is a closed quotient of the same dimension, so Spec R^{□,crys} is a union of
irreducible components of Spec R^{□,K′-cris}. Their generic fibres are formally smooth (§3.10), so
every ℚ̄_p-point lies on a unique component of each. The unique component of Spec R^{□,K′-cris}⊗ℚ̄_p
through ρ_i is therefore the unique component of Spec R^{□,crys}⊗ℚ̄_p through ρ_i, for every K′,
which is the claim.

**Checks.**

- ρ₁ connects to itself.
- For n=2, weight zero (labelled weights {0,1}), ρ̄ trivial and residue field of K larger than 𝔽_p,
  the crystalline ring has an ordinary and a non-ordinary component (Caraiani–Newton, Lemma 5.3.4,
  p. 77); an ordinary and a non-ordinary crystalline lift do not connect.
- Twisting both ρ_i by the same unramified character trivial modulo the maximal ideal preserves the
  relation.

The source is Barnet-Lamb–Gee–Geraghty–Taylor, §1.4, pp. 25–26 of arXiv:1010.2561v4, and BCGNT,
Remark 3.2.2, p. 32.

*Needs:* **PotentialAutomorphyInfrastructurePartII**, PL.1 (`connects-relation`);
**LocalGaloisDeformationRings**, §3.4, §3.9 and §3.10.

### 2.4 Dimension and characteristic of the local tensor components

Prove `WeightZero.LocalTensorDimension`. For prepared data and an allowed tuple χ, R^{S,loc}_χ is
O-flat and equidimensional of Krull dimension 1+n²|S|+n(n−1)[F:ℚ]/2, and every irreducible component
has a characteristic-zero generic point. Every local factor is nonzero: the seed gives crystalline
points at S_p, the trivial residual tame problems have lifts of every type at R, and the
unrestricted factors at A are formally smooth. After a finite extension of E (2.2, part 6), the
components of R^{S,loc}_χ, and of its special fibre, are indexed by the tuples of components of the
local factors. Dimensions add with a single coefficient dimension: for T⊆S, dim R^{T,loc}_χ is 1
plus the sum of the relative dimensions of the factors at T, not |T| copies of dim O.

*Proof sketch.* At v∈S_p the crystalline ring is O-flat and equidimensional of dimension
1+n²+n(n−1)[F_v:ℚ_p]/2 (LocalGaloisDeformationRings §3.9); at v∈R and v∈A the rings are O-flat of
dimension 1+n² (§2.15, §2.4, §2.13). Apply 2.2, parts 1, 2 and 6, and sum the local degrees
[F_v:ℚ_p] over v∈S_p to [F:ℚ].

**Checks.**

- For n=2 and [F:ℚ]=2, the dimension is 1+4|S|+2=3+4|S|.
- No factor and no tensor component has a generic point in characteristic p.

The source is BCGNT, Lemma 3.2.4(1) and its proof, pp. 33–34.

*Needs:* 0.4; 2.2; **LocalGaloisDeformationRings**, §2.4, §2.13, §2.15, §3.9 and §3.10.

### 2.5 Unique generic generalization from the special fibre

Prove `WeightZero.UniqueSpecialGeneralization`. For prepared data and an allowed χ, every generic
point of Spec(R^{S,loc}_χ/ϖ) is the specialization of exactly one generic point of Spec R^{S,loc}_χ.
This concerns minimal primes only; it does not assert that R^{S,loc}_χ or its special fibre is
regular or reduced.

*Proof sketch.* At v∈S_p the special fibre of the weight-zero crystalline ring is generically
reduced for p>n (the contract with WeightZeroCrystallineLiftingRings, BCGNT Theorem 2.5.5); since
the ring is O-flat, 2.1 gives unique generalizations. At v∈R this is the supplier's §2.15 (trivial
and distinct χ), at v∈A the ring is formally smooth. Then 2.2, part 4, after the finite extension of
2.2, part 6, passes to the completed tensor product.

**Checks.**

- The hypothesis p>n is used and is not weakened.
- A generically reduced special fibre is weaker than a reduced one, and only the former is used.

The source is BCGNT, Lemma 3.2.4(2), pp. 33–34, with Theorem 2.5.5, p. 29, and Caraiani–Newton,
Lemma 5.3.3, pp. 76–77.

*Needs:* 2.1; 2.2; 2.4; **WeightZeroCrystallineLiftingRings** (generic reducedness, BCGNT Theorem
2.5.5); **LocalGaloisDeformationRings**, §2.4, §2.13 and §2.15.

### 2.6 Distinct auxiliary types preserve the p-component labels

Prove `WeightZero.DistinctTypeComponentProjection`. If χ_{v,1},…,χ_{v,n} are pairwise distinct for
every v∈R, the projection Spec R^{S,loc}_χ→Spec R_p induces a bijection on irreducible components.
There may be many components of R_p; the bijection removes the labels at the places away from p and
does not identify different p-components.

*Proof sketch.* With pairwise distinct characters, the factor at v∈R is geometrically irreducible
(LocalGaloisDeformationRings §2.15), and the factor at v∈A is formally smooth, hence geometrically
irreducible. By 2.2, part 2, the components of the tensor product are tuples of components of the
factors; every factor away from p contributes a single component.

**Checks.**

- If R=∅ the distinctness hypothesis is vacuous and the statement is the identification of
  components of R_p⊗̂(formally smooth factors) with those of R_p.
- Several components of R_p remain several components after changing the tame types.

The source is BCGNT, Lemma 3.2.4(3) and its proof, pp. 33–34.

*Needs:* 2.2; 2.4; **LocalGaloisDeformationRings**, §2.4, §2.13 and §2.15.

### 2.7 A unique p-component through each characteristic-zero point

Prove `WeightZero.UniqueCharacteristicZeroPComponent`. Each characteristic-zero point of Spec R_p
lies on exactly one irreducible component. For two O-points of R_{𝒮_1} with lifts ρ₁,ρ₂, the images
of ρ₁ and ρ₂ in Spec R_p lie on the same component if and only if ρ₁|G_{F_v} connects to ρ₂|G_{F_v}
for every v∈S_p. The component attached to a point does not depend on the framing or on enlarging E.

*Proof sketch.* R_p[1/p] is regular, because each crystalline factor has formally smooth generic
fibre (LocalGaloisDeformationRings §3.10) and completed tensor products of such rings have regular
generic fibre (DeformationAndDerivedPatchingAlgebra R03.1 `tensor-domain-point`, with 2.2). A
regular local ring is a domain, so a point lies on one component. The comparison with "connects" is
2.3 applied at each v∈S_p, together with 2.2, part 2, which identifies components of R_p with tuples
of local components. Potential diagonalizability is not used: only a common component is required.

**Checks.**

- The statement concerns R_p[1/p]; no integral smoothness is claimed.
- It is not asserted that any two crystalline weight-zero lifts connect.

The source is BCGNT, Lemma 3.2.4(4) and Remark 3.2.2, pp. 32–34.

*Needs:* 0.4; 2.2; 2.3; **LocalGaloisDeformationRings**, §3.10;
**DeformationAndDerivedPatchingAlgebra**, R03.1.

### 2.8 Residual component transport through distinct types

Prove `WeightZero.ResidualComponentTransport`. Let χ be pairwise distinct at every v∈R. Let C be an
irreducible component of Spec R^{S,loc}_1 and C_p its image component in Spec R_p. Under the
identification R^{S,loc}_1/ϖ≅R^{S,loc}_χ/ϖ of 0.4, every generic point of C∩Spec(R^{S,loc}_1/ϖ)
generalizes to the generic point of the component of Spec R^{S,loc}_χ that corresponds to C_p under
2.6. In particular, two components of R^{S,loc}_1 with the same p-label have special generic points
generalizing to the same component of R^{S,loc}_χ. The same holds after adjoining the same finite
set of power-series variables to both rings, including the existence of these special generic points
and the fact that they have codimension one.

*Proof sketch.* A special generic point of C maps to a special generic point of R_p, whose
generalization in R_p is unique by 2.5 applied to the p-factor; that generalization is C_p. Under
the residual identification the same special point lies in R^{S,loc}_χ/ϖ, whose generalization is
unique by 2.5, and its p-label is C_p, so by 2.6 it is the component labelled C_p. Adjoining
variables is 2.2, part 5; codimension one follows from O-flatness and 2.4.

**Checks.**

- Different p-labels are never merged by this comparison.
- The residual identification of 0.4 is fixed before one speaks of the same special point.

The source is BCGNT, Lemma 3.2.4(5) and its proof, and the proof of Theorem 3.2.5, pp. 33–35.

*Needs:* 0.4; 2.2; 2.5; 2.6; 2.7.

### Examples

For n=2 and F imaginary quadratic with p split, R_p is the completed tensor product of two
weight-zero (Barsotti–Tate) crystalline rings, each of dimension 1+4+1=6. If ρ̄ is trivial at both
places and the residue fields are 𝔽_p, the components are not distinguished by ordinarity; for
residue fields larger than 𝔽_p each factor has an ordinary and a non-ordinary component, so R_p has
four components and two seeds with different ordinarity at one place do not connect.

### Dependencies

**DeformationAndDerivedPatchingAlgebra**, R03.1; **LocalGaloisDeformationRings**, §2.4, §2.13,
§2.15, §3.4, §3.9, §3.10; **PotentialAutomorphyInfrastructurePartII**, PL.1;
**WeightZeroCrystallineLiftingRings** (BCGNT Theorem 2.5.5).

## Layer WZ.3: Adequate Taylor–Wiles method, patching and prepared support

The Taylor–Wiles primes of this layer carry one selected residual Frobenius eigenvalue α_v of
multiplicity d_v, and the level at v is the parahoric of block type (n−d_v,d_v) with its diamond
quotient through the determinant of the selected (last) block. This needs only adequate residual
image, at the price of the local representation theory of 3.2–3.3 and of new Galois representations
at these levels (3.5). Targets 3.1–3.6 are the adequate-image Taylor–Wiles method of Miagkov–Thorne,
written once for both the crystalline argument of 3.7–3.10 and the ordinary argument of WZ.5.
Targets 3.7–3.10 assemble the crystalline weight-zero tower, patch the untwisted and twisted systems
together and propagate support.

### 3.1 Selected-block parahoric levels

Define `WeightZero.SelectedBlockLevel`. *Local part.* Let v be a finite place of F, not above p,
with q_v≡1 mod p, and let ρ̄ be unramified at v with ρ̄(Frob_v) having an eigenvalue α_v∈k of
multiplicity d_v≥1 as a root of its characteristic polynomial. Let ν_v be the ordered partition
n=(n−d_v)+d_v and P_ν the block upper-triangular parabolic with blocks of sizes n−d_v and d_v, in
this order. Set

- 𝔭_v = the preimage of P_ν(k(v)) in GL_n(O_{F_v}) (the parahoric of type ν_v);
- Δ_v = k(v)^×(p), the maximal quotient of p-power order of k(v)^×;
- 𝔭_{v,1} = the kernel of 𝔭_v→P_ν(k(v))→GL_{d_v}(k(v))→k(v)^×→Δ_v, the middle map being the
  projection to the last diagonal block and the next one its determinant.

Then 𝔭_v/𝔭_{v,1}≅Δ_v. Write Ξ_{v,1}=Δ_v×ℤ^n with S_ν=S_{n−d_v}×S_{d_v} acting on ℤ^n, and
O[Ξ_{v,1}]^{S_ν}→H_O(GL_n(F_v),𝔭_{v,1}) for the map of Miagkov–Thorne §3: the positive part of the
Levi Hecke algebra is transported by t_ν (Vignéras' positive-monoid embedding, extended to the whole
Levi algebra because a strictly positive central element is invertible), composed with the inverse
Satake isomorphism of the Levi and the twist by |det|^{(1−n)/2}; the generator of Δ_v acts as the
diamond operator. In particular each block j∈{1,2} has operators V_{i,j} (1≤i≤ size of the block)
whose action on 𝔭_v-invariants is the i-th elementary symmetric function in the Satake parameters of
that block.

*Global part.* For a finite set S of places as in 0.1 and a non-Eisenstein maximal ideal m with
residual representation ρ̄_m, a **Taylor–Wiles datum** of level N≥1 is a finite set Q of places of
F, disjoint from S and from Q^c, such that q_v≡1 mod p^N, v is split over F⁺ and lies above a
rational prime split in an imaginary quadratic subfield of F, ρ̄_m is unramified at v and v^c, and a
choice for each v∈Q of an eigenvalue α_v of ρ̄_m(Frob_v), of multiplicity d_v. The levels
K₁(Q)⊆K₀(Q)⊆K agree with K away from Q and are 𝔭_{v,1}⊆𝔭_v at v∈Q; K₀(Q)/K₁(Q)≅Δ_Q:=∏_{v∈Q}Δ_v. Put
S′=S∪Q∪Q^c, 𝕋^{S′}_Q=𝕋^{S∪Q}⊗⊗_{v∈Q}ℤ[Ξ_{v,1}]^{S_ν}, and let 𝕋^{S′}_Q(K₀(Q),V) and
𝕋^{S′}_Q(K₀(Q)/K₁(Q),V) be its images in End_{D(O)}(RΓ(X_{K₀(Q)},V)) and
End_{D(O[Δ_Q])}(RΓ_{K₀(Q)/K₁(Q)}(X_{K₁(Q)},V)). The ideal m_Q is generated by m and, for each v∈Q,
by the kernels of the maps ℤ[Ξ_{v,1}]^{S_ν}→k sending the two block-variable sets to the
coefficients of det(X−ρ̄_m(Frob_v))/(X−α_v)^{d_v} (first block) and (X−α_v)^{d_v} (last block), and
the diamond generator to 1.

Provide the following interface:

- `WeightZero.IsSelectedBlockParahoric`: membership in 𝔭_v, as the condition that the entries in the
  rows of the last block and the columns of the first block lie in the maximal ideal of O_{F_v}.
- `WeightZero.SelectedBlockLevel.diamondQuotient`: 𝔭_v/𝔭_{v,1}≅Δ_v through the determinant of the
  last block, and K₀(Q)/K₁(Q)≅Δ_Q.
- `WeightZero.SelectedBlockLevel.diamondOrder`: if q_v≡1 mod p^N then Δ_v is cyclic of order at
  least p^N.
- `WeightZero.SelectedBlockLevel.fullBlock`: if d_v=n, then 𝔭_v=GL_n(O_{F_v}) and 𝔭_{v,1} is the
  kernel of the determinant to Δ_v.
- `WeightZero.SelectedBlockLevel.emptyDatum`: for Q=∅, K₁(Q)=K₀(Q)=K, Δ_Q=1 and m_Q=m.
- `WeightZero.SelectedBlockLevel.goodLevel`: if K is good (0.2), so are K₀(Q) and K₁(Q).
- `WeightZero.SelectedBlockLevel.blockOperators`: on π^{𝔭_v} for an unramified principal series π
  with Satake parameters (β₁,…,β_n) ordered so that the last d_v belong to the last block, V_{i,2}
  acts by e_i(β_{n−d_v+1},…,β_n).

**Checks.**

- `WeightZero.test_selectedBlock_full`: for d_v=n, the level at v is hyperspecial and only the
  diamond condition distinguishes 𝔭_{v,1}.
- `WeightZero.test_selectedBlock_rank_two`: for n=2 and d_v=1, 𝔭_v is the Iwahori subgroup and
  𝔭_{v,1} is cut out by the lower-right diagonal entry, whose image in Δ_v must be trivial; the
  upper-left entry is unconstrained.
- `WeightZero.test_selectedBlock_order`: for q_v=11 and p=5, Δ_v≅ℤ/5; for q_v=101 and p=5, Δ_v≅ℤ/25.
- `WeightZero.test_selectedBlock_last`: for n=3 and d_v=1 the blocks are (2,1) and the diamond acts
  on the last rank-one block; the block order (1,2) with a last-block diamond would select a
  rank-two block and is not this level.

The sources are Miagkov–Thorne, §2 (the two-block parahoric and its operators), pp. 4–7, §3 (the
groups 𝔭₁, Ξ_{v,1} and the maps t_μ, Proposition 3.1 and Lemma 3.2), pp. 9–11, and §7.2 (the
Taylor–Wiles datum, the levels K₁(Q)⊆K₀(Q) and the ideal m_Q), pp. 25–26, with the block order fixed
as in convention 8 (see *Corrections to the sources*).

*Needs:* 0.2; **SmoothRepresentationsOfLocalGroups**, SR.1.4 (Iwahori decompositions and positive
Hecke algebras) and SR.4.3 (Satake for GL_n); **ArithmeticLocallySymmetricSpaces**, §0.10, §3.3 and
§3.11.

### 3.2 The selected-block comparison in characteristic p

Prove `WeightZero.selectedBlock_modp_comparison`. Let v, α_v, d_v and 𝔭_v be as in 3.1, with p>n,
and let k be algebraically closed of characteristic p. Let 𝒞 be the category of locally admissible
smooth k[GL_n(F_v)]-modules all of whose irreducible subquotients are subquotients of unramified
principal series whose Satake parameters are the eigenvalues of ρ̄(Frob_v). Let e_α be the
idempotent on V^{𝔭_v} cut out by the operators V_{i,2} of the last block: the limit of
(∏_jQ_j(V_{j,2}))^{m!} as m grows, where, for 1≤j≤d_v, P_j is the polynomial whose roots (with
multiplicity) are the values of the j-th elementary symmetric function on the d_v-element
sub-multisets of the Satake parameters, and P_j=Q_j·(X−\binom{d_v}{j}α_v^j)^{k_j} with coprime
factors. Then the map V^{GL_n(O_{F_v})}→e_αV^{𝔭_v} (inclusion followed by e_α) is an isomorphism of
functors on 𝒞, and so are its derived functors: H^i(GL_n(O_{F_v}),V)≅e_αH^i(𝔭_v,V) for every i≥0 and
V∈𝒞.

*Proof sketch.* Every irreducible object of 𝒞 is a subrepresentation of an unramified principal
series (Frobenius reciprocity with the Jacquet module). 𝒞 lies in the unipotent block, which for
q_v≡1 mod p and p>n is equivalent to modules over the Hecke algebra of the pro-p Iwahori subgroup
(Clozel–Harris–Taylor, Theorem B.1); it has enough injectives and exact inclusion. Injectivity for
irreducibles and surjectivity for principal series are Thorne's Lemma 5.10; the injectivity of the
induced map on H¹ for irreducibles uses the description H¹(Iw,π)≅Hom(T(k(v)),π^{Iw}) and the
explicit action of e_α on the Iwahori-fixed basis of the principal series. Induction on length and
the five lemma conclude.

**Checks.**

- For d_v=n, 𝔭_v=GL_n(O_{F_v}), e_α=1 on 𝒞 and the statement is the identity.
- The hypothesis q_v≡1 mod p is used (inflation–restriction through a pro-q group, q≡1 mod p); for
  q_v≢1 mod p the Iwahori–Hecke algebra mod p is not a group algebra and the argument fails.
- For n=2, d_v=1 and an unramified principal series V with distinct parameters, V^{GL₂(O)} is a line
  and V^{Iw} a plane; the inclusion alone is not surjective, while its composite with e_α is an
  isomorphism onto the α-line.

The source is Miagkov–Thorne, §2, Propositions 2.1, 2.6, 2.8 and Theorem 2.14, pp. 4–9, with Thorne
(2012), Lemma 5.10, arXiv pp. 25–26, and Clozel–Harris–Taylor, Appendix B, Theorem B.1.

*Needs:* 3.1; **SmoothRepresentationsOfLocalGroups**, SR.0, SR.0d (derived compact-open invariants),
SR.1.5 (Bernstein presentation) and SR.2 (parabolic induction and Jacquet functors);
**PotentialAutomorphyInfrastructure**, §5.3 (the residual Iwahori Hecke algebra at Taylor–Wiles
places, for q≡1 mod p).

### 3.3 Parahoric invariants and inertia in characteristic zero

Prove `WeightZero.parahoric_inertia_relation`. Let v∤p, let μ be an ordered partition n=n₁+⋯+n_k, 𝔭
the parahoric of type μ and 𝔭₁ the kernel of 𝔭→GL_{n_k}(k(v))→k(v)^×→k(v)^×(p) (last block). Let
P_{μ,i}(T)=∏_{j in block i}(T−X_j), Res_μ=∏_{i<j}Res(P_{μ,i},P_{μ,j}),
Res_{q_v,μ}=∏_{i<j}Res(P_{μ,i}(q_vT),P_{μ,j}) in ℤ[Ξ_v]^{S_μ}, and let E_{μ,i} be the polynomials
with Σ_iE_{μ,i}=Res_μ that specialize to Res_μ times the projector onto the sum of generalized
eigenspaces of the i-th block (Miagkov–Thorne Lemma 3.7). For an irreducible admissible
ℂ-representation π of GL_n(F_v) with π^{𝔭₁}≠0 and (r,N)=rec_{F_v}(π):

1. either Res_{q_v,μ}^{n!} acts by zero on π^{𝔭₁}, or N=0 and r=χ₁⊕⋯⊕χ_n with χ₁,…,χ_{n−n_k}
   unramified and χ_{n−n_k+1},…,χ_n tamely ramified with equal restriction to inertia;
2. either Res_{q_v,μ}^{n!} acts by zero on π^{𝔭₁}, or, over the image of O[Ξ_{v,1}]^{S_μ} in
   End(π^{𝔭₁}), for every τ∈I_{F_v} the operator identity
   Res_μ^{n!}(Σ_{i<k}E_{μ,i}(r(φ_v))+⟨Art_{F_v}⁻¹τ⟩E_{μ,k}(r(φ_v))−Res_μ·r(τ))=0 holds, φ_v a
   Frobenius lift;
3. the same statements hold for the normalization rec^T_{F_v}, with the twisted map Σ^T (which is
   defined over ℤ[q_v^{-1}] and independent of the square root of q_v), and for the contragredient,
   with the Hecke algebra acting through the anti-involution ι_H.

*Proof sketch.* The 𝔭₁-invariants of a parabolically induced representation decompose over double
cosets (Mackey); the Bernstein–Zelevinsky classification writes π as a quotient of an induced
product of twisted Steinberg representations with tamely ramified supercuspidal support. Summands in
which a segment of length >1 meets a block of size >1, or in which the last block meets a ramified
character twice, contribute no 𝔭₁-fixed vectors, which leaves one-dimensional pieces indexed by
labelled partitions of the supercuspidal support; on each the block operators act by elementary
symmetric functions. Lemma 3.7's projectors then give the identity.

**Checks.**

- For μ=(n), 𝔭=GL_n(O_{F_v}), all resultants are empty products and the relation says that r(τ) is
  the scalar ⟨Art⁻¹τ⟩: inertia acts through one tame character of p-power order.
- For n=2, μ=(1,1) and π an unramified twist of the Steinberg representation, π^{𝔭₁}≠0 while N≠0, so
  Res_{q_v,μ}^{n!} acts by zero; indeed the two block parameters on π^{Iw} differ by the factor q_v.
- For an unramified principal series, χ_{n−n_k+1},…,χ_n are unramified and the relation reduces to
  r(τ)=1.

The source is Miagkov–Thorne, §3, Proposition 3.1, Lemmas 3.2–3.7 and Propositions 3.8–3.13, pp.
9–15.

*Needs:* 3.1; **SmoothRepresentationsOfLocalGroups**, SR.1.4, SR.2, SR.3.2 and SR.4.3;
**AutomorphicGaloisRepresentationsPartII**, AG2.5 (the local Langlands normalizations rec and
rec^T).

### 3.4 The level comparison at selected-block Taylor–Wiles level

Prove `WeightZero.selectedBlock_level_comparison`. Let K be good and hyperspecial outside S, V a
coefficient of the form V_λ or V_λ⊗O(χ⁻¹) with the twist supported at places of S, m⊂𝕋^S(K,V)
non-Eisenstein, and (Q,(α_v)) a Taylor–Wiles datum (3.1). Then there are natural isomorphisms in
D(O)

RΓ(X_K,V)_m ≅ RΓ(X_{K₀(Q)},V)_{m_Q} and RΓ(X_{K₀(Q)},V)_{m_Q} ≅
RΓ(Δ_Q,RΓ_{K₀(Q)/K₁(Q)}(X_{K₁(Q)},V))_{m_Q},

compatible with the Hecke operators away from S′ and with reduction modulo ϖ. Dually, with
C_Q=RHom_O(RΓ_{K₀(Q)/K₁(Q)}(X_{K₁(Q)},V)_{m_Q},O)[−d], the derived coinvariants C_Q⊗^L_{O[Δ_Q]}O are
identified with RHom_O(RΓ(X_K,V)_m,O)[−d]; C_Q is a perfect O[Δ_Q]-complex with a representative of
bounded amplitude and bounded rank, the bounds depending only on K and V and not on Q.

*Proof sketch.* The second isomorphism is descent along K₁(Q)⊲K₀(Q)
(ArithmeticLocallySymmetricSpaces §6.1). For the first it suffices to work modulo ϖ and one place
v∈Q at a time. Write M_j for the colimit over principal congruence levels at v of the localized
mod-ϖ cohomology in degree j; Hochschild–Serre spectral sequences for GL_n(O_{F_v}) and 𝔭_v (with
e_α) compute the two sides. Decompose M_j into blocks (Vignéras); a nonunipotent block has no
pro-p-Iwahori invariants, so both sides vanish on it. On the unipotent block every irreducible
subquotient is associated to ρ̄_m(Frob_v), by local–global compatibility at Iwahori level (ACC
Theorem 3.1.1, through AG2.5), so M_j lies in the category 𝒞 of 3.2, and 3.2 gives the isomorphism.
Duality turns derived invariants into derived coinvariants. Perfectness over O[Δ_Q] comes from a
finite equivariant cell structure (ArithmeticLocallySymmetricSpaces §1.6); since O[Δ_Q] is local, a
minimal representative has ranks equal to the dimensions of the cohomology of its reduction modulo
the maximal ideal, which by the first isomorphism is the cohomology of RΓ(X_K,V)_m⊗^L k, so the
bounds do not depend on Q.

**Checks.**

- For Q=∅ both isomorphisms are the identity.
- If d_v=n for every v∈Q then K₀(Q)=K, the first isomorphism is the identity, and the content is the
  descent isomorphism.
- The comparison is with the localization at m_Q, not at the contraction of m alone: without e_α the
  K₀(Q)-cohomology contains the other eigenvalue blocks.

The source is Miagkov–Thorne, Theorem 7.6 and its proof, pp. 26–27.

*Needs:* 3.1; 3.2; **ArithmeticLocallySymmetricSpaces**, §1.6, §6.1 and §6.2;
**AutomorphicGaloisRepresentationsPartII**, AG2.5; **SmoothRepresentationsOfLocalGroups**, SR.3.2.

### 3.5 Galois representations at selected-block Taylor–Wiles level

Prove `WeightZero.selectedBlock_galois_representation`. Let S satisfy certificate 1 of 0.1 and
S=S^c, K be good and hyperspecial outside S, m⊂𝕋^S(K,V) non-Eisenstein with V as in 3.4, and
(Q,(α_v)) a Taylor–Wiles datum. There are an ideal I of 𝕋_Q:=𝕋^{S′}_Q(K₀(Q)/K₁(Q),V)_{m_Q} whose
nilpotence degree depends only on n and [F:ℚ], and a continuous lift ρ_{m,Q}:G_{F,S∪Q}→GL_n(𝕋_Q/I)
of ρ̄_m, such that

1. for every finite v∉S∪Q, the characteristic polynomial of ρ_{m,Q}(Frob_v) is the image of P_v(X);
2. for every v∈Q, ρ_{m,Q}|G_{F_{v^c}} is unramified, and ρ_{m,Q}|G_{F_v} is a lift of type D^1_v: it
   is conjugate, by a matrix congruent to 1, to s_v⊕ψ_v with s_v unramified of rank n−d_v lifting
   the non-α_v part and ψ_v of rank d_v on which inertia acts through the scalar character
   τ↦⟨Art_{F_v}⁻¹τ⟩ with values in Δ_v;
3. the resulting map O[Δ_Q]→𝕋_Q/I (from item 2) is the O[Δ_Q]-algebra structure of 𝕋_Q.

In the setting of 1.1 the same holds with the local conditions at S_p of
CrystallineLocalGlobalCompatibilityCM §7.5 retained, with one nilpotence bound for all Q.

*Proof sketch.* Twist by a character of odd prime order ℓ≠p, ramified away from S′, to make the
characteristic polynomials of ρ̄_m at v and v^c coprime for every v∈Q; the twisted and untwisted
Hecke algebras are identified, so it suffices to treat the twisted case, and reduce to trivial
weight by trivializing V modulo ϖ^m at deeper p-level. Then pass to the quasi-split unitary group G̃
in 2n variables: the Siegel-boundary maps of Miagkov–Thorne §5 (split epimorphism and monomorphism
between the boundary stratum and X_{K_i(Q)}, and the Satake transfer of the parahoric Hecke algebra
of G̃ to that of G) carry the 2n-dimensional Hecke-valued determinant of G̃ at level K̃₁(Q), which
satisfies the inertial relation of 3.3 at v∈Q (Theorems 7.1–7.2, from the characteristic-zero case
by interpolation of determinants), to a 2n-dimensional determinant valued in 𝕋_Q/I₀. It equals the
determinant of ρ_{m,Q}⊕ρ_{m,Q}^⊥, where ρ_{m,Q} comes from the n-dimensional torsion determinant;
since ρ̄_m and ρ̄_m^⊥ are not isomorphic, Burnside's theorem for the pair lets one cancel the trace
relation and obtain the inertia identity for ρ_{m,Q} alone, and the block decomposition is the
unique lift of the coprime residual decomposition (Miagkov–Thorne Lemma 6.1, equivalently the
decomposition of LocalGaloisDeformationRings §2.23).

**Checks.**

- For Q=∅ the statement is the Hecke-valued representation used in 1.1.
- For d_v=n, item 2 says that inertia acts on the whole of ρ_{m,Q}|G_{F_v} through the scalar
  diamond character, with trivial unramified part.
- The O[Δ_Q]-linearity is a statement about the specific map of item 3, not an abstract isomorphism
  of O[Δ_Q]-algebras.

The source is Miagkov–Thorne, §5, Propositions 5.1–5.4, pp. 17–20; §6, Lemma 6.1, p. 21; §7.1,
Theorems 7.1, 7.2, 7.5 and Lemma 7.4, pp. 22–25; and Theorem 7.7 with its proof, pp. 27–28.

*Needs:* 3.1; 3.3; 3.4; **CrystallineLocalGlobalCompatibilityCM**, §6.6–§6.13 (degree shifting and
the unitary Hecke-valued determinants), §5 (the localized Siegel boundary) and §7.5;
**IntegralHeckeAndGaloisDeterminants**, Layers 0, 1, 4 and §5.1;
**AutomorphicGaloisRepresentationsPartII**, AG2.5 and AG2.7; **LocalGaloisDeformationRings**, §2.23;
**ArithmeticLocallySymmetricSpaces**, §3.3.

### 3.6 Adequate Taylor–Wiles primes

Prove `WeightZero.adequate_taylor_wiles_primes`. Let 𝒮 be a global deformation problem with variable
determinant as in GlobalGaloisDeformations §7.1, with T=S framed and p∤2n. Assume F=F⁺F₀ for an
imaginary quadratic field F₀, ζ_p∉F, and ρ̄(G_{F(ζ_p)}) adequate. Let q>h¹_{𝒮^⊥,T}(ad ρ̄(1)) (the
dimension of the dual Selmer group). Then for every N≥1 there is a Taylor–Wiles datum
(Q_N,(α_v)_{v∈Q_N}) of level N with

1. |Q_N|=q and Q_N∩S=∅;
2. for every v∈Q_N, the rational prime below v splits in F₀, and v^c∉Q_N;
3. with g=q−n²[F⁺:ℚ], a surjection R^{T,loc}_𝒮[[X₁,…,X_g]]→R^T_{𝒮_{Q_N}} of complete local
   Λ-algebras, where 𝒮_Q adds the condition D^1_v (LocalGaloisDeformationRings §2.23) at each v∈Q.

R_{𝒮_Q} is an O[Δ_Q]-algebra through the inertial characters of item 2 of 3.5, and
R_{𝒮_Q}⊗_{O[Δ_Q]}O=R_𝒮. The eigenvalue α_v may have any multiplicity; no distinctness of the
eigenvalues of ρ̄(Frob_v) is required.

*Proof sketch.* Follow the enormous-image argument (GlobalGaloisDeformations §8.6–§8.7) with one
selected eigenvalue per prime. For a nonzero class in the dual Selmer group, adequacy (the trace
condition tr(e_{g,α}W)≠0 for every irreducible W⊂ad⁰ρ̄) and Chebotarev in the extension cut out by
ρ̄, ζ_{p^N} and the class give a place v whose Frobenius has an eigenvalue α with nonzero trace
pairing against the class; ζ_p∉F and the vanishing of H¹(ρ̄(G_{F(ζ_p)}),ad⁰) make these conditions
compatible. Each such place lowers the dual Selmer dimension by one while D^1_v contributes one
diamond direction, so after q places the dual Selmer group is zero, and the presentation of
GlobalGaloisDeformations §7.3 with the relative tangent space of D^1_v (relative dimension n² over
O[Δ_v]) gives g=q−n²[F⁺:ℚ].

**Checks.**

- The count of diamond directions is q, not qn as in the enormous tower.
- For q equal to n²[F⁺:ℚ], g=0 and the global ring is a quotient of the local one.
- The hypothesis ζ_p∉F is used; it holds whenever some σ∉G_{F(ζ_p)} has ρ̄(σ) scalar.

The source is Miagkov–Thorne, Definition 6.6 and Proposition 6.7, pp. 21–22, whose proof refers to
ACC, Proposition 6.2.32, and Thorne (2012), Proposition 4.4, arXiv pp. 23–24.

*Needs:* 3.1; **GlobalGaloisDeformations**, §7.1–§7.3 and §8.5–§8.7;
**LocalGaloisDeformationRings**, §2.23; **ArithmeticGaloisRepresentations**, §7.9 and §7.12.

### 3.7 The adequate crystalline finite-level tower

Construct `WeightZero.AdequateCrystallineTower`. Assume prepared data with n≥2, the problems 𝒮_1 and
𝒮_χ for an everywhere-distinct allowed χ (0.4), and ζ_p∉F. Fix an imaginary quadratic F₀⊂F with
F=F⁺F₀ and choose q≥n²f strictly larger than the dual Selmer dimensions of 𝒮_1 and 𝒮_χ (which have
the same special fibre). For each N≥1, 3.6 gives a Taylor–Wiles datum (Q_N,(α_v)) of level N for
both systems at once, with |Q_N|=q, Q_N∩Q_N^c=∅, Q_N∩S=∅ and primes split in F₀. The tower consists
of:

1. compatible presentations R^{S,loc}_1[[z₁,…,z_g]]→R^S_{𝒮_{1,Q_N}} and
   R^{S,loc}_χ[[z₁,…,z_g]]→R^S_{𝒮_{χ,Q_N}}, g=q−n²f, that agree modulo ϖ;
2. the dual localized complexes C_N=RHom_O(RΓ_{K₀/K₁}(X_{K₁(Q_N)},O)_{m_{Q_N}},O)[−d] and C′_N, the
   same with O(χ⁻¹), perfect over O[Δ_{Q_N}], with representatives of uniformly bounded amplitude
   and rank after reduction, derived augmentations C_N⊗^L_{O[Δ_N]}O≅C₀ and C′_N⊗^L_{O[Δ_N]}O≅C′₀,
   and the identification C_N/ϖ≅C′_N/ϖ induced by the identity on residual coefficients (0.3);
3. O[Δ_{Q_N}]-linear surjections R_{𝒮_{1,Q_N}}→T_N/I_N and R_{𝒮_{χ,Q_N}}→T′_N/I′_N onto the Hecke
   images of C_N and C′_N modulo ideals I_N, I′_N whose nilpotence is bounded by one δ for all N,
   with a common residual action after quotienting by the sum of the two error images;
4. at N=0, Q₀=∅, Δ₀=1, and these data are those of 0.4 and 1.1;
5. quotients Δ_∞=ℤ_p^q→Δ_{Q_N} whose kernels lie in p^NΔ_∞.

*Construction.* Apply 3.6 to the two systems simultaneously; their deformation problems have the
same special fibre (0.4), so a choice for one serves both. Use the (n−d_v,d_v) levels of 3.1, the
level comparison 3.4 (dualized) for the augmentations and the bounded perfect models, and 3.5 for
the Galois representations at Taylor–Wiles level with the D^1_v condition; at the places above p
retain the crystalline condition of CrystallineLocalGlobalCompatibilityCM §7.5 as in 1.1. Lift the
presentations through formal smoothness of the power-series source, choosing both lifts compatibly
with the residual identification. The scalar witness of the final theorem gives ζ_p∉F.

Provide the following interface:

- `WeightZero.AdequateCrystallineTower.primes`: for each N, |Q_N|=q, q_v≡1 mod p^N, Q_N∩Q_N^c=∅ and
  Q_N∩S=∅.
- `WeightZero.AdequateCrystallineTower.presentations`: both S-framed global rings at level N are
  quotients of their local bases with g=q−n²f variables, and the two presentations agree modulo ϖ.
- `WeightZero.AdequateCrystallineTower.augment`: C_N⊗^L_{O[Δ_N]}O≅C₀ and C′_N⊗^L_{O[Δ_N]}O≅C′₀,
  compatibly with the Hecke actions and the residual identifications.
- `WeightZero.AdequateCrystallineTower.residual`: the identity on residual coefficients gives one
  residual perfect complex and a common Hecke image modulo both error ideals.
- `WeightZero.AdequateCrystallineTower.uniform`: one δ bounds every I_N and I′_N, and one degree
  interval and rank bound serve all residual perfect representatives.

**Checks.**

- `WeightZero.test_tower_repeated_eigenvalue`: a selected eigenvalue of multiplicity 2 gives one
  diamond coordinate and the (n−2,2) level; demanding n distinct eigenvalues would reject an allowed
  datum.
- `WeightZero.test_tower_base_level`: at N=0, Q₀=∅, Δ₀=1 and the augmentation is the identity of C₀.
- `WeightZero.test_tower_rank`: for n=2, f=5 and dual Selmer dimensions below 20, take q=20: Δ_∞ has
  rank 20 (not 40) and g=0; five equal-degree p-places of F⁺ satisfy certificate 2 of 0.1.
- `WeightZero.test_tower_dual_augmentation`: the coefficient comparison commutes with the derived
  augmentation of the dual complexes; ordinary coinvariants of the undualized complexes do not give
  this.
- `WeightZero.test_tower_depth`: a constant quotient ℤ_p^q→(ℤ/p)^q for every N has q generators but
  fails the shrinking-kernel condition.
- `WeightZero.test_tower_selected_block`: for n=3 and d_v=1 the blocks are (2,1), the selected
  linear factor X−α is the last one, and the diamond acts on the last rank-one block.

The source is BCGNT, proof of Theorem 3.2.5, items (1)–(5), pp. 34–35, and Miagkov–Thorne,
Proposition 6.7, p. 22, Theorems 7.6–7.7, pp. 26–28, and §8, pp. 28–30, which is followed here
without its Fontaine–Laffaille hypothesis p>n².

*Needs:* 0.3; 0.4; 1.1; 3.1; 3.4; 3.5; 3.6; **CrystallineLocalGlobalCompatibilityCM**, §7.5;
**GlobalGaloisDeformations**, §7.3; **IntegralHeckeAndGaloisDeterminants**, §5.1;
**DeformationAndDerivedPatchingAlgebra**, P8 (`finite-level-patching-data`).

### 3.8 Adequate dimension and dual cohomological balance

Prove `WeightZero.AdequateDimensionBalance`. Let n≥2, f=[F⁺:ℚ]≥1, s=|S|≥1 and q≥n²f; put j=n²s−1,
g=q−n²f, d=n²f, ℓ₀=nf−1 and a=n(n−1)f/2. Then

1. S_∞=O[[x₁,…,x_{j+q}]] has dimension 1+j+q=n²s+q;
2. R_∞=R^{S,loc}_1[[z₁,…,z_g]] has dimension 1+n²s+n(n−1)f+g=dim S_∞−ℓ₀, using 2.4 with [F:ℚ]=2f;
3. the localized rational cohomology H^\*(X_K,E)_m is nonzero exactly in the degrees of [a,a+ℓ₀]
   (1.2 and the seed);
4. since 2a+ℓ₀=d−1, its dual shifted by [−d] is nonzero exactly in [a+1,a+1+ℓ₀], so the patched
   two-system datum uses q₀=a+1 and ℓ₀;
5. each special-fibre dimension is one less than the corresponding integral dimension, by
   O-flatness.

The identities 1+(n²s−1)+q=n²s+q and (1+n²s+n(n−1)f+q−n²f)+(nf−1)=n²s+q hold in ℤ without truncated
subtraction (the companion file states them as `WeightZero.adequateDimensionBalance_counts`); a is
an integer because n(n−1) is even.

*Proof sketch.* Count n²s−1 framing variables and q diamond variables in S_∞; use 2.4 for the local
dimension and g for the presentation; 1.2 and ArithmeticLocallySymmetricSpaces §5b.8 for the
interval; duality sends degree i to d−i, and d−(a+ℓ₀)=a+1.

**Checks.**

- For n=2, f=1, s=1, q=4: j=3, g=0, dim S_∞=8, dim R_∞=7, ℓ₀=1, a=1, and the dual interval is [2,3].
- No count qn from the enormous tower is used.
- The shift convention of the dual is that of the supplier's patching datum, not an unshifted
  identification with the original degrees.

The source is BCGNT, proof of Theorem 3.2.5, item (6), pp. 34–35; ACC, Theorem 2.4.10(2), pp. 52–55.

*Needs:* 1.2; 2.4; 3.7; **ArithmeticLocallySymmetricSpaces**, §5b.8;
**CrystallineLocalGlobalCompatibilityCM**, §8.2.

### 3.9 The weight-zero two-system patched objects

Construct `WeightZero.WeightZeroPatchedSystem`. Patch the tower of 3.7 for 𝒮_1 and an
everywhere-distinct 𝒮_χ along one ultrafilter (DeformationAndDerivedPatchingAlgebra P8), with the
same choices for both systems. The output is:

1. S_∞=O[[x₁,…,x_{j+q}]] with augmentation ideal 𝔞_∞;
2. perfect S_∞-complexes C_∞, C′_∞, an isomorphism C_∞⊗^L S_∞/ϖ≅C′_∞⊗^L S_∞/ϖ, and
   C_∞⊗^L_{S_∞}S_∞/𝔞_∞≅RHom_O(RΓ(X_K,O)_m,O)[−d] (similarly for C′_∞ with O(χ⁻¹));
3. finite S_∞-subalgebras T_∞⊆End_{D(S_∞)}(C_∞) and T′_∞⊆End_{D(S_∞)}(C′_∞) with the same image in
   the endomorphisms of the common reduction; the map from T_∞ to the endomorphisms of the
   augmentation factors through T(K,O)_m, using the duality anti-isomorphism on endomorphisms;
4. R_∞=R^{S,loc}_1[[z₁,…,z_g]] and R′_∞=R^{S,loc}_χ[[z₁,…,z_g]] as complete local S_∞-algebras
   through patched scalar lifts, with surjections R_∞→T_∞/I_∞ and R′_∞→T′_∞/I′_∞ onto quotients by
   nilpotent ideals, a quotient R_∞/𝔞_∞→R_{𝒮_1}, and a commutative square R_∞→R_{𝒮_1},
   T_∞/I_∞→T(K,O)_m^{red};
5. an S_∞-compatible isomorphism R_∞/ϖ≅R′_∞/ϖ under which the two actions agree on the common
   residual cohomology modulo I_∞+I′_∞;
6. with q₀=a+1 and ℓ₀=nf−1 (3.8), these objects satisfy every hypothesis of the two-system datum of
   CrystallineLocalGlobalCompatibilityCM §8.2, including the dimension conditions and the special
   generic points supplied by 2.8 with the same g variables.

These are instances of the supplier objects, not new definitions of perfect complexes or patching.

Provide the following interface:

- `WeightZero.WeightZeroPatchedSystem.augment`: both derived augmentation fibres are the stated dual
  base complexes with shift [−d].
- `WeightZero.WeightZeroPatchedSystem.residual`: the two residual perfect complexes, residual rings
  and Hecke images are identified compatibly modulo I_∞+I′_∞.
- `WeightZero.WeightZeroPatchedSystem.heckeSquare`: the square from the patched deformation-to-Hecke
  quotient to R_{𝒮_1}→T(K,O)_m^{red} commutes.
- `WeightZero.WeightZeroPatchedSystem.dimensions`: dim R_∞=dim R′_∞=dim S_∞−ℓ₀, and each flat
  special fibre has dimension one less.
- `WeightZero.WeightZeroPatchedSystem.toTwoSystemDatum`: the patched objects with 2.8 give an
  instance of the supplier's two-system datum with q₀=a+1.

**Checks.**

- `WeightZero.test_patched_shift`: for n=2, f=1, d=4 and original degrees [1,2], the dual fibre has
  degrees [2,3].
- `WeightZero.test_patched_residual_square`: the two actions on the common residual complex agree
  only after both error images are killed; killing one is not the specified square.
- `WeightZero.test_patched_empty_R`: if R=∅ the two coefficient systems and their identifications
  can be taken identical, with the same patching apparatus.
- `WeightZero.test_patched_codimension`: replacing g=q−n²f by qn−n²f breaks dim R_∞=dim S_∞−ℓ₀ for
  n≥2 and q>0.

The square ends in the reduced Hecke algebra; no integral R=T is asserted, and the nilpotent
quotients are kept until spectra are compared.

The source is BCGNT, proof of Theorem 3.2.5, items (1)–(6), pp. 34–35; Miagkov–Thorne, §8, pp.
28–30; Caraiani–Newton, §5.4, pp. 77–79.

*Needs:* 2.8; 3.7; 3.8; **DeformationAndDerivedPatchingAlgebra**, P8 (`compatible-patch-choices`,
`ultrapatching-of-perfect-complexes`, `patched-error-nilpotent`, `patched-hecke-injective`,
`patched-deformation-surjective`, `patched-scalar-lift`, `derived-augmentation`,
`residual-complex-comparison`); **CrystallineLocalGlobalCompatibilityCM**, §8.2.

### 3.10 Prepared weight-zero support propagation

Prove `WeightZero.PreparedWeightZeroSupport`. Assume prepared data with n≥2 and ζ_p∉F. Let
f₁,f₂:R_{𝒮_1}→O be continuous O-algebra maps with lifts ρ₁,ρ₂:G_{F,S}→GL_n(O). If ker f₁ lies in the
support of H^\*(X_K,O)_m over R_{𝒮_1} (1.1) and ρ₁|G_{F_v} connects to ρ₂|G_{F_v} for every v∈S_p
(equivalently, by 2.3 and 2.7, the two points have the same crystalline component labels), then ker
f₂ lies in the same support. The global lift may change; its p-component labels may not.

*Proof sketch.*

1. Build the tower of 3.7 (this is where ζ_p∉F is used) and patch it (3.9).
2. Lift f₁ and f₂ through R_∞/𝔞_∞→R_{𝒮_1} to characteristic-zero points of Spec R_∞. By the first
   part of CrystallineLocalGlobalCompatibilityCM §8.3 there is a component C_a of Spec R_∞ through
   the first point contained in Spec T_∞; let C be a component through the second.
3. C and C_a have the same p-label (2.7), so by 2.8 their special generic points generalize to the
   same component of Spec R′_∞; the second part of §8.3 gives C⊆Spec T_∞.
4. Apply §8.5 at the augmentation point and undo the duality to obtain support on the base
   cohomology; the nilpotent spectral identifications agree with those of 1.1.

**Checks.**

- Every hypothesis of the supplier's two-system theorem is verified, including the existence of
  special generic points and the dual degree range.
- Near faithfulness over every crystalline component is not claimed.
- Coefficient enlargement and choice of frames do not affect the conclusion.
- The hypothesis ζ_p∉F is explicit; it follows from the existence of σ∈G_F∖G_{F(ζ_p)} with ρ̄(σ)
  scalar.

The source is BCGNT, Theorem 3.2.5 and its proof, pp. 34–35, with the cyclotomic hypothesis made
explicit (see *Corrections to the sources*); Caraiani–Newton, Proposition 5.4.2 and Corollary 5.4.3,
pp. 77–79.

*Needs:* 1.1; 2.3; 2.7; 2.8; 3.7; 3.9; **CrystallineLocalGlobalCompatibilityCM**, §8.3 and §8.5.

### Examples

For n=2 and F imaginary quadratic (f=1) with s=|S|=3: d=4, a=1, ℓ₀=1, j=11, and with q=4 one has
g=0, dim S_∞=1+11+4=16 and dim R_∞=15. At a Taylor–Wiles place where ρ̄(Frob_v) has eigenvalues α≠β,
choosing α gives the Iwahori level with diamond on the second diagonal entry; if instead ρ̄(Frob_v)
is scalar α, d_v=2 and the level is GL₂(O_v) with diamond through the determinant.

### Dependencies

**ArithmeticGaloisRepresentations**, §7.9, §7.12; **ArithmeticLocallySymmetricSpaces**, §0.10, §1.6,
§3.3, §3.11, §5b.8, §6.1, §6.2; **AutomorphicGaloisRepresentationsPartII**, AG2.5, AG2.7;
**CrystallineLocalGlobalCompatibilityCM**, §5, §6.6–§6.13, §7.5, §8.2, §8.3, §8.5;
**DeformationAndDerivedPatchingAlgebra**, P8; **GlobalGaloisDeformations**, §7.1–§7.3, §8.5–§8.7;
**IntegralHeckeAndGaloisDeterminants**, Layers 0, 1, 4, §5.1; **LocalGaloisDeformationRings**,
§2.23; **PotentialAutomorphyInfrastructure**, §5.3; **SmoothRepresentationsOfLocalGroups**, SR.0,
SR.0d, SR.1.4, SR.1.5, SR.2, SR.3.2, SR.4.3.

## Layer WZ.4: Soluble preparation and the global weight-zero theorem

Reduce the global theorem to the prepared support theorem by a soluble CM extension in which every
place above p splits completely, so that no p-adic completion changes and ramified p stays allowed.
Realize the lift automorphically over the extension, descend, and treat n=1 separately by class
field theory.

**Global hypotheses.** F is an imaginary CM or totally real field, n≥1 and p>n is prime;
ρ:G_F→GL_n(ℚ̄_p) is continuous, unramified almost everywhere, and crystalline at every v|p with
labelled Hodge–Tate weights {0,1,…,n−1} for every embedding; ρ̄ is absolutely irreducible and
decomposed generic, ρ̄(G_{F(ζ_p)}) is adequate, and some σ∈G_F∖G_{F(ζ_p)} has ρ̄(σ) scalar;
ι:ℚ̄_p≅ℂ, and π is a cuspidal automorphic representation of GL_n(𝔸_F), regular algebraic of weight
zero, with r̄_ι(π)≅ρ̄, such that for every v|p, π_v is unramified and r_ι(π)|G_{F_v} connects to
ρ|G_{F_v}.

### 4.1 Soluble preparation with p split completely

Construct `WeightZero.SolvableWeightZeroPreparation`. Assume the global hypotheses with n≥2. There
are a finite soluble Galois extension E/F with E imaginary CM (first composing with an imaginary
quadratic field in which p and the test places split, if F is totally real), the cuspidal base
change π_E of the seed, and prepared data over E (0.1) for π_E, such that:

1. every place of F above p splits completely in E, so E_w=F_v for every w|v|p and the absolute
   ramification of p is unchanged;
2. the residual image and the cyclotomic residual image are unchanged: ρ̄(G_E)=ρ̄(G_F),
   ρ̄(G_{E(ζ_p)})=ρ̄(G_{F(ζ_p)}); in particular adequacy and the scalar witness survive, and ρ̄|G_E
   is decomposed generic;
3. ρ|G_E is unramified outside S_E, unipotently ramified with trivial residual representation at the
   places of R_E, and q_w≡1 mod p for w∈R_E;
4. the eight certificates of 0.1 hold over E; certificate 2 holds because E⁺ contains a cyclic
   totally real extension of degree t>4 of F⁺ in which every place above p splits, so every local
   degree at p occurs at least t times and removing two places leaves at least
   (1−2/t)[E⁺:ℚ]>½[E⁺:ℚ];
5. the seed π_E gives an O-point of R_{𝒮_1} in the support of H^\*(X_K,O)_m (1.2), and ρ|G_E gives
   an O-point of R_{𝒮_1} whose p-adic restrictions connect to those of r_ι(π_E), these being the
   original p-adic restrictions.

*Construction.*

1. Choose finite sets V₀,V₁,V₂ of test places detecting the residual and cyclotomic residual images
   and a decomposed-generic prime, as in PotentialAutomorphyInfrastructure §2.4, and keep them split
   throughout; the image equalities of that target hold for any residual image.
2. Use PotentialAutomorphyInfrastructure §2.5 to construct a soluble extension, disjoint from the
   residual and cyclotomic fields, with trivial completions at every place above p and at the test
   places, and with prescribed soluble local extensions at the bad places away from p making ρ
   unipotently ramified with trivial residual representation, q_w≡1 mod p and the seed Iwahori
   spherical; then the cyclic totally real extension of degree t>4 split at p and at the test
   places.
3. Adjoin three imaginary quadratic fields, chosen by congruences as in
   PotentialAutomorphyInfrastructure §2.6–§2.7 but split at p and at every rational prime below
   V₀∪V₁∪V₂, so that every rational prime below a bad place or ramified in E splits in an imaginary
   quadratic subfield. Add two auxiliary places of different residue characteristics with scalar
   residual Frobenius and H²=0 (PotentialAutomorphyInfrastructure §5.13).
4. Base change the seed (PotentialAutomorphyInfrastructure §2.3), using irreducibility of the
   restriction, and verify the eight certificates. Connectedness at p is unchanged because the
   completions are unchanged.

Provide the following interface:

- `WeightZero.SolvableWeightZeroPreparation.pSplit`: every v|p of F splits completely in E, and
  restriction identifies the local representations of ρ and of the seed at E_w with those at F_v.
- `WeightZero.SolvableWeightZeroPreparation.prepared`: the extension, its level, R and the two
  auxiliary places give `PreparedWeightZeroData` over E and both O-points of R_{𝒮_1}.
- `WeightZero.SolvableWeightZeroPreparation.images`: the residual and cyclotomic residual images
  agree with the original ones; the split test places preserve decomposed genericity and the scalar
  witness.
- `WeightZero.SolvableWeightZeroPreparation.degree`: with t>4 split copies of every place above p,
  removing two places leaves strictly more than half of [E⁺:ℚ].
- `WeightZero.SolvableWeightZeroPreparation.seed`: the base-changed seed gives a supported point,
  and connectedness at p gives the same component labels as ρ|G_E.

**Checks.**

- `WeightZero.test_preparation_ramified_p`: if F_v/ℚ_p is ramified, E_w=F_v stays ramified and the
  prepared data still exist.
- `WeightZero.test_preparation_four_copies`: with t=4 equal copies, removing two leaves exactly half
  and certificate 2 fails; t=5 passes.
- `WeightZero.test_preparation_real_input`: a totally real F first acquires a CM quadratic extension
  in which p splits, and the p-completions survive by complete splitting.
- `WeightZero.test_preparation_image_loss`: an extension contained in the residual field can shrink
  the residual image; the disjointness and test-place conditions exclude it.

The extension is soluble and ρ|G_E stays absolutely irreducible, as cuspidal base change and descent
require. The preparation preserves equality of residual images, not merely the presence of an
adequate subgroup, and never requires p to be unramified.

The source is BCGNT, proof of Theorem 3.2.1, p. 35, which refers to ACC, §6.5.12, pp. 175–179; here
the absolutely-unramified preparation at p of ACC is replaced by complete splitting at p.

*Needs:* 0.1; 1.2; **PotentialAutomorphyInfrastructure**, §2.1–§2.5, §2.6, §2.7 and §5.13;
**AutomorphicGaloisRepresentationsPartII**, AG2.7.

### 4.2 Automorphic realization over the prepared field

Prove `WeightZero.PreparedWeightZeroRealization`. In the situation produced by 4.1, there is a
cuspidal automorphic representation Π_E of GL_n(𝔸_E), regular algebraic of weight zero, with
r_ι(Π_E)≅ρ|G_E and (Π_E^∞)^K≠0. Π_{E,w} is unramified at every place above p and every place outside
S_E. At the auxiliary places of A no unramifiedness follows from pro-v-Iwahori-fixed vectors; any
ramification there is controlled at the descent step, through the unramified Galois parameter.

*Proof sketch.* The seed point is in the support and the lift has the same crystalline component
labels, so 3.10 (with ζ_p∉E from the scalar witness) puts the lift in the support. Read off a
characteristic-zero eigensystem, apply 1.2 to obtain Π_E and identify r_ι(Π_E) with ρ|G_E by
Frobenius comparison. Unramifiedness at p and outside S_E comes from the hyperspecial factors of the
level.

**Checks.**

- Pro-v-Iwahori-fixed vectors at A do not by themselves give hyperspecial fixed vectors.
- Cuspidality comes from absolute residual irreducibility through 1.2.

The source is BCGNT, proof of Theorem 3.2.1, p. 35, and §3.1.2, pp. 30–31.

*Needs:* 1.2; 3.10; 4.1; **AutomorphicGaloisRepresentationsPartII**, AG2.5.

### 4.3 Rank-one character realization

Prove `WeightZero.RankOneCharacterRealization`. Let F be a number field and ψ:G_F→ℚ̄_p^× a
continuous character, unramified almost everywhere and de Rham at every place above p. Then ψ=r_ι(χ)
for an algebraic Hecke character χ of 𝔸_F^×/F^×, with infinity type read from the labelled
Hodge–Tate weights of ψ through convention 3. If ψ is crystalline with all labelled weights zero at
every v|p, then χ has trivial infinity type and χ_v is unramified for every v|p; at every finite
place where ψ is unramified, χ is unramified. If instead ψ is crystalline (or potentially
semistable) ordinary of weight λ (on an open subgroup of inertia, ψ∘Art_{F_v} is x↦∏_τ τ(x)^{−λ_τ}),
χ has infinity type determined by λ and, as an automorphic representation of GL₁, is ι-ordinary in
the sense of PotentialAutomorphyInfrastructure §3.44. Cuspidality is automatic for GL₁. This treats
n=1 without the neatness, cuspidal recognition or patching of the earlier layers.

*Proof sketch.* At each v|p, ψ|G_{F_v} is locally algebraic (PadicHodgeTheory R06.2), so ψ∘Art_F is
the p-adic avatar of an algebraic Hecke character; global reciprocity (ClassFieldTheory Layer 11,
composed with inversion) and the GL₁ dictionary (AG2.0, GlobalNumberFields Layers 9–10) produce χ. A
crystalline character of weight zero has algebraic part trivial on O_{F_v}^×, so it is unramified
(R06.2); conductors at the other places are compared by local reciprocity (ClassFieldTheory Layer
7).

**Checks.**

- For the cyclotomic character ε_p, the Hecke character is the norm character, with labelled weight
  −1 at every embedding, which is excluded from weight zero.
- A finite-order unramified-at-p character gives a finite-order Hecke character with trivial
  infinity type.
- For p=2 a scalar residual value outside G_{F(ζ_p)} cannot exist, since ζ₂∈F; the rank-one
  statement does not use such a value.

The source is BCGNT, Theorem 3.2.1, the case n=1, pp. 31–32; the rank-one comparison is a standard
consequence of class field theory and the classification of locally algebraic characters.

*Needs:* **ClassFieldTheory**, Layers 7 and 11; **GlobalNumberFields**, Layers 9–10;
**AutomorphicGaloisRepresentationsPartII**, AG2.0; **PadicHodgeTheory**, R06.2
(`locally-algebraic-coefficient-characters`, `rank-one-de-rham-crystalline-classification`);
**PotentialAutomorphyInfrastructure**, §3.44.

### 4.4 The global weight-zero crystalline automorphy lifting theorem

Prove `WeightZero.WeightZeroCrystallineAutomorphyLifting`. Assume the global hypotheses: F is an
imaginary CM or totally real field, n≥1 and p>n a prime; ρ:G_F→GL_n(ℚ̄_p) is continuous, unramified
almost everywhere, and crystalline at every v|p with labelled Hodge–Tate weights {0,1,…,n−1} for
every embedding; ρ̄ is absolutely irreducible and decomposed generic, ρ̄(G_{F(ζ_p)}) is adequate,
and some σ∈G_F∖G_{F(ζ_p)} has ρ̄(σ) scalar; ι:ℚ̄_p≅ℂ and π is a cuspidal automorphic representation
of GL_n(𝔸_F), regular algebraic of weight zero, with r̄_ι(π)≅ρ̄, such that for every v|p, π_v is
unramified and r_ι(π)|G_{F_v} connects to ρ|G_{F_v}. Then there is a cuspidal automorphic
representation Π of GL_n(𝔸_F), regular algebraic of weight zero, with r_ι(Π)≅ρ. Moreover Π_v is
unramified for every v|p and for every finite v at which both ρ and π are unramified.

No condition on the ramification of p in F, no polarization and no enormous-image hypothesis is
imposed.

*Proof sketch.*

1. For n=1 apply 4.3.
2. For n≥2 apply 4.1 and 4.2 to obtain Π_E over the soluble extension E.
3. Descend Π_E to F by soluble descent (PotentialAutomorphyInfrastructure §2.3), using
   irreducibility of ρ|G_E, and identify the descended Galois representation with ρ. At v|p complete
   splitting identifies the local factors, so Π_v is unramified.
4. At a finite v∤p where ρ and π are unramified, the local base change identity at every place
   (§2.3) and Varma's comparison (AG2.5, in the form of PotentialAutomorphyInfrastructure §2.19)
   show that the local parameter of Π_v is unramified, hence Π_v is unramified.

**Checks.**

- A totally real input is handled by an explicit first CM extension.
- Unramifiedness at p comes from hyperspecial level and complete splitting, not from a
  Fontaine–Laffaille argument.
- The conclusion is stated in weight zero; no other weight is carried.

The source is BCGNT, Theorem 3.2.1, pp. 31–32, with its proof on p. 35; ACC, §6.5.12, pp. 175–179.

*Needs:* 4.1; 4.2; 4.3; **PotentialAutomorphyInfrastructure**, §2.3 and §2.19;
**AutomorphicGaloisRepresentationsPartII**, AG2.5; **PotentialAutomorphyInfrastructurePartII**,
PL.1.

### Examples

For n=2, F=ℚ(√−d) with p ramified in F, and ρ the dual of the rational p-adic Tate module of an
elliptic curve over F with good reduction at the place above p (crystalline with labelled weights
{0,1}; the Tate module itself has weights {0,−1} in convention 3), the theorem applies as soon as ρ̄
is absolutely irreducible, decomposed generic, of adequate image over F(ζ_p) with a scalar value
outside G_{F(ζ_p)}, and a weight-zero seed π with the same residual representation and connected
p-adic restriction is given. The preparation keeps the ramified completion at p.

### Dependencies

**AutomorphicGaloisRepresentationsPartII**, AG2.0, AG2.5, AG2.7; **ClassFieldTheory**, Layers 7, 11;
**GlobalNumberFields**, Layers 9–10; **PadicHodgeTheory**, R06.2;
**PotentialAutomorphyInfrastructure**, §2.1–§2.7, §2.19, §3.44, §5.13;
**PotentialAutomorphyInfrastructurePartII**, PL.1.

## Layer WZ.5: The adequate ordinary companion

Prove the ordinary automorphy lifting theorem with adequate image, by replacing the enormous-image
Taylor–Wiles primes in the ordinary argument of ACC §6.6 with the adequate selected-block method of
3.1–3.6. The ordinary local theory, the ordinary characters and the completed-homology towers are
those of their owners; only the Taylor–Wiles input changes.

### 5.1 Adequate ordinary patching verification

Prove `WeightZero.AdequateOrdinaryPatchingVerification`. Work in the prepared ordinary setting of
ACC §6.6.1, with "enormous" replaced by "adequate" and with ζ_p∉F: n≥2, p>n, an imaginary CM field
in which every bad or ramified rational prime splits in an imaginary quadratic subfield, a
residually absolutely irreducible decomposed generic seed of weight μ with ordinary Iw_v(1,1)-fixed
vectors at v|p, a set R with trivial residual local representation and q_v≡1 mod p, two auxiliary
places with H²=0, and at every v|p trivial residual representation with [F_v:ℚ_p]>n(n+1)/2+1. The
lift ρ has the same reduction, is unramified outside S, unipotently ramified at R, and at v|p its
ordered diagonal characters ψ_{v,i} agree on all of I_{F_v} with σ↦∏_τ
τ(Art_{F_v}⁻¹σ)^{−(λ_{τ,n−i+1}+i−1)}; moreover ∏_τ τ(x)^{λ_{τ,n+1−i}−μ_{ιτ,n+1−i}}=1 for every
p-power root of unity x∈O_{F_v} and every i. Work over the branch of the weight algebra Λ given by a
minimal prime, with Λ-linear normalized dual completed homology and its weight specialization. Then
the λ-point of ρ lies in the support of the patched ordinary complex, and ρ is ordinarily
automorphic of weight ιλ over F. At the λ-point the distinct inertia characters place ρ on a
maximal-dimensional ordinary component; it is not asserted that every ordinary component is smooth
or in the support.

*Proof sketch.*

1. Use the ordinary preparation and the image-preserving test places
   (PotentialAutomorphyInfrastructure §2.4, §2.7); the scalar witness gives ζ_p∉F.
2. Use 3.6 for the primes, 3.1 and 3.4 for the selected-block levels and their augmentation, and 3.5
   for the Galois representations at Taylor–Wiles level, now with the ordinary local condition at p
   from PotentialAutomorphyInfrastructure §3.43 instead of the crystalline one; the presentation has
   g=q−n²f variables and q diamond directions.
3. Use the ordinary Λ-linear maps, normalized dual completed homology and weight specialization
   (PotentialAutomorphyInfrastructure §4.6–§4.7, §5.14–§5.16; ACC Propositions 6.6.7–6.6.9 and
   Corollary 6.6.6), patch over Λ (DeformationAndDerivedPatchingAlgebra P8), and apply the
   codimension–amplitude argument (P9) at the λ-point, which lies on a maximal-dimensional ordinary
   component (LocalGaloisDeformationRings §6.1, §6.24, §7.6; ACC Lemma 6.2.26).

**Checks.**

- The numerical hypothesis is p>n, not p>n².
- The seed weight μ need not equal λ.
- The presentation uses g=q−n²f; the qn count of the enormous tower is not used.

The source is Miagkov–Thorne, Theorem 1.3, pp. 2–3, Proposition 6.7, p. 22, and §8, pp. 28–30; ACC,
§6.6.1–§6.6.10, pp. 179–189.

*Needs:* 3.1; 3.4; 3.5; 3.6; **PotentialAutomorphyInfrastructure**, §2.4, §2.7, §3.6, §3.43, §4.6,
§4.7, §5.13–§5.16; **LocalGaloisDeformationRings**, §1.3, §1.7, §1.9, §6.1, §6.24, §7.6;
**DeformationAndDerivedPatchingAlgebra**, P8 and P9; **ArithmeticGaloisRepresentations**, §7.9.

### 5.2 Adequate ordinary automorphy lifting

Prove `WeightZero.AdequateOrdinaryAutomorphyLifting`. Let F be imaginary CM or totally real, n≥1,
p>n, and ρ:G_F→GL_n(ℚ̄_p) continuous and unramified almost everywhere. Assume that for every v|p,
ρ|G_{F_v} is potentially semistable and ordinary with regular Hodge–Tate weights: there is a
dominant λ∈(ℤ^n_+)^{Hom(F,ℚ̄_p)} such that ρ|G_{F_v} is conjugate to an upper triangular
representation with diagonal characters ψ_{v,1},…,ψ_{v,n}, where ψ_{v,i} agrees on an open subgroup
of I_{F_v} with σ↦∏_{τ:F_v→ℚ̄_p}τ(Art_{F_v}⁻¹σ)^{−(λ_{τ,n−i+1}+i−1)}. Assume ρ̄ is absolutely
irreducible and decomposed generic, ρ̄(G_{F(ζ_p)}) is adequate, and some σ∈G_F∖G_{F(ζ_p)} has ρ̄(σ)
scalar. Suppose there are ι:ℚ̄_p≅ℂ and a cuspidal ι-ordinary automorphic representation π of
GL_n(𝔸_F) with r̄_ι(π)≅ρ̄. Then there is a cuspidal ι-ordinary automorphic representation Π of
GL_n(𝔸_F) of weight ιλ with r_ι(Π)≅ρ; for every finite v∤p at which both ρ and π are unramified, Π_v
is unramified. The weight of π may differ from λ, and nothing is asserted about ramification at p.

*Proof sketch.*

1. For n=1 use 4.3.
2. For n≥2 apply the ordinary soluble preparation (PotentialAutomorphyInfrastructure §2.7, with
   image-preserving test places) and 5.1 over the prepared field.
3. Descend by ordinary soluble base change and descent (§2.3 and §3.47), identify the descended
   representation with ρ and read its weight from the inertial characters.
4. Treat the common unramified places away from p as in 4.4, step 4.

**Checks.**

- Every hypothesis of Miagkov–Thorne, Theorem 1.3 appears, including potential semistability and the
  open-inertia character formula.
- The adequate image and the scalar witness are retained in the hypotheses.
- The unramified conclusion is only for v∤p.

The source is Miagkov–Thorne, Theorem 1.3, pp. 2–3, and §8, pp. 28–30; ACC, §6.6.1–§6.6.10, pp.
179–189; it is the input of BCGNT, proof of Theorem 6.2.4, p. 60, which keeps the common unramified
places.

*Needs:* 4.3; 5.1; **PotentialAutomorphyInfrastructure**, §2.3, §2.7, §2.19, §3.44 and §3.47;
**AutomorphicGaloisRepresentationsPartII**, AG2.5.

### Examples

For n=2 and an elliptic curve over an imaginary quadratic F with ordinary reduction at the places
above p, λ=(0,0) at every embedding gives diagonal inertia exponents 0 and −1 in the formula above,
that is Hodge–Tate weights 0 and 1, and the seed may be any ι-ordinary π with the same residual
representation, of any weight.

### Dependencies

**ArithmeticGaloisRepresentations**, §7.9; **AutomorphicGaloisRepresentationsPartII**, AG2.5;
**DeformationAndDerivedPatchingAlgebra**, P8, P9; **LocalGaloisDeformationRings**, §1.3, §1.7, §1.9,
§6.1, §6.24, §7.6; **PotentialAutomorphyInfrastructure**, §2.3, §2.4, §2.7, §2.19, §3.6, §3.43,
§3.44, §3.47, §4.6, §4.7, §5.13–§5.16.

## Corrections to the sources

The statements above already incorporate the following corrections; each is described in our own
words.

1. BCGNT, §3.2, preparation condition (2), p. 32: the right-hand side of the complementary local
   degree inequality is printed with the degree of the global field F⁺ over ℚ_p. The intended bound
   is half of [F⁺:ℚ], the sum of the local degrees, as in ACC §6.5.12, p. 178, and Miagkov–Thorne
   §8, condition (9), p. 28. Certificate 2 of 0.1 uses [F⁺:ℚ].
2. BCGNT, §3.1.2, p. 31: the displayed spherical polynomial ends with a term of positive sign for
   every n. The constant coefficient is (−1)^n q_v^{n(n−1)/2}T_{v,n}, as in the general term of the
   same display; for n=1 the polynomial is X−T_{v,1}. Convention 4 uses the corrected sign.
3. ACC, proofs of Theorems 6.5.4 and 6.6.2, arXiv pp. 174–175 and 185–186: a subsequent recollection
   of the number of presentation variables subtracts n[F⁺:ℚ] instead of n²[F⁺:ℚ]. The enormous count
   is qn−n²[F⁺:ℚ]; the adequate count used here is q−n²[F⁺:ℚ] (3.6, 3.7), and only this count makes
   dim R_∞=dim S_∞−ℓ₀ hold (3.8).
4. ACC, §6.5.12, proof of Proposition 6.5.13, arXiv pp. 175–176: the argument compares local
   components at almost all places, while the statement concerns every finite place. The local
   identity at every finite place comes from local base change and its compatibility with the local
   Langlands correspondence, which the soluble base change target of
   PotentialAutomorphyInfrastructure §2.3 includes; 4.4 uses that form.
5. ACC, §6.5.12, the choice of three imaginary quadratic fields, arXiv p. 178: the congruences
   listed for the bad primes do not also force the test places to split. 4.1 adds congruences at
   every rational prime below the test places, and here also asks all three fields to be split at p.
6. BCGNT, Theorem 3.2.5, pp. 34–35: the prepared support theorem is stated under the eight
   preparation conditions, which do not include ζ_p∉F, while its proof uses the adequate
   Taylor–Wiles primes of Miagkov–Thorne Proposition 6.7, which require ζ_p∉F. Target 3.10 carries
   the hypothesis ζ_p∉F explicitly. The global theorem 4.4 loses nothing: its scalar witness forces
   ζ_p∉F, and the preparation of 4.1 keeps it.
7. Miagkov–Thorne, block order: the local theory of §§2–3 (pp. 4–11) puts the selected eigenvalue in
   the last block, which carries the diamond character, and the proof of Theorem 7.5 (pp. 24–25)
   uses the second block as the selected one; but the partitions displayed in §5 (p. 18) and §7.2
   (p. 26) list the selected multiplicity d_v first. For d_v≠n−d_v the two orders do not describe
   the same level. Convention 8 fixes the order (n−d_v,d_v) with the selected block last, and
   3.1–3.6 transport the polynomial factor, the projector e_α, the level, the diamond action, the
   boundary Satake map and the local condition D^1_v together in that order.

## Downstream consumers

The ordinary theorem 5.2 is the adequate-image input of the symmetric-power potential automorphy
argument for Bianchi modular forms (BCGNT §6, the Dwork family, proof of Theorem 6.2.4, p. 60). The
weight-zero theorem 4.4 is the lifting step in the same paper's proof of the Ramanujan and Sato–Tate
conjectures for Bianchi modular forms.

## References

- **BCGNT** — G. Boxer, F. Calegari, T. Gee, J. Newton and J. A. Thorne, *The Ramanujan and
  Sato–Tate conjectures for Bianchi modular forms*, Forum of Mathematics, Pi 13 (2025), e10,
  doi:10.1017/fmp.2024.29. [Author copy](https://www.math.uchicago.edu/~fcale/papers/SatoTate.pdf);
  also arXiv:2309.15880. Used: §2.5 (Theorem 2.5.5, p. 29), §3.1–§3.2 (pp. 30–35), §6.2 (p. 60).
- **MT** — K. Miagkov and J. A. Thorne, *Automorphy lifting with adequate image*, Forum of
  Mathematics, Sigma 11 (2023), e8, doi:10.1017/fms.2023.3. [Published
  PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A36C754C24E9258E1E062C62378BF1E/S2050509423000038a.pdf/automorphy-lifting-with-adequate-image.pdf).
  Used: Theorems 1.2–1.3, §§2–3, §5, §6, §7, §8 (pp. 1–30).
- **CN** — A. Caraiani and J. Newton, *On the modularity of elliptic curves over imaginary quadratic
  fields*, [arXiv:2301.10509v3](https://arxiv.org/pdf/2301.10509v3). Used: Theorems 4.2.15 and 4.3.1
  (pp. 71–73), Lemmas 5.3.3–5.3.4 (pp. 76–77), Proposition 5.4.2 and Corollary 5.4.3 (pp. 77–79).
- **ACC** — P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P.
  Scholze, R. Taylor and J. A. Thorne, *Potential automorphy over CM fields*, Annals of Mathematics
  197 (2023); [arXiv:1812.09999v2](https://arxiv.org/pdf/1812.09999v2), whose pagination is used.
  Used: Theorem 2.4.10 (pp. 52–55), Lemmas 6.2.25–6.2.26 (pp. 146–148), Proposition 6.5.3 (pp.
  167–168), §6.5.12 (pp. 175–179), §6.6 (pp. 179–189).
- **BLGGT** — T. Barnet-Lamb, T. Gee, D. Geraghty and R. Taylor, *Potential automorphy and change of
  weight*, Annals of Mathematics 179 (2014); [arXiv:1010.2561v4](https://arxiv.org/pdf/1010.2561v4),
  §1.4, pp. 25–26.
- **BLGHT** — T. Barnet-Lamb, D. Geraghty, M. Harris and R. Taylor, *A family of Calabi–Yau
  varieties and potential automorphy II*, Publ. RIMS Kyoto Univ. 47 (2011), 29–98,
  [doi:10.2977/PRIMS/31](https://ems.press/journals/prims/articles/4468). Lemma 3.3, pp. 48–49.
- **Thorne (2012)** — J. A. Thorne, *On the automorphy of l-adic Galois representations with small
  residual image*, J. Inst. Math. Jussieu 11 (2012), 855–920;
  [arXiv:1107.5989v1](https://arxiv.org/pdf/1107.5989), Proposition 4.4 and Lemma 5.10.
- **Clozel–Harris–Taylor** — L. Clozel, M. Harris and R. Taylor, *Automorphy for some l-adic lifts
  of automorphic mod l Galois representations*, Publ. Math. IHÉS 108 (2008), [published
  paper](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf); Appendix B, Theorem B.1.
- **Stacks** — The Stacks Project, [Tag 00PD](https://stacks.math.columbia.edu/tag/00PD)
  (characterizations of discrete valuation rings).
