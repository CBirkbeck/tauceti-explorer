# Coleman power series, local units, and cyclotomic-unit quotients, Part II: signed anticyclotomic local units

This is the Part II of ColemanPowerSeries for the inert, supersingular anticyclotomic tower. Its endpoint is Rubin’s integral signed decomposition and nonvanishing of the matching-parity Coates–Wiles derivatives. The proof combines a plus unit from early CM special values with a primitive local point system from a modular parametrization. It uses no global Heegner-point system. The mathematical targets below are planned; missing foundations and source proofs are explicit interfaces, not claims of formalization.

## Scope and conventions

p is prime and p ≥ 5; Φ/ℚ_p is unramified of degree two, O is its integer ring and π = −p.
F/O is the Lubin–Tate formal O-module for π, λ its logarithm with λ′(0)=1, and T=T_πF is free of rank one over O.
Φ_n=Φ(F[π^(n+1)]), Δ=Gal(Φ_0/Φ), ω=κ|Δ, Γ=Gal(Φ_∞/Φ_0)=Γ⁺×Γ⁻; Θ_n=Φ_n^Δ and Ψ_n=Θ_n^(Γ⁺), with [Ψ_n:Φ]=p^n. Complex conjugation fixes Γ⁺ and inverts Γ⁻.

Write Λ₂=O[[Γ⁺×Γ⁻]] and Λ=O[[Γ⁻]]. Completed algebras, module topologies and duality use the Measures/Iwasawa and arithmetic-duality suppliers below. A superscript star always means Hom_O(T_πF,−), with its diagonal action. Formal traces use formal-group addition. A subscript on an L-value specifies the omitted Euler factors. Every finite character is viewed in a fixed finite extension of Φ inside ℂ_p.

| Character | Conductor exponent | Sign | Unit condition | Point condition |
|---|---:|---|---|---|
| 1 | 0 | + | Minus units kill it | Plus points kill it |
| Exact order p | 2 | + | Minus units kill it | Plus points kill it |
| Exact order p² | 3 | − | Plus units kill it | Minus points kill it |

The unit derivative δ_χ has inverse-character covariance and normalization π^(−n−1) at Φ_n. The formal logarithm λ_χ has direct-character covariance and normalization p^(−n) at Ψ_n. In particular δ_1=(1+p⁻¹)δ, while λ_1 restricts to λ on base-field points. The π-adic Tate generator is (−1)^n times Rubin’s p-adic generator. These distinctions govern all tests below.

## Library and ownership

The reviewed library audit for the parent and the Measures/Duality inputs was read before planning. No existing packet, integrated decomposition or reserved stage supplies this new inert-tower roadmap. The current TauCetiRoadmap main and current Tau Ceti library were also searched: the nine newer roadmaps do not already contain these signed local objects. ProfiniteArithmetic and LocalGaloisGroups supplied the current upstream style. The current generic CompletedGroupAlgebra in ProfiniteProPGroups is reused through the Measures request. The pinned formal-to-elliptic homomorphism is reused, with its actual completion hypotheses; no replacement carrier or map is planned.

| Pinned declaration | Existing input |
|---|---|
| `tauceti:TauCeti.unitFiltration` | Existing unit filtration subgroup of K× for a nonarchimedean local field; n=1 is used for principal units. |
| `tauceti:TauCeti.unitFiltration_one` | At depth one this subgroup is the valuation-ring principal-unit subgroup, with the existing local-field and valuation instances. |
| `tauceti:WeierstrassCurve.formalPointHomAdicCompletion` | The existing homomorphism from maximal-ideal formal points to elliptic points in a height-one adic completion of a Dedekind domain, for an elliptic Weierstrass curve over its valuation ring. |
| `tauceti:WeierstrassCurve.formalPointHomAdicCompletion_injective` | Injectivity of that formal-to-elliptic map under its existing ellipticity and adic-completion hypotheses. |
| `tauceti:WeierstrassCurve.range_formalPointHomAdicCompletion` | The image consists of zero and points with 1 < Valued.v(xCoord); applies only after supplying the adic-completion realization in G1. |
| `mathlib:PowerSeries.coeff` | The coefficient linear map on the actual univariate formal power series carrier. |
| `mathlib:PowerSeries.constantCoeff` | The constant-coefficient ring homomorphism, used as augmentation after the one-variable Iwasawa identification. |
| `mathlib:PowerSeries.derivative` | The actual formal-series derivation for commutative semirings; not analytic evaluation at a torsion point. |
| `mathlib:PowerSeries.isUnit_iff_constantCoeff` | Over a commutative ring, a power series is a unit exactly when its constant coefficient is a unit. |

The exact pins are Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Every listed declaration was read at these commits. The three formal-point declarations have a Dedekind-domain height-one adic-completion setting, not an arbitrary local-field signature. G1 records the realization needed to use them here.

### Supplier requests

- `ColemanPowerSeries:L1`: Reuse the parent’s finite-free determinant norm and unramified cyclotomic interpolation method, including uniqueness and continuity. This request does not claim that the parent proves the height-two Lubin–Tate interpolation theorem; that extension is owned in ALU.1 and its unread proof input is G6.
- `PadicMeasuresIwasawaAlgebras:L1`: Use the existing completed-group-algebra/measure construction and its finite-quotient action with coefficient ring O, including change of coefficients. Current TauCetiRoadmap ProfiniteProPGroups Layer 9 already has CompletedGroupAlgebra R G; adapt that construction instead of planning a second general completed algebra.
- `PadicMeasuresIwasawaAlgebras:L4`: For Γ≃ℤ_p and Γ⁺×Γ⁻≃ℤ_p², supply O[[Γ]]≃O[[T]] and O[[S,T]], noetherian domain/local properties, quotient by one coordinate and by its κ-twist, Weierstrass preparation, and finite O-rank of O-torsion-free torsion modules. The coefficient-O specialization, rather than a second generic algebra, is required.
- `PadicMeasuresIwasawaAlgebras:L5`: Compact inverse limits and finite-free coefficient extension commute; continuous/discrete O-duality exchanges invariants and coinvariants. Supply topological Nakayama and the finite projective rank-one freeness criterion over the local Iwasawa ring, with actual compact topologies.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`: Finite local Tate duality for the finite Galois modules F[π^k] and their Cartier duals, with evaluation cup product, coefficient trace and the conventional local invariant. This finite theorem does not assert self-duality of a formal group or the infinite Kummer comparison.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`: The local Artin map identifies the finite abelian Galois quotients with multiplicative quotients, compatibly with field norm, restriction and corestriction. Projecting to the nontrivial tame ω-part must discard valuation and other tame components.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`: Finite local reciprocity/existence with its norm subgroups, and compatibility of finite local Artin maps across the Lubin–Tate layers. This supplies reciprocity, not Wintenberger’s infinite unit-control theorem.
- `ArithmeticGaloisDuality:R02.1`: For a finite cyclic group acting on a torsion-free O-lattice, supply the norm descriptions of Ĥ⁰ and H¹, multiplicativity of the Herbrand quotient in exact sequences, its value one on finite modules, and the invariant long exact sequence. Continuous cohomology/direct-limit passage must retain the discrete module topology.
- `tauceti:TauCetiRoadmap/ModularCurves#layer-5-affine-fine-modular-curves-after-inverting-n`: Use the existing fine affine moduli functor away from the level, its universal elliptic curve and representability for Γ₁(M), in the mixed cyclic Γ₀(N),Γ₁(M) problem when p∤NM and M≥6. Compactified mixed-level good models are a separate gap G4.
- `tauceti:TauCetiRoadmap/ModularCurves#layer-8-km-chapter-6-cyclicity-and-γ₀n`: The existing prime-to-p cyclic subgroup moduli and degree N∏_(l|N)(1+1/l) of the forgetful map, applicable to arbitrary N including 27 and 32; cyclic subgroup transport along a p-isogeny preserves the prime-to-p marking.
- `tauceti:TauCetiRoadmap/ModularCurves#layer-9-γ_h-quotients-quotient-regularity-and-coarse-moduli`: The tame coarse quotient and stabilizers of the existing Γ_H moduli, with étaleness away from elliptic stabilizers and the order-three/order-two bounds at j=0/1728. General compactified composite-level models, connectedness and genus are not supplied by the current prime-only Layer 10; see G4.
- `ModularCurvesPartII:R14.5`: Use the modular-Jacobian quotient and the Hecke eigenrelation T_p=a_p on the genuine elliptic quotient, compatible with the modular parametrization and differential normalization. Composite-level integral Hecke correspondences are specified in G4.

### Missing input contracts

The pass is complete at target level, with every layer planned. It is **not closed**: the contracts below name precisely what has not been established. In particular Wiles’s original reciprocity proof has not been read. Proposed foundation roadmap names have no registered stage, so they are not used as fictitious dependency IDs. Their restructuring issues are leads for the maintainer.

**G1: Unregistered Lubin–Tate and quasi-canonical supplier.** The proposed LubinTateFormalModulesAndQuasiCanonicalLifts has no registered stage or packet. Issue #3355 is the relevant restructuring lead, not a theorem supplier. Required interfaces: the actual formal O-action/logarithm with analytic inverse on deep ideals; T_π, κ and the tower/ramification conductor formulas; Honda type −εX²+p and parameter εp for the unramified quadratic lift; quasi-canonical lattices T_s=p^(−s)ℤ_p t+T, End=ℤ_p+p^sO, fields Ψ′_s with degree p^(s−1)(p+1), and their class-field orbit actions; and a number-field height-one completion realization for the pinned formalPointHomAdicCompletion. These are imported interfaces, not duplicate foundations planned here. Register the owner and exact stages before closure.

Consumers: `AnticyclotomicLocalUnits:ALU.0/conductor-parity`, `AnticyclotomicLocalUnits:ALU.0/inverse-tate-twist`, `AnticyclotomicLocalUnits:ALU.0/anticyclotomic-quotient`, `AnticyclotomicLocalUnits:ALU.1/lubin-tate-coleman`, `AnticyclotomicLocalUnits:ALU.2/finite-formal-kummer`, `AnticyclotomicLocalUnits:ALU.3/character-logarithm`, `AnticyclotomicLocalUnits:ALU.3/formal-fourier-lattices`, `AnticyclotomicLocalUnits:ALU.5/auxiliary-supersingular-curve`, `AnticyclotomicLocalUnits:ALU.5/scalar-frobenius`, `AnticyclotomicLocalUnits:ALU.5/primitive-formal-cm-point`, `AnticyclotomicLocalUnits:ALU.6/quasicanonical-modular-points`, `AnticyclotomicLocalUnits:ALU.6/hecke-lattice-neighbours`.

**G2: Unregistered early CM special-value supplier.** The proposed NonordinaryCMSpecialValues has no registered stage. Issue #3350 is a restructuring lead. Supply canonical type-(1,0) Hecke characters with φ(p)=−p and root number +1, a compatible CM elliptic realization/period, early norm-compatible zeta classes with Kato explicit reciprocity, and the Finis unit-value theorem in precisely this canonical case, including the vanishing local μ and b invariants. Also supply simultaneous l splitting with p∤(l−1) and all semilocal group-ring identifications in BKO (3.5). These inputs must precede, and must not use, Rubin’s final signed p-adic L-function. BKO §3 pp.950–954 was read; the general original proofs have not been read here. Kato’s 1993 article, LNM 1553 pp.50–163, Theorem 2.1.7, is not in the cleared library; no alternative uncleared book copy was used.

Consumers: `AnticyclotomicLocalUnits:ALU.4/auxiliary-cm-field`, `AnticyclotomicLocalUnits:ALU.4/projected-cm-class`, `AnticyclotomicLocalUnits:ALU.4/wiles-dual-exponential`, `AnticyclotomicLocalUnits:ALU.4/cm-class-values`, `AnticyclotomicLocalUnits:ALU.4/optimal-unit`.

**G3: Unregistered supersingular finite-field supplier.** The proposed SupersingularFiniteFields has no registered stage; #3398 is the restructuring lead. Need a trace-zero elliptic curve over 𝔽_p for each p≥5, Deuring mass p−1=12m+4d+6e, rationality of supersingular j over 𝔽_(p²), and the twist-sensitive Schoof trace-class formulas stated in ALU.5. BKO Lemma 5.2 and its proof pp.956–957 were read, but Schoof’s general proof was not. Request the general results from that owner; the scalar-Frobenius and counting applications are owned here.

Consumers: `AnticyclotomicLocalUnits:ALU.5/auxiliary-supersingular-curve`, `AnticyclotomicLocalUnits:ALU.5/supersingular-mass-application`, `AnticyclotomicLocalUnits:ALU.5/generic-supersingular-bound`, `AnticyclotomicLocalUnits:ALU.5/exceptional-supersingular-bounds`.

**G4: Composite-level integral modular geometry.** Current TauCetiRoadmap ModularCurves Layer 10 now compactifies prime levels N≥5 only. It cannot supply smooth connected proper X₀(N)/ℤ_p, the genus/index formula, mixed Γ₀(N),Γ₁(M) good models and étale local disks, or integral T_p correspondences for all p∤N, especially N=27/32. The general q-expansion/Néron differential and congruence comparison ingredients used by Abbes–Ullmo also require an owner. Extend ModularCurvesPartII in this direction, register precise stages, and retain the existing affine/coarse suppliers. AU Theorem A is read and the good-prime deduction is outlined here; this is not a claim that the required geometric infrastructure exists at the pins.

Consumers: `AnticyclotomicLocalUnits:ALU.5/manin-unit-separability`, `AnticyclotomicLocalUnits:ALU.5/ramification-bound`, `AnticyclotomicLocalUnits:ALU.5/generic-supersingular-bound`, `AnticyclotomicLocalUnits:ALU.5/exceptional-supersingular-bounds`, `AnticyclotomicLocalUnits:ALU.5/fine-level-unramified-lift`, `AnticyclotomicLocalUnits:ALU.5/primitive-formal-cm-point`, `AnticyclotomicLocalUnits:ALU.6/quasicanonical-modular-points`, `AnticyclotomicLocalUnits:ALU.6/optimal-trace-relations`.

**G5: General unit norm-control theorem used by Wintenberger.** Wintenberger §5.2 pp.92–94 uses the general one-variable local-unit structure theorem (its reference to Iwasawa Theorem 25) to obtain norm kernel=(σ−1), injectivity of projected unit limits and the finite coinvariant calculation. The read §§5.3–5.5 then give the two-variable nonexceptional-character freeness criterion. Neither finite class field theory nor the cyclotomic-only parent alone proves the general norm-control input. Locate/read its proof and assign a general local-unit supplier before closing unit-rank-two.

Consumers: `AnticyclotomicLocalUnits:ALU.0/unit-rank-two`.

**G6: Height-two Coleman proof input.** ALU.1 owns the height-two LT specialization. The read Rubin87 §2 pp.407–408 and BKO §2 pp.948–949 state/use interpolation, but do not provide the full construction from the parent’s cyclotomic case. Need the finite-free rank-p² determinant norm for [π]_F, convergence/contraction on principal-unit series, interpolation existence/uniqueness and topology over O. A formal substitution of p by −p in the multiplicative group does not prove this.

