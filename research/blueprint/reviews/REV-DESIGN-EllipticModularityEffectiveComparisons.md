# Independent review: effective residual comparisons

Refs #1722. Review job `REV-DESIGN-EllipticModularityEffectiveComparisons`. Reviewer: Codex, GPT-6; session `codex-ekRxmY`; 6 October 2026. The design being reviewed is issue #1691, submitted by a different session, `codex-ZBrI6D`.

**Verdict: accepted as a planning submission, with the recorded gaps open.** Every node is verified, corrected or added and justified at the stated planning boundary. This accepts the mathematical specifications and their explicit acquisition obligations; it does not certify the unacquired proofs or computations. All six stages are planned, none closed, and every implementation status remains `unchecked`.

The final packet has 100 nodes: 8 definitions, 1 comparison, 78 lemmas and 13 theorems; 27 API items, 29 tests, 15 planets and 20 positive baseline citations. The review has 19 `verified`, 80 `corrected`, 1 `added`, and no `unverifiable` entries. Most corrections replace hypothesis fields that repeated their conclusions or imposed irrelevant normalized-newform assumptions. Nine gap groups and 33 supplier requests remain open. All three source findings are independently confirmed against the specified versions.

## Mathematical corrections

1. **Inputs are not conclusions.** Replaced conclusion-shaped hypotheses and unrelated boilerplate with actual parameters and side conditions. In particular, the character parameter is `t=gcd((r−1)/2,6)`; the allowed fractional residues belong to `k`. The F_(3^12) trace list is `{658,−1358,1458}`. Removed the extra, incorrect `−1458` from its hypotheses.
2. **Residual conductor and deletion level.** Retained the explicit good-reduction or multiplicative/divisible-valuation hypothesis in the `M0=N` adapter for ell≥5. Kraus §3.1, p.1143 derives the reduction alternative from Serre weight two for ell≥11. It is not imported as a blanket assertion at ell=5,7. Those primes need the displayed additional hypothesis or a separate case audit. The Kraus endpoint, stated directly in terms of the full residual conductor N, retains ell≥5.
3. **Additive inertia.** Separated potentially good additive reduction, with finite inertia of order dividing 24, from potentially multiplicative additive reduction, where a ramified quadratic Tate twist has a unipotent part. The full Artin/Swan comparison remains requested. Removed the away-from-ell use of `R07.5/multiplicative-torsion-inertia`, whose statement is at residue characteristic ell; used the existing elliptic local-field owner and its explicit request instead.
4. **Direct proof dependencies.** Added μ*μ inversion directly to the native dimension comparison; full good/bad Hecke recurrence directly to finite-prime rationality; and Manin–Drinfeld directly to the Cartan point-torsion argument. Added the existing norm-nonzero theorem to integer norm divisibility. Added the existing Minkowski ideal-class representative bound to Mazur’s half-character argument. Requested the global triviality of finite characters unramified at every finite prime from ClassFieldTheory Layer13; local Raynaud inertia does not supply this global step.
5. **The winding curve.** Replaced ambiguous `X0^+(rp²)` by `X0(rp²)/w_(p²)`: the source involution is at p, fixing the r-level structure. Clarified the full-new projection, the order-p cuspidal boundary divisor, and the characteristic-q coefficient-support/degeneracy lemma needed for cotangent immersion. Darmon–Merel’s r=2,3 proof does not silently certify the r=5,7,13 extension or the higher-dimensional rank-zero input.
6. **Data versus geometric theorems.** The polynomial definition now only defines the five integer polynomials; the existing `genus-zero-j-map` proves their modular interpretation. The finite integer divisor set now only defines the candidates. Added `EC.5/integral-j-characterisation`, marked `addedBy` this review, to identify the candidates with integral j-values of actual rational modular points. The surjectivity endpoint directly depends on this comparison. Its unavailable geometric Lean signature is honestly listed in the boundary audit.
7. **Filters beyond the finite cutoff.** Explained why the product over all primes dividing 2N agrees through the tested coefficient range with Kraus’s product over small primes: extra rescalings begin above that range, and their levels still divide lcm(N,4).
8. **Locators.** Fixed the malformed rational-form realization locator to pp.1143,1145; the four-count/two-isogeny arguments to p.1146; the finite Eisenstein quotient to Mazur’s Corollary4.4 proof on p.145 and its earlier Eisenstein theorem; cusp formal immersion to Proposition3.1 pp.142–143; the minimal composite-level guide to pp.5–6; and the full-two irreducibility use to Bennett–Siksek pp.361–362. Proposition2.1 alone does not supply a finite Eisenstein quotient.

The roadmap’s embedded reader and stage suppliers are updated: EC.3 directly lists the elliptic local-field layer and EC.4 directly lists global ClassFieldTheory Layer13; the reader’s Requires lists match the stage records. The separately stored reader is outside this review issue’s deliverable list and was not edited; any future synchronization should use the corrected packet and embedded reader, especially the low-prime adapter and global character supplier. The suggested file’s boundary now lists all 75 omitted geometric signatures with their current direct prerequisites. Its 25 native packet-node signatures, all eight definitions, all 27 API signatures and all 29 named tests match the packet.

## Sources and version control

I retrieved the nine public PDFs listed below and matched their SHA-256 digests to the design packet. I checked every original excerpt against the extracted source and read the statements and arguments at the relevant locators. The node audit below records which computations were reproduced and which source proof obligations remain explicitly unacquired. No inference from a secondary list is treated as an original Kenku descent certificate.

