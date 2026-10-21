# Arithmetic Iwasawa theory and the main conjecture, Part II: the Gross–Stark conjecture

This roadmap extends **IntegralIwasawaTheory** from its cyclotomic and interpolation infrastructure to the Gross–Stark leading-term theorem. For a totally odd finite-order character χ of a totally real field F and every rational prime p, including 2, the target is

$$\frac{L_p^{(r)}(\chi\omega,0)}{r!}=L(\chi,0)\prod_{\mathfrak q\in R'}(1-\chi(\mathfrak q))\,R_p(\chi),\qquad R=\{\mathfrak q\mid p:\chi(\mathfrak q)=1\},\quad r=|R|.$$

The derivative is the rank-r coefficient, which can vanish. The general assertion that its order is exactly r is equivalent to regulator nonvanishing and remains conjectural. Rank zero follows from interpolation; rank one also has nonvanishing through Baker–Brumer. The proof here follows the weight-one Hilbert-family and determinant method of Dasgupta–Kakde–Ventullo, with an all-prime analytic order bound from Charollois–Dasgupta/Spiess.

## Scope and ownership

The parent supplies the arithmetic cyclotomic character and coefficient-ring conventions. Deligne–Ribet functions and generic Hilbert forms come from **AutomorphicPadicLFunctions**, ordinary projectors and control from **PadicFamilies**, and actual family representations from **OrdinaryAutomorphicFormsAndModularityLifting**. **IntegralHeckeAndGaloisDeterminants** owns the generic henselian GMA and extension-module construction. This roadmap owns their Gross–Stark specialization, the signed regulator and cohomological comparison, Ventullo’s particular auxiliary family, the three specific Hecke quotients, the local module estimates and the final determinants.

The parent’s odd-prime main-conjecture route is not used to prove the dyadic order bound. The current upstream GMA and ProfiniteArithmetic developments are reused. No new generic continuous-cohomology, profinite, class-field, logarithm, Eisenstein-measure or ordinary-Hilbert carrier is specified here. The characteristic-polynomial extension of Gross’s regulator conjecture is contextual; its higher coefficients are outside this endpoint.

## Conventions

- Characters have finite order and are totally odd. H is their faithful cyclic CM extension. All isotypic modules are χ^{-1}-components after scalar extension to the characteristic-zero field E.
- p is arbitrary, including 2. Dyadic principal parts use 1+4Z_2; no integral minus projector is asserted.
- Local reciprocity sends the inverse uniformizer to arithmetic Frobenius and gives the cyclotomic norm on units. Local ℓ_i is unsigned, while the regulator uses −ℓ_i.
- The p-adic L-branch is L_p(χω,z). It has an analytic germ at zero; a possible exceptional pole at 1 does not exclude χ=ω^{-1}.
- The Λ-adic, height-one-local and maximal-ideal-completed topologies are distinguished. Continuous H^1 uses the existing cocycle quotient and p-adic coefficient topology; no discrete replacement is used.
- The three Artin algebras and cuspidal-family constructions are used only when r≥1. Rank zero is proved by interpolation.


Fix compatible local decomposition embeddings and an ordering q_i of R with one P_i|q_i in H. Let U=O_H[1/p]^×, written additively after applying Additive, and let X be the free abelian group on the primes of H above p. Superscript minus means the negative complex-conjugation component. The character projector is |G|^{-1}∑_gχ(g)g, acting on the χ^{-1}-space. Its denominators are taken in E. The valuation equivalence and the signed norm-logarithm map both have source U_χ and target X_χ.

For local coordinates, O_ij=ord_{P_i}(u_j) and L_ij=log_p N_{F_{q_i}/Q_p}(u_j) use **unsigned** logarithms. Thus R_p(χ)=det(−L)/det O. The determinant of the empty matrix is 1. The complex normalization D_χ=L(χ,0)∏_{R′}(1−χ(q)) is nonzero. Write f_χ(z)=L_p(χω,z), L_an(χ)=f_χ^{(r)}(0)/(r!D_χ), s=ord_0 f_χ and L*_an(χ)=f_χ^{(s)}(0)/(s!D_χ).

For r≥1, Λ=O_E[[T]], ν_k(T)=u^{k−1}−1 and π=T/log_p(u), with u=1+p for odd p and u=5 for p=2. The height-one localization inverts p and has residue E. Its completion is over the completed weight DVR. The original Λ-adic topology used for Galois continuity is kept distinct from the maximal-ideal topology used for completion.

## Supplier contracts

The following are exact mathematical inputs. A finer existing node is used in the targets whenever its statement suffices. In particular, an even-degree or odd-prime Hilbert node cannot discharge the unrestricted theorem, and a multiplicative approximation theorem cannot replace Baker–Brumer.

**S1. `ArithmeticGaloisDuality:R02.3`.** Supply restriction/inflation for continuous cohomology of finite-dimensional p-adic E-representations, the finite-index averaging comparison (including when p divides the finite index), and the E-linear scalar-action adapter on the existing continuous H^1 quotient. Preserve its continuous coefficient maps and finite-coordinate decompositions. Kummer at finite coefficients is cited through its exact node rather than rebuilt.

Consumed by `GS.1/restricted-cohomology`, `GS.1/orthogonality-reciprocity`, `GS.4/simultaneous-good-element`, `GS.4/class-unramified`.

**S2. `ArithmeticGaloisDuality:R02.4`.** Supply the local cup/Kummer evaluation identity for the convention rec(ϖ^{-1})=arithmetic Frobenius, with pairing ordered (χ^{-1},χ(1)) and one universal sign, and the Selmer annihilator/image description for the local unramified conditions outside R. Use the exact lattice/rational Poitou–Tate node, limits before rationalization, finite class-group corrections and vanishing rational real-place dyadic terms.

Consumed by `GS.1/kummer-identification`.

**S3. `AutomorphicPadicLFunctions:L0`.** Supply the finite-order totally odd ray-class/Galois character correspondence, conductors and avatars with fixed embeddings, the complex L-function and functional-equation/critical nonvanishing needed to show the interpolating germ is nonzero, and the pole-character normalization. The exact odd-character L(χ,0) nonvanishing node is separately cited.

Consumed by `GS.0/arithmetic-data`, `GS.0/analytic-invariant`.

**S4. `AutomorphicPadicLFunctions:L3`.** Supply the all-prime cyclotomic Deligne–Ribet specialization, its analytic germ at zero (including its possible pole only at 1), and the comparison of its smoothed measure with the Eisenstein/Shintani cocycle realization used in CD14 §5. The cocycle/measure Mellin identity is the input; the Gross–Stark order inequality itself is proved in GS.0. Also supply auxiliary-level theta/Hasse lifts, integral q-expansion/binomial-family operations, trace and level-removal formulas, and the ordinary Eisenstein boundary decomposition required in the Ventullo and projection proofs. These are generic Hilbert-form/measure constructions already in this owner’s direction, not duplicate definitions here.

Consumed by `GS.0/order-lower-bound`, `GS.2/ventullo-family`.

**S5. `DiophantineApproximationAndTranscendence:DT.3`.** Supply Baker–Brumer p-adic linear independence of logarithms of algebraic numbers under algebraic coefficients, with the character-relation consequence that the rank-one χ-projected p-unit logarithm is nonzero. The general higher-rank regulator nonvanishing is not requested. The present multiplicative Yu approximation nodes do not state this needed linear independence theorem.

Consumed by `GS.5/rank-one-nonvanishing`.

**S6. `DirichletPadicLFunctions:L3`.** Supply the extended Iwasawa logarithm Q_p^×→Q_p with log_p(p)=0 and log_p(roots of unity)=0, its local-norm composition for every finite extension of Q_p, its kernel on Q_p^× (powers of p times roots of unity), and the principal-part convention using {±1} at p=2. The existing current Tau Ceti principal-unit logarithm is reused on its domain; a principal-unit series alone does not supply this global branch.

Consumed by `GS.0/unit-divisor-modules`, `GS.0/analytic-invariant`, `GS.1/restricted-cohomology`, `GS.2/weight-coordinate`, `GS.3/hecke-orbit`.

**S7. `IntegralHeckeAndGaloisDeterminants:IHG.1`.** Supply the continuous actual-matrix realization adapter for the shared henselian multiplicity-free GMA/extension API: under the verified finite coefficient-order/lattice hypotheses, the spans of upper and lower entries after a fixed distinct-root basis change are finite modules over the completed order, their residue quotients have the finite-dimensional E-topology, and the realized extension class is continuous. Clearing denominators/finite lattices must be proved before finite generation is inferred. Use the cited common GMA nodes with 2! invertible, not a new generic construction or a free rank-one assumption.

Consumed by `GS.4/simultaneous-good-element`, `GS.4/adapted-extension-class`, `GS.5/inverse-extension-class`.

**S8. `IntegralHeckeAndGaloisDeterminants:IHG.4`.** Supply the reusable closed-coefficient-order density adapter: finite Λ-orders and their finite congruence-ideal modules, embedded in the actual finite family coefficient fields with the original Λ-adic topology, are closed; hence continuous Frobenius-dense trace/characteristic-polynomial identities and congruences extend to all G_F. Verify the lattice/bounded-denominator hypotheses in this application before localization. Current compact finite-quotient interpolation is not by itself an integrality argument for a noncompact weight-one localization.

Consumed by `GS.4/actual-hida-representations`, `GS.4/diagonal-refinement`.

**S9. `IntegralIwasawaTheory:I.1`.** Supply the arithmetic cyclotomic character on G_F, its compatible finite-level actions and the procyclic coordinate comparison. This is the parent’s existing cyclotomic infrastructure; no main-conjecture or new completed-group-ring construction is requested.

Consumed by `GS.2/weight-coordinate`.

**S10. `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`.** Supply the Hida–Wiles theorem in DKV18 Theorem 4.1 for every actual cuspidal eigenfamily in this primitive tame-level ordinary Hilbert module, for arbitrary totally real F and all p. It gives a continuous irreducible representation over a finite extension of Frac Λ, unramified outside np, with X²−T_lX+χε(l) and the ordinary filtration at every q|p with η_q(rec(ϖ^{-1}))=U_q. A semisimple representation only over an algebraic closure, an even-degree-only theorem, or an absolutely-irreducible-residual integral reconstruction theorem is insufficient.

Consumed by `GS.4/actual-hida-representations`.

**S11. `PadicFamilies:L5`.** Supply actual finite ordinary Hilbert modules and one-parameter parallel-weight control for arbitrary totally real F and every p, with the prescribed central character, imprimitive stabilization and coefficient/level functoriality. Verify the integral finite-quotient hypotheses of L0a before inverting p. Supply the primitive tame-level reduced Hecke order, its Noetherian height-one localization and completion finite over the completed weight DVR and total quotient injection used by DKV18 §4. Existing Hilbert nodes restricted to odd p or even [F:Q] are not sufficient; the stage’s unrestricted scope must supply this stronger contract.

Consumed by `GS.2/weight-coordinate`, `GS.2/eisenstein-dictionary`, `GS.2/ventullo-family`, `GS.2/normalized-cuspidal-projection`, `GS.3/hecke-orbit`, `GS.4/actual-hida-representations`.

**S12. `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.** Supply Frobenius density/prime selection outside the finite ramification and level set, including a prime with χ(q)≠1 and separation of distinct finite-character Eisenstein eigensystems. Integrality and congruence extension use the separate closed-order hypotheses, not density alone.

Consumed by `GS.2/normalized-cuspidal-projection`, `GS.3/hecke-orbit`, `GS.4/actual-hida-representations`, `GS.4/diagonal-refinement`.

**S13. `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.** Supply compatible global reciprocity and the triviality of principal ideles on its profinite quotient, including the local-global evaluation sum. Keep closures/completions explicit; the raw idele class group is not identified with a profinite Galois group.

Consumed by `GS.0/order-lower-bound`, `GS.1/orthogonality-reciprocity`.

**S14. `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.** Supply the finite unramified abelian class-field quotient over the CM field H and the restriction/norm identifications used for R_H-units and everywhere-unramified classes. The baseline finite ideal class group and local/global Artin maps supply its arithmetic realization.

Consumed by `GS.1/orthogonality-reciprocity`, `GS.1/inertia-injectivity`.

**S15. `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.** Supply absolute local reciprocity on the profinite multiplicative completion, normalized so rec(ϖ^{-1}) is arithmetic Frobenius and the cyclotomic character on local units is the norm. Give the unit/inertia and uniformizer/unramified identifications and local norm compatibility, including p=2; invert the owner’s Artin convention if necessary.

Consumed by `GS.0/arithmetic-data`, `GS.1/restricted-cohomology`, `GS.1/kummer-identification`, `GS.4/class-unramified`, `GS.5/exact-determinant`.

## Existing library interfaces

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each following declaration’s statement was read at those pins. Current Tau Ceti and the current upstream roadmap boundaries were also checked for material beyond the atlas snapshot.

- [`FreeAbelianGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FreeAbelianGroup.lean): The free additive commutative group on a type; this supplies the divisor module on the finite set of p-primes.
- [`HenselianRing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Henselian.lean): The henselian-pair predicate with its simple-root lifting property. The same source contains the existing IsAdicComplete.henselianRing instance used by the shared GMA supplier to put this structure on the completed coefficient order.
- [`LinearMap.det`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Determinant.lean): The determinant of an endomorphism over a commutative ring; the regulator uses it only on a finite-dimensional E-vector space, where it agrees with the finite-basis determinant.
- [`LinearMap.det_toMatrix`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Determinant.lean): With a finite basis, the determinant of the matrix of an endomorphism equals LinearMap.det of that endomorphism.
- [`Matrix.det`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): The determinant of a square matrix indexed by a finite decidable type over a commutative ring; the empty determinant is 1.
- [`Matrix.det_mul`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): For finite square matrices over a commutative ring, det(MN)=det(M)det(N).
- [`Matrix.det_nonsing_inv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean): The determinant of Mathlib’s nonsingular inverse matrix is Ring.inverse of its determinant; over a field and a nonzero determinant this is its multiplicative inverse.
- [`NumberField.RingOfIntegers.instFintypeClassGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/ClassNumber.lean): The ideal class group of the ring of integers of a number field is finite.
- [`NumberField.Units.finrank_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean): The statement is finrank ℤ (Additive (𝓞 K)ˣ)=NumberField.Units.rank K for a number field K. This existing Dirichlet unit-rank theorem supplies the rank calculation after rationalization; it is not the new odd p-unit valuation isomorphism.
- [`PowerSeries.X`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Basic.lean): The formal variable power series, with coefficient 1 in degree one and 0 elsewhere.
- [`PowerSeries.coeff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Basic.lean): The R-linear extraction of the n-th coefficient of a formal power series; Taylor coefficients supply the finite-dimensional arithmetic normalization after the analytic comparison.
- [`PowerSeries.order`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Order.lean): The least nonzero coefficient degree in ℕ∞, with order ⊤ for the zero series. It is not an independently defined analytic order.
- [`TensorProduct`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Defs.lean): The tensor product of modules over a commutative semiring, formed as the quotient by the bilinearity relations; use Additive U for multiplicative unit groups.
- [`TauCeti.ContCohomology.H1`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean): The additive quotient of continuous one-cocycles by one-coboundaries. Its inherited quotient topology is not used as a discrete-coefficient replacement for p-adic cohomology; the scalar action is descended on this carrier.
- [`TauCeti.ContCohomology.H1EquivOfSmulEqSelf`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean): For a trivial continuous action, H^1 identifies additively with continuous homomorphisms from G to the additive coefficient group. These factor through the abelianization; the local Artin and E-linear adapters are supplied comparisons.


The finite unit-rank and class-group theorems are inputs, rather than new targets. The χ-component valuation equivalence, the signed regulator and the arithmetic local adapters are new targets. Tau Ceti’s continuous H¹ is reused as an additive quotient; the supplied E-linear structure descends on that carrier, and its inherited quotient topology is never treated as a discrete-coefficient comparison for this p-adic application.

## Layer guide

| Layer | Endpoint |
| --- | --- |
| GS.0 | Arithmetic data and the regulator |
| GS.1 | Cyclotomic cohomology and orthogonality |
| GS.2 | Weight-one families and cuspidal projection |
| GS.3 | Infinitesimal Hecke quotients |
| GS.4 | The arithmetic Galois class |
| GS.5 | Determinants and the Gross–Stark theorem |


## GS.0 — Arithmetic data and the regulator

Fix the all-prime arithmetic conventions, construct the odd p-unit and divisor components, prove the rational valuation isomorphism, and define Gross’s signed regulator and the normalized analytic leading terms. Derive the all-prime lower bound for the order of vanishing. Distinguish the leading-term theorem from the open exact-order conjecture.

**Layer inputs:** `IntegralIwasawaTheory:I.1`, `AutomorphicPadicLFunctions:L0`, `AutomorphicPadicLFunctions:L3`, `DirichletPadicLFunctions:L3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`. Individual targets below give the direct dependency list.

### Gross–Stark arithmetic data

**Target:** `GS.0/arithmetic-data`.

Fix a totally real number field F, a rational prime p (including 2), algebraic embeddings into C and C_p, and a continuous finite-order totally odd character χ of G_F. Put H=F̄^{ker χ}, G=Gal(H/F), and choose a finite extension E/Q_p containing the embedded values of χ. H/F is cyclic CM, χ is faithful on G, and its complex conjugation c satisfies χ(c)=−1. For a finite prime q, χ(q) is its arithmetic-Frobenius value when unramified and is 0 when ramified. Partition the primes above p into R={q:χ(q)=1} and R′; put r=|R|. This packages the supplied character and prime carriers without replacing them.

**Hypotheses and conventions.** All χ-components use χ^{-1}; E has characteristic zero even when p=2.

**Construction or proof.**

1. Use the supplied ray-class/Galois character correspondence and finite-image quotient.
2. Total oddness makes the fixed field of complex conjugation totally real and H totally imaginary.
3. Use faithfulness to identify χ(q)=1 with complete splitting in H/F.


**API.**

- `GrossStark.Data.exceptionalPrimes` (data): R is the finite set of primes above p with unramified χ(q)=1.
- `GrossStark.Data.rank` (projection): r is the cardinality of R.
- `GrossStark.Data.inverse_exceptionalPrimes` (compatibility): Replacing χ by χ^{-1} leaves R and r unchanged.
- `GrossStark.Data.split_iff` (characterisation): For q|p, membership in R is equivalent to complete splitting in the faithful extension H/F.
- `GrossStark.Data.baseChange` (functoriality): Enlarging E transports χ and preserves R and r, with identity and composition laws.


**Checks.**

- `GrossStark.Data.ramified_dyadic`: For F=Q, H=Q(i), χ the odd quadratic character and p=2, χ(2)=0 and R is empty.
- `GrossStark.Data.split_five`: For the same H and p=5, R={(5)} and r=1.
- `GrossStark.Data.inert_three`: For the same H and p=3, χ(3)=−1, R is empty and R′={(3)}.


**Uses.** DKV18 Theorem 1: Fixes every parameter of the leading-term formula. GS.1 and GS.4: Selects the local trivial-character places and the distinct residual characters.

**Acceptance.** Every q above p belongs to exactly one part; χ and χ^{-1} have the same R.

**Dependencies.** `AutomorphicPadicLFunctions:L0`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

**Sources.** [DKV18](#references), §1, pp. 834–836. The arithmetic setting and the exceptional Euler-factor partition fix the scope of the theorem.

### Odd p-units and divisor components

**Target:** `GS.0/unit-divisor-modules`.

Let U=O_H[1/p]^× and X=⊕_{P|p} Z·[P], with their natural G-actions. In additive notation set U^-={u:c(u)=−u} and X^-={x:c(x)=−x}; multiplicatively the first equation is c(u)=u^{-1}. Define U_χ and X_χ as the χ^{-1}-eigenspaces of U^-⊗_Z E and X^-⊗_Z E. The character projector on either rationalized G-module is e_χ=|G|^{-1}∑_g χ(g)g. Define o_p(u)=(ord_P(u))_P and the signed map ℓ_p(u)=(−log_p N_{H_P/Q_p}(u))_P, extended E-linearly and restricted to the χ-components.

**Hypotheses and conventions.** Use the supplied Iwasawa logarithm with log_p(p)=0, not the unextended principal-unit series. Tensor products use Additive U; all inverses of 2 and |G| occur only after extension to E.

**Construction or proof.**

1. Form the localization-unit carrier and the free divisor module on the supplied finite prime set.
2. Valuations and local norm logarithms are additive and G-equivariant; therefore they restrict to minus and χ-parts.
3. For a prime outside R the corresponding permutation module has zero χ^{-1}-part; the spanning consequence is proved with the valuation isomorphism.


**API.**

- `GrossStark.pUnitComponent` (constructor): U_χ is the χ^{-1}-eigenspace of the E-linearized minus p-units.
- `GrossStark.divisorComponent` (constructor): X_χ is the same eigenspace in the divisor module.
- `GrossStark.characterProjector_apply` (simp): e_χ(v)=|G|^{-1}∑_g χ(g)g(v), and e_χ acts as identity on the χ^{-1}-space.
- `GrossStark.valuationMap_apply` (simp): The P-coordinate of o_p(u) is ord_P(u).
- `GrossStark.signedLogMap_apply` (simp): The P-coordinate of ℓ_p(u) is −log_p N_{H_P/Q_p}(u).
- `GrossStark.component_baseChange` (compatibility): For E⊆E′, E′⊗_E U_χ and E′⊗_E X_χ identify with the corresponding E′-components, and both maps commute with these identifications.


**Checks.**

- `GrossStark.pUnits.torsion`: Every root of unity has zero image under both o_p and ℓ_p and dies in U⊗E.
- `GrossStark.pUnits.dyadic_projector`: At p=2 the rationalized projector (1−c)/2 is defined over E; no such integral Z_2-idempotent is asserted.
- `GrossStark.pUnits.sign`: For H=Q(i), p=5 and u=(2+i)/(2−i), at P=(2+i) the valuation is 1 and the signed logarithm is −log_5(u under H_P≅Q_5).


**Uses.** GS.0 valuation isomorphism and regulator: Supplies the exact linear maps. DKV18 Proposition 2.1 and §5.1: Provides the p-units on which local classes are evaluated.

**Acceptance.** No integral minus-idempotent claim is used at p=2. The codomain of both restricted maps is the same X_χ.

**Dependencies.** `GS.0/arithmetic-data`, `DirichletPadicLFunctions:L3`, `mathlib:TensorProduct`, `mathlib:FreeAbelianGroup`, `mathlib:NumberField.Units.finrank_eq`.

**Sources.** [DKV18](#references), §1, pp. 835–836; §5.1, p. 865. The p-unit and divisor modules, their odd isotypic parts and the two equivariant maps provide the regulator domain.

### Valuation isomorphism and rank

**Target:** `GS.0/valuation-isomorphism` · **Declaration:** `GrossStark.valuation_isomorphism`.

The map o_p:U^-⊗Q→X^-⊗Q is an isomorphism of Q[G]-modules. Consequently o_p^χ:U_χ→X_χ is an E-linear equivalence and dim_E U_χ=dim_E X_χ=r. For chosen primes P_i above the distinct q_i∈R and any E-basis u_j of U_χ, O=(ord_{P_i}(u_j)) has nonzero determinant. Ordinary units of the CM field have zero odd component after tensoring with Q. The χ-projections of units supported above R span U_χ.

**Construction or proof.**

1. By the existing Dirichlet unit rank theorem, the units of H and of its totally real fixed field H⁺ have equal rational rank. The injection of H⁺ units therefore spans the rationalized H units, so c acts as the identity and their odd component is zero. This identifies the kernel of the odd valuation map.
2. The class group is finite, so a positive multiple of each prime divisor is principal; rationalization makes the valuation map onto, including on odd parts.
3. Decompose the prime permutation module by decomposition groups. Faithfulness gives a one-dimensional χ^{-1}-summand exactly for q∈R and zero otherwise. Apply the same rational divisor argument to the R_H-unit subgroup to obtain the spanning assertion.


**Acceptance.** This is an isomorphism of rationalized odd modules, not of the full integral p-unit and divisor groups. The rank-zero map is the unique equivalence between zero vector spaces.

**Dependencies.** `GS.0/unit-divisor-modules`, `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`, `mathlib:NumberField.Units.finrank_eq`.

**Sources.** [DKV18](#references), §1, (5)–(6), pp. 835–836; §1.1, pp. 837–838. The rational valuation isomorphism and the component dimension imply the nonzero valuation determinant.

### Gross’s p-adic regulator

**Target:** `GS.0/gross-regulator`.

Define R_p(χ)=det_E(ℓ_p^χ∘(o_p^χ)^{-1}) as an endomorphism of X_χ. For a choice of P_i|q_i∈R let o_i=ord_{P_i} and let ℓ_i=log_p N_{F_{q_i}/Q_p}; the complete splitting identifies H_{P_i}=F_{q_i}. If O=(o_i(u_j)) and L=(ℓ_i(u_j)), then R_p(χ)=det(−L)/det(O). The zero-dimensional determinant is 1. The value is independent of the ordered primes and unit basis and commutes with extension of E.

**Hypotheses and conventions.** The maps ℓ_i are unsigned; the endomorphism uses the signed ℓ_p. O is invertible by the preceding theorem.

**Construction or proof.**

1. Apply Mathlib LinearMap.det to the endomorphism of the finite-dimensional E-space X_χ.
2. Use the coordinate map X_χ≅E^r from the chosen primes, then the matrix is (−L)O^{-1}.
3. Matrix determinant multiplicativity proves the ratio, basis invariance and covariance under changing prime lifts.


**API.**

- `GrossStark.regulator` (constructor): R_p(χ) is det of the signed-log-after-inverse-valuation endomorphism of X_χ.
- `GrossStark.regulator_eq_matrix` (compatibility): For every ordered prime lift and unit basis it equals det(−L)/det O, using Mathlib determinants.
- `GrossStark.regulator_basis_change` (functoriality): Replacing (O,L) by (OP,LP), P invertible, preserves the ratio.
- `GrossStark.regulator_prime_change` (functoriality): Simultaneous row permutation or multiplication of O and L by the same invertible character diagonal preserves the ratio.
- `GrossStark.regulator_scalar_extension` (compatibility): A field embedding E→E′ sends R_p(χ) to the E′-regulator.
- `GrossStark.regulator_zero_rank` (simp): When R is empty, R_p(χ)=1.


**Checks.**

- `GrossStark.regulator.rank_zero`: For 0×0 O and L, the regulator is 1.
- `GrossStark.regulator.rank_one`: For O=(2), L=(3) over Q_5, the matrix regulator is −3/2.
- `GrossStark.regulator.rank_two`: For O=diag(2,3) and L=diag(5,7) over Q_5, the matrix regulator is 35/6; changing both columns by diag(4,1) preserves it.
- `GrossStark.regulator.singular`: For O=I_2 and L with equal rows, the regulator is 0.


**Uses.** DKV18 Theorem 1: This is the arithmetic side of the equality. GS.1 algebraic invariant and GS.5 determinant: Translates local equations into a scalar equality.

**Acceptance.** Changing a prime lift rescales the corresponding O and L rows by the same nonzero character value. A singular logarithm matrix is permitted and gives regulator zero.

**Dependencies.** `GS.0/valuation-isomorphism`, `mathlib:LinearMap.det`, `mathlib:LinearMap.det_toMatrix`, `mathlib:Matrix.det_mul`, `mathlib:Matrix.det_nonsing_inv`.

**Sources.** [DKV18](#references), §1, regulator definition following (6), p. 836; §1.1, (8), p. 838. The invariant determinant and its coordinate ratio determine the sign and the choice-independent regulator.

### Analytic leading terms

**Target:** `GS.0/analytic-invariant`.

Use the supplied complex Artin L-function and its p-depletion L*(χ,z)=L(χ,z)∏_{q|p}(1−χ(q)(Nq)^{-z}), and the supplied Deligne–Ribet branch f_χ(z)=L_p(χω,z), with f_χ(n)=L*(χω^n,n) for integers n≤0. Put D_χ=L(χ,0)∏_{q∈R′}(1−χ(q))≠0 and L_an(χ)=f_χ^{(r)}(0)/(r!D_χ). For its finite analytic order s set L*_an(χ)=f_χ^{(s)}(0)/(s!D_χ)≠0. These definitions use the branch χω in every derivative. Complex L*(χ,z) has order r at zero.

**Hypotheses and conventions.** The germ is analytic at zero, including the exceptional branch χ=ω^{-1}: its possible pole is at s=1, and its pole-clearing factor is a unit near zero. For p=2 use ω:Z_2^×→{±1} and principal part in 1+4Z_2.

**Construction or proof.**

1. Import the supplied critical values, algebraicity, interpolation and nonvanishing at zero.
2. Each exceptional Euler factor has a simple complex zero, whereas the other factors and L(χ,0) are nonzero.
3. Analytic Taylor coefficients give the factorial normalization; interpolation at nonzero critical values makes the analytic germ nonzero and s finite.


**API.**

- `GrossStark.analyticInvariant` (constructor): The rank-r Taylor coefficient of f_χ at zero divided by D_χ.
- `GrossStark.firstLeadingTerm` (constructor): The order-s Taylor coefficient divided by D_χ, for s the finite order.
- `GrossStark.analyticInvariant_eq_derivative` (compatibility): The coefficient formula equals f_χ^{(r)}(0)/(r!D_χ).
- `GrossStark.analyticInvariant_of_order_gt` (simp): If s>r then L_an(χ)=0.
- `GrossStark.analyticInvariant_of_order_eq` (simp): If s=r then L_an(χ)=L*_an(χ)≠0.
- `GrossStark.analyticInvariant_baseChange` (functoriality): Changing the p-adic embedding by a compatible coefficient embedding transports D_χ, coefficients and the quotient.


**Checks.**

- `GrossStark.analytic.constant`: For a constant germ f=D≠0 and r=0 the normalized coefficient is 1.
- `GrossStark.analytic.factorial`: For f(z)=6Dz² and r=2, the normalized coefficient is 6, not 12.
- `GrossStark.analytic.higher_zero`: For f(z)=Dz³ and r=2 the rank-r invariant is 0, whereas the first leading term is 1.
- `GrossStark.analytic.dyadic`: At p=2, the unit −1 has ω(−1)=−1 and principal part 1; its logarithm is 0.


**Uses.** GS.2 weight-one specialization: Fixes the sign (−1)^s from z=1−k. GS.5 final theorem: Supplies the analytic scalar to compare with the regulator.

**Acceptance.** When s>r, L_an=0; when s=r, L_an=L*_an. The removed Euler factors in D_χ are exactly R′, not all primes above p.

**Dependencies.** `GS.0/arithmetic-data`, `AutomorphicPadicLFunctions:L0/odd-character-l-zero-nonvanishing`, `AutomorphicPadicLFunctions:L3/deligne-ribet-pseudomeasure`, `AutomorphicPadicLFunctions:L0`, `DirichletPadicLFunctions:L3`, `mathlib:PowerSeries.coeff`, `mathlib:PowerSeries.order`.

**Sources.** [DKV18](#references), §1, (2)–(4), pp. 834–835; p. 837; §1.3, p. 841. The interpolation branch and normalized leading coefficients distinguish the rank-r derivative from the first nonzero derivative.

### All-prime lower bound for the order

**Target:** `GS.0/order-lower-bound` · **Declaration:** `GrossStark.order_lower_bound`.

For every prime p, including 2, ord_{z=0} L_p(χω,z)≥r. Prove it by the Charollois–Dasgupta/Spiess analytic route: after one auxiliary smoothing prime c away from fp with 1−χ(c)Nc≠0, the smoothed branch is an analytic unit times f_χ; its first r Taylor coefficients vanish. This is an inequality, with no assumption of regulator nonvanishing or exact order.

**Hypotheses and conventions.** Use the same χ, Euler factors and dyadic sign branch as in the analytic invariant.

**Construction or proof.**

1. Choose c by the ray-class/prime correspondence so the smoothing factor is nonzero at zero. Use the supplier’s Eisenstein-cocycle realization of that smoothed Deligne–Ribet measure and its Mellin identity.
2. For r exceptional primes, choose totally positive π_i generating positive powers of their ray ideal classes. Set T=⟨π_i⟩ and U=E_+×T. In the space C_c^♭ of compactly supported functions constant near zero in exceptional coordinates, the induced-function decomposition of CD14 Lemma 5.3 makes this a free C_p[T]-module. Thus H_q(T,C_c^♭)=0 for q>0, and the Hochschild–Serre spectral sequence gives the edge isomorphism of Theorem 5.1. These homological steps have no odd-prime assumption.
3. CD14 Theorem 5.2: for k<r, expand (∑ℓ_q(x_q))^k. In each monomial an exceptional coordinate is absent; the difference (1−π_i) on the corresponding box writes it in the T-augmentation ideal, with lower-degree errors handled inductively. Its homology class therefore vanishes.
4. Pair with the supplied measure cocycle to obtain vanishing of derivatives of orders k<r (CD14 (79)–(84)). Divide by the smoothing unit. The main-conjecture alternative from the parent I.5 applies only at odd p and is not used for p=2.


**Acceptance.** The source’s dyadic replacement μ_{p−1}→{±1} is retained. At r=0 the assertion is vacuous and does not assert a zero.

**Dependencies.** `GS.0/analytic-invariant`, `AutomorphicPadicLFunctions:L3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Sources.** [CD14](#references), Theorem 3, author p. 4; §5.1–§5.2, author pp. 27–32. The smoothed analytic order bound is proved by an augmentation-ideal vanishing argument valid also for p=2. [DKV18](#references), §1, (4), p. 835. The known lower bound is a separate input to the leading-term proof.

### Two Gross conjectures and their boundary

**Target:** `GS.0/conjectural-boundary` · **Declaration:** `GrossStark.conjectural_boundary`.

Distinguish the exact-order assertion ord_0 f_χ=r from the leading-term assertion L_an(χ)=R_p(χ). The latter is the theorem proved in GS.5; conditional on the latter, the former is equivalent to R_p(χ)≠0 by the lower bound. GS.5 supplies that hypothesis. No general exact-order or regulator-nonvanishing theorem is asserted. The characteristic polynomial of ℓ_p^χ(o_p^χ)^{-1} is an available linear-algebra object; the conjectural formulas for all its coefficients are outside the endpoint here.

**Construction or proof.**

1. Use the analytic Taylor coefficient criterion and the lower bound.
2. A nonzero rank-r coefficient is equivalent to exact order r.
3. Keep the higher characteristic-polynomial statement explicitly conjectural; only its determinant coefficient is supplied by the endpoint.


**Acceptance.** The zero-regulator case must remain compatible with a strictly larger analytic order.

**Dependencies.** `GS.0/gross-regulator`, `GS.0/analytic-invariant`, `GS.0/order-lower-bound`.

**Sources.** [DKV18](#references), §1, Conjectures 1–2 and Theorem 1, pp. 835–837; Remark 1.1, p. 837. The leading-term equality and exact-order conjecture are different assertions; the characteristic-polynomial extension is contextual.

**Layer acceptance.** Every target and Check above holds with the common sign and topology conventions, and every direct supplier contract is discharged at the stated generality. The global end theorem is reached only after GS.5.

## GS.1 — Cyclotomic cohomology and orthogonality

Specialize the existing continuous cohomology carrier to ramification outside the exceptional primes. Prove the Kummer comparison and both orthogonality proofs, injectivity of the product of inertia restrictions, the r-dimensional cyclotomic subspace and its algebraic L-invariant, and its equality with the regulator.

**Layer inputs:** `GS.0`, `ArithmeticGaloisDuality:R02.3`, `ArithmeticGaloisDuality:R02.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `DirichletPadicLFunctions:L3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`. Individual targets below give the direct dependency list.

### Restricted continuous cohomology

**Target:** `GS.1/restricted-cohomology`.

For a finite-dimensional topological E-vector space V with scalar G_F-action χ^{-1}, let H_R^1(G_F,V(χ^{-1})) be the subspace of continuous H^1 whose restriction to H^1(I_q,V(χ^{-1})) is zero at every finite q∉R. Use the existing continuous cocycle quotient, with cocycle κ(gh)=κ(g)+χ^{-1}(g)κ(h) and coboundary (χ^{-1}(g)−1)v. At q∈R the action is trivial, so a local class is a continuous homomorphism F_q^× completed profinitely→V through Serre reciprocity. On E coefficients, o_q and ℓ_q span a two-dimensional local subspace.

**Hypotheses and conventions.** Choose compatible decomposition embeddings at every finite prime. The local reciprocity convention sends rec(ϖ^{-1}) to arithmetic Frobenius, and on units the cyclotomic character is the norm; invert a supplier’s Artin map if needed.

**Construction or proof.**

1. Use the existing H^1 carrier, restriction and twisted scalar action. Form the intersection of the kernels of all inertia restriction maps.
2. At q∈R, χ|G_q=1 by complete splitting. Apply the baseline trivial-action identification and the supplied absolute local reciprocity map.
3. The valuation and the norm logarithm are continuous and extend to the profinite multiplicative completion. Their independence follows from a deep principal unit with nonzero norm logarithm and a uniformizer of valuation 1.


**API.**

- `GrossStark.restrictedH1` (constructor): The E-subspace cut out by the kernels of the inertia restrictions outside R.
- `GrossStark.restrictedH1.mem_iff` (characterisation): Membership means the restriction class is zero at every q∉R.
- `GrossStark.restrictedH1.localHom` (equivalence): At q∈R, local restriction is a continuous homomorphism of the profinite completion of F_q^× to V.
- `GrossStark.restrictedH1.coboundary` (compatibility): Changing a representative by (χ^{-1}(g)−1)v preserves the class and every local restriction at R.
- `GrossStark.restrictedH1.coeffMap` (functoriality): A continuous E-linear V→V′ induces a restriction-compatible map, with identity and composition laws.


**Checks.**

- `GrossStark.restrictedH1.zero`: The zero cocycle lies in H_R^1 for every R.
- `GrossStark.restrictedH1.local_coboundary`: Every coboundary restricts to the zero function at q∈R since χ|G_q=1.
- `GrossStark.restrictedH1.topology`: For G=Z_p acting trivially on E, the inclusion Z_p→E represents a nonzero continuous class; replacing E by a discrete coefficient topology loses it.
- `GrossStark.restrictedH1.local_valuation`: Under reciprocity, o_q(ϖ)=1 and o_q(a)=0 for every local unit a, whereas ℓ_q can be nonzero on a principal unit.


**Uses.** DKV18 Proposition 2.1: Supplies the orthogonality domain. GS.4 actual class: Specifies the local conditions the matrix-entry class must satisfy.

**Acceptance.** The coefficients have their p-adic vector topology, never a discrete topology. Unramified means zero inertia class; a representative need not vanish on inertia where the action is nontrivial.

**Dependencies.** `GS.0/arithmetic-data`, `GS.0/unit-divisor-modules`, `tauceti:TauCeti.ContCohomology.H1`, `tauceti:TauCeti.ContCohomology.H1EquivOfSmulEqSelf`, `ArithmeticGaloisDuality:R02.3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `DirichletPadicLFunctions:L3`.

**Sources.** [DKV18](#references), §1.2, pp. 838–839; §2, pp. 843–845. Restricted continuous classes and their local reciprocity realizations are the setting of both orthogonality proofs.

### Kummer description of the dual local condition

**Target:** `GS.1/kummer-identification` · **Declaration:** `GrossStark.kummer_identification`.

The rationalized Kummer map identifies U_χ with the subgroup of H^1(G_F,E(χ)(1)) with local unit-Kummer condition at every finite q∉R. Locally it identifies (lim_n H_P^×/(H_P^×)^{p^n})⊗_{Z_p}E with H^1(G_{H_P},E(1)), using the additive form of the multiplicative completion; at q∉R the class is in the local condition orthogonal to the unramified condition on E(χ^{-1}). With the pairing ordered as H^1(E(χ^{-1})) first and H^1(E(χ)(1)) second, the cup-product/invariant pairing with the Kummer image of u is a fixed universal sign times evaluation at u under the chosen reciprocity convention.

**Hypotheses and conventions.** Inverse limits are formed before inverting p; do not replace the p-adic completion of units by the uncompleted group.

**Construction or proof.**

1. Apply the supplier’s finite S-unit Kummer sequence for p^n, pass to inverse limits with its class-group torsion correction, then tensor with E; finiteness of the class group removes the correction.
2. Use finite-index descent along H/F: |G| is invertible in E, so restriction identifies the χ^{-1}-component.
3. Ordinary CM units have zero odd component. At nonexceptional p-primes the valuation component also vanishes, yielding exactly the R-local dual condition.
4. Transport the supplier’s local evaluation/cup-product identity through the chosen inverse Artin normalization, keeping one universal sign.


**Acceptance.** At a finite coefficient level the class-group term is present; it disappears only after the stated rationalization. The same pairing order is used in the global invariant sum and in the evaluation identity. At primes above p, the dual unit-Kummer condition is stated as such; it is not confused with ordinary unramifiedness of E(χ)(1).

**Dependencies.** `GS.0/valuation-isomorphism`, `GS.1/restricted-cohomology`, `ArithmeticGaloisDuality:R02.3/s-unit-kummer-sequence`, `ArithmeticGaloisDuality:R02.4/lattice-rational-poitou-tate`, `ArithmeticGaloisDuality:R02.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

**Sources.** [DKV18](#references), §2, Proof 1 of Proposition 2.1, (19)–(22), pp. 843–844. The global and local Kummer maps identify the dual Selmer subgroup and turn local Tate pairings into evaluations. [DDP11](#references), Proposition 1.4 and Lemma 1.5, pp. 455–456. The rank-one Kummer and duality calculation generalizes by retaining all exceptional local factors.

### Orthogonality from Poitou–Tate duality

**Target:** `GS.1/orthogonality-duality` · **Declaration:** `GrossStark.orthogonality_duality`.

For κ∈H_R^1(G_F,V(χ^{-1})) and u∈U_χ, ∑_{i=1}^r (res_{q_i}κ)(u)=0 in V. This holds for every finite-dimensional V. The evaluation uses the chosen prime P_i and the local norm/reciprocity identifications.

**Construction or proof.**

1. First take V=E and the Kummer class of u. The rational Poitou–Tate invariant sum is zero.
2. At q∉R the paired local Selmer conditions annihilate one another. At q∈R the local pairing is the same universal sign times evaluation, so the common sign cancels from the zero sum.
3. Choose a basis of V, apply the scalar result to each continuous coordinate map, and recombine. Real dyadic Tate corrections vanish after tensoring with E.


**Acceptance.** For r=0 the sum is empty and equals zero. No ordering switch of the two cup-product arguments occurs mid-proof.

**Dependencies.** `GS.1/kummer-identification`, `ArithmeticGaloisDuality:R02.4/lattice-rational-poitou-tate`.

**Sources.** [DKV18](#references), Proposition 2.1, Proof 1, pp. 843–844. Global duality and local Kummer evaluation give the asserted sum-zero relation.

### Orthogonality from global reciprocity

**Target:** `GS.1/orthogonality-reciprocity` · **Declaration:** `GrossStark.orthogonality_reciprocity`.

The same sum ∑_i(res_{q_i}κ)(u) is zero by a class-field-theoretic proof independent of Poitou–Tate. Restriction to G_H identifies H^1(G_F,V(χ^{-1})) with χ^{-1}-equivariant continuous homomorphisms G_H→V. The restricted ramification condition and equivariance turn global reciprocity applied to R_H-units into the required local sum.

**Hypotheses and conventions.** Global reciprocity is used on its profinite idelic quotient, with closures/completions as in the supplier; no uncompleted idele-class isomorphism is asserted.

**Construction or proof.**

1. Finite-group cohomology in positive degree vanishes over E; inflation–restriction therefore gives the equivariant homomorphism description.
2. For a global R_H-unit, its principal idele has trivial global Artin image. Away from R_H its components are units whose inertia evaluations vanish.
3. Sum local evaluations over primes above q_i, then project by e_χ; equivariance gives a common nonzero scalar multiple of the sum over the selected P_i. Divide by that scalar in E.
4. Use the spanning of U_χ by χ-projected R_H-units and E-linearity.


**Acceptance.** The proof works at p=2 because division is in E. The local Artin maps are compatible with the same global normalization.

**Dependencies.** `GS.0/valuation-isomorphism`, `GS.1/restricted-cohomology`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `ArithmeticGaloisDuality:R02.3`.

**Sources.** [DKV18](#references), Proposition 2.1, Proof 2, (23)–(24), pp. 844–845. Equivariant restriction and the global principal-idele relation give the second orthogonality proof.

### Injectivity of the product of inertia restrictions

**Target:** `GS.1/inertia-injectivity` · **Declaration:** `GrossStark.inertia_injectivity`.

The product of restrictions H_R^1(G_F,E(χ^{-1}))→∏_{q∈R}H^1(I_q,E) is injective, and the same holds with finite-dimensional V coefficients. It is the product over all R, not one chosen inertia group.

**Construction or proof.**

1. A class in the kernel is unramified at every finite place. Restrict to G_H and use finite-index averaging over E.
2. It gives a continuous homomorphism of the everywhere-unramified abelian Galois group of H to a torsion-free E-vector space. The relevant class-field quotient is finite, so the homomorphism is zero.
3. Injectivity of restriction over the finite group G proves the original class is zero; coordinate maps give V.


**Acceptance.** When R is empty H_R^1=0. For r>1 a single inertia restriction is not substituted for the product.

**Dependencies.** `GS.1/restricted-cohomology`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`.

**Sources.** [DKV18](#references), Proposition 2.2, p. 845. The product restriction is injective by reduction to the finite Hilbert class field.

### Cyclotomic cohomology classes

**Target:** `GS.1/cyclotomic-subspace`.

Define H_cyc^1(χ)⊆H_R^1(G_F,E(χ^{-1})) by requiring each res_{q_j}κ to belong to E·o_j+E·ℓ_j, where ℓ_j is the unsigned norm logarithm. For a list κ_i of classes define X=(x_ij) and Y=(y_ij) by res_{q_j}κ_i=x_ij o_j+y_ij ℓ_j. Local independence makes the coefficients unique; κ↦(y_j)_j is the logarithmic-coordinate map.

**Construction or proof.**

1. Use the supplied continuous H^1 restriction maps and the independent local valuation/logarithm pair.
2. Take the inverse image of the direct sum of these local two-planes; coefficient extraction is E-linear.


**API.**

- `GrossStark.cyclotomicH1` (constructor): The inverse image of ⊕_j(Eo_j+Eℓ_j) in restricted H^1.
- `GrossStark.cyclotomicH1.mem_iff` (characterisation): Each restriction has unique coefficients x_j and y_j in the fixed local pair.
- `GrossStark.cyclotomicH1.localCoefficients` (projection): The valuation and logarithm coefficient maps are E-linear.
- `GrossStark.cyclotomicH1.representative_independent` (compatibility): Coefficient extraction factors through the existing H^1 quotient.
- `GrossStark.cyclotomicH1.coeff_baseChange` (functoriality): Field extension transports the local pair, subspace and coefficient maps.


**Checks.**

- `GrossStark.cyclotomicH1.zero`: The zero class has every x_j=y_j=0.
- `GrossStark.cyclotomicH1.unramified`: If every logarithm coefficient is zero, the class is zero by inertia injectivity; arbitrary valuation-coordinate tuples are not global classes.
- `GrossStark.cyclotomicH1.two_coordinates`: For a local homomorphism 2o_j+3ℓ_j, the extracted coefficients are (2,3), not the reversed pair.


**Uses.** GS.1 dimension and algebraic invariant: Supplies the coefficient matrices. DKV18 §1.4: Explains why a single normalized rank-one class is inadequate in higher rank.

**Acceptance.** The logarithm coefficient is not normalized to 1 separately at each prime. Class representatives have the same local maps at R since local coboundaries vanish.

**Dependencies.** `GS.1/restricted-cohomology`, `GS.1/inertia-injectivity`.

**Sources.** [DKV18](#references), §1.2, pp. 838–839. The cyclotomic local subspaces and coefficient matrices define the algebraic invariant.

### Dimension of the cyclotomic subspace

**Target:** `GS.1/cyclotomic-dimension` · **Declaration:** `GrossStark.cyclotomic_dimension`.

The logarithmic-coordinate map H_cyc^1(χ)→E^r is an isomorphism. In particular dim_E H_cyc^1(χ)=r, and for any basis κ_i its logarithm matrix Y has nonzero determinant.

**Construction or proof.**

1. The rational Poitou–Tate exact sequence identifies the image of global restrictions with the annihilator of the dual Kummer space U_χ; use the two local conditions from the Kummer comparison.
2. On W=⊕_j(Eo_j+Eℓ_j), the evaluation map W→U_χ^∨ is onto because its valuation-only summand has matrix O with det O≠0. Its kernel therefore has dimension 2r−r=r. Inertia injectivity identifies that kernel with H_cyc^1.
3. If all logarithm coefficients are zero, every inertia restriction vanishes, so the class is zero. An injective map between two r-dimensional spaces is an isomorphism.


**Acceptance.** This proves the cited dimension statement rather than assuming a higher-rank version of a rank-one lemma. For r=0 it yields the zero subspace.

**Dependencies.** `GS.1/cyclotomic-subspace`, `GS.1/inertia-injectivity`, `GS.1/kummer-identification`, `GS.0/valuation-isomorphism`, `ArithmeticGaloisDuality:R02.4/lattice-rational-poitou-tate`.

**Sources.** [DKV18](#references), §1.2, p. 839. The paper cites the dimension and nonzero logarithm determinant. [DDP11](#references), Lemma 1.5 and its proof, pp. 455–456. The exact duality sequence and valuation-surjectivity argument supply the rank-one model, here extended to all r factors.

### Greenberg’s algebraic invariant

**Target:** `GS.1/algebraic-invariant`.

For an ordered basis κ_i of H_cyc^1(χ), set L_alg(χ)=det X/det Y, using the local coefficient convention x_ij o_j+y_ij ℓ_j. This scalar is independent of the basis, and the zero-rank value is 1.

**Hypotheses and conventions.** Y is invertible by the cyclotomic dimension theorem.

**Construction or proof.**

1. A basis change left-multiplies X and Y by the same invertible matrix. Determinant multiplicativity cancels that factor.
2. Use the empty determinant convention at rank zero.


**API.**

- `GrossStark.algebraicInvariant` (constructor): The scalar det X/det Y for a basis of H_cyc^1.
- `GrossStark.algebraicInvariant_basis_change` (functoriality): Common left multiplication by P∈GL_r(E) preserves the ratio.
- `GrossStark.algebraicInvariant_zero_rank` (simp): For r=0, L_alg=1.
- `GrossStark.algebraicInvariant_local_reindex` (compatibility): Reindexing the exceptional primes permutes the columns of both X and Y and preserves the ratio.


**Checks.**

- `GrossStark.algebraicInvariant.rank_one`: For X=(2), Y=(3), the value is 2/3.
- `GrossStark.algebraicInvariant.empty`: For the zero space it is 1.
- `GrossStark.algebraicInvariant.scaled_basis`: For X=diag(2,5), Y=diag(3,7), multiplying both on the left by diag(4,1) leaves the value 10/21.


**Uses.** DKV18 §1.2: Recasts the arithmetic regulator in cohomological coordinates. GS.5: Provides an independent consistency check of the final sign.

**Acceptance.** The ratio has no extra (−1)^r: the regulator carries its own negative logarithms.

**Dependencies.** `GS.1/cyclotomic-dimension`, `mathlib:Matrix.det_mul`.

**Sources.** [DKV18](#references), §1.2, unnumbered definition of the algebraic invariant, p. 839. The ratio of local coefficient determinants is the algebraic invariant.

### Cohomological formula for the regulator

**Target:** `GS.1/algebraic-regulator-comparison` · **Declaration:** `GrossStark.algebraic_regulator_comparison`.

L_alg(χ)=R_p(χ). For any unit basis and cyclotomic class basis, orthogonality reads XO+YL=0, so det X/det Y=det(−L)/det O.

**Construction or proof.**

1. Evaluate each local coefficient identity on every u_j and apply either orthogonality theorem.
2. Solve X=−YLO^{-1}; use det O≠0 and det Y≠0 and determinant multiplicativity.


**Acceptance.** At r=1 the relation is x·o(u)+y·ℓ(u)=0 and x/y=−ℓ(u)/o(u).

**Dependencies.** `GS.1/algebraic-invariant`, `GS.1/orthogonality-duality`, `GS.1/orthogonality-reciprocity`, `GS.0/gross-regulator`, `mathlib:Matrix.det_mul`.

**Sources.** [DKV18](#references), §1.2, unnumbered comparison following Proposition 1, p. 839. Orthogonality identifies the cohomological invariant with Gross’s signed regulator.

**Layer acceptance.** Every target and Check above holds with the common sign and topology conventions, and every direct supplier contract is discharged at the stated generality. The global end theorem is reached only after GS.5.

## GS.2 — Weight-one families and cuspidal projection

Pin weight, logarithm and reciprocity conventions in the supplied ordinary Hilbert theory. Construct Ventullo’s auxiliary family and the Gross–Stark semi-cusp family. Prove the normalized cuspidal projection theorem, retaining the normalized projection even when its weight-one value vanishes at w=−1, and establish the exhaustive three-case division without assuming exact order.

**Layer inputs:** `GS.0`, `PadicFamilies:L0a`, `PadicFamilies:L5`, `AutomorphicPadicLFunctions:L3`, `DirichletPadicLFunctions:L3`, `IntegralIwasawaTheory:I.1`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`. Individual targets below give the direct dependency list.

### Weight-one coordinate and cyclotomic character

**Target:** `GS.2/weight-coordinate`.

Put Λ=O_E[[T]], ν_k(T)=u^{k−1}−1, with u=1+p for odd p and u=5 for p=2. Its localization Λ_(1) at (T) is an E-algebra DVR with uniformizer π=T/log_p(u). The supplied universal cyclotomic character is ε(σ)=(1+T)^{log_p⟨ε_cyc(σ)⟩/log_p(u)}. The principal part ⟨·⟩ uses μ_{p−1} for odd p and {±1} for p=2. Identify this coordinate with the supplier’s parallel-weight line.

**Hypotheses and conventions.** The binomial character and ordinary weight algebra are supplied objects; this node fixes their normalization and change of coordinate.

**Construction or proof.**

1. Import the parent’s arithmetic cyclotomic character and supplied weight-space line. Localize at its augmentation prime, which does not contain p.
2. The derivative of u^{k−1} at k=1 is log_p(u), giving ν_k(π)=(k−1)+O((k−1)^2).
3. Substitute the principal cyclotomic value in the binomial character and take its linear coefficient.


**API.**

- `GrossStark.weightOneCoordinate` (data): The coordinate π=T/log_p(u) on the supplied localized parallel-weight algebra.
- `GrossStark.weightOneCoordinate.specialize` (simp): ν_k(π)=(u^{k−1}−1)/log_p(u).
- `GrossStark.weightOneCoordinate.leadingCoefficient` (compatibility): The π-leading coefficient is the corresponding divided k-derivative at 1.
- `GrossStark.weightOneCoordinate.cyclotomic_linear` (simp): ε(σ)=1+log_p⟨ε_cyc(σ)⟩π modulo π².
- `GrossStark.weightOneCoordinate.inverse_character` (compatibility): Inverting the cyclotomic character negates the linear logarithm coefficient.


**Checks.**

- `GrossStark.weightCoordinate.dyadic`: At p=2, u=5 and the principal part of −1 is 1, so ε of a cyclotomic value −1 equals 1.
- `GrossStark.weightCoordinate.first_derivative`: The germ π has first k-derivative 1, while T has first derivative log_p(u).
- `GrossStark.weightCoordinate.reflection`: If f(z)=a z²+b z³+O(z⁴), then f(1−k) has leading π² coefficient a; a first-order term changes sign.


**Uses.** DKV18 §§3 and 5: Controls every sign and derivative normalization. GS.4 diagonal characters: Supplies the principal cyclotomic deformation.

**Acceptance.** If h=π^n h′ with ν_1(h′)≠0 then d^nν_k(h)/dk^n at 1, divided by n!, is ν_1(h′). For ℒ_χ with ν_k(ℒ_χ)=f_χ(1−k), its leading coefficient is (−1)^s D_χ L*_an(χ).

**Dependencies.** `GS.0/analytic-invariant`, `PadicFamilies:L5`, `DirichletPadicLFunctions:L3`, `mathlib:PowerSeries.coeff`, `mathlib:PowerSeries.X`, `IntegralIwasawaTheory:I.1`.

**Sources.** [DKV18](#references), §3.1, (25)–(27), p. 846. The weight convention and normalized uniformizer identify Taylor coefficients with weight derivatives.

### Eisenstein and ordinary-family dictionary

**Target:** `GS.2/eisenstein-dictionary` · **Declaration:** `GrossStark.eisenstein_dictionary`.

Transport the supplied ordinary Hilbert modules M^o(n,χ), S^o(n,χ), full/cuspidal Hecke algebras T̃,T and q-expansions to this weight convention. The supplied ordinary family E(1,χ) has away-from-np eigenvalue 1+χε(l), every standard-cusp constant 2^{−[F:Q]}ℒ_χ, and weight-one specialization E_1(1,χ_S), where S is all primes above p. When R′=∅, also use the ordinary family E(χ,1), with eigenvalue χ(l)+ε(l) and the same weight-one specialization. For R′⊆J⊆S, the imprimitive classical series satisfy (U_q−1)E_1(1,χ_J)=E_1(1,χ_{J∪{q}}) when q∉J and 0 when q∈J.

**Hypotheses and conventions.** The conductor/tame-level convention is that of DKV18; the supplier must include imprimitive Euler deletions and all standard cusps. For the primitive level-one weight-one series, include both constant-term contributions L(χ,0) and χ^{-1}(λ)L(χ^{-1},0); the single-term formula does not cover this exception. The paired ordinary family E(χ,1) and its common weight-one specialization are required only when R′=∅; no such ordinary common specialization is asserted for general R′.

**Construction or proof.**

1. Match the supplied Fourier coefficient formula ∑_{a|b,(a,modulus)=1}η(a)Na^{k−1} and its two-character version to ν_k.
2. Apply its ordinary stabilization and constant-term formulas, retaining the level-one weight-one exception.
3. Compare divisor-sum Fourier coefficients after adjoining one exceptional prime to the modulus to obtain the U_q relation. The supplied q-expansion principle gives the identities of forms.


**Acceptance.** There is no new construction of Deligne–Ribet L-functions or Hilbert modular forms here. Every Fourier-coefficient map used below is injective on the supplied cusp module.

**Dependencies.** `GS.2/weight-coordinate`, `AutomorphicPadicLFunctions:L3/hilbert-eisenstein-series`, `AutomorphicPadicLFunctions:L3/eisenstein-constant-terms`, `AutomorphicPadicLFunctions:L3/padic-q-expansion-principle`, `AutomorphicPadicLFunctions:L3/padic-hilbert-modular-forms`, `PadicFamilies:L0a/profinite-ordinary-projector`, `PadicFamilies:L5`.

**Sources.** [DKV18](#references), §3.1–§3.3, pp. 847–851, especially footnote 6 and (35); §3.4, p. 854. The required specialization, Fourier coefficients, constants and stabilization identities are fixed by these formulas.

### Ventullo’s constant-term-one family

**Target:** `GS.2/ventullo-family`.

Construct G∈M^o(1,ω^{-1})_(0) such that ν_0(G)=1 and every standard-cusp constant is identically 1. The shifted family G^♭(T)=G((1+T)u^{-1}−1) is regular at weight one, has ν_1(G^♭)=1 and ν_k(G^♭)=ν_{k−1}(G). No Leopoldt hypothesis is imposed.

**Hypotheses and conventions.** Use the all-prime Hilbert ordinary modules, integral q-expansion principle and change-of-level maps in the supplier contracts.

**Construction or proof.**

1. Use the supplied theta-series/Hasse-invariant lifts to produce an auxiliary-level p-adic form with specialization 1 and constants congruent to 1 on a sufficiently small weight neighborhood.
2. Take the convergent binomial powers on that neighborhood; apply the integral q-expansion principle to obtain a family with all constant terms 1, as in Ventullo Theorem 2.
3. Remove the auxiliary prime q by the trace combination (W_q+U_q)/(1+Nq^{-1}) and apply the ordinary projector on integral finite quotients before weight localization. Check that both operations preserve the constants and weight-zero value.
4. Pull back by the displayed affine weight change.


**API.**

- `GrossStark.ventulloFamily` (constructor): The family G over the supplied Hilbert-form carrier with all standard-cusp constants 1.
- `GrossStark.ventulloFamily.weight_zero` (simp): ν_0(G)=1 as a q-expansion, including the constant coefficient.
- `GrossStark.ventulloFamily.constant` (simp): For every standard cusp λ, c_λ(0,G)=1.
- `GrossStark.ventulloFamily.shift` (data): G^♭ is the pullback under T↦(1+T)u^{-1}−1.
- `GrossStark.ventulloFamily.shift_specialize` (compatibility): ν_k(G^♭)=ν_{k−1}(G), hence ν_1(G^♭)=1.


**Checks.**

- `GrossStark.ventulloFamily.constant_qexp`: At weight zero every positive Fourier coefficient is zero and the constant coefficient is 1; a zero family fails.
- `GrossStark.ventulloFamily.every_cusp`: For a totally real field with more than one narrow ideal class, the constant at each indexed standard cusp is 1, not only at one selected cusp.
- `GrossStark.ventulloFamily.shift_at_one`: The shift at weight one evaluates G at T=u^{-1}−1, its weight-zero point; the unshifted G does not meet this identity by definition.


**Uses.** GS.2 semi-cusp family: Cancels the standard-cusp constants exactly. DKV18 §3.3: Its shifted specialization turns the leading correction into a classical weight-one Eisenstein series.

**Acceptance.** The construction uses Ventullo’s unconditional argument, not the older Leopoldt-dependent Eisenstein substitute. At p=2 denominators are inverted in the E-localization, with the integral convergence step performed first.

**Dependencies.** `GS.2/eisenstein-dictionary`, `AutomorphicPadicLFunctions:L3`, `PadicFamilies:L5`, `PadicFamilies:L0a/profinite-ordinary-projector`.

**Sources.** [DKV18](#references), Lemma 3.1 and the weight-shift identity, p. 848. The auxiliary family and the change from weight zero to weight one are used in the cusp construction. [V15](#references), Theorem 2 and §§4.1–4.2, pp. 14–20. The auxiliary-level construction, binomial family and level removal yield the family without Leopoldt.

### Three cases without an exact-order assumption

**Target:** `GS.2/case-division` · **Declaration:** `GrossStark.case_division`.

For r≥1 let s=ord_0 f_χ≥r. If R′≠∅ use Case 1. If R′=∅, let t=ord_0 f_{χ^{-1}}≥r and W=(ℒ_χ/ℒ_{χ^{-1}})L(χ^{-1},0)/L(χ,0). Its order at weight one is s−t. By interchanging χ and χ^{-1} first, arrange s≥t, so W is regular. Then Case 2 has w=ν_1(W)≠0 and s=t; Case 3 has w=0 and s>t. In Case 2 both oriented characters can be treated; in Case 3 the proof must establish the result for both χ and χ^{-1}.

**Hypotheses and conventions.** This division is used only for r≥1; rank zero is handled directly by interpolation.

**Construction or proof.**

1. Nonzero analytic germs have finite orders, and the weight-coordinate dictionary preserves those orders.
2. The ratio W has order s−t and is inverted on interchanging the characters.
3. A regular element of a DVR is either a unit or has positive order. Character inversion preserves R and r.


**Acceptance.** The value w=−1 belongs to Case 2 and is retained. No equality s=r or t=r is assumed.

**Dependencies.** `GS.0/order-lower-bound`, `GS.2/weight-coordinate`.

**Sources.** [DKV18](#references), §3.2, (30)–(31) and case division, p. 849. The proof permits unequal analytic orders and treats both orientations in Case 3.

### Gross–Stark semi-cusp family

**Target:** `GS.2/semicusp-family`.

For r≥1 construct F̃∈M(n,χ)_(1). In Case 1 put F̃=E(1,χ)−E_1(1,χ_{R′})G^♭ℒ_χ/D_χ. For R′=∅ put F̃=E(1,χ)−E_1(1,χ)G^♭ℒ_χ/L(χ,0)+E(χ,1)W. Every standard-cusp constant vanishes. At weight one the value is E_1(1,χ_S) in Cases 1 and 3 and (1+w)E_1(1,χ_S) in Case 2, so it is zero when w=−1.

**Construction or proof.**

1. Use the preceding dictionary, the regular ratio W and Ventullo’s family to form the products in the supplied module.
2. In Case 1 divide by the nonzero D_χ. In the empty-R′ case retain both primitive weight-one constant terms; the added second Eisenstein family cancels the additional term.
3. Use the all-prime lower bound s≥r≥1 to set ℒ_χ to zero at weight one and then specialize the other summands.


**API.**

- `GrossStark.semicuspFamily` (constructor): The displayed case-dependent linear combination in the actual supplied Hilbert-form module.
- `GrossStark.semicuspFamily.constant_zero` (simp): Every indexed standard-cusp constant vanishes identically.
- `GrossStark.semicuspFamily.specialize_one` (compatibility): The weight-one specialization is E_S or (1+w)E_S in the stated cases.
- `GrossStark.semicuspFamily.correction_leading` (simp): In Case 1 the subtracted product is (−1)^s L*_an(χ)π^s E_1(1,χ_{R′}) modulo π^{s+1}.
- `GrossStark.semicuspFamily.regular` (structure): Every coefficient belongs to the weight-one localization.


**Checks.**

- `GrossStark.semicuspFamily.case_one`: For R′ nonempty its ν_1-value is the nonzero ordinary stabilized Eisenstein series, since s≥1.
- `GrossStark.semicuspFamily.w_minus_one`: For R′ empty and w=−1 its ν_1-value is zero; an asserted universal nonzero specialization fails.
- `GrossStark.semicuspFamily.odd_order_sign`: For s=1 the leading subtracted correction is −L*_an(χ)πE_{R′}; for s=2 its sign is positive.


**Uses.** GS.3 Hecke action: Its correction and the U_q identities give the nilpotent relations. GS.2 cuspidal projection: Provides the standard-cusp-zero input.

**Acceptance.** Vanishing standard-cusp constants is not yet the assertion of cuspidality at all cusps. A zero specialization at w=−1 is allowed and must survive the subsequent orbit argument.

**Dependencies.** `GS.2/ventullo-family`, `GS.2/eisenstein-dictionary`, `GS.2/case-division`, `GS.0/analytic-invariant`.

**Sources.** [DKV18](#references), §3.2, (28)–(31), pp. 848–849. The two corrected combinations cancel the constants and have regular weight-one germs.

### Normalized cuspidal projection

**Target:** `GS.2/normalized-cuspidal-projection` · **Declaration:** `GrossStark.normalized_cuspidal_projection`.

There exists t∈T̃_(1) such that F=t e F̃ is in S^o(n,χ)_(1) and ν_1(t)E_1(1,χ_S)=E_1(1,χ_S). Thus the weight-one normalization of t is fixed, although F itself has zero specialization when w=−1. The projected family has the same Hecke-leading identities required in GS.3.

**Construction or proof.**

1. Use the supplied Eisenstein decomposition of the ordinary boundary and the vanishing of the standard-cusp constants of F̃. For the two boundary systems indexed by η=1 and η=χ, the standard-cusp equations remove the first; when R′=∅, the paired-family cancellation in F̃ removes the second as well. Use Ventullo’s family from the preceding construction, so this step imports no Leopoldt assumption from DDP11.
2. For the other boundary systems, η≠1,χ, choose away-from-np Hecke operators separating their weight-one eigensystems from E_S by Chebotarev. In Case 1 the η=χ system can have the same away-from-np eigenvalues as E_S: if it survives the ordinary projector, choose q∈R′ and use U_q−χ(q), which kills that boundary system and acts on E_S by 1−χ(q)≠0. If it is nonordinary it was already killed by e. Multiply the separating operators and normalize their nonzero E_S eigenvalue to 1.
3. The resulting t kills the boundary of eF̃. Commutativity lets every Hecke congruence and leading correction pass through t e; ν_1(t)E_S=E_S preserves the top stabilization term.


**Acceptance.** The equation ν_1(t)E_S=E_S is essential; t=0 is not a valid choice. Use the stronger normalized version retained in arXiv v1, not merely the published existence statement. On the finite weight-one generalized Eisenstein stabilization space the normalized t has eigenvalue 1 plus nilpotent terms, so is invertible; this preserves the independence used in all three Hecke-image proofs. In Case 1, a surviving η=χ boundary family is removed using a U_q operator for q∈R′; away-from-np operators alone do not distinguish its weight-one eigenvalues from E_S.

**Dependencies.** `GS.2/semicusp-family`, `GS.2/eisenstein-dictionary`, `PadicFamilies:L5`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `AutomorphicPadicLFunctions:L3`.

**Sources.** [DKV18](#references), Theorem 3.2, p. 849. Cuspidality is asserted here; the normalization must be restored. [DKV16](#references), Theorem 3.2, p. 16. The preprint includes the normalization on the weight-one Eisenstein series. [DDP11](#references), Lemma 2.9 and Corollary 2.10, pp. 469–470; Propositions 3.3–3.4 and Lemma 3.5, pp. 472–474. The boundary decomposition and separation argument supplies the linear algebra, including U_q separation in Case 1; the auxiliary family is supplied by V15 rather than the Leopoldt-dependent input in DDP11.

**Layer acceptance.** Every target and Check above holds with the common sign and topology conventions, and every direct supplier contract is discharged at the stated generality. The global end theorem is reached only after GS.5.

## GS.3 — Infinitesimal Hecke quotients

Define the three actual Artin quotient rings with their nilpotent relations, bases, dimensions and needed nonzero graded classes. Compute the Hecke orbit and the quotient homomorphism in each case, including the w=−1 case and the Case 3 independence argument.

**Layer inputs:** `GS.2`, `AutomorphicPadicLFunctions:L3`, `PadicFamilies:L5`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `DirichletPadicLFunctions:L3`. Individual targets below give the direct dependency list.

### Case 1 Artin algebra

**Target:** `GS.3/case-one-ring`.

For r≥1, s≥r and a=L*_an(χ)≠0 define W₁=E[π,ε_1,…,ε_r]/(π^{s+1}, ε_i², πε_i, ε_1⋯ε_r+(−1)^s aπ^s). Its Λ_(1)-algebra structure sends the normalized uniformizer to π, and its residue augmentation sends all displayed generators to zero.

**Construction or proof.**

1. Take the quotient of the polynomial algebra by the displayed finitely generated ideal, using the supplied weight-coordinate map.
2. The forthcoming normal form proves that the residue map has nilpotent kernel and residue field E.


**API.**

- `GrossStark.caseOneRing` (constructor): The displayed quotient over E with its Λ_(1)-algebra structure.
- `GrossStark.caseOneRing.nilpotent_relations` (simp): π^{s+1}=ε_i²=πε_i=0.
- `GrossStark.caseOneRing.top_product` (relation): ∏ε_i=(−1)^{s+1}aπ^s.
- `GrossStark.caseOneRing.residue` (projection): The augmentation has residue E and kernel generated by π and the ε_i.
- `GrossStark.caseOneRing.lift` (universal-property): Commuting elements in an E-algebra satisfying these relations define a unique homomorphism from W₁.


**Checks.**

- `GrossStark.caseOneRing.rank_one`: For r=s=1, ε_1=aπ and W₁≅E[π]/π².
- `GrossStark.caseOneRing.excess_order`: For r=1,s=2, ε_1=−aπ²; in m/m² its class is zero although ε_1 is nonzero in W₁.
- `GrossStark.caseOneRing.disjoint_products`: For r=2, ε_1²=0 but ε_1ε_2=(−1)^{s+1}aπ^s is nonzero; setting all products to zero is wrong.


**Uses.** GS.3 Case 1 map: Identifies the actual Hecke image. GS.5: Uses the nonzero π^r class and the top product relation.

**Acceptance.** The empty product is never imposed as a relation: this construction is restricted to r≥1.

**Dependencies.** `GS.2/case-division`, `GS.2/weight-coordinate`.

**Sources.** [DKV18](#references), Theorem 3.3, pp. 850–852. This quotient records the Case 1 Hecke relations.

### Case 2 Artin algebra

**Target:** `GS.3/case-two-ring`.

For r≥1, s≥r and regular W with w=ν_1(W)≠0, define W₂=E[π,ε_1,…,ε_r,y]/(π^{s+1},y^{s+1},y(π−y),π^sW−y^s(W+1),ε_i²,πε_i,yε_i,∏ε_i+(−1)^s a(π^s−y^s)), with a=L*_an(χ)≠0. Interpret W by its π-Taylor polynomial modulo π^{s+1}. The augmentation and weight-coordinate structures are the displayed ones.

**Construction or proof.**

1. Use the actual π-Taylor image of W in the polynomial quotient, so the definition does not require a choice of representative.
2. The relations imply π^sW=wπ^s and y^s(W+1)=(w+1)y^s. The normal form proves locality and finite dimension.


**API.**

- `GrossStark.caseTwoRing` (constructor): The displayed quotient with the actual Taylor image of W.
- `GrossStark.caseTwoRing.mixed_relations` (simp): yπ=y² and ε_iπ=ε_iy=ε_i²=0.
- `GrossStark.caseTwoRing.top_weight` (relation): wπ^s=(w+1)y^s, including w=−1.
- `GrossStark.caseTwoRing.top_product` (relation): ∏ε_i=(−1)^{s+1}a(π^s−y^s).
- `GrossStark.caseTwoRing.lift` (universal-property): The quotient represents commuting elements satisfying all its displayed relations.


**Checks.**

- `GrossStark.caseTwoRing.dual_numbers`: For r=s=1 and w≠0,−1, y=wπ/(1+w) and ε_1=aπ/(1+w).
- `GrossStark.caseTwoRing.minus_one`: For w=−1, π^s=0 but y^s≠0 and (π−y)^s=−y^s≠0.
- `GrossStark.caseTwoRing.top_difference`: For any w≠0, π^s−y^s=y^s/w; replacing the difference by π^s loses the w=−1 case.


**Uses.** GS.3 Case 2 map: Accounts for both Eisenstein directions and their common top term. GS.5: The relevant graded class is (π−y)^r.

**Acceptance.** The case w=−1 is included; neither w+1 nor π^s is assumed invertible or nonzero.

**Dependencies.** `GS.2/case-division`, `GS.2/weight-coordinate`.

**Sources.** [DKV18](#references), §3.4, definition before Theorem 3.6, p. 853. This quotient retains the extra Eisenstein direction when W is a unit.

### Case 3 Artin algebra

**Target:** `GS.3/case-three-ring`.

For r≥1 and s>t≥r write W=π^{s−t}W₀ with c=ν_1(W₀)=(−1)^{s−t}L*_an(χ)/L*_an(χ^{-1})≠0. Define W₃=E[π,ε_1,…,ε_r,y]/(π^{s+1},y^{t+1},y(π−y),π^tW−y^t,ε_i²,πε_i,yε_i,∏ε_i+(−1)^s aπ^s), where a=L*_an(χ). Thus y^t=cπ^s. Its residue and weight structures are the same augmentations.

**Construction or proof.**

1. Substitute the Taylor image of W and take the displayed quotient.
2. Since π^tW=cπ^s modulo π^{s+1}, the only surviving top weight relation is y^t=cπ^s.


**API.**

- `GrossStark.caseThreeRing` (constructor): The displayed quotient with its Λ_(1)-algebra structure.
- `GrossStark.caseThreeRing.top_weight` (relation): y^t=cπ^s with c=(−1)^{s−t}L*_an(χ)/L*_an(χ^{-1}).
- `GrossStark.caseThreeRing.top_product` (relation): ∏ε_i=(−1)^{s+1}aπ^s=(−1)^{t+1}L*_an(χ^{-1})y^t.
- `GrossStark.caseThreeRing.nilpotence` (simp): y^{t+1}=π^{s+1}=ε_i²=πε_i=yε_i=0.
- `GrossStark.caseThreeRing.lift` (universal-property): Commuting elements satisfying exactly these relations give a unique quotient map.


**Checks.**

- `GrossStark.caseThreeRing.small`: For r=t=1,s=2, y=cπ² and ε_1=−aπ²; the ring has basis 1,π,π².
- `GrossStark.caseThreeRing.filtration`: In that example y is nonzero but its class in m/m² is zero; its class in yW₃/y²W₃ is nonzero.
- `GrossStark.caseThreeRing.inverse_sign`: For s=t+1, c=−a/L*_an(χ^{-1}); the inverse-character top-product formula has sign (−1)^{t+1}.


**Uses.** GS.3 Case 3 map: The additional relations identify the actual Hecke image. GS.5 inverse character: The nonzero line y^rW₃/y^{r+1}W₃ permits the second determinant comparison.

**Acceptance.** The y-adic filtration differs from the maximal-ideal filtration: y^t lies in m^s.

**Dependencies.** `GS.2/case-division`, `GS.2/weight-coordinate`.

**Sources.** [DKV18](#references), §3.5 and Theorem 3.8, pp. 855–856. The unequal-order case needs the stronger y-nilpotence and top weight relation.

### Normal form in Case 1

**Target:** `GS.3/case-one-normal-form` · **Declaration:** `GrossStark.case_one_normal_form`.

An E-basis of W₁ is 1,π,…,π^{s−1} together with ε_J=∏_{j∈J}ε_j for every nonempty J⊆R. Its dimension is 2^r+s−1. Equivalently one may use π^s and omit ε_R. For m=(π,ε_i), π^r is nonzero in m^r/m^{r+1}.

**Construction or proof.**

1. Reduce every monomial containing repeated ε_i or a mixed π factor to zero; all remaining monomials are powers of π and squarefree ε-products.
2. Use the single top relation with a≠0 to eliminate either π^s or ε_R. Define multiplication on the proposed basis by these reductions; the only overlap involving the eliminated top term multiplies it by m and both reductions give zero. Thus the reduction map is well defined and proves independence.
3. If s=r the surviving top line is identified with ε_R. If s>r, no relation reaches the π^r monomial in degree r+1.


**Acceptance.** Verify dimensions for r=1,2 and for s>r; the basis count uses 2^r, not 2^s.

**Dependencies.** `GS.3/case-one-ring`.

**Sources.** [DKV18](#references), Proof of Theorem 3.3, pp. 851–852; §5.1, p. 867. The explicit monomial basis and the nonzero degree-r weight class are needed for the Hecke and determinant arguments.

### Normal form in Case 2

**Target:** `GS.3/case-two-normal-form` · **Declaration:** `GrossStark.case_two_normal_form`.

An E-basis of W₂ is 1,π,…,π^{s−1}, y,…,y^s and ε_J for ∅≠J⊊R. Hence dim_E W₂=2^r+2s−2. If z=π−y then z^n=π^n−y^n for n≥1; z^r has nonzero class in m^r/m^{r+1}. The entire degree-r quotient is not asserted to be one-dimensional when s>r.

**Construction or proof.**

1. Use πy=y² to reduce mixed powers to pure y powers and the squarefree relations to remove mixed ε terms.
2. Since w≠0 eliminate π^s using π^s=(w+1)y^s/w, and eliminate ε_R using its nonzero top-difference relation. This works at w=−1 as well.
3. Construct multiplication on the indicated basis by the reduced rules; overlapping top relations annihilate m, so the reduction is associative and independent. Count the basis.
4. At r=s, z^r=y^s/w is a nonzero top basis element. At r<s, π^r−y^r survives modulo degree r+1 because its two pure-power terms have no relation of that degree.


**Acceptance.** At w=−1 use y^s as the surviving top element, not π^s. The published dimension formula is corrected to 2^r+2s−2.

**Dependencies.** `GS.3/case-two-ring`.

**Sources.** [DKV18](#references), Proof of Theorem 3.6, pp. 854–855; §5.1, pp. 867–868. The stated basis gives the corrected dimension and the nonzero weight-difference class.

### Normal forms and two filtrations in Case 3

**Target:** `GS.3/case-three-normal-form` · **Declaration:** `GrossStark.case_three_normal_form`.

An E-basis of W₃ is 1,π,…,π^s, y,…,y^{t−1}, and ε_J for ∅≠J⊊R; its dimension is 2^r+s+t−2. For z=π−y, z^r is nonzero in m^r/m^{r+1}. Separately, m·yW₃=y²W₃, and for 1≤n≤t the quotient y^nW₃/y^{n+1}W₃ is one-dimensional over E with generator y^n.

**Construction or proof.**

1. Reduce mixed πy powers using πy=y². Replace y^t by cπ^s and ε_R by its π^s multiple. Remove repeated ε and all weight-ε mixed monomials.
2. The reduced basis defines an associative multiplication: multiplying either top relation by m is zero, so the possible overlaps agree. This proves independence and dimension.
3. Since r≤t<s, the π^r term of z^r cannot enter m^{r+1}; if r=t the term y^r=cπ^s is already of higher maximal-ideal order and does not cancel it.
4. Multiplication of y by π or y gives y² and by ε_i gives zero. Thus y^nW₃ is spanned by y^n,…,y^t, with y^t=cπ^s≠0. Its successive quotient has precisely the indicated basis.


**Acceptance.** Do not replace the final y-adic line by m^r/m^{r+1}: it can vanish there when r=t<s.

**Dependencies.** `GS.3/case-three-ring`.

**Sources.** [DKV18](#references), Theorem 3.8, p. 856; §5.2, pp. 867–868. The quotient basis and y-adic line are the algebra needed in the unequal-order argument.

### Fourier Hecke orbit and auxiliary operator

**Target:** `GS.3/hecke-orbit`.

Let F=t e F̃. Under the supplied injective Fourier map c:S^o_(1)→∏_aΛ_(1), let H be the image of its Hecke span modulo π^{s+1}; it is a finite E[π]/π^{s+1}-module. The actual Hecke action gives φ:T→End(H). When R′=∅ choose q∤np with χ(q)≠1 and define Y=(T_q−1−χε(q))/((χ(q)−1)(1−ε(q))/π) in T̃_(1). The denominator is a unit: its residue is −(χ(q)−1)log_p⟨Nq⟩≠0. Its image in the orbit is denoted y.

**Hypotheses and conventions.** All reductions are coefficientwise after the q-expansion injection. The prime q is selected by the supplied Chebotarev theorem; a positive rational norm greater than 1 has nonzero p-adic principal-part logarithm.

**Construction or proof.**

1. Use the supplied finite ordinary cusp module and q-expansion injection; its truncated image is finite over the finite-dimensional coefficient algebra.
2. Restrict the commuting Hecke action to the cyclic orbit.
3. In the empty-R′ case use the cyclotomic linear coefficient and prime selection to invert the indicated scalar in the weight-one localization.


**API.**

- `GrossStark.fourierHeckeOrbit` (constructor): The finite truncated image of the actual Hecke span of F.
- `GrossStark.fourierHeckeOrbit.action` (structure): The induced algebra homomorphism T→End(H).
- `GrossStark.fourierHeckeOrbit.cyclic` (characterisation): The vector c(F) generates H as a T-module.
- `GrossStark.fourierHeckeOrbit.operatorY` (data): For R′ empty, the normalized operator Y with the displayed unit denominator.
- `GrossStark.fourierHeckeOrbit.Y_leading` (compatibility): YF̃≡πE(χ,1)W modulo π^{s+1}; Y² acts as πY on H.


**Checks.**

- `GrossStark.fourierHeckeOrbit.zero_action`: An operator killing F kills its entire orbit by Hecke commutativity.
- `GrossStark.fourierHeckeOrbit.truncation`: The operator π^{s+1} acts as zero, while the top terms used in the normal-form proofs remain visible.
- `GrossStark.fourierHeckeOrbit.Y_denominator`: If χ(q)=1 the displayed denominator is not a unit and that q is inadmissible; if χ(q)≠1 it has the stated nonzero residue.


**Uses.** GS.3 all three maps: Constructs rather than assumes the infinitesimal eigenvalue homomorphism. GS.4: Supplies its Eisenstein maximal ideal and residue E.

**Acceptance.** φ is the action on an actual module, not an algebra map postulated to satisfy the desired eigenvalues. Changing q changes the representative Y but its image is the same y once the Hecke-image identification is proved.

**Dependencies.** `GS.2/normalized-cuspidal-projection`, `GS.2/weight-coordinate`, `AutomorphicPadicLFunctions:L3/padic-q-expansion-principle`, `PadicFamilies:L5`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `DirichletPadicLFunctions:L3`.

**Sources.** [DKV18](#references), §3.3, (32), p. 850; §3.4, (40) and definition of Y, p. 853. The actual Fourier orbit produces the Hecke action and the extra operator.

### Hecke-image identification in Case 1

**Target:** `GS.3/case-one-hecke-map` · **Declaration:** `GrossStark.case_one_hecke_map`.

In Case 1 the E-algebra generated by the actual Hecke action identifies with W₁. It yields a Λ-algebra homomorphism T→W₁ with T_l↦1+χε(l) for l∤np, U_l↦1 for l|n or l∈R′, and U_{q_i}↦1+ε_i.

**Construction or proof.**

1. The leading correction and U_q stabilization identities give ε_i²=πε_i=0 and the top-product relation in W₁; the other eigenvalues follow directly from the two summands of F̃.
2. These relations produce a surjection W₁→φ(T)⊗_{O_E}E. Apply its proposed basis to F. Distinct π-orders separate 1,π,…,π^{s−1}.
3. At order s, the squarefree operators give nonzero multiples of distinct stabilized E_1(1,χ_{R′∪J}). Their q-expansions are independent: choose prime-power ideals with each possible pattern of divisibility by the q_i and use the triangular stabilization matrix. On the finite generalized Eisenstein stabilization space, t has residue eigenvalue 1 and hence acts invertibly; e is the identity there. Thus projection preserves independence as well as the fully stabilized top term. Hence the surjection is injective.


**Acceptance.** The argument proves nonzero top product even when s>r; it does not assume exact order.

**Dependencies.** `GS.3/hecke-orbit`, `GS.3/case-one-normal-form`, `GS.2/eisenstein-dictionary`, `GS.2/semicusp-family`.

**Sources.** [DKV18](#references), Theorem 3.3 and its proof, pp. 850–852. The coefficient identities and independence identify the entire Case 1 image.

### Hecke-image identification in Case 2

**Target:** `GS.3/case-two-hecke-map` · **Declaration:** `GrossStark.case_two_hecke_map`.

In Case 2 the E-algebra generated by the actual Hecke action identifies with W₂, with T_l↦1+χε(l)+(χ(l)−1)((1−ε(l))/π)y for l∤np, U_l↦1+((ε(l)−1)/π)y for l|n, and U_{q_i}↦1+ε_i.

**Construction or proof.**

1. Compute on F̃ that Y²=πY, Y^{s+1}=0, π^sW=Y^s(W+1), ε_i²=πε_i=Yε_i=0 and the top ε-product relation; pass through t e by commutativity.
2. These identities give a surjection W₂→the actual image. For w≠−1, compare the leading terms of π^jF and Y^jF and then apply Y. For their coefficients α,β this gives α(1+w)+βw=0 and α+β=0 (the latter after dividing by w≠0), hence α=β=0. Proceed successively below order s.
3. For w=−1 begin with the order-one pair F,YF and repeat with πF,Y²F. At the last order use that Y kills the stabilized ε_JF and Y^sF but π^{s−1}YF has nonzero leading term.
4. The remaining stabilized Eisenstein q-expansions are independent by the prime-power triangular argument, so the basis maps injectively.


**Acceptance.** Retain w=−1 throughout; no division by w+1 occurs. For r=1,w≠0,−1 the dual-number image of U_l for l|n is 1+(w/(1+w))log_p⟨Nl⟩π, which need not be 1.

**Dependencies.** `GS.3/hecke-orbit`, `GS.3/case-two-normal-form`, `GS.2/eisenstein-dictionary`, `GS.2/semicusp-family`.

**Sources.** [DKV18](#references), Theorem 3.6 and proof, pp. 853–855; Remark 3.7, p. 855. The two-direction action and separate w=−1 independence argument give the corrected image.

### Hecke-image identification in Case 3

**Target:** `GS.3/case-three-hecke-map` · **Declaration:** `GrossStark.case_three_hecke_map`.

In Case 3 the E-algebra generated by the actual Hecke action identifies with W₃ with the same T_l, U_l and U_{q_i} formulas as in Case 2.

**Construction or proof.**

1. The Case 2 action calculation does not use w≠0. The stronger identities Y^{t+1}F=0 and Y^tF=π^tWF give a surjection W₃→the actual image.
2. Put d=s−t≥1 and c=ν_1(W₀)≠0. The form π^jF has order j with leading E_S, while Y^iF has order d+i with leading cE_S. Also Y^tF=cπ^sF, and Y kills every nonempty ε_JF.
3. In a relation among the proposed basis vectors, increasing orders first removes the coefficients of π^jF for j≤d. Induct on m=1,…,t−1. Apply Y^{t−m} to the remaining relation: terms π^jF with j≥d+m vanish modulo π^{s+1}, as their order is at least 2s−t≥s+1. Terms Y^iF with i>m also vanish. The remaining term is the coefficient of Y^mF times cπ^sF, so that coefficient is zero. Comparing order d+m then kills the coefficient of π^{d+m}F.
4. Finally π^sF and ε_JF for proper nonempty J have independent stabilized Eisenstein leading terms by the same triangular q-expansion calculation. This fills the routine independence step left unstated in the source.


**Acceptance.** The proof uses only s>t≥r, not any further order bound. The case t=1 has no Y^i basis vectors and goes directly to the final comparison.

**Dependencies.** `GS.3/hecke-orbit`, `GS.3/case-three-normal-form`, `GS.2/eisenstein-dictionary`, `GS.2/semicusp-family`.

**Sources.** [DKV18](#references), Theorem 3.8 and proof, p. 856. The additional relations and the normal-form independence identify the unequal-order image.

**Layer acceptance.** Every target and Check above holds with the common sign and topology conventions, and every direct supplier contract is discharged at the stated generality. The global end theorem is reached only after GS.5.

## GS.4 — The arithmetic Galois class

Verify the all-prime Hida-family representation and reduced completed Hecke-ring hypotheses for the shared GMA machinery. Choose a simultaneous good element at every prime over p. Construct the actual off-diagonal class by specialization of the common API, refine its diagonal characters, and prove the local conditions, inertia generation and second-order bound.

**Layer inputs:** `GS.1`, `GS.3`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `IntegralHeckeAndGaloisDeterminants:IHG.4`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`, `PadicFamilies:L5`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `ArithmeticGaloisDuality:R02.3`, `GS.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`. Individual targets below give the direct dependency list.

### Actual Hida representations and coefficient ring

**Target:** `GS.4/actual-hida-representations` · **Declaration:** `GrossStark.actual_hida_representations`.

Let m be the Eisenstein prime determined by T→W→E, A=T_(m) and Â its m-adic completion, with residue E. At primitive tame level (the prime-to-p conductor, with the fixed p-part retained in the character), A is a reduced Noetherian localization of the finite Λ-Hecke order, and Â is finite over the completed weight DVR; its total quotient algebra is a finite product of fields attached to actual cuspidal eigenfamilies H. For each H use the supplied continuous irreducible ρ_H:G_F→GL₂(L_H), unramified outside np, with characteristic polynomial X²−T_lX+χε(l) at l∤np and ordinary local shape [[χεη_{q,H}^{−1},*],[0,η_{q,H}]] at every q|p, where η is unramified and η(rec(ϖ^{-1}))=U_q. The product representation extends to the total quotient algebra K of Â.

**Hypotheses and conventions.** The stronger all-prime, arbitrary-degree supplier contract is required; the existing odd-p, even-degree representation node is insufficient. The finite Hecke order and its Eisenstein congruence ideal are closed in the original Λ-adic coefficient topology before localization. The completed reduced coefficient ring, finite over the completed weight DVR, and its total quotient injection are verified by the supplied commutative-algebra/control results.

**Construction or proof.**

1. Apply the supplied ordinary-family finiteness/control and primitive tame-level reducedness theorem. There are no tame old forms in this setting.
2. Use the supplier’s actual irreducible family representations over finite field extensions, rather than only a pseudorepresentation or a semisimple representation over an algebraic closure.
3. The Frobenius coefficients and their Eisenstein congruences extend to all G_F by Chebotarev only after checking the finite-order and congruence-ideal closedness contract.
4. Complete at m and use its finite-field-factor decomposition; keep the injection into its total quotient algebra.


**Acceptance.** Residue characteristic at this height-one prime is zero: 1 and χ remain distinct at p=2. The polynomial has determinant term χε(l), not χ(l) alone. The off-diagonal modules below are not assumed to be rank-one free modules. A height-one localization is not claimed to be a finite module over the uncompleted weight DVR; finiteness after completion uses the completed base.

**Dependencies.** `GS.3/case-one-hecke-map`, `GS.3/case-two-hecke-map`, `GS.3/case-three-hecke-map`, `PadicFamilies:L5`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`, `IntegralHeckeAndGaloisDeterminants:IHG.4`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.** [DKV18](#references), §4 and Theorem 4.1, pp. 856–858; (63)–(64), pp. 860–861. The proof uses actual irreducible family representations, reducedness and closed coefficient orders.

### Simultaneous good Galois element

**Target:** `GS.4/simultaneous-good-element` · **Declaration:** `GrossStark.simultaneous_good_element`.

There exists τ∈G_F with χ(τ)≠1 such that for every field factor H and every q|p the ordinary invariant line of ρ_H|G_q is neither eigenline of ρ_H(τ). This includes the primes in R′ as well as R. The two τ-eigenvalues over the completed coefficient ring reduce to 1 and χ(τ).

**Construction or proof.**

1. For any line v, its stabilizer G_v is closed. If χ(G_v)≠1 and G_v had finite index, diagonalize an element of G_v with distinct residual eigenvalues. The finite off-diagonal module gives a residual cocycle whose restriction to G_v is zero.
2. Finite-index restriction is injective over E by averaging. In the eigenvalue order (1,χ), the lower entry is a χ-cocycle; in the reversed order use the lower entry multiplied by χ^{-1}, a χ^{-1}-cocycle. Write it as a coboundary and evaluate at the diagonal element to force its vector to zero. Nakayama kills the finite off-diagonal module, contradicting irreducibility.
3. A closed infinite-index subgroup of the profinite G_F has empty interior. A finite union of these cannot contain the nonempty open coset χ=χ(τ₀)≠1; intersect their open dense complements successively. Stabilizers contained in ker χ already miss that coset.
4. Choose τ outside the finitely many stabilizers of all ordinary lines over all q|p. Hensel lifting gives its two distinct roots.


**Acceptance.** The source only lists q∈R in Lemma 4.3; the identical finite-avoidance argument is applied to every q|p so that the later R′ calculation has invertible local coefficients. Only ordinary invariant lines are required; no second local eigenline is assumed to exist.

**Dependencies.** `GS.4/actual-hida-representations`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `mathlib:HenselianRing`, `ArithmeticGaloisDuality:R02.3`.

**Sources.** [DKV18](#references), Lemmas 4.2–4.3, pp. 858–860; Lemmas 4.6–4.7, p. 864. Finite-index descent and irreducibility give simultaneous line avoidance; the local application requires all primes above p.

### Arithmetic specialization of the shared extension module

**Target:** `GS.4/adapted-extension-class`.

Use τ to put the product representation in a global eigenbasis ρ(σ)=[[a(σ),b(σ)],[c(σ),d(σ)]], with ρ(τ)=diag(λ₁,λ₂) and residues λ₁=1, λ₂=χ(τ). Apply the shared multiplicity-free GMA API to this actual representation. Then a,d∈Â with residues 1,χ. Let B⊆K be the finite Â-module spanned by b(σ), B̄=B/mB. The function κ(σ)=b̄(σ)χ^{-1}(σ) is a continuous cocycle with values in B̄(χ^{-1}); κ(τ)=0. Its class is formed in the existing continuous H^1 carrier.

**Hypotheses and conventions.** Use the common CH/GMA construction with split distinct residual characters and 2! invertible in E. Use the supplier’s finite-matrix-module/lattice and continuity adapter for this actual family; compactness alone is not asserted to make an arbitrary module finitely generated.

**Construction or proof.**

1. The common henselian multiplicity-free theorem gives idempotents and diagonal integrality; its extension-module API identifies the actual upper off-diagonal span with the appropriate realized GMA component.
2. Verify its coefficient-lattice hypotheses from the actual continuous representation before passing to Â and the quotient B̄. This gives finite generation and continuity with the finite-dimensional p-adic E-topology.
3. Reduce b(στ)=a(σ)b(τ)+b(σ)d(τ) and multiply by χ^{-1}(στ) to obtain the χ^{-1}-cocycle identity.
4. The shared extension injection supplies the interpretation of this cocycle; no new generic Ribet or GMA construction is planned here.


**API.**

- `GrossStark.arithmeticExtensionData` (constructor): The τ-adapted actual representation, finite realized module B and continuous class κ.
- `GrossStark.arithmeticExtensionData.diagonal_residue` (simp): a(σ)≡1 and d(σ)≡χ(σ) modulo m.
- `GrossStark.arithmeticExtensionData.cocycle` (relation): κ(στ)=κ(σ)+χ^{-1}(σ)κ(τ).
- `GrossStark.arithmeticExtensionData.at_tau` (simp): κ(τ)=0 because b(τ)=0 in the eigenbasis.
- `GrossStark.arithmeticExtensionData.commonApi` (compatibility): The class agrees with the realization of the shared GMA off-diagonal extension under the chosen idempotents.
- `GrossStark.arithmeticExtensionData.scalarMap` (functoriality): Every continuous E-linear B̄→V sends κ to the corresponding scalar class and commutes with restriction.


**Checks.**

- `GrossStark.arithmeticExtensionData.twist`: A raw relation b̄(στ)=b̄(τ)+b̄(σ)χ(τ) becomes the displayed left-action cocycle only after multiplication by χ^{-1}(στ).
- `GrossStark.arithmeticExtensionData.coboundary_normalization`: If κ=(χ^{-1}−1)v, its value at τ forces v=0 since χ(τ)≠1; then κ is the zero function.
- `GrossStark.arithmeticExtensionData.nonfree`: For the module-interface check over A=E[[x,y]], B=(x,y)⊂Frac(A) is finite and has dim_E B/(x,y)B=2. The shared finite-module adapter must admit this input; a requirement that every such B be free of rank one would fail it. This check asserts no particular Hida family realizing B.


**Uses.** GS.4 local analysis: Connects the actual ordinary representation to restricted cohomology. GS.5 orthogonality: Its B̄-valued local evaluations give the determinant relation.

**Acceptance.** The cocycle is bχ^{-1}, not b alone. Only the diagonal entries are integral by this argument; no matrix realization over Â or freeness of B is assumed.

**Dependencies.** `GS.4/simultaneous-good-element`, `GS.1/restricted-cohomology`, `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-multiplicity-free`, `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-module`, `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-injection`, `IntegralHeckeAndGaloisDeterminants:IHG.1`.

**Sources.** [DKV18](#references), §4.2, (65)–(69), pp. 861–862. The actual upper-entry module and its normalized cocycle specialize the shared extension machinery.

### Cyclotomic characters in the nilpotent variables

**Target:** `GS.4/infinitesimal-characters`.

For ε(σ)=∑_{j≥0}a_j(σ)π^j, with a₀=1, define ε_y(σ)=∑_j a_j(σ)y^j and ε_z(σ)=∑_j a_j(σ)z^j for z=π−y. These are finite sums in W₂ or W₃ and continuous characters. They satisfy ε_y=1+((ε−1)/π)y, ε_z=1+((ε−1)/π)z and ε_yε_z=ε. Put (ψ₁,ψ₂)=(1,χε) in Case 1 and (ε_y,χε_z) in Cases 2 and 3.

**Construction or proof.**

1. Nilpotence permits substitution in the supplied universal power series character.
2. The relation πy=y², and the corresponding πz=z², turn each series into the displayed linear-in-the-variable expression. Since yz=0, the product is ε.


**API.**

- `GrossStark.infinitesimalCharacters` (constructor): The two characters ψ₁ and ψ₂ on the relevant actual Artin algebra.
- `GrossStark.infinitesimalCharacters.identity` (simp): ε_y(1)=ε_z(1)=1; ψ₁(1)=ψ₂(1)=1.
- `GrossStark.infinitesimalCharacters.product` (relation): ψ₁ψ₂=χε.
- `GrossStark.infinitesimalCharacters.residue` (simp): Modulo m_W the pair is (1,χ).
- `GrossStark.infinitesimalCharacters.linear` (compatibility): Modulo m_W², ε_y(σ)=1+log_p⟨ε_cyc(σ)⟩y and ε_z has the analogous z term.


**Checks.**

- `GrossStark.infinitesimalCharacters.constant`: At σ=1 the value is 1; omitting a₀ gives 0 and fails to be a unit.
- `GrossStark.infinitesimalCharacters.y_zero`: At y=0 one gets ε_y=1 and ε_z=ε.
- `GrossStark.infinitesimalCharacters.mixed`: Since y(π−y)=0, no mixed quadratic term occurs in ε_yε_z; for a generic pair of nilpotents without that relation the product identity fails.


**Uses.** GS.4 diagonal refinement: Identifies the Artin images of a and d. GS.5 inverse-character argument: Controls ε−d on inertia by the ideal yW.

**Acceptance.** The power-series sum starts at j=0, not j=1. The quotient (ε−1)/π is taken in the original weight algebra before substitution.

**Dependencies.** `GS.2/weight-coordinate`, `GS.3/case-two-ring`, `GS.3/case-three-ring`, `mathlib:PowerSeries.coeff`.

**Sources.** [DKV18](#references), §4.3, (70)–(74), p. 862. The nilpotent-variable characters split the infinitesimal trace and determinant.

### Refined diagonal entries

**Target:** `GS.4/diagonal-refinement` · **Declaration:** `GrossStark.diagonal_refinement`.

The Hecke map extends uniquely to φ_m:Â→W. For every σ∈G_F, φ_m(a(σ))=ψ₁(σ) and φ_m(d(σ))=ψ₂(σ).

**Construction or proof.**

1. The target W is an Artin local E-algebra, so localization and completion extend the Hecke homomorphism.
2. The Hecke formulas identify the trace with ψ₁+ψ₂ at Frobenius; the verified closedness and Chebotarev argument extend it to all σ. The determinant is ψ₁ψ₂=χε.
3. The two Hensel roots at τ map to ψ₁(τ),ψ₂(τ). Compare the trace equations at σ and στ; their coefficient determinant is ψ₂(τ)−ψ₁(τ), a unit because its residue is χ(τ)−1. Solve for the two images.


**Acceptance.** This refinement uses actual traces and the τ-diagonal basis; equality of residual traces alone is insufficient.

**Dependencies.** `GS.4/adapted-extension-class`, `GS.4/infinitesimal-characters`, `GS.4/actual-hida-representations`, `IntegralHeckeAndGaloisDeterminants:IHG.4`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.** [DKV18](#references), Lemma 4.4, (72)–(78), pp. 862–863. Trace comparison at σ and στ identifies each diagonal image separately.

### Invertible local comparison coefficients

**Target:** `GS.4/local-basis-comparison` · **Declaration:** `GrossStark.local_basis_comparison`.

For every q|p choose a local ordinary basis and its change matrix M_q=[[A_q,B_q],[C_q,D_q]] to the τ-basis. Then A_q and C_q are units in the total quotient algebra K, and for σ∈G_q, b(σ)=(A_q/C_q)(χεη_q^{-1}(σ)−a(σ)); also c(σ)=(C_q/A_q)(χεη_q^{-1}(σ)−d(σ)).

**Construction or proof.**

1. In every field factor, zero A_q or C_q would make the ordinary invariant line an eigenline of τ, excluded by the simultaneous choice. Thus both are nonzero in each factor and invertible in K.
2. Compare the first column of ρ(σ)M_q=M_q[[χεη_q^{-1},*],[0,η_q]] and divide by A_q or C_q in K.


**Acceptance.** The cancellation is justified only in K; these quotients need not lie in Â. Include R′, since its local triviality proof divides by the same coefficients.

**Dependencies.** `GS.4/adapted-extension-class`, `GS.4/simultaneous-good-element`, `GS.4/actual-hida-representations`.

**Sources.** [DKV18](#references), §4.4, (79)–(80) and Lemma 4.6, pp. 863–864; §5.2, p. 867. The ordinary line and the τ-basis yield both upper and lower entry identities.

### Restricted ramification of the actual class

**Target:** `GS.4/class-unramified` · **Declaration:** `GrossStark.class_unramified`.

The class [κ] belongs to H_R^1(G_F,B̄(χ^{-1})). It is locally trivial at each q∈R′.

**Construction or proof.**

1. Away from p restrict to G_H to make the action trivial and use local class field theory. Local units have a finite torsion part and a pro-ℓ principal-unit part for ℓ≠p.
2. A continuous homomorphism from the finite part into the additive torsion-free E-space is zero. The compact image of the pro-ℓ part lies in a p-adic lattice, so it is both pro-ℓ and pro-p and is zero. Descend by finite-index averaging.
3. For q∈R′ choose σ̃∈G_q with χ(σ̃)≠1. The factor χεη_q^{-1}(σ̃)−a(σ̃) is a unit of Â. The local upper-entry identity gives A_q/C_q∈B.
4. Reducing that identity yields κ(σ)=(1−χ^{-1}(σ)) overline(A_q/C_q), a local coboundary.


**Acceptance.** The whole additive space B̄ is not a profinite pro-p group; only its compact images lie in lattices. The whole local unit group away from p is not pro-ℓ; its finite torsion part is handled separately.

**Dependencies.** `GS.4/local-basis-comparison`, `GS.4/adapted-extension-class`, `GS.1/restricted-cohomology`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `ArithmeticGaloisDuality:R02.3`.

**Sources.** [DKV18](#references), Lemma 4.7, p. 864. The local comparison kills R′ restrictions; the away-from-p argument needs the corrected compact-image formulation.

### Generation by exceptional inertia

**Target:** `GS.4/inertia-generation` · **Declaration:** `GrossStark.inertia_generation`.

The finite Â-module B is generated by b(σ) for σ in I_q and q∈R.

**Construction or proof.**

1. Let B_I be the submodule generated by those entries and pass to B/B_I and then its residue quotient. The induced continuous class remains unramified outside R and has zero inertia restriction at every q∈R.
2. The product-inertia injectivity theorem makes its class zero. It is a coboundary, and its zero value at τ forces the coboundary vector to vanish.
3. Its values generate the residue quotient, so that quotient is zero. Nakayama applies to the finite module B/B_I and gives B=B_I.


**Acceptance.** Injectivity is applied to the product over R, never one single inertia group.

**Dependencies.** `GS.4/class-unramified`, `GS.4/adapted-extension-class`, `GS.1/inertia-injectivity`.

**Sources.** [DKV18](#references), Lemma 4.8, pp. 864–865. The restricted class and Nakayama identify the full module with its inertia-generated submodule.

### Second-order bound for the upper-entry module

**Target:** `GS.4/second-order-bound` · **Declaration:** `GrossStark.second_order_bound`.

Write α_i=A_{q_i}/C_{q_i}. Inside K, B⊆∑_i α_i m and consequently mB⊆∑_i α_i m².

**Construction or proof.**

1. For σ∈I_{q_i}, χ=η_i=1 and ε(σ)−a(σ)∈m. The local upper-entry formula puts b(σ) in α_i m.
2. Use inertia generation and multiply by m. All products and sums are submodules of K, so no integrality of α_i is assumed.


**Acceptance.** The second inclusion gives precisely the error absorption needed before taking a determinant.

**Dependencies.** `GS.4/inertia-generation`, `GS.4/local-basis-comparison`, `GS.4/adapted-extension-class`.

**Sources.** [DKV18](#references), Lemma 4.9, p. 865. The inertia expression puts the module in a sum of scaled maximal ideals.

**Layer acceptance.** Every target and Check above holds with the common sign and topology conventions, and every direct supplier contract is discharged at the stated generality. The global end theorem is reached only after GS.5.

## GS.5 — Determinants and the Gross–Stark theorem

Use orthogonality and the second-order bound to prove an exact determinant identity before passing to the Artin quotient. Evaluate its degree-r contribution in all three cases, prove the inverse-character argument in Case 3 with its y-adic filtration, and conclude the leading-term theorem at every prime. Give the rank-zero and rank-one consequences and exact-order equivalence with an explicit nonvanishing supplier.

**Layer inputs:** `GS.4`, `DiophantineApproximationAndTranscendence:DT.3`, `GS.1`, `GS.0`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `GS.3`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `GS.2`. Individual targets below give the direct dependency list.

### Exact determinant before Artin specialization

**Target:** `GS.5/exact-determinant` · **Declaration:** `GrossStark.exact_determinant`.

For an E-basis u_j of U_χ and O=(o_i(u_j)), L=(ℓ_i(u_j)), there is a matrix with entries in m⊂Â whose determinant is zero in Â and whose image in W has entries L_ij z+O_ij ε_i+n_ij, n_ij∈m_W². Here z=π in Case 1 and z=π−y in Cases 2 and 3. Consequently det(L_ij z+O_ij ε_i+n_ij)=0 in W.

**Construction or proof.**

1. Express each u_j as a finite E-linear combination of actual p-units. Lift each local Artin image to G_{q_i} and extend a,b,η_i^{-1}ε linearly to the corresponding group-algebra element σ_ij. Orthogonality says ∑_i b(σ_ij)∈mB.
2. Use b(σ_ij)=α_i h_ij with h_ij∈m from the local comparison. The second-order bound writes the residual sum as ∑_i α_i q_ij with q_ij∈m². Subtract these terms to arrange ∑_i α_i(h_ij−q_ij)=0 exactly for every j.
3. The weighted matrix has sum of its rows zero, so its determinant vanishes in K. Cancel the invertible product ∏α_i in K. The unweighted matrix has entries in Â; its determinant therefore vanishes in Â by the verified injection Â→K.
4. Apply φ_m. The local Artin convention gives η_i^{-1}(u)=U_{q_i}^{o_i(u)} and ε(u)=1+ℓ_i(u)π modulo m_W². The refined diagonal contributes 0 or ℓ_i(u)y. This gives the stated entries and error ideal.


**Acceptance.** Do not discard the mB error before absorbing it using m². Cancel α_i only in K, then return to Â before applying φ_m. The matrix has a zero sum of rows as vectors, equivalently every column sums to zero.

**Dependencies.** `GS.4/class-unramified`, `GS.4/second-order-bound`, `GS.4/diagonal-refinement`, `GS.4/local-basis-comparison`, `GS.1/orthogonality-duality`, `GS.0/gross-regulator`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `mathlib:Matrix.det`.

**Sources.** [DKV18](#references), §5.1, (81)–(86), pp. 865–866. Orthogonality and the second-order bound produce an exact determinant before any graded reduction.

### Leading-term comparison for the oriented character

**Target:** `GS.5/graded-leading-term` · **Declaration:** `GrossStark.graded_leading_term`.

For r≥1 the preceding determinant gives det(L)z^r+det(O)∏_iε_i=0 modulo m_W^{r+1}, with nonzero class z^r. In each of Cases 1–3 it follows that L_an(χ)=R_p(χ). In particular if s>r, det L=0 and both sides are zero.

**Construction or proof.**

1. Each determinant term containing one error n_ij has at least r+1 maximal-ideal factors. Discard these terms only in the stated quotient.
2. Expand the remaining determinant. Every term mixing a z factor and an ε_i factor is zero because zε_i=0, leaving exactly det(L)z^r+det(O)∏ε_i.
3. If s=r, the ring’s top-product relation gives ∏ε_i=(−1)^{r+1}L_an(χ)z^r. This includes Case 2 with its top difference; Case 3 always has s>r.
4. If s>r, the top product belongs to m_W^{r+1}. Use the appropriate normal form to cancel the nonzero E-line generated by z^r. Since det O≠0, the result in either case is the signed determinant ratio R_p(χ).


**Acceptance.** Only the nonzero line E·z^r is used; the whole graded piece need not have dimension one. The comparison uses L*_an only at s=r; otherwise L_an is zero.

**Dependencies.** `GS.5/exact-determinant`, `GS.3/case-one-normal-form`, `GS.3/case-two-normal-form`, `GS.3/case-three-normal-form`, `GS.0/gross-regulator`, `GS.0/analytic-invariant`.

**Sources.** [DKV18](#references), §5.1, (85)–(87), pp. 866–867. The degree-r determinant and the correct nonzero weight class give the oriented-character formula.

### Lower-entry class in Case 3

**Target:** `GS.5/inverse-extension-class`.

In Case 3 let C⊆K be the finite Â-module spanned by the actual c(σ), and C̄=C/mC. The function c̄ is a continuous cocycle for the action χ, and defines [c]∈H_R^1(G_F,C̄(χ)). It has c̄(τ)=0. Put β_i=C_{q_i}/A_{q_i} and 𝔶=φ_m^{-1}(yW₃). Then C is generated by c(σ) on exceptional inertia and C⊆∑_iβ_i𝔶, hence mC⊆∑_iβ_i m𝔶.

**Hypotheses and conventions.** Here R′=∅, and the restricted-cohomology constructions are used with χ replaced by χ^{-1}.

**Construction or proof.**

1. Use the same shared finite-matrix-module and realized GMA adapter, now for the lower component. The correct matrix identity is c(στ)=c(σ)a(τ)+d(σ)c(τ), giving the χ-action after reduction.
2. The away-from-p local argument used for κ applies to c̄; all p-primes are in R.
3. Refinement gives φ_m(ε(σ)−d(σ))=ε_y(σ)−1∈yW₃ for σ∈I_q, because χ=η_q=1 there and yz=0. Thus the lower local formula puts c(σ)∈β_i𝔶.
4. Apply the product-inertia injectivity theorem for the inverse character and the τ-normalized coboundary argument, then Nakayama, to obtain generation. Multiply the resulting bound by m.


**API.**

- `GrossStark.inverseExtensionData` (constructor): The actual lower-entry finite module and χ-valued continuous cohomology class in Case 3.
- `GrossStark.inverseExtensionData.cocycle` (relation): c̄(στ)=c̄(σ)+χ(σ)c̄(τ).
- `GrossStark.inverseExtensionData.local` (compatibility): For σ∈G_q, c(σ)=β_q(χη_q^{-1}ε(σ)−d(σ)).
- `GrossStark.inverseExtensionData.inertiaIdeal` (relation): On inertia at q_i, c(σ) lies in β_i𝔶.
- `GrossStark.inverseExtensionData.module_bound` (relation): C⊆∑β_i𝔶 and mC⊆∑β_i m𝔶; these inclusions are in K.


**Checks.**

- `GrossStark.inverseExtensionData.action`: The lower matrix identity reduces to the χ-action, whereas the normalized upper entry has χ^{-1}-action.
- `GrossStark.inverseExtensionData.ideal`: The image of ε−d on exceptional inertia is a multiple of y, even when y has zero class in m/m².
- `GrossStark.inverseExtensionData.rank_one_unequal`: For r=t=1,s=2, the ideal yW₃ is the nonzero E-line generated by cπ²; using only the degree-one maximal-ideal quotient would lose it.


**Uses.** GS.5 inverse-character determinant: Supplies the y-adic error bound. DKV18 Remark 5.2: Explains why a rank-one dual-number image alone cannot finish the unequal-order case.

**Acceptance.** There is no χ^{-1} factor on the lower-entry cocycle. The ideal 𝔶, rather than m alone, is necessary for the stronger inverse-character error estimate.

**Dependencies.** `GS.4/adapted-extension-class`, `GS.4/local-basis-comparison`, `GS.4/diagonal-refinement`, `GS.4/infinitesimal-characters`, `GS.4/class-unramified`, `GS.1/inertia-injectivity`, `IntegralHeckeAndGaloisDeterminants:IHG.1`.

**Sources.** [DKV18](#references), §5.2 and Lemma 5.1, pp. 867–868. The actual lower-entry class and y-divisible local expression give the inverse-character refinement.

### Inverse-character determinant in Case 3

**Target:** `GS.5/inverse-leading-term` · **Declaration:** `GrossStark.inverse_leading_term`.

In Case 3, L_an(χ^{-1})=R_p(χ^{-1}). More precisely for a basis of U_{χ^{-1}} with matrices O⁻,L⁻ the lower-entry argument yields det(L⁻)y^r+det(O⁻)(−1)^{t+1}L*_an(χ^{-1})y^t=0 in y^rW₃/y^{r+1}W₃.

**Construction or proof.**

1. Repeat the exact weighted-row argument with c,β_i and inverse-character orthogonality. The error absorption now uses mC⊆∑β_i m𝔶.
2. After applying φ_m, the entries are L⁻_ij y+O⁻_ij ε_i+n_ij with n_ij∈m_W yW₃=y²W₃. A determinant term involving an error either has an ε factor and vanishes, or lies in y^{r+1}W₃.
3. The top product is (−1)^{s+1}L*_an(χ)π^s=(−1)^{t+1}L*_an(χ^{-1})y^t. Use the y-adic normal-form line, not the maximal-ideal graded piece.
4. If t=r, cancel the nonzero y^r line and divide by det O⁻. If t>r, y^t is zero in this quotient and det L⁻=0; L_an(χ^{-1})=0 as well.


**Acceptance.** The comparison uses t=ord f_{χ^{-1}}, so at t=r the leading term is L_an(χ^{-1}), not L_an(χ). The final quotient is one-dimensional even when y^r∈m_W^{r+1}.

**Dependencies.** `GS.5/inverse-extension-class`, `GS.1/orthogonality-duality`, `GS.3/case-three-normal-form`, `GS.0/gross-regulator`, `GS.0/analytic-invariant`.

**Sources.** [DKV18](#references), §5.2, (88)–(89), p. 868. The stronger error ideal and the y-adic line give the second character’s formula.

### Rank-zero interpolation

**Target:** `GS.5/rank-zero` · **Declaration:** `GrossStark.rank_zero`.

If R is empty, L_an(χ)=f_χ(0)/D_χ=1=R_p(χ), and ord_0 f_χ=0.

**Construction or proof.**

1. Apply interpolation at zero: f_χ(0)=L(χ,0)∏_{q|p}(1−χ(q))=D_χ≠0.
2. The regulator is the determinant on a zero-dimensional space and is 1.


**Acceptance.** No Artin algebra with an empty ε-product is invoked. This includes dyadic ramification, for example F=Q,H=Q(i),p=2.

**Dependencies.** `GS.0/analytic-invariant`, `GS.0/gross-regulator`.

**Sources.** [DKV18](#references), §1, pp. 834–837, especially the discussion after Theorem 1. Interpolation already proves the zero-rank case.

### Gross–Stark leading-term theorem

**Target:** `GS.5/gross-stark` · **Declaration:** `GrossStark.gross_stark`.

For every datum of GS.0, including every rational prime p, f_χ^{(r)}(0)/r!=L(χ,0)∏_{q∈R′}(1−χ(q))·R_p(χ). Equivalently L_an(χ)=R_p(χ)=L_alg(χ). No Leopoldt conjecture, exact-order conjecture, odd-p assumption, parity restriction on [F:Q], or nonzero higher-rank regulator is a hypothesis.

**Construction or proof.**

1. If r=0 apply direct interpolation.
2. If r≥1 and R′≠∅ use Case 1 and the oriented determinant comparison.
3. If R′=∅ interchange χ and χ^{-1} to make s≥t. In Case 2 run the unit-ratio argument for either orientation; in Case 3 combine the oriented and inverse-character determinant comparisons.
4. Use the cohomological regulator comparison for the equality with L_alg.


**Acceptance.** Every possible analytic order is covered, including s>r and s>t. The fixed χω branch, factorial and signed regulator agree with the source theorem.

**Dependencies.** `GS.5/rank-zero`, `GS.2/case-division`, `GS.5/graded-leading-term`, `GS.5/inverse-leading-term`, `GS.1/algebraic-regulator-comparison`.

**Sources.** [DKV18](#references), Theorem 1, p. 837; §5, pp. 865–868. The all-prime leading-term identity is the endpoint of the roadmap.

### Exact order and regulator nonvanishing

**Target:** `GS.5/exact-order-boundary` · **Declaration:** `GrossStark.exact_order_boundary`.

The established theorem implies ord_0 f_χ=r if and only if R_p(χ)≠0. The assertion that this holds for every χ in arbitrary rank remains a conjectural nonvanishing statement, not a target claimed proved here.

**Construction or proof.**

1. The lower bound gives vanishing of all derivatives below r. The theorem identifies the divided r-th derivative with the nonzero factor D_χ times R_p(χ).
2. An analytic germ of finite order has exact order r precisely when that coefficient is nonzero.


**Acceptance.** The leading-term theorem remains meaningful and proved when both sides vanish.

**Dependencies.** `GS.5/gross-stark`, `GS.0/order-lower-bound`, `GS.0/analytic-invariant`.

**Sources.** [DKV18](#references), Conjectures 1–2 and the discussion after Theorem 1, pp. 836–837. The exact-order conjecture and the proven leading-term assertion are distinct.

### Rank-one consequence and historical specializations

**Target:** `GS.5/rank-one-nonvanishing` · **Declaration:** `GrossStark.rank_one_nonvanishing`.

For r=1, R_p(χ)≠0 by the supplied p-adic Baker–Brumer theorem, so ord_0 f_χ=1 and the theorem gives its nonzero first derivative. For r=0 the order is zero. For F=Q the general identity specializes to the Ferrero–Greenberg/Gross–Koblitz rank-one formula without rebuilding their independent gamma-function proof. When the character order divides p−1, equality also implies the historical agreement of p-adic valuations of the two invariants.

**Hypotheses and conventions.** The transcendence supplier must give Baker–Brumer linear independence for p-adic logarithms of algebraic numbers; multiplicative approximation estimates alone are insufficient. The historical valuation corollary is interpreted with v_p(0)=+∞ if a zero case is included.

**Construction or proof.**

1. For r=1, the nonzero χ-projected p-unit logarithm is an algebraic linear combination of logarithms of algebraic numbers. Apply the supplier’s Baker–Brumer result and the character relations to show it is nonzero, as in the source’s rank-one discussion.
2. Divide by the nonzero valuation coordinate and invoke the theorem and exact-order equivalence.
3. Specialize the already-proved identity to the stated historical settings; do not import the main conjecture, p-adic gamma construction or an independent regulator proof.


**Acceptance.** No higher-rank nonvanishing is deduced from Baker–Brumer.

**Dependencies.** `GS.5/gross-stark`, `GS.5/exact-order-boundary`, `GS.5/rank-zero`, `GS.0/valuation-isomorphism`, `DiophantineApproximationAndTranscendence:DT.3`.

**Sources.** [DKV18](#references), §1, pp. 836–837; §1.2, pp. 838–839. Rank-one nonvanishing and the historical special cases delimit the consequence of the theorem.

**Layer acceptance.** Every target and Check above holds with the common sign and topology conventions, and every direct supplier contract is discharged at the stated generality. The global end theorem is reached only after GS.5.

## Worked arithmetic and filtration checks

**A ramified dyadic example.** Take F=Q, H=Q(i) and its odd quadratic character. At p=2 the prime is ramified, so χ(2)=0, R is empty and D_χ=L(χ,0). Interpolation gives f_χ(0)=D_χ and the empty regulator is 1. Here χ is the dyadic Teichmüller character, so the potentially exceptional p-adic branch is included; its germ at zero is regular. A blanket exclusion of χ=ω^{-1} would incorrectly remove this example.

**An inert prime.** In the same extension, p=3 has χ(3)=−1. Again r=0, while D_χ=2L(χ,0). The Euler factor changes the denominator but creates no exceptional prime. Counting every prime above p as a trivial zero would fail this check.

**A split prime and the regulator sign.** At p=5 the prime splits and r=1. With P=(2+i), the minus p-unit u=(2+i)/(2−i) has valuation 1 at P. In the completion H_P≅Q_5, its signed regulator is −log_5(u). The inverse prime changes both valuation and logarithm by the same sign. For a purely linear check, O=(2), L=(3) gives −3/2; in rank two O=diag(2,3), L=diag(5,7) gives 35/6.

**The w=−1 fiber.** In W₂ with r=s=1 and w=−1, the relation wπ=(w+1)y forces π=0. The surviving ring is E[y]/y², with ε_1=−ay, a=L*_an(χ). Thus (π−y)=−y is nonzero, although π is zero. The family has zero weight-one specialization and a nonzero first leading term. Discarding this case or cancelling π would invalidate the theorem.

**The unequal-order fiber.** In W₃ with r=t=1 and s=2, put a=L*_an(χ), b=L*_an(χ^{-1}) and c=−a/b. The relations give y=cπ² and ε_1=−aπ²=by. The ring has basis 1,π,π². Its nonzero y-line disappears in m/m² but survives in yW₃/y²W₃. The upper determinant proves R_p(χ)=0; the lower determinant in this y-line gives R_p(χ^{-1})=b. These are distinct filtrations of the same ring.

## Suggested signatures and the carrier boundary

The [suggested Lean file](../suggested/IntegralIwasawaTheoryPartII.lean) contains three light definitions on existing carriers: `regulator` for an actual linear equivalence and signed map, `matrixRegulator` for two actual square matrices, and `normalizedCoefficient` for an actual formal power series. Their signatures cover the elementary content of GS.0, the XO+YL cohomological determinant comparison in GS.1, and the scalar and exact-order coefficient consequences in GS.5. The file includes matrix, zero-rank, singular and factorial-sensitive examples.

The map `regulator_eq_coordinate_ratio` is the finite-basis part of `GS.0/gross-regulator`; the arithmetic specialization supplies its genuine unit and divisor spaces. `algebraicInvariant_eq_matrixRegulator` realizes the linear-algebra step of `GS.1/algebraic-regulator-comparison`. `leadingTerm_eq_matrixRegulator` and `order_eq_iff_normalizedCoefficient_ne_zero` state the scalar conclusions used in `GS.5/graded-leading-term` and `GS.5/exact-order-boundary`. They do not assert the arithmetic theorem before its carriers exist.

The arithmetic data, unit eigenspaces, restricted Selmer subspace, Hilbert families, Hecke quotient presentations and realized matrix-entry modules remain the exact README targets above. Their supplier carriers are absent at the pins. The suggested file therefore introduces no placeholder Hilbert form, p-adic L-function or Galois representation, and no new quotient-algebra development. All APIs and their discriminating Checks remain specified here.

## Source conventions and corrections

Locators for DKV18 use the published Annals pagination. DKV16 is consulted only for the normalized form of Theorem 3.2. CD14 and V15 use the freely available author/arXiv page numbers listed below. The following corrections are applied to the target statements; they are mathematical or notational corrections, rather than replacement summaries of the sources.

- **E2**, Published DKV18, Remark 4.5, p. 863: Exclude this remark from the endpoint proof; retain the actual maps to W₁,W₂,W₃. A separate argument would be needed to justify the remark’s full-Hecke quotient. For r≥2 the ε_iπ=0 and nonzero top-product relation obstruct the asserted factorization through W. The only earlier φ′ has a smaller domain and a different truncation.
- **E3**, Published DKV18, §1.3, leading-term display after (14), p. 841; related occurrence in §5.1, p. 867: Use L_p(χω,z) in every definition of L*_an and L_an. The interpolation function in §1 is the χω branch; changing that branch changes the object.
- **E4**, Published DKV18, §3.2, case-division discussion, p. 849: Its last term must be the order for χ^{-1}. Only comparison of the two characters explains why W is expected to have order zero.
- **E5**, Published DKV18, §3.3, immediately after the Fourier embedding, p. 850: Use the definitions in §1.3, p. 841. Equation (2) defines a complex Euler-depleted L-function, not those analytic quantities.
- **E6**, Published DKV18, §4.2, (63), p. 860: The representation on the left is the product ρ, with the Hecke coefficient on the right. The preceding construction is the product over all eigenfamilies; a single family has its own Fourier coefficient.
- **E7**, Published DKV18, §5.2, lower-entry cocycle identity, p. 867: Use c(στ)=c(σ)a(τ)+d(σ)c(τ), with σ and τ quantified independently. This is the lower-left entry of the product of the two matrices.
- **E10**, Published DKV18, Remark 1.1, p. 837: It is an endomorphism of X_χ; the conjugate composite on U_χ has the same characteristic polynomial. The inverse valuation map has source X_χ and target U_χ.
- **E14**, Published DKV18, Proof 1 of Proposition 2.1, (21)–(22), p. 844: Fix the order (χ^{-1},χ(1)) throughout and retain the single universal reciprocity/cup-product sign in the evaluation comparison. Swapping degree-one cup factors changes sign. The common sign cancels in the global sum-zero assertion, and the independent reciprocity proof agrees.
- **E15**, Published DKV18, §1.4, outline after (16), p. 843: For Case 1 use the quotient m_W^r/m_W^{r+1}. In Cases 2 and 3 use only the nonzero E-line generated by z^r in that quotient. When s>r, m_W^r contains the independent powers π^r through π^s. The detailed proof reduces modulo m_W^{r+1}.
- **E16**, Published DKV18, §1.4, (16), pp. 842–843: Use the exact weighted-row construction of §5.1: absorb mB into the scaled m² terms, cancel the local basis factors in the total quotient algebra, then specialize the determinant. The naive column-sum argument only places the lifted determinant in a larger error module, with no proved inclusion in the claimed product-module ideal. The detailed §5.1 bound repairs the argument.
- **E17**, Published DKV18, §1.4, rank-one comparison, p. 842: It is the scalar specialization κ_φ whose local formula is being stated. The two classes have different coefficient modules.
- **E18**, Published DKV18, Theorem 3.2, p. 849; compare arXiv v1 Theorem 3.2, p. 16: Require ν_1(t)E_1(1,χ_S)=E_1(1,χ_S), as in the preprint. This normalizes t; it does not assert ν_1(F)≠0 at w=−1. Without normalization t=0 satisfies the published statement, while the Hecke-image independence arguments need preservation of the Eisenstein leading terms.
- **E19**, Published DKV18, §3.1, footnote 6, p. 847: For its stated general character η, use L(η,0)+η^{-1}(λ)L(η^{-1},0), multiplied by 2^{−[F:Q]}. Only the subsequent specialization η=χ has the printed variables.
- **E20**, Published DKV18, §3.1, Hecke operators on M(n,χ), p. 847: Include U_l for every l dividing np. The formulas at l|n and the Eisenstein maximal ideal use them.
- **E21**, Published DKV18, §3.2, regularity condition, p. 849: Place F̃ in M(n,χ)_(1), and place t e F̃ in S^o(n,χ)_(1). A product of the classical weight-one Eisenstein series with G^♭ need not be ordinary; this is why e is applied.
- **E22**, Published DKV18, §3.4, (41)–(42), p. 853: The modulus is π^{s+1}. All orbit computations use the same truncated coefficient algebra E[π]/π^{s+1}.
- **E23**, Published DKV18, §3.4, (48) and preceding product, p. 854: Its i-th factor is U_{q_i}−1. The factors run through the distinct primes of R.
- **E24**, Published DKV18, Proof of Theorem 3.6, p. 854: Use dim_E W₂=2^r+2s−2 and ε_J=∏_{j∈J}ε_j. There are 2^r−2 proper nonempty subsets of the r exceptional primes. The displayed basis has 2s more elements; for r=2,s=3 it has dimension 8, not 12.
- **E25**, Published DKV18, Remark 3.7, p. 855: Use π=T/log_p(u) in those formulas, or divide the coefficients of T by log_p(u). The specialization sends y to wπ/(1+w) and ε_1 to L_anπ/(1+w).
- **E26**, Published DKV18, Remark 3.7, p. 855: Its value is 1+(w/(1+w))log_p⟨Nl⟩π when w≠0,−1. Substitute y=wπ/(1+w) in Theorem 3.6. The correction need not vanish; the remark is not needed for the endpoint proof.
- **E27**, Published DKV18, §4.1, after (53), p. 858; §4.2, before (66), p. 861: Use the same prime l in Frob_l, T_l and χ(l). The congruence is the one attached to the chosen away-from-np Hecke operator.
- **E28**, Published DKV18, §4.1, before Lemma 4.3, p. 860; local use p. 864: Include every q|p in that finite list. The later local comparison and R′ triviality argument use the nonzero change-of-basis coefficients at primes outside R too. The same line-avoidance proof covers the enlarged list.
- **E29**, Published DKV18, Proof of Lemma 4.2, reversed eigenvalue order, p. 860: Multiply that lower entry by χ^{-1}(σ) in the reversed ordering. Its reduced multiplication relation has the right-action form c(στ)=c(σ)χ(τ)+c(τ); the normalization converts it to a left-action cocycle.
- **E30**, Published DKV18, §4.2, after (64), p. 861: Use η_q consistently in its domain, local shape and uniformizer value. A separate character is defined at each q|p.
- **E31**, Published DKV18, §4.3, before (70), p. 862: Start at degree zero with a₀=1. A character takes the identity to 1 and the same paragraph’s substitution formula includes that constant term.
- **E32**, Published DKV18, Proof of Lemma 4.7, p. 864: Separate finite unit torsion from the pro-ℓ principal units. Torsion-freeness kills the finite part; the compact image of the principal part lies in a p-adic lattice, so pro-ℓ versus pro-p kills it. The unit group has a finite tame quotient, while a nonzero p-adic vector space is noncompact. The corrected argument proves the same local unramifiedness.
- **E33**, Published DKV18, (85)–(86), p. 866, and inverse-character analogue, p. 868: Use a single determinant of the displayed matrix. The surrounding computation determines the intended matrix unambiguously.
- **E34**, Published DKV18, §5.2, error ideal and (88)–(89), p. 868: After φ_m use yW and m_WyW=y²W; the final line is y^rW/y^{r+1}W. The two ideals live in different rings. The relation πy=y² supplies the intended error and filtration in W₃.
- **E35**, Published DKV18, §5.2, after (89), p. 868: Identify L*_an(χ^{-1}) with L_an(χ^{-1}) instead. Here t is the inverse-character order; the χ order is s>t, so its rank-r coefficient is zero.

- **E36**, Author copy dated 4 November 2014, proof of Theorem 5.1, p. 31: Use projective dimension zero, hence H_q(T,C_c^♭)=0 for q>0. The spectral sequence then has only its q=0 row. A free group-ring module is projective, and group homology is Tor over that group ring. Vanishing in every positive degree is the fact needed for the edge isomorphism.
- **E37**, Published §4.2, final proof sentence, p. 961; also arXiv §4.2, p. 20: The internal reference is to Theorem 2, whose auxiliary ordinary family is constructed in §4. Theorem 2 is stated at the start of §4, and the concluding construction discharges its reduction in §4.1. Theorem 1 is the rank-one Gross–Stark result proved earlier.

All 31 findings above were independently checked at their locators and confirmed in REV-DESIGN-IntegralIwasawaTheoryPartII on 2026-10-19. E36 concerns only the specified author copy; E37 was compared with the publisher text. No external correction search is claimed beyond the places recorded in the packet.


The source’s Case 3 independence argument is written out in `GS.3/case-three-hecke-map`; it is not treated as an unresolved gap. The unsupported quotient in Remark 4.5 is excluded from the proof route. The independently reviewed extraction rejected its proposed E1 and E8 findings, and neither is asserted here. Preprint-only slips outside the directly compared theorem are not attributed to the published article.

## References

- **DKV18.** Samit Dasgupta, Mahesh Kakde and Kevin Ventullo, [On the Gross–Stark Conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v188-n3-p03-s.pdf), Annals of Mathematics (2) 188 (2018), 833–870. Read 2026-10-19. Locators used: Entire published paper, pp. 833–870.
- **DKV16.** Samit Dasgupta, Mahesh Kakde and Kevin Ventullo, [On the Gross–Stark Conjecture](https://arxiv.org/pdf/1605.08169v1), arXiv:1605.08169v1 (2016). Read 2026-10-19. Locators used: Theorem 3.2, p. 16, compared with published p. 849.
- **DDP11.** Samit Dasgupta, Henri Darmon and Robert Pollack, [Hilbert modular forms and the Gross–Stark conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v174-n1-p12-p.pdf), Annals of Mathematics (2) 174 (2011), 439–484. Read 2026-10-19. Locators used: Proposition 1.4 and Lemma 1.5, pp. 455–456; Lemma 2.9 and Corollary 2.10, pp. 469–470; Propositions 3.3–3.4 and Lemma 3.5, pp. 472–474.
- **CD14.** Pierre Charollois and Samit Dasgupta, [Integral Eisenstein cocycles on GL_n, I: Sczech’s cocycle and p-adic L-functions of totally real fields](https://sites.math.duke.edu/~dasgupta/papers/Charollois-Dasgupta.pdf), Author version dated 4 November 2014; Cambridge Journal of Mathematics 2 (2014), 49–90; locators use author pagination. Read 2026-10-19. Locators used: Introduction, Theorems 2–3, pp. 3–5; §5.1–§5.2, pp. 27–32, including the proofs of Theorems 5.1–5.2.
- **V15.** Kevin Ventullo, [On the rank one abelian Gross–Stark conjecture](https://arxiv.org/pdf/1308.2261), arXiv:1308.2261; published in Commentarii Mathematici Helvetici 90 (2015), 939–963; locators use arXiv pagination. Read 2026-10-19. Locators used: §2.1, pp. 4–5; §4.1–§4.2, pp. 14–20, including Theorem 2 and its construction.
- **V15-published.** Kevin Ventullo, [On the rank one abelian Gross–Stark conjecture](https://ems.press/content/serial-article-files/43407), Commentarii Mathematici Helvetici 90 (2015), 939–963. Read 2026-10-19 only for §4, pp. 955–956 and 961, to compare E37 with the version of record.