Consumers: `AnticyclotomicLocalUnits:ALU.1/lubin-tate-coleman`.

**G7: Finite formal Cartier/Kummer comparison.** Finite local Tate duality is imported, but the actual finite F[π^k] Cartier dual, formal division sequence, coefficient trace and Artin convention still need comparison with the pinned elliptic formal-point realization. Establish the dual obstruction groups and their transition maps; do not identify an arbitrary height-two formal group with its Cartier dual. Rubin87 Lemma 5.1 and Propositions 5.2–5.4 pp.411–412 are read statements/proofs for the present application. This interface must be decomposed further before a closed packet.

Consumers: `AnticyclotomicLocalUnits:ALU.2/finite-formal-kummer`, `AnticyclotomicLocalUnits:ALU.2/formal-norm-vanishing`, `AnticyclotomicLocalUnits:ALU.2/two-variable-kummer-pairing`, `AnticyclotomicLocalUnits:ALU.2/anticyclotomic-kummer-pairing`, `AnticyclotomicLocalUnits:ALU.2/wiles-trace-formula`.

**G8: Hazewinkel after finite ramified base change.** Hazewinkel77 Theorem 1.3 pp.305–306, whose proof §§2–4 was read, assumes an unramified ground field and a totally ramified ℤ_p-extension. Universal norms require a shrinking-image estimate after every finite, generally ramified base in the actual tower, and a cofinal direction in the two-variable tower. Prove that extension or find a theorem with these hypotheses, then dualize the actual obstruction using G7. Quoting the unramified formula at a ramified base is insufficient.

Consumers: `AnticyclotomicLocalUnits:ALU.2/formal-norm-vanishing`.

**G9: Original Wiles reciprocity proof unavailable.** Wiles, Higher explicit reciprocity laws, Annals of Mathematics 107 (1978), 235–254, DOI 10.2307/1971143, is not in the cleared library. Publisher/JSTOR access and author-copy searches did not yield a readable authorized full text. Its original proof has not been read. BKO §4 p.955 and the read Rubin87 Theorem 5.3 p.412 fix the trace formula interface only. Obtain and read the original proof, checking [π] versus [p], invariant derivative and reciprocity sign, before marking this blueprint closed. No inaccessible text is listed among the read sources.

Consumers: `AnticyclotomicLocalUnits:ALU.2/wiles-trace-formula`, `AnticyclotomicLocalUnits:ALU.4/wiles-dual-exponential`.

**G10: Auxiliary-field class-number bound.** BKO Lemma 3.1 pp.950–951 uses the Dirichlet class-number formula and a bound for L(1,χ_d) to obtain h(d)≤sqrt(|d|)(2+log|d|)/π_real, where π_real is the positive real circle constant, unrelated to the uniformizer π=−p. Together with |d|<8p this gives h(d)<p for p≥53; the ratio sqrt(8p)(2+log(8p))/(π_real p) decreases there. The original general analytic estimate (cited there to Cohen Lemma 8.16) was not read and has no precise supplier node here. Assign/read that general input before closure. The remaining p≤47 cases have now been checked by exact Euler criteria and reduced primitive positive-definite binary forms; their certificates are in the reader and auxiliary-field target.

Consumers: `AnticyclotomicLocalUnits:ALU.4/auxiliary-cm-field`.

## Proof architecture

First form the omega-unit module and inverse twist, then specialize the cyclotomic variable to obtain the rank-two anticyclotomic module. Coleman derivatives cut out its two closed signed kernels. Finite Kummer/Cartier comparison, shrinking universal formal norms and explicit reciprocity identify those kernels with annihilators of the same-sign divisible point modules. Fourier decomposition gives disjointness and rank upper bounds.

The two existence arguments are independent after that preparation. The separate dual-exponential comparison translates early CM zeta classes; Finis’s theorem then gives a plus element with unit δ-value by coefficient descent, without assuming signed freeness. A separable optimal modular parametrization supplies a primitive formal CM point. Its quasi-canonical isogeny chain, with the corrected p forward lattices, yields the initial trace −y and the two-step recurrence. Minus-point Herbrand quotients and primitive traces then force H¹ to vanish. Invariants identify the minus quotient coinvariants with O; Nakayama gives the free quotient and free minus kernel.

Finally augmentation linearity makes the optimal plus element generate the minus quotient. Disjointness turns that surjection into the integral direct sum. Perfectness of the pairing proves nonzero full-module character derivatives; the direct sum gives every matching derivative of each signed generator. Finite signed kernels and their Kummer maps are exported with their existing signs and transition maps. No finite invariant-control formula is asserted without its H¹ calculation.

## Layer targets

## ALU.0 — The Lubin–Tate unit tower

Atlas planets: Conductor parity, Norm-compatible local units, Two-variable unit freeness, Inverse Tate twist, Anticyclotomic unit quotient.

### Conductor parity of anticyclotomic characters

Target: `AnticyclotomicLocalUnits:ALU.0/conductor-parity` (definition).

For each finite continuous χ:Γ⁻→ℂ_p×, let c(χ)=0 for χ=1 and c(χ)=n+1 when χ first factors through Gal(Ψ_n/Φ), n≥1. Define Ξ⁺ by c even and Ξ⁻ by c odd. These are disjoint and exhaust the finite characters; conductor means the ideal p^c O, not the order of χ.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Use the local reciprocity conductor filtration of the specified tower, supplied by the missing Lubin–Tate interface G1.
2. The finite quotient Γ⁻/(Γ⁻)^(p^n) has order p^n; an exact order-p^r character, r≥1, has c=r+1.

**Dependencies.** G1: the specified LT conductor interface.

**Sources.** BKO21, §2, p.948.

**Uses.** BKO21, §2, pp.948–949: Chooses the kernels defining the two unit modules.; BKO21, §4, p.955 and §6.0.2, p.962: Chooses the same-parity conditions on formal points..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.conductorExponent` | data | The exponent is the minimal ramification conductor, with c(1)=0. |
| `Anticyclotomic.mem_sign_iff` | characterisation | χ∈Ξ⁺ iff c(χ) is even, and χ∈Ξ⁻ iff c(χ) is odd. |
| `Anticyclotomic.conductor_inverse` | compatibility | c(χ⁻¹)=c(χ); parity is preserved by coefficient embeddings and inversion. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `trivial_plus` | value | The trivial character lies in Ξ⁺ and not Ξ⁻. |
| `order_p_plus` | value | An exact order-p character has conductor p² and lies in Ξ⁺. |
| `order_p_squared_minus` | non-example | An exact order-p² character has conductor p³ and lies in Ξ⁻; using character order as conductor fails. |

### The principal-unit limit and its omega component

Target: `AnticyclotomicLocalUnits:ALU.0/principal-unit-limit` (construction).

Put P_n=TauCeti.unitFiltration(Φ_n,1), written additively as a compact ℤ_p-module. Form Ũ∞=lim_N(P_n⊗ℤ_p O) with its inverse-limit topology. Define U∞=e_ω Ũ∞, where e_ω=|Δ|⁻¹Σ_d ω(d)⁻¹d. It is a compact O[[Γ]]-module through the actual Galois action.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Use the pinned principal-unit subgroup, not a newly defined unit group. Norms preserve principal units and commute with Δ.
2. O is finite free over ℤ_p, so tensoring and this compact inverse limit agree; supply this instance through L5.
3. Since |Δ|=p²−1 is an O-unit, integral character projection defines the omega part.

**Dependencies.** `tauceti:TauCeti.unitFiltration`, `tauceti:TauCeti.unitFiltration_one`, `PadicMeasuresIwasawaAlgebras:L1`, `PadicMeasuresIwasawaAlgebras:L4`, `PadicMeasuresIwasawaAlgebras:L5`.

**Sources.** BKO21, §2, p.948.

**Uses.** BKO21, §2, p.948: Underlying compact module for the quotient and Coleman interpolation.; Rubin87, Proposition 5.2, p.412: Local class-field-theoretic dual of formal Kummer points..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.unitLimit_projection` | projection | The n-th projection has codomain P_n⊗O and norm of projection n+1 equals projection n. |
| `Anticyclotomic.unitLimit_ext` | extensionality | Two compatible families are equal exactly when all finite-level coordinates agree. |
| `Anticyclotomic.omegaPart_mem` | characterisation | x belongs to U∞ iff d·x=ω(d)x for every d∈Δ. |
| `Anticyclotomic.unitLimit_action` | compatibility | Finite-level group-ring projections of the completed action agree with the Galois action on principal units. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `principal_depth_one` | compatibility | P_n equals the valuation-ring principal unit group by the pinned unitFiltration_one theorem. |
| `norm_tensor` | relation | Norm(u⊗a)=N(u)⊗a; the norm is not multiplication by [Φ_(n+1):Φ_n] on an arbitrary unit. |
| `omega_idempotent` | non-example | For a nontrivial character η≠ω, e_ω kills an η-eigenvector; the whole unit limit is not its omega part. |

### Two-variable omega-unit freeness

Target: `AnticyclotomicLocalUnits:ALU.0/unit-rank-two` (theorem).

U∞ is a finite free Λ₂=O[[Γ]]-module of rank two, with its compact module topology.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Apply Wintenberger §4(i),(iii) to K=Φ, rank r=2 and the irreducible ℚ_p-character containing ω; normal basis and logarithm give degree [Φ:ℚ_p]=2.
2. Check ω is nontrivial and differs from the cyclotomic torsion character ω^(p+1); after extending the coefficient ring to O, project to the ω embedding, rather than retaining both conjugate characters.
3. For the proof, use §5.2 norm-kernel control, §5.3 finite coinvariants, §5.5.1 torsion-free O-rank 2p^(2n), and the complete-module criterion of §5.4. The general one-variable unit-control input is recorded as G5 until its supplier is located.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.0/principal-unit-limit`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`, `PadicMeasuresIwasawaAlgebras:L4`, `PadicMeasuresIwasawaAlgebras:L5`.

**Sources.** Rubin87, Proposition 1.1, p.407; see Wintenberger §4, pp.91–92 and §5, pp.92–98; Win80, §4, theorem (i),(iii), pp.91–92; §5.2–5.5.3, pp.92–98.

**Check.** The ω component has Λ₂-rank two; the cyclotomic tame character ω^(p+1) is excluded from the freeness input.

### The inverse Tate twist

Target: `AnticyclotomicLocalUnits:ALU.0/inverse-tate-twist` (definition).

For a compact O-module M with compatible Galois action, define M*=Hom_O(T,M), with (g·h)(t)=g(h(g⁻¹t)). Evaluation on any O-basis of T identifies M* with M as O-modules; its action is the action on M multiplied by κ⁻¹. In particular U∞*=(Ũ∞*)^Δ.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Use the actual free rank-one Lubin–Tate Tate module from G1.
2. Evaluate at a basis, verify diagonal action and change-of-basis transition, and use the omega projector.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.0/principal-unit-limit`.

**Sources.** BKO21, §2, p.948.

**Uses.** BKO21, §4, pp.954–955: Produces an untwisted Φ/O-valued Kummer pairing.; BKO21, §2, p.948: Turns σ−κ(σ) into σ−1 in the anticyclotomic quotient..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.inverseTwist_eval` | equivalence | Evaluation at v:T gives an O-linear equivalence M*≃M. |
| `Anticyclotomic.inverseTwist_action` | relation | Under evaluation at v, g acts by κ(g)⁻¹ times its action on M. |
| `Anticyclotomic.inverseTwist_changeBasis` | functoriality | Replacing v by bv changes evaluation to b times the old evaluation, b∈O×; evaluations compose with all O-linear equivariant maps. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `trivial_action_twists` | non-example | If M=O has trivial action, its inverse twist has character κ⁻¹, not κ. |
| `omega_fixed` | compatibility | Δ acts trivially on the inverse twist of its ω-eigenspace. |
| `basis_minus_one` | value | Evaluation at −v is minus evaluation at v; the underlying Hom object is unchanged. |

### The twisted anticyclotomic quotient

Target: `AnticyclotomicLocalUnits:ALU.0/anticyclotomic-quotient` (construction).

For a topological generator σ of Γ⁺, define V∞=U∞/(σ−κ(σ))U∞ and V∞*=U∞*/(σ−1)U∞*. Use the closed images, and the completed quotient action, so V∞ and V∞* are compact finite free Λ=O[[Γ⁻]]-modules of rank two. Inverse twisting commutes with this quotient and the quotients are independent of σ.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Twist the completed algebra by κ⁻¹, reducing the relation to a coordinate variable σ−1.
2. In O[[S,T]], the quotient by S is O[[T]]; base-change the free module Λ₂². Its image is closed by compactness.
3. If σ′=σ^a, a∈ℤ_p×, the two defining elements differ by a unit using the binomial series and κ-twist.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.0/unit-rank-two`, `AnticyclotomicLocalUnits:ALU.0/inverse-tate-twist`, `PadicMeasuresIwasawaAlgebras:L1`, `PadicMeasuresIwasawaAlgebras:L4`, `PadicMeasuresIwasawaAlgebras:L5`.

**Sources.** BKO21, §2, p.948.

**Uses.** BKO21, Theorem 2.1, p.949: The module on which the integral signed decomposition is proved.; Rubin87, Proposition 5.4, p.412: Dual of formal points in the anticyclotomic subextension..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.quotient_lift` | universal-property | A continuous O-linear equivariant map from U∞* factors uniquely through V∞* iff it kills (σ−1)U∞*. |
| `Anticyclotomic.quotient_twist` | compatibility | (U∞/(σ−κ(σ))) * identifies with U∞*/(σ−1), compatibly with quotient maps. |
| `Anticyclotomic.quotient_generator_independent` | equivalence | The identity on U∞ induces the canonical quotient equivalence for σ and σ^a, for a∈ℤ_p×. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `rank_two_survives` | value | Specializing the Γ⁺ coordinate leaves Λ², not a rank-one module. |
| `sigma_relation` | non-example | In the untwisted quotient σ acts as κ(σ), not as 1. |
| `generator_change` | compatibility | For σ′=σ^(1+p), the defining closed ideals and canonical quotient maps agree. |

## ALU.1 — Coleman derivatives and signed units

Atlas planets: Lubin–Tate Coleman series, Coates–Wiles derivatives, Character derivatives, Trivial-character Euler factor, Signed unit modules.

### Lubin–Tate Coleman interpolation

Target: `AnticyclotomicLocalUnits:ALU.1/lubin-tate-coleman` (construction).

