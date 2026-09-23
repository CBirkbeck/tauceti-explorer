# REV-PAPER-LI-23

**Verdict: revise.** Independent review by Codex `codex-hjdg0j`, issue #1246, 23 September 2026. Original extraction: Claude Code `cc-39fac3`, issue #1245. The bot confirmed this claim and the entire issue was reread before work. This review is complete, not a checkpoint; the corrected extraction remains partial.

Repository base `8de5fd9300e7d6dd46e0db2ab9def4570974f30c`. Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`.

All 39 original items were independently checked and preserved. The corrected inventory has 81 items (8 library, 13 planned, 60 missing), 32 APIs, 96 planning tests and 21 independently confirmed source findings. Every missing item has exactly one route. The source findings identify false auxiliary statements, misprints and proof gaps with different scopes; they do not establish that the main algebraicity theorem is false.

## Main review conclusions

The operator comparison needs the first-variable-first convention and harmonicity of **f/g**, not merely f. The actual theta quotient is harmonic because its lowering is a negative-binary theta difference annihilated by the weight −1 raising operator. The corrected polynomial operator still extends across zeros of g. These repairs do not establish the boundary regularity needed for the compactification argument.

Bounded real-analytic automorphic functions need not extend smoothly at a cusp. The inclusion (4.2) and the finite-order-vanishing inference in Proposition 4.2 need a stronger hypothesis or another analytic construction. The scalar example 1/log(e+|j|²) exposes this inference. Multiplication by a finite cusp power does not make it C∞. This is a gap in the supplied proof, not a claim that the theta-specific existence theorem or the main algebraicity theorem is false.

The exceptional divisor in the blowup argument carries its ideal multiplicities. It is not automatically the reduced toroidal boundary. For multiplicities a_σ, cusp weight k′ and ample-twist weight k, choose k>k′ max a_σ; then ℓ₀=n₀k and n=n₀k′ give matching weights and ℓ₀E≥nD. This repairs that sheaf inclusion once the smooth-section hypothesis is independently supplied.

For Green functions the exact individual scalar is −2/r!. BEY Proposition 4.7 uses a Poincaré series with both μ and −μ in the principal part, so the higher lift is (r!/2)Σc(m,μ)m^rΦ_{m,μ}. This corrects Li (3.29) to agree with its integral convention and makes the matrix-lattice lift equal −G. Keeping Li’s printed finite sum instead doubles the entire integral/average convention. General harmonic input still needs BEY’s logarithmic finite-part subtraction unless its coefficient is proved zero; G3 preserves the application check.

Ordinary CM values must avoid the singular divisor. The diagonal value for f=E₄E₆/Δ and (z₁,z₂)=(i,i) is not finite. Regularization of a **difference** in Remark 1.5 does not define individual values there. The same-imaginary-field case uses BEY’s small-CM theorem, followed when necessary by the field norm from H_D to H₁H₂; those fields must not simply be equated.

Lemma 4.5 needs inverse-action agreement on the rational orthogonal complement. The review gives a rational quadratic space of signature (4,2) and p=5 isometries which agree forward on that complement but give different membership for e₁ in the transformed lattices. Their Green singularities differ. The actual application, where the second adelic element fixes the complement, satisfies the corrected condition.

## Route decisions

- **Route 1: reject.** GN.2 owns the lattice extension, but exact Chang local/dyadic and different-square proofs remain unacquired (G2). Quoted consequences are not full source closure.
- **Route 2: accept.** GN.3 owns the definite theta/Eisenstein identity. The corrected item has inverse-stabilizer mass normalization and the Hecke expansion checked in Bogo–Li §2; ordinary kernels are imported from MP.5.
- **Route 3: accept.** MP.6 owns indefinite Siegel–Weil. Bruinier–Yang Lemma 4.3 supplies the convergence hypotheses and weighted n=0 cycle convention, now explicit.
- **Route 4: accept.** Retarget the general ample-twist comparison to R09.1. Import relative Proj/ampleness and the whole blowup/exceptional-divisor construction from upstream StableReduction Layers 2 and 4. Preserve exceptional multiplicities; the smooth-boundary gap is separate.
- **Route 5: reject.** The shared HigherGreenFunctionCMValues Part II is correctly coalesced with BEY. G1 boundary regularity, the remaining G3 integral/application check and G4 cited-input decomposition prevent acceptance. Classical Hilbert forms, generic bundles and blowups must be imported.

## All original item checks

Searches covered the pinned Lean sources, all atlas stages and roadmap documents. The JSON retains the individual queries and hit counts, with the actual declaration/supplier judgment; a name hit alone was never treated as an implementation.

| Item | Result | Check or correction |
|---|---|---|
| 1 | checked | Split the library bundle and delimit the hypergeometric convergence domain. |
| 2 | corrected | For the specified finite Weil representation, a harmonic weak Maass form of weight k is a smooth slash-invariant function annihilated by Δ_k which, at each cusp, differs from a finite holomorphic Fourier principal part by O(exp(−εv)). Use R_k=2i∂τ+k/v, L_k=−2iv²∂conjτ and Δ_k=−R_{k−2}L_k. Its holomorphic/nonholomorphic Fourier decomposition and antilinear ξ_k=2iv^k conjugate(∂conjτ) give the cusp shadow of weight 2−k. Merely allowing arbitrary exponential growth does not guarantee a cusp shadow. |
| 3 | checked | MP.4 read; correct conjugate Weil convention. |
| 4 | checked | MP.5 read; split the singular primitive and correct Gaussian. |
| 5 | checked | V2 read; keep the actual Hodge-line descent and sufficiently divisible weight explicit. |
| 6 | checked | C2/C6 and B3 read; retain degree-one growth and distinguish coherent from locally free extensions. |
| 7 | checked | C1/C2 read; separate Dolbeault and ample-twist vanishing. |
| 8 | checked | V4/V6 read; Artin convention and finite levels remain explicit. |
| 9 | checked | HE.1 read; use its ring-class-field CM descent. |
| 10 | checked | Narrow quoted Chang consequence; original full criterion remains G2. |
| 11 | checked | Trace-dual calculation checked; existence suppliers still G2. |
| 12 | checked | Read Bogo–Li §2; restore Haar/stabilizer weights and absolute-convergence range. |
| 13 | checked | Read BY Lemma 4.3 and setup; restore Witt-rank and weighted-counting hypotheses. |
| 14 | corrected | Import blowups and the exceptional-divisor identification from upstream StableReduction Layer 4, and relative Proj/ampleness from Layer 2. R09.1 supplies the remaining general Noetherian twist comparison; no new blowup carrier is proposed. |
| 15 | corrected | E15 corrects the individual Green scalar and E21 the finite-sum normalization. BEY Proposition 4.7 and (5.1) determine the factor one half; §5.1 determines the finite-part subtraction. Use one convention throughout the averages and Galois formulas; G3 retains the remaining convergence/application check. |
| 16 | checked | Separate components and neighbors; retain GSpin specialization of general Shimura carriers. |
| 17 | checked | Correct product-group central kernel and cycle multiplicities. |
| 18 | checked | Distinct fields required; Li 2021 input remains quoted. |
| 19 | checked | Add off-divisor domain and class-field norm descent. |
| 20 | checked | Check dimension, coefficient field and continuation-of-difference interpretation; retain G1/G3. |
| 21 | checked | Correct n=2 and split the conjecture from the proved special case. |
| 22 | checked | Read BEY 5.5/5.6/6.1; separate the other imported results. |
| 23 | checked | Import B4 classical carrier; retain genuinely new real-analytic space. |
| 24 | checked | Check matrix kernel and Vandermonde binomial determinant in the proof. |
| 25 | checked | Symbolically check Legendre identity for r=0,...,7; polynomial definition separated. |
| 26 | checked | Counterexamples to printed operator/hypotheses; corrected quotient identity checked. |
| 27 | checked | Independent two-angle counterexample confirms E1. |
| 28 | checked | Exact entire-product counterexample and corrected decay argument confirm E2. |
| 29 | checked | Check reciprocal bases and absolute convergence; split Lemma 3.3. |
| 30 | checked | Check the Δ powers, weights, finite zeros and rational Bezout argument. |
| 31 | checked | Check exceptional-ideal divisor repair and Serre vanishing; no smooth-boundary inference. |
| 32 | checked | Correct twist-exponent arithmetic and expose boundary regularity G1. |
| 33 | checked | Check all five target properties against the source; the ∂̄-construction remains G1. |
| 34 | checked | Split carrier, ξ, weak kernel and coefficient pairing; cusp-domain correction. |
| 35 | checked | Read Bruinier Theorem 6.8; restore weak holomorphy absent from extraction. |
| 36 | checked | Explicit p=5 isometry/lattice counterexample; use inverse-action criterion. |
| 37 | checked | Check integration by parts and restore D_F^(-1/2). |
| 38 | checked | Check binomial and boundary coefficient conventions with the corrected inputs. |
| 39 | checked | Check rational coefficient reduction, component cancellation, reciprocity and exponent sign. |

## Library and ownership checks

UpperHalfPlane; ModularForm/CuspForm; ModularForm.eisensteinSeriesMF; Complex.Gamma; ordinaryHypergeometric; ModularGroup.fd; IntegralLattice.IsUnimodular; E8 evenness/unimodularity; finite_zeros_in_fd; mvPolynomialEquivModularForms; CliffordAlgebra. Statements read at the pins; related weak/Hilbert/GSpin claims are not inferred from them.

Read the audited GN.2/GN.3, MP.4–MP.6, QM.3, HE.1, V2/V4/V6, C2/C6, B3/B4, ComplexComparison C1/C2 and R09.1/R09.7a targets and relevant upstream StableReduction Layers 2/4. B4 already owns classical Hilbert forms; StableReduction owns blowups. Coordinated the BEY and GSpin special-divisor candidates.

R09.7a’s reviewed audit explicitly identifies the upstream StableReduction Layer 4 duplicate. The final route imports that whole blowup package and uses R09.1 only for the additional general ample-twist comparison. B4’s reviewed audit identifies the Hilbert sheaf/analytic comparison, so that carrier is imported. GN.2/GN.3 and MP.4–MP.6 remain the lattice, mass-formula and theta owners.

## Independent source-issue verdicts

### E1 — confirmed

Lemma 2.8, p. 394. Confirmed independently: θ₁=√2,θ₂=1−√2 are Q-independent but the product of their two phases is always 1, excluding the target (−1,1). The actual proof of Lemma 2.9 selects 1,θ₁,... independently.

Correction: Assume that 1, θ1, …, θN are Q-linearly independent.

### E2 — confirmed

Lemma 2.9, p. 394. Confirmed by an exact entire-function construction, not a numerical check: a_n=(−1)^n/∏_{j=1}^n(2^j−1), a₀=1. The series F(x)=Σa_n x^n is entire, satisfies F(2x)=(1−x)F(x), and F(2^s)=0 for all positive integers s. With c_n=2^n the asserted coefficient cancellation fails. Finite superlevel sets of |c_n| justify the largest-modulus argument and dominated convergence. The applications use unit coefficients and absolute convergence in a positive-power range.

Correction: Add: for every ε>0, only finitely many indices have |c_i|≥ε. Group equal nonzero bases, start at an integer exponent in the absolute-convergence range, remove successive finite maximal-modulus blocks, and use dominated convergence on the remaining terms. Applications must explicitly provide absolute convergence at a positive integer exponent.

### E3 — confirmed

Proof of Lemma 3.2, p. 400. Confirmed: the exponential bases in the preceding sum are reciprocal powers of products indexed by β₀,...,β_N; the all-∞ base is 1.

Correction: Remark 2.10, applied with αi = 1 and the numbers (∏_{i=0}^N c(βi, giτ0))^{−𝔯}, would force (∏_i c(βi, giτ0))^{−𝔯} = 0 for all β0, …, βN ∈ P¹(F). That is absurd, for example for βi = ∞.

### E4 — confirmed

Proof of Lemma 3.3, p. 400. Confirmed by (3.23), not the old extraction’s arXiv-numbered (3.10). The mass-normalized average of a constant is that constant. The reciprocal typo is separate from E19’s stabilizer issue.

Correction: EP(τ0) = cK^{−1} Σ_h θP(τ0, h) = θP(τ0) cK^{−1} Σ_h 1 = θP(τ0).

### E5 — confirmed

Theorem 4.3(2), equation (4.5), p. 405. Confirmed: (4.6), the derivative identity (3.15), and (4.25) all use θ_{P₁}−θ_{P₂}. The printed (4.5) has zero right side.

Correction: Lτ1 δ̂(τ) = (θP1(τ) − θP2(τ))^ℓ (θN(τ) − θN(τ, h))

### E6 — confirmed

Theorem 4.1 proof, p. 403, and Proposition 4.2 proof, p. 404. Confirmed as an identification gap: Stacks 01OF identifies O(1) with the ideal of the exceptional Cartier divisor of the chosen blowup center, not automatically the reduced boundary. The corrected twist inequality must also match weights; the old proposed bound on ℓ₀ alone was not sufficient. This algebraic repair does not settle the independent smooth-boundary gap E17.

Correction: Use D=V(I O_X̃), including its multiplicities a_σ, in the ample bundle O(−D)⊗π*L^k. For cusp weight k′ choose k>k′ max a_σ and n₀ as in Serre vanishing, then ℓ₀=n₀k and n=n₀k′ have matching weights and ℓ₀E≥nD. Smooth extension of the actual differential form remains the separate obligation E17/G1.

### E7 — confirmed

Theorem 1.7, p. 379; also the proof of Theorem 1.3, last paragraph, p. 415. Confirmed independently by rank: dim_Q Res_{F/Q}W=4 when d=2, hence signature (n,2) forces n=2. BEY Theorem 5.10 is exactly this four-dimensional quadratic-space case.

Correction: n = 2, i.e. n + 2 = 2d = 4, in both places.

### E8 — confirmed

Proof of Theorem 1.1 (§5.3), p. 416, and Example 2.7, p. 392. Confirmed omission: Example 2.7 assumes the quadratic field is real. BEY 5.5/5.6/6.1 supply the same-imaginary-field result, with an additional norm from H_D down to H₁H₂ before clearing rational factors. The norm uses equivariance; merely naming the larger ring class field is not enough.

Correction: Treat separately the case where d1d2 is a perfect square, i.e. E1 = E2. Then (z1, z2) is a small CM point (F = Q, Remark 1.4), and the statement is Bruinier–Ehlen–Yang, Theorem 6.1: for CM points in the same imaginary quadratic field, |D|^r G_{r+1,f}(z1^σ, z2^σ) = −(1/t) log|α^σ| with α in the ring class field H_D (deduced from their Theorem 5.5 and Corollary 5.6, which is the F = Q case of Conjecture 1.6 quoted in §1.2). This strengthens Viazovska (arXiv:1110.4654), who obtained α ∈ Q̄. First require nonsingular ordinary evaluations (E12). Write d_i=t_i²D₀ and D=lcm(t₁,t₂)²D₀. If H_D is larger than H₁H₂, equivariance makes log|α^σ| constant on Gal(H_D/H₁H₂); its norm has logarithm [H_D:H₁H₂] times that value. Absorb this degree and the rational ratio (t₁t₂/lcm(t₁,t₂)²)^r into κ and an integer power/inverse of the norm.

### E9 — confirmed

Proof of Theorem 4.10, definition of Q(z, h), p. 413. Confirmed: the exponents in the preceding alternating sum and the displayed product differ by (−1)^ℓ. Replace Q by its inverse when ℓ is odd, or change λ by the same sign.

Correction: exponent (−1)^{ℓ−i} C(ℓ, i), matching the alternating sum Σ (−1)^{ℓ−i} C(ℓ, i)(…) two lines above.

### E10 — confirmed

§2.2, (2.10)–(2.13), pp. 386–387. Already for r=1,d=2,k₁=k₂=1, the printed definition gives (∂₂f−∂₁f)/(2πi), whereas (2.12) gives its negative. With f=log(v₁),g=1, the printed left side of (2.15) is −1/(4π), its right side +1/(4π). Correcting orientation removes this discrepancy but does not remove E11.

Correction: Use the first-variable-first restriction f(τ₁,τ′,...,τ′) with weights (k₁,trκ−k₁), or multiply the printed C¹ by (−1)^r. This matches (2.12) and the later lowering identity. In the multi-index coefficient in (2.13), s! means (e₂+⋯+e_d)!; s is otherwise unbound.

### E11 — confirmed

Lemma 2.3, (2.15), p. 387; use in §5.1, p. 415. Even after correcting the orientation, choose d=2,κ=(1,1),r=1,f=log(v₁),g=exp(2πiτ₁). Then Δ₁f=0, but L D=g(1/(4π)−v₁) and the asserted right side is g(1/(4π)+v₁). The difference is −2v₁g. Conversely the quotient-harmonic version follows by applying the Rankin–Cohen identity to u=f/g and was checked symbolically for r=0,...,4.

Correction: After E10, require f/g to be harmonic of weight k₁ and holomorphic in the other variables on g≠0. Prove the denominator-cleared identity there, then extend. In §5.1, prove R_{−1}(θ_N−θ_N(h))=0 to obtain exactly this quotient harmonicity.

### E12 — confirmed

Theorem 1.1, p. 377; compare (1.1)–(1.2), p. 376. For r=1, f=E₄E₆/Δ has integral q-expansion with principal part q⁻¹. At z₁=z₂=i, d₁=d₂=−4 satisfy the printed hypotheses, but the identity term in Q₁(1)=∫₀∞1 du diverges. The later Bruinier–Li–Yang introduction explicitly excludes Z_f, as does BEY Conjecture 1.1.

Correction: For ordinary finite values require (z₁,z₂) outside the support of the Hecke divisor Z_f. If a value on a singularity is intended, define and prove a separate regularization; Remark 1.5 only regularizes a difference. Take α nonzero.

### E13 — confirmed

§3.1, (3.1), p. 396. For nonzero λ in the negative subspace, the printed Gaussian grows exponentially and is not Schwartz. At τ=i, formula (3.2) gives the corrected decaying Gaussian. Bruinier–Yang (4.4), author manuscript p. 14, has the minus sign.

Correction: Replace the plus by a minus: exp(−2π(Q_W(λ_{w⊥})−Q_W(λ_w))).

### E14 — confirmed

Lemma 4.6, (4.22), p. 409, and the intermediate integral in the proof of Proposition 4.8, p. 411. The u-fundamental domain O_F\R^d has Euclidean covolume √D_F. Unfolding the proof explicitly inserts its reciprocal. The published statement omits it; Bruinier–Yang §5 and Bruinier Definition 5.1 preserve it. The final algebraic pairing identity uses the normalized integral.

Correction: Put D_F^(−1/2) in front of the regularized integral, consistently with (2.2), (4.16), (4.21) and the first displayed calculation in the proof of Lemma 4.6.

### E15 — confirmed

§3.3, (3.28), p. 402. For m=1 this follows directly from Q_{s−1}(t)=Γ(s)²/(2Γ(2s))(2/(1+t))^s F(s,s,2s;2/(1+t)), with 2/(1+t)=1/Q(λ_z⊥). The ratio of coefficients is −2/Γ(s), as explicitly stated in BEY §6.1, p. 731. At r=1 the printed −1/3 differs from −2; at r=2 even its sign differs. The exact scalar affects downstream identities, although rational nonzero rescaling does not by itself disprove algebraicity.

Correction: The hypergeometric definition (3.27) and the Legendre normalization (1.1) give Φ_m(z,1,r+1)=−2/Γ(r+1) G^m_{r+1}=−2/r! G^m_{r+1}. Consequently the finite sum in (3.29) is −2G_{r+1,f}. E21 reconciles the finite-sum factor with the integral normalization; G3 retains its regularization/application hypotheses.

### E16 — confirmed

Lemma 4.5, (4.20), and first paragraph of its proof, pp. 407–408. Take Q=x₁²+⋯+x₄²−x₅²−x₆², L=Z⁶, and z₀ the negative coordinate plane. At p=5 let h₀ have the block [[5/3,4/3],[4/3,5/3]] on coordinates 1,5. Let k have block [[3/5,−4/5],[4/5,3/5]] on coordinates 5,6, and h₀′=h₀k; use identity at other finite places. These determinant-one isometries lift to GSpin and agree on S=Q⁴, but h₀⁻¹e₁=(5/3,0,0,0,−4/3,0) is 5-integral whereas (h₀′)⁻¹e₁=(5/3,0,0,0,−4/5,16/15) is not. Thus ±e₁ contribute norm-1 singularities for the first lattice only. Matrices and integrality were checked exactly. Also a punctured neighborhood cannot remove a positive-dimensional divisor, contrary to the next proof sentence.

Correction: Require agreement of h₀⁻¹ and h₀′⁻¹ on the rational orthogonal complement, or directly equality of the weighted singular lattice-vector sets. Cancel singular terms along the full local divisor. The application h₀=1,h₀′=h_W fixing this complement satisfies the corrected condition.

### E17 — confirmed

§4.1, inclusion (4.2), p. 403, and Proposition 4.2 proof, p. 404. Bounded real analyticity on a punctured cusp does not imply C∞ extension. Already for F=Q, the invariant real-analytic weight-zero function f(τ)=1/log(e+|j(τ)|²) is bounded on H; at q=0 it behaves as 1/(−2log|q|), so it is not smooth there. Multiplication by any finite cusp power q^a still has derivatives of sufficiently high order failing to extend. Passing to a neat subgroup only changes the cusp width. The paper’s argument needs more than an order-of-vanishing estimate; this review does not claim the theta-specific existence theorem is false.

Correction: Add and prove the smooth weighted boundary-extension hypothesis, or supply a valid weighted ∂̄/cohomology argument for the actual theta data. Do not identify all bounded real-analytic automorphic forms with smooth sections on the compactification.

### E18 — confirmed

§4.2, (4.13), p. 406. Bruinier’s primary Definition 4.4 and (4.21)–(4.23), author manuscript pp. 17–18, explicitly use the cusp space. Orthogonality to cusp forms characterizes ker ξ; it cannot require vanishing of every pairing with an Eisenstein series, whose coefficients supply the potentially nonzero Borcherds weight B(f). The later application only needs the cusp annihilator and the independently defined formal pairing.

Correction: The cited Petersson/coefficient duality is for g∈S_{κ̂,ρ_L}. Extend the coefficient pairing to M or formal series by its finite sum definition, without asserting the Petersson equality there.

### E19 — confirmed

§3.2, (3.23), p. 399; finite averaging in Theorem 4.10. The classical Siegel–Weil statement is an adelic integral, as in Bogo–Li Proposition 2.3. A compact quotient decomposed into K-orbits has volumes proportional to reciprocal stabilizer orders, not uniformly one for arbitrary lattice-stabilizing K. The paper states no small-level/equal-stabilizer condition at (3.23). Equality of all theta values still makes the weighted average constant, so the nonvanishing proof survives.

Correction: Choose sufficiently small level so the relevant effective stabilizer volumes agree, or use Haar-induced inverse-stabilizer weights and divide by their total mass. Propagate the same convention to finite product averaging in Theorem 4.10.

### E20 — confirmed

§2.5, p. 392, displayed subgroup product. Both GSpin subgroups contain scalar F×. Every pair (t,t⁻¹) maps to 1, so their product cannot inject. The later commuting-action notation is valid after this central-kernel convention.

Correction: Use the multiplication homomorphism, with the common central G_m factored out when writing an injection.

### E21 — confirmed

§3.3, (3.29)–(3.30), p. 402; BEY Proposition 4.7 and (5.1), p. 719. BEY Proposition 4.7 uses F_{m,μ} with principal part q^(−m)(φ_μ+φ_{−μ}); its lift is (4πm)^r r! Φ_{m,μ}. Thus f=(1/2)Σc(m,μ)F_{m,μ} and BEY (5.1) gives (r!/2)Σc m^rΦ. In particular μ=0 already has principal coefficient 2, so the factor cannot be discarded for unimodular lattices. Negative input weight makes the principal-part decomposition unique. The general harmonic-input integral also needs the finite-part prescription in BEY §5.1.

Correction: Insert 1/2 in (3.29) to retain the integral convention. Alternatively retain the printed finite sum and double every integral/average formula consistently. Use a regularized finite part unless the logarithmic subtraction coefficient is proved zero.

## Reading limits and remaining work

The published article was read in full; prerequisite reading and byte hashes are recorded in the corrected extraction report. The Chang access-page rendering is explicitly excluded from source coverage. The later Bruinier–Li–Yang paper was only checked at its introduction. No author was contacted.

- **G1:** Prove weighted boundary regularity and locally free automorphic-extension hypotheses for the theta data in Proposition 4.2/Theorem 4.3, or replace the smooth Dolbeault argument with a correct weighted analytic construction. Finite vanishing order and bounded real analyticity do not imply C∞ extension. The exceptional-divisor repair alone is insufficient.
- **G2:** Acquire Chang Satz 1 and the precise Hecke/Weil different-square proof; supply their local/dyadic hypotheses and the prescribed-sign consequence. Chang download was an access-page rendering, not the paper. Li and Bogo–Li only quote the input.
- **G3:** The factor two is resolved in E21: adopt (r!/2)Σ in place of Li (3.29) so the lift equals BEY (5.1) and −G in the matrix-lattice case. Complete the truncated-integral convergence and boundary-term check in (3.30) and §5.1, retaining the BEY logarithmic subtraction for general harmonic Maass input. Propagate the chosen convention through the final CM average/difference formulas before asserting their exact constants.
- **G4:** Complete declaration-size decomposition and primary proof coverage for the quadratic datum/cycle descent, Li 2021 intersection lemma, and rational Fourier-structure theorem. Preserve the shared BEY/GSpin carrier ownership. These cited inputs are not established merely by their names.

## Validation

- `scripts/check_paper.py` on the revised result and `research/blueprint/intake.py check-files` on the four deliverables plus own handoff.
- Additional checks: all original IDs retained, 81 unique IDs, acyclic dependencies, valid supplier stages, exactly one route for each missing item, five route verdicts, 21 independent finding verdicts, 32 APIs/96 tests and exact five-file archive scope.
- Symbolic checks: Cohen sign, quotient-harmonic identity for r=0,…,4, Legendre identity for r=0,…,7, Green scalar, rational p=5 matrix/inverse-membership counterexample and exact entire-series recurrence. BEY’s half-factor is derived from its principal-part normalization. These support the mathematical arguments, not Lean verification.
- No Lean required, written or compiled. No git commands used. PDFs and scratch computations stay outside the repository.
