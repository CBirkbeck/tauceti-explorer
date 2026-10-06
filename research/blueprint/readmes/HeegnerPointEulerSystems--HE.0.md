# Heegner-point Euler systems and arithmetic descent: HE.0–HE.7

This finite-level part plans all eight stages in 78 declarations. Every stage is **planned**, with 21 precise gaps and 63 supplier requests. It is a complete target-level planning pass, with no claim that the stages are closed or implemented. All declaration IDs are unchanged, and ten source corrections are recorded.

The definitive packet is [HeegnerPointEulerSystems--HE.0.json](../packets/HeegnerPointEulerSystems--HE.0.json); the suggested signatures are [HeegnerPointEulerSystems--HE.0.lean](../suggested/HeegnerPointEulerSystems--HE.0.lean). Six definitions/constructions have 24 API items and eighteen unit tests. The 43 planets stay within six per stage.

## Conventions and ownership

Fix the actual quadratic order, class fields in a separable closure, CM embedding, level orientation and modular quotient. The conductor-c point P_c over K[c] differs from the bottom trace y_K=Tr_K[1]/K P₁. The classical Gross/Howard setup has D_K≠−3,−4 and every N-prime split. Every Jacobian map retains its cusp or rational Hodge class, fixed integral denominator, quotient degree and Manin normalization. The full finite index [E(K):Zy_K] includes torsion; the index in the free Mordell–Weil quotient is a different quantity.

Use arithmetic Artin Frobenius in the class-field dictionary. Invert the geometric reciprocity convention of Cornut–Vatsal and Nekovář explicitly. The reduction morphism on the special fibre is separately named. A ring-class field need not be a CM field. For the imaginary quadratic tower, complex conjugation acts by inversion on its abelian Galois group.

Accepted RS-04 assigns general orders, proper invertible ideals and Picard/idele comparison to GlobalNumberFields Layer11; class-field existence/reciprocity to ClassFieldTheory Layers12–13; general CM/canonical models to CM.1–CM.2 and ShimuraVarieties; elliptic torsion, Kummer, Selmer and Sha to EllipticCurves. HE imports their actual objects. ES.1/ES.3 own generic local comparison/derivatives; ES.4 owns reusable integral pairing and error-tolerant descent; ES.5 owns Howard’s generic self-dual DVR theorem, which HE cites by declaration id. HE verifies their arithmetic input.

Howard uses odd p, pairwise coprime p,D_K,N and full G_K Tate-image surjectivity. Gross’s clean mod-p theorem uses odd p, full residual image and y_K∉pE(K), without an extra good-p assumption. Nonzero, non-torsion and primitive are different. Zhang’s auxiliary theorem concerns A_g/K and its residual representation over k₀, not an E/Q-only theorem.

For Zhang write N=N⁺N⁻, with N⁻ squarefree; the indefinite Heegner setup has even ν(N⁻), whereas the definite period comparison has odd ν(N⁻). Under ♥, Ram(ρ) contains every ℓ||N⁺ and every q|N⁻ with q≡±1 modp. If N is nonsquarefree it is nonempty, and either contains an ℓ||N⁻ or there are at least two ℓ||N⁺. At ℓ²|N⁺, ♥ also imposes H¹(Q_ℓ,V)=V^G_Qℓ=0. The Euler-characteristic equivalence needs ℓ≠p. For the elliptic ♠ branch the additive local check supplies this extra clause. Kolyvagin primes Λ and Bertolini–Darmon admissible primes Λ′ have different conditions and must not be interchanged.

## Integral CM-point descent

The all-prime route is the trivial-character specialization of Nekovář’s Theorem3.2, with the complete integral proof in §§5–7. Work over totally real F, a quaternion algebra B split at exactly one real place, central-quotient curve N_U*, a simple Hecke-linear quotient A with End_F(A)=O_L and [L:Q]=dim A, and a totally imaginary quadratic K/F admitting the chosen embedding into B. The finite ramification set has parity [F:Q]−1, and each ramified prime is inert or ramified in K. Use the integral cusp/Hodge map m[P]−mδ. Trace the chosen CM point to y∈A(K); require y non-torsion and no CM acquired over K. These conditions replace unspecified “admissibility”. Geometric CM is allowed when its endomorphisms are not defined over K.

For each coefficient prime 𝔭, choose sufficiently large principal powers 𝔭^M, a cofinal sequence. The constants are C₀, the divisibility of y modulo torsion; C₁, an annihilator of the geometric component-group defects over K(x); C₂, the homothety/Sah restriction-kernel bound; C₃, the integral matrix-algebra/evaluation defect; and C₆, the polarization degree valuation. C₅=v_𝔭[H:K]=0 here, since H=K for the trivial character. The explicit finite cocycle provides the lift without requiring torsion-invariant vanishing. Every constant is fixed before varying M or conductor.

The actual reciprocal two-prime argument gives the uniform annihilator 2²¹𝔭^(2C₀+2C₁+4C₂+4C₃+C₆) of Sel(A/K,𝔭^M)/O_𝔭κ₁. At2 use integral 1±ρ; there are no half-projectors. Archimedean K-places are complex and have zero local H¹; comparison to real F-places retains the Tate correction killed by2. Uniformity makes every primary Sha group finite, while the constants vanish for almost all coefficient primes. Torsion-primary decomposition then gives the entire finite Sha group. The exponent bound is separate from the stronger classical square-index cardinality theorem.

For CM E/Q let M be its CM field. The induced CM-character conductor formula gives |D_M| dividing N, so a ramified M-prime dividing N rules out M=K under the classical splitting hypothesis. Over KM compare the conjugate characters; recombine them over K. The global explicit-cocycle descent stays over K, where condition(?) holds. It must not be moved to KM, where CM is defined. The generic conductor, homothety and endomorphism statements remain exact CM/R01/R28 supplier contracts.

## Baseline and prototype contract

Mathlib is pinned to `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti to `f790474821cf4256814db967cb154e7af3d0c369`. Positive baseline declarations were read at the pins. The reviewed library audit and both source trees distinguish existing algebra from the missing arithmetic objects. General orders, dihedral algebra, Picard functoriality, p-adic ideal valuation and elliptic points are used through their existing APIs.

- **mathlib:Subring.comap** — Preimage subring along a ring homomorphism; lines175–184, statement read at the exact pin. (`Mathlib/Algebra/Ring/Subring/Basic.lean`).
- **mathlib:ClassGroup.equivPic** — ClassGroup R ≃* CommRing.Pic R for any commutative domain R; lines876–879, not restricted to Dedekind domains. (`Mathlib/RingTheory/PicardGroup.lean`).
- **mathlib:CommRing.Pic.mapRingHom** — Pic R →* Pic S for f:R→+*S between commutative semirings, lines575–603 including identity and composition laws. (`Mathlib/RingTheory/PicardGroup.lean`).
- **mathlib:PadicInt** — The bounded subtype of Q_p defining Z_p under Fact p.Prime, lines56–67. This definition alone does not supply DVR ideal/valuation theorems; cite the two separately checked declarations below for HE.4. (`Mathlib/NumberTheory/Padics/PadicIntegers.lean`).
- **mathlib:WeierstrassCurve.Affine.Point** — Nonsingular points with infinity, lines477–481; AddCommGroup over a field with DecidableEq, lines803–812; actual statement/context read. (`Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean`).
- **mathlib:Module.length** — Module length in ℕ∞ for a ring, additive group and module, lines27–33; used by the actual inequality prototypes. (`Mathlib/RingTheory/Length.lean`).
- **mathlib:Nat.primeFactorsList** — The sorted list of prime factors with multiplicity; lines38–48 read at the pin. Taking toFinset/card counts distinct conductor primes. (`Mathlib/Data/Nat/Factors.lean`).
- **mathlib:PadicInt.ideal_eq_span_pow_p** — For a nonzero ideal s of Z_p, there exists n with s=span{p^n}; s≠⊥ is essential. Lines533–535 read at the exact pin. (`Mathlib/NumberTheory/Padics/PadicIntegers.lean`).
- **mathlib:PadicInt.mem_span_pow_iff_le_valuation** — For x≠0, x∈span{p^n} iff n≤x.valuation; the zero case must be handled separately. Lines460–461 read at the exact pin. (`Mathlib/NumberTheory/Padics/PadicIntegers.lean`).
- **mathlib:DihedralGroup.sr_mul_r** — Existing dihedral rotation/reflection algebra, statement and Group/ZMod context read at the exact Mathlib pin, lines100–101. Used only to transport a cyclic quotient of the arithmetic conjugation action. (`Mathlib/GroupTheory/SpecificGroups/Dihedral.lean`).
- **mathlib:DihedralGroup.sr_mul_sr** — Existing dihedral rotation/reflection algebra, statement and Group/ZMod context read at the exact Mathlib pin, lines104–105. Used only to transport a cyclic quotient of the arithmetic conjugation action. (`Mathlib/GroupTheory/SpecificGroups/Dihedral.lean`).
- **mathlib:DihedralGroup.inv_r** — Existing dihedral rotation/reflection algebra, statement and Group/ZMod context read at the exact Mathlib pin, lines108–109. Used only to transport a cyclic quotient of the arithmetic conjugation action. (`Mathlib/GroupTheory/SpecificGroups/Dihedral.lean`).
- **mathlib:DihedralGroup.inv_sr** — Existing dihedral rotation/reflection algebra, statement and Group/ZMod context read at the exact Mathlib pin, lines112–113. Used only to transport a cyclic quotient of the arithmetic conjugation action. (`Mathlib/GroupTheory/SpecificGroups/Dihedral.lean`).

The suggested file names every declaration, prints its complete mathematical target and supplies an admitted signature. Arithmetic field/level, geometric object, topology and source hypotheses that cannot yet be typed are explicitly omitted under protocol §13. They are never replaced by opaque objects or fabricated proposition fields. Elaboration checks these signatures; it does not verify the omitted conditions or prove the arithmetic. The dihedral signature transports existing cyclic dihedral algebra, and the indivisibility signature types the final nonzero auxiliary-localization transport. Their full arithmetic statements and proof routes remain below.

Tau Ceti’s continuous-cohomology source interfaces were inspected at the source pin. The shared build supplies exact pinned Mathlib; this file imports Mathlib only and claims no Tau Ceti olean compilation. Generic modules and additive homomorphisms are supplied interface data, with explicit carrier-identification gaps. A production signature must replace these omissions with the genuine supplier objects.

## Sources and reading boundaries

### Benedict H. Gross: Kolyvagin’s work on modular elliptic curves

L-functions and Arithmetic, LMS Lecture Note Series 153 (1991), pp.235–256; scanned published article. [Public text](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf). SHA-256 `60b310c58a3494860c5967a03569a7d30033e9074d9d3d9a0d5bc2dfedd46b32`; receipt date 2026-10-05.

All printed pp.235–256, read visually from all twelve scanned PDF pages; §§1–12 including every proof.

### Benjamin Howard: The Heegner point Kolyvagin system

arXiv:1202.6340v1, 28 February 2012; original article Compositio Math.140 (2004),1439–1472. [Public text](https://arxiv.org/pdf/1202.6340). SHA-256 `d2d06e851d6aa1fdc33a932b69b5c06a8c56dc2d9e05fb10d97c0358d6d6ea9a`; receipt date 2026-10-05.

PDF pp.1–21 in full, Introduction and §§1.1–1.7 including H.0–H.5, all the finite-level proof chain and actual Heegner construction. Chapter 2 is outside this part and was not read in this job.

### Benjamin Howard: The Heegner point Kolyvagin system

Compositio Math.140 (2004),1439–1472, version of record. [Public text](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf). SHA-256 `cde2c4891d94b7053cb6d197203a8812ab6e452058ff829ff27fa96396cdde80`; receipt date 2026-10-05.

PDF p.20, printed p.1458, finite/singular correction and Theorem 1.7.5. No claim to have read the rest of this version.

### Ilya Khayutin: Joint equidistribution of CM points

Annals of Mathematics189 (2019),145–276, version of record. [Public text](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf). SHA-256 `f22691429c27058fabd47fe12c6a901e7feffffad7a0c52e1a936da645166d6f`; receipt date 2026-10-05.

Printed pp.159–160 (§2.3 local toral orders/discriminants),164–167 (§2.4.3–2.4.4 idele/ideal and Picard descriptions),182–186 (§5.1 coordinates and local different, Lemma 5.8). Other sections were not read.

### Christophe Cornut; Vinayak Vatsal: Nontriviality of Rankin–Selberg L-functions and CM points

Author preprint, 1 April 2005; published LMS Lecture Notes320 (2007),121–186. [Public text](https://personal.math.ubc.ca/~vatsal/research/part1.pdf). SHA-256 `bdf258c742a88ce4328dcf3ef1df0dfe1235f1640c06bd66eeaaef2c1c6625e1`; receipt date 2026-10-05.

PDF pp.1–4 (relative ring-class characters),19–35 in full (§2 relative CM towers and §3 curve/Hodge/CM setup),60–67 (Appendix6 distribution relations through Lemma6.14). The nonvanishing arguments in §§4–5 and the final Appendix6.5 have not been read.

### Wei Zhang: Selmer groups and the indivisibility of Heegner points

Cambridge Journal of Mathematics2(2) (2014),191–253, version of record. [Public text](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf). SHA-256 `698eb8a6d2297684c683c4c3f43a195cac1d8752ef0c8362ab90c74f5b3792ec`; receipt date 2026-10-05.

Printed pp.191–249 (PDF1–59) in full: introduction, §§2–11 and acknowledgements; every level-raising, geometric/cohomological congruence, rank-lowering, special-value, triangulation and nonvanishing proof. Bibliography beyond its opening was not read.

### Jan Nekovář: The Euler system method for CM points on Shimura curves

Author preprint, 23 May 2007, 53 PDF pages; published in L-functions and Galois representations, LMS Lecture Note Series 320 (2007), pp.471–547, DOI10.1017/CBO9780511721267.014. [Public text](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf). SHA-256 `05c8debf4783f4604afe71a0b4367554ac62d52a6a462daa5e2e8c2ed6bfd26a`; receipt date 2026-10-06.

Introduction pp.1–2; §1.19 pp.14–15; §§3–7 pp.18–51, including the explicit cocycles, component errors, integral image/evaluation bounds, both prime selections and the complete quadratic-character proof §7.5. Section7.6 was also read, but its nonquadratic-character extension is outside this part. Geometry in §§1–2 is imported; no whole-paper read claim.

### Robert Pollack; Tom Weston: On anticyclotomic μ-invariants of modular forms

arXiv:math/0610694v1, 23 October 2006; locators use preprint pagination. [Public text](https://arxiv.org/pdf/math/0610694v1). SHA-256 `42962ab1de00924170e7cc02f95a0ebb967ec979a76823298014eb8511243d04`; receipt date 2026-10-06.

Introduction pp.1–3, conditionCR and §§6.2–6.5 pp.18–21 (Theorem6.8 is in §6.5): localized character groups, monodromy/component presentation, degrees, definite pairing and squarefree congruence-period identity. No claim that this preprint proves Zhang’s nonsquarefree extension.

### V. A. Kolyvagin: On the structure of Shafarevich–Tate groups

Algebraic Geometry, Lecture Notes in Mathematics1479 (1991), pp.94–121; scanned published article. [Public text](https://www.wstein.org/papers/bib/kolyvagin-structure_of_sha.pdf). SHA-256 `ab9126cb2e0147753ca3f1a354f591b516b84f48c5b0882b9a55e87a60edefc9`; receipt date 2026-10-06.

Introduction pp.94–97, especially TheoremA on p.95, which quotes the uniform classical square-index theorem from Euler Systems. The quoted result is distinguished from the proof in that earlier paper; no whole-paper read claim.

### Christopher Skinner: Multiplicative reduction and the cyclotomic main conjecture for GL₂

arXiv:1407.1093v1, 4 July 2014; published Pacific J. Math.283 (2016),171–200; locators use the arXiv pagination. [Public text](https://arxiv.org/pdf/1407.1093v1). SHA-256 `02d176d8fd52b0159eecb448f4bea89bd29bdf73f3095a686d52ad96c0a9b988`; receipt date 2026-10-06.

Introduction pp.1–3 (Theorems A, B and C, footnote1, and the paragraph on Zhang’s paper), §2.5 pp.15–16 (Theorem2.5.2 and the discussion of hypothesis (*) after it) and the opening of §3.2 pp.20–21 (the reduction of TheoremB to TheoremA). The rest of the paper, and the published version, were not read.

### Murilo Zanarella: On Howard’s main conjecture and the Heegner point Kolyvagin system

arXiv:1908.09197v1, 24 August 2019; locators use the arXiv pagination. [Public text](https://arxiv.org/pdf/1908.09197v1). SHA-256 `00d91f8d73880174f410ac4be2a43f89867421c0ab7bfafdba1b837111df312f`; receipt date 2026-10-06.

Hypotheses (H.0)–(H.5) in §2.1 p.11 and §2.3 pp.19–20: Definition2.3.2, Proposition2.3.3, Remark2.3.5 and Theorem2.3.6 with its proof. The lemmas of §2.2 on which that proof rests were not read, nor was the rest of the paper.

Original reading and independent-review receipts are retained in the packet. The revision rechecked the relevant passages, rather than claiming that all source reading was first done in this session. The published Howard byte receipt differs from the independently retrieved publisher PDF; its correction passage and bibliographic identity match. Nekovář’s archived author preprint has 53 pages; every locator to it uses that pagination, not the 77-page published chapter. The original author URL timed out; the archive serves the verified author PDF.

Gross states the classical all-prime/RM endpoints and proves the non-CM clean mod-p case. Nekovář supplies the explicit integral proof used here, including dyadic and geometric-CM cases under condition(?). Pollack–Weston supplies the squarefree period calculation; Zhang6.4 identifies its precise nonsquarefree extension. The original Kolyvagin Euler Systems cardinality proof is not claimed read: the public Springer endpoint supplied a purchase page. Its exact generic size export is a recorded gap, separate from the proved integral finiteness route.

Skinner’s paper was read in its arXiv version: the introduction, §2.5 and the opening of §3.2. It supplies the rank-zero formula over Q for a weight-two newform with coefficients O (TheoremB), for p≥3, under residual irreducibility and a prime q||N at which the residual representation is ramified, and the remark that the main conjecture behind it needs no image containing SL₂(Z_p). Zhang’s Theorem7.1 is used here through those statements. Zanarella’s paper was read only for Theorem2.3.6, the equality case of Howard’s bound.

## Stage targets

| Stage | Declarations | API/tests | Planets | Coverage |
| --- | ---: | ---: | ---: | --- |
| HE.0 | 9 | 0/0 | 6 | planned |
| HE.1 | 6 | 4/3 | 5 | planned |
| HE.2 | 7 | 0/0 | 5 | planned |
| HE.3 | 6 | 0/0 | 3 | planned |
| HE.4 | 9 | 8/6 | 6 | planned |
| HE.5 | 9 | 4/3 | 6 | planned |
| HE.6 | 19 | 8/6 | 6 | planned |
| HE.7 | 13 | 0/0 | 6 | planned |

## HE.0. Quadratic orders, ring class fields and reciprocity

**Planets:** Local toral order; Toral packet and ideal-class comparison; Conductor-change kernel; Ring-class tower and finite Galois quotients; Dihedral action on the tower; Relative CM conductor tower.

### 1. Local toral order

`HeegnerPointEulerSystems:HE.0/local-toral-order` — theorem. Suggested name: `TauCeti.Heegner.local_toral_order`.

For a specified embedding ι:E_v↪B_v of a quadratic étale Q_v-algebra, a maximal Z_v-order O_v⊂B_v and g_v∈B_v×, the Heegner local order is ι⁻¹(g_v O_v g_v⁻¹). It is a full Z_v-order of the form Z_v+f_v O_{E_v}, is stable under quadratic conjugation, and is maximal away from finitely many places for a rational embedding and restricted adelic g.

**Construction/proof.**

1. Use Subring.comap on the conjugate order; import the integral order carrier from GN11.
2. A basis (1,α) identifies any full local order by its second-coordinate ideal.
3. Extend a rational integral basis in B and exclude denominators/conductors to get maximality at almost all v.

**Prerequisites.** `mathlib:Subring.comap`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.

**Source.** [Ilya Khayutin](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), §2.4.4, Definition2.1 and Proposition2.2 p.165; Lemma2.3 p.166. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Include the split quadratic étale algebra; field-only types are insufficient. The global order is the intersection of all the transported local orders, and need not equal E∩O.

### 2. Transported global order

`HeegnerPointEulerSystems:HE.0/transported-global-order` — comparison. Suggested name: `TauCeti.Heegner.transported_global_order`.

For a rational quadratic embedding E↪B and a restricted adelic g, Λ=E∩∏_v Λ_v is a finite-index Z-order in O_E, with Λ⊗Z_v≃Λ_v. Its Picard group is the existing CommRing.Pic Λ, equivalently ClassGroup Λ; only invertible proper fractional ideals occur.

**Construction/proof.**

1. Clear the finitely many local denominators, then use lattice intersection/localization from GN11.
2. Apply the pinned ClassGroup.equivPic for the domain Λ; no Dedekind hypothesis is required.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/local-toral-order`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`; `mathlib:ClassGroup.equivPic`.

**Source.** [Ilya Khayutin](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), §2.4.4, Definition2.6 p.166 and its following paragraph p.167. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. Toral packet and ideal-class comparison

`HeegnerPointEulerSystems:HE.0/idele-ideal-class-comparison` — theorem. Suggested name: `TauCeti.Heegner.idele_ideal_class_comparison`.

For the imaginary quadratic transported order Λ, map a finite invertible idele t to the locally principal fractional ideal E∩t∏_v Λ_v. This induces the ordinary finite idele-class quotient the left quotient of A_E,f× by E× and the right quotient by Λ̂×≃Pic Λ and the S={∞} toral packet quotient C_S≃Pic Λ. The torus covering E×→E×/Q× is used explicitly; kernel triviality uses the class number one of Q.

**Construction/proof.**

1. Import the GN11 idele–invertible-ideal equivalence and specialize to the transported order.
2. Separate the covering torus from the quotient torus; divide by Q-ideles and use principal Q-ideals.
3. A noninvertible adele maps to the adjoined zero in the extended construction; it is not an invertible ideal.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/transported-global-order`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.

**Source.** [Ilya Khayutin](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), §2.4.3 p.165; §2.4.4, Remark2.7 and Definition2.8 p.167 (unit-stabilizer correction E4). The finite idele quotient and invertible proper ideal carrier yield Pic(Λ); E4 corrects the printed unit stabilizer.

**Acceptance.** Restricted, not unrestricted, products are required. Unit stabilizers are Λ_v×, not Λ_v as a multiplicative monoid.

### 4. Conductor-change kernel

`HeegnerPointEulerSystems:HE.0/conductor-change-kernel` — theorem. Suggested name: `TauCeti.Heegner.conductor_change_kernel`.

Let K/Q be imaginary quadratic, c≥1 and ℓ prime. Extension of invertible ideals gives Pic(O_cℓ)→Pic(O_c), surjectively. If ℓ∤c, its kernel is (O_c/ℓO_c)×/((Z/ℓZ)×·image(O_c×)); thus u_c,ℓ·#ker=ℓ−χ_K(ℓ), where u_c,ℓ=[O_c×:O_cℓ×]. If ℓ|c, u_c,ℓ·#ker=ℓ. χ takes −1,0,1 in inert, ramified, split cases. Every quotient and map is induced by the actual inclusions of orders.

**Construction/proof.**

1. Import order Picard functoriality (GN11 and pinned mapRingHom).
2. Use the local unit quotient O_c,v×/O_cℓ,v×; identify the global-unit kernel.
3. Compute residue field, dual-number and split-product units; divide only after proving the unit index divides the local quotient cardinal.

**Prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`; `mathlib:CommRing.Pic.mapRingHom`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §2.3 p.24 (successive local unit quotient); Appendix6.1 pp.61–63 (quadratic local orders). Cornut–Vatsal supplies the local conductor quotients and global unit stabilization. The first-step quadratic kernel formula is derived from the requested GN11 order-Picard exact sequence; it is not a quoted numbered theorem here.

**Acceptance.** For Q(i), c=1, inert ℓ=3: u=2 and degree=2, not 4. For Q(√−3), c=1, inert ℓ=5: u=3 and degree=2, not 6. At repeated conductor primes the local quotient has cardinal ℓ, not ℓ+1.

### 5. Ring-class tower and finite Galois quotients

`HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients` — theorem. Suggested name: `TauCeti.Heegner.ring_class_tower_quotients`.

Using the ring-class existence theorem imported from CFT13, realize every K[c] in a fixed separable closure of K. For c|d, O_d⊂O_c gives K[c]⊂K[d] and restriction Gal(K[d]/K)→Gal(K[c]/K), compatible under composition and with ideal extension under Artin. Its kernel is Gal(K[d]/K[c]), and [K[cℓ]:K[c]] equals the kernel cardinal computed in conductor-change-kernel. Splitting of a prime away from the conductor is equivalent to its invertible ideal class being trivial; K[c]/K is unramified outside c and the exact local ramification is supplied by local unit reciprocity.

**Construction/proof.**

1. Import existence and canonical Artin isomorphisms, not merely an Artin map for a given field.
2. Convert order-unit inclusion to inclusion of class fields by the Galois correspondence.
3. Identify quotient restrictions, degrees and decomposition/inertia groups under reciprocity.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §3 pp.238–240; Cornut–Vatsal §2 pp.20–23 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Dihedral action on the tower

`HeegnerPointEulerSystems:HE.0/dihedral-conjugation` — theorem. Suggested name: `TauCeti.Heegner.dihedral_conjugation`.

For imaginary quadratic K/Q, K[c]/Q is Galois and a chosen complex conjugation τ satisfies τστ⁻¹=σ⁻¹ for σ∈Gal(K[c]/K). The conjugation is attached to an archimedean embedding and compatible throughout the tower. Do not equip a general ring class field with IsCMField: it need not be a CM field.

**Construction/proof.**

1. The ideal class of the conjugate invertible ideal is the inverse, since their product is a rational principal ideal.
2. Transport this identity through the imported Artin isomorphism and extend τ from the fixed separable closure.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `mathlib:DihedralGroup.sr_mul_r`; `mathlib:DihedralGroup.sr_mul_sr`; `mathlib:DihedralGroup.inv_r`; `mathlib:DihedralGroup.inv_sr`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §3, printed p.238 (conjugation action); Lemma4.3 proof p.242 (dihedral quotient). The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** A nontrivial class group of exponent exceeding two gives a nonabelian dihedral extension over Q; no canonical CM-field involution is assumed.

### 7. Relative CM conductor tower

`HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower` — theorem. Suggested name: `TauCeti.Heegner.relative_cm_conductor_tower`.

Let F be totally real, K/F totally imaginary quadratic and P a finite prime of F of residue characteristic p. The imported orders O_Pn=O_F+PⁿO_K and class fields K[Pⁿ] have a compatible Galois inverse limit G∞. The finite idele/unit quotient realizes this limit; G∞ has finite torsion subgroup G0 and G∞/G0≃Z_p^[F_P:Q_p]. For sufficiently large n, [K[Pⁿ⁺¹]:K[Pⁿ]]=N(P), with the finite initial global-unit indices retained. The admissible level subgroup is the intersection with the specified quaternionic level, not an arbitrary replacement.

**Construction/proof.**

1. Import general orders GN11 and relative class-field existence CFT12.
2. Use compact inverse limits and stabilization of global units to kill lim¹ in Cornut–Vatsal Lemma2.1.
3. Compute higher local quotients with the dual numbers and apply the actual Artin quotient maps.

**Prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; `HilbertModularVarietiesAndShimuraCurves:R18.1`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §2 pp.20–23, Lemmas2.1–2.9; §1.1 p.4 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 8. Norm, reciprocity and level compatibility

`HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility` — theorem. Suggested name: `TauCeti.Heegner.norm_reciprocity_level_compatibility`.

For the relative CM towers and an inclusion of admissible finite-level subgroups, field restriction, finite idele quotient projection and order ideal extension commute under Artin. For a finite extension of CM bases, field norm and ideal norm agree with the imported functorial Artin map on the relevant finite quotient. Cornut–Vatsal uses geometric Frobenius: the arithmetic-Frobenius version in this packet inverts the reciprocity/Frobenius arguments before using any pointwise identity.

**Construction/proof.**

1. Apply the CFT norm/restriction square to the actual level-unit subgroup.
2. Prove subgroup containment before descending a norm map; no norm map on the wrong order Picard group is assumed.
3. Apply the inverse convention comparison from GZ0 to every CM Galois-action formula.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §1.7 p.19, §2.1 pp.20–21, §3.8 p.35 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 9. Different of the local toral order

`HeegnerPointEulerSystems:HE.0/local-different-discriminant` — theorem. Suggested name: `TauCeti.Heegner.local_different_discriminant`.

For the local quadratic étale order Λ_v, define its trace dual Λ_v∨={a∈E_v:Tr(aΛ_v)⊆Z_v} using the imported lattice/trace pairing. Its inverse different is a principal invertible fractional Λ_v-ideal; the different is its inverse. The ideal norm (equivalently the absolute local discriminant valuation) agrees with the order discriminant. This does not identify the signed field norm of a generator with a positive discriminant; in a split conductor-π order a generator (π,−π) has norm −π².

**Construction/proof.**

1. Use a local integral basis (1,α), invert the trace matrix, and exhibit a generator of the dual.
2. Multiply by the conjugate linear-factor difference and check the ideal norm/discriminant valuation.
3. Retain the nonmaximal-order input: the maximal number-field different alone is insufficient.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/local-toral-order`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.

**Source.** [Ilya Khayutin](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), §5.2, Definition5.7 and Lemma5.8, printed p.184; normalization corrected in E5. The trace-dual and principal-invertible assertions are the source statements. The discriminant comparison is an ideal norm/valuation equality; the printed exact field-norm equality requires E5.

**Acceptance.** Check split, inert and ramified quadratic étale inputs, including residue characteristic two. Keep archimedean Euclidean-area discriminant π² or explicitly renormalize it; source finding PAPER-KHAYUTIN-19/E7 applies.

**Remaining supplier/refinement work.** Supplier order/relative class-field realizations and typed geometry are open requests; source-backed arithmetic target pass is recorded.


## HE.1. CM points and compatible modular parametrizations

**Planets:** CM cyclic-isogeny pair; Optimal embeddings and quaternionic CM points; CM descent to the canonical tower; Jacobian basepoint and Hodge denominators; Heegner point family.

### 1. CM cyclic-isogeny pair

`HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair` — theorem. Suggested name: `TauCeti.Heegner.cm_cyclic_isogeny_pair`.

Assume K imaginary quadratic of discriminant different from −3,−4, N≥1 with every prime dividing N split, c prime to N, and an invertible O_c-ideal 𝔑_c with O_c/𝔑_c≃Z/NZ. For a proper invertible fractional ideal a, the pair C/a→C/(𝔑_c⁻¹a) is cyclic of degree N and gives the corresponding existing X₀(N) moduli point. The endomorphism ring is O_c; replacing a by αa gives the same level pair. Changing 𝔑 or its orientation is an explicitly recorded Galois/Fricke action, not literal equality.

**Construction/proof.**

1. Use the imported CM elliptic curve and ideal-action theory, with the existing modular moduli interpretation.
2. Check the kernel 𝔑_c⁻¹a/a and its cyclic order N before applying the X₀(N) constructor.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`; `ComplexMultiplicationAndExplicitReciprocity:CM.1`; `ModularCurvesPartII:R14.1`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §3, printed p.238 (the order and cyclic N-isogeny defining x_n). The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Optimal embeddings and quaternionic CM points

`HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points` — theorem. Suggested name: `TauCeti.Heegner.optimal_embedding_cm_points`.

For F totally real, K/F CM, B ramified at all but one real place and specified finite places, and Eichler order R, an optimal embedding O_C↪R is an F-algebra embedding K↪B satisfying K∩R=O_C. K splits B iff K_v is a field at every ramified finite place (and the archimedean embedding condition holds). The CM double-coset description K×\B̂×/R̂× with a specified archimedean CM type identifies the complex CM points, with local optimal-embedding conditions required by the chosen Eichler level. It has not yet asserted rationality.

**Construction/proof.**

1. Use R18.1 for the specified quaternionic curve, field, level and uniformization; request its local optimal-order embedding criterion explicitly. H4/H5 Hilbert-level comparisons do not supply a quaternionic embedding theorem.
2. Use Skolem–Noether and the selected fixed point h_K; compare the canonical Shimura complex uniformization.
3. Check split primes at Γ₀ level and nonsplit ramified primes separately.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`; `HilbertModularVarietiesAndShimuraCurves:R18.1`; `HilbertModularVarietiesAndShimuraCurves:R18.4`; `ShimuraVarieties:V5`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §3.8 pp.34–35; Zhang §3.2 pp.205–206 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. CM descent to the canonical tower

`HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent` — theorem. Suggested name: `TauCeti.Heegner.canonical_model_cm_descent`.

For the CM level points above, the imported main CM theorem/canonical model reciprocity shows x_C∈X(K[C]) in the actual HE.0 tower. Its stabilizer is K× times the intersection of the finite torus with the chosen level; σ=rec_K(t) acts by x(g)↦x(t^εg) in Cornut–Vatsal’s geometric convention. Convert to arithmetic reciprocity with the inverse convention before comparison. The statement concerns the cyclic-isogeny pair or optimal embedding, not only j(E).

**Construction/proof.**

1. Apply CM1/CM2 for the modular pair and V5 for the quaternionic canonical model.
2. Identify the precise level stabilizer with the HE.0 order-unit subgroup.
3. Use fixed-field descent to produce an actual rational point, then compare all tower transition maps.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`; `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`; `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`; `ComplexMultiplicationAndExplicitReciprocity:CM.2`; `ShimuraVarieties:V5`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §3.8 p.35; Howard §1.7 p.19 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Jacobian basepoint and Hodge denominators

`HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators` — theorem. Suggested name: `TauCeti.Heegner.jacobian_basepoint_denominators`.

For X₀(N) use the rational cusp ∞ to form [x−∞]. For a compact quaternionic curve use the imported normalized rational Hodge class ξ=(K_X+B_X)/deg(K_X+B_X), componentwise of degree one; x↦[x−ξ] lies in J⊗Q. Choose a nonzero integer d clearing the denominators to obtain the integral class [d x−d ξ]. Do not erase d. For an auxiliary ℓ₀, (ℓ₀+1−Tℓ₀)x is degree zero; after quotienting by an eigenform g, division by ℓ₀+1−aℓ₀ is valid integrally at p only if it is a p-adic unit.

**Construction/proof.**

1. Import ξ and Jacobian/Picard geometry from GZ3.
2. Apply degree and Hecke-eigenclass identities to x−ξ, retaining the divisor coefficient denominator.
3. Compare the cusp, Hodge and auxiliary-Hecke construction after rationalization; keep any integral torsion discrepancy.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`; `GrossZagierAndArithmeticHeights:GZ.3`; `EllipticCurveModularity:R29.5`; `ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §3.5 pp.29–32; Zhang Remark6 pp.205–206 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 5. Heegner point family

`HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation` — construction. Suggested name: `TauCeti.Heegner.conductorPoint`.

Fix the descended CM family x_c, the level orientation, the integral cusp or d-cleared Hodge construction, and an actual fixed modular quotient φ:J→A defined over the base. Define P_c=φ([d x_c−d ξ])∈A(K[c]); the modular cusp branch has d=1. Keep deg φ and any Manin constant as data. Define y_K=Tr_{K[1]/K}P_1 separately: P_1 is generally not K-rational. In Lean the supplier geometry is an explicitly missing condition on the supplied CM points and map, not an invented CM-point carrier.

**Construction/proof.**

1. Compose the actual CM-point map with the Jacobian and quotient maps.
2. Use canonical descent and functoriality to prove the field of definition.
3. Specialize to the classical cusp construction used by Gross and Howard.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`; `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`; `EllipticCurveModularity:R29.5`; `EllipticCurveModularity:R29.5/modular-parametrisation`; `ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi`.

**Uses.**

- Gross Proposition3.7 — The chosen P_c are the terms in the norm and reduction identities.
- Howard Lemmas1.7.1–1.7.3 — Differentiated points and local Kummer conditions use this actual family.
- Gross §1 p.236 — The trace, quotient and Manin constant control the index.

**API.**

- `TauCeti.Heegner.conductorPoint` (constructor): For a specified descended CM family x and the fixed integral Jacobian/modular map φ, conductorPoint φ x c=φ(x_c).
- `TauCeti.Heegner.conductorPoint_apply` (simp): Evaluation is the composite φ(x_c), with the d-cleared Jacobian class included in φ.
- `TauCeti.Heegner.conductorPoint_postcompose` (functoriality): Postcomposing φ by a defined homomorphism f carries each point to f(P_c).
- `TauCeti.Heegner.conductorPoint_galois` (compatibility): For a Galois-equivariant φ and action on the descended CM family, conductorPoint commutes with that action.

**Unit tests.**

- `TauCeti.Heegner.conductorPoint_cusp` (compatibility): For the classical cusp map, conductorPoint is φ([x_c−∞]); no Hodge denominator occurs.
- `TauCeti.Heegner.conductorPoint_zero_quotient` (degenerate): A zero quotient map yields the zero point at every conductor.
- `TauCeti.Heegner.conductorPoint_trace_not_basepoint` (non-example): For the two-element group acting on ℤ by negation, the selected point is 1 and its orbit trace is 1+(−1)=0. The point-family constructor returns 1, not its trace.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), §1.7 p.19; Gross §1 p.236; Zhang §3.7 p.213 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Parametrization choice, degree and torsion

`HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree` — theorem. Suggested name: `TauCeti.Heegner.parameter_choice_and_degree`.

For the fixed Heegner family, ideal-class translation gives the corresponding Galois translation; a Fricke/orientation change acts by the recorded eigenvalue and rational cusp-torsion translation. Multiplying the modular parametrization or clearing Hodge denominators scales P_c and the bottom trace by that integer. For Gross’s rational optimal curve, φ*ω_E=c_φ·(2πif(z)dz), with positive integral Manin constant c_φ; the index I_K/c_φ is invariant under the appropriate isogeny change, not I_K alone.

**Construction/proof.**

1. Use CM ideal reciprocity and the actual quotient’s Hecke/Fricke action.
2. Use Manin–Drinfeld only for the cusp-difference torsion term; do not remove it until a prime-to-p argument is supplied.
3. Track the differential, degree and scalar under composition/isogeny.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`; `EllipticCurveModularity:R29.5`; `GrossZagierAndArithmeticHeights:GZ.3`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §1 pp.236–237; §5 pp.243–244; Zhang Remarks6–7 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Trace is independent of coset representatives, but an individual point need not be. A p-divisible scaling of φ destroys primitivity without destroying non-torsion.

**Remaining supplier/refinement work.** The rational-point/canonical-model and modular quotient suppliers remain open; their contracts are not recreated here.


## HE.2. Geometric norm and reduction-congruence relations

**Planets:** Hecke neighbors of a CM point; Inert Heegner norm relation; Split and ramified first-step relations; Repeated-conductor predecessor relation; Heegner reduction congruence.

### 1. Hecke neighbors of a CM point

`HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification` — theorem. Suggested name: `TauCeti.Heegner.cm_hecke_conductor_classification`.

At a finite prime P where B is split and the Eichler level is maximal, let ε_P=−1,0,1 for inert, ramified, split K/F. A level-zero CM lattice has 1+ε_P horizontal neighbors and N(P)−ε_P ascending neighbors of conductor P. At positive conductor n it has one predecessor of conductor n−1 and N(P) ascending neighbors of conductor n+1. The ascending set is a torsor for O_n×/O_n+1×. Global unit stabilizers must be divided out when converting this local sum into a field trace.

**Construction/proof.**

1. Specialize the imported quaternionic local lattice/moduli description.
2. Use the order residue algebra and its action on P¹, as in Cornut–Vatsal Lemmas6.1 and6.5.
3. Descend the neighbor enumeration through the actual CM moduli map.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`; `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`; `HilbertModularVarietiesAndShimuraCurves:R18.4`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Appendix6.1–6.2 pp.62–64 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Inert Heegner norm relation

`HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence` — theorem. Suggested name: `TauCeti.Heegner.norm_relation_and_reduction_congruence`.

Under the classical Heegner hypothesis, ℓ prime with ℓ∤cN and inert in K, the compatible cusp-normalized family satisfies u_c,ℓ·Tr_{K[cℓ]/K[c]}P_cℓ=a_ℓP_c. With ordinary units u=1 this is the Gross/Howard equality. For a d-cleared Hodge family, first prove that the chosen basepoint is a Hecke eigenclass and transport the divisor relation; retain any integral torsion difference if only a rational eigenclass identity is known.

**Construction/proof.**

1. Apply the previous Hecke-neighbor enumeration with ε=−1.
2. Compare the local unit orbit to the actual field trace using HE.0’s kernel calculation.
3. Apply the Hecke-equivariant fixed modular quotient.

**Prerequisites.** `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`; `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`; `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`; `EllipticCurveModularity:R29.5`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition3.7(i), pp.240–241; Howard §1.7 p.19 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Do not silently assert degree ℓ+1 for the two exceptional unit fields. The equation is on actual points after all basepoint/torsion terms have been proved to disappear.

### 3. Split and ramified first-step relations

`HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence` — theorem. Suggested name: `TauCeti.Heegner.split_ramified_first_step_recurrence`.

For ℓ∤cN, the local divisor trace with u_c,ℓ retained equals T_ℓx_c−(σ_ℓ+σ_ℓbar)x_c in the split case and T_ℓx_c−σ_ℓx_c in the ramified case. Here Frobenius on the lower-conductor field is unramified at ℓ; the ramified case refers to K/Q ramification, not ramification of K[c]/K away from c. Use the specified reciprocity convention. After the fixed eigenquotient replace T_ℓ by a_ℓ only with the exact Jacobian basepoint corrections.

**Construction/proof.**

1. Apply Corollary6.6 with n=1 and the horizontal-neighbor list.
2. Invert geometric Frobenius when converting Cornut–Vatsal’s formula to the arithmetic convention.
3. Carry the complete divisor relation through the quotient.

**Prerequisites.** `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`; `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`; `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Corollary6.6, p.64 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Repeated-conductor predecessor relation

`HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence` — theorem. Suggested name: `TauCeti.Heegner.repeated_conductor_predecessor_recurrence`.

At maximal local quaternionic level and conductor exponent n≥2, the local unit trace of a CM point x of conductor n is T_P^lower(pr^upper x)−pr^lower(pr^upper x). On a coherent chosen chain this gives the repeated-conductor recurrence, with predecessor and central scaling specified. Passing to the global field trace divides the orbit by the actual global-unit stabilizer; it must not simply copy the first-step inert ℓ+1 formula.

**Construction/proof.**

1. Use Lemma6.5’s unique predecessor, then Corollary6.6.
2. Prove that the chosen conductor chain’s two predecessor operations match the modular CM orientation and central action.
3. Only then translate the recurrence to Heegner quotient points.

**Prerequisites.** `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`; `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`; `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Corollary6.6, p.64 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 5. Distribution at nonmaximal local level

`HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution` — theorem. Suggested name: `TauCeti.Heegner.nonmaximal_level_distribution`.

For a prime P with Eichler level exponent δ=1, orient the lattice pair and its type I/II. For conductor ≥2, its unit trace equals the appropriate upper/lower Hecke operator on its predecessor and becomes −pr(x) in the P-new quotient. For δ≥2, type I/II points have zero trace in the P-new quotient; type III is excluded. Reversing the orientation exchanges types I and II. These are divisor-module statements before any abelian quotient.

**Construction/proof.**

1. Import the local Eichler lattice-pair interpretation and P-new quotient.
2. Apply Cornut–Vatsal Lemmas6.11 and6.14, retaining the leading vertex/type and orientation.
3. Verify the quotient used by the chosen modular form is genuinely P-new.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`; `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`; `HilbertModularVarietiesAndShimuraCurves:R18.4`.

**Source.** [Christophe Cornut; Vinayak Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Appendix6.3–6.4 pp.65–67 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Heegner reduction congruence

`HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence` — theorem. Suggested name: `TauCeti.Heegner.inert_reduction_frobenius_congruence`.

For the classical compatible family, ℓ∤cND inert, choose compatible primes λ_cℓ|λ_c over ℓ and the actual good-reduction specialization maps. Then red_λcℓ(P_cℓ)=Frob_λc(red_λc(P_c)) after the specified residue-field identifications; Frobenius is the ℓ-power geometric endomorphism on the reduction of the modular/elliptic curve as fixed in Gross’s convention. State separately the Artin arithmetic-Frobenius conversion. This is pointwise, not merely an equality of traces.

**Construction/proof.**

1. Apply the imported geometric Eichler–Shimura relation T_ℓ=Fr+Fr∨.
2. Use the CM branch specializing to the inseparable isogeny and the total ramification/residue F_ℓ² calculation.
3. Carry specialization through the Néron-model extension of the quotient.

**Prerequisites.** `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`; `NeronModelsAndSemistableAbelianVarieties:R11.2`; `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura`; `ModularCurvesPartII:R14.6/neron-hecke-extension`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition3.7(ii) and proof, pp.240–241 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 7. Quaternionic CM reduction and specialization

`HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization` — theorem. Suggested name: `TauCeti.Heegner.quaternionic_reduction_specialization`.

For Zhang’s m∈Λ′+ and an admissible q∤m, reduction of x_m(n) at q is x_mq(n) in the definite Shimura set, using the matched optimal embedding and supersingular identification. For q|m, specialization is x_m/q(n) on the chosen vertex copy of the semistable reduction graph. Both formulas require the same CM/basepoint identifications and the prime λ=qO_K splitting completely in the CM fields of definition over K (in particular K[n]/K, since q∤n). Rational q is inert in K/Q; reduction uses residue field F_q².

**Construction/proof.**

1. Import Cerednik–Drinfeld and good-reduction moduli models, not re-prove them.
2. Match the basepoint-induced embeddings K↪B_mq and K↪B_m/q.
3. Compute the norm/forgetful maps on the finite double cosets as in (3.18)–(3.19).

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`; `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`; `NeronModelsAndSemistableAbelianVarieties:R11.6`; `HilbertModularVarietiesAndShimuraCurves:R18.2`; `HilbertModularVarietiesAndShimuraCurves:R18.3`; `HilbertModularVarietiesAndShimuraCurves:R18.5`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §§3.4–3.6, pp.207–211, Theorem3.1 Zhang3.5 says the prime (q)⊂O_K splits over K in the CM fields. Theorem3.1 supplies both formulas; q itself is an inert rational prime, and the residue field is F_q².

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Remaining supplier/refinement work.** Exact geometric/cohomological supplier contracts remain open; target-level declarations and proof routes are recorded.


## HE.3. Kummer classes and exact Selmer conditions

**Planets:** Heegner Kummer classes; Component obstruction at bad places; Kummer condition at the coefficient prime.

### 1. Heegner Kummer classes

`HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions` — theorem. Suggested name: `TauCeti.Heegner.kummer_classes_and_the_modified_selmer_conditions`.

Apply the imported finite Kummer injection E(K[c])/p^mE(K[c])→H¹_cont(K[c],E[p^m]) to P_c. Apply the imported p-adic Kummer map to the compatible p-completion to obtain the integral T_pE class. The finite classes are its actual coefficient reductions, and restriction/corestriction commute with the field maps/point trace, including all trace/unit constants from HE.2. The Tate module has its inverse-limit topology and finite torsion coefficients their discrete topology.

**Construction/proof.**

1. Use EllipticCurves Layer7 and L0, not the multiplicative μ_n Kummer map as an elliptic Kummer map.
2. Apply connecting-homomorphism naturality to the exact multiplication sequence and the actual trace maps.
3. Use the continuous inverse-limit comparison, recording any lim¹/invariant obstruction.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`; `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `SelmerIwasawaCohomology:L0`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), §§1.1,1.7 pp.5–8,19–21; Gross §4 pp.241–243 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Good-place Kummer condition

`HeegnerPointEulerSystems:HE.3/good-place-kummer-unramified` — theorem. Suggested name: `TauCeti.Heegner.good_place_kummer_unramified`.

For ℓ≠p of good reduction, the finite Kummer image E(K_v)/p^m agrees with H¹_unr(K_v,E[p^m]); in particular P_c’s Kummer class is unramified at such v, after transfer to the relevant field. The proof uses the Néron model and unramified torsion, not a claim that all local cohomology is unramified.

**Construction/proof.**

1. Import the good-reduction Kummer/unramified comparison from EC7/L1.
2. Apply it to the actual local point and use specialization for the finite torsion quotient.

