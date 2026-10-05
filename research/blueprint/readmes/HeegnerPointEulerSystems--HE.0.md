# Heegner-point Euler systems and arithmetic descent: HE.0–HE.7

This is the definitive reader for the first finite-level part. The target pass covers all eight stages in 70 declarations, preserving the six integrated declaration IDs. It is a complete planning pass, with every stage **planned**, not closed. The 17 gaps and 55 requests are part of the result. There is no claim of formalisation.

The packet is [HeegnerPointEulerSystems--HE.0.json](../packets/HeegnerPointEulerSystems--HE.0.json); the admission-only signatures are [HeegnerPointEulerSystems--HE.0.lean](../suggested/HeegnerPointEulerSystems--HE.0.lean). Six arithmetic definitions and constructions have 24 API items and eighteen discriminating examples. The 43 planets are listed below, with at most six per stage.

## Conventions and ownership

Fix an actual imaginary quadratic field K in a separable closure, actual conductor orders and class fields, and the fixed CM level orientation and modular quotient. For the classical clean branches D_K≠−3,−4 and all primes of N split in K. Separate the conductor-c point P_c over K[c] from y_K=Tr_{K[1]/K}P_1. Every Jacobian map retains its cusp or Hodge basepoint, Hodge denominator, quotient degree and Manin normalization.

Use arithmetic Artin Frobenius in the class-field dictionary; invert Cornut–Vatsal’s geometric convention explicitly. The ℓ-power Frobenius morphism on the special fiber in Gross’s reduction formula is separately named. A ring class field is generally not a CM field. Complex conjugation is chosen using the archimedean embedding and acts by inversion on the quadratic class-field Galois group.

The accepted RS-04 boundary is binding. GlobalNumberFields Layer11 owns general orders, proper invertible ideals and Picard/idele comparison. ClassFieldTheory Layers12–13 own general class-field existence/reciprocity. CM.1–CM.2 and ShimuraVarieties own general CM objects and canonical-model reciprocity. EllipticCurves Layers2/7 own elliptic torsion, Tate modules, Kummer maps, Selmer and Sha. ES.1/ES.3 own generic local comparison and derivatives; ES.4 owns error-tolerant descent; ES.5 must own the missing generic Howard self-dual DVR theorem. This part owns their actual Heegner arithmetic input and verification.

Howard’s clean theorem uses odd p, pairwise coprime p,D,N and full G_K Tate-image surjectivity. Gross’s clean mod-p theorem uses odd p, full residual image and y_K not divisible by p; it does not acquire an extra p∤N assumption. Zhang’s ♠ and ♥ hypotheses are distinct, and the auxiliary rank-zero theorem is for A_g/K. Nonzero, non-torsion and primitive are distinct properties. A p-scaling of the quotient preserves non-torsion but can destroy residual primitivity.

## Baseline and prototype contract

Mathlib is pinned to `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti to `f790474821cf4256814db967cb154e7af3d0c369`. Positive declarations were read at those commits, not inferred from a name search. A complete search of both source trees found no Heegner, Kolyvagin, ringClassField or optimalEmbedding implementation (the unrelated Heegner-number comment is not such an API).

- **mathlib:Subring.comap** — Preimage subring along a ring homomorphism; lines175–184, statement read at the exact pin. (`Mathlib/Algebra/Ring/Subring/Basic.lean`).
- **mathlib:ClassGroup.equivPic** — ClassGroup R ≃* CommRing.Pic R for any commutative domain R; lines876–879, not restricted to Dedekind domains. (`Mathlib/RingTheory/PicardGroup.lean`).
- **mathlib:CommRing.Pic.mapRingHom** — Pic R →* Pic S for f:R→+*S between commutative semirings, lines575–603 including identity and composition laws. (`Mathlib/RingTheory/PicardGroup.lean`).
- **mathlib:PadicInt** — p-adic integers with Fact p.Prime, lines56–67, and DVR ideal/valuation comparison; actual statement read at the pin. (`Mathlib/NumberTheory/Padics/PadicIntegers.lean`).
- **mathlib:WeierstrassCurve.Affine.Point** — Nonsingular points with infinity, lines477–481; AddCommGroup over a field with DecidableEq, lines803–812; actual statement/context read. (`Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean`).
- **mathlib:Module.length** — Module length in ℕ∞ for a ring, additive group and module, lines27–33; used by the actual inequality prototypes. (`Mathlib/RingTheory/Length.lean`).
- **mathlib:Nat.primeFactorsList** — The sorted list of prime factors with multiplicity; lines38–48 read at the pin. Taking toFinset/card counts distinct conductor primes. (`Mathlib/Data/Nat/Factors.lean`).

The suggested file prints the full mathematical statement beside each declaration, then gives its algebraic signature against existing carriers. Where the pinned supplier interfaces cannot express the arithmetic object, field, canonical model, coefficient topology or exact source hypotheses, those conditions are explicitly omitted. The exact omissions are recorded by node and stage in the packet. In particular, `X`, `C` and `I` are supplied moduli/cohomology data, not newly declared substitute objects, and no algebraic cohomology carrier replaces continuous cohomology. The point-level signatures use the actual Weierstrass `Point`; the coefficient ideal uses actual p-adic integers.

Elaboration of admitted shapes does not certify any omitted condition. Some geometric signatures show the indicated degree, descent, localization, norm or reduction conclusion; the definitive target includes the full construction and all comparison maps in the statement below. Imported Tau Ceti continuous-cohomology source declarations were inspected, but their oleans are absent from the existing pinned build; they were not built or fabricated.

## Source reading and boundaries

### Benedict H. Gross: Kolyvagin’s work on modular elliptic curves

L-functions and Arithmetic, LMS Lecture Note Series 153 (1991), pp.235–256; scanned published article. [Text read](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf). SHA-256 `60b310c58a3494860c5967a03569a7d30033e9074d9d3d9a0d5bc2dfedd46b32`; accessed 2026-10-05.

All printed pp.235–256, read visually from all twelve scanned PDF pages; §§1–12 including every proof.

### Benjamin Howard: The Heegner point Kolyvagin system

arXiv:1202.6340v1, 28 February 2012; original article Compositio Math.140 (2004),1439–1472. [Text read](https://arxiv.org/pdf/1202.6340). SHA-256 `d2d06e851d6aa1fdc33a932b69b5c06a8c56dc2d9e05fb10d97c0358d6d6ea9a`; accessed 2026-10-05.

PDF pp.1–21 in full, Introduction and §§1.1–1.7 including H.0–H.5, all the finite-level proof chain and actual Heegner construction. Chapter 2 is outside this part and was not read in this job.

### Benjamin Howard: The Heegner point Kolyvagin system

Compositio Math.140 (2004),1439–1472, version of record. [Text read](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf). SHA-256 `cde2c4891d94b7053cb6d197203a8812ab6e452058ff829ff27fa96396cdde80`; accessed 2026-10-05.

PDF p.20, printed p.1458, finite/singular correction and Theorem 1.7.5. No claim to have read the rest of this version.

### Ilya Khayutin: Joint equidistribution of CM points

Annals of Mathematics189 (2019),145–276, version of record. [Text read](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf). SHA-256 `f22691429c27058fabd47fe12c6a901e7feffffad7a0c52e1a936da645166d6f`; accessed 2026-10-05.

Printed pp.159–160 (§2.3 local toral orders/discriminants),164–167 (§2.4.3–2.4.4 idele/ideal and Picard descriptions),182–186 (§5.1 coordinates and local different, Lemma 5.8). Other sections were not read.

### Christophe Cornut; Vinayak Vatsal: Nontriviality of Rankin–Selberg L-functions and CM points

Author preprint, 1 April 2005; published LMS Lecture Notes320 (2007),121–186. [Text read](https://personal.math.ubc.ca/~vatsal/research/part1.pdf). SHA-256 `bdf258c742a88ce4328dcf3ef1df0dfe1235f1640c06bd66eeaaef2c1c6625e1`; accessed 2026-10-05.

PDF pp.1–4 (relative ring-class characters),19–35 in full (§2 relative CM towers and §3 curve/Hodge/CM setup),60–67 (Appendix6 distribution relations through Lemma6.14). The nonvanishing arguments in §§4–5 and the final Appendix6.5 have not been read.

### Wei Zhang: Selmer groups and the indivisibility of Heegner points

Cambridge Journal of Mathematics2(2) (2014),191–253, version of record. [Text read](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf). SHA-256 `698eb8a6d2297684c683c4c3f43a195cac1d8752ef0c8362ab90c74f5b3792ec`; accessed 2026-10-05.

Printed pp.191–249 (PDF1–59) in full: introduction, §§2–11 and acknowledgements; every level-raising, geometric/cohomological congruence, rank-lowering, special-value, triangulation and nonvanishing proof. Bibliography beyond its opening was not read.

Gross’s scanned article was read visually, not treated as unread because it has no text layer. It proves the non-CM clean mod-p descent but quotes the entire-Sha and RM conclusions. The exceptional-prime, dyadic and CM uniform-error proof remains an acquisition gap. The Howard local χ computation is read; its complete integral global change-of-group/localization comparison remains an explicit mathematical gap. No claimed erratum is inferred from that gap.

Zhang’s published proof chain was read through §11. His generic level raising, Jacquet–Langlands, multiplicity-one/Ihara, ordinary main-conjecture, Kato and period/modular-degree statements are separately owned imports. The exact stronger scope of those imports remains a request where the existing packet supplies only a weaker statement.

## Stage targets

| Stage | Declarations | API/tests | Planets | Coverage |
|---|---:|---:|---:|---|
| HE.0 | 9 | 0/0 | 6 | planned |
| HE.1 | 6 | 4/3 | 5 | planned |
| HE.2 | 7 | 0/0 | 5 | planned |
| HE.3 | 6 | 0/0 | 3 | planned |
| HE.4 | 9 | 8/6 | 6 | planned |
| HE.5 | 9 | 4/3 | 6 | planned |
| HE.6 | 15 | 8/6 | 6 | planned |
| HE.7 | 9 | 0/0 | 6 | planned |

## HE.0. Quadratic orders, ring class fields and reciprocity

**Planets:** Local toral order; Toral packet and ideal-class comparison; Conductor-change kernel; Ring-class tower and finite Galois quotients; Dihedral action on the tower; Relative CM conductor tower.

### 1. Local toral order

`HeegnerPointEulerSystems:HE.0/local-toral-order` — theorem. Prototype: `TauCeti.Heegner.local_toral_order`.

For a specified embedding ι:E_v↪B_v of a quadratic étale Q_v-algebra, a maximal Z_v-order O_v⊂B_v and g_v∈B_v×, the Heegner local order is ι⁻¹(g_v O_v g_v⁻¹). It is a full Z_v-order of the form Z_v+f_v O_{E_v}, is stable under quadratic conjugation, and is maximal away from finitely many places for a rational embedding and restricted adelic g.

**Construction/proof.** Use Subring.comap on the conjugate order; import the integral order carrier from GN11. A basis (1,α) identifies any full local order by its second-coordinate ideal. Extend a rational integral basis in B and exclude denominators/conductors to get maximality at almost all v.

**Prerequisites.** `mathlib:Subring.comap`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.

**Source.** [Ilya Khayutin](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), §2.3, printed pp.159–160; Cornut–Vatsal Appendix6.1 p.62. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Include the split quadratic étale algebra; field-only types are insufficient. The global order is the intersection of all the transported local orders, and need not equal E∩O.

### 2. Transported global order

`HeegnerPointEulerSystems:HE.0/transported-global-order` — comparison. Prototype: `TauCeti.Heegner.transported_global_order`.

For a rational quadratic embedding E↪B and a restricted adelic g, Λ=E∩∏_v Λ_v is a finite-index Z-order in O_E, with Λ⊗Z_v≃Λ_v. Its Picard group is the existing CommRing.Pic Λ, equivalently ClassGroup Λ; only invertible proper fractional ideals occur.

**Construction/proof.** Clear the finitely many local denominators, then use lattice intersection/localization from GN11. Apply the pinned ClassGroup.equivPic for the domain Λ; no Dedekind hypothesis is required.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/local-toral-order`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`; `mathlib:ClassGroup.equivPic`.

**Source.** [Ilya Khayutin](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), §2.4.3–2.4.4, printed pp.165–167. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. Toral packet and ideal-class comparison

`HeegnerPointEulerSystems:HE.0/idele-ideal-class-comparison` — theorem. Prototype: `TauCeti.Heegner.idele_ideal_class_comparison`.

For the imaginary quadratic transported order Λ, map a finite invertible idele t to the locally principal fractional ideal E∩t∏_v Λ_v. This induces the ordinary finite idele-class quotient the left quotient of A_E,f× by E× and the right quotient by Λ̂×≃Pic Λ and the S={∞} toral packet quotient C_S≃Pic Λ. The torus covering E×→E×/Q× is used explicitly; kernel triviality uses the class number one of Q.

**Construction/proof.** Import the GN11 idele–invertible-ideal equivalence and specialize to the transported order. Separate the covering torus from the quotient torus; divide by Q-ideles and use principal Q-ideals. A noninvertible adele maps to the adjoined zero in the extended construction; it is not an invertible ideal.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/transported-global-order`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.

**Source.** [Ilya Khayutin](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), §2.4.4, printed pp.165–167. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Restricted, not unrestricted, products are required. Unit stabilizers are Λ_v×, not Λ_v as a multiplicative monoid.

### 4. Conductor-change kernel

`HeegnerPointEulerSystems:HE.0/conductor-change-kernel` — theorem. Prototype: `TauCeti.Heegner.conductor_change_kernel`.

Let K/Q be imaginary quadratic, c≥1 and ℓ prime. Extension of invertible ideals gives Pic(O_cℓ)→Pic(O_c), surjectively. If ℓ∤c, its kernel is (O_c/ℓO_c)×/((Z/ℓZ)×·image(O_c×)); thus u_c,ℓ·#ker=ℓ−χ_K(ℓ), where u_c,ℓ=[O_c×:O_cℓ×]. If ℓ|c, u_c,ℓ·#ker=ℓ. χ takes −1,0,1 in inert, ramified, split cases. Every quotient and map is induced by the actual inclusions of orders.

**Construction/proof.** Import order Picard functoriality (GN11 and pinned mapRingHom). Use the local unit quotient O_c,v×/O_cℓ,v×; identify the global-unit kernel. Compute residue field, dual-number and split-product units; divide only after proving the unit index divides the local quotient cardinal.

**Prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`; `mathlib:CommRing.Pic.mapRingHom`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §2.3 p.23; Appendix6.1 pp.61–62. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** For Q(i), c=1, inert ℓ=3: u=2 and degree=2, not 4. For Q(√−3), c=1, inert ℓ=5: u=3 and degree=2, not 6. At repeated conductor primes the local quotient has cardinal ℓ, not ℓ+1.

### 5. Ring-class tower and finite Galois quotients

`HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients` — theorem. Prototype: `TauCeti.Heegner.ring_class_tower_quotients`.

Using the ring-class existence theorem imported from CFT13, realize every K[c] in a fixed separable closure of K. For c|d, O_d⊂O_c gives K[c]⊂K[d] and restriction Gal(K[d]/K)→Gal(K[c]/K), compatible under composition and with ideal extension under Artin. Its kernel is Gal(K[d]/K[c]), and [K[cℓ]:K[c]] equals the kernel cardinal computed in conductor-change-kernel. Splitting of a prime away from the conductor is equivalent to its invertible ideal class being trivial; K[c]/K is unramified outside c and the exact local ramification is supplied by local unit reciprocity.

**Construction/proof.** Import existence and canonical Artin isomorphisms, not merely an Artin map for a given field. Convert order-unit inclusion to inclusion of class fields by the Galois correspondence. Identify quotient restrictions, degrees and decomposition/inertia groups under reciprocity.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §3 pp.238–240; Cornut–Vatsal §2 pp.20–23. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Dihedral action on the tower

`HeegnerPointEulerSystems:HE.0/dihedral-conjugation` — theorem. Prototype: `TauCeti.Heegner.dihedral_conjugation`.

For imaginary quadratic K/Q, K[c]/Q is Galois and a chosen complex conjugation τ satisfies τστ⁻¹=σ⁻¹ for σ∈Gal(K[c]/K). The conjugation is attached to an archimedean embedding and compatible throughout the tower. Do not equip a general ring class field with IsCMField: it need not be a CM field.

**Construction/proof.** The ideal class of the conjugate invertible ideal is the inverse, since their product is a rational principal ideal. Transport this identity through the imported Artin isomorphism and extend τ from the fixed separable closure.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §3 p.239. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** A nontrivial class group of exponent exceeding two gives a nonabelian dihedral extension over Q; no canonical CM-field involution is assumed.

### 7. Relative CM conductor tower

`HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower` — theorem. Prototype: `TauCeti.Heegner.relative_cm_conductor_tower`.

Let F be totally real, K/F totally imaginary quadratic and P a finite prime of F. The imported orders O_Pn=O_F+PⁿO_K and class fields K[Pⁿ] have a compatible Galois inverse limit G∞. The finite idele/unit quotient realizes this limit; G∞ has finite torsion subgroup G0 and G∞/G0≃Z_p^[F_P:Q_p]. For sufficiently large n, [K[Pⁿ⁺¹]:K[Pⁿ]]=N(P), with the finite initial global-unit indices retained. The admissible level subgroup is the intersection with the specified quaternionic level, not an arbitrary replacement.

**Construction/proof.** Import general orders GN11 and relative class-field existence CFT12. Use compact inverse limits and stabilization of global units to kill lim¹ in Cornut–Vatsal Lemma2.1. Compute higher local quotients with the dual numbers and apply the actual Artin quotient maps.

**Prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; `HilbertModularVarietiesAndShimuraCurves:H4`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §2 pp.20–23, Lemmas2.1–2.9; §1.1 p.4. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 8. Norm, reciprocity and level compatibility

`HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility` — theorem. Prototype: `TauCeti.Heegner.norm_reciprocity_level_compatibility`.

For the relative CM towers and an inclusion of admissible finite-level subgroups, field restriction, finite idele quotient projection and order ideal extension commute under Artin. For a finite extension of CM bases, field norm and ideal norm agree with the imported functorial Artin map on the relevant finite quotient. Cornut–Vatsal uses geometric Frobenius: the arithmetic-Frobenius version in this packet inverts the reciprocity/Frobenius arguments before using any pointwise identity.

**Construction/proof.** Apply the CFT norm/restriction square to the actual level-unit subgroup. Prove subgroup containment before descending a norm map; no norm map on the wrong order Picard group is assumed. Apply the inverse convention comparison from GZ0 to every CM Galois-action formula.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §1.7 p.19, §2.1 pp.20–21, §3.8 p.35. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 9. Different of the local toral order

`HeegnerPointEulerSystems:HE.0/local-different-discriminant` — theorem. Prototype: `TauCeti.Heegner.local_different_discriminant`.

For the local quadratic étale order Λ_v, define its trace dual Λ_v∨={a∈E_v:Tr(aΛ_v)⊆Z_v} using the imported lattice/trace pairing. Its inverse different is a principal invertible fractional Λ_v-ideal; the different is its inverse. The ideal norm (equivalently the absolute local discriminant valuation) agrees with the order discriminant. This does not identify the signed field norm of a generator with a positive discriminant; in a split conductor-π order a generator (π,−π) has norm −π².

**Construction/proof.** Use a local integral basis (1,α), invert the trace matrix, and exhibit a generator of the dual. Multiply by the conjugate linear-factor difference and check the ideal norm/discriminant valuation. Retain the nonmaximal-order input: the maximal number-field different alone is insufficient.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/local-toral-order`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.

**Source.** [Ilya Khayutin](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), §5.1.1 pp.184–186, Definition5.7 and Lemma5.8. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check split, inert and ramified quadratic étale inputs, including residue characteristic two. Keep archimedean Euclidean-area discriminant π² or explicitly renormalize it; source finding PAPER-KHAYUTIN-19/E7 applies.

**Remaining boundary.** Supplier order/relative class-field realizations and typed geometry are open requests; source-backed arithmetic target pass is recorded.


## HE.1. CM points and compatible modular parametrizations

**Planets:** CM cyclic-isogeny pair; Optimal embeddings and quaternionic CM points; CM descent to the canonical tower; Jacobian basepoint and Hodge denominators; Heegner point family.

### 1. CM cyclic-isogeny pair

`HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair` — theorem. Prototype: `TauCeti.Heegner.cm_cyclic_isogeny_pair`.

Assume K imaginary quadratic of discriminant different from −3,−4, N≥1 with every prime dividing N split, c prime to N, and an invertible O_c-ideal 𝔑_c with O_c/𝔑_c≃Z/NZ. For a proper invertible fractional ideal a, the pair C/a→C/(𝔑_c⁻¹a) is cyclic of degree N and gives the corresponding existing X₀(N) moduli point. The endomorphism ring is O_c; replacing a by αa gives the same level pair. Changing 𝔑 or its orientation is an explicitly recorded Galois/Fricke action, not literal equality.

**Construction/proof.** Use the imported CM elliptic curve and ideal-action theory, with the existing modular moduli interpretation. Check the kernel 𝔑_c⁻¹a/a and its cyclic order N before applying the X₀(N) constructor.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`; `ComplexMultiplicationAndExplicitReciprocity:CM.1`; `ModularCurvesPartII:R14.1`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §1 p.235; §3 pp.238–239; Howard §1.7 p.19. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Optimal embeddings and quaternionic CM points

`HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points` — theorem. Prototype: `TauCeti.Heegner.optimal_embedding_cm_points`.

For F totally real, K/F CM, B ramified at all but one real place and specified finite places, and Eichler order R, an optimal embedding O_C↪R is an F-algebra embedding K↪B satisfying K∩R=O_C. K splits B iff K_v is a field at every ramified finite place (and the archimedean embedding condition holds). The CM double-coset description K×\B̂×/R̂× with a specified archimedean CM type identifies the complex CM points, with local optimal-embedding conditions required by the chosen Eichler level. It has not yet asserted rationality.

**Construction/proof.** Import local quaternion embedding and optimal-order existence from H4/H5. Use Skolem–Noether and the selected fixed point h_K; compare the canonical Shimura complex uniformization. Check split primes at Γ₀ level and nonsplit ramified primes separately.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`; `HilbertModularVarietiesAndShimuraCurves:H4`; `HilbertModularVarietiesAndShimuraCurves:H5`; `ShimuraVarieties:V5`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §3.8 pp.34–35; Zhang §3.2 pp.205–206. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. CM descent to the canonical tower

`HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent` — theorem. Prototype: `TauCeti.Heegner.canonical_model_cm_descent`.

For the CM level points above, the imported main CM theorem/canonical model reciprocity shows x_C∈X(K[C]) in the actual HE.0 tower. Its stabilizer is K× times the intersection of the finite torus with the chosen level; σ=rec_K(t) acts by x(g)↦x(t^εg) in Cornut–Vatsal’s geometric convention. Convert to arithmetic reciprocity with the inverse convention before comparison. The statement concerns the cyclic-isogeny pair or optimal embedding, not only j(E).

**Construction/proof.** Apply CM1/CM2 for the modular pair and V5 for the quaternionic canonical model. Identify the precise level stabilizer with the HE.0 order-unit subgroup. Use fixed-field descent to produce an actual rational point, then compare all tower transition maps.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`; `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`; `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`; `ComplexMultiplicationAndExplicitReciprocity:CM.2`; `ShimuraVarieties:V5`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §3.8 p.35; Howard §1.7 p.19. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Jacobian basepoint and Hodge denominators

`HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators` — theorem. Prototype: `TauCeti.Heegner.jacobian_basepoint_denominators`.

For X₀(N) use the rational cusp ∞ to form [x−∞]. For a compact quaternionic curve use the imported normalized rational Hodge class ξ=(K_X+B_X)/deg(K_X+B_X), componentwise of degree one; x↦[x−ξ] lies in J⊗Q. Choose a nonzero integer d clearing the denominators to obtain the integral class [d x−d ξ]. Do not erase d. For an auxiliary ℓ₀, (ℓ₀+1−Tℓ₀)x is degree zero; after quotienting by an eigenform g, division by ℓ₀+1−aℓ₀ is valid integrally at p only if it is a p-adic unit.

**Construction/proof.** Import ξ and Jacobian/Picard geometry from GZ3. Apply degree and Hecke-eigenclass identities to x−ξ, retaining the divisor coefficient denominator. Compare the cusp, Hodge and auxiliary-Hecke construction after rationalization; keep any integral torsion discrepancy.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`; `GrossZagierAndArithmeticHeights:GZ.3`; `EllipticCurveModularity:R29.5`; `ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §3.5 pp.29–32; Zhang Remark6 pp.205–206. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 5. Heegner point family

`HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation` — construction. Prototype: `TauCeti.Heegner.conductorPoint`.

Fix the descended CM family x_c, the level orientation, the integral cusp or d-cleared Hodge construction, and an actual fixed modular quotient φ:J→A defined over the base. Define P_c=φ([d x_c−d ξ])∈A(K[c]); the modular cusp branch has d=1. Keep deg φ and any Manin constant as data. Define y_K=Tr_{K[1]/K}P_1 separately: P_1 is generally not K-rational. In Lean the supplier geometry is an explicitly missing condition on the supplied CM points and map, not an invented CM-point carrier.

**Construction/proof.** Compose the actual CM-point map with the Jacobian and quotient maps. Use canonical descent and functoriality to prove the field of definition. Specialize to the classical cusp construction used by Gross and Howard.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`; `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`; `EllipticCurveModularity:R29.5`; `EllipticCurveModularity:R29.5/modular-parametrisation`; `ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), §1.7 p.19; Gross §1 p.236; Zhang §3.7 p.213. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Use-derived API.**

- Gross Proposition3.7: The chosen P_c are the terms in the norm and reduction identities.
- Howard Lemmas1.7.1–1.7.3: Differentiated points and local Kummer conditions use this actual family.
- Gross §1 p.236: The trace, quotient and Manin constant control the index.

- `TauCeti.Heegner.conductorPoint` (constructor): For a specified descended CM family x and the fixed integral Jacobian/modular map φ, conductorPoint φ x c=φ(x_c).
- `TauCeti.Heegner.conductorPoint_apply` (simp): Evaluation is the composite φ(x_c), with the d-cleared Jacobian class included in φ.
- `TauCeti.Heegner.conductorPoint_postcompose` (functoriality): Postcomposing φ by a defined homomorphism f carries each point to f(P_c).
- `TauCeti.Heegner.conductorPoint_galois` (compatibility): For a Galois-equivariant φ and action on the descended CM family, conductorPoint commutes with that action.

**Discriminating unit tests.**

- `TauCeti.Heegner.conductorPoint_cusp` (compatibility): For the classical cusp map, conductorPoint is φ([x_c−∞]); no Hodge denominator occurs.
- `TauCeti.Heegner.conductorPoint_zero_quotient` (degenerate): A zero quotient map yields the zero point at every conductor.
- `TauCeti.Heegner.conductorPoint_trace_not_basepoint` (non-example): For the two-element group acting on ℤ by negation, the selected point is 1 and its orbit trace is 1+(−1)=0. The point-family constructor returns 1, not its trace.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Parametrization choice, degree and torsion

`HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree` — theorem. Prototype: `TauCeti.Heegner.parameter_choice_and_degree`.

For the fixed Heegner family, ideal-class translation gives the corresponding Galois translation; a Fricke/orientation change acts by the recorded eigenvalue and rational cusp-torsion translation. Multiplying the modular parametrization or clearing Hodge denominators scales P_c and the bottom trace by that integer. For Gross’s rational optimal curve, φ*ω_E=c_φ·(2πif(z)dz), with positive integral Manin constant c_φ; the index I_K/c_φ is invariant under the appropriate isogeny change, not I_K alone.

**Construction/proof.** Use CM ideal reciprocity and the actual quotient’s Hecke/Fricke action. Use Manin–Drinfeld only for the cusp-difference torsion term; do not remove it until a prime-to-p argument is supplied. Track the differential, degree and scalar under composition/isogeny.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`; `EllipticCurveModularity:R29.5`; `GrossZagierAndArithmeticHeights:GZ.3`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §1 pp.236–237; §5 pp.243–244; Zhang Remarks6–7. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Trace is independent of coset representatives, but an individual point need not be. A p-divisible scaling of φ destroys primitivity without destroying non-torsion.

**Remaining boundary.** The rational-point/canonical-model and modular quotient suppliers remain open; their contracts are not recreated here.


## HE.2. Geometric norm and reduction-congruence relations

**Planets:** Hecke neighbors of a CM point; Inert Heegner norm relation; Split and ramified first-step relations; Repeated-conductor predecessor relation; Heegner reduction congruence.

### 1. Hecke neighbors of a CM point

`HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification` — theorem. Prototype: `TauCeti.Heegner.cm_hecke_conductor_classification`.

At a finite prime P where B is split and the Eichler level is maximal, let ε_P=−1,0,1 for inert, ramified, split K/F. A level-zero CM lattice has 1+ε_P horizontal neighbors and N(P)−ε_P ascending neighbors of conductor P. At positive conductor n it has one predecessor of conductor n−1 and N(P) ascending neighbors of conductor n+1. The ascending set is a torsor for O_n×/O_n+1×. Global unit stabilizers must be divided out when converting this local sum into a field trace.

