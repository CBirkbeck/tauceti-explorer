# Errata: PAPER-BHATT-ETAL-23

Bhatt–Ma–Patakfalvi–Schwede–Tucker–Waldron–Witaszek, *Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic*, Publ. Math. IHÉS 138 (2023), 69–227. [Published PDF](https://www.numdam.org/item/10.1007/s10240-023-00140-8.pdf), [version history](https://arxiv.org/abs/2012.15801).

Original errata worker: Claude Code `cc-442dc5`. Independent review: Codex `codex-c83e7a`, 23 September 2026, job REV-ERRATA-PAPER-BHATT-ETAL-23. All eight inherited findings are confirmed after the corrections described below; E9–E11 were added. E11 concerns a replaced preprint argument and is already known. The other ten findings have no correction located in the searches documented in the JSON and review report; “new” records that search outcome.

The checked applications admit the local repairs below. This is a review of these findings and their immediate uses, not a certification of every argument in the paper. In particular, E1 needs the additional E9 proof repair; E7 affects the stated definition; and E8 needs the floor-preserving Weil-divisor adapter.

## E1 — error; affects a stated result

**Locator:** Lemma 2.56, second assertion, p.101 of the published version; the same wording is arXiv v1 Lemma 2.37 (p.20), v2 Lemma 2.50 (p.26) and v3 Lemma 2.56 (p.29).

**Printed:** "More generally, let D be a fixed divisor and let A be a semiample Q-Cartier Q-divisor such that A ∼_Q M + Λ, where M is an effective Cartier divisor with no exceptional curve of Y → X in its support, and −δD ≤ Λ ≤ δD for δ > 0. Take x ∈ F ∩ M of multiplicity k ∈ Z_{>0} in M. Then ε_sa(A; x) converges to k when δ → 0."

**Correction:** Only a lower bound holds. For every rational γ with 0 < γ < k there is δ₀ > 0, depending only on f, D and γ, such that ε_sa(A; x) = ε(A; x) ≥ k − γ for all δ < δ₀ and all such A, M, Λ and x. Equivalently, liminf_{δ→0} ε_sa(A; x) ≥ k, uniformly. This follows by the printed strategy after correcting its intersection estimate as in E9; the strategy provides no upper bound.

**Check:** Counterexample with Λ = 0. Let k be a field of characteristic p > 0, X = A²_k, and f: Y → X the blow-up of the origin with exceptional curve E = F. Let M be the sum of the strict transforms of the two axes. Then M ∼ −2E, so M is effective, Cartier, globally generated over X (O_Y(−E) = m·O_Y) and has no exceptional component. Let x = E ∩ (strict transform of the y-axis), so mult_x M = 1 = k. Blow up x, with exceptional curve G and strict transform E′. Then E′² = −2, G² = −1, E′·G = 1 and π*M − tG ∼ −2E′ − (2+t)G, which has degree 2 − t on E′ and t on G. Hence ε(M; x) = 2. At t = 2 the ideal (x, y²) pulls back to O(−E′ − 2G) (charts x = ab, y = b, then a = c, b = cd, giving c²d, and a = ef, b = f, giving f²). So π*M − 2G ∼ −2E′ − 4G is globally generated and ε_sa(M; x) = 2. Taking A = M and Λ = 0 (any D), ε_sa(A; x) = 2 for every δ, not converging to k = 1. The proof aims to show that π*A − (k − γ)E is nef; its coefficient estimate must first be repaired as in E9. The consumers need only the lower bound: Proposition 8.15 (p.173) uses the first assertion ε_sa(M; x) ≥ 1, which is correct, and Claim 8.21 (p.178) needs ε_sa > 2 for k = 3. So the paper's results are unaffected. Checked on the page image and by exact arithmetic. Noted by the extraction (diagnostic A, gap-seshadri-limit); verified and proved in the corrected form by this continuation.

**Independent verdict:** confirmed. Confirmed after repairing the proposed explanation. Independently checked published pp.101–102, arXiv v1 pp.20–21, v2 p.26 and v3 p.29. The double blow-up has contracted-curve degrees 2−t and t, and the pullback of (x,y²) principalizes as O(−E′−2G), so the claimed limit is false already for constant Lambda=0 and multiplicity 1. The corrected uniform lower bound needs the coefficientwise estimate supplied in E9: the printed proof does not establish it exactly as written. Proposition 8.15 (p.173) and Claim 8.21 (p.178) need only the lower bounds. No assertion that these checks re-prove the whole MMP.

**Existing correction:** new.

## E2 — misprint; affects nothing

**Locator:** Proposition 6.28, p.154 of the published version (and arXiv v3 Proposition 6.28, p.71).

**Printed:** "Let Δ ≥ 0 be a Q-divisor on X such that (X, Δ) is globally +-regular (completely purely globally +-regular over R, resp.). Suppose that Δ_Y ≥ 0, where K_Y + Δ_Y = f*(K_X + Δ). Then (Y, Δ_Y) is globally +-regular (globally +-regular, resp.)."

**Correction:** The conclusion in the resp. case is "completely purely globally +-regular over R", with the pure boundary S_Y the strict transform of S and B_Y = Δ_Y − S_Y. This is what arXiv v2 (Proposition 6.28, p.64) prints, and arXiv v1 (Proposition 6.22, p.48) prints "purely ... purely".

**Check:** The printed resp. conclusion is false. Take R = k[[t]] with k of characteristic p, X = Y = Spec R, f = id and Δ = S = V(t). Then (X, S) is purely globally +-regular. For a finite normal R′ ⊇ R with uniformizer s and ramification e, the map R → s^{1−e}R′ splits because R′ is R-free and 1 ∉ t·s^{1−e}R′ = sR′. But (X, S) is not globally +-regular: already for the identity cover, a splitting of O_X → O_X(S) = t^{−1}R would send 1 = t·t^{−1} into tR. The cited proof (Proposition 6.26, which applies because R is complete, together with Lemma 4.27 with B′ = B_Y) proves the pure conclusion. The consumer in Theorem 7.14 (p.165) uses the pure conclusion. In arXiv v3 the qualifier is visibly garbled as "( ly globally +-regular, resp.)", so the published wording is a typesetting slip. Checked on the page images of v3 p.71 and published p.154. Noted by the extraction (diagnostic B, gap-pure-birational); the version history was established by this continuation.

**Independent verdict:** confirmed. Confirmed. Read Definition 6.24 and Proposition 6.26 (pp.152–154), Lemma 4.27 (p.127), and the consumer Theorem 7.14 (p.165). Rechecked the DVR splitting/non-splitting example. The pure conclusion is explicit in v1 Proposition 6.22 p.48 and v2 Proposition 6.28 p.64; v3 p.71 has the garbled qualifier and published p.154 loses it. Retain misprint/nothing in the protocol sense that the intended mathematics is clear, while explicitly retaining the counterexample to the literal ordinary conclusion.

**Existing correction:** new.

## E3 — misprint; affects nothing

**Locator:** Proof of Lemma 4.28, p.128 of the published version (also arXiv v2 and v3).

**Printed:** "Twisting by the pullback L⁺ to W⁺ of the line bundle O_Y(f*(M − (K_X + S + B))) (for some finite cover f: Y → W), and taking local cohomology, we obtain: ... The left zeros are due to Corollary 3.7 and the fact that L⁺ is the pullback of a big and semiample line bundle."

**Correction:** Twist by the pullback of O_Y(f*(K_X + S + B − M)), the inverse of the big and semiample bundle f*(M − (K_X + S + B)). Corollary 3.7 then applies with b = −1 and kills H^{d−1}_m of it.

**Check:** Corollary 3.7 (p.107) gives H^i(RΓ_x RΓ(X⁺, L^b)) = 0 only for b < 0 and i < dim X, where L is big and semiample, so it gives nothing for the positive twist that is printed. With the inverse twist, H^d_m of O(−S_{W⁺}) twisted by f*(K_X + S + B − M) is dual to H⁰(O_Y(K_Y + S_Y + f*(M − K_X − S − B))), which is the expression in the statement of the lemma. The same line bundle L := O_{X⁺}(π*(K_X + S + B − M)) appears in the proof of Theorem 7.2 (p.156). The lemma is marked "a fact we will not use". Checked on the page image. Noted by the extraction (diagnostic C, gap-adjoint-sign).

**Independent verdict:** confirmed. Confirmed. Published p.128 and v2 p.45/v3 p.50 have the positive twist. Corollary 3.7 p.107 requires negative powers. Reversing the twist gives both the needed vanishing and, under duality, the bundle in the lemma’s statement. Theorem 7.2 p.156 already has the corrected sign. This is a sign misprint; the lemma is explicitly unused.

**Existing correction:** new.

## E4 — misprint; affects nothing

**Locator:** Theorem 9.28(c), p.206 of the published version; arXiv v2 Theorem 9.27 p.102 and v3 Theorem 9.28 p.113.

**Printed:** "(c) For each Γ_i, −4d_{Γ_i} < (K_X + Δ)·Γ_i < 0"

**Correction:** −4d_{Γ_i} ≤ (K_X + Δ)·Γ_i < 0, as in the introduction's statement of the same theorem (Theorem I(c), p.74: 0 < −(K_X + Δ)·_k C_i ≤ 4d_{C_i}).

**Check:** The proof of Theorem 9.28 (p.210) concludes −4d_C ≤ (K_X + Δ)·C < 0 from Lemma 9.29, whose bound is also non-strict (−4d ≤ (K_X + B)·Γ < 0). Every other statement of the length bound in the paper (pp.74, 96, 188, 194, 206–209) is non-strict, and no consumer uses strictness. Checked on the page image. Noted by the extraction (gap-cone-length).

**Independent verdict:** confirmed. Confirmed as a consistency misprint, not as a proved counterexample to a possible stronger bound. Compared published Theorem I p.74, Theorem 9.28(c) p.206, Lemma 9.29 p.206 and the proof p.210; all supporting bounds use ≤. v2 Theorem 9.27 p.102 and v3 Theorem 9.28 p.113 retain the strict sign, and v3 p.117 proves only the non-strict bound. Corrected the locator to include the v2 numbering.

**Existing correction:** new.

## E5 — misprint; affects nothing

**Locator:** Theorem 10.6, definition of β(1), p.216 of the published version (also arXiv v3); compare Theorem K, p.76, and the proof, pp.218–219.

**Printed:** "β(v) = 393 if v = 1, 213v + 48 if v ≥ 2"

**Correction:** β(1) = 373, as in Theorem K ("f(v) = 373 if v = 1"). The printed 393 gives a weaker statement, which the corrected one implies.

**Check:** The proof uses β(v) only through conditions (b), p ≥ d + 4, and (c), p > deg D, for primes p > β(v). For v = 1 it computes the fibre canonical degree (K + 10K)·10K = 110 ≤ 373 − 4. It computes the discriminant degree 3L² + 2L·K + c₂ with L = 10K as 319K² + 12χ ≤ 325K² + 48 = 373, using c₂ = 12χ − K² and the Noether bound χ ≤ (K² + 6)/2 + 1. Both conditions hold for every prime p > 373. Checked on the page images. Noted by the extraction (gap-moduli-bound).

**Independent verdict:** confirmed. Confirmed. Read published Theorem K p.76, Theorem 10.6 p.216 and proof pp.218–219, and v3 p.122. Recomputed 3(10K)²+2(10K)K+c₂=319v+12χ≤325v+48, giving 373 at v=1; the fibre degree is 110. For L=8K the corresponding coefficient is 213. The literal 393 statement is weaker, not false.

**Existing correction:** new.

## E6 — error; affects a stated result

**Locator:** Theorem 2.13 and Proposition 2.14, p.85 of the published version.

**Printed:** "... and let T be a subscheme of X. Then there exists a proper birational morphism g: Y → X from a regular scheme Y such that both g^{−1}(T) and Ex(g) are divisors and Supp(g^{−1}(T) ∪ Ex(g)) is simple normal crossing."

**Correction:** T must be a closed subscheme containing no irreducible component of X, that is, nowhere dense.

**Check:** For T = X, or for T containing a component of X, g^{−1}(T) contains a component of Y and is not a divisor. Every application in the paper uses a nowhere-dense T: log resolutions of pairs (T the support of the boundary), and inside the proof of Proposition 2.14 the union of the nowhere-dense blow-up centre Z with g′^{−1}(T) ∪ Ex(g′). Noted by the extraction (gap-resolution-centres). (cc-442dc5) Reclassified to affect a stated result: as printed, Theorem 2.13 and Proposition 2.14 are false for T = X (then g^{−1}(T) = Y is not a divisor), so the stated results need the hypothesis; every application in the paper uses a nowhere-dense centre, so the main results are unaffected.

**Independent verdict:** confirmed. Confirmed. The page image p.85 quantifies over an arbitrary subscheme T. Taking T=X, for example X=A³ over a field, forces its inverse image to be all of Y, which cannot be a divisor. Add closed and nowhere dense. Read the resolution proof pp.85–86 and its boundary/centre use; this review does not claim a new proof of the cited resolution theorems. Retain stated-result reach.

**Existing correction:** new.

## E7 — error; affects a stated result

**Locator:** Definition 2.19, p.88 of the published version.

**Printed:** "coeff_E Fix(D) = min_{D′ ∈ |D|} coeff_E D′. Note that as D is Cartier the above coefficients are integers and hence the minimum exists."

**Correction:** The minimum exists only when |D| ≠ ∅, so the definition needs that hypothesis.

**Check:** For D = O(−1) on P¹, |D| = ∅ and the minimum is over the empty set. Every use of Mob and Fix is in §8, on schemes Y and S′ that are projective and birational over the affine base Z = Spec R or over f(S). There H⁰(O(D)) = H⁰(g_*O(D)) ≠ 0 for every Cartier D, since g_*O(D) is a nonzero torsion-free coherent sheaf on an affine integral scheme. In addition, Setting 8.5 chooses K_X + S + B effective. Noted by the extraction (gap-empty-system).

**Independent verdict:** confirmed. Confirmed; changed reach from nothing to a stated result, because the printed assertion that the minimum exists is false on its advertised domain. Published Definition 2.19 p.88 allows arbitrary Cartier D. The empty system of O_P¹(−1) is a counterexample. For a proper birational map to an integral affine base, the pushforward of O(D) has rank one, hence nonzero global sections; this explains the uses in §8. The nonempty hypothesis repairs the definition without a claim against those applications.

**Existing correction:** new.

## E8 — gap; affects the proof

**Locator:** Published version, proof of Lemma 4.20, p.122 (final step).

**Printed:** Hence the map κ is an isomorphism (Lemma 2.36)

**Correction:** Use the following stronger form of Lemma 2.36: for a proper birational f:Y→X of normal integral Noetherian schemes, let D_X be a Q-Cartier integral Weil divisor and D_Y an integral Weil divisor with f_*D_Y=D_X and D_Y≥floor(f*D_X). Then f_*O_Y(D_Y)=O_X(D_X); D_Y need not be Q-Cartier. Apply this to D_X=ceil(L), D_Y=ceil(π*L+A_Y).

**Check:** The target divisor in Lemma 4.20 need not be Q-Cartier because Y is only normal. The stronger form is proved by sections as rational functions: if div(g)+D_X≥0, pullback gives div(g)+f*D_X≥0, and integrality gives div(g)+floor(f*D_X)=floor(div(g)+f*D_X)≥0. Thus D_Y≥floor(f*D_X) gives a section upstairs. Conversely push the effective divisor div(g)+D_Y down; normality identifies the resulting sections with O_X(D_X). The ceiling inequality on published p.122 is precisely equivalent to the floor bound, not to the stronger D_Y≥f*D_X. This fills a missing hypothesis adapter, so it affects the proof but supplies no counterexample to the result.

**Independent verdict:** confirmed. Confirmed after fixing the proposed repair and changing kind from error to gap. Published Lemma 2.36 p.94 assumes both divisors Q-Cartier, while pp.121–122 only give a normal Y. No counterexample to Lemma 4.20 is asserted. The stronger valid lemma allows an integral Weil D_Y but still requires f_*D_Y=D_X and D_Y≥floor(f*D_X). The old reason incorrectly replaced that by D_Y≥f*D_X, which the ceiling inequality on p.122 does not imply. The corrected section argument retains floor throughout.

**Existing correction:** new.

## E9 — error; affects the proof

**Locator:** Published proof of Lemma 2.56, p.102, case C≠E meeting E; arXiv v2 p.26 and v3 p.29 (v1 p.21 even prints equality at this step).

**Printed:** γE·C + Λ·π_*C ≥ γE·C − δ|D·π_*C|

**Correction:** Write D=Σ_j d_jD_j with prime D_j and d_j≥0. For each exceptional curve C_i on Y use B_i=Σ_j d_j|D_j·C_i|, so Λ·C_i≥−δB_i. Replace |D·π_*C| by B_i. Choose δ<γ/(1+max_i B_i). This supplies the uniform lower bound in E1.

**Check:** Coefficient inequalities do not bound intersection numbers by the absolute value of the sum when component intersections cancel. On Y=Bl_0 A² in characteristic p, let E be exceptional and D_x the strict transform of the x=0 axis. Set D=E+D_x, Λ=δE. Then −δD≤Λ≤δD but D·E=−1+1=0 and Λ·E=−δ<0. Take M the sum of the two strict axes and A=M+δE, so A∼_Q−(2−δ)E is relatively ample for rational 0<δ<2; all the lemma hypotheses hold. Blow up a point of E∩M and take C=E′. Thus the displayed inequality itself fails. For the repair, the coefficient condition forces D effective and |λ_j|≤δd_j. The triangle inequality gives the B_i bound. There are finitely many exceptional curves C_i on Y. In the proof case meeting the new exceptional curve, E_new·C≥1, so γE_new·C−δB_i>0 uniformly. The other cases use (k−γ)>0 and nefness of A. Published p.102 and both later preprints were checked; the lower-bound result survives this repair.

**Independent verdict:** confirmed. Added by the independent review. Coefficient inequalities do not bound intersection numbers by the absolute value of the sum when component intersections cancel. On Y=Bl_0 A² in characteristic p, let E be exceptional and D_x the strict transform of the x=0 axis. Set D=E+D_x, Λ=δE. Then −δD≤Λ≤δD but D·E=−1+1=0 and Λ·E=−δ<0. Take M the sum of the two strict axes and A=M+δE, so A∼_Q−(2−δ)E is relatively ample for rational 0<δ<2; all the lemma hypotheses hold. Blow up a point of E∩M and take C=E′. Thus the displayed inequality itself fails. For the repair, the coefficient condition forces D effective and |λ_j|≤δd_j. The triangle inequality gives the B_i bound. There are finitely many exceptional curves C_i on Y. In the proof case meeting the new exceptional curve, E_new·C≥1, so γE_new·C−δB_i>0 uniformly. The other cases use (k−γ)>0 and nefness of A. Published p.102 and both later preprints were checked; the lower-bound result survives this repair.

**Existing correction:** new.

## E10 — misprint; affects nothing

**Locator:** Published Proposition 2.52, p.99, displayed adjunction formula; arXiv v3 Proposition 2.52, p.27.

**Printed:** (K_X+S+B)|_Z ∼_R K_T+C+M+F+B_Z

**Correction:** Replace K_T by K_Z in this equality of divisor classes on Z.

**Check:** The divisors C,M,F,B_Z and the restricted left side live on Z, whereas T is the base. The proof on the same page explicitly obtains K_{S^ν}|_Z=K_Z+M+F; substituting this into its preceding adjunction equality gives K_Z, with C pulled back and B_Z the boundary on Z. Viewed published p.99 and compared v3 p.27. This is a subscript slip, not a failure of the adjunction argument.

**Independent verdict:** confirmed. Added by the independent review. The divisors C,M,F,B_Z and the restricted left side live on Z, whereas T is the base. The proof on the same page explicitly obtains K_{S^ν}|_Z=K_Z+M+F; substituting this into its preceding adjunction equality gives K_Z, with C pulled back and B_Z the boundary on Z. Viewed published p.99 and compared v3 p.27. This is a subscript slip, not a failure of the adjunction argument.

**Existing correction:** new.

## E11 — gap; affects the proof

**Locator:** arXiv v1 Lemma 4.25 and its proof, p.36; the acknowledged replacement is published §4.3.1 p.127 and arXiv v2 §4.3.1 pp.44–45.

**Printed:** “Hence a simple spectral sequence implies our desired isomorphism.”

**Correction:** Do not use the claimed sheaf/complex isomorphism from v1. Use the revised definition with the direct sum of O_{X⁺}(−S_i⁺) and the revised adjoint-section results. In the old argument, the vanishing in degree d−1 proves surjectivity only; injectivity needs control of the preceding boundary map.

**Check:** Let I=H⁰(K) and Q=H¹(K) in the old construction. The truncation triangle I→K→Q[−1] gives the exact segment H^{d−2}(RΓ_mRΓ Q)→H^d(RΓ_mRΓ I)→H^d(RΓ_mRΓ K)→H^{d−1}(RΓ_mRΓ Q), with the same twist throughout. The support bound used in v1 kills the last group, but does not kill the first group or its boundary map. Thus it does not establish the claimed isomorphism. This review confirms that proof gap, not a new counterexample to the old image statement. The authors explicitly call v1 Lemma 4.25 incorrect in v2 p.45 and published p.127, and replace the construction. It is already corrected in the published treatment and must not be registered as a new published error.

**Independent verdict:** confirmed. Added by the independent review. Let I=H⁰(K) and Q=H¹(K) in the old construction. The truncation triangle I→K→Q[−1] gives the exact segment H^{d−2}(RΓ_mRΓ Q)→H^d(RΓ_mRΓ I)→H^d(RΓ_mRΓ K)→H^{d−1}(RΓ_mRΓ Q), with the same twist throughout. The support bound used in v1 kills the last group, but does not kill the first group or its boundary map. Thus it does not establish the claimed isomorphism. This review confirms that proof gap, not a new counterexample to the old image statement. The authors explicitly call v1 Lemma 4.25 incorrect in v2 p.45 and published p.127, and replace the construction. It is already corrected in the published treatment and must not be registered as a new published error.

**Existing correction:** Already acknowledged and replaced in arXiv:2012.15801v2, §4.3.1 pp.44–45 (8 June 2021), and published §4.3.1 p.127 (2023)..