**Prerequisites.** `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `SelmerIwasawaCohomology:L1`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §7 pp.247–249 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. Component obstruction at bad places

`HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction` — theorem. Suggested name: `TauCeti.Heegner.bad_place_component_obstruction`.

For finite v∤p, compare the local point Kummer image with the propagated rational unramified condition. The discrepancy factors through the p-primary component group of the Néron model, together with the precise local invariants/quotient torsion terms. Equality requires the appropriate obstruction to vanish; residual irreducibility alone does not remove it. For Gross’s derived d(n), the cusp-divisor and connected-Néron-model argument proves local triviality away from n even at primes dividing N.

**Construction/proof.**

1. Import the exact local Néron component sequence and unramified connected-part H¹ vanishing.
2. Apply the Heegner cusp-divisor identity and prime-to-p rational cusp torsion under Gross’s big-image hypothesis.
3. Distinguish this special derived-class argument from a universal integral unramified-condition equality.

**Prerequisites.** `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`; `NeronModelsAndSemistableAbelianVarieties:R11.2`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `NeronModelsAndSemistableAbelianVarieties:R11.2/component-group`; `NeronModelsAndSemistableAbelianVarieties:R11.2/elliptic-filtration`; `SelmerIwasawaCohomology:L2/finite-unramified-comparison`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition6.2 and proof, pp.244–247 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Kummer condition at the coefficient prime

`HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition` — theorem. Suggested name: `TauCeti.Heegner.coefficient_prime_local_condition`.

At v|p with good reduction, the actual Kummer class of P_c satisfies the finite/crystalline rational condition and its integral propagated Kummer condition. In the good ordinary branch compare with the Greenberg filtration only under the exact ordinary/crystalline comparison hypotheses and retain local-torsion error terms. A rational equality after tensoring with Q_p is not an equality of integral lattices.

**Construction/proof.**

1. Apply the finite-flat/crystalline Kummer theorem from R07 and EC7.
2. Use the actual point Kummer class and the propagated T→V→A diagrams.
3. In the ordinary branch use L2’s local filtration comparison and record its defect.

**Prerequisites.** `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `SelmerIwasawaCohomology:L2`; `SelmerIwasawaCohomology:L2/condition-propagation`; `SelmerIwasawaCohomology:L2/greenberg-condition`; `SelmerIwasawaCohomology:L4/bloch-kato-condition`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), §1.6, Theorem1.6.5 proof, pp.18–19 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 5. Saturated integral Kummer comparison

`HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice` — theorem. Suggested name: `TauCeti.Heegner.saturated_integral_kummer_lattice`.

Compare the actual finite/p-adic Heegner Kummer classes in the Selmer lattice with E(K)⊗Z_p, V_pE, and E[p∞]. Use the Kummer exact sequence to identify the quotient by the Mordell–Weil lattice with the appropriate Sha group. Saturation is a separate integral assertion; the finite cokernel and local component-group defects must be retained before rationalizing.

**Construction/proof.**

1. Import the EC7 Kummer exact sequences and L0 inverse-limit comparison.
2. Use the actual coefficient reduction maps, not unrelated choices of finite classes.
3. Compute the torsion kernel/cokernel of integral-to-rational propagation.

**Prerequisites.** `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`; `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`; `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `SelmerIwasawaCohomology:L0`; `SelmerIwasawaCohomology:L2/lattice-passage`; `SelmerIwasawaCohomology:L2/elliptic-selmer-instance`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), Introduction pp.1–3; §1.6 pp.18–19 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Archimedean Tate correction

`HeegnerPointEulerSystems:HE.3/archimedean-tate-correction` — theorem. Suggested name: `TauCeti.Heegner.archimedean_tate_correction`.

Over imaginary quadratic K all archimedean completions are C, so the relevant local H¹ vanishes. In descent to Q at a real place use the real/Tate local condition on the actual E[p^m] module. Odd p permits the usual conjugation eigenspace splitting; at p=2 its kernel/cokernel must be retained and one cannot divide by two on an integral Z₂ lattice.

**Construction/proof.**

1. Apply the imported real Galois/Tate cohomology calculation from R02.
2. Specialize to E[p^m] and distinguish complex K from the real Q base.

**Prerequisites.** `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`; `ArithmeticGaloisDuality:R02.4`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition6.2, p.245; §8 p.249 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Remaining supplier/refinement work.** Exact geometric/cohomological supplier contracts remain open; target-level declarations and proof routes are recorded.


## HE.4. Heegner derivative classes and choice independence

**Planets:** Heegner conductor coefficient ideal; Vanishing of ring-class torsion invariants; Descended Heegner derivative class; Bottom class is the trace Kummer class; Generator change and intrinsic tensor coefficient; Parity of the Heegner derivative class.

### 1. Heegner conductor coefficient ideal

`HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal` — construction. Suggested name: `TauCeti.Heegner.coefficientIdeal`.

Fix an odd prime p and an actual Hecke eigenvalue function a_ℓ. Set I_ℓ=(a_ℓ,ℓ+1)⊂Z_p and I_n=Σ_{ℓ|n}I_ℓ for squarefree n of admissible inert primes. The quotient is Z_p/I_n. For n=1 the empty sum is zero, so the coefficient module is the full Tate lattice, not its residual reduction. If n>1 then I_n=(p^M(n)) with M(n)=min_{ℓ|n}min(v_p(a_ℓ),v_p(ℓ+1)). An intersection/product would give the wrong modulus.

**Construction/proof.**

1. Use existing PadicInt and Ideal.span.
2. Form the finite sum of ideals. Apply PadicInt.ideal_eq_span_pow_p only after proving I_n≠0 for n>1 from ℓ+1≠0; use mem_span_pow_iff_le_valuation on nonzero generators and handle a_ℓ=0 separately. The minimum ideal valuation follows from the order of these principal ideals.
3. Compare the quotient to the coefficient reduction used by ES3.

**Prerequisites.** `mathlib:PadicInt`; `EulerSystemsAndKolyvaginSystems:ES.3`; `mathlib:PadicInt.ideal_eq_span_pow_p`; `mathlib:PadicInt.mem_span_pow_iff_le_valuation`.

**Uses.**

- Howard Lemma1.7.1 — Both Hecke eigenvalue and cyclic extension degree vanish modulo I_n.
- Zhang §3.7 pp.212–213 — The allowable exponent M is the minimum conductor modulus.

**API.**

- `TauCeti.Heegner.coefficientIdeal` (constructor): For the finite prime set s and eigenvalues a, coefficientIdeal p a s=Σ_{ℓ∈s}span{a_ℓ,ℓ+1} in Z_p.
- `TauCeti.Heegner.coefficientIdeal_empty` (simp): coefficientIdeal p a ∅=0.
- `TauCeti.Heegner.coefficientIdeal_insert` (relation): For ℓ∉s, the ideal for insert ℓ s is span{a_ℓ,ℓ+1}+the ideal for s.
- `TauCeti.Heegner.coefficientIdeal_le_of_subset` (functoriality): s⊆t implies I_s≤I_t, hence there is the quotient map Z_p/I_s→Z_p/I_t.

**Unit tests.**

- `TauCeti.Heegner.coefficientIdeal_conductor_one` (degenerate): The empty conductor has zero ideal, so it does not force p to vanish.
- `TauCeti.Heegner.coefficientIdeal_prime_five` (computation): For p=5, s={19}, a_19=10, the ideal is (5).
- `TauCeti.Heegner.coefficientIdeal_min_not_max` (non-example): For p=5, s={19,149}, a_19=10,a_149=25, the ideal is (5), not (25); the sum takes the minimum valuation.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), §1.7 pp.19–20; Zhang §1 p.194 and Notations p.202 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Differentiated point invariance

`HeegnerPointEulerSystems:HE.4/differentiated-point-invariance` — theorem. Suggested name: `TauCeti.Heegner.differentiated_point_invariance`.

For the actual squarefree ring-class conductor n, let G_n=Gal(K[n]/K[1]) be the product of its cyclic inert factors and 𝒢_n=Gal(K[n]/K). Under ordinary units and the clean torsion-image hypotheses, choose generators σ_ℓ and coset representatives S for 𝒢_n/G_n. Use ES3’s D_n=∏D_ℓ and set the differentiated point ˜P_n=Σ_{s∈S}sD_nP_n. Its class modulo I_n is 𝒢_n-invariant and independent of S. Use the full 𝒢_n action, not merely invariance under G_n. Exceptional-unit factors require a modified bounded-denominator construction, not an assumed direct product.

**Construction/proof.**

1. Apply ES3’s (σ−1)D=|G|−Norm identity to HE2’s actual norm relation.
2. Both a_ℓ and ℓ+1 vanish in the actual coefficient ideal.
3. Sum over the class-group cosets and show changing representatives contributes zero modulo I_n.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`; `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`; `EulerSystemsAndKolyvaginSystems:ES.3`; `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), Lemma1.7.1 pp.19–20; Gross §4 pp.241–243 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. Vanishing of ring-class torsion invariants

`HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants` — theorem. Suggested name: `TauCeti.Heegner.ring_class_torsion_invariants`.

Under Gross’s odd-p full residual image hypothesis or Howard’s full G_K Tate-image hypothesis, E[p^m](K[n])=0 for the relevant ring-class towers and all m≥1. The residual case uses the generalized-dihedral nature of K[n]/Q and the irreducible two-dimensional image; bootstrap finite exponent using multiplication by p. This statement is not implied by residual irreducibility for arbitrary field extensions.

**Construction/proof.**

1. Apply the actual field/Galois quotient from HE0.
2. Use the image subgroup and dihedral quotient argument in Gross Lemma4.3.
3. Reduce any nonzero p^m invariant to nonzero p-torsion.

**Prerequisites.** `HeegnerPointEulerSystems:HE.0/dihedral-conjugation`; `ArithmeticGaloisRepresentations:R01.4`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Lemma4.3, statement p.241 and proof p.242; Howard Lemma1.7.1 proof p.20. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Descended Heegner derivative class

`HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K` — construction. Suggested name: `TauCeti.Heegner.descendedClass`.

Under the proved torsion-invariant vanishing, inflation–restriction gives res:H¹_cont(K,E[p^m])≃H¹_cont(K[n],E[p^m])^𝒢_n for m≤M(n). Define c_m(n) as res⁻¹ of the Kummer class of ˜P_n. For integral conductor-one use the T_pE Kummer class of y_K. Without invariant vanishing, keep the H¹/H² kernel/cokernel terms and use the separate error-tolerant ES3/4 construction; there is no unrestricted unique inverse.

**Construction/proof.**

1. Use the actual finite Galois restriction map from R02, whose inverse exists only after the previous node.
2. Apply it to the invariant differentiated Kummer class.
3. Check that the resulting class has the prescribed restriction, independent of cocycle/root/representative choices.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/differentiated-point-invariance`; `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`; `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`; `EulerSystemsAndKolyvaginSystems:ES.3`; `ArithmeticGaloisDuality:R02.2/five-term-transgression`.

**Uses.**

- Gross Proposition4.7 — Divisibility of the actual differentiated point detects c(n) and its torsor image d(n).
- Howard Lemma1.7.3 — Finite/transverse local conditions are proved on this descended class.

**API.**

- `TauCeti.Heegner.descendedClass` (constructor): descendedClass resInv z is the unique class whose restriction is the invariant differentiated Kummer class z.
- `TauCeti.Heegner.descendedClass_restrict` (characterisation): Its actual restriction equals z.
- `TauCeti.Heegner.descendedClass_unique` (extensionality): Any class with restriction z equals descendedClass resInv z.
- `TauCeti.Heegner.descendedClass_natural` (functoriality): A commuting coefficient/restriction square carries descendedClass to the class obtained by descending the reduced differentiated Kummer class.

**Unit tests.**

- `TauCeti.Heegner.descendedClass_zero` (degenerate): The zero invariant differentiated Kummer class descends to zero.
- `TauCeti.Heegner.descendedClass_identity` (compatibility): For the trivial field extension, resInv=id and descendedClass is the Kummer class itself.
- `TauCeti.Heegner.descendedClass_noninjective_obstruction` (non-example): A restriction map with nonzero kernel does not define a unique descended class; the constructor requires the proved additive equivalence.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §4 pp.242–243; Howard Lemmas1.7.1–1.7.2 p.20; Zhang(3.21) p.213 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 5. Explicit cocycle and divisibility criterion

`HeegnerPointEulerSystems:HE.4/explicit-cocycle-divisibility` — theorem. Suggested name: `TauCeti.Heegner.explicit_cocycle_divisibility`.

Choose p^mQ=˜P_n over the separable closure. The class c_m(n) is represented by σQ−Q−(σ˜P_n−˜P_n)/p^m, where the last quotient is the uniquely specified K[n]-rational division term under torsion vanishing. Hence c_m(n)=0 iff ˜P_n∈p^mE(K[n]); its image d_m(n) in H¹(K,E)[p^m] vanishes iff ˜P_n∈p^mE(K[n])+E(K), with descent interpreted through the actual restriction map.

**Construction/proof.**

1. Compute the connecting cocycle and subtract the division correction.
2. Check cocycle continuity and root-change coboundaries, using the finite algebraic field of definition.
3. Apply the Kummer exact sequence and injective restriction; retain the genuine K-rational summand for d.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`; `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Explicit cocycle (4.6) and Proposition4.7, printed p.242; Howard Lemma1.7.2 p.20. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Bottom class is the trace Kummer class

`HeegnerPointEulerSystems:HE.4/bottom-trace-class` — theorem. Suggested name: `TauCeti.Heegner.bottom_trace_class`.

At n=1, D_1=1 and the sum over 𝒢_1 gives y_K=Tr_{K[1]/K}P_1. Thus c_m(1)=δ_m(y_K) and the integral bottom class κ_1=δ_T(y_K), while d_m(1)=0. This is not δ(P_1) over K unless P_1 already descends.

**Construction/proof.**

1. Apply the empty-product identity and the exact finite field trace.
2. Use Kummer/corestriction naturality from HE3.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`; `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Definition(4.1), printed p.241, and note after Proposition4.7 p.242; Howard §1.7 p.20; Zhang(3.22) p.213. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 7. Generator change and intrinsic tensor coefficient

`HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence` — theorem. Suggested name: `TauCeti.Heegner.generator_tensor_choice_independence`.

After tensoring with G(n)=⊗_{ℓ|n}Gal(K[ℓ]/K[1]), the Heegner derivative class has the prescribed ES3 generator-change transformation law; changing σ_ℓ to σ_ℓ^u changes the derivative class by the inverse unit factor modulo I_n and the cyclic tensor generator by the compensating factor. State compatibility with lift/coset choices separately. Do not assert raw scalar classes are generator-independent.

**Construction/proof.**

1. Apply ES3’s cyclic derivative change-of-generator identity.
2. Tensor with the actual cyclic factors from HE0 and use the coefficient modulus.
3. Verify a two-prime generator change independently in each tensor factor.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `EulerSystemsAndKolyvaginSystems:ES.3`; `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), Theorem1.7.5 pp.20–21; Gross §4 p.242 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 8. Coefficient reduction and auxiliary-prime restriction

`HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility` — theorem. Suggested name: `TauCeti.Heegner.coefficient_and_prime_set_compatibility`.

For m′≤m≤M(n), reduction E[p^m]→E[p^m′] takes c_m(n) to c_m′(n) under the exact chosen division/Kummer conventions. Restricting the permitted auxiliary-prime set restricts the same family; adding primes extends the family only when the conductor/norm/reduction hypotheses and tensor factors are proved for them. No map removing a prime factor of n is assumed without the local system relation.

**Construction/proof.**

1. Use the commuting Kummer/restriction square and uniqueness of descended classes.
2. Apply ES2/3 indexing-family restriction and compare conductor ideals.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`; `EulerSystemsAndKolyvaginSystems:ES.3`; `EulerSystemsAndKolyvaginSystems:ES.2`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §3.7 pp.211–213; Howard §1.7 pp.19–21 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 9. Parity of the Heegner derivative class

`HeegnerPointEulerSystems:HE.4/complex-conjugation-parity` — theorem. Suggested name: `TauCeti.Heegner.complex_conjugation_parity`.

For odd p and the clean classical branch, if ε is the Fricke eigenvalue of the eigenquotient, τc_m(n)=ε(−1)^ν(n)c_m(n); equivalently using the global root number w=−ε, this is w(−1)^(ν(n)+1). The torsion term from the basepoint/Fricke relation is removed only after its prime-to-p proof. At p=2 this formula does not yield an integral direct-sum eigenspace decomposition.

**Construction/proof.**

1. Use the actual CM conjugation/Fricke relation from HE1.
2. Compute τ on cyclic generators and ES3’s derivative, retaining the norm terms before reduction.
3. Kill only the proved prime-to-p cusp-torsion correction.

**Prerequisites.** `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`; `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `EulerSystemsAndKolyvaginSystems:ES.3`; `HeegnerPointEulerSystems:HE.3/archimedean-tate-correction`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition5.4 pp.243–244; Zhang(3.24) p.213 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Remaining supplier/refinement work.** Typed continuous descent and ES3 derivative/tensor interfaces are open suppliers; exceptional invariants use the HE.7 error branch.


## HE.5. Local reciprocity and arithmetic hypothesis verification

**Planets:** Transverse condition of the descended class; Heegner finite–singular correction automorphism; Corrected Heegner Kolyvagin system; Tate coefficient and big-image hypotheses; Cartesian, self-dual and conjugation local conditions; Residual Kummer field and detection pairing.

### 1. Transverse condition of the descended class

`HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition` — theorem. Suggested name: `TauCeti.Heegner.heegner_transverse_local_condition`.

For ℓ|n an inert auxiliary prime under Howard’s odd-p clean hypotheses, the localization of c(n) restricts to zero over the specified totally ramified local ring-class extension K[n]_λ/K_λ. Thus it lies in the transverse condition used by ES1. Away from n it lies in the propagated finite local condition established in HE3. The p-odd identity Σ_{i=1}^{ℓ}i=ℓ(ℓ+1)/2 enters the transverse proof and cannot be copied integrally at p=2.

**Construction/proof.**

1. Use the explicit Heegner cocycle and the actual local extension.
2. Use HE2’s reduction congruence and the cyclic derivative computation.
3. Check the local restriction vanishes, rather than choose an arbitrary complement of the unramified line.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/explicit-cocycle-divisibility`; `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence`; `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`; `EulerSystemsAndKolyvaginSystems:ES.1`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), Lemma1.7.3 and proof, pp.20–21 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Heegner finite–singular correction automorphism

`HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism` — theorem. Suggested name: `TauCeti.Heegner.local_heegner_chi_automorphism`.

At inert ℓ, define Howard’s automorphism χ_ℓ on T/I_ℓT through local reduction, projection to the p-primary subgroup, p^−M(a_ℓ−(ℓ+1)Fr_ℓ), and the canonical torsion lift. The valuation/cyclic Frobenius-eigenspace calculation proves it is invertible. With all chosen cyclic generators retained, χ_ℓ(κ_n(Fr_λ))=κ_nℓ(σ_ℓ) is the actual Heegner finite–singular relation. This is an arithmetic correction to ES1’s generic comparison, not an assertion that raw classes already form a strong system.

**Construction/proof.**

1. Apply the pointwise reduction congruence and the explicit derivative cocycle.
2. Use the good-reduction torsion identification and valuations of ℓ+1±a_ℓ.
3. Check the chosen Frobenius/σ and cyclic tensor normalization in the finite–singular square.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition`; `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence`; `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`; `EulerSystemsAndKolyvaginSystems:ES.1`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), Proposition1.7.4, preprint p.21; published pp.1457–1458. The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. Corrected Heegner Kolyvagin system

`HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system` — construction. Suggested name: `TauCeti.Heegner.correctedClass`.

For the actual descended Heegner family κ_n, construct commuting global cohomology automorphisms χ_ℓ inducing the specified local Howard correction. Let χ_n=∏_{ℓ|n}χ_ℓ. Define κ′_n=χ_n⁻¹(κ_n)⊗σ_n in the cyclic tensor target. Then κ′ satisfies the strong ES1/3 edge relation and κ′_1=κ_1, so κ′ is a Kolyvagin system for the Selmer triple (T,F,𝓛) in the sense of EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses (Howard Definition1.2.3 and Theorem1.7.5). A local non-G_K-linear coefficient automorphism alone cannot be postcomposed with global cocycles; a legitimate change-of-group action and its localization comparison must be supplied.

**Construction/proof.**

1. Use the G_Q conjugation/change-of-group action on H¹(K,T/I_n), with the matching coefficient action.
2. Verify that each χ_ℓ is induced by that action after the local Kummer/Frobenius identification; this is the explicitly recorded remaining comparison gap.
3. Apply the corrected finite–singular square and commute the global χ maps, tensoring with the cyclic generators.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`; `HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence`; `EulerSystemsAndKolyvaginSystems:ES.3`; `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`.

**Uses.**

- Howard Theorem1.6.5 — The actual corrected system is input to the self-dual DVR bound.
- HE.8 (outside this part) — The unchanged conductor-one class is used in the anticyclotomic specialization.

**API.**

- `TauCeti.Heegner.correctedClass` (constructor): correctedClass χ κ=χ⁻¹κ for the proved global additive automorphism χ; the cyclic tensor is retained in the supplied target.
- `TauCeti.Heegner.correctedClass_apply` (simp): correctedClass χ κ is evaluation of χ.symm at κ.
- `TauCeti.Heegner.correctedClass_uncorrect` (characterisation): χ(correctedClass χ κ)=κ.
- `TauCeti.Heegner.correctedClass_comp` (compatibility): For commuting χ,ψ, correction by their product equals successive correction by ψ then χ.

**Unit tests.**

- `TauCeti.Heegner.correctedClass_bottom` (degenerate): At the empty conductor χ_1=id, so the bottom class is unchanged.
- `TauCeti.Heegner.correctedClass_zero` (computation): The zero class remains zero under correction.
- `TauCeti.Heegner.correctedClass_involution` (non-example): For χ=−id on an additive group, correcting κ gives −κ; raw and corrected classes need not coincide.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), Theorem1.7.5 pp.20–21 and published p.1458 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Tate coefficient and big-image hypotheses

`HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2` — theorem. Suggested name: `TauCeti.Heegner.actual_tate_hypotheses_h0_h2`.

Under Howard TheoremA’s full G_K→GL₂(Z_p) surjectivity, p odd and p∤DN, T=T_pE is free rank two (H0), T/pT is absolutely irreducible (H1), and the auxiliary extension F/Q containing K used in H2 trivializes T and has H¹(F(μ_p∞)/K,T/pT)=0. The central scalar subgroup of order p−1 kills this cohomology. Full Tate-image surjectivity is stronger than residual irreducibility or residual surjectivity and is stated separately. H.0–H.2 are those of the hypothesis record EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses.

**Construction/proof.**

1. Import the elliptic Tate module/Weil determinant from EC Layer2.
2. Choose F=K(E[p∞]), which contains K and trivializes T, as in Howard Theorem1.6.5; use the Weil determinant to include μ_p∞.
3. Apply the central-scalar cohomology-vanishing argument as in Howard’s verification.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`; `ArithmeticGaloisDuality:R02.2`; `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), H.0–H.2 pp.8–9, Theorem1.6.5 proof pp.18–19 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 5. Cartesian, self-dual and conjugation local conditions

`HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5` — theorem. Suggested name: `TauCeti.Heegner.actual_local_hypotheses_h3_h5`.

For the same actual T, verify H3 cartesian propagation at every quotient of the DVR, H4 the symmetric twisted Weil pairing (s,t)=e(s,τt) and exact orthogonality at conjugate places, and H5 extension of the residual representation to G_Q with one-dimensional τ± eigenspaces, G_Q-stability of local conditions and the required pairing/conjugation identity. Use the rational finite local conditions and their exact integral/torsion propagation; the hypothesis record H.0–H.5 is EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses, and Howard’s abstract theorem is not defined or reproved here.

**Construction/proof.**

1. Use HE3’s propagated rational Kummer conditions and torsion-free local quotient criterion.
2. Twist the alternating Weil pairing by the chosen complex conjugation to obtain Howard’s symmetric pairing.
3. Apply local Tate duality, conjugate-place functoriality and the actual residual G_Q representation.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2`; `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`; `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`; `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`; `SelmerIwasawaCohomology:L1`; `SelmerIwasawaCohomology:L2/lattice-passage`; `SelmerIwasawaCohomology:L2/finite-condition-lattice-duality`; `SelmerIwasawaCohomology:L1/lattice-pairing-compatibility`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), H.3–H.5 pp.8–9, Theorem1.6.5 proof pp.18–19 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Residual Kummer field and detection pairing

`HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing` — theorem. Suggested name: `TauCeti.Heegner.residual_kummer_field_pairing`.

In Gross’s odd-p full residual-image setting let L=K(E[p]). For a finite F_p-subspace S⊂H¹(K,E[p]), let L_S be the fixed field of the intersection of the kernels of the restricted homomorphisms G_L→E[p]. Restriction identifies classes with the equivariant Hom space, and the evaluation pairing gives Gal(L_S/L)≃Hom_Fp(S,E[p]) compatibly with the residual Galois action. The proof uses that the subquotients of the direct sum E[p]^r are sums of this simple module, not general semisimplicity of arbitrary F_p[GL₂(F_p)]-modules.

**Construction/proof.**

1. Use the central homothety subgroup and continuous inflation–restriction to kill H¹/H² over L/K.
2. Take the actual finite Galois extension cut out by a finite basis of S.
3. Use simplicity of E[p] and the nondegenerate evaluation pairing as in Gross9.3.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`; `ArithmeticGaloisDuality:R02.2`; `EulerSystemsAndKolyvaginSystems:ES.1`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §9 pp.250–252, Lemma9.1 and Proposition9.3 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 7. Heegner class detection by auxiliary primes

`HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection` — theorem. Suggested name: `TauCeti.Heegner.chebotarev_heegner_class_detection`.

Let M=L_S for a finite Selmer subspace S and let I fix the Kummer field generated by a pth division point of y_K. For τ acting on Gal(M/L), the square (τh)² detects the positive component used by Gross. Chebotarev primes whose Frobenius is the prescribed class of τh are inert auxiliary primes, avoid any specified finite set, and their localizations detect the corresponding evaluation annihilator. To detect a second independent class, use the correctly formed composite and the proved disjointness of its Kummer field.

**Construction/proof.**

1. Apply the actual residual Kummer pairing and Gross9.5–9.6.
2. Invoke upstream Chebotarev on the finite Galois composite, with avoidance of all bad/conductor/coefficient primes.
3. Verify simultaneous conditions and the class-field intersection before the second selection.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing`; `EulerSystemsAndKolyvaginSystems:ES.1`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Propositions9.5–9.6 and Claims10.1/10.3, pp.251–254 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 8. Arithmetic local error lengths

`HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison` — theorem. Suggested name: `TauCeti.Heegner.arithmetic_local_error_comparison`.

For the actual Heegner Tate representation, compare ES4’s restriction/invariant/local-condition errors with p-primary local torsion, the p-part of the Néron component group, and the index of the integral finite/ordinary lattice. Record each finite kernel/cokernel as a separate length or annihilator constant. Equality with an error-free theorem requires the relevant quantities to vanish, not just the global residual image hypothesis.

**Construction/proof.**

1. Apply the exact component/Kummer sequence and integral propagation from HE3.
2. Use the actual finite-level restriction/corestriction maps and measure their kernels/cokernels.
3. Identify the constants in the imported ES4 interface without equating distinct local hypotheses.

**Prerequisites.** `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`; `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`; `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`; `EulerSystemsAndKolyvaginSystems:ES.4`; `NeronModelsAndSemistableAbelianVarieties:R11.2`; `NeronModelsAndSemistableAbelianVarieties:R11.2/component-group`; `SelmerIwasawaCohomology:L2/finite-unramified-comparison`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), §1.1 pp.5–8; Gross Proposition6.2 pp.244–247 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 9. Tamagawa and local torsion obstruction examples

`HeegnerPointEulerSystems:HE.5/tamagawa-and-local-torsion-tests` — theorem. Suggested name: `TauCeti.Heegner.tamagawa_and_local_torsion_tests`.

For a split Tate curve over a local field of residue characteristic ℓ≠p with parameter q, its component group has order v(q); choose v(q)=p to get a nonzero p-component defect. If the same local field contains μ_p, the Tate uniformization supplies nonzero local E[p] even with a prime-to-p component order (for example v(q)=1). These distinct examples must fail the corresponding error-free local hypotheses. Neither local phenomenon follows or disappears from a global residual-irreducibility label.

**Construction/proof.**

1. Import the local Tate-curve and component-group calculation from EC Layer4.
2. Calculate the p-primary component for q of valuation p.
3. Use μ_p in the multiplicative uniformization for the separate local-torsion example.

**Prerequisites.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`; `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §6.3 pp.228–229, local monodromy/Tamagawa description The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** An integral local-condition comparison must display the nonzero defect in the first case. A residual big-image condition on a global curve is not a substitute for checking the local torsion in the second case.

**Remaining supplier/refinement work.** The global χ localization comparison remains an explicit gap. Howard’s hypothesis record and DVR theorem are imported by declaration id from EulerSystemsAndKolyvaginSystems ES.5, whose packet is not yet accepted; arithmetic hypothesis and error targets are recorded.


## HE.6. Clean rank-one descent and precise index bounds

**Planets:** Howard’s Heegner rank-one theorem; Gross’s clean mod-p descent; Sha square-index bound; Zhang’s Heegner congruence after level raising; Zhang’s Heegner indivisibility theorem; Heegner-system vanishing order.

The stage has two branches with different suppliers. Declarations 1–6 are the clean descent. Howard’s TheoremA applies the self-dual theorem of EulerSystemsAndKolyvaginSystems ES.5, cited by declaration id, to the corrected Heegner system of HE.5. Gross’s clean theorem is a direct argument modulo p from HE.5’s class detection. The primitivity comparison asks ES.5 for the equality case of Howard’s bound. Declarations 7–19 are Zhang’s indivisibility theorem, the proposed sub-layer HE.6z. It imports level raising with its quaternionic transports, the Jacquet–Langlands transfer, the main conjecture in its Skinner–Urban form with Kato’s divisibility and its rank-zero specialisation, the Gross formula and the definite period identity. None of these is in the libraries, and each is named with its owner. The period identity is the BSD owner’s early export `RankZeroOneBSD:BSD.3a/definite-congruence-period`; BSD.5’s index formula and BSD.6 are downstream of HE.6 and supply nothing here. Only the Zhang branch needs the main conjecture, which lies after HE.8 in the stage graph; the sub-layer keeps Howard’s and Gross’s theorems out of that order.

The residual local pairing, relation/parity, two-class detector and ramification-selection nodes specialize ES theory to Zhang’s V/k₀ before the triangular theorem. The upper-triangular detector matrix has ν+1 classes and uses 2ν+1 distinct primes. Its spanning and relaxed bounds use all good base-locus primes, not only conductor primes.

### 1. Howard’s Heegner rank-one theorem

`HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A` — theorem. Suggested name: `TauCeti.Heegner.clean_rank_one_descent_theorem_A`.

Assume E/Q conductor N, imaginary quadratic K discriminant D≠−3,−4 with all N-primes split, p odd, p,D,N pairwise coprime, and full Tate representation G_K→GL₂(Z_p) surjective. If the actual bottom Heegner Kummer class κ_1≠0, the compact Selmer group is free rank one and the discrete Selmer group is Q_p/Z_p⊕M⊕M for a finite Z_p-module M with length M≤length(H¹_F(K,T_pE)/Z_pκ_1). This is Howard TheoremA after the actual arithmetic H0–H5 checks and corrected system construction; the abstract self-dual theorem is EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem (Howard Theorem1.6.1), imported and not reproved here.

**Construction/proof.**

1. Use HE5’s actual coefficient/local hypothesis verification and corrected Heegner system.
2. Apply the imported theorem EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem (Howard Theorem1.6.1) with R=Z_p, T=T_pE, the propagated Kummer structure F and 𝓛=𝓛_1, to the corrected system κ′. Its hypotheses H.0–H.5 are the two HE.5 verification nodes, as in Howard Theorem1.6.5.
3. Identify compact/discrete Selmer carriers with the exact Kummer sequences; keep paired finite summands and the direction of the inequality.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system`; `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2`; `HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5`; `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`; `EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), TheoremA pp.1–2, Theorem1.6.5 pp.18–19 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Gross’s clean mod-p descent

`HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent` — theorem. Suggested name: `TauCeti.Heegner.gross_clean_mod_p_descent`.

Assume Gross’s classical standing hypotheses and non-CM E, p odd, Q(E[p])/Q has full GL₂(F_p) group, and y_K∉pE(K). Then Sel_p(E/K) is the cyclic F_p-space generated by δ(y_K), rank E(K)=1 and Sha(E/K)[p]=0. This clean theorem requires neither p∤N nor full p-adic surjectivity as an extra hypothesis; do not replace its hypothesis table with Howard’s.

**Construction/proof.**

1. Use the actual Gross local d(n) properties, finite Kummer fields and Chebotarev selection.
2. Prove the two eigenspace conclusions in the following nodes.
3. Apply the finite Kummer exact sequence and Mordell–Weil finite generation.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`; `HeegnerPointEulerSystems:HE.4/bottom-trace-class`; `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`; `HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing`; `HeegnerPointEulerSystems:HE.6/gross-same-eigenspace-generation`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Propositions2.1/2.3 pp.237–238, Claims10.1/10.3 pp.252–254 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. Opposite Selmer eigenspace vanishing

`HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing` — theorem. Suggested name: `TauCeti.Heegner.gross_opposite_eigenspace_vanishing`.

Under Gross’s clean mod-p hypotheses, the ε-opposite Selmer eigenspace is zero. Choose a prime using the actual Kummer field M and positive component outside I. Its d(ℓ) is locally nonzero and supported only at λ; global reciprocity forces every Selmer class in that eigenspace to localize to zero. The Kummer-field annihilator calculation then forces the global eigenspace to vanish.

**Construction/proof.**

1. Apply Gross8.1’s local one-dimensional eigenspace pairing, imported from ES1/L1.
2. Use Gross8.2 global annihilation and HE5’s actual field selection.
3. Apply Gross9.5–9.6 to convert all prescribed Frobenius annihilations to zero in the class-detection pairing.

**Prerequisites.** `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`; `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`; `EulerSystemsAndKolyvaginSystems:ES.1`; `SelmerIwasawaCohomology:L1`; `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`; `HeegnerPointEulerSystems:HE.4/explicit-cocycle-divisibility`; `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition8.2 pp.249–250; Claim10.1 pp.252–253 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Same Selmer eigenspace generation

`HeegnerPointEulerSystems:HE.6/gross-same-eigenspace-generation` — theorem. Suggested name: `TauCeti.Heegner.gross_same_eigenspace_generation`.

Under the same clean hypotheses, the remaining Selmer eigenspace equals F_p·δ(y_K). If a second independent class existed, choose the first auxiliary prime with nonzero local Heegner derivative and form its Kummer extension L′. Prove L′ is disjoint from the Selmer field over L in the relevant character, then choose a second simultaneous Frobenius in the composite. The finite/singular relation and reciprocity force incompatible localizations, so the second class cannot exist.

**Construction/proof.**

1. Use the nonzero bottom Kummer class before selecting the first prime.
2. Use the opposite-character Kummer class and actual field disjointness, not unrestricted linear disjointness.
3. Use Gross Proposition6.2 and Propositions8.1–8.2 for the mod-p local d-class support and reciprocal eigenspace pairing in the simultaneous composite. Howard’s full-Tate-image χ correction is not needed by this proof.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing`; `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`; `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`; `EulerSystemsAndKolyvaginSystems:ES.1`; `SelmerIwasawaCohomology:L1`; `HeegnerPointEulerSystems:HE.4/explicit-cocycle-divisibility`; `HeegnerPointEulerSystems:HE.4/bottom-trace-class`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Claim10.3 and proof, pp.253–254 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 5. Sha square-index bound

`HeegnerPointEulerSystems:HE.6/sha-square-index-bound` — theorem. Suggested name: `TauCeti.Heegner.sha_square_index_bound`.

Under HowardA with non-torsion y_K, the finite p-primary Sha group is the paired finite part of the discrete Selmer group. Thus length_Zp Sha[p∞]≤2·length_Zp(E(K)⊗Z_p/Z_py_K), after proving the exact integral Kummer-lattice identification. Equivalently its order divides the p-part of the square of the corresponding finite index. If a local or parametrization defect is present, insert its proved error term before this comparison.

**Construction/proof.**

1. Use the rank-one theorem and the actual Kummer exact sequence.
2. Identify the divisible Mordell–Weil summand and the paired finite quotient.
3. Multiply the finite-module length by two and translate valuations to divisibility, preserving the inequality direction.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A`; `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`; `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), Introduction, finite/p-adic Kummer exact sequences and TheoremA, PDF pp.1–2. TheoremA bounds length(M); the introduction identifies the finite Sha quotient by the Kummer sequences. Inequality(1) on p.3 is an Iwasawa statement and is not this finite-level bound.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 6. Primitivity and sharpness comparison

`HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero` — theorem. Suggested name: `TauCeti.Heegner.primitivity_versus_nonzero`.

A nonzero κ_1 yields an upper bound, not equality. Residual primitivity of the actual corrected system, under the self-dual hypotheses H.0–H.5 and for p≥5, gives the corresponding equality of finite length and corrected index (Zanarella Theorem2.3.6). Scaling the parametrization/system by p preserves non-torsion but increases the leading-class index, so cannot preserve an unsupported sharpness assertion. Zhang’s indivisibility conclusion proves a stronger property only under its enumerated hypotheses.

**Construction/proof.**