**Construction/proof.** Specialize the imported quaternionic local lattice/moduli description. Use the order residue algebra and its action on P¹, as in Cornut–Vatsal Lemmas6.1 and6.5. Descend the neighbor enumeration through the actual CM moduli map.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`; `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`; `HilbertModularVarietiesAndShimuraCurves:H5`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Appendix6.1–6.2 pp.62–64. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Inert Heegner norm relation

`HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence` — theorem. Prototype: `TauCeti.Heegner.norm_relation_and_reduction_congruence`.

Under the classical Heegner hypothesis, ℓ prime with ℓ∤cN and inert in K, the compatible cusp-normalized family satisfies u_c,ℓ·Tr_{K[cℓ]/K[c]}P_cℓ=a_ℓP_c. With ordinary units u=1 this is the Gross/Howard equality. For a d-cleared Hodge family, first prove that the chosen basepoint is a Hecke eigenclass and transport the divisor relation; retain any integral torsion difference if only a rational eigenclass identity is known.

**Construction/proof.** Apply the previous Hecke-neighbor enumeration with ε=−1. Compare the local unit orbit to the actual field trace using HE.0’s kernel calculation. Apply the Hecke-equivariant fixed modular quotient.

**Prerequisites.** `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`; `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`; `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`; `EllipticCurveModularity:R29.5`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition3.7(i), pp.240–241; Howard §1.7 p.19. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Do not silently assert degree ℓ+1 for the two exceptional unit fields. The equation is on actual points after all basepoint/torsion terms have been proved to disappear.

### 3. Split and ramified first-step relations

`HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence` — theorem. Prototype: `TauCeti.Heegner.split_ramified_first_step_recurrence`.

For ℓ∤cN, the local divisor trace with u_c,ℓ retained equals T_ℓx_c−(σ_ℓ+σ_ℓbar)x_c in the split case and T_ℓx_c−σ_ℓx_c in the ramified case. Here Frobenius on the lower-conductor field is unramified at ℓ; the ramified case refers to K/Q ramification, not ramification of K[c]/K away from c. Use the specified reciprocity convention. After the fixed eigenquotient replace T_ℓ by a_ℓ only with the exact Jacobian basepoint corrections.

**Construction/proof.** Apply Corollary6.6 with n=1 and the horizontal-neighbor list. Invert geometric Frobenius when converting Cornut–Vatsal’s formula to the arithmetic convention. Carry the complete divisor relation through the quotient.

**Prerequisites.** `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`; `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`; `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Corollary6.6, p.64. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Repeated-conductor predecessor relation

`HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence` — theorem. Prototype: `TauCeti.Heegner.repeated_conductor_predecessor_recurrence`.

At maximal local quaternionic level and conductor exponent n≥2, the local unit trace of a CM point x of conductor n is T_P^lower(pr^upper x)−pr^lower(pr^upper x). On a coherent chosen chain this gives the repeated-conductor recurrence, with predecessor and central scaling specified. Passing to the global field trace divides the orbit by the actual global-unit stabilizer; it must not simply copy the first-step inert ℓ+1 formula.

**Construction/proof.** Use Lemma6.5’s unique predecessor, then Corollary6.6. Prove that the chosen conductor chain’s two predecessor operations match the modular CM orientation and central action. Only then translate the recurrence to Heegner quotient points.

**Prerequisites.** `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`; `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`; `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Corollary6.6, p.64. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 5. Distribution at nonmaximal local level

`HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution` — theorem. Prototype: `TauCeti.Heegner.nonmaximal_level_distribution`.

For a prime P with Eichler level exponent δ=1, orient the lattice pair and its type I/II. For conductor ≥2, its unit trace equals the appropriate upper/lower Hecke operator on its predecessor and becomes −pr(x) in the P-new quotient. For δ≥2, type I/II points have zero trace in the P-new quotient; type III is excluded. Reversing the orientation exchanges types I and II. These are divisor-module statements before any abelian quotient.

**Construction/proof.** Import the local Eichler lattice-pair interpretation and P-new quotient. Apply Cornut–Vatsal Lemmas6.11 and6.14, retaining the leading vertex/type and orientation. Verify the quotient used by the chosen modular form is genuinely P-new.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`; `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`; `HilbertModularVarietiesAndShimuraCurves:H5`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Appendix6.3–6.4 pp.65–67. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Heegner reduction congruence

`HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence` — theorem. Prototype: `TauCeti.Heegner.inert_reduction_frobenius_congruence`.

For the classical compatible family, ℓ∤cND inert, choose compatible primes λ_cℓ|λ_c over ℓ and the actual good-reduction specialization maps. Then red_λcℓ(P_cℓ)=Frob_λc(red_λc(P_c)) after the specified residue-field identifications; Frobenius is the ℓ-power geometric endomorphism on the reduction of the modular/elliptic curve as fixed in Gross’s convention. State separately the Artin arithmetic-Frobenius conversion. This is pointwise, not merely an equality of traces.

**Construction/proof.** Apply the imported geometric Eichler–Shimura relation T_ℓ=Fr+Fr∨. Use the CM branch specializing to the inseparable isogeny and the total ramification/residue F_ℓ² calculation. Carry specialization through the Néron-model extension of the quotient.

**Prerequisites.** `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`; `NeronModelsAndSemistableAbelianVarieties:R11.2`; `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura`; `ModularCurvesPartII:R14.6/neron-hecke-extension`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition3.7(ii) and proof, pp.240–241. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 7. Quaternionic CM reduction and specialization

`HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization` — theorem. Prototype: `TauCeti.Heegner.quaternionic_reduction_specialization`.

For Zhang’s m∈Λ′+ and an admissible q∤m, reduction of x_m(n) at q is x_mq(n) in the definite Shimura set, using the matched optimal embedding and supersingular identification. For q|m, specialization is x_m/q(n) on the chosen vertex copy of the semistable reduction graph. Both formulas require the same CM/basepoint identifications and q splitting completely in the fields of definition used.

**Construction/proof.** Import Cerednik–Drinfeld and good-reduction moduli models, not re-prove them. Match the basepoint-induced embeddings K↪B_mq and K↪B_m/q. Compute the norm/forgetful maps on the finite double cosets as in (3.18)–(3.19).

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`; `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`; `HilbertModularVarietiesAndShimuraCurves:H5`; `NeronModelsAndSemistableAbelianVarieties:R11.6`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §§3.4–3.6, pp.207–211, Theorem3.1. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Remaining boundary.** Exact geometric/cohomological supplier contracts remain open; target-level declarations and proof routes are recorded.


## HE.3. Kummer classes and exact Selmer conditions

**Planets:** Heegner Kummer classes; Component obstruction at bad places; Kummer condition at the coefficient prime.

### 1. Heegner Kummer classes

`HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions` — theorem. Prototype: `TauCeti.Heegner.kummer_classes_and_the_modified_selmer_conditions`.

Apply the imported finite Kummer injection E(K[c])/p^mE(K[c])→H¹_cont(K[c],E[p^m]) to P_c. Apply the imported p-adic Kummer map to the compatible p-completion to obtain the integral T_pE class. The finite classes are its actual coefficient reductions, and restriction/corestriction commute with the field maps/point trace, including all trace/unit constants from HE.2. The Tate module has its inverse-limit topology and finite torsion coefficients their discrete topology.

**Construction/proof.** Use EllipticCurves Layer7 and L0, not the multiplicative μ_n Kummer map as an elliptic Kummer map. Apply connecting-homomorphism naturality to the exact multiplication sequence and the actual trace maps. Use the continuous inverse-limit comparison, recording any lim¹/invariant obstruction.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`; `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `SelmerIwasawaCohomology:L0`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), §§1.1,1.7 pp.5–8,19–21; Gross §4 pp.241–243. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Good-place Kummer condition

`HeegnerPointEulerSystems:HE.3/good-place-kummer-unramified` — theorem. Prototype: `TauCeti.Heegner.good_place_kummer_unramified`.

For ℓ≠p of good reduction, the finite Kummer image E(K_v)/p^m agrees with H¹_unr(K_v,E[p^m]); in particular P_c’s Kummer class is unramified at such v, after transfer to the relevant field. The proof uses the Néron model and unramified torsion, not a claim that all local cohomology is unramified.

**Construction/proof.** Import the good-reduction Kummer/unramified comparison from EC7/L1. Apply it to the actual local point and use specialization for the finite torsion quotient.

**Prerequisites.** `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `SelmerIwasawaCohomology:L1`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §7 pp.247–249. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. Component obstruction at bad places

`HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction` — theorem. Prototype: `TauCeti.Heegner.bad_place_component_obstruction`.

For finite v∤p, compare the local point Kummer image with the propagated rational unramified condition. The discrepancy factors through the p-primary component group of the Néron model, together with the precise local invariants/quotient torsion terms. Equality requires the appropriate obstruction to vanish; residual irreducibility alone does not remove it. For Gross’s derived d(n), the cusp-divisor and connected-Néron-model argument proves local triviality away from n even at primes dividing N.

**Construction/proof.** Import the exact local Néron component sequence and unramified connected-part H¹ vanishing. Apply the Heegner cusp-divisor identity and prime-to-p rational cusp torsion under Gross’s big-image hypothesis. Distinguish this special derived-class argument from a universal integral unramified-condition equality.

**Prerequisites.** `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`; `NeronModelsAndSemistableAbelianVarieties:R11.2`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `NeronModelsAndSemistableAbelianVarieties:R11.2/component-group`; `NeronModelsAndSemistableAbelianVarieties:R11.2/elliptic-filtration`; `SelmerIwasawaCohomology:L2/finite-unramified-comparison`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition6.2 and proof, pp.244–247. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Kummer condition at the coefficient prime

`HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition` — theorem. Prototype: `TauCeti.Heegner.coefficient_prime_local_condition`.

At v|p with good reduction, the actual Kummer class of P_c satisfies the finite/crystalline rational condition and its integral propagated Kummer condition. In the good ordinary branch compare with the Greenberg filtration only under the exact ordinary/crystalline comparison hypotheses and retain local-torsion error terms. A rational equality after tensoring with Q_p is not an equality of integral lattices.

**Construction/proof.** Apply the finite-flat/crystalline Kummer theorem from R07 and EC7. Use the actual point Kummer class and the propagated T→V→A diagrams. In the ordinary branch use L2’s local filtration comparison and record its defect.

**Prerequisites.** `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `SelmerIwasawaCohomology:L2`; `SelmerIwasawaCohomology:L2/condition-propagation`; `SelmerIwasawaCohomology:L2/greenberg-condition`; `SelmerIwasawaCohomology:L4/bloch-kato-condition`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), §1.6, Theorem1.6.5 proof, pp.18–19. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 5. Saturated integral Kummer comparison

`HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice` — theorem. Prototype: `TauCeti.Heegner.saturated_integral_kummer_lattice`.

Compare the actual finite/p-adic Heegner Kummer classes in the Selmer lattice with E(K)⊗Z_p, V_pE, and E[p∞]. Use the Kummer exact sequence to identify the quotient by the Mordell–Weil lattice with the appropriate Sha group. Saturation is a separate integral assertion; the finite cokernel and local component-group defects must be retained before rationalizing.

**Construction/proof.** Import the EC7 Kummer exact sequences and L0 inverse-limit comparison. Use the actual coefficient reduction maps, not unrelated choices of finite classes. Compute the torsion kernel/cokernel of integral-to-rational propagation.

**Prerequisites.** `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`; `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`; `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `SelmerIwasawaCohomology:L0`; `SelmerIwasawaCohomology:L2/lattice-passage`; `SelmerIwasawaCohomology:L2/elliptic-selmer-instance`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), Introduction pp.1–3; §1.6 pp.18–19. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Archimedean Tate correction

`HeegnerPointEulerSystems:HE.3/archimedean-tate-correction` — theorem. Prototype: `TauCeti.Heegner.archimedean_tate_correction`.

Over imaginary quadratic K all archimedean completions are C, so the relevant local H¹ vanishes. In descent to Q at a real place use the real/Tate local condition on the actual E[p^m] module. Odd p permits the usual conjugation eigenspace splitting; at p=2 its kernel/cokernel must be retained and one cannot divide by two on an integral Z₂ lattice.

**Construction/proof.** Apply the imported real Galois/Tate cohomology calculation from R02. Specialize to E[p^m] and distinguish complex K from the real Q base.

**Prerequisites.** `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`; `ArithmeticGaloisDuality:R02.4`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition6.2, p.245; §8 p.249. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Remaining boundary.** Exact geometric/cohomological supplier contracts remain open; target-level declarations and proof routes are recorded.


## HE.4. Heegner derivative classes and choice independence

**Planets:** Heegner conductor coefficient ideal; Vanishing of ring-class torsion invariants; Descended Heegner derivative class; Bottom class is the trace Kummer class; Generator change and intrinsic tensor coefficient; Parity of the Heegner derivative class.

### 1. Heegner conductor coefficient ideal

`HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal` — construction. Prototype: `TauCeti.Heegner.coefficientIdeal`.

Fix an odd prime p and an actual Hecke eigenvalue function a_ℓ. Set I_ℓ=(a_ℓ,ℓ+1)⊂Z_p and I_n=Σ_{ℓ|n}I_ℓ for squarefree n of admissible inert primes. The quotient is Z_p/I_n. For n=1 the empty sum is zero, so the coefficient module is the full Tate lattice, not its residual reduction. If n>1 then I_n=(p^M(n)) with M(n)=min_{ℓ|n}min(v_p(a_ℓ),v_p(ℓ+1)). An intersection/product would give the wrong modulus.

**Construction/proof.** Use existing PadicInt and Ideal.span. Form the finite sum of ideals and use the DVR ideal/valuation classification. Compare the quotient to the coefficient reduction used by ES3.

**Prerequisites.** `mathlib:PadicInt`; `EulerSystemsAndKolyvaginSystems:ES.3`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), §1.7 pp.19–20; Zhang §1 p.194 and Notations p.202. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Use-derived API.**

- Howard Lemma1.7.1: Both Hecke eigenvalue and cyclic extension degree vanish modulo I_n.
- Zhang §3.7 pp.212–213: The allowable exponent M is the minimum conductor modulus.

- `TauCeti.Heegner.coefficientIdeal` (constructor): For the finite prime set s and eigenvalues a, coefficientIdeal p a s=Σ_{ℓ∈s}span{a_ℓ,ℓ+1} in Z_p.
- `TauCeti.Heegner.coefficientIdeal_empty` (simp): coefficientIdeal p a ∅=0.
- `TauCeti.Heegner.coefficientIdeal_insert` (relation): For ℓ∉s, the ideal for insert ℓ s is span{a_ℓ,ℓ+1}+the ideal for s.
- `TauCeti.Heegner.coefficientIdeal_le_of_subset` (functoriality): s⊆t implies I_s≤I_t, hence there is the quotient map Z_p/I_s→Z_p/I_t.

**Discriminating unit tests.**

- `TauCeti.Heegner.coefficientIdeal_conductor_one` (degenerate): The empty conductor has zero ideal, so it does not force p to vanish.
- `TauCeti.Heegner.coefficientIdeal_prime_five` (computation): For p=5, s={19}, a_19=10, the ideal is (5).
- `TauCeti.Heegner.coefficientIdeal_min_not_max` (non-example): For p=5, s={19,149}, a_19=10,a_149=25, the ideal is (5), not (25); the sum takes the minimum valuation.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Differentiated point invariance

`HeegnerPointEulerSystems:HE.4/differentiated-point-invariance` — theorem. Prototype: `TauCeti.Heegner.differentiated_point_invariance`.

For the actual squarefree ring-class conductor n, let G_n=Gal(K[n]/K[1]) be the product of its cyclic inert factors and 𝒢_n=Gal(K[n]/K). Under ordinary units and the clean torsion-image hypotheses, choose generators σ_ℓ and coset representatives S for 𝒢_n/G_n. Use ES3’s D_n=∏D_ℓ and set the differentiated point ˜P_n=Σ_{s∈S}sD_nP_n. Its class modulo I_n is 𝒢_n-invariant and independent of S. Use the full 𝒢_n action, not merely invariance under G_n. Exceptional-unit factors require a modified bounded-denominator construction, not an assumed direct product.

**Construction/proof.** Apply ES3’s (σ−1)D=|G|−Norm identity to HE2’s actual norm relation. Both a_ℓ and ℓ+1 vanish in the actual coefficient ideal. Sum over the class-group cosets and show changing representatives contributes zero modulo I_n.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`; `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`; `EulerSystemsAndKolyvaginSystems:ES.3`; `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), Lemma1.7.1 pp.19–20; Gross §4 pp.241–243. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. Vanishing of ring-class torsion invariants

`HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants` — theorem. Prototype: `TauCeti.Heegner.ring_class_torsion_invariants`.

Under Gross’s odd-p full residual image hypothesis or Howard’s full G_K Tate-image hypothesis, E[p^m](K[n])=0 for the relevant ring-class towers and all m≥1. The residual case uses the generalized-dihedral nature of K[n]/Q and the irreducible two-dimensional image; bootstrap finite exponent using multiplication by p. This statement is not implied by residual irreducibility for arbitrary field extensions.

**Construction/proof.** Apply the actual field/Galois quotient from HE0. Use the image subgroup and dihedral quotient argument in Gross Lemma4.3. Reduce any nonzero p^m invariant to nonzero p-torsion.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/dihedral-conjugation`; `ArithmeticGaloisRepresentations:R01.4`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Lemma4.3 pp.242–243; Howard Lemma1.7.1 proof p.20. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Descended Heegner derivative class

`HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K` — construction. Prototype: `TauCeti.Heegner.descendedClass`.

Under the proved torsion-invariant vanishing, inflation–restriction gives res:H¹_cont(K,E[p^m])≃H¹_cont(K[n],E[p^m])^𝒢_n for m≤M(n). Define c_m(n) as res⁻¹ of the Kummer class of ˜P_n. For integral conductor-one use the T_pE Kummer class of y_K. Without invariant vanishing, keep the H¹/H² kernel/cokernel terms and use the separate error-tolerant ES3/4 construction; there is no unrestricted unique inverse.

**Construction/proof.** Use the actual finite Galois restriction map from R02, whose inverse exists only after the previous node. Apply it to the invariant differentiated Kummer class. Check that the resulting class has the prescribed restriction, independent of cocycle/root/representative choices.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/differentiated-point-invariance`; `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`; `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`; `EulerSystemsAndKolyvaginSystems:ES.3`; `ArithmeticGaloisDuality:R02.2/five-term-transgression`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §4 pp.242–243; Howard Lemmas1.7.1–1.7.2 p.20; Zhang(3.21) p.213. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Use-derived API.**

- Gross Proposition4.7: Divisibility of the actual differentiated point detects c(n) and its torsor image d(n).
- Howard Lemma1.7.3: Finite/transverse local conditions are proved on this descended class.

- `TauCeti.Heegner.descendedClass` (constructor): descendedClass resInv z is the unique class whose restriction is the invariant differentiated Kummer class z.
- `TauCeti.Heegner.descendedClass_restrict` (characterisation): Its actual restriction equals z.
- `TauCeti.Heegner.descendedClass_unique` (extensionality): Any class with restriction z equals descendedClass resInv z.
- `TauCeti.Heegner.descendedClass_natural` (functoriality): A commuting coefficient/restriction square carries descendedClass to the class obtained by descending the reduced differentiated Kummer class.

**Discriminating unit tests.**

- `TauCeti.Heegner.descendedClass_zero` (degenerate): The zero invariant differentiated Kummer class descends to zero.
- `TauCeti.Heegner.descendedClass_identity` (compatibility): For the trivial field extension, resInv=id and descendedClass is the Kummer class itself.
- `TauCeti.Heegner.descendedClass_noninjective_obstruction` (non-example): A restriction map with nonzero kernel does not define a unique descended class; the constructor requires the proved additive equivalence.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 5. Explicit cocycle and divisibility criterion

`HeegnerPointEulerSystems:HE.4/explicit-cocycle-divisibility` — theorem. Prototype: `TauCeti.Heegner.explicit_cocycle_divisibility`.

Choose p^mQ=˜P_n over the separable closure. The class c_m(n) is represented by σQ−Q−(σ˜P_n−˜P_n)/p^m, where the last quotient is the uniquely specified K[n]-rational division term under torsion vanishing. Hence c_m(n)=0 iff ˜P_n∈p^mE(K[n]); its image d_m(n) in H¹(K,E)[p^m] vanishes iff ˜P_n∈p^mE(K[n])+E(K), with descent interpreted through the actual restriction map.

**Construction/proof.** Compute the connecting cocycle and subtract the division correction. Check cocycle continuity and root-change coboundaries, using the finite algebraic field of definition. Apply the Kummer exact sequence and injective restriction; retain the genuine K-rational summand for d.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`; `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition4.7 and explicit formula, p.243; Howard Lemma1.7.2 p.20. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Bottom class is the trace Kummer class

`HeegnerPointEulerSystems:HE.4/bottom-trace-class` — theorem. Prototype: `TauCeti.Heegner.bottom_trace_class`.

At n=1, D_1=1 and the sum over 𝒢_1 gives y_K=Tr_{K[1]/K}P_1. Thus c_m(1)=δ_m(y_K) and the integral bottom class κ_1=δ_T(y_K), while d_m(1)=0. This is not δ(P_1) over K unless P_1 already descends.

**Construction/proof.** Apply the empty-product identity and the exact finite field trace. Use Kummer/corestriction naturality from HE3.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`; `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §4 p.243; Howard §1.7 p.20; Zhang(3.22) p.213. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 7. Generator change and intrinsic tensor coefficient

`HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence` — theorem. Prototype: `TauCeti.Heegner.generator_tensor_choice_independence`.

After tensoring with G(n)=⊗_{ℓ|n}Gal(K[ℓ]/K[1]), the Heegner derivative class has the prescribed ES3 generator-change transformation law; changing σ_ℓ to σ_ℓ^u changes the derivative class by the inverse unit factor modulo I_n and the cyclic tensor generator by the compensating factor. State compatibility with lift/coset choices separately. Do not assert raw scalar classes are generator-independent.

**Construction/proof.** Apply ES3’s cyclic derivative change-of-generator identity. Tensor with the actual cyclic factors from HE0 and use the coefficient modulus. Verify a two-prime generator change independently in each tensor factor.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `EulerSystemsAndKolyvaginSystems:ES.3`; `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), Theorem1.7.5 pp.20–21; Gross §4 p.242. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 8. Coefficient reduction and auxiliary-prime restriction

`HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility` — theorem. Prototype: `TauCeti.Heegner.coefficient_and_prime_set_compatibility`.

For m′≤m≤M(n), reduction E[p^m]→E[p^m′] takes c_m(n) to c_m′(n) under the exact chosen division/Kummer conventions. Restricting the permitted auxiliary-prime set restricts the same family; adding primes extends the family only when the conductor/norm/reduction hypotheses and tensor factors are proved for them. No map removing a prime factor of n is assumed without the local system relation.

**Construction/proof.** Use the commuting Kummer/restriction square and uniqueness of descended classes. Apply ES2/3 indexing-family restriction and compare conductor ideals.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`; `EulerSystemsAndKolyvaginSystems:ES.3`; `EulerSystemsAndKolyvaginSystems:ES.2`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §3.7 pp.211–213; Howard §1.7 pp.19–21. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 9. Parity of the Heegner derivative class

`HeegnerPointEulerSystems:HE.4/complex-conjugation-parity` — theorem. Prototype: `TauCeti.Heegner.complex_conjugation_parity`.

For odd p and the clean classical branch, if ε is the Fricke eigenvalue of the eigenquotient, τc_m(n)=ε(−1)^ν(n)c_m(n); equivalently using the global root number w=−ε, this is w(−1)^ν(n)+1. The torsion term from the basepoint/Fricke relation is removed only after its prime-to-p proof. At p=2 this formula does not yield an integral direct-sum eigenspace decomposition.

**Construction/proof.** Use the actual CM conjugation/Fricke relation from HE1. Compute τ on cyclic generators and ES3’s derivative, retaining the norm terms before reduction. Kill only the proved prime-to-p cusp-torsion correction.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`; `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `EulerSystemsAndKolyvaginSystems:ES.3`; `HeegnerPointEulerSystems:HE.3/archimedean-tate-correction`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition5.4 pp.243–244; Zhang(3.24) p.213. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Remaining boundary.** Typed continuous descent and ES3 derivative/tensor interfaces are open suppliers; exceptional invariants use the HE.7 error branch.


## HE.5. Local reciprocity and arithmetic hypothesis verification

**Planets:** Transverse condition of the descended class; Heegner finite–singular correction automorphism; Corrected Heegner Kolyvagin system; Tate coefficient and big-image hypotheses; Cartesian, self-dual and conjugation local conditions; Residual Kummer field and detection pairing.

### 1. Transverse condition of the descended class

`HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition` — theorem. Prototype: `TauCeti.Heegner.heegner_transverse_local_condition`.

For ℓ|n an inert auxiliary prime under Howard’s odd-p clean hypotheses, the localization of c(n) restricts to zero over the specified totally ramified local ring-class extension K[n]_λ/K_λ. Thus it lies in the transverse condition used by ES1. Away from n it lies in the propagated finite local condition established in HE3. The p-odd identity Σ_{i=1}^{ℓ}i=ℓ(ℓ+1)/2 enters the transverse proof and cannot be copied integrally at p=2.

**Construction/proof.** Use the explicit Heegner cocycle and the actual local extension. Use HE2’s reduction congruence and the cyclic derivative computation. Check the local restriction vanishes, rather than choose an arbitrary complement of the unramified line.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/explicit-cocycle-divisibility`; `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence`; `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`; `EulerSystemsAndKolyvaginSystems:ES.1`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), Lemma1.7.3 and proof, pp.20–21. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Heegner finite–singular correction automorphism

`HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism` — theorem. Prototype: `TauCeti.Heegner.local_heegner_chi_automorphism`.

At inert ℓ, define Howard’s automorphism χ_ℓ on T/I_ℓT through local reduction, projection to the p-primary subgroup, p^−M(a_ℓ−(ℓ+1)Fr_ℓ), and the canonical torsion lift. The valuation/cyclic Frobenius-eigenspace calculation proves it is invertible. With all chosen cyclic generators retained, χ_ℓ(κ_n(Fr_λ))=κ_nℓ(σ_ℓ) is the actual Heegner finite–singular relation. This is an arithmetic correction to ES1’s generic comparison, not an assertion that raw classes already form a strong system.

**Construction/proof.** Apply the pointwise reduction congruence and the explicit derivative cocycle. Use the good-reduction torsion identification and valuations of ℓ+1±a_ℓ. Check the chosen Frobenius/σ and cyclic tensor normalization in the finite–singular square.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition`; `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence`; `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`; `EulerSystemsAndKolyvaginSystems:ES.1`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), Proposition1.7.4 pp.20–21; published p.1458. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. Corrected Heegner Kolyvagin system

`HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system` — construction. Prototype: `TauCeti.Heegner.correctedClass`.

For the actual descended Heegner family κ_n, construct commuting global cohomology automorphisms χ_ℓ inducing the specified local Howard correction. Let χ_n=∏_{ℓ|n}χ_ℓ. Define κ′_n=χ_n⁻¹(κ_n)⊗σ_n in the cyclic tensor target. Then κ′ satisfies the strong ES1/3 edge relation and κ′_1=κ_1. A local non-G_K-linear coefficient automorphism alone cannot be postcomposed with global cocycles; a legitimate change-of-group action and its localization comparison must be supplied.

**Construction/proof.** Use the G_Q conjugation/change-of-group action on H¹(K,T/I_n), with the matching coefficient action. Verify that each χ_ℓ is induced by that action after the local Kummer/Frobenius identification; this is the explicitly recorded remaining comparison gap. Apply the corrected finite–singular square and commute the global χ maps, tensoring with the cyclic generators.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`; `HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence`; `EulerSystemsAndKolyvaginSystems:ES.3`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), Theorem1.7.5 pp.20–21 and published p.1458. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Use-derived API.**

- Howard Theorem1.6.5: The actual corrected system is input to the self-dual DVR bound.
- HE.8 (outside this part): The unchanged conductor-one class is used in the later anticyclotomic specialization.

- `TauCeti.Heegner.correctedClass` (constructor): correctedClass χ κ=χ⁻¹κ for the proved global additive automorphism χ; the cyclic tensor is retained in the supplied target.
- `TauCeti.Heegner.correctedClass_apply` (simp): correctedClass χ κ is evaluation of χ.symm at κ.
- `TauCeti.Heegner.correctedClass_uncorrect` (characterisation): χ(correctedClass χ κ)=κ.
- `TauCeti.Heegner.correctedClass_comp` (compatibility): For commuting χ,ψ, correction by their product equals successive correction by ψ then χ.

**Discriminating unit tests.**

- `TauCeti.Heegner.correctedClass_bottom` (degenerate): At the empty conductor χ_1=id, so the bottom class is unchanged.
- `TauCeti.Heegner.correctedClass_zero` (computation): The zero class remains zero under correction.
- `TauCeti.Heegner.correctedClass_involution` (non-example): For χ=−id on an additive group, correcting κ gives −κ; raw and corrected classes need not coincide.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Tate coefficient and big-image hypotheses

`HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2` — theorem. Prototype: `TauCeti.Heegner.actual_tate_hypotheses_h0_h2`.

Under Howard TheoremA’s full G_K→GL₂(Z_p) surjectivity, p odd and p∤DN, T=T_pE is free rank two (H0), T/pT is absolutely irreducible (H1), and the auxiliary extension F/Q containing K used in H2 trivializes T and has H¹(F(μ_p∞)/K,T/pT)=0. The central scalar subgroup of order p−1 kills this cohomology. Full Tate-image surjectivity is stronger than residual irreducibility or residual surjectivity and is stated separately.

**Construction/proof.** Import the elliptic Tate module/Weil determinant from EC Layer2. Choose F=Q(E[p∞]) and use the actual field intersection/determinant calculation. Apply the central-scalar cohomology-vanishing argument as in Howard’s verification.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`; `ArithmeticGaloisDuality:R02.2`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), H.0–H.2 pp.8–9, Theorem1.6.5 proof pp.18–19. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 5. Cartesian, self-dual and conjugation local conditions

`HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5` — theorem. Prototype: `TauCeti.Heegner.actual_local_hypotheses_h3_h5`.

For the same actual T, verify H3 cartesian propagation at every quotient of the DVR, H4 the symmetric twisted Weil pairing (s,t)=e(s,τt) and exact orthogonality at conjugate places, and H5 extension of the residual representation to G_Q with one-dimensional τ± eigenspaces, G_Q-stability of local conditions and the required pairing/conjugation identity. Use the rational finite local conditions and their exact integral/torsion propagation; this does not define or reprove Howard’s abstract H0–H5 theorem.

