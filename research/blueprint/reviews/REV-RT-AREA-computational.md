# Independent verification: RT-AREA-computational

Issue: #1472. Reviewer: Codex — codex-c83e7a. Date: 2026-09-24.

**Verdict: 15 confirmed, 1 rejected (/11).** All 16 finding IDs are covered exactly once. Confirmation applies to the defect described, with the implementation corrections below; it is not blanket approval of every sentence in a proposed fix. The red-team result was introduced by PR #2672, commit `ae721794719fc71019014585f6c96942239e4a71`, by another worker. This reviewer did not author that result.

The review reads the CN roadmap and decomposition against their actual suppliers, the accepted RS-03 ownership map, relevant paper routes, expansion integration code, and primary evidence. It is a verification of these findings, not a new complete audit of computational number theory. Neither this review nor the cited papers' implementations establish new Lean formalization.

## Findings

### 1. Confirmed

Confirmed as an acceptance-contract error. CN.4 puts exact zeros and rank in the same enclosure test as signs and nonvanishing. Cremona, Chapter II, §2.13, printed pp. 42–44, separates an upper bound obtained by nonvanishing from exact vanishing information. Require exact vanishing of all derivatives below r and a certified nonzero r-th derivative of the actual continuation. Correct the proposed fix: approximation alone cannot establish zero, but an exact singleton enclosure or a proved discreteness/rationality bound can; root-number parity does not supply all lower-derivative vanishings. Distinguish analytic rank from Mordell–Weil rank. Prefer assembling rank certificates in BSD, importing CN.4 enclosures, or explicitly scope the BSD.0 import into CN.4.

### 2. Confirmed

Confirmed for the already-owned analytic theory, not every conceivable continuation. Mathlib NumberTheory/ModularForms/LFunction.lean:175–193 proves CuspForm.differentiable_Λ and differentiable_L for positive weight on an arithmetic subgroup; Tau Ceti NumberTheory/ModularForms/LFunction.lean:131 gives CuspForm.hasEntireExtension_qExpansion_coeff, with the strict-width normalization in the comparison. ModularForms Layer 7 and BSD.0 already own the analytic function and rank interface. CN.4 must import these and own certified evaluation, precision and tail bounds. Keep cuspidality, positive weight and normalization explicit; general modular L-functions are not thereby all entire. The proposed ModularForms-7 and BSD.0 imports have no reverse path in the checked graph.

### 3. Confirmed

Confirmed as missing concrete suppliers and an uncredited baseline. CN.3 names a generic UPSTREAM alias but no Layer-8/9/10 contract, while accepted RS-03 already assigns abstract Hecke/Sturm theory upstream. Read TauCeti.ModularForm.eq_of_sturm_bound at SturmBound.lean:102 and Mathlib ModularForm.sturm_bound_levelOne at LevelOne/DimensionFormula.lean:307: these are characteristic-zero equality bounds with the stated group/period and coefficient-range hypotheses. Import those rather than rebuild them. CN.3 retains computable presentations and verified matrices. Add Layer 11 only when the chosen computation actually uses its level-one trace formula; it is not a prerequisite for every modular-symbol algorithm. The checked candidate imports have no reverse path.

### 4. Confirmed

Confirmed: a characteristic-zero Sturm equality theorem does not prove congruence modulo a prime, and separate T_2/T_3 characteristic-polynomial roots do not identify a single global eigensystem. The BCG extraction routes the weight-82 companion and weight-38 computations here; BCG §2.3, p. 515 and Corollary 3.2, p. 518 establish the actual targets. Stein Lemma 2.20, pp. 20–21 supplies an integral Miller basis; Theorem 9.18, pp. 171–172 supplies the congruence criterion. Correct the fix to retain the source's congruence-subgroup and coefficient-integrality hypotheses: arbitrary finite index is not licensed by the characteristic-zero norm-map proof. The pinned E_4/E_6 coefficients, discriminant product, graded-ring surjectivity and Hecke recurrence are ingredients, not an integral basis or mod-p theorem. Account for the theta weight shift through R15.3 and preserve the distinction between prime-to-p congruences and the coefficient at p.

### 5. Confirmed