Given a norm-compatible family u_n∈P_n and a basis v=(v_n) of T_πF, [π]v_(n+1)=v_n, there is a unique Coleman unit f_u∈O[[X]]× with f_u(v_n)=u_n for every n and N_F(f_u)=f_u, where N_F(f)([π]X)=∏_(w∈F[π])f(X[+]_F w). The association is multiplicative, continuous and equivariant; changing v to bv replaces f_u by f_u∘[b⁻¹]_F.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Reuse the parent’s determinant norm, finite-free change-of-variable and compact interpolation method; replace multiplicative formal-group torsion by the specified F[π].
2. Prove [π] interpolation and norm compatibility before uniqueness, and establish finite-free rank p² over the image of [π]. The missing full LT Coleman proof input is G6.
3. A p-adic Tate sequence w_n with [p]w_(n+1)=w_n must be replaced by v_n=(−1)^n w_n (up to a single unit rescaling). The original sequence does not satisfy the required relation.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.0/principal-unit-limit`, `ColemanPowerSeries:L1`, `mathlib:PowerSeries.derivative`.

**Sources.** BKO21, §2, p.948 and footnote 2; Rubin87 §2, pp.407–408.

**Uses.** BKO21 §2, pp.948–949: The invariant logarithmic derivative defines δ and δ_n.; Rubin87 Lemma 2.1, pp.407–408: The norm identity supplies the trace relation used for level-independent character derivatives..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.colemanSeries_eval` | simp | The series relative to v evaluates to u_n at every v_n, with [π]v_(n+1)=v_n. |
| `Anticyclotomic.colemanSeries_norm` | characterisation | The interpolating unit series is fixed by N_F, and the interpolation values determine it uniquely. |
| `Anticyclotomic.colemanSeries_mul` | structure | The unit-series assignment is a continuous multiplicative map on the norm-compatible unit limit. |
| `Anticyclotomic.colemanSeries_basis` | compatibility | For v′=bv, the new series is f_u∘[b⁻¹]_F, preserving evaluation at the new torsion basis. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `coleman_identity_unit` | degenerate | The compatible sequence u_n=1 has the constant series 1, with N_F(1)=1. |
| `coleman_basis_negative` | compatibility | For v′=−v, f_u([−1]_F(v′_n))=u_n; [−1]_F must be the formal inverse, not an assumed coordinate negation. |
| `coleman_pi_sequence` | non-example | A sequence compatible under [p] fails the required [−p] relation until its n-th term is multiplied by (−1)^n. |

### The Coates–Wiles derivatives

Target: `AnticyclotomicLocalUnits:ALU.1/coates-wiles-derivatives` (definition).

For a pure element x=u⊗a⊗v⁻¹ of U∞*, using the Coleman series relative to v, put δ(x)=a f_u′(0)/f_u(0)∈O and δ_n(x)=a f_u′(v_n)/(λ′(v_n)f_u(v_n))∈Φ_n. Extend O-linearly and continuously. These maps are independent of tensor presentations and Tate basis, δ_n(gx)=gδ_n(x), and δ(gx)=δ(x).

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Multiplicativity of Coleman series gives additivity of logarithmic derivatives.
2. For v′=bv, the series changes by [b⁻¹], the tensor scalar by b, and the invariant derivative satisfies λ′([b]X)[b]′(X)=bλ′(X); all factors cancel.
3. Evaluate at zero to get integrality and augmentation linearity of δ; evaluate at v_n to get the finite-level covariance.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.1/lubin-tate-coleman`, `AnticyclotomicLocalUnits:ALU.0/inverse-tate-twist`, `mathlib:PowerSeries.coeff`, `mathlib:PowerSeries.constantCoeff`, `mathlib:PowerSeries.derivative`.

**Sources.** BKO21, §2, pp.948–949.

**Uses.** BKO21, Proposition 3.3, p.953: Evaluates the projected early CM classes.; BKO21, Theorem 5.8, p.960: Augmentation-linear δ detects a primitive generator of the rank-one quotient..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.delta_add` | structure | δ and δ_n are continuous O-linear maps on the inverse twist. |
| `Anticyclotomic.delta_basis_independent` | compatibility | The simultaneous changes v→bv, a→ba, f→f∘[b⁻¹] leave δ and every δ_n unchanged. |
| `Anticyclotomic.delta_galois` | relation | δ_n(gx)=gδ_n(x) and δ(gx)=δ(x); thus δ(r x)=aug(r)δ(x). |
| `Anticyclotomic.delta_trace` | relation | Tr_(Φ_(n+1)/Φ_n)δ_(n+1)(x)=π δ_n(x). |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `constant_series_zero` | value | The logarithmic derivative of a constant Coleman unit is zero. |
| `invariant_denominator` | non-example | A nonconstant λ′(v_n) must divide the ordinary logarithmic derivative; omitting it breaks coordinate change. |
| `basis_unit_cancel` | compatibility | For v′=−v the tensor scalar and derivative chain-rule sign cancel. |

### Character Coates–Wiles derivatives

Target: `AnticyclotomicLocalUnits:ALU.1/character-derivative` (definition).

For a finite character χ of Γ inflated to Gal(Φ_n/Φ), with values in a finite coefficient extension L/Φ and n large enough, define δ_χ(x)=π^(−n−1)Σ_(g∈Gal(Φ_n/Φ)) χ(g) gδ_n(x) in Φ_nL (or its compatible tensor realization). This value is independent of increasing n, is O-linear and satisfies δ_χ(gx)=χ(g)⁻¹δ_χ(x).

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. The Coleman norm identity gives Tr δ_(n+1)=πδ_n, cancelling exactly the new π denominator.
2. Change variables in the finite sum to obtain the inverse-character covariance. Use equivariant embeddings for different coefficient fields.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.1/coates-wiles-derivatives`, `AnticyclotomicLocalUnits:ALU.0/conductor-parity`.

**Sources.** BKO21, §2, p.949; Rubin87 Lemma 2.1, pp.407–408.

**Uses.** BKO21, §2, p.949: Defines the signed vanishing conditions.; BKO21, Corollary 2.2, p.949: Tests each generator at every character of the matching sign..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.deltaChar_level` | compatibility | Evaluating at any larger admissible Φ_m yields the same value after the canonical embedding. |
| `Anticyclotomic.deltaChar_action` | relation | δ_χ(r x)=r(χ⁻¹)δ_χ(x), for the completed character specialization. |
| `Anticyclotomic.deltaChar_coefficients` | functoriality | Coefficient embeddings transport δ_χ to the derivative for the embedded character. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `inverse_character_action` | non-example | For χ(g)≠χ(g)⁻¹, δ_χ(gx) uses χ(g)⁻¹, so direct-character covariance fails. |
| `pi_level_scale` | relation | The full Gal(Φ_n/Φ) sum is divided by π^(n+1), not by p^n or \|Gal(Φ_n/Φ)\|. |
| `one_level_up` | compatibility | For an inflated character the n+1 formula equals the n formula by Tr δ_(n+1)=πδ_n. |

### The trivial-character Euler factor and descent

Target: `AnticyclotomicLocalUnits:ALU.1/trivial-derivative` (theorem).

At the trivial character, δ_1=(1−π⁻¹)δ=(1+p⁻¹)δ. Each δ_χ for χ on Γ⁻ kills (σ−1)U∞*, and hence descends to V∞*; so does δ. The descended δ is Λ-linear when O is a Λ-module via augmentation.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Differentiate the Coleman norm identity using h=f′/(fλ′). At X=0, Σ_(w∈F[π])h(w)=πh(0).
2. Remove w=0 and divide by π to obtain δ_1=(1−π⁻¹)δ. This is not a minus sign from the p-adic Tate generator.
3. For χ|Γ⁺=1, inverse covariance kills σ−1. The nonzero Euler factor then proves descent of δ.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.1/character-derivative`, `AnticyclotomicLocalUnits:ALU.0/anticyclotomic-quotient`.

**Sources.** BKO21, §2, pp.948–949 and proof of Theorem 5.8, p.960.

**Check.** At p=5, δ_1=(6/5)δ. The kernels agree, but the values must not be identified without the Euler factor.

### Signed anticyclotomic unit modules

Target: `AnticyclotomicLocalUnits:ALU.1/signed-unit-modules` (definition).

For ε∈{+,−}, define V∞*,ε=⋂_(χ∈Ξ^(−ε)) ker δ_χ inside V∞*. These are closed Λ-submodules. In particular the minus module kills the trivial character and lies in ker δ; the plus module is allowed to have a unit δ-value.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Use inverse-character specialization to prove stability under the full completed action.
2. Intersections of closed kernels are closed, hence finite generation follows from noetherianity of Λ and V∞*≃Λ².

**Dependencies.** `AnticyclotomicLocalUnits:ALU.1/character-derivative`, `AnticyclotomicLocalUnits:ALU.1/trivial-derivative`, `AnticyclotomicLocalUnits:ALU.0/conductor-parity`.

**Sources.** BKO21, §2, p.949.

**Uses.** BKO21, Theorems 2.1 and 3.4, pp.949 and 953–954: The plus optimal unit lies here and the final theorem complements the two modules.; BKO21, §4, p.955: These are the annihilators of the same-sign divisible formal-point modules..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.mem_signedUnits` | characterisation | x∈V∞*,ε iff δ_χ(x)=0 for every opposite-parity χ. |
| `Anticyclotomic.signedUnits_closed` | structure | Each signed unit module is a closed finite Λ-submodule of V∞*. |
| `Anticyclotomic.delta_minus_zero` | relation | δ vanishes on V∞*,− because 1∈Ξ⁺. |
| `Anticyclotomic.signedUnits_baseChange` | functoriality | For a finite free coefficient extension W/O, the simultaneous kernels commute with tensoring, by choosing an O-basis of W. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `same_parity_not_killed` | non-example | The definition does not require a plus element to have δ_1=0. |
| `minus_trivial_zero` | value | Every minus element has δ=0 using the nonzero trivial Euler factor. |
| `zero_both_signs` | degenerate | Zero belongs to both kernels; nonzero common elements must be excluded by the later pairing theorem. |

## ALU.2 — Formal Kummer duality and reciprocity

Atlas planets: Vanishing of formal norms, Kummer pairing, Anticyclotomic Kummer duality, Wiles trace formula.

### Finite formal Kummer and Cartier comparison

Target: `AnticyclotomicLocalUnits:ALU.2/finite-formal-kummer` (comparison).

For every finite L/Φ in Θ∞ or Ψ∞ and k≥1, construct 0→F(L)/π^k→H¹(L,F[π^k])→H¹(L,F(Φ̄))[π^k]→0. Identify the finite Cartier dual of F[π^k] with Hom(F[π^k],μ_(p^k)) with its actual action, and compare the cup-product local invariant to the formal Kummer evaluation pairing. After inverse Tate twisting, the resulting limit pairing has values Φ/O.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Prove formal division is surjective over the algebraic closure, so the Kummer connecting map is the actual continuous-cohomology map.
2. Use finite Cartier evaluation, not an assumed self-duality of the height-two formal O-module. Record the realization/comparison still needed as G7.
3. Check restriction/corestriction adjunction and the coefficient trace from O/π^k to ℤ/p^k, then undo the trace by O-linearity.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.0/inverse-tate-twist`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `ArithmeticGaloisDuality:R02.1/discrete-quotient-colimit`.

**Sources.** BKO21, §4, equation (4.1), p.954; Rubin87 Lemma 5.1 and Proposition 5.2, pp.411–412.

**Check.** At k=1 the connecting map has kernel [π]F(L), and restriction/corestriction is adjoint under the finite local invariant.

### Vanishing of universal formal norms

Target: `AnticyclotomicLocalUnits:ALU.2/formal-norm-vanishing` (theorem).

For the specified height-two F and each finite base L in Θ∞ or Ψ∞, the inverse limit of F(L′) over finite L′/L in the respective tower, with formal trace transition, is zero. The dual direct limit of the formal Kummer obstruction H¹(L′,F(Φ̄))[π^k] vanishes with the matching transition maps.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. For an unramified base in a totally ramified ℤ_p-extension, Hazewinkel Theorem 1.3 gives Tr(F(K_n))=F^(a_n)(K), a_n=n−floor((n−1)/2), which tends to infinity.
2. To kill every coordinate of a compatible family, prove the same shrinking estimate after every finite ramified base, and handle a cofinal ℤ_p direction in the rank-two tower. The cited theorem alone is insufficient; this extension is G8.
3. Use G7 finite formal duality, finite obstruction groups and the stated limit theorems to deduce the direct-limit assertion. Do not infer a lim¹ assertion from finite generation alone.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.2/finite-formal-kummer`, `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`, `PadicMeasuresIwasawaAlgebras:L5`.

**Sources.** Haz77, Theorem 1.3, pp.305–306, and its proof §4, pp.312–314; Rubin87 Proposition 4.5 and Lemma 5.1, p.411; Rubin87, Proposition 4.5 and Lemma 5.1, p.411.

**Check.** The unramified estimate has a_1=1, a_2=2 and a_3=2, and grows without bound. Coordinatewise zero in the inverse limit requires estimates at every finite base.

### The two-variable Kummer pairing

Target: `AnticyclotomicLocalUnits:ALU.2/two-variable-kummer-pairing` (construction).

Construct a perfect continuous/discrete O-duality F(Θ∞)⊗_O Φ/O ≃ Hom_O,cts(U∞*,Φ/O), equivalently F(Θ∞)⊗Φ/O ≃ Hom_O(U∞,F[π∞]); it is induced by the Kummer map and local reciprocity, not by selecting an arbitrary perfect pairing.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Pass from finite formal Kummer sequences using norm-vanishing of the obstruction.
2. Restrict to the full torsion extension where F[π∞] is trivial, then take exact Δ-invariants.
3. Apply norm-compatible local Artin maps and project to ω, checking that valuation and non-ω pieces contribute no Hom into F[π∞]. Establish topology and biduality by the compact inverse-limit/discrete direct-limit comparison.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.2/formal-norm-vanishing`, `AnticyclotomicLocalUnits:ALU.0/principal-unit-limit`, `AnticyclotomicLocalUnits:ALU.0/inverse-tate-twist`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`, `ArithmeticGaloisDuality:R02.1/discrete-quotient-colimit`.

**Sources.** BKO21, §4, p.954; Rubin87 Proposition 5.2, p.412.