1. Apply the self-dual primitivity equality: for p≥5, the bound of EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem is an equality exactly when the system is primitive, that is has nonzero reduction modulo the maximal ideal as in ES.5/divisibility-invariants (Zanarella Theorem2.3.6). This equality is requested from EulerSystemsAndKolyvaginSystems:ES.5. Howard Theorem1.6.1 is an inequality, and the Mazur–Rubin nodes of ES.5 assume core rank one and are not the self-dual setting.
2. Compare coefficient reduction of the actual corrected system to its primitive leading/core component.
3. Use a p-scaling test on the actual point map.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A`; `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`; `EulerSystemsAndKolyvaginSystems:ES.5`; `EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem`; `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`.

**Source.** [Benjamin Howard](https://arxiv.org/pdf/1202.6340), TheoremA, PDF pp.1–2 (upper bound, not a primitivity equality). Howard supplies only the upper bound. The requested ES.5 primitivity theorem supplies conditional sharpness, while Zhang’s separately cited theorem supplies arithmetic indivisibility. [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorem9.3 p.243; §10 pp.245–246. Zhang proves this stronger indivisibility under his enumerated hypotheses; the excerpt belongs to Zhang, not Howard. [Murilo Zanarella](https://arxiv.org/pdf/1908.09197v1), Theorem2.3.6, with Definition2.3.2 and Proposition2.3.3, arXiv v1 pp.19–20 Under H.0–H.5 for (T,F) and its dual, p>4 and 𝓛⊇𝓛_s(T), Zanarella refines Howard’s inequality to length M=length(H¹_F(K,T)/Rκ_1)−d(κ), with d(κ)=0 exactly for a primitive system.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 7. Zhang’s Heegner congruence after level raising

`HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence` — theorem. Suggested name: `TauCeti.Heegner.zhang_cohomological_congruence`.

Let g,K,p satisfy Zhang’s Notations and Hypothesis♥, with m∈Λ′+ and distinct admissible q₁,q₂∤m. Fix the residual V over k₀, matched optimal embeddings and derivative generators. Then loc_q₁ c(n,m) lies in H¹(K_q₁,k₀) and loc_q₂ c(n,mq₁q₂) in H¹(K_q₂,k₀(1)); under fixed identifications with k₀ the two are equal up to a fixed nonzero scalar. The generic level-raising, definite/indefinite Jacquet–Langlands, multiplicity-one and Ihara statements are imported.

**Construction/proof.**

1. Import Ribet–Diamond–Taylor level raising in the form of Zhang2.1: for each admissible q a newform of exact level Nq with trivial nebentypus and the same residual representation over k₀; iterate over m to get g_m of exact level Nm. SerreWeightAndLevelOptimisation:R20.2/level-raising-diamond, Diamond’s criterion, gives a form that is new at q; the exact level, the prescribed inertial types at every ℓ≠p and the trivial nebentypus are requested from SerreWeightAndLevelOptimisation:R20.2.
2. Transfer g_m to the definite and indefinite quaternion algebras by GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl, with multiplicity one from R17.3/multiplicity-one; g_m is an unramified twist of Steinberg at each prime dividing N⁻m and discrete series of weight two at infinity. The identification of the transferred forms with functions on the Shimura set, norm-factor forms removed, is requested from HilbertModularVarietiesAndShimuraCurves:R18.3. Import the integral inputs with the level raising: J(X_m)[𝔪]≃V (Zhang Lemma3.3; Helm for Shimura curves), multiplicity one on the Shimura set by Mazur’s principle (4.8), and the identity (4.9) between the reduced eigenfunction and the local Kummer map, which rests on Ihara’s lemma for Shimura curves over Q. Use HE2’s matched reduction/specialization.
3. Compute the finite Kummer map and component-group singular Kummer map via the same eigenfunction, then apply compatible derivatives.

**Prerequisites.** `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`; `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `SerreWeightAndLevelOptimisation:R20.2`; `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`; `SerreWeightAndLevelOptimisation:R20.2/level-raising-diamond`; `GL2AutomorphicRepresentationsAndTransfer:R17.3/multiplicity-one`; `HilbertModularVarietiesAndShimuraCurves:R18.3`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorem4.3 and proof, pp.218–221; Lemma3.3 p.215 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application. [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §2, Theorem2.1 and proof, pp.203–204; (4.7)–(4.9), pp.218–219 Theorem2.1 is the imported level-raising statement: exact level Nq, trivial nebentypus, the same residual representation. (4.8) and (4.9) are the multiplicity-one and eigenfunction/Kummer inputs of the congruence.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 8. Heegner rank lowering through an admissible prime

`HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering` — theorem. Suggested name: `TauCeti.Heegner.zhang_local_conditions_rank_lowering`.

Under Zhang Hypothesis♥, local Selmer conditions for g and its admissible level-raised g′ have k₀-rational structures agreeing away from q. At q they are the finite k₀ line and the singular k₀(1) line respectively. If loc_q on the rational residual Selmer group is nonzero, it is surjective and the raised Selmer group is its kernel, so its dimension decreases by one. Hypothesis♥(3) requires H¹(Q_ℓ,V)=V^GQℓ=0 at ℓ²|N+; for elliptic E and p≥5 the additive-reduction argument verifies this. Do not apply the ℓ≠p Euler characteristic formula at ℓ=p.

**Construction/proof.**

1. Apply the good, toric, additive and coefficient-prime local descriptions separately as in Theorem5.2.
2. Use imported strict/relaxed parity duality to identify the two Selmer groups.
3. Apply the one-dimensional local line to get the exact kernel and dimension drop.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`; `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`; `SelmerIwasawaCohomology:L1`; `EulerSystemsAndKolyvaginSystems:ES.1`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Lemma5.1, Theorem5.2, Proposition5.4, pp.222–225 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** All local places are compared, including p and additive primes. Rank lowering is conditional on nonzero localization; level raising alone does not imply it.

### 9. Auxiliary rank-zero formula over K

`HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K` — theorem. Suggested name: `TauCeti.Heegner.zhang_rank_zero_over_K`.

For a weight-two newform g and its GL₂-type A_g/Q with coefficient prime 𝔭|p≥3, K as in Zhang’s Notations with p∤D_K, good ordinary p, residual image containing SL₂(F_p), and a residually ramified ℓ||N, L(g/K,1)≠0 iff Sel_𝔭∞(A_g/K) is finite. When finite, v_𝔭(L(g/K,1)/Ω_g^can)=length_O𝔭 Sel_𝔭∞(A_g/K)+Σ_{ℓ|N}t_g(ℓ). This is over A_g/K, not E/Q. It is derived from the rank-zero formula over Q for g and for its quadratic twist g_K (Skinner TheoremB) and the GL₂-type period comparison. That formula follows, by control at the trivial character, from the ordinary main conjecture in its Skinner–Urban form with Kato’s divisibility. These inputs need residual irreducibility and the residually ramified ℓ||N, and no image containing SL₂(Z_p).

**Construction/proof.**

1. Import from ModularIwasawaMainConjectures:L1 the Skinner–Urban form of the weight-two cyclotomic main conjecture, as an equality of ideals in the Iwasawa algebra over O (Skinner TheoremA for level prime to p, his Theorem2.5.2): for a newform f of trivial character and level M prime to p, ordinary at 𝔭, with ρ̄_f irreducible and ramified at some prime q||M. Apply it to f=g with M=N and to f=g_K with M=N·D_K², taking q=ℓ. The Fouquet–Wan form (their Theorem1.6) also requires ρ̄_f to have no invariants under the decomposition group at q, and does not suffice.
2. Kato’s divisibility for g and g_K, KatoEulerSystems:L4/ordinary-selmer-divisibility, is the upper bound inside that equality, and by itself gives the direction from L(g/K,1)≠0 to finiteness. That node states its integral bound for an image containing SL₂(Z_p). The integral bound under Skinner’s two conditions, (a) ρ̄_f irreducible and (b) an element of Gal(Q̄/Q(μ_p∞)) acting on the lattice with free rank-one coinvariants, is requested from KatoEulerSystems:L4; a generator of tame inertia at ℓ gives (b).
3. Specialise at the trivial character by Greenberg’s method, with coefficients O: #O/(L^alg(f,1))=#Sel_L(f)·∏_ℓ c_ℓ(T_f) for f=g and f=g_K (Skinner TheoremB, proved in his §3.2; its condition (iii) is empty when p∤M). This GL₂-type control statement is requested from SelmerIwasawaCohomology:L4.
4. Combine base/twist Selmer and local factors to obtain the K-base formula, with the canonical-period product comparison; no circular import from BSD6 is permitted.

**Prerequisites.** `ModularIwasawaMainConjectures:L1`; `KatoEulerSystems:L4`; `KatoEulerSystems:L4/ordinary-selmer-divisibility`; `SelmerIwasawaCohomology:L4`; `GrossZagierAndArithmeticHeights:GZ.0`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorem7.1 and proof, pp.231–232 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application. [Christopher Skinner](https://arxiv.org/pdf/1407.1093v1), Introduction, TheoremB, arXiv v1 p.2; §2.5, discussion after Theorem2.5.2, pp.15–16; §3.2, pp.20–21 TheoremB is the rank-zero formula over Q for a weight-two newform with coefficients O, for p≥3, under residual irreducibility and a prime q||N at which ρ̄_f is ramified. §2.5 shows that integrality in the Skinner–Urban main conjecture needs only those conditions. This replaces the SL₂(Z_p) step in the proof of Zhang’s Theorem7.1.

**Acceptance.** The field K and GL₂-type auxiliary variety are retained in both the statement and supplier request. Ordinariness is used here; it is not introduced into Gross’s clean mod-p theorem. The twist g_K has level N·D_K², prime to p; for p|D_K the statement is not claimed. No step passes from the residual image to an image containing SL₂(Z_p): that fails at p=3, and at p=5 when O_𝔭 is ramified over Z_5. Zhang’s rank-one case uses only the inequality v_𝔭(L(g/K,1)/Ω_g^can)≤length Sel_𝔭∞(A_g/K)+Σt_g(ℓ) (Remark 15).

### 10. Jochnowitz unit criterion

`HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value` — theorem. Suggested name: `TauCeti.Heegner.zhang_jochnowitz_special_value`.

For g as in Zhang’s Notations satisfying Hypothesis♥, with N− squarefree and ν(N−) even, and an admissible q, the Heegner bottom class is locally nonzero at q iff L^alg(g′/K,1) is a 𝔭′-adic unit. Here g′ is the chosen raised form, Ω_g′^can=〈g′,g′〉_Pet/η_g′(Nq), ξ_g′ is the norm of the integral primitive definite eigenfunction, η_g′,N+,N−q=η_g′(Nq)/ξ_g′, and L^alg=L/Ω^can·η_ratio⁻¹. Its integrality/unit status is proved by the explicit Waldspurger/Gross formula, not built into a definition.

**Construction/proof.**

1. Import the explicit definite special-value formula from GZ5 with all u_K and discriminant factors.
2. Use matched supersingular reduction and the residual multiplicity-one eigenfunction to compute loc_q c(1). The eigenfunction is the transfer of g′ by GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl and R17.3/multiplicity-one, realised on the Shimura set (HilbertModularVarietiesAndShimuraCurves:R18.3) and normalised integrally; its multiplicity one modulo 𝔭′ is among the transports requested from SerreWeightAndLevelOptimisation:R20.2.
3. Apply Corollary6.2 and Theorem6.5, allowing only proved p-adic-unit factors.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`; `GrossZagierAndArithmeticHeights:GZ.5`; `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`; `GL2AutomorphicRepresentationsAndTransfer:R17.3/multiplicity-one`; `HilbertModularVarietiesAndShimuraCurves:R18.3`; `SerreWeightAndLevelOptimisation:R20.2`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §6.1–6.4, pp.226–231, Corollary6.2 and Theorem6.5 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 11. Ribet–Takahashi period and Tamagawa comparison

`HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison` — theorem. Suggested name: `TauCeti.Heegner.ribet_takahashi_tamagawa_comparison`.

For g of weight2 and trivial nebentypus, p≥5 with p∤ND_K and surjective ρ_g,𝔭:G_Q→GL₂(k₀), K as in Zhang’s Notations, N⁻ squarefree of odd prime count, and all three clauses of Hypothesis♥, let η_g(N) be the full-level Hecke congruence ideal generator and ξ_g(N⁺,N⁻) the pairing norm of a primitive integral definite quaternionic eigenfunction. The period ratio is η_g,N⁺,N⁻=η_g(N)/ξ_g(N⁺,N⁻), not the raw congruence ideal. Then v_𝔭(η_g,N⁺,N⁻)=Σ_{ℓ|N⁻}t_g(ℓ), where t_g(ℓ)=length_O𝔭 Φ(A_g/K_ℓ)_𝔭. The identity is RankZeroOneBSD:BSD.3a/definite-congruence-period and is imported. K_ℓ is the unramified quadratic extension of Q_ℓ, since ℓ|N⁻ is inert in K, so t_g(ℓ) is the length of the geometric component group and not of its Q_ℓ-rational points. For nonsquarefree N require Ram(ρ)≠∅ and either a ramified ℓ||N⁻ or at least two primes ℓ||N⁺, as in ♥(2). The last clause does not itself assert residual ramification of both primes. At split additive ℓ²|N⁺, ♥(3) and finite-residue cohomology eliminate the rational component factor; decomposition-invariant vanishing is not inertia-invariant vanishing.

**Construction/proof.**

1. Import the identity from RankZeroOneBSD:BSD.3a/definite-congruence-period, reading its t_g(ℓ) as the length of the geometric component group, which is the group over K_ℓ used here. The export has no prerequisite in HE.6, in the final Heegner-index formula, in a Jochnowitz congruence or in rank-zero BSD.
2. The export’s route, recorded for the contract and not re-proved here, uses R11.4/R11.6 monodromy/component and degeneracy-map presentations, R17.3 integral definite/indefinite transfer and residual multiplicity one, and full-level Hecke congruence ideals. In the squarefree case follow Pollack–Weston6.2–6.8: character lattices, the monodromy degree formula, definite pairing and degree/congruence comparison.
3. For nonsquarefree N import the exact Ribet–Takahashi/Khare modular-degree comparison and Helm multiplicity-one variant identified in Zhang6.4, retaining Ram≠∅ and the two alternative level conditions. The squarefree preprint cannot be used as the sole supplier for this variant. The variant is part of the same export.
4. Normalize Ω_can=〈g,g〉_Pet/η_g(N), and the definite special value with ξ_g; only then cancel the N⁻ local lengths in the separate rank-zero application. Prove the other rational component factors are units using the corrected additive-prime finite-residue argument.

**Prerequisites.** `NeronModelsAndSemistableAbelianVarieties:R11.4`; `GrossZagierAndArithmeticHeights:GZ.3`; `RankZeroOneBSD:BSD.3a/definite-congruence-period`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorem6.4 and proof, pp.229–230; §7.2 p.233 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application. [Robert Pollack; Tom Weston](https://arxiv.org/pdf/math/0610694v1), §§6.2–6.5, preprint pp.18–21: Theorem6.2, Propositions6.3–6.7 and Theorem6.8. The squarefree identity is derived from the character group and modular-degree comparison; Zhang6.4 supplies the precise nonsquarefree variant through its additional cited degree/multiplicity-one results.

**Acceptance.** The imported export has its own declaration and no prerequisite in HE.6. η_g,N⁺,N⁻ is the ratio η_g(N)/ξ_g, with a primitive definite pairing and odd N⁻. Do not extend Pollack–Weston’s squarefree Theorem6.8 by dropping its hypotheses; retain the stated nonsquarefree comparison.

### 12. Triangular Heegner Selmer basis

`HeegnerPointEulerSystems:HE.6/zhang-triangular-selmer-basis` — theorem. Suggested name: `TauCeti.Heegner.zhang_triangular_selmer_basis`.

For g as in Zhang’s Notations with N− squarefree and ν(N−) even, and a nonzero residual Heegner system κ_g satisfying Hypothesis♥, let ν=min{ν(n):c(n)≠0}, ε_ν=w_g(−1)^(ν+1) and B(κ) its base locus of vanishing localizations away from DKNp. The ε_ν Selmer eigenspace has dimension ν+1 and a triangular basis of ν+1 actual c(n_i), detected at selected 2ν+1 auxiliary primes. The opposite eigenspace has dimension ≤ν. Relaxing at the base locus does not enlarge the first eigenspace and preserves that opposite bound.

**Construction/proof.**

1. Use the actual V/k₀ pairing, relation(8.1), parity(3.24), two-class detector and ramification-selection specialization, not the Gross or Howard detector.
2. Choose distinct ℓ₁,…,ℓ₂ν₊₁ inductively; put n_i=ℓ_i⋯ℓ_i₊ν₋₁ for 1≤i≤ν+1. Minimality makes each support localization zero, since c(n_i/ℓ)=0. Thus the c(n_i) satisfy the ordinary finite Selmer conditions.
3. For the next diagonal choose an opposite-sign class by Lemma8.2 and detect it with c(n_{j+1}) by Lemma8.1. Reciprocity against c(n_{j+1}ℓ) leaves one term, forcing singular nonvanishing at the distinguished old prime; (8.1) turns that into the next nonzero diagonal. The detector matrix at ℓ_ν₊j is zero for i>j and has nonzero diagonal.
4. Subtract the triangular basis from any remaining same-sign class so its detector localizations vanish. Simultaneous detection and a new derivative give a one-term reciprocity contradiction. At B(κ), all Heegner localizations vanish, so this argument also applies to the relaxed group.
5. For the opposite sign, a space of dimension>ν has a nonzero vector in the kernel of the ν detector maps. The same simultaneous-detection reciprocity contradiction gives the bound. When ν=0 all conductor products are empty and equal1.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`; `EulerSystemsAndKolyvaginSystems:ES.1`; `HeegnerPointEulerSystems:HE.6/heegner-vanishing-order`; `HeegnerPointEulerSystems:HE.6/heegner-base-locus`; `SelmerIwasawaCohomology:L1`; `HeegnerPointEulerSystems:HE.6/zhang-residual-heegner-relations`; `HeegnerPointEulerSystems:HE.6/zhang-two-class-prime-detection`; `HeegnerPointEulerSystems:HE.6/zhang-prescribed-ramification-class`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Lemma8.4 and proof, pp.236–239 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application. The final opposite-sign detector in the published proof uses ℓ_(2ν+1); the subscript misprint is recorded in E8.

**Acceptance.** Check the actual k₀ rational structures and all three new arithmetic specializations. The family must be nonzero; the zero family has ν=∞ and does not admit a finite triangular basis. Keep 2ν+1 distinct selected primes, ν+1 basis classes, and good-prime rather than conductor-only base locus.

### 13. Zhang’s Heegner indivisibility theorem

`HeegnerPointEulerSystems:HE.6/zhang-indivisibility` — theorem. Suggested name: `TauCeti.Heegner.zhang_indivisibility`.

Assume E/Q conductor N, K imaginary quadratic with gcd(D_K,N)=1, N− squarefree with even number of prime factors, full residual GL₂(F_p) image, p≥5 good ordinary and p∤D_KN. Hypothesis♠ requires residual ramification at every ℓ||N+ and every ℓ|N− with ℓ≡±1 mod p; if N is nonsquarefree require a nonempty Ram set and either a ramified ℓ||N− or at least two factors ℓ||N+. Then c_1(n)≠0 for some squarefree Kolyvagin conductor n, so M∞=0. For the auxiliary GL₂-type forms use the stronger Hypothesis♥, including the additive-prime local invariant vanishing.

**Construction/proof.**

1. Use Chebotarev to choose one/two admissible primes with nonzero localization.
2. Apply rank lowering and the rank-zero/Jochnowitz/period comparisons for the rank-one base case.
3. Induct by two on Selmer dimension, using the triangular/relaxed base-locus bounds to force a nonzero congruent class; remove the assumed parity by reduction to rank zero and the root-number contradiction.
4. Use the elliptic additive-reduction calculation to pass from ♠ to ♥.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering`; `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`; `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value`; `HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison`; `HeegnerPointEulerSystems:HE.6/zhang-triangular-selmer-basis`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorems1.1,9.1–9.3 and proofs, pp.195,240–243 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 14. Heegner-system vanishing order

`HeegnerPointEulerSystems:HE.6/heegner-vanishing-order` — definition. Suggested name: `TauCeti.Heegner.vanishingOrder`.

For the actual residual Heegner family κ={c(n):n∈Λ}, define ν(κ)=min{#prime divisors of n:n∈Λ,c(n)≠0}, valued in ℕ∪{∞}, with ν(0)=∞. The count is of distinct primes in the squarefree conductor, not multiplicity or number of nonzero classes. This is Zhang’s finite-residual support invariant, distinguished from the p-adic divisibility sequence M_r and its M∞.

**Construction/proof.**

1. Specialize the support/vanishing condition to the actual Heegner family, with the declared conductor set Λ.
2. Keep the empty/zero-system value and exclude bad primes exactly as in Zhang8.3.
3. Use the displayed API to state the triangular/relaxed Selmer theorem without unfolding the definition.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `EulerSystemsAndKolyvaginSystems:ES.1`; `mathlib:Nat.primeFactorsList`.

**Uses.**

- Zhang Definition8.3, Lemma8.4, Theorems9.1/9.3, pp.236–243 — The induction uses the minimum conductor size and relaxing local conditions at the base locus to prove nonvanishing.

**API.**

- `TauCeti.Heegner.vanishingOrder` (constructor): The infimum of the distinct-prime count of a conductor n∈Λ with c(n)≠0, with empty infimum ∞.
- `TauCeti.Heegner.vanishingOrder_formula` (characterisation): It is sInf{v:ℕ∞:∃n∈Λ,c(n)≠0 and v=#prime divisors(n)}.
- `TauCeti.Heegner.vanishingOrder_bottom` (simp): If 1∈Λ and c(1)≠0, ν(κ)=0.
- `TauCeti.Heegner.vanishingOrder_support_congr` (extensionality): Families with the same zero/nonzero support on Λ have the same vanishing order.

**Unit tests.**

- `TauCeti.Heegner.vanishingOrder_empty` (degenerate): The empty conductor-index set has vanishing order ∞.
- `TauCeti.Heegner.vanishingOrder_bottom_nonzero` (compatibility): A nonzero conductor-one class has vanishing order zero.
- `TauCeti.Heegner.vanishingOrder_conductor_six` (computation): A family supported only at squarefree conductor 6 has vanishing order two.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Definition8.3, published p.236, PDF46; Lemma8.4 and proof pp.236–239. The two support definitions are explicitly stated and used in the triangular basis and nonvanishing proofs.

**Acceptance.** Do not replace minimum support size by the greatest conductor size or by the number of nonzero classes. Use only conductors in Λ; arbitrary values of an extension outside Λ must not change the object.

### 15. Heegner-system base locus

`HeegnerPointEulerSystems:HE.6/heegner-base-locus` — definition. Suggested name: `TauCeti.Heegner.baseLocus`.

For the actual family and localization maps, B(κ) is the set of primes ℓ∤D_KNp such that loc_ℓc(n)=0 for every n∈Λ. These are arbitrary good primes, not only Kolyvagin primes. The dependent local cohomology carriers may vary with ℓ. This locus determines exactly which local conditions are relaxed in Zhang Lemma8.4.

**Construction/proof.**

1. Specialize the support/vanishing condition to the actual Heegner family, with the declared conductor set Λ.
2. Keep the empty/zero-system value and exclude bad primes exactly as in Zhang8.3.
3. Use the displayed API to state the triangular/relaxed Selmer theorem without unfolding the definition.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `EulerSystemsAndKolyvaginSystems:ES.1`; `mathlib:Nat.primeFactorsList`.

**Uses.**

- Zhang Definition8.3, Lemma8.4, Theorems9.1/9.3, pp.236–243 — The induction uses the minimum conductor size and relaxing local conditions at the base locus to prove nonvanishing.

**API.**

- `TauCeti.Heegner.baseLocus` (constructor): The good primes outside D_KNp with all actual Heegner-class localizations zero.
- `TauCeti.Heegner.baseLocus_mem` (characterisation): ℓ∈B iff ℓ is prime, ℓ∤D_KNp, and every n∈Λ has loc_ℓc(n)=0.
- `TauCeti.Heegner.baseLocus_support_congr` (extensionality): If the localizations of two families agree at every good prime and conductor in Λ, their base loci agree.
- `TauCeti.Heegner.baseLocus_zero` (simp): The zero family has every prime outside D_KNp in its base locus.

**Unit tests.**

- `TauCeti.Heegner.baseLocus_zero_system` (degenerate): For the zero class family, membership is exactly primality and prime-to-D_KNp.
- `TauCeti.Heegner.baseLocus_nonzero_localization` (non-example): One nonzero localization at a conductor n∈Λ excludes that prime from the locus.
- `TauCeti.Heegner.baseLocus_coefficient_prime` (compatibility): The coefficient prime p is never in the locus; in particular 5 is excluded when p=5 even if all classes vanish.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Definition8.3, published p.236, PDF46; Lemma8.4 and proof pp.236–239. The two support definitions are explicitly stated and used in the triangular basis and nonvanishing proofs.

**Acceptance.** Quantify over every prime away from D_KNp, not only the auxiliary Kolyvagin prime set. Use all conductors in Λ and the actual dependent localization maps; values outside Λ do not change the locus.

### 16. Residual Heegner local pairing

`HeegnerPointEulerSystems:HE.6/zhang-residual-local-pairing` — theorem. Suggested name: `TauCeti.Heegner.zhang_residual_local_pairing`.

Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. For each inert Kolyvagin prime ℓ∤ND_Kp with a_ℓ≡ℓ+1≡0 mod𝔭, H¹(K_ℓ,V) has dimension4 over k₀, with finite and transverse two-dimensional maximal isotropic subspaces. Each ± conjugation component of either subspace has dimension1, and local Tate duality pairs the same signs perfectly. The pairing V×V→k₀(1) is alternating, G_Q-equivariant; conjugation acts by −1 on its values.

**Construction/proof.**

1. Descend the polarized residual representation and the local conditions to k₀ using Zhang’s rational structure.
2. At ℓ, Frobenius over Q has eigenvalues ±1 while Frobenius over K is its square; compute finite and tame/transverse cohomology.
3. Use the cyclotomic multiplier −1 and the local invariant map to obtain the same-sign perfect pairings.

**Prerequisites.** `SelmerIwasawaCohomology:L1`; `EulerSystemsAndKolyvaginSystems:ES.1`; `HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §8.1 pp.234–235; Notations §1.4 pp.199–203; §5 pp.222–225 These are the actual V/k₀ local carriers and pairings used in Lemma8.4, rather than the classical E[p]/F_p hypotheses.

**Acceptance.** Check dimensions over k₀ before extension to k; keep finite and transverse subspaces distinct. At ℓ=p this calculation is inapplicable.

### 17. Residual Heegner reciprocity

`HeegnerPointEulerSystems:HE.6/zhang-residual-heegner-relations` — theorem. Suggested name: `TauCeti.Heegner.zhang_residual_heegner_relations`.

Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. The actual k₀-rational derivative classes c(n) satisfy c(n)_v∈H¹_fin(K_v,V) for v∤n, c(n)_ℓ∈H¹_tr(K_ℓ,V) for ℓ|n, and c(nℓ)_ℓ=ψ_ℓ(c(n)_ℓ) when ℓ∤n, where ψ_ℓ:H¹_fin≃H¹_tr is the normalized finite/transverse comparison. Conjugation acts on c(n) by ε_n=w_g(−1)^(ν(n)+1), where w_g is Zhang’s root number convention. All bad places and v|p use the actual Kummer condition; the relation is not inferred from Howard’s elliptic full-Tate-image correction.

**Construction/proof.**

1. Use the actual quaternionic Heegner tower, compatible generators and V/k₀ rational descent in §§3–5.
2. Normalize the local comparison using the reduction/norm identities to obtain (8.1).
3. Apply (3.24), including the extra bottom-class minus sign, and verify all non-support local conditions.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/zhang-residual-local-pairing`; `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`; `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`; `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`; `EulerSystemsAndKolyvaginSystems:ES.3`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §8.1, equation(8.1), printed p.235; equation(3.24), printed p.213. The finite/transverse relation and parity are explicitly imposed on the actual rational Heegner family.

**Acceptance.** Check the bottom sign ε_1=−w_g; use the transverse condition only at conductor primes. Changing derivative generators changes the normalized comparison compatibly.

### 18. Simultaneous residual prime detection

`HeegnerPointEulerSystems:HE.6/zhang-two-class-prime-detection` — theorem. Suggested name: `TauCeti.Heegner.zhang_two_class_prime_detection`.

Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. For two k₀-linearly independent classes c₁,c₂∈H¹(K,V) and any finite excluded set, there is a positive-density set of inert Kolyvagin primes ℓ outside it with loc_ℓ(c₁)≠0 and loc_ℓ(c₂)≠0. In particular nonzero classes in opposite conjugation eigenspaces can be detected simultaneously.

**Construction/proof.**

1. Restrict to the finite torsion field and form the joint finite Kummer extension of the two actual residual classes.
2. Use full GL₂(k₀) image and the k₀ evaluation pairing to select a conjugation-compatible element avoiding both annihilator hyperplanes; the independent classes must be checked before this choice.
3. Apply Chebotarev to its conjugacy class, excluding ramification, level, discriminant, p and the prescribed finite set.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/zhang-residual-local-pairing`; `EulerSystemsAndKolyvaginSystems:ES.1`; `ArithmeticGaloisDuality:R02.2`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Lemma8.1, p.235; proof refers to McCallum Proposition3.1 The arithmetic hypotheses are Zhang’s surjective residual V/k₀ representation; the general evaluation/selection argument is requested from ES.1.

**Acceptance.** Do not assert simultaneous detection for arbitrary dependent classes or replace k₀ by F_p. Finite avoidance must allow previously selected conductor primes.

### 19. Residual ramification selection

`HeegnerPointEulerSystems:HE.6/zhang-prescribed-ramification-class` — theorem. Suggested name: `TauCeti.Heegner.zhang_prescribed_ramification_class`.

Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. For a Kolyvagin prime ℓ and a finite set S of other Kolyvagin primes, each conjugation eigenspace contains a nonzero global class with finite local condition outside S∪{ℓ}, transverse condition at S, and no condition at ℓ. This existence statement does not assert that its singular localization at ℓ is nonzero.

**Construction/proof.**

1. Apply the imported strict/relaxed Poitou–Tate comparison to the actual self-dual V/k₀ local conditions.
2. Use the one-dimensional same-sign local quotient at ℓ and finite/transverse duality to get a nonzero class in each sign.
3. In the triangular induction prove singular nonvanishing separately, by reciprocity against a simultaneously detected Heegner class.

**Prerequisites.** `HeegnerPointEulerSystems:HE.6/zhang-residual-local-pairing`; `EulerSystemsAndKolyvaginSystems:ES.1`; `SelmerIwasawaCohomology:L1`.

**Source.** [Wei Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Lemma8.2 and proof, p.235; Lemma8.4 pp.236–239 The conclusion permits an unrestricted local condition at the distinguished prime; the one-term reciprocity argument supplies nonzero singular localization.

**Acceptance.** The omitted local condition at ℓ is not a prescribed nonzero singular value. Use the actual p/bad-prime finite Kummer conditions in duality.

**Remaining supplier/refinement work.** Exact local-type level raising with its quaternionic transports, the Shimura-set realisation of the transfer, the Skinner–Urban form of the main conjecture with its rank-zero specialisation for GL₂-type coefficients, Kato’s integral bound under Skinner’s conditions, the self-dual primitivity equality and generic ES.1 interfaces are requested with complete contracts. Howard’s DVR theorem, the primitivity definition, Kato’s Theorem17.4 and the definite period export are cited declarations of packets not yet accepted. Typed V/k₀ continuous cohomology/local comparison and the global Howard χ localization remain prototype/supplier gaps; arithmetic specializations and triangular proof route are now explicit. The Zhang branch is the proposed sub-layer HE.6z. Until it is a stage, the link ModularIwasawaMainConjectures L1 → HE.6 derived from Zhang7.1 places Howard’s and Gross’s theorems after HE.8 and the main conjecture in the stage order.


## HE.7. Integral classical descent and full Sha finiteness

**Planets:** Prime divisibility of the non-torsion Heegner point; Non-CM open-image application; Almost-all primary Sha vanishing; Arithmetic derivative denominators at exceptional primes; Dyadic integral conjugation descent; Classical full Sha finiteness.

The complete integral CM-point setup and constants above apply wherever the statement repeats them. The primary proof does not require an eigenformula for the CM point under conjugation. This part specializes the character to1; the nonquadratic-character theorem in Nekovář7.6 is not an additional target. Serre’s open-image theorem is imported, not proved here: its owner is the Part II of FaltingsFinitenessAndIsogenyTheorems on ℓ-adic and residual images of abelian varieties, which is not yet a roadmap of the atlas.

### 1. Prime divisibility of the non-torsion Heegner point

`HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility` — theorem. Suggested name: `TauCeti.Heegner.non_torsion_point_prime_divisibility`.

For non-torsion y_K∈E(K), Mordell–Weil finite generation implies y_K∉pE(K) for every prime outside a finite set. This is proved before assuming rank one or a finite Heegner index: project to the free Mordell–Weil quotient and use a nonzero coordinate. Once rank one has been proved, the index of Z·y_K in the free quotient is finite; it is distinct from an index in E(K) that includes rational torsion.

**Construction/proof.**

1. Import Mordell–Weil finite generation.
2. Choose a nonzero free coordinate of y_K and exclude its finite set of prime divisors.
3. After clean descent proves rank one, identify the one-dimensional lattice index without circularly using it earlier.

**Prerequisites.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`; `HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §2 pp.237–238; §1 pp.236–237 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 2. Non-CM open-image application

`HeegnerPointEulerSystems:HE.7/non-cm-open-image-application` — theorem. Suggested name: `TauCeti.Heegner.non_cm_open_image_application`.

For non-CM E/Q, import Serre’s open-image theorem to conclude that Q(E[p])/Q has full GL₂(F_p) image for all but finitely many p, and apply it to the actual Heegner setting. More generally obtain the required uniform cohomological restriction/invariant bounds from the open adelic/Tate image over a number field, retaining the cyclotomic determinant and base-field index. For admissible GL₂-type RM quotients import the precise Ribet big-image variant; do not replan either generic theorem in HE.7.

**Construction/proof.**

1. Import Serre’s theorems from their owner, the Part II of FaltingsFinitenessAndIsogenyTheorems on ℓ-adic and residual images of abelian varieties (Serre’s open-image theorems).
2. For E/Q combine the almost-all residual image with the previous prime-divisibility lemma.
3. For exceptional primes use only the exported finite index/cohomological bounds and their exact field/endomorphism hypotheses.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility`; `FaltingsFinitenessAndIsogenyTheorems:R28.4`; `ArithmeticGaloisRepresentations:R01.4`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §2 p.237; §12 pp.254–256 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 3. Almost-all primary Sha vanishing

`HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing` — theorem. Suggested name: `TauCeti.Heegner.almost_all_primary_sha_vanishing`.

For the classical non-CM non-torsion Heegner setting, outside a finite set of primes the Gross clean theorem gives Sha(E/K)[p]=0. Since Sha is torsion, this implies Sha(E/K)[p∞]=0: any nonzero p-primary element would yield nonzero p-torsion after taking a suitable p-power multiple. This does not require proving finite p-primary groups first. For CM E use the separate CM-character branch: the uniform integral constants vanish outside a finite set and the finite-level Kummer quotient then forces Sha[p∞]=0. For the specified RM quotients the same reasoning applies at coefficient primes 𝔭; there are finitely many exceptional coefficient primes, not a tacit residual-surjectivity assumption.

**Construction/proof.**

1. Combine non-CM almost-all image and point indivisibility with Gross’s clean mod-p theorem.
2. Apply the elementary p-primary torsion argument to the actual Sha carrier.
3. Retain the finite exceptional set containing p=2 and all failures of the clean hypotheses.
4. In the CM/RM branch use the actual zero C_i and the integral Selmer bound, before the finite-primary sum; retain every exceptional coefficient prime.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`; `HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `HeegnerPointEulerSystems:HE.7/cm-character-error-descent`; `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §2 pp.237–238 and Proposition2.1 The passage gives the stated construction or result; the proof outline separates imported general theory from its arithmetic application. [Jan Nekovář](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §3.5.2 p.19; §§6.1–6.2 pp.35–37; §7.4 p.45; locators use the 53-page author preprint, not published pagination. The cited proof supplies the integral arithmetic construction and uniform estimates; reusable representation, linear algebra and descent results are imported through their owners.

**Acceptance.** Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

### 4. Arithmetic derivative denominators at exceptional primes

`HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators` — theorem. Suggested name: `TauCeti.Heegner.bounded_arithmetic_derivative_denominators`.

Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). For each 𝔭 and each M≫0 with 𝔭^M principal, the actual CM tower supplies integral c(n)∈H¹(K(x),A[𝔭^M]) without requiring vanishing of torsion invariants. At v∤n its image in H¹(K(x)_v,A)[𝔭^M] is an unramified component-group class, killed by 𝔭^C₁,v where C₁,v kills the geometric 𝔭-primary Néron component group. With C₁=max_v C₁,v, κ_n=𝔭^C₁ cor_K(x)/K c(n) satisfies the actual finite Kummer conditions outside n, κ₁=𝔭^C₁δ(y), and its singular localization at ℓ is −Φ_ℓ Fr(ℓ)κ_n/ℓ. C₁ is independent of M,n and zero for almost all 𝔭; cusp/Hodge and quotient denominators are fixed in ι_A. For classical E use its given modular quotient, absorbing the fixed cusp annihilator and isogeny degree. C₂,C₃ bound evaluation errors, not an inverse of restriction.

**Construction/proof.**

1. Choose the conductor-chain points x(n) with local uniformizers. For r>0 use y(n)=u₀Tr_K(x(n))/K(x(n))₀ ι_A(x(n)); the source’s u(r)=1, while u(0)=u₀. Import ES.3’s positive cyclic derivatives with (σ−1)D=(Nℓ+1)/u₀−Norm.
2. The strongly admissible S₁(M) conditions ensure integral a_ℓ/𝔭^M and (Nℓ+1)/(u₀𝔭^M). On each cyclic generator define the finite cocycle value D_n/ℓ[(a_ℓ/𝔭^M)y(n/ℓ)−((Nℓ+1)/(u₀𝔭^M))y(n)]. Norm zero and the commuting generator identities prove it is a cocycle (Lemma5.8).
3. Choose z with 𝔭^Mz=D_ny(n), inflate the finite cocycle and add (g−1)z as in §§5.9–5.10. The result is torsion-valued and restricts to the actual Kummer class; changing z is a coboundary. No restriction equivalence or torsion-invariant vanishing is assumed.
4. Apply §5.12’s geometric component-group obstruction at every v∤n, including coefficient and bad primes. Multiply once by 𝔭^C₁ and corestrict; good components vanish and the finitely many bad geometric groups give C₁=0 for almost all 𝔭.
5. Use the trace-compatible finite/singular calculation §§5.15–5.18, retaining its minus sign and ΦFr=−FrΦ. The fixed integral ι_A map absorbs the Hodge/cusp degree at the start.

**Prerequisites.** `HeegnerPointEulerSystems:HE.4/differentiated-point-invariance`; `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`; `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`; `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`; `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`; `HeegnerPointEulerSystems:HE.7/integral-cm-prime-detection`; `EulerSystemsAndKolyvaginSystems:ES.3`; `NeronModelsAndSemistableAbelianVarieties:R11.2`; `ArithmeticGaloisDuality:R02.2`.

**Source.** [Jan Nekovář](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §1.19 pp.14–15; §§4.8–4.13 pp.25–27; §§5.8–5.12 pp.29–30; §§5.15–5.18 pp.31–33; §7.2.1 p.44; locators use the 53-page author preprint, not published pagination. The cited proof supplies the integral arithmetic construction and uniform estimates; reusable representation, linear algebra and descent results are imported through their owners.

**Acceptance.** Check integral cocycle values at p=2 and nonzero torsion invariants. C₁ uses geometric component groups; their rational points alone do not bound all local obstructions. All constants are independent of torsion level; principal powers form a cofinal sequence.

### 5. Dyadic integral conjugation descent

`HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent` — theorem. Suggested name: `TauCeti.Heegner.dyadic_integral_conjugation_descent`.

Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). The integral two-prime descent applies at every coefficient prime, including 𝔭|2. Write C₀=max{c:y∈A(K)_tors+𝔭^cA(K)}, C₆=v_𝔭(degφ) for a fixed F-polarization, and C₁,C₂,C₃ as above; C₅=v_𝔭[K:K]=0 in this trivial-character part. For M≫0, 2²¹𝔭^(2C₀+2C₁+4C₂+4C₃+C₅+C₆) annihilates Sel(A/K,𝔭^M)/O_𝔭κ₁. Thus B=2C₀+2C₁+4C₂+4C₃+C₆+21v_𝔭(2) is independent of M. Integral (1±ρ) is retained; no decomposition using (1±ρ)/2 is made. All archimedean places of K are complex, so their local H¹ is zero. Any comparison back to a real place of F uses the fixed Tate correction killed by2, as specified in HE.3, rather than an odd-prime invariant argument.

**Construction/proof.**

1. Choose a sign ε with exp((1+ερ)κ₁)≥M−C₀−C₁−v_𝔭2 using 2κ₁=(1+ρ)κ₁+(1−ρ)κ₁.
2. Apply actual integral prime detection to the leading component and an opposite-sign class. Reciprocity and the polarization pairing bound the opposite space by exponent C₀+C₁+2C₂+2C₃+C₅+C₆+11v_𝔭2.
3. Choose a second prime detecting the new opposite-sign derivative and a same-sign class in the first localization kernel. Reciprocity with n=ℓℓ′ gives the kernel bound 2¹⁵𝔭^(C₀+C₁+3C₂+3C₃+C₅+C₆).
4. Combine the cyclic finite local image, this kernel and the opposite-space bound, keeping all integral intersection factors2. Apply ES.4’s reusable arithmetic bound with the now verified constants to obtain the displayed factor2²¹.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`; `HeegnerPointEulerSystems:HE.7/integral-cm-prime-detection`; `EulerSystemsAndKolyvaginSystems:ES.4`; `SelmerIwasawaCohomology:L1`; `HeegnerPointEulerSystems:HE.3/archimedean-tate-correction`; `ArithmeticGaloisDuality:R02.4`.

**Source.** [Jan Nekovář](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §5.19 pp.33–34; Proposition7.2.3 pp.44–45; §§7.4–7.5 pp.45–47; locators use the 53-page author preprint, not published pagination. The cited proof supplies the integral arithmetic construction and uniform estimates; reusable representation, linear algebra and descent results are imported through their owners.

**Acceptance.** Preserve the actual exponents21,11,15 and the polarization defect; they are annihilator bounds, not Sha orders. The proof works for geometric CM provided no CM is defined over K.

### 6. CM character descent and error bounds

`HeegnerPointEulerSystems:HE.7/cm-character-error-descent` — theorem. Suggested name: `TauCeti.Heegner.cm_character_error_descent`.

For a classical CM E/Q, K as in the CM/Heegner-field node, and non-torsion bottom Heegner point, the two conjugate CM Tate characters over KM verify the integral matrix-algebra and homothety bounds over K. The explicit cocycle classes and the integral two-prime descent give the same uniform exponent B at all rational primes, including 2. C₀,C₁,C₂,C₃,C₆ and v_p2 are zero outside a finite set, so Sha(E/K)[p∞]=0 there. This branch uses the semilinear CM character representation, not Serre’s non-CM GL₂ surjectivity.

**Construction/proof.**

1. Verify M≠K and the two-character recombination over K from the preceding CM-field comparison.
2. Apply the rational endomorphism/Burnside and almost-all residual irreducibility estimates, as in Nekovář6.2. These remain valid even though the residual group is contained in a Cartan normalizer.
3. Apply the actual explicit cocycle and integral two-prime construction over K; the degree-two CM-character restriction comparison has fixed 2-primary loss, not a level-dependent denominator.
4. Use C_i=0 almost everywhere and the finite Kummer exact sequences to obtain rank1 and almost-all primary vanishing, then combine the exceptional-primary bounds.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/cm-heegner-field-disjointness`; `HeegnerPointEulerSystems:HE.7/integral-tate-image-errors`; `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`; `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`; `ComplexMultiplicationAndExplicitReciprocity:CM.4`; `EulerSystemsAndKolyvaginSystems:ES.4`.

**Source.** [Jan Nekovář](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), Theorem3.2 pp.18–19; §§6.1–6.2 pp.35–37; Theorem7.3 and §7.5 pp.45–47; locators use the 53-page author preprint, not published pagination. The cited proof supplies the integral arithmetic construction and uniform estimates; reusable representation, linear algebra and descent results are imported through their owners.

**Acceptance.** Do not move the global descent to KM, where condition(?) fails. Almost-all primary vanishing needs the vanishing of the actual C_i, not full GL₂ image.

### 7. Exceptional primary Sha exponent bound

`HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound` — theorem. Suggested name: `TauCeti.Heegner.exceptional_primary_sha_bound`.

Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). For each 𝔭 the finite-level Selmer quotient by κ₁ is killed uniformly by 𝔭^B, with B=2C₀+2C₁+4C₂+4C₃+C₆+21v_𝔭2. Since κ₁ lies in the Kummer image, Sha(A/K)[𝔭^M] is killed by 𝔭^B for every sufficiently large principal M, hence the entire 𝔭-primary group is killed by 𝔭^B. Finite-level Selmer finiteness at this fixed bound makes the primary group finite. The cofinal principal exponents are sufficient; separate finiteness at each M without a uniform B is insufficient.

**Construction/proof.**

1. Apply the verified integral two-prime bound through the finite Kummer exact sequence.
2. Every 𝔭-primary Sha element belongs to one cofinal principal-exponent torsion group; the fixed B kills it.
3. Use finiteness of Sha[𝔭^B], supplied by finite Selmer theory for this abelian variety, to obtain a single finite carrier containing the entire primary part.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`; `EulerSystemsAndKolyvaginSystems:ES.4`; `SelmerIwasawaCohomology:L0`; `ArithmeticGaloisDuality:R02.2`.

**Source.** [Jan Nekovář](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §3.5 p.19; §7.1.2 p.43; Theorem7.3 and proof pp.45–47; locators use the 53-page author preprint, not published pagination. The cited proof supplies the integral arithmetic construction and uniform estimates; reusable representation, linear algebra and descent results are imported through their owners.

**Acceptance.** Use a fixed-exponent finite Selmer group, not a limit of unrelated finite carriers. The Selmer quotient bound implies an annihilator of Sha, not a square-index order formula.

### 8. Classical full Sha finiteness

`HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness` — theorem. Suggested name: `TauCeti.Heegner.classical_full_sha_finiteness`.

Let E/Q have a fixed modular quotient X₀(N)→E, K imaginary quadratic with D_K≠−3,−4 and all N-primes split, and y_K=Tr_K[1]/K P₁ of infinite order. Then rank E(K)=1 and the entire Sha(E/K) is finite, including CM E and p=2. The uniform integral Selmer bound gives rank1: the non-torsion Kummer line has finite-index quotient at any coefficient prime; it also gives finite exceptional primary groups and almost-all primary vanishing. The quantitative square-index order theorem is stated separately and is not inferred from this exponent argument.

**Construction/proof.**

1. Specialize the integral CM-point setup to F=Q, B=M₂(Q), N_U*=X₀(N) and the given quotient. The fixed cusp annihilator multiplies y_K by a nonzero integer and cannot destroy non-torsion.
2. For non-CM E condition(?) holds; for CM E verify it using the CM/Heegner-field comparison. Apply the uniform quotient bound at one prime and Mordell–Weil finite generation to get rank1 without a prior index assumption.
3. Apply almost-all primary vanishing and the fixed exceptional-primary bounds. The torsion-primary decomposition identifies Sha with a finite direct sum of finite primary groups.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`; `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`; `HeegnerPointEulerSystems:HE.7/cm-heegner-field-disjointness`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`.

**Source.** [Jan Nekovář](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), Theorem3.2 pp.18–19; §7.4 p.45; §7.5 pp.45–47; locators use the 53-page author preprint, not published pagination. The cited proof supplies the integral arithmetic construction and uniform estimates; reusable representation, linear algebra and descent results are imported through their owners. [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Theorem1.3 pp.236–237 (quoted classical endpoint) Gross states the classical endpoint; the integral proof route used here is Nekovář’s specialization, including exceptional and dyadic primes.

**Acceptance.** Retain the given modular parametrization and bottom trace, not a point over K[1] without trace. Rank must be established before assigning a finite Mordell–Weil index. No primary component may be omitted.

### 9. Admissible RM Kolyvagin–Logachev application

`HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev` — theorem. Suggested name: `TauCeti.Heegner.admissible_rm_kolyvagin_logachev`.

Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). Then A(K)/O_Ly is finite, rank_Z A(K)=[L:Q]=dim A, and the entire Sha(A/K) is finite. This is the trivial-character specialization of Nekovář3.2 and includes the specified quaternionic/RM quotients, with field, ramification, central quotient, maximal endomorphism order, Hecke map and integral Hodge normalization stated above. An analytic rank-d conclusion additionally requires a supplier height formula proving this particular y is non-torsion from ord_s=1 L(A/K,s)=d; analytic rank alone is not an input to descent.

**Construction/proof.**

1. Use the specified quaternionic Jacobian quotient and integral CM-point trace, importing their carriers from R18 and the abelian-variety roadmap.
2. Verify the no-CM-over-K condition and rank-two coefficient Tate realization. Apply the explicit cocycle, actual prime detection and uniform Selmer quotient bound at every coefficient prime.
3. Use finite generation to deduce rank1 over O_L and hence rank dim A over Z. The bounded primary groups and almost-all vanishing imply full Sha finiteness by torsion decomposition.
4. For a modular analytic-rank application request the exact GZ.8 height/nonvanishing export for this quotient and CM field, and verify it before invoking the geometric theorem.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/integral-tate-image-errors`; `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`; `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`; `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`; `EulerSystemsAndKolyvaginSystems:ES.4`; `HilbertModularVarietiesAndShimuraCurves:R18.1`; `HilbertModularVarietiesAndShimuraCurves:R18.4`; `GrossZagierAndArithmeticHeights:GZ.8`; `SelmerIwasawaCohomology:L0`.

**Source.** [Jan Nekovář](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §§3.1–3.2 pp.18–19; §7.1 pp.43–44; §§7.3–7.5 pp.45–47; locators use the 53-page author preprint, not published pagination. The cited proof supplies the integral arithmetic construction and uniform estimates; reusable representation, linear algebra and descent results are imported through their owners.

**Acceptance.** No unspecified admissibility: check F,B,U,K,t,x, End_F(A)=O_L and the nontrivial Hecke-linear map. Use the integral m(P−δ) map, even when the curve is geometrically disconnected. For nonmaximal endomorphism orders supply a fixed isogeny comparison and its local degree errors before using this maximal-order statement.

### 10. Integral Tate image errors

`HeegnerPointEulerSystems:HE.7/integral-tate-image-errors` — theorem. Suggested name: `TauCeti.Heegner.integral_tate_image_errors`.

Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). For each coefficient prime 𝔭 of O_L, T=T_𝔭A is free rank2 over O_𝔭. For H_M=K(A[𝔭^M]), there are C₂(𝔭),C₃(𝔭)≥0 independent of M such that restriction H¹(K,A[𝔭^M])→H¹(H_M,A[𝔭^M]) has kernel killed by 𝔭^C₂ and the image of O_𝔭[G_K] in End_O𝔭(T) contains 𝔭^C₃ End_O𝔭(T). Both constants vanish for all but finitely many 𝔭. The image assertion uses absence of CM over K, not absence of geometric CM.

**Construction/proof.**

1. Import Bogomolov/Serre homothety openness and its index uniformity over coefficient primes. A central scalar u acts trivially by conjugation on cohomology, so u−1 kills H¹ of the finite image; take C₂=v_𝔭(u−1).
2. Import the condition(?)/absolute-irreducibility equivalence of the actual GL₂-type representation, via Faltings and the CM character/self-twist dictionary. Burnside gives a full rational matrix algebra; the integral image has finite lattice index, giving C₃ independent of M.
3. For almost all coefficient primes import residual absolute irreducibility over F, restrict to G_K using Clifford theory, and exclude the one quadratic self-twist. If the twist occurred at infinitely many primes, trace congruences would imply a rational self-twist, contrary to condition(?). Nakayama/Burnside give C₃=0.

**Prerequisites.** `FaltingsFinitenessAndIsogenyTheorems:R28.4`; `ArithmeticGaloisRepresentations:R01.4`; `ComplexMultiplicationAndExplicitReciprocity:CM.4`; `ArithmeticGaloisDuality:R02.2`; `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`.

**Source.** [Jan Nekovář](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §§6.1–6.2, pp.35–37, Propositions6.1.2,6.2.1–6.2.2; locators use the 53-page author preprint, not published pagination. The cited proof supplies the integral arithmetic construction and uniform estimates; reusable representation, linear algebra and descent results are imported through their owners.

**Acceptance.** Do not request full GL₂ surjectivity for a CM curve. C₂,C₃ are fixed before increasing M; distinguish restriction kernel from the derivative-class construction.

### 11. Integral CM prime detection

`HeegnerPointEulerSystems:HE.7/integral-cm-prime-detection` — theorem. Suggested name: `TauCeti.Heegner.integral_cm_prime_detection`.

Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). For M≫0 with 𝔭^M principal, and a finite O_𝔭/𝔭^M-submodule W₀ of H¹(K,A[𝔭^M]), the actual finite Kummer extension over H_M has an evaluation map whose kernel loss is bounded by C₂ and whose evaluation cokernel is killed by 𝔭^C₃. For ρ-stable W₀, conjugation-compatible detection uses integral 1±ρ and factors2,4,16, with loss C₂+C₃+4v_𝔭(2). It supplies inert good primes in S₁(M), excluding any fixed finite set, with the prescribed detections. S₁(M) requires Frobenius conjugate to ρ in K(x)(A[𝔭^(M+M₀)])/F, M₀=v_𝔭(u₀), hence a_ℓ≡0 and Nℓ+1≡0 mod𝔭^(M+M₀).

**Construction/proof.**

1. Form the finite field cut out by the restricted actual classes; its evaluation injection is the arithmetic Kummer pairing.
2. Import ES.4’s Nekovář6.4.3 maximal-order pairing theorem to bound the evaluation cokernel, then compose with restriction and retain C₂+C₃.
3. Use 2X⁺⊂O_𝔭G⁺ and (ρg)²=g² in 2G⁺ rather than integral half-projectors. The finite-union avoidance argument gives simultaneous detection with the four dyadic valuation losses.
4. Apply Chebotarev to ρg in the joint torsion/Kummer field: its inert prime satisfies the stronger torsion congruence, unit-stabilizer condition and finite exclusions; evaluate localization at (ρg)².

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/integral-tate-image-errors`; `EulerSystemsAndKolyvaginSystems:ES.4`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`.

**Source.** [Jan Nekovář](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §§5.1–5.2 pp.27–28; §§6.3–6.5 pp.37–41; locators use the 53-page author preprint, not published pagination. The cited proof supplies the integral arithmetic construction and uniform estimates; reusable representation, linear algebra and descent results are imported through their owners.

**Acceptance.** Evaluation must come from the actual finite Kummer field. Nℓ+1 must be divisible by u₀𝔭^M; omit primes whose conductor kills the unit-stabilizer comparison. Never divide by2 in the integral conjugation module.

### 12. CM and Heegner fields

`HeegnerPointEulerSystems:HE.7/cm-heegner-field-disjointness` — theorem. Suggested name: `TauCeti.Heegner.cm_heegner_field_disjointness`.

Let E/Q have CM by an imaginary quadratic field M, conductor N, and let K be a classical Heegner field in which every prime dividing N splits. Then M≠K, M∩K=Q, and E does not acquire its CM endomorphisms over K. Over KM the coefficient-extension Tate representation splits into the two conjugate CM characters; G_K exchanges them through Gal(KM/K), so the rational representation over K is absolutely irreducible. This verifies the α=1 condition(?) and matrix-algebra hypothesis of the integral descent, although its residual image need not be full GL₂.

**Construction/proof.**

1. Import CM.4’s induced CM-character Tate realization and R01.3’s induction conductor formula: N=|D_M|Norm_M/Q(f_ψ) for the associated algebraic Hecke character of infinity type(1,0), with the usual elliptic modular weight-two realization. Only |D_M| dividing N is needed.
2. An imaginary quadratic discriminant has a ramified rational prime. That prime divides N and cannot split if K=M; conclude M≠K and [KM:K]=2.
3. Import the endomorphism-field and two distinct conjugate-character dictionary. Recombine the two lines under the degree-two action; do not apply the rank-one-CM-field representation to the G_K descent.
4. Integral restriction/corestriction over KM/K has composite2 and hence fixed dyadic loss; the actual derived classes and global duality remain over K, where condition(?) holds.

**Prerequisites.** `ComplexMultiplicationAndExplicitReciprocity:CM.4`; `ArithmeticGaloisRepresentations:R01.3`; `HeegnerPointEulerSystems:HE.7/integral-tate-image-errors`.

**Source.** [Jan Nekovář](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §3.2 pp.18–19; Proposition6.2.1 pp.35–36 (CM/self-twist/irreducibility dictionary); locators use the 53-page author preprint, not published pagination. The cited proof supplies the integral arithmetic construction and uniform estimates; reusable representation, linear algebra and descent results are imported through their owners.

**Acceptance.** The conductor formula is a requested CM/R01 export, not a theorem proved in Nekovář. Do not apply Nekovář’s condition(?) over KM itself, where CM is defined. A geometric CM curve is allowed over K; K equal to its CM field is excluded by the Heegner condition.

### 13. Classical square-index bound

`HeegnerPointEulerSystems:HE.7/classical-square-index-error-bound` — theorem. Suggested name: `TauCeti.Heegner.classical_square_index_error_bound`.

In the classical setting of the full-finiteness node, put O=End_overlineQ(E), Q_O=O⊗Q, embedded in overlineQ through the chosen CM type when O≠Z. Let B(E) consist of odd primes ℓ∤disc(O) such that the O_ℓ-linear representation G_Q_O→Aut_Oℓ(T_ℓE) is surjective. There is a positive integer d_E independent of K with v_ℓ(d_E)=0 for ℓ∈B(E) and #Sha(E/K) dividing d_E I_K², where I_K=[E(K):Zy_K] includes rational torsion and is defined after rank1 is proved. For non-CM E, Q_O=Q and Aut_Oℓ=GL₂(Z_ℓ); for CM E use the linear Cartan action over Q_O, not full GL₂ over Q. B(E) is a full Tate-image criterion and is not silently replaced by a residual-image criterion at the small primes. Gross writes the related error bound as t_E/K I_K²; no explicit value or optimality of either constant is asserted.

**Construction/proof.**

1. Import ES.4’s classical size bound with the actual Heegner derivative and error data. This is a stronger theorem than the two-prime annihilator estimate; its requested contract must control the cardinality, not just the exponent.
2. Verify the modular point, coefficient-prime and integral error hypotheses from HE.4–HE.7, retaining the source’s full Mordell–Weil index.
3. Combine the size bounds prime by prime, using the clean odd-prime square-index bound where applicable and finite exceptional support. The original Euler Systems proof is a precise source-acquisition gap for the requested generic size theorem, not a claimed proof in the read exposition.

**Prerequisites.** `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`; `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`; `HeegnerPointEulerSystems:HE.7/cm-character-error-descent`; `EulerSystemsAndKolyvaginSystems:ES.4`.

**Source.** [Benedict H. Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Theorem1.3, p.236 This source quotes the classical square-index bound and describes its exceptional support; its clean proof does not establish the exceptional size theorem. [V. A. Kolyvagin](https://www.wstein.org/papers/bib/kolyvagin-structure_of_sha.pdf), TheoremA, p.95; introduction pp.94–97 The author quotes the stronger d C_K² order theorem from his Euler Systems paper, with d depending on E and C_K including torsion. It is not derived from Nekovář’s annihilator theorem.

**Acceptance.** Separate exponent from cardinality and full Mordell–Weil index from free-lattice index. The denominator of the Galois group in Kolyvagin’s B(E) is Q_O=O⊗Q, not always Q. The group is O_ℓ-linear over the CM field. Keep the full Tate-image good-prime condition, especially at3; do not change it to mod-ℓ surjectivity without a separate lifting theorem. The ES.4 size export must retain the source-specific hypotheses and explicit original-proof acquisition boundary.

**Remaining supplier/refinement work.** Serre’s open-image theorems and the homothety/endomorphism/residual-irreducibility exports of the open-image Part II, CM.4/R01.3 conductor dictionary, GL₂-type finite Selmer and generic ES.4 pairing/two-prime exports remain requested. The classical square-index cardinality export requires the original Kolyvagin Euler Systems proof; the read primary author quotes are distinguished from Nekovář’s fully read integral annihilator proof. Production arithmetic carriers, nonmaximal-order isogeny extensions and the separately specified analytic RM height certificate remain precise prototype/supplier refinements.

## Cross-roadmap requests

A stage identifier routes each request to its owner. It asserts neither an existing fine declaration nor an already discharged need. Where a supplier’s packet has a declaration that states exactly what is needed, that declaration is cited by its id; a request to the same owner then asks only for what the declaration lacks. The sub-layer BSD.3a and the open-image Part II of FaltingsFinitenessAndIsogenyTheorems are not yet in the atlas; the packet uses existing owner stages until they are. Supplier files and atlas links are not changed here.

- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups** — Full local/global order carriers, proper invertible fractional ideal/idele comparison, order Picard extension exact sequence, unit indices, lattice trace duals and admissible ideal norm maps; instantiate existing Pic, never introduce another Picard group. Consumers: `HeegnerPointEulerSystems:HE.0/local-toral-order`, `HeegnerPointEulerSystems:HE.0/transported-global-order`, `HeegnerPointEulerSystems:HE.0/idele-ideal-class-comparison`, `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`, `HeegnerPointEulerSystems:HE.0/local-different-discriminant`.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields** — Ring-class existence in a fixed separable closure, Artin isomorphism for the order-unit quotient, conductor tower restriction/norm compatibility and local splitting/inertia description. An Artin map for an already given extension does not supply this. Consumers: `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `HeegnerPointEulerSystems:HE.0/dihedral-conjugation`, `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence** — Relative CM class fields for O_F+C O_K and quaternionic admissible open levels, with actual norm and tower maps. Consumers: `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`.
- **HilbertModularVarietiesAndShimuraCurves:R18.1** — Quaternionic admissible level subgroups for the specified CM embedding and Eichler order. Independent review: this is an exact quaternionic export request to R18, replacing the unrelated H4/H5 Hilbert contracts; the full optimal-embedding application remains HE.1 work. Consumers: `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`.
- **ComplexMultiplicationAndExplicitReciprocity:CM.1** — CM elliptic curve from proper invertible ideal, cyclic isogeny from the specified invertible level ideal, and ideal action on the pair. Consumers: `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`.
- **ComplexMultiplicationAndExplicitReciprocity:CM.2** — Main CM reciprocity on level-structured elliptic pairs, with arithmetic/geometric reciprocity convention comparison. Consumers: `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`.
- **ShimuraVarieties:V5** — Canonical model and CM reciprocity descent for these quaternionic level points; not merely a complex double coset. Consumers: `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`, `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`.
- **HilbertModularVarietiesAndShimuraCurves:R18.4** — Local optimal-embedding conditions for the order and Eichler level, including ramified quaternion places and a fixed archimedean CM type. Independent review: this is an exact quaternionic export request to R18, replacing the unrelated H4/H5 Hilbert contracts; the full optimal-embedding application remains HE.1 work. Consumers: `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`.
- **HilbertModularVarietiesAndShimuraCurves:R18.1** — Optimal-order embedding/local level conditions for the relative CM quaternionic curve. Independent review: this is an exact quaternionic export request to R18, replacing the unrelated H4/H5 Hilbert contracts; the full optimal-embedding application remains HE.1 work. Consumers: `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`.
- **ModularCurvesPartII:R14.1** — Existing X₀(N) cyclic-isogeny moduli object and complex/rational comparison for the specified integral level. Consumers: `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`.
- **GrossZagierAndArithmeticHeights:GZ.3** — Only normalized rational Hodge class, denominator clearing, modular quotient and degree comparison; not the Gross–Zagier height formula. Consumers: `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`.
- **EllipticCurveModularity:R29.5** — Defined modular quotient and Hecke/Fricke equivariance, including integral differential and Manin constant normalization. Consumers: `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`.
- **EllipticCurveModularity:R29.5** — Hecke eigenquotient transport of the actual divisor identities, with torsion basepoint terms and degree normalization. Consumers: `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`.
- **HilbertModularVarietiesAndShimuraCurves:R18.4** — Local lattice interpretation, P-new quotient and good/semistable quaternionic models with matched CM embeddings. Independent review: this is an exact quaternionic export request to R18, replacing the unrelated H4/H5 Hilbert contracts; the full optimal-embedding application remains HE.1 work. Consumers: `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`, `HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution`, `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`.
- **NeronModelsAndSemistableAbelianVarieties:R11.2** — Integral specialization of the fixed modular quotient, connected-part unramified H¹ vanishing, component sequence and exact Kummer defect. Consumers: `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence`, `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`.
- **NeronModelsAndSemistableAbelianVarieties:R11.6** — Quaternionic semistable integral model and specialization to the correct reduction-graph vertex, with Frobenius/Atkin–Lehner actions. Consumers: `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4** — Elliptic finite/p-adic Kummer maps, naturality with restriction/corestriction, continuous Tate-module coefficients, exact Selmer/Sha sequences and integral local comparison. Consumers: `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `HeegnerPointEulerSystems:HE.3/good-place-kummer-unramified`, `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`, `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`, `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`.
- **SelmerIwasawaCohomology:L0** — Continuous inverse-limit cohomology with compact T_pE, finite discrete reductions, lim¹/invariants and saturated integral-to-rational comparison. Consumers: `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`.
- **SelmerIwasawaCohomology:L1** — Local good-reduction Kummer/unramified comparison and Weil/Tate self-duality. Consumers: `HeegnerPointEulerSystems:HE.3/good-place-kummer-unramified`.
- **SelmerIwasawaCohomology:L2** — Precise ordinary-versus-finite integral local conditions and local-torsion defects. Consumers: `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4** — Good-reduction crystalline/Bloch–Kato Kummer comparison at v|p and integral lattice compatibility; finite-flat group definitions or a Hodge–Tate decomposition alone do not supply this. Use the Breuil–Kisin/integral comparison owner. Consumers: `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`.
- **ArithmeticGaloisDuality:R02.4** — Real-place Tate local conditions for E[p^m] and integral dyadic comparison. Consumers: `HeegnerPointEulerSystems:HE.3/archimedean-tate-correction`.
- **EulerSystemsAndKolyvaginSystems:ES.3** — Existing cyclic derivative, product identities, intrinsic cyclic tensor coefficients, choice transformation and descent/error interface. Do not replan these generic constructions here. Consumers: `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`, `HeegnerPointEulerSystems:HE.4/differentiated-point-invariance`, `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`, `HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence`, `HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility`, `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`.
- **ArithmeticGaloisRepresentations:R01.4** — Residual representation and image subgroup operations for the elliptic torsion/dihedral quotient argument. Consumers: `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`.
- **EulerSystemsAndKolyvaginSystems:ES.2** — Indexing-family and coefficient-change maps for the conductor presentation, with the Heegner normalization dictionary. Consumers: `HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility`.
- **EulerSystemsAndKolyvaginSystems:ES.1** — Generic finite/singular and transverse carriers, cyclic tensor factor, simultaneous prime selection and localization detection for the actual Heegner finite fields. Consumers: `HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition`, `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`, `HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing`, `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`.
- **EulerSystemsAndKolyvaginSystems:ES.3** — Strong-system correction interface and cyclic tensor target; the Howard arithmetic χ action is verified in this packet. Consumers: `HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system`.
- **ArithmeticGaloisDuality:R02.2** — Continuous change-of-group/conjugation and central-scalar vanishing for the actual T_pE residual representation; finite Kummer field restriction and evaluation. Consumers: `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2`, `HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing`.
- **SelmerIwasawaCohomology:L1** — Exact local duality/orthogonality and conjugate-place transport of the twisted Weil pairing. Consumers: `HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5`.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68** — Existing elliptic torsion, Weil pairing and integral Tate module with Galois action; Heegner never owns their general definition. Consumers: `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2`.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv** — Tate uniformization, local torsion and component order v(q) for the stated local examples. Consumers: `HeegnerPointEulerSystems:HE.5/tamagawa-and-local-torsion-tests`.
- **EulerSystemsAndKolyvaginSystems:ES.4** — Distinct restriction/invariant/local error constants with an exact finite-level descent inequality, allowing nonzero defects. Consumers: `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison`.
- **NeronModelsAndSemistableAbelianVarieties:R11.2** — Integral component-group/Kummer error comparison for the actual Heegner points and local torsion. Consumers: `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison`.
- **tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev** — Qualitative Chebotarev with positive-density conjugacy class and exclusion of a finite prime set for Gross’s actual finite Kummer composites. Consumers: `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`.
- **EulerSystemsAndKolyvaginSystems:ES.5** — The self-dual primitivity equality. For a Selmer triple satisfying H.0–H.5 of ES.5/howard-hypotheses, with its dual, p≥5 and 𝓛⊇𝓛_s(T), and a Kolyvagin system κ with κ_1≠0: length M=length(H¹_F(K,T)/Rκ_1)−d(κ) for an integer d(κ)≥0 that vanishes exactly when κ is primitive, that is has nonzero image in KS(T/mT) as in ES.5/divisibility-invariants (Zanarella, arXiv:1908.09197v1, Theorem2.3.6 with Proposition2.3.3). Howard’s Theorem1.6.1 gives only the inequality, and ES.5’s Mazur–Rubin rank-one and structure theorems assume core rank one over Q. The hypothesis record and the DVR theorem themselves are now ES.5 nodes and are cited by id (RT-AREA-iwasawa-1/10). Consumers: `HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero`.
- **EulerSystemsAndKolyvaginSystems:ES.1** — Local one-dimensional eigenspace pairings, strict/relaxed rank comparison, simultaneous prime detection and auxiliary singular-class existence as used in Gross/Zhang. Consumers: `HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing`, `HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering`, `HeegnerPointEulerSystems:HE.6/zhang-triangular-selmer-basis`.
- **SelmerIwasawaCohomology:L1** — Local Tate/global reciprocity for Gross eigenspaces and full-place duality/parity comparison for Zhang’s rank-lowering. Consumers: `HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing`, `HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering`.
- **SerreWeightAndLevelOptimisation:R20.2** — Level raising in the form of Zhang Theorem2.1, with its quaternionic transports (RT-AREA-iwasawa-1/2). (i) For a weight-two newform g of level N and trivial nebentypus, a prime 𝔭|p≥5 with ρ̄_g irreducible, and a prime q∤Np with p∤q²−1 and a_q(g)≡±(q+1) mod 𝔭: a newform g′ of exact level Nq and trivial nebentypus with ρ̄_g′≃ρ̄_g over a common residue field; iterate over squarefree products m. The proof prescribes the inertial type at every ℓ≠p, an unramified twist of Steinberg at q (Diamond–Taylor, Duke Math. J.74 (1994), Theorem1; Invent. Math.115 (1994), TheoremB), and reads off the exact level and the trivial nebentypus. R20.2/level-raising-diamond is imported for the q-new step and does not give the exact level or the local types. (ii) For the definite and indefinite quaternion algebras of discriminant N⁻m: J(X_m)[𝔪]≃V of dimension two over k₀ (Zhang Lemma3.3; Mazur, Ribet and Wiles for modular curves, Helm, Israel J. Math.160 (2007), Corollary8.11 for Shimura curves under Hypothesis♥); multiplicity one for the Hecke module of the Shimura set by Mazur’s principle (Zhang (4.8), by the proof of Pollack–Weston Theorem6.2); and the identity (4.9): on points of the Shimura curve reducing to supersingular points at q, the reduced Jacquet–Langlands eigenfunction composed with reduction is the local Kummer map into H¹(K_q,k₀) (Zhang states it for Heegner points, from Bertolini–Darmon, Ann. of Math.162 (2005), Theorem9.2), which rests on Ihara’s lemma for Shimura curves over Q (Diamond–Taylor, Invent. Math.115). The transfer of automorphic representations is GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl. Conditions that involve K, such as q inert in K, stay in HE.6. Consumers: `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`, `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value`.
- **ModularIwasawaMainConjectures:L1** — The Skinner–Urban form of the weight-two cyclotomic main conjecture, with equality in the Iwasawa algebra over O: for p≥3 and a newform f of weight two, trivial character and level M prime to p, ordinary at 𝔭|p, with ρ̄_f irreducible and ramified at some prime q||M, the dual Selmer group over the cyclotomic Z_p-extension is torsion and its characteristic ideal is generated by the p-adic L-function (Skinner, Pacific J. Math.283 (2016), Theorem A for p∤N, that is Theorem2.5.2; Skinner–Urban Theorem1 with the integrality of Skinner §2.5). It is applied to g and to its quadratic twist g_K of level N·D_K². This is not the Fouquet–Wan Theorem1.6 form now in the layer’s text, whose auxiliary prime must also have no invariants under the decomposition group (RT-AREA-iwasawa-1/14). HE.6 derives Zhang7.1 over K from it; an image containing SL₂(Z_p) is not assumed. Consumers: `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`.
- **KatoEulerSystems:L4** — Kato’s integral divisibility under Skinner’s conditions. KatoEulerSystems:L4/ordinary-selmer-divisibility is cited for Kato Theorem17.4; its integral part assumes condition (12.5.2), an image containing SL₂(Z_p). Requested: the same integral bound with (12.5.2) replaced by (a) ρ̄_f irreducible and (b) an element of Gal(Q̄/Q(μ_p∞)) acting on the lattice with free rank-one coinvariants (Skinner §2.5, through Kato Theorem15.5(4)), for the newform g with coefficient prime 𝔭 and for its twist g_K. It is needed where a residual image containing SL₂(F_p) does not give (12.5.2): at p=3, and at p=5 for a ramified coefficient ring. Consumers: `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`.
- **SelmerIwasawaCohomology:L4** — The rank-zero special-value formula for GL₂-type coefficients, by control at the trivial character. For p≥3 and a newform f of weight two, trivial character and level M prime to p, ordinary at 𝔭, with ρ̄_f irreducible and ramified at some q||M: #O/(L^alg(f,1))=#Sel_L(f)·∏_ℓ c_ℓ(T_f), where L^alg(f,1)=L(f,1)/(−2πiΩ_f⁺), Sel_L(f) is the Bloch–Kato Selmer group of the lattice T_f and c_ℓ(T_f) its Tamagawa factors (Skinner, TheoremB; proved in his §3.2 from the main conjecture by Greenberg’s method, using surjectivity of the global-to-local map and the absence of finite submodules). HE.6 applies it to g and g_K and compares with Selmer groups and component groups over K; an E/Q-only BSD endpoint is not this statement. Consumers: `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`.
- **GrossZagierAndArithmeticHeights:GZ.0** — Canonical period as product of ± periods up to a proved 𝔭-adic unit, and normalization of the quadratic-base rank-zero special value. Consumers: `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`.
- **GrossZagierAndArithmeticHeights:GZ.5** — Explicit definite Waldspurger/Gross special-value formula with primitive integral eigenfunction, u_K, discriminant, Petersson and congruence-period factors (Zhang6.1–6.2). Consumers: `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value`.
- **RankZeroOneBSD:BSD.5** — Addressed to the declaration RankZeroOneBSD:BSD.3a/definite-congruence-period, which now exists under this layer and is cited as the prerequisite. Three things remain. (i) Its statement writes t_g(ℓ)=length Φ(A_g/Q_ℓ)_𝔭 and calls it the Tamagawa factor; state it as the length of the 𝔭-part of the geometric component group, equivalently of Φ over the unramified quadratic extension of Q_ℓ, as Zhang (6.7) does. At a non-split multiplicative prime the Q_ℓ-rational points of the component group are killed by 2, so their 𝔭-part vanishes. (ii) Its statement covers nonsquarefree N, but its proof route is Pollack–Weston’s, which assumes N squarefree; plan the nonsquarefree case as Zhang’s proof of Theorem6.4 indicates: Helm’s multiplicity one without squarefreeness, and the modular-degree comparison of Ribet–Takahashi (second assertion of their Theorem1) and Khare under Hypothesis♥(2). (iii) Keep its prerequisites free of HE.6, the final Heegner-index formula, Jochnowitz congruences and rank-zero BSD. Consumers: `HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison`.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii** — Mordell–Weil finite generation and the free quotient of E(K), before using a finite rank-one Heegner index. Consumers: `HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility`.
- **FaltingsFinitenessAndIsogenyTheorems:R28.4** — Serre’s open-image theorems, owned by the Part II of FaltingsFinitenessAndIsogenyTheorems on ℓ-adic and residual images of abelian varieties (Serre’s open-image theorems): accepted route 5 of PAPER-CALEGARI-GERAGHTY-20, carried by the design job DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII. R28.4 is only the routing identifier until that roadmap exists; no R28.7 is proposed any longer (RT-AREA-iwasawa-1/9). Needed for a non-CM elliptic curve over a number field: (i) ρ̄_{E,p} surjective for all but finitely many p, and then image GL₂(Z_p) on T_pE, which the route’s brief plans; (ii) the p-adic image open for every p and the adelic image of finite index, with the cyclotomic determinant (Serre, Invent. Math.15 (1972)), which the brief puts out of scope as “small ℓ” and which is stated in the atlas only as a cited leaf, AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image; (iii) Ribet’s big-image theorem for the non-CM GL₂-type quotients used by the Kolyvagin–Logachev branch. The Tate isogeny theorem alone is not this supplier. Consumers: `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`.
- **ArithmeticGaloisRepresentations:R01.4** — Residual/Tate image and determinant comparison required to apply the requested Serre/Ribet theorem to the actual Heegner representation. Consumers: `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`.
- **EulerSystemsAndKolyvaginSystems:ES.3** — Error-tolerant derivative/descent construction retaining invariants and bounded denominator input; arithmetic uniformity is verified by HE.7. Consumers: `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`.
- **EulerSystemsAndKolyvaginSystems:ES.4** — Reusable integral error-tolerant two-prime descent of Nekovář7.5, with fixed C₀,C₁,C₂,C₃,C₅,C₆ and factor2²¹; HE supplies the actual CM-point classes, geometric component errors, image/evaluation estimates and reciprocity input. Also export Nekovář6.4.3’s general maximal-order pairing bound cd·Coker(j)=0. These generic arguments are not replanned as Heegner lemmas. Consumers: `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`, `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`, `HeegnerPointEulerSystems:HE.7/cm-character-error-descent`, `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`, `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`.
- **ArithmeticGaloisDuality:R02.4** — Dyadic real/Tate correction and integral 1±τ, restriction/corestriction kernels with explicit exponents. Consumers: `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`.
- **ComplexMultiplicationAndExplicitReciprocity:CM.4** — CM elliptic induced Tate-character realization, two distinct conjugate components over the CM field, exact endomorphism field, and the conductor comparison |D_M| divides N. Provide integral finite-extension comparison with degree2; the HE application recombines the characters over the disjoint Heegner field and does not demand full GL₂ image. Consumers: `HeegnerPointEulerSystems:HE.7/cm-character-error-descent`, `HeegnerPointEulerSystems:HE.7/cm-heegner-field-disjointness`, `HeegnerPointEulerSystems:HE.7/integral-tate-image-errors`.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4** — Finite finite-level Selmer groups and the actual torsion-primary Sha carrier/decomposition and Kummer quotient. Consumers: `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`, `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`, `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`.
- **GrossZagierAndArithmeticHeights:GZ.8** — Exact height/nonvanishing formula for the specified simple RM quaternionic Jacobian quotient over F, CM field K and trace of m(P−δ). When using analytic rank dim A for L(A/K,s), certify non-torsion of this particular y; it is additional to the geometric descent theorem, not a generic unrestricted BSD assertion. Consumers: `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`.
- **HilbertModularVarietiesAndShimuraCurves:R18.2** — The chosen quaternionic canonical curve has the good/semistable integral model, CM reduction map, and compatible quotient/specialization at q; retain the discriminant, level and basepoint. Consumers: `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`.
- **HilbertModularVarietiesAndShimuraCurves:R18.3** — The actual definite Shimura class-set carrier and the matched optimal embedding receiving good-prime CM reductions; a definite quaternion algebra does not supply a curve. Consumers: `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`.
- **HilbertModularVarietiesAndShimuraCurves:R18.5** — Čerednik–Drinfeld uniformization identifies the two vertex copies and CM specialization with the specified Frobenius/Atkin–Lehner convention. Consumers: `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`.
- **NeronModelsAndSemistableAbelianVarieties:R11.4** — For Zhang’s definite quaternionic newform and the adjacent indefinite Shimura curve, expose the regular semistable Jacobian character lattice, graph monodromy pairing and component-group presentation with the exact level and localization hypotheses. It is used here to identify t_g(ℓ) over K_ℓ with the geometric component group and for the additive-prime component argument; the period/congruence identity itself is the cited declaration RankZeroOneBSD:BSD.3a/definite-congruence-period. Consumers: `HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison`.
- **EulerSystemsAndKolyvaginSystems:ES.1** — Zhang8.1–8.2 exact generic evaluation/prime selection and strict/relaxed duality over a finite field k₀ with two-dimensional surjective GL₂(k₀) residual representation: two independent global classes simultaneously detected, and nonzero classes in both signs with condition omitted at one prime. HE.6 verifies the actual V/k₀ local conditions and Heegner relation, so the Gross E[p]/F_p theorem is not this export. Consumers: `HeegnerPointEulerSystems:HE.6/zhang-residual-local-pairing`, `HeegnerPointEulerSystems:HE.6/zhang-two-class-prime-detection`, `HeegnerPointEulerSystems:HE.6/zhang-prescribed-ramification-class`.
- **ArithmeticGaloisRepresentations:R01.3** — Artin conductor induction formula for the CM-character realization: conductor of Ind_GM^GQ ψ equals |D_M|Norm(f_ψ), at all primes including ramified/dyadic ones. Together with CM.4 identify it with the elliptic conductor N; HE needs only the divisibility |D_M| divides N. Consumers: `HeegnerPointEulerSystems:HE.7/cm-heegner-field-disjointness`.
- **FaltingsFinitenessAndIsogenyTheorems:R28.4** — Integral GL₂-type image exports, to be owned with Serre’s theorems by the open-image Part II of FaltingsFinitenessAndIsogenyTheorems and routed through R28.4 until it exists (its brief plans Bogomolov’s homothety theorem on one route for abelian surfaces, and puts uniformity out of scope): Bogomolov/Serre homothety openness with bounded indices across coefficient primes; condition(?) absolute-irreducibility/self-twist dictionary via Faltings and CM; residual absolute irreducibility almost everywhere (Dimitrov in the Hilbert case), Clifford and trace comparison over the specified quadratic K. Exact consequences are C₂,C₃ of Nekovář6.1–6.2. Full GL₂ residual surjectivity is neither required nor asserted for CM. Consumers: `HeegnerPointEulerSystems:HE.7/integral-tate-image-errors`, `HeegnerPointEulerSystems:HE.7/integral-cm-prime-detection`.
- **SelmerIwasawaCohomology:L0** — Finite/p∞ Kummer exact sequences, finite finite-level Selmer groups, finite generation of Mordell–Weil and torsion-primary decomposition for the specified GL₂-type abelian variety A/F over K, not just an elliptic E/Q. The cofinal principal powers of a coefficient prime must suffice for the uniform-bound limit and Sha finiteness. Consumers: `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`, `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`.
- **EulerSystemsAndKolyvaginSystems:ES.4** — Classical cardinality/square-index theorem of Kolyvagin Euler Systems, TheoremA quoted in Kolyvagin1991 p.95: #Sha divides d_E·[E(K):Zy_K]², d_E independent of K and supported outside the precisely defined full O_ℓ-linear Tate-image B(E) over Q_O=End_overlineQ(E)⊗Q. Distinguish the CM field from Q and full Tate from residual image, especially at3. The original proof, not obtained from the public Springer endpoint, must be read for this generic size export; Nekovář’s uniform exponent bound alone is insufficient. Consumers: `HeegnerPointEulerSystems:HE.7/classical-square-index-error-bound`.
- **HilbertModularVarietiesAndShimuraCurves:R18.3** — For the definite quaternion algebra over Q of discriminant N⁻m and an Eichler order of level N⁺: the identification of its automorphic forms of trivial weight, norm-factor forms removed, with functions on the Shimura set X_m, compatibly with Hecke operators, so that the transfer of a weight-two newform by R17.3/global-jl and R17.3/multiplicity-one is an eigenfunction on X_m, unique up to a scalar, with values in the ring of integers. R17.3/definite-infinity assigns this identification to this layer. Consumers: `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`, `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value`.

## Source corrections

Ten findings are recorded with their exact quotations, checks, version receipts and correction-search records in the packet. The mathematical corrections used here are:

- E1: the local Euler-characteristic equivalence needs ℓ≠p.
- E2: decomposition-invariant vanishing does not imply inertia-invariant vanishing. The local Tate-twist example diagnoses that step; the finite-residue-cohomology repair is restricted to the split additive application.
- E3: the Euclidean unit-disc area-squared constant is π², not1.
- E4: distinguish the covering torus from its quotient and use the local unit stabilizer O×, not the multiplicative order O.
- E5: Lemma5.8’s literal norm/discriminant equality fails in Q₃×Q₃ for Λ={(a,b):a≡b mod3}. The basis (1,1),(3,0) has discriminant9, while the different generator (3,−3) has norm−9; unit norms are1 mod3. Use the discriminant ideal or absolute norm. Principal invertibility survives.
- E6: in Gross Proposition8.1(2) the pairing is that of (7.3), the local Tate pairing; the printed (2.3) defines no pairing.
- E7: in Nekovář §7.2.1 the constants C₁,v come from Proposition5.12, not from §5.2. The finding concerns the 53-page author preprint.
- E8: in the proof of Zhang Lemma8.4 the final detector prime is ℓ_{2ν+1}, the one just re-chosen, not ℓ_{ν+1}.
- E9: the proof of Zhang Theorem7.1 passes from a residual image containing SL₂(F_p) to a 𝔭-adic image containing SL₂(Z_p). That fails at p=3, and at p=5 it does not follow when the coefficient ring is ramified. The step is not needed: residual irreducibility and the residually ramified ℓ||N give the integrality (Skinner §2.5), and Skinner’s TheoremB is the rank-zero formula the proof needs.
- E10: Zhang Theorem7.1 needs p∤D_K, which its statement omits: the proof applies the rank-zero formula to the twist by K, of level N·D_K².

## Structure proposals

- **SerreWeightAndLevelOptimisation** — RT-AREA-iwasawa-1/2: no declaration supplies Ribet/Diamond–Taylor level raising in the form used as Zhang2.1. R20.2/level-raising-diamond is Diamond’s criterion and is weaker. Add a stage beside R20.2, “Raising the level with prescribed local types, and its quaternionic transports”. It states Zhang2.1 (exact level Nq, trivial nebentypus, same residual representation; Diamond–Taylor, Duke Math. J.74, Theorem1 and Invent. Math.115, TheoremB) and the transports of Zhang §§3–4 (Helm Corollary8.11, Mazur’s principle on the Shimura set, Bertolini–Darmon Theorem9.2 with Ihara’s lemma for Shimura curves). It requires R20.2, GL2AutomorphicRepresentationsAndTransfer R17.3 and R17.6, and HilbertModularVarietiesAndShimuraCurves R18.6, and its consumer is the Zhang branch of HE.6 (HE.6z below). It imports R20.2/level-raising-diamond for the q-new step, and it should import or be compared with GL2ModularityLifting:R22.1/prescribed-level-raising-step and OrdinaryAutomorphicFormsAndModularityLifting:R21.2/ihara-lemma-quaternionic rather than repeat them. This packet requests it through R20.2 and does not modify that roadmap.
- **FaltingsFinitenessAndIsogenyTheorems, ArithmeticGaloisRepresentations** — RT-AREA-iwasawa-1/9: neither the Tate isogeny theorem nor the Heegner error verification owns Serre’s open-image theorem. Its owner is now decided: the Part II of FaltingsFinitenessAndIsogenyTheorems on ℓ-adic and residual images (accepted route 5 of PAPER-CALEGARI-GERAGHTY-20, which names the roadmap OpenImageTheoremsForAbelianVarieties, joined by the Qian and Boxer–Calegari–Gee–Pilloni routes). The design job DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII carries these routes together with the quantitative-isogeny ones. The brief expects HE.7 to import the large-p theorems and to keep the rest; HE.7 plans none of the general theorems. Withdraw the stage R28.7 proposed earlier. Add to the Part II what HE.7 uses and its brief leaves out: the open p-adic image at every p and the finite adelic index, which AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image now states as a cited leaf and should import from there; homotheties (Bogomolov, Serre) for GL₂-type quotients with index bounded across coefficient primes; Ribet’s GL₂-type big-image theorem and the residual-irreducibility/endomorphism exports of Nekovář6.1–6.2. The CM semilinear branch stays with ComplexMultiplicationAndExplicitReciprocity CM.4. Link the Part II’s elliptic-curve layer to HE.7 when it exists; HE.7 owns only the application to uniform Heegner error constants. Until then the requests use R28.4 and R01.4.
- **EulerSystemsAndKolyvaginSystems, HeegnerPointEulerSystems** — RT-AREA-iwasawa-1/10: the generic Howard H0–H5 self-dual argument is not a Heegner theorem. It now has its owner: ES.5/howard-hypotheses, ES.5/cassels-structure, ES.5/howard-stub and ES.5/howard-dvr-theorem, and ES.8/self-dual-lambda-adic-kolyvagin-bound for Howard Theorem2.2.10. HE.5–HE.6 verify H0–H5 for T_pE and cite those declarations. Two links remain for the maintainer: ES.5 → GeneralizedHeegnerCycles:GH.5 and ES.8 → GeneralizedHeegnerCycles:GH.5, absent from the stage graph. The third edge the finding asked for, HE.6 → HE.8, is not needed with the present declarations: what Howard Proposition2.1.3 reuses is the verification of H.0–H.5, which is planned in HE.5, and HE.5 → HE.8 is an edge of the atlas. No declaration of HE.8, HE.8b or HE.8c in the roadmap’s other packet has a prerequisite in HE.6. If the edge is added nevertheless, because HE.8’s text lists HE.3–HE.7, it closes the cycle HE.8 → GeneralizedHeegnerCycles:GH.8 → AutomorphicCongruences:L2 → ModularIwasawaMainConjectures:L1 → HE.6 unless the sub-layer HE.6z proposed below exists. No Λ or HE.8 target is planned in this part.
- **HeegnerPointEulerSystems, GL2AutomorphicRepresentationsAndTransfer** — RT-AREA-iwasawa-1/8: R17.5 Langlands–Tunnell is the wrong Zhang supplier; BSD.6 would be circular and over the wrong base/variety. The Zhang nodes use R17.3/global-jl and R17.3/multiplicity-one, ModularIwasawaMainConjectures:L1, KatoEulerSystems:L4, GZ.5 and the exact GL₂-type rank-zero/degree contracts in this packet. Remove the stage edge R17.5 → HE.6 of the base atlas, and with it the link from the Tau Ceti InductionRestriction layer 7 to HE.6 that accepted RS-21 added as a component of that edge: no HE.6 declaration uses either. No atlas or link-map file is edited here.
- **RankZeroOneBSD, HeegnerPointEulerSystems** — BSD.5, as well as BSD.6, consumes HE.6, while HE.6 needs the definite congruence-period identity that the BSD roadmap owns. The BSD packet now plans it as RankZeroOneBSD:BSD.3a/definite-congruence-period under BSD.5 and proposes the sub-layer BSD.3a; HE.6/ribet-takahashi-tamagawa-comparison cites that declaration. Create the sub-layer RankZeroOneBSD:BSD.3a as the BSD packet proposes, requiring NeronModelsAndSemistableAbelianVarieties R11.4 and R11.6, GL2AutomorphicRepresentationsAndTransfer R17.3 and GrossZagierAndArithmeticHeights GZ.3, with consumers the Zhang branch of HE.6 (HE.6z) and BSD.5. Without BSD.3a or HE.6z, once both packets are live, promotion derives BSD.5 → HE.6 from this packet and HE.6 → BSD.5 from the BSD packet, and skips whichever comes second. The final Heegner-index formula stays in BSD.5, downstream of HE.6. No supplier file is edited.
- **HeegnerPointEulerSystems, ComplexMultiplicationAndExplicitReciprocity** — The classical CM integral proof must run over the disjoint Heegner field, not a field over which CM is defined. Clarify HE.7’s CM-character sentence: compare the characters over KM, retain the degree-two integral errors, and recombine over K to verify condition(?) before the actual explicit-cocycle descent. Replace the unsourced plan to apply non-CM descent over the CM field with this Nekovář3.2/6.2/7.5 specialization.
- **HeegnerPointEulerSystems** — RT-AREA-iwasawa-1/8: HE.6 holds two developments with different suppliers. Howard’s TheoremA applies the self-dual theorem of the Euler-system roadmap to the corrected system of HE.5, and Gross’s clean descent is a direct argument modulo p from HE.5’s class detection; HE.7, HE.8b and the BSD roadmap build on them. Zhang’s indivisibility theorem rests on the main conjecture, Kato, the Gross formula, level raising and the definite period identity, and no other declaration uses it. Kept in one layer, Zhang’s import ModularIwasawaMainConjectures:L1 → HE.6 places all of HE.6 after HE.8, GeneralizedHeegnerCycles:GH.8 and AutomorphicCongruences:L2 in the stage order, and its import of the period identity conflicts with BSD.5’s use of HE.6. Two sub-layers of HE.6. HE.6 “Clean rank-one descent and index bounds” keeps clean-rank-one-descent-theorem-A, gross-clean-mod-p-descent, gross-opposite-eigenspace-vanishing, gross-same-eigenspace-generation, sha-square-index-bound, primitivity-versus-nonzero. HE.6z “Zhang’s indivisibility of Heegner points” takes zhang-cohomological-congruence, zhang-local-conditions-rank-lowering, zhang-rank-zero-over-K, zhang-jochnowitz-special-value, ribet-takahashi-tamagawa-comparison, zhang-triangular-selmer-basis, zhang-indivisibility, heegner-vanishing-order, heegner-base-locus, zhang-residual-local-pairing, zhang-residual-heegner-relations, zhang-two-class-prime-detection, zhang-prescribed-ramification-class. HE.6z requires HE.2, HE.3 and HE.4 inside the roadmap, and from other roadmaps SerreWeightAndLevelOptimisation R20.2 (or the level-raising stage proposed above), GL2AutomorphicRepresentationsAndTransfer R17.3, HilbertModularVarietiesAndShimuraCurves R18.3, ModularIwasawaMainConjectures L1, KatoEulerSystems L4, SelmerIwasawaCohomology L1 and L4, GrossZagierAndArithmeticHeights GZ.0, GZ.3 and GZ.5, NeronModelsAndSemistableAbelianVarieties R11.4, EulerSystemsAndKolyvaginSystems ES.1 and ES.3, ArithmeticGaloisDuality R02.2, the Tau Ceti Chebotarev layer 10, and RankZeroOneBSD BSD.5 (BSD.3a once that sub-layer exists). No declaration outside HE.6z has a prerequisite in it. After the split the supplier layers of HE.6 proper are not reachable from HE.8, and the links BSD.5 → HE.6z and HE.6 → BSD.5 do not conflict. The declaration ids do not change; the declarations keep HE.6 as parent until the sub-layer is a stage.

## Precise gaps

These gaps keep the stage coverage planned rather than closed. Each target-level chain ends in an existing baseline, an owned declaration, a precise request or one of these named boundaries.

### HE.0 general order and class-field suppliers remain planned

Accepted RS-04 forbids rebuilding generic orders, Picard groups or the general CM/class-field correspondence here. GN11/CFT12/CFT13 must export typed order and field constructions. All positive baseline declarations below were read at the exact pins; no Heegner, Kolyvagin, ringClassField or optimalEmbedding declaration was found in either complete source tree.

Consumers: `HeegnerPointEulerSystems:HE.0/local-toral-order`, `HeegnerPointEulerSystems:HE.0/transported-global-order`, `HeegnerPointEulerSystems:HE.0/idele-ideal-class-comparison`, `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `HeegnerPointEulerSystems:HE.0/dihedral-conjugation`, `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`, `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`, `HeegnerPointEulerSystems:HE.0/local-different-discriminant`.

### HE.1 geometric prototype contract

The suggested conductorPoint takes supplied CM-point values and the specified modular map as unbundled data. It cannot yet type the CM moduli object, Hodge denominator, canonical-model rationality and modular degree at these pins. These are omitted mathematical conditions, recorded explicitly, not Prop-valued placeholder fields. The packet keeps the complete mathematical statement; supplier construction is required before a production signature.

Consumers: `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`.

### HE.2 global recurrence normalization

The local divisor recurrences are source-verified. A complete chosen modular conductor-chain comparison must determine the central scaling of the second predecessor, global-unit stabilizer and integral Hodge/torsion terms before exporting a scalar repeated-conductor equation on P_c. That comparison is an explicit node target, not an assumed equality.

Consumers: `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence`, `HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence`, `HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution`.

### HE.4 typed continuous-cohomology prototype

The descent signature uses a supplied additive restriction equivalence C≃+I and invariant Kummer class z. C and I must eventually be the actual continuous Galois-cohomology objects with the right coefficient topology. Those supplier/carrier conditions are omitted in the prototype and named here; no algebraic group-cohomology substitute or fake cohomology carrier is introduced.

Consumers: `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`.

### HE.5 global χ localization comparison

Howard’s local χ_ℓ is not automatically a G_K-equivariant coefficient map. The intended global construction must use the G_Q change-of-group action. From F²−a_ℓF+ℓ=0, a_ℓ−(ℓ+1)F=−ℓ(F²−1)F⁻¹; compare this with the local Kummer identification, yielding the normalized involution modulo I_ℓ. The complete integral identification and localization square have not been established here. Retain this exact gap rather than postcompose cocycles with a non-equivariant matrix or accuse the source of an erratum.

Consumers: `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`, `HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system`.

### Missing generic level-raising stage

RT-AREA-iwasawa-1/2. No declaration of the atlas supplies Ribet/Diamond–Taylor level raising in the exact-level form of Zhang2.1, and neither library has it. SerreWeightAndLevelOptimisation R20.2 is titled “Lowering level away from p”; its packet has R20.2/level-raising-diamond, Diamond’s criterion, which is imported here and gives a form new at q, not a newform of exact level Nq with the original local types and trivial nebentypus. The nearest other declarations are GL2ModularityLifting:R22.1/prescribed-level-raising-step, a quaternionic step over totally real fields, and OrdinaryAutomorphicFormsAndModularityLifting:R21.2/ihara-lemma-quaternionic, Ihara’s lemma for definite quaternionic forms; neither gives Zhang2.1 or Ihara’s lemma for Shimura curves. The same owner is asked for the quaternionic transports of Zhang §§3–4. The request is routed through R20.2 and a separate stage is proposed under Structure proposals. Until one of them exists the Zhang branch of HE.6 is not closed.

Consumers: `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`, `HeegnerPointEulerSystems:HE.6/zhang-indivisibility`, `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value`.

### Zhang auxiliary rank-zero and degree supplier scope

RT-AREA-iwasawa-1/8. Zhang7.1 needs, for g and g_K, the main conjecture in its Skinner–Urban form, Kato’s divisibility and the rank-zero specialisation with coefficients O (Skinner’s Theorems A and B). ModularIwasawaMainConjectures has no blueprint yet and its L1 text states only the Fouquet–Wan form, so the Skinner–Urban form is an open request; Kato’s Theorem17.4 is a cited declaration, with its integral bound under Skinner’s two conditions requested; SelmerIwasawa L4 is asked for the specialisation. The definite period identity is a declaration of the BSD owner, RankZeroOneBSD:BSD.3a/definite-congruence-period, cited here; its packet is not yet accepted, and its proof route does not yet cover nonsquarefree N. Neither BSD.5’s index formula nor BSD.6 is a prerequisite, since both consume HE.6.

Consumers: `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`, `HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison`, `HeegnerPointEulerSystems:HE.6/zhang-indivisibility`.

### Missing general Serre/Ribet open-image layer

RT-AREA-iwasawa-1/9. No layer of the atlas proves Serre’s open-image theorem. Its owner is the Part II of FaltingsFinitenessAndIsogenyTheorems on ℓ-adic and residual images of abelian varieties (Serre’s open-image theorems), an accepted paper route whose roadmap is not yet written; the R28.7 stage proposed earlier is withdrawn in its favour. The route’s brief covers surjectivity modulo p and the full p-adic image for large p. It does not cover what HE.7 also uses: the open p-adic image at every p, which the atlas states only as the cited leaf AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image; homotheties for GL₂-type quotients with index bounded across coefficient primes; Ribet’s GL₂-type theorem; and the endomorphism/residual-irreducibility exports of Nekovář6.1–6.2. These are requested through R28.4 and R01.4 and are not re-proved in HE.7. Full non-CM GL₂ image is not used in the CM branch.

Consumers: `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`, `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`, `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`, `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`, `HeegnerPointEulerSystems:HE.7/integral-tate-image-errors`, `HeegnerPointEulerSystems:HE.7/integral-cm-prime-detection`.

### HE.0 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Consumers: `HeegnerPointEulerSystems:HE.0/local-toral-order`, `HeegnerPointEulerSystems:HE.0/transported-global-order`, `HeegnerPointEulerSystems:HE.0/idele-ideal-class-comparison`, `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `HeegnerPointEulerSystems:HE.0/dihedral-conjugation`, `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`, `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`, `HeegnerPointEulerSystems:HE.0/local-different-discriminant`.

### HE.1 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Consumers: `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`, `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`, `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`, `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`.

### HE.2 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Consumers: `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`, `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`, `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence`, `HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence`, `HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution`, `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence`, `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`.

### HE.3 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Consumers: `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `HeegnerPointEulerSystems:HE.3/good-place-kummer-unramified`, `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`, `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`, `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`, `HeegnerPointEulerSystems:HE.3/archimedean-tate-correction`.

### HE.4 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Consumers: `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`, `HeegnerPointEulerSystems:HE.4/differentiated-point-invariance`, `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`, `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`, `HeegnerPointEulerSystems:HE.4/explicit-cocycle-divisibility`, `HeegnerPointEulerSystems:HE.4/bottom-trace-class`, `HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence`, `HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility`, `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`.

### HE.5 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Consumers: `HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition`, `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`, `HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system`, `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2`, `HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5`, `HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing`, `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`, `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison`, `HeegnerPointEulerSystems:HE.5/tamagawa-and-local-torsion-tests`.

### HE.6 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Consumers: `HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A`, `HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent`, `HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing`, `HeegnerPointEulerSystems:HE.6/gross-same-eigenspace-generation`, `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`, `HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero`, `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`, `HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering`, `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`, `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value`, `HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison`, `HeegnerPointEulerSystems:HE.6/zhang-triangular-selmer-basis`, `HeegnerPointEulerSystems:HE.6/zhang-indivisibility`, `HeegnerPointEulerSystems:HE.6/heegner-vanishing-order`, `HeegnerPointEulerSystems:HE.6/heegner-base-locus`, `HeegnerPointEulerSystems:HE.6/zhang-residual-local-pairing`, `HeegnerPointEulerSystems:HE.6/zhang-residual-heegner-relations`, `HeegnerPointEulerSystems:HE.6/zhang-two-class-prime-detection`, `HeegnerPointEulerSystems:HE.6/zhang-prescribed-ramification-class`.

### HE.7 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

Consumers: `HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility`, `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`, `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`, `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`, `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`, `HeegnerPointEulerSystems:HE.7/cm-character-error-descent`, `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`, `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`, `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`, `HeegnerPointEulerSystems:HE.7/integral-tate-image-errors`, `HeegnerPointEulerSystems:HE.7/integral-cm-prime-detection`, `HeegnerPointEulerSystems:HE.7/cm-heegner-field-disjointness`, `HeegnerPointEulerSystems:HE.7/classical-square-index-error-bound`.

### Independent review: definite period supplier must precede HE.6

The early export now exists as RankZeroOneBSD:BSD.3a/definite-congruence-period, with the odd-definite, full-♥, GL₂-type and nonsquarefree contract in its statement, and HE.6 cites it. Four things remain open. Its packet is not yet accepted. Its proof route is the squarefree one. Its t_g(ℓ) must be stated for the geometric component group. It is planned under BSD.5, so once both packets are live the derived stage link BSD.5 → HE.6 and the link HE.6 → BSD.5 of BSD.5’s index formula cannot both be drawn; either sub-layer, BSD.3a or HE.6z, removes the conflict.

Consumers: `HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison`.

### Independent review: Lean signatures are conditional sketches

Section13 permits explicit omission of unavailable arithmetic conditions. The independent review found that the former arbitrary-group dihedral and zero-family indivisibility signatures could fail. This revision replaces those shapes with cyclic-dihedral homomorphism transport and transport of a supplied nonzero auxiliary localization. These corrections remove the stated algebraic counterexamples. Every remaining arithmetic carrier/map must still be linked to its actual supplier object before the admissions can be used. Expressible finite-generation/non-torsion hypotheses and the conditional rank-zero valuation clause are retained; elaboration does not verify omitted arithmetic identifications.

Consumers: `HeegnerPointEulerSystems:HE.0/local-toral-order`, `HeegnerPointEulerSystems:HE.0/transported-global-order`, `HeegnerPointEulerSystems:HE.0/idele-ideal-class-comparison`, `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `HeegnerPointEulerSystems:HE.0/dihedral-conjugation`, `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`, `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`, `HeegnerPointEulerSystems:HE.0/local-different-discriminant`, `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`, `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`, `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`, `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`, `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`, `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`, `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence`, `HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence`, `HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution`, `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence`, `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`, `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `HeegnerPointEulerSystems:HE.3/good-place-kummer-unramified`, `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`, `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`, `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`, `HeegnerPointEulerSystems:HE.3/archimedean-tate-correction`, `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`, `HeegnerPointEulerSystems:HE.4/differentiated-point-invariance`, `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`, `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`, `HeegnerPointEulerSystems:HE.4/explicit-cocycle-divisibility`, `HeegnerPointEulerSystems:HE.4/bottom-trace-class`, `HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence`, `HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility`, `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`, `HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition`, `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`, `HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system`, `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2`, `HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5`, `HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing`, `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`, `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison`, `HeegnerPointEulerSystems:HE.5/tamagawa-and-local-torsion-tests`, `HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A`, `HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent`, `HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing`, `HeegnerPointEulerSystems:HE.6/gross-same-eigenspace-generation`, `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`, `HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero`, `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`, `HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering`, `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`, `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value`, `HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison`, `HeegnerPointEulerSystems:HE.6/zhang-triangular-selmer-basis`, `HeegnerPointEulerSystems:HE.6/zhang-indivisibility`, `HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility`, `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`, `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`, `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`, `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`, `HeegnerPointEulerSystems:HE.7/cm-character-error-descent`, `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`, `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`, `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`.

### CM conductor and integral image supplier contracts

The classical CM application derives M≠K from |D_M| dividing the elliptic conductor. CM.4/R01.3 must provide that exact induced-character conductor and endomorphism-field dictionary. The open-image Part II of FaltingsFinitenessAndIsogenyTheorems must provide the general homothety and absolute-irreducibility consequences stated in the request. The Heegner application and its bounds are sourced; these general theorems are imported, not rebuilt here.

Consumers: `HeegnerPointEulerSystems:HE.7/cm-heegner-field-disjointness`, `HeegnerPointEulerSystems:HE.7/integral-tate-image-errors`.

### Classical square-index size theorem source/export

Gross1.3 and Kolyvagin1991 TheoremA verify the exact classical order theorem, but quote its earlier Euler Systems proof. The Springer public endpoint returned a purchase page, not the proof. ES.4 needs that generic cardinality export, including CM image conventions. Nekovář7.5 establishes the uniform exponent and full finiteness, not this sharp size assertion. Keep the separate source-acquisition and export gap.

Consumers: `HeegnerPointEulerSystems:HE.7/classical-square-index-error-bound`.

### GL₂-type abelian finite Selmer supplier

The new RM specialization needs finite generation, finite finite-level Selmer/Kummer sequences and torsion-primary decomposition for the exact abelian variety and coefficient prime. SelmerIwasawaL0 is requested to export the abelian variant; an elliptic-only upstream declaration is insufficient.

Consumers: `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`, `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`.

## Review and validation boundary

The packet carries the accepted independent review of 6 October 2026, REV-HeegnerPointEulerSystems--HE.0~2, with its 78 node records. That review object is unchanged.

The red-team fix round FIX-RT-AREA-iwasawa-1~2 then applied the four confirmed findings of RT-AREA-iwasawa-1 that concern HE.0–HE.7. No declaration was added, removed or renamed. Ten declarations changed: in HE.5 the corrected Kolyvagin system and the two hypothesis verifications; in HE.6 Howard’s rank-one theorem, the primitivity comparison, Zhang’s congruence, the rank-zero formula over K, the Jochnowitz criterion and the period comparison; in HE.7 the open-image application. The changes are these.

- Finding 10: Howard’s hypothesis record and DVR theorem are cited as declarations of EulerSystemsAndKolyvaginSystems ES.5; the equality for a primitive system is requested with its source.
- Finding 2: level raising and its quaternionic transports are stated as imports, with one exact request to the level-optimisation owner; the transfer of automorphic representations is cited as a declaration.
- Finding 8: Zhang’s Theorem7.1 is derived from Skinner’s Theorems A and B, with p∤D_K; Kato’s divisibility is a cited declaration; the period identity is the BSD owner’s declaration; the sub-layer HE.6z is proposed.
- Finding 9: Serre’s open-image theorem is assigned to its decided owner.

This round also recorded source corrections E9 and E10 and brought this document into agreement with the packet where the accepted review had corrected locators and one statement. The account of every finding is in `research/blueprint/redteam/RT-AREA-iwasawa-1.fixes-2.md`. The changes go live only when REV-FIX-RT-AREA-iwasawa-1~2 accepts them.

Follow-up resolves exact generic level raising, the Skinner–Urban form of the main conjecture and its GL₂-type specialisation, the open-image Part II, CM conductor/image/Selmer contracts, ES integral/cardinality exports, the self-dual primitivity equality and the HE.5 global χ localization. It replaces omitted prototype conditions with actual supplier interfaces. HE.8/HE.8b/HE.8c/HE.7s and the nonquadratic-character extension are outside this part.