Confirmed. Chenevier–Taïbi §2.4.3 and Remark 2.11, pp. 281–282 require exhaustive exact short-vector enumeration, whereas GN.5 currently promises LLL and a checked individual short vector. Fincke–Pohst §2, pp. 464–465 supplies the completed-square recursion. Put the exhaustive enumeration/termination contract in GN.5 and certified Gram bounds in CN.4, with the consumer importing both. Correct the proposed lower-form variant: Q' must be positive definite, or have separately proved finite search bounds; Q' <= Q alone does not make enumeration finite. Entrywise lower Gram bounds imply the comparison on the effective/nonnegative cone used by CT, not on every vector. A lower-form search certifies a superset; exact filtering or an explicitly inclusive output contract is still needed.

### 6. Confirmed

Confirmed as missing computational contracts, while importing existing structural theory. Stevenhagen, The Arithmetic of Number Rings, §9, Proposition 9.3, pp. 234–235 gives the p-radical/multiplier-order step and strict enlargement unless p-maximal. Guàrdia–Montes–Nart, arXiv:0807.2620v2, Theorem 4.18 and Corollary 4.19, p. 47, give the higher-order index/completeness termination mechanism for monic separable polynomials. CN.2 does not state these outputs or stopping certificates. Import NumberFieldArithmetic Layer 3's Dedekind/index criteria, the pinned TauCeti.NumberField.IntegralPrimitiveElement.discr_minpoly_eq_index_sq_mul_discr, and existing Hensel/finite-field interfaces. Keep residual-separability limitations for first-order Ore and require higher-order refinement for the general case. The p-adic-integer hensels_lemma is a scoped ingredient, not by itself general valued-field factorization.

### 7. Confirmed

Confirmed. The RAM node explicitly asserts constant-factor equivalence with bit cost, even after recording polynomial bounds on stored integers. Shoup §3.2, pp. 53–55 bounds their magnitude by a polynomial in input size plus elapsed time; indices and counters can therefore have growing bit length. Section 3.6, p. 72 explicitly allows polylogarithmic overhead. Fixed-base digits do not make those counters constant-size. Correct the fix's last sentence: the general overhead is polynomial in log(n+T), for RAM time T; a polylog(n) statement requires polynomial T. State the word-operation and simulation model before transferring a running-time bound.

### 8. Confirmed

Confirmed as baseline duplication, with a necessary correction to the proposed bridge. Read Nat.IsCarmichael, its odd/squarefree/prime_sub_one_dvd theorems, Korselt's criterion and isCarmichael_561 in CarmichaelNumber.lean:46–153, plus Nat.ProbablePrime and probablePrime_iff_zmod_one in FermatPsp.lean:55–60 and the prime-field power theorem. These cover the cited portions of Shoup Theorems 10.1–10.2; the three-factor argument and strong-test machinery remain separate work. The proposed equivalence for merely odd n > 1 is false: n = 3 passes Fermat on every unit but is not Carmichael. Require compositeness, or include it on the right. The existing IsCarmichael.zmod_unit_pow_sub_one already supplies the forward units statement. Retain the nonzero-base hypothesis of probablePrime_iff_zmod_one.

### 9. Confirmed

Confirmed only as missing baseline credit, not as a refutation of the honestly recorded unread-source gaps. LucasPrimality.lean:39–75 supplies the mathematical Lucas criterion and converse, and FermatPsp distinguishes probable primality from Nat.Prime. Nat.primeFactorsList_unique checks the product/primality invariant. FactorsHelper at Tactic/Simproc/Factors.lean:29 is conditional on p.Prime; use its specialization at p = 2 (primeFactorsList_eq:64) or supply that proof, rather than treating arbitrary FactorsHelper as an unconditional certificate. Recursive Pratt data, a finite checker, induction, completeness and size/cost analysis remain new work; no indexed Pratt/Pocklington or strong-test implementation was found. NormNum/Prime.lean's 25-bit comment is a documented implementation limitation, not a proved universal threshold. Keep the factoring-source and algorithmic-complexity gaps separate.

### 10. Confirmed