**Uses.** BKO21, §4, p.954: Descends to the anticyclotomic fixed field.; Rubin87, Proposition 5.6, p.413: Supplies the perfect pairing underlying the signed annihilator theorem..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.kummerPairing_finite` | compatibility | At finite torsion order this is connecting map, cup product, and the standard local invariant. |
| `Anticyclotomic.kummerPairing_equivariant` | relation | ⟨g y,g x⟩=⟨y,x⟩ after the inverse Tate twist. |
| `Anticyclotomic.kummerPairing_perfect` | equivalence | The discrete formal-point module equals the continuous O-dual of U∞*. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `pi_k_torsion` | compatibility | Pairing a point killed by π^k has value in π^(−k)O/O. |
| `transition_adjunction` | relation | Restriction on points is adjoint to norm on units. |
| `zero_point` | degenerate | The zero point pairs to zero with every unit; replacing formal Kummer by arbitrary lattice duality does not satisfy the finite comparison. |

### Descent of Kummer duality to the anticyclotomic tower

Target: `AnticyclotomicLocalUnits:ALU.2/anticyclotomic-kummer-pairing` (theorem).

The pairing induces a perfect Γ⁻-equivariant duality D=F(Ψ∞)⊗Φ/O ≃ Hom_O,cts(V∞*,Φ/O). In particular the annihilator of all formal points in V∞* is zero.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Taking Γ⁺-invariants on the unit dual gives the continuous dual of the coinvariant V∞*.
2. Prove F(Θ∞) has no π-torsion (the degree of Θ_n/Φ is a p-power whereas F[π] has nontrivial tame action).
3. Compare (F(Θ∞)⊗Φ/O)^(Γ⁺) with F(Ψ∞)⊗Φ/O via the torsion-free invariant sequence; kill its H¹(Γ⁺,F(Θ∞)) obstruction by inflation–restriction and the direct-limit vanishing.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.2/two-variable-kummer-pairing`, `AnticyclotomicLocalUnits:ALU.0/anticyclotomic-quotient`, `AnticyclotomicLocalUnits:ALU.2/formal-norm-vanishing`, `ArithmeticGaloisDuality:R02.1/discrete-quotient-colimit`.

**Sources.** BKO21, §4, p.954; Rubin87 Proposition 5.4 and Lemma 4.4, pp.410–412.

**Check.** The dual quotient is by σ−1 on inverse twists; replacing it by σ−κ(σ) after twisting gives the wrong invariants.

### Wiles’s trace formula in the pi normalization

Target: `AnticyclotomicLocalUnits:ALU.2/wiles-trace-formula` (theorem).

For y∈F(Ψ_n), x∈V∞*, k≥0 and m sufficiently large relative to y and k, the Kummer pairing is ⟨y⊗π^(−k),x⟩=π^(−m−1−k) Tr_(Φ_m/Φ)(δ_m(x)λ(y)) modulo O. Here δ_m is computed on any lift to U∞*, and the formula is independent of the lift and of admissible m.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Apply the height-two explicit reciprocity theorem to the actual norm-compatible units and π-adic Tate generator; account for the invariant differential λ′.
2. Check the finite cup-product/Artin convention in G7, then pass to the limit and project to Γ⁺-coinvariants.
3. Read and decompose Wiles’s original proof before closing this target; BKO’s statement and Rubin Theorem 5.3 supply its exact present interface, but not a replacement proof. This source-access work is G9.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.2/anticyclotomic-kummer-pairing`, `AnticyclotomicLocalUnits:ALU.1/coates-wiles-derivatives`, `AnticyclotomicLocalUnits:ALU.1/character-derivative`.

**Sources.** BKO21, §4, p.955; Rubin87 Theorem 5.3, p.412; Rubin87, Theorem 5.3, p.412.

**Check.** Changing m to m+1 multiplies the trace derivative by π, cancelling exactly the next π denominator. The value must also be independent of the chosen lift to U∞*.

## ALU.3 — Signed formal points and annihilators

Atlas planets: Character logarithms, Signed formal points, Formal-point Fourier decomposition, Signed divisible-point sum, Signed annihilator theorem, Signed rank bounds.

### Character logarithms of formal points

Target: `AnticyclotomicLocalUnits:ALU.3/character-logarithm` (definition).

For y∈F(Ψ_n) and a finite χ of Γ⁻, choose m≥n through which χ factors and put λ_χ(y)=p^(−m)Σ_(g∈Gal(Ψ_m/Φ))χ(g)⁻¹ λ(y)^g. This is independent of m. It is O-linear, λ_χ(g y)=χ(g)λ_χ(y), and it vanishes when χ does not factor through the field of definition of y.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Use λ([a]y)=aλ(y) and λ(y[+]z)=λ(y)+λ(z). The formal logarithm is injective on Ψ∞ because there is no nonzero π-power torsion.
2. Trace of an inflated y multiplies by p, exactly cancelling the p^(−m) normalization. A character nontrivial on the relative Galois group has zero sum.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.0/conductor-parity`, `AnticyclotomicLocalUnits:ALU.2/anticyclotomic-kummer-pairing`.

**Sources.** BKO21, §4, p.955; Rubin87 Lemma 5.5(i)–(iv), p.413.

**Uses.** BKO21, §4, p.955: Cuts out signed point modules.; Rubin87, Proposition 5.6, p.413: Fourier-expands Wiles’s trace formula..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.logChar_level` | compatibility | The normalized sums at m and m+1 agree for an inflated character. |
| `Anticyclotomic.logChar_action` | relation | λ_χ(g y)=χ(g)λ_χ(y), with the direct character, opposite to δ_χ covariance. |
| `Anticyclotomic.logChar_highConductor` | simp | λ_χ(y)=0 if χ is nontrivial on Gal(Ψ_m/Ψ_n). |
| `Anticyclotomic.logChar_trivial` | compatibility | λ_1(y)=p^(−n)Tr_(Ψ_n/Φ)λ(y). |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `base_trivial` | value | For y∈F(Φ), λ_1(y)=λ(y). |
| `base_nontrivial` | degenerate | For y∈F(Φ) and χ≠1, λ_χ(y)=0. |
| `normalization_p` | non-example | The point logarithm uses p^(−n), whereas the unit derivative uses π^(−n−1); their signs and exponents cannot be interchanged. |

### Signed formal-point modules

Target: `AnticyclotomicLocalUnits:ALU.3/signed-formal-points` (definition).

Define A^ε={y∈F(Ψ∞) : λ_χ(y)=0 for every χ∈Ξ^ε}. Thus point signs kill the same parity. Put A_n^ε=A^ε∩F(Ψ_n) and D^ε=A^ε⊗_O Φ/O. Regard D^ε as a submodule of D through the natural tensor map; this map is injective because A^ε is O-saturated in F(Ψ∞).

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Intersections of kernels are O-submodules stable under Γ⁻. As every character value lies in a characteristic-zero field, their kernel intersection is O-saturated.
2. Use torsion-freeness of F(Ψ∞)/A^ε to justify injection after tensoring Φ/O; this tensor product is not flat on arbitrary inclusions.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.3/character-logarithm`, `AnticyclotomicLocalUnits:ALU.0/conductor-parity`.

**Sources.** BKO21, §4, p.955; Rubin87 Lemma 5.5, p.413.

**Uses.** BKO21, Corollary 5.6, p.959: The invariants of D⁻ control the minus unit quotient.; BKO21, §6.0.2, p.962: The finite-level signed local conditions use these exact modules..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.mem_signedPoints` | characterisation | y∈A^ε iff its same-parity character logarithms vanish. |
| `Anticyclotomic.signedPoints_finite` | compatibility | A_n^ε is the same-parity kernel intersection on F(Ψ_n); all higher characters vanish automatically. |
| `Anticyclotomic.signedPoints_saturated` | structure | If a≠0 in O and [a]y∈A^ε, then y∈A^ε. |
| `Anticyclotomic.signedPoints_tensor_injective` | compatibility | D^ε→D is the injective map induced by the actual inclusion of formal points. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `base_minus` | value | F(Φ)⊆A⁻, since all odd-conductor characters are nontrivial. |
| `base_plus_zero` | non-example | A⁺∩F(Φ)=0 because the trivial logarithm is injective. |
| `opposite_unit_convention` | compatibility | A⁺ kills Ξ⁺ whereas V∞*,+ kills Ξ⁻; giving the two kernels identical indexing is wrong. |

### Fourier decomposition of finite formal lattices

Target: `AnticyclotomicLocalUnits:ALU.3/formal-fourier-lattices` (theorem).

For each n, λ identifies a sufficiently deep finite-index subgroup of F(Ψ_n) with a Γ⁻-stable O-lattice in Ψ_n. By normal basis this rational representation is Φ[Gal(Ψ_n/Φ)]. Each finite character component is nonzero. Character projections split it into the two conductor parities, with integral denominators dividing p^n.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Use convergence and inverse convergence of the formal logarithm on a sufficiently deep ideal, preserving the Galois action; the specific analytic interface is part of G1.
2. Apply the local normal-basis theorem and finite Fourier inversion over a field containing character values.
3. Descend the parity projectors from the character-value extension, noting parity is Galois invariant; multiplying by p^n clears the averaging denominator. The integral finite-index lattice calculation is required, not an assertion that O[G_n] splits integrally into characters.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.3/character-logarithm`.

**Sources.** Rubin87, Lemma 5.5, p.413; proof of Lemma 7.1, p.417.

**Check.** The trivial isotypic component occurs once over Φ; each rational character orbit at exact order p^r also occurs once. An integral direct character splitting is not asserted.

### The sum of the signed divisible-point modules

Target: `AnticyclotomicLocalUnits:ALU.3/divisible-point-sum` (theorem).

A⁺∩A⁻=0; for each n, [p^n]F(Ψ_n)⊆A_n⁺+A_n⁻; hence D=D⁺+D⁻. Both A⁺ and A⁻ have infinite O-rank. This stage asserts a sum of divisible submodules, without assuming their intersection is zero.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Fourier inversion and injectivity of λ give the zero intersection and the p^n denominator bound.
2. Since Φ/O is divisible, the finite-level p^n multiple condition makes the images span D.
3. Choose arbitrarily high conductor components of each parity in the regular representation and clear denominators to obtain unbounded O-rank.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.3/signed-formal-points`, `AnticyclotomicLocalUnits:ALU.3/formal-fourier-lattices`.

**Sources.** BKO21, §4, equation (4.2), p.955; Rubin87 Lemma 5.5(v), p.413.

**Check.** At n=0, A_0⁺=0 and A_0⁻=F(Φ). At n=1 all characters have plus conductor parity, so A_1⁺=0.

### Finite-level saturation of formal points

Target: `AnticyclotomicLocalUnits:ALU.3/finite-formal-saturation` (theorem).

For each n, F(Ψ_n) is O-saturated in F(Ψ∞), and A_n^ε is O-saturated in A^ε. Consequently F(Ψ_n)⊗Φ/O→D and A_n^ε⊗Φ/O→D^ε are injective.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. If [π]z belongs to F(Ψ_n), then for every g fixing Ψ_n, [π](gz−z)=0. The absence of nonzero F[π]-torsion in Ψ∞ implies gz=z. Thus z is defined over Ψ_n.
2. Iterate and use units of O to prove saturation by every nonzero scalar. Intersect with the signed kernel conditions.
3. The quotient is O-torsion-free; the Tor exact sequence then gives the tensor injections.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.3/signed-formal-points`, `AnticyclotomicLocalUnits:ALU.2/anticyclotomic-kummer-pairing`.

**Sources.** BKO21, The torsion-free Kummer argument in §4, p.954; Rubin87 Proposition 5.4 and Lemma 5.5, pp.412–413.

**Check.** If [π]z is fixed by the finite-level stabilizer, then gz−z is π-torsion in F(Ψ∞), hence zero. This tests the actual field of definition, not merely rational Fourier support.

### The signed annihilator theorem

Target: `AnticyclotomicLocalUnits:ALU.3/signed-annihilator` (theorem).

Under the actual Kummer pairing, Ann_(V∞*)(D^ε)=V∞*,ε for each ε. Therefore D^ε≃Hom_O,cts(V∞*/V∞*,ε,Φ/O), with the Γ⁻ action on the dual given by inversion.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. At a common finite level, insert the character expansions into the trace formula. Direct χ-covariance of λ_χ pairs with inverse χ-covariance of δ_χ.
2. If δ_χ vanishes for all opposite-parity characters, every point in A^ε pairs trivially.
3. Conversely, take a sufficiently deep formal point supported in one opposite-parity character orbit. Normal basis gives a nonzero logarithm there. Vary π-power denominators in the pairing to force δ_χ(x)=0.
4. Use the closedness of the unit submodule and the perfect compact/discrete duality to identify the quotient dual.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.2/wiles-trace-formula`, `AnticyclotomicLocalUnits:ALU.3/signed-formal-points`, `AnticyclotomicLocalUnits:ALU.3/formal-fourier-lattices`, `AnticyclotomicLocalUnits:ALU.3/divisible-point-sum`, `AnticyclotomicLocalUnits:ALU.1/signed-unit-modules`, `AnticyclotomicLocalUnits:ALU.3/finite-formal-saturation`.

**Sources.** BKO21, §4, p.955; Rubin87 Proposition 5.6 and Corollary 5.7, pp.413–414.

**Check.** The plus unit annihilator is D⁺, whose points have logarithms supported in Ξ⁻; using the opposite signed point module fails the Fourier calculation.

### Disjointness and rank upper bounds

Target: `AnticyclotomicLocalUnits:ALU.3/signed-rank-bounds` (theorem).

V∞*,+∩V∞*,−=0 and rank_Λ V∞*,ε≤1. Each quotient V∞*/V∞*,ε is O-torsion-free and has positive Λ-rank.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. An element killing D⁺ and D⁻ kills D, hence is zero by perfectness.
2. D^ε is divisible, so its compact dual quotient is O-torsion-free. If that finite Λ-module had Λ-rank zero, Weierstrass preparation after excluding vertical torsion would make it finite over O.
3. Its dual would then have finite O-corank. Finite-level saturation injects each finite signed lattice tensored with Φ/O into D^ε, so their unbounded character components give unbounded O-corank, a contradiction. Subtract the positive quotient rank from rank_Λ V∞*=2.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.3/signed-annihilator`, `AnticyclotomicLocalUnits:ALU.3/divisible-point-sum`, `AnticyclotomicLocalUnits:ALU.0/anticyclotomic-quotient`, `PadicMeasuresIwasawaAlgebras:L4`, `AnticyclotomicLocalUnits:ALU.3/finite-formal-saturation`.

**Sources.** BKO21, §4, p.955; Rubin87 Corollary 5.8, p.414.

**Check.** Both signed quotients have positive Λ-rank and are O-torsion-free before proving either is Λ-free.

## ALU.4 — The early CM optimal unit

Atlas planets: Auxiliary canonical CM character, Projected CM zeta class, CM reciprocity values, Optimal plus unit.

### An auxiliary CM field and character

Target: `AnticyclotomicLocalUnits:ALU.4/auxiliary-cm-field` (theorem).

