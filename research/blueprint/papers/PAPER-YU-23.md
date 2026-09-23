# Hongjie Yu (2023): counting ℓ-adic local systems on a curve, extraction and routing

Issue [#1091](https://github.com/CBirkbeck/tauceti-explorer/issues/1091). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoint, whose report follows below as history.
- **The paper.** H. Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*, Ann. of Math. 197 (2023), 423–531.
  - arXiv v5 (18 July 2022), the author's final version, was re-fetched; its SHA-256 (9383bcde…) matches the checkpoint.
  - The 109-page journal text is not openly available. The Annals site returned HTML, and Unpaywall lists only the author's thesis.
- **Items.** The result has **154 items: 11 library, 23 planned and 120 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** The twenty-seven findings the checkpoint recorded are kept under `sourceIssues`.

## This continuation (cc-442dc5)

**Reclassified to affect nothing (verified in the text).**
- **E1.** The cuspidality condition is printed over every standard parabolic, including P = G.
- **E2.** Mellit's factor (1 − q) is printed as (1 − g).
- **E10.** Lemma 5.3.3 omits the hypothesis ϕ ≠ 0.
- **E21.** The Euler characteristic sum is printed from i = 1.
- **E27.** The pairing of the Weil numbers is printed as σ_i σ_{2g−i} = q.

Each has a clear intended form, and that form is the one used.

**Verified: E16 (affects a stated result).** For the nilpotent A = [[0, 1], [0, 0]], Lemma 6.3.2's quantity (b) is 1/2, while its quantity (c) is 0.

**Not re-verified.** The other findings, including fifteen misprints the checkpoint marks as affecting the proof, keep the checkpoint's classification. Their independent verification is the review pipeline's job.

**Items.** Corollaire 3.2.6 (J^e = A_{g,n}(q, σ) when (e, n) = 1) was added. The other two uncovered labels, Lemmas 1.6 and 1.9, belong to a cited paper.

**Gaps.**
- **S1 is unavailable.** The journal text cannot be collated.
- **S2–S8 are deferred.** They are cited suppliers, implementation work or design work.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once.
- Every gap has a status and a resolution.

## Mistakes found (`sourceIssues`)

- **E1** (misprint; affects nothing), Yu arXiv:1807.04659v5, 18 July2022: §2.3.1 p9 and §3.3.1 p18. *Printed:* P ∈ P(B) *Correction:* Restrict the cuspidal vanishing condition and the F^G cutoff test to proper parabolics P≠G.
- **E2** (misprint; affects nothing), Yu arXiv:1807.04659v5, 18 July2022: §3.2.3 p17, displayed definition of H_g,n. *Printed:* −(1−g)(1−z) Log(Omega_g) *Correction:* Use −(1−q)(1−z) Log(Omega_g).
- **E3** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: Proposition3.3.4 proof p21, convex identity and next two displays. *Printed:* Σ_(t=a)^(l−1)(t−a+1)alpha_t; a−l *Correction:* For a=N_i,b=N_(i+1), the first root sum starts at a+1 with coefficient t−a; block-internal vanishing starts at a+1; the next inequality uses b−l, not a−l.
- **E4** (gap; affects a stated result), Yu arXiv:1807.04659v5, 18 July2022: Corollary4.2.6 p27. *Printed:* c_beta: holomorphic and nonzero near S1; N(c_beta)−P(c_beta) in |z|<1 *Correction:* Also require a meromorphic extension to a neighborhood of the closed disk, with no boundary zero or pole; rational functions with that boundary condition suffice.
- **E5** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: Theorem4.2.4 proof p25, root-wall estimate. *Printed:* theta_Q(z beta_1+xi_1)=O(z^−1) *Correction:* The estimate needed in that argument is theta_Q(z beta_1+xi_1)^−1=O(z^−1), for generic xi_1 on the chosen wall.
- **E6** (error; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: §5.1.1 p29, choice of kappa. *Printed:* proj_(a_L)(kappa)≠0 ⇒ alpha(kappa)≠0 for all relative roots *Correction:* Choose kappa off the finite union of all relative-root hyperplanes for every semistandard Levi.
- **E7** (misprint; affects a stated result), Yu arXiv:1807.04659v5, 18 July2022: Proposition5.2.1 p32, type of H_Q^e. *Printed:* H_Q^e ∈ a_L^G *Correction:* H_Q^e belongs to a_(L,Z) in the affine degree −e hyperplane, not the degree-zero vector space.
- **E8** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: §5.2.2 p32 compared with §5.3.2 p39. *Printed:* rho_P(m)^−1 phi(m) ∈ pi; phi_R(nmk)=rho_R(m)^−1 phi_pi(m) *Correction:* Use R in the membership definition. Choose one inducing character s_R and write membership s_R⁻¹ phi∈pi and basis s_R phi_pi consistently. Laf97 pp281,284 supports the p32 membership text, whereas p39 uses the inverse basis. Transport operators and norms as in153; which presentation matches every printed scalar factor is still S2, not settled by inverting the p32 factor alone.
- **E9** (error; affects a stated result), Yu arXiv:1807.04659v5, 18 July2022: Yu §5.2.3 pp33–35 concerning Lafforgue1997 Theorem11 pp307–308. *Printed:* Lafforgue: Theorem11 spectral Fourier recovery *Correction:* Use Yu Theorem5.2.2 and its proof from Lafforgue's Lemma9, retaining the finite-kernel torus map and normalized fibre sum.
- **E10** (misprint; affects nothing), Yu arXiv:1807.04659v5, 18 July2022: Lemma5.3.3 p36. *Printed:* phi ∈ pi ⇒ ∃x∈G(A)^0, phi(x)≠0 *Correction:* Add phi≠0.
- **E11** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: Lemma5.3.3 proof p38. *Printed:* deg x0=−n(n−1)(g−1); x0 a^((n−1)(g−1)) *Correction:* With J_v=(-(n−1)n_v,...,0) and deg=−Σv, deg x0=+n(n−1)(g−1); multiply by a^−((n−1)(g−1)) to reach degree zero.
- **E12** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: Proposition5.3.4 proof, final paragraph p39. *Printed:* q^((g−1)ni nj) *Correction:* Use q^((1−g)ni nj), as in equation5.1.1.
- **E13** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: §5.3.3 p41, central shift and equation5.3.6. *Printed:* lambda_(L1)^e; lambda_(G1)^e *Correction:* Use lambda_(L1)^−e and lambda_(G1)^−e, matching Proposition5.1.1.
- **E14** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: Equations6.1.1–6.1.2 pp42–43. *Printed:* H0(F1⊗F2∨)=Hom(F1,F2); H2=Hom(F2,F1)∨(−1) *Correction:* The Hom arguments are reversed: H0=Hom(F2,F1), H2=Hom(F1,F2)∨(−1).
- **E15** (gap; affects a stated result), Yu arXiv:1807.04659v5, 18 July2022: Corollary6.1.2 p43, two-case statement. *Printed:* Π1 not inertially equivalent to Π2; Π1=Π2 *Correction:* Specify the good-representative assumption, or give the missing case of unequal but inertially equivalent unitary constituents.
- **E16** (error; affects a stated result), Yu arXiv:1807.04659v5, 18 July2022: Lemma6.3.2(b) p50. *Printed:* rank(A)=n−1: (product of nonzero eigenvalues)/n *Correction:* Use algebraic multiplicity: remove one zero root and multiply the remaining n−1 roots, or add that zero is a simple eigenvalue.
- **E17** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: Theorem6.4.1 proof p53, block matrix conventions. *Printed:* M=diag(y)−(x); x_i,j(s,t)=−l_i,s l_j,t(...); 1≤s≤m_i *Correction:* Use positive x_i,j(s,t)=l_i,s l_j,t[(2g−2)d_i d_j min(ν_i,ν_j)+delta_ij f_i], and index cycles by 1≤s≤alpha_i, not multiplicities m_i.
- **E18** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: Lemma6.6.2 proof p62. *Printed:* |Fix(sigma)|=1 for the induced size-d orbit *Correction:* Replace 1 by d.
- **E19** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: §6.2 p46, product following equation6.2.7. *Printed:* ∏_(s=2)^l n_beta(pi,lambda_1^(s−1))=∏_(s=2)^l lambda_1^((s−1)A) *Correction:* Include the factor (−1)^(l−1), inherited from equation6.2.6.
- **E20** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: §7.2.2 p72, divisibility threshold and p=2 definitions. *Printed:* p^(2 gcd(k)); g_i,j,s=∏_(i,j,s)(...) *Correction:* The threshold is p^(2 v_p(gcd(k)))=p^(2alpha). In the definitions of individual g_i,j,s remove the extraneous product signs.
- **E21** (misprint; affects nothing), Yu arXiv:1807.04659v5, 18 July2022: §7.3.1 p73, definition of Euler characteristic. *Printed:* chi(V)=Σ_(i=1)^(2m)(−1)^i dim H^i *Correction:* Start the sum at i=0.
- **E22** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: Lemma7.3.1 proof p74, ambient ring of Omega_g and Log Omega_g. *Printed:* Omega_g ∈ 1+T J_g Q(q,z)[T,z_i±1] *Correction:* Use formal T-adic power series, with each coefficient a Laurent polynomial in z_i; the same correction applies to Log Omega_g.
- **E23** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: Lemma7.3.1 proof p74, Gauss-lemma justification. *Printed:* J_g(q,1,z_i) has constant term 1 *Correction:* Use primitivity: the coefficient of ∏z_i is (−1)^g. The Laurent constant coefficient is (1+q)^g.
- **E24** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: LemmaA.2 proof p76. *Printed:* d_Q(lambda)=hat1_Q^e(lambda mu0)theta_Q(lambda)^−1 *Correction:* Multiply by theta_Q(lambda), rather than its inverse.
- **E25** (misprint; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: §7.2.2 pp65–66, alpha/beta list lengths. *Printed:* ∏_(j=1)^ls(1−beta_j z)/∏_(j=1)^ms(1−alpha_j z), then alpha_j indexed to ls *Correction:* Keep alpha indexed by 1..ms and beta by 1..ls throughout the binomial expansion and the independent-variable assignment, or rename both lists consistently.
- **E26** (error; affects the proof), Yu arXiv:1807.04659v5, 18 July2022: TheoremA.4 proof p78, order of a sum. *Printed:* ord(e+a)=lcm(ord(e),ord(a)) *Correction:* Only test whether e+a=0. Since 2a=0 in Z/cZ, a is zero or the unique element of order two; equality e=−a is determined by ord(e).
- **E27** (misprint; affects nothing), Yu arXiv:1807.04659v5, 18 July2022: TheoremC.1 p79, reciprocal indexing. *Printed:* sigma_i sigma_(2g−i)=q *Correction:* Use sigma_i sigma_(2g+1−i)=q, or the consistent sigma_i sigma_(i+g)=q for 1≤i≤g.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **S1** (unavailable). The 109-page journal text is not openly available (the Annals site returned HTML; Unpaywall lists only the thesis), so arXiv v5, the author's final version, is the text read. Of E1–E27, E1, E2, E10, E21 and E27 were checked and reclassified to affect nothing, and E16 was checked; independent verification of the rest is the review pipeline's job.
- **S2** (deferred). Arthur, Langlands, Moeglin–Waldspurger, LW13 and Lafforgue 1997 are cited suppliers; E8 and E9 record the operator-normalization points.
- **S3** (deferred). Nitsure, Schiffmann, Mellit and Ch15 are cited suppliers.
- **S4** (deferred). KW01, Lafforgue 2002, Deligne, Shalika, Flath, Shintani and Cogdell are cited suppliers.
- **S5** (deferred). Symbolic proof of the finite combinatorial tests and splitting of adapters are implementation work.
- **S6** (deferred). Schiffmann, Hausel, the twisted nonabelian Hodge theorem and HR08 are cited suppliers.
- **S7** (deferred). KS99, Koblitz, Kowalski, Larsen and Chavdarov are cited suppliers.
- **S8** (deferred). Ownership coordination is design work.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## PAPER-YU-23 — spectral cover and operator continuation

Status: partial. Codex, session codex-c83e7a, 2026-09-23. Refs #1091. Continues the codex-a71f92 extraction merged in #2021.

153 items: 11 library inputs, 23 planned and 119 missing; 50 definition/construction APIs with150 canonical tests; 103 theorem proof outlines; 13 routes. All141 inherited item IDs and statuses are retained. Every missing item has exactly one route. This is an extraction and planning artifact, not a formalization.

The full85-page [arXivv5](https://arxiv.org/pdf/1807.04659v5), dated18 July2022, was freshly downloaded and reread, including all proofs, Appendices A–C, index and references. Its SHA-256 is `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c`. The [publisher record](https://annals.math.princeton.edu/2023/197-2/p01) matches the title/author and identifies Annals197(2023),423–531, DOI10.4007/annals.2023.197.2.1. The109-page journal text remains uncollated; all Yu page locators here are v5 locators. This is not confirmation of journal errata.

The JSON distinguishes the prior detailed line ledger from this continuation's fresh full read. Supplementary reading remains selective: the new Lafforgue ranges are stated below; earlier Mellit opening statements, Luo–Zhu Lemma3.1 and selected Chaudouard passages are inherited provenance, not a new full read of those sources. The remaining prerequisites and S1–S8 stay open.

### Spectral continuation: the finite cover and its measure

The continuation replaces item063's unspecified operator expression with the exact all-lifts form of Yu (5.2.9)/(5.2.14). It adds items142–153, reuses three pinned library theorems, and supplies a proof plan for each remaining adapter. It does not close the original analytic trace-formula proofs. In particular the normalization issue E8 remains open in a more precise form.

Write the cycles of w on the equal-rank blocks of M as j, with length l_j and block rank d_j. Set N_j=l_j d_j. All ranks and cycle lengths are positive. In unit-circle coordinates define

```
T  = {z_(j,t) : product_(j,t) z_(j,t)^d_j = 1},
A  = {cycle-constant u_j : product_j u_j^N_j = 1},
B  = {v_(j,t) : (product_t v_(j,t))^d_j = 1 for each j},
B0 = {v_(j,t) : product_t v_(j,t) = 1 for each j}.
```

These are `Im X_M^G`, `Im X_L^G`, `Im X_M^L`, and the identity component of the latter, with L=L_w. **A and B can be disconnected.** B/B0 is the product of μ_(d_j). The group A meets every component needed to express T=A B0. One must not replace B by B0 in an all-lifts formula.

Let δ(c)=c/w⁻¹(c). On one cycle the equations δ(c)=b are solved successively from one scalar c0. Their consistency is product b_t=1; the remaining condition defining B gives an equation c0^(l d)=a, with exactly l d roots in Circle. Thus δ:B→B0 is onto and its kernel is the product of μ_(N_j), of order |X_L^L|=product N_j. Next A∩B0 is the product of μ_(l_j), of order |w|=product l_j. Here |w| is **not** the order of the permutation.

For any τ∈T choose u_j with u_j^l_j=product_t τ_(j,t). Their weighted product automatically satisfies the defining condition of A, and b=τ/a lies in B0. Consequently

```
mu_w : A × B → T,       mu_w(a,c) = a δ(c)
D = |ker mu_w| = (product l_j)(product N_j).
```

Every fibre has D points. Its outer choices `(a,b)` satisfying τ=ab number product l_j, and each b has product N_j lifts c. For w=1 the outer choice is unique, but the central kernel generally survives. For one cycle l=2,d=1 the degree is4; for l=1,d=2 it is2, although the Weyl element is the identity. These small cases expose either omitted factor.

All compact groups here carry **probability Haar**. A continuous onto homomorphism preserves those measures; its pushforward has no covering-degree factor. That fact is already `MonoidHom.measurePreserving` in pinned Mathlib. The factor D⁻¹ instead comes from the normalized transfer

`Tr_p f(y) = (1/D) sum_(p(x)=y) f(x)`.

Its pullback is the average of f over kernel translates. This proves continuity, smoothness in the Lie setting, preservation of integrals and the identity `Tr_p(g∘p)=g`. Applying character orthogonality and pointwise Fourier inversion gives

`sum_χ integral_H χ(p(x)/y) f(x) dx = Tr_p f(y)`.

This sum is absolutely convergent for smooth f. After integer-lattice coordinates identify the compact abelian Lie group with a finite group times a torus, integration by parts with `(1−Δ)^s` gives coefficient bound `C(1+4π²||k||²)^−s`; choose 2s greater than the torus dimension. Finite component characters add only a finite sum. The same proof is uniform in a compact auxiliary parameter when the required derivatives are uniformly bounded. Mathlib's `UnitAddTorus.hasSum_mFourier_series_apply_of_summable` supplies pointwise reconstruction **after** this summability adapter, and `AddChar.expect_eq_ite` supplies finite character orthogonality. The existing L² Fourier and Peter–Weyl theorems alone cannot evaluate a function at a fibre point. Tau Ceti's rapid-decay theorem for compactly supported functions on real vector spaces is a related input, not already the smooth periodic theorem used here.

### The exact operator and Fourier signs

Use τ for λ_pi, a for Yu's **λ_L**, and b for Yu's **λ^L**. The latter is in B0; a is in A. This notation avoids the superscripts lost by OCR. The stabilizer convention is `w(pi⊗τ)=pi`, as in Yu p12; the formula does not require a good representative. A good representative is imposed later in the scalar reduction.

For a fibre point `(a,c)`, set b=δ(c), τ=ab, and z=λc with λ∈A. For Q∈P(L), choose R∈P^Q(M) and put

```
R_Q(z;v) = M_(R|P)(z)^(-1) ∘ M_(R|P)(z/v),    v∈X_L^G.

F_h(λ,a,c) = lim_(μ→1 in X_L^G) Tr_(A_P,pi) [
  (sum_(Q∈P(L)) h_Q(μa) R_Q(λc;μa))
       ∘ M(w,w^(-1)c) ∘ U_τ
].
```

U_τ is multiplication by τ. It goes from A_(P,pi) to A_(P,pi⊗τ); Weyl transport then returns to A_(P,pi) by the stabilizer identity. The family operator acts last. The trace is taken only on this closed composition. For fixed parameters the spaces are the finite-dimensional spherical section spaces; the full smooth G(A)-representation is not asserted one-dimensional. No rearrangement of the three operators is justified by their notation. A two-dimensional matrix diagnostic distinguishes the two orders even at the level of trace.

The displayed Q-sum is meromorphic term by term. It is the **sum's holomorphic extension** that is evaluated at μ=1; singular summands must not be separately substituted. Independence of R and the extension use functional equations, unitary-axis regularity and adjacent-wall gluing. Lafforgue's Lemma7 proves the latter by pairing adjacent permutations along each root wall: the paired numerators agree on the wall, so their difference is divisible by its equation. This removes the wall pole; repeating over the root hyperplanes removes the product denominator. Corollary10 applies this to the entire expression before moving its contour to the unitary group.

In this notation the spectral expression is

```
J_η = sum_[(P,pi)] 1/|stab(P,pi)|
        sum_[(w,τ)∈stab(P,pi)]
          integral_(λ∈A) 1/D sum_[(a,c)∈mu_w^(-1)(τ)] F_h(λ,a,c) dλ,

h_Q(v) = hat1_Q(v η^(-1)).
```

The brackets on `(P,pi)` mean one representative per inertial class. All other sums displayed as finite fibres include **every** lift. The outer spectral summation's convergence is an analytic prerequisite, not proved by the finite kernel computation. The expression is at T=0 as in Yu's theorem. Restoring arbitrary T would also require its truncation-dependent cone functions.

Let ζ be primitive of order n and η=ζ^deg. Then

```
J_(η^k) = sum_(e mod n) ζ^(ek) J_e,
J_e     = 1/n sum_(k mod n) ζ^(-ek) J_(η^k).
```

Inserting the second expression changes h_Q to `hat1_Q^e(v)=1/n sum_k ζ^(ek)hat1_Q(vη^k)`: reindex k↦−k to reconcile the signs. The operator, its order and the fibre are unchanged. This gives Yu (5.2.14) for **all integer e**. Coprimality belongs to the later evaluation, not this finite Fourier inversion.

### What the original-source comparison establishes

Freshly read [Lafforgue1997](https://www.numdam.org/item/AST_1997__243__1_0.pdf), printed pp280–281,284–287,301–308, with images of pp281,284,302–303,306–308. This covers the relevant torus and measure definitions, the induced-space definitions, the stated Langlands properties, the cone-series/gluing steps and the Lemma9-to-Theorem11 passage. It is not a full monograph read and does not include the original Langlands proofs cited there.

On p281 Lafforgue defines A_P^Q as the **connected** subgroup generated by its real part. This differs from Yu's full X_M^L. On p306 Lemma9 retains the character factor involving the Weyl ratio, the twisting character and the contour variable. On p307 Corollary10 first extends the whole family and then permits the real contour shift to be1. On p308 Theorem11 sums over selected preimages of a finite intersection and has no explicit fibre-average coefficient. Its accompanying two observations about image and kernel do not by themselves justify the Fourier coefficient evaluation. Yu explicitly restarts from Lemma9/Corollary10, changes the degree-character contour variable and then replaces the stabilizer element by `(w⁻¹,w(τ)⁻¹)` to obtain (5.2.11). The smooth Fourier identity above then gives the all-lifts expression without a representative-choice ambiguity.

This is a comparison of both fibre conventions and operator order. It is not a claim that adding D⁻¹ to the old representative sum alone fixes every glyph of Lafforgue's theorem. E9 retains that distinction. The complete equality between the original Hermitian coefficient and the typed operator expression still imports the unitarity and functional equations and must be proved in the chosen normalization.

The fresh images also change two inherited conclusions:

- **E28 is withdrawn.** Yu p32 already prints the floor condition `m≤x`. The prior extraction misread the glyph. The original record is preserved under `withdrawnSourceIssues`, outside the live `sourceIssues` list. This is an extraction correction, not a reviewer verdict or a source erratum.
- **E8 remains an unresolved mismatch.** Yu p32 uses membership `rho_P⁻¹ phi∈pi`, whereas p39 uses the basis `rho_R⁻¹ phi_pi`. Lafforgue p284 has the same inverse-rho membership as Yu p32, and p281 defines rho through its action on unipotent Haar measures. Therefore the prior choice to reverse p32 merely to match p39 is not established by the original source. With an explicit inducing character s_R, the consistent pair is membership `s_R⁻¹ phi∈pi` and basis `s_R phi_pi`. Changing s_R to t_R multiplies sections by t_R/s_R and conjugates every operator and its norm accordingly. For s=rho,t=rho⁻¹ the transport is rho⁻². Item153 records this dictionary; identifying the convention that matches the numerical L-factors remains S2.

The conductor arithmetic is consistent with the previous E11 correction: the diagonal valuations `−(n−1)n_v,...,0`, together with degree equal to minus their sum, give `+n(n−1)(g−1)`. A central degree-one idele acts on determinant degree by n, so the correcting exponent is `−(n−1)(g−1)`. These exact sign checks do not supply the unread Whittaker uniqueness or local-value proofs. The genus-dependent unipotent Haar prefactor likewise remains tied to the original global measure comparison.

### Ownership and implementation boundary

The reviewed AUDIT14 and full AS.0–AS.6 descriptions were reread. AS.0 already owns functional analysis, AS.1/2 induction and operators, and AS.6 the regularized trace machinery. Items145–150 are shared compact-character adapters within this programme;151–152 specialize its trace formula;153 records induction-convention transport. Items142–144 are imported rather than replanned. The programme's number-field scope is not treated as a theorem for function fields: Yu and Lafforgue supply that source extension, whose analytic prerequisites remain explicit.

The proposed file `TauCeti/Automorphic/YuCounting/CharacterCover.lean` is an organizational suggestion, not an added deliverable. Export the finite-cover transfer for other spectral uses, and import the existing Haar and Fourier primitives. The three allowed deliverables contain no Lean code asserted to compile.

### Fresh library imports

- PAPER-YU-23/142: `mathlib:MonoidHom.measurePreserving` in `Mathlib/MeasureTheory/Measure/Haar/Unique.lean`, lines952–958. Statement and hypotheses read at Mathlib082e2d3.
- PAPER-YU-23/143: `mathlib:UnitAddTorus.hasSum_mFourier_series_apply_of_summable` in `Mathlib/Analysis/Fourier/AddCircleMulti.lean`, lines329–332. Statement and hypotheses read at Mathlib082e2d3.
- PAPER-YU-23/144: `mathlib:AddChar.expect_eq_ite` in `Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean`, lines33–36. Statement and hypotheses read at Mathlib082e2d3.

### Mathematical outcome and dependency structure

For a smooth proper geometrically connected curve X1/Fq, let E_n be the irreducible rank-n geometric l-adic local systems, and pair the Frobenius eigenvalues as sigma_i and q/sigma_i. Yu proves for g≥2 a universal polynomial

`P_g,n ∈ R_g = Z[z_i,t/z_i]^(S_g ⋉ (S2)^g)`

whose evaluation at `(q^k,sigma_1^k,...,sigma_g^k)` counts the classes fixed by the k-th Frobenius power. Its unique highest weighted term is `t^((g−1)n²+1)`. With

`J_g = product_i (1−z_i)(1−t/z_i)`,

one has `P_g,n = J_g Q_g,n` in the same integral admissible ring and

`Q_g,n(1,...,1) = sum_(d|n) mu(d) mu(n/d) d^(2g−3)`.

The trace has a second geometric interpretation: `J_e = P_n^e`, the unweighted count of isocline bundles, and depends only on the order of e in Z/nZ. For coprime rank/degree this joins the geometrically indecomposable and stable-Higgs counts. Genus1 is handled separately: the recurrence dividing by 2g−2 cannot be specialized there.

The extraction keeps the following chains separate:

| Chain | Inputs and outputs |
| --- | --- |
| Weil and automorphic descent | 001–021, 123–124: Frobenius-fixed geometric classes → Weil representations modulo inertial twists → stabilizer-one cuspidal count |
| Geometric trace | 022–040, 125–126, 138: truncation, shifted HN splitting, adelic bundles and automorphism weights → isocline/Higgs counts |
| Spectral trace | 047–073, 115–118, 127–130: torus fibres, regularized families, Whittaker/Haar normalizations and L-factor zeros/poles → finite cycle sums |
| Exact recurrence | 074–097: weighted trees, cofactor/block identities, cycle index and Frobenius orbit inversion → coefficient-one rank recurrence |
| Universal polynomial | 041–046, 098–114: bundle polynomial, arithmetic divisibility and cone induction → integral counting polynomial, Jacobian factor and Euler specialization |
| AppendixC | 120–122, 134–137, 140: ordinary maximal-monodromy curve + Vandermonde power sums → necessary admissible exponent cone |
| Optional representation interpretation | 099, 141: existing split K0 and upstream classical groups → rational GSp character ring; not a premise for elementary integrality |

The JSON is the detailed item inventory, including corrected mathematical statements, proof sketches, definition APIs/tests, uses and the acyclic dependency graph. Some imported statements are deliberately marked incomplete: item123's KW01 input and the original analytic prerequisites of item063 (whose operator formula is now explicit). The existence of a proof outline is not proof closure.

### Retained library inputs at the pinned commits

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. The following eight library records and other-route audit notes are retained from the previous extraction; fresh spectral/library checks are recorded above. The current publication guard is `a4ad60cd4c77d372c695eee0d6ef7bb5fa1b8279`.

- 007: `tauceti:TauCeti.Divisor.finite_ker_degreeClass` — `TauCeti/FieldTheory/FunctionField/RiemannRoch/ClassNumber.lean`, lines143. Read finite_ker_degreeClass including finite constant-field and IsFunctionField parameters.
- 008: `tauceti:TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`, `tauceti:TauCeti.degree_weilDifferentialDivisor` — `TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.lean`, lines375,394. Read the Weil differential Riemann–Roch theorem and degree theorem with exact constants/nonzero differential.
- 043: `mathlib:Nat.Partition` — `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean`, lines57. Read Nat.Partition: positive multiset parts with prescribed sum. The S_i statistics are not covered by this carrier.
- 074: `mathlib:SimpleGraph.IsTree`, `mathlib:SimpleGraph.isTree_iff_existsUnique_path` — `Mathlib/Combinatorics/SimpleGraph/Acyclic.lean`, lines60,243. Read IsTree and the nonempty unique-path characterization.
- 081: `mathlib:Matrix.det_one_sub_mul_comm` — `Mathlib/LinearAlgebra/Matrix/SchurComplement.lean`, lines412. Read rectangular det(1−AB)=det(1−BA), finite decidable index types and commutative coefficient ring.
- 092: `mathlib:ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq` — `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`, lines206. Read the additive-group divisor-antidiagonal Mobius inversion statement, including positivity.
- 140: `mathlib:Matrix.det_vandermonde`, `mathlib:Matrix.det_vandermonde_ne_zero_iff` — `Mathlib/LinearAlgebra/Vandermonde.lean`, lines219,233. Read the determinant product and injectivity/nonzero equivalence over a domain.
- 141: `tauceti:TauCeti.repRing`, `tauceti:TauCeti.repRingCharacter`, `tauceti:TauCeti.repRingCharacter_of` — `TauCeti/RepresentationTheory/RepresentationRing/Basic.lean`, lines106,128,135. Read split K0 carrier, character ring homomorphism and class evaluation. Also read RepresentationRing/Injective.lean: its injectivity requires Finite G and CharZero k; no GSp specialization.

The partition and graph statuses mean their carriers exist, not that the paper's statistics or weighted matrix-tree theorem are already implemented. The rectangular determinant identity avoids assuming diagonalizability; it does not supply the singular cofactor identity. Split representation rings already exist, but their finite-group character-injectivity theorem is not a GSp theorem.

Read relevant AUDIT20 entries for FA.1/FA.2/FA.4/FA.6 and GS.0/GS.6; AUDIT14 AS.1/AS.2/AS.3/AS.4/AS.6 and AL.3; AUDIT18 DWP.0/DWP.1/DWP.7, EDC.2:pairings and CA.2/CA.3; AUDIT15 QM.0; AUDIT01 SF.3 and R09.4/R09.5; AUDIT19 WC.1 and WC.5:power-sum-converse. These distinguish existing divisors, partitions, binomial and determinant primitives from absent spectral/geometric targets. ET.2b and the classical-group stage IDs have no reviewed entry in this snapshot; no negative audit is inferred from that absence.

### Retained routing decisions

#### Route 1: FunctionFieldArithmetic

Type: source. Items: 001, 009, 011, 012, 013, 064.

Yu supplies the unramified function-field specialization, exact degree/Haar conventions and the degree-zero spherical nonvanishing test inside existing arithmetic and automorphic layers. Import the pinned divisor results; do not duplicate the upstream curve/function-field dictionary.

Existing layers: `FunctionFieldArithmetic:FA.0`, `FunctionFieldArithmetic:FA.1`, `FunctionFieldArithmetic:FA.2`, `FunctionFieldArithmetic:FA.4`, `FunctionFieldArithmetic:FA.6`.

#### Route 2: GlobalShtukasAndFunctionFieldLanglands

Type: source. Items: 014, 026, 033, 126.

Reuse the global bundle and full GL_n correspondence owners. The shifted HN and adelic orbit-mass interfaces are source additions inside GS.0, not a second shtuka or Langlands programme.

Existing layers: `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `GlobalShtukasAndFunctionFieldLanglands:GS.6`.

#### Route 3: AutomorphicSpectralTheory

Type: source. Items: 010, 017, 018, 019, 020, 021, 022, 023, 024, 025, 038, 039, 047, 048, 049, 050, 051, 052, 053, 054, 055, 056, 058, 059, 060, 061, 062, 063, 065, 066, 115, 116, 117.

The existing spectral programme owns truncation, induced sections, residual spectrum, regularized families and the trace formula. Yu adds explicit finite-field degree lattices, finite torus fibres, spherical scalar normalizations and degree-cutoff formulas. Keep these as source contributions, including the corrected Lafforgue formula.

Existing layers: `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`, `AutomorphicSpectralTheory:AS.3`, `AutomorphicSpectralTheory:AS.4`, `AutomorphicSpectralTheory:AS.6`.

#### Route 4: AutomorphicLFunctionsAndLocalFactors

Type: source. Items: 057, 068, 069, 127, 128, 130.

Whittaker normalization and unramified Rankin–Selberg product, pole and functional-equation calculations belong to the existing Rankin–Selberg layer. Import Langlands and cohomological weights/duality, preserving residual-segment and inertial-equivalence hypotheses.

Existing layers: `AutomorphicLFunctionsAndLocalFactors:AL.3`.

#### Route 5: DeligneWeightsAndPurity

Type: source. Items: 041, 042.

The curve Weil-eigenvalue and pure lisse-coefficient input is already planned here. The Euler determinant formula and duality are imports from WeilConjectures:WC.1 and EtaleDualityAndPerverseSheaves:EDC.2:pairings, not new weight theorems.

Existing layers: `DeligneWeightsAndPurity:DWP.0`, `DeligneWeightsAndPurity:DWP.1`, `DeligneWeightsAndPurity:DWP.7`.

#### Route 6: EndoscopicTransferAndUnitaryTraceComparison

Type: source. Items: 035.

Reuse the Hitchin/Higgs carrier already in the geometric fundamental-lemma layer. Its good-characteristic and sufficiently positive setup is not the all-characteristic coprime stable GL_n moduli theorem; item036 remains an additional endpoint in the counting extension. No reviewed ET.2b audit entry was found.

Existing layers: `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`.

#### Route 7: QSeriesPartitionsAndMockModularForms

Type: source. Items: 044, 086, 087, 090, 094, 102, 106, 107.

Formal coefficientwise series, partition cycle indices, plethystic operations and generalized-binomial coefficient manipulations belong in the existing formal q-series layer. Export them over general characteristic-zero coefficient rings and integral subrings, without introducing analytic convergence assumptions.

Existing layers: `QSeriesPartitionsAndMockModularForms:QM.0`.

#### Route 8: ClassicalArithmeticCompletion

Type: source. Items: 103, 104, 105.

The binomial divisibility and p-free factorial congruences support arithmetic generating functions already in CA.2. Reuse existing binomial arithmetic; the exact Luo–Zhu congruence and its exceptional 2-adic case are the added source lemmas.

Existing layers: `ClassicalArithmeticCompletion:CA.2`.

#### Route 9: SchemeAndStackFoundations

Type: source. Items: 125.

Import coherent Serre duality through SF.3 and its upstream JacobianChallenge Layer B supplier. The function-field Riemann–Roch theorem does not establish duality for arbitrary vector bundles on the scheme. No new Serre-duality programme is proposed.

Existing layers: `SchemeAndStackFoundations:SF.3`.

#### Route 10: EtaleDualityAndPerverseSheaves

Type: source. Items: 129.

The tensor H0/H2 calculation is an application of the existing smooth-proper perfect-pairing interface, with corrected Hom directions and Frobenius conventions.

Existing layers: `EtaleDualityAndPerverseSheaves:EDC.2:pairings`.

#### Route 11: WeilConjectures

Type: source. Items: 120.

The nonarchimedean negative-power-sum obstruction is a companion specialization of the existing independent finite-spectrum lemma. Reuse the pinned Vandermonde determinant instead of proposing a new exponential-sum owner.

Existing layers: `WeilConjectures:WC.5:power-sum-converse`.

#### Route 12: GlobalShtukasAndFunctionFieldLanglandsCountingPartII

Type: part-ii. Items: 002, 003, 004, 005, 006, 015, 016, 027, 028, 029, 030, 031, 032, 034, 036, 037, 040, 045, 046, 067, 070, 071, 072, 073, 075, 076, 077, 078, 079, 080, 082, 083, 084, 085, 088, 089, 091, 093, 095, 096, 097, 098, 100, 101, 108, 109, 110, 111, 112, 113, 114, 118, 119, 121, 122, 123, 124, 131, 132, 133, 134, 135, 136, 137, 138, 139.

The existing GS programme constructs bundles, shtukas and Langlands, but not Yu's exact Frobenius-fixed counts, recurrence, integral universal polynomial, Jacobian quotient or degree independence. These require new counting layers after the existing correspondence, not a replacement correspondence.

Design brief: Final targets are Yu Theorem1.1: for g≥2 and n≥1 the Frobenius-fixed irreducible rank-n geometric local-system count is P_g,n(q^k,sigma_1^k,...,sigma_g^k), for a unique P_g,n in R_g=Z[z_i,t/z_i]^W. Its unique top-weight term is t^((g−1)n²+1); P_g,n=J_g Q_g,n with J_g=product_i(1−z_i)(1−t/z_i), Q_g,n in R_g and Q_g,n(1)=sum_(d|n)mu(d)mu(n/d)d^(2g−3). Prove Theorem1.3 J_e=P_n^e and Theorem1.4 dependence only on the order of e modulo n, the coprime Higgs comparison, and AppendixC's necessary exponent cone in every characteristic. Build, in order: Weil descent and twist stabilizers; isocline bundles and the geometric trace; the coprime stable GL_n coarse-moduli/mass adapter; finite spectral character sums; one reusable weighted matrix-tree/cofactor module and its cycle-block specialization; cuspidal orbit inversion and the exact recurrence097; universal Laurent polynomials and integral/Jacobian/Euler consequences. Import Function-field arithmetic (FunctionFieldArithmetic), Global shtukas and Langlands over function fields (GlobalShtukasAndFunctionFieldLanglands), Automorphic spectral theory (AutomorphicSpectralTheory), Automorphic L-functions and local factors (AutomorphicLFunctionsAndLocalFactors), Deligne weights and purity (DeligneWeightsAndPurity), Etale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves), Q-series, partitions and mock modular forms (QSeriesPartitionsAndMockModularForms), Classical arithmetic completion (ClassicalArithmeticCompletion), and the scheme curve suppliers through SchemeAndStackFoundations. Reuse Hitchin carriers from EndoscopicTransferAndUnitaryTraceComparison:ET.2b, coordinate with the GWZ20-B endoscopic Part II, and consume ClassicalGroupsPartII's GSp character interpretation as optional explanatory infrastructure, not as a circular premise for polynomial integrality. Use Mathlib partition/graph/matrix/Mobius/Vandermonde primitives and Tau Ceti divisor/split-K0 results. Do not rebuild any upstream roadmap. Resolve S1–S8, especially exact spectral operators and external Higgs/monodromy proofs, before claiming the design has no gaps.

#### Route 13: ClassicalGroupsPartII

Type: part-ii. Items: 099.

Yu's Remark7.1.1 needs rational algebraic GSp over Q and the tensor-generated integral character subring; the upstream classical-group roadmap treats classical highest weights and characters, mostly over C, and is imported rather than replanned.

Design brief: Prove that restriction of rational algebraic representations of the split group GSp_2g to its diagonal torus identifies the representation ring with Z[t±1,z_i±1]^(S_g⋉(S2)^g), where a reciprocal swap sends z_i to t/z_i. Identify the tensor-generated subring of the standard representation with Z[z_i,t/z_i]^W, generated by t and the fundamental exterior expressions ∧^k V−t∧^(k−2)V, 1≤k≤g, with negative exterior degree interpreted as zero. Import Finite-dimensional representations of the classical groups (tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups), especially Layers0,3,4, its reductive-group and highest-weight suppliers, and the existing TauCeti.SplitK0/TauCeti.repRing infrastructure. Supply the central-similitude weight lattice, rational-versus-complex base-change/descent, the correct algebraic representation category, character restriction/injectivity, and the integral tensor-generation argument. Do not apply the finite-group repRingCharacter_injective theorem to GSp(Q), or construct a second split Grothendieck ring. Accept rank-one GSp2=GL2, standard exterior-square multiplier and reciprocal-swap invariance as tests. The counting extension imports this interpretation without depending on it for its elementary cone definition.

These routes do not recreate the upstream JacobianChallenge, classical-group, curve or representation-ring programmes. The counting extension owns the new application, while reusable analytical/arithmetic lemmas go to existing proposed layers. No other extracted paper was found owning Yu's exact recurrence. The existing GWZ20-B endoscopic Part II has a different endpoint; shared Hitchin carriers need coordination, not duplication.

The retained AutomorphicSpectralTheory route additionally imports142–144 and owns145–153 as detailed above. AS.0 is now included among its source stages. The other12 routes and the two Part II briefs are unchanged.

### Active source findings and the withdrawn extraction mistake

E1–E27 are candidate findings in the version read, with no independent-review verdict. E8 and E9 were refined by the fresh original-source comparison. E28 is archived outside this list because the source already prints≤. No author was contacted.

#### E1 — misprint; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: §2.3.1 p9 and §3.3.1 p18.

Printed: `P ∈ P(B)`.

Correction: Restrict the cuspidal vanishing condition and the F^G cutoff test to proper parabolics P≠G.

Reason: For P=G the unipotent quotient is a point and the constant term is phi itself; hat-tau_G=1 would also kill the cutoff. GL_1 gives an immediate counterexample.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E2 — misprint; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: §3.2.3 p17, displayed definition of H_g,n.

Printed: `−(1−g)(1−z) Log(Omega_g)`.

Correction: Use −(1−q)(1−z) Log(Omega_g).

Reason: The rank-one Young-diagram term has denominator (z−1)(1−q); the corrected prefactor gives the Jacobian factor. The printed prefactor gives (1−g)/(1−q) times that factor and vanishes for g=1. Image checked; Mellit's published Theorem1.1 independently confirms q.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E3 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Proposition3.3.4 proof p21, convex identity and next two displays.

Printed: `Σ_(t=a)^(l−1)(t−a+1)alpha_t; a−l`.

Correction: For a=N_i,b=N_(i+1), the first root sum starts at a+1 with coefficient t−a; block-internal vanishing starts at a+1; the next inequality uses b−l, not a−l.

Reason: The corrected identity is (b−l)omega_a+(l−a)omega_b−(b−a)omega_l=−(b−l)Σ_(a<t<l)(t−a)alpha_t−(l−a)Σ_(l≤t<b)(b−t)alpha_t. For n=3,a=1,l=2,b=3 the left side is −alpha_2, not −alpha_1−alpha_2. All three slips image checked.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E4 — gap; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: Corollary4.2.6 p27.

Printed: `c_beta: holomorphic and nonzero near S1; N(c_beta)−P(c_beta) in |z|<1`.

Correction: Also require a meromorphic extension to a neighborhood of the closed disk, with no boundary zero or pole; rational functions with that boundary condition suffice.

Reason: Annular holomorphy does not define the interior divisor. For example z exp(1/z) is nonzero on an annulus but has an essential singularity at zero. The later rational L-factor application is repaired by specifying its extension.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E5 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Theorem4.2.4 proof p25, root-wall estimate.

Printed: `theta_Q(z beta_1+xi_1)=O(z^−1)`.

Correction: The estimate needed in that argument is theta_Q(z beta_1+xi_1)^−1=O(z^−1), for generic xi_1 on the chosen wall.

Reason: The printed upper bound for theta itself is true but does not control its reciprocal. At most one denominator factor vanishes on a generic wall, so the reciprocal has at most a simple pole, which is what kills the higher-derivative coefficient.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E6 — error; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: §5.1.1 p29, choice of kappa.

Printed: `proj_(a_L)(kappa)≠0 ⇒ alpha(kappa)≠0 for all relative roots`.

Correction: Choose kappa off the finite union of all relative-root hyperplanes for every semistandard Levi.

Reason: Image checked. kappa=(3,2,1) is in the positive chamber and every Levi projection is nonzero, but the blocks {1,3}|{2} have equal averages 2, so their relative root evaluates to zero.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E7 — misprint; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: Proposition5.2.1 p32, type of H_Q^e.

Printed: `H_Q^e ∈ a_L^G`.

Correction: H_Q^e belongs to a_(L,Z) in the affine degree −e hyperplane, not the degree-zero vector space.

Reason: The floor differences telescope to −e. With one block and e=1, H=−1 while a_G^G=0. Image checked; 119 exact small floor checks corroborate the sign.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E8 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: §5.2.2 p32 compared with §5.3.2 p39.

Printed: `rho_P(m)^−1 phi(m) ∈ pi; phi_R(nmk)=rho_R(m)^−1 phi_pi(m)`.

Correction: Use R in the membership definition. Choose one inducing character s_R and write membership s_R⁻¹ phi∈pi and basis s_R phi_pi consistently. Laf97 pp281,284 supports the p32 membership text, whereas p39 uses the inverse basis. Transport operators and norms as in153; which presentation matches every printed scalar factor is still S2, not settled by inverting the p32 factor alone.

Reason: For the same rho_R, the two Yu displays are algebraically inconsistent already for R=P. Fresh images show Laf97 p284 also has rho_P⁻¹ phi∈pi and p281 defines rho through its action on Haar measures. This invalidates the earlier inference that the p32 formula alone should be reversed. The mismatch remains a candidate source issue; the correct global convention requires a complete dictionary.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E9 — error; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: Yu §5.2.3 pp33–35 concerning Lafforgue1997 Theorem11 pp307–308.

Printed: `Lafforgue: Theorem11 spectral Fourier recovery`.

Correction: Use Yu Theorem5.2.2 and its proof from Lafforgue's Lemma9, retaining the finite-kernel torus map and normalized fibre sum.

Reason: Yu explicitly identifies errors in the recovery of the spectral expression. Lafforgue pp306–308 were inspected; their OCR corrupts operators, so this record does not pretend to identify every glyph-level change. Yu reconstructs the formula and the |w||X_L^L| factor from Fourier inversion. Fresh Laf97 p308 image has a sum over chosen preimages after an integral on Im A_Psigma, without an explicit fibre-average coefficient. Its A_P^Q on p281 is connected, unlike Yu’s full X_M^L. Thus one must compare representative choices as well as denominators. The continuation derives the unambiguous all-lifts convention with D=|w||X_L^L| from Lemma9/Corollary10 and does not claim that inserting one factor into Laf97 reproduces all of Yu’s corrections.

Known correction: Yu arXiv:1807.04659v5, §5.2.3, Theorem5.2.2. The bounded searches and version/review scope are recorded in JSON.

#### E10 — misprint; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: Lemma5.3.3 p36.

Printed: `phi ∈ pi ⇒ ∃x∈G(A)^0, phi(x)≠0`.

Correction: Add phi≠0.

Reason: The zero vector is an immediate counterexample; the proof explicitly uses nonzero phi and a nonzero Whittaker scalar.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E11 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Lemma5.3.3 proof p38.

Printed: `deg x0=−n(n−1)(g−1); x0 a^((n−1)(g−1))`.

Correction: With J_v=(-(n−1)n_v,...,0) and deg=−Σv, deg x0=+n(n−1)(g−1); multiply by a^−((n−1)(g−1)) to reach degree zero.

Reason: Sum the diagonal valuations and use deg K=2g−2. Both displayed signs were checked in the image and against §2.2.1.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E12 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Proposition5.3.4 proof, final paragraph p39.

Printed: `q^((g−1)ni nj)`.

Correction: Use q^((1−g)ni nj), as in equation5.1.1.

Reason: With product local volume(O_v)=1, the additive adelic quotient has volume q^(g−1); imposing global unipotent quotient volume one multiplies the measure by q^(1−g) in each root direction. The definition and calculation must use the same normalization.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E13 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: §5.3.3 p41, central shift and equation5.3.6.

Printed: `lambda_(L1)^e; lambda_(G1)^e`.

Correction: Use lambda_(L1)^−e and lambda_(G1)^−e, matching Proposition5.1.1.

Reason: The floor exponent has total −e and each root denominator is invariant under a central shift. Hence hat1_Q^e(mu lambda)=lambda_1^−e hat1_Q^e(mu). Image checked. The final degree-order argument is insensitive to e↦−e but intermediate identities are not.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E14 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Equations6.1.1–6.1.2 pp42–43.

Printed: `H0(F1⊗F2∨)=Hom(F1,F2); H2=Hom(F2,F1)∨(−1)`.

Correction: The Hom arguments are reversed: H0=Hom(F2,F1), H2=Hom(F1,F2)∨(−1).

Reason: Tensor-Hom identifies F1⊗F2∨ with Hom(F2,F1); Poincare duality gives the second formula. The self-pair calculation used for the pole count is unaffected.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E15 — gap; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: Corollary6.1.2 p43, two-case statement.

Printed: `Π1 not inertially equivalent to Π2; Π1=Π2`.

Correction: Specify the good-representative assumption, or give the missing case of unequal but inertially equivalent unitary constituents.

Reason: The two printed alternatives do not exhaust arbitrary pairs. The application in §6.4 uses good representatives and is covered; no failure of that application is claimed. For equal segment lengths a unitary twist rotates the poles and leaves the extra stabilizer contribution.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E16 — error; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: Lemma6.3.2(b) p50.

Printed: `rank(A)=n−1: (product of nonzero eigenvalues)/n`.

Correction: Use algebraic multiplicity: remove one zero root and multiply the remaining n−1 roots, or add that zero is a simple eigenvalue.

Reason: For A=[[0,1],[0,0]], rank=1 but det(A+tI)=t², so kappa=0; the printed product over nonzero eigenvalues is the empty product and gives 1/2. Image checked. The actual symmetric Laplacian calculations can use determinant coefficients without the false general assertion.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E17 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Theorem6.4.1 proof p53, block matrix conventions.

Printed: `M=diag(y)−(x); x_i,j(s,t)=−l_i,s l_j,t(...); 1≤s≤m_i`.

Correction: Use positive x_i,j(s,t)=l_i,s l_j,t[(2g−2)d_i d_j min(ν_i,ν_j)+delta_ij f_i], and index cycles by 1≤s≤alpha_i, not multiplicities m_i.

Reason: The same page defines x_i,j positively and the next page states x_i,j(s,t)=l_i,s l_j,t x_i,j. Negative x makes the advertised row sums nonzero. Image checked; 2,187 exact block-Laplacian specializations match the corrected formula.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E18 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Lemma6.6.2 proof p62.

Printed: `|Fix(sigma)|=1 for the induced size-d orbit`.

Correction: Replace 1 by d.

Reason: Proposition2.1.3 says induction from d distinct geometric conjugates gives twist stabilizer of order d. The conclusion D_n(d)=O_(n/d)(d) on the same page uses the corrected value.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E19 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: §6.2 p46, product following equation6.2.7.

Printed: `∏_(s=2)^l n_beta(pi,lambda_1^(s−1))=∏_(s=2)^l lambda_1^((s−1)A)`.

Correction: Include the factor (−1)^(l−1), inherited from equation6.2.6.

Reason: There is one minus sign per root factor in equation6.2.6. The first display on p47 correctly restores it, so the subsequent equation6.2.8 has the intended sign.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E20 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: §7.2.2 p72, divisibility threshold and p=2 definitions.

Printed: `p^(2 gcd(k)); g_i,j,s=∏_(i,j,s)(...)`.

Correction: The threshold is p^(2 v_p(gcd(k)))=p^(2alpha). In the definitions of individual g_i,j,s remove the extraneous product signs.

Reason: The argument immediately sets alpha=v_p(gcd k) and proves valuation at least 2alpha, not the stronger exponent 2gcd(k). The surrounding equation already takes the product of the individual g_i,j,s; repeating that product inside each factor changes the expression.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E21 — misprint; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: §7.3.1 p73, definition of Euler characteristic.

Printed: `chi(V)=Σ_(i=1)^(2m)(−1)^i dim H^i`.

Correction: Start the sum at i=0.

Reason: For a point the printed definition gives zero, whereas both the cohomological Euler characteristic and its point-count specialization are one.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E22 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Lemma7.3.1 proof p74, ambient ring of Omega_g and Log Omega_g.

Printed: `Omega_g ∈ 1+T J_g Q(q,z)[T,z_i±1]`.

Correction: Use formal T-adic power series, with each coefficient a Laurent polynomial in z_i; the same correction applies to Log Omega_g.

Reason: Omega has nonzero contributions in arbitrarily high T degrees. Coefficientwise finiteness makes the formal logarithm meaningful, but it is not a polynomial in T.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E23 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: Lemma7.3.1 proof p74, Gauss-lemma justification.

Printed: `J_g(q,1,z_i) has constant term 1`.

Correction: Use primitivity: the coefficient of ∏z_i is (−1)^g. The Laurent constant coefficient is (1+q)^g.

Reason: For g=1, J=(1−z)(1−q/z)=1+q−z−q/z. Gauss's lemma still proves integral division because a coefficient is a unit in Z[q].

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E24 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: LemmaA.2 proof p76.

Printed: `d_Q(lambda)=hat1_Q^e(lambda mu0)theta_Q(lambda)^−1`.

Correction: Multiply by theta_Q(lambda), rather than its inverse.

Reason: The family product formula writes the desired sum as Σ d_Q c_Q/theta_Q. The printed choice introduces a double pole even at mu0=1; the corrected choice is the holomorphic monomial family from LemmaA.1.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E25 — misprint; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: §7.2.2 pp65–66, alpha/beta list lengths.

Printed: `∏_(j=1)^ls(1−beta_j z)/∏_(j=1)^ms(1−alpha_j z), then alpha_j indexed to ls`.

Correction: Keep alpha indexed by 1..ms and beta by 1..ls throughout the binomial expansion and the independent-variable assignment, or rename both lists consistently.

Reason: The recurrence defines ms denominator monomials alpha and ls numerator monomials beta, but the next displayed products and assignment interchange those lengths. If ls≠ms some referenced variables are undefined. The abstract epsilon-indexed argument does not depend on either list name.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E26 — error; affects the proof

Locator: Yu arXiv:1807.04659v5, 18 July2022: TheoremA.4 proof p78, order of a sum.

Printed: `ord(e+a)=lcm(ord(e),ord(a))`.

Correction: Only test whether e+a=0. Since 2a=0 in Z/cZ, a is zero or the unique element of order two; equality e=−a is determined by ord(e).

Reason: Take c=2,e=a=1: ord(e+a)=1 but lcm(2,2)=2. These parameters occur for one cycle l=2,f=1. Image checked. The replacement proves the needed invariance; 80,100 exact degree tests pass.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

#### E27 — misprint; affects a stated result

Locator: Yu arXiv:1807.04659v5, 18 July2022: TheoremC.1 p79, reciprocal indexing.

Printed: `sigma_i sigma_(2g−i)=q`.

Correction: Use sigma_i sigma_(2g+1−i)=q, or the consistent sigma_i sigma_(i+g)=q for 1≤i≤g.

Reason: At i=g the printed formula forces sigma_g²=q, incompatible with the ordinary eigenvalues used in the proof. Image checked.

Known correction: new. The bounded searches and version/review scope are recorded in JSON.

### Verification and reproducible diagnostics

The paper schema and three-file intake checks passed. The continuation passed1209 structural assertions and55391 exact diagnostics across54 cycle/rank configurations,162 fibres, kernel-character averages, Fourier degree signs and noncommuting operator order. The inherited110864 exact checks also reran successfully. All50 definition/construction nodes now have three canonical tests; they remain planning specifications, not executed Lean examples. No Lean file was required or compiled. These finite checks do not establish the infinite Fourier convergence or the automorphic trace formula.

New diagnostic counts: `{"kernel size": 54, "fibre size": 162, "outer pairs": 162, "A constraint": 6684, "B constraint": 12780, "cover equation": 12780, "kernel torsor": 162, "character orthogonality": 1134, "fibre character average": 1134, "transfer constant": 54, "degree orthogonality": 10100, "degree sign reindex": 10100, "ordered trace": 1, "normalization transport": 4, "conductor sign": 40, "central correction": 40}`.

Run the following with Python3; it uses only the standard library:

```python
from collections import Counter
from fractions import Fraction as F
from itertools import product
from math import prod
mathcounts={}
def mcheck(label,ok):
 assert ok,label
 mathcounts[label]=mathcounts.get(label,0)+1
def mod(x):return x%1
def fibre(data,tau):
 """Solve a+c_t-c_(t-1)=tau_t in Q/Z with the actual B constraints."""
 bycycle=[]
 for (l,d),z in zip(data,tau):
  options=[]
  for k in range(l):
   a=mod((sum(z)+k)/l);b=[mod(t-a) for t in z]
   h=[F(0)]
   for t in range(1,l):h.append(h[-1]+b[t])
   for r in range(l*d):
    c0=F(r,l*d)-sum(h)/l
    c=tuple(mod(c0+x) for x in h)
    options.append((a,c))
  bycycle.append(options)
 return [tuple(x) for x in product(*bycycle)]
cases=[((l,d),) for l in range(1,6) for d in range(1,4)]
cases += [((a,d),(b,e)) for a,b,d,e in product(range(1,4),range(1,4),range(1,3),range(1,3))]
cases += [((1,2),(2,1),(2,2)),((2,1),(2,1),(2,1)),((1,1),(1,2),(1,3))]
for data in cases:
 D=prod(l*l*d for l,d in data)
 zero=tuple(tuple(F(0) for _ in range(l)) for l,d in data)
 ker=fibre(data,zero)
 mcheck('kernel size',len(ker)==len(set(ker))==D)
 # Two deterministic target points, each constructed to satisfy the weighted T equation.
 for seed in [0,1,2]:
  tau=[list(z) for z in zero]
  if seed:
   for q,((l,d),z) in enumerate(zip(data,tau)):
    for t in range(l):z[t]=F((q+1)*(t+seed+1),7+seed)
   total=sum(d*sum(z) for (l,d),z in zip(data,tau));tau[-1][-1]-=total/data[-1][1]
  tau=tuple(tuple(mod(t) for t in z) for z in tau)
  fs=fibre(data,tau)
  mcheck('fibre size',len(fs)==len(set(fs))==D)
  mcheck('outer pairs',len({tuple(a for a,c in x) for x in fs})==prod(l for l,d in data))
  for x in fs:
   mcheck('A constraint',mod(sum(l*d*a for (l,d),(a,c) in zip(data,x)))==0)
   for (l,d),(a,c),z in zip(data,x,tau):
    mcheck('B constraint',mod(d*sum(c))==0)
    mcheck('cover equation',all(mod(a+c[t]-c[t-1])==z[t] for t in range(l)))
  # Each fibre is exactly one translate of the independently enumerated kernel.
  base=fs[0]
  translated={tuple((mod(a+u),tuple(mod(s+t) for s,t in zip(c,v))) for (a,c),(u,v) in zip(base,h)) for h in ker}
  mcheck('kernel torsor',translated==set(fs))
  # Characters on the ambient torus restrict to characters on ker. Their phase
  # multisets are uniform on a cyclic subgroup, an exact roots-of-unity sum test.
  for freq in range(7):
   def phase(x):
    return mod(sum((freq+q)*a+sum((freq*(t+1)+q+1)*v for t,v in enumerate(c)) for q,(a,c) in enumerate(x)))
   hist=Counter(phase(h) for h in ker);order=len(hist)
   mcheck('character orthogonality',set(hist)=={F(i,order) for i in range(order)} and len(set(hist.values()))==1)
   shift=phase(base); expected=Counter({mod(v+shift):n for v,n in hist.items()})
   mcheck('fibre character average',Counter(phase(x) for x in fs)==expected)
 # Normalized Haar/transfer must preserve one, including finite-only groups.
 mcheck('transfer constant',sum(F(1,D) for _ in ker)==1)
for n in range(1,25):
 for e,r in product(range(-n,n+1),range(n)):
  phases=Counter((k*(r-e))%n for k in range(n))
  distinct=len(phases)
  mcheck('degree orthogonality',len(set(phases.values()))==1 and (distinct==1)==((r-e)%n==0))
  # Reindex k -> -k converts the inverse J sign and eta^-k to hat1^e's sign.
  mcheck('degree sign reindex',Counter(((-e*k)%n,(-k)%n) for k in range(n))==Counter(((e*k)%n,k) for k in range(n)))
def mm(a,b):return tuple(tuple(sum(a[i][k]*b[k][t] for k in range(2)) for t in range(2)) for i in range(2))
def trace(a):return a[0][0]+a[1][1]
R=((1,0),(0,2));W=((0,1),(1,0));U=((1,1),(0,1))
mcheck('ordered trace',trace(mm(mm(R,W),U))==2 and trace(mm(mm(R,U),W))==1)
for rho in [F(1,2),F(1),F(2),F(3)]:
 mcheck('normalization transport',rho*rho**-2==1/rho)
for n,g in product(range(1,9),range(5)):
 degree=-(sum(-i*(2*g-2) for i in range(n)))
 mcheck('conductor sign',degree==n*(n-1)*(g-1))
 mcheck('central correction',degree+n*(-(n-1)*(g-1))==0)
print(sum(mathcounts.values()), mathcounts)
```

The earlier arithmetic suite is retained in full for reproducibility:

```python
from fractions import Fraction as F
from itertools import product, combinations
from math import gcd, prod, factorial

counts = {}
def check(label, condition):
    assert condition, label
    counts[label] = counts.get(label, 0) + 1

def divisors(n):
    return [d for d in range(1, n + 1) if n % d == 0]

def mu(n):
    ans, p = 1, 2
    while p * p <= n:
        if n % p == 0:
            n //= p
            ans = -ans
            if n % p == 0:
                return 0
        p += 1
    return -ans if n > 1 else ans

def choose(n, k):
    return prod(F(n-i, i+1) for i in range(k))

def det(a):
    a = [[F(x) for x in row] for row in a]
    ans = F(1)
    for i in range(len(a)):
        pivot = next((j for j in range(i, len(a)) if a[j][i]), None)
        if pivot is None:
            return F(0)
        if pivot != i:
            a[i], a[pivot] = a[pivot], a[i]
            ans = -ans
        x = a[i][i]
        ans *= x
        for j in range(i+1, len(a)):
            t = a[j][i] / x
            for k in range(i+1, len(a)):
                a[j][k] -= t * a[i][k]
    return ans

def cofactor(a):
    return det([r[1:] for r in a[1:]])

for l, t, L in product(range(1, 13), repeat=3):
    value = sum(mu(m) for m in range(1, L+1) if L % (m*l//gcd(l,m*t)) == 0)
    check('6.6.3 Mobius selector', value == int(L == 1 and t % l == 0))

for length in range(1, 4):
    for data in product(list(product(range(1, 5), repeat=2)), repeat=length):
        c = gcd(*(l*f for l,f in data))
        n = sum(l*f for l,f in data)
        a = sum(l*(l-1)*f//2 for l,f in data)
        value = c if (a+1) % c == 0 else 0
        rhs = sum(mu(d)*(-1)**sum(l+l//(d//gcd(d,f)) for l,f in data) for d in divisors(c))
        check('6.2.4 character Mobius identity', value == rhs)
        by_order = {}
        for e in range(n):
            v = c if (a+e) % c == 0 else 0
            order = n//gcd(n,e)
            check('A.4 degree order', by_order.setdefault(order,v) == v)

for n in range(1,5):
    edges = list(combinations(range(n),2))
    for weights in product(range(1,4), repeat=len(edges)):
        a = [[0]*n for _ in range(n)]
        for (i,j),w in zip(edges,weights):
            a[i][i] += w; a[j][j] += w
            a[i][j] -= w; a[j][i] -= w
        total = 0
        for selected in combinations(range(len(edges)),n-1):
            parent = list(range(n))
            def root(i):
                while i != parent[i]: i = parent[i]
                return i
            good = True
            for k in selected:
                i,j = edges[k]
                if root(i) == root(j): good = False; break
                parent[root(i)] = root(j)
            if good: total += prod(weights[k] for k in selected)
        check('6.3.1 weighted trees', cofactor(a) == total)

for g, d1, d2, v1, v2, f1, f2, cycles1, cycles2 in product(
    range(3), range(1,3), range(1,3), range(1,4), range(1,4),
    range(1,3), range(1,3), [(1,),(2,),(1,1)], [(1,),(2,),(1,1)]):
    if d1 % f1 or d2 % f2: continue
    data = [(d1,v1,f1,cycles1),(d2,v2,f2,cycles2)]
    chi = 2*g-2
    vertices = [(i,l) for i,(_,_,_,cs) in enumerate(data) for l in cs]
    a = [[0]*len(vertices) for _ in vertices]
    for x,(i,l) in enumerate(vertices):
        for y,(j,k) in enumerate(vertices):
            if x >= y: continue
            di,vi,fi,_ = data[i]; dj,vj,_,_ = data[j]
            w = l*k*(chi*di*dj*min(vi,vj)+(fi if i==j else 0))
            a[x][x] += w; a[y][y] += w; a[x][y] -= w; a[y][x] -= w
    av = {}
    for d,v,f,cs in data: av[v] = av.get(v,0)+d*sum(cs)
    n = sum(v*x for v,x in av.items())
    S = {v: sum(x*min(v,u) for u,x in av.items()) for v in av}
    rhs = F(prod(l for _,l in vertices)*d1*d2*chi, n*sum(av.values()))
    rhs *= prod(S[v] for _,v,_,_ in data)
    rhs *= prod((f*sum(cs)+chi*d*S[v])**(len(cs)-1) for d,v,f,cs in data)
    check('6.4.1 block Laplacian', cofactor(a) == rhs)

rows = [(a,b) for a,b in product(range(4),repeat=2) if a+b]
for row1,row2,nu1,nu2,chi,eps in product(rows,rows,range(1,3),range(2,4),[2,4],list(product([-1,1],repeat=4))):
    if nu1 >= nu2: continue
    ks = row1+row2
    av = [row1[0]+2*row1[1],row2[0]+2*row2[1]]
    S = [nu1*sum(av),nu1*av[0]+nu2*av[1]]
    common = gcd(*ks)
    total = F(0)
    for l in divisors(common):
        total += mu(l)*(-1)**(sum(ks)//l)*prod(choose(eps[j]*chi*(1+j%2)*S[j//2]//l,ks[j]//l) for j in range(4))
    check('7.2.3 restricted positive range', total.denominator == 1 and total.numerator % (chi*S[-1]*sum(av)) == 0)

check('E16 nilpotent counterexample', det([[0,1],[0,0]]) == 0 and F(1,2) != 0)
check('E26 order counterexample', 2//gcd(2,1+1) == 1 and 2//gcd(2,1) == 2)
for n in range(1,8):
    for e in range(-8,9):
        h = [(e*i)//n-(e*(i+1))//n for i in range(n)]
        check('E7 floor exponent total',sum(h) == -e)

print(counts)
print('PASS', sum(counts.values()), 'finite exact checks; these are not Lean proofs')
```

### Remaining source and implementation gates

#### S1 — Journal collation and independent verification of source issues

Read the final 109-page journal text and collate with arXivv5, not just the publisher record. Independently verify E1–E27 with images, particularly E4/E6/E8/E15/E16/E26; establish exact effect on the final printed results. No finding presently claims to be confirmed in the journal or by an independent reviewer. E28 is withdrawn as an extraction misreading (the source image already has ≤). E1–E27 remain unreviewed; E8 now records the unresolved normalization dictionary rather than preferring one inconsistent convention.

Needed by: PAPER-YU-23/001, PAPER-YU-23/002, PAPER-YU-23/003, PAPER-YU-23/004, PAPER-YU-23/005, PAPER-YU-23/006, PAPER-YU-23/007, PAPER-YU-23/008, PAPER-YU-23/009, PAPER-YU-23/010, PAPER-YU-23/011, PAPER-YU-23/012, PAPER-YU-23/013, PAPER-YU-23/014, PAPER-YU-23/015, PAPER-YU-23/016, PAPER-YU-23/017, PAPER-YU-23/018, PAPER-YU-23/019, PAPER-YU-23/020, PAPER-YU-23/021, PAPER-YU-23/022, PAPER-YU-23/023, PAPER-YU-23/024, PAPER-YU-23/025, PAPER-YU-23/026, PAPER-YU-23/027, PAPER-YU-23/028, PAPER-YU-23/029, PAPER-YU-23/030, PAPER-YU-23/031, PAPER-YU-23/032, PAPER-YU-23/033, PAPER-YU-23/034, PAPER-YU-23/035, PAPER-YU-23/036, PAPER-YU-23/037, PAPER-YU-23/038, PAPER-YU-23/039, PAPER-YU-23/040, PAPER-YU-23/041, PAPER-YU-23/042, PAPER-YU-23/043, PAPER-YU-23/044, PAPER-YU-23/045, PAPER-YU-23/046, PAPER-YU-23/047, PAPER-YU-23/048, PAPER-YU-23/049, PAPER-YU-23/050, PAPER-YU-23/051, PAPER-YU-23/052, PAPER-YU-23/053, PAPER-YU-23/054, PAPER-YU-23/055, PAPER-YU-23/056, PAPER-YU-23/057, PAPER-YU-23/058, PAPER-YU-23/059, PAPER-YU-23/060, PAPER-YU-23/061, PAPER-YU-23/062, PAPER-YU-23/063, PAPER-YU-23/064, PAPER-YU-23/065, PAPER-YU-23/066, PAPER-YU-23/067, PAPER-YU-23/068, PAPER-YU-23/069, PAPER-YU-23/070, PAPER-YU-23/071, PAPER-YU-23/072, PAPER-YU-23/073, PAPER-YU-23/074, PAPER-YU-23/075, PAPER-YU-23/076, PAPER-YU-23/077, PAPER-YU-23/078, PAPER-YU-23/079, PAPER-YU-23/080, PAPER-YU-23/081, PAPER-YU-23/082, PAPER-YU-23/083, PAPER-YU-23/084, PAPER-YU-23/085, PAPER-YU-23/086, PAPER-YU-23/087, PAPER-YU-23/088, PAPER-YU-23/089, PAPER-YU-23/090, PAPER-YU-23/091, PAPER-YU-23/092, PAPER-YU-23/093, PAPER-YU-23/094, PAPER-YU-23/095, PAPER-YU-23/096, PAPER-YU-23/097, PAPER-YU-23/098, PAPER-YU-23/099, PAPER-YU-23/100, PAPER-YU-23/101, PAPER-YU-23/102, PAPER-YU-23/103, PAPER-YU-23/104, PAPER-YU-23/105, PAPER-YU-23/106, PAPER-YU-23/107, PAPER-YU-23/108, PAPER-YU-23/109, PAPER-YU-23/110, PAPER-YU-23/111, PAPER-YU-23/112, PAPER-YU-23/113, PAPER-YU-23/114, PAPER-YU-23/115, PAPER-YU-23/116, PAPER-YU-23/117, PAPER-YU-23/118, PAPER-YU-23/119, PAPER-YU-23/120, PAPER-YU-23/121, PAPER-YU-23/122, PAPER-YU-23/123, PAPER-YU-23/124, PAPER-YU-23/125, PAPER-YU-23/126, PAPER-YU-23/127, PAPER-YU-23/128, PAPER-YU-23/129, PAPER-YU-23/130, PAPER-YU-23/131, PAPER-YU-23/132, PAPER-YU-23/133, PAPER-YU-23/134, PAPER-YU-23/135, PAPER-YU-23/136, PAPER-YU-23/137, PAPER-YU-23/138, PAPER-YU-23/139.

#### S2 — Spectral original sources and exact operator formulas

The exact all-lifts operator formula063/151, cycle-cover degree145–147, probability Haar transfer148–149 and degree inversion152 have now been written out and Laf97 pp306–308 image-collated. Remaining: prove the inducing-character dictionary153 against the numerical normalizers in066 using original local/global conventions; prove original Arthur/Langlands/Moeglin–Waldspurger/LW13 analytic inputs and their function-field specializations, uniform regularized spectral summation and contour shifts; read Ch15 HN construction and Lemmas6.2.3–6.2.6. The p32/p39 rho mismatch cannot be closed merely by choosing one printed line. Whittaker conductor and global Haar signs retain their original-source dependencies.

Needed by: PAPER-YU-23/020, PAPER-YU-23/021, PAPER-YU-23/025, PAPER-YU-23/038, PAPER-YU-23/039, PAPER-YU-23/050, PAPER-YU-23/051, PAPER-YU-23/060, PAPER-YU-23/061, PAPER-YU-23/063, PAPER-YU-23/064, PAPER-YU-23/065, PAPER-YU-23/066, PAPER-YU-23/067, PAPER-YU-23/116, PAPER-YU-23/117, PAPER-YU-23/151, PAPER-YU-23/153.

#### S3 — Bundle/Higgs and Mellit source closure

Read Nitsure Proposition7.4, the full Schiffmann bundle/Higgs and density arguments, Mellit's full proof and Ch15 Thm4.1.2. Separate existence, smoothness, rational coarse points, scalar stabilizers, stack mass and point counts. Split all multi-part imports and give exact base-field/characteristic hypotheses; ET.2b alone does not supply the all-characteristic coarse-moduli result.

Needed by: PAPER-YU-23/026, PAPER-YU-23/027, PAPER-YU-23/030, PAPER-YU-23/031, PAPER-YU-23/033, PAPER-YU-23/035, PAPER-YU-23/036, PAPER-YU-23/037, PAPER-YU-23/039, PAPER-YU-23/045, PAPER-YU-23/046, PAPER-YU-23/110, PAPER-YU-23/125, PAPER-YU-23/126, PAPER-YU-23/138.

#### S4 — Weil, Langlands, normalizer and Whittaker leaves

Read the exact KW01 Thm3.3(2) normalizer statement: item123 is only a bounded input contract and must not be treated as complete. Read relevant Lafforgue02, Deligne, Shalika, Flath, Shintani and Cogdell arguments. Split trace, Euler characteristic, purity and duality in item042. Close continuity, semisimplicity, unramified twist and conductor interfaces.

Needed by: PAPER-YU-23/003, PAPER-YU-23/005, PAPER-YU-23/006, PAPER-YU-23/013, PAPER-YU-23/014, PAPER-YU-23/016, PAPER-YU-23/040, PAPER-YU-23/042, PAPER-YU-23/057, PAPER-YU-23/068, PAPER-YU-23/123, PAPER-YU-23/124, PAPER-YU-23/127, PAPER-YU-23/128, PAPER-YU-23/129, PAPER-YU-23/130.

#### S5 — Combinatorial and integral boundary cases

Turn the exact finite tests into symbolic proof obligations. Split partition-statistics adapters off the already-built carrier. Spell out all block indices and polynomial continuation of determinant formulas. Item107 only records the positive-nu, positive-even-chi range needed for g≥2: Yu's broader zero/negative possibilities remain to be reconciled. Check generalized binomials at zero upper entries and empty products, full low-rank expansions and admissible-cone division.

Needed by: PAPER-YU-23/043, PAPER-YU-23/075, PAPER-YU-23/076, PAPER-YU-23/077, PAPER-YU-23/078, PAPER-YU-23/079, PAPER-YU-23/082, PAPER-YU-23/083, PAPER-YU-23/084, PAPER-YU-23/085, PAPER-YU-23/087, PAPER-YU-23/090, PAPER-YU-23/098, PAPER-YU-23/101, PAPER-YU-23/102, PAPER-YU-23/103, PAPER-YU-23/104, PAPER-YU-23/105, PAPER-YU-23/106, PAPER-YU-23/107, PAPER-YU-23/108, PAPER-YU-23/112, PAPER-YU-23/139.

#### S6 — Top-weight, Higgs purity and Euler characteristic sources

Read Schiffmann's leading asymptotic and AppendixB density, Hausel's Higgs purity, the exact twisted coprime nonabelian Hodge theorem and HR08 Cor1.1.1 with its quotient comparison. Item131's cohomological conventions require a complete check. No smoothness-to-purity shortcut or raw point-count division by a finite group is accepted.

Needed by: PAPER-YU-23/100, PAPER-YU-23/109, PAPER-YU-23/111, PAPER-YU-23/112, PAPER-YU-23/113, PAPER-YU-23/131, PAPER-YU-23/132, PAPER-YU-23/133.

#### S7 — AppendixC ordinary monodromy and sieve closure

Read KS99 §10.6, Koblitz75 Thm5, Kowalski06 Props1/3 and Lemmas1/2, Larsen and Chavdarov97 Thm2.1 with proof. Check the replacement of almost-all auxiliary primes by infinitely many; identify the exact Honda–Tate elliptic realization. The elementary Vandermonde proof is given, but these geometric and sieve leaves are not source-closed.

Needed by: PAPER-YU-23/120, PAPER-YU-23/121, PAPER-YU-23/122, PAPER-YU-23/134, PAPER-YU-23/135, PAPER-YU-23/136, PAPER-YU-23/137.

#### S8 — Owner adapters and shared prerequisites

Confirm generic matrix-tree ownership across new merged work; this checkpoint gives it one reusable implementation in the counting extension, not a second graph carrier. Coordinate the all-characteristic GL_n moduli bridge with ET.2b and the GWZ20-B endoscopic Part II. ClassicalGroups Part II must import the split K0 machinery and upstream highest-weight theory, then separately build rational GSp descent and the tensor-generated subring. No reviewed ClassicalGroups or ET.2b audit entry exists in this snapshot; absence is not an audited negative verdict.

Needed by: PAPER-YU-23/007, PAPER-YU-23/008, PAPER-YU-23/026, PAPER-YU-23/035, PAPER-YU-23/036, PAPER-YU-23/074, PAPER-YU-23/075, PAPER-YU-23/076, PAPER-YU-23/077, PAPER-YU-23/078, PAPER-YU-23/079, PAPER-YU-23/080, PAPER-YU-23/082, PAPER-YU-23/083, PAPER-YU-23/084, PAPER-YU-23/085, PAPER-YU-23/098, PAPER-YU-23/099, PAPER-YU-23/125, PAPER-YU-23/129, PAPER-YU-23/140, PAPER-YU-23/141.

The next worker should start with the remaining normalization/original-proof obligations in S2, then the S3 bundle/Higgs sources. Item123 is still an incomplete KW01 contract. The finite-cover and operator transcription work need not be redone; check it against the source and continue from its explicit boundaries.