Confirmed. The integrated CN.1 finite-field factorization node and its unresolved placement note predate accepted RS-03. In data/restructure/RS-03.result.json, the owner entry assigns certified finite-field factorization to FF.3, and CN.1's narrowing requires consumption. Transfer the theory and its existing review corrections to the owning FF.3 packet; update the authored EXT-08 packet as well as the integrated copy through the supported promotion route so regeneration does not restore duplication. Keep only the CN-specific adapter/certificate consumption boundary under CN.1, reusing FF.3's checker rather than building a second one. Preserve the deferred-link handling described under rejected finding /11.

### 11. Rejected

Rejected. The FF refinement is indeed unpromoted, but the conclusion that the published graph contains an invalid endpoint is false. scripts/decompositions.py:46–55 recognizes pending refinements; lines 223–230 explicitly retain their evidence in deferredLinks and omit the edge until promotion. The claimed FF.0 refinement source occurs zero times in research/blueprint/atlas/stage-edges.json. Thus the stored link is permitted pending evidence, not an asserted graph dependency. Replacing its source by an arbitrary mathlib: identifier would itself require registering an allowed external endpoint. The cited Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X and Polynomial.expand_contract are valid baseline ingredients (the latter also requires p != 0); cite them in the node without misdiagnosing or breaking deferral.

### 12. Confirmed

Confirmed as missing baseline credit. Read Chebyshev.theta_ge and theta_ge' in NumberTheory/Chebyshev.lean:498–505 and theta_le_log4_mul_x:194; these supply explicit analytic bounds supporting Shoup Theorem 5.7, p. 108. A derived positive linear lower bound and its threshold still need a proof and small-case treatment. Read add_pow_char with [Fact p.Prime] and [CharP R p], and ZMod.pow_card: these supply the prime direction of the polynomial congruence, not AKS correctness or complexity. Replace the unresolved dependency description with the scoped library route; do not erase the historical fact that the original worker had not read Chapter 5 or mark the whole AKS proof complete.

### 13. Confirmed

Confirmed as an unspecified certificate-instantiation boundary. On the atlas edges plus accepted restructure and link maps there is no path between CN.2/CN.3 and CN.5 in either direction. RS-03 makes CN.5 the generic schema owner, so use CN.5 -> CN.2/CN.3 for the concrete number-field and modular-form record checkers, and say which output contract instantiates the schema. The two additions together, including the other checked candidate imports, introduce no return path. The alternative reverse direction is a different design requiring explicit ownership and a fresh combined check; do not add both directions. A graph edge alone does not implement a record checker.

### 14. Confirmed

Confirmed as an unexpressed shared-service import, not evidence that a second implementation already exists. CM.5 explicitly includes a complex class-polynomial route with certified precision; RS-03 owns generic validated arithmetic in CN.4. No CN.4 -> CM.5 edge occurs in the checked atlas, accepted restructurings or link maps, and adding it has no reverse path. Scope the import to the complex analytic branch and keep height bounds, required rounding precision, ideal-class action and endomorphism certificates in CM.5. The alternative CRT branch need not consume complex ball arithmetic merely because it shares that stage.

### 15. Confirmed

Confirmed. CN.2 still cites retired FoundationsAndLibraryIntegration:LI.4, contrary to PROTOCOL §11. The accepted NumberFieldArithmetic link map already supplies Layers 3 and 7; the LocalFieldsRamification map explicitly records that no concrete local-field statement was identified. Replace the retired input by those precise supplier contracts and name the additional local algorithm interfaces from /6. The pinned class-number file's finite-prime principality criterion is a PID/class-number-one certificate, not a general class-group algorithm; hensels_lemma requires its derivative-norm inequality. Preserve these limits and do not add a blanket local-fields edge without a consumed theorem.

### 16. Confirmed

Confirmed as an unresolved source route, already honestly acknowledged in the decomposition gaps. Shoup's contents do not supply number-field integral-basis algorithms, modular-symbol/Hecke computations or validated transcendental arithmetic, and LOCAL is not a bibliographic locator. Replace the CN.2–CN.4 placeholders by concrete routes: Stevenhagen §9 and GMN's higher-order Newton theory for CN.2; Stein §2.3, modular-symbol chapters and §9.4 plus Cremona Chapter II for CN.3; Johansson's Arb paper §§1–2 and its arithmetic sections, with Cremona §2.13 for CN.4. Cohen §§6.1–6.2 may remain a proposed additional route, but that edition was not independently read here. These sources identify work to decompose; they do not certify all three stages complete.