There exists an imaginary quadratic K with 2 split, p inert and p∤h_K. Choose a canonical Hecke character φ of infinity type (1,0), conductor f supported at ramified primes, φ(pO_K)=−p, W(φ)=+1, a CM elliptic realization over the Hilbert class field H with good reduction at p, and its CM period Ω. There is a split rational prime l≥5, coprime to p h_K N(f), with p∤(l−1).

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. For K, use the squarefree part of −(m+kp), with m+kp≡7 mod 8, p inert, and discriminant bounded in terms of p; the class-number estimate makes h_K<p outside the explicit small-prime range.
2. For 5≤p≤47, use discriminant −7 (class number 1) for p=5,13,17,19,31,41,47; −15 (class number 2) for p=7,11,29,37,43; and −31 (class number 3) for p=23. All discriminants are 1 mod 8 and Euler’s criterion gives (D/p)=−1. Reduced-form certificates are given in the worked check. The general class-number estimate still needed is G10.
3. Canonical φ, its root number and elliptic realization, and the simultaneous choice of l, are the early-CM supplier contract G2. They precede any signed p-adic L-function.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.0/conductor-parity`.

**Sources.** BKO21, Lemma 3.1 and §3.0.1, pp.950–951; Theorem 3.4, pp.953–954.

**Check.** The finite certificates use only D=−7,−15,−31, with h=1,2,3; no listed p divides its chosen h. The general estimate and canonical-character inputs remain G10/G2.

### Projection of the early CM zeta class

Target: `AnticyclotomicLocalUnits:ALU.4/projected-cm-class` (construction).

For a finite anticyclotomic l-power character ν of conductor l^m, let R contain its values and the CM coefficients. Starting with the early norm-compatible CM zeta class z_(f l^m), define ξ_ν∈U∞*⊗_O R by: the CM coefficient untwist of (3.5); corestriction to H(E[p^(n+1)])L_r, with r chosen by the actual conductor field; localization at the primes above p; identification with the R-group ring of Gal(L_r/K); evaluation at ν; augmentation of R[Gal(H/K)]; projection to Δ-invariants; and the Kummer comparison. The family is compatible in n.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Use the early classes and their corestriction/reciprocity properties from G2. Construct every map in (3.5) with its source, target and Galois action.
2. Use p splitting in the relevant ring-class extension and p∤h_K to justify the semilocal group-ring identifications. The evaluation at ν is not an idempotent divided by a p-power.
3. If ν has exact order l^r, use conductor l^(r+1), not l^r. With m denoting conductor exponent, index L_r accordingly.
4. Augment H and average only over Δ of order p²−1. Apply the actual formal Kummer isomorphism to reach U∞*, keeping the invariant differential normalized by Ω.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.4/auxiliary-cm-field`, `AnticyclotomicLocalUnits:ALU.2/two-variable-kummer-pairing`, `AnticyclotomicLocalUnits:ALU.0/inverse-tate-twist`.

**Sources.** BKO21, §3.0.2, equation (3.5), pp.952–953.

**Uses.** BKO21, Proposition 3.3, p.953: Computes the trivial and finite-character derivatives.; BKO21, Theorem 3.4, pp.953–954: Produces a plus class with unit derivative..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.xiNu_projection` | data | The finite-level image is the seven-map localization/projection composite, with each tensor coefficient retained. |
| `Anticyclotomic.xiNu_norm` | relation | Corestriction in the p-tower corresponds to norm of the unit coordinates, giving an element of the actual inverse limit. |
| `Anticyclotomic.xiNu_coefficients` | functoriality | Extending R or changing the chosen prime by its Galois transport commutes with the projected class. |
| `Anticyclotomic.xiNu_quotient` | projection | The anticyclotomic class is its image in V∞*⊗R, using σ−1 after inverse twisting. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `conductor_order_shift` | non-example | For an exact order-l character, the source ring class has conductor l²; choosing z_(f l) has the wrong field. |
| `delta_not_delta_prime` | compatibility | The class projection averages over Δ of order p²−1; Δ′ of order p+1 belongs to the point construction. |
| `no_final_L_function` | dependency | Every map is defined from early zeta classes and local cohomology before Rubin’s signed p-adic L-function exists. |

### Wiles reciprocity in dual-exponential form

Target: `AnticyclotomicLocalUnits:ALU.4/wiles-dual-exponential` (comparison).

For x∈U∞*⊗R, let x_n be its finite localized Kummer class in H¹(Φ_n,T_φ⁻¹(1)) under the CM comparison of (3.5), with the invariant differential identified with ω. For a finite χ of Γ inflated to Gal(Φ_n/Φ), the χ-weighted semilocal dual-exponential evaluation of x_n is δ_χ(x)ω. The finite local evaluation is normalized so that its coefficient in ω is π^(−n−1)δ_n(x); thus the character sum has exactly the denominator in the definition of δ_χ. The general dual exponential is imported, not reconstructed.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Import the existing de Rham dual exponential and its local-duality adjunction. Check the CM representation and chosen differential through the early CM supplier G2.
2. Apply Wiles reciprocity in the dual-exponential normalization referred to by BKO between (3.4) and (3.6). This is a separate comparison from the Φ/O-valued trace formula.
3. Verify the finite π^(−n−1) coefficient, semilocal trace, inverse Tate twist, and the sign of the local invariant against the original Wiles/Kato theorem. Those original proofs are unavailable here (G2/G9); this normalization is a target, not a checked proof.
4. Compose with the seven-map projection to pass from the early zeta-class dual-exponential formula to δ_χ(ξ_ν).

**Dependencies.** `AnticyclotomicLocalUnits:ALU.4/projected-cm-class`, `AnticyclotomicLocalUnits:ALU.1/character-derivative`, `AnticyclotomicLocalUnits:ALU.2/finite-formal-kummer`, `PadicHodgeRegulators:L1/dual-exponential`.

**Sources.** BKO21, Equations (3.4)–(3.6), pp.952–953; reference there to Kato 1993, Chapter II, Theorem 2.1.7.

**Check.** The target identifies the coefficient of ω with δ_χ using π^(−n−1), whereas the later pairing formula takes a further trace and reduces modulo O. These two interfaces must both be proved.

### CM-class derivative values and sign

Target: `AnticyclotomicLocalUnits:ALU.4/cm-class-values` (theorem).

With the chosen differential and CM period, δ(ξ_ν)=Ω⁻¹ L_(l^m f)(overline(φ)ν,1) and δ_χ(ξ_ν)=Ω⁻¹ L_(l^m p f)(overline(φ)νχ,1). Subscripts mean omission of those Euler factors. If ε=W(φ), the anticyclotomic image lies in V∞*,ε⊗R. In particular the selected canonical φ gives the plus module.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Apply the early explicit reciprocity law of G2 to the localized zeta class, then Wiles’s formula with π=−p and the fixed period. Complex conjugation applies to φ alone; neither ν nor χ is inverted in the displayed formula.
2. For χ of opposite conductor parity, the root number of overline(φ)νχ is (−1)^c(χ) W(φ)=−1; self-duality forces the central value to vanish.
3. The trivial-character formula differs from the finite-character formula by removal of the p-Euler factor 1−(−p)/p²=1+1/p, matching δ_1=(1+p⁻¹)δ.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.4/projected-cm-class`, `AnticyclotomicLocalUnits:ALU.4/wiles-dual-exponential`, `AnticyclotomicLocalUnits:ALU.1/character-derivative`, `AnticyclotomicLocalUnits:ALU.1/signed-unit-modules`.

**Sources.** BKO21, Proposition 3.3 and equations (3.6)–(3.7), p.953.

**Check.** At χ=1 the removed p-Euler factor is 1+1/p. Only φ is complex-conjugated in the published (3.6); ν and χ are not inverted.

### A plus unit with unit derivative

Target: `AnticyclotomicLocalUnits:ALU.4/optimal-unit` (theorem).

There exists ξ*∈V∞*,+ such that δ(ξ*)∈O×. This existence is obtained before using the integral signed decomposition or assuming that V∞*,+ is free.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Use the G2 Finis specialization to choose ν with Ω⁻¹ L_f(overline(φ)ν,1) a unit in a finite coefficient ring W. Check all local μ and b invariants vanish in this canonical-character situation and remove the l-Euler factor using the exact conductor.
2. The finite free coefficient extension W/O preserves the signed kernels: writing a finite tensor ξ_ν in an O-basis gives coefficients v_i∈V∞*,+.
3. If all δ(v_i) were in pO, δ(ξ_ν) would be in pW and could not be a unit. Choose one v_i with unit derivative. This avoids relying on the signed rank-one assertion that BKO invokes at this point.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.4/cm-class-values`, `AnticyclotomicLocalUnits:ALU.3/signed-rank-bounds`, `PadicMeasuresIwasawaAlgebras:L5`.

**Sources.** BKO21, Theorem 3.4 and equation (3.9), pp.953–954.

**Check.** For an O-basis of W, at least one coordinate derivative lies outside pO. This descent never uses that the plus module is already free.

## ALU.5 — A primitive modular formal point

Atlas planets: Manin-unit separability, Scalar supersingular Frobenius, Parametrization ramification bound, Generic supersingular-point bound, Exceptional supersingular-point bounds, Primitive formal CM point.

### An auxiliary rational supersingular elliptic curve

Target: `AnticyclotomicLocalUnits:ALU.5/auxiliary-supersingular-curve` (theorem).

There is E/ℚ with good reduction at p and a_p(E)=0. At p=5 or 11 choose the j=0 conductor-27 curve, and at p=7 choose the j=1728 conductor-32 curve. It may be chosen optimal in its ℚ-isogeny class without changing good reduction or a_p. Its base change to O has formal group O-isomorphic to F for π=−p.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Use the trace-zero elliptic curve over 𝔽_p supplied by G3 and lift a nonsingular Weierstrass equation to ℤ; good reduction and a_p are preserved.
2. Apply unconditional modularity and replace the curve by its optimal newform quotient; rational isogeny preserves the local ℓ-adic representation and good reduction.
3. The p²-Frobenius is −p. Apply the corrected Honda/Lubin–Tate comparison in G1; parameter +p would be wrong.

**Dependencies.** `EllipticCurveModularity:R29.6/modularity-theorem`, `EllipticCurveModularity:R29.5/modular-parametrisation`.

**Sources.** BKO21, §5.0.1, p.955 and Lemma 5.1(ii), p.956.

**Check.** At p=5 the conductor-27 j=0 curve is available; at p=7 use the conductor-32 j=1728 curve. The formal parameter is −p.

### The optimal parametrization has separable reduction

Target: `AnticyclotomicLocalUnits:ALU.5/manin-unit-separability` (theorem).

For the optimal E of conductor N, p∤N, let f_E:X₀(N)→E be the cusp-normalized modular parametrization. Its pullback of a Néron differential is c_E f(q)dq/q with c_E∈ℤ_p×. It extends to the smooth proper good models over ℤ_p and its reduction is a nonconstant separable map.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Use the imported genuine modular quotient and its differential comparison. For p∤N, apply the good-prime argument of Abbes–Ullmo Theorem A (p.269, proof p.279).
2. In that argument, the degree/congruence formula of Proposition 3.3, the p-unit comparison cokernel of Proposition 3.4, and deg(f_E)|r of Lemma 3.2 imply v_p(c_E)=0; integrality of c_E and of the remaining cokernel are essential.
3. Good models, the q-expansion comparison and the Néron mapping property are the general geometric inputs recorded in G4. A nonzero reduction of the pulled-back differential proves separability; a mere characteristic-zero morphism is insufficient.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.5/auxiliary-supersingular-curve`, `EllipticCurveModularity:R29.5/modular-parametrisation`, `ModularCurvesPartII:R14.5`, `tauceti:TauCetiRoadmap/ModularCurves#layer-9-γ_h-quotients-quotient-regularity-and-coarse-moduli`.

**Sources.** BKO21, §5.0.1, p.955; Abbes–Ullmo Theorem A, p.269 and proof, pp.276–279; AU96, Theorem A, p.269; Lemma 3.2 and Propositions 3.3–3.4, pp.276–279.

**Check.** At every p∤N the pullback differential has a nonzero reduction; separability does not follow merely from a characteristic-zero parametrization.

### Scalar Frobenius and the corrected Honda sign

Target: `AnticyclotomicLocalUnits:ALU.5/scalar-frobenius` (theorem).

If A/𝔽_(p²) has a_(p²)=2εp with ε=±1, its Frobenius endomorphism is [εp]. Every finite subgroup of A(𝔽̄_p), in particular every cyclic subgroup of order prime to p, is Frobenius-stable and defined over 𝔽_(p²). Any elliptic lift over O has formal group Lubin–Tate for parameter εp. Thus a_(p²)=−2p gives the fixed parameter π=−p.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. The Frobenius polynomial gives (Frob−εp)²=0 in End⁰(A). Every nonzero elliptic endomorphism is an isogeny, so End⁰(A) is a division algebra; there are no nonzero nilpotents.
2. Scalar multiplication preserves every geometric finite subgroup, giving descent of the subgroup scheme when its order is prime to p.
3. On the formal reduction, [εp](X)=X^(p²). The Honda/Lubin–Tate comparison from G1 has type −εX²+p and parameter εp; correct the sign in the published lemma.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.5/auxiliary-supersingular-curve`.

**Sources.** BKO21, Lemma 5.1(i)–(ii), p.956.

**Check.** For a_(p²)=−2p the scalar Frobenius and LT parameter are both −p, and the Honda type is X²+p.

### Supersingular mass and Frobenius classes

Target: `AnticyclotomicLocalUnits:ALU.5/supersingular-mass-application` (theorem).

Write p−1=12m+4d+6e with d,e∈{0,1}. There are m+d+e geometric supersingular j-invariants; d records j=0 and e records j=1728. There are m generic invariants. For each generic j there are 𝔽_(p²)-models with a_(p²)=±2p. The number N(t) of 𝔽_(p²)-isomorphism classes with trace t is (p+6−4(−3/p)−3(−1/p))/12 for each t=±2p, is 1−(−3/p) for each t=±p, and is 1−(−1/p) for t=0.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Apply the general Deuring/Eichler mass and Schoof trace-class formulas from G3, retaining twists rather than counting only geometric j-invariants.
2. The classes with traces ±p occur only at j=0, and trace 0 only at j=1728. Remove them to identify the m generic invariants, each admitting a scalar-Frobenius model.
3. The exceptional invariants have models over 𝔽_p when supersingular, hence p²-trace −2p.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.5/scalar-frobenius`.

**Sources.** BKO21, Proof of Lemma 5.2(ii)–(iii), p.957.

**Check.** At p=5, (m,d,e)=(0,1,0); at p=7, (0,0,1); at p=47, (3,1,1).

### The ramification bound for the parametrization

Target: `AnticyclotomicLocalUnits:ALU.5/ramification-bound` (theorem).

