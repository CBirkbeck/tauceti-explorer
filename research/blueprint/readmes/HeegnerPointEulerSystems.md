# Heegner point Euler systems

Heegner points turn CM points on modular and Shimura curves into arithmetic classes. Their trace and reduction relations permit Kolyvagin derivatives; the resulting local relations control rank-one Selmer groups and Shafarevich–Tate groups. This roadmap plans that arithmetic construction, its clean and error-tolerant descent, and its ordinary anticyclotomic continuation. The endpoints are the classical rank-one and full-Sha-finiteness theorems, Zhang's indivisibility theorem in its precise GL₂-type setting, nonzero anticyclotomic Heegner families, and the source-qualified main-conjecture and refined-divisibility results.

This is a plan, with every declaration implementation-unchecked. The complete catalogue below contains 138 nodes from the two part packets, 15 definitions/constructions with 60 API items and 45 tests, and 54 proposed planets. The earlier packet has an accepted target-level review; the anticyclotomic packet has a completed `needs_changes` review. Its norm-family interface is revised in the assembled suggested file and requires independent review. Neither a completed planning pass nor successful elaboration closes the recorded supplier and source gaps. The [suggested Lean file](../suggested/HeegnerPointEulerSystems.lean) proposes interfaces against the pinned libraries, with admitted proofs. The mathematical statements and proof routes in this document are definitive.

## Scope and ownership

General number-field orders, Picard groups and their local/global comparison belong to [GlobalNumberFields, layer 11](../../../content/tau-ceti/GlobalNumberFields/README.md#layer-11-orders-and-picard-groups). General relative class-field existence and reciprocity belong to [ClassFieldTheory, layers 12–13](../../../content/tau-ceti/ClassFieldTheory/README.md#layer-13-norm-theorems-and-class-fields). HE.0 specializes these constructions to the actual ring-class towers; it does not define another Picard group. The classical ring-class tower is generalized dihedral over ℚ and need not itself be a CM field. CM types, canonical models and the CM reciprocity/character dictionary come from ComplexMultiplicationAndExplicitReciprocity. General coarse moduli and CM geometry come from [ModularCurves](../../../content/tau-ceti/ModularCurves/README.md) and HilbertModularVarietiesAndShimuraCurves R18; HE.1 owns the compatible CM point family and its image in a fixed modular quotient.

The existing link maps supply NumberFieldArithmetic layer 2's Frobenius/place conventions, EllipticCurves layers 2, 4–7's Tate module, local reduction, twists, Mordell–Weil, Kummer, Selmer and Sha theory, and Chebotarev layer 10's finite avoidance and prescribed Frobenius. These are upstream developments, not new layers here. In particular, a multiplicative Kummer map for μₙ does not supply elliptic Kummer, and a discrete continuous-cohomology interface does not supply the inverse-limit topology of TₚE. Exact missing extensions are requests, collected in the [assembly handoff](../handoff/ASM-HeegnerPointEulerSystems.md).

EulerSystemsAndKolyvaginSystems owns generic cyclic derivatives, finite/singular comparisons, Selmer triples, divisibility indices, self-dual DVR structure, error-tolerant descent, rigidity and Λ-adic bounds. HE.3–HE.7 verify their hypotheses on actual CM-point classes. SelmerIwasawaCohomology and ArithmeticGaloisDuality own continuous cohomology, propagated local conditions, duality and Selmer complexes. NeronModelsAndSemistableAbelianVarieties owns component groups and their integral defects. None of those general theories is re-planned here.

GrossZagierAndArithmeticHeights owns height and toric-period formulas, explicit reciprocity and the BDP convention dictionary; HE owns the point/period nonvanishing argument before applying those formulas. GeneralizedHeegnerCycles extends to higher weight and imports this weight-two arithmetic. RankZeroOneBSD owns the final BSD formulas and the independent Eisenstein main-conjecture branch; it consumes early Heegner classes. The definite congruence-period identity is its proposed early BSD.3a export, before the final BSD.5 index formula. ModularIwasawaMainConjectures owns general formulation comparisons. AutomorphicCongruences L5a/L5w owns the early two-variable comparison, Wan/Fujiwara theorem, period and μ contracts; HE.8b owns the anticyclotomic return. The cyclotomic return L5b is downstream. ModularIwasawaMainConjectures L1 and KatoEulerSystems L4 supply the distinct GL₂-type rank-zero input to Zhang's branch, not to clean Howard/Gross descent.

GL2AutomorphicRepresentationsAndTransfer R17.3 supplies global Jacquet–Langlands and multiplicity one. The level-raising/local-type and quaternionic integral extensions are requested from SerreWeightAndLevelOptimisation R20.2 and the appropriate R18 owners; R17.5 Langlands–Tunnell is not their supplier. General open-image theorems belong to the open-image Part II of FaltingsFinitenessAndIsogenyTheorems. HE.7 only uses them to control its arithmetic error constants. A single new elliptic-unit/Iwasawa owner is proposed for Rubin/Hida–Tilouine/Hida CM alternatives; it is not a prerequisite of the direct Nekovář CM descent.

## Conventions and hypotheses

In the classical branch, E/ℚ is a modular elliptic curve with a fixed modular quotient, conductor N, and K an imaginary quadratic field with signed discriminant D_K<0, D_K≠−3,−4, and every N-prime split in K. Write O_c=ℤ+cO_K and K[c] for the corresponding ring class field in one fixed separable closure. P_c∈E(K[c]) is the conductor-c point. The bottom point is y_K=Tr_{K[1]/K}P₁; P₁ generally is not K-rational. All unit indices, integral cusp/Hodge multiples, quotient degrees and Manin constants remain data. Full index [E(K):ℤy_K] includes torsion; a free quotient or p-adic lattice index is named separately.

Artin reciprocity uses arithmetic Frobenius by default. Cornut–Vatsal and Nekovář's geometric-Frobenius convention is converted by inversion at the relevant comparison. A geometric reduction endomorphism is distinguished from an Artin element. In the quaternionic reduction formula, a rational admissible q is inert in K/ℚ while λ=qO_K splits completely in K[n]/K when q∤n; the residue field is 𝔽_q². A ring class field is never assigned `IsCMField` solely from these facts.

For the classical clean coefficient branch p is odd. Howard's Theorem A requires full G_K→GL₂(ℤ_p) image and p∤ND_K; Gross's clean mod-p theorem uses full residual image and y_K∉pE(K), without silently adding Howard's good-prime or full Tate-image hypotheses. In Zhang's branch the coefficients are V/k₀ and the GL₂-type quotient A_g, not always E[p]/𝔽_p. All three clauses of Hypothesis ♥ and the ramification data stay attached to that branch. Write N=N⁺N⁻ with N⁻ squarefree: even ν(N⁻) is the indefinite curve case and odd ν(N⁻) the definite period case.

For squarefree auxiliary n, I_n=∑_{ℓ∣n}(a_ℓ,ℓ+1)⊂ℤ_p and the classes have coefficients T/I_nT with their cyclic-Galois tensor. I₁=0. For n>1, I_n=(p^{M(n)}), where M(n) is the minimum of the two valuations over the primes. Reduction to modulo p^m requires I_n⊂p^mℤ_p, hence M(n)≥m. Raw scalar derivatives depend on generators; tensoring retains their compensating transformation law. Howard's local χ_ℓ must come from a legitimate global change-of-group action before use on global cocycles; that localization comparison remains a gap.

In the integral branch, F is totally real, K/F CM, B/F split at one real place, and A is the specified simple Hecke-linear quotient with maximal endomorphism order O_L and [L:ℚ]=dim A. The central quotient, ramification, integral Hodge map and non-torsion trace are fixed. A must not acquire CM over K. For classical CM E/ℚ, its CM endomorphism field M differs from the Heegner field K; compare characters over KM and recombine over K, retaining the degree-two error. The descent does not switch to a non-CM argument over KM.

Nekovář's constants have separate meanings: C₀ is bottom-point divisibility modulo torsion; C₁ comes from geometric component groups; C₂ is the homothety/Sah bound; C₃ the matrix/evaluation bound; C₆ the polarization degree. The trivial-character branch has C₅=0. Its uniform annihilator is 2²¹𝔭^{2C₀+2C₁+4C₂+4C₃+C₆}, on cofinal principal exponents 𝔭^M. At 2 use integral 1±ρ, retaining intersections; no division by two is permitted. Bounded exponent plus finite-level finiteness and almost-all primary vanishing yields full Sha finiteness. It does not alone prove the quantitative square-index cardinality theorem, whose original proof remains an acquisition gap.

In the ordinary continuation T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, and ι(γ)=γ⁻¹. Let α_p be the unit root of X²−a_pX+p and β_p=p/α_p. Finite ring-class p-parts are retained. The smallest d(k) with K_k⊂K[p^{d(k)}] handles p-primary class-number shifts. Φ is the initial Artin-polynomial factor, not a unit in general. Its comparison with the stabilized Heegner line uses the unit β_p-factors; this does not invert Φ. The notation y∞ denotes the Iwasawa Heegner class, and Q[n] a compatible norm family before Kummer. Nonzero y∞ does not imply a nonzero identity specialization or all nonzero character specializations.

For Cornut–Vatsal relative nonvanishing, use separate data F, K/F, π of parallel weight two, an everywhere-unramified finite-order central character ω and a prime P. P(n,χ₀) consists of primitive exact-level characters with fixed finite torsion type and χ₀ω=1 on the embedded base ideles. The sign set S includes all real places and the specified inert finite places; sufficiently large conductor gives sign (−1)^{|S|}. The even-parity definite theorem needs nonexceptionality; the odd-parity indefinite theorem adds ω=1 and pairwise coprimality of N,D,P. These are existence theorems within every sufficiently large stratum, not every-character nonvanishing.

Write X_Gr^(0,∅) for BCS's strict-at-one-p-place, unrestricted-at-the-other Greenberg dual, which is torsion. Write X_ord^str for CS's all-p ordinary dual, which has rank one. The catalogue retains source notation where it quotes a statement; the two carriers are distinguished by these conventions. S is the corresponding compact Selmer lattice and H=Λy∞. BCGS's L_BDP is the square-root normalization: BCS's single-power function generates its square ideal after the specified coefficient/period comparison. Rational equalities invert p; integral equalities retain all p-content, local cokernels and Euler factors.

M_r is the finite Heegner-system divisibility minimum at ν(n)=r; M∞=inf_r M_r and M₀ is the bottom-point index. Zhang's ν(κ)∈ℕ∪{∞} is the smallest support of a nonzero residual class and B(κ) its good-prime localization base locus. These are different invariants. In determinant formulas X_BK is the finite quotient of the propagated Selmer group; at a general twist it need not be a Bloch–Kato group.

## Layers and reading order

| Layer | Arithmetic work and output | Nodes |
| --- | --- | ---: |
| [HE.0](#he-0) | Orders and ring-class towers | 9 |
| [HE.1](#he-1) | CM points and modular quotients | 6 |
| [HE.2](#he-2) | Norm relations and reduction | 7 |
| [HE.3](#he-3) | Kummer classes and local conditions | 6 |
| [HE.4](#he-4) | Derivatives and descent | 9 |
| [HE.5](#he-5) | Local comparison and prime detection | 9 |
| [HE.6](#he-6) | Clean descent and the Zhang branch | 19 |
| [HE.7](#he-7) | Integral errors, CM and full finiteness | 13 |
| [HE.8](#he-8) | Ordinary families, CM nonvanishing and conditional refinements | 47 |
| [HE.8b](#he-8b) | Split anticyclotomic main-conjecture proofs | 13 |

The first part proceeds through HE.0–HE.7. HE.6 contains two branches pending the proposed split: clean Howard/Gross descent, and the later Zhang indivisibility development HE.6z. Only the clean branch feeds HE.7 and the later arithmetic; no external declaration consumes a Zhang-branch node. Fine-node prerequisites, rather than stage numbers, determine the order.

The second part first constructs the ordinary family and proves geometric nonvanishing in HE.8, independently of a main-conjecture equality. The early family feeds the independent BSD.7a Eisenstein proof. HE.8b then combines the exact early Wan/Fujiwara comparison with the matching Euler-system bound and imports BSD.7a's Eisenstein branch. BCGS A/B and CS C remain conditional theorems in HE.8; HE.8b discharges their main-conjecture hypotheses only on the acquired split-prime branches. Inert CS equivalence remains conditional. HE.7s and HE.8c are source/hypothesis bookkeeping layers: their notes are integrated here and their removal is proposed, not applied to the atlas. The legacy CV identifier under HE.8c is preserved with mathematical parent HE.8.

Every cross-part prerequisite below is an exact node ID. The combined internal graph is acyclic. This does not certify the coarse atlas graph: HE.6z and BSD.3a must be resolved before promotion to avoid the existing main-conjecture and BSD return cycles. All eleven restructuring proposals are collected unchanged in the handoff.

## Source guide and pinned baseline

Gross gives the classical residual descent, Howard the corrected self-dual finite and Λ-adic systems, and Nekovář the integral CM/quaternionic/RM descent including exceptional and dyadic primes. Zhang supplies the separate GL₂-type indivisibility branch. Cornut and Cornut–Vatsal supply geometric nonvanishing; Khayutin supplies the transported-order/discriminant viewpoint. BCGS supplies finite-system nonvanishing and refined indices, BCS the split ordinary main-conjecture proof, and CS the determinant/refined-conjecture equivalence. CGLS's weaker construction and localized bound, BCK's integral formulation comparison, CGS's Eisenstein adapter, Wüthrich's distinguished lattice, Pollack–Weston's period calculations, Skinner's rank-zero repair and Zanarella's primitivity equality retain their individual scope.

The following register records the actual editions and reading boundaries of the part packets. These historical source receipts are not claims of a new whole-paper reading by the assembler. The assembly additionally checked Howard §2.3, especially Lemmas 2.3.2–2.3.3, and CGLS Theorem 4.1.1 and its stabilization proof for the norm-family interface. The original Kolyvagin cardinality proof and Rubin 1987 alternative remain unacquired; the BCGS publisher PDF remains unavailable, and its linked author copy is not certified as the version of record.

**Benedict H. Gross. [Kolyvagin’s work on modular elliptic curves](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf).** L-functions and Arithmetic, LMS Lecture Note Series 153 (1991), pp.235–256; scanned published article

Aliases: `HE.0/gross`. Packet reading boundaries:

- HE.0: All printed pp.235–256, read visually from all twelve scanned PDF pages; §§1–12 including every proof.

**Benjamin Howard. [The Heegner point Kolyvagin system](https://arxiv.org/pdf/1202.6340).** arXiv:1202.6340v1, 28 February 2012; original article Compositio Math.140 (2004),1439–1472

Aliases: `HE.0/howard`, `HE.7s/howard`. Packet reading boundaries:

- HE.0: PDF pp.1–21 in full, Introduction and §§1.1–1.7 including H.0–H.5, all the finite-level proof chain and actual Heegner construction. Chapter 2 is outside this part and was not read in this job.
- HE.7s: Introduction; §§2.1–2.3, including the height-one control/error proof, the universal-norm construction, local verification and augmentation argument. Finite-level material in Chapter 1 is imported from the reviewed HE.0 part.

**Benjamin Howard. [The Heegner point Kolyvagin system](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf).** Compositio Math.140 (2004),1439–1472, version of record

Aliases: `HE.0/howard-published`. Packet reading boundaries:

- HE.0: PDF p.20, printed p.1458, finite/singular correction and Theorem 1.7.5. No claim to have read the rest of this version.

**Ilya Khayutin. [Joint equidistribution of CM points](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf).** Annals of Mathematics189 (2019),145–276, version of record

Aliases: `HE.0/khayutin`. Packet reading boundaries:

- HE.0: Printed pp.159–160 (§2.3 local toral orders/discriminants),164–167 (§2.4.3–2.4.4 idele/ideal and Picard descriptions),182–186 (§5.1 coordinates and local different, Lemma 5.8). Other sections were not read.

**Christophe Cornut; Vinayak Vatsal. [Nontriviality of Rankin–Selberg L-functions and CM points](https://personal.math.ubc.ca/~vatsal/research/part1.pdf).** Author preprint, 1 April 2005; published LMS Lecture Notes320 (2007),121–186

Aliases: `HE.0/cornut-vatsal`, `HE.7s/cv`. Packet reading boundaries:

- HE.0: PDF pp.1–4 (relative ring-class characters),19–35 in full (§2 relative CM towers and §3 curve/Hodge/CM setup),60–67 (Appendix6 distribution relations through Lemma6.14). The nonvanishing arguments in §§4–5 and the final Appendix6.5 have not been read.
- HE.7s: §1 hypothesis/sign/character statements; §4.1 and §§4.3–4.6, including degeneracy injectivity and the Ratner-based proof; §§5.3–5.4 including Theorem 5.10. Order, curve and distribution-recurrence setup in §§2–3/Appendix6 is imported from the reviewed HE.0 part.

**Wei Zhang. [Selmer groups and the indivisibility of Heegner points](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf).** Cambridge Journal of Mathematics2(2) (2014),191–253, version of record

Aliases: `HE.0/zhang`. Packet reading boundaries:

- HE.0: Printed pp.191–249 (PDF1–59) in full: introduction, §§2–11 and acknowledgements; every level-raising, geometric/cohomological congruence, rank-lowering, special-value, triangulation and nonvanishing proof. Bibliography beyond its opening was not read.

**Jan Nekovář. [The Euler system method for CM points on Shimura curves](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf).** Author preprint, 23 May 2007, 53 PDF pages; published in L-functions and Galois representations, LMS Lecture Note Series 320 (2007), pp.471–547, DOI10.1017/CBO9780511721267.014

Aliases: `HE.0/nekovar`. Packet reading boundaries:

- HE.0: Introduction pp.1–2; §1.19 pp.14–15; §§3–7 pp.18–51, including the explicit cocycles, component errors, integral image/evaluation bounds, both prime selections and the complete quadratic-character proof §7.5. Section7.6 was also read, but its nonquadratic-character extension is outside this part. Geometry in §§1–2 is imported; no whole-paper read claim.

**Robert Pollack; Tom Weston. [On anticyclotomic μ-invariants of modular forms](https://arxiv.org/pdf/math/0610694v1).** arXiv:math/0610694v1, 23 October 2006; locators use preprint pagination

Aliases: `HE.0/pollack-weston`. Packet reading boundaries:

- HE.0: Introduction pp.1–3, conditionCR and §§6.2–6.5 pp.18–21 (Theorem6.8 is in §6.5): localized character groups, monodromy/component presentation, degrees, definite pairing and squarefree congruence-period identity. No claim that this preprint proves Zhang’s nonsquarefree extension.

**V. A. Kolyvagin. [On the structure of Shafarevich–Tate groups](https://www.wstein.org/papers/bib/kolyvagin-structure_of_sha.pdf).** Algebraic Geometry, Lecture Notes in Mathematics1479 (1991), pp.94–121; scanned published article

Aliases: `HE.0/kolyvagin-structure`. Packet reading boundaries:

- HE.0: Introduction pp.94–97, especially TheoremA on p.95, which quotes the uniform classical square-index theorem from Euler Systems. The quoted result is distinguished from the proof in that earlier paper; no whole-paper read claim.

**Christopher Skinner. [Multiplicative reduction and the cyclotomic main conjecture for GL₂](https://arxiv.org/pdf/1407.1093v1).** arXiv:1407.1093v1, 4 July 2014; published Pacific J. Math.283 (2016),171–200; locators use the arXiv pagination

Aliases: `HE.0/skinner`. Packet reading boundaries:

- HE.0: Introduction pp.1–3 (Theorems A, B and C, footnote1, and the paragraph on Zhang’s paper), §2.5 pp.15–16 (Theorem2.5.2 and the discussion of hypothesis (*) after it) and the opening of §3.2 pp.20–21 (the reduction of TheoremB to TheoremA). The rest of the paper, and the published version, were not read.

**Murilo Zanarella. [On Howard’s main conjecture and the Heegner point Kolyvagin system](https://arxiv.org/pdf/1908.09197v1).** arXiv:1908.09197v1, 24 August 2019; locators use the arXiv pagination

Aliases: `HE.0/zanarella`. Packet reading boundaries:

- HE.0: Hypotheses (H.0)–(H.5) in §2.1 p.11 and §2.3 pp.19–20: Definition2.3.2, Proposition2.3.3, Remark2.3.5 and Theorem2.3.6 with its proof. The lemmas of §2.2 on which that proof rests were not read, nor was the rest of the paper.

**Christophe Cornut. [Mazur’s conjecture on higher Heegner points](https://webusers.imj-prg.fr/~christophe.cornut/papers/mcinv.pdf).** Invent. Math.148 (2002),495–523; author manuscript

Aliases: `HE.7s/cornut`. Packet reading boundaries:

- HE.7s: Introduction and the modular CM-trace non-torsion statement used by Howard2.3.7. The more general dynamical proof is read in the companion distribution paper; no claim to have read every proof here.

**Christophe Cornut; Vinayak Vatsal. [CM points and quaternion algebras](https://webusers.imj-prg.fr/~christophe.cornut/papers/part2.pdf).** Author manuscript, 3 April 2005; Documenta Math.10 (2005),263–309

Aliases: `HE.7s/cv-dynamics`. Packet reading boundaries:

- HE.7s: Theorem 2.9/Corollary 2.10; the reduction to local dynamics in §2.5 and the complete §2.7 uniform-distribution, twisted-diagonal, partition and commensurability argument. General F_P twisted-diagonal input remains a qualified supplier request.

**Ashay Burungale; Francesc Castella; Giada Grossi; Christopher Skinner. [Non-vanishing of Kolyvagin systems and Iwasawa theory](https://arxiv.org/pdf/2312.09301v2).** arXiv:2312.09301v2, January 2026; published CJM14(2) (2026),285–348

Aliases: `HE.7s/bcgs`. Packet reading boundaries:

- HE.7s: Introduction and §§1–2: construction, near-trivial characters, lattice/logarithm/control factors, error bound, Theorems A/B and generic rigidity/stub statements. The cyclotomic Chapter 3 is outside this scope.

**Ashay Burungale; Francesc Castella; Giada Grossi; Christopher Skinner. [Non-vanishing of Kolyvagin systems and Iwasawa theory](https://web.math.ucsb.edu/~castella/Kolyvagin.pdf).** Author copy dated 2 January 2026, linked by Castella alongside CJM publication; not certified as the publisher PDF

Aliases: `HE.7s/bcgs-published-author`. Packet reading boundaries:

- HE.7s: Introduction condition(disc) and Lemma 1.1.5 compared with arXiv v2. This copy is used only for collation, not as evidence that the journal version has the same wording.
- HE.7s: Proposition2.2.1, Theorem2.2.2, Lemma2.2.4 and the exact-length proof collated independently with arXivv2 for E3.

**Ashay Burungale; Francesc Castella; Christopher Skinner. [Base change and Iwasawa main conjectures for GL2](https://arxiv.org/pdf/2405.00270v2).** arXiv:2405.00270v2, March 2025; theorem numbering belongs to v2

Aliases: `HE.7s/bcs`. Packet reading boundaries:

- HE.7s: §1 statements and proof outline, §§2–5 anticyclotomic proof through Theorems1.2.2/1.2.4. The cyclotomic endpoint is not used as a supplier.

**Francesc Castella; Giada Grossi; Jaehoon Lee; Christopher Skinner. [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://web.math.ucsb.edu/~castella/Eisenstein.pdf).** Invent. Math.227 (2022),517–580; author copy

Aliases: `HE.7s/cgls`. Packet reading boundaries:

- HE.7s: §§4.1–4.2: weaker tor hypothesis, unit normalization, localized divisibility, formulation equivalence and the source’s additional(Sel) hypothesis. The newer CGS theorem is requested from BSD.7a, not inferred from this older theorem.

**Francesc Castella; Takamichi Sano. [On refined nonvanishing conjectures by Kurihara and Kolyvagin](https://web.math.ucsb.edu/~castella/Kurihara.pdf).** Author manuscript dated 20 January 2026, arXiv:2601.14504v1

Aliases: `HE.7s/cs`. Packet reading boundaries:

- HE.7s: Introduction TheoremC and all §3: Heegner family, strict ordinary Selmer complexes, determinant formulation, exact specialization factors and both directions of refined-conjecture equivalence. §2 cyclotomic results are not extracted here.

**Christian Wüthrich. [On the integrality of modular symbols and Kato’s Euler system for elliptic curves](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-19/12.pdf).** Documenta Math.19 (2014),381–402, published PDF

Aliases: `HE.7s/wuthrich`. Packet reading boundaries:

- HE.7s: Introduction Theorems1–3 and §2 Theorem4 including its distinguished-lattice/étale-isogeny proof. The full integral Kato proof and Eisenstein divisibility remain precise owner requests to KatoL4; no whole-paper proof read claim.

**Ashay Burungale, Francesc Castella, Chan-Ho Kim. [A proof of Perrin-Riou’s Heegner point main conjecture](https://web.math.ucsb.edu/~castella/PRconj-print.pdf).** Published author-served copy, Algebra & Number Theory15(7) (2021),1627–1653, DOI10.2140/ant.2021.15.1627

Aliases: `HE.7s/bck`. Packet reading boundaries:

- HE.7s: Standing conventions and §§2,4–5, especially Theorem5.2 and its integral local-length/reciprocity argument.

**Francesc Castella, Giada Grossi, Christopher Skinner. [Mazur’s main conjecture at Eisenstein primes](https://web.math.ucsb.edu/~castella/Mazur.pdf).** Author-served copy linked to Math. Ann.393(2) (2025),2451–2506; not certified as publisher PDF

Aliases: `HE.7s/cgs`. Packet reading boundaries:

- HE.7s: Introduction TheoremsA/C and the anticyclotomic Greenberg reformulation, for the supplier assumptions only; the owner must decompose the independent proof.


The reviewed library audit identifies only existing algebraic building blocks at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Existing elliptic point algebra and discrete cohomology are narrower than the required continuous Tate/Selmer theory. The 21 distinct positive baseline declarations below were read at the Mathlib pin. No Heegner arithmetic implementation is claimed. The extra compact ℤ_p instance used by the assembled tests is `PadicInt.compactSpace` in `Mathlib/NumberTheory/Padics/ProperSpace.lean`.

| Existing declaration | Pinned source and usable scope |
| --- | --- |
| `mathlib:Subring.comap` | [Mathlib/Algebra/Ring/Subring/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Ring/Subring/Basic.lean). Preimage subring along a ring homomorphism; lines175–184, statement read at the exact pin. |
| `mathlib:ClassGroup.equivPic` | [Mathlib/RingTheory/PicardGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PicardGroup.lean). ClassGroup R ≃* CommRing.Pic R for any commutative domain R; lines876–879, not restricted to Dedekind domains. |
| `mathlib:CommRing.Pic.mapRingHom` | [Mathlib/RingTheory/PicardGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PicardGroup.lean). Pic R →* Pic S for f:R→+*S between commutative semirings, lines575–603 including identity and composition laws. |
| `mathlib:PadicInt` | [Mathlib/NumberTheory/Padics/PadicIntegers.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean). The actual p-adic integer ring as the norm≤1 subtype of ℚ_p, with p prime. |
| `mathlib:WeierstrassCurve.Affine.Point` | [Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean). Nonsingular points with infinity, lines477–481; AddCommGroup over a field with DecidableEq, lines803–812; actual statement/context read. |
| `mathlib:Module.length` | [Mathlib/RingTheory/Length.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Length.lean). Module length in ℕ∞ for a ring, additive group and module, lines27–33; used by the actual inequality prototypes. |
| `mathlib:Nat.primeFactorsList` | [Mathlib/Data/Nat/Factors.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Factors.lean). The sorted list of prime factors with multiplicity; lines38–48 read at the pin. Taking toFinset/card counts distinct conductor primes. |
| `mathlib:PadicInt.ideal_eq_span_pow_p` | [Mathlib/NumberTheory/Padics/PadicIntegers.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean). For a nonzero ideal s of Z_p, there exists n with s=span{p^n}; s≠⊥ is essential. Lines533–535 read at the exact pin. |
| `mathlib:PadicInt.mem_span_pow_iff_le_valuation` | [Mathlib/NumberTheory/Padics/PadicIntegers.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean). For x≠0, x∈span{p^n} iff n≤x.valuation; the zero case must be handled separately. Lines460–461 read at the exact pin. |
| `mathlib:DihedralGroup.sr_mul_r` | [Mathlib/GroupTheory/SpecificGroups/Dihedral.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SpecificGroups/Dihedral.lean). Existing dihedral rotation/reflection algebra, statement and Group/ZMod context read at the exact Mathlib pin, lines100–101. Used only to transport a cyclic quotient of the arithmetic conjugation action. |
| `mathlib:DihedralGroup.sr_mul_sr` | [Mathlib/GroupTheory/SpecificGroups/Dihedral.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SpecificGroups/Dihedral.lean). Existing dihedral rotation/reflection algebra, statement and Group/ZMod context read at the exact Mathlib pin, lines104–105. Used only to transport a cyclic quotient of the arithmetic conjugation action. |
| `mathlib:DihedralGroup.inv_r` | [Mathlib/GroupTheory/SpecificGroups/Dihedral.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SpecificGroups/Dihedral.lean). Existing dihedral rotation/reflection algebra, statement and Group/ZMod context read at the exact Mathlib pin, lines108–109. Used only to transport a cyclic quotient of the arithmetic conjugation action. |
| `mathlib:DihedralGroup.inv_sr` | [Mathlib/GroupTheory/SpecificGroups/Dihedral.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SpecificGroups/Dihedral.lean). Existing dihedral rotation/reflection algebra, statement and Group/ZMod context read at the exact Mathlib pin, lines112–113. Used only to transport a cyclic quotient of the arithmetic conjugation action. |
| `mathlib:PadicInt.isUnit_iff` | [Mathlib/NumberTheory/Padics/PadicIntegers.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean). An element of ℤ_p is a unit iff its p-adic norm is1; used to distinguish the β-unit factors from the possibly nonunit Φ. |
| `mathlib:MonoidAlgebra.single` | [Mathlib/Algebra/MonoidAlgebra/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MonoidAlgebra/Defs.lean). The finite group-ring basis element r·g; this is not a completed arithmetic Iwasawa algebra. |
| `mathlib:Submodule.span` | [Mathlib/LinearAlgebra/Span/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Span/Defs.lean). The smallest module containing a supplied subset; useful for the Heegner line, without asserting arithmetic saturation. |
| `mathlib:LinearMap` | [Mathlib/Algebra/Module/LinearMap/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/Defs.lean). Bundled semilinear/linear maps between actual modules; used for supplied corestriction and localization maps. |
| `mathlib:MonoidHom` | [Mathlib/Algebra/Group/Hom/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean). Bundled multiplicative homomorphisms; finite CM character and character-power algebra. Continuity/topology of Γ remains a supplier condition. |
| `mathlib:TensorProduct.tmul` | [Mathlib/LinearAlgebra/TensorProduct/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Defs.lean). The canonical bilinear tensor of actual modules; it supplies the algebraic Heegner tensor, not a Selmer determinant comparison. |
| `mathlib:Module.finrank` | [Mathlib/LinearAlgebra/Dimension/Finrank.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Finrank.lean). Finite rank obtained from cardinal rank; rank assertions are prototyped on supplied fraction-field modules, never assumed to make the integral Selmer lattice free. |
| `mathlib:ENat` | [Mathlib/Data/ENat/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ENat/Defs.lean). Extended naturals ℕ∪{∞}; records zero-system divisibility and empty-stratum minima. |

## Part I: finite-level Heegner arithmetic (HE.0–HE.7)


<a id="he-0"></a>

## HE.0: Orders and ring-class towers

Instantiate the general order and class-field suppliers on transported toral orders. Conductor changes, unit indices, Artin restrictions and conjugation must use the actual inclusions and chosen separable closure. The relative CM tower and the local different comparison keep their own coefficient and normalization data.

<a id="he-0-local-toral-order"></a>

### Local toral order

**Declaration:** `TauCeti.Heegner.local_toral_order`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.0/local-toral-order`.

For a specified embedding ι:E_v↪B_v of a quadratic étale Q_v-algebra, a maximal Z_v-order O_v⊂B_v and g_v∈B_v×, the Heegner local order is ι⁻¹(g_v O_v g_v⁻¹). It is a full Z_v-order of the form Z_v+f_v O_{E_v}, is stable under quadratic conjugation, and is maximal away from finitely many places for a rational embedding and restricted adelic g.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** `mathlib:Subring.comap`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.

**Proof / construction.**

1. Use Subring.comap on the conjugate order; import the integral order carrier from GN11.
2. A basis (1,α) identifies any full local order by its second-coordinate ideal.
3. Extend a rational integral basis in B and exclude denominators/conductors to get maximality at almost all v.

**Sources.** [HE.0/khayutin](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), §2.4.4, Definition2.1 and Proposition2.2 p.165; Lemma2.3 p.166..

**Acceptance.**

- Include the split quadratic étale algebra; field-only types are insufficient.
- The global order is the intersection of all the transported local orders, and need not equal E∩O.

**Planet:** Local toral order.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer0`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-0-transported-global-order"></a>

### Transported global order

**Declaration:** `TauCeti.Heegner.transported_global_order`. **Kind:** comparison. **Stable node:** `HeegnerPointEulerSystems:HE.0/transported-global-order`.

For a rational quadratic embedding E↪B and a restricted adelic g, Λ=E∩∏_v Λ_v is a finite-index Z-order in O_E, with Λ⊗Z_v≃Λ_v. Its Picard group is the existing CommRing.Pic Λ, equivalently ClassGroup Λ; only invertible proper fractional ideals occur.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.0/local-toral-order](#he-0-local-toral-order), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`, `mathlib:ClassGroup.equivPic`.

**Proof / construction.**

1. Clear the finitely many local denominators, then use lattice intersection/localization from GN11.
2. Apply the pinned ClassGroup.equivPic for the domain Λ; no Dedekind hypothesis is required.

**Sources.** [HE.0/khayutin](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), §2.4.4, Definition2.6 p.166 and its following paragraph p.167..

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer0`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-0-idele-ideal-class-comparison"></a>

### Toral packet and ideal-class comparison

**Declaration:** `TauCeti.Heegner.idele_ideal_class_comparison`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.0/idele-ideal-class-comparison`.

For the imaginary quadratic transported order Λ, map a finite invertible idele t to the locally principal fractional ideal E∩t∏_v Λ_v. This induces the ordinary finite idele-class quotient the left quotient of A_E,f× by E× and the right quotient by Λ̂×≃Pic Λ and the S={∞} toral packet quotient C_S≃Pic Λ. The torus covering E×→E×/Q× is used explicitly; kernel triviality uses the class number one of Q.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.0/transported-global-order](#he-0-transported-global-order), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.

**Proof / construction.**

1. Import the GN11 idele–invertible-ideal equivalence and specialize to the transported order.
2. Separate the covering torus from the quotient torus; divide by Q-ideles and use principal Q-ideals.
3. A noninvertible adele maps to the adjoined zero in the extended construction; it is not an invertible ideal.

**Sources.** [HE.0/khayutin](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), §2.4.3 p.165; §2.4.4, Remark2.7 and Definition2.8 p.167 (unit-stabilizer correction E4)..

**Acceptance.**

- Restricted, not unrestricted, products are required.
- Unit stabilizers are Λ_v×, not Λ_v as a multiplicative monoid.

**Planet:** Toral packet and ideal-class comparison.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer0`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-0-conductor-change-kernel"></a>

### Conductor-change kernel

**Declaration:** `TauCeti.Heegner.conductor_change_kernel`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.0/conductor-change-kernel`.

Let K/Q be imaginary quadratic, c≥1 and ℓ prime. Extension of invertible ideals gives Pic(O_cℓ)→Pic(O_c), surjectively. If ℓ∤c, its kernel is (O_c/ℓO_c)×/((Z/ℓZ)×·image(O_c×)); thus u_c,ℓ·#ker=ℓ−χ_K(ℓ), where u_c,ℓ=[O_c×:O_cℓ×]. If ℓ|c, u_c,ℓ·#ker=ℓ. χ takes −1,0,1 in inert, ramified, split cases. Every quotient and map is induced by the actual inclusions of orders.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`, `mathlib:CommRing.Pic.mapRingHom`.

**Proof / construction.**

1. Import order Picard functoriality (GN11 and pinned mapRingHom).
2. Use the local unit quotient O_c,v×/O_cℓ,v×; identify the global-unit kernel.
3. Compute residue field, dual-number and split-product units; divide only after proving the unit index divides the local quotient cardinal.

**Sources.** [HE.0/cornut-vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §2.3 p.24 (successive local unit quotient); Appendix6.1 pp.61–63 (quadratic local orders)..

**Acceptance.**

- For Q(i), c=1, inert ℓ=3: u=2 and degree=2, not 4.
- For Q(√−3), c=1, inert ℓ=5: u=3 and degree=2, not 6.
- At repeated conductor primes the local quotient has cardinal ℓ, not ℓ+1.

**Planet:** Conductor-change kernel.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer0`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-0-ring-class-tower-quotients"></a>

### Ring-class tower and finite Galois quotients

**Declaration:** `TauCeti.Heegner.ring_class_tower_quotients`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`.

Using the ring-class existence theorem imported from CFT13, realize every K[c] in a fixed separable closure of K. For c|d, O_d⊂O_c gives K[c]⊂K[d] and restriction Gal(K[d]/K)→Gal(K[c]/K), compatible under composition and with ideal extension under Artin. Its kernel is Gal(K[d]/K[c]), and [K[cℓ]:K[c]] equals the kernel cardinal computed in conductor-change-kernel. Splitting of a prime away from the conductor is equivalent to its invertible ideal class being trivial; K[c]/K is unramified outside c and the exact local ramification is supplied by local unit reciprocity.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.0/conductor-change-kernel](#he-0-conductor-change-kernel), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Proof / construction.**

1. Import existence and canonical Artin isomorphisms, not merely an Artin map for a given field.
2. Convert order-unit inclusion to inclusion of class fields by the Galois correspondence.
3. Identify quotient restrictions, degrees and decomposition/inertia groups under reciprocity.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §3 pp.238–240; Cornut–Vatsal §2 pp.20–23.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Ring-class tower and finite Galois quotients.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer0`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-0-dihedral-conjugation"></a>

### Dihedral action on the tower

**Declaration:** `TauCeti.Heegner.dihedral_conjugation`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.0/dihedral-conjugation`.

For imaginary quadratic K/Q, K[c]/Q is Galois and a chosen complex conjugation τ satisfies τστ⁻¹=σ⁻¹ for σ∈Gal(K[c]/K). The conjugation is attached to an archimedean embedding and compatible throughout the tower. Do not equip a general ring class field with IsCMField: it need not be a CM field.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.0/ring-class-tower-quotients](#he-0-ring-class-tower-quotients), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `mathlib:DihedralGroup.sr_mul_r`, `mathlib:DihedralGroup.sr_mul_sr`, `mathlib:DihedralGroup.inv_r`, `mathlib:DihedralGroup.inv_sr`.

**Proof / construction.**

1. The ideal class of the conjugate invertible ideal is the inverse, since their product is a rational principal ideal.
2. Transport this identity through the imported Artin isomorphism and extend τ from the fixed separable closure.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §3, printed p.238 (conjugation action); Lemma4.3 proof p.242 (dihedral quotient)..

**Acceptance.**

- A nontrivial class group of exponent exceeding two gives a nonabelian dihedral extension over Q; no canonical CM-field involution is assumed.

**Planet:** Dihedral action on the tower.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer0`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The suggested signature transports the existing DihedralGroup rotation/reflection identity through a supplied homomorphism into the arithmetic group. It is the cyclic-quotient component of the tower action. The class-field identification and general abelian-class-group inversion remain omitted supplier conditions; no arbitrary group elements are asserted to satisfy the identity.

<a id="he-0-relative-cm-conductor-tower"></a>

### Relative CM conductor tower

**Declaration:** `TauCeti.Heegner.relative_cm_conductor_tower`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`.

Let F be totally real, K/F totally imaginary quadratic and P a finite prime of F of residue characteristic p. The imported orders O_Pn=O_F+PⁿO_K and class fields K[Pⁿ] have a compatible Galois inverse limit G∞. The finite idele/unit quotient realizes this limit; G∞ has finite torsion subgroup G0 and G∞/G0≃Z_p^[F_P:Q_p]. For sufficiently large n, [K[Pⁿ⁺¹]:K[Pⁿ]]=N(P), with the finite initial global-unit indices retained. The admissible level subgroup is the intersection with the specified quaternionic level, not an arbitrary replacement.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `HilbertModularVarietiesAndShimuraCurves:R18.1`.

**Proof / construction.**

1. Import general orders GN11 and relative class-field existence CFT12.
2. Use compact inverse limits and stabilization of global units to kill lim¹ in Cornut–Vatsal Lemma2.1.
3. Compute higher local quotients with the dual numbers and apply the actual Artin quotient maps.

**Sources.** [HE.0/cornut-vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §2 pp.20–23, Lemmas2.1–2.9; §1.1 p.4.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Relative CM conductor tower.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer0`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-0-norm-reciprocity-level-compatibility"></a>

### Norm, reciprocity and level compatibility

**Declaration:** `TauCeti.Heegner.norm_reciprocity_level_compatibility`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`.

For the relative CM towers and an inclusion of admissible finite-level subgroups, field restriction, finite idele quotient projection and order ideal extension commute under Artin. For a finite extension of CM bases, field norm and ideal norm agree with the imported functorial Artin map on the relevant finite quotient. Cornut–Vatsal uses geometric Frobenius: the arithmetic-Frobenius version in this packet inverts the reciprocity/Frobenius arguments before using any pointwise identity.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.0/relative-cm-conductor-tower](#he-0-relative-cm-conductor-tower), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention`.

**Proof / construction.**

1. Apply the CFT norm/restriction square to the actual level-unit subgroup.
2. Prove subgroup containment before descending a norm map; no norm map on the wrong order Picard group is assumed.
3. Apply the inverse convention comparison from GZ0 to every CM Galois-action formula.

**Sources.** [HE.0/cornut-vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §1.7 p.19, §2.1 pp.20–21, §3.8 p.35.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer0`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-0-local-different-discriminant"></a>

### Different of the local toral order

**Declaration:** `TauCeti.Heegner.local_different_discriminant`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.0/local-different-discriminant`.

For the local quadratic étale order Λ_v, define its trace dual Λ_v∨={a∈E_v:Tr(aΛ_v)⊆Z_v} using the imported lattice/trace pairing. Its inverse different is a principal invertible fractional Λ_v-ideal; the different is its inverse. The ideal norm (equivalently the absolute local discriminant valuation) agrees with the order discriminant. This does not identify the signed field norm of a generator with a positive discriminant; in a split conductor-π order a generator (π,−π) has norm −π².

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.0/local-toral-order](#he-0-local-toral-order), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.

**Proof / construction.**

1. Use a local integral basis (1,α), invert the trace matrix, and exhibit a generator of the dual.
2. Multiply by the conjugate linear-factor difference and check the ideal norm/discriminant valuation.
3. Retain the nonmaximal-order input: the maximal number-field different alone is insufficient.

**Sources.** [HE.0/khayutin](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), §5.2, Definition5.7 and Lemma5.8, printed p.184; normalization corrected in E5..

**Acceptance.**

- Check split, inert and ramified quadratic étale inputs, including residue characteristic two.
- Keep archimedean Euclidean-area discriminant π² or explicitly renormalize it; source finding PAPER-KHAYUTIN-19/E7 applies.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer0`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-1"></a>

## HE.1: CM points and modular quotients

Build the compatible optimal embeddings and descended CM points, then apply a fixed integral Jacobian quotient. Integral cusp/Hodge multiples, quotient degree and Manin constant are tracked before taking any Kummer class. A trace from K[1] defines the bottom point over K.

<a id="he-1-cm-cyclic-isogeny-pair"></a>

### CM cyclic-isogeny pair

**Declaration:** `TauCeti.Heegner.cm_cyclic_isogeny_pair`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.1/cm-cyclic-isogeny-pair`.

Assume K imaginary quadratic of discriminant different from −3,−4, N≥1 with every prime dividing N split, c prime to N, and an invertible O_c-ideal 𝔑_c with O_c/𝔑_c≃Z/NZ. For a proper invertible fractional ideal a, the pair C/a→C/(𝔑_c⁻¹a) is cyclic of degree N and gives the corresponding existing X₀(N) moduli point. The endomorphism ring is O_c; replacing a by αa gives the same level pair. Changing 𝔑 or its orientation is an explicitly recorded Galois/Fricke action, not literal equality.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.0/ring-class-tower-quotients](#he-0-ring-class-tower-quotients), `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `ModularCurvesPartII:R14.1`.

**Proof / construction.**

1. Use the imported CM elliptic curve and ideal-action theory, with the existing modular moduli interpretation.
2. Check the kernel 𝔑_c⁻¹a/a and its cyclic order N before applying the X₀(N) constructor.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §3, printed p.238 (the order and cyclic N-isogeny defining x_n)..

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** CM cyclic-isogeny pair.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer1`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-1-optimal-embedding-cm-points"></a>

### Optimal embeddings and quaternionic CM points

**Declaration:** `TauCeti.Heegner.optimal_embedding_cm_points`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`.

For F totally real, K/F CM, B ramified at all but one real place and specified finite places, and Eichler order R, an optimal embedding O_C↪R is an F-algebra embedding K↪B satisfying K∩R=O_C. K splits B iff K_v is a field at every ramified finite place (and the archimedean embedding condition holds). The CM double-coset description K×\B̂×/R̂× with a specified archimedean CM type identifies the complex CM points, with local optimal-embedding conditions required by the chosen Eichler level. It has not yet asserted rationality.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.0/relative-cm-conductor-tower](#he-0-relative-cm-conductor-tower), `HilbertModularVarietiesAndShimuraCurves:R18.1`, `HilbertModularVarietiesAndShimuraCurves:R18.4`, `ShimuraVarieties:V5`.

**Proof / construction.**

1. Use R18.1 for the specified quaternionic curve, field, level and uniformization; request its local optimal-order embedding criterion explicitly. H4/H5 Hilbert-level comparisons do not supply a quaternionic embedding theorem.
2. Use Skolem–Noether and the selected fixed point h_K; compare the canonical Shimura complex uniformization.
3. Check split primes at Γ₀ level and nonsplit ramified primes separately.

**Sources.** [HE.0/cornut-vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §3.8 pp.34–35; Zhang §3.2 pp.205–206.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Optimal embeddings and quaternionic CM points.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer1`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-1-canonical-model-cm-descent"></a>

### CM descent to the canonical tower

**Declaration:** `TauCeti.Heegner.canonical_model_cm_descent`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`.

For the CM level points above, the imported main CM theorem/canonical model reciprocity shows x_C∈X(K[C]) in the actual HE.0 tower. Its stabilizer is K× times the intersection of the finite torus with the chosen level; σ=rec_K(t) acts by x(g)↦x(t^εg) in Cornut–Vatsal’s geometric convention. Convert to arithmetic reciprocity with the inverse convention before comparison. The statement concerns the cyclic-isogeny pair or optimal embedding, not only j(E).

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.1/cm-cyclic-isogeny-pair](#he-1-cm-cyclic-isogeny-pair), [HE.1/optimal-embedding-cm-points](#he-1-optimal-embedding-cm-points), [HE.0/norm-reciprocity-level-compatibility](#he-0-norm-reciprocity-level-compatibility), `ComplexMultiplicationAndExplicitReciprocity:CM.2`, `ShimuraVarieties:V5`.

**Proof / construction.**

1. Apply CM1/CM2 for the modular pair and V5 for the quaternionic canonical model.
2. Identify the precise level stabilizer with the HE.0 order-unit subgroup.
3. Use fixed-field descent to produce an actual rational point, then compare all tower transition maps.

**Sources.** [HE.0/cornut-vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §3.8 p.35; Howard §1.7 p.19.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** CM descent to the canonical tower.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer1`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-1-jacobian-basepoint-denominators"></a>

### Jacobian basepoint and Hodge denominators

**Declaration:** `TauCeti.Heegner.jacobian_basepoint_denominators`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.1/jacobian-basepoint-denominators`.

For X₀(N) use the rational cusp ∞ to form [x−∞]. For a compact quaternionic curve use the imported normalized rational Hodge class ξ=(K_X+B_X)/deg(K_X+B_X), componentwise of degree one; x↦[x−ξ] lies in J⊗Q. Choose a nonzero integer d clearing the denominators to obtain the integral class [d x−d ξ]. Do not erase d. For an auxiliary ℓ₀, (ℓ₀+1−Tℓ₀)x is degree zero; after quotienting by an eigenform g, division by ℓ₀+1−aℓ₀ is valid integrally at p only if it is a p-adic unit.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.1/canonical-model-cm-descent](#he-1-canonical-model-cm-descent), `GrossZagierAndArithmeticHeights:GZ.3`, `EllipticCurveModularity:R29.5`, `ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi`.

**Proof / construction.**

1. Import ξ and Jacobian/Picard geometry from GZ3.
2. Apply degree and Hecke-eigenclass identities to x−ξ, retaining the divisor coefficient denominator.
3. Compare the cusp, Hodge and auxiliary-Hecke construction after rationalization; keep any integral torsion discrepancy.

**Sources.** [HE.0/cornut-vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §3.5 pp.29–32; Zhang Remark6 pp.205–206.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Jacobian basepoint and Hodge denominators.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer1`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-1-heegner-points-of-conductor-m-and-the-modular-parametrisation"></a>

### Heegner point family

**Declaration:** `TauCeti.Heegner.conductorPoint`. **Kind:** construction. **Stable node:** `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`.

Fix the descended CM family x_c, the level orientation, the integral cusp or d-cleared Hodge construction, and an actual fixed modular quotient φ:J→A defined over the base. Define P_c=φ([d x_c−d ξ])∈A(K[c]); the modular cusp branch has d=1. Keep deg φ and any Manin constant as data. Define y_K=Tr_{K[1]/K}P_1 separately: P_1 is generally not K-rational. In Lean the supplier geometry is an explicitly missing condition on the supplied CM points and map, not an invented CM-point carrier.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.1/canonical-model-cm-descent](#he-1-canonical-model-cm-descent), [HE.1/jacobian-basepoint-denominators](#he-1-jacobian-basepoint-denominators), `EllipticCurveModularity:R29.5`, `EllipticCurveModularity:R29.5/modular-parametrisation`, `ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi`.

**Proof / construction.**

1. Compose the actual CM-point map with the Jacobian and quotient maps.
2. Use canonical descent and functoriality to prove the field of definition.
3. Specialize to the classical cusp construction used by Gross and Howard.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), §1.7 p.19; Gross §1 p.236; Zhang §3.7 p.213.

**Uses determining the API.**

- Gross Proposition3.7: The chosen P_c are the terms in the norm and reduction identities.
- Howard Lemmas1.7.1–1.7.3: Differentiated points and local Kummer conditions use this actual family.
- Gross §1 p.236: The trace, quotient and Manin constant control the index.

**Planning API.**

- `TauCeti.Heegner.conductorPoint` (constructor): For a specified descended CM family x and the fixed integral Jacobian/modular map φ, conductorPoint φ x c=φ(x_c).
- `TauCeti.Heegner.conductorPoint_apply` (simp): Evaluation is the composite φ(x_c), with the d-cleared Jacobian class included in φ.
- `TauCeti.Heegner.conductorPoint_postcompose` (functoriality): Postcomposing φ by a defined homomorphism f carries each point to f(P_c).
- `TauCeti.Heegner.conductorPoint_galois` (compatibility): For a Galois-equivariant φ and action on the descended CM family, conductorPoint commutes with that action.

**Unit tests.**

- `TauCeti.Heegner.conductorPoint_cusp` (compatibility): For the classical cusp map, conductorPoint is φ([x_c−∞]); no Hodge denominator occurs.
- `TauCeti.Heegner.conductorPoint_zero_quotient` (degenerate): A zero quotient map yields the zero point at every conductor.
- `TauCeti.Heegner.conductorPoint_trace_not_basepoint` (non-example): For the two-element group acting on ℤ by negation, the selected point is 1 and its orbit trace is 1+(−1)=0. The point-family constructor returns 1, not its trace.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Heegner point family.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer1`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-1-parameter-choice-and-degree"></a>

### Parametrization choice, degree and torsion

**Declaration:** `TauCeti.Heegner.parameter_choice_and_degree`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.1/parameter-choice-and-degree`.

For the fixed Heegner family, ideal-class translation gives the corresponding Galois translation; a Fricke/orientation change acts by the recorded eigenvalue and rational cusp-torsion translation. Multiplying the modular parametrization or clearing Hodge denominators scales P_c and the bottom trace by that integer. For Gross’s rational optimal curve, φ*ω_E=c_φ·(2πif(z)dz), with positive integral Manin constant c_φ; the index I_K/c_φ is invariant under the appropriate isogeny change, not I_K alone.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation](#he-1-heegner-points-of-conductor-m-and-the-modular-parametrisation), `EllipticCurveModularity:R29.5`, `GrossZagierAndArithmeticHeights:GZ.3`.

**Proof / construction.**

1. Use CM ideal reciprocity and the actual quotient’s Hecke/Fricke action.
2. Use Manin–Drinfeld only for the cusp-difference torsion term; do not remove it until a prime-to-p argument is supplied.
3. Track the differential, degree and scalar under composition/isogeny.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §1 pp.236–237; §5 pp.243–244; Zhang Remarks6–7.

**Acceptance.**

- Trace is independent of coset representatives, but an individual point need not be.
- A p-divisible scaling of φ destroys primitivity without destroying non-torsion.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer1`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-2"></a>

## HE.2: Norm relations and reduction

Prove the initial and repeated conductor traces with unit factors and all split/inert branches. The reduction congruence is pointwise and uses specified residue fields. Quaternionic specializations retain the matching embeddings and the distinct q∤m and q∣m models.

<a id="he-2-cm-hecke-conductor-classification"></a>

### Hecke neighbors of a CM point

**Declaration:** `TauCeti.Heegner.cm_hecke_conductor_classification`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification`.

At a finite prime P where B is split and the Eichler level is maximal, let ε_P=−1,0,1 for inert, ramified, split K/F. A level-zero CM lattice has 1+ε_P horizontal neighbors and N(P)−ε_P ascending neighbors of conductor P. At positive conductor n it has one predecessor of conductor n−1 and N(P) ascending neighbors of conductor n+1. The ascending set is a torsor for O_n×/O_n+1×. Global unit stabilizers must be divided out when converting this local sum into a field trace.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.1/optimal-embedding-cm-points](#he-1-optimal-embedding-cm-points), [HE.0/conductor-change-kernel](#he-0-conductor-change-kernel), `HilbertModularVarietiesAndShimuraCurves:R18.4`.

**Proof / construction.**

1. Specialize the imported quaternionic local lattice/moduli description.
2. Use the order residue algebra and its action on P¹, as in Cornut–Vatsal Lemmas6.1 and6.5.
3. Descend the neighbor enumeration through the actual CM moduli map.

**Sources.** [HE.0/cornut-vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Appendix6.1–6.2 pp.62–64.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Hecke neighbors of a CM point.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer2`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-2-norm-relation-and-reduction-congruence"></a>

### Inert Heegner norm relation

**Declaration:** `TauCeti.Heegner.norm_relation_and_reduction_congruence`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`.

Under the classical Heegner hypothesis, ℓ prime with ℓ∤cN and inert in K, the compatible cusp-normalized family satisfies u_c,ℓ·Tr_{K[cℓ]/K[c]}P_cℓ=a_ℓP_c. With ordinary units u=1 this is the Gross/Howard equality. For a d-cleared Hodge family, first prove that the chosen basepoint is a Hecke eigenclass and transport the divisor relation; retain any integral torsion difference if only a rational eigenclass identity is known.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.2/cm-hecke-conductor-classification](#he-2-cm-hecke-conductor-classification), [HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation](#he-1-heegner-points-of-conductor-m-and-the-modular-parametrisation), [HE.0/conductor-change-kernel](#he-0-conductor-change-kernel), `EllipticCurveModularity:R29.5`.

**Proof / construction.**

1. Apply the previous Hecke-neighbor enumeration with ε=−1.
2. Compare the local unit orbit to the actual field trace using HE.0’s kernel calculation.
3. Apply the Hecke-equivariant fixed modular quotient.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition3.7(i), pp.240–241; Howard §1.7 p.19.

**Acceptance.**

- Do not silently assert degree ℓ+1 for the two exceptional unit fields.
- The equation is on actual points after all basepoint/torsion terms have been proved to disappear.

**Planet:** Inert Heegner norm relation.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer2`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-2-split-ramified-first-step-recurrence"></a>

### Split and ramified first-step relations

**Declaration:** `TauCeti.Heegner.split_ramified_first_step_recurrence`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence`.

For ℓ∤cN, the local divisor trace with u_c,ℓ retained equals T_ℓx_c−(σ_ℓ+σ_ℓbar)x_c in the split case and T_ℓx_c−σ_ℓx_c in the ramified case. Here Frobenius on the lower-conductor field is unramified at ℓ; the ramified case refers to K/Q ramification, not ramification of K[c]/K away from c. Use the specified reciprocity convention. After the fixed eigenquotient replace T_ℓ by a_ℓ only with the exact Jacobian basepoint corrections.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.2/cm-hecke-conductor-classification](#he-2-cm-hecke-conductor-classification), [HE.0/norm-reciprocity-level-compatibility](#he-0-norm-reciprocity-level-compatibility), [HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation](#he-1-heegner-points-of-conductor-m-and-the-modular-parametrisation).

**Proof / construction.**

1. Apply Corollary6.6 with n=1 and the horizontal-neighbor list.
2. Invert geometric Frobenius when converting Cornut–Vatsal’s formula to the arithmetic convention.
3. Carry the complete divisor relation through the quotient.

**Sources.** [HE.0/cornut-vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Corollary6.6, p.64.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Split and ramified first-step relations.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer2`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-2-repeated-conductor-predecessor-recurrence"></a>

### Repeated-conductor predecessor relation

**Declaration:** `TauCeti.Heegner.repeated_conductor_predecessor_recurrence`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence`.

At maximal local quaternionic level and conductor exponent n≥2, the local unit trace of a CM point x of conductor n is T_P^lower(pr^upper x)−pr^lower(pr^upper x). On a coherent chosen chain this gives the repeated-conductor recurrence, with predecessor and central scaling specified. Passing to the global field trace divides the orbit by the actual global-unit stabilizer; it must not simply copy the first-step inert ℓ+1 formula.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.2/cm-hecke-conductor-classification](#he-2-cm-hecke-conductor-classification), [HE.0/conductor-change-kernel](#he-0-conductor-change-kernel), [HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation](#he-1-heegner-points-of-conductor-m-and-the-modular-parametrisation).

**Proof / construction.**

1. Use Lemma6.5’s unique predecessor, then Corollary6.6.
2. Prove that the chosen conductor chain’s two predecessor operations match the modular CM orientation and central action.
3. Only then translate the recurrence to Heegner quotient points.

**Sources.** [HE.0/cornut-vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Corollary6.6, p.64.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Repeated-conductor predecessor relation.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer2`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-2-nonmaximal-level-distribution"></a>

### Distribution at nonmaximal local level

**Declaration:** `TauCeti.Heegner.nonmaximal_level_distribution`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution`.

For a prime P with Eichler level exponent δ=1, orient the lattice pair and its type I/II. For conductor ≥2, its unit trace equals the appropriate upper/lower Hecke operator on its predecessor and becomes −pr(x) in the P-new quotient. For δ≥2, type I/II points have zero trace in the P-new quotient; type III is excluded. Reversing the orientation exchanges types I and II. These are divisor-module statements before any abelian quotient.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.1/optimal-embedding-cm-points](#he-1-optimal-embedding-cm-points), [HE.2/cm-hecke-conductor-classification](#he-2-cm-hecke-conductor-classification), `HilbertModularVarietiesAndShimuraCurves:R18.4`.

**Proof / construction.**

1. Import the local Eichler lattice-pair interpretation and P-new quotient.
2. Apply Cornut–Vatsal Lemmas6.11 and6.14, retaining the leading vertex/type and orientation.
3. Verify the quotient used by the chosen modular form is genuinely P-new.

**Sources.** [HE.0/cornut-vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Appendix6.3–6.4 pp.65–67.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer2`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-2-inert-reduction-frobenius-congruence"></a>

### Heegner reduction congruence

**Declaration:** `TauCeti.Heegner.inert_reduction_frobenius_congruence`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence`.

For the classical compatible family, ℓ∤cND inert, choose compatible primes λ_cℓ|λ_c over ℓ and the actual good-reduction specialization maps. Then red_λcℓ(P_cℓ)=Frob_λc(red_λc(P_c)) after the specified residue-field identifications; Frobenius is the ℓ-power geometric endomorphism on the reduction of the modular/elliptic curve as fixed in Gross’s convention. State separately the Artin arithmetic-Frobenius conversion. This is pointwise, not merely an equality of traces.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.2/norm-relation-and-reduction-congruence](#he-2-norm-relation-and-reduction-congruence), `NeronModelsAndSemistableAbelianVarieties:R11.2`, `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura`, `ModularCurvesPartII:R14.6/neron-hecke-extension`.

**Proof / construction.**

1. Apply the imported geometric Eichler–Shimura relation T_ℓ=Fr+Fr∨.
2. Use the CM branch specializing to the inseparable isogeny and the total ramification/residue F_ℓ² calculation.
3. Carry specialization through the Néron-model extension of the quotient.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition3.7(ii) and proof, pp.240–241.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Heegner reduction congruence.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer2`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-2-quaternionic-reduction-specialization"></a>

### Quaternionic CM reduction and specialization

**Declaration:** `TauCeti.Heegner.quaternionic_reduction_specialization`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.2/quaternionic-reduction-specialization`.

For Zhang’s m∈Λ′+ and an admissible q∤m, reduction of x_m(n) at q is x_mq(n) in the definite Shimura set, using the matched optimal embedding and supersingular identification. For q|m, specialization is x_m/q(n) on the chosen vertex copy of the semistable reduction graph. Both formulas require the same CM/basepoint identifications and the prime λ=qO_K splitting completely in the CM fields of definition over K (in particular K[n]/K, since q∤n). Rational q is inert in K/Q; reduction uses residue field F_q².

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; q is an admissible prime, n∈Λ and m∈Λ′+, so q∤n by disjointness of Λ and Λ′. The chosen prime above λ and the reader conventions are fixed.

**Prerequisites.** [HE.1/optimal-embedding-cm-points](#he-1-optimal-embedding-cm-points), [HE.1/canonical-model-cm-descent](#he-1-canonical-model-cm-descent), `NeronModelsAndSemistableAbelianVarieties:R11.6`, `HilbertModularVarietiesAndShimuraCurves:R18.2`, `HilbertModularVarietiesAndShimuraCurves:R18.3`, `HilbertModularVarietiesAndShimuraCurves:R18.5`.

**Proof / construction.**

1. Import Cerednik–Drinfeld and good-reduction moduli models, not re-prove them.
2. Match the basepoint-induced embeddings K↪B_mq and K↪B_m/q.
3. Compute the norm/forgetful maps on the finite double cosets as in (3.18)–(3.19).

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §§3.4–3.6, pp.207–211, Theorem3.1.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer2`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-3"></a>

## HE.3: Kummer classes and local conditions

Apply finite and continuous Tate Kummer maps to these points. Good places, bad components, coefficient primes and archimedean corrections are separate checks. Integral saturation and local quotient torsion are recorded before replacing a lattice by its rationalization.

<a id="he-3-kummer-classes-and-the-modified-selmer-conditions"></a>

### Heegner Kummer classes

**Declaration:** `TauCeti.Heegner.kummer_classes_and_the_modified_selmer_conditions`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`.

Apply the imported finite Kummer injection E(K[c])/p^mE(K[c])→H¹_cont(K[c],E[p^m]) to P_c. Apply the imported p-adic Kummer map to the compatible p-completion to obtain the integral T_pE class. The finite classes are its actual coefficient reductions, and restriction/corestriction commute with the field maps/point trace, including all trace/unit constants from HE.2. The Tate module has its inverse-limit topology and finite torsion coefficients their discrete topology.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation](#he-1-heegner-points-of-conductor-m-and-the-modular-parametrisation), [HE.2/norm-relation-and-reduction-congruence](#he-2-norm-relation-and-reduction-congruence), `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `SelmerIwasawaCohomology:L0`.

**Proof / construction.**

1. Use EllipticCurves Layer7 and L0, not the multiplicative μ_n Kummer map as an elliptic Kummer map.
2. Apply connecting-homomorphism naturality to the exact multiplication sequence and the actual trace maps.
3. Use the continuous inverse-limit comparison, recording any lim¹/invariant obstruction.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), §§1.1,1.7 pp.5–8,19–21; Gross §4 pp.241–243.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Heegner Kummer classes.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer3`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-3-good-place-kummer-unramified"></a>

### Good-place Kummer condition

**Declaration:** `TauCeti.Heegner.good_place_kummer_unramified`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.3/good-place-kummer-unramified`.

For ℓ≠p of good reduction, the finite Kummer image E(K_v)/p^m agrees with H¹_unr(K_v,E[p^m]); in particular P_c’s Kummer class is unramified at such v, after transfer to the relevant field. The proof uses the Néron model and unramified torsion, not a claim that all local cohomology is unramified.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.3/kummer-classes-and-the-modified-selmer-conditions](#he-3-kummer-classes-and-the-modified-selmer-conditions), `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `SelmerIwasawaCohomology:L1`.

**Proof / construction.**

1. Import the good-reduction Kummer/unramified comparison from EC7/L1.
2. Apply it to the actual local point and use specialization for the finite torsion quotient.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §7 pp.247–249.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer3`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-3-bad-place-component-obstruction"></a>

### Component obstruction at bad places

**Declaration:** `TauCeti.Heegner.bad_place_component_obstruction`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`.

For finite v∤p, compare the local point Kummer image with the propagated rational unramified condition. The discrepancy factors through the p-primary component group of the Néron model, together with the precise local invariants/quotient torsion terms. Equality requires the appropriate obstruction to vanish; residual irreducibility alone does not remove it. For Gross’s derived d(n), the cusp-divisor and connected-Néron-model argument proves local triviality away from n even at primes dividing N.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.3/kummer-classes-and-the-modified-selmer-conditions](#he-3-kummer-classes-and-the-modified-selmer-conditions), `NeronModelsAndSemistableAbelianVarieties:R11.2`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `NeronModelsAndSemistableAbelianVarieties:R11.2/component-group`, `NeronModelsAndSemistableAbelianVarieties:R11.2/elliptic-filtration`, `SelmerIwasawaCohomology:L2/finite-unramified-comparison`.

**Proof / construction.**

1. Import the exact local Néron component sequence and unramified connected-part H¹ vanishing.
2. Apply the Heegner cusp-divisor identity and prime-to-p rational cusp torsion under Gross’s big-image hypothesis.
3. Distinguish this special derived-class argument from a universal integral unramified-condition equality.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition6.2 and proof, pp.244–247.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Component obstruction at bad places.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer3`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-3-coefficient-prime-local-condition"></a>

### Kummer condition at the coefficient prime

**Declaration:** `TauCeti.Heegner.coefficient_prime_local_condition`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.3/coefficient-prime-local-condition`.

At v|p with good reduction, the actual Kummer class of P_c satisfies the finite/crystalline rational condition and its integral propagated Kummer condition. In the good ordinary branch compare with the Greenberg filtration only under the exact ordinary/crystalline comparison hypotheses and retain local-torsion error terms. A rational equality after tensoring with Q_p is not an equality of integral lattices.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.3/kummer-classes-and-the-modified-selmer-conditions](#he-3-kummer-classes-and-the-modified-selmer-conditions), `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L2/condition-propagation`, `SelmerIwasawaCohomology:L2/greenberg-condition`, `SelmerIwasawaCohomology:L4/bloch-kato-condition`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Proof / construction.**

1. Apply the finite-flat/crystalline Kummer theorem from R07 and EC7.
2. Use the actual point Kummer class and the propagated T→V→A diagrams.
3. In the ordinary branch use L2’s local filtration comparison and record its defect.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), §1.6, Theorem1.6.5 proof, pp.18–19.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Kummer condition at the coefficient prime.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer3`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-3-saturated-integral-kummer-lattice"></a>

### Saturated integral Kummer comparison

**Declaration:** `TauCeti.Heegner.saturated_integral_kummer_lattice`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.3/saturated-integral-kummer-lattice`.

Compare the actual finite/p-adic Heegner Kummer classes in the Selmer lattice with E(K)⊗Z_p, V_pE, and E[p∞]. Use the Kummer exact sequence to identify the quotient by the Mordell–Weil lattice with the appropriate Sha group. Saturation is a separate integral assertion; the finite cokernel and local component-group defects must be retained before rationalizing.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.3/kummer-classes-and-the-modified-selmer-conditions](#he-3-kummer-classes-and-the-modified-selmer-conditions), [HE.3/bad-place-component-obstruction](#he-3-bad-place-component-obstruction), [HE.3/coefficient-prime-local-condition](#he-3-coefficient-prime-local-condition), `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `SelmerIwasawaCohomology:L0`, `SelmerIwasawaCohomology:L2/lattice-passage`, `SelmerIwasawaCohomology:L2/elliptic-selmer-instance`.

**Proof / construction.**

1. Import the EC7 Kummer exact sequences and L0 inverse-limit comparison.
2. Use the actual coefficient reduction maps, not unrelated choices of finite classes.
3. Compute the torsion kernel/cokernel of integral-to-rational propagation.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), Introduction pp.1–3; §1.6 pp.18–19.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer3`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-3-archimedean-tate-correction"></a>

### Archimedean Tate correction

**Declaration:** `TauCeti.Heegner.archimedean_tate_correction`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.3/archimedean-tate-correction`.

Over imaginary quadratic K all archimedean completions are C, so the relevant local H¹ vanishes. In descent to Q at a real place use the real/Tate local condition on the actual E[p^m] module. Odd p permits the usual conjugation eigenspace splitting; at p=2 its kernel/cokernel must be retained and one cannot divide by two on an integral Z₂ lattice.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.3/kummer-classes-and-the-modified-selmer-conditions](#he-3-kummer-classes-and-the-modified-selmer-conditions), `ArithmeticGaloisDuality:R02.4`.

**Proof / construction.**

1. Apply the imported real Galois/Tate cohomology calculation from R02.
2. Specialize to E[p^m] and distinguish complex K from the real Q base.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition6.2, p.245; §8 p.249.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer3`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-4"></a>

## HE.4: Derivatives and descent

Use the generic Euler-system derivative with the sum coefficient ideal and the complete ring-class Galois action. Prove torsion-invariant vanishing before inverting restriction. The explicit cocycle characterizes point divisibility; the bottom is the trace Kummer class, and the cyclic tensor retains generator changes.

<a id="he-4-heegner-coefficient-ideal"></a>

### Heegner conductor coefficient ideal

**Declaration:** `TauCeti.Heegner.coefficientIdeal`. **Kind:** construction. **Stable node:** `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`.

Fix an odd prime p and an actual Hecke eigenvalue function a_ℓ. Set I_ℓ=(a_ℓ,ℓ+1)⊂Z_p and I_n=Σ_{ℓ|n}I_ℓ for squarefree n of admissible inert primes. The quotient is Z_p/I_n. For n=1 the empty sum is zero, so the coefficient module is the full Tate lattice, not its residual reduction. If n>1 then I_n=(p^M(n)) with M(n)=min_{ℓ|n}min(v_p(a_ℓ),v_p(ℓ+1)). An intersection/product would give the wrong modulus.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** `mathlib:PadicInt`, `EulerSystemsAndKolyvaginSystems:ES.3`, `mathlib:PadicInt.ideal_eq_span_pow_p`, `mathlib:PadicInt.mem_span_pow_iff_le_valuation`.

**Proof / construction.**

1. Use existing PadicInt and Ideal.span.
2. Form the finite sum of ideals. Apply PadicInt.ideal_eq_span_pow_p only after proving I_n≠0 for n>1 from ℓ+1≠0; use mem_span_pow_iff_le_valuation on nonzero generators and handle a_ℓ=0 separately. The minimum ideal valuation follows from the order of these principal ideals.
3. Compare the quotient to the coefficient reduction used by ES3.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), §1.7 pp.19–20; Zhang §1 p.194 and Notations p.202.

**Uses determining the API.**

- Howard Lemma1.7.1: Both Hecke eigenvalue and cyclic extension degree vanish modulo I_n.
- Zhang §3.7 pp.212–213: The allowable exponent M is the minimum conductor modulus.

**Planning API.**

- `TauCeti.Heegner.coefficientIdeal` (constructor): For the finite prime set s and eigenvalues a, coefficientIdeal p a s=Σ_{ℓ∈s}span{a_ℓ,ℓ+1} in Z_p.
- `TauCeti.Heegner.coefficientIdeal_empty` (simp): coefficientIdeal p a ∅=0.
- `TauCeti.Heegner.coefficientIdeal_insert` (relation): For ℓ∉s, the ideal for insert ℓ s is span{a_ℓ,ℓ+1}+the ideal for s.
- `TauCeti.Heegner.coefficientIdeal_le_of_subset` (functoriality): s⊆t implies I_s≤I_t, hence there is the quotient map Z_p/I_s→Z_p/I_t.

**Unit tests.**

- `TauCeti.Heegner.coefficientIdeal_conductor_one` (degenerate): The empty conductor has zero ideal, so it does not force p to vanish.
- `TauCeti.Heegner.coefficientIdeal_prime_five` (computation): For p=5, s={19}, a_19=10, the ideal is (5).
- `TauCeti.Heegner.coefficientIdeal_min_not_max` (non-example): For p=5, s={19,149}, a_19=10,a_149=25, the ideal is (5), not (25); the sum takes the minimum valuation.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Heegner conductor coefficient ideal.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer4`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-4-differentiated-point-invariance"></a>

### Differentiated point invariance

**Declaration:** `TauCeti.Heegner.differentiated_point_invariance`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.4/differentiated-point-invariance`.

For the actual squarefree ring-class conductor n, let G_n=Gal(K[n]/K[1]) be the product of its cyclic inert factors and 𝒢_n=Gal(K[n]/K). Under ordinary units and the clean torsion-image hypotheses, choose generators σ_ℓ and coset representatives S for 𝒢_n/G_n. Use ES3’s D_n=∏D_ℓ and set the differentiated point ˜P_n=Σ_{s∈S}sD_nP_n. Its class modulo I_n is 𝒢_n-invariant and independent of S. Use the full 𝒢_n action, not merely invariance under G_n. Exceptional-unit factors require a modified bounded-denominator construction, not an assumed direct product.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.4/heegner-coefficient-ideal](#he-4-heegner-coefficient-ideal), [HE.2/norm-relation-and-reduction-congruence](#he-2-norm-relation-and-reduction-congruence), `EulerSystemsAndKolyvaginSystems:ES.3`, [HE.0/ring-class-tower-quotients](#he-0-ring-class-tower-quotients).

**Proof / construction.**

1. Apply ES3’s (σ−1)D=|G|−Norm identity to HE2’s actual norm relation.
2. Both a_ℓ and ℓ+1 vanish in the actual coefficient ideal.
3. Sum over the class-group cosets and show changing representatives contributes zero modulo I_n.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), Lemma1.7.1 pp.19–20; Gross §4 pp.241–243.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer4`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-4-ring-class-torsion-invariants"></a>

### Vanishing of ring-class torsion invariants

**Declaration:** `TauCeti.Heegner.ring_class_torsion_invariants`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.4/ring-class-torsion-invariants`.

Under Gross’s odd-p full residual image hypothesis or Howard’s full G_K Tate-image hypothesis, E[p^m](K[n])=0 for the relevant ring-class towers and all m≥1. The residual case uses the generalized-dihedral nature of K[n]/Q and the irreducible two-dimensional image; bootstrap finite exponent using multiplication by p. This statement is not implied by residual irreducibility for arbitrary field extensions.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.0/dihedral-conjugation](#he-0-dihedral-conjugation), `ArithmeticGaloisRepresentations:R01.4`.

**Proof / construction.**

1. Apply the actual field/Galois quotient from HE0.
2. Use the image subgroup and dihedral quotient argument in Gross Lemma4.3.
3. Reduce any nonzero p^m invariant to nonzero p-torsion.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Lemma4.3, statement p.241 and proof p.242; Howard Lemma1.7.1 proof p.20..

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Vanishing of ring-class torsion invariants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer4`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-4-kolyvagin-derivative-classes-and-descent-to-k"></a>

### Descended Heegner derivative class

**Declaration:** `TauCeti.Heegner.descendedClass`. **Kind:** construction. **Stable node:** `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`.

Under the proved torsion-invariant vanishing, inflation–restriction gives res:H¹_cont(K,E[p^m])≃H¹_cont(K[n],E[p^m])^𝒢_n for m≤M(n). Define c_m(n) as res⁻¹ of the Kummer class of ˜P_n. For integral conductor-one use the T_pE Kummer class of y_K. Without invariant vanishing, keep the H¹/H² kernel/cokernel terms and use the separate error-tolerant ES3/4 construction; there is no unrestricted unique inverse.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.4/differentiated-point-invariance](#he-4-differentiated-point-invariance), [HE.4/ring-class-torsion-invariants](#he-4-ring-class-torsion-invariants), [HE.3/kummer-classes-and-the-modified-selmer-conditions](#he-3-kummer-classes-and-the-modified-selmer-conditions), `EulerSystemsAndKolyvaginSystems:ES.3`, `ArithmeticGaloisDuality:R02.2/five-term-transgression`.

**Proof / construction.**

1. Use the actual finite Galois restriction map from R02, whose inverse exists only after the previous node.
2. Apply it to the invariant differentiated Kummer class.
3. Check that the resulting class has the prescribed restriction, independent of cocycle/root/representative choices.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §4 pp.242–243; Howard Lemmas1.7.1–1.7.2 p.20; Zhang(3.21) p.213.

**Uses determining the API.**

- Gross Proposition4.7: Divisibility of the actual differentiated point detects c(n) and its torsor image d(n).
- Howard Lemma1.7.3: Finite/transverse local conditions are proved on this descended class.

**Planning API.**

- `TauCeti.Heegner.descendedClass` (constructor): descendedClass resInv z is the unique class whose restriction is the invariant differentiated Kummer class z.
- `TauCeti.Heegner.descendedClass_restrict` (characterisation): Its actual restriction equals z.
- `TauCeti.Heegner.descendedClass_unique` (extensionality): Any class with restriction z equals descendedClass resInv z.
- `TauCeti.Heegner.descendedClass_natural` (functoriality): A commuting coefficient/restriction square carries descendedClass to the class obtained by descending the reduced differentiated Kummer class.

**Unit tests.**

- `TauCeti.Heegner.descendedClass_zero` (degenerate): The zero invariant differentiated Kummer class descends to zero.
- `TauCeti.Heegner.descendedClass_identity` (compatibility): For the trivial field extension, resInv=id and descendedClass is the Kummer class itself.
- `TauCeti.Heegner.descendedClass_noninjective_obstruction` (non-example): A restriction map with nonzero kernel does not define a unique descended class; the constructor requires the proved additive equivalence.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Descended Heegner derivative class.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer4`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-4-explicit-cocycle-divisibility"></a>

### Explicit cocycle and divisibility criterion

**Declaration:** `TauCeti.Heegner.explicit_cocycle_divisibility`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.4/explicit-cocycle-divisibility`.

Choose p^mQ=˜P_n over the separable closure. The class c_m(n) is represented by σQ−Q−(σ˜P_n−˜P_n)/p^m, where the last quotient is the uniquely specified K[n]-rational division term under torsion vanishing. Hence c_m(n)=0 iff ˜P_n∈p^mE(K[n]); its image d_m(n) in H¹(K,E)[p^m] vanishes iff ˜P_n∈p^mE(K[n])+E(K), with descent interpreted through the actual restriction map.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.4/kolyvagin-derivative-classes-and-descent-to-K](#he-4-kolyvagin-derivative-classes-and-descent-to-k), [HE.4/ring-class-torsion-invariants](#he-4-ring-class-torsion-invariants), [HE.3/kummer-classes-and-the-modified-selmer-conditions](#he-3-kummer-classes-and-the-modified-selmer-conditions).

**Proof / construction.**

1. Compute the connecting cocycle and subtract the division correction.
2. Check cocycle continuity and root-change coboundaries, using the finite algebraic field of definition.
3. Apply the Kummer exact sequence and injective restriction; retain the genuine K-rational summand for d.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Explicit cocycle (4.6) and Proposition4.7, printed p.242; Howard Lemma1.7.2 p.20..

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer4`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-4-bottom-trace-class"></a>

### Bottom class is the trace Kummer class

**Declaration:** `TauCeti.Heegner.bottom_trace_class`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.4/bottom-trace-class`.

At n=1, D_1=1 and the sum over 𝒢_1 gives y_K=Tr_{K[1]/K}P_1. Thus c_m(1)=δ_m(y_K) and the integral bottom class κ_1=δ_T(y_K), while d_m(1)=0. This is not δ(P_1) over K unless P_1 already descends.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.4/kolyvagin-derivative-classes-and-descent-to-K](#he-4-kolyvagin-derivative-classes-and-descent-to-k), [HE.4/heegner-coefficient-ideal](#he-4-heegner-coefficient-ideal), [HE.3/kummer-classes-and-the-modified-selmer-conditions](#he-3-kummer-classes-and-the-modified-selmer-conditions).

**Proof / construction.**

1. Apply the empty-product identity and the exact finite field trace.
2. Use Kummer/corestriction naturality from HE3.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Definition(4.1), printed p.241, and note after Proposition4.7 p.242; Howard §1.7 p.20; Zhang(3.22) p.213..

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Bottom class is the trace Kummer class.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer4`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-4-generator-tensor-choice-independence"></a>

### Generator change and intrinsic tensor coefficient

**Declaration:** `TauCeti.Heegner.generator_tensor_choice_independence`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence`.

After tensoring with G(n)=⊗_{ℓ|n}Gal(K[ℓ]/K[1]), the Heegner derivative class has the prescribed ES3 generator-change transformation law; changing σ_ℓ to σ_ℓ^u changes the derivative class by the inverse unit factor modulo I_n and the cyclic tensor generator by the compensating factor. State compatibility with lift/coset choices separately. Do not assert raw scalar classes are generator-independent.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.4/kolyvagin-derivative-classes-and-descent-to-K](#he-4-kolyvagin-derivative-classes-and-descent-to-k), `EulerSystemsAndKolyvaginSystems:ES.3`, [HE.0/ring-class-tower-quotients](#he-0-ring-class-tower-quotients).

**Proof / construction.**

1. Apply ES3’s cyclic derivative change-of-generator identity.
2. Tensor with the actual cyclic factors from HE0 and use the coefficient modulus.
3. Verify a two-prime generator change independently in each tensor factor.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), Theorem1.7.5 pp.20–21; Gross §4 p.242.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Generator change and intrinsic tensor coefficient.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer4`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-4-coefficient-and-prime-set-compatibility"></a>

### Coefficient reduction and auxiliary-prime restriction

**Declaration:** `TauCeti.Heegner.coefficient_and_prime_set_compatibility`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility`.

For m′≤m≤M(n), reduction E[p^m]→E[p^m′] takes c_m(n) to c_m′(n) under the exact chosen division/Kummer conventions. Restricting the permitted auxiliary-prime set restricts the same family; adding primes extends the family only when the conductor/norm/reduction hypotheses and tensor factors are proved for them. No map removing a prime factor of n is assumed without the local system relation.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.4/kolyvagin-derivative-classes-and-descent-to-K](#he-4-kolyvagin-derivative-classes-and-descent-to-k), [HE.4/heegner-coefficient-ideal](#he-4-heegner-coefficient-ideal), `EulerSystemsAndKolyvaginSystems:ES.3`, `EulerSystemsAndKolyvaginSystems:ES.2`.

**Proof / construction.**

1. Use the commuting Kummer/restriction square and uniqueness of descended classes.
2. Apply ES2/3 indexing-family restriction and compare conductor ideals.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §3.7 pp.211–213; Howard §1.7 pp.19–21.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer4`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-4-complex-conjugation-parity"></a>

### Parity of the Heegner derivative class

**Declaration:** `TauCeti.Heegner.complex_conjugation_parity`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.4/complex-conjugation-parity`.

For odd p and the clean classical branch, if ε is the Fricke eigenvalue of the eigenquotient, τc_m(n)=ε(−1)^ν(n)c_m(n); equivalently using the global root number w=−ε, this is w(−1)^(ν(n)+1). The torsion term from the basepoint/Fricke relation is removed only after its prime-to-p proof. At p=2 this formula does not yield an integral direct-sum eigenspace decomposition.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.1/parameter-choice-and-degree](#he-1-parameter-choice-and-degree), [HE.4/kolyvagin-derivative-classes-and-descent-to-K](#he-4-kolyvagin-derivative-classes-and-descent-to-k), `EulerSystemsAndKolyvaginSystems:ES.3`, [HE.3/archimedean-tate-correction](#he-3-archimedean-tate-correction).

**Proof / construction.**

1. Use the actual CM conjugation/Fricke relation from HE1.
2. Compute τ on cyclic generators and ES3’s derivative, retaining the norm terms before reduction.
3. Kill only the proved prime-to-p cusp-torsion correction.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition5.4 pp.243–244; Zhang(3.24) p.213.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Parity of the Heegner derivative class.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer4`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-5"></a>

## HE.5: Local comparison and prime detection

Verify transverse conditions and the arithmetic χ correction, then the actual H.0–H.5 hypotheses of the generic self-dual theorem. The global χ localization square remains explicit unfinished work. Residual Kummer fields and prescribed Frobenius give class detection; component defects and local torsion are independent errors.

<a id="he-5-heegner-transverse-local-condition"></a>

### Transverse condition of the descended class

**Declaration:** `TauCeti.Heegner.heegner_transverse_local_condition`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition`.

For ℓ|n an inert auxiliary prime under Howard’s odd-p clean hypotheses, the localization of c(n) restricts to zero over the specified totally ramified local ring-class extension K[n]_λ/K_λ. Thus it lies in the transverse condition used by ES1. Away from n it lies in the propagated finite local condition established in HE3. The p-odd identity Σ_{i=1}^{ℓ}i=ℓ(ℓ+1)/2 enters the transverse proof and cannot be copied integrally at p=2.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.4/explicit-cocycle-divisibility](#he-4-explicit-cocycle-divisibility), [HE.2/inert-reduction-frobenius-congruence](#he-2-inert-reduction-frobenius-congruence), [HE.3/bad-place-component-obstruction](#he-3-bad-place-component-obstruction), `EulerSystemsAndKolyvaginSystems:ES.1`.

**Proof / construction.**

1. Use the explicit Heegner cocycle and the actual local extension.
2. Use HE2’s reduction congruence and the cyclic derivative computation.
3. Check the local restriction vanishes, rather than choose an arbitrary complement of the unramified line.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), Lemma1.7.3 and proof, pp.20–21.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Transverse condition of the descended class.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer5`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-5-local-heegner-chi-automorphism"></a>

### Heegner finite–singular correction automorphism

**Declaration:** `TauCeti.Heegner.local_heegner_chi_automorphism`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`.

At inert ℓ, define Howard’s automorphism χ_ℓ on T/I_ℓT through local reduction, projection to the p-primary subgroup, p^−M(a_ℓ−(ℓ+1)Fr_ℓ), and the canonical torsion lift. The valuation/cyclic Frobenius-eigenspace calculation proves it is invertible. With all chosen cyclic generators retained, χ_ℓ(κ_n(Fr_λ))=κ_nℓ(σ_ℓ) is the actual Heegner finite–singular relation. This is an arithmetic correction to ES1’s generic comparison, not an assertion that raw classes already form a strong system.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.5/heegner-transverse-local-condition](#he-5-heegner-transverse-local-condition), [HE.2/inert-reduction-frobenius-congruence](#he-2-inert-reduction-frobenius-congruence), [HE.4/heegner-coefficient-ideal](#he-4-heegner-coefficient-ideal), `EulerSystemsAndKolyvaginSystems:ES.1`.

**Proof / construction.**

1. Apply the pointwise reduction congruence and the explicit derivative cocycle.
2. Use the good-reduction torsion identification and valuations of ℓ+1±a_ℓ.
3. Check the chosen Frobenius/σ and cyclic tensor normalization in the finite–singular square.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), Proposition1.7.4, preprint p.21; published pp.1457–1458..

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Heegner finite–singular correction automorphism.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer5`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-5-finite-singular-comparison-and-the-corrected-kolyvagin-system"></a>

### Corrected Heegner Kolyvagin system

**Declaration:** `TauCeti.Heegner.correctedClass`. **Kind:** construction. **Stable node:** `HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system`.

For the actual descended Heegner family κ_n, construct commuting global cohomology automorphisms χ_ℓ inducing the specified local Howard correction. Let χ_n=∏_{ℓ|n}χ_ℓ. Define κ′_n=χ_n⁻¹(κ_n)⊗σ_n in the cyclic tensor target. Then κ′ satisfies the strong ES1/3 edge relation and κ′_1=κ_1, so κ′ is a Kolyvagin system for the Selmer triple (T,F,𝓛) in the sense of EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses (Howard Definition1.2.3 and Theorem1.7.5). A local non-G_K-linear coefficient automorphism alone cannot be postcomposed with global cocycles; a legitimate change-of-group action and its localization comparison must be supplied.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.5/local-heegner-chi-automorphism](#he-5-local-heegner-chi-automorphism), [HE.4/generator-tensor-choice-independence](#he-4-generator-tensor-choice-independence), `EulerSystemsAndKolyvaginSystems:ES.3`, `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`.

**Proof / construction.**

1. Use the G_Q conjugation/change-of-group action on H¹(K,T/I_n), with the matching coefficient action.
2. Verify that each χ_ℓ is induced by that action after the local Kummer/Frobenius identification; this is the explicitly recorded remaining comparison gap.
3. Apply the corrected finite–singular square and commute the global χ maps, tensoring with the cyclic generators.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), Theorem1.7.5 pp.20–21 and published p.1458.

**Uses determining the API.**

- Howard Theorem1.6.5: The actual corrected system is input to the self-dual DVR bound.
- HE.8 (outside this part): The unchanged conductor-one class is used in the anticyclotomic specialization.

**Planning API.**

- `TauCeti.Heegner.correctedClass` (constructor): correctedClass χ κ=χ⁻¹κ for the proved global additive automorphism χ; the cyclic tensor is retained in the supplied target.
- `TauCeti.Heegner.correctedClass_apply` (simp): correctedClass χ κ is evaluation of χ.symm at κ.
- `TauCeti.Heegner.correctedClass_uncorrect` (characterisation): χ(correctedClass χ κ)=κ.
- `TauCeti.Heegner.correctedClass_comp` (compatibility): For commuting χ,ψ, correction by their product equals successive correction by ψ then χ.

**Unit tests.**

- `TauCeti.Heegner.correctedClass_bottom` (degenerate): At the empty conductor χ_1=id, so the bottom class is unchanged.
- `TauCeti.Heegner.correctedClass_zero` (computation): The zero class remains zero under correction.
- `TauCeti.Heegner.correctedClass_involution` (non-example): For χ=−id on an additive group, correcting κ gives −κ; raw and corrected classes need not coincide.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Corrected Heegner Kolyvagin system.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer5`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-5-actual-tate-hypotheses-h0-h2"></a>

### Tate coefficient and big-image hypotheses

**Declaration:** `TauCeti.Heegner.actual_tate_hypotheses_h0_h2`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.5/actual-tate-hypotheses-h0-h2`.

Under Howard TheoremA’s full G_K→GL₂(Z_p) surjectivity, p odd and p∤DN, T=T_pE is free rank two (H0), T/pT is absolutely irreducible (H1), and the auxiliary extension F/Q containing K used in H2 trivializes T and has H¹(F(μ_p∞)/K,T/pT)=0. The central scalar subgroup of order p−1 kills this cohomology. Full Tate-image surjectivity is stronger than residual irreducibility or residual surjectivity and is stated separately. H.0–H.2 are those of the hypothesis record EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.4/ring-class-torsion-invariants](#he-4-ring-class-torsion-invariants), `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `ArithmeticGaloisDuality:R02.2`, `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`.

**Proof / construction.**

1. Import the elliptic Tate module/Weil determinant from EC Layer2.
2. Choose F=K(E[p∞]), which contains K and trivializes T, as in Howard Theorem1.6.5; use the Weil determinant to include μ_p∞.
3. Apply the central-scalar cohomology-vanishing argument as in Howard’s verification.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), H.0–H.2 pp.8–9, Theorem1.6.5 proof pp.18–19.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Tate coefficient and big-image hypotheses.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer5`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-5-actual-local-hypotheses-h3-h5"></a>

### Cartesian, self-dual and conjugation local conditions

**Declaration:** `TauCeti.Heegner.actual_local_hypotheses_h3_h5`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.5/actual-local-hypotheses-h3-h5`.

For the same actual T, verify H3 cartesian propagation at every quotient of the DVR, H4 the symmetric twisted Weil pairing (s,t)=e(s,τt) and exact orthogonality at conjugate places, and H5 extension of the residual representation to G_Q with one-dimensional τ± eigenspaces, G_Q-stability of local conditions and the required pairing/conjugation identity. Use the rational finite local conditions and their exact integral/torsion propagation; the hypothesis record H.0–H.5 is EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses, and Howard’s abstract theorem is not defined or reproved here.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.5/actual-tate-hypotheses-h0-h2](#he-5-actual-tate-hypotheses-h0-h2), [HE.3/coefficient-prime-local-condition](#he-3-coefficient-prime-local-condition), [HE.3/saturated-integral-kummer-lattice](#he-3-saturated-integral-kummer-lattice), `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`, `SelmerIwasawaCohomology:L1`, `SelmerIwasawaCohomology:L2/lattice-passage`, `SelmerIwasawaCohomology:L2/finite-condition-lattice-duality`, `SelmerIwasawaCohomology:L1/lattice-pairing-compatibility`.

**Proof / construction.**

1. Use HE3’s propagated rational Kummer conditions and torsion-free local quotient criterion.
2. Twist the alternating Weil pairing by the chosen complex conjugation to obtain Howard’s symmetric pairing.
3. Apply local Tate duality, conjugate-place functoriality and the actual residual G_Q representation.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), H.3–H.5 pp.8–9, Theorem1.6.5 proof pp.18–19.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Cartesian, self-dual and conjugation local conditions.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer5`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-5-residual-kummer-field-pairing"></a>

### Residual Kummer field and detection pairing

**Declaration:** `TauCeti.Heegner.residual_kummer_field_pairing`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.5/residual-kummer-field-pairing`.

In Gross’s odd-p full residual-image setting let L=K(E[p]). For a finite F_p-subspace S⊂H¹(K,E[p]), let L_S be the fixed field of the intersection of the kernels of the restricted homomorphisms G_L→E[p]. Restriction identifies classes with the equivariant Hom space, and the evaluation pairing gives Gal(L_S/L)≃Hom_Fp(S,E[p]) compatibly with the residual Galois action. The proof uses that the subquotients of the direct sum E[p]^r are sums of this simple module, not general semisimplicity of arbitrary F_p[GL₂(F_p)]-modules.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.4/ring-class-torsion-invariants](#he-4-ring-class-torsion-invariants), `ArithmeticGaloisDuality:R02.2`, `EulerSystemsAndKolyvaginSystems:ES.1`.

**Proof / construction.**

1. Use the central homothety subgroup and continuous inflation–restriction to kill H¹/H² over L/K.
2. Take the actual finite Galois extension cut out by a finite basis of S.
3. Use simplicity of E[p] and the nondegenerate evaluation pairing as in Gross9.3.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §9 pp.250–252, Lemma9.1 and Proposition9.3.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Residual Kummer field and detection pairing.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer5`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-5-chebotarev-heegner-class-detection"></a>

### Heegner class detection by auxiliary primes

**Declaration:** `TauCeti.Heegner.chebotarev_heegner_class_detection`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.5/chebotarev-heegner-class-detection`.

Let M=L_S for a finite Selmer subspace S and let I fix the Kummer field generated by a pth division point of y_K. For τ acting on Gal(M/L), the square (τh)² detects the positive component used by Gross. Chebotarev primes whose Frobenius is the prescribed class of τh are inert auxiliary primes, avoid any specified finite set, and their localizations detect the corresponding evaluation annihilator. To detect a second independent class, use the correctly formed composite and the proved disjointness of its Kummer field.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.5/residual-kummer-field-pairing](#he-5-residual-kummer-field-pairing), `EulerSystemsAndKolyvaginSystems:ES.1`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Proof / construction.**

1. Apply the actual residual Kummer pairing and Gross9.5–9.6.
2. Invoke upstream Chebotarev on the finite Galois composite, with avoidance of all bad/conductor/coefficient primes.
3. Verify simultaneous conditions and the class-field intersection before the second selection.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Propositions9.5–9.6 and Claims10.1/10.3, pp.251–254.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer5`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-5-arithmetic-local-error-comparison"></a>

### Arithmetic local error lengths

**Declaration:** `TauCeti.Heegner.arithmetic_local_error_comparison`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.5/arithmetic-local-error-comparison`.

For the actual Heegner Tate representation, compare ES4’s restriction/invariant/local-condition errors with p-primary local torsion, the p-part of the Néron component group, and the index of the integral finite/ordinary lattice. Record each finite kernel/cokernel as a separate length or annihilator constant. Equality with an error-free theorem requires the relevant quantities to vanish, not just the global residual image hypothesis.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.3/bad-place-component-obstruction](#he-3-bad-place-component-obstruction), [HE.3/coefficient-prime-local-condition](#he-3-coefficient-prime-local-condition), [HE.3/saturated-integral-kummer-lattice](#he-3-saturated-integral-kummer-lattice), `EulerSystemsAndKolyvaginSystems:ES.4`, `NeronModelsAndSemistableAbelianVarieties:R11.2`, `NeronModelsAndSemistableAbelianVarieties:R11.2/component-group`, `SelmerIwasawaCohomology:L2/finite-unramified-comparison`.

**Proof / construction.**

1. Apply the exact component/Kummer sequence and integral propagation from HE3.
2. Use the actual finite-level restriction/corestriction maps and measure their kernels/cokernels.
3. Identify the constants in the imported ES4 interface without equating distinct local hypotheses.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), §1.1 pp.5–8; Gross Proposition6.2 pp.244–247.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer5`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-5-tamagawa-and-local-torsion-tests"></a>

### Tamagawa and local torsion obstruction examples

**Declaration:** `TauCeti.Heegner.tamagawa_and_local_torsion_tests`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.5/tamagawa-and-local-torsion-tests`.

For a split Tate curve over a local field of residue characteristic ℓ≠p with parameter q, its component group has order v(q); choose v(q)=p to get a nonzero p-component defect. If the same local field contains μ_p, the Tate uniformization supplies nonzero local E[p] even with a prime-to-p component order (for example v(q)=1). These distinct examples must fail the corresponding error-free local hypotheses. Neither local phenomenon follows or disappears from a global residual-irreducibility label.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, [HE.5/arithmetic-local-error-comparison](#he-5-arithmetic-local-error-comparison).

**Proof / construction.**

1. Import the local Tate-curve and component-group calculation from EC Layer4.
2. Calculate the p-primary component for q of valuation p.
3. Use μ_p in the multiplicative uniformization for the separate local-torsion example.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §6.3 pp.228–229, local monodromy/Tamagawa description.

**Acceptance.**

- An integral local-condition comparison must display the nonzero defect in the first case.
- A residual big-image condition on a global curve is not a substitute for checking the local torsion in the second case.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer5`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6"></a>

## HE.6: Clean descent and the Zhang branch

Howard applies the generic self-dual DVR theorem to the corrected system. Gross instead proves his two residual eigenspace assertions and clean mod-p theorem under its own hypotheses. Zhang uses exact local-type level raising, quaternionic transfer, GL₂-type rank-zero input, special values and the early definite congruence-period identity. His triangular residual proof uses V/k₀, support and base-locus data. The proposed HE.6z split keeps that later branch separate; current IDs and parents are preserved.

<a id="he-6-clean-rank-one-descent-theorem-a"></a>

### Howard’s Heegner rank-one theorem

**Declaration:** `TauCeti.Heegner.clean_rank_one_descent_theorem_A`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/clean-rank-one-descent-theorem-A`.

Assume E/Q conductor N, imaginary quadratic K discriminant D≠−3,−4 with all N-primes split, p odd, p,D,N pairwise coprime, and full Tate representation G_K→GL₂(Z_p) surjective. If the actual bottom Heegner Kummer class κ_1≠0, the compact Selmer group is free rank one and the discrete Selmer group is Q_p/Z_p⊕M⊕M for a finite Z_p-module M with length M≤length(H¹_F(K,T_pE)/Z_pκ_1). This is Howard TheoremA after the actual arithmetic H0–H5 checks and corrected system construction; the abstract self-dual theorem is EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem (Howard Theorem1.6.1), imported and not reproved here.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system](#he-5-finite-singular-comparison-and-the-corrected-kolyvagin-system), [HE.5/actual-tate-hypotheses-h0-h2](#he-5-actual-tate-hypotheses-h0-h2), [HE.5/actual-local-hypotheses-h3-h5](#he-5-actual-local-hypotheses-h3-h5), [HE.3/saturated-integral-kummer-lattice](#he-3-saturated-integral-kummer-lattice), `EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem`.

**Proof / construction.**

1. Use HE5’s actual coefficient/local hypothesis verification and corrected Heegner system.
2. Apply the imported theorem EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem (Howard Theorem1.6.1) with R=Z_p, T=T_pE, the propagated Kummer structure F and 𝓛=𝓛_1, to the corrected system κ′. Its hypotheses H.0–H.5 are the two HE.5 verification nodes, as in Howard Theorem1.6.5.
3. Identify compact/discrete Selmer carriers with the exact Kummer sequences; keep paired finite summands and the direction of the inequality.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), TheoremA pp.1–2, Theorem1.6.5 pp.18–19.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Howard’s Heegner rank-one theorem.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-gross-opposite-eigenspace-vanishing"></a>

### Opposite Selmer eigenspace vanishing

**Declaration:** `TauCeti.Heegner.gross_opposite_eigenspace_vanishing`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/gross-opposite-eigenspace-vanishing`.

Under Gross’s clean mod-p hypotheses, the ε-opposite Selmer eigenspace is zero. Choose a prime using the actual Kummer field M and positive component outside I. Its d(ℓ) is locally nonzero and supported only at λ; global reciprocity forces every Selmer class in that eigenspace to localize to zero. The Kummer-field annihilator calculation then forces the global eigenspace to vanish.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.5/chebotarev-heegner-class-detection](#he-5-chebotarev-heegner-class-detection), [HE.4/complex-conjugation-parity](#he-4-complex-conjugation-parity), `EulerSystemsAndKolyvaginSystems:ES.1`, `SelmerIwasawaCohomology:L1`, [HE.3/bad-place-component-obstruction](#he-3-bad-place-component-obstruction), [HE.4/explicit-cocycle-divisibility](#he-4-explicit-cocycle-divisibility), [HE.2/inert-reduction-frobenius-congruence](#he-2-inert-reduction-frobenius-congruence).

**Proof / construction.**

1. Apply Gross8.1’s local one-dimensional eigenspace pairing, imported from ES1/L1.
2. Use Gross8.2 global annihilation and HE5’s actual field selection.
3. Apply Gross9.5–9.6 to convert all prescribed Frobenius annihilations to zero in the class-detection pairing.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition8.2 pp.249–250; Claim10.1 pp.252–253.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-gross-same-eigenspace-generation"></a>

### Same Selmer eigenspace generation

**Declaration:** `TauCeti.Heegner.gross_same_eigenspace_generation`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/gross-same-eigenspace-generation`.

Under the same clean hypotheses, the remaining Selmer eigenspace equals F_p·δ(y_K). If a second independent class existed, choose the first auxiliary prime with nonzero local Heegner derivative and form its Kummer extension L′. Prove L′ is disjoint from the Selmer field over L in the relevant character, then choose a second simultaneous Frobenius in the composite. The finite/singular relation and reciprocity force incompatible localizations, so the second class cannot exist.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.6/gross-opposite-eigenspace-vanishing](#he-6-gross-opposite-eigenspace-vanishing), [HE.5/chebotarev-heegner-class-detection](#he-5-chebotarev-heegner-class-detection), [HE.4/complex-conjugation-parity](#he-4-complex-conjugation-parity), `EulerSystemsAndKolyvaginSystems:ES.1`, `SelmerIwasawaCohomology:L1`, [HE.4/explicit-cocycle-divisibility](#he-4-explicit-cocycle-divisibility), [HE.4/bottom-trace-class](#he-4-bottom-trace-class).

**Proof / construction.**

1. Use the nonzero bottom Kummer class before selecting the first prime.
2. Use the opposite-character Kummer class and actual field disjointness, not unrestricted linear disjointness.
3. Use Gross Proposition6.2 and Propositions8.1–8.2 for the mod-p local d-class support and reciprocal eigenspace pairing in the simultaneous composite. Howard’s full-Tate-image χ correction is not needed by this proof.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Claim10.3 and proof, pp.253–254.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-gross-clean-mod-p-descent"></a>

### Gross’s clean mod-p descent

**Declaration:** `TauCeti.Heegner.gross_clean_mod_p_descent`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent`.

Assume Gross’s classical standing hypotheses and non-CM E, p odd, Q(E[p])/Q has full GL₂(F_p) group, and y_K∉pE(K). Then Sel_p(E/K) is the cyclic F_p-space generated by δ(y_K), rank E(K)=1 and Sha(E/K)[p]=0. This clean theorem requires neither p∤N nor full p-adic surjectivity as an extra hypothesis; do not replace its hypothesis table with Howard’s.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.5/chebotarev-heegner-class-detection](#he-5-chebotarev-heegner-class-detection), [HE.4/bottom-trace-class](#he-4-bottom-trace-class), [HE.3/bad-place-component-obstruction](#he-3-bad-place-component-obstruction), [HE.6/gross-opposite-eigenspace-vanishing](#he-6-gross-opposite-eigenspace-vanishing), [HE.6/gross-same-eigenspace-generation](#he-6-gross-same-eigenspace-generation), `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`.

**Proof / construction.**

1. Use the actual Gross local d(n) properties, finite Kummer fields and Chebotarev selection.
2. Prove the two eigenspace conclusions in the following nodes.
3. Apply the finite Kummer exact sequence and Mordell–Weil finite generation.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Propositions2.1/2.3 pp.237–238, Claims10.1/10.3 pp.252–254.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Gross’s clean mod-p descent.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-sha-square-index-bound"></a>

### Sha square-index bound

**Declaration:** `TauCeti.Heegner.sha_square_index_bound`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/sha-square-index-bound`.

Under HowardA with non-torsion y_K, the finite p-primary Sha group is the paired finite part of the discrete Selmer group. Thus length_Zp Sha[p∞]≤2·length_Zp(E(K)⊗Z_p/Z_py_K), after proving the exact integral Kummer-lattice identification. Equivalently its order divides the p-part of the square of the corresponding finite index. If a local or parametrization defect is present, insert its proved error term before this comparison.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.6/clean-rank-one-descent-theorem-A](#he-6-clean-rank-one-descent-theorem-a), [HE.3/saturated-integral-kummer-lattice](#he-3-saturated-integral-kummer-lattice), [HE.5/arithmetic-local-error-comparison](#he-5-arithmetic-local-error-comparison).

**Proof / construction.**

1. Use the rank-one theorem and the actual Kummer exact sequence.
2. Identify the divisible Mordell–Weil summand and the paired finite quotient.
3. Multiply the finite-module length by two and translate valuations to divisibility, preserving the inequality direction.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), Introduction, finite/p-adic Kummer exact sequences and TheoremA, PDF pp.1–2..

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Sha square-index bound.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-primitivity-versus-nonzero"></a>

### Primitivity and sharpness comparison

**Declaration:** `TauCeti.Heegner.primitivity_versus_nonzero`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/primitivity-versus-nonzero`.

A nonzero κ_1 yields an upper bound, not equality. Residual primitivity of the actual corrected system, under the self-dual hypotheses H.0–H.5 and for p≥5, gives the corresponding equality of finite length and corrected index (Zanarella Theorem2.3.6). Scaling the parametrization/system by p preserves non-torsion but increases the leading-class index, so cannot preserve an unsupported sharpness assertion. Zhang’s indivisibility conclusion proves a stronger property only under its enumerated hypotheses.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.6/clean-rank-one-descent-theorem-A](#he-6-clean-rank-one-descent-theorem-a), [HE.1/parameter-choice-and-degree](#he-1-parameter-choice-and-degree), `EulerSystemsAndKolyvaginSystems:ES.5`, `EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem`, `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`.

**Proof / construction.**

1. Apply the self-dual primitivity equality: for p≥5, the bound of EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem is an equality exactly when the system is primitive, that is has nonzero reduction modulo the maximal ideal as in ES.5/divisibility-invariants (Zanarella Theorem2.3.6). This equality is requested from EulerSystemsAndKolyvaginSystems:ES.5. Howard Theorem1.6.1 is an inequality, and the Mazur–Rubin nodes of ES.5 assume core rank one and are not the self-dual setting.
2. Compare coefficient reduction of the actual corrected system to its primitive leading/core component.
3. Use a p-scaling test on the actual point map.

**Sources.** [HE.0/howard](https://arxiv.org/pdf/1202.6340), TheoremA, PDF pp.1–2 (upper bound, not a primitivity equality).; [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorem9.3 p.243; §10 pp.245–246.; [HE.0/zanarella](https://arxiv.org/pdf/1908.09197v1), Theorem2.3.6, with Definition2.3.2 and Proposition2.3.3, arXiv v1 pp.19–20.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-zhang-cohomological-congruence"></a>

### Zhang’s Heegner congruence after level raising

**Declaration:** `TauCeti.Heegner.zhang_cohomological_congruence`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/zhang-cohomological-congruence`.

Let g,K,p satisfy Zhang’s Notations and Hypothesis♥, with m∈Λ′+ and distinct admissible q₁,q₂∤m. Fix the residual V over k₀, matched optimal embeddings and derivative generators. Then loc_q₁ c(n,m) lies in H¹(K_q₁,k₀) and loc_q₂ c(n,mq₁q₂) in H¹(K_q₂,k₀(1)); under fixed identifications with k₀ the two are equal up to a fixed nonzero scalar. The generic level-raising, definite/indefinite Jacquet–Langlands, multiplicity-one and Ihara statements are imported.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.2/quaternionic-reduction-specialization](#he-2-quaternionic-reduction-specialization), [HE.4/kolyvagin-derivative-classes-and-descent-to-K](#he-4-kolyvagin-derivative-classes-and-descent-to-k), `SerreWeightAndLevelOptimisation:R20.2`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `SerreWeightAndLevelOptimisation:R20.2/level-raising-diamond`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/multiplicity-one`, `HilbertModularVarietiesAndShimuraCurves:R18.3`.

**Proof / construction.**

1. Import Ribet–Diamond–Taylor level raising in the form of Zhang2.1: for each admissible q a newform of exact level Nq with trivial nebentypus and the same residual representation over k₀; iterate over m to get g_m of exact level Nm. SerreWeightAndLevelOptimisation:R20.2/level-raising-diamond, Diamond’s criterion, gives a form that is new at q; the exact level, the prescribed inertial types at every ℓ≠p and the trivial nebentypus are requested from SerreWeightAndLevelOptimisation:R20.2.
2. Transfer g_m to the definite and indefinite quaternion algebras by GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl, with multiplicity one from R17.3/multiplicity-one; g_m is an unramified twist of Steinberg at each prime dividing N⁻m and discrete series of weight two at infinity. The identification of the transferred forms with functions on the Shimura set, norm-factor forms removed, is requested from HilbertModularVarietiesAndShimuraCurves:R18.3. Import the integral inputs with the level raising: J(X_m)[𝔪]≃V (Zhang Lemma3.3; Helm for Shimura curves), multiplicity one on the Shimura set by Mazur’s principle (4.8), and the identity (4.9) between the reduced eigenfunction and the local Kummer map, which rests on Ihara’s lemma for Shimura curves over Q. Use HE2’s matched reduction/specialization.
3. Compute the finite Kummer map and component-group singular Kummer map via the same eigenfunction, then apply compatible derivatives.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorem4.3 and proof, pp.218–221; Lemma3.3 p.215; [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §2, Theorem2.1 and proof, pp.203–204; (4.7)–(4.9), pp.218–219.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Zhang’s Heegner congruence after level raising.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-zhang-local-conditions-rank-lowering"></a>

### Heegner rank lowering through an admissible prime

**Declaration:** `TauCeti.Heegner.zhang_local_conditions_rank_lowering`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/zhang-local-conditions-rank-lowering`.

Under Zhang Hypothesis♥, local Selmer conditions for g and its admissible level-raised g′ have k₀-rational structures agreeing away from q. At q they are the finite k₀ line and the singular k₀(1) line respectively. If loc_q on the rational residual Selmer group is nonzero, it is surjective and the raised Selmer group is its kernel, so its dimension decreases by one. Hypothesis♥(3) requires H¹(Q_ℓ,V)=V^GQℓ=0 at ℓ²|N+; for elliptic E and p≥5 the additive-reduction argument verifies this. Do not apply the ℓ≠p Euler characteristic formula at ℓ=p.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.6/zhang-cohomological-congruence](#he-6-zhang-cohomological-congruence), [HE.3/coefficient-prime-local-condition](#he-3-coefficient-prime-local-condition), `SelmerIwasawaCohomology:L1`, `EulerSystemsAndKolyvaginSystems:ES.1`.

**Proof / construction.**

1. Apply the good, toric, additive and coefficient-prime local descriptions separately as in Theorem5.2.
2. Use imported strict/relaxed parity duality to identify the two Selmer groups.
3. Apply the one-dimensional local line to get the exact kernel and dimension drop.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Lemma5.1, Theorem5.2, Proposition5.4, pp.222–225.

**Acceptance.**

- All local places are compared, including p and additive primes.
- Rank lowering is conditional on nonzero localization; level raising alone does not imply it.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-zhang-rank-zero-over-k"></a>

### Auxiliary rank-zero formula over K

**Declaration:** `TauCeti.Heegner.zhang_rank_zero_over_K`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K`.

For a weight-two newform g and its GL₂-type A_g/Q with coefficient prime 𝔭|p≥3, K as in Zhang’s Notations with p∤D_K, good ordinary p, residual image containing SL₂(F_p), and a residually ramified ℓ||N, L(g/K,1)≠0 iff Sel_𝔭∞(A_g/K) is finite. When finite, v_𝔭(L(g/K,1)/Ω_g^can)=length_O𝔭 Sel_𝔭∞(A_g/K)+Σ_{ℓ|N}t_g(ℓ). This is over A_g/K, not E/Q. It is derived from the rank-zero formula over Q for g and for its quadratic twist g_K (Skinner TheoremB) and the GL₂-type period comparison. That formula follows, by control at the trivial character, from the ordinary main conjecture in its Skinner–Urban form with Kato’s divisibility. These inputs need residual irreducibility and the residually ramified ℓ||N, and no image containing SL₂(Z_p).

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** `ModularIwasawaMainConjectures:L1`, `KatoEulerSystems:L4`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `SelmerIwasawaCohomology:L4`, `GrossZagierAndArithmeticHeights:GZ.0`.

**Proof / construction.**

1. Import from ModularIwasawaMainConjectures:L1 the Skinner–Urban form of the weight-two cyclotomic main conjecture, as an equality of ideals in the Iwasawa algebra over O (Skinner TheoremA for level prime to p, his Theorem2.5.2): for a newform f of trivial character and level M prime to p, ordinary at 𝔭, with ρ̄_f irreducible and ramified at some prime q||M. Apply it to f=g with M=N and to f=g_K with M=N·D_K², taking q=ℓ. The Fouquet–Wan form (their Theorem1.6) also requires ρ̄_f to have no invariants under the decomposition group at q, and does not suffice.
2. Kato’s divisibility for g and g_K, KatoEulerSystems:L4/ordinary-selmer-divisibility, is the upper bound inside that equality, and by itself gives the direction from L(g/K,1)≠0 to finiteness. That node states its integral bound for an image containing SL₂(Z_p). The integral bound under Skinner’s two conditions, (a) ρ̄_f irreducible and (b) an element of Gal(Q̄/Q(μ_p∞)) acting on the lattice with free rank-one coinvariants, is requested from KatoEulerSystems:L4; a generator of tame inertia at ℓ gives (b).
3. Specialise at the trivial character by Greenberg’s method, with coefficients O: #O/(L^alg(f,1))=#Sel_L(f)·∏_ℓ c_ℓ(T_f) for f=g and f=g_K (Skinner TheoremB, proved in his §3.2; its condition (iii) is empty when p∤M). This GL₂-type control statement is requested from SelmerIwasawaCohomology:L4.
4. Combine base/twist Selmer and local factors to obtain the K-base formula, with the canonical-period product comparison; no circular import from BSD6 is permitted.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorem7.1 and proof, pp.231–232; [HE.0/skinner](https://arxiv.org/pdf/1407.1093v1), Introduction, TheoremB, arXiv v1 p.2; §2.5, discussion after Theorem2.5.2, pp.15–16; §3.2, pp.20–21.

**Acceptance.**

- The field K and GL₂-type auxiliary variety are retained in both the statement and supplier request.
- Ordinariness is used here; it is not introduced into Gross’s clean mod-p theorem.
- The twist g_K has level N·D_K², prime to p; for p|D_K the statement is not claimed.
- No step passes from the residual image to an image containing SL₂(Z_p): that fails at p=3, and at p=5 when O_𝔭 is ramified over Z_5.
- Zhang’s rank-one case uses only the inequality v_𝔭(L(g/K,1)/Ω_g^can)≤length Sel_𝔭∞(A_g/K)+Σt_g(ℓ) (Remark 15).

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-zhang-jochnowitz-special-value"></a>

### Jochnowitz unit criterion

**Declaration:** `TauCeti.Heegner.zhang_jochnowitz_special_value`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/zhang-jochnowitz-special-value`.

For g as in Zhang’s Notations satisfying Hypothesis♥, with N− squarefree and ν(N−) even, and an admissible q, the Heegner bottom class is locally nonzero at q iff L^alg(g′/K,1) is a 𝔭′-adic unit. Here g′ is the chosen raised form, Ω_g′^can=〈g′,g′〉_Pet/η_g′(Nq), ξ_g′ is the norm of the integral primitive definite eigenfunction, η_g′,N+,N−q=η_g′(Nq)/ξ_g′, and L^alg=L/Ω^can·η_ratio⁻¹. Its integrality/unit status is proved by the explicit Waldspurger/Gross formula, not built into a definition.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.6/zhang-cohomological-congruence](#he-6-zhang-cohomological-congruence), `GrossZagierAndArithmeticHeights:GZ.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/multiplicity-one`, `HilbertModularVarietiesAndShimuraCurves:R18.3`, `SerreWeightAndLevelOptimisation:R20.2`.

**Proof / construction.**

1. Import the explicit definite special-value formula from GZ5 with all u_K and discriminant factors.
2. Use matched supersingular reduction and the residual multiplicity-one eigenfunction to compute loc_q c(1). The eigenfunction is the transfer of g′ by GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl and R17.3/multiplicity-one, realised on the Shimura set (HilbertModularVarietiesAndShimuraCurves:R18.3) and normalised integrally; its multiplicity one modulo 𝔭′ is among the transports requested from SerreWeightAndLevelOptimisation:R20.2.
3. Apply Corollary6.2 and Theorem6.5, allowing only proved p-adic-unit factors.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §6.1–6.4, pp.226–231, Corollary6.2 and Theorem6.5.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-ribet-takahashi-tamagawa-comparison"></a>

### Ribet–Takahashi period and Tamagawa comparison

**Declaration:** `TauCeti.Heegner.ribet_takahashi_tamagawa_comparison`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/ribet-takahashi-tamagawa-comparison`.

For g of weight2 and trivial nebentypus, p≥5 with p∤ND_K and surjective ρ_g,𝔭:G_Q→GL₂(k₀), K as in Zhang’s Notations, N⁻ squarefree of odd prime count, and all three clauses of Hypothesis♥, let η_g(N) be the full-level Hecke congruence ideal generator and ξ_g(N⁺,N⁻) the pairing norm of a primitive integral definite quaternionic eigenfunction. The period ratio is η_g,N⁺,N⁻=η_g(N)/ξ_g(N⁺,N⁻), not the raw congruence ideal. Then v_𝔭(η_g,N⁺,N⁻)=Σ_{ℓ|N⁻}t_g(ℓ), where t_g(ℓ)=length_O𝔭 Φ(A_g/K_ℓ)_𝔭. The identity is RankZeroOneBSD:BSD.3a/definite-congruence-period and is imported. K_ℓ is the unramified quadratic extension of Q_ℓ, since ℓ|N⁻ is inert in K, so t_g(ℓ) is the length of the geometric component group and not of its Q_ℓ-rational points. For nonsquarefree N require Ram(ρ)≠∅ and either a ramified ℓ||N⁻ or at least two primes ℓ||N⁺, as in ♥(2). The last clause does not itself assert residual ramification of both primes. At split additive ℓ²|N⁺, ♥(3) and finite-residue cohomology eliminate the rational component factor; decomposition-invariant vanishing is not inertia-invariant vanishing.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** `NeronModelsAndSemistableAbelianVarieties:R11.4`, `GrossZagierAndArithmeticHeights:GZ.3`, `RankZeroOneBSD:BSD.3a/definite-congruence-period`.

**Proof / construction.**

1. Import the identity from RankZeroOneBSD:BSD.3a/definite-congruence-period, reading its t_g(ℓ) as the length of the geometric component group, which is the group over K_ℓ used here. The export has no prerequisite in HE.6, in the final Heegner-index formula, in a Jochnowitz congruence or in rank-zero BSD.
2. The export’s route, recorded for the contract and not re-proved here, uses R11.4/R11.6 monodromy/component and degeneracy-map presentations, R17.3 integral definite/indefinite transfer and residual multiplicity one, and full-level Hecke congruence ideals. In the squarefree case follow Pollack–Weston6.2–6.8: character lattices, the monodromy degree formula, definite pairing and degree/congruence comparison.
3. For nonsquarefree N import the exact Ribet–Takahashi/Khare modular-degree comparison and Helm multiplicity-one variant identified in Zhang6.4, retaining Ram≠∅ and the two alternative level conditions. The squarefree preprint cannot be used as the sole supplier for this variant. The variant is part of the same export.
4. Normalize Ω_can=〈g,g〉_Pet/η_g(N), and the definite special value with ξ_g; only then cancel the N⁻ local lengths in the separate rank-zero application. Prove the other rational component factors are units using the corrected additive-prime finite-residue argument.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorem6.4 and proof, pp.229–230; §7.2 p.233; [HE.0/pollack-weston](https://arxiv.org/pdf/math/0610694v1), §§6.2–6.5, preprint pp.18–21: Theorem6.2, Propositions6.3–6.7 and Theorem6.8..

**Acceptance.**

- The imported export has its own declaration and no prerequisite in HE.6.
- η_g,N⁺,N⁻ is the ratio η_g(N)/ξ_g, with a primitive definite pairing and odd N⁻.
- Do not extend Pollack–Weston’s squarefree Theorem6.8 by dropping its hypotheses; retain the stated nonsquarefree comparison.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-heegner-vanishing-order"></a>

### Heegner-system vanishing order

**Declaration:** `TauCeti.Heegner.vanishingOrder`. **Kind:** definition. **Stable node:** `HeegnerPointEulerSystems:HE.6/heegner-vanishing-order`.

For the actual residual Heegner family κ={c(n):n∈Λ}, define ν(κ)=min{#prime divisors of n:n∈Λ,c(n)≠0}, valued in ℕ∪{∞}, with ν(0)=∞. The count is of distinct primes in the squarefree conductor, not multiplicity or number of nonzero classes. This is Zhang’s finite-residual support invariant, distinguished from the p-adic divisibility sequence M_r and its M∞.

**Hypotheses.**

- The supplied family is the actual residual Heegner system and its localization maps.

**Prerequisites.** [HE.4/kolyvagin-derivative-classes-and-descent-to-K](#he-4-kolyvagin-derivative-classes-and-descent-to-k), `EulerSystemsAndKolyvaginSystems:ES.1`, `mathlib:Nat.primeFactorsList`.

**Proof / construction.**

1. Specialize the support/vanishing condition to the actual Heegner family, with the declared conductor set Λ.
2. Keep the empty/zero-system value and exclude bad primes exactly as in Zhang8.3.
3. Use the displayed API to state the triangular/relaxed Selmer theorem without unfolding the definition.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Definition8.3, published p.236, PDF46; Lemma8.4 and proof pp.236–239..

**Uses determining the API.**

- Zhang Definition8.3, Lemma8.4, Theorems9.1/9.3, pp.236–243: The induction uses the minimum conductor size and relaxing local conditions at the base locus to prove nonvanishing.

**Planning API.**

- `TauCeti.Heegner.vanishingOrder` (constructor): The infimum of the distinct-prime count of a conductor n∈Λ with c(n)≠0, with empty infimum ∞.
- `TauCeti.Heegner.vanishingOrder_formula` (characterisation): It is sInf{v:ℕ∞:∃n∈Λ,c(n)≠0 and v=#prime divisors(n)}.
- `TauCeti.Heegner.vanishingOrder_bottom` (simp): If 1∈Λ and c(1)≠0, ν(κ)=0.
- `TauCeti.Heegner.vanishingOrder_support_congr` (extensionality): Families with the same zero/nonzero support on Λ have the same vanishing order.

**Unit tests.**

- `TauCeti.Heegner.vanishingOrder_empty` (degenerate): The empty conductor-index set has vanishing order ∞.
- `TauCeti.Heegner.vanishingOrder_bottom_nonzero` (compatibility): A nonzero conductor-one class has vanishing order zero.
- `TauCeti.Heegner.vanishingOrder_conductor_six` (computation): A family supported only at squarefree conductor 6 has vanishing order two.

**Acceptance.**

- Do not replace minimum support size by the greatest conductor size or by the number of nonzero classes.
- Use only conductors in Λ; arbitrary values of an extension outside Λ must not change the object.

**Planet:** Heegner-system vanishing order.

**Library home:** `TauCeti/NumberTheory/Heegner/Support`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The supplied Λ, residual class family and actual local cohomology localization maps are unbundled data. Their arithmetic/continuous-cohomology identification is omitted; the support definition and its exact algebraic formula are stated.

<a id="he-6-heegner-base-locus"></a>

### Heegner-system base locus

**Declaration:** `TauCeti.Heegner.baseLocus`. **Kind:** definition. **Stable node:** `HeegnerPointEulerSystems:HE.6/heegner-base-locus`.

For the actual family and localization maps, B(κ) is the set of primes ℓ∤D_KNp such that loc_ℓc(n)=0 for every n∈Λ. These are arbitrary good primes, not only Kolyvagin primes. The dependent local cohomology carriers may vary with ℓ. This locus determines exactly which local conditions are relaxed in Zhang Lemma8.4.

**Hypotheses.**

- The supplied family is the actual residual Heegner system and its localization maps.

**Prerequisites.** [HE.4/kolyvagin-derivative-classes-and-descent-to-K](#he-4-kolyvagin-derivative-classes-and-descent-to-k), `EulerSystemsAndKolyvaginSystems:ES.1`, `mathlib:Nat.primeFactorsList`.

**Proof / construction.**

1. Specialize the support/vanishing condition to the actual Heegner family, with the declared conductor set Λ.
2. Keep the empty/zero-system value and exclude bad primes exactly as in Zhang8.3.
3. Use the displayed API to state the triangular/relaxed Selmer theorem without unfolding the definition.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Definition8.3, published p.236, PDF46; Lemma8.4 and proof pp.236–239..

**Uses determining the API.**

- Zhang Definition8.3, Lemma8.4, Theorems9.1/9.3, pp.236–243: The induction uses the minimum conductor size and relaxing local conditions at the base locus to prove nonvanishing.

**Planning API.**

- `TauCeti.Heegner.baseLocus` (constructor): The good primes outside D_KNp with all actual Heegner-class localizations zero.
- `TauCeti.Heegner.baseLocus_mem` (characterisation): ℓ∈B iff ℓ is prime, ℓ∤D_KNp, and every n∈Λ has loc_ℓc(n)=0.
- `TauCeti.Heegner.baseLocus_support_congr` (extensionality): If the localizations of two families agree at every good prime and conductor in Λ, their base loci agree.
- `TauCeti.Heegner.baseLocus_zero` (simp): The zero family has every prime outside D_KNp in its base locus.

**Unit tests.**

- `TauCeti.Heegner.baseLocus_zero_system` (degenerate): For the zero class family, membership is exactly primality and prime-to-D_KNp.
- `TauCeti.Heegner.baseLocus_nonzero_localization` (non-example): One nonzero localization at a conductor n∈Λ excludes that prime from the locus.
- `TauCeti.Heegner.baseLocus_coefficient_prime` (compatibility): The coefficient prime p is never in the locus; in particular 5 is excluded when p=5 even if all classes vanish.

**Acceptance.**

- Quantify over every prime away from D_KNp, not only the auxiliary Kolyvagin prime set.
- Use all conductors in Λ and the actual dependent localization maps; values outside Λ do not change the locus.

**Library home:** `TauCeti/NumberTheory/Heegner/Support`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The supplied Λ, residual class family and actual local cohomology localization maps are unbundled data. Their arithmetic/continuous-cohomology identification is omitted; the support definition and its exact algebraic formula are stated.

<a id="he-6-zhang-residual-local-pairing"></a>

### Residual Heegner local pairing

**Declaration:** `TauCeti.Heegner.zhang_residual_local_pairing`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/zhang-residual-local-pairing`.

Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. For each inert Kolyvagin prime ℓ∤ND_Kp with a_ℓ≡ℓ+1≡0 mod𝔭, H¹(K_ℓ,V) has dimension4 over k₀, with finite and transverse two-dimensional maximal isotropic subspaces. Each ± conjugation component of either subspace has dimension1, and local Tate duality pairs the same signs perfectly. The pairing V×V→k₀(1) is alternating, G_Q-equivariant; conjugation acts by −1 on its values.

**Hypotheses.**

- All hypotheses in the statement and the reader conventions are part of the declaration.

**Prerequisites.** `SelmerIwasawaCohomology:L1`, `EulerSystemsAndKolyvaginSystems:ES.1`, [HE.6/zhang-local-conditions-rank-lowering](#he-6-zhang-local-conditions-rank-lowering).

**Proof / construction.**

1. Descend the polarized residual representation and the local conditions to k₀ using Zhang’s rational structure.
2. At ℓ, Frobenius over Q has eigenvalues ±1 while Frobenius over K is its square; compute finite and tame/transverse cohomology.
3. Use the cyclotomic multiplier −1 and the local invariant map to obtain the same-sign perfect pairings.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §8.1 pp.234–235; Notations §1.4 pp.199–203; §5 pp.222–225.

**Acceptance.**

- Check dimensions over k₀ before extension to k; keep finite and transverse subspaces distinct.
- At ℓ=p this calculation is inapplicable.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-zhang-residual-heegner-relations"></a>

### Residual Heegner reciprocity

**Declaration:** `TauCeti.Heegner.zhang_residual_heegner_relations`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/zhang-residual-heegner-relations`.

Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. The actual k₀-rational derivative classes c(n) satisfy c(n)_v∈H¹_fin(K_v,V) for v∤n, c(n)_ℓ∈H¹_tr(K_ℓ,V) for ℓ|n, and c(nℓ)_ℓ=ψ_ℓ(c(n)_ℓ) when ℓ∤n, where ψ_ℓ:H¹_fin≃H¹_tr is the normalized finite/transverse comparison. Conjugation acts on c(n) by ε_n=w_g(−1)^(ν(n)+1), where w_g is Zhang’s root number convention. All bad places and v|p use the actual Kummer condition; the relation is not inferred from Howard’s elliptic full-Tate-image correction.

**Hypotheses.**

- All hypotheses in the statement and the reader conventions are part of the declaration.

**Prerequisites.** [HE.6/zhang-residual-local-pairing](#he-6-zhang-residual-local-pairing), [HE.6/zhang-cohomological-congruence](#he-6-zhang-cohomological-congruence), [HE.2/quaternionic-reduction-specialization](#he-2-quaternionic-reduction-specialization), [HE.4/kolyvagin-derivative-classes-and-descent-to-K](#he-4-kolyvagin-derivative-classes-and-descent-to-k), `EulerSystemsAndKolyvaginSystems:ES.3`.

**Proof / construction.**

1. Use the actual quaternionic Heegner tower, compatible generators and V/k₀ rational descent in §§3–5.
2. Normalize the local comparison using the reduction/norm identities to obtain (8.1).
3. Apply (3.24), including the extra bottom-class minus sign, and verify all non-support local conditions.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §8.1, equation(8.1), printed p.235; equation(3.24), printed p.213..

**Acceptance.**

- Check the bottom sign ε_1=−w_g; use the transverse condition only at conductor primes.
- Changing derivative generators changes the normalized comparison compatibly.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-zhang-two-class-prime-detection"></a>

### Simultaneous residual prime detection

**Declaration:** `TauCeti.Heegner.zhang_two_class_prime_detection`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/zhang-two-class-prime-detection`.

Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. For two k₀-linearly independent classes c₁,c₂∈H¹(K,V) and any finite excluded set, there is a positive-density set of inert Kolyvagin primes ℓ outside it with loc_ℓ(c₁)≠0 and loc_ℓ(c₂)≠0. In particular nonzero classes in opposite conjugation eigenspaces can be detected simultaneously.

**Hypotheses.**

- All hypotheses in the statement and the reader conventions are part of the declaration.

**Prerequisites.** [HE.6/zhang-residual-local-pairing](#he-6-zhang-residual-local-pairing), `EulerSystemsAndKolyvaginSystems:ES.1`, `ArithmeticGaloisDuality:R02.2`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Proof / construction.**

1. Restrict to the finite torsion field and form the joint finite Kummer extension of the two actual residual classes.
2. Use full GL₂(k₀) image and the k₀ evaluation pairing to select a conjugation-compatible element avoiding both annihilator hyperplanes; the independent classes must be checked before this choice.
3. Apply Chebotarev to its conjugacy class, excluding ramification, level, discriminant, p and the prescribed finite set.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Lemma8.1, p.235; proof refers to McCallum Proposition3.1.

**Acceptance.**

- Do not assert simultaneous detection for arbitrary dependent classes or replace k₀ by F_p.
- Finite avoidance must allow previously selected conductor primes.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-zhang-prescribed-ramification-class"></a>

### Residual ramification selection

**Declaration:** `TauCeti.Heegner.zhang_prescribed_ramification_class`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/zhang-prescribed-ramification-class`.

Let g be a weight-two newform of trivial nebentypus, K imaginary quadratic with (D_K,N)=1, N=N⁺N⁻ with N⁻ squarefree of even prime count, and p≥5, p∤ND_K, good ordinary for g. Let k₀ be the finite field generated by the residual Hecke eigenvalues, V its two-dimensional representation, with ρ:G_Q→GL₂(k₀) surjective and A_g[𝔭]≃V⊗k₀k; impose all three clauses of Hypothesis♥. For a Kolyvagin prime ℓ and a finite set S of other Kolyvagin primes, each conjugation eigenspace contains a nonzero global class with finite local condition outside S∪{ℓ}, transverse condition at S, and no condition at ℓ. This existence statement does not assert that its singular localization at ℓ is nonzero.

**Hypotheses.**

- All hypotheses in the statement and the reader conventions are part of the declaration.

**Prerequisites.** [HE.6/zhang-residual-local-pairing](#he-6-zhang-residual-local-pairing), `EulerSystemsAndKolyvaginSystems:ES.1`, `SelmerIwasawaCohomology:L1`.

**Proof / construction.**

1. Apply the imported strict/relaxed Poitou–Tate comparison to the actual self-dual V/k₀ local conditions.
2. Use the one-dimensional same-sign local quotient at ℓ and finite/transverse duality to get a nonzero class in each sign.
3. In the triangular induction prove singular nonvanishing separately, by reciprocity against a simultaneously detected Heegner class.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Lemma8.2 and proof, p.235; Lemma8.4 pp.236–239.

**Acceptance.**

- The omitted local condition at ℓ is not a prescribed nonzero singular value.
- Use the actual p/bad-prime finite Kummer conditions in duality.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-zhang-triangular-selmer-basis"></a>

### Triangular Heegner Selmer basis

**Declaration:** `TauCeti.Heegner.zhang_triangular_selmer_basis`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/zhang-triangular-selmer-basis`.

For g as in Zhang’s Notations with N− squarefree and ν(N−) even, and a nonzero residual Heegner system κ_g satisfying Hypothesis♥, let ν=min{ν(n):c(n)≠0}, ε_ν=w_g(−1)^(ν+1) and B(κ) its base locus of vanishing localizations away from DKNp. The ε_ν Selmer eigenspace has dimension ν+1 and a triangular basis of ν+1 actual c(n_i), detected at selected 2ν+1 auxiliary primes. The opposite eigenspace has dimension ≤ν. Relaxing at the base locus does not enlarge the first eigenspace and preserves that opposite bound.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.6/zhang-cohomological-congruence](#he-6-zhang-cohomological-congruence), `EulerSystemsAndKolyvaginSystems:ES.1`, [HE.6/heegner-vanishing-order](#he-6-heegner-vanishing-order), [HE.6/heegner-base-locus](#he-6-heegner-base-locus), `SelmerIwasawaCohomology:L1`, [HE.6/zhang-residual-heegner-relations](#he-6-zhang-residual-heegner-relations), [HE.6/zhang-two-class-prime-detection](#he-6-zhang-two-class-prime-detection), [HE.6/zhang-prescribed-ramification-class](#he-6-zhang-prescribed-ramification-class).

**Proof / construction.**

1. Use the actual V/k₀ pairing, relation(8.1), parity(3.24), two-class detector and ramification-selection specialization, not the Gross or Howard detector.
2. Choose distinct ℓ₁,…,ℓ₂ν₊₁ inductively; put n_i=ℓ_i⋯ℓ_i₊ν₋₁ for 1≤i≤ν+1. Minimality makes each support localization zero, since c(n_i/ℓ)=0. Thus the c(n_i) satisfy the ordinary finite Selmer conditions.
3. For the next diagonal choose an opposite-sign class by Lemma8.2 and detect it with c(n_{j+1}) by Lemma8.1. Reciprocity against c(n_{j+1}ℓ) leaves one term, forcing singular nonvanishing at the distinguished old prime; (8.1) turns that into the next nonzero diagonal. The detector matrix at ℓ_ν₊j is zero for i>j and has nonzero diagonal.
4. Subtract the triangular basis from any remaining same-sign class so its detector localizations vanish. Simultaneous detection and a new derivative give a one-term reciprocity contradiction. At B(κ), all Heegner localizations vanish, so this argument also applies to the relaxed group.
5. For the opposite sign, a space of dimension>ν has a nonzero vector in the kernel of the ν detector maps. The same simultaneous-detection reciprocity contradiction gives the bound. When ν=0 all conductor products are empty and equal1.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Lemma8.4 and proof, pp.236–239.

**Acceptance.**

- Check the actual k₀ rational structures and all three new arithmetic specializations.
- The family must be nonzero; the zero family has ν=∞ and does not admit a finite triangular basis.
- Keep 2ν+1 distinct selected primes, ν+1 basis classes, and good-prime rather than conductor-only base locus.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-6-zhang-indivisibility"></a>

### Zhang’s Heegner indivisibility theorem

**Declaration:** `TauCeti.Heegner.zhang_indivisibility`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.6/zhang-indivisibility`.

Assume E/Q conductor N, K imaginary quadratic with gcd(D_K,N)=1, N− squarefree with even number of prime factors, full residual GL₂(F_p) image, p≥5 good ordinary and p∤D_KN. Hypothesis♠ requires residual ramification at every ℓ||N+ and every ℓ|N− with ℓ≡±1 mod p; if N is nonsquarefree require a nonempty Ram set and either a ramified ℓ||N− or at least two factors ℓ||N+. Then c_1(n)≠0 for some squarefree Kolyvagin conductor n, so M∞=0. For the auxiliary GL₂-type forms use the stronger Hypothesis♥, including the additive-prime local invariant vanishing.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.6/zhang-local-conditions-rank-lowering](#he-6-zhang-local-conditions-rank-lowering), [HE.6/zhang-rank-zero-over-K](#he-6-zhang-rank-zero-over-k), [HE.6/zhang-jochnowitz-special-value](#he-6-zhang-jochnowitz-special-value), [HE.6/ribet-takahashi-tamagawa-comparison](#he-6-ribet-takahashi-tamagawa-comparison), [HE.6/zhang-triangular-selmer-basis](#he-6-zhang-triangular-selmer-basis).

**Proof / construction.**

1. Use Chebotarev to choose one/two admissible primes with nonzero localization.
2. Apply rank lowering and the rank-zero/Jochnowitz/period comparisons for the rank-one base case.
3. Induct by two on Selmer dimension, using the triangular/relaxed base-locus bounds to force a nonzero congruent class; remove the assumed parity by reduction to rank zero and the root-number contradiction.
4. Use the elliptic additive-reduction calculation to pass from ♠ to ♥.

**Sources.** [HE.0/zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorems1.1,9.1–9.3 and proofs, pp.195,240–243.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Zhang’s Heegner indivisibility theorem.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer6`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The suggested signature states the final transport of a nonzero auxiliary localization to the original class family through a supplied localization homomorphism and congruence. Source hypotheses, the level-raised arithmetic carriers and the preceding rank-lowering/nonvanishing induction are omitted. A zero arbitrary class family cannot satisfy those expressible transport hypotheses. The full theorem remains the mathematical target in this statement.

<a id="he-7"></a>

## HE.7: Integral errors, CM and full finiteness

The integral CM-point construction uses explicit finite cocycles rather than an unjustified inverse of restriction. Homothety and matrix/evaluation constants, component groups, polarization and integral conjugation produce a uniform exponent bound at every coefficient prime. Finite Selmer theory at a fixed exponent and almost-all vanishing give full Sha finiteness. The classical cardinality-square bound has a separate source-acquisition obligation; analytic RM applications additionally need the exact height nonvanishing certificate.

<a id="he-7-non-torsion-point-prime-divisibility"></a>

### Prime divisibility of the non-torsion Heegner point

**Declaration:** `TauCeti.Heegner.non_torsion_point_prime_divisibility`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.7/non-torsion-point-prime-divisibility`.

For non-torsion y_K∈E(K), Mordell–Weil finite generation implies y_K∉pE(K) for every prime outside a finite set. This is proved before assuming rank one or a finite Heegner index: project to the free Mordell–Weil quotient and use a nonzero coordinate. Once rank one has been proved, the index of Z·y_K in the free quotient is finite; it is distinct from an index in E(K) that includes rational torsion.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`, [HE.6/gross-clean-mod-p-descent](#he-6-gross-clean-mod-p-descent).

**Proof / construction.**

1. Import Mordell–Weil finite generation.
2. Choose a nonzero free coordinate of y_K and exclude its finite set of prime divisors.
3. After clean descent proves rank one, identify the one-dimensional lattice index without circularly using it earlier.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §2 pp.237–238; §1 pp.236–237.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Prime divisibility of the non-torsion Heegner point.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer7`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-7-non-cm-open-image-application"></a>

### Non-CM open-image application

**Declaration:** `TauCeti.Heegner.non_cm_open_image_application`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.7/non-cm-open-image-application`.

For non-CM E/Q, import Serre’s open-image theorem to conclude that Q(E[p])/Q has full GL₂(F_p) image for all but finitely many p, and apply it to the actual Heegner setting. More generally obtain the required uniform cohomological restriction/invariant bounds from the open adelic/Tate image over a number field, retaining the cyclotomic determinant and base-field index. For admissible GL₂-type RM quotients import the precise Ribet big-image variant; do not replan either generic theorem in HE.7.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.7/non-torsion-point-prime-divisibility](#he-7-non-torsion-point-prime-divisibility), `FaltingsFinitenessAndIsogenyTheorems:R28.4`, `ArithmeticGaloisRepresentations:R01.4`.

**Proof / construction.**

1. Import Serre’s theorems from their owner, the Part II of FaltingsFinitenessAndIsogenyTheorems on ℓ-adic and residual images of abelian varieties (Serre’s open-image theorems).
2. For E/Q combine the almost-all residual image with the previous prime-divisibility lemma.
3. For exceptional primes use only the exported finite index/cohomological bounds and their exact field/endomorphism hypotheses.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §2 p.237; §12 pp.254–256.

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Non-CM open-image application.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer7`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-7-integral-tate-image-errors"></a>

### Integral Tate image errors

**Declaration:** `TauCeti.Heegner.integral_tate_image_errors`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.7/integral-tate-image-errors`.

Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). For each coefficient prime 𝔭 of O_L, T=T_𝔭A is free rank2 over O_𝔭. For H_M=K(A[𝔭^M]), there are C₂(𝔭),C₃(𝔭)≥0 independent of M such that restriction H¹(K,A[𝔭^M])→H¹(H_M,A[𝔭^M]) has kernel killed by 𝔭^C₂ and the image of O_𝔭[G_K] in End_O𝔭(T) contains 𝔭^C₃ End_O𝔭(T). Both constants vanish for all but finitely many 𝔭. The image assertion uses absence of CM over K, not absence of geometric CM.

**Hypotheses.**

- All hypotheses in the statement and the reader conventions are part of the declaration.

**Prerequisites.** `FaltingsFinitenessAndIsogenyTheorems:R28.4`, `ArithmeticGaloisRepresentations:R01.4`, `ComplexMultiplicationAndExplicitReciprocity:CM.4`, `ArithmeticGaloisDuality:R02.2`, [HE.1/parameter-choice-and-degree](#he-1-parameter-choice-and-degree).

**Proof / construction.**

1. Import Bogomolov/Serre homothety openness and its index uniformity over coefficient primes. A central scalar u acts trivially by conjugation on cohomology, so u−1 kills H¹ of the finite image; take C₂=v_𝔭(u−1).
2. Import the condition(?)/absolute-irreducibility equivalence of the actual GL₂-type representation, via Faltings and the CM character/self-twist dictionary. Burnside gives a full rational matrix algebra; the integral image has finite lattice index, giving C₃ independent of M.
3. For almost all coefficient primes import residual absolute irreducibility over F, restrict to G_K using Clifford theory, and exclude the one quadratic self-twist. If the twist occurred at infinitely many primes, trace congruences would imply a rational self-twist, contrary to condition(?). Nakayama/Burnside give C₃=0.

**Sources.** [HE.0/nekovar](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §§6.1–6.2, pp.35–37, Propositions6.1.2,6.2.1–6.2.2; locators use the 53-page author preprint, not published pagination..

**Acceptance.**

- Do not request full GL₂ surjectivity for a CM curve.
- C₂,C₃ are fixed before increasing M; distinguish restriction kernel from the derivative-class construction.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer7`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-7-cm-heegner-field-disjointness"></a>

### CM and Heegner fields

**Declaration:** `TauCeti.Heegner.cm_heegner_field_disjointness`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.7/cm-heegner-field-disjointness`.

Let E/Q have CM by an imaginary quadratic field M, conductor N, and let K be a classical Heegner field in which every prime dividing N splits. Then M≠K, M∩K=Q, and E does not acquire its CM endomorphisms over K. Over KM the coefficient-extension Tate representation splits into the two conjugate CM characters; G_K exchanges them through Gal(KM/K), so the rational representation over K is absolutely irreducible. This verifies the α=1 condition(?) and matrix-algebra hypothesis of the integral descent, although its residual image need not be full GL₂.

**Hypotheses.**

- All hypotheses in the statement and the reader conventions are part of the declaration.

**Prerequisites.** `ComplexMultiplicationAndExplicitReciprocity:CM.4`, `ArithmeticGaloisRepresentations:R01.3`, [HE.7/integral-tate-image-errors](#he-7-integral-tate-image-errors).

**Proof / construction.**

1. Import CM.4’s induced CM-character Tate realization and R01.3’s induction conductor formula: N=|D_M|Norm_M/Q(f_ψ) for the associated algebraic Hecke character of infinity type(1,0), with the usual elliptic modular weight-two realization. Only |D_M| dividing N is needed.
2. An imaginary quadratic discriminant has a ramified rational prime. That prime divides N and cannot split if K=M; conclude M≠K and [KM:K]=2.
3. Import the endomorphism-field and two distinct conjugate-character dictionary. Recombine the two lines under the degree-two action; do not apply the rank-one-CM-field representation to the G_K descent.
4. Integral restriction/corestriction over KM/K has composite2 and hence fixed dyadic loss; the actual derived classes and global duality remain over K, where condition(?) holds.

**Sources.** [HE.0/nekovar](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §3.2 pp.18–19; Proposition6.2.1 pp.35–36 (CM/self-twist/irreducibility dictionary); locators use the 53-page author preprint, not published pagination..

**Acceptance.**

- The conductor formula is a requested CM/R01 export, not a theorem proved in Nekovář.
- Do not apply Nekovář’s condition(?) over KM itself, where CM is defined.
- A geometric CM curve is allowed over K; K equal to its CM field is excluded by the Heegner condition.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer7`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-7-integral-cm-prime-detection"></a>

### Integral CM prime detection

**Declaration:** `TauCeti.Heegner.integral_cm_prime_detection`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.7/integral-cm-prime-detection`.

Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). For M≫0 with 𝔭^M principal, and a finite O_𝔭/𝔭^M-submodule W₀ of H¹(K,A[𝔭^M]), the actual finite Kummer extension over H_M has an evaluation map whose kernel loss is bounded by C₂ and whose evaluation cokernel is killed by 𝔭^C₃. For ρ-stable W₀, conjugation-compatible detection uses integral 1±ρ and factors2,4,16, with loss C₂+C₃+4v_𝔭(2). It supplies inert good primes in S₁(M), excluding any fixed finite set, with the prescribed detections. S₁(M) requires Frobenius conjugate to ρ in K(x)(A[𝔭^(M+M₀)])/F, M₀=v_𝔭(u₀), hence a_ℓ≡0 and Nℓ+1≡0 mod𝔭^(M+M₀).

**Hypotheses.**

- All hypotheses in the statement and the reader conventions are part of the declaration.

**Prerequisites.** [HE.7/integral-tate-image-errors](#he-7-integral-tate-image-errors), `EulerSystemsAndKolyvaginSystems:ES.4`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, [HE.0/relative-cm-conductor-tower](#he-0-relative-cm-conductor-tower).

**Proof / construction.**

1. Form the finite field cut out by the restricted actual classes; its evaluation injection is the arithmetic Kummer pairing.
2. Import ES.4’s Nekovář6.4.3 maximal-order pairing theorem to bound the evaluation cokernel, then compose with restriction and retain C₂+C₃.
3. Use 2X⁺⊂O_𝔭G⁺ and (ρg)²=g² in 2G⁺ rather than integral half-projectors. The finite-union avoidance argument gives simultaneous detection with the four dyadic valuation losses.
4. Apply Chebotarev to ρg in the joint torsion/Kummer field: its inert prime satisfies the stronger torsion congruence, unit-stabilizer condition and finite exclusions; evaluate localization at (ρg)².

**Sources.** [HE.0/nekovar](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §§5.1–5.2 pp.27–28; §§6.3–6.5 pp.37–41; locators use the 53-page author preprint, not published pagination..

**Acceptance.**

- Evaluation must come from the actual finite Kummer field.
- Nℓ+1 must be divisible by u₀𝔭^M; omit primes whose conductor kills the unit-stabilizer comparison.
- Never divide by2 in the integral conjugation module.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer7`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-7-bounded-arithmetic-derivative-denominators"></a>

### Arithmetic derivative denominators at exceptional primes

**Declaration:** `TauCeti.Heegner.bounded_arithmetic_derivative_denominators`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.7/bounded-arithmetic-derivative-denominators`.

Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). For each 𝔭 and each M≫0 with 𝔭^M principal, the actual CM tower supplies integral c(n)∈H¹(K(x),A[𝔭^M]) without requiring vanishing of torsion invariants. At v∤n its image in H¹(K(x)_v,A)[𝔭^M] is an unramified component-group class, killed by 𝔭^C₁,v where C₁,v kills the geometric 𝔭-primary Néron component group. With C₁=max_v C₁,v, κ_n=𝔭^C₁ cor_K(x)/K c(n) satisfies the actual finite Kummer conditions outside n, κ₁=𝔭^C₁δ(y), and its singular localization at ℓ is −Φ_ℓ Fr(ℓ)κ_n/ℓ. C₁ is independent of M,n and zero for almost all 𝔭; cusp/Hodge and quotient denominators are fixed in ι_A. For classical E use its given modular quotient, absorbing the fixed cusp annihilator and isogeny degree. C₂,C₃ bound evaluation errors, not an inverse of restriction.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.4/differentiated-point-invariance](#he-4-differentiated-point-invariance), [HE.1/jacobian-basepoint-denominators](#he-1-jacobian-basepoint-denominators), [HE.1/parameter-choice-and-degree](#he-1-parameter-choice-and-degree), [HE.0/relative-cm-conductor-tower](#he-0-relative-cm-conductor-tower), [HE.2/quaternionic-reduction-specialization](#he-2-quaternionic-reduction-specialization), [HE.7/integral-cm-prime-detection](#he-7-integral-cm-prime-detection), `EulerSystemsAndKolyvaginSystems:ES.3`, `NeronModelsAndSemistableAbelianVarieties:R11.2`, `ArithmeticGaloisDuality:R02.2`.

**Proof / construction.**

1. Choose the conductor-chain points x(n) with local uniformizers. For r>0 use y(n)=u₀Tr_K(x(n))/K(x(n))₀ ι_A(x(n)); the source’s u(r)=1, while u(0)=u₀. Import ES.3’s positive cyclic derivatives with (σ−1)D=(Nℓ+1)/u₀−Norm.
2. The strongly admissible S₁(M) conditions ensure integral a_ℓ/𝔭^M and (Nℓ+1)/(u₀𝔭^M). On each cyclic generator define the finite cocycle value D_n/ℓ[(a_ℓ/𝔭^M)y(n/ℓ)−((Nℓ+1)/(u₀𝔭^M))y(n)]. Norm zero and the commuting generator identities prove it is a cocycle (Lemma5.8).
3. Choose z with 𝔭^Mz=D_ny(n), inflate the finite cocycle and add (g−1)z as in §§5.9–5.10. The result is torsion-valued and restricts to the actual Kummer class; changing z is a coboundary. No restriction equivalence or torsion-invariant vanishing is assumed.
4. Apply §5.12’s geometric component-group obstruction at every v∤n, including coefficient and bad primes. Multiply once by 𝔭^C₁ and corestrict; good components vanish and the finitely many bad geometric groups give C₁=0 for almost all 𝔭.
5. Use the trace-compatible finite/singular calculation §§5.15–5.18, retaining its minus sign and ΦFr=−FrΦ. The fixed integral ι_A map absorbs the Hodge/cusp degree at the start.

**Sources.** [HE.0/nekovar](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §1.19 pp.14–15; §§4.8–4.13 pp.25–27; §§5.8–5.12 pp.29–30; §§5.15–5.18 pp.31–33; §7.2.1 p.44; locators use the 53-page author preprint, not published pagination..

**Acceptance.**

- Check integral cocycle values at p=2 and nonzero torsion invariants.
- C₁ uses geometric component groups; their rational points alone do not bound all local obstructions.
- All constants are independent of torsion level; principal powers form a cofinal sequence.

**Planet:** Arithmetic derivative denominators at exceptional primes.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer7`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-7-dyadic-integral-conjugation-descent"></a>

### Dyadic integral conjugation descent

**Declaration:** `TauCeti.Heegner.dyadic_integral_conjugation_descent`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.7/dyadic-integral-conjugation-descent`.

Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). The integral two-prime descent applies at every coefficient prime, including 𝔭|2. Write C₀=max{c:y∈A(K)_tors+𝔭^cA(K)}, C₆=v_𝔭(degφ) for a fixed F-polarization, and C₁,C₂,C₃ as above; C₅=v_𝔭[K:K]=0 in this trivial-character part. For M≫0, 2²¹𝔭^(2C₀+2C₁+4C₂+4C₃+C₅+C₆) annihilates Sel(A/K,𝔭^M)/O_𝔭κ₁. Thus B=2C₀+2C₁+4C₂+4C₃+C₆+21v_𝔭(2) is independent of M. Integral (1±ρ) is retained; no decomposition using (1±ρ)/2 is made. All archimedean places of K are complex, so their local H¹ is zero. Any comparison back to a real place of F uses the fixed Tate correction killed by2, as specified in HE.3, rather than an odd-prime invariant argument.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.7/bounded-arithmetic-derivative-denominators](#he-7-bounded-arithmetic-derivative-denominators), [HE.7/integral-cm-prime-detection](#he-7-integral-cm-prime-detection), `EulerSystemsAndKolyvaginSystems:ES.4`, `SelmerIwasawaCohomology:L1`, [HE.3/archimedean-tate-correction](#he-3-archimedean-tate-correction), `ArithmeticGaloisDuality:R02.4`.

**Proof / construction.**

1. Choose a sign ε with exp((1+ερ)κ₁)≥M−C₀−C₁−v_𝔭2 using 2κ₁=(1+ρ)κ₁+(1−ρ)κ₁.
2. Apply actual integral prime detection to the leading component and an opposite-sign class. Reciprocity and the polarization pairing bound the opposite space by exponent C₀+C₁+2C₂+2C₃+C₅+C₆+11v_𝔭2.
3. Choose a second prime detecting the new opposite-sign derivative and a same-sign class in the first localization kernel. Reciprocity with n=ℓℓ′ gives the kernel bound 2¹⁵𝔭^(C₀+C₁+3C₂+3C₃+C₅+C₆).
4. Combine the cyclic finite local image, this kernel and the opposite-space bound, keeping all integral intersection factors2. Apply ES.4’s reusable arithmetic bound with the now verified constants to obtain the displayed factor2²¹.

**Sources.** [HE.0/nekovar](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §5.19 pp.33–34; Proposition7.2.3 pp.44–45; §§7.4–7.5 pp.45–47; locators use the 53-page author preprint, not published pagination..

**Acceptance.**

- Preserve the actual exponents21,11,15 and the polarization defect; they are annihilator bounds, not Sha orders.
- The proof works for geometric CM provided no CM is defined over K.

**Planet:** Dyadic integral conjugation descent.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer7`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-7-cm-character-error-descent"></a>

### CM character descent and error bounds

**Declaration:** `TauCeti.Heegner.cm_character_error_descent`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.7/cm-character-error-descent`.

For a classical CM E/Q, K as in the CM/Heegner-field node, and non-torsion bottom Heegner point, the two conjugate CM Tate characters over KM verify the integral matrix-algebra and homothety bounds over K. The explicit cocycle classes and the integral two-prime descent give the same uniform exponent B at all rational primes, including 2. C₀,C₁,C₂,C₃,C₆ and v_p2 are zero outside a finite set, so Sha(E/K)[p∞]=0 there. This branch uses the semilinear CM character representation, not Serre’s non-CM GL₂ surjectivity.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.7/cm-heegner-field-disjointness](#he-7-cm-heegner-field-disjointness), [HE.7/integral-tate-image-errors](#he-7-integral-tate-image-errors), [HE.7/bounded-arithmetic-derivative-denominators](#he-7-bounded-arithmetic-derivative-denominators), [HE.7/dyadic-integral-conjugation-descent](#he-7-dyadic-integral-conjugation-descent), `ComplexMultiplicationAndExplicitReciprocity:CM.4`, `EulerSystemsAndKolyvaginSystems:ES.4`.

**Proof / construction.**

1. Verify M≠K and the two-character recombination over K from the preceding CM-field comparison.
2. Apply the rational endomorphism/Burnside and almost-all residual irreducibility estimates, as in Nekovář6.2. These remain valid even though the residual group is contained in a Cartan normalizer.
3. Apply the actual explicit cocycle and integral two-prime construction over K; the degree-two CM-character restriction comparison has fixed 2-primary loss, not a level-dependent denominator.
4. Use C_i=0 almost everywhere and the finite Kummer exact sequences to obtain rank1 and almost-all primary vanishing, then combine the exceptional-primary bounds.

**Sources.** [HE.0/nekovar](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), Theorem3.2 pp.18–19; §§6.1–6.2 pp.35–37; Theorem7.3 and §7.5 pp.45–47; locators use the 53-page author preprint, not published pagination..

**Acceptance.**

- Do not move the global descent to KM, where condition(?) fails.
- Almost-all primary vanishing needs the vanishing of the actual C_i, not full GL₂ image.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer7`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-7-exceptional-primary-sha-bound"></a>

### Exceptional primary Sha exponent bound

**Declaration:** `TauCeti.Heegner.exceptional_primary_sha_bound`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound`.

Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). For each 𝔭 the finite-level Selmer quotient by κ₁ is killed uniformly by 𝔭^B, with B=2C₀+2C₁+4C₂+4C₃+C₆+21v_𝔭2. Since κ₁ lies in the Kummer image, Sha(A/K)[𝔭^M] is killed by 𝔭^B for every sufficiently large principal M, hence the entire 𝔭-primary group is killed by 𝔭^B. Finite-level Selmer finiteness at this fixed bound makes the primary group finite. The cofinal principal exponents are sufficient; separate finiteness at each M without a uniform B is insufficient.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.7/dyadic-integral-conjugation-descent](#he-7-dyadic-integral-conjugation-descent), `EulerSystemsAndKolyvaginSystems:ES.4`, `SelmerIwasawaCohomology:L0`, `ArithmeticGaloisDuality:R02.2`.

**Proof / construction.**

1. Apply the verified integral two-prime bound through the finite Kummer exact sequence.
2. Every 𝔭-primary Sha element belongs to one cofinal principal-exponent torsion group; the fixed B kills it.
3. Use finiteness of Sha[𝔭^B], supplied by finite Selmer theory for this abelian variety, to obtain a single finite carrier containing the entire primary part.

**Sources.** [HE.0/nekovar](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §3.5 p.19; §7.1.2 p.43; Theorem7.3 and proof pp.45–47; locators use the 53-page author preprint, not published pagination..

**Acceptance.**

- Use a fixed-exponent finite Selmer group, not a limit of unrelated finite carriers.
- The Selmer quotient bound implies an annihilator of Sha, not a square-index order formula.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer7`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-7-almost-all-primary-sha-vanishing"></a>

### Almost-all primary Sha vanishing

**Declaration:** `TauCeti.Heegner.almost_all_primary_sha_vanishing`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.7/almost-all-primary-sha-vanishing`.

For the classical non-CM non-torsion Heegner setting, outside a finite set of primes the Gross clean theorem gives Sha(E/K)[p]=0. Since Sha is torsion, this implies Sha(E/K)[p∞]=0: any nonzero p-primary element would yield nonzero p-torsion after taking a suitable p-power multiple. This does not require proving finite p-primary groups first. For CM E use the separate CM-character branch: the uniform integral constants vanish outside a finite set and the finite-level Kummer quotient then forces Sha[p∞]=0. For the specified RM quotients the same reasoning applies at coefficient primes 𝔭; there are finitely many exceptional coefficient primes, not a tacit residual-surjectivity assumption.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.7/non-cm-open-image-application](#he-7-non-cm-open-image-application), [HE.6/gross-clean-mod-p-descent](#he-6-gross-clean-mod-p-descent), `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, [HE.7/cm-character-error-descent](#he-7-cm-character-error-descent), [HE.7/exceptional-primary-sha-bound](#he-7-exceptional-primary-sha-bound).

**Proof / construction.**

1. Combine non-CM almost-all image and point indivisibility with Gross’s clean mod-p theorem.
2. Apply the elementary p-primary torsion argument to the actual Sha carrier.
3. Retain the finite exceptional set containing p=2 and all failures of the clean hypotheses.
4. In the CM/RM branch use the actual zero C_i and the integral Selmer bound, before the finite-primary sum; retain every exceptional coefficient prime.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §2 pp.237–238 and Proposition2.1; [HE.0/nekovar](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §3.5.2 p.19; §§6.1–6.2 pp.35–37; §7.4 p.45; locators use the 53-page author preprint, not published pagination..

**Acceptance.**

- Check every displayed hypothesis against the cited source and retain integral coefficients and normalization constants.

**Planet:** Almost-all primary Sha vanishing.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer7`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-7-classical-full-sha-finiteness"></a>

### Classical full Sha finiteness

**Declaration:** `TauCeti.Heegner.classical_full_sha_finiteness`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness`.

Let E/Q have a fixed modular quotient X₀(N)→E, K imaginary quadratic with D_K≠−3,−4 and all N-primes split, and y_K=Tr_K[1]/K P₁ of infinite order. Then rank E(K)=1 and the entire Sha(E/K) is finite, including CM E and p=2. The uniform integral Selmer bound gives rank1: the non-torsion Kummer line has finite-index quotient at any coefficient prime; it also gives finite exceptional primary groups and almost-all primary vanishing. The quantitative square-index order theorem is stated separately and is not inferred from this exponent argument.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.7/almost-all-primary-sha-vanishing](#he-7-almost-all-primary-sha-vanishing), [HE.7/exceptional-primary-sha-bound](#he-7-exceptional-primary-sha-bound), [HE.7/cm-heegner-field-disjointness](#he-7-cm-heegner-field-disjointness), `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`.

**Proof / construction.**

1. Specialize the integral CM-point setup to F=Q, B=M₂(Q), N_U*=X₀(N) and the given quotient. The fixed cusp annihilator multiplies y_K by a nonzero integer and cannot destroy non-torsion.
2. For non-CM E condition(?) holds; for CM E verify it using the CM/Heegner-field comparison. Apply the uniform quotient bound at one prime and Mordell–Weil finite generation to get rank1 without a prior index assumption.
3. Apply almost-all primary vanishing and the fixed exceptional-primary bounds. The torsion-primary decomposition identifies Sha with a finite direct sum of finite primary groups.

**Sources.** [HE.0/nekovar](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), Theorem3.2 pp.18–19; §7.4 p.45; §7.5 pp.45–47; locators use the 53-page author preprint, not published pagination.; [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Theorem1.3 pp.236–237 (quoted classical endpoint).

**Acceptance.**

- Retain the given modular parametrization and bottom trace, not a point over K[1] without trace.
- Rank must be established before assigning a finite Mordell–Weil index.
- No primary component may be omitted.

**Planet:** Classical full Sha finiteness.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer7`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-7-admissible-rm-kolyvagin-logachev"></a>

### Admissible RM Kolyvagin–Logachev application

**Declaration:** `TauCeti.Heegner.admissible_rm_kolyvagin_logachev`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.7/admissible-rm-kolyvagin-logachev`.

Fix F totally real of degree d, B/F ramified at all real places except a chosen τ₁ and at a finite set S_B with #S_B≡d−1 mod2, and an open compact level U⊂B̂×. Let A/F be an F-simple Hecke-linear quotient of J(N_U*) with End_F(A)=O_L, L totally real and [L:Q]=dim A, and fix its nonzero integral quotient map. Let K/F be totally imaginary quadratic, every v∈S_B inert or ramified in K, fix t:K↪B and a CM point x of the specified level over K(x). Use the central quotient N_U*, modular compactification when B=M₂(Q), and the integral cusp/Hodge map ι(P)=m[P]−mδ of Nekovář1.19, with fixed m. Put y=Tr_K(x)/K ι_A(x). Assume y non-torsion and A does not acquire CM over K (Nekovář’s condition(?) for α=1). Then A(K)/O_Ly is finite, rank_Z A(K)=[L:Q]=dim A, and the entire Sha(A/K) is finite. This is the trivial-character specialization of Nekovář3.2 and includes the specified quaternionic/RM quotients, with field, ramification, central quotient, maximal endomorphism order, Hecke map and integral Hodge normalization stated above. An analytic rank-d conclusion additionally requires a supplier height formula proving this particular y is non-torsion from ord_s=1 L(A/K,s)=d; analytic rank alone is not an input to descent.

**Hypotheses.**

- The hypotheses in the statement are part of the declaration; the conventions in the reader apply.

**Prerequisites.** [HE.7/integral-tate-image-errors](#he-7-integral-tate-image-errors), [HE.7/bounded-arithmetic-derivative-denominators](#he-7-bounded-arithmetic-derivative-denominators), [HE.7/exceptional-primary-sha-bound](#he-7-exceptional-primary-sha-bound), [HE.7/almost-all-primary-sha-vanishing](#he-7-almost-all-primary-sha-vanishing), `EulerSystemsAndKolyvaginSystems:ES.4`, `HilbertModularVarietiesAndShimuraCurves:R18.1`, `HilbertModularVarietiesAndShimuraCurves:R18.4`, `GrossZagierAndArithmeticHeights:GZ.8`, `SelmerIwasawaCohomology:L0`.

**Proof / construction.**

1. Use the specified quaternionic Jacobian quotient and integral CM-point trace, importing their carriers from R18 and the abelian-variety roadmap.
2. Verify the no-CM-over-K condition and rank-two coefficient Tate realization. Apply the explicit cocycle, actual prime detection and uniform Selmer quotient bound at every coefficient prime.
3. Use finite generation to deduce rank1 over O_L and hence rank dim A over Z. The bounded primary groups and almost-all vanishing imply full Sha finiteness by torsion decomposition.
4. For a modular analytic-rank application request the exact GZ.8 height/nonvanishing export for this quotient and CM field, and verify it before invoking the geometric theorem.

**Sources.** [HE.0/nekovar](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §§3.1–3.2 pp.18–19; §7.1 pp.43–44; §§7.3–7.5 pp.45–47; locators use the 53-page author preprint, not published pagination..

**Acceptance.**

- No unspecified admissibility: check F,B,U,K,t,x, End_F(A)=O_L and the nontrivial Hecke-linear map.
- Use the integral m(P−δ) map, even when the curve is geometrically disconnected.
- For nonmaximal endomorphism orders supply a fixed isogeny comparison and its local degree errors before using this maximal-order statement.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer7`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

<a id="he-7-classical-square-index-error-bound"></a>

### Classical square-index bound

**Declaration:** `TauCeti.Heegner.classical_square_index_error_bound`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.7/classical-square-index-error-bound`.

In the classical setting of the full-finiteness node, put O=End_overlineQ(E), Q_O=O⊗Q, embedded in overlineQ through the chosen CM type when O≠Z. Let B(E) consist of odd primes ℓ∤disc(O) such that the O_ℓ-linear representation G_Q_O→Aut_Oℓ(T_ℓE) is surjective. There is a positive integer d_E independent of K with v_ℓ(d_E)=0 for ℓ∈B(E) and #Sha(E/K) dividing d_E I_K², where I_K=[E(K):Zy_K] includes rational torsion and is defined after rank1 is proved. For non-CM E, Q_O=Q and Aut_Oℓ=GL₂(Z_ℓ); for CM E use the linear Cartan action over Q_O, not full GL₂ over Q. B(E) is a full Tate-image criterion and is not silently replaced by a residual-image criterion at the small primes. Gross writes the related error bound as t_E/K I_K²; no explicit value or optimality of either constant is asserted.

**Hypotheses.**

- All hypotheses in the statement and the reader conventions are part of the declaration.

**Prerequisites.** [HE.7/classical-full-sha-finiteness](#he-7-classical-full-sha-finiteness), [HE.7/bounded-arithmetic-derivative-denominators](#he-7-bounded-arithmetic-derivative-denominators), [HE.7/cm-character-error-descent](#he-7-cm-character-error-descent), `EulerSystemsAndKolyvaginSystems:ES.4`.

**Proof / construction.**

1. Import ES.4’s classical size bound with the actual Heegner derivative and error data. This is a stronger theorem than the two-prime annihilator estimate; its requested contract must control the cardinality, not just the exponent.
2. Verify the modular point, coefficient-prime and integral error hypotheses from HE.4–HE.7, retaining the source’s full Mordell–Weil index.
3. Combine the size bounds prime by prime, using the clean odd-prime square-index bound where applicable and finite exceptional support. The original Euler Systems proof is a precise source-acquisition gap for the requested generic size theorem, not a claimed proof in the read exposition.

**Sources.** [HE.0/gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Theorem1.3, p.236; [HE.0/kolyvagin-structure](https://www.wstein.org/papers/bib/kolyvagin-structure_of_sha.pdf), TheoremA, p.95; introduction pp.94–97.

**Acceptance.**

- Separate exponent from cardinality and full Mordell–Weil index from free-lattice index.
- The denominator of the Galois group in Kolyvagin’s B(E) is Q_O=O⊗Q, not always Q. The group is O_ℓ-linear over the CM field.
- Keep the full Tate-image good-prime condition, especially at3; do not change it to mod-ℓ surjectivity without a separate lifting theorem.
- The ES.4 size export must retain the source-specific hypotheses and explicit original-proof acquisition boundary.

**Library home:** `TauCeti/NumberTheory/Heegner/Layer7`, namespace `TauCeti.Heegner`. **Implementation:** unchecked.

**Prototype boundary.** The Lean signature supplies existing algebraic carriers and the indicated conclusion. The exact arithmetic identification, field, geometry, coefficient topology and source hypotheses in this node’s full statement cannot yet be expressed through the supplier interfaces. Those conditions are omitted explicitly, not replaced by invented Prop fields or opaque types. Where the signature presents one component of a geometric comparison (localization, degree, norm, or reduction), the remaining geometric construction and compatibility are still the mathematical target in the statement.

## Part II: anticyclotomic Heegner arithmetic (HE.8–HE.8b)

The source branches have different hypotheses. This matrix summarizes the additional restrictions; the full node statements below retain all base assumptions and supplier conditions.

| Result / source | Additional scope | Output and boundary |
| --- | --- | --- |
| Cornut modular tower | Classical Heegner setting, p∤N | A non-torsion trace at some conductor; no every-trace claim |
| CV definite, Theorem 1.4 | Relative data, N′ coprime to D, even sign parity, nonexceptionality, admissible χ₀ | A character in each sufficiently large primitive stratum has nonzero central value |
| CV indefinite, Theorem 1.5 | Relative data, odd parity, ω=1, N,D,P pairwise coprime | A character in each sufficiently large primitive stratum has nonzero derivative |
| Howard B | Odd ordinary p, full G_K Tate image, p∤h_K and p∤ND_K | Rank one, paired torsion, one-sided integral divisibility |
| CGLS Theorem 4.1.1 / localized bound | E(K)[p]=0, actual d(k) class-number shifts | Nonzero family and bound in Λ[1/p,1/(γ−1)]; augmentation inversion removed only with the extra corank-one condition |
| BCK Theorem 5.2 | p>3, H⁰(G_K,E[p])=0, classical N⁻=1, ordinary split p | Integral Heegner/Greenberg divisibility comparison; not a proof of either side |
| BCGS A | (Heeg),(disc),(tor), odd ordinary split p, rational main-conjecture lower divisibility | Some finite derivative class nonzero; κ₁ may vanish |
| BCGS B / exact-length proof route | p>3, residual surjectivity, p-optimal parametrization, integral main conjecture | M∞ equals the rational Tamagawa valuation sum; the p=3 uniform-stub proof remains a gap |
| BCS v2, Theorems 1.2.2 / 1.2.4 | p>3, ordinary split p, (Heeg),(disc); irreducible residual G_Q image for rational equality, surjective image for integral equality | Distinct rational and integral Heegner/Greenberg main-conjecture branches |
| CGS Theorem C adapter | Rational p-isogeny with kernel character φ, p∤2N, (disc),(Heeg),(spl), φ restricted to G_p differs from 1 and ω | Independent BSD.7a Eisenstein equality; no older CGLS (Sel) hypothesis is substituted |
| CS Theorem C | p>3, residual surjectivity, p∤Manin constant, ordinary p unramified in K | Refined equality iff integral determinant conjecture; inert equality remains conditional |


<a id="he-8"></a>

## HE.8: Ordinary families, CM nonvanishing and conditional refinements

Start with the initial Euler factor, corrected ordinary stabilization and coherent norm families. Joint CM distribution and weighted degeneracy prove the point/period nonvanishing that makes the Λ-line nonzero. Derivative and local comparisons then support Howard’s strong bound and the weaker localized branches. Near-identity twists retain logarithm, lattice, control, local torsion and Tamagawa factors. BCGS and CS endpoints here keep their main-conjecture hypotheses; the strict all-p determinant carrier is distinguished from the torsion (0,∅) Greenberg carrier.

<a id="he-8-initial-euler-factor"></a>

### Heegner initial Euler factor

**Declaration:** `TauCeti.Heegner.Anticyclotomic.initialFactor`. **Kind:** definition. **Stable node:** `HeegnerPointEulerSystems:HE.8/initial-euler-factor`.

For every permitted n, in ℤ_p[G(n)] with G(n)=Gal(K[n]/K), define Φ=(p+1)²−a_p² if p is inert; if p splits define Φ=(p−a_pσ+σ²)(p−a_pσ*+σ*²), with σ,σ* the specified Artin elements. The augmentation is (p+1−a_p)² in the split case, not necessarily a unit. Keep the finite ring-class group, its Artin action and the initial unit index; it differs from Howard’s first-step degree group Δ=(O_K/pO_K)×/(ℤ/pℤ)×.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.

**Prerequisites.** [HE.0/ring-class-tower-quotients](#he-0-ring-class-tower-quotients), `mathlib:MonoidAlgebra.single`.

**Proof / construction.**

1. Read σ,σ* through the imported reciprocity convention.
2. Compute the initial trace polynomial from HE.2; retain its action on the Δ-module.

**Sources.** [HE.7s/howard](https://arxiv.org/pdf/1202.6340), §2.3, before Lemma 2.3.2.

**Uses determining the API.**

- Howard Lemma 2.3.2: describes the common initial trace image
- BCGS Lemma 1.1.5 and CS Lemma 3.1.1: its augmentation is the specialization factor

**Planning API.**

- `TauCeti.Heegner.Anticyclotomic.initialFactor_inert` (simp): Inert Φ=(p+1)²−a_p².
- `TauCeti.Heegner.Anticyclotomic.initialFactor_split` (simp): Split Φ is the product of the two Artin quadratic factors, not its augmentation.
- `TauCeti.Heegner.Anticyclotomic.initialFactor_augmentation` (compatibility): Augmentation of the split factor is (p+1−a_p)²; inert augmentation is unchanged.
- `TauCeti.Heegner.Anticyclotomic.initialFactor_natural` (functoriality): A coefficient-ring map and compatible Δ-map carry Φ to the corresponding factor.

**Unit tests.**

- `TauCeti.Heegner.Anticyclotomic.initialFactor_split_anomalous` (computation): For p=5,a_p=1 and σ=σ*=1, Φ=25, a nonunit in ℤ_5.
- `TauCeti.Heegner.Anticyclotomic.initialFactor_inert_value` (computation): For p=5,a_p=1, inert Φ=35, distinct from the split augmentation25.
- `TauCeti.Heegner.Anticyclotomic.initialFactor_reciprocity` (compatibility): Replacing both Artin elements by inverses transforms Φ by that involution; it does not permit replacing σ by1.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-ordinary-stabilized-point"></a>

### Ordinary stabilization of Heegner points

**Declaration:** `TauCeti.Heegner.Anticyclotomic.stabilizedPoint`. **Kind:** construction. **Stable node:** `HeegnerPointEulerSystems:HE.8/ordinary-stabilized-point`.

Let α_p∈ℤ_p× be the unit root of X²−a_pX+p and β_p=p/α_p. For k≥1 put P[p^k]_α=P[p^k]−α_p⁻¹P[p^(k−1)] and scale by α_p⁻k. At k=0 use u_K⁻¹(1−α_p⁻¹σ)(1−α_p⁻¹σ*)P[1] in the split case and u_K⁻¹(1−α_p⁻²)P[1] in the inert case. Trace to K_k with the actual smallest d(k) such that K_k⊂K[p^d(k)], including p-primary class-number shifts.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/initial-euler-factor](#he-8-initial-euler-factor), [HE.2/repeated-conductor-predecessor-recurrence](#he-2-repeated-conductor-predecessor-recurrence), [HE.2/split-ramified-first-step-recurrence](#he-2-split-ramified-first-step-recurrence), `PadicHodgeRegulators:L3`, `mathlib:PadicInt`.

**Proof / construction.**

1. Use the ordinary unit-root supplier, not division by a_p.
2. Apply the repeated and initial trace relations separately; form the finite ring-class norms with d(k).

**Sources.** [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Remark 4.1.3.

**Uses determining the API.**

- CGLS Remark 4.1.3: builds the ordinary compatible tower
- BCGS §1.1.2: compares normalized Λ-lines

**Planning API.**

- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_succ` (projection): At k≥1 the scaled point is α_p⁻k(P[p^k]−α_p⁻¹P[p^(k−1)]).
- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_map` (functoriality): An equivariant ℤ_p-linear map commutes with stabilization.
- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_change_unit` (compatibility): A unit rescaling of all raw points rescales every stabilized point by that unit.
- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_initial` (relation): The conductor-zero value uses its separate split/inert correction with u_K.

**Unit tests.**

- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_zero` (degenerate): All raw points zero give every stabilized point zero.
- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_predecessor` (computation): Over ℚ_5 with unit root2 and raw P_1=4,P_0=2, the k=1 stabilized value is3/2, not2 or3.
- `TauCeti.Heegner.Anticyclotomic.stabilizedPoint_first_level` (computation): At initial level the prescribed Euler-corrected P[1] is used; the positive-level recurrence is not evaluated at a nonexistent predecessor.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-stabilized-corestriction"></a>

### Norm compatibility of stabilized Heegner points

**Declaration:** `TauCeti.Heegner.Anticyclotomic.stabilized_corestriction`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/stabilized-corestriction`.

The stabilized points traced to the anticyclotomic layers satisfy Cor_(K_(k+1)/K_k)y_(k+1)=y_k. The first trace uses the initial correction in ordinary-stabilized-point; a shift d(k) is required when p divides h_K. This construction does not assert Howard Theorem B under the weakened class-number hypothesis.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/ordinary-stabilized-point](#he-8-ordinary-stabilized-point), [HE.0/norm-reciprocity-level-compatibility](#he-0-norm-reciprocity-level-compatibility).

**Proof / construction.**

1. Expand the recurrence, use a_p=α_p+β_p and α_pβ_p=p.
2. At the first level evaluate the Artin correction; use the actual tower norms.

**Sources.** [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Remark 4.1.3 and proof of Theorem 4.1.1.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

**Assembled prototype refinement (review required).** Corestriction now applies to `stabilizedPoint α raw initial`, with linear transition maps. It requires the unit-root polynomial, the raw positive-level recurrence, the degree-p trace of an embedded predecessor and the separate corrected first raw trace. For positive levels, the polynomial gives a_p−pα⁻¹=α and therefore the trace of α^{−(k+1)}(P_{k+1}−α⁻¹P_k) is α^{−k}(P_k−α⁻¹P_{k−1}). At level zero the first raw trace gives the specified initial point. Actual conductor norms, initial Artin factors and the d(k) class-number shifts are still supplied arithmetic conditions. An arbitrary family and arbitrary transition maps no longer inhabit this signature.

<a id="he-8-universal-norm-heegner-family"></a>

### Howard universal-norm Heegner family

**Declaration:** `TauCeti.Heegner.Anticyclotomic.universalNormFamily`. **Kind:** construction. **Stable node:** `HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family`.

Under the ordinary Heegner conditions and E(K)[p]=0, construct Q[n] in lim_k H_k[n], the inverse limit of the ℤ_p[Gal(K_k[n]/K)]-modules generated by P[n] and P_j[n]. Its level-zero projection is ΦP[n], and Cor_(K∞[nℓ]/K∞[n])Q[nℓ]=a_ℓQ[n] for every permitted auxiliary ℓ. Choices arise from compactness, not uniqueness. Howard proves this under full G_K image and p∤h_K; CGLS Theorem 4.1.1 gives the weaker construction with the actual class-number conductor shifts, without extending Howard’s divisibility theorem.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/initial-euler-factor](#he-8-initial-euler-factor), [HE.2/norm-relation-and-reduction-congruence](#he-2-norm-relation-and-reduction-congruence), `PadicMeasuresIwasawaAlgebras:L1`, `PadicMeasuresIwasawaAlgebras:L5`.

**Proof / construction.**

1. Use ∩γ_kM=ΦM to lift ΦP[n] in the free presentation.
2. Lift finite families with compatible auxiliary norms, then use compactness to select one coherent family.

**Sources.** [HE.7s/howard](https://arxiv.org/pdf/1202.6340), Lemmas2.3.2–2.3.3; [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation.

**Uses determining the API.**

- Howard §2.3 derivative construction: requires simultaneously coherent auxiliary norms
- Howard Lemma 2.3.8: computes the augmentation image

**Planning API.**

- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_level_zero` (projection): Q[n]_0=ΦP[n].
- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_trace` (relation): Auxiliary trace Q[nℓ] maps to a_ℓQ[n].
- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_corestriction` (compatibility): Each anticyclotomic transition carries Q[n]_(k+1) to Q[n]_k.
- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_choice` (characterisation): Two choices need not be equal; their difference has zero prescribed initial projection and obeys homogeneous norm relations.

**Unit tests.**

- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_bottom` (compatibility): At n=1 the bottom projection is ΦP[1], not P[1].
- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_auxiliary` (degenerate): For a_ℓ=0 the auxiliary trace is zero; it is not the degree times Q[n].
- `TauCeti.Heegner.Anticyclotomic.universalNormFamily_nonunique` (non-example): A supplied inverse-limit module with a nonzero projection kernel permits distinct lifts of the same initial point.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

**Assembled prototype refinement (review required).** The common-carrier prototype takes compact Hausdorff L, Hausdorff P, continuous bottom maps πₙ and auxiliary maps trₙ,ℓ, and an explicit set of permitted conductor edges. For every finite set of bottom indices and finite set of edges, `hfinite` supplies a simultaneous partial lift. In the compact product L^ℕ, each bottom or trace equation is closed; finite simultaneous lifts give the finite intersection property, hence one family satisfying all equations. Howard's common-conductor formal module supplies the finite-lift input, not arbitrary independent choices. Production code must instantiate the actual dependent H[n] modules and class-number shifts. The common-carrier indexing can extend the admissible conductors by zero outside their set.

The constructor takes the same trace maps as its API. Auxiliary trace requires an allowed edge; its zero-scalar test also requires a_ℓ=0. Level corestriction uses a square commuting on every element of the supplied inverse limit. The choice API proves both zero bottom difference and homogeneous auxiliary relations. Tests use compact ℤ₅ and distinguish ΦP[1] from P[1], allowed zero-scalar trace from an arbitrary map, and distinct homogeneous kernel choices from uniqueness. An additional rejection example shows zero π and nonzero bottom data fail even the singleton finite-lift condition. These are expressible interface constraints; the supplier's arithmetic identification remains omitted explicitly. The packet's R1 verdict is preserved pending review of this repair.

<a id="he-8-anticyclotomic-heegner-class"></a>

### Anticyclotomic Heegner class

**Declaration:** `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass`. **Kind:** construction. **Stable node:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`.

Apply the integral Kummer map to the stabilized norm-compatible points and the imported Iwasawa–Shapiro comparison to obtain y∞∈H¹_Iw(K∞/K,T)=H¹_cont(K,T⊗Λ(tautological inverse)). The actual tower class lies in the specified ordinary Selmer structure. Its projection to level k is the Kummer class of y_k. There is no assertion that each character specialization is nonzero.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/stabilized-corestriction](#he-8-stabilized-corestriction), [HE.3/kummer-classes-and-the-modified-selmer-conditions](#he-3-kummer-classes-and-the-modified-selmer-conditions), `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`.

**Proof / construction.**

1. Invoke finite Kummer/corestriction compatibility from HE.3.
2. Use the supplier’s continuous, derived-limit comparison, with its tautological-action sign.

**Sources.** [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1 and Remark 4.1.3.

**Uses determining the API.**

- Howard TheoremB: supplies the actual rank-one Heegner Λ-submodule
- BSD.7a and AutomorphicCongruences L5a: need the early nonzero family without a completed main conjecture

**Planning API.**

- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_level` (projection): Under Iwasawa–Shapiro, level k equals the Kummer class of y_k.
- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_scalar` (functoriality): An equivariant quotient or scalar transport commutes with the class construction.
- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_restrict` (compatibility): Changing the tower by a finite initial norm gives the imported corestriction comparison, with its degree/factor.
- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_zero` (simp): The identically zero compatible point family has zero class.

**Unit tests.**

- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_trace` (compatibility): Conductor one specializes to the corrected trace over its ring-class field, not an assumed K-rational raw point.
- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_isogeny` (non-example): A p-isogeny acts by the actual lattice map; a nonunit scalar can change the integral index.
- `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_nonzero_not_all_specializations` (non-example): In the supplied two-coordinate cohomology model, the image of (1,0) under the identity Iwasawa comparison is nonzero, but its second-coordinate specialization is zero. The test invokes heegnerIwasawaClass and detects both a zero construction and an assertion that all projections are nonzero.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Planet:** Anticyclotomic Heegner class.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-cm-character-stratum"></a>

### Primitive CM character stratum

**Declaration:** `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum`. **Kind:** definition. **Stable node:** `HeegnerPointEulerSystems:HE.8/cm-character-stratum`.

For the imported relative ring-class tower G∞ with finite torsion G₀, define P(n,χ₀) as the finite-order characters of G(n) restricting to χ₀ on G₀ and not factoring through G(n−1). The character satisfies χ₀ω=1 on the embedded A_F×. Conductor is the largest F-ideal in the order, and primitivity is exact level, not merely conductor dividing P^n. Small n before G₀ embeds are excluded.

**Hypotheses.**

- F totally real, K/F CM, P a finite prime; n is large enough to identify G₀ in G(n).

**Prerequisites.** [HE.0/relative-cm-conductor-tower](#he-0-relative-cm-conductor-tower), [HE.0/norm-reciprocity-level-compatibility](#he-0-norm-reciprocity-level-compatibility).

**Proof / construction.**

1. Use the actual quotient maps and torsion inclusions.
2. Define the fixed-type locus minus pullback of characters at the preceding level.

**Sources.** [HE.7s/cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §1.1, equations(3)–(4), and Lemma 2.8.

**Uses determining the API.**

- CV Theorems1.4/1.5: quantifies existence within exact-conductor fixed-torsion strata
- CV Lemma 2.8 and Theorem 5.10: primitive-character averaging separates old-level contributions

**Planning API.**

- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_mem` (characterisation): Membership is fixed torsion restriction together with failure to factor through G(n−1).
- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_torsion` (projection): Every member restricts to χ₀ on G₀.
- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_not_old` (relation): Every pullback from G(n−1) is excluded.
- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_transport` (equivalence): Compatible isomorphisms of tower quotients and torsion subgroups identify the strata.

**Unit tests.**

- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_identity_quotient` (degenerate): When the preceding-level quotient map is the identity, the primitive stratum is empty.
- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_wrong_torsion` (non-example): A character with the wrong restriction to G₀ is excluded even if it is primitive.
- `TauCeti.Heegner.Anticyclotomic.cmCharacterStratum_first_nontrivial` (computation): For G(n)=C₂, preceding quotient1, trivial torsion subgroup and identity character C₂→C₂, the character belongs to the exact-level stratum.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-cm-generic-root-number"></a>

### Generic CM root-number parity

**Declaration:** `TauCeti.Heegner.Anticyclotomic.cm_generic_root_number`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/cm-generic-root-number`.

For cuspidal parallel-weight-two π over F with finite-order everywhere-unramified central character ω, and prime-to-P conductor N′ coprime to D_(K/F), let S be all real places and the finite inert Q≠P for which ord_Q(N) is odd. For sufficiently ramified compatible ring-class χ, ε(π,χ)=(-1)^|S|. The source’s S_χ equals S at every level if P∤N or P splits in K. Even |S| is definite and odd |S| indefinite.

**Hypotheses.**

- π cuspidal parallel weight two; ω finite-order everywhere unramified; N′ and D_(K/F) coprime.

**Prerequisites.** [HE.8/cm-character-stratum](#he-8-cm-character-stratum), `GrossZagierAndArithmeticHeights:GZ.4`.

**Proof / construction.**

1. Import local epsilon identities with the source’s conventions.
2. Eliminate the moving P factor only at sufficiently large conductor; multiply signs.

**Sources.** [HE.7s/cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §1.1, Lemma 1.1 and definitions of S,Sχ.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-joint-cm-equidistribution"></a>

### Joint distribution of CM reductions

**Declaration:** `TauCeti.Heegner.Anticyclotomic.joint_cm_equidistribution`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/joint-cm-equidistribution`.

Let F be totally real, K/F CM, and B/F a quaternion algebra split by K and at P, with a fixed K-embedding. Choose a nonempty finite collection 𝒮 of finite sets S of finite places v≠P with B_v split, K_v a field, and |S|+|Ram_f(B)|+[F:ℚ] even; fix the source’s totally definite B_S and compatible local embeddings. Let R⊂Gal(K^ab/K) be nonempty finite and pairwise distinct modulo P-rational elements rec_K(λ), characterized by λ_P∈K×·F_P×. Form the actual simultaneous Red:CM→X(𝒮,R) and component map C with fibre probability measures μ_z. For compact-open G⊂Gal(K^ab/K) with probability Haar dg, a P-isogeny class ℋ, and continuous f:X(𝒮,R)→ℂ, the difference ∫_G f(Red(gx))dg−∫_G∫_(C⁻¹(gx̄))f dμ_(gx̄)dg tends to zero as x escapes compact subsets of ℋ. Here x̄=C(Red(x)); prohibited components are retained.

**Hypotheses.**

- B split by K and at P; each auxiliary set satisfies S1–S3 and excludes P, as specified in the statement. R is nonempty and pairwise P-irrational; G is compact open. Artin reciprocity sends uniformizers to geometric Frobenius.

**Prerequisites.** [HE.0/relative-cm-conductor-tower](#he-0-relative-cm-conductor-tower), [HE.1/optimal-embedding-cm-points](#he-1-optimal-embedding-cm-points), `HilbertModularVarietiesAndShimuraCurves:R18.1`, `HilbertModularVarietiesAndShimuraCurves:R18.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

**Proof / construction.**

1. Reduce the adelic orbit to products of cocompact SL₂(F_P) quotients.
2. Apply the requested p-adic uniform-distribution theorem and twisted-diagonal classification.
3. Identify commensurable factors with P-rational reciprocity classes; pairwise irrationality forces the full product.

**Sources.** [HE.7s/cv-dynamics](https://webusers.imj-prg.fr/~christophe.cornut/papers/part2.pdf), Theorem 2.9; §§2.5 and2.7.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Planet:** Joint CM equidistribution.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-joint-cm-orbit-surjectivity"></a>

### Surjectivity onto CM reduction fibres

**Declaration:** `TauCeti.Heegner.Anticyclotomic.joint_cm_orbit_surjectivity`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/joint-cm-orbit-surjectivity`.

At fixed finite level and with the joint CM distribution hypotheses, Red(Gx) equals the fibre C⁻¹(Gx̄) for every x outside a finite subset of its P-isogeny class. The right side retains the component map C and does not assert independent reductions in forbidden components.

**Hypotheses.**



**Prerequisites.** [HE.8/joint-cm-equidistribution](#he-8-joint-cm-equidistribution).

**Proof / construction.**

1. Apply the continuous-test-function limit to indicators of each permitted finite fibre point.
2. Positive fibre measure gives eventual occurrence; combine finitely many points.

**Sources.** [HE.7s/cv-dynamics](https://webusers.imj-prg.fr/~christophe.cornut/papers/part2.pdf), Corollary 2.10.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-relative-ring-class-tower-torsion-finite"></a>

### Finite torsion in the relative ring-class tower

**Declaration:** `TauCeti.Heegner.Anticyclotomic.relative_ring_class_tower_torsion_finite`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/relative-ring-class-tower-torsion-finite`.

For the CV relative CM tower K[P^∞]/K and an abelian variety A/K, A(K[P^∞])_tors is finite. Choose two good-reduction places of K above distinct residue characteristics and primes Q≠P of F that do not split in K. CV Lemma 2.7 bounds their local extension degrees in the tower; prime-to-residue-characteristic reduction injectivity at these two places bounds all torsion. This is a statement about this tower, not torsion over every abelian extension.

**Hypotheses.**

- F totally real, K/F CM, P a fixed finite prime, and the relative ring-class tower and its reciprocity identification of HE.0.
- A/K an abelian variety; choose two distinct residue characteristics away from P and the bad reduction set.

**Prerequisites.** [HE.0/relative-cm-conductor-tower](#he-0-relative-cm-conductor-tower), [HE.0/ring-class-tower-quotients](#he-0-ring-class-tower-quotients), `NeronModelsAndSemistableAbelianVarieties:R11.5`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Proof / construction.**

1. Use CV Lemma 2.7 to prove the finite decomposition-group claim from the relative idele/class-field quotient; use Chebotarev and finite avoidance to choose two suitable nonsplit good places.
2. The local extensions are unramified of bounded degree, so their reduction groups lie over fixed finite residue extensions.
3. Inject prime-to-residue-characteristic torsion at each place into the finite reduction group. With two distinct characteristics these bounds cover every primary part and prove finiteness.

**Sources.** [HE.7s/cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Lemma 2.7 and proof of Proposition 4.4, PDF pp.22,38; used again before Corollary 4.18.

**Acceptance.**

- Use the actual relative ring-class extension and residue fields; no Faltings/Tate semisimplicity theorem or general open-image assumption substitutes for this argument.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-indefinite-cm-character-point"></a>

### Indefinite primitive-character Heegner nonvanishing

**Declaration:** `TauCeti.Heegner.Anticyclotomic.indefinite_cm_character_point`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/indefinite-cm-character-point`.

In CV §4, require (H1) an Eichler order at P in a split B_P, (H2) maximal split level at primes ramifying in K, a P-new nonzero ω-isotypic quotient α:J_H→A, and good CM points x of conductor P^n. For n sufficiently large and fixed admissible χ₀, some χ∈P(n,χ₀) has e_χα(x)≠0 in the Mordell–Weil space tensored with the character field. Weighted traces are non-torsion, not merely nonzero torsion points.

**Hypotheses.**

- CV(H1),(H2), P-new quotient and good CM point; χ₀ω=1 on A_F×.

**Prerequisites.** [HE.8/joint-cm-orbit-surjectivity](#he-8-joint-cm-orbit-surjectivity), [HE.8/cm-character-stratum](#he-8-cm-character-stratum), [HE.2/nonmaximal-level-distribution](#he-2-nonmaximal-level-distribution), `HilbertModularVarietiesAndShimuraCurves:R18.4`, [HE.8/relative-ring-class-tower-torsion-finite](#he-8-relative-ring-class-tower-torsion-finite).

**Proof / construction.**

1. Raise the P-level to P² and prove weighted degeneracy injectivity in the P-new quotient.
2. Use finite tower torsion and joint supersingular reductions to make the weighted trace avoid every torsion value.
3. Apply the primitive-character averaging identity, with Appendix6 conductor relations.

**Sources.** [HE.7s/cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Theorem 4.1; Theorem 4.10; Lemmas4.12–4.15 and Proposition 4.17.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-definite-cm-character-period"></a>

### Definite primitive-character toric nonvanishing

**Declaration:** `TauCeti.Heegner.Anticyclotomic.definite_cm_character_period`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/definite-cm-character-period`.

For the definite quaternion algebra and CV(H1),(H2), a nonzero P-new vector θ in the Jacquet–Langlands representation of a nonexceptional pair (π,K), and a good CM point x at large conductor, some χ∈P(n,χ₀) has Σ_(σ∈G(n))χ(σ)θ(σx)≠0. Nonexceptionality is π≇π⊗η_(K/F); it cannot be suppressed.

**Hypotheses.**

- Definite parity, CV(H1),(H2), nonexceptional π, P-new θ, admissible χ₀ and good CM points.

**Prerequisites.** [HE.8/joint-cm-orbit-surjectivity](#he-8-joint-cm-orbit-surjectivity), [HE.8/cm-character-stratum](#he-8-cm-character-stratum), [HE.2/nonmaximal-level-distribution](#he-2-nonmaximal-level-distribution), `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `HilbertModularVarietiesAndShimuraCurves:R18.3`, `HilbertModularVarietiesAndShimuraCurves:R18.4`.

**Proof / construction.**

1. Nonexceptionality makes the definite vector nonconstant on appropriate component fibres.
2. Use orbit surjectivity, then weighted ramified-prime degeneracy injectivity.
3. Project to exact-conductor characters using the P-new distribution relation.

**Sources.** [HE.7s/cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Proposition 5.6; Corollary 5.7; Proposition 5.8; Lemma 5.9; Theorem 5.10.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-definite-rankin-nonvanishing"></a>

### Cornut–Vatsal definite nonvanishing

**Declaration:** `TauCeti.Heegner.Anticyclotomic.definite_rankin_nonvanishing`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/definite-rankin-nonvanishing`.

With F,K,π,ω,P,N′,D as in cm-generic-root-number, |S| even and (π,K) nonexceptional, for every sufficiently large n there exists χ∈P(n,χ₀) with L(π,χ,1/2)≠0. This is existence within each fixed-torsion conductor stratum; it is not nonvanishing of all characters.

**Hypotheses.**



**Prerequisites.** [HE.8/definite-cm-character-period](#he-8-definite-cm-character-period), [HE.8/cm-generic-root-number](#he-8-cm-generic-root-number), `GrossZagierAndArithmeticHeights:GZ.5`.

**Proof / construction.**

1. Choose the source’s admissible quaternionic test vector and level.
2. Apply the definite geometric period theorem and imported Waldspurger identity, preserving local test factors.

**Sources.** [HE.7s/cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Theorem 1.4 and §5.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.
- The excluded exceptional pair π≃π⊗η is not an instance; fixed χ₀ and exact primitive conductor are retained.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8c-cornut-vatsal-nonvanishing-with-its-exact-hypotheses"></a>

### Cornut–Vatsal indefinite nonvanishing

**Declaration:** `TauCeti.Heegner.Anticyclotomic.cornut_vatsal_indefinite_nonvanishing`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8c/cornut-vatsal-nonvanishing-with-its-exact-hypotheses`.

Under the same initial CV data, assume |S| odd, ω=1, and N,D_(K/F),P pairwise coprime. For every sufficiently large n there exists χ∈P(n,χ₀) such that L′(π,χ,1/2)≠0. Use the geometric character-point theorem and the precise generalized Gross–Zagier identity. The definite branch has a separate node.

**Hypotheses.**

- ω=1; N,D,P pairwise coprime; |S| odd; χ₀ compatible with central character.

**Prerequisites.** [HE.8/indefinite-cm-character-point](#he-8-indefinite-cm-character-point), [HE.8/cm-generic-root-number](#he-8-cm-generic-root-number), `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`.

**Proof / construction.**

1. Apply the admissible indefinite geometry and non-torsion character projection.
2. Use positivity/nondegeneracy of the Néron–Tate height and the imported Gross–Zagier formula.

**Sources.** [HE.7s/cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Theorem 1.5 and §4.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.
- A character of previous conductor is excluded even if its derivative is nonzero; existence is in P(n,χ₀).

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

**Stable identity:** the HE.8c ID is retained for consumers; its mathematical parent and location are HE.8, as recorded in the reviewed packet.

<a id="he-8-cornut-tower-trace-nontorsion"></a>

### Cornut’s higher Heegner point theorem

**Declaration:** `TauCeti.Heegner.Anticyclotomic.cornut_tower_trace_nontorsion`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/cornut-tower-trace-nontorsion`.

In the classical modular Heegner setting with p∤N, the ring-class p-power tower contains a conductor for which the appropriate trace of the modular Heegner point to the anticyclotomic layer is non-torsion. Keep the finite torsion/trace quotient in Cornut’s statement. This does not require the Heegner point of conductor one to be non-torsion and does not say every trace is non-torsion.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.

**Prerequisites.** [HE.8/indefinite-cm-character-point](#he-8-indefinite-cm-character-point), [HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation](#he-1-heegner-points-of-conductor-m-and-the-modular-parametrisation).

**Proof / construction.**

1. Specialize the distribution/non-torsion argument to F=ℚ and the modular quotient.
2. Pass through the finite ring-class torsion trace as in Howard’s use of Cornut.

**Sources.** [HE.7s/cornut](https://webusers.imj-prg.fr/~christophe.cornut/papers/mcinv.pdf), Introduction main theorem; [HE.7s/howard](https://arxiv.org/pdf/1202.6340), Theorem 2.3.7, initial invocation of Cornut.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-lambda-bottom-class-nontorsion"></a>

### Non-torsion Λ-adic bottom class

**Declaration:** `TauCeti.Heegner.Anticyclotomic.lambda_bottom_class_nontorsion`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`.

For the actual ordinary Heegner family y∞ under E(K)[p]=0, Λy∞ is free of rank one and y∞ is not Λ-torsion. CGLS gives this nonzero family with the actual class-number conductor shifts. No completed main conjecture, full integral image or p∤h_K assumption is used for this assertion.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/anticyclotomic-heegner-class](#he-8-anticyclotomic-heegner-class), [HE.8/cornut-tower-trace-nontorsion](#he-8-cornut-tower-trace-nontorsion), `PadicMeasuresIwasawaAlgebras:L4`.

**Proof / construction.**

1. Use Cornut’s non-torsion trace and the recurrence comparison to make the inverse-limit module nonzero.
2. Use the CGLS class-number-shift adaptation and unit comparison to identify the nonzero normalized Λ-line.
3. For the weaker family use CGLS’s class-shift construction; do not import Howard’s clean divisibility beyond its scope.

**Sources.** [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1 and Remark 4.1.3.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-lambda-heegner-derivative-class"></a>

### Λ-adic Heegner derivative class

**Declaration:** `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass`. **Kind:** construction. **Stable node:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`.

For each squarefree allowed n, apply the imported derivative operator to Q[n] (or the normalized ordinary family), sum the finite ring-class torsion orbit, and descend its invariant Kummer class through the actual restriction isomorphism. Obtain κ^Λ_n in the generic Λ-adic Kolyvagin-system coefficient. Preserve the cyclic-Galois tensor and the finite/singular correction maps; the bottom is the specified Heegner Λ-line.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/universal-norm-heegner-family](#he-8-universal-norm-heegner-family), [HE.8/anticyclotomic-heegner-class](#he-8-anticyclotomic-heegner-class), [HE.4/kolyvagin-derivative-classes-and-descent-to-K](#he-4-kolyvagin-derivative-classes-and-descent-to-k), [HE.4/generator-tensor-choice-independence](#he-4-generator-tensor-choice-independence), `EulerSystemsAndKolyvaginSystems:ES.3`, `EulerSystemsAndKolyvaginSystems:ES.8`.

**Proof / construction.**

1. Reuse ES.3 derivatives and HE.4 choice-equivariant invariance.
2. Prove torsion invariants vanish under the stated tor/image hypotheses, then apply inflation–restriction.
3. Apply the imported continuous Iwasawa comparison; no algebraic discrete-cohomology replacement.

**Sources.** [HE.7s/howard](https://arxiv.org/pdf/1202.6340), §2.3, construction following Lemma 2.3.3; [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation.

**Uses determining the API.**

- Howard Lemmas2.3.4–2.3.6: localizes the actual derived classes
- BCGS Lemma 1.1.5: compares their finite specializations

**Planning API.**

- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_restrict` (projection): Restriction recovers the invariant differentiated Kummer class.
- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_generator` (compatibility): Changing a cyclic generator transforms the class together with the specified tensor factor.
- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_coefficients` (functoriality): Coefficient reduction commutes with the class when the quotient ideals are ordered correctly.
- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_bottom` (simp): At empty auxiliary support, use the actual universal-norm Heegner bottom class.

**Unit tests.**

- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_empty` (computation): The empty derivative acts as identity before the actual restriction inverse.
- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_zero` (degenerate): A zero point family gives zero derivative class.
- `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_restriction_obstruction` (non-example): A noninjective restriction map with two distinct preimages forbids unique descent; the tor hypothesis cannot be omitted.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-iwasawa-heegner-level-projection"></a>

### Under Iwasawa–Shapiro, level k equals the Kummer class of y_k

**Declaration:** `TauCeti.Heegner.Anticyclotomic.heegnerIwasawaClass_level`. **Kind:** lemma. **Stable node:** `HeegnerPointEulerSystems:HE.8/iwasawa-heegner-level-projection`.

Under Iwasawa–Shapiro, level k equals the Kummer class of y_k.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/anticyclotomic-heegner-class](#he-8-anticyclotomic-heegner-class).

**Proof / construction.**

1. Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Sources.** [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1 and Remark 4.1.3.

**Acceptance.**

- The map and its coefficient/tower/local-condition identifications are exactly those in the parent API; the signature is shared with that API item.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

**API promotion.** "HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class". Shared API declaration; no duplicate definition is required.

<a id="he-8-lambda-derivative-restriction"></a>

### Restriction recovers the invariant differentiated Kummer class

**Declaration:** `TauCeti.Heegner.Anticyclotomic.lambdaDerivativeClass_restrict`. **Kind:** lemma. **Stable node:** `HeegnerPointEulerSystems:HE.8/lambda-derivative-restriction`.

Restriction recovers the invariant differentiated Kummer class.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/lambda-heegner-derivative-class](#he-8-lambda-heegner-derivative-class).

**Proof / construction.**

1. Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Sources.** [HE.7s/howard](https://arxiv.org/pdf/1202.6340), §2.3, construction following Lemma 2.3.3; [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation.

**Acceptance.**

- The map and its coefficient/tower/local-condition identifications are exactly those in the parent API; the signature is shared with that API item.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

**API promotion.** "HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class". Shared API declaration; no duplicate definition is required.

<a id="he-8-lambda-heegner-local-conditions"></a>

### Λ-adic Heegner local conditions

**Declaration:** `TauCeti.Heegner.Anticyclotomic.lambda_heegner_local_conditions`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`.

The constructed derivative classes satisfy the transverse condition at ℓ|n, unramified condition away from pNn, and the prescribed propagated condition at bad primes. At v|p the image lies in the ordinary Fil⁺ condition. The proof treats finite decomposition at bad primes and finite ordinary-reduction torsion; it does not replace integral Kummer conditions by rational ones.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- Howard’s clean image hypothesis for the direct proof; weaker local verification uses the exact CGLS Theorem 4.1.1 adaptation.

**Prerequisites.** [HE.8/lambda-heegner-derivative-class](#he-8-lambda-heegner-derivative-class), [HE.5/heegner-transverse-local-condition](#he-5-heegner-transverse-local-condition), `SelmerIwasawaCohomology:L3/universal-norms-unramified`, `SelmerIwasawaCohomology:L2/greenberg-condition`, `ArithmeticGaloisDuality:R02.4`, [HE.8/iwasawa-heegner-level-projection](#he-8-iwasawa-heegner-level-projection), [HE.8/lambda-derivative-restriction](#he-8-lambda-derivative-restriction).

**Proof / construction.**

1. Use HE.5 transverse ramification.
2. At bad primes dualize corestriction of local H² and keep prime-to-p local degrees.
3. At p prove the reduction Tate module vanishes for universal norms, then use duality/Herbrand finiteness.

**Sources.** [HE.7s/howard](https://arxiv.org/pdf/1202.6340), Lemma 2.3.4; [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-lambda-finite-singular-relation"></a>

### Λ-adic finite/singular Heegner compatibility

**Declaration:** `TauCeti.Heegner.Anticyclotomic.lambda_finite_singular_relation`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation`.

The corrected Λ-adic derivative system satisfies the generic finite/singular comparison at each allowed ℓ. Its arithmetic reduction congruence and the local χ_ℓ identification must commute with localization through the actual Galois change-of-group action. A merely local matrix is not a global G_K-equivariant coefficient endomorphism.

**Hypotheses.**



**Prerequisites.** [HE.8/lambda-heegner-derivative-class](#he-8-lambda-heegner-derivative-class), [HE.8/lambda-heegner-local-conditions](#he-8-lambda-heegner-local-conditions), [HE.5/local-heegner-chi-automorphism](#he-5-local-heegner-chi-automorphism), [HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system](#he-5-finite-singular-comparison-and-the-corrected-kolyvagin-system), `EulerSystemsAndKolyvaginSystems:ES.3`, [HE.8/lambda-derivative-restriction](#he-8-lambda-derivative-restriction).

**Proof / construction.**

1. Pass the CM reduction congruence through the inverse limit.
2. Use the inherited global χ localization square; retain its unresolved supplier gap explicitly.
3. Construct the corrected system, rather than claiming the raw derivatives already satisfy stronger relations.

**Sources.** [HE.7s/howard](https://arxiv.org/pdf/1202.6340), Lemmas2.3.5–2.3.6; [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-howard-stabilization-unit-comparison"></a>

### Unit comparison of Heegner normalizations

**Declaration:** `TauCeti.Heegner.Anticyclotomic.howard_stabilization_unit_comparison`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison`.

Howard’s universal-norm bottom and the ordinary stabilized family generate the same Λ-line: the comparison factor is u_Kα_p²(β_p−1)² when p splits, and u_Kα_p²(β_p²−1) when p is inert. Since β_p∈pℤ_p and u_K is a p-unit in the allowed discriminants, the factor is a unit. This comparison does not make Φ a unit.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/initial-euler-factor](#he-8-initial-euler-factor), [HE.8/ordinary-stabilized-point](#he-8-ordinary-stabilized-point), [HE.8/universal-norm-heegner-family](#he-8-universal-norm-heegner-family), [HE.8/anticyclotomic-heegner-class](#he-8-anticyclotomic-heegner-class), `mathlib:PadicInt.isUnit_iff`.

**Proof / construction.**

1. Compute the two initial factors using X²−a_pX+p.
2. Check the β factors are units and retain u_K; compare Λ-spans.

**Sources.** [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Remark 4.1.3.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-lambda-adic-heegner-kolyvagin-system-and-theorem-b"></a>

### Howard’s anticyclotomic divisibility theorem

**Declaration:** `TauCeti.Heegner.Anticyclotomic.lambda_adic_heegner_kolyvagin_system_and_theorem_B`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B`.

Under Howard’s TheoremA hypotheses, p odd good ordinary, p∤h_K, p,N,D_K pairwise coprime and G_K→GL₂(ℤ_p) surjective, S=H¹_FΛ(K,T⊗Λ) is Λ-torsion-free of rank one, and its discrete dual X is pseudo-isomorphic to Λ⊕M⊕M for a finitely generated torsion Λ-module M with char(M)=char(M)^ι. Moreover char(M) divides char(S/H), H the actual Heegner Λ-line. Equality and integral primitivity are not conclusions.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- G_K→GL₂(ℤ_p) surjective; p∤h_K; p,D_K,N pairwise coprime.

**Prerequisites.** [HE.8/lambda-bottom-class-nontorsion](#he-8-lambda-bottom-class-nontorsion), [HE.8/lambda-finite-singular-relation](#he-8-lambda-finite-singular-relation), [HE.8/howard-stabilization-unit-comparison](#he-8-howard-stabilization-unit-comparison), `EulerSystemsAndKolyvaginSystems:ES.8`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `PadicMeasuresIwasawaAlgebras:L4`.

**Proof / construction.**

1. Verify H.0–H.5 and cartesian self-dual local conditions on height-one specializations.
2. Bound local/global control kernels uniformly as Q approaches a fixed P, including P=pΛ.
3. Use paired finite-DVR structure and the anticyclotomic functional equation to obtain the pseudo-isomorphism and one-sided bound.

**Sources.** [HE.7s/howard](https://arxiv.org/pdf/1202.6340), TheoremB; Proposition 2.1.3; Lemma 2.2.7–Theorem 2.2.10.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.
- On scalar principal ideals (p) and (p²), the one-sided index bound can be strict; do not replace it by equality.

**Planet:** Howard’s divisibility theorem.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-weak-torsion-localized-divisibility"></a>

### Weaker torsion hypothesis and localized bound

**Declaration:** `TauCeti.Heegner.Anticyclotomic.weak_torsion_localized_divisibility`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/weak-torsion-localized-divisibility`.

Under ordinary Heegner conditions and E(K)[p]=0, the CGLS Heegner family exists and the rank-one paired-torsion bound holds over Λ[1/p,1/(γ−1)]. The augmentation inversion can be removed under the source’s extra corank-one condition. The BCS/CGS error-controlled bounds supply stronger assertions in their stated branches; class-number retention alone does not do so.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/anticyclotomic-heegner-class](#he-8-anticyclotomic-heegner-class), [HE.8/lambda-bottom-class-nontorsion](#he-8-lambda-bottom-class-nontorsion), [HE.8/lambda-heegner-local-conditions](#he-8-lambda-heegner-local-conditions), `EulerSystemsAndKolyvaginSystems:ES.8`.

**Proof / construction.**

1. Repeat the construction with d(k) instead of k+1.
2. Import the weak residual error estimate with its exceptional primes; retain the localization exactly.

**Sources.** [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorems4.1.1–4.1.2.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-crystalline-near-trivial-character"></a>

### Crystalline characters near the identity

**Declaration:** `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter`. **Kind:** construction. **Stable node:** `HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character`.

Choose γ∈Γ, a p-adic unit u generating the prescribed subgroup, and h with γ^h equal to its Artin image. Let ξ_n(γ)=u^n have infinity type (hn,−hn). For m≥1 define α_m=ξ_(p−1)p^(m−1); these are nontrivial crystalline anticyclotomic characters congruent to1 modulo p^m and approach1. Retain h and the chosen embeddings. No finite-order character is substituted for these crystalline twists.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.

**Prerequisites.** `PadicMeasuresIwasawaAlgebras:L0a`, `PadicHodgeRegulators:L3`, [HE.0/norm-reciprocity-level-compatibility](#he-0-norm-reciprocity-level-compatibility), `mathlib:PadicInt`.

**Proof / construction.**

1. Use the continuous character supplier and global algebraic Hecke-character construction.
2. Apply the p-adic unit-power congruence to u; keep its h-dependent infinity type.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Definition 1.2.2.

**Uses determining the API.**

- BCGS Lemma 1.2.3 and Theorem 1.2.7: evaluates integral formulas at nontrivial crystalline characters approaching1
- CS §3.3: supplies a split-prime example only; the general unramified CS route imports continuous near-trivial characters independently from L0a

**Planning API.**

- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_apply` (projection): α_m(γ)=u^((p−1)p^(m−1)), with its chosen Artin/infinity-type h.
- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_succ` (relation): α_(m+1)=α_m^p for m≥1.
- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_congruent` (compatibility): α_m≡1 modulo p^m, by the unit-power congruence.
- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_nontrivial` (characterisation): For non-torsion u, α_m is nontrivial for every m≥1; its limit is1, which is not a member.

**Unit tests.**

- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_first` (computation): For p=5,m=1 the exponent is4, not1 or5.
- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_next` (computation): For p=5,m=2 the exponent is20, exactly five times the first exponent.
- `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_torsion_counterexample` (non-example): If the supplied character has order dividing p−1, α_1 is trivial; non-torsion and arithmetic construction hypotheses are essential.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-universal-norm-level-zero"></a>

### Q[n]_0=ΦP[n]

**Declaration:** `TauCeti.Heegner.Anticyclotomic.universalNormFamily_level_zero`. **Kind:** lemma. **Stable node:** `HeegnerPointEulerSystems:HE.8/universal-norm-level-zero`.

Q[n]_0=ΦP[n].

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/universal-norm-heegner-family](#he-8-universal-norm-heegner-family).

**Proof / construction.**

1. Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Sources.** [HE.7s/howard](https://arxiv.org/pdf/1202.6340), Lemmas2.3.2–2.3.3; [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation.

**Acceptance.**

- The map and its coefficient/tower/local-condition identifications are exactly those in the parent API; the signature is shared with that API item.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

**API promotion.** "HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family". Shared API declaration; no duplicate definition is required.

**Assembled interface:** the shared `universalNormFamily_level_zero` now uses the finite-lift/continuous-map data of its parent construction; it is not asserted for arbitrary lifts.

<a id="he-8-near-trivial-heegner-specialization"></a>

### Heegner specialization with the initial factor

**Declaration:** `TauCeti.Heegner.Anticyclotomic.near_trivial_heegner_specialization`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization`.

If α≡1 modulo p^m and M(n)≥m, then κ^Λ_n(α)≡C_pκ_n^Heeg modulo p^m. Here C_p=(α_p−1)²(β_p−1)² for split p and C_p=Φ=(p+1)²−a_p² for inert p, in the prescribed normalization. The reduction exists because I_n⊂p^mℤ_p. C_p can be a nonunit; at split p its valuation is twice v_p(#Ẽ(𝔽_p)).

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- α is an anticyclotomic twist sufficiently close to1; M(n)≥m.

**Prerequisites.** [HE.8/lambda-heegner-derivative-class](#he-8-lambda-heegner-derivative-class), [HE.8/howard-stabilization-unit-comparison](#he-8-howard-stabilization-unit-comparison), [HE.4/coefficient-and-prime-set-compatibility](#he-4-coefficient-and-prime-set-compatibility), [HE.8/universal-norm-level-zero](#he-8-universal-norm-level-zero), [HE.8/lambda-derivative-restriction](#he-8-lambda-derivative-restriction), `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof / construction.**

1. Project the universal-norm family to the initial level and compare HE.4 classes.
2. Use α≡1 and the quotient map allowed by M(n)≥m; compute augmentation of Φ.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Lemma 1.1.5 (split-prime branch); [HE.7s/cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Lemma 3.1.1 and equation (3.5), both unramified splitting types.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.
- For I_n=(p³), reduction modulo p is permitted; reversing the ideal condition loses this valid case.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-near-trivial-bottom-nonvanishing"></a>

### Nonzero bottom classes near the identity

**Declaration:** `TauCeti.Heegner.Anticyclotomic.near_trivial_bottom_nonvanishing`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`.

There is a neighbourhood of1 such that every nontrivial α in it has κ^Heeg_1(α)≠0. This follows from a non-Λ-torsion family and the finite zero set of a nonzero one-variable series. The specialization at α=1 is not included: its nonvanishing is equivalent to the appropriate analytic-rank-one condition.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/lambda-bottom-class-nontorsion](#he-8-lambda-bottom-class-nontorsion), `PadicMeasuresIwasawaAlgebras:L4`, [HE.8/iwasawa-heegner-level-projection](#he-8-iwasawa-heegner-level-projection), `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof / construction.**

1. Place the nonzero family in a finite free module after clearing its torsion-free denominators.
2. Use Weierstrass zero isolation and exclude1 explicitly.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.1.6.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-heegner-divisibility-profile"></a>

### Heegner divisibility profile

**Declaration:** `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile`. **Kind:** construction. **Stable node:** `HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile`.

For the actual finite Heegner derivative system define M_r=min_(ν(n)=r) ind(κ_n), with values in ℕ∪{∞}; ind is the largest allowed p-divisibility in the coefficient module, and ind(0)=∞. Set M∞=inf_r M_r. Prime restrictions, coefficient ideals I_n and p-optimal parametrization are part of the data. M_0 is the bottom Heegner index and need not equal M∞.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.4/heegner-coefficient-ideal](#he-4-heegner-coefficient-ideal), `EulerSystemsAndKolyvaginSystems:ES.4`, `mathlib:Submodule.span`.

**Proof / construction.**

1. Instantiate the generic ES.4 divisibility index in the actual coefficient quotients.
2. Take minima over the finite-support auxiliary set and the infimum over r; import rigidity before replacing the prime set.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Introduction definitions of M_r,M∞; §2.2.

**Uses determining the API.**

- BCGS TheoremB: measures the complete finite derivative system
- CS TheoremC: compares its infimum with Tamagawa valuation

**Planning API.**

- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_at` (projection): M_r is the infimum of the supplied actual indices at ν(n)=r.
- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_bottom` (simp): At r=0 the only conductor is1, so M₀=ind κ₁.
- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_top` (characterisation): M_r=∞ iff every permitted class at level r is zero, with empty strata giving∞.
- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_rescale` (compatibility): Common p^t-rescaling adds t to indices when coefficient depth allows it; truncation at the quotient depth is retained.

**Unit tests.**

- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_zero` (degenerate): The zero system has M_r=∞ for every r and M∞=∞.
- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_bottom_vs_infimum` (non-example): A system with indices3 at conductor1 and1 at one-prime support has M₀=3 and M∞≤1.
- `TauCeti.Heegner.Anticyclotomic.heegnerDivisibilityProfile_sum_not_max` (computation): For indices2 and5 in one stratum the minimum is2; neither their sum nor maximum is the divisibility index.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-optimal-lattice-isogeny-comparison"></a>

### Optimal and distinguished lattice comparison

**Declaration:** `TauCeti.Heegner.Anticyclotomic.optimal_lattice_isogeny_comparison`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/optimal-lattice-isogeny-comparison`.

For E₀ optimal on X₀(N), E₁ optimal on X₁(N), and the distinguished E_• with T_f identified integrally with T_pE_•, the prescribed isogeny E₀→E_• is étale at odd p. For sufficiently near-trivial α, I_•(α)C_•(α)=I₀(α)C₀(α), where I is the bottom-class index and C the finite-cokernel local index modulo torsion. Neither factor is individually asserted equal under arbitrary isogeny.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.

**Prerequisites.** [HE.8/anticyclotomic-heegner-class](#he-8-anticyclotomic-heegner-class), `KatoEulerSystems:L4`, `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`.

**Proof / construction.**

1. Use the modular-symbol lattice and étale isogeny to identify Fil⁺ lattices.
2. Track the global index of the isogeny and cancel it against the localization-cokernel index.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), §1.2.2 and Lemma 1.2.5; [HE.7s/wuthrich](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-19/12.pdf), Theorem 4, published p.385, proof pp.386–387.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-twisted-logarithm-index-formula"></a>

### Near-trivial logarithm index formula

**Declaration:** `TauCeti.Heegner.Anticyclotomic.twisted_logarithm_index_formula`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/twisted-logarithm-index-formula`.

With E_• and α sufficiently close to1, L_BDP(α⁻¹)≠0 and κ_1^•(α)≠0, let t_α=length_(ℤ_p^ur)(ℤ_p^ur/L_BDP(α⁻¹)), q_•=#H⁰(ℚ_p,E_•[p∞]), I_•=#(S_α/ℤ_pκ_1^•(α)), and C_•=#coker(loc_v) modulo torsion. Then p^tα q_•=I_•C_•. Use the source’s coefficient extension and square-root BDP normalization.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.

**Prerequisites.** [HE.8/near-trivial-bottom-nonvanishing](#he-8-near-trivial-bottom-nonvanishing), [HE.8/optimal-lattice-isogeny-comparison](#he-8-optimal-lattice-isogeny-comparison), `GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`, `PadicHodgeRegulators:L3`, `SelmerIwasawaCohomology:L3/semilocal-cohomology`.

**Proof / construction.**

1. Apply the family explicit reciprocity law with its integral regulator cokernel.
2. Use local duality to compute the H²/H⁰ correction and quotient the localization torsion.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Lemma 1.2.3.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-near-trivial-character-congruence"></a>

### α_m≡1 modulo p^m, by the unit-power congruence

**Declaration:** `TauCeti.Heegner.Anticyclotomic.nearTrivialCharacter_congruent`. **Kind:** lemma. **Stable node:** `HeegnerPointEulerSystems:HE.8/near-trivial-character-congruence`.

α_m≡1 modulo p^m, by the unit-power congruence.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.

**Prerequisites.** [HE.8/crystalline-near-trivial-character](#he-8-crystalline-near-trivial-character).

**Proof / construction.**

1. Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Definition 1.2.2.

**Acceptance.**

- The map and its coefficient/tower/local-condition identifications are exactly those in the parent API; the signature is shared with that API item.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

**API promotion.** "HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character". Shared API declaration; no duplicate definition is required.

<a id="he-8-twisted-anticyclotomic-control"></a>

### Twisted anticyclotomic control formula

**Declaration:** `TauCeti.Heegner.Anticyclotomic.twisted_anticyclotomic_control`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/twisted-anticyclotomic-control`.

For m≫0 and α=α_m, a characteristic generator F_E of the strict-at-v, unrestricted-at-v̄ Greenberg dual satisfies #(ℤ_p/F_E(α⁻¹))=#Sha(W_α⁻¹/K)·C_α²·∏_(w|N)c_w^(p)(α⁻¹)·q_E². The finite Sha is the source’s propagated Selmer quotient. The formula is integral and uses all K-primes over N and the finite/torsion local cokernel.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.

**Prerequisites.** [HE.8/crystalline-near-trivial-character](#he-8-crystalline-near-trivial-character), [HE.8/near-trivial-bottom-nonvanishing](#he-8-near-trivial-bottom-nonvanishing), `SelmerIwasawaCohomology:L3/iwasawa-descent`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, [HE.8/near-trivial-character-congruence](#he-8-near-trivial-character-congruence).

**Proof / construction.**

1. Request the exact generic specialization theorem and identify each arithmetic term.
2. Check near-trivial nonzero Euler factors and finite local/global kernels; account for both primes above each split bad prime.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.2.7 (JSW control theorem as used there).

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-near-trivial-tamagawa-stability"></a>

### Tamagawa factors near the identity

**Declaration:** `TauCeti.Heegner.Anticyclotomic.near_trivial_tamagawa_stability`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability`.

For α≡1 modulo p^m the twisted local Tamagawa p-factor c_w^(p)(α) is congruent to the untwisted c_w^(p) modulo p^m. For m greater than the total relevant valuations this gives equality of the product of p-parts. Keep w|N over K; under the Heegner hypothesis its untwisted product is the square of the rational Tamagawa p-part.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.3/bad-place-component-obstruction](#he-3-bad-place-component-obstruction), `NeronModelsAndSemistableAbelianVarieties:R11.2`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof / construction.**

1. Use the unramified-twist local determinant calculation.
2. Choose m above every valuation, then compare the p-parts and the two split K-places.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Lemma 1.2.8.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-arithmetic-rescaled-kolyvagin-bound"></a>

### Uniform arithmetic Kolyvagin error bound

**Declaration:** `TauCeti.Heegner.Anticyclotomic.arithmetic_rescaled_kolyvagin_bound`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/arithmetic-rescaled-kolyvagin-bound`.

There exist M and E depending only on T_pE such that, for α≡1 modulo p^m with m≥M and a permitted deep-prime Kolyvagin system κ̃ for T_α with κ̃₁≠0, the dual Selmer group is ℚ_p/ℤ_p⊕M_α⊕M_α and length M_α≤ind(κ̃₁)+E. The constant does not grow with m, the deep-prime set or common p-rescaling. Under the source’s surjectivity hypothesis E=0.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/lambda-heegner-local-conditions](#he-8-lambda-heegner-local-conditions), [HE.8/lambda-finite-singular-relation](#he-8-lambda-finite-singular-relation), `EulerSystemsAndKolyvaginSystems:ES.4`, [HE.7/integral-tate-image-errors](#he-7-integral-tate-image-errors), [HE.8/near-trivial-character-congruence](#he-8-near-trivial-character-congruence).

**Proof / construction.**

1. Import generic error-tolerant descent from ES.4.
2. Verify the actual Tate representation/dual local conditions and uniform image/evaluation constants.
3. Check rescaled Heegner classes retain every transverse and finite/singular relation.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.3.1 and its cited CGS proof.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-heegner-exact-sha-length"></a>

### Exact paired Selmer length for a Heegner system

**Declaration:** `TauCeti.Heegner.Anticyclotomic.heegner_exact_sha_length`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/heegner-exact-sha-length`.

For p>3, a surjective residual representation and the generic self-dual rank-one hypotheses, the specialized actual anticyclotomic Heegner system over a finite DVR R with κ₁≠0 gives length_R Sha(W_α/K)=2(M₀(α)−M∞(α)). No near-triviality is needed in the generic theorem; near-trivial α is used in the arithmetic application. The deep-prime restriction and rigidity hypotheses remain explicit. BCGS states Theorem 2.2.2 for p≥3 through Proposition 2.2.1, but its proof invokes Lemma 2.2.4, stated only for p>3. The p=3 proof extension remains a source gap.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- Residual G_Q representation surjective; R finite DVR; the source’s self-dual/cartesian hypotheses and κ₁≠0. p>3 for the verified proof route.

**Prerequisites.** [HE.8/heegner-divisibility-profile](#he-8-heegner-divisibility-profile), [HE.8/lambda-heegner-derivative-class](#he-8-lambda-heegner-derivative-class), [HE.8/lambda-heegner-local-conditions](#he-8-lambda-heegner-local-conditions), [HE.8/lambda-finite-singular-relation](#he-8-lambda-finite-singular-relation), `EulerSystemsAndKolyvaginSystems:ES.4`.

**Proof / construction.**

1. Import generic prime-restriction rigidity and uniform stub structure from ES.4.
2. Identify Heegner coefficient reductions and indices, then apply the exact paired-length formula.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Proposition 2.2.1; Theorem 2.2.2; Lemma 2.2.4.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-integral-main-conjecture-index-square"></a>

### Integral main conjecture and twisted index square

**Declaration:** `TauCeti.Heegner.Anticyclotomic.integral_main_conjecture_index_square`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/integral-main-conjecture-index-square`.

Assume the integral anticyclotomic Greenberg main conjecture in Λ^ur with the BCGS square-root convention. For α_m sufficiently close to1, the p-optimal curve satisfies I₀(α)²=#Sha(W_α⁻¹/K)·∏_(w|N)c_w^(p)(α⁻¹)·q₀⁴. A rational main conjecture supplies only a bounded p-power error; it does not supply this exact equality.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.
- Integral anticyclotomic Greenberg main conjecture and the p-optimal lattice.

**Prerequisites.** [HE.8/twisted-logarithm-index-formula](#he-8-twisted-logarithm-index-formula), [HE.8/twisted-anticyclotomic-control](#he-8-twisted-anticyclotomic-control), [HE.8/near-trivial-tamagawa-stability](#he-8-near-trivial-tamagawa-stability), [HE.8/optimal-lattice-isogeny-comparison](#he-8-optimal-lattice-isogeny-comparison), `ModularIwasawaMainConjectures:L0`.

**Proof / construction.**

1. Evaluate the integral characteristic ideal identity.
2. Substitute the logarithm and control equations, square the former, and cancel the nonzero local cokernel index.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Corollary 1.2.12; Remark 1.2.11.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-bcgs-conditional-kolyvagin-nonvanishing"></a>

### BCGS nonvanishing from the main conjecture

**Declaration:** `TauCeti.Heegner.Anticyclotomic.bcgs_conditional_kolyvagin_nonvanishing`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/bcgs-conditional-kolyvagin-nonvanishing`.

Under (Heeg),(disc),(tor), p odd good ordinary and split in K, the rational anticyclotomic main conjecture (indeed its required lower divisibility after inverting p) implies κ_n^Heeg≠0 for some squarefree n of allowed Kolyvagin primes. No analytic-rank-one hypothesis is made and κ₁ may vanish.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.
- Rational anticyclotomic main conjecture, kept as a theorem hypothesis.

**Prerequisites.** [HE.8/near-trivial-heegner-specialization](#he-8-near-trivial-heegner-specialization), [HE.8/near-trivial-bottom-nonvanishing](#he-8-near-trivial-bottom-nonvanishing), [HE.8/twisted-logarithm-index-formula](#he-8-twisted-logarithm-index-formula), [HE.8/twisted-anticyclotomic-control](#he-8-twisted-anticyclotomic-control), [HE.8/near-trivial-tamagawa-stability](#he-8-near-trivial-tamagawa-stability), [HE.8/arithmetic-rescaled-kolyvagin-bound](#he-8-arithmetic-rescaled-kolyvagin-bound), [HE.8/heegner-divisibility-profile](#he-8-heegner-divisibility-profile).

**Proof / construction.**

1. Assume all finite derivative classes vanish. Choose m deep enough and rescale specialized classes by p^(t+v_p(C_p)).
2. Apply the uniform error bound to the rescaled system.
3. Compare with logarithm/control and the rational main-conjecture p-error; choose t exceeding half the Tamagawa length plus all fixed errors to contradict the bounds.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), TheoremA and §2.1.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.
- The conclusion permits κ₁=0 and a class κ_n≠0 with n≠1. All-class nonvanishing and analytic-rank-one assumptions are forbidden.

**Planet:** BCGS nonvanishing theorem.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-bcgs-conditional-refined-divisibility"></a>

### BCGS refined divisibility from the integral conjecture

**Declaration:** `TauCeti.Heegner.Anticyclotomic.bcgs_conditional_refined_divisibility`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/bcgs-conditional-refined-divisibility`.

Assume p>3, surjective residual G_Q→GL₂(𝔽_p), good ordinary p split in K, (Heeg),(disc),(tor), a p-optimal parametrization, and the integral anticyclotomic main conjecture. Then M∞ of the finite Heegner system is finite and equals Σ_(ℓ|N)v_p(c_ℓ(E/ℚ)). This is half the sum over K-primes; it is neither M₀ nor the order of Sha.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.
- p>3; residual surjectivity; p-optimal parametrization; integral main conjecture.

**Prerequisites.** [HE.8/bcgs-conditional-kolyvagin-nonvanishing](#he-8-bcgs-conditional-kolyvagin-nonvanishing), [HE.8/integral-main-conjecture-index-square](#he-8-integral-main-conjecture-index-square), [HE.8/heegner-exact-sha-length](#he-8-heegner-exact-sha-length), [HE.8/near-trivial-heegner-specialization](#he-8-near-trivial-heegner-specialization), [HE.8/near-trivial-tamagawa-stability](#he-8-near-trivial-tamagawa-stability), [HE.8/heegner-divisibility-profile](#he-8-heegner-divisibility-profile).

**Proof / construction.**

1. Use integral index square and exact paired Sha length to compute M∞(α)=half the K-Tamagawa length+v_p(C_p).
2. Apply specialization congruence and deep-prime rigidity to strip the initial factor and recover the untwisted finite-system index.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), TheoremB and §2.2.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.
- With each rational bad prime split in K, its two K-place valuations contribute twice the rational Tamagawa valuation; the stated M∞ is the rational sum.

**Planet:** Refined Kolyvagin divisibility theorem.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-strict-ordinary-selmer-complex"></a>

### Arithmetic strict ordinary Selmer complex comparison

**Declaration:** `TauCeti.Heegner.Anticyclotomic.strict_ordinary_selmer_complex`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/strict-ordinary-selmer-complex`.

For CS coefficients X=T⊗Λ and twists T_α, instantiate the imported Selmer complex as the cone of global cochains mapping to ⊕_(v|p)RΓ(K_v,X/X_v⁺) and ⊕_(v|N)Cone(RΓ_ur→RΓ). Its H¹ is the strict ordinary Selmer lattice S; its H² is related by Poitou–Tate to the all-p ordinary discrete dual X_Gr(A). This rank-one dual is distinct from BCS’s torsion (0,empty) Greenberg module.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p unramified in K.

**Prerequisites.** [HE.8/anticyclotomic-heegner-class](#he-8-anticyclotomic-heegner-class), `SelmerIwasawaCohomology:L3/iwasawa-descent`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `ArithmeticGaloisDuality:D7`, `ModularIwasawaMainConjectures:L0`.

**Proof / construction.**

1. Use the generic cone/local-condition complex rather than defining a new derived category.
2. Identify strict local conditions with the source’s ordinary cohomology and prove perfectness/base change at the exact coefficients.
3. Use Poitou–Tate to identify H² and finite local correction groups.

**Sources.** [HE.7s/cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), §3.2, equations (3.6)–(3.8), Theorem 3.2.1.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-determinantal-heegner-element"></a>

### Determinantal Heegner element

**Declaration:** `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement`. **Kind:** construction. **Stable node:** `HeegnerPointEulerSystems:HE.8/determinantal-heegner-element`.

Under the source’s rank-one and perfectness assumptions, use the canonical rational isomorphism Q(Λ)⊗det_Λ⁻¹ RΓ̃_f(K,T⊗Λ) ≃ Q(Λ)⊗(S⊗_Λ S^ι). Define z̃∞ as the inverse image of y∞⊗y∞ under this isomorphism. The main conjecture asserts z̃∞ generates the integral determinant lattice, not merely its rationalization.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p unramified in K; the source’s rational determinant comparison.

**Prerequisites.** [HE.8/strict-ordinary-selmer-complex](#he-8-strict-ordinary-selmer-complex), [HE.8/lambda-bottom-class-nontorsion](#he-8-lambda-bottom-class-nontorsion), `ModularIwasawaMainConjectures:L0`, `PadicMeasuresIwasawaAlgebras:L5`.

**Proof / construction.**

1. Apply the supplier determinant functor to the perfect Selmer complex.
2. Identify the rank-one rational factors by duality; pull back the actual Heegner tensor.

**Sources.** [HE.7s/cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Conjecture 3.2.2 and preceding determinant isomorphism.

**Uses determining the API.**

- CS Proposition 3.2.3: tests basis of the integral determinant lattice
- CS Proposition 3.3.2: transports the element to a twisted Selmer tensor

**Planning API.**

- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_image` (projection): The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted.
- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_unique` (characterisation): It is the unique rational determinant preimage of that Heegner tensor.
- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_rescale` (functoriality): Rescaling y∞ by a multiplies z̃∞ by a·ι(a), not merely a.
- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_baseChange` (compatibility): Compatible derived base change and determinant comparison carry z̃∞ to the tensor of the specialized bottom classes.

**Unit tests.**

- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_zero` (degenerate): The zero Heegner class gives the zero determinant element.
- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_scalar_square` (computation): With identity involution and y rescaled by p, the element scales by p².
- `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_rational_not_basis` (non-example): Under the identity tensor comparison over ℤ, the Heegner determinant for (5,1) has coefficient 5 under ℤ⊗ℤ≃ℤ: nonzero after rationalization and a nonunit integrally. This tests the construction rather than an unrelated integer and catches an erroneous normalization to a basis.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-determinantal-heegner-image"></a>

### The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted

**Declaration:** `TauCeti.Heegner.Anticyclotomic.determinantalHeegnerElement_image`. **Kind:** lemma. **Stable node:** `HeegnerPointEulerSystems:HE.8/determinantal-heegner-image`.

The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p unramified in K; the source’s rational determinant comparison.

**Prerequisites.** [HE.8/determinantal-heegner-element](#he-8-determinantal-heegner-element).

**Proof / construction.**

1. Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Sources.** [HE.7s/cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Conjecture 3.2.2 and preceding determinant isomorphism.

**Acceptance.**

- The map and its coefficient/tower/local-condition identifications are exactly those in the parent API; the signature is shared with that API item.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

**API promotion.** "HeegnerPointEulerSystems:HE.8/determinantal-heegner-element". Shared API declaration; no duplicate definition is required.

<a id="he-8-determinant-characteristic-ideal-comparison"></a>

### Heegner determinant and characteristic ideals

**Declaration:** `TauCeti.Heegner.Anticyclotomic.determinant_characteristic_ideal_comparison`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/determinant-characteristic-ideal-comparison`.

The assertion that z̃∞ is an integral determinant basis is equivalent to char_Λ(S/Λy∞)·char_Λ(S/Λy∞)^ι=char_Λ(X_Gr(A)_tors) for the CS all-p ordinary dual. Writing a square requires the source’s ι-invariance; rational equality cannot certify an integral basis.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.

**Prerequisites.** [HE.8/determinantal-heegner-element](#he-8-determinantal-heegner-element), [HE.8/strict-ordinary-selmer-complex](#he-8-strict-ordinary-selmer-complex), `PadicMeasuresIwasawaAlgebras:L4`, `PadicMeasuresIwasawaAlgebras:L5`, [HE.8/determinantal-heegner-image](#he-8-determinantal-heegner-image).

**Proof / construction.**

1. Compute determinants of torsion cohomology and the free rank-one factors.
2. Track ι on the second factor and compare lattices at every height-one prime.

**Sources.** [HE.7s/cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Proposition 3.2.3.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.
- A nonzero p-multiple of a determinant basis is a rational basis but not an integral basis.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-ordinary-local-specialization-defect"></a>

### Ordinary local specialization defect

**Declaration:** `TauCeti.Heegner.Anticyclotomic.ordinary_local_specialization_defect`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/ordinary-local-specialization-defect`.

For near-trivial nontrivial α, the local finite/ordinary comparison at v|p contributes the p-part of #Ẽ(𝔽_v), identified with the corresponding H⁰(K_v,A_v⁻(α±)). Set L_p=∏_(v|p)#Ẽ(𝔽_v). For split p v_p(Φ)=v_p(L_p)=2v_p(#Ẽ(𝔽_p)); for inert p use #Ẽ(𝔽_(p²))=(p+1)²−a_p². Retain both signs of the twist.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p unramified in K; α sufficiently near1.

**Prerequisites.** [HE.8/initial-euler-factor](#he-8-initial-euler-factor), `ArithmeticGaloisDuality:R02.4`, `NeronModelsAndSemistableAbelianVarieties:R11.5`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof / construction.**

1. Use local duality on the ordinary exact sequence.
2. Stabilize Frobenius eigenvalues near1 and calculate the reduction cardinalities.

**Sources.** [HE.7s/cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Lemma 3.3.3 and proof of TheoremC.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-determinant-specialization-lattice"></a>

### Specialized Heegner determinant lattice

**Declaration:** `TauCeti.Heegner.Anticyclotomic.determinant_specialization_lattice`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/determinant-specialization-lattice`.

For a continuous α:Γ→ℤ_p× with α≡1 modulo p^m, m≫0 and κ₁,Λ^Heeg(α)≠0, the source proves that both S_(α±1) are free of rank one. Then the specialized rational determinant map to S_α⊗S_α⁻¹ sends the integral determinant lattice, up to a ℤ_p-unit, to L_p²·Tam_E²·#X_BK(T_α*/K) times that tensor lattice. Here X_BK is the finite quotient of the propagated Selmer group in CS; for a general twist it need not be the Bloch–Kato group. Tam_E=∏_(ℓ|N)c_ℓ over ℚ.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p unramified in K; α continuous with α≡1 modulo p^m; κ₁,Λ^Heeg(α)≠0; m sufficiently large.

**Prerequisites.** [HE.8/strict-ordinary-selmer-complex](#he-8-strict-ordinary-selmer-complex), [HE.8/determinantal-heegner-element](#he-8-determinantal-heegner-element), [HE.8/ordinary-local-specialization-defect](#he-8-ordinary-local-specialization-defect), [HE.8/near-trivial-tamagawa-stability](#he-8-near-trivial-tamagawa-stability), `SelmerIwasawaCohomology:L3/iwasawa-descent`, `ArithmeticGaloisDuality:R02.4`, `PadicMeasuresIwasawaAlgebras:L5`, [HE.8/determinantal-heegner-image](#he-8-determinantal-heegner-image), `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof / construction.**

1. Compare strict and finite local-condition complexes through their exact triangles.
2. Use H¹ freeness, the dual H² description and the finite quotient by divisibility.
3. Compute local H⁰ and bad-prime terms, retaining the squared rational Tamagawa product.

**Sources.** [HE.7s/cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Proposition 3.3.2.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-determinantal-twisted-index-square"></a>

### Twisted index square from the determinant conjecture

**Declaration:** `TauCeti.Heegner.Anticyclotomic.determinantal_twisted_index_square`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/determinantal-twisted-index-square`.

If z̃∞ generates the integral Selmer determinant and α is sufficiently close to1 but nontrivial, then the square of the Heegner bottom index equals L_p² Tam_E² #X_BK(T_α*/K), up to a ℤ_p-unit (equivalently as p-valuations). The transported Φ comparison and unit normalization remain explicit.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- Integral determinantal main conjecture; p unramified in K.

**Prerequisites.** [HE.8/determinant-specialization-lattice](#he-8-determinant-specialization-lattice), [HE.8/determinantal-heegner-element](#he-8-determinantal-heegner-element), [HE.8/near-trivial-bottom-nonvanishing](#he-8-near-trivial-bottom-nonvanishing), [HE.8/near-trivial-heegner-specialization](#he-8-near-trivial-heegner-specialization).

**Proof / construction.**

1. Base change the integral determinant basis.
2. Use the specialization lattice formula and identify the two Heegner tensor factors under anticyclotomic duality.

**Sources.** [HE.7s/cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Corollary 3.3.4.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8-castella-sano-refined-equivalence"></a>

### Castella–Sano refined conjecture equivalence

**Declaration:** `TauCeti.Heegner.Anticyclotomic.castella_sano_refined_equivalence`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8/castella-sano-refined-equivalence`.

For p>3, residual G_Q surjectivity, good ordinary p unramified in K, (Heeg),(disc), and a parametrization whose Manin constant is prime to p, M∞=v_p(Tam_E) holds if and only if the integral determinantal Heegner main conjecture of CS3.2.2 holds. The theorem permits inert p; it does not prove that conjecture at inert p.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p>3; residual G_Q surjectivity; p unramified in K; p∤Manin constant.

**Prerequisites.** [HE.8/determinantal-twisted-index-square](#he-8-determinantal-twisted-index-square), [HE.8/determinant-characteristic-ideal-comparison](#he-8-determinant-characteristic-ideal-comparison), [HE.8/heegner-exact-sha-length](#he-8-heegner-exact-sha-length), [HE.8/near-trivial-heegner-specialization](#he-8-near-trivial-heegner-specialization), [HE.8/ordinary-local-specialization-defect](#he-8-ordinary-local-specialization-defect), [HE.8/arithmetic-rescaled-kolyvagin-bound](#he-8-arithmetic-rescaled-kolyvagin-bound), [HE.8/heegner-divisibility-profile](#he-8-heegner-divisibility-profile), `PadicMeasuresIwasawaAlgebras:L4`.

**Proof / construction.**

1. Forward from the main conjecture: compute specialized index and exact Selmer length, then remove v_p(Φ)=v_p(L_p) using rigidity.
2. Reverse: use the Euler-system upper bound to locate z̃∞ integrally, compare sufficiently near-trivial specializations, and apply the exact SU3.2 separation criterion to show its lattice quotient is a unit.

**Sources.** [HE.7s/cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), TheoremC; §3.3 proof.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.
- At inert p, supplying only geometric nonvanishing leaves the determinant conjecture hypothesis; no unconditional refined equality follows.

**Planet:** Castella–Sano equivalence theorem.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8b"></a>

## HE.8b: Split anticyclotomic main-conjecture proofs

Compare formulations at the exact rational or integral scope. The shared early two-variable/Wan/Fujiwara input and the individual opposite Euler-system bounds permit nonzero-factor cancellation on the verified branch. BCS p>3 irreducible and surjective results and the independently supplied CGS Eisenstein result remain separate. Only these results discharge the conditional split-prime refinements; this chain supplies no inert main-conjecture equality.

<a id="he-8b-bdp-function-convention-comparison"></a>

### BDP square-root convention comparison

**Declaration:** `TauCeti.Heegner.Anticyclotomic.bdp_function_convention_comparison`. **Kind:** comparison. **Stable node:** `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`.

After the same coefficient extension and primitive/imprimitive local normalizations, BCS’s single-power anticyclotomic L-function generates the same ideal as (L_BDP^BCGS)² in Λ^ur. Period/unit conventions are compared as ideals, not by arbitrary exact equality of functions. All nonunit Euler factors in changes of local condition remain visible.

**Hypotheses.**



**Prerequisites.** `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`, `GrossZagierAndArithmeticHeights:GZ.9/imprimitive-function-dictionary`, `AutomorphicPadicLFunctions:L3h`.

**Proof / construction.**

1. Import the BDP construction and coefficient convention from GZ.9.
2. Align both source conventions and their Euler factors before comparing generated ideals.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.2.1 and Conjecture 1.2.10; [HE.7s/bcs](https://arxiv.org/pdf/2405.00270v2), Conjecture 1.2.1, following Remark 1.2.3, and Theorem 1.2.4.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8b-anticyclotomic-formulation-comparison"></a>

### Anticyclotomic main-conjecture comparison

**Declaration:** `TauCeti.Heegner.Anticyclotomic.anticyclotomic_formulation_comparison`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`.

In the classical N⁻=1 split ordinary setting with p>3 and H⁰(G_K,E[p])=0, the integral Heegner-index divisibility char(X_tors) ⊃ char(S/Λy∞)² is equivalent to the corresponding Greenberg/BDP divisibility char(X_(0,empty))Λ^ur ⊃ (L_BDP²), with the reverse divisibilities also equivalent (BCK Theorem 5.2). Retain the coefficient extension, finite local cokernels, ι and nonunit Euler factors. This comparison does not itself prove either divisibility. Separately, CGLS Proposition 4.2.1 proves the analogous comparison after inverting p under E(K)[p]=0 for odd p. The general weak-torsion p=3 integral extension is not certified; an exact integral comparison must be supplied before using that extension.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.
- For the integral statement p>3; for the rational CGLS variant p is odd and both characteristic ideals are extended to Λ⊗ℚ_p.

**Prerequisites.** [HE.8/anticyclotomic-heegner-class](#he-8-anticyclotomic-heegner-class), [HE.8/lambda-heegner-local-conditions](#he-8-lambda-heegner-local-conditions), [HE.8/twisted-logarithm-index-formula](#he-8-twisted-logarithm-index-formula), [HE.8b/bdp-function-convention-comparison](#he-8b-bdp-function-convention-comparison), `SelmerIwasawaCohomology:L2/change-of-conditions`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `PadicHodgeRegulators:L3`, `ModularIwasawaMainConjectures:L0`.

**Proof / construction.**

1. Instantiate the supplier’s four-term Poitou–Tate comparison and explicit reciprocity.
2. Identify the primitive anticyclotomic Heegner and Greenberg terms and clear only the stated units.

**Sources.** [HE.7s/cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Proposition 4.2.1 (rational comparison); [HE.7s/bck](https://web.math.ucsb.edu/~castella/PRconj-print.pdf), Theorem 5.2 and proof, published pp.1646–1647; standing p>3 and §5 split-prime hypotheses.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8b-auxiliary-quadratic-field-verification"></a>

### Auxiliary quadratic fields for BCS descent

**Declaration:** `TauCeti.Heegner.Anticyclotomic.auxiliary_quadratic_field_verification`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8b/auxiliary-quadratic-field-verification`.

For the BCS irreducible branch, choose the auxiliary real quadratic F with p inert, D_F odd and every D_F-prime split in K; for ℓ|N choose ℓ inert in F when ℓ≡−1 modulo p and split otherwise. Retain irreducibility after restricting to G_(FK) and G_(F(ζ_p)), the p=5 exceptional real field exclusion and finite discriminant avoidance. These are the precise hypotheses used by the Hilbert/quartic-CM supplier.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.
- p>3; E[p] irreducible over G_Q; the source’s auxiliary-field and Fujiwara(H1)–(H3) assumptions.

**Prerequisites.** `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `AutomorphicCongruences:L5w`.

**Proof / construction.**

1. Use simultaneous splitting and finite-avoidance Chebotarev.
2. Check the residual dihedral possibilities and restriction conditions before invoking Wan/Fujiwara.
3. Verify every source condition, including the discarded p=5 field.

**Sources.** [HE.7s/bcs](https://arxiv.org/pdf/2405.00270v2), Proposition 5.2.1; Lemma 5.2.3.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8b-anticyclotomic-euler-system-divisibility"></a>

### Heegner Euler-system divisibility for BCS

**Declaration:** `TauCeti.Heegner.Anticyclotomic.anticyclotomic_euler_system_divisibility`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-euler-system-divisibility`.

Under p odd ordinary, (Heeg),(disc) and E[p] irreducible over G_K, the actual Heegner family gives rank one and char(X_tors) ⊃ char(S/Λy∞)² after inverting p. In the split case the equivalent Greenberg/BDP bound holds. Under residual G_Q surjectivity the bounds are integral. This is the weak-hypothesis CGS/BCS bound, not Howard B with its hypotheses silently removed.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E[p] irreducible over G_K; integral branch additionally has G_Q residual surjectivity.

**Prerequisites.** [HE.8/anticyclotomic-heegner-class](#he-8-anticyclotomic-heegner-class), [HE.8/lambda-bottom-class-nontorsion](#he-8-lambda-bottom-class-nontorsion), [HE.8/lambda-finite-singular-relation](#he-8-lambda-finite-singular-relation), [HE.8/arithmetic-rescaled-kolyvagin-bound](#he-8-arithmetic-rescaled-kolyvagin-bound), `EulerSystemsAndKolyvaginSystems:ES.8`, [HE.8b/anticyclotomic-formulation-comparison](#he-8b-anticyclotomic-formulation-comparison).

**Proof / construction.**

1. Use the exact weaker residual arithmetic hypotheses and imported Λ-adic error bound.
2. Pass paired torsion structure through the normalized Heegner line and formulate the matching Greenberg bound.

**Sources.** [HE.7s/bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 4.2.1 (using CGS Theorem 5.5.2).

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8b-anticyclotomic-reverse-product-divisibility"></a>

### BCS anticyclotomic reverse divisibility

**Declaration:** `TauCeti.Heegner.Anticyclotomic.anticyclotomic_reverse_product_divisibility`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-reverse-product-divisibility`.

For the chosen auxiliary F, the imported Wan/Fujiwara quartic-CM theorem, shared two-variable restriction/factorization, and anticyclotomic projection imply the reverse product divisibility for E/K and E^F/K against their BDP functions. Specialize the Greenberg local conditions exactly as in BCS §5, and obtain individual reverse divisibilities by combining the opposite Euler-system bounds and cancelling nonzero factors. Integral cancellation uses μ=0 and the source’s period/regulator hypotheses.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.
- p>3; irreducible residual G_Q representation; all auxiliary-field and period hypotheses of the suppliers.

**Prerequisites.** [HE.8b/auxiliary-quadratic-field-verification](#he-8b-auxiliary-quadratic-field-verification), [HE.8b/anticyclotomic-euler-system-divisibility](#he-8b-anticyclotomic-euler-system-divisibility), [HE.8b/anticyclotomic-formulation-comparison](#he-8b-anticyclotomic-formulation-comparison), [HE.8b/bdp-function-convention-comparison](#he-8b-bdp-function-convention-comparison), `AutomorphicCongruences:L5a`, `AutomorphicCongruences:L5w`, `AutomorphicPadicLFunctions:L3h`, `PadicMeasuresIwasawaAlgebras:L4`.

**Proof / construction.**

1. Import the two-variable Selmer restriction and p-adic L-function product factorization.
2. Project to the anticyclotomic quotient using the stated local-condition comparison and μ-vanishing.
3. Combine nonzero product divisibility with the two individual opposite bounds; cancel in the integral domain and upgrade under surjectivity.

**Sources.** [HE.7s/bcs](https://arxiv.org/pdf/2405.00270v2), §5.1–§5.3; Proposition 5.2.1; proof of Theorems1.2.2/1.2.4.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8b-rational-heegner-main-conjecture"></a>

### Rational Heegner-point main conjecture

**Declaration:** `TauCeti.Heegner.Anticyclotomic.rational_heegner_main_conjecture`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8b/rational-heegner-main-conjecture`.

For p>3 good ordinary, (disc),(Heeg),(spl), and E[p] irreducible over G_Q, S and X have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λy∞)² in Λ[1/p]. No analytic-rank condition, p∤h_K assumption or residual surjectivity is added; integrality is a different branch.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.
- p>3; E[p] irreducible over G_Q.

**Prerequisites.** [HE.8b/anticyclotomic-reverse-product-divisibility](#he-8b-anticyclotomic-reverse-product-divisibility), [HE.8b/anticyclotomic-euler-system-divisibility](#he-8b-anticyclotomic-euler-system-divisibility), [HE.8/howard-stabilization-unit-comparison](#he-8-howard-stabilization-unit-comparison).

**Proof / construction.**

1. Complete the opposite-divisibility cancellation and translate the normalized family line.
2. Record rank one with the paired torsion convention and keep p inverted.

**Sources.** [HE.7s/bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 1.2.2(a).

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.
- A residual irreducible but nonsurjective example falls only under the rational statement; p-primary ideal discrepancies are not removed.

**Planet:** Rational Heegner main conjecture.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8b-integral-heegner-main-conjecture"></a>

### Integral Heegner-point main conjecture

**Declaration:** `TauCeti.Heegner.Anticyclotomic.integral_heegner_main_conjecture`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8b/integral-heegner-main-conjecture`.

For the same ordinary split setting with p>3 and residual G_Q→GL₂(𝔽_p) surjective, S and X have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λy∞)² integrally in Λ. The integral period, μ and generic descent hypotheses are those verified in the BCS supplier chain.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.
- p>3; residual G_Q representation surjective.

**Prerequisites.** [HE.8b/anticyclotomic-reverse-product-divisibility](#he-8b-anticyclotomic-reverse-product-divisibility), [HE.8b/anticyclotomic-euler-system-divisibility](#he-8b-anticyclotomic-euler-system-divisibility), [HE.8/howard-stabilization-unit-comparison](#he-8-howard-stabilization-unit-comparison).

**Proof / construction.**

1. Use integral opposite divisibilities and unit normalization.
2. Verify the absence of a residual p-power error at the μ component.

**Sources.** [HE.7s/bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 1.2.2(b).

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.
- An extra p-factor in the index or characteristic ideal violates the integral equality even if rational equality holds.

**Planet:** Integral Heegner main conjecture.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8b-rational-greenberg-bdp-main-conjecture"></a>

### Rational Greenberg–BDP main conjecture

**Declaration:** `TauCeti.Heegner.Anticyclotomic.rational_greenberg_bdp_main_conjecture`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8b/rational-greenberg-bdp-main-conjecture`.

Under the rational Heegner main-conjecture hypotheses, X_(0,empty) is Λ-torsion and char_Λ(X_(0,empty))Λ^ur=(L_BDP²) in Λ^ur[1/p], where L_BDP is BCGS’s square-root function. This torsion module is not CS’s all-p ordinary rank-one dual.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.
- p>3; residual irreducibility over G_Q.

**Prerequisites.** [HE.8b/rational-heegner-main-conjecture](#he-8b-rational-heegner-main-conjecture), [HE.8b/anticyclotomic-formulation-comparison](#he-8b-anticyclotomic-formulation-comparison), [HE.8b/bdp-function-convention-comparison](#he-8b-bdp-function-convention-comparison).

**Proof / construction.**

1. Apply the exact formulation comparison and source-normalization dictionary.

**Sources.** [HE.7s/bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 1.2.4(a).

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Planet:** Rational Greenberg–BDP theorem.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8b-integral-greenberg-bdp-main-conjecture"></a>

### Integral Greenberg–BDP main conjecture

**Declaration:** `TauCeti.Heegner.Anticyclotomic.integral_greenberg_bdp_main_conjecture`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8b/integral-greenberg-bdp-main-conjecture`.

Under the integral Heegner main-conjecture hypotheses, X_(0,empty) is Λ-torsion and char_Λ(X_(0,empty))Λ^ur=(L_BDP²) integrally. The coefficient ring Λ^ur and p-primary content are retained.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.
- p>3; residual G_Q surjectivity.

**Prerequisites.** [HE.8b/integral-heegner-main-conjecture](#he-8b-integral-heegner-main-conjecture), [HE.8b/anticyclotomic-formulation-comparison](#he-8b-anticyclotomic-formulation-comparison), [HE.8b/bdp-function-convention-comparison](#he-8b-bdp-function-convention-comparison).

**Proof / construction.**

1. Apply the integral formulation comparison, preserving all nonunit factors.

**Sources.** [HE.7s/bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 1.2.4(b).

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Planet:** Integral Greenberg–BDP theorem.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8b-eisenstein-main-conjecture-adapter"></a>

### Eisenstein anticyclotomic theorem interface

**Declaration:** `TauCeti.Heegner.Anticyclotomic.eisenstein_main_conjecture_adapter`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8b/eisenstein-main-conjecture-adapter`.

For CGS Theorem C, E/ℚ has a rational p-isogeny with kernel character φ, p∤2N, K satisfies (disc),(Heeg),(spl), and φ|_(G_p)≠1,ω. Its integral Heegner/Greenberg equality, in the agreed coefficient and BDP conventions, supplies BCGS Theorem 1.2.13(i). This is an adapter of the independently supplied theorem, not a duplicate proof or an extension to excluded local characters.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.
- A rational p-isogeny with kernel character φ and φ|G_p≠1,ω; p∤2N and (disc),(Heeg),(spl). No analytic-rank-one (Sel) hypothesis is added.

**Prerequisites.** `RankZeroOneBSD:BSD.7a`, [HE.8/anticyclotomic-heegner-class](#he-8-anticyclotomic-heegner-class), [HE.8b/bdp-function-convention-comparison](#he-8b-bdp-function-convention-comparison), [HE.8b/anticyclotomic-formulation-comparison](#he-8b-anticyclotomic-formulation-comparison).

**Proof / construction.**

1. Import the independent early Eisenstein proof from BSD.7a.
2. Compare the bottom Λ-line and the BDP square convention; preserve every residual local exclusion.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.2.13(i), citing CGS TheoremsA/C; [HE.7s/cgs](https://web.math.ucsb.edu/~castella/Mazur.pdf), Theorem C and ensuing Greenberg reformulation, author copy pp.3–4.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Planet:** Anticyclotomic Eisenstein main conjecture.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8b-split-kolyvagin-nonvanishing-branches"></a>

### Split-prime Kolyvagin nonvanishing branches

**Declaration:** `TauCeti.Heegner.Anticyclotomic.split_kolyvagin_nonvanishing_branches`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8b/split-kolyvagin-nonvanishing-branches`.

BCGS finite-system nonvanishing is unconditional in each acquired main-conjecture branch: (i) the requested CGS Eisenstein local-character branch; (ii) p>3 and residual G_Q irreducibility; (iii) p>3 and residual surjectivity. In each case apply the conditional TheoremA with the exact branch hypotheses. No p=3 irreducible branch is inferred from BCS.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.

**Prerequisites.** [HE.8/bcgs-conditional-kolyvagin-nonvanishing](#he-8-bcgs-conditional-kolyvagin-nonvanishing), [HE.8b/rational-greenberg-bdp-main-conjecture](#he-8b-rational-greenberg-bdp-main-conjecture), [HE.8b/integral-greenberg-bdp-main-conjecture](#he-8b-integral-greenberg-bdp-main-conjecture), [HE.8b/eisenstein-main-conjecture-adapter](#he-8b-eisenstein-main-conjecture-adapter).

**Proof / construction.**

1. Discharge only the rational main-conjecture hypothesis via the matching branch.
2. Keep the different local and residual conditions attached to each corollary.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.2.13 and TheoremA.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8b-split-refined-kolyvagin-divisibility"></a>

### Split-prime refined Kolyvagin divisibility

**Declaration:** `TauCeti.Heegner.Anticyclotomic.split_refined_kolyvagin_divisibility`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8b/split-refined-kolyvagin-divisibility`.

For p>3 residual G_Q surjective, ordinary split Heegner setting and p-optimal parametrization, M∞=Σ_(ℓ|N)v_p(c_ℓ(E/ℚ)). The integral BCS theorem discharges the conditional TheoremB; rational irreducibility alone does not discharge it.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.
- p>3; residual surjectivity; p-optimal parametrization.

**Prerequisites.** [HE.8/bcgs-conditional-refined-divisibility](#he-8-bcgs-conditional-refined-divisibility), [HE.8b/integral-greenberg-bdp-main-conjecture](#he-8b-integral-greenberg-bdp-main-conjecture).

**Proof / construction.**

1. Import integral Greenberg equality and apply the arithmetic conditional theorem.

**Sources.** [HE.7s/bcgs](https://arxiv.org/pdf/2312.09301v2), TheoremB and Theorem 1.2.13(iii).

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

<a id="he-8b-split-determinantal-heegner-main-conjecture"></a>

### Split determinantal Heegner main conjecture

**Declaration:** `TauCeti.Heegner.Anticyclotomic.split_determinantal_heegner_main_conjecture`. **Kind:** theorem. **Stable node:** `HeegnerPointEulerSystems:HE.8b/split-determinantal-heegner-main-conjecture`.

In the CS TheoremC setting with p split in K, the integral BCS Heegner main conjecture and determinant/characteristic comparison show z̃∞ generates its integral Selmer determinant. Consequently the refined finite Heegner index equals v_p(Tam_E). For inert p the main-conjecture hypothesis is still unproved by this chain.

**Hypotheses.**

- E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p.
- T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.
- E(K)[p]=0.
- p splits as v v̄ in K.
- p>3; residual surjectivity; p∤Manin constant.

**Prerequisites.** [HE.8b/integral-heegner-main-conjecture](#he-8b-integral-heegner-main-conjecture), [HE.8/determinant-characteristic-ideal-comparison](#he-8-determinant-characteristic-ideal-comparison), [HE.8/castella-sano-refined-equivalence](#he-8-castella-sano-refined-equivalence).

**Proof / construction.**

1. Translate the integral characteristic equality to the determinant formulation.
2. Apply the CS equivalence with its Manin and residual hypotheses.

**Sources.** [HE.7s/cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), TheoremC; Proposition 3.2.3.

**Acceptance.**

- Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Library home:** `TauCeti/NumberTheory/Heegner/Anticyclotomic`, namespace `TauCeti.Heegner.Anticyclotomic`. **Implementation:** unchecked.

## Remaining gaps and source boundaries

Requests and restructuring proposals are collected in full in the [handoff](../handoff/ASM-HeegnerPointEulerSystems.md). Each gap below is preserved from its current packet; repaired suggested signatures await review and do not silently delete an R1 entry.

### HE.0/G1: HE.0 general order and class-field suppliers remain planned

Accepted RS-04 forbids rebuilding generic orders, Picard groups or the general CM/class-field correspondence here. GN11/CFT12/CFT13 must export typed order and field constructions. All positive baseline declarations below were read at the exact pins; no Heegner, Kolyvagin, ringClassField or optimalEmbedding declaration was found in either complete source tree.

**Needed by:** [HE.0/local-toral-order](#he-0-local-toral-order), [HE.0/transported-global-order](#he-0-transported-global-order), [HE.0/idele-ideal-class-comparison](#he-0-idele-ideal-class-comparison), [HE.0/conductor-change-kernel](#he-0-conductor-change-kernel), [HE.0/ring-class-tower-quotients](#he-0-ring-class-tower-quotients), [HE.0/dihedral-conjugation](#he-0-dihedral-conjugation), [HE.0/relative-cm-conductor-tower](#he-0-relative-cm-conductor-tower), [HE.0/norm-reciprocity-level-compatibility](#he-0-norm-reciprocity-level-compatibility), [HE.0/local-different-discriminant](#he-0-local-different-discriminant).

### HE.0/G2: HE.1 geometric prototype contract

The suggested conductorPoint takes supplied CM-point values and the specified modular map as unbundled data. It cannot yet type the CM moduli object, Hodge denominator, canonical-model rationality and modular degree at these pins. These are omitted mathematical conditions, recorded explicitly, not Prop-valued placeholder fields. The packet keeps the complete mathematical statement; supplier construction is required before a production signature.

**Needed by:** [HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation](#he-1-heegner-points-of-conductor-m-and-the-modular-parametrisation).

### HE.0/G3: HE.2 global recurrence normalization

The local divisor recurrences are source-verified. A complete chosen modular conductor-chain comparison must determine the central scaling of the second predecessor, global-unit stabilizer and integral Hodge/torsion terms before exporting a scalar repeated-conductor equation on P_c. That comparison is an explicit node target, not an assumed equality.

**Needed by:** [HE.2/split-ramified-first-step-recurrence](#he-2-split-ramified-first-step-recurrence), [HE.2/repeated-conductor-predecessor-recurrence](#he-2-repeated-conductor-predecessor-recurrence), [HE.2/nonmaximal-level-distribution](#he-2-nonmaximal-level-distribution).

### HE.0/G4: HE.4 typed continuous-cohomology prototype

The descent signature uses a supplied additive restriction equivalence C≃+I and invariant Kummer class z. C and I must eventually be the actual continuous Galois-cohomology objects with the right coefficient topology. Those supplier/carrier conditions are omitted in the prototype and named here; no algebraic group-cohomology substitute or fake cohomology carrier is introduced.

**Needed by:** [HE.4/kolyvagin-derivative-classes-and-descent-to-K](#he-4-kolyvagin-derivative-classes-and-descent-to-k).

### HE.0/G5: HE.5 global χ localization comparison

Howard’s local χ_ℓ is not automatically a G_K-equivariant coefficient map. The intended global construction must use the G_Q change-of-group action. From F²−a_ℓF+ℓ=0, a_ℓ−(ℓ+1)F=−ℓ(F²−1)F⁻¹; compare this with the local Kummer identification, yielding the normalized involution modulo I_ℓ. The complete integral identification and localization square have not been established here. Retain this exact gap rather than postcompose cocycles with a non-equivariant matrix or accuse the source of an erratum.

**Needed by:** [HE.5/local-heegner-chi-automorphism](#he-5-local-heegner-chi-automorphism), [HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system](#he-5-finite-singular-comparison-and-the-corrected-kolyvagin-system).

### HE.0/G6: Missing generic level-raising stage

RT-AREA-iwasawa-1/2. No declaration of the atlas supplies Ribet/Diamond–Taylor level raising in the exact-level form of Zhang2.1, and neither library has it. SerreWeightAndLevelOptimisation R20.2 is titled “Lowering level away from p”; its packet has R20.2/level-raising-diamond, Diamond’s criterion, which is imported here and gives a form new at q, not a newform of exact level Nq with the original local types and trivial nebentypus. The nearest other declarations are GL2ModularityLifting:R22.1/prescribed-level-raising-step, a quaternionic step over totally real fields, and OrdinaryAutomorphicFormsAndModularityLifting:R21.2/ihara-lemma-quaternionic, Ihara’s lemma for definite quaternionic forms; neither gives Zhang2.1 or Ihara’s lemma for Shimura curves. The same owner is asked for the quaternionic transports of Zhang §§3–4. The request is routed through R20.2 and a separate stage is proposed under Structure proposals. Until one of them exists the Zhang branch of HE.6 is not closed.

**Needed by:** [HE.6/zhang-cohomological-congruence](#he-6-zhang-cohomological-congruence), [HE.6/zhang-indivisibility](#he-6-zhang-indivisibility), [HE.6/zhang-jochnowitz-special-value](#he-6-zhang-jochnowitz-special-value).

### HE.0/G7: Zhang auxiliary rank-zero and degree supplier scope

RT-AREA-iwasawa-1/8. Zhang7.1 needs, for g and g_K, the main conjecture in its Skinner–Urban form, Kato’s divisibility and the rank-zero specialisation with coefficients O (Skinner’s Theorems A and B). ModularIwasawaMainConjectures has no blueprint yet and its L1 text states only the Fouquet–Wan form, so the Skinner–Urban form is an open request; Kato’s Theorem17.4 is a cited declaration, with its integral bound under Skinner’s two conditions requested; SelmerIwasawa L4 is asked for the specialisation. The definite period identity is a declaration of the BSD owner, RankZeroOneBSD:BSD.3a/definite-congruence-period, cited here; its packet is not yet accepted, and its proof route does not yet cover nonsquarefree N. Neither BSD.5’s index formula nor BSD.6 is a prerequisite, since both consume HE.6.

**Needed by:** [HE.6/zhang-rank-zero-over-K](#he-6-zhang-rank-zero-over-k), [HE.6/ribet-takahashi-tamagawa-comparison](#he-6-ribet-takahashi-tamagawa-comparison), [HE.6/zhang-indivisibility](#he-6-zhang-indivisibility).

### HE.0/G8: Missing general Serre/Ribet open-image layer

RT-AREA-iwasawa-1/9. No layer of the atlas proves Serre’s open-image theorem. Its owner is the Part II of FaltingsFinitenessAndIsogenyTheorems on ℓ-adic and residual images of abelian varieties (Serre’s open-image theorems), an accepted paper route whose roadmap is not yet written; the R28.7 stage proposed earlier is withdrawn in its favour. The route’s brief covers surjectivity modulo p and the full p-adic image for large p. It does not cover what HE.7 also uses: the open p-adic image at every p, which the atlas states only as the cited leaf AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image; homotheties for GL₂-type quotients with index bounded across coefficient primes; Ribet’s GL₂-type theorem; and the endomorphism/residual-irreducibility exports of Nekovář6.1–6.2. These are requested through R28.4 and R01.4 and are not re-proved in HE.7. Full non-CM GL₂ image is not used in the CM branch.

**Needed by:** [HE.7/non-cm-open-image-application](#he-7-non-cm-open-image-application), [HE.7/almost-all-primary-sha-vanishing](#he-7-almost-all-primary-sha-vanishing), [HE.7/bounded-arithmetic-derivative-denominators](#he-7-bounded-arithmetic-derivative-denominators), [HE.7/admissible-rm-kolyvagin-logachev](#he-7-admissible-rm-kolyvagin-logachev), [HE.7/integral-tate-image-errors](#he-7-integral-tate-image-errors), [HE.7/integral-cm-prime-detection](#he-7-integral-cm-prime-detection).

### HE.0/G9: HE.0 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

**Needed by:** [HE.0/local-toral-order](#he-0-local-toral-order), [HE.0/transported-global-order](#he-0-transported-global-order), [HE.0/idele-ideal-class-comparison](#he-0-idele-ideal-class-comparison), [HE.0/conductor-change-kernel](#he-0-conductor-change-kernel), [HE.0/ring-class-tower-quotients](#he-0-ring-class-tower-quotients), [HE.0/dihedral-conjugation](#he-0-dihedral-conjugation), [HE.0/relative-cm-conductor-tower](#he-0-relative-cm-conductor-tower), [HE.0/norm-reciprocity-level-compatibility](#he-0-norm-reciprocity-level-compatibility), [HE.0/local-different-discriminant](#he-0-local-different-discriminant).

### HE.0/G10: HE.1 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

**Needed by:** [HE.1/cm-cyclic-isogeny-pair](#he-1-cm-cyclic-isogeny-pair), [HE.1/optimal-embedding-cm-points](#he-1-optimal-embedding-cm-points), [HE.1/canonical-model-cm-descent](#he-1-canonical-model-cm-descent), [HE.1/jacobian-basepoint-denominators](#he-1-jacobian-basepoint-denominators), [HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation](#he-1-heegner-points-of-conductor-m-and-the-modular-parametrisation), [HE.1/parameter-choice-and-degree](#he-1-parameter-choice-and-degree).

### HE.0/G11: HE.2 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

**Needed by:** [HE.2/cm-hecke-conductor-classification](#he-2-cm-hecke-conductor-classification), [HE.2/norm-relation-and-reduction-congruence](#he-2-norm-relation-and-reduction-congruence), [HE.2/split-ramified-first-step-recurrence](#he-2-split-ramified-first-step-recurrence), [HE.2/repeated-conductor-predecessor-recurrence](#he-2-repeated-conductor-predecessor-recurrence), [HE.2/nonmaximal-level-distribution](#he-2-nonmaximal-level-distribution), [HE.2/inert-reduction-frobenius-congruence](#he-2-inert-reduction-frobenius-congruence), [HE.2/quaternionic-reduction-specialization](#he-2-quaternionic-reduction-specialization).

### HE.0/G12: HE.3 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

**Needed by:** [HE.3/kummer-classes-and-the-modified-selmer-conditions](#he-3-kummer-classes-and-the-modified-selmer-conditions), [HE.3/good-place-kummer-unramified](#he-3-good-place-kummer-unramified), [HE.3/bad-place-component-obstruction](#he-3-bad-place-component-obstruction), [HE.3/coefficient-prime-local-condition](#he-3-coefficient-prime-local-condition), [HE.3/saturated-integral-kummer-lattice](#he-3-saturated-integral-kummer-lattice), [HE.3/archimedean-tate-correction](#he-3-archimedean-tate-correction).

### HE.0/G13: HE.4 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

**Needed by:** [HE.4/heegner-coefficient-ideal](#he-4-heegner-coefficient-ideal), [HE.4/differentiated-point-invariance](#he-4-differentiated-point-invariance), [HE.4/ring-class-torsion-invariants](#he-4-ring-class-torsion-invariants), [HE.4/kolyvagin-derivative-classes-and-descent-to-K](#he-4-kolyvagin-derivative-classes-and-descent-to-k), [HE.4/explicit-cocycle-divisibility](#he-4-explicit-cocycle-divisibility), [HE.4/bottom-trace-class](#he-4-bottom-trace-class), [HE.4/generator-tensor-choice-independence](#he-4-generator-tensor-choice-independence), [HE.4/coefficient-and-prime-set-compatibility](#he-4-coefficient-and-prime-set-compatibility), [HE.4/complex-conjugation-parity](#he-4-complex-conjugation-parity).

### HE.0/G14: HE.5 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

**Needed by:** [HE.5/heegner-transverse-local-condition](#he-5-heegner-transverse-local-condition), [HE.5/local-heegner-chi-automorphism](#he-5-local-heegner-chi-automorphism), [HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system](#he-5-finite-singular-comparison-and-the-corrected-kolyvagin-system), [HE.5/actual-tate-hypotheses-h0-h2](#he-5-actual-tate-hypotheses-h0-h2), [HE.5/actual-local-hypotheses-h3-h5](#he-5-actual-local-hypotheses-h3-h5), [HE.5/residual-kummer-field-pairing](#he-5-residual-kummer-field-pairing), [HE.5/chebotarev-heegner-class-detection](#he-5-chebotarev-heegner-class-detection), [HE.5/arithmetic-local-error-comparison](#he-5-arithmetic-local-error-comparison), [HE.5/tamagawa-and-local-torsion-tests](#he-5-tamagawa-and-local-torsion-tests).

### HE.0/G15: HE.6 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

**Needed by:** [HE.6/clean-rank-one-descent-theorem-A](#he-6-clean-rank-one-descent-theorem-a), [HE.6/gross-clean-mod-p-descent](#he-6-gross-clean-mod-p-descent), [HE.6/gross-opposite-eigenspace-vanishing](#he-6-gross-opposite-eigenspace-vanishing), [HE.6/gross-same-eigenspace-generation](#he-6-gross-same-eigenspace-generation), [HE.6/sha-square-index-bound](#he-6-sha-square-index-bound), [HE.6/primitivity-versus-nonzero](#he-6-primitivity-versus-nonzero), [HE.6/zhang-cohomological-congruence](#he-6-zhang-cohomological-congruence), [HE.6/zhang-local-conditions-rank-lowering](#he-6-zhang-local-conditions-rank-lowering), [HE.6/zhang-rank-zero-over-K](#he-6-zhang-rank-zero-over-k), [HE.6/zhang-jochnowitz-special-value](#he-6-zhang-jochnowitz-special-value), [HE.6/ribet-takahashi-tamagawa-comparison](#he-6-ribet-takahashi-tamagawa-comparison), [HE.6/zhang-triangular-selmer-basis](#he-6-zhang-triangular-selmer-basis), [HE.6/zhang-indivisibility](#he-6-zhang-indivisibility), [HE.6/heegner-vanishing-order](#he-6-heegner-vanishing-order), [HE.6/heegner-base-locus](#he-6-heegner-base-locus), [HE.6/zhang-residual-local-pairing](#he-6-zhang-residual-local-pairing), [HE.6/zhang-residual-heegner-relations](#he-6-zhang-residual-heegner-relations), [HE.6/zhang-two-class-prime-detection](#he-6-zhang-two-class-prime-detection), [HE.6/zhang-prescribed-ramification-class](#he-6-zhang-prescribed-ramification-class).

### HE.0/G16: HE.7 exact arithmetic prototype conditions

The suggested file names every declaration and prints its full mathematical statement beside a signature. For this stage, the exact supplier-object/field/local-condition identifications and hypotheses in those statements are omitted from the Lean parameters; existing algebraic groups/modules, elliptic Point, Subring/Pic and ideals are used as unbundled data. A successful admission-only elaboration checks these shapes, not the source hypotheses or a completed arithmetic interface. The definitive statements and prerequisite/gap contracts are the packet and reader.

**Needed by:** [HE.7/non-torsion-point-prime-divisibility](#he-7-non-torsion-point-prime-divisibility), [HE.7/non-cm-open-image-application](#he-7-non-cm-open-image-application), [HE.7/almost-all-primary-sha-vanishing](#he-7-almost-all-primary-sha-vanishing), [HE.7/bounded-arithmetic-derivative-denominators](#he-7-bounded-arithmetic-derivative-denominators), [HE.7/dyadic-integral-conjugation-descent](#he-7-dyadic-integral-conjugation-descent), [HE.7/cm-character-error-descent](#he-7-cm-character-error-descent), [HE.7/exceptional-primary-sha-bound](#he-7-exceptional-primary-sha-bound), [HE.7/classical-full-sha-finiteness](#he-7-classical-full-sha-finiteness), [HE.7/admissible-rm-kolyvagin-logachev](#he-7-admissible-rm-kolyvagin-logachev), [HE.7/integral-tate-image-errors](#he-7-integral-tate-image-errors), [HE.7/integral-cm-prime-detection](#he-7-integral-cm-prime-detection), [HE.7/cm-heegner-field-disjointness](#he-7-cm-heegner-field-disjointness), [HE.7/classical-square-index-error-bound](#he-7-classical-square-index-error-bound).

### HE.0/G17: Independent review: definite period supplier must precede HE.6

The early export now exists as RankZeroOneBSD:BSD.3a/definite-congruence-period, with the odd-definite, full-♥, GL₂-type and nonsquarefree contract in its statement, and HE.6 cites it. Four things remain open. Its packet is not yet accepted. Its proof route is the squarefree one. Its t_g(ℓ) must be stated for the geometric component group. It is planned under BSD.5, so once both packets are live the derived stage link BSD.5 → HE.6 and the link HE.6 → BSD.5 of BSD.5’s index formula cannot both be drawn; either sub-layer, BSD.3a or HE.6z, removes the conflict.

**Needed by:** [HE.6/ribet-takahashi-tamagawa-comparison](#he-6-ribet-takahashi-tamagawa-comparison).

### HE.0/G18: Independent review: Lean signatures are conditional sketches

Section13 permits explicit omission of unavailable arithmetic conditions. The independent review found that the former arbitrary-group dihedral and zero-family indivisibility signatures could fail. This revision replaces those shapes with cyclic-dihedral homomorphism transport and transport of a supplied nonzero auxiliary localization. These corrections remove the stated algebraic counterexamples. Every remaining arithmetic carrier/map must still be linked to its actual supplier object before the admissions can be used. Expressible finite-generation/non-torsion hypotheses and the conditional rank-zero valuation clause are retained; elaboration does not verify omitted arithmetic identifications.

**Needed by:** [HE.0/local-toral-order](#he-0-local-toral-order), [HE.0/transported-global-order](#he-0-transported-global-order), [HE.0/idele-ideal-class-comparison](#he-0-idele-ideal-class-comparison), [HE.0/conductor-change-kernel](#he-0-conductor-change-kernel), [HE.0/ring-class-tower-quotients](#he-0-ring-class-tower-quotients), [HE.0/dihedral-conjugation](#he-0-dihedral-conjugation), [HE.0/relative-cm-conductor-tower](#he-0-relative-cm-conductor-tower), [HE.0/norm-reciprocity-level-compatibility](#he-0-norm-reciprocity-level-compatibility), [HE.0/local-different-discriminant](#he-0-local-different-discriminant), [HE.1/cm-cyclic-isogeny-pair](#he-1-cm-cyclic-isogeny-pair), [HE.1/optimal-embedding-cm-points](#he-1-optimal-embedding-cm-points), [HE.1/canonical-model-cm-descent](#he-1-canonical-model-cm-descent), [HE.1/jacobian-basepoint-denominators](#he-1-jacobian-basepoint-denominators), [HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation](#he-1-heegner-points-of-conductor-m-and-the-modular-parametrisation), [HE.1/parameter-choice-and-degree](#he-1-parameter-choice-and-degree), [HE.2/cm-hecke-conductor-classification](#he-2-cm-hecke-conductor-classification), [HE.2/norm-relation-and-reduction-congruence](#he-2-norm-relation-and-reduction-congruence), [HE.2/split-ramified-first-step-recurrence](#he-2-split-ramified-first-step-recurrence), [HE.2/repeated-conductor-predecessor-recurrence](#he-2-repeated-conductor-predecessor-recurrence), [HE.2/nonmaximal-level-distribution](#he-2-nonmaximal-level-distribution), [HE.2/inert-reduction-frobenius-congruence](#he-2-inert-reduction-frobenius-congruence), [HE.2/quaternionic-reduction-specialization](#he-2-quaternionic-reduction-specialization), [HE.3/kummer-classes-and-the-modified-selmer-conditions](#he-3-kummer-classes-and-the-modified-selmer-conditions), [HE.3/good-place-kummer-unramified](#he-3-good-place-kummer-unramified), [HE.3/bad-place-component-obstruction](#he-3-bad-place-component-obstruction), [HE.3/coefficient-prime-local-condition](#he-3-coefficient-prime-local-condition), [HE.3/saturated-integral-kummer-lattice](#he-3-saturated-integral-kummer-lattice), [HE.3/archimedean-tate-correction](#he-3-archimedean-tate-correction), [HE.4/heegner-coefficient-ideal](#he-4-heegner-coefficient-ideal), [HE.4/differentiated-point-invariance](#he-4-differentiated-point-invariance), [HE.4/ring-class-torsion-invariants](#he-4-ring-class-torsion-invariants), [HE.4/kolyvagin-derivative-classes-and-descent-to-K](#he-4-kolyvagin-derivative-classes-and-descent-to-k), [HE.4/explicit-cocycle-divisibility](#he-4-explicit-cocycle-divisibility), [HE.4/bottom-trace-class](#he-4-bottom-trace-class), [HE.4/generator-tensor-choice-independence](#he-4-generator-tensor-choice-independence), [HE.4/coefficient-and-prime-set-compatibility](#he-4-coefficient-and-prime-set-compatibility), [HE.4/complex-conjugation-parity](#he-4-complex-conjugation-parity), [HE.5/heegner-transverse-local-condition](#he-5-heegner-transverse-local-condition), [HE.5/local-heegner-chi-automorphism](#he-5-local-heegner-chi-automorphism), [HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system](#he-5-finite-singular-comparison-and-the-corrected-kolyvagin-system), [HE.5/actual-tate-hypotheses-h0-h2](#he-5-actual-tate-hypotheses-h0-h2), [HE.5/actual-local-hypotheses-h3-h5](#he-5-actual-local-hypotheses-h3-h5), [HE.5/residual-kummer-field-pairing](#he-5-residual-kummer-field-pairing), [HE.5/chebotarev-heegner-class-detection](#he-5-chebotarev-heegner-class-detection), [HE.5/arithmetic-local-error-comparison](#he-5-arithmetic-local-error-comparison), [HE.5/tamagawa-and-local-torsion-tests](#he-5-tamagawa-and-local-torsion-tests), [HE.6/clean-rank-one-descent-theorem-A](#he-6-clean-rank-one-descent-theorem-a), [HE.6/gross-clean-mod-p-descent](#he-6-gross-clean-mod-p-descent), [HE.6/gross-opposite-eigenspace-vanishing](#he-6-gross-opposite-eigenspace-vanishing), [HE.6/gross-same-eigenspace-generation](#he-6-gross-same-eigenspace-generation), [HE.6/sha-square-index-bound](#he-6-sha-square-index-bound), [HE.6/primitivity-versus-nonzero](#he-6-primitivity-versus-nonzero), [HE.6/zhang-cohomological-congruence](#he-6-zhang-cohomological-congruence), [HE.6/zhang-local-conditions-rank-lowering](#he-6-zhang-local-conditions-rank-lowering), [HE.6/zhang-rank-zero-over-K](#he-6-zhang-rank-zero-over-k), [HE.6/zhang-jochnowitz-special-value](#he-6-zhang-jochnowitz-special-value), [HE.6/ribet-takahashi-tamagawa-comparison](#he-6-ribet-takahashi-tamagawa-comparison), [HE.6/zhang-triangular-selmer-basis](#he-6-zhang-triangular-selmer-basis), [HE.6/zhang-indivisibility](#he-6-zhang-indivisibility), [HE.7/non-torsion-point-prime-divisibility](#he-7-non-torsion-point-prime-divisibility), [HE.7/non-cm-open-image-application](#he-7-non-cm-open-image-application), [HE.7/almost-all-primary-sha-vanishing](#he-7-almost-all-primary-sha-vanishing), [HE.7/bounded-arithmetic-derivative-denominators](#he-7-bounded-arithmetic-derivative-denominators), [HE.7/dyadic-integral-conjugation-descent](#he-7-dyadic-integral-conjugation-descent), [HE.7/cm-character-error-descent](#he-7-cm-character-error-descent), [HE.7/exceptional-primary-sha-bound](#he-7-exceptional-primary-sha-bound), [HE.7/classical-full-sha-finiteness](#he-7-classical-full-sha-finiteness), [HE.7/admissible-rm-kolyvagin-logachev](#he-7-admissible-rm-kolyvagin-logachev).

### HE.0/G19: CM conductor and integral image supplier contracts

The classical CM application derives M≠K from |D_M| dividing the elliptic conductor. CM.4/R01.3 must provide that exact induced-character conductor and endomorphism-field dictionary. The open-image Part II of FaltingsFinitenessAndIsogenyTheorems must provide the general homothety and absolute-irreducibility consequences stated in the request. The Heegner application and its bounds are sourced; these general theorems are imported, not rebuilt here.

**Needed by:** [HE.7/cm-heegner-field-disjointness](#he-7-cm-heegner-field-disjointness), [HE.7/integral-tate-image-errors](#he-7-integral-tate-image-errors).

### HE.0/G20: Classical square-index size theorem source/export

Gross1.3 and Kolyvagin1991 TheoremA verify the exact classical order theorem, but quote its earlier Euler Systems proof. The Springer public endpoint returned a purchase page, not the proof. ES.4 needs that generic cardinality export, including CM image conventions. Nekovář7.5 establishes the uniform exponent and full finiteness, not this sharp size assertion. Keep the separate source-acquisition and export gap.

**Needed by:** [HE.7/classical-square-index-error-bound](#he-7-classical-square-index-error-bound).

### HE.0/G21: GL₂-type abelian finite Selmer supplier

The new RM specialization needs finite generation, finite finite-level Selmer/Kummer sequences and torsion-primary decomposition for the exact abelian variety and coefficient prime. SelmerIwasawaL0 is requested to export the abelian variant; an elliptic-only upstream declaration is insufficient.

**Needed by:** [HE.7/admissible-rm-kolyvagin-logachev](#he-7-admissible-rm-kolyvagin-logachev), [HE.7/exceptional-primary-sha-bound](#he-7-exceptional-primary-sha-bound).

### HE.7s/G1: Inherited global χ and arithmetic source gaps

The reviewed HE.0 part leaves an exact global change-of-group/localization square for χ_ℓ unresolved. This Λ-adic extension imports that mathematical construction and preserves its gap. Reviewed HE.7 supplies bounded CM/dyadic error plans, not formal proofs; its image/arithmetic requests remain dependencies.

**Needed by:** [HE.8/lambda-finite-singular-relation](#he-8-lambda-finite-singular-relation), [HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B](#he-8-lambda-adic-heegner-kolyvagin-system-and-theorem-b), [HE.8/arithmetic-rescaled-kolyvagin-bound](#he-8-arithmetic-rescaled-kolyvagin-bound).

### HE.7s/G2: S-arithmetic dynamics supplier missing

RT-AREA-iwasawa-1/1 is retained: GN.4 current Ratner nodes are over real Lie groups and cannot prove CV’s SL₂(F_P) product theorem. Request the S-arithmetic extension. For F_P=Q_p the source cites Ratner precisely; its general-F_P Lemma 2.30 appeals to expert knowledge/Shah notes, whose exact matching theorem has not been acquired here. General-F statements remain planned with that explicit gap.

**Needed by:** [HE.8/joint-cm-equidistribution](#he-8-joint-cm-equidistribution), [HE.8/joint-cm-orbit-surjectivity](#he-8-joint-cm-orbit-surjectivity), [HE.8/indefinite-cm-character-point](#he-8-indefinite-cm-character-point), [HE.8/definite-cm-character-period](#he-8-definite-cm-character-period), [HE.8/definite-rankin-nonvanishing](#he-8-definite-rankin-nonvanishing), [HE.8c/cornut-vatsal-nonvanishing-with-its-exact-hypotheses](#he-8c-cornut-vatsal-nonvanishing-with-its-exact-hypotheses), [HE.8/cornut-tower-trace-nontorsion](#he-8-cornut-tower-trace-nontorsion), [HE.8/lambda-bottom-class-nontorsion](#he-8-lambda-bottom-class-nontorsion).

### HE.7s/G3: Independent elliptic-unit and Eisenstein suppliers

RT-AREA-iwasawa-1/5: no current roadmap plans the imaginary-quadratic elliptic-unit main conjectures. A new owner is proposed and routed through BSD.7a, with KatoL4 integral Wüthrich input. Rubin 1987 remains unacquired; neither dyadic scope nor a complete CM branch is inferred. The already reviewed Nekovář HE.7 direct CM/descent route does not mathematically require an elliptic-unit IMC; the requested Rubin/Iwasawa alternative does.

**Needed by:** [HE.8b/eisenstein-main-conjecture-adapter](#he-8b-eisenstein-main-conjecture-adapter), [HE.8b/split-kolyvagin-nonvanishing-branches](#he-8b-split-kolyvagin-nonvanishing-branches).

### HE.7s/G4: Integral specialization and reciprocity contracts

Existing generic Iwasawa descent and finite BDP/logarithm nodes are narrower than the exact integral family identities needed. Requests identify the JSW/CH/Wüthrich and Selmer-complex extensions, coefficients, p-factors and local-condition dictionary. A stage label or rational identity is not certified as supplying the integral equality.

**Needed by:** [HE.8/twisted-logarithm-index-formula](#he-8-twisted-logarithm-index-formula), [HE.8/twisted-anticyclotomic-control](#he-8-twisted-anticyclotomic-control), [HE.8/optimal-lattice-isogeny-comparison](#he-8-optimal-lattice-isogeny-comparison), [HE.8/strict-ordinary-selmer-complex](#he-8-strict-ordinary-selmer-complex), [HE.8/determinant-specialization-lattice](#he-8-determinant-specialization-lattice), [HE.8/determinantal-twisted-index-square](#he-8-determinantal-twisted-index-square), [HE.8b/anticyclotomic-reverse-product-divisibility](#he-8b-anticyclotomic-reverse-product-divisibility).

### HE.7s/G5: Source collation and general-CM acquisition

The BCGS publisher DOI request returned HTTP 403. Its arXiv v2 and linked author copy were compared and findings are scoped to those texts. Castella–Sano is a preprint, with no version-of-record claim. Rubin 1987, the new elliptic-unit owner’s proofs and the exact general-F_P twisted-diagonal theorem require acquisition/verification before supplier closure.

**Needed by:** [HE.8/near-trivial-heegner-specialization](#he-8-near-trivial-heegner-specialization), [HE.8/bcgs-conditional-kolyvagin-nonvanishing](#he-8-bcgs-conditional-kolyvagin-nonvanishing), [HE.8/castella-sano-refined-equivalence](#he-8-castella-sano-refined-equivalence).

### HE.7s/G6: HE.8 suggested arithmetic interfaces

The suggested file uses existing rings, modules, ideals, monoid homomorphisms and tensor products as unbundled supplier data. The actual number fields, continuous Galois modules/cohomology, Λ, Selmer local conditions, characteristic-ideal assignment, CM moduli, derived Selmer determinant and the arithmetic hypotheses in each packet statement are omitted conditions, printed beside each prototype signature. Elaboration checks algebraic shapes with admitted declarations only; it does not certify those identifications or the mathematics. No opaque Prop-valued pseudo-structure is introduced. Production declarations must replace these omissions by the named supplier objects and hypotheses.

**Needed by:** [HE.8/initial-euler-factor](#he-8-initial-euler-factor), [HE.8/ordinary-stabilized-point](#he-8-ordinary-stabilized-point), [HE.8/stabilized-corestriction](#he-8-stabilized-corestriction), [HE.8/universal-norm-heegner-family](#he-8-universal-norm-heegner-family), [HE.8/anticyclotomic-heegner-class](#he-8-anticyclotomic-heegner-class), [HE.8/cm-character-stratum](#he-8-cm-character-stratum), [HE.8/cm-generic-root-number](#he-8-cm-generic-root-number), [HE.8/joint-cm-equidistribution](#he-8-joint-cm-equidistribution), [HE.8/joint-cm-orbit-surjectivity](#he-8-joint-cm-orbit-surjectivity), [HE.8/indefinite-cm-character-point](#he-8-indefinite-cm-character-point), [HE.8/definite-cm-character-period](#he-8-definite-cm-character-period), [HE.8/definite-rankin-nonvanishing](#he-8-definite-rankin-nonvanishing), [HE.8c/cornut-vatsal-nonvanishing-with-its-exact-hypotheses](#he-8c-cornut-vatsal-nonvanishing-with-its-exact-hypotheses), [HE.8/cornut-tower-trace-nontorsion](#he-8-cornut-tower-trace-nontorsion), [HE.8/lambda-bottom-class-nontorsion](#he-8-lambda-bottom-class-nontorsion), [HE.8/lambda-heegner-derivative-class](#he-8-lambda-heegner-derivative-class), [HE.8/lambda-heegner-local-conditions](#he-8-lambda-heegner-local-conditions), [HE.8/lambda-finite-singular-relation](#he-8-lambda-finite-singular-relation), [HE.8/howard-stabilization-unit-comparison](#he-8-howard-stabilization-unit-comparison), [HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B](#he-8-lambda-adic-heegner-kolyvagin-system-and-theorem-b), [HE.8/weak-torsion-localized-divisibility](#he-8-weak-torsion-localized-divisibility), [HE.8/crystalline-near-trivial-character](#he-8-crystalline-near-trivial-character), [HE.8/near-trivial-heegner-specialization](#he-8-near-trivial-heegner-specialization), [HE.8/near-trivial-bottom-nonvanishing](#he-8-near-trivial-bottom-nonvanishing), [HE.8/heegner-divisibility-profile](#he-8-heegner-divisibility-profile), [HE.8/optimal-lattice-isogeny-comparison](#he-8-optimal-lattice-isogeny-comparison), [HE.8/twisted-logarithm-index-formula](#he-8-twisted-logarithm-index-formula), [HE.8/twisted-anticyclotomic-control](#he-8-twisted-anticyclotomic-control), [HE.8/near-trivial-tamagawa-stability](#he-8-near-trivial-tamagawa-stability), [HE.8/arithmetic-rescaled-kolyvagin-bound](#he-8-arithmetic-rescaled-kolyvagin-bound), [HE.8/heegner-exact-sha-length](#he-8-heegner-exact-sha-length), [HE.8/integral-main-conjecture-index-square](#he-8-integral-main-conjecture-index-square), [HE.8/bcgs-conditional-kolyvagin-nonvanishing](#he-8-bcgs-conditional-kolyvagin-nonvanishing), [HE.8/bcgs-conditional-refined-divisibility](#he-8-bcgs-conditional-refined-divisibility), [HE.8/strict-ordinary-selmer-complex](#he-8-strict-ordinary-selmer-complex), [HE.8/determinantal-heegner-element](#he-8-determinantal-heegner-element), [HE.8/determinant-characteristic-ideal-comparison](#he-8-determinant-characteristic-ideal-comparison), [HE.8/ordinary-local-specialization-defect](#he-8-ordinary-local-specialization-defect), [HE.8/determinant-specialization-lattice](#he-8-determinant-specialization-lattice), [HE.8/determinantal-twisted-index-square](#he-8-determinantal-twisted-index-square), [HE.8/castella-sano-refined-equivalence](#he-8-castella-sano-refined-equivalence), [HE.8/universal-norm-level-zero](#he-8-universal-norm-level-zero), [HE.8/iwasawa-heegner-level-projection](#he-8-iwasawa-heegner-level-projection), [HE.8/lambda-derivative-restriction](#he-8-lambda-derivative-restriction), [HE.8/near-trivial-character-congruence](#he-8-near-trivial-character-congruence), [HE.8/determinantal-heegner-image](#he-8-determinantal-heegner-image).

### HE.7s/G7: HE.8b suggested arithmetic interfaces

The suggested file uses existing rings, modules, ideals, monoid homomorphisms and tensor products as unbundled supplier data. The actual number fields, continuous Galois modules/cohomology, Λ, Selmer local conditions, characteristic-ideal assignment, CM moduli, derived Selmer determinant and the arithmetic hypotheses in each packet statement are omitted conditions, printed beside each prototype signature. Elaboration checks algebraic shapes with admitted declarations only; it does not certify those identifications or the mathematics. No opaque Prop-valued pseudo-structure is introduced. Production declarations must replace these omissions by the named supplier objects and hypotheses.

**Needed by:** [HE.8b/bdp-function-convention-comparison](#he-8b-bdp-function-convention-comparison), [HE.8b/anticyclotomic-formulation-comparison](#he-8b-anticyclotomic-formulation-comparison), [HE.8b/auxiliary-quadratic-field-verification](#he-8b-auxiliary-quadratic-field-verification), [HE.8b/anticyclotomic-euler-system-divisibility](#he-8b-anticyclotomic-euler-system-divisibility), [HE.8b/anticyclotomic-reverse-product-divisibility](#he-8b-anticyclotomic-reverse-product-divisibility), [HE.8b/rational-heegner-main-conjecture](#he-8b-rational-heegner-main-conjecture), [HE.8b/integral-heegner-main-conjecture](#he-8b-integral-heegner-main-conjecture), [HE.8b/rational-greenberg-bdp-main-conjecture](#he-8b-rational-greenberg-bdp-main-conjecture), [HE.8b/integral-greenberg-bdp-main-conjecture](#he-8b-integral-greenberg-bdp-main-conjecture), [HE.8b/eisenstein-main-conjecture-adapter](#he-8b-eisenstein-main-conjecture-adapter), [HE.8b/split-kolyvagin-nonvanishing-branches](#he-8b-split-kolyvagin-nonvanishing-branches), [HE.8b/split-refined-kolyvagin-divisibility](#he-8b-split-refined-kolyvagin-divisibility), [HE.8b/split-determinantal-heegner-main-conjecture](#he-8b-split-determinantal-heegner-main-conjecture).

### HE.7s/G8: BCGS ordinary local torsion normalization

BCGS Lemma 1.2.3/Remark 1.2.4 and its proof use #H⁰(Q_p,E_•[p∞]) in the regulator/control comparison and compare it to the ordinary unit-root factor. The exact lattice and local-extension hypotheses needed for that identification must be certified by the regulator/Selmer supplier. Full Tate invariants, unramified ordinary-quotient invariants and #Ẽ(F_p)[p∞] are not equated merely by notation in this plan; the BCGS formula is recorded as source-stated, with this specific integral local proof obligation. CS instead computes its local factor from the stated reduction groups.

**Needed by:** [HE.8/twisted-logarithm-index-formula](#he-8-twisted-logarithm-index-formula), [HE.8/twisted-anticyclotomic-control](#he-8-twisted-anticyclotomic-control), [HE.8/integral-main-conjecture-index-square](#he-8-integral-main-conjecture-index-square), [HE.8/bcgs-conditional-refined-divisibility](#he-8-bcgs-conditional-refined-divisibility).

### HE.7s/G9: Prototype norm-family coherence

Independent review found expressible algebraic coherence missing from the suggested signatures: π may be the zero map with ΦP≠0; auxiliary trace maps are not inputs to the family construction; arbitrary proj/cor maps need compatibility; stabilized_corestriction takes an arbitrary y rather than the defined stabilized family. Retain the arithmetic source targets, but revise these prototypes together using coherent supplied inverse-system data and actual lift existence. This is an unresolved signature contradiction, not an assertion that Howard’s source theorem is false.

**Needed by:** [HE.8/stabilized-corestriction](#he-8-stabilized-corestriction), [HE.8/universal-norm-heegner-family](#he-8-universal-norm-heegner-family), [HE.8/universal-norm-level-zero](#he-8-universal-norm-level-zero).

### HE.7s/G10: Exact-length proof at p=3

SourceIssue E3: BCGS2.2.2 inherits p≥3 but invokes Lemma2.2.4 with p>3. This review restricts the verified route to p>3. Establish the p=3 stub proof before extending; the late BCGS/CS applications already require p>3.

**Needed by:** [HE.8/heegner-exact-sha-length](#he-8-heegner-exact-sha-length).

### HE.7s/G11: Integral anticyclotomic comparison at general weak-torsion p=3

CGLS4.2.1 gives rational comparison for E(K)[p]=0; BCK5.2 gives integral comparison with standing p>3. CGS separately supplies the excluded-local-character Eisenstein branch at odd p. No general p=3 integral comparison under only E(K)[p]=0 is certified here.

**Needed by:** [HE.8b/anticyclotomic-formulation-comparison](#he-8b-anticyclotomic-formulation-comparison).

## Source corrections and version boundaries

Source issue IDs are local to each part: `HE.0/E1` and `HE.7s/E1` are different records. The packets retain the original IDs, printed wording, search history and review evidence. The correction and scope below are reproduced without broadening an erratum to an unacquired version.

### HE.0/E1: error

[Wei Zhang, Selmer groups and the indivisibility of Heegner points](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Published Lemma5.1(1), pp.222–223; PDF32–33, version of record.

Require ℓ≠p in part(1) and in the displayed dim H¹=2 dim H⁰ formula. At ℓ=p the local Euler characteristic contributes dim_Fp V (with the coefficient-field scaling), and the vanishing equivalence is false.

**Reason and scope.** The proof itself says “Since ℓ≠p”. For a self-dual two-dimensional residual module over Q_p, local Euler–Poincaré and Tate duality give dim_k H¹=2 dim_k H⁰+2. Thus H⁰=0 gives dimension two, not zero. The rank-lowering application uses the lemma only at additive primes ℓ²|N+, all different from p; its argument is unaffected.

**Affects:** a stated result. **Known:** new. **Recorded verification:** confirmed.

### HE.0/E2: error

[Wei Zhang, Selmer groups and the indivisibility of Heegner points](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Published Lemma6.3 proof, p.228; PDF38 rendered and read, version of record.

Decomposition invariants do not force inertia invariants to vanish. For the application at split additive primes, use V^G_Kℓ=0 and the finite-residue cohomology exact sequence: the connected subgroup’s Frobenius invariants vanish, hence so do its coinvariants/H¹, giving vanishing of the component-group invariants.

**Reason and scope.** As a local diagnostic, the unramified quadratic twist of a Tate curve over Q_7 with parameter of valuation five has mod-five inertia trivial and Frobenius eigenvalues −1,−7, neither equal to one. Therefore V^G_Q7=0 but V^I7=V≠0. Over the unramified quadratic extension its I_5 component group is constant of order five. The intended application in §7.2 is at split additive places, where the repaired G_Kℓ/finite-residue argument applies. No claim that this local diagnostic by itself is a globally constructed newform satisfying all standing hypotheses is made.

**Affects:** the proof. **Known:** new. **Recorded verification:** confirmed.

### HE.0/E3: misprint

[Ilya Khayutin, Joint equidistribution of CM points](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), Published Definition2.4(2) and Remark2.5, p.166; PDF22.

The stated Euclidean area-squared definition gives D∞=π² for the unit disc. Either retain π² or explicitly normalize by π².

**Reason and scope.** The area of the closed Euclidean unit disc is π. Its squared area is π². The local-different/discriminant comparison in this packet retains the stated normalization rather than silently replacing it.

**Affects:** nothing. **Known:** PAPER-KHAYUTIN-19/E7, confirmed by REV-PAPER-KHAYUTIN-19 in the existing extraction.. **Recorded verification:** confirmed.

### HE.0/E4: misprint

[Ilya Khayutin, Joint equidistribution of CM points](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), Published Remark2.7 p.167 and class-group action p.165; PDF21/23.

Use g_v O_v× g_v⁻¹ ∩ T̃(Q_v) for the unit stabilizer; use the covering torus T̃ in the associated finite adelic quotient, with S={∞}.

**Reason and scope.** The printed intersection contains the scalar prime but not its inverse, so is only a monoid. Its unit subgroup is the compact open stabilizer required for the ideal-class quotient.

**Affects:** nothing. **Known:** PAPER-KHAYUTIN-19/E8, confirmed by REV-PAPER-KHAYUTIN-19 in the existing extraction.. **Recorded verification:** confirmed.

### HE.0/E5: error

[Ilya Khayutin, Joint equidistribution of CM points](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), Published §5.2, Lemma5.8 and Remark5.9 p.184; also arXiv:1710.04557v3, PDF p.36.

Use the discriminant ideal/norm valuation equality, or |Nr 𝒟v|_v=|Dv|_v. An arbitrary generator of the different does not have exact algebraic norm equal to the positive local discriminant.

**Reason and scope.** Over Q_3×Q_3 let Λ={(a,b)∈Z_3²:a≡b mod3}. The basis (1,1),(3,0) has trace discriminant 9. The different is (3,−3)Λ, with generator norm −9. Every other generator is (3,−3)u with u∈Λ×; Nr(u)≡1 mod3, so no such generator has norm +9. This strengthens the diagnostic already in HE.0/local-different-discriminant. Principal invertibility and the ideal/absolute-value comparison remain valid.

**Affects:** a stated result. **Known:** new. **Recorded verification:** confirmed.

### HE.0/E6: misprint

[Benedict H. Gross, Kolyvagin’s work on modular elliptic curves](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Published Proposition8.1(2), printed p.248, scanned article version of record.

Replace the equation reference (2.3) by (7.3), the local Tate pairing defined on p.247.

**Reason and scope.** Proposition2.3 on p.238 is the global Selmer-generation theorem and defines no pairing. Equation(7.3), explicitly used in Proposition7.5 and §8, is the intended local Tate pairing.

**Affects:** nothing. **Known:** new. **Recorded verification:** confirmed.

### HE.0/E7: misprint

[Jan Nekovář, The Euler system method for CM points on Shimura curves](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), Author preprint dated23 May2007, §7.2.1, PDF p.44; scope is this 53-page preprint, not the uninspected published version.

Replace 5.2 by 5.12, the proposition defining the bounded local component errors.

**Reason and scope.** Section5.2 defines the strong auxiliary prime set S1(M). Proposition5.12 on p.30 introduces C1,v(p) and its almost-all vanishing. Section7.2.1 immediately applies Proposition5.12 to the corrected classes.

**Affects:** nothing. **Known:** new. **Recorded verification:** confirmed.

### HE.0/E8: misprint

[Wei Zhang, Selmer groups and the indivisibility of Heegner points](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Published Lemma8.4 proof, printed p.239, final opposite-eigenspace argument, version of record.

Both displayed detector subscripts are ℓ_{2ν+1}, the prime just re-chosen in the preceding sentence.

**Reason and scope.** The preceding dimension count kills loc_{ℓ_{ν+i}}d for1≤i≤ν. For ν≥1 this includes ℓ_{ν+1}, so the printed nonvanishing there contradicts that choice. Lemma8.1 instead re-chooses ℓ_{2ν+1} to detect both d and c(n_{ν+1}); pairing with c(n_{ν+1}ℓ_{2ν+1}) supplies the one surviving local term. At ν=0 the two indices coincide.

**Affects:** nothing. **Known:** new. **Recorded verification:** confirmed.

### HE.0/E9: error

[Wei Zhang, Selmer groups and the indivisibility of Heegner points](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Proof of Theorem7.1, third bullet, printed p.232 (PDF42), version of record; the theorem, printed p.231, is stated for p≥3.

Delete the step. The implication is false at p=3, and at p=5 it does not follow from the residual image when the coefficient ring O_𝔭 is ramified over Z_5. The condition is not needed: by Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL₂ (arXiv:1407.1093v1), §2.5, integrality in the Skinner–Urban main conjecture needs only (a) ρ̄ irreducible and (b) an element g of Gal(Q̄/Q(μ_p∞)) with T/(ρ(g)−1)T free of rank one, and the third hypothesis of Theorem7.1 gives (b) with g a generator of tame inertia at ℓ. Skinner’s TheoremB is the resulting rank-zero formula for a weight-two newform with coefficients O and p≥3, which is what this proof needs for A and its twist.

**Reason and scope.** p=3: Elkies, Elliptic curves with 3-adic Galois representation surjective mod 3 but not mod 9 (arXiv:math/0612734), gives a genus-zero modular curve of such elliptic curves over Q; the simplest are y²=x³−27x−42 of conductor 1944 and y²+y=x³−135x−604 of conductor 6075. The LMFDB lists 1944.f1, with coefficients [0,0,0,−27,−42], with 3-adic image 9.27.0.1, of index 27 in GL₂(Z₃). Its determinant is surjective, so the image meets SL₂(Z₃) in a subgroup of index 27, while its reduction modulo 3 is GL₂(F₃). These curves have additive reduction at 3, so they refute the implication and are not themselves instances of Theorem7.1; no curve meeting all three hypotheses at p=3 was looked for. p=5: the binary icosahedral group, of order 120, has a faithful two-dimensional representation with character field Q(√5) which is realised over Q₅(√5), because the icosian quaternion algebra over Q(√5) is ramified only at the two real places. It stabilises a lattice, so it lies in SL₂(Z₅[√5]) after conjugation. The kernel of reduction modulo √5 is a normal 5-subgroup, hence trivial, so the group maps isomorphically onto SL₂(F₅). Being finite, it contains no conjugate of SL₂(Z₅). This is an example of closed subgroups, not of a Galois image. The general lifting theorem (Manoharmayum, arXiv:1304.1196v2, Main Theorem) excludes residue field F₅ for 2×2 matrices and gives the implication for p≥7; for O_𝔭=Z_p and p≥5 it is Serre’s lemma. Zhang applies Theorem7.1 to level-raised forms, whose coefficient rings are not specified (proof of Theorem7.2, p.233), and Theorem1.1 allows p=5, so its proof needs the same replacement there. The statements of Theorems1.1 and 7.1 are not in question.

**Affects:** the proof. **Known:** new. **Recorded verification:** not independently recorded in this source-issue entry.

### HE.0/E10: gap

[Wei Zhang, Selmer groups and the indivisibility of Heegner points](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), Theorem7.1, statement, printed p.231 (PDF41), with Notations (i) p.200 and (x) p.202; version of record.

Add the hypothesis p∤D_K, as Theorems1.1, 9.1, 9.3 and 10.2 have it (“p∤D_KN”). The Notations assume (p,N)=1 and (D,N)=1 only.

**Reason and scope.** The proof applies the rank-zero formula to A and to its quadratic twist A^K separately. The twist g^K has level N·D_K². If p divides D_K, this level is divisible by p² and g^K is not ordinary at p, so the theorems of Kato and Skinner–Urban that the proof cites do not apply to it. The main theorems of the paper assume p∤D_KN.

**Affects:** a stated result. **Known:** new. **Recorded verification:** not independently recorded in this source-issue entry.

### HE.7s/E1: misprint

[Ashay Burungale; Francesc Castella; Giada Grossi; Christopher Skinner, Non-vanishing of Kolyvagin systems and Iwasawa theory](https://arxiv.org/pdf/2312.09301v2), Introduction(disc), arXiv v2 p.1; same text in linked author copy dated 2 January 2026 p.1; journal wording unverified

Here discriminant is −D_K<0, so the positive D_K should be excluded from 3. Equivalently use signed discriminant D_K<0 and exclude −3 consistently.

**Reason and scope.** The preceding line declares −D_K<0; D_K=3 otherwise passes the printed exclusion although the six-unit field Q(√−3) is the excluded exceptional case. Later sections switch to signed discriminant notation.

**Affects:** nothing. **Known:** new. **Recorded verification:** confirmed.

### HE.7s/E2: misprint

[Francesc Castella; Takamichi Sano, On refined nonvanishing conjectures by Kurihara and Kolyvagin](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Lemma 3.1.1, author manuscript20 January 2026 / arXiv2601.14504v1, §3.1

Require I_n ⊂ p^mℤ_p, equivalently M(n)≥m, so the finite coefficient class reduces to modulo p^m.

**Reason and scope.** I_n=(p^M(n)). The quotient map ℤ_p/I_n→ℤ_p/p^m exists exactly when M(n)≥m. For M(n)=3,m=1 the printed membership fails although the map exists; for M(n)=1,m=3 membership holds but the required quotient map does not exist. Compare BCGS Lemma 1.1.5.

**Affects:** nothing. **Known:** new. **Recorded verification:** confirmed.

### HE.7s/E3: gap

[Ashay Burungale; Francesc Castella; Giada Grossi; Christopher Skinner, Non-vanishing of Kolyvagin systems and Iwasawa theory](https://arxiv.org/pdf/2312.09301v2), Theorem 2.2.2, Proposition 2.2.1, Lemma 2.2.4 and proof, arXiv2312.09301v2 pp.17–19; same mismatch in linked author copy; publisher text unverified

Supply the uniform stub lemma at p=3, or restrict this proof route to p>3. No counterexample to Theorem 2.2.2 at p=3 is claimed.

**Reason and scope.** Theorem 2.2.2 imports the setting of Proposition 2.2.1. Its proof invokes Lemma 2.2.4 twice to identify the uniform stub index, without disposing of p=3. The cited lemma has an explicit stronger prime assumption.

**Affects:** the proof. **Known:** new. **Recorded verification:** confirmed.

## Process-layer disposition and cross-part audit

HE.7s contributes source inventory and imports the reviewed HE.7 integral CM/dyadic/arithmetic nodes. Rubin 1987 is still an acquisition gap; its title supplies no dyadic theorem. HE.8c contributes the hypothesis matrix and the source/conductor conventions integrated above. Their process coverage remains `source_decomposed`, not mathematical closure. Removing these stages and correcting the duplicated early/late README extraction requires the maintainer’s restructuring decision.

The combined fine-node graph has 138 distinct IDs. All cross-part Heegner prerequisites resolve to a node in these packets; no coarse Heegner stage prerequisite needed replacement. Exact cross-part imports are enumerated in the handoff. External stages remain explicit supplier contracts and are not assumed implemented.

The namespace split is intentional: finite-level APIs are `TauCeti.Heegner`; the ordinary continuation is `TauCeti.Heegner.Anticyclotomic`. Five promoted theorem nodes reuse their named parent API. One import block and one standard note introduce the assembled Lean file. The admitted prototype, packet catalogue and mathematical ownership boundaries must be reviewed together before implementation.