- [Greg Martin: Dimensions of the Spaces of Cusp Forms and Newforms on Γ0(N) and Γ1(N)](https://arxiv.org/pdf/math/0306128v1). arXiv:math/0306128v1, 6 June 2003. SHA-256 `844017dec299d575ee49f731b7ae6ec27be03d76bf6463bc428b9e9b49c0a8d4`. Relevant reading: Definitions 1A–1F and Theorems 1–2, pp.2–3; complete §2 proof of Theorem 1, pp.7–9, including Proposition 12 and divisor convolution; complete §4, Lemmas 16–22 and Theorem 2, pp.14–16.
- [Michael A. Bennett and Samir Siksek: A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Annals of Mathematics 191 (2020), 355–392, published version. SHA-256 `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf`. Relevant reading: Complete §2, pp.358–360, Theorem 3, Lemmas 2.1–2.2 and Kraus thresholds; §3 uses of the two irreducibility cutoffs. Printed p.360 formulas visually inspected against the publisher PDF.
- [Alain Kraus: Majorations effectives pour l’équation de Fermat généralisée](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/div-class-title-majorations-effectives-pour-l-equation-de-fermat-generalisee-div.pdf). Canadian Journal of Mathematics 49 (1997), 1139–1161, published version. SHA-256 `d235ed8bba1c21618ade20f3e4a387846c641e730c3e981936056b10cfdc4ab6`. Relevant reading: §1 threshold definitions, p.1141; complete §3.1–3.3, Théorèmes 3–4 and their proofs, pp.1143–1146; Appendix II Proposition 1, Proposition 2, corollary and proof, pp.1158–1160. Applications to generalized Fermat outside the roadmap targets are not included.
- [Barry Mazur: Rational Isogenies of Prime Degree](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf). Inventiones Mathematicae 44 (1978), 129–162, published version. SHA-256 `f3da9ef0d3d184225c4799951897be7b90d8b25050c5d508b69aeff70fd2ead3`. Relevant reading: Introduction and Theorems 1–2; §2 Proposition 2.1, §3 Proposition 3.1, §4 formal-immersion argument and Corollary 4.4; §§5–6 isogeny-character and Frobenius constraints; complete §7 Theorem 7.1 proof, pp.153–155. The earlier Eisenstein-quotient paper and class-number-one proofs cited therein have not been independently read.
- [Pedro Lemos: Serre’s uniformity conjecture for elliptic curves with rational cyclic isogenies](https://arxiv.org/pdf/1702.01985v2). arXiv:1702.01985v2, 8 March 2017; published Trans. AMS 371 (2019), 137–146. SHA-256 `ce889428aa4d6cbe1f30fcb504591063927fdaa96baa1bdf598596bbc02bd043`. Relevant reading: Complete eleven-page v2 preprint: introduction, §2 and all of §3, including Proposition 2.2, Theorems 2.3 and 1.4, Propositions 3.1–3.2, local j-polynomials and finite j-lists. Publisher PDF could not be retrieved; the preprint/published collation and certified residual-image computations remain gaps.
- [Henri Darmon and Loïc Merel: Winding quotients and some variants of Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Research/18.Merel/paper.pdf). Author-hosted 27-page version, dated 9 September 2007; journal version J. reine angew. Math. 490 (1997), 81–100. SHA-256 `5303095ca3a90b05d8b36d45d9e0e56c1e38941dc1bb706999ab84381da40292`. Relevant reading: §§6–8, especially Theorem 6.1 (Chen isogeny), Propositions 7.1–7.2 (winding quotient), and Lemmas 8.2–8.3 (formal immersion and torsion). The original theorem has r=2 or 3; extending its argument to all r in {2,3,5,7,13} is the separate Lemos obligation.
- [Barinder S. Banwait, Filip Najman and Oana Padurariu: Cyclic isogenies of elliptic curves over fixed quadratic fields](https://arxiv.org/pdf/2206.08891v3). arXiv:2206.08891v3, 20 February 2026. SHA-256 `6e8b39195db606f35d7b1a513575cf18dc225ebe1fcbcf182c09f046ba855d9e`. Relevant reading: §§1–2: primary account of the rational cyclic-isogeny classification and the minimal-positive-genus-level strategy, with original Mazur and Kenku references. This is an inspected guide to the composite-degree proof, not independent certification of the original Kenku calculations.
- [Jean-Pierre Serre: Quelques applications du théorème de densité de Chebotarev](https://www.numdam.org/article/PMIHES_1981__54__123_0.pdf). Publications Mathématiques IHÉS54 (1981), printed pp.323–401; archive pagination123–201. SHA-256 `bfcda9821742b02801e4f1264750aebeb656141fbd53fb61b8662333e1491830`. Relevant reading: Complete §8.4 Lemmas15–18 and 18′, printed pp.396–398 (archive196–198), including all three potentially-good formal-group cases. The GRH-dependent Lemma 19 and Theorem 22 are not imported.
- [Yuri Bilu, Pierre Parent and Marusia Rebolledo: Rational points on X0^+(p^r)](https://www.numdam.org/item/10.5802/aif.2781.pdf). Annales de l’Institut Fourier63 (2013),957–984, published version. SHA-256 `af4294b085f9fca6a4536c861438456d974ebc4e947137340f89e28caf7173dc`. Relevant reading: Theorem 1.1 and the split-normalizer identification; complete §4, Theorem 4.1 proof; complete §5, formal-immersion/Heegner–Gross criterion, resultants, algorithms and Proposition 5.9, pp.970–979. §6, tables and complete algorithm pseudocode, pp.980–982, read as source data. §3 height theorems remain named inputs; no finite sieve was independently re-executed.

Source findings:

- **E1 confirmed, preprint only.** Lemos v2, p.5 calls the Jacobian of X0(37) rank zero. The quotient X0^+(37) is `y²+y=x³−x`; [Elkies’s original modular-function computation](https://people.math.harvard.edu/~elkies/xisog.pdf), equation(99), p.41 identifies it, and p.42 records its rank. Independently counted good reductions at 2 and 3: 5 and 7 points. Prime-to-residue torsion injection at these two primes forces rational torsion to be trivial; `(0,0)` is nontorsion. The quotient therefore gives Jacobian rank at least one. This review’s LMFDB request returned a browser challenge; confirmation uses the primary quotient computation and exact counts. The finite j-table needs its stated point-completeness theorem, rather than the false rank claim.
- **E2 confirmed, preprint only.** Lemos v2, p.8 says pullback and pushforward preserve divisor degrees. Pullback along the degree-p map multiplies degree by p; both maps preserve degree zero, which is all the Jacobian construction needs.
- **E3 confirmed, published text.** Bennett–Siksek p.358 describes `ord_q` as the largest prime power. The deletion condition and Tate extension use the largest integer exponent. This is a notation misprint; the roadmap and supplier use the valuation exponent.

The publisher version of Lemos remains uncollated: the design could not retrieve the AMS PDF, and this review does not claim these sentences occur in the version of record. The Darmon–Merel locators are the 27-page author version, not the shorter journal pagination.

## Exact-pin baseline audit

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration below was read with its ambient variables, namespace and hypotheses at that exact commit. No positive baseline was removed. Two existing Mathlib results were added: norm nonvanishing and the Minkowski bound. The discarded near miss is a supplier-node use, not a positive baseline citation.

| Declaration | Module and supplied interface |
| --- | --- |
| `mathlib:Nat.factorization` | [Mathlib/Data/Nat/Factorization/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Factorization/Defs.lean). Finite prime-exponent function, with support the existing primeFactors finset. |
| `mathlib:Nat.prod_factorization_pow_eq_self` | [Mathlib/Data/Nat/Factorization/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Factorization/Defs.lean). For N nonzero, the product of prime powers in its factorization is N. |
| `mathlib:Algebra.norm_eq_prod_embeddings` | [Mathlib/RingTheory/Norm/Transitivity.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Transitivity.lean). Norm as product over algebra embeddings into an algebraically closed field, for a finite separable extension. |
| `mathlib:Algebra.isIntegral_norm` | [Mathlib/RingTheory/Norm/Transitivity.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Transitivity.lean). An algebra norm of an integral element remains integral over the smaller base in the stated scalar tower. |
| `tauceti:TauCeti.cuspFormsNew` | [TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean). The actual new submodule of cusp forms on Gamma1(N), not the trivial-character space. |
| `tauceti:TauCeti.cuspFormsNew_inf_cuspFormCharSpace` | [TauCeti/NumberTheory/ModularForms/Newforms/Nebentypus.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Nebentypus.lean). The newspace at a fixed nebentypus is the intersection with its native character subspace. |
| `tauceti:TauCeti.cuspFormCharSpaceOneEquiv` | [TauCeti/NumberTheory/ModularForms/TrivialNebentypus.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/TrivialNebentypus.lean). The actual linear equivalence from trivial-character Gamma1 cusp forms to Gamma0 cusp forms, for nonzero level. |
| `mathlib:Ideal.absNorm_mem` | [Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean). The natural absolute norm, cast to the infinite Dedekind domain, belongs to the ideal. Pulling back along the integer map gives the rational-prime divisibility used here. |
| `mathlib:Ideal.absNorm_dvd_norm_of_mem` | [Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean). For a Dedekind domain finite free over Z and x in I, the integer cast of absNorm(I) divides Algebra.norm Z x. |
| `mathlib:Algebra.coe_norm_int` | [Mathlib/NumberTheory/NumberField/Norm.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Norm.lean). For x in the ring of integers of a number field, its Z-module norm, cast to Q, equals the field norm of its image. |
| `mathlib:card_algHom_le_finrank` | [Mathlib/LinearAlgebra/FreeModule/Finite/Matrix.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Finite/Matrix.lean). For a finite free K-algebra M and a domain K-algebra L, Nat.card(M →ₐ[K] L) is at most finrank K M; no normal extension hypothesis is required. |
| `mathlib:Nat.totient_eq_mul_prod_factors` | [Mathlib/Data/Nat/Totient.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Totient.lean). The exact rational Euler product (φ(N):Q)=N∏_{p in N.primeFactors}(1−p⁻¹), including the total zero convention. |
| `mathlib:ArithmeticFunction.moebius` | [Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean). The integer-valued native Möbius arithmetic function; μ(n)=0 at nonsquarefree n and (−1)^ω(n) otherwise. |
| `mathlib:ArithmeticFunction.moebius_apply_prime_pow` | [Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean). For prime p and k≠0, μ(p^k)=−1 when k=1 and 0 otherwise. |
| `mathlib:ArithmeticFunction.moebius_mul_coe_zeta` | [Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean). In the integer-valued Dirichlet arithmetic-function ring, μ times the integer lift of ζ is 1. |
| `mathlib:ArithmeticFunction.sigma` | [Mathlib/NumberTheory/ArithmeticFunction/Misc.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ArithmeticFunction/Misc.lean). The arithmetic function σ_k(n)=∑_(d\|n)d^k, zero at n=0. |
| `mathlib:ArithmeticFunction.sigma_zero_apply` | [Mathlib/NumberTheory/ArithmeticFunction/Misc.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ArithmeticFunction/Misc.lean). σ_0(n) equals the cardinality of n.divisors. |
| `tauceti:TauCeti.ModularForm.eq_of_sturm_bound` | [TauCeti/NumberTheory/ModularForms/SturmBound.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/SturmBound.lean). For complex weight-k forms on G with discrete strict periods, equality of all coefficients through (k·Nat.card(SL2Z/G∩SL2Z)).toNat/12 gives equality, at the actual strict cusp width. This is characteristic zero, not a prime-power-ideal congruence theorem. |
| `mathlib:Algebra.norm_ne_zero_iff` | [Mathlib/RingTheory/Norm/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Basic.lean). For domain R and domain S with S finite free as an R-algebra, Algebra.norm R x is nonzero iff x is nonzero. Apply to the actual finite-free ring of integers over Z; no residual or modular assumption is supplied. |
| `mathlib:NumberField.exists_ideal_in_class_of_norm_le` | [Mathlib/NumberTheory/NumberField/ClassNumber.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/ClassNumber.lean). For a number field K and C in ClassGroup(O_K), there is a nonzero integral ideal representing C with absolute norm at most (4/π)^r₂ · n!/n^n · sqrt(\|discr K\|). The half-character application must separately identify the actual imaginary quadratic field, its discriminant −r and signature; the global class-number-one classification is not supplied. |

The native Γ1 newspace, character intersection and trivial-character equivalence are three distinct interfaces. Neither the whole Γ1 dimension nor characteristic-zero Sturm equality is substituted for a Γ0 newspace dimension or an arbitrary-prime-power coefficient congruence. Norm lemmas use the actual finite-free ring of integers and canonical scalar tower. Minkowski’s native bound is general; the exact quadratic discriminant/signature adapter and global class-number-one theorem remain separate obligations.

## Ownership, closure and stage targets

Read the relevant full upstream sections in `content/tau-ceti/EllipticCurves/README.md` (Layers1–5) and `content/tau-ceti/ModularForms/README.md` (Layers3–4,8,8G,10). Checked the reviewed library audit and every directly cited supplier-node statement, including actual conductor conventions, trivial character, dimension, Tate/cohomology Frobenius duality and local residue-characteristic restrictions. The newly requested global character statement uses ClassFieldTheory Layers11–13, which were read; Layer13 is not built in the audit.

All six stage targets have nodes. EC.0 owns the applied Martin formula/bound and numerical case splits, consuming upstream newforms/dimension machinery. EC.1 consumes exact R20.6 level-lowering exports. EC.2 defines the applied F/G/H thresholds. EC.3 uses the exact residual conductor, integral Sturm comparison and full-two selection. EC.4 owns the uniform isogeny restrictions, without feeding them back into the parent’s curve-by-curve R29.1. EC.5 keeps the rational cyclic-isogeny assumption throughout the Lemos endpoint. Generic local representations, Hecke algebras, modular curves, class fields, heights and isogenies remain with their existing owners.

The prerequisite graph is acyclic and ends in inspected baselines, exact supplier nodes, precise supplier requests or named gaps. Every definition has three or more discriminating tests; the factor table catches exceptional 2/3 rows, the thresholds catch the lcm convention, the filters catch bad-prime rows, and the finite j-set tests catch signed-divisor collisions. These are specifications, not implemented Lean tests. All 15 planets remain appropriate key definitions or central named theorems.

The nine gap groups deliberately remain open:

- **Native modular dimension comparison.** The complete Martin §2 proof is read. Formalize the actual trivial-character finite-dimensional newspace, full Gamma0 genus formula (ModularForms Layer 10C inside indexed Layer10), old/new τ multiplicities and μ*μ inversion. Exact arithmetic tests do not prove this modular comparison.
- **Integral and geometric residual interfaces.** The positive native norm and Sturm interfaces are read. Formalize the actual coefficient-ring/prime-above-ell tower, exact weight-two conductor lift, all-embedding Frobenius adapter, wild residual conductor comparison and the explicit coefficient-prime finite-flat local alternative before any M0=N application. The weight-two-to-semistable reduction implication used to infer M0=N is only asserted for ell≥11; ell=5,7 require the explicit reduction hypothesis or a separate low-prime case audit. The residual-conductor endpoint itself retains ell≥5.
- **Prime-power integral Sturm comparison.** Kraus AppendixII is read through its proof. The pinned complex Sturm equality does not supply coefficient congruence modulo an arbitrary prime-power ideal. Supply the integral Γ0 comparison and dyadic lattice/traces at lcm(N,4); request a Modular forms/Algebraic modular forms Part II for this wider coefficient-ring statement.
- **Mazur Eisenstein and class-number-one inputs.** Mazur 1978 §§2–7 are read; its earlier Eisenstein-ideal finite quotient proof and the global Heegner–Baker–Stark class-number-one proof are not acquired. These are required for finite-eisenstein-quotient and the half-character case. Generic optimal-quotient geometry belongs to a ModularCurves Part II; the global classification extends quadratic/CM arithmetic rather than being a list check. The generic Minkowski ideal-class representative bound is already Mathlib NumberField.exists_ideal_in_class_of_norm_le. What remains for its half-character application is the exact imaginary-quadratic ring-of-integers/discriminant adapter, splitting and the global class-number-one classification. The isogeny-character decomposition also requests the global triviality of finite characters unramified at every finite prime from ClassFieldTheory Layer13; local Raynaud inertia does not supply it.
- **Original Kenku and complete point tables.** The inspected primary strategy identifies each original reference. Acquire Kenku 1979 X0(39),1980 X0(169),1980 X0(65),X0(91),1981 X0(125), and the exact genus-one/prime tables and extension exclusions (including26,35,50). Decompose their descent certificates. ScienceDirect Kenku 1982 text retrieval was denied; no original Kenku proof is certified by this packet.
- **Chen isogeny and higher-dimensional winding quotient.** Read Darmon–Merel §§6–8 and Lemos full §3. Current ModularCurvesPartII newform quotients do not cover the prime-to-p Hecke-equivariant Chen isogeny, integral annihilator winding quotient and semistable cotangent injection. Current BSD.4 covers elliptic curves, not every modular abelian RM factor. Supply these Part II interfaces and the explicit winding boundary/nonvanishing calculation at r=5,7,13. The source quotient is X0(rp²)/w_(p²). Supply the nonzero order-p cuspidal boundary divisor (Darmon–Merel Proposition 6.5), the full-new projection, and the characteristic-q coefficient-support/degeneracy lemma. These are substantive inputs, not consequences of genus zero alone.
- **Quantitative split Cartan bounds and finite sieve.** Published Bilu–Parent–Rebolledo Theorem 4.1 and §5 proof/algorithm are read. Its precise integrality, Runge and Gaudron–Rémond inputs and the §6 class-polynomial/CRT sieve proof objects remain required. The qualitative isogeny theorem does not give its numerical constants. The source’s finite sieve has not been re-executed at 10^14 or formalized.
- **Exact j-map and residual-image certificates.** The five j-polynomials and signed-divisor sets are independently checked exactly. Acquire the source coordinate proofs (Birch pp.179–180, Dahmen p.54), full rational point tables and explicit non-CM curve models. Replace Lemos’s LMFDB checks by a certified bound for all exceptional primes, with local/isogeny/subgroup witnesses for every possible exception. A finite Frobenius sample cannot prove all p>37.
- **Published-version collation and native elaboration.** Lemos v2 is fully read, but the AMS publisher PDF retrieval is denied, so preprint-specific source findings require version-of-record collation. The full suggested file cannot elaborate in the available shared build because TauCeti.Newforms.Nebentypus has no prebuilt object at the recorded pins; do not build libraries or replace actual carriers. Mathlib-only arithmetic checks are separate.

## Validation and reproducibility

- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticModularityEffectiveComparisons.json --json`: zero errors and warnings, using the available pinned declaration index; 100 nodes, 20 baseline citations, six planned stages and zero closed stages.
- The source-issue schema and source-version checks pass, and all three review verdicts are `confirmed`.
- JSON parsing, exact one-review-entry-per-node coverage, API/test name correspondence, prerequisite/boundary synchronization and `git diff --check` pass.
- Re-executed both exact Python certificate blocks in [the design handoff](../handoff/DESIGN-EllipticModularityEffectiveComparisons.md). Checked the scripts against the source formulas before running them. They test 1547 small levels, 772 restricted composite cases, 505 small large-prime/gcd6 cases, 11250 tuples/10125 bounded-family levels, 2000 independent recursive old/new inversions and 30 large prime-power regressions. The second script checks all five numerator constants/degrees, signed-divisor images with cardinalities 25,13,8,6,4, actual nonsingular F₃/F₅ trace lists, twelve-power recurrences, prime-factor exclusions and the rank-witness counts. These computations do not prove the native dimension comparison or any rational-point/Galois-image completeness claim.
- Checked memory before compilation and ran only `lean-check`. Full suggested file: exit1 because the shared build lacks the prebuilt object for `TauCeti.NumberTheory.ModularForms.Newforms.Nebentypus`. Mathlib arithmetic portion: exit0 with only admission warnings. For that check, temporarily removed Tau Ceti imports, the `newDimension`/`dimension_comparison` block, `martin_bound`, and the F/G/H block with its nine examples from this same suggested file, then restored the full file. No alternative carrier, separate Lean project, library build, cache download or language server was used.

The finite split-Cartan sieve through 10^14 and the complete exceptional residual-prime certificates were not rerun. Their source pseudocode/claims were read, and their proof objects remain explicit gaps. Original Kenku, earlier Eisenstein, global class-number-one, j-coordinate and higher-dimensional analytic-rank-zero proofs are not retrospectively claimed acquired by this review.

## Node audit

IDs below abbreviate the common `EllipticModularityEffectiveComparisons:` prefix. The complete source records and direct prerequisites are in the packet. `Verified` includes a source statement whose acquisition/formal proof is honestly routed into a named gap; it does not mean that missing proof is certified complete.

| Node | Verdict | Independent check |
| --- | --- | --- |
| `EC.0/local-factors` | verified | Checked every Martin prime-power row, including the exceptional primes 2,3, parity and Möbius coordinate; the nonprime/zero-exponent conventions are explicitly extra totalization. |
| `EC.0/dimension-expression` | verified | The k=2 correction is Möbius, with empty-product value zero at level one; exact rational and recursively inverted genus calculations agree. |
| `EC.0/dimension-comparison` | corrected | Γ1 newspace alone is insufficient. The native character intersection/equivalence is correct; τ multiplicity and μ*μ inversion are direct inputs, with full Γ0 dimension comparison still an explicit gap. |
| `EC.0/product-estimates` | verified | Martin Lemma17 gives all five coordinate bounds prime by prime; the native totient and factorization statements supply the product comparison. |
| `EC.0/coarse-bound` | verified | Dropping the nonpositive cusp term and using \|v₂\|,\|v₃\|≤2^ω gives the coefficient 7 and constant 12 exactly. |
| `EC.0/prime-case` | verified | Checked all prime residue cases, including 2 and 3; equality is precisely the 11 mod12 case. |
| `EC.0/few-primes-large` | verified | Lemma19 uses φ(N)≤N−√N for composite N, then √N>39 with ω≤2; the strict inequality and cutoff 1521 agree. |
| `EC.0/few-primes-small` | verified | Re-executed all 772 composite cases through 1521 with at most two prime factors; only 35 attains equality. |
| `EC.0/sixth-power` | verified | Lemma20 uses φ(N)≤N−N/p and the lower bound N/p≥18·2^ω; the rational subtraction and margin 6 are correct. |
| `EC.0/two-large-primes` | verified | Lemma21 uses the two distinct prime factors exceeding 5 to control N/p versus 2^ω; the source margin is 9. |
| `EC.0/large-prime-near-six` | verified | Lemma22 and its estimates cover the gcd(N,6)>1 case with a prime >41 and N≥1548; the weak ≤N conclusion agrees. |
| `EC.0/small-prime-near-six` | verified | Re-executed all 505 finite cases with N<1548 and the stated gcd/large-prime restrictions. |
| `EC.0/bounded-family` | verified | Re-executed 11250 parameter tuples, yielding 10125 distinct levels; the minimum N−12g is 18. |
| `EC.0/martin-bound` | verified | The cases exhaust positive N: prime, at most two factors, sixth-power divisor, two primes >5, large-prime/gcd6 case, or bounded family. Equality is 35 or prime 11 mod12. |
| `EC.1/trace-gap` | verified | For p≥2, p+1−2√p=(√p−1)²>0 at the supplied embedding; either sign gives nonvanishing. |
| `EC.1/trace-norm` | verified | All complex embeddings are needed. Their absolute values are at most p+1+2√p=(√p+1)²; the native norm product gives exponent 2d. |
| `EC.1/removed-prime-bound` | verified | The exact deletion level and removed multiplicative-prime trace are supplied by inspected R20.6 nodes; the coefficient degree and real exponent give (M0+1)/6. |
| `EC.2/kraus-f` | verified | Visually checked the publisher formula and Kraus definition: square root of I(N)/6, then power 2g(N), with the actual trivial-character newspace. |
| `EC.2/kraus-g` | verified | The level is lcm(N,4). I(4)=6 and I(44)=72 give the tests; replacing it by 4N fails at N=4. |
| `EC.2/kraus-h` | verified | The maximum API and strict-threshold equivalence are sufficient for both forcing arguments; the three small-level values agree. |
| `EC.0/prime-power-convolution` | corrected | Read native integer μ and σ₀ at the pin; λ has values 1,−2,1,0 on prime powers and λ*τ=1 by μ*ζ=1. Hypotheses no longer assert this conclusion. |
| `EC.0/correction-convolution` | corrected | Martin equation16 computes the full-space terms convolved by λ; the weight-two constant contributes μ, not a freely chosen correction. |
| `EC.1/coefficient-orbit-degree` | corrected | Conjugate normalized forms at the same level and trivial character are independent. Layers8/8G supply the actual coefficient field and conjugates, not a degree guessed from a label. |
| `EC.1/prime-divides-integral-norm` | corrected | Ideal norm membership/divisibility and the Z-to-Q norm comparison use the actual ring-of-integers tower. Added the pinned norm_nonzero iff statement for x≠0. |
| `EC.1/removed-prime-degree-bound` | corrected | p∤M0 and the ±(p+1) congruence give a nonzero element in λ; the all-conjugate Weil estimate and integer norm divisibility yield the 2[K_f:Q] exponent. |
| `EC.1/real-exponent-bound` | corrected | The base √p+1 exceeds one; 2d≤(L+1)/6 turns the natural power into the stated real-power upper bound. |
| `EC.3/exact-weight-two-lift` | corrected | Kraus hypotheses are modularity, irreducibility and Serre weight two. Exact Artin level/trivial character need level and weight optimisation; merely stripping ell powers is insufficient. |
| `EC.3/rationality-from-small-primes` | corrected | Good/bad Hecke recurrences first give every coefficient through the Sturm cutoff, then all conjugate forms agree. Added the direct full recurrence supplier. |
| `EC.3/nonrational-witness` | corrected | Contrapositive of finite-prime rationality gives a small nonintegral coefficient; trivial-character bad coefficients ±1 or 0 exclude q\|N. |
| `EC.3/small-prime-below-f` | corrected | A nonzero normalized newform forces g≥1. Then B<(√B+1)²≤F(N), so a tested q cannot equal ell>F(N). |
| `EC.3/bounded-integer-trace-norm` | corrected | For a good elliptic trace use 4√q≤(√q+1)²; for a removed multiplicative prime use q+1+2√q. Nonintegrality of a_q makes the difference nonzero. |
| `EC.3/rational-coefficient-forcing` | corrected | The nonrational witness and actual good/removed-prime residual congruences force ell≤F(N), contradicting the strict hypothesis. |
| `EC.3/rational-form-elliptic-realization` | corrected | Inspected modular quotient dimension one, exact conductor and weight-two Tate decomposition statements. The geometric residual assertion additionally needs the actual lifting congruence and irreducibility. |
| `EC.3/kraus-rational-realization` | corrected | This combines exact lift, coefficient forcing and rational elliptic realization. It exports exact N, not the generally different deletion level M0. |
| `EC.3/local-mod-four-filters` | corrected | Checked all six dyadic/odd rows in AppendixII, the constant coefficient and coefficient-map API; X acts by rescaling, not by a Hecke operator. |
| `EC.3/odd-eisenstein-series` | corrected | The odd σ₁ series is a holomorphic weight-two form on Γ0(4), with constant term zero at infinity; it is not asserted cuspidal. |
| `EC.3/filtered-coefficients` | corrected | The Euler recurrences and filters yield the finite coefficient comparison at M=lcm(N,4). Added justification for including primes above the cutoff in the finite product. |
| `EC.3/prime-power-ideal-sturm` | corrected | Kraus AppendixII gives the arbitrary λ^m comparison. Native complex Sturm equality does not give it; the wider integral statement remains an explicit supplier gap. |
| `EC.3/finite-four-count-witness` | corrected | Contrapositive of the λ² congruence for rational coefficients gives a good odd witness below the lcm bound; odd bad coefficients ±1 satisfy the required local congruence. |
| `EC.3/small-prime-below-g` | corrected | For B≥0, (√B+1)²>B. This proves tested q≠ell without an unstated dimension assumption. |
| `EC.3/mod-four-trace-transfer` | corrected | At a good prime, \|a_q(E)−a_q(C)\|≤4√q<(√q+1)²<ell forces equality. At removed multiplicative primes the trace gap and bound exclude the bad alternative. |
| `EC.3/four-count-rational-two` | corrected | An order-three element of GL₂(F₂) would give a good prime with odd group order by Chebotarev. A subgroup without such elements fixes a nonzero two-torsion point. |
| `EC.3/four-count-full-two-selection` | corrected | The explicit two-isogeny has roots −a±2√b when b is square; if a²−4b is square the original curve already has full two-torsion. |
| `EC.3/kraus-full-two-realization` | corrected | Both thresholds are used, then an isogeny of degree one or two supplies full two-torsion. Odd ell preserves residual torsion and an isogeny preserves the exact conductor. |
| `EC.3/deletion-conductor-away` | corrected | Split potentially good finite inertia from potentially multiplicative quadratic Tate twists. Removed the residue-characteristic-ell R07.5 citation for an away-from-ell application; request full wild comparison and the correct Tate supplier. |
| `EC.3/deletion-level-exact-adapter` | corrected | The explicit reduction alternative removes the ell factor and gives M0=N. Kraus derives this alternative from weight two only for ell≥11; the 5,7 case is retained as a hypothesis/case-audit gap. |
| `EC.4/prime-isogeny-potential-good` | corrected | Mazur Cor4.4 uses a finite optimal Eisenstein quotient, cusp immersion and specialization rigidity. The exceptional residue characteristic 2 remains excluded. |
| `EC.4/isogeny-character-exponents` | corrected | Corrected the t/k mixup: t=gcd((r−1)/2,6), while k has the listed residues. Local Raynaud bounds need the separate global unramified-character triviality request. |
| `EC.4/isogeny-character-frobenius` | corrected | Kill finite inertia over a totally ramified extension, then raise Frobenius to the twelfth power. The unramified factor has order dividing 12. |
| `EC.4/small-frobenius-trace-list` | corrected | Re-executed nonsingular cubic point counts over F₃,F₅ and the degree-12 recurrence. The F_(3^12) list has three values; −1458 is not one of them. |
| `EC.4/isogeny-character-zero-case` | corrected | Exact q=3 and q=5 factor lists intersect only at 37 after the excluded small primes are removed. |
| `EC.4/isogeny-character-third-case` | corrected | Exact factorization for q=3 gives primes 2,3,5,11,17; the positive-genus range leaves 11 or 17. |
| `EC.4/isogeny-character-half-case` | corrected | Hasse forces small odd primes to be inert; the split prime above 2 is handled by explicit quadratic norms. Added the existing Mathlib Minkowski bound; quadratic specialization and global class-number classification remain gaps. |
| `EC.4/mazur-prime-isogeny-classification` | corrected | The five exponent cases (using duality) give the source prime list, together with the genus-zero primes. |
| `EC.4/minimal-composite-levels` | corrected | The divisibility/genus-zero reduction gives the listed 17 composite obstruction levels. Corrected the guide locator to pp.5–6; it is not proof of their rational point tables. |
| `EC.4/genus-one-isogeny-points` | corrected | The nine cardinalities agree with Mazur’s table; exact point-model/j-map completeness remains a recorded original-source acquisition obligation. |
| `EC.4/remaining-composite-cusps` | corrected | The five distinct Kenku inputs are explicit dependencies rather than one opaque classification citation. |
| `EC.4/composite-extension-exclusion` | corrected | Additional levels 26,35,50 and lifts of allowed prime/genus-one points are separate named obligations; their missing original certificates remain in the composite gap. |
| `EC.4/mazur-kenku-cyclic-degrees` | corrected | The exact list has no even degree >18; the proof depends on the prime classification and all finite point/lifting exclusions, which remain openly requested. |
| `EC.4/rational-two-times-prime` | corrected | A Galois-stable ell-line and the rational order-two subgroup have coprime orders, so their sum is a cyclic rational kernel of order 2ell. |
| `EC.4/full-two-cyclic-four` | corrected | The dual of one two-isogeny followed by the different quotient gives a nonbacktracking cyclic four-isogeny; taking the same subgroup would instead give [2]. |
| `EC.4/full-two-times-prime` | corrected | The odd-ell stable line transports across the two-isogeny, then combines with the cyclic four-kernel to give 4ell. |
| `EC.4/irreducible-one-two` | corrected | Reducibility would give an even cyclic degree 2ell>18, contradicting the full cyclic-degree classification. |
| `EC.4/irreducible-full-two` | corrected | Reducibility would give a cyclic degree 4ell>18; ell≥7 is the source’s uniform range. |
| `EC.5/large-prime-isogeny-cm` | corrected | The prime degrees 19,43,67,163 have only the geometric-CM possibilities. A nontrivial cyclic kernel descends to a prime-degree rational isogeny. |
| `EC.5/exceptional-projective-exclusion` | corrected | The source inertia lower bound exceeds 5 for p>37, whereas every element of A₄,S₄,A₅ has order at most 5. |
| `EC.5/split-cartan-exclusion` | corrected | The published large-prime bound and the finite sieve overlap and exhaust p>37; modular identification and exact certificates remain explicit requests. |
| `EC.5/proper-image-nonsplit` | corrected | Full determinant from the Weil pairing and Dickson classification, with Borel/exceptional/split cases excluded, give the nonsplit normalizer alternative. |
| `EC.5/nonsplit-potential-multiplicative` | corrected | A quadratic Tate twist has squared eigenvalues χ_p² and 1. Conjugate eigenvalues in the nonsplit Cartan force χ_p²=1, yielding q≡±1 and excluding q=p. |
| `EC.5/cartan-correspondence-kills-old` | corrected | The source quotient is X0(rp²)/w_(p²). Pullback/pushforward through the intersection sends p-old classes to X0(r), whose Jacobian vanishes. |
| `EC.5/winding-period-component` | corrected | The full-new quotient and actual winding period select eigencomponents with L(f,1)≠0; finiteness of their rational points is a separate higher-dimensional input. |
| `EC.5/winding-class-nonzero` | corrected | Darmon–Merel’s boundary argument and order-p cusp divisor establish r=2,3. Lemos’s r=5,7,13 extension needs the explicitly recorded boundary/nonvanishing proof. |
| `EC.5/finite-winding-quotient` | corrected | Requires the Hecke-compatible Chen isogeny and analytic-rank-zero theorem for every modular RM factor. The existing elliptic BSD.4 statement alone is insufficient and its extension is a gap. |
| `EC.5/cartan-cusp-residue` | corrected | Cusps have residue field Q(ζ_p)^+, not just a field of definition; good-prime Frobenius fixes a cusp only for q≡±1 mod p. |
| `EC.5/cartan-cusp-formal-immersion` | corrected | q≡±1 mod p gives q>r,3. Added the characteristic-q coefficient-support/degeneracy request; the source cotangent argument cannot use a complex-only level-drop theorem. |
| `EC.5/cartan-point-torsion` | corrected | Manin–Drinfeld makes Galois differences torsion; an integer multiple descends to finite A(Q). Added this direct L0 dependency and consumer request. |
| `EC.5/cartan-denominator-exclusion` | corrected | Nonsplit potential multiplicative reduction forces a denominator prime q≠p to satisfy q≡±1. Formal immersion and full unramified torsion injection give the contradiction. |
| `EC.5/integral-j-forcing` | corrected | The denominator theorem gives j∈Z[1/p], and potential good reduction at p gives p-integrality; together these imply j∈Z. |
| `EC.5/genus-zero-j-numerators` | corrected | The five monic polynomials, constants and degrees agree with the table and exact computation. Removed the geometric j-map assertion from this data definition. |
| `EC.5/genus-zero-j-map` | corrected | The actual modular coordinate theorem is separated from the table; the unacquired coordinate proofs are an explicit gap, not consequences of polynomial arithmetic. |
| `EC.5/integral-parameter-divisibility` | corrected | Write t=a/b in lowest terms. Monicity makes the homogeneous numerator coprime to b, so integrality forces b=1; reduction mod a then gives a\|f(0). |
| `EC.5/finite-integral-j` | corrected | Signed divisor evaluation gives exactly the finite integer candidate sets, with cardinalities 25,13,8,6,4. Removed the geometric assertion into a new comparison lemma. |
| `EC.5/quadratic-twist-surjectivity` | corrected | For p≥5, twisting preserves surjectivity. On full GL₂ the possible quadratic character factors through determinant, and g↦ψ(g)g preserves determinant and is involutive. |
| `EC.5/large-isogeny-j-table` | corrected | The seven listed j-values agree with Lemos; only −2^15 is geometric CM. The false rank-zero sentence for X0(37) is not used as point completeness. |
| `EC.5/large-isogeny-image-certificates` | corrected | The all-p>37 statement is Lemos’s database-dependent step; a certified bound and every exceptional-prime exclusion remain in the explicit gap. A finite Frobenius sample does not prove it. |
| `EC.5/small-isogeny-image-certificates` | corrected | The finite divisor candidate domain is checked exactly; complete residual-image certification for all p>37 remains a separate recorded obligation. |
| `EC.5/lemos-surjectivity` | corrected | The restricted non-CM cyclic-isogeny theorem is exactly the source endpoint. Added the direct integral-j characterization prerequisite; generic Serre uniformity is not asserted. |
| `EC.3/four-count-square-classes` | corrected | If neither square class is trivial, Chebotarev supplies a good prime where both are nonsquares (also when the classes coincide); counting the two-torsion fibre gives order 2 mod4. |
| `EC.4/kenku-39-cusps` | corrected | The inspected primary rational-isogeny account states the X0(39) cusp-only result and gives the original Kenku reference. The original descent/point-completeness certificate remains explicitly unacquired in the named gap. |
| `EC.4/kenku-65-cusps` | corrected | The inspected primary rational-isogeny account states the X0(65) cusp-only result and gives the original Kenku reference. The original descent/point-completeness certificate remains explicitly unacquired in the named gap. |
| `EC.4/kenku-91-cusps` | corrected | The inspected primary rational-isogeny account states the X0(91) cusp-only result and gives the original Kenku reference. The original descent/point-completeness certificate remains explicitly unacquired in the named gap. |
| `EC.4/kenku-125-cusps` | corrected | The inspected primary rational-isogeny account states the X0(125) cusp-only result and gives the original Kenku reference. The original descent/point-completeness certificate remains explicitly unacquired in the named gap. |
| `EC.4/kenku-169-cusps` | corrected | The inspected primary rational-isogeny account states the X0(169) cusp-only result and gives the original Kenku reference. The original descent/point-completeness certificate remains explicitly unacquired in the named gap. |
| `EC.4/finite-eisenstein-quotient` | corrected | Corrected the source to Mazur Cor4.4’s proof and its earlier Eisenstein theorem. Proposition2.1 does not prove finiteness; the earlier quotient proof remains an explicit gap. |
| `EC.4/eisenstein-cusp-formal-immersion` | corrected | Corrected Proposition3.1 to pp.142–143; use the smooth integral cusp/cotangent comparison and q≠2, not an arbitrary rational quotient. |
| `EC.5/projective-inertia-order` | corrected | Read Serre Lemma18′ through the potentially multiplicative, ordinary, intermediate and supersingular cases. Its unconditional (p−1)/4 lower bound uses no GRH input. |
| `EC.5/split-cartan-large-primes` | corrected | Bilu–Parent–Rebolledo Theorem4.1 gives p>1.4·10^7. The Runge and quantitative Gaudron–Rémond inputs are precise open obligations; qualitative isogeny finiteness is insufficient. |
| `EC.5/heegner-gross-split-criterion` | corrected | Read Cor5.7 and its ordinary/supersingular derivative-resultant argument. Fundamental −D and the gcd of c=2,…,7 resultants give the stated sufficient condition. |
| `EC.5/split-cartan-finite-sieve` | corrected | Proposition5.9 covers 11≤p<10^14 except 13. Read the resultants, CRT sieve and source pseudocode; its entire large computation is explicitly not independently rerun. |
| `EC.5/integral-j-characterisation` | added | Added the two-direction geometric comparison: the j-map coordinate produces points from divisor candidates, and monic denominator divisibility gives the converse. |

## Change record and orchestrator follow-up

The mathematical corrections above explain every class of edit. The changed fields for each corrected or added node are enumerated below. Source `match` prose is synchronized only where its mathematical statement changed. Coverage notes now reproduce the precise current gap details. The review object, three independent source-finding verdicts and extra supplier-inspection note are new review metadata.

- `EC.0/dimension-comparison`: prerequisites.
- `EC.0/prime-power-convolution`: hypotheses.
- `EC.0/correction-convolution`: hypotheses.
- `EC.1/coefficient-orbit-degree`: hypotheses.
- `EC.1/prime-divides-integral-norm`: hypotheses, prerequisites.
- `EC.1/removed-prime-degree-bound`: hypotheses.
- `EC.1/real-exponent-bound`: hypotheses.
- `EC.3/exact-weight-two-lift`: hypotheses.
- `EC.3/rationality-from-small-primes`: hypotheses, prerequisites.
- `EC.3/nonrational-witness`: hypotheses.
- `EC.3/small-prime-below-f`: hypotheses.
- `EC.3/bounded-integer-trace-norm`: hypotheses.
- `EC.3/rational-coefficient-forcing`: hypotheses.
- `EC.3/rational-form-elliptic-realization`: hypotheses, sources (locator/excerpt).
- `EC.3/kraus-rational-realization`: hypotheses.
- `EC.3/local-mod-four-filters`: hypotheses.
- `EC.3/odd-eisenstein-series`: hypotheses.
- `EC.3/filtered-coefficients`: hypotheses, proofSteps.
- `EC.3/prime-power-ideal-sturm`: hypotheses.
- `EC.3/finite-four-count-witness`: hypotheses.
- `EC.3/small-prime-below-g`: hypotheses.
- `EC.3/mod-four-trace-transfer`: hypotheses.
- `EC.3/four-count-rational-two`: hypotheses, sources (locator/excerpt).
- `EC.3/four-count-full-two-selection`: hypotheses, sources (locator/excerpt).
- `EC.3/kraus-full-two-realization`: hypotheses.
- `EC.3/deletion-conductor-away`: hypotheses, proofSteps, prerequisites, sources (locator/excerpt).
- `EC.3/deletion-level-exact-adapter`: statement, hypotheses, proofSteps, acceptance, sources (locator/excerpt).
- `EC.4/prime-isogeny-potential-good`: hypotheses.
- `EC.4/isogeny-character-exponents`: hypotheses, prerequisites.
- `EC.4/isogeny-character-frobenius`: hypotheses.
- `EC.4/small-frobenius-trace-list`: hypotheses.
- `EC.4/isogeny-character-zero-case`: hypotheses.
- `EC.4/isogeny-character-third-case`: hypotheses.
- `EC.4/isogeny-character-half-case`: hypotheses, proofSteps, prerequisites.
- `EC.4/mazur-prime-isogeny-classification`: hypotheses.
- `EC.4/minimal-composite-levels`: hypotheses, sources (locator/excerpt).
- `EC.4/genus-one-isogeny-points`: hypotheses.
- `EC.4/remaining-composite-cusps`: hypotheses.
- `EC.4/composite-extension-exclusion`: hypotheses.
- `EC.4/mazur-kenku-cyclic-degrees`: hypotheses.
- `EC.4/rational-two-times-prime`: hypotheses.
- `EC.4/full-two-cyclic-four`: hypotheses, sources (locator/excerpt).
- `EC.4/full-two-times-prime`: hypotheses, sources (locator/excerpt).
- `EC.4/irreducible-one-two`: hypotheses.
- `EC.4/irreducible-full-two`: hypotheses, sources (locator/excerpt).
- `EC.5/large-prime-isogeny-cm`: hypotheses.
- `EC.5/exceptional-projective-exclusion`: hypotheses.
- `EC.5/split-cartan-exclusion`: hypotheses.
- `EC.5/proper-image-nonsplit`: hypotheses.
- `EC.5/nonsplit-potential-multiplicative`: hypotheses.
- `EC.5/cartan-correspondence-kills-old`: statement, hypotheses.
- `EC.5/winding-period-component`: statement, hypotheses.
- `EC.5/winding-class-nonzero`: statement, hypotheses.
- `EC.5/finite-winding-quotient`: hypotheses.
- `EC.5/cartan-cusp-residue`: hypotheses.
- `EC.5/cartan-cusp-formal-immersion`: hypotheses.
- `EC.5/cartan-point-torsion`: hypotheses, prerequisites.
- `EC.5/cartan-denominator-exclusion`: hypotheses.
- `EC.5/integral-j-forcing`: hypotheses.
- `EC.5/genus-zero-j-numerators`: statement, hypotheses, proofSteps.
- `EC.5/genus-zero-j-map`: hypotheses.
- `EC.5/integral-parameter-divisibility`: hypotheses.
- `EC.5/finite-integral-j`: statement, hypotheses, proofSteps, prerequisites.
- `EC.5/quadratic-twist-surjectivity`: hypotheses.
- `EC.5/large-isogeny-j-table`: hypotheses.
- `EC.5/large-isogeny-image-certificates`: hypotheses.
- `EC.5/small-isogeny-image-certificates`: hypotheses.
- `EC.5/lemos-surjectivity`: hypotheses, prerequisites.
- `EC.3/four-count-square-classes`: hypotheses, sources (locator/excerpt).
- `EC.4/kenku-39-cusps`: hypotheses.
- `EC.4/kenku-65-cusps`: hypotheses.
- `EC.4/kenku-91-cusps`: hypotheses.
- `EC.4/kenku-125-cusps`: hypotheses.
- `EC.4/kenku-169-cusps`: hypotheses.
- `EC.4/finite-eisenstein-quotient`: hypotheses, sources (locator/excerpt).
- `EC.4/eisenstein-cusp-formal-immersion`: hypotheses, sources (locator/excerpt).
- `EC.5/projective-inertia-order`: hypotheses.
- `EC.5/split-cartan-large-primes`: hypotheses.
- `EC.5/heegner-gross-split-criterion`: hypotheses.
- `EC.5/split-cartan-finite-sieve`: hypotheses.
- `EC.5/integral-j-characterisation`: id, parentStageId, realises, title, kind, statement, hypotheses, proofSteps, prerequisites, acceptance, sources, library, implementationStatus, addedBy.

No question blocks this review and no additional worker job is claimed. For implementation, acquire and decompose the explicitly listed open supplier/source obligations before marking any stage closed. Synchronize the separately stored reader when an authorized deliverable set includes it. Preserve the ell≥11 restriction on the deletion-level shortcut, the p-local winding involution and the distinction between candidate arithmetic and modular point completeness.