Let μ=N∏_(l|N)(1+1/l)=deg(X₀(N)→X(1)), and g_N be the genus. The number of geometric ramification points of the separable reduced parametrization is at most deg(Different)=2g_N−2≤μ/6.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Apply separable Riemann–Hurwitz to the map from the smooth connected X₀(N) to the genus-one target E. Each ramification point contributes at least one to the different, also in the wild case.
2. Use the modular-curve genus formula to bound 2g_N−2 by μ/6. Composite-level connectedness, good models and the genus formula are included in G4; current upstream Layer 10 alone does not supply them.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.5/manin-unit-separability`.

**Sources.** BKO21, Lemma 5.2(i), pp.956–957.

**Check.** The count bounds ramification of f_E by its different, including wild ramification. The stabilizer indices 2 and 3 belong instead to the j-map.

### The generic supersingular-point bound

Target: `AnticyclotomicLocalUnits:ALU.5/generic-supersingular-bound` (theorem).

The number of 𝔽_(p²)-points of X₀(N) above generic supersingular j with a scalar-Frobenius representative is at least μ⌊(p−1)/12⌋. Consequently for every p≥13 at least one is unramified for the parametrization. This stronger count also implies the displayed weaker bound in Lemma 5.2(ii).

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Away from j=0,1728 the forgetful j-map is étale of degree μ. Every cyclic order-N subgroup on a scalar-Frobenius model is rational over 𝔽_(p²), so all μ coarse points are rational.
2. Multiply by the m generic invariants. Since m≥1 and μ>μ/6 for p≥13, the count exceeds the ramification bound.
3. This argument covers p=47: there are at least 3μ generic points, although the paper’s displayed weaker bound gives zero. No unverified small-prime computation is used.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.5/supersingular-mass-application`, `AnticyclotomicLocalUnits:ALU.5/scalar-frobenius`, `AnticyclotomicLocalUnits:ALU.5/ramification-bound`, `tauceti:TauCetiRoadmap/ModularCurves#layer-8-km-chapter-6-cyclicity-and-γ₀n`, `tauceti:TauCetiRoadmap/ModularCurves#layer-9-γ_h-quotients-quotient-regularity-and-coarse-moduli`.

**Sources.** BKO21, Lemma 5.2(ii), pp.956–957.

**Check.** For p=47 the stronger count is 3μ, exceeding μ/6 even though the printed weaker count is zero.

### The two exceptional supersingular-point bounds

Target: `AnticyclotomicLocalUnits:ALU.5/exceptional-supersingular-bounds` (theorem).

If p≡2 mod 3, the fibre above j=0 contains at least μ/3 rational supersingular points with scalar-Frobenius representatives. If p≡3 mod 4, the fibre above j=1728 contains at least μ/2. Each applicable bound exceeds μ/6 and therefore supplies an unramified point for the parametrization.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. For the forgetful j-map, elliptic stabilizers have order at most three at j=0 and at most two at j=1728 after quotienting by ±1. Divide the total degree by these bounds.
2. Use the supersingular 𝔽_p model to obtain trace −2p, then descend all cyclic order-N subgroups by scalar Frobenius.
3. The ramification indices two and three concern the forgetful j-map, not f_E. Keep the two exceptional counts separate from the parametrization’s different.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.5/supersingular-mass-application`, `AnticyclotomicLocalUnits:ALU.5/scalar-frobenius`, `AnticyclotomicLocalUnits:ALU.5/ramification-bound`, `tauceti:TauCetiRoadmap/ModularCurves#layer-9-γ_h-quotients-quotient-regularity-and-coarse-moduli`.

**Sources.** BKO21, Lemma 5.2(iii), pp.956–957.

**Check.** At p=5 and N=27, μ=36 and the j=0 count is at least 12, exceeding 6. At p=7 and N=32, μ=48 and the j=1728 count is at least 24, exceeding 8.

### An unramified lift to fine level

Target: `AnticyclotomicLocalUnits:ALU.5/fine-level-unramified-lift` (construction).

Choose an unramified supersingular P̄∈X₀(N)(𝔽_(p²)) as above and a representative Ā with p²-Frobenius −p, changing its quadratic twist if necessary. Take M=p+1 and a rational point of exact order M on Ā. The mixed Γ₀(N),Γ₁(M) problem is fine; its quotient group has order prime to p. Choose P̄′ above P̄ where the forgetful map is unramified. For p=5 or 11 use the optimal j=0 curve of conductor 27; for p=7 use the optimal j=1728 curve of conductor 32. These levels remove the respective elliptic stabilizers.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Since Frob=−p, Ā[M] is rational, and p∤M and p∤φ(M); M≥6 rigidifies the moduli problem.
2. At generic j the coarse quotient has no residual stabilizer, so the fine-level forgetful map is unramified.
3. At j=0 use X₀(27), which has no order-three elliptic points; at j=1728 use X₀(32), which has no order-two elliptic points. Verify the indicated CM curves have a_p=0 and the stated conductor.
4. For p≥13 the generic count handles all primes. Thus no step imports Rubin’s finite computer check. The mixed-level integral model and quotient comparison are the G4 interface.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.5/generic-supersingular-bound`, `AnticyclotomicLocalUnits:ALU.5/exceptional-supersingular-bounds`, `AnticyclotomicLocalUnits:ALU.5/scalar-frobenius`, `tauceti:TauCetiRoadmap/ModularCurves#layer-5-affine-fine-modular-curves-after-inverting-n`, `tauceti:TauCetiRoadmap/ModularCurves#layer-8-km-chapter-6-cyclicity-and-γ₀n`, `tauceti:TauCetiRoadmap/ModularCurves#layer-9-γ_h-quotients-quotient-regularity-and-coarse-moduli`.

**Sources.** BKO21, The formal CM point construction, pp.957–958.

**Uses.** BKO21, p.958: Represents the lift of a primitive formal E-point by an elliptic curve with level structure..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.fineLift_level` | data | The lift carries a cyclic order-N subgroup and an exact-order-M point, with p∤NM. |
| `Anticyclotomic.fineLift_forget` | projection | Forgetting the order-M point maps P̄′ to P̄ and identifies the corresponding completed local disks. |
| `Anticyclotomic.fineLift_rigid` | compatibility | The represented elliptic curve is an actual family on the fine model; a coarse moduli point alone is not sufficient. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `M_p_plus_one` | value | For p=5, M=6 is fine and φ(M)=2 is prime to p. |
| `exceptional_27` | non-example | At p=5 or 11, retain the Γ₀(27) structure before forgetting the fine point; j=0 alone has an order-three automorphism obstruction. |
| `exceptional_32` | compatibility | At p=7, the Γ₀(32) structure eliminates the order-two obstruction at j=1728. |

### A primitive formal CM point

Target: `AnticyclotomicLocalUnits:ALU.5/primitive-formal-cm-point` (construction).

After replacing f_E by [#E(𝔽_(p²))]∘f_E, there is a fine-level O-point P′ reducing to P̄′ and representing A/O such that Q=f_E(P′)∈F(Φ) ∖ [p]F(Φ). The completed map at P̄′ and the origin of E is an isomorphism over O. The formal group Â is Lubin–Tate for π=−p, with a chosen O-module identification.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Since a_p(E)=0, #E(𝔽_(p²))=(p+1)² is a p-unit; multiplication sends the selected residue point to zero and preserves étaleness.
2. The composite of the unramified fine-level map and separable parametrization identifies the completed local disks. Choose a primitive point Q, for example by λ(Q)∈pO ∖ p²O, and lift it through that isomorphism.
3. Fine representability gives the actual A/O. Use the corrected scalar-Frobenius/Honda comparison for its O-action.
4. Reuse the pinned formal-point map, its injectivity and range, after the number-field-completion realization from G1; do not reconstruct formal-to-elliptic parametrization.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.5/fine-level-unramified-lift`, `AnticyclotomicLocalUnits:ALU.5/manin-unit-separability`, `AnticyclotomicLocalUnits:ALU.5/scalar-frobenius`, `tauceti:WeierstrassCurve.formalPointHomAdicCompletion`, `tauceti:WeierstrassCurve.formalPointHomAdicCompletion_injective`, `tauceti:WeierstrassCurve.range_formalPointHomAdicCompletion`.

**Sources.** BKO21, Equation (5.1) and surrounding construction, p.958.

**Uses.** BKO21, Definition 5.4 and Theorem 5.5, p.959: The primitive point Q supplies y=(p+1)Q and the marked starting curve for the quasi-canonical chain..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.formalCMPoint_image` | data | The chosen modular point maps to Q and Q is not in [p]F(Φ). |
| `Anticyclotomic.formalCMPoint_disk` | equivalence | The completed local map at the chosen residue points is an O-isomorphism, so it lifts every formal Q uniquely. |
| `Anticyclotomic.formalCMPoint_existingMap` | compatibility | In an adic-completion realization, Q is mapped to the elliptic point by the pinned formalPointHomAdicCompletion and lies in its stated range. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `primitive_log` | value | λ(Q) has valuation one, so Q is primitive and [p]Q is not primitive. |
| `rescaling_etale` | compatibility | Multiplying f_E by (p+1)² keeps the derivative a p-unit. |
| `negative_parameter` | non-example | Ā with a_(p²)=−2p yields parameter −p; assigning +p reverses the required Honda sign. |

## ALU.6 — The optimal local trace system

Atlas planets: Quasi-canonical modular points, Optimal local-point system, Hecke lattice trace relation, Optimal point trace relations, Signed optimal points.

### Modular points from quasi-canonical lifts

Target: `AnticyclotomicLocalUnits:ALU.6/quasicanonical-modular-points` (construction).

For the marked A/O and an O-basis t of T_pA, let T_s=p^(−s)ℤ_p t+T_pA, C_s=T_s/T_pA and A_s=A/C_s, with A_0=A. Import the quasi-canonical theory: End(Â_s)=ℤ_p+p^sO, A_s is defined over Ψ′_s, and for s≥1 Gal(Ψ′_s/Φ)=(O/p^sO)×/(ℤ/p^sℤ)× of order p^(s−1)(p+1). Transport the prime-to-p level subgroup to define z_s∈X₀(N)(O_(Ψ′_s)); set x_s=f_E(z_s)∈F(Ψ′_s), with x_0=Q.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Use the missing shared marked quasi-canonical interface G1 for the elliptic quotient, its minimal field, marking, and Galois action; do not re-plan the general deformation theory.
2. Transport the cyclic order-N subgroup along the p-isogeny. Reduction of the chain is the corresponding Frobenius chain, so f_E(z_s) reduces to zero, as f_E is defined over ℤ_p and f_E(P̄)=0.
3. Use the pinned formal-point range comparison to interpret x_s as a formal point. Check all coefficient/base-field identifications, including s=0 separately.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.5/primitive-formal-cm-point`, `tauceti:TauCetiRoadmap/ModularCurves#layer-8-km-chapter-6-cyclicity-and-γ₀n`.

**Sources.** BKO21, §5.0.2, pp.958–959.

**Uses.** BKO21, Definition 5.4, p.959: Defines y_s by a tame trace of x_(s+1).; BKO21, Theorem 5.5(ii), p.959: Identifies the Hecke neighbours with the Galois orbit of the next quasi-canonical point..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.quasicanonical_modular` | constructor | z_s represents the actual quotient A/C_s with transported level structure. |
| `Anticyclotomic.quasicanonical_image` | projection | x_s is the image under the chosen scaled modular parametrization and x_0=Q. |
| `Anticyclotomic.quasicanonical_field` | compatibility | For s≥1 the ring-class field degree is p^(s−1)(p+1); Ψ′_0=Φ is a separate base case. |
| `Anticyclotomic.quasicanonical_reduction` | relation | Each x_s reduces to the identity, using the Frobenius reduction of the marked chain. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `conductor_zero` | degenerate | A_0=A, C_0=0 and x_0=Q; the formula p^(s−1)(p+1) is not used at s=0. |
| `conductor_one` | value | [Ψ′_1:Φ]=p+1, and its tame group is not Δ of order p²−1. |
| `formal_image` | compatibility | Every x_s is in the range of the existing formal-point map, not merely an arbitrary elliptic point. |

### The optimal local-point system

Target: `AnticyclotomicLocalUnits:ALU.6/optimal-point-system` (definition).

Let Δ′ be the subgroup of order p+1 of Gal(Ψ′∞/Φ); its fixed field in Ψ′_(s+1) is Ψ_s. Define y_s=Σ_(d∈Δ′)d x_(s+1)∈F(Ψ_s) for s≥0, with formal addition, and y=[p+1]Q∈F(Φ).

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Use the tame fixed-field identification in G1; this shifts the quasi-canonical conductor s+1 to the anticyclotomic layer s.
2. Take the formal-group trace, which agrees with elliptic addition through the pinned map. Since p+1∈O×, y is primitive.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.6/quasicanonical-modular-points`.

**Sources.** BKO21, Definition 5.4 and Theorem 5.5(i), p.959.

**Uses.** BKO21, Theorem 5.5 and Corollary 5.6, p.959: The trace system supplies the invariants calculation.; Rubin87, Lemma 7.2 and Proposition 7.4, p.417: Only this system and primitivity, not the existence of a Heegner point, are used..

**API outline.**

| Name | Role | Statement |
|---|---|---|
| `Anticyclotomic.optimalPoint_mem` | data | y_s is fixed by Δ′ and belongs to F(Ψ_s). |
| `Anticyclotomic.optimalPoint_base` | relation | y=[p+1]Q is primitive because p+1 is a unit. |
| `Anticyclotomic.optimalPoint_tameTrace` | compatibility | The trace has p+1 terms from x_(s+1), rather than p²−1 terms from x_s. |

**Checks.**

| Test | Kind | Requirement |
|---|---|---|
| `tame_shift` | non-example | y_0 is the Δ′ trace of x_1; it is not x_0=Q. |
| `primitive_multiplier` | value | [p+1] preserves p-primitivity of Q, whereas [p] does not. |
| `zero_input` | degenerate | If Q were zero the resulting y would fail the primitive acceptance condition; the construction records the nonzero primitive input. |

### Hecke neighbours in a two-vector lattice basis

Target: `AnticyclotomicLocalUnits:ALU.6/hecke-lattice-neighbours` (theorem).

Choose an O-basis t and θ∈O with O=ℤ_p⊕ℤ_pθ, so T_s=ℤ_p e₁⊕ℤ_p e₂ with e₁=p^(−s)t, e₂=θt. For s≥1 the p forward index-p superlattices are L_a=ℤ_p((e₁+a e₂)/p)+ℤ_p e₂, a∈𝔽_p, and the backward one is L_∞=ℤ_p e₁+ℤ_p(e₂/p), homothetic to T_(s−1). The forward lattices are the Gal(Ψ′_(s+1)/Ψ′_s)-orbit of T_(s+1). Hence on the E-images, T_p x_s=Tr_(Ψ′_(s+1)/Ψ′_s)x_(s+1)+x_(s−1). At s=0, all p+1 neighbours are the Δ′-orbit of x_1.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Classify lines in p⁻¹T_s/T_s≃𝔽_p². The displayed two-vector list gives p+1 distinct superlattices and the correct backward homothety.
2. The local unit subgroup 1+p^sO acts on T_(s+1); its quotient modulo 1+p^(s+1)O and ℤ_p× has p elements, which move the slope a and give the forward orbit.
3. Use the modular Hecke correspondence and equivariance of the quotient parametrization. The necessary integral good-model/Hecke comparison is G4.
4. Correct the published scalar expression (1+ap^s)p^(−s−1)ℤ_p t+T, which is constant as a varies: insert the independent θ direction, equivalently use (1+ap^sθ)p^(−s−1)t.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.6/quasicanonical-modular-points`, `ModularCurvesPartII:R14.5`, `tauceti:TauCetiRoadmap/ModularCurves#layer-8-km-chapter-6-cyclicity-and-γ₀n`.

