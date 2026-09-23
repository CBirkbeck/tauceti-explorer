# PAPER-LI-23: algebraicity of higher Green functions

Yingkun Li, [*Algebraicity of higher Green functions at a CM point*](https://doi.org/10.1007/s00222-023-01205-5), Inventiones mathematicae **234 (2023)**, 375–418; [arXiv:2106.13653v2](https://arxiv.org/abs/2106.13653v2).

Original extraction: Claude Code `cc-39fac3`, issue #1245. Independent review: Codex `codex-hjdg0j`, issue #1246, 23 September 2026. **Review complete; verdict revise. Extraction partial.** The [JSON extraction](PAPER-LI-23.result.json) preserves all 39 original IDs and now has 81 items: 8 library, 13 planned and 60 missing. All 32 definition/construction items have use-derived APIs and 96 planning tests. These are proposed contracts, not declarations claimed to exist.

The [route verdicts](PAPER-LI-23.review.json) accept routes 2, 3 and 4 and reject routes 1 and 5. Twenty-one source findings have independent verdicts, including all nine original findings. The four remaining gaps are explicit.

## Target and proof structure

Theorem 1.1 expresses normalized higher Green values at nonsingular pairs of CM points as equivariant logarithms of algebraic numbers in their compositum of ring class fields. For odd r one discriminant must be fundamental. Theorem 1.3 gives logarithmic differences on big CM cycles. The corrected real-quadratic, dimension-four specialization combines differences with BEY’s full-cycle average to prove the even-r case of Theorem 1.1. BEY’s partial averages handle odd r, and its small-CM theorem supplies the same-imaginary-field case.

The proof first uses definite trace-unimodular O_F-lattices, mass-normalized Siegel–Weil and Hecke Eisenstein expansions to obtain theta differences with no common diagonal zero. A rational weakly holomorphic Bezout partition removes their denominators. The compactification/Dolbeault argument is intended to construct real-analytic modular lowering primitives. The Cohen operator turns those primitives into an elliptic Stokes pairing. Its finite principal-part adjoint is weakly holomorphic by cusp annihilation. Borcherds products, canonical models and reciprocity turn that pairing into logarithms. Each of these steps is separated in the JSON; the boundary step remains G1.

## Corrections that affect the plan

The operator comparison needs the first-variable-first convention and harmonicity of **f/g**, not merely f. The actual theta quotient is harmonic because its lowering is a negative-binary theta difference annihilated by the weight −1 raising operator. The corrected polynomial operator still extends across zeros of g. These repairs do not establish the boundary regularity needed for the compactification argument.

Bounded real-analytic automorphic functions need not extend smoothly at a cusp. The inclusion (4.2) and the finite-order-vanishing inference in Proposition 4.2 need a stronger hypothesis or another analytic construction. The scalar example 1/log(e+|j|²) exposes this inference. Multiplication by a finite cusp power does not make it C∞. This is a gap in the supplied proof, not a claim that the theta-specific existence theorem or the main algebraicity theorem is false.

The exceptional divisor in the blowup argument carries its ideal multiplicities. It is not automatically the reduced toroidal boundary. For multiplicities a_σ, cusp weight k′ and ample-twist weight k, choose k>k′ max a_σ; then ℓ₀=n₀k and n=n₀k′ give matching weights and ℓ₀E≥nD. This repairs that sheaf inclusion once the smooth-section hypothesis is independently supplied.

For Green functions the exact individual scalar is −2/r!. BEY Proposition 4.7 uses a Poincaré series with both μ and −μ in the principal part, so the higher lift is (r!/2)Σc(m,μ)m^rΦ_{m,μ}. This corrects Li (3.29) to agree with its integral convention and makes the matrix-lattice lift equal −G. Keeping Li’s printed finite sum instead doubles the entire integral/average convention. General harmonic input still needs BEY’s logarithmic finite-part subtraction unless its coefficient is proved zero; G3 preserves the application check.

Ordinary CM values must avoid the singular divisor. The diagonal value for f=E₄E₆/Δ and (z₁,z₂)=(i,i) is not finite. Regularization of a **difference** in Remark 1.5 does not define individual values there. The same-imaginary-field case uses BEY’s small-CM theorem, followed when necessary by the field norm from H_D to H₁H₂; those fields must not simply be equated.

Lemma 4.5 needs inverse-action agreement on the rational orthogonal complement. The review gives a rational quadratic space of signature (4,2) and p=5 isometries which agree forward on that complement but give different membership for e₁ in the transformed lattices. Their Green singularities differ. The actual application, where the second adelic element fixes the complement, satisfies the corrected condition.

Classical Hilbert forms and their canonical/subcanonical extensions already belong to AutomorphicBundles B3/B4. Real-analytic growth spaces, the nonmodular singular theta primitive and totally real harmonic Whittaker forms are separate additions. The Borcherds product requires weakly holomorphic Whittaker input, ξ(f)=0; integral coefficients alone do not suffice. The Petersson/coefficient duality has a cusp-form argument; arbitrary formal series use the finite coefficient definition instead.

The existing libraries supply elliptic forms, Gamma, the hypergeometric power series on its convergence domain, the closed modular domain, integral-lattice unimodularity, E₈, finite vanishing-order support and the holomorphic C[E₄,E₆] ring. They do not thereby supply weakly holomorphic rational Q[j], Hilbert forms, GSpin, spectral continuation or CM algebraicity. The shared higher-Green/special-divisor construction is coordinated with the existing BEY extraction and GSpin candidate.

## Routes

1. **REJECT — GeometryOfNumbersAndQuadraticArithmetic**. GN.2 owns the lattice extension, but exact Chang local/dyadic and different-square proofs remain unacquired (G2). Quoted consequences are not full source closure.

2. **ACCEPT — GeometryOfNumbersAndQuadraticArithmetic**. GN.3 owns the definite theta/Eisenstein identity. The corrected item has inverse-stabilizer mass normalization and the Hecke expansion checked in Bogo–Li §2; ordinary kernels are imported from MP.5.

3. **ACCEPT — MetaplecticAutomorphicForms**. MP.6 owns indefinite Siegel–Weil. Bruinier–Yang Lemma 4.3 supplies the convergence hypotheses and weighted n=0 cycle convention, now explicit.

4. **ACCEPT — AlgebraicModuliForArithmeticGeometry**. Retarget the general ample-twist comparison to R09.1. Import relative Proj/ampleness and the whole blowup/exceptional-divisor construction from upstream StableReduction Layers 2 and 4. Preserve exceptional multiplicities; the smooth-boundary gap is separate.

5. **REJECT — HigherGreenFunctionCMValues**. The shared HigherGreenFunctionCMValues Part II is correctly coalesced with BEY. G1 boundary regularity, the remaining G3 integral/application check and G4 cited-input decomposition prevent acceptance. Classical Hilbert forms, generic bundles and blowups must be imported.

## Source findings

- **E1 — error, confirmed**, Lemma 2.8, p. 394. Assume that 1, θ1, …, θN are Q-linearly independent.
- **E2 — error, confirmed**, Lemma 2.9, p. 394. Add: for every ε>0, only finitely many indices have |c_i|≥ε. Group equal nonzero bases, start at an integer exponent in the absolute-convergence range, remove successive finite maximal-modulus blocks, and use dominated convergence on the remaining terms. Applications must explicitly provide absolute convergence at a positive integer exponent.
- **E3 — misprint, confirmed**, Proof of Lemma 3.2, p. 400. Remark 2.10, applied with αi = 1 and the numbers (∏_{i=0}^N c(βi, giτ0))^{−𝔯}, would force (∏_i c(βi, giτ0))^{−𝔯} = 0 for all β0, …, βN ∈ P¹(F). That is absurd, for example for βi = ∞.
- **E4 — misprint, confirmed**, Proof of Lemma 3.3, p. 400. EP(τ0) = cK^{−1} Σ_h θP(τ0, h) = θP(τ0) cK^{−1} Σ_h 1 = θP(τ0).
- **E5 — misprint, confirmed**, Theorem 4.3(2), equation (4.5), p. 405. Lτ1 δ̂(τ) = (θP1(τ) − θP2(τ))^ℓ (θN(τ) − θN(τ, h))
- **E6 — gap, confirmed**, Theorem 4.1 proof, p. 403, and Proposition 4.2 proof, p. 404. Use D=V(I O_X̃), including its multiplicities a_σ, in the ample bundle O(−D)⊗π*L^k. For cusp weight k′ choose k>k′ max a_σ and n₀ as in Serre vanishing, then ℓ₀=n₀k and n=n₀k′ have matching weights and ℓ₀E≥nD. Smooth extension of the actual differential form remains the separate obligation E17/G1.
- **E7 — misprint, confirmed**, Theorem 1.7, p. 379; also the proof of Theorem 1.3, last paragraph, p. 415. n = 2, i.e. n + 2 = 2d = 4, in both places.
- **E8 — gap, confirmed**, Proof of Theorem 1.1 (§5.3), p. 416, and Example 2.7, p. 392. Treat separately the case where d1d2 is a perfect square, i.e. E1 = E2. Then (z1, z2) is a small CM point (F = Q, Remark 1.4), and the statement is Bruinier–Ehlen–Yang, Theorem 6.1: for CM points in the same imaginary quadratic field, |D|^r G_{r+1,f}(z1^σ, z2^σ) = −(1/t) log|α^σ| with α in the ring class field H_D (deduced from their Theorem 5.5 and Corollary 5.6, which is the F = Q case of Conjecture 1.6 quoted in §1.2). This strengthens Viazovska (arXiv:1110.4654), who obtained α ∈ Q̄. First require nonsingular ordinary evaluations (E12). Write d_i=t_i²D₀ and D=lcm(t₁,t₂)²D₀. If H_D is larger than H₁H₂, equivariance makes log|α^σ| constant on Gal(H_D/H₁H₂); its norm has logarithm [H_D:H₁H₂] times that value. Absorb this degree and the rational ratio (t₁t₂/lcm(t₁,t₂)²)^r into κ and an integer power/inverse of the norm.
- **E9 — misprint, confirmed**, Proof of Theorem 4.10, definition of Q(z, h), p. 413. exponent (−1)^{ℓ−i} C(ℓ, i), matching the alternating sum Σ (−1)^{ℓ−i} C(ℓ, i)(…) two lines above.
- **E10 — misprint, confirmed**, §2.2, (2.10)–(2.13), pp. 386–387. Use the first-variable-first restriction f(τ₁,τ′,...,τ′) with weights (k₁,trκ−k₁), or multiply the printed C¹ by (−1)^r. This matches (2.12) and the later lowering identity. In the multi-index coefficient in (2.13), s! means (e₂+⋯+e_d)!; s is otherwise unbound.
- **E11 — error, confirmed**, Lemma 2.3, (2.15), p. 387; use in §5.1, p. 415. After E10, require f/g to be harmonic of weight k₁ and holomorphic in the other variables on g≠0. Prove the denominator-cleared identity there, then extend. In §5.1, prove R_{−1}(θ_N−θ_N(h))=0 to obtain exactly this quotient harmonicity.
- **E12 — gap, confirmed**, Theorem 1.1, p. 377; compare (1.1)–(1.2), p. 376. For ordinary finite values require (z₁,z₂) outside the support of the Hecke divisor Z_f. If a value on a singularity is intended, define and prove a separate regularization; Remark 1.5 only regularizes a difference. Take α nonzero.
- **E13 — misprint, confirmed**, §3.1, (3.1), p. 396. Replace the plus by a minus: exp(−2π(Q_W(λ_{w⊥})−Q_W(λ_w))).
- **E14 — misprint, confirmed**, Lemma 4.6, (4.22), p. 409, and the intermediate integral in the proof of Proposition 4.8, p. 411. Put D_F^(−1/2) in front of the regularized integral, consistently with (2.2), (4.16), (4.21) and the first displayed calculation in the proof of Lemma 4.6.
- **E15 — error, confirmed**, §3.3, (3.28), p. 402. The hypergeometric definition (3.27) and the Legendre normalization (1.1) give Φ_m(z,1,r+1)=−2/Γ(r+1) G^m_{r+1}=−2/r! G^m_{r+1}. Consequently the finite sum in (3.29) is −2G_{r+1,f}. E21 reconciles the finite-sum factor with the integral normalization; G3 retains its regularization/application hypotheses.
- **E16 — error, confirmed**, Lemma 4.5, (4.20), and first paragraph of its proof, pp. 407–408. Require agreement of h₀⁻¹ and h₀′⁻¹ on the rational orthogonal complement, or directly equality of the weighted singular lattice-vector sets. Cancel singular terms along the full local divisor. The application h₀=1,h₀′=h_W fixing this complement satisfies the corrected condition.
- **E17 — gap, confirmed**, §4.1, inclusion (4.2), p. 403, and Proposition 4.2 proof, p. 404. Add and prove the smooth weighted boundary-extension hypothesis, or supply a valid weighted ∂̄/cohomology argument for the actual theta data. Do not identify all bounded real-analytic automorphic forms with smooth sections on the compactification.
- **E18 — gap, confirmed**, §4.2, (4.13), p. 406. The cited Petersson/coefficient duality is for g∈S_{κ̂,ρ_L}. Extend the coefficient pairing to M or formal series by its finite sum definition, without asserting the Petersson equality there.
- **E19 — gap, confirmed**, §3.2, (3.23), p. 399; finite averaging in Theorem 4.10. Choose sufficiently small level so the relevant effective stabilizer volumes agree, or use Haar-induced inverse-stabilizer weights and divide by their total mass. Propagate the same convention to finite product averaging in Theorem 4.10.
- **E20 — misprint, confirmed**, §2.5, p. 392, displayed subgroup product. Use the multiplication homomorphism, with the common central G_m factored out when writing an injection.
- **E21 — error, confirmed**, §3.3, (3.29)–(3.30), p. 402; BEY Proposition 4.7 and (5.1), p. 719. Insert 1/2 in (3.29) to retain the integral convention. Alternatively retain the printed finite sum and double every integral/average formula consistently. Use a regularized finite part unless the logarithmic subtraction coefficient is proved zero.

The JSON gives the exact printed claim, correction, independent argument and correction search for each finding. No author was contacted. Searches of the publisher, arXiv version history, author page and correction queries found no linked erratum; this is a bounded search. The later Bruinier–Li–Yang result was checked at its introduction, not treated as an erratum or read in full.

## Remaining gaps

- **G1:** Prove weighted boundary regularity and locally free automorphic-extension hypotheses for the theta data in Proposition 4.2/Theorem 4.3, or replace the smooth Dolbeault argument with a correct weighted analytic construction. Finite vanishing order and bounded real analyticity do not imply C∞ extension. The exceptional-divisor repair alone is insufficient.
- **G2:** Acquire Chang Satz 1 and the precise Hecke/Weil different-square proof; supply their local/dyadic hypotheses and the prescribed-sign consequence. Chang download was an access-page rendering, not the paper. Li and Bogo–Li only quote the input.
- **G3:** The factor two is resolved in E21: adopt (r!/2)Σ in place of Li (3.29) so the lift equals BEY (5.1) and −G in the matrix-lattice case. Complete the truncated-integral convergence and boundary-term check in (3.30) and §5.1, retaining the BEY logarithmic subtraction for general harmonic Maass input. Propagate the chosen convention through the final CM average/difference formulas before asserting their exact constants.
- **G4:** Complete declaration-size decomposition and primary proof coverage for the quadratic datum/cycle descent, Li 2021 intersection lemma, and rational Fourier-structure theorem. Preserve the shared BEY/GSpin carrier ownership. These cited inputs are not established merely by their names.

## Source reading and provenance

All 44 published pages, including proofs and references, were read. arXiv v2 was checked at selected operator, compactification, singularity and §5 proof locators; no new full version diff is claimed. The published article is open access under CC BY 4.0.

Primary prerequisite reading: Bogo–Li v1 §2, pp. 2–5; Bruinier–Yang author manuscript pp. 14–16 (Lemma 4.3 and proof), 31–33 (lift comparison) and 38–39 (neighboring spaces); Bruinier author manuscript pp. 17–20 and 35–36 (Whittaker duality, lift, Borcherds theorem); BKY pp. 18–21 (Proposition 4.6 and its local proof); BEY published pp. 718–721, 725, 729 and 731–732, plus the introduction partial-average statement. These are scoped readings, not claims to have read each prerequisite in full. Stacks 01OF, 01VG and 01XO supply the exact general geometric comparisons.

The purported Chang download is a rendered subscription/access page, not the mathematical article. Neither Chang Satz 1 nor the cited Weil/Hecke different-square proof was acquired. The exact Li 2021 intersection lemma and rational Fourier-structure proof remain G4.

- [published.pdf](https://link.springer.com/content/pdf/10.1007/s00222-023-01205-5.pdf), 44 pages, SHA-256 `1381077a24dee11d613c5b5f437f281080e89d26bb900fc6e1134360b883e163`.
- [arxiv.pdf](https://arxiv.org/pdf/2106.13653v2), 42 pages, SHA-256 `8111a1ba6f3f6ab3702cf10cdc068ce369890b1d3ed381e6d61a3d2f47d94882`.
- [bey.pdf](https://link.springer.com/content/pdf/10.1007/s00222-021-01038-0.pdf), 93 pages, SHA-256 `729e4f9daff82e8e98ae27bcd8084c4e89c8a08b91f2b5106c048ab35cda4160`.
- [by.pdf](https://www.mathematik.tu-darmstadt.de/media/algebra/homepages/bruinier/publikationen/shim-cm7b.pdf), 51 pages, SHA-256 `d54e7f4f12b4793818e3da2e25789e97e3ee02d3b6b9ea862567f00fe489135d`.
- [bruinier.pdf](https://www.mathematik.tu-darmstadt.de/media/algebra/homepages/bruinier/publikationen/shim9.pdf), 43 pages, SHA-256 `73cb22f2179357184eefc2e79908c927ce7ce2a9d537e0f12167cb153b7df394`.
- [bky.pdf](https://www.mathematik.tu-darmstadt.de/media/algebra/homepages/bruinier/publikationen/BKY.IMRN.revised2.pdf), 45 pages, SHA-256 `28d403848ea771b14ad115c5b69fd9306b381e60318a99032e8aa1d8443728c9`.
- [chang.pdf](https://link.springer.com/content/pdf/10.1007/BF01220879.pdf), 7 pages, SHA-256 `1098b513ea45dcfb160df18a59becb5fdafc5a7b9cbc1b9b68ddc38e860b0343`. **Access page only; not mathematical source coverage.**
- [bogo-li.pdf](https://arxiv.org/pdf/2207.10922v1), 19 pages, SHA-256 `16bbc31b104f7c8a4ada6ae6a1a85af0db58dd145becd8c09a4876304b0fcfc2`.

## Item inventory

The JSON records exact statements, suppliers, dependencies, APIs and tests. Broad theorem bundles are not treated as proof closure where G1–G4 apply.

| Item | Kind | Status | Target |
|---|---|---|---|
| 1 | definition | library | Elliptic holomorphic modular and cusp forms |
| 2 | definition | planned | Harmonic Maass forms, the lowering operator and the ξ-operator |
| 3 | definition | planned | The Weil representation ρ_L and vector-valued modular forms |
| 4 | construction | planned | Siegel theta kernels and definite theta series |
| 5 | theorem | planned | Baily–Borel compactification of Hilbert modular varieties and ampleness of the Hodge line |
| 6 | theorem | planned | Smooth toroidal compactifications as normalized blow-ups (AMRT IV Thm. 2.2) and Koecher's principle |
| 7 | theorem | planned | Dolbeault exact sequence with vector-bundle coefficients |
| 8 | theorem | planned | Canonical models of GSpin Shimura varieties and Shimura reciprocity at CM points |
| 9 | theorem | planned | CM points on X_0(N) and their fields of definition |
| 10 | theorem | missing | Existence of definite integral unimodular O_F-lattices with prescribed signs |
| 11 | theorem | missing | Proposition 2.6: totally positive Z-unimodular O-lattices exist |
| 12 | theorem | missing | Mass-normalized definite theta average and Hecke Eisenstein expansion |
| 13 | theorem | missing | Eisenstein series of I(s, χ) and the Siegel–Weil formula in signature (n, 2) |
| 14 | theorem | missing | Ample twisting by the exceptional ideal divisor |
| 15 | definition | missing | Automorphic and higher Green functions on orthogonal Shimura varieties |
| 16 | definition | missing | Orthogonal GSpin datum and its negative-plane domain |
| 17 | definition | missing | Special-subspace cycles and CM zero-cycles |
| 18 | theorem | missing | Example 2.7: Z(W_Q) is defined over Q for pairs of CM points on X_0(1)² |
| 19 | theorem | missing | Theorem 1.1: algebraicity of higher Green functions at an individual CM point on X_0(1)² |
| 20 | theorem | missing | Theorem 1.3: differences of higher Green functions at big CM points |
| 21 | theorem | missing | Theorem 1.7 with corrected dimension |
| 22 | theorem | missing | Small-CM algebraicity and the same-field modular-curve case |
| 23 | definition | missing | Real-analytic Hilbert modular forms and Petersson pairing |
| 24 | theorem | missing | Lemma 2.2: products of iterated raises span raised Rankin–Cohen brackets |
| 25 | theorem | missing | Example 2.1: Rankin–Cohen brackets of exponentials and Legendre polynomials |
| 26 | theorem | missing | Corrected quotient-harmonic lowering identity |
| 27 | theorem | missing | Kronecker's approximation theorem and Lemma 2.8 |
| 28 | theorem | missing | Lemma 2.9, Remark 2.10 and Corollary 2.11: vanishing of exponential sums |
| 29 | theorem | missing | Lemma 3.2: Eisenstein nonvanishing on a finite set |
| 30 | theorem | missing | Proposition 3.4: partition of unity on the diagonal |
| 31 | theorem | missing | Theorem 4.1: surjectivity of ∂̄ after twisting by an ample boundary bundle |
| 32 | theorem | missing | Proposition 4.2: L_{τ_1}-preimages of g^ℓ f |
| 33 | theorem | missing | Theorem 4.3 and Remark 4.4: the real-analytic Hilbert modular forms δ̂ |
| 34 | construction | missing | Harmonic Whittaker forms and principal parts |
| 35 | theorem | missing | Borcherds product for weakly holomorphic Whittaker input |
| 36 | theorem | missing | Lemma 4.5: differences of theta lifts are real-analytic across the singularity |
| 37 | theorem | missing | Lemma 4.6 and Remark 4.7: Stokes for the regularized theta integral |
| 38 | theorem | missing | Proposition 4.8 and Remark 4.9: the pairing identity |
| 39 | theorem | missing | Theorem 4.10 and Remark 4.11: algebraicity of the pairing with E_P̃ δ̂^+ |
| 40 | construction | missing | Singular theta primitive |
| 41 | construction | planned | Canonical and subcanonical Hilbert automorphic bundles |
| 42 | theorem | planned | Serre vanishing and analytic comparison |
| 43 | theorem | missing | The different has square ideal class |
| 44 | theorem | missing | Convergence, eigenvalue and continuation of orthogonal Green functions |
| 45 | theorem | missing | Spinor-norm description of components |
| 46 | theorem | missing | Neighboring quadratic spaces and conjugate Shimura varieties |
| 47 | definition | missing | Meromorphic orthogonal modular forms and Petersson norm |
| 48 | construction | missing | Weighted special divisors |
| 49 | theorem | missing | Conjecture 1.6 as an unproved target statement |
| 50 | theorem | missing | Full big-CM average for a real quadratic field |
| 51 | theorem | missing | Odd-weight partial CM average |
| 52 | theorem | planned | Logarithmic Fourier coefficients of the incoherent derivative |
| 53 | definition | missing | Legendre polynomial used by the Cohen coefficient |
| 54 | theorem | missing | Lemma 3.3: a same-genus theta difference is nonzero at a prescribed point |
| 55 | definition | missing | Principal-part coefficient pairing |
| 56 | definition | missing | Weakly holomorphic Whittaker forms |
| 57 | theorem | missing | Whittaker ξ-surjectivity and rational kernel |
| 58 | construction | missing | Regularized theta lift with the Eisenstein contribution removed |
| 59 | definition | planned | Classical Hilbert forms as automorphic-bundle sections |
| 60 | theorem | missing | Rational Fourier structure for Hilbert Weil-valued forms |
| 61 | definition | missing | Graded algebra generated by definite theta series |
| 62 | construction | library | Elliptic Eisenstein series at weight at least three |
| 63 | definition | library | Complex Gamma function |
| 64 | definition | library | Gauss hypergeometric power series on its convergence domain |
| 65 | definition | library | Closed modular fundamental domain |
| 66 | definition | missing | Incomplete Gamma function and its derivative |
| 67 | definition | missing | Trace-even O_F-lattices and their discriminant module |
| 68 | definition | missing | Totally positive trace-unimodular lattices |
| 69 | construction | missing | Adelic change of lattice and finite Weil-module identification |
| 70 | construction | missing | Rankin–Cohen differential operator |
| 71 | construction | missing | Denominator-cleared Hilbert Cohen operator |
| 72 | definition | missing | Weakly holomorphic elliptic modular forms |
| 73 | theorem | missing | Weight-zero weakly holomorphic ring and Bezout partition |
| 74 | theorem | missing | Finite-index sublattice restriction for theta pairings |
| 75 | theorem | missing | Descent of equivariant logarithms by a field norm |
| 76 | theorem | missing | The quotient in the main proof is harmonic |
| 77 | construction | missing | Finite principal part adjoint to the Hilbert differential operator |
| 78 | theorem | library | Finite vanishing-order support in the modular fundamental domain |
| 79 | definition | library | Existing integral-lattice unimodularity |
| 80 | theorem | library | Existing E8 even unimodular lattice |
| 81 | theorem | planned | Existing planned blowup and exceptional-divisor package |

## Validation

Paper and intake checks, unique routing, supplier references, dependency acyclicity, API coverage and exact five-file scope are checked for submission. Exact symbolic calculations support the operator, Legendre, Green-normalization, inverse-lattice and exponential-sum findings. No Lean file was required, written or compiled; no mathematical target is claimed formalised.