## Evidence and reproducibility

Repository inputs were acquired at `9aef8a776a9990e4a58cee945e1b80f3100c8906`, then refreshed against main before publication with byte/blob checks and a concurrent-deliverable guard. The manifest covers roadmap documents, extracted stage graph, authored/integrated packets, ownership/link maps, cited paper routes and protocols. Acquisition is not a claim to have read every unrelated document.

The library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Declarations used above were read with their hypotheses and namespace context, rather than inferred from names. In particular the modular-form L-series bridge lives in `CuspForm`, whereas the Sturm bridge lives in `TauCeti.ModularForm`. Name-index searches followed by file searches for Miller/Sturm congruences, Fincke–Pohst enumeration, p-maximal orders and Pratt/Pocklington/Miller–Rabin found the cited ingredients, not complete implementations of the missing contracts. `IsPRadical` in perfect-closure theory and authors named Miller are unrelated search hits. Absence claims are limited to those searched pinned libraries.

Primary sources independently consulted (public PDFs, accessed 2026-09-24):

- [Shoup, second edition](https://shoup.net/ntb/ntb-v2.pdf), contents, §§3.2/3.6, Theorems 5.7 and 10.1–10.2; SHA-256 `8e1abc54f4510c3f274dfbed07ea602a6a439ee24b2c916e61abe829b402ec06`.
- [Stein, Modular Forms: A Computational Approach](https://wstein.org/books/modform/stein-modform.pdf), Lemma 2.20 and Theorem 9.18 with its norm argument; SHA-256 `b50e81d48d2fb794948414fee625d1d3ca19c191a87430ca38c8713c8f466b75`.
- [Cremona, Chapter II](https://johncremona.github.io/book/fulltext/chapter2.pdf), §2.13; SHA-256 `432fa5290b2b2ac0d623169e9198d928e5dd75acb490db2d58775630d0f6ea94`.
- [Stevenhagen, The Arithmetic of Number Rings](https://library.slmath.org/books/Book44/files/08psh.pdf), §9 and Proposition 9.3; SHA-256 `040ebae8ee54439c0e10480d2302c46c1ad465616dfbe2b68e449507c3a1bf17`.
- [Guàrdia–Montes–Nart](https://arxiv.org/abs/0807.2620), v2 introduction, Theorem 4.18 and Corollary 4.19; SHA-256 `62b8f28d1839dbaac425ac17088b08070bf531aee9ffedae0bc80a1cb109d8ad`.
- [Fincke–Pohst](https://www.ams.org/journals/mcom/1985-44-170/S0025-5718-1985-0777278-8/S0025-5718-1985-0777278-8.pdf), §2; SHA-256 `c61b81fc0a0e274aa9c43feba6b676be0ac89220cdaf6cb9bb42a88df1e53abe`.
- [Chenevier–Taïbi, published article](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), §2.4.3/Remark 2.11; SHA-256 `ea90fb0faabeaaa56be15f2c6f9c22450e7891c2181130fd79fe356cd83ba3de`.
- [Boxer–Calegari–Gee, published offprint](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf), §2.3 and Corollary 3.2; SHA-256 `4d27afabbef371babf3a73dad19bc8ccee180636be27bd6ebee17f58f7150290`.
- [Johansson, Arb](https://arxiv.org/abs/1611.02831), §§1–2; SHA-256 `44802d5cce02bf91a3d155870b8f315f2955866e283bfb48f6776a07f35f6ebf`.

The graph check uses the exported stage edges plus accepted restructure and link-map edges. For /13 it verifies both old directions; for candidate additions it checks reverse reachability while adding them sequentially, so simultaneous additions are covered. It does not certify unrelated components or infer mathematical dependencies merely from acyclicity. For /11, the missing source matches `pending_refinement`; the active exported graph contains no occurrence of that source. The proposed literal `mathlib:` replacement is not automatically a registered graph endpoint.

Validation: red-team result/review checker; exact 16-ID census with no duplicates or extras; repository-input and library-blob checks; combined candidate-edge reachability; deferred-refinement handling; swarm intake checks on exactly the two review deliverables. No Lean file is requested or changed, so Lean elaboration is not applicable. No target roadmap, paper, packet or library audit was edited by this verification job.