**Sources.** BKO21, Proof of Theorem 5.5(ii), p.959.

**Check.** For s=1 the p forward superlattices are distinct modulo p; omitting θ collapses them all to the same lattice. There are p+1 neighbours including the backward one.

### The optimal point trace relations

Target: `AnticyclotomicLocalUnits:ALU.6/optimal-trace-relations` (theorem).

The system satisfies y∉[p]F(Φ), y_0=0, Tr_(Ψ_1/Φ)y_1=−y, and Tr_(Ψ_(s+1)/Ψ_s)y_(s+1)=−y_(s−1) for every s≥1. The trace is formal-group addition over the actual field embeddings.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. On the optimal elliptic quotient, T_p acts by a_p(E)=0; scaling the parametrization commutes with this action.
2. At conductor zero the p+1-neighbour relation gives y_0=T_p x_0=0.
3. At conductor one the backward term x_0=Q contributes its Δ′ trace (p+1)Q=y, so the first wild trace is −y.
4. For higher conductors, first take the relative trace in the quasi-canonical chain and then the tame trace. Field indices in G1 give the stated recurrence with no extra factor p.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.6/optimal-point-system`, `AnticyclotomicLocalUnits:ALU.6/hecke-lattice-neighbours`.

**Sources.** BKO21, Theorem 5.5, p.959.

**Check.** The first wild trace is −y, rather than zero; y_0=0 is a different boundary. At s=1, Tr_(Ψ_2/Ψ_1)y_2=0.

### Parity of the optimal points

Target: `AnticyclotomicLocalUnits:ALU.6/optimal-point-parity` (theorem).

For every s≥0, y_s∈A_s⁺ if s is even and y_s∈A_s⁻ if s is odd. For odd n≥1, Tr_(Ψ_n/Φ)y_n=(−1)^((n+1)/2) p^((n−1)/2)y.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Apply λ_χ to each trace recurrence; if χ factors through Ψ_(s−1), a trace lowers the level, while a top-conductor χ has the parity of s+1 and lies in the allowed complementary support.
2. The initial values y_0=0 and Tr y_1=−y fix both parities, including the trivial-character condition for even s.
3. Iterate total trace through the recurrence; when a point from Ψ_(s−2) is viewed at Ψ_(s−1), its extra trace contributes p.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.6/optimal-trace-relations`, `AnticyclotomicLocalUnits:ALU.3/signed-formal-points`, `AnticyclotomicLocalUnits:ALU.3/character-logarithm`.

**Sources.** BKO21, Theorem 5.5, p.959; Rubin87 Corollary 6.2, p.416 and Lemma 7.2, p.417.

**Check.** y_1 is minus and has total trace −y; y_2 is plus and has total trace zero; y_3 has total trace py.

## ALU.7 — Minus-point cohomology and freeness

Atlas planets: Minus-point Herbrand quotient, Minus-point cohomology vanishing, Minus-point invariant formula, Free minus quotient and kernel.

### The minus-point Herbrand quotient

Target: `AnticyclotomicLocalUnits:ALU.7/minus-herbrand-quotient` (theorem).

For odd n≥1 and G_n=Gal(Ψ_n/Φ), the finite cohomology groups of A_n⁻ satisfy h_n(A_n⁻)=|Ĥ⁰(G_n,A_n⁻)|/|H¹(G_n,A_n⁻)|=p^(n−1).

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Choose a finite-index G_n-stable lattice with rational parity representation O[G_1]⊕⊕_(3≤k≤n, k odd)(O[G_k]/O[G_(k−1)]). The embeddings in the quotients are the norm embeddings, not arbitrary maps of group rings.
2. Herbrand quotients are unchanged by finite-index lattice replacement because a finite cyclic-group module has quotient one.
3. For O[G_k] as G_n-module, Ĥ⁰=O/p^(n−k)O and H¹=0. Since |O/pO|=p², multiply p^(2(n−1)) by the ratios p^(2(n−k))/p^(2(n−k+1)); the result is p^(n−1). The generic cyclic cohomology formulas are requested from R02.1.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.3/formal-fourier-lattices`, `AnticyclotomicLocalUnits:ALU.3/signed-formal-points`, `AnticyclotomicLocalUnits:ALU.6/optimal-point-parity`, `ArithmeticGaloisDuality:R02.1/discrete-quotient-colimit`, `ArithmeticGaloisDuality:R02.1`.

**Sources.** Rubin87, Lemma 7.1, p.417.

**Check.** For n=1 the Herbrand quotient is 1; for n=3 it is p². These are cardinalities over O, with residue cardinality p².

### Vanishing of minus-point first cohomology

Target: `AnticyclotomicLocalUnits:ALU.7/minus-first-cohomology` (theorem).

For odd n≥1, H¹(G_n,A_n⁻)=0. Consequently H¹_cont(Γ⁻,A⁻)=0, with A⁻ given its discrete direct-limit Galois-module structure for this invariant calculation.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. The invariant lattice (A_n⁻)^(G_n) is F(Φ), whose O-rank is one. The total trace of y_n spans p^((n−1)/2)Oy.
2. Primitivity gives Oy=F(Φ), using λ:F(Φ)≃pO. Thus |Ĥ⁰(G_n,A_n⁻)|≤|O/p^((n−1)/2)O|=p^(n−1).
3. Divide by the positive Herbrand quotient p^(n−1): H¹ has cardinal at most one.
4. Odd levels are cofinal. A continuous cocycle from the compact Γ⁻ into the discrete torsion-free A⁻ has finite image; once its values lie in A_n⁻ it factors through a finite quotient (a homomorphism on an open stabilizer to torsion-free A_n⁻ is zero). Apply the finite vanishing and pass to the direct limit.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.7/minus-herbrand-quotient`, `AnticyclotomicLocalUnits:ALU.6/optimal-point-parity`.

**Sources.** Rubin87, Lemma 7.2 and Proposition 7.3, p.417.

**Check.** For odd n=3, the primitive total trace spans pOy, so the zeroth Tate group has at most p² elements; its Herbrand quotient is p², forcing H¹=0.

### The minus divisible-point invariants

Target: `AnticyclotomicLocalUnits:ALU.7/minus-divisible-invariants` (theorem).

(D⁻)^(Γ⁻)=F(Φ)⊗_O Φ/O≃Φ/O, via the actual inclusion of base-field formal points.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Apply invariants to 0→A⁻→A⁻[1/π]→D⁻→0. Torsion-freeness identifies the rational invariants with F(Φ)[1/π].
2. The H¹ term vanishes by the preceding node. Base formal points lie in A⁻, and λ:F(Φ)≃pO identifies the quotient with Φ/O.
3. This is Rubin Proposition 7.4 with the primitive trace system substituted for its Heegner-point input; its proof uses only the trace norm estimate.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.7/minus-first-cohomology`, `AnticyclotomicLocalUnits:ALU.3/signed-formal-points`, `AnticyclotomicLocalUnits:ALU.2/anticyclotomic-kummer-pairing`.

**Sources.** BKO21, Corollary 5.6, p.959; Rubin87 Proposition 7.4 and its preceding lemmas, p.417.

**Check.** The invariant divisible module is exactly the base-field formal module tensored with Φ/O, not its p-multiple as an embedded lattice.

### The minus quotient and kernel are free

Target: `AnticyclotomicLocalUnits:ALU.7/minus-quotient-and-kernel-free` (theorem).

X⁻=V∞*/V∞*,− is free of rank one over Λ, and V∞*,− is free of rank one. The quotient is taken from V∞* throughout.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Dualize the invariant formula to get X⁻/(γ−1)X⁻≃O for a topological generator γ of Γ⁻. Modulo p this gives one residual generator.
2. Topological Nakayama makes X⁻ cyclic. Its positive Λ-rank from the signed rank bound excludes a nonzero annihilator, since Λ is a domain; thus X⁻≃Λ.
3. The sequence 0→V∞*,−→Λ²→Λ→0 splits. The kernel is a finite projective rank-one module over the local ring Λ, hence free.
4. This corrects the missing star in the displayed quotient of BKO Corollary 5.6. No claim about an untwisted quotient by a twisted submodule is made.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.7/minus-divisible-invariants`, `AnticyclotomicLocalUnits:ALU.3/signed-annihilator`, `AnticyclotomicLocalUnits:ALU.3/signed-rank-bounds`, `PadicMeasuresIwasawaAlgebras:L5`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-maximal-ideal`.

**Sources.** BKO21, Corollary 5.6, p.959; Rubin87 Lemma 4.3, p.410.

**Check.** X⁻/(γ−1)X⁻≃O gives one residual generator, and positive Λ-rank excludes a nonzero cyclic annihilator. Both quotient and kernel are then Λ-free.

## ALU.8 — Integral decomposition and finite exports

Atlas planets: Augmentation-unit generation, Rubin’s integral decomposition, Nonzero character derivatives, Signed-generator nonvanishing.

### Generation detected by the augmentation derivative

Target: `AnticyclotomicLocalUnits:ALU.8/augmentation-unit-generation` (theorem).

Let q:V∞*→X⁻ be the free rank-one quotient. The descended δ:X⁻→O is Λ-linear for augmentation, and q(ξ*) generates X⁻, because δ(ξ*) is a unit. In coordinates X⁻≃Λ, writing q(ξ*)=f(T)e gives δ(q(ξ*))=f(0)δ(e), so f(0) is a unit and f(T) is a unit.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. The minus module is killed by δ using the trivial-character Euler factor, so δ factors through q.
2. Use the explicitly proved augmentation compatibility; continuity alone does not imply δ(mX⁻)⊆pO.
3. The unit product f(0)δ(e) forces f(0)∈O×. Invoke the pinned power-series unit criterion, or topological Nakayama with m=(p,T).

**Dependencies.** `AnticyclotomicLocalUnits:ALU.7/minus-quotient-and-kernel-free`, `AnticyclotomicLocalUnits:ALU.4/optimal-unit`, `AnticyclotomicLocalUnits:ALU.1/trivial-derivative`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`.

**Sources.** BKO21, Proof of Theorem 5.8, p.960; corrected use of Rubin87 Lemma 4.2, p.410.

**Check.** The continuous coefficient-of-T map on O[[T]] takes T to a unit but does not detect a generator. The augmentation hypothesis rules out this counterexample.

### The integral signed decomposition

Target: `AnticyclotomicLocalUnits:ALU.8/integral-signed-decomposition` (theorem).

The inclusion V∞*,+⊕V∞*,−→V∞* is an isomorphism of compact Λ-modules. Each summand is free of rank one; V∞*,+=Λξ*. The inverse twist equivalence transports this to the corresponding twisted local-unit statement. All assertions hold over O and Λ before inverting p.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. The plus module maps injectively into X⁻ because the signed intersection is zero.
2. It contains ξ*, whose image generates X⁻, so this map is also surjective. Hence V∞*,+=Λξ* and the quotient sequence splits by the actual plus inclusion.
3. The minus kernel is already free. The addition map between compact modules has a continuous inverse because it is a continuous bijection onto a Hausdorff compact module.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.8/augmentation-unit-generation`, `AnticyclotomicLocalUnits:ALU.3/signed-rank-bounds`, `AnticyclotomicLocalUnits:ALU.1/signed-unit-modules`.

**Sources.** BKO21, Theorem 2.1, p.949 and Theorem 5.8, p.960.

**Check.** The addition map is an isomorphism over Λ before rationalization; its two summands each have rank one and the plus summand contains the constructed ξ*.

### Nonzero character derivatives on the full unit module

Target: `AnticyclotomicLocalUnits:ALU.8/all-character-derivatives-nonzero` (theorem).

For every finite χ of Γ⁻, δ_χ:V∞*→ℂ_p is nonzero (with a fixed embedding of its coefficient field).

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. Inside a sufficiently deep formal lattice at the conductor of χ, choose a nonzero rational character-orbit component using the regular representation. Its character logarithms vanish outside that orbit.
2. If δ_χ vanished on all units, coefficient-Galois conjugacy would make every derivative in its orbit vanish. Wiles’s formula would then kill the pairing of that point with all units and every π-power denominator.
3. Finite-level saturation embeds its divisible module into D; a nonzero lattice element has a nonzero class for a sufficiently large denominator. This contradicts perfectness of the Kummer pairing. The trivial orbit is included.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.2/wiles-trace-formula`, `AnticyclotomicLocalUnits:ALU.3/formal-fourier-lattices`, `AnticyclotomicLocalUnits:ALU.3/finite-formal-saturation`, `AnticyclotomicLocalUnits:ALU.1/character-derivative`.

**Sources.** BKO21, Corollary 2.2, p.949; Rubin87 Lemma 10.1, p.421.

**Check.** The argument includes the trivial character and uses finite-level saturation to keep a nonzero divisible point class.

### Every matching-parity derivative of a signed generator is nonzero

Target: `AnticyclotomicLocalUnits:ALU.8/signed-generator-nonvanishing` (theorem).

