# Independent review: admissible Anderson class formulas

**Verdict: revise.** Reviewer: Codex, session `codex-c83e7a`, issue [#1269](https://github.com/CBirkbeck/tauceti-explorer/issues/1269). The extraction authors were `codex-a71f92` and `cc-442dc5`; this reviewer did not write either extraction. All 103 original items, their APIs/tests, locators and 15 original source findings were checked. Clear repairs are applied in place. The result is **partial**, with 111 items (8 library, 6 planned, 97 missing), four routes and 18 source findings.

## Source and version boundary

The complete [HAL v2 manuscript](https://hal.science/hal-02490566v2/document), printed pp. 1–31 plus cover, was independently read including proofs and references. SHA-256: `1faf283f39c566a2bd7acd4e52589ddd22d364b888a6a33199c0ca774354c200`. Fourteen rendered formula pages were inspected, including printed pp. 5, 7, 13, 16–18, 21–26 and 28–29. The [publisher preview](https://link.springer.com/article/10.1007/s00222-022-01110-3) confirms Inventiones 229 (2022), 563–606 and acknowledges earlier manuscript corrections. Its 44-page proof text was not available for lawful collation. The [author CV](https://cv.hal.science/ngodac) links v2; exact-title correction/erratum and v3 searches located no itemized correction. The [Crossref record](https://api.crossref.org/works/10.1007/s00222-022-01110-3) has no update relation. These are bounded checks. Every confirmation below is **only about HAL v2**; journal persistence and novelty are not established. `known: new` follows the register schema and is qualified by this boundary in every record.

## Mathematical corrections

Theorem 6.3 needs an untwisted skew-polynomial motive, not the finite point space and not an already deformed motive action. On the finite point space, tau^m=1 makes tau-z invertible. Replacing only the carrier still fails if the action contains z^i: reduction modulo tau-z then produces z^(2i). New item 111 gives the explicit repair; item 96 now uses it. The trace adjoint includes i=0 and uses G^(-1)B^T G in a basis with trace Gram matrix G. A normal basis alone does not make G the identity.

For F/F_q finite and coefficient Frobenius tau fixing z, use the row motive M=F(z){tau}^(1 by d), with original right action m.a=m E_a. Define

```text
T(f) = (tau-z)f
rho(sum c_n tau^n) = (sum z^n sigma^n(c_n))^T,  sigma=tau^(-1).
```

Both maps are Atilde-linear with the indicated quotient action; rho need not be F(z)-linear. The leading tau-degree proves T injective. Constants prove rho surjective. Subtracting T(sigma(c_n) tau^(n-1)) reduces the leading term c_n tau^n to z sigma(c_n) tau^(n-1); induction gives ker rho=image T. For a constant row x,

```text
rho(x E_a) = (sum_i z^i sigma^i(x A_i))^T
           = sum_i z^i sigma^i(A_i^T) sigma^i(x^T).
```

This supplies exactness and equivariance, not motive finite generation. Finite projectivity after finite coefficient restriction is still imported from item 93/G6, the projective determinant-index theorem from 18/G8, and finite-module duality from 94. G7 is resolved only for this explicit presentation.

The Gauss-limit argument in item 58 is not yet closed. The previous sequence z+pi^n has stationary z-order, so it did not refute eventual stationarity. The alternating sequence x_(2n)=z, x_(2n+1)=z+pi^(2n+1) does. Normalized inverse factors of constant term 1 repair that issue structurally, but one must first remove finite exceptional/nonunit factors and then exhibit a common denominator compatible with the approximation congruences. G3 is reopened rather than declaring a terse assertion a proof.

The relation module in Proposition 5.3 is graded by z-exponent minus block index modulo m. Its homogeneous components have no lower bound on the z-exponent. The relation (-z,t) for E_t=tau over F_4 disproves the printed lower-bound condition. Normalized maximal minors can then be handled after inverting z, followed by scalar descent; G5 retains the missing proof interfaces. The rendered Lemma 5.4 uses algebraic-closure bars correctly and its ideal-norm step is I^m, so no OCR-based finding is added there.

Other clear changes: four locator repairs and Lemma 2.1's formal/analytic split; n>=1 and the full converse in item 54; coefficient Frobenius fixing z in 67; normalized versus arbitrary generators in 41; and an explicit field norm in 80. The weighted-degree bound in Theorem 5.6 retains d*r, not r. The polynomial-ring determinant display uses the deformed action on F_P(z)^d and lies in F_q[z,t] after X=t. The operator F_a is linear, not an algebra homomorphism.

## Baseline and ownership

Fresh semantic searches covered every one of the 92 originally missing signatures, grouped by mathematical family, over both complete pinned Lean trees, 2007 atlas stages, and the acquired roadmap/link/packet/decomposition JSON. Search results were treated as leads; exact claims below were checked by reading declarations with their binders. Generic primary decomposition is weaker than the cyclic Dedekind-module statement in item 8. Algebraic lattice predicates do not include the source's discreteness. No whole Anderson theorem was marked library because a generic component exists.

Eight added items expose trace nondegeneracy, Dedekind flatness, finitely presented flat projectivity, primary decomposition, normal bases, restricted-series decay, the planned shared Tate interface, and the corrected motive quotient. All ten cited declaration references were checked against the original blob hashes at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The reviewed AUDIT-20 DM.0/DM.2/DM.4/DM.6 and FA.0/FA.3 entries, and AUDIT-29 Z.3/Z.4 entries, were read. So were the relevant full layer descriptions. Upstream StableReduction Layer 0 owns the common Fitting carrier; its Layer 1 is a base-change consumer. IHG.6 imports existing Fitting APIs and its Padic L6 consumer identifies the generic supplier contract, but this does not make the exact general-ring statements 4–7 already planned. Those are now missing source additions using the upstream carrier. Upstream AdicSpaces Layer 0 supplies the generic Tate algebra, evaluation and finite-module series operations; item 2 keeps only the function-field comparisons. Z.4 retains Steinitz and determinant/norm transfer. DM.0 retains the Frobenius Ore adapter. No Tau Ceti roadmap is re-planned and no retired foundations roadmap is used.

## Route decisions

- **Route 1: accept.** Corrected source route: import the upstream Fitting carrier (3); add the general-ring and finite Dedekind theorems (4–9,94) to the existing IHG.6 supplier contract identified by Padic L6. Items 4–7 are now missing, not falsely claimed exact planned statements.

- **Route 2: accept.** Z.4 explicitly owns positive-rank Steinitz and finite-flat determinant/norm transfer. Items 101/103 remain imports; completed function-field adapters remain G4/G8.

- **Route 3: accept.** DM.0 explicitly owns the q-Frobenius Ore/additive-operator specialization; the existing generic SkewPolynomial multiplication is imported rather than rebuilt.

- **Route 4: reject.** The arbitrary-A, higher-dimensional class formula is a justified Drinfeld Part II direction, but its current supplier chain is not buildable: G2/G3/G4/G5/G6/G8 remain open, and several bundled assertions require separate proof/API nodes. The quotient and ownership repairs in this review do not close those gaps. Reject pending completion, without discarding the intended direction.

## Remaining closure obligations

This is a finished independent review with verdict `revise`, not a claim that the extraction is complete. G1 needs the lawful final-version comparison. G2 needs the higher-dimensional exponential, local-isometry, unit-lattice and Stark quotient suppliers. G3 needs the compatible normalized limit argument. G4 needs completed norm/valuation comparisons and the rational-constant extension. G5 needs homogeneous-minor descent and the Jacobian/Picard supplier chain. G6 needs separate general-A projectivity, coefficient independence and spreading-out/good-reduction statements. G8 needs finer proof-interior adapters and APIs. Merely listing a book or assigning these to a future design job is not source closure.

Resume with G2/G4 and G6 primary-source proofs, then the exact G3/G5 adapters; retain the repaired quotient and upstream imports. The Taelman 2010 Definition 3/Theorem 2 passage was independently read for E8; the earlier workers' broader supplier-reading claims are historical and are not claimed as new readings by this reviewer. No claim is made that a main theorem of the paper is false.

## Findings checked

All original E1–E15 are confirmed for the stated HAL version, with corrected reasons and repairs. E10 and E12 are restored to `error / the proof`: their printed assertions fail, although the intended theorems may be repaired. New E16–E18 are likewise checked at the rendered locator.

| Finding | Locator | Decision and reason |
|---|---|---|
| E1 | HAL hal-02490566v2, §1.2(5), p. 5; version of record not collated | Read p. 5. Nonflat base change sends the ideal by its image, not by an injective tensor identification: for R=k[x], M=R/(x), S=k, (x) tensor_R k is nonzero but its image ideal in k is zero. The standard image-ideal correction is sufficient. Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E2 | HAL hal-02490566v2, §1.3, p. 5; version of record not collated | Read p. 5 against §1.1: for a place of degree d_infinity>1 the residue field is F_infinity, so after rational constants the completion is F_infinity(z)((pi)), not F_q(z)((pi)). Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E3 | HAL hal-02490566v2, §2, p. 7; version of record not collated | Read p. 7: the positive Ore polynomial ring has nonnegative powers; negative Frobenius iterates require an inverse and are not defined over the arbitrary coefficient field used there. Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E4 | HAL hal-02490566v2, Lemma 3.7 proof, p. 13; version of record not collated | Read and rendered p. 13: scalar conjugation leaves the full constant matrix partial_E(a), including its nilpotent part. A nonzero 2-by-2 nilpotent differential already contradicts the displayed scalar reduction; the local-factor cancellation survives using the full differential. Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E5 | HAL hal-02490566v2, Proposition 4.5 proof, p. 16, two consecutive truncation formulas; version of record not collated | Read and rendered p. 16: k indexes the truncation power in both consecutive formulas, whereas j indexes a basis coefficient. Replace z^j by z^k. Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E6 | HAL hal-02490566v2, Theorem 4.3 Step 1(i), p. 17; version of record not collated | Read and rendered p. 17: clearing successively more exponential denominators requires xi_n dividing xi_(n+1); the printed opposite divisibility cannot support the exhaustion. Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E7 | HAL hal-02490566v2, Theorem 4.3 Step 2, p. 18, last displayed computation; version of record not collated | Read and rendered p. 18: the identity is over rational z-coefficients and applies Proposition 3.6 to the deformed module; its local factors must retain the tildes. Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E8 | HAL hal-02490566v2, Lemma 4.6 statement, p. 18; version of record not collated | Read and rendered p. 18 and independently read Taelman arXiv:0910.3142v4 Definition 3 and Theorem 2: the regulator generator is in F_q((1/t)), with the asserted valuation, not generally a polynomial. The general Anderson extension is still G4. Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E9 | HAL hal-02490566v2, Proposition 5.3 proof, p. 23; version of record not collated | Read and rendered p. 23: the index residue is k0+j, the expanded Frobenius exponent is j+l, and reconstruction sums over k0. The intermediate expanded relation must also retain z^(k+l); group fixed z-degree and Frobenius residue before projecting. Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E10 | HAL hal-02490566v2, Proposition 5.3 proof, pp. 22–23; version of record not collated | Read and rendered pp. 22–23: for A=F_2[t], F=F_4, E_t=tau, the relation (-z,t) is present, but the printed R0 forces its second entry to be divisible by z. Its asserted generation is false. The repair is a congruence grading with no exponent lower bound, as specified in item 74; the full descent remains G5. Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E11 | HAL hal-02490566v2, Theorem 5.6 proof, pp. 25–26; version of record not collated | Read and rendered pp. 25–26: two Carlitz summands at a linear prime have a quadratic characteristic polynomial in z although r=1. The correct degree bound in z^m is d*r. Retain the weighted-degree estimate or a weaker dimension-dependent bound that still gives convergence. Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E12 | HAL hal-02490566v2, Theorem 6.3 proof, p. 28, definition preceding tau-z sequence; version of record not collated | Read and rendered p. 28: on the finite point space tau^m=1, so (tau-z) is invertible over F_q(z) using 1-z^m. Its cokernel is zero, not the required d-dimensional point module. The row skew-motive carrier in item 111 repairs this, with E16 correcting the separate double twist. Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E13 | HAL hal-02490566v2, Theorem 6.3 proof, p. 28, adjoint action; version of record not collated | Read and rendered p. 28: applying the printed adjoint formula to a=1 gives zero if i=0 is omitted. Include the constant term; item 111 verifies the full coefficient formula. Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E14 | HAL hal-02490566v2, Theorem 6.3 proof, p. 29, matrix comparison; version of record not collated | Read and rendered p. 29: a normal basis need not be trace self-dual. In F_9=F_3(i), the displayed basis (1+i,1-i) has Gram [[0,1],[1,0]], and multiplication by i has matrix [[0,1],[2,0]]. The adjoint is G^(-1)B^T G. Independently executed 2187 trace identities confirm this example and the twist direction. Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E15 | Proof of Theorem 4.3, Step 1, p. 17, HAL hal-02490566v2; version of record not collated | Read and rendered p. 17: Gauss convergence alone gives no stabilization of z-order. The earlier sequence z+pi^n has stationary order and was an inadequate counterexample to this precise claim. Use x_(2n)=z, x_(2n+1)=z+pi^(2n+1), which converges to z with alternating orders 1 and 0. Structural normalization can repair the argument, but the exceptional-prime and common-denominator compatibility must be proved (G3). Confirmation concerns HAL v2 only; journal persistence and novelty are not established. |
| E16 | HAL hal-02490566v2, Theorem 6.3 proof, p. 28, action preceding tau-z sequence; version of record not collated | The coefficient reduction sends c tau^i to z^i sigma^i(c). Retaining an additional z^i in the action therefore gives z^(2i). For F=F_q,d=1,E_t=tau the repaired quotient must have t=z, whereas the double twist gives t=z^2. The inherited extraction repeated the twist and incorrectly declared G7 closed. Checked independently against the rendered HAL v2 page; journal text not collated. |
| E17 | HAL hal-02490566v2, Proposition 5.3 proof, p. 21, definition of F_a; version of record not collated | V^m has only the specified module structure, and F_0 is the zero operator, which is not a unital algebra homomorphism on a nonzero algebra. The proof uses linearity. Checked independently against the rendered HAL v2 page; journal text not collated. |
| E18 | HAL hal-02490566v2, Theorem 5.2 proof, p. 21, first two determinant displays; version of record not collated | The source allows dimension d, so the scalar carrier cannot carry the matrix action. In the d=1 Carlitz linear-prime case the undeformed action omits z, giving t-a-1 instead of the required t-a-z. After evaluation the remaining polynomial variable is t, not X. Checked independently against the rendered HAL v2 page; journal text not collated. |

## Validation

Fresh exact computations checked 2,187 trace-adjoint identities over F_9 and 80 skew-polynomial division/action examples with polynomial z-coefficients and tau-degree at most four. They reproduce the non-self-dual normal basis and distinguish t=z from the erroneous t=z^2. These calculations support the counterexamples and proof conventions; they do not prove the general theorems. To reproduce, use F_3[i]/(i^2+1), coefficient Frobenius fixing z, skew multiplication (c tau^n)(d tau^m)=c tau^n(d) tau^(n+m), and rho above. For seed s=1,...,80 take coefficients c_(n,j)=(s+2n+4j+nj) mod 9 for 0<=n<=4, 0<=j<=2, encoding a+bi as a+3b; take E_i=(s+3i) mod 9 for 0<=i<=3. Compare the independent leading-term division remainder with rho and its right-action formula.

The paper schema, intake path checks, item/dependency DAG, one-route-per-missing-item check, definition API/tests, source verdicts, review identity and pinned blob checks are run on the final files. No Lean file is authorized, no Lean compilation was performed, and all implementation statuses remain unchecked.

## Original-item audit ledger

Each row was matched to the complete HAL v2 reading. “Retained” means no additional statement/locator correction was found; it does not discharge the explicit supplier gaps.

| Item | Name | Audit result |
|---|---|---|
| 1 | Function-field coefficient and completion datum | Read the cited planned supplier; preserve its scope and unresolved adapters. |
| 2 | Gauss coefficient extension and Tate algebra | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 3 | Zeroth Fitting ideal | Corrected upstream Fitting-carrier ownership and exact planned/missing boundary. |
| 4 | Fitting ideal of a direct sum | Corrected upstream Fitting-carrier ownership and exact planned/missing boundary. |
| 5 | Fitting and annihilator bounds | Corrected upstream Fitting-carrier ownership and exact planned/missing boundary. |
| 6 | Fitting submultiplicativity in exact sequences | Corrected upstream Fitting-carrier ownership and exact planned/missing boundary. |
| 7 | Arbitrary base change of a Fitting ideal | Corrected upstream Fitting-carrier ownership and exact planned/missing boundary. |
| 8 | Dedekind torsion-module elementary divisors | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 9 | Exact Fitting multiplicativity over a Dedekind domain | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 10 | Discrete full A-lattice | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 11 | Criterion for a discrete submodule | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 12 | Three full-lattice criteria | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 13 | Rank-one lattice ratio | Corrected unnumbered construction locator. |
| 14 | Determinant lattice and general ratio | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 15 | Steinitz-coordinate ratio | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 16 | Ratio inverse and cocycle laws | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 17 | Index is the Fitting ideal | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 18 | Determinant-index formula | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 19 | Positive Frobenius Ore algebra | Read the cited planned supplier; preserve its scope and unresolved adapters. |
| 20 | Anderson A-module in arbitrary coefficient ring | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 21 | Point and Lie module functors | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 22 | Continuous Lie scalar extension and integral lattice | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 23 | Exponential and formal logarithm | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 24 | Entire exponential and local inverse | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 25 | Exponential unit lattice | Corrected unit-module page. |
| 26 | Class module | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 27 | Unit theorem for integral Anderson modules | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 28 | z-deformation of an Anderson module | Restricted evaluation to polynomial coefficients. |
| 29 | Deformed exponential and logarithm | Corrected formal-equation locator. |
| 30 | Tate convergence of the deformed exponential | Separated the unnumbered analytic conclusion. |
| 31 | Polynomial z-units | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 32 | Rationally deformed unit lattice | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 33 | Finite generation and rationalization of units | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 34 | Polynomial deformed class module | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 35 | Rational deformed class module | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 36 | Polynomial class torsion and invertibility of z | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 37 | Vanishing of the rational deformed class module | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 38 | Evaluation and Stark units | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 39 | Stark quotient and class-module Fitting ideal | Corrected equation (2.1) page. |
| 40 | Local Fitting factor | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 41 | Deformed local Fitting factor | Normalized representative versus arbitrary generator. |
| 42 | Coprime ideal factorization | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 43 | Infinitesimal layers have identical point and Lie actions | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 44 | Power independence of local factors | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 45 | Radical-prime factorization | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 46 | Integral scalar conjugation | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 47 | Conjugation regulator identity with class correction | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 48 | Finite local product and deformed regulator identity | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 49 | Removing bad local factors by conjugation | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 50 | Principal-specialization condition (P) | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 51 | Admissibility and Euler convergence condition (C) | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 52 | Deformed Euler-product lattice | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 53 | Specialized Euler-product lattice | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 54 | Approximation of deformed units by integral vectors | Added n>=1 and the full B O_L[z]^d converse. |
| 55 | Projective lift of the identity modulo z^n | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 56 | Approximation of the regulator lattice | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 57 | Exhausting sequence clearing exponential denominators | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 58 | Regulator containment with principal local factors | Reopened exceptional-generator/common-denominator proof G3. |
| 59 | Deformed class-formula containment | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 60 | Euler-characteristic valuation of regulator and class factor | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 61 | Finiteness of the affine ideal class group | Exact library declaration and standing hypotheses re-read; pinned blob verified. |
| 62 | Specialization of the regulator containment | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 63 | Class-group and norm upgrade from containment to equality | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 64 | Class formula for admissible Anderson A-modules | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 65 | Ordinary-unit form of the class formula | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 66 | Equality in the deformed class formula | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 67 | Finite-field cyclic scalar decomposition | Coefficient Frobenius fixes z, including on rational functions. |
| 68 | Characteristic polynomial of a deformed semilinear operator | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 69 | Residue-degree grading of the characteristic polynomial | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 70 | Degree drop of nonconstant deformation coefficients | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 71 | Polynomial-ring local characteristic generator | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 72 | Admissibility over a polynomial coefficient ring | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 73 | Class formula for every Anderson F_q[t]-module | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 74 | Residue-degree descent of the local Fitting ideal | Replaced false lower-bound grading; descent remains G5. |
| 75 | Injection on Picard groups under rational constants | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 76 | Torsion Picard classes under rational constants | Jacobian argument is a supplier sketch, not closed proof. |
| 77 | Picard injection under z to z^m | Norm argument includes inseparable z/z^m. |
| 78 | Valuation bound on polynomial reciprocal roots | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 79 | Almost-everywhere principal deformed local ideals | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 80 | Primitive generators with residue-degree grading | Wrote the field norm explicitly in the norm API. |
| 81 | Uniform root bound and Euler convergence from (P') | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 82 | Specialization equality from ideal inclusions and degrees | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 83 | Principality criterion for admissibility | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 84 | Perfect coefficient extension for motives | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 85 | Dual A-motive | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 86 | A-finite Anderson module | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 87 | Projectivity and almost-all reduction of an A-finite motive | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 88 | A-finite Frobenius characteristic polynomial | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 89 | Dual-motive cokernel computes the local Fitting ideal | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 90 | Admissibility of A-finite Anderson modules | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 91 | Contravariant A-motive | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 92 | Abelian Anderson module | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 93 | Projectivity and almost-all abelian reduction | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 94 | Dedekind finite-module duality | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 95 | Trace adjoint of a deformed finite-field action | Retained i=0 and the trace Gram matrix; imported nondegeneracy. |
| 96 | Abelian-motive cokernel and principal local ideal | Replaced double twist by exact untwisted quotient item 111. |
| 97 | Admissibility of abelian Anderson modules | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 98 | Class formula for abelian or A-finite Anderson modules | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 99 | Drinfeld modules are abelian and A-finite | Retained at the stated HAL locator; source and supplier boundaries remain explicit. |
| 100 | Class formula for arbitrary-coefficient Drinfeld modules | Retained principal-lattice assertion; Goss/Hartl–Juschka/Gekeler suppliers remain G6. |
| 101 | Steinitz classification of finite projectives | Read the cited planned supplier; preserve its scope and unresolved adapters. |
| 102 | Ideal class group and Picard group comparison | Exact library declaration and standing hypotheses re-read; pinned blob verified. |
| 103 | Norm-compatible determinant restriction of scalars | Read the cited planned supplier; preserve its scope and unresolved adapters. |