**Construction/proof.** Use HE3’s propagated rational Kummer conditions and torsion-free local quotient criterion. Twist the alternating Weil pairing by the chosen complex conjugation to obtain Howard’s symmetric pairing. Apply local Tate duality, conjugate-place functoriality and the actual residual G_Q representation.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2`; `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`; `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`; `EulerSystemsAndKolyvaginSystems:ES.5`; `SelmerIwasawaCohomology:L1`; `SelmerIwasawaCohomology:L2/lattice-passage`; `SelmerIwasawaCohomology:L2/finite-condition-lattice-duality`; `SelmerIwasawaCohomology:L1/lattice-pairing-compatibility`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), H.3–H.5 pp.8–9, Theorem1.6.5 proof pp.18–19. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Residual Kummer field and detection pairing

`HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing` — theorem. Prototype: `TauCeti.Heegner.residual_kummer_field_pairing`.

In Gross’s odd-p full residual-image setting let L=K(E[p]). For a finite F_p-subspace S⊂H¹(K,E[p]), let L_S be the fixed field of the intersection of the kernels of the restricted homomorphisms G_L→E[p]. Restriction identifies classes with the equivariant Hom space, and the evaluation pairing gives Gal(L_S/L)≃Hom_Fp(S,E[p]) compatibly with the residual Galois action. The proof uses that the subquotients of the direct sum E[p]^r are sums of this simple module, not general semisimplicity of arbitrary F_p[GL₂(F_p)]-modules.

**Construction/proof.** Use the central homothety subgroup and continuous inflation–restriction to kill H¹/H² over L/K. Take the actual finite Galois extension cut out by a finite basis of S. Use simplicity of E[p] and the nondegenerate evaluation pairing as in Gross9.3.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`; `ArithmeticGaloisDuality:R02.2`; `EulerSystemsAndKolyvaginSystems:ES.1`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §9 pp.250–252, Lemma9.1 and Proposition9.3. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 7. Heegner class detection by auxiliary primes

`HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection` — theorem. Prototype: `TauCeti.Heegner.chebotarev_heegner_class_detection`.

Let M=L_S for a finite Selmer subspace S and let I fix the Kummer field generated by a pth division point of y_K. For τ acting on Gal(M/L), the square (τh)² detects the positive component used by Gross. Chebotarev primes whose Frobenius is the prescribed class of τh are inert auxiliary primes, avoid any specified finite set, and their localizations detect the corresponding evaluation annihilator. To detect a second independent class, use the correctly formed composite and the proved disjointness of its Kummer field.

**Construction/proof.** Apply the actual residual Kummer pairing and Gross9.5–9.6. Invoke upstream Chebotarev on the finite Galois composite, with avoidance of all bad/conductor/coefficient primes. Verify simultaneous conditions and the class-field intersection before the second selection.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing`; `EulerSystemsAndKolyvaginSystems:ES.1`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Propositions9.5–9.6 and Claims10.1/10.3, pp.251–254. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 8. Arithmetic local error lengths

`HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison` — theorem. Prototype: `TauCeti.Heegner.arithmetic_local_error_comparison`.

For the actual Heegner Tate representation, compare ES4’s restriction/invariant/local-condition errors with p-primary local torsion, the p-part of the Néron component group, and the index of the integral finite/ordinary lattice. Record each finite kernel/cokernel as a separate length or annihilator constant. Equality with an error-free theorem requires the relevant quantities to vanish, not just the global residual image hypothesis.

**Construction/proof.** Apply the exact component/Kummer sequence and integral propagation from HE3. Use the actual finite-level restriction/corestriction maps and measure their kernels/cokernels. Identify the constants in the imported ES4 interface without equating distinct local hypotheses.

**Prerequisites.** `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`; `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`; `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`; `EulerSystemsAndKolyvaginSystems:ES.4`; `NeronModelsAndSemistableAbelianVarieties:R11.2`; `NeronModelsAndSemistableAbelianVarieties:R11.2/component-group`; `SelmerIwasawaCohomology:L2/finite-unramified-comparison`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), §1.1 pp.5–8; Gross Proposition6.2 pp.244–247. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 9. Tamagawa and local torsion obstruction examples

`HeegnerPointEulerSystems:HE.5/tamagawa-and-local-torsion-tests` — theorem. Prototype: `TauCeti.Heegner.tamagawa_and_local_torsion_tests`.

For a split Tate curve over a local field of residue characteristic ℓ≠p with parameter q, its component group has order v(q); choose v(q)=p to get a nonzero p-component defect. If the same local field contains μ_p, the Tate uniformization supplies nonzero local E[p] even with a prime-to-p component order (for example v(q)=1). These distinct examples must fail the corresponding error-free local hypotheses. Neither local phenomenon follows or disappears from a global residual-irreducibility label.

**Construction/proof.** Import the local Tate-curve and component-group calculation from EC Layer4. Calculate the p-primary component for q of valuation p. Use μ_p in the multiplicative uniformization for the separate local-torsion example.

**Prerequisites.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`; `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §6.3 pp.228–229, local monodromy/Tamagawa description. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** An integral local-condition comparison must display the nonzero defect in the first case. A residual big-image condition on a global curve is not a substitute for checking the local torsion in the second case.

**Remaining boundary.** Global χ localization and generic Howard ES5 supplier remain explicit gaps; arithmetic hypothesis and error targets are recorded.


## HE.6. Clean rank-one descent and precise index bounds

**Planets:** Howard’s Heegner rank-one theorem; Gross’s clean mod-p descent; Sha square-index bound; Zhang’s Heegner congruence after level raising; Zhang’s Heegner indivisibility theorem; Heegner-system vanishing order.

### 1. Howard’s Heegner rank-one theorem

`HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A` — theorem. Prototype: `TauCeti.Heegner.clean_rank_one_descent_theorem_A`.

Assume E/Q conductor N, imaginary quadratic K discriminant D≠−3,−4 with all N-primes split, p odd, p,D,N pairwise coprime, and full Tate representation G_K→GL₂(Z_p) surjective. If the actual bottom Heegner Kummer class κ_1≠0, the compact Selmer group is free rank one and the discrete Selmer group is Q_p/Z_p⊕M⊕M for a finite Z_p-module M with length M≤length(H¹_F(K,T_pE)/Z_pκ_1). This is Howard TheoremA after the actual arithmetic H0–H5 checks and corrected system construction; the abstract self-dual theorem is ES5’s responsibility.

**Construction/proof.** Use HE5’s actual coefficient/local hypothesis verification and corrected Heegner system. Apply imported ES5 Howard Theorem1.6.1 to the actual family. Identify compact/discrete Selmer carriers with the exact Kummer sequences; keep paired finite summands and the direction of the inequality.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system`; `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2`; `HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5`; `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`; `EulerSystemsAndKolyvaginSystems:ES.5`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), TheoremA pp.1–2, Theorem1.6.5 pp.18–19. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Gross’s clean mod-p descent

`HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent` — theorem. Prototype: `TauCeti.Heegner.gross_clean_mod_p_descent`.

Assume Gross’s classical standing hypotheses and non-CM E, p odd, Q(E[p])/Q has full GL₂(F_p) group, and y_K∉pE(K). Then Sel_p(E/K) is the cyclic F_p-space generated by δ(y_K), rank E(K)=1 and Sha(E/K)[p]=0. This clean theorem requires neither p∤N nor full p-adic surjectivity as an extra hypothesis; do not replace its hypothesis table with Howard’s.

**Construction/proof.** Use the actual Gross local d(n) properties, finite Kummer fields and Chebotarev selection. Prove the two eigenspace conclusions in the following nodes. Apply the finite Kummer exact sequence and Mordell–Weil finite generation.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`; `HeegnerPointEulerSystems:HE.4/bottom-trace-class`; `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`; `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Propositions2.1/2.3 pp.237–238, Claims10.1/10.3 pp.252–254. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. Opposite Selmer eigenspace vanishing

`HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing` — theorem. Prototype: `TauCeti.Heegner.gross_opposite_eigenspace_vanishing`.

Under Gross’s clean mod-p hypotheses, the ε-opposite Selmer eigenspace is zero. Choose a prime using the actual Kummer field M and positive component outside I. Its d(ℓ) is locally nonzero and supported only at λ; global reciprocity forces every Selmer class in that eigenspace to localize to zero. The Kummer-field annihilator calculation then forces the global eigenspace to vanish.

**Construction/proof.** Apply Gross8.1’s local one-dimensional eigenspace pairing, imported from ES1/L1. Use Gross8.2 global annihilation and HE5’s actual field selection. Apply Gross9.5–9.6 to convert all prescribed Frobenius annihilations to zero in the class-detection pairing.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`; `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`; `EulerSystemsAndKolyvaginSystems:ES.1`; `SelmerIwasawaCohomology:L1`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition8.2 pp.249–250; Claim10.1 pp.252–253. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Same Selmer eigenspace generation

`HeegnerPointEulerSystems:HE.6/gross-same-eigenspace-generation` — theorem. Prototype: `TauCeti.Heegner.gross_same_eigenspace_generation`.

Under the same clean hypotheses, the remaining Selmer eigenspace equals F_p·δ(y_K). If a second independent class existed, choose the first auxiliary prime with nonzero local Heegner derivative and form its Kummer extension L′. Prove L′ is disjoint from the Selmer field over L in the relevant character, then choose a second simultaneous Frobenius in the composite. The finite/singular relation and reciprocity force incompatible localizations, so the second class cannot exist.

**Construction/proof.** Use the nonzero bottom Kummer class before selecting the first prime. Use the opposite-character Kummer class and actual field disjointness, not unrestricted linear disjointness. Apply the same field-detection/local-pairing argument in the simultaneous composite.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing`; `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`; `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`; `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Claim10.3 and proof, pp.253–254. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 5. Sha square-index bound

`HeegnerPointEulerSystems:HE.6/sha-square-index-bound` — theorem. Prototype: `TauCeti.Heegner.sha_square_index_bound`.

Under HowardA with non-torsion y_K, the finite p-primary Sha group is the paired finite part of the discrete Selmer group. Thus length_Zp Sha[p∞]≤2·length_Zp(E(K)⊗Z_p/Z_py_K), after proving the exact integral Kummer-lattice identification. Equivalently its order divides the p-part of the square of the corresponding finite index. If a local or parametrization defect is present, insert its proved error term before this comparison.

**Construction/proof.** Use the rank-one theorem and the actual Kummer exact sequence. Identify the divisible Mordell–Weil summand and the paired finite quotient. Multiply the finite-module length by two and translate valuations to divisibility, preserving the inequality direction.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A`; `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`; `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), TheoremA and inequality(1), pp.1–3. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Primitivity and sharpness comparison

`HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero` — theorem. Prototype: `TauCeti.Heegner.primitivity_versus_nonzero`.

A nonzero κ_1 yields an upper bound, not equality. Residual primitivity of the actual corrected system, together with the imported ES5 core/self-duality/local hypotheses, gives the corresponding equality of finite length and corrected index. Scaling the parametrization/system by p preserves non-torsion but increases the leading-class index, so cannot preserve an unsupported sharpness assertion. Zhang’s indivisibility conclusion proves a stronger property only under its enumerated hypotheses.

**Construction/proof.** Apply the exact ES5 primitivity theorem, with its local saturation assumptions. Compare coefficient reduction of the actual corrected system to its primitive leading/core component. Use a p-scaling test on the actual point map.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A`; `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`; `EulerSystemsAndKolyvaginSystems:ES.5`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), TheoremA pp.1–3; Zhang §10 pp.245–246. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 7. Zhang’s Heegner congruence after level raising

`HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence` — theorem. Prototype: `TauCeti.Heegner.zhang_cohomological_congruence`.

Let g,K,p satisfy Zhang’s Notations and Hypothesis♥, with m∈Λ′+ and distinct admissible q₁,q₂∤m. Fix the residual V over k₀, matched optimal embeddings and derivative generators. Then loc_q₁ c(n,m) lies in H¹(K_q₁,k₀) and loc_q₂ c(n,mq₁q₂) in H¹(K_q₂,k₀(1)); under fixed identifications with k₀ the two are equal up to a fixed nonzero scalar. The generic level-raising, definite/indefinite Jacquet–Langlands, multiplicity-one and Ihara statements are imported.

**Construction/proof.** Import Ribet–Diamond–Taylor level raising (Zhang2.1), with exact level Nm and trivial nebentypus. Import residual multiplicity one and the definite eigenfunction; use HE2’s matched reduction/specialization. Compute the finite Kummer map and component-group singular Kummer map via the same eigenfunction, then apply compatible derivatives.

**Prerequisites.** `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`; `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `SerreWeightAndLevelOptimisation:R20.2`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `SerreWeightAndLevelOptimisation:R20.2/level-raising-diamond`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorem4.3 and proof, pp.218–221; Lemma3.3 p.215. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 8. Heegner rank lowering through an admissible prime

`HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering` — theorem. Prototype: `TauCeti.Heegner.zhang_local_conditions_rank_lowering`.

Under Zhang Hypothesis♥, local Selmer conditions for g and its admissible level-raised g′ have k₀-rational structures agreeing away from q. At q they are the finite k₀ line and the singular k₀(1) line respectively. If loc_q on the rational residual Selmer group is nonzero, it is surjective and the raised Selmer group is its kernel, so its dimension decreases by one. Hypothesis♥(3) requires H¹(Q_ℓ,V)=V^GQℓ=0 at ℓ²|N+; for elliptic E and p≥5 the additive-reduction argument verifies this. Do not apply the ℓ≠p Euler characteristic formula at ℓ=p.

**Construction/proof.** Apply the good, toric, additive and coefficient-prime local descriptions separately as in Theorem5.2. Use imported strict/relaxed parity duality to identify the two Selmer groups. Apply the one-dimensional local line to get the exact kernel and dimension drop.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`; `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`; `SelmerIwasawaCohomology:L1`; `EulerSystemsAndKolyvaginSystems:ES.1`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Lemma5.1, Theorem5.2, Proposition5.4, pp.222–225. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** All local places are compared, including p and additive primes. Rank lowering is conditional on nonzero localization; level raising alone does not imply it.

### 9. Auxiliary rank-zero formula over K

`HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K` — theorem. Prototype: `TauCeti.Heegner.zhang_rank_zero_over_K`.

For a weight-two newform g and its GL₂-type A_g/Q with coefficient prime 𝔭|p≥3, K as in Zhang’s Notations, good ordinary p, residual image containing SL₂(F_p), and a residually ramified ℓ||N, L(g/K,1)≠0 iff Sel_𝔭∞(A_g/K) is finite. When finite, v_𝔭(L(g/K,1)/Ω_g^can)=length_O𝔭 Sel_𝔭∞(A_g/K)+Σ_{ℓ|N}t_g(ℓ). This is over A_g/K, not E/Q. Derive it using the separately imported ordinary main-conjecture and Kato divisibilities for g and its quadratic twist, with the GL₂-type control/period comparison.

**Construction/proof.** Apply ModularIwasawaL1 and KatoL4 to both g and g_K under their exact image/ramification hypotheses. Import GL₂-type control and canonical-period product comparison. Combine base/twist Selmer and local factors to obtain the K-base formula; no circular import from BSD6 is permitted.

**Prerequisites.** `ModularIwasawaMainConjectures:L1`; `KatoEulerSystems:L4`; `SelmerIwasawaCohomology:L4`; `GrossZagierAndArithmeticHeights:GZ.0`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorem7.1 and proof, pp.231–232. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** The field K and GL₂-type auxiliary variety are retained in both the statement and supplier request. Ordinariness is used here; it is not introduced into Gross’s clean mod-p theorem.

### 10. Jochnowitz unit criterion

`HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value` — theorem. Prototype: `TauCeti.Heegner.zhang_jochnowitz_special_value`.

For g satisfying Hypothesis♥ and an admissible q, the Heegner bottom class is locally nonzero at q iff L^alg(g′/K,1) is a 𝔭′-adic unit. Here g′ is the chosen raised form, Ω_g′^can=〈g′,g′〉_Pet/η_g′(Nq), ξ_g′ is the norm of the integral primitive definite eigenfunction, η_g′,N+,N−q=η_g′(Nq)/ξ_g′, and L^alg=L/Ω^can·η_ratio⁻¹. Its integrality/unit status is proved by the explicit Waldspurger/Gross formula, not built into a definition.