For ε=±, every Λ-generator v_ε of V∞*,ε and every χ∈Ξ^ε satisfy δ_χ(v_ε)≠0. For χ∈Ξ^(−ε), δ_χ(v_ε)=0 by definition. In particular δ(v_+) is a unit for any plus generator.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. For a matching χ, the opposite signed summand is killed by δ_χ. If δ_χ(v_ε)=0, covariance would kill the entire ε summand as well, contradicting nonzero δ_χ on V∞*.
2. A change of generator multiplies by a unit of Λ, whose character specialization is nonzero and whose augmentation is an O-unit.
3. For the trivial plus character, use ξ* and the Euler-factor relation to conclude the stronger unit statement for δ.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.8/integral-signed-decomposition`, `AnticyclotomicLocalUnits:ALU.8/all-character-derivatives-nonzero`, `AnticyclotomicLocalUnits:ALU.1/character-derivative`.

**Sources.** BKO21, Corollary 2.2, p.949; Rubin87 Lemma 10.1, p.421.

**Check.** For χ=1, every plus generator has a unit δ-value, while every minus element has δ=0.

### Finite signed points and their Kummer images

Target: `AnticyclotomicLocalUnits:ALU.8/finite-signed-point-export` (comparison).

For each n and ε, export the existing A_n^ε as {y∈F(Ψ_n):λ_χ(y)=0 for all χ∈Ξ^ε factoring through Gal(Ψ_n/Φ)}. Its image A_n^ε⊗Φ/O in H¹(Ψ_n,F[π∞]) is defined through the actual Kummer map and is injective. Inclusions and formal traces preserve these signed modules; their transition maps agree with restriction and corestriction of the Kummer images. A Selmer consumer imports these carriers and images, rather than defining a second parity condition.

**Hypotheses.** The common hypotheses above apply. Additional CM or modular data are exactly those fixed in the statement and preceding targets.

**Construction or proof.**

1. High-conductor character logarithms vanish on every point defined over Ψ_n, so the finite and infinite kernel definitions agree exactly.
2. Use torsion-freeness of the Kummer sequence, finite-level saturation and the established comparisons to identify the image inside cohomology.
3. For a character factoring through Ψ_n, λ_χ(Tr_(n+1/n)y)=pλ_χ(y). Higher characters vanish on the target. This proves trace stability without confusing p with π.
4. Do not identify every finite invariant group (D^ε)^(Γ_n) with A_n^ε⊗Φ/O: such a control statement would require its own H¹ obstruction calculation.

**Dependencies.** `AnticyclotomicLocalUnits:ALU.3/signed-formal-points`, `AnticyclotomicLocalUnits:ALU.2/finite-formal-kummer`, `AnticyclotomicLocalUnits:ALU.3/finite-formal-saturation`, `AnticyclotomicLocalUnits:ALU.8/integral-signed-decomposition`, `AnticyclotomicLocalUnits:ALU.3/signed-annihilator`.

**Sources.** BKO21, §6.0.2, pp.962–963, compared with §4, pp.954–955.

**Check.** At n=0 the plus Kummer condition is zero and the minus condition is the full formal Kummer image. No unproved finite-invariants control identity is used.

## Worked checks

For the auxiliary quadratic field, exact finite checks give the following certificates. Use D=−7 for p=5,13,17,19,31,41,47; D=−15 for p=7,11,29,37,43; and D=−31 for p=23. Each D is 1 modulo 8 and pow(D,(p−1)/2) is −1 modulo p, so 2 splits and p is inert. The complete reduced primitive positive-definite form lists are (1,1,2) for D=−7; (1,1,4),(2,1,2) for D=−15; and (1,1,8),(2,−1,4),(2,1,4) for D=−31. Enumeration uses |b|≤a≤c, b²−4ac=D, gcd(a,b,c)=1, and b≥0 when |b|=a or a=c. These give class numbers 1,2,3, each prime to its selected p. The enumeration was run with exact integer arithmetic; the general class-number bound for p≥53 remains the precisely stated G10 input.

At p=5, a character of exact order 5 belongs to Ξ⁺ because its conductor exponent is 2. A plus unit may therefore have a nonzero derivative at it, while a plus formal point must have zero character logarithm. The trivial character also belongs to Ξ⁺. In the point construction choose the j=0 optimal curve at N=27: μ=27(1+1/3)=36, the ramification bound is 6 and the exceptional fibre has at least 12 points. The auxiliary fine level M=p+1=6 has φ(M)=2. The system starts with y=6Q, y_0=0 and Tr_(Ψ_1/Φ)y_1=−6Q, rather than an initial trace zero.

At p=47 the weaker printed generic lower bound is zero. The mass relation gives 46=12·3+4+6, so there are three generic supersingular invariants. Each has a scalar-Frobenius model and hence μ rational cyclic-level points. Thus 3μ>μ/6 proves the needed unramified point. This also shows why a bound that merely reproduces the published expression would be an insufficient test.

For the forward neighbours at s=1 and O=ℤ_p⊕ℤ_pθ, let e₁=p⁻¹t and e₂=θt. The p lines spanned by e₁+a e₂ modulo p give p distinct over-lattices. The remaining line gives the backward neighbour. Replacing θ by 1 makes 1+ap a scalar unit and collapses all p candidates to the same lattice. The degree and orbit-size checks detect this error before taking any modular image.

For the final algebra, choose X⁻≃O[[T]]e and write q(ξ*)=f(T)e. Augmentation linearity gives δ(q(ξ*))=f(0)δ(e). A unit product in O forces f(0) to be a unit, so f(T) is a unit and q(ξ*) generates. Mere continuity cannot replace this hypothesis: coefficient extraction at T sends T to 1 although T does not generate O[[T]]. After the actual plus inclusion becomes surjective onto X⁻, its already zero intersection with the minus kernel gives the integral splitting.

## Source corrections

The following are mathematical restatements of the issues, with locators, rather than copied source passages. E1–E10 reuse the existing errata findings; E11 is already corrected by BKO’s footnote. E12 and E13 are submitted for independent review. All are against the published texts listed below.

**E1 — BKO21, Lemma 5.2(ii), p.956; published version recorded in sourceVersions.** The stated consequence includes every p≥31, on the strength of its displayed lower bound. At p=47 that lower bound is zero and does not prove the consequence. Use the stronger generic count μ floor((p−1)/12), justified by scalar Frobenius and the m generic supersingular invariants. At p=47, floor(46/12)−3/2+(−3/47)+(−1/47)/2=3−3/2−1−1/2=0. The stronger count gives 3μ>μ/6. Affects: the proof. Known correction: research/blueprint/errata/PAPER-BURUNGALE-KOBAYASHI-OTA-21.json/E1.

**E2 — BKO21, §3.0.2 and Proposition 3.3, pp.951–953; proof of Theorem 3.4, p.954; published version recorded in sourceVersions.** The exponent indexing an anticyclotomic l-power character is used both for its order and its conductor. Use ν of conductor l^m; exact order l^r means m=r+1 in this tower, and index the zeta class and ring-class field by that conductor. The first wild character has order l and conductor l², so using the same exponent selects the wrong Euler factor and source field. Affects: nothing. Known correction: research/blueprint/errata/PAPER-BURUNGALE-KOBAYASHI-OTA-21.json/E2.

**E3 — BKO21, Quasi-canonical lift paragraph, p.958; published version recorded in sourceVersions.** The wild anticyclotomic field in the tame fixed-field relation is denoted by the full LT torsion-field symbol. Use Ψ_s=(Ψ′_(s+1))^(Δ′), with |Δ′|=p+1. The fixed field has degree p^s over Φ, whereas Φ_s has degree (p²−1)p^(2s). Affects: nothing. Known correction: research/blueprint/errata/PAPER-BURUNGALE-KOBAYASHI-OTA-21.json/E3.

**E4 — BKO21, Proof of Theorem 5.5(ii), p.959; published version recorded in sourceVersions.** In the forward-neighbour sum, the p isogenous curves are labelled by the current point x_s. They are the conjugates of x_(s+1); the backward term is x_(s−1). Their lattices have the next conductor, and the Hecke trace must be Tr_(s+1/s)x_(s+1). Affects: nothing. Known correction: research/blueprint/errata/PAPER-BURUNGALE-KOBAYASHI-OTA-21.json/E4.

**E5 — BKO21, Theorem 5.5(ii), conductor-zero boundary, p.959; published version recorded in sourceVersions.** The trace at the first quasi-canonical boundary uses the full tame LT group symbol. Use Δ′=Gal(Ψ′_1/Φ), of order p+1. The quasi-canonical first field has degree p+1, not p²−1; its trace of Q is (p+1)Q. Affects: nothing. Known correction: research/blueprint/errata/PAPER-BURUNGALE-KOBAYASHI-OTA-21.json/E5.

**E6 — BKO21, Corollary 5.6, p.959; published version recorded in sourceVersions.** The displayed quotient has an untwisted ambient module and a twisted minus submodule. The quotient is V∞*/V∞*,−. The submodule lives in the inverse twist and its Kummer dual is D⁻; removing the star changes its Galois action. Affects: nothing. Known correction: research/blueprint/errata/PAPER-BURUNGALE-KOBAYASHI-OTA-21.json/E6.

**E7 — BKO21, Proof of Theorem 5.8, p.960; published version recorded in sourceVersions.** The vanishing argument identifies the trivial-character derivative with the zero-level derivative without its scalar Euler factor. Use δ_1=(1−π⁻¹)δ=(1+p⁻¹)δ, then infer the same kernel because the scalar is nonzero. Differentiating the Coleman norm and removing the zero torsion point gives the factor 1−π⁻¹. Affects: nothing. Known correction: research/blueprint/errata/PAPER-BURUNGALE-KOBAYASHI-OTA-21.json/E7.

**E8 — BKO21, §6.0.2, p.962; published version recorded in sourceVersions.** The finite characters for Ψ_n-local conditions are described using a Galois group relative to the wrong base field. Use Gal(Ψ_n/Φ). Ψ_n is the degree-p^n extension of Φ; its finite Fourier characters have that quotient as domain. Affects: nothing. Known correction: research/blueprint/errata/PAPER-BURUNGALE-KOBAYASHI-OTA-21.json/E8.

**E9 — BKO21, Lemma 5.1(ii), p.956; published version recorded in sourceVersions.** Trace 2εp is paired with Honda type εX²+p and parameter −εp. Use type −εX²+p and LT parameter εp; trace −2p gives parameter −p. Scalar p²-Frobenius is εp, so [εp] reduces to X^(p²). The type coefficient has the opposite sign. Affects: nothing. Known correction: research/blueprint/errata/PAPER-BURUNGALE-KOBAYASHI-OTA-21.json/E9.

**E10 — BKO21, Proof of Lemma 5.2(ii),(iii), p.957; published version recorded in sourceVersions.** The elliptic-point indices two and three are attributed to the modular parametrization. Those are the indices of the forgetful j-map X₀(N)→X(1). They arise from elliptic automorphism stabilizers and bound fibre cardinalities. Ramification of the elliptic quotient is bounded separately by its different. Affects: nothing. Known correction: research/blueprint/errata/PAPER-BURUNGALE-KOBAYASHI-OTA-21.json/E10.

**E11 — Rubin87, §2, pp.407–408; published version recorded in sourceVersions.** A p-adic Tate sequence is used as if it were the π-adic sequence needed for π=−p. Replace w_n by (−1)^n w_n, up to a single fixed unit rescaling, so [π]v_(n+1)=v_n. [−p]((−1)^(n+1)w_(n+1))=(−1)^n w_n. Without the correction the required norm/interpolation normalization has the wrong sign. Affects: nothing. Known correction: BKO21, footnote 2, p.948.

**E12 — Rubin87, Lemma 4.2, p.410; published version recorded in sourceVersions.** For a rank-one free Λ-module, a continuous O-linear functional taking a unit value on x is asserted to force x to generate. Require augmentation linearity (or explicitly that the functional sends the maximal ideal times the module into pO). For the Coates–Wiles derivative this follows from δ(gx)=δ(x). On Λ=O[[T]], take the continuous O-linear coefficient-of-T functional and x=T. Its value is 1 but T is not a unit and does not generate Λ. Augmentation linearity instead gives δ(fe)=f(0)δ(e). Affects: a stated result. Known correction: new.

**E13 — BKO21, Forward-lattice list in the proof of Theorem 5.5(ii), p.959; published version recorded in sourceVersions.** The p forward lattices are written ((1+a p^s)/p^(s+1))ℤ_p t+T for a∈𝔽_p. Choose O=ℤ_p⊕ℤ_pθ and use ((1+a p^sθ)/p^(s+1))ℤ_p t+T. Equivalently, for e₁=p^(−s)t and e₂=θt, use ℤ_p(e₁+a e₂)/p+ℤ_p e₂. For s≥1 the printed scalar 1+a p^s is a ℤ_p-unit, so all printed lattices coincide. The corrected two-coordinate list gives p distinct lines in T_s/pT_s besides the backward line. Affects: the proof. Known correction: new.

## Sources and reading record

- **BKO21**: Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota, *Rubin’s conjecture on local units in the anticyclotomic tower at inert primes*, Annals of Mathematics 194 (2021), 943–966; publisher PDF with archive cover. [Read text](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), accessed 2026-10-18. Read: §§1–2, pp.943–950; §3, Lemma 3.1–Theorem 3.4, pp.950–954; §4, pp.954–955; §5, Lemmas 5.1–5.2, Proposition 5.3, Definition 5.4, Theorems 5.5 and 5.8, Corollary 5.6 and Remark 5.7, pp.955–960; §6.0.1–6.0.3, pp.960–963, to check the export boundary. SHA-256 `77ff329057e17cbad573cc309fce3f69f4ba6b73619c4ca203a4ed79a1cb790e`.
- **Rubin87**: Karl Rubin, *Local units, elliptic units, Heegner points and elliptic curves*, Inventiones mathematicae 88 (1987), 405–422; Göttingen scan of the published article. [Read text](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0088/LOG_0026.pdf), accessed 2026-10-18. Read: All §§1–10, pp.405–422; in particular Proposition 1.1, Lemma 2.1, Lemmas 4.1–4.4, Proposition 4.5, Lemma 5.1, Propositions 5.2–5.6, Corollaries 5.7–5.8, §§6–7, Proposition 8.1, Theorem 8.4 and Lemma 10.1. SHA-256 `cda9c336ba0a3eb3017e531d352b9b6d9fa73f0f995c7897ef0e4504f34d3f07`.
- **Haz77**: Michiel Hazewinkel, *On norm maps for one dimensional formal groups III*, Journal of Pure and Applied Algebra 10 (1977), 305–314. [Read text](https://ir.cwi.nl/pub/10014/10014D.pdf), accessed 2026-10-18. Read: §§1–4, pp.305–314; Theorem 1.3, Lemmas 2.4 and 3.5 and the proof in §4. SHA-256 `5bbb94e03c8cbcb82b83bd1dbf28f6a0300a50f18b570668799190f4f268a3c8`.
- **Win80**: Jean-Pierre Wintenberger, *Structure galoisienne de limites projectives d’unités locales*, Compositio Mathematica 42, no.1 (1980 catalogue; printed 1981), 89–103. [Read text](https://www.numdam.org/article/CM_1980__42_1_89_0.pdf), accessed 2026-10-18. Read: §§1–4, pp.89–92; §5.1–5.5.3, pp.92–98; remaining proof and unit comparison, pp.98–103. SHA-256 `416f7390166f381296df594ed2050300aed0f3ecff6415bd8740a2bcc4b2d94f`.
- **AU96**: Ahmed Abbes and Emmanuel Ullmo, *À propos de la conjecture de Manin pour les courbes elliptiques modulaires*, Compositio Mathematica 103 (1996), 269–286. [Read text](https://www.numdam.org/article/CM_1996__103_3_269_0.pdf), accessed 2026-10-18. Read: Theorem A, p.269; §§2–3, pp.270–279, especially Lemma 3.2, Propositions 3.3–3.4 and proof of Theorem A, p.279; appendix statement A.1, pp.279–280. SHA-256 `73fd473d7822b90b4cc4bebbd2b8ca2a05547b6a13e2c3f99210ef8f2ce83cf2`.

Wiles78 is an unavailable original proof, not a read source. Its precise bibliographic locator and the conditions for closing that gap are G9. General CM special-value proofs, Schoof’s general counting proof, the full height-two Coleman construction and the missing general unit-control theorem remain explicit contracts. No uncleared book was accessed.

## Suggested file and review status

The suggested Lean file follows WORKERS.md’s current shape: a few light definitions on existing power series and natural numbers, plus algebraic milestones on existing submodules and linear maps. It does not encode the absent LT tower, local-unit limit, modular models or cohomology as proxy structures, and it does not assume Rubin’s decomposition as a field of a data structure. Heavy carriers and their API/tests are the targets in this reader. Every packet implementation status is unchecked. Lean elaboration checks well-formedness of the suggested statements, not proofs of these mathematical targets. The handoff records the commands and elaboration result.