**Construction/proof.** Import the explicit definite special-value formula from GZ5 with all u_K and discriminant factors. Use matched supersingular reduction and the residual multiplicity-one eigenfunction to compute loc_q c(1). Apply Corollary6.2 and Theorem6.5, allowing only proved p-adic-unit factors.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`; `GrossZagierAndArithmeticHeights:GZ.5`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §6.1–6.4, pp.226–231, Corollary6.2 and Theorem6.5. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 11. Ribet–Takahashi period and Tamagawa comparison

`HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison` — theorem. Prototype: `TauCeti.Heegner.ribet_takahashi_tamagawa_comparison`.

For definite g with N− squarefree of odd length and full Hypothesis♥, v_𝔭(η_g,N+,N−)=Σ_{ℓ|N−}length_O𝔭 Φ(A_g/K_ℓ)_𝔭. In the nonsquarefree case retain a nonempty residually ramified ℓ||N set and either a ramified ℓ||N− or at least two factors ℓ||N+. These are the precise period/Tamagawa conditions used to cancel the auxiliary form’s local terms. For additive split ℓ²|N+, use V^GKℓ=0 and the finite-residue cohomology argument to prove the component-group invariant vanishes; do not infer inertia invariants vanish from decomposition invariants.

**Construction/proof.** Import the GL₂-type modular-degree and congruence-module comparison (Ribet–Takahashi, Khare, Helm/Pollack–Weston). Use the Néron monodromy description of local Tamagawa lengths. In the rank-zero formula cancel only the stated N− factors and verify the other Tamagawa factors are units.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`; `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value`; `RankZeroOneBSD:BSD.5`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorem6.4 and proof, pp.229–230; §7.2 p.233. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Odd N− is required for the definite period formula; even N− belongs to the rank-one curve branch. The p-part over split primes and inert primes is not interchanged.

### 12. Triangular Heegner Selmer basis

`HeegnerPointEulerSystems:HE.6/zhang-triangular-selmer-basis` — theorem. Prototype: `TauCeti.Heegner.zhang_triangular_selmer_basis`.

For a nonzero residual Heegner system κ_g satisfying Zhang Hypothesis♥, let ν=min{ν(n):c(n)≠0}, ε_ν=w_g(−1)^ν+1 and B(κ) its base locus of vanishing localizations away from DKNp. The ε_ν Selmer eigenspace has dimension ν+1 and a triangular basis of ν+1 actual c(n_i), detected at selected 2ν+1 auxiliary primes. The opposite eigenspace has dimension ≤ν. Relaxing at the base locus does not enlarge the first eigenspace and preserves that opposite bound.

**Construction/proof.** Import ES1 simultaneous prime detection and the auxiliary singular-class existence lemma. Inductively choose the primes using the finite/singular relation and same-eigenspace local pairing. Use global reciprocity twice to prove spanning and the relaxed opposite bound; handle ν=0 with empty conductor products.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`; `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`; `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`; `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`; `EulerSystemsAndKolyvaginSystems:ES.1`; `HeegnerPointEulerSystems:HE.6/heegner-vanishing-order`; `HeegnerPointEulerSystems:HE.6/heegner-base-locus`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Lemma8.4 and proof, pp.236–239. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 13. Zhang’s Heegner indivisibility theorem

`HeegnerPointEulerSystems:HE.6/zhang-indivisibility` — theorem. Prototype: `TauCeti.Heegner.zhang_indivisibility`.

Assume E/Q conductor N, K imaginary quadratic with gcd(D_K,N)=1, N− squarefree with even number of prime factors, full residual GL₂(F_p) image, p≥5 good ordinary and p∤D_KN. Hypothesis♠ requires residual ramification at every ℓ||N+ and every ℓ|N− with ℓ≡±1 mod p; if N is nonsquarefree require a nonempty Ram set and either a ramified ℓ||N− or at least two factors ℓ||N+. Then c_1(n)≠0 for some squarefree Kolyvagin conductor n, so M∞=0. For the auxiliary GL₂-type forms use the stronger Hypothesis♥, including the additive-prime local invariant vanishing.

**Construction/proof.** Use Chebotarev to choose one/two admissible primes with nonzero localization. Apply rank lowering and the rank-zero/Jochnowitz/period comparisons for the rank-one base case. Induct by two on Selmer dimension, using the triangular/relaxed base-locus bounds to force a nonzero congruent class; remove the assumed parity by reduction to rank zero and the root-number contradiction. Use the elliptic additive-reduction calculation to pass from ♠ to ♥.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering`; `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`; `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value`; `HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison`; `HeegnerPointEulerSystems:HE.6/zhang-triangular-selmer-basis`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorems1.1,9.1–9.3 and proofs, pp.195,240–243. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 14. Heegner-system vanishing order

`HeegnerPointEulerSystems:HE.6/heegner-vanishing-order` — definition. Prototype: `TauCeti.Heegner.vanishingOrder`.

For the actual residual Heegner family κ={c(n):n∈Λ}, define ν(κ)=min{#prime divisors of n:n∈Λ,c(n)≠0}, valued in ℕ∪{∞}, with ν(0)=∞. The count is of distinct primes in the squarefree conductor, not multiplicity or number of nonzero classes. This is Zhang’s finite-residual support invariant, distinguished from the p-adic divisibility sequence M_r and its M∞.

**Construction/proof.** Specialize the support/vanishing condition to the actual Heegner family, with the declared conductor set Λ. Keep the empty/zero-system value and exclude bad primes exactly as in Zhang8.3. Use the displayed API to state the triangular/relaxed Selmer theorem without unfolding the definition.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `EulerSystemsAndKolyvaginSystems:ES.1`; `mathlib:Nat.primeFactorsList`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Definition8.3, published p.236, PDF46; Lemma8.4 and proof pp.236–239.. The two support definitions are explicitly stated and used in the triangular basis and nonvanishing proofs.

**Use-derived API.**

- Zhang Definition8.3, Lemma8.4, Theorems9.1/9.3, pp.236–243: The induction uses the minimum conductor size and relaxing local conditions at the base locus to prove nonvanishing.

- `TauCeti.Heegner.vanishingOrder` (constructor): The infimum of the distinct-prime count of a conductor n∈Λ with c(n)≠0, with empty infimum ∞.
- `TauCeti.Heegner.vanishingOrder_formula` (characterisation): It is sInf{v:ℕ∞:∃n∈Λ,c(n)≠0 and v=#prime divisors(n)}.
- `TauCeti.Heegner.vanishingOrder_bottom` (simp): If 1∈Λ and c(1)≠0, ν(κ)=0.
- `TauCeti.Heegner.vanishingOrder_support_congr` (extensionality): Families with the same zero/nonzero support on Λ have the same vanishing order.

**Discriminating unit tests.**

- `TauCeti.Heegner.vanishingOrder_empty` (degenerate): The empty conductor-index set has vanishing order ∞.
- `TauCeti.Heegner.vanishingOrder_bottom_nonzero` (compatibility): A nonzero conductor-one class has vanishing order zero.
- `TauCeti.Heegner.vanishingOrder_conductor_six` (computation): A family supported only at squarefree conductor 6 has vanishing order two.

**Acceptance.** Do not replace minimum support size by the greatest conductor size or by the number of nonzero classes. Use only conductors in Λ; arbitrary values of an extension outside Λ must not change the object.

### 15. Heegner-system base locus

`HeegnerPointEulerSystems:HE.6/heegner-base-locus` — definition. Prototype: `TauCeti.Heegner.baseLocus`.

For the actual family and localization maps, B(κ) is the set of primes ℓ∤D_KNp such that loc_ℓc(n)=0 for every n∈Λ. These are arbitrary good primes, not only Kolyvagin primes. The dependent local cohomology carriers may vary with ℓ. This locus determines exactly which local conditions are relaxed in Zhang Lemma8.4.

**Construction/proof.** Specialize the support/vanishing condition to the actual Heegner family, with the declared conductor set Λ. Keep the empty/zero-system value and exclude bad primes exactly as in Zhang8.3. Use the displayed API to state the triangular/relaxed Selmer theorem without unfolding the definition.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `EulerSystemsAndKolyvaginSystems:ES.1`; `mathlib:Nat.primeFactorsList`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Definition8.3, published p.236, PDF46; Lemma8.4 and proof pp.236–239.. The two support definitions are explicitly stated and used in the triangular basis and nonvanishing proofs.

**Use-derived API.**

- Zhang Definition8.3, Lemma8.4, Theorems9.1/9.3, pp.236–243: The induction uses the minimum conductor size and relaxing local conditions at the base locus to prove nonvanishing.

- `TauCeti.Heegner.baseLocus` (constructor): The good primes outside D_KNp with all actual Heegner-class localizations zero.
- `TauCeti.Heegner.baseLocus_mem` (characterisation): ℓ∈B iff ℓ is prime, ℓ∤D_KNp, and every n∈Λ has loc_ℓc(n)=0.
- `TauCeti.Heegner.baseLocus_support_congr` (extensionality): If the localizations of two families agree at every good prime and conductor in Λ, their base loci agree.
- `TauCeti.Heegner.baseLocus_zero` (simp): The zero family has every prime outside D_KNp in its base locus.

**Discriminating unit tests.**

- `TauCeti.Heegner.baseLocus_zero_system` (degenerate): For the zero class family, membership is exactly primality and prime-to-D_KNp.
- `TauCeti.Heegner.baseLocus_nonzero_localization` (non-example): One nonzero localization at a conductor n∈Λ excludes that prime from the locus.
- `TauCeti.Heegner.baseLocus_coefficient_prime` (compatibility): The coefficient prime p is never in the locus; in particular 5 is excluded when p=5 even if all classes vanish.

**Acceptance.** Do not replace minimum support size by the greatest conductor size or by the number of nonzero classes. Use only conductors in Λ; arbitrary values of an extension outside Λ must not change the object.

**Remaining boundary.** ES5 Howard theorem, HE5 χ comparison, generic level raising and GL₂-type rank-zero/degree supplier checks remain open.


## HE.7. Integral classical descent and full Sha finiteness

**Planets:** Prime divisibility of the non-torsion Heegner point; Non-CM open-image application; Almost-all primary Sha vanishing; Arithmetic derivative denominators at exceptional primes; Dyadic integral conjugation descent; Classical full Sha finiteness.

### 1. Prime divisibility of the non-torsion Heegner point

`HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility` — theorem. Prototype: `TauCeti.Heegner.non_torsion_point_prime_divisibility`.

For non-torsion y_K∈E(K), Mordell–Weil finite generation implies y_K∉pE(K) for every prime outside a finite set. This is proved before assuming rank one or a finite Heegner index: project to the free Mordell–Weil quotient and use a nonzero coordinate. Once rank one has been proved, the index of Z·y_K in the free quotient is finite; it is distinct from an index in E(K) that includes rational torsion.

**Construction/proof.** Import Mordell–Weil finite generation. Choose a nonzero free coordinate of y_K and exclude its finite set of prime divisors. After clean descent proves rank one, identify the one-dimensional lattice index without circularly using it earlier.

**Prerequisites.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`; `HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §2 pp.237–238; §1 pp.236–237. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Non-CM open-image application

`HeegnerPointEulerSystems:HE.7/non-cm-open-image-application` — theorem. Prototype: `TauCeti.Heegner.non_cm_open_image_application`.

For non-CM E/Q, import Serre’s open-image theorem to conclude that Q(E[p])/Q has full GL₂(F_p) image for all but finitely many p, and apply it to the actual Heegner setting. More generally obtain the required uniform cohomological restriction/invariant bounds from the open adelic/Tate image over a number field, retaining the cyclotomic determinant and base-field index. For admissible GL₂-type RM quotients import the precise Ribet big-image variant; do not replan either generic theorem in HE.7.

**Construction/proof.** Request the missing general open-image layer under the existing Faltings/R01 owners. For E/Q combine the almost-all residual image with the previous prime-divisibility lemma. For exceptional primes use only the exported finite index/cohomological bounds and their exact field/endomorphism hypotheses.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility`; `FaltingsFinitenessAndIsogenyTheorems:R28.4`; `ArithmeticGaloisRepresentations:R01.4`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §2 p.237; §12 pp.254–256. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. Almost-all primary Sha vanishing

`HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing` — theorem. Prototype: `TauCeti.Heegner.almost_all_primary_sha_vanishing`.

For the classical non-CM non-torsion Heegner setting, outside a finite set of primes the Gross clean theorem gives Sha(E/K)[p]=0. Since Sha is torsion, this implies Sha(E/K)[p∞]=0: any nonzero p-primary element would yield nonzero p-torsion after taking a suitable p-power multiple. This does not require proving finite p-primary groups first.

**Construction/proof.** Combine non-CM almost-all image and point indivisibility with Gross’s clean mod-p theorem. Apply the elementary p-primary torsion argument to the actual Sha carrier. Retain the finite exceptional set containing p=2 and all failures of the clean hypotheses.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`; `HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §2 pp.237–238 and Proposition2.1. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Arithmetic derivative denominators at exceptional primes

`HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators` — theorem. Prototype: `TauCeti.Heegner.bounded_arithmetic_derivative_denominators`.

For the actual classical ring-class tower, prove the bounded-denominator derivative construction at each exceptional p, retaining nonzero restriction/inflation kernels, torsion invariants, unit factors, local component and parametrization/Hodge denominators. Its annihilator constants must be uniform in the finite torsion exponent m. Bound the bad-reduction and fixed parametrization contributions by a fixed nonzero integer, rather than increasing an unexplained denominator with m. ES3/4 supplies the general error-tolerant construction; HE.7 must supply these arithmetic bounds.

**Construction/proof.** Instantiate the imported error-tolerant derivative/descent interface on the actual tower. Use the fixed Tate-image index and actual local torsion/component bounds. Clear the fixed CM-unit and parametrization/Hodge denominators and prove the resulting bound is independent of m.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/differentiated-point-invariance`; `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`; `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`; `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison`; `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`; `EulerSystemsAndKolyvaginSystems:ES.3`; `EulerSystemsAndKolyvaginSystems:ES.4`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Theorem1.3 pp.236–237 (quoted Kolyvagin theorem; proof not supplied). The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** This is a required proof target, not a theorem proved by the read clean-case exposition. Every arithmetic constant must be explicit enough to verify uniformity in m.

### 5. Dyadic integral conjugation descent

`HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent` — theorem. Prototype: `TauCeti.Heegner.dyadic_integral_conjugation_descent`.

At p=2 in the actual Heegner setting, use restriction/corestriction, integral 1±τ maps and real-place Tate cohomology to bound the invariant and local-condition errors uniformly in m. Keep the kernels/cokernels of the integral maps; do not split the Z₂ module by (1±τ)/2. Combine these bounds with the actual bounded-denominator derivative classes and the general ES4 descent engine.

**Construction/proof.** Import the real/Tate comparison and the exact integral transfer maps. Use 1±τ without division and quantify their 2-primary kernel/cokernel. Apply ES4 only after the uniform arithmetic constants have been proved.

**Prerequisites.** `HeegnerPointEulerSystems:HE.3/archimedean-tate-correction`; `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`; `EulerSystemsAndKolyvaginSystems:ES.4`; `ArithmeticGaloisDuality:R02.4`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Theorem1.3 pp.236–237; its proof not given here. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** The read sources do not establish this dyadic argument; the acquisition gap is binding. Odd-prime eigenspace proofs cannot be transferred by changing a parameter to 2.

### 6. CM character descent and error bounds

`HeegnerPointEulerSystems:HE.7/cm-character-error-descent` — theorem. Prototype: `TauCeti.Heegner.cm_character_error_descent`.

For CM E in the exact classical modular Heegner setting, pass to a base containing the CM field and use the imported CM character/Tate decomposition to prove the actual restriction, local and derivative error bounds uniformly in m. Descend back with the explicit base-extension degree and real/dyadic corrections. The non-CM GL₂-image theorem cannot be applied to this branch.

**Construction/proof.** Import CM character realizations and their local decomposition from CM4. Construct Heegner arithmetic finite-level classes with the retained errors, using ES4’s engine. Prove the actual uniform constants and then use restriction/corestriction for the descent back.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`; `EulerSystemsAndKolyvaginSystems:ES.4`; `ComplexMultiplicationAndExplicitReciprocity:CM.4`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Theorem1.3 pp.236–237 (full statement quoted); §2 p.237 restricts subsequent proof to non-CM. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** No CM all-prime proof is claimed from Gross’s non-CM clean-case argument. Acquiring Rubin/Kolyvagin CM passages is required before these constants are verified.

### 7. Exceptional primary Sha exponent bound

`HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound` — theorem. Prototype: `TauCeti.Heegner.exceptional_primary_sha_bound`.

For each remaining exceptional p, after proving its uniform arithmetic error constants, apply ES4 to obtain a fixed bound p^b annihilating Sha(E/K)[p∞], with b depending on the finite Heegner index and proved arithmetic constants. The finite p^b-Selmer group then contains the p-primary Sha quotient and proves it finite. Uniformity in m is required before passing to p∞; separate finiteness of each Sha[p^m] is insufficient.

**Construction/proof.** Use the actual nonzero bounded-denominator Heegner class in the generic error-tolerant descent inequality. Choose a bound independent of m and pass through the exact finite/p∞ Kummer sequences. Apply finiteness of the fixed finite-level Selmer group at the resulting exponent.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`; `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`; `HeegnerPointEulerSystems:HE.7/cm-character-error-descent`; `EulerSystemsAndKolyvaginSystems:ES.4`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Theorem1.3 pp.236–237 (quoted theorem; exceptional-prime proof unavailable). The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** The bound is conditional on the unverified arithmetic error targets, never an assumption silently inserted into the final theorem.

### 8. Classical full Sha finiteness

`HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness` — theorem. Prototype: `TauCeti.Heegner.classical_full_sha_finiteness`.

In Gross’s stated classical modular Heegner setting, if y_K has infinite order, rank E(K)=1 and the entire Sha(E/K) is finite. In the formulation Gross quotes, its order divides t_E/K·I_K², where the positive integer t_E/K has prime factors only 2 and odd exceptional residual-image primes. Do not assign an explicit value to t from the clean theorem. To prove full finiteness combine almost-all p-primary vanishing with finite exceptional p-primary groups and the torsion-primary decomposition; finiteness at one or every separately considered prime is not enough.

**Construction/proof.** Prove rank one from one available clean prime using Mordell–Weil finite generation and non-CM image, or the separately verified CM branch. Combine the almost-all vanishing and each uniform exceptional exponent/finite Selmer bound. Use the torsion-primary decomposition to identify Sha with a finite sum of finite groups. The square-index constant bound remains a source/proof acquisition target beyond the scanned exposition.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`; `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`; `HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Theorem1.3 pp.236–237. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 9. Admissible RM Kolyvagin–Logachev application

`HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev` — theorem. Prototype: `TauCeti.Heegner.admissible_rm_kolyvagin_logachev`.

Let A/Q be a simple admissible RM quotient of J₀(N), End_Q(A)⊗Q totally real of degree dim A=d, with the specified Heegner modular quotient and analytic rank d. The appropriate higher Gross–Zagier height nonvanishing and Kolyvagin–Logachev descent give rank A(K)=d and finite entire Sha(A/K), under the exact arithmetic/local hypotheses of that theorem. Quaternionic/RM variants require the named field, level, integral quotient and Hecke compatibility and a source that establishes that extension; no unrestricted statement for all abelian varieties over all totally real fields is intended.

**Construction/proof.** Import the general GL₂-type residual/open-image supplier and the height nonvanishing from GZ8. Apply the actual RM Heegner derivative/error construction over the specified coefficient order. Read the original Kolyvagin–Logachev proof and validate the quaternionic extension before specializing it.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`; `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`; `EulerSystemsAndKolyvaginSystems:ES.4`; `GrossZagierAndArithmeticHeights:GZ.8`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §12 pp.254–256 (quoted Kolyvagin result). The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Only Gross’s quoted admissible J₀(N)/Q result was verified; its proof and a broader quaternionic extension were not.

**Remaining boundary.** General Serre/Ribet supplier and exceptional/dyadic/CM/RM source acquisition remain open; all-prime target and finite-primary combination are explicitly planned.

## Cross-roadmap requests

Each request names the precise remaining supplier statement. Existing finer nodes are imported wherever their statement covers the need; the packet imports 21 such prerequisite occurrences. Supplier packets that are partial are planned inputs, not implemented declarations.

- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`** — Full local/global order carriers, proper invertible fractional ideal/idele comparison, order Picard extension exact sequence, unit indices, lattice trace duals and admissible ideal norm maps; instantiate existing Pic, never introduce another Picard group. Consumers: `HeegnerPointEulerSystems:HE.0/local-toral-order`, `HeegnerPointEulerSystems:HE.0/transported-global-order`, `HeegnerPointEulerSystems:HE.0/idele-ideal-class-comparison`, `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`, `HeegnerPointEulerSystems:HE.0/local-different-discriminant`.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`** — Ring-class existence in a fixed separable closure, Artin isomorphism for the order-unit quotient, conductor tower restriction/norm compatibility and local splitting/inertia description. An Artin map for an already given extension does not supply this. Consumers: `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `HeegnerPointEulerSystems:HE.0/dihedral-conjugation`, `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`** — Relative CM class fields for O_F+C O_K and quaternionic admissible open levels, with actual norm and tower maps. Consumers: `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`.
- **`HilbertModularVarietiesAndShimuraCurves:H4`** — Quaternionic admissible level subgroups for the specified CM embedding and Eichler order. Consumers: `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`.
- **`ComplexMultiplicationAndExplicitReciprocity:CM.1`** — CM elliptic curve from proper invertible ideal, cyclic isogeny from the specified invertible level ideal, and ideal action on the pair. Consumers: `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`.
- **`ComplexMultiplicationAndExplicitReciprocity:CM.2`** — Main CM reciprocity on level-structured elliptic pairs, with arithmetic/geometric reciprocity convention comparison. Consumers: `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`.
- **`ShimuraVarieties:V5`** — Canonical model and CM reciprocity descent for these quaternionic level points; not merely a complex double coset. Consumers: `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`, `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`.
- **`HilbertModularVarietiesAndShimuraCurves:H5`** — Local optimal-embedding conditions for the order and Eichler level, including ramified quaternion places and a fixed archimedean CM type. Consumers: `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`.
- **`HilbertModularVarietiesAndShimuraCurves:H4`** — Optimal-order embedding/local level conditions for the relative CM quaternionic curve. Consumers: `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`.
- **`ModularCurvesPartII:R14.1`** — Existing X₀(N) cyclic-isogeny moduli object and complex/rational comparison for the specified integral level. Consumers: `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`.
- **`GrossZagierAndArithmeticHeights:GZ.3`** — Only normalized rational Hodge class, denominator clearing, modular quotient and degree comparison; not the Gross–Zagier height formula. Consumers: `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`.
- **`EllipticCurveModularity:R29.5`** — Defined modular quotient and Hecke/Fricke equivariance, including integral differential and Manin constant normalization. Consumers: `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`.
- **`EllipticCurveModularity:R29.5`** — Hecke eigenquotient transport of the actual divisor identities, with torsion basepoint terms and degree normalization. Consumers: `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`.
- **`HilbertModularVarietiesAndShimuraCurves:H5`** — Local lattice interpretation, P-new quotient and good/semistable quaternionic models with matched CM embeddings. Consumers: `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`, `HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution`, `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`.
- **`NeronModelsAndSemistableAbelianVarieties:R11.2`** — Integral specialization of the fixed modular quotient, connected-part unramified H¹ vanishing, component sequence and exact Kummer defect. Consumers: `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence`, `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`.
- **`NeronModelsAndSemistableAbelianVarieties:R11.6`** — Quaternionic semistable integral model and specialization to the correct reduction-graph vertex, with Frobenius/Atkin–Lehner actions. Consumers: `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`.
- **`tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`** — Elliptic finite/p-adic Kummer maps, naturality with restriction/corestriction, continuous Tate-module coefficients, exact Selmer/Sha sequences and integral local comparison. Consumers: `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `HeegnerPointEulerSystems:HE.3/good-place-kummer-unramified`, `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`, `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`, `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`.
- **`SelmerIwasawaCohomology:L0`** — Continuous inverse-limit cohomology with compact T_pE, finite discrete reductions, lim¹/invariants and saturated integral-to-rational comparison. Consumers: `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`.
- **`SelmerIwasawaCohomology:L1`** — Local good-reduction Kummer/unramified comparison and Weil/Tate self-duality. Consumers: `HeegnerPointEulerSystems:HE.3/good-place-kummer-unramified`.
- **`SelmerIwasawaCohomology:L2`** — Precise ordinary-versus-finite integral local conditions and local-torsion defects. Consumers: `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`.
- **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`** — Good-reduction crystalline/Bloch–Kato Kummer comparison at v|p and integral lattice compatibility; finite-flat group definitions or a Hodge–Tate decomposition alone do not supply this. Use the Breuil–Kisin/integral comparison owner. Consumers: `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`.
- **`ArithmeticGaloisDuality:R02.4`** — Real-place Tate local conditions for E[p^m] and integral dyadic comparison. Consumers: `HeegnerPointEulerSystems:HE.3/archimedean-tate-correction`.
- **`EulerSystemsAndKolyvaginSystems:ES.3`** — Existing cyclic derivative, product identities, intrinsic cyclic tensor coefficients, choice transformation and descent/error interface. Do not replan these generic constructions here. Consumers: `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`, `HeegnerPointEulerSystems:HE.4/differentiated-point-invariance`, `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`, `HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence`, `HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility`, `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`.
- **`ArithmeticGaloisRepresentations:R01.4`** — Residual representation and image subgroup operations for the elliptic torsion/dihedral quotient argument. Consumers: `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`.
- **`EulerSystemsAndKolyvaginSystems:ES.2`** — Indexing-family and coefficient-change maps for the conductor presentation, with the Heegner normalization dictionary. Consumers: `HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility`.
- **`EulerSystemsAndKolyvaginSystems:ES.1`** — Generic finite/singular and transverse carriers, cyclic tensor factor, simultaneous prime selection and localization detection for the actual Heegner finite fields. Consumers: `HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition`, `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`, `HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing`, `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`.
- **`EulerSystemsAndKolyvaginSystems:ES.5`** — Missing generic Howard self-dual DVR package H0–H5, Proposition1.5.9 and Theorem1.6.1. Its current title “primitivity” is not a sufficient contract; the application verifies H0–H5 here, and imports the general theorem there (RT-AREA-iwasawa-1/10). Consumers: `HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5`.
- **`EulerSystemsAndKolyvaginSystems:ES.3`** — Strong-system correction interface and cyclic tensor target; the Howard arithmetic χ action is verified in this packet. Consumers: `HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system`.
- **`ArithmeticGaloisDuality:R02.2`** — Continuous change-of-group/conjugation and central-scalar vanishing for the actual T_pE residual representation; finite Kummer field restriction and evaluation. Consumers: `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2`, `HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing`.
- **`SelmerIwasawaCohomology:L1`** — Exact local duality/orthogonality and conjugate-place transport of the twisted Weil pairing. Consumers: `HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5`.
- **`tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`** — Existing elliptic torsion, Weil pairing and integral Tate module with Galois action; Heegner never owns their general definition. Consumers: `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2`.
- **`tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`** — Tate uniformization, local torsion and component order v(q) for the stated local examples. Consumers: `HeegnerPointEulerSystems:HE.5/tamagawa-and-local-torsion-tests`.
- **`EulerSystemsAndKolyvaginSystems:ES.4`** — Distinct restriction/invariant/local error constants with an exact finite-level descent inequality, allowing nonzero defects. Consumers: `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison`.
- **`NeronModelsAndSemistableAbelianVarieties:R11.2`** — Integral component-group/Kummer error comparison for the actual Heegner points and local torsion. Consumers: `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison`.
- **`tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`** — Qualitative Chebotarev with positive-density conjugacy class and exclusion of a finite prime set for Gross’s actual finite Kummer composites. Consumers: `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`.
- **`EulerSystemsAndKolyvaginSystems:ES.5`** — General Howard self-dual DVR rank-one bound with H0–H5 and exact discrete paired-module conclusion, distinct from MR primitivity equality. Consumers: `HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A`, `HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero`.
- **`EulerSystemsAndKolyvaginSystems:ES.1`** — Local one-dimensional eigenspace pairings, strict/relaxed rank comparison, simultaneous prime detection and auxiliary singular-class existence as used in Gross/Zhang. Consumers: `HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing`, `HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering`, `HeegnerPointEulerSystems:HE.6/zhang-triangular-selmer-basis`.
- **`SelmerIwasawaCohomology:L1`** — Local Tate/global reciprocity for Gross eigenspaces and full-place duality/parity comparison for Zhang’s rank-lowering. Consumers: `HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing`, `HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering`.
- **`SerreWeightAndLevelOptimisation:R20.2`** — Extend the existing level-raising-diamond criterion to Zhang2.1 Ribet/Diamond–Taylor exact-level raising N→Nq with all original local inertia types retained, trivial nebentypus and the prescribed admissible-prime Steinberg type. Import the existing criterion; it alone does not guarantee exact Nq or preservation of local types. Consumers: `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`.
- **`GL2AutomorphicRepresentationsAndTransfer:R17.3`** — Definite and indefinite Jacquet–Langlands transfer, integral residual multiplicity one (Helm), Ihara and the matching eigenfunction/Kummer congruence; R17.5 Langlands–Tunnell is not the supplier. Consumers: `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`, `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value`.
- **`ModularIwasawaMainConjectures:L1`** — Ordinary main-conjecture/rank-zero formula for GL₂-type A_g and its quadratic twist over Q, sufficient to derive Zhang7.1 over K; retain image containing SL₂(F_p), good ordinary p and a residually ramified ℓ||N. Consumers: `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`.
- **`KatoEulerSystems:L4`** — Opposite rank-zero divisibility/nonvanishing for the same g and g_K with coefficient prime 𝔭 and GL₂-type representation, feeding Zhang7.1 over K. Consumers: `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`.
- **`SelmerIwasawaCohomology:L4`** — GL₂-type ordinary control and comparison of Selmer lengths over K with g/g_K; verify the variant used in Zhang7.1 rather than importing an E/Q-only BSD endpoint. Consumers: `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`.
- **`GrossZagierAndArithmeticHeights:GZ.0`** — Canonical period as product of ± periods up to a proved 𝔭-adic unit, and normalization of the quadratic-base rank-zero special value. Consumers: `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`.
- **`GrossZagierAndArithmeticHeights:GZ.5`** — Explicit definite Waldspurger/Gross special-value formula with primitive integral eigenfunction, u_K, discriminant, Petersson and congruence-period factors (Zhang6.1–6.2). Consumers: `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value`.
- **`RankZeroOneBSD:BSD.5`** — Ribet–Takahashi/Khare/Helm/Pollack–Weston congruence-period and GL₂-type modular-degree comparison under full Hypothesis♥, as in Zhang6.4. Confirm the exact nonsquarefree scope before use. Consumers: `HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison`.
- **`tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`** — Mordell–Weil finite generation and the free quotient of E(K), before using a finite rank-one Heegner index. Consumers: `HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility`.
- **`FaltingsFinitenessAndIsogenyTheorems:R28.4`** — Missing Serre open-image theorem for non-CM elliptic curves over number fields and exact Ribet GL₂-type big-image variant, with adelic index/determinant and uniform cohomological consequences. Confirmed RT-AREA-iwasawa-1/9 proposes a new R28.7, extending R28.4/R01.4; the Tate isogeny theorem alone is not this supplier. Consumers: `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`.
- **`ArithmeticGaloisRepresentations:R01.4`** — Residual/Tate image and determinant comparison required to apply the requested Serre/Ribet theorem to the actual Heegner representation. Consumers: `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`.
- **`EulerSystemsAndKolyvaginSystems:ES.3`** — Error-tolerant derivative/descent construction retaining invariants and bounded denominator input; arithmetic uniformity is verified by HE.7. Consumers: `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`.
- **`EulerSystemsAndKolyvaginSystems:ES.4`** — General classical all-prime/CM/dyadic error-tolerant bound from proved uniform arithmetic constants and a nonzero class; no universal arithmetic boundedness assumption. Consumers: `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`, `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`, `HeegnerPointEulerSystems:HE.7/cm-character-error-descent`, `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`, `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`.
- **`ArithmeticGaloisDuality:R02.4`** — Dyadic real/Tate correction and integral 1±τ, restriction/corestriction kernels with explicit exponents. Consumers: `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`.
- **`ComplexMultiplicationAndExplicitReciprocity:CM.4`** — CM elliptic Tate characters and local decomposition over the CM base, with exact finite base extension/descent constants. Consumers: `HeegnerPointEulerSystems:HE.7/cm-character-error-descent`.
- **`tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`** — Finite finite-level Selmer groups and the actual torsion-primary Sha carrier/decomposition and Kummer quotient. Consumers: `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`, `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`, `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`.
- **`GrossZagierAndArithmeticHeights:GZ.8`** — Only the actual admissible RM height/nonvanishing theorem in Gross§12’s specified modular setting. Consumers: `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`.

## Source findings

### HeegnerPointEulerSystems/E1 — error

Published Lemma5.1(1), pp.222–223; PDF32–33, version of record.

Printed: For any prime ℓ, we have H¹(Q_ℓ,V)=0 ⇐⇒ V^Gal_ℓ=0.

Correction: Require ℓ≠p in part(1) and in the displayed dim H¹=2 dim H⁰ formula. At ℓ=p the local Euler characteristic contributes dim_Fp V (with the coefficient-field scaling), and the vanishing equivalence is false.

Reason: The proof itself says “Since ℓ≠p”. For a self-dual two-dimensional residual module over Q_p, local Euler–Poincaré and Tate duality give dim_k H¹=2 dim_k H⁰+2. Thus H⁰=0 gives dimension two, not zero. The rank-lowering application uses the lemma only at additive primes ℓ²|N+, all different from p; its argument is unaffected.

Reach: a stated result. Existing correction: new.

### HeegnerPointEulerSystems/E2 — error

Published Lemma6.3 proof, p.228; PDF38 rendered and read, version of record.

Printed: Under the hypothesis V^Gal_ℓ=0, we deduce that A[p]^I_ℓ=0.

Correction: Decomposition invariants do not force inertia invariants to vanish. For the application at split additive primes, use V^G_Kℓ=0 and the finite-residue cohomology exact sequence: the connected subgroup’s Frobenius invariants vanish, hence so do its coinvariants/H¹, giving vanishing of the component-group invariants.

Reason: As a local diagnostic, the unramified quadratic twist of a Tate curve over Q_7 with parameter of valuation five has mod-five inertia trivial and Frobenius eigenvalues −1,−7, neither equal to one. Therefore V^G_Q7=0 but V^I7=V≠0. Over the unramified quadratic extension its I_5 component group is constant of order five. The intended application in §7.2 is at split additive places, where the repaired G_Kℓ/finite-residue argument applies. No claim that this local diagnostic by itself is a globally constructed newform satisfying all standing hypotheses is made.

Reach: the proof. Existing correction: new.

### HeegnerPointEulerSystems/E3 — misprint

Published Definition2.4(2) and Remark2.5, p.166; PDF22.

Printed: D∞ = 1

Correction: The stated Euclidean area-squared definition gives D∞=π² for the unit disc. Either retain π² or explicitly normalize by π².

Reason: The area of the closed Euclidean unit disc is π. Its squared area is π². The local-different/discriminant comparison in this packet retains the stated normalization rather than silently replacing it.

Reach: nothing. Existing correction: PAPER-KHAYUTIN-19/E7, confirmed by REV-PAPER-KHAYUTIN-19 in the existing extraction..

### HeegnerPointEulerSystems/E4 — misprint

Published Remark2.7 p.167 and class-group action p.165; PDF21/23.

Printed: g_v O_v g_v⁻¹ ∩ T̃(Q_v)

Correction: Use g_v O_v× g_v⁻¹ ∩ T̃(Q_v) for the unit stabilizer; use the covering torus T̃ in the associated finite adelic quotient, with S={∞}.

Reason: The printed intersection contains the scalar prime but not its inverse, so is only a monoid. Its unit subgroup is the compact open stabilizer required for the ideal-class quotient.

Reach: nothing. Existing correction: PAPER-KHAYUTIN-19/E8, confirmed by REV-PAPER-KHAYUTIN-19 in the existing extraction..

## Restructuring and link proposals

These proposals await the maintainer. No atlas, supplier packet or link map was edited.

- RT-AREA-iwasawa-1/2, extended exact-contract audit: the existing R20.2/level-raising-diamond criterion is weaker than the prescribed-local-type Diamond–Taylor theorem used by Zhang2.1. Retain/import that criterion. Add a general admissible-prime level-raising stage adjacent to R20.2, supplying exact raised level, local Steinberg/inertia and nebentypus control for definite/indefinite applications. This packet requests the extension via current R20.2; it does not modify that roadmap.
- RT-AREA-iwasawa-1/9: neither the Tate isogeny theorem nor Heegner-specific error verification owns the general Serre/Ribet image theorem. Add Faltings R28.7 after R28.6 for Serre open image over number fields and the precise Ribet GL₂-type variant, extending R28.4/R01.4. HE.7 owns only application to uniform Heegner error constants; requests use existing owner stages until the new stage is accepted.
- RT-AREA-iwasawa-1/10: the generic Howard H0–H5 self-dual DVR argument is not a Heegner arithmetic theorem. Expand ES.5 to own Howard Proposition1.5.9/Theorem1.6.1 and the generic paired-summand bound. HE.5–HE.6 verify H0–H5 for the actual Tate module and apply it. Put the generic Λ statement Theorem2.2.10 in ES.8; propose ES.5→GrossZagierAndArithmeticHeights:GZ.5, ES.8→GrossZagierAndArithmeticHeights:GZ.5 and HE.6→HE.8 links for maintainer review. No Λ or HE.8 target is planned in this part.
- RT-AREA-iwasawa-1/8: R17.5 Langlands–Tunnell is the wrong Zhang supplier; BSD.6 would be circular and over the wrong base/variety. Use R17.3 Jacquet–Langlands, ModularIwasawaMainConjectures:L1, KatoEulerSystems:L4, GZ.5 and the exact GL₂-type rank-zero/degree contracts in this packet. Remove the HE.6→R17.5 requirement when the maintainer applies the link changes; no atlas or link-map file is edited here.

## Explicit gaps and follow-up

### HE.0 general order and class-field suppliers remain planned

Accepted RS-04 forbids rebuilding generic orders, Picard groups or the general CM/class-field correspondence here. GN11/CFT12/CFT13 must export typed order and field constructions. All positive baseline declarations below were read at the exact pins; no Heegner, Kolyvagin, ringClassField or optimalEmbedding declaration was found in either complete source tree.

Needed by: `HeegnerPointEulerSystems:HE.0/local-toral-order`, `HeegnerPointEulerSystems:HE.0/transported-global-order`, `HeegnerPointEulerSystems:HE.0/idele-ideal-class-comparison`, `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `HeegnerPointEulerSystems:HE.0/dihedral-conjugation`, `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`, `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`, `HeegnerPointEulerSystems:HE.0/local-different-discriminant`.

### HE.1 geometric prototype contract

The suggested conductorPoint takes supplied CM-point values and the specified modular map as unbundled data. It cannot yet type the CM moduli object, Hodge denominator, canonical-model rationality and modular degree at these pins. These are omitted mathematical conditions, recorded explicitly, not Prop-valued placeholder fields. The packet keeps the complete mathematical statement; supplier construction is required before a production signature.

Needed by: `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`.

### HE.2 global recurrence normalization

The local divisor recurrences are source-verified. A complete chosen modular conductor-chain comparison must determine the central scaling of the second predecessor, global-unit stabilizer and integral Hodge/torsion terms before exporting a scalar repeated-conductor equation on P_c. That comparison is an explicit node target, not an assumed equality.

Needed by: `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence`, `HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence`, `HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution`.

### HE.4 typed continuous-cohomology prototype

The descent signature uses a supplied additive restriction equivalence C≃+I and invariant Kummer class z. C and I must eventually be the actual continuous Galois-cohomology objects with the right coefficient topology. Those supplier/carrier conditions are omitted in the prototype and named here; no algebraic group-cohomology substitute or fake cohomology carrier is introduced.

Needed by: `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`.

### HE.5 global χ localization comparison

Howard’s local χ_ℓ is not automatically a G_K-equivariant coefficient map. The intended global construction must use the G_Q change-of-group action. From F²−a_ℓF+ℓ=0, a_ℓ−(ℓ+1)F=−ℓ(F²−1)F⁻¹; compare this with the local Kummer identification, yielding the normalized involution modulo I_ℓ. The complete integral identification and localization square have not been established here. Retain this exact gap rather than postcompose cocycles with a non-equivariant matrix or accuse the source of an erratum.

Needed by: `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`, `HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system`.

### Missing generic level-raising stage

Confirmed RT-AREA-iwasawa-1/2 is applied as an exact-contract extension. The current packet does contain R20.2/level-raising-diamond, and it is imported here. That weight-range Frobenius criterion supplies a raised form whose level is divisible by q, but not Zhang2.1’s exact Nq form preserving all original local inertia types with trivial nebentypus. Request that stronger Diamond–Taylor variant and propose its distinct owner stage; never claim all level raising is absent.

Needed by: `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`, `HeegnerPointEulerSystems:HE.6/zhang-indivisibility`.

### Zhang auxiliary rank-zero and degree supplier scope

The quoted extension from elliptic to GL₂-type ordinary control and the nonsquarefree degree comparison are source-verified proof dependencies, not proofs supplied by this packet. ModularIwasawaL1/KatoL4/SelmerL4 and BSD5 must certify their exact coefficient/base/ramification scope. BSD6 cannot be imported: it consumes HE.6 and would give a cycle/wrong E/Q statement.

Needed by: `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`, `HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison`, `HeegnerPointEulerSystems:HE.6/zhang-indivisibility`.

### Missing general Serre/Ribet open-image layer

Confirmed RT-AREA-iwasawa-1/9: the current R28.4 Tate-isogeny and R01.4 representation layers do not supply Serre’s non-CM open-image or Ribet’s GL₂-type theorem. Propose R28.7 after R28.6 and retain this open request rather than re-proving the generic theorem in HE.7.

Needed by: `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`, `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`, `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`, `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`.

### HE.7 all-prime, dyadic and CM source/proof acquisition

Gross Theorem1.3 and §12 quote the full Kolyvagin/Kolyvagin–Logachev conclusions but prove only the subsequent non-CM clean odd-prime case. The actual exceptional-prime/dyadic/CM uniform-denominator proof and explicit t_E/K are not established by the sources read. Acquire original Kolyvagin and Kolyvagin–Logachev papers, Rubin’s CM theorem passages and the precise quaternionic/RM extension. Their mathematical targets are recorded, with acceptance boundaries, rather than claimed sourced proofs.

Needed by: `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`, `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`, `HeegnerPointEulerSystems:HE.7/cm-character-error-descent`, `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`, `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`, `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`.

### HE.0 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Needed by: `HeegnerPointEulerSystems:HE.0/local-toral-order`, `HeegnerPointEulerSystems:HE.0/transported-global-order`, `HeegnerPointEulerSystems:HE.0/idele-ideal-class-comparison`, `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `HeegnerPointEulerSystems:HE.0/dihedral-conjugation`, `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`, `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`, `HeegnerPointEulerSystems:HE.0/local-different-discriminant`.

### HE.1 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Needed by: `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`, `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`, `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`, `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`.

### HE.2 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Needed by: `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`, `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`, `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence`, `HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence`, `HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution`, `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence`, `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`.

### HE.3 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Needed by: `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `HeegnerPointEulerSystems:HE.3/good-place-kummer-unramified`, `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`, `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`, `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`, `HeegnerPointEulerSystems:HE.3/archimedean-tate-correction`.

### HE.4 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Needed by: `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`, `HeegnerPointEulerSystems:HE.4/differentiated-point-invariance`, `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`, `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`, `HeegnerPointEulerSystems:HE.4/explicit-cocycle-divisibility`, `HeegnerPointEulerSystems:HE.4/bottom-trace-class`, `HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence`, `HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility`, `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`.

### HE.5 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Needed by: `HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition`, `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`, `HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system`, `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2`, `HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5`, `HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing`, `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`, `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison`, `HeegnerPointEulerSystems:HE.5/tamagawa-and-local-torsion-tests`.

### HE.6 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Needed by: `HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A`, `HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent`, `HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing`, `HeegnerPointEulerSystems:HE.6/gross-same-eigenspace-generation`, `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`, `HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero`, `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`, `HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering`, `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`, `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value`, `HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison`, `HeegnerPointEulerSystems:HE.6/zhang-triangular-selmer-basis`, `HeegnerPointEulerSystems:HE.6/zhang-indivisibility`, `HeegnerPointEulerSystems:HE.6/heegner-vanishing-order`, `HeegnerPointEulerSystems:HE.6/heegner-base-locus`.

### HE.7 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Needed by: `HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility`, `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`, `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`, `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`, `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`, `HeegnerPointEulerSystems:HE.7/cm-character-error-descent`, `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`, `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`, `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`.

The finite-level target pass is finished below the 300-node budget. Follow-up should resolve the HE.5 global χ comparison, certify the stronger supplier contracts, acquire the original exceptional/dyadic/CM and RM proofs, and replace the explicitly omitted prototype conditions with the genuine upstream interfaces. HE.8/HE.8b/HE.8c and Castella’s Eisenstein/anticyclotomic material belong to later parts; no declarations for them were added here.
